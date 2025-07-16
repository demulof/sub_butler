import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sub_butler/styles/app_colors.dart';

class SummaryCard extends StatefulWidget {
  const SummaryCard({super.key});

  @override
  State<SummaryCard> createState() => _SummaryCardState();
}

class _SummaryCardState extends State<SummaryCard> {
  Period _activePeriod = Period.month;
  @override
  Widget build(BuildContext context) {
    final String periodText = _activePeriod == Period.month ? '月' : '年';
    final double differenceAmount = 150;
    final double summaryValue = 2480;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '本$periodText總支出',
                  style: TextStyle(
                    color: AppColors.textWhite80,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                PeriodToggleButton(
                  activePeriod: _activePeriod,
                  onMonthTap: () {
                    setState(() {
                      _activePeriod = Period.month;
                    });
                  },
                  onYearTap: () {
                    setState(() {
                      _activePeriod = Period.year;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'NT\$ $summaryValue',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: AppColors.textWhite,
              ),
            ),
            Text(
              '比上個$periodText多 NT\$ $differenceAmount',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textWhite80,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum Period { month, year }

class PeriodToggleButton extends StatelessWidget {
  final Period activePeriod;
  final VoidCallback? onMonthTap;
  final VoidCallback? onYearTap;

  const PeriodToggleButton({
    super.key,
    required this.activePeriod,
    this.onMonthTap,
    this.onYearTap,
  });

  @override
  Widget build(BuildContext context) {
    const normalStyle = TextStyle(color: AppColors.textWhite80);
    final boldStyle = TextStyle(
      color: AppColors.textWhite,
      fontWeight: FontWeight.bold,
    );

    return Container(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 12,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.cardBackground20,
      ),
      child: Text.rich(
        TextSpan(
          style: normalStyle,
          children: [
            TextSpan(
              text: '月',
              style: activePeriod == Period.month ? boldStyle : null,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  if (activePeriod != Period.month) {
                    onMonthTap?.call();
                  }
                },
            ),
            const TextSpan(text: ' / '),
            TextSpan(
              text: '年',
              style: activePeriod == Period.year ? boldStyle : null,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  if (activePeriod != Period.year) {
                    onYearTap?.call();
                  }
                },
            ),
          ],
        ),
      ),
    );
  }
}
