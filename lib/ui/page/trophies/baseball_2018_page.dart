import 'package:flutter/material.dart';
import 'package:flutter_uikit/logic/bloc/product_bloc.dart';
import 'package:flutter_uikit/model/product.dart';
import 'package:flutter_uikit/ui/widgets/common_scaffold.dart';

class Baseball2018Page extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  BuildContext _context;

  //stack1
  Widget imageStack(String img) => Image.network(
    img,
    fit: BoxFit.cover,
  );


  Widget productGrid(List<Product> products) => GridView.count(
    crossAxisCount:
    MediaQuery.of(_context).orientation == Orientation.portrait ? 2 : 3,
    shrinkWrap: true,
    children: products
        .map((product) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        splashColor: Colors.yellow,
        child: Material(
          clipBehavior: Clip.antiAlias,
          elevation: 2.0,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              imageStack(product.image),
            ],
          ),
        ),
      ),
    ))
        .toList(),
  );

  Widget bodyData() {
    ProductBloc productBloc = ProductBloc();
    return StreamBuilder<List<Product>>(
        stream: productBloc.productItems,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? productGrid(snapshot.data)
              : Center(child: CircularProgressIndicator());
        });
  }


  @override
  Widget build(BuildContext context) {
    _context = context;
    return CommonScaffold(
      scaffoldKey: scaffoldKey,
      appTitle: "Baseball 2018 Trophies",
      showDrawer: true,
      showFAB: false,
      actionFirstIcon: Icons.shopping_cart,
      bodyData: bodyData(),
    );
  }
}
