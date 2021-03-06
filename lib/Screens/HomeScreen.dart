import 'package:discortweb/Module/BottomBar.dart';
import 'package:discortweb/Module/PreferredSize_Appbar.dart';
import 'package:discortweb/Module/ResponsiveWidget.dart';
import 'package:discortweb/Module/WebScrollbar.dart';
import 'package:discortweb/Module/floating_quick_access_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xFF1f1f27),
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor: Colors.blueGrey.shade900.withOpacity(_opacity),
              elevation: 0,
              title: Text(
                'DiscorT',
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              actions: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){},
                      child: Text('Sign Up'),
                    ),
                    SizedBox(
                      width: screenSize.width / 20,
                    ),
                    InkWell(
                      onTap: (){},
                      child: Text('Login'),
                    ),
                    SizedBox(
                      width: screenSize.width / 20,
                    ),
                  ],
                ),
              ],
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: PreferredSizeAppbar(_opacity),
            ),
      drawer: Drawer(
        child: Container(
          color: Colors.blueGrey[900],
          child: Padding(
            padding: EdgeInsets.only(top: screenSize.height * 0.10),
            child: Column(
              children: [
                Container(
                  child: CircleAvatar(
                    maxRadius: screenSize.height * 0.09,
                    backgroundColor: Colors.blue,
                  ),
                ),
                SizedBox(height: screenSize.height / 30,),
                InkWell(
                  onTap: (){},
                  child: Container(
                    height: screenSize.height * 0.085,
                    color: Colors.blueGrey[800],
                    width: screenSize.width,
                    child: Row(
                      children: [
                        SizedBox(width: screenSize.height / 20,),
                        Icon(Icons.dashboard_outlined,color: Colors.white,),
                        SizedBox(width: screenSize.height / 30,),
                        Text('Discover', style: TextStyle(color: Colors.white,fontSize: 16.0),)
                      ],
                    )
                  ),
                ),
                SizedBox(height: screenSize.height / 30,),
                InkWell(
                  onTap: (){},
                  child: Container(
                      height: screenSize.height * 0.085,
                      color: Colors.blueGrey[800],
                      width: screenSize.width,
                      child: Row(
                        children: [
                          SizedBox(width: screenSize.height / 20,),
                          Icon(Icons.contact_support_outlined,color: Colors.white,),
                          SizedBox(width: screenSize.height / 30,),
                          Text('Contact Us', style: TextStyle(color: Colors.white,fontSize: 16.0),)
                        ],
                      )
                  ),
                ),
                SizedBox(height: screenSize.height / 30,),
              ],
            ),
          ),
        ),
      ),
      body: WebScrollbar(
        controller: _scrollController,
        width: 10,
        heightFraction: 0.3,
        backgroundColor: Colors.blueGrey.shade900.withOpacity(0.3),
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                      // image below the top bar
                      child: CarouselSlider(
                    options: CarouselOptions(
                      height: ResponsiveWidget.isSmallScreen(context)
                          ? screenSize.height * 0.50
                          : screenSize.height * 0.70,
                      aspectRatio: 18 / 8,
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
                    items: [
                      'freefire.jpg',
                      'fortnite.jpg',
                      'codm.jpg',
                      'game.jpg',
                      'pubg.jpg'
                    ].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: screenSize.width,
                            // margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(i), fit: BoxFit.fill)),
                          );
                        },
                      );
                    }).toList(),
                  )),
                  Column(
                    children: [
                      FloatingQuickAccessBar(screenSize: screenSize),
                    ],
                  ),
                ],
              ),
              Container(
                height: 1000,
                color: Colors.transparent,
              ),
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}
