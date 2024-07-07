import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: entry_obat(),
  ));
}

class entry_obat extends StatefulWidget {
  @override
  State<entry_obat> createState() => _entry_obatState();
}

class _entry_obatState extends State<entry_obat> {
  TextEditingController xkode_obat = TextEditingController();
  TextEditingController xnama_obat = TextEditingController();
  TextEditingController xsatuan_obat = TextEditingController();
  TextEditingController xjumlah_obat = TextEditingController();
  TextEditingController xharga_obat = TextEditingController();

  Future<void> simpan_dataobat() async {
    String url = "http://192.168.177.195/simpanobat.php";
    try {
      final respon = await http.post(Uri.parse(url), body: {
        'xkode_obat': xkode_obat.text,
        'xnama_obat': xnama_obat.text,
        'xsatuan_obat': xsatuan_obat.text,
        'xjumlah_obat': xjumlah_obat.text,
        'xharga_obat': xharga_obat.text,
      });
      if (respon.statusCode == 200) {
        print('Simpan Berhasil!');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 184, 184, 184),
          title: Text('INPUT DATA OBAT'),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              color: Color.fromARGB(255, 184, 184, 184),
              child: TextField(
                controller: xkode_obat,
                decoration: InputDecoration(
                    label: Text('masukkan kode obat'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              color: Color.fromARGB(255, 184, 184, 184),
              child: TextField(
                controller: xnama_obat,
                decoration: InputDecoration(
                    label: Text('masukkan nama obat'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              color: Color.fromARGB(255, 184, 184, 184),
              child: TextField(
                controller: xsatuan_obat,
                decoration: InputDecoration(
                    label: Text('masukkan satuan obat'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              color: Color.fromARGB(255, 184, 184, 184),
              child: TextField(
                controller: xjumlah_obat,
                decoration: InputDecoration(
                    label: Text('masukkan jumlah obat'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              color: Color.fromARGB(255, 184, 184, 184),
              child: TextField(
                controller: xharga_obat,
                decoration: InputDecoration(
                    label: Text('masukkan harga obat'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  simpan_dataobat();
                },
                child: Text(
                  'SIMPAN',
                  style: TextStyle(
                    color: Color.fromARGB(255, 66, 66, 66),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
