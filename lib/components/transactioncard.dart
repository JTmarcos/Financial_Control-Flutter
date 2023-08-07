import 'package:financial_control/components/expandableText.dart';
import 'package:financial_control/data/data.dart';
import 'package:financial_control/models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({super.key, required this.transaction});

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    final Operations remove = Provider.of(context);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SizedBox(
        height: 50,
        child: Expanded(
            child: Card(
          color: const Color.fromARGB(255, 216, 213, 213),
          child: Row(
            children: [
              SizedBox(width: constraints.maxWidth * 0.08,),
               SizedBox(
                width: constraints.maxWidth * 0.21,
                child:   ExpandableText(text: transaction.description, maxLines: 3),
              ),
             
             
              SizedBox(width: constraints.maxWidth * 0.20,child: Center(child: Text(transaction.value.toString()))),
               SizedBox(width: constraints.maxWidth * 0.27,
               child:transaction.type
                  ? const Center(child: Icon(Icons.arrow_circle_up_rounded, color: Colors.green,))
                  : const Center(child: Icon(Icons.arrow_circle_down_rounded,color: Colors.red,)) ,),
                  SizedBox(width: constraints.maxWidth * 0.019,),
              
              
               IconButton(
                  onPressed: () {
                    remove.removeTransaction(transaction);
                  },
                  icon: const Icon(Icons.delete))
              
              
            ],
          ),
        )),
      );
      },
    );
      
    
  }
}
