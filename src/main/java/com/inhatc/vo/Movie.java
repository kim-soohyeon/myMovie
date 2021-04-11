package com.inhatc.vo;

public class Movie {

	private int id;
	private String title;
	private String director;
	private String image;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	@Override
	public String toString() {
    return "Book [id=" + id + ", title=" + title + ", director=" + director + ", image=" + image + "]";
	}

}

