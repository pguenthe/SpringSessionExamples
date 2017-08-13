package com.guenther.spring2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class HomeController {

    @RequestMapping("/")
    public ModelAndView index()
    {
        ModelAndView mv = new
                ModelAndView("index");
        return mv;
    }

    @RequestMapping("/login")
    public ModelAndView login()
    {
        //if the user is already logged in,
        //let's display a message to that effect

        
        ModelAndView mv = new
                ModelAndView("login");
        return mv;
    }

    @RequestMapping("/loginsubmit")
    public ModelAndView loginsubmit (
            @RequestParam("name") String name,
            HttpSession session
    ) {
        name = name.trim();
        if (name == null || name.length() == 0) {
            return new ModelAndView("error", "errmsg",
                    "Name cannot be blank");
        }

        session.setAttribute("loginStatus", "Logged In");
        session.setAttribute("username", name);

        ModelAndView mv = new ModelAndView("loginsuccess");
        return mv;
    }
    @RequestMapping("/prefs")
    public ModelAndView prefs()
    {
        //let's prevent users from getting the preferences page
        //if they're not logged in:



        ModelAndView mv = new
                ModelAndView("preferences");
        return mv;
    }

    @RequestMapping("/prefsubmit")
    public ModelAndView prefsubmit(@RequestParam("font") String font,
                                   @RequestParam("color") String color,
                                   HttpSession session)
    {
        session.setAttribute("font", font);
        session.setAttribute("color", color);

        ModelAndView mv = new
                ModelAndView("prefsubmit");
        return mv;
    }

    @RequestMapping("/secret")
    public ModelAndView secret(HttpSession session)
    {
        if (session.getAttribute("username") == null) {
            return new ModelAndView("error", "errmsg",
                    "You must be logged in. "
                    + "Please visit the <a href=\"/login\">Login Page</a>");
        }

        ModelAndView mv = new
                ModelAndView("secret");
        mv.addObject("secret", 42);
        return mv;
    }

    @RequestMapping("/logout")
    public ModelAndView logout(HttpSession session)
    {
        //this is how we clear out the session info
        session.invalidate();

        ModelAndView mv = new
                ModelAndView("logout");
        return mv;
    }
}