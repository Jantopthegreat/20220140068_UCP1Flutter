import 'package:flutter/material.dart';
import 'package:ucp1/presentation/pelanggan/detailplg.dart';

class HomePlg extends StatefulWidget {
  final String username;
  final String avatarPath;

  const HomePlg({
    super.key,
    required this.username,
    required this.avatarPath,
  });

  @override
  State<HomePlg> createState() => _HomePlgState();
}

class _HomePlgState extends State<HomePlg> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  final _hpController = TextEditingController();
  final _alamatController = TextEditingController();
  final _provinsiController = TextEditingController();
  final _kodePosController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF8F4),
      appBar: AppBar(
        title: const Text(
          'Data Pelanggan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Nama Cust', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                  hintText: 'Nama Cust',
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Cust tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Email', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('No Hp', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _hpController,
                          decoration: const InputDecoration(
                            hintText: 'No Hp',
                            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'No Hp tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              const Text('Alamat', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              TextFormField(
                controller: _alamatController,
                decoration: const InputDecoration(
                  hintText: 'Alamat',
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Alamat tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Provinsi', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _provinsiController,
                          decoration: const InputDecoration(
                            hintText: 'Provinsi',
                            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Provinsi tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Kode Pos', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _kodePosController,
                          decoration: const InputDecoration(
                            hintText: 'Kode Pos',
                            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Pos tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailPlg(
                            username: widget.username,
                            avatarPath: widget.avatarPath,
                            nama: _namaController.text,
                            email: _emailController.text,
                            hp: _hpController.text,
                            alamat: _alamatController.text,
                            provinsi: _provinsiController.text,
                            kodePos: _kodePosController.text,
                          ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Simpan', style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),
              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    _formKey.currentState!.reset();
                    _namaController.clear();
                    _emailController.clear();
                    _hpController.clear();
                    _alamatController.clear();
                    _provinsiController.clear();
                    _kodePosController.clear();
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.deepOrange,
                    side: const BorderSide(color: Colors.deepOrange),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Reset', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
