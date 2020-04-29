import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/carro/carros_listview.dart';
import 'package:carros/pages/carro/carros_model.dart';
import 'package:carros/widgets/text_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CarrosPage extends StatefulWidget {
  String tipo;

  CarrosPage(this.tipo);

  @override
  _CarrosPageState createState() => _CarrosPageState();
}

class _CarrosPageState extends State<CarrosPage>
    with AutomaticKeepAliveClientMixin<CarrosPage> {
  @override
  List<Carro> carros;

  String get tipo => widget.tipo;

  final _model = CarrosModel();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _fetch();
  }

  void _fetch() {
    _model.fetch(tipo);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    //print("CarrosListView build ${widget.tipo}");

    return Observer(builder: (_) {
      List<Carro> carros = _model.carros;

      if (_model.error != null) {
        return TextError(
          "Não foi possível buscar os carros\n\nClique para tentar novamente",
          onPressed: _fetch,
        );
      }

      if (carros == null) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      return RefreshIndicator(
        child: CarrosListView(carros),
        onRefresh: _onRefresh,
      );
    });
  }

  Future<void> _onRefresh() {
    return _model.fetch(tipo);
  }
}
