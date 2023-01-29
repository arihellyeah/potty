// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'codes_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CodesRecord> _$codesRecordSerializer = new _$CodesRecordSerializer();

class _$CodesRecordSerializer implements StructuredSerializer<CodesRecord> {
  @override
  final Iterable<Type> types = const [CodesRecord, _$CodesRecord];
  @override
  final String wireName = 'CodesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, CodesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.likes;
    if (value != null) {
      result
        ..add('likes')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.value;
    if (value != null) {
      result
        ..add('value')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.imageUrl;
    if (value != null) {
      result
        ..add('image_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.code;
    if (value != null) {
      result
        ..add('code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.gender;
    if (value != null) {
      result
        ..add('gender')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  CodesRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CodesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'likes':
          result.likes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'image_url':
          result.imageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$CodesRecord extends CodesRecord {
  @override
  final String? name;
  @override
  final LatLng? location;
  @override
  final DateTime? createdAt;
  @override
  final DocumentReference<Object?>? user;
  @override
  final String? description;
  @override
  final int? likes;
  @override
  final double? value;
  @override
  final String? imageUrl;
  @override
  final String? code;
  @override
  final String? gender;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CodesRecord([void Function(CodesRecordBuilder)? updates]) =>
      (new CodesRecordBuilder()..update(updates))._build();

  _$CodesRecord._(
      {this.name,
      this.location,
      this.createdAt,
      this.user,
      this.description,
      this.likes,
      this.value,
      this.imageUrl,
      this.code,
      this.gender,
      this.ffRef})
      : super._();

  @override
  CodesRecord rebuild(void Function(CodesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CodesRecordBuilder toBuilder() => new CodesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CodesRecord &&
        name == other.name &&
        location == other.location &&
        createdAt == other.createdAt &&
        user == other.user &&
        description == other.description &&
        likes == other.likes &&
        value == other.value &&
        imageUrl == other.imageUrl &&
        code == other.code &&
        gender == other.gender &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc($jc(0, name.hashCode),
                                            location.hashCode),
                                        createdAt.hashCode),
                                    user.hashCode),
                                description.hashCode),
                            likes.hashCode),
                        value.hashCode),
                    imageUrl.hashCode),
                code.hashCode),
            gender.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CodesRecord')
          ..add('name', name)
          ..add('location', location)
          ..add('createdAt', createdAt)
          ..add('user', user)
          ..add('description', description)
          ..add('likes', likes)
          ..add('value', value)
          ..add('imageUrl', imageUrl)
          ..add('code', code)
          ..add('gender', gender)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CodesRecordBuilder implements Builder<CodesRecord, CodesRecordBuilder> {
  _$CodesRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  LatLng? _location;
  LatLng? get location => _$this._location;
  set location(LatLng? location) => _$this._location = location;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  int? _likes;
  int? get likes => _$this._likes;
  set likes(int? likes) => _$this._likes = likes;

  double? _value;
  double? get value => _$this._value;
  set value(double? value) => _$this._value = value;

  String? _imageUrl;
  String? get imageUrl => _$this._imageUrl;
  set imageUrl(String? imageUrl) => _$this._imageUrl = imageUrl;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _gender;
  String? get gender => _$this._gender;
  set gender(String? gender) => _$this._gender = gender;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CodesRecordBuilder() {
    CodesRecord._initializeBuilder(this);
  }

  CodesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _location = $v.location;
      _createdAt = $v.createdAt;
      _user = $v.user;
      _description = $v.description;
      _likes = $v.likes;
      _value = $v.value;
      _imageUrl = $v.imageUrl;
      _code = $v.code;
      _gender = $v.gender;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CodesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CodesRecord;
  }

  @override
  void update(void Function(CodesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CodesRecord build() => _build();

  _$CodesRecord _build() {
    final _$result = _$v ??
        new _$CodesRecord._(
            name: name,
            location: location,
            createdAt: createdAt,
            user: user,
            description: description,
            likes: likes,
            value: value,
            imageUrl: imageUrl,
            code: code,
            gender: gender,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
