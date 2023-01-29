import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'codes_record.g.dart';

abstract class CodesRecord implements Built<CodesRecord, CodesRecordBuilder> {
  static Serializer<CodesRecord> get serializer => _$codesRecordSerializer;

  String? get name;

  LatLng? get location;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  DocumentReference? get user;

  String? get description;

  int? get likes;

  double? get value;

  @BuiltValueField(wireName: 'image_url')
  String? get imageUrl;

  String? get code;

  String? get gender;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CodesRecordBuilder builder) => builder
    ..name = ''
    ..description = ''
    ..likes = 0
    ..value = 0.0
    ..imageUrl = ''
    ..code = ''
    ..gender = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('codes');

  static Stream<CodesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CodesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static CodesRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) => CodesRecord(
        (c) => c
          ..name = snapshot.data['name']
          ..location = safeGet(() => LatLng(
                snapshot.data['_geoloc']['lat'],
                snapshot.data['_geoloc']['lng'],
              ))
          ..createdAt = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['created_at']))
          ..user = safeGet(() => toRef(snapshot.data['user']))
          ..description = snapshot.data['description']
          ..likes = snapshot.data['likes']?.round()
          ..value = snapshot.data['value']?.toDouble()
          ..imageUrl = snapshot.data['image_url']
          ..code = snapshot.data['code']
          ..gender = snapshot.data['gender']
          ..ffRef = CodesRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<CodesRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'codes',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  CodesRecord._();
  factory CodesRecord([void Function(CodesRecordBuilder) updates]) =
      _$CodesRecord;

  static CodesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCodesRecordData({
  String? name,
  LatLng? location,
  DateTime? createdAt,
  DocumentReference? user,
  String? description,
  int? likes,
  double? value,
  String? imageUrl,
  String? code,
  String? gender,
}) {
  final firestoreData = serializers.toFirestore(
    CodesRecord.serializer,
    CodesRecord(
      (c) => c
        ..name = name
        ..location = location
        ..createdAt = createdAt
        ..user = user
        ..description = description
        ..likes = likes
        ..value = value
        ..imageUrl = imageUrl
        ..code = code
        ..gender = gender,
    ),
  );

  return firestoreData;
}
