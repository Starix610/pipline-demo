package com.starix.piplinedemo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * @author shiwenjie03
 * @created 2020/8/4 4:09 下午
 **/
@RestController
public class TestController {

    @GetMapping("/test")
    public Map<String, String> test(){
        Map<String, String> map = new HashMap<>();
        map.put("username", "zhangsan");
        map.put("age", "22");
        return map;
    }

}