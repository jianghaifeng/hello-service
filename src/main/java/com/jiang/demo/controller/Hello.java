package com.jiang.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@ConfigurationProperties(prefix = "myprops")
public class Hello {
  private String name;

  public void setName(String name) {
    this.name = name;
  }

  @GetMapping("/hello")
  String hello() {
    return "hello " + name;
  }
}
