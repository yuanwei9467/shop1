<?php
/**
 * Created by PhpStorm.
 * User: AivyYuan
 * Date: 2017/8/16
 * Time: 10:24
 */
namespace app\index\controller;
class Main
{
    public function index()
    {
        // echo password_hash('123',PASSWORD_DEFAULT);
        echo password_verify("123",'$2y$10$Uc/XWEhn/mJUYyHyHFlkaOz9qx9nh3VXtfMARQENQrl9d6BksGqO6');
    }
    public function test1(){
        echo 'abc';
        exit;
    }

}