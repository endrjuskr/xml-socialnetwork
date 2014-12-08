package com.workout.diary.web;

import com.workout.diary.domain.Vet;

import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "vets", formBackingObject = Vet.class)
@RequestMapping("/vets")
@Controller
public class VetController {
}
