import 'package:flutter/material.dart';
import 'package:myfood_app/widget/haveaccountornot.dart';
import 'package:myfood_app/widget/mybutton.dart';
import 'package:myfood_app/widget/mypasswordtextformfield.dart';
import 'package:myfood_app/widget/mytextformfield.dart';
import 'package:myfood_app/widget/toptitle.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static RegExp regExp = new RegExp(p);

  void validation(BuildContext context) {
    if (email.text.isEmpty && password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Both Fields Are Empty"),
        ),
      );
    } else if (email.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Email Is Empty"),
        ),
      );
    } else if (!regExp.hasMatch(email.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Email Is Not Valid "),
        ),
      );
    } else if (password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Password Is Empty"),
        ),
      );
    } else if (password.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Password Is Too Short"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 243, 174, 174),
      body: SafeArea(
        child: Builder(
          builder: (context) => Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                TopTitle(
                  subsTitle: "Welcome Back!",
                  title: "Login",
                ),
                Center(
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    color: Colors.white12,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyTextFormField(
                          title: "Email",
                          controller: email,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MyPasswordTextField(
                            title: "Password", controller: password),
                      ],
                    ),
                  ),
                ),
                MyButton(
                  name: "Login",
                  onPressed: () {
                    validation(context);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                HaveAccountOrNot(
                    title: "I Don't Have An Account", subTitle: "Sign Up"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
