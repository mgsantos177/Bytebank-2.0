import 'package:bytebank/components/centered_message.dart';
import 'package:bytebank/components/progress.dart';
import 'package:bytebank/htpp/webclients/transaction_webclients.dart';
import 'package:bytebank/models/Transaction.dart';
import 'package:flutter/material.dart';

class TransactionsList extends StatefulWidget {
  @override
  _TransactionsListState createState() => _TransactionsListState();
}

class _TransactionsListState extends State<TransactionsList> {
  final TransactionWebClient _transactionWebClient = TransactionWebClient();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Transactions'),
        ),
        body: FutureBuilder<List<Transaction>>(
            future: Future.delayed(
              Duration(seconds: 1),
            ).then((onValue) => _transactionWebClient.findAll()),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  // TODO: Handle this case.
                  break;
                case ConnectionState.waiting:
                  return Progress(
                    message: 'Chama Fio',
                  );
                  // TODO: Handle this case.
                  break;
                case ConnectionState.active:
                  // TODO: Handle this case.
                  break;
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    final List<Transaction> transactions = snapshot.data;
                    if (transactions.isNotEmpty) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          final Transaction transaction = transactions[index];
                          return Card(
                            child: ListTile(
                              leading: Icon(Icons.monetization_on),
                              title: Text(
                                transaction.value.toString(),
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                transaction.contact.accountNumber.toString(),
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: transactions.length,
                      );
                    }
                  } else {
                    return CenteredMessage(
                      'No transactions found',
                      icon: Icons.warning,
                      iconSize: 48,
                    );
                  }

                  break;
              }

              return CenteredMessage(
                'Unkwnow Error',
                icon: Icons.warning,
              );
            }));
  }
}
