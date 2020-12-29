import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentMethodPage extends StatefulWidget {
  @override
  _PaymentMethodPageState createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  var paymentSelected = PaymentMethod.CREDIT_CARD;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Método de pago",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff1A1A1A),
              ),
            ),
            Text(
              "Selecciona uno de los métodos de pago",
              style: TextStyle(
                color: Color(0xff6C738A),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            PaymentMethodWidget(
              title: "Tarjeta de crédito",
              subTitle: "Pague con MasterCard o Visa",
              value: PaymentMethod.CREDIT_CARD,
              selectedValue: this.paymentSelected,
              paymentCallback: (value) {
                setState(() {
                  this.paymentSelected = value;
                });
              },
            ),
            PaymentMethodWidget(
              title: "Transferencia bancaria",
              subTitle: "Pague directo desde su cuenta",
              value: PaymentMethod.BANK,
              selectedValue: this.paymentSelected,
              paymentCallback: (value) {
                setState(() {
                  this.paymentSelected = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

enum PaymentMethod { CREDIT_CARD, BANK, PAYPAL, BITCOIN }

typedef PaymentCallback = Function(PaymentMethod value);

class PaymentMethodWidget extends StatelessWidget {
  Widget icon;
  String title;
  String subTitle;
  PaymentMethod value;
  PaymentMethod selectedValue;
  PaymentCallback paymentCallback;

  PaymentMethodWidget(
      {this.icon, this.title, this.subTitle, this.value, this.selectedValue, this.paymentCallback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTap,
      child: Row(
        children: <Widget>[
          getWidgetState(),
        ],
      ),
    );
  }

  Widget getWidgetState() {
    if (value == selectedValue) {
      return Icon(
        FontAwesomeIcons.solidCheckCircle,
        color: Colors.green,
        size: 21,
      );
    } else {
      return Container(
        margin: EdgeInsets.only(left: 1),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey,
            width: 2,
          ),
        ),
        height: 20,
        width: 20,
      );
    }
  }

  void _onTap() {
    this.paymentCallback(this.value);
  }
}
