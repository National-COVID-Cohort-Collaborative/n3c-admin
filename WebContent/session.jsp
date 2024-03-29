<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="n3c" uri="http://icts.uiowa.edu/n3c"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<c:set var="user_email" scope="session">${attributes.get("email")[0]}</c:set>

<sql:query var="admins" dataSource="jdbc/N3CLoginTagLib">
	select email, admin, public_health, peds_dashboard, users, foundry_feed, public_site, recover, public_health_mode from n3c_admin.admin where email = lower(?)
	<sql:param>${user_email}</sql:param>
</sql:query>
<c:forEach items="${admins.rows}" var="row" varStatus="rowCounter">
	<c:set scope="session" var='valid' value='yes' />
	<c:if test="${row.admin == true}">
		<c:set scope="session" var='admin' value='yes' />
	</c:if>
	<c:if test="${row.public_health == true}">
		<c:set scope="session" var='public_health' value='yes' />
	</c:if>
	<c:if test="${row.peds_dashboard == true}">
		<c:set scope="session" var='peds_dashboard' value='yes' />
	</c:if>
	<c:if test="${row.users == true}">
		<c:set scope="session" var='users' value='yes' />
	</c:if>
	<c:if test="${row.foundry_feed == true}">
		<c:set scope="session" var='foundry_feed' value='yes' />
	</c:if>
	<c:if test="${row.public_site == true}">
		<c:set scope="session" var='public_site' value='yes' />
	</c:if>
	<c:if test="${row.recover == true}">
		<c:set scope="session" var='recover' value='yes' />
	</c:if>
	<c:if test="${row.public_health_mode == true}">
		<c:set scope="session" var='public_health_mode' value='yes' />
	</c:if>
</c:forEach>

<c:redirect url="index.jsp" />
