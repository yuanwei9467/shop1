<?php
/**
 * Created by PhpStorm.
 * User: AivyYuan
 * Date: 2017/8/18
 * Time: 15:30
 */
namespace app\index\controller;

use app\admin\model\Goods;
use app\admin\model\GoodsCate;
use think\Request;

class Category extends Base{
    //搜索首页
    public function index(){
        $cate = new GoodsCate();
        print_r($cate->getCate());
    }
}