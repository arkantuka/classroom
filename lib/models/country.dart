class Country {
  final String? name;
  final String? capital;
  final int? population;
  final String? flag;

  Country({
    this.name,
    this.capital,
    this.population,
    this.flag,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'],
      capital: json['capital'],
      population: json['population'],
      flag: json['media']['flag'],
    );
  }
}
