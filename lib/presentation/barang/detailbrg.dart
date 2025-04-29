import 'package:flutter/material.dart';

class DetailBrg extends StatelessWidget {
  final DateTime tanggal;
  final String jenisTransaksi;
  final String jenisBarang;
  final int jumlah;
  final int hargaSatuan;
  final int totalHarga;
  final String username;
  final String avatarPath;

  const DetailBrg({
    Key? key,
    required this.tanggal,
    required this.username,
    required this.avatarPath,
    required this.jenisTransaksi,
    required this.jenisBarang,
    required this.jumlah,
    required this.hargaSatuan,
    required this.totalHarga,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}