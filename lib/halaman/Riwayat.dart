// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({super.key});

  @override
  _RiwayatState createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  final DatabaseReference studentsRef =
      FirebaseDatabase.instance.ref().child('students');

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return StreamBuilder(
      stream: studentsRef.onValue,
      builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
        if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
          return const Center(child: CircularProgressIndicator());
        }

        final Map<dynamic, dynamic> data =
            snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
        final List<dynamic> students = data.values.toList();

        // Sort students by waktu field
        students.sort((a, b) {
          final timeA = _parseTime(a['waktu']);
          final timeB = _parseTime(b['waktu']);
          return timeA.compareTo(timeB);
        });

        return Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                const Text('Riwayat Wajah',
                    style: TextStyle(color: Colors.white, fontSize: 23)),
                SizedBox(
                  height: h * .02,
                ),
                SizedBox(
                  width: w * .96,
                  child: DataTable(
                    columns: const [
                      DataColumn(
                          label: Text('Photo',
                              style: TextStyle(color: Colors.white))),
                      DataColumn(
                          label: Text('Name',
                              style: TextStyle(color: Colors.white))),
                      DataColumn(
                          label: Text('Waktu',
                              style: TextStyle(color: Colors.white))),
                    ],
                    rows: students.map<DataRow>((student) {
                      return DataRow(
                        cells: [
                          DataCell(
                            FutureBuilder(
                              future: _getImageUrl(student['image_url']),
                              builder:
                                  (context, AsyncSnapshot<String> snapshot) {
                                if (!snapshot.hasData) {
                                  return const CircularProgressIndicator();
                                }
                                return GestureDetector(
                                  onTap: () {
                                    _showImageDialog(context, snapshot.data!);
                                  },
                                  child: Image.network(
                                    snapshot.data!,
                                    width: 50,
                                    height: 50,
                                  ),
                                );
                              },
                            ),
                          ),
                          DataCell(
                            Text(
                              student['name'],
                              style: TextStyle(
                                color: student['name'] == 'Tidak Diketahui'
                                    ? Colors.red
                                    : Colors.green,
                              ),
                            ),
                          ),
                          DataCell(Text(student['waktu'],
                              style: TextStyle(
                                color: student['name'] == 'Tidak Diketahui'
                                    ? Colors.red
                                    : Colors.green,
                              ))),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<String> _getImageUrl(String imagePath) async {
    try {
      final ref = FirebaseStorage.instance.ref().child(imagePath);
      return await ref.getDownloadURL();
    } catch (e) {
      return '';
    }
  }

  void _showImageDialog(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
    );
  }

  DateTime _parseTime(String time) {
    final parts = time.split(':');
    final now = DateTime.now();
    return DateTime(
        now.year, now.month, now.day, int.parse(parts[0]), int.parse(parts[1]));
  }
}
