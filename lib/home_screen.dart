import 'dart:collection';
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

  //TODO Working code
  //if data _InternalLinkedHashMap<>..... iterating over the indexes lengths then...
  //TODO first checking from the data set is it _inter.. or Lis<Map<>>..
  // then based on the type taking action ..
  //and making separate list of objects for both data type

  //TODO now this block of code will be inside if condition
  // final Map<String, dynamic> convertedData =
  //     jsonDecode(jsonEncode(StaticVariables.datasetOne[0]));
  // var map = HashMap.from(convertedData);
  // //I can fetch the data from here..
  // //print(map['0']['title']);
  // for (int i = 0; i < map.length; i++) {
  //   //because the pattern is showing the keys as 0/1/3
  //   if (i < 2) {
  //     print(map['$i']['title']);
  //   } else {
  //     print(map['3']['title']);
  //   }
  // }
  //TODO Working code first Section

  //TODO Working code Second Section
  // var data = StaticVariables.datasetOne[1] as List;
  // for (int i = 0; i < data.length; i++) {
  // print(data[i]['title']);
  // }
  // TODO Working code Second Section

  Future<List<AndroidVerison>> getAndroidVersions(var data) async {
    //print(data[0].runtimeType.toString());
    for (int i = 0; i < data.length; i++) {
      //first type
      if (data[i].runtimeType == List<Map<String, Object>>) {
        var firstData = data[i] as List;
        print("Data 1:");
        for (int i = 0; i < firstData.length; i++) {
          print(firstData[i]['title']);
        }
      }
      //second Type
      if (data[i].runtimeType != List<Map<String, Object>>) {
        print("Data 0:");
        final Map<String, dynamic> convertedData =
            jsonDecode(jsonEncode(data[i]));
        var map = HashMap.from(convertedData);
        // //I can fetch the data from here..
        // //print(map['0']['title']);
        for (int i = 0; i < map.length; i++) {
          //   //because the pattern is showing the keys as 0/1/3
          if (i < 2) {
            print(map['$i']['title']);
          } else {
            print(map['3']['title']);
          }
        }
      }
    }

    return androidListWithRandomKeys;
  }

  @override
  void initState() {
    getAndroidVersions(StaticVariables.datasetOne);
    super.initState();
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
                future: getAndroidVersions(StaticVariables.datasetOne),
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
