uint64_t NLTokenizer.tokenRange(at:)()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t result;

  v1 = objc_msgSend(v0, sel_string);
  if (v1)
  {
    v2 = v1;
    v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v5 = v4;

  }
  else
  {
    v3 = 0;
    v5 = 0xE000000000000000;
  }
  lazy protocol witness table accessor for type String and conformance String();
  objc_msgSend(v0, sel_tokenRangeAtIndex_, String.Index.utf16Offset<A>(in:)(), v3, v5);
  NSNotFound.getter();
  v6 = Range<>.init(_:in:)();
  v8 = v7;
  result = swift_bridgeObjectRelease();
  if ((v8 & 1) == 0)
    return v6;
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    result = MEMORY[0x212BCB53C](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

uint64_t NLTokenizer.tokenRange(for:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t result;

  v3 = v2;
  v6 = objc_msgSend(v2, sel_string);
  if (v6)
  {
    v7 = v6;
    v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v10 = v9;

  }
  else
  {
    v8 = 0;
    v10 = 0xE000000000000000;
  }
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<String.Index>);
  lazy protocol witness table accessor for type Range<String.Index> and conformance Range<A>();
  lazy protocol witness table accessor for type String and conformance String();
  v11 = _NSRange.init<A, B>(_:in:)();
  v13 = objc_msgSend(v3, sel_tokenRangeForRange_, v11, v12, v8, v10, a1, a2);
  if (v13 == (id)NSNotFound.getter())
    String.Index.utf16Offset<A>(in:)();
  v14 = Range<>.init(_:in:)();
  v16 = v15;
  result = swift_bridgeObjectRelease();
  if ((v16 & 1) == 0)
    return v14;
  __break(1u);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212BCB524]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Range<String.Index> and conformance Range<A>()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type Range<String.Index> and conformance Range<A>;
  if (!lazy protocol witness table cache variable for type Range<String.Index> and conformance Range<A>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Range<String.Index>);
    result = MEMORY[0x212BCB53C](MEMORY[0x24BEE1BC0], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Range<String.Index> and conformance Range<A>);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212BCB530](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

id NLTokenizer.enumerateTokens(in:using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  id result;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  char isEscapingClosureAtFileLocation;
  _QWORD v19[8];

  result = objc_msgSend(v4, sel_string);
  if (result)
  {
    v8 = result;
    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v11 = v10;

    v19[6] = v9;
    v19[7] = v11;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<String.Index>);
    lazy protocol witness table accessor for type Range<String.Index> and conformance Range<A>();
    lazy protocol witness table accessor for type String and conformance String();
    v12 = _NSRange.init<A, B>(_:in:)();
    v14 = v13;
    v15 = (_QWORD *)swift_allocObject();
    v15[2] = v9;
    v15[3] = v11;
    v15[4] = a3;
    v15[5] = a4;
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = partial apply for closure #1 in NLTokenizer.enumerateTokens(in:using:);
    *(_QWORD *)(v16 + 24) = v15;
    v19[4] = partial apply for thunk for @callee_guaranteed (@unowned _NSRange, @unowned NLTokenizerAttributes, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
    v19[5] = v16;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 1107296256;
    v19[2] = thunk for @escaping @callee_guaranteed (@unowned _NSRange, @unowned NLTokenizerAttributes, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
    v19[3] = &block_descriptor;
    v17 = _Block_copy(v19);
    swift_retain();
    swift_release();
    objc_msgSend(v4, sel_enumerateTokensInRange_usingBlock_, v12, v14, v17);
    _Block_release(v17);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = (id)swift_release();
    if ((isEscapingClosureAtFileLocation & 1) != 0)
      __break(1u);
  }
  return result;
}

uint64_t sub_21082FD5C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_21082FD84()
{
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @callee_guaranteed (@unowned _NSRange, @unowned NLTokenizerAttributes, @unowned UnsafeMutablePointer<ObjCBool>) -> ()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned _NSRange, @unowned NLTokenizerAttributes, @unowned UnsafeMutablePointer<ObjCBool>) -> ()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32))(a2, a3, a4, a5);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t NLTokenizer.tokens(for:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD v18[3];
  uint64_t aBlock;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v22;
  uint64_t (*v23)();
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v27 = MEMORY[0x24BEE4AF8];
  v18[2] = &v27;
  v5 = objc_msgSend(v2, sel_string);
  if (!v5)
    return v27;
  v6 = v5;
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = v8;

  aBlock = a1;
  v20 = a2;
  v25 = v7;
  v26 = v9;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<String.Index>);
  lazy protocol witness table accessor for type Range<String.Index> and conformance Range<A>();
  lazy protocol witness table accessor for type String and conformance String();
  v10 = _NSRange.init<A, B>(_:in:)();
  v12 = v11;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = v7;
  v13[3] = v9;
  v13[4] = partial apply for closure #1 in NLTokenizer.tokens(for:);
  v13[5] = v18;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = partial apply for closure #1 in NLTokenizer.enumerateTokens(in:using:);
  *(_QWORD *)(v14 + 24) = v13;
  v23 = thunk for @callee_guaranteed (@unowned _NSRange, @unowned NLTokenizerAttributes, @unowned UnsafeMutablePointer<ObjCBool>) -> ()partial apply;
  v24 = v14;
  aBlock = MEMORY[0x24BDAC760];
  v20 = 1107296256;
  v21 = thunk for @escaping @callee_guaranteed (@unowned _NSRange, @unowned NLTokenizerAttributes, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
  v22 = &block_descriptor_14;
  v15 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v2, sel_enumerateTokensInRange_usingBlock_, v10, v12, v15);
  _Block_release(v15);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0)
    return v27;
  __break(1u);
  return result;
}

uint64_t closure #1 in NLTokenizer.tokens(for:)(uint64_t a1, uint64_t a2, uint64_t a3, char **a4)
{
  char *v7;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v9;
  unint64_t v10;
  char *v11;

  v7 = *a4;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a4 = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v7 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v7 + 2) + 1, 1, v7);
    *a4 = v7;
  }
  v10 = *((_QWORD *)v7 + 2);
  v9 = *((_QWORD *)v7 + 3);
  if (v10 >= v9 >> 1)
    v7 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v9 > 1), v10 + 1, 1, v7);
  *((_QWORD *)v7 + 2) = v10 + 1;
  v11 = &v7[16 * v10];
  *((_QWORD *)v11 + 4) = a1;
  *((_QWORD *)v11 + 5) = a2;
  *a4 = v7;
  return 1;
}

uint64_t partial apply for closure #1 in NLTokenizer.tokens(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return closure #1 in NLTokenizer.tokens(for:)(a1, a2, a3, *(char ***)(v3 + 16));
}

uint64_t partial apply for closure #1 in NLTokenizer.enumerateTokens(in:using:)(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4;
  uint64_t (*v6)(uint64_t);
  uint64_t result;
  char v8;

  v6 = *(uint64_t (**)(uint64_t))(v4 + 32);
  result = Range<>.init(_:in:)();
  if ((v8 & 1) == 0)
  {
    result = v6(result);
    if ((result & 1) == 0)
      *a4 = 1;
  }
  return result;
}

uint64_t sub_2108300E4()
{
  return swift_deallocObject();
}

void type metadata accessor for NLLanguage(uint64_t a1)
{
  type metadata accessor for NLLanguage(a1, &lazy cache variable for type metadata for NLLanguage);
}

void type metadata accessor for NLTag(uint64_t a1)
{
  type metadata accessor for NLLanguage(a1, &lazy cache variable for type metadata for NLTag);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for _NSRange(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for _NSRange(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for _NSRange(uint64_t a1)
{
  type metadata accessor for NLLanguage(a1, &lazy cache variable for type metadata for _NSRange);
}

void type metadata accessor for NLTokenizerAttributes(uint64_t a1)
{
  type metadata accessor for NLLanguage(a1, &lazy cache variable for type metadata for NLTokenizerAttributes);
}

void type metadata accessor for NLLanguage(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance NLTag(uint64_t a1, uint64_t a2)
{
  return protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance NLTag(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance NLTag(uint64_t a1, id *a2)
{
  uint64_t result;

  result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance NLTag(uint64_t a1, id *a2)
{
  char v3;

  v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance NLTag@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3 = MEMORY[0x212BCB1DC](v2);
  result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance NLLanguage(uint64_t a1, uint64_t a2)
{
  return protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance NLTag(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance NLTag(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t protocol witness for Hashable.hash(into:) in conformance NLTag()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance NLTag()
{
  Swift::Int v0;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance NLTag()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v2 = v1;
  if (v0 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v2 == v3)
    v5 = 1;
  else
    v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance NLTag()
{
  lazy protocol witness table accessor for type NLTag and conformance NLTag((unint64_t *)&lazy protocol witness table cache variable for type NLTag and conformance NLTag, (uint64_t (*)(uint64_t))type metadata accessor for NLTag, (uint64_t)&protocol conformance descriptor for NLTag);
  lazy protocol witness table accessor for type NLTag and conformance NLTag(&lazy protocol witness table cache variable for type NLTag and conformance NLTag, (uint64_t (*)(uint64_t))type metadata accessor for NLTag, (uint64_t)&protocol conformance descriptor for NLTag);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t base witness table accessor for RawRepresentable in NLTag()
{
  return lazy protocol witness table accessor for type NLTag and conformance NLTag(&lazy protocol witness table cache variable for type NLTag and conformance NLTag, (uint64_t (*)(uint64_t))type metadata accessor for NLTag, (uint64_t)"ي#<$\a");
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in NLTag()
{
  return lazy protocol witness table accessor for type NLTag and conformance NLTag(&lazy protocol witness table cache variable for type NLTag and conformance NLTag, (uint64_t (*)(uint64_t))type metadata accessor for NLTag, (uint64_t)&protocol conformance descriptor for NLTag);
}

uint64_t lazy protocol witness table accessor for type NLTag and conformance NLTag(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x212BCB53C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance NLTag@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = MEMORY[0x212BCB1DC](*a1, a1[1]);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance NLLanguage@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance NLLanguage()
{
  lazy protocol witness table accessor for type NLTag and conformance NLTag((unint64_t *)&lazy protocol witness table cache variable for type NLLanguage and conformance NLLanguage, (uint64_t (*)(uint64_t))type metadata accessor for NLLanguage, (uint64_t)&protocol conformance descriptor for NLLanguage);
  lazy protocol witness table accessor for type NLTag and conformance NLTag(&lazy protocol witness table cache variable for type NLLanguage and conformance NLLanguage, (uint64_t (*)(uint64_t))type metadata accessor for NLLanguage, (uint64_t)&protocol conformance descriptor for NLLanguage);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t base witness table accessor for RawRepresentable in NLLanguage()
{
  return lazy protocol witness table accessor for type NLTag and conformance NLTag(&lazy protocol witness table cache variable for type NLLanguage and conformance NLLanguage, (uint64_t (*)(uint64_t))type metadata accessor for NLLanguage, (uint64_t)&protocol conformance descriptor for NLLanguage);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in NLLanguage()
{
  return lazy protocol witness table accessor for type NLTag and conformance NLTag(&lazy protocol witness table cache variable for type NLLanguage and conformance NLLanguage, (uint64_t (*)(uint64_t))type metadata accessor for NLLanguage, (uint64_t)&protocol conformance descriptor for NLLanguage);
}

uint64_t base witness table accessor for Equatable in NLLanguage()
{
  return lazy protocol witness table accessor for type NLTag and conformance NLTag(&lazy protocol witness table cache variable for type NLLanguage and conformance NLLanguage, (uint64_t (*)(uint64_t))type metadata accessor for NLLanguage, (uint64_t)&protocol conformance descriptor for NLLanguage);
}

uint64_t base witness table accessor for Equatable in NLTag()
{
  return lazy protocol witness table accessor for type NLTag and conformance NLTag(&lazy protocol witness table cache variable for type NLTag and conformance NLTag, (uint64_t (*)(uint64_t))type metadata accessor for NLTag, (uint64_t)&protocol conformance descriptor for NLTag);
}

uint64_t NLContextualEmbeddingResult.tokenVector(at:)()
{
  void *v0;
  id v1;
  uint64_t v2;
  _QWORD *v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char v15;
  char v16;
  _QWORD *v17;

  v1 = objc_msgSend(v0, sel_string);
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  lazy protocol witness table accessor for type String and conformance String();
  v2 = String.Index.utf16Offset<A>(in:)();
  v3 = (_QWORD *)swift_slowAlloc();
  *v3 = 0;
  v3[1] = 0;
  v4 = objc_msgSend(v0, sel_tokenVectorAtIndex_tokenRange_, v2, v3);
  if (!v4)
  {
    swift_bridgeObjectRelease();
    MEMORY[0x212BCB584](v3, -1, -1);
    return (uint64_t)v4;
  }
  type metadata accessor for NSNumber();
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    v6 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v6)
      goto LABEL_4;
LABEL_15:
    swift_bridgeObjectRelease();
    v4 = (id)MEMORY[0x24BEE4AF8];
    goto LABEL_16;
  }
  v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v6)
    goto LABEL_15;
LABEL_4:
  v17 = (_QWORD *)MEMORY[0x24BEE4AF8];
  result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v6 & ~(v6 >> 63), 0);
  if (v6 < 0)
  {
    __break(1u);
    goto LABEL_20;
  }
  v8 = 0;
  v4 = v17;
  do
  {
    if ((v5 & 0xC000000000000001) != 0)
      v9 = (id)MEMORY[0x212BCB26C](v8, v5);
    else
      v9 = *(id *)(v5 + 8 * v8 + 32);
    v10 = v9;
    objc_msgSend(v9, sel_doubleValue);
    v12 = v11;

    v14 = v17[2];
    v13 = v17[3];
    if (v14 >= v13 >> 1)
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v13 > 1), v14 + 1, 1);
    ++v8;
    v17[2] = v14 + 1;
    v17[v14 + 4] = v12;
  }
  while (v6 != v8);
  swift_bridgeObjectRelease();
LABEL_16:
  Range<>.init(_:in:)();
  v16 = v15;
  result = swift_bridgeObjectRelease();
  if ((v16 & 1) == 0)
  {
    MEMORY[0x212BCB584](v3, -1, -1);
    return (uint64_t)v4;
  }
LABEL_20:
  __break(1u);
  return result;
}

unint64_t type metadata accessor for NSNumber()
{
  unint64_t result;

  result = lazy cache variable for type metadata for NSNumber;
  if (!lazy cache variable for type metadata for NSNumber)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
  }
  return result;
}

uint64_t NLContextualEmbeddingResult.enumerateTokenVectors(in:using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD v19[8];

  v7 = objc_msgSend(v4, sel_string);
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = v9;

  v19[6] = v8;
  v19[7] = v10;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<String.Index>);
  lazy protocol witness table accessor for type Range<String.Index> and conformance Range<A>();
  lazy protocol witness table accessor for type String and conformance String();
  v11 = _NSRange.init<A, B>(_:in:)();
  v13 = v12;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = v8;
  v14[3] = v10;
  v14[4] = a3;
  v14[5] = a4;
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = partial apply for closure #1 in NLContextualEmbeddingResult.enumerateTokenVectors(in:using:);
  *(_QWORD *)(v15 + 24) = v14;
  v19[4] = partial apply for thunk for @callee_guaranteed (@unowned _NSRange, @unowned NLTokenizerAttributes, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
  v19[5] = v15;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 1107296256;
  v19[2] = thunk for @escaping @callee_guaranteed (@guaranteed [NSNumber], @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
  v19[3] = &block_descriptor_0;
  v16 = _Block_copy(v19);
  swift_retain();
  swift_release();
  objc_msgSend(v4, sel_enumerateTokenVectorsInRange_usingBlock_, v11, v13, v16);
  _Block_release(v16);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
  return result;
}

uint64_t closure #1 in NLContextualEmbeddingResult.enumerateTokenVectors(in:using:)(unint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, uint64_t))
{
  uint64_t result;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;

  result = Range<>.init(_:in:)();
  if ((v12 & 1) == 0)
  {
    v13 = result;
    v14 = v11;
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      v15 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      v15 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v16 = MEMORY[0x24BEE4AF8];
    if (v15)
    {
      v26 = MEMORY[0x24BEE4AF8];
      result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v15 & ~(v15 >> 63), 0);
      if (v15 < 0)
      {
        __break(1u);
        return result;
      }
      v25 = v13;
      v17 = 0;
      v16 = v26;
      do
      {
        if ((a1 & 0xC000000000000001) != 0)
          v18 = (id)MEMORY[0x212BCB26C](v17, a1);
        else
          v18 = *(id *)(a1 + 8 * v17 + 32);
        v19 = v18;
        objc_msgSend(v18, sel_doubleValue);
        v21 = v20;

        v23 = *(_QWORD *)(v26 + 16);
        v22 = *(_QWORD *)(v26 + 24);
        if (v23 >= v22 >> 1)
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v22 > 1), v23 + 1, 1);
        ++v17;
        *(_QWORD *)(v26 + 16) = v23 + 1;
        *(_QWORD *)(v26 + 8 * v23 + 32) = v21;
      }
      while (v15 != v17);
      v13 = v25;
    }
    v24 = a7(v16, v13, v14);
    result = swift_bridgeObjectRelease();
    if ((v24 & 1) == 0)
      *a4 = 1;
  }
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed [NSNumber], @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ()(uint64_t a1)
{
  void (*v1)(void);

  v1 = *(void (**)(void))(a1 + 32);
  type metadata accessor for NSNumber();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v1();
  return swift_bridgeObjectRelease();
}

char *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

uint64_t sub_210830E40()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in NLContextualEmbeddingResult.enumerateTokenVectors(in:using:)(unint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4;

  return closure #1 in NLContextualEmbeddingResult.enumerateTokenVectors(in:using:)(a1, a2, a3, a4, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 32));
}

uint64_t sub_210830E70()
{
  return swift_deallocObject();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

_QWORD *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

{
  _QWORD **v3;
  _QWORD *result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Double>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

_QWORD *specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Double)>);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[3 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 24 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Double));
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<[String : Double]>);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4])
      memmove(v10 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Double]);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

id _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSDySo5NLTagaSo8NSNumberCG_SS_Sdts5NeverOTg5014_sSo5NLTagaSo8e36CSSSdIgggod_AB3key_AD5valuetSS_Sdts5f17OIegnrzr_TR0122_sJ164NLTaggerC15NaturalLanguageE13tagHypotheses2at4unit6scheme12maximumCountSDySSSdG_SnySS5IndexVGtAK_So11NLTokenUnitVSo11a24SchemeaSitFSS_SdtSo0N0a_gB7CtXEfU_Tf3nnnpf_nTf1cn_n(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v3;
  id result;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  int64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (!v1)
    return (id)v2;
  v3 = a1;
  v31 = MEMORY[0x24BEE4AF8];
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v1, 0);
  v2 = v31;
  result = (id)specialized Dictionary.startIndex.getter(v3);
  v6 = (uint64_t)result;
  v7 = 0;
  v8 = v3 + 64;
  v26 = v3 + 80;
  v27 = v1;
  v28 = v5;
  v29 = v3 + 64;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(_BYTE *)(v3 + 32))
  {
    v11 = (unint64_t)v6 >> 6;
    if ((*(_QWORD *)(v8 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0)
      goto LABEL_23;
    if (*(_DWORD *)(v3 + 36) != v5)
      goto LABEL_24;
    v12 = *(void **)(*(_QWORD *)(v3 + 56) + 8 * v6);
    v30 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v14 = v13;
    result = objc_msgSend(v12, sel_doubleValue);
    v16 = v15;
    v17 = v3;
    v19 = *(_QWORD *)(v31 + 16);
    v18 = *(_QWORD *)(v31 + 24);
    if (v19 >= v18 >> 1)
      result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v18 > 1), v19 + 1, 1);
    *(_QWORD *)(v31 + 16) = v19 + 1;
    v20 = (_QWORD *)(v31 + 24 * v19);
    v20[4] = v30;
    v20[5] = v14;
    v20[6] = v16;
    v9 = 1 << *(_BYTE *)(v17 + 32);
    if (v6 >= v9)
      goto LABEL_25;
    v8 = v29;
    v21 = *(_QWORD *)(v29 + 8 * v11);
    if ((v21 & (1 << v6)) == 0)
      goto LABEL_26;
    v3 = v17;
    v5 = v28;
    if (*(_DWORD *)(v17 + 36) != v28)
      goto LABEL_27;
    v22 = v21 & (-2 << (v6 & 0x3F));
    if (v22)
    {
      v9 = __clz(__rbit64(v22)) | v6 & 0xFFFFFFFFFFFFFFC0;
      v10 = v27;
    }
    else
    {
      v23 = v11 + 1;
      v24 = (unint64_t)(v9 + 63) >> 6;
      v10 = v27;
      if (v11 + 1 < v24)
      {
        v25 = *(_QWORD *)(v29 + 8 * v23);
        if (v25)
        {
LABEL_20:
          v9 = __clz(__rbit64(v25)) + (v23 << 6);
        }
        else
        {
          while (v24 - 2 != v11)
          {
            v25 = *(_QWORD *)(v26 + 8 * v11++);
            if (v25)
            {
              v23 = v11 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    ++v7;
    v6 = v9;
    if (v7 == v10)
      return (id)v2;
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t NLTagger.tokenRange(at:unit:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t result;

  v4 = objc_msgSend(v2, sel_string);
  if (v4)
  {
    v5 = v4;
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = v7;

  }
  else
  {
    v6 = 0;
    v8 = 0xE000000000000000;
  }
  lazy protocol witness table accessor for type String and conformance String();
  objc_msgSend(v2, sel_tokenRangeAtIndex_unit_, String.Index.utf16Offset<A>(in:)(), a2, v6, v8);
  NSNotFound.getter();
  v9 = Range<>.init(_:in:)();
  v11 = v10;
  result = swift_bridgeObjectRelease();
  if ((v11 & 1) == 0)
    return v9;
  __break(1u);
  return result;
}

uint64_t NLTagger.tokenRange(for:unit:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t result;

  v4 = v3;
  v8 = objc_msgSend(v3, sel_string);
  if (v8)
  {
    v9 = v8;
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v12 = v11;

  }
  else
  {
    v10 = 0;
    v12 = 0xE000000000000000;
  }
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<String.Index>);
  lazy protocol witness table accessor for type Range<String.Index> and conformance Range<A>();
  lazy protocol witness table accessor for type String and conformance String();
  v13 = _NSRange.init<A, B>(_:in:)();
  v15 = objc_msgSend(v4, sel_tokenRangeForRange_unit_, v13, v14, a3, v10, v12, a1, a2);
  if (v15 == (id)NSNotFound.getter())
    String.Index.utf16Offset<A>(in:)();
  v16 = Range<>.init(_:in:)();
  v18 = v17;
  result = swift_bridgeObjectRelease();
  if ((v18 & 1) == 0)
    return v16;
  __break(1u);
  return result;
}

uint64_t NLTagger.tag(at:unit:scheme:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  char v15;
  char v16;
  uint64_t result;

  v4 = v3;
  v7 = objc_msgSend(v4, sel_string);
  if (v7)
  {
    v8 = v7;
    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v11 = v10;

  }
  else
  {
    v9 = 0;
    v11 = 0xE000000000000000;
  }
  lazy protocol witness table accessor for type String and conformance String();
  v12 = String.Index.utf16Offset<A>(in:)();
  v13 = (_QWORD *)swift_slowAlloc();
  *v13 = 0;
  v13[1] = 0;
  v14 = objc_msgSend(v4, sel_tagAtIndex_unit_scheme_tokenRange_, v12, a2, a3, v13, v9, v11);
  Range<>.init(_:in:)();
  v16 = v15;
  result = swift_bridgeObjectRelease();
  if ((v16 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    MEMORY[0x212BCB584](v13, -1, -1);
    return (uint64_t)v14;
  }
  return result;
}

uint64_t NLTagger.tagHypotheses(at:unit:scheme:maximumCount:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v5;
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t result;
  _QWORD v25[2];

  v5 = v4;
  v9 = objc_msgSend(v5, sel_string);
  if (v9)
  {
    v10 = v9;
    v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v13 = v12;

  }
  else
  {
    v11 = 0;
    v13 = 0xE000000000000000;
  }
  v25[0] = v11;
  v25[1] = v13;
  lazy protocol witness table accessor for type String and conformance String();
  v14 = String.Index.utf16Offset<A>(in:)();
  v15 = (_QWORD *)swift_slowAlloc();
  *v15 = 0;
  v15[1] = 0;
  v16 = objc_msgSend(v5, sel_tagHypothesesAtIndex_unit_scheme_maximumCount_tokenRange_, v14, a2, a3, a4, v15);
  type metadata accessor for NLTag(0);
  type metadata accessor for NSNumber();
  lazy protocol witness table accessor for type NLTag and conformance NLTag();
  v17 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  v18 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSDySo5NLTagaSo8NSNumberCG_SS_Sdts5NeverOTg5014_sSo5NLTagaSo8e36CSSSdIgggod_AB3key_AD5valuetSS_Sdts5f17OIegnrzr_TR0122_sJ164NLTaggerC15NaturalLanguageE13tagHypotheses2at4unit6scheme12maximumCountSDySSSdG_SnySS5IndexVGtAK_So11NLTokenUnitVSo11a24SchemeaSitFSS_SdtSo0N0a_gB7CtXEfU_Tf3nnnpf_nTf1cn_n(v17);
  swift_bridgeObjectRelease();
  if (v18[2])
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Double>);
    v19 = static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    v19 = MEMORY[0x24BEE4B00];
  }
  v25[0] = v19;
  v20 = (_QWORD *)swift_bridgeObjectRetain();
  specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(v20, 1, v25);
  swift_bridgeObjectRelease();
  v21 = v25[0];
  Range<>.init(_:in:)();
  v23 = v22;
  swift_bridgeObjectRelease();
  if ((v23 & 1) != 0)
  {
    __break(1u);
    result = swift_unexpectedError();
    __break(1u);
  }
  else
  {
    MEMORY[0x212BCB584](v15, -1, -1);
    return v21;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type NLTag and conformance NLTag()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type NLTag and conformance NLTag;
  if (!lazy protocol witness table cache variable for type NLTag and conformance NLTag)
  {
    type metadata accessor for NLTag(255);
    result = MEMORY[0x212BCB53C](&protocol conformance descriptor for NLTag, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type NLTag and conformance NLTag);
  }
  return result;
}

id NLTagger.enumerateTags(in:unit:scheme:options:using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void *v7;
  void *v8;
  id result;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD aBlock[8];

  v8 = v7;
  result = objc_msgSend(v8, sel_string);
  if (result)
  {
    v15 = result;
    v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v25 = a5;
    v18 = v17;

    aBlock[6] = v16;
    aBlock[7] = v18;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<String.Index>);
    lazy protocol witness table accessor for type Range<String.Index> and conformance Range<A>();
    lazy protocol witness table accessor for type String and conformance String();
    v19 = _NSRange.init<A, B>(_:in:)();
    v21 = v20;
    v22 = (_QWORD *)swift_allocObject();
    v22[2] = v16;
    v22[3] = v18;
    v22[4] = a6;
    v22[5] = a7;
    v23 = swift_allocObject();
    *(_QWORD *)(v23 + 16) = partial apply for closure #1 in NLTagger.enumerateTags(in:unit:scheme:options:using:);
    *(_QWORD *)(v23 + 24) = v22;
    aBlock[4] = partial apply for thunk for @callee_guaranteed (@unowned _NSRange, @unowned NLTokenizerAttributes, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
    aBlock[5] = v23;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed NLTag?, @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
    aBlock[3] = &block_descriptor_1;
    v24 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v8, sel_enumerateTagsInRange_unit_scheme_options_usingBlock_, v19, v21, a3, a4, v25, v24);
    _Block_release(v24);
    LOBYTE(v24) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = (id)swift_release();
    if ((v24 & 1) != 0)
      __break(1u);
  }
  return result;
}

void thunk for @escaping @callee_guaranteed (@guaranteed NLTag?, @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ()(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void (*v9)(void *, uint64_t, uint64_t, uint64_t);
  id v10;

  v9 = *(void (**)(void *, uint64_t, uint64_t, uint64_t))(a1 + 32);
  v10 = a2;
  v9(a2, a3, a4, a5);

}

uint64_t NLTagger.tags(in:unit:scheme:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v6;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  void *v22;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD v25[3];
  uint64_t aBlock;
  uint64_t v27;
  void (*v28)(uint64_t, void *, uint64_t, uint64_t, uint64_t);
  void *v29;
  uint64_t (*v30)();
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v6 = v5;
  v34 = MEMORY[0x24BEE4AF8];
  v25[2] = &v34;
  v12 = objc_msgSend(v6, sel_string);
  if (!v12)
    return v34;
  v13 = v12;
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v16 = v15;

  aBlock = a1;
  v27 = a2;
  v32 = v14;
  v33 = v16;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<String.Index>);
  lazy protocol witness table accessor for type Range<String.Index> and conformance Range<A>();
  lazy protocol witness table accessor for type String and conformance String();
  v17 = _NSRange.init<A, B>(_:in:)();
  v19 = v18;
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = v14;
  v20[3] = v16;
  v20[4] = partial apply for closure #1 in NLTagger.tags(in:unit:scheme:options:);
  v20[5] = v25;
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = partial apply for closure #1 in NLTagger.enumerateTags(in:unit:scheme:options:using:);
  *(_QWORD *)(v21 + 24) = v20;
  v30 = thunk for @callee_guaranteed (@unowned _NSRange, @unowned NLTokenizerAttributes, @unowned UnsafeMutablePointer<ObjCBool>) -> ()partial apply;
  v31 = v21;
  aBlock = MEMORY[0x24BDAC760];
  v27 = 1107296256;
  v28 = thunk for @escaping @callee_guaranteed (@guaranteed NLTag?, @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
  v29 = &block_descriptor_14_0;
  v22 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_enumerateTagsInRange_unit_scheme_options_usingBlock_, v17, v19, a3, a4, a5, v22);
  _Block_release(v22);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0)
    return v34;
  __break(1u);
  return result;
}

uint64_t closure #1 in NLTagger.tags(in:unit:scheme:options:)(void *a1, uint64_t a2, uint64_t a3, _QWORD **a4)
{
  _QWORD *v8;
  id v9;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;

  v8 = *a4;
  v9 = a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a4 = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v8 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v8[2] + 1, 1, v8);
    *a4 = v8;
  }
  v12 = v8[2];
  v11 = v8[3];
  if (v12 >= v11 >> 1)
    v8 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v11 > 1), v12 + 1, 1, v8);
  v8[2] = v12 + 1;
  v13 = &v8[3 * v12];
  v13[4] = a1;
  v13[5] = a2;
  v13[6] = a3;
  *a4 = v8;
  return 1;
}

id NLTagger.setLanguage(_:range:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return NLTagger.setLanguage(_:range:)(a1, a2, a3, (SEL *)&selRef_setLanguage_range_);
}

id NLTagger.setOrthography(_:range:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return NLTagger.setLanguage(_:range:)(a1, a2, a3, (SEL *)&selRef_setOrthography_range_);
}

id NLTagger.setLanguage(_:range:)(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  void *v4;
  id result;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  result = objc_msgSend(v4, sel_string);
  if (result)
  {
    v10 = result;
    v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v13 = v12;

    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Range<String.Index>);
    lazy protocol witness table accessor for type Range<String.Index> and conformance Range<A>();
    lazy protocol witness table accessor for type String and conformance String();
    v14 = _NSRange.init<A, B>(_:in:)();
    return objc_msgSend(v4, *a4, a1, v14, v15, v11, v13, a2, a3);
  }
  return result;
}

void specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(_QWORD *a1, char a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  char v18;
  void *v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  _BOOL8 v34;
  uint64_t v35;
  char v36;
  char v37;
  _QWORD *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  Swift::String v42;
  Swift::String v43;

  v4 = a1[2];
  if (!v4)
  {
    swift_bridgeObjectRelease();
    return;
  }
  v8 = a1[4];
  v7 = a1[5];
  v9 = a1[6];
  swift_bridgeObjectRetain();
  v10 = (_QWORD *)*a3;
  swift_bridgeObjectRetain();
  v12 = specialized __RawDictionaryStorage.find<A>(_:)(v8, v7);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
    goto LABEL_23;
  v16 = v11;
  if (v10[3] >= v15)
  {
    if ((a2 & 1) != 0)
    {
      if ((v11 & 1) != 0)
        goto LABEL_10;
    }
    else
    {
      specialized _NativeDictionary.copy()();
      if ((v16 & 1) != 0)
        goto LABEL_10;
    }
LABEL_13:
    v20 = (_QWORD *)*a3;
    *(_QWORD *)(*a3 + 8 * (v12 >> 6) + 64) |= 1 << v12;
    v21 = (uint64_t *)(v20[6] + 16 * v12);
    *v21 = v8;
    v21[1] = v7;
    *(_QWORD *)(v20[7] + 8 * v12) = v9;
    v22 = v20[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (v23)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v20[2] = v24;
    v25 = v4 - 1;
    if (v4 == 1)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      return;
    }
    v26 = a1 + 9;
    while (1)
    {
      v28 = *(v26 - 2);
      v27 = *(v26 - 1);
      v29 = *v26;
      v30 = (_QWORD *)*a3;
      swift_bridgeObjectRetain();
      v31 = specialized __RawDictionaryStorage.find<A>(_:)(v28, v27);
      v33 = v30[2];
      v34 = (v32 & 1) == 0;
      v23 = __OFADD__(v33, v34);
      v35 = v33 + v34;
      if (v23)
        break;
      v36 = v32;
      if (v30[3] < v35)
      {
        specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v35, 1);
        v31 = specialized __RawDictionaryStorage.find<A>(_:)(v28, v27);
        if ((v36 & 1) != (v37 & 1))
          goto LABEL_25;
      }
      if ((v36 & 1) != 0)
        goto LABEL_10;
      v38 = (_QWORD *)*a3;
      *(_QWORD *)(*a3 + 8 * (v31 >> 6) + 64) |= 1 << v31;
      v39 = (uint64_t *)(v38[6] + 16 * v31);
      *v39 = v28;
      v39[1] = v27;
      *(_QWORD *)(v38[7] + 8 * v31) = v29;
      v40 = v38[2];
      v23 = __OFADD__(v40, 1);
      v41 = v40 + 1;
      if (v23)
        goto LABEL_24;
      v38[2] = v41;
      v26 += 3;
      if (!--v25)
        goto LABEL_22;
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v15, a2 & 1);
  v17 = specialized __RawDictionaryStorage.find<A>(_:)(v8, v7);
  if ((v16 & 1) == (v18 & 1))
  {
    v12 = v17;
    if ((v16 & 1) == 0)
      goto LABEL_13;
LABEL_10:
    v19 = (void *)swift_allocError();
    swift_willThrow();
    MEMORY[0x212BCB4F4](v19);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();

      return;
    }
    goto LABEL_26;
  }
LABEL_25:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
LABEL_26:
  _StringGuts.grow(_:)(30);
  v42._object = (void *)0x8000000210835640;
  v42._countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v42);
  _print_unlocked<A, B>(_:_:)();
  v43._countAndFlagsBits = 39;
  v43._object = (void *)0xE100000000000000;
  String.append(_:)(v43);
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t sub_2108323E4()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_21083240C()
{
  return swift_deallocObject();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t partial apply for closure #1 in NLTagger.tags(in:unit:scheme:options:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return closure #1 in NLTagger.tags(in:unit:scheme:options:)(a1, a2, a3, *(_QWORD ***)(v3 + 16));
}

uint64_t partial apply for closure #1 in NLTagger.enumerateTags(in:unit:scheme:options:using:)(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v9;
  char v10;

  v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 32);
  result = Range<>.init(_:in:)();
  if ((v10 & 1) == 0)
  {
    result = v7(a1, result, v9);
    if ((result & 1) == 0)
      *a4 = 1;
  }
  return result;
}

uint64_t sub_2108324A4()
{
  return swift_deallocObject();
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;

  Hasher.init(_seed:)();
  String.hash(into:)();
  v4 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

void *specialized _NativeDictionary.copy()()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Double>);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Double>);
  v37 = a2;
  v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v2;
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v11)
        goto LABEL_33;
      v24 = *(_QWORD *)(v36 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v24 = *(_QWORD *)(v36 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    Hasher.init(_seed:)();
    String.hash(into:)();
    result = Hasher._finalize()();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v23 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t specialized Dictionary.startIndex.getter(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 64;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

_QWORD *NLModel.predictedLabelHypotheses(for:maximumCount:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = (void *)MEMORY[0x212BCB1DC]();
  v6 = objc_msgSend(v3, sel_predictedLabelHypothesesForString_maximumCount_, v5, a3);

  type metadata accessor for NSNumber();
  v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  v8 = specialized _NativeDictionary.mapValues<A>(_:)(v7);
  swift_bridgeObjectRelease();
  return v8;
}

id NLModel.predictedLabelHypotheses(forTokens:maximumCount:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  Class isa;
  id v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id result;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  int64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int64_t v40;
  uint64_t v41;
  uint64_t v42;

  isa = Array._bridgeToObjectiveC()().super.isa;
  v5 = objc_msgSend(v2, sel_predictedLabelHypothesesForTokens_maximumCount_, isa, a2);

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : NSNumber]);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  v7 = *(_QWORD *)(v6 + 16);
  if (!v7)
  {
    swift_bridgeObjectRelease();
    return (id)MEMORY[0x24BEE4AF8];
  }
  v42 = MEMORY[0x24BEE4AF8];
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v7, 0);
  v8 = v42;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Double>);
  v9 = 0;
  v35 = v7;
  v36 = v6 + 32;
  while (2)
  {
    v10 = *(_QWORD *)(v36 + 8 * v9);
    v37 = v9 + 1;
    v38 = v8;
    v11 = static _DictionaryStorage.copy(original:)();
    v12 = (_QWORD *)v11;
    v13 = 1 << *(_BYTE *)(v10 + 32);
    v39 = v10 + 64;
    if (v13 < 64)
      v14 = ~(-1 << v13);
    else
      v14 = -1;
    v15 = v14 & *(_QWORD *)(v10 + 64);
    v40 = (unint64_t)(v13 + 63) >> 6;
    v41 = v10;
    v16 = v11 + 64;
    result = (id)swift_bridgeObjectRetain();
    v18 = 0;
    if (v15)
    {
LABEL_7:
      v19 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v20 = v19 | (v18 << 6);
      goto LABEL_24;
    }
    while (1)
    {
      v21 = v18 + 1;
      if (__OFADD__(v18, 1))
        goto LABEL_34;
      if (v21 >= v40)
        goto LABEL_27;
      v22 = *(_QWORD *)(v39 + 8 * v21);
      ++v18;
      if (!v22)
      {
        v18 = v21 + 1;
        if (v21 + 1 >= v40)
          goto LABEL_27;
        v22 = *(_QWORD *)(v39 + 8 * v18);
        if (!v22)
        {
          v18 = v21 + 2;
          if (v21 + 2 >= v40)
            goto LABEL_27;
          v22 = *(_QWORD *)(v39 + 8 * v18);
          if (!v22)
          {
            v18 = v21 + 3;
            if (v21 + 3 >= v40)
              goto LABEL_27;
            v22 = *(_QWORD *)(v39 + 8 * v18);
            if (!v22)
              break;
          }
        }
      }
LABEL_23:
      v15 = (v22 - 1) & v22;
      v20 = __clz(__rbit64(v22)) + (v18 << 6);
LABEL_24:
      v24 = (uint64_t *)(*(_QWORD *)(v41 + 48) + 16 * v20);
      v26 = *v24;
      v25 = v24[1];
      v27 = *(void **)(*(_QWORD *)(v41 + 56) + 8 * v20);
      swift_bridgeObjectRetain();
      result = objc_msgSend(v27, sel_doubleValue);
      *(_QWORD *)(v16 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
      v28 = (_QWORD *)(v12[6] + 16 * v20);
      *v28 = v26;
      v28[1] = v25;
      *(_QWORD *)(v12[7] + 8 * v20) = v29;
      v30 = v12[2];
      v31 = __OFADD__(v30, 1);
      v32 = v30 + 1;
      if (v31)
      {
        __break(1u);
LABEL_34:
        __break(1u);
        goto LABEL_35;
      }
      v12[2] = v32;
      if (v15)
        goto LABEL_7;
    }
    v23 = v21 + 4;
    if (v23 >= v40)
    {
LABEL_27:
      swift_bridgeObjectRelease();
      v8 = v38;
      v34 = *(_QWORD *)(v38 + 16);
      v33 = *(_QWORD *)(v38 + 24);
      if (v34 >= v33 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v33 > 1), v34 + 1, 1);
        v8 = v38;
      }
      *(_QWORD *)(v8 + 16) = v34 + 1;
      *(_QWORD *)(v8 + 8 * v34 + 32) = v12;
      v9 = v37;
      if (v37 == v35)
      {
        swift_bridgeObjectRelease();
        return (id)v8;
      }
      continue;
    }
    break;
  }
  v22 = *(_QWORD *)(v39 + 8 * v23);
  if (v22)
  {
    v18 = v23;
    goto LABEL_23;
  }
  while (1)
  {
    v18 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v18 >= v40)
      goto LABEL_27;
    v22 = *(_QWORD *)(v39 + 8 * v18);
    ++v23;
    if (v22)
      goto LABEL_23;
  }
LABEL_35:
  __break(1u);
  return result;
}

_QWORD *specialized _NativeDictionary.mapValues<A>(_:)(uint64_t a1)
{
  _QWORD *result;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  unint64_t v12;
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Double>);
  result = (_QWORD *)static _DictionaryStorage.copy(original:)();
  v3 = result;
  v4 = 0;
  v27 = a1;
  v7 = *(_QWORD *)(a1 + 64);
  v6 = a1 + 64;
  v5 = v7;
  v8 = 1 << *(_BYTE *)(v6 - 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & v5;
  v26 = (unint64_t)(v8 + 63) >> 6;
  v11 = (char *)(result + 8);
  if ((v9 & v5) == 0)
    goto LABEL_5;
LABEL_4:
  v12 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (i = v12 | (v4 << 6); ; i = __clz(__rbit64(v15)) + (v4 << 6))
  {
    v17 = (uint64_t *)(*(_QWORD *)(v27 + 48) + 16 * i);
    v19 = *v17;
    v18 = v17[1];
    v20 = *(void **)(*(_QWORD *)(v27 + 56) + 8 * i);
    swift_bridgeObjectRetain();
    result = objc_msgSend(v20, sel_doubleValue);
    *(_QWORD *)&v11[(i >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << i;
    v21 = (_QWORD *)(v3[6] + 16 * i);
    *v21 = v19;
    v21[1] = v18;
    *(_QWORD *)(v3[7] + 8 * i) = v22;
    v23 = v3[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (v24)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v3[2] = v25;
    if (v10)
      goto LABEL_4;
LABEL_5:
    v14 = v4 + 1;
    if (__OFADD__(v4, 1))
      goto LABEL_24;
    if (v14 >= v26)
      return v3;
    v15 = *(_QWORD *)(v6 + 8 * v14);
    ++v4;
    if (!v15)
    {
      v4 = v14 + 1;
      if (v14 + 1 >= v26)
        return v3;
      v15 = *(_QWORD *)(v6 + 8 * v4);
      if (!v15)
      {
        v4 = v14 + 2;
        if (v14 + 2 >= v26)
          return v3;
        v15 = *(_QWORD *)(v6 + 8 * v4);
        if (!v15)
          break;
      }
    }
LABEL_18:
    v10 = (v15 - 1) & v15;
  }
  v16 = v14 + 3;
  if (v16 >= v26)
    return v3;
  v15 = *(_QWORD *)(v6 + 8 * v16);
  if (v15)
  {
    v4 = v16;
    goto LABEL_18;
  }
  while (1)
  {
    v4 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v4 >= v26)
      return v3;
    v15 = *(_QWORD *)(v6 + 8 * v4);
    ++v16;
    if (v15)
      goto LABEL_18;
  }
LABEL_25:
  __break(1u);
  return result;
}

{
  _QWORD *result;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t i;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<NLLanguage, Double>);
  result = (_QWORD *)static _DictionaryStorage.copy(original:)();
  v3 = result;
  v4 = 0;
  v5 = *(_QWORD *)(a1 + 64);
  v21 = a1 + 64;
  v6 = 1 << *(_BYTE *)(a1 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & v5;
  v22 = (unint64_t)(v6 + 63) >> 6;
  v9 = (char *)(result + 8);
  if ((v7 & v5) == 0)
    goto LABEL_5;
LABEL_4:
  v10 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (i = v10 | (v4 << 6); ; i = __clz(__rbit64(v13)) + (v4 << 6))
  {
    v15 = *(void **)(*(_QWORD *)(a1 + 56) + 8 * i);
    v16 = *(id *)(*(_QWORD *)(a1 + 48) + 8 * i);
    result = objc_msgSend(v15, sel_doubleValue);
    *(_QWORD *)&v9[(i >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << i;
    *(_QWORD *)(v3[6] + 8 * i) = v16;
    *(_QWORD *)(v3[7] + 8 * i) = v17;
    v18 = v3[2];
    v19 = __OFADD__(v18, 1);
    v20 = v18 + 1;
    if (v19)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v3[2] = v20;
    if (v8)
      goto LABEL_4;
LABEL_5:
    v12 = v4 + 1;
    if (__OFADD__(v4, 1))
      goto LABEL_24;
    if (v12 >= v22)
      return v3;
    v13 = *(_QWORD *)(v21 + 8 * v12);
    ++v4;
    if (!v13)
    {
      v4 = v12 + 1;
      if (v12 + 1 >= v22)
        return v3;
      v13 = *(_QWORD *)(v21 + 8 * v4);
      if (!v13)
      {
        v4 = v12 + 2;
        if (v12 + 2 >= v22)
          return v3;
        v13 = *(_QWORD *)(v21 + 8 * v4);
        if (!v13)
          break;
      }
    }
LABEL_18:
    v8 = (v13 - 1) & v13;
  }
  v14 = v12 + 3;
  if (v14 >= v22)
    return v3;
  v13 = *(_QWORD *)(v21 + 8 * v14);
  if (v13)
  {
    v4 = v14;
    goto LABEL_18;
  }
  while (1)
  {
    v4 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v4 >= v22)
      return v3;
    v13 = *(_QWORD *)(v21 + 8 * v4);
    ++v14;
    if (v13)
      goto LABEL_18;
  }
LABEL_25:
  __break(1u);
  return result;
}

{
  _QWORD *result;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t i;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  void *v15;
  double v16;
  id v17;
  id v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _DictionaryStorage<NLLanguage, NSNumber>);
  result = (_QWORD *)static _DictionaryStorage.copy(original:)();
  v3 = result;
  v4 = 0;
  v5 = *(_QWORD *)(a1 + 64);
  v22 = a1 + 64;
  v6 = 1 << *(_BYTE *)(a1 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & v5;
  v23 = (unint64_t)(v6 + 63) >> 6;
  v9 = (char *)(result + 8);
  if ((v7 & v5) == 0)
    goto LABEL_5;
LABEL_4:
  v10 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (i = v10 | (v4 << 6); ; i = __clz(__rbit64(v13)) + (v4 << 6))
  {
    v15 = *(void **)(*(_QWORD *)(a1 + 48) + 8 * i);
    v16 = *(double *)(*(_QWORD *)(a1 + 56) + 8 * i);
    v17 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
    v18 = v15;
    result = objc_msgSend(v17, sel_initWithDouble_, v16);
    *(_QWORD *)&v9[(i >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << i;
    *(_QWORD *)(v3[6] + 8 * i) = v18;
    *(_QWORD *)(v3[7] + 8 * i) = result;
    v19 = v3[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v3[2] = v21;
    if (v8)
      goto LABEL_4;
LABEL_5:
    v12 = v4 + 1;
    if (__OFADD__(v4, 1))
      goto LABEL_24;
    if (v12 >= v23)
      return v3;
    v13 = *(_QWORD *)(v22 + 8 * v12);
    ++v4;
    if (!v13)
    {
      v4 = v12 + 1;
      if (v12 + 1 >= v23)
        return v3;
      v13 = *(_QWORD *)(v22 + 8 * v4);
      if (!v13)
      {
        v4 = v12 + 2;
        if (v12 + 2 >= v23)
          return v3;
        v13 = *(_QWORD *)(v22 + 8 * v4);
        if (!v13)
          break;
      }
    }
LABEL_18:
    v8 = (v13 - 1) & v13;
  }
  v14 = v12 + 3;
  if (v14 >= v23)
    return v3;
  v13 = *(_QWORD *)(v22 + 8 * v14);
  if (v13)
  {
    v4 = v14;
    goto LABEL_18;
  }
  while (1)
  {
    v4 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v4 >= v23)
      return v3;
    v13 = *(_QWORD *)(v22 + 8 * v4);
    ++v14;
    if (v13)
      goto LABEL_18;
  }
LABEL_25:
  __break(1u);
  return result;
}

Swift::Double __swiftcall NLEmbedding.distance(between:and:distanceType:)(Swift::String between, Swift::String and, NLDistanceType distanceType)
{
  void *v3;
  void *object;
  uint64_t countAndFlagsBits;
  void *v7;
  void *v8;
  double v9;
  double v10;

  object = and._object;
  countAndFlagsBits = and._countAndFlagsBits;
  v7 = (void *)MEMORY[0x212BCB1DC](between._countAndFlagsBits, between._object);
  v8 = (void *)MEMORY[0x212BCB1DC](countAndFlagsBits, object);
  objc_msgSend(v3, sel_distanceBetweenString_andString_distanceType_, v7, v8, distanceType);
  v10 = v9;

  return v10;
}

uint64_t NLEmbedding.enumerateNeighbors(for:maximumCount:distanceType:using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v6;
  void *v7;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t result;
  _QWORD v17[6];

  v7 = v6;
  v12 = (void *)MEMORY[0x212BCB1DC]();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a5;
  *(_QWORD *)(v13 + 24) = a6;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = partial apply for closure #1 in NLEmbedding.enumerateNeighbors(for:maximumCount:distanceType:using:);
  *(_QWORD *)(v14 + 24) = v13;
  v17[4] = partial apply for thunk for @callee_guaranteed (@unowned _NSRange, @unowned NLTokenizerAttributes, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
  v17[5] = v14;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 1107296256;
  v17[2] = thunk for @escaping @callee_guaranteed (@guaranteed String, @unowned Double, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
  v17[3] = &block_descriptor_2;
  v15 = _Block_copy(v17);
  swift_retain();
  swift_release();
  objc_msgSend(v7, sel_enumerateNeighborsForString_maximumCount_distanceType_usingBlock_, v12, a3, a4, v15);

  _Block_release(v15);
  LOBYTE(a4) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((a4 & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_210833300()
{
  return swift_deallocObject();
}

uint64_t sub_210833314()
{
  return swift_deallocObject();
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed String, @unowned Double, @unowned UnsafeMutablePointer<ObjCBool>) -> ()(uint64_t a1, double a2)
{
  void (*v3)(uint64_t, double);
  uint64_t v4;

  v3 = *(void (**)(uint64_t, double))(a1 + 32);
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3(v4, a2);
  return swift_bridgeObjectRelease();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t NLEmbedding.neighbors(for:maximumCount:distanceType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v5;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t result;
  _QWORD v13[3];
  _QWORD aBlock[6];
  uint64_t v15;

  v5 = v4;
  v15 = MEMORY[0x24BEE4AF8];
  v13[2] = &v15;
  v8 = (void *)MEMORY[0x212BCB1DC]();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = partial apply for closure #1 in NLEmbedding.neighbors(for:maximumCount:distanceType:);
  *(_QWORD *)(v9 + 24) = v13;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = partial apply for closure #1 in NLEmbedding.enumerateNeighbors(for:maximumCount:distanceType:using:);
  *(_QWORD *)(v10 + 24) = v9;
  aBlock[4] = thunk for @callee_guaranteed (@unowned _NSRange, @unowned NLTokenizerAttributes, @unowned UnsafeMutablePointer<ObjCBool>) -> ()partial apply;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed String, @unowned Double, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
  aBlock[3] = &block_descriptor_14_1;
  v11 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_enumerateNeighborsForString_maximumCount_distanceType_usingBlock_, v8, a3, a4, v11);

  _Block_release(v11);
  LOBYTE(a4) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((a4 & 1) == 0)
    return v15;
  __break(1u);
  return result;
}

uint64_t partial apply for closure #1 in NLEmbedding.neighbors(for:maximumCount:distanceType:)(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3;

  return closure #1 in NLEmbedding.neighbors(for:maximumCount:distanceType:)(a1, a2, *(_QWORD ***)(v3 + 16), a3) & 1;
}

uint64_t sub_210833518()
{
  return swift_deallocObject();
}

uint64_t sub_210833528()
{
  return swift_deallocObject();
}

uint64_t NLEmbedding.enumerateNeighbors(for:maximumCount:distanceType:using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double *v14;
  double v15;
  Class isa;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD aBlock[6];

  v6 = v5;
  v9 = a3;
  v10 = a2;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11)
  {
    aBlock[0] = MEMORY[0x24BEE4AF8];
    specialized ContiguousArray.reserveCapacity(_:)();
    v14 = (double *)(a1 + 32);
    do
    {
      v15 = *v14++;
      objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, v15);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      --v11;
    }
    while (v11);
    v9 = a3;
    v10 = a2;
  }
  type metadata accessor for NSNumber();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a4;
  *(_QWORD *)(v17 + 24) = a5;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = partial apply for closure #1 in NLEmbedding.enumerateNeighbors(for:maximumCount:distanceType:using:);
  *(_QWORD *)(v18 + 24) = v17;
  aBlock[4] = thunk for @callee_guaranteed (@unowned _NSRange, @unowned NLTokenizerAttributes, @unowned UnsafeMutablePointer<ObjCBool>) -> ()partial apply;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed String, @unowned Double, @unowned UnsafeMutablePointer<ObjCBool>) -> ();
  aBlock[3] = &block_descriptor_24;
  v19 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_enumerateNeighborsForVector_maximumCount_distanceType_usingBlock_, isa, v10, v9, v19);

  _Block_release(v19);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_210833750()
{
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in NLEmbedding.enumerateNeighbors(for:maximumCount:distanceType:using:)(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v3;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v3 + 16))();
  if ((result & 1) == 0)
    *a3 = 1;
  return result;
}

uint64_t sub_210833790()
{
  return swift_deallocObject();
}

uint64_t NLEmbedding.neighbors(for:maximumCount:distanceType:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD v4[3];
  uint64_t v5;

  v5 = MEMORY[0x24BEE4AF8];
  v4[2] = &v5;
  NLEmbedding.enumerateNeighbors(for:maximumCount:distanceType:using:)(a1, a2, a3, (uint64_t)partial apply for closure #1 in NLEmbedding.neighbors(for:maximumCount:distanceType:), (uint64_t)v4);
  return v5;
}

uint64_t closure #1 in NLEmbedding.neighbors(for:maximumCount:distanceType:)(uint64_t a1, uint64_t a2, _QWORD **a3, double a4)
{
  _QWORD *v8;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v10;
  unint64_t v11;
  double *v12;

  v8 = *a3;
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a3 = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v8 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v8[2] + 1, 1, v8);
    *a3 = v8;
  }
  v11 = v8[2];
  v10 = v8[3];
  if (v11 >= v10 >> 1)
  {
    v8 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v10 > 1), v11 + 1, 1, v8);
    *a3 = v8;
  }
  v8[2] = v11 + 1;
  v12 = (double *)&v8[3 * v11];
  *((_QWORD *)v12 + 4) = a1;
  *((_QWORD *)v12 + 5) = a2;
  v12[6] = a4;
  return 1;
}

Swift::OpaquePointer_optional __swiftcall NLEmbedding.vector(for:)(Swift::String a1)
{
  void *v1;
  void *v2;
  id v3;
  Swift::Bool v4;
  unint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  Swift::OpaquePointer_optional result;

  v2 = (void *)MEMORY[0x212BCB1DC](a1._countAndFlagsBits, a1._object);
  v3 = objc_msgSend(v1, sel_vectorForString_, v2);

  if (!v3)
    goto LABEL_15;
  type metadata accessor for NSNumber();
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    v6 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v6)
      goto LABEL_4;
LABEL_14:
    swift_bridgeObjectRelease();
    v3 = (id)MEMORY[0x24BEE4AF8];
    goto LABEL_15;
  }
  v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v6)
    goto LABEL_14;
LABEL_4:
  v15 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v7 = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v6 & ~(v6 >> 63), 0);
  if (v6 < 0)
  {
    __break(1u);
    goto LABEL_17;
  }
  v8 = 0;
  v3 = v15;
  do
  {
    if ((v5 & 0xC000000000000001) != 0)
      v9 = (id)MEMORY[0x212BCB26C](v8, v5);
    else
      v9 = *(id *)(v5 + 8 * v8 + 32);
    v10 = v9;
    objc_msgSend(v9, sel_doubleValue);
    v12 = v11;

    v14 = v15[2];
    v13 = v15[3];
    if (v14 >= v13 >> 1)
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v13 > 1), v14 + 1, 1);
    ++v8;
    v15[2] = v14 + 1;
    v15[v14 + 4] = v12;
  }
  while (v6 != v8);
  swift_bridgeObjectRelease();
LABEL_15:
  v7 = (char *)v3;
LABEL_17:
  result.value._rawValue = v7;
  result.is_nil = v4;
  return result;
}

id static NLEmbedding.write(_:language:revision:to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *ObjCClassFromMetadata;
  Class isa;
  NSURL *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v12;
  id v13[2];

  v13[1] = *(id *)MEMORY[0x24BDAC8D0];
  specialized _NativeDictionary.mapValues<A>(_:)(a1);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [NSNumber]);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_release();
  URL._bridgeToObjectiveC()(v7);
  v9 = v8;
  v13[0] = 0;
  v10 = objc_msgSend(ObjCClassFromMetadata, sel_writeEmbeddingForDictionary_language_revision_toURL_error_, isa, a2, a3, v8, v13);

  if (v10)
    return v13[0];
  v12 = v13[0];
  _convertNSErrorToError(_:)();

  return (id)swift_willThrow();
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Range<String.Index>>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

_QWORD *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(NLTag?, Range<String.Index>)>);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[3 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 24 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (NLTag?, Range<String.Index>));
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Double)>);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[3 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 24 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Double));
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t specialized _NativeDictionary.mapValues<A>(_:)(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t i;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  _QWORD *v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, [NSNumber]>);
  result = static _DictionaryStorage.copy(original:)();
  v3 = (_QWORD *)result;
  v4 = 0;
  v30 = a1;
  v7 = *(_QWORD *)(a1 + 64);
  v6 = a1 + 64;
  v5 = v7;
  v8 = 1 << *(_BYTE *)(v6 - 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & v5;
  v28 = (unint64_t)(v8 + 63) >> 6;
  v29 = result + 64;
  v27 = (_QWORD *)result;
  if ((v9 & v5) == 0)
    goto LABEL_5;
LABEL_4:
  v11 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (i = v11 | (v4 << 6); ; i = __clz(__rbit64(v14)) + (v4 << 6))
  {
    v16 = (uint64_t *)(*(_QWORD *)(v30 + 48) + 16 * i);
    v17 = *v16;
    v18 = *(_QWORD *)(*(_QWORD *)(v30 + 56) + 8 * i);
    v19 = *(_QWORD *)(v18 + 16);
    if (v19)
    {
      v31 = *v16;
      v33 = v4;
      v34 = MEMORY[0x24BEE4AF8];
      v32 = v16[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      specialized ContiguousArray.reserveCapacity(_:)();
      v20 = 0;
      do
      {
        v21 = v20 + 1;
        objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, *(double *)(v18 + 8 * v20 + 32));
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
        v20 = v21;
      }
      while (v19 != v21);
      v22 = v34;
      swift_bridgeObjectRelease();
      v3 = v27;
      v4 = v33;
      v17 = v31;
      result = v32;
    }
    else
    {
      result = swift_bridgeObjectRetain();
      v22 = MEMORY[0x24BEE4AF8];
    }
    *(_QWORD *)(v29 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    v23 = (_QWORD *)(v3[6] + 16 * i);
    *v23 = v17;
    v23[1] = result;
    *(_QWORD *)(v3[7] + 8 * i) = v22;
    v24 = v3[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (v25)
    {
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    v3[2] = v26;
    if (v10)
      goto LABEL_4;
LABEL_5:
    v13 = v4 + 1;
    if (__OFADD__(v4, 1))
      goto LABEL_29;
    if (v13 >= v28)
      return (uint64_t)v3;
    v14 = *(_QWORD *)(v6 + 8 * v13);
    ++v4;
    if (!v14)
    {
      v4 = v13 + 1;
      if (v13 + 1 >= v28)
        return (uint64_t)v3;
      v14 = *(_QWORD *)(v6 + 8 * v4);
      if (!v14)
      {
        v4 = v13 + 2;
        if (v13 + 2 >= v28)
          return (uint64_t)v3;
        v14 = *(_QWORD *)(v6 + 8 * v4);
        if (!v14)
          break;
      }
    }
LABEL_18:
    v10 = (v14 - 1) & v14;
  }
  v15 = v13 + 3;
  if (v15 >= v28)
    return (uint64_t)v3;
  v14 = *(_QWORD *)(v6 + 8 * v15);
  if (v14)
  {
    v4 = v15;
    goto LABEL_18;
  }
  while (1)
  {
    v4 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v4 >= v28)
      return (uint64_t)v3;
    v14 = *(_QWORD *)(v6 + 8 * v4);
    ++v15;
    if (v14)
      goto LABEL_18;
  }
LABEL_30:
  __break(1u);
  return result;
}

_QWORD *NLLanguageRecognizer.languageHints.getter()
{
  void *v0;
  id v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = objc_msgSend(v0, sel_languageHints);
  type metadata accessor for NLLanguage(0);
  type metadata accessor for NSNumber();
  lazy protocol witness table accessor for type NLLanguage and conformance NLLanguage();
  v2 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  v3 = specialized _NativeDictionary.mapValues<A>(_:)(v2);
  swift_bridgeObjectRelease();
  return v3;
}

unint64_t lazy protocol witness table accessor for type NLLanguage and conformance NLLanguage()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type NLLanguage and conformance NLLanguage;
  if (!lazy protocol witness table cache variable for type NLLanguage and conformance NLLanguage)
  {
    type metadata accessor for NLLanguage(255);
    result = MEMORY[0x212BCB53C](&protocol conformance descriptor for NLLanguage, v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type NLLanguage and conformance NLLanguage);
  }
  return result;
}

uint64_t key path getter for NLLanguageRecognizer.languageHints : NLLanguageRecognizer@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t result;

  v3 = objc_msgSend(*a1, sel_languageHints);
  type metadata accessor for NLLanguage(0);
  type metadata accessor for NSNumber();
  lazy protocol witness table accessor for type NLLanguage and conformance NLLanguage();
  v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  v5 = specialized _NativeDictionary.mapValues<A>(_:)(v4);
  result = swift_bridgeObjectRelease();
  *a2 = v5;
  return result;
}

void key path setter for NLLanguageRecognizer.languageHints : NLLanguageRecognizer(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  Class isa;

  v2 = *a2;
  v3 = swift_bridgeObjectRetain();
  specialized _NativeDictionary.mapValues<A>(_:)(v3);
  swift_bridgeObjectRelease();
  type metadata accessor for NLLanguage(0);
  type metadata accessor for NSNumber();
  lazy protocol witness table accessor for type NLLanguage and conformance NLLanguage();
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_release();
  objc_msgSend(v2, sel_setLanguageHints_, isa);

}

void NLLanguageRecognizer.languageHints.setter(uint64_t a1)
{
  void *v1;
  Class isa;

  specialized _NativeDictionary.mapValues<A>(_:)(a1);
  swift_bridgeObjectRelease();
  type metadata accessor for NLLanguage(0);
  type metadata accessor for NSNumber();
  lazy protocol witness table accessor for type NLLanguage and conformance NLLanguage();
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_release();
  objc_msgSend(v1, sel_setLanguageHints_, isa);

}

void (*NLLanguageRecognizer.languageHints.modify(_QWORD *a1))(uint64_t **a1, char a2)
{
  void *v1;
  _QWORD *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[1] = v1;
  v4 = objc_msgSend(v1, sel_languageHints);
  type metadata accessor for NLLanguage(0);
  v3[2] = v5;
  v3[3] = type metadata accessor for NSNumber();
  v3[4] = lazy protocol witness table accessor for type NLLanguage and conformance NLLanguage();
  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  v7 = specialized _NativeDictionary.mapValues<A>(_:)(v6);
  v3[5] = 0;
  swift_bridgeObjectRelease();
  *v3 = v7;
  return NLLanguageRecognizer.languageHints.modify;
}

void NLLanguageRecognizer.languageHints.modify(uint64_t **a1, char a2)
{
  uint64_t *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  Class isa;
  Class v7;

  v2 = *a1;
  v3 = (void *)(*a1)[1];
  v4 = **a1;
  if ((a2 & 1) != 0)
  {
    v5 = swift_bridgeObjectRetain();
    specialized _NativeDictionary.mapValues<A>(_:)(v5);
    swift_bridgeObjectRelease();
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_release();
    objc_msgSend(v3, sel_setLanguageHints_, isa);

    swift_bridgeObjectRelease();
  }
  else
  {
    specialized _NativeDictionary.mapValues<A>(_:)(v4);
    swift_bridgeObjectRelease();
    v7 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_release();
    objc_msgSend(v3, sel_setLanguageHints_, v7);

  }
  free(v2);
}

_QWORD *NLLanguageRecognizer.languageHypotheses(withMaximum:)(uint64_t a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = objc_msgSend(v1, sel_languageHypothesesWithMaximum_, a1);
  type metadata accessor for NLLanguage(0);
  type metadata accessor for NSNumber();
  lazy protocol witness table accessor for type NLLanguage and conformance NLLanguage();
  v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  v4 = specialized _NativeDictionary.mapValues<A>(_:)(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t NSNotFound.getter()
{
  return MEMORY[0x24BDCAF28]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x24BDCD2F8]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
  MEMORY[0x24BDCD8D0](retstr);
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x24BDCF808]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCF830]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E0]();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t String.Index.utf16Offset<A>(in:)()
{
  return MEMORY[0x24BEE0B38]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x24BEE0BC0](a1._countAndFlagsBits, a1._object);
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x24BDCFBA8]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t Range<>.init(_:in:)()
{
  return MEMORY[0x24BDCFD70]();
}

uint64_t _NSRange.init<A, B>(_:in:)()
{
  return MEMORY[0x24BDD0278]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE2510](a1);
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t _SwiftNewtypeWrapper<>._toCustomAnyHashable()()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x24BEE42E0]();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x24BEE4328]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

