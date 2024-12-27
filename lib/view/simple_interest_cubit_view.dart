import 'package:class_assignment_2/cubit/simple_interest_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleInterestCubitView extends StatelessWidget {
  const SimpleInterestCubitView({super.key});

  @override
  Widget build(BuildContext context) {
    final principalController = TextEditingController();
    final rateController = TextEditingController();
    final timeController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Interest Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Increased padding
        child: SingleChildScrollView( // To handle keyboard overflow
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch children to full width
            children: [
              const SizedBox(height: 20),
              Text(
                'Enter the details to calculate Simple Interest:',
              ),
              const SizedBox(height: 20),
              // Principal Text Field
              TextFormField(
                controller: principalController,
                decoration: InputDecoration(
                  labelText: 'Principal Amount',
                  border: OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.attach_money),
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),
              // Rate of Interest Text Field
              TextFormField(
                controller: rateController,
                decoration: InputDecoration(
                  labelText: 'Rate of Interest (%)',
                  border: OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.percent),
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),
              // Time Text Field
              TextFormField(
                controller: timeController,
                decoration: InputDecoration(
                  labelText: 'Time (Years)',
                  border: OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.timer),
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 20),
              // Result Display
              BlocBuilder<SimpleInterestCubit, double>(
                builder: (context, result) {
                  return Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Calculated Simple Interest'
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '₹ ${result.toStringAsFixed(2)}', // Rounded to 2 decimal places
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              // Calculate Button
              ElevatedButton(
                onPressed: () {
                  final principal =
                      double.tryParse(principalController.text) ?? 0;
                  final rate = double.tryParse(rateController.text) ?? 0;
                  final time = double.tryParse(timeController.text) ?? 0;
                  context.read<SimpleInterestCubit>().calculateInterest(principal, rate, time);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text('Calculate Interest'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
