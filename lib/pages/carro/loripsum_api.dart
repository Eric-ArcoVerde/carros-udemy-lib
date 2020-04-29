import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

part 'loripsum_api.g.dart';

class LoripsumModel = LoripsumModelBase with _$LoripsumModel;

abstract class LoripsumModelBase with Store {
  static String lorim;

  @observable
  String s;

  @observable
  Exception error;

  @action
  fetch() async {
    try {
      error = null;
      this.s = lorim ?? await LoripsumApi.getLoripsum();
      lorim = s;
    } catch (e) {
      error = e;
    }
  }
}

class LoripsumApi {
  static Future<String> getLoripsum() async {
    var url = 'https://loripsum.net/api';

    print("GET >> $url");

    var response = await http.get(url);

    String text = response.body;

    text = text.replaceAll("<p>", "");
    text = text.replaceAll("</p>", "");

    return text;
  }
}
