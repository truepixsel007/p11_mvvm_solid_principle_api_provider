
class MoiveListModel {
  List<Movies>? movies;

  MoiveListModel({this.movies});

  MoiveListModel.fromJson(Map<String, dynamic> json) {
    if (json['movies'] != null) {
      movies = <Movies>[];
      json['movies'].forEach((v) {
        movies!.add(new Movies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.movies != null) {
      data['movies'] = this.movies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Movies {
  String? id;
  String? title;
  String? year;
  List<String>? genres;
  List<int>? ratings;
  String? poster;
  String? contentRating;
  String? duration;
  String? releaseDate;
  double? averageRating;
  String? originalTitle;
  String? storyLine;
  List<String>? actors;
  double? imdbRating;
  String? posterUrl;

  Movies(
      {this.id,
        this.title,
        this.year,
        this.genres,
        this.ratings,
        this.poster,
        this.contentRating,
        this.duration,
        this.releaseDate,
        this.averageRating,
        this.originalTitle,
        this.storyLine,
        this.actors,
        this.imdbRating,
        this.posterUrl});

  Movies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    year = json['year'];
    genres = json['genres'].cast<String>();
    ratings = json['ratings'].cast<int>();
    poster = json['poster'];
    contentRating = json['contentRating'];
    duration = json['duration'];
    releaseDate = json['releaseDate'];
    averageRating = json['averageRating'];
    originalTitle = json['originalTitle'];
    storyLine = json['storyLine'];
    actors = json['actors'].cast<String>();
    imdbRating = json['imdbRating'];
    posterUrl = json['posterUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['year'] = this.year;
    data['genres'] = this.genres;
    data['ratings'] = this.ratings;
    data['poster'] = this.poster;
    data['contentRating'] = this.contentRating;
    data['duration'] = this.duration;
    data['releaseDate'] = this.releaseDate;
    data['averageRating'] = this.averageRating;
    data['originalTitle'] = this.originalTitle;
    data['storyLine'] = this.storyLine;
    data['actors'] = this.actors;
    data['imdbRating'] = this.imdbRating;
    data['posterUrl'] = this.posterUrl;
    return data;
  }
}
