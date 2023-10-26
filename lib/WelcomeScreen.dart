import 'package:budget_buddy/SignUpScreen.dart';
import 'package:budget_buddy/utils/colors.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.start,
          children: [
            Image.asset('assets/images/enhance.png'), 
            const SizedBox( 
            height:10 ),
            
              Text(
              'Realize your\npotential\neverywhere',
              style: TextStyle(fontSize: 40, color: Colors.black87, fontWeight: FontWeight.w800, 
            ),),

            SizedBox(height: 10),
            
              Text('Your BudgetBuddy account is your\nkey to unlock a universe of opportunities', style: TextStyle(fontSize: 20, color: Colors.black54, fontWeight: FontWeight.w700),),
           
            SizedBox(height: 20),
             
            FloatingActionButton(
               backgroundColor: buttonColor,
               
               elevation: 50,
               onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
               },
               child: Icon(
                Icons.arrow_forward,
                 size: 35,
                 color: Colors.black,
                ),
              ),
          ],
        ),
      ),
    );
  }
}