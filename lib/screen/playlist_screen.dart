import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/playlist_model.dart';

///
class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PlayList playlist = Get.arguments ?? PlayList.playList[0];
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.blueGrey.withOpacity(0.5),
            Colors.black38.withOpacity(0.1),
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Playlist'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(17.0),
              child: Column(
                children: [
                  _PlaylistInfo(playlist: playlist),
                  const SizedBox(height: 30,),
                  _PlayOrShuffleSwitch(),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: playlist.songs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text(
                          '${index + 1}',
                          style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold, color: Colors.lightGreen.shade100,fontSize: 16 ),
                        ),
                        title: Text(
                          playlist.songs[index].title,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold,fontSize: 16),
                        ),
                        subtitle: Text (
                          "${playlist.songs[index].description} 02:45"
                        ),
                        trailing: const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        ),
                      );
                    }
                  )
                ],
              ) 
          ),
        ),
      ),
    );
  }
}

class _PlayOrShuffleSwitch extends StatefulWidget {
  const _PlayOrShuffleSwitch({
    super.key,
  });

  @override
  State<_PlayOrShuffleSwitch> createState() => _PlayOrShuffleSwitchState();
}

class _PlayOrShuffleSwitchState extends State<_PlayOrShuffleSwitch> {
  bool isPlay = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        setState(() {
          isPlay = !isPlay;
        });
      },
      child: Container(
        height: 40,
        width: width,
        decoration: BoxDecoration(
          color: Colors.blueGrey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(13),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 175),
              left: isPlay ? 0 : width * 0.45,
              child: Container(
                height:40,
                width: width * 0.45,
                decoration: BoxDecoration(
                  color: Colors.lightGreen.shade500.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
            ),
            Row(
            children: [
              Expanded(
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text('Play',
                      style: TextStyle(
                        color: isPlay ? Colors.white : Colors.lightGreen,
                        fontSize: 22
                      ).copyWith(fontWeight: FontWeight.w800),),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.play_circle,
                      color: isPlay ? Colors.white : Colors.lightGreen,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text('Shuffle',
                        style: TextStyle(
                            color: isPlay ? Colors.lightGreen : Colors.white,
                            fontSize: 22
                        ).copyWith(fontWeight: FontWeight.w800),),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.shuffle_outlined,
                      color: isPlay ? Colors.lightGreen : Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),],
        ),
      ),
    );
  }
}

class _PlaylistInfo extends StatelessWidget {
  const _PlaylistInfo({
    super.key,
    required this.playlist,
  });

  final PlayList playlist;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image.network(
            playlist.imageUrl,
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.4,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          playlist.title,
          style: Theme.of(context)
          .textTheme
          .headlineSmall!
          .copyWith(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
