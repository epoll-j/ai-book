import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicScaffold extends StatelessWidget {
  const BasicScaffold(
      {required this.children, this.title = '',
      super.key,
      this.backgroundColor,
      this.padding,
      this.needNavigationBar = true});

  final String title;
  final List<Widget> children;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final bool needNavigationBar;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: ColoredBox(
        color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
        child: CustomScrollView(
          slivers: [
            if (needNavigationBar)
              CupertinoSliverNavigationBar(
                largeTitle: Text(title),
              ),
            ...children.map((e) => SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        padding ?? const EdgeInsets.only(left: 15, right: 15),
                    child: e,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
