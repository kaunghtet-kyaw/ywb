$(document).ready(function () {
	pg_navigation();

	tinymce.init({
		mode : "specific_textareas",
		selector:'.txteditor',
		height: "375px",
		plugins: [
		'advlist autolink lists link image charmap print preview anchor',
		'searchreplace visualblocks code fullscreen',
		'insertdatetime media table paste code help wordcount'],
		toolbar: 'undo redo | formatselect | bold italic backcolor | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | removeformat | help'
	});

	$('#datetimepicker').datetimepicker({
		format: 'LT'
	});

	$('.page').click(function(){
		pg_navigation()
	});

	$("#sidebar").mCustomScrollbar({
		theme: 		'minimal'
	});

	$('#sidebarCollapse').on('click', function () {
		$('#sidebar, #content').toggleClass('active');
		$('.collapse.in').toggleClass('in');
		$('a[aria-expanded=true]').attr('aria-expanded', 'false');
	});
	$("#mailModal").on('hidden.bs.modal', function () {
		window.location.reload()
	});
	$.fn.dataTable.moment('YYYY - MMMM');
	$.fn.dataTable.moment('YYYY-MM-DD HH:mm:SS');

	$('table.table').DataTable( {
		dom: 			'<"row"<"col-sm-12 col-md-6"B><"col-sm-12 col-md-6"f>><"row"<"col-sm-12 col-md-12"l>><"row"<"col-sm-12"tr>><"row"<"col-sm-12 col-md-12"i><"col-sm-12 col-md-12"p>>',
		buttons: 		[
			{
				extend: 	'copyHtml5',
				text: 		'<i class="fas fa-copy"></i>',
				titleAttr: 	'Copy',
				className: 	'btn-warning',
				title: 		'Copy'
			},
			{
				extend: 	'excelHtml5',
				text:		'<i class="fas fa-file-excel"></i>',
				titleAttr: 	'Excel',
				className: 	'btn-warning',
				title: 		'Excel'  
			},
			{
				extend: 	'csvHtml5',
				text: 		'<i class="fas fa-file-alt"></i>',
				titleAttr: 	'CSV',
				title: 		'CSV',
				className: 	'btn-warning' 
			},
			{
				extend: 	'pdfHtml5',
				text: 		'<i class="fas fa-file-pdf"></i>',
				titleAttr: 	'PDF',
				title: 		'PDF',
				className: 	'btn-warning'
			}
		],
		scrollX: 		true,
		scrollY:        "400px",
		scrollCollapse: true,
		paging:         false

	} );

	if (location.pathname == '/management/dashboard' ) {
		Highcharts.chart('chartUser', {
			data: {
				table: 'tbluser'
			},
			chart: {
				height: 400,
				type: 'column'
			},
			title: {
				text: 'Total Users Report'
			},
			yAxis: {
				allowDecimals: false,
				title: {
					text: 'Units'
				}
			},
			tooltip: {
				formatter: function () {
					return '<b>' + this.series.name + '</b><br/>' +
						this.point.y + ' ' + this.point.name.toLowerCase();
				}
			}
		});
		Highcharts.chart('chartBooking', {
			data: {
				table: 'tblbooking'
			},
			chart: {
				height: 400,
				type: 'column'
			},
			title: {
				text: 'Total Booking Report'
			},
			yAxis: {
				allowDecimals: false,
				title: {
					text: 'Units'
				}
			},
			tooltip: {
				formatter: function () {
					return '<b>' + this.series.name + '</b><br/>' +
						this.point.y + ' ' + this.point.name.toLowerCase();
				}
			}
		});
	}
	

});

function pg_navigation() {
	var main_route = window.location.pathname;
	var page = this.document.getElementsByClassName('page');
	$('.page').removeClass('active');
	$('#page li a[href$="'+main_route+'"]').parent('li').addClass('active');
};

function del_User(u_id) {
	data = {'del_u_id':u_id}
	Swal.fire({
		title: 'Are you sure want to delete this record?',
		text: "Click delete button to complete.",
		type: 'info',
		showCancelButton: true,
		closeOnConfirm: false,
		closeOnCancel: true,
		confirmButtonText: 'Delete'
	}).then((result) => {
	if (result.value) {
		$.ajax(
		{
			url: '/management/delUser',
			type: 'DELETE',
			contentType: "application/json",
			data : JSON.stringify(data),
			success: function(msg)
			{
				window.location.reload()
			},
			error: function(xmlhttprequest, textstatus, message, response) {
				
			}

		});
	}});	
};

function add_Route() {
	if ($('#r_name').val()=='') {
		Swal.fire({
			type: 'warning',
			title: "Require information.",
			text: "Please enter rotue name to save the record." 
		});
	}
	else if ($('#r_price').val()=='' ) {
		Swal.fire({
			type: 'warning',
			title: "Require information.",
			text: "Please enter price to save the record." 
		});
	}
	else if (parseFloat($('#r_price').val())<0) {
		Swal.fire({
			type: 'error',
			title: "Invalid price format.",
			text: "Please enter number that is greater than zero." 
		});
	}
	else {
		Swal.fire({
		title: 'Are you sure want to save this record?',
		text: "Click save button to complete.",
		type: 'info',
		showCancelButton: true,
		closeOnConfirm: false,
		closeOnCancel: true,
		confirmButtonText: 'Save'
		}).then((result) => {
			if (result.value) {
				document.getElementById('routeAddForm').submit();
				// window.location.href = '/management/route';	
		}});
	}
};

function edit_Route(r_id) {
	data = {'r_id':r_id}
	
	$.ajax(
	{
		url: '/management/route',
		type: 'PUT',
		dataType : "json",
		contentType: "application/json",
		data : JSON.stringify(data),
		success: function(message)
		{
			$('#edit_r_id').val(message[0])
			$('#edit_r_name').val(message[1])
			tinymce.get('edit_r_desc').setContent(message[2])
			$('#edit_r_price').val(message[3])
		},
		error: function(xmlhttprequest, textstatus, message, response) {
			alert(response)
			alert(message)
			alert(textstatus)
		}
	});

};

function del_Route(r_id) {
	data = {'del_r_id':r_id}
	Swal.fire({
		title: 'Are you sure want to delete this record?',
		text: "Click delete button to complete.",
		type: 'info',
		showCancelButton: true,
		closeOnConfirm: false,
		closeOnCancel: true,
		confirmButtonText: 'Delete'
	}).then((result) => {
	if (result.value) {
		$.ajax(
		{
			url: '/management/delRoute',
			type: 'DELETE',
			contentType: "application/json",
			data : JSON.stringify(data),
			success: function(msg)
			{
				window.location.reload()
			},
			error: function(xmlhttprequest, textstatus, message, response) {
				
			}

		});
	}});
};

function update_Route() {
	if ($('#edit_r_name').val()=='') {
		Swal.fire({
			type: 'warning',
			title: "Require information.",
			text: "Please enter rotue name to save the record." 
		});
	}
	else if ($('#edit_r_price').val()=='' ) {
		Swal.fire({
			type: 'warning',
			title: "Require information.",
			text: "Please enter price to save the record." 
		});
	}
	else if (parseFloat($('#edit_r_price').val())<0) {
		Swal.fire({
			type: 'error',
			title: "Invalid price format.",
			text: "Please enter number that is greater than zero." 
		});
	}
	else {
		Swal.fire({
		title: 'Are you sure want to update this record?',
		text: "Click update button to complete.",
		type: 'info',
		showCancelButton: true,
		closeOnConfirm: false,
		closeOnCancel: true,
		confirmButtonText: 'Update'
		}).then((result) => {
			if (result.value) {
				$("#edit_r_id").prop('disabled', false);
				document.getElementById('routeEditForm').submit();
		}});
	}
}

function add_Jetty() {
	if ($('#j_name').val()=='') {
		Swal.fire({
			type: 'warning',
			title: "Require information.",
			text: "Please enter jetty name to save the record." 
		});
	}
	else if ($('#bus_stop').val()=='' ) {
		Swal.fire({
			type: 'warning',
			title: "Require information.",
			text: "Please enter bus stop to save the record." 
		});
	}
	else if ($('#jetty_rid').val()=='0') {
		Swal.fire({
			type: 'warning',
			title: "Require information.",
			text: "Please choose route name to save the record." 
		});
	}
	else if ($('#j_order').val()=='') {
		Swal.fire({
			type: 'warning',
			title: "Require information.",
			text: "Please enter jetty order to save the record." 
		});
	}
	else if (parseInt($('#edit_j_order').val())<0) {
		Swal.fire({
			type: 'error',
			title: "Invalid number format.",
			text: "Please enter jetty number that is greater than zero." 
		});
	}
	else {
		Swal.fire({
		title: 'Are you sure want to save this record?',
		text: "Click save button to complete.",
		type: 'info',
		showCancelButton: true,
		closeOnConfirm: false,
		closeOnCancel: true,
		confirmButtonText: 'Save'
		}).then((result) => {
			if (result.value) {
				document.getElementById('jettyAddForm').submit();
				// window.location.href = '/management/jetty';	

		}});
	}
};

function edit_Jetty(j_id) {
	data = {'j_id':j_id}
	$.ajax(
	{
		url: '/management/jetty',
		type: 'PUT',
		dataType : "json",
		contentType: "application/json",
		data : JSON.stringify(data),
		success: function(message)
		{
			$('#edit_j_id').val(message[0])
			$('#edit_j_name').val(message[1])
			$('#edit_j_bus_stop').val(message[2])
			var r_id = document.getElementsByClassName('edit_jetty_rid');
			for (var i = 0; i < r_id.length; i++) {
				if(r_id[i].value == message[3])
				{
					r_id[i].selected = true
				}
			}
			tinymce.get('edit_j_add').setContent(message[5])
			$('#edit_j_order').val(message[4])

		},
		error: function(xmlhttprequest, textstatus, message, response) {
			alert(response)
			alert(message)
			alert(textstatus)
		}
	});
};

function update_Jetty() {
	if ($('#edit_j_name').val()=='') {
		Swal.fire({
			type: 'warning',
			title: "Require information.",
			text: "Please enter jetty name to save the record." 
		});
	}
	else if ($('#edit_j_bus_stop').val()=='' ) {
		Swal.fire({
			type: 'warning',
			title: "Require information.",
			text: "Please enter bus stop to save the record." 
		});
	}
	else if ($('#edit_jetty_rid').val()=='0') {
		Swal.fire({
			type: 'warning',
			title: "Require information.",
			text: "Please choose route name to save the record." 
		});
	}
	else if ($('#edit_j_order').val()=='') {
		Swal.fire({
			type: 'warning',
			title: "Require information.",
			text: "Please enter jetty order to save the record." 
		});
	}
	else if (parseInt($('#edit_j_order').val())<0) {
		Swal.fire({
			type: 'error',
			title: "Invalid number format.",
			text: "Please enter jetty number that is greater than zero." 
		});
	}
	else {

		Swal.fire({
		title: 'Are you sure want to update this record?',
		text: "Click update button to complete.",
		type: 'info',
		showCancelButton: true,
		closeOnConfirm: false,
		closeOnCancel: true,
		confirmButtonText: 'Update'
		}).then((result) => {
			if (result.value) {
				$("#edit_j_id").prop('disabled', false);
				document.getElementById('jettyEditForm').submit();
		}});
	}
};

function del_Jetty(j_id) {
	data = {'del_j_id':j_id}
	Swal.fire({
		title: 'Are you sure want to delete this record?',
		text: "Click delete button to complete.",
		type: 'info',
		showCancelButton: true,
		closeOnConfirm: false,
		closeOnCancel: true,
		confirmButtonText: 'Delete'
	}).then((result) => {
	if (result.value) {
		$.ajax(
		{
			url: '/management/delJetty',
			type: 'DELETE',
			contentType: "application/json",
			data : JSON.stringify(data),
			success: function(msg)
			{
				window.location.reload()
			},
			error: function(xmlhttprequest, textstatus, message, response) {
				
			}

		});
	}});
};

function add_Schedule() {
	if ($('#s_time').val() == '') {
		Swal.fire({
			type: 'warning',
			title: "Require information.",
			text: "Please enter schedule time to save the record." 
		});
	}
	else if ($('#s_type').val() == '0') {
		Swal.fire({
			type: 'warning',
			title: "Require information.",
			text: "Please choose schedule type to save the record." 
		});
	}
	else if ($('#s_jid').val() == '0') {
		Swal.fire({
			type: 'warning',
			title: "Require information.",
			text: "Please choose jetty name to save the record." 
		});
	}
	else {
		Swal.fire({
		title: 'Are you sure want to save this record?',
		text: "Click save button to complete.",
		type: 'info',
		showCancelButton: true,
		closeOnConfirm: false,
		closeOnCancel: true,
		confirmButtonText: 'Save'
		}).then((result) => {
			if (result.value) {
				document.getElementById('scheduleAddForm').submit();
		}});
	}	
};

function edit_Schedule(s_id) {
	data = {'s_id':s_id}
	$.ajax(
	{
		url: '/management/schedule',
		type: 'PUT',
		dataType : "json",
		contentType: "application/json",
		data : JSON.stringify(data),
		success: function(message)
		{
			$('#edit_s_id').val(message[0])
			console.log(message[1])
			$('#edit_s_time').val(message[1])	
			var s_type = document.getElementsByClassName('edit_s_type');
			for (var i = 0; i < s_type.length; i++) {
				if(s_type[i].value == message[2])
				{
					s_type[i].selected = true
				}
			}
			var j_id = document.getElementsByClassName('edit_s_jid');
			for (var i = 0; i < j_id.length; i++) {
				if(j_id[i].value == message[3])
				{
					j_id[i].selected = true
				}
			}

		},
		error: function(xmlhttprequest, textstatus, message, response) {
			alert(response)
			alert(message)
			alert(textstatus)
		}
	});
};

function update_Schedule() {
	if ($('#edit_s_time').val() == '') {
		Swal.fire({
			type: 'warning',
			title: "Require information.",
			text: "Please enter schedule time to save the record." 
		});
	}
	else if ($('#edit_s_type').val() == '0') {
		Swal.fire({
			type: 'warning',
			title: "Require information.",
			text: "Please choose schedule type to save the record." 
		});
	}
	else if ($('#edit_s_jid').val() == '0') {
		Swal.fire({
			type: 'warning',
			title: "Require information.",
			text: "Please choose jetty name to save the record." 
		});
	}
	else {
		Swal.fire({
		title: 'Are you sure want to update this record?',
		text: "Click update button to complete.",
		type: 'info',
		showCancelButton: true,
		closeOnConfirm: false,
		closeOnCancel: true,
		confirmButtonText: 'Update'
		}).then((result) => {
			if (result.value) {
				$("#edit_s_id").prop('disabled', false);
				document.getElementById('scheduleEditForm').submit();
		}});
	}
}

function del_Schedule(s_id) {
	data = {'del_s_id':s_id}
	Swal.fire({
		title: 'Are you sure want to delete this record?',
		text: "Click delete button to complete.",
		type: 'info',
		showCancelButton: true,
		closeOnConfirm: false,
		closeOnCancel: true,
		confirmButtonText: 'Delete'
	}).then((result) => {
	if (result.value) {
		$.ajax(
		{
			url: '/management/delSchedule',
			type: 'DELETE',
			contentType: "application/json",
			data : JSON.stringify(data),
			success: function(msg)
			{
				window.location.reload()
			},
			error: function(xmlhttprequest, textstatus, message, response) {
				
			}

		});
	}});
};

function add_Info() {
	if ($('#i_title').val()=='') {
		Swal.fire({
			type: 'warning',
			title: "Require information.",
			text: "Please enter title to save the record." 
		});
	}
	else if ($('#i_type').val()=='0') {
		Swal.fire({
			type: 'warning',
			title: "Require information.",
			text: "Please choose info type to save the record." 
		});
	}
	else {
		Swal.fire({
		title: 'Are you sure want to save this record?',
		text: "Click save button to complete.",
		type: 'info',
		showCancelButton: true,
		closeOnConfirm: false,
		closeOnCancel: true,
		confirmButtonText: 'Save'
		}).then((result) => {
			if (result.value) {
				document.getElementById('infoAddForm').submit();
		}});
	}
};

function edit_Info(i_id) {
	data = {'i_id':i_id}
	$.ajax(
	{
		url: '/management/info',
		type: 'PUT',
		dataType : "json",
		contentType: "application/json",
		data : JSON.stringify(data),
		success: function(message)
		{
			$('#edit_i_id').val(message[0])
			$('#edit_i_title').val(message[1])
			tinymce.get('edit_i_desc').setContent(message[2])
			var i_type = document.getElementsByClassName('edit_i_type');
			for (var i = 0; i < i_type.length; i++) {
				if(i_type[i].value == message[3])
				{
					i_type[i].selected = true
				}
			}
			$('#img img').attr("src","/static/images/info/"+message[4])
			$('#edit_i_img').val("Null")


		},
		error: function(xmlhttprequest, textstatus, message, response) {
			alert(response)
			alert(message)
			alert(textstatus)
		}
	});
};

function update_Info() {
	if ($('#edit_i_title').val()=='') {
		Swal.fire({
			type: 'warning',
			title: "Require information.",
			text: "Please enter title to save the record." 
		});
	}
	else if ($('#edit_i_type').val()=='0') {
		Swal.fire({
			type: 'warning',
			title: "Require information.",
			text: "Please choose info type to save the record." 
		});
	}
	else {
		Swal.fire({
		title: 'Are you sure want to update this record?',
		text: "Click update button to complete.",
		type: 'info',
		showCancelButton: true,
		closeOnConfirm: false,
		closeOnCancel: true,
		confirmButtonText: 'Update'
		}).then((result) => {
			if (result.value) {
				$("#edit_i_id").prop('disabled', false);
				document.getElementById('infoEditForm').submit();
		}});
	}
}

function del_Info(i_id) {
	data = {'del_i_id':i_id}
	Swal.fire({
		title: 'Are you sure want to delete this record?',
		text: "Click delete button to complete.",
		type: 'info',
		showCancelButton: true,
		closeOnConfirm: false,
		closeOnCancel: true,
		confirmButtonText: 'Delete'
	}).then((result) => {
	if (result.value) {
		$.ajax(
		{
			url: '/management/delInfo',
			type: 'DELETE',
			contentType: "application/json",
			data : JSON.stringify(data),
			success: function(msg)
			{
				window.location.reload()
			},
			error: function(xmlhttprequest, textstatus, message, response) {
				
			}

		});
	}});
};

function confirm_Booking(b_id) {
	data = {'b_id':b_id}
	Swal.fire({
		title: 'Are you sure want to confirm this record?',
		text: "Click confirm button to complete.",
		type: 'info',
		showCancelButton: true,
		closeOnConfirm: false,
		closeOnCancel: true,
		confirmButtonText: 'Confirm'
	}).then((result) => {
	if (result.value) {
		$.ajax({
			url: '/management/confirmBooking',
			type: 'PUT',
			contentType: "application/json",
			data : JSON.stringify(data),
			success: function(msg)
			{
				window.location.reload()
			},
			error: function(xmlhttprequest, textstatus, message, response) {
				
			}
		});
	}});
};

function cancel_Booking(b_id) {
	data = {'b_id':b_id}
	Swal.fire({
		title: 'Are you sure want to cancel this record?',
		text: "Click ok button to complete.",
		type: 'info',
		showCancelButton: true,
		closeOnConfirm: false,
		closeOnCancel: true,
		confirmButtonText: 'OK'
	}).then((result) => {
	if (result.value) {
		$.ajax({
			url: '/management/cancelBooking',
			type: 'PUT',
			contentType: "application/json",
			data : JSON.stringify(data),
			success: function(msg)
			{
				window.location.reload()
			},
			error: function(xmlhttprequest, textstatus, message, response) {
				
			}
		});
	}});
};

function view_Mail(m_id) {
	data = {'m_id':m_id}
	$.ajax({
		url: '/management/mail',
		type: 'PUT',
		dataType : "json",
		contentType: "application/json",
		data : JSON.stringify(data),
		success: function(message)
		{
			$('#m_id').val(message[0])
			$('#subject').val(message[1])
			$('#sender_name').val(message[3])
			$('#sender_email').val(message[4])
			tinymce.get('message').setContent(message[2])
			$('#posted_date').html(message[6])
			tinyMCE.get('message').getBody().setAttribute('contenteditable', false);
		},
		error: function(xmlhttprequest, textstatus, message, response) {
			
		}
	});
};

function del_Mail(m_id) {
	data = {'del_m_id':m_id}
	Swal.fire({
		title: 'Are you sure want to delete this record?',
		text: "Click delete button to complete.",
		type: 'info',
		showCancelButton: true,
		closeOnConfirm: false,
		closeOnCancel: true,
		confirmButtonText: 'Delete'
	}).then((result) => {
	if (result.value) {
		$.ajax(
		{
			url: '/management/delMail',
			type: 'DELETE',
			contentType: "application/json",
			data : JSON.stringify(data),
			success: function(msg)
			{
				window.location.reload()
			},
			error: function(xmlhttprequest, textstatus, message, response) {
				
			}

		});
	}});	
};

function changePwd(m_id) {
	var o_pwd = $('#oldPwd').val()
	var n_pwd = $('#newPwd').val()
	var c_pwd = $('#con_newPwd').val()
	if (o_pwd == '') {
		Swal.fire({
			type: 'warning',
			title: "Require old password.",
			text: "Please enter old password." 
		});
	}
	else if (n_pwd == '' || c_pwd == '') {
		Swal.fire({
			type: 'warning',
			title: "Require new password.",
			text: "Please enter new password." 
		});
	}
	else if (n_pwd != c_pwd) {
		Swal.fire({
			type: 'error',
			title: "Unmatch confirm password.",
			text: "Please enter same new password and confirm password." 
		});
	}
	else
	{
		var data = {'m_id':m_id,'new_pwd':c_pwd,'old_pwd':o_pwd} 
		$.ajax(
		{
			url: '/management/chngPwd',
			type: 'PUT',
			contentType: "application/json",
			data : JSON.stringify(data),
			success: function(msg)
			{
				if (msg == 'Success') {
					Swal.fire({
						type: 'success',
						title: "Changed password successfuly.",
						text: "The new password was changed successfuly." 
					});

				} 
				else if (msg == 'Old') {
					Swal.fire({
						type: 'error',
						title: "Invalid old password.",
						text: "Please enter old password again." 
					});
				}
				else {
					Swal.fire({
						type: 'error',
						title: "Error changing new password." 
					});
				}
			},
			error: function(xmlhttprequest, textstatus, message, response) {
				
			}

		});
	}
}
