import 'package:class_assignment_2/cubit/student_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentCubitView extends StatelessWidget {
  const StudentCubitView({super.key});
 
  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final ageController = TextEditingController();
    final addressController = TextEditingController();
 
    void addStudent() {
      final name = nameController.text.trim();
      final age = ageController.text.trim();
      final address = addressController.text.trim();
 
      if (name.isNotEmpty && age.isNotEmpty && address.isNotEmpty) {
        context.read<StudentCubit>().addStudent(name, age, address);
        nameController.clear();
        ageController.clear();
        addressController.clear();
      }
    }
 
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Cubit'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: addStudent,
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<StudentCubit, List<Map<String, String>>>(
                builder: (context, students) {
                  if (students.isEmpty) {
                    return const Center(
                      child: Text('No students added yet'),
                    );
                  }
                  return ListView.builder(
                    itemCount: students.length,
                    itemBuilder: (context, index) {
                      final student = students[index];
                      return ListTile(
                        title: Text(student['name'] ?? ''),
                        subtitle: Text(
                          'Age: ${student['age']}, Address: ${student['address']}',
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}