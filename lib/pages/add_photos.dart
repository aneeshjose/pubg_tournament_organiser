import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPhotos extends StatefulWidget {
  String photoType;
  AddPhotos(this.photoType);
  @override
  AddPhotosState createState() => new AddPhotosState();
}

class AddPhotosState extends State<AddPhotos> {
  Widget _imageContainerChild = new Container(
    width: 0.0,
    height: 0.0,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Add ${widget.photoType}"),
      ),
      body: new Center(
          child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            width: MediaQuery.of(context).size.width - 20.0,
            height: MediaQuery.of(context).size.height / 2,
            child: _imageContainerChild,
          ),
          new RaisedButton(
            child: new Text("Select image"),
            onPressed: () => _chooseImage(),
          ),
        ],
      )),
    );
  }

  _chooseImage() {
    //todo implement - select image from gallery and display it in the container
    //and update the _imageContainerChild with the new Image
  }
}
