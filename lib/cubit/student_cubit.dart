import 'package:flutter_bloc/flutter_bloc.dart';

class StudentCubit extends Cubit<List<Map<String, String>>> {
  StudentCubit() : super([]);
 
  void addStudent(String name, String age, String address) {
    final updatedList = List<Map<String, String>>.from(state);
    updatedList.add({'name': name, 'age': age, 'address': address});
    emit(updatedList);
  }
}