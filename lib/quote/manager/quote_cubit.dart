import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'quote_state.dart';

class QuoteCubit extends Cubit<QuoteState> {
  QuoteCubit() : super(QuoteInitial());

  static QuoteCubit get(context) => BlocProvider.of(context);

  var apiURL = "https://type.fit/api/quotes";
  PageController controller = PageController();

  List<dynamic> favorites = [];

  void changeFavorite() {
    isFavorite = !isFavorite;
    emit(ChangeFavoriteState());
  }
addFavorite() {
    favorites.add(quoteModel);
    emit(addFavorite());
  }
  dynamic quoteModel;
 bool isFavorite= false;

  List<dynamic> postFromJson(String str) {
    List<dynamic> jsonData = json.decode(str);
    jsonData.shuffle();
    return jsonData;
  }

  Future<List<dynamic>> getQuote() async {
    final response = await http.get(Uri.parse(apiURL));
    return postFromJson(response.body);
  }
}
