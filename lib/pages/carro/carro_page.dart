import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/carro/loripsum_api.dart';
import 'package:carros/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CarroPage extends StatefulWidget {
  Carro carro;
  CarroPage(this.carro);

  @override
  _CarroPageState createState() => _CarroPageState();
}

class _CarroPageState extends State<CarroPage> {
  final _loripsumModel = LoripsumModel();

  @override
  void initState() {
    super.initState();

    _fetch();
  }

  void _fetch() {
    _loripsumModel.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.carro.nome),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.place),
            onPressed: _onClickMapa,
          ),
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: _onClickVideo,
          ),
          PopupMenuButton<String>(
            onSelected: _onClickPopupMenu,
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(value: "Editar", child: Text("Editar")),
                PopupMenuItem(value: "Deletar", child: Text("Deletar")),
                PopupMenuItem(value: "Share", child: Text("Share"))
              ];
            },
          ),
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: <Widget>[
          Image.network(widget.carro.urlFoto),
          _bloco1(),
          Divider(),
          _bloco2(),
        ],
      ),
    );
  }

  Row _bloco1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            text(widget.carro.nome, fontSize: 25, bold: true),
            text(widget.carro.tipo, fontSize: 16)
          ],
        ),
        //Spacer(), faz o mesmo que o spaceBetween
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite, color: Colors.red, size: 40),
              onPressed: _onClickFavotiro,
            ),
            IconButton(
              icon: Icon(Icons.share, size: 40),
              onPressed: _onClickShare,
            ),
          ],
        ),
      ],
    );
  }

  _bloco2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20),
        text(widget.carro.descricao, fontSize: 16, bold: true),
        SizedBox(height: 20),
        Observer(
          builder: (context) {
            String s = _loripsumModel.s;
            if (s == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return text(s, fontSize: 16);
          },
        ),
      ],
    );
  }

  void _onClickMapa() {}

  void _onClickVideo() {}

  _onClickPopupMenu(String value) {
    switch (value) {
      case "Editar":
        print("Editar !!!");
        break;
      case "Deletar":
        print("Deletar !!!");
        break;
      case "Share":
        print("Share !!!");
        break;
    }
  }

  void _onClickFavotiro() {}

  void _onClickShare() {}
}
