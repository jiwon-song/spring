package com.hanul.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import hong.ClassListVO;
import hong.HongService;
import hong.TestVO;

@Controller
public class HongController {
	
	@Autowired private HongService service;	// 이 부분은 일우꺼로 수정할 것
	
	// 반별 테스트 목록 가죠오기
	@RequestMapping("test_list.ho")
	public String test_list(Model model, int class_id, String class_name) {
					
		// 사이드 메뉴에 붙일 클래스 목록
		List<ClassListVO> list = null;
		list = service.class_list();
		model.addAttribute("list", list);

		// 클래스 이름 뜨게 하기
		model.addAttribute("class_id", class_id);	// 클래스 이름 가져오게 수정할 것
		model.addAttribute("class_name", class_name);	// 클래스 이름 가져오게 수정할 것
		
		// 테스트 목록
		List<TestVO> test_list = null;
		test_list = service.test_list(class_id);
		
		model.addAttribute("test_list", test_list);
		
		//선택한 반 이름 뜨게 하기
		
		
		
		return "hong/test_list";	
	}
	
	// 테스트 추가하기 (vo에 저장되어 있는 class_id 사용)
	@RequestMapping("test_insert.ho")
	public String test_insert(TestVO vo) {
		
		//vo 에 저장되어 있으므로 사용하기만 하면 됨 			
		// 테스트 추가하는 메소드 
		service.test_insert(vo);
		
		//선택한 반 이름 뜨게 하기
		
		
		return "redirect:test_list.ho?class_id="+vo.getClass_id();	
	}
	
	
	// 테스트 삭제하기 (vo 를 사용하지 않기 떄문에 test_id 따로 넣어줘서 사용)
	@RequestMapping("test_delete.ho")
	public String test_delete(int test_id, int class_id) {
		
		service.test_delete(test_id);		
		
		return "redirect:test_list.ho?class_id="+class_id;
	}
	
	// 테스트 수정할수 있는 페이지 요청하기
	@RequestMapping("test_modify.ho")
	public String test_modify(Model model, int test_id, int class_id, String class_name, String test_name) {
		
		// 사이드 메뉴에 붙일 클래스 목록
		List<ClassListVO> list = null;
		list = service.class_list();
		model.addAttribute("list", list);

		// 클래스 이름 뜨게 하기
		model.addAttribute("class_id", class_id);	// 클래스 이름 가져오게 수정할 것
		model.addAttribute("class_name", class_name);	// 클래스 이름 가져오게 수정할 것
		model.addAttribute("test_name", test_name);	// 클래스 이름 가져오게 수정할 것

		// 테스트 목록
		List<TestVO> test_list = null;
		test_list = service.test_list(class_id);
		
		model.addAttribute("test_list", test_list);
		
		
		return "hong/test_modify";
	}
	
	
}
