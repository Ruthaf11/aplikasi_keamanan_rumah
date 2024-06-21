// ignore_for_file: non_constant_identifier_names

import 'package:aplikasi_keamanan_rumah/halaman/Home.dart';
import 'package:aplikasi_keamanan_rumah/halaman/settings.dart';
import 'package:flutter/material.dart';

class Halaman extends StatefulWidget {
  const Halaman({super.key});

  @override
  State<Halaman> createState() => _HalamanState();
}

class _HalamanState extends State<Halaman> {
  int _pilihhal = 0;
  final List<Widget> _pilihanWidget = [
    const HomePage(),
    const Text('Riwayat'),
    const Settings(),
  ];

  void _OnItemTap(int index) {
    setState(() {
      _pilihhal = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          useLegacyColorScheme: false,
          selectedItemColor: Colors.yellow[800],
          unselectedItemColor: Colors.grey.shade500,
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.history_outlined,
                ),
                label: 'Riwayat'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: 'Settings')
          ],
          currentIndex: _pilihhal,
          onTap: _OnItemTap,
        ),
        backgroundColor: const Color.fromARGB(255, 1, 1, 29),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: h * .15,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hai, User',
                          style: TextStyle(
                              inherit: false,
                              fontSize: 25,
                              color: Colors.white),
                        ),
                        Text(
                          'Utamakan Keselamatan Keluarga',
                          style: TextStyle(
                              inherit: false,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                _pilihanWidget.elementAt(_pilihhal)
              ],
            ),
          ],
        ));
  }
}
