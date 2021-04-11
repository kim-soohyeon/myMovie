package com.inhatc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.inhatc.vo.Movie;

public interface MovieMapper {

	@Insert("insert into movies (title, director, image) values (#{title}, #{director}, #{image})")
    public boolean create(Movie movie);
	
	@Select("select * from movies")
    public List<Movie> getList();
	
	@Select("select * from movies where id = #{id}")
    public Movie getMovie(int id);
	

	@Update("update movies set title = #{title}, director = #{director}, image = #{image} where id = #{id}")
	public boolean update(Movie movie);
	
	@Delete("delete from movies where id = #{id}")
	public boolean delete(int id);
}
