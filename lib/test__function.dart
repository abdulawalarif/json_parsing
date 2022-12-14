import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  MyOrders1 createState() => MyOrders1();
}

class MyOrders1 extends State<Orders> {
  final FocusNode _textFocusNode = FocusNode();
  TextEditingController? _textEditingController;
  List<FruitModel> glossarListOnSearch = [];
  List<FruitModel> glossarList = [];

  void dispose() {
    _textFocusNode.dispose();
    _textEditingController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _textEditingController = TextEditingController();
    glossarList.add(FruitModel(id: 0, name: 'Apple', facts: 'Good for health'));
    glossarList.add(
        FruitModel(id: 1, name: 'Banana', facts: 'Banana is also for health'));
    glossarList.add(
        FruitModel(id: 2, name: 'Orange', facts: 'Orange good for health'));
    glossarList
        .add(FruitModel(id: 3, name: 'Apple', facts: 'Orange good for health'));
    glossarList.add(
        FruitModel(id: 4, name: 'Dragon', facts: 'Orange good for health'));
    glossarList.add(FruitModel(
        id: 5, name: 'Name na jana', facts: 'Orange good for health'));
    glossarList
        .add(FruitModel(id: 6, name: 'Ela', facts: 'Orange good for health'));
    glossarList.add(
        FruitModel(id: 7, name: 'Zarar bal', facts: 'Orange good for health'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Orders'),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20)),
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
                    glossarListOnSearch.clear();
                  });
                  setState(() {
                    glossarListOnSearch = glossarList
                        .where((element) => element.id == (int.parse(value)))
                        .toList();
                  });
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 40,
                  crossAxisCount: 4,
                ),
                shrinkWrap: true,
                itemCount: _textEditingController!.text.isNotEmpty
                    ? glossarListOnSearch!
                        .length //Here is the condition for showing the search result
                    : glossarList.length,
                itemBuilder: (ctx, index) {
                  return Center(
                      child: Text(
                    _textEditingController!.text.isNotEmpty
                        ? glossarListOnSearch[index].name.toString()
                        : glossarList[index].name.toString(),
                    style: TextStyle(fontSize: 14),
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

class FruitModel {
  int? id;
  String? name;
  String? facts;
  FruitModel({this.id, this.name, this.facts});
}
