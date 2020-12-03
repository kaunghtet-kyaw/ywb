
// Functions for Sidenav for responsive
$(document).ready(function(){
  $('select').prop("selectedIndex", 0)
  var date  = new Date()
  var maxdate = new Date(date.getTime()+ (7 * 24 * 60 * 60 * 1000))

  $('#datetimepicker2').datetimepicker({
    useCurrent: true,
    minDate: date,
    maxDate:  maxdate,
    format: 'L',
    format: 'YYYY-MM-DD'
  });

  $('.show-menu').click(function(){
    $('.nav').toggleClass('active')
            

  })
  $('.hide-menu').click(function(){
    $('.nav').removeClass('active')
            
  })
  $('.body-cont').click(function(){
    $('.nav').removeClass('active')

  });
    $('ul li').click(function(){
      $(this).siblings().removeClass('active');
      $(this).toggleClass('active')
  })

  $(window).scroll(function() {
      if ($(this).scrollTop() >= 50) {   
        $('.buttn').show();  
      } 
      else {
        $('.buttn').hide(); 
      }
    });
      $('.buttn').click(function() { 
        $('body,html').animate({
            scrollTop : 0        
        }, 500);
      });

  });

// View Jetties through Routes

function openRoute(routeID) {

    var tabcontent = document.getElementsByClassName('tabcontent')
    var routeDtl = document.getElementsByClassName('route_'+routeID)

    for (var i = 0; i < tabcontent.length; i++) {
      tabcontent[i].style.display = 'none';
      
    }

    for (var i = 0; i < routeDtl.length; i++) {
      routeDtl[i].style.display = 'block';
      if (i == routeID) 
      {
        tabcontent[i].style.display = 'block';
      }
    }
  };

// JS Function for FAQ Page

function openFAQ(tName) {
      var i, panel;
      panel = document.getElementsByClassName("panel");
      for (i = 0; i < panel.length; i++) {
        panel[i].style.display = "none";
      }
      document.getElementById(tName).style.display = "block";
};

var acc = document.getElementsByClassName("accordion");
    var i;

    for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function() {
            this.classList.toggle("active");
            var panel = this.nextElementSibling;
            if (panel.style.maxHeight) {
                panel.style.maxHeight = null;
            } else {
                panel.style.maxHeight = panel.scrollHeight + "px";

            }
        });
};

function send_msg() {
  if (document.getElementById('sendForm').checkValidity()) {
      alert("Your Feedback is sent!");
  }
}

// View Schedules 
function openSch(schID) {

    var schcontent = document.getElementsByClassName('schcontent')
    var schDtl = document.getElementsByClassName('sch_'+schID)

    for (var i = 0; i < schcontent.length; i++) {
      schcontent[i].style.display = 'none';
      
    }

    for (var i = 0; i < schDtl.length; i++) {
      schDtl[i].style.display = 'table-row';
      if (i == schID) 
      {
        schcontent[i].style.display = 'table-row';
      }
    }
  };


// JS Function for Registeration and Reset Password

function openQuestion() {

  $('#register').hide();

  $('#setque').show(); //show payment output screen //show countdown

    var infowrp = document.getElementsByClassName('infowrp')
    var information = document.getElementsByClassName('info_'+infoID)

};


// Password Validatation

$(function ValidateForms(){
  

  var pass = $("#password");
  var confirm = $("#confirmpassword");
  var weaks = $("#weaks");
  var meds = $("#meds");
  var strongs = $("#strongs");

  confirm.attr("disabled", true);

  
  pass.keyup(function(){
      var strongRegex = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.{6,})");
      var mediumRegex = new RegExp("^(((?=.*[a-z])(?=.*[A-Z]))|((?=.*[a-z])(?=.*[0-9]))|((?=.*[A-Z])(?=.*[0-9])))(?=.{4,})");
    
      if(strongRegex.test(pass.val())){
        strongs.css("background", "green");
        confirm.attr("disabled", false);
        
      }
      else if (mediumRegex.test(pass.val()))
      {
        meds.css("background", "orange");
        strongs.css("background", "none");
        confirm.attr("disabled", false);
      }
      else{
        meds.css("background", "none");
        strongs.css("background", "none");
        weaks.css("background", "red");
        confirm.attr("disabled", true);
      }
    
      if (pass.val() == 0){
        weaks.css("background", "none");
        meds.css("background", "none");
        strongs.css("background", "none");
        confirm.attr("disabled", true);
      }
  })
  
  confirm.keyup(function(){
    if(pass.val() == confirm.val()){
      pass.css("border", "2px solid green");
      confirm.css("border", "2px solid green");
      $(".passdesc").hide();
      $('.selection').show(); 
        
    }
    else{
      confirm.css("border", "2px solid red");
    }
  })
})


// JS Function for Booking function 

// get selected option in sel (reference obtained above)

$( ".route-select" ).change(function() {
  var selectedEventType = this.options[this.selectedIndex].value;
    $('.jetty-select option').addClass('hidden');
    $('.jetty-select option').prop("selected", false);
    $('.jetty-select option[data-eventttype="' + selectedEventType + '"]').removeClass('hidden');
  
});

$( ".jetty-select" ).change(function() {

  var selectedJettyType = this.options[this.selectedIndex].value;
    $('.time-select option').addClass('hidden');
    $('.time-select option').prop("selected", false);
    $('.time-select option[data-eventttype="' + selectedJettyType + '"]').removeClass('hidden');
});

$( ".route-select" ).change(function() {
    $('.fare-select #r_price').removeClass('hidden');
    var selectedFareType = this.options[this.selectedIndex].value;
    $('.fare-select input').addClass('hidden');
    $('.fare-select input').prop("selected", false);
    if (selectedFareType == '0') {
      $('.fare-select #r_price').removeClass('hidden');
    }
    $('.fare-select input[data-eventttype="' + selectedFareType + '"]').removeClass('hidden');
    
});


$( ".route-selection" ).change(function() {
  var selectedRouteType = this.options[this.selectedIndex].value;
    $('.type-select option').addClass('hidden');
    $('.type-select option').prop("selected", false);
    $('.type-select option[data-eventttype="' + selectedRouteType + '"]').removeClass('hidden');
  
});

// get selected option as Types
// JS function for 'choose type' from view schedule 

$( ".type-select" ).change(function() {

  var selectedTimeType = this.options[this.selectedIndex].value;

   if (selectedTimeType == "All") {
    $(".detail-select").find("tr").each(function (i) {
      $(this).removeClass('hidden');
    });
  } else {
    // *=" means that if a data-custom type contains multiple values, it will find them
    $('.detail-select tr').addClass('hidden');
    $('.detail-select tr').prop("selected", false);
    $('.detail-select tr[data-eventttype="' + selectedTimeType + '"]').removeClass('hidden');
  }
});

// JS Function for Rating Function

$(function() {
  
  $(document).on({
    mouseover: function(event) {
      $(this).find('.far').addClass('star-over');
      $(this).prevAll().find('.far').addClass('star-over');
    },
    mouseleave: function(event) {
      $(this).find('.far').removeClass('star-over');
      $(this).prevAll().find('.far').removeClass('star-over');
    }
  }, '.rate');


  $(document).on('click', '.rate', function() {
    if ( 
      !$(this).find('.star').hasClass('rate-active') ) {
      $(this).siblings().find('.star').addClass('far').removeClass('fas rate-active');
      $(this).find('.star').addClass('rate-active fas').removeClass('far star-over');
      $(this).prevAll().find('.star').addClass('fas').removeClass('far star-over');
    } 
    else {
      console.log('has');
      // !$(this).find('.star').hasClass('rate-active')

    }
  });
  
});

// JS function for comment feature
function addCmtInfo(i_id){
  data = {'i_id':i_id,'i_user':$('#i_user').val(), 'i_desc':$("#i_desc").val()}
  
  if ($('#i_desc').val()=='') {
    Swal.fire({
      type: 'warning',
      title: "Require information.",
      text: "Please leave a comment" 
    });
  }
  else{
      Swal.fire({
      title: 'Do yo want to comment?',
      text: "Click OK button to complete.",
      type: 'info',
      showCancelButton: true,
      closeOnConfirm: false,
      closeOnCancel: true,
      confirmButtonText: 'OK'
  }).then((result) => {
  if (result.value) {
      $.ajax(
      {
        url: '/addcmtInfo',
        type: 'POST',
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

  }
};


// JS function for cancel booking feature

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
      url: '/cancelBooking',
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

// Open and Close Popup for Rating Function


function popupOpenClose(popup) {
  
  /* Open popup */
  $(popup).show();

  /* Close popup if user clicks on background */
  $(popup).click(function(e) {
    if ( e.target == this ) {
      if ($(popup).is(':visible')) {
        $(popup).hide();
      }
    }
  });

  /* Close popup and remove errors if user clicks on cancel or close buttons */
  $(popup).find("button[name=close]").on("click", function() {
    $(popup).hide();
  });
}

$(document).ready(function () {
  $("[data-js=open]").on("click", function() {
    popupOpenClose($(".popup"));
  });
});

function makeBking() {
  if ($('#r_select').val()=='0') {
    Swal.fire({
      type: 'warning',
      title: "Require information.",
      text: "Please select route." 
    });
  }
  else if ($('#j_select').val()=='0') {
    Swal.fire({
      type: 'warning',
      title: "Require information.",
      text: "Please select terminal." 
    });
  }

  else if ($('#t_select').val()=='0') {
    Swal.fire({
      type: 'warning',
      title: "Require information.",
      text: "Please enter depature time." 
    });
  }
  else if ($('#d_time').val()=='') {
    Swal.fire({
      type: 'warning',
      title: "Require information.",
      text: "Please enter depature date" 
    });
  }
  else if ($('#b_qty').val()=='0') {
    Swal.fire({
      type: 'warning',
      title: "Require information.",
      text: "Please enter No.of tickets." 
    });
  }
  else if ($('#f_name').val()=='') {
    Swal.fire({
      type: 'warning',
      title: "Require information.",
      text: "Please enter user name" 
    });
  }
  else if ($('#e_add').val()=='') {
    Swal.fire({
      type: 'warning',
      title: "Require information.",
      text: "Please enter email address" 
    });
  }

  else {
    Swal.fire({
    title: 'Do you want to book this ticket?',
    text: "Click Book button to complete.",
    type: 'info',
    showCancelButton: true,
    closeOnConfirm: false,
    closeOnCancel: true,
    confirmButtonText: 'Book'
    }).then((result) => {
      if (result.value) {
        document.getElementById('makeBkingForm').submit();
    }});
  }
};