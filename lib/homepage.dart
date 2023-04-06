import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/bloc/app_blocs.dart';
import 'package:my_app/bloc/app_states.dart';
import 'package:my_app/bloc/app_events.dart';
import 'package:my_app/repo/repository.dart';
import 'package:my_app/models/region_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegionBloc>(
          create: (BuildContext context) => RegionBloc(RegionRepository()),
        ),
      ],
      child: Scaffold(
        body: blocBody(),
      ),
    );
  }

  Widget blocBody() {
    return BlocProvider(
      create: (context) => RegionBloc(
        RegionRepository(),
      )..add(LoadRegionEvent()),
      child: BlocBuilder<RegionBloc, RegionState>(
        builder: (context, state) {
          if (state is RegionLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is RegionErrorState) {
            return Center(child: Text(state.error));
          }
          if (state is RegionLoadedState) {
            List<ContinentModel> continents = state.continents;
            return ListView.builder(
                itemCount: continents[0].countries?.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Card(
                        color: Theme.of(context).primaryColor,
                        child: ListTile(
                          title: Text(
                            '${continents[0].countries?[index].name}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        )),
                  );
                });
          }
          return Container();
        },
      ),
    );
  }
}
