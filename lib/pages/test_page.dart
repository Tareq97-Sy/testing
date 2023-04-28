import 'package:flutter/material.dart';
import 'package:flutter_application_1/component.dart';
import 'package:flutter_application_1/pages/scroll.dart';
import 'package:flutter_application_1/sample_widget.dart';

class TestPage extends StatefulWidget {
  TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  late List<String> items;
  late List<String> components;
  late int _lastIndex;
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    _lastIndex = 0;
    items = [
      'item1',
      'item2',
      'item3',
      'item4',
      'item5',
      'item6',
      'item7',
      'item8',
      'item9',
      'item10',
    ];
    components = [
      'item1',
      'item2',
      'item3',
      'item4',
      'item5',
      'item6',
      'item7',
      'item8',
      'item9',
      'item10',
    ];
    super.initState();
  }

  void _scrollRight() {
    _controller.animateTo(
      _controller.position.maxScrollExtent,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  void _scrollLeft() {
    _controller.animateTo(
      _controller.position.minScrollExtent,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: buildDrawer(),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
            child: Row(
          children: [
            Expanded(
                child: IconButton(
                    onPressed: () {
                      _scrollLeft();
                    },
                    icon: Icon(Icons.arrow_circle_left_outlined))),
            Expanded(
              flex: 4,
              child: ScrollConfiguration(
                behavior: MyCustomScrollBehavior(),
                child: ListView.separated(
                    controller: _controller,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      if (_lastIndex == items.length - 1) {
                        return SampleWidget(text: items[_lastIndex]);
                      }
                      return SampleWidget(text: items[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(),
                    itemCount: items.length),
              ),
            ),
            Expanded(
              child: IconButton(
                  onPressed: () {
                    _scrollRight();
                  },
                  icon: Icon(Icons.arrow_circle_right)),
            ),
          ],
        )),
        Expanded(
            flex: 4,
            child: ListView.builder(
              itemBuilder: (context , index){
              
              }) 
            )
      ]),
    );
  }

  List<Widget> buildComponents(List<String> components) {
    return components.map((component) =>  Component(component: component,)).toList();
  }

  Drawer buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('John Doe'),
            accountEmail: Text('johndoe@example.com'),
            currentAccountPicture: CircleAvatar(
              child: Text('JD'),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: 10,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item $index'),
                  onTap: () {
                    // Do something when the item is tapped
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
