import 'package:crypto_tracker/conversion.dart';
import 'package:crypto_tracker/price_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {

final String chosenCurrency;
const LoadingScreen({Key? key, required this.chosenCurrency}) : super(key: key,);
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  Future<void> getCurrencyData() async {

    try{
    var cryptoCurrExchList = await Conversion(widget.chosenCurrency).getdata();
    if(!mounted)return;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
       PriceScreen(cryptoCurrExchList)
       )
       );
       
    }
    catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getCurrencyData();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child:  Scaffold(
        // body: Container(),
        body: Center(
            child: 
             SpinKitCircle(
              duration: Duration( seconds: 2),
          color: Colors.deepOrange,
          size: 100,
          
        )
        ),
      ),
    );
  }
}
