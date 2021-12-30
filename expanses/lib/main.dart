import 'package:expanses/components/chart.dart';
import 'package:expanses/components/transaction_form.dart';
import 'package:flutter/material.dart';
import '/components/transaction_form.dart';
import '/components/transaction_list.dart';
import 'models/transaction.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExpansesApp(),
    ),
  );
}

class ExpansesApp extends StatelessWidget {
  const ExpansesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
          // primaryColor define uma cor fixa para o tema do app, primarySwatch define uma cor padrão e dependendo do componente o tom varia
          primarySwatch: Colors.purple,
          // cor de destaque/realce
          accentColor: Colors.amber,
          fontFamily: 'Quicksand'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 1,
      title: 'Conta de Luz',
      value: 310.76,
      date: DateTime.now().subtract(Duration(days: 33)),
    ),
    Transaction(
      id: 2,
      title: 'Conta de Água',
      value: 210.00,
      date: DateTime.now().subtract(Duration(days: 4)),
    ),
    Transaction(
      id: 2,
      title: 'Conta de Água',
      value: 410.00,
      date: DateTime.now(),
    ),
  ];

  List<Transaction> get _recentTransactions {
    return _transactions
        .where(
          (tr) => tr.date.isAfter(
            DateTime.now().subtract(
              Duration(
                days: 7,
              ),
            ),
          ),
        )
        .toList();
  }

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toInt(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
        title: Text(
          'Despesas Pessoais',
          style: TextStyle(
            fontFamily: 'OpenSans',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _openTransactionFormModal(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(_recentTransactions),
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
