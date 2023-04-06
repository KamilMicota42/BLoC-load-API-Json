
class ContinentModel {
  String? name;
  String? slug;
  List? countries;

  ContinentModel({this.name, this.slug, this.countries});

  ContinentModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    if (json['countries'] != null) {
      countries = <CountryModel>[];
      
      json['countries'].forEach((v) {
        
        countries?.add(CountryModel.fromJson(v));
      });
    }
  }
}


class CountryModel {
  String? name;
  String? slug;
  String? number;
  String? alpha3;

  CountryModel({this.name, this.slug, this.number, this.alpha3});

  CountryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    number = json['number'];
    alpha3 = json['alpha3'];
  }
}