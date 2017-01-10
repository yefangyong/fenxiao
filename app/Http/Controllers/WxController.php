<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Overtrue\Wechat\Server;
use Overtrue\Wechat\User as WxUser;
use Overtrue\Wechat\QRCode;
use App\User;

class WxController extends Controller
{

    public function __construct()
    {
        $this->middleware('verify', ['except' => 'index']);
    }

    //
    public function index() {

        // $encodingAESKey 可以为空
        $server = new Server( env('WX_ID') , env('WX_TK') );

        $server->on('event' , 'subscribe' , [$this , 'guanzhu']);
        $server->on('event' , 'unsubscribe' , [$this , 'qxgz']);

        return $server->serve();
    }

    public function guanzhu ($event) {
        // 取出粉丝的个人信息
        $wxuser = new WxUser( env('WX_ID') , env('WX_SEC') );
        $wu = $wxuser->get($event->FromUserName);
        //有记录，且状态为1
        $user = User::where('openid',$event->FromUserName)->first();
        if($user && $user->status == 1) {
            return;
        }

        if($user && $user->status == 0) {
            $user->status =1;
        }

        if(!$user) {
            $user = new User();
            $user->openid = $event->FromUserName;
            $user->name = $wu->nickname;
            $user->subtime = time();

            //再判断是否扫描的场景二维码
            if($event->EventKey) {
                $puid = substr($event->EventKey,8);
                $rows = User::find($puid);
                $user->p1 = $rows['uid'];
                $user->p2 = $rows['p1'];
                $user->p3 = $rows['p2'];
            }
        }


        $user->save();
        
        //下载二维码
        $this->qr($user->uid);

        $msg = '欢迎你,' .$wu->nickname ;
        return $msg;
    }

    public function qxgz($event) {
        $openid = $event->FromUserName;
        $user = User::where('openid' , $openid)->first();
        if($user) {
            $user->status = 0;
            $user->save();
        }
    }

    public function qr($uid) {
        // 开始生成场景二维码
        $qrcode = new QRCode(env('WX_ID') , env('WX_SEC'));
        $result = $qrcode->forever( $uid );
        $ticket = $result->ticket;
        // 下载二维码
        $qr = public_path() . $this->mkd() . '/' . 'qr_' . $uid . '.jpg' ;
        $qrcode->download($ticket,  $qr);
    }

    protected function mkd() {
        $path = date('/Y/md');
        if( !is_dir ( public_path() . $path ) ) {
            mkdir(public_path() . $path , 0777 ,true);
        }
        return $path;
    }
}

//  回调函数的调用格式
// 匿名函数
// 函数名 'time'
// 对方的方法 [对象 , 方法名]
// 静态方法 '类名::方法名'