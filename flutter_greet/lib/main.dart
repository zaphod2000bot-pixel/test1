import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Greet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GreetPage(),
    );
  }
}

class GreetPage extends StatefulWidget {
  const GreetPage({super.key});

  @override
  State<GreetPage> createState() => _GreetPageState();
}

class _GreetPageState extends State<GreetPage> {
  final TextEditingController _controller = TextEditingController();

  void _greet() {
    final name = _controller.text.trim();
    final greeting = 'Hello ${name.isEmpty ? 'there' : name}';
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Greeting'),
        content: Text(greeting),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Greet')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _greet,
              child: const Text('Greet'),
            ),
          ],
        ),
      ),
    );
  }
}
