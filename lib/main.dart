import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//Programa principal
void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {

  // Este widget é a raiz do aplicativo.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Cálculo da Área do Triângulo',
      theme: new ThemeData(
        // Este é o tema do aplicativo.
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new MinhaHomePage(),
    );
  }
}

// Este widget é a página inicial do seu aplicativo.
class MinhaHomePage extends StatefulWidget {
  MinhaHomePage({Key key}) : super(key: key);

  @override
  _MinhaHomePageState createState() => new _MinhaHomePageState();
}

class _MinhaHomePageState extends State<MinhaHomePage> {
  //Mensagem do resultado
  String mensagem = "A área é: ";

  //Chave do formulário
  GlobalKey<FormState> chaveFormulario = GlobalKey<FormState>();

  //Controler das caixas de texto do formulário
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
            key: chaveFormulario,
            //Campos do formulário
            //Coluna dos campos de entrada
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    "Altura:",
                    style: new TextStyle(
                        fontSize: 12.0,
                        fontFamily: "Roboto"),
                  ),
                  new TextFormField(
                      style: new TextStyle(
                          fontSize: 12.0,
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
                        fontFamily: "Roboto"),
                  ),
                  new TextFormField(
                      style: new TextStyle(
                          fontSize: 12.0,
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
                    mensagem,
                    style: new TextStyle(
                        fontSize: 18.0,
                        fontFamily: "Roboto"),
                  ),
                  //Linha dos botões
                  new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new ElevatedButton(
                            key: null,
                            onPressed: () {
                                calcularClick();
                            },
                            child: new Text(
                              "CALCULAR",
                              style: new TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: "Roboto"),
                            )),
                        new ElevatedButton(
                            key: null,
                            onPressed: () {
                              limparClick();
                            },
                            child: new Text(
                              "LIMPAR",
                              style: new TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: "Roboto"),
                            )),
                        new ElevatedButton(
                            key: null,
                            onPressed: () {
                              fecharClick();
                            },
                            child: new Text(
                              "FECHAR",
                              style: new TextStyle(
                                  fontSize: 12.0,
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
    //Chama a validação do formulário
    if (chaveFormulario.currentState.validate()) {
      //Recupera os dados da tela e converte para double
      double altura = double.parse(alturaController.text);
      double base = double.parse(baseController.text);
      double area = base * altura / 2.0;
      //Exibe a mensagem
      setState(() {
        mensagem = "A área é: ${area.toString()}";
      });
    }
  }

  /**
   * Evento do botão limpar
   */
  void limparClick() {
    //Limpa as caixas de texto
    alturaController.text = '';
    baseController.text = '';
    setState(() {
      mensagem = "A área é: ";
      chaveFormulario = GlobalKey<FormState>();
    });
  }

  /**
   * Evento do botão fechar
   */
  void fecharClick() {
    SystemNavigator.pop();
  }
}
