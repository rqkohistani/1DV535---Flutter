import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final List<String> _list = [];
  final TextEditingController _controller = TextEditingController();
  final FocusNode myFocusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Add item to the TODO list'),
          ),
        ),
        body: SafeArea(
          child: Container(
            color: const Color.fromARGB(255, 220, 225, 228),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: _list.length,
                      padding:
                          const EdgeInsets.only(bottom: 60.0), // Add this line
                      itemBuilder: (context, index) {
                        return Container(
                          color: index.isOdd
                              ? Colors.green[100]
                              : Colors.blue[100],
                          child: ListTile(
                            title: Text(_list[index]),
                            onTap: () {
                              _controller.text = _list[index]
                                  .substring(_list[index].indexOf(' ') + 1);
                              _list.removeAt(index);
                              setState(() {});
                              FocusScope.of(context).requestFocus(myFocusNode);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          focusNode: myFocusNode,
                          controller: _controller,
                          decoration:
                              const InputDecoration(hintText: 'Add item'),
                          onSubmitted: (value) {
                            _list.add("${_list.length + 1}. $value");
                            _controller.clear();
                            setState(() {
                              _scrollToBottom();
                            });
                            FocusScope.of(context).requestFocus(myFocusNode);
                          },
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          _list.add("${_list.length + 1}. ${_controller.text}");
                          _controller.clear();
                          setState(() {
                            _scrollToBottom();
                          });
                          FocusScope.of(context).requestFocus(myFocusNode);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        //Footer
        bottomNavigationBar: const BottomAppBar(
          color: Colors.blue,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Assignment 2',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    _controller.dispose();
    _scrollController.dispose();

    super.dispose();
  }
}
