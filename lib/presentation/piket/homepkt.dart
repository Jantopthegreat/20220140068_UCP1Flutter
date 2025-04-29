import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ucp1/presentation/piket/detailpkt.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        toolbarHeight: 90,
        title: const Text('Piket Gudang', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                'Nama Anggota',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _namaController,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Pilih Tanggal',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  _pickDate();
                  setState(() {
                    _tanggalError = false;
                  });
                },
                child: InputDecorator(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    suffixIcon: const Icon(Icons.calendar_today),
                    errorText:
                        _tanggalError ? 'Tanggal tidak boleh kosong' : null,
                  ),
                  child: Text(
                    _selectedDate == null
                        ? 'Pilih Tanggal'
                        : DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
                            .format(_selectedDate!),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Tugas Piket',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _tugasController,
                      decoration: InputDecoration(
                        hintText: 'Tugas Piket',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        errorText: _tugasError
                            ? 'Tugas piket tidak boleh kosong'
                            : null,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      padding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 70,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _tugasError = _tugasController.text.isEmpty;
                        _tanggalError = _selectedDate == null;
                      });

                      if (!_tugasError && !_tanggalError) {
                        setState(() {
                          _daftarTugas.add(_tugasController.text);
                          _tugasController.clear();
                          _tugasError = false;
                        });
                      }
                    },
                    child: const Text(
                      'Tambah',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  'Daftar Tugas Piket',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              const SizedBox(height: 12),
              _daftarTugas.isEmpty
                  ? SizedBox(
                      height: 400,
                      child: Center(
                        child: Text(
                          'Belum ada data',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    )
                  : Column(
                      children: _daftarTugas
                          .map(
                            (tugas) => Card(
                              color: Colors.deepOrange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: ListTile(
                                title: Text(
                                  tugas,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                trailing: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                onTap: () {
                                  if (_selectedDate != null) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailPkt(
                                          email: _namaController.text,
                                          tanggal: DateFormat(
                                            'EEEE, dd MMMM yyyy',
                                            'id_ID',
                                          ).format(_selectedDate!),
                                          tugas: tugas,
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          )
                          .toList(),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
