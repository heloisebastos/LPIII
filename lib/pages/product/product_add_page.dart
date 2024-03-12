import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:heloiselpiii/commons/custom_textformfield.dart';
import 'package:heloiselpiii/commons/dotted_border.dart';
import 'package:heloiselpiii/commons/mypicked_image.dart';
import 'package:heloiselpiii/models/product/product.dart';
import 'package:heloiselpiii/models/product/product_services.dart';
import 'package:heloiselpiii/services/produto/age.dart';
import 'package:heloiselpiii/services/produto/raca.dart';
import 'package:heloiselpiii/services/produto/sexo.dart';

import 'package:provider/provider.dart';

class ProductAddPage extends StatefulWidget {
  const ProductAddPage({super.key});

  @override
  State<ProductAddPage> createState() => _ProductAddPageState();
}

class _ProductAddPageState extends State<ProductAddPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ProductService productServices = ProductService();
  Product product = Product();
  TextEditingController _name = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _price = TextEditingController();
  List<String> listRaca = <String>[
    'Selecione a raça',
    'Nelore',
    'Brahma',
    'Gir',
    'Mestiço'
  ];
  List<String> listSexo = <String>['Selecione F ou M', 'Femea', 'Macho'];
  List<String> listAge = <String>[
    'Selecione a idade',
    '7 meses - bezerro(a)',
    '12 meses - bezzerosobreano',
    '24 meses - novilho(a)',
    'Acima de 36 - boi/touro/matriz'
  ];

  String? dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = listRaca.first;
    dropdownValue = listAge.first;
    dropdownValue = listSexo.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Produto'),
        centerTitle: true,
      ),
      body: Consumer<MyPickedImage>(
        builder: (context, myPickedImage, child) {
          return Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 20, 40, 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Consumer<MyPickedImage>(
                      builder: (context, myPickedImage, child) {
                        if (myPickedImage.pickImage == null ||
                            myPickedImage.webImage!.isEmpty) {
                          return dottedBorder(
                            color: Colors.red,
                            readImage: () {
                              Provider.of<MyPickedImage>(context, listen: false)
                                  .myPickedImage();
                            },
                          );
                        } else {
                          return GestureDetector(
                            onTap: () {
                              Provider.of<MyPickedImage>(context, listen: false)
                                  .myPickedImage();
                            },
                            child: ClipRRect(
                              child: kIsWeb
                                  ? Image.memory(
                                      myPickedImage.webImage!,
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.fill,
                                    )
                                  : Image.file(
                                      myPickedImage.pickImage!,
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      // controller: _name,
                      borderColor: Colors.black54,
                      enabled: true,
                      labelText: const Text("Nome do produto"),
                      onSaved: (value) {
                        product.name = value;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      //controller: _description,
                      borderColor: Colors.black54,
                      enabled: true,
                      labelText: const Text("Descrição do produto"),
                      onSaved: (value) => product.description = value,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      borderColor: Colors.black54,
                      enabled: true,
                      labelText: const Text("Quantidade"),
                      onSaved: (value) => product.quantity = int.parse(value!),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      controller: _price,
                      borderColor: Colors.black54,
                      enabled: true,
                      labelText: const Text("Preço do produto"),
                      onSaved: (value) => product.price = double.parse(value!),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    DropdownMenu<String>(
                      initialSelection: listAge.first,
                      onSelected: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue = value!;
                          product.age = value;
                        });
                      },
                      dropdownMenuEntries: listAge
                          .map<DropdownMenuEntry<String>>((String value) {
                        return DropdownMenuEntry<String>(
                            value: value, label: value);
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    DropdownMenu<String>(
                      initialSelection: listRaca.first,
                      onSelected: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue = value!;
                          product.raca = value;
                        });
                      },
                      dropdownMenuEntries: listRaca
                          .map<DropdownMenuEntry<String>>((String value) {
                        return DropdownMenuEntry<String>(
                            value: value, label: value);
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    DropdownMenu<String>(
                      initialSelection: listSexo.first,
                      onSelected: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue = value!;
                          product.sexo = value;
                        });
                      },
                      dropdownMenuEntries: listSexo
                          .map<DropdownMenuEntry<String>>((String value) {
                        return DropdownMenuEntry<String>(
                            value: value, label: value);
                      }).toList(),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancelar'),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                bool ok = await productServices.save(
                                    product,
                                    kIsWeb
                                        ? myPickedImage.webImage
                                        : myPickedImage.pickImage,
                                    kIsWeb);
                                if (mounted && ok) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Atenção'),
                                        content: const Text(
                                            'Deseja cadastrar outro produto?'),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {
                                                formKey.currentState?.reset();
                                                myPickedImage.pickImage = null;
                                                myPickedImage.webImage =
                                                    Uint8List(8);
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Sim')),
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Não'))
                                        ],
                                      );
                                    },
                                  );
                                }
                              }
                            },
                            child: const Text('Salvar'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
