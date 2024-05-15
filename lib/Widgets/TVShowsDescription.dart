import 'package:flutter/material.dart';
import 'package:movie_app/utils/ModifiedText.dart';

class TVShowsDescription extends StatefulWidget {
  final String title,backdropimageurl,posterimageurl,releasedate,language,overview;
  final num voteAverage;

  const TVShowsDescription({super.key, required this.title, required this.backdropimageurl, required this.posterimageurl, required this.releasedate, required this.voteAverage, required this.overview, required this.language});


  @override
  State<TVShowsDescription> createState() => _TVShowsDescriptionState();
}

class _TVShowsDescriptionState extends State<TVShowsDescription> {
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
          )

        ],
      ),
    );
  }
}
