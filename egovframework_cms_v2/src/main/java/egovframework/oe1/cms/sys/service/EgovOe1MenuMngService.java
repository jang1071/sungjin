/*
 * Copyright 2010 MOPAS(Ministry of Public Administration and Security).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.oe1.cms.sys.service;

import java.util.List;

import egovframework.oe1.cms.com.service.EgovOe1ComDefaultVO;


/**
 * 메뉴관리에 대한 Service Interface를 정의한다.
 * @author 운영환경1팀 조수정
 * @since 2010.07.20
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2010.07.20  조수정          최초 생성
 *
 * Copyright (C) 2009 by MOPAS  All right reserved.
 * </pre>
 */
public interface EgovOe1MenuMngService {

	/**
	 * 메뉴 정보 상세 조회.
	 * @param menuId
	 * @return EgovOe1MenuMngVO
	 * @exception Exception
	 */
	public EgovOe1MenuMngVO selectMenuMng(EgovOe1MenuMngVO egovOe1MenuMngVO) throws Exception;

	/**
	 * 메뉴 정보 목록 조회
	 * @param searchCondition, searchKeyword
	 * @return List
	 * @exception Exception 
	 */
	public List selectMenuMngList(EgovOe1ComDefaultVO comDefaultVO) throws Exception;

	/**
	 * 메뉴 목록 갯수 조회
	 * @param searchCondition, seachKeyword
	 * @return int
	 * @exception Exception 
	 */
	public int selectMenuListTotCnt(EgovOe1ComDefaultVO comDefaultVO) throws Exception;
	
	/**
	 * 메뉴 정보 수정
	 * @param EgovOe1MenuMngVO
	 * 	@return void
	 * @exception Exception 
	 */
	public void updateMenuMng(EgovOe1MenuMngVO egovOe1MenuMngVO) throws Exception;
	
	/**
	 * 메뉴 정보 삭제
	 * @param menuId
	 * @return void
	 * @exception Exception
	 */
	public void deleteMenuMng(EgovOe1MenuMngVO egovOe1MenuMngVO) throws Exception;

	/**
	 * 메뉴 정보 등록
	 * @param EgovOe1MenuMngVO
	 * @return void
	 * @exception Exception 
	 */
	public void insertMenuMng(EgovOe1MenuMngVO egovOe1MenuMngVO) throws Exception;

	
}	