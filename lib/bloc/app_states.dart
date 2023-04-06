import 'package:my_app/models/region_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RegionState extends Equatable {}

class RegionLoadingState extends RegionState {
  @override
  List<Object?> get props => [];
}

class RegionLoadedState extends RegionState {
  final List<ContinentModel> regions;
  RegionLoadedState(this.regions);
  @override
  List<Object?> get props => [regions];
}

class RegionErrorState extends RegionState {
  final String error;
  RegionErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
