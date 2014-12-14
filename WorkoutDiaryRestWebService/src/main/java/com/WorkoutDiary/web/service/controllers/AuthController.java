package com.WorkoutDiary.web.service.controllers;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.WorkoutDiary.web.service.models.*;

@RestController
public class AuthController {
    @RequestMapping("/auth")
    public boolean login(@RequestParam(value="userID") String name, @RequestParam(value="authMethod") AuthMethods method) {
        return true;
    }
}
