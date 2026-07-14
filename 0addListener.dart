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

class MyTextFieldListener extends StatefulWidget {
  const MyTextFieldListener({super.key});
  @override
  MyTextFieldListenerState createState() => MyTextFieldListenerState();
}

class MyTextFieldListenerState extends State<MyTextFieldListener> {
  final TextEditingController _controller = TextEditingController();//controller
  String _currentText = "";

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);//listener
  }

  @override
  void dispose() {//Descartar o controller no widget removido
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {//função para cada mudança
    setState(() {
      _currentText = _controller.text;
      //print("Texto atual: ${_controller.text}");//exibe no terminal
    });
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
              controller: _controller, // 5. Conectar o controller
              decoration: InputDecoration(labelText: 'Digite'),
            ),
            SizedBox(height: 20),
            Text("Você digitou: $_currentText"),
            Text(''),
          ],
        ),
      ),
    );
  }
}











