import 'package:bloc/bloc.dart';

class BookCubit extends Cubit<int> {
  BookCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
