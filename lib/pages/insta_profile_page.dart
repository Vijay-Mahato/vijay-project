import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/insta_profile_display_number_widget.dart';

class InstaProfilePage extends StatefulWidget {
  const InstaProfilePage({super.key});

  @override
  State<InstaProfilePage> createState() => _InstaProfilePageState();
}

class _InstaProfilePageState extends State<InstaProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
        title: const Text(
          "Unblast_",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.logout_outlined),
            color: Colors.red,
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            // profile display
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          child: Container(
                            margin: const EdgeInsets.all(15),
                            height: 85,
                            width: 85,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(85),
                                border:
                                    Border.all(color: Colors.blue, width: 4)),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(top: 1),
                            child: Column(
                              children: [
                                Container(
                                    child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InstaProfileDisplayNumber(
                                        count: "371", label: "posts"),
                                    InstaProfileDisplayNumber(
                                        count: "15.7k", label: "followers"),
                                    InstaProfileDisplayNumber(
                                        count: "272", label: "following"),
                                  ],
                                )),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 7, right: 15, top: 7),
                                  height: 30,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.white,
                                  ),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.blue),
                                    ),
                                    child: const Text(
                                      "Follow",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Unblast",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "E-commerce Websites ",
                          style: TextStyle(
                            color: Colors.grey.withOpacity(0.5),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          "Selective free resources for designers @unblast.",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Text(
                          "Melboume, Victoria, Austrailia ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Text(
                          "https://www.google.com/maps/",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Highlight
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(5),
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(90),
                          border: Border.all(color: Colors.blue, width: 4)),
                    );
                  }),
            ),

            // Direction
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: Colors.grey.withOpacity(0.5), width: 1),
                      bottom: BorderSide(
                          color: Colors.grey.withOpacity(0.5), width: 1))),
              child: const Center(
                child: Text(
                  "Direction",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),

            // Profile grid view
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 3,
                            mainAxisSpacing: 3),
                    itemCount: 102,
                    itemBuilder: (context, index) {
                      return Container(
                          decoration: const BoxDecoration(
                              color: Colors.black,
                              border: Border(
                                  top: BorderSide(color: Colors.blue, width: 2),
                                  bottom: BorderSide(
                                      color: Colors.blue, width: 2))));
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
