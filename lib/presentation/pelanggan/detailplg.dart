import 'package:flutter/material.dart';

class DetailPlg extends StatelessWidget {
  final String username;
  final String avatarPath;
  final String nama;
  final String email;
  final String hp;
  final String alamat;
  final String provinsi;
  final String kodePos;

  const DetailPlg({
    super.key,
    required this.username,
    required this.avatarPath,
    required this.nama,
    required this.email,
    required this.hp,
    required this.alamat,
    required this.provinsi,
    required this.kodePos,
  });


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}