import 'package:flutter/material.dart';

class BottomBarColumn extends StatefulWidget {
  final String heading;
  final String s1;
  final String s2;
  final String s3;

  BottomBarColumn({
    required this.heading,
    required this.s1,
    required this.s2,
    required this.s3,
  });

  @override
  _BottomBarColumnState createState() => _BottomBarColumnState();
}

class _BottomBarColumnState extends State<BottomBarColumn> {
  List _isHovering = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.heading,
            style: TextStyle(
              color: Colors.blueGrey[300],
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                _isHovering[0] = value;
              });
            },
            child: Text(
              widget.s1,
              style: TextStyle(
                fontSize: 14.0,
                color: _isHovering[0]
                    ? Colors.deepOrange
                    : Colors.white,
              ),
            ),
          ),
          SizedBox(height: 5),
          InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                _isHovering[1] = value;
              });
            },
            child: Text(
              widget.s2,
              style: TextStyle(
                fontSize: 14.0,
                color: _isHovering[1]
                    ? Colors.deepOrange
                    : Colors.white,
              ),
            ),
          ),
          SizedBox(height: 5),
          InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                _isHovering[2] = value;
              });
            },
            child: Text(
              widget.s3,
              style: TextStyle(
                fontSize: 14.0,
                color: _isHovering[2]
                    ? Colors.deepOrange
                    : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}