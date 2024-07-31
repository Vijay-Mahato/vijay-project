import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vijay/services/functions/authentication.dart';

class AuthenticationForm extends StatefulWidget {
  const AuthenticationForm({super.key});

  @override
  State<AuthenticationForm> createState() => _AuthenticationFormState();
}

class _AuthenticationFormState extends State<AuthenticationForm> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String fName = '';
  String lName = '';
  bool isSignup = true;
  bool remmember = false;

  bool isShowPassword = true;

  changeIsSignupValue() {
    setState(() {
      isSignup = !isSignup;
    });
  }

  changeShowPasswordValue() {
    setState(() {
      isShowPassword = !isShowPassword;
    });
  }

  changeRemmemberValue() {
    setState(() {
      remmember = !remmember;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2,
        title: const Text(
          'Login / SignUp',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 25),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isSignup)
                      const Text(
                        "Register Account",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    const SizedBox(height: 5),
                    if (isSignup)
                      const Text(
                        "Complete your details or continue \nwith social media",
                        textAlign: TextAlign.center,
                      ),
                    if (!isSignup)
                      const Text(
                        "Welcome",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    const SizedBox(height: 5),
                    if (!isSignup)
                      const Text(
                        "Sign in with your email and password  \nor continue with social media",
                        textAlign: TextAlign.center,
                      ),
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    if (isSignup)
                      TextFormField(
                        key: const ValueKey('first_name'),
                        //keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide:
                                  const BorderSide(color: Colors.black)),
                          fillColor: Colors.grey.withOpacity(0.3),
                          filled: true,
                          prefixIcon: const Icon(Icons.person),
                          hintText: 'Enter First Name',
                          hintStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                          prefixIconColor: Colors.red,
                        ),
                        validator: (val) {
                          if (val.toString().length < 2) {
                            return 'Please Enter a Valid First Name';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) {
                          setState(() {
                            fName = val.toString();
                          });
                        },
                      ),
                    const SizedBox(height: 10),
                    if (isSignup)
                      TextFormField(
                        key: const ValueKey('last_name'),
                        // keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide:
                                    const BorderSide(color: Colors.black)),
                            fillColor: Colors.grey.withOpacity(0.3),
                            filled: true,
                            prefixIcon: const Icon(Icons.person),
                            hintText: 'Enter Last Name',
                            hintStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                            prefixIconColor: Colors.red),
                        validator: (val) {
                          if (val.toString().length < 2) {
                            return 'Please Enter a Valid Last Name';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) {
                          setState(() {
                            lName = val.toString();
                          });
                        },
                      ),
                    const SizedBox(height: 10),
                    TextFormField(
                      key: const ValueKey('email'),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          fillColor: Colors.grey.withOpacity(0.3),
                          filled: true,
                          prefixIcon: const Icon(Icons.email),
                          hintText: 'Enter Email',
                          hintStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                          prefixIconColor: Colors.red),
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
                      key: const ValueKey('password'),
                      obscureText: isShowPassword,
                      // keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          fillColor: Colors.grey.withOpacity(0.3),
                          filled: true,
                          prefixIcon: const Icon(Icons.security),
                          hintText: 'Enter Password',
                          hintStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                          prefixIconColor: Colors.red,
                          suffixIconColor: Colors.red,
                          suffixIcon: IconButton(
                              onPressed: () {
                                changeShowPasswordValue();
                              },
                              icon: isShowPassword
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility))),
                      validator: (val) {
                        if (val.toString().length < 6 ||
                            !val.toString().contains('#')) {
                          return 'Please Enter a Valid Password';
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
                    // const SizedBox(height: 20),
                    // Row(
                    //   children: [
                    //     Checkbox(
                    //       value: remmember,
                    //       onChanged: (value) {
                    //         setState(() {
                    //           remmember = value!;
                    //         });
                    //       },
                    //     ),
                    //     const Text("Remember me"),
                    //     const Spacer(),
                    //     GestureDetector(
                    //       onTap: () {},
                    //       child: Text(
                    //         "Forgot Password",
                    //         style: TextStyle(
                    //             color: Colors.blue[400],
                    //             decoration: TextDecoration.underline),
                    //       ),
                    //     )
                    //   ],
                    // ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.maxFinite,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            isSignup
                                ? AuthenticationFunctions.signUp(
                                    context, email, password, fName, lName)
                                : AuthenticationFunctions.signIn(
                                    email, password);
                          }
                        },
                        child: isSignup
                            ? const Text(
                                "SignUp",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              )
                            : const Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                      ),
                    ),
                    TextButton(
                        onPressed: () => changeIsSignupValue(),
                        child: isSignup
                            ? const Text("Already have an account? Login")
                            : const Text("Don't Have an account? Signup"))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
