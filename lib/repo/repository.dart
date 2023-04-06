import 'dart:convert';
import 'package:http/http.dart';

import 'package:my_app/models/region_model.dart';

class RegionRepository {
  String regionUrl = 'https://crmdev.personate.io/api/v1/catalog/catalog-entries/regions';

  Future<List<ContinentModel>> getRegion() async {
    Response response = await get(Uri.parse(regionUrl));
   
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];


      return result.map((e) => ContinentModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}