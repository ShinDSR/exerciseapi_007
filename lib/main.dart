import 'package:flutter/material.dart';
import 'package:project_api01/view/KategoriBarang/kategori_barang.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: KategoriBarang(),
    );
  }
}
