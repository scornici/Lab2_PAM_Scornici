import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Laboratorul 2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _rez = 0;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                onChanged: (text) {
                  _rez = 0;
                  List<String> input = text.split(" ");
                  for (var element in input) {
                    if (element.contains('a') || element.contains('A')) {
                      setState(() {
                        _rez++;
                      });
                    }
                  }
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Type here...',
                  contentPadding: EdgeInsets.all(5.0),
                ),
                style: GoogleFonts.lato(fontSize: 17),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: style,
              onPressed: () {
                AlertDialog alert = AlertDialog(
                  title: const Text("Result"),
                  content: Text(
                    "$_rez contains letter 'a'",
                    style: const TextStyle(fontSize: 19),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                );
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alert;
                  },
                );
              },
              child: const Text("Calculate"),
              ),
          ],
        ),
      ),
    );
  }
}
