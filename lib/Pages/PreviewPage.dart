import 'package:flutter/material.dart';

class PreviewPage extends StatelessWidget {
  const PreviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preview Details'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Father\'s Name:'),
          )
        ],
      ),
    );
  }
}
