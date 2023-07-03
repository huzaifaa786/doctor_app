// ignore_for_file: file_names

class Appointments {
  int? id;
  String? drName;
  String? time;
  String? date;
  String? fee;
  String? hospital;
  String? image;

  Appointments(appointments) {
    id = appointments['id'];
    drName = appointments['patientname'];
    image = appointments['doctor']['image'];
    time = appointments['time'];
    date = appointments['date'];
    hospital = appointments['hospital']['name'];
  }
}
