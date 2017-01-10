<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableUsers extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->increments('uid');
            $table->string('openid',32)->unique();
            $table->string('name');
            $table->integer('subtime');
            $table->integer('state')->default(1);
            $table->integer('p1')->unsigned();
            $table->integer('p2')->unsigned();
            $table->integer('p3')->unsigned();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('users');
    }
}
