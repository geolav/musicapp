import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:music_app/models/playlist_model.dart';

import 'package:music_app/widgets/widget.dart';

import '../models/song_model.dart';

///
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Song> songs = Song.songs;
    List<PlayList> playlist = PlayList.playList;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blueGrey.withOpacity(0.6),
              Colors.black87.withOpacity(0.2),
            ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const PreferredSize(preferredSize: Size.fromHeight(70.0),
          child: _CustomAppBar()), ///**
        bottomNavigationBar: const _CustomNavBar(),
        body: SingleChildScrollView(
            child: Column(
          children: [
             const _DiscoverMusic(),
              _TrendingMusic(songs: songs),
              Padding(
              padding: const EdgeInsets.all(20.0),
                child: Column(
                children: [
                  const SectionHeader(title: "Плейлист"),
                  ListView.builder(
                    padding: const EdgeInsets.only(top:17),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: playlist.length,
                      itemBuilder: ((context, index) {
                        return PlaylistCard(playlist: playlist[index]);
                  })),
                ],
              ),
            )

          ],
        )),
      ),
    );
  }
}




class _TrendingMusic extends StatelessWidget {
  const _TrendingMusic({Key? key, required this.songs}) : super(key: key);

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        top: 20,
        bottom: 20,
        right: 20,
      ),
      child: Column(
        children: [SectionHeader(title: 'Популярная музыка'),
          const SizedBox(height: 20,),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  return SongCard(song: songs[index]);
                }),
          )],
      ),
    );
  }
}




class _DiscoverMusic extends StatelessWidget {
  const _DiscoverMusic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Привет', style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 21,fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 3,
          ),
          Text(
            'Наслаждайтесь вашей любимой музыкой!',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 30,
          ),
          TextFormField(
            decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Colors.white,
                hintText: 'Поиск...',
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.grey.shade400),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none)),
          ),
        ],
      ),
    );
  }
}

class _CustomNavBar extends StatelessWidget {
  const _CustomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black12,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline), label: 'Favorites'),
        BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_fill_outlined), label: 'Play'),
        BottomNavigationBarItem(
            icon: Icon(Icons.people_outlined), label: 'Profile'),
      ],
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Icon(Icons.grid_view_rounded),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://cs10.pikabu.ru/post_img/2019/10/24/6/1571904638146986026.webp'),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(6.0);
}
