Title of app: EZ Score

Project by: Karen Papazian (iOS), Justin Kobler (Backend), Joseph Mo (Backend) 

![alt text](https://github.com/jmo0428/EZScore/blob/master/ios-app/EZ_Score.png)
EZ Score logo.

![alt text](https://github.com/jmo0428/EZScore/blob/master/ios-app/MainScreen.png)

Main screen

![alt text](https://github.com/jmo0428/EZScore/blob/master/ios-app/Scores.png)

"Score" screen

![alt text](https://github.com/jmo0428/EZScore/blob/master/ios-app/Teams.png)

Screen when choosing teams to add to your favorites/rivals lists.


App Tagline: Updated baseball scores are EZ to find with EZ Score!

Short description of the app: With EZ Score, you don’t have to keep searching up all of your favorite baseball teams scores, you can look at all ballgame scores on one screen. You can add your favorite teams and your rival teams to keep an eye out on all rivalries throughout the league. We are looking to expand to the NBA, NHL and NFL in the near future!

How app addresses each of the iOS/Backend requirements:
- Using constraints was necessary when having to find the perfect height of cells. It was used to make the app look more pleasing and to create a favorite team section as well as a rival team section.
- UITableViews are being used to display the sports teams in an organized manner, all baseball teams are located on the second page of the app once you click “choose team.”
- UINaviationController was used to transition between screens such as the main screen and the score screen as well as the main screen and the “choose team” screen. A back button has been implemented on both screens.
- I wrote network code to connect with the backend, but never fully integrated because backend never deployed the server.

- Created database using SQLAlchemy that stored information including users, teams, home scores, and away scores.
- GET request interfaces with the database when retrieving information about team names and team scores
- POST request interfaces with the database when creating a new user, or adding a team into a user's favorite/rival team section
- DELETE request interfaces with the database when a user removes a team from their favorites

