package com.inhatc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.inhatc.vo.Review;

public interface ReviewMapper {
    @Insert("INSERT INTO reviews (text, rating, movie_id, email) VALUES (#{text}, #{rating}, #{movieId} , #{userId})")
    void create(Review review);
    
    @Select("SELECT text,rating,movie_id,email AS userId FROM reviews WHERE movie_id = #{movieId} ORDER BY id DESC")
    List<Review> getReviews(int movieId);
 
}
