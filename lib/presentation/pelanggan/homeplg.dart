import 'package:flutter/material.dart';

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
    return const Placeholder();
  }
}