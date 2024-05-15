import 'package:flutter/material.dart';
import 'package:movie_app/utils/ModifiedText.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MoviesDescription extends StatefulWidget {
  final String title,backdropimageurl,posterimageurl,releasedate,language,overview,videoKey;
  final num voteAverage;

  const MoviesDescription({super.key, required this.title, required this.backdropimageurl, required this.posterimageurl, required this.releasedate, required this.voteAverage, required this.overview, required this.language, required this.videoKey});


  @override
  State<MoviesDescription> createState() => _MoviesDescriptionState();
}

class _MoviesDescriptionState extends State<MoviesDescription> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    // TODO: implement initState
    _controller=YoutubePlayerController(
        initialVideoId:widget.videoKey,
        flags: YoutubePlayerFlags(
            autoPlay: false
        )
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          Container(
            height: 264,
            child: Image.network(widget.backdropimageurl!=null?widget.backdropimageurl:widget.posterimageurl,fit: BoxFit.cover,),
          ),
          SizedBox(height: 24,),
          Row(
            children: [
              Container(
                height: 100,
                width: 80,
                child: Image.network(widget.posterimageurl,fit: BoxFit.cover,),
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 ModifiedText(text: widget.title, color: Colors.white, size: 16),
                  Text('⭐Average Rating  :   ${widget.voteAverage.toStringAsFixed(1)}/10',style: TextStyle(color: Colors.white),),
                  ModifiedText(text: "Release Date:  "+widget.releasedate, color: Colors.grey, size: 12),
                  ModifiedText(text: "Language:  "+widget.language, color: Colors.grey, size: 12),
                ],
              )
            ],
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.overview,style: TextStyle(color: Colors.grey,fontSize: 16),),
          ),
          // Text(widget.videoKey,style: TextStyle(fontSize: 20,color: Colors.white),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Trailer',style: TextStyle(color: Colors.white,fontSize:20),),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  width: 200,
              ),
            ),
          )

        ],
      ),
    );
  }
}
