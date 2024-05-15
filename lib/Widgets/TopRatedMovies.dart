import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/MoviesDescription.dart';
import 'package:movie_app/utils/ModifiedText.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TopRatedMovies extends StatefulWidget {
  final List topRatedMovies;

  const TopRatedMovies({super.key, required this.topRatedMovies});

  @override
  State<TopRatedMovies> createState() => _TopRatedMoviesState();
}

class _TopRatedMoviesState extends State<TopRatedMovies> {
  final String apiKey='ddc4f1e089f5087a29ae004ae72d6eb9';
  final String readAccessToken='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZGM0ZjFlMDg5ZjUwODdhMjlhZTAwNGFlNzJkNmViOSIsInN1YiI6IjYzYTQ4ZDNiZDRmZTA0MDA4MDhmNTIwNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Gw0EtDta7KDYAI7BKeRxMCd1a94B2u8gAfdLxYlbjcc';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ModifiedText(text: 'Top Rated Movies', color: Colors.white,size: 22,),
          ),
          SizedBox(height: 20,),
          Container(
            height: 288,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.topRatedMovies.length,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: () async{
                    List videolist=[];
                    TMDB tMDBWithCustomLogs=TMDB(
                        ApiKeys(apiKey,readAccessToken),
                        logConfig: ConfigLogger(showLogs: true,showErrorLogs: true));
                    Map video=await tMDBWithCustomLogs.v3.movies.getVideos(widget.topRatedMovies[index]['id']);
                    setState((){
                      videolist=video['results'];
                    });
                    print(videolist);
                    int trailerindex=0;
                    for(int i=0;i<videolist.length;i++){
                      if(videolist[i]['type']=='Trailer'){
                        trailerindex=i;
                      }
                    }
                    print(videolist[index]['key']);
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) =>
                        MoviesDescription(
                            title: widget.topRatedMovies[index]['original_title']??'',
                            backdropimageurl: 'https://image.tmdb.org/t/p/w500'+widget.topRatedMovies[index]['backdrop_path'],
                            posterimageurl: 'https://image.tmdb.org/t/p/w500'+widget.topRatedMovies[index]['poster_path'],
                            releasedate: widget.topRatedMovies[index]['release_date']??'',
                            language: widget.topRatedMovies[index]['original_language'],
                            voteAverage: widget.topRatedMovies[index]['vote_average'],
                            overview: widget.topRatedMovies[index]['overview'],
                            videoKey: videolist[trailerindex]['key'],
                        )
                    ));
                  },
                  child: Container(
                    width: 168,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height:200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage('https://image.tmdb.org/t/p/w500'+widget.topRatedMovies[index]['poster_path'])
                              )
                          ),
                        ),
                        SizedBox(height: 10,),
                        ModifiedText(
                            text: widget.topRatedMovies[index]['title']!=null?widget.topRatedMovies[index]['title']:'Loading...',
                            color: Colors.white,
                            size: 18)
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
