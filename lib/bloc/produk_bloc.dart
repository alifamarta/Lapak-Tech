import 'dart:convert';

import 'package:lapak_tech/helpers/api.dart';
import 'package:lapak_tech/helpers/api_url.dart';
import 'package:lapak_tech/model/produk.dart';

class ProdukBloc {
  static Future<List<Produk>> getProduk() async {
    String apiUrl = ApiUrl.listProd;
    var response = await Api().get(apiUrl);
    var jsonObj = json.decode(response.body);

    List<dynamic> listProd = (jsonObj as Map<String, dynamic>)['data'];
    List<Produk> prods = [];

    for (int i = 0; i < listProd.length; i++) {
      prods.add(Produk.fromJson(listProd[i]));
    }
    return prods;
  }

  static Future addProduk({Produk? produk}) async {
    String apiUrl = ApiUrl.createProd;

    var body = {
      "kode_produk": produk!.kodeProduk,
      "nama_produk": produk.namaProduk,
      "harga": produk.hargaProduk.toString()
    };
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return jsonObj['status'];
  }

  static Future<bool> updateProduk({required Produk produk}) async {
    String apiUrl = ApiUrl.updateProd(produk.id!);

    var body = {
      "kode_produk": produk.kodeProduk,
      "nama_produk": produk.namaProduk,
      "harga": produk.hargaProduk.toString()
    };
    print("Body: $body");

    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return jsonObj['data'];
  }

  static Future<bool> deleteProduk({int? id}) async {
    String apiUrl = ApiUrl.deleteProd(id!);

    var response = await Api().delete(apiUrl);
    var jsonObj = json.decode(response.body);
    return (jsonObj as Map<String, dynamic>)['data'];
  }
}