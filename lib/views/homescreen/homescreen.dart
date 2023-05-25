import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:chatgpt_app/views/locatenative.dart';
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
  String subAdminArea = "";
  String postal = "";
  bool selected = false;
  int itemNumber = 0;
  List<String> buyList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    //height: 375,
                    width: 400,
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).primaryColorLight.withOpacity(0.2),
                      image: const DecorationImage(
                          opacity: 0.15,
                          fit: BoxFit.cover,
                          image: AssetImage("assets/bg.png")),
                      borderRadius: const BorderRadius.only(
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
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  //Our Services

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: EdgeInsets.all(15.0),
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
                                  builder: (context) => const SpeakNative()));
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LocateNative()));
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
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LocateNative()));
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
                                builder: (context) => const SuggestPlan(),
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
                      const SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TravelCard()));
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
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TravelCard()));
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
                  const SizedBox(height: 00),
                ],
              ),
            ),
          ],
        ),
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
          const SizedBox(
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
