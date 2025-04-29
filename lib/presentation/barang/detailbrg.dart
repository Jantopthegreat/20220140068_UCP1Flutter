import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ucp1/presentation/homepage.dart';

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
    final dateFormatted = DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(tanggal);
    return Scaffold(
      backgroundColor: Color(0xFFFEF8F6),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
          child: Column(
            children: [
              Spacer(),
              Icon(Icons.check_circle, color: Colors.green, size: 100),
              SizedBox(height: 16),
              Text("Data Berhasil Disimpan", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 24),
              buildRow("Tanggal", dateFormatted),
              buildRow("Jenis Transaksi", jenisTransaksi),
              buildRow("Jenis Barang", jenisBarang),
              buildRow("Jumlah Barang", jumlah.toString()),
              buildRow("Harga Satuan", 'Rp. $hargaSatuan'),
              buildRow("Total Harga", 'Rp. $totalHarga'),
              Spacer(),
              ElevatedButton(
                onPressed: () => 
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(
                        username: username,
                      ),
                    ),
                    (Route<dynamic> route) => false,
                ),
                
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                child: Text("Selesai"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.w600)),
          Text(value),
        ],
      ),
    );
  }
}