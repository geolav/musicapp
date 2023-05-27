import 'package:music_app/models/song_model.dart';
class PlayList {
  final String title;
  final List<Song> songs;
  final String imageUrl;

  PlayList({required this.title, required this.songs, required this.imageUrl});

  static List<PlayList> playList = [
    PlayList(title: "Hip-hop R&B Mix", songs: Song.songs, imageUrl: 'https://www.shutterstock.com/image-vector/handwritten-text-hiphop-musical-print-260nw-2029581530.jpg'),
    PlayList(title: "Rock & Roll", songs: Song.songs, imageUrl: 'https://cdn.shopify.com/s/files/1/0130/8714/6043/articles/image1_1_580x.jpg?v=1621417630'),
    PlayList(title: "Techno", songs: Song.songs, imageUrl: 'https://i.scdn.co/image/ab67616d0000b2739d32da0a840ac2c9e107e9ec')

  ];
}