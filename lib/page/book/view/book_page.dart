
import 'package:ai_book/l10n/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class BookPage extends StatelessWidget {
  const BookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      needNavigationBar: false,
      children: [
        _buildBookCover(context),
        _buildInside(context),
        _buildBottomButton(context)
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
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: CupertinoColors.systemGrey,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: const Icon(
                Icons.close,
                color: CupertinoColors.systemBackground,
              ),
            ),
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
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold, fontSize: 28),
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
                  _buildIconLabel(context, Icons.list, '8 key points'),
                  const SizedBox(
                    width: 10,
                  ),
                  _buildIconLabel(context, Icons.access_time, '15 min'),
                  const SizedBox(
                    width: 10,
                  ),
                  _buildIconLabel(
                      context, Icons.electric_bolt_outlined, '7 insights')
                ],
              ),
              const SizedBox(
                height: 40,
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

  Widget _buildIconLabel(BuildContext context, IconData icon, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
        const SizedBox(
          width: 5,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.labelLarge,
        )
      ],
    );
  }

  Widget _buildInside(BuildContext context) {
    final l10 = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10.whatsInside,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          child: Text(
            'Explore the science behind flavor manufacturing and its consequences on your health. Get tips on how to limit unhealthy foods and select a plan that suits your needs.',
            style: Theme.of(context).textTheme.labelLarge,
            maxLines: 100,
          ),
        )
      ],
    );
  }

  Widget _buildBottomButton(BuildContext context) {
    final l10 = context.l10n;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: CupertinoColors.quaternarySystemFill,
              ),
              width: 100.w,
              height: 45.w,
              child: _buildIconLabel(context, Icons.dehaze_sharp, l10.read)),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: CupertinoColors.systemBlue,
            ),
            width: 220.w,
            height: 45.w,
            child:
            _buildIconLabel(context, Icons.queue_music_sharp, l10.listen),
          )
        ],
      ),
    );
  }
}

