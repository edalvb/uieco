import 'package:flutter/material.dart';
import 'package:uieco/ui/pages/payment_method.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw MaterialApp(
      title: "Flujo de Pago",
      initialRoute: '/',
      routes: {
        '/': (context) => PaymentMethodPage(),
      },
    );
  }
}
