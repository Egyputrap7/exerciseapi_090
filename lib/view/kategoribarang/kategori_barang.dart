import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:rest_api/controller/kategori_barang_controller.dart';
import 'package:rest_api/model/kategori_barang_model.dart';
import 'package:rest_api/view/kategoribarang/add_kategori_barang.dart';
import 'package:rest_api/view/kategoribarang/edit_kategori_barang.dart';

class KategoriBarang extends StatefulWidget {
  const KategoriBarang({super.key});

  @override
  State<KategoriBarang> createState() => _KategoriBarangState();
}

class _KategoriBarangState extends State<KategoriBarang> {
  final KategoriBarangController = BarangController();
  List<KategoriBarangModel> listKategoriBarang = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getKategoriBarang();
  }

  void getKategoriBarang() async {
    final KategoriBarang = await KategoriBarangController.getKategoriBarang();
    setState(() {
      listKategoriBarang = KategoriBarang;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kategori Barang'),
      ),
      body: SafeArea(
          child: ListView.builder(
        itemCount: listKategoriBarang.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(listKategoriBarang[index].nama),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditKategoriBarang(
                                    callupdate: listKategoriBarang[index].nama,
                                    id: listKategoriBarang[index].id,
                                  )));
                    },
                    icon: const Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () async {
                      KategoriBarangController
                          .deleteData(listKategoriBarang[index].id)
                          .then((value) {
                        setState(() {
                          listKategoriBarang.removeAt(index);
                        });
                      });
                      var snackBar = const SnackBar(
                          content:
                              Text('Data Kategori Barang Berhasil Dihapus'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    icon: const Icon(Icons.delete, color: Colors.blue),
                  ),
                ],
              ),
            ),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddKategoriBarang()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}