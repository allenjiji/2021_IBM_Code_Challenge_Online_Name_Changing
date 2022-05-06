import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:name_change_app/Pages/PreviewPage.dart';

class NewApplicationPage extends StatefulWidget {
  const NewApplicationPage({Key? key}) : super(key: key);
  static const routeName = '/NewApplicationPage';

  @override
  State<NewApplicationPage> createState() => _NewApplicationPageState();
}

class _NewApplicationPageState extends State<NewApplicationPage> {
  final TextEditingController fname = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController incorrect_name = TextEditingController();
  final TextEditingController correct_name = TextEditingController();
  final TextEditingController document_name1 = TextEditingController();
  final TextEditingController document_name2 = TextEditingController();
  String? document_url;
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
              controller: fname,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Father\'s name',
                  hintText: 'Enter your Father\'s Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: address,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Address',
                  hintText: 'Enter your Address'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: document_name1,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name of Document to be corrected ',
                  hintText: 'Enter the Name of the Document'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: incorrect_name,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Incorrect Name',
                  hintText: 'Enter the Incorrect Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: correct_name,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Correct Name',
                  hintText: 'Enter the Correct Name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: document_name2,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name of Supporting Document',
                  hintText: 'Enter name of Document'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: selectFile,
                  child: Text("Select Supporting document")),
              pickedFile == null
                  ? Text("No File Selected")
                  : Text(pickedFile!.name)
            ],
          ),
          // ElevatedButton(
          //     onPressed: pickedFile != null ? uploadFile : null,
          //     child: Text("Upload")),
          buildProgress(),
          Container(
            margin: EdgeInsets.only(top: 15),
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            child: TextButton(
              onPressed: () async {
                if (pickedFile != null) {
                  uploadFile();
                  Navigator.of(context)
                      .pushNamed(PreviewPage.routeName, arguments: {
                    'fname': fname.text,
                    'address': address.text,
                    'incorrect_name': incorrect_name.text,
                    'correct_name': correct_name.text,
                    'document_name1': document_name1.text,
                    'document_name2': document_name2.text,
                    'document_url': document_url
                  });
                }
              },
              child: const Text(
                '- Proceed -',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ],
      )),
    );
  }

  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
  }

  Future uploadFile() async {
    final user = FirebaseAuth.instance.currentUser;
    final path = 'files/${user!.email}/${pickedFile!.name}';
    final file = File(pickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    setState(() {
      uploadTask = ref.putFile(file);
    });

    final snapshot = await uploadTask!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    // print('Download from: $urlDownload');
    document_url = urlDownload;
    setState(() {
      uploadTask = null;
    });
  }

  Widget buildProgress() {
    return StreamBuilder<TaskSnapshot>(
        stream: uploadTask?.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            double progress = (data.bytesTransferred / data.totalBytes);
            return SizedBox(
              height: 50,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  LinearProgressIndicator(
                      value: progress, backgroundColor: Colors.amber),
                  Center(
                    child: Text(
                      '${(100 * progress).roundToDouble()}% uploaded',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            );
          } else {
            return const SizedBox(
              height: 50,
            );
          }
        });
  }
}
