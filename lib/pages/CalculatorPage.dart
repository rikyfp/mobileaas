import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/homePage.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  int number = 0;
  int cal = 0;
  String cals = '0';
  String cals2 = '0';
  int adds = 0;
  int hitung1 = 0;
  int hitung2 = 0;
  String operator_mat = '';

  void hitung() {
    print('cek nilai = ');
    print(number);
    setState(() {
      number++;
    });
  }

  void hitung_cal(int v) {
  adds = v;
  setState(() {
    if (cals != '0') {
      cals += '$adds';
    } else {
      cals = '$adds';
    }
    if (operator_mat == '+') {
      if (cals2.isEmpty) {
        cals2 = '$adds'; 
      } else {
        cals2 += '$adds'; 
      }
    } else {

      if (cals.isNotEmpty && operator_mat.isEmpty) {
        hitung1 = int.tryParse(cals) ?? 0; 
      }
    }
  });
}


  void tambah_cal() {
    if (operator_mat == '') {
      operator_mat = '+';
      setState(() {
        cals = cals + '+';
      });
    }
  }

  void bagi_cal() {
    if (operator_mat == '') {
      operator_mat = '/';
      setState(() {
        cals = cals + '/';
      });
    }
  }

  void kurang_cal() {
    if (operator_mat == '') {
      operator_mat = '-';
      setState(() {
        cals = cals + '-';
      });
    }
  }

  void kali_cal() {
    if (operator_mat == '') {
      operator_mat = '*';
      setState(() {
        cals = cals + '*';
      });
    }
  }

  int hasil = 0;

 void hasil_cal() {

  if (cals.contains('+')) {
    List<String> parts = cals.split('+');
    hasil = int.parse(parts[0]) + int.parse(parts[1]);
  } 

  else if (cals.contains('-')) {
    List<String> parts = cals.split('-');
    hasil = int.parse(parts[0]) - int.parse(parts[1]);
  } 

  else if (cals.contains('*')) {
    List<String> parts = cals.split('*');
    hasil = int.parse(parts[0]) * int.parse(parts[1]);
  } 

  else if (cals.contains('/')) {
    List<String> parts = cals.split('/');
    int divisor = int.parse(parts[1]);
    if (divisor != 0) {
      hasil = int.parse(parts[0]) ~/ divisor; 
    } else {
      hasil = 0;
    }
  }

  setState(() {
    cals = '$hasil';
  });
}



  void clear_cal() {
    setState(() {
      cal = 0;
      cals = '0';
      cals2 = '0';
      adds = 0;
      hitung1 = 0;
      hitung2 = 0;
      operator_mat = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: clear_cal,
          tooltip: 'Clear',
          child: Text('C'),
        ),
        appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Homepage()),
                );
              },
            ),
            Spacer(),
            Text(
              'Aplikasi Kalkulator',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),
              ),
              Spacer()
          ],
        ),
      ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              cals,
              style: TextStyle(
                fontSize: 44,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          hitung_cal(1);
                        },
                        child: Text('1'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          hitung_cal(2);
                        },
                        child: Text('2'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          hitung_cal(3);
                        },
                        child: Text('3'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: tambah_cal,
                        child: Text('+'),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          hitung_cal(4);
                        },
                        child: Text('4'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          hitung_cal(5);
                        },
                        child: Text('5'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          hitung_cal(6);
                        },
                        child: Text('6'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: kurang_cal,
                        child: Text('-'),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          hitung_cal(7);
                        },
                        child: Text('7'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          hitung_cal(8);
                        },
                        child: Text('8'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          hitung_cal(9);
                        },
                        child: Text('9'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: kali_cal,
                        child: Text('*'),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          hitung_cal(0);
                        },
                        child: Text('0'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: hasil_cal,
                        child: Text('='),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: clear_cal,
                        child: Text('C'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: bagi_cal,
                        child: Text('/'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
