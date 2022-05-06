import 'package:flutter/material.dart';

class PreviewPage extends StatelessWidget {
  PreviewPage({
    Key? key,
  }) : super(key: key);
  static final routeName = '\PreviewPage';
  // final String fname,
  //     address,
  //     document_name1,
  //     incorrect_name,
  //     correct_name,
  //     document_name2,
  //     document_url;
  // required this.fname,
  //     required this.address,
  //     required this.document_name1,
  //     required this.incorrect_name,
  //     required this.correct_name,
  //     required this.document_name2,
  //     required this.document_url

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map;
    print(routeArgs);
    return Scaffold(
      appBar: AppBar(
        title: Text('Preview Details'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Text('Father\'s Name:'),
            title: Text(routeArgs['fname']),
          ),
          ListTile(
            leading: Text('Address: '),
            title: Text(routeArgs['address']),
          ),
          ListTile(
            leading: Text('Document Name: '),
            title: Text(routeArgs['document_name1']),
          ),
          ListTile(
            leading: Text('Incorrect Name: '),
            title: Text(routeArgs['incorrect_name']),
          ),
          ListTile(
            leading: Text('Correct Name: '),
            title: Text(routeArgs['correct_name']),
          ),
          ListTile(
            leading: Text('Supporting Document: '),
            title: Text(routeArgs['document_name2']),
          ),
          Container(
              height: 500,
              width: 500,
              child: Image.network(
                routeArgs['document_url'],
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Image URL: ' + routeArgs['document_url']),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
