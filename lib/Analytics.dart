import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Analytics extends StatefulWidget {
  const Analytics({Key? key}) : super(key: key);

  @override
  _AnalyticsState createState() => _AnalyticsState();
}

final data = <String, double>{
  "Education": 5000,
  "Entertainment": 3000,
  "Travel": 2000,
  "Food": 2000,
  "Shopping": 4000,
};

class _AnalyticsState extends State<Analytics> {
  List<MapEntry<String, double>> sortedData = [];

  @override
  void initState() {
    super.initState();
    // Sort the data in descending order of amounts
    sortedData = data.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: PieChart(
              dataMap: data,
              animationDuration: const Duration(milliseconds: 800),
          chartLegendSpacing: 32,
          chartRadius: MediaQuery.of(context).size.width / 2.2,
          colorList: Colors.accents,
          initialAngleInDegree: 0,
          chartType: ChartType.ring,
          ringStrokeWidth: 32,
          centerText: "",
          legendOptions: const LegendOptions(
            showLegendsInRow: false,
            legendPosition: LegendPosition.right,
            showLegends: true,
            legendShape: BoxShape.circle,
            legendTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          chartValuesOptions: const ChartValuesOptions(
            showChartValueBackground: true,
            showChartValues: true,
            showChartValuesInPercentage: false,
            showChartValuesOutside: false,
            decimalPlaces: 1,
          ),

              
            ),
          ),
          
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: sortedData.length,
            itemBuilder: (context, index) {
              final entry = sortedData[index];
              return ListTile(
                title: Text(entry.key, style: TextStyle(fontSize: 20),),
                subtitle: Text('\$${entry.value.toStringAsFixed(2)}',style: TextStyle(fontSize: 16)),
              );
            },
          ),
        ],
      ),
    );
  }
}


