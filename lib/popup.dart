import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';
import 'package:url_launcher/url_launcher.dart';

class popup extends StatefulWidget {
  const popup({Key? key}) : super(key: key);

  @override
  State<popup> createState() => _popupState();
}

class _popupState extends State<popup> {
  var isChanged = false;
  final Uri linkandroid = Uri.parse("https://play.google.com/store/apps/details?id=com.timun.timun_app");
  final Uri linkios = Uri.parse("https://play.google.com/store/apps/details?id=com.timun.timun_app");

  Future<void> show(BuildContext context) {
    return showDialog(
        context: context,
        useSafeArea: false,
        builder: (context) {
          return AnimatedContainer(
            duration: Duration(seconds: 1),
            width: isChanged ? 275 : 0,
            height: isChanged ? 350 : 0,
            child: Container(
              height: 350,
              width: 275,
              alignment: Alignment.center,
              child: Container(
                height: 375,
                width: 275,
                child: Stack(
                  fit: StackFit.loose,
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        height: 300,
                        width: 275,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Update Aplikasi Kamu!",
                                style: GoogleFonts.poppins().copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            SizedBox(height: 10),
                            Container(
                              child: Text(
                                  "Perbarui aplikasi kamu dan dapatkan promo terbaru serta kenyamanan belanja",
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins().copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      color: "989797".toColor())),
                            ),
                            SizedBox(height: 20),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 35,
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                                color: "F47A7E".toColor(),
                                onPressed: () async {
                                  if (Platform.isAndroid) {
                                    if (!await launchUrl(linkandroid)) throw 'Could not launch $linkandroid';
                                  } else if (Platform.isIOS) {
                                    if (!await launchUrl(linkios)) throw 'Could not launch $linkios';
                                  }
                                },
                                child: Text("Update Sekarang",
                                    style: GoogleFonts.poppins().copyWith(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 35,
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  side: BorderSide(color: "F47A7E".toColor(), width: 2),
                                ),
                                color: Colors.white,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Nanti Dulu Aja!",
                                    style: GoogleFonts.poppins().copyWith(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: "F47A7E".toColor())),
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      child: Container(
                          width: 190,
                          height: 190,
                          padding: EdgeInsets.all(3),
                          child: Image(
                            image: AssetImage("assets/penguin.png"),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    setState(() => isChanged = !isChanged);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      show(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
