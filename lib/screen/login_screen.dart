import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           SizedBox(height: 100,),

            Text('Enter your Name',style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,

            ),
              textAlign: TextAlign.center,),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: nameController,
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  label: Text('Name'),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            SizedBox(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  preferences.setBool("continue", true);
                  Navigator.pushReplacementNamed(
                    context,
                    'home_screen',
                    arguments: nameController.text,
                  );
                },
                child: Text("Continue"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
