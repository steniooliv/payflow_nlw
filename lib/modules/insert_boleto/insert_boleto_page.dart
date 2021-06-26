import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payflow_nlw/modules/insert_boleto/insert_boleto_controller.dart';
import 'package:payflow_nlw/shared/themes/app_colors.dart';
import 'package:payflow_nlw/shared/themes/app_text_styles.dart';
import 'package:payflow_nlw/shared/widgets/input_text/input_text_widget.dart';
import 'package:payflow_nlw/shared/widgets/set_label_buttons/set_label_buttons.dart';

class InsertBoletoPage extends StatefulWidget {
  final String? barcode;
  const InsertBoletoPage({Key? key, this.barcode}) : super(key: key);

  @override
  _InsertBoletoPageState createState() => _InsertBoletoPageState();
}

class _InsertBoletoPageState extends State<InsertBoletoPage> {
  final controller = InsertBoletoController();

  final moneyInputTextController = MoneyMaskedTextController(
    leftSymbol: "R\$",
    decimalSeparator: ",",
  );

  final dueDateInputTextController = MaskedTextController(mask: "00/00/0000");
  final barcodeInputTextController = TextEditingController();

  @override
  void initState() {
    if (widget.barcode != null) {
      barcodeInputTextController.text = widget.barcode!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(
          color: AppColors.inputs,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 93, vertical: 24),
              child: Text(
                'Preencha dos dados do boleto',
                style: TextStyles.titleBoldHeading,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          InputTextWidget(
                            label: "Nome do boleto",
                            icon: Icons.description_outlined,
                            validator: controller.validateName,
                            onChanged: (value) {
                              controller.onChange(name: value);
                            },
                          ),
                          InputTextWidget(
                            label: "Vencimento",
                            icon: FontAwesomeIcons.timesCircle,
                            controller: dueDateInputTextController,
                            validator: controller.validateVencimento,
                            onChanged: (value) {
                              controller.onChange(dueDate: value);
                            },
                          ),
                          InputTextWidget(
                            label: "Valor",
                            icon: FontAwesomeIcons.dollarSign,
                            controller: moneyInputTextController,
                            validator: (_) => controller.validateValor(
                                moneyInputTextController.numberValue),
                            onChanged: (value) {
                              controller.onChange(
                                  value: moneyInputTextController.numberValue);
                            },
                          ),
                          InputTextWidget(
                            label: "Código",
                            icon: FontAwesomeIcons.barcode,
                            controller: barcodeInputTextController,
                            validator: controller.validateCodigo,
                            onChanged: (value) {
                              controller.onChange(barcode: value);
                            },
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SetLabelButtons(
        primaryLabel: "Cancelar",
        primaryOnPressed: () {
          Navigator.pop(context);
        },
        secondaryLabel: "Cadastrar",
        secondaryOnPressed: () async {
          await controller.cadastrarBoleto();
          Navigator.pop(context);
        },
        enableSecondaryColor: true,
      ),
    );
  }
}
