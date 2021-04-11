package com.inhatc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.inhatc.vo.Movie;

public interface BoardLikeMapper {

	@Insert("insert into liketo (m_id, u_id) values (#{m_id}, #{u_id})")
    public boolean createBoardLike();
	
	@Delete("delete from liketo where m_id = #{m_id} AND u_id=#{u_id}")
	public boolean deleteBoardLike();
	
	@Update("update movies set board_likecnt=(select count(*) from movies where id = #{id}) where id = #{id}")
	public boolean update(Movie movie);
	
	
	@Select("select COUNT(boardLikeId) from liketo where m_id = #{m_id} AND u_id = #{u_id}")
    public Movie getMovie();
	


	
	
}
