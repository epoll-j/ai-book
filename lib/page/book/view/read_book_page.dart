import 'package:ai_book/components/basic/basic_scaffold.dart';
import 'package:ai_book/page/book/cubit/book_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReadBookPage extends StatelessWidget {
  const ReadBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookCubit(),
      child: _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    return BasicScaffold(
      appBar: SliverAppBar(
        leading: const Icon(
          Icons.close,
          color: CupertinoColors.black,
        ),
        title: Text('title'),
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0), // 分割线的高度
          child: Container(
            color: Colors.grey.withOpacity(0.2), // 分割线颜色
            height: 1, // 分割线厚度
          ),
        ),
      ),
      children: [
        _buildContent(context),
        _buildContent(context),
        _buildContent(context)
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Text(
            'Altering belief must precede the modification of behavior. Who you are is more important than what you do. If a habit becomes a part of your personality, the chances of you maintaining it are much higher.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 50,
          ),
          _buildShareContent(context)
        ],
      ),
    );
  }

  Widget _buildShareContent(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FittedBox(
              child: Icon(
                Icons.electric_bolt_outlined,
                color: CupertinoColors.activeBlue,
              ),
            ),
            Expanded(
                child: Text(
              'Who you are is more important than what you do. If a habit becomes a part of your personality, the chances of you maintaining it are much higher.',
              style: Theme.of(context).textTheme.bodyLarge,
            ))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildButton(context, const Icon(Icons.ios_share), 'Share'),
            const SizedBox(
              width: 20,
            ),
            _buildButton(context, const Icon(Icons.check), 'Remember')
          ],
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext context, Icon icon, String text) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: CupertinoColors.lightBackgroundGray,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}
