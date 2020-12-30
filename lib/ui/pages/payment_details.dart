import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:masked_text_input_formatter/masked_text_input_formatter.dart';

class PaymentDetails extends StatefulWidget {
  @override
  _PaymentDetailsState createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  final formKey = GlobalKey<FormState>();
  String name = "";
  String cardNumber = "";
  String expiryDate = "";
  String cvvCode = "";

  var _saveCard = false;

  FocusNode cardNumberFocus;
  FocusNode expiryDateFocus;
  FocusNode cvvCodeFocus;

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
                    color: Colors.grey),
              ),
              SizedBox(height: 20),
              TextFormField(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
                decoration: CardInputDecoration("Nombre"),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Llene este campo";
                  }
                },
                onSaved: (value) => name = value,
                onEditingComplete: () => _requestFocus(this.cardNumberFocus),
              ),
              TextFormField(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
                decoration: CardInputDecoration("Número de tarjeta"),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Llene este campo";
                  }
                },
                onSaved: (value) => cardNumber = value,
                inputFormatters: [
                  MaskedTextInputFormatter(
                      mask: "xxxx-xxxx-xxxx-xxxx", separator: "-")
                ],
                keyboardType: TextInputType.number,
                focusNode: cardNumberFocus,
                textInputAction: TextInputAction.next,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.cardNumberFocus = FocusNode();
    this.expiryDateFocus = FocusNode();
    this.cvvCodeFocus = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    this.cardNumberFocus.dispose();
    this.expiryDateFocus.dispose();
    this.cvvCodeFocus.dispose();
    super.dispose();
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

  _requestFocus(FocusNode focusNode) =>
      FocusScope.of(context).requestFocus(focusNode);
}

class CardInputDecoration extends InputDecoration {
  CardInputDecoration(String myLabelText)
      : super(
          fillColor: Color(0xFFF5F5F5),
          filled: true,
          hintText: myLabelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.all(10),
        );
}
