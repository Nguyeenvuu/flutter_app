import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/blocs/cast_and_crew_bloc/cast_bloc.dart';
import 'package:movie_app/blocs/cast_and_crew_bloc/cast_event.dart';
import 'package:movie_app/blocs/cast_and_crew_bloc/cast_state.dart';
import 'package:movie_app/models/Movie.dart';
import 'package:movie_app/repositories/cast_and_crew_repository.dart';
import 'package:movie_app/ui/items/cast_crew_widget.dart';
import 'package:movie_app/ui/widgets/comment_widget.dart';
import 'package:movie_app/ui/widgets/rating_widget.dart';
import 'package:movie_app/ui/widgets/related_movie_widget.dart';

class TabViewMovie extends StatelessWidget {
  Movie movie;
  TabViewMovie({this.movie});
  // This widget is the root of your application.
  final double sizeTextHeader = 14;
  CastAndCrewRepository _castrepository = new CastAndCrewRepository();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DefaultTabController(
        length: 4,
        child: SafeArea(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: AppBar(
                bottom: TabBar(
                  tabs: [
                    Tab(
                      text: "Details",
                    ),
                    Tab(
                      text: "Comments",
                    ),
                    Tab(
                      text: "Ratings",
                    ),
                    Tab(
                      text: "Related",
                    )
                  ],
                ),
                backgroundColor: Color(0xFF2d3450),
              ),
            ),
            body: TabBarView(
              children: [
                Column(children: [
                  Container(
                    color: Color(0xFF2d3450),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 17, right: 5),
                          child: Text(
                            "Actors",
                            style: TextStyle(
                              fontSize: sizeTextHeader,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: BlocProvider(
                            create: (context) => CastBloc(
                                repository: _castrepository)
                              ..add(FetchCastAndCrewEvent(movieId: movie.id)),
                            child: Container(
                              alignment: Alignment.center,
                              height: 100,
                              width: MediaQuery.of(context).size.width,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: BlocBuilder<CastBloc, CastState>(
                                  // ignore: missing_return
                                  builder: (context, state) {
                                    if (state is CastInitialState) {
                                      return CircularProgressIndicator();
                                    } else if (state is CastLoadingState) {
                                      return CircularProgressIndicator();
                                    } else if (state is CastLoadedState) {
                                      print(state.casts);
                                      return CastScreen(state.casts);
                                    } else if (state is CastErrorState) {
                                      return Center(
                                          child: Text("Feild to load !"));
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
                CommentPage(),
                RatingPage(),
                RelatedPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
