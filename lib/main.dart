import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() {
    return MyAppState();
  }
}


class MyAppState extends State<MyApp> {
  final textEditController = TextEditingController();
  String _nama = "";
  String pilihanTanggal = "pertama";
  String pilihanTanggalOut = "";

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> tanggal = [];
    var itm1 = const DropdownMenuItem<String>(
      value: "pertama",
      child: Text("1 Januari 2023"),
    );
    var itm2 = const DropdownMenuItem<String>(
      value: "kedua",
      child: Text("2 Januari 2023"),
    );
    tanggal.add(itm1);
    tanggal.add(itm2);

    return MaterialApp(
      title: 'Hello App',
      home: Scaffold(
        appBar: AppBar(
            leading: FlutterLogo(),
            backgroundColor: Colors.blueGrey,
            title: Text('Quiz Flutter'),
            actions: <Widget>[ButtonNamaKelompok(), ButtonPerjanjian()]),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DropdownButton(
                  value: pilihanTanggal,
                  items: tanggal,
                  onChanged: (String? newValue) {
                    setState(() {
                      if (newValue != null) {
                        pilihanTanggal = newValue;
                      }
                    });
                  },
                ),
                Container(
                    padding: const EdgeInsets.all(25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(children: const [Text("10 km"), Text("20 jam, 30 menit")]),
                        Column(children: const [Text("20 km"), Text("40 jam, 20 menit")]),
                        Column(children: const [Text("2 km"), Text("2 jam")])
                      ],
                    )),
              ],
            )), //column center
      ), //Scaffold
    ); //Material APP
  }
}


class ButtonNamaKelompok extends StatelessWidget {
  const ButtonNamaKelompok({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.account_circle_rounded),
      onPressed: () {
        // icon account di tap
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Kelompok 18'),
            content: const Text('Muhamad Fikri Nur Bakhtiar (fikribakhtiar62@upi.edu) ; Ellsya Nabella Nurallifa (ellsyanabella13@upi.edu)'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}


class ButtonPerjanjian extends StatelessWidget {
  const ButtonPerjanjian({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.access_alarm_rounded),
      onPressed: () {
        // icon setting ditap
        const snackBar = SnackBar(
          duration: Duration(seconds: 20),
          content: Text('Kami berjanji  tidak akan berbuat curang dan atau membantu kelompok lain berbuat curang'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}



