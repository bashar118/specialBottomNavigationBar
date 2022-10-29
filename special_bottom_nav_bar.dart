import 'package:flutter/material.dart';

class SpecialBottomNavBar extends StatefulWidget {
  final int selected;
  final List<Icon> icons;
  final Color backgroundColor;
  final Color iconColor;
  final Color cursorColor;
  final ValueChanged<int> onTab;

  const SpecialBottomNavBar({
    super.key,
    required this.selected,
    this.backgroundColor = Colors.black,
    this.iconColor = Colors.white,
    this.cursorColor = Colors.white,
    required this.onTab, //onTap(1)
    required this.icons,
  });

  @override
  // ignore: no_logic_in_create_state
  State<SpecialBottomNavBar> createState() => _SpecialBottomNavBarState();
}

class _SpecialBottomNavBarState extends State<SpecialBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      height: screenSize.height * 0.1,
      color: widget.backgroundColor,
      child: Stack(
        children: [
          AnimatedPositioned(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    widget.cursorColor,
                        widget.cursorColor.withOpacity(0.25),

                        widget.cursorColor.withOpacity(0.25),

                        widget.cursorColor.withOpacity(0.25),
                    widget.cursorColor.withOpacity(0),
                  ])),
              margin: EdgeInsets.symmetric(horizontal: 1),
              width: screenSize.width / widget.icons.length,
              height: screenSize.height * 0.065,
            ),
            left: screenSize.width / widget.icons.length * (widget.selected),
            duration: Duration(milliseconds: 200),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Row(
                children: widget.icons.map((icon) {
              return Expanded(
                  child: IconButton(
                onPressed: () {
                  widget.onTab(widget.icons.indexOf(icon));
                },
                icon: icon,
                color: widget.iconColor,
              ));
            }).toList()),
          )
        ],
      ),
    );
  }
}
