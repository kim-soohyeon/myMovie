package com.inhatc.vo;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class Review {
	
	Integer id;
	
	@NotEmpty
	@Size(min = 5)
	String text;
	
	@NotNull
    Double rating; // 평점을 위한 필드추가


	@NotNull
    Integer movieId;
    
    String userId;
    
    public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Double getRating() {
		return rating;
	}
	public void setRating(Double rating) {
		this.rating = rating;
	}
	public Integer getMovieId() {
		return movieId;
	}
	public void setMovieId(Integer movieId) {
		this.movieId = movieId;
	}

    public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	@Override
    public String toString() {
        return "Review [id=" + id + ", text=" + text + ", rating=" + rating + ", movieId=" + movieId + ", userId=" + userId + "]";
    }
}