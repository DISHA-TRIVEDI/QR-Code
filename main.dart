import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
void main() {
  runApp(App());
}
 class App extends StatelessWidget {
  //This widget is the root of application.
  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      title: 'FLUTTER',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,

      ),
      home: Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController _editingController = TextEditingController(text: 'Medoc Health');
   late String data;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text('QR GENERTOR')),
      body: Container(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(contentPadding: EdgeInsets.all(10)),
              controller: _editingController,
            ),
            ElevatedButton(
              onPressed:(){
              setState(() {
               data = _editingController.text;
              });
    },
              child: Text('Generate QR')
            ),
            Center(
              child: QrImage(
              data: '$data',
                version: QrVersions.auto,
                size: 200,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
