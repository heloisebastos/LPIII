import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String? id;
  String? name;
  String? description;
  //String? brand;
  bool? deleted; //marca se o produto pode ou não aparecer na busca no app
  String? categoryId;
  String? offerId;
  String? image;
  String? url;
  double? price;
  //String? unity;
  int? quantity;
  String? raca;
  String? sexo;
  String? age;
  //final List<String> updateImages =[];
  bool _loading = false; //verifica se os dados foram ou não lidos

  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
  }

  Product(
      {this.id,
      this.name,
      this.description,
      //this.brand,
      this.image,
      this.categoryId,
      this.offerId,
      //this.unity,
      this.raca,
      this.sexo,
      this.age,
      this.quantity = 0,
      this.deleted = false}) {
    name = name ?? '';
    image = image;
  }

//metodo construtor para salvar os dados do documento firebase
//converte os dados que vem no formato xml e
  Product.fromDocument(DocumentSnapshot doc) {
    id = doc.id;
    name = doc.get('name');
    description = doc.get('descripion');
    //brand = doc.get('brand');
    quantity = doc.get('quantity') as int;
    //unity = doc.get('unity') as String;
    price = doc.get('price') as double;
    offerId = doc.get('offerId');
    categoryId = doc.get('categoryId') as String;
    deleted = (doc.get('deleted') ?? false) as bool;
    image = doc.get('image');
    age = doc.get('age');
    raca = doc.get('raca');
    sexo = doc.get('sexo');
  }
//metodo2
  Product.fromSnapshot(DocumentSnapshot doc)
      : id = doc.id,
        name = doc.get('name'),
        description = doc.get('descripion'),
        // brand = doc.get('brand'),
        quantity = doc.get('quantity') as int,
        //unity = doc.get('unity') as String,
        price = doc.get('price') as double,
        offerId = doc.get('offerId'),
        categoryId = doc.get('categoryId') as String,
        deleted = (doc.get('deleted') ?? false) as bool,
        age = doc.get('age'),
        raca = doc.get('raca'),
        sexo = doc.get('sexo'),
        image = doc.get('image');

//convert to map (Json) -> preparacao do formato compativel com o JSON (FIREBASE)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      //'brand': brand,
      'quantity': quantity,
      //'unity': unity,
      'price': price,
      'image': image,
      'age': age,
      'raca': raca,
      'sexo': sexo,
      //'categoryId':categoryId,
      // 'offerId':offerId,
      'deleted': deleted,
    };
  }

  @override
  String toString() {
    return 'Product(id : $id,name:$name,description: $description,quantity: $quantity,price: $price,image: $image,age:$age,raca:$raca,sexo:$sexo)';
  }
}
