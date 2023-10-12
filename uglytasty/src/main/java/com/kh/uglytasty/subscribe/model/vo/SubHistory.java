package com.kh.uglytasty.subscribe.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor	// 기본 생성자
@AllArgsConstructor	// 전체 매개변수 생성자
@Setter				// setter 메소드
@Getter				// getter 메소드
@ToString			// toString 메소드
public class SubHistory {
	
	private int hisNo;
	private String userId;
	private int compNo1;
	private int compNo2;
	private int compNo3;
	private int compNo4;
	private int compNo5;
	private String hisDate;

}
