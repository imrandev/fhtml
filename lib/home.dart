import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/player_controller.dart';

class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeState();

}

class HomeState extends State<Home> {


  VideoPlayerController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Flutter HTML Player"),
      ),
      body: Html(
        data: "<p dir=\"ltr\" style=\"text-align: left;\">&nbsp;<video controls=\"true\"><source src=\"http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4\">http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4</video>&nbsp;<br></p>",
        videoPlayerController: (src){
          controller = VideoPlayerController.network(
            src ?? "",
          );
          return controller!;
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if (controller != null){
            controller!.pause();
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }
}