import 'package:flutter/material.dart';
import 'package:uieco/ui/pages/payment_details.dart';
import 'package:uieco/ui/pages/payment_method.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Montserrat",
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Color(0xff050060),
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xFF34495E),
          textTheme: ButtonTextTheme.primary
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      title: "Flujo de Pago",
      initialRoute: '/',
      routes: {
        '/': (context) => PaymentMethodPage(),
        '/details': (context) => PaymentDetails(),
        '/sucessful': (context) => PaymentDetails(),
      },
    );
  }
}
