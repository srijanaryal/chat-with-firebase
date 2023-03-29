import 'dart:io';

import 'package:chat/helper/helper_function.dart';
import 'package:chat/main.dart';
import 'package:chat/pages/Home.dart';
import 'package:chat/pages/login_page.dart';
import 'package:chat/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  String email = "";

  String password = '';
  String fullName = "";
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 158.0),
                child: Center(
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Column(
                            children: [
                              Text(
                                'Our Chat',
                                style: TextStyle(
                                    color: Colors.purple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Create account and Explore',
                                style: TextStyle(
                                    color: Colors.purple,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: Colors.pink,
                                      ),
                                      labelText: 'Name',
                                      labelStyle: TextStyle(
                                          color: Colors.purple,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20))),
                              TextFormField(
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.email,
                                        color: Colors.pink,
                                      ),
                                      labelText: 'Email',
                                      labelStyle: TextStyle(
                                          color: Colors.purple,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20))),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.password,
                                        color: Colors.pink,
                                      ),
                                      labelText: 'Password',
                                      labelStyle: TextStyle(
                                          color: Colors.purple,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20))),
                              SizedBox(
                                height: 55,
                              ),
                              SizedBox(
                                height: 50,
                                width: MediaQuery.of(context).size.width * 0.75,
                                child: MaterialButton(
                                  color: Colors.purple,
                                  onPressed: () {
                                    register();
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Already have an account?",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LogInPage()),
                                              );
                                            }
                                          },
                                          child: Text(
                                            " Login",
                                            style: TextStyle(
                                                color: Colors.pink,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ])),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      await authService
          .registerUserWithEmailandPassword(fullName, email, password)
          .then((value) async {
        if (value == true) {
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email);
          await HelperFunctions.saveUserNameSF(fullName);

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home()));
        } else {
          showSnackBar(
            context,
            Colors.red,
            value,
          );
          setState(() {
            isLoading = false;
          });
        }
      });
    }
    ;
  }
}
