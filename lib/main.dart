import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'data/datasources/user_remote_data_source.dart';
import 'data/repositories/user_repository_impl.dart';
import 'domain/usecases/get_users.dart';
import 'presentation/providers/user_provider.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final remoteDataSource = UserRemoteDataSourceImpl(
      client: http.Client(),
    );

    final userRepository = UserRepositoryImpl(
      remoteDataSource: remoteDataSource,
    );

    final getUsersUseCase = GetUsers(
      repository: userRepository,
    );

    return ChangeNotifierProvider(
      create: (_) => UserProvider(getUsers: getUsersUseCase),
      child: MaterialApp(
        title: 'Profile Explorer',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
