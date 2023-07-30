# README
FINANCE TRACKER
The project is a web application that allows users to track and manage stocks in their portfolio. The application implements user authentication and registration using Devise gem and Bootstrap 4 for styling.
Key Features and Functionality:
User Management: Users can sign up and log in to the application User profiles include first and last names, which can be edited
Stock Tracking: Users can search for and view stock information The application utilizes the IEX API to fetch stock data Users can add stocks to their portfolio to track them Stocks can be updated if their value increases
Friend Tracking: Users can add and follow friends within the application Friend search functionality is implemented The application restricts stock tracking permissions for friends
User Interface and Styling: The application is styled using CSS and Bootstrap 4 Various views are created for user portfolio, stock listings, and results The application employs AJAX and JavaScript for handling responses
Additional functionality:
1. Used devise for user authentication. Refactoring devise to add first_name, last_name.
2. Used IEX api for stock analytics, company logo, price and percent change.
3. Form submissions through Ajax for stocks list and friends list.
4. Many to many association b/w users and stocks.
5. Self referrential association of user/friend.
6. Functionality to update the stock in case there is an increase in percent change.
7. Follow/Unfollow functionality for user.
8. Case sensitivity check for Stock ticker, so that there is no redundancy in db.
