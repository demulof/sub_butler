import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sub_butler/styles/app_colors.dart';
import 'package:sub_butler/felxible_app_bar.dart';

void main() {
  runApp(const SubButlerApp());
}

class SubButlerApp extends StatefulWidget {
  const SubButlerApp({super.key});

  @override
  State<SubButlerApp> createState() => _SubButlerAppState();
}

class _SubButlerAppState extends State<SubButlerApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '訂閱管家',
      theme: ThemeData(fontFamily: 'NotoSansTC'),
      home: Scaffold(
        appBar: FelxibleAppBar(height: 80),
        body: Container(
          color: AppColors.background,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(children: [SizedBox(height: 28), SummaryCard()]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  '本月總支出',
                  style: TextStyle(
                    color: AppColors.textWhite80,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                const PeriodToggleButton(activePeriod: Period.month),
              ],
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
              style: activePeriod == Period.month ? boldStyle : normalStyle,
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
              style: activePeriod == Period.year ? boldStyle : normalStyle,
              // 為 '年' 這段文字加上點擊識別器
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
