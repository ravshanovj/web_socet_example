import 'package:flutter/material.dart';

import 'animation_button_effect.dart';
import 'loading.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final bool isLoading;

  const CustomButton(
      {Key? key,
      required this.onTap,
      required this.title,
      this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: AnimationButtonEffect(
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Theme.of(context).primaryColor),
          child: Center(
            child: isLoading
                ? const Loading()
                : Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
          ),
        ),
      ),
    );
  }
}
