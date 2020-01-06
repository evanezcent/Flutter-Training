import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:training/main.dart';
import 'package:training/views/edit_data.dart';
import 'package:http/http.dart' as http;

class Profil extends StatefulWidget {
  // Variable penampung data API

  List list;
  int idx;
  Profil({this.idx, this.list});

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  void deleteData() {
    var url =
        'http://10.0.2.2:7000/myapi/deleteData/${widget.list[widget.idx]['nim']}';

    http.delete(url);
  }

  void deleteHandle() {
    AlertDialog alert = new AlertDialog(
      content: Text.rich(
        new TextSpan(children: <TextSpan>[
          new TextSpan(text: "Apa kamu yakin ingin menghapus "),
          new TextSpan(
              text: "${widget.list[widget.idx]['nim']} ",
              style: TextStyle(fontWeight: FontWeight.bold)),
          new TextSpan(text: "?")
        ]),
      ),
      actions: <Widget>[
        new RaisedButton(
          child: new Text(
            "Hapus",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.redAccent,
          onPressed: () => {
            deleteData(),
            Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new Home(),
            ))
          },
        ),
        new RaisedButton(
          child: new Text(
            "Batal",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.blueAccent,
          onPressed: () => Navigator.pop(context)
        )
      ],
    );

    showDialog(context: context, child: alert);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar:
            new AppBar(title: new Text("${widget.list[widget.idx]['nim']}")),
        body: Container(
          height: 400,
          padding: EdgeInsets.all(10),
          child: Card(
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 150,
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://cdn.pixabay.com/photo/2017/06/13/12/53/profile-2398782_960_720.png",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.list[widget.idx]['nim'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(widget.list[widget.idx]['nama']),
                  SizedBox(
                    height: 10,
                  ),
                  Text(widget.list[widget.idx]['jurusan']),
                  SizedBox(
                    height: 10,
                  ),
                  Text(widget.list[widget.idx]['angkatan'].toString()),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                          child: Text("Edit"),
                          color: Colors.lightBlue,
                          onPressed: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => new EditData(
                                  list: widget.list,
                                  idx: widget.idx,
                                ),
                              ))),
                      SizedBox(
                        width: 10,
                      ),
                      RaisedButton(
                        child: Text("Delete"),
                        color: Colors.redAccent,
                        onPressed: () => deleteHandle(),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
