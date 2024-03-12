import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heloiselpiii/models/cart/cart_services.dart';
import 'package:heloiselpiii/models/users/users_services.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedidos"),
      ),
      body: Consumer<CartService>(builder: (context, cart, child) {
        return Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: cart.items.length,
                itemBuilder: (context, int index) {
                  if (cart.items.isEmpty) {
                    return const Text("Não há pedidos");
                  }
                  final item = cart.items[index];
                  return Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(30.0, 8, 30, 8),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.network(
                                width: 80,
                                height: 80,
                                item.image!,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${item.name}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    Text(
                                      'R\$ ${item.price}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    Text(
                                      'Quantidade: ${item.quantity}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Theme.of(context).primaryColorDark,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                           /* IconButton(
                                onPressed: () {
                                  cart.removeFromCart(item);
                                },
                                icon: const Icon(
                                  Icons.delete_outline_rounded,
                                  color: Color.fromARGB(255, 109, 25, 25),
                                  size: 30,
                                )
                                )*/
                          ],
                        ),
                      ),
                    ),
                  );
                }),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(30.0, 8, 30, 8),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(30.0, 8, 30, 8),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Total: ${context.select((CartService c) => c.total)}',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
