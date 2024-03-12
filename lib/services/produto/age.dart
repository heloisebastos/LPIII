// import 'package:flutter/material.dart';

// /// Flutter code sample for [DropdownMenu].

// const List<String> listAge = <String>[
//   'Selecione a idade',
//   '7 meses - bezerro(a)',
//   '12 meses - bezzerosobreano',
//   '24 meses - novilho(a)',
//   'Acima de 36 - boi/touro/matriz'
// ];

// // => runApp(const DropdownMenuApp());

// class DropdownMenuApp extends StatelessWidget {
//   const DropdownMenuApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(useMaterial3: true),
//       home: Scaffold(
//         appBar: AppBar(title: const Text('DropdownMenu Sample')),
//         body: const Center(
//           child: DropdownMenuExample(),
//         ),
//       ),
//     );
//   }
// }

// class DropdownMenuExample extends StatefulWidget {
//   const DropdownMenuExample({super.key});

//   @override
//   State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
// }

// class _DropdownMenuExampleState extends State<DropdownMenuExample> {
//   String dropdownValue = listAge.first;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownMenu<String>(
//       initialSelection: listAge.first,
//       onSelected: (String? value) {
//         // This is called when the user selects an item.
//         setState(() {
//           dropdownValue = value!;
//         });
//       },
//       dropdownMenuEntries:
//           listAge.map<DropdownMenuEntry<String>>((String value) {
//         return DropdownMenuEntry<String>(value: value, label: value);
//       }).toList(),
//     );
//   }
// }
