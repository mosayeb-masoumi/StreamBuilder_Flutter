import 'package:flutter/material.dart';
import 'package:stream_builder_flutter/repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  //https://www.youtube.com/watch?v=g8Y1Eqa4pbc

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Stream<String?> numberStream;

  @override
  void initState() {
    super.initState();
    numberStream = MyRepository().getNumbers();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 200,
              ),

              // text
              StreamBuilder<String?>(
                  stream: numberStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.none) {
                      return Text("stream is null");
                    } else if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("waiting ...");
                    } else if (snapshot.hasData) {
                      String data = snapshot.data!;
                      return Text(data);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else {
                      return Text("null returned");
                    }
                  }),

              SizedBox(
                height: 50,
              ),

              // button
              RaisedButton(
                  child: Text("get data from server"),
                  onPressed: () {
                    setState(() {
                      numberStream = MyRepository().getNumbers();
                    });
                  })
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              numberStream = MyRepository().getNumbers();
            });
          }),
    );
  }
}
