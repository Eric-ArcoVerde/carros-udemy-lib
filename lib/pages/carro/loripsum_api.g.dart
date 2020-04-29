// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loripsum_api.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoripsumModel on LoripsumModelBase, Store {
  final _$sAtom = Atom(name: 'LoripsumModelBase.s');

  @override
  String get s {
    _$sAtom.context.enforceReadPolicy(_$sAtom);
    _$sAtom.reportObserved();
    return super.s;
  }

  @override
  set s(String value) {
    _$sAtom.context.conditionallyRunInAction(() {
      super.s = value;
      _$sAtom.reportChanged();
    }, _$sAtom, name: '${_$sAtom.name}_set');
  }

  final _$errorAtom = Atom(name: 'LoripsumModelBase.error');

  @override
  Exception get error {
    _$errorAtom.context.enforceReadPolicy(_$errorAtom);
    _$errorAtom.reportObserved();
    return super.error;
  }

  @override
  set error(Exception value) {
    _$errorAtom.context.conditionallyRunInAction(() {
      super.error = value;
      _$errorAtom.reportChanged();
    }, _$errorAtom, name: '${_$errorAtom.name}_set');
  }

  final _$fetchAsyncAction = AsyncAction('fetch');

  @override
  Future fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  @override
  String toString() {
    final string = 's: ${s.toString()},error: ${error.toString()}';
    return '{$string}';
  }
}
