import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data_products.dart';
import 'package:shop/models/product.dart';

class ProductsOverviewPage extends StatelessWidget {
  final List<Product> loadedProducts = DUMMY_PRODUTS;
  ProductsOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Loja'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: loadedProducts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // dois elementos por linha
          childAspectRatio: 3 / 2,
          crossAxisSpacing:
              10, // espaçamento entre os elementos no eixo cruzado
          mainAxisSpacing:
              10, // espaçamento entre os elementos no eixo principal
        ),
        itemBuilder: (ctx, i) => Text(
          loadedProducts[i].title,
        ),
      ),
    );
  }
}
