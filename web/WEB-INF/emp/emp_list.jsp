<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <jsp:include page="common.jsp"/>
    <title></title>
</head>

<!--[if IE]>
<style type="text/css"> body {
    word-wrap: break-word;
}</style><![endif]-->

<body>
<div class="page-container">


    <jsp:include page="header.jsp"/>


    <div class="main">

        <div class="main-navigation">

            <div class="round-border-topright"></div>
            <h1 class="first">列表说明<br/></h1>
            <p>表格内显示所有员工信息</p>


        </div>

        <div class="main-content">

            <h1 class="pagetitle">员工列表</h1>


            <div class="column1-unit">
                <table>
                    <tr>

                        <th class="top" scope="col">员工ID<br/></th>
                        <th class="top" scope="col">员工编号<br/></th>
                        <th class="top" scope="col">姓名</th>
                        <th class="top" scope="col">入职时间</th>
                        <th class="top" scope="col">操作</th>
                    </tr>
                <c:forEach items="${page.data}" var="e">
                     <tr>
                         <td>${e.id}</td>
                         <td>${e.empno}</td>
                        <td>${e.ename}</td>
                         <td>
                                 ${e.hiredateStr}
                         </td>
                         <td>
                             <a href="${pageContext.request.contextPath}/emp/showOneEmplyee.do?id=${e.id}">详细</a>
                             <a href="${pageContext.request.contextPath}/emp/toUpdatePage.do?id=${e.id}">更改</a>
                                 <%--<a href="${pageContext.request.contextPath}/emp/delEmp.do?id=${e.id}">删除</a>--%>
                             <a href="javascript:void(0);" id="emp_del_${e.id}" class="del_a">删除</a>
                         </td>


                    </tr>
                </c:forEach>
                </table>
                <p class="caption">
                    <a href="${pageContext.request.contextPath}/emp/listemp.do?pageNo=${page.firstPage}&pageSize=10">首页</a> |
                    <a href="${pageContext.request.contextPath}/emp/listemp.do?pageNo=${page.prevPage}&pageSize=10">上一页 </a>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${page.pageCount}/${page.pageNo}&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    <a href="${pageContext.request.contextPath}/emp/listemp.do?pageNo=${page.nextPage}&pageSize=10">下一页</a> |
                    <a href="${pageContext.request.contextPath}/emp/listemp.do?pageNo=${page.lastPage}&pageSize=10">尾页 </a>
                </p>
            </div>

        </div>
    </div>


    <jsp:include page="footer.jsp"/>

</div>

</body>
</html>
<script>
    (function () {
       var allDel =  document.getElementsByClassName("del_a");
       for(var i=0;i < allDel.length;i++){
           (function (i) {
               allDel[i].onclick = function () {
                   var str  = this.getAttribute("id");//emp_del_3
                   var id = str.substring(str.lastIndexOf("_")+1);
                   if(confirm("确定要删除码?")){
                        window.location.href="${pageContext.request.contextPath}/emp/delEmp.do?id="+id;
                   }
               };
           })(i);
           

       }
    })();
</script>



