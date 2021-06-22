import 'package:flutter/material.dart';
import 'package:payflow_nlw/shared/themes/app_colors.dart';
import 'package:payflow_nlw/shared/themes/app_images.dart';
import 'package:payflow_nlw/shared/themes/app_text_styles.dart';

class SocialLoginButton extends StatelessWidget {
  final VoidCallback onTap;

  const SocialLoginButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: onTap,
      child: Container(
        height: size.height * 0.07,
        decoration: BoxDecoration(
            color: AppColors.shape,
            borderRadius: BorderRadius.circular(5),
            border: Border.fromBorderSide(
              BorderSide(color: AppColors.stroke),
            )),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.google),
                  SizedBox(
                    width: size.width * 0.07,
                  ),
                  Container(
                    height: size.height * 0.07,
                    width: 1,
                    color: AppColors.stroke,
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Entrar com Google",
                    style: TextStyles.buttonGray,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
