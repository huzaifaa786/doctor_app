class Order {
  int? id;
  String? hospital;
  String? appointment;
  String? name;
  

  Order(order) {
    id = order['id'];
    hospital = order['hospital'];
    appointment = order['appointment'];
    name = order['name'] ;
   
  }
}
