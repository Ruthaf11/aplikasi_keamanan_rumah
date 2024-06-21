// ignore_for_file: file_names

import 'package:flutter/material.dart';

class HapusWajah extends StatelessWidget {
  const HapusWajah({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return StatefulBuilder(builder: (context, setState) {
      return GestureDetector(
        onTap: () {
          setState(() {});
        },
        child: Container(
          height: h * 0.06,
          width: w * 0.75,
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade300,
            ),
            color: const Color.fromARGB(0, 2, 0, 63),
          ),
          child: const Row(
            children: [
              SizedBox(width: 10),
              Icon(
                Icons.person_remove,
                size: 25.0,
                color: Colors.white,
              ),
              Text(
                ' Hapus Data',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
