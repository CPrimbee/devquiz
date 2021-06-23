import 'package:devquiz/challenge/challenge_page.dart' show ChallengePage;
import 'package:devquiz/core/core.dart' show AppColors;
import 'package:devquiz/home/home_state.dart' show HomeState;
import 'package:devquiz/home/widgets/appbar/app_bar_widget.dart'
    show AppBarWidget;
import 'package:devquiz/home/widgets/level_button/level_button_widget.dart'
    show LevelButtonWidget;
import 'package:devquiz/home/widgets/quiz_card/quiz_card_widget.dart'
    show QuizCardWidget;
import 'package:devquiz/shared/models/quiz_model.dart' show Level;
import 'package:flutter/material.dart'
    show
        AlwaysStoppedAnimation,
        BuildContext,
        Center,
        CircularProgressIndicator,
        Color,
        Column,
        EdgeInsets,
        Expanded,
        GridView,
        Key,
        MainAxisAlignment,
        MaterialPageRoute,
        Navigator,
        Padding,
        Row,
        Scaffold,
        SizedBox,
        State,
        StatefulWidget,
        Widget;

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
        appBar: AppBarWidget(
          user: controller.user!,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LevelButtonWidget(
                    label: "Fácil",
                    onTap: () => {controller.getQuizzesByLevel(Level.facil)},
                  ),
                  LevelButtonWidget(
                    label: "Médio",
                    onTap: () => {controller.getQuizzesByLevel(Level.medio)},
                  ),
                  LevelButtonWidget(
                    label: "Difícil",
                    onTap: () => {controller.getQuizzesByLevel(Level.dificil)},
                  ),
                  LevelButtonWidget(
                    label: "Perito",
                    onTap: () => {controller.getQuizzesByLevel(Level.perito)},
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  crossAxisCount: 2,
                  children: controller.quizzes!
                      .map((e) => QuizCardWidget(
                            title: e.title,
                            percent: e.questionsAnswered / e.questions.length,
                            completed:
                                "${e.questionsAnswered} de ${e.questions.length}",
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChallengePage(
                                            questions: e.questions,
                                            title: e.title,
                                          )));
                            },
                          ))
                      .toList(),
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
            child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
        )),
      );
    }
  }
}
