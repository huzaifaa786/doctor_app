import 'package:doctor_app/api/api.dart';
import 'package:doctor_app/helpers/loading.dart';
import 'package:doctor_app/models/appointment.dart';
import 'package:doctor_app/values/url.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderApi {
  static orderget() async { 
    LoadingHelper.show();
    var url = BASE_URL + 'order/get';
    var data;
    final prefs = await SharedPreferences.getInstance();
    print(prefs.getString('api_token'));
    data = {'api_token': prefs.getString('api_token')!};

    var response = await Api.execute(url: url, data: data);
    LoadingHelper.dismiss();
    if (!response['error']) {
      Order? user = Order(response['user']);
      print(user);
      return user;
    } else {
      Fluttertoast.showToast(msg: response['error_data']);
      return false;
    }
  } 
}
