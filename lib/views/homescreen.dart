import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:chatgpt_app/main.dart';
import 'package:chatgpt_app/models/market_model.dart';
import 'package:chatgpt_app/views/locatenative.dart';
import 'package:chatgpt_app/views/market.dart';
import 'package:chatgpt_app/views/scanScreen.dart';
import 'package:chatgpt_app/views/speakNative.dart';
import 'package:chatgpt_app/views/suggestplan.dart';
import 'package:chatgpt_app/views/travelcard.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String subAdminArea = "";
  String postal = "";

  late List<UserModel>? _userModel = [];
  bool selected = false;
  int itemNumber = 0;
  List<String> buyList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void showNotification() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        //   centerTitle: true,
        //   title: RichText(
        //       text: TextSpan(
        //           style: GoogleFonts.poppins(
        //               fontSize: 40, fontWeight: FontWeight.bold),
        //           children: [
        //         TextSpan(
        //             text: "tra",
        //             style: GoogleFonts.poppins(
        //                 color: Theme.of(context).primaryColorLight)),
        //         TextSpan(
        //             text: "well",
        //             style: GoogleFonts.poppins(
        //                 color: Theme.of(context).primaryColor)),
        //       ])),
        // ),
        body: Stack(
          children: [
            Column(
              children: [
                // Container(
                //   //height: 750,
                //   width: 400,
                //   decoration: const BoxDecoration(
                //     image: DecorationImage(
                //         opacity: 0.9,
                //         fit: BoxFit.cover,
                //         image: AssetImage("assets/bg.png")),
                //   ),
                // ),

                // ColorFiltered(
                //     colorFilter: ColorFilter.mode(
                //         Colors.white.withOpacity(0.5), BlendMode.dstATop),
                //     child: Image.asset("assets/bg.png")),
              ],
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    //height: 375,
                    width: 400,
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).primaryColorLight.withOpacity(0.2),
                      image: DecorationImage(
                          opacity: 0.15,
                          fit: BoxFit.cover,
                          image: AssetImage("assets/bg.png")),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hey!\nWelcome to",
                            style: GoogleFonts.poppins(
                                fontSize: 23,
                                color: Theme.of(context).primaryColor),
                          ),
                          Text(
                            "Crypto-AI",
                            style: GoogleFonts.poppins(
                                fontSize: 23,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          // Row(
                          //   children: [
                          //     Text(
                          //       "Postal Code: ",
                          //       style: GoogleFonts.poppins(
                          //           fontSize: 13, color: Colors.white),
                          //     ),
                          //     Text(
                          //       "680009",
                          //       style: GoogleFonts.poppins(
                          //           fontSize: 13,
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.bold),
                          //     ),
                          //   ],
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, right: 20, bottom: 10.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 160,
                                width: 160,
                                child: const Image(
                                    image: AssetImage(
                                        "assets/crypto-ai-logo.png")),
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   height: 50,
                          // ),
                          // Container(
                          //   width: 200,
                          //   height: 5,
                          //   color: Colors.blue,
                          // )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: DesName(
                          fname: "   Our ",
                          sname: "Services",
                          size: 20,
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SpeakNative()));
                        },
                        child: ShadowButton(
                            sname: " ",
                            fname: "AI-Chat",
                            width: 160,
                            icon: Icon(
                              Icons.monetization_on,
                              color: Theme.of(context).primaryColor,
                            ),
                            fsize: 11),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      // const SizedBox(
                      //   width: 15,
                      // ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LocateNative()));
                        },
                        child: ShadowButton(
                            sname: " ",
                            fname: "Meme",
                            width: 160,
                            icon: Icon(
                              Icons.monetization_on,
                              color: Theme.of(context).primaryColor,
                            ),
                            fsize: 11),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      // showDialog(
                      //     context: context,
                      //     builder: (_) => Dialog(
                      //           backgroundColor: Colors.transparent,
                      //           child: BackdropFilter(
                      //             filter: ImageFilter.blur(
                      //                 sigmaX: 5.0, sigmaY: 5.0),
                      //             child: Container(
                      //                 decoration: BoxDecoration(
                      //                   color:
                      //                       Colors.white.withOpacity(0.6),
                      //                   borderRadius: BorderRadius.all(
                      //                     Radius.circular(17),
                      //                   ),
                      //                 ),
                      //                 width: 180,
                      //                 alignment: FractionalOffset.center,
                      //                 height: 180,
                      //                 padding: const EdgeInsets.all(20.0),
                      //                 child: Column(
                      //                   children: [
                      //                     Icon(
                      //                       Icons.qr_code_scanner_rounded,
                      //                       size: 40,
                      //                       color: Colors.white,
                      //                     ),
                      //                     RichText(
                      //                         text: TextSpan(
                      //                             style:
                      //                                 GoogleFonts.poppins(
                      //                                     fontSize: 23,
                      //                                     fontWeight:
                      //                                         FontWeight
                      //                                             .bold),
                      //                             children: [
                      //                           TextSpan(
                      //                               text: "Scan",
                      //                               style: GoogleFonts.poppins(
                      //                                   color: Theme.of(
                      //                                           context)
                      //                                       .primaryColorLight)),
                      //                           TextSpan(
                      //                               text: "Monument",
                      //                               style: GoogleFonts.poppins(
                      //                                   color: Theme.of(
                      //                                           context)
                      //                                       .primaryColor)),
                      //                         ])),
                      //                     SizedBox(
                      //                       height: 25,
                      //                     ),
                      //                     Row(
                      //                       mainAxisAlignment:
                      //                           MainAxisAlignment
                      //                               .spaceAround,
                      //                       children: [
                      //                         GestureDetector(
                      //                           onTap: () {
                      //                             Navigator.push(
                      //                                 context,
                      //                                 MaterialPageRoute(
                      //                                     builder:
                      //                                         (context) =>
                      //                                             ScanScreen(
                      //                                               flag: 0,
                      //                                             )));
                      //                           },
                      //                           child: Row(
                      //                             children: [
                      //                               Icon(Icons
                      //                                   .camera_alt_outlined),
                      //                               Text(" Camera")
                      //                             ],
                      //                           ),
                      //                         ),
                      //                         GestureDetector(
                      //                           onTap: () {
                      //                             Navigator.push(
                      //                                 context,
                      //                                 MaterialPageRoute(
                      //                                     builder:
                      //                                         (context) =>
                      //                                             ScanScreen(
                      //                                               flag: 1,
                      //                                             )));
                      //                           },
                      //                           child: Row(
                      //                             children: [
                      //                               Icon(Icons
                      //                                   .photo_library),
                      //                               Text(" Gallery")
                      //                             ],
                      //                           ),
                      //                         )
                      //                       ],
                      //                     )
                      //                   ],
                      //                 )),
                      //           ),
                      //         ));
                    },
                    child: ShadowButton(
                        sname: "Image",
                        width: 335,
                        fname: " ",
                        icon: Icon(
                          Icons.image,
                          color: Theme.of(context).primaryColor,
                        ),
                        fsize: 11),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SuggestPlan(),
                              ));
                        },
                        child: ShadowButton(
                            fname: "Deep Fake\n",
                            sname: "Video",
                            width: 160,
                            icon: Icon(
                              Icons.video_call_rounded,
                              color: Theme.of(context).primaryColor,
                            ),
                            fsize: 11),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TravelCard()));
                        },
                        child: ShadowButton(
                            fname: 'Deep Fake\n',
                            sname: "Voice",
                            width: 160,
                            icon: Icon(
                              Icons.audiotrack_outlined,
                              color: Theme.of(context).primaryColor,
                            ),
                            fsize: 11),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TravelCard()));
                    },
                    child: ShadowButton(
                        width: 335,
                        fname: 'Dream',
                        sname: " ",
                        icon: Icon(
                          Icons.spatial_tracking,
                          color: Theme.of(context).primaryColor,
                        ),
                        fsize: 11),
                  ),
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: DesName(
                  //         fname: "Native",
                  //         sname: "Market",
                  //         size: 30,
                  //       )),
                  // ),

                  SizedBox(height: 00),

                  //

                  //

                  //
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: GestureDetector(
                  //     onTap: () async {
                  //       Position pos = await _getGeoLocationPosition();
                  //       await GetAddressFromLatLong(pos);
                  //     },
                  //     child: Row(
                  //       children: [
                  //         CircleAvatar(
                  //           radius: 15,
                  //           backgroundColor: Theme.of(context).primaryColorLight,
                  //           child: Icon(
                  //             Icons.pin_drop_outlined,
                  //             color: Colors.white,
                  //             size: 15,
                  //           ),
                  //         ),
                  //         Text(
                  //           "  Refresh Location?",
                  //           style: GoogleFonts.inconsolata(fontSize: 15),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Text(
                  //   "Welcome to,",
                  //   style: GoogleFonts.inter(
                  //       fontSize: 15, fontWeight: FontWeight.bold),
                  // ),
                  // Text(
                  //   place.subAdministrativeArea.toString(),
                  //   style: GoogleFonts.roboto(fontSize: 35),
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     Text(
                  //       "Locality: ${place.locality}",
                  //       style: GoogleFonts.inter(fontSize: 15),
                  //     ),
                  //     Text(
                  //       "Postal: ${place.postalCode}",
                  //       style: GoogleFonts.inter(
                  //         fontSize: 15,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  //     child: ClipRRect(
                  //       borderRadius: BorderRadius.only(
                  //           topRight: Radius.circular(20),
                  //           bottomRight: Radius.circular(20)),
                  //       child: Container(
                  //         height: 40,
                  //         color: Theme.of(context).primaryColor,
                  //         child: Padding(
                  //           padding: const EdgeInsets.all(8.0),
                  //           child: Text(
                  //             "Things to do in ${place.subAdministrativeArea}          ",
                  //             style: GoogleFonts.roboto(
                  //                 fontSize: 18, color: Colors.white),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  // //SPEAK NATIVE

                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     children: [
                  //       GestureDetector(
                  //         onTap: () {
                  //           Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                 builder: (context) => SpeakNative(),
                  //               ));
                  //         },
                  //         child: Container(
                  //           decoration: BoxDecoration(
                  //               gradient: LinearGradient(
                  //                 begin: Alignment.topRight,
                  //                 end: Alignment.bottomLeft,
                  //                 colors: [
                  //                   Theme.of(context).primaryColor,
                  //                   Theme.of(context).primaryColorLight
                  //                 ],
                  //               ),
                  //               borderRadius: BorderRadius.circular(20),
                  //               color: Theme.of(context).primaryColorLight,
                  //               border: Border.all(
                  //                   color: Theme.of(context).primaryColorLight,
                  //                   width: 3)),
                  //           height: 140,
                  //           width: 165,
                  //           child: Column(
                  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //             children: [
                  //               Icon(
                  //                 Icons.translate,
                  //                 size: 50,
                  //                 color: Colors.white,
                  //               ),
                  //               Text(
                  //                 "Speak Native",
                  //                 style: GoogleFonts.aBeeZee(
                  //                     color: Colors.white,
                  //                     fontWeight: FontWeight.bold),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),

                  //       //NATIVE MARKET

                  //       GestureDetector(
                  //         onTap: () {
                  //           Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                 builder: (context) => MarketPage(),
                  //               ));
                  //         },
                  //         child: Container(
                  //           decoration: BoxDecoration(
                  //               gradient: LinearGradient(
                  //                 begin: Alignment.topRight,
                  //                 end: Alignment.bottomLeft,
                  //                 colors: [
                  //                   Theme.of(context).primaryColorLight,
                  //                   Theme.of(context).primaryColor,
                  //                 ],
                  //               ),
                  //               borderRadius: BorderRadius.circular(20),
                  //               color: Theme.of(context).primaryColor,
                  //               border: Border.all(
                  //                   color: Theme.of(context).primaryColorLight,
                  //                   width: 3)),
                  //           height: 140,
                  //           width: 165,
                  //           child: Column(
                  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //             children: [
                  //               Icon(
                  //                 Icons.shopify_rounded,
                  //                 size: 50,
                  //                 color: Colors.white,
                  //               ),
                  //               Text(
                  //                 "Native market",
                  //                 style: GoogleFonts.aBeeZee(
                  //                     color: Colors.white,
                  //                     fontWeight: FontWeight.bold),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),

                  // //SCAN MONUMENT

                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     children: [
                  //       GestureDetector(
                  //         onTap: () {
                  //           Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                 builder: (context) => ScanScreen(),
                  //               ));
                  //         },
                  //         child: Container(
                  //           decoration: BoxDecoration(
                  //               gradient: LinearGradient(
                  //                 begin: Alignment.topRight,
                  //                 end: Alignment.bottomLeft,
                  //                 colors: [
                  //                   Theme.of(context).primaryColor,
                  //                   Theme.of(context).primaryColorLight,
                  //                 ],
                  //               ),
                  //               borderRadius: BorderRadius.circular(20),
                  //               color: Theme.of(context).primaryColor,
                  //               border: Border.all(
                  //                   color: Theme.of(context).primaryColorLight,
                  //                   width: 3)),
                  //           height: 140,
                  //           width: 165,
                  //           child: Column(
                  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //             children: [
                  //               Icon(
                  //                 Icons.qr_code_scanner_sharp,
                  //                 size: 50,
                  //                 color: Colors.white,
                  //               ),
                  //               Text(
                  //                 "Scan Monument",
                  //                 style: GoogleFonts.aBeeZee(
                  //                     color: Colors.white,
                  //                     fontWeight: FontWeight.bold),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //       GestureDetector(
                  //         onTap: () {
                  //           Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                 builder: (context) => TravelCard(),
                  //               ));
                  //         },
                  //         child: Container(
                  //           decoration: BoxDecoration(
                  //               gradient: LinearGradient(
                  //                 begin: Alignment.topRight,
                  //                 end: Alignment.bottomLeft,
                  //                 colors: [
                  //                   Theme.of(context).primaryColorLight,
                  //                   Theme.of(context).primaryColor,
                  //                 ],
                  //               ),
                  //               borderRadius: BorderRadius.circular(20),
                  //               color: Theme.of(context).primaryColor,
                  //               border: Border.all(
                  //                   color: Theme.of(context).primaryColorLight,
                  //                   width: 3)),
                  //           height: 140,
                  //           width: 165,
                  //           child: Column(
                  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //             children: [
                  //               Icon(
                  //                 Icons.card_membership_sharp,
                  //                 size: 50,
                  //                 color: Colors.white,
                  //               ),
                  //               Text(
                  //                 "Travel Card",
                  //                 style: GoogleFonts.aBeeZee(
                  //                     color: Colors.white,
                  //                     fontWeight: FontWeight.bold),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),

                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     children: [
                  //       GestureDetector(
                  //         onTap: () {
                  //           Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                   builder: (context) => SuggestPlan()));
                  //         },
                  //         child: Container(
                  //           decoration: BoxDecoration(
                  //               gradient: LinearGradient(
                  //                 begin: Alignment.topRight,
                  //                 end: Alignment.bottomLeft,
                  //                 colors: [
                  //                   Theme.of(context).primaryColor,
                  //                   Theme.of(context).primaryColorLight,
                  //                 ],
                  //               ),
                  //               borderRadius: BorderRadius.circular(20),
                  //               color: Theme.of(context).primaryColor,
                  //               border: Border.all(
                  //                   color: Theme.of(context).primaryColorLight,
                  //                   width: 3)),
                  //           height: 140,
                  //           width: 165,
                  //           child: Column(
                  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //             children: [
                  //               Icon(
                  //                 Icons.gamepad_outlined,
                  //                 size: 50,
                  //                 color: Colors.white,
                  //               ),
                  //               Text(
                  //                 "Suggest a Plan",
                  //                 style: GoogleFonts.aBeeZee(
                  //                     color: Colors.white,
                  //                     fontWeight: FontWeight.bold),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //       GestureDetector(
                  //         onDoubleTap: showNotification,
                  //         onTap: () {
                  //           Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                   builder: (context) => LocateNative()));
                  //         },
                  //         child: Container(
                  //           decoration: BoxDecoration(
                  //               gradient: LinearGradient(
                  //                 begin: Alignment.topRight,
                  //                 end: Alignment.bottomLeft,
                  //                 colors: [
                  //                   Theme.of(context).primaryColorLight,
                  //                   Theme.of(context).primaryColor,
                  //                 ],
                  //               ),
                  //               borderRadius: BorderRadius.circular(20),
                  //               color: Theme.of(context).primaryColorLight,
                  //               border: Border.all(
                  //                   color: Theme.of(context).primaryColorLight,
                  //                   width: 3)),
                  //           height: 140,
                  //           width: 165,
                  //           child: Column(
                  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //             children: [
                  //               Icon(
                  //                 Icons.pin_drop,
                  //                 size: 50,
                  //                 color: Colors.white,
                  //               ),
                  //               Text(
                  //                 "Locate Native",
                  //                 style: GoogleFonts.aBeeZee(
                  //                     color: Colors.white,
                  //                     fontWeight: FontWeight.bold),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class marketCard extends StatefulWidget {
  const marketCard(
      {Key? key, required this.url, required this.name, required this.sub})
      : super(key: key);

  final String url;
  final String name;
  final String sub;
  @override
  State<marketCard> createState() => _marketCardState();
}

class _marketCardState extends State<marketCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.black,
      ),
      width: 150,
      height: 230,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.blue,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(widget.url),
                )),
            width: 135,
            height: 160,
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: TextStyle(color: Colors.white),
              ),
              Text(
                widget.sub,
                style: TextStyle(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ShadowButton extends StatefulWidget {
  const ShadowButton(
      {Key? key,
      required this.fname,
      required this.sname,
      required this.icon,
      required this.width,
      required this.fsize})
      : super(key: key);

  final String fname;
  final String sname;
  final Icon icon;
  final double fsize;
  final double width;

  @override
  State<ShadowButton> createState() => _ShadowButtonState();
}

class _ShadowButtonState extends State<ShadowButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: widget.width,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColorLight),
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.10),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.icon,
          SizedBox(
            width: 10,
          ),
          DesName(fname: widget.fname, sname: widget.sname, size: widget.fsize)
        ],
      ),
    );
  }
}

class DesName extends StatefulWidget {
  const DesName({
    Key? key,
    required this.fname,
    required this.sname,
    required this.size,
  }) : super(key: key);

  final String fname;
  final String sname;
  final double size;

  @override
  State<DesName> createState() => _DesNameState();
}

class _DesNameState extends State<DesName> {
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: GoogleFonts.poppins(
                fontSize: widget.size, fontWeight: FontWeight.bold),
            children: [
          TextSpan(
              text: widget.fname,
              style: GoogleFonts.poppins(
                  color: Theme.of(context).primaryColorLight)),
          TextSpan(
              text: widget.sname,
              style:
                  GoogleFonts.poppins(color: Theme.of(context).primaryColor)),
        ]));
  }
}
