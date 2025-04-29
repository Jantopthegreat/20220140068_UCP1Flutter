import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class HomeBrg extends StatefulWidget {
  final String username;
  final String avatarPath;

  const HomeBrg({
    super.key,
    required this.username,
    required this.avatarPath,
  });

  @override
  State<HomeBrg> createState() => _HomeBrgState();
}

class _HomeBrgState extends State<HomeBrg> {
  final _formKey = GlobalKey<FormState>();
  final _jumlahController = TextEditingController();

  DateTime? _selectedDate;
  String? _selectedJenisTransaksi;
  String? _selectedJenisBarang;
  int _hargaSatuan = 0;

  final _jenisTransaksiList = ['Barang Masuk', 'Barang Keluar'];
  final Map<String, int> _barangHargaMap = {
    'Tenda': 10000,
    'Carrier': 540000,
    'Kompor': 80000,
    'Matras': 30000,
  };

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('id_ID', null);
  }

  void _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      helpText: 'Pilih Tanggal Transaksi',
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}