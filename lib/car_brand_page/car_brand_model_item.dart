import 'dart:convert';

class CarBrandModelItem {
  final String imageResouceId;
  final String carBrandName;

  CarBrandModelItem({required this.imageResouceId, required this.carBrandName});

  CarBrandModelItem copyWith({
    String? imageResouceId,
    String? carBrandName,
  }) {
    return CarBrandModelItem(
      imageResouceId: imageResouceId ?? this.imageResouceId,
      carBrandName: carBrandName ?? this.carBrandName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imageResouceId': imageResouceId,
      'carBrandName': carBrandName,
    };
  }

  factory CarBrandModelItem.fromMap(Map<String, dynamic> map) {
    return CarBrandModelItem(
      imageResouceId: map['imageResouceId'] as String,
      carBrandName: map['carBrandName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CarBrandModelItem.fromJson(String source) =>
      CarBrandModelItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CarBrandModelItem(imageResouceId: $imageResouceId, carBrandName: $carBrandName)';

  @override
  bool operator ==(covariant CarBrandModelItem other) {
    if (identical(this, other)) return true;

    return other.imageResouceId == imageResouceId &&
        other.carBrandName == carBrandName;
  }

  @override
  int get hashCode => imageResouceId.hashCode ^ carBrandName.hashCode;
}
