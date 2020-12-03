# coding: utf-8
# Script:          server.py
# Description:     To support databse system of Yangon Water Bus Transportation System
# Author:          Kaung Htet Kyaw, Bo Bo Oo
# Created Date:    August 2019
# Require:         Internet connection, Need to import requests module in host os


from flask import Flask, render_template, request, session, redirect, url_for, g
import json, hashlib, os, datetime, re
from werkzeug.utils import secure_filename

import dbconn

app = Flask(__name__)
app.secret_key = os.urandom(24)
app.config['UPLOAD_FOLDER'] = os.getcwd()+r'\static\images\info\\'

try:
	if dbconn.db_conn:
		""" For Client side Site """
		@app.route('/login', methods = ['GET','POST'])
		def login():
			# Client Site login function
			msg = ''
			# Check user login or not
			if not 'u_email' in session:
				if (request.method == 'POST'):
					# Get login information and verify user
					u_email = request.form['EmailAdd']
					u_pwd = hashlib.sha256(request.form['UPwd'].encode()).hexdigest()
					usracc = dbconn.verifyUseracc(u_email,u_pwd)
					if usracc:
						# Get user information if verified                  
						session['uid'] = usracc[0]
						session['u_name'] = usracc[1]
						session['u_email'] = usracc[2]
						session['u_password'] = usracc[3]
						session['phoneno'] = usracc[4]
						session['gender'] = usracc[5]
						return redirect(url_for('home'))
					else:
						# Show error message if user could not verified
						msg = 'Your username or password is incorrect!'

				return render_template('login.html', msg=msg)
			return redirect(url_for('home'))
		
		# Reset user password
		@app.route('/resetpwd', methods = ['GET','POST'])
		def resetpwd():
			msg = ''
			# Check user login or not
			if ( request.method == 'POST'):
				# Get user log in 
				u_email = request.form['EmailAdd']
				ansOne = hashlib.sha256(request.form['Ans1'].encode()).hexdigest()
				ansTwo = hashlib.sha256(request.form['Ans2'].encode()).hexdigest()
				ansThree = hashlib.sha256(request.form['Ans3'].encode()).hexdigest()
				usracc = dbconn.verifyQuestion(u_email,ansOne,ansTwo,ansThree)
				if usracc:
					session['urID'] = usracc[0]                  
					return redirect(url_for('chpwd'))
				else:
					msg = 'Your username or password is incorrect!'
			return render_template('pwdrecovery.html', msg=msg)

		# Logout user
		@app.route('/logout')
		def logout():
			session.pop('loggedin', None)
			session.pop('uid', None)
			session.pop('u_email', None)
			return redirect(url_for('login'))

		# Redirect to about us in client site
		@app.route('/aboutus')
		def aboutus():
			return render_template('aboutus.html')

		# Redirect to news and events site
		@app.route('/news')
		def news():
			rst_record =dbconn.viewInfo()
			return render_template('news.html' , records = rst_record)

		# Redirect news and event detail information
		@app.route('/news/<iid>')
		def viewNews(iid):
			rst_record = dbconn.viewInfo(iid)
			rst_cmt_records = dbconn.viewComment(iid)
			return render_template('newsdetail.html' , records = rst_record, cmt_records = rst_cmt_records)

		# Get schedule information and redirect it
		@app.route('/schedules')
		def schedules():
			route_record = dbconn.viewR()
			sch_record = dbconn.viewS()
			rst_records =dbconn.viewRoute()
			return render_template('schedules.html',  records=rst_records,Sch_records=sch_record,  Rou_records = route_record)

		# View jetties information and redirect to it
		@app.route('/jetties')
		def jetties():
			route_record = dbconn.viewR()
			sch_record = dbconn.viewS()
			rst_records =dbconn.viewRoute()
			return render_template('jetties.html', Rou_records = route_record,Sch_records=sch_record,  records=rst_records)

		# Redirect to thank page 
		@app.route('/thanks')
		def thanks():
			if 'u_email' in session:
				return render_template('thanks.html')

			return redirect(url_for('login'))

		# View FAQ
		@app.route('/faq')
		def faq():
			return render_template('FAQ.html')

		# View term function
		@app.route('/terms')
		def terms():
			return render_template('term.html')

		# View policy function
		@app.route('/policy')
		def policy():
			return render_template('policy.html')

		# View Prohibited Article
		@app.route('/parti')
		def parti():
			return render_template('parti.html')

		# Forgot password function
		@app.route('/forget-password')
		def forgetpassword():
			return render_template('pwdrecovery.html')

		# Contact Us information
		@app.route('/contactus', methods=['GET', 'POST'])
		def contactus():
			msg = ''
			if (request.method == 'POST'):
				# Get information and send mail
				UserName = request.form['UserName']
				c_email = request.form['EmailAdd']
				subject = request.form['Subject']
				message = request.form['Message']
				pd = datetime.datetime.now()
				md = datetime.datetime.now()
				dbconn.sendMessage(subject, message,UserName, c_email, pd,md)
				msg = 'Your message is successfully sent!'
				return render_template('contactus.html', msg=msg)
			elif request.method == 'POST':
				msg = 'Sorry , your message cannot be sent!'
			# Show registration form with message
			return render_template('contactus.html', msg=msg)

		# User registration function
		@app.route('/register', methods=['GET', 'POST'])
		def register():
			msg = ''
			if (request.method == 'POST'):
				# Get user information and add user to database
				FullName = request.form['FullName']
				u_email = request.form['EmailAdd']
				u_pwd = hashlib.sha256(request.form['UPwd'].encode()).hexdigest()
				ansOne = hashlib.sha256(request.form['Ans1'].encode()).hexdigest()
				ansTwo = hashlib.sha256(request.form['Ans2'].encode()).hexdigest()
				ansThree = hashlib.sha256(request.form['Ans3'].encode()).hexdigest()
				PhNo = request.form['PhNo']
				Gender = request.form['Gender']
				cd = datetime.datetime.now()
				md = datetime.datetime.now()
				usracc = dbconn.verifyUseracc(u_email,u_pwd)
				# If account exists show error and validation checks
				if usracc:
					msg = 'Account already exists!'
				elif not re.match(r'[^@]+@[^@]+\.[^@]+', u_email):
					msg = 'Invalid email address!'
				elif not re.match(r'[A-Za-z]+', FullName):
					msg = 'Username must contain only characters!'
				elif not re.match(r'\+(9)(5)(9)[-]?\d+', PhNo):
					msg = 'User must enter valid Burmese Phone Number!'
				elif not FullName or not u_email or not u_pwd or not PhNo or not Gender or not ansOne or not ansTwo or not ansThree:
					msg = 'Please fill out the form!'
				else:
					dbconn.insertData (FullName,u_email,u_pwd,PhNo,Gender,ansOne, ansTwo, ansThree, cd,md)
					msg = 'Your useraccount has been successfully registered!'
					if msg:                  
						session['usr_email'] = request.form['EmailAdd']
						session['password'] = request.form['UPwd']
						return redirect(url_for('login'))
					return redirect(url_for('login'))
			elif request.method == 'POST':
				msg = 'Please fill out the form!'
			# Show registration form with message
			return render_template('register.html', msg=msg)

		# Change user password
		@app.route('/chpwd', methods=['GET', 'POST'])
		def chpwd():
			msg = ''
			if (request.method == 'POST'):
				# validate user and change password
				u_id= request.form['UID']
				u_pwd = hashlib.sha256( request.form['UPwd'].encode()).hexdigest()
				dbconn.changePwd(u_id,u_pwd)
				msg = 'Your password has been successfully changed!'
				return redirect(url_for('login'))
			elif request.method == 'POST':
				msg = 'Please fill out the form!'
			# Show registration form with message
			return render_template('chpwd.html', msg=msg)

		# Add rating to YWB System
		@app.route('/editRating', methods=['GET', 'POST'])
		def edit_rating():
			if 'u_email' in session:

				if (request.method == 'POST'):
					dbconn.makeRating( request.form['BRating'], session['uid'])
					return redirect(url_for('tickets'))
				return render_template('thanks.html')
			return redirect(url_for('booking'))
		# View booking function
		@app.route('/booking')
		def booking():
			if 'u_email' in session:
				sch_record = dbconn.viewS()
				rst_records =dbconn.viewRoute()
				jty_records = dbconn.viewJetty()
				return render_template('booking.html',  records=rst_records,Sch_records=sch_record, j_records = jty_records )
			return redirect(url_for('login'))
			

		# Make booking function
		@app.route('/makebooking', methods=['GET', 'POST'])
		def makebooking():
			msg = ''
			if 'u_email' in session:

				if (request.method == 'POST'):
					dbconn.makeBooking(request.form['SID'],session['uid'], request.form['BQty'], request.form['BDueDate'])
					# msg = 'Your Booking is successfully completed!'
					return render_template('thanks.html', records = dbconn.viewBooking())
					
				elif request.method == 'POST':
					msg = 'Sorry , your booking is not successful.!'
				# Show registration form with message
				return render_template('booking.html', msg=msg)

			return redirect(url_for('login'))


		# View booking ticket information
		@app.route('/tickets', methods = ["PUT","GET"])
		def tickets():
			if 'u_email' in session:
				if request.method == 'GET':
					return render_template('ticket.html', records = dbconn.viewBookingByUID(session['uid']), default = datetime_converter)
				else:
					return render_template('ticket.html', records = dbconn.viewBK())
			return redirect(url_for('login'))

		# Cancel Booking process
		@app.route('/cancelBooking', methods = ["PUT","GET"])
		def can_booking():
			if 'u_email' in session:
				if request.method == 'PUT':
					dbconn.canBooking(request.get_json().get('b_id'))
				return "Successfully cancel booking."
			return redirect(url_for('tickets'))

		# Add comment to the news or events
		@app.route('/addcmtInfo', methods=['GET', 'POST'])
		def addcmtInfo():
			if (request.method == 'POST'):
				temp = request.get_json()
				dbconn.sendComment( request.get_json()['i_desc'],session['uid'], request.get_json()['i_id'])
				return "Success"	
			return render_template('newsdetail.html')

		# client home page
		@app.route('/')
		def home():
			return render_template('home.html')

		# Client Site login function
		@app.route('/login/my', methods = ['GET','POST'])
		def loginmm():
			msg = ''
			if ( request.method == 'POST'):
				u_email = request.form['EmailAdd']
				u_pwd = hashlib.sha256(request.form['UPwd'].encode()).hexdigest()
				usracc = dbconn.verifyUseracc(u_email,u_pwd)
				if usracc:
					session['loggedin'] = True
					session['uid'] = usracc[0]
					session['u_name'] = usracc[1]
					session['u_email'] = usracc[2]
					session['u_password'] = usracc[3]
					session['phoneno'] = usracc[4]
					session['gender'] = usracc[5]
					return redirect(url_for('homemm'))
				else:
					msg = 'သင့်အီးမေးလိပ်စာ သို့ စကားဝှက်မှာ မှားယွင်းနေသည်။'
			return render_template('mm/login.html', msg=msg)

		# User registration function
		@app.route('/register/my', methods=['GET', 'POST'])
		def registermm():
			msg = ''
			if (request.method == 'POST'):
				FullName = request.form['FullName']
				u_email = request.form['EmailAdd']
				u_pwd = hashlib.sha256(request.form['UPwd'].encode()).hexdigest()
				ansOne = hashlib.sha256(request.form['Ans1'].encode()).hexdigest()
				ansTwo = hashlib.sha256(request.form['Ans2'].encode()).hexdigest()
				ansThree = hashlib.sha256(request.form['Ans3'].encode()).hexdigest()
				PhNo = request.form['PhNo']
				Gender = request.form['Gender']
				cd = datetime.datetime.now()
				md = datetime.datetime.now()
				usracc = dbconn.verifyUseracc(u_email,u_pwd)
				# If account exists show error and validation checks
				if usracc:
					msg = 'အကောင့်ရှိပြီးသားဖြစ်ပါသည်။!'
				elif not re.match(r'[^@]+@[^@]+\.[^@]+', u_email):
					msg = 'အီးမေးလ်လိပ်စာသည် မှားနေသည်။!'
				elif not re.match(r'[A-Za-z]+', FullName):
					msg = 'သင့်အမည်မှာ သင်္ချာကိန်းဂဏန်းတွေမထည့်သွင်းရပါ။'
				elif not re.match(r'\+(9)(5)(9)[-]?\d+', PhNo):
					msg = 'မြန်မာဖုန်းနံပါတ်အမှန်ကိုထည့်သွင်းပါ။'
				elif not FullName or not u_email or not u_pwd or not PhNo or not Gender:
					msg = 'ကျေးဇူးပြူ၍ အချက်အလက်များကို ဖြည့်ပါ။'
				else:
					dbconn.insertData (FullName,u_email,u_pwd,PhNo,Gender,ansOne, ansTwo,ansThree,cd,md)
					msg = 'သင့်အကောင့်ကိုမှတ်ပုံတင်ပြီးပါပြီ။!'
					if msg:                  
						session['email'] = request.form['EmailAdd']
						session['password'] = request.form['UPwd']
						return redirect(url_for('loginmm'))
					return redirect(url_for('loginmm'))
			elif request.method == 'POST':
				msg = 'ကျေးဇူးပြူ၍ အချက်အလက်များကိုဖြည့်ပါ။'
			# Show registration form with message
			return render_template('mm/register.html', msg=msg)

		# User logout function
		@app.route('/logout/my')
		def logoutmm():
			session.pop('loggedin', None)
			session.pop('uid', None)
			session.pop('u_email', None)
			return redirect(url_for('loginmm'))

		# Home Page of Myanmar Language
		@app.route('/my')
		def homemm():
			return render_template('mm/home.html')

		# Contact us function
		@app.route('/contactus/my', methods=['GET', 'POST'])
		def contactusmm():
			msg = ''
			if (request.method == 'POST'):
				# Get information and send mail
				UserName = request.form['UserName']
				c_email = request.form['EmailAdd']
				subject = request.form['Subject']
				message = request.form['Message']
				pd = datetime.datetime.now()
				md = datetime.datetime.now()
				dbconn.sendMessage(subject, message,UserName, c_email, pd,md)
				msg = 'သင့်မက်ဆေ့ချ် ကို ပေးပို့ပြီးပါပြီ။'
				return render_template('mm/contactus.html', msg=msg)
			elif request.method == 'POST':
				msg = 'သင့်မက်ဆေ့ချ်ကိုပေးပို့၍မရပါ။!'
			# Show registration form with message
			return render_template('mm/contactus.html', msg=msg)

		# Get schedule information and redirect it
		@app.route('/schedules/my')
		def schedulesmm():
			route_record = dbconn.viewR()
			sch_record = dbconn.viewS()
			rst_records =dbconn.viewRoute()
			# schedule_records =dbconn.viewS()
			return render_template('mm/schedules.html',  records=rst_records,Sch_records=sch_record,  Rou_records = route_record)

		# View jetties information and redirect to it
		@app.route('/jetties/my')
		def jettiesmm():
			route_record = dbconn.viewR()
			rst_records =dbconn.viewRoute()
			return render_template('mm/jetties.html', Rou_records = route_record, records=rst_records)

		# Redirect to about us in client site
		@app.route('/aboutus/my')
		def aboutusmm():
			return render_template('mm/aboutus.html')


		# View terms function
		@app.route('/terms/my')
		def termsmm():
			return render_template('mm/term.html')

		# View policy function
		@app.route('/policy/my')
		def policymm():
			return render_template('mm/policy.html')

		# View Prohibited Article
		@app.route('/parti/my')
		def partimm():
			return render_template('mm/parti.html')

		# Forgor password
		@app.route('/forget-password/my')
		def forgetpasswordmm():
			return render_template('mm/pwdrecovery.html')

		# View FAQ
		@app.route('/faq/my')
		def faqmm():
			return render_template('mm/FAQ.html')

		# Make booking function
		@app.route('/booking/my')
		def bookingmm():
			if 'u_email' in session:

				sch_record = dbconn.viewS()
				rst_records =dbconn.viewRoute()
				jty_records = dbconn.viewJetty()
				return render_template('mm/booking.html',  records=rst_records,Sch_records=sch_record, j_records = jty_records )
			return redirect(url_for('loginmm'))

		# Make booking function
		@app.route('/makebooking/my', methods=['GET', 'POST'])
		def makebookingmm():
			msg = ''
			if 'u_email' in session:

				if (request.method == 'POST'):
					dbconn.makeBooking(request.form['SID'],session['uid'], request.form['BQty'], request.form['BDueDate'])
					# msg = 'Your Booking is successfully completed!'
					return render_template('mm/thanks.html', records = dbconn.viewBooking())
				elif request.method == 'POST':
					msg = 'လူကြီးမင်း လက်မှတ်ဘွတ်ကင်တင်ခြင်း မအောင်မြင်ပါ။'
				# Show registration form with message
				return render_template('mm/booking.html', msg=msg)
			return redirect(url_for('loginmm'))

		# View booking ticket information
		@app.route('/tickets/my', methods = ["PUT","GET"])
		def ticketsmm():
			if 'u_email' in session:
				if request.method == 'GET':
					return render_template('mm/ticket.html', records = dbconn.viewBookingByUID(session['uid']), default = datetime_converter)
				else:
					return render_template('mm/ticket.html', records = dbconn.viewBK())
			return redirect(url_for('loginmm'))

		# Cancel Booking process
		@app.route('/cancelBooking/my', methods = ["PUT","GET"])
		def can_bookingmm():
			if 'u_email' in session:
				if request.method == 'PUT':
					dbconn.canBooking(request.get_json().get('b_id'))
				return "လက်မှတ် ပယ်ဖျက်ပီးပါပြီ"
			return redirect(url_for('ticketsmm'))

		# Contact Us information
		@app.route('/news/my')
		def newsmm():
			rst_record =dbconn.viewInfo()
			return render_template('mm/news.html' , records = rst_record)

		# Redirect news and event detail information
		@app.route('/news/my/<iid>')
		def viewNewsmm(iid):
			rst_record = dbconn.viewInfo(iid)
			rst_cmt_records = dbconn.viewComment(iid)
			return render_template('mm/newsdetail.html' , records = rst_record, cmt_records = rst_cmt_records)

		# Redirect to thank page 
		@app.route('/thanks/my')

		def thanksmm():
			if 'u_email' in session:
				
				return render_template('mm/thanks.html')
				
			return redirect(url_for('loginmm'))

		# Change password function
		@app.route('/chpwd/my', methods=['GET', 'POST'])
		def chpwdmm():
			msg = ''
			if (request.method == 'POST'):
				u_id= request.form['UID']
				u_pwd = hashlib.sha256( request.form['UPwd'].encode()).hexdigest()
				dbconn.changePwd(u_id,u_pwd)
				msg = 'Your password has been successfully changed!'
				return redirect(url_for('loginmm'))
			elif request.method == 'POST':
				msg = 'Please fill out the form!'
			# Show registration form with message
			return render_template('mm/chpwd.html', msg=msg)

		# Reset password function
		@app.route('/resetpwd/my', methods = ['GET','POST'])
		def resetpwdmm():
			msg = ''
			# session.clear()
			if ( request.method == 'POST'):
				u_email = request.form['EmailAdd']
				ansOne = hashlib.sha256(request.form['Ans1'].encode()).hexdigest()
				ansTwo = hashlib.sha256(request.form['Ans2'].encode()).hexdigest()
				ansThree = hashlib.sha256(request.form['Ans3'].encode()).hexdigest()
				usracc = dbconn.verifyQuestion(u_email,ansOne,ansTwo,ansThree)
				if usracc:
					session['urID'] = usracc[0]                  
					return redirect(url_for('chpwdmm'))
				else:
					msg = 'Your username or password is incorrect!'
			return render_template('mm/pwdrecovery.html', msg=msg)


		# Edit rating function
		@app.route('/editRating/my', methods=['GET', 'POST'])
		def edit_ratingmm():
			if 'u_email' in session:

				if (request.method == 'POST'):
					dbconn.makeRating( request.form['BRating'], session['uid'])
					return redirect(url_for('ticketsmm'))
				return render_template('mm/thanks.html')
			return redirect(url_for('bookingmm'))


		""" For Management Site """
		def datetime_converter(o):
			if isinstance(o, datetime.datetime):
				return o.__str__()
			elif isinstance(o, datetime.timedelta):
				return o.__str__()

		@app.before_request
		def before_request():
			g.email = None
			if 'm_email' in session:
				g.email = session['m_email']

		# Redirect to management site
		@app.route('/management/')
		def mgmt_root():
			if 'm_email' in session:
				return redirect(url_for('mgmt_dashboard'))
			return render_template('management/login.html')		

		# Management site login function
		@app.route('/management/login',methods = ["POST","GET"])
		def mgmt_login():
			if 'm_email' in session:
				return redirect(url_for('mgmt_dashboard'))
			else:
				session.clear()
				if request.method == 'POST':
					m_email = request.form['m_email']
					m_pwd = hashlib.sha256(request.form['m_password'].encode()).hexdigest()
					rst_record = dbconn.verifyUser(m_email)
					if rst_record:
						if m_pwd == rst_record[3]:		
							session['m_id'] = rst_record[0]
							session['name'] = rst_record[1]
							session['m_email'] = rst_record[2]
							session['password'] = rst_record[3]
							session['role'] = rst_record[4]
							return redirect(url_for('mgmt_dashboard'))
						else:
							return render_template('management/login.html', error = 1, m_email = m_email)
					else:
						return render_template('management/login.html', error = 2, m_email = m_email)
				return render_template('management/login.html')

		# Logout function for management site
		@app.route('/management/logout',methods = ["POST","GET"])
		def mgmt_logout():
			session.clear()
			return render_template('management/login.html')

		# Management dashboard site
		@app.route('/management/dashboard')
		def mgmt_dashboard():
			if 'm_email' in session:
				return render_template('management/dashboard.html', u_records = dbconn.viewUser(), m_records = [temp for temp in dbconn.viewMail() if str(temp['MCheck']) == '0' ], b_records = [temp for temp in dbconn.viewBooking() if str(temp['Confirmation']) == '0'], rst_user_record = dbconn.reportTtlUser(), rst_booking_record = dbconn.reportTtlBooking())
			return redirect(url_for('mgmt_login'))

		# View all user information
		@app.route('/management/user')
		def mgmt_user():
			if 'm_email' in session:
				rst_record = dbconn.viewUser()
				return render_template('management/user.html', records = rst_record)
			return redirect(url_for('mgmt_login'))

		# Delete user function
		@app.route('/management/delUser', methods = ['DELETE'])
		def mgmt_del_User():
			if 'm_email' in session:
				if request.method == 'DELETE':
					dbconn.delUser(request.get_json().get('del_u_id'))
				return "Successfully Deleted."
			return redirect(url_for('mgmt_login'))

		# Viewe route function
		@app.route('/management/route',methods = ["PUT","GET"])
		def mgmt_route():
			if 'm_email' in session:
				if request.method == 'PUT':
					return json.dumps(dbconn.viewRoute(request.get_json().get('r_id')), default = datetime_converter)
				else:
					return render_template('management/route.html', records = dbconn.viewRoute())
			return redirect(url_for('mgmt_login'))

		# Add new route information
		@app.route('/management/addRoute', methods = ['POST','GET'])
		def mgmt_add_route():
			if 'm_email' in session:
				if request.method == 'POST':
					dbconn.addRoute(request.form['r_name'],request.form['r_desc'],request.form['r_price'])
				return mgmt_route()
			return redirect(url_for('mgmt_login'))

		# Edit route information
		@app.route('/management/editRoute', methods = ['POST','GET'])
		def mgmt_edit_route():
			if 'm_email' in session:
				if request.method == 'POST':
					dbconn.editRoute(request.form['edit_r_id'],request.form['edit_r_name'],request.form['edit_r_desc'],request.form['edit_r_price'])
				return redirect(url_for('mgmt_route'))
			return redirect(url_for('mgmt_login'))

		# Delete route information
		@app.route('/management/delRoute', methods = ['DELETE'])
		def mgmt_del_route():
			if 'm_email' in session:
				if request.method == 'DELETE':
					dbconn.delRoute(request.get_json().get('del_r_id'))
				return "Successfully Deleted."
			return redirect(url_for('mgmt_login'))

		# View jetty information function
		@app.route('/management/jetty',methods = ["PUT","GET"])
		def mgmt_jetty():
			if 'm_email' in session:
				if request.method == 'PUT':
					return json.dumps(dbconn.viewJetty(request.get_json().get('j_id')), default = datetime_converter)
				else:
					return render_template('management/jetty.html', records = dbconn.viewJetty(), r_records = dbconn.viewRoute())
			return redirect(url_for('mgmt_login'))

		# Add jetty infromation function
		@app.route('/management/addJetty', methods = ['POST','GET'])
		def mgmt_add_jetty():
			if 'm_email' in session:
				if request.method == 'POST':
					dbconn.addJetty( request.form['j_name'], request.form['j_bus_stop'], request.form['jetty_rid'], request.form['j_order'], request.form['j_add'])
				return mgmt_jetty()
			return redirect(url_for('mgmt_login'))

		# Edit jetty information function
		@app.route('/management/editJetty', methods = ['POST','GET'])
		def mgmt_edit_jetty():
			if 'm_email' in session:
				if request.method == 'POST':
					dbconn.editJetty(request.form['edit_j_id'], request.form['edit_j_name'], request.form['edit_j_bus_stop'], request.form['edit_jetty_rid'], request.form['edit_j_order'], request.form['edit_j_add'] )
				return redirect(url_for('mgmt_jetty'))
			return redirect(url_for('mgmt_login'))

		# Delete jetty information function
		@app.route('/management/delJetty', methods = ['DELETE'])
		def mgmt_del_jetty():
			if 'm_email' in session:
				if request.method == 'DELETE':
					dbconn.delJetty(request.get_json().get('del_j_id'))
				return "Successfully Deleted."
			return redirect(url_for('mgmt_login'))

		# View schedule information function
		@app.route('/management/schedule', methods = ["PUT","GET"])
		def mgmt_schedule():
			if 'm_email' in session:
				if request.method == 'PUT':
					return json.dumps(dbconn.viewSchedule(request.get_json().get('s_id')),default = datetime_converter)
				else:
					return render_template('management/schedule.html', records = dbconn.viewSchedule(), j_records = dbconn.viewJetty())
			return redirect(url_for('mgmt_login'))

		# Add schedule function
		@app.route('/management/addSchedule', methods = ['POST','GET'])
		def mgmt_add_schedule():
			if 'm_email' in session:
				if request.method == 'POST':
					dbconn.addSchedule(request.form['s_time'], request.form['s_type'], request.form['s_jid'])
				return redirect(url_for('mgmt_schedule'))
			return redirect(url_for('mgmt_login'))

		# Edit Schedule information
		@app.route('/management/editSchedule', methods = ['POST','GET'])
		def mgmt_edit_schedule():
			if 'm_email' in session:
				if request.method == 'POST':
					dbconn.editSchedule(request.form['edit_s_id'], request.form['edit_s_time'], request.form['edit_s_type'],request.form['edit_s_jid'])
				return redirect(url_for('mgmt_schedule'))
			return redirect(url_for('mgmt_login'))

		# Delete Schedule function
		@app.route('/management/delSchedule', methods = ['DELETE'])
		def mgmt_del_schedule():
			if 'm_email' in session:
				if request.method == 'DELETE':
					dbconn.delSchedule(request.get_json().get('del_s_id'))
				return "Successfully Deleted."
			return redirect(url_for('mgmt_login'))

		# Viwe news and events information 
		@app.route('/management/info', methods = ["PUT","GET"])
		def mgmt_info():
			if 'm_email' in session:
				if request.method == 'PUT':
					return json.dumps(dbconn.viewInfo(request.get_json().get('i_id')), default = datetime_converter)
				else:
					return render_template('management/info.html', records = dbconn.viewInfo())
			return redirect(url_for('mgmt_login'))

		# Add news and events information 
		@app.route('/management/addInfo', methods = ['POST','GET'])
		def mgmt_add_info():
			if 'm_email' in session:
				if request.method == 'POST':
					filename = ""
					if 'i_img' in request.files:
						filename = secure_filename(request.files['i_img'].filename)
						request.files['i_img'].save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
						dbconn.addInfo(request.form['i_title'], request.form['i_desc'], request.form['i_type'], filename)
					else:
						dbconn.addInfo(request.form['i_title'], request.form['i_desc'], request.form['i_type'])
				return redirect(url_for('mgmt_info'))
			return redirect(url_for('mgmt_login'))

		# Edit news and events information 
		@app.route('/management/editInfo', methods = ['POST','GET'])
		def mgmt_edit_info():
			if 'm_email' in session:
				if request.method == 'POST':
					filename = ""
					if 'edit_i_img' in request.files:
						filename = secure_filename(request.files['edit_i_img'].filename)
						request.files['edit_i_img'].save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
						dbconn.editInfo(request.form['edit_i_id'], request.form['edit_i_title'], request.form['edit_i_type'], request.form['edit_i_desc'],filename)
					else:
						dbconn.editInfo(request.form['edit_i_id'], request.form['edit_i_title'], request.form['edit_i_type'], request.form['edit_i_desc'])
				return redirect(url_for('mgmt_info'))
			return redirect(url_for('mgmt_login'))

		# Delete news and events information 
		@app.route('/management/delInfo', methods = ['DELETE'])
		def mgmt_del_info():
			if 'm_email' in session:
				if request.method == 'DELETE':
					dbconn.delInfo(request.get_json().get('del_i_id'))
				return "Successfully Deleted."
			return redirect(url_for('mgmt_login'))

		# View Mail infromation
		@app.route('/management/mail', methods = ["PUT","GET"])
		def mgmt_mail():
			if 'm_email' in session:
				if request.method == 'PUT':
					return json.dumps(dbconn.viewMail(request.get_json().get('m_id')), default = datetime_converter)
				else:
					return render_template('management/mail.html', records = dbconn.viewMail())
			return redirect(url_for('mgmt_login'))

		# Delete mail information
		@app.route('/management/delMail', methods = ['DELETE'])
		def mgmt_del_mail():
			if 'm_email' in session:
				if request.method == 'DELETE':
					dbconn.delMail(request.get_json().get('del_m_id'))
				return "Successfully Deleted."
			return redirect(url_for('mgmt_login'))

		# View booking information
		@app.route('/management/booking')
		def mgmt_booking():
			if 'm_email' in session:
				return render_template('management/booking.html', records = dbconn.viewBooking())
			return redirect(url_for('mgmt_login'))

		# Confirm booking function
		@app.route('/management/confirmBooking', methods = ["PUT","GET"])
		def mgmt_conf_booking():
			if 'm_email' in session:
				if request.method == 'PUT':
					dbconn.conBooking(request.get_json().get('b_id'))
				return "Successfully confirm booking."
			return redirect(url_for('mgmt_login'))

		# Cancel booking function
		@app.route('/management/cancelBooking', methods = ["PUT","GET"])
		def mgmt_can_booking():
			if 'm_email' in session:
				if request.method == 'PUT':
					dbconn.canBooking(request.get_json().get('b_id'))
				return "Successfully cancel booking."
			return redirect(url_for('mgmt_login'))

		# Change password in management site
		@app.route('/management/chngPwd', methods = ["PUT","GET"])
		def mgmt_chng_pwd():
			if 'm_email' in session:
				if request.method == 'PUT':
					o_pwd = hashlib.sha256(request.get_json().get('old_pwd').encode()).hexdigest()
					m_pwd = hashlib.sha256(request.get_json().get('new_pwd').encode()).hexdigest()
					if session['password'] == o_pwd:
						dbconn.chngMPwd(request.get_json().get('m_id'), m_pwd)
						return "Success"
					else:
						return "Old"
			else:
				return redirect(url_for('mgmt_login'))

		# 404 error page
		@app.errorhandler(404)
		def not_found(e):
			return render_template("404.html") 

		if __name__ == '__main__':
			app.run(host='0.0.0.0', port=5000, debug=True)

finally:
	if (dbconn.db_conn):
		dbconn.db_cur.close()
		dbconn.db_conn.close()
		print("MySQL connection is closed")