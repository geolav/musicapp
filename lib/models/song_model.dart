class Song {
  final String title;
  final String description;
  final String url;
  final String coverUrl;

  Song(
      {required this.title,
      required this.description,
      required this.coverUrl,
      required this.url});

  static List<Song> songs = [
    Song(title: "Sunset",
        description: "hamudahamidi",
        coverUrl: 'assets/image/sunset.jpg',
        url: 'assets/music/sunset.mp3'),
    Song(title: 'Chill',
        description: 'чиль',
        coverUrl: 'assets/image/chill.jpg',
        url: 'assets/music/chill.mp3'),
    Song(title: 'Magic',
        description: "hp",
        coverUrl: 'assets/image/magic.jpg',
        url: 'assets/music/magic.mp3'),
  ];
}
