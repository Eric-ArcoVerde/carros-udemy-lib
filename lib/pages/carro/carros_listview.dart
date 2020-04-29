import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/carro/carro_page.dart';
import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';

class CarrosListView extends StatelessWidget {
  List<Carro> carros;

  CarrosListView(this.carros);

  @override
  Widget build(BuildContext context) {
    //print("CarrosListView build ${widget.tipo}");

    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
          itemCount: carros != null ? carros.length : 0,
          itemBuilder: (contex, index) {
            Carro c = carros[index];

            return Card(
              color: Colors.grey[100],
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Image.network(
                        c.urlFoto ??
                            "http://www.livroandroid.com.br/livro/carros/esportivos/Lamborghini_Aventador.png",
                        width: 250,
                      ),
                    ),
                    Text(
                      c.nome,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "descrição",
                      style: TextStyle(fontSize: 16),
                    ),
                    ButtonBarTheme(
                      data: ButtonBarTheme.of(contex),
                      child: ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            child: const Text('DETALHES'),
                            onPressed: () {
                              //print("TESTE ANTES CLICK");
                              _onClickCarro(context, c);
                              //print("TESTE POS CLICK");
                            },
                          ),
                          FlatButton(
                            child: const Text('SHARE'),
                            onPressed: () {/* ... */},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  _onClickCarro(context, Carro c) {
    push(context, CarroPage(c));
  }
}
