import 'dart:convert';

MoneyRate moneyRateFromJson(String str) => MoneyRate.fromJson(json.decode(str));

String moneyRateToJson(MoneyRate data) => json.encode(data.toJson());

class MoneyRate {
  MoneyRate({
    required this.base,
    required this.rates,
  });

  String base;
  Map<String, double> rates;

  factory MoneyRate.fromJson(Map<String, dynamic> json) => MoneyRate(
        base: json["base"],
        rates: Map.from(json["rates"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "base": base,
        "rates": Map.from(rates).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
