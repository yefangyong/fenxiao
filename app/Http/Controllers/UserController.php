<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Overtrue\Wechat\Auth;
use App\Http\Requests;

class UserController extends Controller
{
    //
    public function login(Request $req) {

        if($req->session()->get('user')) {
            return redirect('/');
        }

        $auth = new Auth(env('WX_ID'),env('WX_SEC'));
        $to = 'http://www.yfyjsz.cn/login';
        $user = $auth->authorize($to);
        $req->session()->put('user',$user->all());
        return back();
    }

    public function logout(Request $req) {
        $req->session()->forget('user');
        echo 'logout out';
    }

    public function index(Request $req) {
        if(!$req->session()->get('user')) {
            return redirect('/login');
        }

        echo 'index';
        dd($req->session()->get('user'));
    }
}
