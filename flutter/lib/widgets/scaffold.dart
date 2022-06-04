import 'package:flutter/material.dart';

import '../theme/theme.dart';
import 'title.dart';

class MyScaffold extends StatelessWidget {
  final Widget body;

  const MyScaffold({
    required this.body,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppStyle.colorBlack,
        child: SafeArea(
          child: Container(
            color: AppStyle.colorWhite,
            child: Column(
              children: [
                Container(
                  color: AppStyle.colorBlack,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: const TitleWidget(),
                ),
                const HorizontalBlackLine(),
                Expanded(
                  child: body,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
