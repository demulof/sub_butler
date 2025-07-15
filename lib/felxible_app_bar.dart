import 'package:flutter/material.dart';
import 'package:sub_butler/styles/app_colors.dart';

class FelxibleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const FelxibleAppBar({super.key, this.height = 100});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.cardBackground,
      titleSpacing: 24,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '午安，使用者',
            style: TextStyle(fontSize: 14, color: AppColors.textGray),
          ),
          const SizedBox(height: 2),
          Text(
            '你的儀表板',
            style: TextStyle(
              fontSize: 24,
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.person_rounded),
          iconSize: 40,
          tooltip: '個人資料',
          onPressed: () {
            print('點擊按鈕');
          },
        ),
        SizedBox(width: 8),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
