import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'about_app.dart';
import 'colors.dart' as color;

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videoInfo = [];
  bool _playArea = false;
  bool _isPlaying = false;
  bool _disposed = false;
  int _isPlayingIndex = -1;     // -1 just default value
  VideoPlayerController? _controller; // global variable to easy access

  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/videoinfo.json")
        .then((value) {
      // setState(): when have new information, it update the screen.
      setState(() {
        videoInfo = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  void dispose()
  {
    _disposed = true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _playArea == false
            ? BoxDecoration(
                gradient: LinearGradient(
                colors: [
                  color.AppColor.gradientFirst.withOpacity(0.9),
                  color.AppColor.gradientSecond,
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ))
            : BoxDecoration(color: color.AppColor.gradientSecond),
        child: Column(
          children: [
            _playArea == false
                ? Container(
                    padding: EdgeInsets.only(top: 60, left: 30, right: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 280,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color: color.AppColor.secondPageIconColor,
                              ),
                            ),
                            Expanded(child: Container()),
                            InkWell(
                              onTap: () {
                                Get.to(() => AboutApp());
                              },
                              child: Icon(
                                Icons.info_outline,
                                size: 22,
                                color: color.AppColor.secondPageIconColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Legs Toning",
                          style: TextStyle(
                            fontSize: 25,
                            color: color.AppColor.secondPageTitleColor,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "and Glutes Workout",
                          style: TextStyle(
                            fontSize: 25,
                            color: color.AppColor.secondPageTitleColor,
                          ),
                        ),
                        SizedBox(height: 50),
                        Row(
                          children: [
                            Container(
                              width: 82,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    color.AppColor
                                        .secondPageContainerGradient2ndColor,
                                    color.AppColor
                                        .secondPageContainerGradient2ndColor,
                                  ],
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.timer,
                                    size: 20,
                                    color: color.AppColor.secondPageIconColor,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "60 min",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: color.AppColor.secondPageIconColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 230,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    color.AppColor
                                        .secondPageContainerGradient2ndColor,
                                    color.AppColor
                                        .secondPageContainerGradient2ndColor,
                                  ],
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.handyman_outlined,
                                    size: 20,
                                    color: color.AppColor.secondPageIconColor,
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    "Resistance band, kettlebell",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: color.AppColor.secondPageIconColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: Column(
                      children: [
                        Container(
                          height: 95,
                          padding: const EdgeInsets.only(
                              top: 35, left: 30, right: 30),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 20,
                                  color: color.AppColor.secondPageIconColor,
                                ),
                              ),
                              Expanded(child: Container()),
                              InkWell(
                                onTap: () {
                                  Get.to(() => AboutApp());
                                },
                                child: Icon(
                                  Icons.info_outline,
                                  size: 22,
                                  color: color.AppColor.secondPageIconColor,
                                ),
                              )
                            ],
                          ),
                        ),
                        _playView(context),
                        _controlView(context),
                      ],
                    ),
                  ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "Circuit 1: Legs Toning",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: color.AppColor.circuitsColor,
                          ),
                        ),
                        Expanded(child: Container()),
                        Row(
                          children: [
                            Icon(
                              Icons.loop,
                              size: 30,
                              color: color.AppColor.loopColor,
                            ),
                            Text(
                              "3 sets",
                              style: TextStyle(
                                fontSize: 15,
                                color: color.AppColor.setsColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 6),
                        itemCount: videoInfo.length,
                        itemBuilder: (_, int index) {
                          return GestureDetector(
                              // can click
                              onTap: () {
                                _initializeVideo(index);
                                debugPrint(index.toString());
                                setState(() {
                                  if (_playArea == false) _playArea = true;
                                });
                              },
                              child: _buildCard(index));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// Tach phan Card ra thanh 1 ham rieng => de nhin

  _buildCard(int index) {
    return Container(
      height: 135,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(
                      videoInfo[index]["thumbnail"],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoInfo[index]["title"],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Text(
                    videoInfo[index]["time"],
                    style: TextStyle(
                      color: Colors.grey[500], // text size default is 14
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Container(
                width: 80,
                height: 18,
                decoration: BoxDecoration(
                  color: Color(0xFFeaeefc),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "15s rest",
                    style: TextStyle(
                      color: Color(0xFF839fed),
                    ),
                  ),
                ),
              ),
              Row(
                /*
                  Tao ra cac Container bieu thi cho dau gach ngang, 
                  Co 2 loai Container voi 2 mau khac nhau.
                  Sau do chay vong For de lap xen ke cac Container nay => Tao ra duong net dut
                */
                children: [
                  for (int i = 0; i < 63; i++)
                    i.isEven
                        ? Container(
                            height: 1,
                            width: 3,
                            decoration: BoxDecoration(
                              color: Color(0xFF839fed),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          )
                        : Container(
                            height: 1,
                            width: 4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _playView(BuildContext context) {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayer(controller),
      );
    } else {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: Center(
          child: Text(
            "Preparing... ",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white60,
            ),
          ),
        ),
      );
    }
  }


  Duration? _duration;
  Duration? _position;
  var _progress = 0.0;
  var _onUpdateControllerTime;      // So lan update controller
  Future<void> _onControllerUpdate()
  async {
    if(_disposed){      // if controller was dispose -> not run _onControllerUpdate()
      return;
    }
    _onUpdateControllerTime = 0;
    final now = DateTime.now().microsecondsSinceEpoch;
    if (_onUpdateControllerTime > now)
    {
      return;
    }
  /*
    it used to avoid user to click quickly, 
    if 2 click < 0.5s then not handle, 
    but if 2 click > 0.5s then handle.
  */
    _onUpdateControllerTime = now + 500;     // it use to 

    final controller = _controller;
    if (controller == null )
    {
      debugPrint("controller is null");
      return;
    }
    if (!controller.value.isInitialized)
    {
      debugPrint("controller can not be initialized");
      return;
    }

    _duration = _controller?.value.duration;

    var duration = _duration;
    if(duration == null) return;

    var position = await controller.position;
    _position = position;

    final playing = controller.value.isPlaying;
    if(playing)
    {
      if(_disposed) return;
      setState(() {
      _progress = position!.inMilliseconds.ceilToDouble() / duration.inMilliseconds.ceilToDouble();
      });
    }
    _isPlaying = playing;
  }

  _initializeVideo(int index) {
    final controller = VideoPlayerController.network(videoInfo[index]["videoUrl"]);
    final old = _controller;  // save the previous old controller
    _controller = controller;
    if(old != null)
    {
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    setState(() {});
    controller
      ..initialize().then((_) {
        old?.dispose();
        _isPlayingIndex = index;
        controller.addListener(_onControllerUpdate);
        controller.play();
        setState(() {});
      });
  }

  String convertTwo(int value)
  {
    return value < 10 ? "0$value" : "$value";
  }

  Widget _controlView(BuildContext context) {
    final noMute = (_controller?.value.volume??0) > 0;    // ??: if null
    final duration = _duration?.inSeconds??0;
    final head = _position?.inSeconds??0;
    final remained = max(0, duration - head);
    final mins = convertTwo(remained ~/ 60);
    final secs = convertTwo(remained % 60);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.red[700],
            inactiveTrackColor: Colors.red[100],
            trackShape: RoundedRectSliderTrackShape(),
            trackHeight: 2.0,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
            thumbColor: Colors.redAccent,
            overlayColor: Colors.red.withAlpha(32), 
            overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
            tickMarkShape: RoundSliderTickMarkShape(),
            activeTickMarkColor: Colors.red[700],
            inactiveTickMarkColor: Colors.red[700],
            valueIndicatorShape: PaddleSliderValueIndicatorShape(),
            valueIndicatorColor: Colors.redAccent,
            valueIndicatorTextStyle: TextStyle(
              color: Colors.white,
            ),
          ),
          child: Slider(
            value: max(0, min(_progress * 100, 100)),
            min: 0,
            max: 100,
            divisions: 100,
            label: _position?.toString().split(".")[0],
            onChanged: (value){
              setState(() {
                _progress= value * 0.01;
              });
            },
            onChangeStart: (value){
              _controller?.pause();
            },
            onChangeEnd: (value){
              final duration = _controller?.value.duration;
              if (duration != null)
              {
                var newValue = max(0, min(value,99)) * 0.01;
                var millis = (duration.inMilliseconds * newValue).toInt();
                _controller?.seekTo(Duration(milliseconds: millis));
                _controller?.play();
              }
            },
          ),
        ),
        Container(
          height: 40,
          width: MediaQuery.of(context).size.width,
          color: color.AppColor.gradientSecond,
          padding: EdgeInsets.only(bottom: 4),
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  if(noMute)
                    _controller?.setVolume(0);
                  else
                    _controller?.setVolume(1);

                  setState(() {
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0.0,0.0),
                          blurRadius: 4,
                          color: Color.fromARGB(50, 0, 0, 0),
                        )
                      ]
                    ),
                    child: Icon(
                      noMute ? Icons.volume_up : Icons.volume_off,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              FlatButton(
                onPressed: () async {
                  final index = _isPlayingIndex - 1;
                  if (index >= 0 && videoInfo.length >= 0)
                  {
                    _initializeVideo(index);
                  } else 
                  {
                    Get.snackbar("Video List", "",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: color.AppColor.gradientSecond,
                    colorText: Colors.white,
                    icon: Icon(
                      Icons.face,
                      size: 30,
                      color: Colors.white,
                    ),
                    messageText: Text(
                      "No videos ahead !",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    );
                  }
                },
                child: Icon(
                  Icons.fast_rewind,
                  size: 36,
                  color: Colors.white,
                ),
              ),
              FlatButton(
                onPressed: () async {
                  if(_isPlaying){
                    setState(() {
                      _isPlaying = false;
                    });
                    _controller?.pause();
                  }
                  else{
                    setState(() {
                      _isPlaying = true;
                    });
                    _controller?.play();
                  }
                },
                child: Icon( _isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 36,
                  color: Colors.white,
                ),
              ),
              FlatButton(
                onPressed: () async {
                  final index = _isPlayingIndex + 1;
                  if (index <= (videoInfo.length-1))
                  {
                    _initializeVideo(index);
                  } else
                  {
                    Get.snackbar("Video List", "",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: color.AppColor.gradientSecond,
                    colorText: Colors.white,
                    icon: Icon(
                      Icons.face,
                      size: 30,
                      color: Colors.white,
                    ),
                    messageText: Text(
                      "You have finished watching all the videos. Congrats !",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    );
                  }
                },
                child: Icon(
                  Icons.fast_forward,
                  size: 36,
                  color: Colors.white,
                ),
              ),
              Text(
                "$mins:$secs",
                style: TextStyle(
                  color: Colors.white,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(0,1),
                      blurRadius: 4,
                      color: Color.fromARGB(150, 0, 0, 0),
                    )
                  ]
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
