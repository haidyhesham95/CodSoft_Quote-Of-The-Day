import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_of_the_day/quote/manager/quote_cubit.dart';
import 'package:quote_of_the_day/quote/widget/arrow_icon.dart';
import 'package:share/share.dart';
import '../widget/app_bar.dart';
import '../widget/icon_widget.dart';
import '../widget/quote_widget.dart';
import 'fav_page.dart';

class QuotePage extends StatelessWidget {
  const QuotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuoteCubit, QuoteState>(
        listener: (context, state) {},
    builder: (context, state) {
    QuoteCubit cubit = QuoteCubit.get(context);
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: quoteAppBar(context, 'Quotes of the Day', hasElevation: true,
            onPressed: () { Navigator.push( context, MaterialPageRoute(
                builder: (context) => FavPage(
                      favorites:cubit.favorites,
                    )));
        }),
        body: FutureBuilder<List<dynamic>>(
            future: cubit.getQuote(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return ErrorWidget(snapshot.error.toString());}
                return PageView.builder(
                    controller:cubit.controller,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                     cubit. quoteModel = snapshot.data![index];
                      bool isFavorite = cubit.favorites.contains(cubit.quoteModel);
                      return Container(
                        height: MediaQuery.of(context).size.height,
                        width: double.infinity,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Spacer(),
                            QuoteWidget(
                              quote:cubit. quoteModel["text"].toString(),
                              author: cubit.quoteModel["author"].toString(),
                              onNextClick: () {
                                cubit.   controller.nextPage(
                                    duration: const Duration(milliseconds: 100),
                                    curve: Curves.easeIn);
                                },
                            ),
                            const Spacer(),
                            Container(
                              margin: const EdgeInsets.only(bottom: 30),
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    ArrowIcon(
                                      onPressed: () {
                                        cubit. controller.previousPage(
                                            duration: const Duration(seconds: 1),
                                            curve: Curves.easeOut);
                                      },
                                      icon: Icons.navigate_before,
                                    ),
                                  IconWidget(
                                    onPressed: () {

                                     cubit.changeFavorite();

                                        if (cubit.favorites.contains(cubit.quoteModel)) {
                                          cubit.addFavorite();
                                        } else {
                                          cubit. favorites.add(cubit.quoteModel);
                                        }
                                    },
                                    icon: isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_outline_rounded,
                                  ),
                                  IconWidget(
                                    onPressed: () {
                                      Share.share(
                                        '-${cubit.quoteModel['text']}\n-${cubit.quoteModel['author']}',
                                      );
                                    },
                                    icon: Icons.share,
                                  ),
                                    ArrowIcon(
                                      onPressed: () {
                                        cubit. controller.nextPage(
                                            duration: const Duration(seconds: 1),
                                            curve: Curves.easeIn);
                                      },
                                      icon: Icons.navigate_next,
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              } else {
                return  const Center(
                    child: CircularProgressIndicator(
                  color: Colors.brown,
                ));
              }
            }),
      );
    });
  }
}
