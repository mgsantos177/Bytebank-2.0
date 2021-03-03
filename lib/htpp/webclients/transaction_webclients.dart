import 'dart:convert';

import 'package:bytebank/models/Transaction.dart';
import 'package:http/http.dart';

import '../web_client.dart';

const String _baseUrl = 'http://10.0.0.118:8080/transactions';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final Response response =
        await client.get(_baseUrl).timeout(Duration(seconds: 5));

    List<Transaction> transactions = _toTransactions(response);
    return transactions;
  }

  Future<Transaction> save(Transaction transaction) async {
    final String transactionJson = jsonEncode(
      transaction.toJson(),
    );

    final Response response = await client.post(_baseUrl,
        headers: {'Content-type': 'application/json', 'password': '1000'},
        body: transactionJson);

    return Transaction.fromJson(jsonDecode(response.body));
  }

  List<Transaction> _toTransactions(Response response) {
    final List<dynamic> decodedJson = jsonDecode(response.body);

    final List<Transaction> transactions =
        decodedJson.map((dynamic json) => Transaction.fromJson(json)).toList();

    // Mesma função da linha 34 a 35 feito de forma resumida
    // final List<Transaction> transactions = List();
    // for (Map<String, dynamic> transactionJson in decodedJson) {
    //   transactions.add(Transaction.fromJson(transactionJson));
    // }
    return transactions;
  }
}
