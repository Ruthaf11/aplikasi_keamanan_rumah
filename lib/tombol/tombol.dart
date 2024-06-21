import 'package:flutter/material.dart';

class Tombol extends StatelessWidget {
  const Tombol({super.key});

  @override
  Widget build(BuildContext context) {
    int pilihanmenu = -1;
    final List<String> mode = [' Auto Lock', ' Lock', ' Lock Open'];
    final List<IconData> icons = [
      Icons.person,
      Icons.lock_outline,
      Icons.lock_open_outlined,
    ];
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return StatefulBuilder(builder: (context, setState) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(mode.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                pilihanmenu = index;
              });
            },
            child: Container(
              height: h * 0.06,
              width: w * 0.55,
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 2,
                  color: pilihanmenu == index
                      ? Colors.yellow.shade800
                      : Colors.grey.shade300,
                ),
                color: const Color.fromARGB(0, 2, 0, 63),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  Icon(
                    icons[index],
                    size: 25.0,
                    color: pilihanmenu == index
                        ? Colors.yellow.shade800
                        : Colors.grey.shade300,
                  ),
                  Text(
                    mode[index],
                    style: TextStyle(
                      color: pilihanmenu == index
                          ? Colors.yellow.shade800
                          : Colors.grey.shade400,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      );
    });
  }
}
