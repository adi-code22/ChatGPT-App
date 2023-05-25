import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:chatgpt_app/views/mail.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key, required this.flag}) : super(key: key);
  final int flag;
  @override
  _DiseaseDetectionState createState() => _DiseaseDetectionState();
}

class _DiseaseDetectionState extends State<ScanScreen> {
  List _outputs = [];
  List<String> speach = [
    "Vadakkumnathan Temple is an ancient Hindu temple dedicated to Shiva at city of Thrissur, of Kerala state in India. This temple is a classical example of the architectural style of Kerala and has one monumental tower on each of the four sides in addition to a kuttambalam. Mural paintings depicting various scenes from the Mahabharata can be seen inside the temple. The temple, along with the mural paintings, has been declared as a National Monument by India under the AMASR Act.",
    "Rama Varma IX, popularly known as Sakthan Thampuran (Sakthan meaning powerful), was the ruler of the Kingdom of Cochin. The current southern Indian city of Kochi was part of the erstwhile princely state of Kochi. He resided at Vadakkechira Palace in Thrissur. The city of Thrissur is referred to as the Cultural Capital of Kerala owing to its many traditional festivals and historic temples. Sakthan Thampuran is considered the architect of the city of Thrissur. The festival Thrissur Pooram was started by him."
  ];
  bool _loading = false;
  int _selectedIndex = 1;
  bool isPlaying = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loading = true;
  }

  Widget transitonImage = Container(
      child: FadeInImage(
    image: AssetImage("assets/bot.png"),
    fadeOutDuration: const Duration(milliseconds: 3000),
    fadeOutCurve: Curves.bounceIn,
    placeholder: AssetImage("assets/bot.png"),
  ));

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
    } else if (index == 2) {
    } else if (index == 1) {
      Navigator.pushNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // bottomNavigationBar: BottomNavigationBar(
        //   items: const <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.camera),
        //       label: 'Camera',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.home),
        //       label: 'Home',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.image),
        //       label: 'Gallery',
        //     ),
        //   ],
        //   currentIndex: _selectedIndex,
        //   selectedItemColor: Theme.of(context).primaryColorLight,
        //   onTap: _onItemTapped,
        // ),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 680,
                    width: 400,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          opacity: 0.55,
                          fit: BoxFit.cover,
                          image: AssetImage("assets/bg.png")),
                    ),
                  ),

                  // ColorFiltered(
                  //     colorFilter: ColorFilter.mode(
                  //         Colors.white.withOpacity(0.5), BlendMode.dstATop),
                  //     child: Image.asset("assets/bg.png")),
                ],
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.black,
                            )),
                        //
                        //const DesName(fname: "Scan", sname: "Monument", size: 25),
                        RichText(
                            text: TextSpan(
                                style: GoogleFonts.poppins(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                                children: [
                              TextSpan(
                                  text: "Scan",
                                  style: GoogleFonts.poppins(
                                      color:
                                          Theme.of(context).primaryColorLight)),
                              TextSpan(
                                  text: "Monument",
                                  style: GoogleFonts.poppins(
                                      color: Theme.of(context).primaryColor)),
                            ])),
                        Container(
                          height: 50,
                          width: 50,
                          child: Image.asset("assets/logo.png"),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Stack(
                          children: [
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Container(
                                  width: 320,
                                  color: Colors.grey.withOpacity(0.2),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      _loading
                                          ? Container(
                                              height: 300,
                                              width: 300,
                                            )
                                          : Container(
                                              margin: const EdgeInsets.all(20),
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                      color: Colors.blue,
                                                    ),
                                                    width: 300,
                                                    height: 300,
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  false
                                                      ? Container()
                                                      : _outputs != null
                                                          ? Column(
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child:
                                                                      ElevatedButton(
                                                                    style: ButtonStyle(
                                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                                                            borderRadius: const BorderRadius.only(
                                                                                topLeft: Radius.circular(0),
                                                                                bottomLeft: Radius.circular(0),
                                                                                topRight: Radius.circular(16),
                                                                                bottomRight: Radius.circular(16)),
                                                                            side: BorderSide(color: Theme.of(context).primaryColor)))),
                                                                    onPressed:
                                                                        () {},
                                                                    child: !isPlaying
                                                                        ? const Text(
                                                                            "Read out 🔊")
                                                                        : const Text(
                                                                            "Stop 🛑"),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  _outputs[0][
                                                                          "label"]
                                                                      .toString()
                                                                      .substring(
                                                                        2,
                                                                      )
                                                                      .toUpperCase(),
                                                                  style: TextStyle(
                                                                      color: Theme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      fontSize:
                                                                          20),
                                                                ),
                                                                // Text(_outputs[0]
                                                                //         [
                                                                //         "confidence"]
                                                                //     .toString()),

                                                                //_outputs[0]["label"]=="2 banana_black_sigatoka"Text('Good')?null:
                                                                Text(_outputs[0]
                                                                            [
                                                                            "label"] ==
                                                                        "0 Sri Vadakkunnathan Temple"
                                                                    ? speach[0]
                                                                    : _outputs[0]["label"] ==
                                                                            "1 Sakthan Thampuran"
                                                                        ? speach[
                                                                            1]
                                                                        : ''),
                                                              ],
                                                            )
                                                          : Container(
                                                              child: const Text(
                                                                  "")),
                                                  Column(
                                                    children: [
                                                      Container(
                                                        height: 3,
                                                      ),
                                                      Container(
                                                        height: 3,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                      // SizedBox(
                                      //   height:
                                      //       MediaQuery.of(context).size.height * 0.01,
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            !isPlaying
                                ? Positioned(
                                    top: 140,
                                    left: 100,
                                    child: Container(
                                        height: 300,
                                        width: 300,
                                        child: transitonImage))
                                : SizedBox(),
                          ],
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SentMail()),
                              );
                            },
                            child: const Text("Couldn't find your Answer?")),

                        // FlatButton(
                        //     color: Theme.of(context).primaryColor,
                        //     textColor: Colors.white,
                        //     disabledColor: Colors.grey,
                        //     disabledTextColor: Colors.black,
                        //     padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
                        //     splashColor: Theme.of(context).primaryColorLight,
                        //     onPressed: () {},
                        //     child: const Text('''Couldn't Find Your Answer!''')),
                      ],
                    ),
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

// import 'package:flutter/material.dart';
// import 'package:flutter_tts/flutter_tts.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'package:tflite/tflite.dart';
// import 'package:chatgpt_app/views/mail.dart';

// class ScanScreen extends StatefulWidget {
//   const ScanScreen({Key? key, required this.flag}) : super(key: key);

//   final int flag;
//   @override
//   _DiseaseDetectionState createState() => _DiseaseDetectionState();
// }

// class _DiseaseDetectionState extends State<ScanScreen> {
//   List _outputs = [];
//   List<String> speach = [
//     "Madhur temple was originally ShrimadAnantheswara (Shiva) Temple and as the lore goes, an old woman called Madaru from the local Tulu Moger Community discovered an 'Udbhava Murthy' (a statue that was not made by a human) of shiva linga. Initially, the Ganapathy picture was drawn by a boy, on the southern wall of the Garbhagriha(sanctum sanctorum) while playing.",
//     "It was at this place where Divakara Muni Vilwamangalam, the great Tulu Brahmin sage, did penance and performed poojas. Legend has it that one day Lord Narayana appeared before him as a child. The boy’s face was glowing with radiance and this overwhelmed the sage.",
//     "It was an important military station for Tipu Sultan when he led a military expedition to capture Malabar. The coins and artefacts found in archaeological excavations at Bekal fort indicate the strong presence of Mysore Sultans. Tipu Sultan's death during the Fourth Anglo-Mysore War ended Mysorean control in 1799."
//   ];
//   XFile? _image;
//   bool _loading = false;
//   int _selectedIndex = 1;
//   bool isPlaying = true;

//   FlutterTts flutterTts = FlutterTts();

//   speak(String text) async {
//     await flutterTts.setLanguage("en-US");
//     await flutterTts.setPitch(1);
//     await flutterTts.speak(text);
//   }

//   stop() async {
//     await flutterTts.stop();
//   }

//   loadModel() async {
//     await Tflite.loadModel(
//       model: true ? "assets/unquant2.tflite" : "assets/quantized.tflite",
//       labels: "assets/labels2.txt",
//       numThreads: 1,
//     );
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _loading = true;

//     loadModel().then((value) {
//       setState(() {
//         _loading = false;
//       });
//     });
//   }

//   classifyImage(File image) async {
//     var output = await Tflite.runModelOnImage(
//         path: image.path,
//         imageMean: 0.0,
//         imageStd: 255.0,
//         numResults: 2,
//         threshold: 0.5,
//         asynch: true);
//     setState(() {
//       _loading = false;
//       _outputs = output!;
//     });
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//     if (index == 0) {
//       captureImage();
//     } else if (index == 2) {
//       pickImage();
//     } else if (index == 1) {
//       Navigator.pushNamed(context, '/home');
//     }
//   }

//   @override
//   void dispose() {
//     Tflite.close();
//     super.dispose();
//   }

//   Future pickImage() async {
//     final pick = ImagePicker();
//     var image = await pick.pickImage(source: ImageSource.gallery);
//     if (image == null) return null;
//     setState(() {
//       _loading = true;
//       _image = image;
//     });
//     classifyImage(File(_image!.path));
//   }

//   captureImage() async {
//     ImagePicker pick = ImagePicker();
//     var image = await pick.pickImage(source: ImageSource.camera);
//     if (image == null) return null;
//     setState(() {
//       _loading = true;
//       _image = image;
//     });
//     classifyImage(File(_image!.path));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: RichText(
//               text: TextSpan(
//                   style: GoogleFonts.poppins(
//                       fontSize: 30, fontWeight: FontWeight.bold),
//                   children: [
//                 TextSpan(
//                     text: "Scan",
//                     style: GoogleFonts.poppins(
//                         color: Theme.of(context).primaryColorLight)),
//                 TextSpan(
//                     text: "Monument",
//                     style: GoogleFonts.poppins(
//                         color: Theme.of(context).primaryColor)),
//               ])),
//           backgroundColor: Colors.white,
//           //elevation: 0,
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: Icon(Icons.camera),
//               label: 'Camera',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.image),
//               label: 'Gallery',
//             ),
//           ],
//           currentIndex: _selectedIndex,
//           selectedItemColor: Theme.of(context).primaryColorLight,
//           onTap: _onItemTapped,
//         ),
//         body: SingleChildScrollView(
//           child: Container(
//             color: Colors.white,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 _loading
//                     ? Container(
//                         height: 300,
//                         width: 300,
//                       )
//                     : Container(
//                         margin: const EdgeInsets.all(20),
//                         width: MediaQuery.of(context).size.width,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             _image == null
//                                 ? Container()
//                                 : Image.file(
//                                     File(_image!.path),
//                                     // scale: 3,
//                                   ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             _image == null
//                                 ? Container()
//                                 : _outputs != null
//                                     ? Column(
//                                         children: [
//                                           Text(
//                                             _outputs[0]["label"]
//                                                 .toString()
//                                                 .toUpperCase(),
//                                             style: TextStyle(
//                                                 color: Theme.of(context)
//                                                     .primaryColor,
//                                                 fontSize: 20),
//                                           ),

//                                           //_outputs[0]["label"]=="2 banana_black_sigatoka"Text('Good')?null:
//                                           Text(_outputs[0]["label"] ==
//                                                   "0 Madhur Sri Madanantheshwara Siddhivinaya"
//                                               ? "Madhur temple was originally ShrimadAnantheswara (Shiva) Temple and as the lore goes, an old woman called Madaru from the local Tulu Moger Community discovered an 'Udbhava Murthy' (a statue that was not made by a human) of shiva linga. Initially, the Ganapathy picture was drawn by a boy, on the southern wall of the Garbhagriha(sanctum sanctorum) while playing."
//                                               : _outputs[0]["label"] ==
//                                                       "1 Lake Temple"
//                                                   ? 'It was at this place where Divakara Muni Vilwamangalam, the great Tulu Brahmin sage, did penance and performed poojas. Legend has it that one day Lord Narayana appeared before him as a child. The boy’s face was glowing with radiance and this overwhelmed the sage.'
//                                                   : _outputs[0]["label"] ==
//                                                           "2 Bakel Fort"
//                                                       ? "It was an important military station for Tipu Sultan when he led a military expedition to capture Malabar. The coins and artefacts found in archaeological excavations at Bekal fort indicate the strong presence of Mysore Sultans. Tipu Sultan's death during the Fourth Anglo-Mysore War ended Mysorean control in 1799."
//                                                       : ''),
//                                           ElevatedButton(
//                                             style: ElevatedButton.styleFrom(
//                                                 primary: Theme.of(context)
//                                                     .primaryColor),
//                                             onPressed: () {
//                                               setState(() {
//                                                 isPlaying = !isPlaying;
//                                               });
//                                               isPlaying
//                                                   ? stop()
//                                                   : speak(speach[int.parse(
//                                                       _outputs[0]["label"]
//                                                           .toString()
//                                                           .substring(0, 1))]);
//                                             },
//                                             child: isPlaying
//                                                 ? Text("Read out ▶")
//                                                 : Text("Stop ⏹"),
//                                           ),
//                                         ],
//                                       )
//                                     : Container(child: const Text("")),
//                             Column(
//                               children: [
//                                 Container(
//                                   height: 3,
//                                 ),
//                                 FlatButton(
//                                     color: Theme.of(context).primaryColor,
//                                     textColor: Colors.white,
//                                     disabledColor: Colors.grey,
//                                     disabledTextColor: Colors.black,
//                                     padding: const EdgeInsets.fromLTRB(
//                                         50, 20, 50, 20),
//                                     splashColor:
//                                         Theme.of(context).primaryColorLight,
//                                     onPressed: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) => SentMail()),
//                                       );
//                                     },
//                                     child: const Text(
//                                         '''Couldn't Find Your Answer!''')),
//                                 Container(
//                                   height: 3,
//                                 ),
//                                 // FlatButton(
//                                 //     color: Colors.green[300],
//                                 //     textColor: Colors.white,
//                                 //     disabledColor: Colors.grey,
//                                 //     disabledTextColor: Colors.black,
//                                 //     padding: const EdgeInsets.fromLTRB(
//                                 //         60, 20, 60, 20),
//                                 //     splashColor: Colors.greenAccent,
//                                 //     onPressed: () {
//                                 //       Navigator.pushNamed(context, '/location');
//                                 //     },
//                                 //     child:
//                                 //         const Text('Fertilizer Store Location'))
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.01,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
