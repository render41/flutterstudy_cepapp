class Cep {
  final String cep;
  final String publicPlace;
  final String neighborhood;
  final String locality;

  Cep({
    required this.cep,
    required this.publicPlace,
    required this.neighborhood,
    required this.locality,
  });


  factory Cep.fromJson(Map<String, dynamic> json) {
    return Cep(
      cep: json['cep'],
      publicPlace: json['l'],
      neighborhood: json['bairro'],
      locality: json['localidade'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "cep": cep,
      "l": publicPlace,
      "bairro": neighborhood,
      "localidade": locality,
    };
  }
}
