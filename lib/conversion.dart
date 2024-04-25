import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'network.dart';
import 'coin_data.dart';

class Conversion {
  Conversion(this.chosenCurrency);

  String chosenCurrency;

  Future<List> getdata() async {
    List<String> cryptoCurrExchList = [];

    for (String selectedCrypto in cryptoList) {
      Network network = Network(
          '${dotenv.env["exchangeRateUrl"]}/$selectedCrypto/$chosenCurrency?apikey=${dotenv.env["apiKey"]}');
      var conversionResponse = await network.getAPIData();
      var cryptoCurrExchRate = conversionResponse['rate'].toString();
      // cryptoCurrExchRate = cryptoCurrExchRate.toString();

      cryptoCurrExchList.add(cryptoCurrExchRate);
    }
    return cryptoCurrExchList;
  }
}

