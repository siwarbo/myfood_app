// login.dart
import 'package:flutter/material.dart';
import 'package:myfood_app/screens/signup.dart';
import 'package:myfood_app/widget/haveaccountornot.dart';
import 'package:myfood_app/widget/mybutton.dart';
import 'package:myfood_app/widget/mypasswordtextformfield.dart';
import 'package:myfood_app/widget/mytextformfield.dart';
import 'package:myfood_app/widget/toptitle.dart';

class Login extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 243, 174, 174),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                TopTitle(
                  subsTitle: "Welcome Back!",
                  title: "Login",
                ),
                LoginForm(
                  emailController: emailController,
                  passwordController: passwordController,
                ),
                HaveAccountOrNot(
                  title: "I Don't Have An Account",
                  subTitle: "Sign Up",
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (ctx) => SignUp(onLogin: () {
                                Navigator.of(ctx).pop(); // Pop SignUp page
                              })),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  LoginForm({
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300,
        width: double.infinity,
        color: Colors.white12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextFormField(
              title: "Email",
              controller: emailController,
            ),
            SizedBox(height: 10),
            MyPasswordTextField(
              title: "Password",
              controller: passwordController,
            ),
            SizedBox(height: 20),
            MyButton(
              name: "Login",
              onPressed: () {
                String email = emailController.text.trim();
                String password = passwordController.text.trim();

                if (email.isEmpty || password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Email and password are required."),
                    ),
                  );
                  return;
                }

                // Add login logic here
              },
            ),
          ],
        ),
      ),
    );
  }
}
