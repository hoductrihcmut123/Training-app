import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'colors.dart' as color;

class AboutApp extends StatelessWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 105,
              padding: EdgeInsets.only(top: 40, left: 30, right: 30),
              margin: EdgeInsets.only(bottom: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 10,
                    color: color.AppColor.secondPageContainerGradient2ndColor
                        .withOpacity(0.2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 22,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    "About this App",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: (Column(
                children: [
                  Text(
                    "Important components used in this application:",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(
                      text: '- Container widget',
                      style: TextStyle(color: Colors.black, fontSize: 19.0),
                      children: <TextSpan>[
                        TextSpan(
                          text: '- Stack widget\n',
                        ),
                        TextSpan(
                          text: '- Scaffold widget\n',
                        ),
                        TextSpan(
                          text: '- Boxdecoration\n',
                        ),
                        TextSpan(
                          text: '- Row and Column widget\n',
                        ),
                        TextSpan(
                          text: '- DecorationImage\n',
                        ),
                        TextSpan(
                          text: '- Listview builder\n',
                        ),
                        TextSpan(
                          text: '- Getx navigation\n',
                        ),
                        TextSpan(
                          text: '- Loading Videos From JSON File\n',
                        ),
                        TextSpan(
                          text: '- Desgin Video Player List UI\n',
                        ),
                        TextSpan(
                          text: '- Play and Pause Video\n',
                        ),
                        TextSpan(
                          text: '- Mute and Unmute Audio\n',
                        ),
                        TextSpan(
                          text: '- Play Next and Previous Videos\n',
                        ),
                        TextSpan(
                          text: '- Customized Slider\n',
                        ),
                        TextSpan(
                          text: '- Show Video Time on Sider\n',
                        ),
                        TextSpan(
                          text: '- GetX Snackbar for Message to Users\n',
                        ),
                        TextSpan(
                          text: '- TableCalendar widget\n',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 30,
                      ),
                      SizedBox(width: 10,),
                      Text(
                        "20/03/2022",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: Colors.lightBlue),
                      ),
                      SizedBox(width: 10,),
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 30,
                      ),
                    ],
                  ),
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
