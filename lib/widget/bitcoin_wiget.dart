
import 'package:flutter/material.dart';

class BitcoinWidget extends StatelessWidget {

  final String? bitcoins;
  const BitcoinWidget({Key? key, required this.bitcoins}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(

        child: Container(

          child:  Column(
            children: [

              SizedBox(height: 100,),

               Text(
                  bitcoins!,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                  ),
                ),
            ],
          ),
        ));
  }
}
