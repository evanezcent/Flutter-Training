import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:training/main.dart';
import 'package:training/views/edit_data.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';

class Profil extends StatefulWidget {
  // Variable penampung data API

  final List list;
  final int idx;
  Profil({this.idx, this.list});

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  // Get image handler
  File _image;

  Future getImageGallery() async {
    var imgFile = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = imgFile;
    });
  }

  Future uploadHandle(File image) async {

    // String base64Image = base64Encode(image.readAsBytesSync());
    // var url = "http://10.0.2.2:7000/myapi/uploadFoto/${widget.list[widget.idx]['nim']}";

    // http.put(url, body: {
    //   "photo": base64Image
    // });
    var stream = new http.ByteStream(DelegatingStream.typed(image.openRead()));
    var length = await image.length();
    print(length);
    var uri = Uri.parse(
        "http://10.0.2.2:7000/myapi/uploadFoto/${widget.list[widget.idx]['nim']}");

    var req = new http.MultipartRequest("PUT", uri);

    var imgFile = new http.MultipartFile("photo", stream, length);

    req.files.add(imgFile);
    var res = await req.send();

    if (res.statusCode == 200) {
      print("Upload success");
    } else {
      print("Upload failed");
    }
  }

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
            onPressed: () => Navigator.pop(context))
      ],
    );

    showDialog(context: context, child: alert);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar:
            new AppBar(title: new Text("${widget.list[widget.idx]['nim']}")),
        body: SingleChildScrollView(
          child: Container(
            height: 600,
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
                      child: _image == null
                          ? CachedNetworkImage(
                              imageUrl:
                                  "http://10.0.2.2:7000/uploads/${widget.list[widget.idx]['foto_profil']}",
                            )
                          : Image.file(_image),
                    ),
                    Container(
                      // margin: EdgeInsets.only(bottom: 5, top: 10),
                      child: FlatButton(
                          child: Text(
                            "Change profile picture",
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                          onPressed: () => getImageGallery()),
                    ),
                    Container(
                      child: _image == null
                          ? Text("")
                          : RaisedButton(
                              child: Text("Upload"),
                              onPressed: () {
                                uploadHandle(_image);
                              },
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
                                  builder: (BuildContext context) =>
                                      new EditData(
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
          ),
        ));
  }
}
