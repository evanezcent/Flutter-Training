import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:training/main.dart';

class EditData extends StatefulWidget {

  final List list;
  final int idx;

  const EditData({Key key, this.list, this.idx});

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {

  TextEditingController tx_name;
  TextEditingController tx_jurusan;
  TextEditingController tx_angkatan;
  TextEditingController tx_nim;

  void editData(){
    var url = 'http://10.0.2.2:7000/myapi/editData/${widget.list[widget.idx]['nim']}';

    http.put(url, body: {
      "tx_name": tx_name.text,
      "tx_jurusan": tx_jurusan.text,
      "tx_angkatan": tx_angkatan.text,
    });
  }

  void initState(){
    tx_name = new TextEditingController(text: widget.list[widget.idx]['nama']);
    tx_jurusan = new TextEditingController(text: widget.list[widget.idx]['jurusan']);
    tx_angkatan = new TextEditingController(text: widget.list[widget.idx]['angkatan'].toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit data"),),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
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

                Padding(
                  padding: EdgeInsets.all(10),
                ),
                RaisedButton(
                  child: Text(
                    "Edit",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blueAccent,
                  onPressed: () {
                    editData();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => new Home()
                      )
                    );
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