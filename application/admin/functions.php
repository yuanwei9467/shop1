<?php
/**
 * Created by PhpStorm.
 * User: AivyYuan
 * Date: 2017/8/16
 * Time: 14:24
 */
use think\Cookie;
function get_client_ip(){
    global $ip;
    if (getenv("HTTP_CLIENT_IP"))
        $ip = getenv("HTTP_CLIENT_IP");
    else if(getenv("HTTP_X_FORWARDED_FOR"))
        $ip = getenv("HTTP_X_FORWARDED_FOR");
    else if(getenv("REMOTE_ADDR"))
        $ip = getenv("REMOTE_ADDR");
    else $ip = "Unknow";
    return $ip;
}

//获取用户地址
function get_address($ip = ''){
    $ip = empty($ip) ? get_client_ip(): $ip;

    $url = 'http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json&ip='.$ip;
    $ch = curl_init($url);
    curl_setopt($ch,CURLOPT_ENCODING ,'utf8');
    curl_setopt($ch, CURLOPT_TIMEOUT, 5);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true) ; // 获取数据返回
    $location = curl_exec($ch);
    $location = json_decode($location);
    curl_close($ch);
    $loc = "";
    if(!is_object($location)) return "";
    if (empty($location->desc)) {
        $loc = $location->province.$location->city.$location->district.$location->isp;
    }else{         $loc = $location->desc;
    }
    return $loc;
}
//获取session_id
function getSessionId(){
    return Cookie::get('PHPSESSID');
}
