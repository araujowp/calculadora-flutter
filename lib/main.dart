import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

bool isNumeric(String str) {
  try{
    var value = double.parse(str);
  } on FormatException {
    return false;
  }
  return true;
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'calculadora'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _textoVisor = '';

  void _disparaTeclado(String descricaoBotao) {
    setState(() {
      print('passou' + descricaoBotao);

        if(!isNumeric(_textoVisor)){
          _textoVisor = descricaoBotao;
        }

      _textoVisor = _textoVisor + descricaoBotao;
    });
  }

  void _disparaAcao(String descricaoBotao) {
    setState(() {
      print('passou' + descricaoBotao);
      _textoVisor = descricaoBotao;
    });
  }


  Widget visor() {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      margin: EdgeInsets.all(15),
      width: 400,
      height: 120,
      child: Text(
        _textoVisor,
        style: TextStyle(
          fontSize: 50,
        ),
      ),
    );
  }

  Widget botaoNumero(String texto) {
    return Expanded(
      child: RaisedButton(
        color: Colors.white,
        textColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(3.0),
            side: BorderSide(color: Colors.grey.shade200, width: 1)),
        onPressed: () {_disparaTeclado(texto);},
        child: Text(
          texto,
          style: TextStyle(
            fontSize: 28,
          ),
        ),
      ),
    );
  }

  Widget botaoAcao(String texto) {
    return Expanded(
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(3.0),
            side: BorderSide(color: Colors.blue.shade700, width: 1)),
        onPressed: () {
          _disparaAcao(texto);
        },
        child: Text(
          texto,
          style: TextStyle(
            fontSize: 28,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.title),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            visor(),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  botaoAcao('C'),
                  botaoAcao('DEL'),
                  botaoAcao('%'),
                  botaoAcao('/')
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  botaoNumero('7'),
                  botaoNumero('8'),
                  botaoNumero('9'),
                  botaoAcao('*')
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  botaoNumero('4'),
                  botaoNumero('5'),
                  botaoNumero('6'),
                  botaoAcao('+')
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  botaoNumero('1'),
                  botaoNumero('2'),
                  botaoNumero('3'),
                  botaoAcao('-')
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  botaoNumero('0'),
                  botaoNumero('.'),
                  botaoAcao('=')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


