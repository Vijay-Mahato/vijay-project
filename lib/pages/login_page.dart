import 'package:flutter/material.dart';
import 'package:vijay/pages/signup_pages.dart';
import 'package:vijay/services/functions/authentication.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // here we are declare varriable and functions
  final _formkey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool isShowPassword = true;
  changeShowPasswordValue() {
    setState(() {
      isShowPassword = !isShowPassword;
    });
  }

  bool ischeck = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assests/background_images/login_background_images.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Welcome",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Sign in with your email and password  \nor continue with social media",
                      style: TextStyle(color: Colors.grey.shade300),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 60),
              Form(
                key: _formkey,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Column(
                    children: [
                      TextFormField(
                        key: const ValueKey('email'),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 18),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          fillColor: Colors.grey.shade300,
                          filled: true,
                          prefixIcon: const Icon(Icons.email),
                          hintText: 'Enter Your Email',
                          hintStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                          prefixIconColor: Colors.lightBlueAccent.shade400,
                        ),
                        validator: (val) {
                          if (val.toString().isEmpty ||
                              !val.toString().contains('@')) {
                            return 'Please Enter a Valid Email';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) {
                          setState(() {
                            email = val.toString();
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        key: const ValueKey("Password"),
                        obscureText: isShowPassword,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 18),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide:
                                  const BorderSide(color: Colors.black)),
                          fillColor: Colors.grey.shade300,
                          filled: true,
                          hintText: "Enter Your Password",
                          hintStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                          prefixIcon: const Icon(Icons.security),
                          suffixIcon: IconButton(
                              onPressed: () {
                                changeShowPasswordValue();
                              },
                              icon: isShowPassword
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off)),
                          suffixIconColor: Colors.lightBlueAccent.shade400,
                          prefixIconColor: Colors.lightBlueAccent.shade400,
                        ),
                        validator: (val) {
                          if (val.toString().length < 5 ||
                              !val.toString().contains("#")) {
                            return "Please Enter A Strong Password";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) {
                          setState(() {
                            password = val.toString();
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                              value: ischeck,
                              onChanged: (val) {
                                setState(() {
                                  ischeck = !ischeck;
                                });
                              }),
                          const Text(
                            "Remmember Me",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(width: 60),
                          Text(
                            "Forget Password",
                            style: TextStyle(
                              color: Colors.blue.shade400,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 42,
                        width: double.maxFinite,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              _formkey.currentState!.save();
                              AuthenticationFunctions.signIn(email, password);
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.blue), // Change the color here
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const SignupPage();
                            }));
                          },
                          child: const Text(
                            "Don't Have an account? Signup.",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
