import 'package:flutter/material.dart';
import 'dart:convert';
import 'study_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amercia Civics',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue
      ),
      home: MyHomePage(title: 'U.S. Citizenship Civic tests'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<StudyCard>> fetchCardsData(context) async {
    String data = await DefaultAssetBundle.of(context).loadString("assets/data.json");
    var jsonData = json.decode(data) as List;
    return jsonData.map((json) => StudyCard.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<List<StudyCard>>(
            future: fetchCardsData(context),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                return _buildCardsListView(snapshot.data);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }
        ),
      )
    );
  }

  Widget _buildCardsListView(List<StudyCard> cards) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: cards.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
            child: Padding(
                padding: EdgeInsets.only(top: 16.0, left: 6.0, right: 6.0, bottom: 6.0),
                child: ExpansionTile(
                    title: Text(cards[index].question),
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.30,
                          child: ListView.builder(
                            itemCount: cards[index].answers.length,
                            itemBuilder: (BuildContext build, int answerIndex) {
                              return ListTile(
                                leading: Icon(Icons.check),
                                title: Text(cards[index].answers[answerIndex]),
                              );
                            },
                          )
                      )
                    ]
                )
            )
        );
      },
    );
  }
}
