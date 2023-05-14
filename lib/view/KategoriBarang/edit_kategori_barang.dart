import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:project_api01/controller/kategori_barang_controller.dart';
import 'package:project_api01/model/kategori_barang_model.dart';
import 'package:project_api01/view/KategoriBarang/kategori_barang.dart';

class EditKategoriBarang extends StatefulWidget {
  const EditKategoriBarang({super.key, this.id, this.kategoriNama1});

  final int? id;
  final String? kategoriNama1;

  @override
  State<EditKategoriBarang> createState() => _EditKategoriBarangState();
}

class _EditKategoriBarangState extends State<EditKategoriBarang> {
  final kategoriBarangController = KategoriBarangController();
  String? nama;

  @override
  Widget build(BuildContext context) {
    var formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Kategori Barang'),
      ),
      body: Form(
        key: formkey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Nama Kategori Barang',
                labelText: 'Nama Kategori Barang',
              ),
              onChanged: (value) {
                nama = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nama Kategori is required';
                }
                return null;
              },
              initialValue: widget.kategoriNama1,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();
                  kategoriBarangController.editKategoriBarang(widget.id!, nama!);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const KategoriBarang()));

                  var snackBar =
                      const SnackBar(content: Text('Data Berhasil Diedit'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}