package com.WorkoutDiary.web.service.controllers;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.WorkoutDiary.web.service.models.*;

@RestController
@RequestMapping("/service/auth") 
public class AuthController {
    @RequestMapping("/login")
    public boolean login(@RequestParam(value="userID") String name, @RequestParam(value="authMethod") AuthMethods method) {
        return true;
    }
}
