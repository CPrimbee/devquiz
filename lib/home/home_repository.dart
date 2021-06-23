import 'dart:convert' show jsonDecode;

import 'package:devquiz/shared/models/quiz_model.dart' show QuizModel;
import 'package:devquiz/shared/models/user_model.dart' show UserModel;
import 'package:flutter/services.dart' show rootBundle;

class HomeRepository {
  Future<UserModel> getUser() async {
    final response = await rootBundle.loadString("database/user.json");
    final user = UserModel.fromJson(response);
    return user;
  }

  Future<List<QuizModel>> getQuizzes() async {
    final response = await rootBundle.loadString("database/quizzes.json");
    final list = jsonDecode(response) as List;
    final quizzes = list.map((e) => QuizModel.fromMap(e)).toList();
    return quizzes;
  }

  Future<List<QuizModel>> getQuizzesByLevel(Level level) async {
    final response = await rootBundle.loadString("database/quizzes.json");
    final list = jsonDecode(response) as List;
    final quizzes = list
        .map((e) => QuizModel.fromMap(e))
        .where((e) => e.level == level)
        .toList();
    return quizzes;
  }
}
