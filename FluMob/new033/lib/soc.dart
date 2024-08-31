import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MyAppSec extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real-Time Dino Name Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NameGeneratorPage(),
    );
  }
}

class NameGeneratorPage extends StatefulWidget {
  @override
  _NameGeneratorPageState createState() => _NameGeneratorPageState();
}

class _NameGeneratorPageState extends State<NameGeneratorPage> {
  final TextEditingController _controller = TextEditingController();
  final _channel = WebSocketChannel.connect(
    Uri.parse('ws://127.0.0.1:8000/ws/generate_name'),
  );
  String _generatedName = "";

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }

  void _sendInput(String input) {
    if (input.isNotEmpty) {
      _channel.sink.add(input);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Real-Time Dino Name Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter characters'),
              onChanged: _sendInput,
            ),
            SizedBox(height: 20),
            StreamBuilder(
              stream: _channel.stream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    _generatedName = snapshot.data.toString();
                  }
                }
                return Text(
                  _generatedName.isEmpty
                      ? 'Enter characters to generate name'
                      : 'Generated Name: $_generatedName',
                  style: TextStyle(fontSize: 20),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
