import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ucp1/presentation/barang/detailbrg.dart';

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
    final dateText = _selectedDate == null
        ? 'Tanggal Transaksi'
        : DateFormat('dd MMMM yyyy', 'id_ID').format(_selectedDate!);

    return Scaffold(
      backgroundColor: const Color(0xFFFEF8F6),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Pendataan Barang'),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Tanggal Transaksi', style: TextStyle(fontWeight: FontWeight.bold)),
              GestureDetector(
                onTap: _pickDate,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 18),
                      const SizedBox(width: 8),
                      Text(dateText),
                    ],
                  ),
                ),
              ),
              if (_selectedDate == null)
                const Padding(
                  padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
                  child: Text(
                    'Tanggal harus dipilih',
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),

              DropdownButtonFormField<String>(
                value: _selectedJenisTransaksi,
                hint: const Text("Jenis Transaksi"),
                items: _jenisTransaksiList
                    .map((item) => DropdownMenuItem(value: item, child: Text(item)))
                    .toList(),
                onChanged: (val) => setState(() => _selectedJenisTransaksi = val),
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                validator: (value) =>
                    value == null ? 'Jenis transaksi harus dipilih' : null,
              ),
              const SizedBox(height: 16),

              DropdownButtonFormField<String>(
                value: _selectedJenisBarang,
                hint: const Text("Jenis Barang"),
                items: _barangHargaMap.keys
                    .map((item) => DropdownMenuItem(value: item, child: Text(item)))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    _selectedJenisBarang = val;
                    _hargaSatuan = _barangHargaMap[val]!;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                validator: (value) =>
                    value == null ? 'Jenis barang harus dipilih' : null,
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _jumlahController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Jumlah Barang',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      validator: (value) =>
                          value == null || value.isEmpty ? 'Jumlah tidak boleh kosong' : null,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        prefixText: 'Rp. ',
                        labelText: 'Harga Satuan',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      controller: TextEditingController(text: _hargaSatuan.toString()),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        _selectedDate != null) {
                      int jumlah = int.tryParse(_jumlahController.text) ?? 0;
                      int total = jumlah * _hargaSatuan;

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailBrg(
                            username: widget.username,
                            avatarPath: widget.avatarPath,
                            tanggal: _selectedDate!,
                            jenisTransaksi: _selectedJenisTransaksi!,
                            jenisBarang: _selectedJenisBarang!,
                            jumlah: jumlah,
                            hargaSatuan: _hargaSatuan,
                            totalHarga: total,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Harap lengkapi semua data!"),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}