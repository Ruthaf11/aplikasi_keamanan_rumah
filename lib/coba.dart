import 'package:aplikasi_keamanan_rumah/halaman/Home.dart';
import 'package:aplikasi_keamanan_rumah/halaman/Riwayat.dart';
import 'package:aplikasi_keamanan_rumah/halaman/settings.dart';
import 'package:flutter/material.dart';

class BottomTabbarExample extends StatefulWidget {
  const BottomTabbarExample({super.key});

  @override
  State<StatefulWidget> createState() => _BottomTabbarExampleState();
}

class _BottomTabbarExampleState extends State<BottomTabbarExample>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _kTabPages = <Widget>[
    const HomePage(),
    Riwayat(),
    const Settings(),
  ];
  static const _kTabs = <Tab>[
    Tab(icon: Icon(Icons.home), text: 'Home'),
    Tab(icon: Icon(Icons.history_outlined), text: 'History'),
    Tab(icon: Icon(Icons.settings), text: 'Settings'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _kTabPages.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 94,
        backgroundColor: const Color.fromARGB(0, 24, 23, 24),
        flexibleSpace: Column(
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
                          inherit: false, fontSize: 25, color: Colors.white),
                    ),
                    Text(
                      'Utamakan Keselamatan Keluarga',
                      style: TextStyle(
                          inherit: false, fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(0, 24, 23, 24),
      body: TabBarView(
        controller: _tabController,
        children: _kTabPages,
      ),
      bottomNavigationBar: Material(
        color: const Color.fromARGB(0, 24, 23, 24),
        shadowColor: Colors.yellow[800],
        surfaceTintColor: Colors.grey.shade500,
        child: TabBar(
          indicatorWeight: 0.01,
          indicatorColor: Colors.transparent,
          labelColor: Colors.yellow[800],
          tabs: _kTabs,
          controller: _tabController,
        ),
      ),
    );
  }
}
