import 'package:flutter/material.dart';

class NewApplicationPage extends StatefulWidget {
  const NewApplicationPage({Key? key}) : super(key: key);
  static const routeName = '/NewApplicationPage';

  @override
  State<NewApplicationPage> createState() => _NewApplicationPageState();
}

class _NewApplicationPageState extends State<NewApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Application"),
      ),
      body: Form(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              // controller:   ,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  hintText: 'Enter your Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              // controller:   ,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Father\'s name',
                  hintText: 'Enter your Father\'s Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              // controller:   ,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Address',
                  hintText: 'Enter your Address'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              // controller:   ,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name of Document to be corrected ',
                  hintText: 'Enter the Name of the Document'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              // controller:   ,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Incorrect Name',
                  hintText: 'Enter the Incorrect Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              // controller:   ,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Correct Name',
                  hintText: 'Enter the Correct Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              // controller:   ,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name of Supporting Document',
                  hintText: 'Enter name of Document'),
            ),
          ),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            child: TextButton(
              onPressed: () async {
                print("Hello");
                // Navigator.of(context).pushNamed(HomePage.routeName);
              },
              child: const Text(
                'Proceed to Payment',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
