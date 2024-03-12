// import 'package:flutter/material.dart';

// /// Flutter code sample for [DropdownMenu].

// const List<String> listRaca = <String>['Selecione a raça','Nelore', 'Brahma', 'Gir', 'Mestiço'];

// // => runApp(const DropdownMenuApp());

// class DropdownMenuApp extends StatelessWidget {
//   const DropdownMenuApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(useMaterial3: true),
//       home: Scaffold(
//         appBar: AppBar(title: const Text('DropdownMenu Sample')),
//         body: Align(
//           alignment: Alignment.centerLeft,
//           child: DropdownMenuExample(),
//         ),
//         //body: Center(
//         //  child: DropdownMenuExample(),
//         //),
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
//   String dropdownValue = listRaca.first;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownMenu<String>(
//       initialSelection: listRaca.first,
//       onSelected: (String? value) {
//         // This is called when the user selects an item.
//         setState(() {
//           dropdownValue = value!;
//         });
//       },
//       dropdownMenuEntries:
//           listRaca.map<DropdownMenuEntry<String>>((String value) {
//         return DropdownMenuEntry<String>(value: value, label: value);
//       }).toList(),
//     );
//   }
// }
