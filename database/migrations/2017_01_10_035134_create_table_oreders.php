<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableOreders extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->increments('oid');
            $table->char('ordsn',15);
            $table->integer('uid');
            $table->char('openid',32);
            $table->string('xm',28);
            $table->string('address',60);
            $table->char('tel',11);
            $table->float('money',7,2);
            $table->tinyInteger('ispay')->default(0);
            $table->integer('ordtime');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('=orders');
    }
}
