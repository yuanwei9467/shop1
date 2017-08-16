<?php
/**
 * Created by PhpStorm.
 * User: AivyYuan
 * Date: 2017/8/16
 * Time: 16:17
 */
namespace app\index\controller;

use app\admin\model\Goods;
use think\Request;

class Search extends Base{
    //搜索首页
    public function index(){
        $keyword = Request::instance()->param('kw');
        $goods_model = new Goods();
        $conditions = [
            'kw'=>$keyword
        ];
        $goods_model->search($conditions = '',$limit = 10,$page=1);

    }
}