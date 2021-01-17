import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_app/politicslist.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Page',
      home: DefaultTabController(
        length: 3,
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Список российских политиков"),
              centerTitle: true,
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(icon: Icon(Icons.assignment)),
                  Tab(icon: Icon(Icons.assignment_ind)),
                  Tab(icon: Icon(Icons.favorite)),
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                ByPartyPage(),
                ByNamePage(),
                MyLikedPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ByNamePage extends StatefulWidget {
  @override
  _ByNamePageState createState() => _ByNamePageState();
}

class _ByNamePageState extends State<ByNamePage> {
  Future<List<Politic>> politicsList;

  @override
  void initState() {
    super.initState();
    politicsList = getPoliticsList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Politic>>(
      future: politicsList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Politic> list = snapshot.data;
          list.sort((a, b) => a.name.compareTo(b.name));
          return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Card(
                  child: RaisedButton(
                    onPressed: () {
                      // Route route = MaterialPageRoute(
                      //     builder: (context) => PageMoreInfo());
                      // Navigator.push(context, route);
                    },
                    color: Colors.white,
                    child: ListTile(
                      title: Text('${list[index].name}'),
                      subtitle: Text('Партия: ${list[index].party}'),
                      leading: Icon(Icons.person, color: Colors.black),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      // Text('${snapshot.data.politics[index].district}'),
                    ),
                  ),
                );
              });
        } else if (snapshot.hasError) {
          return Text('Error');
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

class ByPartyPage extends StatefulWidget {
  @override
  _ByPartyPageState createState() => _ByPartyPageState();
}

class _ByPartyPageState extends State<ByPartyPage> {
  Future<List<Party>> partiesList;
  Future<List<Politic>> politicsList;

  @override
  void initState() {
    super.initState();
    partiesList = getPartiesList();
    politicsList = getPoliticsList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Party>>(
      future: partiesList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Party> partiesList = snapshot.data;
          // partiesList.sort((a, b) => a.name.compareTo(b.name));
          return ListView.builder(
              itemCount: partiesList.length,
              itemBuilder: (context, index) {
                return Column(children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        '${partiesList[index].name}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )),
                  Text("Здесь будет список")
                ]);
                // : Card(
                //     child: (RaisedButton(
                //     onPressed: () {
                //       Route route = MaterialPageRoute(
                //           builder: (context) => PageMoreInfo());
                //       Navigator.push(context, route);
                //     },
                //     color: Colors.white,
                //     child: ListTile(
                //       title: Text('${snapshot.data[index].name}'),
                //       subtitle:
                //           Text('Регион: ${snapshot.data[index].district}'),
                //       leading: Icon(Icons.person, color: Colors.black),
                //       trailing: Icon(Icons.keyboard_arrow_right),
                //       // Text('${snapshot.data.politics[index].district}'),
                //     ),
                //   )));
              });
        } else if (snapshot.hasError) {
          return Text('Error');
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

class MyLikedPage extends StatefulWidget {
  @override
  _MyLikedPageState createState() => _MyLikedPageState();
}

class _MyLikedPageState extends State<MyLikedPage> {
  Future<List<Politic>> politicsList;

  @override
  void initState() {
    super.initState();
    politicsList = getPoliticsList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Politic>>(
      future: politicsList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: RaisedButton(
                    onPressed: () {
                      // Route route = MaterialPageRoute(
                      //     builder: (context) => PageMoreInfo());
                      // Navigator.push(context, route);
                    },
                    color: Colors.white,
                    child: ListTile(
                      title: Text('${snapshot.data[index].name}'),
                      subtitle: Text('Партия: ${snapshot.data[index].party}'),
                      leading: Icon(Icons.person, color: Colors.black),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      // Text('${snapshot.data.politics[index].district}'),
                    ),
                  ),
                );
              });
        } else if (snapshot.hasError) {
          return Text('Error');
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

// Widget _myListView() {
//   final List<ListItem> items = List<ListItem>.generate(
//       100,
//       (i) =>
//           i % 6 == 0 ? HeadingItem('Партия') : MessageItem('ФИО', 'Должность'));

//   return ListView.builder(
//     itemCount: items.length,
//     itemBuilder: (context, index) {
//       final item = items[index];

//       if (item is HeadingItem) {
//         return ListTile(
//           title: Text(
//             item.heading,
//           ),
//         );
//       } else if (item is MessageItem)
//         return Card(
//           child: RaisedButton(
//             onPressed: () {
//               Route route =
//                   MaterialPageRoute(builder: (context) => PageMoreInfo());
//               Navigator.push(context, route);
//             },
//             color: Colors.white,
//             child: ListTile(
//               title: Text(item.sender),
//               subtitle: Text(item.body),
//               leading: Icon(Icons.person, color: Colors.black),
//               trailing: Icon(Icons.keyboard_arrow_right),
//             ),
//           ),
//         );
//       return null;
//     },
//   );
// }

// abstract class ListItem {}

// class HeadingItem implements ListItem {
//   final String heading;
//   HeadingItem(this.heading);
// }

// class MessageItem implements ListItem {
//   final String sender;
//   final String body;

//   MessageItem(this.sender, this.body);
// }

class PageMoreInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Информация о политике'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Icon(
              Icons.person,
              color: Colors.black,
              size: 300,
            ),
            Text(
              'ФИО',
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 20,
              ),
            ),
            Text(
              'Биография',
              style: TextStyle(color: Colors.black),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Go back"),
            ),
          ],
        ),
      ),
    );
  }
}
