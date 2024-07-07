import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class form_editobat extends StatefulWidget {
  final Map obatListData;

  const form_editobat(obatdata,
      {super.key,
      required this.obatListData,
      required Map<String, dynamic> listObatData});

  @override
  State<form_editobat> createState() => _form_editobatState();
}

class _form_editobatState extends State<form_editobat> {
  TextEditingController xkode_obatedit = TextEditingController();
  TextEditingController xnama_obatedit = TextEditingController();
  TextEditingController xsatuan_obatedit = TextEditingController();
  TextEditingController xjumlah_obatedit = TextEditingController();
  TextEditingController xharga_obatedit = TextEditingController();

  Future<void> update_dataobat() async {
    String url = "http://192.168.177.195/updateobat.php";
    try {
      final respon = await http.post(Uri.parse(url), body: {
        'xkode_obat': xkode_obatedit.text,
        'xnama_obat': xnama_obatedit.text,
        'xsatuan_obat': xsatuan_obatedit.text,
        'xjumlah_obat': xjumlah_obatedit.text,
        'xharga_obat': xharga_obatedit.text,
      });
      if (respon.statusCode == 200) {
        print('sukses data di update');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    xkode_obatedit.text = widget.obatListData['xkode_obat'];
    xnama_obatedit.text = widget.obatListData['xnama_obat'];
    xsatuan_obatedit.text = widget.obatListData['xsatuan_obat'];
    xjumlah_obatedit.text = widget.obatListData['xjumlah_obat'];
    xharga_obatedit.text = widget.obatListData['xharga_obat'];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 184, 184, 184),
          title: Text('UPDATE DATA OBAT'),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              color: Color.fromARGB(255, 184, 184, 184),
              child: TextField(
                controller: xkode_obatedit,
                decoration: InputDecoration(
                    label: Text(
                      'masukkan kode obat',
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              color: Color.fromARGB(255, 184, 184, 184),
              child: TextField(
                controller: xnama_obatedit,
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
                controller: xsatuan_obatedit,
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
                controller: xjumlah_obatedit,
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
                controller: xharga_obatedit,
                decoration: InputDecoration(
                    label: Text('masukkan harga obat'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  update_dataobat();
                },
                child: Text(
                  'UPDATE',
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
