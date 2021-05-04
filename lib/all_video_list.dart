import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/single_play.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// Creates list of video players
class AllVideoList extends StatefulWidget {
  final List<YoutubePlayerController> controllers;
  AllVideoList({this.controllers});
  @override
  _AllVideoListState createState() => _AllVideoListState();
}

class _AllVideoListState extends State<AllVideoList> {
  final List<YoutubePlayerController> _controllers = [
    'diPgqQeLJLI',
    'zy31gezn86w',
    'ix4BnZScnf4',
    'O3FY4VKwlg4',
  ].map<YoutubePlayerController>(
        (videoId) => YoutubePlayerController(
          initialVideoId: videoId,
          flags: const YoutubePlayerFlags(
              hideThumbnail: false,
              autoPlay: false,
              mute: true,
              controlsVisibleAtStart: false,

              enableCaption: true,
              captionLanguage: "English"),
        ),
      )
      .toList();
  TextEditingController _idController;
  TextEditingController _seekToController;

  PlayerState _playerState;
  YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Stack(children:[YoutubePlayer(
                key: ObjectKey(_controllers[index]),
                controller: _controllers[index],
                actionsPadding: const EdgeInsets.only(left: 16.0),
                bottomActions: [
                  CurrentPosition(),
                  const SizedBox(width: 10.0),
                  ProgressBar(isExpanded: true),
                  const SizedBox(width: 10.0),
                  RemainingDuration(),
                  FullScreenButton(),
                ],
              ),
            InkWell(
              child: Container(
                height: 200,
                color: Colors.transparent,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return PlayVideo(
                      ids: _controllers[index],
                    );
                  },
                ));
              },
            )
          ],
        );
      },
      itemCount: _controllers.length,
      separatorBuilder: (context, _) => const SizedBox(height: 10.0),
    );
  }
}
