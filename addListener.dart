import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter listener',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Home listener'),
    );
  }
}

class MyHomePage extends MyTextFieldListener {
  const MyHomePage({super.key, required this.title});
  final String title;
}
//Em flutter, para alterar o estado de tela do app devemos usar setState.
//A funçao setState é exclusiva da classe Statefulwidget. 
//Logo a tela deve ser criada em uma classe extendida de Statefulwidget.
//criamos uma classe estendida de statefulwidget e nela criamos um estado.
class MyTextFieldListener extends StatefulWidget {
  const MyTextFieldListener({super.key});
  @override
  MyTextFieldListenerState createState() => MyTextFieldListenerState();
}

class MyTextFieldListenerState extends State<MyTextFieldListener> {
  //definimos um controlador que captura os dados do textfield.
  // o controller deve ser colocado no textfield.
  final TextEditingController _controller = TextEditingController();//controller
  String _currentText = ""; //essa string vai ser colocada na tela para exibir a mensagem.

  //Função que atualiza a tela ao digitar.
  void _onTextChanged() {
    setState(() {
      _currentText = _controller.text;
      //print("Texto atual: ${_controller.text}");//exibe no terminal
    });
  }
  
  @override
  void initState() { //essa função altera a tela instantaneamente ao digitar
    super.initState();
    _controller.addListener(_onTextChanged);//listener captura o controller e chama a função.
  }

  @override
  void dispose() {//Descartar o controller no widget removido após fechar o app
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("addListener")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('ADDLISTENER'),
            Text(''),
            TextField(
              //input para dados digitados deve conter o controller.
              controller: _controller, // 5. Conectar o controller
              decoration: InputDecoration(labelText: 'Digite'),
            ),
            SizedBox(height: 20),
            //exibe o texto digitado.
            Text("Você digitou: $_currentText"),
            Text(''),
          ],
        ),
      ),
    );
  }
}



