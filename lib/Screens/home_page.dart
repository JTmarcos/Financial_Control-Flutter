import 'package:financial_control/components/listviwerb.dart';
import 'package:financial_control/data/data.dart';
import 'package:financial_control/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double entrys = context.watch<Operations>().entry;
    double total = context.watch<Operations>().total;
    double outflow = context.watch<Operations>().outflow;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          body: Stack(
            children: [
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                color: const Color.fromRGBO(220, 219, 218, 1),
              ),
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight * 0.2,
                color: const Color.fromRGBO(01, 82, 81, 1),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Controle Financeiro",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 25),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        color: Colors.white,
                        child: SizedBox(
                          width: constraints.maxWidth * 0.4,
                          height: constraints.maxHeight * 0.12,
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Entradas'),
                                      Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              16, 8, 30, 30)),
                                      Icon(
                                        Icons.arrow_circle_up_rounded,
                                        color: Colors.green,
                                      ),
                                    ],
                                  ),
                                  const Padding(padding: EdgeInsets.all(8)),
                                  Text(
                                    entrys.toString(),
                                    style: const TextStyle(fontSize: 20),
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        color: Colors.white,
                        child: SizedBox(
                          width: constraints.maxWidth * 0.4,
                          height: constraints.maxHeight * 0.12,
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Saídas'),
                                      Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              29, 8, 30, 30)),
                                      Icon(
                                        Icons.arrow_circle_down_rounded,
                                        color: Colors.red,
                                      ),
                                    ],
                                  ),
                                  const Padding(padding: EdgeInsets.all(8)),
                                  Text(outflow.toString(),
                                      style: const TextStyle(fontSize: 20),
                                      overflow: TextOverflow.ellipsis)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        color: Colors.white,
                        child: SizedBox(
                          width: constraints.maxWidth * 0.4,
                          height: constraints.maxHeight * 0.12,
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Total'),
                                      Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              40, 8, 30, 30)),
                                      Icon(
                                        Icons.monetization_on,
                                      ),
                                    ],
                                  ),
                                  const Padding(padding: EdgeInsets.all(8)),
                                  Text(total.toString(),
                                      style: const TextStyle(fontSize: 20),
                                      overflow: TextOverflow.ellipsis)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.white,
                    height: constraints.maxHeight * 0.55,
                    width: constraints.maxWidth * 0.9,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(width: constraints.maxWidth * 0.02,),
                              SizedBox(
                                width: constraints.maxWidth * 0.28,
                                child: const Text(
                                  'Descrição',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: constraints.maxWidth * 0.20,
                                child: const Text("Valor",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(
                                width: constraints.maxWidth * 0.15,
                                child: const Text('Tipo',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(
                                width: constraints.maxWidth * 0.20,
                                child: const Center(child: Icon(Icons.delete)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: constraints.maxWidth,
                          height: 1,
                          color: const Color.fromRGBO(220, 219, 218, 1),
                        ),
                        const ListViewB()
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color.fromRGBO(01, 82, 81, 1),
            onPressed: () {
              Navigator.pushNamed(context, Routes.formPage);
            },
            child: const Icon(
              Icons.add,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        );
      },
    );
  }
}
