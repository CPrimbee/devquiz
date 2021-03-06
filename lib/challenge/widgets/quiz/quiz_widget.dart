import 'package:devquiz/challenge/widgets/answer/answer_widget.dart'
    show AnswerWidget;
import 'package:devquiz/core/core.dart' show AppTextStyles;
import 'package:devquiz/shared/models/answer_model.dart' show AnswerModel;
import 'package:devquiz/shared/models/question_model.dart' show QuestionModel;
import 'package:flutter/material.dart'
    show
        BuildContext,
        Column,
        Container,
        Key,
        SizedBox,
        State,
        StatefulWidget,
        Text,
        ValueChanged,
        Widget;

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;
  const QuizWidget({Key? key, required this.question, required this.onSelected})
      : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;
  AnswerModel answer(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 64,
          ),
          Text(
            widget.question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          for (var i = 0; i < widget.question.answers.length; i++)
            AnswerWidget(
              answer: answer(i),
              isSelected: indexSelected == i,
              disabled: indexSelected != -1,
              onTap: (value) {
                indexSelected = i;
                setState(() {});
                Future.delayed(Duration(seconds: 1))
                    .then((_) => widget.onSelected(value));
              },
            ),
        ],
      ),
    );
  }
}
