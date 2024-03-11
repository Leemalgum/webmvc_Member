package org.example.demo.service;

import org.example.demo.dao.MemberDAO;
import org.example.demo.domain.MemberVO;
import org.example.demo.dto.MemberDTO;
import org.example.demo.util.MapperUtil;
import org.modelmapper.ModelMapper;

import java.util.List;
import java.util.stream.Collectors;

public enum MemberService {
    INSTANCE;
    private ModelMapper modelMapper;
    private MemberDAO memberDAO;

    MemberService() {
        modelMapper = MapperUtil.INSTNACE.get();
        memberDAO = new MemberDAO();
    }

    public MemberDTO login(String id, String pw) throws Exception {
        MemberVO memberVO = memberDAO.getWithPassword(id, pw);
        MemberDTO memberDTO = modelMapper.map(memberVO, MemberDTO.class);

        return memberDTO;
    }

    public List<MemberDTO> listMembers() throws Exception {
        List<MemberVO> memberVOS = memberDAO.listMembers();
        List<MemberDTO> memberDTOS = memberVOS.stream()
                .map(vo -> modelMapper.map(vo, MemberDTO.class))
                .collect(Collectors.toList());
        return memberDTOS;
    }

    public void addMember(MemberDTO memberDTO) throws Exception {
        MemberVO memberVO = modelMapper.map(memberDTO, MemberVO.class);
        memberDAO.addMember(memberVO);
    }

    public void modify(MemberDTO memberDTO) throws Exception {
        memberDAO.updateOne(modelMapper.map(memberDTO, MemberVO.class));
    }

    public void remove(String id) throws Exception {
        memberDAO.deleteOne(id);
    }

}
