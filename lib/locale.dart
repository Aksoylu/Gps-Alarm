import 'languages/en.dart';
import 'languages/tr.dart';

class AppLocale{
  static String activeLanguage = "en";

  static String translate(String scope, String key){
    String? response = "<empty>";
    switch(AppLocale.activeLanguage)
    {
      case "en" :
        response = EN[scope]?[key];
        break;
      case "tr" :
        response = TR[scope]?[key];
        break;
    }

    if (response != null)
      return response;
    else
      return "<empty>";
  }
}

