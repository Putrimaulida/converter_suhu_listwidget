// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Input extends StatelessWidget {
  Input({
    required Key key,
    required this.etInput,
  }) : super(key: key);

  final TextEditingController etInput;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(hintText: "Masukkan Suhu Dalam Celcius"),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        controller: etInput,
        keyboardType:
            TextInputType.numberWithOptions(decimal: true, signed: false));
  }
}