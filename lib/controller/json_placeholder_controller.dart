import 'package:apis_fetch/constant/file_apirequest.dart';
import 'package:apis_fetch/model/photos_model.dart';
import 'package:apis_fetch/model/users_model.dart';
import 'package:http/http.dart' as http;

class jsonplaceholderController {
  Future<List<Users>> getUserController() async {
    var url = ConfigUrl().getUers;
    var respon = await http.get(
      Uri.parse(url),
    );
    if (respon.statusCode == 200) {
      return usersFromJson(respon.body);
    } else {
      print('request not found');
    }
    return usersFromJson(respon.body);
  }

  Future<List<Photos>> getPhotosController() async {
    var url = ConfigUrl().getPhotos;
    var respon = await http.get(Uri.parse(url));
    if (respon.statusCode == 200) {
      return photosFromJson(respon.body);
    } else {
      print('respon ${respon.statusCode}');
    }
    return photosFromJson(respon.body);
  }
}
