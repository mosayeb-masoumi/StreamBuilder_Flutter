
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stream_builder_flutter/stream_periodically_call_server/bitcoin_repository.dart';
import 'package:stream_builder_flutter/widget/bitcoin_wiget.dart';

class PeriodicStreamServer extends StatefulWidget {
  const PeriodicStreamServer({Key? key}) : super(key: key);

  @override
  _PeriodicStreamServerState createState() => _PeriodicStreamServerState();
}

class _PeriodicStreamServerState extends State<PeriodicStreamServer> {

  double bitcoinPrice = 32000;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<double>(
        initialData: bitcoinPrice,
        stream: BitcoinRepository.getPrice(),
        builder: (context, snapshot) {

          switch (snapshot.connectionState){
            case ConnectionState.waiting:
              return Center(child: Text("waiting..."));
            default:
              if(snapshot.hasError){
                return Center(child: Text("error..."));
              }else{
                final bitcoins = snapshot.data!.toStringAsFixed(2);
                return Center(child: BitcoinWidget(bitcoins: bitcoins));
              }
          }

        },
      ),
    );
  }

  // Stream<double> getBitcoinPrice() => Stream<double>.periodic(
  //   Duration(seconds: 1),
  //       (count) => bitcoinPrice + count * 5,
  // );
}
