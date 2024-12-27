import 'package:class_assignment_2/cubit/area_of_circle_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AreaOfCircleCubitView extends StatelessWidget {
  const AreaOfCircleCubitView({super.key});

  @override
  Widget build(BuildContext context) {
    final radiusController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Area of Circle Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Increased padding for spacing
        child: SingleChildScrollView(
          // For handling keyboard overflow
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.stretch, // Stretch children to full width
            children: [
              const SizedBox(height: 20),
              Text(
                'Enter the radius to calculate the area of the circle:',
              ),
              const SizedBox(height: 20),
              // Radius Text Field
              TextFormField(
                controller: radiusController,
                decoration: InputDecoration(
                  labelText: 'Radius',
                  border: OutlineInputBorder(),
                  prefixIcon:
                      const Icon(Icons.circle_outlined), // Icon for radius
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 20),
              // Area Display Box
              BlocBuilder<AreaOfCircleCubit, double>(
                builder: (context, area) {
                  return Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Calculated Area',
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '${area.toStringAsFixed(2)} sq. units', // Display area with 2 decimal points
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
                  final radius = double.tryParse(radiusController.text) ?? 0;
                  context.read<AreaOfCircleCubit>().calculateArea(radius);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text('Calculate Area'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
