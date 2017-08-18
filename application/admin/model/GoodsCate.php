<?php
/**
 * Created by PhpStorm.
 * User: AivyYuan
 * Date: 2017/8/18
 * Time: 15:20
 */
namespace app\admin\model;

use think\Model;

class GoodsCate extends Model{
    //获取首页分类
    public function getCate(){
        $cat = [];
        $parents = $this->where("parent_id","=",0)->order("seq")->select();

        foreach($parents as $key=>$value){
            $cat[$value->cate_id] = ['name'=>$value->cate_name];
            $child = $this->where("parent_id","=",$value->cate_id)->select();
            if($child){
                $child_arr = [];
                foreach($child as $k=>$v){
                    $child_arr[] = ['id'=>$v->cate_id,'name'=>$v->cate_name];
                    $cat[$value->cate_id]['child'] = $child_arr;
                }
            }

        }
        return $cat;
    }
}