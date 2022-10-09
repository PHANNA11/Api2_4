import 'package:apis_fetch/controller/json_placeholder_controller.dart';
import 'package:apis_fetch/model/photos_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PhotosScreen extends StatefulWidget {
  const PhotosScreen({Key? key}) : super(key: key);

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  List<Photos> photosList = [];
  getPhotosMethod() async {
    await jsonplaceholderController().getPhotosController().then((value) {
      setState(() {
        photosList = value;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPhotosMethod();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Fetch Photos",
          style: TextStyle(fontFamily: "Lopster", fontSize: 35),
        ),
      ),
      body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          children: List.generate(
              photosList.length, (index) => PhotosWidget(photosList[index]))),
    );
  }

  Widget PhotosWidget(Photos photos) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(4),
          height: 200,
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueAccent,
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(photos.url))),
        ),
        Positioned(
          child: Container(
            margin: const EdgeInsets.all(4),
            height: 40,
            decoration: const BoxDecoration(
              //color: Colors.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Text(
              photos.title,
            ),
          ),
        ),
      ],
    );
  }
}
