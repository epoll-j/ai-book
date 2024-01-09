import 'package:ai_book/components/basic/basic_scaffold.dart';
import 'package:ai_book/l10n/l10n.dart';
import 'package:ai_book/page/book/cubit/book_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListenBookPage extends StatelessWidget {
  const ListenBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookCubit(),
      child: _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    const limit = SizedBox(
      height: 20,
    );
    final l10 = context.l10n;
    return BasicScaffold(
      needNavigationBar: false,
      stackChildren: [
        Positioned(
            left: 15,
            top: MediaQuery.of(context).padding.top + 15,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.close,
              ),
            ))
      ],
      children: [
        _buildBookCover(context),
        limit,
        _buildSlider(context),
        limit,
        _buildSpeed(context),
        limit,
        _buildControlButton(context)
      ],
    );
  }

  Widget _buildBookCover(BuildContext context) {
    const defaultSizeBox = SizedBox(
      height: 10,
    );
    final l10 = context.l10n;

    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            width: 220.w,
            height: 220.w * 1.5,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)), // 设置圆角的半径
              image: DecorationImage(
                image: NetworkImage(
                    'https://upload-images.jianshu.io/upload_images/5809200-a99419bb94924e6d.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240'),
                fit: BoxFit.cover, // 根据需要选择合适的fit类型
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            l10.summary,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.color
                    ?.withOpacity(0.5)),
          ),
          defaultSizeBox,
          Text(
            'Mark Schatzker',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildSlider(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '00:04',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Expanded(
            child: Material(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Slider(
            value: .1,
            min: 0,
            max: 1,
            thumbColor: CupertinoColors.systemBlue,
            activeColor: CupertinoColors.separator,
            inactiveColor: CupertinoColors.systemBlue,
            onChanged: (val) {},
          ),
        )),
        Text('01:07', style: Theme.of(context).textTheme.labelMedium)
      ],
    );
  }

  Widget _buildSpeed(BuildContext context) {
    final l10 = context.l10n;
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: 65.w,
        height: 25.w,
        decoration: const BoxDecoration(
            color: CupertinoColors.separator,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Text(
          '2x ${l10.speed}',
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }

  Widget _buildControlButton(BuildContext context) {
    const color = CupertinoColors.darkBackgroundGray;
    const size = 35.0;
    return FractionallySizedBox(
      widthFactor: 0.7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CupertinoButton(
              padding: EdgeInsets.zero,
              child: const Icon(Icons.skip_previous, size: size, color: color),
              onPressed: () {}),
          CupertinoButton(
              padding: EdgeInsets.zero,
              child: const Icon(Icons.replay_5, size: size, color: color),
              onPressed: () {}),
          CupertinoButton(
              padding: EdgeInsets.zero,
              child: const Icon(Icons.pause, size: size + 5, color: color),
              onPressed: () {}),
          CupertinoButton(
              padding: EdgeInsets.zero,
              child: const Icon(Icons.forward_10, size: size, color: color),
              onPressed: () {}),
          CupertinoButton(
              padding: EdgeInsets.zero,
              child: const Icon(Icons.skip_next, size: size, color: color),
              onPressed: () {}),
        ],
      ),
    );
  }
}
