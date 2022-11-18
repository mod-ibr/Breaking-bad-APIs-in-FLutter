import 'dart:convert';

import 'package:breaking_bad/models/braekingbadCharaterModels.dart';
import 'package:http/http.dart' as http;

class BreakingBadAPIsHandler {
// get All Characters
  Future<List<BreakingBadCharacterModels>> getAllCharacters() async {
    String url = 'https://www.breakingbadapi.com/api/characters';
    http.Response response = await http.get(Uri.parse(url));
    try {
      print('ST_Code :${response.statusCode}');
      print('Body :${response.body}');
      List<dynamic> alldata = jsonDecode(response.body);
      List<BreakingBadCharacterModels> finalData = alldata
          .map((character) => BreakingBadCharacterModels.fromJson(character))
          .toList();

      return finalData;
    } catch (e) {
      print('ERROR:$e');
    }
    return [];
  }
}
