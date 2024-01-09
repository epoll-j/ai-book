import 'package:ai_book/components/basic/basic_scaffold.dart';
import 'package:ai_book/l10n/l10n.dart';
import 'package:ai_book/page/book/cubit/book_cubit.dart';
import 'package:ai_book/page/book/view/listen_book_page.dart';
import 'package:ai_book/page/book/view/read_book_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookPage extends StatelessWidget {
  const BookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookCubit(),
      child: _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    const limit = SizedBox(
      height: 40,
    );
    final l10 = context.l10n;
    return BasicScaffold(
      needNavigationBar: false,
      stackChildren: [
        Positioned(
            left: 15,
            top: 15,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: CupertinoColors.label.withOpacity(0.1)),
                  color: CupertinoColors.systemBackground,
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                child: const Icon(
                  Icons.close,
                  color: CupertinoColors.label,
                ),
              ),
            ))
      ],
      bottom: _buildBottomButton(context),
      children: [
        _buildBookCover(context),
        limit,
        _buildContent(context, l10.whatsInside,
            'Good habits produce produce produce produce produce produce produce results that multiply rapidly, just like money that grows through compound interest'),
        limit,
        _buildLearnDetail(context),
        limit,
        _buildKeyPoint(context),
        limit,
        _buildContent(context, '${l10.about} James Clear',
            'Good habits produce produce produce produce produce produce produce results that multiply rapidly, just like money that grows through compound interest'),
        limit,
      ],
    );
  }

  Widget _buildBookCover(BuildContext context) {
    const defaultSizeBox = SizedBox(
      height: 10,
    );
    final l10 = context.l10n;

    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
            width: 10,
          ),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: 220.w,
                height: 220.w * 1.5,
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(15)), // 设置圆角的半径
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://upload-images.jianshu.io/upload_images/5809200-a99419bb94924e6d.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240'),
                    fit: BoxFit.cover, // 根据需要选择合适的fit类型
                  ),
                ),
              ),
              defaultSizeBox,
              SizedBox(
                width: 220.w,
                height: 5,
                child: const LinearProgressIndicator(
                  value: .5,
                  backgroundColor: CupertinoColors.lightBackgroundGray,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  valueColor:
                      AlwaysStoppedAnimation(CupertinoColors.activeBlue),
                ),
              ),
              defaultSizeBox,
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
                'The Dorit Effect',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              defaultSizeBox,
              Text(
                'Mark Schatzker',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildIconLabel(
                      context, const Icon(Icons.list), '8 key points'),
                  const SizedBox(
                    width: 10,
                  ),
                  _buildIconLabel(
                      context, const Icon(Icons.access_time), '15 min'),
                  const SizedBox(
                    width: 10,
                  ),
                  _buildIconLabel(context,
                      const Icon(Icons.electric_bolt_outlined), '7 insights')
                ],
              ),
            ],
          ),
          Column(
            children: [
              const Icon(Icons.ios_share),
              SizedBox.fromSize(
                size: const Size(20, 20),
              ),
              const Icon(Icons.vertical_align_bottom_outlined),
              SizedBox.fromSize(
                size: const Size(20, 20),
              ),
              const Icon(Icons.favorite_border)
            ],
          )
        ],
      ),
    );
  }

  Widget _buildIconLabel(BuildContext context, Icon icon, String title,
      {TextStyle? textStyle, bool expanded = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        const SizedBox(
          width: 5,
        ),
        if (expanded)
          Expanded(
              child: Text(
            title,
            style: textStyle ?? Theme.of(context).textTheme.labelLarge,
          ))
        else
          Text(
            title,
            style: textStyle ?? Theme.of(context).textTheme.labelLarge,
          )
      ],
    );
  }

  Widget _buildContent(BuildContext context, String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          child: Text(
            content,
            style: Theme.of(context).textTheme.labelLarge,
            maxLines: 100,
          ),
        )
      ],
    );
  }

  Widget _buildLearnDetail(BuildContext context) {
    final l10 = context.l10n;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.1)),
        color: Theme.of(context).brightness == Brightness.dark
            ? CupertinoColors.secondaryLabel
            : CupertinoColors.systemBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10.willLearn,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: _buildIconLabel(
                context,
                const Icon(
                  Icons.check,
                  color: CupertinoColors.activeBlue,
                ),
                "dsfajsdfkjsdhfklsdjfhjskdhfkshfkhfkashfakshfaskfhaskhfaskhfjkashfkafhas",
                expanded: true),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: _buildIconLabel(
                context,
                const Icon(
                  Icons.check,
                  color: CupertinoColors.activeBlue,
                ),
                "dsfajsdfkjsdhfklsdjfhjskdhfkshfkhfkashfakshfaskfhaskhfaskhfjkashfkafhas",
                expanded: true),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: _buildIconLabel(
                context,
                const Icon(
                  Icons.check,
                  color: CupertinoColors.activeBlue,
                ),
                "dsfajsdfkjsdhfklsdjfhjskdhfkshfkhfkashfakshfaskfhaskhfaskhfjkashfkafhas",
                expanded: true),
          )
        ],
      ),
    );
  }

  Widget _buildKeyPoint(BuildContext context) {
    final l10 = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10.keyPoints,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Divider(),
        Container(
          margin: const EdgeInsets.only(top: 15),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 20, bottom: 25),
                child: Text(
                  '1',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: CupertinoColors.systemBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Expanded(
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(
                        'Good habits produce produce produce produce produce produce produce results that multiply rapidly, just like money that grows through compound interest',
                        style: Theme.of(context).textTheme.labelLarge,
                      )),
                      const Icon(
                        Icons.chevron_right_rounded,
                        color: CupertinoColors.systemGrey,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider()
                ],
              )),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 15),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 20, bottom: 25),
                child: Text(
                  '1',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: CupertinoColors.systemBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Expanded(
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(
                        'Good habits produce produce produce produce produce produce produce results that multiply rapidly, just like money that grows through compound interest',
                        style: Theme.of(context).textTheme.labelLarge,
                      )),
                      const Icon(
                        Icons.chevron_right_rounded,
                        color: CupertinoColors.systemGrey,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider()
                ],
              )),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 15),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 20, bottom: 25),
                child: Text(
                  '1',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: CupertinoColors.systemBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Expanded(
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(
                        'Good habits produce produce produce produce produce produce produce results that multiply rapidly, just like money that grows through compound interest',
                        style: Theme.of(context).textTheme.labelLarge,
                      )),
                      const Icon(
                        Icons.chevron_right_rounded,
                        color: CupertinoColors.systemGrey,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider()
                ],
              )),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildBottomButton(BuildContext context) {
    final l10 = context.l10n;

    return Container(
      padding: EdgeInsets.only(
          top: 15,
          left: 10,
          right: 10,
          bottom: MediaQuery.of(context).padding.bottom + 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).scaffoldBackgroundColor,
            blurRadius: 5,
            spreadRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => const ReadBookPage()),
              );
            },
            child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: CupertinoColors.quaternarySystemFill,
                ),
                width: 100.w,
                height: 45.w,
                child: _buildIconLabel(
                    context, const Icon(Icons.dehaze_sharp), l10.read,
                    textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.bold, fontSize: 18.sp))),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => const ListenBookPage()),
              );
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: CupertinoColors.systemBlue,
              ),
              width: 220.w,
              height: 45.w,
              child: _buildIconLabel(
                  context,
                  const Icon(
                    Icons.queue_music_sharp,
                    color: CupertinoColors.lightBackgroundGray,
                  ),
                  l10.listen,
                  textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: CupertinoColors.lightBackgroundGray,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp)),
            ),
          )
        ],
      ),
    );
  }
}
