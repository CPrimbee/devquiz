import 'package:DevQuiz/challenge/widgets/answer/answer_widget.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;
  const QuizWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 64),
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          AnswerWidget(
            title: "Kit de desenvolvimento de interface de usuário",
          ),
          AnswerWidget(
            isRight: true,
            isSelected: true,
            title: "Possibilita a criação de aplicativos compilados nativamente",
          ),
          AnswerWidget(
            title: "Acho que é uma marca de café do Himalaia",
          ),
          AnswerWidget(
            title: "Possibilita a criação de desktops que são muito incríveis",
          ),
        ],
      ),
    );
  }
}
