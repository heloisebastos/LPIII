import 'package:flutter/material.dart';
import 'package:heloiselpiii/pages/cart/cart_page.dart';
import 'package:heloiselpiii/pages/home/home_page_stream.dart';
import 'package:heloiselpiii/pages/order/order_page.dart';
import 'package:heloiselpiii/pages/product/product_add_page.dart';
import 'package:heloiselpiii/pages/product/product_list_page.dart';
import 'package:heloiselpiii/pages/userprofile/user_profile_list.dart';
import 'package:heloiselpiii/pages/userprofile/user_profile_page.dart';
import 'package:heloiselpiii/services/users/users_services.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: ,
        elevation: 2.0,
        title: const Text("BRAGRO"),
      ),
      body: [
        const HomePageStream(),
        const CartPage(),
        const OrderPage(),
        // Center(
        //   child: Container(
        //     //color: Colors.orange,
        //     child: const Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Text('Galeria de Produtos'),
        //       ],
        //     ),
        //   ),
        // ),
        const UserProfilePage(),
      ][_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (int position) {
          setState(() {
            _index = position;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Carrinho',
          ),
          NavigationDestination(
            icon: Icon(Icons.line_style_outlined),
            label: 'Pedidos',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_box_outlined),
            label: 'Perfil de Usuário',
          )
        ],
      ),
      drawer: Consumer<UsersServices>(
        builder: (context, usersServices, child) {
          return Drawer(
            child: Column(
              children: [
                DrawerHeader(
                  child: Column(
                    children: [
                      Flexible(
                        flex: 1,
                        child: ClipOval(
                          child: Image.network(
                            usersServices.users!.image!,
                            height: 70,
                            width: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(usersServices.users!.userName!.toUpperCase()),
                      Text(usersServices.users!.email!.toLowerCase()),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const Divider(
                      height: 2,
                    ),
                    if (usersServices.users!.profile!)
                      ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OrderPage(),
                            ),
                          );
                        },
                        title: Text('Pedidos'),
                      ),
                    const Divider(
                      height: 2,
                    ),
                    if (usersServices.users!.profile!)
                      ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CartPage(),
                            ),
                          );
                        },
                        title: Text('Carrinho de Compras'),
                      ),
                    const Divider(
                      height: 2,
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UserProfileList(),
                          ),
                        );
                      },
                      title: const Text('Relatório de usuários'),
                    ),
                    const Divider(
                      height: 2,
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const UserProfilePage(),
                          ),
                        );
                      },
                      title: const Text('Perfil de usuário'),
                    ),
                    if (!usersServices.users!.profile!)
                      ExpansionTile(
                          title: const Text("Gerenciamento de Produtos"),
                          leading: const Icon(Icons.person), //add icon
                          childrenPadding: const EdgeInsets.only(
                              left: 60), //children padding
                          children: [
                            ListTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ProductAddPage(),
                                  ),
                                );
                              },
                              title: const Text('Cadastro de Produtos'),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ProductListPage(),
                                  ),
                                );
                              },
                              title: const Text('Listagem de Produtos'),
                            ),
                          ]),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

/*
class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: ,
        elevation: 2.0,
        title: const Text("Flutter Ecom"),
      ),
      body: [
        const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Página inicial")],
          ),
        ),
        const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Carrinho de Compras'),
            ],
          ),
        ),
        Center(
          child: Container(
            color: Colors.orange,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Galeria de Produtos'),
              ],
            ),
          ),
        ),
        const UserProfilePage(),
      ][_index],
      bottomNavigationBar: NavigationBar(
          selectedIndex: _index,
          onDestinationSelected: (int position) {
            setState(() {
              _index = position;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Carrinho',
            ),
            NavigationDestination(
              icon: Icon(Icons.line_style_outlined),
              label: 'Pedidos',
            ),
            NavigationDestination(
              icon: Icon(Icons.account_box_outlined),
              label: 'Perfil de Usuário',
            )
          ]),
    );
  }
}*/
