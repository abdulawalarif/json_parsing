import 'dart:convert';

import 'package:flutter/material.dart';

import 'constants.dart';
import 'model/android_version.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<AndroidVerison> androidListWithRandomKeys = [];
  List<AndroidVerison> androidList = [];

  Future<List<AndroidVerison>> getAndroidVersions() async {
    // print(StaticVariables.datasetOne);
    //
    // for (Map i in StaticVariables.datasetOne) {}

    return androidListWithRandomKeys;
  }

  @override
  void initState() {
    getAndroidVersions();
    super.initState();
    //print(StaticVariables.datasetOne[0]);
    var data = jsonEncode(StaticVariables.datasetOne[0]);
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Json Viewer"), actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: () {
            // TODO on the click of search icon it will become input text widget and search
          },
        ),
      ]),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getAndroidVersions(),
                builder:
                    (context, AsyncSnapshot<List<AndroidVerison>> snapshot) {
                  return ListView.builder(
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('Ids'),
                          subtitle: Text("SOme"),
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }
}
