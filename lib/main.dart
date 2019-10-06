import 'dart:convert';

import 'package:http/http.dart' show get, Response;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke_dex_api/cards/pokemoncard.dart';
import 'package:poke_dex_api/models/pokemon.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  String id;
  PokemonModel pokemonModel;
  Map parsedJson;
  String namePokemon;

  fetchInfo(name) async {
    try {
      final Response response = await get(
          'https://courses.cs.washington.edu/courses/cse154/webservices/pokedex/pokedex.php?pokemon=${namePokemon.toLowerCase()}');

      if (response.statusCode == 200) {
        final parsedJson = jsonDecode((response.body));
        setState(() {
          pokemonModel = PokemonModel.fromJsonData(parsedJson);
          print(pokemonModel.name);
        });
      }
    } catch (error) {
      print(error);
    }
  }

  Widget movesInfo() {
    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: pokemonModel.moves.length,
        itemBuilder: (context, i) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                    'Move ${i + 1}:'
                    ' Name:${pokemonModel.moves[i].name} ',
                    style: new TextStyle(fontSize: 20)),
                Row(
                  children: <Widget>[
                    Text('Type:${pokemonModel.moves[i].type}',
                        style: new TextStyle(fontSize: 20)),
                    Image.network(
                      'https://courses.cs.washington.edu/courses/cse154/webservices/pokedex/icons/${pokemonModel.moves[i].type.toLowerCase()}.jpg',
                      scale: 5.0,
                    ),
                  ],
                )
              ],
            ));
  }

  Widget showInfo() {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Name:${pokemonModel.name}',
              style: new TextStyle(fontSize: 32),
            ),
            Text('ShortName:${pokemonModel.shortName},',
                style: new TextStyle(fontSize: 20)),
            Text('Hp:${pokemonModel.hp}', style: new TextStyle(fontSize: 20)),
            Text('PokemonId:${pokemonModel.info.id}',
                style: new TextStyle(fontSize: 20)),
            Row(
              children: <Widget>[
                Text('Type:${pokemonModel.info.type}',
                    style: new TextStyle(fontSize: 20)),
                Image.network(
                  'https://courses.cs.washington.edu/courses/cse154/webservices/pokedex/icons/${pokemonModel.info.type.toLowerCase()}.jpg',
                  scale: 5.0,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text('Weakness:${pokemonModel.info.weakness}',
                    style: new TextStyle(fontSize: 20)),
                Image.network(
                  'https://courses.cs.washington.edu/courses/cse154/webservices/pokedex/icons/${pokemonModel.info.type.toLowerCase()}.jpg',
                  scale: 5.0,
                )
              ],
            ),
            Text('Description:${pokemonModel.info.description}',
                style: new TextStyle(fontSize: 20)),
          ],
        )
      ],
    );
  }

  Widget show() {
    return pokemonModel == null
        ? Container()
        : Column(
            children: <Widget>[
              showCard(),
              showInfo(),
              movesInfo(),
            ],
          );
  }

  Widget showCard() {
    return Container(
        alignment: Alignment.center,
        height: 200.0,
        child: Image.network(
            'https://courses.cs.washington.edu/courses/cse154/webservices/pokedex/images/$namePokemon.jpg'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PokeDex',
      home: Scaffold(
        appBar: AppBar(
          title: Text("PokeDex"),
          backgroundColor: Colors.red,
        ),
        body: ListView(
//          shrinkWrap: true,
//          physics: ClampingScrollPhysics(),
          children: <Widget>[
            TextField(
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: "Pokemon Name!!!!!!!",
              ),
              onChanged: (String value) =>
                  this.setState(() => namePokemon = value.toLowerCase()),
            ),
            FloatingActionButton(
              onPressed: () async => await fetchInfo(namePokemon),
              child: Icon(Icons.search),
            ),
            show(),
          ],
        ),
      ),
    );
  }
}
