import 'package:flutter/material.dart';

class SampleWidget extends StatelessWidget {
  SampleWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Colors.orange,
              width: 3.5,
            ),
            borderRadius: BorderRadius.circular(20)),
        child:
            Container(padding: const EdgeInsets.all(20.0), child: Text(text)),
      ),
    );
  }
}
