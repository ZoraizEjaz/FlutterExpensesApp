import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transcations;
  final Function deleteTx;
  
  TransactionList(@required this.transcations, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transcations.isEmpty
          ? LayoutBuilder(builder: (ctx, constraints){
            return  Column(
              children: <Widget>[
                Text(
                  'No transaction has been added yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                            child: Text('\$${transcations[index].amount}')),
                      ),
                    ),
                    title: Text(
                      transcations[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transcations[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deleteTx(transcations[index].id),
                      //we can not use deleteTx only here 
                      //as this function is present in main.dart file
                      //we have to make it anonymous function
                    ),
                  ),
                );
              },
              itemCount: transcations.length,
            );
   
  }
}
