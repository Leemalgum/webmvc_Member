package org.example.demo.controller;

import lombok.extern.log4j.Log4j2;
import org.example.demo.dto.MemberDTO;
import org.example.demo.service.MemberService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@Log4j2
@WebServlet(name = "memberController"
        , urlPatterns = {"/mem.do"
        , "/member/listMembers.do"
        , "/member/memberForm"
        , "/member/addMember.do"
        , "/member/listMembersEdit.do"
        , "/member/modMember.do"
        , "/member/delMember.do"})
public class MemberController extends HttpServlet {
    MemberService memberService = MemberService.INSTANCE;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getServletPath();
        log.info("memberController get...");
        List<MemberDTO> memberDTOList = null;
        try {
            memberDTOList = memberService.listMembers();
            req.setAttribute("dtoList", memberDTOList);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        if (url.equals("/mem.do")) {
            req.getRequestDispatcher("/WEB-INF/listMembers.jsp").forward(req, resp);

        } else if (url.equals("/member/listMembers.do")) {
            req.getRequestDispatcher("/WEB-INF/member/listMembers.jsp").forward(req, resp);

        } else if (url.equals("/member/memberForm")) {
            req.getRequestDispatcher("/WEB-INF/member/memberForm.jsp").forward(req, resp);

        } else if (url.equals("/member/listMembersEdit.do")) {
            req.getRequestDispatcher("/WEB-INF/member/memberInformation.jsp").forward(req, resp);

        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String url = req.getServletPath();
        if (url.equals("/member/addMember.do")) {
            MemberDTO memberDTO = MemberDTO.builder()
                    .id(req.getParameter("id"))
                    .pw(req.getParameter("pw"))
                    .name(req.getParameter("name"))
                    .email(req.getParameter("email"))
                    .signupDate(LocalDate.now())
                    .build();
            try {
                memberService.addMember(memberDTO);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
//            resp.sendRedirect("/member/listMembers.do");
        } else if (url.equals("/member/modMember.do")) {
            MemberDTO memberDTO = MemberDTO.builder()
                    .id(req.getParameter("id"))
                    .pw(req.getParameter("pw"))
                    .name(req.getParameter("name"))
                    .email(req.getParameter("email"))
                    .build();
            try {
                memberService.modify(memberDTO);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        } else if (url.equals("/member/delMember.do")) {
            try {
                memberService.remove(req.getParameter("id"));
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
        resp.sendRedirect("/member/listMembersEdit.do");
    }

}
