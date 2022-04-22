
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stream_builder_flutter/widget/bitcoin_wiget.dart';

class PeriodicStreamByClick extends StatefulWidget {
  const PeriodicStreamByClick({Key? key}) : super(key: key);

  @override
  _PeriodicStreamByClickState createState() => _PeriodicStreamByClickState();
}

class _PeriodicStreamByClickState extends State<PeriodicStreamByClick> {

  double bitcoinPrice = 32000;

  // for click button
  final controller = StreamController<double>();

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<double>(
        initialData: bitcoinPrice,
        // stream: getBitcoinPrice(),
        stream: controller.stream,
        builder: (context, snapshot) {
          final bitcoins = snapshot.data?.toStringAsFixed(2);

          return Center(
              child: Column(
                children: [
                  BitcoinWidget(bitcoins: bitcoins),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                      child: Text("get bitcoin"),
                      onPressed: () {
                        bitcoinPrice = bitcoinPrice + 50;
                        controller.sink.add(bitcoinPrice);
                      })
                ],
              ));
        },
      ),
    );
  }

  Stream<double> getBitcoinPrice() => Stream<double>.periodic(
    Duration(seconds: 1),
        (count) => bitcoinPrice + count * 5,
  );
}
