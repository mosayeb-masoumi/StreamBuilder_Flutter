class BitcoinRepository{

  static  double bitcoinPrice = 32000;



  // for real api
 static Stream<double> getPrice() =>
     Stream.periodic(Duration(seconds: 3)).asyncMap((_) =>
         getPrices()
     );



  static Future<double> getPrices() async{

    bitcoinPrice = bitcoinPrice +100;
     // this method call every second
    return bitcoinPrice;
  }

}