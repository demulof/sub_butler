import 'package:flutter/material.dart';
import 'package:sub_butler/styles/app_colors.dart';

class PaySoonCard extends StatelessWidget {
  const PaySoonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 160,
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                spreadRadius: -1,
                blurRadius: 6,
                offset: const Offset(0, 4),
              ),
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                spreadRadius: -2,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(width: 32, height: 32, color: AppColors.urgentText),
                SizedBox(width: 12),
                Column(
                  children: [
                    Text(
                      'Netflix',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    Text(
                      'NT\$ 390',
                      style: TextStyle(fontSize: 14, color: AppColors.textGray),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  color: AppColors.urgentBackground,
                  child: Text(
                    '3 天後付款',
                    style: TextStyle(color: AppColors.urgentText),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
