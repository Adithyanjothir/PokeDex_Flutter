class PokemonMoves{
  String name;
  String type;
  PokemonMoves.fromList(Map data):
      name=data['name'],
      type=data['type'];
}