// signup.dart
import 'package:flutter/material.dart';
import 'package:myfood_app/widget/gender.dart';
import 'package:myfood_app/widget/haveaccountornot.dart';
import 'package:myfood_app/widget/mybutton.dart';
import 'package:myfood_app/widget/mypasswordtextformfield.dart';
import 'package:myfood_app/widget/mytextformfield.dart';
import 'package:myfood_app/widget/toptitle.dart';

class SignUp extends StatefulWidget {
  final VoidCallback onLogin;

  SignUp({required this.onLogin});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _signUp() {
    String email = emailController.text.trim();
    String fullName = fullNameController.text.trim();
    String phoneName = phoneNameController.text.trim();
    String address = addressController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty ||
        fullName.isEmpty ||
        phoneName.isEmpty ||
        address.isEmpty ||
        password.isEmpty) {
      _showSnackBar("All fields are required.");
      return;
    }

    // Add signup logic here

    // After signup, navigate back to Login page
    Navigator.of(context).pop(); // Pop the current SignUp page
  }

  void _showSnackBar(String message) {
    final scaffoldContext = _scaffoldKey.currentState?.context;
    if (scaffoldContext != null) {
      ScaffoldMessenger.of(scaffoldContext).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TopTitle(subsTitle: "Create an Account", title: "SignUp"),
              SizedBox(height: 20),
              SignUpForm(
                emailController: emailController,
                fullNameController: fullNameController,
                phoneNameController: phoneNameController,
                addressController: addressController,
                passwordController: passwordController,
                onSignUp: _signUp,
              ),
              HaveAccountOrNot(
                title: "I Have Already An Account? ",
                subTitle: "Login",
                onTap: widget.onLogin,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController fullNameController;
  final TextEditingController phoneNameController;
  final TextEditingController addressController;
  final TextEditingController passwordController;
  final VoidCallback onSignUp;

  SignUpForm({
    required this.emailController,
    required this.fullNameController,
    required this.phoneNameController,
    required this.addressController,
    required this.passwordController,
    required this.onSignUp,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height - 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyTextFormField(
              title: "FullName",
              controller: fullNameController,
            ),
            MyTextFormField(
              title: "Email",
              controller: emailController,
            ),
            MyTextFormField(
              title: "PhoneName",
              controller: phoneNameController,
            ),
            MyTextFormField(
              title: "Address",
              controller: addressController,
            ),
            Gender(),
            MyPasswordTextField(
              title: "Password",
              controller: passwordController,
            ),
            MyButton(
              name: "Sign Up",
              onPressed: onSignUp,
            ),
          ],
        ),
      ),
    );
  }
}
