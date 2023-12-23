import 'package:bloc/bloc.dart';

class LibraryCubit extends Cubit<int> {
  LibraryCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
