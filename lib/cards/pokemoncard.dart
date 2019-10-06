import 'package:flutter/material.dart';
class PokemonCard extends StatefulWidget {
  final Widget pokemonCard;
  PokemonCard({Key key,@required this.pokemonCard}):super();
  @override
  _PokemonCardState createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Card(
          margin: EdgeInsets.all(20.0),
          child: Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(color: Colors.deepOrange,offset: Offset(20.0,10.0))
            ]),
            child: widget.pokemonCard,
          ),
        )
      ],
    );
  }
}
