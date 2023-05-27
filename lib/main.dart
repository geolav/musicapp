import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/screen/home_screen.dart';
import 'package:music_app/screen/playlist_screen.dart';
import 'package:music_app/screen/song_screen.dart';
///
void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(textTheme: Theme.of(context).textTheme.apply(
        bodyColor: Colors.white,
        displayColor: Colors.white
      )),
      home: const HomeScreen(),
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/song', page: () => SongScreen()),
        GetPage(name: '/playlist', page: () => PlaylistScreen()),
      ],
    );
  }
}
