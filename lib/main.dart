import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController nota1Control = new TextEditingController();
  TextEditingController nota2Control = new TextEditingController();
  TextEditingController nota3Control = new TextEditingController();
  TextEditingController nota4Control = new TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String textoAppBar = "Calculadora de Aprovação";

  String nota1 = "Nota da prova do primeiro bimestre!";
  String nota2 = "Nota da prova do segundo bimestre!";
  String nota3 = "Nota da prova do terceiro bimestre!";
  String nota4 = "Nota da prova do quarto bimestre!";

  String info = "Informação";

  String textoBotaoCalcular = "Calcular";

  void resetar() {
    nota1Control.text = "";
    nota2Control.text = "";
    nota3Control.text = "";
    nota4Control.text = "";
    setState(() {
      info = "";
    });
  }

  void calcular() {
    setState(() {
      double nota1 = double.parse(nota1Control.text);
      double nota2 = double.parse(nota2Control.text);
      double nota3 = double.parse(nota3Control.text);
      double nota4 = double.parse(nota4Control.text);

      double nota = (nota1 + nota2 + nota3 + nota4) / 4;
      print(nota);

      info = "Nota: ${nota.toStringAsPrecision(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            textoAppBar,
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh, color: Colors.white,),
              onPressed: () {
                resetar();
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 30.0, bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 50.0,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.close,
                              color: Colors.red,
                              size: 50.0,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: nota1,
                      labelStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
                  textAlign: TextAlign.center,
                  controller: nota1Control,
                  validator: (valor) {
                    if (valor.isEmpty) {
                      return "Insira sua nota";
                    }
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: nota2,
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      )),
                  textAlign: TextAlign.center,
                  controller: nota2Control,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: nota3,
                      labelStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
                  textAlign: TextAlign.center,
                  controller: nota3Control,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: nota4,
                    labelStyle: TextStyle(color: Colors.black, fontSize: 20.0),
                  ),
                  textAlign: TextAlign.center,
                  controller: nota4Control,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Container(
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          calcular();
                        };
                      },
                      child: Text(
                        textoBotaoCalcular,
                        style: TextStyle(color: Colors.black, fontSize: 25.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20.0),
                  height: 50.0,
                  child: Text(
                    info,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green, fontSize: 25.0),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
