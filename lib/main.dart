import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController etInput = TextEditingController();

  double inputUser = 0;
  double kelvin = 0;
  double fahrenheit = 0;
  double reamur = 0;

  void konversi() {
    setState(() {
      inputUser = double.parse(etInput.text);
      reamur = 4 / 5 * inputUser;
      fahrenheit = 9 / 5 * inputUser + 32;
      kelvin = inputUser + 273;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Suhu Converter"),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: "Masukkan Nilai Suhu celcius"),
              keyboardType: TextInputType.number,
              controller: etInput,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Text(
                      "Kelvin",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      '$kelvin',
                      style: const TextStyle(fontSize: 30),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      "Fahrenheit",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      '$fahrenheit',
                      style: const TextStyle(fontSize: 30),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      "Reamur",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      '$reamur',
                      style: const TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: konversi,
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255), backgroundColor: const Color(0xFF7C0084),
                ),
                child: const Text("Konversi"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}