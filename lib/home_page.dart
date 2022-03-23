import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_app/video_info.dart';
import 'calendar.dart';
import 'colors.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List info = [];

  _initData() async  
  {
    await DefaultAssetBundle.of(context).loadString("json/info.json").then((value)
    {
      setState(() {
        info = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
        padding: EdgeInsets.only(top: 55, left: 30, right: 30),
        child: Column(
          children: [
            Row(children: [
              Text(
                "Training",
                style: TextStyle(
                  fontSize: 30,
                  color: color.AppColor.homePageTitle,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Expanded(child: Container()),
              Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: color.AppColor.homePageIcons,
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => CalendarPage());
                },
                child: Icon(
                  Icons.calendar_today_rounded,
                  size: 22,
                  color: color.AppColor.homePageIcons,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: color.AppColor.homePageIcons,
              )
            ]),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Training health",
                  style: TextStyle(
                    fontSize: 20,
                    color: color.AppColor.homePageSubtitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Expanded(child: Container()),
                Text(
                  "Details",
                  style: TextStyle(
                    fontSize: 20,
                    color: color.AppColor.homePageDetail,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => VideoInfo());
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    size: 22,
                    color: color.AppColor.homePageIcons,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: 215,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      color.AppColor.gradientFirst.withOpacity(0.8),
                      color.AppColor.gradientSecond.withOpacity(0.9),
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(80),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(5, 10),
                      blurRadius: 10,
                      color: color.AppColor.gradientSecond.withOpacity(0.2),
                    ),
                  ],
                ),
                child: Container(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 25,
                      right: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Next workout",
                          style: TextStyle(
                            fontSize: 16,
                            color: color.AppColor.homePageContainerTextSmall,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Legs Toning",
                          style: TextStyle(
                            fontSize: 25,
                            color: color.AppColor.homePageContainerTextBig,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "and Glutes Workout",
                          style: TextStyle(
                            fontSize: 25,
                            color: color.AppColor.homePageContainerTextBig,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.timer,
                                  size: 20,
                                  color:
                                      color.AppColor.homePageContainerTextSmall,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "60 min",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: color
                                        .AppColor.homePageContainerTextSmall,
                                  ),
                                )
                              ],
                            ),
                            Expanded(child: Container()),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(5, 10),
                                      blurRadius: 15,
                                      color: color.AppColor.gradientFirst,
                                    )
                                  ]),
                              child: InkWell(
                                onTap: () {
                                  Get.to(() => VideoInfo());
                                },
                                child: Icon(
                                  Icons.play_circle_fill,
                                  size: 60,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ))),
            SizedBox(
              height: 0,
            ),
            InkWell(
              onTap: () {
                Get.snackbar("Fighting", "",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: color.AppColor.gradientSecond,
                    colorText: Colors.white,
                    icon: Icon(
                      Icons.face_retouching_natural,
                      size: 30,
                      color: Colors.white,
                    ),
                    messageText: Text(
                      "Keep practicing and you will get the results you deserve!",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 170,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 120,
                      margin: EdgeInsets.only(top: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage("assets/card.jpg"),
                            fit: BoxFit.fill,
                          ),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(8, 10),
                              blurRadius: 40,
                              color:
                                  color.AppColor.gradientSecond.withOpacity(0.3),
                            ),
                            BoxShadow(
                              offset: Offset(-1, -5),
                              blurRadius: 10,
                              color:
                                  color.AppColor.gradientSecond.withOpacity(0.3),
                            ),
                          ]),
                    ),
                    Container(
                      height: 170,
                      width: MediaQuery.of(context).size.width,
                      margin:
                          const EdgeInsets.only(right: 195, bottom: 30, left: 25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage("assets/figure.png"),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 100,
                      margin: const EdgeInsets.only(top: 50, left: 150),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "You are doing great",
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: color.AppColor.homePageDetail,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                              text: TextSpan(
                                  text: "Keep it up\n",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: color.AppColor.homePagePlanColor,
                                  ),
                                  children: [
                                TextSpan(text: "stick to your plan")
                              ])),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  "Area of focus",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: color.AppColor.homePageTitle,
                  ),
                )
              ],
            ),
            Expanded(
              child: OverflowBox(
                maxWidth: MediaQuery.of(context).size.width,
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView.builder(
                    itemCount: info.length~/2,
                    itemBuilder: (_, i) {
                      return Row(
                        children: [
                          Container(
                            width: (MediaQuery.of(context).size.width-90)/2,
                            height: 140,
                            margin: EdgeInsets.only(left: 30, bottom: 5, top: 10),
                            padding: EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(
                                  info[2*i]["img"],
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(5,5),
                                  blurRadius: 3,
                                  color: color.AppColor.gradientSecond.withOpacity(0.1)
                                ),
                                BoxShadow(
                                  offset: Offset(-5,-5),
                                  blurRadius: 3,
                                  color: color.AppColor.gradientSecond.withOpacity(0.1)
                                )
                              ]
                            ),
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  info[2*i]["title"],
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: color.AppColor.homePageDetail,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: (MediaQuery.of(context).size.width-90)/2,
                            height: 140,
                            margin: EdgeInsets.only(left: 30, bottom: 5, top: 10),
                            padding: EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(
                                  info[2*i +1]["img"],
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(5,5),
                                  blurRadius: 3,
                                  color: color.AppColor.gradientSecond.withOpacity(0.1)
                                ),
                                BoxShadow(
                                  offset: Offset(-5,-5),
                                  blurRadius: 3,
                                  color: color.AppColor.gradientSecond.withOpacity(0.1)
                                )
                              ]
                            ),
                            child: Center(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  info[2*i +1]["title"],
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: color.AppColor.homePageDetail,
                                  ),
                                ),
                              ),
                            ),
                          ),                 
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
