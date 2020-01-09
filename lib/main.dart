import 'package:flutter/material.dart';
import 'package:training/routes/mahasiswa_routes.dart';
import './views/profil.dart';
import './views/add_data.dart';

void main() => runApp(new MaterialApp(
      title: "Aplikasiku !",
      home: new Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Mahasiswa mhs = Mahasiswa();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Aplikasiku !"),
      ),
      // Untuk add data baru
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=> Navigator.of(context).push(
          new MaterialPageRoute(
            builder: (BuildContext context)=>new AddData(),
          )
        ),
      ),
      body: new FutureBuilder<List>(
        future: mhs.getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: EdgeInsets.all(10),
          child: new GestureDetector(
            // Navigasi pindah page
            onTap: ()=> Navigator.of(context).push(
              new MaterialPageRoute(
                builder: (BuildContext context) => new Profil(list: list, idx: i)
              )
            ),
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['nama']),
                leading: new Icon(Icons.people),
                subtitle: new Text("NIM :${list[i]['nim']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}
