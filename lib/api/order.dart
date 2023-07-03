import 'package:doctor_app/api/api.dart';
import 'package:doctor_app/helpers/loading.dart';
import 'package:doctor_app/models/appointments.dart';
import 'package:doctor_app/values/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderApi {
      static getAppointments() async {
    LoadingHelper.show();
    var url = BASE_URL + 'order/doctor';
    final prefs = await SharedPreferences.getInstance();
    var data = {
      'api_token': prefs.getString('api_token'),
    };
    var response = await Api.execute(url: url, data: data);
    print(response['order']);
    List<Appointments> appointment = <Appointments>[];
    for (var doctor in response['order']) {
      appointment.add(Appointments(doctor));
    }
    LoadingHelper.dismiss();
    return appointment;
  }
}
