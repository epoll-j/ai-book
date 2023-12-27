import 'package:flutter/material.dart';

class BasicContent extends StatelessWidget {
  const BasicContent(
      {required this.title, required this.children, super.key, this.margin,});

  final String title;
  final List<Widget> children;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox.fromSize(size: const Size.fromHeight(15),),
          ...children,
        ],
      ),
    );
  }
}
