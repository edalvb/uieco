import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentDetails extends StatefulWidget {
  @override
  _PaymentDetailsState createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              Text(
                "Detalles de Pago",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(FontAwesomeIcons.mapMarkerAlt),
                  SizedBox(width: 10),
                  lineSpacer(Color(0xFF34495E)),
                  SizedBox(width: 10),
                  Icon(FontAwesomeIcons.creditCard),
                  SizedBox(width: 10),
                  lineSpacer(Colors.grey),
                  SizedBox(width: 10),
                  Icon(
                    FontAwesomeIcons.check,
                    color: Colors.grey,
                  ),
                ],
              ),
              SizedBox(height: 15),
              Image.asset(
                "assets/images/card_persons.png",
                height: 125,
              ),
              SizedBox(height: 15),
              Text(
                "Ingrese los datos de su tarjeta de crédito",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Colors.grey
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget lineSpacer(Color color) {
    return Expanded(
      child: Container(
        height: 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
      ),
    );
  }
}
