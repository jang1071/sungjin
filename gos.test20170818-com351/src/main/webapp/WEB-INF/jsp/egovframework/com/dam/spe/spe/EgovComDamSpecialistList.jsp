<%
 /**
  * @Class Name  : EgovComDamSpecialistList.jsp
  * @Description : EgovComDamSpecialistList 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2010.07.23  박종선                  최초 생성
  *
  *  @author 공통서비스팀 
  *  @since 2010.05.01
  *  @version 1.0
  *  @see
  *  
  *  Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
	<head>
		<title>지식전문가 목록</title>
		
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
		<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">	
		
		<script type="text/javaScript" language="javascript">
		<!--
		/* ********************************************************
		 * 초기화
		 ******************************************************** */
		function fn_egov_initl_SpecialistList(){
			// 첫 입력란에 포커스..
			document.listForm.searchCondition.focus();
		}		
		/* ********************************************************
		 * 페이징 처리 함수
		 ******************************************************** */
		function linkPage(pageNo){
			document.listForm.pageIndex.value = pageNo;
			document.listForm.action = "<c:url value='/dam/spe/spe/EgovComDamSpecialistList.do'/>";
		   	document.listForm.submit();
		}
		/* ********************************************************
		 * 조회 처리 
		 ******************************************************** */
		function fnSearch(){
			document.listForm.pageIndex.value = 1;
		   	document.listForm.submit();
		}
		/* ********************************************************
		 * 등록 처리 함수 
		 ******************************************************** */
		function fnRegist(){
			location.href = "<c:url value='/dam/spe/spe/EgovComDamSpecialistRegist.do'/>";
		}
		/* ********************************************************
		 * 수정 처리 함수
		 ******************************************************** */
		function fnModify(){
			location.href = "";
		}
		-->
		</script>
	</head>
	
	<body onLoad="fn_egov_initl_SpecialistList();">
		<DIV id="content" style="width:712px">
		
		<!-- 자바스크립트 경고 태그  -->
		<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>	
		
			<form name="listForm" action="<c:url value='/dam/spe/spe/EgovComDamSpecialistList.do'/>" method="post">
				<table width="100%" cellpadding="8" class="table-search" border="0">
		 			<tr>
		  				<td width="30%" class="title_left">
		   				<h1><img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif'/>" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;지식전문가  목록</h1>
		   				</td>
		  				<td width="20%">
		   					<select name="searchCondition" class="select" title="검색조건선택">
				   				<option selected value=''>--선택하세요--</option>
				   				<option value='1' <c:if test="${searchVO.searchCondition == '1'}">selected="selected"</c:if>>전문가성명</option>
				   				<option value='2' <c:if test="${searchVO.searchCondition == '2'}">selected="selected"</c:if>>지식유형명</option>		   
			   				</select>
						</td>
		  				<td width="30%">
		    			<input name="searchKeyword" type="text" title="검색어 입력" size="35" value="${searchVO.searchKeyword}"  maxlength="35" > 
		  				</td>
		  				<th width="20%">
		   					<table border="0" cellspacing="0" cellpadding="0">
		    					<tr> 
		      						<td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" alt="조회버튼" title="조회버튼" width="8" height="20"></td>
	      							<td class="btnBackground" nowrap="nowrap"><input type="submit" value="<spring:message code="button.inquire" />"
	      							 onclick="fnSearch(); return false;" class="btnNew" style="height:20px;width:26px;padding:0px 0px 0px 0px;" >
	      							</td>	      						
		      						<td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" alt="조회버튼" title="조회버튼" width="8" height="20"></td>
	      							<td>&nbsp;</td>
								    <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" alt="등록버튼" title="등록버튼" width="8" height="20"></td>
								    <td class="btnBackground" nowrap="nowrap"><a href="<c:url value='/dam/spe/spe/EgovComDamSpecialistRegist.do'/>"><spring:message code="button.create" /></a></td>
								    <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" alt="등록버튼" title="등록버튼" width="8" height="20"></td>      
	      							<td>&nbsp;</td>
		    					</tr>
		   					</table>
		  				</th>  
		 			</tr>
				</table>
		
				<table width="100%" cellpadding="2" class="table-line" border="0" 
				summary="이 표는 지식전문가 정보를 제공하며, 순번, 조직명, 지식유형명, 전문가성명, 등급, 승인일자 정보로 구성되어 있습니다 .">
				<caption>지식전문가 목록</caption>
					<thead>
						<tr>  
							<th scope="col" class="title" width="10%" nowrap="nowrap">순번</th>
							<th scope="col" class="title" width="15%" nowrap="nowrap">조직명</th>
							<th scope="col" class="title" width="20%" nowrap="nowrap">지식유형명</th>
							<th scope="col" class="title" width="15%" nowrap="nowrap">전문가성명</th>
							<th scope="col" class="title" width="20%" nowrap="nowrap">등급</th>									
							<th scope="col" class="title" width="20%" nowrap="nowrap">승인일자</th>
						</tr>
					</thead>    
					<tbody>
						<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
							<tr>					
								<td class="lt_text3" nowrap="nowrap"><c:out value="${(searchVO.pageIndex - 1) * searchVO.pageSize + status.count}"/></td>
								<td class="lt_text3" nowrap="nowrap">${resultInfo.orgnztNm}</td>
								<td class="lt_text3" nowrap="nowrap">${resultInfo.knoTypeNm}</td>
								<td class="lt_text3">
								<a href="<c:url value='/dam/spe/spe/EgovComDamSpecialist.do?pageIndex=${searchVO.pageIndex}&amp;speId=${resultInfo.speId}&amp;knoTypeCd=${resultInfo.knoTypeCd}&amp;appTypeCd=${resultInfo.appTypeCd}'/>"><c:out value="${resultInfo.userNm}"/></a>								
								</td>								
							    <td class="lt_text3" nowrap="nowrap">
							    <c:if test="${resultInfo.appTypeCd == '1'}">수석</c:if>
							    <c:if test="${resultInfo.appTypeCd == '2'}">책임</c:if>
							    <c:if test="${resultInfo.appTypeCd == '3'}">선임</c:if>							    
							    </td>															
								<td class="lt_text3" nowrap="nowrap">${resultInfo.speConfmDe}</td>
							</tr>   
						</c:forEach>
						
						<!-- 데이터가 없을때 화면에 메세지를 출력해준다 -->	
						<c:if test="${fn:length(resultList) == 0}">
							<tr> 
								<td class="lt_text3" colspan="6">
									<spring:message code="common.nodata.msg" />
								</td>
							</tr>   	          				 			   
						</c:if>    	
					</tbody>  
				</table>
		
				<table width="100%" cellspacing="0" cellpadding="0" border="0">
					<tr>
						<td height="10"></td>
					</tr>
				</table>
		
				<div align="center">
					<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="linkPage" />
				</div>
				
				<input type="hidden" name="speId">
				<input type="hidden" name="knoTypeCd">
				<input type="hidden" name="appTypeCd">								
				<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
		
			</form>
		</DIV>
	</body>
</html>

