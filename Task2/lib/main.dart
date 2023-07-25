import 'package:flutter/material.dart';
void main() => runApp(const TemperatureConverterApp());
class TemperatureConverterApp extends StatelessWidget {
  const TemperatureConverterApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Temperature Converter',
      home: TemperatureConverterScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class TemperatureConverterScreen extends StatefulWidget {
  const TemperatureConverterScreen({super.key});
  @override
  TemperatureConverterScreenState createState() =>
      TemperatureConverterScreenState();
}
class TemperatureConverterScreenState extends State<TemperatureConverterScreen> {
  double inputValue = 0;
  String fromUnit = 'Celsius';
  String toUnit = 'Fahrenheit';
  String out =" ";
  void _convertTemperature() {
    double result=0;
    if (fromUnit == 'Celsius')
    {
      if (toUnit == 'Fahrenheit')
      {
        result = (inputValue * 9 / 5) + 32;
      }
      else if (toUnit == 'Kelvin')
      {
        result = inputValue + 273.15;
      }
      else if(toUnit == 'Celsius')
        {
          result=inputValue;
        }
    }
    else if (fromUnit == 'Fahrenheit')
    {
      if (toUnit == 'Celsius')
      {
        result = (inputValue - 32) * 5 / 9;
      }
      else if (toUnit == 'Kelvin')
      {
        result = (inputValue + 459.67) * 5 / 9;
      }
      else if(toUnit == 'Fahrenheit')
        {
          result=inputValue;
        }
    }
    else if (fromUnit == 'Kelvin')
    {
      if (toUnit == 'Celsius')
      {
        result = inputValue - 273.15;
      }
      else if (toUnit == 'Fahrenheit')
      {
        result = (inputValue * 9 / 5) - 459.67;
      }
      else if(toUnit == 'Kelvin')
        {
          result=inputValue;
        }
    }
    setState(()
    {
      out = result.toStringAsFixed(2);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temperature Converter'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  inputValue = double.tryParse(value) ?? 0;
                });
              },
              decoration: const InputDecoration(labelText: 'Enter temperature'),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: fromUnit,
              onChanged: (value) {
                setState(() {
                  fromUnit = value!;
                });
              },
              items: ['Celsius', 'Fahrenheit', 'Kelvin'].map((unit) => DropdownMenuItem(
                value: unit,
                child: Text(unit),
              ))
                  .toList(),
              decoration: const InputDecoration(labelText: 'From'),
            ),
            DropdownButtonFormField<String>(
              value: toUnit,
              onChanged: (value) {
                setState(() {
                  toUnit = value!;
                });
              },
              items: ['Celsius', 'Fahrenheit', 'Kelvin']
                  .map((unit) => DropdownMenuItem(
                value: unit,
                child: Text(unit),
              ))
                  .toList(),
              decoration: const InputDecoration(labelText: 'To'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertTemperature,
              child: const Text('Convert'),
            ),
            const SizedBox(height: 20),
            Text(
              'Result: $out $toUnit',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}
