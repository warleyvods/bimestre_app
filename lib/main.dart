import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Home()
  ));
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

/*  String nota1 = "Digite a primeira nota";
  String nota2 = "Digite a segunda nota";
  String nota3 = "Digite a terceira nota";
  String nota4 = "Digite a quarta nota";*/

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



      if(nota >= 6) {
        info = "Aprovado: ${nota.toStringAsPrecision(2)}";
      } else if (nota < 6) {
        info = "Reprovado: ${nota.toStringAsPrecision(2)}";
      }


    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            textoAppBar,
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.delete_forever,
                color: Colors.white,
              ),
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
                buildTextFormField("Digite a primeira nota", nota1Control),
                Divider(),
                buildTextFormField("Digite a segunda nota", nota2Control),
                Divider(),
                buildTextFormField("Digite a terceira nota", nota3Control),
                Divider(),
                buildTextFormField("Digite a quarta nota", nota4Control),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Container(
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          calcular();
                        }
                        ;
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

  TextFormField buildTextFormField(String texto, TextEditingController controller) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          hintText: texto,
          border: OutlineInputBorder(),
          labelStyle:
          TextStyle(color: Colors.black, fontSize: 20.0)),

      textAlign: TextAlign.center,
      controller: controller,
      validator: (valor) {
        if (valor.isEmpty) {
          return "Insira sua nota, este campo não pode ser nulo!";
        }
      },
    );
  }
}
