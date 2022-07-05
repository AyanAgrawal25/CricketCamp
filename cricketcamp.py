import subprocess as sp
import pymysql
import pymysql.cursors
from tabulate import tabulate
from datetime import datetime


def expand_keys(d):
    s = ''
    for key in d.keys():
        s = s + key + ', '

    if s[-2:] == ', ':
        return s[:-2]
    return s


def quote(s):
    if s == 'NULL':
        return s
    else:
        return '"' + s + '"'


def empty_to_null(s):
    if s == '':
        return 'NULL'
    else:
        return s


def update_ADMINISTRATION(cur, con):
    attr = {}
    print("Enter the administrator id whose details to be update")
    Administrator_ID = int(input())
    administrator_details = ["Name", "Age",
                             "Gender", "Designation", "Address", "Email"]
    print("Enter the number beside the attribute you want to update")
    while (1):
        i = 0
        print("Choose an option:")
        while i < len(administrator_details):
            i += 1
            print(str(i)+"."+administrator_details[i-1])
        print("7. Exit")

        ch = int(input("Enter the choice > "))
        if(ch == 1):
            name = input('Name*: ').split(' ')
            if len(name) >= 3:
                attr['Ad_Firstname'] = name[0]
                attr['Ad_Middlename'] = ' '.join(name[1:-1])
                attr['Ad_Lastname'] = name[-1]
            elif len(name) == 2:
                attr['Ad_Firstname'] = name[0]
                attr['Ad_Middlename'] = ' '
                attr['Ad_Lastname'] = name[1]
            elif len(name) == 1:
                attr['Ad_Firstname'] = name[0]
                attr['Ad_Middlename'] = ' '
                attr['Ad_Lastname'] = ' '
            else:
                print('Error:Please enter administrator\'s name')
                return
            query = "update ADMINISTRATION set Ad_Firstname = '%s',Ad_Middlename='%s',Ad_Lastname='%s'  where Administrator_ID = %d;" % (
                attr["Ad_Firstname"], attr["Ad_Middlename"], attr["Ad_Lastname"], Administrator_ID)
            try:
                cur.execute(query)
                print("Details updated")
            except Exception as e:
                print("Failed to update")
                con.rollback()
                print(e)
                input('Press any key to continue ')
                return
        elif (ch == 2):
            attr['Age'] = input('Age*: ')
            try:
                int(attr['Age'])
            except NameError:
                print('Please enter an age between 18-75')
                return
            if int(attr['Age']) < 18 or int(attr['Age']) > 75:
                print('Please enter age between 18-75')
                return
            query = "update ADMINISTRATION set Age = '%s' where Administrator_ID = %d;" % (
                attr["Age"], Administrator_ID)
            try:
                cur.execute(query)
                print("Details updated")
            except Exception as e:
                print("Failed to update")
                con.rollback()
                print(e)
                input('Press any key to continue ')
                return
        elif(ch == 3):
            attr["Gender"] = input('Gender(M.F,OTHER)*: ')
            query = "update ADMINISTRATION set Gender= '%s' where Administrator_ID = %d;" % (
                attr["Gender"], Administrator_ID)
            try:
                cur.execute(query)
                print("Details updated")
            except Exception as e:
                print("Failed to update")
                con.rollback()
                print(e)
                input('Press any key to continue ')
                return
        elif(ch == 4):
            attr["Designation"] = input('Designation*: ')
            query = "update ADMINISTRATION set Designation = '%s' where Administrator_ID=%d;" % (
                attr["Designation"], Administrator_ID)
            try:
                cur.execute(query)
                print("Details updated")
            except Exception as e:
                print("Failed to update")
                con.rollback()
                print(e)
                input('Press any key to continue ')
                return
        elif(ch == 5):
            attr["Address"] = input('Address*: ')
            query = "update ADMINISTRATION set Address ='%s' where Administrator_ID = %d;" % (
                attr["Address"], Administrator_ID)
            try:
                cur.execute(query)
                print("Details updated")
            except Exception as e:
                print("Failed to update")
                con.rollback()
                print(e)
                input('Press any key to continue ')
                return
        elif(ch == 6):
            attr["Email"] = input('Email*: ')
            query = "update ADMINISTRATION set Email = '%s' where Administrator_ID = %d;" % (
                attr["Email"], Administrator_ID)
            try:
                cur.execute(query)
                print("Details updated")
            except Exception as e:
                print("Failed to update")
                con.rollback()
                print(e)
                input('Press any key to continue ')
                return
        elif(ch == 7):
            break
        else:
            print("\n\nEnter a valid option\n")
            continue

    try:
        con.commit()
        print('Success')
        input('Press any key to continue.')
    except Exception as e:
        print('Failed to update the database.')
        con.rollback()
        print(e)
        input('Press any key to continue.')
        return


def update_EQUIPMENTS(cur, con):
    attr = {}
    print("Enter the equipment id whose details to be update")
    Equipment_ID = int(input())
    equipment_details = ["Quantity", "Sport", "Type"]
    print("Enter the number beside the attribute you want to update")
    while (1):
        i = 0
        print("Choose an option:")
        while i < len(equipment_details):
            i += 1
            print(str(i)+"."+equipment_details[i-1])
        print("4. Exit")

        ch = int(input("Enter the choice > "))
        if (ch == 1):
            attr['Quantity'] = input('Quantity*: ')
            try:
                int(attr['Quantity'])
            except NameError:
                print('Please enter an valid quantity')
                return
            if int(attr['Quantity']) < 0:
                print('Please enter a valid number')
                return
            query = "update EQUIPMENTS set Quantity ='%s' where Equipment_ID=%d;" % (
                attr["Quantity"], Equipment_ID)
            try:
                cur.execute(query)
                print("Details updated")
            except Exception as e:
                print("Failed to update")
                con.rollback()
                print(e)
                input('Press any key to continue ')
                return
        elif (ch == 2):
            attr['Sport'] = input('Sport*: ')
            query = "update EQUIPMENTS set Sport='%s' where Equipment_ID=%d;" % (
                attr["Sport"], Equipment_ID)
            try:
                cur.execute(query)
                print("Details updated")
            except Exception as e:
                print("Failed to update")
                con.rollback()
                print(e)
                input('Press any key to continue ')
                return
        elif(ch == 3):
            attr['Type'] = input('Equipment Type*: ')
            query = "update EQUIPMENTS set Type='%s' where Equipment_ID=%d;" % (
                attr["Type"], Equipment_ID)
            try:
                cur.execute(query)
                print("Details updated")
            except Exception as e:
                print("Failed to update")
                con.rollback()
                print(e)
                input('Press any key to continue ')
                return
        elif(ch == 4):
            break
        else:
            print("\n\nEnter a valid option\n")
            continue

    try:
        con.commit()
        print('Success')
        input('Press any key to continue.')
    except Exception as e:
        print('Failed to update the database.')
        con.rollback()
        print(e)
        input('Press any key to continue.')
        return


def add_EQUIPMENTS(cur, con):
    Equipment_ID = input('Enter the equipment id: ')
    attr = {}
    print('Enter the details of equipments: ')
    attr['Quantity'] = input('Quantity*: ')
    if not attr["Quantity"].isnumeric():
        print('Please enter valid quantity between 1 to 9999')
        input('Press any key to continue.')
        return

    attr['Sport'] = empty_to_null(input('Sport: '))
    attr['Type'] = empty_to_null(input('Equipment Type: '))

    query_str = f'INSERT INTO CRICKETCAMP.EQUIPMENTS VALUES(\
        {Equipment_ID}, \
            "{attr["Quantity"]}", \
            "{attr["Sport"]}", \
            "{attr["Type"]}" \
                );'
    try:
        cur.execute(query_str)
        con.commit()
        print('The new equipments has been successfully entered into the system.')
        input('Press any key to continue.')
    except Exception as e:
        print('Failed to insert into the database.')
        con.rollback()
        print(e)
        input('Press any key to continue.')


def add_ADMINISTRATION(cur, con):
    Administrator_ID = input('Enter the administrator id: ')
    attr = {}
    print('Enter the details of new administrator: ')
    name = input('Name*: ').split(' ')
    if len(name) >= 3:
        attr['Ad_Firstname'] = name[0]
        attr['Ad_Middlename'] = ' '.join(name[1:-1])
        attr['Ad_Lastname'] = name[-1]
    elif len(name) == 2:
        attr['Ad_Firstname'] = name[0]
        attr['Ad_Middlename'] = ' '
        attr['Ad_Lastname'] = name[1]
    elif len(name) == 1:
        attr['Ad_Firstname'] = name[0]
        attr['Ad_Middlename'] = ' '
        attr['Ad_Lastname'] = ' '
    else:
        print('Error:Please enter administrator\'s name')
        return

    attr['Age'] = input('Age*: ')
    if not attr['Age'].isnumeric:
        print('Please enter an age between 18 - 75')
        input('Press any key to continue.')
        return
    attr['Gender'] = input('Gender(M,F,OTHER)*: ')
    attr['Designation'] = input('Designation: ')
    attr['Address'] = empty_to_null(input('Address: '))
    attr['Email'] = input('Email: ')

    query_str = f'INSERT INTO CRICKETCAMP.ADMINISTRATION VALUES(\
        {Administrator_ID}, \
        "{attr["Ad_Firstname"]}", \
        "{attr["Ad_Middlename"]}", \
        "{attr["Ad_Lastname"]}", \
        "{attr["Age"]}", \
        "{attr["Gender"]}", \
        "{attr["Designation"]}", \
        "{attr["Address"]}", \
        "{attr["Email"]}"\
    );'
    try:
        cur.execute(query_str)
        con.commit()
        print('The new administrator has been successfully entered into the system.')
        input('Press any key to continue.')
    except Exception as e:
        print('Failed to insert into the database.')
        con.rollback()
        print(e)
        input('Press any key to continue.')


def delete_admin(cur, con):
    try:
        print("Enter ID of Administrator you want to delete")
        k = int(input())
        query = "DELETE FROM ADMINISTRATION WHERE Administrator_ID = %d ;" % (
            k)
        cur.execute(query)
        con.commit()
        print("Deleted Administrator details from database successfully!")
        input("Press any key to continue")
    except Exception as e:
        con.rollback()
        print("Failed to delete from database")
        print(">>>>>>>>>>>>>", e)
        input("Press any key to continue")
    return


def delete_equipment(cur, con):
    try:
        print("Enter ID of equipment you want to delete")
        id = int(input())
        query = "delete from EQUIPMENTS where Equipment_ID = %d ; " % (id)
        cur.execute(query)
        con.commit()
        print("Deleted Equipment from database successfully!")
        input("Press any key to continue")
    except Exception as e:
        con.rollback()
        print("Failed to delete from database")
        print(">>>>>>>>>>>>>", e)
        input("Press any key to continue")
    return


def update_display():
    print("\nUpdate the table\n")
    tables_update = ["ADMINISTRATION", "EQUIPMENTS"]
    while(1):
        i = 0
        print("Choose an option ")
        while i < len(tables_update):
            i += 1
            print(str(i) + ". " + tables_update[i-1])
        print("3. Exit")

        ch = int(input("Enter choice> "))
        if(ch == 1):
            update_ADMINISTRATION(cur, con)
        elif(ch == 2):
            update_EQUIPMENTS(cur, con)
        if(ch==3):
            break
        else:
            print("\n\nEnter a valid option\n")
            continue


def add_display():
    print("\nAdd to the table\n")
    tables_add = ["ADMINISTRATION", "EQUIPMENTS"]
    while(1):
        i = 0
        print("Choose an option ")
        while i < len(tables_add):
            i += 1
            print(str(i) + ". " + tables_add[i-1])
        print("3. Exit")

        ch = int(input("Enter choice> "))
        if(ch == 1):
            add_ADMINISTRATION(cur, con)
        if(ch == 2):
            add_EQUIPMENTS(cur, con)
        if(ch == 3):
            break
        else:
            print("\n\nEnter a valid option\n")
            continue


def delete_display():
    print("\nDelete entry from the table\n")
    tables_delete = ["ADMINISTRATION", "EQUIPMENTS"]
    while(1):
        i = 0
        print("Choose an option ")
        while i < len(tables_delete):
            i += 1
            print(str(i) + ". " + tables_delete[i-1])
        print("3. Exit")

        ch = int(input("Enter choice> "))
        if(ch == 1):
            delete_admin(cur, con)
        if(ch == 2):
            delete_equipment(cur, con)
        if(ch == 3):
            break
        else:
            print("\n\nEnter a valid option\n")
            continue


def viewTable(rows):

    a = []
    try:
        a.append(list(rows[0].keys()))
    except:
        print("\n-----------------\nEMPTY TABLE\n-----------------\n")
        return
    for row in rows:
        b = []
        for k in row.keys():
            b.append(row[k])
        a.append(b)
    print(tabulate(a, tablefmt="psql", headers="firstrow"))
    print()
    return


def view_all_age(cur, con):
    try:
        query = "SELECT * FROM PARTICIPANTS WHERE Age_on_joining > 7"
        a1 = cur.execute(query)
        a1 = cur.fetchall()
        viewTable(a1)
        con.commit()
    except Exception as e:
        con.rollback()
        print("Done")
        input("Press any key to continue")
    return


def view_participant_height_and_age(cur, con):
    try:
        # k = input("Enter min weight of participant to view ID, Height and Age: ")
        # print(k)
        query = "SELECT Participant_ID FROM PARTICIPANTS WHERE Height >= " + 70 + ";"
        a1 = cur.execute(query)
        a1 = cur.fetchone()
        con.commit()
        print(a1['Participant_ID'])

    except Exception as e:
        con.rollback()
        print("Done")
        input("Press any key to continue")
    return


def view_marks(cur, con):
    try:
        k = input("Enter id of participant to view marks for: ")
        print(k)

        print("Bowling marks:")
        query1 = "SELECT Bowl_Marks FROM Participant_Bowling_Marks WHERE Participant_ID = " + k + ";"

        a1 = cur.execute(query1)
        a1 = cur.fetchone()
        con.commit()

        print(a1['Bowl_Marks'])

        print("Batting marks:")
        query2 = "SELECT Bat_Marks FROM Participant_Batting_Marks WHERE Participant_ID = " + k + ";"

        a2 = cur.execute(query2)
        a2 = cur.fetchone()
        # viewTable(a2)
        con.commit()

        print(a2['Bat_Marks'])

        print("Fielding marks:")
        query3 = "SELECT Field_Marks FROM Participant_Fielding_Marks WHERE Participant_ID = " + k + ";"
        a3 = cur.execute(query3)
        a3 = cur.fetchone()
        # viewTable(a3)
        con.commit()
        print(a3['Field_Marks'])

        print("Fitness marks:")
        query4 = "SELECT Fit_Marks FROM Participant_Fitness_Marks WHERE Participant_ID = " + k + ";"
        a4 = cur.execute(query4)
        a4 = cur.fetchone()
        con.commit()
        print(a4['Fit_Marks'])
        print("Total Marks of participant")
        print(a1['Bowl_Marks']+(a2['Bat_Marks']) +
              a3['Field_Marks']+a4['Fit_Marks'])
        a5 = a1+a2+a3+a4
        # print(a5)

    except Exception as e:
        con.rollback()
        print("Done")
        input("Press any key to continue")

    return


def dispatch(ch):

    if(ch == '1'):
        update_display()
    elif(ch == '2'):
        add_display()
    elif(ch == '3'):
        delete_display()
    elif(ch == '4'):
        view_marks(cur, con)
    elif(ch == '5'):
        view_participant_height_and_age(cur, con)
    elif(ch == '6'):
        view_all_age(cur, con)
    else:
        print("\nError: Invalid Option\n\n")


while(1):
    tmp = sp.call('clear', shell=True)
    username = input("Username: ")
    password = input("Password: ")

    try:
        con = pymysql.connect(host='localhost',
                              user=username,
                              password=password,
                              port=3306,
                              db='CRICKETCAMP',
                              cursorclass=pymysql.cursors.DictCursor)
        tmp = sp.call('clear', shell=True)

        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")
        tmp = input("Enter any key to CONTINUE>")
        with con:
            cur = con.cursor()
            while True:
                tmp = sp.call('clear', shell=True)
                print("1. Update")
                print("2. Add")
                print("3. Delete")
                print("4. View marks")
                print("5. View height")
                print("6. View participant data above age 7")
                print("7. Logout")
                print("8. Exit")
                ch = input("Enter choice> ")
                tmp = sp.call('clear', shell=True)

                if ch == '7':
                    break
                elif ch == '8':
                    raise SystemExit
                else:
                    dispatch(ch)
                    # input("Press any key to continue.")

    except Exception as e:
        tmp = sp.call('clear', shell=True)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        print(e)
        input("Press any key to continue.")
