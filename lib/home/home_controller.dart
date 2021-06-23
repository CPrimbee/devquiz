import 'package:devquiz/home/home_state.dart' show HomeState;
import 'package:devquiz/shared/models/quiz_model.dart' show Level, QuizModel;
import 'package:devquiz/shared/models/user_model.dart' show UserModel;
import 'package:flutter/widgets.dart' show ValueNotifier;

import 'home_repository.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  void getUser() async {
    state = HomeState.loading;
    user = await repository.getUser();
    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    quizzes = await repository.getQuizzes();
    state = HomeState.success;
  }

  void getQuizzesByLevel(Level level) async {
    state = HomeState.loading;
    quizzes = await repository.getQuizzesByLevel(level);
    state = HomeState.success;
  }
}
