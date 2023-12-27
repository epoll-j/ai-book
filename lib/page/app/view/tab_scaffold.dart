import 'package:ai_book/components/basic/basic_scaffold.dart';
import 'package:ai_book/l10n/l10n.dart';
import 'package:ai_book/page/library/view/library_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabBarItem {
  TabBarItem(this.title, this.icon, this.page);

  final String title;
  final IconData icon;
  final Widget page;
}

class TabScaffold extends StatelessWidget {
  const TabScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final tabsList = <TabBarItem?>[
      TabBarItem('首页', Icons.home, BasicScaffold(title: "wocao", children: [],)),
      TabBarItem(l10n.tabBarItemLibrary, Icons.adb, const LibraryPage()),
      TabBarItem(l10n.tabBarItemProfile, Icons.person_pin, const LibraryPage()),
    ];

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: tabsList
            .map((e) =>
            BottomNavigationBarItem(icon: Icon(e?.icon), label: e?.title))
            .toList(),
      ),
      tabBuilder: (BuildContext context, int index) {
        return tabsList[index]!.page;
      },
    );
  }
}
