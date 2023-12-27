import 'package:ai_book/components/basic/basic_content.dart';
import 'package:ai_book/components/basic/basic_scaffold.dart';
import 'package:ai_book/l10n/l10n.dart';
import 'package:ai_book/page/book/view/book_page.dart';
import 'package:ai_book/page/library/cubit/library_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LibraryCubit(),
      child: _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final l10 = context.l10n;
    return BasicScaffold(title: l10.tabBarItemLibrary, children: [
      BasicContent(
          title: l10.continueListen, children: [_buildContinueView(context)]),
      BasicContent(
          title: l10.savedForLater, children: [_buildLaterView(context)])
    ]);
  }

  Widget _buildContinueView(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          _buildBookItem(context),
          _buildBookItem(context),
          _buildBookItem(context),
          _buildBookItem(context),
          _buildBookItem(context),
          _buildBookItem(context),
          _buildBookItem(context),
        ],
      ),
    );
  }

  Widget _buildLaterView(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          _buildBookItem(context, type: 1),
          _buildBookItem(context, type: 1),
          _buildBookItem(context, type: 1),
          _buildBookItem(context, type: 1),
          _buildBookItem(context, type: 1),
          _buildBookItem(context, type: 1),
          _buildBookItem(context, type: 1),
        ],
      ),
    );
  }

  Widget _buildBookItem(BuildContext context, {type = 0}) {
    final radius = BorderRadius.circular(5);

    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              CupertinoScaffold.showCupertinoModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const BookPage();
                  });
            },
            child: Stack(
              children: [
                Container(
                  width: type == 0 ? 140.w : 120.w,
                  height: type == 0 ? 140.w * 1.5 : 120.w * 1.5,
                  decoration: BoxDecoration(
                    borderRadius: radius, // 设置圆角的半径
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://upload-images.jianshu.io/upload_images/5809200-a99419bb94924e6d.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240'),
                      fit: BoxFit.cover, // 根据需要选择合适的fit类型
                    ),
                  ),
                ),
                Positioned(
                  right: 8,
                  bottom: 8,
                  child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: radius, color: Colors.white),
                      child: const Icon(
                        Icons.more_horiz,
                        color: Colors.black54,
                      )),
                )
              ],
            ),
          ),
          SizedBox.fromSize(
            size: const Size(10, 10),
          ),
          Text(
            'Book name',
            style: Theme.of(context).textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}