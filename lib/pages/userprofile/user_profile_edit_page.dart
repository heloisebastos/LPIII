import 'package:flutter/material.dart';
import 'package:heloiselpiii/models/users/users.dart';

class UserProfileEditPage extends StatelessWidget {
  const UserProfileEditPage({this.users, super.key});
  final Users? users;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Editando Perfil de Usuário",
              style: TextStyle(
                color: Color.fromARGB(255, 2, 32, 3),
                fontSize: 28,
                fontFamily: 'Lustria',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ClipOval(
              child: Image.asset(
                'assets/images/aninha-logo.png',
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              decoration: InputDecoration(
                label: Text('Nome do Usuário'),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1.5),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                label: Text('Telefone'),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1.5),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                label: Text('Rede Social'),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1.5),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                label: Text('Data de Nascimento'),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1.5),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
