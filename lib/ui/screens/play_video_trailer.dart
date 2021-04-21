import 'package:flutter/material.dart';

class PlayvideoTrailer extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<PlayvideoTrailer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(null),
          )
        ],
        backgroundColor: Color(0xFF2d3450),
        title: Center(
          child: Text(
            "Movie Trailer",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
      body: Center(
        child: Text("Comment Page"),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
