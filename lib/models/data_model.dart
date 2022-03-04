import 'package:flutter_ptb/models/movie_model.dart';

class DataModel {
  DataModel({
    required this.items,
  });

  List<MovieModel> items;

  factory DataModel.fromJson(Map<String, dynamic> json) {
    final itemsData = json['items'] as List<dynamic>?;
    final items = itemsData != null
        ? itemsData.map((itemData) => MovieModel.fromJson(itemData)).toList()
        : <MovieModel>[];
    return DataModel(
      items: items,
    );
  }
  Map<String, dynamic> toJson() => {
        "items": items.map((e) => e.toJson()).toList(),
      };
}
