<?php
/**
 * Created by PhpStorm.
 * User: AivyYuan
 * Date: 2017/8/16
 * Time: 10:36
 */
namespace app\admin\controller;

use app\admin\model\Order;

class Main{
    public function panel(){
        $today_time = strtotime("today");
        $orders = $this->getCount("verydows_order");
        $sum_money = $this->getCount("verydows_order",array("order_status"=>2),"sum(order_amount)");
        $register_count = $this->getCount("verydows_user");
        $goods_number = $this->getCount("verydows_goods");
        $ad_numbers = $this->getCount("verydows_adv ");
        $article_numbers = $this->getCount("verydows_article");
        $today_orders = $this->getCount("verydows_order","created_date>=$today_time");
        $today_money = $this->getCount("verydows_order","order_status=2 and created_date>=$today_time","sum(order_amount)");
        $today_reg = $this->getCount("verydows_user_record","created_date>=$today_time");
        $after_sales = $this->getCount("verydows_aftersales","created_date>=$today_time");

    }
    public function getCount($model_name,$where="",$col = "count(*)"){
        $query = new \think\db\Query();
        $count = $query->table($model_name)->where($where)->column($col);
        //print_r($count);
        return $count[0];
    }
}