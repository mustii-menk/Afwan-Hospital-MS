<?php
session_start();
?>
<style>
#mmenu, #mmenu ul {
margin: 0;
padding: 0;
list-style: none;
}
#mmenu {
width: 100%;
/*margin: 60px auto;*/
border: 1px solid #222;
background-color: #111;
background-image: -moz-linear-gradient(#444, #111); 
background-image: -webkit-gradient(linear, left top, left bottom, from(#444), to(#111)); 
background-image: -webkit-linear-gradient(#444, #111); 
background-image: -o-linear-gradient(#444, #111);
background-image: -ms-linear-gradient(#444, #111);
background-image: linear-gradient(#444, #111);
-moz-border-radius: 6px;
-webkit-border-radius: 6px;
border-radius: 6px;
-moz-box-shadow: 0 1px 1px #777, 0 1px 0 #666 inset;
-webkit-box-shadow: 0 1px 1px #777, 0 1px 0 #666 inset;
box-shadow: 0 1px 1px #777, 0 1px 0 #666 inset;
}
#mmenu:before,
#mmenu:after {
content: "";
display: table;
}
#mmenu:after {
clear: both;
}
#mmenu {
zoom:1;
}
#mmenu li {
float: left;
border-right: 1px solid #222;
-moz-box-shadow: 1px 0 0 #444;
-webkit-box-shadow: 1px 0 0 #444;
box-shadow: 1px 0 0 #444;
position: relative;
}
#mmenu a {
float: left;
padding: 12px 30px;
color: #999;
text-transform: uppercase;
font: bold 12px Arial, Helvetica;
text-decoration: none;
text-shadow: 0 1px 0 #000;
}
#mmenu li:hover > a {
color: #fafafa;
}
*html #mmenu li a:hover { /* IE6 only */
color: #fafafa;
}
#mmenu ul {
margin: 20px 0 0 0;
_margin: 0; /*IE6 only*/
opacity: 0;
visibility: hidden;
position: absolute;
top: 38px;
left: 0;
z-index: 9999; 
background: #444; 
background: -moz-linear-gradient(#444, #111);
background-image: -webkit-gradient(linear, left top, left bottom, from(#444), to(#111));
background: -webkit-linear-gradient(#444, #111); 
background: -o-linear-gradient(#444, #111); 
background: -ms-linear-gradient(#444, #111); 
background: linear-gradient(#444, #111);
-moz-box-shadow: 0 -1px rgba(255,255,255,.3);
-webkit-box-shadow: 0 -1px 0 rgba(255,255,255,.3);
box-shadow: 0 -1px 0 rgba(255,255,255,.3); 
-moz-border-radius: 3px;
-webkit-border-radius: 3px;
border-radius: 3px;
-webkit-transition: all .2s ease-in-out;
-moz-transition: all .2s ease-in-out;
-ms-transition: all .2s ease-in-out;
-o-transition: all .2s ease-in-out;
transition: all .2s ease-in-out; 
} 
#mmenu li:hover > ul {
opacity: 1;
visibility: visible;
margin: 0;
}
#mmenu ul ul {
top: 0;
left: 150px;
margin: 0 0 0 20px;
_margin: 0; /*IE6 only*/
-moz-box-shadow: -1px 0 0 rgba(255,255,255,.3);
-webkit-box-shadow: -1px 0 0 rgba(255,255,255,.3);
box-shadow: -1px 0 0 rgba(255,255,255,.3); 
}
#mmenu ul li {
float: none;
display: block;
border: 0;
_line-height: 0; /*IE6 only*/
-moz-box-shadow: 0 1px 0 #111, 0 2px 0 #666;
-webkit-box-shadow: 0 1px 0 #111, 0 2px 0 #666;
box-shadow: 0 1px 0 #111, 0 2px 0 #666;
}
#mmenu ul li:last-child { 
-moz-box-shadow: none;
-webkit-box-shadow: none;
box-shadow: none; 
}
#mmenu ul a { 
padding: 10px;
width: 130px;
_height: 10px; /*IE6 only*/
display: block;
white-space: nowrap;
float: none;
text-transform: none;
}
#mmenu ul a:hover {
background-color: #0186ba;
background-image: -moz-linear-gradient(#04acec, #0186ba); 
background-image: -webkit-gradient(linear, left top, left bottom, from(#04acec), to(#0186ba));
background-image: -webkit-linear-gradient(#04acec, #0186ba);
background-image: -o-linear-gradient(#04acec, #0186ba);
background-image: -ms-linear-gradient(#04acec, #0186ba);
background-image: linear-gradient(#04acec, #0186ba);
}
#mmenu ul li:first-child > a {
-moz-border-radius: 3px 3px 0 0;
-webkit-border-radius: 3px 3px 0 0;
border-radius: 3px 3px 0 0;
}
#mmenu ul li:first-child > a:after {
content: '';
position: absolute;
left: 40px;
top: -6px;
border-left: 6px solid transparent;
border-right: 6px solid transparent;
border-bottom: 6px solid #444;
}
#mmenu ul ul li:first-child a:after {
left: -6px;
top: 50%;
margin-top: -6px;
border-left: 0; 
border-bottom: 6px solid transparent;
border-top: 6px solid transparent;
border-right: 6px solid #3b3b3b;
}
#mmenu ul li:first-child a:hover:after {
border-bottom-color: #04acec; 
}
#mmenu ul ul li:first-child a:hover:after {
border-right-color: #0299d3; 
border-bottom-color: transparent; 
}
#mmenu ul li:last-child > a {
-moz-border-radius: 0 0 3px 3px;
-webkit-border-radius: 0 0 3px 3px;
border-radius: 0 0 3px 3px;
}

#mmenu li a:hover, #mmenu li a.active{color:#666666; background-color:aqua;}
</style>
<?php
if(isset($_SESSION[adminid]))
{
?>
<div id="mmenu">
<li><a href="adminaccount.php" <?php if(basename($_SERVER['PHP_SELF']) == "adminaccount.php"){ echo ' class="active"'; } ?>>Account</a></li>
<li>
<a href="#" <?php if(basename($_SERVER['PHP_SELF']) == "adminprofile.php" OR basename($_SERVER['PHP_SELF']) == "admin.php" OR basename($_SERVER['PHP_SELF']) == "viewadmin.php" OR basename($_SERVER['PHP_SELF']) == "adminchangepassword.php"){ echo ' class="active"'; } ?>>Profile</a>
    <ul>
    <li><a href="adminprofile.php" <?php if(basename($_SERVER['PHP_SELF']) == "adminprofile.php"){ echo ' class="active"'; } ?>>Admin Profile</a></li>
    <li><a href="adminchangepassword.php" <?php if(basename($_SERVER['PHP_SELF']) == "adminchangepassword.php"){ echo ' class="active"'; } ?>>Change Password</a></li>
        <li><a href="admin.php" <?php if(basename($_SERVER['PHP_SELF']) == "admin.php"){ echo ' class="active"'; } ?> style="width:150px;">Add Admin</a></li>
    	<li><a href="viewadmin.php" <?php if(basename($_SERVER['PHP_SELF']) == "viewadmin.php"){ echo ' class="active"'; } ?> style="width:150px;">View Admin</a></li>
    </ul>
</li>
<li><a href="#" <?php if(basename($_SERVER['PHP_SELF']) == "addpatient.php" OR basename($_SERVER['PHP_SELF']) == "viewpatient.php" OR basename($_SERVER['PHP_SELF']) == "patient.php" OR basename($_SERVER['PHP_SELF']) == "patientreport.php"){ echo ' class="active"'; } ?>>Patient</a>
    <ul>
   <li><a href="addpatient.php" <?php if(basename($_SERVER['PHP_SELF']) == "addpatient.php"){ echo ' class="active"'; } ?>>Add Patient</a></li>
        <li><a href="viewpatient.php" <?php if(basename($_SERVER['PHP_SELF']) == "viewpatient.php"){ echo ' class="active"'; } ?>>View Patient Records</a></li>
    </ul>
</li>
<li>
<a href="#" <?php if(basename($_SERVER['PHP_SELF']) == "appointment.php" OR basename($_SERVER['PHP_SELF']) == "viewappointmentpending.php" OR basename($_SERVER['PHP_SELF']) == "viewappointmentapproved.php" OR basename($_SERVER['PHP_SELF']) == "appointmentapproval.php"){ echo ' class="active"'; } ?>>Appointment</a>
    <ul>
    <li><a href="appointment.php" style="width:200px;" <?php if(basename($_SERVER['PHP_SELF']) == "appointment.php"){ echo ' class="active"'; } ?>>New Appointment</a></li>
    <li><a href="viewappointmentpending.php" style="width:200px;" <?php if(basename($_SERVER['PHP_SELF']) == "viewappointmentpending.php"){ echo ' class="active"'; } ?>>View Pending Appointments</a></li>
    <li><a href="viewappointmentapproved.php" style="width:200px;" <?php if(basename($_SERVER['PHP_SELF']) == "viewappointmentapproved.php"){ echo ' class="active"'; } ?>>View Approved Appointments</a></li>
    </ul>
</li>
<li><a href="viewtreatmentrecord.php" <?php if(basename($_SERVER['PHP_SELF']) == "viewtreatmentrecord.php"){ echo ' class="active"'; } ?>>Treatment</a></li>
<li>
<a href="#" <?php if(basename($_SERVER['PHP_SELF']) == "doctor.php" OR basename($_SERVER['PHP_SELF']) == "Viewdoctor.php" OR basename($_SERVER['PHP_SELF']) == "doctortimings.php" OR basename($_SERVER['PHP_SELF']) == "viewdoctortimings.php"){ echo ' class="active"'; } ?>>Doctor</a>
    <ul>
    <li><a href="doctor.php" <?php if(basename($_SERVER['PHP_SELF']) == "doctor.php"){ echo ' class="active"'; } ?>>Add Doctor</a></li>
    <li><a href="Viewdoctor.php" <?php if(basename($_SERVER['PHP_SELF']) == "Viewdoctor.php"){ echo ' class="active"'; } ?>>View Doctor</a></li>
     <li><a href="doctortimings.php" <?php if(basename($_SERVER['PHP_SELF']) == "doctortimings.php"){ echo ' class="active"'; } ?>>Add Doctor Timings</a></li>
    <li><a href="viewdoctortimings.php" <?php if(basename($_SERVER['PHP_SELF']) == "viewdoctortimings.php"){ echo ' class="active"'; } ?>>View Doctor Timings</a></li>
 </ul>
</li>
    
<li>
<a href="#" <?php if(basename($_SERVER['PHP_SELF']) == "department.php" OR basename($_SERVER['PHP_SELF']) == "Viewdepartment.php" OR basename($_SERVER['PHP_SELF']) == "treatment.php" OR basename($_SERVER['PHP_SELF']) == "viewtreatment.php" OR basename($_SERVER['PHP_SELF']) == "medicine.php" OR basename($_SERVER['PHP_SELF']) == "Viewmedicine.php"){ echo ' class="active"'; } ?>>Settings</a>
    <ul>
  		
      
       	<li><a href="department.php" style="width:150px;" <?php if(basename($_SERVER['PHP_SELF']) == "department.php"){ echo ' class="active"'; } ?>>Add Department</a></li>
    	<li><a href="Viewdepartment.php" style="width:150px;" <?php if(basename($_SERVER['PHP_SELF']) == "Viewdepartment.php"){ echo ' class="active"'; } ?>>View Department</a></li>
        <li><a href="treatment.php" style="width:150px;" <?php if(basename($_SERVER['PHP_SELF']) == "treatment.php"){ echo ' class="active"'; } ?>>Add Treatment type</a></li>
        <li><a href="viewtreatment.php" style="width:150px;" <?php if(basename($_SERVER['PHP_SELF']) == "viewtreatment.php"){ echo ' class="active"'; } ?>>View Treatment types</a></li>
       	<li><a href="medicine.php" style="width:150px;" <?php if(basename($_SERVER['PHP_SELF']) == "medicine.php"){ echo ' class="active"'; } ?>>Add Medicine</a></li>
    	<li><a href="Viewmedicine.php" style="width:150px;" <?php if(basename($_SERVER['PHP_SELF']) == "Viewmedicine.php"){ echo ' class="active"'; } ?>>View Medicine</a></li>
      </ul>
</li>
<li><a href="logout.php">Log Out</a></li>
</div>
<?php
}
?>
<?php
if(isset($_SESSION[doctorid]))
{
?>
<div id="mmenu">
    <li><a href="doctoraccount.php" <?php if(basename($_SERVER['PHP_SELF']) == "doctoraccount.php"){ echo ' class="active"'; } ?>>Account</a></li>
    <li>
    <a href="#" <?php if(basename($_SERVER['PHP_SELF']) == "doctorprofile.php" OR basename($_SERVER['PHP_SELF']) == "doctorchangepassword.php"){ echo ' class="active"'; } ?>>Settings</a>
        <ul>
       <li><a href="doctorprofile.php" <?php if(basename($_SERVER['PHP_SELF']) == "doctorprofile.php"){ echo ' class="active"'; } ?>>Profile</a></li>
            <li><a href="doctorchangepassword.php" <?php if(basename($_SERVER['PHP_SELF']) == "doctorchangepassword.php"){ echo ' class="active"'; } ?>>Change Password</a></li>
          </ul>
    </li>
    <li>
    <a href="#" <?php if(basename($_SERVER['PHP_SELF']) == "viewappointmentpending.php" OR basename($_SERVER['PHP_SELF']) == "viewappointmentapproved.php" OR basename($_SERVER['PHP_SELF']) == "appointmentapproval.php" OR basename($_SERVER['PHP_SELF']) == "patientreport.php" OR basename($_SERVER['PHP_SELF']) == "prescription.php"){ echo ' class="active"'; } ?>>Appointment</a>
        <ul>
    <li><a href="viewappointmentpending.php" style="width:250px;" <?php if(basename($_SERVER['PHP_SELF']) == "viewappointmentpending.php"){ echo ' class="active"'; } ?>>View Pending Appointments</a></li>
    <li><a href="viewappointmentapproved.php" style="width:250px;" <?php if(basename($_SERVER['PHP_SELF']) == "viewappointmentapproved.php"){ echo ' class="active"'; } ?>>View Approved Appointments</a></li>
        </ul>
    </li>
    <li><a href="#" <?php if(basename($_SERVER['PHP_SELF']) == "viewpatient.php"){ echo ' class="active"'; } ?>>Patient</a>
        <ul>
       <li><a href="viewpatient.php" <?php if(basename($_SERVER['PHP_SELF']) == "viewpatient.php"){ echo ' class="active"'; } ?>>View Patient</a></li>
        </ul>
    </li>
       <li><a href="#" <?php if(basename($_SERVER['PHP_SELF']) == "doctortimings.php" OR basename($_SERVER['PHP_SELF']) == "viewdoctortimings.php"){ echo ' class="active"'; } ?>>Doctor Timings</a>
        <ul>
       <li><a href="doctortimings.php" <?php if(basename($_SERVER['PHP_SELF']) == "doctortimings.php"){ echo ' class="active"'; } ?>>Add Timings</a></li>
       <li><a href="viewdoctortimings.php" <?php if(basename($_SERVER['PHP_SELF']) == "viewdoctortimings.php"){ echo ' class="active"'; } ?>>View Timings</a></li>
        </ul>
    </li>
    <li>
    <a href="#" <?php if(basename($_SERVER['PHP_SELF']) == "viewtreatmentrecord.php" OR basename($_SERVER['PHP_SELF']) == "viewtreatment.php" OR basename($_SERVER['PHP_SELF']) == "treatmentrecord.php"){ echo ' class="active"'; } ?>>Treatment</a>
        <ul>
           <li><a href="viewtreatmentrecord.php" <?php if(basename($_SERVER['PHP_SELF']) == "viewtreatmentrecord.php"){ echo ' class="active"'; } ?>>View Treatment Records</a></li>
            <li><a href="viewtreatment.php" <?php if(basename($_SERVER['PHP_SELF']) == "viewtreatment.php"){ echo ' class="active"'; } ?>>View Treatment</a></li>
        </ul>
    </li>    
    
    <li>
 
    <li><a  href="viewdoctorconsultancycharge.php" <?php if(basename($_SERVER['PHP_SELF']) == "viewdoctorconsultancycharge.php"){ echo ' class="active"'; } ?> >Income Report</a></li>
        
		</ul>
  
    <li><a href="logout.php">Log Out</a></li>       
 </div>
<?php
}
?>
<?php
if(isset($_SESSION[patientid]))
{
?>
<div id="mmenu">
<li><a href="patientaccount.php" <?php if(basename($_SERVER['PHP_SELF']) == "patientaccount.php"){ echo ' class="active"'; } ?>>Account</a></li>
<li>
<a href="#" <?php if(basename($_SERVER['PHP_SELF']) == "patientappointment.php" OR basename($_SERVER['PHP_SELF']) == "viewappointment.php" OR basename($_SERVER['PHP_SELF']) == "patientreport.php"){ echo ' class="active"'; } ?>>Appointment</a>
    <ul>
    <li><a href="patientappointment.php" style="width:200px;" <?php if(basename($_SERVER['PHP_SELF']) == "patientappointment.php"){ echo ' class="active"'; } ?>>Add Appointment</a></li>
    <li><a href="viewappointment.php" style="width:200px;" <?php if(basename($_SERVER['PHP_SELF']) == "viewappointment.php"){ echo ' class="active"'; } ?>>View Appointments</a></li>
    </ul>
</li>
<li>
<a href="#" <?php if(basename($_SERVER['PHP_SELF']) == "patientprofile.php" OR basename($_SERVER['PHP_SELF']) == "patientchangepassword.php"){ echo ' class="active"'; } ?>>Profile</a>
    <ul>
    <li><a href="patientprofile.php" <?php if(basename($_SERVER['PHP_SELF']) == "patientprofile.php"){ echo ' class="active"'; } ?>>View Profile</a></li>
    <li><a href="patientchangepassword.php" <?php if(basename($_SERVER['PHP_SELF']) == "patientchangepassword.php"){ echo ' class="active"'; } ?>>Change Password</a></li>
    </ul>
</li>

<li>
<a href="#" <?php if(basename($_SERVER['PHP_SELF']) == "patviewprescription.php" OR basename($_SERVER['PHP_SELF']) == "prescriptionrecord.php"){ echo ' class="active"'; } ?>>Prescription</a>
    <ul >
       <li><a style="width:200px;" href="patviewprescription.php" <?php if(basename($_SERVER['PHP_SELF']) == "patviewprescription.php"){ echo ' class="active"'; } ?>>View Prescription Records</a></li>
    </ul>
</li>
<li>
<a href="#" <?php if(basename($_SERVER['PHP_SELF']) == "viewtreatmentrecord.php"){ echo ' class="active"'; } ?>>Treatment</a>
    <ul>
       <li><a href="viewtreatmentrecord.php" <?php if(basename($_SERVER['PHP_SELF']) == "viewtreatmentrecord.php"){ echo ' class="active"'; } ?>>View Treatment Records</a></li>
    </ul>
</li>



<li><a href="logout.php">Log Out</a></li>
</div>
<?php
}
?>