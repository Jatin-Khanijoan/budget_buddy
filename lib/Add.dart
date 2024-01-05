import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController amountController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController transactionToController = TextEditingController();
  TextEditingController transactionRefNoController = TextEditingController();

 String selectedCategory = 'Others';
List<String> categories = ['Travel','Shopping','Education','Food', 'Groceries', 'Entertainment', 'Others'];

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Add Transaction', 
                style: TextStyle(fontSize: 30.0, 
                fontWeight: FontWeight.bold,
                
                )),
                const SizedBox(height: 20.0,),
                TextFormField(
                  controller: amountController,
                  decoration: InputDecoration(labelText: 'Amount', 
                  border: const OutlineInputBorder(),
                   enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(50.0)
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an amount';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18.0),
                 TextFormField(
                  controller: categoryController,
                  decoration: InputDecoration(labelText: 'Category', 
                  border: const OutlineInputBorder(),
                   enabledBorder: OutlineInputBorder(
                    borderSide:const  BorderSide(width: 3, color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(50.0)
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an amount';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18.0),
                TextFormField(
                  controller: transactionToController,
                  decoration: InputDecoration(labelText: 'Transaction To',
                  border: const OutlineInputBorder(),
                   enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(50.0)
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the transaction recipient';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18.0),
                TextFormField(
                  controller: transactionRefNoController,
                  decoration: InputDecoration(labelText: 'Transaction Ref No.', 
                  border: const OutlineInputBorder(),
                   enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(50.0)
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the transaction reference number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 18.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      sendTransactionData();
                    }
                  },
                  child: const Text('Add Transaction'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void sendTransactionData() async {
    Map<String, dynamic> transactionData = {
      'amount': amountController.text,
      'category': categoryController.text,
      'transactionTo': transactionToController.text,
      'transactionRefNo': transactionRefNoController.text,
      "user": {
        "id" : 1
      }
    };

    String jsonData = jsonEncode(transactionData);


    final response = await http.post(
      Uri.parse('http://192.168.230.6:8080/api/transactions/add'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonData,
    );

    if (response.statusCode == 201) {
      print('Transaction data sent successfully');
    } else {
      print('Error sending transaction data: ${response.statusCode}');
    }

    amountController.clear();
    categoryController.clear();
    transactionToController.clear();
    transactionRefNoController.clear();
  }
}
