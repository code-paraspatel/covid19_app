

import 'package:flutter/material.dart';

class CheckConnectivityScreen extends StatefulWidget {
  const CheckConnectivityScreen({super.key});

  @override
  State<CheckConnectivityScreen> createState() => _CheckConnectivityScreenState();
}

class _CheckConnectivityScreenState extends State<CheckConnectivityScreen> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'No Internet'
        ),
      ),
    );
  }
}
