class ProdiModel {
  String id;
  String namaProdi;
  dynamic keterangan;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  ProdiModel({
    required this.id,
    required this.namaProdi,
    this.keterangan,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory ProdiModel.fromJson(Map<String, dynamic> json) {
    return ProdiModel(
      id: json['id'],
      namaProdi: json['nama_prodi'],
      keterangan: json['keterangan'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_prodi'] = this.namaProdi;
    data['keterangan'] = this.keterangan;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
