import 'package:flutter/material.dart';
import 'package:lapak_tech/model/produk.dart';
import 'package:lapak_tech/ui/produk_detail.dart';
import 'package:lapak_tech/ui/produk_form.dart';

class ProdukPage extends StatefulWidget {
  const ProdukPage({Key? key}) : super(key: key);

  @override
  _ProdukPageState createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  @override 

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Produk'),
        actions: [
          Padding(padding: const EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            child: const Icon(Icons.add, size: 26.0),
            onTap: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProdukForm()));
            },
          ))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Logout'),
              trailing: const Icon(Icons.logout),
              onTap: () async {},
            )
          ]
        ),
      ),
      body: ListView(
        children: [
          ItemProduk(
            produk: Produk(
              kodeProduk: "A001",
              namaProduk: 'MSI GeForce RTX 4090',
              hargaProduk: 36000000
            )
          ),
          ItemProduk(
            produk: Produk(
              kodeProduk: "A002",
              namaProduk: 'MSI Radeon RX 6900 XT',
              hargaProduk: 32000000
            )
          ),
          ItemProduk(
            produk: Produk(
              kodeProduk: "A003",
              namaProduk: 'AMD Ryzen 9 7950X',
              hargaProduk: 9490000
            )
          )
        ],
      )
    );
  }
}

class ItemProduk extends StatelessWidget {
  final Produk produk;
  const ItemProduk({Key? key, required this.produk}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProdukDetail(produk: produk)
          )
        );
      },
      child: Card(
        child: ListTile(
          title: Text(produk.namaProduk!),
          subtitle: Text(produk.hargaProduk.toString()),
        ),
      ),
    );
  }
}