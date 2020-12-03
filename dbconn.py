# coding: utf-8
# Script:          dbconn.py
# Description:     To support databse system of Yangon Water Bus Transportation System
# Author:          Kaung Htet Kyaw, Bo Bo Oo
# Created Date:    August 2019
# Require:         Internet connection, Need to import requests module in host os


import mysql.connector, datetime
from mysql.connector import Error

db_conn = None

try:
	""" Database Connection """
	db_conn = mysql.connector.connect(
		host='localhost',
		database='ywb',
		user='root',
		password='',
		charset='utf8')

	# Ensure database connection with system
	if db_conn.is_connected():
		db_Info = db_conn.get_server_info()
		print("Connected to MySQL Server version ", db_Info)
		db_cur = db_conn.cursor()

		# Retrieve route in client site
		def viewR():
			db_cur.execute("""SELECT * from `tblroute` INNER JOIN `tbljetty` on `tblroute`.`RID`= `tbljetty`.`RID` ORDER BY `tbljetty`.`RID`, `tbljetty`.`JOrder` ASC ;""")
			route_record = db_cur.fetchall()
			return [{db_cur.column_names[col_len]:cols[col_len] for col_len in range(len(cols))} for cols in route_record]

		# Retrieve user information from database
		def viewUser():
			db_cur.execute("""SELECT * FROM `tbluser`;""")
			rst_record = db_cur.fetchall()
			return [{db_cur.column_names[col_len]:cols[col_len] for col_len in range(len(cols))} for cols in rst_record]

		# Retrieve Schedule from database
		def viewS():
			db_cur.execute("""SELECT `tblroute`.*, `tbljetty`.*, `tblschedule`.*, TIME_FORMAT(`tblschedule`.`STime`,'%h:%i %p') AS 'FSTime', `tblschedule`.`JID`, `tbljetty`.`RID` FROM `tblroute` LEFT JOIN `tbljetty` ON `tbljetty`.`RID` = `tblroute`.`RID` LEFT JOIN `tblschedule` ON `tblschedule`.`JID` = `tbljetty`.`JID` ORDER BY `tbljetty`.`RID`, `tbljetty`.`JOrder` ASC ;""")
			sch_record = db_cur.fetchall()
			return [{db_cur.column_names[col_len]:cols[col_len] for col_len in range(len(cols))} for cols in sch_record]

		# Delete user in database
		def delUser(u_id):
			db_cur.execute(""" DELETE FROM `tbluser` WHERE `tbluser`.`UID` =  %s;""" , (int(u_id),))
			db_conn.commit()
			return None

		# Retrieve route information from database
		def viewRoute(r_id = None):
			if r_id:
				db_cur.execute("""SELECT * FROM `tblroute` WHERE `tblroute`.`RID` = %s;""" , (int(r_id),))
				return db_cur.fetchone()
			else:
				db_cur.execute("""SELECT * FROM `tblroute`;""")
				rst_record = db_cur.fetchall()
				return [{db_cur.column_names[col_len]:cols[col_len] for col_len in range(len(cols))} for cols in rst_record]

		# Add route information to database
		def addRoute(r_name, r_desc, r_price):
			db_cur.execute("""INSERT INTO `tblroute`(`RouteName`, `RDescription`, `RPrice`) VALUES (%s, %s, %s)""" , (str(r_name), str(r_desc), round(float(r_price),2),))
			db_conn.commit()
			return None

		# Edit route information to database
		def editRoute(r_id, r_name, r_desc, r_price):
			db_cur.execute("""UPDATE `tblroute` SET `RouteName` = %s, `RDescription` = %s, `RPrice` = %s WHERE `tblroute`.`RID` =  %s;""" , (str(r_name), str(r_desc), round(float(r_price),2), int(r_id),))
			db_conn.commit()
			return None

		# Delete route information from database
		def delRoute(r_id):
			db_cur.execute(""" DELETE FROM `tblroute` WHERE `tblroute`.`RID` =  %s;""" , (int(r_id),))
			db_conn.commit()
			return None

		# Retrieve jetty information from database
		def viewJetty(j_id = None):
			if j_id:
				db_cur.execute("""SELECT `tbljetty`.*, `tblroute`.`RouteName`, `tblroute`.`RID` FROM `tbljetty` LEFT JOIN `tblroute` ON `tbljetty`.`RID` = `tblroute`.`RID` WHERE `tblroute`.`RID` = `tbljetty`.`RID` AND `tbljetty`.`JID` = %s;""" , (int(j_id),))
				return db_cur.fetchone()
			else:
				db_cur.execute("""SELECT `tbljetty`.*, `tblroute`.`RouteName`, `tblroute`.`RID` FROM `tbljetty` LEFT JOIN `tblroute` ON `tbljetty`.`RID` = `tblroute`.`RID` WHERE `tblroute`.`RID` = `tbljetty`.`RID`;""")
				rst_record = db_cur.fetchall()
				return [{db_cur.column_names[col_len]:cols[col_len] for col_len in range(len(cols))} for cols in rst_record]

		# Insert jetty information to database
		def addJetty(j_name, j_bus_stop, r_id, j_order, j_add):
			db_cur.execute("""INSERT INTO `tbljetty`(`JettyName`, `BusStop`, `RID`, `JOrder`, `JettyAdd`) VALUES (%s, %s, %s, %s, %s)""" , (str(j_name), str(j_bus_stop), int(r_id), str(j_order), str(j_add),))
			db_conn.commit()
			return None

		# Edit jety information to database
		def editJetty(j_id, j_name, j_bus_stop, r_id, j_order, j_add):
			db_cur.execute("""UPDATE `tbljetty` SET `JettyName` = %s, `BusStop` = %s, `RID` = %s, `JOrder`= %s, `JettyAdd` = %s WHERE `tbljetty`.`JID` = %s;""" , (str(j_name), str(j_bus_stop), int(r_id), int(j_order), str(j_add), int(j_id),))
			db_conn.commit()
			return None

		# Delete jetty information from database
		def delJetty(j_id):
			db_cur.execute(""" DELETE FROM `tbljetty` WHERE `tbljetty`.`JID` =  %s;""" , (int(j_id),))
			db_conn.commit()
			return None

		# Retrieve schedule information from database
		def viewSchedule(s_id = None):
			if s_id:
				db_cur.execute("""SELECT `tblschedule`.*, `tbljetty`.`JettyName`, `tblschedule`.`JID` FROM `tblschedule` LEFT JOIN `tbljetty` ON `tblschedule`.`JID` = `tbljetty`.`JID` WHERE `tblschedule`.`JID` = `tbljetty`.`JID` AND `tblschedule`.`SID` = %s;""", (int(s_id),))
				return db_cur.fetchone()
			else:
				db_cur.execute("""SELECT `tblschedule`.*, `tbljetty`.`JettyName`, `tblschedule`.`JID` FROM `tblschedule` LEFT JOIN `tbljetty` ON `tblschedule`.`JID` = `tbljetty`.`JID` WHERE `tblschedule`.`JID` = `tbljetty`.`JID`;""")
				rst_record = db_cur.fetchall()
				return [{db_cur.column_names[col_len]:cols[col_len] for col_len in range(len(cols))} for cols in rst_record]

		# Insert Schedule information to database
		def addSchedule(s_time, s_type, j_id):
			db_cur.execute("""INSERT INTO `tblschedule` (`STime`, `SType`, `JID`) VALUES (%s, %s, %s)""" , (str(s_time), str(s_type), int(j_id),))
			db_conn.commit()
			return None

		# Edit schedule information to database
		def editSchedule(s_id, s_time, s_type, j_id):
			db_cur.execute("""UPDATE `tblschedule` SET `STime`=%s, `SType`=%s, `JID`= %s WHERE `tblschedule`.`SID` = %s;""" , (str(s_time), str(s_type), int(j_id), int(s_id),))
			db_conn.commit()
			return None

		# Delete schedule information to database
		def delSchedule(s_id):
			db_cur.execute(""" DELETE FROM `tblschedule` WHERE `tblschedule`.`SID` =  %s;""" , (int(s_id),))
			db_conn.commit()
			return None

		# Retrieve news and events from database
		def viewInfo(i_id = None):
			if i_id:
				db_cur.execute("""SELECT *, DATE_FORMAT(`PostedDate`,'%D %M %Y') AS 'FSDate' FROM `tblinfo` WHERE `tblinfo`.`IID` = %s;""", (int(i_id),))
				return db_cur.fetchone()
			else:
				db_cur.execute("""SELECT `tblinfo`.*, DATE_FORMAT(`tblinfo`.`PostedDate`,'%D %M %Y') AS 'FSDate' FROM `tblinfo`;""")
				rst_record = db_cur.fetchall()
				return [{db_cur.column_names[col_len]:cols[col_len] for col_len in range(len(cols))} for cols in rst_record]

		# Insert news and events to database
		def addInfo(i_title, i_desc, i_type, i_img = None):
			db_cur.execute("""INSERT INTO `tblinfo`(`ITitle`, `IDescription`, `IType`, `IImg`) VALUES (%s, %s, %s, %s)""" , (str(i_title), str(i_desc), str(i_type), str(i_img),))
			db_conn.commit()
			return None

		# Edit information to database
		def editInfo(i_id, i_title, i_type, i_desc, i_img = None):
			if i_img:
				db_cur.execute("""UPDATE `tblinfo` SET `ITitle`=%s, `IDescription`=%s, `IType`=%s, `IImg`=%s WHERE `tblinfo`.`IID` = %s;""" , (str(i_title), str(i_desc), str(i_type), str(i_img), int(i_id),))
			else:
				db_cur.execute("""UPDATE `tblinfo` SET `ITitle`=%s, `IDescription`=%s, `IType`=%s WHERE `tblinfo`.`IID` = %s;""" , (str(i_title), str(i_desc), str(i_type), int(i_id),))
			db_conn.commit()
			return None

		# Delete information from database
		def delInfo(i_id):
			db_cur.execute(""" DELETE FROM `tblinfo` WHERE `tblinfo`.`IID` =  %s;""" , (int(i_id),))
			db_conn.commit()
			return None

		# Retrieve booking information from database
		def viewBooking():
			db_cur.execute("""SELECT `tblbooking`.*, `tbluser`.*, `tblroute`.*, `tblschedule`.*,CONCAT (`tblbooking`.`BDueDate`, ' ', `tblschedule`.`STime`) as `BookingDate` FROM `tblbooking` LEFT JOIN `tbluser` ON `tblbooking`.`UID` = `tbluser`.`UID` LEFT JOIN `tblschedule` ON `tblbooking`.`SID` = `tblschedule`.`SID` LEFT JOIN `tbljetty` ON `tbljetty`.`JID` = `tblschedule`.`JID` LEFT JOIN `tblroute` ON `tblroute`.`RID` = `tbljetty`.`RID`;""")
			rst_booking_record = db_cur.fetchall()
			if rst_booking_record:
				rst_booking_record=[{db_cur.column_names[col_len]:cols[col_len] for col_len in range(len(cols))} for cols in rst_booking_record]
				for temp in rst_booking_record:
					bdate = (datetime.datetime.strptime(temp['BookingDate'],'%Y-%m-%d %H:%M:%S')-datetime.datetime.now()).total_seconds()/60
	
					if (bdate < 30) & (temp['Confirmation'] == "0"):
						db_cur.execute("""UPDATE `tblbooking` SET `Confirmation` = 'Cancel' WHERE `tblbooking`.`BID` = %s;""", (int(temp['BID']),))
						db_conn.commit()
			db_cur.execute("""SELECT `tblbooking`.*, `tbluser`.*, `tblroute`.*, `tblschedule`.*,CONCAT (`tblbooking`.`BDueDate`, ' ', `tblschedule`.`STime`) as `BookingDate` FROM `tblbooking` LEFT JOIN `tbluser` ON `tblbooking`.`UID` = `tbluser`.`UID` LEFT JOIN `tblschedule` ON `tblbooking`.`SID` = `tblschedule`.`SID` LEFT JOIN `tbljetty` ON `tbljetty`.`JID` = `tblschedule`.`JID` LEFT JOIN `tblroute` ON `tblroute`.`RID` = `tbljetty`.`RID`;""")
			rst_record = db_cur.fetchall()
			return [{db_cur.column_names[col_len]:cols[col_len] for col_len in range(len(cols))} for cols in rst_record]

		# Retrieve booking information by user from database
		def viewBookingByUID(u_id):
			db_cur.execute("""SELECT `tblbooking`.*, `tbluser`.*, `tblroute`.*, `tbljetty`.*, `tblschedule`.*,CONCAT (`tblbooking`.`BDueDate`, ' ', `tblschedule`.`STime`) as `BookingDate` FROM `tblbooking` LEFT JOIN `tbluser` ON `tblbooking`.`UID` = `tbluser`.`UID` LEFT JOIN `tblschedule` ON `tblbooking`.`SID` = `tblschedule`.`SID` LEFT JOIN `tbljetty` ON `tbljetty`.`JID` = `tblschedule`.`JID` LEFT JOIN `tblroute` ON `tblroute`.`RID` = `tbljetty`.`RID`;""")
			rst_booking_record = db_cur.fetchall()
			if rst_booking_record:
				rst_booking_record=[{db_cur.column_names[col_len]:cols[col_len] for col_len in range(len(cols))} for cols in rst_booking_record]
				for temp in rst_booking_record:
					bdate = (datetime.datetime.strptime(temp['BookingDate'],'%Y-%m-%d %H:%M:%S')-datetime.datetime.now()).total_seconds()/60
					if (bdate < 30) & (temp['Confirmation'] == "0"):
						db_cur.execute("""UPDATE `tblbooking` SET `Confirmation` = 'Cancel' WHERE `tblbooking`.`BID` = %s;""", (int(temp['BID']),))
						db_conn.commit()
			if u_id:
				db_cur.execute("""SELECT `tblbooking`.*, `tbluser`.*, `tblroute`.*, `tbljetty`.*, `tblschedule`.*,CONCAT (`tblbooking`.`BDueDate`, ' ', `tblschedule`.`STime`) as `BookingDate` FROM `tblbooking` LEFT JOIN `tbluser` ON `tblbooking`.`UID` = `tbluser`.`UID` LEFT JOIN `tblschedule` ON `tblbooking`.`SID` = `tblschedule`.`SID` LEFT JOIN `tbljetty` ON `tbljetty`.`JID` = `tblschedule`.`JID` LEFT JOIN `tblroute` ON `tblroute`.`RID` = `tbljetty`.`RID` WHERE `tblbooking`.`UID` = %s ORDER BY `tblbooking`.`BID` DESC;""",(int(u_id),))
				rst_record = db_cur.fetchall()
				return [{db_cur.column_names[col_len]:cols[col_len] for col_len in range(len(cols))} for cols in rst_record]

		# Update confirm booking to database
		def conBooking(b_id):
			db_cur.execute("""UPDATE `tblbooking` SET `Confirmation`= 'Confirm' WHERE `tblbooking`.`BID` = %s;""" , (int(b_id),))
			db_conn.commit()
			return None

		# Update confirm booking to database
		def canBooking(b_id):
			db_cur.execute("""UPDATE `tblbooking` SET `Confirmation`= 'Cancel' WHERE `tblbooking`.`BID` = %s;""" , (int(b_id),))
			db_conn.commit()
			return None

		# Retrieve mail from the database
		def viewMail(m_id = None):
			if m_id:
				db_cur.execute("""UPDATE `tblmailbox` SET `MCheck` = '1' WHERE `tblmailbox`.`MailID` = %s;""", (int(m_id),))
				db_conn.commit()
				db_cur.execute("""SELECT * FROM `tblmailbox` WHERE `tblmailbox`.`MailID` = %s;""", (int(m_id),))
				return db_cur.fetchone()
			else:
				db_cur.execute("""SELECT * FROM `tblmailbox`;""")
				rst_record = db_cur.fetchall()
				return [{db_cur.column_names[col_len]:cols[col_len] for col_len in range(len(cols))} for cols in rst_record]

		# Delete mail from the database
		def delMail(m_id):
			db_cur.execute(""" DELETE FROM `tblmailbox` WHERE `tblmailbox`.`MailID` =  %s;""" , (int(m_id),))
			db_conn.commit()
			return None

		# Retrieve total user from database
		def reportTtlUser():
			db_cur.execute("""SELECT YEAR(`tbluser`.`CreatedDate`) AS Yearly, DATE_FORMAT(`tbluser`.`CreatedDate`, '%M') AS Monthly, COUNT(`tbluser`.`UID`) AS TtlUsers FROM `tbluser` GROUP BY YEAR(`tbluser`.`CreatedDate`),DATE_FORMAT(`tbluser`.`CreatedDate`, '%m') ORDER BY `Yearly`, DATE_FORMAT(`tbluser`.`CreatedDate`, '%m') DESC """);
			rst_record = db_cur.fetchall()
			return [{db_cur.column_names[col_len]:cols[col_len] for col_len in range(len(cols))} for cols in rst_record]

		# Retrieve total booking from database
		def reportTtlBooking():
			db_cur.execute("""SELECT YEAR(`tblbooking`.`BookedDate`) AS Yearly, DATE_FORMAT(`tblbooking`.`BookedDate`, '%M') AS Monthly, COUNT(`tblbooking`.`BID`) AS TtlBookings, SUM(`tblbooking`.`BQty`) AS TtlTickets FROM `tblbooking` GROUP BY YEAR(`tblbooking`.`BookedDate`), DATE_FORMAT(`tblbooking`.`BookedDate`, '%m') ORDER BY `Yearly`, DATE_FORMAT(`tblbooking`.`BookedDate`, '%m') DESC """);
			rst_record = db_cur.fetchall()
			return [{db_cur.column_names[col_len]:cols[col_len] for col_len in range(len(cols))} for cols in rst_record]

		# Retrieve management user from database to verify user by email address
		def verifyUser(m_email):
			db_cur.execute("""SELECT * FROM `tblmanagement` WHERE `EmailAdd` = %s;""" , (str(m_email),))
			return	db_cur.fetchone()

		# Verify user account from database
		def verifyUseracc(u_email, u_pwd):
			db_cur.execute("""SELECT * FROM `tbluser` WHERE `EmailAdd` = %s AND `UPwd` = %s;""" , (str(u_email), str(u_pwd),))
			return	db_cur.fetchone()

		# Add new user account to database
		def insertData(FullName, u_email, u_pwd, PhNo, Gender,ansOne, ansTwo,ansThree,cd,md):
			db_cur.execute("""INSERT INTO `tbluser` VALUES (NULL, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)""" , (str(FullName), str(u_email),str(u_pwd), str(PhNo), str(Gender),str(ansOne), str(ansTwo),str(ansThree),cd,md,))
			return db_conn.commit()

		# Send contact message from contact us to database
		def sendMessage(subject, message, UserName, c_email, pd,md):
			db_cur.execute("""INSERT INTO `tblmailbox` VALUES (NULL, %s, %s, %s, %s, %s, %s, %s)""" , (str(subject), str(message), str(UserName), str(c_email), 0, pd,md,))
			return db_conn.commit()

		# Insert commennt to database by defined news or events 
		def sendComment(cmtDesc, cmtUID, cmtIID):
			db_cur.execute("""INSERT INTO `tblcomment` (`CDescription`, `UID`, `IID`) VALUES (%s, %s, %s)""" , (str(cmtDesc), int(cmtUID), int(cmtIID),))
			return db_conn.commit()

		# Retrieve comment from databse by detail news or events
		def viewComment(cmtIID):
			db_cur.execute("""SELECT `tblcomment`.*, `tbluser`.* FROM `tblcomment` LEFT JOIN `tbluser` ON `tblcomment`.`UID` = `tbluser`.`UID` WHERE `tbluser`.`UID` = `tblcomment`.`UID` AND `tblcomment`.`IID` = %s ORDER BY `tblcomment`.`CID` DESC""" , (int(cmtIID),))
			rst_record = db_cur.fetchall()
			return [{db_cur.column_names[col_len]:cols[col_len] for col_len in range(len(cols))} for cols in rst_record]

		# Retrieve user information to view profile
		def viewProfile():
			db_cur.execute("""SELECT * FROM `tbluser` WHERE UID = %s""", [session['id']])
			rst_record = db_cur.fetchall()
			return [{db_cur.column_names[col_len]:cols[col_len] for col_len in range(len(cols))} for cols in rst_record]

		# Retrieve ans to verify user
		def verifyQuestion(u_email,ansOne,ansTwo,ansThree):
			db_cur.execute("""SELECT * FROM `tbluser` WHERE `EmailAdd` = %s AND `Ans1` = %s AND `Ans2` = %s AND `Ans3` = %s ;""" , (str(u_email),str(ansOne), str(ansTwo),str(ansThree),))
			return	db_cur.fetchone()

		# Retrieve user password from databsae to change
		def changePwd(u_id,u_pwd):
			db_cur.execute("""UPDATE `tbluser` SET `UPwd`=%s WHERE `tbluser`.`UID` = %s ;""" , (str(u_pwd),int(u_id),))
			return db_conn.commit()

		# Update management user password
		def chngMPwd(m_id,m_pwd):
			db_cur.execute("""UPDATE `tblmanagement` SET `MPwd`=%s WHERE `tblmanagement`.`MID` = %s ;""" , (str(m_pwd),int(m_id),))
			return db_conn.commit()

		# Add new booking to database
		def makeBooking(SID,UID, BQty, BDueDate):
			db_cur.execute("""INSERT INTO `tblbooking` (`SID`, `UID`, `Confirmation`, `BQty`, `BRating`, `BDueDate`) VALUES (%s,%s,0,%s,0,%s);""" , (int(SID), int(UID), int(BQty), str(BDueDate),))
			return db_conn.commit()

		# Add rating by booking with valid
		def makeRating(BRating,UID):
			db_cur.execute("""SELECT `tblbooking`.`BID` FROM `tblbooking` WHERE `tblbooking`.`UID`=%s ORDER BY `tblbooking`.`BID` DESC LIMIT 1""", (int(UID),))
			rst_record = db_cur.fetchone()
			db_cur.execute("""UPDATE `tblbooking` SET `BRating`='%d' WHERE `tblbooking`.`BID` = %d ;""" % (int(BRating),int(rst_record[0])))
			return db_conn.commit()


except Error as e:
	print("Error while connecting to MySQL", e)





