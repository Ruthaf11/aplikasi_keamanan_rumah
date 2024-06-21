import 'settings/Hapus_wajah.dart';
import 'package:flutter/material.dart';
import 'settings/Daftar_wajah.dart';
import 'settings/Data_wajah.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pengaturan Data Wajah',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            DataWajah(),
            Daftar(),
            HapusWajah(),
          ],
        ),
      );
    });
  }
}
