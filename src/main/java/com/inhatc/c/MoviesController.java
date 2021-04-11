package com.inhatc.c;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.inhatc.vo.Movie;
import com.inhatc.vo.Review;
import com.inhatc.vo.User;
import com.inhatc.helper.FileHelper;
import com.inhatc.mapper.MovieMapper;
import com.inhatc.mapper.ReviewMapper;

@Controller
public class MoviesController {

	@Autowired
    private MovieMapper movieMapper;
	@Autowired
    private ReviewMapper reviewMapper;

	
	@RequestMapping(value = "/movies", method = RequestMethod.GET) 
	public String index(Model model) {
		// ���� ���� ���������� �����͸� ����
		// ���۷κ��� ����Ʈ�� �޾ƿ�.
		List<Movie> movies = movieMapper.getList();
		model.addAttribute("movies", movies);
		return "movies/index"; 
	}
		
    @RequestMapping(value = "/movies/new", method = RequestMethod.GET)
    public String newMovie() {
        return "movies/new";
    }
    
    @RequestMapping(value = "/movies", method = RequestMethod.POST)
    public String create(@ModelAttribute Movie movie, @RequestParam MultipartFile file, HttpServletRequest request) {
    	String fileUrl = FileHelper.upload("/uploads", file, request);
    	movie.setImage(fileUrl);
    	movieMapper.create(movie);
        return "redirect:/movies";
    }
    
    @RequestMapping(value = "/movies/edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable int id, Model model) {
		/* @PathVariable ������̼��� URL�κ��� ���� ���� �޾ƿ� �� �ְ� �մϴ�. */
    	// id ���� ���� �����͸� ������
    	Movie movie = movieMapper.getMovie(id);
    	// �� �������� �����͸� ����(key/value ����)
    	model.addAttribute("movie", movie);
        return "movies/edit";
    }
    
    @RequestMapping(value = "/movies/update", method = RequestMethod.POST)
    public String update(@ModelAttribute Movie movie, @RequestParam MultipartFile file, HttpServletRequest request) {
    	String fileUrl = FileHelper.upload("/uploads", file, request);
    	movie.setImage(fileUrl);
    	movieMapper.update(movie);
        return "redirect:/movies";
    }
    
    @RequestMapping(value = "/movies/delete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable int id) {
    	movieMapper.delete(id);
        return "redirect:/movies";
    }
    
    @RequestMapping(value = "/movies/{id}", method = RequestMethod.GET)
    public String show(@PathVariable int id, Model model, Authentication authentication) {
    	UserDetails userDetails = (UserDetails) authentication.getPrincipal();
    	model.addAttribute("email",userDetails.getUsername());
    
    	Map ratingOptions = new HashMap();
    	ratingOptions.put(0, "☆☆☆☆☆");
    	ratingOptions.put(1, "★☆☆☆☆");
    	ratingOptions.put(2, "★★☆☆☆");
    	ratingOptions.put(3, "★★★☆☆");
    	ratingOptions.put(4, "★★★★☆");
    	ratingOptions.put(5, "★★★★★");
    	model.addAttribute("ratingOptions", ratingOptions);
    	
    	Movie movie = movieMapper.getMovie(id);
        model.addAttribute("movie", movie);
        
        // ��ϵ� �����
        List<Review> reviews = reviewMapper.getReviews(id);
        model.addAttribute("reviews", reviews);
        // ���ο� ���� ���
        Review review = new Review();
        review.setMovieId(id);
        model.addAttribute("review", review);
        
        return "movies/show";
    }
    
    @RequestMapping(value = "/location", method = RequestMethod.GET)
    public String location() {
        return "statics/location";
    }
    
}
