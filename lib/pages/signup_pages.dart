import 'package:flutter/material.dart';
import 'package:vijay/pages/insta_profile_page.dart';
import 'package:vijay/services/functions/authentication.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
// here we are declare varriable
  final _formkey = GlobalKey<FormState>();
  String firstName = "";
  String lastName = "";
  String email = "";
  String password = "";
  bool isChecked = false;
  bool isShowPassword = true;

  changeIsShowPassword() {
    setState(() {
      isShowPassword = !isShowPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  "assests/background_images/signup_background_images.png"),
              fit: BoxFit.cover)),
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
                  children: [
                    const Text(
                      "Register Account",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Complete your details or continue \nwith social media",
                      style: TextStyle(color: Colors.grey.shade300),
                      textAlign: TextAlign.center,
                    ),
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
                        key: const ValueKey("First Name"),
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
                          hintText: "Enter Your First Name",
                          hintStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                          prefixIcon: const Icon(Icons.person),
                          prefixIconColor: Colors.lightBlueAccent.shade400,
                        ),
                        validator: (val) {
                          if (val.toString().length < 2) {
                            return "Please Enter a Valid First Name";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) {
                          setState(() {
                            firstName = val.toString();
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        key: const ValueKey("Last Name"),
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
                          hintText: "Enter Your Last Name",
                          hintStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                          prefixIcon: const Icon(Icons.person),
                          prefixIconColor: Colors.lightBlueAccent.shade400,
                        ),
                        validator: (val) {
                          if (val.toString().length < 2) {
                            return "Please Enter a Valid Last Name";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) {
                          setState(() {
                            lastName = val.toString();
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        key: const ValueKey("Email"),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 18),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide:
                                  const BorderSide(color: Colors.black)),
                          fillColor: Colors.grey.shade300,
                          filled: true,
                          hintText: "Enter Your Email",
                          hintStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                          prefixIcon: const Icon(Icons.email),
                          prefixIconColor: Colors.lightBlueAccent.shade400,
                        ),
                        validator: (val) {
                          if (val.toString().isEmpty ||
                              !val.toString().contains("@")) {
                            return "Please Enter a Valid Email";
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
                        keyboardType: TextInputType.text,
                        obscureText: isShowPassword,
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
                            prefixIconColor: Colors.lightBlueAccent.shade400,
                            suffixIcon: IconButton(
                              onPressed: () {
                                changeIsShowPassword();
                              },
                              icon: isShowPassword
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                            ),
                            suffixIconColor: Colors.blue.shade500),
                        validator: (val) {
                          if (val.toString().length < 5 ||
                              !val.toString().contains("#")) {
                            return "Please Enter a Strong Password";
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
                      Row(
                        children: [
                          Checkbox(
                              value: isChecked,
                              onChanged: (val) {
                                setState(() {
                                  isChecked = !isChecked;
                                });
                              }),
                          const Text(
                            "Remmember Me",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          Expanded(
                            child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Forgot Password",
                                  style: TextStyle(
                                      color: Colors.lightBlue.shade900,
                                      fontWeight: FontWeight.w500),
                                )),
                          ),
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
                              AuthenticationFunctions.signUp(context, email,
                                  password, firstName, lastName);
                            }
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) {
                            //   return InstaProfilePage();
                            // }));
                          },
                          child: const Text(
                            "Signup",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.blue.shade500),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Already Have an account? Login.",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
