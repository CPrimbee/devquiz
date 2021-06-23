import 'package:devquiz/core/core.dart' show AppColors;
import 'package:flutter/material.dart'
    show
        AlwaysStoppedAnimation,
        BuildContext,
        Color,
        Key,
        LinearProgressIndicator,
        StatelessWidget,
        Widget;

class ProgressIndicatorWidget extends StatelessWidget {
  final double value;
  const ProgressIndicatorWidget({Key? key, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
      backgroundColor: AppColors.chartSecondary,
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
    );
  }
}
