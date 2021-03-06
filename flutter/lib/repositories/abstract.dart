import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:model_fetch/model_fetch.dart';
import 'package:model_fetch_firestore/model_fetch_firestore.dart';
import 'package:model_interfaces/model_interfaces.dart';

abstract class AbstractFirestoreRepository<T extends WithId<String>,
    F extends AbstractFilter> {
  static const fetchSize = 20;

  final _liveByIdBlocs = <String, FirestoreLiveByIdBloc<T>>{};
  final _frozenListBlocs = <String, FirestoreFrozenLazyLoadBloc<T>>{};

  QueryBuilder<T> createQueryBuilder(F filter);

  T fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  );

  Map<String, Object?> toFirestore(
    T value,
    SetOptions? options,
  ) {
    throw UnimplementedError();
  }

  FirestoreLiveByIdBloc<T> liveById(String id) {
    return _liveByIdBlocs[id] ?? _createAndCacheLiveByIdBloc(id);
  }

  FirestoreLiveByIdBloc<T> _createAndCacheLiveByIdBloc(String id) {
    final result = FirestoreLiveByIdBloc(
      collectionReference: getCollection().withConverter(
        fromFirestore: fromFirestore,
        toFirestore: toFirestore,
      ),
      id: id,
    );

    _liveByIdBlocs[id] = result;
    return result;
  }

  LazyLoadBloc<T> frozenListBloc(F filter) {
    return _frozenListBlocs[filter.hash] ??
        _createAndCacheFrozenListBloc(filter);
  }

  LazyLoadBloc<T> _createAndCacheFrozenListBloc(F filter) {
    final result = FirestoreFrozenLazyLoadBloc(
      query: createQueryBuilder(filter).query,
      fetchSize: fetchSize,
    );

    _frozenListBlocs[filter.hash] = result;
    return result;
  }

  @protected
  CollectionReference<Map<String, dynamic>> getCollection();
}
