package com.inhatc.c;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.inhatc.mapper.ReviewMapper;
import com.inhatc.vo.Review;

@Controller
public class ReviewsController {
	
	@Autowired
    private ReviewMapper reviewMapper;
	

    @RequestMapping(value = "/reviews", method = RequestMethod.POST)
    public String create(@Valid @ModelAttribute Review review, BindingResult result, RedirectAttributes flash) {
		/* System.out.println("이메일은:"+review.getUserId()); */
    	if (result.hasErrors()) {
            List<FieldError> fieldErrors = result.getFieldErrors();
            flash.addFlashAttribute("fieldErrors", fieldErrors);
            flash.addFlashAttribute("review", review);
            return "redirect:/movies/" + review.getMovieId();
        }
    	
    	reviewMapper.create(review);
		return "redirect:/movies/"+(review.getMovieId()); 
    }
}