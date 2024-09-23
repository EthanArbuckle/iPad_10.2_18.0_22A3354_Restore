void *LoggingConstants.subsystem.unsafeMutableAddressor()
{
  return &static LoggingConstants.subsystem;
}

unint64_t static LoggingConstants.subsystem.getter()
{
  return 0xD000000000000011;
}

void one-time initialization function for category()
{
  static LoggingConstants.category = 0x746C7561666564;
  unk_2555803F0 = 0xE700000000000000;
}

uint64_t *LoggingConstants.category.unsafeMutableAddressor()
{
  if (one-time initialization token for category != -1)
    swift_once();
  return &static LoggingConstants.category;
}

uint64_t static LoggingConstants.category.getter()
{
  uint64_t v0;

  if (one-time initialization token for category != -1)
    swift_once();
  v0 = static LoggingConstants.category;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t one-time initialization function for defaultLogger()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, defaultLogger);
  __swift_project_value_buffer(v0, (uint64_t)defaultLogger);
  if (one-time initialization token for category != -1)
    swift_once();
  swift_bridgeObjectRetain();
  return Logger.init(subsystem:category:)();
}

uint64_t defaultLogger.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (one-time initialization token for defaultLogger != -1)
    swift_once();
  v2 = type metadata accessor for Logger();
  v3 = __swift_project_value_buffer(v2, (uint64_t)defaultLogger);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t one-time initialization function for signpostLogger()
{
  uint64_t result;

  type metadata accessor for OS_os_log();
  if (one-time initialization token for category != -1)
    swift_once();
  swift_bridgeObjectRetain();
  result = OS_os_log.init(subsystem:category:)();
  signpostLogger = result;
  return result;
}

id signpostLogger.getter()
{
  if (one-time initialization token for signpostLogger != -1)
    swift_once();
  return (id)signpostLogger;
}

uint64_t OS_os_log.os_signpostSimpleInterval<A>(object:name:begin:end:closure:)@<X0>(uint64_t a1@<X0>, int a2@<W3>, uint64_t a3@<X4>, uint64_t (*a4)(uint64_t)@<X7>, uint64_t a5@<X8>, uint64_t a6, void (*a7)(uint64_t))
{
  void *v7;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  void (*v25)(uint64_t);
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  uint64_t v28;
  uint64_t v29;

  v26 = a3;
  v27 = a4;
  v25 = a7;
  v11 = type metadata accessor for OSSignpostID();
  v28 = *(_QWORD *)(v11 - 8);
  v29 = v11;
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    swift_unknownObjectRetain();
    v14 = v7;
    OSSignpostID.init(log:object:)();
  }
  else
  {
    v15 = v7;
    OSSignpostID.init(log:)();
  }
  static os_signpost_type_t.begin.getter();
  v16 = os_signpost(_:dso:log:name:signpostID:_:_:)();
  v17 = a5;
  v25(v16);
  v18 = v27;
  if (v27)
  {
    swift_retain();
    static os_signpost_type_t.end.getter();
    LODWORD(v26) = a2;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_21FE0CD00;
    v20 = v18(v17);
    v22 = v21;
    *(_QWORD *)(v19 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v19 + 64) = lazy protocol witness table accessor for type String and conformance String();
    *(_QWORD *)(v19 + 32) = v20;
    *(_QWORD *)(v19 + 40) = v22;
    os_signpost(_:dso:log:name:signpostID:_:_:)();
    _sxSSRi_zRi0_zlyxIsegno_SglWOe((uint64_t)v18);
    swift_bridgeObjectRelease();
  }
  else
  {
    static os_signpost_type_t.end.getter();
    os_signpost(_:dso:log:name:signpostID:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v13, v29);
}

uint64_t OS_os_log.os_signpostSimpleInterval(object:name:begin:end:closure:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void (*a10)(uint64_t))
{
  void *v10;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v23 = a5;
  v21 = a8;
  v22 = a10;
  v12 = type metadata accessor for OSSignpostID();
  v24 = *(_QWORD *)(v12 - 8);
  v25 = v12;
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    swift_unknownObjectRetain();
    v15 = v10;
    OSSignpostID.init(log:object:)();
  }
  else
  {
    v16 = v10;
    OSSignpostID.init(log:)();
  }
  static os_signpost_type_t.begin.getter();
  v17 = os_signpost(_:dso:log:name:signpostID:_:_:)();
  v22(v17);
  if (a9)
  {
    swift_bridgeObjectRetain();
    static os_signpost_type_t.end.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
    v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_21FE0CD00;
    *(_QWORD *)(v18 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v18 + 64) = lazy protocol witness table accessor for type String and conformance String();
    *(_QWORD *)(v18 + 32) = v21;
    *(_QWORD *)(v18 + 40) = a9;
    os_signpost(_:dso:log:name:signpostID:_:_:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    static os_signpost_type_t.end.getter();
    os_signpost(_:dso:log:name:signpostID:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v14, v25);
}

char **IHSignpost.featureExtraction.unsafeMutableAddressor()
{
  return &static IHSignpost.featureExtraction;
}

const char *static IHSignpost.featureExtraction.getter()
{
  return "featureExtraction";
}

char **IHSignpost.inference.unsafeMutableAddressor()
{
  return &static IHSignpost.inference;
}

const char *static IHSignpost.inference.getter()
{
  return "inference";
}

id default argument 1 of static InferredHelpfulnessClassifier.load(contentsOf:configuration:completionHandler:)()
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBFFD8]), sel_init);
}

id default argument 1 of InferredHelpfulnessClassifier.predictAll(using:options:)()
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC0018]), sel_init);
}

id default argument 0 of static CATUtils.catIdToSpeakeasyCategory(bundle:trialProvider:)()
{
  return objc_msgSend((id)objc_opt_self(), sel_mainBundle);
}

uint64_t default argument 1 of static CATUtils.catIdToSpeakeasyCategory(bundle:trialProvider:)()
{
  if (one-time initialization token for shared != -1)
    swift_once();
  return swift_retain();
}

uint64_t default argument 1 of static CATUtils.classAndUseCase(from:lowercased:)()
{
  return 1;
}

id default argument 0 of TrialProvider.init(client:enrollment:)()
{
  return objc_msgSend((id)objc_opt_self(), sel_clientWithIdentifier_, 266);
}

double default argument 1 of TrialProvider.init(client:enrollment:)@<D0>(_OWORD *a1@<X8>)
{
  double result;

  result = 0.0;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2207D554C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    result = MEMORY[0x2207D5564](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    result = MEMORY[0x2207D5564](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

uint64_t _sxSSRi_zRi0_zlyxIsegno_SglWOe(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

ValueMetadata *type metadata accessor for LoggingConstants()
{
  return &type metadata for LoggingConstants;
}

ValueMetadata *type metadata accessor for IHSignpost()
{
  return &type metadata for IHSignpost;
}

void type metadata accessor for MLModelMetadataKey(uint64_t a1)
{
  type metadata accessor for MLModelMetadataKey(a1, &lazy cache variable for type metadata for MLModelMetadataKey);
}

void protocol witness for RawRepresentable.rawValue.getter in conformance SISchemaAnyEventType(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance MLModelMetadataKey(uint64_t a1, uint64_t a2)
{
  return protocol witness for Hashable.hashValue.getter in conformance MLModelMetadataKey(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t protocol witness for Hashable.hash(into:) in conformance MLModelMetadataKey()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance MLModelMetadataKey()
{
  Swift::Int v0;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t protocol witness for _ObjectiveCBridgeable._bridgeToObjectiveC() in conformance MLModelMetadataKey(uint64_t a1, uint64_t a2)
{
  return protocol witness for Hashable.hashValue.getter in conformance MLModelMetadataKey(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance MLModelMetadataKey(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._forceBridgeFromObjectiveC(_:result:) in conformance MLModelMetadataKey(uint64_t a1, id *a2)
{
  uint64_t result;

  result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:) in conformance MLModelMetadataKey(uint64_t a1, id *a2)
{
  char v3;

  v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t protocol witness for static _ObjectiveCBridgeable._unconditionallyBridgeFromObjectiveC(_:) in conformance MLModelMetadataKey@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3 = MEMORY[0x2207D4DFC](v2);
  result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance SISchemaDismissalReason()
{
  Swift::UInt32 *v0;
  Swift::UInt32 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance SISchemaDismissalReason()
{
  Swift::UInt32 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SISchemaDismissalReason()
{
  Swift::UInt32 *v0;
  Swift::UInt32 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance MLModelMetadataKey()
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

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance SISchemaDismissalReason(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

_DWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance SISchemaDismissalReason@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance MLModelMetadataKey@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = MEMORY[0x2207D4DFC](*a1, a1[1]);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance MLModelMetadataKey@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t protocol witness for _HasCustomAnyHashableRepresentation._toCustomAnyHashable() in conformance MLModelMetadataKey()
{
  lazy protocol witness table accessor for type MLModelMetadataKey and conformance MLModelMetadataKey(&lazy protocol witness table cache variable for type MLModelMetadataKey and conformance MLModelMetadataKey, (uint64_t (*)(uint64_t))type metadata accessor for MLModelMetadataKey, (uint64_t)&protocol conformance descriptor for MLModelMetadataKey);
  lazy protocol witness table accessor for type MLModelMetadataKey and conformance MLModelMetadataKey(&lazy protocol witness table cache variable for type MLModelMetadataKey and conformance MLModelMetadataKey, (uint64_t (*)(uint64_t))type metadata accessor for MLModelMetadataKey, (uint64_t)"ASz.HP");
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t base witness table accessor for RawRepresentable in MLModelMetadataKey()
{
  return lazy protocol witness table accessor for type MLModelMetadataKey and conformance MLModelMetadataKey(&lazy protocol witness table cache variable for type MLModelMetadataKey and conformance MLModelMetadataKey, (uint64_t (*)(uint64_t))type metadata accessor for MLModelMetadataKey, (uint64_t)&protocol conformance descriptor for MLModelMetadataKey);
}

uint64_t base witness table accessor for _HasCustomAnyHashableRepresentation in MLModelMetadataKey()
{
  return lazy protocol witness table accessor for type MLModelMetadataKey and conformance MLModelMetadataKey(&lazy protocol witness table cache variable for type MLModelMetadataKey and conformance MLModelMetadataKey, (uint64_t (*)(uint64_t))type metadata accessor for MLModelMetadataKey, (uint64_t)&protocol conformance descriptor for MLModelMetadataKey);
}

uint64_t lazy protocol witness table accessor for type MLModelMetadataKey and conformance MLModelMetadataKey(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2207D5564](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t base witness table accessor for Equatable in MLModelMetadataKey()
{
  return lazy protocol witness table accessor for type MLModelMetadataKey and conformance MLModelMetadataKey(&lazy protocol witness table cache variable for type MLModelMetadataKey and conformance MLModelMetadataKey, (uint64_t (*)(uint64_t))type metadata accessor for MLModelMetadataKey, (uint64_t)&protocol conformance descriptor for MLModelMetadataKey);
}

unint64_t type metadata accessor for OS_os_log()
{
  unint64_t result;

  result = lazy cache variable for type metadata for OS_os_log;
  if (!lazy cache variable for type metadata for OS_os_log)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for OS_os_log);
  }
  return result;
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

void type metadata accessor for SISchemaDismissalReason(uint64_t a1)
{
  type metadata accessor for MLModelMetadataKey(a1, &lazy cache variable for type metadata for SISchemaDismissalReason);
}

void type metadata accessor for MLModelMetadataKey(uint64_t a1, unint64_t *a2)
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

uint64_t base witness table accessor for Equatable in SISchemaDismissalReason()
{
  return lazy protocol witness table accessor for type MLModelMetadataKey and conformance MLModelMetadataKey(&lazy protocol witness table cache variable for type SISchemaDismissalReason and conformance SISchemaDismissalReason, (uint64_t (*)(uint64_t))type metadata accessor for SISchemaDismissalReason, (uint64_t)&protocol conformance descriptor for SISchemaDismissalReason);
}

id Model.extractFeatureAndLog(input:featureName:)(void *a1, uint64_t a2, unint64_t a3)
{
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = (void *)MEMORY[0x2207D4DFC](a2, a3);
  v7 = objc_msgSend(a1, sel_featureValueForName_, v6);

  if (v7)
  {
    if (one-time initialization token for defaultLogger != -1)
      swift_once();
    v8 = type metadata accessor for Logger();
    __swift_project_value_buffer(v8, (uint64_t)defaultLogger);
    v9 = v7;
    swift_bridgeObjectRetain_n();
    v10 = v9;
    v11 = Logger.logObject.getter();
    v12 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = swift_slowAlloc();
      v22 = a2;
      v14 = (_QWORD *)swift_slowAlloc();
      v23 = swift_slowAlloc();
      v24 = v23;
      *(_DWORD *)v13 = 138412546;
      v15 = v10;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *v14 = v7;

      *(_WORD *)(v13 + 12) = 2080;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v22, a3, &v24);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21FDE7000, v11, v12, "Extracted value: %@ from feature %s", (uint8_t *)v13, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      MEMORY[0x2207D560C](v14, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x2207D560C](v23, -1, -1);
      MEMORY[0x2207D560C](v13, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    if (one-time initialization token for defaultLogger != -1)
      swift_once();
    v16 = type metadata accessor for Logger();
    __swift_project_value_buffer(v16, (uint64_t)defaultLogger);
    swift_bridgeObjectRetain_n();
    v17 = Logger.logObject.getter();
    v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      v20 = swift_slowAlloc();
      v24 = v20;
      *(_DWORD *)v19 = 136315138;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a2, a3, &v24);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21FDE7000, v17, v18, "Couldn't extract value for %s", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207D560C](v20, -1, -1);
      MEMORY[0x2207D560C](v19, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  return v7;
}

uint64_t Model.predictAll(from:)()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_21FE0CFD0;
  *(_QWORD *)(v0 + 32) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBFF80]), sel_init);
  specialized Array._endMutation()();
  return v0;
}

Swift::String __swiftcall MLFeatureProvider.debugDescription()()
{
  void *v0;
  uint64_t v1;
  Swift::String result;

  v0 = (void *)0x800000021FE0E0A0;
  v1 = 0xD000000000000032;
  result._object = v0;
  result._countAndFlagsBits = v1;
  return result;
}

id MLModel.predict(from:)(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  id v8;
  id v9;
  id v10;
  id v12[2];

  v2 = v1;
  v12[1] = *(id *)MEMORY[0x24BDAC8D0];
  if (one-time initialization token for defaultLogger != -1)
    swift_once();
  v4 = type metadata accessor for Logger();
  __swift_project_value_buffer(v4, (uint64_t)defaultLogger);
  v5 = Logger.logObject.getter();
  v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21FDE7000, v5, v6, "Prediction requested", v7, 2u);
    MEMORY[0x2207D560C](v7, -1, -1);
  }

  v12[0] = 0;
  v8 = objc_msgSend(v2, sel_predictionFromFeatures_error_, a1, v12);
  if (v8)
  {
    v9 = v12[0];
  }
  else
  {
    v10 = v12[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v8;
}

id MLModel.predictAll(from:)(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  Class isa;
  id v14;
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  id v23;
  void *v24;
  uint64_t v25;
  id v26[2];

  v2 = v1;
  v26[1] = *(id *)MEMORY[0x24BDAC8D0];
  if (one-time initialization token for defaultLogger != -1)
    swift_once();
  v4 = type metadata accessor for Logger();
  __swift_project_value_buffer(v4, (uint64_t)defaultLogger);
  swift_bridgeObjectRetain_n();
  v5 = Logger.logObject.getter();
  v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = (void *)swift_slowAlloc();
    v26[0] = v8;
    v24 = v2;
    *(_DWORD *)v7 = 136315138;
    v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MLFeatureProvider);
    v10 = MEMORY[0x2207D4EEC](a1, v9);
    v25 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v10, v11, (uint64_t *)v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21FDE7000, v5, v6, "Predictions requested for input: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207D560C](v8, -1, -1);
    MEMORY[0x2207D560C](v7, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v12 = objc_allocWithZone(MEMORY[0x24BDBFF60]);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MLFeatureProvider);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(v12, sel_initWithFeatureProviderArray_, isa);

  v26[0] = 0;
  v15 = objc_msgSend(v2, sel_predictionsFromBatch_error_, v14, v26);

  v16 = v26[0];
  if (v15)
  {
    v26[0] = (id)MEMORY[0x24BEE4AF8];
    v17 = v16;
    v18 = (unint64_t)objc_msgSend(v15, sel_count);
    if ((v18 & 0x8000000000000000) != 0)
      __break(1u);
    v19 = v18;
    if (v18)
    {
      v20 = 0;
      do
      {
        v21 = objc_msgSend(v15, sel_featuresAtIndex_, v20, v24, v25);
        MEMORY[0x2207D4EB0]();
        if (*(_QWORD *)(((unint64_t)v26[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)(((unint64_t)v26[0] & 0xFFFFFFFFFFFFFF8)
                                                                                               + 0x18) >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        ++v20;
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
      while (v19 != v20);
      swift_unknownObjectRelease();
      return v26[0];
    }
    else
    {
      swift_unknownObjectRelease();
      return (id)MEMORY[0x24BEE4AF8];
    }
  }
  else
  {
    v23 = v26[0];
    _convertNSErrorToError(_:)();

    return (id)swift_willThrow();
  }
}

id protocol witness for Model.predict(from:) in conformance MLModel(uint64_t a1)
{
  return MLModel.predict(from:)(a1);
}

id protocol witness for Model.predictAll(from:) in conformance MLModel(uint64_t a1)
{
  return MLModel.predictAll(from:)(a1);
}

uint64_t closure #1 in static ModelRunner.predictions(model:input:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;

  v5 = a1[3];
  v6 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v5);
  v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(a2, v5, v6);
  static os_log_type_t.debug.getter();
  if (one-time initialization token for signpostLogger != -1)
    swift_once();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CVarArg>);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_21FE0CD00;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MLFeatureProvider);
  v10 = MEMORY[0x2207D4EEC](a2, v9);
  v12 = v11;
  *(_QWORD *)(v8 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v8 + 64) = lazy protocol witness table accessor for type String and conformance String();
  *(_QWORD *)(v8 + 32) = v10;
  *(_QWORD *)(v8 + 40) = v12;
  os_log(_:dso:log:_:_:)();
  result = swift_bridgeObjectRelease();
  *a3 = v7;
  return result;
}

uint64_t static ModelRunner.prediction(model:input:)(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_21FE0CFD0;
  *(_QWORD *)(v4 + 32) = a2;
  v8 = v4;
  specialized Array._endMutation()();
  swift_unknownObjectRetain();
  v5 = specialized static ModelRunner.predictions(model:input:)(a1, v8);
  result = swift_bridgeObjectRelease();
  if (!v5)
    return 0;
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = _CocoaArrayWrapper.endIndex.getter();
    result = swift_bridgeObjectRelease();
    if (!v7)
      goto LABEL_7;
  }
  else
  {
    v7 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      return v7;
    }
  }
  if ((v5 & 0xC000000000000001) != 0)
  {
    v7 = MEMORY[0x2207D5048](0, v5);
    goto LABEL_7;
  }
  if (*(_QWORD *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    v7 = *(_QWORD *)(v5 + 32);
    swift_unknownObjectRetain();
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t ModelRunner.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t ModelRunner.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t ModelRunner.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t ModelRunner.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t serialize(_:at:)(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t closure #1 in osLogInternal(_:log:type:)(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:privacy:)(uint64_t (*a1)(void))
{
  return a1();
}

void closure #1 in OSLogArguments.append(_:)(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *a1 = v7;
  v8 = *a2;
  if (*a2)
  {
    *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {

  }
}

_BYTE **closure #1 in OSLogArguments.append(_:)(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
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

uint64_t specialized static ModelRunner.predictions(model:input:)(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  id v12;
  uint64_t v14;
  uint64_t v15;

  v4 = type metadata accessor for OSSignpostID();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for defaultLogger != -1)
    swift_once();
  v8 = type metadata accessor for Logger();
  __swift_project_value_buffer(v8, (uint64_t)defaultLogger);
  v9 = Logger.logObject.getter();
  v10 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_21FDE7000, v9, v10, "Predictions requested", v11, 2u);
    MEMORY[0x2207D560C](v11, -1, -1);
  }

  if (one-time initialization token for signpostLogger != -1)
    swift_once();
  v12 = (id)signpostLogger;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:_:_:)();
  closure #1 in static ModelRunner.predictions(model:input:)(a1, a2, &v15);
  static os_signpost_type_t.end.getter();
  os_signpost(_:dso:log:name:signpostID:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

uint64_t dispatch thunk of Model.predict(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of Model.predictAll(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t type metadata accessor for ModelRunner()
{
  return objc_opt_self();
}

uint64_t method lookup function for ModelRunner()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ModelRunner.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t lazy protocol witness table accessor for type [MLFeatureProvider] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [MLFeatureProvider] and conformance [A];
  if (!lazy protocol witness table cache variable for type [MLFeatureProvider] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [MLFeatureProvider]);
    result = MEMORY[0x2207D5564](MEMORY[0x24BDCFBF8], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [MLFeatureProvider] and conformance [A]);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2207D5558](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
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

id static ORCHEvents.orchEvent(from:)()
{
  return specialized SISchemaAnyEvent.unwrappedPayload<A>(as:)();
}

id specialized SISchemaAnyEvent.unwrappedPayload<A>(as:)()
{
  void *v0;
  Class isa;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  id v5;
  id v6;
  id v8;

  if (objc_msgSend(v0, sel_anyEventType) == 6)
  {
    isa = (Class)objc_msgSend(v0, sel_payload);
    if (isa)
    {
      v2 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      v4 = v3;

      isa = Data._bridgeToObjectiveC()().super.isa;
      outlined consume of Data._Representation(v2, v4);
    }
    v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95B30]), sel_initWithData_, isa);

    v6 = objc_msgSend(v5, sel_event);
    if (!v6)
      return 0;
  }
  else
  {
    v6 = v0;
  }
  v8 = specialized SISchemaAnyEvent.topLevelPayload<A>(as:)();

  return v8;
}

uint64_t static ORCHEvents.requestID(_:)@<X0>(uint64_t a1@<X8>)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;

  v2 = specialized SISchemaAnyEvent.unwrappedPayload<A>(as:)();
  if (v2
    && (v3 = v2, v4 = objc_msgSend(v2, sel_eventMetadata), v3, v4)
    && (v5 = objc_msgSend(v4, sel_requestId), v4, v5))
  {
    SISchemaUUID.toNSUUID()();

    v6 = type metadata accessor for UUID();
    v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56);
    v8 = a1;
    v9 = 0;
  }
  else
  {
    v6 = type metadata accessor for UUID();
    v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56);
    v8 = a1;
    v9 = 1;
  }
  return v7(v8, v9, 1, v6);
}

ValueMetadata *type metadata accessor for ORCHEvents()
{
  return &type metadata for ORCHEvents;
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

uint64_t Collection.filterByType<A>(as:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v12[16];
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  MEMORY[0x24BDAC7A8]();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v9 + 16))(&v12[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)], v4, a2);
  v13 = a2;
  v14 = a3;
  v15 = a4;
  Sequence.filter(_:)();
  swift_getAssociatedTypeWitness();
  v10 = _arrayConditionalCast<A, B>(_:)();
  swift_bridgeObjectRelease();
  if (!v10)
    return Array.init()();
  return v10;
}

BOOL partial apply for closure #1 in Collection.filterByType<A>(as:)()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_getAssociatedTypeWitness();
  return swift_getDynamicType() == v1;
}

uint64_t Collection.featureValueByType<A, B>(as:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v7;
  uint64_t v9;

  Collection.filterByType<A>(as:)(a1, a2, a3, a4);
  v7 = type metadata accessor for Array();
  MEMORY[0x2207D5564](MEMORY[0x24BEE12E0], v7);
  Collection.first.getter();
  swift_bridgeObjectRelease();
  if (!v9)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a3 + *MEMORY[0x24BEA4D00])
                                                                            - 8)
                                                                + 56))(a5, 1, 1);
  swift_retain();
  dispatch thunk of TypedFeature.value.getter();
  return swift_release_n();
}

uint64_t SISchemaAnyEvent.unwrappedPayload<A>(as:)()
{
  void *v0;
  Class isa;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  id v5;
  id v6;
  uint64_t v8;

  if (objc_msgSend(v0, sel_anyEventType) == 6)
  {
    isa = (Class)objc_msgSend(v0, sel_payload);
    if (isa)
    {
      v2 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      v4 = v3;

      isa = Data._bridgeToObjectiveC()().super.isa;
      outlined consume of Data._Representation(v2, v4);
    }
    v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95B30]), sel_initWithData_, isa);

    v6 = objc_msgSend(v5, sel_event);
    if (!v6)
      return 0;
  }
  else
  {
    v6 = v0;
  }
  v8 = SISchemaAnyEvent.topLevelPayload<A>(as:)();

  return v8;
}

id SISchemaAnyEvent.unwrapOrderingLayer()()
{
  void *v0;
  Class isa;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  id v5;
  id v6;

  if (objc_msgSend(v0, sel_anyEventType) != 6)
    return v0;
  isa = (Class)objc_msgSend(v0, sel_payload);
  if (isa)
  {
    v2 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v4 = v3;

    isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data._Representation(v2, v4);
  }
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95B30]), sel_initWithData_, isa);

  v6 = objc_msgSend(v5, sel_event);
  return v6;
}

uint64_t SISchemaAnyEvent.topLevelPayload<A>(as:)()
{
  void *v0;
  id v1;
  Class isa;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  objc_class *v33;
  id v34;
  uint64_t result;

  v1 = SISchemaAnyEvent.unwrapOrderingLayer()();
  switch(objc_msgSend(v0, sel_anyEventType))
  {
    case 1u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v3 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v5 = v4;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v3, v5);
        }
      }
      else
      {
        isa = 0;
      }
      v33 = (objc_class *)MEMORY[0x24BE95AD8];
      goto LABEL_53;
    case 4u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v8 = v7;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v6, v8);
        }
      }
      else
      {
        isa = 0;
      }
      v33 = (objc_class *)MEMORY[0x24BE95180];
      goto LABEL_53;
    case 6u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v11 = v10;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v9, v11);
        }
      }
      else
      {
        isa = 0;
      }
      v33 = (objc_class *)MEMORY[0x24BE95B30];
      goto LABEL_53;
    case 7u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v14 = v13;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v12, v14);
        }
      }
      else
      {
        isa = 0;
      }
      v33 = (objc_class *)MEMORY[0x24BE95B50];
      goto LABEL_53;
    case 9u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v15 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v17 = v16;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v15, v17);
        }
      }
      else
      {
        isa = 0;
      }
      v33 = (objc_class *)MEMORY[0x24BE95B60];
      goto LABEL_53;
    case 0xDu:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v18 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v20 = v19;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v18, v20);
        }
      }
      else
      {
        isa = 0;
      }
      v33 = (objc_class *)MEMORY[0x24BE94BE8];
      goto LABEL_53;
    case 0xEu:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v21 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v23 = v22;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v21, v23);
        }
      }
      else
      {
        isa = 0;
      }
      v33 = (objc_class *)MEMORY[0x24BE949F8];
      goto LABEL_53;
    case 0x12u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v24 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v26 = v25;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v24, v26);
        }
      }
      else
      {
        isa = 0;
      }
      v33 = (objc_class *)MEMORY[0x24BE95448];
      goto LABEL_53;
    case 0x13u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v27 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v29 = v28;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v27, v29);
        }
      }
      else
      {
        isa = 0;
      }
      v33 = (objc_class *)MEMORY[0x24BE95670];
      goto LABEL_53;
    case 0x14u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v30 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v32 = v31;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v30, v32);
        }
      }
      else
      {
        isa = 0;
      }
      v33 = (objc_class *)MEMORY[0x24BE949A0];
LABEL_53:
      v34 = objc_msgSend(objc_allocWithZone(v33), sel_initWithData_, isa);

      if (!v34)
        return 0;
      result = swift_dynamicCastUnknownClass();
      if (!result)
      {

        return 0;
      }
      return result;
    default:

      return 0;
  }
}

uint64_t SELFFeatureExtracting.extract(from:)()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t SELFFeatureExtracting.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t SELFFeatureExtracting.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t SELFFeatureExtracting.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t SELFFeatureExtracting.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t protocol witness for FeatureExtracting.extract(from:) in conformance SELFFeatureExtracting(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)v1 + 80))(*a1);
}

uint64_t type metadata accessor for SELFFeatureExtracting()
{
  return objc_opt_self();
}

uint64_t method lookup function for SELFFeatureExtracting()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SELFFeatureExtracting.extract(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 80))();
}

uint64_t dispatch thunk of SELFFeatureExtracting.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

id specialized SISchemaAnyEvent.topLevelPayload<A>(as:)()
{
  void *v0;
  id v1;
  Class isa;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  NSData v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  id v36;
  objc_class *v37;
  id v38;

  v1 = SISchemaAnyEvent.unwrapOrderingLayer()();
  switch(objc_msgSend(v0, sel_anyEventType))
  {
    case 1u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v3 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v5 = v4;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v3, v5);
        }
      }
      else
      {
        isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x24BE95AD8];
      goto LABEL_53;
    case 4u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v8 = v7;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v6, v8);
        }
      }
      else
      {
        isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x24BE95180];
      goto LABEL_53;
    case 6u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v11 = v10;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v9, v11);
        }
      }
      else
      {
        isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x24BE95B30];
      goto LABEL_53;
    case 7u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v14 = v13;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v12, v14);
        }
      }
      else
      {
        isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x24BE95B50];
      goto LABEL_53;
    case 9u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v15 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v17 = v16;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v15, v17);
        }
      }
      else
      {
        isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x24BE95B60];
      goto LABEL_53;
    case 0xDu:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v18 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v20 = v19;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v18, v20);
        }
      }
      else
      {
        isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x24BE94BE8];
      goto LABEL_53;
    case 0xEu:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v21 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v23 = v22;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v21, v23);
        }
      }
      else
      {
        isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x24BE949F8];
      goto LABEL_53;
    case 0x12u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v24 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v26 = v25;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v24, v26);
        }
      }
      else
      {
        isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x24BE95448];
      goto LABEL_53;
    case 0x13u:
      if (v1 && (v27 = objc_msgSend(v1, sel_payload)) != 0)
      {
        v28 = v27;
        v29 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
        v31 = v30;

        v32.super.isa = Data._bridgeToObjectiveC()().super.isa;
        outlined consume of Data._Representation(v29, v31);
      }
      else
      {
        v32.super.isa = 0;
      }
      v36 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95670]), sel_initWithData_, v32.super.isa);

      return v36;
    case 0x14u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v33 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v35 = v34;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v33, v35);
        }
      }
      else
      {
        isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x24BE949A0];
LABEL_53:
      v38 = objc_msgSend(objc_allocWithZone(v37), sel_initWithData_, isa);

      if (v38)
      break;
    default:

      break;
  }
  return 0;
}

{
  void *v0;
  id v1;
  Class isa;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  NSData v35;
  id v36;
  objc_class *v37;
  id v38;

  v1 = SISchemaAnyEvent.unwrapOrderingLayer()();
  switch(objc_msgSend(v0, sel_anyEventType))
  {
    case 1u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v3 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v5 = v4;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v3, v5);
        }
      }
      else
      {
        isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x24BE95AD8];
      goto LABEL_53;
    case 4u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v8 = v7;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v6, v8);
        }
      }
      else
      {
        isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x24BE95180];
      goto LABEL_53;
    case 6u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v11 = v10;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v9, v11);
        }
      }
      else
      {
        isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x24BE95B30];
      goto LABEL_53;
    case 7u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v14 = v13;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v12, v14);
        }
      }
      else
      {
        isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x24BE95B50];
      goto LABEL_53;
    case 9u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v15 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v17 = v16;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v15, v17);
        }
      }
      else
      {
        isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x24BE95B60];
      goto LABEL_53;
    case 0xDu:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v18 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v20 = v19;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v18, v20);
        }
      }
      else
      {
        isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x24BE94BE8];
      goto LABEL_53;
    case 0xEu:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v21 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v23 = v22;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v21, v23);
        }
      }
      else
      {
        isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x24BE949F8];
      goto LABEL_53;
    case 0x12u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v24 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v26 = v25;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v24, v26);
        }
      }
      else
      {
        isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x24BE95448];
      goto LABEL_53;
    case 0x13u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v27 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v29 = v28;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v27, v29);
        }
      }
      else
      {
        isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x24BE95670];
LABEL_53:
      v38 = objc_msgSend(objc_allocWithZone(v37), sel_initWithData_, isa);

      if (v38)
      return 0;
    case 0x14u:
      if (v1 && (v30 = objc_msgSend(v1, sel_payload)) != 0)
      {
        v31 = v30;
        v32 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
        v34 = v33;

        v35.super.isa = Data._bridgeToObjectiveC()().super.isa;
        outlined consume of Data._Representation(v32, v34);
      }
      else
      {
        v35.super.isa = 0;
      }
      v36 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE949A0]), sel_initWithData_, v35.super.isa);

      return v36;
    default:

      return 0;
  }
}

{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  NSData v7;
  Class isa;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  id v36;
  objc_class *v37;
  id v38;

  v1 = SISchemaAnyEvent.unwrapOrderingLayer()();
  switch(objc_msgSend(v0, sel_anyEventType))
  {
    case 1u:
      if (v1 && (v2 = objc_msgSend(v1, sel_payload)) != 0)
      {
        v3 = v2;
        v4 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
        v6 = v5;

        v7.super.isa = Data._bridgeToObjectiveC()().super.isa;
        outlined consume of Data._Representation(v4, v6);
      }
      else
      {
        v7.super.isa = 0;
      }
      v36 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95AD8]), sel_initWithData_, v7.super.isa);

      return v36;
    case 4u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v11 = v10;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v9, v11);
        }
      }
      else
      {
        isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x24BE95180];
      goto LABEL_53;
    case 6u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v14 = v13;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v12, v14);
        }
      }
      else
      {
        isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x24BE95B30];
      goto LABEL_53;
    case 7u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v15 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v17 = v16;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v15, v17);
        }
      }
      else
      {
        isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x24BE95B50];
      goto LABEL_53;
    case 9u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v18 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v20 = v19;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v18, v20);
        }
      }
      else
      {
        isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x24BE95B60];
      goto LABEL_53;
    case 0xDu:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v21 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v23 = v22;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v21, v23);
        }
      }
      else
      {
        isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x24BE94BE8];
      goto LABEL_53;
    case 0xEu:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v24 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v26 = v25;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v24, v26);
        }
      }
      else
      {
        isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x24BE949F8];
      goto LABEL_53;
    case 0x12u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v27 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v29 = v28;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v27, v29);
        }
      }
      else
      {
        isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x24BE95448];
      goto LABEL_53;
    case 0x13u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v30 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v32 = v31;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v30, v32);
        }
      }
      else
      {
        isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x24BE95670];
      goto LABEL_53;
    case 0x14u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v33 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v35 = v34;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v33, v35);
        }
      }
      else
      {
        isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x24BE949A0];
LABEL_53:
      v38 = objc_msgSend(objc_allocWithZone(v37), sel_initWithData_, isa);

      if (v38)
      break;
    default:

      break;
  }
  return 0;
}

{
  void *v0;
  id v1;
  Class isa;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  NSData v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  id v36;
  objc_class *v37;
  id v38;

  v1 = SISchemaAnyEvent.unwrapOrderingLayer()();
  switch(objc_msgSend(v0, sel_anyEventType))
  {
    case 1u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v3 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v5 = v4;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v3, v5);
        }
      }
      else
      {
        isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x24BE95AD8];
      goto LABEL_53;
    case 4u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v8 = v7;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v6, v8);
        }
      }
      else
      {
        isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x24BE95180];
      goto LABEL_53;
    case 6u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v11 = v10;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v9, v11);
        }
      }
      else
      {
        isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x24BE95B30];
      goto LABEL_53;
    case 7u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v14 = v13;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v12, v14);
        }
      }
      else
      {
        isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x24BE95B50];
      goto LABEL_53;
    case 9u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v15 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v17 = v16;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v15, v17);
        }
      }
      else
      {
        isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x24BE95B60];
      goto LABEL_53;
    case 0xDu:
      if (v1 && (v18 = objc_msgSend(v1, sel_payload)) != 0)
      {
        v19 = v18;
        v20 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
        v22 = v21;

        v23.super.isa = Data._bridgeToObjectiveC()().super.isa;
        outlined consume of Data._Representation(v20, v22);
      }
      else
      {
        v23.super.isa = 0;
      }
      v36 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE94BE8]), sel_initWithData_, v23.super.isa);

      return v36;
    case 0xEu:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v24 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v26 = v25;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v24, v26);
        }
      }
      else
      {
        isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x24BE949F8];
      goto LABEL_53;
    case 0x12u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v27 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v29 = v28;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v27, v29);
        }
      }
      else
      {
        isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x24BE95448];
      goto LABEL_53;
    case 0x13u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v30 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v32 = v31;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v30, v32);
        }
      }
      else
      {
        isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x24BE95670];
      goto LABEL_53;
    case 0x14u:
      if (v1)
      {
        isa = (Class)objc_msgSend(v1, sel_payload);
        if (isa)
        {
          v33 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v35 = v34;

          isa = Data._bridgeToObjectiveC()().super.isa;
          outlined consume of Data._Representation(v33, v35);
        }
      }
      else
      {
        isa = 0;
      }
      v37 = (objc_class *)MEMORY[0x24BE949A0];
LABEL_53:
      v38 = objc_msgSend(objc_allocWithZone(v37), sel_initWithData_, isa);

      if (v38)
      break;
    default:

      break;
  }
  return 0;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance FlowTaskStep(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)a1 == *(_QWORD *)a2 && *(_DWORD *)(a1 + 24) == *(_DWORD *)(a2 + 24);
}

void *static FlowClientFeatureExtractor.currentTaskName(_:)(void *a1)
{
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(a1, sel_flowState);
  v2 = v1;
  if (v1)
  {
    v3 = objc_msgSend(v1, sel_currentTaskName);

    if (v3)
    {
      v2 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)();

    }
    else
    {
      return 0;
    }
  }
  return v2;
}

unint64_t static FlowClientFeatureExtractor.flowStateType(_:)(void *a1)
{
  id v1;
  void *v2;
  unsigned int v3;
  uint64_t v4;

  v1 = objc_msgSend(a1, sel_flowState);
  v2 = v1;
  if (v1)
  {
    v3 = objc_msgSend(v1, sel_flowStateType);

    v4 = v3;
  }
  else
  {
    v4 = 0;
  }
  return v4 | ((unint64_t)(v2 == 0) << 32);
}

unint64_t static FlowClientFeatureExtractor.flowStatusReason(_:)(void *a1)
{
  id v1;
  void *v2;
  id v3;
  unsigned int v4;
  unsigned __int8 v5;
  uint64_t v6;

  v1 = objc_msgSend(a1, sel_flowState);
  if (v1
    && (v2 = v1, v3 = objc_msgSend(v1, sel_flowStateReason), v2, v3))
  {
    v4 = objc_msgSend(v3, sel_statusReason);

    v5 = 0;
    v6 = v4;
  }
  else
  {
    v6 = 0;
    v5 = 1;
  }
  return v6 | ((unint64_t)v5 << 32);
}

uint64_t FlowClientFeatureExtractor.extract(from:)(unint64_t a1)
{
  _QWORD *v1;
  uint64_t (*v2)(unint64_t, uint64_t);
  _QWORD *v3;
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint32_t *p_align;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  unsigned int v27;
  uint32_t *v28;
  id v29;
  void *v30;
  id v31;
  unsigned int v32;
  unint64_t v33;
  _QWORD *v34;
  unint64_t v35;
  _QWORD *v36;
  unint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  _QWORD *v47;
  unsigned int *v48;
  uint64_t v49;
  unsigned int v50;
  __CFString *v51;
  __CFString *v52;
  uint64_t v53;
  __CFString *v54;
  __CFString *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  _QWORD *v61;
  char *v62;
  unsigned int *v63;
  unsigned int v64;
  __CFString *v65;
  __CFString *v66;
  uint64_t v67;
  __CFString *v68;
  __CFString *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  _QWORD *v75;
  unsigned int *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD *v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  _QWORD *v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  void (*v101)(char *, uint64_t, uint64_t);
  uint64_t v102;
  void (*v103)(char *, char *, uint64_t);
  uint64_t (*v104)(char *, uint64_t);
  uint64_t v105;
  _QWORD *v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v114;
  char *v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  void (*v119)(char *, unint64_t, uint64_t);
  char *v120;
  _QWORD *v121;
  _QWORD *v122;
  uint64_t v123;
  uint64_t v124;

  v117 = type metadata accessor for Confidence();
  v114 = *(_QWORD *)(v117 - 8);
  v8 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v116 = (char *)&v114 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v115 = (char *)&v114 - v10;
  v124 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v11 = _CocoaArrayWrapper.endIndex.getter();
    if (v11)
      goto LABEL_3;
  }
  else
  {
    v11 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v11)
    {
LABEL_3:
      if (v11 >= 1)
      {
        v12 = 0;
        v120 = (char *)(a1 & 0xC000000000000001);
        v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
        p_align = &stru_24E5B6FE8.align;
        v118 = v11;
        v119 = (void (*)(char *, unint64_t, uint64_t))a1;
        while (1)
        {
          v16 = v120 ? (id)MEMORY[0x2207D5048](v12, a1) : *(id *)(a1 + 8 * v12 + 32);
          v17 = v16;
          v18 = specialized SISchemaAnyEvent.topLevelPayload<A>(as:)();
          v15 = objc_msgSend(v18, sel_flowStep);

          if (v15)
            break;
          v15 = v17;
LABEL_6:
          ++v12;

          if (v11 == v12)
            goto LABEL_35;
        }
        v19 = objc_msgSend(v15, sel_timestampMs);
        v20 = objc_msgSend(v15, *((SEL *)p_align + 96));
        v21 = v20;
        v121 = v19;
        if (v20)
        {
          v22 = objc_msgSend(v20, sel_currentTaskName);

          if (v22)
          {
            v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            v21 = v24;

          }
          else
          {
            v23 = 0;
            v21 = 0;
          }
        }
        else
        {
          v23 = 0;
        }
        v25 = objc_msgSend(v15, *((SEL *)p_align + 96));
        if (v25)
        {
          v26 = v25;
          v27 = objc_msgSend(v25, sel_flowStateType);

        }
        else
        {
          v27 = -1;
        }
        v28 = p_align;
        v29 = objc_msgSend(v15, *((SEL *)p_align + 96));
        if (v29
          && (v30 = v29,
              v31 = objc_msgSend(v29, sel_flowStateReason),
              v30,
              v31))
        {
          v32 = objc_msgSend(v31, sel_statusReason);

          if (v21)
          {
            v33 = (unint64_t)v21;
          }
          else
          {
            v23 = 0;
            v33 = 0xE000000000000000;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
            goto LABEL_30;
        }
        else
        {
          if (v21)
          {
            v33 = (unint64_t)v21;
          }
          else
          {
            v23 = 0;
            v33 = 0xE000000000000000;
          }
          v32 = -1;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
            goto LABEL_30;
        }
        v13 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v13[2] + 1, 1, v13);
LABEL_30:
        v34 = v13;
        v35 = v13[2];
        v36 = v34;
        v37 = v34[3];
        if (v35 >= v37 >> 1)
          v36 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v37 > 1), v35 + 1, 1, v36);
        v36[2] = v35 + 1;
        v38 = &v36[4 * v35];
        v13 = v36;
        v38[4] = v121;
        v38[5] = v23;
        v38[6] = v33;
        *((_DWORD *)v38 + 14) = v27;
        *((_DWORD *)v38 + 15) = v32;

        v11 = v118;
        a1 = (unint64_t)v119;
        p_align = v28;
        goto LABEL_6;
      }
      __break(1u);
LABEL_80:
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      goto LABEL_62;
    }
  }
  v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_35:
  swift_bridgeObjectRelease();
  v122 = v13;
  swift_bridgeObjectRetain_n();
  specialized MutableCollection<>.sort(by:)((uint64_t *)&v122);
  v121 = v13;
  swift_bridgeObjectRelease();
  v39 = (uint64_t)v122;
  v40 = v122[2];
  if (v40)
  {
    swift_retain();
    v41 = (uint64_t *)(v39 + 48);
    v1 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v42 = v40;
    do
    {
      v44 = *(v41 - 1);
      v43 = *v41;
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v1 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v1[2] + 1, 1, v1);
      v46 = v1[2];
      v45 = v1[3];
      if (v46 >= v45 >> 1)
        v1 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v45 > 1), v46 + 1, 1, v1);
      v1[2] = v46 + 1;
      v47 = &v1[2 * v46];
      v47[4] = v44;
      v47[5] = v43;
      v41 += 4;
      --v42;
    }
    while (v42);
    swift_release();
    swift_retain();
    v4 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v120 = (char *)v39;
    v48 = (unsigned int *)(v39 + 56);
    v49 = v40;
    do
    {
      v50 = *v48;
      swift_bridgeObjectRetain();
      v51 = CFSTR("FLOWSTATETYPE_UNKNOWN");
      v52 = CFSTR("FLOWSTATETYPE_UNKNOWN");
      if (v50 <= 0xCF)
      {
        v53 = (int)v50;
        v51 = off_24E5B2300[v53];
        v52 = off_24E5B2980[v53];
      }
      v54 = v51;
      v55 = v52;
      v56 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v58 = v57;
      swift_bridgeObjectRelease();

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4[2] + 1, 1, v4);
      v60 = v4[2];
      v59 = v4[3];
      if (v60 >= v59 >> 1)
        v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v59 > 1), v60 + 1, 1, v4);
      v48 += 8;
      v4[2] = v60 + 1;
      v61 = &v4[2 * v60];
      v61[4] = v56;
      v61[5] = v58;
      --v49;
    }
    while (v49);
    v62 = v120;
    swift_release();
    swift_retain();
    v63 = (unsigned int *)(v62 + 60);
    v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      v64 = *v63;
      swift_bridgeObjectRetain();
      v65 = CFSTR("FLOWSTATUSREASON_UNKNOWN");
      v66 = CFSTR("FLOWSTATUSREASON_UNKNOWN");
      if (v64 <= 0x62)
      {
        v67 = (int)v64;
        v65 = off_24E5B3000[v67];
        v66 = off_24E5B3318[v67];
      }
      v68 = v65;
      v69 = v66;
      v70 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v72 = v71;
      swift_bridgeObjectRelease();

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3[2] + 1, 1, v3);
      v74 = v3[2];
      v73 = v3[3];
      if (v74 >= v73 >> 1)
        v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v73 > 1), v74 + 1, 1, v3);
      v63 += 8;
      v3[2] = v74 + 1;
      v75 = &v3[2 * v74];
      v75[4] = v70;
      v75[5] = v72;
      --v40;
    }
    while (v40);
    swift_release();
  }
  else
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v4 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v1 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  swift_release();
  v5 = v4[2];
  v76 = (unsigned int *)MEMORY[0x24BEA4C58];
  if (!v5)
  {
    swift_bridgeObjectRelease();
    v6 = v1[2];
    if (v6)
      goto LABEL_65;
    goto LABEL_76;
  }
  a1 = *MEMORY[0x24BEA4C58];
  v77 = v114;
  v6 = (unint64_t)v115;
  v78 = v117;
  v120 = *(char **)(v114 + 104);
  ((void (*)(char *, unint64_t, uint64_t))v120)(v115, a1, v117);
  type metadata accessor for FlowStateTypeSequence(0);
  swift_allocObject();
  v122 = v4;
  v119 = *(void (**)(char *, unint64_t, uint64_t))(v77 + 16);
  v119(v116, v6, v78);
  swift_bridgeObjectRetain();
  TypedFeature.init(value:confidence:)();
  v2 = *(uint64_t (**)(unint64_t, uint64_t))(v77 + 8);
  v79 = v2(v6, v78);
  MEMORY[0x2207D4EB0](v79);
  if (*(_QWORD *)((v124 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v124 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    goto LABEL_80;
LABEL_62:
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  if (v5 > v4[2])
  {
    __break(1u);
    goto LABEL_82;
  }
  v80 = &v4[2 * v5];
  v82 = v80[2];
  v81 = v80[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v83 = v115;
  v84 = a1;
  v85 = v117;
  ((void (*)(char *, unint64_t, uint64_t))v120)(v115, v84, v117);
  type metadata accessor for FinalFlowStateType(0);
  swift_allocObject();
  v122 = (_QWORD *)v82;
  v123 = v81;
  v119(v116, (unint64_t)v83, v85);
  TypedFeature.init(value:confidence:)();
  v86 = v2((unint64_t)v83, v85);
  MEMORY[0x2207D4EB0](v86);
  if (*(_QWORD *)((v124 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v124 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    goto LABEL_84;
  while (1)
  {
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    v76 = (unsigned int *)MEMORY[0x24BEA4C58];
    v6 = v1[2];
    if (!v6)
      break;
LABEL_65:
    a1 = *v76;
    v87 = v114;
    v88 = v115;
    v89 = v117;
    v120 = *(char **)(v114 + 104);
    ((void (*)(char *, unint64_t, uint64_t))v120)(v115, a1, v117);
    type metadata accessor for FlowTaskNameSequence(0);
    swift_allocObject();
    v122 = v1;
    v5 = *(_QWORD *)(v87 + 16);
    ((void (*)(char *, char *, uint64_t))v5)(v116, v88, v89);
    swift_bridgeObjectRetain();
    TypedFeature.init(value:confidence:)();
    v2 = *(uint64_t (**)(unint64_t, uint64_t))(v87 + 8);
    v90 = v2((unint64_t)v88, v89);
    MEMORY[0x2207D4EB0](v90);
    if (*(_QWORD *)((v124 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v124 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
LABEL_82:
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    if (v6 <= v1[2])
    {
      v91 = &v1[2 * v6];
      v93 = v91[2];
      v92 = v91[3];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v94 = v115;
      v95 = v117;
      ((void (*)(char *, unint64_t, uint64_t))v120)(v115, a1, v117);
      type metadata accessor for FinalFlowTaskName(0);
      swift_allocObject();
      v122 = (_QWORD *)v93;
      v123 = v92;
      ((void (*)(char *, char *, uint64_t))v5)(v116, v94, v95);
      TypedFeature.init(value:confidence:)();
      v96 = v2((unint64_t)v94, v95);
      MEMORY[0x2207D4EB0](v96);
      if (*(_QWORD *)((v124 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v124 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        goto LABEL_86;
      while (1)
      {
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
        v76 = (unsigned int *)MEMORY[0x24BEA4C58];
        v97 = v3[2];
        if (!v97)
          break;
LABEL_69:
        v98 = *v76;
        v99 = v114;
        v100 = v115;
        v101 = *(void (**)(char *, uint64_t, uint64_t))(v114 + 104);
        v102 = v117;
        v101(v115, v98, v117);
        type metadata accessor for FlowStatusReasonSequence(0);
        swift_allocObject();
        v122 = v3;
        v103 = *(void (**)(char *, char *, uint64_t))(v99 + 16);
        v103(v116, v100, v102);
        swift_bridgeObjectRetain();
        TypedFeature.init(value:confidence:)();
        v104 = *(uint64_t (**)(char *, uint64_t))(v99 + 8);
        v105 = v104(v100, v102);
        MEMORY[0x2207D4EB0](v105);
        if (*(_QWORD *)((v124 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v124 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
        if (v97 <= v3[2])
        {
          v106 = &v3[2 * v97];
          v108 = v106[2];
          v107 = v106[3];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v109 = v115;
          v110 = v98;
          v111 = v117;
          v101(v115, v110, v117);
          type metadata accessor for FinalFlowStatusReason(0);
          swift_allocObject();
          v122 = (_QWORD *)v108;
          v123 = v107;
          v103(v116, v109, v111);
          TypedFeature.init(value:confidence:)();
          v112 = v104(v109, v111);
          MEMORY[0x2207D4EB0](v112);
          if (*(_QWORD *)((v124 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v124 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
          specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized Array._endMutation()();
          return v124;
        }
        __break(1u);
LABEL_86:
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      goto LABEL_77;
    }
    __break(1u);
LABEL_84:
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
LABEL_76:
  swift_bridgeObjectRelease();
  v97 = v3[2];
  if (v97)
    goto LABEL_69;
LABEL_77:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v124;
}

uint64_t FlowStateTypeSequence.__allocating_init(value:confidence:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD v10[2];

  v4 = type metadata accessor for Confidence();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  v10[1] = a1;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  v8 = TypedFeature.init(value:confidence:)();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  return v8;
}

uint64_t FinalFlowStateType.__allocating_init(value:confidence:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD v12[2];

  v6 = type metadata accessor for Confidence();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  v12[0] = a1;
  v12[1] = a2;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a3, v6);
  v10 = TypedFeature.init(value:confidence:)();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a3, v6);
  return v10;
}

uint64_t FlowClientFeatureExtractor.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t FlowClientFeatureExtractor.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t FlowClientFeatureExtractor.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t FlowClientFeatureExtractor.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to FlowStateTypeSequence.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to FlowStateTypeSequence.__allocating_init(value:confidence:)(a1, a2, (void (*)(_QWORD))type metadata accessor for FlowStateTypeSequence);
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to FlowTaskNameSequence.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to FlowStateTypeSequence.__allocating_init(value:confidence:)(a1, a2, (void (*)(_QWORD))type metadata accessor for FlowTaskNameSequence);
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to FlowStateTypeSequence.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2, void (*a3)(_QWORD))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[2];

  v6 = type metadata accessor for Confidence();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *a1;
  a3(0);
  swift_allocObject();
  v13[1] = v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  v11 = TypedFeature.init(value:confidence:)();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a2, v6);
  return v11;
}

uint64_t FlowStateTypeSequence.init(value:confidence:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[2];

  v4 = type metadata accessor for Confidence();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v9[1] = a1;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v4);
  v7 = TypedFeature.init(value:confidence:)();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  return v7;
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to FlowStatusReasonSequence.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to FlowStateTypeSequence.__allocating_init(value:confidence:)(a1, a2, (void (*)(_QWORD))type metadata accessor for FlowStatusReasonSequence);
}

uint64_t FinalFlowTaskName.__deallocating_deinit()
{
  TypedFeature.deinit();
  return swift_deallocClassInstance();
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to FinalFlowTaskName.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to FinalFlowTaskName.__allocating_init(value:confidence:)(a1, a2, (void (*)(_QWORD))type metadata accessor for FinalFlowTaskName);
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to FinalFlowStateType.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to FinalFlowTaskName.__allocating_init(value:confidence:)(a1, a2, (void (*)(_QWORD))type metadata accessor for FinalFlowStateType);
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to FinalFlowTaskName.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2, void (*a3)(_QWORD))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[2];

  v6 = type metadata accessor for Confidence();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *a1;
  v11 = a1[1];
  a3(0);
  swift_allocObject();
  v14[0] = v10;
  v14[1] = v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  v12 = TypedFeature.init(value:confidence:)();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a2, v6);
  return v12;
}

uint64_t FinalFlowTaskName.init(value:confidence:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[2];

  v6 = type metadata accessor for Confidence();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v11[0] = a1;
  v11[1] = a2;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v6);
  v9 = TypedFeature.init(value:confidence:)();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a3, v6);
  return v9;
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to FinalFlowStatusReason.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to FinalFlowTaskName.__allocating_init(value:confidence:)(a1, a2, (void (*)(_QWORD))type metadata accessor for FinalFlowStatusReason);
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
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Int>);
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
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<FlowTaskStep>);
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
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Double?>);
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
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<GradedInteraction>);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 + 31;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 6);
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
        if (v10 != a4 || v13 >= &a4[8 * v8 + 4])
          memmove(v13, a4 + 4, v8 << 6);
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
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<[Int]>);
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
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UUID>);
  v10 = *(_QWORD *)(type metadata accessor for UUID() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(type metadata accessor for UUID() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(_QWORD *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

Swift::Int specialized MutableCollection<>.sort(by:)(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  Swift::Int result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = specialized _ContiguousArrayBuffer._consumeAndCreateNew()(v2);
  v3 = *(_QWORD *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  result = specialized UnsafeMutableBufferPointer._stableSortImpl(by:)(v5);
  *a1 = v2;
  return result;
}

uint64_t type metadata accessor for FlowStateTypeSequence(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for FlowStateTypeSequence);
}

uint64_t type metadata accessor for FinalFlowStateType(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for FinalFlowStateType);
}

uint64_t type metadata accessor for FlowTaskNameSequence(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for FlowTaskNameSequence);
}

uint64_t type metadata accessor for FinalFlowTaskName(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for FinalFlowTaskName);
}

uint64_t type metadata accessor for FlowStatusReasonSequence(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for FlowStatusReasonSequence);
}

uint64_t type metadata accessor for FinalFlowStatusReason(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for FinalFlowStatusReason);
}

uint64_t type metadata accessor for FlowStateTypeSequence(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t type metadata accessor for FlowClientFeatureExtractor()
{
  return objc_opt_self();
}

uint64_t type metadata completion function for FlowStateTypeSequence()
{
  return type metadata completion function for FlowStateTypeSequence();
}

{
  return swift_initClassMetadata2();
}

uint64_t ObjC metadata update function for FlowStateTypeSequence()
{
  return type metadata accessor for FlowStateTypeSequence(0);
}

uint64_t type metadata completion function for FlowTaskNameSequence()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for FlowTaskNameSequence()
{
  return type metadata accessor for FlowTaskNameSequence(0);
}

uint64_t type metadata completion function for FlowStatusReasonSequence()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for FlowStatusReasonSequence()
{
  return type metadata accessor for FlowStatusReasonSequence(0);
}

uint64_t type metadata completion function for FinalFlowTaskName()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for FinalFlowTaskName()
{
  return type metadata accessor for FinalFlowTaskName(0);
}

uint64_t type metadata completion function for FinalFlowStateType()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for FinalFlowStateType()
{
  return type metadata accessor for FinalFlowStateType(0);
}

uint64_t type metadata completion function for FinalFlowStatusReason()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for FinalFlowStatusReason()
{
  return type metadata accessor for FinalFlowStatusReason(0);
}

Swift::Int specialized UnsafeMutableBufferPointer._stableSortImpl(by:)(uint64_t *a1)
{
  uint64_t v1;
  Swift::Int v3;
  Swift::Int result;
  uint64_t v5;
  Swift::Int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Swift::Int v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  Swift::Int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  Swift::Int v23;
  Swift::Int v24;
  _OWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  Swift::Int v31;
  _QWORD *v32;
  uint64_t v33;
  Swift::Int v34;
  _QWORD *v35;
  _OWORD *v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  char *v43;
  char *v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  BOOL v56;
  unint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  BOOL v66;
  uint64_t v67;
  char v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  BOOL v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  char *v85;
  char *v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  unint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t i;
  uint64_t v95;
  uint64_t v96;
  _OWORD *v97;
  _QWORD *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  __int128 v102;
  char *v103;
  uint64_t v104;
  unint64_t v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  unint64_t v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  uint64_t v114;
  Swift::Int v115;
  Swift::Int v116;
  uint64_t v117;
  char *__dst;

  v3 = a1[1];
  result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_136;
    if ((unint64_t)v3 >= 2)
    {
      v92 = 0;
      v93 = *a1;
      for (i = 1; i != v3; ++i)
      {
        v95 = *(_QWORD *)(v93 + 32 * i);
        v96 = v92;
        do
        {
          v97 = (_OWORD *)(v93 + v96);
          if (v95 >= *(_QWORD *)(v93 + v96))
            break;
          if (!v93)
            goto LABEL_140;
          v98 = (_QWORD *)(v93 + v96);
          v99 = *(_QWORD *)(v93 + v96 + 40);
          v100 = *(_QWORD *)(v93 + v96 + 48);
          v101 = *(_QWORD *)(v93 + v96 + 56);
          v102 = v97[1];
          *(_OWORD *)(v93 + v96 + 32) = *v97;
          *(_OWORD *)(v93 + v96 + 48) = v102;
          *v98 = v95;
          v98[1] = v99;
          v98[2] = v100;
          v98[3] = v101;
          v96 -= 32;
        }
        while (v96 != -32);
        v92 += 32;
      }
    }
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_145;
  v6 = result;
  v112 = a1;
  if (v3 < 2)
  {
    v9 = MEMORY[0x24BEE4AF8];
    __dst = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v13 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v12 = (char *)MEMORY[0x24BEE4AF8];
LABEL_102:
      v103 = v12;
      v114 = v9;
      if (v13 >= 2)
      {
        v104 = *v112;
        do
        {
          v105 = v13 - 2;
          if (v13 < 2)
            goto LABEL_131;
          if (!v104)
            goto LABEL_144;
          v106 = v103;
          v107 = *(_QWORD *)&v103[16 * v105 + 32];
          v108 = *(_QWORD *)&v103[16 * v13 + 24];
          specialized _merge<A>(low:mid:high:buffer:by:)((char *)(v104 + 32 * v107), (char *)(v104 + 32 * *(_QWORD *)&v103[16 * v13 + 16]), v104 + 32 * v108, __dst);
          if (v1)
            break;
          if (v108 < v107)
            goto LABEL_132;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v106 = specialized _ArrayBuffer._consumeAndCreateNew()((uint64_t)v106);
          if (v105 >= *((_QWORD *)v106 + 2))
            goto LABEL_133;
          v109 = &v106[16 * v105 + 32];
          *(_QWORD *)v109 = v107;
          *((_QWORD *)v109 + 1) = v108;
          v110 = *((_QWORD *)v106 + 2);
          if (v13 > v110)
            goto LABEL_134;
          memmove(&v106[16 * v13 + 16], &v106[16 * v13 + 32], 16 * (v110 - v13));
          v103 = v106;
          *((_QWORD *)v106 + 2) = v110 - 1;
          v13 = v110 - 1;
        }
        while (v110 > 2);
      }
LABEL_93:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v114 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v114 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v7 = v5 >> 1;
    v8 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(_QWORD *)(v8 + 16) = v7;
    v114 = v8;
    __dst = (char *)(v8 + 32);
  }
  v10 = 0;
  v11 = *a1;
  v113 = *a1 + 64;
  v111 = *a1 + 24;
  v12 = (char *)MEMORY[0x24BEE4AF8];
  v115 = v6;
  v116 = v3;
  v117 = v11;
  while (1)
  {
    v14 = v10++;
    if (v10 < v3)
    {
      v15 = *(_QWORD *)(v11 + 32 * v10);
      v16 = 32 * v14;
      v17 = *(_QWORD *)(v11 + 32 * v14);
      v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        v18 = (uint64_t *)(v113 + 32 * v14);
        v19 = v15;
        while (1)
        {
          v21 = *v18;
          v18 += 4;
          v20 = v21;
          if (v15 < v17 == v21 >= v19)
            break;
          ++v10;
          v19 = v20;
          if (v3 == v10)
          {
            v10 = v3;
            break;
          }
        }
      }
      if (v15 < v17)
      {
        if (v10 < v14)
          goto LABEL_137;
        if (v14 < v10)
        {
          v22 = 32 * v10;
          v23 = v10;
          v24 = v14;
          do
          {
            if (v24 != --v23)
            {
              if (!v11)
                goto LABEL_143;
              v25 = (_OWORD *)(v11 + v16);
              v26 = v11 + v22;
              v27 = *(_QWORD *)(v11 + v16 + 16);
              v28 = *(_QWORD *)(v11 + v16 + 24);
              v29 = *(_OWORD *)(v11 + v16);
              v30 = *(_OWORD *)(v11 + v22 - 16);
              *v25 = *(_OWORD *)(v11 + v22 - 32);
              v25[1] = v30;
              *(_OWORD *)(v26 - 32) = v29;
              *(_QWORD *)(v26 - 16) = v27;
              *(_QWORD *)(v26 - 8) = v28;
            }
            ++v24;
            v22 -= 32;
            v16 += 32;
          }
          while (v24 < v23);
        }
      }
    }
    if (v10 >= v3)
      goto LABEL_46;
    if (__OFSUB__(v10, v14))
      goto LABEL_135;
    if (v10 - v14 >= v6)
      goto LABEL_46;
    v31 = v14 + v6;
    if (__OFADD__(v14, v6))
      goto LABEL_138;
    if (v31 >= v3)
      v31 = v3;
    if (v31 < v14)
      break;
    if (v10 != v31)
    {
      v32 = (_QWORD *)(v111 + 32 * v10);
      do
      {
        v33 = *(_QWORD *)(v11 + 32 * v10);
        v34 = v14;
        v35 = v32;
        do
        {
          if (v33 >= *(v35 - 7))
            break;
          if (!v11)
            goto LABEL_141;
          v36 = v35 - 3;
          v38 = *(_OWORD *)(v35 - 7);
          v37 = *(_OWORD *)(v35 - 5);
          *(v35 - 4) = *v35;
          v35 -= 4;
          v39 = v35[2];
          v40 = v35[3];
          *v36 = v38;
          v36[1] = v37;
          *(v35 - 3) = v33;
          *(v35 - 2) = v39;
          *(v35 - 1) = v40;
          ++v34;
        }
        while (v10 != v34);
        ++v10;
        v32 += 4;
      }
      while (v10 != v31);
      v10 = v31;
    }
LABEL_46:
    if (v10 < v14)
      goto LABEL_130;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v12 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v12 + 2) + 1, 1, v12);
    v42 = *((_QWORD *)v12 + 2);
    v41 = *((_QWORD *)v12 + 3);
    v13 = v42 + 1;
    v11 = v117;
    if (v42 >= v41 >> 1)
    {
      v91 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v41 > 1), v42 + 1, 1, v12);
      v11 = v117;
      v12 = v91;
    }
    *((_QWORD *)v12 + 2) = v13;
    v43 = v12 + 32;
    v44 = &v12[16 * v42 + 32];
    *(_QWORD *)v44 = v14;
    *((_QWORD *)v44 + 1) = v10;
    if (v42)
    {
      while (1)
      {
        v45 = v13 - 1;
        if (v13 >= 4)
        {
          v50 = &v43[16 * v13];
          v51 = *((_QWORD *)v50 - 8);
          v52 = *((_QWORD *)v50 - 7);
          v56 = __OFSUB__(v52, v51);
          v53 = v52 - v51;
          if (v56)
            goto LABEL_119;
          v55 = *((_QWORD *)v50 - 6);
          v54 = *((_QWORD *)v50 - 5);
          v56 = __OFSUB__(v54, v55);
          v48 = v54 - v55;
          v49 = v56;
          if (v56)
            goto LABEL_120;
          v57 = v13 - 2;
          v58 = &v43[16 * v13 - 32];
          v60 = *(_QWORD *)v58;
          v59 = *((_QWORD *)v58 + 1);
          v56 = __OFSUB__(v59, v60);
          v61 = v59 - v60;
          if (v56)
            goto LABEL_122;
          v56 = __OFADD__(v48, v61);
          v62 = v48 + v61;
          if (v56)
            goto LABEL_125;
          if (v62 >= v53)
          {
            v80 = &v43[16 * v45];
            v82 = *(_QWORD *)v80;
            v81 = *((_QWORD *)v80 + 1);
            v56 = __OFSUB__(v81, v82);
            v83 = v81 - v82;
            if (v56)
              goto LABEL_129;
            v73 = v48 < v83;
            goto LABEL_83;
          }
        }
        else
        {
          if (v13 != 3)
          {
            v74 = *((_QWORD *)v12 + 4);
            v75 = *((_QWORD *)v12 + 5);
            v56 = __OFSUB__(v75, v74);
            v67 = v75 - v74;
            v68 = v56;
            goto LABEL_77;
          }
          v47 = *((_QWORD *)v12 + 4);
          v46 = *((_QWORD *)v12 + 5);
          v56 = __OFSUB__(v46, v47);
          v48 = v46 - v47;
          v49 = v56;
        }
        if ((v49 & 1) != 0)
          goto LABEL_121;
        v57 = v13 - 2;
        v63 = &v43[16 * v13 - 32];
        v65 = *(_QWORD *)v63;
        v64 = *((_QWORD *)v63 + 1);
        v66 = __OFSUB__(v64, v65);
        v67 = v64 - v65;
        v68 = v66;
        if (v66)
          goto LABEL_124;
        v69 = &v43[16 * v45];
        v71 = *(_QWORD *)v69;
        v70 = *((_QWORD *)v69 + 1);
        v56 = __OFSUB__(v70, v71);
        v72 = v70 - v71;
        if (v56)
          goto LABEL_127;
        if (__OFADD__(v67, v72))
          goto LABEL_128;
        if (v67 + v72 >= v48)
        {
          v73 = v48 < v72;
LABEL_83:
          if (v73)
            v45 = v57;
          goto LABEL_85;
        }
LABEL_77:
        if ((v68 & 1) != 0)
          goto LABEL_123;
        v76 = &v43[16 * v45];
        v78 = *(_QWORD *)v76;
        v77 = *((_QWORD *)v76 + 1);
        v56 = __OFSUB__(v77, v78);
        v79 = v77 - v78;
        if (v56)
          goto LABEL_126;
        if (v79 < v67)
          goto LABEL_15;
LABEL_85:
        v84 = v45 - 1;
        if (v45 - 1 >= v13)
        {
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
          goto LABEL_139;
        }
        if (!v11)
          goto LABEL_142;
        v85 = v12;
        v86 = &v43[16 * v84];
        v87 = *(_QWORD *)v86;
        v88 = &v43[16 * v45];
        v89 = *((_QWORD *)v88 + 1);
        specialized _merge<A>(low:mid:high:buffer:by:)((char *)(v11 + 32 * *(_QWORD *)v86), (char *)(v11 + 32 * *(_QWORD *)v88), v11 + 32 * v89, __dst);
        if (v1)
          goto LABEL_93;
        if (v89 < v87)
          goto LABEL_116;
        if (v45 > *((_QWORD *)v85 + 2))
          goto LABEL_117;
        *(_QWORD *)v86 = v87;
        *(_QWORD *)&v43[16 * v84 + 8] = v89;
        v90 = *((_QWORD *)v85 + 2);
        if (v45 >= v90)
          goto LABEL_118;
        v12 = v85;
        v13 = v90 - 1;
        memmove(&v43[16 * v45], v88 + 16, 16 * (v90 - 1 - v45));
        *((_QWORD *)v85 + 2) = v90 - 1;
        v11 = v117;
        if (v90 <= 2)
          goto LABEL_15;
      }
    }
    v13 = 1;
LABEL_15:
    v6 = v115;
    v3 = v116;
    if (v10 >= v116)
    {
      v9 = v114;
      goto LABEL_102;
    }
  }
LABEL_139:
  __break(1u);
LABEL_140:
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized _merge<A>(low:mid:high:buffer:by:)(char *__src, char *a2, unint64_t a3, char *__dst)
{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  __int128 v16;
  __int128 v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t result;
  char *v26;
  char *v27;
  char *v28;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = a2 - __src;
  v9 = a2 - __src + 31;
  if (a2 - __src >= 0)
    v9 = a2 - __src;
  v10 = v9 >> 5;
  v11 = a3 - (_QWORD)a2;
  v12 = a3 - (_QWORD)a2 + 31;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v12 = a3 - (_QWORD)a2;
  v13 = v12 >> 5;
  v28 = __src;
  v27 = __dst;
  if (v10 >= v12 >> 5)
  {
    if (v11 >= -31)
    {
      if (__dst != a2 || &a2[32 * v13] <= __dst)
        memmove(__dst, a2, 32 * v13);
      v18 = &v4[32 * v13];
      v26 = v18;
      v28 = v6;
      if (v7 < v6 && v11 >= 32)
      {
        v19 = (char *)(a3 - 32);
        v20 = v6;
        while (1)
        {
          v21 = v19 + 32;
          v22 = *((_QWORD *)v20 - 4);
          v20 -= 32;
          if (*((_QWORD *)v18 - 4) >= v22)
          {
            v26 = v18 - 32;
            if (v21 < v18 || v19 >= v18 || v21 != v18)
            {
              v24 = *((_OWORD *)v18 - 1);
              *(_OWORD *)v19 = *((_OWORD *)v18 - 2);
              *((_OWORD *)v19 + 1) = v24;
            }
            v20 = v6;
            v18 -= 32;
            if (v6 <= v7)
              goto LABEL_42;
          }
          else
          {
            if (v21 != v6 || v19 >= v6)
            {
              v23 = *((_OWORD *)v20 + 1);
              *(_OWORD *)v19 = *(_OWORD *)v20;
              *((_OWORD *)v19 + 1) = v23;
            }
            v28 = v20;
            if (v20 <= v7)
              goto LABEL_42;
          }
          v19 -= 32;
          v6 = v20;
          if (v18 <= v4)
            goto LABEL_42;
        }
      }
      goto LABEL_42;
    }
  }
  else if (v8 >= -31)
  {
    if (__dst != __src || &__src[32 * v10] <= __dst)
      memmove(__dst, __src, 32 * v10);
    v14 = &v4[32 * v10];
    v26 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 32)
    {
      do
      {
        if (*(_QWORD *)v6 >= *(_QWORD *)v4)
        {
          if (v7 != v4)
          {
            v17 = *((_OWORD *)v4 + 1);
            *(_OWORD *)v7 = *(_OWORD *)v4;
            *((_OWORD *)v7 + 1) = v17;
          }
          v4 += 32;
          v27 = v4;
          v15 = v6;
        }
        else
        {
          v15 = v6 + 32;
          if (v7 < v6 || v7 >= v15 || v7 != v6)
          {
            v16 = *((_OWORD *)v6 + 1);
            *(_OWORD *)v7 = *(_OWORD *)v6;
            *((_OWORD *)v7 + 1) = v16;
          }
        }
        v7 += 32;
        if (v4 >= v14)
          break;
        v6 = v15;
      }
      while ((unint64_t)v15 < a3);
      v28 = v7;
    }
LABEL_42:
    specialized $defer #1 <A>() in _merge<A>(low:mid:high:buffer:by:)((void **)&v28, (const void **)&v27, &v26);
    return 1;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Range<Int>>);
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

char *specialized $defer #1 <A>() in _merge<A>(low:mid:high:buffer:by:)(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 31;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -32)
  {
    result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 5;
    if (result != v3 || result >= &v3[32 * v7])
      return (char *)memmove(result, v3, 32 * v7);
  }
  return result;
}

char *specialized _ArrayBuffer._consumeAndCreateNew()(uint64_t a1)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew()(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
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
    v5 = (char *)(a4 + 16 * a1 + 32);
    v6 = 16 * v4;
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
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
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
    v5 = a4 + (a1 << 6) + 32;
    v6 = a3 + (v4 << 6);
    if (v5 >= v6 || v5 + (v4 << 6) <= a3)
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
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(type metadata accessor for UUID() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
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
    v5 = a4 + 8 * a1 + 32;
    v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int]);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for FlowTaskStep(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for FlowTaskStep()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for FlowTaskStep(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for FlowTaskStep(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
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

uint64_t assignWithTake for FlowTaskStep(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for FlowTaskStep(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for FlowTaskStep(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for FlowTaskStep()
{
  return &type metadata for FlowTaskStep;
}

Swift::Double __swiftcall Double.truncate(places:)(Swift::Int places)
{
  double v1;
  double v2;
  double v3;

  v2 = v1;
  v3 = __exp10((double)places);
  return floor(v3 * v2) / v3;
}

id InferredHelpfulnessClassifier.model.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

void *InferredHelpfulnessClassifier.targetName.unsafeMutableAddressor()
{
  return &static InferredHelpfulnessClassifier.targetName;
}

unint64_t static InferredHelpfulnessClassifier.targetName.getter()
{
  return 0xD00000000000001ELL;
}

uint64_t InferredHelpfulnessClassifier.IHScoreSignificantFigures.getter()
{
  return 3;
}

uint64_t static InferredHelpfulnessClassifier.urlOfModelInThisBundle.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t ObjCClassFromMetadata;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t result;
  uint64_t v16;

  v2 = type metadata accessor for URL();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v10 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v11 = (void *)MEMORY[0x2207D4DFC](0xD00000000000001DLL, 0x800000021FE0D230);
  v12 = (void *)MEMORY[0x2207D4DFC](0x636C65646F6D6C6DLL, 0xE800000000000000);
  v13 = objc_msgSend(v10, sel_URLForResource_withExtension_, v11, v12);

  if (v13)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    v14 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
    v14(v8, v5, v2);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v3 + 56))(v8, 0, 1, v2);
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2);
    if ((_DWORD)result != 1)
    {

      return ((uint64_t (*)(uint64_t, char *, uint64_t))v14)(a1, v8, v2);
    }
  }
  else
  {
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v8, 1, 1, v2);
  }
  __break(1u);
  return result;
}

uint64_t InferredHelpfulnessClassifier.__allocating_init(model:)(uint64_t a1)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  *(_QWORD *)(result + 24) = 3;
  return result;
}

uint64_t InferredHelpfulnessClassifier.init(model:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  *(_QWORD *)(v1 + 24) = 3;
  return v1;
}

unint64_t InferredHelpfulnessClassifier.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  id v12;
  _QWORD v14[2];

  v2 = v0;
  v3 = type metadata accessor for URL();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)v14 - v9;
  (*(void (**)(uint64_t))(v0 + 96))(v8);
  v11 = type metadata accessor for MLModel();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v10, v3);
  v12 = @nonobjc MLModel.__allocating_init(contentsOf:)((uint64_t)v7);
  if (!v1)
    v11 = (*(uint64_t (**)(id))(v2 + 104))(v12);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v10, v3);
  return v11;
}

uint64_t InferredHelpfulnessClassifier.__allocating_init(contentsOf:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v14;

  v3 = v1;
  v5 = type metadata accessor for URL();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for MLModel();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  v10 = (uint64_t)v8;
  v11 = v9;
  v12 = @nonobjc MLModel.__allocating_init(contentsOf:)(v10);
  if (!v2)
    v11 = (*(uint64_t (**)(id))(v3 + 104))(v12);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
  return v11;
}

unint64_t type metadata accessor for MLModel()
{
  unint64_t result;

  result = lazy cache variable for type metadata for MLModel;
  if (!lazy cache variable for type metadata for MLModel)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for MLModel);
  }
  return result;
}

unint64_t InferredHelpfulnessClassifier.__allocating_init(configuration:)(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  id v14;
  id v15;
  id v16;
  uint64_t v18;

  v3 = v1;
  v5 = type metadata accessor for URL();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v18 - v11;
  (*(void (**)(uint64_t))(v1 + 96))(v10);
  v13 = type metadata accessor for MLModel();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v12, v5);
  v14 = a1;
  v15 = specialized @nonobjc MLModel.__allocating_init(contentsOf:configuration:)((uint64_t)v9, (uint64_t)v14);
  if (v2)
  {

  }
  else
  {
    v16 = v15;

    v13 = (*(uint64_t (**)(id))(v3 + 104))(v16);
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v12, v5);
  return v13;
}

uint64_t InferredHelpfulnessClassifier.__allocating_init(contentsOf:configuration:)(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v16;

  v4 = v2;
  v7 = type metadata accessor for URL();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for MLModel();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  v12 = (uint64_t)v10;
  v13 = v11;
  v14 = specialized @nonobjc MLModel.__allocating_init(contentsOf:configuration:)(v12, (uint64_t)a2);
  if (!v3)
    v13 = (*(uint64_t (**)(id))(v4 + 104))(v14);

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a1, v7);
  return v13;
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

uint64_t static InferredHelpfulnessClassifier.load(configuration:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v13;

  v7 = type metadata accessor for URL();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t))(v3 + 96))(v9);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 120))(v11, a1, a2, a3);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

void static InferredHelpfulnessClassifier.load(contentsOf:configuration:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  NSURL *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[6];

  v7 = (void *)objc_opt_self();
  URL._bridgeToObjectiveC()(v8);
  v10 = v9;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a3;
  *(_QWORD *)(v11 + 24) = a4;
  v13[4] = partial apply for closure #1 in static InferredHelpfulnessClassifier.load(contentsOf:configuration:completionHandler:);
  v13[5] = v11;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 1107296256;
  v13[2] = thunk for @escaping @callee_guaranteed (@guaranteed MLModel?, @guaranteed Error?) -> ();
  v13[3] = &block_descriptor;
  v12 = _Block_copy(v13);
  swift_retain();
  swift_release();
  objc_msgSend(v7, sel_loadContentsOfURL_configuration_completionHandler_, v10, a2, v12);
  _Block_release(v12);

}

void closure #1 in static InferredHelpfulnessClassifier.load(contentsOf:configuration:completionHandler:)(void *a1, id a2, void (*a3)(id, uint64_t))
{
  id v5;
  uint64_t v7;
  id v8;

  if (a2)
  {
    v5 = a2;
    a3(a2, 1);

  }
  else if (a1)
  {
    type metadata accessor for InferredHelpfulnessClassifier();
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = a1;
    *(_QWORD *)(v7 + 24) = 3;
    v8 = a1;
    a3((id)v7, 0);
    swift_release();
  }
  else
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
}

void thunk for @escaping @callee_guaranteed (@guaranteed MLModel?, @guaranteed Error?) -> ()(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(void *, void *);
  id v6;
  id v7;

  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

Swift::Double_optional __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> InferredHelpfulnessClassifier.predict(using:)(Swift::OpaquePointer using)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  char v5;
  Swift::Bool v6;
  double v7;
  Swift::Bool v8;
  Swift::Double_optional result;

  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC0018]), sel_init);
  v5 = (*(uint64_t (**)(void *, id))(*(_QWORD *)v1 + 136))(using._rawValue, v4);

  if (v2)
    v8 = v6;
  else
    v8 = v5;
  result.value = v7;
  result.is_nil = v8;
  return result;
}

Swift::Double_optional __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> InferredHelpfulnessClassifier.predict(using:options:)(Swift::OpaquePointer using, MLPredictionOptions options)
{
  uint64_t v2;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  double v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  id v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  id v29[2];
  Swift::Double_optional result;

  v29[1] = *(id *)MEMORY[0x24BDAC8D0];
  type metadata accessor for FeatureProvider();
  swift_allocObject();
  swift_bridgeObjectRetain();
  v4 = FeatureProvider.init(features:targetName:)();
  v5 = *(void **)(v2 + 16);
  v29[0] = 0;
  v6 = objc_msgSend(v5, sel_predictionFromFeatures_options_error_, v4, options.super.isa, v29);
  if (v6)
  {
    v7 = v6;
    v8 = v29[0];
    swift_unknownObjectRetain();
    v9 = (void *)MEMORY[0x2207D4DFC](0xD00000000000001ELL, 0x800000021FE10C20);
    v10 = objc_msgSend(v7, sel_featureValueForName_, v9);

    if (v10)
    {
      v11 = objc_msgSend(v10, sel_multiArrayValue);
      if (!v11)
      {
        __break(1u);
        goto LABEL_18;
      }
      v13 = v11;
      v14 = objc_msgSend(v11, sel_objectAtIndexedSubscript_, 0);

      objc_msgSend(v14, sel_doubleValue);
      v16 = v15;

      v17 = floor(v16 * 1000.0) / 1000.0;
      v18 = v17;
      if (one-time initialization token for defaultLogger != -1)
        swift_once();
      v19 = type metadata accessor for Logger();
      __swift_project_value_buffer(v19, (uint64_t)defaultLogger);
      v20 = Logger.logObject.getter();
      v21 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v20, v21))
      {
        v22 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v22 = 134217984;
        v29[0] = *(id *)&v17;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl(&dword_21FDE7000, v20, v21, "PredictionResults value: %f", v22, 0xCu);
        MEMORY[0x2207D560C](v22, -1, -1);
        swift_release();

        swift_unknownObjectRelease_n();
      }
      else
      {

        swift_unknownObjectRelease_n();
        swift_release();
      }
    }
    else
    {
      swift_unknownObjectRelease_n();
      swift_release();
      LOBYTE(v18) = 0;
    }
  }
  else
  {
    v23 = v29[0];
    v24 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
    if (one-time initialization token for defaultLogger != -1)
      swift_once();
    v25 = type metadata accessor for Logger();
    __swift_project_value_buffer(v25, (uint64_t)defaultLogger);
    v26 = Logger.logObject.getter();
    v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_21FDE7000, v26, v27, "Prediction results are nil, no IH score generated", v28, 2u);
      MEMORY[0x2207D560C](v28, -1, -1);
      swift_release();

    }
    else
    {

      swift_release();
    }
    LOBYTE(v18) = 0;
  }
  LOBYTE(v11) = LOBYTE(v18);
LABEL_18:
  result.value = v12;
  result.is_nil = (char)v11;
  return result;
}

_QWORD *InferredHelpfulnessClassifier.predictAll(using:options:)(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  int64_t v5;
  unint64_t v6;
  const char *v7;
  uint64_t v10;
  int64_t v11;
  id v12;
  Class isa;
  id v14;
  void *v15;
  _QWORD *v16;
  id v17;
  int64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  id v31[2];

  v3 = v2;
  v4 = a2;
  v31[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 + 16);
  v6 = MEMORY[0x24BEE4AF8];
  v7 = "inferredHelpfulnessProbability";
  if (v5)
  {
    v31[0] = (id)MEMORY[0x24BEE4AF8];
    specialized ContiguousArray.reserveCapacity(_:)();
    v10 = a1 + 32;
    type metadata accessor for FeatureProvider();
    v11 = v5;
    do
    {
      v10 += 8;
      swift_allocObject();
      swift_bridgeObjectRetain();
      FeatureProvider.init(features:targetName:)();
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      --v11;
    }
    while (v11);
    v6 = (unint64_t)v31[0];
    v7 = "inferredHelpfulnessProbability";
    v4 = a2;
    v3 = v2;
  }
  if (v6 >> 62)
    goto LABEL_22;
  swift_bridgeObjectRetain();
  dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
  while (1)
  {
    swift_bridgeObjectRelease();
    v12 = objc_allocWithZone(MEMORY[0x24BDBFF60]);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MLFeatureProvider);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v14 = objc_msgSend(v12, sel_initWithFeatureProviderArray_, isa);

    v15 = (void *)v3[2];
    v31[0] = 0;
    v16 = objc_msgSend(v15, sel_predictionsFromBatch_options_error_, v14, v4, v31);
    if (!v16)
    {
      v4 = v31[0];
      _convertNSErrorToError(_:)();

      swift_willThrow();
      return v4;
    }
    v3 = v16;
    v17 = v31[0];
    v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v5, 0, MEMORY[0x24BEE4AF8]);
    v18 = (int64_t)objc_msgSend(v3, sel_count);
    if (v18 < 0)
    {
      __break(1u);
LABEL_24:
      __break(1u);
LABEL_25:
      __break(1u);
    }
    v5 = v18;
    if (!v18)
      break;
    v19 = 0;
    v7 = (const char *)((unint64_t)(v7 - 32) | 0x8000000000000000);
    while (v5 != v19)
    {
      v20 = objc_msgSend(v3, sel_featuresAtIndex_, v19);
      v21 = (void *)MEMORY[0x2207D4DFC](0xD00000000000001ELL, v7);
      v22 = objc_msgSend(v20, sel_featureValueForName_, v21);

      if (!v22)
        goto LABEL_24;
      v23 = objc_msgSend(v22, sel_multiArrayValue);

      if (!v23)
        goto LABEL_25;
      v24 = objc_msgSend(v23, sel_objectAtIndexedSubscript_, 0);

      objc_msgSend(v24, sel_doubleValue);
      v26 = v25;

      v28 = v4[2];
      v27 = v4[3];
      if (v28 >= v27 >> 1)
        v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v27 > 1), v28 + 1, 1, v4);
      ++v19;
      v4[2] = v28 + 1;
      v29 = &v4[2 * v28];
      v29[4] = v26;
      *((_BYTE *)v29 + 40) = 0;
      swift_unknownObjectRelease();
      if (v5 == v19)
        goto LABEL_19;
    }
    __break(1u);
LABEL_22:
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for MLFeatureProvider);
    _bridgeCocoaArray<A>(_:)();
    swift_bridgeObjectRelease();
  }
LABEL_19:
  swift_unknownObjectRelease();

  return v4;
}

uint64_t InferredHelpfulnessClassifier.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t InferredHelpfulnessClassifier.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
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

uint64_t sub_21FDF233C()
{
  swift_release();
  return swift_deallocObject();
}

void partial apply for closure #1 in static InferredHelpfulnessClassifier.load(contentsOf:configuration:completionHandler:)(void *a1, void *a2)
{
  uint64_t v2;

  closure #1 in static InferredHelpfulnessClassifier.load(contentsOf:configuration:completionHandler:)(a1, a2, *(void (**)(id, uint64_t))(v2 + 16));
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

uint64_t type metadata accessor for InferredHelpfulnessClassifier()
{
  return objc_opt_self();
}

uint64_t method lookup function for InferredHelpfulnessClassifier()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static InferredHelpfulnessClassifier.urlOfModelInThisBundle.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of InferredHelpfulnessClassifier.__allocating_init(model:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of static InferredHelpfulnessClassifier.load(configuration:completionHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of static InferredHelpfulnessClassifier.load(contentsOf:configuration:completionHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of InferredHelpfulnessClassifier.predict(using:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of InferredHelpfulnessClassifier.predict(using:options:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of InferredHelpfulnessClassifier.predictAll(using:options:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t specialized Sequence.compactMap<A>(_:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v0 = MEMORY[0x24BEE4AF8];
  v5 = MEMORY[0x24BEE4AF8];
  swift_retain();
  swift_retain();
  dispatch thunk of _AnySequenceBox._makeIterator()();
  swift_release();
  dispatch thunk of _AnyIteratorBoxBase.next()();
  if (v4)
  {
    while (1)
    {
      v1 = specialized InferredHelpfulnessInference.generateIntraTurnFeature(_:)();
      v2 = swift_release();
      if (v1)
      {
        MEMORY[0x2207D4EB0](v2);
        if (*(_QWORD *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
      dispatch thunk of _AnyIteratorBoxBase.next()();
    }
  }
  swift_release_n();
  swift_release();
  return v0;
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay23SiriInferredHelpfulness12FeaturedTurnCG_AHs5NeverOTg5(void (*a1)(uint64_t *__return_ptr, uint64_t *), uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a3 >> 62)
    goto LABEL_16;
  v6 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    result = MEMORY[0x24BEE4AF8];
    if (!v6)
      break;
    v12 = MEMORY[0x24BEE4AF8];
    result = specialized ContiguousArray.reserveCapacity(_:)();
    if (v6 < 0)
    {
      __break(1u);
      return result;
    }
    v8 = 0;
    while (v6 != v8)
    {
      if ((a3 & 0xC000000000000001) != 0)
      {
        v9 = MEMORY[0x2207D5048](v8, a3);
      }
      else
      {
        v9 = *(_QWORD *)(a3 + 8 * v8 + 32);
        swift_retain();
      }
      v10 = v9;
      a1(&v11, &v10);
      swift_release();
      if (v3)
        return swift_release();
      ++v8;
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      if (v6 == v8)
        return v12;
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    v6 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t InferredHelpfulnessInference.classifier.getter()
{
  swift_beginAccess();
  return swift_retain();
}

uint64_t InferredHelpfulnessInference.classifier.setter(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 16) = a1;
  return swift_release();
}

uint64_t (*InferredHelpfulnessInference.classifier.modify())()
{
  swift_beginAccess();
  return InferredHelpfulnessInference.classifier.modify;
}

uint64_t InferredHelpfulnessInference.modelVersionString.getter()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InferredHelpfulnessInference.modelVersionString.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*InferredHelpfulnessInference.modelVersionString.modify())()
{
  swift_beginAccess();
  return InferredHelpfulnessInference.modelVersionString.modify;
}

uint64_t InferredHelpfulnessInference.emitSelfLogs.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 40);
}

uint64_t InferredHelpfulnessInference.emitSelfLogs.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_BYTE *)(v1 + 40) = a1;
  return result;
}

uint64_t (*InferredHelpfulnessInference.emitSelfLogs.modify())()
{
  swift_beginAccess();
  return InferredHelpfulnessInference.modelVersionString.modify;
}

uint64_t InferredHelpfulnessInference.streamBookmarkName.getter()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InferredHelpfulnessInference.streamBookmarkName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*InferredHelpfulnessInference.streamBookmarkName.modify())()
{
  swift_beginAccess();
  return InferredHelpfulnessInference.modelVersionString.modify;
}

uint64_t InferredHelpfulnessInference.failEval.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned int *)(v0 + 64);
}

uint64_t InferredHelpfulnessInference.failEval.setter(int a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_DWORD *)(v1 + 64) = a1;
  return result;
}

uint64_t (*InferredHelpfulnessInference.failEval.modify())()
{
  swift_beginAccess();
  return InferredHelpfulnessInference.modelVersionString.modify;
}

uint64_t InferredHelpfulnessInference.nullModelVersion.getter()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 72);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InferredHelpfulnessInference.nullModelVersion.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 72) = a1;
  *(_QWORD *)(v2 + 80) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*InferredHelpfulnessInference.nullModelVersion.modify())()
{
  swift_beginAccess();
  return InferredHelpfulnessInference.modelVersionString.modify;
}

double InferredHelpfulnessInference.failIHScore.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return *(double *)(v0 + 88);
}

uint64_t InferredHelpfulnessInference.failIHScore.setter(double a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(double *)(v1 + 88) = a1;
  return result;
}

uint64_t (*InferredHelpfulnessInference.failIHScore.modify())()
{
  swift_beginAccess();
  return InferredHelpfulnessInference.modelVersionString.modify;
}

uint64_t InferredHelpfulnessInference.__allocating_init(streamBookmarkName:emitSelfLogs:trialProvider:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v8;

  v8 = swift_allocObject();
  InferredHelpfulnessInference.init(streamBookmarkName:emitSelfLogs:trialProvider:)(a1, a2, a3, a4);
  return v8;
}

uint64_t InferredHelpfulnessInference.init(streamBookmarkName:emitSelfLogs:trialProvider:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t *v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v6 = v4;
  *(_QWORD *)(v6 + 16) = 0;
  v10 = (unint64_t *)(v6 + 16);
  *(_QWORD *)(v6 + 48) = 0xD000000000000011;
  v11 = v6 + 48;
  *(_QWORD *)(v6 + 56) = 0x800000021FE0DFB0;
  *(_DWORD *)(v6 + 64) = 1;
  *(_QWORD *)(v6 + 72) = 0;
  *(_QWORD *)(v6 + 80) = 0xE000000000000000;
  *(_QWORD *)(v6 + 88) = 0xBFF0000000000000;
  if (a2)
  {
    swift_beginAccess();
    *(_QWORD *)(v6 + 48) = a1;
    *(_QWORD *)(v6 + 56) = a2;
    v11 = swift_bridgeObjectRelease();
  }
  *(_BYTE *)(v6 + 40) = a3 & 1;
  v13 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a4 + 216))(v11);
  if (v5)
  {
    if (one-time initialization token for defaultLogger != -1)
      swift_once();
    v14 = type metadata accessor for Logger();
    __swift_project_value_buffer(v14, (uint64_t)defaultLogger);
    v15 = Logger.logObject.getter();
    v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_21FDE7000, v15, v16, "Unable to load model from Trial Assets", v17, 2u);
      MEMORY[0x2207D560C](v17, -1, -1);
    }

  }
  else
  {
    v18 = v13;
    swift_beginAccess();
    *v10 = v18;
    swift_release();
  }
  swift_beginAccess();
  v19 = *v10;
  if (!*v10)
  {
    if (one-time initialization token for defaultLogger != -1)
      swift_once();
    v26 = type metadata accessor for Logger();
    __swift_project_value_buffer(v26, (uint64_t)defaultLogger);
    v27 = Logger.logObject.getter();
    v28 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_21FDE7000, v27, v28, "Loading model from Bundle", v29, 2u);
      MEMORY[0x2207D560C](v29, -1, -1);
    }

    type metadata accessor for InferredHelpfulnessClassifier();
    *v10 = InferredHelpfulnessClassifier.__allocating_init()();
    swift_release();
    v19 = *v10;
    if (!*v10)
    {
      v34 = 0u;
      v35 = 0u;
LABEL_26:
      swift_beginAccess();
      v31 = *(_QWORD *)(v6 + 72);
      v30 = *(_QWORD *)(v6 + 80);
      v37 = MEMORY[0x24BEE0D00];
      *(_QWORD *)&v36 = v31;
      *((_QWORD *)&v36 + 1) = v30;
      swift_bridgeObjectRetain();
      outlined destroy of Any?((uint64_t)&v34, &demangling cache variable for type metadata for Any?);
      goto LABEL_27;
    }
  }
  v20 = objc_msgSend(*(id *)(v19 + 16), sel_modelDescription);
  v21 = objc_msgSend(v20, sel_metadata);

  type metadata accessor for MLModelMetadataKey(0);
  lazy protocol witness table accessor for type MLModelMetadataKey and conformance MLModelMetadataKey(&lazy protocol witness table cache variable for type MLModelMetadataKey and conformance MLModelMetadataKey, (uint64_t (*)(uint64_t))type metadata accessor for MLModelMetadataKey, (uint64_t)&protocol conformance descriptor for MLModelMetadataKey);
  v22 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  if (*(_QWORD *)(v22 + 16))
  {
    v23 = (id)*MEMORY[0x24BDBFF50];
    v24 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v23);
    if ((v25 & 1) != 0)
    {
      outlined init with copy of Any(*(_QWORD *)(v22 + 56) + 32 * v24, (uint64_t)&v34);
    }
    else
    {
      v34 = 0u;
      v35 = 0u;
    }

  }
  else
  {
    v34 = 0u;
    v35 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v35 + 1))
    goto LABEL_26;
  outlined init with take of Any(&v34, &v36);
LABEL_27:
  *(_QWORD *)&v34 = 0;
  *((_QWORD *)&v34 + 1) = 0xE000000000000000;
  _print_unlocked<A, B>(_:_:)();
  swift_release();
  v32 = v34;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v36);
  *(_OWORD *)(v6 + 24) = v32;
  return v6;
}

uint64_t one-time initialization function for selfFeatureExtractors()
{
  uint64_t result;

  result = closure #1 in variable initialization expression of static InferredHelpfulnessInference.selfFeatureExtractors();
  static InferredHelpfulnessInference.selfFeatureExtractors = result;
  return result;
}

uint64_t closure #1 in variable initialization expression of static InferredHelpfulnessInference.selfFeatureExtractors()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjCClassFromMetadata;
  void *v3;
  id v4;
  uint64_t v5;
  unint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_21FE0D2C0;
  type metadata accessor for UEIFeatureExtractor();
  v1 = swift_allocObject();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = (void *)objc_opt_self();
  swift_retain();
  v4 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata);
  if (one-time initialization token for shared != -1)
    swift_once();
  v5 = static TrialProvider.shared;
  swift_retain();
  v6 = specialized static CATUtils.catIdToSpeakeasyCategory(bundle:trialProvider:)(v4, v5);

  swift_release();
  *(_QWORD *)(v1 + 16) = v6;
  swift_release();
  *(_QWORD *)(v0 + 32) = v1;
  type metadata accessor for ASRFeatureExtractor();
  *(_QWORD *)(v0 + 40) = swift_allocObject();
  type metadata accessor for FlowClientFeatureExtractor();
  *(_QWORD *)(v0 + 48) = swift_allocObject();
  specialized Array._endMutation()();
  return v0;
}

uint64_t *InferredHelpfulnessInference.selfFeatureExtractors.unsafeMutableAddressor()
{
  if (one-time initialization token for selfFeatureExtractors != -1)
    swift_once();
  return &static InferredHelpfulnessInference.selfFeatureExtractors;
}

uint64_t static InferredHelpfulnessInference.selfFeatureExtractors.getter()
{
  if (one-time initialization token for selfFeatureExtractors != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

uint64_t InferredHelpfulnessInference.gradeInteractions()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[10] = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncCompactMapSequence<AnyAsyncSequence<Turn>, FeaturedTurn>);
  v1[11] = v2;
  v1[12] = *(_QWORD *)(v2 - 8);
  v1[13] = swift_task_alloc();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AnyAsyncSequence<Turn>);
  v1[14] = v3;
  v1[15] = *(_QWORD *)(v3 - 8);
  v1[16] = swift_task_alloc();
  v1[17] = swift_task_alloc();
  return swift_task_switch();
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t (__cdecl *v7)();

  v1 = v0[16];
  v2 = v0[17];
  v3 = v0[14];
  v4 = v0[15];
  type metadata accessor for PLLoggingReader();
  static PLLoggingReader.shared.getter();
  PLLoggingReader.asyncSignalReader.getter();
  swift_release();
  __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
  dispatch thunk of AsyncSignalReader.turns()();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 2));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v1, v2, v3);
  type metadata accessor for FeaturedTurn(0);
  lazy protocol witness table accessor for type AnyAsyncSequence<Turn> and conformance AnyAsyncSequence<A>(&lazy protocol witness table cache variable for type AnyAsyncSequence<Turn> and conformance AnyAsyncSequence<A>, &demangling cache variable for type metadata for AnyAsyncSequence<Turn>, MEMORY[0x24BEA4E90]);
  swift_retain();
  AsyncCompactMapSequence.init(_:transform:)();
  v7 = (uint64_t (__cdecl *)())((char *)&async function pointer to specialized AsyncSequence.collect()
                             + async function pointer to specialized AsyncSequence.collect());
  v5 = (_QWORD *)swift_task_alloc();
  v0[18] = v5;
  *v5 = v0;
  v5[1] = InferredHelpfulnessInference.gradeInteractions();
  return v7();
}

{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 120) + 8))(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 112));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  _BOOL4 v4;
  unint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  unint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;

  if (one-time initialization token for defaultLogger != -1)
    swift_once();
  v1 = type metadata accessor for Logger();
  __swift_project_value_buffer(v1, (uint64_t)defaultLogger);
  swift_bridgeObjectRetain_n();
  v2 = Logger.logObject.getter();
  v3 = static os_log_type_t.info.getter();
  v4 = os_log_type_enabled(v2, v3);
  v5 = *(_QWORD *)(v0 + 152);
  if (v4)
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v6 = 134217984;
    if (v5 >> 62)
    {
      swift_bridgeObjectRetain();
      v7 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      v7 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 72) = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21FDE7000, v2, v3, "Found %ld intra turns", v6, 0xCu);
    MEMORY[0x2207D560C](v6, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v8 = specialized InferredHelpfulnessInference.generateInterTurnFeatures(_:)(*(_QWORD *)(v0 + 152));
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRelease();
  v9 = Logger.logObject.getter();
  v10 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v11 = 134217984;
    if (v8 >> 62)
    {
      swift_bridgeObjectRetain();
      v12 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      v12 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 64) = v12;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21FDE7000, v9, v10, "Found %ld turns", v11, 0xCu);
    MEMORY[0x2207D560C](v11, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v13 = *(_QWORD *)(v0 + 136);
  v14 = *(_QWORD *)(v0 + 112);
  v15 = *(_QWORD *)(v0 + 120);
  v16 = InferredHelpfulnessInference.gradeInteractionsInternal(_:)(v8);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD *))(v0 + 8))(v16);
}

uint64_t InferredHelpfulnessInference.gradeInteractions()(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *v2;
  v5 = *(_QWORD *)(*v2 + 96);
  v4 = *(_QWORD *)(*v2 + 104);
  v6 = *(_QWORD *)(*v2 + 88);
  *(_QWORD *)(v3 + 152) = a1;
  *(_QWORD *)(v3 + 160) = v1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  return swift_task_switch();
}

uint64_t InferredHelpfulnessInference.gradeConversations()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1[28] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Conversation?);
  v1[29] = swift_task_alloc();
  v2 = type metadata accessor for Conversation();
  v1[30] = v2;
  v1[31] = *(_QWORD *)(v2 - 8);
  v1[32] = swift_task_alloc();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncMapSequence<AnyAsyncSequence<(Conversation, StreamBookmark?)>, Conversation>.Iterator);
  v1[33] = v3;
  v1[34] = *(_QWORD *)(v3 - 8);
  v1[35] = swift_task_alloc();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncMapSequence<AnyAsyncSequence<(Conversation, StreamBookmark?)>, Conversation>);
  v1[36] = v4;
  v1[37] = *(_QWORD *)(v4 - 8);
  v1[38] = swift_task_alloc();
  v1[39] = swift_task_alloc();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AnyAsyncSequence<(Conversation, StreamBookmark?)>);
  v1[40] = v5;
  v1[41] = *(_QWORD *)(v5 - 8);
  v1[42] = swift_task_alloc();
  v1[43] = swift_task_alloc();
  return swift_task_switch();
}

{
  uint64_t *v0;
  uint64_t v1;
  void (*v2)(void);
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  os_log_type_t type;
  os_log_type_t typea[8];
  uint64_t (*v39)(void);
  _QWORD *v40;
  uint64_t v41;

  v1 = v0[28];
  v40 = v0 + 2;
  type metadata accessor for PLLoggingReader();
  static PLLoggingReader.shared.getter();
  PLLoggingReader.streamBookmarkStore.getter();
  swift_release();
  __swift_project_boxed_opaque_existential_1(v0 + 8, v0[11]);
  v2 = *(void (**)(void))(*(_QWORD *)v1 + 208);
  v0[44] = (uint64_t)v2;
  v39 = (uint64_t (*)(void))v2;
  v2();
  v3 = (void *)dispatch thunk of StreamBookmarkStore.read(name:)();
  swift_bridgeObjectRelease();
  if (v3)
  {
    if (one-time initialization token for defaultLogger != -1)
      swift_once();
    v4 = type metadata accessor for Logger();
    __swift_project_value_buffer(v4, (uint64_t)defaultLogger);
    v5 = v3;
    swift_retain_n();
    v6 = v5;
    v7 = Logger.logObject.getter();
    v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v7, v8))
    {
      type = v8;
      v9 = swift_slowAlloc();
      v35 = swift_slowAlloc();
      v41 = v35;
      *(_DWORD *)v9 = 136315394;
      v10 = v39();
      v0[25] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v10, v11, &v41);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v9 + 12) = 2080;
      v0[26] = (uint64_t)v3;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for StreamBookmark?);
      v12 = Optional.debugDescription.getter();
      v0[27] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v12, v13, &v41);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21FDE7000, v7, type, "Loaded %s bookmark: %s ", (uint8_t *)v9, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2207D560C](v35, -1, -1);
      MEMORY[0x2207D560C](v9, -1, -1);

      goto LABEL_13;
    }

  }
  else
  {
    if (one-time initialization token for defaultLogger != -1)
      swift_once();
    v14 = type metadata accessor for Logger();
    __swift_project_value_buffer(v14, (uint64_t)defaultLogger);
    swift_retain_n();
    v15 = Logger.logObject.getter();
    v16 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = swift_slowAlloc();
      v41 = v18;
      *(_DWORD *)v17 = 136315138;
      v19 = v39();
      v0[24] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v19, v20, &v41);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21FDE7000, v15, v16, "No bookmark found for %s: to read from the beginning. ", v17, 0xCu);
      swift_arrayDestroy();
      v21 = v18;
      v3 = 0;
      MEMORY[0x2207D560C](v21, -1, -1);
      MEMORY[0x2207D560C](v17, -1, -1);

      goto LABEL_13;
    }

  }
  swift_release_n();
LABEL_13:
  static PLLoggingReader.shared.getter();
  PLLoggingReader.asyncSignalReader.getter();
  swift_release();
  __swift_project_boxed_opaque_existential_1(v40, v0[5]);
  if (v3)
  {
    v22 = v3;
  }
  else
  {
    type metadata accessor for StreamBookmark();
    v39();
    v22 = (void *)StreamBookmark.__allocating_init(name:)();
  }
  v0[45] = (uint64_t)v3;
  v23 = v3;
  v25 = v0[42];
  v24 = v0[43];
  v26 = v0[40];
  v27 = v0[41];
  v28 = v0[39];
  v36 = v0[36];
  *(_QWORD *)typea = v0[38];
  v34 = v0[37];
  v29 = v23;
  dispatch thunk of AsyncBookmarkingSignalReader.conversationsBookmarked(startBookmark:)();

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v40);
  v30 = swift_allocObject();
  v0[46] = v30;
  *(_QWORD *)(v30 + 16) = 0;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16))(v25, v24, v26);
  v31 = swift_allocObject();
  *(_QWORD *)(v31 + 16) = &async function pointer to partial apply for closure #1 in InferredHelpfulnessInference.gradeConversations();
  *(_QWORD *)(v31 + 24) = v30;
  lazy protocol witness table accessor for type AnyAsyncSequence<Turn> and conformance AnyAsyncSequence<A>(&lazy protocol witness table cache variable for type AnyAsyncSequence<(Conversation, StreamBookmark?)> and conformance AnyAsyncSequence<A>, &demangling cache variable for type metadata for AnyAsyncSequence<(Conversation, StreamBookmark?)>, MEMORY[0x24BEA4E90]);
  swift_retain();
  AsyncMapSequence.init(_:transform:)();
  swift_retain();
  v0[23] = MEMORY[0x24BEE4AF8];
  (*(void (**)(os_log_type_t *, uint64_t, uint64_t))(v34 + 16))(*(os_log_type_t **)typea, v28, v36);
  lazy protocol witness table accessor for type AnyAsyncSequence<Turn> and conformance AnyAsyncSequence<A>(&lazy protocol witness table cache variable for type AsyncMapSequence<AnyAsyncSequence<(Conversation, StreamBookmark?)>, Conversation> and conformance AsyncMapSequence<A, B>, &demangling cache variable for type metadata for AsyncMapSequence<AnyAsyncSequence<(Conversation, StreamBookmark?)>, Conversation>, MEMORY[0x24BEE6F08]);
  dispatch thunk of AsyncSequence.makeAsyncIterator()();
  v0[47] = lazy protocol witness table accessor for type AnyAsyncSequence<Turn> and conformance AnyAsyncSequence<A>(&lazy protocol witness table cache variable for type AsyncMapSequence<AnyAsyncSequence<(Conversation, StreamBookmark?)>, Conversation>.Iterator and conformance AsyncMapSequence<A, B>.Iterator, &demangling cache variable for type metadata for AsyncMapSequence<AnyAsyncSequence<(Conversation, StreamBookmark?)>, Conversation>.Iterator, MEMORY[0x24BEE6EE0]);
  v32 = (_QWORD *)swift_task_alloc();
  v0[48] = (uint64_t)v32;
  *v32 = v0;
  v32[1] = InferredHelpfulnessInference.gradeConversations();
  return dispatch thunk of AsyncIteratorProtocol.next()();
}

{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (_QWORD *)*v1;
  swift_task_dealloc();
  if (v0)
  {
    v2[50] = v0;
    v4 = v2[34];
    v3 = v2[35];
    v5 = v2[33];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  else
  {
    v2[49] = 0;
  }
  return swift_task_switch();
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
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t (*v25)(void);
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;

  v1 = *(_QWORD *)(v0 + 240);
  v2 = *(_QWORD *)(v0 + 248);
  v3 = *(_QWORD *)(v0 + 232);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    v43 = (_QWORD *)(v0 + 64);
    v4 = *(_QWORD *)(v0 + 368);
    v5 = *(_QWORD *)(v0 + 312);
    v7 = *(_QWORD *)(v0 + 288);
    v6 = *(_QWORD *)(v0 + 296);
    v8 = *(_QWORD *)(v0 + 224);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 272) + 8))(*(_QWORD *)(v0 + 280), *(_QWORD *)(v0 + 264));
    outlined destroy of Any?(v3, &demangling cache variable for type metadata for Conversation?);
    v9 = *(_QWORD *)(v0 + 184);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    swift_release();
    v10 = specialized InferredHelpfulnessInference.generateInterTurnFeaturesForConversation(_:)(v9);
    swift_bridgeObjectRelease();
    swift_retain();
    v11 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay23SiriInferredHelpfulness20FeaturedConversationCG_AF06GradedH0Vs5NeverOTg504_s23de52Helpfulness0bC9InferenceC18gradeConversationsSayAA18ih12VGyYaKFAfA08G9H0CXEfU0_AF0efN0CTf1cn_nTf4ng_n(v10, v8);
    swift_bridgeObjectRelease();
    swift_release();
    swift_beginAccess();
    v12 = *(void **)(v4 + 16);
    if (v12)
    {
      v42 = *(_QWORD *)(v0 + 344);
      v36 = *(void **)(v0 + 360);
      v38 = *(_QWORD *)(v0 + 328);
      v40 = *(_QWORD *)(v0 + 320);
      v13 = v11;
      v14 = *(_QWORD *)(v0 + 224);
      __swift_project_boxed_opaque_existential_1(v43, *(_QWORD *)(v0 + 88));
      v15 = v12;
      dispatch thunk of StreamBookmarkStore.write(bookmark:)();
      __swift_project_boxed_opaque_existential_1(v43, *(_QWORD *)(v0 + 88));
      outlined init with copy of StreamBookmarkStore((uint64_t)v43, v0 + 104);
      v16 = swift_allocObject();
      outlined init with take of StreamBookmarkStore((__int128 *)(v0 + 104), v16 + 16);
      *(_QWORD *)(v16 + 56) = v14;
      v11 = v13;
      swift_retain();
      dispatch thunk of StreamBookmarkStore.notifyOnComplete(completion:)();

      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v42, v40);
      swift_release();
      v17 = v0 + 64;
    }
    else
    {
      if (one-time initialization token for defaultLogger != -1)
        swift_once();
      v22 = type metadata accessor for Logger();
      __swift_project_value_buffer(v22, (uint64_t)defaultLogger);
      swift_retain_n();
      v23 = Logger.logObject.getter();
      v24 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v23, v24))
      {
        v35 = *(void **)(v0 + 360);
        v25 = *(uint64_t (**)(void))(v0 + 352);
        v37 = *(_QWORD *)(v0 + 328);
        v39 = *(_QWORD *)(v0 + 320);
        v41 = *(_QWORD *)(v0 + 344);
        v26 = (uint8_t *)swift_slowAlloc();
        v27 = v11;
        v28 = swift_slowAlloc();
        v44 = v28;
        *(_DWORD *)v26 = 136315138;
        v29 = v25();
        *(_QWORD *)(v0 + 176) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v29, v30, &v44);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21FDE7000, v23, v24, "Read nil bookmark for %s ", v26, 0xCu);
        swift_arrayDestroy();
        v31 = v28;
        v11 = v27;
        MEMORY[0x2207D560C](v31, -1, -1);
        MEMORY[0x2207D560C](v26, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v41, v39);
      }
      else
      {
        v32 = *(_QWORD *)(v0 + 344);
        v33 = *(_QWORD *)(v0 + 320);
        v34 = *(_QWORD *)(v0 + 328);

        swift_release_n();
        (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v32, v33);
      }
      swift_release();
      v17 = v0 + 64;
    }
    __swift_destroy_boxed_opaque_existential_0(v17);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v11);
  }
  else
  {
    v18 = *(_QWORD *)(v0 + 256);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v18, v3, v1);
    v19 = InferredHelpfulnessInference.generateIntraTurnFeaturesForConversation(_:)();
    specialized Array.append<A>(contentsOf:)(v19, (unint64_t *)type metadata accessor for FeaturedTurn, &lazy protocol witness table cache variable for type [FeaturedTurn] and conformance [A], &demangling cache variable for type metadata for [FeaturedTurn], (uint64_t *)specialized protocol witness for Collection.subscript.read in conformance [A]);
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v18, v1);
    v20 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 408) = v20;
    *v20 = v0;
    v20[1] = InferredHelpfulnessInference.gradeConversations();
    return dispatch thunk of AsyncIteratorProtocol.next()();
  }
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(void **)(v0 + 360);
  v2 = *(_QWORD *)(v0 + 344);
  v3 = *(_QWORD *)(v0 + 320);
  v4 = *(_QWORD *)(v0 + 328);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 296) + 8))(*(_QWORD *)(v0 + 312), *(_QWORD *)(v0 + 288));

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0(v0 + 64);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (_QWORD *)*v1;
  swift_task_dealloc();
  if (v0)
  {
    v2[50] = v0;
    v4 = v2[34];
    v3 = v2[35];
    v5 = v2[33];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  else
  {
    v2[49] = 0;
  }
  return swift_task_switch();
}

uint64_t closure #1 in InferredHelpfulnessInference.gradeConversations()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[7] = a3;
  v4[8] = a4;
  v4[5] = a1;
  v4[6] = a2;
  return swift_task_switch();
}

uint64_t closure #1 in InferredHelpfulnessInference.gradeConversations()()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;

  v2 = *(void **)(v0 + 56);
  v1 = *(_QWORD *)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = *(_QWORD *)(v0 + 48);
  swift_beginAccess();
  v5 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = v2;
  v6 = v2;

  v7 = type metadata accessor for Conversation();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v3, v4, v7);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable @async (@in_guaranteed Conversation, @guaranteed StreamBookmark?) -> (@out Conversation)(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  uint64_t v7;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  v7 = *(_QWORD *)(a2
                 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Conversation, StreamBookmark?))
                          + 48));
  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)a3 + *a3);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v8;
  *v8 = v3;
  v8[1] = partial apply for closure #1 in AsyncSequence.flatMap<A>(_:);
  return v10(a1, a2, v7);
}

uint64_t AsyncSequence.flatMap<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;

  v6[8] = a5;
  v6[9] = v5;
  v6[6] = a3;
  v6[7] = a4;
  v6[4] = a1;
  v6[5] = a2;
  return swift_task_switch();
}

uint64_t AsyncSequence.flatMap<A>(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  __int128 v5;
  __int128 v6;

  v1 = *(_QWORD *)(v0 + 48);
  v5 = *(_OWORD *)(v0 + 56);
  v6 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v0 + 24) = static Array._allocateUninitialized(_:)();
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v2;
  *(_QWORD *)(v2 + 16) = v1;
  *(_OWORD *)(v2 + 24) = v5;
  *(_OWORD *)(v2 + 40) = v6;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v3;
  type metadata accessor for Array();
  *v3 = v0;
  v3[1] = AsyncSequence.flatMap<A>(_:);
  return AsyncSequence.reduce<A>(into:_:)();
}

{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void closure #3 in InferredHelpfulnessInference.gradeConversations()(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  uint64_t v12;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  (*(void (**)(void))(*(_QWORD *)a2 + 208))();
  v3 = (void *)dispatch thunk of StreamBookmarkStore.read(name:)();
  swift_bridgeObjectRelease();
  if (one-time initialization token for defaultLogger != -1)
    swift_once();
  v4 = type metadata accessor for Logger();
  __swift_project_value_buffer(v4, (uint64_t)defaultLogger);
  v11 = v3;
  v5 = Logger.logObject.getter();
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v12 = v8;
    *(_DWORD *)v7 = 136315138;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for StreamBookmark?);
    v9 = Optional.debugDescription.getter();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v9, v10, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21FDE7000, v5, v6, "Saved boomark: %s ", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207D560C](v8, -1, -1);
    MEMORY[0x2207D560C](v7, -1, -1);

  }
  else
  {

  }
}

_QWORD *InferredHelpfulnessInference.gradeInteractionsInternal(_:)(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD *result;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
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
  _QWORD *v36;
  unint64_t v37;
  unint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  char *v41;
  char *v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  uint64_t v47;
  __int128 *v48;
  char *v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t (*v60)(void);
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;

  v2 = v1;
  v56 = type metadata accessor for ImmutableLoggingMetadata();
  MEMORY[0x24BDAC7A8](v56);
  v5 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for UUID();
  v54 = *(_QWORD *)(v6 - 8);
  v55 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!(a1 >> 62))
  {
    v9 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = (_QWORD *)swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_3;
LABEL_32:
    swift_bridgeObjectRelease();
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  result = (_QWORD *)_CocoaArrayWrapper.endIndex.getter();
  v9 = (uint64_t)result;
  if (!result)
    goto LABEL_32;
LABEL_3:
  if (v9 < 1)
  {
    __break(1u);
  }
  else
  {
    v12 = 0;
    v51 = a1 & 0xC000000000000001;
    v60 = *(uint64_t (**)(void))(*(_QWORD *)v1 + 184);
    v59 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v47 = MEMORY[0x24BEE4AD8] + 8;
    *(_QWORD *)&v11 = 136315138;
    v46 = v11;
    v49 = v5;
    v50 = a1;
    v58 = v1;
    v52 = v9;
    v53 = v8;
    do
    {
      if (v51)
      {
        v14 = (_QWORD *)MEMORY[0x2207D5048](v12, a1);
      }
      else
      {
        v14 = *(_QWORD **)(a1 + 8 * v12 + 32);
        swift_retain();
      }
      UUID.init()();
      UUID.init()();
      outlined init with copy of UUID?((uint64_t)v14 + OBJC_IVAR____TtC23SiriInferredHelpfulness12FeaturedTurn_requestID, (uint64_t)&v5[*(int *)(v56 + 20)]);
      if (one-time initialization token for defaultLogger != -1)
        swift_once();
      v15 = type metadata accessor for Logger();
      __swift_project_value_buffer(v15, (uint64_t)defaultLogger);
      swift_retain_n();
      v16 = Logger.logObject.getter();
      v17 = static os_log_type_t.default.getter();
      v18 = os_log_type_enabled(v16, v17);
      v61 = v14;
      if (v18)
      {
        v19 = swift_slowAlloc();
        v20 = swift_slowAlloc();
        v62 = v20;
        *(_DWORD *)v19 = v46;
        v21 = (*(uint64_t (**)(void))(*(_QWORD *)v2 + 160))();
        *(_QWORD *)(v19 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v22, &v62);
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21FDE7000, v16, v17, "versionString: %s", (uint8_t *)v19, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2207D560C](v20, -1, -1);
        v23 = v19;
        v14 = v61;
        MEMORY[0x2207D560C](v23, -1, -1);

      }
      else
      {

        v24 = swift_release_n();
      }
      v25 = ((uint64_t (*)(uint64_t))v60)(v24);
      if ((v25 & 1) != 0)
      {
        MEMORY[0x24BDAC7A8](v25);
        *((_QWORD *)&v46 - 2) = v5;
        specialized static IHProtoUtils.emitAndLogEvent(createMessageClosure:messageName:)((uint64_t (*)(void))partial apply for closure #1 in InferredHelpfulnessInference.gradeInteractionsInternal(_:), (uint64_t)(&v46 - 2), 0x4C74736575716572, 0xEB000000006B6E69);
        MEMORY[0x24BDAC7A8](v26);
        *((_QWORD *)&v46 - 4) = v5;
        *((_QWORD *)&v46 - 3) = v8;
        *((_QWORD *)&v46 - 2) = v2;
        specialized static IHProtoUtils.emitAndLogEvent(createMessageClosure:messageName:)((uint64_t (*)(void))partial apply for closure #2 in InferredHelpfulnessInference.gradeInteractionsInternal(_:), (uint64_t)(&v46 - 3), 0x7472617473, 0xE500000000000000);
      }
      v27 = InferredHelpfulnessInference.generateGradedInteraction(featuredTurn:)(v14, (uint64_t)&v62);
      v28 = v63;
      if (v63)
      {
        v57 = v12;
        v29 = v62;
        v31 = v64;
        v30 = v65;
        v32 = v66;
        v33 = v67;
        v35 = v68;
        v34 = v69;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_retain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
          v36 = v59;
        else
          v36 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v59[2] + 1, 1, v59);
        v38 = v36[2];
        v37 = v36[3];
        if (v38 >= v37 >> 1)
          v36 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v37 > 1), v38 + 1, 1, v36);
        v36[2] = v38 + 1;
        v59 = v36;
        v39 = &v36[8 * v38];
        v39[4] = v29;
        v39[5] = v28;
        v39[6] = v31;
        v39[7] = v30;
        v39[8] = v32;
        v39[9] = v33;
        v39[10] = v35;
        v39[11] = v34;
        v40 = v60();
        if ((v40 & 1) != 0)
        {
          v48 = &v46;
          MEMORY[0x24BDAC7A8](v40);
          v41 = v49;
          v42 = v53;
          *((_QWORD *)&v46 - 6) = v49;
          *((_QWORD *)&v46 - 5) = v42;
          *((_DWORD *)&v46 - 8) = v43;
          *((_DWORD *)&v46 - 7) = 0;
          *((_BYTE *)&v46 - 24) = 1;
          *((_DWORD *)&v46 - 5) = 0;
          *((_BYTE *)&v46 - 16) = 1;
          specialized static IHProtoUtils.emitAndLogEvent(createMessageClosure:messageName:)((uint64_t (*)(void))partial apply for closure #3 in InferredHelpfulnessInference.gradeInteractionsInternal(_:), (uint64_t)(&v46 - 4), 6581861, 0xE300000000000000);
          v44 = v28;
          v8 = v42;
          v5 = v41;
          outlined consume of GradedInteraction?(v29, v44);
          swift_release();
          a1 = v50;
          v2 = v58;
        }
        else
        {
          outlined consume of GradedInteraction?(v29, v28);
          swift_release();
          v5 = v49;
          a1 = v50;
          v2 = v58;
          v8 = v53;
        }
        v13 = v52;
        v12 = v57;
      }
      else
      {
        v45 = ((uint64_t (*)(uint64_t))v60)(v27);
        if ((v45 & 1) != 0)
        {
          MEMORY[0x24BDAC7A8](v45);
          v8 = v53;
          *((_QWORD *)&v46 - 4) = v5;
          *((_QWORD *)&v46 - 3) = v8;
          *((_QWORD *)&v46 - 2) = v2;
          specialized static IHProtoUtils.emitAndLogEvent(createMessageClosure:messageName:)((uint64_t (*)(void))partial apply for closure #4 in InferredHelpfulnessInference.gradeInteractionsInternal(_:), (uint64_t)(&v46 - 3), 1818845542, 0xE400000000000000);
          swift_release();
        }
        else
        {
          swift_release();
          v8 = v53;
        }
        v13 = v52;
      }
      ++v12;
      outlined destroy of ImmutableLoggingMetadata((uint64_t)v5);
      (*(void (**)(char *, uint64_t))(v54 + 8))(v8, v55);
    }
    while (v13 != v12);
    swift_bridgeObjectRelease();
    return v59;
  }
  return result;
}

uint64_t InferredHelpfulnessInference.generateGradedInteraction(featuredTurn:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  double v11;
  uint64_t (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;

  v3 = v2;
  v6 = (*(uint64_t (**)(void))(*(_QWORD *)v2 + 136))();
  if (!v6
    || (v7 = v6,
        (*(void (**)(void))(*a1 + 120))(),
        v8 = (*(uint64_t (**)(void))(*(_QWORD *)v7 + 128))(),
        v10 = v9,
        swift_release(),
        swift_bridgeObjectRelease(),
        (v10 & 1) != 0))
  {
    v11 = (*(double (**)(void))(*(_QWORD *)v3 + 280))();
  }
  else
  {
    v11 = *(double *)&v8;
  }
  v12 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 160);
  v13 = swift_retain();
  v14 = v12(v13);
  result = GradedInteraction.init(inferredHelpfulnessScore:featuredTurn:modelVersion:)(a1, v14, v15, (uint64_t)&v22, v11);
  v17 = v23;
  v18 = v24;
  v19 = v26;
  v20 = v27;
  v21 = v25;
  *(_OWORD *)a2 = v22;
  *(_QWORD *)(a2 + 16) = v17;
  *(_QWORD *)(a2 + 24) = v18;
  *(_OWORD *)(a2 + 32) = v21;
  *(_QWORD *)(a2 + 48) = v19;
  *(_QWORD *)(a2 + 56) = v20;
  return result;
}

uint64_t closure #1 in InferredHelpfulnessInference.generateIntraTurnFeatures(_:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *a2;
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v3;
  return swift_task_switch();
}

uint64_t closure #1 in InferredHelpfulnessInference.generateIntraTurnFeatures(_:)()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = *(_QWORD **)(v0 + 16);
  *v1 = specialized InferredHelpfulnessInference.generateIntraTurnFeature(_:)();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t specialized AsyncSequence.collect()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[4] = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncCompactMapSequence<AnyAsyncSequence<Turn>, FeaturedTurn>);
  v1[5] = v2;
  v1[6] = *(_QWORD *)(v2 - 8);
  v1[7] = swift_task_alloc();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncCompactMapSequence<AnyAsyncSequence<Turn>, FeaturedTurn>.Iterator);
  v1[8] = v3;
  v1[9] = *(_QWORD *)(v3 - 8);
  v1[10] = swift_task_alloc();
  return swift_task_switch();
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0[6];
  v2 = v0[7];
  v3 = v0[4];
  v4 = v0[5];
  v0[2] = MEMORY[0x24BEE4AF8];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v2, v3, v4);
  lazy protocol witness table accessor for type AnyAsyncSequence<Turn> and conformance AnyAsyncSequence<A>(&lazy protocol witness table cache variable for type AsyncCompactMapSequence<AnyAsyncSequence<Turn>, FeaturedTurn> and conformance AsyncCompactMapSequence<A, B>, &demangling cache variable for type metadata for AsyncCompactMapSequence<AnyAsyncSequence<Turn>, FeaturedTurn>, MEMORY[0x24BEE7030]);
  dispatch thunk of AsyncSequence.makeAsyncIterator()();
  v0[11] = lazy protocol witness table accessor for type AnyAsyncSequence<Turn> and conformance AnyAsyncSequence<A>(&lazy protocol witness table cache variable for type AsyncCompactMapSequence<AnyAsyncSequence<Turn>, FeaturedTurn>.Iterator and conformance AsyncCompactMapSequence<A, B>.Iterator, &demangling cache variable for type metadata for AsyncCompactMapSequence<AnyAsyncSequence<Turn>, FeaturedTurn>.Iterator, MEMORY[0x24BEE7008]);
  v5 = (_QWORD *)swift_task_alloc();
  v0[12] = v5;
  *v5 = v0;
  v5[1] = specialized AsyncSequence.collect();
  return dispatch thunk of AsyncIteratorProtocol.next()();
}

{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (_QWORD *)*v1;
  swift_task_dealloc();
  if (v0)
  {
    v2[13] = v0;
    v4 = v2[9];
    v3 = v2[10];
    v5 = v2[8];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  if (*(_QWORD *)(v0 + 24))
  {
    v1 = swift_retain();
    MEMORY[0x2207D4EB0](v1);
    if (*(_QWORD *)((*(_QWORD *)(v0 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v0 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                       + 0x18) >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    swift_release();
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v2;
    *v2 = v0;
    v2[1] = specialized AsyncSequence.collect();
    return dispatch thunk of AsyncIteratorProtocol.next()();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 72) + 8))(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 64));
    swift_release();
    v4 = *(_QWORD *)(v0 + 16);
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v4);
  }
}

{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (_QWORD *)*v1;
  swift_task_dealloc();
  if (v0)
  {
    v2[13] = v0;
    v4 = v2[9];
    v3 = v2[10];
    v5 = v2[8];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  return swift_task_switch();
}

uint64_t AsyncSequence.collect()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  return swift_task_switch();
}

uint64_t AsyncSequence.collect()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = v0[4];
  v1 = v0[5];
  swift_getAssociatedTypeWitness();
  v0[3] = static Array._allocateUninitialized(_:)();
  v3 = swift_task_alloc();
  v0[7] = v3;
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  v4 = (_QWORD *)swift_task_alloc();
  v0[8] = v4;
  type metadata accessor for Array();
  *v4 = v0;
  v4[1] = AsyncSequence.collect();
  return AsyncSequence.reduce<A>(into:_:)();
}

{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t specialized Array.append<A>(contentsOf:)(unint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  unint64_t *v5;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v11 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v12 = *v5;
  if (*v5 >> 62)
  {
    swift_bridgeObjectRetain();
    v13 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    v14 = v13 + v11;
    if (!__OFADD__(v13, v11))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v13 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
  v14 = v13 + v11;
  if (__OFADD__(v13, v11))
    goto LABEL_23;
LABEL_5:
  v12 = *v5;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v5 = v12;
  v13 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject
    && (v12 & 0x8000000000000000) == 0
    && (v12 & 0x4000000000000000) == 0)
  {
    v16 = v12 & 0xFFFFFFFFFFFFFF8;
    if (v14 <= *(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v13 = 1;
  }
  v23 = v11;
  v11 = (uint64_t)a2;
  a2 = a3;
  a3 = (unint64_t *)a4;
  a4 = a5;
  if (v12 >> 62)
    goto LABEL_25;
  v17 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v17 <= v14)
      v17 = v14;
    swift_bridgeObjectRetain();
    v12 = MEMORY[0x2207D5054](v13, v17, 1, v12);
    swift_bridgeObjectRelease();
    *v5 = v12;
    v16 = v12 & 0xFFFFFFFFFFFFFF8;
    a5 = a4;
    a4 = (uint64_t *)a3;
    a3 = a2;
    a2 = (unint64_t *)v11;
    v11 = v23;
LABEL_15:
    result = specialized Array._copyContents(initializing:)(v16 + 8 * *(_QWORD *)(v16 + 16) + 32, (*(_QWORD *)(v16 + 24) >> 1) - *(_QWORD *)(v16 + 16), a1, (void (*)(_QWORD))a2, a3, a4, (uint64_t (*)(_BYTE *, uint64_t, unint64_t, uint64_t, uint64_t))a5);
    if (v19 >= v11)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v17 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  if (v19 < 1)
    goto LABEL_19;
  v20 = *(_QWORD *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v21 = __OFADD__(v20, v19);
  v22 = v20 + v19;
  if (!v21)
  {
    *(_QWORD *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10) = v22;
LABEL_19:
    swift_bridgeObjectRelease();
    return specialized Array._endMutation()();
  }
  __break(1u);
  return result;
}

uint64_t specialized Array.append<A>(contentsOf:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v14 = v4 + v2;
  else
    v14 = v4;
  v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = (unint64_t)&v3[2 * v8 + 4];
  if (a1 + 32 < v9 + 16 * v2 && v9 < a1 + 32 + 16 * v2)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v11 = v3[2];
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t InferredHelpfulnessInference.generateIntraTurnFeaturesForConversation(_:)()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _QWORD v12[4];

  Conversation.allTurnsChronologically.getter();
  swift_retain();
  v0 = specialized Sequence.compactMap<A>(_:)();
  swift_release();
  if (v0 >> 62)
  {
    swift_bridgeObjectRetain();
    v6 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v6)
      goto LABEL_3;
  }
  else if (*(_QWORD *)((v0 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_3:
    if ((v0 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      v1 = MEMORY[0x2207D5048](0, v0);
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    if (*(_QWORD *)((v0 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v1 = *(_QWORD *)(v0 + 32);
      swift_retain();
LABEL_6:
      v3 = *(_QWORD *)(v1 + 24);
      v2 = *(_QWORD *)(v1 + 32);
      swift_bridgeObjectRetain();
      v4 = swift_release();
      MEMORY[0x24BDAC7A8](v4);
      v12[2] = v3;
      v12[3] = v2;
      v5 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay23SiriInferredHelpfulness12FeaturedTurnCG_AHs5NeverOTg5((void (*)(uint64_t *__return_ptr, uint64_t *))partial apply for closure #1 in InferredHelpfulnessInference.generateIntraTurnFeaturesForConversation(_:), (uint64_t)v12, v0);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v5;
    }
    __break(1u);
    goto LABEL_15;
  }
  if (one-time initialization token for defaultLogger != -1)
LABEL_15:
    swift_once();
  v7 = type metadata accessor for Logger();
  __swift_project_value_buffer(v7, (uint64_t)defaultLogger);
  v8 = Logger.logObject.getter();
  v9 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_21FDE7000, v8, v9, "No feature turns.", v10, 2u);
    MEMORY[0x2207D560C](v10, -1, -1);
  }

  return v0;
}

uint64_t InferredHelpfulnessInference.deinit()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t InferredHelpfulnessInference.__deallocating_deinit()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t closure #1 in AsyncSequence.collect()(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t AssociatedTypeWitness;

  v2[2] = a1;
  v2[3] = a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v2[4] = AssociatedTypeWitness;
  v2[5] = *(_QWORD *)(AssociatedTypeWitness - 8);
  v2[6] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t closure #1 in AsyncSequence.collect()()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 40) + 16))(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  type metadata accessor for Array();
  Array.append(_:)();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t closure #1 in AsyncSequence.flatMap<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[6] = a4;
  v6[7] = a6;
  v6[4] = a2;
  v6[5] = a3;
  v6[3] = a1;
  return swift_task_switch();
}

uint64_t closure #1 in AsyncSequence.flatMap<A>(_:)()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 16) = (*(uint64_t (**)(_QWORD))(v0 + 40))(*(_QWORD *)(v0 + 32));
  v1 = type metadata accessor for Array();
  MEMORY[0x2207D5564](MEMORY[0x24BEE12C8], v1);
  Array.append<A>(contentsOf:)();
  return (*(uint64_t (**)(void))(v0 + 8))();
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

uint64_t thunk for @escaping @callee_guaranteed () -> (@unowned Int)@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;

  Hasher.init(_seed:)();
  String.hash(into:)();
  v4 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(Swift::UInt32 a1)
{
  Swift::Int v2;

  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  v2 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
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

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t type metadata accessor for InferredHelpfulnessInference()
{
  return objc_opt_self();
}

uint64_t partial apply for closure #1 in InferredHelpfulnessInference.generateIntraTurnFeatures(_:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = partial apply for closure #1 in AsyncSequence.flatMap<A>(_:);
  v6 = *a2;
  v5[2] = a1;
  v5[3] = v6;
  return swift_task_switch();
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

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(int a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1)
          break;
      }
    }
  }
  return result;
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

uint64_t specialized Array._copyContents(initializing:)(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return specialized Array._copyContents(initializing:)(a1, a2, a3, (void (*)(_QWORD))type metadata accessor for FeaturedTurn, &lazy protocol witness table cache variable for type [FeaturedTurn] and conformance [A], &demangling cache variable for type metadata for [FeaturedTurn], (uint64_t (*)(_BYTE *, uint64_t, unint64_t, uint64_t, uint64_t))specialized protocol witness for Collection.subscript.read in conformance [A]);
}

uint64_t specialized Array._copyContents(initializing:)(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(_QWORD), unint64_t *a5, uint64_t *a6, uint64_t (*a7)(_BYTE *, uint64_t, unint64_t, uint64_t, uint64_t))
{
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void (*v22)(_BYTE *, _QWORD);
  uint64_t *v23;
  uint64_t v24;
  uint64_t result;
  _BYTE v26[32];

  v14 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v15 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v15)
      return a3;
  }
  else
  {
    v15 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v15)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v16 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v14)
  {
    swift_bridgeObjectRetain();
    v18 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v18 <= a2)
    {
      if (v15 >= 1)
      {
        v19 = lazy protocol witness table accessor for type AnyAsyncSequence<Turn> and conformance AnyAsyncSequence<A>(a5, a6, MEMORY[0x24BEE12E0]);
        swift_bridgeObjectRetain();
        for (i = 0; i != v15; ++i)
        {
          v21 = __swift_instantiateConcreteTypeFromMangledName(a6);
          v22 = (void (*)(_BYTE *, _QWORD))a7(v26, i, a3, v21, v19);
          v24 = *v23;
          swift_retain();
          v22(v26, 0);
          *(_QWORD *)(a1 + 8 * i) = v24;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v17 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v17 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v16 + 32 >= a1 + 8 * v17 || v16 + 32 + 8 * v17 <= a1)
  {
    a4(0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *specialized static IHProtoUtils.generateRequestLink(loggingMetadata:)(uint64_t a1)
{
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  void (*v18)(char *, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  id v24;
  void *v25;
  char *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  char *v32;
  Class isa;
  id v34;
  id v35;
  char *v36;
  Class v37;
  id v38;
  void (*v39)(char *, uint64_t);
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  void (*v48)(char *, uint64_t);
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  void (*v52)(char *, uint64_t);
  uint64_t v54;
  int v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v54 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for UUID();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v54 - v11;
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v54 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v54 - v16;
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v18((char *)&v54 - v16, a1, v5);
  v19 = type metadata accessor for ImmutableLoggingMetadata();
  outlined init with copy of UUID?(a1 + *(int *)(v19 + 20), (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    outlined destroy of Any?((uint64_t)v4, &demangling cache variable for type metadata for UUID?);
    if (one-time initialization token for defaultLogger != -1)
      swift_once();
    v20 = type metadata accessor for Logger();
    __swift_project_value_buffer(v20, (uint64_t)defaultLogger);
    v21 = Logger.logObject.getter();
    v22 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_21FDE7000, v21, v22, "Unable to emit RequestLink for SELF as RequestId is not present in the logging metadata", v23, 2u);
      MEMORY[0x2207D560C](v23, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v17, v5);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v15, v4, v5);
  v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95B60]), sel_init);
  if (!v24)
  {
LABEL_14:
    if (one-time initialization token for defaultLogger != -1)
      swift_once();
    v40 = type metadata accessor for Logger();
    __swift_project_value_buffer(v40, (uint64_t)defaultLogger);
    v18(v12, (uint64_t)v17, v5);
    v18(v9, (uint64_t)v15, v5);
    v41 = Logger.logObject.getter();
    v42 = static os_log_type_t.error.getter();
    v43 = v42;
    if (os_log_type_enabled(v41, v42))
    {
      v44 = swift_slowAlloc();
      v57 = v17;
      v45 = v44;
      v56 = swift_slowAlloc();
      v59 = v56;
      *(_DWORD *)v45 = 136315394;
      v54 = v45 + 4;
      lazy protocol witness table accessor for type MLModelMetadataKey and conformance MLModelMetadataKey((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
      v55 = v43;
      v46 = dispatch thunk of CustomStringConvertible.description.getter();
      v58 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v46, v47, &v59);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v48 = *(void (**)(char *, uint64_t))(v6 + 8);
      v48(v12, v5);
      *(_WORD *)(v45 + 12) = 2080;
      v49 = dispatch thunk of CustomStringConvertible.description.getter();
      v58 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v49, v50, &v59);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v48(v9, v5);
      _os_log_impl(&dword_21FDE7000, v41, (os_log_type_t)v55, "Unable to create RequestLink schemas for SELF for ihId: %s, and requestId: %s", (uint8_t *)v45, 0x16u);
      v51 = v56;
      swift_arrayDestroy();
      MEMORY[0x2207D560C](v51, -1, -1);
      MEMORY[0x2207D560C](v45, -1, -1);

      v48(v15, v5);
      v48(v57, v5);
    }
    else
    {

      v52 = *(void (**)(char *, uint64_t))(v6 + 8);
      v52(v9, v5);
      v52(v12, v5);
      v52(v15, v5);
      v52(v17, v5);
    }
    return 0;
  }
  v25 = v24;
  v57 = v15;
  v26 = v17;
  v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95B68]), sel_init);
  if (!v27)
  {
    v28 = v25;
LABEL_13:

    v17 = v26;
    v15 = v57;
    goto LABEL_14;
  }
  v28 = v27;
  v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95B68]), sel_init);
  if (!v29)
  {

    goto LABEL_13;
  }
  v30 = v29;
  v31 = objc_allocWithZone(MEMORY[0x24BE95C78]);
  v32 = v26;
  isa = UUID._bridgeToObjectiveC()().super.isa;
  v34 = objc_msgSend(v31, sel_initWithNSUUID_, isa);

  objc_msgSend(v28, sel_setUuid_, v34);
  objc_msgSend(v28, sel_setComponent_, 10);
  v35 = objc_allocWithZone(MEMORY[0x24BE95C78]);
  v36 = v57;
  v37 = UUID._bridgeToObjectiveC()().super.isa;
  v38 = objc_msgSend(v35, sel_initWithNSUUID_, v37);

  objc_msgSend(v30, sel_setUuid_, v38);
  objc_msgSend(v30, sel_setComponent_, 1);
  objc_msgSend(v25, sel_setSource_, v28);
  objc_msgSend(v25, sel_setTarget_, v30);

  v39 = *(void (**)(char *, uint64_t))(v6 + 8);
  v39(v36, v5);
  v39(v32, v5);
  return v25;
}

void *specialized static IHProtoUtils.generateModelEvalStart(loggingMetadata:contextId:modelId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  void (*v32)(char *, uint64_t);
  id v34;
  void *v35;
  Class isa;
  id v37;
  id v38;
  Class v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v8 = type metadata accessor for UUID();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v41 - v12;
  v42 = v14;
  v15 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v15((char *)&v41 - v12, a1, v8);
  v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95070]), sel_init);
  if (v16)
  {
    v17 = v16;
    v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95078]), sel_init);
    if (v18)
    {
      v19 = v18;
      v41 = a2;
      v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95080]), sel_init);
      if (v20)
      {
        v21 = v20;
        v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95098]), sel_init);
        if (v22)
        {
          v23 = v22;
          if (a4)
            v24 = (void *)MEMORY[0x2207D4DFC](a3, a4);
          else
            v24 = 0;
          objc_msgSend(v23, sel_setModelId_, v24);

          v34 = objc_allocWithZone(MEMORY[0x24BE95C78]);
          v35 = v23;
          isa = UUID._bridgeToObjectiveC()().super.isa;
          v37 = objc_msgSend(v34, sel_initWithNSUUID_, isa);

          objc_msgSend(v21, sel_setContextId_, v37);
          objc_msgSend(v21, sel_setStartedOrChanged_, v35);
          v38 = objc_allocWithZone(MEMORY[0x24BE95C78]);
          v39 = UUID._bridgeToObjectiveC()().super.isa;
          v40 = objc_msgSend(v38, sel_initWithNSUUID_, v39);

          objc_msgSend(v19, sel_setIhId_, v40);
          objc_msgSend(v17, sel_setEventMetadata_, v19);
          objc_msgSend(v17, sel_setModelEvaluationContext_, v21);

          (*(void (**)(char *, uint64_t))(v42 + 8))(v13, v8);
          return v17;
        }

        v17 = v19;
      }
      else
      {
        v21 = v19;
      }

      v17 = v21;
    }

  }
  if (one-time initialization token for defaultLogger != -1)
    swift_once();
  v25 = type metadata accessor for Logger();
  __swift_project_value_buffer(v25, (uint64_t)defaultLogger);
  v15(v11, (uint64_t)v13, v8);
  v26 = Logger.logObject.getter();
  v27 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v26, v27))
  {
    v28 = (uint8_t *)swift_slowAlloc();
    v29 = swift_slowAlloc();
    v44 = v29;
    *(_DWORD *)v28 = 136315138;
    lazy protocol witness table accessor for type MLModelMetadataKey and conformance MLModelMetadataKey((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v30 = dispatch thunk of CustomStringConvertible.description.getter();
    v43 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v30, v31, &v44);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v32 = *(void (**)(char *, uint64_t))(v42 + 8);
    v32(v11, v8);
    _os_log_impl(&dword_21FDE7000, v26, v27, "Unable to create FeatureExtraction started schemas for SELF for ihId: %s", v28, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207D560C](v29, -1, -1);
    MEMORY[0x2207D560C](v28, -1, -1);

  }
  else
  {

    v32 = *(void (**)(char *, uint64_t))(v42 + 8);
    v32(v11, v8);
  }
  v32(v13, v8);
  return 0;
}

void *specialized static IHProtoUtils.generateModelEvalEnd(loggingMetadata:contextId:ihScoreData:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __int16 a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  double v24;
  void *v25;
  double v26;
  id v27;
  id v28;
  Class isa;
  id v30;
  id v31;
  id v32;
  Class v33;
  id v34;
  id v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  void (*v43)(char *, uint64_t);
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v10 = type metadata accessor for UUID();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v45 - v14;
  v48 = v16;
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
  v17((char *)&v45 - v14, a1, v10);
  v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95070]), sel_init);
  if (v18)
  {
    v19 = v18;
    v47 = a2;
    v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95078]), sel_init);
    if (v20)
    {
      v21 = v20;
      v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE950A0]), sel_init);
      if (v22)
      {
        v46 = v22;
        v45 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95080]), sel_init);
        if (v45)
        {
          v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95088]), sel_init);
          if (v23)
          {
            v25 = v23;
            if ((a5 & 0x100) == 0)
            {
              LODWORD(v24) = a3;
              objc_msgSend(v46, sel_setScore_, v24);
              if ((a5 & 1) == 0)
              {
                LODWORD(v26) = HIDWORD(a4);
                objc_msgSend(v46, sel_setUpperBoundary_, v26);
              }
              if ((a4 & 1) == 0)
              {
                LODWORD(v26) = HIDWORD(a3);
                objc_msgSend(v46, sel_setLowerBoundary_, v26);
              }
            }
            v27 = v46;
            objc_msgSend(v25, sel_setScore_, v46, v45);
            v28 = objc_allocWithZone(MEMORY[0x24BE95C78]);
            isa = UUID._bridgeToObjectiveC()().super.isa;
            v30 = objc_msgSend(v28, sel_initWithNSUUID_, isa);

            v31 = v45;
            objc_msgSend(v45, sel_setContextId_, v30);

            objc_msgSend(v31, sel_setEnded_, v25);
            v32 = objc_allocWithZone(MEMORY[0x24BE95C78]);
            v33 = UUID._bridgeToObjectiveC()().super.isa;
            v34 = objc_msgSend(v32, sel_initWithNSUUID_, v33);

            objc_msgSend(v21, sel_setIhId_, v34);
            objc_msgSend(v19, sel_setEventMetadata_, v21);
            objc_msgSend(v19, sel_setModelEvaluationContext_, v31);

            (*(void (**)(char *, uint64_t))(v48 + 8))(v15, v10);
            return v19;
          }

          v19 = v21;
          v35 = v45;
          v21 = v46;
        }
        else
        {
          v35 = v46;
        }

        v19 = v21;
        v21 = v35;
      }

      v19 = v21;
    }

  }
  if (one-time initialization token for defaultLogger != -1)
    swift_once();
  v36 = type metadata accessor for Logger();
  __swift_project_value_buffer(v36, (uint64_t)defaultLogger);
  v17(v13, (uint64_t)v15, v10);
  v37 = Logger.logObject.getter();
  v38 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v37, v38))
  {
    v39 = (uint8_t *)swift_slowAlloc();
    v40 = swift_slowAlloc();
    v50 = v40;
    *(_DWORD *)v39 = 136315138;
    lazy protocol witness table accessor for type MLModelMetadataKey and conformance MLModelMetadataKey((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v41 = dispatch thunk of CustomStringConvertible.description.getter();
    v49 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v41, v42, &v50);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v43 = *(void (**)(char *, uint64_t))(v48 + 8);
    v43(v13, v10);
    _os_log_impl(&dword_21FDE7000, v37, v38, "Unable to create FeatureExtraction started schemas for SELF for ihId: %s", v39, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207D560C](v40, -1, -1);
    MEMORY[0x2207D560C](v39, -1, -1);

  }
  else
  {

    v43 = *(void (**)(char *, uint64_t))(v48 + 8);
    v43(v13, v10);
  }
  v43(v15, v10);
  return 0;
}

void *specialized static IHProtoUtils.generateModelEvalFailure(loggingMetadata:contextId:errorCode:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t, uint64_t);
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  Class isa;
  id v23;
  id v24;
  Class v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  void (*v34)(char *, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v5 = type metadata accessor for UUID();
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v36 - v9;
  v37 = v11;
  v12 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v12((char *)&v36 - v9, a1, v5);
  v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95070]), sel_init);
  if (v13)
  {
    v14 = v13;
    v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95078]), sel_init);
    if (v15)
    {
      v16 = v15;
      v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95080]), sel_init);
      if (v17)
      {
        v18 = v17;
        v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95090]), sel_init);
        if (v19)
        {
          v20 = v19;
          objc_msgSend(v19, sel_setErrorCode_, a3);
          v21 = objc_allocWithZone(MEMORY[0x24BE95C78]);
          isa = UUID._bridgeToObjectiveC()().super.isa;
          v23 = objc_msgSend(v21, sel_initWithNSUUID_, isa);

          objc_msgSend(v18, sel_setContextId_, v23);
          objc_msgSend(v18, sel_setFailed_, v20);
          v24 = objc_allocWithZone(MEMORY[0x24BE95C78]);
          v25 = UUID._bridgeToObjectiveC()().super.isa;
          v26 = objc_msgSend(v24, sel_initWithNSUUID_, v25);

          objc_msgSend(v16, sel_setIhId_, v26);
          objc_msgSend(v14, sel_setEventMetadata_, v16);
          objc_msgSend(v14, sel_setModelEvaluationContext_, v18);

          (*(void (**)(char *, uint64_t))(v37 + 8))(v10, v5);
          return v14;
        }

        v14 = v16;
      }
      else
      {
        v18 = v16;
      }

      v14 = v18;
    }

  }
  if (one-time initialization token for defaultLogger != -1)
    swift_once();
  v27 = type metadata accessor for Logger();
  __swift_project_value_buffer(v27, (uint64_t)defaultLogger);
  v12(v8, (uint64_t)v10, v5);
  v28 = Logger.logObject.getter();
  v29 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = (uint8_t *)swift_slowAlloc();
    v31 = swift_slowAlloc();
    v39 = v31;
    *(_DWORD *)v30 = 136315138;
    lazy protocol witness table accessor for type MLModelMetadataKey and conformance MLModelMetadataKey((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v32 = dispatch thunk of CustomStringConvertible.description.getter();
    v38 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v32, v33, &v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v34 = *(void (**)(char *, uint64_t))(v37 + 8);
    v34(v8, v5);
    _os_log_impl(&dword_21FDE7000, v28, v29, "Unable to create FeatureExtraction started schemas for SELF for ihId: %s", v30, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207D560C](v31, -1, -1);
    MEMORY[0x2207D560C](v30, -1, -1);

  }
  else
  {

    v34 = *(void (**)(char *, uint64_t))(v37 + 8);
    v34(v8, v5);
  }
  v34(v10, v5);
  return 0;
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay23SiriInferredHelpfulness20FeaturedConversationCG_AF06GradedH0Vs5NeverOTg504_s23de52Helpfulness0bC9InferenceC18gradeConversationsSayAA18ih12VGyYaKFAfA08G9H0CXEfU0_AF0efN0CTf1cn_nTf4ng_n(unint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  _QWORD v21[2];
  char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = v2;
  v27 = a2;
  v5 = type metadata accessor for UUID();
  v23 = *(_QWORD *)(v5 - 8);
  v24 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v22 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62)
    goto LABEL_18;
  v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v8 = MEMORY[0x24BEE4AF8];
    if (!v7)
      return v8;
    v28 = MEMORY[0x24BEE4AF8];
    result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v7 & ~(v7 >> 63), 0);
    if (v7 < 0)
      break;
    v21[1] = v3;
    v10 = 0;
    v8 = v28;
    v25 = a1 & 0xC000000000000001;
    v26 = a1;
    while (v7 != v10)
    {
      if (v25)
      {
        v11 = MEMORY[0x2207D5048](v10, a1);
      }
      else
      {
        v11 = *(_QWORD *)(a1 + 8 * v10 + 32);
        swift_retain();
      }
      v12 = InferredHelpfulnessInference.gradeInteractionsInternal(_:)(*(_QWORD *)(v11 + 32));
      v3 = v12;
      if (v12[2])
      {
        v13 = v12[7];
        v14 = *(_QWORD *)(v13 + 24);
        v15 = *(_QWORD *)(v13 + 32);
        swift_bridgeObjectRetain();
      }
      else
      {
        v16 = v22;
        UUID.init()();
        v14 = UUID.uuidString.getter();
        v15 = v17;
        (*(void (**)(char *, uint64_t))(v23 + 8))(v16, v24);
      }
      swift_release();
      v28 = v8;
      v19 = *(_QWORD *)(v8 + 16);
      v18 = *(_QWORD *)(v8 + 24);
      if (v19 >= v18 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v18 > 1, v19 + 1, 1);
        v8 = v28;
      }
      ++v10;
      *(_QWORD *)(v8 + 16) = v19 + 1;
      v20 = (_QWORD *)(v8 + 24 * v19);
      v20[4] = v14;
      v20[5] = v15;
      v20[6] = v3;
      a1 = v26;
      if (v7 == v10)
        return v8;
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t specialized InferredHelpfulnessInference.generateInterTurnFeatures(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t inited;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void (*v16)(_BYTE *, _QWORD);
  _QWORD *v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  char *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v30;
  char *v31;
  _QWORD v33[2];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  _BYTE v44[32];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SequenceFeatureExtractor();
  inited = swift_initStackObject();
  *(_QWORD *)(inited + 16) = &outlined read-only object #0 of InferredHelpfulnessInference.generateInterTurnFeatures(_:);
  v40 = inited;
  v41 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62)
    goto LABEL_48;
  v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; v6 = _CocoaArrayWrapper.endIndex.getter())
  {
    v7 = 0;
    v42 = a1 & 0xC000000000000001;
    v8 = a1 & 0xFFFFFFFFFFFFFF8;
    v35 = (uint64_t *)(a1 + 32);
    v36 = a1 & 0xFFFFFFFFFFFFFF8;
    if (a1 < 0)
      v8 = a1;
    v33[1] = v8;
    v39 = v6;
    v37 = a1;
    v38 = v4;
    while (v42)
    {
      v17 = (_QWORD *)MEMORY[0x2207D5048](v7, a1);
      v18 = __OFADD__(v7++, 1);
      if (v18)
        goto LABEL_45;
LABEL_15:
      v19 = v17[4];
      v43 = v17[3];
      v20 = v17[5];
      outlined init with copy of UUID?((uint64_t)v17 + OBJC_IVAR____TtC23SiriInferredHelpfulness12FeaturedTurn_requestID, (uint64_t)v4);
      v21 = *(uint64_t (**)(uint64_t))(*v17 + 120);
      v22 = swift_bridgeObjectRetain();
      v23 = v21(v22);
      type metadata accessor for FeaturedTurnInternal(0);
      v24 = (_QWORD *)swift_allocObject();
      v25 = (char *)v24 + OBJC_IVAR____TtC23SiriInferredHelpfulness20FeaturedTurnInternal_index;
      *(_QWORD *)v25 = 0;
      v25[8] = 1;
      *(_QWORD *)((char *)v24 + OBJC_IVAR____TtC23SiriInferredHelpfulness20FeaturedTurnInternal_sortedFeaturedTurns) = a1;
      if (v41)
      {
        swift_bridgeObjectRetain_n();
        swift_retain();
        v4 = (char *)_CocoaArrayWrapper.endIndex.getter();
        if (!v4)
        {
LABEL_6:
          swift_bridgeObjectRelease();
          v9 = 0;
          v10 = 1;
          goto LABEL_7;
        }
      }
      else
      {
        v4 = *(char **)(v36 + 16);
        swift_bridgeObjectRetain_n();
        swift_retain();
        if (!v4)
          goto LABEL_6;
      }
      if (v42)
      {
        v26 = MEMORY[0x2207D5048](0, a1);
      }
      else
      {
        v26 = *v35;
        swift_retain();
      }
      if (*(_QWORD *)(v26 + 24) != v43 || *(_QWORD *)(v26 + 32) != v19)
      {
        v34 = v23;
        v27 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_release();
        if ((v27 & 1) != 0)
        {
          swift_bridgeObjectRelease();
          v9 = 0;
          goto LABEL_27;
        }
        if (v4 == (char *)1)
        {
LABEL_41:
          swift_bridgeObjectRelease();
          v9 = 0;
          v10 = 1;
        }
        else
        {
          a1 = 5;
          while (1)
          {
            v9 = a1 - 4;
            if (v42)
            {
              v28 = MEMORY[0x2207D5048](a1 - 4, v37);
            }
            else
            {
              v28 = *(_QWORD *)(v37 + 8 * a1);
              swift_retain();
            }
            if (*(_QWORD *)(v28 + 24) == v43 && *(_QWORD *)(v28 + 32) == v19)
            {
              a1 = v37;
              swift_bridgeObjectRelease();
              swift_release();
              goto LABEL_27;
            }
            v30 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_release();
            if ((v30 & 1) != 0)
              break;
            v31 = (char *)(a1 - 3);
            if (__OFADD__(v9, 1))
              goto LABEL_46;
            ++a1;
            if (v31 == v4)
            {
              a1 = v37;
              goto LABEL_41;
            }
          }
          a1 = v37;
          swift_bridgeObjectRelease();
LABEL_27:
          v10 = 0;
        }
        v4 = v38;
        v23 = v34;
        goto LABEL_8;
      }
      swift_bridgeObjectRelease();
      swift_release();
      v9 = 0;
      v10 = 0;
LABEL_7:
      v4 = v38;
LABEL_8:
      swift_beginAccess();
      *(_QWORD *)v25 = v9;
      v25[8] = v10;
      swift_release();
      v24[6] = 0;
      v24[7] = 0;
      v24[3] = v43;
      v24[4] = v19;
      v24[5] = v20;
      v11 = outlined init with take of UUID?((uint64_t)v4, (uint64_t)v24 + OBJC_IVAR____TtC23SiriInferredHelpfulness12FeaturedTurn_requestID);
      v24[2] = v23;
      v12 = (*(uint64_t (**)(uint64_t))(*v17 + 144))(v11);
      v14 = v13;
      swift_beginAccess();
      v24[6] = v12;
      v24[7] = v14;
      swift_bridgeObjectRelease();
      v15 = SequenceFeatureExtractor.extract(from:)((uint64_t)v24);
      v16 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*v17 + 136))(v44);
      specialized Array.append<A>(contentsOf:)(v15, MEMORY[0x24BEA53F8], &lazy protocol witness table cache variable for type [Feature] and conformance [A], &demangling cache variable for type metadata for [Feature], (uint64_t *)specialized protocol witness for Collection.subscript.read in conformance [A]);
      v16(v44, 0);
      swift_release();
      swift_release();
      if (v7 == v39)
        goto LABEL_49;
    }
    if (v7 >= *(_QWORD *)(v36 + 16))
      goto LABEL_47;
    v17 = (_QWORD *)v35[v7];
    swift_retain();
    v18 = __OFADD__(v7++, 1);
    if (!v18)
      goto LABEL_15;
LABEL_45:
    __break(1u);
LABEL_46:
    __break(1u);
LABEL_47:
    __break(1u);
LABEL_48:
    swift_bridgeObjectRetain();
  }
LABEL_49:
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_21FDF83E0()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in InferredHelpfulnessInference.gradeConversations()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;

  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *v8 = v4;
  v8[1] = partial apply for closure #1 in InferredHelpfulnessInference.gradeConversations();
  v8[7] = a3;
  v8[8] = v3;
  v8[5] = a1;
  v8[6] = a2;
  return swift_task_switch();
}

uint64_t partial apply for closure #1 in InferredHelpfulnessInference.gradeConversations()()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_21FDF84C0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed @Sendable @async (@in_guaranteed Conversation, @guaranteed StreamBookmark?) -> (@out Conversation)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int *v6;
  _QWORD *v7;

  v6 = *(int **)(v2 + 16);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = partial apply for closure #1 in AsyncSequence.flatMap<A>(_:);
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&async function pointer to thunk for @escaping @callee_guaranteed @Sendable @async (@in_guaranteed Conversation, @guaranteed StreamBookmark?) -> (@out Conversation)
                                                          + async function pointer to thunk for @escaping @callee_guaranteed @Sendable @async (@in_guaranteed Conversation, @guaranteed StreamBookmark?) -> (@out Conversation)))(a1, a2, v6);
}

uint64_t specialized InferredHelpfulnessInference.generateInterTurnFeaturesForConversation(_:)(uint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(void);
  uint64_t v10;
  uint64_t v11;
  char v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v28;
  uint64_t v29;

  v28 = MEMORY[0x24BEE4AF8];
  v29 = MEMORY[0x24BEE4AF8];
  v1 = specialized InferredHelpfulnessInference.generateInterTurnFeatures(_:)(a1);
  v2 = v1;
  if (v1 >> 62)
  {
LABEL_38:
    swift_bridgeObjectRetain();
    v3 = _CocoaArrayWrapper.endIndex.getter();
    if (v3)
      goto LABEL_3;
  }
  else
  {
    v3 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
    {
LABEL_3:
      if (v3 >= 1)
      {
        v4 = 0;
        v5 = 0;
        v6 = 0;
        v7 = v2 & 0xC000000000000001;
        while (1)
        {
          if (v7)
          {
            v8 = MEMORY[0x2207D5048](v6, v2);
          }
          else
          {
            v8 = *(_QWORD *)(v2 + 8 * v6 + 32);
            swift_retain();
          }
          v9 = *(uint64_t (**)(void))(*(_QWORD *)v8 + 144);
          v10 = v9();
          if (v11)
          {
            if (v5)
            {
              if (v10 == v4 && v11 == v5)
              {
                swift_bridgeObjectRelease();
                goto LABEL_32;
              }
              v13 = _stringCompareWithSmolCheck(_:_:expecting:)();
              swift_bridgeObjectRelease();
              if ((v13 & 1) != 0)
                goto LABEL_32;
            }
          }
          else if (!v5)
          {
            goto LABEL_32;
          }
          v14 = swift_bridgeObjectRelease();
          v4 = ((uint64_t (*)(uint64_t))v9)(v14);
          v5 = v15;
          if (v28 >> 62)
          {
            swift_bridgeObjectRetain();
            v22 = _CocoaArrayWrapper.endIndex.getter();
            swift_bridgeObjectRelease();
            if (v22)
            {
LABEL_19:
              type metadata accessor for FeaturedConversation();
              v16 = (_QWORD *)swift_allocObject();
              v16[4] = v28;
              if (v28 >> 62)
              {
                swift_bridgeObjectRetain();
                if (_CocoaArrayWrapper.endIndex.getter())
                  goto LABEL_21;
              }
              else
              {
                v17 = *(_QWORD *)((v28 & 0xFFFFFFFFFFFFF8) + 0x10);
                swift_bridgeObjectRetain();
                if (v17)
                {
LABEL_21:
                  if ((v28 & 0xC000000000000001) != 0)
                  {
                    v24 = MEMORY[0x2207D5048](0, v28);
                    swift_bridgeObjectRelease();
                    v20 = *(_QWORD *)(v24 + 24);
                    v19 = *(_QWORD *)(v24 + 32);
                    swift_bridgeObjectRetain();
                    v21 = swift_unknownObjectRelease();
                  }
                  else
                  {
                    if (!*(_QWORD *)((v28 & 0xFFFFFFFFFFFFF8) + 0x10))
                    {
                      __break(1u);
                      goto LABEL_38;
                    }
                    v18 = *(_QWORD *)(v28 + 32);
                    swift_retain();
                    swift_bridgeObjectRelease();
                    v20 = *(_QWORD *)(v18 + 24);
                    v19 = *(_QWORD *)(v18 + 32);
                    swift_bridgeObjectRetain();
                    v21 = swift_release();
                  }
                  goto LABEL_29;
                }
              }
              v21 = swift_bridgeObjectRelease();
              v20 = 0;
              v19 = 0;
LABEL_29:
              v16[2] = v20;
              v16[3] = v19;
              MEMORY[0x2207D4EB0](v21);
              if (*(_QWORD *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
                specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
              specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
              specialized Array._endMutation()();
              v28 = MEMORY[0x24BEE4AF8];
              v7 = v2 & 0xC000000000000001;
            }
          }
          else if (*(_QWORD *)((v28 & 0xFFFFFFFFFFFFF8) + 0x10))
          {
            goto LABEL_19;
          }
LABEL_32:
          v23 = swift_retain();
          MEMORY[0x2207D4EB0](v23);
          if (*(_QWORD *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
          ++v6;
          specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized Array._endMutation()();
          swift_release();
          if (v3 == v6)
          {
            swift_bridgeObjectRelease();
            v25 = v28;
            goto LABEL_40;
          }
        }
      }
      __break(1u);
      goto LABEL_48;
    }
  }
  swift_bridgeObjectRelease();
  v25 = MEMORY[0x24BEE4AF8];
LABEL_40:
  swift_bridgeObjectRelease();
  if (!(v25 >> 62))
  {
    if (*(_QWORD *)((v25 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_42;
LABEL_45:
    swift_bridgeObjectRelease();
    return v29;
  }
  swift_bridgeObjectRetain();
  v26 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v26)
    goto LABEL_45;
LABEL_42:
  type metadata accessor for FeaturedConversation();
  swift_allocObject();
  FeaturedConversation.init(_:)(v25);
  MEMORY[0x2207D4EB0]();
  if (*(_QWORD *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
LABEL_48:
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  return v29;
}

uint64_t outlined init with copy of StreamBookmarkStore(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_21FDF89EC()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  swift_release();
  return swift_deallocObject();
}

uint64_t outlined init with take of StreamBookmarkStore(__int128 *a1, uint64_t a2)
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

void partial apply for closure #3 in InferredHelpfulnessInference.gradeConversations()()
{
  uint64_t v0;

  closure #3 in InferredHelpfulnessInference.gradeConversations()((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 56));
}

uint64_t partial apply for closure #1 in AsyncSequence.flatMap<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  v6 = *(_QWORD *)(v2 + 24);
  v7 = swift_task_alloc();
  v8 = *(_OWORD *)(v2 + 40);
  *(_QWORD *)(v3 + 16) = v7;
  *(_QWORD *)v7 = v3;
  *(_QWORD *)(v7 + 8) = partial apply for closure #1 in AsyncSequence.flatMap<A>(_:);
  *(_QWORD *)(v7 + 56) = v6;
  *(_OWORD *)(v7 + 40) = v8;
  *(_QWORD *)(v7 + 24) = a1;
  *(_QWORD *)(v7 + 32) = a2;
  return swift_task_switch();
}

uint64_t partial apply for closure #1 in AsyncSequence.collect()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = partial apply for closure #1 in InferredHelpfulnessInference.gradeConversations();
  return closure #1 in AsyncSequence.collect()(a1, a2);
}

uint64_t sub_21FDF8B20@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 136))();
  *a2 = result;
  return result;
}

uint64_t sub_21FDF8B50(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))(**(_QWORD **)a2 + 144);
  v3 = swift_retain();
  return v2(v3);
}

uint64_t sub_21FDF8B80@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 160))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_21FDF8BB0(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v2 = *a1;
  v3 = a1[1];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(_QWORD **)a2 + 168);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t sub_21FDF8BF4@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 184))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_21FDF8C28(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 192))(*a1);
}

uint64_t sub_21FDF8C54@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 208))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_21FDF8C84(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v2 = *a1;
  v3 = a1[1];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(_QWORD **)a2 + 216);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t sub_21FDF8CC8@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 232))();
  *a2 = result;
  return result;
}

uint64_t sub_21FDF8CF8(unsigned int *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 240))(*a1);
}

uint64_t sub_21FDF8D24@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 256))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_21FDF8D54(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v2 = *a1;
  v3 = a1[1];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(_QWORD **)a2 + 264);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

void sub_21FDF8D98(uint64_t a1@<X0>, double *a2@<X8>)
{
  *a2 = (*(double (**)(void))(**(_QWORD **)a1 + 280))();
}

uint64_t sub_21FDF8DC8(double *a1, uint64_t a2)
{
  return (*(uint64_t (**)(double))(**(_QWORD **)a2 + 288))(*a1);
}

uint64_t method lookup function for InferredHelpfulnessInference()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.classifier.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.classifier.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.classifier.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.modelVersionString.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.modelVersionString.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.modelVersionString.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.emitSelfLogs.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.emitSelfLogs.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.emitSelfLogs.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.streamBookmarkName.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.streamBookmarkName.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.streamBookmarkName.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.failEval.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.failEval.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.failEval.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.nullModelVersion.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.nullModelVersion.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.nullModelVersion.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.failIHScore.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.failIHScore.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.failIHScore.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.__allocating_init(streamBookmarkName:emitSelfLogs:trialProvider:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 304))();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.gradeInteractions()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 312) + *(_QWORD *)(*(_QWORD *)v0 + 312));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = dispatch thunk of InferredHelpfulnessInference.gradeInteractions();
  return v4();
}

uint64_t dispatch thunk of InferredHelpfulnessInference.gradeInteractions()(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t dispatch thunk of InferredHelpfulnessInference.gradeConversations()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 320) + *(_QWORD *)(*(_QWORD *)v0 + 320));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = dispatch thunk of InferredHelpfulnessInference.gradeConversations();
  return v4();
}

_QWORD *specialized InferredHelpfulnessInference.generateIntraTurnFeature(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint8_t *v8;
  _QWORD *v9;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD v22[2];
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;

  v0 = type metadata accessor for UUID();
  v24 = *(_QWORD *)(v0 - 8);
  v25 = v0;
  MEMORY[0x24BDAC7A8](v0);
  v23 = (char *)v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = MEMORY[0x24BEE4AF8];
  if (one-time initialization token for selfFeatureExtractors != -1)
    swift_once();
  v2 = static InferredHelpfulnessInference.selfFeatureExtractors;
  if ((unint64_t)static InferredHelpfulnessInference.selfFeatureExtractors >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = _CocoaArrayWrapper.endIndex.getter();
    if (v3)
    {
LABEL_5:
      if (v3 < 1)
      {
        __break(1u);
        goto LABEL_23;
      }
      v4 = 0;
      do
      {
        if ((v2 & 0xC000000000000001) != 0)
        {
          v5 = MEMORY[0x2207D5048](v4, v2);
        }
        else
        {
          v5 = *(_QWORD *)(v2 + 8 * v4 + 32);
          swift_retain();
        }
        ++v4;
        Turn.events.getter();
        v6 = (*(uint64_t (**)(void))(*(_QWORD *)v5 + 80))();
        swift_bridgeObjectRelease();
        specialized Array.append<A>(contentsOf:)(v6, MEMORY[0x24BEA53F8], &lazy protocol witness table cache variable for type [Feature] and conformance [A], &demangling cache variable for type metadata for [Feature], (uint64_t *)specialized protocol witness for Collection.subscript.read in conformance [A]);
        swift_release();
      }
      while (v3 != v4);
      swift_bridgeObjectRelease();
      v7 = v28;
      if (!(v28 >> 62))
        goto LABEL_12;
LABEL_16:
      swift_bridgeObjectRetain();
      v11 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v11)
        goto LABEL_13;
      goto LABEL_17;
    }
  }
  else
  {
    v3 = *(_QWORD *)((static InferredHelpfulnessInference.selfFeatureExtractors & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
      goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  v7 = MEMORY[0x24BEE4AF8];
  if (MEMORY[0x24BEE4AF8] >> 62)
    goto LABEL_16;
LABEL_12:
  if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_13:
    type metadata accessor for FeaturedTurn(0);
    v8 = (uint8_t *)Turn.events.getter();
    v9 = static FeaturedTurn.from(events:features:)(v8, v7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v9;
  }
LABEL_17:
  swift_bridgeObjectRelease();
  if (one-time initialization token for defaultLogger != -1)
LABEL_23:
    swift_once();
  v12 = type metadata accessor for Logger();
  __swift_project_value_buffer(v12, (uint64_t)defaultLogger);
  swift_retain_n();
  v13 = Logger.logObject.getter();
  v14 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v27 = v16;
    *(_DWORD *)v15 = 136315138;
    v22[1] = v15 + 4;
    v17 = v23;
    Turn.turnID.getter();
    lazy protocol witness table accessor for type MLModelMetadataKey and conformance MLModelMetadataKey((unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v18 = v25;
    v19 = dispatch thunk of CustomStringConvertible.description.getter();
    v21 = v20;
    (*(void (**)(char *, uint64_t))(v24 + 8))(v17, v18);
    v26 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v19, v21, &v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21FDE7000, v13, v14, "No features found for turn %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207D560C](v16, -1, -1);
    MEMORY[0x2207D560C](v15, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  return 0;
}

uint64_t partial apply for closure #1 in InferredHelpfulnessInference.generateIntraTurnFeaturesForConversation(_:)@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);

  v5 = *(_QWORD *)(v2 + 16);
  v4 = *(_QWORD *)(v2 + 24);
  v6 = *a1;
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)*a1 + 152);
  swift_bridgeObjectRetain();
  v7(v5, v4);
  *a2 = v6;
  return swift_retain();
}

uint64_t outlined init with copy of UUID?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of ImmutableLoggingMetadata(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ImmutableLoggingMetadata();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *partial apply for closure #4 in InferredHelpfulnessInference.gradeInteractionsInternal(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = (*(uint64_t (**)(void))(**(_QWORD **)(v0 + 32) + 232))();
  return specialized static IHProtoUtils.generateModelEvalFailure(loggingMetadata:contextId:errorCode:)(v1, v2, v3);
}

uint64_t outlined consume of GradedInteraction?(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void *partial apply for closure #3 in InferredHelpfulnessInference.gradeInteractionsInternal(_:)()
{
  uint64_t v0;

  return specialized static IHProtoUtils.generateModelEvalEnd(loggingMetadata:contextId:ihScoreData:)(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_BYTE *)(v0 + 40) & 1 | ((unint64_t)*(unsigned int *)(v0 + 44) << 32), *(unsigned __int8 *)(v0 + 48));
}

void *partial apply for closure #1 in InferredHelpfulnessInference.gradeInteractionsInternal(_:)()
{
  uint64_t v0;

  return specialized static IHProtoUtils.generateRequestLink(loggingMetadata:)(*(_QWORD *)(v0 + 16));
}

void *partial apply for closure #2 in InferredHelpfulnessInference.gradeInteractionsInternal(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = (*(uint64_t (**)(void))(**(_QWORD **)(v0 + 32) + 160))();
  v5 = specialized static IHProtoUtils.generateModelEvalStart(loggingMetadata:contextId:modelId:)(v1, v2, v3, v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t outlined destroy of Any?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t outlined init with take of UUID?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t lazy protocol witness table accessor for type AnyAsyncSequence<Turn> and conformance AnyAsyncSequence<A>(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2207D5564](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void one-time initialization function for nullString()
{
  static CATUtils.nullString = 1819047246;
  *(_QWORD *)algn_255580468 = 0xE400000000000000;
}

uint64_t *CATUtils.nullString.unsafeMutableAddressor()
{
  if (one-time initialization token for nullString != -1)
    swift_once();
  return &static CATUtils.nullString;
}

uint64_t static CATUtils.nullString.getter()
{
  return static CATUtils.nullString.getter(&one-time initialization token for nullString, &static CATUtils.nullString);
}

uint64_t one-time initialization function for catIdDefault(uint64_t a1)
{
  return one-time initialization function for catIdDefault(a1, &static CATUtils.catIdDefault, algn_255580478);
}

uint64_t *CATUtils.catIdDefault.unsafeMutableAddressor()
{
  if (one-time initialization token for catIdDefault != -1)
    swift_once();
  return &static CATUtils.catIdDefault;
}

uint64_t static CATUtils.catIdDefault.getter()
{
  return static CATUtils.nullString.getter(&one-time initialization token for catIdDefault, &static CATUtils.catIdDefault);
}

uint64_t static CATUtils.nullString.getter(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t one-time initialization function for speakeasyCategoryDefault(uint64_t a1)
{
  return one-time initialization function for catIdDefault(a1, &static CATUtils.speakeasyCategoryDefault, algn_255580488);
}

uint64_t one-time initialization function for catIdDefault(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v5;

  if (one-time initialization token for nullString != -1)
    swift_once();
  v5 = *(_QWORD *)algn_255580468;
  *a2 = static CATUtils.nullString;
  *a3 = v5;
  return swift_bridgeObjectRetain();
}

uint64_t *CATUtils.speakeasyCategoryDefault.unsafeMutableAddressor()
{
  if (one-time initialization token for speakeasyCategoryDefault != -1)
    swift_once();
  return &static CATUtils.speakeasyCategoryDefault;
}

uint64_t static CATUtils.speakeasyCategoryDefault.getter()
{
  return static CATUtils.nullString.getter(&one-time initialization token for speakeasyCategoryDefault, &static CATUtils.speakeasyCategoryDefault);
}

void one-time initialization function for dialogIdTokenSeparator()
{
  static CATUtils.dialogIdTokenSeparator = 35;
  *(_QWORD *)algn_255580498 = 0xE100000000000000;
}

uint64_t *CATUtils.dialogIdTokenSeparator.unsafeMutableAddressor()
{
  if (one-time initialization token for dialogIdTokenSeparator != -1)
    swift_once();
  return &static CATUtils.dialogIdTokenSeparator;
}

uint64_t static CATUtils.dialogIdTokenSeparator.getter()
{
  return static CATUtils.nullString.getter(&one-time initialization token for dialogIdTokenSeparator, &static CATUtils.dialogIdTokenSeparator);
}

void *CATUtils.numCatIdTokens.unsafeMutableAddressor()
{
  return &static CATUtils.numCatIdTokens;
}

uint64_t static CATUtils.numCatIdTokens.getter()
{
  return 2;
}

uint64_t static CATUtils.speakeasyCategory(from:by:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  char v7;
  uint64_t *v8;
  uint64_t v9;

  if (*(_QWORD *)(a3 + 16))
  {
    swift_bridgeObjectRetain();
    v6 = specialized __RawDictionaryStorage.find<A>(_:)(a1, a2);
    if ((v7 & 1) != 0)
    {
      v8 = (uint64_t *)(*(_QWORD *)(a3 + 56) + 16 * v6);
    }
    else
    {
      if (one-time initialization token for speakeasyCategoryDefault != -1)
        swift_once();
      v8 = &static CATUtils.speakeasyCategoryDefault;
    }
    v9 = *v8;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    if (one-time initialization token for speakeasyCategoryDefault != -1)
      swift_once();
    v9 = static CATUtils.speakeasyCategoryDefault;
    swift_bridgeObjectRetain();
  }
  return v9;
}

uint64_t CATUtils.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t CATUtils.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t CATUtils.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t CATUtils.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t specialized static CATUtils.classAndUseCase(from:lowercased:)(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t countAndFlagsBits;

  v3 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v3 = a1 & 0xFFFFFFFFFFFFLL;
  if (v3)
  {
    if (one-time initialization token for dialogIdTokenSeparator != -1)
      swift_once();
    lazy protocol witness table accessor for type String and conformance String();
    StringProtocol.components<A>(separatedBy:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ArraySlice<String>);
    lazy protocol witness table accessor for type ArraySlice<String> and conformance ArraySlice<A>();
    countAndFlagsBits = BidirectionalCollection<>.joined(separator:)();
    swift_bridgeObjectRelease();
    if ((a3 & 1) != 0)
    {
      countAndFlagsBits = String.lowercased()()._countAndFlagsBits;
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    if (one-time initialization token for catIdDefault != -1)
      swift_once();
    countAndFlagsBits = static CATUtils.catIdDefault;
    swift_bridgeObjectRetain();
  }
  return countAndFlagsBits;
}

unint64_t specialized static CATUtils.catIdToSpeakeasyCategory(_:)()
{
  unint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  Class isa;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16[5];

  v16[4] = *(id *)MEMORY[0x24BDAC8D0];
  v0 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x24BEE4AF8]);
  v6 = Data.init(contentsOf:options:)();
  v8 = v7;
  v9 = (void *)objc_opt_self();
  isa = Data._bridgeToObjectiveC()().super.isa;
  v16[0] = 0;
  v11 = objc_msgSend(v9, sel_JSONObjectWithData_options_error_, isa, 1, v16);

  if (v11)
  {
    v12 = v16[0];
    _bridgeAnyObjectToAny(_:)();
    outlined consume of Data._Representation(v6, v8);
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : String]);
    if (swift_dynamicCast())
    {
      swift_bridgeObjectRelease();
      return v15;
    }
  }
  else
  {
    v13 = v16[0];
    v14 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
    outlined consume of Data._Representation(v6, v8);
    if (one-time initialization token for defaultLogger != -1)
      swift_once();
    v1 = type metadata accessor for Logger();
    __swift_project_value_buffer(v1, (uint64_t)defaultLogger);
    v2 = Logger.logObject.getter();
    v3 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_21FDE7000, v2, v3, "Unable to parse CatIdToSpeakeasyCategory", v4, 2u);
      MEMORY[0x2207D560C](v4, -1, -1);
    }

  }
  return v0;
}

unint64_t specialized static CATUtils.catIdToSpeakeasyCategory(bundle:trialProvider:)(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint8_t *v17;
  void *v18;
  uint8_t *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  id v23;
  char *v24;
  void (*v25)(char *, char *, uint64_t);
  NSObject *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  _QWORD *v30;
  NSObject *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  void *v39;
  Class isa;
  id v41;
  id v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  id v51[5];

  v51[4] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for URL();
  v8 = *(char **)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v49 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v45 - v11;
  specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x24BEE4AF8]);
  swift_bridgeObjectRelease();
  if (one-time initialization token for defaultLogger != -1)
    swift_once();
  v13 = type metadata accessor for Logger();
  v48 = __swift_project_value_buffer(v13, (uint64_t)defaultLogger);
  v14 = Logger.logObject.getter();
  v15 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v14, v15))
  {
    v47 = v6;
    v16 = swift_slowAlloc();
    v46 = a2;
    v17 = (uint8_t *)v16;
    v18 = (void *)swift_slowAlloc();
    v51[0] = v18;
    *(_DWORD *)v17 = 136315138;
    v50 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000019, 0x800000021FE10F00, (uint64_t *)v51);
    v6 = v47;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_21FDE7000, v14, v15, "Loading CatIdToSpeakeasyCategory from Trial %s", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207D560C](v18, -1, -1);
    v19 = v17;
    a2 = v46;
    MEMORY[0x2207D560C](v19, -1, -1);
  }

  v20 = (*(uint64_t (**)(void))(*(_QWORD *)a2 + 224))();
  if (!*(_QWORD *)(v20 + 16))
  {
    v21 = (void *)MEMORY[0x2207D4DFC](0xD000000000000018, 0x800000021FE10EE0);
    v22 = (void *)MEMORY[0x2207D4DFC](1852797802, 0xE400000000000000);
    v23 = objc_msgSend(a1, sel_URLForResource_withExtension_, v21, v22);

    if (v23)
    {
      v24 = v49;
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      v25 = (void (*)(char *, char *, uint64_t))*((_QWORD *)v8 + 4);
      v25(v6, v24, v7);
      (*((void (**)(char *, _QWORD, uint64_t, uint64_t))v8 + 7))(v6, 0, 1, v7);
      if ((*((unsigned int (**)(char *, uint64_t, uint64_t))v8 + 6))(v6, 1, v7) != 1)
      {
        swift_bridgeObjectRelease();
        v25(v12, v6, v7);
        v26 = a1;
        v27 = Logger.logObject.getter();
        v28 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v27, v28))
        {
          v29 = (uint8_t *)swift_slowAlloc();
          v30 = (_QWORD *)swift_slowAlloc();
          v49 = (char *)v7;
          v47 = v8;
          *(_DWORD *)v29 = 138412290;
          v51[0] = v26;
          v31 = v26;
          v8 = v47;
          v7 = (uint64_t)v49;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *v30 = v26;

          _os_log_impl(&dword_21FDE7000, v27, v28, "Loading CatIdToSpeakeasyCategory mapping from Bundle %@", v29, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
          swift_arrayDestroy();
          MEMORY[0x2207D560C](v30, -1, -1);
          MEMORY[0x2207D560C](v29, -1, -1);
        }
        else
        {

          v27 = v26;
        }

        v20 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x24BEE4AF8]);
        v36 = Data.init(contentsOf:options:)();
        v38 = v37;
        v39 = (void *)objc_opt_self();
        isa = Data._bridgeToObjectiveC()().super.isa;
        v51[0] = 0;
        v41 = objc_msgSend(v39, sel_JSONObjectWithData_options_error_, isa, 1, v51);

        if (v41)
        {
          v42 = v51[0];
          _bridgeAnyObjectToAny(_:)();
          outlined consume of Data._Representation(v36, v38);
          swift_unknownObjectRelease();
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : String]);
          if ((swift_dynamicCast() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            v20 = v50;
          }
        }
        else
        {
          v43 = v51[0];
          v44 = (void *)_convertNSErrorToError(_:)();

          swift_willThrow();
          outlined consume of Data._Representation(v36, v38);
          v32 = Logger.logObject.getter();
          v33 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v32, v33))
          {
            v34 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v34 = 0;
            _os_log_impl(&dword_21FDE7000, v32, v33, "Unable to parse CatIdToSpeakeasyCategory", v34, 2u);
            MEMORY[0x2207D560C](v34, -1, -1);
          }

        }
        (*((void (**)(char *, uint64_t))v8 + 1))(v12, v7);
        return v20;
      }
    }
    else
    {
      (*((void (**)(char *, uint64_t, uint64_t, uint64_t))v8 + 7))(v6, 1, 1, v7);
    }
    outlined destroy of URL?((uint64_t)v6);
  }
  return v20;
}

uint64_t type metadata accessor for CATUtils()
{
  return objc_opt_self();
}

uint64_t method lookup function for CATUtils()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CATUtils.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

unint64_t lazy protocol witness table accessor for type ArraySlice<String> and conformance ArraySlice<A>()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type ArraySlice<String> and conformance ArraySlice<A>;
  if (!lazy protocol witness table cache variable for type ArraySlice<String> and conformance ArraySlice<A>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for ArraySlice<String>);
    result = MEMORY[0x2207D5564](MEMORY[0x24BEE2170], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ArraySlice<String> and conformance ArraySlice<A>);
  }
  return result;
}

uint64_t outlined destroy of URL?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ImmutableLoggingMetadata.init(ihID:requestID:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;

  v6 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a3, a1, v6);
  v7 = a3 + *(int *)(type metadata accessor for ImmutableLoggingMetadata() + 20);
  return outlined init with take of UUID?(a2, v7);
}

uint64_t type metadata accessor for ImmutableLoggingMetadata()
{
  uint64_t result;

  result = type metadata singleton initialization cache for ImmutableLoggingMetadata;
  if (!type metadata singleton initialization cache for ImmutableLoggingMetadata)
    return swift_getSingletonMetadata();
  return result;
}

void *static IHProtoUtils.generateRequestLink(loggingMetadata:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = a1[3];
  v3 = a1[4];
  v4 = __swift_project_boxed_opaque_existential_1(a1, v2);
  return specialized static IHProtoUtils.generateRequestLink(loggingMetadata:)((uint64_t)v4, v1, v2, v3);
}

void *static IHProtoUtils.generateModelEvalStart(loggingMetadata:contextId:modelId:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v8 = a1[3];
  v9 = a1[4];
  v10 = __swift_project_boxed_opaque_existential_1(a1, v8);
  return specialized static IHProtoUtils.generateModelEvalStart(loggingMetadata:contextId:modelId:)((uint64_t)v10, a2, a3, a4, v4, v8, v9);
}

void __swiftcall IHProtoUtils.IHScores.init(score:)(SiriInferredHelpfulness::IHProtoUtils::IHScores *__return_ptr retstr, Swift::Float score)
{
  ;
}

void *static IHProtoUtils.generateModelEvalEnd(loggingMetadata:contextId:ihScoreData:)(_QWORD *a1, char *a2, uint64_t a3, uint64_t a4, __int16 a5)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v10 = a1[3];
  v11 = a1[4];
  v12 = __swift_project_boxed_opaque_existential_1(a1, v10);
  return specialized static IHProtoUtils.generateModelEvalEnd(loggingMetadata:contextId:ihScoreData:)((uint64_t)v12, a2, a3, a4, a5 & 0x1FF, v5, v10, v11);
}

void *static IHProtoUtils.generateModelEvalFailure(loggingMetadata:contextId:errorCode:)(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = a1[3];
  v7 = a1[4];
  v8 = __swift_project_boxed_opaque_existential_1(a1, v6);
  return specialized static IHProtoUtils.generateModelEvalFailure(loggingMetadata:contextId:errorCode:)((uint64_t)v8, a2, a3, v3, v6, v7);
}

uint64_t ImmutableLoggingMetadata.ihID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for UUID();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t ImmutableLoggingMetadata.requestID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for ImmutableLoggingMetadata() + 20);
  return outlined init with copy of UUID?(v3, a1);
}

uint64_t protocol witness for LoggingMetadata.ihID.getter in conformance ImmutableLoggingMetadata@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for UUID();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t protocol witness for LoggingMetadata.requestID.getter in conformance ImmutableLoggingMetadata@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return outlined init with copy of UUID?(v2 + *(int *)(a1 + 20), a2);
}

void IHProtoUtils.IHScores.score.setter(float a1)
{
  float *v1;

  *v1 = a1;
}

uint64_t (*IHProtoUtils.IHScores.score.modify())()
{
  return FlowClientFeatureExtractor.__ivar_destroyer;
}

unint64_t IHProtoUtils.IHScores.lower.getter(unsigned int a1, char a2)
{
  return a1 | ((unint64_t)(a2 & 1) << 32);
}

uint64_t IHProtoUtils.IHScores.lower.setter(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 4) = result;
  *(_BYTE *)(v1 + 8) = BYTE4(result) & 1;
  return result;
}

uint64_t (*IHProtoUtils.IHScores.lower.modify())()
{
  return FlowClientFeatureExtractor.__ivar_destroyer;
}

uint64_t IHProtoUtils.IHScores.upper.getter(uint64_t a1, uint64_t a2, char a3)
{
  __int128 v4;

  *((_QWORD *)&v4 + 1) = a3 & 1;
  *(_QWORD *)&v4 = a2;
  return v4 >> 32;
}

uint64_t IHProtoUtils.IHScores.upper.setter(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 12) = result;
  *(_BYTE *)(v1 + 16) = BYTE4(result) & 1;
  return result;
}

uint64_t (*IHProtoUtils.IHScores.upper.modify())()
{
  return FlowClientFeatureExtractor.__ivar_destroyer;
}

void __swiftcall IHProtoUtils.IHScores.init(score:upper:lower:)(SiriInferredHelpfulness::IHProtoUtils::IHScores *__return_ptr retstr, Swift::Float score, Swift::Float upper, Swift::Float lower)
{
  ;
}

uint64_t IHProtoUtils.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t IHProtoUtils.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t IHProtoUtils.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t IHProtoUtils.init()()
{
  uint64_t v0;

  return v0;
}

void *specialized static IHProtoUtils.generateRequestLink(loggingMetadata:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  Class isa;
  id v34;
  id v35;
  Class v36;
  id v37;
  void (*v38)(char *, uint64_t);
  uint64_t v39;
  void (*v40)(char *, char *, uint64_t);
  NSObject *v41;
  os_log_type_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  void (*v48)(char *, uint64_t);
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  void (*v52)(char *, uint64_t);
  uint64_t v54;
  int v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for UUID();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v54 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v54 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v54 - v20;
  (*(void (**)(uint64_t, uint64_t))(a4 + 8))(a3, a4);
  (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a3, a4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    outlined destroy of UUID?((uint64_t)v8);
    if (one-time initialization token for defaultLogger != -1)
      swift_once();
    v22 = type metadata accessor for Logger();
    __swift_project_value_buffer(v22, (uint64_t)defaultLogger);
    v23 = Logger.logObject.getter();
    v24 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_21FDE7000, v23, v24, "Unable to emit RequestLink for SELF as RequestId is not present in the logging metadata", v25, 2u);
      MEMORY[0x2207D560C](v25, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v10 + 8))(v21, v9);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v19, v8, v9);
  v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95B60]), sel_init);
  if (!v26)
  {
LABEL_14:
    if (one-time initialization token for defaultLogger != -1)
      swift_once();
    v39 = type metadata accessor for Logger();
    __swift_project_value_buffer(v39, (uint64_t)defaultLogger);
    v40 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
    v40(v16, v21, v9);
    v40(v13, v19, v9);
    v41 = Logger.logObject.getter();
    v42 = static os_log_type_t.error.getter();
    v43 = v42;
    if (os_log_type_enabled(v41, v42))
    {
      v44 = swift_slowAlloc();
      v56 = swift_slowAlloc();
      v59 = v56;
      *(_DWORD *)v44 = 136315394;
      v54 = v44 + 4;
      lazy protocol witness table accessor for type UUID and conformance UUID();
      v55 = v43;
      v45 = dispatch thunk of CustomStringConvertible.description.getter();
      v47 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v45, v46, &v59);
      v57 = v21;
      v58 = v47;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v48 = *(void (**)(char *, uint64_t))(v10 + 8);
      v48(v16, v9);
      *(_WORD *)(v44 + 12) = 2080;
      v49 = dispatch thunk of CustomStringConvertible.description.getter();
      v58 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v49, v50, &v59);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v48(v13, v9);
      _os_log_impl(&dword_21FDE7000, v41, (os_log_type_t)v55, "Unable to create RequestLink schemas for SELF for ihId: %s, and requestId: %s", (uint8_t *)v44, 0x16u);
      v51 = v56;
      swift_arrayDestroy();
      MEMORY[0x2207D560C](v51, -1, -1);
      MEMORY[0x2207D560C](v44, -1, -1);

      v48(v19, v9);
      v48(v57, v9);
    }
    else
    {

      v52 = *(void (**)(char *, uint64_t))(v10 + 8);
      v52(v13, v9);
      v52(v16, v9);
      v52(v19, v9);
      v52(v21, v9);
    }
    return 0;
  }
  v27 = v26;
  v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95B68]), sel_init);
  if (!v28)
  {
    v29 = v27;
LABEL_13:

    goto LABEL_14;
  }
  v29 = v28;
  v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95B68]), sel_init);
  if (!v30)
  {

    goto LABEL_13;
  }
  v31 = v30;
  v32 = objc_allocWithZone(MEMORY[0x24BE95C78]);
  isa = UUID._bridgeToObjectiveC()().super.isa;
  v34 = objc_msgSend(v32, sel_initWithNSUUID_, isa);

  objc_msgSend(v29, sel_setUuid_, v34);
  v57 = v21;
  objc_msgSend(v29, sel_setComponent_, 10);
  v35 = objc_allocWithZone(MEMORY[0x24BE95C78]);
  v36 = UUID._bridgeToObjectiveC()().super.isa;
  v37 = objc_msgSend(v35, sel_initWithNSUUID_, v36);

  objc_msgSend(v31, sel_setUuid_, v37);
  objc_msgSend(v31, sel_setComponent_, 1);
  objc_msgSend(v27, sel_setSource_, v29);
  objc_msgSend(v27, sel_setTarget_, v31);

  v38 = *(void (**)(char *, uint64_t))(v10 + 8);
  v38(v19, v9);
  v38(v57, v9);
  return v27;
}

void *specialized static IHProtoUtils.generateModelEvalStart(loggingMetadata:contextId:modelId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11;
  void (**v12)(char *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  char *v29;
  void (**v30)(char *, uint64_t);
  os_log_type_t v31;
  uint64_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  void (*v37)(char *, uint64_t);
  char *v38;
  void *v40;
  id v41;
  Class isa;
  id v43;
  id v44;
  Class v45;
  id v46;
  uint64_t v47;
  void (**v48)(char *, uint64_t);
  uint64_t v49;
  uint64_t v50;

  v11 = type metadata accessor for UUID();
  v12 = *(void (***)(char *, uint64_t))(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v47 - v16;
  (*(void (**)(uint64_t, uint64_t))(a7 + 8))(a6, a7);
  v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95070]), sel_init);
  if (v18)
  {
    v19 = v18;
    v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95078]), sel_init);
    if (v20)
    {
      v21 = v20;
      v48 = v12;
      v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95080]), sel_init);
      if (v22)
      {
        v23 = v22;
        v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95098]), sel_init);
        if (v24)
        {
          v25 = v24;
          if (a4)
            v26 = (void *)MEMORY[0x2207D4DFC](a3, a4);
          else
            v26 = 0;
          v40 = v25;
          objc_msgSend(v25, sel_setModelId_, v26);

          v41 = objc_allocWithZone(MEMORY[0x24BE95C78]);
          isa = UUID._bridgeToObjectiveC()().super.isa;
          v43 = objc_msgSend(v41, sel_initWithNSUUID_, isa);

          objc_msgSend(v23, sel_setContextId_, v43);
          objc_msgSend(v23, sel_setStartedOrChanged_, v40);
          v44 = objc_allocWithZone(MEMORY[0x24BE95C78]);
          v45 = UUID._bridgeToObjectiveC()().super.isa;
          v46 = objc_msgSend(v44, sel_initWithNSUUID_, v45);

          objc_msgSend(v21, sel_setIhId_, v46);
          objc_msgSend(v19, sel_setEventMetadata_, v21);
          objc_msgSend(v19, sel_setModelEvaluationContext_, v23);

          v48[1](v17, v11);
          return v19;
        }

        v19 = v21;
      }
      else
      {
        v23 = v21;
      }

      v19 = v23;
      v12 = v48;
    }

  }
  if (one-time initialization token for defaultLogger != -1)
    swift_once();
  v27 = type metadata accessor for Logger();
  __swift_project_value_buffer(v27, (uint64_t)defaultLogger);
  ((void (*)(char *, char *, uint64_t))v12[2])(v15, v17, v11);
  v28 = Logger.logObject.getter();
  v29 = v17;
  v30 = v12;
  v31 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v28, v31))
  {
    v32 = swift_slowAlloc();
    v48 = (void (**)(char *, uint64_t))v29;
    v33 = (uint8_t *)v32;
    v34 = swift_slowAlloc();
    v50 = v34;
    *(_DWORD *)v33 = 136315138;
    lazy protocol witness table accessor for type UUID and conformance UUID();
    v35 = dispatch thunk of CustomStringConvertible.description.getter();
    v49 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v35, v36, &v50);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v37 = v30[1];
    v37(v15, v11);
    _os_log_impl(&dword_21FDE7000, v28, v31, "Unable to create FeatureExtraction started schemas for SELF for ihId: %s", v33, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207D560C](v34, -1, -1);
    MEMORY[0x2207D560C](v33, -1, -1);

    v38 = (char *)v48;
  }
  else
  {

    v37 = v30[1];
    v37(v15, v11);
    v38 = v29;
  }
  v37(v38, v11);
  return 0;
}

void *specialized static IHProtoUtils.generateModelEvalEnd(loggingMetadata:contextId:ihScoreData:)(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, __int16 a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  id v31;
  Class isa;
  id v33;
  id v34;
  id v35;
  Class v36;
  id v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  void (*v47)(char *, uint64_t);
  char *v48;
  uint64_t v50;
  id v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;

  v53 = a2;
  v13 = type metadata accessor for UUID();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v50 - v18;
  (*(void (**)(uint64_t, uint64_t))(a8 + 8))(a7, a8);
  v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95070]), sel_init);
  if (v20)
  {
    v21 = v20;
    v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95078]), sel_init);
    if (v22)
    {
      v23 = v22;
      v52 = v14;
      v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE950A0]), sel_init);
      if (v24)
      {
        v25 = v24;
        v51 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95080]), sel_init);
        if (v51)
        {
          v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95088]), sel_init);
          if (v26)
          {
            v28 = v26;
            if ((a5 & 0x100) == 0)
            {
              LODWORD(v27) = a3;
              objc_msgSend(v25, sel_setScore_, v27);
              if ((a5 & 1) == 0)
              {
                LODWORD(v29) = HIDWORD(a4);
                objc_msgSend(v25, sel_setUpperBoundary_, v29);
              }
              if ((a4 & 1) == 0)
              {
                LODWORD(v29) = HIDWORD(a3);
                objc_msgSend(v25, sel_setLowerBoundary_, v29);
              }
            }
            v30 = v28;
            objc_msgSend(v28, sel_setScore_, v25);
            v31 = objc_allocWithZone(MEMORY[0x24BE95C78]);
            isa = UUID._bridgeToObjectiveC()().super.isa;
            v33 = objc_msgSend(v31, sel_initWithNSUUID_, isa);

            v34 = v51;
            objc_msgSend(v51, sel_setContextId_, v33);

            objc_msgSend(v34, sel_setEnded_, v30);
            v35 = objc_allocWithZone(MEMORY[0x24BE95C78]);
            v36 = UUID._bridgeToObjectiveC()().super.isa;
            v37 = objc_msgSend(v35, sel_initWithNSUUID_, v36);

            objc_msgSend(v23, sel_setIhId_, v37);
            objc_msgSend(v21, sel_setEventMetadata_, v23);
            objc_msgSend(v21, sel_setModelEvaluationContext_, v34);

            (*(void (**)(char *, uint64_t))(v52 + 8))(v19, v13);
            return v21;
          }

          v21 = v23;
          v23 = v25;
          v25 = v51;
        }

        v21 = v23;
        v23 = v25;
      }
      v14 = v52;

      v21 = v23;
    }

  }
  if (one-time initialization token for defaultLogger != -1)
    swift_once();
  v38 = type metadata accessor for Logger();
  __swift_project_value_buffer(v38, (uint64_t)defaultLogger);
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v19, v13);
  v39 = Logger.logObject.getter();
  v40 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v39, v40))
  {
    v41 = (uint8_t *)swift_slowAlloc();
    v42 = swift_slowAlloc();
    v53 = v19;
    v43 = v14;
    v44 = v42;
    v55 = v42;
    *(_DWORD *)v41 = 136315138;
    lazy protocol witness table accessor for type UUID and conformance UUID();
    v45 = dispatch thunk of CustomStringConvertible.description.getter();
    v54 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v45, v46, &v55);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v47 = *(void (**)(char *, uint64_t))(v43 + 8);
    v47(v17, v13);
    _os_log_impl(&dword_21FDE7000, v39, v40, "Unable to create FeatureExtraction started schemas for SELF for ihId: %s", v41, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207D560C](v44, -1, -1);
    MEMORY[0x2207D560C](v41, -1, -1);

    v48 = v53;
  }
  else
  {

    v47 = *(void (**)(char *, uint64_t))(v14 + 8);
    v47(v17, v13);
    v48 = v19;
  }
  v47(v48, v13);
  return 0;
}

void *specialized static IHProtoUtils.generateModelEvalFailure(loggingMetadata:contextId:errorCode:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  void (**v10)(char *, uint64_t);
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  Class isa;
  id v26;
  id v27;
  Class v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  void (*v37)(char *, uint64_t);
  char *v38;
  uint64_t v40;
  void (**v41)(char *, uint64_t);
  uint64_t v42;
  uint64_t v43;

  v9 = type metadata accessor for UUID();
  v10 = *(void (***)(char *, uint64_t))(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v40 - v14;
  (*(void (**)(uint64_t, uint64_t))(a6 + 8))(a5, a6);
  v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95070]), sel_init);
  if (v16)
  {
    v17 = v16;
    v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95078]), sel_init);
    if (v18)
    {
      v19 = v18;
      v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95080]), sel_init);
      if (v20)
      {
        v21 = v20;
        v41 = v10;
        v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95090]), sel_init);
        if (v22)
        {
          v23 = v22;
          objc_msgSend(v22, sel_setErrorCode_, a3);
          v24 = objc_allocWithZone(MEMORY[0x24BE95C78]);
          isa = UUID._bridgeToObjectiveC()().super.isa;
          v26 = objc_msgSend(v24, sel_initWithNSUUID_, isa);

          objc_msgSend(v21, sel_setContextId_, v26);
          objc_msgSend(v21, sel_setFailed_, v23);
          v27 = objc_allocWithZone(MEMORY[0x24BE95C78]);
          v28 = UUID._bridgeToObjectiveC()().super.isa;
          v29 = objc_msgSend(v27, sel_initWithNSUUID_, v28);

          objc_msgSend(v19, sel_setIhId_, v29);
          objc_msgSend(v17, sel_setEventMetadata_, v19);
          objc_msgSend(v17, sel_setModelEvaluationContext_, v21);

          v41[1](v15, v9);
          return v17;
        }

        v17 = v19;
        v10 = v41;
      }
      else
      {
        v21 = v19;
      }

      v17 = v21;
    }

  }
  if (one-time initialization token for defaultLogger != -1)
    swift_once();
  v30 = type metadata accessor for Logger();
  __swift_project_value_buffer(v30, (uint64_t)defaultLogger);
  ((void (*)(char *, char *, uint64_t))v10[2])(v13, v15, v9);
  v31 = Logger.logObject.getter();
  v32 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = (uint8_t *)swift_slowAlloc();
    v34 = swift_slowAlloc();
    v43 = v34;
    *(_DWORD *)v33 = 136315138;
    v41 = (void (**)(char *, uint64_t))v15;
    lazy protocol witness table accessor for type UUID and conformance UUID();
    v35 = dispatch thunk of CustomStringConvertible.description.getter();
    v42 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v35, v36, &v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v37 = v10[1];
    v37(v13, v9);
    _os_log_impl(&dword_21FDE7000, v31, v32, "Unable to create FeatureExtraction started schemas for SELF for ihId: %s", v33, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207D560C](v34, -1, -1);
    MEMORY[0x2207D560C](v33, -1, -1);

    v38 = (char *)v41;
  }
  else
  {

    v37 = v10[1];
    v37(v13, v9);
    v38 = v15;
  }
  v37(v38, v9);
  return 0;
}

void specialized static IHProtoUtils.emitAndLogEvent(createMessageClosure:messageName:)(uint64_t (*a1)(void), uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a1();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(objc_msgSend((id)objc_opt_self(), sel_sharedStream), sel_emitMessage_, v6);
    swift_unknownObjectRelease();
    if (one-time initialization token for defaultLogger != -1)
      swift_once();
    v8 = type metadata accessor for Logger();
    __swift_project_value_buffer(v8, (uint64_t)defaultLogger);
    swift_bridgeObjectRetain_n();
    v9 = Logger.logObject.getter();
    v10 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v12 = swift_slowAlloc();
      v18 = v12;
      *(_DWORD *)v11 = 136315138;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a3, a4, &v18);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21FDE7000, v9, v10, "Logged %s event", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207D560C](v12, -1, -1);
      MEMORY[0x2207D560C](v11, -1, -1);

      return;
    }

  }
  else
  {
    if (one-time initialization token for defaultLogger != -1)
      swift_once();
    v13 = type metadata accessor for Logger();
    __swift_project_value_buffer(v13, (uint64_t)defaultLogger);
    swift_bridgeObjectRetain_n();
    v14 = Logger.logObject.getter();
    v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = swift_slowAlloc();
      v18 = v17;
      *(_DWORD *)v16 = 136315138;
      swift_bridgeObjectRetain();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a3, a4, &v18);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21FDE7000, v14, v15, "Failed to log %s event", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207D560C](v17, -1, -1);
      MEMORY[0x2207D560C](v16, -1, -1);

      return;
    }

  }
  swift_bridgeObjectRelease_n();
}

uint64_t dispatch thunk of LoggingMetadata.ihID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of LoggingMetadata.requestID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t *initializeBufferWithCopyOfBuffer for ImmutableLoggingMetadata(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for UUID();
    v8 = *(_QWORD *)(v7 - 8);
    v9 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16);
    v9(a1, a2, v7);
    v10 = *(int *)(a3 + 20);
    v11 = (char *)a1 + v10;
    v12 = (char *)a2 + v10;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v12, 1, v7))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      v9((uint64_t *)v11, (uint64_t *)v12, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v11, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for ImmutableLoggingMetadata(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  void (*v8)(uint64_t, uint64_t);

  v4 = type metadata accessor for UUID();
  v5 = *(_QWORD *)(v4 - 8);
  v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v8(a1, v4);
  v6 = a1 + *(int *)(a2 + 20);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v6, 1, v4);
  if (!(_DWORD)result)
    return ((uint64_t (*)(uint64_t, uint64_t))v8)(v6, v4);
  return result;
}

char *initializeWithCopy for ImmutableLoggingMetadata(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v6 = type metadata accessor for UUID();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 16);
  v8(a1, a2, v6);
  v9 = *(int *)(a3 + 20);
  v10 = &a1[v9];
  v11 = &a2[v9];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v11, 1, v6))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    v8(v10, v11, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  }
  return a1;
}

char *assignWithCopy for ImmutableLoggingMetadata(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t (*v12)(const void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;

  v6 = type metadata accessor for UUID();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  v9 = *(int *)(a3 + 20);
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  v13 = v12(&a1[v9], 1, v6);
  v14 = v12(v11, 1, v6);
  if (!v13)
  {
    if (!v14)
    {
      v8(v10, v11, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v11, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  return a1;
}

char *initializeWithTake for ImmutableLoggingMetadata(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v6 = type metadata accessor for UUID();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 32);
  v8(a1, a2, v6);
  v9 = *(int *)(a3 + 20);
  v10 = &a1[v9];
  v11 = &a2[v9];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v11, 1, v6))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    v8(v10, v11, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  }
  return a1;
}

char *assignWithTake for ImmutableLoggingMetadata(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t (*v12)(const void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;

  v6 = type metadata accessor for UUID();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  v9 = *(int *)(a3 + 20);
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  v13 = v12(&a1[v9], 1, v6);
  v14 = v12(v11, 1, v6);
  if (!v13)
  {
    if (!v14)
    {
      v8(v10, v11, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v11, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ImmutableLoggingMetadata()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21FDFC4C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = type metadata accessor for UUID();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for ImmutableLoggingMetadata()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21FDFC548(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = type metadata accessor for UUID();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void type metadata completion function for ImmutableLoggingMetadata()
{
  unint64_t v0;
  unint64_t v1;

  type metadata accessor for UUID();
  if (v0 <= 0x3F)
  {
    type metadata accessor for UUID?();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void type metadata accessor for UUID?()
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for UUID?)
  {
    type metadata accessor for UUID();
    v0 = type metadata accessor for Optional();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for UUID?);
  }
}

uint64_t type metadata accessor for IHProtoUtils()
{
  return objc_opt_self();
}

uint64_t method lookup function for IHProtoUtils()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of IHProtoUtils.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

__n128 __swift_memcpy17_4(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for IHProtoUtils.IHScores(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for IHProtoUtils.IHScores(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_BYTE *)(result + 16) = 0;
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
  *(_BYTE *)(result + 17) = v3;
  return result;
}

ValueMetadata *type metadata accessor for IHProtoUtils.IHScores()
{
  return &type metadata for IHProtoUtils.IHScores;
}

unint64_t lazy protocol witness table accessor for type UUID and conformance UUID()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type UUID and conformance UUID;
  if (!lazy protocol witness table cache variable for type UUID and conformance UUID)
  {
    v1 = type metadata accessor for UUID();
    result = MEMORY[0x2207D5564](MEMORY[0x24BDCEAB8], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID);
  }
  return result;
}

uint64_t outlined destroy of UUID?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ASRFeatureExtractor.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t ASRFeatureExtractor.extract(from:)(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  unint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  unint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  unint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  id v21;
  void *v22;
  BOOL v23;
  id v24;
  uint32_t *p_align;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  unint64_t v31;
  id v32;
  const char *v33;
  id v34;
  id v35;
  char v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  id v43;
  id v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  _QWORD *v50;
  id v51;
  id v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  void (*v65)(char *, char *, uint64_t);
  char *v66;
  uint64_t (*v67)(char *, uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  char *v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  id v83;
  unint64_t v84;
  unsigned int v85;
  unint64_t v86;
  unint64_t v87;
  uint64_t v88;
  id v89;
  unint64_t v90;
  uint64_t v91;
  unint64_t v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  unint64_t v97;
  _QWORD *v98;
  uint64_t v99;
  uint64_t v100;

  v2 = type metadata accessor for Confidence();
  v80 = *(_QWORD *)(v2 - 8);
  v81 = v2;
  v3 = MEMORY[0x24BDAC7A8](v2);
  v79 = (char *)&v74 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v78 = (char *)&v74 - v5;
  v100 = MEMORY[0x24BEE4AF8];
  v6 = specialized static ASRFeatureExtractor.asrPackageEvents(from:)(a1);
  if (one-time initialization token for defaultLogger != -1)
    goto LABEL_90;
LABEL_2:
  v7 = type metadata accessor for Logger();
  __swift_project_value_buffer(v7, (uint64_t)defaultLogger);
  swift_bridgeObjectRetain_n();
  v8 = Logger.logObject.getter();
  v9 = static os_log_type_t.debug.getter();
  v10 = v6 >> 62;
  if (os_log_type_enabled(v8, v9))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v11 = 134217984;
    if (v10)
    {
      swift_bridgeObjectRetain();
      v12 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      v12 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    v98 = (_QWORD *)v12;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21FDE7000, v8, v9, "ASR final package events count: %ld", v11, 0xCu);
    MEMORY[0x2207D560C](v11, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v13 = specialized static ASRFeatureExtractor.asrRecognitionResultTier1Events(from:)(a1);
  swift_bridgeObjectRetain_n();
  v14 = Logger.logObject.getter();
  v15 = static os_log_type_t.debug.getter();
  v16 = v13 >> 62;
  if (os_log_type_enabled(v14, v15))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v17 = 134217984;
    if (v16)
    {
      swift_bridgeObjectRetain();
      v18 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      v18 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    v98 = (_QWORD *)v18;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21FDE7000, v14, v15, "ASR recognition events count: %ld", v17, 0xCu);
    MEMORY[0x2207D560C](v17, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (v10)
  {
    swift_bridgeObjectRetain();
    v19 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v19)
    {
LABEL_92:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return MEMORY[0x24BEE4AF8];
    }
  }
  else
  {
    v19 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v19)
      goto LABEL_92;
  }
  v91 = v13 & 0xFFFFFFFFFFFFFF8;
  if (v16)
  {
    swift_bridgeObjectRetain();
    v88 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    v88 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  a1 = 0;
  v82 = v6 & 0xC000000000000001;
  v75 = v6 & 0xFFFFFFFFFFFFFF8;
  v74 = v6 + 32;
  v86 = v13 & 0xC000000000000001;
  v90 = v13 + 32;
  v20 = *MEMORY[0x24BEA4C58];
  v87 = v13;
  v77 = v6;
  v76 = v19;
  v85 = v20;
  while (1)
  {
    if (v82)
    {
      v21 = (id)MEMORY[0x2207D5048](a1, v6);
    }
    else
    {
      if (a1 >= *(_QWORD *)(v75 + 16))
        goto LABEL_89;
      v21 = *(id *)(v74 + 8 * a1);
    }
    v22 = v21;
    v23 = __OFADD__(a1++, 1);
    if (v23)
      goto LABEL_88;
    v84 = a1;
    a1 = (unint64_t)objc_msgSend(v21, sel_package);
    v24 = objc_msgSend((id)a1, sel_postItn);

    p_align = &stru_24E5B6FE8.align;
    v6 = (unint64_t)objc_msgSend(v24, sel_linkId);

    v83 = v22;
    specialized static ASRFeatureExtractor.bestTokensIndices(asrFinalPackageEvent:)(v22);
    v27 = v88;
    v89 = (id)v6;
    if (v88)
      break;
    v29 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v30 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_75:
    swift_bridgeObjectRelease();
    v98 = v30;
    v58 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    v96 = lazy protocol witness table accessor for type [String] and conformance [A]();
    v97 = v58;
    v59 = BidirectionalCollection<>.joined(separator:)();
    v61 = v60;
    swift_bridgeObjectRelease();
    v63 = v80;
    v62 = v81;
    v64 = v78;
    v95 = *(_QWORD *)(v80 + 104);
    ((void (*)(char *, _QWORD, uint64_t))v95)(v78, v85, v81);
    type metadata accessor for BestPostITNUtterance(0);
    swift_allocObject();
    v98 = (_QWORD *)v59;
    v99 = v61;
    v65 = *(void (**)(char *, char *, uint64_t))(v63 + 16);
    v66 = v79;
    v65(v79, v64, v62);
    TypedFeature.init(value:confidence:)();
    v67 = *(uint64_t (**)(char *, uint64_t))(v63 + 8);
    v68 = v67(v64, v62);
    MEMORY[0x2207D4EB0](v68);
    if (*(_QWORD *)((v100 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v100 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    v98 = v29;
    v69 = BidirectionalCollection<>.joined(separator:)();
    v71 = v70;
    swift_bridgeObjectRelease();
    ((void (*)(char *, _QWORD, uint64_t))v95)(v64, v85, v62);
    type metadata accessor for BestASRPhoneticSequence(0);
    swift_allocObject();
    v98 = (_QWORD *)v69;
    v99 = v71;
    v65(v66, v64, v62);
    TypedFeature.init(value:confidence:)();
    v72 = v67(v64, v62);
    MEMORY[0x2207D4EB0](v72);
    if (*(_QWORD *)((v100 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v100 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();

    a1 = v84;
    v6 = v77;
    v13 = v87;
    if (v84 == v76)
      goto LABEL_85;
  }
  v95 = v26;
  swift_bridgeObjectRetain();
  v28 = 0;
  v29 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v30 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v31 = v86;
  while (1)
  {
    while (1)
    {
      if (v31)
      {
        v32 = (id)MEMORY[0x2207D5048](v28, v13);
        v23 = __OFADD__(v28++, 1);
        if (v23)
          goto LABEL_86;
      }
      else
      {
        if (v28 >= *(_QWORD *)(v91 + 16))
          goto LABEL_87;
        v32 = *(id *)(v90 + 8 * v28);
        v23 = __OFADD__(v28++, 1);
        if (v23)
        {
LABEL_86:
          __break(1u);
LABEL_87:
          __break(1u);
LABEL_88:
          __break(1u);
LABEL_89:
          __break(1u);
LABEL_90:
          swift_once();
          goto LABEL_2;
        }
      }
      v33 = (const char *)*((_QWORD *)p_align + 137);
      v93 = v32;
      v34 = objc_msgSend(v32, v33, v74);
      if (v34)
        break;
      v92 = v28;
      if (!v6)
        goto LABEL_36;
LABEL_25:

LABEL_26:
      v28 = v92;
      if (v92 == v27)
        goto LABEL_73;
    }
    a1 = (unint64_t)v34;
    if (v6)
      break;

    if (v28 == v27)
    {
LABEL_73:
      swift_bridgeObjectRelease();
      goto LABEL_75;
    }
  }
  v92 = v28;
  type metadata accessor for ASRSchemaASRTokenTier1(0, &lazy cache variable for type metadata for SISchemaUUID);
  v35 = (id)v6;
  a1 = (unint64_t)(id)a1;
  v36 = static NSObject.== infix(_:_:)();

  if ((v36 & 1) == 0)
    goto LABEL_25;
LABEL_36:
  v37 = objc_msgSend(v93, sel_tokens);
  if (v37)
  {
    a1 = (unint64_t)v37;
    type metadata accessor for ASRSchemaASRTokenTier1(0, &lazy cache variable for type metadata for ASRSchemaASRTokenTier1);
    v38 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  }
  else
  {
    v38 = 0;
  }
  v94 = *(_QWORD *)(v95 + 16);
  if (!v94)
  {

    swift_bridgeObjectRelease();
    goto LABEL_26;
  }
  v96 = v38 & 0xFFFFFFFFFFFFFF8;
  v97 = v38 & 0xC000000000000001;
  v39 = v38 + 32;
  v40 = 0;
  v41 = swift_bridgeObjectRetain();
  while (2)
  {
    v42 = *(_QWORD *)(v41 + 8 * v40 + 32);
    if (!v38)
      goto LABEL_50;
    if (v97)
    {
      swift_bridgeObjectRetain();
      v43 = (id)MEMORY[0x2207D5048](v42, v38);
      swift_bridgeObjectRelease();
LABEL_48:
      v44 = objc_msgSend(v43, sel_text);

      if (v44)
      {
        v45 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v47 = v46;

        goto LABEL_51;
      }
LABEL_50:
      v45 = 0;
      v47 = 0xE000000000000000;
LABEL_51:
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v30 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v30[2] + 1, 1, v30);
      v49 = v30[2];
      v48 = v30[3];
      if (v49 >= v48 >> 1)
        v30 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v48 > 1), v49 + 1, 1, v30);
      v30[2] = v49 + 1;
      v50 = &v30[2 * v49];
      v50[4] = v45;
      v50[5] = v47;
      if (v38)
      {
        v41 = v95;
        if (v97)
        {
          swift_bridgeObjectRetain();
          v51 = (id)MEMORY[0x2207D5048](v42, v38);
          swift_bridgeObjectRelease();
        }
        else
        {
          if ((v42 & 0x8000000000000000) != 0)
            goto LABEL_83;
          if (v42 >= *(_QWORD *)(v96 + 16))
            goto LABEL_84;
          v51 = *(id *)(v39 + 8 * v42);
        }
        v52 = objc_msgSend(v51, sel_phoneSequence);

        if (v52)
        {
          v53 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          a1 = v54;

        }
        else
        {
          v53 = 0;
          a1 = 0xE000000000000000;
        }
      }
      else
      {
        v53 = 0;
        a1 = 0xE000000000000000;
        v41 = v95;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v29 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v29[2] + 1, 1, v29);
      v56 = v29[2];
      v55 = v29[3];
      if (v56 >= v55 >> 1)
        v29 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v55 > 1), v56 + 1, 1, v29);
      ++v40;
      v29[2] = v56 + 1;
      v57 = &v29[2 * v56];
      v57[4] = v53;
      v57[5] = a1;
      if (v94 == v40)
      {
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        v13 = v87;
        v27 = v88;
        v31 = v86;
        p_align = (_DWORD *)(&stru_24E5B6FE8 + 24);
        v6 = (unint64_t)v89;
        goto LABEL_26;
      }
      continue;
    }
    break;
  }
  if ((v42 & 0x8000000000000000) == 0)
  {
    if (v42 >= *(_QWORD *)(v96 + 16))
      goto LABEL_82;
    v43 = *(id *)(v39 + 8 * v42);
    goto LABEL_48;
  }
  __break(1u);
LABEL_82:
  __break(1u);
LABEL_83:
  __break(1u);
LABEL_84:
  __break(1u);
LABEL_85:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v100;
}

uint64_t ASRFeatureExtractor.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t ASRFeatureExtractor.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t ASRFeatureExtractor.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t BestPostITNUtterance.__deallocating_deinit()
{
  TypedFeature.deinit();
  return swift_deallocClassInstance();
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to BestPostITNUtterance.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to FinalFlowTaskName.__allocating_init(value:confidence:)(a1, a2, (void (*)(_QWORD))type metadata accessor for BestPostITNUtterance);
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to BestASRPhoneticSequence.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to FinalFlowTaskName.__allocating_init(value:confidence:)(a1, a2, (void (*)(_QWORD))type metadata accessor for BestASRPhoneticSequence);
}

uint64_t specialized static ASRFeatureExtractor.asrPackageEvents(from:)(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  unint64_t v5;
  uint32_t *p_align;
  uint32_t *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  unint64_t v18;
  uint32_t *v19;
  uint8_t *v20;
  uint8_t *v21;
  unint64_t v22;
  uint64_t v23;

  v1 = a1;
  v23 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    result = _CocoaArrayWrapper.endIndex.getter();
    v2 = result;
    if (result)
      goto LABEL_3;
LABEL_25:
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain();
  if (!v2)
    goto LABEL_25;
LABEL_3:
  if (v2 >= 1)
  {
    v4 = 0;
    v5 = v1 & 0xC000000000000001;
    p_align = &stru_24E5B6FE8.align;
    v7 = &stru_24E5B6FE8.align;
    v22 = v1;
    while (1)
    {
      if (v5)
        v8 = (id)MEMORY[0x2207D5048](v4, v1);
      else
        v8 = *(id *)(v1 + 8 * v4 + 32);
      v9 = v8;
      v10 = specialized SISchemaAnyEvent.topLevelPayload<A>(as:)();
      if (v10)
      {
        v11 = v10;
        v12 = objc_msgSend(v10, *((SEL *)p_align + 149));
        if (v12)
        {
          v13 = v12;
          if ((objc_msgSend(v12, *((SEL *)v7 + 150)) & 1) != 0)
          {
            if (one-time initialization token for defaultLogger != -1)
              swift_once();
            v14 = type metadata accessor for Logger();
            __swift_project_value_buffer(v14, (uint64_t)defaultLogger);
            v15 = Logger.logObject.getter();
            v16 = static os_log_type_t.debug.getter();
            if (os_log_type_enabled(v15, v16))
            {
              v17 = v2;
              v18 = v5;
              v19 = p_align;
              v20 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v20 = 0;
              _os_log_impl(&dword_21FDE7000, v15, v16, "Found final ASRPackageGenerated Event", v20, 2u);
              v21 = v20;
              p_align = v19;
              v5 = v18;
              v2 = v17;
              v1 = v22;
              MEMORY[0x2207D560C](v21, -1, -1);
            }

            MEMORY[0x2207D4EB0]();
            if (*(_QWORD *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
            specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
            specialized Array._endMutation()();
            v7 = (_DWORD *)(&stru_24E5B6FE8 + 24);
            goto LABEL_6;
          }

        }
        else
        {

        }
      }
      else
      {

      }
LABEL_6:
      if (v2 == ++v4)
      {
        swift_bridgeObjectRelease();
        return v23;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t specialized static ASRFeatureExtractor.asrRecognitionResultTier1Events(from:)(unint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t i;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;

  v10 = MEMORY[0x24BEE4AF8];
  if (!(a1 >> 62))
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_17:
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  result = _CocoaArrayWrapper.endIndex.getter();
  v2 = result;
  if (!result)
    goto LABEL_17;
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
  }
  else
  {
    for (i = 0; i != v2; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v5 = (id)MEMORY[0x2207D5048](i, a1);
      else
        v5 = *(id *)(a1 + 8 * i + 32);
      v6 = v5;
      v7 = specialized SISchemaAnyEvent.topLevelPayload<A>(as:)();
      if (v7)
      {
        v8 = v7;
        v9 = objc_msgSend(v7, sel_recognitionResultTier1);

        if (v9)
        {
          MEMORY[0x2207D4EB0]();
          if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
          specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized Array._endMutation()();
        }
      }
      else
      {

      }
    }
    swift_bridgeObjectRelease();
    return v10;
  }
  return result;
}

void specialized static ASRFeatureExtractor.bestTokensIndices(asrFinalPackageEvent:)(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  unint64_t v6;
  id v7;
  void *v8;
  unint64_t v9;
  id i;
  void *v11;
  id v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  id v18;
  void *v19;
  unint64_t v20;
  id v21;
  void *v22;
  id v23;
  unint64_t v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  unint64_t v33;
  unsigned int v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  signed int v41;
  signed int v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  void *v56;
  unint64_t v57;

  v1 = objc_msgSend(a1, sel_package);
  if (!v1)
    return;
  v2 = v1;
  v3 = objc_msgSend(v1, sel_postItn);

  if (!v3)
    return;
  v46 = v3;
  v4 = objc_msgSend(v46, sel_utterances);
  if (v4)
  {
    v5 = v4;
    type metadata accessor for ASRSchemaASRTokenTier1(0, &lazy cache variable for type metadata for ASRSchemaASRUtterance);
    v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  }
  else
  {
    v6 = MEMORY[0x24BEE4AF8];
  }
  v7 = objc_msgSend(v46, sel_phrases);
  if (v7)
  {
    v8 = v7;
    type metadata accessor for ASRSchemaASRTokenTier1(0, &lazy cache variable for type metadata for ASRSchemaASRPhrase);
    v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (!(v6 >> 62))
      goto LABEL_8;
LABEL_64:
    swift_bridgeObjectRetain();
    v44 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v44)
      goto LABEL_9;
LABEL_65:
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    return;
  }
  v9 = MEMORY[0x24BEE4AF8];
  if (v6 >> 62)
    goto LABEL_64;
LABEL_8:
  if (!*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_65;
LABEL_9:
  if ((v6 & 0xC000000000000001) != 0)
    goto LABEL_77;
  if (*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    for (i = *(id *)(v6 + 32); ; i = (id)MEMORY[0x2207D5048](0, v6))
    {
      v11 = i;
      swift_bridgeObjectRelease();
      v12 = objc_msgSend(v11, sel_interpretationIndices);
      if (v12)
      {
        v13 = v12;
        type metadata accessor for ASRSchemaASRTokenTier1(0, &lazy cache variable for type metadata for NSNumber);
        v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

        if (v14 >> 62)
          goto LABEL_68;
      }
      else
      {
        v14 = MEMORY[0x24BEE4AF8];
        if (MEMORY[0x24BEE4AF8] >> 62)
        {
LABEL_68:
          swift_bridgeObjectRetain();
          v15 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
          v45 = v11;
          if (!v15)
          {
LABEL_69:

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();

            return;
          }
          goto LABEL_15;
        }
      }
      v15 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
      v45 = v11;
      if (!v15)
        goto LABEL_69;
LABEL_15:
      v6 = 0;
      v16 = v14 & 0xC000000000000001;
      v57 = v9 & 0xC000000000000001;
      v53 = v14 + 32;
      v54 = v14 & 0xFFFFFFFFFFFFFF8;
      v51 = v9 + 32;
      v52 = v9 & 0xFFFFFFFFFFFFFF8;
      v17 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v47 = v14;
      v48 = v9;
      v49 = v14 & 0xC000000000000001;
      v50 = v15;
      while (1)
      {
        if (v16)
        {
          v18 = (id)MEMORY[0x2207D5048](v6, v14);
        }
        else
        {
          if (v6 >= *(_QWORD *)(v54 + 16))
            goto LABEL_73;
          v18 = *(id *)(v53 + 8 * v6);
        }
        v19 = v18;
        v20 = v6 + 1;
        if (__OFADD__(v6, 1))
          break;
        if (v57)
        {
          v21 = (id)MEMORY[0x2207D5048](v6, v9);
        }
        else
        {
          if (v6 >= *(_QWORD *)(v52 + 16))
            goto LABEL_74;
          v21 = *(id *)(v51 + 8 * v6);
        }
        v22 = v21;
        v23 = objc_msgSend(v21, sel_interpretations);

        if (v23)
        {
          type metadata accessor for ASRSchemaASRTokenTier1(0, &lazy cache variable for type metadata for ASRSchemaASRInterpretation);
          v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

          v24 = (unint64_t)objc_msgSend(v19, sel_integerValue);
          if ((v6 & 0xC000000000000001) != 0)
          {
            v25 = (id)MEMORY[0x2207D5048](v24, v6);
          }
          else
          {
            if ((v24 & 0x8000000000000000) != 0)
              goto LABEL_71;
            if (v24 >= *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
              goto LABEL_72;
            v25 = *(id *)(v6 + 8 * v24 + 32);
          }
          v26 = v25;
          swift_bridgeObjectRelease();
          v27 = objc_msgSend(v26, sel_tokens);
          v28 = v26;
          if (v27)
          {
            v29 = v27;
            v56 = v28;
            type metadata accessor for ASRSchemaASRTokenTier1(0, &lazy cache variable for type metadata for ASRSchemaASRToken);
            v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

            if (v6 >> 62)
            {
              swift_bridgeObjectRetain();
              v30 = _CocoaArrayWrapper.endIndex.getter();
              if (!v30)
              {
LABEL_61:

                swift_bridgeObjectRelease_n();
                goto LABEL_17;
              }
            }
            else
            {
              v30 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
              swift_bridgeObjectRetain();
              if (!v30)
                goto LABEL_61;
            }
            v9 = v6 & 0xC000000000000001;
            v55 = v17;
            if ((v6 & 0xC000000000000001) != 0)
            {
              v31 = (id)MEMORY[0x2207D5048](0, v6);
            }
            else
            {
              if (!*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
                goto LABEL_75;
              v31 = *(id *)(v6 + 32);
            }
            v32 = v31;
            v33 = v30 - 1;
            if (v30 != 1)
            {
              if (v30 < 2)
                goto LABEL_76;
              if (!v9)
              {
                v37 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
                if (v37 < 2 || v33 >= v37)
                  goto LABEL_79;
              }
              v38 = 0;
              do
              {
                if (v9)
                  v39 = (id)MEMORY[0x2207D5048](v38 + 1, v6);
                else
                  v39 = *(id *)(v6 + 8 * v38 + 40);
                v40 = v39;
                v41 = objc_msgSend(v32, sel_confidence);
                v42 = objc_msgSend(v40, sel_confidence);
                if (v41 >= v42)
                  v43 = v40;
                else
                  v43 = v32;
                if (v41 < v42)
                  v32 = v40;

                ++v38;
              }
              while (v33 != v38);
            }
            swift_bridgeObjectRelease_n();
            v34 = objc_msgSend(v32, sel_linkIndex);
            v17 = v55;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v17 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v55[2] + 1, 1, v55);
            v14 = v47;
            v9 = v48;
            v36 = v17[2];
            v35 = v17[3];
            if (v36 >= v35 >> 1)
              v17 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v35 > 1), v36 + 1, 1, v17);
            v17[2] = v36 + 1;
            v17[v36 + 4] = v34;

            v16 = v49;
            v15 = v50;
          }
          else
          {

          }
        }
        else
        {

        }
LABEL_17:
        v6 = v20;
        if (v20 == v15)
          goto LABEL_69;
      }
      __break(1u);
LABEL_71:
      __break(1u);
LABEL_72:
      __break(1u);
LABEL_73:
      __break(1u);
LABEL_74:
      __break(1u);
LABEL_75:
      __break(1u);
LABEL_76:
      __break(1u);
LABEL_77:
      ;
    }
  }
  __break(1u);
LABEL_79:
  __break(1u);
}

unint64_t lazy protocol witness table accessor for type [String] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [String] and conformance [A];
  if (!lazy protocol witness table cache variable for type [String] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String]);
    result = MEMORY[0x2207D5564](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String] and conformance [A]);
  }
  return result;
}

uint64_t type metadata accessor for BestPostITNUtterance(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for BestPostITNUtterance);
}

uint64_t type metadata accessor for BestASRPhoneticSequence(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for BestASRPhoneticSequence);
}

uint64_t type metadata accessor for ASRFeatureExtractor()
{
  return objc_opt_self();
}

uint64_t type metadata completion function for BestPostITNUtterance()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for BestPostITNUtterance()
{
  return type metadata accessor for BestPostITNUtterance(0);
}

uint64_t type metadata completion function for BestASRPhoneticSequence()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for BestASRPhoneticSequence()
{
  return type metadata accessor for BestASRPhoneticSequence(0);
}

uint64_t type metadata accessor for ASRSchemaASRTokenTier1(uint64_t a1, unint64_t *a2)
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

unint64_t static Constants.subsystem.getter()
{
  return 0xD000000000000022;
}

uint64_t URL.init(siriInferredHelpfulnessFrameworkPath:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void (*v16)(char *, uint64_t);
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21[2];

  v19 = a2;
  v20 = a1;
  v21[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = type metadata accessor for URL();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v19 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v19 - v10;
  v12 = objc_msgSend((id)objc_opt_self(), sel_defaultManager, v19, v20);
  v21[0] = 0;
  v13 = objc_msgSend(v12, sel_URLForDirectory_inDomain_appropriateForURL_create_error_, 5, 8, 0, 0, v21);

  v14 = v21[0];
  if (v13)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    v15 = v14;

    URL.appendingPathComponent(_:)();
    URL.appendingPathComponent(_:)();
    v16 = *(void (**)(char *, uint64_t))(v3 + 8);
    v16(v6, v2);
    URL.appendingPathComponent(_:)();
    swift_bridgeObjectRelease();
    v16(v9, v2);
    return ((uint64_t (*)(char *, uint64_t))v16)(v11, v2);
  }
  else
  {
    v18 = v21[0];
    swift_bridgeObjectRelease();
    _convertNSErrorToError(_:)();

    return swift_willThrow();
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> URL.makeIntermediateDirectories()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  NSURL *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void (*v9)(char *, uint64_t);
  id v10;
  id v11;
  id v12[2];

  v12[1] = *(id *)MEMORY[0x24BDAC8D0];
  v0 = type metadata accessor for URL();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  URL.deletingLastPathComponent()();
  v4 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  URL._bridgeToObjectiveC()(v5);
  v7 = v6;
  v12[0] = 0;
  v8 = objc_msgSend(v4, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v6, 1, 0, v12);

  if ((v8 & 1) != 0)
  {
    v9 = *(void (**)(char *, uint64_t))(v1 + 8);
    v10 = v12[0];
    v9(v3, v0);
  }
  else
  {
    v11 = v12[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> URL.deleteFile()()
{
  id v0;
  uint64_t v1;
  void *v2;
  unsigned int v3;
  NSURL *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  id v9;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x24BDAC8D0];
  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v1 = URL.path.getter();
  v2 = (void *)MEMORY[0x2207D4DFC](v1);
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(v0, sel_fileExistsAtPath_, v2);

  if (v3)
  {
    URL._bridgeToObjectiveC()(v4);
    v6 = v5;
    v10[0] = 0;
    v7 = objc_msgSend(v0, sel_removeItemAtURL_error_, v5, v10);

    if (v7)
    {
      v8 = v10[0];
    }
    else
    {
      v9 = v10[0];
      _convertNSErrorToError(_:)();

      swift_willThrow();
    }
  }

}

ValueMetadata *type metadata accessor for Constants()
{
  return &type metadata for Constants;
}

uint64_t specialized Collection.filterByType<A>(as:)(unint64_t a1)
{
  return specialized Collection.filterByType<A>(as:)(a1, (void (*)(_QWORD))type metadata accessor for BestPostITNUtterance);
}

{
  return specialized Collection.filterByType<A>(as:)(a1, (void (*)(_QWORD))type metadata accessor for BestASRPhoneticSequence);
}

{
  return specialized Collection.filterByType<A>(as:)(a1, (void (*)(_QWORD))type metadata accessor for CatId);
}

{
  return specialized Collection.filterByType<A>(as:)(a1, (void (*)(_QWORD))type metadata accessor for TextSimilarityScoreWithNextRequest);
}

uint64_t specialized Collection.filterByType<A>(as:)(unint64_t a1, void (*a2)(_QWORD))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t i;
  uint64_t j;
  uint64_t v10;
  unint64_t v11;

  v4 = MEMORY[0x24BEE4AF8];
  v11 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = _CocoaArrayWrapper.endIndex.getter();
    if (!v5)
      goto LABEL_15;
  }
  else
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v5)
      goto LABEL_15;
  }
  result = ((uint64_t (*)(_QWORD))a2)(0);
  if (v5 < 1)
  {
    __break(1u);
    return result;
  }
  v7 = result;
  if ((a1 & 0xC000000000000001) != 0)
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)MEMORY[0x2207D5048](i, a1) == v7)
      {
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
  else
  {
    for (j = 0; j != v5; ++j)
    {
      if (**(_QWORD **)(a1 + 8 * j + 32) == v7)
      {
        swift_retain();
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
      }
    }
  }
LABEL_15:
  swift_bridgeObjectRelease();
  v10 = specialized _arrayConditionalCast<A, B>(_:)(v11, a2);
  swift_release();
  if (v10)
    return v10;
  else
    return v4;
}

uint64_t specialized _arrayConditionalCast<A, B>(_:)(unint64_t a1, void (*a2)(_QWORD))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  uint64_t j;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v3 = a1;
  v11 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_18;
  specialized ContiguousArray.reserveCapacity(_:)();
  v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v4)
  {
    if ((v3 & 0xC000000000000001) != 0)
    {
      for (i = 0; ; ++i)
      {
        MEMORY[0x2207D5048](i, v3);
        v6 = i + 1;
        if (__OFADD__(i, 1))
          break;
        a2(0);
        if (!swift_dynamicCastClass())
        {
          swift_unknownObjectRelease();
          goto LABEL_15;
        }
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
        if (v6 == v4)
          return v11;
      }
      __break(1u);
    }
    else
    {
      for (j = 0; ; ++j)
      {
        v8 = j + 1;
        if (__OFADD__(j, 1))
          break;
        a2(0);
        v9 = swift_dynamicCastClass();
        if (!v9)
        {
LABEL_15:
          swift_release();
          return 0;
        }
        v3 = v9;
        swift_retain();
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
        if (v8 == v4)
          return v11;
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    specialized ContiguousArray.reserveCapacity(_:)();
    swift_bridgeObjectRetain();
    v4 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  return v11;
}

SiriInferredHelpfulness::GradedConversation __swiftcall GradedConversation.init(_:)(Swift::OpaquePointer a1)
{
  Swift::OpaquePointer *v1;
  Swift::OpaquePointer *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  SiriInferredHelpfulness::GradedConversation result;

  v3 = v1;
  v4 = type metadata accessor for UUID();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*((_QWORD *)a1._rawValue + 2))
  {
    v8 = *((_QWORD *)a1._rawValue + 7);
    v9 = *(_QWORD *)(v8 + 24);
    v10 = *(void **)(v8 + 32);
    v11 = swift_bridgeObjectRetain();
  }
  else
  {
    UUID.init()();
    v9 = UUID.uuidString.getter();
    v10 = v14;
    v11 = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  v3->_rawValue = (void *)v9;
  v3[1]._rawValue = v10;
  v3[2]._rawValue = a1._rawValue;
  result.interactions._rawValue = v13;
  result.id._object = v12;
  result.id._countAndFlagsBits = v11;
  return result;
}

uint64_t GradedInteraction.init(inferredHelpfulnessScore:featuredTurn:modelVersion:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v11 = a1[3];
  v10 = a1[4];
  v12 = *(uint64_t (**)(uint64_t))(*a1 + 120);
  swift_bridgeObjectRetain_n();
  swift_retain();
  v13 = swift_bridgeObjectRetain();
  v14 = v12(v13);
  v15 = specialized Collection.filterByType<A>(as:)(v14, (void (*)(_QWORD))type metadata accessor for BestPostITNUtterance);
  result = swift_bridgeObjectRelease();
  if (!(v15 >> 62))
  {
    v17 = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v17)
      goto LABEL_3;
LABEL_14:
    swift_bridgeObjectRelease();
    v19 = 0;
LABEL_15:
    swift_bridgeObjectRetain();
    *(_QWORD *)a4 = v11;
    *(_QWORD *)(a4 + 8) = v10;
    *(double *)(a4 + 16) = a5;
    *(_QWORD *)(a4 + 24) = a1;
    *(_QWORD *)(a4 + 32) = v17;
    *(_QWORD *)(a4 + 40) = v19;
    *(_QWORD *)(a4 + 48) = a2;
    *(_QWORD *)(a4 + 56) = a3;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  v17 = _CocoaArrayWrapper.endIndex.getter();
  result = swift_bridgeObjectRelease();
  if (!v17)
    goto LABEL_14;
LABEL_3:
  if ((v15 & 0xC000000000000001) != 0)
  {
    MEMORY[0x2207D5048](0, v15);
    goto LABEL_6;
  }
  if (*(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    swift_retain();
LABEL_6:
    swift_bridgeObjectRelease();
    dispatch thunk of Feature.value()();
    swift_release();
    v18 = swift_dynamicCast();
    if (v18)
      v17 = v20;
    else
      v17 = 0;
    if (v18)
      v19 = v21;
    else
      v19 = 0;
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

uint64_t GradedConversation.id.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GradedConversation.interactions.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t GradedInteraction.turnID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 24) + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t protocol witness for Identifiable.id.getter in conformance GradedConversation@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t GradedInteraction.id.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

double GradedInteraction.inferredHelpfulnessScore.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

uint64_t GradedInteraction.featuredTurn.getter()
{
  return swift_retain();
}

uint64_t GradedInteraction.utterance.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GradedInteraction.utterance.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return result;
}

uint64_t (*GradedInteraction.utterance.modify())()
{
  return FlowClientFeatureExtractor.__ivar_destroyer;
}

uint64_t GradedInteraction.modelVersion.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GradedInteraction.modelVersion.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = a2;
  return result;
}

uint64_t (*GradedInteraction.modelVersion.modify())()
{
  return FlowClientFeatureExtractor.__ivar_destroyer;
}

uint64_t GradedInteraction.features.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)(v0 + 24) + 120))();
}

uint64_t associated type witness table accessor for Identifiable.ID : Hashable in GradedConversation()
{
  return MEMORY[0x24BEE0D10];
}

uint64_t destroy for GradedConversation()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeBufferWithCopyOfBuffer for GradedConversation(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for GradedConversation(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for GradedConversation(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for GradedConversation(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for GradedConversation(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for GradedConversation()
{
  return &type metadata for GradedConversation;
}

uint64_t destroy for GradedInteraction()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for GradedInteraction(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for GradedInteraction(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

_QWORD *assignWithTake for GradedInteraction(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_release();
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRelease();
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for GradedInteraction(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GradedInteraction(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
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
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for GradedInteraction()
{
  return &type metadata for GradedInteraction;
}

uint64_t static TrialProvider.shared.getter()
{
  if (one-time initialization token for shared != -1)
    swift_once();
  return swift_retain();
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, String>);
  v2 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v8 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = specialized __RawDictionaryStorage.find<A>(_:)(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (_QWORD *)(v2[7] + 16 * result);
    *v12 = v8;
    v12[1] = v7;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
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
    outlined init with copy of URL??(v6, (uint64_t)&v15, &demangling cache variable for type metadata for (String, Any));
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

{
  uint64_t v1;
  _QWORD *v3;
  Swift::UInt32 v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  char v16;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4B00];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<SISchemaDismissalReason, String>);
  v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)();
  v4 = *(_DWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  result = specialized __RawDictionaryStorage.find<A>(_:)(v4);
  if ((v8 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  v9 = (_QWORD *)(a1 + 72);
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_DWORD *)(v3[6] + 4 * result) = v4;
    v10 = (_QWORD *)(v3[7] + 16 * result);
    *v10 = v6;
    v10[1] = v5;
    v11 = v3[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      break;
    v3[2] = v13;
    if (!--v1)
      goto LABEL_8;
    v14 = v9 + 3;
    v4 = *((_DWORD *)v9 - 4);
    v6 = *(v9 - 1);
    v15 = *v9;
    swift_bridgeObjectRetain();
    result = specialized __RawDictionaryStorage.find<A>(_:)(v4);
    v9 = v14;
    v5 = v15;
    if ((v16 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

void *TrialProvider.namespaceName.unsafeMutableAddressor()
{
  return &static TrialProvider.namespaceName;
}

uint64_t TrialAsset.description.getter(char a1)
{
  if (!a1)
    return 0xD000000000000026;
  if (a1 == 1)
    return 0xD00000000000001DLL;
  return 0x616C466C61697254;
}

uint64_t TrialAsset.rawValue.getter(char a1)
{
  if (!a1)
    return 0xD000000000000026;
  if (a1 == 1)
    return 0xD00000000000001DLL;
  return 0x616C466C61697254;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance TrialAsset(char *a1, char *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = TrialAsset.rawValue.getter(*a1);
  v5 = v4;
  if (v3 == TrialAsset.rawValue.getter(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance TrialAsset()
{
  char *v0;
  char v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  TrialAsset.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance TrialAsset()
{
  char *v0;

  TrialAsset.rawValue.getter(*v0);
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance TrialAsset()
{
  char *v0;
  char v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  TrialAsset.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance TrialAsset@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = specialized TrialAsset.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance TrialAsset@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = TrialAsset.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t TrialEnrollment.treatmentId.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrialEnrollment.experimentId.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrialEnrollment.rolloutId.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t TrialEnrollment.description.getter()
{
  uint64_t *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  Swift::String v7;
  Swift::String v8;
  Swift::String v9;
  void *object;
  uint64_t v11;
  void *v12;
  Swift::String v13;
  Swift::String v14;
  uint64_t v15;
  void *v16;
  Swift::String v17;
  Swift::String v18;
  uint64_t v20;
  Swift::String v21;

  v2 = *v0;
  v1 = (void *)v0[1];
  v4 = v0[2];
  v3 = (void *)v0[3];
  v5 = (void *)v0[5];
  v20 = v0[4];
  _StringGuts.grow(_:)(17);
  swift_bridgeObjectRelease();
  strcpy((char *)&v21, "experimentId=");
  HIWORD(v21._object) = -4864;
  if (v3)
  {
    v6 = v3;
  }
  else
  {
    v4 = 7104878;
    v6 = (void *)0xE300000000000000;
  }
  swift_bridgeObjectRetain();
  v7._countAndFlagsBits = v4;
  v7._object = v6;
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 8236;
  v8._object = (void *)0xE200000000000000;
  String.append(_:)(v8);
  v9._countAndFlagsBits = v21._countAndFlagsBits;
  object = v21._object;
  HIDWORD(v21._object) = -335544318;
  v9._object = object;
  String.append(_:)(v9);
  swift_bridgeObjectRelease();
  _StringGuts.grow(_:)(16);
  swift_bridgeObjectRelease();
  strcpy((char *)&v21, "treatmentId=");
  if (v1)
    v11 = v2;
  else
    v11 = 7104878;
  if (v1)
    v12 = v1;
  else
    v12 = (void *)0xE300000000000000;
  swift_bridgeObjectRetain();
  v13._countAndFlagsBits = v11;
  v13._object = v12;
  String.append(_:)(v13);
  swift_bridgeObjectRelease();
  v14._countAndFlagsBits = 8236;
  v14._object = (void *)0xE200000000000000;
  String.append(_:)(v14);
  swift_bridgeObjectRetain();
  String.append(_:)(v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  strcpy((char *)&v21, "rolloutId=");
  BYTE3(v21._object) = 0;
  HIDWORD(v21._object) = -369098752;
  if (v5)
    v15 = v20;
  else
    v15 = 7104878;
  if (v5)
    v16 = v5;
  else
    v16 = (void *)0xE300000000000000;
  swift_bridgeObjectRetain();
  v17._countAndFlagsBits = v15;
  v17._object = v16;
  String.append(_:)(v17);
  swift_bridgeObjectRelease();
  v18._countAndFlagsBits = 93;
  v18._object = (void *)0xE100000000000000;
  String.append(_:)(v18);
  swift_bridgeObjectRetain();
  String.append(_:)(v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 0xD000000000000010;
}

uint64_t TrialEnrollment.CodingKeys.stringValue.getter(char a1)
{
  return *(_QWORD *)&aTreatmenexperi[8 * a1];
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance TrialEnrollment.CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance TrialEnrollment.CodingKeys()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance TrialEnrollment.CodingKeys()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance TrialEnrollment.CodingKeys()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance TrialEnrollment.CodingKeys()
{
  char *v0;

  return TrialEnrollment.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance TrialEnrollment.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = specialized TrialEnrollment.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance TrialEnrollment.CodingKeys()
{
  return 0;
}

void protocol witness for CodingKey.init(intValue:) in conformance TrialEnrollment.CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance TrialEnrollment.CodingKeys()
{
  lazy protocol witness table accessor for type TrialEnrollment.CodingKeys and conformance TrialEnrollment.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance TrialEnrollment.CodingKeys()
{
  lazy protocol witness table accessor for type TrialEnrollment.CodingKeys and conformance TrialEnrollment.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t TrialEnrollment.encode(to:)(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[6];
  char v12;
  char v13;
  char v14;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<TrialEnrollment.CodingKeys>);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = v1[2];
  v11[3] = v1[3];
  v11[4] = v7;
  v8 = v1[4];
  v11[1] = v1[5];
  v11[2] = v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type TrialEnrollment.CodingKeys and conformance TrialEnrollment.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v14 = 0;
  v9 = v11[5];
  KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  if (!v9)
  {
    v13 = 1;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
    v12 = 2;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t TrialEnrollment.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  char v27;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<TrialEnrollment.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type TrialEnrollment.CodingKeys and conformance TrialEnrollment.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v27 = 0;
  v9 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  v11 = v10;
  v24 = v9;
  v26 = 1;
  swift_bridgeObjectRetain();
  v12 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  v14 = v13;
  v22 = v12;
  v25 = 2;
  swift_bridgeObjectRetain();
  v23 = v14;
  v15 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  v17 = v16;
  v18 = v15;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRetain();
  v19 = v23;
  *a2 = v24;
  a2[1] = v11;
  a2[2] = v22;
  a2[3] = v19;
  a2[4] = v18;
  a2[5] = v17;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void __swiftcall TrialEnrollment.init(treatmentId:experimentId:rolloutId:)(SiriInferredHelpfulness::TrialEnrollment *__return_ptr retstr, Swift::String_optional treatmentId, Swift::String_optional experimentId, Swift::String_optional rolloutId)
{
  retstr->treatmentId = treatmentId;
  retstr->experimentId = experimentId;
  retstr->rolloutId = rolloutId;
}

uint64_t protocol witness for Decodable.init(from:) in conformance TrialEnrollment@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return TrialEnrollment.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance TrialEnrollment(_QWORD *a1)
{
  return TrialEnrollment.encode(to:)(a1);
}

unint64_t static TrialProvider.namespaceName.getter()
{
  return 0xD000000000000019;
}

void one-time initialization function for assetFolderName()
{
  static TrialProvider.assetFolderName = 0x395F737465737361;
  *(_QWORD *)algn_2555804C8 = 0xEA00000000003034;
}

uint64_t *TrialProvider.assetFolderName.unsafeMutableAddressor()
{
  if (one-time initialization token for assetFolderName != -1)
    swift_once();
  return &static TrialProvider.assetFolderName;
}

uint64_t static TrialProvider.assetFolderName.getter()
{
  uint64_t v0;

  if (one-time initialization token for assetFolderName != -1)
    swift_once();
  v0 = static TrialProvider.assetFolderName;
  swift_bridgeObjectRetain();
  return v0;
}

void *TrialProvider.modelAssetsDirectory.unsafeMutableAddressor()
{
  return &static TrialProvider.modelAssetsDirectory;
}

unint64_t static TrialProvider.modelAssetsDirectory.getter()
{
  return 0xD000000000000011;
}

double one-time initialization function for shared()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  double result;

  v0 = objc_msgSend((id)objc_opt_self(), sel_clientWithIdentifier_, 266);
  type metadata accessor for TrialProvider();
  v1 = swift_allocObject();
  v2 = v1 + OBJC_IVAR____TtC23SiriInferredHelpfulness13TrialProvider____lazy_storage___assetUrl;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
  *(_QWORD *)(v1 + 16) = v0;
  result = 0.0;
  *(_OWORD *)(v1 + 24) = 0u;
  *(_OWORD *)(v1 + 40) = 0u;
  *(_OWORD *)(v1 + 56) = 0u;
  static TrialProvider.shared = v1;
  return result;
}

uint64_t TrialProvider.__allocating_init(client:enrollment:)(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;

  v4 = swift_allocObject();
  v10 = a2[1];
  v11 = *a2;
  v5 = *((_QWORD *)a2 + 4);
  v6 = *((_QWORD *)a2 + 5);
  v7 = v4 + OBJC_IVAR____TtC23SiriInferredHelpfulness13TrialProvider____lazy_storage___assetUrl;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  *(_QWORD *)(v4 + 16) = a1;
  *(_OWORD *)(v4 + 24) = v11;
  *(_OWORD *)(v4 + 40) = v10;
  *(_QWORD *)(v4 + 56) = v5;
  *(_QWORD *)(v4 + 64) = v6;
  return v4;
}

id TrialProvider.client.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return *(id *)(v0 + 16);
}

void TrialProvider.client.setter(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  swift_beginAccess();
  v3 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = a1;

}

uint64_t (*TrialProvider.client.modify())()
{
  swift_beginAccess();
  return InferredHelpfulnessInference.modelVersionString.modify;
}

uint64_t key path setter for TrialProvider.enrollment : TrialProvider(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t *);
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v2 = a1[5];
  v3 = *a2;
  v6 = *a1;
  v7 = *(_OWORD *)(a1 + 1);
  v8 = *(_OWORD *)(a1 + 3);
  v9 = v2;
  v4 = *(uint64_t (**)(uint64_t *))(*(_QWORD *)v3 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v4(&v6);
}

uint64_t TrialProvider.enrollment.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  __int128 v4;

  swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 64);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 24);
  v4 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 40) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t TrialProvider.enrollment.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v7;

  v2 = *a1;
  v3 = a1[1];
  v7 = *((_OWORD *)a1 + 1);
  v4 = a1[4];
  v5 = a1[5];
  swift_beginAccess();
  *(_QWORD *)(v1 + 24) = v2;
  *(_QWORD *)(v1 + 32) = v3;
  *(_OWORD *)(v1 + 40) = v7;
  *(_QWORD *)(v1 + 56) = v4;
  *(_QWORD *)(v1 + 64) = v5;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*TrialProvider.enrollment.modify())()
{
  swift_beginAccess();
  return InferredHelpfulnessInference.classifier.modify;
}

uint64_t key path setter for TrialProvider.assetUrl : TrialProvider(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of URL??(a1, (uint64_t)v6, &demangling cache variable for type metadata for URL?);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 160))(v6);
}

uint64_t TrialProvider.assetUrl.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BYTE v15[24];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL??);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = &v15[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v4);
  v8 = &v15[-v7];
  v9 = v1 + OBJC_IVAR____TtC23SiriInferredHelpfulness13TrialProvider____lazy_storage___assetUrl;
  swift_beginAccess();
  outlined init with copy of URL??(v9, (uint64_t)v8, &demangling cache variable for type metadata for URL??);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1)
    return outlined init with take of URL?((uint64_t)v8, a1);
  v12 = outlined destroy of Any?((uint64_t)v8, &demangling cache variable for type metadata for URL??);
  v13 = (void *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 104))(v12);
  (*(void (**)(void))(*(_QWORD *)v1 + 200))();

  outlined init with copy of URL??(a1, (uint64_t)v6, &demangling cache variable for type metadata for URL?);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v6, 0, 1, v10);
  swift_beginAccess();
  outlined assign with take of URL??((uint64_t)v6, v9);
  return swift_endAccess();
}

uint64_t TrialProvider.assetUrl.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL??);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with take of URL?(a1, (uint64_t)v5);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 0, 1, v6);
  v7 = v1 + OBJC_IVAR____TtC23SiriInferredHelpfulness13TrialProvider____lazy_storage___assetUrl;
  swift_beginAccess();
  outlined assign with take of URL??((uint64_t)v5, v7);
  return swift_endAccess();
}

void (*TrialProvider.assetUrl.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  size_t v7;
  void *v8;

  v3 = malloc(0x60uLL);
  *a1 = v3;
  v3[6] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL??);
  v3[7] = malloc(*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  v3[8] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v3[9] = v6;
  v7 = *(_QWORD *)(v6 + 64);
  v3[10] = malloc(v7);
  v8 = malloc(v7);
  v3[11] = v8;
  TrialProvider.assetUrl.getter((uint64_t)v8);
  return TrialProvider.assetUrl.modify;
}

void TrialProvider.assetUrl.modify(uint64_t a1, char a2)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = *(_QWORD **)a1;
  v4 = *(void **)(*(_QWORD *)a1 + 80);
  v3 = *(void **)(*(_QWORD *)a1 + 88);
  if ((a2 & 1) != 0)
  {
    v5 = v2[8];
    v6 = v2[9];
    v8 = v2[6];
    v7 = (void *)v2[7];
    outlined init with copy of URL??(v2[11], v2[10], &demangling cache variable for type metadata for URL?);
    outlined init with take of URL?((uint64_t)v4, (uint64_t)v7);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v7, 0, 1, v5);
    v9 = v8 + OBJC_IVAR____TtC23SiriInferredHelpfulness13TrialProvider____lazy_storage___assetUrl;
    swift_beginAccess();
    outlined assign with take of URL??((uint64_t)v7, v9);
    swift_endAccess();
    outlined destroy of Any?((uint64_t)v3, &demangling cache variable for type metadata for URL?);
  }
  else
  {
    v10 = v2[8];
    v11 = v2[9];
    v12 = v2[6];
    v7 = (void *)v2[7];
    outlined init with take of URL?(v2[11], (uint64_t)v7);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
    v13 = v12 + OBJC_IVAR____TtC23SiriInferredHelpfulness13TrialProvider____lazy_storage___assetUrl;
    swift_beginAccess();
    outlined assign with take of URL??((uint64_t)v7, v13);
    swift_endAccess();
  }
  free(v3);
  free(v4);
  free(v7);
  free(v2);
}

uint64_t TrialProvider.init(client:enrollment:)(uint64_t a1, __int128 *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;

  v9 = a2[1];
  v10 = *a2;
  v4 = *((_QWORD *)a2 + 4);
  v5 = *((_QWORD *)a2 + 5);
  v6 = v2 + OBJC_IVAR____TtC23SiriInferredHelpfulness13TrialProvider____lazy_storage___assetUrl;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  *(_QWORD *)(v2 + 16) = a1;
  *(_OWORD *)(v2 + 24) = v10;
  *(_OWORD *)(v2 + 40) = v9;
  *(_QWORD *)(v2 + 56) = v4;
  *(_QWORD *)(v2 + 64) = v5;
  return v2;
}

uint64_t TrialProvider.setClient(client:)(void *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(void *))(*(_QWORD *)v1 + 112))(a1);
}

uint64_t TrialProvider.defaultAssetsUrl()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  v1 = v0;
  v2 = type metadata accessor for URL();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for assetFolderName != -1)
    swift_once();
  v6 = static TrialProvider.assetFolderName;
  swift_bridgeObjectRetain();
  result = URL.init(siriInferredHelpfulnessFrameworkPath:)(v6, (uint64_t)v5);
  if (!v1)
  {
    URL.appendingPathComponent(_:isDirectory:)();
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return result;
}

id TrialProvider.fetchUpdatedAssetsURL(client:)@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  char *v2;
  char *v3;
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
  void (*v19)(void);
  id v20;
  uint64_t v21;
  uint64_t (*v22)(void);
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  id result;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  os_log_type_t v64;
  uint8_t *v65;
  _QWORD *v66;
  void (*v67)(char *, uint64_t, uint64_t);
  char *v68;
  NSObject *v69;
  os_log_type_t v70;
  uint8_t *v71;
  _QWORD *v72;
  uint64_t v73;
  unint64_t v74;
  _QWORD *v75;
  id v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  void (*v88)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v89;
  char v90;
  char *v91;
  unint64_t v92;
  unint64_t v93;
  _QWORD *v94;
  void *v95;
  NSObject *v96;
  uint64_t v97;
  uint8_t *v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  char *v102;
  void *v103;
  uint64_t v104;
  __int128 v105;
  __int128 v106;
  char *v107;
  void (*v108)(char *, uint64_t);
  char *v109;
  char *v110;
  uint64_t (*v111)(void);
  uint64_t v112;
  char *v113;
  char *v114;
  unint64_t v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  _QWORD *v119;
  __int128 v120;
  __int128 v121;
  uint64_t v122;
  uint64_t v123;
  _QWORD *v124;
  __int128 v125;
  __int128 v126;
  uint64_t v127;
  uint64_t v128;
  NSURL var20;

  v3 = v2;
  v128 = *MEMORY[0x24BDAC8D0];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v113 = (char *)&v105 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v108 = (void (*)(char *, uint64_t))((char *)&v105 - v9);
  v117 = type metadata accessor for URL();
  v10 = *(_QWORD *)(v117 - 8);
  v11 = MEMORY[0x24BDAC7A8](v117);
  v114 = (char *)&v105 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v116 = (char *)&v105 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v107 = (char *)&v105 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v109 = (char *)&v105 - v18;
  if (a1)
  {
    v19 = *(void (**)(void))(*(_QWORD *)v2 + 184);
    v20 = a1;
    v19();

  }
  v21 = 0xD000000000000019;
  v22 = *(uint64_t (**)(void))(*(_QWORD *)v2 + 104);
  v23 = (void *)((uint64_t (*)(uint64_t))v22)(v17);
  objc_msgSend(v23, sel_refresh);

  v24 = (void *)v22();
  v115 = (unint64_t)"CatIdToSpeakeasyCategory";
  v25 = (void *)MEMORY[0x2207D4DFC](0xD000000000000019, 0x800000021FE10F00);
  v26 = objc_msgSend(v24, sel_treatmentIdWithNamespaceName_, v25);

  v110 = a2;
  if (v26)
  {
    v27 = (_QWORD *)static String._unconditionallyBridgeFromObjectiveC(_:)();
    v29 = v28;

  }
  else
  {
    v27 = 0;
    v29 = 0;
  }
  v30 = (void *)v22();
  v31 = (void *)MEMORY[0x2207D4DFC](0xD000000000000019, 0x800000021FE10F00);
  v32 = objc_msgSend(v30, sel_experimentIdWithNamespaceName_, v31);

  v118 = v10;
  if (v32)
  {
    v33 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v35 = v34;

  }
  else
  {
    v33 = 0;
    v35 = 0;
  }
  v111 = v22;
  v36 = (void *)v22();
  v37 = (void *)MEMORY[0x2207D4DFC](0xD000000000000019, v115 | 0x8000000000000000);
  v38 = objc_msgSend(v36, sel_rolloutIdWithNamespaceName_, v37);

  if (v38)
  {
    v39 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v41 = v40;

  }
  else
  {
    v39 = 0;
    v41 = 0;
  }
  v124 = v27;
  *(_QWORD *)&v125 = v29;
  *((_QWORD *)&v125 + 1) = v33;
  *(_QWORD *)&v126 = v35;
  *((_QWORD *)&v126 + 1) = v39;
  v127 = v41;
  (*(void (**)(_QWORD **))(*(_QWORD *)v3 + 136))(&v124);
  if (one-time initialization token for defaultLogger != -1)
LABEL_57:
    swift_once();
  v42 = type metadata accessor for Logger();
  v43 = __swift_project_value_buffer(v42, (uint64_t)defaultLogger);
  swift_retain_n();
  v112 = v43;
  v44 = Logger.logObject.getter();
  v45 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v44, v45))
  {
    v46 = (uint8_t *)swift_slowAlloc();
    v47 = swift_slowAlloc();
    v123 = v47;
    *(_DWORD *)v46 = 136315138;
    (*(void (**)(_QWORD **__return_ptr))(*(_QWORD *)v3 + 128))(&v124);
    v119 = v124;
    v105 = v125;
    v106 = v126;
    v120 = v125;
    v121 = v126;
    v122 = v127;
    v48 = TrialEnrollment.description.getter();
    v50 = v49;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v21 = 0xD000000000000019;
    swift_bridgeObjectRelease();
    v124 = (_QWORD *)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v48, v50, &v123);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21FDE7000, v44, v45, "%s", v46, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207D560C](v47, -1, -1);
    MEMORY[0x2207D560C](v46, -1, -1);

  }
  else
  {

    v51 = swift_release_n();
  }
  v52 = v118;
  v53 = (void *)((uint64_t (*)(uint64_t))v111)(v51);
  v54 = v21 - 8;
  v55 = (void *)MEMORY[0x2207D4DFC](v21 - 8, 0x800000021FE0DFB0);
  v56 = (void *)MEMORY[0x2207D4DFC](0xD000000000000019, v115 | 0x8000000000000000);
  v57 = objc_msgSend(v53, sel_levelForFactor_withNamespaceName_, v55, v56);

  if (!v57)
    goto LABEL_21;
  result = objc_msgSend(v57, sel_directoryValue);
  if (!result)
  {
    __break(1u);
    return result;
  }
  v59 = result;
  v60 = objc_msgSend(result, sel_path);

  if (!v60)
    goto LABEL_21;
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  v61 = (uint64_t)v108;
  URL.init(string:)();
  swift_bridgeObjectRelease();
  v62 = v117;
  v115 = *(_QWORD *)(v52 + 48);
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v115)(v61, 1, v117) == 1)
  {
    outlined destroy of Any?(v61, &demangling cache variable for type metadata for URL?);
LABEL_21:
    v63 = Logger.logObject.getter();
    v64 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v63, v64))
    {
      v65 = (uint8_t *)swift_slowAlloc();
      v66 = (_QWORD *)swift_slowAlloc();
      v124 = v66;
      *(_DWORD *)v65 = 136315138;
      v119 = (_QWORD *)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v54, 0x800000021FE0DFB0, (uint64_t *)&v124);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_21FDE7000, v63, v64, "Did not find URL path to Trial assets %s", v65, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207D560C](v66, -1, -1);
      MEMORY[0x2207D560C](v65, -1, -1);

    }
    else
    {

    }
    return (id)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v52 + 56))(v110, 1, 1, v117);
  }
  *(_QWORD *)&v106 = v57;
  v67 = *(void (**)(char *, uint64_t, uint64_t))(v52 + 32);
  v68 = v109;
  v67(v109, v61, v62);
  v3 = v107;
  v111 = *(uint64_t (**)(void))(v52 + 16);
  ((void (*)(char *, char *, uint64_t))v111)(v107, v68, v62);
  v69 = Logger.logObject.getter();
  v70 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v69, v70))
  {
    v71 = (uint8_t *)swift_slowAlloc();
    v72 = (_QWORD *)swift_slowAlloc();
    v124 = v72;
    *(_DWORD *)v71 = 136315138;
    lazy protocol witness table accessor for type URL and conformance URL();
    v73 = dispatch thunk of CustomStringConvertible.description.getter();
    v119 = (_QWORD *)getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v73, v74, (uint64_t *)&v124);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v108 = *(void (**)(char *, uint64_t))(v118 + 8);
    v108(v3, v62);
    _os_log_impl(&dword_21FDE7000, v69, v70, "Fetched URL path: %s to updated Trial assets", v71, 0xCu);
    swift_arrayDestroy();
    v75 = v72;
    v52 = v118;
    MEMORY[0x2207D560C](v75, -1, -1);
    MEMORY[0x2207D560C](v71, -1, -1);
  }
  else
  {
    v108 = *(void (**)(char *, uint64_t))(v52 + 8);
    v108(v3, v62);
  }

  v76 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  URL._bridgeToObjectiveC()(&var20);
  v78 = v77;
  v124 = 0;
  v79 = objc_msgSend(v76, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v77, 0, 0, &v124);

  v80 = v124;
  if (v79)
  {
    v81 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
    v82 = v80;

    v124 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v83 = *(_QWORD *)(v81 + 16);
    swift_bridgeObjectRetain();
    if (v83)
    {
      v84 = 0;
      v85 = v117;
      v21 = (uint64_t)v113;
      while (1)
      {
        if (v84 >= *(_QWORD *)(v81 + 16))
        {
          __break(1u);
          goto LABEL_57;
        }
        v86 = v118;
        v87 = (*(unsigned __int8 *)(v118 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v118 + 80);
        v3 = *(char **)(v118 + 72);
        ((void (*)(uint64_t, unint64_t, uint64_t))v111)(v21, v81 + v87 + (_QWORD)v3 * v84, v85);
        v88 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v86 + 56);
        v88(v21, 0, 1, v85);
        if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v115)(v21, 1, v85) == 1)
          goto LABEL_49;
        v67(v116, v21, v85);
        if (URL.pathExtension.getter() == 0x636C65646F6D6C6DLL && v89 == 0xE800000000000000)
          break;
        v90 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if ((v90 & 1) != 0)
          goto LABEL_39;
        v108(v116, v85);
LABEL_32:
        ++v84;
        v21 = (uint64_t)v113;
        if (v83 == v84)
          goto LABEL_48;
      }
      swift_bridgeObjectRelease();
LABEL_39:
      v67(v114, (uint64_t)v116, v85);
      v91 = (char *)v124;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v91 + 2) + 1, 1);
        v91 = (char *)v124;
      }
      v93 = *((_QWORD *)v91 + 2);
      v92 = *((_QWORD *)v91 + 3);
      if (v93 >= v92 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v92 > 1, v93 + 1, 1);
        v91 = (char *)v124;
      }
      *((_QWORD *)v91 + 2) = v93 + 1;
      v85 = v117;
      v67(&v91[v87 + v93 * (_QWORD)v3], (uint64_t)v114, v117);
      v124 = v91;
      goto LABEL_32;
    }
    v88 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v52 + 56);
    v85 = v117;
    v21 = (uint64_t)v113;
LABEL_48:
    v88(v21, 1, 1, v85);
LABEL_49:
    swift_bridgeObjectRelease();
    outlined destroy of Any?(v21, &demangling cache variable for type metadata for URL?);
    v100 = v124[2];
    swift_release();
    if (v100)
    {
      swift_bridgeObjectRelease();

      v101 = v110;
      v67(v110, (uint64_t)v109, v85);
      return (id)((uint64_t (*)(char *, _QWORD, uint64_t, uint64_t))v88)(v101, 0, 1, v85);
    }
    else
    {
      if (v83)
      {
        v102 = v110;
        v103 = (void *)v106;
        if (!*(_QWORD *)(v81 + 16))
          __break(1u);
        ((void (*)(char *, unint64_t, uint64_t))v111)(v110, v81 + ((*(unsigned __int8 *)(v118 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v118 + 80)), v85);
        v104 = 0;
      }
      else
      {
        v104 = 1;
        v102 = v110;
        v103 = (void *)v106;
      }
      v88((uint64_t)v102, v104, 1, v85);
      swift_bridgeObjectRelease();

      return (id)((uint64_t (*)(char *, uint64_t))v108)(v109, v85);
    }
  }
  else
  {
    v94 = v124;
    v95 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
    v96 = Logger.logObject.getter();
    v97 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v96, (os_log_type_t)v97))
    {
      v98 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v98 = 0;
      _os_log_impl(&dword_21FDE7000, v96, (os_log_type_t)v97, "Invalid Trial asset path", v98, 2u);
      MEMORY[0x2207D560C](v98, -1, -1);
    }

    v99 = v117;
    v108(v109, v117);
    return (id)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v52 + 56))(v110, 1, 1, v99);
  }
}

uint64_t TrialProvider.assetPath(assetName:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  void (*v15)(_BYTE *, uint64_t);
  _BYTE v17[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8](v3);
  v5 = &v17[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = type metadata accessor for URL();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v17[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = &v17[-v12];
  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 152))(v11);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    v14 = outlined destroy of Any?((uint64_t)v5, &demangling cache variable for type metadata for URL?);
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 192))(v14);
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 32))(v13, v5, v6);
    URL.appendingPathComponent(_:)();
    swift_bridgeObjectRelease();
    URL.path.getter();
    v15 = *(void (**)(_BYTE *, uint64_t))(v7 + 8);
    v15(v10, v6);
    URL.init(fileURLWithPath:)();
    swift_bridgeObjectRelease();
    v15(v13, v6);
  }
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
}

uint64_t TrialProvider.loadModel()()
{
  uint64_t v0;
  void *v1;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t);
  id v22;
  void (*v23)(char *, uint64_t);
  uint64_t v24;
  char *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  void (*v33)(char *, uint64_t);
  id v34;
  uint64_t v35;
  char *v36;
  char *v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  unint64_t v42;
  void (*v43)(char *, uint64_t);
  uint8_t *v44;
  uint64_t v45;
  _QWORD v47[2];
  uint8_t *v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t);
  char *v51;
  void (*v52)(char *, uint64_t);
  uint64_t v53;
  uint64_t v54;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for URL();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v52 = (void (*)(char *, uint64_t))((char *)v47 - v11);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v47 - v13;
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)v47 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)v47 - v18;
  (*(void (**)(_QWORD))(*(_QWORD *)v0 + 208))(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    outlined destroy of Any?((uint64_t)v4, &demangling cache variable for type metadata for URL?);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v19, v4, v5);
    v21 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
    v51 = v19;
    v21(v17, v19, v5);
    type metadata accessor for MLModel();
    v21(v14, v17, v5);
    v22 = @nonobjc MLModel.__allocating_init(contentsOf:)((uint64_t)v14);
    if (v1)
    {
      v23 = *(void (**)(char *, uint64_t))(v6 + 8);
      v23(v17, v5);

      if (one-time initialization token for defaultLogger != -1)
        swift_once();
      v24 = type metadata accessor for Logger();
      __swift_project_value_buffer(v24, (uint64_t)defaultLogger);
      v25 = v51;
      v21(v9, v51, v5);
      v26 = Logger.logObject.getter();
      v27 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v26, v27))
      {
        v28 = swift_slowAlloc();
        v52 = v23;
        v29 = (uint8_t *)v28;
        v30 = swift_slowAlloc();
        v54 = v30;
        *(_DWORD *)v29 = 136315138;
        v50 = (void (*)(char *, uint64_t))(v29 + 4);
        lazy protocol witness table accessor for type URL and conformance URL();
        v31 = dispatch thunk of CustomStringConvertible.description.getter();
        v53 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v31, v32, &v54);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        v33 = v52;
        v52(v9, v5);
        _os_log_impl(&dword_21FDE7000, v26, v27, "Unable to load model from Trial asset path %s", v29, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2207D560C](v30, -1, -1);
        MEMORY[0x2207D560C](v29, -1, -1);

        v33(v25, v5);
      }
      else
      {

        v23(v9, v5);
        v23(v25, v5);
      }
      return 0;
    }
    else
    {
      v34 = v22;
      type metadata accessor for InferredHelpfulnessClassifier();
      v20 = swift_allocObject();
      *(_QWORD *)(v20 + 16) = v34;
      *(_QWORD *)(v20 + 24) = 3;
      v50 = *(void (**)(char *, uint64_t))(v6 + 8);
      v50(v17, v5);
      if (one-time initialization token for defaultLogger != -1)
        swift_once();
      v35 = type metadata accessor for Logger();
      __swift_project_value_buffer(v35, (uint64_t)defaultLogger);
      v36 = v51;
      v37 = (char *)v52;
      v21((char *)v52, v51, v5);
      v38 = Logger.logObject.getter();
      v39 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v38, v39))
      {
        v40 = (uint8_t *)swift_slowAlloc();
        v49 = swift_slowAlloc();
        v54 = v49;
        v48 = v40;
        *(_DWORD *)v40 = 136315138;
        v47[1] = v40 + 4;
        lazy protocol witness table accessor for type URL and conformance URL();
        v41 = dispatch thunk of CustomStringConvertible.description.getter();
        v53 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v41, v42, &v54);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        v43 = v50;
        v50(v37, v5);
        v44 = v48;
        _os_log_impl(&dword_21FDE7000, v38, v39, "Load model from Trial asset from %s", v48, 0xCu);
        v45 = v49;
        swift_arrayDestroy();
        MEMORY[0x2207D560C](v45, -1, -1);
        MEMORY[0x2207D560C](v44, -1, -1);

      }
      else
      {

        v43 = v50;
        v50(v37, v5);
      }
      v43(v36, v5);
    }
  }
  return v20;
}

unint64_t TrialProvider.loadCatIdMap()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  void (*v25)(char *, uint64_t);
  void *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  Class isa;
  id v36;
  id v37;
  id v38;
  void *v39;
  _QWORD v40[2];
  char *v41;
  uint64_t v42;
  id v43[5];

  v43[4] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v40 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for URL();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v40 - v9;
  v11 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x24BEE4AF8]);
  (*(void (**)(uint64_t))(*(_QWORD *)v0 + 208))(1);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    outlined destroy of Any?((uint64_t)v3, &demangling cache variable for type metadata for URL?);
    if (one-time initialization token for defaultLogger != -1)
      swift_once();
    v12 = type metadata accessor for Logger();
    __swift_project_value_buffer(v12, (uint64_t)defaultLogger);
    v13 = Logger.logObject.getter();
    v14 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_21FDE7000, v13, v14, "Unable to load speakEasy category mapping file from Trial asset", v15, 2u);
      MEMORY[0x2207D560C](v15, -1, -1);
    }

  }
  else
  {
    swift_bridgeObjectRelease();
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v3, v4);
    if (one-time initialization token for defaultLogger != -1)
      swift_once();
    v16 = type metadata accessor for Logger();
    v17 = __swift_project_value_buffer(v16, (uint64_t)defaultLogger);
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
    v18 = Logger.logObject.getter();
    v19 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      v21 = (void *)swift_slowAlloc();
      v41 = v10;
      v22 = v21;
      v43[0] = v21;
      *(_DWORD *)v20 = 136315138;
      v40[0] = v20 + 4;
      v40[1] = v17;
      lazy protocol witness table accessor for type URL and conformance URL();
      v23 = dispatch thunk of CustomStringConvertible.description.getter();
      v42 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v23, v24, (uint64_t *)v43);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v25 = *(void (**)(char *, uint64_t))(v5 + 8);
      v25(v8, v4);
      _os_log_impl(&dword_21FDE7000, v18, v19, "Load CatIdToSpeakeasyCategory mapping from Trial asset: %s", v20, 0xCu);
      swift_arrayDestroy();
      v26 = v22;
      v10 = v41;
      MEMORY[0x2207D560C](v26, -1, -1);
      MEMORY[0x2207D560C](v20, -1, -1);
    }
    else
    {
      v25 = *(void (**)(char *, uint64_t))(v5 + 8);
      v25(v8, v4);
    }

    v11 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x24BEE4AF8]);
    v31 = Data.init(contentsOf:options:)();
    v33 = v32;
    v34 = (void *)objc_opt_self();
    isa = Data._bridgeToObjectiveC()().super.isa;
    v43[0] = 0;
    v36 = objc_msgSend(v34, sel_JSONObjectWithData_options_error_, isa, 1, v43);

    if (v36)
    {
      v37 = v43[0];
      _bridgeAnyObjectToAny(_:)();
      outlined consume of Data._Representation(v31, v33);
      swift_unknownObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : String]);
      if ((swift_dynamicCast() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        v11 = v42;
      }
    }
    else
    {
      v38 = v43[0];
      v39 = (void *)_convertNSErrorToError(_:)();

      swift_willThrow();
      outlined consume of Data._Representation(v31, v33);
      v27 = Logger.logObject.getter();
      v28 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v27, v28))
      {
        v29 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v29 = 0;
        _os_log_impl(&dword_21FDE7000, v27, v28, "Unable to parse CatIdToSpeakeasyCategory", v29, 2u);
        MEMORY[0x2207D560C](v29, -1, -1);
      }

    }
    v25(v10, v4);
  }
  return v11;
}

unint64_t TrialProvider.loadJsonFlags(_:)()
{
  unint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  Class isa;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16[5];

  v16[4] = *(id *)MEMORY[0x24BDAC8D0];
  v0 = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x24BEE4AF8]);
  v6 = Data.init(contentsOf:options:)();
  v8 = v7;
  v9 = (void *)objc_opt_self();
  isa = Data._bridgeToObjectiveC()().super.isa;
  v16[0] = 0;
  v11 = objc_msgSend(v9, sel_JSONObjectWithData_options_error_, isa, 1, v16);

  if (v11)
  {
    v12 = v16[0];
    _bridgeAnyObjectToAny(_:)();
    outlined consume of Data._Representation(v6, v8);
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]);
    if (swift_dynamicCast())
    {
      swift_bridgeObjectRelease();
      return v15;
    }
  }
  else
  {
    v13 = v16[0];
    v14 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
    outlined consume of Data._Representation(v6, v8);
    if (one-time initialization token for defaultLogger != -1)
      swift_once();
    v1 = type metadata accessor for Logger();
    __swift_project_value_buffer(v1, (uint64_t)defaultLogger);
    v2 = Logger.logObject.getter();
    v3 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_21FDE7000, v2, v3, "Unable to parse flag file", v4, 2u);
      MEMORY[0x2207D560C](v4, -1, -1);
    }

  }
  return v0;
}

Swift::Bool __swiftcall TrialProvider.isIHPluginEnabled()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  _BYTE v21[16];
  __int128 v22;
  __int128 v23;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8](v1);
  v3 = &v21[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = type metadata accessor for URL();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v21[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(uint64_t))(*(_QWORD *)v0 + 208))(2);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    outlined destroy of Any?((uint64_t)v3, &demangling cache variable for type metadata for URL?);
LABEL_16:
    if (one-time initialization token for defaultLogger != -1)
      swift_once();
    v16 = type metadata accessor for Logger();
    __swift_project_value_buffer(v16, (uint64_t)defaultLogger);
    v17 = Logger.logObject.getter();
    v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v19 = 67109120;
      LODWORD(v22) = 0;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_21FDE7000, v17, v18, "Using default level for isIHPluginEnabled: %{BOOL}d", v19, 8u);
      MEMORY[0x2207D560C](v19, -1, -1);
    }

    LOBYTE(v11) = 0;
    return v11;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 32))(v7, v3, v4);
  v8 = (*(uint64_t (**)(_BYTE *))(*(_QWORD *)v0 + 232))(v7);
  if (*(_QWORD *)(v8 + 16)
    && (v9 = specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000011, 0x800000021FE110B0), (v10 & 1) != 0))
  {
    outlined init with copy of Any(*(_QWORD *)(v8 + 56) + 32 * v9, (uint64_t)&v22);
  }
  else
  {
    v22 = 0u;
    v23 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v23 + 1))
  {
    outlined destroy of Any?((uint64_t)&v22, &demangling cache variable for type metadata for Any?);
    goto LABEL_15;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_15:
    (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
    goto LABEL_16;
  }
  v11 = v21[15];
  if (one-time initialization token for defaultLogger != -1)
    swift_once();
  v12 = type metadata accessor for Logger();
  __swift_project_value_buffer(v12, (uint64_t)defaultLogger);
  v13 = Logger.logObject.getter();
  v14 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v15 = 67109120;
    LODWORD(v22) = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_21FDE7000, v13, v14, "Use Trial server flag for isIHPluginEnabled: %{BOOL}d", v15, 8u);
    MEMORY[0x2207D560C](v15, -1, -1);
  }

  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  return v11;
}

uint64_t TrialProvider.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of Any?(v0 + OBJC_IVAR____TtC23SiriInferredHelpfulness13TrialProvider____lazy_storage___assetUrl, &demangling cache variable for type metadata for URL??);
  return v0;
}

uint64_t TrialProvider.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of Any?(v0 + OBJC_IVAR____TtC23SiriInferredHelpfulness13TrialProvider____lazy_storage___assetUrl, &demangling cache variable for type metadata for URL??);
  return swift_deallocClassInstance();
}

uint64_t specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<FlowTaskStep>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
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

{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<GradedConversation>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8])
      memmove(v12, v13, 24 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[24 * v8] || v12 >= &v13[24 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Int>);
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
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
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
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<URL>);
  v10 = *(_QWORD *)(type metadata accessor for URL() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_34;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(type metadata accessor for URL() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (char *)v13 + v17;
  v19 = (char *)a4 + v17;
  if ((a1 & 1) != 0)
  {
    if (v13 < a4 || v18 >= &v19[*(_QWORD *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v20 = *(_QWORD *)(v16 + 72) * v8;
  v21 = &v18[v20];
  v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized static TrialEnrollment.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
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
  char v13;
  uint64_t result;
  char v15;

  v3 = a1[1];
  v4 = a1[2];
  v6 = a1[3];
  v5 = a1[4];
  v7 = a1[5];
  v8 = a2[1];
  v9 = a2[2];
  v11 = a2[3];
  v10 = a2[4];
  v12 = a2[5];
  if (!v3)
  {
    if (v8)
      return 0;
    goto LABEL_8;
  }
  if (!v8)
    return 0;
  if (*a1 == *a2 && v3 == v8 || (v13 = _stringCompareWithSmolCheck(_:_:expecting:)(), result = 0, (v13 & 1) != 0))
  {
LABEL_8:
    if (v6)
    {
      if (!v11)
        return 0;
      if (v4 != v9 || v6 != v11)
      {
        v15 = _stringCompareWithSmolCheck(_:_:expecting:)();
        result = 0;
        if ((v15 & 1) == 0)
          return result;
      }
    }
    else if (v11)
    {
      return 0;
    }
    if (v7)
    {
      if (v12 && (v5 == v10 && v7 == v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
        return 1;
    }
    else if (!v12)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

unint64_t specialized TrialAsset.init(rawValue:)(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of TrialAsset.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 3)
    return 3;
  else
    return v3;
}

unint64_t lazy protocol witness table accessor for type TrialEnrollment.CodingKeys and conformance TrialEnrollment.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TrialEnrollment.CodingKeys and conformance TrialEnrollment.CodingKeys;
  if (!lazy protocol witness table cache variable for type TrialEnrollment.CodingKeys and conformance TrialEnrollment.CodingKeys)
  {
    result = MEMORY[0x2207D5564](&protocol conformance descriptor for TrialEnrollment.CodingKeys, &unk_24E5B3BE8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TrialEnrollment.CodingKeys and conformance TrialEnrollment.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TrialEnrollment.CodingKeys and conformance TrialEnrollment.CodingKeys;
  if (!lazy protocol witness table cache variable for type TrialEnrollment.CodingKeys and conformance TrialEnrollment.CodingKeys)
  {
    result = MEMORY[0x2207D5564](&protocol conformance descriptor for TrialEnrollment.CodingKeys, &unk_24E5B3BE8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TrialEnrollment.CodingKeys and conformance TrialEnrollment.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TrialEnrollment.CodingKeys and conformance TrialEnrollment.CodingKeys;
  if (!lazy protocol witness table cache variable for type TrialEnrollment.CodingKeys and conformance TrialEnrollment.CodingKeys)
  {
    result = MEMORY[0x2207D5564]("edz.<N", &unk_24E5B3BE8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TrialEnrollment.CodingKeys and conformance TrialEnrollment.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TrialEnrollment.CodingKeys and conformance TrialEnrollment.CodingKeys;
  if (!lazy protocol witness table cache variable for type TrialEnrollment.CodingKeys and conformance TrialEnrollment.CodingKeys)
  {
    result = MEMORY[0x2207D5564](&protocol conformance descriptor for TrialEnrollment.CodingKeys, &unk_24E5B3BE8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TrialEnrollment.CodingKeys and conformance TrialEnrollment.CodingKeys);
  }
  return result;
}

uint64_t outlined assign with take of URL??(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL??);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with take of URL?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t lazy protocol witness table accessor for type URL and conformance URL()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type URL and conformance URL;
  if (!lazy protocol witness table cache variable for type URL and conformance URL)
  {
    v1 = type metadata accessor for URL();
    result = MEMORY[0x2207D5564](MEMORY[0x24BDCDB28], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type URL and conformance URL);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type TrialAsset and conformance TrialAsset()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type TrialAsset and conformance TrialAsset;
  if (!lazy protocol witness table cache variable for type TrialAsset and conformance TrialAsset)
  {
    result = MEMORY[0x2207D5564](&protocol conformance descriptor for TrialAsset, &type metadata for TrialAsset);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type TrialAsset and conformance TrialAsset);
  }
  return result;
}

uint64_t sub_21FE03564@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 104))();
  *a2 = result;
  return result;
}

uint64_t sub_21FE03594(id *a1, uint64_t a2)
{
  return (*(uint64_t (**)(id))(**(_QWORD **)a2 + 112))(*a1);
}

double sub_21FE035C4@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  __int128 v3;
  double result;
  _OWORD v5[2];
  __int128 v6;

  (*(void (**)(_OWORD *__return_ptr))(**(_QWORD **)a1 + 128))(v5);
  v3 = v5[1];
  *a2 = v5[0];
  a2[1] = v3;
  result = *(double *)&v6;
  a2[2] = v6;
  return result;
}

uint64_t sub_21FE03610(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 152))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTag for TrialAsset(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for TrialAsset(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TrialAsset()
{
  return &type metadata for TrialAsset;
}

uint64_t destroy for TrialEnrollment()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for TrialEnrollment(_QWORD *a1, _QWORD *a2)
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
  return a1;
}

_QWORD *assignWithCopy for TrialEnrollment(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
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

_QWORD *assignWithTake for TrialEnrollment(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TrialEnrollment(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TrialEnrollment(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 48) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for TrialEnrollment()
{
  return &type metadata for TrialEnrollment;
}

uint64_t ObjC metadata update function for TrialProvider()
{
  return type metadata accessor for TrialProvider();
}

uint64_t type metadata accessor for TrialProvider()
{
  uint64_t result;

  result = type metadata singleton initialization cache for TrialProvider;
  if (!type metadata singleton initialization cache for TrialProvider)
    return swift_getSingletonMetadata();
  return result;
}

void type metadata completion function for TrialProvider()
{
  unint64_t v0;

  type metadata accessor for URL??();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for TrialProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TrialProvider.client.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of TrialProvider.client.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of TrialProvider.client.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of TrialProvider.enrollment.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of TrialProvider.enrollment.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of TrialProvider.enrollment.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of TrialProvider.assetUrl.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of TrialProvider.assetUrl.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of TrialProvider.assetUrl.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of TrialProvider.__allocating_init(client:enrollment:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of TrialProvider.setClient(client:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of TrialProvider.defaultAssetsUrl()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of TrialProvider.fetchUpdatedAssetsURL(client:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of TrialProvider.assetPath(assetName:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of TrialProvider.loadModel()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of TrialProvider.loadCatIdMap()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of TrialProvider.loadJsonFlags(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of TrialProvider.isIHPluginEnabled()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

void type metadata accessor for URL??()
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for URL??)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for URL?);
    v0 = type metadata accessor for Optional();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for URL??);
  }
}

uint64_t getEnumTagSinglePayload for TrialAsset(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for TrialAsset(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_21FE03BB0 + 4 * byte_21FE0D635[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_21FE03BE4 + 4 * byte_21FE0D630[v4]))();
}

uint64_t sub_21FE03BE4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21FE03BEC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21FE03BF4);
  return result;
}

uint64_t sub_21FE03C00(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21FE03C08);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_21FE03C0C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21FE03C14(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void *type metadata accessor for TrialEnrollment.CodingKeys()
{
  return &unk_24E5B3BE8;
}

uint64_t specialized TrialEnrollment.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6E656D7461657274 && a2 == 0xEB00000000644974;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656D697265707865 && a2 == 0xEC0000006449746ELL
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x4974756F6C6C6F72 && a2 == 0xE900000000000064)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t outlined init with copy of URL??(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

Swift::Double_optional __swiftcall String.scoreRatcliffObershelp(between:)(Swift::String between)
{
  uint64_t v1;
  unint64_t v2;
  double v3;
  uint64_t v4;
  void *object;
  unint64_t countAndFlagsBits;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  int64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  double v25;
  uint64_t v26;
  Swift::Double_optional result;

  v4 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0)
    v4 = v1 & 0xFFFFFFFFFFFFLL;
  if (!v4)
    goto LABEL_11;
  object = between._object;
  countAndFlagsBits = between._countAndFlagsBits;
  v7 = HIBYTE(between._object) & 0xF;
  if (((uint64_t)between._object & 0x2000000000000000) == 0)
    v7 = between._countAndFlagsBits & 0xFFFFFFFFFFFFLL;
  if (!v7)
  {
LABEL_11:
    LOBYTE(v10) = 0;
    goto LABEL_28;
  }
  v8 = v2;
  v9 = v1;
  if (v1 == between._countAndFlagsBits && (void *)v2 == between._object
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    LOBYTE(v10) = 0;
    goto LABEL_28;
  }
  v11 = String.count.getter();
  v10 = String.count.getter();
  v12 = v11 + v10;
  if (__OFADD__(v11, v10))
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v13 = String.commonSequences(between:)(countAndFlagsBits, (unint64_t)object, v9, v8);
  v14 = v13[2];
  if (v14)
  {
    v26 = MEMORY[0x24BEE4AF8];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v14, 0);
    v15 = v26;
    v16 = v13 + 5;
    do
    {
      swift_bridgeObjectRetain();
      v17 = String.count.getter();
      swift_bridgeObjectRelease();
      v19 = *(_QWORD *)(v26 + 16);
      v18 = *(_QWORD *)(v26 + 24);
      if (v19 >= v18 >> 1)
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v18 > 1, v19 + 1, 1);
      v16 += 2;
      *(_QWORD *)(v26 + 16) = v19 + 1;
      *(_QWORD *)(v26 + 8 * v19 + 32) = v17;
      --v14;
    }
    while (v14);
    LOBYTE(v10) = swift_bridgeObjectRelease();
    v20 = *(_QWORD *)(v26 + 16);
    if (v20)
    {
LABEL_19:
      v21 = 0;
      v22 = 0;
      while (1)
      {
        v23 = *(_QWORD *)(v15 + 8 * v21 + 32);
        v24 = __OFADD__(v22, v23);
        v22 += v23;
        if (v24)
          break;
        if (v20 == ++v21)
        {
          swift_bridgeObjectRelease();
          v25 = (double)v22;
          goto LABEL_25;
        }
      }
      __break(1u);
      goto LABEL_27;
    }
  }
  else
  {
    LOBYTE(v10) = swift_bridgeObjectRelease();
    v15 = MEMORY[0x24BEE4AF8];
    v20 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
    if (v20)
      goto LABEL_19;
  }
  swift_bridgeObjectRelease();
  v25 = 0.0;
LABEL_25:
  v3 = 2.0 / (double)v12 * v25;
  LOBYTE(v10) = LOBYTE(v3);
LABEL_28:
  result.value = v3;
  result.is_nil = v10;
  return result;
}

_QWORD *String.commonSequences(between:)(unint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  int64_t v5;
  unint64_t v6;
  uint64_t v11;
  int64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  uint64_t v23;
  BOOL v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  _QWORD *v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  _QWORD *v60;
  _QWORD *v61;
  unint64_t v62;
  unint64_t v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  _QWORD *v82;
  _QWORD *v83;
  _QWORD *v84;

  v14 = String.longestCommonSubsequence(between:)();
  result = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (v14 >= 1)
  {
    v16 = v11;
    v17 = v11 - v14;
    if (__OFSUB__(v11, v14))
    {
      __break(1u);
    }
    else
    {
      v5 = v12;
      v4 = String.index(_:offsetBy:)();
      v13 = (unint64_t)String.index(_:offsetBy:)() >> 14;
      if (v13 >= v4 >> 14)
      {
        v81 = v5;
        v77 = a1;
        v18 = String.subscript.getter();
        a1 = MEMORY[0x2207D4E38](v18);
        v76 = v19;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        v17 = specialized Collection.prefix(_:)(v17);
        v4 = v20;
        v5 = v21;
        v6 = v22;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        v23 = String.count.getter();
        v24 = __OFSUB__(v23, v16);
        v25 = v23 - v16;
        if (!v24)
        {
          v75 = a1;
          v26 = specialized BidirectionalCollection.suffix(_:)(v25, a3, a4);
          v79 = v27;
          v80 = v26;
          v78 = v28;
          a3 = v29;
          swift_bridgeObjectRelease();
          v82 = (_QWORD *)MEMORY[0x24BEE4AF8];
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, 2, 0);
          v30 = v82;
          swift_bridgeObjectRetain();
          v17 = MEMORY[0x2207D4E38](v17, v4, v5, v6);
          v4 = v31;
          swift_bridgeObjectRelease();
          a1 = v82[2];
          v13 = v82[3];
          v5 = a1 + 1;
          if (a1 < v13 >> 1)
            goto LABEL_6;
          goto LABEL_24;
        }
LABEL_23:
        __break(1u);
LABEL_24:
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v13 > 1, v5, 1);
        v30 = v82;
LABEL_6:
        v30[2] = v5;
        v32 = &v30[2 * a1];
        v32[4] = v17;
        v32[5] = v4;
        swift_bridgeObjectRetain();
        v33 = MEMORY[0x2207D4E38](v80, v79, v78, a3);
        v35 = v34;
        swift_bridgeObjectRelease();
        v83 = v30;
        v37 = v30[2];
        v36 = v30[3];
        v38 = v37 + 1;
        if (v37 >= v36 >> 1)
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v36 > 1, v37 + 1, 1);
        v30[2] = v38;
        v39 = &v30[2 * v37];
        v39[4] = v33;
        v39[5] = v35;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v41 = v81 - v14;
        if (__OFSUB__(v81, v14))
        {
          __break(1u);
        }
        else
        {
          swift_bridgeObjectRetain();
          v6 = specialized Collection.prefix(_:)(v41);
          v41 = v42;
          v33 = v43;
          v45 = v44;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          v46 = String.count.getter();
          v24 = __OFSUB__(v46, v81);
          v47 = v46 - v81;
          if (!v24)
          {
            v48 = specialized BidirectionalCollection.suffix(_:)(v47, v77, a2);
            v80 = v49;
            v81 = v48;
            v38 = v50;
            v37 = v51;
            swift_bridgeObjectRelease();
            v83 = (_QWORD *)MEMORY[0x24BEE4AF8];
            specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, 2, 0);
            v52 = v83;
            swift_bridgeObjectRetain();
            v41 = MEMORY[0x2207D4E38](v6, v41, v33, v45);
            v33 = v53;
            swift_bridgeObjectRelease();
            v6 = v83[2];
            v40 = v83[3];
            a2 = v6 + 1;
            if (v6 < v40 >> 1)
              goto LABEL_11;
            goto LABEL_27;
          }
        }
        __break(1u);
LABEL_27:
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v40 > 1, a2, 1);
        v52 = v83;
LABEL_11:
        v52[2] = a2;
        v54 = &v52[2 * v6];
        v54[4] = v41;
        v54[5] = v33;
        swift_bridgeObjectRetain();
        v55 = MEMORY[0x2207D4E38](v81, v80, v38, v37);
        v57 = v56;
        swift_bridgeObjectRelease();
        v59 = v52[2];
        v58 = v52[3];
        if (v59 >= v58 >> 1)
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v58 > 1, v59 + 1, 1);
        v52[2] = v59 + 1;
        v60 = &v52[2 * v59];
        v60[4] = v55;
        v60[5] = v57;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        result = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, 1, 1, MEMORY[0x24BEE4AF8]);
        v61 = result;
        v63 = result[2];
        v62 = result[3];
        if (v63 >= v62 >> 1)
        {
          result = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v62 > 1), v63 + 1, 1, result);
          v61 = result;
        }
        v61[2] = v63 + 1;
        v64 = &v61[2 * v63];
        v64[4] = v75;
        v64[5] = v76;
        v84 = v61;
        if (v30[2])
        {
          if (v52[2])
          {
            v66 = v30[4];
            v65 = v30[5];
            v67 = v52[4];
            v68 = v52[5];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            v69 = String.commonSequences(between:)(v67, v68, v66, v65);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            result = (_QWORD *)specialized Array.append<A>(contentsOf:)(v69);
            if (v30[2] >= 2uLL)
            {
              v71 = v30[6];
              v70 = v30[7];
              swift_bridgeObjectRetain();
              result = (_QWORD *)swift_release();
              if (v52[2] >= 2uLL)
              {
                v72 = v52[6];
                v73 = v52[7];
                swift_bridgeObjectRetain();
                swift_release();
                v74 = String.commonSequences(between:)(v72, v73, v71, v70);
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                specialized Array.append<A>(contentsOf:)(v74);
                return v84;
              }
LABEL_31:
              __break(1u);
              return result;
            }
LABEL_30:
            __break(1u);
            goto LABEL_31;
          }
        }
        else
        {
          __break(1u);
        }
        __break(1u);
        goto LABEL_30;
      }
    }
    __break(1u);
    goto LABEL_23;
  }
  return result;
}

uint64_t String.longestCommonSubsequence(between:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  Swift::String_optional v4;
  uint64_t countAndFlagsBits;
  void *object;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  Swift::String_optional v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  Swift::String_optional v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v23;
  unint64_t v24;
  _QWORD *v26;
  unint64_t v27;
  unint64_t v28;

  v0 = String.count.getter();
  if (__OFADD__(v0, 1))
    goto LABEL_41;
  v1 = specialized Array.init(repeating:count:)(0, v0 + 1);
  v2 = String.count.getter();
  if (__OFADD__(v2, 1))
    goto LABEL_42;
  v3 = specialized Array.init(repeating:count:)(v1, v2 + 1);
  swift_bridgeObjectRetain();
  v26 = (_QWORD *)v3;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    goto LABEL_43;
  while (1)
  {
    v4 = String.Iterator.next()();
    if (!v4.value._object)
      break;
    countAndFlagsBits = v4.value._countAndFlagsBits;
    object = v4.value._object;
    v7 = 0;
    v8 = 0;
    v27 = 0;
    v28 = 0;
    v9 = v26 + 4;
    while (1)
    {
      v11 = v7 + 1;
      if (__OFADD__(v7, 1))
        break;
      swift_bridgeObjectRetain();
      v12 = 0;
LABEL_9:
      v13 = v12;
      while (1)
      {
        v15 = v13;
        v16 = String.Iterator.next()();
        if (!v16.value._object)
          break;
        v12 = v15 + 1;
        if (__OFADD__(v15, 1))
        {
          __break(1u);
LABEL_35:
          __break(1u);
LABEL_36:
          __break(1u);
LABEL_37:
          __break(1u);
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          goto LABEL_40;
        }
        if (countAndFlagsBits == v16.value._countAndFlagsBits && object == v16.value._object)
        {
          swift_bridgeObjectRelease();
LABEL_16:
          v17 = v26[2];
          if (v7 >= v17)
            goto LABEL_35;
          v18 = v9[v7];
          if (v15 >= *(_QWORD *)(v18 + 16))
            goto LABEL_36;
          v19 = *(_QWORD *)(v18 + 8 * v15 + 32);
          v20 = v19 + 1;
          if (__OFADD__(v19, 1))
            goto LABEL_37;
          if (v11 >= v17)
            goto LABEL_38;
          v21 = (_QWORD *)v9[v11];
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v9[v11] = v21;
          if ((isUniquelyReferenced_nonNull_native & 1) != 0)
          {
            if ((v12 & 0x8000000000000000) == 0)
              goto LABEL_22;
LABEL_31:
            __break(1u);
            goto LABEL_32;
          }
          v21 = specialized _ArrayBuffer._consumeAndCreateNew()(v21);
          v9[v11] = v21;
          if ((v12 & 0x8000000000000000) != 0)
            goto LABEL_31;
LABEL_22:
          if (v12 >= v21[2])
            goto LABEL_39;
          v21[v12 + 4] = v20;
          if (v8 >= v20)
            v23 = v28;
          else
            v23 = v12;
          v24 = v27;
          if (v8 < v20)
            v24 = v7 + 1;
          v27 = v24;
          v28 = v23;
          if (v8 <= v20)
            v8 = v20;
          goto LABEL_9;
        }
        v14 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        v13 = v15 + 1;
        if ((v14 & 1) != 0)
          goto LABEL_16;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v10 = String.Iterator.next()();
      countAndFlagsBits = v10.value._countAndFlagsBits;
      object = v10.value._object;
      ++v7;
      if (!v10.value._object)
        goto LABEL_33;
    }
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
LABEL_43:
    v26 = specialized _ArrayBuffer._consumeAndCreateNew()(v26);
  }
LABEL_32:
  v8 = 0;
LABEL_33:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t specialized Array.init(repeating:count:)(unint64_t a1, unint64_t a2)
{
  uint64_t result;
  unint64_t *v5;
  unint64_t v6;
  int64x2_t v7;
  int64x2_t *v8;
  unint64_t v9;
  unint64_t v10;

  if ((a2 & 0x8000000000000000) != 0)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  if (!a2)
    return MEMORY[0x24BEE4AF8];
  result = static Array._allocateBufferUninitialized(minimumCapacity:)();
  *(_QWORD *)(result + 16) = a2;
  v5 = (unint64_t *)(result + 32);
  if (a2 < 4)
  {
    v6 = 0;
LABEL_9:
    v10 = a2 - v6;
    do
    {
      *v5++ = a1;
      --v10;
    }
    while (v10);
    return result;
  }
  v6 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  v5 += a2 & 0xFFFFFFFFFFFFFFFCLL;
  v7 = vdupq_n_s64(a1);
  v8 = (int64x2_t *)(result + 48);
  v9 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  do
  {
    v8[-1] = v7;
    *v8 = v7;
    v8 += 2;
    v9 -= 4;
  }
  while (v9);
  if (v6 != a2)
    goto LABEL_9;
  return result;
}

uint64_t specialized Array.init(repeating:count:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t result;

  if (a2 < 0)
  {
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    if (a2)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Int]);
      v4 = (_QWORD *)static Array._allocateBufferUninitialized(minimumCapacity:)();
      v5 = v4;
      v4[2] = a2;
      v4[4] = a1;
      if (a2 != 1)
      {
        v4[5] = a1;
        v6 = a2 - 2;
        if (v6)
        {
          v7 = v4 + 6;
          do
          {
            *v7++ = a1;
            swift_bridgeObjectRetain();
            --v6;
          }
          while (v6);
        }
        swift_bridgeObjectRetain();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      return MEMORY[0x24BEE4AF8];
    }
    return (uint64_t)v5;
  }
  return result;
}

_QWORD *specialized _ArrayBuffer._consumeAndCreateNew()(_QWORD *a1)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, a1[2], 0, a1);
}

{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, a1[2], 0, a1);
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

uint64_t specialized Collection.prefix(_:)(uint64_t result, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Swift::Int v10;
  Swift::Int v11;
  uint64_t v12;

  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v3 = result;
    v4 = a2 >> 62;
    if (!(a2 >> 62))
    {
      v5 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  v5 = _CocoaArrayWrapper.endIndex.getter();
  result = swift_bridgeObjectRelease();
LABEL_4:
  if (v5 >= v3)
    v6 = v3;
  else
    v6 = v5;
  if (v5 < 0)
    v6 = v3;
  if (v3)
    v7 = v6;
  else
    v7 = 0;
  if (v4)
  {
    swift_bridgeObjectRetain();
    v9 = _CocoaArrayWrapper.endIndex.getter();
    result = swift_bridgeObjectRelease();
    if (v9 < 0)
    {
LABEL_28:
      __break(1u);
      return result;
    }
    swift_bridgeObjectRetain();
    v8 = _CocoaArrayWrapper.endIndex.getter();
    result = swift_bridgeObjectRelease();
  }
  else
  {
    v8 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v8 < v7)
  {
    __break(1u);
    goto LABEL_28;
  }
  if ((v2 & 0xC000000000000001) != 0 && v7)
  {
    type metadata accessor for FeaturedTurn(0);
    v10 = 0;
    do
    {
      v11 = v10 + 1;
      _ArrayBuffer._typeCheckSlowPath(_:)(v10);
      v10 = v11;
    }
    while (v7 != v11);
  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    v12 = _CocoaArrayWrapper.subscript.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  return v12;
}

unint64_t specialized BidirectionalCollection.suffix(_:)(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  char v4;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((a3 & 0x2000000000000000) != 0)
      v3 = HIBYTE(a3) & 0xF;
    else
      v3 = a2 & 0xFFFFFFFFFFFFLL;
    result = String.index(_:offsetBy:limitedBy:)();
    if ((v4 & 1) != 0)
      result = 15;
    if (4 * v3 >= result >> 14)
      return String.subscript.getter();
  }
  __break(1u);
  return result;
}

uint64_t specialized Collection.featureValueByType<A, B>(as:)(uint64_t a1, uint64_t (*a2)(void))
{
  unint64_t v2;
  uint64_t result;
  uint64_t v4;

  v2 = a2();
  if (v2 >> 62)
  {
    result = _CocoaArrayWrapper.endIndex.getter();
    if (result)
      goto LABEL_3;
LABEL_8:
    swift_bridgeObjectRelease();
    return 0;
  }
  result = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!result)
    goto LABEL_8;
LABEL_3:
  if ((v2 & 0xC000000000000001) != 0)
  {
    MEMORY[0x2207D5048](0, v2);
    goto LABEL_6;
  }
  if (*(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    swift_retain();
LABEL_6:
    swift_bridgeObjectRelease();
    swift_retain();
    dispatch thunk of TypedFeature.value.getter();
    swift_release_n();
    return v4;
  }
  __break(1u);
  return result;
}

uint64_t SequenceFeatureExtractor.__allocating_init()()
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = &outlined read-only object #0 of SequenceFeatureExtractor.__allocating_init();
  return result;
}

uint64_t SequenceFeatureExtractor.init()()
{
  uint64_t v0;
  uint64_t result;

  result = v0;
  *(_QWORD *)(v0 + 16) = &outlined read-only object #0 of SequenceFeatureExtractor.init();
  return result;
}

uint64_t implicit closure #1 in variable initialization expression of SequenceFeatureExtractor.featureExtractors@<X0>(double **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = specialized static SequenceFeatureExtractor.secondsTillNexRequest(_:)(*a1);
  *a2 = result;
  return result;
}

uint64_t implicit closure #2 in variable initialization expression of SequenceFeatureExtractor.featureExtractors@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = specialized static SequenceFeatureExtractor.textSimilarityScoreWithNextRequest(_:)(*a1, (uint64_t (*)(void))specialized Collection.filterByType<A>(as:), (uint64_t)type metadata accessor for TextSimilarityScoreWithNextRequest);
  *a2 = result;
  return result;
}

uint64_t static SequenceFeatureExtractor.textSimilarityScoreWithNextRequest(_:)(uint64_t a1)
{
  return specialized static SequenceFeatureExtractor.textSimilarityScoreWithNextRequest(_:)(a1, (uint64_t (*)(void))specialized Collection.filterByType<A>(as:), (uint64_t)type metadata accessor for TextSimilarityScoreWithNextRequest);
}

uint64_t implicit closure #3 in variable initialization expression of SequenceFeatureExtractor.featureExtractors@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = specialized static SequenceFeatureExtractor.textSimilarityScoreWithNextRequest(_:)(*a1, (uint64_t (*)(void))specialized Collection.filterByType<A>(as:), (uint64_t)type metadata accessor for PhoneticRestatementScoreWithNextRequest);
  *a2 = result;
  return result;
}

uint64_t static SequenceFeatureExtractor.phoneticRestatementScoreWithNextRequest(_:)(uint64_t a1)
{
  return specialized static SequenceFeatureExtractor.textSimilarityScoreWithNextRequest(_:)(a1, (uint64_t (*)(void))specialized Collection.filterByType<A>(as:), (uint64_t)type metadata accessor for PhoneticRestatementScoreWithNextRequest);
}

uint64_t implicit closure #4 in variable initialization expression of SequenceFeatureExtractor.featureExtractors@<X0>(uint64_t *a1@<X8>)
{
  return implicit closure #4 in variable initialization expression of SequenceFeatureExtractor.featureExtractors((void (*)(_QWORD))type metadata accessor for ConfirmationFollowed, a1);
}

uint64_t static SequenceFeatureExtractor.confirmationFollowed(_:)(uint64_t a1)
{
  return static SequenceFeatureExtractor.confirmationFollowed(_:)(a1, (void (*)(_QWORD))type metadata accessor for ConfirmationFollowed);
}

uint64_t implicit closure #5 in variable initialization expression of SequenceFeatureExtractor.featureExtractors@<X0>(uint64_t *a1@<X8>)
{
  return implicit closure #4 in variable initialization expression of SequenceFeatureExtractor.featureExtractors((void (*)(_QWORD))type metadata accessor for CancellationFollowed, a1);
}

uint64_t implicit closure #4 in variable initialization expression of SequenceFeatureExtractor.featureExtractors@<X0>(void (*a1)(_QWORD)@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t result;
  _DWORD v13[4];

  v4 = type metadata accessor for Confidence();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v13 - v9;
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))((char *)v13 - v9, *MEMORY[0x24BEA4C58], v4);
  a1(0);
  swift_allocObject();
  v13[3] = 0;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
  v11 = TypedFeature.init(value:confidence:)();
  result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  *a2 = v11;
  return result;
}

uint64_t static SequenceFeatureExtractor.cancellationFollowed(_:)(uint64_t a1)
{
  return static SequenceFeatureExtractor.confirmationFollowed(_:)(a1, (void (*)(_QWORD))type metadata accessor for CancellationFollowed);
}

uint64_t static SequenceFeatureExtractor.confirmationFollowed(_:)(uint64_t a1, void (*a2)(_QWORD))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _DWORD v12[4];

  v3 = type metadata accessor for Confidence();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v12 - v8;
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))((char *)v12 - v8, *MEMORY[0x24BEA4C58], v3);
  a2(0);
  swift_allocObject();
  v12[3] = 0;
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v3);
  v10 = TypedFeature.init(value:confidence:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  return v10;
}

uint64_t SequenceFeatureExtractor.featureExtractors.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SequenceFeatureExtractor.extract(from:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t *__return_ptr, uint64_t *);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = MEMORY[0x24BEE4AF8];
  v11 = MEMORY[0x24BEE4AF8];
  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v4 + 16);
  if (v5)
  {
    swift_bridgeObjectRetain();
    v6 = v4 + 40;
    do
    {
      v7 = *(void (**)(uint64_t *__return_ptr, uint64_t *))(v6 - 8);
      v10 = a1;
      swift_retain();
      v7(&v9, &v10);
      swift_release();
      if (v9)
      {
        v8 = swift_retain();
        MEMORY[0x2207D4EB0](v8);
        if (*(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
        swift_release();
      }
      v6 += 16;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
    return v11;
  }
  return result;
}

uint64_t static SequenceFeatureExtractor.secondsBetweenTurns(_:_:)(uint64_t a1, uint64_t a2)
{
  if (a2)
    return fabs(*(double *)(a1 + 40) - *(double *)(a2 + 40));
  else
    return 0;
}

uint64_t static SequenceFeatureExtractor.textSimilarityScoreBetweenTurns(_:_:)(uint64_t a1, uint64_t a2)
{
  return static SequenceFeatureExtractor.textSimilarityScoreBetweenTurns(_:_:)(a1, a2, (uint64_t (*)(void))specialized Collection.filterByType<A>(as:));
}

uint64_t static SequenceFeatureExtractor.phoneticRestatementScoreBetweenTurns(_:_:)(uint64_t a1, uint64_t a2)
{
  return static SequenceFeatureExtractor.textSimilarityScoreBetweenTurns(_:_:)(a1, a2, (uint64_t (*)(void))specialized Collection.filterByType<A>(as:));
}

uint64_t static SequenceFeatureExtractor.textSimilarityScoreBetweenTurns(_:_:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  Swift::String v14;
  uint64_t v15;
  Swift::Double_optional v17;

  v5 = (*(uint64_t (**)(void))(*(_QWORD *)a1 + 120))();
  specialized Collection.featureValueByType<A, B>(as:)(v5, a3);
  v7 = v6;
  swift_bridgeObjectRelease();
  if (!v7)
    return 0;
  if (!a2)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  v8 = *(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 120);
  v9 = swift_retain();
  v10 = v8(v9);
  v11 = specialized Collection.featureValueByType<A, B>(as:)(v10, a3);
  v13 = v12;
  swift_bridgeObjectRelease();
  if (!v13)
  {
    swift_bridgeObjectRelease();
    swift_release();
    return 0;
  }
  v14._countAndFlagsBits = v11;
  v14._object = v13;
  v17 = String.scoreRatcliffObershelp(between:)(v14);
  v15 = *(_QWORD *)&v17.is_nil;
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t ConfirmationFollowed.__allocating_init(value:confidence:)(int a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _DWORD v10[4];

  v4 = type metadata accessor for Confidence();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  v10[3] = a1;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  v8 = TypedFeature.init(value:confidence:)();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  return v8;
}

uint64_t SequenceFeatureExtractor.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SequenceFeatureExtractor.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t protocol witness for FeatureExtracting.extract(from:) in conformance SequenceFeatureExtractor(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)v1 + 96))(*a1);
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to SecondsTillNextRequest.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to SecondsTillNextRequest.__allocating_init(value:confidence:)(a1, a2, (void (*)(_QWORD))type metadata accessor for SecondsTillNextRequest);
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to PhoneticRestatementScoreWithNextRequest.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to SecondsTillNextRequest.__allocating_init(value:confidence:)(a1, a2, (void (*)(_QWORD))type metadata accessor for PhoneticRestatementScoreWithNextRequest);
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to SecondsTillNextRequest.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2, void (*a3)(_QWORD))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[2];

  v6 = type metadata accessor for Confidence();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *a1;
  a3(0);
  swift_allocObject();
  v13[1] = v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  v11 = TypedFeature.init(value:confidence:)();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a2, v6);
  return v11;
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to TextSimilarityScoreWithNextRequest.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to SecondsTillNextRequest.__allocating_init(value:confidence:)(a1, a2, (void (*)(_QWORD))type metadata accessor for TextSimilarityScoreWithNextRequest);
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to SecondsTillNextConversation.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to SecondsTillNextRequest.__allocating_init(value:confidence:)(a1, a2, (void (*)(_QWORD))type metadata accessor for SecondsTillNextConversation);
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to PhoneticRestatementScoreWithNextConversation.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to SecondsTillNextRequest.__allocating_init(value:confidence:)(a1, a2, (void (*)(_QWORD))type metadata accessor for PhoneticRestatementScoreWithNextConversation);
}

uint64_t SecondsTillNextRequest.__allocating_init(value:confidence:)(uint64_t a1, double a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD v10[2];

  v4 = type metadata accessor for Confidence();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  *(double *)&v10[1] = a2;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v8 = TypedFeature.init(value:confidence:)();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  return v8;
}

uint64_t SecondsTillNextRequest.init(value:confidence:)(uint64_t a1, double a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[2];

  v4 = type metadata accessor for Confidence();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  *(double *)&v9[1] = a2;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  v7 = TypedFeature.init(value:confidence:)();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  return v7;
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to TextSimilarityScoreWithNextConversation.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to SecondsTillNextRequest.__allocating_init(value:confidence:)(a1, a2, (void (*)(_QWORD))type metadata accessor for TextSimilarityScoreWithNextConversation);
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to ConfirmationFollowed.__allocating_init(value:confidence:)(int *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to ConfirmationFollowed.__allocating_init(value:confidence:)(a1, a2, (void (*)(_QWORD))type metadata accessor for ConfirmationFollowed);
}

uint64_t ConfirmationFollowed.init(value:confidence:)(int a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _DWORD v9[4];

  v4 = type metadata accessor for Confidence();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v9[3] = a1;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v4);
  v7 = TypedFeature.init(value:confidence:)();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  return v7;
}

uint64_t CancellationFollowed.__deallocating_deinit()
{
  TypedFeature.deinit();
  return swift_deallocClassInstance();
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to CancellationFollowed.__allocating_init(value:confidence:)(int *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to ConfirmationFollowed.__allocating_init(value:confidence:)(a1, a2, (void (*)(_QWORD))type metadata accessor for CancellationFollowed);
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to ConfirmationFollowed.__allocating_init(value:confidence:)(int *a1, uint64_t a2, void (*a3)(_QWORD))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int v10;
  uint64_t v11;
  _DWORD v13[4];

  v6 = type metadata accessor for Confidence();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *a1;
  a3(0);
  swift_allocObject();
  v13[3] = v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  v11 = TypedFeature.init(value:confidence:)();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a2, v6);
  return v11;
}

uint64_t specialized static SequenceFeatureExtractor.secondsTillNexRequest(_:)(double *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t result;
  uint64_t v11;
  double v12;
  uint64_t v13;
  _QWORD v14[2];

  v2 = type metadata accessor for Confidence();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v14 - v7;
  v9 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 272))(1, 1);
  if (!(v9 >> 62))
  {
    result = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (result)
      goto LABEL_3;
LABEL_8:
    swift_bridgeObjectRelease();
    return 0;
  }
  result = _CocoaArrayWrapper.endIndex.getter();
  if (!result)
    goto LABEL_8;
LABEL_3:
  if ((v9 & 0xC000000000000001) != 0)
  {
    v11 = MEMORY[0x2207D5048](0, v9);
    goto LABEL_6;
  }
  if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v11 = *(_QWORD *)(v9 + 32);
    swift_retain();
LABEL_6:
    swift_bridgeObjectRelease();
    v12 = vabdd_f64(a1[5], *(double *)(v11 + 40));
    (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v8, *MEMORY[0x24BEA4C58], v2);
    type metadata accessor for SecondsTillNextRequest(0);
    swift_allocObject();
    *(double *)&v14[1] = v12;
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
    v13 = TypedFeature.init(value:confidence:)();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    swift_release();
    return v13;
  }
  __break(1u);
  return result;
}

uint64_t specialized static SequenceFeatureExtractor.textSimilarityScoreWithNextRequest(_:)(uint64_t a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  Swift::String v26;
  uint64_t v27;
  char v28;
  char v29;
  uint64_t v30;
  _QWORD v31[2];
  Swift::Double_optional v32;

  v6 = type metadata accessor for Confidence();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v31 - v11;
  v13 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 272))(1, 1);
  if (!(v13 >> 62))
  {
    result = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (result)
      goto LABEL_3;
LABEL_8:
    v16 = swift_bridgeObjectRelease();
    v15 = 0;
LABEL_9:
    v17 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 120))(v16);
    specialized Collection.featureValueByType<A, B>(as:)(v17, a2);
    v19 = v18;
    swift_bridgeObjectRelease();
    if (v19)
    {
      if (!v15)
      {
        swift_bridgeObjectRelease();
        return 0;
      }
      v31[0] = a3;
      v20 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v15 + 120);
      v21 = swift_retain();
      v22 = v20(v21);
      v23 = specialized Collection.featureValueByType<A, B>(as:)(v22, a2);
      v25 = v24;
      swift_bridgeObjectRelease();
      if (!v25)
      {
        swift_bridgeObjectRelease();
        swift_release_n();
        return 0;
      }
      v26._countAndFlagsBits = v23;
      v26._object = v25;
      v32 = String.scoreRatcliffObershelp(between:)(v26);
      v27 = *(_QWORD *)&v32.is_nil;
      v29 = v28;
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      if ((v29 & 1) == 0)
      {
        (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v12, *MEMORY[0x24BEA4C58], v6);
        ((void (*)(_QWORD))v31[0])(0);
        swift_allocObject();
        v31[1] = v27;
        (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
        v30 = TypedFeature.init(value:confidence:)();
        (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
        swift_release();
        return v30;
      }
    }
    swift_release();
    return 0;
  }
  result = _CocoaArrayWrapper.endIndex.getter();
  if (!result)
    goto LABEL_8;
LABEL_3:
  if ((v13 & 0xC000000000000001) != 0)
  {
    v15 = MEMORY[0x2207D5048](0, v13);
    goto LABEL_6;
  }
  if (*(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v15 = *(_QWORD *)(v13 + 32);
    swift_retain();
LABEL_6:
    v16 = swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ConfirmationFollowed(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for ConfirmationFollowed);
}

uint64_t type metadata accessor for CancellationFollowed(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for CancellationFollowed);
}

uint64_t type metadata accessor for SequenceFeatureExtractor()
{
  return objc_opt_self();
}

uint64_t method lookup function for SequenceFeatureExtractor()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SequenceFeatureExtractor.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of SequenceFeatureExtractor.extract(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t type metadata accessor for SecondsTillNextRequest(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for SecondsTillNextRequest);
}

uint64_t type metadata completion function for SecondsTillNextRequest()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for SecondsTillNextRequest()
{
  return type metadata accessor for SecondsTillNextRequest(0);
}

uint64_t type metadata accessor for PhoneticRestatementScoreWithNextRequest(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for PhoneticRestatementScoreWithNextRequest);
}

uint64_t type metadata completion function for PhoneticRestatementScoreWithNextRequest()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for PhoneticRestatementScoreWithNextRequest()
{
  return type metadata accessor for PhoneticRestatementScoreWithNextRequest(0);
}

uint64_t type metadata accessor for TextSimilarityScoreWithNextRequest(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for TextSimilarityScoreWithNextRequest);
}

uint64_t type metadata completion function for TextSimilarityScoreWithNextRequest()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for TextSimilarityScoreWithNextRequest()
{
  return type metadata accessor for TextSimilarityScoreWithNextRequest(0);
}

uint64_t type metadata accessor for SecondsTillNextConversation(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for SecondsTillNextConversation);
}

uint64_t type metadata completion function for SecondsTillNextConversation()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for SecondsTillNextConversation()
{
  return type metadata accessor for SecondsTillNextConversation(0);
}

uint64_t type metadata accessor for PhoneticRestatementScoreWithNextConversation(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for PhoneticRestatementScoreWithNextConversation);
}

uint64_t type metadata completion function for PhoneticRestatementScoreWithNextConversation()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for PhoneticRestatementScoreWithNextConversation()
{
  return type metadata accessor for PhoneticRestatementScoreWithNextConversation(0);
}

uint64_t type metadata accessor for TextSimilarityScoreWithNextConversation(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for TextSimilarityScoreWithNextConversation);
}

uint64_t type metadata completion function for TextSimilarityScoreWithNextConversation()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for TextSimilarityScoreWithNextConversation()
{
  return type metadata accessor for TextSimilarityScoreWithNextConversation(0);
}

uint64_t type metadata completion function for ConfirmationFollowed()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for ConfirmationFollowed()
{
  return type metadata accessor for ConfirmationFollowed(0);
}

uint64_t type metadata completion function for CancellationFollowed()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for CancellationFollowed()
{
  return type metadata accessor for CancellationFollowed(0);
}

const char *FeatureFlag.domain.getter()
{
  return "SiriInferredHelpfulness";
}

const char *FeatureFlag.feature.getter()
{
  _BYTE *v0;
  const char *v1;

  v1 = "persistence";
  if (*v0 != 1)
    v1 = "logging";
  if (*v0)
    return v1;
  else
    return "SiriIH";
}

Swift::Bool __swiftcall FeatureFlag.isOn()()
{
  char *v0;
  char v1;
  char v2;
  _BYTE v4[24];
  ValueMetadata *v5;
  unint64_t v6;

  v1 = *v0;
  v5 = &type metadata for FeatureFlag;
  v6 = lazy protocol witness table accessor for type FeatureFlag and conformance FeatureFlag();
  v4[0] = v1;
  v2 = isFeatureEnabled(_:)();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  return v2 & 1;
}

unint64_t lazy protocol witness table accessor for type FeatureFlag and conformance FeatureFlag()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FeatureFlag and conformance FeatureFlag;
  if (!lazy protocol witness table cache variable for type FeatureFlag and conformance FeatureFlag)
  {
    result = MEMORY[0x2207D5564](&protocol conformance descriptor for FeatureFlag, &type metadata for FeatureFlag);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FeatureFlag and conformance FeatureFlag);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FeatureFlag and conformance FeatureFlag;
  if (!lazy protocol witness table cache variable for type FeatureFlag and conformance FeatureFlag)
  {
    result = MEMORY[0x2207D5564](&protocol conformance descriptor for FeatureFlag, &type metadata for FeatureFlag);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FeatureFlag and conformance FeatureFlag);
  }
  return result;
}

BOOL static FeatureFlag.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void FeatureFlag.hash(into:)()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int FeatureFlag.hashValue.getter()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for FeatureFlagStateProviding.isOn() in conformance FeatureFlag(uint64_t a1)
{
  char *v1;
  char v2;
  char v3;
  _BYTE v5[24];
  uint64_t v6;
  unint64_t v7;

  v2 = *v1;
  v6 = a1;
  v7 = lazy protocol witness table accessor for type FeatureFlag and conformance FeatureFlag();
  v5[0] = v2;
  v3 = isFeatureEnabled(_:)();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v3 & 1;
}

const char *protocol witness for FeatureFlagsKey.domain.getter in conformance FeatureFlag()
{
  return "SiriInferredHelpfulness";
}

const char *protocol witness for FeatureFlagsKey.feature.getter in conformance FeatureFlag()
{
  _BYTE *v0;
  const char *v1;

  v1 = "persistence";
  if (*v0 != 1)
    v1 = "logging";
  if (*v0)
    return v1;
  else
    return "SiriIH";
}

uint64_t dispatch thunk of FeatureFlagStateProviding.isOn()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t storeEnumTagSinglePayload for FeatureFlag(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_21FE06240 + 4 * byte_21FE0DB35[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_21FE06274 + 4 * asc_21FE0DB30[v4]))();
}

uint64_t sub_21FE06274(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21FE0627C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21FE06284);
  return result;
}

uint64_t sub_21FE06290(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21FE06298);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_21FE0629C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21FE062A4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FeatureFlag()
{
  return &type metadata for FeatureFlag;
}

uint64_t UEIFeatureExtractor.__allocating_init()()
{
  uint64_t v0;
  uint64_t ObjCClassFromMetadata;
  id v2;
  uint64_t v3;
  unint64_t v4;

  v0 = swift_allocObject();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v2 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  if (one-time initialization token for shared != -1)
    swift_once();
  v3 = static TrialProvider.shared;
  swift_retain();
  v4 = specialized static CATUtils.catIdToSpeakeasyCategory(bundle:trialProvider:)(v2, v3);
  swift_retain();

  swift_release();
  *(_QWORD *)(v0 + 16) = v4;
  swift_release();
  return v0;
}

uint64_t UEIFeatureExtractor.catIdToSpeakeasyCategory.getter()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t UEIFeatureExtractor.catIdToSpeakeasyCategory.setter(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*UEIFeatureExtractor.catIdToSpeakeasyCategory.modify())()
{
  swift_beginAccess();
  return InferredHelpfulnessInference.modelVersionString.modify;
}

uint64_t UEIFeatureExtractor.init()()
{
  uint64_t v0;
  uint64_t ObjCClassFromMetadata;
  void *v2;
  id v3;
  uint64_t v4;
  unint64_t v5;

  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v2 = (void *)objc_opt_self();
  swift_retain();
  v3 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  if (one-time initialization token for shared != -1)
    swift_once();
  v4 = static TrialProvider.shared;
  swift_retain();
  v5 = specialized static CATUtils.catIdToSpeakeasyCategory(bundle:trialProvider:)(v3, v4);

  swift_release();
  *(_QWORD *)(v0 + 16) = v5;
  swift_release();
  return v0;
}

uint64_t one-time initialization function for dismissalReasonMap()
{
  uint64_t inited;
  unint64_t v1;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(SISchemaDismissalReason, String)>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21FE0DC50;
  *(_DWORD *)(inited + 32) = 13;
  *(_QWORD *)(inited + 40) = 0x74756F68636E7550;
  *(_QWORD *)(inited + 48) = 0xE800000000000000;
  *(_DWORD *)(inited + 56) = 14;
  *(_QWORD *)(inited + 64) = 0x74756F68636E7550;
  *(_QWORD *)(inited + 72) = 0xE800000000000000;
  *(_DWORD *)(inited + 80) = 11;
  *(_QWORD *)(inited + 88) = 0x74756F68636E7550;
  *(_QWORD *)(inited + 96) = 0xE800000000000000;
  *(_DWORD *)(inited + 104) = 12;
  *(_QWORD *)(inited + 112) = 1919251285;
  *(_QWORD *)(inited + 120) = 0xE400000000000000;
  *(_DWORD *)(inited + 128) = 9;
  *(_QWORD *)(inited + 136) = 1919251285;
  *(_QWORD *)(inited + 144) = 0xE400000000000000;
  *(_DWORD *)(inited + 152) = 15;
  *(_QWORD *)(inited + 160) = 1919251285;
  *(_QWORD *)(inited + 168) = 0xE400000000000000;
  *(_DWORD *)(inited + 176) = 8;
  *(_QWORD *)(inited + 184) = 1919251285;
  *(_QWORD *)(inited + 192) = 0xE400000000000000;
  *(_DWORD *)(inited + 200) = 10;
  *(_QWORD *)(inited + 208) = 1919251285;
  *(_QWORD *)(inited + 216) = 0xE400000000000000;
  *(_DWORD *)(inited + 224) = 4;
  *(_QWORD *)(inited + 232) = 0x656D6954656C6449;
  *(_QWORD *)(inited + 240) = 0xE900000000000072;
  *(_DWORD *)(inited + 248) = 2;
  *(_QWORD *)(inited + 256) = 0x6D6574737953;
  *(_QWORD *)(inited + 264) = 0xE600000000000000;
  *(_DWORD *)(inited + 272) = 1;
  *(_QWORD *)(inited + 280) = 0x6D6574737953;
  *(_QWORD *)(inited + 288) = 0xE600000000000000;
  *(_DWORD *)(inited + 296) = 7;
  *(_QWORD *)(inited + 304) = 0x6D6574737953;
  *(_QWORD *)(inited + 312) = 0xE600000000000000;
  *(_DWORD *)(inited + 320) = 6;
  *(_QWORD *)(inited + 328) = 0x6D6574737953;
  *(_QWORD *)(inited + 336) = 0xE600000000000000;
  *(_DWORD *)(inited + 344) = 5;
  *(_QWORD *)(inited + 352) = 0x6D6574737953;
  *(_QWORD *)(inited + 360) = 0xE600000000000000;
  *(_DWORD *)(inited + 368) = 3;
  *(_QWORD *)(inited + 376) = 0xD000000000000011;
  *(_QWORD *)(inited + 384) = 0x800000021FE11510;
  *(_DWORD *)(inited + 392) = 0;
  *(_QWORD *)(inited + 400) = 1819047246;
  *(_QWORD *)(inited + 408) = 0xE400000000000000;
  v1 = specialized Dictionary.init(dictionaryLiteral:)(inited);
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (SISchemaDismissalReason, String));
  result = swift_arrayDestroy();
  static UEIFeatureExtractor.dismissalReasonMap = v1;
  return result;
}

uint64_t *UEIFeatureExtractor.dismissalReasonMap.unsafeMutableAddressor()
{
  if (one-time initialization token for dismissalReasonMap != -1)
    swift_once();
  return &static UEIFeatureExtractor.dismissalReasonMap;
}

uint64_t static UEIFeatureExtractor.dismissalReasonMap.getter()
{
  if (one-time initialization token for dismissalReasonMap != -1)
    swift_once();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t static UEIFeatureExtractor.dismissalReasonMap.setter(uint64_t a1)
{
  if (one-time initialization token for dismissalReasonMap != -1)
    swift_once();
  swift_beginAccess();
  static UEIFeatureExtractor.dismissalReasonMap = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static UEIFeatureExtractor.dismissalReasonMap.modify())()
{
  if (one-time initialization token for dismissalReasonMap != -1)
    swift_once();
  swift_beginAccess();
  return InferredHelpfulnessInference.classifier.modify;
}

uint64_t UEIFeatureExtractor.extract(from:)(int64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  _QWORD *v36;
  Swift::UInt32 v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  unint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  uint64_t *v54;
  uint64_t v55;
  NSObject *v56;
  os_log_type_t v57;
  _BOOL4 v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  void (*v65)(char *, uint64_t, uint64_t);
  uint64_t v66;
  void (*v67)(char *, char *, uint64_t);
  char *v68;
  uint64_t (*v69)(char *, uint64_t);
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  NSObject *v75;
  os_log_type_t v76;
  uint8_t *v77;
  uint64_t v79;
  char *v80;
  unint64_t v81;
  uint64_t v82;
  int64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  char *v87;
  uint64_t v88;
  unint64_t v89;
  unint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;

  v88 = type metadata accessor for Confidence();
  v5 = *(_QWORD *)(v88 - 8);
  v6 = MEMORY[0x24BDAC7A8](v88);
  v87 = (char *)&v79 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v79 - v8;
  v93 = MEMORY[0x24BEE4AF8];
  if (!((unint64_t)a1 >> 62))
  {
    v10 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    v85 = v5;
    v86 = v9;
    if (v10)
      goto LABEL_3;
LABEL_72:
    swift_bridgeObjectRelease();
    v28 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
    if (*(_QWORD *)(MEMORY[0x24BEE4AF8] + 16))
      goto LABEL_42;
    goto LABEL_73;
  }
  if (a1 < 0)
    v1 = a1;
  else
    v1 = a1 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain();
  v10 = _CocoaArrayWrapper.endIndex.getter();
  v85 = v5;
  v86 = v9;
  if (!v10)
    goto LABEL_72;
LABEL_3:
  if (v10 < 1)
  {
    __break(1u);
LABEL_80:
    swift_once();
LABEL_56:
    v55 = type metadata accessor for Logger();
    __swift_project_value_buffer(v55, (uint64_t)defaultLogger);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v56 = Logger.logObject.getter();
    v57 = static os_log_type_t.debug.getter();
    v58 = os_log_type_enabled(v56, v57);
    v82 = v1;
    v83 = a1;
    v80 = v9;
    v81 = v10;
    if (v58)
    {
      v59 = v1;
      v60 = swift_slowAlloc();
      v61 = swift_slowAlloc();
      v90 = v61;
      *(_DWORD *)v60 = 136315650;
      swift_bridgeObjectRetain();
      v92 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v10, (unint64_t)v9, (uint64_t *)&v90);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v60 + 12) = 2080;
      swift_bridgeObjectRetain();
      v92 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v84, v59, (uint64_t *)&v90);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v60 + 22) = 2080;
      swift_bridgeObjectRetain();
      v92 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v89, a1, (uint64_t *)&v90);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21FDE7000, v56, v57, "%s \t %s \t %s", (uint8_t *)v60, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x2207D560C](v61, -1, -1);
      MEMORY[0x2207D560C](v60, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    v62 = *MEMORY[0x24BEA4C58];
    v63 = v85;
    v64 = v86;
    v65 = *(void (**)(char *, uint64_t, uint64_t))(v85 + 104);
    v66 = v88;
    v65(v86, v62, v88);
    type metadata accessor for CatIdSequence(0);
    swift_allocObject();
    v90 = (unint64_t)v3;
    v67 = *(void (**)(char *, char *, uint64_t))(v63 + 16);
    v68 = v87;
    v67(v87, v64, v66);
    TypedFeature.init(value:confidence:)();
    v69 = *(uint64_t (**)(char *, uint64_t))(v63 + 8);
    v70 = v69(v64, v66);
    MEMORY[0x2207D4EB0](v70);
    if (*(_QWORD *)((v93 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v93 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    v65(v64, v62, v66);
    type metadata accessor for CatId(0);
    swift_allocObject();
    v90 = v81;
    v91 = v80;
    v67(v68, v64, v66);
    TypedFeature.init(value:confidence:)();
    v71 = v69(v64, v66);
    MEMORY[0x2207D4EB0](v71);
    if (*(_QWORD *)((v93 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v93 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    v65(v64, v62, v66);
    type metadata accessor for SpeakeasyCategory(0);
    swift_allocObject();
    v90 = v84;
    v91 = (char *)v82;
    v67(v68, v64, v66);
    TypedFeature.init(value:confidence:)();
    v72 = v69(v64, v66);
    MEMORY[0x2207D4EB0](v72);
    if (*(_QWORD *)((v93 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v93 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    v65(v64, v62, v66);
    type metadata accessor for DismissalReason(0);
    swift_allocObject();
    v90 = v89;
    v91 = (char *)v83;
    v67(v68, v64, v66);
    TypedFeature.init(value:confidence:)();
    v73 = v69(v64, v66);
    MEMORY[0x2207D4EB0](v73);
    if (*(_QWORD *)((v93 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v93 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    return v93;
  }
  v84 = v2;
  v11 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    v12 = 0;
    v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      MEMORY[0x2207D5048](v12, a1);
      v14 = static UEIEvents.dialogID(_:)();
      v16 = v15;
      swift_unknownObjectRelease();
      if (v16)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3[2] + 1, 1, v3);
        v18 = v3[2];
        v17 = v3[3];
        if (v18 >= v17 >> 1)
          v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v17 > 1), v18 + 1, 1, v3);
        v3[2] = v18 + 1;
        v13 = &v3[2 * v18];
        v13[4] = v14;
        v13[5] = v16;
      }
      ++v12;
    }
    while (v10 != v12);
  }
  else
  {
    v19 = 0;
    v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      v21 = *(id *)(a1 + 8 * v19 + 32);
      v22 = static UEIEvents.dialogID(_:)();
      v24 = v23;

      if (v24)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3[2] + 1, 1, v3);
        v26 = v3[2];
        v25 = v3[3];
        if (v26 >= v25 >> 1)
          v3 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v25 > 1), v26 + 1, 1, v3);
        v3[2] = v26 + 1;
        v20 = &v3[2 * v26];
        v20[4] = v22;
        v20[5] = v24;
      }
      ++v19;
    }
    while (v10 != v19);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v27 = 0;
  v28 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v89 = a1 & 0xC000000000000001;
  do
  {
    if (v11)
      v29 = (id)MEMORY[0x2207D5048](v27, a1);
    else
      v29 = *(id *)(a1 + 8 * v27 + 32);
    v30 = v29;
    v31 = specialized SISchemaAnyEvent.topLevelPayload<A>(as:)();
    if (v31)
    {
      v32 = v31;
      v33 = objc_msgSend(v31, sel_uiStateTransition);
      if (v33
        && (v34 = v33, v35 = objc_msgSend(v33, sel_dismissed),
                       v34,
                       v35))
      {
        v36 = v28;
        v37 = objc_msgSend(v35, sel_dismissalReason);

        if (one-time initialization token for dismissalReasonMap != -1)
          swift_once();
        swift_beginAccess();
        v38 = static UEIFeatureExtractor.dismissalReasonMap;
        if (*(_QWORD *)(static UEIFeatureExtractor.dismissalReasonMap + 16)
          && (v39 = specialized __RawDictionaryStorage.find<A>(_:)(v37), (v40 & 1) != 0))
        {
          v41 = (uint64_t *)(*(_QWORD *)(v38 + 56) + 16 * v39);
          v43 = *v41;
          v42 = v41[1];
          swift_endAccess();
          swift_bridgeObjectRetain();

          v28 = v36;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v28 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v36[2] + 1, 1, v36);
          v11 = v89;
          v45 = v28[2];
          v44 = v28[3];
          if (v45 >= v44 >> 1)
            v28 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v44 > 1), v45 + 1, 1, v28);
          v28[2] = v45 + 1;
          v46 = &v28[2 * v45];
          v46[4] = v43;
          v46[5] = v42;
        }
        else
        {
          swift_endAccess();

          v28 = v36;
          v11 = v89;
        }
      }
      else
      {

      }
    }
    else
    {

    }
    ++v27;
  }
  while (v10 != v27);
  swift_bridgeObjectRelease();
  v2 = v84;
  if (v3[2])
  {
LABEL_42:
    v47 = v3[4];
    v48 = v3[5];
    swift_bridgeObjectRetain();
    v10 = specialized static CATUtils.classAndUseCase(from:lowercased:)(v47, v48, 1);
    v9 = v49;
    v50 = swift_bridgeObjectRelease();
    v51 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 104))(v50);
    if (*(_QWORD *)(v51 + 16))
    {
      swift_bridgeObjectRetain();
      v52 = specialized __RawDictionaryStorage.find<A>(_:)(v10, (uint64_t)v9);
      if ((v53 & 1) != 0)
      {
        v54 = (uint64_t *)(*(_QWORD *)(v51 + 56) + 16 * v52);
      }
      else
      {
        if (one-time initialization token for speakeasyCategoryDefault != -1)
          swift_once();
        v54 = &static CATUtils.speakeasyCategoryDefault;
      }
      v1 = v54[1];
      v84 = *v54;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      if (one-time initialization token for speakeasyCategoryDefault != -1)
        swift_once();
      v1 = *(_QWORD *)algn_255580488;
      v84 = static CATUtils.speakeasyCategoryDefault;
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    if (v28[2])
    {
      a1 = v28[5];
      v89 = v28[4];
      swift_bridgeObjectRetain();
    }
    else
    {
      a1 = 0xE400000000000000;
      v89 = 1819047246;
    }
    swift_bridgeObjectRelease();
    if (one-time initialization token for defaultLogger == -1)
      goto LABEL_56;
    goto LABEL_80;
  }
LABEL_73:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (one-time initialization token for defaultLogger != -1)
    swift_once();
  v74 = type metadata accessor for Logger();
  __swift_project_value_buffer(v74, (uint64_t)defaultLogger);
  v75 = Logger.logObject.getter();
  v76 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v75, v76))
  {
    v77 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v77 = 0;
    _os_log_impl(&dword_21FDE7000, v75, v76, "No CAT ID found for the turn", v77, 2u);
    MEMORY[0x2207D560C](v77, -1, -1);
  }

  return v93;
}

uint64_t static UEIFeatureExtractor.dismissalReasonAsString(_:)(uint64_t a1)
{
  return static UEIFeatureExtractor.dismissalReasonAsString(_:)(a1, (uint64_t (*)(void))specialized static UEIFeatureExtractor.dismissalReasonAsString(_:));
}

uint64_t CatIdSequence.__allocating_init(value:confidence:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD v10[2];

  v4 = type metadata accessor for Confidence();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_allocObject();
  v10[1] = a1;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  v8 = TypedFeature.init(value:confidence:)();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  return v8;
}

id static UEIFeatureExtractor.clientEvent(from:)()
{
  return specialized SISchemaAnyEvent.topLevelPayload<A>(as:)();
}

void static UEIFeatureExtractor.turnID(_:)(uint64_t a1@<X8>)
{
  id v2;
  uint64_t v3;
  id v4;

  v2 = specialized SISchemaAnyEvent.topLevelPayload<A>(as:)();
  if (v2)
  {
    v4 = v2;
    static UEIFeatureExtractor.turnID(_:)(v2, a1);

  }
  else
  {
    v3 = type metadata accessor for UUID();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(a1, 1, 1, v3);
  }
}

uint64_t static UEIFeatureExtractor.turnID(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;

  v4 = type metadata accessor for UUID();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = objc_msgSend(a1, sel_eventMetadata);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v6, sel_turnID);

    if (v8)
    {
      static Data._unconditionallyBridgeFromObjectiveC(_:)();
      v10 = v9;

      __asm { BR              X10 }
    }
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, 1, 1, v4);
}

uint64_t static UEIFeatureExtractor.dialogID(_:)(uint64_t a1)
{
  return static UEIFeatureExtractor.dismissalReasonAsString(_:)(a1, (uint64_t (*)(void))specialized static UEIFeatureExtractor.dialogID(_:));
}

uint64_t static UEIFeatureExtractor.dialogPhase(_:)(uint64_t a1)
{
  return static UEIFeatureExtractor.dismissalReasonAsString(_:)(a1, (uint64_t (*)(void))specialized static UEIFeatureExtractor.dialogPhase(_:));
}

uint64_t static UEIFeatureExtractor.dismissalReasonAsString(_:)(uint64_t a1, uint64_t (*a2)(void))
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = specialized SISchemaAnyEvent.topLevelPayload<A>(as:)();
  if (!v3)
    return 0;
  v4 = v3;
  v5 = a2();

  return v5;
}

id static UEIFeatureExtractor.dismissalReason(_:)()
{
  id result;
  void *v1;
  id v2;
  void *v3;
  id v4;
  signed int v5;

  result = specialized SISchemaAnyEvent.topLevelPayload<A>(as:)();
  if (result)
  {
    v1 = result;
    v2 = objc_msgSend(result, sel_uiStateTransition);
    if (v2 && (v3 = v2, v4 = objc_msgSend(v2, sel_dismissed), v3, v4))
    {
      v5 = objc_msgSend(v4, sel_dismissalReason);

      return (id)v5;
    }
    else
    {

      return 0;
    }
  }
  return result;
}

id static UEIFeatureExtractor.dismissalReason(_:)(void *a1)
{
  id result;
  void *v2;
  id v3;
  signed int v4;

  result = objc_msgSend(a1, sel_uiStateTransition);
  if (result)
  {
    v2 = result;
    v3 = objc_msgSend(result, sel_dismissed);

    if (v3)
    {
      v4 = objc_msgSend(v3, sel_dismissalReason);

      return (id)v4;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t UEIFeatureExtractor.__ivar_destroyer()
{
  return swift_bridgeObjectRelease();
}

uint64_t UEIFeatureExtractor.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t UEIFeatureExtractor.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to CatId.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to FinalFlowTaskName.__allocating_init(value:confidence:)(a1, a2, (void (*)(_QWORD))type metadata accessor for CatId);
}

uint64_t CatIdSequence.init(value:confidence:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[2];

  v4 = type metadata accessor for Confidence();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v9[1] = a1;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v4);
  v7 = TypedFeature.init(value:confidence:)();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  return v7;
}

uint64_t CatIdSequence.__deallocating_deinit()
{
  TypedFeature.deinit();
  return swift_deallocClassInstance();
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to CatIdSequence.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[2];

  v4 = type metadata accessor for Confidence();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *a1;
  type metadata accessor for CatIdSequence(0);
  swift_allocObject();
  v11[1] = v8;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  v9 = TypedFeature.init(value:confidence:)();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  return v9;
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to SpeakeasyCategory.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to FinalFlowTaskName.__allocating_init(value:confidence:)(a1, a2, (void (*)(_QWORD))type metadata accessor for SpeakeasyCategory);
}

uint64_t vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to DismissalReason.__allocating_init(value:confidence:)(uint64_t *a1, uint64_t a2)
{
  return vtable thunk for TypedFeature.__allocating_init(value:confidence:) dispatching to FinalFlowTaskName.__allocating_init(value:confidence:)(a1, a2, (void (*)(_QWORD))type metadata accessor for DismissalReason);
}

uint64_t type metadata accessor for CatIdSequence(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for CatIdSequence);
}

uint64_t type metadata accessor for CatId(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for CatId);
}

uint64_t type metadata accessor for SpeakeasyCategory(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for SpeakeasyCategory);
}

uint64_t type metadata accessor for DismissalReason(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for DismissalReason);
}

void *specialized static UEIFeatureExtractor.dismissalReasonAsString(_:)(void *a1)
{
  id v1;
  void *v2;
  id v3;
  Swift::UInt32 v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v1 = objc_msgSend(a1, sel_uiStateTransition);
  v2 = v1;
  if (v1)
  {
    v3 = objc_msgSend(v1, sel_dismissed);

    if (v3)
    {
      v4 = objc_msgSend(v3, sel_dismissalReason);

      if (one-time initialization token for dismissalReasonMap != -1)
        swift_once();
      swift_beginAccess();
      v5 = static UEIFeatureExtractor.dismissalReasonMap;
      if (*(_QWORD *)(static UEIFeatureExtractor.dismissalReasonMap + 16)
        && (v6 = specialized __RawDictionaryStorage.find<A>(_:)(v4), (v7 & 1) != 0))
      {
        v2 = *(void **)(*(_QWORD *)(v5 + 56) + 16 * v6);
        swift_bridgeObjectRetain();
      }
      else
      {
        v2 = 0;
      }
      swift_endAccess();
    }
    else
    {
      return 0;
    }
  }
  return v2;
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

void *specialized static UEIFeatureExtractor.dialogID(_:)(void *a1)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  void *v6;

  v2 = objc_msgSend(a1, sel_uufrShown);
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v2, sel_dialogIdentifier);

    if (v4)
    {
LABEL_5:
      v6 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)();

      return v6;
    }
  }
  v5 = objc_msgSend(a1, sel_uufrSaid);
  v6 = v5;
  if (v5)
  {
    v4 = objc_msgSend(v5, sel_dialogIdentifier);

    if (!v4)
      return 0;
    goto LABEL_5;
  }
  return v6;
}

id specialized static UEIFeatureExtractor.dialogPhase(_:)(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;

  v1 = objc_msgSend(a1, sel_uufrSaid);
  v2 = v1;
  if (!v1)
    return 0;
  v3 = objc_msgSend(v1, sel_siriResponseContext);

  if (v3)
  {
    v4 = objc_msgSend(v3, sel_dialogPhase);

    if (v4)
    {
      v3 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();

    }
    else
    {
      return 0;
    }
  }
  return v3;
}

uint64_t sub_21FE07EE0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 104))();
  *a2 = result;
  return result;
}

uint64_t sub_21FE07F10(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))(**(_QWORD **)a2 + 112);
  v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t type metadata accessor for UEIFeatureExtractor()
{
  return objc_opt_self();
}

uint64_t method lookup function for UEIFeatureExtractor()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of UEIFeatureExtractor.catIdToSpeakeasyCategory.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of UEIFeatureExtractor.catIdToSpeakeasyCategory.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of UEIFeatureExtractor.catIdToSpeakeasyCategory.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t type metadata completion function for CatId()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for CatId()
{
  return type metadata accessor for CatId(0);
}

uint64_t type metadata completion function for CatIdSequence()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for CatIdSequence()
{
  return type metadata accessor for CatIdSequence(0);
}

uint64_t type metadata completion function for SpeakeasyCategory()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for SpeakeasyCategory()
{
  return type metadata accessor for SpeakeasyCategory(0);
}

uint64_t type metadata completion function for DismissalReason()
{
  return type metadata completion function for FlowStateTypeSequence();
}

uint64_t ObjC metadata update function for DismissalReason()
{
  return type metadata accessor for DismissalReason(0);
}

_QWORD *static FeaturedTurn.from(events:features:)(uint8_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void (*v26)(char *, char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t);
  uint64_t v33;
  char *v34;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (UUID, Double)?);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (UUID, Double));
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v36 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v36 - v19;
  v39 = v2;
  static FeaturedTurn.extractUEITimestamp(from:)(a1, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    outlined destroy of Any?((uint64_t)v10, &demangling cache variable for type metadata for (UUID, Double)?);
    return 0;
  }
  else
  {
    v38 = a2;
    v22 = *(int *)(v11 + 48);
    v23 = type metadata accessor for UUID();
    v36 = v15;
    v37 = v7;
    v24 = *(_QWORD *)(v23 - 8);
    v25 = (unint64_t)a1;
    v26 = *(void (**)(char *, char *, uint64_t))(v24 + 32);
    v26(v20, v10, v23);
    v27 = *(_QWORD *)&v10[v22];
    *(_QWORD *)&v20[v22] = v27;
    static FeaturedTurn.extractRequestID(from:)(v25, v7);
    v28 = *(int *)(v11 + 48);
    (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v18, v20, v23);
    *(_QWORD *)&v18[v28] = v27;
    v29 = UUID.uuidString.getter();
    v31 = v30;
    v32 = *(void (**)(char *, uint64_t))(v24 + 8);
    v32(v18, v23);
    v33 = *(int *)(v11 + 48);
    v34 = v36;
    v26(v36, v20, v23);
    *(_QWORD *)&v34[v33] = v27;
    type metadata accessor for FeaturedTurn(0);
    v21 = (_QWORD *)swift_allocObject();
    v21[6] = 0;
    v21[7] = 0;
    v21[3] = v29;
    v21[4] = v31;
    v21[5] = v27;
    outlined init with take of UUID?((uint64_t)v37, (uint64_t)v21 + OBJC_IVAR____TtC23SiriInferredHelpfulness12FeaturedTurn_requestID);
    v21[2] = v38;
    swift_bridgeObjectRetain();
    v32(v34, v23);
  }
  return v21;
}

uint64_t FeaturedTurnInternal.__allocating_init(turnID:timestamp:requestID:features:sortedFeaturedTurns:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char v16;
  char v17;

  v12 = swift_allocObject();
  v13 = v12 + OBJC_IVAR____TtC23SiriInferredHelpfulness20FeaturedTurnInternal_index;
  *(_QWORD *)v13 = 0;
  *(_BYTE *)(v13 + 8) = 1;
  *(_QWORD *)(v12 + OBJC_IVAR____TtC23SiriInferredHelpfulness20FeaturedTurnInternal_sortedFeaturedTurns) = a5;
  swift_bridgeObjectRetain();
  v14 = swift_bridgeObjectRetain();
  v15 = specialized Collection.firstIndex(where:)(v14, a1, a2);
  v17 = v16;
  swift_bridgeObjectRelease();
  swift_retain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(_QWORD *)v13 = v15;
  *(_BYTE *)(v13 + 8) = v17 & 1;
  swift_release();
  *(_QWORD *)(v12 + 48) = 0;
  *(_QWORD *)(v12 + 56) = 0;
  *(_QWORD *)(v12 + 24) = a1;
  *(_QWORD *)(v12 + 32) = a2;
  *(double *)(v12 + 40) = a6;
  outlined init with take of UUID?(a3, v12 + OBJC_IVAR____TtC23SiriInferredHelpfulness12FeaturedTurn_requestID);
  *(_QWORD *)(v12 + 16) = a4;
  return v12;
}

uint64_t FeaturedConversation.__allocating_init(_:)(unint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  FeaturedConversation.init(_:)(a1);
  return v2;
}

uint64_t FeaturedTurn.features.getter()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t FeaturedTurn.features.setter(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t FeaturedTurn.turnID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

double FeaturedTurn.timestamp.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 40);
}

uint64_t (*FeaturedTurn.conversationID.modify())()
{
  swift_beginAccess();
  return InferredHelpfulnessInference.classifier.modify;
}

uint64_t FeaturedTurn.requestID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return outlined init with copy of UUID?(v1 + OBJC_IVAR____TtC23SiriInferredHelpfulness12FeaturedTurn_requestID, a1);
}

uint64_t static FeaturedTurn.extractUEITimestamp(from:)@<X0>(uint8_t *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  id v29;
  void *v30;
  void (*v31)(char *, char *, uint64_t);
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  _BOOL4 v41;
  uint64_t v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v46;
  char *v47;
  void *v48;
  id v49;
  char *v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  os_log_type_t v66;
  uint64_t v67;
  uint8_t *v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  void (*v72)(char *, uint64_t);
  void (*v73)(char *, uint64_t);
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  char *v78;
  NSObject *v79;
  os_log_type_t v80;
  uint8_t *v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  void (*v85)(char *, uint64_t);
  id v86;
  void (*v87)(char *, uint64_t);
  char *v88;
  char *v89;
  char *v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  unint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v88 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v92 = (char *)&v88 - v8;
  v9 = type metadata accessor for UUID();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v88 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v88 = (char *)&v88 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v88 - v17;
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v88 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v88 - v22;
  v94 = (unint64_t)a1;
  if ((unint64_t)a1 >> 62)
  {
LABEL_56:
    swift_bridgeObjectRetain();
    v24 = _CocoaArrayWrapper.endIndex.getter();
  }
  else
  {
    v24 = *(_QWORD *)(((unint64_t)a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  v93 = v9;
  v95 = (char *)v24;
  v91 = a2;
  v89 = v13;
  if (v24)
  {
    if (v24 < 1)
    {
      __break(1u);
      goto LABEL_58;
    }
    v90 = v23;
    v25 = 0;
    v26 = v94;
    v27 = v94 & 0xC000000000000001;
    v28 = MEMORY[0x24BEE4AF8];
    do
    {
      if (v27)
        v29 = (id)MEMORY[0x2207D5048](v25, v26);
      else
        v29 = *(id *)(v26 + 8 * (_QWORD)v25 + 32);
      v30 = v29;
      static UEIEvents.turnID(_:)();

      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9) == 1)
      {
        outlined destroy of Any?((uint64_t)v7, &demangling cache variable for type metadata for UUID?);
      }
      else
      {
        v31 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
        v31(v21, v7, v9);
        v31(v18, v21, v9);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v28 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v28 + 16) + 1, 1, v28);
        v33 = *(_QWORD *)(v28 + 16);
        v32 = *(_QWORD *)(v28 + 24);
        if (v33 >= v32 >> 1)
          v28 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v32 > 1, v33 + 1, 1, v28);
        *(_QWORD *)(v28 + 16) = v33 + 1;
        v34 = v28
            + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))
            + *(_QWORD *)(v10 + 72) * v33;
        v9 = v93;
        v31((char *)v34, v18, v93);
        v26 = v94;
      }
      ++v25;
    }
    while (v95 != v25);
    swift_bridgeObjectRelease();
    v23 = v90;
  }
  else
  {
    v26 = v94;
    swift_bridgeObjectRelease();
    v28 = MEMORY[0x24BEE4AF8];
  }
  v35 = (uint64_t)v92;
  if (*(_QWORD *)(v28 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v10 + 16))(v92, v28 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80)), v9);
    v36 = 0;
  }
  else
  {
    v36 = 1;
  }
  v37 = v95;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(v35, v36, 1, v9);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v35, 1, v9) == 1)
  {
    outlined destroy of Any?(v35, &demangling cache variable for type metadata for UUID?);
    if (one-time initialization token for defaultLogger == -1)
    {
LABEL_24:
      v38 = type metadata accessor for Logger();
      __swift_project_value_buffer(v38, (uint64_t)defaultLogger);
      v39 = Logger.logObject.getter();
      v40 = static os_log_type_t.debug.getter();
      v41 = os_log_type_enabled(v39, v40);
      v42 = v91;
      if (v41)
      {
        v43 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v43 = 0;
        _os_log_impl(&dword_21FDE7000, v39, v40, "Unable to extract turnID", v43, 2u);
        MEMORY[0x2207D560C](v43, -1, -1);
      }

      v44 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (UUID, Double));
      v45 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 56);
      v46 = v42;
      return v45(v46, 1, 1, v44);
    }
LABEL_58:
    swift_once();
    goto LABEL_24;
  }
  v13 = *(char **)(v10 + 32);
  ((void (*)(char *, uint64_t, uint64_t))v13)(v23, v35, v9);
  if (v37)
  {
    v9 = (uint64_t)v23;
    v7 = (char *)(v26 & 0xC000000000000001);
    swift_bridgeObjectRetain();
    a2 = 4;
    while (1)
    {
      v23 = (char *)(a2 - 4);
      if (v7)
        v47 = (char *)MEMORY[0x2207D5048](a2 - 4, v94);
      else
        v47 = (char *)*(id *)(v94 + 8 * a2);
      v21 = v47;
      v18 = (char *)(a2 - 3);
      if (__OFADD__(v23, 1))
      {
        __break(1u);
        goto LABEL_56;
      }
      v48 = (void *)static UEIEvents.clientEvent(from:)();
      v49 = objc_msgSend(v48, sel_deviceDynamicContext);

      if (v49)
        break;

      ++a2;
      if (v18 == v95)
      {
        swift_bridgeObjectRelease();
        v50 = 0;
LABEL_41:
        v23 = (char *)v9;
        goto LABEL_42;
      }
    }
    swift_bridgeObjectRelease();
    v50 = v21;
    v51 = (void *)static UEIEvents.clientEvent(from:)();
    if (!v51)
    {

      goto LABEL_41;
    }
    v52 = v51;
    v53 = objc_msgSend(v51, sel_deviceDynamicContext);
    v54 = v9;
    if (v53)
    {
      v55 = v53;
      objc_msgSend(v53, sel_timeIntervalSince1970);
      v57 = v56;

      v58 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (UUID, Double));
      v59 = *(int *)(v58 + 48);
      v60 = v91;
      ((void (*)(uint64_t, uint64_t, uint64_t))v13)(v91, v9, v93);
      *(_QWORD *)(v60 + v59) = v57;
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v58 - 8) + 56))(v60, 0, 1, v58);
    }
    if (one-time initialization token for defaultLogger != -1)
      swift_once();
    v75 = type metadata accessor for Logger();
    __swift_project_value_buffer(v75, (uint64_t)defaultLogger);
    v76 = v88;
    v77 = v93;
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v88, v54, v93);
    v78 = (char *)v54;
    v79 = Logger.logObject.getter();
    v80 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v79, v80))
    {
      v90 = v78;
      v81 = (uint8_t *)swift_slowAlloc();
      v82 = swift_slowAlloc();
      v97 = v82;
      v95 = v50;
      *(_DWORD *)v81 = 136315138;
      v94 = (unint64_t)(v81 + 4);
      lazy protocol witness table accessor for type UUID and conformance UUID();
      v83 = dispatch thunk of CustomStringConvertible.description.getter();
      v96 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v83, v84, &v97);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v85 = *(void (**)(char *, uint64_t))(v10 + 8);
      v85(v76, v77);
      _os_log_impl(&dword_21FDE7000, v79, v80, "Unable to extract timestamp for turn %s", v81, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207D560C](v82, -1, -1);
      MEMORY[0x2207D560C](v81, -1, -1);

      v86 = v95;
      v85(v90, v77);
    }
    else
    {

      v87 = *(void (**)(char *, uint64_t))(v10 + 8);
      v87(v76, v77);

      v87(v78, v77);
    }
    v44 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (UUID, Double));
    v45 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 56);
    v46 = v91;
  }
  else
  {
    v50 = 0;
LABEL_42:
    v62 = v89;
    if (one-time initialization token for defaultLogger != -1)
      swift_once();
    v63 = type metadata accessor for Logger();
    __swift_project_value_buffer(v63, (uint64_t)defaultLogger);
    v64 = v93;
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v62, v23, v93);
    v65 = Logger.logObject.getter();
    v66 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v65, v66))
    {
      v67 = swift_slowAlloc();
      v90 = v23;
      v68 = (uint8_t *)v67;
      v69 = swift_slowAlloc();
      v97 = v69;
      *(_DWORD *)v68 = 136315138;
      v95 = v50;
      lazy protocol witness table accessor for type UUID and conformance UUID();
      v70 = dispatch thunk of CustomStringConvertible.description.getter();
      v96 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v70, v71, &v97);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v72 = *(void (**)(char *, uint64_t))(v10 + 8);
      v72(v62, v64);
      _os_log_impl(&dword_21FDE7000, v65, v66, "Unable to find DeviceDynamicContext for turn %s", v68, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207D560C](v69, -1, -1);
      MEMORY[0x2207D560C](v68, -1, -1);

      v72(v90, v64);
    }
    else
    {

      v73 = *(void (**)(char *, uint64_t))(v10 + 8);
      v73(v62, v64);

      v73(v23, v64);
    }
    v74 = v91;
    v44 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (UUID, Double));
    v45 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 56);
    v46 = v74;
  }
  return v45(v46, 1, 1, v44);
}

uint64_t static FeaturedTurn.extractRequestID(from:)@<X0>(unint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  void *v19;
  Class isa;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  id v24;
  char *v25;
  id v26;
  id v27;
  id v28;
  int v29;
  uint64_t result;
  unint64_t v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t, uint64_t);
  char *v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  void (*v48)(uint64_t, uint64_t, uint64_t, uint64_t);
  char *v49;
  char *v50;
  unint64_t v51;

  v50 = a2;
  v3 = type metadata accessor for UUID();
  v4 = *(_QWORD **)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&v46 - v12);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v46 - v14;
  if (a1 >> 62)
  {
LABEL_36:
    swift_bridgeObjectRetain();
    v16 = _CocoaArrayWrapper.endIndex.getter();
    if (v16)
      goto LABEL_3;
LABEL_37:
    v13 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v4[7];
LABEL_38:
    v44 = v50;
    v45 = 1;
LABEL_39:
    v13((uint64_t)v44, v45, 1, v3);
    return swift_bridgeObjectRelease();
  }
  v16 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v16)
    goto LABEL_37;
LABEL_3:
  v48 = v13;
  v49 = v10;
  v47 = v6;
  v17 = 0;
  v51 = a1 & 0xC000000000000001;
  while (1)
  {
    if (v51)
    {
      swift_bridgeObjectRetain();
      v18 = (char *)MEMORY[0x2207D5048](v17, a1);
    }
    else
    {
      v19 = *(void **)(a1 + 8 * v17 + 32);
      swift_bridgeObjectRetain();
      v18 = v19;
    }
    v6 = v18;
    if (objc_msgSend(v18, sel_anyEventType) == 6)
    {
      isa = (Class)objc_msgSend(v6, sel_payload);
      if (isa)
      {
        v21 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
        v23 = v22;

        isa = Data._bridgeToObjectiveC()().super.isa;
        outlined consume of Data._Representation(v21, v23);
      }
      v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95B30]), sel_initWithData_, isa);

      v25 = (char *)objc_msgSend(v24, sel_event);
      if (!v25)
        goto LABEL_17;
    }
    else
    {
      v25 = v6;
    }
    v26 = specialized SISchemaAnyEvent.topLevelPayload<A>(as:)();

    if (v26)
    {
      v27 = objc_msgSend(v26, sel_eventMetadata);

      if (v27)
      {
        v28 = objc_msgSend(v27, sel_requestId);

        if (v28)
        {
          SISchemaUUID.toNSUUID()();

          v13 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v4[7];
          v13((uint64_t)v15, 0, 1, v3);
          goto LABEL_18;
        }
      }
    }
LABEL_17:
    v13 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v4[7];
    v13((uint64_t)v15, 1, 1, v3);
LABEL_18:
    swift_bridgeObjectRelease();

    v10 = (char *)v4[6];
    v29 = ((uint64_t (*)(char *, uint64_t, uint64_t))v10)(v15, 1, v3);
    result = outlined destroy of Any?((uint64_t)v15, &demangling cache variable for type metadata for UUID?);
    if (v29 != 1)
      break;
    v31 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
      __break(1u);
      goto LABEL_36;
    }
    ++v17;
    if (v31 == v16)
      goto LABEL_38;
  }
  if (v16 == v17)
    goto LABEL_38;
  if (v51)
  {
    v32 = (id)MEMORY[0x2207D5048](v17, a1);
    goto LABEL_28;
  }
  if ((v17 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_41;
  }
  if (v17 >= *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  v32 = *(id *)(a1 + 8 * v17 + 32);
LABEL_28:
  v33 = v32;
  v34 = specialized SISchemaAnyEvent.unwrappedPayload<A>(as:)();
  v36 = (uint64_t)v48;
  v35 = (uint64_t)v49;
  if (v34
    && (v37 = v34, v38 = objc_msgSend(v34, sel_eventMetadata),
                   v37,
                   v38)
    && (v39 = objc_msgSend(v38, sel_requestId), v38, v39))
  {
    SISchemaUUID.toNSUUID()();

    v40 = 0;
  }
  else
  {
    v40 = 1;
  }
  v13(v36, v40, 1, v3);

  outlined init with copy of UUID?(v36, v35);
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v10)(v35, 1, v3);
  if ((_DWORD)result != 1)
  {
    v41 = (void (*)(char *, uint64_t, uint64_t))v4[4];
    v42 = v47;
    v41(v47, v35, v3);
    outlined destroy of Any?(v36, &demangling cache variable for type metadata for UUID?);
    v43 = v50;
    v41(v50, (uint64_t)v42, v3);
    v44 = v43;
    v45 = 0;
    goto LABEL_39;
  }
LABEL_42:
  __break(1u);
  return result;
}

uint64_t FeaturedTurn.__allocating_init(turnID:timestamp:requestID:features:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  double v14;

  v12 = swift_allocObject();
  v13 = v12;
  *(_QWORD *)(v12 + 48) = 0;
  *(_QWORD *)(v12 + 56) = 0;
  *(_QWORD *)(v12 + 24) = a1;
  *(_QWORD *)(v12 + 32) = a2;
  v14 = *(double *)&a3;
  if ((a4 & 1) != 0)
    v14 = -1.0;
  *(double *)(v12 + 40) = v14;
  outlined init with take of UUID?(a5, v12 + OBJC_IVAR____TtC23SiriInferredHelpfulness12FeaturedTurn_requestID);
  *(_QWORD *)(v13 + 16) = a6;
  return v13;
}

uint64_t type metadata accessor for FeaturedTurn(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for FeaturedTurn);
}

uint64_t FeaturedTurn.init(turnID:timestamp:requestID:features:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  *(_QWORD *)(v6 + 48) = 0;
  *(_QWORD *)(v6 + 56) = 0;
  *(_QWORD *)(v6 + 24) = a1;
  *(_QWORD *)(v6 + 32) = a2;
  if ((a4 & 1) != 0)
    *(double *)&a3 = -1.0;
  *(double *)(v6 + 40) = *(double *)&a3;
  outlined init with take of UUID?(a5, v6 + OBJC_IVAR____TtC23SiriInferredHelpfulness12FeaturedTurn_requestID);
  *(_QWORD *)(v6 + 16) = a6;
  return v6;
}

Swift::Bool __swiftcall FeaturedTurn.hasUtterance()()
{
  return FeaturedTurn.hasUtterance()((uint64_t (*)(void))specialized Collection.filterByType<A>(as:));
}

Swift::Bool __swiftcall FeaturedTurn.hasCatId()()
{
  return FeaturedTurn.hasUtterance()((uint64_t (*)(void))specialized Collection.filterByType<A>(as:));
}

uint64_t FeaturedTurn.hasUtterance()(uint64_t (*a1)(void))
{
  uint64_t v1;
  unint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[6];
  unint64_t v8;

  (*(void (**)(void))(*(_QWORD *)v1 + 120))();
  v3 = a1();
  result = swift_bridgeObjectRelease();
  if (!(v3 >> 62))
  {
    if (*(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
LABEL_11:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  v6 = _CocoaArrayWrapper.endIndex.getter();
  result = swift_bridgeObjectRelease();
  if (!v6)
    goto LABEL_11;
LABEL_3:
  if ((v3 & 0xC000000000000001) != 0)
  {
    MEMORY[0x2207D5048](0, v3);
  }
  else
  {
    if (!*(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    swift_retain();
  }
  swift_bridgeObjectRelease();
  dispatch thunk of Feature.value()();
  swift_release();
  if ((swift_dynamicCast() & 1) == 0)
    return 0;
  swift_bridgeObjectRelease();
  v5 = HIBYTE(v8) & 0xF;
  if ((v8 & 0x2000000000000000) == 0)
    v5 = *(_QWORD *)v7 & 0xFFFFFFFFFFFFLL;
  return v5 != 0;
}

Swift::String __swiftcall FeaturedTurn.timestampString()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  Class isa;
  Class v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  Swift::String result;
  uint64_t v18;

  v0 = type metadata accessor for TimeZone();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for Date();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  Date.init(timeIntervalSince1970:)();
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
  objc_msgSend(v8, sel_setTimeStyle_, 2);
  objc_msgSend(v8, sel_setDateStyle_, 2);
  static TimeZone.current.getter();
  isa = TimeZone._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  objc_msgSend(v8, sel_setTimeZone_, isa);

  v10 = Date._bridgeToObjectiveC()().super.isa;
  v11 = objc_msgSend(v8, sel_stringFromDate_, v10);

  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v15 = v12;
  v16 = v14;
  result._object = v16;
  result._countAndFlagsBits = v15;
  return result;
}

BOOL static FeaturedTurn.compareTurns(_:_:)(uint64_t a1, uint64_t a2)
{
  return *(double *)(a1 + 40) < *(double *)(a2 + 40);
}

uint64_t FeaturedTurn.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of Any?(v0 + OBJC_IVAR____TtC23SiriInferredHelpfulness12FeaturedTurn_requestID, &demangling cache variable for type metadata for UUID?);
  return v0;
}

uint64_t FeaturedTurn.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of Any?(v0 + OBJC_IVAR____TtC23SiriInferredHelpfulness12FeaturedTurn_requestID, &demangling cache variable for type metadata for UUID?);
  return swift_deallocClassInstance();
}

uint64_t FeaturedConversation.conversationID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FeaturedConversation.turns.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FeaturedConversation.init(_:)(unint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1[4] = a1;
  if (!(a1 >> 62))
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v3)
      goto LABEL_3;
LABEL_7:
    swift_bridgeObjectRelease();
    v7 = 0;
    v6 = 0;
    goto LABEL_8;
  }
  swift_bridgeObjectRetain();
  result = _CocoaArrayWrapper.endIndex.getter();
  if (!result)
    goto LABEL_7;
LABEL_3:
  if ((a1 & 0xC000000000000001) != 0)
  {
    v8 = MEMORY[0x2207D5048](0, a1);
    swift_bridgeObjectRelease();
    v7 = *(_QWORD *)(v8 + 24);
    v6 = *(_QWORD *)(v8 + 32);
    swift_bridgeObjectRetain();
    swift_unknownObjectRelease();
    goto LABEL_8;
  }
  if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v5 = *(_QWORD *)(a1 + 32);
    swift_retain();
    swift_bridgeObjectRelease();
    v7 = *(_QWORD *)(v5 + 24);
    v6 = *(_QWORD *)(v5 + 32);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_8:
    v1[2] = v7;
    v1[3] = v6;
    return (uint64_t)v1;
  }
  __break(1u);
  return result;
}

uint64_t FeaturedConversation.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t FeaturedConversation.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

void *static NeighborType.allCases.getter()
{
  return &outlined read-only object #0 of static NeighborType.allCases.getter;
}

uint64_t NeighborType.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_21FE0991C + 4 * byte_21FE0DD10[a1]))(0xD000000000000011, 0x800000021FE0E070);
}

uint64_t sub_21FE0991C()
{
  return 0x6E7275547478656ELL;
}

uint64_t sub_21FE09938()
{
  return 0x6F6365537478656ELL;
}

uint64_t sub_21FE09958()
{
  return 0x757165527478656ELL;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance NeighborType(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = NeighborType.rawValue.getter(*a1);
  v5 = v4;
  if (v3 == NeighborType.rawValue.getter(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance NeighborType()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  NeighborType.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance NeighborType()
{
  unsigned __int8 *v0;

  NeighborType.rawValue.getter(*v0);
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance NeighborType()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  NeighborType.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance NeighborType@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = specialized NeighborType.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance NeighborType@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = NeighborType.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void protocol witness for static CaseIterable.allCases.getter in conformance NeighborType(_QWORD *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of protocol witness for static CaseIterable.allCases.getter in conformance NeighborType;
}

uint64_t FeaturedTurnInternal.sortedFeaturedTurns.getter()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t FeaturedTurnInternal.sortedFeaturedTurns.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC23SiriInferredHelpfulness20FeaturedTurnInternal_sortedFeaturedTurns);
  swift_beginAccess();
  *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*FeaturedTurnInternal.sortedFeaturedTurns.modify())()
{
  swift_beginAccess();
  return InferredHelpfulnessInference.modelVersionString.modify;
}

uint64_t FeaturedTurnInternal.index.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC23SiriInferredHelpfulness20FeaturedTurnInternal_index;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t FeaturedTurnInternal.index.setter(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;

  v5 = v2 + OBJC_IVAR____TtC23SiriInferredHelpfulness20FeaturedTurnInternal_index;
  result = swift_beginAccess();
  *(_QWORD *)v5 = a1;
  *(_BYTE *)(v5 + 8) = a2 & 1;
  return result;
}

uint64_t (*FeaturedTurnInternal.index.modify())()
{
  swift_beginAccess();
  return InferredHelpfulnessInference.modelVersionString.modify;
}

uint64_t FeaturedTurnInternal.init(turnID:timestamp:requestID:features:sortedFeaturedTurns:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  uint64_t v6;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char v15;
  char v16;

  v12 = v6 + OBJC_IVAR____TtC23SiriInferredHelpfulness20FeaturedTurnInternal_index;
  *(_QWORD *)v12 = 0;
  *(_BYTE *)(v12 + 8) = 1;
  *(_QWORD *)(v6 + OBJC_IVAR____TtC23SiriInferredHelpfulness20FeaturedTurnInternal_sortedFeaturedTurns) = a5;
  swift_bridgeObjectRetain();
  swift_retain();
  v13 = swift_bridgeObjectRetain();
  v14 = specialized Collection.firstIndex(where:)(v13, a1, a2);
  v16 = v15;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(_QWORD *)v12 = v14;
  *(_BYTE *)(v12 + 8) = v16 & 1;
  swift_release();
  *(_QWORD *)(v6 + 48) = 0;
  *(_QWORD *)(v6 + 56) = 0;
  *(_QWORD *)(v6 + 24) = a1;
  *(_QWORD *)(v6 + 32) = a2;
  *(double *)(v6 + 40) = a6;
  outlined init with take of UUID?(a3, v6 + OBJC_IVAR____TtC23SiriInferredHelpfulness12FeaturedTurn_requestID);
  *(_QWORD *)(v6 + 16) = a4;
  return v6;
}

void FeaturedTurnInternal.neighborTurns(neighborType:neighborSize:)(char a1)
{
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v5 = *(uint64_t (**)(void))(*(_QWORD *)v1 + 216);
  v3 = v5();
  if (v3 >> 62)
    v4 = _CocoaArrayWrapper.endIndex.getter();
  else
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRelease();
  if (v4)
    __asm { BR              X10 }
  __asm { BR              X0 }
}

void FeaturedTurnInternal.__allocating_init(turnID:timestamp:requestID:features:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void FeaturedTurnInternal.init(turnID:timestamp:requestID:features:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t FeaturedTurnInternal.__ivar_destroyer()
{
  return swift_bridgeObjectRelease();
}

uint64_t FeaturedTurnInternal.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of Any?(v0 + OBJC_IVAR____TtC23SiriInferredHelpfulness12FeaturedTurn_requestID, &demangling cache variable for type metadata for UUID?);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t FeaturedTurnInternal.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of Any?(v0 + OBJC_IVAR____TtC23SiriInferredHelpfulness12FeaturedTurn_requestID, &demangling cache variable for type metadata for UUID?);
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

_QWORD *specialized _copyCollectionToContiguousArray<A>(_:)(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_10;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    if (v2 <= 0)
    {
      v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
      v3 = (_QWORD *)swift_allocObject();
      v4 = _swift_stdlib_malloc_size(v3);
      v5 = v4 - 32;
      if (v4 < 32)
        v5 = v4 - 25;
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    specialized Array._copyContents(initializing:)((unint64_t)(v3 + 4), v2, v1);
    v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2)
      break;
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v2)
      return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v8;
  _QWORD *v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t result;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5)
      return MEMORY[0x24BEE4AF8];
    v8 = v5;
    if (v5 <= 0)
    {
      v9 = (_QWORD *)MEMORY[0x24BEE4AF8];
      if (v4 != a3)
      {
LABEL_7:
        if (v5 < 0)
          goto LABEL_19;
        v12 = a2 + 8 * a3;
        if (v12 < (unint64_t)&v9[v8 + 4] && (unint64_t)(v9 + 4) < v12 + v8 * 8)
          goto LABEL_19;
        type metadata accessor for FeaturedTurn(0);
        swift_arrayInitWithCopy();
        return (uint64_t)v9;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
      v9 = (_QWORD *)swift_allocObject();
      v10 = _swift_stdlib_malloc_size(v9);
      v11 = v10 - 32;
      if (v10 < 32)
        v11 = v10 - 25;
      v9[2] = v5;
      v9[3] = (2 * (v11 >> 3)) | 1;
      if (v4 != a3)
        goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
LABEL_19:
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t (*specialized protocol witness for Collection.subscript.read in conformance [A](uint64_t (**a1)(), unint64_t a2, uint64_t a3))()
{
  uint64_t (*v6)();

  v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = specialized Array.subscript.read(v6, a2, a3);
  return protocol witness for Collection.subscript.read in conformance [A]specialized ;
}

{
  uint64_t (*v6)();

  v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = specialized Array.subscript.read(v6, a2, a3);
  return protocol witness for Collection.subscript.read in conformance [A]specialized ;
}

void protocol witness for Collection.subscript.read in conformance [A]specialized (_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*specialized Array.subscript.read(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t *v3;
  uint64_t v4;

  v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = MEMORY[0x2207D5048](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = swift_retain();
LABEL_5:
    *v3 = v4;
    return Array.subscript.readspecialized ;
  }
  __break(1u);
  return result;
}

{
  uint64_t *v3;
  uint64_t v4;

  v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = MEMORY[0x2207D5048](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = swift_retain();
LABEL_5:
    *v3 = v4;
    return Array.subscript.readspecialized ;
  }
  __break(1u);
  return result;
}

uint64_t Array.subscript.readspecialized ()
{
  return swift_release();
}

uint64_t specialized Collection.firstIndex(where:)(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  uint64_t v11;

  if (a1 >> 62)
    goto LABEL_17;
  v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  v7 = 0;
  if (v6)
  {
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        v8 = MEMORY[0x2207D5048](v7, a1);
      }
      else
      {
        v8 = *(_QWORD *)(a1 + 8 * v7 + 32);
        swift_retain();
      }
      if (*(_QWORD *)(v8 + 24) == a2 && *(_QWORD *)(v8 + 32) == a3)
        break;
      v10 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_release();
      if ((v10 & 1) != 0)
        return v7;
      v11 = v7 + 1;
      if (__OFADD__(v7, 1))
      {
        __break(1u);
LABEL_17:
        swift_bridgeObjectRetain();
        v6 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        v7 = 0;
        if (!v6)
          return v7;
      }
      else
      {
        ++v7;
        if (v11 == v6)
          return 0;
      }
    }
    swift_release();
  }
  return v7;
}

uint64_t specialized _ArrayProtocol.filter(_:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  int64_t v7;
  uint64_t v9;
  double v10;
  uint64_t v11;

  result = MEMORY[0x24BEE4AF8];
  v11 = MEMORY[0x24BEE4AF8];
  v7 = a3 >> 1;
  if (a3 >> 1 != a2)
  {
    v9 = a2;
    v10 = (double)a5;
    while (v9 < v7)
    {
      if (*(double *)(*(_QWORD *)(a1 + 8 * v9) + 40) <= *(double *)(a4 + 40) + v10)
      {
        swift_retain();
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        result = specialized ContiguousArray._endMutation()();
      }
      if (v7 == ++v9)
        return v11;
    }
    __break(1u);
  }
  return result;
}

unint64_t specialized NeighborType.init(rawValue:)(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of NeighborType.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 4)
    return 4;
  else
    return v3;
}

unint64_t lazy protocol witness table accessor for type NeighborType and conformance NeighborType()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type NeighborType and conformance NeighborType;
  if (!lazy protocol witness table cache variable for type NeighborType and conformance NeighborType)
  {
    result = MEMORY[0x2207D5564](&protocol conformance descriptor for NeighborType, &type metadata for NeighborType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type NeighborType and conformance NeighborType);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [NeighborType] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [NeighborType] and conformance [A];
  if (!lazy protocol witness table cache variable for type [NeighborType] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [NeighborType]);
    result = MEMORY[0x2207D5564](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [NeighborType] and conformance [A]);
  }
  return result;
}

uint64_t sub_21FE0B314@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 120))();
  *a2 = result;
  return result;
}

uint64_t sub_21FE0B344(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))(**(_QWORD **)a2 + 128);
  v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t sub_21FE0B374@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 144))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_21FE0B3A4(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v2 = *a1;
  v3 = a1[1];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(_QWORD **)a2 + 152);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t sub_21FE0B3E8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 216))();
  *a2 = result;
  return result;
}

uint64_t sub_21FE0B418(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))(**(_QWORD **)a2 + 224);
  v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

uint64_t sub_21FE0B448@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 240))();
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_21FE0B480(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)a2 + 248))(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t ObjC metadata update function for FeaturedTurn()
{
  return type metadata accessor for FeaturedTurn(0);
}

void type metadata completion function for FeaturedTurn()
{
  unint64_t v0;

  type metadata accessor for UUID?();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for FeaturedTurn()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FeaturedTurn.features.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of FeaturedTurn.features.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of FeaturedTurn.features.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of FeaturedTurn.conversationID.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of FeaturedTurn.conversationID.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of FeaturedTurn.conversationID.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of FeaturedTurn.__allocating_init(turnID:timestamp:requestID:features:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v4 + 168))(a1, a2, a3, a4 & 1);
}

uint64_t dispatch thunk of FeaturedTurn.hasUtterance()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of FeaturedTurn.hasCatId()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of FeaturedTurn.timestampString()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t type metadata accessor for FeaturedConversation()
{
  return objc_opt_self();
}

uint64_t method lookup function for FeaturedConversation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FeaturedConversation.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t getEnumTagSinglePayload for NeighborType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for NeighborType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_21FE0B6F0 + 4 * byte_21FE0DD19[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_21FE0B724 + 4 * byte_21FE0DD14[v4]))();
}

uint64_t sub_21FE0B724(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21FE0B72C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21FE0B734);
  return result;
}

uint64_t sub_21FE0B740(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21FE0B748);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_21FE0B74C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21FE0B754(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for NeighborType()
{
  return &type metadata for NeighborType;
}

uint64_t ObjC metadata update function for FeaturedTurnInternal()
{
  return type metadata accessor for FeaturedTurnInternal(0);
}

uint64_t type metadata accessor for FeaturedTurnInternal(uint64_t a1)
{
  return type metadata accessor for FlowStateTypeSequence(a1, (uint64_t *)&type metadata singleton initialization cache for FeaturedTurnInternal);
}

uint64_t type metadata completion function for FeaturedTurnInternal()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for FeaturedTurnInternal()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FeaturedTurnInternal.sortedFeaturedTurns.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of FeaturedTurnInternal.sortedFeaturedTurns.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of FeaturedTurnInternal.sortedFeaturedTurns.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of FeaturedTurnInternal.index.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of FeaturedTurnInternal.index.setter(uint64_t a1, char a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)v2 + 248))(a1, a2 & 1);
}

uint64_t dispatch thunk of FeaturedTurnInternal.index.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of FeaturedTurnInternal.__allocating_init(turnID:timestamp:requestID:features:sortedFeaturedTurns:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 264))();
}

uint64_t dispatch thunk of FeaturedTurnInternal.neighborTurns(neighborType:neighborSize:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

double BiomeGradedInteractionWriter.missingRestatementScore.getter()
{
  return -1.0;
}

id BiomeGradedInteractionWriter.bms.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 24);
}

id BiomeGradedInteractionWriter.bmsEventContext.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 32);
}

_QWORD *BiomeGradedInteractionWriter.__allocating_init()()
{
  _QWORD *v0;

  v0 = (_QWORD *)swift_allocObject();
  v0[2] = 0xBFF0000000000000;
  v0[3] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0CD30]), sel_init);
  v0[4] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0CB88]), sel_init);
  return v0;
}

_QWORD *BiomeGradedInteractionWriter.init()()
{
  _QWORD *v0;

  v0[2] = 0xBFF0000000000000;
  v0[3] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0CD30]), sel_init);
  v0[4] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0CB88]), sel_init);
  return v0;
}

Swift::Void __swiftcall BiomeGradedInteractionWriter.write(gradedInteractions:)(Swift::OpaquePointer gradedInteractions)
{
  NSObject *v1;
  double *i;
  double v3;
  _QWORD *v4;
  uint64_t v5;
  double v6;
  id v7;
  id v8;
  double v9;
  double v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  unint64_t v31;
  id v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  double v38;
  NSObject *v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  os_log_t loga;
  NSObject *log;
  uint64_t v49;
  double v50;
  char v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v1 = *((_QWORD *)gradedInteractions._rawValue + 2);
  if (v1)
  {
    v49 = *(_QWORD *)(v44 + 32);
    for (i = (double *)(swift_bridgeObjectRetain() + 88); ; i += 8)
    {
      v3 = *(i - 5);
      v4 = (_QWORD *)*((_QWORD *)i - 4);
      v5 = *((_QWORD *)i - 1);
      v6 = *i;
      v7 = objc_allocWithZone(MEMORY[0x24BDBCE60]);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      v8 = objc_msgSend(v7, sel_init);
      objc_msgSend(v8, sel_timeIntervalSinceReferenceDate);
      v10 = v9;

      v11 = *(uint64_t (**)(uint64_t))(*v4 + 120);
      swift_bridgeObjectRetain();
      swift_retain();
      swift_bridgeObjectRetain();
      v12 = swift_bridgeObjectRetain();
      v13 = v11(v12);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      v14 = specialized Collection.filterByType<A>(as:)(v13);
      if (v14 >> 62)
      {
        if (!_CocoaArrayWrapper.endIndex.getter())
        {
LABEL_13:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_14:
          v15 = -1.0;
          goto LABEL_15;
        }
      }
      else if (!*(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        goto LABEL_13;
      }
      if ((v14 & 0xC000000000000001) != 0)
      {
        MEMORY[0x2207D5048](0, v14);
      }
      else
      {
        if (!*(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10))
          __break(1u);
        swift_retain();
      }
      swift_bridgeObjectRelease();
      swift_retain();
      dispatch thunk of TypedFeature.value.getter();
      swift_bridgeObjectRelease();
      swift_release_n();
      if (v51 == 1)
        goto LABEL_14;
      v15 = v50;
LABEL_15:
      v16 = v4[3];
      v17 = v4[4];
      v18 = objc_allocWithZone(MEMORY[0x24BE0CD28]);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v19 = (void *)MEMORY[0x2207D4DFC](v16, v17);
      swift_bridgeObjectRelease();
      v20 = (void *)MEMORY[0x2207D4DFC](v5, *(_QWORD *)&v6);
      swift_bridgeObjectRelease();
      v21 = objc_msgSend(v18, sel_initWithAbsoluteTimestamp_inferredHelpfulnessScore_restatementScore_turnID_modelID_, v19, v20, v10, v3, v15);

      v50 = 0.0;
      if (objc_msgSend(v21, sel_isValidWithContext_error_, v49, &v50))
      {
        v22 = *(void **)(v44 + 24);
        v23 = *(id *)&v50;
        v24 = objc_msgSend(v22, sel_source);
        objc_msgSend(v24, sel_sendEvent_, v21);

        if (one-time initialization token for defaultLogger != -1)
          swift_once();
        v25 = type metadata accessor for Logger();
        __swift_project_value_buffer(v25, (uint64_t)defaultLogger);
        swift_bridgeObjectRetain();
        swift_retain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v26 = Logger.logObject.getter();
        v27 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v26, v27))
        {
          v28 = swift_slowAlloc();
          v29 = COERCE_DOUBLE(swift_slowAlloc());
          v50 = v29;
          *(_DWORD *)v28 = 136315138;
          v45 = v21;
          loga = v1;
          v30 = v4[3];
          v31 = v4[4];
          swift_bridgeObjectRetain();
          *(_QWORD *)(v28 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v30, v31, (uint64_t *)&v50);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          swift_bridgeObjectRelease();
          v1 = loga;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_21FDE7000, v26, v27, "successfully streamed event with turnID: %s", (uint8_t *)v28, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2207D560C](*(_QWORD *)&v29, -1, -1);
          MEMORY[0x2207D560C](v28, -1, -1);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          swift_bridgeObjectRelease();

        }
        else
        {

          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          swift_release_n();
          swift_bridgeObjectRelease_n();
        }
      }
      else
      {
        v32 = *(id *)&v50;
        v33 = (void *)_convertNSErrorToError(_:)();

        swift_willThrow();
        if (one-time initialization token for defaultLogger != -1)
          swift_once();
        v34 = type metadata accessor for Logger();
        __swift_project_value_buffer(v34, (uint64_t)defaultLogger);
        swift_bridgeObjectRetain();
        swift_retain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v35 = Logger.logObject.getter();
        v36 = static os_log_type_t.error.getter();
        log = v35;
        if (os_log_type_enabled(v35, v36))
        {
          v37 = swift_slowAlloc();
          v46 = v21;
          v38 = COERCE_DOUBLE(swift_slowAlloc());
          v50 = v38;
          *(_DWORD *)v37 = 136315138;
          v39 = v1;
          v43 = v33;
          v41 = v4[3];
          v40 = v4[4];
          swift_bridgeObjectRetain();
          v42 = v41;
          v1 = v39;
          *(_QWORD *)(v37 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v42, v40, (uint64_t *)&v50);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_21FDE7000, log, v36, "failed to stream event with turnID: %s", (uint8_t *)v37, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x2207D560C](*(_QWORD *)&v38, -1, -1);
          MEMORY[0x2207D560C](v37, -1, -1);

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          swift_release_n();
          swift_bridgeObjectRelease_n();

        }
      }
      v1 = ((char *)v1 - 1);
      if (!v1)
      {
        swift_bridgeObjectRelease();
        return;
      }
    }
  }
}

uint64_t BiomeGradedInteractionWriter.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t BiomeGradedInteractionWriter.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t protocol witness for GradedInteractionWriter.write(gradedInteractions:) in conformance BiomeGradedInteractionWriter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 112))();
}

uint64_t dispatch thunk of GradedInteractionWriter.write(gradedInteractions:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t type metadata accessor for BiomeGradedInteractionWriter()
{
  return objc_opt_self();
}

uint64_t method lookup function for BiomeGradedInteractionWriter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BiomeGradedInteractionWriter.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of BiomeGradedInteractionWriter.write(gradedInteractions:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
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

uint64_t URL.pathExtension.getter()
{
  return MEMORY[0x24BDCD810]();
}

uint64_t URL.init(fileURLWithPath:)()
{
  return MEMORY[0x24BDCD870]();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
  MEMORY[0x24BDCD8D0](retstr);
}

uint64_t URL.appendingPathComponent(_:isDirectory:)()
{
  return MEMORY[0x24BDCD918]();
}

uint64_t URL.appendingPathComponent(_:)()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t URL.deletingLastPathComponent()()
{
  return MEMORY[0x24BDCD968]();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t URL.path.getter()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t URL.init(string:)()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t Data.init(contentsOf:options:)()
{
  return MEMORY[0x24BDCDB78]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x24BDCDCA0]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCDCE0]();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)MEMORY[0x24BDCE5D8]();
}

uint64_t Date.init(timeIntervalSince1970:)()
{
  return MEMORY[0x24BDCE778]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t UUID.uuidString.getter()
{
  return MEMORY[0x24BDCE9B0]();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)MEMORY[0x24BDCE9D0]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x24BDCEA58]();
}

NSTimeZone __swiftcall TimeZone._bridgeToObjectiveC()()
{
  return (NSTimeZone)MEMORY[0x24BDCF4D8]();
}

uint64_t static TimeZone.current.getter()
{
  return MEMORY[0x24BDCF500]();
}

uint64_t type metadata accessor for TimeZone()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t isFeatureEnabled(_:)()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t type metadata accessor for Confidence()
{
  return MEMORY[0x24BEA4C60]();
}

uint64_t Conversation.allTurnsChronologically.getter()
{
  return MEMORY[0x24BEA4C78]();
}

uint64_t type metadata accessor for Conversation()
{
  return MEMORY[0x24BEA4C80]();
}

uint64_t TypedFeature.init(value:confidence:)()
{
  return MEMORY[0x24BEA4CE8]();
}

uint64_t dispatch thunk of TypedFeature.value.getter()
{
  return MEMORY[0x24BEA4CF0]();
}

uint64_t TypedFeature.deinit()
{
  return MEMORY[0x24BEA4D08]();
}

uint64_t StreamBookmark.__allocating_init(name:)()
{
  return MEMORY[0x24BEA4DB8]();
}

uint64_t type metadata accessor for StreamBookmark()
{
  return MEMORY[0x24BEA4DC0]();
}

uint64_t FeatureProvider.init(features:targetName:)()
{
  return MEMORY[0x24BEA4E38]();
}

uint64_t type metadata accessor for FeatureProvider()
{
  return MEMORY[0x24BEA4E40]();
}

uint64_t PLLoggingReader.asyncSignalReader.getter()
{
  return MEMORY[0x24BEA4E48]();
}

uint64_t PLLoggingReader.streamBookmarkStore.getter()
{
  return MEMORY[0x24BEA4E50]();
}

uint64_t static PLLoggingReader.shared.getter()
{
  return MEMORY[0x24BEA4E58]();
}

uint64_t type metadata accessor for PLLoggingReader()
{
  return MEMORY[0x24BEA4E60]();
}

uint64_t dispatch thunk of AsyncSignalReader.turns()()
{
  return MEMORY[0x24BEA4F00]();
}

uint64_t dispatch thunk of StreamBookmarkStore.notifyOnComplete(completion:)()
{
  return MEMORY[0x24BEA4FD0]();
}

uint64_t dispatch thunk of StreamBookmarkStore.read(name:)()
{
  return MEMORY[0x24BEA4FD8]();
}

uint64_t dispatch thunk of StreamBookmarkStore.write(bookmark:)()
{
  return MEMORY[0x24BEA4FE0]();
}

uint64_t dispatch thunk of AsyncBookmarkingSignalReader.conversationsBookmarked(startBookmark:)()
{
  return MEMORY[0x24BEA51F0]();
}

uint64_t Turn.events.getter()
{
  return MEMORY[0x24BEA5318]();
}

uint64_t Turn.turnID.getter()
{
  return MEMORY[0x24BEA5320]();
}

uint64_t dispatch thunk of Feature.value()()
{
  return MEMORY[0x24BEA53F0]();
}

uint64_t static UEIEvents.clientEvent(from:)()
{
  return MEMORY[0x24BEA5410]();
}

uint64_t static UEIEvents.turnID(_:)()
{
  return MEMORY[0x24BEA5420]();
}

uint64_t static UEIEvents.dialogID(_:)()
{
  return MEMORY[0x24BEA5428]();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t os_signpost(_:dso:log:name:signpostID:_:_:)()
{
  return MEMORY[0x24BEE76F8]();
}

uint64_t os_signpost(_:dso:log:name:signpostID:)()
{
  return MEMORY[0x24BEE7700]();
}

uint64_t OSSignpostID.init(log:object:)()
{
  return MEMORY[0x24BEE7710]();
}

uint64_t OSSignpostID.init(log:)()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t Array.init()()
{
  return MEMORY[0x24BEE01B8]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return MEMORY[0x24BEE07D0]();
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

uint64_t static String._fromSubstring(_:)()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t String.count.getter()
{
  return MEMORY[0x24BEE0B68]();
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

Swift::String_optional __swiftcall String.Iterator.next()()
{
  uint64_t v0;
  void *v1;
  Swift::String_optional result;

  v0 = MEMORY[0x24BEE0C00]();
  result.value._object = v1;
  result.value._countAndFlagsBits = v0;
  return result;
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t String.subscript.getter()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t Sequence.filter(_:)()
{
  return MEMORY[0x24BEE0EA0]();
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

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t Array.debugDescription.getter()
{
  return MEMORY[0x24BEE1168]();
}

uint64_t static Array._allocateUninitialized(_:)()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t Array.append<A>(contentsOf:)()
{
  return MEMORY[0x24BEE11F0]();
}

uint64_t Array.append(_:)()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t dispatch thunk of AsyncIteratorProtocol.next()()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t dispatch thunk of AsyncSequence.makeAsyncIterator()()
{
  return MEMORY[0x24BEE6C08]();
}

uint64_t AsyncSequence.reduce<A>(into:_:)()
{
  return MEMORY[0x24BEE6C40]();
}

uint64_t Collection.first.getter()
{
  return MEMORY[0x24BEE1980]();
}

uint64_t SISchemaUUID.toNSUUID()()
{
  return MEMORY[0x24BE948A8]();
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

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t static os_signpost_type_t.end.getter()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t static NSObject.== infix(_:_:)()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t Optional.debugDescription.getter()
{
  return MEMORY[0x24BEE1C58]();
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

uint64_t StringProtocol.components<A>(separatedBy:)()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x24BEE20A8]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE2510](a1);
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x24BEE2518]();
}

Swift::Void __swiftcall _ArrayBuffer._typeCheckSlowPath(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE2648](a1);
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x24BEE2838]();
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

uint64_t dispatch thunk of _AnySequenceBox._makeIterator()()
{
  return MEMORY[0x24BEE2B80]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t AsyncMapSequence.init(_:transform:)()
{
  return MEMORY[0x24BEE6F00]();
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

uint64_t _CocoaArrayWrapper.subscript.getter()
{
  return MEMORY[0x24BEE3070]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t dispatch thunk of _AnyIteratorBoxBase.next()()
{
  return MEMORY[0x24BEE30D0]();
}

uint64_t _SwiftNewtypeWrapper<>._toCustomAnyHashable()()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t _arrayConditionalCast<A, B>(_:)()
{
  return MEMORY[0x24BEE3280]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x24BEE3290](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return MEMORY[0x24BEE3428]();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return MEMORY[0x24BEE3548](a1);
}

uint64_t AsyncCompactMapSequence.init(_:transform:)()
{
  return MEMORY[0x24BEE7028]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter()
{
  return MEMORY[0x24BEE3B90]();
}

uint64_t type metadata accessor for __ContiguousArrayStorageBase()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t Error.localizedDescription.getter()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x24BEE42E0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x24BEE42F8](a1);
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
  MEMORY[0x24BEE4310](*(_QWORD *)&a1);
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t CodingKey.description.getter()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t CodingKey.debugDescription.getter()
{
  return MEMORY[0x24BEE4A10]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x24BDAC7D8](a1);
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x24BEE4C88]();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x24BEE4D00]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
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

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

