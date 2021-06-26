import 'package:flutter/material.dart';
import 'package:payflow_nlw/shared/themes/app_colors.dart';
import 'package:payflow_nlw/shared/themes/app_text_styles.dart';
import 'package:payflow_nlw/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:payflow_nlw/shared/widgets/boleto_list/boleto_list_widget.dart';

class ExtractPagePage extends StatefulWidget {
  const ExtractPagePage({Key? key}) : super(key: key);

  @override
  _ExtractPagePageState createState() => _ExtractPagePageState();
}

class _ExtractPagePageState extends State<ExtractPagePage> {
  final controller = BoletoListController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
            child: Row(
              children: [
                Text(
                  "Meus extratos",
                  style: TextStyles.titleBoldHeading,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Divider(
              color: AppColors.stroke,
              thickness: 1,
              height: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: BoletoListWidget(
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}
