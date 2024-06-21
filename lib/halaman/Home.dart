// ignore_for_file: file_names

import 'package:aplikasi_keamanan_rumah/tombol/tombol.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            'Kamera Rumah',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
        SizedBox(height: h * 0.03),
        Center(
          child: Container(
            height: h * 0.24,
            width: w * 0.8,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade700, width: 2),
            ),
          ),
        ),
        SizedBox(height: h * 0.03),
        const Center(
          child: Text(
            'Kontrol Kunci Rumah',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
        SizedBox(height: h * 0.03),
        const Center(child: Tombol()),
      ],
    );
  }
}
