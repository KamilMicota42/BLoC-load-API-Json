import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RegionEvent extends Equatable {
  const RegionEvent();
}

class LoadRegionEvent extends RegionEvent {
  @override
  List<Object?> get props => [];
}