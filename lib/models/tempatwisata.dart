class Tempatwisata {
  final int id;
  final String name;
  final String img;
  final String address;
  final String desc;
  final String maps;

  Tempatwisata(
      this.id, this.name, this.img, this.address, this.desc, this.maps);

  Tempatwisata.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['nama'],
        address = json['alamat'],
        img = json['url_img'],
        maps = json['maps'],
        desc = json['deskripsi'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'nama': name,
        'alamat': address,
        'deskripsi': desc,
        'url_img': img,
        'maps': maps,
      };
}
