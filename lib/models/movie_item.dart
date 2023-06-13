class MovieItem {
  final String movieImage;
  final String movieName;
  final String releaseYear;
  final String watchLink;
  final String downloadLink;
  final List<String> tags;

  MovieItem({
    required this.movieImage,
    required this.movieName,
    required this.releaseYear,
    required this.watchLink,
    required this.downloadLink,
    required this.tags,
  });
}
