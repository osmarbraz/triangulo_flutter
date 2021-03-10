import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Cálculo da Área do Triângulo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Mensagem do resultado
  String _info = "A área é: ";

  //Chave do formulário
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //Controler das caixas de texto
  TextEditingController alturaController = TextEditingController();
  TextEditingController baseController = TextEditingController();

  /**
   * Construtor
   */
  @override
  void initState() {
    super.initState();
    limparClick();
  }

  @override
  Widget build(BuildContext context) {
    //Barra do aplicativo
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Cálculo da Área do Triângulo'),
      ),
      //Corpo do aplicativo
      body: Container(
        child: Builder(
          builder: (context) => Form(
            //Chave do formulário
            key: _formKey,
            //Campos do formulário
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    "Altura:",
                    style: new TextStyle(
                        fontSize: 12.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w200,
                        fontFamily: "Roboto"),
                  ),
                  new TextFormField(
                      style: new TextStyle(
                          fontSize: 12.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w200,
                          fontFamily: "Roboto"),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      // somente números podem ser digitados
                      //Validação da entrada
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Insira a altura!";
                        }
                      },
                      controller: alturaController),
                  new Text(
                    "Base:",
                    style: new TextStyle(
                        fontSize: 12.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w200,
                        fontFamily: "Roboto"),
                  ),
                  new TextFormField(
                      style: new TextStyle(
                          fontSize: 12.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w200,
                          fontFamily: "Roboto"),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      // somente números podem ser digitados
                      //Validação da entrada
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Insira a base!";
                        }
                      },
                      controller: baseController),
                  new Text(
                    _info,
                    style: new TextStyle(
                        fontSize: 18.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w200,
                        fontFamily: "Roboto"),
                  ),
                  new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new RaisedButton(
                            key: null,
                            onPressed: calcularClick,
                            color: const Color(0xFFe0e0e0),
                            child: new Text(
                              "CALCULAR",
                              style: new TextStyle(
                                  fontSize: 12.0,
                                  color: const Color(0xFF000000),
                                  fontWeight: FontWeight.w200,
                                  fontFamily: "Roboto"),
                            )),
                        new RaisedButton(
                            key: null,
                            onPressed: limparClick,
                            color: const Color(0xFFe0e0e0),
                            child: new Text(
                              "LIMPAR",
                              style: new TextStyle(
                                  fontSize: 12.0,
                                  color: const Color(0xFF000000),
                                  fontWeight: FontWeight.w200,
                                  fontFamily: "Roboto"),
                            )),
                        new RaisedButton(
                            key: null,
                            onPressed: fecharClick,
                            color: const Color(0xFFe0e0e0),
                            child: new Text(
                              "FECHAR",
                              style: new TextStyle(
                                  fontSize: 12.0,
                                  color: const Color(0xFF000000),
                                  fontWeight: FontWeight.w200,
                                  fontFamily: "Roboto"),
                            ))
                      ])
                ]),
          ),
        ),
      ),
    );
  }

  /**
   * Evento do botão calcular
   */
  void calcularClick() {
    if (_formKey.currentState.validate()) {
      double altura = double.parse(alturaController.text);
      double base = double.parse(baseController.text);
      double area = base * altura / 2.0;
      _info = "A área é: ${area.toString()}";
    }
  }

  /**
   * Evento do botão limpar
   */
  void limparClick() {
    alturaController.text = '';
    baseController.text = '';
    setState(() {
      _info = "A área é: ";
      _formKey = GlobalKey<FormState>();
    });
  }

  /**
   * Evento do botão fechar
   */
  void fecharClick() {
    SystemNavigator.pop();
  }
}
