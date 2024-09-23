void sub_2488F16F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 192), 8);
  _Block_object_dispose((const void *)(v31 - 160), 8);
  _Block_object_dispose((const void *)(v31 - 128), 8);
  _Block_object_dispose((const void *)(v31 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2488F21BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __swiftcall WordPieceTokenizer.init()(TextUnderstandingShared::WordPieceTokenizer_optional *__return_ptr retstr)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  NSObject *v21;
  uint64_t v22;

  v1 = type metadata accessor for Logger();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1, v3, v4);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (void *)MEMORY[0x24959E374](0xD000000000000021, 0x8000000248917DE0);
  v8 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v7);

  if (v8
    && (v9 = v8,
        v10 = (void *)MEMORY[0x24959E374](0x6365697064726F77, 0xEE006261636F7665),
        v11 = (void *)MEMORY[0x24959E374](1701409396, 0xE400000000000000),
        v12 = -[NSObject pathForResource:ofType:](v9, sel_pathForResource_ofType_, v10, v11),
        v9,
        v10,
        v11,
        v12))
  {
    v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v15 = v14;

    v16 = specialized WordPieceTokenizer.init(path:)(v13, v15);
    v17 = v16;

    if (v16)
  }
  else
  {
    Logger.init()();
    v18 = Logger.logObject.getter();
    v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_2488EF000, v18, v19, "Could not find file wordpiecevocab.trie", v20, 2u);
      MEMORY[0x24959F0A0](v20, -1, -1);
      v21 = v8;
    }
    else
    {
      v21 = v18;
      v18 = v8;
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v6, v1);
  }
}

void __swiftcall WordPieceTokenizer.encode(text:)(TextUnderstandingShared::TokenizerOutput *__return_ptr retstr, Swift::String text)
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  _BYTE v12[48];

  v3 = v2;
  *(Swift::String *)v12 = String.lowercased()();
  v11 = lazy protocol witness table accessor for type String and conformance String();
  v10 = MEMORY[0x24BEE0D00];
  v5 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
  v7 = v6;
  swift_bridgeObjectRelease();
  v8 = (void *)MEMORY[0x24959E374](v5, v7);
  v9 = objc_msgSend(v3, sel_tokenize_withLength_, v8, 512, v10, v11, v11, v11, 32, 0xE100000000000000, 10, 0xE100000000000000);

  objc_msgSend(v3, sel_padId);
  specialized TokenizerOutput.init(tokenizerOutputObjc:padId:processedInput:)(v9);
  *retstr = *(TextUnderstandingShared::TokenizerOutput *)v12;
}

uint64_t variable initialization expression of TUSLazyPurgeable.item@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 56))(a2, 1, 1);
}

uint64_t variable initialization expression of TUSLazyPurgeable.memoryPressureSource()
{
  return 0;
}

uint64_t variable initialization expression of TrialDecoder.factorDownloader()
{
  return 0;
}

uint64_t variable initialization expression of TUSTrialNamespaceManager._assets@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v5;

  v5 = type metadata accessor for TUSTrialAssets(0, a1, a2, a3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(a4, 1, 1, v5);
}

double variable initialization expression of TUSTrialNamespaceManager.minimumSecondsBetweenForcedRefresh()
{
  return 86400.0;
}

uint64_t variable initialization expression of CaptionPhraseResolver.languageToUninterestingPhrases()
{
  return 0;
}

uint64_t variable initialization expression of CaptionPhraseResolver.languageToDisallowedTokens()
{
  return 0;
}

id default argument 1 of static TextUnderstandingSupport.load(contentsOf:configuration:completionHandler:)()
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBFFD8]), sel_init);
}

id default argument 1 of TextUnderstandingSupport.prediction(input:options:)()
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC0018]), sel_init);
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance NLLanguage(uint64_t a1, uint64_t a2)
{
  return protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance NLLanguage(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance NLLanguage(uint64_t a1, uint64_t a2)
{
  return protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance NLLanguage(a1, a2, MEMORY[0x24BEE0CD8]);
}

void protocol witness for SetAlgebra.init() in conformance NSMatchingOptions(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance NLLanguage(uint64_t a1, id *a2)
{
  uint64_t result;

  result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance NLLanguage(uint64_t a1, id *a2)
{
  char v3;

  v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance NLLanguage@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3 = MEMORY[0x24959E374](v2);
  result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

BOOL protocol witness for SetAlgebra.insert(_:) in conformance NLTaggerOptions(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance NLLanguageID(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
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

_QWORD *protocol witness for OptionSet.init(rawValue:) in conformance NSMatchingOptions@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance NLLanguageID(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance NLLanguage()
{
  lazy protocol witness table accessor for type NLTagScheme and conformance NLTagScheme(&lazy protocol witness table cache variable for type NLLanguage and conformance NLLanguage, (uint64_t (*)(uint64_t))type metadata accessor for NLLanguage, (uint64_t)&protocol conformance descriptor for NLLanguage);
  lazy protocol witness table accessor for type NLTagScheme and conformance NLTagScheme(&lazy protocol witness table cache variable for type NLLanguage and conformance NLLanguage, (uint64_t (*)(uint64_t))type metadata accessor for NLLanguage, (uint64_t)&protocol conformance descriptor for NLLanguage);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance NLTag()
{
  lazy protocol witness table accessor for type NLTagScheme and conformance NLTagScheme(&lazy protocol witness table cache variable for type NLTag and conformance NLTag, (uint64_t (*)(uint64_t))type metadata accessor for NLTag, (uint64_t)&protocol conformance descriptor for NLTag);
  lazy protocol witness table accessor for type NLTagScheme and conformance NLTagScheme(&lazy protocol witness table cache variable for type NLTag and conformance NLTag, (uint64_t (*)(uint64_t))type metadata accessor for NLTag, (uint64_t)&protocol conformance descriptor for NLTag);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance NLTag@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = MEMORY[0x24959E374](*a1, a1[1]);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance NLTagScheme()
{
  lazy protocol witness table accessor for type NLTagScheme and conformance NLTagScheme(&lazy protocol witness table cache variable for type NLTagScheme and conformance NLTagScheme, (uint64_t (*)(uint64_t))type metadata accessor for NLTagScheme, (uint64_t)&protocol conformance descriptor for NLTagScheme);
  lazy protocol witness table accessor for type NLTagScheme and conformance NLTagScheme(&lazy protocol witness table cache variable for type NLTagScheme and conformance NLTagScheme, (uint64_t (*)(uint64_t))type metadata accessor for NLTagScheme, (uint64_t)&protocol conformance descriptor for NLTagScheme);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance NLLanguage(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t protocol witness for Hashable.hash(into:) in conformance NLLanguage()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance NLLanguage()
{
  Swift::Int v0;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance NLLanguage()
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

uint64_t serialize(_:at:)(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

id specialized WordPieceTokenizer.init(path:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  _QWORD v19[3];
  uint64_t v20;

  v4 = type metadata accessor for Logger();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6, v7);
  v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_allocWithZone((Class)BurstTrieDictionary);
  swift_bridgeObjectRetain();
  v11 = (void *)MEMORY[0x24959E374](a1, a2);
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(v10, sel_initWithPath_, v11);

  if (v12)
  {
    swift_bridgeObjectRelease();
    v13 = objc_msgSend(objc_allocWithZone((Class)WordPieceTokenizerObjc), sel_initWithVocab_, v12);

  }
  else
  {
    Logger.init()();
    swift_bridgeObjectRetain();
    v14 = Logger.logObject.getter();
    v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = swift_slowAlloc();
      v20 = v17;
      *(_DWORD *)v16 = 136315138;
      v19[1] = v16 + 4;
      swift_bridgeObjectRetain();
      v19[2] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, &v20);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2488EF000, v14, v15, "Could not create burst trie dictionary for path %s", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24959F0A0](v17, -1, -1);
      MEMORY[0x24959F0A0](v16, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v4);
    return 0;
  }
  return v13;
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    result = MEMORY[0x24959EFF8](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

ValueMetadata *type metadata accessor for WordPieceTokenizer()
{
  return &type metadata for WordPieceTokenizer;
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
  type metadata accessor for _NSRange(a1, &lazy cache variable for type metadata for _NSRange);
}

void type metadata accessor for NLTag(uint64_t a1)
{
  type metadata accessor for _NSRange(a1, &lazy cache variable for type metadata for NLTag);
}

void type metadata accessor for NLTagScheme(uint64_t a1)
{
  type metadata accessor for _NSRange(a1, &lazy cache variable for type metadata for NLTagScheme);
}

uint64_t base witness table accessor for RawRepresentable in NLTagScheme()
{
  return lazy protocol witness table accessor for type NLTagScheme and conformance NLTagScheme(&lazy protocol witness table cache variable for type NLTagScheme and conformance NLTagScheme, (uint64_t (*)(uint64_t))type metadata accessor for NLTagScheme, (uint64_t)&protocol conformance descriptor for NLTagScheme);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in NLTagScheme()
{
  return lazy protocol witness table accessor for type NLTagScheme and conformance NLTagScheme(&lazy protocol witness table cache variable for type NLTagScheme and conformance NLTagScheme, (uint64_t (*)(uint64_t))type metadata accessor for NLTagScheme, (uint64_t)&protocol conformance descriptor for NLTagScheme);
}

uint64_t lazy protocol witness table accessor for type NLTagScheme and conformance NLTagScheme(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24959EFF8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t base witness table accessor for Equatable in NLTagScheme()
{
  return lazy protocol witness table accessor for type NLTagScheme and conformance NLTagScheme(&lazy protocol witness table cache variable for type NLTagScheme and conformance NLTagScheme, (uint64_t (*)(uint64_t))type metadata accessor for NLTagScheme, (uint64_t)&protocol conformance descriptor for NLTagScheme);
}

uint64_t base witness table accessor for RawRepresentable in NLTag()
{
  return lazy protocol witness table accessor for type NLTagScheme and conformance NLTagScheme(&lazy protocol witness table cache variable for type NLTag and conformance NLTag, (uint64_t (*)(uint64_t))type metadata accessor for NLTag, (uint64_t)&protocol conformance descriptor for NLTag);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in NLTag()
{
  return lazy protocol witness table accessor for type NLTagScheme and conformance NLTagScheme(&lazy protocol witness table cache variable for type NLTag and conformance NLTag, (uint64_t (*)(uint64_t))type metadata accessor for NLTag, (uint64_t)&protocol conformance descriptor for NLTag);
}

uint64_t base witness table accessor for Equatable in NLTag()
{
  return lazy protocol witness table accessor for type NLTagScheme and conformance NLTagScheme(&lazy protocol witness table cache variable for type NLTag and conformance NLTag, (uint64_t (*)(uint64_t))type metadata accessor for NLTag, (uint64_t)&protocol conformance descriptor for NLTag);
}

void type metadata accessor for NLLanguage(uint64_t a1)
{
  type metadata accessor for _NSRange(a1, &lazy cache variable for type metadata for NLLanguage);
}

void type metadata accessor for _NSRange(uint64_t a1, unint64_t *a2)
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

uint64_t base witness table accessor for RawRepresentable in NLLanguage()
{
  return lazy protocol witness table accessor for type NLTagScheme and conformance NLTagScheme(&lazy protocol witness table cache variable for type NLLanguage and conformance NLLanguage, (uint64_t (*)(uint64_t))type metadata accessor for NLLanguage, (uint64_t)&protocol conformance descriptor for NLLanguage);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in NLLanguage()
{
  return lazy protocol witness table accessor for type NLTagScheme and conformance NLTagScheme(&lazy protocol witness table cache variable for type NLLanguage and conformance NLLanguage, (uint64_t (*)(uint64_t))type metadata accessor for NLLanguage, (uint64_t)&protocol conformance descriptor for NLLanguage);
}

uint64_t base witness table accessor for Equatable in NLLanguage()
{
  return lazy protocol witness table accessor for type NLTagScheme and conformance NLTagScheme(&lazy protocol witness table cache variable for type NLLanguage and conformance NLLanguage, (uint64_t (*)(uint64_t))type metadata accessor for NLLanguage, (uint64_t)&protocol conformance descriptor for NLLanguage);
}

void ThreadsafeDictionary.dictionary.setter()
{
  swift_deletedMethodError();
  __break(1u);
}

uint64_t static HardwareDetection.isMac()()
{
  return 0;
}

uint64_t static HardwareDetection.isH13ANE()()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  BOOL v6;
  char v7;
  char v8;

  v0 = (void *)objc_opt_self();
  if (!objc_msgSend(v0, sel_hasANE))
    goto LABEL_13;
  v1 = objc_msgSend(v0, sel_aneSubType);
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = v3;

  v5 = v2 == 3223912 && v4 == 0xE300000000000000;
  if (v5
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0
    || (v2 == 3289448 ? (v6 = v4 == 0xE300000000000000) : (v6 = 0), v6))
  {
    swift_bridgeObjectRelease();
LABEL_13:
    v8 = 0;
    return v8 & 1;
  }
  v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  v8 = v7 ^ 1;
  return v8 & 1;
}

uint64_t static HardwareDetection.isSmolBERToCapable()()
{
  return 0;
}

ValueMetadata *type metadata accessor for HardwareDetection()
{
  return &type metadata for HardwareDetection;
}

unint64_t one-time initialization function for shared()
{
  id v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v0 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v1 = (void *)MEMORY[0x24959E374](0x79654B656C707041, 0xEE00736472616F62);
  v2 = objc_msgSend(v0, sel_stringArrayForKey_, v1);

  if (v2)
  {
    v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  }
  else
  {
    v3 = 0;
  }
  v4 = specialized static LanguageDetection.userLanguagesWithKeyboardDefaults(_:)(v3);
  swift_bridgeObjectRelease();
  v5 = specialized _copyCollectionToContiguousArray<A>(_:)(v4);
  swift_bridgeObjectRelease();
  result = specialized LocaleDetection.init(languageLimit:preferredLocales:)(0, (uint64_t)v5);
  static LocaleDetection.shared = result;
  *(_QWORD *)algn_254460408 = v7;
  qword_254460410 = v8;
  return result;
}

uint64_t *LocaleDetection.shared.unsafeMutableAddressor()
{
  if (one-time initialization token for shared != -1)
    swift_once();
  return &static LocaleDetection.shared;
}

uint64_t static LocaleDetection.shared.getter()
{
  uint64_t v0;

  if (one-time initialization token for shared != -1)
    swift_once();
  v0 = static LocaleDetection.shared;
  swift_retain();
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t LocaleDetection.preferredLocales.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t static LocaleDetection.isLanguageMismatched(forIdentifier:otherIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v23;
  uint64_t v24;

  v8 = type metadata accessor for Logger();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10, v11);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (String.count.getter() >= 2 && String.count.getter() >= 2)
  {
    v18 = specialized static LanguageDetection.languageForLocaleIdentifier(_:)();
    v20 = v19;
    if (v18 != specialized static LanguageDetection.languageForLocaleIdentifier(_:)() || v20 != v21)
    {
      v23 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v23 & 1;
    }
    swift_bridgeObjectRelease_n();
    goto LABEL_11;
  }
  Logger.init()();
  v14 = Logger.logObject.getter();
  v15 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_2488EF000, v14, v15, "Provided locale identifiers for comparison are not the expected length", v16, 2u);
    MEMORY[0x24959F0A0](v16, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
  if (a1 == a3 && a2 == a4)
  {
LABEL_11:
    v17 = 1;
    return v17 & 1;
  }
  v17 = _stringCompareWithSmolCheck(_:_:expecting:)();
  return v17 & 1;
}

uint64_t specialized Set.contains(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  Swift::Int v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  BOOL v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  BOOL v17;

  if (*(_QWORD *)(a3 + 16))
  {
    Hasher.init(_seed:)();
    String.hash(into:)();
    v6 = Hasher._finalize()();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
            break;
          result = 0;
          v15 = (v15 + 1) & v14;
          if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
            return result;
        }
        return 1;
      }
    }
  }
  return 0;
}

Swift::Bool __swiftcall LocaleDetection.isLanguageMismatched(forMessage:localeIdentifier:)(Swift::String forMessage, Swift::String localeIdentifier)
{
  uint64_t v2;
  uint64_t v3;
  void *object;
  uint64_t countAndFlagsBits;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint64_t v39;
  uint8_t *v40;
  uint8_t *v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t);
  char v48;
  char v49;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v3 = v2;
  object = localeIdentifier._object;
  countAndFlagsBits = localeIdentifier._countAndFlagsBits;
  v6 = forMessage._object;
  v7 = forMessage._countAndFlagsBits;
  v8 = type metadata accessor for Logger();
  v9 = *(_QWORD *)(v8 - 8);
  v12 = MEMORY[0x24BDAC7A8](v8, v10, v11);
  v14 = (char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v12, v15, v16);
  v19 = (char *)&v51 - v18;
  MEMORY[0x24BDAC7A8](v17, v20, v21);
  v23 = (char *)&v51 - v22;
  v24 = specialized LocaleDetection.userLanguageDetected(fromMessage:preferredLocales:)(v7, (uint64_t)v6, 0, v3);
  if (!v25)
  {
    Logger.init()();
    v37 = Logger.logObject.getter();
    v38 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = v9;
      v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v40 = 0;
      _os_log_impl(&dword_2488EF000, v37, v38, "Could not detect language for isLanguageMismatchedForMessage:withLocaleIdentifier: with sufficiently high confidence.", v40, 2u);
      v41 = v40;
      v9 = v39;
      MEMORY[0x24959F0A0](v41, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    goto LABEL_19;
  }
  v26 = v24;
  v27 = v25;
  v28 = specialized static LocaleDetection.languageTag(forLocaleIdentifier:)(countAndFlagsBits, (uint64_t)object);
  v30 = v29;
  v31 = HIBYTE(v29) & 0xF;
  if ((v29 & 0x2000000000000000) == 0)
    v31 = v28 & 0xFFFFFFFFFFFFLL;
  if (!v31)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    Logger.init()();
    swift_bridgeObjectRetain_n();
    v42 = Logger.logObject.getter();
    v43 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc();
      v45 = swift_slowAlloc();
      v54 = v9;
      v46 = v45;
      v56 = v45;
      *(_DWORD *)v44 = 136315138;
      swift_bridgeObjectRetain();
      v55 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(countAndFlagsBits, (unint64_t)object, &v56);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2488EF000, v42, v43, "Unable to get language tag for localeIdentifier %s", v44, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24959F0A0](v46, -1, -1);
      MEMORY[0x24959F0A0](v44, -1, -1);

      v47 = *(void (**)(char *, uint64_t))(v54 + 8);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v47 = *(void (**)(char *, uint64_t))(v9 + 8);
    }
    v47(v19, v8);
    goto LABEL_19;
  }
  v32 = v28;
  Logger.init()();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v33 = Logger.logObject.getter();
  v34 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v33, v34))
  {
    v35 = swift_slowAlloc();
    v52 = swift_slowAlloc();
    v56 = v52;
    *(_DWORD *)v35 = 136315394;
    v54 = v9;
    swift_bridgeObjectRetain();
    v55 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v26, v27, &v56);
    v53 = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v35 + 12) = 2080;
    swift_bridgeObjectRetain();
    v55 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v32, v30, &v56);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2488EF000, v33, v34, "Detected language for isLanguageMismatchedForMessage:withLocaleIdentifier: is %s, and language tag for comparison is %s.", (uint8_t *)v35, 0x16u);
    v36 = v52;
    swift_arrayDestroy();
    MEMORY[0x24959F0A0](v36, -1, -1);
    MEMORY[0x24959F0A0](v35, -1, -1);

    (*(void (**)(char *, uint64_t))(v54 + 8))(v23, v53);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v23, v8);
  }
  if (v26 == v32 && v27 == v30)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_19:
    v49 = 0;
    return v49 & 1;
  }
  v48 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v49 = v48 ^ 1;
  return v49 & 1;
}

uint64_t LocaleDetection.locale(forMessage:outgoingMessageHistory:defaultLocale:defaultLocaleLastChangedDate:sender:forceRunLanguageDetection:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  unint64_t v71;
  BOOL v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  double v78;
  double v79;
  void (*v80)(char *, uint64_t);
  uint64_t v81;
  unint64_t v82;
  unint64_t v83;
  char *v84;
  NSObject *v85;
  os_log_type_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  NSObject *v92;
  os_log_type_t v93;
  uint64_t v94;
  uint8_t *v95;
  char v96;
  void (**v97)(char *, uint64_t);
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char v108;
  unint64_t v109;
  char *v110;
  unint64_t v111;
  NSObject *v112;
  os_log_type_t v113;
  int v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
  char *v121;
  char *v122;
  NSObject *v123;
  os_log_type_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t *v127;
  char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t v135;
  unint64_t v136;
  uint64_t v137;
  char v138;
  unint64_t v139;
  char *v140;
  NSObject *v141;
  os_log_type_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  char *v149;
  NSObject *v150;
  os_log_type_t v151;
  uint8_t *v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  objc_class *v156;
  char *v157;
  char *v158;
  id v159;
  _QWORD *v160;
  unint64_t v161;
  char *v162;
  NSObject *v163;
  os_log_type_t v164;
  uint8_t *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  objc_class *v171;
  char *v172;
  char *v173;
  id v174;
  char *v175;
  NSObject *v176;
  os_log_type_t v177;
  uint8_t *v178;
  uint64_t v179;
  uint64_t v180;
  unint64_t v181;
  char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  void *v187;
  objc_class *v188;
  char *v189;
  char *v190;
  id v191;
  NSObject *v192;
  os_log_type_t v193;
  uint8_t *v194;
  uint64_t v195;
  uint64_t v197;
  char *v198;
  char *v199;
  char *v200;
  char *v201;
  char *v202;
  char *v203;
  char *v204;
  uint64_t v205;
  char *v206;
  uint64_t v207;
  uint64_t v208;
  unint64_t v209;
  uint64_t v210;
  uint64_t v211;
  char *v212;
  void (**v213)(char *, uint64_t);
  uint64_t v214;
  uint64_t *v215;
  uint64_t v216;
  objc_super v217;
  objc_super v218;
  objc_super v219;
  uint64_t v220[2];
  uint64_t v221;

  v207 = a8;
  v205 = a7;
  v210 = a1;
  v211 = a6;
  v208 = a3;
  v209 = a2;
  v11 = type metadata accessor for Logger();
  v213 = *(void (***)(char *, uint64_t))(v11 - 8);
  v214 = v11;
  v14 = MEMORY[0x24BDAC7A8](v11, v12, v13);
  v203 = (char *)&v197 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v14, v16, v17);
  v200 = (char *)&v197 - v19;
  v22 = MEMORY[0x24BDAC7A8](v18, v20, v21);
  v202 = (char *)&v197 - v23;
  v26 = MEMORY[0x24BDAC7A8](v22, v24, v25);
  v204 = (char *)&v197 - v27;
  v30 = MEMORY[0x24BDAC7A8](v26, v28, v29);
  v199 = (char *)&v197 - v31;
  v34 = MEMORY[0x24BDAC7A8](v30, v32, v33);
  v201 = (char *)&v197 - v35;
  v38 = MEMORY[0x24BDAC7A8](v34, v36, v37);
  v198 = (char *)&v197 - v39;
  v42 = MEMORY[0x24BDAC7A8](v38, v40, v41);
  v44 = (char *)&v197 - v43;
  v47 = MEMORY[0x24BDAC7A8](v42, v45, v46);
  v212 = (char *)&v197 - v48;
  MEMORY[0x24BDAC7A8](v47, v49, v50);
  v206 = (char *)&v197 - v51;
  v52 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x24BDAC7A8](v52, v53, v54);
  v56 = (char *)&v197 - ((v55 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = type metadata accessor for Date();
  v58 = *(_QWORD *)(v57 - 8);
  v61 = MEMORY[0x24BDAC7A8](v57, v59, v60);
  v63 = (char *)&v197 - ((v62 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v61, v64, v65);
  v67 = (char *)&v197 - v66;
  v216 = a4;
  v68 = a4 & 0xFFFFFFFFFFFFLL;
  swift_bridgeObjectRetain();
  if (a5)
    v69 = a5;
  else
    v69 = 0xE000000000000000;
  if (!a5)
    v68 = 0;
  swift_bridgeObjectRelease();
  if ((v69 & 0x2000000000000000) != 0)
    v70 = HIBYTE(v69) & 0xF;
  else
    v70 = v68;
  if (v70 && (v71 = a5) != 0)
  {
    outlined init with copy of Date?(v211, (uint64_t)v56);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v58 + 48))(v56, 1, v57) == 1)
    {
      swift_bridgeObjectRetain();
      outlined destroy of Date?((uint64_t)v56);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v58 + 32))(v67, v56, v57);
      swift_bridgeObjectRetain();
      Date.init()();
      Date.timeIntervalSince(_:)();
      v79 = v78;
      v80 = *(void (**)(char *, uint64_t))(v58 + 8);
      v80(v63, v57);
      if (v79 <= 3600.0)
      {
        v122 = v206;
        Logger.init()();
        swift_bridgeObjectRetain_n();
        v123 = Logger.logObject.getter();
        v124 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v123, v124))
        {
          v125 = swift_slowAlloc();
          v215 = (uint64_t *)swift_slowAlloc();
          v220[0] = (uint64_t)v215;
          *(_DWORD *)v125 = 136315650;
          swift_bridgeObjectRetain();
          v126 = v216;
          v221 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v216, v71, v220);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v125 + 12) = 2048;
          v221 = 0x40AC200000000000;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *(_WORD *)(v125 + 22) = 2080;
          swift_bridgeObjectRetain();
          v221 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v126, v71, v220);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_2488EF000, v123, v124, "Default locale %s was changed less than %f seconds ago, detection result %s.", (uint8_t *)v125, 0x20u);
          v127 = v215;
          swift_arrayDestroy();
          MEMORY[0x24959F0A0](v127, -1, -1);
          MEMORY[0x24959F0A0](v125, -1, -1);

          v213[1](v206, v214);
          v128 = v67;
          v75 = v126;
          v80(v128, v57);
          return v75;
        }
        swift_bridgeObjectRelease_n();

        v213[1](v122, v214);
        v80(v67, v57);
        return v216;
      }
      v80(v67, v57);
    }
    swift_bridgeObjectRetain();
    v74 = v215;
    v75 = v216;
    v211 = v216;
    v77 = a5;
  }
  else
  {
    v72 = v70 == 0;
    v74 = v215;
    v73 = v216;
    if (v72)
      v73 = 0;
    v211 = v73;
    v75 = specialized Collection.first.getter(v215[2]);
    v71 = v76;
    swift_bridgeObjectRelease();
    v77 = 0;
  }
  v81 = *(_QWORD *)(v74[2] + 16);
  if ((a9 & 1) == 0 && v81 == 1)
  {
    if (v77)
      v82 = v77;
    else
      v82 = 0xE300000000000000;
    if (v71)
      v83 = v71;
    else
      v83 = 0xE300000000000000;
    swift_bridgeObjectRetain();
    v84 = v212;
    Logger.init()();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v85 = Logger.logObject.getter();
    v86 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v85, v86))
    {
      if (v71)
        v87 = v75;
      else
        v87 = 7104878;
      v216 = v87;
      v88 = v75;
      if (v77)
        v89 = v211;
      else
        v89 = 7104878;
      v90 = swift_slowAlloc();
      v91 = swift_slowAlloc();
      v220[0] = v91;
      *(_DWORD *)v90 = 136315394;
      swift_bridgeObjectRetain();
      v221 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v89, v82, v220);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v90 + 12) = 2080;
      swift_bridgeObjectRetain();
      v221 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v216, v83, v220);
      v75 = v88;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2488EF000, v85, v86, "Monolingual, default locale %s, detection result %s.", (uint8_t *)v90, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24959F0A0](v91, -1, -1);
      MEMORY[0x24959F0A0](v90, -1, -1);

      v213[1](v212, v214);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      v213[1](v84, v214);
    }
    return v75;
  }
  v216 = v75;
  Logger.init()();
  v92 = Logger.logObject.getter();
  v93 = static os_log_type_t.debug.getter();
  v94 = v71;
  if (os_log_type_enabled(v92, v93))
  {
    v95 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v95 = 134217984;
    v220[0] = v81;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_2488EF000, v92, v93, "Falling back to language detection due to %ld keyboard locales", v95, 0xCu);
    MEMORY[0x24959F0A0](v95, -1, -1);
  }
  v96 = a9 ^ 1;

  v97 = (void (**)(char *, uint64_t))v213[1];
  ((void (*)(char *, uint64_t))v97)(v44, v214);
  v98 = v209;
  if (v209)
  {
    v99 = HIBYTE(v209) & 0xF;
    if ((v209 & 0x2000000000000000) == 0)
      v99 = v210 & 0xFFFFFFFFFFFFLL;
    if (v99)
    {
      v100 = *v215;
      v101 = v215[2];
      swift_bridgeObjectRetain();
      v102 = specialized LocaleDetection.userLocaleDetected(fromString:limitToPreferredLocales:)(v210, v98, v96 & 1, v100, v101);
      if (v103)
      {
        v104 = v102;
        v105 = v103;
        v106 = HIBYTE(v103) & 0xF;
        if ((v103 & 0x2000000000000000) == 0)
          v106 = v102 & 0xFFFFFFFFFFFFLL;
        if (v106)
        {
          swift_bridgeObjectRelease();
          v107 = v211;
          if ((a9 & 1) == 0)
            goto LABEL_49;
          if (*(_QWORD *)(v101 + 16))
          {
            swift_bridgeObjectRetain();
            specialized __RawDictionaryStorage.find<A>(_:)(v104, v105);
            if ((v108 & 1) != 0)
            {
              swift_bridgeObjectRelease();
LABEL_49:
              v216 = v104;
              if (v77)
                v109 = v77;
              else
                v109 = 0xE000000000000000;
              v110 = v201;
              Logger.init()();
              swift_bridgeObjectRetain_n();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              v111 = v105;
              v112 = Logger.logObject.getter();
              v113 = static os_log_type_t.debug.getter();
              v114 = v113;
              if (os_log_type_enabled(v112, v113))
              {
                if (v77)
                  v115 = v107;
                else
                  v115 = 0;
                v116 = swift_slowAlloc();
                LODWORD(v212) = v114;
                v117 = v116;
                v118 = swift_slowAlloc();
                v220[0] = v118;
                *(_DWORD *)v117 = 134218498;
                v119 = String.count.getter();
                swift_bridgeObjectRelease();
                v221 = v119;
                UnsafeMutableRawBufferPointer.copyMemory(from:)();
                swift_bridgeObjectRelease();
                *(_WORD *)(v117 + 12) = 2080;
                swift_bridgeObjectRetain();
                v221 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v115, v109, v220);
                UnsafeMutableRawBufferPointer.copyMemory(from:)();
                swift_bridgeObjectRelease_n();
                *(_WORD *)(v117 + 22) = 2080;
                swift_bridgeObjectRetain();
                v221 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v216, v111, v220);
                UnsafeMutableRawBufferPointer.copyMemory(from:)();
                v120 = v111;
                swift_bridgeObjectRelease_n();
                _os_log_impl(&dword_2488EF000, v112, (os_log_type_t)v212, "Message length: %ld, default locale: %s, detected locale: %s.", (uint8_t *)v117, 0x20u);
                swift_arrayDestroy();
                MEMORY[0x24959F0A0](v118, -1, -1);
                MEMORY[0x24959F0A0](v117, -1, -1);

                v121 = v201;
              }
              else
              {

                v120 = v111;
                swift_bridgeObjectRelease_n();
                swift_bridgeObjectRelease_n();
                swift_bridgeObjectRelease_n();
                v121 = v110;
              }
              ((void (*)(char *, uint64_t))v97)(v121, v214);
              v184 = v207;
              if (v207)
              {
                v185 = v215[1];
                __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WrappedValue<String>);
                v186 = swift_allocObject();
                v75 = v216;
                *(_QWORD *)(v186 + 16) = v216;
                *(_QWORD *)(v186 + 24) = v120;
                v187 = *(void **)(v185 + 16);
                v188 = (objc_class *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WrappedKey<String>);
                v189 = (char *)objc_allocWithZone(v188);
                v190 = &v189[*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)v189) + 0x60)];
                *(_QWORD *)v190 = v205;
                *((_QWORD *)v190 + 1) = v184;
                v217.receiver = v189;
                v217.super_class = v188;
                swift_bridgeObjectRetain_n();
                swift_bridgeObjectRetain_n();
                v191 = objc_msgSendSuper2(&v217, sel_init);
                objc_msgSend(v187, sel_setObject_forKey_, v186, v191);
                swift_bridgeObjectRelease_n();
                swift_bridgeObjectRelease();
                swift_release();

                return v75;
              }
              return v216;
            }
            v134 = v104;
            swift_bridgeObjectRelease();
          }
          else
          {
            v134 = v104;
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v182 = v198;
          Logger.init()();
          swift_bridgeObjectRetain();
          v183 = Logger.logObject.getter();
          v136 = v105;
          goto LABEL_116;
        }
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
    }
  }
  v213 = v97;
  if (v208)
    v129 = v208;
  else
    v129 = MEMORY[0x24BEE4AF8];
  v220[0] = v129;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
  lazy protocol witness table accessor for type [String] and conformance [A]();
  v130 = BidirectionalCollection<>.joined(separator:)();
  v131 = v215[1];
  v132 = v215[2];
  v134 = specialized LocaleDetection.userLocaleDetected(fromString:limitToPreferredLocales:)(v130, v133, v96 & 1, *v215, v132);
  v136 = v135;
  swift_bridgeObjectRelease();
  if (!v136)
  {
LABEL_83:
    swift_bridgeObjectRelease();
    if (v77)
    {
      v147 = HIBYTE(v77) & 0xF;
      v148 = v211;
      if ((v77 & 0x2000000000000000) == 0)
        v147 = v211 & 0xFFFFFFFFFFFFLL;
      if (v147)
      {
        swift_bridgeObjectRelease();
        v149 = v202;
        Logger.init()();
        swift_bridgeObjectRetain_n();
        v150 = Logger.logObject.getter();
        v151 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v150, v151))
        {
          v152 = (uint8_t *)swift_slowAlloc();
          v153 = swift_slowAlloc();
          v220[0] = v153;
          *(_DWORD *)v152 = 136315138;
          swift_bridgeObjectRetain();
          v221 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v148, v77, v220);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_2488EF000, v150, v151, "Failed to detect a locale so falling back to the default locale: %s", v152, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24959F0A0](v153, -1, -1);
          MEMORY[0x24959F0A0](v152, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        ((void (*)(char *, uint64_t))v213)(v149, v214);
        return v148;
      }
      swift_bridgeObjectRelease();
    }
    v154 = v207;
    if (v207)
    {
      v155 = *(void **)(v131 + 16);
      v156 = (objc_class *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WrappedKey<String>);
      v157 = (char *)objc_allocWithZone(v156);
      v158 = &v157[*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)v157) + 0x60)];
      *(_QWORD *)v158 = v205;
      *((_QWORD *)v158 + 1) = v154;
      v219.receiver = v157;
      v219.super_class = v156;
      swift_bridgeObjectRetain_n();
      v159 = objc_msgSendSuper2(&v219, sel_init);
      v160 = objc_msgSend(v155, sel_objectForKey_, v159);

      if (v160)
      {
        v75 = v160[2];
        v161 = v160[3];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_release();
        swift_bridgeObjectRelease();
        v162 = v200;
        Logger.init()();
        swift_bridgeObjectRetain_n();
        v163 = Logger.logObject.getter();
        v164 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v163, v164))
        {
          v165 = (uint8_t *)swift_slowAlloc();
          v166 = swift_slowAlloc();
          v220[0] = v166;
          *(_DWORD *)v165 = 136315138;
          swift_bridgeObjectRetain();
          v221 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v75, v161, v220);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_2488EF000, v163, v164, "There was no default locale specified. Falling back to last confident locale for sender: %s", v165, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24959F0A0](v166, -1, -1);
          MEMORY[0x24959F0A0](v165, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        ((void (*)(char *, uint64_t))v213)(v162, v214);
        return v75;
      }
      swift_bridgeObjectRelease();
    }
    v175 = v203;
    Logger.init()();
    swift_bridgeObjectRetain_n();
    v176 = Logger.logObject.getter();
    v177 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v176, v177))
    {
      v178 = (uint8_t *)swift_slowAlloc();
      v179 = swift_slowAlloc();
      v220[1] = v94;
      v221 = v179;
      *(_DWORD *)v178 = 136315138;
      v75 = v216;
      v220[0] = v216;
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
      v180 = String.init<A>(reflecting:)();
      v220[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v180, v181, &v221);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2488EF000, v176, v177, "Falling back to last used locale %s for message", v178, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24959F0A0](v179, -1, -1);
      MEMORY[0x24959F0A0](v178, -1, -1);

      ((void (*)(char *, uint64_t))v213)(v203, v214);
      return v75;
    }

    swift_bridgeObjectRelease_n();
    ((void (*)(char *, uint64_t))v213)(v175, v214);
    return v216;
  }
  v137 = HIBYTE(v136) & 0xF;
  if ((v136 & 0x2000000000000000) == 0)
    v137 = v134 & 0xFFFFFFFFFFFFLL;
  if (!v137)
  {
    swift_bridgeObjectRelease();
    goto LABEL_83;
  }
  swift_bridgeObjectRelease();
  v97 = v213;
  if ((a9 & 1) != 0)
  {
    if (*(_QWORD *)(v132 + 16))
    {
      swift_bridgeObjectRetain();
      specialized __RawDictionaryStorage.find<A>(_:)(v134, v136);
      if ((v138 & 1) != 0)
      {
        swift_bridgeObjectRelease();
        goto LABEL_75;
      }
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    v182 = v199;
    swift_bridgeObjectRelease();
    Logger.init()();
    swift_bridgeObjectRetain();
    v183 = Logger.logObject.getter();
LABEL_116:
    v192 = v183;
    v193 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v192, v193))
    {
      v194 = (uint8_t *)swift_slowAlloc();
      v195 = swift_slowAlloc();
      v220[0] = v195;
      *(_DWORD *)v194 = 136315138;
      swift_bridgeObjectRetain();
      v221 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v134, v136, v220);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2488EF000, v192, v193, "ML language detection detected %s but returning nil for language since it's not one of the user's preferred locales", v194, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24959F0A0](v195, -1, -1);
      MEMORY[0x24959F0A0](v194, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    ((void (*)(char *, uint64_t))v97)(v182, v214);
    return 0;
  }
LABEL_75:
  if (v77)
    v139 = v77;
  else
    v139 = 0xE000000000000000;
  v140 = v204;
  Logger.init()();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v141 = Logger.logObject.getter();
  v142 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v141, v142))
  {
    v143 = v211;
    if (!v77)
      v143 = 0;
    v216 = v143;
    v144 = swift_slowAlloc();
    v145 = swift_slowAlloc();
    v220[0] = v145;
    *(_DWORD *)v144 = 134218498;
    v146 = *(_QWORD *)(v129 + 16);
    swift_bridgeObjectRelease();
    v221 = v146;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v144 + 12) = 2080;
    swift_bridgeObjectRetain();
    v221 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v216, v139, v220);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v144 + 22) = 2080;
    swift_bridgeObjectRetain();
    v221 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v134, v136, v220);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2488EF000, v141, v142, "Number of messages used for detection: %ld, default locale: %s, detected locale: %s.", (uint8_t *)v144, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x24959F0A0](v145, -1, -1);
    MEMORY[0x24959F0A0](v144, -1, -1);

    ((void (*)(char *, uint64_t))v213)(v204, v214);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    ((void (*)(char *, uint64_t))v97)(v140, v214);
  }
  v167 = v207;
  if (v207)
  {
    v168 = v215[1];
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WrappedValue<String>);
    v169 = swift_allocObject();
    *(_QWORD *)(v169 + 16) = v134;
    *(_QWORD *)(v169 + 24) = v136;
    v170 = *(void **)(v168 + 16);
    v171 = (objc_class *)__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for WrappedKey<String>);
    v172 = (char *)objc_allocWithZone(v171);
    v173 = &v172[*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)v172) + 0x60)];
    *(_QWORD *)v173 = v205;
    *((_QWORD *)v173 + 1) = v167;
    v218.receiver = v172;
    v218.super_class = v171;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v174 = objc_msgSendSuper2(&v218, sel_init);
    objc_msgSend(v170, sel_setObject_forKey_, v169, v174);
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    swift_release();

  }
  return v134;
}

uint64_t specialized Collection.first.getter(uint64_t a1)
{
  uint64_t result;
  int v3;
  char v4;
  uint64_t v5;

  result = specialized Dictionary.Values.startIndex.getter(a1);
  if ((v4 & 1) != 0)
    goto LABEL_8;
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == 1 << *(_BYTE *)(a1 + 32))
    return 0;
  v5 = specialized Dictionary.Values.subscript.getter(result, v3, 0, a1);
  swift_bridgeObjectRetain();
  return v5;
}

Swift::String_optional __swiftcall LocaleDetection.userLocaleDetected(fromString:limitToPreferredLocales:)(Swift::String fromString, Swift::Bool limitToPreferredLocales)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  Swift::String_optional result;

  v4 = specialized LocaleDetection.userLocaleDetected(fromString:limitToPreferredLocales:)(fromString._countAndFlagsBits, (uint64_t)fromString._object, limitToPreferredLocales, v2, v3);
  result.value._object = v5;
  result.value._countAndFlagsBits = v4;
  return result;
}

uint64_t LocaleDetection.locale(forIncomingMessages:outgoingMessageHistory:defaultLocale:defaultLocaleLastChangedDate:sender:forceRunLanguageDetection:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t v9;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;

  v9 = a7;
  if (a1)
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    lazy protocol witness table accessor for type [String] and conformance [A]();
    v15 = BidirectionalCollection<>.joined(separator:)();
    v17 = v16;
    swift_bridgeObjectRelease();
    v9 = a7;
  }
  else
  {
    v15 = 0;
    v17 = 0;
  }
  v18 = LocaleDetection.locale(forMessage:outgoingMessageHistory:defaultLocale:defaultLocaleLastChangedDate:sender:forceRunLanguageDetection:)(v15, v17, a2, a3, a4, a5, a6, v9, a8 & 1);
  swift_bridgeObjectRelease();
  return v18;
}

uint64_t closure #1 in osLogInternal(_:log:type:)(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t closure #1 in OSLogArguments.append(_:)(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v6, v7, a3);
  v8 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = _StringGuts._allocateForDeconstruct()(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = _StringGuts.copyUTF8(into:)();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      v2 = String.UTF8View._foreignCount()();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

_BYTE **closure #1 in OSLogArguments.append(_:)(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void *closure #1 in serialize<A>(_:at:)(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  uint64_t v4;

  if (__src)
    v4 = a2 - (_QWORD)__src;
  else
    v4 = 0;
  if (!__dst)
  {
    if (v4 <= 0)
      return __src;
LABEL_10:
    __src = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

void specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(_QWORD *a1, char a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  char v15;
  unint64_t v16;
  char v17;
  void *v18;
  id v19;
  _QWORD *v20;
  uint64_t *v21;
  _QWORD *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  _BOOL8 v36;
  uint64_t v37;
  char v38;
  char v39;
  _QWORD *v40;
  uint64_t *v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  Swift::String v45;
  Swift::String v46;
  uint64_t v47;

  v3 = a1[2];
  if (!v3)
  {
    swift_bridgeObjectRelease();
    return;
  }
  v7 = a1[4];
  v6 = a1[5];
  v8 = a1[7];
  v47 = a1[6];
  swift_bridgeObjectRetain();
  v9 = (_QWORD *)*a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11 = specialized __RawDictionaryStorage.find<A>(_:)(v7, v6);
  v12 = v9[2];
  v13 = (v10 & 1) == 0;
  v14 = v12 + v13;
  if (__OFADD__(v12, v13))
    goto LABEL_23;
  v15 = v10;
  if (v9[3] >= v14)
  {
    if ((a2 & 1) != 0)
    {
      if ((v10 & 1) != 0)
        goto LABEL_10;
    }
    else
    {
      specialized _NativeDictionary.copy()();
      if ((v15 & 1) != 0)
        goto LABEL_10;
    }
LABEL_13:
    v20 = (_QWORD *)*a3;
    *(_QWORD *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    v21 = (uint64_t *)(v20[6] + 16 * v11);
    *v21 = v7;
    v21[1] = v6;
    v22 = (_QWORD *)(v20[7] + 16 * v11);
    *v22 = v47;
    v22[1] = v8;
    v23 = v20[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (v24)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v20[2] = v25;
    v26 = v3 - 1;
    if (v3 == 1)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      return;
    }
    v27 = a1 + 11;
    while (1)
    {
      v29 = *(v27 - 3);
      v28 = *(v27 - 2);
      v30 = *(v27 - 1);
      v31 = *v27;
      v32 = (_QWORD *)*a3;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v33 = specialized __RawDictionaryStorage.find<A>(_:)(v29, v28);
      v35 = v32[2];
      v36 = (v34 & 1) == 0;
      v24 = __OFADD__(v35, v36);
      v37 = v35 + v36;
      if (v24)
        break;
      v38 = v34;
      if (v32[3] < v37)
      {
        specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v37, 1);
        v33 = specialized __RawDictionaryStorage.find<A>(_:)(v29, v28);
        if ((v38 & 1) != (v39 & 1))
          goto LABEL_25;
      }
      if ((v38 & 1) != 0)
        goto LABEL_10;
      v40 = (_QWORD *)*a3;
      *(_QWORD *)(*a3 + 8 * (v33 >> 6) + 64) |= 1 << v33;
      v41 = (uint64_t *)(v40[6] + 16 * v33);
      *v41 = v29;
      v41[1] = v28;
      v42 = (_QWORD *)(v40[7] + 16 * v33);
      *v42 = v30;
      v42[1] = v31;
      v43 = v40[2];
      v24 = __OFADD__(v43, 1);
      v44 = v43 + 1;
      if (v24)
        goto LABEL_24;
      v27 += 4;
      v40[2] = v44;
      if (!--v26)
        goto LABEL_22;
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v14, a2 & 1);
  v16 = specialized __RawDictionaryStorage.find<A>(_:)(v7, v6);
  if ((v15 & 1) == (v17 & 1))
  {
    v11 = v16;
    if ((v15 & 1) == 0)
      goto LABEL_13;
LABEL_10:
    v18 = (void *)swift_allocError();
    swift_willThrow();
    v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
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
  v45._object = (void *)0x8000000248918110;
  v45._countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v45);
  _print_unlocked<A, B>(_:_:)();
  v46._countAndFlagsBits = 39;
  v46._object = (void *)0xE100000000000000;
  String.append(_:)(v46);
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;

  Hasher.init(_seed:)();
  String.hash(into:)();
  v4 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  Swift::Int v2;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  v2 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

{
  uint64_t v2;

  type metadata accessor for CodingUserInfoKey();
  v2 = dispatch thunk of Hashable._rawHashValue(seed:)();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
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

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = v7;
    if (v6 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          v15 = v14;
          if (v13 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v15 == v16)
            break;
          v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, unint64_t, uint64_t);
  char v16;
  _QWORD v18[2];

  v3 = v2;
  v18[1] = a1;
  v5 = type metadata accessor for CodingUserInfoKey();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7, v8);
  v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = -1 << *(_BYTE *)(v3 + 32);
  v12 = a2 & ~v11;
  if (((*(_QWORD *)(v3 + 64 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) != 0)
  {
    v13 = ~v11;
    v14 = *(_QWORD *)(v6 + 72);
    v15 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v15(v10, *(_QWORD *)(v3 + 48) + v14 * v12, v5);
      v16 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v10, v5);
      if ((v16 & 1) != 0)
        break;
      v12 = (v12 + 1) & v13;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) != 0);
  }
  return v12;
}

uint64_t specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

{
  char **v3;
  uint64_t result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

{
  uint64_t *v3;
  uint64_t result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Float>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 29;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8])
      memmove(v13, v14, 4 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[4 * v8] || v13 >= &v14[4 * v8])
  {
    memcpy(v13, v14, 4 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
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
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<NLLanguage>);
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
  v13 = (unint64_t)(v10 + 4);
  v14 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8)
      memmove(v10 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    type metadata accessor for NLLanguage(0);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(char *a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  int64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;

  if (!a2)
    return MEMORY[0x24BEE4AF8];
  if (a2 > 0)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<Int>);
    v4 = 8 * a2;
    v5 = (char *)swift_allocObject();
    v6 = _swift_stdlib_malloc_size(v5);
    v7 = v6 - 32;
    if (v6 < 32)
      v7 = v6 - 25;
    *((_QWORD *)v5 + 2) = a2;
    *((_QWORD *)v5 + 3) = 2 * (v7 >> 3);
    v8 = v5 + 32;
    if (&v5[v4 + 32] <= a1 || v8 >= &a1[v4])
    {
      memcpy(v8, a1, 8 * a2);
      return (uint64_t)v5;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  uint64_t v4;
  char *v5;
  int64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;

  if (!a2)
    return MEMORY[0x24BEE4AF8];
  if (a2 > 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<_NSRange>);
    v4 = 16 * a2;
    v5 = (char *)swift_allocObject();
    v6 = _swift_stdlib_malloc_size(v5);
    v7 = v6 - 32;
    if (v6 < 32)
      v7 = v6 - 17;
    *((_QWORD *)v5 + 2) = a2;
    *((_QWORD *)v5 + 3) = 2 * (v7 >> 4);
    v8 = v5 + 32;
    if (&v5[v4 + 32] <= a1 || v8 >= &a1[v4])
    {
      memcpy(v8, a1, 16 * a2);
      return (uint64_t)v5;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  uint64_t v4;
  char *v5;
  int64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;

  if (!a2)
    return MEMORY[0x24BEE4AF8];
  if (a2 > 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Float>);
    v4 = 4 * a2;
    v5 = (char *)swift_allocObject();
    v6 = _swift_stdlib_malloc_size(v5);
    v7 = v6 - 32;
    if (v6 < 32)
      v7 = v6 - 29;
    *((_QWORD *)v5 + 2) = a2;
    *((_QWORD *)v5 + 3) = 2 * (v7 >> 2);
    v8 = v5 + 32;
    if (&v5[v4 + 32] <= a1 || v8 >= &a1[v4])
    {
      memcpy(v8, a1, 4 * a2);
      return (uint64_t)v5;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

_QWORD *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 17;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  v6 = specialized Sequence._copySequenceContents(initializing:)((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  outlined consume of [String : String].Iterator._Variant();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 17;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  v6 = specialized Sequence._copySequenceContents(initializing:)((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  outlined consume of [String : String].Iterator._Variant();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t specialized Sequence._copySequenceContents(initializing:)(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = (_QWORD *)result;
  v6 = a4 + 56;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 56);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = (_QWORD *)result;
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t specialized Dictionary.Values.startIndex.getter(uint64_t a1)
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

unint64_t specialized LocaleDetection.init(languageLimit:preferredLocales:)(unint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  id v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  Swift::Int v34;
  uint64_t v35;

  v4 = type metadata accessor for Logger();
  v31 = *(_QWORD *)(v4 - 8);
  v32 = v4;
  MEMORY[0x24BDAC7A8](v4, v5, v6);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = MEMORY[0x24BEE4B08];
  v9 = *(_QWORD *)(a2 + 16);
  if (v9)
  {
    swift_bridgeObjectRetain();
    v30 = a2;
    v10 = (uint64_t *)(a2 + 40);
    v33 = (_QWORD *)MEMORY[0x24BEE4AF8];
    while (1)
    {
      v12 = *(v10 - 1);
      v11 = *v10;
      if (!a1 || *(_QWORD *)(v35 + 16) < a1)
      {
        swift_bridgeObjectRetain();
        if (String.count.getter() > 1)
        {
          v16 = specialized static LanguageDetection.languageForLocaleIdentifier(_:)();
          v18 = v17;
          v19 = v35;
          swift_bridgeObjectRetain();
          v20 = specialized Set.contains(_:)(v16, v18, v19);
          swift_bridgeObjectRelease();
          if ((v20 & 1) == 0)
          {
            swift_bridgeObjectRetain_n();
            swift_bridgeObjectRetain();
            specialized Set._Variant.insert(_:)(&v34, v16, v18);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v33 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v33[2] + 1, 1, v33);
            v22 = v33[2];
            v21 = v33[3];
            if (v22 >= v21 >> 1)
              v33 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v21 > 1), v22 + 1, 1, v33);
            v23 = v33;
            v33[2] = v22 + 1;
            v24 = &v23[4 * v22];
            v24[4] = v16;
            v24[5] = v18;
            v24[6] = v12;
            v24[7] = v11;
            goto LABEL_5;
          }
          swift_bridgeObjectRetain();
          specialized Set._Variant.insert(_:)(&v34, v16, v18);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        else
        {
          Logger.init()();
          v13 = Logger.logObject.getter();
          v14 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v13, v14))
          {
            v15 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v15 = 0;
            _os_log_impl(&dword_2488EF000, v13, v14, "Locale used for language tag determination is not the right length", v15, 2u);
            MEMORY[0x24959F0A0](v15, -1, -1);
          }

          (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v32);
        }
        swift_bridgeObjectRelease();
      }
LABEL_5:
      v10 += 2;
      if (!--v9)
      {
        swift_bridgeObjectRelease_n();
        if (v33[2])
          goto LABEL_19;
LABEL_21:
        v25 = MEMORY[0x24BEE4B00];
        goto LABEL_22;
      }
    }
  }
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(MEMORY[0x24BEE4AF8] + 16))
    goto LABEL_21;
LABEL_19:
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, String>);
  v25 = static _DictionaryStorage.allocate(capacity:)();
LABEL_22:
  v34 = v25;
  v26 = (_QWORD *)swift_bridgeObjectRetain();
  specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(v26, 1, &v34);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TUSCache<String, String>);
  v27 = swift_allocObject();
  v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCE40]), sel_init);
  *(_QWORD *)(v27 + 16) = v28;
  objc_msgSend(v28, sel_setCountLimit_, 50);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t specialized static LocaleDetection.languageTag(forLocaleIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t result;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = type metadata accessor for Logger();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6, v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = a1;
  v18 = a2;
  v15 = 64;
  v16 = 0xE100000000000000;
  lazy protocol witness table accessor for type String and conformance String();
  if ((StringProtocol.contains<A>(_:)() & 1) != 0)
  {
    v17 = a1;
    v18 = a2;
    v15 = 64;
    v16 = 0xE100000000000000;
    result = StringProtocol.components<A>(separatedBy:)();
    if (!*(_QWORD *)(result + 16))
    {
      __break(1u);
      return result;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  if (String.count.getter() >= 2)
  {
    v14 = specialized static LanguageDetection.languageForLocaleIdentifier(_:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    Logger.init()();
    v11 = Logger.logObject.getter();
    v12 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_2488EF000, v11, v12, "Adjusted locale identifier used language tag determination is not the right length", v13, 2u);
      MEMORY[0x24959F0A0](v13, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v4);
    return 0;
  }
  return v14;
}

uint64_t specialized LocaleDetection.userLanguageDetected(fromMessage:preferredLocales:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t result;
  char *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  _QWORD *v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  void (*v48)(char *, uint64_t);
  id v49;
  int64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  Class isa;
  void *v59;
  uint64_t v60;
  id v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  uint64_t v68;
  char *v69;
  id v70;
  unint64_t v71;
  char v72;
  double v73;
  char *v74;
  id v75;
  NSObject *v76;
  os_log_type_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  char *v81;
  char *v82;
  id v83;
  NSObject *v84;
  os_log_type_t v85;
  uint8_t *v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  char *v90;
  char *v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  unint64_t v102;
  char *v103;
  uint64_t v104;

  v95 = a2;
  v96 = a4;
  v94 = a1;
  v5 = type metadata accessor for Logger();
  v98 = *(_QWORD *)(v5 - 8);
  v99 = v5;
  v8 = MEMORY[0x24BDAC7A8](v5, v6, v7);
  v92 = (char *)&v91 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v8, v10, v11);
  v91 = (char *)&v91 - v13;
  v16 = MEMORY[0x24BDAC7A8](v12, v14, v15);
  v18 = (char *)&v91 - v17;
  MEMORY[0x24BDAC7A8](v16, v19, v20);
  if (a3)
    v22 = a3;
  else
    v22 = MEMORY[0x24BEE4AF8];
  v23 = *(_QWORD *)(v22 + 16);
  v97 = v18;
  if (v23)
  {
    v100 = (char *)&v91 - v21;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    lazy protocol witness table accessor for type String and conformance String();
    v93 = v22;
    v24 = (uint64_t *)(v22 + 40);
    v25 = (_QWORD *)MEMORY[0x24BEE4AF8];
    while (1)
    {
      v26 = *(v24 - 1);
      v27 = *v24;
      v103 = (char *)v26;
      v104 = v27;
      v101 = 64;
      v102 = 0xE100000000000000;
      swift_bridgeObjectRetain();
      if ((StringProtocol.contains<A>(_:)() & 1) != 0)
      {
        v103 = (char *)v26;
        v104 = v27;
        v101 = 64;
        v102 = 0xE100000000000000;
        result = StringProtocol.components<A>(separatedBy:)();
        if (!*(_QWORD *)(result + 16))
        {
          __break(1u);
          goto LABEL_60;
        }
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRetain();
      }
      if (String.count.getter() > 1)
      {
        v33 = specialized static LanguageDetection.languageForLocaleIdentifier(_:)();
        v34 = v35;
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        v29 = v100;
        Logger.init()();
        v30 = Logger.logObject.getter();
        v31 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v30, v31))
        {
          v32 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v32 = 0;
          _os_log_impl(&dword_2488EF000, v30, v31, "Adjusted locale identifier used language tag determination is not the right length", v32, 2u);
          v29 = v100;
          MEMORY[0x24959F0A0](v32, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v98 + 8))(v29, v99);
        v33 = 0;
        v34 = 0xE000000000000000;
      }
      if ((v34 & 0x2000000000000000) != 0)
        v36 = HIBYTE(v34) & 0xF;
      else
        v36 = v33 & 0xFFFFFFFFFFFFLL;
      swift_bridgeObjectRelease();
      if (v36)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v25 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v25[2] + 1, 1, v25);
        v38 = v25[2];
        v37 = v25[3];
        if (v38 >= v37 >> 1)
          v25 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v37 > 1), v38 + 1, 1, v25);
        v25[2] = v38 + 1;
        v39 = &v25[2 * v38];
        v39[4] = v33;
        v39[5] = v34;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      v24 += 2;
      if (!--v23)
      {
        swift_bridgeObjectRelease_n();
        v18 = v97;
        goto LABEL_28;
      }
    }
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v25 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_28:
  Logger.init()();
  swift_bridgeObjectRetain_n();
  v40 = Logger.logObject.getter();
  v41 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v40, v41))
  {
    v42 = (uint8_t *)swift_slowAlloc();
    v43 = swift_slowAlloc();
    v103 = (char *)v43;
    *(_DWORD *)v42 = 136315138;
    v44 = swift_bridgeObjectRetain();
    v45 = MEMORY[0x24959E4B8](v44, MEMORY[0x24BEE0D00]);
    v47 = v46;
    swift_bridgeObjectRelease();
    v101 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v45, v47, (uint64_t *)&v103);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2488EF000, v40, v41, "Setting language tags as constraints: %s", v42, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24959F0A0](v43, -1, -1);
    MEMORY[0x24959F0A0](v42, -1, -1);

    v48 = *(void (**)(char *, uint64_t))(v98 + 8);
    v48(v97, v99);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v48 = *(void (**)(char *, uint64_t))(v98 + 8);
    v48(v18, v99);
  }
  v49 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDFD50]), sel_init);
  v50 = v25[2];
  if (v50)
  {
    v103 = (char *)MEMORY[0x24BEE4AF8];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v50, 0);
    v51 = (uint64_t)v103;
    v52 = v25 + 5;
    do
    {
      v53 = *(v52 - 1);
      v54 = *v52;
      swift_bridgeObjectRetain();
      v55 = MEMORY[0x24959E374](v53, v54);
      swift_bridgeObjectRelease();
      v103 = (char *)v51;
      v57 = *(_QWORD *)(v51 + 16);
      v56 = *(_QWORD *)(v51 + 24);
      if (v57 >= v56 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v56 > 1, v57 + 1, 1);
        v51 = (uint64_t)v103;
      }
      v52 += 2;
      *(_QWORD *)(v51 + 16) = v57 + 1;
      *(_QWORD *)(v51 + 8 * v57 + 32) = v55;
      --v50;
    }
    while (v50);
  }
  swift_bridgeObjectRelease();
  type metadata accessor for NLLanguage(0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(v49, sel_setLanguageConstraints_, isa);

  v59 = (void *)MEMORY[0x24959E374](v94, v95);
  objc_msgSend(v49, sel_processString_, v59);

  result = v96;
  if ((v96 & 0x8000000000000000) == 0)
  {
    v60 = NLLanguageRecognizer.languageHypotheses(withMaximum:)();
    v61 = objc_msgSend(v49, sel_dominantLanguage);
    if (!v61)
    {
LABEL_43:
      swift_bridgeObjectRelease();

      return 0;
    }
    v62 = v61;
    v63 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v65 = v64;
    if (v63 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v65 == v66)
    {
      swift_bridgeObjectRelease_n();
LABEL_42:

      goto LABEL_43;
    }
    v67 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v67 & 1) != 0)
      goto LABEL_42;
    v69 = v92;
    if (*(_QWORD *)(v60 + 16))
    {
      v70 = v62;
      v71 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v70);
      if ((v72 & 1) != 0)
      {
        v73 = *(double *)(*(_QWORD *)(v60 + 56) + 8 * v71);

        swift_bridgeObjectRelease();
        if (v73 > 0.95)
        {
          v74 = v91;
          Logger.init()();
          v75 = v70;
          v76 = Logger.logObject.getter();
          v77 = static os_log_type_t.debug.getter();
          if (os_log_type_enabled(v76, v77))
          {
            v78 = swift_slowAlloc();
            v100 = (char *)swift_slowAlloc();
            v103 = v100;
            *(_DWORD *)v78 = 136315394;
            v79 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            v101 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v79, v80, (uint64_t *)&v103);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();

            swift_bridgeObjectRelease();
            *(_WORD *)(v78 + 12) = 2048;
            v101 = *(_QWORD *)&v73;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            _os_log_impl(&dword_2488EF000, v76, v77, "The probability for this message being for language %s is %f", (uint8_t *)v78, 0x16u);
            v81 = v100;
            swift_arrayDestroy();
            MEMORY[0x24959F0A0](v81, -1, -1);
            MEMORY[0x24959F0A0](v78, -1, -1);

            v82 = v91;
          }
          else
          {

            v82 = v74;
          }
          v48(v82, v99);
          v68 = static String._unconditionallyBridgeFromObjectiveC(_:)();

          return v68;
        }
        goto LABEL_53;
      }

    }
    swift_bridgeObjectRelease();
LABEL_53:
    Logger.init()();
    v83 = v62;
    v84 = Logger.logObject.getter();
    v85 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v84, v85))
    {
      v86 = (uint8_t *)swift_slowAlloc();
      v87 = swift_slowAlloc();
      v103 = (char *)v87;
      *(_DWORD *)v86 = 136315138;
      v88 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v101 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v88, v89, (uint64_t *)&v103);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2488EF000, v84, v85, "Unable to find probability or probability is too low for language %s", v86, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24959F0A0](v87, -1, -1);
      MEMORY[0x24959F0A0](v86, -1, -1);

      v90 = v92;
    }
    else
    {

      v90 = v69;
    }
    v48(v90, v99);
    return 0;
  }
LABEL_60:
  __break(1u);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24959EFE0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [String] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [String] and conformance [A];
  if (!lazy protocol witness table cache variable for type [String] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String]);
    result = MEMORY[0x24959EFF8](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String] and conformance [A]);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24959EFEC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t specialized Dictionary.Values.subscript.getter(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(_BYTE *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a4 + (((unint64_t)result >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2)
    return *(_QWORD *)(*(_QWORD *)(a4 + 56) + 16 * result);
LABEL_8:
  __break(1u);
  return result;
}

uint64_t specialized Sequence.first(where:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t result;
  int64_t j;
  unint64_t v13;
  unint64_t i;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  Swift::String v19;

  v6 = a1 + 64;
  v7 = 1 << *(_BYTE *)(a1 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(a1 + 64);
  v10 = (unint64_t)(v7 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  j = 0;
  if (!v9)
    goto LABEL_5;
LABEL_4:
  v13 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  for (i = v13 | (j << 6); ; i = __clz(__rbit64(v16)) + (j << 6))
  {
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * i);
    swift_bridgeObjectRetain();
    v19._countAndFlagsBits = a2;
    v19._object = a3;
    if (String.hasPrefix(_:)(v19))
    {
      swift_release();
      return v18;
    }
    result = swift_bridgeObjectRelease();
    if (v9)
      goto LABEL_4;
LABEL_5:
    v15 = j + 1;
    if (__OFADD__(j, 1))
      break;
    if (v15 >= v10)
      goto LABEL_24;
    v16 = *(_QWORD *)(v6 + 8 * v15);
    ++j;
    if (v16)
      goto LABEL_19;
    j = v15 + 1;
    if (v15 + 1 >= v10)
      goto LABEL_24;
    v16 = *(_QWORD *)(v6 + 8 * j);
    if (v16)
      goto LABEL_19;
    j = v15 + 2;
    if (v15 + 2 >= v10)
      goto LABEL_24;
    v16 = *(_QWORD *)(v6 + 8 * j);
    if (v16)
      goto LABEL_19;
    j = v15 + 3;
    if (v15 + 3 >= v10)
      goto LABEL_24;
    v16 = *(_QWORD *)(v6 + 8 * j);
    if (v16)
      goto LABEL_19;
    v17 = v15 + 4;
    if (v17 >= v10)
    {
LABEL_24:
      swift_release();
      return 0;
    }
    v16 = *(_QWORD *)(v6 + 8 * v17);
    for (j = v17; !v16; ++v17)
    {
      j = v17 + 1;
      if (__OFADD__(v17, 1))
        goto LABEL_27;
      if (j >= v10)
        goto LABEL_24;
      v16 = *(_QWORD *)(v6 + 8 * j);
    }
LABEL_19:
    v9 = (v16 - 1) & v16;
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t specialized LocaleDetection.userLocaleDetected(fromString:limitToPreferredLocales:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(char *, _QWORD);
  char *v60;
  void (*v61)(_QWORD, _QWORD);
  unint64_t v62;
  char v63;
  uint64_t *v64;
  uint64_t v65;
  unint64_t v66;
  char *v67;
  NSObject *v68;
  os_log_type_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  NSObject *v77;
  os_log_type_t v78;
  uint64_t v79;
  uint8_t *v80;
  uint64_t v81;
  char *v82;
  NSObject *v83;
  os_log_type_t v84;
  uint64_t v85;
  uint8_t *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  char *v91;
  uint64_t v92;
  void (*v93)(_QWORD, _QWORD);
  uint64_t v94;
  uint64_t v95;

  v10 = type metadata accessor for Logger();
  v92 = *(_QWORD *)(v10 - 8);
  v93 = (void (*)(_QWORD, _QWORD))v10;
  v13 = MEMORY[0x24BDAC7A8](v10, v11, v12);
  v15 = (char *)&v89 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v13, v16, v17);
  v20 = (char *)&v89 - v19;
  v23 = MEMORY[0x24BDAC7A8](v18, v21, v22);
  v90 = (char *)&v89 - v24;
  v27 = MEMORY[0x24BDAC7A8](v23, v25, v26);
  v29 = (char *)&v89 - v28;
  v32 = MEMORY[0x24BDAC7A8](v27, v30, v31);
  v91 = (char *)&v89 - v33;
  MEMORY[0x24BDAC7A8](v32, v34, v35);
  v37 = (char *)&v89 - v36;
  v38 = 0;
  if ((a3 & 1) != 0)
  {
    v39 = swift_bridgeObjectRetain();
    v38 = specialized _copyCollectionToContiguousArray<A>(_:)(v39);
    swift_bridgeObjectRelease();
  }
  v40 = specialized LocaleDetection.userLanguageDetected(fromMessage:preferredLocales:)(a1, a2, (uint64_t)v38, a4);
  v42 = v41;
  swift_bridgeObjectRelease();
  if (v42)
  {
    if (*(_QWORD *)(a5 + 16))
    {
      if ((a3 & 1) != 0)
      {
        Logger.init()();
        swift_bridgeObjectRetain_n();
        v43 = Logger.logObject.getter();
        v44 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v43, v44))
        {
          v89 = v40;
          v45 = (uint8_t *)swift_slowAlloc();
          v46 = swift_slowAlloc();
          v95 = v46;
          *(_DWORD *)v45 = 136315138;
          swift_bridgeObjectRetain();
          v94 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v89, (unint64_t)v42, &v95);
          v40 = v89;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_2488EF000, v43, v44, "Attempting to match detected language %s to available preferred locales", v45, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24959F0A0](v46, -1, -1);
          MEMORY[0x24959F0A0](v45, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        v59 = *(void (**)(char *, _QWORD))(v92 + 8);
        v60 = v37;
        v61 = v93;
        v59(v60, v93);
        if (*(_QWORD *)(a5 + 16))
        {
          swift_bridgeObjectRetain();
          v62 = specialized __RawDictionaryStorage.find<A>(_:)(v40, (uint64_t)v42);
          if ((v63 & 1) != 0)
          {
            v64 = (uint64_t *)(*(_QWORD *)(a5 + 56) + 16 * v62);
            v65 = *v64;
            v66 = v64[1];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            v67 = v91;
            Logger.init()();
            swift_bridgeObjectRetain_n();
            swift_bridgeObjectRetain();
            v68 = Logger.logObject.getter();
            v69 = static os_log_type_t.debug.getter();
            if (os_log_type_enabled(v68, v69))
            {
              v70 = swift_slowAlloc();
              v93 = (void (*)(_QWORD, _QWORD))v59;
              v71 = v70;
              v72 = swift_slowAlloc();
              v95 = v72;
              *(_DWORD *)v71 = 136315394;
              swift_bridgeObjectRetain();
              v94 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v40, (unint64_t)v42, &v95);
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              swift_bridgeObjectRelease_n();
              *(_WORD *)(v71 + 12) = 2080;
              swift_bridgeObjectRetain();
              v94 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v65, v66, &v95);
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              swift_bridgeObjectRelease_n();
              _os_log_impl(&dword_2488EF000, v68, v69, "Found a directly matching locale based on locale identifier for language %s: %s", (uint8_t *)v71, 0x16u);
              swift_arrayDestroy();
              MEMORY[0x24959F0A0](v72, -1, -1);
              MEMORY[0x24959F0A0](v71, -1, -1);

              v93(v91, v61);
            }
            else
            {

              swift_bridgeObjectRelease_n();
              swift_bridgeObjectRelease_n();
              v59(v67, v61);
            }
            return v65;
          }
          swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v74 = specialized Sequence.first(where:)(a5, v40, v42);
        v76 = v75;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v76)
        {
          swift_bridgeObjectRelease();
          Logger.init()();
          swift_bridgeObjectRetain_n();
          v77 = Logger.logObject.getter();
          v78 = static os_log_type_t.debug.getter();
          if (os_log_type_enabled(v77, v78))
          {
            v79 = swift_slowAlloc();
            v93 = (void (*)(_QWORD, _QWORD))v59;
            v80 = (uint8_t *)v79;
            v81 = swift_slowAlloc();
            v95 = v81;
            *(_DWORD *)v80 = 136315138;
            swift_bridgeObjectRetain();
            v94 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v74, v76, &v95);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_2488EF000, v77, v78, "Found a matching locale: %s", v80, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x24959F0A0](v81, -1, -1);
            MEMORY[0x24959F0A0](v80, -1, -1);

            v93(v29, v61);
          }
          else
          {

            swift_bridgeObjectRelease_n();
            v59(v29, v61);
          }
          return v74;
        }
        else
        {
          v82 = v90;
          Logger.init()();
          swift_bridgeObjectRetain();
          v83 = Logger.logObject.getter();
          v84 = static os_log_type_t.debug.getter();
          if (os_log_type_enabled(v83, v84))
          {
            v85 = swift_slowAlloc();
            v93 = (void (*)(_QWORD, _QWORD))v59;
            v86 = (uint8_t *)v85;
            v87 = v40;
            v88 = swift_slowAlloc();
            v95 = v88;
            *(_DWORD *)v86 = 136315138;
            swift_bridgeObjectRetain();
            v94 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v87, (unint64_t)v42, &v95);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_2488EF000, v83, v84, "Unable to reliably determine language %s for message", v86, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x24959F0A0](v88, -1, -1);
            MEMORY[0x24959F0A0](v86, -1, -1);

            v93(v82, v61);
          }
          else
          {

            swift_bridgeObjectRelease_n();
            v59(v82, v61);
          }
          return 0;
        }
      }
      else
      {
        Logger.init()();
        swift_bridgeObjectRetain_n();
        v53 = Logger.logObject.getter();
        v54 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v53, v54))
        {
          v55 = (uint8_t *)swift_slowAlloc();
          v56 = v40;
          v57 = swift_slowAlloc();
          v95 = v57;
          *(_DWORD *)v55 = 136315138;
          swift_bridgeObjectRetain();
          v94 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v56, (unint64_t)v42, &v95);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_2488EF000, v53, v54, "We are not limiting to just preferred locales, relying on ML language detection %s", v55, 0xCu);
          swift_arrayDestroy();
          v58 = v57;
          v40 = v56;
          MEMORY[0x24959F0A0](v58, -1, -1);
          MEMORY[0x24959F0A0](v55, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        (*(void (**)(char *, _QWORD))(v92 + 8))(v20, v93);
      }
    }
    else
    {
      Logger.init()();
      swift_bridgeObjectRetain_n();
      v47 = Logger.logObject.getter();
      v48 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v47, v48))
      {
        v49 = (uint8_t *)swift_slowAlloc();
        v50 = v40;
        v51 = swift_slowAlloc();
        v95 = v51;
        *(_DWORD *)v49 = 136315138;
        swift_bridgeObjectRetain();
        v94 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v50, (unint64_t)v42, &v95);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_2488EF000, v47, v48, "We have no preferred locales, defaulting purely back to ML language detection %s", v49, 0xCu);
        swift_arrayDestroy();
        v52 = v51;
        v40 = v50;
        MEMORY[0x24959F0A0](v52, -1, -1);
        MEMORY[0x24959F0A0](v49, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(char *, _QWORD))(v92 + 8))(v15, v93);
    }
  }
  return v40;
}

uint64_t outlined init with copy of Date?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of Date?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t destroy for LocaleDetection()
{
  swift_release();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeBufferWithCopyOfBuffer for LocaleDetection(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for LocaleDetection(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for LocaleDetection(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LocaleDetection(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LocaleDetection(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for LocaleDetection()
{
  return &type metadata for LocaleDetection;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t one-time initialization function for tusProcWarning(uint64_t a1)
{
  return one-time initialization function for tusProcWarning(a1, static OS_dispatch_source.MemoryPressureEvent.tusProcWarning, 16);
}

uint64_t one-time initialization function for tusProcCritical(uint64_t a1)
{
  return one-time initialization function for tusProcWarning(a1, static OS_dispatch_source.MemoryPressureEvent.tusProcCritical, 32);
}

uint64_t one-time initialization function for tusProcWarning(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;

  v5 = type metadata accessor for OS_dispatch_source.MemoryPressureEvent();
  __swift_allocate_value_buffer(v5, a2);
  __swift_project_value_buffer(v5, (uint64_t)a2);
  return MEMORY[0x24959E5C0](a3);
}

Swift::Void __swiftcall TUSLazyPurgeable.purgeState()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[2];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32[3];

  v1 = v0;
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 80);
  v3 = type metadata accessor for Optional();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5, v6);
  v8 = (char *)v26 - v7;
  v9 = type metadata accessor for Logger();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9, v11, v12);
  v14 = (char *)v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  Logger.init()();
  v15 = Logger.logObject.getter();
  v16 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v29 = v4;
    v17 = swift_slowAlloc();
    v30 = v3;
    v18 = (uint8_t *)v17;
    v19 = swift_slowAlloc();
    v28 = v10;
    v20 = v19;
    v31 = v2;
    v32[0] = v19;
    v27 = v9;
    *(_DWORD *)v18 = 136315138;
    v26[1] = v18 + 4;
    swift_getMetatypeMetadata();
    v21 = String.init<A>(reflecting:)();
    v31 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v22, v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    v4 = v29;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2488EF000, v15, v16, "Purging TUSLazyPurgeable of type %s due to memory pressure", v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24959F0A0](v20, -1, -1);
    v23 = v18;
    v3 = v30;
    MEMORY[0x24959F0A0](v23, -1, -1);

    (*(void (**)(char *, uint64_t))(v28 + 8))(v14, v27);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v9);
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v8, 1, 1, v2);
  v24 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 96);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 40))(v24, v8, v3);
  swift_endAccess();
  v25 = *(_QWORD *)(*(_QWORD *)v1 + 120);
  if (*(_QWORD *)(v1 + v25))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    OS_dispatch_source.cancel()();
    swift_unknownObjectRelease();
  }
  *(_QWORD *)(v1 + v25) = 0;
  swift_unknownObjectRelease();
}

uint64_t TUSLazyPurgeable.instantiateState()()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t (*v34)(char *, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(unint64_t, uint64_t, uint64_t);
  unint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  char *v52;
  char *v53;
  char *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = *v0;
  v3 = type metadata accessor for DispatchWorkItemFlags();
  v60 = *(_QWORD *)(v3 - 8);
  v61 = v3;
  MEMORY[0x24BDAC7A8](v3, v4, v5);
  v59 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchQoS();
  v57 = *(_QWORD *)(v7 - 8);
  v58 = v7;
  MEMORY[0x24BDAC7A8](v7, v8, v9);
  v56 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for OS_dispatch_source.MemoryPressureEvent();
  v55 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11, v12, v13);
  v54 = (char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(_QWORD *)(v2 + 80);
  v16 = type metadata accessor for Optional();
  v17 = *(_QWORD *)(v16 - 8);
  v20 = MEMORY[0x24BDAC7A8](v16, v18, v19);
  v22 = (char *)&v54 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v20, v23, v24);
  v27 = (char *)&v54 - v26;
  MEMORY[0x24BDAC7A8](v25, v28, v29);
  v31 = (char *)&v54 - v30;
  v32 = (char *)v1 + *(_QWORD *)(v2 + 96);
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v31, v32, v16);
  v33 = *(_QWORD *)(v15 - 8);
  v34 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v33 + 48);
  v62 = v15;
  LODWORD(v15) = v34(v31, 1, v15);
  result = (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v31, v16);
  if ((_DWORD)v15 == 1)
  {
    (*(void (**)(uint64_t))((char *)v1 + *(_QWORD *)(*v1 + 104)))(result);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v27, 0, 1, v62);
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v22, v27, v16);
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v17 + 40))(v32, v22, v16);
    result = swift_endAccess();
  }
  v36 = *(_QWORD *)(*v1 + 120);
  if (!*(_QWORD *)((char *)v1 + v36))
  {
    type metadata accessor for OS_dispatch_source(0, &lazy cache variable for type metadata for OS_dispatch_source);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<OS_dispatch_source.MemoryPressureEvent>);
    v37 = v55;
    v38 = *(_QWORD *)(v55 + 72);
    v39 = (*(unsigned __int8 *)(v55 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80);
    v40 = swift_allocObject();
    *(_OWORD *)(v40 + 16) = xmmword_248916D40;
    v41 = v40 + v39;
    v42 = MEMORY[0x24959E5A8]();
    MEMORY[0x24959E5B4](v42);
    if (one-time initialization token for tusProcWarning != -1)
      swift_once();
    v43 = __swift_project_value_buffer(v11, (uint64_t)static OS_dispatch_source.MemoryPressureEvent.tusProcWarning);
    v44 = *(void (**)(unint64_t, uint64_t, uint64_t))(v37 + 16);
    v44(v41 + 2 * v38, v43, v11);
    v45 = v41 + 3 * v38;
    if (one-time initialization token for tusProcCritical != -1)
      swift_once();
    v46 = __swift_project_value_buffer(v11, (uint64_t)static OS_dispatch_source.MemoryPressureEvent.tusProcCritical);
    v44(v45, v46, v11);
    aBlock[0] = v40;
    lazy protocol witness table accessor for type NLTagScheme and conformance NLTagScheme((unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_source.MemoryPressureEvent and conformance OS_dispatch_source.MemoryPressureEvent, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5868], MEMORY[0x24BEE5888]);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_source.MemoryPressureEvent]);
    lazy protocol witness table accessor for type [OS_dispatch_source.MemoryPressureEvent] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [OS_dispatch_source.MemoryPressureEvent] and conformance [A], &demangling cache variable for type metadata for [OS_dispatch_source.MemoryPressureEvent]);
    v47 = v54;
    dispatch thunk of SetAlgebra.init<A>(_:)();
    v48 = static OS_dispatch_source.makeMemoryPressureSource(eventMask:queue:)();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v47, v11);
    swift_getObjectType();
    v49 = swift_allocObject();
    swift_weakInit();
    v50 = swift_allocObject();
    *(_QWORD *)(v50 + 16) = v62;
    *(_QWORD *)(v50 + 24) = v49;
    aBlock[4] = partial apply for closure #1 in TUSLazyPurgeable.instantiateState();
    aBlock[5] = v50;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed () -> ();
    aBlock[3] = &block_descriptor;
    v51 = _Block_copy(aBlock);
    swift_retain();
    v52 = v56;
    static DispatchQoS.unspecified.getter();
    v53 = v59;
    default argument 1 of OS_dispatch_source.setEventHandler(qos:flags:handler:)();
    OS_dispatch_source.setEventHandler(qos:flags:handler:)();
    _Block_release(v51);
    (*(void (**)(char *, uint64_t))(v60 + 8))(v53, v61);
    (*(void (**)(char *, uint64_t))(v57 + 8))(v52, v58);
    swift_release();
    swift_release();
    OS_dispatch_source.activate()();
    *(_QWORD *)((char *)v1 + v36) = v48;
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t closure #1 in TUSLazyPurgeable.instantiateState()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v0, v1, v2);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v6 = result;
    v7 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v4, 1, 1, v7);
    v8 = (_QWORD *)swift_allocObject();
    v8[2] = 0;
    v8[3] = 0;
    v8[4] = v6;
    _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v4, (uint64_t)&async function pointer to partial apply for closure #1 in closure #1 in TUSLazyPurgeable.instantiateState(), (uint64_t)v8);
    return swift_release();
  }
  return result;
}

uint64_t closure #1 in closure #1 in TUSLazyPurgeable.instantiateState()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t closure #1 in closure #1 in TUSLazyPurgeable.instantiateState()()
{
  uint64_t v0;

  TUSLazyPurgeable.purgeState()();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t thunk for @escaping @callee_guaranteed () -> ()(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t default argument 1 of OS_dispatch_source.setEventHandler(qos:flags:handler:)()
{
  type metadata accessor for DispatchWorkItemFlags();
  lazy protocol witness table accessor for type NLTagScheme and conformance NLTagScheme((unint64_t *)&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [OS_dispatch_source.MemoryPressureEvent] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], &demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

_QWORD *TUSLazyPurgeable.__allocating_init(initialize:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;

  swift_allocObject();
  v4 = specialized TUSLazyPurgeable.init(initialize:)(a1, a2);
  swift_release();
  return v4;
}

_QWORD *TUSLazyPurgeable.init(initialize:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2 = specialized TUSLazyPurgeable.init(initialize:)(a1, a2);
  swift_release();
  return v2;
}

uint64_t *TUSLazyPurgeable.deinit()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0;
  v2 = *v0;
  if (*(uint64_t *)((char *)v0 + *(_QWORD *)(*v0 + 120)))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    OS_dispatch_source.cancel()();
    swift_unknownObjectRelease();
    v2 = *v0;
  }
  v3 = (uint64_t)v0 + *(_QWORD *)(v2 + 96);
  v4 = type metadata accessor for Optional();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();

  swift_unknownObjectRelease();
  swift_defaultActor_destroy();
  return v1;
}

uint64_t TUSLazyPurgeable.__deallocating_deinit()
{
  TUSLazyPurgeable.deinit();
  return swift_defaultActor_deallocate();
}

uint64_t TUSLazyPurgeable.run<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;

  v4[7] = a3;
  v4[8] = v3;
  v4[5] = a1;
  v4[6] = a2;
  v4[9] = *v3;
  return swift_task_switch();
}

{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v4[7] = a3;
  v4[8] = v3;
  v4[5] = a1;
  v4[6] = a2;
  v4[9] = *(_QWORD *)(*(_QWORD *)v3 + 80);
  v5 = type metadata accessor for Optional();
  v4[10] = v5;
  v4[11] = *(_QWORD *)(v5 - 8);
  v4[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t TUSLazyPurgeable.run<A>(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 72);
  TUSLazyPurgeable.instantiateState()();
  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 96);
  swift_beginAccess();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v2 + 80) - 8) + 48))(v3, 1);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t))(v0 + 48))(v3);
    swift_endAccess();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  return result;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  _QWORD *v9;
  uint64_t (*v10)(_QWORD, _QWORD);

  v2 = *(_QWORD *)(v0 + 88);
  v1 = *(_QWORD *)(v0 + 96);
  v4 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 80);
  v5 = *(_QWORD *)(v0 + 64);
  TUSLazyPurgeable.instantiateState()();
  v6 = v5 + *(_QWORD *)(*(_QWORD *)v5 + 96);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v6, v3);
  v7 = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v0 + 104) = v7;
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v1, 1, v4);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v10 = (uint64_t (*)(_QWORD, _QWORD))(**(int **)(v0 + 48) + *(_QWORD *)(v0 + 48));
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v9;
    *v9 = v0;
    v9[1] = TUSLazyPurgeable.run<A>(_:);
    return v10(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 96));
  }
  return result;
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 120) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v2 + 104) + 8))(*(_QWORD *)(v2 + 96), *(_QWORD *)(v2 + 72));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 104) + 8))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 72));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t TUSLazyPurgeable.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t protocol witness for Actor.unownedExecutor.getter in conformance TUSLazyPurgeable<A>()
{
  return TUSLazyPurgeable.unownedExecutor.getter();
}

_QWORD *specialized TUSLazyPurgeable.init(initialize:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  void (*v30)(char *, uint64_t, uint64_t, uint64_t);
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  Swift::String v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;

  v3 = v2;
  v39 = a1;
  v40 = a2;
  v4 = *v2;
  v5 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  v45 = *(_QWORD *)(v5 - 8);
  v46 = v5;
  MEMORY[0x24BDAC7A8](v5, v6, v7);
  v44 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = type metadata accessor for OS_dispatch_queue_serial.Attributes();
  MEMORY[0x24BDAC7A8](v43, v9, v10);
  v42 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for DispatchQoS();
  MEMORY[0x24BDAC7A8](v12, v13, v14);
  v41 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for UUID();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16, v18, v19);
  v21 = (char *)&v38 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = *(_QWORD *)(v4 + 80);
  v23 = type metadata accessor for Optional();
  v24 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23, v25, v26);
  v28 = (char *)&v38 - v27;
  swift_defaultActor_initialize();
  v29 = (char *)v3 + *(_QWORD *)(*v3 + 96);
  v30 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56);
  v30(v29, 1, 1, v22);
  *(_QWORD *)((char *)v3 + *(_QWORD *)(*v3 + 120)) = 0;
  v30(v28, 1, 1, v22);
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v24 + 40))(v29, v28, v23);
  swift_endAccess();
  v31 = (_QWORD *)((char *)v3 + *(_QWORD *)(*v3 + 104));
  v32 = v40;
  *v31 = v39;
  v31[1] = v32;
  type metadata accessor for OS_dispatch_source(0, (unint64_t *)&lazy cache variable for type metadata for OS_dispatch_queue_serial);
  v47 = 0;
  v48 = 0xE000000000000000;
  swift_retain();
  _StringGuts.grow(_:)(37);
  swift_bridgeObjectRelease();
  v47 = 0xD000000000000023;
  v48 = 0x80000002489181C0;
  UUID.init()();
  v33 = UUID.uuidString.getter();
  v35 = v34;
  (*(void (**)(char *, uint64_t))(v17 + 8))(v21, v16);
  v36._countAndFlagsBits = v33;
  v36._object = v35;
  String.append(_:)(v36);
  swift_bridgeObjectRelease();
  static DispatchQoS.utility.getter();
  v47 = MEMORY[0x24BEE4AF8];
  lazy protocol witness table accessor for type NLTagScheme and conformance NLTagScheme((unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue_serial.Attributes and conformance OS_dispatch_queue_serial.Attributes, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5930], MEMORY[0x24BEE5940]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue_serial.Attributes]);
  lazy protocol witness table accessor for type [OS_dispatch_source.MemoryPressureEvent] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [OS_dispatch_queue_serial.Attributes] and conformance [A], &demangling cache variable for type metadata for [OS_dispatch_queue_serial.Attributes]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, _QWORD, uint64_t))(v45 + 104))(v44, *MEMORY[0x24BEE5758], v46);
  *(_QWORD *)((char *)v3 + *(_QWORD *)(*v3 + 112)) = OS_dispatch_queue_serial.init(label:qos:attributes:autoreleaseFrequency:target:)();
  return v3;
}

uint64_t type metadata completion function for TUSLazyPurgeable()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for Optional();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for TUSLazyPurgeable(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TUSLazyPurgeable);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_2488FA46C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2488FA490()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in TUSLazyPurgeable.instantiateState()()
{
  return closure #1 in TUSLazyPurgeable.instantiateState()();
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

uint64_t sub_2488FA4D4()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in TUSLazyPurgeable.instantiateState()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = partial apply for closure #1 in closure #1 in TUSLazyPurgeable.instantiateState();
  v3[2] = v2;
  return swift_task_switch();
}

{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t type metadata accessor for OS_dispatch_source(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type [OS_dispatch_source.MemoryPressureEvent] and conformance [A](unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24959EFF8](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x24959EF98](a1, v6, a5);
}

id TrialDecoder.trialClient.getter()
{
  id *v0;

  return *v0;
}

uint64_t TrialDecoder.namespaceName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

id *key path getter for TrialDecoder.factorDownloader : TrialDecoder@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  id *result;
  id v6[3];
  _QWORD v7[2];

  outlined init with copy of TrialDecoder(a1, v6);
  v3 = MEMORY[0x24959F160](v7);
  v4 = v7[1];
  result = outlined destroy of TrialDecoder(v6);
  *a2 = v3;
  a2[1] = v4;
  return result;
}

uint64_t TrialDecoder.factorDownloader.getter()
{
  uint64_t v0;

  return MEMORY[0x24959F160](v0 + 24);
}

uint64_t TrialDecoder.factorDownloader.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t (*TrialDecoder.factorDownloader.modify(uint64_t *a1))(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  a1[2] = v1;
  v3 = MEMORY[0x24959F160](v1 + 24);
  v4 = *(_QWORD *)(v1 + 32);
  *a1 = v3;
  a1[1] = v4;
  return TrialDecoder.factorDownloader.modify;
}

uint64_t TrialDecoder.factorDownloader.modify(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 16) + 32) = *(_QWORD *)(a1 + 8);
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t TrialDecoder.init(trialClient:namespaceName:factorDownloader:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, _QWORD *a5@<X8>)
{
  a5[4] = 0;
  swift_unknownObjectWeakInit();
  *a5 = a1;
  a5[1] = a2;
  a5[2] = a3;
  a5[4] = a4;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t TrialDecoder.decode<A>(_:)()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v9[7];
  _BYTE v10[56];

  v1 = MEMORY[0x24BEE4AF8];
  v2 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x24BEE4AF8]);
  v3 = *(void **)v0;
  v4 = *(_QWORD *)(v0 + 8);
  v5 = *(_QWORD *)(v0 + 16);
  MEMORY[0x24959F160](v0 + 24);
  v6 = *(_QWORD *)(v0 + 32);
  swift_unknownObjectWeakInit();
  v9[0] = v1;
  v9[1] = v2;
  v9[2] = v3;
  v9[3] = v4;
  v9[4] = v5;
  v9[6] = v6;
  swift_unknownObjectWeakAssign();
  v7 = v3;
  swift_bridgeObjectRetain();
  swift_unknownObjectRelease();
  outlined init with take of TrialDecoderImpl((uint64_t)v9, (uint64_t)v10);
  TrialDecoderImpl.unwrap<A>(as:)();
  return outlined destroy of TrialDecoderImpl((uint64_t)v10);
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t result;
  char v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  _QWORD v24[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (CodingUserInfoKey, Any));
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4, v5);
  v7 = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v9 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<CodingUserInfoKey, Any>);
  v8 = static _DictionaryStorage.allocate(capacity:)();
  v9 = (_QWORD *)v8;
  v10 = *(_QWORD *)(a1 + 16);
  if (!v10)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v9;
  }
  v11 = &v7[*(int *)(v2 + 48)];
  v12 = v8 + 64;
  v13 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v24[1] = a1;
  v14 = a1 + v13;
  v15 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    outlined init with copy of (String, Any)(v14, (uint64_t)v7, &demangling cache variable for type metadata for (CodingUserInfoKey, Any));
    result = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v7);
    if ((v17 & 1) != 0)
      break;
    v18 = result;
    *(_QWORD *)(v12 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v19 = v9[6];
    v20 = type metadata accessor for CodingUserInfoKey();
    (*(void (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v19 + *(_QWORD *)(*(_QWORD *)(v20 - 8) + 72) * v18, v7, v20);
    result = (unint64_t)outlined init with take of Any(v11, (_OWORD *)(v9[7] + 32 * v18));
    v21 = v9[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
      goto LABEL_11;
    v9[2] = v23;
    v14 += v15;
    if (!--v10)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Any>);
  v2 = static _DictionaryStorage.allocate(capacity:)();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    outlined init with copy of (String, Any)(v6, (uint64_t)&v15, &demangling cache variable for type metadata for (String, Any));
    v7 = v15;
    v8 = v16;
    result = specialized __RawDictionaryStorage.find<A>(_:)(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)outlined init with take of Any(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t outlined init with take of TrialDecoderImpl(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_QWORD *)(a2 + 16) = *(_QWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 24);
  swift_unknownObjectWeakTakeInit();
  *(_QWORD *)(a2 + 48) = *(_QWORD *)(a1 + 48);
  return a2;
}

uint64_t TrialDecoderImpl.unwrap<A>(as:)()
{
  uint64_t v0;
  uint64_t v2;

  lazy protocol witness table accessor for type TrialDecoderImpl and conformance TrialDecoderImpl();
  v2 = swift_allocObject();
  outlined init with copy of TrialDecoderImpl(v0, v2 + 16);
  return dispatch thunk of Decodable.init(from:)();
}

uint64_t outlined destroy of TrialDecoderImpl(uint64_t a1)
{
  destroy for TrialDecoderImpl(a1, &unk_2519A8E08);
  return a1;
}

uint64_t sub_2488FAD24(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 8);
  return swift_unknownObjectWeakAssign();
}

uint64_t outlined copy of TrialDecodingError(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 2u)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for TrialDecodingError(uint64_t a1)
{
  return outlined consume of TrialDecodingError(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t outlined consume of TrialDecodingError(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 2u)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for TrialDecodingError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  outlined copy of TrialDecodingError(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for TrialDecodingError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  outlined copy of TrialDecodingError(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  outlined consume of TrialDecodingError(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for TrialDecodingError(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  outlined consume of TrialDecodingError(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for TrialDecodingError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TrialDecodingError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t getEnumTag for TrialDecodingError(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t destructiveInjectEnumTag for TrialDecodingError(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for TrialDecodingError()
{
  return &type metadata for TrialDecodingError;
}

uint64_t initializeBufferWithCopyOfBuffer for TrialDecoder(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for TrialDecoder(id *a1)
{

  swift_bridgeObjectRelease();
  return swift_unknownObjectWeakDestroy();
}

_QWORD *initializeWithCopy for TrialDecoder(_QWORD *a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v5;
  a1[2] = *(_QWORD *)(a2 + 16);
  v6 = v4;
  swift_bridgeObjectRetain();
  swift_unknownObjectWeakCopyInit();
  a1[4] = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t assignWithCopy for TrialDecoder(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakCopyAssign();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t initializeWithTake for TrialDecoder(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_unknownObjectWeakTakeInit();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t assignWithTake for TrialDecoder(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  v5 = a2[2];
  *(_QWORD *)(a1 + 8) = a2[1];
  *(_QWORD *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakTakeAssign();
  *(_QWORD *)(a1 + 32) = a2[4];
  return a1;
}

uint64_t getEnumTagSinglePayload for TrialDecoder(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TrialDecoder(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TrialDecoder()
{
  return &type metadata for TrialDecoder;
}

void *type metadata accessor for TrialDecoderImpl()
{
  return &unk_2519A8E08;
}

uint64_t TrialDecoderImpl.container<A>(keyedBy:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  static Array._allocateUninitialized(_:)();
  v6 = *(void **)(v3 + 16);
  MEMORY[0x24959F160](v3 + 40);
  v7 = v6;
  swift_bridgeObjectRetain();
  swift_unknownObjectWeakInit();
  swift_unknownObjectRelease();
  v9 = type metadata accessor for TrialDecoderImpl.KeyedContainer(0, a2, a3, v8);
  MEMORY[0x24959EFF8]("y \t\t@;", v9);
  return KeyedDecodingContainer.init<A>(_:)();
}

uint64_t protocol witness for Decoder.container<A>(keyedBy:) in conformance TrialDecoderImpl(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return TrialDecoderImpl.container<A>(keyedBy:)(a1, a2, a3);
}

uint64_t protocol witness for Decoder.unkeyedContainer() in conformance TrialDecoderImpl@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  a1[3] = (uint64_t)&unk_2519A8F40;
  a1[4] = lazy protocol witness table accessor for type TrialDecoderImpl.UnkeyedContainer and conformance TrialDecoderImpl.UnkeyedContainer();
  result = swift_allocObject();
  *a1 = result;
  *(_QWORD *)(result + 16) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(result + 24) = 0;
  *(_WORD *)(result + 32) = 257;
  *(_QWORD *)(result + 40) = 0;
  return result;
}

unint64_t protocol witness for Decoder.singleValueContainer() in conformance TrialDecoderImpl@<X0>(_QWORD *a1@<X8>)
{
  unint64_t result;

  a1[3] = &unk_2519A8F70;
  result = lazy protocol witness table accessor for type TrialDecoderImpl.SingleValueContainer and conformance TrialDecoderImpl.SingleValueContainer();
  a1[4] = result;
  *a1 = MEMORY[0x24BEE4AF8];
  return result;
}

unint64_t lazy protocol witness table accessor for type TrialDecoderImpl.SingleValueContainer and conformance TrialDecoderImpl.SingleValueContainer()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TrialDecoderImpl.SingleValueContainer and conformance TrialDecoderImpl.SingleValueContainer;
  if (!lazy protocol witness table cache variable for type TrialDecoderImpl.SingleValueContainer and conformance TrialDecoderImpl.SingleValueContainer)
  {
    result = MEMORY[0x24959EFF8](&protocol conformance descriptor for TrialDecoderImpl.SingleValueContainer, &unk_2519A8F70);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TrialDecoderImpl.SingleValueContainer and conformance TrialDecoderImpl.SingleValueContainer);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type TrialDecoderImpl.UnkeyedContainer and conformance TrialDecoderImpl.UnkeyedContainer()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TrialDecoderImpl.UnkeyedContainer and conformance TrialDecoderImpl.UnkeyedContainer;
  if (!lazy protocol witness table cache variable for type TrialDecoderImpl.UnkeyedContainer and conformance TrialDecoderImpl.UnkeyedContainer)
  {
    result = MEMORY[0x24959EFF8](&protocol conformance descriptor for TrialDecoderImpl.UnkeyedContainer, &unk_2519A8F40);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TrialDecoderImpl.UnkeyedContainer and conformance TrialDecoderImpl.UnkeyedContainer);
  }
  return result;
}

uint64_t sub_2488FB400()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

BOOL TrialDecoderImpl.KeyedContainer.contains(_:)()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v1 = (void *)v0[2];
  v2 = dispatch thunk of CodingKey.stringValue.getter();
  v3 = (void *)MEMORY[0x24959E374](v2);
  swift_bridgeObjectRelease();
  v4 = (void *)MEMORY[0x24959E374](v0[3], v0[4]);
  v5 = objc_msgSend(v1, sel_levelForFactor_withNamespaceName_, v3, v4);

  if (v5)
  return v5 != 0;
}

uint64_t TrialDecoderImpl.KeyedContainer.decode(_:forKey:)()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  unsigned __int8 v6;
  Swift::String v7;
  uint64_t v8;

  v1 = (void *)v0[2];
  v2 = dispatch thunk of CodingKey.stringValue.getter();
  v3 = (void *)MEMORY[0x24959E374](v2);
  swift_bridgeObjectRelease();
  v4 = (void *)MEMORY[0x24959E374](v0[3], v0[4]);
  v5 = objc_msgSend(v1, sel_levelForFactor_withNamespaceName_, v3, v4);

  if (v5)
  {
    v6 = objc_msgSend(v5, sel_BOOLeanValue);

  }
  else
  {
    _StringGuts.grow(_:)(34);
    v7._object = (void *)0x8000000248919240;
    v7._countAndFlagsBits = 0xD000000000000020;
    String.append(_:)(v7);
    DefaultStringInterpolation.appendInterpolation<A>(_:)();
    v6 = 0;
    lazy protocol witness table accessor for type TrialDecodingError and conformance TrialDecodingError();
    swift_allocError();
    *(_QWORD *)v8 = 0;
    *(_QWORD *)(v8 + 8) = 0xE000000000000000;
    *(_BYTE *)(v8 + 16) = 0;
    swift_willThrow();
  }
  return v6 & 1;
}

{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  Swift::String v9;
  uint64_t v10;

  v1 = (void *)v0[2];
  v2 = dispatch thunk of CodingKey.stringValue.getter();
  v3 = (void *)MEMORY[0x24959E374](v2);
  swift_bridgeObjectRelease();
  v4 = (void *)MEMORY[0x24959E374](v0[3], v0[4]);
  v5 = objc_msgSend(v1, sel_levelForFactor_withNamespaceName_, v3, v4);

  if (v5 && (v6 = objc_msgSend(v5, sel_stringValue), v5, v6))
  {
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();

    return v7;
  }
  else
  {
    _StringGuts.grow(_:)(34);
    v9._object = (void *)0x8000000248919240;
    v9._countAndFlagsBits = 0xD000000000000020;
    String.append(_:)(v9);
    DefaultStringInterpolation.appendInterpolation<A>(_:)();
    lazy protocol witness table accessor for type TrialDecodingError and conformance TrialDecodingError();
    swift_allocError();
    *(_QWORD *)v10 = 0;
    *(_QWORD *)(v10 + 8) = 0xE000000000000000;
    *(_BYTE *)(v10 + 16) = 0;
    return swift_willThrow();
  }
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  Swift::String v3;
  Swift::String v4;
  Swift::String v5;
  Swift::String v6;
  uint64_t v7;

  v1 = TrialDecoderImpl.KeyedContainer.decodeInt64(forKey:)();
  v2 = v1;
  if (!v0 && (unint64_t)(v1 + 0x7FFFFFFFFFFFFFFFLL) > 0xFFFFFFFFFFFFFFFDLL)
  {
    _StringGuts.grow(_:)(62);
    v3._object = (void *)0x8000000248919080;
    v3._countAndFlagsBits = 0xD000000000000011;
    String.append(_:)(v3);
    DefaultStringInterpolation.appendInterpolation<A>(_:)();
    v4._countAndFlagsBits = 0xD000000000000015;
    v4._object = (void *)0x80000002489191E0;
    String.append(_:)(v4);
    v5._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v5);
    swift_bridgeObjectRelease();
    v6._countAndFlagsBits = 0xD000000000000014;
    v6._object = (void *)0x80000002489190C0;
    String.append(_:)(v6);
    lazy protocol witness table accessor for type TrialDecodingError and conformance TrialDecodingError();
    swift_allocError();
    *(_QWORD *)v7 = 0;
    *(_QWORD *)(v7 + 8) = 0xE000000000000000;
    *(_BYTE *)(v7 + 16) = 0;
    swift_willThrow();
  }
  return v2;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  Swift::String v3;
  Swift::String v4;
  Swift::String v5;
  Swift::String v6;
  uint64_t v7;

  v2 = TrialDecoderImpl.KeyedContainer.decodeInt64(forKey:)();
  if (!v1)
  {
    v0 = v2;
    if ((unint64_t)(v2 + 127) >= 0xFE)
    {
      _StringGuts.grow(_:)(63);
      v3._object = (void *)0x8000000248919080;
      v3._countAndFlagsBits = 0xD000000000000011;
      String.append(_:)(v3);
      DefaultStringInterpolation.appendInterpolation<A>(_:)();
      v4._countAndFlagsBits = 0xD000000000000016;
      v4._object = (void *)0x80000002489191C0;
      String.append(_:)(v4);
      v5._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v5);
      swift_bridgeObjectRelease();
      v6._countAndFlagsBits = 0xD000000000000014;
      v6._object = (void *)0x80000002489190C0;
      String.append(_:)(v6);
      v0 = 0;
      lazy protocol witness table accessor for type TrialDecodingError and conformance TrialDecodingError();
      swift_allocError();
      *(_QWORD *)v7 = 0;
      *(_QWORD *)(v7 + 8) = 0xE000000000000000;
      *(_BYTE *)(v7 + 16) = 0;
      swift_willThrow();
    }
  }
  return v0;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  Swift::String v3;
  Swift::String v4;
  Swift::String v5;
  Swift::String v6;
  uint64_t v7;

  v2 = TrialDecoderImpl.KeyedContainer.decodeInt64(forKey:)();
  if (!v1)
  {
    v0 = v2;
    if ((unint64_t)(v2 + 0x7FFF) >= 0xFFFE)
    {
      _StringGuts.grow(_:)(64);
      v3._object = (void *)0x8000000248919080;
      v3._countAndFlagsBits = 0xD000000000000011;
      String.append(_:)(v3);
      DefaultStringInterpolation.appendInterpolation<A>(_:)();
      v4._countAndFlagsBits = 0xD000000000000017;
      v4._object = (void *)0x80000002489191A0;
      String.append(_:)(v4);
      v5._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v5);
      swift_bridgeObjectRelease();
      v6._countAndFlagsBits = 0xD000000000000014;
      v6._object = (void *)0x80000002489190C0;
      String.append(_:)(v6);
      v0 = 0;
      lazy protocol witness table accessor for type TrialDecodingError and conformance TrialDecodingError();
      swift_allocError();
      *(_QWORD *)v7 = 0;
      *(_QWORD *)(v7 + 8) = 0xE000000000000000;
      *(_BYTE *)(v7 + 16) = 0;
      swift_willThrow();
    }
  }
  return v0;
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  Swift::String v3;
  Swift::String v4;
  Swift::String v5;
  Swift::String v6;
  uint64_t v7;

  v2 = TrialDecoderImpl.KeyedContainer.decodeInt64(forKey:)();
  if (!v1)
  {
    v0 = v2;
    if ((unint64_t)(v2 + 0x7FFFFFFF) >= 0xFFFFFFFE)
    {
      _StringGuts.grow(_:)(64);
      v3._object = (void *)0x8000000248919080;
      v3._countAndFlagsBits = 0xD000000000000011;
      String.append(_:)(v3);
      DefaultStringInterpolation.appendInterpolation<A>(_:)();
      v4._countAndFlagsBits = 0xD000000000000017;
      v4._object = (void *)0x8000000248919180;
      String.append(_:)(v4);
      v5._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v5);
      swift_bridgeObjectRelease();
      v6._countAndFlagsBits = 0xD000000000000014;
      v6._object = (void *)0x80000002489190C0;
      String.append(_:)(v6);
      v0 = 0;
      lazy protocol witness table accessor for type TrialDecodingError and conformance TrialDecodingError();
      swift_allocError();
      *(_QWORD *)v7 = 0;
      *(_QWORD *)(v7 + 8) = 0xE000000000000000;
      *(_BYTE *)(v7 + 16) = 0;
      swift_willThrow();
    }
  }
  return v0;
}

{
  return TrialDecoderImpl.KeyedContainer.decodeInt64(forKey:)();
}

{
  uint64_t v0;
  uint64_t result;
  Swift::String v2;
  Swift::String v3;
  Swift::String v4;
  Swift::String v5;
  uint64_t v6;

  result = TrialDecoderImpl.KeyedContainer.decodeInt64(forKey:)();
  if (!v0)
  {
    if (result > 0)
    {
      __break(1u);
    }
    else
    {
      _StringGuts.grow(_:)(63);
      v2._object = (void *)0x8000000248919080;
      v2._countAndFlagsBits = 0xD000000000000011;
      String.append(_:)(v2);
      DefaultStringInterpolation.appendInterpolation<A>(_:)();
      v3._countAndFlagsBits = 0xD000000000000016;
      v3._object = (void *)0x8000000248919160;
      String.append(_:)(v3);
      v4._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v4);
      swift_bridgeObjectRelease();
      v5._countAndFlagsBits = 0xD000000000000014;
      v5._object = (void *)0x80000002489190C0;
      String.append(_:)(v5);
      lazy protocol witness table accessor for type TrialDecodingError and conformance TrialDecodingError();
      swift_allocError();
      *(_QWORD *)v6 = 0;
      *(_QWORD *)(v6 + 8) = 0xE000000000000000;
      *(_BYTE *)(v6 + 16) = 0;
      return swift_willThrow();
    }
  }
  return result;
}

{
  uint64_t v0;
  uint64_t result;
  Swift::String v2;
  Swift::String v3;
  Swift::String v4;
  Swift::String v5;
  uint64_t v6;

  result = TrialDecoderImpl.KeyedContainer.decodeInt64(forKey:)();
  if (!v0)
  {
    if (result < 0)
    {
      _StringGuts.grow(_:)(65);
      v2._object = (void *)0x8000000248919080;
      v2._countAndFlagsBits = 0xD000000000000011;
      String.append(_:)(v2);
      DefaultStringInterpolation.appendInterpolation<A>(_:)();
      v3._countAndFlagsBits = 0xD000000000000018;
      v3._object = (void *)0x80000002489190A0;
      String.append(_:)(v3);
      v4._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v4);
      swift_bridgeObjectRelease();
      v5._countAndFlagsBits = 0xD000000000000014;
      v5._object = (void *)0x80000002489190C0;
      String.append(_:)(v5);
      lazy protocol witness table accessor for type TrialDecodingError and conformance TrialDecodingError();
      swift_allocError();
      *(_QWORD *)v6 = 0;
      *(_QWORD *)(v6 + 8) = 0xE000000000000000;
      *(_BYTE *)(v6 + 16) = 0;
      return swift_willThrow();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

void TrialDecoderImpl.KeyedContainer.decode(_:forKey:)()
{
  TrialDecoderImpl.KeyedContainer.decodeDouble(forKey:)();
}

void TrialDecoderImpl.KeyedContainer.decodeDouble(forKey:)()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  Swift::String v6;
  uint64_t v7;

  v1 = (void *)v0[2];
  v2 = dispatch thunk of CodingKey.stringValue.getter();
  v3 = (void *)MEMORY[0x24959E374](v2);
  swift_bridgeObjectRelease();
  v4 = (void *)MEMORY[0x24959E374](v0[3], v0[4]);
  v5 = objc_msgSend(v1, sel_levelForFactor_withNamespaceName_, v3, v4);

  if (v5)
  {
    objc_msgSend(v5, sel_doubleValue);

  }
  else
  {
    _StringGuts.grow(_:)(33);
    v6._object = (void *)0x8000000248919220;
    v6._countAndFlagsBits = 0xD00000000000001FLL;
    String.append(_:)(v6);
    DefaultStringInterpolation.appendInterpolation<A>(_:)();
    lazy protocol witness table accessor for type TrialDecodingError and conformance TrialDecodingError();
    swift_allocError();
    *(_QWORD *)v7 = 0;
    *(_QWORD *)(v7 + 8) = 0xE000000000000000;
    *(_BYTE *)(v7 + 16) = 0;
    swift_willThrow();
  }
}

void TrialDecoderImpl.KeyedContainer.decode(_:forKey:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  double v15;
  Swift::String v16;
  Swift::String v17;
  Swift::String v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  int v25;
  uint8_t *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;

  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](a1, a2, a3);
  v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Logger();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10, v11);
  v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = v36;
  TrialDecoderImpl.KeyedContainer.decodeDouble(forKey:)();
  if (!v14)
  {
    v35 = a1;
    v36 = v4;
    v33 = v9;
    v34 = v8;
    if (fabs(v15) <= 3.40282347e38)
    {
      v32 = 0;
      Logger.init()();
      v22 = v36;
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v35, v36);
      v23 = Logger.logObject.getter();
      v24 = static os_log_type_t.info.getter();
      v25 = v24;
      if (os_log_type_enabled(v23, v24))
      {
        LODWORD(v35) = v25;
        v26 = (uint8_t *)swift_slowAlloc();
        v31 = swift_slowAlloc();
        v38 = v31;
        *(_DWORD *)v26 = 136315138;
        v30 = v26 + 4;
        v27 = dispatch thunk of CustomStringConvertible.description.getter();
        v37 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v27, v28, &v38);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v22);
        _os_log_impl(&dword_2488EF000, v23, (os_log_type_t)v35, "Decoded factor %s into Float so be aware of possible precision loss", v26, 0xCu);
        v29 = v31;
        swift_arrayDestroy();
        MEMORY[0x24959F0A0](v29, -1, -1);
        MEMORY[0x24959F0A0](v26, -1, -1);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v22);
      }

      (*(void (**)(char *, uint64_t))(v33 + 8))(v13, v34);
    }
    else
    {
      v38 = 0;
      v39 = 0xE000000000000000;
      _StringGuts.grow(_:)(64);
      v16._object = (void *)0x8000000248919080;
      v16._countAndFlagsBits = 0xD000000000000011;
      String.append(_:)(v16);
      DefaultStringInterpolation.appendInterpolation<A>(_:)();
      v17._countAndFlagsBits = 0xD000000000000017;
      v17._object = (void *)0x8000000248919200;
      String.append(_:)(v17);
      Double.write<A>(to:)();
      v18._countAndFlagsBits = 0xD000000000000014;
      v18._object = (void *)0x80000002489190C0;
      String.append(_:)(v18);
      v19 = v38;
      v20 = v39;
      lazy protocol witness table accessor for type TrialDecodingError and conformance TrialDecodingError();
      swift_allocError();
      *(_QWORD *)v21 = v19;
      *(_QWORD *)(v21 + 8) = v20;
      *(_BYTE *)(v21 + 16) = 0;
      swift_willThrow();
    }
  }
}

uint64_t TrialDecoderImpl.KeyedContainer.decodeInt64(forKey:)()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  Swift::String v8;
  uint64_t v9;

  v1 = (void *)v0[2];
  v2 = dispatch thunk of CodingKey.stringValue.getter();
  v3 = (void *)MEMORY[0x24959E374](v2);
  swift_bridgeObjectRelease();
  v4 = (void *)MEMORY[0x24959E374](v0[3], v0[4]);
  v5 = objc_msgSend(v1, sel_levelForFactor_withNamespaceName_, v3, v4);

  if (v5)
  {
    v6 = objc_msgSend(v5, sel_longValue);

    return (uint64_t)v6;
  }
  else
  {
    _StringGuts.grow(_:)(32);
    v8._object = (void *)0x80000002489190E0;
    v8._countAndFlagsBits = 0xD00000000000001ELL;
    String.append(_:)(v8);
    DefaultStringInterpolation.appendInterpolation<A>(_:)();
    lazy protocol witness table accessor for type TrialDecodingError and conformance TrialDecodingError();
    swift_allocError();
    *(_QWORD *)v9 = 0;
    *(_QWORD *)(v9 + 8) = 0xE000000000000000;
    *(_BYTE *)(v9 + 16) = 0;
    return swift_willThrow();
  }
}

unint64_t TrialDecoderImpl.KeyedContainer.decode(_:forKey:)()
{
  unint64_t v0;
  uint64_t v1;
  unint64_t v2;
  Swift::String v3;
  Swift::String v4;
  Swift::String v5;
  Swift::String v6;
  uint64_t v7;

  v2 = TrialDecoderImpl.KeyedContainer.decodeInt64(forKey:)();
  if (!v1)
  {
    v0 = v2;
    if (v2 >= 0xFF)
    {
      _StringGuts.grow(_:)(64);
      v3._object = (void *)0x8000000248919080;
      v3._countAndFlagsBits = 0xD000000000000011;
      String.append(_:)(v3);
      DefaultStringInterpolation.appendInterpolation<A>(_:)();
      v4._countAndFlagsBits = 0xD000000000000017;
      v4._object = (void *)0x8000000248919140;
      String.append(_:)(v4);
      v5._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v5);
      swift_bridgeObjectRelease();
      v6._countAndFlagsBits = 0xD000000000000014;
      v6._object = (void *)0x80000002489190C0;
      String.append(_:)(v6);
      v0 = 0;
      lazy protocol witness table accessor for type TrialDecodingError and conformance TrialDecodingError();
      swift_allocError();
      *(_QWORD *)v7 = 0;
      *(_QWORD *)(v7 + 8) = 0xE000000000000000;
      *(_BYTE *)(v7 + 16) = 0;
      swift_willThrow();
    }
  }
  return v0;
}

{
  unint64_t v0;
  uint64_t v1;
  unint64_t v2;
  Swift::String v3;
  Swift::String v4;
  Swift::String v5;
  Swift::String v6;
  uint64_t v7;

  v2 = TrialDecoderImpl.KeyedContainer.decodeInt64(forKey:)();
  if (!v1)
  {
    v0 = v2;
    if (v2 >= 0xFFFF)
    {
      _StringGuts.grow(_:)(65);
      v3._object = (void *)0x8000000248919080;
      v3._countAndFlagsBits = 0xD000000000000011;
      String.append(_:)(v3);
      DefaultStringInterpolation.appendInterpolation<A>(_:)();
      v4._countAndFlagsBits = 0xD000000000000018;
      v4._object = (void *)0x8000000248919120;
      String.append(_:)(v4);
      v5._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v5);
      swift_bridgeObjectRelease();
      v6._countAndFlagsBits = 0xD000000000000014;
      v6._object = (void *)0x80000002489190C0;
      String.append(_:)(v6);
      v0 = 0;
      lazy protocol witness table accessor for type TrialDecodingError and conformance TrialDecodingError();
      swift_allocError();
      *(_QWORD *)v7 = 0;
      *(_QWORD *)(v7 + 8) = 0xE000000000000000;
      *(_BYTE *)(v7 + 16) = 0;
      swift_willThrow();
    }
  }
  return v0;
}

{
  unint64_t v0;
  uint64_t v1;
  unint64_t v2;
  Swift::String v3;
  Swift::String v4;
  Swift::String v5;
  Swift::String v6;
  uint64_t v7;

  v2 = TrialDecoderImpl.KeyedContainer.decodeInt64(forKey:)();
  if (!v1)
  {
    v0 = v2;
    if (v2 >= 0xFFFFFFFF)
    {
      _StringGuts.grow(_:)(65);
      v3._object = (void *)0x8000000248919080;
      v3._countAndFlagsBits = 0xD000000000000011;
      String.append(_:)(v3);
      DefaultStringInterpolation.appendInterpolation<A>(_:)();
      v4._countAndFlagsBits = 0xD000000000000018;
      v4._object = (void *)0x8000000248919100;
      String.append(_:)(v4);
      v5._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v5);
      swift_bridgeObjectRelease();
      v6._countAndFlagsBits = 0xD000000000000014;
      v6._object = (void *)0x80000002489190C0;
      String.append(_:)(v6);
      v0 = 0;
      lazy protocol witness table accessor for type TrialDecodingError and conformance TrialDecodingError();
      swift_allocError();
      *(_QWORD *)v7 = 0;
      *(_QWORD *)(v7 + 8) = 0xE000000000000000;
      *(_BYTE *)(v7 + 16) = 0;
      swift_willThrow();
    }
  }
  return v0;
}

void TrialDecoderImpl.KeyedContainer.decodeURL(forKey:)(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  unsigned int v38;
  NSObject *v39;
  os_log_type_t v40;
  _BOOL4 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  Swift::String v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  char **v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  void *v56;
  unsigned int v57;
  id v58;
  void *v59;
  unsigned int *v60;
  uint64_t v61;
  uint64_t v62;
  _BYTE *v63;
  uint64_t v64;
  Swift::String v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  Swift::String v76;
  Swift::String v77;
  unint64_t v78;
  const char *v79;
  Swift::String v80;
  Swift::String v81;
  Swift::String v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  Swift::String v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  Swift::String v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  Swift::String v94;
  id v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  Swift::String v100;
  Swift::String v101;
  unint64_t v102;
  Swift::String v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;
  _BYTE v107[4];
  _BOOL4 v108;
  uint64_t v109;
  unsigned int v110;
  _BYTE *v111;
  _BYTE *v112;
  _BYTE *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  _BYTE *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  BOOL v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  unint64_t v128;
  uint64_t v129;

  v4 = v2;
  v116 = a2;
  v129 = *MEMORY[0x24BDAC8D0];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v6, v7, v8);
  v120 = &v107[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8](v10, v11, v12);
  v113 = &v107[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = type metadata accessor for URL.DirectoryHint();
  v114 = *(_QWORD *)(v14 - 8);
  v115 = v14;
  v17 = MEMORY[0x24BDAC7A8](v14, v15, v16);
  v111 = &v107[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v17, v19, v20);
  v112 = &v107[-v21];
  v123 = type metadata accessor for Logger();
  v22 = *(_QWORD *)(v123 - 8);
  MEMORY[0x24BDAC7A8](v123, v23, v24);
  v26 = &v107[-((v25 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v27 = *(_QWORD *)(a1 + 16);
  v28 = *(_QWORD *)(a1 + 24);
  v121 = a1;
  v117 = v28;
  v118 = v27;
  v29 = dispatch thunk of CodingKey.stringValue.getter();
  v31 = v30;
  v32 = *(void **)(v2 + 16);
  v33 = (void *)MEMORY[0x24959E374]();
  v34 = *(_QWORD *)(v4 + 24);
  v35 = *(_QWORD *)(v4 + 32);
  v119 = v4;
  v36 = (void *)MEMORY[0x24959E374](v34, v35);
  v37 = objc_msgSend(v32, sel_levelForFactor_withNamespaceName_, v33, v36);

  if (!v37)
  {
    v127 = 0;
    v128 = 0xE000000000000000;
    _StringGuts.grow(_:)(44);
    swift_bridgeObjectRelease();
    v127 = 0xD00000000000002ALL;
    v128 = 0x8000000248918F70;
    v46._countAndFlagsBits = v29;
    v46._object = v31;
    String.append(_:)(v46);
    swift_bridgeObjectRelease();
    v47 = v127;
    v48 = v128;
    lazy protocol witness table accessor for type TrialDecodingError and conformance TrialDecodingError();
    swift_allocError();
    *(_QWORD *)v49 = v47;
    *(_QWORD *)(v49 + 8) = v48;
    *(_BYTE *)(v49 + 16) = 0;
    swift_willThrow();
    return;
  }
  v122 = v29;
  v38 = objc_msgSend(v37, sel_levelOneOfCase);
  Logger.init()();
  swift_bridgeObjectRetain_n();
  v39 = Logger.logObject.getter();
  v40 = static os_log_type_t.info.getter();
  v41 = os_log_type_enabled(v39, v40);
  v109 = v3;
  if (v41)
  {
    v108 = v38 == 100;
    v42 = swift_slowAlloc();
    v110 = v38;
    v43 = v42;
    v44 = swift_slowAlloc();
    v127 = v44;
    *(_DWORD *)v43 = 136315394;
    swift_bridgeObjectRetain();
    v125 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v122, (unint64_t)v31, &v127);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v43 + 12) = 1024;
    LODWORD(v125) = v108;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_2488EF000, v39, v40, "Factor %s is interpreted as file(%{BOOL}d)", (uint8_t *)v43, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x24959F0A0](v44, -1, -1);
    v45 = v43;
    v38 = v110;
    MEMORY[0x24959F0A0](v45, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(_BYTE *, uint64_t))(v22 + 8))(v26, v123);
  v50 = &selRef_directoryValue;
  if (v38 == 100)
    v50 = &selRef_fileValue;
  v51 = objc_msgSend(v37, *v50);
  if (!v51)
  {
    v127 = 0;
    v128 = 0xE000000000000000;
    _StringGuts.grow(_:)(30);
    swift_bridgeObjectRelease();
    v127 = 0xD00000000000001CLL;
    v128 = 0x8000000248918FA0;
    v65._countAndFlagsBits = v122;
    v65._object = v31;
    String.append(_:)(v65);
    swift_bridgeObjectRelease();
    v66 = v127;
    v67 = v128;
    lazy protocol witness table accessor for type TrialDecodingError and conformance TrialDecodingError();
    swift_allocError();
    *(_QWORD *)v68 = v66;
    *(_QWORD *)(v68 + 8) = v67;
    *(_BYTE *)(v68 + 16) = 0;
    swift_willThrow();

    return;
  }
  v52 = v51;
  if ((objc_msgSend(v52, sel_hasAsset) & 1) == 0 && !objc_msgSend(v52, sel_isOnDemand))
  {
    v127 = 0;
    v128 = 0xE000000000000000;
    _StringGuts.grow(_:)(101);
    v100._object = (void *)0x8000000248918FA0;
    v100._countAndFlagsBits = 0xD00000000000001CLL;
    String.append(_:)(v100);
    v101._countAndFlagsBits = v122;
    v101._object = v31;
    String.append(_:)(v101);
    swift_bridgeObjectRelease();
    v78 = 0xD000000000000047;
    v79 = " because it isn't downloadable on-demand and also isn't found on device";
    goto LABEL_42;
  }
  if (!objc_msgSend(v52, sel_hasPath))
  {
    v69 = type metadata accessor for TaskPriority();
    v70 = (uint64_t)v120;
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v69 - 8) + 56))(v120, 1, 1, v69);
    v71 = v121;
    v72 = *(_QWORD *)(v121 - 8);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v72 + 16))(&v127, v119, v121);
    v73 = (_QWORD *)swift_allocObject();
    v73[2] = 0;
    v73[3] = 0;
    v74 = v117;
    v73[4] = v118;
    v73[5] = v74;
    (*(void (**)(_QWORD *, uint64_t *, uint64_t))(v72 + 32))(v73 + 6, &v127, v71);
    v75 = v122;
    v73[13] = v122;
    v73[14] = v31;
    swift_bridgeObjectRetain();
    _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5(v70, (uint64_t)&async function pointer to partial apply for closure #1 in TrialDecoderImpl.KeyedContainer.decodeURL(forKey:), (uint64_t)v73);
    swift_release();
    v127 = 0;
    v128 = 0xE000000000000000;
    _StringGuts.grow(_:)(106);
    v76._object = (void *)0x8000000248918FA0;
    v76._countAndFlagsBits = 0xD00000000000001CLL;
    String.append(_:)(v76);
    v77._countAndFlagsBits = v75;
    v77._object = v31;
    String.append(_:)(v77);
    swift_bridgeObjectRelease();
    v78 = 0xD00000000000004CLL;
    v79 = " because assets aren't available on device, kicking download off if eligible";
LABEL_42:
    v102 = (unint64_t)(v79 - 32) | 0x8000000000000000;
    String.append(_:)(*(Swift::String *)&v78);
LABEL_45:
    v104 = v127;
    v105 = v128;
    lazy protocol witness table accessor for type TrialDecodingError and conformance TrialDecodingError();
    swift_allocError();
    *(_QWORD *)v106 = v104;
    *(_QWORD *)(v106 + 8) = v105;
    *(_BYTE *)(v106 + 16) = 0;
    swift_willThrow();

    return;
  }
  v53 = v31;
  v124 = v38 != 100;
  v54 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v55 = objc_msgSend(v52, sel_path);
  if (!v55)
  {
    __break(1u);
    return;
  }
  v56 = v55;
  v110 = v38;
  v57 = objc_msgSend(v54, sel_fileExistsAtPath_isDirectory_, v55, &v124);

  if (!v57
    || (((v38 != 100) ^ v124) & 1) != 0
    || (v58 = objc_msgSend(v52, sel_path)) == 0)
  {
    v127 = 0;
    v128 = 0xE000000000000000;
    _StringGuts.grow(_:)(83);
    v80._object = (void *)0x8000000248918FA0;
    v80._countAndFlagsBits = 0xD00000000000001CLL;
    String.append(_:)(v80);
    v81._countAndFlagsBits = v122;
    v81._object = v53;
    String.append(_:)(v81);
    swift_bridgeObjectRelease();
    v82._countAndFlagsBits = 0xD000000000000014;
    v82._object = (void *)0x8000000248919060;
    String.append(_:)(v82);
    if (v57)
      v83 = 1702195828;
    else
      v83 = 0x65736C6166;
    if (v57)
      v84 = 0xE400000000000000;
    else
      v84 = 0xE500000000000000;
    v85 = v84;
    String.append(_:)(*(Swift::String *)&v83);
    swift_bridgeObjectRelease();
    v86._countAndFlagsBits = 0x6365726944736920;
    v86._object = (void *)0xEE00282079726F74;
    String.append(_:)(v86);
    if (v124)
      v87 = 1702195828;
    else
      v87 = 0x65736C6166;
    if (v124)
      v88 = 0xE400000000000000;
    else
      v88 = 0xE500000000000000;
    v89 = v88;
    String.append(_:)(*(Swift::String *)&v87);
    swift_bridgeObjectRelease();
    v90._countAndFlagsBits = 540877088;
    v90._object = (void *)0xE400000000000000;
    String.append(_:)(v90);
    if (v110 == 100)
      v91 = 0x65736C6166;
    else
      v91 = 1702195828;
    if (v110 == 100)
      v92 = 0xE500000000000000;
    else
      v92 = 0xE400000000000000;
    v93 = v92;
    String.append(_:)(*(Swift::String *)&v91);
    swift_bridgeObjectRelease();
    v94._countAndFlagsBits = 0x20687461702029;
    v94._object = (void *)0xE700000000000000;
    String.append(_:)(v94);
    v95 = objc_msgSend(v52, sel_path);
    if (v95)
    {
      v96 = v95;
      v97 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v99 = v98;

    }
    else
    {
      v97 = 0;
      v99 = 0;
    }
    v125 = v97;
    v126 = v99;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
    v103._countAndFlagsBits = String.init<A>(describing:)();
    String.append(_:)(v103);
    swift_bridgeObjectRelease();
    goto LABEL_45;
  }
  v59 = v58;
  swift_bridgeObjectRelease();
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  v60 = (unsigned int *)MEMORY[0x24BDCD790];
  v62 = v114;
  v61 = v115;
  if (v110 == 100)
    v60 = (unsigned int *)MEMORY[0x24BDCD798];
  v63 = v112;
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v114 + 104))(v112, *v60, v115);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v62 + 16))(v111, v63, v61);
  v64 = type metadata accessor for URL();
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v64 - 8) + 56))(v113, 1, 1, v64);
  URL.init(filePath:directoryHint:relativeTo:)();

  (*(void (**)(_BYTE *, uint64_t))(v62 + 8))(v63, v61);
}

uint64_t closure #1 in TrialDecoderImpl.KeyedContainer.decodeURL(forKey:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[4] = a5;
  v6[5] = a6;
  v6[3] = a4;
  v7 = type metadata accessor for Logger();
  v6[6] = v7;
  v6[7] = *(_QWORD *)(v7 - 8);
  v6[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t closure #1 in TrialDecoderImpl.KeyedContainer.decodeURL(forKey:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t ObjectType;
  _QWORD *v4;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(_QWORD, _QWORD, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;

  v1 = MEMORY[0x24959F160](*(_QWORD *)(v0 + 24) + 40);
  *(_QWORD *)(v0 + 72) = v1;
  if (v1)
  {
    v2 = *(_QWORD *)(*(_QWORD *)(v0 + 24) + 48);
    ObjectType = swift_getObjectType();
    v17 = (uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t))(**(int **)(v2 + 8) + *(_QWORD *)(v2 + 8));
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 80) = v4;
    *v4 = v0;
    v4[1] = closure #1 in TrialDecoderImpl.KeyedContainer.decodeURL(forKey:);
    return v17(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), ObjectType, v2);
  }
  else
  {
    Logger.init()();
    swift_bridgeObjectRetain_n();
    v6 = Logger.logObject.getter();
    v7 = static os_log_type_t.error.getter();
    v8 = os_log_type_enabled(v6, v7);
    v10 = *(_QWORD *)(v0 + 56);
    v9 = *(_QWORD *)(v0 + 64);
    v12 = *(_QWORD *)(v0 + 40);
    v11 = *(_QWORD *)(v0 + 48);
    if (v8)
    {
      v13 = *(_QWORD *)(v0 + 32);
      v18 = *(_QWORD *)(v0 + 48);
      v14 = (uint8_t *)swift_slowAlloc();
      v16 = v9;
      v15 = swift_slowAlloc();
      v19 = v15;
      *(_DWORD *)v14 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 16) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v12, &v19);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2488EF000, v6, v7, "Factor downloader is nil unable to request download for factor %s", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24959F0A0](v15, -1, -1);
      MEMORY[0x24959F0A0](v14, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v16, v18);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    }
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

{
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void TrialDecoderImpl.KeyedContainer.decode<A>(_:forKey:)(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  Swift::String v18;
  Swift::String v19;
  Swift::String v20;
  Swift::String v21;
  uint64_t v22;
  uint64_t v23;
  Swift::String v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  _QWORD v28[2];
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  _BYTE v32[8];
  uint64_t v33;
  uint64_t v34;

  v29 = a3;
  v5 = v4;
  v9 = type metadata accessor for URL();
  MEMORY[0x24BDAC7A8](v9, v10, v11);
  v13 = (char *)v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(a2 - 8);
  v15 = v5;
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v14 + 16))(v32, v5, a2);
  if (v9 != a1)
  {
    (*(void (**)(_BYTE *, uint64_t))(v14 + 8))(v32, a2);
LABEL_4:
    v30 = 0;
    v31 = 0xE000000000000000;
    _StringGuts.grow(_:)(45);
    v18._object = (void *)0x8000000248918F50;
    v18._countAndFlagsBits = 0xD000000000000011;
    String.append(_:)(v18);
    v34 = v29;
    swift_getMetatypeMetadata();
    v19._countAndFlagsBits = String.init<A>(reflecting:)();
    String.append(_:)(v19);
    swift_bridgeObjectRelease();
    v20._countAndFlagsBits = 0x656B20726F66203ELL;
    v20._object = (void *)0xEA00000000002079;
    String.append(_:)(v20);
    DefaultStringInterpolation.appendInterpolation<A>(_:)();
    v21._countAndFlagsBits = 0x50676E69646F6320;
    v21._object = (void *)0xEC00000020687461;
    String.append(_:)(v21);
    v22 = *(_QWORD *)(v15 + 8);
    swift_bridgeObjectRetain();
    v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingKey);
    v24._countAndFlagsBits = MEMORY[0x24959E4B8](v22, v23);
    String.append(_:)(v24);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v25 = v30;
    v26 = v31;
    lazy protocol witness table accessor for type TrialDecodingError and conformance TrialDecodingError();
    swift_allocError();
    *(_QWORD *)v27 = v25;
    *(_QWORD *)(v27 + 8) = v26;
    *(_BYTE *)(v27 + 16) = 0;
    swift_willThrow();
    return;
  }
  v16 = v28[1];
  v28[0] = a4;
  v17 = *(_QWORD *)(v33 + 16);
  (*(void (**)(_BYTE *, uint64_t))(v14 + 8))(v32, a2);
  if (v17)
    goto LABEL_4;
  TrialDecoderImpl.KeyedContainer.decodeURL(forKey:)(a2, (uint64_t)v13);
  if (!v16)
    swift_dynamicCast();
}

uint64_t TrialDecoderImpl.KeyedContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  uint64_t v0;

  lazy protocol witness table accessor for type TrialDecodingError and conformance TrialDecodingError();
  swift_allocError();
  *(_QWORD *)v0 = 0xD000000000000019;
  *(_QWORD *)(v0 + 8) = 0x8000000248918F30;
  *(_BYTE *)(v0 + 16) = 0;
  return swift_willThrow();
}

uint64_t TrialDecoderImpl.KeyedContainer.superDecoder()()
{
  uint64_t v0;

  lazy protocol witness table accessor for type TrialDecodingError and conformance TrialDecodingError();
  swift_allocError();
  *(_QWORD *)v0 = 0xD000000000000016;
  *(_QWORD *)(v0 + 8) = 0x8000000248918EE0;
  *(_BYTE *)(v0 + 16) = 0;
  return swift_willThrow();
}

uint64_t TrialDecoderImpl.KeyedContainer.nestedUnkeyedContainer(forKey:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;

  lazy protocol witness table accessor for type TrialDecodingError and conformance TrialDecodingError();
  swift_allocError();
  *(_QWORD *)v6 = a3;
  *(_QWORD *)(v6 + 8) = a4;
  *(_BYTE *)(v6 + 16) = 0;
  return swift_willThrow();
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.codingPath.getter in conformance TrialDecoderImpl.KeyedContainer<A>()
{
  return swift_bridgeObjectRetain();
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.allKeys.getter in conformance TrialDecoderImpl.KeyedContainer<A>()
{
  return swift_bridgeObjectRetain();
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.decodeNil(forKey:) in conformance TrialDecoderImpl.KeyedContainer<A>()
{
  return 0;
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.decode(_:forKey:) in conformance TrialDecoderImpl.KeyedContainer<A>()
{
  return TrialDecoderImpl.KeyedContainer.decode(_:forKey:)() & 1;
}

{
  return TrialDecoderImpl.KeyedContainer.decode(_:forKey:)();
}

{
  return TrialDecoderImpl.KeyedContainer.decode(_:forKey:)();
}

{
  return TrialDecoderImpl.KeyedContainer.decode(_:forKey:)();
}

{
  return TrialDecoderImpl.KeyedContainer.decode(_:forKey:)();
}

{
  return TrialDecoderImpl.KeyedContainer.decode(_:forKey:)();
}

{
  return TrialDecoderImpl.KeyedContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainerProtocol.decode(_:forKey:)();
}

{
  return TrialDecoderImpl.KeyedContainer.decode(_:forKey:)();
}

{
  return TrialDecoderImpl.KeyedContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainerProtocol.decode(_:forKey:)();
}

void protocol witness for KeyedDecodingContainerProtocol.decode(_:forKey:) in conformance TrialDecoderImpl.KeyedContainer<A>()
{
  TrialDecoderImpl.KeyedContainer.decode(_:forKey:)();
}

void protocol witness for KeyedDecodingContainerProtocol.decode(_:forKey:) in conformance TrialDecoderImpl.KeyedContainer<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  TrialDecoderImpl.KeyedContainer.decode(_:forKey:)(a1, a2, a3);
}

unint64_t protocol witness for KeyedDecodingContainerProtocol.decode(_:forKey:) in conformance TrialDecoderImpl.KeyedContainer<A>()
{
  return TrialDecoderImpl.KeyedContainer.decode(_:forKey:)();
}

{
  return TrialDecoderImpl.KeyedContainer.decode(_:forKey:)();
}

{
  return TrialDecoderImpl.KeyedContainer.decode(_:forKey:)();
}

void protocol witness for KeyedDecodingContainerProtocol.decode<A>(_:forKey:) in conformance TrialDecoderImpl.KeyedContainer<A>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  TrialDecoderImpl.KeyedContainer.decode<A>(_:forKey:)(a1, a3, a2, a4);
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:) in conformance TrialDecoderImpl.KeyedContainer<A>()
{
  return KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:)();
}

{
  return KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:)();
}

{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:)();
  if (v0)
    return v2;
  return result;
}

{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:)();
  if (v0)
    return v2;
  return result;
}

{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:)();
  if (v0)
    return v2;
  return result;
}

{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:)();
  if (v0)
    return v2;
  return result;
}

{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:)();
  if (v0)
    return v2;
  return result;
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:) in conformance TrialDecoderImpl.KeyedContainer<A>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:) in conformance TrialDecoderImpl.KeyedContainer<A>(a1, a2, a3, MEMORY[0x24BEE3C00]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:) in conformance TrialDecoderImpl.KeyedContainer<A>(a1, a2, a3, MEMORY[0x24BEE3C20]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:) in conformance TrialDecoderImpl.KeyedContainer<A>(a1, a2, a3, MEMORY[0x24BEE3C28]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:) in conformance TrialDecoderImpl.KeyedContainer<A>(a1, a2, a3, MEMORY[0x24BEE3C30]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:) in conformance TrialDecoderImpl.KeyedContainer<A>(a1, a2, a3, MEMORY[0x24BEE3C48]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:) in conformance TrialDecoderImpl.KeyedContainer<A>(a1, a2, a3, MEMORY[0x24BEE3C40]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:) in conformance TrialDecoderImpl.KeyedContainer<A>(a1, a2, a3, MEMORY[0x24BEE3C50]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:) in conformance TrialDecoderImpl.KeyedContainer<A>(a1, a2, a3, MEMORY[0x24BEE3C58]);
}

{
  return protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:) in conformance TrialDecoderImpl.KeyedContainer<A>(a1, a2, a3, MEMORY[0x24BEE3C68]);
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:) in conformance TrialDecoderImpl.KeyedContainer<A>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4() & 0x1FF;
}

{
  return a4() & 0x1FFFF;
}

{
  unint64_t v4;

  v4 = a4();
  return v4 | ((HIDWORD(v4) & 1) << 32);
}

{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  result = a4();
  if (v4)
    return v6;
  return result;
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.decodeIfPresent<A>(_:forKey:) in conformance TrialDecoderImpl.KeyedContainer<A>()
{
  return KeyedDecodingContainerProtocol.decodeIfPresent<A>(_:forKey:)();
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.nestedContainer<A>(keyedBy:forKey:) in conformance TrialDecoderImpl.KeyedContainer<A>()
{
  return TrialDecoderImpl.KeyedContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.nestedUnkeyedContainer(forKey:) in conformance TrialDecoderImpl.KeyedContainer<A>(uint64_t a1, uint64_t a2)
{
  return TrialDecoderImpl.KeyedContainer.nestedUnkeyedContainer(forKey:)(a1, a2, 0xD000000000000020, 0x8000000248918F00);
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.superDecoder() in conformance TrialDecoderImpl.KeyedContainer<A>()
{
  return TrialDecoderImpl.KeyedContainer.superDecoder()();
}

uint64_t protocol witness for KeyedDecodingContainerProtocol.superDecoder(forKey:) in conformance TrialDecoderImpl.KeyedContainer<A>(uint64_t a1, uint64_t a2)
{
  return TrialDecoderImpl.KeyedContainer.nestedUnkeyedContainer(forKey:)(a1, a2, 0xD00000000000001FLL, 0x8000000248918EC0);
}

uint64_t TrialDecoderImpl.UnkeyedContainer.nestedContainer<A>(keyedBy:)()
{
  uint64_t *v0;
  Swift::String v1;
  uint64_t v2;
  uint64_t v3;
  Swift::String v4;
  uint64_t v5;

  _StringGuts.grow(_:)(101);
  v1._object = (void *)0x8000000248918880;
  v1._countAndFlagsBits = 0xD000000000000063;
  String.append(_:)(v1);
  v2 = *v0;
  swift_bridgeObjectRetain();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingKey);
  v4._countAndFlagsBits = MEMORY[0x24959E4B8](v2, v3);
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  lazy protocol witness table accessor for type TrialDecodingError and conformance TrialDecodingError();
  swift_allocError();
  *(_QWORD *)v5 = 0;
  *(_QWORD *)(v5 + 8) = 0xE000000000000000;
  *(_BYTE *)(v5 + 16) = 1;
  return swift_willThrow();
}

uint64_t TrialDecoderImpl.UnkeyedContainer.nestedUnkeyedContainer()(Swift::Int a1, uint64_t a2, void *a3)
{
  uint64_t *v3;
  Swift::String v6;
  uint64_t v7;
  uint64_t v8;
  Swift::String v9;
  uint64_t v10;

  _StringGuts.grow(_:)(a1);
  v6._countAndFlagsBits = a2;
  v6._object = a3;
  String.append(_:)(v6);
  v7 = *v3;
  swift_bridgeObjectRetain();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingKey);
  v9._countAndFlagsBits = MEMORY[0x24959E4B8](v7, v8);
  String.append(_:)(v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  lazy protocol witness table accessor for type TrialDecodingError and conformance TrialDecodingError();
  swift_allocError();
  *(_QWORD *)v10 = 0;
  *(_QWORD *)(v10 + 8) = 0xE000000000000000;
  *(_BYTE *)(v10 + 16) = 1;
  return swift_willThrow();
}

uint64_t TrialDecoderImpl.UnkeyedContainer.decode<A>(_:)()
{
  uint64_t *v0;
  Swift::String v1;
  Swift::String v2;
  Swift::String v3;
  uint64_t v4;
  uint64_t v5;
  Swift::String v6;
  uint64_t v7;

  _StringGuts.grow(_:)(87);
  v1._object = (void *)0x80000002489188F0;
  v1._countAndFlagsBits = 0xD000000000000023;
  String.append(_:)(v1);
  swift_getMetatypeMetadata();
  v2._countAndFlagsBits = String.init<A>(reflecting:)();
  String.append(_:)(v2);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = 0xD000000000000030;
  v3._object = (void *)0x8000000248918220;
  String.append(_:)(v3);
  v4 = *v0;
  swift_bridgeObjectRetain();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingKey);
  v6._countAndFlagsBits = MEMORY[0x24959E4B8](v4, v5);
  String.append(_:)(v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  lazy protocol witness table accessor for type TrialDecodingError and conformance TrialDecodingError();
  swift_allocError();
  *(_QWORD *)v7 = 0;
  *(_QWORD *)(v7 + 8) = 0xE000000000000000;
  *(_BYTE *)(v7 + 16) = 1;
  return swift_willThrow();
}

uint64_t protocol witness for UnkeyedDecodingContainer.count.getter in conformance TrialDecoderImpl.UnkeyedContainer()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t protocol witness for UnkeyedDecodingContainer.isAtEnd.getter in conformance TrialDecoderImpl.UnkeyedContainer()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 17);
}

uint64_t protocol witness for UnkeyedDecodingContainer.currentIndex.getter in conformance TrialDecoderImpl.UnkeyedContainer()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t protocol witness for UnkeyedDecodingContainer.decodeNil() in conformance TrialDecoderImpl.UnkeyedContainer()
{
  return TrialDecoderImpl.UnkeyedContainer.decodeNil()(95, 0xD00000000000005DLL, (void *)0x8000000248918E60) & 1;
}

uint64_t protocol witness for UnkeyedDecodingContainer.decode(_:) in conformance TrialDecoderImpl.UnkeyedContainer()
{
  return TrialDecoderImpl.UnkeyedContainer.decodeNil()(90, 0xD000000000000058, (void *)0x8000000248918E00) & 1;
}

{
  return specialized TrialDecoderImpl.UnkeyedContainer.decode(_:)();
}

{
  return specialized TrialDecoderImpl.UnkeyedContainer.decode(_:)();
}

{
  return specialized TrialDecoderImpl.UnkeyedContainer.decode(_:)();
}

{
  return TrialDecoderImpl.UnkeyedContainer.nestedUnkeyedContainer()(89, 0xD000000000000057, (void *)0x8000000248918C80);
}

{
  return TrialDecoderImpl.UnkeyedContainer.nestedUnkeyedContainer()(90, 0xD000000000000058, (void *)0x8000000248918C20);
}

{
  return TrialDecoderImpl.UnkeyedContainer.nestedUnkeyedContainer()(91, 0xD000000000000059, (void *)0x8000000248918BC0);
}

{
  return TrialDecoderImpl.UnkeyedContainer.nestedUnkeyedContainer()(91, 0xD000000000000059, (void *)0x8000000248918B60);
}

{
  return TrialDecoderImpl.UnkeyedContainer.nestedUnkeyedContainer()(91, 0xD000000000000059, (void *)0x8000000248918B00);
}

{
  return UnkeyedDecodingContainer.decode(_:)();
}

{
  return TrialDecoderImpl.UnkeyedContainer.nestedUnkeyedContainer()(90, 0xD000000000000058, (void *)0x8000000248918AA0);
}

{
  return TrialDecoderImpl.UnkeyedContainer.nestedUnkeyedContainer()(91, 0xD000000000000059, (void *)0x8000000248918A40);
}

{
  return TrialDecoderImpl.UnkeyedContainer.nestedUnkeyedContainer()(92, 0xD00000000000005ALL, (void *)0x80000002489189E0);
}

{
  return TrialDecoderImpl.UnkeyedContainer.nestedUnkeyedContainer()(92, 0xD00000000000005ALL, (void *)0x8000000248918980);
}

{
  return TrialDecoderImpl.UnkeyedContainer.nestedUnkeyedContainer()(92, 0xD00000000000005ALL, (void *)0x8000000248918920);
}

{
  return UnkeyedDecodingContainer.decode(_:)();
}

uint64_t protocol witness for UnkeyedDecodingContainer.decode<A>(_:) in conformance TrialDecoderImpl.UnkeyedContainer()
{
  return TrialDecoderImpl.UnkeyedContainer.decode<A>(_:)();
}

uint64_t protocol witness for UnkeyedDecodingContainer.decodeIfPresent(_:) in conformance TrialDecoderImpl.UnkeyedContainer()
{
  return UnkeyedDecodingContainer.decodeIfPresent(_:)();
}

{
  return UnkeyedDecodingContainer.decodeIfPresent(_:)();
}

{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = UnkeyedDecodingContainer.decodeIfPresent(_:)();
  if (v0)
    return v2;
  return result;
}

{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = UnkeyedDecodingContainer.decodeIfPresent(_:)();
  if (v0)
    return v2;
  return result;
}

{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = UnkeyedDecodingContainer.decodeIfPresent(_:)();
  if (v0)
    return v2;
  return result;
}

{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = UnkeyedDecodingContainer.decodeIfPresent(_:)();
  if (v0)
    return v2;
  return result;
}

{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = UnkeyedDecodingContainer.decodeIfPresent(_:)();
  if (v0)
    return v2;
  return result;
}

uint64_t protocol witness for UnkeyedDecodingContainer.decodeIfPresent(_:) in conformance TrialDecoderImpl.UnkeyedContainer(uint64_t a1, uint64_t a2)
{
  return protocol witness for UnkeyedDecodingContainer.decodeIfPresent(_:) in conformance TrialDecoderImpl.UnkeyedContainer(a1, a2, MEMORY[0x24BEE3690]);
}

{
  return protocol witness for UnkeyedDecodingContainer.decodeIfPresent(_:) in conformance TrialDecoderImpl.UnkeyedContainer(a1, a2, MEMORY[0x24BEE36B0]);
}

{
  return protocol witness for UnkeyedDecodingContainer.decodeIfPresent(_:) in conformance TrialDecoderImpl.UnkeyedContainer(a1, a2, MEMORY[0x24BEE36B8]);
}

{
  return protocol witness for UnkeyedDecodingContainer.decodeIfPresent(_:) in conformance TrialDecoderImpl.UnkeyedContainer(a1, a2, MEMORY[0x24BEE36C0]);
}

{
  return protocol witness for UnkeyedDecodingContainer.decodeIfPresent(_:) in conformance TrialDecoderImpl.UnkeyedContainer(a1, a2, MEMORY[0x24BEE36D8]);
}

{
  return protocol witness for UnkeyedDecodingContainer.decodeIfPresent(_:) in conformance TrialDecoderImpl.UnkeyedContainer(a1, a2, MEMORY[0x24BEE36D0]);
}

{
  return protocol witness for UnkeyedDecodingContainer.decodeIfPresent(_:) in conformance TrialDecoderImpl.UnkeyedContainer(a1, a2, MEMORY[0x24BEE36E0]);
}

{
  return protocol witness for UnkeyedDecodingContainer.decodeIfPresent(_:) in conformance TrialDecoderImpl.UnkeyedContainer(a1, a2, MEMORY[0x24BEE36E8]);
}

{
  return protocol witness for UnkeyedDecodingContainer.decodeIfPresent(_:) in conformance TrialDecoderImpl.UnkeyedContainer(a1, a2, MEMORY[0x24BEE36F8]);
}

uint64_t protocol witness for UnkeyedDecodingContainer.decodeIfPresent(_:) in conformance TrialDecoderImpl.UnkeyedContainer(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3() & 0x1FF;
}

{
  return a3() & 0x1FFFF;
}

{
  unint64_t v3;

  v3 = a3();
  return v3 | ((HIDWORD(v3) & 1) << 32);
}

{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  result = a3();
  if (v3)
    return v5;
  return result;
}

uint64_t protocol witness for UnkeyedDecodingContainer.decodeIfPresent<A>(_:) in conformance TrialDecoderImpl.UnkeyedContainer()
{
  return UnkeyedDecodingContainer.decodeIfPresent<A>(_:)();
}

uint64_t protocol witness for UnkeyedDecodingContainer.nestedContainer<A>(keyedBy:) in conformance TrialDecoderImpl.UnkeyedContainer()
{
  return TrialDecoderImpl.UnkeyedContainer.nestedContainer<A>(keyedBy:)();
}

uint64_t protocol witness for UnkeyedDecodingContainer.nestedUnkeyedContainer() in conformance TrialDecoderImpl.UnkeyedContainer()
{
  return TrialDecoderImpl.UnkeyedContainer.nestedUnkeyedContainer()(108, 0xD00000000000006ALL, (void *)0x8000000248918810);
}

uint64_t protocol witness for UnkeyedDecodingContainer.superDecoder() in conformance TrialDecoderImpl.UnkeyedContainer()
{
  return TrialDecoderImpl.UnkeyedContainer.nestedUnkeyedContainer()(98, 0xD000000000000060, (void *)0x80000002489187A0);
}

uint64_t TrialDecoderImpl.SingleValueContainer.decode<A>(_:)(uint64_t a1, uint64_t a2)
{
  Swift::String v3;
  Swift::String v4;
  Swift::String v5;
  uint64_t v6;
  Swift::String v7;
  uint64_t v8;

  _StringGuts.grow(_:)(91);
  v3._object = (void *)0x80000002489181F0;
  v3._countAndFlagsBits = 0xD000000000000027;
  String.append(_:)(v3);
  swift_getMetatypeMetadata();
  v4._countAndFlagsBits = String.init<A>(reflecting:)();
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 0xD000000000000030;
  v5._object = (void *)0x8000000248918220;
  String.append(_:)(v5);
  swift_bridgeObjectRetain();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingKey);
  v7._countAndFlagsBits = MEMORY[0x24959E4B8](a2, v6);
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  lazy protocol witness table accessor for type TrialDecodingError and conformance TrialDecodingError();
  swift_allocError();
  *(_QWORD *)v8 = 0;
  *(_QWORD *)(v8 + 8) = 0xE000000000000000;
  *(_BYTE *)(v8 + 16) = 2;
  return swift_willThrow();
}

uint64_t protocol witness for SingleValueDecodingContainer.decode(_:) in conformance TrialDecoderImpl.SingleValueContainer()
{
  uint64_t *v0;

  return specialized TrialDecoderImpl.SingleValueContainer.decode(_:)(*v0) & 1;
}

{
  uint64_t *v0;

  return specialized TrialDecoderImpl.SingleValueContainer.decode(_:)(*v0);
}

{
  uint64_t *v0;

  return specialized TrialDecoderImpl.SingleValueContainer.decode(_:)(*v0);
}

{
  uint64_t *v0;

  return specialized TrialDecoderImpl.SingleValueContainer.decode(_:)(*v0);
}

{
  uint64_t *v0;

  return specialized TrialDecoderImpl.SingleValueContainer.decode(_:)(*v0, 93, 0xD00000000000005BLL, (void *)0x80000002489185C0);
}

{
  uint64_t *v0;

  return specialized TrialDecoderImpl.SingleValueContainer.decode(_:)(*v0, 94, 0xD00000000000005CLL, (void *)0x8000000248918560);
}

{
  uint64_t *v0;

  return specialized TrialDecoderImpl.SingleValueContainer.decode(_:)(*v0, 95, 0xD00000000000005DLL, (void *)0x8000000248918500);
}

{
  uint64_t *v0;

  return specialized TrialDecoderImpl.SingleValueContainer.decode(_:)(*v0, 95, 0xD00000000000005DLL, (void *)0x80000002489184A0);
}

{
  uint64_t *v0;

  return specialized TrialDecoderImpl.SingleValueContainer.decode(_:)(*v0, 95, 0xD00000000000005DLL, (void *)0x8000000248918440);
}

{
  return SingleValueDecodingContainer.decode(_:)();
}

{
  uint64_t *v0;

  return specialized TrialDecoderImpl.SingleValueContainer.decode(_:)(*v0, 94, 0xD00000000000005CLL, (void *)0x80000002489183E0);
}

{
  uint64_t *v0;

  return specialized TrialDecoderImpl.SingleValueContainer.decode(_:)(*v0, 95, 0xD00000000000005DLL, (void *)0x8000000248918380);
}

{
  uint64_t *v0;

  return specialized TrialDecoderImpl.SingleValueContainer.decode(_:)(*v0, 96, 0xD00000000000005ELL, (void *)0x8000000248918320);
}

{
  uint64_t *v0;

  return specialized TrialDecoderImpl.SingleValueContainer.decode(_:)(*v0, 96, 0xD00000000000005ELL, (void *)0x80000002489182C0);
}

{
  uint64_t *v0;

  return specialized TrialDecoderImpl.SingleValueContainer.decode(_:)(*v0, 96, 0xD00000000000005ELL, (void *)0x8000000248918260);
}

{
  return SingleValueDecodingContainer.decode(_:)();
}

uint64_t protocol witness for SingleValueDecodingContainer.decode<A>(_:) in conformance TrialDecoderImpl.SingleValueContainer(uint64_t a1)
{
  uint64_t *v1;

  return TrialDecoderImpl.SingleValueContainer.decode<A>(_:)(a1, *v1);
}

uint64_t type metadata accessor for TrialDecoderImpl.KeyedContainer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TrialDecoderImpl.KeyedContainer);
}

_QWORD *outlined init with copy of TrialDecoder(uint64_t a1, _QWORD *a2)
{
  initializeWithCopy for TrialDecoder(a2, a1);
  return a2;
}

id *outlined destroy of TrialDecoder(id *a1)
{
  destroy for TrialDecoder(a1);
  return a1;
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t lazy protocol witness table accessor for type TrialDecoderImpl and conformance TrialDecoderImpl()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TrialDecoderImpl and conformance TrialDecoderImpl;
  if (!lazy protocol witness table cache variable for type TrialDecoderImpl and conformance TrialDecoderImpl)
  {
    result = MEMORY[0x24959EFF8](&protocol conformance descriptor for TrialDecoderImpl, &unk_2519A8E08);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TrialDecoderImpl and conformance TrialDecoderImpl);
  }
  return result;
}

uint64_t sub_2488FEC5C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t outlined init with copy of TrialDecoderImpl(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for TrialDecoderImpl(a2, a1, &unk_2519A8E08);
  return a2;
}

uint64_t outlined init with copy of (String, Any)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t type metadata instantiation function for TrialDecoderImpl.KeyedContainer()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t destroy for TrialDecoderImpl(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return swift_unknownObjectWeakDestroy();
}

_QWORD *initializeWithCopy for TrialDecoderImpl(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v6 = (void *)a2[2];
  v5 = a2[3];
  a1[2] = v6;
  a1[3] = v5;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v7 = v6;
  swift_bridgeObjectRetain();
  swift_unknownObjectWeakCopyInit();
  a1[6] = a2[6];
  return a1;
}

_QWORD *assignWithCopy for TrialDecoderImpl(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)a2[2];
  v5 = (void *)a1[2];
  a1[2] = v4;
  v6 = v4;

  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakCopyAssign();
  a1[6] = a2[6];
  return a1;
}

uint64_t initializeWithTake for TrialDecoderImpl(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_unknownObjectWeakTakeInit();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  return a1;
}

_QWORD *assignWithTake for TrialDecoderImpl(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  v4 = (void *)a1[2];
  a1[2] = a2[2];

  v5 = a2[4];
  a1[3] = a2[3];
  a1[4] = v5;
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakTakeAssign();
  a1[6] = a2[6];
  return a1;
}

uint64_t getEnumTagSinglePayload for TrialDecoderImpl(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TrialDecoderImpl(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t destroy for TrialDecoderImpl.UnkeyedContainer()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TrialDecoderImpl.UnkeyedContainer(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TrialDecoderImpl.UnkeyedContainer(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for TrialDecoderImpl.UnkeyedContainer(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for TrialDecoderImpl.UnkeyedContainer(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TrialDecoderImpl.UnkeyedContainer(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void *type metadata accessor for TrialDecoderImpl.UnkeyedContainer()
{
  return &unk_2519A8F40;
}

void *type metadata accessor for TrialDecoderImpl.SingleValueContainer()
{
  return &unk_2519A8F70;
}

uint64_t associated type witness table accessor for KeyedDecodingContainerProtocol.Key : CodingKey in TrialDecoderImpl.KeyedContainer<A>(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 24);
}

unint64_t lazy protocol witness table accessor for type TrialDecodingError and conformance TrialDecodingError()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TrialDecodingError and conformance TrialDecodingError;
  if (!lazy protocol witness table cache variable for type TrialDecodingError and conformance TrialDecodingError)
  {
    result = MEMORY[0x24959EFF8](&protocol conformance descriptor for TrialDecodingError, &type metadata for TrialDecodingError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TrialDecodingError and conformance TrialDecodingError);
  }
  return result;
}

uint64_t TrialDecoderImpl.UnkeyedContainer.decodeNil()(Swift::Int a1, uint64_t a2, void *a3)
{
  uint64_t *v3;
  Swift::String v6;
  uint64_t v7;
  uint64_t v8;
  Swift::String v9;
  uint64_t v10;

  _StringGuts.grow(_:)(a1);
  v6._countAndFlagsBits = a2;
  v6._object = a3;
  String.append(_:)(v6);
  v7 = *v3;
  swift_bridgeObjectRetain();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingKey);
  v9._countAndFlagsBits = MEMORY[0x24959E4B8](v7, v8);
  String.append(_:)(v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  lazy protocol witness table accessor for type TrialDecodingError and conformance TrialDecodingError();
  swift_allocError();
  *(_QWORD *)v10 = 0;
  *(_QWORD *)(v10 + 8) = 0xE000000000000000;
  *(_BYTE *)(v10 + 16) = 1;
  swift_willThrow();
  return 0;
}

uint64_t specialized TrialDecoderImpl.UnkeyedContainer.decode(_:)()
{
  uint64_t *v0;
  Swift::String v1;
  uint64_t v2;
  uint64_t v3;
  Swift::String v4;
  uint64_t v5;

  _StringGuts.grow(_:)(92);
  v1._object = (void *)0x8000000248918DA0;
  v1._countAndFlagsBits = 0xD00000000000005ALL;
  String.append(_:)(v1);
  v2 = *v0;
  swift_bridgeObjectRetain();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingKey);
  v4._countAndFlagsBits = MEMORY[0x24959E4B8](v2, v3);
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  lazy protocol witness table accessor for type TrialDecodingError and conformance TrialDecodingError();
  swift_allocError();
  *(_QWORD *)v5 = 0;
  *(_QWORD *)(v5 + 8) = 0xE000000000000000;
  *(_BYTE *)(v5 + 16) = 1;
  return swift_willThrow();
}

{
  uint64_t *v0;
  Swift::String v1;
  uint64_t v2;
  uint64_t v3;
  Swift::String v4;
  uint64_t v5;

  _StringGuts.grow(_:)(92);
  v1._object = (void *)0x8000000248918D40;
  v1._countAndFlagsBits = 0xD00000000000005ALL;
  String.append(_:)(v1);
  v2 = *v0;
  swift_bridgeObjectRetain();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingKey);
  v4._countAndFlagsBits = MEMORY[0x24959E4B8](v2, v3);
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  lazy protocol witness table accessor for type TrialDecodingError and conformance TrialDecodingError();
  swift_allocError();
  *(_QWORD *)v5 = 0;
  *(_QWORD *)(v5 + 8) = 0xE000000000000000;
  *(_BYTE *)(v5 + 16) = 1;
  return swift_willThrow();
}

{
  uint64_t *v0;
  Swift::String v1;
  uint64_t v2;
  uint64_t v3;
  Swift::String v4;
  uint64_t v5;

  _StringGuts.grow(_:)(91);
  v1._object = (void *)0x8000000248918CE0;
  v1._countAndFlagsBits = 0xD000000000000059;
  String.append(_:)(v1);
  v2 = *v0;
  swift_bridgeObjectRetain();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingKey);
  v4._countAndFlagsBits = MEMORY[0x24959E4B8](v2, v3);
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  lazy protocol witness table accessor for type TrialDecodingError and conformance TrialDecodingError();
  swift_allocError();
  *(_QWORD *)v5 = 0;
  *(_QWORD *)(v5 + 8) = 0xE000000000000000;
  *(_BYTE *)(v5 + 16) = 1;
  return swift_willThrow();
}

uint64_t specialized TrialDecoderImpl.SingleValueContainer.decode(_:)(uint64_t a1)
{
  Swift::String v2;
  uint64_t v3;
  Swift::String v4;
  uint64_t v5;

  _StringGuts.grow(_:)(94);
  v2._object = (void *)0x8000000248918740;
  v2._countAndFlagsBits = 0xD00000000000005CLL;
  String.append(_:)(v2);
  swift_bridgeObjectRetain();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingKey);
  v4._countAndFlagsBits = MEMORY[0x24959E4B8](a1, v3);
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  lazy protocol witness table accessor for type TrialDecodingError and conformance TrialDecodingError();
  swift_allocError();
  *(_QWORD *)v5 = 0;
  *(_QWORD *)(v5 + 8) = 0xE000000000000000;
  *(_BYTE *)(v5 + 16) = 2;
  swift_willThrow();
  return 0;
}

{
  Swift::String v2;
  uint64_t v3;
  Swift::String v4;
  uint64_t v5;

  _StringGuts.grow(_:)(96);
  v2._object = (void *)0x80000002489186E0;
  v2._countAndFlagsBits = 0xD00000000000005ELL;
  String.append(_:)(v2);
  swift_bridgeObjectRetain();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingKey);
  v4._countAndFlagsBits = MEMORY[0x24959E4B8](a1, v3);
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  lazy protocol witness table accessor for type TrialDecodingError and conformance TrialDecodingError();
  swift_allocError();
  *(_QWORD *)v5 = 0;
  *(_QWORD *)(v5 + 8) = 0xE000000000000000;
  *(_BYTE *)(v5 + 16) = 2;
  return swift_willThrow();
}

{
  Swift::String v2;
  uint64_t v3;
  Swift::String v4;
  uint64_t v5;

  _StringGuts.grow(_:)(96);
  v2._object = (void *)0x8000000248918680;
  v2._countAndFlagsBits = 0xD00000000000005ELL;
  String.append(_:)(v2);
  swift_bridgeObjectRetain();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingKey);
  v4._countAndFlagsBits = MEMORY[0x24959E4B8](a1, v3);
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  lazy protocol witness table accessor for type TrialDecodingError and conformance TrialDecodingError();
  swift_allocError();
  *(_QWORD *)v5 = 0;
  *(_QWORD *)(v5 + 8) = 0xE000000000000000;
  *(_BYTE *)(v5 + 16) = 2;
  return swift_willThrow();
}

{
  Swift::String v2;
  uint64_t v3;
  Swift::String v4;
  uint64_t v5;

  _StringGuts.grow(_:)(95);
  v2._object = (void *)0x8000000248918620;
  v2._countAndFlagsBits = 0xD00000000000005DLL;
  String.append(_:)(v2);
  swift_bridgeObjectRetain();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingKey);
  v4._countAndFlagsBits = MEMORY[0x24959E4B8](a1, v3);
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  lazy protocol witness table accessor for type TrialDecodingError and conformance TrialDecodingError();
  swift_allocError();
  *(_QWORD *)v5 = 0;
  *(_QWORD *)(v5 + 8) = 0xE000000000000000;
  *(_BYTE *)(v5 + 16) = 2;
  return swift_willThrow();
}

uint64_t specialized TrialDecoderImpl.SingleValueContainer.decode(_:)(uint64_t a1, Swift::Int a2, uint64_t a3, void *a4)
{
  Swift::String v7;
  uint64_t v8;
  Swift::String v9;
  uint64_t v10;

  _StringGuts.grow(_:)(a2);
  v7._countAndFlagsBits = a3;
  v7._object = a4;
  String.append(_:)(v7);
  swift_bridgeObjectRetain();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodingKey);
  v9._countAndFlagsBits = MEMORY[0x24959E4B8](a1, v8);
  String.append(_:)(v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  lazy protocol witness table accessor for type TrialDecodingError and conformance TrialDecodingError();
  swift_allocError();
  *(_QWORD *)v10 = 0;
  *(_QWORD *)(v10 + 8) = 0xE000000000000000;
  *(_BYTE *)(v10 + 16) = 2;
  return swift_willThrow();
}

uint64_t sub_2488FF9C8()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in TrialDecoderImpl.KeyedContainer.decodeURL(forKey:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (uint64_t)(v1 + 6);
  v8 = v1[13];
  v7 = v1[14];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = partial apply for closure #1 in closure #1 in TUSLazyPurgeable.instantiateState();
  return closure #1 in TrialDecoderImpl.KeyedContainer.decodeURL(forKey:)(a1, v4, v5, v6, v8, v7);
}

uint64_t static NSProcessInfo.processNameForPID(_:)(int a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v2 = type metadata accessor for String.Encoding();
  MEMORY[0x24BDAC7A8](v2, v3, v4);
  v5 = (void *)swift_slowAlloc();
  if (proc_name(a1, v5, 0x400u) < 0)
  {
    MEMORY[0x24959F0A0](v5, -1, -1);
    return 0;
  }
  else
  {
    static String.Encoding.utf8.getter();
    v6 = String.init(cString:encoding:)();
    MEMORY[0x24959F0A0](v5, -1, -1);
  }
  return v6;
}

id static OVSResolver.containsOVS(in:localeIdentifier:)(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  NSArray v5;
  id v6;

  v3 = a3;
  if (!a1)
  {
    v5.super.isa = 0;
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
  if (v3)
LABEL_3:
    v3 = (void *)MEMORY[0x24959E374](a2, v3);
LABEL_4:
  v6 = objc_msgSend((id)objc_opt_self(), sel_containsOVSInTokens_forLocaleIdentifier_, v5.super.isa, v3);

  return v6;
}

ValueMetadata *type metadata accessor for OVSResolver()
{
  return &type metadata for OVSResolver;
}

BOOL static LearnFromThisAppCheckerApplication.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void LearnFromThisAppCheckerApplication.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int LearnFromThisAppCheckerApplication.hashValue.getter(unsigned __int8 a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance LearnFromThisAppCheckerApplication(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance LearnFromThisAppCheckerApplication()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance LearnFromThisAppCheckerApplication()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance LearnFromThisAppCheckerApplication()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void static LearnFromThisAppChecker.isLearningAllowed(application:)(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_2488FFD8C()
{
  void *v0;
  uint64_t CanLearnFromApp;

  if (((unint64_t)"com.apple.mobilecal" & 0x2000000000000000) != 0
    && (((unint64_t)"com.apple.mobilecal" >> 56) & 0xF) == 0)
  {
    return 0;
  }
  v0 = (void *)MEMORY[0x24959E374](0xD000000000000010, 0x80000002489193D0);
  CanLearnFromApp = SGSiriCanLearnFromApp(v0);

  return CanLearnFromApp;
}

uint64_t static LearnFromThisAppChecker.isLearningAllowed(bundleIdentifier:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t CanLearnFromApp;

  v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return 0;
  v3 = (void *)MEMORY[0x24959E374]();
  CanLearnFromApp = SGSiriCanLearnFromApp(v3);

  return CanLearnFromApp;
}

uint64_t SGSiriCanLearnFromApp(void *a1)
{
  id v1;
  void *v2;
  int v3;

  v1 = a1;
  v2 = (id)(id)CFPreferencesCopyAppValue(CFSTR("SiriCanLearnFromAppBlacklist"), CFSTR("com.apple.suggestions"));
  v3 = objc_msgSend(v2, "containsObject:", v1);

  return v3 ^ 1u;
}

unint64_t lazy protocol witness table accessor for type LearnFromThisAppCheckerApplication and conformance LearnFromThisAppCheckerApplication()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type LearnFromThisAppCheckerApplication and conformance LearnFromThisAppCheckerApplication;
  if (!lazy protocol witness table cache variable for type LearnFromThisAppCheckerApplication and conformance LearnFromThisAppCheckerApplication)
  {
    result = MEMORY[0x24959EFF8](&protocol conformance descriptor for LearnFromThisAppCheckerApplication, &type metadata for LearnFromThisAppCheckerApplication);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LearnFromThisAppCheckerApplication and conformance LearnFromThisAppCheckerApplication);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LearnFromThisAppCheckerApplication(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF4)
    goto LABEL_17;
  if (a2 + 12 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 12) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 12;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 12;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 12;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xD;
  v8 = v6 - 13;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for LearnFromThisAppCheckerApplication(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 12 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 12) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF4)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF3)
    return ((uint64_t (*)(void))((char *)&loc_248900160 + 4 * byte_248917382[v4]))();
  *a1 = a2 + 12;
  return ((uint64_t (*)(void))((char *)sub_248900194 + 4 * byte_24891737D[v4]))();
}

uint64_t sub_248900194(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24890019C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2489001A4);
  return result;
}

uint64_t sub_2489001B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2489001B8);
  *(_BYTE *)result = a2 + 12;
  return result;
}

uint64_t sub_2489001BC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2489001C4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for LearnFromThisAppCheckerApplication(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for LearnFromThisAppCheckerApplication(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LearnFromThisAppCheckerApplication()
{
  return &type metadata for LearnFromThisAppCheckerApplication;
}

ValueMetadata *type metadata accessor for LearnFromThisAppChecker()
{
  return &type metadata for LearnFromThisAppChecker;
}

uint64_t one-time initialization function for indefinitePronoun()
{
  uint64_t result;

  result = MEMORY[0x24959E374](0xD000000000000011, 0x8000000248919420);
  static NLTag.indefinitePronoun = result;
  return result;
}

uint64_t one-time initialization function for greeting()
{
  uint64_t result;

  result = MEMORY[0x24959E374](0x676E697465657247, 0xE800000000000000);
  static NLTag.greeting = result;
  return result;
}

uint64_t one-time initialization function for article()
{
  uint64_t result;

  result = MEMORY[0x24959E374](0x656C6369747241, 0xE700000000000000);
  static NLTag.article = result;
  return result;
}

uint64_t one-time initialization function for joiningPreposition()
{
  uint64_t result;

  result = MEMORY[0x24959E374](0xD000000000000012, 0x8000000248919440);
  static NLTag.joiningPreposition = result;
  return result;
}

uint64_t one-time initialization function for businessNoun()
{
  uint64_t result;

  result = MEMORY[0x24959E374](0x7373656E69737542, 0xEC0000006E756F4ELL);
  static NLTag.businessNoun = result;
  return result;
}

uint64_t one-time initialization function for peopleNoun()
{
  uint64_t result;

  result = MEMORY[0x24959E374](0x6F4E656C706F6550, 0xEA00000000006E75);
  static NLTag.peopleNoun = result;
  return result;
}

id one-time initialization function for emailRegex()
{
  id v0;
  id result;

  v0 = objc_allocWithZone(MEMORY[0x24BDD1798]);
  result = @nonobjc NSRegularExpression.init(pattern:options:)(0xD000000000000084, 0x8000000248919460, 1);
  static String.emailRegex = (uint64_t)result;
  return result;
}

uint64_t String.digitsOnly.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void (*v15)(char *, uint64_t);
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[2];

  v4 = type metadata accessor for CharacterSet();
  v5 = *(_QWORD *)(v4 - 8);
  v8 = MEMORY[0x24BDAC7A8](v4, v6, v7);
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8, v11, v12);
  v14 = (char *)v19 - v13;
  v19[0] = a1;
  v19[1] = a2;
  static CharacterSet.decimalDigits.getter();
  CharacterSet.inverted.getter();
  v15 = *(void (**)(char *, uint64_t))(v5 + 8);
  v15(v14, v4);
  lazy protocol witness table accessor for type String and conformance String();
  v16 = StringProtocol.components(separatedBy:)();
  v15(v10, v4);
  v19[0] = v16;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
  lazy protocol witness table accessor for type [String] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [String] and conformance [A], &demangling cache variable for type metadata for [String], MEMORY[0x24BEE12B0]);
  v17 = BidirectionalCollection<>.joined(separator:)();
  swift_bridgeObjectRelease();
  return v17;
}

BOOL String.containsAPhoneNumber.getter(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  id v13;
  void *v14;
  id v15[2];

  v15[1] = *(id *)MEMORY[0x24BDAC8D0];
  v15[0] = 0;
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD14E8]), sel_initWithTypes_error_, 2048, v15);
  if (v4)
  {
    v5 = v4;
    v6 = v15[0];
    v7 = (void *)MEMORY[0x24959E374](a1, a2);
    swift_bridgeObjectRetain();
    v8 = String.UTF16View.count.getter();
    swift_bridgeObjectRelease();
    v9 = objc_msgSend(v5, sel_matchesInString_options_range_, v7, 0, 0, v8);

    type metadata accessor for OS_dispatch_source(0, &lazy cache variable for type metadata for NSTextCheckingResult);
    v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v10 >> 62)
    {
      swift_bridgeObjectRetain();
      v11 = _CocoaArrayWrapper.endIndex.getter();

      swift_bridgeObjectRelease_n();
    }
    else
    {
      v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRelease();

    }
    return v11 != 0;
  }
  else
  {
    v13 = v15[0];
    v14 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
    return 0;
  }
}

uint64_t String.looksLikeAnEmailAddress.getter(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  id v6;

  if (one-time initialization token for emailRegex != -1)
    swift_once();
  if (!static String.emailRegex)
    return 0;
  v4 = (id)static String.emailRegex;
  v5 = (void *)MEMORY[0x24959E374](a1, a2);
  v6 = objc_msgSend(v4, sel_firstMatchInString_options_range_, v5, 0, 0, String.count.getter());

  if (!v6)
    return 0;

  return 1;
}

uint64_t String.looksLikeAPhoneShortCode.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  Swift::String v15;
  Swift::String v16;
  int v17;
  Swift::String v18;
  void (*v19)(char *, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  Swift::String v24;
  uint64_t v25;
  _QWORD v27[2];

  v4 = type metadata accessor for CharacterSet();
  v5 = *(_QWORD *)(v4 - 8);
  v8 = MEMORY[0x24BDAC7A8](v4, v6, v7);
  v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8, v11, v12);
  v14 = (char *)v27 - v13;
  v15._countAndFlagsBits = 35;
  v15._object = (void *)0xE100000000000000;
  v17 = (String.hasPrefix(_:)(v15)
      || (v16._countAndFlagsBits = 42, v16._object = (void *)0xE100000000000000, String.hasPrefix(_:)(v16)))
     && String.count.getter() >= 5
     && String.count.getter() < 10;
  if (String.count.getter() <= 7)
  {
    v18._countAndFlagsBits = 0x34343430392BLL;
    v18._object = (void *)0xE600000000000000;
    v17 |= String.hasPrefix(_:)(v18);
  }
  v27[0] = a1;
  v27[1] = a2;
  static CharacterSet.decimalDigits.getter();
  CharacterSet.inverted.getter();
  v19 = *(void (**)(char *, uint64_t))(v5 + 8);
  v19(v14, v4);
  lazy protocol witness table accessor for type String and conformance String();
  v20 = StringProtocol.components(separatedBy:)();
  v19(v10, v4);
  v27[0] = v20;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
  lazy protocol witness table accessor for type [String] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [String] and conformance [A], &demangling cache variable for type metadata for [String], MEMORY[0x24BEE12B0]);
  v21 = BidirectionalCollection<>.joined(separator:)();
  v23 = v22;
  swift_bridgeObjectRelease();
  v24._countAndFlagsBits = 3421236;
  v24._object = (void *)0xE300000000000000;
  if (String.hasPrefix(_:)(v24) && String.count.getter() == 7)
    LOBYTE(v17) = 1;
  if ((v23 & 0x2000000000000000) != 0)
  {
    if ((v23 & 0xF00000000000000) != 0)
      goto LABEL_13;
LABEL_15:
    swift_bridgeObjectRelease();
    return v17 & 1;
  }
  if ((v21 & 0xFFFFFFFFFFFFLL) == 0)
    goto LABEL_15;
LABEL_13:
  v25 = String.count.getter();
  swift_bridgeObjectRelease();
  LOBYTE(v17) = (v25 < 7) | v17;
  return v17 & 1;
}

Swift::String_optional __swiftcall String.primaryLanguageTag()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  Swift::String_optional result;

  v2 = v1;
  v3 = v0;
  v4 = (void *)objc_opt_self();
  v5 = (void *)MEMORY[0x24959E374](v3, v2);
  v6 = objc_msgSend(v4, sel_dominantLanguageForString_, v5);

  if (v6)
  {
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v9 = v8;

  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  v10 = v7;
  v11 = v9;
  result.value._object = v11;
  result.value._countAndFlagsBits = v10;
  return result;
}

Swift::String __swiftcall String.lemmatized()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  Class isa;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  Swift::String result;

  v2 = v1;
  v3 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<NLTagScheme>);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_248917470;
  v5 = (void *)*MEMORY[0x24BDDFCF8];
  *(_QWORD *)(v4 + 32) = *MEMORY[0x24BDDFCF8];
  v6 = objc_allocWithZone(MEMORY[0x24BDDFD68]);
  type metadata accessor for NLTagScheme(0);
  v7 = v5;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v6, sel_initWithTagSchemes_, isa);

  v10 = (void *)MEMORY[0x24959E374](v3, v2);
  objc_msgSend(v9, sel_setString_, v10);

  NLTagger.enumerateTags(in:unit:scheme:options:using:)();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
  lazy protocol witness table accessor for type [String] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [String] and conformance [A], &demangling cache variable for type metadata for [String], MEMORY[0x24BEE12B0]);
  v11 = BidirectionalCollection<>.joined(separator:)();
  v13 = v12;
  swift_bridgeObjectRelease_n();

  v14 = v11;
  v15 = v13;
  result._object = v15;
  result._countAndFlagsBits = v14;
  return result;
}

uint64_t closure #1 in String.lemmatized()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD **a6)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v14;
  unint64_t v15;
  _QWORD *v16;

  if (a1)
  {
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v9 = v8;
  }
  else
  {
    v10 = String.subscript.getter();
    v7 = MEMORY[0x24959E3EC](v10);
    v9 = v11;
    swift_bridgeObjectRelease();
  }
  v12 = *a6;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a6 = v12;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v12 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v12[2] + 1, 1, v12);
    *a6 = v12;
  }
  v15 = v12[2];
  v14 = v12[3];
  if (v15 >= v14 >> 1)
  {
    v12 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v14 > 1), v15 + 1, 1, v12);
    *a6 = v12;
  }
  v12[2] = v15 + 1;
  v16 = &v12[2 * v15];
  v16[4] = v7;
  v16[5] = v9;
  return 1;
}

Swift::String __swiftcall String.trimMessageGreeting()()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  Class isa;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  Class v27;
  uint64_t v28;
  unsigned __int16 v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  char v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  void *v53;
  Swift::String result;
  uint64_t *v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;

  v2 = v1;
  v3 = v0;
  v4 = type metadata accessor for CharacterSet();
  v58 = *(_QWORD *)(v4 - 8);
  v59 = v4;
  MEMORY[0x24BDAC7A8](v4, v5, v6);
  v8 = (char *)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Locale?);
  MEMORY[0x24BDAC7A8](v9, v10, v11);
  v13 = (char *)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<NLTagScheme>);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_248917470;
  v15 = (void *)*MEMORY[0x24BDDFD10];
  *(_QWORD *)(v14 + 32) = *MEMORY[0x24BDDFD10];
  v16 = objc_allocWithZone(MEMORY[0x24BDDFD68]);
  type metadata accessor for NLTagScheme(0);
  v17 = v15;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v19 = objc_msgSend(v16, sel_initWithTagSchemes_, isa);

  v20 = (void *)MEMORY[0x24959E374](v3, v2);
  objc_msgSend(v19, sel_setString_, v20);

  if (one-time initialization token for supportGazetteer != -1)
    v21 = swift_once();
  v24 = (void *)static NLGazetteer.supportGazetteer;
  if (static NLGazetteer.supportGazetteer)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_248917480;
    *(_QWORD *)(v25 + 32) = v24;
    v67 = v25;
    specialized Array._endMutation()();
    type metadata accessor for OS_dispatch_source(0, &lazy cache variable for type metadata for NLGazetteer);
    v26 = v24;
    v27 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    objc_msgSend(v19, sel_setGazetteers_forTagScheme_, v27, v17);

  }
  v67 = 0;
  v68 = 0xE000000000000000;
  v65 = 0;
  v66 = 0xE000000000000000;
  if ((v2 & 0x2000000000000000) != 0)
    v28 = HIBYTE(v2) & 0xF;
  else
    v28 = v3;
  if (((v2 >> 60) & ((v3 & 0x800000000000000) == 0)) != 0)
    v29 = 11;
  else
    v29 = 7;
  v64 = 0;
  v30 = v29 | (unint64_t)(v28 << 16);
  MEMORY[0x24BDAC7A8](v21, v22, v23);
  *(&v57 - 6) = (uint64_t)&v67;
  *(&v57 - 5) = v3;
  *(&v57 - 4) = v2;
  *(&v57 - 3) = (uint64_t)&v64;
  v55 = &v65;
  NLTagger.enumerateTags(in:unit:scheme:options:using:)();
  if (v64 == 1)
  {
    v62 = v3;
    v63 = v2;
    v60 = v65;
    v61 = v66;
    v31 = type metadata accessor for Locale();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v13, 1, 1, v31);
    v32 = lazy protocol witness table accessor for type String and conformance String();
    swift_bridgeObjectRetain();
    v55 = (uint64_t *)v32;
    v56 = v32;
    StringProtocol.range<A>(of:options:range:locale:)();
    v34 = v33;
    v36 = v35;
    outlined destroy of Locale?((uint64_t)v13);
    swift_bridgeObjectRelease();
    if ((v36 & 1) != 0)
    {
      v38 = HIBYTE(v68) & 0xF;
      if ((v68 & 0x2000000000000000) == 0)
        v38 = v67;
      v39 = 7;
      if (((v68 >> 60) & ((v67 & 0x800000000000000) == 0)) != 0)
        v39 = 11;
      v40 = v39 | (v38 << 16);
      swift_bridgeObjectRetain();
      v37 = v40;
    }
    else
    {
      if ((v34 ^ (unint64_t)(v28 << 16)) >= 0x4000)
        v30 = String.index(after:)();
      swift_bridgeObjectRetain();
      v37 = v30;
    }
    v41 = specialized Collection.subscript.getter(v37, v3, v2);
    v43 = v42;
    v45 = v44;
    v47 = v46;
    swift_bridgeObjectRelease();
    v48 = MEMORY[0x24959E3EC](v41, v43, v45, v47);
    v50 = v49;
    swift_bridgeObjectRelease();
    v62 = v48;
    v63 = v50;
    static CharacterSet.whitespacesAndNewlines.getter();
    v3 = StringProtocol.trimmingCharacters(in:)();
    v2 = v51;

    (*(void (**)(char *, uint64_t))(v58 + 8))(v8, v59);
    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v52 = v3;
  v53 = (void *)v2;
  result._object = v53;
  result._countAndFlagsBits = v52;
  return result;
}

uint64_t closure #1 in String.trimMessageGreeting()(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, _BYTE *a7, uint64_t *a8)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v33;

  if (!a1)
    return 1;
  v10 = one-time initialization token for greeting;
  v33 = a1;
  if (v10 != -1)
    swift_once();
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = v12;
  if (v11 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v13 == v14)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_12;
  }
  v16 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v16 & 1) != 0)
  {
LABEL_12:
    v18 = String.subscript.getter();
    v19 = MEMORY[0x24959E3EC](v18);
    v21 = v20;
    swift_bridgeObjectRelease();
    *a4 = v19;
    a4[1] = v21;
    swift_bridgeObjectRelease();
    *a7 = 1;
  }
  v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v24 = v23;
  if (v22 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v24 == v25)
  {
    swift_bridgeObjectRelease_n();
    if ((*a7 & 1) != 0)
    {
LABEL_19:
      v28 = String.subscript.getter();
      v29 = MEMORY[0x24959E3EC](v28);
      v31 = v30;
      swift_bridgeObjectRelease();

      *a8 = v29;
      a8[1] = v31;
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  else
  {
    v27 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v27 & 1) != 0 && (*a7 & 1) != 0)
      goto LABEL_19;
  }

  return 1;
}

unint64_t specialized Collection.subscript.getter(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;

  v3 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v3 = a2 & 0xFFFFFFFFFFFFLL;
  if (4 * v3 >= result >> 14)
    return String.subscript.getter();
  __break(1u);
  return result;
}

uint64_t String.trimLeadingCharacters(_:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  char v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];
  uint64_t v20;
  unint64_t v21;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Locale?);
  MEMORY[0x24BDAC7A8](v5, v6, v7);
  v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = a2;
  v21 = a3;
  lazy protocol witness table accessor for type String and conformance String();
  v10 = StringProtocol.trimmingCharacters(in:)();
  v20 = a2;
  v21 = a3;
  v19[0] = v10;
  v19[1] = v11;
  v12 = type metadata accessor for Locale();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = StringProtocol.range<A>(of:options:range:locale:)();
  v15 = v14;
  outlined destroy of Locale?((uint64_t)v9);
  result = swift_bridgeObjectRelease();
  if ((v15 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    return a2;
  }
  v17 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v17 = a2 & 0xFFFFFFFFFFFFLL;
  if (4 * v17 >= v13 >> 14)
  {
    v18 = String.subscript.getter();
    a2 = MEMORY[0x24959E3EC](v18);
    swift_bridgeObjectRelease();
    return a2;
  }
  __break(1u);
  return result;
}

uint64_t String.containsAJoiningPreposition.getter(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  Class isa;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  Class v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<NLTagScheme>);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_248917470;
  v5 = (void *)*MEMORY[0x24BDDFD10];
  *(_QWORD *)(v4 + 32) = *MEMORY[0x24BDDFD10];
  v6 = objc_allocWithZone(MEMORY[0x24BDDFD68]);
  type metadata accessor for NLTagScheme(0);
  v7 = v5;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v6, sel_initWithTagSchemes_, isa);

  v10 = (void *)MEMORY[0x24959E374](a1, a2);
  objc_msgSend(v9, sel_setString_, v10);

  if (one-time initialization token for supportGazetteer != -1)
    v11 = swift_once();
  v13 = (void *)static NLGazetteer.supportGazetteer;
  if (static NLGazetteer.supportGazetteer)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_248917480;
    *(_QWORD *)(v14 + 32) = v13;
    v20 = v14;
    specialized Array._endMutation()();
    type metadata accessor for OS_dispatch_source(0, &lazy cache variable for type metadata for NLGazetteer);
    v15 = v13;
    v16 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    objc_msgSend(v9, sel_setGazetteers_forTagScheme_, v16, v7, v20);

  }
  v17 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v17 = a1;
  v18 = 7;
  if (((a2 >> 60) & ((a1 & 0x800000000000000) == 0)) != 0)
    v18 = 11;
  MEMORY[0x24BDAC7A8](v11, v18 | (v17 << 16), v12);
  NLTagger.enumerateTags(in:unit:scheme:options:using:)();

  return 0;
}

uint64_t closure #1 in String.containsAJoiningPreposition.getter(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  Swift::String v21;
  Swift::String v22;

  if (!a1)
    return 1;
  v7 = one-time initialization token for joiningPreposition;
  v8 = a1;
  if (v7 != -1)
    swift_once();
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = v10;
  if (v9 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v11 == v12)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v14 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v14 & 1) == 0)
    {

      return 1;
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
  v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_248917470;
  v17 = String.subscript.getter();
  v18 = MEMORY[0x24959E3EC](v17);
  v20 = v19;
  swift_bridgeObjectRelease();
  v21._countAndFlagsBits = 8250;
  v21._object = (void *)0xE200000000000000;
  String.append(_:)(v21);
  v22._countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.append(_:)(v22);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v16 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v16 + 32) = v18;
  *(_QWORD *)(v16 + 40) = v20;
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();

  result = 0;
  *a6 = 1;
  return result;
}

Swift::Bool __swiftcall String.looksLikeAnAcronym()()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  Swift::Bool v18;
  void (*v19)(char *, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v2 = v1;
  v3 = v0;
  v4 = type metadata accessor for CharacterSet();
  v23 = *(_QWORD *)(v4 - 8);
  v7 = MEMORY[0x24BDAC7A8](v4, v5, v6);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7, v10, v11);
  v13 = (char *)&v21 - v12;
  static CharacterSet.lowercaseLetters.getter();
  static CharacterSet.whitespacesAndNewlines.getter();
  v26 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) != 0)
    v14 = HIBYTE(v2) & 0xF;
  else
    v14 = v3 & 0xFFFFFFFFFFFFLL;
  if (v14)
  {
    v22 = v4;
    v24 = (v2 & 0xFFFFFFFFFFFFFFFLL) + 32;
    v25 = v2 & 0xFFFFFFFFFFFFFFLL;
    swift_bridgeObjectRetain();
    v15 = 0;
    while (1)
    {
      if ((v2 & 0x1000000000000000) != 0)
      {
        _StringGuts.foreignErrorCorrectedScalar(startingAt:)();
      }
      else
      {
        if ((v2 & 0x2000000000000000) != 0)
        {
          v27 = v3;
          v28 = v25;
        }
        else if ((v3 & 0x1000000000000000) == 0)
        {
          _StringObject.sharedUTF8.getter();
        }
        _decodeScalar(_:startingAt:)();
      }
      v17 = v16;
      if ((CharacterSet.contains(_:)() & 1) != 0 || (CharacterSet.contains(_:)() & 1) != 0)
        break;
      v15 += v17;
      if (v15 >= v14)
      {
        v18 = 1;
        goto LABEL_18;
      }
    }
    v18 = 0;
LABEL_18:
    swift_bridgeObjectRelease();
    v4 = v22;
  }
  else
  {
    v18 = 1;
  }
  v19 = *(void (**)(char *, uint64_t))(v23 + 8);
  v19(v9, v4);
  v19(v13, v4);
  return v18;
}

uint64_t String.verbLikeTokens()(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  Class isa;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  Class v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<NLTagScheme>);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_248917470;
  v5 = (void *)*MEMORY[0x24BDDFD10];
  *(_QWORD *)(v4 + 32) = *MEMORY[0x24BDDFD10];
  v6 = objc_allocWithZone(MEMORY[0x24BDDFD68]);
  type metadata accessor for NLTagScheme(0);
  v7 = v5;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v6, sel_initWithTagSchemes_, isa);

  v10 = (void *)MEMORY[0x24959E374](a1, a2);
  objc_msgSend(v9, sel_setString_, v10);

  if (one-time initialization token for supportGazetteer != -1)
    v11 = swift_once();
  v13 = (void *)static NLGazetteer.supportGazetteer;
  if (static NLGazetteer.supportGazetteer)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_248917480;
    *(_QWORD *)(v14 + 32) = v13;
    specialized Array._endMutation()();
    type metadata accessor for OS_dispatch_source(0, &lazy cache variable for type metadata for NLGazetteer);
    v15 = v13;
    v16 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    objc_msgSend(v9, sel_setGazetteers_forTagScheme_, v16, v7);

  }
  v20 = MEMORY[0x24BEE4AF8];
  v17 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v17 = a1;
  v18 = 7;
  if (((a2 >> 60) & ((a1 & 0x800000000000000) == 0)) != 0)
    v18 = 11;
  MEMORY[0x24BDAC7A8](v11, v18 | (v17 << 16), v12);
  NLTagger.enumerateTags(in:unit:scheme:options:using:)();

  return v20;
}

uint64_t closure #1 in String.verbLikeTokens()(void *a1, uint64_t a2, uint64_t a3, _QWORD **a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v22;

  if (a1)
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = v7;
    if (v6 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v8 == v9)
    {
      v13 = a1;
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
      v12 = a1;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {
LABEL_14:

        return 1;
      }
    }
    v14 = String.subscript.getter();
    v15 = MEMORY[0x24959E3EC](v14);
    v17 = v16;
    swift_bridgeObjectRelease();
    v18 = *a4;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *a4 = v18;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v18 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v18[2] + 1, 1, v18);
      *a4 = v18;
    }
    v21 = v18[2];
    v20 = v18[3];
    if (v21 >= v20 >> 1)
    {
      v18 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v20 > 1), v21 + 1, 1, v18);
      *a4 = v18;
    }
    v18[2] = v21 + 1;
    v22 = &v18[2 * v21];
    v22[4] = v15;
    v22[5] = v17;
    goto LABEL_14;
  }
  return 1;
}

uint64_t String.businessRelevantEntities()(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  Class isa;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  Class v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<NLTagScheme>);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_248917470;
  v5 = (void *)*MEMORY[0x24BDDFD00];
  *(_QWORD *)(v4 + 32) = *MEMORY[0x24BDDFD00];
  v6 = objc_allocWithZone(MEMORY[0x24BDDFD68]);
  type metadata accessor for NLTagScheme(0);
  v7 = v5;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v6, sel_initWithTagSchemes_, isa);

  v10 = (void *)MEMORY[0x24959E374](a1, a2);
  objc_msgSend(v9, sel_setString_, v10);

  if (one-time initialization token for supportGazetteer != -1)
    v11 = swift_once();
  v13 = (void *)static NLGazetteer.supportGazetteer;
  if (static NLGazetteer.supportGazetteer)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_248917480;
    *(_QWORD *)(v14 + 32) = v13;
    specialized Array._endMutation()();
    type metadata accessor for OS_dispatch_source(0, &lazy cache variable for type metadata for NLGazetteer);
    v15 = v13;
    v16 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    objc_msgSend(v9, sel_setGazetteers_forTagScheme_, v16, v7);

  }
  v20 = MEMORY[0x24BEE4AF8];
  v17 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v17 = a1;
  v18 = 7;
  if (((a2 >> 60) & ((a1 & 0x800000000000000) == 0)) != 0)
    v18 = 11;
  MEMORY[0x24BDAC7A8](v11, v18 | (v17 << 16), v12);
  NLTagger.enumerateTags(in:unit:scheme:options:using:)();

  return v20;
}

uint64_t closure #1 in String.businessRelevantEntities()(void *a1, uint64_t a2, uint64_t a3, _QWORD **a4)
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v19;
  unint64_t v20;
  _QWORD *v21;

  if (a1)
  {
    v5 = one-time initialization token for businessNoun;
    v6 = a1;
    if (v5 != -1)
      swift_once();
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v9 = v8;
    if (v7 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v9 == v10)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v12 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v12 & 1) == 0)
      {
LABEL_16:

        return 1;
      }
    }
    v13 = String.subscript.getter();
    v14 = MEMORY[0x24959E3EC](v13);
    v16 = v15;
    swift_bridgeObjectRelease();
    v17 = *a4;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *a4 = v17;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v17 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v17[2] + 1, 1, v17);
      *a4 = v17;
    }
    v20 = v17[2];
    v19 = v17[3];
    if (v20 >= v19 >> 1)
    {
      v17 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v19 > 1), v20 + 1, 1, v17);
      *a4 = v17;
    }
    v17[2] = v20 + 1;
    v21 = &v17[2 * v20];
    v21[4] = v14;
    v21[5] = v16;
    goto LABEL_16;
  }
  return 1;
}

uint64_t String.nounLikeTokens(includePronouns:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  Class isa;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  Class v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<NLTagScheme>);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_248917470;
  v6 = (void *)*MEMORY[0x24BDDFD10];
  *(_QWORD *)(v5 + 32) = *MEMORY[0x24BDDFD10];
  v7 = objc_allocWithZone(MEMORY[0x24BDDFD68]);
  type metadata accessor for NLTagScheme(0);
  v8 = v6;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v7, sel_initWithTagSchemes_, isa);

  v11 = (void *)MEMORY[0x24959E374](a2, a3);
  objc_msgSend(v10, sel_setString_, v11);

  if (one-time initialization token for supportGazetteer != -1)
    v12 = swift_once();
  v14 = (void *)static NLGazetteer.supportGazetteer;
  if (static NLGazetteer.supportGazetteer)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_248917480;
    *(_QWORD *)(v15 + 32) = v14;
    specialized Array._endMutation()();
    type metadata accessor for OS_dispatch_source(0, &lazy cache variable for type metadata for NLGazetteer);
    v16 = v14;
    v17 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    objc_msgSend(v10, sel_setGazetteers_forTagScheme_, v17, v8);

  }
  v21 = MEMORY[0x24BEE4AF8];
  v18 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v18 = a2;
  v19 = 7;
  if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0)
    v19 = 11;
  MEMORY[0x24BDAC7A8](v12, v19 | (v18 << 16), v13);
  NLTagger.enumerateTags(in:unit:scheme:options:using:)();

  return v21;
}

uint64_t closure #1 in String.nounLikeTokens(includePronouns:)(void *a1, uint64_t a2, uint64_t a3, char a4, _QWORD **a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v54;
  unint64_t v55;
  _QWORD *v56;

  if (a1)
  {
    if ((a4 & 1) != 0)
    {
      v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v9 = v8;
      if (v7 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v9 == v10)
      {
        v47 = a1;
        goto LABEL_38;
      }
      v12 = _stringCompareWithSmolCheck(_:_:expecting:)();
      v13 = a1;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v12 & 1) != 0)
        goto LABEL_39;
      if (one-time initialization token for indefinitePronoun != -1)
        swift_once();
      v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v16 = v15;
      if (v14 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v16 == v17)
      {
LABEL_38:
        swift_bridgeObjectRelease_n();
        goto LABEL_39;
      }
      v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v18 & 1) != 0)
        goto LABEL_39;
    }
    else
    {
      v19 = a1;
    }
    v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v22 = v21;
    if (v20 != static String._unconditionallyBridgeFromObjectiveC(_:)() || v22 != v23)
    {
      v25 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v25 & 1) != 0)
        goto LABEL_39;
      v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v28 = v27;
      if (v26 != static String._unconditionallyBridgeFromObjectiveC(_:)() || v28 != v29)
      {
        v31 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v31 & 1) != 0)
          goto LABEL_39;
        v32 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v34 = v33;
        if (v32 != static String._unconditionallyBridgeFromObjectiveC(_:)() || v34 != v35)
        {
          v36 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v36 & 1) != 0)
            goto LABEL_39;
          v37 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          v39 = v38;
          if (v37 != static String._unconditionallyBridgeFromObjectiveC(_:)() || v39 != v40)
          {
            v41 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v41 & 1) != 0)
              goto LABEL_39;
            if (one-time initialization token for peopleNoun != -1)
              swift_once();
            v42 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            v44 = v43;
            if (v42 != static String._unconditionallyBridgeFromObjectiveC(_:)() || v44 != v45)
            {
              v46 = _stringCompareWithSmolCheck(_:_:expecting:)();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if ((v46 & 1) == 0)
              {
LABEL_44:

                return 1;
              }
LABEL_39:
              v48 = String.subscript.getter();
              v49 = MEMORY[0x24959E3EC](v48);
              v51 = v50;
              swift_bridgeObjectRelease();
              v52 = *a5;
              isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
              *a5 = v52;
              if ((isUniquelyReferenced_nonNull_native & 1) == 0)
              {
                v52 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v52[2] + 1, 1, v52);
                *a5 = v52;
              }
              v55 = v52[2];
              v54 = v52[3];
              if (v55 >= v54 >> 1)
              {
                v52 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v54 > 1), v55 + 1, 1, v52);
                *a5 = v52;
              }
              v52[2] = v55 + 1;
              v56 = &v52[2 * v55];
              v56[4] = v49;
              v56[5] = v51;
              goto LABEL_44;
            }
          }
        }
      }
    }
    goto LABEL_38;
  }
  return 1;
}

uint64_t String.properNouns()(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  Class isa;
  id v9;
  void *v10;
  uint64_t v12;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<NLTagScheme>);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_248917470;
  v5 = (void *)*MEMORY[0x24BDDFD10];
  *(_QWORD *)(v4 + 32) = *MEMORY[0x24BDDFD10];
  v6 = objc_allocWithZone(MEMORY[0x24BDDFD68]);
  type metadata accessor for NLTagScheme(0);
  v7 = v5;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v6, sel_initWithTagSchemes_, isa);

  v10 = (void *)MEMORY[0x24959E374](a1, a2);
  objc_msgSend(v9, sel_setString_, v10);

  v12 = MEMORY[0x24BEE4AF8];
  NLTagger.enumerateTags(in:unit:scheme:options:using:)();

  return v12;
}

uint64_t closure #1 in String.properNouns()(void *a1, uint64_t a2, uint64_t a3, _QWORD **a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v31;
  unint64_t v32;
  _QWORD *v33;

  if (a1)
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = v7;
    if (v6 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v8 == v9)
    {
      v24 = a1;
    }
    else
    {
      v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
      v12 = a1;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v11 & 1) != 0)
        goto LABEL_18;
      v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v15 = v14;
      if (v13 != static String._unconditionallyBridgeFromObjectiveC(_:)() || v15 != v16)
      {
        v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v18 & 1) != 0)
          goto LABEL_18;
        v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v21 = v20;
        if (v19 != static String._unconditionallyBridgeFromObjectiveC(_:)() || v21 != v22)
        {
          v23 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v23 & 1) == 0)
          {
LABEL_23:

            return 1;
          }
LABEL_18:
          v25 = String.subscript.getter();
          v26 = MEMORY[0x24959E3EC](v25);
          v28 = v27;
          swift_bridgeObjectRelease();
          v29 = *a4;
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          *a4 = v29;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            v29 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v29[2] + 1, 1, v29);
            *a4 = v29;
          }
          v32 = v29[2];
          v31 = v29[3];
          if (v32 >= v31 >> 1)
          {
            v29 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v31 > 1), v32 + 1, 1, v29);
            *a4 = v29;
          }
          v29[2] = v32 + 1;
          v33 = &v29[2 * v32];
          v33[4] = v26;
          v33[5] = v28;
          goto LABEL_23;
        }
      }
    }
    swift_bridgeObjectRelease_n();
    goto LABEL_18;
  }
  return 1;
}

Swift::String __swiftcall String.firstCaptionNounPhrase()()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  Class isa;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  Class v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  void *v21;
  Swift::String result;
  uint64_t v23;

  v2 = v1;
  v3 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<NLTagScheme>);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_248917470;
  v5 = (void *)*MEMORY[0x24BDDFD00];
  *(_QWORD *)(v4 + 32) = *MEMORY[0x24BDDFD00];
  v6 = objc_allocWithZone(MEMORY[0x24BDDFD68]);
  type metadata accessor for NLTagScheme(0);
  v7 = v5;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v6, sel_initWithTagSchemes_, isa);

  v10 = (void *)MEMORY[0x24959E374](v3, v2);
  objc_msgSend(v9, sel_setString_, v10);

  if (one-time initialization token for supportGazetteer != -1)
    swift_once();
  v11 = (void *)static NLGazetteer.supportGazetteer;
  if (static NLGazetteer.supportGazetteer)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_248917480;
    *(_QWORD *)(v12 + 32) = v11;
    v23 = v12;
    specialized Array._endMutation()();
    type metadata accessor for OS_dispatch_source(0, &lazy cache variable for type metadata for NLGazetteer);
    v13 = v11;
    v14 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    objc_msgSend(v9, sel_setGazetteers_forTagScheme_, v14, v7, v23);

  }
  v15 = specialized CaptionPhraseResolver.uninterestingCaptionsConfiguration()();
  if (v15)
  {
    v15 = specialized CaptionPhraseResolver.disallowedCaptionTokensConfiguration()();
    if (!v15)
      v15 = swift_bridgeObjectRelease();
  }
  v17 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0)
    v17 = v3;
  v18 = 7;
  if (((v2 >> 60) & ((v3 & 0x800000000000000) == 0)) != 0)
    v18 = 11;
  MEMORY[0x24BDAC7A8](v15, v18 | (v17 << 16), v16);
  NLTagger.enumerateTags(in:unit:scheme:options:using:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v19 = String.nounPhrasesContaining(_:isProperNoun:allowConjunctions:)(0, 0xE000000000000000, 0, 1, v3, v2);
  swift_bridgeObjectRelease();
  if (v19[2])
  {
    v3 = v19[4];
    v2 = v19[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

  }
  else
  {
    swift_bridgeObjectRelease();

    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  v20 = v3;
  v21 = (void *)v2;
  result._object = v21;
  result._countAndFlagsBits = v20;
  return result;
}

uint64_t closure #1 in String.firstCaptionNounPhrase()(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7)
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;

  if (a1)
    v10 = a1;
  else
    v10 = (id)*MEMORY[0x24BDDFCC0];
  v11 = a1;
  v12 = String.subscript.getter();
  v13 = MEMORY[0x24959E3EC](v12);
  v15 = v14;
  swift_bridgeObjectRelease();
  if (one-time initialization token for peopleNoun != -1)
    swift_once();
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v18 = v17;
  if (v16 != static String._unconditionallyBridgeFromObjectiveC(_:)() || v18 != v19)
  {
    v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v20 & 1) != 0)
      goto LABEL_10;
    v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v25 = v24;
    if (v23 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v25 == v26)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v27 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v27 & 1) == 0)
      {

        goto LABEL_20;
      }
    }
    swift_bridgeObjectRetain();
    v28 = specialized CaptionPhraseResolver.hasUninterestingCaption(with:languageCode:)(v13, v15, 28261, 0xE200000000000000, a7);
    swift_bridgeObjectRelease();

    if ((v28 & 1) == 0)
      goto LABEL_11;
LABEL_20:
    v21 = 1;
    goto LABEL_12;
  }
  swift_bridgeObjectRelease_n();
LABEL_10:

LABEL_11:
  v21 = 0;
  *a6 = v13;
  a6[1] = v15;
LABEL_12:
  swift_bridgeObjectRelease();
  return v21;
}

_QWORD *String.nounPhrasesContaining(_:isProperNoun:allowConjunctions:)(uint64_t a1, uint64_t a2, char a3, char a4, uint64_t a5, unint64_t a6)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  Class isa;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  Class v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t inited;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  void **v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  _QWORD *v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  void *v76;
  id v77;
  _BOOL4 v78;
  id v79;
  uint64_t v80;
  void *v81;
  id v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  _QWORD *v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  _QWORD *v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char v123;
  id v124;
  unint64_t v125;
  void *v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  char v133;
  id v134;
  id v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  char v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  char v146;
  id v147;
  id v148;
  unint64_t v149;
  id v150;
  id v151;
  void *v152;
  void *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  id v159;
  id v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  char v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  char v172;
  int64_t v173;
  void *v174;
  void *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  char v181;
  id v182;
  id v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  char v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  char v194;
  id v195;
  id v196;
  unint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  unint64_t v202;
  unint64_t v203;
  _QWORD *v204;
  void *v206;
  uint64_t v207;
  uint64_t v208;
  void *v209;
  uint64_t v210;
  id v213;
  unint64_t v214;
  void *v215;
  _QWORD *v216;
  id v217;
  unint64_t v218;
  unint64_t v219;
  void *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  char v224;
  uint64_t v225;
  uint64_t v226;
  void *v227;
  uint64_t v228;
  id v229;
  uint64_t v230;
  uint64_t v231;

  LOBYTE(v6) = a4;
  LOBYTE(v7) = (a3 & 1) != 0 || String.looksLikeAnAcronym()();
  lazy protocol witness table accessor for type String and conformance String();
  StringProtocol.localizedLowercase.getter();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<NLTagScheme>);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_248917470;
  v9 = (void *)*MEMORY[0x24BDDFD00];
  *(_QWORD *)(v8 + 32) = *MEMORY[0x24BDDFD00];
  v10 = objc_allocWithZone(MEMORY[0x24BDDFD68]);
  type metadata accessor for NLTagScheme(0);
  v11 = v9;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v10, sel_initWithTagSchemes_, isa);

  v14 = (void *)MEMORY[0x24959E374](a5, a6);
  v206 = v13;
  objc_msgSend(v13, sel_setString_, v14);

  if (one-time initialization token for supportGazetteer != -1)
    goto LABEL_206;
  while (1)
  {
    v17 = (void *)static NLGazetteer.supportGazetteer;
    if (static NLGazetteer.supportGazetteer)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
      v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_248917480;
      *(_QWORD *)(v18 + 32) = v17;
      specialized Array._endMutation()();
      type metadata accessor for OS_dispatch_source(0, &lazy cache variable for type metadata for NLGazetteer);
      v19 = v17;
      v20 = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      objc_msgSend(v206, sel_setGazetteers_forTagScheme_, v20, v11);

    }
    v230 = MEMORY[0x24BEE4AF8];
    v231 = MEMORY[0x24BEE4AF8];
    v21 = HIBYTE(a6) & 0xF;
    if ((a6 & 0x2000000000000000) == 0)
      v21 = a5;
    v22 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0)
      v22 = 11;
    MEMORY[0x24BDAC7A8](v15, v22 | (v21 << 16), v16);
    NLTagger.enumerateTags(in:unit:scheme:options:using:)();
    swift_bridgeObjectRelease();
    if (!*(_QWORD *)(v230 + 16))
    {
      swift_bridgeObjectRelease();

      v7 = (_QWORD *)MEMORY[0x24BEE4AF8];
      goto LABEL_189;
    }
    v224 = (char)v6;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<NLTag>);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_248917490;
    v24 = (void *)*MEMORY[0x24BDDFCA8];
    v25 = (void *)*MEMORY[0x24BDDFCC8];
    *(_QWORD *)(inited + 32) = *MEMORY[0x24BDDFCA8];
    *(_QWORD *)(inited + 40) = v25;
    v26 = one-time initialization token for article;
    v217 = v24;
    v229 = v25;
    if (v26 != -1)
      swift_once();
    v27 = (void *)static NLTag.article;
    v28 = (void *)*MEMORY[0x24BDDFCB0];
    *(_QWORD *)(inited + 48) = static NLTag.article;
    *(_QWORD *)(inited + 56) = v28;
    v29 = (void *)*MEMORY[0x24BDDFC98];
    v30 = (void *)*MEMORY[0x24BDDFD28];
    *(_QWORD *)(inited + 64) = *MEMORY[0x24BDDFC98];
    *(_QWORD *)(inited + 72) = v30;
    v31 = (void *)*MEMORY[0x24BDDFC88];
    *(_QWORD *)(inited + 80) = *MEMORY[0x24BDDFC88];
    v32 = one-time initialization token for joiningPreposition;
    v33 = v27;
    v34 = v28;
    v35 = v29;
    v36 = v30;
    v37 = v31;
    if (v32 != -1)
      swift_once();
    v38 = (void *)static NLTag.joiningPreposition;
    *(_QWORD *)(inited + 88) = static NLTag.joiningPreposition;
    v39 = (void **)MEMORY[0x24BDDFCD0];
    if ((v7 & 1) != 0)
    {
      v40 = v38;
      swift_bridgeObjectRelease();
      inited = swift_allocObject();
      *(_OWORD *)(inited + 16) = xmmword_2489174B0;
      v41 = (void *)*MEMORY[0x24BDDFCB8];
      v42 = *v39;
      *(_QWORD *)(inited + 32) = *MEMORY[0x24BDDFCB8];
      *(_QWORD *)(inited + 40) = v42;
      v43 = (void *)*MEMORY[0x24BDDFCD8];
      *(_QWORD *)(inited + 48) = *MEMORY[0x24BDDFCD8];
      *(_QWORD *)(inited + 56) = v229;
      v44 = static NLTag.article;
      *(_QWORD *)(inited + 64) = static NLTag.article;
      *(_QWORD *)(inited + 72) = v34;
      v45 = v44;
      v209 = (void *)v44;
      v46 = swift_allocObject();
      *(_OWORD *)(v46 + 16) = xmmword_2489174D0;
      *(_QWORD *)(v46 + 32) = v41;
      *(_QWORD *)(v46 + 40) = v42;
      *(_QWORD *)(v46 + 48) = v43;
      *(_QWORD *)(v46 + 56) = v45;
      v223 = v46;
      *(_QWORD *)(v46 + 64) = v34;
      v47 = swift_allocObject();
      *(_OWORD *)(v47 + 16) = xmmword_2489174B0;
      *(_QWORD *)(v47 + 32) = v41;
      *(_QWORD *)(v47 + 40) = v42;
      *(_QWORD *)(v47 + 48) = v43;
      *(_QWORD *)(v47 + 56) = v229;
      v48 = v217;
      *(_QWORD *)(v47 + 64) = v217;
      *(_QWORD *)(v47 + 72) = v34;
      v225 = v47;
      v49 = swift_allocObject();
      *(_OWORD *)(v49 + 16) = xmmword_2489174D0;
      *(_QWORD *)(v49 + 32) = v41;
      *(_QWORD *)(v49 + 40) = v42;
      *(_QWORD *)(v49 + 48) = v43;
      *(_QWORD *)(v49 + 56) = v217;
      v222 = v49;
      *(_QWORD *)(v49 + 64) = v34;
      v50 = v41;
      v51 = v42;
      v52 = v43;
      v53 = v34;
      v54 = v50;
      v55 = v51;
      v56 = v52;
      v57 = v53;
      v213 = v54;
      v58 = v229;
      v6 = v55;
      v59 = v56;
      v60 = v57;
      v61 = v209;
      v227 = v209;
      v220 = v229;
      v215 = v217;
    }
    else
    {
      v220 = v36;
      v227 = v35;
      v62 = v217;
      if ((v224 & 1) != 0)
      {
        v63 = v38;
        swift_bridgeObjectRelease();
        inited = swift_allocObject();
        *(_OWORD *)(inited + 16) = xmmword_2489174A0;
        *(_QWORD *)(inited + 32) = v217;
        *(_QWORD *)(inited + 40) = v229;
        v64 = (void *)static NLTag.article;
        *(_QWORD *)(inited + 48) = static NLTag.article;
        *(_QWORD *)(inited + 56) = v34;
        *(_QWORD *)(inited + 64) = v35;
        *(_QWORD *)(inited + 72) = v220;
        v65 = (void *)static NLTag.joiningPreposition;
        *(_QWORD *)(inited + 80) = v37;
        *(_QWORD *)(inited + 88) = v65;
        v66 = (void *)*MEMORY[0x24BDDFC90];
        *(_QWORD *)(inited + 96) = *MEMORY[0x24BDDFC90];
        v226 = one-time initialization token for peopleNoun;
        v67 = v217;
        v68 = v229;
        v69 = v64;
        v70 = v34;
        v71 = v35;
        v72 = v220;
        v73 = v37;
        v74 = v65;
        v75 = v66;
        if (v226 != -1)
          swift_once();
        v76 = (void *)static NLTag.peopleNoun;
        v39 = (void **)MEMORY[0x24BDDFCD0];
        v38 = (void *)*MEMORY[0x24BDDFCD0];
        *(_QWORD *)(inited + 104) = static NLTag.peopleNoun;
        *(_QWORD *)(inited + 112) = v38;
        v77 = v76;
        v78 = 1;
        v62 = v217;
      }
      else
      {
        v78 = one-time initialization token for peopleNoun == -1;
      }
      v79 = v38;
      v80 = swift_allocObject();
      *(_OWORD *)(v80 + 16) = xmmword_2489174B0;
      *(_QWORD *)(v80 + 32) = v37;
      *(_QWORD *)(v80 + 40) = v62;
      v81 = (void *)static NLTag.article;
      *(_QWORD *)(v80 + 48) = static NLTag.article;
      *(_QWORD *)(v80 + 56) = v34;
      v6 = v37;
      v58 = v62;
      v82 = v81;
      v83 = v34;
      if (!v78)
        swift_once();
      v55 = (_QWORD *)static NLTag.peopleNoun;
      v57 = *v39;
      *(_QWORD *)(v80 + 64) = static NLTag.peopleNoun;
      *(_QWORD *)(v80 + 72) = v57;
      v223 = v80;
      v84 = swift_allocObject();
      *(_OWORD *)(v84 + 16) = xmmword_248917490;
      v60 = v229;
      *(_QWORD *)(v84 + 32) = v58;
      *(_QWORD *)(v84 + 40) = v229;
      *(_QWORD *)(v84 + 48) = v227;
      *(_QWORD *)(v84 + 56) = v220;
      v215 = (void *)static NLTag.joiningPreposition;
      *(_QWORD *)(v84 + 64) = static NLTag.joiningPreposition;
      *(_QWORD *)(v84 + 72) = v55;
      *(_QWORD *)(v84 + 80) = v57;
      *(_QWORD *)(v84 + 88) = v6;
      v225 = v84;
      v85 = swift_allocObject();
      *(_OWORD *)(v85 + 16) = xmmword_2489174C0;
      v56 = v55;
      v48 = v55;
      *(_QWORD *)(v85 + 32) = v6;
      *(_QWORD *)(v85 + 40) = v58;
      v222 = v85;
      *(_QWORD *)(v85 + 48) = v55;
      v213 = v57;
      v61 = v6;
      v59 = v58;
    }
    v86 = v55;
    v87 = v56;
    v88 = v57;
    v89 = v58;
    v90 = v61;
    v91 = v48;
    v92 = v213;
    v93 = v6;
    v94 = v59;
    v95 = v60;
    v96 = v227;
    v97 = v220;
    v98 = v215;
    v99 = v230;
    v210 = *(_QWORD *)(v230 + 16);
    if (!v210)
      break;
    v207 = *(_QWORD *)(v231 + 16) - 1;
    v208 = v230 + 32;
    v228 = v231 + 32;
    swift_bridgeObjectRetain();
    v100 = 0;
    v7 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v11 = v225;
    while (v100 < *(_QWORD *)(v99 + 16))
    {
      v216 = v7;
      v101 = *(_QWORD *)(v208 + 8 * v100);
      v102 = v101;
      v221 = v101;
      v214 = v100;
      if (v101 < 1)
        goto LABEL_98;
      if ((unint64_t)v101 >= *(_QWORD *)(v231 + 16))
        goto LABEL_203;
      v7 = *(_QWORD **)(inited + 16);
      v102 = *(_QWORD *)(v208 + 8 * v100);
      if (!v7)
        goto LABEL_98;
      v103 = *(_QWORD *)(v208 + 8 * v100);
      while (1)
      {
        v104 = *(void **)(v228 + 24 * v103);
        v105 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v107 = v106;
        if (v105 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v107 == v108)
        {
          swift_bridgeObjectRetain_n();
          v124 = v104;
LABEL_57:
          swift_bridgeObjectRelease_n();
          goto LABEL_58;
        }
        v110 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRetain_n();
        v111 = v104;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v110 & 1) != 0)
          goto LABEL_58;
        if (v7 == (_QWORD *)1)
          break;
        v112 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v114 = v113;
        if (v112 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v114 == v115)
        {
LABEL_56:
          v11 = v225;
          goto LABEL_57;
        }
        v117 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v11 = v225;
        if ((v117 & 1) != 0)
          goto LABEL_58;
        if (v7 == (_QWORD *)2)
          break;
        v11 = 6;
        while (1)
        {
          v6 = (_QWORD *)(v11 - 3);
          if (__OFADD__(v11 - 4, 1))
            goto LABEL_190;
          v118 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          v120 = v119;
          if (v118 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v120 == v121)
            goto LABEL_56;
          v123 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v123 & 1) != 0)
            break;
          ++v11;
          if (v6 == v7)
            goto LABEL_63;
        }
        v11 = v225;
LABEL_58:
        swift_bridgeObjectRelease_n();

        if (v103 < 2)
        {
          v103 = 0;
          goto LABEL_64;
        }
        if ((unint64_t)--v103 >= *(_QWORD *)(v231 + 16))
        {
          __break(1u);
LABEL_190:
          __break(1u);
LABEL_191:
          __break(1u);
          goto LABEL_192;
        }
      }
LABEL_63:
      swift_bridgeObjectRelease_n();

      v11 = v225;
LABEL_64:
      v101 = v221;
      if (v103 >= v221)
      {
        v102 = v103;
        goto LABEL_98;
      }
      v7 = *(_QWORD **)(v223 + 16);
      v125 = v103;
LABEL_68:
      if (v103 < 0)
        goto LABEL_194;
      if (v125 >= *(_QWORD *)(v231 + 16))
      {
LABEL_195:
        __break(1u);
        break;
      }
      if (!v7)
        goto LABEL_67;
      v218 = v125;
      v126 = *(void **)(v228 + 24 * v125);
      LOBYTE(v6) = v223;
      v127 = *(void **)(v223 + 32);
      v128 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v130 = v129;
      if (v128 != static String._unconditionallyBridgeFromObjectiveC(_:)() || v130 != v131)
      {
        v133 = _stringCompareWithSmolCheck(_:_:expecting:)();
        v134 = v126;
        v135 = v127;
        swift_bridgeObjectRetain();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v133 & 1) != 0)
          goto LABEL_95;
        if (v7 != (_QWORD *)1)
        {
          v136 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          v138 = v137;
          if (v136 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v138 == v139)
          {
LABEL_91:

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease_n();
            goto LABEL_97;
          }
          v140 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v140 & 1) != 0)
          {
LABEL_92:

            goto LABEL_96;
          }
          if (v7 != (_QWORD *)2)
          {
            v11 = 6;
            while (1)
            {
              v6 = (_QWORD *)(v11 - 3);
              if (__OFADD__(v11 - 4, 1))
                break;
              v141 = static String._unconditionallyBridgeFromObjectiveC(_:)();
              v143 = v142;
              if (v141 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v143 == v144)
                goto LABEL_91;
              v146 = _stringCompareWithSmolCheck(_:_:expecting:)();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if ((v146 & 1) != 0)
                goto LABEL_92;
              ++v11;
              if (v6 == v7)
                goto LABEL_66;
            }
LABEL_192:
            __break(1u);
            goto LABEL_193;
          }
        }
LABEL_66:

        swift_bridgeObjectRelease();
        v11 = v225;
        v101 = v221;
        v125 = v218;
LABEL_67:
        if (++v125 == v101)
        {
          v102 = v101;
          goto LABEL_98;
        }
        goto LABEL_68;
      }
      v147 = v126;
      v148 = v127;
      swift_bridgeObjectRetain();

      swift_bridgeObjectRelease_n();
LABEL_95:

LABEL_96:
      swift_bridgeObjectRelease();
LABEL_97:
      v11 = v225;
      v101 = v221;
      v102 = v218;
LABEL_98:
      if (v101 >= v207)
      {
LABEL_133:
        v149 = v101;
        goto LABEL_172;
      }
      if (v101 < 0)
        goto LABEL_204;
      if ((unint64_t)v101 >= *(_QWORD *)(v231 + 16))
        goto LABEL_205;
      v7 = *(_QWORD **)(v11 + 16);
      if (!v7)
        goto LABEL_133;
      v219 = v102;
      v149 = v101;
      while (2)
      {
        v152 = *(void **)(v228 + 24 * v149);
        v153 = *(void **)(v11 + 32);
        v154 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v156 = v155;
        if (v154 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v156 == v157)
        {
          v150 = v152;
          v151 = v153;
          swift_bridgeObjectRetain();

          swift_bridgeObjectRelease_n();
LABEL_104:

          goto LABEL_105;
        }
        LOBYTE(v6) = _stringCompareWithSmolCheck(_:_:expecting:)();
        v159 = v152;
        v160 = v153;
        swift_bridgeObjectRetain();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v6 & 1) != 0)
          goto LABEL_104;
        if (v7 == (_QWORD *)1)
        {
LABEL_134:

          v11 = v225;
          goto LABEL_135;
        }
        v11 = v225;
        v161 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v163 = v162;
        if (v161 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v163 == v164)
        {

LABEL_120:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          goto LABEL_106;
        }
        v166 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v166 & 1) != 0)
        {

          goto LABEL_105;
        }
        if (v7 != (_QWORD *)2)
        {
          v11 = 6;
          while (1)
          {
            v6 = (_QWORD *)(v11 - 3);
            if (__OFADD__(v11 - 4, 1))
              goto LABEL_191;
            v167 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            v169 = v168;
            if (v167 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v169 == v170)
            {

              v11 = v225;
              goto LABEL_120;
            }
            v172 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v172 & 1) != 0)
              break;
            ++v11;
            if (v6 == v7)
              goto LABEL_134;
          }

          v11 = v225;
LABEL_105:
          swift_bridgeObjectRelease();
LABEL_106:
          if ((uint64_t)++v149 >= *(_QWORD *)(v231 + 16) - 1)
            goto LABEL_136;
          continue;
        }
        break;
      }

LABEL_135:
      swift_bridgeObjectRelease();
LABEL_136:
      v173 = v221;
      if (v221 < (uint64_t)v149)
      {
        v7 = *(_QWORD **)(v222 + 16);
        v102 = v219;
        while (1)
        {
          if ((v149 & 0x8000000000000000) != 0)
            goto LABEL_201;
          if (v149 >= *(_QWORD *)(v231 + 16))
            goto LABEL_202;
          if (v7)
          {
            v174 = *(void **)(v228 + 24 * v149);
            LOBYTE(v6) = v222;
            v175 = *(void **)(v222 + 32);
            v176 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            v178 = v177;
            if (v176 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v178 == v179)
            {
              v195 = v174;
              v196 = v175;
              swift_bridgeObjectRetain();

              swift_bridgeObjectRelease_n();
LABEL_168:

LABEL_169:
              swift_bridgeObjectRelease();
LABEL_170:
              v11 = v225;
              break;
            }
            v181 = _stringCompareWithSmolCheck(_:_:expecting:)();
            v182 = v174;
            v183 = v175;
            swift_bridgeObjectRetain();

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v181 & 1) != 0)
              goto LABEL_168;
            if (v7 == (_QWORD *)1)
            {
LABEL_138:

              swift_bridgeObjectRelease();
              v11 = v225;
            }
            else
            {
              v184 = static String._unconditionallyBridgeFromObjectiveC(_:)();
              v186 = v185;
              if (v184 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v186 == v187)
              {
LABEL_164:

                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease_n();
                goto LABEL_170;
              }
              v188 = _stringCompareWithSmolCheck(_:_:expecting:)();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              v11 = v225;
              if ((v188 & 1) != 0)
              {

                swift_bridgeObjectRelease();
                break;
              }
              if (v7 != (_QWORD *)2)
              {
                v11 = 6;
                while (1)
                {
                  v6 = (_QWORD *)(v11 - 3);
                  if (__OFADD__(v11 - 4, 1))
                    break;
                  v189 = static String._unconditionallyBridgeFromObjectiveC(_:)();
                  v191 = v190;
                  if (v189 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v191 == v192)
                    goto LABEL_164;
                  v194 = _stringCompareWithSmolCheck(_:_:expecting:)();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  if ((v194 & 1) != 0)
                  {

                    goto LABEL_169;
                  }
                  ++v11;
                  if (v6 == v7)
                    goto LABEL_138;
                }
LABEL_193:
                __break(1u);
LABEL_194:
                __break(1u);
                goto LABEL_195;
              }

              swift_bridgeObjectRelease();
            }
            v173 = v221;
            v102 = v219;
          }
          if (v173 >= (uint64_t)--v149)
          {
            v149 = v173;
            goto LABEL_172;
          }
        }
      }
      v102 = v219;
LABEL_172:
      v7 = v216;
      if ((v102 & 0x8000000000000000) != 0)
        goto LABEL_197;
      v197 = *(_QWORD *)(v231 + 16);
      if (v102 >= v197)
        goto LABEL_198;
      if (v149 >= v197)
        goto LABEL_199;
      if (*(_QWORD *)(v228 + 24 * v149 + 16) >> 14 < *(_QWORD *)(v228 + 24 * v102 + 8) >> 14)
        goto LABEL_200;
      v198 = String.subscript.getter();
      v199 = MEMORY[0x24959E3EC](v198);
      v201 = v200;
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v7 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v216[2] + 1, 1, v216);
      v99 = v230;
      v203 = v7[2];
      v202 = v7[3];
      if (v203 >= v202 >> 1)
        v7 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v202 > 1), v203 + 1, 1, v7);
      v100 = v214 + 1;
      v7[2] = v203 + 1;
      v204 = &v7[2 * v203];
      v204[4] = v199;
      v204[5] = v201;
      if (v214 + 1 == v210)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_188;
      }
    }
    __break(1u);
LABEL_197:
    __break(1u);
LABEL_198:
    __break(1u);
LABEL_199:
    __break(1u);
LABEL_200:
    __break(1u);
LABEL_201:
    __break(1u);
LABEL_202:
    __break(1u);
LABEL_203:
    __break(1u);
LABEL_204:
    __break(1u);
LABEL_205:
    __break(1u);
LABEL_206:
    v15 = swift_once();
  }
  swift_bridgeObjectRelease();
  v7 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_188:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

LABEL_189:
  swift_bridgeObjectRelease();
  return v7;
}

Swift::String_optional __swiftcall String.shortenedCaptionPhrase()()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  Class isa;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  void *v46;
  Swift::String_optional result;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD v56[4];

  v2 = v1;
  v3 = v0;
  v4 = type metadata accessor for CharacterSet();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6, v7);
  v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = MEMORY[0x24BEE4AF8];
  v11 = (uint64_t *)(v10 + 16);
  v49 = v3;
  v50 = v2;
  v56[1] = 15;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PartialRangeFrom<String.Index>);
  lazy protocol witness table accessor for type String and conformance String();
  lazy protocol witness table accessor for type [String] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type PartialRangeFrom<String.Index> and conformance PartialRangeFrom<A>, &demangling cache variable for type metadata for PartialRangeFrom<String.Index>, MEMORY[0x24BEE2C50]);
  StringProtocol.enumerateSubstrings<A>(in:options:_:)();
  swift_release();
  swift_beginAccess();
  v12 = *v11;
  swift_bridgeObjectRetain();
  swift_release();
  v13 = *(_QWORD *)(v12 + 16);
  swift_bridgeObjectRelease();
  if (v13 < 6)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<NLTagScheme>);
    v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_248917470;
    v15 = (void *)*MEMORY[0x24BDDFD00];
    *(_QWORD *)(v14 + 32) = *MEMORY[0x24BDDFD00];
    v16 = objc_allocWithZone(MEMORY[0x24BDDFD68]);
    type metadata accessor for NLTagScheme(0);
    v17 = v15;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v19 = objc_msgSend(v16, sel_initWithTagSchemes_, isa);

    v20 = (void *)MEMORY[0x24959E374](v3, v2);
    objc_msgSend(v19, sel_setString_, v20);

    v23 = HIBYTE(v2) & 0xF;
    if ((v2 & 0x2000000000000000) == 0)
      v23 = v3;
    v55 = -1;
    v56[0] = -1;
    v53 = -1;
    v54 = -1;
    v24 = 11;
    if (((v2 >> 60) & ((v3 & 0x800000000000000) == 0)) == 0)
      v24 = 7;
    MEMORY[0x24BDAC7A8](v21, v24 | (v23 << 16), v22);
    *(&v48 - 6) = (uint64_t)v56;
    *(&v48 - 5) = v3;
    *(&v48 - 4) = v2;
    *(&v48 - 3) = (uint64_t)&v53;
    *(&v48 - 2) = (uint64_t)&v54;
    *(&v48 - 1) = (uint64_t)&v55;
    NLTagger.enumerateTags(in:unit:scheme:options:using:)();
    v25 = v53;
    if (v55 == -1 || v53 >= v55)
    {
      swift_bridgeObjectRetain();
      if (v25 < 0)
        v25 = String.count.getter();
      v37 = specialized Collection.prefix(_:)(v25);
      v39 = v38;
      v41 = v40;
      v43 = v42;
      swift_bridgeObjectRelease();
      v3 = MEMORY[0x24959E3EC](v37, v39, v41, v43);
      v2 = v44;
      swift_bridgeObjectRelease();
    }
    else
    {
      String.index(_:offsetBy:)();
      swift_bridgeObjectRetain();
      v26 = String.subscript.getter();
      v28 = v27;
      v30 = v29;
      v32 = v31;
      swift_bridgeObjectRelease();
      v49 = v26;
      v50 = v28;
      v51 = v30;
      v52 = v32;
      static CharacterSet.whitespacesAndNewlines.getter();
      lazy protocol witness table accessor for type Substring and conformance Substring();
      v33 = StringProtocol.trimmingCharacters(in:)();
      v35 = v34;
      (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v4);
      swift_bridgeObjectRelease();
      v49 = v33;
      v50 = v35;
      v3 = String.init<A>(_:)();
      v2 = v36;
    }

  }
  v45 = v3;
  v46 = (void *)v2;
  result.value._object = v46;
  result.value._countAndFlagsBits = v45;
  return result;
}

uint64_t String.tokens()()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = MEMORY[0x24BEE4AF8];
  v1 = (uint64_t *)(v0 + 16);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PartialRangeFrom<String.Index>);
  lazy protocol witness table accessor for type String and conformance String();
  lazy protocol witness table accessor for type [String] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type PartialRangeFrom<String.Index> and conformance PartialRangeFrom<A>, &demangling cache variable for type metadata for PartialRangeFrom<String.Index>, MEMORY[0x24BEE2C50]);
  StringProtocol.enumerateSubstrings<A>(in:options:_:)();
  swift_release();
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  swift_release();
  return v2;
}

uint64_t closure #1 in String.shortenedCaptionPhrase()(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t *a7, uint64_t *a8, uint64_t *a9)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  id v62;

  if (!a1)
    return 1;
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v14 = v13;
  if (v12 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v14 == v15)
  {
    v30 = a1;
    goto LABEL_18;
  }
  v17 = _stringCompareWithSmolCheck(_:_:expecting:)();
  v18 = a1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v17 & 1) != 0)
    goto LABEL_19;
  v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v21 = v20;
  if (v19 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v21 == v22)
  {
LABEL_18:
    swift_bridgeObjectRelease_n();
    goto LABEL_19;
  }
  v24 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v24 & 1) == 0)
  {
    v25 = one-time initialization token for indefinitePronoun;
    v62 = v18;
    if (v25 != -1)
      swift_once();
    v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v28 = v27;
    if (v26 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v28 == v29)
      goto LABEL_16;
    v33 = _stringCompareWithSmolCheck(_:_:expecting:)();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v33 & 1) != 0)
      goto LABEL_19;
    v34 = one-time initialization token for businessNoun;
    v62 = v62;
    if (v34 != -1)
      swift_once();
    v35 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v37 = v36;
    if (v35 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v37 == v38)
    {
LABEL_16:

    }
    else
    {
      v39 = _stringCompareWithSmolCheck(_:_:expecting:)();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v39 & 1) != 0)
        goto LABEL_19;
      v40 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v42 = v41;
      if (v40 != static String._unconditionallyBridgeFromObjectiveC(_:)() || v42 != v43)
      {
        v44 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v44 & 1) != 0)
          goto LABEL_19;
        v45 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v47 = v46;
        if (v45 != static String._unconditionallyBridgeFromObjectiveC(_:)() || v47 != v48)
        {
          v49 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v49 & 1) != 0)
            goto LABEL_19;
          v50 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          v52 = v51;
          if (v50 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v52 == v53)
          {
            swift_bridgeObjectRelease_n();
          }
          else
          {
            v54 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v54 & 1) == 0)
            {
              v56 = static String._unconditionallyBridgeFromObjectiveC(_:)();
              v58 = v57;
              if (v56 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v58 == v59)
              {
                swift_bridgeObjectRelease_n();
              }
              else
              {
                v60 = _stringCompareWithSmolCheck(_:_:expecting:)();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                if ((v60 & 1) == 0)
                  goto LABEL_48;
              }
              if (*a8 == -1)
              {
                v61 = String.distance(from:to:)();

                *a8 = v61;
                return 1;
              }
              goto LABEL_48;
            }
          }
          if (*a4 != -1 && *a4 < String.distance(from:to:)())
          {
            v55 = String.distance(from:to:)();

            *a9 = v55;
            return 1;
          }
LABEL_48:

          return 1;
        }
      }
    }
    goto LABEL_18;
  }
LABEL_19:
  *a4 = String.distance(from:to:)();
  if (*a7 == -1)
  {
    v31 = String.distance(from:to:)();

    *a7 = v31;
  }
  else
  {

  }
  *a8 = -1;
  return 1;
}

uint64_t closure #1 in String.nounPhrasesContaining(_:isProperNoun:allowConjunctions:)(void *a1, uint64_t a2, uint64_t a3, _QWORD *a4, _QWORD **a5, uint64_t a6, uint64_t a7, uint64_t a8, _QWORD *a9, _QWORD **a10)
{
  id v15;
  _QWORD *v16;
  id v17;
  id v18;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  char v40;
  _QWORD *v41;
  char v42;
  unint64_t v43;
  unint64_t v44;
  char v45;

  if (a1)
    v15 = a1;
  else
    v15 = (id)*MEMORY[0x24BDDFCC0];
  v16 = *a5;
  v17 = a1;
  v18 = v15;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a5 = v16;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v16 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v16[2] + 1, 1, v16);
    *a5 = v16;
  }
  v21 = v16[2];
  v20 = v16[3];
  if (v21 >= v20 >> 1)
    v16 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v20 > 1), v21 + 1, 1, v16);
  v16[2] = v21 + 1;
  v22 = &v16[3 * v21];
  v22[4] = v18;
  v22[5] = a2;
  v22[6] = a3;
  *a5 = v16;
  v23 = String.subscript.getter();
  v24 = (_QWORD *)MEMORY[0x24959E3EC](v23);
  v26 = v25;
  swift_bridgeObjectRelease();
  v27 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v29 = v28;
  if (v27 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v29 == v30)
    goto LABEL_17;
  v32 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v32 & 1) != 0)
    goto LABEL_18;
  if (one-time initialization token for peopleNoun != -1)
    swift_once();
  v33 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v35 = v34;
  if (v33 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v35 == v36)
  {
LABEL_17:
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v45 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v45 & 1) == 0)
      goto LABEL_28;
  }
LABEL_18:
  v35 = a9;
  v37 = String.count.getter();
  if (v37 != String.count.getter())
  {
LABEL_28:
    swift_bridgeObjectRelease();
    goto LABEL_29;
  }
  lazy protocol witness table accessor for type String and conformance String();
  v38 = StringProtocol.localizedLowercase.getter();
  v24 = v39;
  swift_bridgeObjectRelease();
  if (v38 == a8 && v24 == a9)
  {
    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  v40 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if ((v40 & 1) == 0)
  {
LABEL_29:

    v41 = a4;
    goto LABEL_30;
  }
LABEL_23:
  v26 = a10;
  v41 = a4;
  v35 = (_QWORD *)*a4;
  v24 = *a10;
  v42 = swift_isUniquelyReferenced_nonNull_native();
  *a10 = v24;
  if ((v42 & 1) == 0)
    goto LABEL_33;
  while (1)
  {
    v44 = v24[2];
    v43 = v24[3];
    if (v44 >= v43 >> 1)
      v24 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v43 > 1), v44 + 1, 1, v24);
    v24[2] = v44 + 1;
    v24[v44 + 4] = v35;
    *v26 = v24;

LABEL_30:
    if (!__OFADD__(*v41, 1))
      break;
    __break(1u);
LABEL_33:
    v24 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v24[2] + 1, 1, v24);
    *v26 = v24;
  }
  ++*v41;
  return 1;
}

uint64_t closure #1 in String.tokens()(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  _QWORD **v10;
  _QWORD *v11;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;

  if (a2)
  {
    v9 = result;
    v10 = (_QWORD **)(a8 + 16);
    swift_beginAccess();
    v11 = *v10;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v10 = v11;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v11 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v11[2] + 1, 1, v11);
      *v10 = v11;
    }
    v14 = v11[2];
    v13 = v11[3];
    if (v14 >= v13 >> 1)
    {
      v11 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v13 > 1), v14 + 1, 1, v11);
      *v10 = v11;
    }
    v11[2] = v14 + 1;
    v15 = &v11[2 * v14];
    v15[4] = v9;
    v15[5] = a2;
    return swift_endAccess();
  }
  return result;
}

uint64_t String.rangeToInt(from:)()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<Int>);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_2489174E0;
  lazy protocol witness table accessor for type String and conformance String();
  *(_QWORD *)(v0 + 32) = String.Index.utf16Offset<A>(in:)();
  *(_QWORD *)(v0 + 40) = String.Index.utf16Offset<A>(in:)();
  return v0;
}

Swift::String __swiftcall String.slice(from:to:)(Swift::Int from, Swift::Int to)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  Swift::String result;

  v2 = 0;
  v3 = 0xE000000000000000;
  if ((from & 0x8000000000000000) == 0 && from < to)
  {
    if (String.count.getter() >= to)
    {
      v4 = String.index(_:offsetBy:)();
      v5 = String.index(_:offsetBy:)();
      if (v5 >> 14 < v4 >> 14)
      {
        __break(1u);
        goto LABEL_9;
      }
      v7 = String.subscript.getter();
      v2 = MEMORY[0x24959E3EC](v7);
      v3 = v8;
      swift_bridgeObjectRelease();
    }
    else
    {
      v2 = 0;
    }
  }
  v5 = v2;
  v6 = (void *)v3;
LABEL_9:
  result._object = v6;
  result._countAndFlagsBits = v5;
  return result;
}

id @nonobjc NSRegularExpression.init(pattern:options:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24959E374]();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  v6 = objc_msgSend(v3, sel_initWithPattern_options_error_, v5, a3, v10);

  if (v6)
  {
    v7 = v10[0];
  }
  else
  {
    v8 = v10[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v6;
}

uint64_t partial apply for closure #1 in String.lemmatized()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return closure #1 in String.lemmatized()(a1, a2, a3, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), *(_QWORD ***)(v3 + 32));
}

uint64_t partial apply for closure #1 in String.trimMessageGreeting()(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return closure #1 in String.trimMessageGreeting()(a1, a2, a3, *(uint64_t **)(v3 + 16), *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 32), *(_BYTE **)(v3 + 40), *(uint64_t **)(v3 + 48));
}

uint64_t outlined destroy of Locale?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Locale?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t partial apply for closure #1 in String.containsAJoiningPreposition.getter(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return closure #1 in String.containsAJoiningPreposition.getter(a1, a2, a3, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), *(_BYTE **)(v3 + 32));
}

_QWORD *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, String)>);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 1;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4])
          memmove(v13, a4 + 4, 32 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<Int>);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(NLTag, Range<String.Index>)>);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4])
          memmove(v12, a4 + 4, 24 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t partial apply for closure #1 in String.verbLikeTokens()(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return closure #1 in String.verbLikeTokens()(a1, a2, a3, *(_QWORD ***)(v3 + 16));
}

uint64_t partial apply for closure #1 in String.businessRelevantEntities()(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return closure #1 in String.businessRelevantEntities()(a1, a2, a3, *(_QWORD ***)(v3 + 16));
}

uint64_t partial apply for closure #1 in String.nounLikeTokens(includePronouns:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return closure #1 in String.nounLikeTokens(includePronouns:)(a1, a2, a3, *(_BYTE *)(v3 + 16), *(_QWORD ***)(v3 + 24));
}

uint64_t partial apply for closure #1 in String.properNouns()(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return closure #1 in String.properNouns()(a1, a2, a3, *(_QWORD ***)(v3 + 16));
}

uint64_t specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, String));
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 24 * a1 + 32;
    v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (NLTag, Range<String.Index>));
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t partial apply for closure #1 in String.firstCaptionNounPhrase()(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return closure #1 in String.firstCaptionNounPhrase()(a1, a2, a3, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), *(uint64_t **)(v3 + 32), *(_QWORD *)(v3 + 40));
}

uint64_t partial apply for closure #1 in String.nounPhrasesContaining(_:isProperNoun:allowConjunctions:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return closure #1 in String.nounPhrasesContaining(_:isProperNoun:allowConjunctions:)(a1, a2, a3, *(_QWORD **)(v3 + 16), *(_QWORD ***)(v3 + 24), *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40), *(_QWORD *)(v3 + 48), *(_QWORD **)(v3 + 56), *(_QWORD ***)(v3 + 64)) & 1;
}

uint64_t sub_248905F08()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in String.tokens()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;

  return closure #1 in String.tokens()(a1, a2, a3, a4, a5, a6, a7, v7);
}

uint64_t lazy protocol witness table accessor for type [String] and conformance [A](unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24959EFF8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t partial apply for closure #1 in String.shortenedCaptionPhrase()(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return closure #1 in String.shortenedCaptionPhrase()(a1, a2, a3, *(uint64_t **)(v3 + 16), *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 32), *(uint64_t **)(v3 + 40), *(uint64_t **)(v3 + 48), *(uint64_t **)(v3 + 56)) & 1;
}

uint64_t specialized Collection.prefix(_:)(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    String.index(_:offsetBy:limitedBy:)();
    return String.subscript.getter();
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Substring and conformance Substring()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Substring and conformance Substring;
  if (!lazy protocol witness table cache variable for type Substring and conformance Substring)
  {
    result = MEMORY[0x24959EFF8](MEMORY[0x24BEE1E38], MEMORY[0x24BEE1E08]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Substring and conformance Substring);
  }
  return result;
}

char *specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 8 * a1 + 32);
    v6 = 8 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t static LanguageDetection.userLanguages()()
{
  id v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;

  v0 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v1 = (void *)MEMORY[0x24959E374](0x79654B656C707041, 0xEE00736472616F62);
  v2 = objc_msgSend(v0, sel_stringArrayForKey_, v1);

  if (v2)
  {
    v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  }
  else
  {
    v3 = 0;
  }
  v4 = specialized static LanguageDetection.userLanguagesWithKeyboardDefaults(_:)(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t static LanguageDetection.languageIdForLanguageString(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  Swift::Bool v3;

  v0 = 58;
  while (1)
  {
    v1 = specialized static LanguageDetection.languageStringForLanguageID(_:)(v0);
    if (v2)
    {
      v3 = String.hasPrefix(_:)(*(Swift::String *)&v1);
      swift_bridgeObjectRelease();
      if (v3)
        break;
    }
    v0 = (v0 - 1);
    if (v0 <= 1)
      return 1;
  }
  return v0;
}

uint64_t static LanguageDetection.defaultLanguage()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  v0 = type metadata accessor for Locale();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0, v2, v3);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Locale.current.getter();
  Locale.identifier.getter();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v5, v0);
  v6 = specialized static LanguageDetection.languageForLocaleIdentifier(_:)();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t specialized static LanguageDetection.userLanguagesWithKeyboardDefaults(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;

  v1 = MEMORY[0x24BEE4AF8];
  if (a1)
    v2 = a1;
  else
    v2 = MEMORY[0x24BEE4AF8];
  v3 = *(_QWORD *)(v2 + 16);
  if (!v3)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v5 = MEMORY[0x24BEE4AF8];
    v11 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
    if (v11)
      goto LABEL_16;
LABEL_23:
    swift_release();
    v12 = MEMORY[0x24BEE4AF8];
    if (*(_QWORD *)(MEMORY[0x24BEE4AF8] + 16))
      goto LABEL_31;
    goto LABEL_24;
  }
  swift_bridgeObjectRetain();
  lazy protocol witness table accessor for type String and conformance String();
  v4 = (uint64_t *)(v2 + 40);
  v5 = MEMORY[0x24BEE4AF8];
  do
  {
    v7 = *(v4 - 1);
    v6 = *v4;
    swift_bridgeObjectRetain();
    if ((StringProtocol.contains<A>(_:)() & 1) != 0 || (StringProtocol.contains<A>(_:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v5 + 16) + 1, 1);
      v9 = *(_QWORD *)(v5 + 16);
      v8 = *(_QWORD *)(v5 + 24);
      if (v9 >= v8 >> 1)
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v8 > 1, v9 + 1, 1);
      *(_QWORD *)(v5 + 16) = v9 + 1;
      v10 = v5 + 16 * v9;
      *(_QWORD *)(v10 + 32) = v7;
      *(_QWORD *)(v10 + 40) = v6;
    }
    v4 += 2;
    --v3;
  }
  while (v3);
  swift_bridgeObjectRelease();
  v1 = MEMORY[0x24BEE4AF8];
  v11 = *(_QWORD *)(v5 + 16);
  if (!v11)
    goto LABEL_23;
LABEL_16:
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v11, 0);
  v12 = v1;
  v13 = v5 + 40;
  do
  {
    swift_bridgeObjectRetain();
    v14 = static Locale.canonicalLanguageIdentifier(from:)();
    v16 = v15;
    swift_bridgeObjectRelease();
    v18 = *(_QWORD *)(v1 + 16);
    v17 = *(_QWORD *)(v1 + 24);
    if (v18 >= v17 >> 1)
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v17 > 1, v18 + 1, 1);
    v13 += 16;
    *(_QWORD *)(v1 + 16) = v18 + 1;
    v19 = v1 + 16 * v18;
    *(_QWORD *)(v19 + 32) = v14;
    *(_QWORD *)(v19 + 40) = v16;
    --v11;
  }
  while (v11);
  swift_release();
  if (!*(_QWORD *)(v1 + 16))
  {
LABEL_24:
    swift_bridgeObjectRelease();
    v20 = static Locale.preferredLanguages.getter();
    v21 = *(_QWORD *)(v20 + 16);
    if (v21)
    {
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v21, 0);
      v12 = v1;
      v22 = v20 + 40;
      do
      {
        swift_bridgeObjectRetain();
        v23 = static Locale.canonicalLanguageIdentifier(from:)();
        v25 = v24;
        swift_bridgeObjectRelease();
        v27 = *(_QWORD *)(v1 + 16);
        v26 = *(_QWORD *)(v1 + 24);
        if (v27 >= v26 >> 1)
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v26 > 1, v27 + 1, 1);
        v22 += 16;
        *(_QWORD *)(v1 + 16) = v27 + 1;
        v28 = v1 + 16 * v27;
        *(_QWORD *)(v28 + 32) = v23;
        *(_QWORD *)(v28 + 40) = v25;
        --v21;
      }
      while (v21);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      v12 = MEMORY[0x24BEE4AF8];
    }
  }
LABEL_31:
  v29 = specialized Set.init<A>(_:)(v12);
  swift_bridgeObjectRelease();
  return v29;
}

uint64_t specialized static LanguageDetection.languageForLocaleIdentifier(_:)()
{
  unint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  char v22;
  char v23;

  v0 = lazy protocol witness table accessor for type String and conformance String();
  StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
  v1 = (_QWORD *)StringProtocol.components<A>(separatedBy:)();
  swift_bridgeObjectRelease();
  if (!v1[2])
  {
    __break(1u);
    goto LABEL_66;
  }
  v2 = (_QWORD *)StringProtocol.components<A>(separatedBy:)();
  if (!v2[2])
  {
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }
  v0 = v2[4];
  v3 = v2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = v1[2];
  if (!v4)
  {
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  if (v4 == 1)
  {
    swift_bridgeObjectRelease();
    if (v0 == 26746 && v3 == 0xE200000000000000)
    {
      v0 = 0x736E61482D687ALL;
LABEL_30:
      swift_bridgeObjectRelease();
      return v0;
    }
    if ((_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      v0 = 0x736E61482D687ALL;
      goto LABEL_30;
    }
    return v0;
  }
  v5 = (uint64_t)&v1[2 * v4 + 4];
  v7 = *(_QWORD *)(v5 - 16);
  v6 = *(_QWORD *)(v5 - 8);
  if ((v0 != 26746 || v3 != 0xE200000000000000) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {
    if ((v0 != 31349 || v3 != 0xE200000000000000) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      if (v0 == 29299 && v3 == 0xE200000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        v15 = v1[6];
        v14 = v1[7];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        if (v15 == 1853120844 && v14 == 0xE400000000000000)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          v17 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          if ((v17 & 1) == 0)
            return v0;
        }
        swift_bridgeObjectRelease();
        return 0x6E74614C2D7273;
      }
      if ((v0 != 26984 || v3 != 0xE200000000000000) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
        goto LABEL_30;
      v19 = v1[6];
      v18 = v1[7];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v19 != 1853120844 || v18 != 0xE400000000000000)
      {
        v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if ((v20 & 1) == 0)
          return v0;
        v0 = 0x6E74614C2D6968;
        goto LABEL_30;
      }
      v0 = 0x6E74614C2D6968;
      goto LABEL_16;
    }
    v12 = v1[6];
    v11 = v1[7];
    if (v12 == 1819441475 && v11 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return 31349;
    }
    if (v12 == 1650553409 && v11 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      v0 = 0x626172412D7A75;
LABEL_16:
      swift_bridgeObjectRelease();
      goto LABEL_30;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if (v12 == 1853120844 && v11 == 0xE400000000000000)
    {
      v0 = 0x6E74614C2D7A75;
      swift_bridgeObjectRelease();
      goto LABEL_16;
    }
    v21 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v21 & 1) != 0
      || (v22 = specialized Sequence<>.contains(_:)(v7, v6, outlined read-only object #1 of static LanguageDetection.languageForLocaleIdentifier(_:)), swift_arrayDestroy(), (v22 & 1) != 0))
    {
      v0 = 0x6E74614C2D7A75;
      swift_bridgeObjectRelease();
      goto LABEL_30;
    }
    if (v7 == 17985 && v6 == 0xE200000000000000)
    {
      v0 = 0x626172412D7A75;
      swift_bridgeObjectRelease();
      goto LABEL_30;
    }
LABEL_68:
    v23 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v23 & 1) == 0)
      return v0;
    v0 = 0x626172412D7A75;
    goto LABEL_30;
  }
  swift_bridgeObjectRetain();
  result = swift_bridgeObjectRelease();
  if (v1[2] >= 2uLL)
  {
    v10 = v1[6];
    v9 = v1[7];
    if (v10 == 1936613704 && v9 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      v0 = 0x736E61482D687ALL;
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v10 != 1953390920 || v9 != 0xE400000000000000)
      {
        v0 = 0x746E61482D687ALL;
        v13 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if ((v13 & 1) == 0)
        {
          v16 = specialized Sequence<>.contains(_:)(v7, v6, outlined read-only object #0 of static LanguageDetection.languageForLocaleIdentifier(_:));
          swift_arrayDestroy();
          swift_bridgeObjectRelease();
          if ((v16 & 1) == 0)
            return 0x736E61482D687ALL;
          return v0;
        }
        goto LABEL_30;
      }
      v0 = 0x746E61482D687ALL;
    }
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

uint64_t specialized static LanguageDetection.languageStringForLanguageID(_:)(int a1)
{
  if ((a1 - 2) > 0x38)
    return 0;
  else
    return *(_QWORD *)&aAr[8 * a1 - 16];
}

ValueMetadata *type metadata accessor for LanguageDetection()
{
  return &type metadata for LanguageDetection;
}

uint64_t _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = type metadata accessor for TaskPriority();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  outlined destroy of TUSAfterInitHookable?(a1, &demangling cache variable for type metadata for TaskPriority?);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v8 = type metadata accessor for TaskPriority();
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1, 1, v8) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  outlined destroy of TUSAfterInitHookable?(a1, &demangling cache variable for type metadata for TaskPriority?);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a4;
  v10[3] = a2;
  v10[4] = a3;
  return swift_task_create();
}

uint64_t one-time initialization function for tusTrialDefaultDownloadQueue()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  _QWORD v13[2];

  v0 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0, v2, v3);
  v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for OS_dispatch_queue_serial.Attributes();
  MEMORY[0x24BDAC7A8](v6, v7, v8);
  v9 = type metadata accessor for DispatchQoS();
  MEMORY[0x24BDAC7A8](v9, v10, v11);
  type metadata accessor for OS_dispatch_queue_serial();
  static DispatchQoS.utility.getter();
  v13[1] = MEMORY[0x24BEE4AF8];
  lazy protocol witness table accessor for type OS_dispatch_queue_serial.Attributes and conformance OS_dispatch_queue_serial.Attributes();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue_serial.Attributes]);
  lazy protocol witness table accessor for type [OS_dispatch_queue_serial.Attributes] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v5, *MEMORY[0x24BEE5758], v0);
  result = OS_dispatch_queue_serial.init(label:qos:attributes:autoreleaseFrequency:target:)();
  tusTrialDefaultDownloadQueue = result;
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance TUSTrialNameSpaceError()
{
  return 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance TUSTrialNameSpaceError()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance TUSTrialNameSpaceError()
{
  Hasher._combine(_:)(0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance TUSTrialNameSpaceError()
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

uint64_t TUSTrialAssets.factors.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

void *TUSTrialAssets.rolloutIdentifiers.getter(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(v1 + *(int *)(a1 + 28));
  v3 = v2;
  return v2;
}

void *TUSTrialAssets.experimentIdentifiers.getter(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(v1 + *(int *)(a1 + 32));
  v3 = v2;
  return v2;
}

uint64_t TUSTrialAssets.init(factors:rolloutIdentifiers:experimentIdentifiers:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  uint64_t v27;
  uint64_t v28;
  __int128 v29[2];
  uint64_t v30;
  _BYTE v31[24];
  uint64_t v32;
  uint64_t v33;

  v6 = a3;
  v7 = a2;
  v10 = *(_QWORD *)(a4 - 8);
  v11 = MEMORY[0x24BDAC7A8](a1, a2, a3);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11, v14, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v27 - v16, a1, v17);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TUSAfterInitHookable);
  if ((swift_dynamicCast() & 1) != 0)
  {
    outlined init with take of TUSAfterInitHookable(v29, (uint64_t)v31);
    v28 = a1;
    v18 = a5;
    v19 = v7;
    v20 = v6;
    v21 = v32;
    v22 = v33;
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v31, v32);
    v23 = v21;
    v6 = v20;
    v7 = v19;
    a5 = v18;
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v23, v22);
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v28, a4);
    outlined init with copy of TUSAfterInitHookable((uint64_t)v31, (uint64_t)v29);
    swift_dynamicCast();
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v18, v13, a4);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v31);
  }
  else
  {
    v30 = 0;
    memset(v29, 0, sizeof(v29));
    outlined destroy of TUSAfterInitHookable?((uint64_t)v29, &demangling cache variable for type metadata for TUSAfterInitHookable?);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(a5, a1, a4);
  }
  result = type metadata accessor for TUSTrialAssets(0, a4, v24, v25);
  *(_QWORD *)(a5 + *(int *)(result + 28)) = v7;
  *(_QWORD *)(a5 + *(int *)(result + 32)) = v6;
  return result;
}

uint64_t type metadata accessor for TUSTrialAssets(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TUSTrialAssets);
}

uint64_t outlined init with take of TUSAfterInitHookable(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t outlined init with copy of TUSAfterInitHookable(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t TUSTrialAssets.description.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  id v12;
  Swift::String v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  Swift::String v18;
  Swift::String v19;
  Swift::String v20;
  Swift::String v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  Swift::String v26;
  Swift::String v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  id v31;
  Swift::String v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  Swift::String v37;
  Swift::String v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  Swift::String v43;
  Swift::String v44;
  Swift::String v45;
  Swift::String v46;
  uint64_t v47;
  unint64_t v48;
  Swift::String v49;
  Swift::String v50;
  Swift::String v51;
  Swift::String v52;
  Swift::String v53;
  Swift::String v54;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;

  v4 = v3;
  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](a1, a2, a3);
  v10 = (char *)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(void **)(v3 + *(int *)(v8 + 28));
  if (v11)
  {
    v58 = 0;
    v59 = 0xE000000000000000;
    v12 = v11;
    _StringGuts.grow(_:)(70);
    v13._countAndFlagsBits = 0xD000000000000021;
    v13._object = (void *)0x8000000248919560;
    String.append(_:)(v13);
    v14 = objc_msgSend(v12, sel_rolloutId);
    v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v17 = v16;

    v18._countAndFlagsBits = v15;
    v18._object = v17;
    String.append(_:)(v18);
    swift_bridgeObjectRelease();
    v19._countAndFlagsBits = 0x6D796F6C70656420;
    v19._object = (void *)0xEF203A6449746E65;
    String.append(_:)(v19);
    LODWORD(v56) = objc_msgSend(v12, sel_deploymentId);
    v20._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v20);
    swift_bridgeObjectRelease();
    v21._countAndFlagsBits = 0x50726F7463616620;
    v21._object = (void *)0xEF203A64496B6361;
    String.append(_:)(v21);
    v22 = objc_msgSend(v12, sel_factorPackId);
    v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v25 = v24;

    v26._countAndFlagsBits = v23;
    v26._object = v25;
    String.append(_:)(v26);
    swift_bridgeObjectRelease();
    v27._countAndFlagsBits = 41;
    v27._object = (void *)0xE100000000000000;
    String.append(_:)(v27);

    v28 = v58;
    v29 = v59;
  }
  else
  {
    v28 = 0;
    v29 = 0;
  }
  v30 = *(void **)(v4 + *(int *)(a1 + 32));
  if (v30)
  {
    v58 = 0;
    v59 = 0xE000000000000000;
    v31 = v30;
    _StringGuts.grow(_:)(75);
    v32._countAndFlagsBits = 0xD000000000000027;
    v32._object = (void *)0x8000000248919530;
    String.append(_:)(v32);
    v33 = objc_msgSend(v31, sel_experimentId);
    v34 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v36 = v35;

    v37._countAndFlagsBits = v34;
    v37._object = v36;
    String.append(_:)(v37);
    swift_bridgeObjectRelease();
    v38._countAndFlagsBits = 0x656D746165727420;
    v38._object = (void *)0xEE00203A6449746ELL;
    String.append(_:)(v38);
    v39 = objc_msgSend(v31, sel_treatmentId);
    v40 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v42 = v41;

    v43._countAndFlagsBits = v40;
    v43._object = v42;
    String.append(_:)(v43);
    swift_bridgeObjectRelease();
    v44._countAndFlagsBits = 0x6D796F6C70656420;
    v44._object = (void *)0xEF203A6449746E65;
    String.append(_:)(v44);
    LODWORD(v56) = objc_msgSend(v31, sel_deploymentId);
    v45._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v45);
    swift_bridgeObjectRelease();
    v46._countAndFlagsBits = 41;
    v46._object = (void *)0xE100000000000000;
    String.append(_:)(v46);

    v47 = v58;
    v48 = v59;
  }
  else
  {
    v47 = 0;
    v48 = 0;
  }
  v58 = 0;
  v59 = 0xE000000000000000;
  _StringGuts.grow(_:)(60);
  v49._countAndFlagsBits = 0x3A73726F74636166;
  v49._object = (void *)0xE900000000000020;
  String.append(_:)(v49);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v4, v6);
  v50._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v50);
  swift_bridgeObjectRelease();
  v51._object = (void *)0x80000002489194F0;
  v51._countAndFlagsBits = 0xD000000000000015;
  String.append(_:)(v51);
  v56 = v28;
  v57 = v29;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
  v52._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v52);
  swift_bridgeObjectRelease();
  v53._countAndFlagsBits = 0xD000000000000018;
  v53._object = (void *)0x8000000248919510;
  String.append(_:)(v53);
  v56 = v47;
  v57 = v48;
  v54._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v54);
  swift_bridgeObjectRelease();
  return v58;
}

uint64_t TUSTrialNamespaceManager.assets.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(char *, uint64_t, uint64_t);
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint8_t *v76;
  NSObject *v77;
  uint64_t v78;
  double v79;
  double v80;
  void (*v81)(NSObject *, uint64_t);
  void *v83;
  uint64_t v84;
  uint8_t *v85;
  NSObject *v86;
  os_log_t v87;
  uint64_t v88;
  os_log_t v89;
  uint64_t v90;
  uint64_t v91;
  uint8_t *v92;
  void *v93;
  id v94;
  id v95;
  void *v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  NSObject *v104;
  os_log_type_t v105;
  _BOOL4 v106;
  uint64_t v107;
  uint8_t *v108;
  NSObject *v109;
  uint64_t (*v110)(uint64_t, uint64_t, uint64_t);
  uint64_t v111;
  unint64_t v112;
  uint8_t *v113;
  char *v114;
  os_log_t v115;
  uint64_t v116;
  void (*v117)(char *, os_log_t, uint64_t);
  NSObject *v118;
  NSObject *v119;
  os_log_type_t v120;
  _BOOL4 v121;
  unint64_t v122;
  uint8_t *v123;
  uint64_t v124;
  unint64_t v125;
  void (*v126)(char *, uint64_t);
  NSObject *v127;
  NSObject *v128;
  uint8_t *v129;
  uint64_t v130;
  void *v131;
  char *v132;
  id v133;
  id v134;
  NSObject *v135;
  os_log_type_t v136;
  uint64_t v137;
  uint64_t v138;
  NSObject *v139;
  id v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  os_log_t v145;
  uint64_t v146;
  char *v147;
  uint64_t v148;
  NSObject *v149;
  unint64_t v150;
  id v151;
  char *v152;
  char *v153;
  NSObject *v154;
  os_log_type_t v155;
  _BOOL4 v156;
  uint64_t v157;
  uint8_t *v158;
  NSObject *v159;
  unint64_t v160;
  char *v161;
  void *v162;
  id v163;
  void *v164;
  id v165;
  uint64_t v166;
  uint64_t v167;
  char *v168;
  uint64_t v169;
  uint64_t v170;
  char *v171;
  NSObject *v172;
  os_log_type_t v173;
  uint64_t v174;
  uint64_t v175;
  unint64_t v176;
  uint64_t (*v177)(uint64_t, uint64_t, uint64_t);
  uint64_t v178;
  unint64_t v179;
  uint64_t v180;
  NSObject *v181;
  uint8_t *v182;
  NSObject *v183;
  void (*v184)(char *, uint64_t);
  uint64_t v185;
  char *v186;
  void (*v187)(char *, uint64_t, uint64_t);
  id v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  NSObject *v193;
  char *v194;
  char *v195;
  uint64_t v196;
  uint64_t v197;
  char *v198;
  char *v199;
  char *v200;
  char *v201;
  uint64_t v202;
  char *v203;
  char *v204;
  char *v205;
  os_log_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  NSObject *v210;
  uint8_t *v211;
  uint64_t v212;
  char *v213;
  uint64_t v214;
  uint64_t v215;
  _QWORD v216[3];
  _UNKNOWN **v217;
  NSObject *v218;

  v2 = v1;
  v215 = a1;
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v197 = type metadata accessor for Optional();
  v196 = *(_QWORD *)(v197 - 8);
  MEMORY[0x24BDAC7A8](v197, v5, v6);
  v201 = (char *)&v182 - v7;
  v209 = type metadata accessor for Logger();
  v202 = *(_QWORD *)(v209 - 8);
  v10 = MEMORY[0x24BDAC7A8](v209, v8, v9);
  v200 = (char *)&v182 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v10, v12, v13);
  v198 = (char *)&v182 - v15;
  v18 = MEMORY[0x24BDAC7A8](v14, v16, v17);
  v204 = (char *)&v182 - v19;
  v22 = MEMORY[0x24BDAC7A8](v18, v20, v21);
  v194 = (char *)&v182 - v23;
  v26 = MEMORY[0x24BDAC7A8](v22, v24, v25);
  v195 = (char *)&v182 - v27;
  v207 = *(_QWORD *)(v4 - 8);
  v30 = MEMORY[0x24BDAC7A8](v26, v28, v29);
  v205 = (char *)&v182 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = MEMORY[0x24BDAC7A8](v30, v32, v33);
  v193 = ((char *)&v182 - v35);
  v38 = MEMORY[0x24BDAC7A8](v34, v36, v37);
  v203 = (char *)&v182 - v39;
  MEMORY[0x24BDAC7A8](v38, v40, v41);
  v206 = (os_log_t)((char *)&v182 - v42);
  v214 = type metadata accessor for Date();
  v211 = *(uint8_t **)(v214 - 8);
  v45 = MEMORY[0x24BDAC7A8](v214, v43, v44);
  v210 = ((char *)&v182 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v45, v47, v48);
  v213 = (char *)&v182 - v49;
  v208 = v4;
  v52 = type metadata accessor for TUSTrialAssets(255, v4, v50, v51);
  v53 = type metadata accessor for Optional();
  v54 = *(_QWORD *)(v53 - 8);
  v57 = MEMORY[0x24BDAC7A8](v53, v55, v56);
  v199 = (char *)&v182 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = MEMORY[0x24BDAC7A8](v57, v59, v60);
  v63 = (char *)&v182 - v62;
  MEMORY[0x24BDAC7A8](v61, v64, v65);
  v67 = (char *)&v182 - v66;
  v68 = v3;
  v69 = v3[13];
  v212 = v2;
  v70 = v2 + v69;
  swift_beginAccess();
  v71 = *(void (**)(char *, uint64_t, uint64_t))(v54 + 16);
  v71(v67, v70, v53);
  v72 = *(_QWORD *)(v52 - 8);
  LODWORD(v2) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v72 + 48))(v67, 1, v52);
  (*(void (**)(char *, uint64_t))(v54 + 8))(v67, v53);
  if ((_DWORD)v2 != 1)
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v71)(v215, v70, v53);
  v188 = v68;
  v185 = v54;
  v191 = v72;
  v192 = v52;
  v186 = v63;
  v187 = v71;
  v189 = v70;
  v190 = v53;
  v73 = v213;
  Date.init()();
  v74 = v212;
  v75 = v212 + *(_QWORD *)(*(_QWORD *)v212 + 120);
  swift_beginAccess();
  v76 = v211;
  v77 = v210;
  v78 = v214;
  (*((void (**)(NSObject *, uint64_t, uint64_t))v211 + 2))(v210, v75, v214);
  Date.timeIntervalSince(_:)();
  v80 = v79;
  v81 = (void (*)(NSObject *, uint64_t))*((_QWORD *)v76 + 1);
  v81(v77, v78);
  if (*(double *)(v74 + *(_QWORD *)(*(_QWORD *)v74 + 128)) <= v80)
  {
    swift_beginAccess();
    (*((void (**)(uint64_t, char *, uint64_t))v76 + 3))(v75, v73, v78);
    swift_endAccess();
    v83 = *(void **)(v74 + *(_QWORD *)(*(_QWORD *)v74 + 144));
    objc_msgSend(v83, sel_refresh);
    v84 = v74 + *(_QWORD *)(*(_QWORD *)v74 + 136);
    v86 = *(NSObject **)v84;
    v85 = *(uint8_t **)(v84 + 8);
    v217 = 0;
    swift_unknownObjectWeakInit();
    v216[0] = v83;
    v216[1] = v86;
    v216[2] = v85;
    v217 = &protocol witness table for TUSTrialNamespaceManager<A>;
    swift_unknownObjectWeakAssign();
    outlined init with take of TrialDecoder((uint64_t)v216, (uint64_t)&v218);
    v188 = v83;
    v211 = v85;
    swift_bridgeObjectRetain();
    v87 = v206;
    v88 = v208;
    TrialDecoder.decode<A>(_:)();
    v184 = (void (*)(char *, uint64_t))v81;
    outlined destroy of TrialDecoder((id *)&v218);
    if (((*(uint64_t (**)(os_log_t))(v74 + *(_QWORD *)(*(_QWORD *)v74 + 176)))(v87) & 1) != 0)
    {
      v89 = v87;
      v90 = v207;
      v91 = (uint64_t)v203;
      (*(void (**)(char *, os_log_t, uint64_t))(v207 + 16))(v203, v89, v88);
      v92 = v211;
      v93 = (void *)MEMORY[0x24959E374](v86, v211);
      v94 = v188;
      v95 = objc_msgSend(v188, sel_rolloutIdentifiersWithNamespaceName_, v93);

      v96 = (void *)MEMORY[0x24959E374](v86, v92);
      v97 = objc_msgSend(v94, sel_experimentIdentifiersWithNamespaceName_, v96);

      v98 = (uint64_t)v186;
      TUSTrialAssets.init(factors:rolloutIdentifiers:experimentIdentifiers:)(v91, (uint64_t)v95, (uint64_t)v97, v88, (uint64_t)v186);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v191 + 56))(v98, 0, 1, v192);
      v99 = v185;
      v100 = v199;
      v101 = v190;
      (*(void (**)(char *, uint64_t, uint64_t))(v185 + 32))(v199, v98, v190);
      v102 = v189;
      swift_beginAccess();
      (*(void (**)(uint64_t, char *, uint64_t))(v99 + 40))(v102, v100, v101);
      swift_endAccess();
      v103 = v195;
      Logger.init()();
      swift_retain_n();
      v104 = Logger.logObject.getter();
      v105 = static os_log_type_t.info.getter();
      v106 = os_log_type_enabled(v104, v105);
      v107 = v215;
      if (v106)
      {
        v108 = (uint8_t *)swift_slowAlloc();
        v109 = swift_slowAlloc();
        v218 = v109;
        *(_DWORD *)v108 = 136315138;
        v211 = v108 + 4;
        v110 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v187;
        v187((char *)v98, v102, v190);
        v111 = String.init<A>(reflecting:)();
        v216[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v111, v112, (uint64_t *)&v218);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        v101 = v190;
        swift_bridgeObjectRelease();
        swift_release_n();
        _os_log_impl(&dword_2488EF000, v104, v105, "We successfully decoded struct %s", v108, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24959F0A0](v109, -1, -1);
        v113 = v108;
        v107 = v215;
        MEMORY[0x24959F0A0](v113, -1, -1);

        (*(void (**)(char *, uint64_t))(v202 + 8))(v195, v209);
        (*(void (**)(os_log_t, uint64_t))(v207 + 8))(v206, v208);
        v184(v213, v214);
      }
      else
      {

        swift_release_n();
        (*(void (**)(char *, uint64_t))(v202 + 8))(v103, v209);
        (*(void (**)(os_log_t, uint64_t))(v90 + 8))(v206, v88);
        v184(v213, v214);
        v110 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v187;
      }
      return v110(v107, v102, v101);
    }
    else
    {
      v114 = v194;
      Logger.init()();
      v115 = v87;
      v116 = v207;
      v117 = *(void (**)(char *, os_log_t, uint64_t))(v207 + 16);
      v118 = v193;
      v117((char *)v193, v115, v88);
      v119 = Logger.logObject.getter();
      v120 = static os_log_type_t.error.getter();
      v210 = v119;
      LODWORD(v195) = v120;
      v121 = os_log_type_enabled(v119, v120);
      v122 = (unint64_t)v211;
      if (v121)
      {
        v123 = (uint8_t *)swift_slowAlloc();
        v183 = swift_slowAlloc();
        v218 = v183;
        *(_DWORD *)v123 = 136315138;
        v182 = v123 + 4;
        v117(v203, v118, v208);
        v124 = String.init<A>(reflecting:)();
        v216[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v124, v125, (uint64_t *)&v218);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        v126 = *(void (**)(char *, uint64_t))(v116 + 8);
        v126((char *)v118, v208);
        v127 = v210;
        _os_log_impl(&dword_2488EF000, v210, (os_log_type_t)v195, "Validation for factors %s returned false, attempting to fall back to default factors loader", v123, 0xCu);
        v128 = v183;
        swift_arrayDestroy();
        MEMORY[0x24959F0A0](v128, -1, -1);
        v129 = v123;
        v88 = v208;
        MEMORY[0x24959F0A0](v129, -1, -1);

        v130 = v202;
        (*(void (**)(char *, uint64_t))(v202 + 8))(v194, v209);
      }
      else
      {
        v126 = *(void (**)(char *, uint64_t))(v116 + 8);
        v126((char *)v118, v88);

        v130 = v202;
        (*(void (**)(char *, uint64_t))(v202 + 8))(v114, v209);
      }
      v210 = v86;
      lazy protocol witness table accessor for type TUSTrialNameSpaceError and conformance TUSTrialNameSpaceError();
      v131 = (void *)swift_allocError();
      swift_willThrow();
      v126((char *)v206, v88);
      v132 = v204;
      Logger.init()();
      swift_retain();
      v133 = v131;
      swift_retain();
      v134 = v131;
      v135 = Logger.logObject.getter();
      v136 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v135, v136))
      {
        v137 = swift_slowAlloc();
        v206 = v135;
        v138 = v137;
        v202 = swift_slowAlloc();
        v139 = swift_slowAlloc();
        v218 = v139;
        *(_DWORD *)v138 = 136315394;
        swift_bridgeObjectRetain();
        v216[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)((uint64_t)v210, v122, (uint64_t *)&v218);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        swift_release_n();
        *(_WORD *)(v138 + 12) = 2112;
        v140 = v131;
        v141 = _swift_stdlib_bridgeErrorToNSError();
        v216[0] = v141;
        v142 = v130;
        v143 = v208;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        v144 = v202;
        *(_QWORD *)v202 = v141;

        v145 = v206;
        _os_log_impl(&dword_2488EF000, v206, v136, "Unable to instantiate assets for %s due to: %@", (uint8_t *)v138, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        MEMORY[0x24959F0A0](v144, -1, -1);
        swift_arrayDestroy();
        MEMORY[0x24959F0A0](v139, -1, -1);
        MEMORY[0x24959F0A0](v138, -1, -1);

        v206 = *(os_log_t *)(v142 + 8);
        ((void (*)(char *, uint64_t))v206)(v204, v209);
        v146 = v207;
        v147 = v205;
        v148 = (uint64_t)v203;
        v149 = v210;
      }
      else
      {

        swift_release_n();
        v206 = *(os_log_t *)(v130 + 8);
        ((void (*)(char *, uint64_t))v206)(v132, v209);
        v146 = v207;
        v147 = v205;
        v148 = (uint64_t)v203;
        v149 = v210;
        v143 = v88;
      }
      v150 = v122;
      v151 = v188;
      v152 = v201;
      (*(void (**)(id, NSObject *, unint64_t))(v74 + *(_QWORD *)(*(_QWORD *)v74 + 184)))(v188, v149, v150);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v146 + 48))(v152, 1, v143) == 1)
      {
        (*(void (**)(char *, uint64_t))(v196 + 8))(v152, v197);
        v153 = v200;
        Logger.init()();
        swift_retain_n();
        v154 = Logger.logObject.getter();
        v155 = static os_log_type_t.info.getter();
        v156 = os_log_type_enabled(v154, v155);
        v157 = v215;
        if (v156)
        {
          v158 = (uint8_t *)swift_slowAlloc();
          v159 = swift_slowAlloc();
          v218 = v159;
          *(_DWORD *)v158 = 136315138;
          v160 = (unint64_t)v211;
          swift_bridgeObjectRetain();
          v216[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)((uint64_t)v149, v160, (uint64_t *)&v218);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          swift_release_n();
          _os_log_impl(&dword_2488EF000, v154, v155, "Unable to instantiate default assets for %s", v158, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24959F0A0](v159, -1, -1);
          MEMORY[0x24959F0A0](v158, -1, -1);

          v161 = v200;
        }
        else
        {

          swift_release_n();
          v161 = v153;
        }
        ((void (*)(char *, uint64_t))v206)(v161, v209);
        v184(v213, v214);
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v191 + 56))(v157, 1, 1, v192);
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v146 + 32))(v147, v152, v143);
        (*(void (**)(uint64_t, char *, uint64_t))(v146 + 16))(v148, v147, v143);
        v162 = (void *)MEMORY[0x24959E374](v149, v150);
        v163 = objc_msgSend(v151, sel_rolloutIdentifiersWithNamespaceName_, v162);

        v164 = (void *)MEMORY[0x24959E374](v149, v150);
        v165 = objc_msgSend(v151, sel_experimentIdentifiersWithNamespaceName_, v164);

        v166 = (uint64_t)v186;
        TUSTrialAssets.init(factors:rolloutIdentifiers:experimentIdentifiers:)(v148, (uint64_t)v163, (uint64_t)v165, v143, (uint64_t)v186);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v191 + 56))(v166, 0, 1, v192);
        v167 = v185;
        v168 = v199;
        v169 = v190;
        (*(void (**)(char *, uint64_t, uint64_t))(v185 + 32))(v199, v166, v190);
        v170 = v189;
        swift_beginAccess();
        (*(void (**)(uint64_t, char *, uint64_t))(v167 + 40))(v170, v168, v169);
        swift_endAccess();
        v171 = v198;
        Logger.init()();
        swift_retain_n();
        v172 = Logger.logObject.getter();
        v173 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v172, v173))
        {
          v174 = swift_slowAlloc();
          v210 = swift_slowAlloc();
          v218 = v210;
          *(_DWORD *)v174 = 136315394;
          v175 = v166;
          v176 = (unint64_t)v211;
          swift_bridgeObjectRetain();
          v216[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)((uint64_t)v149, v176, (uint64_t *)&v218);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          swift_release_n();
          *(_WORD *)(v174 + 12) = 2080;
          v177 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v187;
          v187((char *)v175, v189, v190);
          v178 = String.init<A>(reflecting:)();
          v216[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v178, v179, (uint64_t *)&v218);
          v180 = v190;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          swift_release_n();
          _os_log_impl(&dword_2488EF000, v172, v173, "Instantiated default assets for %s using: %s", (uint8_t *)v174, 0x16u);
          v181 = v210;
          swift_arrayDestroy();
          MEMORY[0x24959F0A0](v181, -1, -1);
          MEMORY[0x24959F0A0](v174, -1, -1);

          ((void (*)(char *, uint64_t))v206)(v171, v209);
          (*(void (**)(char *, uint64_t))(v207 + 8))(v205, v143);
          v184(v213, v214);
          return v177(v215, v189, v180);
        }
        else
        {

          swift_release_n();
          ((void (*)(char *, uint64_t))v206)(v171, v209);
          (*(void (**)(char *, uint64_t))(v146 + 8))(v205, v143);
          v184(v213, v214);
          return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v187)(v215, v189, v169);
        }
      }
    }
  }
  else
  {
    v81(v73, v78);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v191 + 56))(v215, 1, 1, v192);
  }
}

uint64_t outlined init with take of TrialDecoder(uint64_t a1, uint64_t a2)
{
  initializeWithTake for TrialDecoder(a2, a1);
  return a2;
}

uint64_t TUSTrialNamespaceManager.__allocating_init(namespaceName:trialProjectID:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:)(uint64_t a1, uint64_t a2, unsigned int a3, int a4, int a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v17;

  v17 = swift_allocObject();
  TUSTrialNamespaceManager.init(namespaceName:trialProjectID:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
  return v17;
}

uint64_t *TUSTrialNamespaceManager.init(namespaceName:trialProjectID:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:)(uint64_t a1, uint64_t a2, unsigned int a3, int a4, int a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t, uint64_t, uint64_t);
  void (*v33)(uint64_t, char *, uint64_t);
  uint64_t v34;
  void *v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  id v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  char *v59;
  unsigned int v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  _QWORD aBlock[6];

  v71 = a8;
  v63 = a7;
  v64 = a6;
  v70 = a5;
  v60 = a3;
  v61 = a4;
  v67 = a1;
  v68 = a2;
  v69 = a10;
  v62 = a9;
  v11 = *v10;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v12, v13, v14);
  v59 = (char *)&v59 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for Date();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16, v18, v19);
  v21 = (char *)&v59 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = *(_QWORD *)(v11 + 80);
  v66 = v11;
  v24 = type metadata accessor for TUSTrialAssets(255, v65, v22, v23);
  v25 = type metadata accessor for Optional();
  v26 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25, v27, v28);
  v30 = (char *)&v59 - v29;
  swift_defaultActor_initialize();
  v31 = (uint64_t)v10 + *(_QWORD *)(*v10 + 104);
  v32 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56);
  v32(v31, 1, 1, v24);
  *(uint64_t *)((char *)v10 + *(_QWORD *)(*v10 + 128)) = 0x40F5180000000000;
  v32((uint64_t)v30, 1, 1, v24);
  swift_beginAccess();
  v33 = *(void (**)(uint64_t, char *, uint64_t))(v26 + 40);
  v34 = v25;
  v33(v31, v30, v25);
  swift_endAccess();
  *(uint64_t *)((char *)v10 + *(_QWORD *)(*v10 + 112)) = MEMORY[0x24BEE4B00];
  static Date.distantPast.getter();
  (*(void (**)(uint64_t, char *, uint64_t))(v17 + 32))((uint64_t)v10 + *(_QWORD *)(*v10 + 120), v21, v16);
  if (one-time initialization token for tusTrialDefaultDownloadQueue != -1)
    swift_once();
  v35 = (void *)tusTrialDefaultDownloadQueue;
  *(uint64_t *)((char *)v10 + *(_QWORD *)(*v10 + 168)) = tusTrialDefaultDownloadQueue;
  v36 = (uint64_t *)((char *)v10 + *(_QWORD *)(*v10 + 136));
  v38 = v67;
  v37 = v68;
  *v36 = v67;
  v36[1] = v37;
  v39 = (void *)objc_opt_self();
  v40 = v35;
  swift_bridgeObjectRetain();
  v41 = objc_msgSend(v39, sel_clientWithIdentifier_, v60);
  *(uint64_t *)((char *)v10 + *(_QWORD *)(*v10 + 144)) = (uint64_t)v41;
  *((_BYTE *)v10 + *(_QWORD *)(*v10 + 152)) = v61 & 1;
  v43 = v63;
  v42 = v64;
  *(uint64_t *)((char *)v10 + *(_QWORD *)(*v10 + 160)) = (uint64_t)v64;
  v44 = (uint64_t *)((char *)v10 + *(_QWORD *)(*v10 + 176));
  v45 = v71;
  *v44 = v43;
  v44[1] = v45;
  v46 = (uint64_t *)((char *)v10 + *(_QWORD *)(*v10 + 184));
  v47 = v69;
  *v46 = v62;
  v46[1] = v47;
  v48 = v42;
  swift_retain();
  swift_retain();
  objc_msgSend(v41, sel_refresh);
  v49 = v41;
  v50 = (void *)MEMORY[0x24959E374](v38, v37);
  v51 = swift_allocObject();
  swift_weakInit();
  v52 = swift_allocObject();
  *(_QWORD *)(v52 + 16) = v65;
  *(_QWORD *)(v52 + 24) = *(_QWORD *)(v66 + 88);
  *(_QWORD *)(v52 + 32) = v51;
  *(_QWORD *)(v52 + 40) = v38;
  *(_QWORD *)(v52 + 48) = v37;
  LOBYTE(v38) = v70;
  *(_BYTE *)(v52 + 56) = v70 & 1;
  aBlock[4] = partial apply for closure #1 in TUSTrialNamespaceManager.init(namespaceName:trialProjectID:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:);
  aBlock[5] = v52;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed TRINamespaceUpdateProtocol) -> ();
  aBlock[3] = &block_descriptor_0;
  v53 = _Block_copy(aBlock);
  swift_release();
  v54 = objc_msgSend(v49, sel_addUpdateHandlerForNamespaceName_usingBlock_, v50, v53);
  _Block_release(v53);

  swift_unknownObjectRelease();
  if ((v38 & 1) != 0)
  {
    v55 = type metadata accessor for TaskPriority();
    v56 = (uint64_t)v59;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v55 - 8) + 56))(v59, 1, 1, v55);
    v57 = (_QWORD *)swift_allocObject();
    v57[2] = 0;
    v57[3] = 0;
    v57[4] = v10;
    swift_retain();
    _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfC(v56, (uint64_t)&async function pointer to partial apply for closure #2 in TUSTrialNamespaceManager.init(namespaceName:trialProjectID:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:), (uint64_t)v57, v34);
    swift_release();
  }
  swift_release();
  swift_release();

  return v10;
}

uint64_t closure #1 in closure #1 in TUSTrialNamespaceManager.init(namespaceName:trialProjectID:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)(v5 + 48) = a5;
  *(_QWORD *)(v5 + 16) = a4;
  type metadata accessor for TUSTrialAssets(255, *(_QWORD *)(*(_QWORD *)a4 + 80), a3, a4);
  v6 = type metadata accessor for Optional();
  *(_QWORD *)(v5 + 24) = v6;
  *(_QWORD *)(v5 + 32) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v5 + 40) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t closure #1 in closure #1 in TUSTrialNamespaceManager.init(namespaceName:trialProjectID:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:)()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(unsigned __int8 *)(v0 + 48);
  TUSTrialNamespaceManager.clearState()();
  v2 = *(_QWORD *)(v0 + 40);
  if (v1 == 1)
  {
    v3 = *(_QWORD *)(v0 + 24);
    v4 = *(_QWORD *)(v0 + 32);
    TUSTrialNamespaceManager.assets.getter(*(_QWORD *)(v0 + 40));
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
    return swift_task_switch();
  }
  else
  {
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t thunk for @escaping @callee_guaranteed (@guaranteed TRINamespaceUpdateProtocol) -> ()(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t closure #2 in TUSTrialNamespaceManager.init(namespaceName:trialProjectID:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a4;
  return swift_task_switch();
}

uint64_t TUSTrialNamespaceManager.__allocating_init(namespaceName:trialClient:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:)(uint64_t a1, uint64_t a2, void *a3, int a4, int a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v17;

  v17 = swift_allocObject();
  TUSTrialNamespaceManager.init(namespaceName:trialClient:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
  return v17;
}

uint64_t *TUSTrialNamespaceManager.init(namespaceName:trialClient:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:)(uint64_t a1, uint64_t a2, void *a3, int a4, int a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t, uint64_t, uint64_t);
  void (*v33)(uint64_t, char *, uint64_t);
  void *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  _QWORD *v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  _QWORD aBlock[7];

  v70 = a8;
  v61 = a7;
  v62 = a3;
  v63 = a6;
  v69 = a5;
  v59 = a4;
  v66 = a1;
  v67 = a2;
  v68 = a10;
  v60 = a9;
  v11 = *v10;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v12, v13, v14);
  v58 = (char *)&v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for Date();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16, v18, v19);
  v21 = (char *)&v56 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = *(_QWORD *)(v11 + 80);
  v65 = v11;
  v24 = type metadata accessor for TUSTrialAssets(255, v64, v22, v23);
  v25 = type metadata accessor for Optional();
  v26 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25, v27, v28);
  v30 = (char *)&v56 - v29;
  swift_defaultActor_initialize();
  v31 = (uint64_t)v10 + *(_QWORD *)(*v10 + 104);
  v32 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56);
  v32(v31, 1, 1, v24);
  *(uint64_t *)((char *)v10 + *(_QWORD *)(*v10 + 128)) = 0x40F5180000000000;
  v32((uint64_t)v30, 1, 1, v24);
  swift_beginAccess();
  v33 = *(void (**)(uint64_t, char *, uint64_t))(v26 + 40);
  v57 = v25;
  v33(v31, v30, v25);
  swift_endAccess();
  *(uint64_t *)((char *)v10 + *(_QWORD *)(*v10 + 112)) = MEMORY[0x24BEE4B00];
  static Date.distantPast.getter();
  (*(void (**)(uint64_t, char *, uint64_t))(v17 + 32))((uint64_t)v10 + *(_QWORD *)(*v10 + 120), v21, v16);
  if (one-time initialization token for tusTrialDefaultDownloadQueue != -1)
    swift_once();
  v34 = (void *)tusTrialDefaultDownloadQueue;
  *(uint64_t *)((char *)v10 + *(_QWORD *)(*v10 + 168)) = tusTrialDefaultDownloadQueue;
  v35 = (uint64_t *)((char *)v10 + *(_QWORD *)(*v10 + 136));
  v37 = v66;
  v36 = v67;
  *v35 = v66;
  v35[1] = v36;
  v39 = v62;
  v38 = v63;
  *(uint64_t *)((char *)v10 + *(_QWORD *)(*v10 + 144)) = (uint64_t)v62;
  *((_BYTE *)v10 + *(_QWORD *)(*v10 + 152)) = v59 & 1;
  *(uint64_t *)((char *)v10 + *(_QWORD *)(*v10 + 160)) = (uint64_t)v38;
  v40 = (uint64_t *)((char *)v10 + *(_QWORD *)(*v10 + 176));
  v41 = v70;
  *v40 = v61;
  v40[1] = v41;
  v42 = (uint64_t *)((char *)v10 + *(_QWORD *)(*v10 + 184));
  v43 = v68;
  *v42 = v60;
  v42[1] = v43;
  v44 = v34;
  swift_bridgeObjectRetain();
  v45 = v39;
  v46 = v38;
  swift_retain();
  swift_retain();
  objc_msgSend(v45, sel_refresh);
  v47 = (void *)MEMORY[0x24959E374](v37, v36);
  v48 = swift_allocObject();
  swift_weakInit();
  v49 = swift_allocObject();
  *(_QWORD *)(v49 + 16) = v64;
  *(_QWORD *)(v49 + 24) = *(_QWORD *)(v65 + 88);
  *(_QWORD *)(v49 + 32) = v48;
  *(_QWORD *)(v49 + 40) = v37;
  *(_QWORD *)(v49 + 48) = v36;
  LOBYTE(v37) = v69;
  *(_BYTE *)(v49 + 56) = v69 & 1;
  aBlock[4] = partial apply for closure #1 in TUSTrialNamespaceManager.init(namespaceName:trialClient:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:);
  aBlock[5] = v49;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed (@guaranteed TRINamespaceUpdateProtocol) -> ();
  aBlock[3] = &block_descriptor_14;
  v50 = _Block_copy(aBlock);
  swift_release();
  v51 = objc_msgSend(v45, sel_addUpdateHandlerForNamespaceName_usingBlock_, v47, v50);
  _Block_release(v50);

  swift_unknownObjectRelease();
  if ((v37 & 1) != 0)
  {
    v52 = type metadata accessor for TaskPriority();
    v53 = (uint64_t)v58;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v52 - 8) + 56))(v58, 1, 1, v52);
    v54 = (_QWORD *)swift_allocObject();
    v54[2] = 0;
    v54[3] = 0;
    v54[4] = v10;
    swift_retain();
    _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfC(v53, (uint64_t)&async function pointer to partial apply for closure #2 in TUSTrialNamespaceManager.init(namespaceName:trialClient:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:), (uint64_t)v54, v57);
    swift_release();
  }
  swift_release();
  swift_release();

  return v10;
}

uint64_t closure #1 in TUSTrialNamespaceManager.init(namespaceName:trialProjectID:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:)(void *a1, uint64_t a2, uint64_t a3, unint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unint64_t v10;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t result;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  LODWORD(v10) = a5;
  v50 = a3;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v13, v14, v15);
  v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for Logger();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18, v20, v21);
  v23 = (char *)&v43 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v25 = result;
    v49 = v19;
    v26 = a9;
    Logger.init()();
    swift_bridgeObjectRetain_n();
    swift_unknownObjectRetain_n();
    v27 = Logger.logObject.getter();
    v28 = static os_log_type_t.info.getter();
    v48 = v28;
    if (os_log_type_enabled(v27, v28))
    {
      v29 = swift_slowAlloc();
      v46 = a9;
      v30 = v29;
      v45 = swift_slowAlloc();
      v52 = v45;
      *(_DWORD *)v30 = 136315394;
      v47 = v10;
      swift_bridgeObjectRetain();
      v31 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v50, a4, &v52);
      v50 = a8;
      v51 = v31;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v30 + 12) = 2080;
      v32 = objc_msgSend(a1, sel_description, v30 + 14);
      v33 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v44 = v18;
      v34 = v17;
      v35 = v25;
      v36 = v33;
      v10 = v37;

      v38 = v36;
      v25 = v35;
      v17 = v34;
      v51 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v38, v10, &v52);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      LOBYTE(v10) = v47;
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease_n();
      _os_log_impl(&dword_2488EF000, v27, (os_log_type_t)v48, "TrialNamespaceManager for Trial namespace %s received new configuration for %s", (uint8_t *)v30, 0x16u);
      v39 = v45;
      swift_arrayDestroy();
      MEMORY[0x24959F0A0](v39, -1, -1);
      v40 = v30;
      v26 = v46;
      MEMORY[0x24959F0A0](v40, -1, -1);

      (*(void (**)(char *, uint64_t))(v49 + 8))(v23, v44);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_unknownObjectRelease_n();

      (*(void (**)(char *, uint64_t))(v49 + 8))(v23, v18);
    }
    v41 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v17, 1, 1, v41);
    v42 = swift_allocObject();
    *(_QWORD *)(v42 + 16) = 0;
    *(_QWORD *)(v42 + 24) = 0;
    *(_QWORD *)(v42 + 32) = v25;
    *(_BYTE *)(v42 + 40) = v10 & 1;
    _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v17, v26, v42);
    return swift_release();
  }
  return result;
}

uint64_t closure #1 in closure #1 in TUSTrialNamespaceManager.init(namespaceName:trialClient:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)(v5 + 48) = a5;
  *(_QWORD *)(v5 + 16) = a4;
  type metadata accessor for TUSTrialAssets(255, *(_QWORD *)(*(_QWORD *)a4 + 80), a3, a4);
  v6 = type metadata accessor for Optional();
  *(_QWORD *)(v5 + 24) = v6;
  *(_QWORD *)(v5 + 32) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v5 + 40) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t closure #1 in closure #1 in TUSTrialNamespaceManager.init(namespaceName:trialClient:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:)()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(unsigned __int8 *)(v0 + 48);
  TUSTrialNamespaceManager.clearState()();
  v2 = *(_QWORD *)(v0 + 40);
  if (v1 == 1)
  {
    v3 = *(_QWORD *)(v0 + 24);
    v4 = *(_QWORD *)(v0 + 32);
    TUSTrialNamespaceManager.assets.getter(*(_QWORD *)(v0 + 40));
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
    return swift_task_switch();
  }
  else
  {
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t closure #2 in TUSTrialNamespaceManager.init(namespaceName:trialClient:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a4;
  return swift_task_switch();
}

uint64_t closure #2 in TUSTrialNamespaceManager.init(namespaceName:trialClient:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:)()
{
  uint64_t v0;

  TUSTrialNamespaceManager.assets.getter(*(_QWORD *)(v0 + 16));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

Swift::Void __swiftcall TUSTrialNamespaceManager.clearState()()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;

  v1 = *v0;
  v2 = type metadata accessor for Date();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4, v5);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for TUSTrialAssets(255, *(_QWORD *)(v1 + 80), v8, v9);
  v11 = type metadata accessor for Optional();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11, v13, v14);
  v16 = (char *)&v20 - v15;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))((char *)&v20 - v15, 1, 1, v10);
  v17 = (uint64_t)v0 + *(_QWORD *)(*v0 + 104);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 40))(v17, v16, v11);
  swift_endAccess();
  static Date.distantPast.getter();
  v18 = (uint64_t)v0 + *(_QWORD *)(*v0 + 120);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 40))(v18, v7, v2);
  swift_endAccess();
  v19 = (uint64_t *)((char *)v0 + *(_QWORD *)(*v0 + 112));
  swift_beginAccess();
  *v19 = MEMORY[0x24BEE4B00];
  swift_bridgeObjectRelease();
}

uint64_t TUSTrialNamespaceManager.deinit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = v4 + *(_QWORD *)(*(_QWORD *)v4 + 104);
  type metadata accessor for TUSTrialAssets(255, *(_QWORD *)(*(_QWORD *)v4 + 80), a3, a4);
  v6 = type metadata accessor for Optional();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  v7 = v4 + *(_QWORD *)(*(_QWORD *)v4 + 120);
  v8 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_defaultActor_destroy();
  return v4;
}

uint64_t TUSTrialNamespaceManager.__deallocating_deinit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  TUSTrialNamespaceManager.deinit(a1, a2, a3, a4);
  return swift_defaultActor_deallocate();
}

uint64_t TUSTrialNamespaceManager.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t protocol witness for Actor.unownedExecutor.getter in conformance TUSTrialNamespaceManager<A>()
{
  return TUSTrialNamespaceManager.unownedExecutor.getter();
}

uint64_t TUSTrialNamespaceManager.downloadFactor(_:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  v3[17] = a2;
  v3[18] = v2;
  v3[16] = a1;
  v3[19] = *v2;
  v4 = type metadata accessor for Logger();
  v3[20] = v4;
  v3[21] = *(_QWORD *)(v4 - 8);
  v3[22] = swift_task_alloc();
  v3[23] = swift_task_alloc();
  v3[24] = swift_task_alloc();
  v3[25] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  v3[26] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t TUSTrialNamespaceManager.downloadFactor(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t *v20;
  unint64_t v21;
  void *v22;
  id v23;
  unsigned int v24;
  char **v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  char isUniquelyReferenced_nonNull_native;
  NSObject *v40;
  os_log_type_t v41;
  _BOOL4 v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  _BOOL4 v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  NSObject *v54;
  _BOOL4 v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  os_log_type_t type;
  uint64_t typea;
  os_log_type_t typeb[8];
  uint64_t v70;
  os_log_type_t v71[8];
  os_log_type_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;

  v1 = *(_QWORD *)(v0 + 144) + *(_QWORD *)(**(_QWORD **)(v0 + 144) + 112);
  swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)v1 + 16))
  {
    v2 = *(_QWORD *)(v0 + 128);
    v3 = *(_QWORD *)(v0 + 136);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    specialized __RawDictionaryStorage.find<A>(_:)(v2, v3);
    if ((v4 & 1) != 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      Logger.init()();
      swift_bridgeObjectRetain_n();
      swift_retain();
      v5 = Logger.logObject.getter();
      v6 = static os_log_type_t.debug.getter();
      v7 = os_log_type_enabled(v5, v6);
      v9 = *(_QWORD *)(v0 + 168);
      v8 = *(_QWORD *)(v0 + 176);
      v10 = *(_QWORD *)(v0 + 160);
      v12 = *(_QWORD *)(v0 + 136);
      v11 = *(_QWORD *)(v0 + 144);
      if (v7)
      {
        v70 = *(_QWORD *)(v0 + 128);
        v13 = swift_slowAlloc();
        v73 = swift_slowAlloc();
        v80 = v73;
        *(_DWORD *)v13 = 136315394;
        v76 = v10;
        v14 = (uint64_t *)(v11 + *(_QWORD *)(*(_QWORD *)v11 + 136));
        type = v6;
        v16 = *v14;
        v15 = v14[1];
        swift_bridgeObjectRetain();
        *(_QWORD *)(v0 + 112) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v16, v15, &v80);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release();
        swift_bridgeObjectRelease();
        *(_WORD *)(v13 + 12) = 2080;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v0 + 120) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v70, v12, &v80);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_2488EF000, v5, type, "Skipping download %s for factor %s since task has already kicked off for this", (uint8_t *)v13, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x24959F0A0](v73, -1, -1);
        MEMORY[0x24959F0A0](v13, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v76);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_release();
        (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
      }
      goto LABEL_22;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v17 = *(_QWORD *)(v0 + 144);
  v18 = *(void **)(v17 + *(_QWORD *)(*(_QWORD *)v17 + 144));
  v19 = (void *)MEMORY[0x24959E374](*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 136));
  v20 = (uint64_t *)(v17 + *(_QWORD *)(*(_QWORD *)v17 + 136));
  v21 = v20[1];
  v79 = *v20;
  v22 = (void *)MEMORY[0x24959E374]();
  v23 = objc_msgSend(v18, sel_levelForFactor_withNamespaceName_, v19, v22);

  if (v23)
  {
    v24 = objc_msgSend(v23, sel_levelOneOfCase);
    v25 = &selRef_fileValue;
    if (v24 != 100)
      v25 = &selRef_directoryValue;
    v26 = objc_msgSend(v23, *v25);
    if (v26)
    {
      v27 = v26;
      if (objc_msgSend(v27, sel_isOnDemand))
      {
        v28 = *(_QWORD *)(v0 + 208);
        v30 = *(_QWORD *)(v0 + 144);
        v29 = *(_QWORD *)(v0 + 152);
        v32 = *(_QWORD *)(v0 + 128);
        v31 = *(_QWORD *)(v0 + 136);
        v33 = type metadata accessor for TaskPriority();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v28, 1, 1, v33);
        v35 = type metadata accessor for TUSTrialNamespaceManager(255, *(_QWORD *)(v29 + 80), *(_QWORD *)(v29 + 88), v34);
        v36 = MEMORY[0x24959EFF8](&protocol conformance descriptor for TUSTrialNamespaceManager<A>, v35);
        v37 = (_QWORD *)swift_allocObject();
        v37[2] = v30;
        v37[3] = v36;
        v37[4] = v30;
        v37[5] = v32;
        v37[6] = v31;
        swift_bridgeObjectRetain_n();
        swift_retain_n();
        v38 = _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5(v28, (uint64_t)&async function pointer to partial apply for closure #1 in TUSTrialNamespaceManager.downloadFactor(_:), (uint64_t)v37);
        swift_beginAccess();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v80 = *(_QWORD *)v1;
        *(_QWORD *)v1 = 0x8000000000000000;
        specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v38, v32, v31, isUniquelyReferenced_nonNull_native);
        *(_QWORD *)v1 = v80;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();

      }
      else
      {
        Logger.init()();
        swift_bridgeObjectRetain_n();
        swift_retain_n();
        v54 = Logger.logObject.getter();
        v72 = static os_log_type_t.error.getter();
        v55 = os_log_type_enabled(v54, v72);
        v56 = *(_QWORD *)(v0 + 200);
        v57 = *(_QWORD *)(v0 + 160);
        v78 = *(_QWORD *)(v0 + 168);
        v58 = *(_QWORD *)(v0 + 136);
        if (v55)
        {
          v62 = *(_QWORD *)(v0 + 128);
          *(_QWORD *)typeb = *(_QWORD *)(v0 + 160);
          v59 = swift_slowAlloc();
          v65 = swift_slowAlloc();
          v80 = v65;
          *(_DWORD *)v59 = 136315394;
          swift_bridgeObjectRetain();
          *(_QWORD *)(v0 + 88) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v79, v21, &v80);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v59 + 12) = 2080;
          swift_bridgeObjectRetain();
          *(_QWORD *)(v0 + 96) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v62, v58, &v80);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_2488EF000, v54, v72, "Namespace %s factor %s is not on demand so we can't explicitly download it", (uint8_t *)v59, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x24959F0A0](v65, -1, -1);
          MEMORY[0x24959F0A0](v59, -1, -1);

          (*(void (**)(uint64_t, os_log_type_t *))(v78 + 8))(v56, *(os_log_type_t **)typeb);
        }
        else
        {

          swift_bridgeObjectRelease_n();
          swift_release_n();

          (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v56, v57);
        }
      }
    }
    else
    {
      Logger.init()();
      swift_bridgeObjectRetain_n();
      swift_retain_n();
      v47 = Logger.logObject.getter();
      v48 = static os_log_type_t.error.getter();
      v49 = os_log_type_enabled(v47, v48);
      v50 = *(_QWORD *)(v0 + 192);
      v51 = *(_QWORD *)(v0 + 160);
      v52 = *(_QWORD *)(v0 + 136);
      if (v49)
      {
        v64 = *(_QWORD *)(v0 + 128);
        *(_QWORD *)v71 = *(_QWORD *)(v0 + 168);
        v75 = *(_QWORD *)(v0 + 192);
        v53 = swift_slowAlloc();
        v66 = swift_slowAlloc();
        v80 = v66;
        *(_DWORD *)v53 = 136315394;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v0 + 72) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v79, v21, &v80);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v53 + 12) = 2080;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v0 + 80) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v64, v52, &v80);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_2488EF000, v47, v48, "Namespace %s factor %s could not get file / directory from level", (uint8_t *)v53, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x24959F0A0](v66, -1, -1);
        MEMORY[0x24959F0A0](v53, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v71 + 8))(v75, v51);
      }
      else
      {
        v60 = *(_QWORD *)(v0 + 168);

        swift_bridgeObjectRelease_n();
        swift_release_n();

        (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v50, v51);
      }
    }
  }
  else
  {
    Logger.init()();
    swift_bridgeObjectRetain_n();
    swift_retain();
    v40 = Logger.logObject.getter();
    v41 = static os_log_type_t.error.getter();
    v42 = os_log_type_enabled(v40, v41);
    v43 = *(_QWORD *)(v0 + 184);
    v44 = *(_QWORD *)(v0 + 160);
    v77 = *(_QWORD *)(v0 + 168);
    v45 = *(_QWORD *)(v0 + 136);
    if (v42)
    {
      v63 = *(_QWORD *)(v0 + 128);
      v74 = *(_QWORD *)(v0 + 160);
      v46 = swift_slowAlloc();
      typea = swift_slowAlloc();
      v80 = typea;
      *(_DWORD *)v46 = 136315394;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 104) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v79, v21, &v80);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      swift_bridgeObjectRelease();
      *(_WORD *)(v46 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 64) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v63, v45, &v80);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2488EF000, v40, v41, "Namespace %s factor %s does not have level", (uint8_t *)v46, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24959F0A0](typea, -1, -1);
      MEMORY[0x24959F0A0](v46, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v77 + 8))(v43, v74);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v77 + 8))(v43, v44);
    }
  }
LABEL_22:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t closure #1 in TUSTrialNamespaceManager.downloadFactor(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[28] = a5;
  v6[29] = a6;
  v6[27] = a4;
  v7 = type metadata accessor for Logger();
  v6[30] = v7;
  v6[31] = *(_QWORD *)(v7 - 8);
  v6[32] = swift_task_alloc();
  v6[33] = swift_task_alloc();
  v6[34] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t closure #1 in TUSTrialNamespaceManager.downloadFactor(_:)()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  Class isa;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;

  v1 = *(_QWORD *)(v0 + 216);
  if ((*(_BYTE *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 152)) & 1) != 0)
  {
    Logger.init()();
    swift_bridgeObjectRetain_n();
    v2 = Logger.logObject.getter();
    v3 = static os_log_type_t.info.getter();
    v4 = os_log_type_enabled(v2, v3);
    v5 = *(_QWORD *)(v0 + 264);
    v6 = *(_QWORD *)(v0 + 240);
    v7 = *(_QWORD *)(v0 + 248);
    v8 = *(_QWORD *)(v0 + 232);
    if (v4)
    {
      v9 = *(_QWORD *)(v0 + 224);
      v27 = *(id *)(v0 + 240);
      v26 = *(_QWORD *)(v0 + 264);
      v10 = (uint8_t *)swift_slowAlloc();
      v11 = swift_slowAlloc();
      v29 = v11;
      *(_DWORD *)v10 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 184) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v9, v8, &v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2488EF000, v2, v3, "Skipping factor %s download since manager is in spectator mode", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24959F0A0](v11, -1, -1);
      MEMORY[0x24959F0A0](v10, -1, -1);

      (*(void (**)(uint64_t, id))(v7 + 8))(v26, v27);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v12 = *(_QWORD *)(v0 + 224);
    v13 = *(_QWORD *)(v0 + 232);
    v28 = *(id *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 144));
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_248917470;
    *(_QWORD *)(v14 + 32) = v12;
    *(_QWORD *)(v14 + 40) = v13;
    swift_bridgeObjectRetain();
    isa = Array._bridgeToObjectiveC()().super.isa;
    *(_QWORD *)(v0 + 280) = isa;
    swift_bridgeObjectRelease();
    v16 = (_QWORD *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 136));
    *(_QWORD *)(v0 + 288) = *v16;
    *(_QWORD *)(v0 + 296) = v16[1];
    v17 = MEMORY[0x24959E374]();
    *(_QWORD *)(v0 + 304) = v17;
    v18 = *(_QWORD *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 168));
    v19 = *(_QWORD *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 160));
    v20 = (_QWORD *)swift_allocObject();
    v20[2] = v1;
    v20[3] = v12;
    v20[4] = v13;
    *(_QWORD *)(v0 + 112) = partial apply for closure #1 in closure #1 in TUSTrialNamespaceManager.downloadFactor(_:);
    *(_QWORD *)(v0 + 120) = v20;
    v21 = MEMORY[0x24BDAC760];
    *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
    *(_QWORD *)(v0 + 88) = 1107296256;
    *(_QWORD *)(v0 + 96) = thunk for @escaping @callee_guaranteed (@unowned UInt) -> ();
    *(_QWORD *)(v0 + 104) = &block_descriptor_34;
    v22 = _Block_copy((const void *)(v0 + 80));
    *(_QWORD *)(v0 + 312) = v22;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    *(_QWORD *)(v0 + 56) = v0 + 332;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = closure #1 in TUSTrialNamespaceManager.downloadFactor(_:);
    v23 = swift_continuation_init();
    *(_QWORD *)(v0 + 128) = v21;
    v24 = (_QWORD *)(v0 + 128);
    v24[1] = 0x40000000;
    v24[2] = @objc completion handler block implementation for <A>@escaping @callee_unowned @convention(block) (@unowned Bool, @unowned NSError?) -> () with result type Bool;
    v24[3] = &block_descriptor_35;
    v24[4] = v23;
    objc_msgSend(v28, sel_downloadLevelsForFactors_withNamespace_queue_options_progress_completion_, isa, v17, v18, v19, v22, v24);
    return swift_continuation_await();
  }
}

{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 320) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

{
  uint64_t v0;
  void *v1;
  void *v2;
  int v3;
  NSObject *v4;
  os_log_type_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v1 = *(void **)(v0 + 304);
  v2 = *(void **)(v0 + 280);
  v3 = *(unsigned __int8 *)(v0 + 332);
  _Block_release(*(const void **)(v0 + 312));

  Logger.init()();
  swift_bridgeObjectRetain_n();
  swift_retain();
  v4 = Logger.logObject.getter();
  v5 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v16 = v3;
    v7 = *(_QWORD *)(v0 + 288);
    v6 = *(_QWORD *)(v0 + 296);
    v17 = *(_QWORD *)(v0 + 248);
    v8 = *(_QWORD *)(v0 + 232);
    v18 = *(_QWORD *)(v0 + 240);
    v19 = *(_QWORD *)(v0 + 272);
    v15 = *(_QWORD *)(v0 + 224);
    v9 = swift_slowAlloc();
    v10 = swift_slowAlloc();
    v20 = v10;
    *(_DWORD *)v9 = 136315650;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 200) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v7, v6, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_release();
    *(_WORD *)(v9 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 208) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v8, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v9 + 22) = 1024;
    *(_DWORD *)(v0 + 328) = v16;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_2488EF000, v4, v5, "Namespace %s factor %s download success %{BOOL}d", (uint8_t *)v9, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x24959F0A0](v10, -1, -1);
    MEMORY[0x24959F0A0](v9, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v19, v18);
  }
  else
  {
    v11 = *(_QWORD *)(v0 + 272);
    v12 = *(_QWORD *)(v0 + 240);
    v13 = *(_QWORD *)(v0 + 248);
    swift_release();
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  }
  TUSTrialNamespaceManager.clearState()();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  const void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27[2];

  v1 = *(const void **)(v0 + 312);
  v2 = *(void **)(v0 + 320);
  v3 = *(void **)(v0 + 304);
  v4 = *(void **)(v0 + 280);
  swift_willThrow();
  _Block_release(v1);

  Logger.init()();
  swift_bridgeObjectRetain();
  swift_retain();
  v5 = v2;
  swift_bridgeObjectRetain();
  swift_retain();
  v6 = v2;
  v7 = Logger.logObject.getter();
  v8 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = *(void **)(v0 + 320);
    v10 = *(_QWORD *)(v0 + 288);
    v11 = *(_QWORD *)(v0 + 296);
    v24 = *(_QWORD *)(v0 + 248);
    v12 = *(_QWORD *)(v0 + 232);
    v25 = *(_QWORD *)(v0 + 240);
    v26 = *(_QWORD *)(v0 + 256);
    v22 = *(_QWORD *)(v0 + 224);
    v13 = swift_slowAlloc();
    v14 = (_QWORD *)swift_slowAlloc();
    v23 = swift_slowAlloc();
    v27[0] = v23;
    *(_DWORD *)v13 = 136315650;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 176) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v10, v11, v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v13 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 168) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v22, v12, v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v13 + 22) = 2112;
    v15 = v9;
    v16 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 192) = v16;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *v14 = v16;

    _os_log_impl(&dword_2488EF000, v7, v8, "Namespace %s factor %s download error: %@", (uint8_t *)v13, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    MEMORY[0x24959F0A0](v14, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24959F0A0](v23, -1, -1);
    MEMORY[0x24959F0A0](v13, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v26, v25);
  }
  else
  {
    v17 = *(void **)(v0 + 320);
    v19 = *(_QWORD *)(v0 + 248);
    v18 = *(_QWORD *)(v0 + 256);
    v20 = *(_QWORD *)(v0 + 240);

    swift_release_n();
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t closure #1 in closure #1 in TUSTrialNamespaceManager.downloadFactor(_:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v8 = type metadata accessor for Logger();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10, v11);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  Logger.init()();
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  v14 = Logger.logObject.getter();
  v15 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = swift_slowAlloc();
    v23 = a3;
    v17 = v16;
    v18 = swift_slowAlloc();
    v28 = v18;
    *(_DWORD *)v17 = 136315650;
    v25 = v8;
    v26 = v9;
    v19 = (uint64_t *)(a2 + *(_QWORD *)(*(_QWORD *)a2 + 136));
    v24 = a1;
    v21 = *v19;
    v20 = v19[1];
    swift_bridgeObjectRetain();
    v27 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v20, &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2080;
    swift_bridgeObjectRetain();
    v27 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v23, a4, &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v17 + 22) = 2048;
    v27 = v24;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_2488EF000, v14, v15, "Download %s for factor %s download %lu%%", (uint8_t *)v17, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x24959F0A0](v18, -1, -1);
    MEMORY[0x24959F0A0](v17, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v13, v25);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v13, v8);
  }
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned UInt) -> ()(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t @objc completion handler block implementation for <A>@escaping @callee_unowned @convention(block) (@unowned Bool, @unowned NSError?) -> () with result type Bool(uint64_t a1, char a2, void *a3)
{
  _QWORD *v4;
  id v5;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    swift_allocError();
    *v4 = a3;
    v5 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    **(_BYTE **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
    return swift_continuation_throwingResume();
  }
}

uint64_t protocol witness for TrialFactorDownloader.downloadFactor(_:) in conformance TUSTrialNamespaceManager<A>(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TATQ0_;
  return TUSTrialNamespaceManager.downloadFactor(_:)(a1, a2);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TQ0_;
  return v6(a1);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTR(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTQ0_;
  return v6(a1);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTQ0_()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:format:privacy:)(uint64_t (*a1)(void))
{
  return a1() & 1;
}

uint64_t thunk for @escaping @callee_guaranteed () -> (@unowned Int32)@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

unint64_t lazy protocol witness table accessor for type TUSTrialNameSpaceError and conformance TUSTrialNameSpaceError()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TUSTrialNameSpaceError and conformance TUSTrialNameSpaceError;
  if (!lazy protocol witness table cache variable for type TUSTrialNameSpaceError and conformance TUSTrialNameSpaceError)
  {
    result = MEMORY[0x24959EFF8](&protocol conformance descriptor for TUSTrialNameSpaceError, &unk_2519A97C8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TUSTrialNameSpaceError and conformance TUSTrialNameSpaceError);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TUSTrialNameSpaceError and conformance TUSTrialNameSpaceError;
  if (!lazy protocol witness table cache variable for type TUSTrialNameSpaceError and conformance TUSTrialNameSpaceError)
  {
    result = MEMORY[0x24959EFF8](&protocol conformance descriptor for TUSTrialNameSpaceError, &unk_2519A97C8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TUSTrialNameSpaceError and conformance TUSTrialNameSpaceError);
  }
  return result;
}

uint64_t sub_24890BD20()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in TUSTrialNamespaceManager.init(namespaceName:trialProjectID:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:)(void *a1)
{
  return partial apply for closure #1 in TUSTrialNamespaceManager.init(namespaceName:trialProjectID:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:)(a1, (uint64_t)&unk_2519A98C8, (uint64_t)&async function pointer to partial apply for closure #1 in closure #1 in TUSTrialNamespaceManager.init(namespaceName:trialProjectID:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:));
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

uint64_t sub_24890BD74()
{
  return objectdestroy_5Tm((void (*)(_QWORD))MEMORY[0x24BEE4F70], (void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t partial apply for closure #2 in TUSTrialNamespaceManager.init(namespaceName:trialProjectID:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *(_QWORD *)(v1 + 32);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TATQ0_;
  v5[2] = a1;
  v5[3] = v4;
  return swift_task_switch();
}

uint64_t objectdestroy_2Tm()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in TUSTrialNamespaceManager.init(namespaceName:trialClient:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:)(void *a1)
{
  return partial apply for closure #1 in TUSTrialNamespaceManager.init(namespaceName:trialProjectID:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:)(a1, (uint64_t)&unk_2519A9878, (uint64_t)&async function pointer to partial apply for closure #1 in closure #1 in TUSTrialNamespaceManager.init(namespaceName:trialClient:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:));
}

uint64_t partial apply for closure #1 in TUSTrialNamespaceManager.init(namespaceName:trialProjectID:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return closure #1 in TUSTrialNamespaceManager.init(namespaceName:trialProjectID:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:)(a1, *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40), *(_QWORD *)(v3 + 48), *(unsigned __int8 *)(v3 + 56), *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), a2, a3);
}

uint64_t sub_24890BE6C()
{
  return objectdestroy_5Tm((void (*)(_QWORD))MEMORY[0x24BEE4F70], (void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t partial apply for closure #2 in TUSTrialNamespaceManager.init(namespaceName:trialClient:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *(_QWORD *)(v1 + 32);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = partial apply for closure #1 in closure #1 in TUSLazyPurgeable.instantiateState();
  v5[2] = a1;
  v5[3] = v4;
  return swift_task_switch();
}

uint64_t type metadata accessor for TUSTrialNamespaceManager(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TUSTrialNamespaceManager);
}

uint64_t sub_24890BEF4()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in TUSTrialNamespaceManager.downloadFactor(_:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TATQ0_;
  return closure #1 in TUSTrialNamespaceManager.downloadFactor(_:)(a1, v4, v5, v6, v7, v8);
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
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, String>);
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
    v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      v9 = v25 + 1;
      if (v25 + 1 >= v13)
        goto LABEL_26;
      v26 = *(_QWORD *)(v6 + 8 * v9);
      if (!v26)
        break;
    }
LABEL_25:
    v12 = (v26 - 1) & v26;
    v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v20 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v16);
    v21 = *v20;
    v22 = v20[1];
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v23 = v19;
    v23[1] = v18;
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v16);
    *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v13)
    goto LABEL_26;
  v26 = *(_QWORD *)(v6 + 8 * v27);
  if (v26)
  {
    v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v9);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

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
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Task<(), Never>>);
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
    swift_bridgeObjectRetain();
    result = (void *)swift_retain();
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
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  uint64_t v41;
  char v42;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, String>);
  v42 = a2;
  v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v41 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v39 = v2;
  v40 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      v13 = v23 + 1;
      if (v23 + 1 >= v40)
        goto LABEL_33;
      v25 = *(_QWORD *)(v41 + 8 * v13);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          v3 = v39;
          if ((v42 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v25 = *(_QWORD *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v13 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_42;
            if (v13 >= v40)
              goto LABEL_33;
            v25 = *(_QWORD *)(v41 + 8 * v13);
            ++v26;
            if (v25)
              goto LABEL_30;
          }
        }
        v13 = v26;
      }
    }
LABEL_30:
    v10 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    v31 = 16 * v22;
    v32 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v31);
    v34 = *v32;
    v33 = v32[1];
    v35 = (uint64_t *)(*(_QWORD *)(v5 + 56) + v31);
    v36 = *v35;
    v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    result = Hasher._finalize()();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v29 = v16 == v28;
        if (v16 == v28)
          v16 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = 16 * v17;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v18);
    *v19 = v34;
    v19[1] = v33;
    v20 = (_QWORD *)(*(_QWORD *)(v7 + 56) + v18);
    *v20 = v36;
    v20[1] = v37;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v39;
  v24 = (_QWORD *)(v5 + 64);
  if ((v42 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v38 = 1 << *(_BYTE *)(v5 + 32);
  if (v38 >= 64)
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v38;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Task<(), Never>>);
  v36 = a2;
  v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v34)
        goto LABEL_33;
      v23 = *(_QWORD *)(v35 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v34)
              goto LABEL_33;
            v23 = *(_QWORD *)(v35 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    result = Hasher._finalize()();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((v36 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v5 = v4;
  v10 = *v4;
  v12 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    specialized _NativeDictionary.copy()();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_release();
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v23 = (uint64_t *)(v18[6] + 16 * v12);
    *v23 = a2;
    v23[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v24 = v18[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v15, a4 & 1);
  v21 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t type metadata instantiation function for TUSTrialAssets()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata completion function for TUSTrialAssets()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for TUSTrialAssets(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  _QWORD *v10;
  void **v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    v10 = (_QWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFF8);
    v11 = (void **)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFF8);
    v12 = *v11;
    *v10 = *v11;
    v13 = *(void **)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFF8);
    *(_QWORD *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFF8) = v13;
    v14 = v12;
    v15 = v13;
  }
  return v4;
}

void destroy for TUSTrialAssets(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id *v4;

  v3 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  (*(void (**)(void))(v3 + 8))();
  v4 = (id *)((a1 + *(_QWORD *)(v3 + 64) + 7) & 0xFFFFFFFFFFFFFFF8);

}

uint64_t initializeWithCopy for TUSTrialAssets(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  void **v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (void **)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  v9 = *v8;
  *v7 = *v8;
  v10 = *(void **)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFF8);
  *(_QWORD *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFF8) = v10;
  v11 = v9;
  v12 = v10;
  return a1;
}

uint64_t assignWithCopy for TUSTrialAssets(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void **v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (void **)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  v9 = *v8;
  v10 = *(void **)v7;
  *(_QWORD *)v7 = *v8;
  v7 += 15;
  v11 = v9;

  v12 = *(void **)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFF8);
  v13 = *(void **)(v7 & 0xFFFFFFFFFFFFFFF8);
  *(_QWORD *)(v7 & 0xFFFFFFFFFFFFFFF8) = v12;
  v14 = v12;

  return a1;
}

uint64_t initializeWithTake for TUSTrialAssets(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  *v7 = *v8;
  *(_QWORD *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t assignWithTake for TUSTrialAssets(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  void *v9;
  void *v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (_QWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  v9 = *(void **)v7;
  *(_QWORD *)v7 = *v8;
  v7 += 15;

  v10 = *(void **)(v7 & 0xFFFFFFFFFFFFFFF8);
  *(_QWORD *)(v7 & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFF8);

  return a1;
}

uint64_t getEnumTagSinglePayload for TUSTrialAssets(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v12;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFE)
    v6 = 2147483646;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0x7FFFFFFE)
    {
      v12 = *(_QWORD *)((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8);
      if (v12 >= 0xFFFFFFFF)
        LODWORD(v12) = -1;
      if ((v12 + 1) >= 2)
        return v12;
      else
        return 0;
    }
    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }
  else
  {
    if (((((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
      v8 = 2;
    else
      v8 = a2 - v6 + 1;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    return ((uint64_t (*)(void))((char *)&loc_24890CEA8 + 4 * byte_2489178D0[v10]))();
  }
}

void storeEnumTagSinglePayload for TUSTrialAssets(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFEu)
    v6 = 2147483646;
  else
    v6 = *(_DWORD *)(v5 + 84);
  if (v6 >= a3)
  {
    v9 = 0;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if (((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v7 = a3 - v6 + 1;
    else
      v7 = 2;
    if (v7 >= 0x10000)
      v8 = 4;
    else
      v8 = 2;
    if (v7 < 0x100)
      v8 = 1;
    if (v7 >= 2)
      v9 = v8;
    else
      v9 = 0;
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X12 }
  }
  if (((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    v10 = ~v6 + a2;
    bzero(a1, ((((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8);
    *a1 = v10;
  }
  __asm { BR              X10 }
}

void sub_24890D030()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x24890D0B4);
}

void sub_24890D038(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x24890D040);
  JUMPOUT(0x24890D0B4);
}

void sub_24890D088()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x24890D0B4);
}

void sub_24890D090()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x24890D0B4);
}

uint64_t sub_24890D098(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_WORD *)(v6 + v7) = 0;
  if (!a2)
    goto LABEL_6;
  if (a3 < 0x7FFFFFFE)
  {
    if (a2 > 0x7FFFFFFE)
      JUMPOUT(0x24890D0A4);
    *(_QWORD *)((v6 + v5 + 7) & 0xFFFFFFFFFFFFFFF8) = a2;
LABEL_6:
    JUMPOUT(0x24890D0B4);
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v6);
}

uint64_t type metadata completion function for TUSTrialNamespaceManager(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;

  type metadata accessor for TUSTrialAssets(255, *(_QWORD *)(a1 + 80), a3, a4);
  result = type metadata accessor for Optional();
  if (v5 <= 0x3F)
  {
    result = type metadata accessor for Date();
    if (v6 <= 0x3F)
      return swift_initClassMetadata2();
  }
  return result;
}

uint64_t getEnumTagSinglePayload for TUSTrialNameSpaceError(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for TUSTrialNameSpaceError(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_24890D250 + 4 * byte_2489178DF[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_24890D270 + 4 * byte_2489178E4[v4]))();
}

_BYTE *sub_24890D250(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_24890D270(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24890D278(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24890D280(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24890D288(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24890D290(_DWORD *result)
{
  *result = 0;
  return result;
}

void *type metadata accessor for TUSTrialNameSpaceError()
{
  return &unk_2519A97C8;
}

uint64_t outlined destroy of TUSAfterInitHookable?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24890D330()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TA(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TATQ0_;
  return ((uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5Tu
                                                 + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5Tu))(a1, v4);
}

uint64_t sub_24890D3C4()
{
  return objectdestroy_5Tm((void (*)(_QWORD))MEMORY[0x24BEE4EF8], (void (*)(_QWORD))MEMORY[0x24BEE4BC0]);
}

uint64_t partial apply for closure #1 in closure #1 in TUSTrialNamespaceManager.downloadFactor(_:)(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in closure #1 in TUSTrialNamespaceManager.downloadFactor(_:)(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_24890D3E8()
{
  return objectdestroy_5Tm((void (*)(_QWORD))MEMORY[0x24BEE4F70], (void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t partial apply for closure #1 in closure #1 in TUSTrialNamespaceManager.init(namespaceName:trialClient:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  _QWORD *v8;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_BYTE *)(v1 + 40);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TATQ0_;
  return closure #1 in closure #1 in TUSTrialNamespaceManager.init(namespaceName:trialClient:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:)(a1, v4, v5, v6, v7);
}

uint64_t sub_24890D47C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTA(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 24);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = partial apply for closure #1 in closure #1 in TUSLazyPurgeable.instantiateState();
  return ((uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTu
                                                 + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRTu))(a1, v4);
}

uint64_t sub_24890D520()
{
  return objectdestroy_5Tm((void (*)(_QWORD))MEMORY[0x24BEE4F70], (void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t objectdestroy_5Tm(void (*a1)(_QWORD), void (*a2)(_QWORD))
{
  uint64_t v2;

  a1(*(_QWORD *)(v2 + 16));
  a2(*(_QWORD *)(v2 + 32));
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in TUSTrialNamespaceManager.init(namespaceName:trialProjectID:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  _QWORD *v8;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_BYTE *)(v1 + 40);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TATQ0_;
  return closure #1 in closure #1 in TUSTrialNamespaceManager.init(namespaceName:trialProjectID:isInSpectatorMode:shouldEagerlyGetAssets:downloadOptions:factorsValidator:defaultFactorsLoader:)(a1, v4, v5, v6, v7);
}

unint64_t type metadata accessor for OS_dispatch_queue_serial()
{
  unint64_t result;

  result = lazy cache variable for type metadata for OS_dispatch_queue_serial;
  if (!lazy cache variable for type metadata for OS_dispatch_queue_serial)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for OS_dispatch_queue_serial);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_queue_serial.Attributes and conformance OS_dispatch_queue_serial.Attributes()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type OS_dispatch_queue_serial.Attributes and conformance OS_dispatch_queue_serial.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue_serial.Attributes and conformance OS_dispatch_queue_serial.Attributes)
  {
    v1 = type metadata accessor for OS_dispatch_queue_serial.Attributes();
    result = MEMORY[0x24959EFF8](MEMORY[0x24BEE5940], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue_serial.Attributes and conformance OS_dispatch_queue_serial.Attributes);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [OS_dispatch_queue_serial.Attributes] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [OS_dispatch_queue_serial.Attributes] and conformance [A];
  if (!lazy protocol witness table cache variable for type [OS_dispatch_queue_serial.Attributes] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [OS_dispatch_queue_serial.Attributes]);
    result = MEMORY[0x24959EFF8](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [OS_dispatch_queue_serial.Attributes] and conformance [A]);
  }
  return result;
}

void __swiftcall TokenizerOutput.init(tokenizerOutputObjc:padId:processedInput:)(TextUnderstandingShared::TokenizerOutput *__return_ptr retstr, TokenizerOutputObjc tokenizerOutputObjc, Swift::Float padId, Swift::String processedInput)
{
  TextUnderstandingShared::TokenizerOutput v5;

  specialized TokenizerOutput.init(tokenizerOutputObjc:padId:processedInput:)(tokenizerOutputObjc.super.isa);
  *retstr = v5;
}

uint64_t TokenizerOutput.tokenIds.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TokenizerOutput.attentionMask.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TokenizerOutput.tokenizerWordRangesUTF8.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TokenizerOutput.wordIds.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TokenizerOutput.processedInput.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

void __swiftcall TokenizerOutput.init(tokenIds:attentionMask:tokenizerWordRangesUTF8:wordIds:processedInput:)(TextUnderstandingShared::TokenizerOutput *__return_ptr retstr, Swift::OpaquePointer tokenIds, Swift::OpaquePointer attentionMask, Swift::OpaquePointer tokenizerWordRangesUTF8, Swift::OpaquePointer wordIds, Swift::String processedInput)
{
  retstr->tokenIds = tokenIds;
  retstr->attentionMask = attentionMask;
  retstr->tokenizerWordRangesUTF8 = tokenizerWordRangesUTF8;
  retstr->wordIds = wordIds;
  retstr->processedInput = processedInput;
}

void specialized TokenizerOutput.init(tokenizerOutputObjc:padId:processedInput:)(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_tokenIds);
  static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v3 = v2;

  __asm { BR              X10 }
}

uint64_t sub_24890D818(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,char a25,char a26,char a27)
{
  uint64_t v27;
  void *v28;
  id v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v29 = objc_msgSend(v28, *(SEL *)(v27 + 1232));
  static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v31 = v30;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&loc_24890D8B8
                                                                                       + *((int *)qword_24890E4D0
                                                                                         + (v31 >> 62))))(v32, v33, v34, v35, v36, v37);
}

uint64_t sub_24890D8C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  float v19;
  uint64_t v20;
  int64_t v21;
  uint64_t v22;
  float *v23;
  unint64_t v24;
  float v25;
  unint64_t v26;
  id v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v20 = specialized _copyCollectionToContiguousArray<A>(_:)((char *)&a14, (uint64_t)BYTE6(v18) >> 2);
  outlined consume of Data._Representation(v14, v18);
  outlined consume of Data._Representation(v17, v16);
  v21 = *(_QWORD *)(v20 + 16);
  if (v21)
  {
    a14 = MEMORY[0x24BEE4AF8];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v21, 0);
    v22 = a14;
    v23 = (float *)(v20 + 32);
    v24 = *(_QWORD *)(a14 + 16);
    do
    {
      if (*v23 == v19)
        v25 = 0.0;
      else
        v25 = 1.0;
      a14 = v22;
      v26 = *(_QWORD *)(v22 + 24);
      if (v24 >= v26 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v26 > 1, v24 + 1, 1);
        v22 = a14;
      }
      *(_QWORD *)(v22 + 16) = v24 + 1;
      *(float *)(v22 + 4 * v24 + 32) = v25;
      ++v23;
      ++v24;
      --v21;
    }
    while (v21);
  }
  v27 = objc_msgSend(v15, sel_tokenRanges);
  static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v29 = v28;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&loc_24890DC70
                                                                                       + *((int *)qword_24890E4E0
                                                                                         + (v29 >> 62))))(v30, v31, v32, v33, v34, v35);
}

uint64_t sub_24890DC80(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,char a25,char a26,char a27)
{
  uint64_t v27;
  void *v28;
  id v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v29 = objc_msgSend(v28, *(SEL *)(v27 + 1240));
  static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v31 = v30;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&loc_24890DD20
                                                                                       + *((int *)qword_24890E520
                                                                                         + (v31 >> 62))))(v32, v33, v34, v35, v36, v37);
}

uint64_t sub_24890DD30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  uint64_t v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  va_list va;

  va_start(va, a5);
  specialized _copyCollectionToContiguousArray<A>(_:)(va, (uint64_t)BYTE6(v9) >> 4);
  outlined consume of Data._Representation(v5, v9);
  outlined consume of Data._Representation(v8, v7);
  v10 = objc_msgSend(v6, sel_wordIndexes);
  static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = v11;

  return ((uint64_t (*)(void))((char *)&loc_24890E038 + *((int *)qword_24890E530 + (v12 >> 62))))();
}

uint64_t sub_24890E048(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,char a25,char a26,char a27)
{
  uint64_t v27;
  void *v28;
  id v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v29 = objc_msgSend(v28, *(SEL *)(v27 + 1248));
  static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v31 = v30;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&loc_24890E0E8
                                                                                       + *((int *)qword_24890E570
                                                                                         + (v31 >> 62))))(v32, v33, v34, v35, v36, v37);
}

uint64_t destroy for TokenizerOutput()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for TokenizerOutput(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for TokenizerOutput(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for TokenizerOutput(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TokenizerOutput(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TokenizerOutput(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TokenizerOutput()
{
  return &type metadata for TokenizerOutput;
}

uint64_t outlined consume of Data._Representation(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t outlined copy of Data._Representation(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t Signposter.name.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t Signposter.state.getter()
{
  return swift_retain();
}

uint64_t Signposter.signposter.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for Signposter() + 24);
  v4 = type metadata accessor for OSSignposter();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for Signposter()
{
  uint64_t result;

  result = type metadata singleton initialization cache for Signposter;
  if (!type metadata singleton initialization cache for Signposter)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t Signposter.init(name:state:signposter:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)a6 = a1;
  *(_QWORD *)(a6 + 8) = a2;
  *(_BYTE *)(a6 + 16) = a3;
  *(_QWORD *)(a6 + 24) = a4;
  v7 = a6 + *(int *)(type metadata accessor for Signposter() + 24);
  v8 = type metadata accessor for OSSignposter();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v7, a5, v8);
}

uint64_t static Signposter.begin(logger:name:)@<X0>(uint64_t a1@<X0>, const char *a2@<X1>, uint64_t a3@<X2>, unsigned __int8 a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  NSObject *v28;
  int v29;
  uint64_t result;
  const char *v31;
  uint64_t v32;
  void (*v33)(char *, char *, uint64_t);
  uint8_t *v34;
  os_signpost_id_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  int v47;
  char v48;

  v45 = a3;
  v46 = a2;
  v47 = a4;
  v42 = type metadata accessor for OSSignpostID();
  v7 = *(_QWORD *)(v42 - 8);
  v10 = MEMORY[0x24BDAC7A8](v42, v8, v9);
  v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10, v13, v14);
  v16 = (char *)&v39 - v15;
  v17 = type metadata accessor for Logger();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17, v19, v20);
  v22 = (char *)&v39 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = type metadata accessor for OSSignposter();
  v43 = *(_QWORD *)(v23 - 8);
  v44 = v23;
  MEMORY[0x24BDAC7A8](v23, v24, v25);
  v27 = (char *)&v39 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v22, a1, v17);
  OSSignposter.init(logger:)();
  OSSignposter.logHandle.getter();
  OSSignpostID.init(log:)();
  v28 = OSSignposter.logHandle.getter();
  v29 = static os_signpost_type_t.begin.getter();
  result = OS_os_log.signpostsEnabled.getter();
  if ((result & 1) == 0)
    goto LABEL_5;
  v41 = v29;
  if ((v47 & 1) == 0)
  {
    v31 = v46;
    if (!v46)
    {
      __break(1u);
LABEL_5:

      v32 = v42;
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v12, v16, v42);
LABEL_11:
      type metadata accessor for OSSignpostIntervalState();
      swift_allocObject();
      v36 = OSSignpostIntervalState.init(id:isOpen:)();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v16, v32);
      v37 = v45;
      *(_QWORD *)a5 = v46;
      *(_QWORD *)(a5 + 8) = v37;
      *(_BYTE *)(a5 + 16) = v47;
      *(_QWORD *)(a5 + 24) = v36;
      v38 = type metadata accessor for Signposter();
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v43 + 32))(a5 + *(int *)(v38 + 24), v27, v44);
    }
LABEL_10:
    v40 = v31;
    v33 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
    v32 = v42;
    v33(v12, v16, v42);
    v34 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v34 = 0;
    v35 = OSSignpostID.rawValue.getter();
    _os_signpost_emit_with_name_impl(&dword_2488EF000, v28, (os_signpost_type_t)v41, v35, v40, "", v34, 2u);
    MEMORY[0x24959F0A0](v34, -1, -1);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v32);
    v33(v12, v16, v32);
    goto LABEL_11;
  }
  if ((unint64_t)v46 >> 32)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v46 >> 11 != 27)
  {
    if (v46 >> 16 <= 0x10)
    {
      v31 = &v48;
      goto LABEL_10;
    }
    goto LABEL_13;
  }
LABEL_14:
  __break(1u);
  return result;
}

Swift::Void __swiftcall Signposter.end()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  char *v30;
  uint8_t *v31;
  os_signpost_id_t v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  int v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  const char *v40;
  char v41;

  v37 = type metadata accessor for OSSignpostError();
  v39 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37, v1, v2);
  v36 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for OSSignpostID();
  v5 = *(_QWORD *)(v4 - 8);
  v8 = MEMORY[0x24BDAC7A8](v4, v6, v7);
  v38 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8, v10, v11);
  v13 = (char *)&v34 - v12;
  v14 = type metadata accessor for OSSignposter();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14, v16, v17);
  v19 = (char *)&v34 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = type metadata accessor for Signposter();
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v19, v0 + *(int *)(v20 + 24), v14);
  v40 = *(const char **)v0;
  v21 = *(_BYTE *)(v0 + 16);
  v22 = OSSignposter.logHandle.getter();
  OSSignpostIntervalState.signpostID.getter();
  v35 = static os_signpost_type_t.end.getter();
  if ((OS_os_log.signpostsEnabled.getter() & 1) == 0)
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v13, v4);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v19, v14);
    return;
  }
  v34 = v15;
  if ((v21 & 1) != 0)
  {
    v23 = v39;
    if (!((unint64_t)v40 >> 32))
    {
      if (v40 >> 11 == 27)
      {
LABEL_18:
        __break(1u);
        return;
      }
      if (v40 >> 16 <= 0x10)
      {
        v24 = v5;
        v40 = &v41;
        goto LABEL_10;
      }
LABEL_17:
      __break(1u);
      goto LABEL_18;
    }
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v23 = v39;
  if (!v40)
  {
    __break(1u);
    goto LABEL_16;
  }
  v24 = v5;
LABEL_10:
  swift_retain();
  v25 = v36;
  checkForErrorAndConsumeState(state:)();
  swift_release();
  v26 = v37;
  v27 = v14;
  if ((*(unsigned int (**)(char *, uint64_t))(v23 + 88))(v25, v37) == *MEMORY[0x24BEE7810])
  {
    v28 = "[Error] Interval already ended";
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v26);
    v28 = "";
  }
  v29 = v34;
  v30 = v38;
  (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v38, v13, v4);
  v31 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)v31 = 0;
  v32 = OSSignpostID.rawValue.getter();
  _os_signpost_emit_with_name_impl(&dword_2488EF000, v22, (os_signpost_type_t)v35, v32, v40, v28, v31, 2u);
  MEMORY[0x24959F0A0](v31, -1, -1);

  v33 = *(void (**)(char *, uint64_t))(v24 + 8);
  v33(v13, v4);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v19, v27);
  v33(v30, v4);
}

uint64_t withSignpost<A>(logger:name:closure:)(uint64_t a1, const char *a2, uint64_t a3, unsigned __int8 a4, void (*a5)(uint64_t))
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v17;

  v10 = type metadata accessor for Signposter();
  MEMORY[0x24BDAC7A8](v10, v11, v12);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = static Signposter.begin(logger:name:)(a1, a2, a3, a4, (uint64_t)v14);
  a5(v15);
  Signposter.end()();
  return outlined destroy of Signposter((uint64_t)v14);
}

uint64_t withSignpostAsync<A>(logger:name:closure:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;

  *(_QWORD *)(v7 + 48) = a6;
  *(_QWORD *)(v7 + 56) = a7;
  *(_BYTE *)(v7 + 88) = a5;
  *(_QWORD *)(v7 + 32) = a3;
  *(_QWORD *)(v7 + 40) = a4;
  *(_QWORD *)(v7 + 16) = a1;
  *(_QWORD *)(v7 + 24) = a2;
  type metadata accessor for Signposter();
  *(_QWORD *)(v7 + 64) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t withSignpostAsync<A>(logger:name:closure:)()
{
  uint64_t v0;
  int *v1;
  _QWORD *v2;
  uint64_t (*v4)(_QWORD);

  v1 = *(int **)(v0 + 48);
  static Signposter.begin(logger:name:)(*(_QWORD *)(v0 + 24), *(const char **)(v0 + 32), *(_QWORD *)(v0 + 40), *(_BYTE *)(v0 + 88), *(_QWORD *)(v0 + 64));
  v4 = (uint64_t (*)(_QWORD))((char *)v1 + *v1);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v2;
  *v2 = v0;
  v2[1] = withSignpostAsync<A>(logger:name:closure:);
  return v4(*(_QWORD *)(v0 + 16));
}

{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 64);
  Signposter.end()();
  outlined destroy of Signposter(v1);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 64);
  Signposter.end()();
  outlined destroy of Signposter(v1);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t outlined destroy of Signposter(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for Signposter();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_QWORD *initializeBufferWithCopyOfBuffer for Signposter(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v10 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v10 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
    *(_QWORD *)(a1 + 24) = a2[3];
    v5 = *(int *)(a3 + 24);
    v6 = a1 + v5;
    v7 = (uint64_t)a2 + v5;
    v8 = type metadata accessor for OSSignposter();
    v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
    swift_retain();
    v9(v6, v7, v8);
  }
  return v3;
}

uint64_t destroy for Signposter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = type metadata accessor for OSSignposter();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t initializeWithCopy for Signposter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v4 = *(int *)(a3 + 24);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = type metadata accessor for OSSignposter();
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
  swift_retain();
  v8(v5, v6, v7);
  return a1;
}

uint64_t assignWithCopy for Signposter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  v6 = *(int *)(a3 + 24);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = type metadata accessor for OSSignposter();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t initializeWithTake for Signposter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v4 = *(int *)(a3 + 24);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = type metadata accessor for OSSignposter();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t assignWithTake for Signposter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  v6 = *(int *)(a3 + 24);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = type metadata accessor for OSSignposter();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for Signposter()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24890F4EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for OSSignposter();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for Signposter()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24890F574(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 24) = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for OSSignposter();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata completion function for Signposter()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for OSSignposter();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *NLGazetteer.supportGazetteer.unsafeMutableAddressor()
{
  if (one-time initialization token for supportGazetteer != -1)
    swift_once();
  return &static NLGazetteer.supportGazetteer;
}

id one-time initialization function for supportGazetteer()
{
  id result;

  result = closure #1 in variable initialization expression of static NLGazetteer.supportGazetteer();
  static NLGazetteer.supportGazetteer = (uint64_t)result;
  return result;
}

id closure #1 in variable initialization expression of static NLGazetteer.supportGazetteer()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  void *v40;
  char *v41;
  NSObject *v42;
  os_log_type_t v43;
  BOOL v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v0 = type metadata accessor for URL.DirectoryHint();
  v54 = *(_QWORD *)(v0 - 8);
  v55 = v0;
  MEMORY[0x24BDAC7A8](v0, v1, v2);
  v4 = (char *)&v50 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8](v5, v6, v7);
  v9 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for URL();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v12, v13);
  v15 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for Logger();
  v56 = *(_QWORD *)(v16 - 8);
  v19 = MEMORY[0x24BDAC7A8](v16, v17, v18);
  v53 = (char *)&v50 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x24BDAC7A8](v19, v21, v22);
  v52 = (char *)&v50 - v24;
  MEMORY[0x24BDAC7A8](v23, v25, v26);
  v28 = (char *)&v50 - v27;
  v29 = (void *)MEMORY[0x24959E374](0xD000000000000021, 0x8000000248917DE0);
  v30 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v29);

  if (!v30)
  {
    Logger.init()();
    v36 = Logger.logObject.getter();
    v37 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc();
      v39 = swift_slowAlloc();
      v58 = v39;
      *(_DWORD *)v38 = 136315138;
      v57 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000021, 0x8000000248917DE0, &v58);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_2488EF000, v36, v37, "Unable to initialize bundle %s for supportGazetteer", v38, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24959F0A0](v39, -1, -1);
      MEMORY[0x24959F0A0](v38, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v56 + 8))(v28, v16);
    return 0;
  }
  v51 = v16;
  v31 = v30;
  v32 = (void *)MEMORY[0x24959E374](0xD000000000000018, 0x8000000248919760);
  v33 = (void *)MEMORY[0x24959E374](0x636C65646F6D6C6DLL, 0xE800000000000000);
  v34 = objc_msgSend(v31, sel_pathForResource_ofType_, v32, v33);

  if (!v34)
  {
    v40 = v31;
    v41 = v52;
    Logger.init()();
    v42 = Logger.logObject.getter();
    v43 = static os_log_type_t.error.getter();
    v44 = os_log_type_enabled(v42, v43);
    v45 = v56;
    if (v44)
    {
      v46 = swift_slowAlloc();
      v47 = swift_slowAlloc();
      v58 = v47;
      *(_DWORD *)v46 = 136315394;
      v57 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000018, 0x8000000248919760, &v58);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v46 + 12) = 2080;
      v57 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0x636C65646F6D6C6DLL, 0xE800000000000000, &v58);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_2488EF000, v42, v43, "Unable to get URL path for resource %s of type %s for supportGazetteer", (uint8_t *)v46, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24959F0A0](v47, -1, -1);
      MEMORY[0x24959F0A0](v46, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v45 + 8))(v41, v51);
    return 0;
  }
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
  (*(void (**)(char *, _QWORD, uint64_t))(v54 + 104))(v4, *MEMORY[0x24BDCD7A0], v55);
  swift_bridgeObjectRetain();
  URL.init(filePath:directoryHint:relativeTo:)();
  v35 = objc_allocWithZone(MEMORY[0x24BDDFD48]);
  v48 = @nonobjc NLGazetteer.init(contentsOf:)((uint64_t)v15);
  swift_bridgeObjectRelease();

  return v48;
}

uint64_t static NLGazetteer.supportGazetteer.getter()
{
  uint64_t v0;
  id v1;

  if (one-time initialization token for supportGazetteer != -1)
    swift_once();
  v0 = static NLGazetteer.supportGazetteer;
  v1 = (id)static NLGazetteer.supportGazetteer;
  return v0;
}

id @nonobjc NLGazetteer.init(contentsOf:)(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  id v10;
  id v11;
  uint64_t v12;
  id v14;
  NSURL *v15;

  v2 = v1;
  v15 = (NSURL *)*MEMORY[0x24BDAC8D0];
  URL._bridgeToObjectiveC()(v15);
  v5 = v4;
  v14 = 0;
  v6 = objc_msgSend(v2, sel_initWithContentsOfURL_error_, v4, &v14);

  v7 = v14;
  if (v6)
  {
    v8 = type metadata accessor for URL();
    v9 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8);
    v10 = v7;
    v9(a1, v8);
  }
  else
  {
    v11 = v14;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    v12 = type metadata accessor for URL();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(a1, v12);
  }
  return v6;
}

uint64_t CaptionPhraseResolver.init()()
{
  uint64_t v0;

  v0 = specialized CaptionPhraseResolver.uninterestingCaptionsConfiguration()(0xD000000000000015, 0x80000002489197A0, "Could not find caption phrase deny list at bundle path %s");
  if (v0
    && !specialized CaptionPhraseResolver.uninterestingCaptionsConfiguration()(0xD000000000000017, 0x8000000248919780, "Could not find caption token deny list at bundle path %s"))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v0;
}

uint64_t specialized Sequence<>.contains(_:)(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t result;
  _QWORD *v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;

  v3 = a3[2];
  if (!v3)
    return 0;
  if (a3[4] == a1 && a3[5] == a2)
    return 1;
  result = _stringCompareWithSmolCheck(_:_:expecting:)();
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v9 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v11 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

Swift::Bool __swiftcall CaptionPhraseResolver.hasDisallowedCaption(with:languageCode:)(Swift::String_optional with, Swift::String_optional languageCode)
{
  uint64_t v2;
  uint64_t v3;
  void *object;
  uint64_t countAndFlagsBits;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v32;
  void *v33;
  uint64_t v34;

  v3 = v2;
  object = languageCode.value._object;
  countAndFlagsBits = languageCode.value._countAndFlagsBits;
  v6 = with.value._object;
  v7 = with.value._countAndFlagsBits;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Locale?);
  MEMORY[0x24BDAC7A8](v8, v9, v10);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!v3 || !v6)
    goto LABEL_15;
  if (object)
    v13 = countAndFlagsBits;
  else
    v13 = 0;
  if (object)
    v14 = (uint64_t)object;
  else
    v14 = 0xE000000000000000;
  if (!*(_QWORD *)(v3 + 16))
  {
    swift_bridgeObjectRetain();
LABEL_14:
    swift_bridgeObjectRelease();
LABEL_15:
    v30 = 0;
    return v30 & 1;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v15 = specialized __RawDictionaryStorage.find<A>(_:)(v13, v14);
  if ((v16 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  v17 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v15);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v32 = v7;
  v33 = v6;
  lazy protocol witness table accessor for type String and conformance String();
  v18 = StringProtocol.localizedLowercase.getter();
  v20 = v19;
  swift_bridgeObjectRelease();
  v32 = v18;
  v33 = v20;
  swift_bridgeObjectRetain();
  Locale.init(identifier:)();
  v21 = type metadata accessor for Locale();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v12, 0, 1, v21);
  v22 = StringProtocol.folding(options:locale:)();
  v24 = v23;
  outlined destroy of Locale?((uint64_t)v12);
  swift_bridgeObjectRelease();
  v25 = specialized Set.init<A>(_:)(v17);
  swift_bridgeObjectRelease();
  v26 = swift_allocObject();
  *(_QWORD *)(v26 + 16) = MEMORY[0x24BEE4AF8];
  v27 = (uint64_t *)(v26 + 16);
  v32 = v22;
  v33 = v24;
  v34 = 15;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PartialRangeFrom<String.Index>);
  lazy protocol witness table accessor for type PartialRangeFrom<String.Index> and conformance PartialRangeFrom<A>();
  StringProtocol.enumerateSubstrings<A>(in:options:_:)();
  swift_release();
  swift_beginAccess();
  v28 = *v27;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_release();
  v29 = specialized Set.init<A>(_:)(v28);
  swift_bridgeObjectRelease();
  LOBYTE(v28) = specialized Set.isDisjoint(with:)(v25, v29);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v30 = v28 ^ 1;
  return v30 & 1;
}

uint64_t specialized Set.isDisjoint(with:)(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  Swift::Int v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  BOOL v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v33;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 1;
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
    return 1;
  if (v2 >= v3)
    v4 = a1;
  else
    v4 = a2;
  if (v2 >= v3)
    v5 = a2;
  else
    v5 = a1;
  v32 = v4;
  v33 = v4 + 56;
  v6 = -1 << *(_BYTE *)(v4 + 32);
  if (-v6 < 64)
    v7 = ~(-1 << -(char)v6);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v4 + 56);
  v31 = (unint64_t)(63 - v6) >> 6;
  v9 = v5 + 56;
  swift_bridgeObjectRetain();
  result = swift_bridgeObjectRetain();
  v11 = 0;
  while (1)
  {
    while (1)
    {
      v12 = v11;
      if (!v8)
        break;
      v13 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v14 = v13 | (v11 << 6);
      if (*(_QWORD *)(v5 + 16))
        goto LABEL_31;
    }
    v15 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_50;
    }
    if (v15 >= v31)
      goto LABEL_48;
    v16 = *(_QWORD *)(v33 + 8 * v15);
    ++v11;
    if (!v16)
    {
      v11 = v12 + 2;
      if (v12 + 2 >= v31)
        goto LABEL_48;
      v16 = *(_QWORD *)(v33 + 8 * v11);
      if (!v16)
      {
        v11 = v12 + 3;
        if (v12 + 3 >= v31)
          goto LABEL_48;
        v16 = *(_QWORD *)(v33 + 8 * v11);
        if (!v16)
          break;
      }
    }
LABEL_30:
    v8 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v11 << 6);
    if (*(_QWORD *)(v5 + 16))
    {
LABEL_31:
      v18 = (uint64_t *)(*(_QWORD *)(v32 + 48) + 16 * v14);
      v20 = *v18;
      v19 = v18[1];
      Hasher.init(_seed:)();
      swift_bridgeObjectRetain();
      String.hash(into:)();
      v21 = Hasher._finalize()();
      v22 = -1 << *(_BYTE *)(v5 + 32);
      v23 = v21 & ~v22;
      if (((*(_QWORD *)(v9 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) != 0)
      {
        v24 = *(_QWORD *)(v5 + 48);
        v25 = (_QWORD *)(v24 + 16 * v23);
        v26 = *v25 == v20 && v25[1] == v19;
        if (v26 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
LABEL_44:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v30 = 0;
LABEL_45:
          outlined consume of [String : String].Iterator._Variant();
          return v30;
        }
        v27 = ~v22;
        while (1)
        {
          v23 = (v23 + 1) & v27;
          if (((*(_QWORD *)(v9 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) == 0)
            break;
          v28 = (_QWORD *)(v24 + 16 * v23);
          v29 = *v28 == v20 && v28[1] == v19;
          if (v29 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
            goto LABEL_44;
        }
      }
      result = swift_bridgeObjectRelease();
    }
  }
  v17 = v12 + 4;
  if (v12 + 4 >= v31)
  {
LABEL_48:
    swift_bridgeObjectRelease();
    v30 = 1;
    goto LABEL_45;
  }
  v16 = *(_QWORD *)(v33 + 8 * v17);
  if (v16)
  {
    v11 = v12 + 4;
    goto LABEL_30;
  }
  while (1)
  {
    v11 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v11 >= v31)
      goto LABEL_48;
    v16 = *(_QWORD *)(v33 + 8 * v11);
    ++v17;
    if (v16)
      goto LABEL_30;
  }
LABEL_50:
  __break(1u);
  return result;
}

uint64_t specialized Set._Variant.insert(_:)(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t *v3;
  uint64_t v7;
  Swift::Int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  Swift::Int *v14;
  Swift::Int v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  v8 = Hasher._finalize()();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (Swift::Int *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  specialized _NativeSet.insertNew(_:at:isUnique:)(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t specialized _NativeSet.resize(capacity:)()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<String>);
  v3 = static _SetStorage.resize(original:capacity:move:)();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = swift_retain();
    v11 = 0;
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      Hasher.init(_seed:)();
      String.hash(into:)();
      result = Hasher._finalize()();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

Swift::Int specialized _NativeSet.insertNew(_:at:isUnique:)(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  Swift::Int v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  Swift::Int *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    specialized _NativeSet.resize(capacity:)();
  }
  else
  {
    if (v10 > v9)
    {
      result = (Swift::Int)specialized _NativeSet.copy()();
      goto LABEL_22;
    }
    specialized _NativeSet.copyAndResize(capacity:)();
  }
  v11 = *v4;
  Hasher.init(_seed:)();
  String.hash(into:)();
  result = Hasher._finalize()();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
    {
LABEL_21:
      result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = _stringCompareWithSmolCheck(_:_:expecting:)();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (Swift::Int *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

void *specialized _NativeSet.copy()()
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
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<String>);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t specialized _NativeSet.copyAndResize(capacity:)()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<String>);
  v3 = static _SetStorage.resize(original:capacity:move:)();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    result = Hasher._finalize()();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t specialized Set.init<A>(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  Swift::Int *v4;
  Swift::Int v5;
  Swift::Int v6;
  Swift::Int v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = Set.init(minimumCapacity:)();
  v8 = result;
  if (v2)
  {
    v4 = (Swift::Int *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      specialized Set._Variant.insert(_:)(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t specialized CaptionPhraseResolver.uninterestingCaptionsConfiguration()()
{
  return specialized CaptionPhraseResolver.uninterestingCaptionsConfiguration()(0xD000000000000015, 0x80000002489197A0, "Could not find caption phrase deny list at bundle path %s");
}

uint64_t specialized CaptionPhraseResolver.disallowedCaptionTokensConfiguration()()
{
  return specialized CaptionPhraseResolver.uninterestingCaptionsConfiguration()(0xD000000000000017, 0x8000000248919780, "Could not find caption token deny list at bundle path %s");
}

uint64_t specialized CaptionPhraseResolver.uninterestingCaptionsConfiguration()(uint64_t a1, uint64_t a2, const char *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint8_t *v38;
  uint8_t *v39;
  void (*v40)(char *, uint64_t);
  char *v41;
  NSObject *v42;
  os_log_type_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  NSObject *v49;
  uint64_t v50;
  uint8_t *v51;
  uint64_t v52;
  id v53;
  id v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;

  v6 = type metadata accessor for Logger();
  v7 = *(_QWORD *)(v6 - 8);
  v10 = MEMORY[0x24BDAC7A8](v6, v8, v9);
  v12 = (char *)&v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v10, v13, v14);
  v17 = (char *)&v59 - v16;
  MEMORY[0x24BDAC7A8](v15, v18, v19);
  v21 = (char *)&v59 - v20;
  v22 = (void *)MEMORY[0x24959E374](0xD000000000000021, 0x8000000248917DE0);
  v23 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v22);

  if (!v23)
  {
    Logger.init()();
    v35 = Logger.logObject.getter();
    v36 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v35, (os_log_type_t)v36))
    {
      v37 = v7;
      v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v38 = 0;
      _os_log_impl(&dword_2488EF000, v35, (os_log_type_t)v36, "Could not find TextUnderstandingShared bundle", v38, 2u);
      v39 = v38;
      v7 = v37;
      MEMORY[0x24959F0A0](v39, -1, -1);
    }

    v40 = *(void (**)(char *, uint64_t))(v7 + 8);
    v41 = v12;
    goto LABEL_15;
  }
  v24 = (void *)MEMORY[0x24959E374](a1, a2);
  v25 = (void *)MEMORY[0x24959E374](0x7473696C70, 0xE500000000000000);
  v26 = objc_msgSend(v23, sel_pathForResource_ofType_, v24, v25);

  if (!v26)
  {
    Logger.init()();
    v48 = v23;
    v49 = Logger.logObject.getter();
    v50 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v49, (os_log_type_t)v50))
    {
      v60 = a3;
      v51 = (uint8_t *)swift_slowAlloc();
      v52 = swift_slowAlloc();
      v64 = v52;
      v62 = v7;
      *(_DWORD *)v51 = 136315138;
      v53 = objc_msgSend(v48, sel_bundlePath, v51 + 4);
      v61 = v6;
      v54 = v53;
      v55 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v57 = v56;

      v63 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v55, v57, &v64);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2488EF000, v49, (os_log_type_t)v50, v60, v51, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24959F0A0](v52, -1, -1);
      MEMORY[0x24959F0A0](v51, -1, -1);

      (*(void (**)(char *, uint64_t))(v62 + 8))(v17, v61);
      return 0;
    }

    v40 = *(void (**)(char *, uint64_t))(v7 + 8);
    v41 = v17;
LABEL_15:
    v40(v41, v6);
    return 0;
  }
  v27 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v29 = v28;

  v30 = objc_allocWithZone(MEMORY[0x24BDBCE70]);
  swift_bridgeObjectRetain();
  v31 = (void *)MEMORY[0x24959E374](v27, v29);
  swift_bridgeObjectRelease();
  v32 = objc_msgSend(v30, sel_initWithContentsOfFile_, v31);

  if (!v32
    || (v64 = 0,
        v33 = v32,
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]),
        static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)(),
        v33,
        (v34 = v64) == 0))
  {
    Logger.init()();
    swift_bridgeObjectRetain();
    v42 = Logger.logObject.getter();
    v43 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = swift_slowAlloc();
      v62 = v7;
      v45 = v44;
      v46 = swift_slowAlloc();
      v61 = v6;
      v47 = v46;
      v64 = v46;
      *(_DWORD *)v45 = 136315138;
      v60 = (const char *)(v45 + 4);
      swift_bridgeObjectRetain();
      v63 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v27, v29, &v64);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2488EF000, v42, v43, "Failed to load contents at %s", (uint8_t *)v45, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24959F0A0](v47, -1, -1);
      MEMORY[0x24959F0A0](v45, -1, -1);

      (*(void (**)(char *, uint64_t))(v62 + 8))(v21, v61);
      return 0;
    }

    swift_bridgeObjectRelease_n();
    v40 = *(void (**)(char *, uint64_t))(v7 + 8);
    v41 = v21;
    goto LABEL_15;
  }

  swift_bridgeObjectRelease();
  return v34;
}

uint64_t specialized CaptionPhraseResolver.hasUninterestingCaption(with:languageCode:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v29;
  uint64_t v30;

  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Locale?);
  MEMORY[0x24BDAC7A8](v10, v11, v12);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a5 || !a2)
    goto LABEL_15;
  if (a4)
    v15 = a3;
  else
    v15 = 0;
  if (a4)
    v16 = a4;
  else
    v16 = 0xE000000000000000;
  if (!*(_QWORD *)(a5 + 16))
  {
    swift_bridgeObjectRetain();
LABEL_14:
    swift_bridgeObjectRelease();
LABEL_15:
    v27 = 0;
    return v27 & 1;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v17 = specialized __RawDictionaryStorage.find<A>(_:)(v15, v16);
  if ((v18 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  v19 = *(_QWORD **)(*(_QWORD *)(a5 + 56) + 8 * v17);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v29 = a1;
  v30 = a2;
  lazy protocol witness table accessor for type String and conformance String();
  v20 = StringProtocol.localizedLowercase.getter();
  v22 = v21;
  swift_bridgeObjectRelease();
  v29 = v20;
  v30 = v22;
  swift_bridgeObjectRetain();
  Locale.init(identifier:)();
  v23 = type metadata accessor for Locale();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v14, 0, 1, v23);
  v24 = StringProtocol.folding(options:locale:)();
  v26 = v25;
  outlined destroy of Locale?((uint64_t)v14);
  swift_bridgeObjectRelease();
  v27 = specialized Sequence<>.contains(_:)(v24, v26, v19);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v27 & 1;
}

uint64_t sub_248911874()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

unint64_t lazy protocol witness table accessor for type PartialRangeFrom<String.Index> and conformance PartialRangeFrom<A>()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type PartialRangeFrom<String.Index> and conformance PartialRangeFrom<A>;
  if (!lazy protocol witness table cache variable for type PartialRangeFrom<String.Index> and conformance PartialRangeFrom<A>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for PartialRangeFrom<String.Index>);
    result = MEMORY[0x24959EFF8](MEMORY[0x24BEE2C50], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PartialRangeFrom<String.Index> and conformance PartialRangeFrom<A>);
  }
  return result;
}

uint64_t destroy for CaptionPhraseResolver()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeBufferWithCopyOfBuffer for CaptionPhraseResolver(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for CaptionPhraseResolver(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for CaptionPhraseResolver(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CaptionPhraseResolver(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CaptionPhraseResolver(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for CaptionPhraseResolver()
{
  return &type metadata for CaptionPhraseResolver;
}

uint64_t ThreadsafeDictionary.isEmpty.getter()
{
  unsigned __int8 v1;

  OS_dispatch_queue.sync<A>(execute:)();
  return v1;
}

uint64_t closure #1 in ThreadsafeDictionary.isEmpty.getter@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v3 = (_QWORD *)*a1;
  swift_beginAccess();
  v4 = v3[10];
  v5 = v3[11];
  v6 = v3[12];
  v7 = swift_bridgeObjectRetain();
  LOBYTE(v5) = MEMORY[0x24959E314](v7, v4, v5, v6);
  result = swift_bridgeObjectRelease();
  *a2 = v5 & 1;
  return result;
}

uint64_t partial apply for closure #1 in ThreadsafeDictionary.isEmpty.getter@<X0>(_BYTE *a1@<X8>)
{
  _QWORD *v1;

  return closure #1 in ThreadsafeDictionary.isEmpty.getter(v1, a1);
}

uint64_t ThreadsafeDictionary.count.getter()
{
  uint64_t v1;

  OS_dispatch_queue.sync<A>(execute:)();
  return v1;
}

uint64_t closure #1 in ThreadsafeDictionary.count.getter@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v3 = (_QWORD *)*a1;
  swift_beginAccess();
  v4 = v3[10];
  v5 = v3[11];
  v6 = v3[12];
  v7 = swift_bridgeObjectRetain();
  v8 = MEMORY[0x24959E308](v7, v4, v5, v6);
  result = swift_bridgeObjectRelease();
  if (v8 < 0)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    *a2 = v8;
  }
  return result;
}

uint64_t partial apply for closure #1 in ThreadsafeDictionary.count.getter@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;

  return closure #1 in ThreadsafeDictionary.count.getter(v1, a1);
}

uint64_t ThreadsafeDictionary.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  ThreadsafeDictionary.init()();
  return v0;
}

uint64_t *ThreadsafeDictionary.init()()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  Swift::String v20;
  _QWORD v22[2];
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;

  v26 = *v0;
  v1 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  v24 = *(_QWORD *)(v1 - 8);
  v25 = v1;
  MEMORY[0x24BDAC7A8](v1, v2, v3);
  v23 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for OS_dispatch_queue.Attributes();
  MEMORY[0x24BDAC7A8](v5, v6, v7);
  v8 = type metadata accessor for DispatchQoS();
  MEMORY[0x24BDAC7A8](v8, v9, v10);
  v11 = type metadata accessor for UUID();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11, v13, v14);
  v16 = (char *)v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22[1] = type metadata accessor for OS_dispatch_queue();
  v27 = 0;
  v28 = 0xE000000000000000;
  _StringGuts.grow(_:)(41);
  swift_bridgeObjectRelease();
  v27 = 0xD000000000000027;
  v28 = 0x80000002489197C0;
  UUID.init()();
  v17 = UUID.uuidString.getter();
  v19 = v18;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v16, v11);
  v20._countAndFlagsBits = v17;
  v20._object = v19;
  String.append(_:)(v20);
  swift_bridgeObjectRelease();
  static DispatchQoS.unspecified.getter();
  v27 = MEMORY[0x24BEE4AF8];
  lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, _QWORD, uint64_t))(v24 + 104))(v23, *MEMORY[0x24BEE5750], v25);
  v0[2] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  v0[3] = Dictionary.init()();
  return v0;
}

unint64_t type metadata accessor for OS_dispatch_queue()
{
  unint64_t result;

  result = lazy cache variable for type metadata for OS_dispatch_queue;
  if (!lazy cache variable for type metadata for OS_dispatch_queue)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for OS_dispatch_queue);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes;
  if (!lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes)
  {
    v1 = type metadata accessor for OS_dispatch_queue.Attributes();
    result = MEMORY[0x24959EFF8](MEMORY[0x24BEE5698], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A];
  if (!lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
    result = MEMORY[0x24959EFF8](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A]);
  }
  return result;
}

uint64_t ThreadsafeDictionary.subscript.getter()
{
  type metadata accessor for Optional();
  return OS_dispatch_queue.sync<A>(execute:)();
}

uint64_t closure #1 in ThreadsafeDictionary.subscript.getter(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = (_QWORD *)*a1;
  swift_beginAccess();
  v5 = a1[3];
  v6 = v4[10];
  v7 = v4[11];
  v8 = v4[12];
  swift_bridgeObjectRetain();
  MEMORY[0x24959E32C](a2, v5, v6, v7, v8);
  return swift_bridgeObjectRelease();
}

uint64_t partial apply for closure #1 in ThreadsafeDictionary.subscript.getter()
{
  uint64_t v0;

  return closure #1 in ThreadsafeDictionary.subscript.getter(*(_QWORD **)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t ThreadsafeDictionary.subscript.setter(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;

  v5 = *v2;
  specialized ThreadsafeDictionary.subscript.setter(a1, a2);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v5 + 80) - 8) + 8))(a2);
  v6 = type metadata accessor for Optional();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
}

uint64_t closure #1 in ThreadsafeDictionary.subscript.setter(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;

  v5 = *a1;
  v6 = type metadata accessor for Optional();
  v7 = *(_QWORD *)(v6 - 8);
  v10 = MEMORY[0x24BDAC7A8](v6, v8, v9);
  v12 = (char *)&v19 - v11;
  v13 = *(_QWORD *)(v5 + 80);
  MEMORY[0x24BDAC7A8](v10, v14, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))((char *)&v19 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v12, a3, v6);
  swift_beginAccess();
  type metadata accessor for Dictionary();
  Dictionary.subscript.setter();
  return swift_endAccess();
}

void (*ThreadsafeDictionary.subscript.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t *v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  size_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = malloc(0x40uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = *v1;
  v5 = type metadata accessor for Optional();
  v3[1] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v3[2] = v6;
  v7 = *(_QWORD *)(v6 + 64);
  v3[3] = malloc(v7);
  v3[4] = malloc(v7);
  v8 = *(_QWORD *)(v4 + 80);
  v3[5] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v3[6] = v9;
  v3[7] = malloc(*(_QWORD *)(v9 + 64));
  (*(void (**)(void))(v9 + 16))();
  ThreadsafeDictionary.subscript.getter();
  return ThreadsafeDictionary.subscript.modify;
}

void ThreadsafeDictionary.subscript.modify(uint64_t a1, char a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void *, uint64_t);

  v2 = *(void **)a1;
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 48);
  v3 = *(void **)(*(_QWORD *)a1 + 56);
  v5 = *(void **)(*(_QWORD *)a1 + 32);
  v6 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v8 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  v7 = *(void **)(*(_QWORD *)a1 + 24);
  v9 = *(_QWORD *)(*(_QWORD *)a1 + 8);
  if ((a2 & 1) != 0)
  {
    (*(void (**)(_QWORD, void *, uint64_t))(v8 + 16))(*(_QWORD *)(*(_QWORD *)a1 + 24), v5, v9);
    specialized ThreadsafeDictionary.subscript.setter((uint64_t)v7, (uint64_t)v3);
    (*(void (**)(void *, uint64_t))(v4 + 8))(v3, v6);
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
    v10(v7, v9);
  }
  else
  {
    specialized ThreadsafeDictionary.subscript.setter(*(_QWORD *)(*(_QWORD *)a1 + 32), (uint64_t)v3);
    (*(void (**)(void *, uint64_t))(v4 + 8))(v3, v6);
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
  }
  v10(v5, v9);
  free(v3);
  free(v5);
  free(v7);
  free(v2);
}

uint64_t ThreadsafeDictionary.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t ThreadsafeDictionary.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t specialized ThreadsafeDictionary.subscript.setter(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t result;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  dispatch_queue_t v32;
  _QWORD aBlock[6];

  v28 = a2;
  v3 = *v2;
  v4 = v2;
  v5 = *(_QWORD *)(*v2 + 88);
  v30 = a1;
  v31 = v5;
  v6 = type metadata accessor for Optional();
  v7 = *(_QWORD *)(v6 - 8);
  v29 = v6;
  v10 = MEMORY[0x24BDAC7A8](v6, v8, v9);
  v12 = (char *)&v27 - v11;
  v13 = *(_QWORD *)(v3 + 80);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  MEMORY[0x24BDAC7A8](v10, v16, v17);
  v18 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = (dispatch_queue_t)v4[2];
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v18, v28, v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v12, v30, v6);
  v19 = (*(unsigned __int8 *)(v14 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v20 = (v15 + *(unsigned __int8 *)(v7 + 80) + v19) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v21 = (char *)swift_allocObject();
  v22 = v31;
  *((_QWORD *)v21 + 2) = v13;
  *((_QWORD *)v21 + 3) = v22;
  v23 = v27;
  *((_QWORD *)v21 + 4) = *(_QWORD *)(v3 + 96);
  *((_QWORD *)v21 + 5) = v23;
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(&v21[v19], v18, v13);
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v21[v20], v12, v29);
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = partial apply for closure #1 in ThreadsafeDictionary.subscript.setter;
  *(_QWORD *)(v24 + 24) = v21;
  aBlock[4] = partial apply for thunk for @callee_guaranteed () -> ();
  aBlock[5] = v24;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed () -> ();
  aBlock[3] = &block_descriptor_1;
  v25 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v32, v25);
  _Block_release(v25);
  LOBYTE(v25) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v25 & 1) != 0)
    __break(1u);
  return result;
}

uint64_t type metadata completion function for ThreadsafeDictionary()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for ThreadsafeDictionary(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ThreadsafeDictionary);
}

uint64_t sub_248912760()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(v0 + 16);
  v1 = *(_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = *(_QWORD *)(v3 + 64);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for Optional() - 8) + 80);
  v7 = (v4 + v5 + v6) & ~v6;
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v0 + v4, v2);
  v8 = *(_QWORD *)(v1 - 8);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v8 + 48))(v0 + v7, 1, v1))
    (*(void (**)(unint64_t, uint64_t))(v8 + 8))(v0 + v7, v1);
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in ThreadsafeDictionary.subscript.setter()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 16) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for Optional() - 8) + 80);
  return closure #1 in ThreadsafeDictionary.subscript.setter(*(uint64_t **)(v0 + 40), v0 + v2, v0 + ((v2 + v3 + v4) & ~v4));
}

uint64_t sub_24891288C()
{
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @callee_guaranteed () -> ()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
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

uint64_t TUSCache.__allocating_init(capacity:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  TUSCache.init(capacity:)(a1);
  return v2;
}

uint64_t TUSCache.subscript.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  void (*v23)(char *, uint64_t);
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;

  v41 = a2;
  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 88);
  v6 = type metadata accessor for Optional();
  v7 = *(_QWORD *)(v6 - 8);
  v10 = MEMORY[0x24BDAC7A8](v6, v8, v9);
  v12 = (char *)&v40 - v11;
  v13 = *(_QWORD *)(v5 - 8);
  v16 = MEMORY[0x24BDAC7A8](v10, v14, v15);
  v18 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16, v19, v20);
  v22 = (char *)&v40 - v21;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v12, a1, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v12, 1, v5) == 1)
  {
    v23 = *(void (**)(char *, uint64_t))(v7 + 8);
    v23(v12, v6);
    v24 = (void *)v2[2];
    v25 = *(_QWORD *)(v4 + 80);
    v27 = objc_allocWithZone((Class)type metadata accessor for WrappedKey(0, v25, *(_QWORD *)(v4 + 96), v26));
    v28 = v41;
    v29 = specialized WrappedKey.init(key:)(v41);
    objc_msgSend(v24, sel_removeObjectForKey_, v29);

    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 8))(v28, v25);
    return ((uint64_t (*)(uint64_t, uint64_t))v23)(a1, v6);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v22, v12, v5);
    type metadata accessor for WrappedValue(0, v5, v31, v32);
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v18, v22, v5);
    v33 = swift_allocObject();
    (*(void (**)(uint64_t, char *))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v33 + 80) - 8) + 32))(v33 + *(_QWORD *)(*(_QWORD *)v33 + 88), v18);
    v34 = (void *)v2[2];
    v40 = a1;
    v35 = *(_QWORD *)(v4 + 80);
    v37 = objc_allocWithZone((Class)type metadata accessor for WrappedKey(0, v35, *(_QWORD *)(v4 + 96), v36));
    v38 = v41;
    v39 = specialized WrappedKey.init(key:)(v41);
    objc_msgSend(v34, sel_setObject_forKey_, v33, v39);
    swift_release();

    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 8))(v38, v35);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v40, v6);
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v22, v5);
  }
}

uint64_t TUSCache.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  _QWORD *v3;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = *v3;
  v7 = (void *)v3[2];
  v8 = objc_allocWithZone((Class)type metadata accessor for WrappedKey(0, *(_QWORD *)(*v3 + 80), *(_QWORD *)(*v3 + 96), a2));
  v9 = specialized WrappedKey.init(key:)(a1);
  v10 = (char *)objc_msgSend(v7, sel_objectForKey_, v9);

  if (v10)
  {
    v11 = *(_QWORD *)(v6 + 88);
    v12 = *(_QWORD *)(v11 - 8);
    (*(void (**)(uint64_t, char *, uint64_t))(v12 + 16))(a3, &v10[*(_QWORD *)(*(_QWORD *)v10 + 88)], v11);
    swift_release();
    v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56);
    v14 = a3;
    v15 = 0;
    v16 = v11;
  }
  else
  {
    v16 = *(_QWORD *)(v6 + 88);
    v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56);
    v14 = a3;
    v15 = 1;
  }
  return v13(v14, v15, 1, v16);
}

uint64_t @objc WrappedKey.hash.getter(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  v2 = WrappedKey.hash.getter();

  return v2;
}

uint64_t WrappedKey.hash.getter()
{
  return dispatch thunk of Hashable.hashValue.getter();
}

uint64_t WrappedKey.isEqual(_:)(uint64_t a1)
{
  char v2;
  void *v4;
  _BYTE v5[24];
  uint64_t v6;

  swift_getObjectType();
  outlined init with copy of Any?(a1, (uint64_t)v5);
  if (!v6)
  {
    outlined destroy of Any?((uint64_t)v5);
    goto LABEL_5;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_5:
    v2 = 0;
    return v2 & 1;
  }
  v2 = dispatch thunk of static Equatable.== infix(_:_:)();

  return v2 & 1;
}

uint64_t @objc WrappedKey.isEqual(_:)(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  id v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = a1;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = a1;
  }
  v6 = WrappedKey.isEqual(_:)((uint64_t)v8);

  outlined destroy of Any?((uint64_t)v8);
  return v6 & 1;
}

void @objc WrappedKey.init()()
{
  specialized WrappedKey.init()();
}

id WrappedKey.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t @objc WrappedKey.__ivar_destroyer(char *a1)
{
  return (*(uint64_t (**)(char *))(*(_QWORD *)(*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)a1) + 0x50)
                                                       - 8)
                                           + 8))(&a1[*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)a1) + 0x60)]);
}

uint64_t WrappedValue.__allocating_init(value:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v2 + 80) - 8) + 32))(v2 + *(_QWORD *)(*(_QWORD *)v2 + 88), a1);
  return v2;
}

uint64_t WrappedValue.__deallocating_deinit()
{
  uint64_t v0;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 80) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 88));
  return swift_deallocClassInstance();
}

uint64_t **TUSCache.init(capacity:)(uint64_t a1)
{
  uint64_t **v1;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v3 = *v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSCache);
  type metadata accessor for WrappedKey(0, v3[10], v3[12], v4);
  type metadata accessor for WrappedValue(0, v3[11], v5, v6);
  v7 = (uint64_t *)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  v1[2] = v7;
  objc_msgSend(v7, sel_setCountLimit_, a1);
  return v1;
}

uint64_t type metadata accessor for WrappedKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for WrappedKey);
}

void (*TUSCache.subscript.modify(_QWORD *a1, uint64_t a2))(uint64_t a1, char a2)
{
  uint64_t *v2;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  size_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  uint64_t v14;

  v5 = malloc(0x48uLL);
  *a1 = v5;
  *v5 = v2;
  v6 = *v2;
  v7 = type metadata accessor for Optional();
  v5[1] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v5[2] = v8;
  v9 = *(_QWORD *)(v8 + 64);
  v5[3] = malloc(v9);
  v10 = malloc(v9);
  v5[4] = v10;
  v11 = *(_QWORD *)(v6 + 80);
  v5[5] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v5[6] = v12;
  v13 = *(_QWORD *)(v12 + 64);
  v5[7] = malloc(v13);
  v5[8] = malloc(v13);
  (*(void (**)(void))(v12 + 16))();
  TUSCache.subscript.getter(a2, v14, (uint64_t)v10);
  return TUSCache.subscript.modify;
}

void TUSCache.subscript.modify(uint64_t a1, char a2)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(_QWORD **)a1;
  v3 = *(void **)(*(_QWORD *)a1 + 56);
  v4 = *(void **)(*(_QWORD *)a1 + 64);
  if ((a2 & 1) != 0)
  {
    v5 = v2[5];
    v6 = v2[6];
    v8 = (void *)v2[3];
    v7 = (void *)v2[4];
    v9 = v2[1];
    v10 = v2[2];
    (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v8, v7, v9);
    (*(void (**)(void *, void *, uint64_t))(v6 + 32))(v3, v4, v5);
    TUSCache.subscript.setter((uint64_t)v8, (uint64_t)v3);
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
  }
  else
  {
    v8 = (void *)v2[3];
    v7 = (void *)v2[4];
    TUSCache.subscript.setter((uint64_t)v7, (uint64_t)v4);
  }
  free(v4);
  free(v3);
  free(v7);
  free(v8);
  free(v2);
}

uint64_t TUSCache.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t TUSCache.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

id specialized WrappedKey.init(key:)(uint64_t a1)
{
  char *v1;
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)v1) + 0x50)
                                                      - 8)
                                          + 16))(&v1[*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)v1) + 0x60)], a1);
  v5.receiver = v1;
  v5.super_class = ObjectType;
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for WrappedValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for WrappedValue);
}

uint64_t type metadata completion function for WrappedKey()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata completion function for WrappedValue()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata completion function for TUSCache()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for TUSCache(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TUSCache);
}

void specialized WrappedKey.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t outlined init with copy of Any?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t TextUnderstandingSupportInput.text.getter()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TextUnderstandingSupportInput.text.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*TextUnderstandingSupportInput.text.modify())()
{
  swift_beginAccess();
  return TextUnderstandingSupportInput.text.modify;
}

Swift::Int TextUnderstandingSupportInput.featureNames.getter()
{
  Swift::Int v0;

  v0 = specialized Set.init(_nonEmptyArrayLiteral:)((uint64_t)&outlined read-only object #0 of TextUnderstandingSupportInput.featureNames.getter);
  swift_arrayDestroy();
  return v0;
}

MLFeatureValue_optional __swiftcall TextUnderstandingSupportInput.featureValue(for:)(Swift::String a1)
{
  uint64_t v1;
  BOOL v2;
  Swift::Bool v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  objc_class *v7;
  MLFeatureValue_optional result;

  v2 = a1._countAndFlagsBits == 1954047348 && a1._object == (void *)0xE400000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    v4 = (*(uint64_t (**)(void))(*(_QWORD *)v1 + 88))();
    v5 = (void *)MEMORY[0x24959E374](v4);
    swift_bridgeObjectRelease();
    v6 = (objc_class *)objc_msgSend((id)objc_opt_self(), sel_featureValueWithString_, v5);

  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  result.value.super.isa = v7;
  result.is_nil = v3;
  return result;
}

uint64_t TextUnderstandingSupportInput.__allocating_init(text:)(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t TextUnderstandingSupportInput.init(text:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return v2;
}

uint64_t TextUnderstandingSupportInput.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t TextUnderstandingSupportInput.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

void TextUnderstandingSupportOutput.label.getter()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  id v4;

  v1 = *(void **)(v0 + 16);
  v2 = (void *)MEMORY[0x24959E374](0x6C6562616CLL, 0xE500000000000000);
  v3 = objc_msgSend(v1, sel_featureValueForName_, v2);

  if (v3)
  {
    v4 = objc_msgSend(v3, sel_stringValue);

    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    __break(1u);
  }
}

uint64_t TextUnderstandingSupportOutput.featureNames.getter()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(*(id *)(v0 + 16), sel_featureNames);
  v2 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  return v2;
}

MLFeatureValue_optional __swiftcall TextUnderstandingSupportOutput.featureValue(for:)(Swift::String a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  objc_class *v4;
  Swift::Bool v5;
  objc_class *v6;
  MLFeatureValue_optional result;

  v2 = *(void **)(v1 + 16);
  v3 = (void *)MEMORY[0x24959E374](a1._countAndFlagsBits, a1._object);
  v4 = (objc_class *)objc_msgSend(v2, sel_featureValueForName_, v3);

  v6 = v4;
  result.value.super.isa = v6;
  result.is_nil = v5;
  return result;
}

uint64_t TextUnderstandingSupportOutput.__allocating_init(label:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  TextUnderstandingSupportOutput.init(label:)(a1, a2);
  return v4;
}

uint64_t TextUnderstandingSupportOutput.init(label:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t inited;
  void *v7;
  id v8;
  id v9;

  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_248917470;
  *(_QWORD *)(inited + 32) = 0x6C6562616CLL;
  *(_QWORD *)(inited + 40) = 0xE500000000000000;
  v7 = (void *)MEMORY[0x24959E374](a1, a2);
  swift_bridgeObjectRelease();
  v8 = objc_msgSend((id)objc_opt_self(), sel_featureValueWithString_, v7);

  *(_QWORD *)(inited + 72) = type metadata accessor for OS_dispatch_source(0, &lazy cache variable for type metadata for MLFeatureValue);
  *(_QWORD *)(inited + 48) = v8;
  specialized Dictionary.init(dictionaryLiteral:)(inited);
  v9 = objc_allocWithZone(MEMORY[0x24BDBFF80]);
  *(_QWORD *)(v3 + 16) = @nonobjc MLDictionaryFeatureProvider.init(dictionary:)();
  return v3;
}

uint64_t TextUnderstandingSupportOutput.__allocating_init(features:)(uint64_t a1)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  return result;
}

uint64_t TextUnderstandingSupportOutput.init(features:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return v1;
}

uint64_t TextUnderstandingSupportOutput.deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  return v0;
}

uint64_t TextUnderstandingSupportOutput.__deallocating_deinit()
{
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

id TextUnderstandingSupport.model.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

uint64_t static TextUnderstandingSupport.urlOfModelInThisBundle.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t ObjCClassFromMetadata;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void (*v18)(char *, char *, uint64_t);
  uint64_t result;
  uint64_t v20;

  v2 = type metadata accessor for URL();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4, v5);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8](v8, v9, v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v14 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v15 = (void *)MEMORY[0x24959E374](0xD000000000000018, 0x8000000248917C90);
  v16 = (void *)MEMORY[0x24959E374](0x636C65646F6D6C6DLL, 0xE800000000000000);
  v17 = objc_msgSend(v14, sel_URLForResource_withExtension_, v15, v16);

  if (v17)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    v18 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
    v18(v12, v7, v2);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v3 + 56))(v12, 0, 1, v2);
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 48))(v12, 1, v2);
    if ((_DWORD)result != 1)
    {

      return ((uint64_t (*)(uint64_t, char *, uint64_t))v18)(a1, v12, v2);
    }
  }
  else
  {
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v12, 1, 1, v2);
  }
  __break(1u);
  return result;
}

uint64_t TextUnderstandingSupport.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  id v13;
  uint64_t v14;
  _BYTE v16[16];

  v1 = type metadata accessor for URL();
  v2 = *(_QWORD *)(v1 - 8);
  v5 = MEMORY[0x24BDAC7A8](v1, v3, v4);
  v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = MEMORY[0x24BDAC7A8](v5, v8, v9);
  v12 = &v16[-v11];
  (*(void (**)(uint64_t))(v0 + 88))(v10);
  type metadata accessor for OS_dispatch_source(0, &lazy cache variable for type metadata for MLModel);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v2 + 16))(v7, v12, v1);
  v13 = @nonobjc MLModel.__allocating_init(contentsOf:)((uint64_t)v7);
  v14 = (*(uint64_t (**)(id))(v0 + 96))(v13);
  (*(void (**)(_BYTE *, uint64_t))(v2 + 8))(v12, v1);
  return v14;
}

uint64_t TextUnderstandingSupport.__allocating_init(contentsOf:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v16;

  v3 = v1;
  v5 = type metadata accessor for URL();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7, v8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for OS_dispatch_source(0, &lazy cache variable for type metadata for MLModel);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v10, a1, v5);
  v12 = (uint64_t)v10;
  v13 = v11;
  v14 = @nonobjc MLModel.__allocating_init(contentsOf:)(v12);
  if (!v2)
    v13 = (*(uint64_t (**)(id))(v3 + 96))(v14);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
  return v13;
}

uint64_t TextUnderstandingSupport.__allocating_init(configuration:)(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  uint64_t v22;

  v3 = v1;
  v5 = type metadata accessor for URL();
  v6 = *(_QWORD *)(v5 - 8);
  v9 = MEMORY[0x24BDAC7A8](v5, v7, v8);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v9, v12, v13);
  v16 = (char *)&v22 - v15;
  (*(void (**)(uint64_t))(v1 + 88))(v14);
  v17 = type metadata accessor for OS_dispatch_source(0, &lazy cache variable for type metadata for MLModel);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v11, v16, v5);
  v18 = a1;
  v19 = specialized @nonobjc MLModel.__allocating_init(contentsOf:configuration:)((uint64_t)v11, (uint64_t)v18);
  if (v2)
  {

  }
  else
  {
    v20 = v19;

    v17 = (*(uint64_t (**)(id))(v3 + 96))(v20);
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v16, v5);
  return v17;
}

uint64_t TextUnderstandingSupport.__allocating_init(contentsOf:configuration:)(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v18;

  v4 = v2;
  v7 = type metadata accessor for URL();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v9, v10);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for OS_dispatch_source(0, &lazy cache variable for type metadata for MLModel);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v12, a1, v7);
  v14 = (uint64_t)v12;
  v15 = v13;
  v16 = specialized @nonobjc MLModel.__allocating_init(contentsOf:configuration:)(v14, (uint64_t)a2);
  if (!v3)
    v15 = (*(uint64_t (**)(id))(v4 + 96))(v16);

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a1, v7);
  return v15;
}

id @nonobjc MLModel.__allocating_init(contentsOf:)(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  id v8;
  id v9;
  uint64_t v10;
  id v12;
  NSURL *v13;

  v13 = (NSURL *)*MEMORY[0x24BDAC8D0];
  URL._bridgeToObjectiveC()(v13);
  v3 = v2;
  v12 = 0;
  v4 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_modelWithContentsOfURL_error_, v2, &v12);

  v5 = v12;
  if (v4)
  {
    v6 = type metadata accessor for URL();
    v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
    v8 = v5;
    v7(a1, v6);
  }
  else
  {
    v9 = v12;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    v10 = type metadata accessor for URL();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(a1, v10);
  }
  return v4;
}

uint64_t static TextUnderstandingSupport.load(configuration:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v15;

  v7 = type metadata accessor for URL();
  v8 = *(_QWORD *)(v7 - 8);
  v11 = MEMORY[0x24BDAC7A8](v7, v9, v10);
  v13 = (char *)&v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t))(v3 + 88))(v11);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 120))(v13, a1, a2, a3);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v13, v7);
}

uint64_t static TextUnderstandingSupport.load(configuration:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = v1;
  v3 = type metadata accessor for URL();
  v2[4] = v3;
  v2[5] = *(_QWORD *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return swift_task_switch();
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(v4 + 64) = v1;
  swift_task_dealloc();
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v4 + 40) + 8))(*(_QWORD *)(v4 + 48), *(_QWORD *)(v4 + 32));
  if (v1)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t static TextUnderstandingSupport.load(configuration:)()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(_QWORD, _QWORD);

  v1 = v0[3];
  (*(void (**)(void))(v1 + 88))();
  v4 = (uint64_t (*)(_QWORD, _QWORD))(**(int **)(v1 + 128) + *(_QWORD *)(v1 + 128));
  v2 = (_QWORD *)swift_task_alloc();
  v0[7] = v2;
  *v2 = v0;
  v2[1] = static TextUnderstandingSupport.load(configuration:);
  return v4(v0[6], v0[2]);
}

{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t static TextUnderstandingSupport.load(contentsOf:configuration:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;

  type metadata accessor for OS_dispatch_source(0, &lazy cache variable for type metadata for MLModel);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a3;
  *(_QWORD *)(v6 + 24) = a4;
  swift_retain();
  static MLModel.load(contentsOf:configuration:completionHandler:)();
  return swift_release();
}

void closure #1 in static TextUnderstandingSupport.load(contentsOf:configuration:completionHandler:)(id a1, char a2, void (*a3)(id, uint64_t))
{
  uint64_t v5;
  id v6;
  id v7;

  if ((a2 & 1) != 0)
  {
    v7 = a1;
    a3(a1, 1);
    outlined consume of Result<MLModel, Error>(a1);
  }
  else
  {
    type metadata accessor for TextUnderstandingSupport();
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = a1;
    v6 = a1;
    a3((id)v5, 0);
    swift_release();
  }
}

uint64_t static TextUnderstandingSupport.load(contentsOf:configuration:)()
{
  uint64_t v0;
  _QWORD *v1;

  type metadata accessor for OS_dispatch_source(0, &lazy cache variable for type metadata for MLModel);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = static TextUnderstandingSupport.load(contentsOf:configuration:);
  return static MLModel.load(contentsOf:configuration:)();
}

{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  type metadata accessor for TextUnderstandingSupport();
  *(_QWORD *)(swift_allocObject() + 16) = v1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t static TextUnderstandingSupport.load(contentsOf:configuration:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = *v2;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v5 + 8))();
  *(_QWORD *)(v4 + 24) = a1;
  return swift_task_switch();
}

uint64_t TextUnderstandingSupport.prediction(input:)(uint64_t a1)
{
  uint64_t v1;
  id v3;
  uint64_t v4;

  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC0018]), sel_init);
  v4 = (*(uint64_t (**)(uint64_t, id))(*(_QWORD *)v1 + 144))(a1, v3);

  return v4;
}

uint64_t TextUnderstandingSupport.prediction(input:options:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v12[2];

  v12[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = *(void **)(v2 + 16);
  v12[0] = 0;
  v6 = objc_msgSend(v5, sel_predictionFromFeatures_options_error_, a1, a2, v12);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    type metadata accessor for TextUnderstandingSupportOutput();
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v8;
    v9 = v7;
  }
  else
  {
    v10 = v12[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v3;
}

{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t TextUnderstandingSupport.prediction(input:options:)()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  *v1 = v0;
  v1[1] = TextUnderstandingSupport.prediction(input:options:);
  return MLModel.prediction(from:options:)();
}

{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  type metadata accessor for TextUnderstandingSupportOutput();
  *(_QWORD *)(swift_allocObject() + 16) = v1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t TextUnderstandingSupport.prediction(input:options:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = *v2;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v5 + 8))();
  *(_QWORD *)(v4 + 48) = a1;
  return swift_task_switch();
}

uint64_t TextUnderstandingSupport.prediction(text:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;

  type metadata accessor for TextUnderstandingSupportInput();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  v6 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 136);
  swift_bridgeObjectRetain();
  v7 = v6(v5);
  swift_release();
  return v7;
}

void TextUnderstandingSupport.predictions(inputs:options:)(unint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v5;
  id v6;
  Class isa;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22[2];

  v22[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MLFeatureProvider);
    _bridgeCocoaArray<A>(_:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
  }
  v6 = objc_allocWithZone(MEMORY[0x24BDBFF60]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MLFeatureProvider);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v6, sel_initWithFeatureProviderArray_, isa);

  v9 = *(void **)(v2 + 16);
  v22[0] = 0;
  v10 = objc_msgSend(v9, sel_predictionsFromBatch_options_error_, v8, a2, v22);
  v11 = v22[0];
  if (v10)
  {
    v12 = v10;
    v22[0] = (id)MEMORY[0x24BEE4AF8];
    if (v5)
    {
      swift_bridgeObjectRetain();
      v16 = v11;
      v13 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      v13 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
      v14 = v11;
    }
    specialized Array._reserveCapacityImpl(minimumCapacity:growForAppend:)(v13, 0);
    specialized Array._endMutation()();
    v17 = (unint64_t)objc_msgSend(v12, sel_count);
    if ((v17 & 0x8000000000000000) != 0)
      __break(1u);
    v18 = v17;
    if (v17)
    {
      v19 = 0;
      do
      {
        v20 = objc_msgSend(v12, sel_featuresAtIndex_, v19);
        type metadata accessor for TextUnderstandingSupportOutput();
        *(_QWORD *)(swift_allocObject() + 16) = v20;
        swift_unknownObjectRetain();
        v21 = swift_retain();
        MEMORY[0x24959E494](v21);
        if (*(_QWORD *)(((unint64_t)v22[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)(((unint64_t)v22[0] & 0xFFFFFFFFFFFFFF8)
                                                                                               + 0x18) >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        ++v19;
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
        swift_release();
        swift_unknownObjectRelease();
      }
      while (v18 != v19);
    }
    swift_unknownObjectRelease();

  }
  else
  {
    v15 = v22[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
}

uint64_t TextUnderstandingSupport.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t TextUnderstandingSupport.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

id @nonobjc MLDictionaryFeatureProvider.init(dictionary:)()
{
  void *v0;
  Class isa;
  id v2;
  id v3;
  id v4;
  id v6[2];

  v6[1] = *(id *)MEMORY[0x24BDAC8D0];
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v6[0] = 0;
  v2 = objc_msgSend(v0, sel_initWithDictionary_error_, isa, v6);

  if (v2)
  {
    v3 = v6[0];
  }
  else
  {
    v4 = v6[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v2;
}

uint64_t specialized Array._reserveCapacityImpl(minimumCapacity:growForAppend:)(uint64_t a1, char a2)
{
  uint64_t *v2;
  unint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *v2;
  result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v2 = v5;
  v7 = 0;
  if ((result & 1) != 0 && (v5 & 0x8000000000000000) == 0 && (v5 & 0x4000000000000000) == 0)
  {
    if (a1 <= *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x18) >> 1)
      return result;
    v7 = 1;
  }
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    v8 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v8 <= a1)
    v9 = a1;
  else
    v9 = v8;
  result = MEMORY[0x24959E770](v7, v9, a2 & 1, v5);
  *v2 = result;
  return result;
}

Swift::Int specialized Set.init(_nonEmptyArrayLiteral:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  Swift::Int result;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<String>);
    v3 = static _SetStorage.allocate(capacity:)();
    v4 = 0;
    v5 = v3 + 56;
    v25 = a1 + 32;
    while (1)
    {
      v6 = (uint64_t *)(v25 + 16 * v4);
      v8 = *v6;
      v7 = v6[1];
      Hasher.init(_seed:)();
      swift_bridgeObjectRetain();
      String.hash(into:)();
      result = Hasher._finalize()();
      v10 = -1 << *(_BYTE *)(v3 + 32);
      v11 = result & ~v10;
      v12 = v11 >> 6;
      v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
      v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        v15 = *(_QWORD *)(v3 + 48);
        v16 = (_QWORD *)(v15 + 16 * v11);
        v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        v18 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v18;
          v12 = v11 >> 6;
          v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
          v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0)
            break;
          v19 = (_QWORD *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            result = _stringCompareWithSmolCheck(_:_:expecting:)();
            if ((result & 1) == 0)
              continue;
          }
          goto LABEL_3;
        }
      }
      *(_QWORD *)(v5 + 8 * v12) = v14 | v13;
      v21 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v11);
      *v21 = v8;
      v21[1] = v7;
      v22 = *(_QWORD *)(v3 + 16);
      v23 = __OFADD__(v22, 1);
      v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1)
        return v3;
    }
  }
  return MEMORY[0x24BEE4B08];
}

id specialized @nonobjc MLModel.__allocating_init(contentsOf:configuration:)(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  id v10;
  id v11;
  uint64_t v12;
  id v14;
  NSURL *v15;

  v15 = (NSURL *)*MEMORY[0x24BDAC8D0];
  URL._bridgeToObjectiveC()(v15);
  v5 = v4;
  v14 = 0;
  v6 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_modelWithContentsOfURL_configuration_error_, v4, a2, &v14);

  v7 = v14;
  if (v6)
  {
    v8 = type metadata accessor for URL();
    v9 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8);
    v10 = v7;
    v9(a1, v8);
  }
  else
  {
    v11 = v14;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    v12 = type metadata accessor for URL();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(a1, v12);
  }
  return v6;
}

uint64_t sub_24891527C()
{
  swift_release();
  return swift_deallocObject();
}

void partial apply for closure #1 in static TextUnderstandingSupport.load(contentsOf:configuration:completionHandler:)(void *a1, char a2)
{
  uint64_t v2;

  closure #1 in static TextUnderstandingSupport.load(contentsOf:configuration:completionHandler:)(a1, a2 & 1, *(void (**)(id, uint64_t))(v2 + 16));
}

uint64_t type metadata accessor for TextUnderstandingSupport()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for TextUnderstandingSupportOutput()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for TextUnderstandingSupportInput()
{
  return objc_opt_self();
}

uint64_t sub_24891530C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 88))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_24891533C(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v2 = *a1;
  v3 = a1[1];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(_QWORD **)a2 + 96);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

void outlined consume of Result<MLModel, Error>(id a1)
{

}

uint64_t static CharacterSet.decimalDigits.getter()
{
  return MEMORY[0x24BDCB648]();
}

uint64_t static CharacterSet.lowercaseLetters.getter()
{
  return MEMORY[0x24BDCB670]();
}

uint64_t static CharacterSet.whitespacesAndNewlines.getter()
{
  return MEMORY[0x24BDCB6C0]();
}

uint64_t CharacterSet.contains(_:)()
{
  return MEMORY[0x24BDCB710]();
}

uint64_t CharacterSet.inverted.getter()
{
  return MEMORY[0x24BDCB720]();
}

uint64_t type metadata accessor for CharacterSet()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t __DataStorage._bytes.getter()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t __DataStorage._length.getter()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t __DataStorage._offset.getter()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return MEMORY[0x24BDCD7B8]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
  MEMORY[0x24BDCD8D0](retstr);
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t URL.init(filePath:directoryHint:relativeTo:)()
{
  return MEMORY[0x24BDCDA70]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t static Date.distantPast.getter()
{
  return MEMORY[0x24BDCE2D8]();
}

uint64_t Date.timeIntervalSince(_:)()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t Date.init()()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t UUID.uuidString.getter()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t Locale.init(identifier:)()
{
  return MEMORY[0x24BDCEB18]();
}

uint64_t Locale.identifier.getter()
{
  return MEMORY[0x24BDCEB20]();
}

uint64_t static Locale.preferredLanguages.getter()
{
  return MEMORY[0x24BDCEC88]();
}

uint64_t static Locale.canonicalLanguageIdentifier(from:)()
{
  return MEMORY[0x24BDCECD0]();
}

uint64_t static Locale.current.getter()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t type metadata accessor for Locale()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t OSSignpostID.init(log:)()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t OSSignpostID.rawValue.getter()
{
  return MEMORY[0x24BEE7738]();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t OSSignposter.init(logger:)()
{
  return MEMORY[0x24BEE7790]();
}

uint64_t OSSignposter.logHandle.getter()
{
  return MEMORY[0x24BEE77C0]();
}

uint64_t type metadata accessor for OSSignposter()
{
  return MEMORY[0x24BEE77F0]();
}

uint64_t type metadata accessor for OSSignpostError()
{
  return MEMORY[0x24BEE7818]();
}

uint64_t OSSignpostIntervalState.signpostID.getter()
{
  return MEMORY[0x24BEE7848]();
}

uint64_t OSSignpostIntervalState.init(id:isOpen:)()
{
  return MEMORY[0x24BEE7868]();
}

uint64_t type metadata accessor for OSSignpostIntervalState()
{
  return MEMORY[0x24BEE7870]();
}

uint64_t checkForErrorAndConsumeState(state:)()
{
  return MEMORY[0x24BEE78A0]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t Logger.init()()
{
  return MEMORY[0x24BEE78C8]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t static DispatchQoS.utility.getter()
{
  return MEMORY[0x24BEE54E8]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t Dictionary.init()()
{
  return MEMORY[0x24BEE01A8]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x24BDCF808]();
}

uint64_t static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x24BDCF828]();
}

uint64_t Dictionary.count.getter()
{
  return MEMORY[0x24BEE0370]();
}

uint64_t Dictionary.isEmpty.getter()
{
  return MEMORY[0x24BEE03E8]();
}

uint64_t type metadata accessor for Dictionary()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t Dictionary.subscript.getter()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t Dictionary.subscript.setter()
{
  return MEMORY[0x24BEE04B0]();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t dispatch thunk of Hashable.hashValue.getter()
{
  return MEMORY[0x24BEE0620]();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x24BEE0980]();
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

uint64_t String.init(cString:encoding:)()
{
  return MEMORY[0x24BDCFA80]();
}

uint64_t static String.Encoding.utf8.getter()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t type metadata accessor for String.Encoding()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x24BEE09F0]();
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0;
  void *v1;
  Swift::String result;

  v0 = MEMORY[0x24BEE0A08]();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t String.init<A>(reflecting:)()
{
  return MEMORY[0x24BEE0A10]();
}

uint64_t static String._fromSubstring(_:)()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t String.Index.utf16Offset<A>(in:)()
{
  return MEMORY[0x24BEE0B38]();
}

uint64_t String.count.getter()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t String.index(after:)()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t String.index(_:offsetBy:limitedBy:)()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t String.index(_:offsetBy:)()
{
  return MEMORY[0x24BEE0B88]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x24BEE0BC0](a1._countAndFlagsBits, a1._object);
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t String.distance(from:to:)()
{
  return MEMORY[0x24BEE0C60]();
}

uint64_t String.UTF16View.count.getter()
{
  return MEMORY[0x24BEE0C90]();
}

Swift::Bool __swiftcall String.hasPrefix(_:)(Swift::String a1)
{
  return MEMORY[0x24BEE0CC8](a1._countAndFlagsBits, a1._object);
}

uint64_t String.init<A>(_:)()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t String.subscript.getter()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x24BEE1110]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x24BDCFBA8]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t static Array._allocateUninitialized(_:)()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t Double.write<A>(to:)()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t dispatch thunk of Decodable.init(from:)()
{
  return MEMORY[0x24BEE1478]();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)MEMORY[0x24BDCFCC0]();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t Set.init(minimumCapacity:)()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t OS_dispatch_queue.sync<A>(execute:)()
{
  return MEMORY[0x24BEE5780]();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t static OS_dispatch_source.MemoryPressureEvent.warning.getter()
{
  return MEMORY[0x24BEE5850]();
}

uint64_t static OS_dispatch_source.MemoryPressureEvent.critical.getter()
{
  return MEMORY[0x24BEE5858]();
}

uint64_t OS_dispatch_source.MemoryPressureEvent.init(rawValue:)()
{
  return MEMORY[0x24BEE5860]();
}

uint64_t type metadata accessor for OS_dispatch_source.MemoryPressureEvent()
{
  return MEMORY[0x24BEE5868]();
}

uint64_t static OS_dispatch_source.makeMemoryPressureSource(eventMask:queue:)()
{
  return MEMORY[0x24BEE58A0]();
}

uint64_t OS_dispatch_source.setEventHandler(qos:flags:handler:)()
{
  return MEMORY[0x24BEE58B8]();
}

Swift::Void __swiftcall OS_dispatch_source.cancel()()
{
  MEMORY[0x24BEE58D0]();
}

Swift::Void __swiftcall OS_dispatch_source.activate()()
{
  MEMORY[0x24BEE58E8]();
}

uint64_t static os_signpost_type_t.end.getter()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t NLLanguageRecognizer.languageHypotheses(withMaximum:)()
{
  return MEMORY[0x24BEE5B38]();
}

uint64_t type metadata accessor for OS_dispatch_queue_serial.Attributes()
{
  return MEMORY[0x24BEE5930]();
}

uint64_t OS_dispatch_queue_serial.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return MEMORY[0x24BEE5948]();
}

uint64_t MLModel.prediction(from:options:)()
{
  return MEMORY[0x24BDBFEA0]();
}

uint64_t static MLModel.load(contentsOf:configuration:completionHandler:)()
{
  return MEMORY[0x24BDBFED0]();
}

uint64_t static MLModel.load(contentsOf:configuration:)()
{
  return MEMORY[0x24BDBFEE0]();
}

uint64_t NLTagger.enumerateTags(in:unit:scheme:options:using:)()
{
  return MEMORY[0x24BEE5B58]();
}

uint64_t OS_os_log.signpostsEnabled.getter()
{
  return MEMORY[0x24BEE7968]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t StringProtocol.components(separatedBy:)()
{
  return MEMORY[0x24BDD04B8]();
}

uint64_t StringProtocol.components<A>(separatedBy:)()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t StringProtocol.localizedLowercase.getter()
{
  return MEMORY[0x24BDD0530]();
}

uint64_t StringProtocol.trimmingCharacters(in:)()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t StringProtocol.enumerateSubstrings<A>(in:options:_:)()
{
  return MEMORY[0x24BDD0550]();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t StringProtocol.range<A>(of:options:range:locale:)()
{
  return MEMORY[0x24BDD0600]();
}

uint64_t StringProtocol.folding(options:locale:)()
{
  return MEMORY[0x24BDD0628]();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t static _SetStorage.copy(original:)()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t _StringGuts.foreignErrorCorrectedScalar(startingAt:)()
{
  return MEMORY[0x24BEE2508]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE2510](a1);
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t _decodeScalar(_:startingAt:)()
{
  return MEMORY[0x24BEE2840]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t type metadata accessor for CodingUserInfoKey()
{
  return MEMORY[0x24BEE2CC8]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F40]();
}

{
  return MEMORY[0x24BEE2F48]();
}

uint64_t _bridgeCocoaArray<A>(_:)()
{
  return MEMORY[0x24BEE2F58]();
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

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t _SwiftNewtypeWrapper<>._toCustomAnyHashable()()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t KeyedDecodingContainer.init<A>(_:)()
{
  return MEMORY[0x24BEE33F0]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t UnkeyedDecodingContainer.decodeIfPresent(_:)()
{
  return MEMORY[0x24BEE3678]();
}

{
  return MEMORY[0x24BEE3680]();
}

{
  return MEMORY[0x24BEE3688]();
}

{
  return MEMORY[0x24BEE3698]();
}

{
  return MEMORY[0x24BEE36A0]();
}

{
  return MEMORY[0x24BEE36C8]();
}

{
  return MEMORY[0x24BEE36F0]();
}

uint64_t UnkeyedDecodingContainer.decodeIfPresent<A>(_:)()
{
  return MEMORY[0x24BEE36A8]();
}

uint64_t UnkeyedDecodingContainer.decode(_:)()
{
  return MEMORY[0x24BEE3700]();
}

{
  return MEMORY[0x24BEE3708]();
}

uint64_t DefaultStringInterpolation.appendInterpolation<A>(_:)()
{
  return MEMORY[0x24BEE3938]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t SingleValueDecodingContainer.decode(_:)()
{
  return MEMORY[0x24BEE3AD0]();
}

{
  return MEMORY[0x24BEE3AD8]();
}

uint64_t dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter()
{
  return MEMORY[0x24BEE3B90]();
}

uint64_t KeyedDecodingContainerProtocol.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x24BEE3BE8]();
}

{
  return MEMORY[0x24BEE3BF0]();
}

{
  return MEMORY[0x24BEE3BF8]();
}

{
  return MEMORY[0x24BEE3C08]();
}

{
  return MEMORY[0x24BEE3C10]();
}

{
  return MEMORY[0x24BEE3C38]();
}

{
  return MEMORY[0x24BEE3C60]();
}

uint64_t KeyedDecodingContainerProtocol.decodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x24BEE3C18]();
}

uint64_t KeyedDecodingContainerProtocol.decode(_:forKey:)()
{
  return MEMORY[0x24BEE3C70]();
}

{
  return MEMORY[0x24BEE3C78]();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t Error._getEmbeddedNSError()()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t Error._code.getter()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t Error._domain.getter()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t Error._userInfo.getter()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t print(_:separator:terminator:)()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x24BEE42E0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x24BEE42F8](a1);
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t dispatch thunk of CodingKey.stringValue.getter()
{
  return MEMORY[0x24BEE49E8]();
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x24BDBBAC0](bundle);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x24BDBBC20](theSetIdentifier);
}

Boolean CFCharacterSetIsLongCharacterMember(CFCharacterSetRef theSet, UTF32Char theChar)
{
  return MEMORY[0x24BDBBC38](theSet, *(_QWORD *)&theChar);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x24BDBBE70](err);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x24BDBC520](alloc, theString);
}

CFStringRef CFStringCreateWithCharactersNoCopy(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x24BDBC588](alloc, chars, numChars, contentsDeallocator);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

void CFStringReplaceAll(CFMutableStringRef theString, CFStringRef replacement)
{
  MEMORY[0x24BDBC6E8](theString, replacement);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC858](allocator, filePath, pathStyle, isDirectory);
}

uint64_t LXEntryCopyString()
{
  return MEMORY[0x24BE5F080]();
}

uint64_t LXEntryGetMetaFlags()
{
  return MEMORY[0x24BE5F088]();
}

uint64_t LXEntryGetTokenID()
{
  return MEMORY[0x24BE5F098]();
}

uint64_t LXLexiconCopyEntryForTokenID()
{
  return MEMORY[0x24BE5F0D0]();
}

uint64_t LXLexiconCreate()
{
  return MEMORY[0x24BE5F0D8]();
}

uint64_t LXLexiconEnumerateEntriesForString()
{
  return MEMORY[0x24BE5F0F0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x24BDBCF60]();
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x24BDBCF80]();
}

uint64_t _PASIterateLongChars()
{
  return MEMORY[0x24BE7A680]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
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

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x24BDAED80](memptr, alignment, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x24BDAF6E0](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x24BDAF708](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x24BEE4C28]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x24BEE4D98]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x24BEE4FB8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x24BEE4FC0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x24BEE4FE0]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x24BEE4FE8]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

