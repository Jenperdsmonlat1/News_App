class CryptoPrice {

  final double price;

  const CryptoPrice({
    required this.price
  });

  factory CryptoPrice.fromJson(Map<String, dynamic> json) {
    return CryptoPrice(price: json['EUR'] as double);
  }
}