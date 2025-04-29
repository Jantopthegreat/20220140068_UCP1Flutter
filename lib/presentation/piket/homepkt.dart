import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class HomePkt extends StatefulWidget {
  final String email;
  const HomePkt({Key? key, required this.email}) : super(key: key);

  @override
  State<HomePkt> createState() => _HomePktState();
}

class _HomePktState extends State<HomePkt> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _tugasController = TextEditingController();
  DateTime? _selectedDate;
  List<String> _daftarTugas = [];

  bool _tanggalError = false;
  bool _tugasError = false;

  @override
  void initState() {
  
    super.initState();
    initializeDateFormatting('id_ID', null);
    _namaController.text = widget.email;
  }

  void _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
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