import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      {this.icon,
        this.title,
        this.subTitle,
        this.value,
        this.selectedValue,
        this.paymentCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: InkWell(
        onTap: _onTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: getWidgetState(),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                decoration: BoxDecoration(
                  color: Color(0xffFBFBFB),
                  // color: Colors.black,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    icon,
                    Expanded(
                      child: Column(
                        children: [
                          Text(title,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)),
                          Text(
                            subTitle,
                            style:
                            TextStyle(color: Color(0xff6C738A), fontSize: 10),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
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
