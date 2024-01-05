import 'package:budget_buddy/SignUpScreen.dart';
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
            
              const Text(
              'Realize your\npotential\neverywhere',
              style: TextStyle(fontSize: 40, color: Colors.black87, fontWeight: FontWeight.w800, 
            ),),

            const SizedBox(height: 10),
            
              Text('Your BudgetBuddy account is your\nkey to unlock a universe of opportunities', style: TextStyle(fontSize: 20, color: Colors.black54, fontWeight: FontWeight.w700),),
           
            const SizedBox(height: 20),
             
            Row( 
              children: [ 
                const SizedBox( width: 318),
                FloatingActionButton(
               backgroundColor: Colors.white,
               
               elevation: 0,
               onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
               },
               child: const Icon(
                Icons.arrow_forward,
                 size: 35,
                 color: Colors.black,
                ),
              ),
              ]
              )
          ],
        ),
      ),
    );
  }
}