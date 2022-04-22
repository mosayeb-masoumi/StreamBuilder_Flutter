import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stream_builder_flutter/widget/bitcoin_wiget.dart';

class PeriodicStreamPage extends StatefulWidget {
  //https://www.youtube.com/watch?v=hiyFKdiQyNE

  const PeriodicStreamPage({Key? key}) : super(key: key);

  @override
  _PeriodicStreamPageState createState() => _PeriodicStreamPageState();
}

class _PeriodicStreamPageState extends State<PeriodicStreamPage> {
  double bitcoinPrice = 32000;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<double>(
        initialData: bitcoinPrice,
        stream: getBitcoinPrice(),
        builder: (context, snapshot) {
          final bitcoins = snapshot.data?.toStringAsFixed(2);

          return Center(
              child: Column(
            children: [
              BitcoinWidget(bitcoins: bitcoins),
              SizedBox(
                height: 20,
              ),
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
