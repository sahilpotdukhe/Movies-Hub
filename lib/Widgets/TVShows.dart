import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/TVShowsDescription.dart';
import 'package:movie_app/utils/ModifiedText.dart';

class TVShows extends StatelessWidget {
  final List tvShows;

  const TVShows({super.key, required this.tvShows});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ModifiedText(text: 'Popular TV Shows', color: Colors.white,size: 22,),
          ),
          SizedBox(height: 20,),
          Container(
            height: 212,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tvShows.length,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    print(tvShows[index]['backdrop_path']);
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) =>
                        TVShowsDescription(
                            title: tvShows[index]['original_name']??'',
                            backdropimageurl: (tvShows[index]['backdrop_path']==null)?'https://image.tmdb.org/t/p/w500'+tvShows[index]['poster_path']:'https://image.tmdb.org/t/p/w500'+tvShows[index]['backdrop_path'],
                            posterimageurl: 'https://image.tmdb.org/t/p/w500'+tvShows[index]['poster_path'],
                            releasedate: tvShows[index]['release_date']??'',
                            language: tvShows[index]['original_language'],
                            voteAverage: tvShows[index]['vote_average'],
                            overview: tvShows[index]['overview']
                        )
                    ));
                  },
                  child: Container(
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height:150,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: tvShows[index]['backdrop_path']!=null?NetworkImage('https://image.tmdb.org/t/p/w500'+tvShows[index]['backdrop_path']):
                                    NetworkImage('https://image.tmdb.org/t/p/w500'+tvShows[index]['poster_path']),
                                  fit: BoxFit.fitWidth
                                )
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        ModifiedText(
                            text: tvShows[index]['original_name']!=null?tvShows[index]['original_name']:'Loading...',
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
