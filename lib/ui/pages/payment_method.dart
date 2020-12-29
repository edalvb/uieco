import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uieco/ui/components/payment_type.dart';

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
        padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
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
              icon: Icon(
                FontAwesomeIcons.creditCard,
                color: Colors.orange,
              ),
              value: PaymentMethod.CREDIT_CARD,
              selectedValue: this.paymentSelected,
              paymentCallback: _onPaymentChange,
            ),
            PaymentMethodWidget(
              title: "Transferencia bancaria",
              subTitle: "Pague directo desde su cuenta",
              icon: Icon(
                FontAwesomeIcons.university,
                color: Color(0xFF00A7D9),
              ),
              value: PaymentMethod.BANK,
              selectedValue: this.paymentSelected,
              paymentCallback: _onPaymentChange,
            ),
            PaymentMethodWidget(
              title: "Paypal",
              subTitle: "La manera más rápida y segura de enviar dinero",
              icon: Icon(
                FontAwesomeIcons.paypal,
                color: Color(0xFF0D47A1),
              ),
              value: PaymentMethod.PAYPAL,
              selectedValue: this.paymentSelected,
              paymentCallback: _onPaymentChange,
            ),
            PaymentMethodWidget(
              title: "Billetera de Bitcoin",
              subTitle: "Enviar la cantidad a nuestra billetera Bitcoin",
              icon: Icon(
                FontAwesomeIcons.bitcoin,
                color: Colors.black,
              ),
              value: PaymentMethod.BITCOIN,
              selectedValue: this.paymentSelected,
              paymentCallback: _onPaymentChange,
            ),
          ],
        ),
      ),
    );
  }

  _onPaymentChange(PaymentMethod value) {
    setState(() {
      this.paymentSelected = value;
    });
  }
}
