import 'dart:convert';

import 'package:http/http.dart' as http;

List<Politic> getPoliticsListFromJson(Map<String, dynamic> json) {
  var politicsJson = json['List'] as List;

  // List<Politic> politicsList =
  //     politicsJson.map((i) => Politic.fromJson(i)).toList();

  // return politicsList;
}

List<Party> getPartiesListFromJson(Map<String, dynamic> json) {
  var partiesJson = json['Party'] as List;

  // List<Party> partiesList = partiesJson.map((i) => Party.fromJson(i)).toList();

  // return partiesList;
}

class Politic {
  final String name;
  final String party;
  final String district;

  Politic({this.name, this.party, this.district});

  factory Politic.fromJson(Map<String, dynamic> json) {
    return Politic(
        name: json['ФИО'] as String,
        party: json['Партия'] as String,
        district: json['Округ'] as String);
  }
}

class Party {
  final String name;

  Party({this.name});

  factory Party.fromJson(Map<String, dynamic> json) {
    return Party(name: json['Название'] as String);
  }
}

Future<List<Politic>> getPoliticsList() async {
  const url = 'https://api.jsonbin.io/b/5f1df568c1edc466175ee18a/3';
  final response = await http.get(url);

  // if (response.statusCode == 200) {
  //   var plist = getPoliticsListFromJson(json.decode(response.body));
  //   return plist;
  // } else {
  //   throw Exception('Error: ${response.reasonPhrase}');
  // }
}

Future<List<Party>> getPartiesList() async {
  const url = 'https://api.jsonbin.io/b/5f1df568c1edc466175ee18a/3';
  final response = await http.get(url);

  // if (response.statusCode == 200) {
  //   var plist = getPartiesListFromJson(json.decode(response.body));
  //   return plist;
  // } else {
  //   throw Exception('Error: ${response.reasonPhrase}');
  // }
}
