import 'package:flutter/material.dart';

class PreferredSizeAppbar extends StatefulWidget {
  final double opacity;

  PreferredSizeAppbar(this.opacity);
  @override
  _PreferredSizeAppbarState createState() => _PreferredSizeAppbarState();
}

class _PreferredSizeAppbarState extends State<PreferredSizeAppbar> {
  List _isHovering = [false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        color: Colors.blueGrey.shade900.withOpacity(widget.opacity),
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
                    fontSize: 16.0,
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
