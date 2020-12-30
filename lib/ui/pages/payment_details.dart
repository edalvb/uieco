import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:masked_text_input_formatter/masked_text_input_formatter.dart';
import 'package:uieco/ui/pages/successful_page.dart';

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
                style: TextStyle(color: Colors.black, fontSize: 12),
                decoration: CardInputDecoration("Nombre"),
                textInputAction: TextInputAction.next,
                onEditingComplete: () => _requestFocus(this.cardNumberFocus),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Llene este campo";
                  }
                },
                onSaved: (value) => name = value,
              ),
              SizedBox(height: 20),
              TextFormField(
                style: TextStyle(color: Colors.black, fontSize: 12),
                decoration: CardInputDecoration("Número de tarjeta"),
                inputFormatters: [
                  MaskedTextInputFormatter(
                      mask: "xxxx-xxxx-xxxx-xxxx", separator: "-")
                ],
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                focusNode: cardNumberFocus,
                onEditingComplete: () => _requestFocus(this.expiryDateFocus),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Llene este campo";
                  }
                },
                onSaved: (value) => cardNumber = value,
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: 12),
                      decoration: CardInputDecoration("Fecha de expiracion"),
                      keyboardType: TextInputType.datetime,
                      inputFormatters: [
                        MaskedTextInputFormatter(mask: "MM/YY", separator: "/")
                      ],
                      focusNode: expiryDateFocus,
                      onEditingComplete: () => _requestFocus(this.cvvCodeFocus),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Llene este campo";
                        }
                      },
                      onSaved: (value) => expiryDate = value,
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: 12),
                      decoration: CardInputDecoration("CVV"),
                      keyboardType: TextInputType.number,
                      inputFormatters: [LengthLimitingTextInputFormatter(3)],
                      focusNode: cvvCodeFocus,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Llene este campo";
                        }
                      },
                      onSaved: (value) => cvvCode = value,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  setState(() {
                    this._saveCard = !this._saveCard;
                  });
                },
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      value: this._saveCard,
                      onChanged: (value) {
                        setState(() {
                          this._saveCard = value;
                        });
                      },
                    ),
                    Expanded(
                      child:
                          Text("¿Guardar esta tarjeta para facturas compras?"),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: Text("Confirmar pago"),
                onPressed: () => _showSucessful(context),
              ),
              SizedBox(height: 10),
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

  _showSucessful(BuildContext context) {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();

      MyArguments arguments = MyArguments(
        name: this.name,
        cardNumber: this.cardNumber,
        expiryDate: this.expiryDate,
        cvvCode: this.cvvCode,
        saveCard: this._saveCard,
      );

      Navigator.pushNamedAndRemoveUntil(
        context,
        "/sucessful",
        ModalRoute.withName("/sucessful"),
        arguments: arguments,
      );
    }
  }
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
