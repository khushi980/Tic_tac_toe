import 'dart:html';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe/game_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 List <gameButton> buttonslist =[];
 var player1;
 var player2 ;
 var activeplayer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buttonslist= doInit();
  }

  List<gameButton> doInit(){
    player1 = [];
    player2 = [];
    activeplayer=1;

 var gamebuttons = <gameButton>[
   gameButton(id: 1),
   gameButton(id: 2),
   gameButton(id: 3),
   gameButton(id: 4),
   gameButton(id: 5),
   gameButton(id: 6),
   gameButton(id: 7),
   gameButton(id: 8),
   gameButton(id: 9),
 ];
 return gamebuttons;
  }

 void playGame(gameButton gb){
   setState(() {
     if(activeplayer == 1){
       gb.text= 'X';
       gb.bg=Colors.purple;
       activeplayer=2;
       player1.add(gb.id);
     }
     else{
       gb.text= '0';
       gb.bg=Colors.orangeAccent;
       activeplayer=1;
       player2.add(gb.id);
     }
     gb.enabled=false;
     checkWinner();
   });

 }
 void checkWinner(){
    var winner =-1;
    if(player1.contains(1)&&player1.contains(5)&& player1.contains(9)){winner =1;} //diagonal
    if(player1.contains(3)&&player1.contains(5)&& player1.contains(7)){winner =1;} //diagonal
    if(player1.contains(1)&&player1.contains(2) && player1.contains(3)){winner =1;} //row1
    if(player1.contains(4)&&player1.contains(5) && player1.contains(6)){winner =1;} //row2
    if(player1.contains(7)&&player1.contains(8) && player1.contains(9)){winner =1;} //row3
    if( player1.contains(1) && player1.contains(4) && player1.contains(7)){winner =1;} //col1
    if( player1.contains(2) && player1.contains(5) && player1.contains(8)){winner =1;} //col2
    if( player1.contains(3) && player1.contains(6) && player1.contains(9)){winner =1;} //col3
    if(player2.contains(1)&&player2.contains(5)&& player2.contains(9)){winner =2;} //diagonal
    if(player2.contains(3)&&player2.contains(5)&& player2.contains(7)){winner =2;} //diagonal
    if(player2.contains(1)&&player2.contains(2) && player2.contains(3)){winner =2;} //row1
    if(player2.contains(4)&&player2.contains(5) && player2.contains(6)){winner =2;} //row2
    if(player2.contains(7)&&player2.contains(8) && player2.contains(9)){winner =2;} //row3
    if( player2.contains(1) && player2.contains(4) && player2.contains(7)){winner =2;} //col1
    if( player2.contains(2) && player2.contains(5) && player2.contains(8)){winner =2;} //col2
    if( player2.contains(3) && player2.contains(6) && player2.contains(9)){winner =2;} //col3
   
   if(winner!=-1){
     if(winner==1){
       showDialog(context: context, builder: (_)=> customDialog('Player 1 Won', "Press the reset button to start again", resetgame));
     }
     else{
       showDialog(context: context, builder: (_)=> customDialog('Player 2 Won', "Press the reset button to start again", resetgame));
     }
   }
 }

 void resetgame(){
    if(Navigator.canPop(context)) Navigator.pop(context);
   setState(() {
     buttonslist = doInit();
   });
 }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tic tac toe"),),
    body: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
      crossAxisSpacing: 9.0,
      mainAxisSpacing: 9.0),
      padding: EdgeInsets.all(10.0),
      itemCount: buttonslist.length,
      itemBuilder: (context,i)=> SizedBox(
        width: 100,
        height: 100,
        child: RaisedButton(
          padding: const EdgeInsets.all(8.0),
          onPressed: buttonslist[i].enabled?()=>playGame(buttonslist[i]):null,
          child: Text(buttonslist[i].text, style: TextStyle(color: Colors.pinkAccent, fontSize: 20.0),),
       color: buttonslist[i].bg,
        disabledColor: buttonslist[i].bg,),
      ),

    )
    );
  }
}


