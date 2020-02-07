// GENERATED CODE - DO NOT MODIFY BY HAND

part of page_info;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PageInfo> _$pageInfoSerializer = new _$PageInfoSerializer();

class _$PageInfoSerializer implements StructuredSerializer<PageInfo> {
  @override
  final Iterable<Type> types = const [PageInfo, _$PageInfo];
  @override
  final String wireName = 'PageInfo';

  @override
  Iterable<Object> serialize(Serializers serializers, PageInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'totalResults',
      serializers.serialize(object.totalResults,
          specifiedType: const FullType(int)),
      'resultsPerPage',
      serializers.serialize(object.resultsPerPage,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  PageInfo deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PageInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'totalResults':
          result.totalResults = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'resultsPerPage':
          result.resultsPerPage = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$PageInfo extends PageInfo {
  @override
  final int totalResults;
  @override
  final int resultsPerPage;

  factory _$PageInfo([void Function(PageInfoBuilder) updates]) =>
      (new PageInfoBuilder()..update(updates)).build();

  _$PageInfo._({this.totalResults, this.resultsPerPage}) : super._() {
    if (totalResults == null) {
      throw new BuiltValueNullFieldError('PageInfo', 'totalResults');
    }
    if (resultsPerPage == null) {
      throw new BuiltValueNullFieldError('PageInfo', 'resultsPerPage');
    }
  }

  @override
  PageInfo rebuild(void Function(PageInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PageInfoBuilder toBuilder() => new PageInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PageInfo &&
        totalResults == other.totalResults &&
        resultsPerPage == other.resultsPerPage;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, totalResults.hashCode), resultsPerPage.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PageInfo')
          ..add('totalResults', totalResults)
          ..add('resultsPerPage', resultsPerPage))
        .toString();
  }
}

class PageInfoBuilder implements Builder<PageInfo, PageInfoBuilder> {
  _$PageInfo _$v;

  int _totalResults;
  int get totalResults => _$this._totalResults;
  set totalResults(int totalResults) => _$this._totalResults = totalResults;

  int _resultsPerPage;
  int get resultsPerPage => _$this._resultsPerPage;
  set resultsPerPage(int resultsPerPage) =>
      _$this._resultsPerPage = resultsPerPage;

  PageInfoBuilder();

  PageInfoBuilder get _$this {
    if (_$v != null) {
      _totalResults = _$v.totalResults;
      _resultsPerPage = _$v.resultsPerPage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PageInfo other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PageInfo;
  }

  @override
  void update(void Function(PageInfoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PageInfo build() {
    final _$result = _$v ??
        new _$PageInfo._(
            totalResults: totalResults, resultsPerPage: resultsPerPage);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
