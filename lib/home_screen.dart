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
        for (int i = 0; i < firstData.length; i++) {
          //print(firstData[i]['title']);   androidList
          AndroidVerison androidVerison = AndroidVerison(
              id: firstData[i]['id'], title: firstData[i]['title']);
          androidList.add(androidVerison);
        }
      }
      //second Type random keys
      if (data[i].runtimeType != List<Map<String, Object>>) {
        final Map<String, dynamic> convertedData =
            jsonDecode(jsonEncode(data[i]));
        var map = HashMap.from(convertedData);
        // //I can fetch the data from here..
        for (int i = 0; i < map.length; i++) {
          //because the pattern is showing the keys as 0/1/3
          if (i < 2) {
            AndroidVerison androidVerison =
                AndroidVerison(id: map['$i']['id'], title: map['$i']['title']);
            androidList.add(androidVerison);
          } else {
            AndroidVerison androidVerison =
                AndroidVerison(id: map['3']['id'], title: map['3']['title']);
            androidList.add(androidVerison);
          }
        }
      }
    }
  }

  //This block of code is for finding list of items by searching...
  List<AndroidVerison> SearchList = [];
  TextEditingController? _textEditingController;
  final FocusNode _textFocusNode = FocusNode();

  void dispose() {
    _textFocusNode.dispose();
    _textEditingController?.dispose();
    super.dispose();
  }

//TODO sending data based on the button click data set one or two
  @override
  void initState() {
    _textEditingController = TextEditingController();
    //getAndroidVersions(StaticVariables.datasetOne);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Json Viewer")),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: _textEditingController,
                focusNode: _textFocusNode,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: 'Search Phones By ID',
                    contentPadding: EdgeInsets.all(17)),
                onChanged: (value) {
                  setState(() {
                    SearchList!.clear();
                  });
                  setState(() {
                    SearchList = androidList
                        .where((element) => element.id == (int.parse(value)))
                        .toList();
                  });
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            _textEditingController!.clear();
                            androidList.clear();
                            setState(() {
                              getAndroidVersions(StaticVariables.datasetOne);
                            });
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.blue),
                          child: Text(
                            "Load 1st Data Set",
                            style: TextStyle(color: Colors.white),
                          ))),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        androidList.clear();
                        _textEditingController!.clear();
                        setState(() {
                          getAndroidVersions(StaticVariables.datasetTwo);
                        });
                      },
                      style: TextButton.styleFrom(backgroundColor: Colors.blue),
                      child: Text("Load 2nd Data Set"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //crossAxisSpacing: 40,
                    crossAxisCount: 3,
                    mainAxisExtent: 50),
                itemCount: _textEditingController!.text.isNotEmpty
                    ? SearchList!
                        .length //Here is the condition for showing the search result
                    : androidList.length,
                itemBuilder: (ctx, index) {
                  return Center(
                      child: Text(
                    _textEditingController!.text.isNotEmpty
                        ? SearchList![index].title.toString()
                        : androidList[index].title.toString(),
                    style: TextStyle(fontSize: 15),
                  ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
