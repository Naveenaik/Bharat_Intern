import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class CelsiustoFahrenheit extends StatefulWidget
{
  @override
  CtoF createState()=>CtoF();
}
class CtoF extends State<CelsiustoFahrenheit>
{
  String out="";
  //const CtoF({super.key});
  TextEditingController cel=TextEditingController();
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Celsius to Fahrenheit"),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body:
        Padding(
          padding: EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: cel,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Celsius",
                  border: OutlineInputBorder(),
                ),
                //  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              ElevatedButton(
                onPressed: () {
                },
                child: const Text(
                  'Enter',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              Text(
                //    out=cel.*9/5+32;
                out.toString(),
                style: const TextStyle(
                  fontSize: 45,
                  color: Colors.black,
                ),
              )
            ],
          ),
        )
    );
  }
}