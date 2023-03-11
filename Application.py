import os
import mysql.connector

mydb = mysql.connector.connect(
    host="sql8.freemysqlhosting.net",
    user="sql8578586",
    password="4mUTKVrkEe",
    database="sql8578586"
    )



def user_register():
   
    mydb = mysql.connector.connect(
    host="sql8.freemysqlhosting.net",
    user="sql8578586",
    password="4mUTKVrkEe",
    database="sql8578586"
    )

    name=input("Enter your name: \n")
    username=input("Enter your username: \n")
    G=input("Enter your gender(M or F only): \n")
    while(G != 'M' and G !='F'):
        G=input("Enter your gender(M or F only): \n")
    add=input("Enter your address: \n")
    email=input("Enter your email address: \n")
    while '@' not in email:
        email=input("Enter a correct email address: \n")
    bd=input("Enter your birthdate (in the format yyyy-mm-dd): \n")

    mycursor = mydb.cursor(buffered=True)
    sql = """
    INSERT INTO user
    VALUES  (%s,%s,%s,%s,%s,%s);
    """
    user=(username,name,G,add,email,bd) 
    mycursor.execute(sql,user)
    mydb.commit()


    choice = input("Account created successfully. User has been registered into the system. Type M to go to main menu or any other letter to exit  ")
    if choice == "M":
        main_menu()
    else:
        quit()



def add_user_review():
    mydb = mysql.connector.connect(
    host="sql8.freemysqlhosting.net",
    user="sql8578586",
    password="4mUTKVrkEe",
    database="sql8578586"
    )

    myc=mydb.cursor(buffered=True)
    sql = """
    Select * from agent;
    """

    myc.execute(sql)

    result = myc.fetchall()
    for r in result:
        print("Agent's name: ", r[0],",\t Agent's number:",r[1])
        
    agentno=input("Please enter the agent's phone number that you want to review: \n")
    email=input("Enter your email address (which you used to register in the website): \n")
    day=input("Enter today's date (in the format yyyy-mm-dd): \n")
    rate=input("Enter your rate to the agent (1-10 only):")
    rate=int(rate)
    while(rate <1 or rate > 10):
        rate=input("Enter your rate to the agent (1-10 only):")
        rate=int(rate)
    review=input("Enter your review/feedback on the agent:")

    feedback=(agentno,email,day,rate,review) 
    #print(feedback)

    mycursor2 = mydb.cursor(buffered=True)
    sql = """
    INSERT INTO provide_feedback
    VALUES  (%s,%s,%s,%s,%s);
    """

    mycursor2.execute(sql,feedback)
    mydb.commit()

    choice = input("Feedback has been added successfully. Type M to go to main menu or any other letter to exit  ")
    if choice == "M":
        main_menu()
    else:
        quit()
 


def view_reviews():

    mydb = mysql.connector.connect(
    host="sql8.freemysqlhosting.net",
    user="sql8578586",
    password="4mUTKVrkEe",
    database="sql8578586"
    )

    myc=mydb.cursor(buffered=True)
    sql = """
    Select * from agent;
    """

    myc.execute(sql)

    result = myc.fetchall()
    for r in result:
        print("Agent's name: ", r[0],",\t Agent's number:",r[1])
        
    agentno=input("Please enter the agent's phone number that you want to see reviews on them: \n")
    
    agentfirst=''
    agentlast=''

    for r in result:
        if(r[1] == '\''+agentno+'\''):
                r=r[0].split()
                agentfirst=r[0]
                agentlast = r[1]

    ls=[]
    ls.append(agentno)

    mycursor2 = mydb.cursor(buffered=True)
    sql = """
    SELECT * FROM provide_feedback Where agent_phone_no= %s
    """

    mycursor2.execute(sql,ls)

    result = mycursor2.fetchall()
    if (len(result) ==0):
        print("There is no reviews on this agent, Sorry.")
    else:
        print("number of reviews:" , len(result))
        for r in result:
            print("Agent's name: ",agentfirst,' ', agentlast)
            print("review by: ",r[1])
            print("rate: ", r[3], "\nreview:", r[4], "\non date", r[2])

    option = input("Reviews has been viewed successfully. Type M to go to main menu or any other letter to exit  ")
    if option == "M":
        main_menu()    
    else:
        quit()    


def agg_broker_rating():


    mydb = mysql.connector.connect(
    host="sql8.freemysqlhosting.net",
    user="sql8578586",
    password="4mUTKVrkEe",
    database="sql8578586"
    )

    mycursor3 = mydb.cursor(buffered=True)
    sql = """
    SELECT work_for.broker_company_name, AVG(provide_feedback.rate) AS "Average rating for agents" 
    FROM work_for INNER JOIN provide_feedback ON work_for.agent_phone_number = provide_feedback.agent_phone_no 
    GROUP BY work_for.broker_company_name 
    ORDER BY 2 DESC;
    """

    mycursor3.execute(sql)


    result = mycursor3.fetchall()
    for r in result:
        print("Broker Company Name: ",r[0])
        print("Average rating for its agents",float(r[1]),"\n-------------")

    response = input("Enter M if you want to go back to the main menu or any other key to quit: ")
    if response == 'M':
        main_menu()
    else:
        quit()


def show_dev():

    mydb = mysql.connector.connect(
    host="sql8.freemysqlhosting.net",
    user="sql8578586",
    password="4mUTKVrkEe",
    database="sql8578586"
    )

    mycursor4 = mydb.cursor(buffered=True)
    sql = """
    SELECT development_project.name, development_project.location,property.type, AVG(property.price / property.area) 
    AS "average price/sqm for the type in the project", count(*) AS "number of listing" FROM development_project INNER JOIN 
    property ON property.development_project_name = development_project.name 
    GROUP BY property.type;
    """

    mycursor4.execute(sql)

    result = mycursor4.fetchall()

    for r in result:
        print("Development project name: ", r[0])
        print("location: ",r[1])
        print("type of property: ", r[2])
        print("average price/sqm for the type in the project: ",float(r[3]))
        print("number of listing: ",r[4],"\n----------------------")

    choice = input("Type M to go back to main menu or any other key to exit:  ")
    if choice == "M":
        main_menu()
    else:
        quit()


def prop_in_city():
    

    mydb = mysql.connector.connect(
    host="sql8.freemysqlhosting.net",
    user="sql8578586",
    password="4mUTKVrkEe",
    database="sql8578586"
    )


    city = input("Enter the city name: ")
    city='%'+city+'%'
    citylower=city.lower()
    citylist=[]
    citylist.append(city)
    citylist.append(citylower)


    #print(citylist)

    mycursor4 = mydb.cursor(buffered=True)
    sql = """
    SELECT property.ID AS "property ID" , property.location, property.area, 
    property.bedrooms_number,property.bathrooms_number, property.price, view1.typ AS "Type", 
    view1.av AS "average price/sqm for the type" 
    FROM view1 INNER JOIN property ON property.type = view1.typ 
    WHERE location LIKE %s OR location LIKE %s;
    """

    mycursor4.execute(sql,citylist)


    result = mycursor4.fetchall()
    while (len(result) == 0):
        print("The entered city doesn't exist in the database or maybe it's written differently.")
        print("Please, Enter again the city name:")
        city = input("Enter the city name: ")
        
        city='%'+city+'%'
        citylower=city.lower()
        citylist=[]
        citylist.append(city)
        citylist.append(citylower)
        
        mycursor4 = mydb.cursor(buffered=True)
        sql = """
        SELECT property.ID AS "property ID" , property.location, property.area, 
        property.bedrooms_number,property.bathrooms_number, property.price, view1.typ AS "Type", 
        view1.av AS "average price/sqm for the type" 
        FROM view1 INNER JOIN property ON property.type = view1.typ 
        WHERE location LIKE %s OR location LIKE %s;
        """

        mycursor4.execute(sql,citylist)
        
        result = mycursor4.fetchall()

        
    print("\n----------------------")
    #print(len(result))
    for r in result:
        print("Property ID: ", r[0])
        print("location: ",r[1])
        print("area: ",r[2])
        print("bedrooms number: ",r[3])
        print("bathrooms number:", r[4])
        print("price: ", r[5])
        print("type of property: ", r[6])
        print("average price/sqm for the type: ",float(r[7]),"\n----------------------")
    

    choice = input("Type M to go back to main menu or any other key to exit:  ")
    if choice == "M":
        main_menu()
    else:
        quit()


def prop_price():

    mydb = mysql.connector.connect(
    host="sql8.freemysqlhosting.net",
    user="sql8578586",
    password="4mUTKVrkEe",
    database="sql8578586"
    )


    city = input("Enter the city name: ")
    minprice = int(input("Enter the minimum price: "))
    maxprice = int(input("Enter the maximum price: "))
    city='%'+city+'%'
    citylower=city.lower()
    clist=[]
    clist.append(city)
    clist.append(citylower)
    clist.append(minprice)
    clist.append(maxprice)


    while (minprice > maxprice):
        print("The entered min price is greater than max price.")
        print("Please, Enter correct min and max prices:")
        
        minprice = int(input("Enter the minimum price: "))
        maxprice = int(input("Enter the maximum price: "))
        city = input("Enter the city name: ")
        
        citylower=city.lower()
        clist=[]
        clist.append(city)
        clist.append(citylower)
        clist.append(minprice)
        clist.append(maxprice)
        
        mycursor4 = mydb.cursor(buffered=True)
        sql = """
        SELECT ID ,location,type, area,bedrooms_number,bathrooms_number,price FROM property
        WHERE (location LIKE %s OR location LIKE %s) AND price >= %s AND price <=%s
        """

        mycursor4.execute(sql,clist)
        
        result = mycursor4.fetchall()

   

    #print(citylist)

    mycursor4 = mydb.cursor(buffered=True)
    sql = """
    SELECT ID ,location,type, area,bedrooms_number,bathrooms_number,price FROM property
    WHERE (location LIKE %s OR location LIKE %s) AND price >= %s AND price <=%s
    """

    mycursor4.execute(sql,clist)


    result = mycursor4.fetchall()
    if (len(result) == 0):
        print("There is no property in the given city or withing the given price range, Sorry.")

    
    #print(len(result))
    for r in result:
        print("Property ID: ", r[0])
        print("location: ",r[1])
        print("type:",r[2])
        print("Area: ", r[3])
        print("bedrooms number: ", r[4])
        print("bathrooms number: ", r[5])
        print("price: ",r[6],"\n----------------------")
    

    choice = input("Type M to go back to main menu or any other key to exit:  ")
    if choice == "M":
        main_menu()
    else:
        quit()


def top_broker():


    mydb = mysql.connector.connect(
    host="sql8.freemysqlhosting.net",
    user="sql8578586",
    password="4mUTKVrkEe",
    database="sql8578586"
    )

    mycursor = mydb.cursor(buffered=True)
    sql = """
    SELECT broker_company.name, broker_company.active_listing, AVG(price/area),
    COUNT(DISTINCT work_for.agent_phone_number),broker_company.active_listing/COUNT(DISTINCT work_for.agent_phone_number)
    from property INNER JOIN work_for ON property.agent_phone_no = CONCAT("\'" , work_for.agent_phone_number,"\'") 
    INNER JOIN broker_company ON broker_company.name = work_for.broker_company_name 
    GROUP BY broker_company.name ORDER BY 2 DESC LIMIT 5
    """
    mycursor.execute(sql)


    result = mycursor.fetchall()

    print("\nThe top 5 broker companies by the amount of their active listing, along with their avg price/sqm, number of agents and avg listing per agent:", "\n-----------------------------")
    for r in result:
        print("broker company name: ", r[0])
        print("active listing: ", r[1])
        print("AVG(price/sqm): ", r[2])
        print("number of agents: ", r[3])
        print("AVG listing per agent: ", r[4],"\n--------------------------")
        
    choice = input("Type M to go back to main menu or any other key to exit:  ")
    if choice == "M":
        main_menu()
    else:
        quit()


def prop_by_agent():

    mydb = mysql.connector.connect(
    host="sql8.freemysqlhosting.net",
    user="sql8578586",
    password="4mUTKVrkEe",
    database="sql8578586"
    )

    myc=mydb.cursor(buffered=True)
    sql = """
    Select * from agent;
    """


    myc.execute(sql)

    result = myc.fetchall()
    for r in result:
        print("Agent's name: ", r[0],",\t Agent's number:",r[1])

    agentno=input("Please enter the agent's phone number that you want to the properties they posted: \n")
    agentfirst=''
    agentlast=''

    for r in result:
        if(r[1] == '\''+agentno+'\''):
                r=r[0].split()
                agentfirst=r[0]
                agentlast = r[1]

    ls=[]
    agentno= '\''+agentno+'\''
    ls.append(agentno)



    mycursor4 = mydb.cursor(buffered=True)

    sql = """
    SELECT id,location, area,type,bedrooms_number,bathrooms_number,price FROM property WHERE agent_phone_no = %s
    """
    mycursor4.execute(sql,ls)

    print("\nproperties listed by agent", agentfirst, agentlast,":\n-----------------------------")
    result = mycursor4.fetchall()
    
    for r in result:
        print("Property ID: ", r[0])
        print("location: ",r[1])
        print("Area:",r[2])
        print("type: ", r[3])
        print("bedrooms number: ", r[4])
        print("bathrooms number: ", r[5])
        print("price: ",r[6],"\n----------------------")
    choice = input("Type M to go back to main menu or any other key to exit:  ")
    if choice == "M":
        main_menu()
    else:
        quit()


def main_menu():
    print("Welcome to the Main Menu!\nWould you like to: ")
    print("1. Register a user")
    print("2. Add a new review on an agent")
    print("3. View existing reviews of a given agent")
    print("4. View aggregated rating of brokerage companies")
    print("5. Show the location of a given development, along with the average price / sqm and the number of listings for each unit type")
    print("6. Show all the properties of in a certain city, along with the average price / sqm for each unit type")
    print("7. Show all the properties in a certain city in a given price range")
    print("8. Show the top 5 brokerage companies by the amount of listings they have, along with their avg price / sqm, number of agents, and average listings per agent")
    print("9. Show all the properties listed by a specific agent (by phone no) ")
    print("10. Exit")
    choice = int(input("Type in your choice: "))
    while choice<1 or choice>10:
        choice = input("Invalid choice! Please enter a valid response: ")
    match choice:
        case 1:
            os.system('cls')
            user_register()
        case 2:
            os.system('cls')
            add_user_review()
        case 3:
            os.system('cls')
            view_reviews()
        case 4:
            os.system('cls')
            agg_broker_rating()
        case 5:
            os.system('cls')
            show_dev()
        case 6:
            os.system('cls')
            prop_in_city()
        case 7:
            os.system('cls')
            prop_price()
        case 8:
            os.system('cls')
            top_broker()
        case 9:
            os.system('cls')
            prop_by_agent()
        case 10:
            quit()


    
main_menu()

