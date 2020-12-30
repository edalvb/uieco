import 'package:flutter/material.dart';

class SucessfulPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(ModalRoute.of(context).settings.arguments);
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
                color: Color(0xFF34495E),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(60))),
            child: Center(
              child: Image.asset(
                "assets/images/mujer.png",
                height: 200,
              ),
            ),
          ),
          SizedBox(height: 30),
          Image.asset(
            "assets/images/done.png",
            height: 60,
          ),
          SizedBox(height: 30),
          Text(
            "Gracias por su compra",
            style: TextStyle(
              color: Color(0xFF34495E),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Su orden será entregada \nen 2-4 días laborales.",
            style: TextStyle(color: Colors.grey[800]),
            textAlign: TextAlign.center,
          )
        ],
      ),
      floatingActionButton: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        ),
        child: Text("Continuar comprando"),
        onPressed: () => nothing(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  nothing(BuildContext context) {

  }
}

class MyArguments {
  String name = "";
  String cardNumber = "";
  String expiryDate = "";
  String cvvCode = "";
  var saveCard = false;

  MyArguments(
      {this.name,
      this.cardNumber,
      this.expiryDate,
      this.cvvCode,
      this.saveCard});

  @override
  String toString() {
    return 'MyArguments{name: $name, cardNumber: $cardNumber, expiryDate: $expiryDate, cvvCode: $cvvCode, saveCard: $saveCard}';
  }
}
