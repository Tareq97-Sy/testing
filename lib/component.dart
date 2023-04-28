import 'package:flutter/material.dart';

class Component extends StatelessWidget {
  Component({super.key, required this.components ,});
  final List<String> components;
  @override
  Widget build(BuildContext context) {
    return  SliverToBoxAdapter(
      child: SliverStack(
        children: [
          SliverPositioned.fill(
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ])
    );
  }
}
