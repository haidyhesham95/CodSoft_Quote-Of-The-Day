part of 'quote_cubit.dart';

@immutable
abstract class QuoteState {}

class QuoteInitial extends QuoteState {}
class ChangeFavoriteState extends QuoteState {}
class addFavorite extends QuoteState {}

