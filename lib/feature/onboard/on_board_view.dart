import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:state_management_in_life/feature/onboard/onboard_model.dart';
import 'package:state_management_in_life/feature/onboard/tab_indicator.dart';
import 'package:state_management_in_life/product/padding/page_padding.dart';

import '../../product/widget/onboard_card.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  final String _skipTile = 'Skip';
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _incrementAndChange() {
    if (_selectedIndex == OnBoardModels.onBoardItems.length - 1) {
      return;
    }
    _incrementSelectedPage();
  }

  void _incrementSelectedPage() {
    setState(() {
      _selectedIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const PagePadding.all(),
        child: Column(
          children: [
            Expanded(
              child: _pageViewItems(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TabIndicator(
                  selectedIndex: _selectedIndex,
                ),
                _nextButton()
              ],
            )
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      //status bar color
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(_skipTile),
        ),
      ],
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.chevron_left_outlined, color: Colors.grey),
      ),
    );
  }

  PageView _pageViewItems() {
    return PageView.builder(
      itemCount: OnBoardModels.onBoardItems.length,
      itemBuilder: (context, index) {
        return OnBoardCard(model: OnBoardModels.onBoardItems[index]);
      },
    );
  }

  FloatingActionButton _nextButton() {
    return FloatingActionButton(
      onPressed: () {
        _incrementAndChange();
      },
      child: Text('Next'),
    );
  }
}
