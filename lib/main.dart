import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearna_assessment/core/network/api_service.dart';
import 'package:ulearna_assessment/features/reels/data/repositories/reels_repository.dart';
import 'package:ulearna_assessment/features/reels/presentation/blocs/reels_bloc.dart';
import 'package:ulearna_assessment/features/reels/presentation/pages/reels_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812), // Adjust according to your design
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (context, child) {
        return MaterialApp(
          title: 'UlearnA Assessment',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
            useMaterial3: true,
          ),
          home: BlocProvider(
            create: (context) => ReelsBloc(
              ReelsRepositoryImpl(apiService: ReelApiService()),
            ),
            child: ReelsPage(),
          ),
        );
      },
    );
  }
}
