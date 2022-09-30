import 'package:converter_suhu_listwidget/widget/convert.dart';
import 'package:converter_suhu_listwidget/widget/input.dart';
import 'package:converter_suhu_listwidget/widget/result.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // text controller
  TextEditingController etInput = new TextEditingController();
  // varriabel berubah

  double _inputUser = 0;
  double _result = 0;
  String _selectedDropdown = "kelvin";

  var listSatuanSuhu = ["kelvin", "reamur"];
  List<String> listHasil = [];
  
  get onDropdownChanged => null;
  
  get key => null;
  

  _konversiSuhu() {
    setState(() {
      _inputUser = double.parse(etInput.text);
      switch (_selectedDropdown) {
        case "kelvin":
          {
            // statements;
            _result = _inputUser + 273;
            listHasil.add("Konversi dari : " +
            "$_inputUser" + 
            " ke " +
            "$_result" +
            " Kelvin");
          }
          break;

        case "reamur":
          {
            //statements;
            _result = _inputUser * 4 / 5;
            listHasil.add("Konversi dari : " +
                "$_inputUser" +
                " ke " +
                "$_result" +
                " Reamur");
          }
          break;
      }
    });
  }

  _onDropdownChanged(String value) {
    setState(() {
      _selectedDropdown = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konversi Suhu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
                Input(key: key, etInput: etInput),
                //3 buat dropdown biasa
                DropdownButton(
                  items: listSatuanSuhu.map((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  value: _selectedDropdown,
                  onChanged: onDropdownChanged,
                  isExpanded: true,
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Result(
                      result: _result,
                    ),
                  ],
                ),
              ),
              Convert(konvertHandler: _konversiSuhu),
                Expanded(
                  child: ListView.builder(
                    itemCount: listHasil.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Text(listHasil[index]
                        ),
                      );
                    },
                  ),
                ),
              ],
          ),
        ),
      ),
    );
  }
}

