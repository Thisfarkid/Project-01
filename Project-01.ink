VAR gf_name = ""
VAR outfit = "pjs"
VAR location = 0
VAR affection = 0
VAR time = 0
VAR date = ""
VAR resturant = ""
VAR genre = ""
VAR drink = ""
VAR food = ""
 ->start
==function advance_affection== 
~ affection = affection + 1
{ 
 - affection >= 0:
        ~ return ""
}
== function advance_time ==

    ~ time = time + 1
    
    {
        - time > 2:
            ~ time = 0
    }    
    
    {    
        - time == 0:
            ~ return ""
        
        - time == 1:
            ~ return ""
        
        - time == 2:
            ~ return ""
    
    }
    
    
        
    ~ return time
==start==
You wake up in your room. Its valentines day morning and you have a date with your girlfriend, Hayley tonight. What was your name for her?
*[Angel]
~gf_name = "Angel"
->room
*[Haze]
~gf_name = "Haze"
->room
*[Darling]
~gf_name = "Darling"
->room
==room==
You have a lot to do today, what will you do?
*[Text my {gf_name}] ->text_convo
+[Change clothes] ->get_ready
*[Make a plan for the date]->Location_choice
*{Location_choice}[Head out]->gfs_house
==text_convo== 
{advance_affection()}
You pull up your phone and bring up your dms.
"Heyyy. Good morning {gf_name}. I love youuuu. So excited for tn!" 
"Good morning baby," She replies, "I love you tooooo. I'm excited tooo."
*["You want me to pick you up?"]->text_convo1
*["When do you want to go out?"]->text_convo2
*["I have to go now baby. Gotta get ready for tn. I love youuu"] ->room
==text_convo1==
"Yeah baby, could you pick me up from my dorm?" 
"Ofc {gf_name}."
*{not text_convo2} ["What time?"] ->text_convo2
*{text_convo1 and text_convo2}["I have to go now baby. Gotta get ready for tn. I love youuu"] ->room
==text_convo2==
"Whenever you want" 
*{not text_convo1} ["You want me to pick you up?"]->text_convo1
*{text_convo1 and text_convo2}["I have to go now baby. Gotta get ready for tn. I love youuu"] ->room
==get_ready==
->closet
==closet==
You're at your closet. 
*{outfit!="suit"}[Suit]
~outfit = "suit"
->outfit_choice
*{outfit!="casual"}[Jeans and a T-shirt]
~outfit = "casual wear"
->outfit_choice
*{outfit!="emo set"}[Emo set]
~outfit = "emo set"
->outfit_choice
*{outfit!="comfy set"}[Sweats and a hoodie]
~outfit = "comfy set"
->outfit_choice
*{outfit!="pjs"}[pjs]
~outfit = "pjs"
->outfit_choice
*[Back]->room
==outfit_choice==
You change out of your clothes and put on your {outfit}.
->closet
==Location_choice==
Which do you think would be best for tonight?
*[Fancy resturant]->resturant_choice
*[The theater]->moviechoice
==moviechoice==
->Location_choice2
==resturant_choice==
What kind of food are you thinking?
*[Asian]
~resturant="fancy asian"
->Location_choice2
*[Mexican]
~resturant="fancy mexican"
->Location_choice2
*[Steakhouse]
~resturant="fancy steakhouse"
->Location_choice2
==Location_choice2==
Would you like to do anything else on the date?
+[Yes]->Location_choice
+[No]->room
    -> END
==gfs_house==
You send your gf a text telling her you're coming to pick her up and head out to her dorm. When you arrive she's waiting outside wearing {outfit=="suit":a beautiful red dress} {outfit=="casual wear":a cute, short white dress with a jean jacket} {outfit=="emo set":a black dress with fishnets} {outfit=="comfy set":sweats and a hoodie} {outfit=="pjs":sweats and a t-shirt, hair in a messy bun}. She looks up as you pull next to her and a smile breaks across her face. 
"Hey baby! I missed you!" she exclaims
"Hi {gf_name}. I missed you too"
*[Get out and open the door for her]->door_option
*[Unlock the door for her]->door_option2
==door_option==
{advance_affection()}
You climb out the car and open the passenger's side for her, "After you {gf_name}." She very happily slides into the car ->car_convo
==door_option2==
You unlock the door. "Hop in!" You tell her. She looks a little disappointed but climbs in. ->car_convo
==car_convo==
"So what's the plan{affection>0: baby}?"
*[Tell her the plan]->car_convo2
*[Don't tell her]->car_convo3
==car_convo2==
"My plan was that we'd go{resturant=="fancy asian": eat at a really nice asian place} {resturant=="fancy mexican": eat at a really fancy mexican place}{resturant=="fancy steakhouse": eat at a fancy steakhouse}{resturant_choice and moviechoice: and}{moviechoice: watch a movie}. Ready to get started?"
"So ready." she says smiling.
You pull out of the drive way and head out.
*{resturant== "fancy mexican"}[Resturant]->mexican_place
*{resturant== "fancy asian"} [Resturant]->asian_place
*{resturant== "fancy steakhouse"} [Resturant]->steakhouse
*[Theater]->theater
==car_convo3== 
"It's a secret {gf_name}. I'm making sure you have an amazing night tonight."
"Oh? By all means lead the way" She says eyebrow raised
*{resturant== "fancy mexican"}[Resturant]->mexican_place
*{resturant== "fancy asian"} [Resturant]->asian_place
*{resturant== "fancy steakhouse"} [Resturant]->steakhouse
*[Theater]->theater
==mexican_place==
You pull up at Los Arroyos, your favorite resturant and hop out of the car, {door_option: heading to her side of the car to open her door,} "Lets go inside {gf_name}"
The inside of the resturant is full of music and chatter, with beautiful paintings lining the walls. A waiter leads you to your booth and hands you some menus. "Can I start you off with some drinks?" the waiter asks.
*[Water]
~drink = "water"
->mexicanpt2
*[Soda]
~drink = "soda"
->->mexicanpt2
*[Tequila]
~drink = "tequila"
->mexicanpt2
==mexicanpt2==
"Alright I'll get that {drink} for you." The waiter turns to your gf, "And for you?"
"I'll get a cherry coke" She replies.
"Alright, I'll be back in a few minutes with those drinks and take the rest of your order." The waiter walks away, and now its just you and your gf there.
*[Talk]->resturant_talk
*[Wait]->mexicanpt3
==resturant_talk==
*["I love {outfit=="suit":the dress {gf_name}, you look amazing tonight."} {outfit=="casual wear":the dress {gf_name}, and that jacket is really cute."} {outfit=="emo set":the dress {gf_name}, it looks so hot with the fishnets."} {outfit=="comfy set":the hoodie, you look so comfy {gf_name}} {outfit=="pjs":the outfit {gf_name}, you look adorable}]->compliment
*["How was your day?"]->smalltalk
==compliment==
{advance_affection ()}
"Thanks you baby," she says blushing. "You dont look to bad yourself" 
->resturant_talk
==smalltalk==
"It was okay. I was waiting for you all day. How was your's?"
"It was good, I was getting ready and plannning out our night together." 
*[Wait]->mexicanpt3
==mexicanpt3==
The waiter comes back with the drinks, "Alright have you all decided on what you want to order?" 
"Yeah I'll have 
{resturant=="steakhouse"} [Steak]
->steakhouse2
*{resturant=="steakhouse"} [Burger]
->steakhouse2
*{resturant=="steakhouse"} [Salad]
->steakhouse2
==mexicanpt4==
{advance_time()}
"And for you?"
"Same as him." 
The waiter walks away and not long after comes back with the food and places it in front of you. After you both finish eating you walk back to the car{affection==3: with her arm looped through yours}.
->night_end
==asian_place==
You pull up at Shogun, your favorite resturant and hop out of the car, {door_option: heading to her side of the car to open her door,} "Lets go inside {gf_name}"
The inside of the resturant is full of music and chatter, different kinds of sculptures lining the walls. A waiter leads you to your booth and hands you some menus. "Can I start you off with some drinks?" the waiter asks.
*[Water]
~drink = "water"
->mexicanpt2
*[Soda]
~drink = "soda"
->mexicanpt2
*[Sake]
~drink = "sake"
->mexicanpt2
==asian2==
{advance_time()}
"And for you?"
"Same as him." 
The waiter walks away and not long after comes back with the food and places it in front of you. After you both finish eating you walk back to the car{affection==3: with her arm looped through yours}.
*{time >= 2}{affection==3} [Ask her to be your valentine] ->Valentine
*{moviechoice}[Drive to the theater]->theater
*{not moviechoice} [Drive back]->night_end
==steakhouse==
You pull up at the steakhouse and hop out of the car, {door_option: heading to her side of the car to open her door,} "Lets go inside {gf_name}"
The inside of the resturant is full of music and chatter, the strong scent of grease in the air. A waiter leads you to your booth and hands you some menus. "Can I start you off with some drinks?" the waiter asks.
*[Water]
~drink = "water"
->mexicanpt2
*[Soda]
~drink = "soda"
->mexicanpt2
*[Beer]
~drink = "beer"
->mexicanpt2
==steakhouse2==
{advance_time()}
"And for you?"
"Same as him." 
The waiter walks away and not long after comes back with the food and places it in front of you. After you both finish eating you walk back to the car->night_end
==theater==
You pull up to the theater and hop out of the car, {door_option: heading to her side of the car to open her door,} "Lets go inside {gf_name}."
As you walk inside the theater you hear the sound of movie trailers and a arcade to the right. You walk up to the register to buy the movie tickets. What do you want to watch?
*[Horror]
~genre = "horror"
->theater2
*[Romance]
~genre = "romance"
->theater2
*[Comedy]
~genre = "comedy"
->theater2
*[Action]
~genre = "action"
->theater2
==theater2==
You purchase the tickets and walk away. Theres still some time till the movie starts. You can go to the arcade or watch the adds and trailers before the movie
*[Arcade]-> arcade
*[Watch]->theaterroom
==arcade==
{advance_affection ()}
You and your gf walk over to the arcade, what game do you want to play?
*[Air Hockey]->hockey
*[Hoops]->hoops
==hockey==
You challenge your girl to a game of air hockey. You beat her fairly easily and defend you honor as the better air hockey player. She gets a little upset that she lost. {not hoops:You have enough time to play another game but you can go to the movie room and get good seats. }{Movieend:Do you want to play another game?}
+{not hoops}[Play another game?]->hoops
*[Get your seats]->theaterroom
*{Movieend}[Leave]->night_end
==hoops==
You foolishly challenge your girl to a game of hoops. She easily doubles your score. 
"Ha loser." She says cheering. She does a little victory dance as she gloats. You can't help but smile as she does so. {not hockey:You have enough time to play another game. }{Movieend:Do you want to play another game?}
+{not hockey}[Play another game?]->hockey
*[Get your seats]->theaterroom
*{Movieend}[Leave]->night_end
==theaterroom== 
You go get seats {hoops and hockey:in the middle row in the back} {not hoops and hockey: on right by the door}. The moive starts in 5 minutes, do you want to get snacks?
*[Yes]->snack
*[No]->theaterroom2
==snack==
As you get up to grab some snacks you {gf_name} turns to you and ask, "Hey baby can you get me some snacks too?"
"Yes {gf_name} ofc I will. What would you like?"
"Chocolate and cherry coke please."
"Alright I gotchu." You walk out of the room and back to the register and order your girlfriend's snacks. What would you like for yourself?
*[Popcorn]
~food = "popcorn" 
->snacks
*[Chocolate]
~food="chocolate"
->snacks
*[Coke]
~food="coke"
->snacks
*[Dr. pepper]
~food="dr. pepper"
->snacks
==snacks==
You want anything else?
*[Yes]->snack2
*[No]->theaterroom2
==snack2==
*{not food == "popcorn"}[Popcorn]
~food = "popcorn" 
->theaterroom2
*{not food == "chocolate"}[Chocolate]
~food="chocolate"
->theaterroom2
*{not food == "coke"}[Coke]
~food="coke"
->theaterroom2
*{not food == "dr. pepper"}[Dr. pepper]
~food="dr. pepper"
->theaterroom2
==theaterroom2==
{snacks: You buy the snacks and walk back to the movie room and sit next to your girl.} The movie starts {snacks:as you divy out food }and your gf rests her hands on the arm rests.
*[Take her hand]->romance
*[Keep watching]->Movieend
==romance==
{advance_affection()}
You take ahold of her hand and she smiles
->Movieend
==Movieend==
You reach the end of the movie feeling content with the events. You walk out the room with your gf's arm looped through yours. You can go to the arcade or leave.
*[Arcade]->arcade
*{not resturant_choice}[Leave]->night_end
*{resturant== "fancy mexican"}[Resturant]->mexican_place
*{resturant== "fancy asian"} [Resturant]->asian_place
*{resturant== "fancy steakhouse"} [Resturant]->steakhouse
==night_end==
{advance_time ()}
You drive back to the dorm after an amazing night and pull up into the drive.
*[Get out and open the door for her]->night_end1
*[Unlock the door for her]->night_end2
==night_end1==
{advance_affection()}
You get out of the car and help her out by the hand
"I had an amazing night {gf_name}. Did you enjoy your time?"
{affection >=3:"I loved it baby, best night so far"}->night_end3
{affection <3: "Yup it was nice."}->night_end4
==night_end2==
You unlock the door for her.
"I had an amazing night {gf_name}. Did you have a good time?"
{affection >=3:"I loved it baby, best night so far"}
{affection <3: "Yup it was nice."}
==night_end3==
"Thanks amazing to hear {gf_name}. Before the night ends, I have one last thing to ask you. Will you, my amazing, beautiful, {gf_name}, be my valentine, this year and all to come?"
{affection >=3:->Valentine}
{affection<3: ->lrizz}
==night_end4==
"That's good to hear. Before the night ends though, I have one last thing to ask of you. Will you be my valentine?" ->lrizz
==Valentine==
She blushes and smiles, looks down at the floor and you tilt her chin back up to face you. "C'mon {gf_name} look at me when you're talking to me."
"Yes, of course baby. I love you. I will be your valentine always."
You pull her in close to end the night off with one magical kiss
->END
==lrizz==
How did you do so poorly???? Try again.
