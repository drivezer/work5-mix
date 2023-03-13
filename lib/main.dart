import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yumyum_flutter/bottom_menu.dart';
import 'package:yumyum_flutter/contact-detail.screen.dart';

import 'bottom_menu.provider.dart';
import 'calculate-triangle.screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: BottomMenuProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: Colors.black,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(background: Colors.grey[200]),
          dialogTheme:
              const DialogTheme().copyWith(backgroundColor: Colors.white),
          scaffoldBackgroundColor: Colors.grey[200],
          fontFamily: 'Itim',
        ),
        home: const BottomNavBar(),
        routes: {
          ContactDetail.routeName: (context) => const ContactDetail(),
          CalculateTriangleScreen.routeName: (context) =>
              const CalculateTriangleScreen(),
        },
      ),
    );
  }
}
