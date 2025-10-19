import 'package:flutter/foundation.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/usecases/get_users.dart';

enum UserLoadingState { initial, loading, loaded, error }

class UserProvider with ChangeNotifier {
  final GetUsers getUsers;

  UserProvider({required this.getUsers});

  List<UserProfile> _users = [];
  UserLoadingState _state = UserLoadingState.initial;
  String? _errorMessage;

  List<UserProfile> get users => _users;
  UserLoadingState get state => _state;
  String? get errorMessage => _errorMessage;

  Future<void> fetchUsers() async {
    _state = UserLoadingState.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      _users = await getUsers();
      _state = UserLoadingState.loaded;
      _errorMessage = null;
    } catch (e) {
      _state = UserLoadingState.error;
      _errorMessage = e.toString();
      _users = [];
    }
    notifyListeners();
  }

  void toggleLike(String userId) {
    final index = _users.indexWhere((user) => user.id == userId);
    if (index != -1) {
      _users[index].isLiked = !_users[index].isLiked;
      notifyListeners();
    }
  }

  UserProfile? getUserById(String userId) {
    try {
      return _users.firstWhere((user) => user.id == userId);
    } catch (e) {
      return null;
    }
  }
}
