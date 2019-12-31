import 'package:flutter/material.dart';

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
                  onPressed: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
