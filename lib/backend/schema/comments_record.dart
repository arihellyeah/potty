import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'comments_record.g.dart';

abstract class CommentsRecord
    implements Built<CommentsRecord, CommentsRecordBuilder> {
  static Serializer<CommentsRecord> get serializer =>
      _$commentsRecordSerializer;

  DocumentReference? get user;

  String? get text;

  String? get title;

  DocumentReference? get code;

  double? get rating;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CommentsRecordBuilder builder) => builder
    ..text = ''
    ..title = ''
    ..rating = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comments');

  static Stream<CommentsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CommentsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CommentsRecord._();
  factory CommentsRecord([void Function(CommentsRecordBuilder) updates]) =
      _$CommentsRecord;

  static CommentsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCommentsRecordData({
  DocumentReference? user,
  String? text,
  String? title,
  DocumentReference? code,
  double? rating,
}) {
  final firestoreData = serializers.toFirestore(
    CommentsRecord.serializer,
    CommentsRecord(
      (c) => c
        ..user = user
        ..text = text
        ..title = title
        ..code = code
        ..rating = rating,
    ),
  );

  return firestoreData;
}
