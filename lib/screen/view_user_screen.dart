import 'package:apis_fetch/controller/json_placeholder_controller.dart';
import 'package:apis_fetch/model/users_model.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Users> listUser = [];
  getUserMethod() async {
    await jsonplaceholderController().getUserController().then((value) {
      listUser = value;
      for (var temp in listUser) {
        print(temp.name);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserMethod();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
          itemCount: listUser.length,
          itemBuilder: (context, index) {
            var user = listUser[index];
            return Card(
              elevation: 0,
              color: Color.fromARGB(255, 212, 225, 249),
              child: ListTile(
                title: Text(user.name),
                subtitle: Text(user.address.city),
              ),
            );
          },
        ));
  }
}
