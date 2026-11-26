import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:practice_w8/EXERCISE-4/model/joke.dart';
import 'package:practice_w8/EXERCISE-4/data/jokes.dart';


Color appColor = Colors.green[300] as Color;

void main() => runApp(

  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Jokes"),
      ),
      body: SingleChildScrollView(child: JokeScreen()),
    ),
  ),
);

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    super.key,
    required this.joke,
    required this.isFavorite,
    required this.onFavoriteClick,
  });
  final Joke joke;
  final bool isFavorite;
  final VoidCallback onFavoriteClick;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: .5, color: Colors.grey)),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  joke.title,
                  style: TextStyle(
                    color: appColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(joke.description),
              ],
            ),
          ),
          IconButton(
            onPressed: onFavoriteClick,
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class JokeScreen extends StatefulWidget {
  const JokeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _JokeScreenState();
}
class _JokeScreenState extends State<JokeScreen> {
  Joke? favoriteJoke;

  void onFavoriteClick(Joke joke) {
    setState(() {
      favoriteJoke = (favoriteJoke == joke) ? null : joke;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        for (var joke in jokes)
          FavoriteCard(
            joke: joke,
            isFavorite: joke == favoriteJoke,
            onFavoriteClick: () => onFavoriteClick(joke),
          ),
      ],
    );
  }
}
