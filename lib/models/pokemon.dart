import 'package:poke_dex_api/models/pokemon_info.dart';
import 'package:poke_dex_api/models/pokemon_moves.dart';
class PokemonModel {
  final String name;
  final String shortName;
  final int hp;
 final List<PokemonMoves> moves;
  PokemonInfo info;
  PokemonModel.fromJsonData(Map data):
        name=data["name"],
        shortName=data["shortname"],
        info=PokemonInfo.fromJsonData(data['info']),
        hp=data["hp"],
        moves=data['moves'].map<PokemonMoves>((i)=>PokemonMoves.fromList(i)).toList();
}