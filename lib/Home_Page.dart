import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/TVShows.dart';
import 'package:movie_app/Widgets/TopRatedMovies.dart';
import 'package:movie_app/Widgets/TrendingPage.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    loadMovies();
    // TODO: implement initState
    super.initState();
  }
  List trendingMovies=[];
  List topRatedMovies=[];
  List tvShows=[];
 // List videos=[];
  final String apiKey='ddc4f1e089f5087a29ae004ae72d6eb9';
  final String readAccessToken='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZGM0ZjFlMDg5ZjUwODdhMjlhZTAwNGFlNzJkNmViOSIsInN1YiI6IjYzYTQ4ZDNiZDRmZTA0MDA4MDhmNTIwNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Gw0EtDta7KDYAI7BKeRxMCd1a94B2u8gAfdLxYlbjcc';

  loadMovies() async{
    TMDB tMDBWithCustomLogs=TMDB(
                                ApiKeys(apiKey,readAccessToken),
                                logConfig: ConfigLogger(showLogs: true,showErrorLogs: true));
    Map trendingResults=await tMDBWithCustomLogs.v3.trending.getTrending();
    Map topRatedMoviesResults=await tMDBWithCustomLogs.v3.movies.getTopRated();
    Map tvShowsResults=await tMDBWithCustomLogs.v3.tv.getPopular();

    //print(tvShowsResults);
    setState((){
      trendingMovies=trendingResults['results'];
      topRatedMovies=topRatedMoviesResults['results'];
      tvShows=tvShowsResults['results'];
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Movie App'),
      ),
      body: ListView(
        children: [
          TVShows(tvShows: tvShows),
          //Divider(thickness: 1,color: Colors.grey,),
          TopRatedMovies(topRatedMovies: topRatedMovies),
          //Divider(thickness: 1,color: Colors.grey,),
          TrendingMovies(trendingMovies: trendingMovies),
        ],
      ),
    );
  }
}
