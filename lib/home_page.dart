import 'package:flutter/material.dart';
import 'package:test_app/all_video_list.dart';

import 'content_bar.dart';
import 'content_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          ContentBar(height: 210.0),
          Positioned.fill(
            child: Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 40.0),
              child: new Column(
                children: <Widget>[
                  _buildButtonsRow(), //tabs
                  ContentCard(id: selectedIndex,), //content
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  var selectedIndex = 1;

  Widget _buildButtonsRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          new RoundedButton(
              text: "Latest",
              onTap: () {
                print("latest");
                selectedIndex = 1;
                setState(() {});
              },selected: selectedIndex==1?true:false),
          new RoundedButton(
              text: "Video",
              onTap: () {
                print("video");
                selectedIndex = 2;
                setState(() {});
              },selected: selectedIndex==2?true:false),
          new RoundedButton(
              text: "Updates",
              onTap: () {
                print("updates");
                selectedIndex = 3;
                setState(() {});
              },selected: selectedIndex==3?true:false),
        ],
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String text;
  final bool selected;
  final GestureTapCallback onTap;

  const RoundedButton({Key key, this.text, this.selected = false, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = selected ? Colors.white : Colors.transparent;
    Color textColor = selected ? Colors.red : Colors.white;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: new InkWell(
          onTap: onTap,
          child: new Container(
            height: 36.0,
            decoration: new BoxDecoration(
              color: backgroundColor,
              border: new Border.all(color: Colors.white, width: 1.0),
              borderRadius: new BorderRadius.circular(30.0),
            ),
            child: new Center(
              child: new Text(
                text,
                style: new TextStyle(color: textColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
