import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class InstaHomePage extends StatefulWidget {
  const InstaHomePage({super.key});

  @override
  State<InstaHomePage> createState() => _InstaHomePageState();
}

class _InstaHomePageState extends State<InstaHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 2,
        backgroundColor: Colors.white,
        title: const Text(
          "Instagram",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
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
            // Stories

            Container(
              margin: const EdgeInsets.all(6),
              height: 110,
              child: ListView.builder(
                  itemCount: 100,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(3),
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(75),
                              border: Border.all(color: Colors.blue, width: 4)),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(4.5),
                          child: Text(
                            "user_name",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
                      ],
                    );
                  }),
            ),

            // Posts
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 1),
                        height: 400,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Colors.grey.withOpacity(0.5),
                              width: 1,
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              color: Colors.white,
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(45),
                                        // border: Border.all(
                                        //     color: Colors.blue, width: 3),
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              "assests/my_all_images/holi_images/holi_image_12.jpeg"),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Text(
                                      "vijay_username",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                child: Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assests/my_all_images/holi_images/holi_image_7.jpeg",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )),
                            Container(
                              height: 50,
                              color: Colors.white,
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.favorite_outline_rounded,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.send_sharp,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.comment_rounded,
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.bookmark_outline_outlined,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
