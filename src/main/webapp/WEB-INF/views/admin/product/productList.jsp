<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 메인컨텐츠 시작 -->
<input type="hidden" id="deleteCheck" value="${deleteCheck }">
<input type="hidden" class="deleteCheck" value="0">
<input type="hidden" id="pg" value="${pg }">
<input type="hidden" name="pg" value="1">
<div id="mainContent_wrap">
	<div id="product_search_wrap" style="width:1200px; margin: 0 auto;">
		<div id="product_search_title" style="margin-bottom: 20px;">
			<h1 style="font-weight:normal;">상품관리</h1>			
		</div>		
	    <div>
           	<input type="button" id="productRegistBtn" value="상 품 등 록">
       	</div>
       	<div style="float: left;">
         	<input type="button" id="productDeleteBtn" value="선 택 삭 제">
       	</div>
	    <form id="checkDeleteForm" method="post" 
	    action="productDelete">   			
		<div id="productSeach_list" align="left" style="margin-top: 50px;">
			<table id="productSearch_Table" border="1" style="width: 100%; border: 1px solid #d9dadc; border-spacing: 0; line-height: 1.5;">
				<tr>
					<th style="width: 44px;">
						<input type="checkbox" id="check_all">
					</th>
					<th style="width: 100px;">상품코드</th>
					<th style="width: 336px;">상품명</th>
					<th style="width: 134px;">상품원가</th>
					<th style="width: 134px;">총 수량</th>
					<th style="width: 134px;">잔여 수량</th>
					<th style="width: 134px;">총 판매량</th>
					<th style="width: 100px;">등록일</th>
				</tr>
				<c:forEach var="list" items="${list}">
					<tr>
						<td align="center" style="height: 31px;">
							<input type="checkbox" value="${list.productCode }" name="check" class="check">
						</td>
						<td align="center">${list.productCode }</td>
						<td style="padding-left: 5px;">
							<a href="javascript:void(0)" id="productA" class="${list.productCode }">${list.productName }</a>
						</td>
						<td align="center">${list.originPrice }</td>
						<td align="center">${list.totalQty }</td>
						<td align="center">${list.stockQty }</td>
						<td align="center">${list.saleQty }개</td>
						<td align="center">${list.regDate }</td>
					</tr> 
				</c:forEach>
				
				
			</table>
			<br>
			<div id="productPagingDiv"></div>
			<br><br><br><br>
						
			
		</div>
		</form>      
		
		 <!-- 선택 삭제 시 확인&취소 / Modal -->
	    <div id="open_confirmModal" class="modal">

			<!-- Modal content -->
			<div class="modal-content">
          		<p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">상품삭제</span></b></span></p>
				<p style="text-align: center; line-height: 1.5;"><br>	<span style="color: red;">정말  삭제 하시겠습니까?</span></p>
   				<p><br /></p>

				<div class="modalDiv" id="confirmOK_Modal" style="display: inline-block;">
					<span class="pop_bt" style="font-size: 13pt; " >
       					  확인
    				</span>
				</div>
				
				<div  class="modalDiv" id="confirmClose_Modal" style="float:right;">
					<span class="pop_bt" style="font-size: 13pt;" >
               			 취소
            		</span>
        		</div>
			</div>

		</div>
  		<!--End Modal-->
        	
        	
		<!-- 체크박스 선택 X / Modal -->
		<div id="open_nonCheckModal" class="modal">

			<!-- Modal content -->
			<div class="modal-content">	
				<p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">상품삭제</span></b></span></p>
                <p style="text-align: center; line-height: 1.5; color: red;"><br />항목을 선택해 주세요</p>
                <p><br /></p>
            	<div class="close_Modal" style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;">
               		<span class="pop_bt" style="font-size: 13pt;" >
                   	 	 닫기
                	</span>
            	</div>
     		</div>
		</div>
    	 <!--End Modal-->

	</div><!-- search_wrap -->
	
</div><!-- 메인컨텐츠 끝 -->


<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
/* 숫자탭 컴마 추가 */
 function addComma(num) {
  var regexp = /\B(?=(\d{3})+(?!\d))/g;
  return num.toString().replace(regexp, ',');
}

/* 모달 창 닫기 */
$('#confirmClose_Modal').click(function(){
	$('#open_confirmModal').hide();
});

$('.close_Modal').click(function(){
	$('#open_nonCheckModal').hide();
	$('#open_deleteSuccessModal').hide();
});

/* 상품 선택 삭제 */
$('#productDeleteBtn').click(function(){
	var count = $('.check:checked').length;
	if(count==0){
		$('#open_nonCheckModal').show();
	}else{
		$('#open_confirmModal').show();
		$("#confirmOK_Modal").off().on('click', function(){
			$('#checkDeleteForm').submit();
		});
	}

});

/* 체크박스 전체 선택/해제 */
	$('#check_all').click(function(){
		if($('#check_all').is(":checked"))
			$('.check').prop('checked', true);
		else
			$('.check').prop('checked', false);
	});




/* 상품등록 버튼 */
$('#productRegistBtn').click(function(){
   location.href="/miniproject/admin/productRegistForm";
});


/* 상품 링크 클릭 시 수정 폼 */
$('#productSearch_Table').on('click', '#productA',function(){
	location.href="/miniproject/admin/productModifyForm?productCode="+$(this).attr('class');
});

</script>

</html>