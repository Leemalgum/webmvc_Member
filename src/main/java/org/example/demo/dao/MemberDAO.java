package org.example.demo.dao;

import lombok.Cleanup;
import org.example.demo.domain.MemberVO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {
    public List<MemberVO> listMembers() throws Exception {
        List<MemberVO> memberVOS = new ArrayList<>();
        @Cleanup Connection conn = ConnectionUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement pstmt = conn.prepareStatement("select * from mvc_member");
        @Cleanup ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            MemberVO memberVO = MemberVO.builder()
                    .id(rs.getString("id"))
                    .pw(rs.getString("pw"))
                    .name(rs.getString("name"))
                    .email(rs.getString("email"))
                    .signupDate(rs.getDate("signupDate").toLocalDate())
                    .build();
            memberVOS.add(memberVO);
        }
        return memberVOS;
    }

    public void addMember(MemberVO memberVO) throws Exception {
        @Cleanup Connection conn = ConnectionUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement pstmt = conn.prepareStatement("insert into mvc_member(id, pw, name, email, signupDate) values(?,?,?,?,?)");
        pstmt.setString(1, memberVO.getId());
        pstmt.setString(2, memberVO.getPw());
        pstmt.setString(3, memberVO.getName());
        pstmt.setString(4, memberVO.getEmail());
        pstmt.setDate(5, Date.valueOf(memberVO.getSignupDate()));
        pstmt.executeUpdate();
    }

    public MemberVO getWithPassword(String id, String pw) throws Exception {
        String sql = "select * from mvc_member where id = ? and pw = ?";
        MemberVO memberVO = null;
        @Cleanup Connection conn = ConnectionUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        pstmt.setString(2, pw);
        @Cleanup ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            memberVO = MemberVO.builder()
                    .id(rs.getString("id"))
                    .pw(rs.getString("pw"))
                    .name(rs.getString("name"))
                    .email(rs.getString("email"))
                    .signupDate(rs.getDate("signupDate").toLocalDate())
                    .build();
        }
        return memberVO;
    }

    public void updateOne(MemberVO memberVO) throws Exception {
        String sql = "update mvc_member set pw = ?, name = ?, email = ? where id = ?";
        @Cleanup Connection conn = ConnectionUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, memberVO.getPw());
        pstmt.setString(2, memberVO.getName());
        pstmt.setString(3, memberVO.getEmail());
        pstmt.setString(4, memberVO.getId());
        pstmt.executeUpdate();
    }

    public void deleteOne(String id) throws Exception {
        String sql = "delete from mvc_member where id = ?";
        @Cleanup Connection conn = ConnectionUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        pstmt.executeUpdate();
    }
}
