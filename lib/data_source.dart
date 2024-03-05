import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jokester/joke_dto.dart';
import 'package:jokester/settings.dart';

class DataSource {
  Future<JokeDto> getJokes() async{
    var blackListStr = Settings().getBlackList();
    var url = "https://v2.jokeapi.dev/joke/Programming?blacklistFlags=$blackListStr";
    final response = await http.get(Uri.parse(url));
    return JokeDto.fromJson(jsonDecode(response.body));
  }
}
