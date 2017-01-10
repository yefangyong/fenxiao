<?php

namespace App\Http\Controllers;

use App\Item;
use App\Order;
use App\User;
use Illuminate\Http\Request;
use App\Http\Requests;
use Cart;
use Illuminate\Support\Facades\DB;


class ShopController extends Controller
{
    protected $gs  = [
        1=>['goods_id'=>1,'goods_name'=>'白百合 清香宜人', 'price'=>23.1],
        2=>['goods_id'=>2,'goods_name'=>'红玫瑰 热烈奔放', 'price'=>23.2],
        3=>['goods_id'=>3,'goods_name'=>'黄牡丹 雍容华贵', 'price'=>23.3],
        4=>['goods_id'=>4,'goods_name'=>'狗尾巴 淡泊名利', 'price'=>23.4],
    ];
    //
    public function index() {
        return view('index',['gs'=>$this->gs]);
    }

    public function goods($gid) {
        $g = $this->gs[$gid];
        return view('goods',$g);
    }

    public function buy($gid) {
        // 通过数组添加
        $g = $this->gs[$gid];
        Cart::add($g['goods_id'], $g['goods_name'], $g['price'], 1, array());
        return redirect('cart');

    }

    public function cart() {
        $gs = Cart::getContent();
        $total = Cart::getTotal();
        if(!session('user')) {
            return redirect('/login');
        }
        return view('cart',['gs'=>$gs,'total'=>$total]);
    }
    public function clear(){
        Cart::clear();
        return redirect('/');
    }


    //下单
    public function done(Request $req) {
        //$user = $req->session()->get('user');
        $order = new Order();
        $order->ordsn = date('Ymd').mt_rand(10000,99999);
        $order->uid = 34;
        //$order->openid = $user['openid'];
        $order->xm = $req->xm;
        $order->address = $req->address;
        $order->tel = $req->tel;
        $order->money = Cart::getTotal();
        $order->ordtime = time();

        $order->save();//orders入库

        //开始把商品入库
        $gs = Cart::getContent();

        foreach($gs as $g) {
            $item = new Item();
            $item->oid = $order->oid;
            $item->gid = $g['id'];
            $item->goods_name = $g['name'];
            $item->num = $g['quantity'];
            $item->price = $g['price'];
            $item->save();
        }

        Cart::clear();

        return view('done',['oid'=>$order->oid]);

    }

    //支付
    public function payok(Request $req) {
        $oid = $req->oid;
        $order = Order::find($oid);
        if(!$order) {
            redirect('/');
        }
        $order->ispay = 1;

        $order->save();

        //开始分钱，上级代理50%，上上级代理30%，上上上级代理10%
        $user = User::find($order->uid);
        foreach([$user->p1=>0.5,$user->p2=>0.3,$user->p3=>0.1] as $p=>$rate) {
            if($p == 0) {
                break;
            }

            $row = [];
            $row['oid'] = $order->oid;
            $row['uid'] = $p;
            $row['byid'] = $order->uid;
            $row['money'] = $order->money*$rate;

            DB::table('fees')->insert($row);
        }

        return 'ok';
    }
}
