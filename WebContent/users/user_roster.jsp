<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="util" uri="http://icts.uiowa.edu/tagUtil"%>
<!DOCTYPE html>

<c:if test="${empty valid}">
	<c:set scope="session" var="not_logged_in" value="t" />
	<c:redirect url="../index.jsp" />
</c:if>

<html>
<jsp:include page="../head.jsp" flush="true" />

<style type="text/css" media="all">
@import "../resources/n3c_login_style.css";
</style>

<body>

	<jsp:include page="../navbar.jsp" flush="true" />

	<div class=" center-box shadow-border">
    	<h2 class="header-text"><img src="../images/n3c_logo.png" class="n3c_logo_header" alt="N3C Logo">N3c Enclave Users</h2>
    	<div style="text-align:center;">
 			
<p>&nbsp;</p>
<div id="table" style="overflow: scroll;">&nbsp;</div>

<div id="op_table" style="overflow: scroll;">&nbsp;</div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
<script>
$.getJSON("user_roster_feed.jsp", function(data){
		
	var json = $.parseJSON(JSON.stringify(data));

	var col = [];

	for (i in json['headers']){
		col.push(json['headers'][i]['label']);
	}


	var table = document.createElement("table");
	table.className = 'table table-hover';
	table.style.width = '100%';
	table.style.textAlign = "left";
	table.id="table1";

	var header= table.createTHead();
	var header_row = header.insertRow(0); 

	for (i in col) {
		var th = document.createElement("th");
		th.innerHTML = '<span style="color:#333; font-weight:600; font-size:16px;">' + col[i].toString() + '</span>';
		header_row.appendChild(th);
	}

	var divContainer = document.getElementById("table");
	divContainer.innerHTML = "";
	divContainer.appendChild(table);

	var data = json['rows'];

	$('#table1').DataTable( {
    	data: data,
       	paging: true,
    	pageLength: 5,
    	lengthMenu: [ 5, 10, 25, 50, 75, 100 ],
    	order: [[0, 'asc']],
     	columns: [
	       	{ data: 'email', visible: true, orderable: true},
	       	{ data: 'official_first_name', visible: true, orderable: true},
	       	{ data: 'official_last_name', visible: true, orderable: true},
	       	{ data: 'first_name', visible: true, orderable: true},
	       	{ data: 'last_name', visible: true, orderable: true},
	       	{ data: 'ror_id', visible: true, orderable: true},
	       	{ data: 'ror_name', visible: true, orderable: true},
	       	{ data: 'orcid_id', visible: true, orderable: true},
	       	{ data: 'expertise', visible: true, orderable: true},
	       	{ data: 'therapeutic_area', visible: true, orderable: true},
	       	{ data: 'citizen_scientist', visible: true, orderable: true},
	       	{ data: 'international', visible: true, orderable: true},
	       	{ data: 'created', visible: true, orderable: true},
	       	{ data: 'updated', visible: true, orderable: true},
	       	{ data: 'una_path', visible: true, orderable: true}
    	]
	} );

	
});
</script>
	<jsp:include page="../footer.jsp" flush="true" />
	</div>
</body>
</html>
