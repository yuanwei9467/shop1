<?php
/**
 * Created by PhpStorm.
 * User: AivyYuan
 * Date: 2017/8/16
 * Time: 16:45
 */
namespace app\admin\model;


use think\Db;
use think\Model;

class Goods extends Model{
    //搜索商品
    public function search($condition = '',$limit=10,$page =1){

        $query = Db::name("goods");
        if(isset($condition['kw'])){
            $query->where("goods_name","like","%".$condition['kw']."%");
        }
        return $query->limit($limit)->select();
    }
}