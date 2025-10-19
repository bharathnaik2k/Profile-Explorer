import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<UserProfile>> getUsers() async {
    try {
      final userModels = await remoteDataSource.fetchUsers();
      return userModels.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw Exception('Failed to get users: $e');
    }
  }
}
