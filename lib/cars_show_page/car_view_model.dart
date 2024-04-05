import 'dart:convert';

class CarViewModel {
  final String imageResouceId;
  final String carName;
  const CarViewModel({
    required this.imageResouceId,
    required this.carName,
  });

  CarViewModel copyWith({
    String? imageResouceId,
    String? carName,
  }) {
    return CarViewModel(
      imageResouceId: imageResouceId ?? this.imageResouceId,
      carName: carName ?? this.carName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imageResouceId': imageResouceId,
      'carName': carName,
    };
  }

  factory CarViewModel.fromMap(Map<String, dynamic> map) {
    return CarViewModel(
      imageResouceId: map['imageResouceId'] as String,
      carName: map['carName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CarViewModel.fromJson(String source) =>
      CarViewModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CarViewModel(imageResouceId: $imageResouceId, carName: $carName)';

  @override
  bool operator ==(covariant CarViewModel other) {
    if (identical(this, other)) return true;

    return other.imageResouceId == imageResouceId && other.carName == carName;
  }

  @override
  int get hashCode => imageResouceId.hashCode ^ carName.hashCode;
}
