import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}