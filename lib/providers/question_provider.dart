import 'package:flutter/cupertino.dart';
import 'package:quiz_game/repositories/question_repo.dart';

import '../models/question_model.dart';

class QuestionProvider extends ChangeNotifier{
  List<Question> listData = [];
  int currentData = 1;
  void setCurrentData(int page) {
    currentData = page + 1;
    notifyListeners();
  }

  Future<List<Question>> getQuestionList(int idTopic) async {
    List<Question> data = await QuestionRepository().getQuestion(idTopic);
    listData = data;
    setCurrentData(0);
    return data;
  }
}