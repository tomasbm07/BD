import psycopg2

def get_option():
    option=-1

    while (option not in [0,1,2]):
        print('1 - List Instructors')
        print('2 - List Departments')
        print('0 - Exit')

        try:
            option=int(input('Option: '))
        except:
            option=-1

    return option

def connect_db():
    connection = psycopg2.connect(user = "dblesson1",
        password = "dblesson1",
        host = "193.137.203.81",
        port = "5432",
        database = "dbcourse")

    return connection

def list_instructors():
    connection=connect_db()
    cursor = connection.cursor()
    cursor.execute('select * from instructor')

    print('--- List of Instructors ---')
    for row in cursor:
        print('ID:',row[0])
        print('Name:',row[1])
        print('Department:',row[2])
        print('Salary:',row[3])
        print('---')

    return

def list_departments():
    connection=connect_db()
    cursor = connection.cursor()
    cursor.execute('select * from department')

    print('--- List of Departments ---')
    for row in cursor:
        print('Name:',row[0])
        print('Building:',row[1])
        print('Budget:',row[2])
        print('---')

    return

def main():
    option=-1

    while (option!=0):
        option=get_option()

        if (option==1):
            list_instructors()
        elif (option==2):
            list_departments()

main()
