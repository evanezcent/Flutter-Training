import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  // Variable penampung data API

  List list;
  int idx;
  Profil({this.idx, this.list});

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("${widget.list[widget.idx]['nim']}")),
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
                  child: CachedNetworkImage(imageUrl: "https://cdn.pixabay.com/photo/2017/06/13/12/53/profile-2398782_960_720.png",),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(widget.list[widget.idx]['nim'], style: TextStyle(fontWeight: FontWeight.bold),),
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
                      onPressed: (){},
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    RaisedButton(
                      child: Text("Delete"),
                      color: Colors.redAccent,
                      onPressed: (){},
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}