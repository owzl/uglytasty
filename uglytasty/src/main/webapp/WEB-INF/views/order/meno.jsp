<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 
	cartlist : 회원아이디, 상품번호, 수량 / 상품명, 가격, 할인율 / sale_price / change_name, file_level 
 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div * {box-sizing: border-box;}

    .all {
        margin: auto;
        width: 1400px;
        margin-left: 15%;
    }
    hr{
        width: 1000px;
        margin-left: 0;
        border: 1px solid #f2f2f2;
        margin: 20px 0;
    }
    .allselect {
        color: gray;
        font-size: 16px;
        font-weight: 400;
        padding-left: 18px;
    }
    h1 {
        color: black;
        font-size: 30px;
    }

    /*-------------------상품 수량------------------*/
    #amount {
        border: none;
        text-align: center;
        width: 35px;
    }
    #add, #minus {
        border: none;
        width: 27px;
        height: 27px;
        border-radius: 5px;
        background-color: white;
        border: 1px solid #ff6741;
        color: #ff6741;
        cursor: pointer;
    }
    #add:hover, #minus:hover {
        border: 2px solid #ff6741;
    }
    #sum {
        border: none;
        width: 370px;
        text-align: right;
        padding-right: 5px;
        font-size: 18px;
        color: #ff6741;
        font-weight: bold;
    }

   

    #productInfo th {
        color: gray;
        font-size: 15px;
        padding: 15px 0px;
      
    }

    #productInfo td {
        color: gray;
        font-size: 15px;
        padding: 0 15px;
        font-weight: 400;
    }


    #finalPrice td {
        color: #ff6741;
        font-weight: bold;
        font-size: 18px;
    }
    #finalPrice #totalPrice {
        /* width: 100px; */
        color: #ff6741;
        font-weight: bold;
        font-size: 18px;
        padding-left: 185px;
        text-align: right;
        border: none;
    }
   
    #accountBtn {
        width: 1000px;
        height: 70px;
        border: 1px solid #ff6741;
        border-radius: 5px;
        background-color: #ff6741;
        color: white;
        margin-top: 30px;
        margin-bottom: 50px;
        font-weight: bold;
        font-size: 18px;
        cursor: pointer;
    }
    #accountBtn:hover {
        filter: brightness(0.9);
    }

    input[type=checkbox] {
        zoom: 1.8;
    }

</style>

</head>
<body>

	<div class="all">
        
        <form id="order" action="">
            
            <h1>🛒 장바구니에 담긴 상품 리스트</h1>
            
            <br><br>

            <span style="font-size: 20px; font-weight: bold;">담긴 상품</span>
            <span style="font-size: 20px; font-weight: bold; color: #ff6741;">2<span><br>

            <br>
            
            <div class="allselect">
                <input type="checkbox" name="1" onclick='selectAll(this)'><span> 전체 선택</span>
            </div>
            
            <hr>

            <table id="productInfo">
	                <tr>
	                    <th></th>
	                    <th>상품 사진</th>
	                    <th width="300px;">상품명</th>
	                    <th>수량</th>
	                    <th>판매가</th>
	                    <th>할인</th>
	                    <th>배송비</th>
	                    <th style="padding-left: 100px;">소계</th>
	                </tr>
				
				<c:forEach var="c" items="${ cartlist }">
	                <tr id="${ productNo }">
	                    <td><input type="checkbox" name="ch"></td>
	                    <td>
	                        <a href="#">
	                            <img style="width: 100px; height: 100px;" src="${ c.changeName }">
	                        </a>
	                    </td>
	                    <td>${ c.productName }</td>
	                    <td>             
	                        <!--(+)(-)버튼 : 재고량에 따른 분기처리하기-->
	                        <input type="hidden" id="salePrice" name="salePrice" value="${ c.salePrice }">
	                        
	                        <input type="button" id="add" value=" + " name="add">
	                        <input type="text" id="amount" name="amount" value="${ c.quantity }" readonly>
	                        <input type="button" id="minus" value=" - " name="minus"><br>
	                    </td>
	                    <td>${ c.price }</td>
	                    <td>${ c.sale }%</td>
	                    <td>2500</td>
	                    <td>
	                        <!--소계 여기로 value -->
	                        <input type="text" id="sum" name="sum" style="width: 120px;" readonly>원 <br>
	                        <p align="right" style="font-size: 10px; color="#ff6741;">(배송비 포함 전)</p>
	                    </td>
	                </tr>
				</c:forEach>
            </table>


            <hr><br>

            <h1>💳 결제 정보</h1><br>
            <table id="paymentInfo">
                
                <!-- 넘길 값 -->
                <tr id="finalPrice">
                    <td width="500" >총 결제 금액</td><span></span>
                    <td><input type="text" id="totalPrice" name="" value="20500" >원</td>
                </tr>
                <tr>
                    <td></td>
                    <td align="right" style="font-size: 10px;">(각 상품금액 + 배송비 가 포함되어 있습니다.)</td>
                </tr>
            </table>
    
      
            <!-- 버튼 누르면 결제API 뜨도록 -->
            <br><br>
            <button type="submit" id="accountBtn">주문하기</button>
        </form>

    </div>
    
    
 <!--checkBox 전체선택 / 전체해제-->
    <script>
        function selectAll(selectAll)  {
            const checkboxes = document.getElementsByName('ch');
            
            checkboxes.forEach((cBox) => {
            cBox.checked = selectAll.checked; // <= true false
            })
        }
    </script>
    
    
    
    <!-- *** 2 가 아닌 list.length 로 바꾸기 *** -->
    <!-- (장바구니에 담긴 상품 수(list.length) 만큼 for문 돌려서) 
        수량+/- 변화에 따른 sum 값 변화 + 총 반영한 totalPrice 찍힘 -->
    <script>
        // 초기 totalPrice 계산
        let calculatedValue = 0;

        for (let i = 1; i <= 2; i++) {
            const row = document.getElementById(i);
            const salePrice = row.querySelector("input[name='salePrice']");
            const sum = row.querySelector("input[name='sum']");

            let priceVal = parseInt(salePrice.value);
            let amountVal = parseInt(row.querySelector("input[name='amount']").value);

            // 초기값 설정
            sum.value = priceVal * amountVal;

            calculatedValue += priceVal * amountVal;
        }

        const totalPriceElement = document.getElementById('totalPrice');
        totalPriceElement.value = calculatedValue; // 값을 input 요소의 value에 설정

        // (+) 또는 (-) 버튼 클릭 시 totalPrice 업데이트
        for (let i = 1; i <= 2; i++) {
            const row = document.getElementById(i);
            const salePrice = row.querySelector("input[name='salePrice']");
            const add = row.querySelector("input[name='add']");
            const minus = row.querySelector("input[name='minus']");
            const amount = row.querySelector("input[name='amount']");
            const sum = row.querySelector("input[name='sum']");

            if (add) {
                add.addEventListener('click', function () {
                    let amountVal = parseInt(amount.value);
                    let priceVal = parseInt(salePrice.value);
                    amountVal++;
                    sum.value = amountVal * priceVal;
                    amount.value = amountVal;
                    updateTotalPrice();
                });
            }

            // * 재고수량에 따른 + max값 걸기
            // if (add) {
            //     add.addEventListener('click', function () {
            //         let amountVal = parseInt(amount.value);
            //         let priceVal = parseInt(salePrice.value);
            //         let max = 5; // 최대 허용 값 (재고수량)

            //         if (amountVal < max) {
            //             amountVal++;
            //             sum.value = amountVal * priceVal;
            //             amount.value = amountVal;
            //             updateTotalPrice();
            //         }
            //     });
            // }

            if (minus) {
                minus.addEventListener('click', function () {
                    let amountVal = parseInt(amount.value);
                    let priceVal = parseInt(salePrice.value);
                    if (amountVal > 1) {
                        amountVal--;
                        sum.value = amountVal * priceVal;
                        amount.value = amountVal;
                        updateTotalPrice();
                    } else {
                        amountVal = 1;
                    }
                });
            }
        }

        function updateTotalPrice() {
            let calculatedValue = 0;

            for (let i = 1; i <= 2; i++) {
                const priceElement = document.getElementById(i).querySelector("input[name='sum']");
                const price = parseInt(priceElement.value);
                calculatedValue += price;
            }

            const totalPriceElement = document.getElementById('totalPrice');
            totalPriceElement.value = calculatedValue;
        }
    </script>


   



 


</body>
</html>