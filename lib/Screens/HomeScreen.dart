import 'package:discortweb/Module/BottomBar.dart';
import 'package:discortweb/Screens/SignupScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List _isHovering = [false, false, false, false, false];
  List _isSelect = [false, false, false];
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xFF1f1f27),
      appBar: buildPreferredSize(screenSize),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container( // image below the top bar
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: screenSize.height * 0.70,
                      aspectRatio: 18/8,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: ['freefire.jpg','fortnite.jpg','codm.jpg','game.jpg','pubg.jpg'].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: screenSize.width,
                              // margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(i),
                                  fit: BoxFit.fill
                                )
                              ),
                          );
                        },
                      );
                    }).toList(),
                  )
                ),
                Center(
                  heightFactor: 1,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: screenSize.height * 0.64,
                      left: screenSize.width / 5,
                      right: screenSize.width / 5,
                    ),
                    child: Container(
                      decoration: new BoxDecoration(
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.black87,
                            blurRadius: 20.0,
                            spreadRadius: 5.0,
                          ),
                        ],
                      ),
                      child: Card( // floating quick access bar
                        elevation: 1,
                        child: Container(
                          height: screenSize.height * 0.095,
                          // color: Colors.purpleAccent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(),
                              InkWell(
                                onTap: () {},
                                onHover: (value) {
                                  setState(() {
                                    _isSelect[0] = value;
                                  });
                                },
                                child: Text(
                                  'Game',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: _isSelect[0]
                                        ? Colors.deepOrange
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Container(color: Colors.grey[400], height: 30, width: 1,),
                              InkWell(
                                onTap: () {},
                                onHover: (value) {
                                  setState(() {
                                    _isSelect[1] = value;
                                  });
                                },
                                child: Text(
                                  'Tournament',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: _isSelect[1]
                                        ? Colors.deepOrange
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              Container(color: Colors.grey[400], height: 30, width: 1,),
                              InkWell(
                                onTap: () {},
                                onHover: (value) {
                                  setState(() {
                                    _isSelect[2] = value;
                                  });
                                },
                                child: Text(
                                  'Dashboard',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: _isSelect[2]
                                        ? Colors.deepOrange
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(height: 1000, color: Colors.transparent,),
            BottomBar(),
          ],
        ),
      ),
    );
  }

  PreferredSize buildPreferredSize(Size screenSize) {
    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Text(
                  'DiscorT',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.deepOrange
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 5.0,left: screenSize.width * 0.15),
                  // color: Colors.deepPurpleAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {},
                        onHover: (value) {
                          setState(() {
                            _isHovering[0] = value;
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Discover',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: _isHovering[0]
                                    ? Colors.deepOrange
                                    : Colors.white,
                              ),
                            ),
                            SizedBox(height: 5),
                            // For showing an underline on hover
                            Visibility(
                              maintainAnimation: true,
                              maintainState: true,
                              maintainSize: true,
                              visible: _isHovering[0],
                              child: Container(
                                height: 2,
                                width: 60,
                                color: Colors.deepOrangeAccent,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: screenSize.width / 20),
                      InkWell(
                        onTap: () {},
                        onHover: (value) {
                          setState(() {
                            _isHovering[2] = value;
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Contact Us',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: _isHovering[2]
                                    ? Colors.deepOrange
                                    : Colors.white,
                              ),
                            ),
                            SizedBox(height: 5),
                            // For showing an underline on hover
                            Visibility(
                              maintainAnimation: true,
                              maintainState: true,
                              maintainSize: true,
                              visible: _isHovering[2],
                              child: Container(
                                height: 2,
                                width: 75,
                                color: Colors.deepOrangeAccent,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    _isHovering[3] = value;
                  });
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 16,
                    color: _isHovering[3]
                        ? Colors.deepOrange
                        : Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: screenSize.width / 50,
              ),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    _isHovering[4] = value;
                  });
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: _isHovering[4]
                        ? Colors.deepOrange
                        : Colors.white,
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
