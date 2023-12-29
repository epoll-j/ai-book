import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicScaffold extends StatelessWidget {
  const BasicScaffold({
    required this.children,
    this.title = '',
    super.key,
    this.backgroundColor,
    this.padding,
    this.needNavigationBar = true,
    this.bottom,
    this.stackChildren, this.appBar,
  });

  final String title;
  final List<Widget> children;
  final Widget? bottom;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final bool needNavigationBar;
  final List<Widget>? stackChildren;
  final Widget? appBar;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: ColoredBox(
        color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                    child: CustomScrollView(
                  slivers: [
                    if (needNavigationBar)
                      appBar ?? CupertinoSliverNavigationBar(
                        largeTitle: Text(title),
                        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ...children.map((e) => SliverToBoxAdapter(
                          child: Padding(
                            padding: padding ??
                                const EdgeInsets.only(left: 15, right: 15),
                            child: e,
                          ),
                        )),
                  ],
                )),
                if (bottom != null) bottom!,
              ],
            ),
            if (stackChildren != null) ...stackChildren!,
          ],
        ),
      ),
    );
  }
}
