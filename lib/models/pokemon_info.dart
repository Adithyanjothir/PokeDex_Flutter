class PokemonInfo{
  int id;
  String type;
  String weakness;
  String description;
PokemonInfo.fromJsonData(Map data):
      id=data['id'],
      type=data['type'],
      weakness=data['weakness'],
      description=data['description'];
}