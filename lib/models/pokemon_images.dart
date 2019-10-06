class PokemonImages{
   String photo;
   String typeIcon;
   String weakness;
   PokemonImages.fromJsonData(Map data):
       photo=data['photo'],
       typeIcon=data['typeicon'],
       weakness=data['weakness'];
}