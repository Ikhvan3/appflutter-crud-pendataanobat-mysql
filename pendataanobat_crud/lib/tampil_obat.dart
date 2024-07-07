import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pendataanobat_crud/form_editobat.dart';
import 'package:pendataanobat_crud/form_inputobat.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: tampildata_obat(),
  ));
}

class tampildata_obat extends StatefulWidget {
  const tampildata_obat({super.key});

  @override
  State<tampildata_obat> createState() => _tampildata_obatState();
}

class _tampildata_obatState extends State<tampildata_obat> {
  List obatdata = [];
  Future<void> baca_dataobat() async {
    String uri = "http://192.168.177.195/koneksiobat.php";
    try {
      final respon = await http.get(Uri.parse(uri));
      if (respon.statusCode == 200) {
        final data = jsonDecode(respon.body);
        print(data);
        setState(() {
          obatdata = data;
        });
        obatdata = data;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> hapus_dataobat(String xkode_obat) async {
    String url = "http://192.168.177.195/hapusobat.php";
    try {
      final respon = await http.post(
        Uri.parse(url),
        body: {"xkode_obat": xkode_obat},
      );

      if (respon.statusCode == 200) {
        print('berhasil.........!');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    baca_dataobat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Listview data Obat",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 66, 66, 66),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 184, 184, 184),
      ),
      body: Card(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: 400,
                width: double.infinity,
                color: Color.fromARGB(255, 184, 184, 184),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => form_editobat(
                                  obatdata,
                                  obatListData: {
                                    "xkode_obat": obatdata[index]['kode_obat'],
                                    "xnama_obat": obatdata[index]['nama_obat'],
                                    "xsatuan_obat": obatdata[index]
                                        ['satuan_obat'],
                                    "xjumlah_obat": obatdata[index]
                                        ['jumlah_obat'],
                                    "xharga_obat": obatdata[index]
                                        ['harga_obat'],
                                  },
                                  listObatData: {},
                                ),
                              ));
                        },
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${obatdata[index]['kode_obat']}",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 66, 66, 66),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "--",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color.fromARGB(255, 66, 66, 66),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${obatdata[index]['nama_obat']}",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 66, 66, 66),
                              ),
                            ),
                          ],
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "\Satuan Obat : ${obatdata[index]['satuan_obat']}",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 66, 66, 66),
                              ),
                            ),
                            Text(
                              "\Jumlah Obat : ${obatdata[index]['jumlah_obat']}",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 66, 66, 66),
                              ),
                            ),
                            Text(
                              "\Harga Obat : Rp${obatdata[index]['harga_obat']}",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 66, 66, 66),
                              ),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            hapus_dataobat(obatdata[index]['kode_obat']);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Color.fromARGB(255, 66, 66, 66),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: obatdata.length),
                // child: ListView.builder(
                //   itemCount: mhsdata.length,
                //   itemBuilder: (context, index) {
                //     return ListTile(
                //       tileColor: Color.fromARGB(255, 88, 88, 88),
                //       title: Text(
                //         mhsdata[index]['nim'] +
                //             " -- " +
                //             mhsdata[index]['nama_mhs'],
                //         style: TextStyle(
                //             fontSize: 20,
                //             fontWeight: FontWeight.bold,
                //             color: Color.fromARGB(255, 0, 0, 0)),
                //       ),
                //       subtitle: Text(
                //         mhsdata[index]['jurusan'],
                //         style: TextStyle(
                //             fontSize: 20,
                //             fontWeight: FontWeight.bold,
                //             color: Color.fromARGB(255, 0, 0, 0)),
                //       ),
                //       trailing: IconButton(
                //         onPressed: () {
                //           hapus_datamhs(mhsdata[index]['nim']);
                //         },
                //         icon: Icon(
                //           Icons.delete,
                //         ),
                //       ),
                //     );
                //   },
                // ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => entry_obat(),
                    ),
                  );
                },
                child: Text(
                  "INPUT",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 66, 66, 66),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
