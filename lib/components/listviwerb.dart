import 'package:financial_control/components/transactioncard.dart';
import 'package:financial_control/data/data.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListViewB extends StatefulWidget {
  const ListViewB({super.key});

  @override
  State<ListViewB> createState() => _ListViewBState();
}

class _ListViewBState extends State<ListViewB> {
  @override
  Widget build(BuildContext context) {
    final Operations list = Provider.of(context);
    return Expanded(
      child: ListView.builder(
        dragStartBehavior: DragStartBehavior.start,
        itemCount: list.lista.length,
        itemBuilder: (BuildContext context, int index) {
          return TransactionCard(transaction: list.lista.elementAt(index));
        },
      ),
    );
  }
}
