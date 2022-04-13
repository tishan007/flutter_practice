import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FileUpload extends StatefulWidget {
  @override
  _FileUploadState createState() => _FileUploadState();
}

class _FileUploadState extends State<FileUpload> {

  List<PlatformFile> _files;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: _openFileExplorer, child: Text("Open File Explorer")),
            ElevatedButton(onPressed: _uploadFile, child: Text("Upload File")),
          ],
        ),
      ),
    );
  }

  void _openFileExplorer() async {
    _files = (await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: false,
      allowedExtensions: null
    )).files;
    print("File path : ${_files.first.path}");
  }
  
  void _uploadFile() async {
    Map<String, String> headers = { "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7ImlkIjoxMCwidXNlcm5hbWUiOiIwMTcxOTAwODc0MiIsIm5hbWUiOiJNaW11IiwiZW1haWwiOm51bGwsInJvbGVfaWQiOjIsInByaXZpbGVnZXMiOiIiLCJpc19vdHBfdmVyaWZpZWQiOiJZRVMifSwiaWF0IjoxNjQ5ODU1MzE1LCJleHAiOjE2NTA0NjAxMTV9.mrN3A_PhW8pqEcHl6u7iigOA8fnj_RqOi1Wks42Cdh0"};
    var uri = Uri.parse("http://165.22.241.122:4000/api/v1/users/upload-profile-picture");
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(headers);
    request.files.add(await http.MultipartFile.fromString("image", _files.first.path));
    var response = await request.send();
    if(response.statusCode == 200) {
      print("Uploaded");
    } else {
      print("Something went wrong!");
    }

  }
  
  
}
