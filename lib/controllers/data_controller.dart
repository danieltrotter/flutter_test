import 'package:flutter_ptb/models/data_model.dart';
import 'package:flutter_ptb/utils/httphandler.dart';
import 'package:flutter_ptb/models/movie_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DataController extends GetxController {
  final Rx<DataModel> _dataModel = DataModel(items: []).obs;
  final Rx<MovieModel> _movieModel = MovieModel().obs;
  final Rx<bool> fadeFlag = false.obs;
  final Rx<bool> loading = false.obs;

  DataModel get dataModel => _dataModel.value;
  MovieModel get movieModel => _movieModel.value;
  final HttpHandler _httpHandler = HttpHandler();
  @override
  void onInit() {
    initData();
    super.onInit();
  }

  Future<DataModel> initData() async {
    loading.value = true;
    final response = await _httpHandler.getData();
    setSelected(response.items[0]);
    loading.value = false;
    return _dataModel(response);
  }

  setSelected(MovieModel movie) {
    _movieModel.value = movie;
  }

  switchFade() {
    fadeFlag.value = !fadeFlag.value;
  }
}
