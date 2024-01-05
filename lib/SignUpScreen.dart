import 'package:budget_buddy/HomeScreen.dart';
import 'package:budget_buddy/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpScreen extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 0, 0, 0),
          shape: BoxShape.rectangle,
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Image.asset('assets/icons/bbr.png', scale: 2),
            const Text(
              'Create \nAccount',
              style: TextStyle(
                fontSize: 34.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              controller: emailController, 
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              controller: passwordController, 
              decoration: const InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              style: const ButtonStyle(),
              onPressed: () async {
                Map<String, dynamic> userData = {
                  'username': usernameController.text,
                  'email': emailController.text,
                  'password': passwordController.text,
                };

                String jsonData = jsonEncode(userData);
                print(jsonData);

                var response = await http.post(
                  Uri.parse('http://192.168.230.6:8080/api/users/signup'),
                  headers: {'Content-Type': 'application/json'},
                  body: jsonData,
                );

                if (response.statusCode == 201) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                } else {
                  print('Registration failed. Status code: ${response.statusCode}');
                }
              },
              child: const Text('Sign Up'),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Already have an account?'),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
