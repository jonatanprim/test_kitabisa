import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);
  final Color backgroundColor;
  final String title;
  final double titleSize;
  final bool? isLight;
  final bool? enableBack;
  final bool? enableSearch;
  const CustomAppBar({
    Key? key,
    required this.backgroundColor,
    required this.title,
    required this.titleSize,
    this.isLight,
    this.enableBack,
    this.enableSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: true,
      leading: Visibility(
        visible: enableBack ?? false,
        child: IconButton(
          icon: Icon(Icons.arrow_back, color: isLight == true ? Colors.white : Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.w700, fontSize: titleSize, color: isLight == true ? Colors.white : Colors.black87),
      ),
      automaticallyImplyLeading: false,
      actions: [
        Visibility(
          visible: enableSearch ?? false,
          child: IconButton(
            icon: Icon(Icons.search, color: isLight == true ? Colors.white : Colors.black, size: 28,),
            onPressed: (){},
          ),
        ),
      ],
      elevation: 0,
    );
  }
}
