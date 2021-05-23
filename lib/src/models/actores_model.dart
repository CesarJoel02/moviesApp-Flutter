class Cast{
  List<Actor> actores = [];
  Cast.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null) return;

    jsonList.forEach((item) {
      final actor = Actor.fromJson(item);
      actores.add(actor);
    });
  }
}


class Actor {
  bool adult;
  int gender;
  int id;
  String knownForDepartment;
  String name;
  String originalName;
  double popularity;
  String profilePath;
  int castId;
  String character;
  String creditId;
  int order;

  Actor(
      {this.adult,
        this.gender,
        this.id,
        this.knownForDepartment,
        this.name,
        this.originalName,
        this.popularity,
        this.profilePath,
        this.castId,
        this.character,
        this.creditId,
        this.order});

  Actor.fromJson(Map<String, dynamic> json) {
    adult               = json['adult'];
    gender              = json['gender'];
    id                  = json['id'];
    knownForDepartment  = json['known_for_department'];
    name                = json['name'];
    originalName        = json['original_name'];
    popularity          = json['popularity'];
    profilePath          = json['profile_path'];
    castId              = json['cast_id'];
    character           = json['character'];
    creditId            = json['credit_id'];
    order               = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult']                 = this.adult;
    data['gender']                = this.gender;
    data['id']                    = this.id;
    data['known_for_department']  = this.knownForDepartment;
    data['name']                  = this.name;
    data['original_name']         = this.originalName;
    data['popularity']            = this.popularity;
    data['profile_path']           = this.profilePath;
    data['cast_id']               = this.castId;
    data['character']             = this.character;
    data['credit_id']             = this.creditId;
    data['order']                 = this.order;
    return data;
  }

  getFoto(){

    if(profilePath == null){
      return "https://lippianfamilydentistry.net/wp-content/uploads/2015/11/user-default.png";
    }else{
      return 'https://image.tmdb.org/t/p/w500/$profilePath';
    }

  }

}

