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
  List<AndroidVerison> androidListWithRandomKeys = [];
  List<AndroidVerison> androidList = [];
  getAndroidVersions(var data) {
    for (int i = 0; i < data.length; i++) {
      //first type
      if (data[i].runtimeType == List<Map<String, Object>>) {
        var firstData = data[i] as List;
        androidList.clear();
        for (int i = 0; i < firstData.length; i++) {
          //print(firstData[i]['title']);   androidList
          AndroidVerison androidVerison = AndroidVerison(
              id: firstData[i]['id'], title: firstData[i]['title']);
          androidList.add(androidVerison);
        }
      }
      //second Type random keys
      if (data[i].runtimeType != List<Map<String, Object>>) {
        androidListWithRandomKeys.clear();
        final Map<String, dynamic> convertedData =
            jsonDecode(jsonEncode(data[i]));
        var map = HashMap.from(convertedData);
        // //I can fetch the data from here..
        for (int i = 0; i < map.length; i++) {
          //because the pattern is showing the keys as 0/1/3
          if (i < 2) {
            AndroidVerison androidVerison =
                AndroidVerison(id: map['$i']['id'], title: map['$i']['title']);
            androidListWithRandomKeys.add(androidVerison);
          } else {
            AndroidVerison androidVerison =
                AndroidVerison(id: map['3']['id'], title: map['3']['title']);
            androidListWithRandomKeys.add(androidVerison);
          }
        }
      }
    }
  }

//TODO sending data based on the button click data set one or two
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 20,
                width: MediaQuery.of(context).size.width,
                child: gridData(androidListWithRandomKeys),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 20,
                width: MediaQuery.of(context).size.width,
                child: gridData(androidList),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget gridData(var data) {
    int countOfItem = 3;
    if (data.length >= 3) {
      setState(() {
        countOfItem = 4;
      });
    }
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 50,
          crossAxisCount: countOfItem,
        ),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return GridTile(
              child: Text(
            data[index].title,
            style: TextStyle(color: Colors.black, fontSize: 14),
          ));
        });
  }
}
