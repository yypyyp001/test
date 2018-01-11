package com.tosit.emps.tosit.emps.action;

import com.tosit.emps.annotation.RequestPath;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RequestPath("/user")
public class UserAction {
    @RequestPath("/login")
    public String login(HttpServletRequest req,HttpServletResponse resp){
    return "okok";
    }
}
