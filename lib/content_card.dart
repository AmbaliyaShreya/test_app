// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//
// class ContentCard extends StatefulWidget {
//   @override
//   _ContentCardState createState() => _ContentCardState();
// }
//
// class _ContentCardState extends State<ContentCard> {
//   YoutubePlayerController _controller;
//   TextEditingController _idController;
//   TextEditingController _seekToController;
//
//   PlayerState _playerState;
//   YoutubeMetaData _videoMetaData;
//   double _volume = 100;
//   bool _muted = false;
//   bool _isPlayerReady = false;
//
//   void listener() {
//     if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
//       setState(() {
//         _playerState = _controller.value.playerState;
//         _videoMetaData = _controller.metadata;
//       });
//     }
//   }
//
//   final List<String> _ids = [
//     'zy31gezn86w',
//     'gQDByCdjUXw',
//     'iLnmTe5Q2Qw',
//     '_WoCV4c6XOE',
//     'KmzdUe0RSJo',
//     '6jZDSSZZxjQ',
//     'p2lYr3vM_1w',
//     '7QUtEmBT_-w',
//     '34_PXCzGw1M',
//   ];
//
//   @override
//   void initState() {
//     _controller = YoutubePlayerController(
//       initialVideoId: _ids.first,
//       flags: const YoutubePlayerFlags(
//         mute: false,
//         autoPlay: false,
//         disableDragSeek: false,
//         loop: false,
//         isLive: false,
//         forceHD: false,
//         enableCaption: true,
//       ),
//     )
//       ..addListener(listener);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new Container(
//       height: MediaQuery
//           .of(context)
//           .size
//           .height - 200,
//       child: Card(
//         elevation: 4.0,
//         margin: const EdgeInsets.all(8.0),
//         child: DefaultTabController(
//           child: new LayoutBuilder(
//             builder:
//                 (BuildContext context, BoxConstraints viewportConstraints) {
//               return Column(
//                 children: <Widget>[
//                   // _buildTabBar(),
//                   _buildContentContainer(viewportConstraints),
//                 ],
//               );
//             },
//           ),
//           length: 3,
//         ),
//       ),
//     );
//   }
//
//   Widget _buildContentContainer(BoxConstraints viewportConstraints) {
//     return Expanded(
//       child: SingleChildScrollView(
//         child: new ConstrainedBox(
//           constraints: new BoxConstraints(
//             // minHeight: MediaQuery.of(context).size.height,
//             // viewportConstraints.maxHeight - 48.0,
//           ),
//           // child: new IntrinsicHeight(
//           child: Container(
//             width: double.infinity,
//             padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//             child: Card(child:
//             YoutubePlayer(
//               controller: _controller,
//               showVideoProgressIndicator: true,
//               onReady: () {
//                 _controller.addListener(listener);
//               },
//             ),),
//           ),
//           // ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:test_app/all_video_list.dart';
import 'package:test_app/latest_video_list.dart';
import 'package:test_app/load_updates.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ContentCard extends StatefulWidget {
  final dynamic id;
  ContentCard({this.id});
  @override
  _ContentCardState createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
  YoutubePlayerController _controller;
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    print('==========${widget.id}');
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: MediaQuery.of(context).size.height - 140,
      child: Card(
        // shape: RoundedRectangleBorder(side: BorderSide(width: 5,color: Colors.black12)),
        // color: Colors.white,
        elevation: 10.0,
        // shadowColor: Colors.redAccent,
        margin: const EdgeInsets.all(8.0),
        child: DefaultTabController(
          child: new LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  // padding:EdgeInsets.symmetric(horizontal: 0,vertical: 0),
                child: widget.id==2?AllVideoList():widget.id==1?LatestVideoList():Container(width:double.infinity,child:LoadUpdates()),
              );
            },
          ),
          length: 3,
        ),
      ),
    );
  }
}
