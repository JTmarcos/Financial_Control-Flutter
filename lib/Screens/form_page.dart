import 'package:financial_control/data/data.dart';
import 'package:financial_control/models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  valueValidator(String? value) {
    if ((value != null && value.isEmpty) || value?.trim() == '') {
      return true;
    } else {
      return false;
    }
  }

  final moneyFormatter =
      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$'));

  List<String> lista = ["Entrada", "Saída"];

  final dropDownValue = ValueNotifier('');
  final _formKey = GlobalKey<FormState>();
  final types = ['Entrada', 'Saída'];

  final TextEditingController descriptionController = TextEditingController();

  final TextEditingController operationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Operations functions = Provider.of(context);

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(01, 82, 81, 1),
          title: const Text(
            "Transação",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
            child: SingleChildScrollView(
                child: Container(
          color: const Color.fromRGBO(220, 219, 218, 1),
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (String? value) {
                      if (valueValidator(value)) {
                        return 'Insira a descrição da transação';
                      }
                      return null;
                    },
                    controller: descriptionController,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Descrição',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (String? value) {
                      if (valueValidator(value)) {
                        return 'Insira um valor ';
                      }
                      return null;
                    },
                    controller: operationController,
                    textAlign: TextAlign.center,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [moneyFormatter],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Valor',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                ValueListenableBuilder(
                  valueListenable: dropDownValue,
                  builder: (BuildContext context, String value, _) {
                    return SizedBox(
                      width: 240,
                      child: DropdownButtonFormField<String>(
                        validator: (String? value) {
                          // ignore: unrelated_type_equality_checks
                          if (value == null) {
                            return "Escolha um tipo de transação";
                          }
                          return null;
                        },
                        icon: const Icon(Icons.menu),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusColor: const Color.fromRGBO(220, 219, 218, 1),
                            labelText: "tipo",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5))),
                        isExpanded: true,
                        hint: const Text("Escolha o tipo"),
                        value: (value.isEmpty) ? null : value,
                        onChanged: (choose) =>
                            dropDownValue.value = choose.toString(),
                        items: types
                            .map((option) => DropdownMenuItem(
                                  value: option,
                                  child: Text(option),
                                ))
                            .toList(),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        bool dropValue =
                            dropDownValue.value == "Entrada" ? true : false;

                        final Transaction newOperation = Transaction(
                            double.parse(operationController.text),
                            descriptionController.text,
                            dropValue);
                        if (dropValue) {
                          context.read<Operations>().addEntrys(
                                double.parse(operationController.text),
                              );
                        } else {
                          context.read<Operations>().addOutflow(
                              double.parse(operationController.text));
                        }

                        functions.setTotal(
                            double.parse(operationController.text), dropValue);

                        functions.addTransaction(newOperation);

                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Salvar"))
              ],
            ),
          ),
        ))),
      );
    });
  }
}
