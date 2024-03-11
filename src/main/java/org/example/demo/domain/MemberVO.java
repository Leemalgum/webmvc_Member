package org.example.demo.domain;

import lombok.*;

import java.time.LocalDate;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MemberVO {
    private String id;
    private String pw;
    private String name;
    private String email;
    private LocalDate signupDate;
}
