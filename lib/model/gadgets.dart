/// _id : "6039ea3e6b464524c6c7b692"
/// brand : "samsung"
/// mobilename : "samsung galaxy"
/// sellingprice : "69999"
/// mrp : "69999"

class Gadgets {
 // String _id;
  String brand;
  String mobilename;
  String sellingprice;
  String mrp;

  Gadgets({this.brand, this.mobilename, this.sellingprice,
      this.mrp}); //String get id => _id;




  Gadgets.fromJson(dynamic json) {
    //_id = json["_id"];
    brand = json["brand"];
    mobilename = json["mobilename"];
    sellingprice = json["sellingprice"];
    mrp = json["mrp"];
  }

  Map<String, String> toJson() {
    var map = <String, String>{};
 //   map["_id"] = _id;
    map["brand"] = brand;
    map["mobilename"] = mobilename;
    map["sellingprice"] = sellingprice;
    map["mrp"] = mrp;
    return map;
  }

}