import 'package:breaking_bad/consts/breakingBadConsts.dart';

class BreakingBadCharacterModels {
  late String name, img, status, nickname;
  String? id;

  BreakingBadCharacterModels(
      {required this.img,
      required this.name,
      required this.nickname,
      required this.status,
      this.id});
  Map<String, dynamic> toJson() {
    return {
      NAME: name,
      IMG: img,
      NICKNAME: nickname,
      STATUS: status,
    };
  }

  BreakingBadCharacterModels.fromJson(Map<String, dynamic> map) {
    id = map[ID].toString();
    name = map[NAME];
    nickname = map[NICKNAME];
    status = map[STATUS];
    img = map[IMG];
  }
}
