<?php
/**
 * Created by PhpStorm.
 * User: AivyYuan
 * Date: 2017/8/16
 * Time: 14:19
 */
namespace app\admin\model;

use think\Model;


class VisitorStats extends Model{
    public function saveRecord(){
        $referer = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] :'';
        if($row = self::get(['sessid'=>getSessionId(),'ip'=>\get_client_ip()])){
            self::inc("pv");
        }else{
            $data = ['ip'=>\get_client_ip(),
                "dateline"=>time(),
                "pv"=>1,
                "referrer"=>$referer,
                "browser"=>1,
                "area"=>\get_address(),
                "sessid"=>getSessionId()
            ];
            self::save($data);
        }
    }
}