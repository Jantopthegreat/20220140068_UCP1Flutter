import 'package:flutter/material.dart';
import 'package:ucp1/presentation/pelanggan/homeplg.dart';
import 'package:ucp1/presentation/barang/homebrg.dart';
import 'package:ucp1/presentation/piket/homepkt.dart';
import 'package:ucp1/presentation/loginpage.dart';

class HomePage extends StatelessWidget {
  final String username;
  final String avatarPath = 'assets/images/avatar.jpg';

  const HomePage({super.key, required this.username});

 