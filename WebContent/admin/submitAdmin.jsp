<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:update var="admins" dataSource="jdbc/N3CLoginTagLib">
	insert into n3c_admin.admin values(lower(?), false, false, false, false, false, false, false)
	<sql:param>${param.email}</sql:param>
</sql:update>
<c:redirect url="admins.jsp" />
