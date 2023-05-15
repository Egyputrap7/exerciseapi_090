// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class KategoriBarangModel {

  final String nama;
  var id;
  KategoriBarangModel({
    required this.nama,
    this.id,
  });

  KategoriBarangModel copyWith({
    String? nama,
    int? id,
  }) {
    return KategoriBarangModel(
      nama: nama ?? this.nama,
      id: id ?? this.id,
    );
  }

//ini diganti sesuai kolom tabel
  Map<String, dynamic> toMap() {
    return {
      'nama_kategori_barang': nama,
      'id_kategori_barang': id,
    };
  }

//ini diganti sesuai kolom tabel
  factory KategoriBarangModel.fromMap(Map<String, dynamic> map) {
    return KategoriBarangModel(
      nama: map['nama_kategori_barang'] ?? '',
      id: map['id_kategori_barang']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory KategoriBarangModel.fromJson(String source) =>
      KategoriBarangModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'KategoriBarangModel(nama: $nama, id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is KategoriBarangModel && other.nama == nama && other.id == id;
  }

  @override
  int get hashCode => nama.hashCode ^ id.hashCode;
}