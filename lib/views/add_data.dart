import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController tx_name = new TextEditingController();
  TextEditingController tx_nim = new TextEditingController();
  TextEditingController tx_jurusan = new TextEditingController();
  TextEditingController tx_angkatan = new TextEditingController();
  TextEditingController tx_password = new TextEditingController();
  TextEditingController tx_cpass = new TextEditingController();

  // FUNCTION
  void addData() {
    var url = 'http://10.0.2.2:7000/myapi/addData';

    http.post(url, body: {
      "tx_nim": tx_nim.text,
      "tx_name": tx_name.text,
      "tx_jurusan": tx_jurusan.text,
      "tx_angkatan": tx_angkatan.text,
      "tx_password": tx_password.text,
      "tx_cpass": tx_cpass.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Data Mahasiswa"),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: tx_nim,
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(hintText: "nim", labelText: "NIM"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: tx_name,
                  decoration: InputDecoration(
                      hintText: "nama", labelText: "Nama Lengkap"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: tx_jurusan,
                  decoration: InputDecoration(
                      hintText: "jurusan", labelText: "Jurusan"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: tx_angkatan,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "angkatan", labelText: "Angkatan"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: tx_password,
                  decoration: InputDecoration(
                      hintText: "password", labelText: "Password"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: tx_cpass,
                  decoration: InputDecoration(
                      hintText: "-", labelText: "Confirm Password"),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                RaisedButton(
                  child: Text(
                    "Tambah",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blueAccent,
                  onPressed: () {
                    addData();
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
