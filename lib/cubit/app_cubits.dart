import 'package:bloc/bloc.dart';
import 'package:travel/cubit/app_cubit_states.dart';
import 'package:travel/model/data_model.dart';
import 'package:travel/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }
  final DataServices data;
  late final places;
  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch(e) {

    }
  }

  detailPage(DataModel data) {
    emit(DetailState(data));
  }

  home(){
    emit(LoadedState(places));
  }
}