import 'package:flutter/material.dart';
import 'package:sub_butler/pay_soon_card.dart';
import 'package:sub_butler/styles/app_colors.dart';
import 'package:sub_butler/felxible_app_bar.dart';
import 'package:sub_butler/summary_card.dart';

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 28),
                    SummaryCard(),
                    SizedBox(height: 24),
                    Text(
                      '即將付款',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    SizedBox(height: 16),
                    PaySoonCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
