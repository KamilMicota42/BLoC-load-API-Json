import 'app_events.dart';
import 'app_states.dart';
import 'package:my_app/repo/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegionBloc extends Bloc<RegionEvent, RegionState> {
  final RegionRepository _regionRepository;

  RegionBloc(this._regionRepository) : super(RegionLoadingState()) {
    on<LoadRegionEvent>((event, emit) async {
      emit(RegionLoadingState());
      try {
        final regions = await _regionRepository.getRegion();
        emit(RegionLoadedState(regions));
      } catch (e) {
        emit(RegionErrorState(e.toString()));
      }
    });
  }
}