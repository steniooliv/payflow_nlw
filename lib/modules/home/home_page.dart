import 'package:flutter/material.dart';
import 'package:payflow_nlw/modules/extract/extract_page.dart';
import 'package:payflow_nlw/modules/home/home_controller.dart';
import 'package:payflow_nlw/modules/meus_boletos/meus_boletos_page.dart';
import 'package:payflow_nlw/shared/models/user_model.dart';
import 'package:payflow_nlw/shared/themes/app_colors.dart';
import 'package:payflow_nlw/shared/themes/app_text_styles.dart';

class HomePage extends StatefulWidget {
  final UserModel user;

  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.2),
        child: Container(
          height: size.height * 0.2,
          color: AppColors.primary,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
              child: ListTile(
                title: Text.rich(
                  TextSpan(
                    text: 'Olá, ',
                    style: TextStyles.titleRegular,
                    children: [
                      TextSpan(
                        text: '${widget.user.name}',
                        style: TextStyles.titleBoldHeading,
                      ),
                    ],
                  ),
                ),
                subtitle: Text(
                  'Mantenha as suas contas em dia',
                  style: TextStyles.captionShape,
                ),
                trailing: Container(
                  width: size.width * 0.12,
                  height: size.height * 0.06,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(widget.user.photoURL!),
                      )),
                ),
              ),
            ),
          ),
        ),
      ),
      body: [
        MeusBoletosPage(
          key: UniqueKey(),
        ),
        ExtractPagePage(
          key: UniqueKey(),
        ),
      ][controller.currentPage],
      bottomNavigationBar: Container(
        height: size.height * 0.10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                controller.setPage(0);
                setState(() {});
              },
              icon: Icon(Icons.home),
              color: controller.currentPage == 0
                  ? AppColors.primary
                  : AppColors.body,
            ),
            SizedBox(
              width: size.width * 0.07,
            ),
            InkWell(
              onTap: () async {
                await Navigator.pushNamed(context, '/barcode_scanner');
                setState(() {});
              },
              child: Container(
                width: size.width * 0.14,
                height: size.height * 0.07,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(
                  Icons.add_box_outlined,
                  color: AppColors.background,
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.07,
            ),
            IconButton(
              onPressed: () {
                controller.setPage(1);
                setState(() {});
              },
              icon: Icon(Icons.description_outlined),
              color: controller.currentPage == 1
                  ? AppColors.primary
                  : AppColors.body,
            ),
          ],
        ),
      ),
    );
  }
}
