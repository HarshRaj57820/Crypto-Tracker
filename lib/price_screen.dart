import 'package:crypto_tracker/conversion.dart';
import 'package:crypto_tracker/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'coin_data.dart';

String chosenCurrency = 'USD';

Conversion conversion = Conversion(chosenCurrency);

class PriceScreen extends StatefulWidget {
 final cryptoCurrExchList;

 const PriceScreen(this.cryptoCurrExchList, {Key? key}) : super(key : key);

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  List<DropdownMenuItem<String>> getDropDownMenuItem(){
    return currenciesList.map((currName) => DropdownMenuItem(
      value: currName,
      child: Text(currName))).toList();
  }

  @override
  void initState() {
    super.initState();
    getConversion(chosenCurrency, widget.cryptoCurrExchList);
    
  }

  List<Widget> cardItems = [];
  List<Widget> getConversion(String chosenCurrency, List<String> cryptoCurrExchList) {

    int id = 0;
    cardItems.clear();
    for (var selectedCrypto in cryptoList) {

      var newCard = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Card(
          color: Colors.amber[400],
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
            child: Text(
              '1 $selectedCrypto = ${cryptoCurrExchList[id]} $chosenCurrency',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
      id++;
      cardItems.add(newCard);
    }
    return cardItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('💰💰 Coin Ticker',
        style: TextStyle(color: Colors.brown),
        ),
        backgroundColor: Colors.deepPurple[100]
      ),
      body: Container(
        color: Colors.green[50],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            
            Align(
              heightFactor: 1.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: 
                  getConversion(chosenCurrency, widget.cryptoCurrExchList)
              ),
            ),
        
            Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 30.0),
              color: Colors.amber[400],
              child: DropdownButton(
                iconEnabledColor: Colors.white,
                items: getDropDownMenuItem(),
                dropdownColor: Colors.amber[400],
                style: const TextStyle(
                  color:  Colors.white,
                  fontWeight: FontWeight.bold, 
                  fontSize: 18
        
                  ),
                value: chosenCurrency,
                onChanged: (value) {
                  setState(() {
                    chosenCurrency = value!;
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoadingScreen(chosenCurrency: chosenCurrency)));
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

