import 'dart:io';

class Peliculas {



  List<Pelicula> items = new List();
  Peliculas();
  Peliculas.fromJsonList( List<dynamic> jsonList ){
    if (jsonList == null) return;
    
    for (var item in jsonList){
      final pelicula = new Pelicula.fromJson(item);
      items.add(pelicula);
    }
  }
}

class Pelicula {
  String uniqueID;
  bool        adult;
  String      backdropPath;
  List<int>   genreIds;
  int         id;
  String      originalLanguage;
  String      originalTitle;
  String      overview;
  double      popularity;
  String      posterPath;
  String      releaseDate;
  String      title;
  bool        video;
  double      voteAverage;
  int         voteCount;

  Pelicula(
      {this.adult,
        this.backdropPath,
        this.genreIds,
        this.id,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.releaseDate,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount});

  Pelicula.fromJson(Map<String, dynamic> json) {
    adult             = json['adult'];
    backdropPath      = json['backdrop_path'];
    genreIds          = json['genre_ids'].cast<int>();
    id                = json['id'];
    originalLanguage  = json['original_language'];
    originalTitle     = json['original_title'];
    overview          = json['overview'];
    popularity        = json['popularity'] / 1;
    posterPath        = json['poster_path'];
    releaseDate       = json['release_date'];
    title             = json['title'];
    video             = json['video'];
    voteAverage       = json['vote_average'] / 1;
    voteCount         = json['vote_count'] ;
  }

  getPosterImg(){

    if(posterPath == null){
      return "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fcohenwoodworking.com%2Fwp-content%2Fuploads%2F2016%2F09%2Fimage-placeholder-500x500.jpg&f=1&nofb=1";
    }else{
      return 'https://image.tmdb.org/t/p/w500$posterPath';
    }

  }

  getBackGroundImg(){

    if(posterPath == null){
      return "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fcohenwoodworking.com%2Fwp-content%2Fuploads%2F2016%2F09%2Fimage-placeholder-500x500.jpg&f=1&nofb=1";
    }else{
      return 'https://image.tmdb.org/t/p/w500$backdropPath';
    }

  }
/*



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['genre_ids'] = this.genreIds;
    data['id'] = this.id;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity;
    data['poster_path'] = this.posterPath;
    data['release_date'] = this.releaseDate;
    data['title'] = this.title;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    return data;
  }
*/
}
