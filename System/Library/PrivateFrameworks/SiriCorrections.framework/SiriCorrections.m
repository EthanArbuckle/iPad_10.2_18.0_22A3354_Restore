BOOL Logger.Subsystem.init(rawValue:)(Swift::String string)
{
  uint64_t v1;
  void *object;
  Swift::String v3;

  object = string._object;
  v3._countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of Logger.Subsystem.init(rawValue:), v3);
  OUTLINED_FUNCTION_7();
  return v1 != 0;
}

unint64_t Logger.Subsystem.rawValue.getter()
{
  return OUTLINED_FUNCTION_4();
}

Swift::Int specialized RawRepresentable<>.hashValue.getter()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  return Hasher._finalize()();
}

{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t specialized RawRepresentable<>.hash(into:)()
{
  return String.hash(into:)();
}

{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

{
  Hasher.init(_seed:)();
  String.hash(into:)();
  return Hasher._finalize()();
}

BOOL protocol witness for RawRepresentable.init(rawValue:) in conformance Logger.Subsystem@<W0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  _BOOL8 result;

  result = Logger.Subsystem.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance Logger.Subsystem(_QWORD *a1@<X8>)
{
  uint64_t v2;

  Logger.Subsystem.rawValue.getter();
  *a1 = 0xD00000000000001ELL;
  a1[1] = v2;
  OUTLINED_FUNCTION_0();
}

SiriCorrections::Logger::Category_optional __swiftcall Logger.Category.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1;
  void *object;
  Swift::String v3;
  SiriCorrections::Logger::Category_optional v4;

  object = rawValue._object;
  v3._countAndFlagsBits = rawValue._countAndFlagsBits;
  v3._object = object;
  _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of Logger.Category.init(rawValue:), v3);
  OUTLINED_FUNCTION_7();
  if (v1 == 1)
    v4.value = SiriCorrections_Logger_Category_instrumentation;
  else
    v4.value = SiriCorrections_Logger_Category_unknownDefault;
  if (v1)
    return v4;
  else
    return 0;
}

uint64_t Logger.Category.rawValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0x656D757274736E49;
  else
    return 0x6974636572726F43;
}

void protocol witness for static Equatable.== infix(_:_:) in conformance Logger.Category(char *a1, char *a2)
{
  specialized == infix<A>(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance Logger.Category()
{
  return specialized RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance Logger.Category()
{
  return specialized RawRepresentable<>.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Logger.Category()
{
  return specialized RawRepresentable<>._rawHashValue(seed:)();
}

SiriCorrections::Logger::Category_optional protocol witness for RawRepresentable.init(rawValue:) in conformance Logger.Category@<W0>(Swift::String *a1@<X0>, SiriCorrections::Logger::Category_optional *a2@<X8>)
{
  SiriCorrections::Logger::Category_optional result;

  result.value = Logger.Category.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance Logger.Category(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t v3;

  *a1 = Logger.Category.rawValue.getter(*v1);
  a1[1] = v3;
  OUTLINED_FUNCTION_0();
}

void one-time initialization function for log()
{
  type metadata accessor for OS_os_log();
  OUTLINED_FUNCTION_4();
  static Logger.log = OS_os_log.init(subsystem:category:)();
  OUTLINED_FUNCTION_0();
}

uint64_t *Logger.log.unsafeMutableAddressor()
{
  if (one-time initialization token for log != -1)
    swift_once();
  return &static Logger.log;
}

void one-time initialization function for logger()
{
  uint64_t v0;
  id v1;

  v0 = OUTLINED_FUNCTION_3();
  __swift_allocate_value_buffer(v0, static Logger.logger);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.logger);
  if (one-time initialization token for log != -1)
    swift_once();
  v1 = (id)static Logger.log;
  Logger.init(_:)();
  OUTLINED_FUNCTION_0();
}

uint64_t Logger.logger.unsafeMutableAddressor()
{
  return Logger.logger.unsafeMutableAddressor(&one-time initialization token for logger, (uint64_t)static Logger.logger);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t static Logger.logger.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.logger.getter(&one-time initialization token for logger, (uint64_t)static Logger.logger, a1);
}

void one-time initialization function for instrumentation()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_3();
  __swift_allocate_value_buffer(v0, static Logger.instrumentation);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.instrumentation);
  type metadata accessor for OS_os_log();
  OUTLINED_FUNCTION_4();
  OS_os_log.init(subsystem:category:)();
  Logger.init(_:)();
  OUTLINED_FUNCTION_0();
}

uint64_t Logger.instrumentation.unsafeMutableAddressor()
{
  return Logger.logger.unsafeMutableAddressor(&one-time initialization token for instrumentation, (uint64_t)static Logger.instrumentation);
}

uint64_t Logger.logger.unsafeMutableAddressor(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = OUTLINED_FUNCTION_3();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t static Logger.instrumentation.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.logger.getter(&one-time initialization token for instrumentation, (uint64_t)static Logger.instrumentation, a1);
}

uint64_t static Logger.logger.getter@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = OUTLINED_FUNCTION_3();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t static Logger.makeSignpostID(log:)(void *a1)
{
  id v1;

  v1 = a1;
  return OSSignpostID.init(log:)();
}

uint64_t static Logger.begin(_:log:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4;

  v4 = a4;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  return OUTLINED_FUNCTION_1();
}

uint64_t static Logger.begin(_:_:log:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return static Logger.begin(_:_:log:)(a1, a2, a3, a4, a5, (void (*)(void))MEMORY[0x1E0DF22A0]);
}

uint64_t static Logger.event(_:log:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = type metadata accessor for OSSignpostID();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78]();
  OUTLINED_FUNCTION_5();
  static os_signpost_type_t.event.getter();
  static OSSignpostID.exclusive.getter();
  OUTLINED_FUNCTION_8();
  os_signpost(_:dso:log:name:signpostID:)();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

id static Logger.log.getter()
{
  if (one-time initialization token for log != -1)
    swift_once();
  return (id)static Logger.log;
}

uint64_t static Logger.end(_:_:log:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return static Logger.begin(_:_:log:)(a1, a2, a3, a4, a5, (void (*)(void))MEMORY[0x1E0DF2298]);
}

uint64_t static Logger.begin(_:_:log:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(void))
{
  a6();
  OUTLINED_FUNCTION_8();
  return OUTLINED_FUNCTION_1();
}

id default argument 1 of static Logger.withSignpost<A>(name:log:completion:)()
{
  if (one-time initialization token for log != -1)
    swift_once();
  return (id)static Logger.log;
}

uint64_t static Logger.withSignpost<A>(name:log:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v6 = type metadata accessor for OSSignpostID();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  OUTLINED_FUNCTION_5();
  if ((OS_os_log.signpostsEnabled.getter() & 1) == 0)
    return OUTLINED_FUNCTION_6();
  v9 = a4;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6();
  static os_signpost_type_t.end.getter();
  OUTLINED_FUNCTION_2();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v4, v6);
}

unint64_t lazy protocol witness table accessor for type Logger.Subsystem and conformance Logger.Subsystem()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Logger.Subsystem and conformance Logger.Subsystem;
  if (!lazy protocol witness table cache variable for type Logger.Subsystem and conformance Logger.Subsystem)
  {
    result = MEMORY[0x1C3BCBE28](&protocol conformance descriptor for Logger.Subsystem, &type metadata for Logger.Subsystem);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Logger.Subsystem and conformance Logger.Subsystem);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Logger.Category and conformance Logger.Category()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Logger.Category and conformance Logger.Category;
  if (!lazy protocol witness table cache variable for type Logger.Category and conformance Logger.Category)
  {
    result = MEMORY[0x1C3BCBE28](&protocol conformance descriptor for Logger.Category, &type metadata for Logger.Category);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Logger.Category and conformance Logger.Category);
  }
  return result;
}

void type metadata accessor for Logger()
{
  OUTLINED_FUNCTION_9();
}

uint64_t getEnumTagSinglePayload for Logger.Subsystem(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for Logger.Subsystem(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1C2EB0A90 + 4 * byte_1C2EC2A60[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1C2EB0AB0 + 4 * byte_1C2EC2A65[v4]))();
}

_BYTE *sub_1C2EB0A90(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1C2EB0AB0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1C2EB0AB8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1C2EB0AC0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1C2EB0AC8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1C2EB0AD0(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t getEnumTag for Logger.Subsystem()
{
  return 0;
}

void type metadata accessor for Logger.Subsystem()
{
  OUTLINED_FUNCTION_9();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Logger.Category(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
    if (a2 + 1 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 1) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v5 = v6 - 2;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for Logger.Category(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_1C2EB0BD4 + 4 * byte_1C2EC2A6F[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1C2EB0C08 + 4 * byte_1C2EC2A6A[v4]))();
}

uint64_t sub_1C2EB0C08(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C2EB0C10(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C2EB0C18);
  return result;
}

uint64_t sub_1C2EB0C24(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C2EB0C2CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1C2EB0C30(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C2EB0C38(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for Logger.Category(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for Logger.Category(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

void type metadata accessor for Logger.Category()
{
  OUTLINED_FUNCTION_9();
}

void protocol witness for SetAlgebra.init() in conformance NSPropertyListMutabilityOptions(uint64_t *a1@<X8>)
{
  *a1 = specialized OptionSet<>.init()();
  OUTLINED_FUNCTION_0();
}

void protocol witness for RawRepresentable.rawValue.getter in conformance SCSchemaSCUndoOutcomeReason(_DWORD *a1@<X8>)
{
  unsigned int *v1;

  *a1 = destructiveProjectEnumData for Logger.Subsystem(*v1);
  OUTLINED_FUNCTION_0();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance SCSchemaSCUndoType(int *a1, int *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

_QWORD *protocol witness for OptionSet.init(rawValue:) in conformance NSPropertyListMutabilityOptions@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
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

void CorrectionsEngine.__allocating_init()()
{
  swift_deletedMethodError();
  __break(1u);
}

uint64_t OUTLINED_FUNCTION_1()
{
  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t OUTLINED_FUNCTION_2()
{
  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t OUTLINED_FUNCTION_3()
{
  return type metadata accessor for Logger();
}

unint64_t OUTLINED_FUNCTION_4()
{
  return 0xD00000000000001ELL;
}

uint64_t OUTLINED_FUNCTION_6()
{
  uint64_t (*v0)(void);

  return v0();
}

uint64_t OUTLINED_FUNCTION_7()
{
  return swift_bridgeObjectRelease();
}

void CorrectionsPlatformClient.setupNewTurn(executionUUID:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v2 = type metadata accessor for UUID();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for shared != -1)
    swift_once();
  (*(void (**)(uint64_t))(*(_QWORD *)static CorrectionsSELFHelper.shared + 176))(a1);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  OUTLINED_FUNCTION_2_0();
}

uint64_t CorrectionsPlatformClient.undoFollowUpPluginActionUserDataKey.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CorrectionsPlatformClient.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  CorrectionsPlatformClient.init()();
  return v0;
}

uint64_t CorrectionsPlatformClient.init()()
{
  uint64_t v0;
  uint64_t v1;

  v1 = unk_1ED799358;
  *(_QWORD *)(v0 + 16) = qword_1ED799350;
  *(_QWORD *)(v0 + 24) = v1;
  swift_bridgeObjectRetain();
  return v0;
}

void CorrectionsPlatformClient.checkUndo(input:context:)(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t inited;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD v16[3];
  uint64_t v17;
  uint64_t v18;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_CorrectionOutcome?);
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *a2;
  v14 = a2[1];
  v15 = v8;
  v13 = a2[2];
  v9 = *((_QWORD *)a2 + 6);
  v10 = *((_QWORD *)a2 + 7);
  OUTLINED_FUNCTION_0_0();
  inited = swift_initStaticObject();
  v16[0] = v15;
  v16[1] = v14;
  v16[2] = v13;
  v17 = v9;
  v18 = v10;
  v12 = type metadata accessor for Siri_Nlu_External_CorrectionOutcome();
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v12);
  (*(void (**)(uint64_t, _OWORD *, char *))(*(_QWORD *)inited + 128))(a1, v16, v7);
  outlined destroy of Siri_Nlu_External_CorrectionOutcome?((uint64_t)v7);
  OUTLINED_FUNCTION_2_0();
}

uint64_t CorrectionsPlatformClient.checkUndo(input:context:correctionsOutcome:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t inited;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __n128 v15;
  uint64_t v16;
  __int128 v18;
  _BYTE v19[48];
  uint64_t v20;
  uint64_t v21;

  v18 = *(_OWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 48);
  v6 = *(_QWORD *)(a2 + 56);
  OUTLINED_FUNCTION_0_0();
  inited = swift_initStaticObject();
  v15 = OUTLINED_FUNCTION_1_0(inited, v8, v9, v10, v11, v12, v13, v14, v18);
  v20 = v5;
  v21 = v6;
  return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t, __n128))(*(_QWORD *)v16 + 128))(a1, v19, a3, v15);
}

Swift::Void __swiftcall CorrectionsPlatformClient.commit()()
{
  uint64_t inited;

  OUTLINED_FUNCTION_0_0();
  inited = swift_initStaticObject();
  (*(void (**)(void))(*(_QWORD *)inited + 144))();
}

uint64_t CorrectionsPlatformClient.setUndoInvocation(directInvocation:context:)(__int128 *a1, __int128 *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[3];
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  v2 = *((_QWORD *)a1 + 2);
  v9 = *a2;
  v10 = *a1;
  v7 = a2[2];
  v8 = a2[1];
  v3 = *((_QWORD *)a2 + 6);
  v4 = *((_QWORD *)a2 + 7);
  OUTLINED_FUNCTION_0_0();
  inited = swift_initStaticObject();
  v14 = v10;
  v15 = v2;
  v11[0] = v9;
  v11[1] = v8;
  v11[2] = v7;
  v12 = v3;
  v13 = v4;
  return (*(uint64_t (**)(__int128 *, _OWORD *))(*(_QWORD *)inited + 120))(&v14, v11);
}

Swift::Bool __swiftcall CorrectionsPlatformClient.isCorrectionPossible(context:)(SiriCorrections::CorrectionsContext_optional *context)
{
  uint64_t countAndFlagsBits;
  void *object;
  uint64_t inited;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __n128 v11;
  uint64_t v12;
  __int128 resultCandidateId;
  _BYTE v15[48];
  uint64_t v16;
  void *v17;

  resultCandidateId = (__int128)context->value.resultCandidateId;
  countAndFlagsBits = context->value.executionRequestId.value._countAndFlagsBits;
  object = context->value.executionRequestId.value._object;
  OUTLINED_FUNCTION_0_0();
  inited = swift_initStaticObject();
  v11 = OUTLINED_FUNCTION_1_0(inited, v4, v5, v6, v7, v8, v9, v10, resultCandidateId);
  v16 = countAndFlagsBits;
  v17 = object;
  return (*(uint64_t (**)(_BYTE *, __n128))(*(_QWORD *)v12 + 136))(v15, v11) & 1;
}

uint64_t CorrectionsPlatformClient.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t CorrectionsPlatformClient.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1C3BCBE10]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t outlined destroy of Siri_Nlu_External_CorrectionOutcome?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_CorrectionOutcome?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for CorrectionsPlatformClient()
{
  return objc_opt_self();
}

uint64_t method lookup function for CorrectionsPlatformClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CorrectionsPlatformClient.setupNewTurn(executionUUID:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

uint64_t dispatch thunk of CorrectionsPlatformClient.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of CorrectionsPlatformClient.checkUndo(input:context:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of CorrectionsPlatformClient.checkUndo(input:context:correctionsOutcome:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of CorrectionsPlatformClient.commit()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of CorrectionsPlatformClient.setUndoInvocation(directInvocation:context:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of CorrectionsPlatformClient.isCorrectionPossible(context:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return type metadata accessor for CorrectionsEngine();
}

__n128 OUTLINED_FUNCTION_1_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9)
{
  return (__n128)a9;
}

uint64_t CorrectionOperation.attribute.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CorrectionOperation.correction.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned __int8 v4;

  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v1 + 24);
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_BYTE *)(v1 + 32);
  *(_BYTE *)(a1 + 16) = v4;
  return outlined copy of CorrectionType(v2, v3, v4);
}

uint64_t outlined copy of CorrectionType(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 >= 2u && a3 != 3)
  {
    if (a3 != 2)
      return result;
    swift_bridgeObjectRetain();
  }
  return swift_bridgeObjectRetain();
}

__n128 CorrectionOperation.init(attribute:correction:)@<Q0>(unint64_t a1@<X0>, unint64_t a2@<X1>, __n128 *a3@<X2>, __n128 *a4@<X8>)
{
  unsigned __int8 v4;
  __n128 result;

  v4 = a3[1].n128_u8[0];
  a4->n128_u64[0] = a1;
  a4->n128_u64[1] = a2;
  result = *a3;
  a4[1] = *a3;
  a4[2].n128_u8[0] = v4;
  return result;
}

uint64_t destroy for CorrectionType(uint64_t a1)
{
  return outlined consume of CorrectionType(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t outlined consume of CorrectionType(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 >= 2u && a3 != 3)
  {
    if (a3 != 2)
      return result;
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t initializeBufferWithCopyOfBuffer for CorrectionType(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  outlined copy of CorrectionType(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for CorrectionType(uint64_t a1, uint64_t a2)
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
  outlined copy of CorrectionType(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  outlined consume of CorrectionType(v6, v7, v8);
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

uint64_t assignWithTake for CorrectionType(uint64_t a1, uint64_t a2)
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
  outlined consume of CorrectionType(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for CorrectionType(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFC && *(_BYTE *)(a1 + 17))
    {
      v2 = *(_DWORD *)a1 + 251;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 4)
        v2 = -1;
      else
        v2 = v3 ^ 0xFF;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CorrectionType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 252;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t getEnumTag for CorrectionType(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 3u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 4);
}

uint64_t destructiveInjectEnumTag for CorrectionType(uint64_t result, unsigned int a2)
{
  if (a2 >= 4)
  {
    *(_QWORD *)result = a2 - 4;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 4;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for CorrectionType()
{
  return &type metadata for CorrectionType;
}

uint64_t initializeBufferWithCopyOfBuffer for CorrectionOperation(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for CorrectionOperation(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return outlined consume of CorrectionType(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
}

uint64_t initializeWithCopy for CorrectionOperation(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 24);
  v6 = *(_BYTE *)(a2 + 32);
  swift_bridgeObjectRetain();
  outlined copy of CorrectionType(v4, v5, v6);
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 32) = v6;
  return a1;
}

uint64_t assignWithCopy for CorrectionOperation(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v2 = a2;
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = v2[2];
  v5 = v2[3];
  LOBYTE(v2) = *((_BYTE *)v2 + 32);
  outlined copy of CorrectionType(v4, v5, v2);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  v8 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = (_BYTE)v2;
  outlined consume of CorrectionType(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for CorrectionOperation(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_BYTE *)(a2 + 32);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v8 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v5;
  outlined consume of CorrectionType(v6, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for CorrectionOperation(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 33))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CorrectionOperation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 33) = 1;
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
    *(_BYTE *)(result + 33) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CorrectionOperation()
{
  return &type metadata for CorrectionOperation;
}

Swift::Bool __swiftcall CorrectionsCustomizing.shouldConsiderVerbAsCorrection(verb:)(Swift::String verb)
{
  uint64_t v1;
  char object;
  uint64_t v4;

  object = (char)verb._object;
  (*(void (**)(uint64_t *__return_ptr))(v1 + 16))(&v4);
  if (!v4)
    return 1;
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1();
  return object & 1;
}

Swift::Bool __swiftcall WildcardStringSet.contains(value:)(Swift::String value)
{
  uint64_t *v1;

  if (*v1)
    return specialized Set.contains(_:)(value._countAndFlagsBits, (uint64_t)value._object, *v1);
  else
    return 1;
}

Swift::Bool __swiftcall CorrectionsCustomizing.shouldAllowAttributeToBeCorrected(attribute:)(Swift::String attribute)
{
  uint64_t v1;
  char object;

  object = (char)attribute._object;
  (*(void (**)())(v1 + 8))();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1();
  return (object & 1) == 0;
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

uint64_t CorrectionsCustomizationsAllowingAllEntities.attributesNotAllowedToBeCorrected.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t CorrectionsCustomizationsAllowingAllEntities.attributesNotAllowedToBeCorrected.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*CorrectionsCustomizationsAllowingAllEntities.attributesNotAllowedToBeCorrected.modify())()
{
  return destructiveProjectEnumData for Logger.Subsystem;
}

uint64_t CorrectionsCustomizationsAllowingAllEntities.explicitCorrectionVerbs.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 8);
  return swift_bridgeObjectRetain();
}

uint64_t CorrectionsCustomizationsAllowingAllEntities.explicitCorrectionVerbs.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v2 = *a1;
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 8) = v2;
  return result;
}

uint64_t (*CorrectionsCustomizationsAllowingAllEntities.explicitCorrectionVerbs.modify())()
{
  return destructiveProjectEnumData for Logger.Subsystem;
}

uint64_t CorrectionsCustomizationsAllowingAllEntities.shouldAllowCorrectionsForTopLevelTaskEntity(_:)()
{
  return 1;
}

uint64_t CorrectionsCustomizationsAllowingAllEntities.init(attributesNotAllowedToBeCorrected:explicitCorrectionVerbs:)@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;

  v3 = *a2;
  *a3 = result;
  a3[1] = v3;
  return result;
}

uint64_t protocol witness for CorrectionsCustomizing.shouldAllowCorrectionsForTopLevelTaskEntity(_:) in conformance CorrectionsCustomizationsAllowingAllEntities()
{
  return 1;
}

uint64_t dispatch thunk of CorrectionsCustomizing.attributesNotAllowedToBeCorrected.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of CorrectionsCustomizing.explicitCorrectionVerbs.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

_QWORD *initializeBufferWithCopyOfBuffer for WildcardStringSet(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for WildcardStringSet()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for WildcardStringSet(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

_QWORD *assignWithTake for WildcardStringSet(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for WildcardStringSet(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for WildcardStringSet(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

uint64_t getEnumTag for WildcardStringSet(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *destructiveInjectEnumTag for WildcardStringSet(_QWORD *result, int a2)
{
  unsigned int v2;

  if (a2 < 0)
  {
    v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2)
      return result;
    v2 = a2 - 1;
  }
  *result = v2;
  return result;
}

ValueMetadata *type metadata accessor for WildcardStringSet()
{
  return &type metadata for WildcardStringSet;
}

uint64_t destroy for CorrectionsCustomizationsAllowingAllEntities()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeBufferWithCopyOfBuffer for CorrectionsCustomizationsAllowingAllEntities(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for CorrectionsCustomizationsAllowingAllEntities(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for CorrectionsCustomizationsAllowingAllEntities(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CorrectionsCustomizationsAllowingAllEntities(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CorrectionsCustomizationsAllowingAllEntities(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
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
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CorrectionsCustomizationsAllowingAllEntities()
{
  return &type metadata for CorrectionsCustomizationsAllowingAllEntities;
}

uint64_t OUTLINED_FUNCTION_0_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return specialized Set.contains(_:)(v2, v0, v1);
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t CorrectionsDomainClient.undoFollowUpPluginActionUserDataKey.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t CorrectionsDomainClient.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  CorrectionsDomainClient.init()();
  return v0;
}

uint64_t CorrectionsDomainClient.init()()
{
  uint64_t v0;
  uint64_t v1;

  v1 = unk_1ED799358;
  *(_QWORD *)(v0 + 16) = qword_1ED799350;
  *(_QWORD *)(v0 + 24) = v1;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t CorrectionsDomainClient.checkCorrection(input:)(uint64_t a1)
{
  uint64_t inited;

  OUTLINED_FUNCTION_0_0();
  inited = swift_initStaticObject();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)inited + 104))(a1);
}

uint64_t CorrectionsDomainClient.checkCorrections(input:customizations:)(uint64_t a1, uint64_t a2)
{
  uint64_t inited;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;

  OUTLINED_FUNCTION_0_0();
  inited = swift_initStaticObject();
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)inited + 112))(&v11, a1, a2);
  v5 = v12;
  if (!v12)
    return MEMORY[0x1E0DEE9D8];
  v6 = v15;
  v8 = v13;
  v7 = v14;
  v9 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CorrectionOperation>);
  result = swift_allocObject();
  *(_OWORD *)(result + 16) = xmmword_1C2EC2D50;
  *(_QWORD *)(result + 32) = v9;
  *(_QWORD *)(result + 40) = v5;
  *(_QWORD *)(result + 48) = v8;
  *(_QWORD *)(result + 56) = v7;
  *(_BYTE *)(result + 64) = v6;
  return result;
}

uint64_t CorrectionsDomainClient.donate(undoParse:)(__int128 *a1)
{
  uint64_t v1;
  uint64_t inited;
  __int128 v4;
  _OWORD v5[4];
  __int128 v6;
  uint64_t v7;

  v4 = *a1;
  v1 = *((_QWORD *)a1 + 2);
  OUTLINED_FUNCTION_0_0();
  inited = swift_initStaticObject();
  v6 = v4;
  v7 = v1;
  memset(v5, 0, sizeof(v5));
  return (*(uint64_t (**)(__int128 *, _OWORD *))(*(_QWORD *)inited + 120))(&v6, v5);
}

uint64_t CorrectionsDomainClient.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t CorrectionsDomainClient.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for CorrectionsDomainClient()
{
  return objc_opt_self();
}

uint64_t method lookup function for CorrectionsDomainClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CorrectionsDomainClient.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of CorrectionsDomainClient.checkCorrection(input:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of CorrectionsDomainClient.checkCorrections(input:customizations:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of CorrectionsDomainClient.donate(undoParse:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t CorrectionsUSOParse.debugDescription.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  Swift::String v4;
  Swift::String v5;
  uint64_t v6;
  Swift::String v7;
  Swift::String v8;
  Swift::String v9;
  Swift::String v10;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x1E0C80A78](v2, v3);
  OUTLINED_FUNCTION_1_2();
  _StringGuts.grow(_:)(53);
  v4._countAndFlagsBits = 0x7372615072657355;
  v4._object = (void *)0xEB00000000203A65;
  String.append(_:)(v4);
  OUTLINED_FUNCTION_5_0();
  _print_unlocked<A, B>(_:_:)();
  v5._object = (void *)0x80000001C2EC3400;
  v5._countAndFlagsBits = 0xD000000000000014;
  String.append(_:)(v5);
  v6 = OUTLINED_FUNCTION_4_0();
  outlined init with copy of Siri_Nlu_External_Parser.ParserIdentifier?(v0 + *(int *)(v6 + 20), v1);
  v7._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 0x6E7542707061202CLL;
  v8._object = (void *)0xEF203A6449656C64;
  String.append(_:)(v8);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
  v9._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v9);
  OUTLINED_FUNCTION_10();
  v10._countAndFlagsBits = 41;
  v10._object = (void *)0xE100000000000000;
  String.append(_:)(v10);
  return 0;
}

uint64_t type metadata accessor for CorrectionsUSOParse(uint64_t a1)
{
  return type metadata accessor for CorrectionsUSOParse(a1, type metadata singleton initialization cache for CorrectionsUSOParse);
}

uint64_t outlined init with copy of Siri_Nlu_External_Parser.ParserIdentifier?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t CorrectionsUSOParse.init(userParse:parserIdentifier:appBundleId:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  _QWORD *v13;

  v10 = OUTLINED_FUNCTION_4_0();
  outlined init with take of Siri_Nlu_External_Parser.ParserIdentifier?(a2, a5 + *(int *)(v10 + 20));
  v11 = OUTLINED_FUNCTION_5_0();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a5, a1, v11);
  v13 = (_QWORD *)(a5 + *(int *)(v10 + 24));
  *v13 = a3;
  v13[1] = a4;
  return result;
}

uint64_t outlined init with take of Siri_Nlu_External_Parser.ParserIdentifier?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t CorrectionsUSOParse.userParse.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_5_0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t CorrectionsUSOParse.parserIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(OUTLINED_FUNCTION_4_0() + 20);
  return outlined init with copy of Siri_Nlu_External_Parser.ParserIdentifier?(v3, a1);
}

uint64_t CorrectionsUSOParse.appBundleId.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(OUTLINED_FUNCTION_4_0() + 24));
  OUTLINED_FUNCTION_11();
  return v1;
}

uint64_t static CorrectionsUSOParse.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
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
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  BOOL v39;
  uint64_t v41;
  uint64_t v42;

  v5 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v9 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Siri_Nlu_External_Parser.ParserIdentifier?, Siri_Nlu_External_Parser.ParserIdentifier?));
  OUTLINED_FUNCTION_9_0();
  MEMORY[0x1E0C80A78](v11, v12);
  OUTLINED_FUNCTION_1_2();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
  OUTLINED_FUNCTION_9_0();
  v15 = MEMORY[0x1E0C80A78](v13, v14);
  v17 = (char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x1E0C80A78](v15, v18);
  v21 = (char *)&v41 - v20;
  MEMORY[0x1E0C80A78](v19, v22);
  v24 = (char *)&v41 - v23;
  if ((static Siri_Nlu_External_UserParse.== infix(_:_:)() & 1) == 0)
    return 0;
  v25 = OUTLINED_FUNCTION_4_0();
  v26 = a1;
  v27 = a2;
  v28 = v25;
  v29 = *(int *)(v25 + 20);
  v41 = v26;
  outlined init with copy of Siri_Nlu_External_Parser.ParserIdentifier?(v26 + v29, (uint64_t)v24);
  v42 = v28;
  outlined init with copy of Siri_Nlu_External_Parser.ParserIdentifier?(v27 + *(int *)(v28 + 20), (uint64_t)v21);
  v30 = v2 + *(int *)(v10 + 48);
  outlined init with copy of Siri_Nlu_External_Parser.ParserIdentifier?((uint64_t)v24, v2);
  outlined init with copy of Siri_Nlu_External_Parser.ParserIdentifier?((uint64_t)v21, v30);
  OUTLINED_FUNCTION_8_0(v2);
  if (!v31)
  {
    outlined init with copy of Siri_Nlu_External_Parser.ParserIdentifier?(v2, (uint64_t)v17);
    OUTLINED_FUNCTION_8_0(v30);
    if (!v31)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 32))(v9, v30, v5);
      lazy protocol witness table accessor for type Siri_Nlu_External_Parser.ParserIdentifier and conformance Siri_Nlu_External_Parser.ParserIdentifier();
      v32 = dispatch thunk of static Equatable.== infix(_:_:)();
      v33 = *(void (**)(char *, uint64_t))(v6 + 8);
      v33(v9, v5);
      OUTLINED_FUNCTION_3_0((uint64_t)v21);
      OUTLINED_FUNCTION_3_0((uint64_t)v24);
      v33(v17, v5);
      OUTLINED_FUNCTION_3_0(v2);
      if ((v32 & 1) == 0)
        return 0;
      goto LABEL_12;
    }
    outlined destroy of Siri_Nlu_External_Parser.ParserIdentifier?((uint64_t)v21, &demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
    outlined destroy of Siri_Nlu_External_Parser.ParserIdentifier?((uint64_t)v24, &demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v17, v5);
LABEL_10:
    outlined destroy of Siri_Nlu_External_Parser.ParserIdentifier?(v2, &demangling cache variable for type metadata for (Siri_Nlu_External_Parser.ParserIdentifier?, Siri_Nlu_External_Parser.ParserIdentifier?));
    return 0;
  }
  OUTLINED_FUNCTION_3_0((uint64_t)v21);
  OUTLINED_FUNCTION_3_0((uint64_t)v24);
  OUTLINED_FUNCTION_8_0(v30);
  if (!v31)
    goto LABEL_10;
  outlined destroy of Siri_Nlu_External_Parser.ParserIdentifier?(v2, &demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
LABEL_12:
  v34 = *(int *)(v42 + 24);
  v35 = (_QWORD *)(v41 + v34);
  v36 = *(_QWORD *)(v41 + v34 + 8);
  v37 = (_QWORD *)(v27 + v34);
  v38 = v37[1];
  if (v36)
  {
    if (v38)
    {
      v39 = *v35 == *v37 && v36 == v38;
      if (v39 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        return 1;
    }
  }
  else if (!v38)
  {
    return 1;
  }
  return 0;
}

uint64_t CorrectionsDirectInvocation.identifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  OUTLINED_FUNCTION_11();
  return v1;
}

uint64_t CorrectionsDirectInvocation.userData.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t CorrectionsDirectInvocation.init(identifier:userData:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

BOOL static CorrectionsDirectInvocation.CodingKeys.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void CorrectionsDirectInvocation.CodingKeys.hash(into:)(uint64_t a1, char a2)
{
  Hasher._combine(_:)(a2 & 1);
}

SiriCorrections::CorrectionsDirectInvocation::CodingKeys_optional __swiftcall CorrectionsDirectInvocation.CodingKeys.init(stringValue:)(Swift::String stringValue)
{
  void *object;
  BOOL v2;
  uint64_t countAndFlagsBits;
  char v6;

  object = stringValue._object;
  v2 = stringValue._countAndFlagsBits == 0x696669746E656469 && stringValue._object == (void *)0xEA00000000007265;
  if (v2 || (countAndFlagsBits = stringValue._countAndFlagsBits, (OUTLINED_FUNCTION_7_0() & 1) != 0))
  {
    OUTLINED_FUNCTION_10();
    return 0;
  }
  else if (countAndFlagsBits == 0x6174614472657375 && object == (void *)0xE800000000000000)
  {
    OUTLINED_FUNCTION_10();
    return (SiriCorrections::CorrectionsDirectInvocation::CodingKeys_optional)1;
  }
  else
  {
    v6 = OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_10();
    if ((v6 & 1) != 0)
      return (SiriCorrections::CorrectionsDirectInvocation::CodingKeys_optional)1;
    else
      return (SiriCorrections::CorrectionsDirectInvocation::CodingKeys_optional)2;
  }
}

SiriCorrections::CorrectionsDirectInvocation::CodingKeys_optional __swiftcall CorrectionsDirectInvocation.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  return (SiriCorrections::CorrectionsDirectInvocation::CodingKeys_optional)2;
}

Swift::Int CorrectionsDirectInvocation.CodingKeys.hashValue.getter(char a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1 & 1);
  return Hasher._finalize()();
}

uint64_t CorrectionsDirectInvocation.CodingKeys.intValue.getter()
{
  return 0;
}

uint64_t CorrectionsDirectInvocation.CodingKeys.stringValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6174614472657375;
  else
    return 0x696669746E656469;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CorrectionsDirectInvocation.CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return static CorrectionsDirectInvocation.CodingKeys.== infix(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance CorrectionsDirectInvocation.CodingKeys()
{
  char *v0;

  return CorrectionsDirectInvocation.CodingKeys.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance CorrectionsDirectInvocation.CodingKeys(uint64_t a1)
{
  char *v1;

  CorrectionsDirectInvocation.CodingKeys.hash(into:)(a1, *v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CorrectionsDirectInvocation.CodingKeys()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance CorrectionsDirectInvocation.CodingKeys()
{
  char *v0;

  return CorrectionsDirectInvocation.CodingKeys.stringValue.getter(*v0);
}

SiriCorrections::CorrectionsDirectInvocation::CodingKeys_optional protocol witness for CodingKey.init(stringValue:) in conformance CorrectionsDirectInvocation.CodingKeys@<W0>(uint64_t a1@<X0>, SiriCorrections::CorrectionsDirectInvocation::CodingKeys_optional *a2@<X8>)
{
  SiriCorrections::CorrectionsDirectInvocation::CodingKeys_optional result;

  result.value = CorrectionsDirectInvocation.CodingKeys.init(stringValue:)(*(Swift::String *)&a1).value;
  a2->value = result.value;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance CorrectionsDirectInvocation.CodingKeys()
{
  return 0;
}

void protocol witness for CodingKey.init(intValue:) in conformance CorrectionsDirectInvocation.CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CorrectionsDirectInvocation.CodingKeys()
{
  lazy protocol witness table accessor for type CorrectionsDirectInvocation.CodingKeys and conformance CorrectionsDirectInvocation.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance CorrectionsDirectInvocation.CodingKeys()
{
  lazy protocol witness table accessor for type CorrectionsDirectInvocation.CodingKeys and conformance CorrectionsDirectInvocation.CodingKeys();
  return CodingKey.debugDescription.getter();
}

void CorrectionsDirectInvocation.init(from:)(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  int v14;
  id v15;
  Class isa;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<CorrectionsDirectInvocation.CodingKeys>);
  MEMORY[0x1E0C80A78](v5, v6);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type CorrectionsDirectInvocation.CodingKeys and conformance CorrectionsDirectInvocation.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v2)
  {
    LOBYTE(v21) = 0;
    v7 = KeyedDecodingContainer.decode(_:forKey:)();
    v9 = v8;
    LOBYTE(v20) = 1;
    lazy protocol witness table accessor for type Data and conformance Data();
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
    v19 = v22;
    if (v22 >> 60 == 15)
    {
      OUTLINED_FUNCTION_0_2();
      v10 = 0;
    }
    else
    {
      v11 = (uint64_t)v21;
      v17 = (void *)objc_opt_self();
      v18 = v11;
      isa = Data._bridgeToObjectiveC()().super.isa;
      v21 = 0;
      v12 = objc_msgSend(v17, sel_propertyListWithData_options_format_error_, isa, 0, 0, &v21);

      if (!v12)
      {
        v15 = v21;
        swift_bridgeObjectRelease();
        _convertNSErrorToError(_:)();

        swift_willThrow();
        outlined consume of Data?(v18, v19);
        OUTLINED_FUNCTION_0_2();
        goto LABEL_8;
      }
      v13 = v21;
      _bridgeAnyObjectToAny(_:)();
      outlined consume of Data?(v18, v19);
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_0_2();
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Any]);
      v14 = swift_dynamicCast();
      v10 = v20;
      if (!v14)
        v10 = 0;
    }
    *a2 = v7;
    a2[1] = v9;
    a2[2] = v10;
  }
LABEL_8:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  OUTLINED_FUNCTION_2_2();
}

void CorrectionsDirectInvocation.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  Class isa;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15[3];

  v15[2] = *(id *)MEMORY[0x1E0C80C00];
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<CorrectionsDirectInvocation.CodingKeys>);
  MEMORY[0x1E0C80A78](v3, v4);
  OUTLINED_FUNCTION_1_2();
  v13 = *(_QWORD *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type CorrectionsDirectInvocation.CodingKeys and conformance CorrectionsDirectInvocation.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  LOBYTE(v15[0]) = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v14 && v13)
  {
    v5 = (void *)objc_opt_self();
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    v15[0] = 0;
    v7 = objc_msgSend(v5, sel_dataWithPropertyList_format_options_error_, isa, 200, 0, v15);

    v8 = v15[0];
    if (v7)
    {
      v9 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
      v11 = v10;

      v15[0] = v9;
      v15[1] = v11;
      lazy protocol witness table accessor for type Data and conformance Data();
      KeyedEncodingContainer.encode<A>(_:forKey:)();
      OUTLINED_FUNCTION_6_0();
      outlined consume of Data._Representation((uint64_t)v9, (unint64_t)v11);
      goto LABEL_3;
    }
    v12 = v8;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  OUTLINED_FUNCTION_6_0();
LABEL_3:
  OUTLINED_FUNCTION_2_2();
}

void protocol witness for Decodable.init(from:) in conformance CorrectionsDirectInvocation(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  CorrectionsDirectInvocation.init(from:)(a1, a2);
}

void protocol witness for Encodable.encode(to:) in conformance CorrectionsDirectInvocation(_QWORD *a1)
{
  CorrectionsDirectInvocation.encode(to:)(a1);
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t outlined destroy of Siri_Nlu_External_Parser.ParserIdentifier?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t lazy protocol witness table accessor for type Siri_Nlu_External_Parser.ParserIdentifier and conformance Siri_Nlu_External_Parser.ParserIdentifier()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type Siri_Nlu_External_Parser.ParserIdentifier and conformance Siri_Nlu_External_Parser.ParserIdentifier;
  if (!lazy protocol witness table cache variable for type Siri_Nlu_External_Parser.ParserIdentifier and conformance Siri_Nlu_External_Parser.ParserIdentifier)
  {
    v1 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
    result = MEMORY[0x1C3BCBE28](MEMORY[0x1E0D9F168], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Siri_Nlu_External_Parser.ParserIdentifier and conformance Siri_Nlu_External_Parser.ParserIdentifier);
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t lazy protocol witness table accessor for type CorrectionsDirectInvocation.CodingKeys and conformance CorrectionsDirectInvocation.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CorrectionsDirectInvocation.CodingKeys and conformance CorrectionsDirectInvocation.CodingKeys;
  if (!lazy protocol witness table cache variable for type CorrectionsDirectInvocation.CodingKeys and conformance CorrectionsDirectInvocation.CodingKeys)
  {
    result = MEMORY[0x1C3BCBE28](&protocol conformance descriptor for CorrectionsDirectInvocation.CodingKeys, &type metadata for CorrectionsDirectInvocation.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CorrectionsDirectInvocation.CodingKeys and conformance CorrectionsDirectInvocation.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CorrectionsDirectInvocation.CodingKeys and conformance CorrectionsDirectInvocation.CodingKeys;
  if (!lazy protocol witness table cache variable for type CorrectionsDirectInvocation.CodingKeys and conformance CorrectionsDirectInvocation.CodingKeys)
  {
    result = MEMORY[0x1C3BCBE28](&protocol conformance descriptor for CorrectionsDirectInvocation.CodingKeys, &type metadata for CorrectionsDirectInvocation.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CorrectionsDirectInvocation.CodingKeys and conformance CorrectionsDirectInvocation.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CorrectionsDirectInvocation.CodingKeys and conformance CorrectionsDirectInvocation.CodingKeys;
  if (!lazy protocol witness table cache variable for type CorrectionsDirectInvocation.CodingKeys and conformance CorrectionsDirectInvocation.CodingKeys)
  {
    result = MEMORY[0x1C3BCBE28](&protocol conformance descriptor for CorrectionsDirectInvocation.CodingKeys, &type metadata for CorrectionsDirectInvocation.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CorrectionsDirectInvocation.CodingKeys and conformance CorrectionsDirectInvocation.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CorrectionsDirectInvocation.CodingKeys and conformance CorrectionsDirectInvocation.CodingKeys;
  if (!lazy protocol witness table cache variable for type CorrectionsDirectInvocation.CodingKeys and conformance CorrectionsDirectInvocation.CodingKeys)
  {
    result = MEMORY[0x1C3BCBE28](&protocol conformance descriptor for CorrectionsDirectInvocation.CodingKeys, &type metadata for CorrectionsDirectInvocation.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CorrectionsDirectInvocation.CodingKeys and conformance CorrectionsDirectInvocation.CodingKeys);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

unint64_t lazy protocol witness table accessor for type Data and conformance Data()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Data and conformance Data;
  if (!lazy protocol witness table cache variable for type Data and conformance Data)
  {
    result = MEMORY[0x1C3BCBE28](MEMORY[0x1E0CB0378], MEMORY[0x1E0CB0338]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Data and conformance Data);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Data and conformance Data;
  if (!lazy protocol witness table cache variable for type Data and conformance Data)
  {
    result = MEMORY[0x1C3BCBE28](MEMORY[0x1E0CB0350], MEMORY[0x1E0CB0338]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Data and conformance Data);
  }
  return result;
}

uint64_t specialized OptionSet<>.init()()
{
  return 0;
}

uint64_t outlined consume of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return outlined consume of Data._Representation(a1, a2);
  return a1;
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

uint64_t *initializeBufferWithCopyOfBuffer for CorrectionsParse(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
    return a1;
  }
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      v16 = a2[1];
      *a1 = *a2;
      a1[1] = v16;
      a1[2] = a2[2];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
LABEL_13:
      swift_storeEnumTagMultiPayload();
      return a1;
    case 1:
      *a1 = *a2;
      swift_unknownObjectRetain();
      goto LABEL_13;
    case 0:
      v8 = type metadata accessor for Siri_Nlu_External_UserParse();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      v9 = type metadata accessor for CorrectionsUSOParse(0);
      v10 = *(int *)(v9 + 20);
      v11 = (char *)a1 + v10;
      v12 = (char *)a2 + v10;
      v13 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
      if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13))
      {
        v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
        memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
        __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v13);
      }
      v17 = *(int *)(v9 + 24);
      v18 = (uint64_t *)((char *)a1 + v17);
      v19 = (uint64_t *)((char *)a2 + v17);
      v20 = v19[1];
      *v18 = *v19;
      v18[1] = v20;
      swift_bridgeObjectRetain();
      goto LABEL_13;
  }
  memcpy(a1, a2, *(_QWORD *)(v5 + 64));
  return a1;
}

uint64_t destroy for CorrectionsParse(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  if ((_DWORD)result != 1)
  {
    if ((_DWORD)result)
      return result;
    v3 = type metadata accessor for Siri_Nlu_External_UserParse();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
    v4 = a1 + *(int *)(type metadata accessor for CorrectionsUSOParse(0) + 20);
    v5 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
    if (!__swift_getEnumTagSinglePayload(v4, 1, v5))
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
    return swift_bridgeObjectRelease();
  }
  return swift_unknownObjectRelease();
}

_QWORD *initializeWithCopy for CorrectionsParse(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      v14 = a2[1];
      *a1 = *a2;
      a1[1] = v14;
      a1[2] = a2[2];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
LABEL_11:
      swift_storeEnumTagMultiPayload();
      return a1;
    case 1:
      *a1 = *a2;
      swift_unknownObjectRetain();
      goto LABEL_11;
    case 0:
      v7 = type metadata accessor for Siri_Nlu_External_UserParse();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = type metadata accessor for CorrectionsUSOParse(0);
      v9 = *(int *)(v8 + 20);
      v10 = (char *)a1 + v9;
      v11 = (char *)a2 + v9;
      v12 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
      if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
      {
        v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
        memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
        __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
      }
      v15 = *(int *)(v8 + 24);
      v16 = (_QWORD *)((char *)a1 + v15);
      v17 = (_QWORD *)((char *)a2 + v15);
      v18 = v17[1];
      *v16 = *v17;
      v16[1] = v18;
      swift_bridgeObjectRetain();
      goto LABEL_11;
  }
  memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  return a1;
}

_QWORD *assignWithCopy for CorrectionsParse(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;

  if (a1 == a2)
    return a1;
  outlined destroy of CorrectionsParse((uint64_t)a1);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 2:
      *a1 = *a2;
      a1[1] = a2[1];
      a1[2] = a2[2];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
LABEL_12:
      swift_storeEnumTagMultiPayload();
      return a1;
    case 1:
      *a1 = *a2;
      swift_unknownObjectRetain();
      goto LABEL_12;
    case 0:
      v7 = type metadata accessor for Siri_Nlu_External_UserParse();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = type metadata accessor for CorrectionsUSOParse(0);
      v9 = *(int *)(v8 + 20);
      v10 = (char *)a1 + v9;
      v11 = (char *)a2 + v9;
      v12 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
      if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
      {
        v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
        memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
        __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
      }
      v14 = *(int *)(v8 + 24);
      v15 = (_QWORD *)((char *)a1 + v14);
      v16 = (_QWORD *)((char *)a2 + v14);
      *v15 = *v16;
      v15[1] = v16[1];
      swift_bridgeObjectRetain();
      goto LABEL_12;
  }
  memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  return a1;
}

uint64_t outlined destroy of CorrectionsParse(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CorrectionsParse(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for CorrectionsParse(uint64_t a1)
{
  return type metadata accessor for CorrectionsUSOParse(a1, (uint64_t *)&type metadata singleton initialization cache for CorrectionsParse);
}

uint64_t type metadata accessor for CorrectionsUSOParse(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

char *initializeWithTake for CorrectionsParse(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v6 = type metadata accessor for Siri_Nlu_External_UserParse();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    v7 = type metadata accessor for CorrectionsUSOParse(0);
    v8 = *(int *)(v7 + 20);
    v9 = &a1[v8];
    v10 = &a2[v8];
    v11 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
    }
    *(_OWORD *)&a1[*(int *)(v7 + 24)] = *(_OWORD *)&a2[*(int *)(v7 + 24)];
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *assignWithTake for CorrectionsParse(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  if (a1 != a2)
  {
    outlined destroy of CorrectionsParse((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v6 = type metadata accessor for Siri_Nlu_External_UserParse();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      v7 = type metadata accessor for CorrectionsUSOParse(0);
      v8 = *(int *)(v7 + 20);
      v9 = &a1[v8];
      v10 = &a2[v8];
      v11 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
      if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
      {
        v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
        memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
        __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
      }
      *(_OWORD *)&a1[*(int *)(v7 + 24)] = *(_OWORD *)&a2[*(int *)(v7 + 24)];
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t destructiveInjectEnumTag for CorrectionsParse()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t type metadata completion function for CorrectionsParse()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for CorrectionsUSOParse(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for CorrectionsUSOParse(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for Siri_Nlu_External_UserParse();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
    }
    v14 = *(int *)(a3 + 24);
    v15 = (uint64_t *)((char *)a1 + v14);
    v16 = (uint64_t *)((char *)a2 + v14);
    v17 = v16[1];
    *v15 = *v16;
    v15[1] = v17;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for CorrectionsUSOParse(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = type metadata accessor for Siri_Nlu_External_UserParse();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
  if (!__swift_getEnumTagSinglePayload(v5, 1, v6))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CorrectionsUSOParse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;

  v6 = type metadata accessor for Siri_Nlu_External_UserParse();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  v12 = *(int *)(a3 + 24);
  v13 = (_QWORD *)(a1 + v12);
  v14 = (_QWORD *)(a2 + v12);
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CorrectionsUSOParse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  int EnumTagSinglePayload;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;

  v6 = type metadata accessor for Siri_Nlu_External_UserParse();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (!EnumTagSinglePayload)
  {
    v13 = *(_QWORD *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(v13 + 24))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
LABEL_7:
  v15 = *(int *)(a3 + 24);
  v16 = (_QWORD *)(a1 + v15);
  v17 = (_QWORD *)(a2 + v15);
  *v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for CorrectionsUSOParse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = type metadata accessor for Siri_Nlu_External_UserParse();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithTake for CorrectionsUSOParse(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  int EnumTagSinglePayload;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v6 = type metadata accessor for Siri_Nlu_External_UserParse();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (!EnumTagSinglePayload)
  {
    v13 = *(_QWORD *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(v13 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
LABEL_7:
  v15 = *(int *)(a3 + 24);
  v16 = (_QWORD *)(a1 + v15);
  v17 = (uint64_t *)(a2 + v15);
  v19 = *v17;
  v18 = v17[1];
  *v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CorrectionsUSOParse()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1C2EB4040(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v11;
  int v12;

  v6 = OUTLINED_FUNCTION_5_0();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
    return __swift_getEnumTagSinglePayload(v8, a2, v7);
  }
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
  if (*(_DWORD *)(*(_QWORD *)(v9 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v9;
    v8 = a1 + *(int *)(a3 + 20);
    return __swift_getEnumTagSinglePayload(v8, a2, v7);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  v12 = v11 - 1;
  if (v12 < 0)
    v12 = -1;
  return (v12 + 1);
}

uint64_t storeEnumTagSinglePayload for CorrectionsUSOParse()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1C2EB40FC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v8 = OUTLINED_FUNCTION_5_0();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = a1;
    return __swift_storeEnumTagSinglePayload(v10, a2, a2, v9);
  }
  result = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
  {
    v9 = result;
    v10 = a1 + *(int *)(a4 + 20);
    return __swift_storeEnumTagSinglePayload(v10, a2, a2, v9);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = a2;
  return result;
}

void type metadata completion function for CorrectionsUSOParse()
{
  unint64_t v0;
  unint64_t v1;

  type metadata accessor for Siri_Nlu_External_UserParse();
  if (v0 <= 0x3F)
  {
    type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier?();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier?()
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?)
  {
    type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier();
    v0 = type metadata accessor for Optional();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Siri_Nlu_External_Parser.ParserIdentifier?);
  }
}

uint64_t destroy for CorrectionsDirectInvocation()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeBufferWithCopyOfBuffer for CorrectionsDirectInvocation(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_11();
  return a1;
}

_QWORD *assignWithCopy for CorrectionsDirectInvocation(_QWORD *a1, _QWORD *a2)
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

uint64_t assignWithTake for CorrectionsDirectInvocation(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CorrectionsDirectInvocation(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CorrectionsDirectInvocation(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for CorrectionsDirectInvocation()
{
  return &type metadata for CorrectionsDirectInvocation;
}

uint64_t storeEnumTagSinglePayload for CorrectionsDirectInvocation.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_1C2EB4478 + 4 * byte_1C2EC2DB5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1C2EB44AC + 4 * byte_1C2EC2DB0[v4]))();
}

uint64_t sub_1C2EB44AC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C2EB44B4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C2EB44BCLL);
  return result;
}

uint64_t sub_1C2EB44C8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C2EB44D0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1C2EB44D4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C2EB44DC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CorrectionsDirectInvocation.CodingKeys()
{
  return &type metadata for CorrectionsDirectInvocation.CodingKeys;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_3_0(uint64_t a1)
{
  uint64_t *v1;

  return outlined destroy of Siri_Nlu_External_Parser.ParserIdentifier?(a1, v1);
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return type metadata accessor for CorrectionsUSOParse(0);
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return type metadata accessor for Siri_Nlu_External_UserParse();
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t OUTLINED_FUNCTION_8_0(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_10()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_11()
{
  return swift_bridgeObjectRetain();
}

void __swiftcall CorrectionsContext.init(userId:assistantId:)(SiriCorrections::CorrectionsContext *__return_ptr retstr, Swift::String_optional userId, Swift::String_optional assistantId)
{
  retstr->userId = userId;
  retstr->assistantId = assistantId;
  retstr->resultCandidateId = 0u;
  retstr->executionRequestId = 0u;
}

void CorrectionsContext.userId.getter()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0();
}

void CorrectionsContext.assistantId.getter()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0();
}

void CorrectionsContext.resultCandidateId.getter()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0();
}

void CorrectionsContext.executionRequestId.getter()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0();
}

double static CorrectionsContext.builder.getter()
{
  _OWORD *v0;
  double result;

  type metadata accessor for CorrectionsContext.Builder();
  v0 = (_OWORD *)OUTLINED_FUNCTION_14();
  result = 0.0;
  v0[1] = 0u;
  v0[2] = 0u;
  v0[3] = 0u;
  v0[4] = 0u;
  return result;
}

double CorrectionsContext.Builder.__allocating_init()()
{
  _OWORD *v0;
  double result;

  v0 = (_OWORD *)OUTLINED_FUNCTION_14();
  result = 0.0;
  v0[1] = 0u;
  v0[2] = 0u;
  v0[3] = 0u;
  v0[4] = 0u;
  return result;
}

uint64_t type metadata accessor for CorrectionsContext.Builder()
{
  return objc_opt_self();
}

uint64_t key path setter for CorrectionsContext.Builder.userId : CorrectionsContext.Builder(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v2 = *a1;
  v3 = a1[1];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(_QWORD **)a2 + 120);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

void CorrectionsContext.Builder.userId.getter()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_7_1();
}

void CorrectionsContext.Builder.userId.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_1_3();
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v0;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_3();
}

void CorrectionsContext.Builder.userId.modify()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0();
}

uint64_t key path setter for CorrectionsContext.Builder.assistantId : CorrectionsContext.Builder(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v2 = *a1;
  v3 = a1[1];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(_QWORD **)a2 + 144);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

void CorrectionsContext.Builder.assistantId.getter()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_7_1();
}

void CorrectionsContext.Builder.assistantId.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_1_3();
  *(_QWORD *)(v1 + 32) = v2;
  *(_QWORD *)(v1 + 40) = v0;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_3();
}

void CorrectionsContext.Builder.assistantId.modify()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0();
}

uint64_t key path setter for CorrectionsContext.Builder.resultCandidateId : CorrectionsContext.Builder(uint64_t *a1, uint64_t a2)
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

void CorrectionsContext.Builder.resultCandidateId.getter()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_7_1();
}

void CorrectionsContext.Builder.resultCandidateId.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_1_3();
  *(_QWORD *)(v1 + 48) = v2;
  *(_QWORD *)(v1 + 56) = v0;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_3();
}

void CorrectionsContext.Builder.resultCandidateId.modify()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0();
}

uint64_t key path setter for CorrectionsContext.Builder.executionRequestId : CorrectionsContext.Builder(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v2 = *a1;
  v3 = a1[1];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(_QWORD **)a2 + 192);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

void CorrectionsContext.Builder.executionRequestId.getter()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_7_1();
}

void CorrectionsContext.Builder.executionRequestId.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_1_3();
  *(_QWORD *)(v1 + 64) = v2;
  *(_QWORD *)(v1 + 72) = v0;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_3();
}

void CorrectionsContext.Builder.executionRequestId.modify()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0();
}

uint64_t CorrectionsContext.Builder.userId(_:)()
{
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_5_1();
  return OUTLINED_FUNCTION_0_3();
}

uint64_t CorrectionsContext.Builder.assistantId(_:)()
{
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_5_1();
  return OUTLINED_FUNCTION_0_3();
}

uint64_t CorrectionsContext.Builder.resultCandidateId(_:)()
{
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_5_1();
  return OUTLINED_FUNCTION_0_3();
}

uint64_t CorrectionsContext.Builder.executionRequestId(_:)()
{
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_5_1();
  return OUTLINED_FUNCTION_0_3();
}

void __swiftcall CorrectionsContext.Builder.build()(SiriCorrections::CorrectionsContext *__return_ptr retstr)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = (*(uint64_t (**)(void))(*(_QWORD *)v1 + 112))();
  v5 = v4;
  v6 = (*(uint64_t (**)(void))(*(_QWORD *)v1 + 136))();
  v8 = v7;
  v9 = (*(uint64_t (**)(void))(*(_QWORD *)v1 + 160))();
  v11 = v10;
  v12 = (*(uint64_t (**)(void))(*(_QWORD *)v1 + 184))();
  retstr->userId.value._countAndFlagsBits = v3;
  retstr->userId.value._object = v5;
  retstr->assistantId.value._countAndFlagsBits = v6;
  retstr->assistantId.value._object = v8;
  retstr->resultCandidateId.value._countAndFlagsBits = v9;
  retstr->resultCandidateId.value._object = v11;
  retstr->executionRequestId.value._countAndFlagsBits = v12;
  retstr->executionRequestId.value._object = v13;
}

uint64_t CorrectionsContext.Builder.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t CorrectionsContext.Builder.__deallocating_deinit()
{
  CorrectionsContext.Builder.deinit();
  return swift_deallocClassInstance();
}

double CorrectionsContext.Builder.init()()
{
  _OWORD *v0;
  double result;

  result = 0.0;
  v0[3] = 0u;
  v0[4] = 0u;
  v0[1] = 0u;
  v0[2] = 0u;
  return result;
}

uint64_t CorrectionsContext.debugDescription.getter()
{
  Swift::String v0;
  Swift::String v1;
  Swift::String v2;
  Swift::String v4;
  Swift::String v5;
  Swift::String v6;
  Swift::String v7;
  Swift::String v8;

  _StringGuts.grow(_:)(74);
  v0._countAndFlagsBits = 0x203A644972657375;
  v0._object = (void *)0xE800000000000000;
  String.append(_:)(v0);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
  v4._countAndFlagsBits = OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_11_0(v4);
  swift_bridgeObjectRelease();
  v1._countAndFlagsBits = 0x747369737361202CLL;
  v1._object = (void *)0xEF203A6449746E61;
  String.append(_:)(v1);
  swift_bridgeObjectRetain();
  v5._countAndFlagsBits = OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_11_0(v5);
  swift_bridgeObjectRelease();
  v2._object = (void *)0x80000001C2EC3420;
  v2._countAndFlagsBits = 0xD000000000000015;
  String.append(_:)(v2);
  swift_bridgeObjectRetain();
  v6._countAndFlagsBits = OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_11_0(v6);
  swift_bridgeObjectRelease();
  v7._countAndFlagsBits = 0xD000000000000016;
  v7._object = (void *)0x80000001C2EC3440;
  OUTLINED_FUNCTION_11_0(v7);
  swift_bridgeObjectRetain();
  v8._countAndFlagsBits = OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_11_0(v8);
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t static CorrectionsContext.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  char v10;
  uint64_t result;

  v3 = a1[1];
  v4 = a1[2];
  v5 = a1[3];
  v7 = a2[2];
  v6 = a2[3];
  if (!v3
    || (v8 = a2[1]) == 0
    || (*a1 == *a2 ? (v9 = v3 == v8) : (v9 = 0),
        v9 || (v10 = _stringCompareWithSmolCheck(_:_:expecting:)(), result = 0, (v10 & 1) != 0)))
  {
    result = 1;
    if (v5 && v6 && (v4 != v7 || v5 != v6))
      return _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  return result;
}

void sub_1C2EB4E1C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_10_0();
  *v0 = (*(uint64_t (**)(void))(v1 + 112))();
  v0[1] = v2;
  OUTLINED_FUNCTION_0();
}

void sub_1C2EB4E44()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_10_0();
  *v0 = (*(uint64_t (**)(void))(v1 + 136))();
  v0[1] = v2;
  OUTLINED_FUNCTION_0();
}

void sub_1C2EB4E6C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_10_0();
  *v0 = (*(uint64_t (**)(void))(v1 + 160))();
  v0[1] = v2;
  OUTLINED_FUNCTION_0();
}

void sub_1C2EB4E94()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_10_0();
  *v0 = (*(uint64_t (**)(void))(v1 + 184))();
  v0[1] = v2;
  OUTLINED_FUNCTION_0();
}

uint64_t destroy for CorrectionsContext()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for CorrectionsContext(_QWORD *a1, _QWORD *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for CorrectionsContext(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for CorrectionsContext(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

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
  v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CorrectionsContext(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 64))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 8);
      if (v3 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CorrectionsContext(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 64) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for CorrectionsContext()
{
  return &type metadata for CorrectionsContext;
}

uint64_t method lookup function for CorrectionsContext.Builder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.userId.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.userId.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.userId.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.assistantId.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.assistantId.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.assistantId.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.resultCandidateId.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.resultCandidateId.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.resultCandidateId.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.executionRequestId.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.executionRequestId.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.executionRequestId.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.userId(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.assistantId(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.resultCandidateId(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.executionRequestId(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.build()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of CorrectionsContext.Builder.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 248))();
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  return String.init<A>(describing:)();
}

void OUTLINED_FUNCTION_11_0(Swift::String a1)
{
  String.append(_:)(a1);
}

uint64_t OUTLINED_FUNCTION_12()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_14()
{
  return swift_allocObject();
}

uint64_t *CorrectionsSELFHelper.shared.unsafeMutableAddressor()
{
  if (one-time initialization token for shared != -1)
    swift_once();
  return &static CorrectionsSELFHelper.shared;
}

uint64_t one-time initialization function for shared()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for CorrectionsSELFHelper();
  v0 = swift_allocObject();
  UUID.init()();
  result = UUID.init()();
  static CorrectionsSELFHelper.shared = v0;
  return result;
}

uint64_t CorrectionsSELFHelper.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  UUID.init()();
  UUID.init()();
  return v0;
}

uint64_t static CorrectionsSELFHelper.shared.getter()
{
  if (one-time initialization token for shared != -1)
    swift_once();
  return swift_retain();
}

uint64_t CorrectionsSELFHelper.correctionsId.setter(uint64_t a1)
{
  return CorrectionsSELFHelper.correctionsId.setter(a1, &OBJC_IVAR____TtC15SiriCorrections21CorrectionsSELFHelper_correctionsId, "[CorrectionsSELFHelper] SELF logging Corrections ID: %s");
}

void CorrectionsSELFHelper.correctionsId.didset(_QWORD *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  const char *v19;
  uint64_t v20;

  v5 = OUTLINED_FUNCTION_12_0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  OUTLINED_FUNCTION_17();
  v10 = v9 - v8;
  if (one-time initialization token for instrumentation != -1)
    swift_once();
  v11 = OUTLINED_FUNCTION_3();
  __swift_project_value_buffer(v11, (uint64_t)static Logger.instrumentation);
  swift_retain_n();
  v12 = Logger.logObject.getter();
  v13 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v19 = a2;
    v14 = (uint8_t *)OUTLINED_FUNCTION_1_4();
    v20 = OUTLINED_FUNCTION_1_4();
    *(_DWORD *)v14 = 136315138;
    v15 = v2 + *a1;
    OUTLINED_FUNCTION_16();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v10, v15, v5);
    v16 = UUID.uuidString.getter();
    v18 = v17;
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v10, v5);
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v16, v18, &v20);
    OUTLINED_FUNCTION_24();
    OUTLINED_FUNCTION_37();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C2EAE000, v12, v13, v19, v14, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_4();
  }

  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_11_1();
}

uint64_t CorrectionsSELFHelper.executionRequestId.setter(uint64_t a1)
{
  return CorrectionsSELFHelper.correctionsId.setter(a1, &OBJC_IVAR____TtC15SiriCorrections21CorrectionsSELFHelper_executionRequestId, "[CorrectionsSELFHelper] SELF logging Execution Request ID: %s");
}

uint64_t CorrectionsSELFHelper.correctionsId.setter(uint64_t a1, _QWORD *a2, const char *a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = v3 + *a2;
  swift_beginAccess();
  v8 = OUTLINED_FUNCTION_12_0();
  v9 = *(_QWORD *)(v8 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 24))(v7, a1, v8);
  swift_endAccess();
  CorrectionsSELFHelper.correctionsId.didset(a2, a3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
}

uint64_t static CorrectionsSELFHelper.emit(_:)(uint64_t a1)
{
  objc_msgSend(objc_msgSend((id)objc_opt_self(), sel_sharedStream), sel_emitMessage_, a1);
  return swift_unknownObjectRelease();
}

void CorrectionsSELFHelper.emitCheckUndo(undoType:undoReason:context:)(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  _DWORD *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  _OWORD v23[4];

  v5 = *v3;
  v6 = a3[1];
  v23[0] = *a3;
  v23[1] = v6;
  v7 = a3[3];
  v23[2] = a3[2];
  v23[3] = v7;
  v8 = (*(uint64_t (**)(uint64_t, uint64_t, _OWORD *))(v5 + 168))(a1, a2, v23);
  if (v8)
  {
    v9 = (void *)v8;
    if (one-time initialization token for instrumentation != -1)
      swift_once();
    v10 = OUTLINED_FUNCTION_3();
    __swift_project_value_buffer(v10, (uint64_t)static Logger.instrumentation);
    v11 = v9;
    v12 = OUTLINED_FUNCTION_34();
    v13 = static os_log_type_t.debug.getter();
    if (OUTLINED_FUNCTION_20(v13))
    {
      v14 = (_DWORD *)OUTLINED_FUNCTION_1_4();
      *(_QWORD *)&v23[0] = OUTLINED_FUNCTION_1_4();
      *v14 = 136315138;
      v15 = v4;
      v16 = objc_msgSend(v15, sel_description);
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      OUTLINED_FUNCTION_27();

      OUTLINED_FUNCTION_39(v17, v18, (uint64_t *)v23);
      OUTLINED_FUNCTION_24();

      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_2_4(&dword_1C2EAE000, v12, v19, "[CorrectionsSELFHelper] Emitting checkUndo metric %s");
      OUTLINED_FUNCTION_4_1();
      OUTLINED_FUNCTION_0_4();
    }

    OUTLINED_FUNCTION_36();
  }
  else
  {
    if (one-time initialization token for instrumentation != -1)
      swift_once();
    v20 = OUTLINED_FUNCTION_3();
    __swift_project_value_buffer(v20, (uint64_t)static Logger.instrumentation);
    v22 = OUTLINED_FUNCTION_38();
    static os_log_type_t.error.getter();
    if (OUTLINED_FUNCTION_29(v22))
    {
      *(_WORD *)OUTLINED_FUNCTION_1_4() = 0;
      OUTLINED_FUNCTION_18(&dword_1C2EAE000, v22, v21, "[CorrectionsSELFHelper] checkUndo failed to be emitted");
      OUTLINED_FUNCTION_0_4();
    }

  }
}

void CorrectionsSELFHelper.emitSetUndo(correctionsDirectInvocation:context:)(__int128 *a1, _OWORD *a2)
{
  uint64_t *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  _DWORD *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  _OWORD v23[4];
  __int128 v24;
  uint64_t v25;

  v4 = *v2;
  v5 = *((_QWORD *)a1 + 2);
  v24 = *a1;
  v25 = v5;
  v6 = a2[1];
  v23[0] = *a2;
  v23[1] = v6;
  v7 = a2[3];
  v23[2] = a2[2];
  v23[3] = v7;
  v8 = (*(uint64_t (**)(__int128 *, _OWORD *))(v4 + 160))(&v24, v23);
  if (v8)
  {
    v9 = (void *)v8;
    if (one-time initialization token for instrumentation != -1)
      swift_once();
    v10 = OUTLINED_FUNCTION_3();
    __swift_project_value_buffer(v10, (uint64_t)static Logger.instrumentation);
    v11 = v9;
    v12 = OUTLINED_FUNCTION_34();
    v13 = static os_log_type_t.debug.getter();
    if (OUTLINED_FUNCTION_20(v13))
    {
      v14 = (_DWORD *)OUTLINED_FUNCTION_1_4();
      *(_QWORD *)&v23[0] = OUTLINED_FUNCTION_1_4();
      *v14 = 136315138;
      v15 = v3;
      v16 = objc_msgSend(v15, sel_description);
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      OUTLINED_FUNCTION_27();

      *(_QWORD *)&v24 = OUTLINED_FUNCTION_39(v17, v18, (uint64_t *)v23);
      OUTLINED_FUNCTION_24();

      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_2_4(&dword_1C2EAE000, v12, v19, "[CorrectionsSELFHelper] Emitting undoSet metric %s");
      OUTLINED_FUNCTION_4_1();
      OUTLINED_FUNCTION_0_4();
    }

    OUTLINED_FUNCTION_36();
  }
  else
  {
    if (one-time initialization token for instrumentation != -1)
      swift_once();
    v20 = OUTLINED_FUNCTION_3();
    __swift_project_value_buffer(v20, (uint64_t)static Logger.instrumentation);
    v22 = OUTLINED_FUNCTION_38();
    static os_log_type_t.error.getter();
    if (OUTLINED_FUNCTION_29(v22))
    {
      *(_WORD *)OUTLINED_FUNCTION_1_4() = 0;
      OUTLINED_FUNCTION_18(&dword_1C2EAE000, v22, v21, "[CorrectionsSELFHelper] setUndo failed to be emitted");
      OUTLINED_FUNCTION_0_4();
    }

  }
}

void CorrectionsSELFHelper.buildSetUndo(correctionsDirectInvocation:context:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;

  v2 = *a1;
  v1 = a1[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v3 = CorrectionsSELFHelper.makeClientEventWrapper(context:)();
  if (v3)
  {
    v4 = v3;
    closure #1 in CorrectionsSELFHelper.buildSetUndo(correctionsDirectInvocation:context:)(v3, v2, v1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_15_0();
}

void *closure #1 in CorrectionsSELFHelper.buildSetUndo(correctionsDirectInvocation:context:)(void *a1, uint64_t a2, uint64_t a3)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;

  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D9A398]), sel_init);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D9A388]), sel_init);
    if (v8)
    {
      v9 = v8;
      outlined bridged method (mbgnn) of @objc SCSchemaSCSetUndoArgs.directInvocationId.setter(a2, a3, v8);
      objc_msgSend(v7, sel_setSetUndoArgs_, v9);
      objc_msgSend(a1, sel_setUndoSet_, v7);

      v10 = a1;
      return a1;
    }

  }
  if (one-time initialization token for instrumentation != -1)
    swift_once();
  v11 = type metadata accessor for Logger();
  __swift_project_value_buffer(v11, (uint64_t)static Logger.instrumentation);
  v12 = Logger.logObject.getter();
  v13 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1C2EAE000, v12, v13, "[CorrectionsSELFHelper] setUndo failed to be emitted", v14, 2u);
    MEMORY[0x1C3BCBED0](v14, -1, -1);
  }

  return 0;
}

void CorrectionsSELFHelper.buildCheckUndo(undoType:undoReason:context:)(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;

  v4 = CorrectionsSELFHelper.makeClientEventWrapper(context:)();
  if (v4)
  {
    v5 = v4;
    closure #1 in CorrectionsSELFHelper.buildCheckUndo(undoType:undoReason:context:)(v4, a1, a2);

  }
  OUTLINED_FUNCTION_15_0();
}

void *closure #1 in CorrectionsSELFHelper.buildCheckUndo(undoType:undoReason:context:)(void *a1, uint64_t a2, uint64_t a3)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;

  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D9A370]), sel_init);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D9A390]), sel_init);
    if (v8)
    {
      v9 = v8;
      objc_msgSend(v7, sel_setUndoType_, a2);
      objc_msgSend(v7, sel_setReason_, a3);
      objc_msgSend(v9, sel_setCheckUndoResponse_, v7);
      objc_msgSend(a1, sel_setUndoChecked_, v9);

      v10 = a1;
      return a1;
    }

  }
  if (one-time initialization token for instrumentation != -1)
    swift_once();
  v11 = type metadata accessor for Logger();
  __swift_project_value_buffer(v11, (uint64_t)static Logger.instrumentation);
  v12 = Logger.logObject.getter();
  v13 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1C2EAE000, v12, v13, "[CorrectionsSELFHelper] checkUndo failed to be emitted", v14, 2u);
    MEMORY[0x1C3BCBED0](v14, -1, -1);
  }

  return 0;
}

void CorrectionsSELFHelper.makeCorrectionsIdAndEmitRequestLink(executionUUID:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  void (*v37)(uint64_t, char *, uint64_t);
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  _BOOL4 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __CFString *v46;
  __CFString *v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  void (*v53)(uint64_t, uint64_t);
  id v54;
  void *v55;
  char *v56;
  char *v57;
  unint64_t v58;
  id v59;
  uint64_t v60;
  void *v61;
  Class isa;
  id v63;
  void (*v64)(os_log_t, char *, uint64_t);
  NSObject *v65;
  int EnumTagSinglePayload;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  os_log_type_t v71;
  int v72;
  _BOOL4 v73;
  uint64_t v74;
  uint64_t v75;
  __CFString *v76;
  __CFString *v77;
  void (*v78)(uint64_t, uint64_t);
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  os_log_type_t v90;
  _DWORD *v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  os_log_type_t v96;
  _BOOL4 v97;
  void *v98;
  _DWORD *v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void (*v106)(uint64_t, char *, uint64_t);
  id v107;
  id v108;
  void *v109;
  uint64_t v110;
  NSObject *v111;
  os_log_type_t v112;
  _DWORD *v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void (*v119)(uint64_t, char *, uint64_t);
  char *v120;
  uint64_t v121;
  void (*v122)(uint64_t, char *, uint64_t);
  void (*v123)(uint64_t, uint64_t);
  void *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  unint64_t v129;
  char *v130;
  void (*v131)(uint64_t, char *, uint64_t);
  os_log_t v132;
  uint64_t v133;
  char *v134;
  id v135;
  uint64_t v136;
  uint64_t v137;
  char *v138;
  char *v139;
  uint64_t v140;
  uint64_t v141[2];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1E0C80A78](v5, v6);
  OUTLINED_FUNCTION_17();
  v132 = (os_log_t)(v8 - v7);
  v9 = OUTLINED_FUNCTION_12_0();
  MEMORY[0x1E0C80A78](v9, v10);
  v134 = (char *)&v121 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_19();
  MEMORY[0x1E0C80A78](v12, v13);
  OUTLINED_FUNCTION_23();
  v133 = v14;
  OUTLINED_FUNCTION_19();
  MEMORY[0x1E0C80A78](v15, v16);
  OUTLINED_FUNCTION_23();
  v128 = v17;
  OUTLINED_FUNCTION_19();
  MEMORY[0x1E0C80A78](v18, v19);
  OUTLINED_FUNCTION_23();
  v127 = v20;
  OUTLINED_FUNCTION_19();
  MEMORY[0x1E0C80A78](v21, v22);
  OUTLINED_FUNCTION_23();
  v126 = v23;
  OUTLINED_FUNCTION_19();
  v26 = MEMORY[0x1E0C80A78](v24, v25);
  v28 = (char *)&v121 - v27;
  v30 = MEMORY[0x1E0C80A78](v26, v29);
  v32 = (char *)&v121 - v31;
  MEMORY[0x1E0C80A78](v30, v33);
  v35 = (char *)&v121 - v34;
  v138 = v36;
  v37 = (void (*)(uint64_t, char *, uint64_t))*((_QWORD *)v36 + 2);
  OUTLINED_FUNCTION_10_1((uint64_t)&v121 - v34, a1);
  v125 = v2;
  CorrectionsSELFHelper.executionRequestId.setter((uint64_t)v35);
  if (one-time initialization token for instrumentation != -1)
    swift_once();
  v38 = OUTLINED_FUNCTION_3();
  v39 = __swift_project_value_buffer(v38, (uint64_t)static Logger.instrumentation);
  v139 = (char *)a1;
  OUTLINED_FUNCTION_10_1((uint64_t)v32, a1);
  v137 = v39;
  v40 = Logger.logObject.getter();
  v41 = static os_log_type_t.debug.getter();
  v42 = OUTLINED_FUNCTION_29(v40);
  v136 = a2;
  if (v42)
  {
    v43 = OUTLINED_FUNCTION_1_4();
    v130 = v28;
    v44 = v43;
    v45 = OUTLINED_FUNCTION_1_4();
    v131 = v37;
    v141[0] = v45;
    *(_DWORD *)v44 = 136315394;
    v129 = v9;
    v46 = CFSTR("COMPONENTNAME_SIRI_CORRECTIONS");
    v47 = CFSTR("COMPONENTNAME_SIRI_CORRECTIONS");
    v48 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v50 = v49;

    v140 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v48, v50, v141);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v44 + 12) = 2080;
    v51 = OUTLINED_FUNCTION_35();
    v140 = OUTLINED_FUNCTION_3_1(v51, v52);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    OUTLINED_FUNCTION_5_2();
    OUTLINED_FUNCTION_9_2((uint64_t)v32);
    _os_log_impl(&dword_1C2EAE000, v40, v41, "[CorrectionsSELFHelper] Deriving identifier for: %s and execution ID: %s", (uint8_t *)v44, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_4();
  }
  v53 = (void (*)(uint64_t, uint64_t))*((_QWORD *)v138 + 1);
  OUTLINED_FUNCTION_9_2((uint64_t)v32);

  v54 = OUTLINED_FUNCTION_31(objc_allocWithZone(MEMORY[0x1E0D9A488]));
  if (!v54)
    goto LABEL_18;
  v55 = v54;
  v135 = OUTLINED_FUNCTION_31(objc_allocWithZone(MEMORY[0x1E0D9A498]));
  if (!v135)
  {
    v135 = v55;
LABEL_17:
    OUTLINED_FUNCTION_30();
LABEL_18:
    v89 = (uint64_t)v134;
    OUTLINED_FUNCTION_10_1((uint64_t)v134, (uint64_t)v139);
    OUTLINED_FUNCTION_21();
    v90 = OUTLINED_FUNCTION_32();
    if (OUTLINED_FUNCTION_6_2(v90))
    {
      v91 = (_DWORD *)OUTLINED_FUNCTION_1_4();
      v141[0] = OUTLINED_FUNCTION_1_4();
      *v91 = 136315138;
      v92 = UUID.uuidString.getter();
      v94 = OUTLINED_FUNCTION_3_1(v92, v93);
      OUTLINED_FUNCTION_8_2(v94);
      OUTLINED_FUNCTION_26();
      OUTLINED_FUNCTION_5_2();
      v53(v89, v9);
      OUTLINED_FUNCTION_2_4(&dword_1C2EAE000, 0x1F34D2000, v95, "[CorrectionsSELFHelper] Unable to create RequestLink schemas for SELF for execution ID: %s. Will create an unlinked UUID.");
      OUTLINED_FUNCTION_4_1();
      OUTLINED_FUNCTION_0_4();
    }
    OUTLINED_FUNCTION_9_2(v89);

    UUID.init()();
    goto LABEL_21;
  }
  v56 = (char *)OUTLINED_FUNCTION_31(objc_allocWithZone(MEMORY[0x1E0D9A498]));
  if (!v56)
  {

    goto LABEL_17;
  }
  v57 = v56;
  v58 = OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_10_1((uint64_t)v35, (uint64_t)v139);
  v129 = v58;
  v59 = SISchemaUUID.__allocating_init(nsuuid:)((uint64_t)v35);
  OUTLINED_FUNCTION_28(v57, sel_setUuid_);

  if (AFDeviceSupportsSAE())
    v60 = 43;
  else
    v60 = 1;
  objc_msgSend(v57, sel_setComponent_, v60);
  objc_msgSend(v135, sel_setComponent_, 31);
  OUTLINED_FUNCTION_28(v55, sel_setSource_);
  v124 = v55;
  v134 = v57;
  objc_msgSend(v55, sel_setTarget_, v57);
  v61 = (void *)objc_opt_self();
  isa = UUID._bridgeToObjectiveC()().super.isa;
  v63 = objc_msgSend(v61, sel_derivedIdentifierForComponentName_fromSourceIdentifier_, 31, isa);

  if (v63)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    v64 = (void (*)(os_log_t, char *, uint64_t))*((_QWORD *)v138 + 4);
    v65 = v132;
    v64(v132, v35, v9);
    OUTLINED_FUNCTION_22((uint64_t)v65, 0);
    EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v65, 1, v9);
    v67 = v133;
    if (EnumTagSinglePayload != 1)
    {
      v138 = v35;
      v64((os_log_t)v28, (char *)v65, v9);
      v68 = v126;
      OUTLINED_FUNCTION_10_1(v126, (uint64_t)v28);
      v69 = v127;
      v131 = v37;
      v37(v127, v139, v9);
      v70 = OUTLINED_FUNCTION_21();
      v71 = static os_log_type_t.debug.getter();
      v72 = v71;
      v73 = os_log_type_enabled(v70, v71);
      v130 = v28;
      v122 = (void (*)(uint64_t, char *, uint64_t))v64;
      v123 = v53;
      if (v73)
      {
        v74 = OUTLINED_FUNCTION_1_4();
        v139 = (char *)OUTLINED_FUNCTION_1_4();
        v141[0] = (uint64_t)v139;
        *(_DWORD *)v74 = 136315650;
        v132 = v70;
        LODWORD(v133) = v72;
        v75 = v69;
        v76 = CFSTR("COMPONENTNAME_SIRI_CORRECTIONS");
        v77 = CFSTR("COMPONENTNAME_SIRI_CORRECTIONS");
        v78 = v53;
        v79 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v80 = v9;
        v82 = v81;

        v140 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v79, v82, v141);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        *(_WORD *)(v74 + 12) = 2080;
        v83 = UUID.uuidString.getter();
        v85 = OUTLINED_FUNCTION_3_1(v83, v84);
        OUTLINED_FUNCTION_14_0(v85);
        OUTLINED_FUNCTION_5_2();
        v78(v68, v80);
        *(_WORD *)(v74 + 22) = 2080;
        v86 = OUTLINED_FUNCTION_35();
        v88 = OUTLINED_FUNCTION_3_1(v86, v87);
        OUTLINED_FUNCTION_14_0(v88);
        OUTLINED_FUNCTION_5_2();
        v78(v75, v80);
        _os_log_impl(&dword_1C2EAE000, v132, (os_log_type_t)v133, "[CorrectionsSELFHelper] Emitting request link: %s/%s to ORCH:%s", (uint8_t *)v74, 0x20u);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_0_4();
      }
      OUTLINED_FUNCTION_9_2(v68);
      OUTLINED_FUNCTION_9_2(v69);

      v105 = (uint64_t)v138;
      v106 = v131;
      v131((uint64_t)v138, v28, v9);
      v107 = SISchemaUUID.__allocating_init(nsuuid:)(v105);
      OUTLINED_FUNCTION_28(v135, sel_setUuid_);

      v108 = objc_msgSend(v61, sel_sharedStream);
      v109 = v124;
      objc_msgSend(v108, sel_emitMessage_, v124);
      swift_unknownObjectRelease();
      v110 = v128;
      v106(v128, v28, v9);
      v111 = OUTLINED_FUNCTION_21();
      v112 = static os_log_type_t.debug.getter();
      if (OUTLINED_FUNCTION_6_2(v112))
      {
        v113 = (_DWORD *)OUTLINED_FUNCTION_1_4();
        v141[0] = OUTLINED_FUNCTION_1_4();
        *v113 = 136315138;
        lazy protocol witness table accessor for type UUID and conformance UUID();
        v114 = dispatch thunk of CustomStringConvertible.description.getter();
        v116 = OUTLINED_FUNCTION_3_1(v114, v115);
        OUTLINED_FUNCTION_8_2(v116);
        OUTLINED_FUNCTION_26();
        OUTLINED_FUNCTION_5_2();
        v123(v110, v9);
        OUTLINED_FUNCTION_2_4(&dword_1C2EAE000, v111, v117, "[CorrectionsSELFHelper] Emitted request link SELF logging Corrections ID: %s");
        swift_arrayDestroy();
        OUTLINED_FUNCTION_0_4();
      }
      v123(v110, v9);

      v118 = v136;
      v119 = v122;
      v120 = v130;
      v106(v105, v130, v9);
      CorrectionsSELFHelper.correctionsId.setter(v105);

      OUTLINED_FUNCTION_30();
      v119(v118, v120, v9);
      goto LABEL_21;
    }
  }
  else
  {
    v65 = v132;
    OUTLINED_FUNCTION_22((uint64_t)v132, 1);
    v67 = v133;
  }
  outlined destroy of UUID?((uint64_t)v65);
  OUTLINED_FUNCTION_10_1(v67, (uint64_t)v139);
  OUTLINED_FUNCTION_21();
  v96 = OUTLINED_FUNCTION_32();
  v97 = OUTLINED_FUNCTION_6_2(v96);
  v98 = v124;
  if (v97)
  {
    v99 = (_DWORD *)OUTLINED_FUNCTION_1_4();
    v100 = OUTLINED_FUNCTION_1_4();
    v129 = v9;
    v141[0] = v100;
    *v99 = 136315138;
    v101 = OUTLINED_FUNCTION_35();
    v103 = OUTLINED_FUNCTION_3_1(v101, v102);
    OUTLINED_FUNCTION_8_2(v103);
    OUTLINED_FUNCTION_26();
    OUTLINED_FUNCTION_5_2();
    v53(v67, v129);
    OUTLINED_FUNCTION_2_4(&dword_1C2EAE000, v65, v104, "[CorrectionsSELFHelper] Failed to create a derived identifier for SELF for execution ID: %s. Will create a random UUID.");
    OUTLINED_FUNCTION_4_1();
    OUTLINED_FUNCTION_0_4();
  }
  OUTLINED_FUNCTION_9_2(v67);

  UUID.init()();
  OUTLINED_FUNCTION_30();

LABEL_21:
  OUTLINED_FUNCTION_11_1();
}

id SISchemaUUID.__allocating_init(nsuuid:)(uint64_t a1)
{
  id v2;
  Class isa;
  id v4;
  uint64_t v5;

  v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  isa = UUID._bridgeToObjectiveC()().super.isa;
  v4 = objc_msgSend(v2, sel_initWithNSUUID_, isa);

  v5 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  return v4;
}

NSObject *CorrectionsSELFHelper.makeClientEventWrapper(context:)()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  char v11;
  uint64_t v12;
  char **v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  os_log_type_t v19;
  uint8_t *v20;

  v2 = OUTLINED_FUNCTION_12_0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  OUTLINED_FUNCTION_17();
  v7 = v6 - v5;
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D9A378]), sel_init);
  if (v8)
  {
    v0 = v8;
    v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D9A380]), sel_init);
    if (v9)
    {
      v10 = v9;
      v11 = AFDeviceSupportsSAE();
      OUTLINED_FUNCTION_33();
      v12 = v1 + OBJC_IVAR____TtC15SiriCorrections21CorrectionsSELFHelper_executionRequestId;
      if ((v11 & 1) != 0)
        v13 = &selRef_setSubRequestId_;
      else
        v13 = &selRef_setRequestId_;
      OUTLINED_FUNCTION_16();
      v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
      v14(v7, v12, v2);
      v15 = SISchemaUUID.__allocating_init(nsuuid:)(v7);
      objc_msgSend(v10, *v13, v15);

      OUTLINED_FUNCTION_33();
      v16 = v1 + OBJC_IVAR____TtC15SiriCorrections21CorrectionsSELFHelper_correctionsId;
      OUTLINED_FUNCTION_16();
      v14(v7, v16, v2);
      v17 = SISchemaUUID.__allocating_init(nsuuid:)(v7);
      objc_msgSend(v10, sel_setScId_, v17);

      -[NSObject setEventMetadata:](v0, sel_setEventMetadata_, v10);
      return v0;
    }

  }
  if (one-time initialization token for instrumentation != -1)
    swift_once();
  v18 = OUTLINED_FUNCTION_3();
  __swift_project_value_buffer(v18, (uint64_t)static Logger.instrumentation);
  OUTLINED_FUNCTION_38();
  v19 = OUTLINED_FUNCTION_32();
  if (os_log_type_enabled(v0, v19))
  {
    v20 = (uint8_t *)OUTLINED_FUNCTION_1_4();
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_1C2EAE000, v0, v19, "[CorrectionsSELFHelper] Failed to create base SELF objects", v20, 2u);
    OUTLINED_FUNCTION_0_4();
  }

  return 0;
}

void CorrectionsSELFHelper.deinit()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_13(v0);
  OUTLINED_FUNCTION_25(OBJC_IVAR____TtC15SiriCorrections21CorrectionsSELFHelper_executionRequestId);
  OUTLINED_FUNCTION_15_0();
}

uint64_t CorrectionsSELFHelper.__deallocating_deinit()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_13(v0);
  OUTLINED_FUNCTION_25(OBJC_IVAR____TtC15SiriCorrections21CorrectionsSELFHelper_executionRequestId);
  return swift_deallocClassInstance();
}

uint64_t CorrectionsSELFHelper.init()()
{
  uint64_t v0;

  UUID.init()();
  UUID.init()();
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
  result = OUTLINED_FUNCTION_5_2();
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
  _QWORD v12[3];
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
    ObjectType = MEMORY[0x1E0DEC2B8];
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
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)((char *)__src, HIBYTE(a6) & 0xF, __dst);
      UnsafeMutableRawBufferPointer.subscript.setter();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = _StringGuts._allocateForDeconstruct()(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = _StringObject.sharedUTF8.getter();
    if (!v8)
    {
      result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

void *specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
{
  Swift::Int v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = String.UTF8View._foreignCount()();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x1E0DEE9D8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x1E0DEE9D8];
LABEL_6:
  v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = _StringGuts.copyUTF8(into:)();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
LABEL_14:
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
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
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
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
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    specialized UnsafeMutablePointer.moveInitialize(from:count:)(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    specialized UnsafeMutablePointer.initialize(from:count:)(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<ModifiedNode>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  if ((v5 & 1) != 0)
  {
    specialized UnsafeMutablePointer.moveInitialize(from:count:)((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CorrectionCandidateTask>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  if ((v5 & 1) != 0)
  {
    specialized UnsafeMutablePointer.moveInitialize(from:count:)((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<CorrectionOperation>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  if ((v5 & 1) != 0)
  {
    specialized UnsafeMutablePointer.moveInitialize(from:count:)((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

void *specialized UnsafeMutablePointer.initialize(from:count:)(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *specialized UnsafeMutablePointer.moveInitialize(from:count:)(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

_BYTE **closure #1 in OSLogArguments.append(_:)(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

unint64_t type metadata accessor for SISchemaUUID()
{
  unint64_t result;

  result = lazy cache variable for type metadata for SISchemaUUID;
  if (!lazy cache variable for type metadata for SISchemaUUID)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for SISchemaUUID);
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

unint64_t lazy protocol witness table accessor for type UUID and conformance UUID()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type UUID and conformance UUID;
  if (!lazy protocol witness table cache variable for type UUID and conformance UUID)
  {
    v1 = type metadata accessor for UUID();
    result = MEMORY[0x1C3BCBE28](MEMORY[0x1E0CB09F0], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID);
  }
  return result;
}

uint64_t ObjC metadata update function for CorrectionsSELFHelper()
{
  return type metadata accessor for CorrectionsSELFHelper();
}

uint64_t type metadata accessor for CorrectionsSELFHelper()
{
  uint64_t result;

  result = type metadata singleton initialization cache for CorrectionsSELFHelper;
  if (!type metadata singleton initialization cache for CorrectionsSELFHelper)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t type metadata completion function for CorrectionsSELFHelper()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for UUID();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for CorrectionsSELFHelper()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CorrectionsSELFHelper.emitCheckUndo(undoType:undoReason:context:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of CorrectionsSELFHelper.emitSetUndo(correctionsDirectInvocation:context:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of CorrectionsSELFHelper.buildSetUndo(correctionsDirectInvocation:context:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of CorrectionsSELFHelper.buildCheckUndo(undoType:undoReason:context:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of CorrectionsSELFHelper.makeCorrectionsIdAndEmitRequestLink(executionUUID:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of CorrectionsSELFHelper.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 200))();
}

void outlined bridged method (mbgnn) of @objc SCSchemaSCSetUndoArgs.directInvocationId.setter(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)MEMORY[0x1C3BCB8D0]();
  objc_msgSend(a3, sel_setDirectInvocationId_, v4);

}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void OUTLINED_FUNCTION_0_4()
{
  JUMPOUT(0x1C3BCBED0);
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_2_4(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  uint8_t *v4;
  os_log_type_t v5;

  _os_log_impl(a1, a2, v5, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_3_1(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, (uint64_t *)(v2 - 96));
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_5_2()
{
  return swift_bridgeObjectRelease();
}

BOOL OUTLINED_FUNCTION_6_2(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_8_2(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 104) = a1;
  return v1 - 104;
}

uint64_t OUTLINED_FUNCTION_9_2(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_10_1(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return type metadata accessor for UUID();
}

uint64_t OUTLINED_FUNCTION_13(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_14_0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 104) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_16()
{
  return swift_beginAccess();
}

void OUTLINED_FUNCTION_18(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  os_log_type_t v4;
  uint8_t *v5;

  _os_log_impl(a1, a2, v4, a4, v5, 2u);
}

BOOL OUTLINED_FUNCTION_20(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_21()
{
  return Logger.logObject.getter();
}

uint64_t OUTLINED_FUNCTION_22(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_24()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_25@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t);

  return v3(v1 + a1, v2);
}

uint64_t OUTLINED_FUNCTION_26()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

void OUTLINED_FUNCTION_27()
{
  void *v0;

}

id OUTLINED_FUNCTION_28(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

BOOL OUTLINED_FUNCTION_29(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

void OUTLINED_FUNCTION_30()
{
  uint64_t v0;

}

id OUTLINED_FUNCTION_31(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, (SEL)(v1 + 3528));
}

uint64_t OUTLINED_FUNCTION_32()
{
  return static os_log_type_t.error.getter();
}

unint64_t OUTLINED_FUNCTION_33()
{
  return type metadata accessor for SISchemaUUID();
}

uint64_t OUTLINED_FUNCTION_34()
{
  return Logger.logObject.getter();
}

uint64_t OUTLINED_FUNCTION_35()
{
  return UUID.uuidString.getter();
}

uint64_t OUTLINED_FUNCTION_36()
{
  uint64_t v0;

  return static CorrectionsSELFHelper.emit(_:)(v0);
}

uint64_t OUTLINED_FUNCTION_37()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_38()
{
  return Logger.logObject.getter();
}

uint64_t OUTLINED_FUNCTION_39(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;
  uint64_t v4;

  return getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v4, v3, a3);
}

BOOL specialized == infix<A>(_:_:)(int a1, int a2)
{
  return a1 == a2;
}

void specialized == infix<A>(_:_:)(char a1, char a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = a2 & 1;
  v3 = Logger.Category.rawValue.getter(a1 & 1);
  v5 = v4;
  if (v3 != Logger.Category.rawValue.getter(v2) || v5 != v6)
    OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_15_0();
}

void one-time initialization function for correctIntoString()
{
  static CorrectionsConstants.correctIntoString = 0x5474636572726F63;
  *(_QWORD *)algn_1EF7D0978 = 0xE90000000000006FLL;
}

void one-time initialization function for updateVerbString()
{
  static CorrectionsConstants.updateVerbString = 0x657461647075;
  *(_QWORD *)algn_1EF7D0988 = 0xE600000000000000;
}

uint64_t one-time initialization function for attributeDenyList()
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  result = swift_allocObject();
  *(_OWORD *)(result + 16) = xmmword_1C2EC3190;
  strcpy((char *)(result + 32), "usoQuantifier");
  *(_WORD *)(result + 46) = -4864;
  *(_QWORD *)(result + 48) = 0xD000000000000010;
  *(_QWORD *)(result + 56) = 0x80000001C2EC3990;
  static CorrectionsConstants.attributeDenyList = (_UNKNOWN *)result;
  return result;
}

uint64_t one-time initialization function for operatorStrings()
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  result = swift_allocObject();
  *(_OWORD *)(result + 16) = xmmword_1C2EC31A0;
  *(_QWORD *)(result + 32) = 0x7465536F54646461;
  *(_QWORD *)(result + 40) = 0xE800000000000000;
  *(_QWORD *)(result + 48) = 0x6C61566F54646461;
  *(_QWORD *)(result + 56) = 0xEA00000000006575;
  *(_QWORD *)(result + 64) = 0x6E6769737361;
  *(_QWORD *)(result + 72) = 0xE600000000000000;
  strcpy((char *)(result + 80), "removeFromSet");
  *(_WORD *)(result + 94) = -4864;
  *(_QWORD *)(result + 96) = 0x724665766F6D6572;
  *(_QWORD *)(result + 104) = 0xEF65756C61566D6FLL;
  *(_QWORD *)(result + 112) = 0x6563616C706572;
  *(_QWORD *)(result + 120) = 0xE700000000000000;
  *(_QWORD *)(result + 128) = 0x646E65707061;
  *(_QWORD *)(result + 136) = 0xE600000000000000;
  *(_QWORD *)(result + 144) = 0x6574656C6564;
  *(_QWORD *)(result + 152) = 0xE600000000000000;
  static CorrectionsConstants.operatorStrings = (_UNKNOWN *)result;
  return result;
}

double one-time initialization function for deleteVerbStrings()
{
  uint64_t v0;
  double result;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  v0 = swift_allocObject();
  *(_QWORD *)&result = 3;
  *(_OWORD *)(v0 + 16) = xmmword_1C2EC31B0;
  *(_QWORD *)(v0 + 32) = 0x6574656C6564;
  *(_QWORD *)(v0 + 40) = 0xE600000000000000;
  *(_QWORD *)(v0 + 48) = 1886352499;
  *(_QWORD *)(v0 + 56) = 0xE400000000000000;
  *(_QWORD *)(v0 + 64) = 0x656C6261736964;
  *(_QWORD *)(v0 + 72) = 0xE700000000000000;
  static CorrectionsConstants.deleteVerbStrings = v0;
  return result;
}

void *one-time initialization function for rrUtils()
{
  void *result;

  type metadata accessor for ReferenceResolutionUtils();
  result = (void *)swift_allocObject();
  static CorrectionsEngine.rrUtils = result;
  return result;
}

void one-time initialization function for inverseDirectInvocation()
{
  static CorrectionsEngine.inverseDirectInvocation = 0;
  qword_1ED799830 = 0;
  qword_1ED799838 = 0;
}

uint64_t *CorrectionsEngine.inverseDirectInvocation.unsafeMutableAddressor()
{
  if (one-time initialization token for inverseDirectInvocation != -1)
    swift_once();
  return &static CorrectionsEngine.inverseDirectInvocation;
}

void static CorrectionsEngine.inverseDirectInvocation.getter(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (one-time initialization token for inverseDirectInvocation != -1)
    swift_once();
  OUTLINED_FUNCTION_16();
  v2 = static CorrectionsEngine.inverseDirectInvocation;
  v3 = qword_1ED799830;
  v4 = qword_1ED799838;
  *a1 = static CorrectionsEngine.inverseDirectInvocation;
  a1[1] = v3;
  a1[2] = v4;
  outlined copy of CorrectionsDirectInvocation?(v2, v3);
  OUTLINED_FUNCTION_97();
}

uint64_t outlined copy of CorrectionsDirectInvocation?(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t one-time initialization function for parseStoredTime()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?);
  __swift_allocate_value_buffer(v0, static CorrectionsEngine.parseStoredTime);
  v1 = __swift_project_value_buffer(v0, (uint64_t)static CorrectionsEngine.parseStoredTime);
  v2 = type metadata accessor for Date();
  return __swift_storeEnumTagSinglePayload(v1, 1, 1, v2);
}

double one-time initialization function for context()
{
  _OWORD *v0;
  double result;

  v0 = (_OWORD *)swift_slowAlloc();
  static CorrectionsEngine.context = (uint64_t)v0;
  result = 0.0;
  *v0 = xmmword_1C2EC31C0;
  v0[1] = 0u;
  v0[2] = 0u;
  v0[3] = 0u;
  return result;
}

uint64_t CorrectionsEngine.context.unsafeMutableAddressor()
{
  if (one-time initialization token for context != -1)
    swift_once();
  return static CorrectionsEngine.context;
}

void static CorrectionsEngine.context.getter(uint64_t *a1@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (one-time initialization token for context != -1)
    swift_once();
  v2 = (uint64_t *)static CorrectionsEngine.context;
  OUTLINED_FUNCTION_16();
  v3 = *v2;
  v4 = v2[1];
  v5 = v2[2];
  v6 = v2[3];
  v7 = v2[4];
  v8 = v2[5];
  v9 = v2[6];
  v10 = v2[7];
  *a1 = *v2;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
  a1[6] = v9;
  a1[7] = v10;
  outlined copy of CorrectionsContext?(v3, v4);
  OUTLINED_FUNCTION_97();
}

uint64_t outlined copy of CorrectionsContext?(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 != 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t CorrectionsEngine.undoFollowUpPluginActionUserDataKey.getter()
{
  OUTLINED_FUNCTION_11();
  return OUTLINED_FUNCTION_6_1();
}

uint64_t static CorrectionsEngine.setReferenceResolver(to:)(void *a1)
{
  if (one-time initialization token for rrUtils != -1)
    swift_once();
  static CorrectionsEngine.rrUtils = a1;
  swift_retain();
  return swift_release();
}

uint64_t static CorrectionsEngine.shared()()
{
  type metadata accessor for CorrectionsEngine();
  return swift_initStaticObject();
}

uint64_t type metadata accessor for CorrectionsEngine()
{
  return objc_opt_self();
}

void CorrectionsEngine.checkCorrection(input:)(uint64_t a1)
{
  uint64_t v1;
  _OWORD v2[2];
  uint64_t v3;

  v3 = 0;
  memset(v2, 0, sizeof(v2));
  (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)v1 + 112))(a1, v2);
  outlined destroy of CorrectionsCustomizing?((uint64_t)v2, &demangling cache variable for type metadata for CorrectionsCustomizing?);
  OUTLINED_FUNCTION_97();
}

void CorrectionsEngine.checkCorrection(input:customizations:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  unint64_t v20;
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
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
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
  unint64_t v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  int64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  char v71;
  void (*v72)(uint64_t, uint64_t);
  char v73;
  char v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  BOOL v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD *v85;
  uint64_t v86;
  unint64_t v87;
  int64_t *v88;
  unint64_t v89;
  int v90;
  unint64_t v91;
  unint64_t *v92;
  void *v93;
  uint64_t v94;
  Swift::String v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  BOOL v101;
  unint64_t v102;
  char v103;
  int64_t v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t v108;
  BOOL v109;
  char v113;
  BOOL v114;
  BOOL v115;
  char v116;
  BOOL v117;
  BOOL v118;
  uint64_t v119;
  char v121;
  uint64_t v122;
  unint64_t v123;
  unint64_t v124;
  uint64_t v125;
  unint64_t v126;
  BOOL v127;
  uint64_t v128;
  unint64_t v129;
  unint64_t v130;
  int64_t v131;
  uint64_t v132;
  uint64_t v133;
  unint64_t v134;
  BOOL v135;
  uint64_t v136;
  uint64_t v137;
  unint64_t v138;
  unint64_t v139;
  unint64_t v140;
  uint64_t v141;
  char *v142;
  unint64_t v143;
  unint64_t v144;
  uint64_t v145;
  uint64_t v146;
  char v148;
  ValueMetadata *v149;
  uint8_t *v150;
  unsigned __int8 v151;
  ValueMetadata *v152;
  os_log_type_t v153;
  uint64_t v154;
  os_log_type_t v155;
  _WORD *v156;
  uint64_t v157;
  unint64_t v158;
  unint64_t v159;
  unint64_t v160;
  uint64_t v161;
  uint64_t v162;
  os_log_type_t v163;
  _WORD *v164;
  uint64_t v165;
  uint64_t v166;
  _OWORD *v167;
  uint64_t v168;
  os_log_type_t v169;
  _WORD *v170;
  uint64_t v171;
  uint64_t v172;
  id v173;
  uint64_t (*v174)(uint64_t, _QWORD);
  uint64_t v175[4];
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  unint64_t *v179;
  int64_t v180;
  unint64_t v181;
  int v182;
  unint64_t v183;
  int64_t v184;
  unint64_t v185;
  unint64_t v186;
  unint64_t v187;
  uint64_t v188;
  unint64_t v189;
  uint64_t v190;
  __int128 v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  int64_t v196;
  uint64_t v197;
  unint64_t v198;
  unint64_t v199;
  char *v200;
  _QWORD *v201;
  __int128 v202;
  uint64_t v203;
  unint64_t v204;
  char v205;
  _QWORD v206[2];
  uint64_t v207;
  ValueMetadata *v208;
  uint8_t *v209;
  uint64_t v210;
  uint64_t v211;

  OUTLINED_FUNCTION_62();
  a19 = v21;
  a20 = v22;
  v24 = v23;
  v176 = v25;
  v26 = type metadata accessor for Siri_Nlu_External_UsoGraph();
  OUTLINED_FUNCTION_36_0(v26, (uint64_t)&a15);
  v192 = v27;
  OUTLINED_FUNCTION_8_3();
  MEMORY[0x1E0C80A78](v28, v29);
  OUTLINED_FUNCTION_17();
  v32 = v31 - v30;
  v33 = type metadata accessor for Siri_Nlu_External_UserStatedTask();
  OUTLINED_FUNCTION_36_0(v33, (uint64_t)&a13);
  *(_QWORD *)&v191 = v34;
  OUTLINED_FUNCTION_8_3();
  MEMORY[0x1E0C80A78](v35, v36);
  OUTLINED_FUNCTION_11_2();
  v38 = OUTLINED_FUNCTION_58(v37);
  v39 = *(_QWORD *)(v38 - 8);
  MEMORY[0x1E0C80A78](v38, v40);
  OUTLINED_FUNCTION_54();
  v43 = MEMORY[0x1E0C80A78](v41, v42);
  v45 = (unint64_t)v175 - v44;
  v47 = MEMORY[0x1E0C80A78](v43, v46);
  OUTLINED_FUNCTION_74(v47, v48, v49, v50, v51, v52, v53, v54, v175[0]);
  v55 = type metadata accessor for OSSignpostID();
  OUTLINED_FUNCTION_36_0(v55, (uint64_t)&v201);
  v175[2] = v56;
  OUTLINED_FUNCTION_8_3();
  MEMORY[0x1E0C80A78](v57, v58);
  OUTLINED_FUNCTION_17();
  v61 = v60 - v59;
  if (one-time initialization token for log != -1)
    goto LABEL_282;
  while (1)
  {
    v62 = (id)static Logger.log;
    OSSignpostID.init(log:)();
    static os_signpost_type_t.begin.getter();
    OUTLINED_FUNCTION_51();

    v210 = MEMORY[0x1E0DEE9D8];
    outlined init with copy of CorrectionsCustomizing?(v24, (uint64_t)&v202, &demangling cache variable for type metadata for CorrectionsCustomizing?);
    if (v204)
    {
      v63 = outlined init with take of CorrectionsCustomizing(&v202, (uint64_t)v206);
    }
    else
    {
      v208 = &type metadata for CorrectionsCustomizationsAllowingAllEntities;
      v209 = (uint8_t *)&protocol witness table for CorrectionsCustomizationsAllowingAllEntities;
      v206[0] = MEMORY[0x1E0DEE9E8];
      v206[1] = MEMORY[0x1E0DEE9E8];
      outlined destroy of CorrectionsCustomizing?((uint64_t)&v202, &demangling cache variable for type metadata for CorrectionsCustomizing?);
    }
    v64 = MEMORY[0x1C3BCB618](v63);
    v65 = *(_QWORD *)(v64 + 16);
    v24 = 0x1ED799000;
    v189 = v61;
    v196 = v65;
    if (v65)
    {
      v187 = v45;
      v183 = v20;
      v24 = 0;
      v45 = 0;
      v188 = 0;
      v195 = v64 + ((*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80));
      v66 = v197;
      v186 = v32;
      v185 = v38;
      v184 = v39;
      v194 = v64;
      while (1)
      {
        if (v45 >= *(_QWORD *)(v64 + 16))
          goto LABEL_279;
        v20 = *(_QWORD *)(v39 + 16);
        ((void (*)(uint64_t, unint64_t, uint64_t))v20)(v66, v195 + *(_QWORD *)(v39 + 72) * v45, v38);
        if ((Siri_Nlu_External_UserDialogAct.hasUserStatedTask.getter() & 1) == 0)
        {
          v71 = Siri_Nlu_External_UserDialogAct.hasRejected.getter();
          OUTLINED_FUNCTION_47((uint64_t)&v211);
          if ((v71 & 1) != 0)
          {
            v72 = *(void (**)(uint64_t, uint64_t))(v39 + 8);
            OUTLINED_FUNCTION_46();
          }
          else
          {
            v73 = Siri_Nlu_External_UserDialogAct.hasCancelled.getter();
            v72 = *(void (**)(uint64_t, uint64_t))(v39 + 8);
            OUTLINED_FUNCTION_46();
            if ((v73 & 1) == 0)
            {
              v74 = Siri_Nlu_External_UserDialogAct.hasAccepted.getter();
              OUTLINED_FUNCTION_47((uint64_t)&v207);
              if ((v74 & 1) == 0)
                Siri_Nlu_External_UserDialogAct.hasWantedToProceed.getter();
              OUTLINED_FUNCTION_46();
              v61 = v189;
            }
          }
          goto LABEL_39;
        }
        v67 = v190;
        Siri_Nlu_External_UserDialogAct.userStatedTask.getter();
        Siri_Nlu_External_UserStatedTask.task.getter();
        OUTLINED_FUNCTION_20_0(v67, *(uint64_t (**)(uint64_t, _QWORD))(v191 + 8));
        v68 = v188;
        v69 = static UsoGraphProtoReader.fromSwiftProtobuf(protobufGraph:vocabManager:)();
        if (v68)
        {
LABEL_284:
          OUTLINED_FUNCTION_20_0(v32, *(uint64_t (**)(uint64_t, _QWORD))(v192 + 8));
          swift_unexpectedError();
          __break(1u);
          return;
        }
        v38 = v69;
        OUTLINED_FUNCTION_20_0(v32, *(uint64_t (**)(uint64_t, _QWORD))(v192 + 8));
        v70 = MEMORY[0x1C3BCB720](v38);
        v39 = v70;
        v188 = 0;
        if ((v24 & 1) == 0)
          break;
        v24 = 1;
LABEL_38:
        type metadata accessor for CorrectionsEngine();
        v80 = static CorrectionsEngine.searchTasks(tasks:customizations:)(v39, v206);
        OUTLINED_FUNCTION_107();
        specialized Array.append<A>(contentsOf:)((uint64_t)v80);
        swift_release();
        v39 = v184;
        v72 = *(void (**)(uint64_t, uint64_t))(v184 + 8);
        v61 = v189;
        v32 = v186;
        v38 = v185;
LABEL_39:
        ++v45;
        v66 = v197;
        v72(v197, v38);
        OUTLINED_FUNCTION_99();
        v64 = v194;
        if (v45 == v81)
        {
          swift_bridgeObjectRelease();
          v82 = v210;
          v83 = *(_QWORD *)(v210 + 16);
          v179 = (unint64_t *)(v210 + 16);
          v177 = v83;
          v84 = MEMORY[0x1E0DEE9D8];
          if (v83)
            goto LABEL_45;
          if ((v24 & 1) == 0)
          {
            v24 = 0x1ED799000uLL;
            goto LABEL_253;
          }
          v201 = (_QWORD *)MEMORY[0x1E0DEE9D8];
          v85 = (_QWORD *)MEMORY[0x1E0DEE9D8];
LABEL_265:
          swift_bridgeObjectRelease();
          if (v85[2] >= 2uLL)
          {
            if (one-time initialization token for logger != -1)
              swift_once();
            v168 = OUTLINED_FUNCTION_3();
            OUTLINED_FUNCTION_5_3(v168, (uint64_t)static Logger.logger);
            v169 = OUTLINED_FUNCTION_14_1();
            if (OUTLINED_FUNCTION_2_5(v169))
            {
              v170 = (_WORD *)OUTLINED_FUNCTION_3_2();
              OUTLINED_FUNCTION_16_0(v170);
              OUTLINED_FUNCTION_1_5(&dword_1C2EAE000, v171, v172, "[CorrectionsEngine.checkCorrection] found more than one correction candidate.");
              OUTLINED_FUNCTION_0_4();
            }

          }
          v24 = (uint64_t)v201;
          specialized Collection.first.getter((uint64_t)v201, v176);
          OUTLINED_FUNCTION_10();
          goto LABEL_272;
        }
      }
      if (v70 >> 62)
      {
        OUTLINED_FUNCTION_106();
        v20 = _CocoaArrayWrapper.endIndex.getter();
        if (v20)
        {
LABEL_20:
          v61 = 4;
          while (1)
          {
            v24 = v61 - 4;
            if ((v39 & 0xC000000000000001) != 0)
            {
              v32 = MEMORY[0x1C3BCBA14](v61 - 4, v39);
            }
            else
            {
              v32 = *(_QWORD *)(v39 + 8 * v61);
              swift_retain();
            }
            v75 = v61 - 3;
            if (__OFADD__(v24, 1))
              goto LABEL_275;
            v76 = UsoTask.verbString.getter();
            v78 = v77;
            if (one-time initialization token for updateVerbString != -1)
              swift_once();
            v79 = v76 == static CorrectionsConstants.updateVerbString && v78 == *(_QWORD *)algn_1EF7D0988;
            if (v79)
              break;
            OUTLINED_FUNCTION_6_1();
            v24 = OUTLINED_FUNCTION_13_0();
            swift_release();
            OUTLINED_FUNCTION_5_2();
            if ((v24 & 1) == 0)
            {
              ++v61;
              if (v75 != v20)
                continue;
            }
            goto LABEL_37;
          }
          OUTLINED_FUNCTION_107();
          swift_release();
          v24 = 1;
          goto LABEL_37;
        }
      }
      else
      {
        v20 = *(_QWORD *)((v70 & 0xFFFFFFFFFFFFF8) + 0x10);
        OUTLINED_FUNCTION_106();
        if (v20)
          goto LABEL_20;
      }
      v24 = 0;
LABEL_37:
      OUTLINED_FUNCTION_5_2();
      goto LABEL_38;
    }
    swift_bridgeObjectRelease();
    v84 = MEMORY[0x1E0DEE9D8];
    v86 = *(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16);
    v179 = (unint64_t *)(MEMORY[0x1E0DEE9D8] + 16);
    v177 = v86;
    if (!v86)
      break;
    v188 = 0;
    v82 = MEMORY[0x1E0DEE9D8];
LABEL_45:
    v32 = 0xEF65756C61566D6FLL;
    v201 = (_QWORD *)v84;
    v178 = v82 + 32;
    v175[1] = v82;
    swift_bridgeObjectRetain();
    v87 = 0;
    while (1)
    {
      if (v87 >= *v179)
        goto LABEL_281;
      v181 = v87;
      v88 = (int64_t *)(v178 + 32 * v87);
      v39 = *v88;
      v180 = v88[1];
      v24 = v88[2];
      v45 = v88[3];
      v200 = (char *)MEMORY[0x1E0DEE9D8];
      v89 = *(_QWORD *)(v45 + 16);
      v183 = v24;
      v187 = v89;
      if (v89)
        break;
      swift_bridgeObjectRetain();
      swift_retain();
      OUTLINED_FUNCTION_17_0();
      v182 = 0;
LABEL_228:
      if (one-time initialization token for updateVerbString != -1)
        swift_once();
      if (v180 == static CorrectionsConstants.updateVerbString && v183 == *(_QWORD *)algn_1EF7D0988)
      {
        v24 = (uint64_t)v200;
LABEL_237:
        if (!((*(_QWORD *)(v24 + 16) != 0) | v182 & 1))
        {
          v149 = v208;
          v150 = v209;
          v151 = __swift_project_boxed_opaque_existential_1(v206, (uint64_t)v208);
          v152 = v149;
          v153 = v151;
          if ((CorrectionsCustomizing.shouldCheckEntityForCorrections(entity:)(v39, v152, v150) & 1) != 0)
          {
            if (one-time initialization token for logger != -1)
              swift_once();
            v154 = OUTLINED_FUNCTION_3();
            OUTLINED_FUNCTION_5_3(v154, (uint64_t)static Logger.logger);
            v155 = OUTLINED_FUNCTION_14_1();
            if (OUTLINED_FUNCTION_2_5(v155))
            {
              v156 = (_WORD *)OUTLINED_FUNCTION_3_2();
              OUTLINED_FUNCTION_16_0(v156);
              OUTLINED_FUNCTION_10_2(&dword_1C2EAE000, v24, v153, "[CorrectionsEngine.checkCorrection] returning underspecified correction type due to UPDATE verb.", v150);
              OUTLINED_FUNCTION_0_4();
            }

            type metadata accessor for CorrectionsEngine();
            v157 = static CorrectionsEngine.getCorrectedEntitiesFromSRR(correctionCandidateTaskEntity:attributePath:)(v39, 0, 0xE000000000000000);
            if ((OUTLINED_FUNCTION_84() & 1) == 0)
              v24 = (uint64_t)OUTLINED_FUNCTION_33_0(0, *(_QWORD *)(v24 + 16) + 1);
            v20 = *(_QWORD *)(v24 + 16);
            v158 = *(_QWORD *)(v24 + 24);
            if (v20 >= v158 >> 1)
              v24 = (uint64_t)OUTLINED_FUNCTION_33_0((char *)(v158 > 1), v20 + 1);
            *(_QWORD *)(v24 + 16) = v20 + 1;
            v159 = v24 + 40 * v20;
            *(_QWORD *)(v159 + 32) = 0;
            *(_QWORD *)(v159 + 40) = 0xE000000000000000;
            *(_QWORD *)(v159 + 48) = v157;
            *(_QWORD *)(v159 + 56) = 0;
            *(_BYTE *)(v159 + 64) = 3;
            v200 = (char *)v24;
          }
        }
        goto LABEL_248;
      }
      v148 = OUTLINED_FUNCTION_13_0();
      v24 = (uint64_t)v200;
      if ((v148 & 1) != 0)
        goto LABEL_237;
LABEL_248:
      v160 = v181 + 1;
      v161 = OUTLINED_FUNCTION_17_0();
      specialized Array.append<A>(contentsOf:)(v161);
      OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_89();
      OUTLINED_FUNCTION_76();
      swift_release();
      v87 = v160;
      if (v160 == v177)
      {
LABEL_264:
        OUTLINED_FUNCTION_76();
        v85 = v201;
        goto LABEL_265;
      }
    }
    v186 = v45 + 32;
    swift_bridgeObjectRetain_n();
    swift_retain();
    OUTLINED_FUNCTION_17_0();
    v90 = 0;
    v91 = 0;
    v184 = v39;
    v185 = v45;
    while (1)
    {
      v182 = v90;
LABEL_50:
      if (v91 >= *(_QWORD *)(v45 + 16))
        goto LABEL_280;
      v92 = (unint64_t *)(v186 + 24 * v91);
      v20 = *v92;
      v93 = (void *)v92[1];
      v94 = v92[2];
      v190 = v91 + 1;
      v24 = (uint64_t)v208;
      __swift_project_boxed_opaque_existential_1(v206, (uint64_t)v208);
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_25_0();
      *(_QWORD *)&v191 = v20;
      v95._countAndFlagsBits = v20;
      *((_QWORD *)&v191 + 1) = v93;
      v95._object = v93;
      if (CorrectionsCustomizing.shouldAllowAttributeToBeCorrected(attribute:)(v95))
        break;
      OUTLINED_FUNCTION_19_0();
      OUTLINED_FUNCTION_76();
      v90 = 1;
      v91 = v190;
      v45 = v185;
      if (v190 == v187)
      {
        OUTLINED_FUNCTION_89();
        v182 = 1;
        goto LABEL_228;
      }
    }
    v198 = MEMORY[0x1E0DEE9D8];
    v199 = MEMORY[0x1E0DEE9D8];
    v96 = *(_QWORD *)(v94 + 64);
    v195 = v94 + 64;
    v97 = 1 << *(_BYTE *)(v94 + 32);
    if (v97 < 64)
      v98 = ~(-1 << v97);
    else
      v98 = -1;
    v24 = v98 & v96;
    v196 = (unint64_t)(v97 + 63) >> 6;
    OUTLINED_FUNCTION_25_0();
    LODWORD(v192) = 0;
    LODWORD(v194) = 0;
    v99 = 0;
    v39 = 0;
    v45 = 0xED00007465536D6FLL;
    v61 = 0xEA00000000006575;
    while (1)
    {
LABEL_56:
      if (v24)
      {
        v197 = (v24 - 1) & v24;
        v100 = __clz(__rbit64(v24)) | (v39 << 6);
      }
      else
      {
        v101 = __OFADD__(v39++, 1);
        if (v101)
        {
          __break(1u);
          goto LABEL_253;
        }
        if (v39 >= v196)
        {
LABEL_203:
          swift_release();
          v61 = v189;
          v39 = v184;
          v24 = v199;
          v45 = v185;
          if (v199 >> 62)
          {
            OUTLINED_FUNCTION_17_0();
            v146 = OUTLINED_FUNCTION_103();
            OUTLINED_FUNCTION_10();
            if (!v146)
            {
LABEL_205:
              OUTLINED_FUNCTION_10();
              type metadata accessor for CorrectionsEngine();
              v24 = static CorrectionsEngine.getCorrectedEntitiesFromSRR(correctionCandidateTaskEntity:attributePath:)(v39, v191, *((unint64_t *)&v191 + 1));
              v199 = v24;
            }
          }
          else if (!*(_QWORD *)((v199 & 0xFFFFFFFFFFFFF8) + 0x10))
          {
            goto LABEL_205;
          }
          if (((v99 & v194 | v192) & 1) != 0)
          {
            v138 = v198;
            OUTLINED_FUNCTION_19_0();
            v202 = v191;
            v203 = v24;
            v204 = v138;
            v205 = 2;
            specialized Array.replaceSubrange<A>(_:with:)(0, 0, (uint64_t)&v202);
          }
          else if ((v99 & 1) != 0)
          {
            OUTLINED_FUNCTION_10();
            v139 = v198;
            OUTLINED_FUNCTION_19_0();
            if ((OUTLINED_FUNCTION_84() & 1) == 0)
              v24 = (uint64_t)OUTLINED_FUNCTION_33_0(0, *(_QWORD *)(v24 + 16) + 1);
            v20 = *(_QWORD *)(v24 + 16);
            v140 = *(_QWORD *)(v24 + 24);
            if (v20 >= v140 >> 1)
              v24 = (uint64_t)OUTLINED_FUNCTION_33_0((char *)(v140 > 1), v20 + 1);
            *(_QWORD *)(v24 + 16) = v20 + 1;
            OUTLINED_FUNCTION_78(v24 + 40 * v20);
            *(_QWORD *)(v141 + 48) = v139;
            *(_QWORD *)(v141 + 56) = 0;
            *(_BYTE *)(v141 + 64) = 0;
            v200 = (char *)v24;
          }
          else
          {
            swift_bridgeObjectRelease();
            OUTLINED_FUNCTION_19_0();
            if ((v194 & 1) != 0)
            {
              v142 = v200;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v142 = OUTLINED_FUNCTION_110(0, *((_QWORD *)v142 + 2) + 1);
              v144 = *((_QWORD *)v142 + 2);
              v143 = *((_QWORD *)v142 + 3);
              v38 = v144 + 1;
              if (v144 >= v143 >> 1)
                v142 = OUTLINED_FUNCTION_110((char *)(v143 > 1), v144 + 1);
              *((_QWORD *)v142 + 2) = v38;
              OUTLINED_FUNCTION_78((uint64_t)&v142[40 * v144]);
              *(_QWORD *)(v145 + 48) = v24;
              *(_QWORD *)(v145 + 56) = 0;
              *(_BYTE *)(v145 + 64) = 1;
              v200 = v142;
            }
            else
            {
              OUTLINED_FUNCTION_76();
              OUTLINED_FUNCTION_10();
            }
          }
          v91 = v190;
          if (v190 == v187)
          {
            OUTLINED_FUNCTION_89();
            goto LABEL_228;
          }
          goto LABEL_50;
        }
        v102 = *(_QWORD *)(v195 + 8 * v39);
        if (!v102)
        {
          OUTLINED_FUNCTION_70();
          if (v103 == v101)
            goto LABEL_203;
          OUTLINED_FUNCTION_71();
          if (!v102)
          {
            OUTLINED_FUNCTION_70();
            if (v103 == v101)
              goto LABEL_203;
            OUTLINED_FUNCTION_71();
            if (!v102)
            {
              OUTLINED_FUNCTION_70();
              if (v103 == v101)
                goto LABEL_203;
              OUTLINED_FUNCTION_71();
              if (!v102)
              {
                while (1)
                {
                  v39 = v104 + 1;
                  if (__OFADD__(v104, 1))
                    break;
                  if (v39 >= v196)
                    goto LABEL_203;
                  v102 = *(_QWORD *)(v195 + 8 * v39);
                  ++v104;
                  if (v102)
                    goto LABEL_71;
                }
LABEL_261:
                __break(1u);
LABEL_262:
                __break(1u);
LABEL_263:
                __break(1u);
                goto LABEL_264;
              }
            }
          }
          v39 = v104;
        }
LABEL_71:
        v197 = (v102 - 1) & v102;
        v100 = __clz(__rbit64(v102)) + (v39 << 6);
      }
      v105 = *(_QWORD *)(v94 + 56);
      v38 = v94;
      v106 = (uint64_t *)(*(_QWORD *)(v94 + 48) + 16 * v100);
      v108 = *v106;
      v107 = v106[1];
      v24 = *(_QWORD *)(v105 + 8 * v100);
      v109 = *v106 == 0x7465536F54646461 && v107 == 0xE800000000000000;
      v20 = (unint64_t)v24 >> 62;
      if (v109)
        break;
      OUTLINED_FUNCTION_80();
      if ((OUTLINED_FUNCTION_13_0() & 1) != 0)
        break;
      if (v108 == 0x6C61566F54646461 && v107 == 0xEA00000000006575)
        break;
      OUTLINED_FUNCTION_80();
      if ((OUTLINED_FUNCTION_13_0() & 1) != 0)
        break;
      if (v108 == 0x646E65707061 && v107 == 0xE600000000000000)
        break;
      OUTLINED_FUNCTION_55();
      if ((OUTLINED_FUNCTION_13_0() & 1) != 0)
        break;
      OUTLINED_FUNCTION_66();
      if (!v79 || v107 != 0xED00007465536D6FLL)
      {
        OUTLINED_FUNCTION_35_0();
        OUTLINED_FUNCTION_13_0();
        OUTLINED_FUNCTION_66();
        v114 = v79 && v107 == v32;
        v115 = v114;
        if ((v113 & 1) == 0 && !v115)
        {
          OUTLINED_FUNCTION_35_0();
          v116 = OUTLINED_FUNCTION_13_0();
          v117 = v108 == 0x6574656C6564 && v107 == 0xE600000000000000;
          v118 = v117;
          if ((v116 & 1) == 0 && !v118)
          {
            OUTLINED_FUNCTION_55();
            if ((OUTLINED_FUNCTION_13_0() & 1) == 0)
            {
              v20 = v99;
              v119 = one-time initialization token for correctIntoString;
              OUTLINED_FUNCTION_17_0();
              OUTLINED_FUNCTION_11();
              if (v119 != -1)
                swift_once();
              if (v108 == static CorrectionsConstants.correctIntoString && v107 == *(_QWORD *)algn_1EF7D0978)
              {
                OUTLINED_FUNCTION_5_2();
              }
              else
              {
                OUTLINED_FUNCTION_55();
                v121 = OUTLINED_FUNCTION_13_0();
                OUTLINED_FUNCTION_5_2();
                if ((v121 & 1) == 0)
                {
                  OUTLINED_FUNCTION_10();
LABEL_116:
                  v94 = v38;
                  v24 = v197;
                  v99 = v20;
                  continue;
                }
              }
              specialized Array.append<A>(contentsOf:)(v24);
              LODWORD(v192) = 1;
              goto LABEL_116;
            }
          }
        }
      }
      if (v20)
      {
        OUTLINED_FUNCTION_44();
        v128 = OUTLINED_FUNCTION_103();
        OUTLINED_FUNCTION_10();
      }
      else
      {
        v128 = *(_QWORD *)((v24 & 0xFFFFFFFFFFFFF8) + 0x10);
        OUTLINED_FUNCTION_17_0();
      }
      LODWORD(v194) = v99;
      v129 = v199;
      v130 = v199 >> 62;
      if (v199 >> 62)
      {
        OUTLINED_FUNCTION_25_0();
        v45 = _CocoaArrayWrapper.endIndex.getter();
        OUTLINED_FUNCTION_19_0();
      }
      else
      {
        OUTLINED_FUNCTION_83();
      }
      v131 = v45 + v128;
      if (__OFADD__(v45, v128))
        goto LABEL_262;
      if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
        || (v129 & 0x8000000000000000) != 0
        || (v129 & 0x4000000000000000) != 0
        || (v45 = v129 & 0xFFFFFFFFFFFFFF8, v131 > *(_QWORD *)((v129 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1))
      {
        if (v130)
        {
          OUTLINED_FUNCTION_22_0();
          OUTLINED_FUNCTION_63();
          OUTLINED_FUNCTION_19_0();
        }
        else
        {
          OUTLINED_FUNCTION_83();
        }
        OUTLINED_FUNCTION_25_0();
        OUTLINED_FUNCTION_109();
      }
      v61 = *(_QWORD *)((v129 & 0xFFFFFFFFFFFFFF8) + 0x10);
      v32 = *(_QWORD *)((v129 & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v20)
      {
        OUTLINED_FUNCTION_17_0();
        v94 = _CocoaArrayWrapper.endIndex.getter();
        OUTLINED_FUNCTION_10();
      }
      else
      {
        v94 = *(_QWORD *)((v24 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      v99 = v194;
      if (v94)
      {
        if ((uint64_t)((v32 >> 1) - v61) < v128)
          goto LABEL_274;
        v61 = v45 + 8 * v61 + 32;
        if (v20)
        {
          if (v94 < 1)
            goto LABEL_278;
          v32 = OUTLINED_FUNCTION_82();
          OUTLINED_FUNCTION_17_0();
          do
          {
            __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UsoEntity]);
            OUTLINED_FUNCTION_42();
            OUTLINED_FUNCTION_77();
            OUTLINED_FUNCTION_98();
            OUTLINED_FUNCTION_95();
          }
          while (!v79);
          OUTLINED_FUNCTION_10();
          OUTLINED_FUNCTION_67();
          v99 = v194;
          v128 = v193;
        }
        else
        {
          if (v128 < 0)
            goto LABEL_283;
          OUTLINED_FUNCTION_75();
          v135 = v127 || v61 >= v134;
          v32 = 0xEF65756C61566D6FLL;
          if (!v135)
            goto LABEL_283;
          OUTLINED_FUNCTION_85();
          OUTLINED_FUNCTION_53();
        }
        v45 = 0xED00007465536D6FLL;
        v61 = 0xEA00000000006575;
        if (v128 > 0)
        {
          v136 = *(_QWORD *)((v199 & 0xFFFFFFFFFFFFFF8) + 0x10);
          v101 = __OFADD__(v136, v128);
          v137 = v136 + v128;
          if (v101)
            goto LABEL_277;
          *(_QWORD *)((v199 & 0xFFFFFFFFFFFFFF8) + 0x10) = v137;
        }
      }
      else
      {
        v32 = 0xEF65756C61566D6FLL;
        v45 = 0xED00007465536D6FLL;
        v61 = 0xEA00000000006575;
        v94 = v38;
        if (v128 > 0)
          goto LABEL_263;
      }
      OUTLINED_FUNCTION_10();
      specialized Array._endMutation()();
      LODWORD(v194) = 1;
      v24 = v197;
    }
    if (v20)
    {
      OUTLINED_FUNCTION_44();
      v122 = OUTLINED_FUNCTION_103();
      OUTLINED_FUNCTION_10();
    }
    else
    {
      v122 = *(_QWORD *)((v24 & 0xFFFFFFFFFFFFF8) + 0x10);
      OUTLINED_FUNCTION_17_0();
    }
    v123 = v198;
    v124 = v198 >> 62;
    if (v198 >> 62)
    {
      OUTLINED_FUNCTION_22_0();
      v45 = OUTLINED_FUNCTION_63();
      OUTLINED_FUNCTION_19_0();
    }
    else
    {
      OUTLINED_FUNCTION_83();
    }
    if (__OFADD__(v45, v122))
    {
      __break(1u);
LABEL_259:
      __break(1u);
LABEL_260:
      __break(1u);
      goto LABEL_261;
    }
    if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
      || (v123 & 0x8000000000000000) != 0
      || (v123 & 0x4000000000000000) != 0
      || (v61 = v123 & 0xFFFFFFFFFFFFFF8,
          (int64_t)(v45 + v122) > *(_QWORD *)((v123 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1))
    {
      if (v124)
      {
        OUTLINED_FUNCTION_22_0();
        OUTLINED_FUNCTION_63();
        OUTLINED_FUNCTION_19_0();
      }
      else
      {
        OUTLINED_FUNCTION_83();
      }
      OUTLINED_FUNCTION_25_0();
      OUTLINED_FUNCTION_109();
    }
    v125 = *(_QWORD *)((v123 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v32 = *(_QWORD *)((v123 & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (!v20)
    {
      v94 = *(_QWORD *)((v24 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v94)
        goto LABEL_131;
LABEL_162:
      v32 = 0xEF65756C61566D6FLL;
      v45 = 0xED00007465536D6FLL;
      v61 = 0xEA00000000006575;
      v94 = v38;
      if (v122 > 0)
        goto LABEL_259;
      goto LABEL_172;
    }
    if (v24 < 0)
      v45 = v24;
    else
      v45 = v24 & 0xFFFFFFFFFFFFFF8;
    OUTLINED_FUNCTION_17_0();
    v94 = OUTLINED_FUNCTION_63();
    OUTLINED_FUNCTION_10();
    if (!v94)
      goto LABEL_162;
LABEL_131:
    if ((uint64_t)((v32 >> 1) - v125) < v122)
      goto LABEL_260;
    v61 += 8 * v125 + 32;
    if (v20)
    {
      if (v94 < 1)
        goto LABEL_276;
      v32 = OUTLINED_FUNCTION_82();
      OUTLINED_FUNCTION_17_0();
      do
      {
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UsoEntity]);
        OUTLINED_FUNCTION_42();
        OUTLINED_FUNCTION_77();
        OUTLINED_FUNCTION_98();
        OUTLINED_FUNCTION_95();
      }
      while (!v79);
      OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_67();
      v122 = v193;
    }
    else
    {
      if (v122 < 0
        || ((OUTLINED_FUNCTION_75(), !v127) ? (v127 = v61 >= v126) : (v127 = 1), v32 = 0xEF65756C61566D6FLL, !v127))
      {
LABEL_283:
        OUTLINED_FUNCTION_88();
        _fatalErrorMessage(_:_:file:line:flags:)();
        __break(1u);
        goto LABEL_284;
      }
      OUTLINED_FUNCTION_85();
      OUTLINED_FUNCTION_53();
    }
    v45 = 0xED00007465536D6FLL;
    v61 = 0xEA00000000006575;
    if (v122 <= 0)
    {
LABEL_172:
      OUTLINED_FUNCTION_10();
      specialized Array._endMutation()();
      v99 = 1;
      v24 = v197;
      goto LABEL_56;
    }
    v132 = *(_QWORD *)((v198 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v101 = __OFADD__(v132, v122);
    v133 = v132 + v122;
    if (!v101)
    {
      *(_QWORD *)((v198 & 0xFFFFFFFFFFFFFF8) + 0x10) = v133;
      goto LABEL_172;
    }
    __break(1u);
LABEL_274:
    __break(1u);
LABEL_275:
    __break(1u);
LABEL_276:
    __break(1u);
LABEL_277:
    __break(1u);
LABEL_278:
    __break(1u);
LABEL_279:
    __break(1u);
LABEL_280:
    __break(1u);
LABEL_281:
    __break(1u);
LABEL_282:
    swift_once();
  }
LABEL_253:
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v24 + 2072) != -1)
    swift_once();
  v162 = OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_3(v162, (uint64_t)static Logger.logger);
  v163 = OUTLINED_FUNCTION_14_1();
  if (OUTLINED_FUNCTION_2_5(v163))
  {
    v164 = (_WORD *)OUTLINED_FUNCTION_3_2();
    OUTLINED_FUNCTION_16_0(v164);
    OUTLINED_FUNCTION_1_5(&dword_1C2EAE000, v165, v166, "[CorrectionsEngine.checkCorrection] No correction candidates, and the verb is not update.");
    OUTLINED_FUNCTION_0_4();
  }

  v167 = (_OWORD *)v176;
  *(_BYTE *)(v176 + 32) = 0;
  *v167 = 0u;
  v167[1] = 0u;
LABEL_272:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v206);
  v173 = (id)static Logger.log;
  OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_51();

  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_20_0(v61, v174);
  OUTLINED_FUNCTION_11_1();
}

char *static CorrectionsEngine.searchTasks(tasks:customizations:)(unint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  Swift::String v32;
  Swift::Bool v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  char *v42;
  uint64_t v44;
  unint64_t i;
  _QWORD *v47;
  int64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  int64_t v52;
  char *v53;
  uint64_t v54;
  unint64_t v55;

  if (a1 >> 62)
    goto LABEL_65;
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  v4 = v3;
  if (!v3)
  {
LABEL_66:
    v53 = (char *)MEMORY[0x1E0DEE9D8];
    goto LABEL_67;
  }
  while (1)
  {
    v5 = 0;
    v6 = a1;
    v53 = (char *)MEMORY[0x1E0DEE9D8];
    v44 = v4;
    v47 = a2;
LABEL_4:
    if ((a1 & 0xC000000000000001) != 0)
    {
      MEMORY[0x1C3BCBA14](v5, v6);
    }
    else
    {
      if (v5 >= *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_64;
      swift_retain();
    }
    if (!__OFADD__(v5++, 1))
      break;
LABEL_63:
    __break(1u);
LABEL_64:
    __break(1u);
LABEL_65:
    swift_bridgeObjectRetain();
    v4 = _CocoaArrayWrapper.endIndex.getter();
    if (!v4)
      goto LABEL_66;
  }
  v8 = UsoTask.arguments.getter();
  v9 = v8;
  v10 = 0;
  v11 = v8 + 64;
  v12 = 1 << *(_BYTE *)(v8 + 32);
  if (v12 < 64)
    v13 = ~(-1 << v12);
  else
    v13 = -1;
  v14 = v13 & *(_QWORD *)(v8 + 64);
  v15 = (unint64_t)(v12 + 63) >> 6;
  v49 = v8 + 64;
  v50 = v8;
  v48 = v15;
  for (i = v5; ; v5 = i)
  {
LABEL_13:
    if (v14)
    {
      v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v17 = v16 | (v10 << 6);
      goto LABEL_29;
    }
    v18 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
LABEL_61:
      __break(1u);
LABEL_62:
      __break(1u);
      goto LABEL_63;
    }
    if (v18 >= v15)
      goto LABEL_58;
    v19 = *(_QWORD *)(v11 + 8 * v18);
    ++v10;
    if (!v19)
    {
      v10 = v18 + 1;
      if (v18 + 1 >= v15)
        goto LABEL_58;
      v19 = *(_QWORD *)(v11 + 8 * v10);
      if (!v19)
      {
        v10 = v18 + 2;
        if (v18 + 2 >= v15)
          goto LABEL_58;
        v19 = *(_QWORD *)(v11 + 8 * v10);
        if (!v19)
          break;
      }
    }
LABEL_28:
    v14 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v10 << 6);
LABEL_29:
    v21 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v17);
    if (v21 >> 62)
    {
      swift_bridgeObjectRetain();
      v22 = _CocoaArrayWrapper.endIndex.getter();
      if (!v22)
      {
LABEL_31:
        swift_bridgeObjectRelease();
        goto LABEL_13;
      }
    }
    else
    {
      v22 = *(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v22)
        goto LABEL_31;
    }
    if (v22 < 1)
      goto LABEL_62;
    v23 = 0;
    v54 = v22;
    v52 = v10;
    v55 = v14;
    do
    {
      if ((v21 & 0xC000000000000001) != 0)
        MEMORY[0x1C3BCBA14](v23, v21);
      else
        swift_retain();
      v24 = dispatch thunk of UsoValue.getAsEntity()();
      if (v24)
      {
        v25 = v24;
        v26 = a2[3];
        v27 = a2[4];
        __swift_project_boxed_opaque_existential_1(a2, v26);
        if ((CorrectionsCustomizing.shouldCheckEntityForCorrections(entity:)(v25, v26, v27) & 1) != 0)
        {
          v28 = UsoTask.verbString.getter();
          v30 = v29;
          if (one-time initialization token for updateVerbString != -1)
            swift_once();
          if (v28 == static CorrectionsConstants.updateVerbString && v30 == *(_QWORD *)algn_1EF7D0988)
            v51 = 1;
          else
            v51 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          __swift_project_boxed_opaque_existential_1(a2, a2[3]);
          v32._countAndFlagsBits = UsoTask.verbString.getter();
          v33 = CorrectionsCustomizing.shouldConsiderVerbAsCorrection(verb:)(v32);
          swift_bridgeObjectRelease();
          type metadata accessor for CorrectionsEngine();
          swift_retain();
          v34 = UsoTask.verbString.getter();
          v36 = static CorrectionsEngine.searchEntityForCorrectedAttributes(usoEntity:isExplicitCorrection:attributePathRoot:)(v25, (v51 | v33) & 1, v34, v35);
          swift_release();
          swift_bridgeObjectRelease();
          swift_retain();
          v37 = UsoTask.verbString.getter();
          v39 = v38;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v53 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v53 + 2) + 1, 1, (uint64_t)v53);
          v41 = *((_QWORD *)v53 + 2);
          v40 = *((_QWORD *)v53 + 3);
          if (v41 >= v40 >> 1)
            v53 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v40 > 1), v41 + 1, 1, (uint64_t)v53);
          *((_QWORD *)v53 + 2) = v41 + 1;
          v42 = &v53[32 * v41];
          *((_QWORD *)v42 + 4) = v25;
          *((_QWORD *)v42 + 5) = v37;
          *((_QWORD *)v42 + 6) = v39;
          *((_QWORD *)v42 + 7) = v36;
          swift_release();
          swift_release();
          a2 = v47;
          v15 = v48;
          v11 = v49;
          v9 = v50;
        }
        else
        {
          swift_release();
          swift_release();
        }
        v10 = v52;
      }
      else
      {
        swift_release();
      }
      ++v23;
      v14 = v55;
    }
    while (v54 != v23);
    swift_bridgeObjectRelease();
  }
  v20 = v18 + 3;
  if (v20 < v15)
  {
    v19 = *(_QWORD *)(v11 + 8 * v20);
    if (!v19)
    {
      while (1)
      {
        v10 = v20 + 1;
        if (__OFADD__(v20, 1))
          goto LABEL_61;
        if (v10 >= v15)
          goto LABEL_58;
        v19 = *(_QWORD *)(v11 + 8 * v10);
        ++v20;
        if (v19)
          goto LABEL_28;
      }
    }
    v10 = v20;
    goto LABEL_28;
  }
LABEL_58:
  swift_release();
  swift_release();
  v6 = a1;
  if (v5 != v44)
    goto LABEL_4;
LABEL_67:
  swift_bridgeObjectRelease();
  return v53;
}

uint64_t specialized Array.append<A>(contentsOf:)(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
    goto LABEL_24;
  }
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_16;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x1C3BCBA20](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_16:
    result = specialized Array._copyContents(initializing:)(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_20;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_20:
    swift_bridgeObjectRelease();
    return specialized Array._endMutation()();
  }
  __break(1u);
  return result;
}

uint64_t specialized Array.append<A>(contentsOf:)(uint64_t result)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  v2 = *(_QWORD *)(result + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  result = swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)result || v5 > *(_QWORD *)(v3 + 24) >> 1)
  {
    if (v4 <= v5)
      v7 = v4 + v2;
    else
      v7 = v4;
    result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)result, v7, 1, v3);
    v3 = result;
  }
  if (!*(_QWORD *)(v6 + 16))
  {
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
  v8 = *(_QWORD *)(v3 + 16);
  if ((*(_QWORD *)(v3 + 24) >> 1) - v8 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  result = specialized UnsafeMutablePointer.initialize(from:count:)(v6 + 32, v2, v3 + 40 * v8 + 32);
  if (!v2)
  {
LABEL_14:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
  v9 = *(_QWORD *)(v3 + 16);
  v10 = __OFADD__(v9, v2);
  v11 = v9 + v2;
  if (!v10)
  {
    *(_QWORD *)(v3 + 16) = v11;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  v2 = *(_QWORD *)(result + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  result = swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)result || v5 > *(_QWORD *)(v3 + 24) >> 1)
  {
    if (v4 <= v5)
      v7 = v4 + v2;
    else
      v7 = v4;
    result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)result, v7, 1, v3);
    v3 = result;
  }
  if (!*(_QWORD *)(v6 + 16))
  {
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
  v8 = *(_QWORD *)(v3 + 16);
  if ((*(_QWORD *)(v3 + 24) >> 1) - v8 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  result = specialized UnsafeMutablePointer.initialize(from:count:)(v6 + 32, v2, v3 + 32 * v8 + 32);
  if (!v2)
  {
LABEL_14:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
  v9 = *(_QWORD *)(v3 + 16);
  v10 = __OFADD__(v9, v2);
  v11 = v9 + v2;
  if (!v10)
  {
    *(_QWORD *)(v3 + 16) = v11;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t static CorrectionsEngine.getCorrectedEntitiesFromSRR(correctionCandidateTaskEntity:attributePath:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t (*v6)(uint64_t);
  unint64_t v7;
  uint64_t v8;

  if (one-time initialization token for rrUtils != -1)
    swift_once();
  v6 = *(uint64_t (**)(uint64_t))(*(_QWORD *)static CorrectionsEngine.rrUtils + 80);
  swift_retain();
  v7 = v6(a1);
  swift_release();
  swift_bridgeObjectRetain();
  v8 = specialized Sequence.flatMap<A>(_:)(v7, a2, a3);
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t specialized Collection.first.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  v6 = v5;
  if (v4)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1+ ((*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80)), v5);
    v7 = 0;
  }
  else
  {
    v7 = 1;
  }
  return __swift_storeEnumTagSinglePayload(a2, v7, 1, v6);
}

double specialized Collection.first.getter@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  double result;

  if (*(_QWORD *)(a1 + 16))
  {
    v2 = *(_QWORD *)(a1 + 40);
    v3 = *(_QWORD *)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 56);
    *(_QWORD *)a2 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(a2 + 8) = v2;
    *(_QWORD *)(a2 + 16) = v3;
    *(_QWORD *)(a2 + 24) = v4;
    v5 = *(_BYTE *)(a1 + 64);
    *(_BYTE *)(a2 + 32) = v5;
    swift_bridgeObjectRetain();
    outlined copy of CorrectionType(v3, v4, v5);
  }
  else
  {
    *(_BYTE *)(a2 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

uint64_t static CorrectionsEngine.searchEntityForCorrectedAttributes(usoEntity:isExplicitCorrection:attributePathRoot:)(unint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t);
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t inited;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  unint64_t v38;
  unint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t result;
  uint64_t v43;
  int64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  int64_t v51;
  unint64_t v52;
  int64_t v53;
  uint64_t *v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  BOOL v60;
  BOOL v61;
  _QWORD *v62;
  uint64_t v63;
  uint64_t v64;
  BOOL v65;
  Swift::String v66;
  Swift::String v67;
  unint64_t v68;
  BOOL v69;
  _QWORD *v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  BOOL v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  char v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  char v95;
  uint64_t v96;
  uint64_t v97;
  int64_t v98;
  int64_t v99;
  char *v100;
  int64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  int64_t v109;
  int64_t v110;
  uint64_t v111;
  char *v112;
  int64_t v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v117;
  uint64_t v118;
  BOOL v119;
  _QWORD *v120;
  uint64_t v121;
  uint64_t v122;
  BOOL v123;
  uint64_t v124;
  uint64_t v125;
  char v126;
  unint64_t v127;
  char v128;
  uint64_t v129;
  _BOOL8 v130;
  Swift::Int v131;
  unint64_t v132;
  char v133;
  Swift::Bool v134;
  unint64_t v135;
  char v136;
  _QWORD *v137;
  uint64_t v138;
  _QWORD *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  char v143;
  unint64_t v144;
  char v145;
  uint64_t v146;
  _BOOL8 v147;
  Swift::Int v148;
  unint64_t v149;
  char v150;
  Swift::Bool v151;
  unint64_t v152;
  char v153;
  _QWORD *v154;
  uint64_t v155;
  _QWORD *v156;
  uint64_t v157;
  uint64_t v158;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v160;
  unint64_t v161;
  char *v162;
  uint64_t v163;
  uint64_t v164;
  unint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  unint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  int64_t v175;
  uint64_t v176;
  int64_t v177;
  unint64_t v178;
  uint64_t v179;
  uint64_t v180;
  unint64_t v181;
  unint64_t v182;
  char *v183;
  int v184;
  unint64_t v185;
  uint64_t v186;
  uint64_t v187;

  v179 = a4;
  v184 = a2;
  v6 = type metadata accessor for Name();
  v7 = *(_QWORD *)(v6 - 8);
  v9 = MEMORY[0x1E0C80A78](v6, v8);
  v11 = (char *)&v164 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9, v12);
  v14 = (char *)&v164 - v13;
  if (!a1)
    return MEMORY[0x1E0DEE9D8];
  v174 = a3;
  swift_retain();
  v15 = UsoTask.verbString.getter();
  v17 = v16;
  static Name.primitiveString.getter();
  v18 = Name.value.getter();
  v20 = v19;
  v21 = *(void (**)(char *, uint64_t))(v7 + 8);
  v21(v14, v6);
  if (v15 == v18 && v17 == v20)
    goto LABEL_15;
  v23 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v23 & 1) != 0)
  {
LABEL_16:
    if ((v184 & 1) != 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, [UsoEntity])>);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1C2EC2D50;
      v33 = one-time initialization token for correctIntoString;
      swift_bridgeObjectRetain();
      if (v33 != -1)
        goto LABEL_213;
      goto LABEL_18;
    }
    swift_release();
    return MEMORY[0x1E0DEE9D8];
  }
  v24 = UsoTask.verbString.getter();
  v26 = v25;
  static Name.primitiveInteger.getter();
  v27 = Name.value.getter();
  v29 = v28;
  v21(v11, v6);
  if (v24 == v27 && v26 == v29)
  {
LABEL_15:
    swift_bridgeObjectRelease_n();
    goto LABEL_16;
  }
  inited = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((inited & 1) != 0)
    goto LABEL_16;
  if (*(_QWORD *)(UsoEntity.attributes.getter() + 16))
  {
    specialized __RawDictionaryStorage.find<A>(_:)(0xD000000000000010, 0x80000001C2EC3990);
    inited = v32;
    swift_bridgeObjectRelease();
    if ((inited & 1) != 0)
    {
      inited = *(_QWORD *)(UsoEntity.attributes.getter() + 16);
      swift_bridgeObjectRelease();
      v184 |= inited > 1;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v43 = UsoEntity.attributes.getter();
  v44 = 0;
  v45 = *(_QWORD *)(v43 + 64);
  v176 = v43 + 64;
  v180 = v43;
  v46 = 1 << *(_BYTE *)(v43 + 32);
  v47 = -1;
  if (v46 < 64)
    v47 = ~(-1 << v46);
  v48 = v47 & v45;
  v37 = (char *)MEMORY[0x1E0DEE9D8];
  v177 = (unint64_t)(v46 + 63) >> 6;
  v165 = a1;
  while (1)
  {
    while (1)
    {
      if (v48)
      {
        v49 = __clz(__rbit64(v48));
        v48 &= v48 - 1;
        v50 = v49 | (v44 << 6);
      }
      else
      {
        v51 = v44 + 1;
        if (__OFADD__(v44, 1))
          goto LABEL_209;
        if (v51 >= v177)
          goto LABEL_205;
        v52 = *(_QWORD *)(v176 + 8 * v51);
        ++v44;
        if (!v52)
        {
          v44 = v51 + 1;
          if (v51 + 1 >= v177)
            goto LABEL_205;
          v52 = *(_QWORD *)(v176 + 8 * v44);
          if (!v52)
          {
            v44 = v51 + 2;
            if (v51 + 2 >= v177)
              goto LABEL_205;
            v52 = *(_QWORD *)(v176 + 8 * v44);
            if (!v52)
            {
              v53 = v51 + 3;
              if (v53 >= v177)
                goto LABEL_205;
              v52 = *(_QWORD *)(v176 + 8 * v53);
              if (!v52)
              {
                while (1)
                {
                  v44 = v53 + 1;
                  if (__OFADD__(v53, 1))
                  {
LABEL_218:
                    __break(1u);
LABEL_219:
                    __break(1u);
LABEL_220:
                    __break(1u);
                    goto LABEL_221;
                  }
                  if (v44 >= v177)
                    break;
                  v52 = *(_QWORD *)(v176 + 8 * v44);
                  ++v53;
                  if (v52)
                    goto LABEL_44;
                }
LABEL_205:
                swift_release();
LABEL_21:
                swift_release();
                return (uint64_t)v37;
              }
              v44 = v53;
            }
          }
        }
LABEL_44:
        v48 = (v52 - 1) & v52;
        v50 = __clz(__rbit64(v52)) + (v44 << 6);
      }
      v54 = (uint64_t *)(*(_QWORD *)(v180 + 48) + 16 * v50);
      v55 = *v54;
      inited = v54[1];
      v56 = *(_QWORD *)(*(_QWORD *)(v180 + 56) + 8 * v50);
      v57 = one-time initialization token for attributeDenyList;
      swift_bridgeObjectRetain();
      v185 = v56;
      swift_bridgeObjectRetain();
      if (v57 != -1)
        swift_once();
      v58 = static CorrectionsConstants.attributeDenyList;
      v59 = *((_QWORD *)static CorrectionsConstants.attributeDenyList + 2);
      if (!v59)
        goto LABEL_69;
      v60 = *((_QWORD *)static CorrectionsConstants.attributeDenyList + 4) == v55
         && *((_QWORD *)static CorrectionsConstants.attributeDenyList + 5) == inited;
      if (!v60 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
        break;
LABEL_59:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    if (v59 != 1)
    {
      v61 = v58[6] == v55 && v58[7] == inited;
      if (v61 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        goto LABEL_59;
      if (v59 != 2)
      {
        v62 = v58 + 9;
        v63 = 2;
        while (1)
        {
          v64 = v63 + 1;
          if (__OFADD__(v63, 1))
            break;
          v65 = *(v62 - 1) == v55 && *v62 == inited;
          if (v65 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
            goto LABEL_59;
          v62 += 2;
          ++v63;
          if (v64 == v59)
            goto LABEL_69;
        }
LABEL_207:
        __break(1u);
LABEL_208:
        __break(1u);
LABEL_209:
        __break(1u);
LABEL_210:
        __break(1u);
LABEL_211:
        __break(1u);
LABEL_212:
        __break(1u);
LABEL_213:
        swift_once();
LABEL_18:
        v34 = *(_QWORD *)algn_1EF7D0978;
        *(_QWORD *)(inited + 32) = static CorrectionsConstants.correctIntoString;
        *(_QWORD *)(inited + 40) = v34;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
        v35 = swift_allocObject();
        *(_OWORD *)(v35 + 16) = xmmword_1C2EC31D0;
        *(_QWORD *)(v35 + 32) = a1;
        v186 = v35;
        specialized Array._endMutation()();
        *(_QWORD *)(inited + 48) = v186;
        swift_retain();
        swift_bridgeObjectRetain();
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UsoEntity]);
        v36 = Dictionary.init(dictionaryLiteral:)();
        v37 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, 1, 1, MEMORY[0x1E0DEE9D8]);
        v39 = *((_QWORD *)v37 + 2);
        v38 = *((_QWORD *)v37 + 3);
        if (v39 >= v38 >> 1)
          v37 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v38 > 1), v39 + 1, 1, (uint64_t)v37);
        *((_QWORD *)v37 + 2) = v39 + 1;
        v40 = &v37[24 * v39];
        v41 = v179;
        *((_QWORD *)v40 + 4) = v174;
        *((_QWORD *)v40 + 5) = v41;
        *((_QWORD *)v40 + 6) = v36;
        goto LABEL_21;
      }
    }
LABEL_69:
    v186 = v174;
    v187 = v179;
    swift_bridgeObjectRetain();
    v66._countAndFlagsBits = 46;
    v66._object = (void *)0xE100000000000000;
    String.append(_:)(v66);
    v67._countAndFlagsBits = v55;
    v67._object = (void *)inited;
    String.append(_:)(v67);
    swift_bridgeObjectRelease();
    v171 = v186;
    v172 = v187;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UsoEntity]);
    v173 = Dictionary.init(dictionaryLiteral:)();
    v68 = v185;
    if (v185 >> 62)
      break;
    inited = *(_QWORD *)((v185 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (inited)
      goto LABEL_71;
LABEL_197:
    swift_bridgeObjectRelease();
    inited = v173;
    if (*(_QWORD *)(v173 + 16))
    {
      swift_bridgeObjectRetain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      a1 = v165;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        v37 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v37 + 2) + 1, 1, (uint64_t)v37);
      v161 = *((_QWORD *)v37 + 2);
      v160 = *((_QWORD *)v37 + 3);
      if (v161 >= v160 >> 1)
        v37 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v160 > 1), v161 + 1, 1, (uint64_t)v37);
      *((_QWORD *)v37 + 2) = v161 + 1;
      v162 = &v37[24 * v161];
      v163 = v172;
      *((_QWORD *)v162 + 4) = v171;
      *((_QWORD *)v162 + 5) = v163;
      inited = v173;
      *((_QWORD *)v162 + 6) = v173;
    }
    else
    {
      swift_bridgeObjectRelease();
      a1 = v165;
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  inited = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!inited)
    goto LABEL_197;
LABEL_71:
  a1 = 0;
  v182 = v68 & 0xC000000000000001;
  v170 = v68 & 0xFFFFFFFFFFFFFF8;
  v169 = v68 + 32;
  v175 = v44;
  v178 = v48;
  v181 = inited;
  while (2)
  {
    if (v182)
    {
      MEMORY[0x1C3BCBA14](a1, v68);
    }
    else
    {
      if (a1 >= *(_QWORD *)(v170 + 16))
        goto LABEL_208;
      swift_retain();
    }
    v69 = __OFADD__(a1++, 1);
    if (v69)
    {
      __break(1u);
      goto LABEL_207;
    }
    if (!dispatch thunk of UsoValue.getAsExpression()())
    {
      v87 = dispatch thunk of UsoValue.getAsEntity()();
      if (!v87)
      {
        swift_release();
        goto LABEL_194;
      }
      v88 = v87;
      if ((v184 & 1) != 0)
      {
        if (one-time initialization token for correctIntoString != -1)
          swift_once();
        v89 = static CorrectionsConstants.correctIntoString;
        v90 = *(_QWORD *)algn_1EF7D0978;
        v91 = v173;
        v92 = *(_QWORD *)(v173 + 16);
        swift_bridgeObjectRetain();
        v168 = v89;
        if (v92)
        {
          swift_bridgeObjectRetain();
          v93 = specialized __RawDictionaryStorage.find<A>(_:)(v89, v90);
          v94 = MEMORY[0x1E0DEE9D8];
          if ((v95 & 1) != 0)
          {
            v94 = *(_QWORD *)(*(_QWORD *)(v91 + 56) + 8 * v93);
            swift_bridgeObjectRetain();
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          v94 = MEMORY[0x1E0DEE9D8];
        }
        v183 = v37;
        v186 = v94;
        swift_retain_n();
        v124 = swift_bridgeObjectRetain();
        MEMORY[0x1C3BCB930](v124);
        if (*(_QWORD *)((v186 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v186 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
        v125 = v186;
        swift_bridgeObjectRelease();
        swift_release();
        v126 = swift_isUniquelyReferenced_nonNull_native();
        v186 = v91;
        v127 = specialized __RawDictionaryStorage.find<A>(_:)(v168, v90);
        v129 = *(_QWORD *)(v91 + 16);
        v130 = (v128 & 1) == 0;
        v131 = v129 + v130;
        if (__OFADD__(v129, v130))
          goto LABEL_215;
        v132 = v127;
        v133 = v128;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<String, [UsoEntity]>);
        v134 = _NativeDictionary.ensureUnique(isUnique:capacity:)(v126, v131);
        v44 = v175;
        if (v134)
        {
          v135 = specialized __RawDictionaryStorage.find<A>(_:)(v168, v90);
          if ((v133 & 1) != (v136 & 1))
            goto LABEL_226;
          v132 = v135;
        }
        v137 = (_QWORD *)v186;
        v173 = v186;
        if ((v133 & 1) != 0)
        {
          v138 = *(_QWORD *)(v186 + 56);
          swift_bridgeObjectRelease();
          *(_QWORD *)(v138 + 8 * v132) = v125;
        }
        else
        {
          *(_QWORD *)(v186 + 8 * (v132 >> 6) + 64) |= 1 << v132;
          v139 = (_QWORD *)(v137[6] + 16 * v132);
          *v139 = v168;
          v139[1] = v90;
          *(_QWORD *)(v137[7] + 8 * v132) = v125;
          v140 = v137[2];
          v69 = __OFADD__(v140, 1);
          v141 = v140 + 1;
          if (v69)
            goto LABEL_222;
          v137[2] = v141;
          swift_bridgeObjectRetain();
        }
        v37 = v183;
        v68 = v185;
        inited = v181;
        swift_release();
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v48 = v178;
        goto LABEL_194;
      }
      type metadata accessor for CorrectionsEngine();
      v107 = static CorrectionsEngine.searchEntityForCorrectedAttributes(usoEntity:isExplicitCorrection:attributePathRoot:)(v88, 0, v171, v172);
      v108 = *(_QWORD *)(v107 + 16);
      v109 = *((_QWORD *)v37 + 2);
      v110 = v109 + v108;
      if (__OFADD__(v109, v108))
      {
        __break(1u);
LABEL_215:
        __break(1u);
LABEL_216:
        __break(1u);
LABEL_217:
        __break(1u);
        goto LABEL_218;
      }
      v111 = v107;
      v112 = (char *)swift_isUniquelyReferenced_nonNull_native();
      if (!(_DWORD)v112 || v110 > *((_QWORD *)v37 + 3) >> 1)
      {
        if (v109 <= v110)
          v113 = v109 + v108;
        else
          v113 = v109;
        v37 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v112, v113, 1, (uint64_t)v37);
      }
      v68 = v185;
      if (*(_QWORD *)(v111 + 16))
      {
        v114 = *((_QWORD *)v37 + 2);
        if ((*((_QWORD *)v37 + 3) >> 1) - v114 < v108)
          goto LABEL_220;
        v115 = (unint64_t)&v37[24 * v114 + 32];
        if (v111 + 32 < v115 + 24 * v108 && v115 < v111 + 32 + 24 * v108)
          goto LABEL_225;
        swift_arrayInitWithCopy();
        if (v108)
        {
          v117 = *((_QWORD *)v37 + 2);
          v69 = __OFADD__(v117, v108);
          v118 = v117 + v108;
          if (v69)
            goto LABEL_223;
          *((_QWORD *)v37 + 2) = v118;
        }
      }
      else if (v108)
      {
        goto LABEL_216;
      }
      swift_bridgeObjectRelease();
      swift_release();
LABEL_179:
      swift_release();
      goto LABEL_180;
    }
    if (one-time initialization token for operatorStrings != -1)
      swift_once();
    v70 = static CorrectionsConstants.operatorStrings;
    swift_bridgeObjectRetain();
    v71 = UsoExpression.operatorAsString.getter();
    if (v72)
      v73 = v71;
    else
      v73 = 0;
    if (v72)
      v74 = v72;
    else
      v74 = 0xE000000000000000;
    v75 = v70[2];
    if (!v75)
    {
      swift_bridgeObjectRelease();
LABEL_108:
      swift_bridgeObjectRelease();
      type metadata accessor for CorrectionsEngine();
      v96 = dispatch thunk of UsoValue.getAsEntity()();
      inited = static CorrectionsEngine.searchEntityForCorrectedAttributes(usoEntity:isExplicitCorrection:attributePathRoot:)(v96, 0, v171, v172);
      swift_release();
      v97 = *(_QWORD *)(inited + 16);
      v98 = *((_QWORD *)v37 + 2);
      v99 = v98 + v97;
      v48 = v178;
      if (__OFADD__(v98, v97))
        goto LABEL_210;
      swift_bridgeObjectRetain();
      v100 = (char *)swift_isUniquelyReferenced_nonNull_native();
      if (!(_DWORD)v100 || v99 > *((_QWORD *)v37 + 3) >> 1)
      {
        if (v98 <= v99)
          v101 = v98 + v97;
        else
          v101 = v98;
        v37 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v100, v101, 1, (uint64_t)v37);
      }
      v68 = v185;
      if (*(_QWORD *)(inited + 16))
      {
        v102 = *((_QWORD *)v37 + 2);
        if ((*((_QWORD *)v37 + 3) >> 1) - v102 < v97)
          goto LABEL_212;
        v103 = (unint64_t)&v37[24 * v102 + 32];
        if (inited + 32 < v103 + 24 * v97 && v103 < inited + 32 + 24 * v97)
          goto LABEL_225;
        swift_arrayInitWithCopy();
        if (v97)
        {
          v105 = *((_QWORD *)v37 + 2);
          v69 = __OFADD__(v105, v97);
          v106 = v105 + v97;
          if (v69)
            goto LABEL_217;
          *((_QWORD *)v37 + 2) = v106;
        }
      }
      else if (v97)
      {
        goto LABEL_211;
      }
      swift_bridgeObjectRelease_n();
      swift_release();
      goto LABEL_179;
    }
    v183 = v37;
    v76 = v70[4] == v73 && v70[5] == v74;
    if (v76 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
LABEL_92:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v77 = UsoExpression.operatorAsString.getter();
      if (v78)
      {
        v79 = v77;
        v80 = v78;
        v81 = UsoExpression.operandAsValue.getter();
        v44 = v175;
        v48 = v178;
        v68 = v185;
        inited = v181;
        if (v81 && (v168 = v79, v82 = dispatch thunk of UsoValue.getAsEntity()(), swift_release(), (v167 = v82) != 0))
        {
          v83 = v173;
          if (*(_QWORD *)(v173 + 16))
          {
            swift_bridgeObjectRetain();
            v84 = specialized __RawDictionaryStorage.find<A>(_:)(v168, v80);
            v85 = MEMORY[0x1E0DEE9D8];
            if ((v86 & 1) != 0)
            {
              v85 = *(_QWORD *)(*(_QWORD *)(v83 + 56) + 8 * v84);
              swift_bridgeObjectRetain();
            }
            swift_bridgeObjectRelease();
          }
          else
          {
            v85 = MEMORY[0x1E0DEE9D8];
          }
          v186 = v85;
          swift_retain_n();
          v142 = swift_bridgeObjectRetain();
          MEMORY[0x1C3BCB930](v142);
          if (*(_QWORD *)((v186 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v186 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
          specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized Array._endMutation()();
          v166 = v186;
          swift_bridgeObjectRelease();
          swift_release();
          v143 = swift_isUniquelyReferenced_nonNull_native();
          v186 = v83;
          v144 = specialized __RawDictionaryStorage.find<A>(_:)(v168, v80);
          v146 = *(_QWORD *)(v83 + 16);
          v147 = (v145 & 1) == 0;
          v148 = v146 + v147;
          if (__OFADD__(v146, v147))
            goto LABEL_219;
          v149 = v144;
          v150 = v145;
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<String, [UsoEntity]>);
          v151 = _NativeDictionary.ensureUnique(isUnique:capacity:)(v143, v148);
          v44 = v175;
          v48 = v178;
          if (v151)
          {
            v152 = specialized __RawDictionaryStorage.find<A>(_:)(v168, v80);
            if ((v150 & 1) != (v153 & 1))
              goto LABEL_226;
            v149 = v152;
          }
          v154 = (_QWORD *)v186;
          v173 = v186;
          if ((v150 & 1) != 0)
          {
            v155 = *(_QWORD *)(v186 + 56);
            swift_bridgeObjectRelease();
            *(_QWORD *)(v155 + 8 * v149) = v166;
          }
          else
          {
            *(_QWORD *)(v186 + 8 * (v149 >> 6) + 64) |= 1 << v149;
            v156 = (_QWORD *)(v154[6] + 16 * v149);
            *v156 = v168;
            v156[1] = v80;
            *(_QWORD *)(v154[7] + 8 * v149) = v166;
            v157 = v154[2];
            v69 = __OFADD__(v157, 1);
            v158 = v157 + 1;
            if (v69)
              goto LABEL_224;
            v154[2] = v158;
            swift_bridgeObjectRetain();
          }
          inited = v181;
          swift_release();
          swift_release();
          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_release();
          swift_release();
        }
        v37 = v183;
        goto LABEL_194;
      }
      swift_release();
      swift_release();
      v37 = v183;
      v44 = v175;
      v48 = v178;
      v68 = v185;
LABEL_180:
      inited = v181;
LABEL_194:
      if (a1 == inited)
        goto LABEL_197;
      continue;
    }
    break;
  }
  v37 = v183;
  if (v75 == 1)
  {
    swift_bridgeObjectRelease();
    goto LABEL_149;
  }
  v119 = v70[6] == v73 && v70[7] == v74;
  if (v119 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    goto LABEL_92;
  if (v75 == 2)
  {
LABEL_164:
    swift_bridgeObjectRelease();
    v37 = v183;
LABEL_149:
    v44 = v175;
    goto LABEL_108;
  }
  v120 = v70 + 9;
  v121 = 2;
  while (1)
  {
    v122 = v121 + 1;
    if (__OFADD__(v121, 1))
      break;
    v123 = *(v120 - 1) == v73 && *v120 == v74;
    if (v123 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      goto LABEL_92;
    v120 += 2;
    ++v121;
    if (v122 == v75)
      goto LABEL_164;
  }
LABEL_221:
  __break(1u);
LABEL_222:
  __break(1u);
LABEL_223:
  __break(1u);
LABEL_224:
  __break(1u);
LABEL_225:
  _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
LABEL_226:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t static CorrectionsEngine.searchEntityForPath(entity:path:)(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4;
  const char *v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t result;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t i;
  uint64_t v39;
  unint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;

  v4 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v4 = a2 & 0xFFFFFFFFFFFFLL;
  v5 = "CorrectionsUSOParse";
  if (!v4)
  {
    if (one-time initialization token for logger != -1)
      goto LABEL_72;
    goto LABEL_7;
  }
  lazy protocol witness table accessor for type String and conformance String();
  v6 = (_QWORD *)StringProtocol.components<A>(separatedBy:)();
  v7 = v6;
  if (v6[2])
  {
    v9 = v6[4];
    v8 = v6[5];
    swift_bridgeObjectRetain();
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }
  v15 = UsoTask.verbString.getter();
  if (!v8)
  {
    swift_bridgeObjectRelease();
LABEL_19:
    swift_bridgeObjectRelease();
    if (one-time initialization token for logger != -1)
      swift_once();
    v19 = type metadata accessor for Logger();
    __swift_project_value_buffer(v19, (uint64_t)static Logger.logger);
    v20 = Logger.logObject.getter();
    v21 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1C2EAE000, v20, v21, "[CorrectionsEngine.searchEntityForPath] the entity type does not match the path root type", v22, 2u);
      MEMORY[0x1C3BCBED0](v22, -1, -1);
    }

    return MEMORY[0x1E0DEE9D8];
  }
  if (v9 == v15 && v8 == v16)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v18 & 1) == 0)
      goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_1C2EC31D0;
  *(_QWORD *)(v23 + 32) = a1;
  v50 = v23;
  result = specialized Array._endMutation()();
  v25 = v7[2];
  if (v25 == 1)
  {
    swift_retain();
    swift_bridgeObjectRelease();
    return v50;
  }
  if (!v25)
  {
    __break(1u);
    return result;
  }
  v41 = v7 + 4;
  swift_retain();
  v26 = 1;
  v27 = MEMORY[0x1E0DEE9D8];
  a1 = v50;
  v42 = v7;
  v40 = v25;
  while (1)
  {
    if (v26 >= v25)
      goto LABEL_71;
    v51 = v27;
    if (a1 >> 62)
      break;
    v28 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v28)
      goto LABEL_31;
LABEL_62:
    swift_bridgeObjectRelease();
    a1 = v27;
LABEL_63:
    if (++v26 == v25)
    {
      swift_bridgeObjectRelease();
      return a1;
    }
  }
  swift_bridgeObjectRetain();
  v28 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v28)
    goto LABEL_62;
LABEL_31:
  v5 = 0;
  v46 = a1 & 0xFFFFFFFFFFFFFF8;
  v47 = &v41[2 * v26];
  v48 = a1 & 0xC000000000000001;
  v43 = a1;
  v44 = v28;
  v45 = v26;
  while (1)
  {
    if (v48)
    {
      MEMORY[0x1C3BCBA14](v5, a1);
    }
    else
    {
      if ((unint64_t)v5 >= *(_QWORD *)(v46 + 16))
        goto LABEL_69;
      swift_retain();
    }
    if (__OFADD__(v5++, 1))
      break;
    v30 = UsoEntity.attributes.getter();
    if (v26 >= v7[2])
      goto LABEL_68;
    v31 = v30;
    if (*(_QWORD *)(v30 + 16))
    {
      v33 = *v47;
      v32 = v47[1];
      swift_bridgeObjectRetain();
      v34 = specialized __RawDictionaryStorage.find<A>(_:)(v33, v32);
      if ((v35 & 1) != 0)
      {
        v36 = *(_QWORD *)(*(_QWORD *)(v31 + 56) + 8 * v34);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v36 >> 62)
        {
          swift_bridgeObjectRetain();
          v37 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
          if (!v37)
            goto LABEL_57;
LABEL_42:
          if (v37 < 1)
            goto LABEL_70;
          for (i = 0; i != v37; ++i)
          {
            if ((v36 & 0xC000000000000001) != 0)
              MEMORY[0x1C3BCBA14](i, v36);
            else
              swift_retain();
            if (dispatch thunk of UsoValue.getAsEntity()())
            {
              v39 = swift_retain();
              MEMORY[0x1C3BCB930](v39);
              if (*(_QWORD *)((v51 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v51 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
                specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
              specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
              specialized Array._endMutation()();
              swift_release();
            }
            swift_release();
          }
          swift_release();
          swift_bridgeObjectRelease();
          v7 = v42;
          a1 = v43;
        }
        else
        {
          v37 = *(_QWORD *)((v36 & 0xFFFFFFFFFFFFF8) + 0x10);
          if (v37)
            goto LABEL_42;
LABEL_57:
          swift_release();
          swift_bridgeObjectRelease();
        }
        v28 = v44;
        v26 = v45;
        goto LABEL_59;
      }
      swift_release();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_release();
    }
    swift_bridgeObjectRelease();
LABEL_59:
    if (v5 == (const char *)v28)
    {
      swift_bridgeObjectRelease();
      a1 = v51;
      v25 = v40;
      v27 = MEMORY[0x1E0DEE9D8];
      goto LABEL_63;
    }
  }
  __break(1u);
LABEL_68:
  __break(1u);
LABEL_69:
  __break(1u);
LABEL_70:
  __break(1u);
LABEL_71:
  __break(1u);
LABEL_72:
  swift_once();
LABEL_7:
  v10 = type metadata accessor for Logger();
  __swift_project_value_buffer(v10, (uint64_t)static Logger.logger);
  v11 = Logger.logObject.getter();
  v12 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1C2EAE000, v11, v12, "[CorrectionsEngine.searchEntityForPath] No path provided, returning entire entity", v13, 2u);
    MEMORY[0x1C3BCBED0](v13, -1, -1);
  }

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = *((_OWORD *)v5 + 29);
  *(_QWORD *)(v14 + 32) = a1;
  v49 = v14;
  specialized Array._endMutation()();
  a1 = v49;
  swift_retain();
  return a1;
}

uint64_t specialized Sequence.flatMap<A>(_:)(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4;
  uint64_t i;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v12;

  v12 = MEMORY[0x1E0DEE9D8];
  if (a1 >> 62)
    goto LABEL_11;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; v4 = _CocoaArrayWrapper.endIndex.getter())
  {
    type metadata accessor for CorrectionsEngine();
    for (i = 4; ; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        v6 = MEMORY[0x1C3BCBA14](i - 4, a1);
      }
      else
      {
        v6 = *(_QWORD *)(a1 + 8 * i);
        swift_retain();
      }
      v7 = i - 3;
      if (__OFADD__(i - 4, 1))
        break;
      v8 = static CorrectionsEngine.searchEntityForPath(entity:path:)(v6, a2, a3);
      swift_release();
      specialized Array.append<A>(contentsOf:)(v8);
      if (v7 == v4)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v12;
      }
    }
    __break(1u);
LABEL_11:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return MEMORY[0x1E0DEE9D8];
}

double specialized Dictionary.subscript.getter@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  unint64_t v6;
  char v7;
  double result;

  if (*(_QWORD *)(a3 + 16) && (v6 = specialized __RawDictionaryStorage.find<A>(_:)(a1, a2), (v7 & 1) != 0))
  {
    outlined init with copy of Any(*(_QWORD *)(a3 + 56) + 32 * v6, (uint64_t)a4);
  }
  else
  {
    result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
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

uint64_t static CorrectionsEngine.tasks(from:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t);
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v2 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  v3 = *(_QWORD *)(v2 - 8);
  v5 = MEMORY[0x1E0C80A78](v2, v4);
  v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5, v8);
  v10 = (char *)&v30 - v9;
  v11 = type metadata accessor for Siri_Nlu_External_UserStatedTask();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11, v13);
  v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = type metadata accessor for Siri_Nlu_External_UsoGraph();
  v16 = *(_QWORD *)(v31 - 8);
  MEMORY[0x1E0C80A78](v31, v17);
  v19 = (char *)&v30 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((Siri_Nlu_External_UserDialogAct.hasUserStatedTask.getter() & 1) != 0)
  {
    Siri_Nlu_External_UserDialogAct.userStatedTask.getter();
    Siri_Nlu_External_UserStatedTask.task.getter();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
    static UsoGraphProtoReader.fromSwiftProtobuf(protobufGraph:vocabManager:)();
    v28 = MEMORY[0x1C3BCB720]();
    swift_release();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v31);
  }
  else
  {
    if (one-time initialization token for logger != -1)
      swift_once();
    v20 = type metadata accessor for Logger();
    __swift_project_value_buffer(v20, (uint64_t)static Logger.logger);
    v21 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v21(v10, a1, v2);
    v22 = Logger.logObject.getter();
    v23 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      v25 = swift_slowAlloc();
      v33 = v25;
      *(_DWORD *)v24 = 136315138;
      v31 = (uint64_t)(v24 + 4);
      v21(v7, (uint64_t)v10, v2);
      v26 = String.init<A>(describing:)();
      v32 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v26, v27, &v33);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v10, v2);
      _os_log_impl(&dword_1C2EAE000, v22, v23, "[CorrectionsEngine.checkUndo] No UserStatedTask for %s, returning []", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C3BCBED0](v25, -1, -1);
      MEMORY[0x1C3BCBED0](v24, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v3 + 8))(v10, v2);
    }

    return MEMORY[0x1E0DEE9D8];
  }
  return v28;
}

uint64_t static CorrectionsEngine.isCrossAlarmTimerDomain(invocation:incomingParse:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v20;
  char v22;
  char v23;
  uint64_t v24;
  unint64_t v25;
  Swift::String v26;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UserDialogAct?);
  MEMORY[0x1E0C80A78](v0, v1);
  v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  v5 = *(_QWORD *)(v4 - 8);
  v7 = MEMORY[0x1E0C80A78](v4, v6);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(MEMORY[0x1C3BCB618](v7) + 16);
  v11 = swift_bridgeObjectRelease();
  if (v10 != 1)
    goto LABEL_26;
  v12 = MEMORY[0x1C3BCB618](v11);
  specialized Collection.first.getter(v12, (uint64_t)v3);
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload((uint64_t)v3, 1, v4) == 1)
  {
    outlined destroy of CorrectionsCustomizing?((uint64_t)v3, &demangling cache variable for type metadata for Siri_Nlu_External_UserDialogAct?);
LABEL_26:
    v23 = 0;
    return v23 & 1;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v9, v3, v4);
  type metadata accessor for CorrectionsEngine();
  v13 = static CorrectionsEngine.tasks(from:)((uint64_t)v9);
  if (!(v13 >> 62))
  {
    result = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (result)
      goto LABEL_6;
LABEL_25:
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v4);
    goto LABEL_26;
  }
  result = _CocoaArrayWrapper.endIndex.getter();
  if (!result)
    goto LABEL_25;
LABEL_6:
  if ((v13 & 0xC000000000000001) != 0)
  {
    MEMORY[0x1C3BCBA14](0, v13);
LABEL_9:
    swift_bridgeObjectRelease();
    v15 = UsoTask.baseEntityAsString.getter();
    v17 = v16;
    swift_release();
    v26 = String.lowercased()();
    v24 = 0x6D72616C61;
    v25 = 0xE500000000000000;
    lazy protocol witness table accessor for type String and conformance String();
    v18 = StringProtocol.contains<A>(_:)();
    swift_bridgeObjectRelease();
    if ((v18 & 1) != 0)
    {
      if (v15 != 0x415F6E6F6D6D6F63 || v17 != 0xEC0000006D72616CLL)
      {
LABEL_20:
        v22 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        v23 = v22 ^ 1;
LABEL_22:
        (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v4);
        return v23 & 1;
      }
    }
    else
    {
      v26 = String.lowercased()();
      v24 = 0x72656D6974;
      v25 = 0xE500000000000000;
      v20 = StringProtocol.contains<A>(_:)();
      swift_bridgeObjectRelease();
      if ((v20 & 1) == 0)
      {
        (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v4);
        swift_bridgeObjectRelease();
        goto LABEL_26;
      }
      if (v15 != 0x545F6E6F6D6D6F63 || v17 != 0xEC00000072656D69)
        goto LABEL_20;
    }
    swift_bridgeObjectRelease();
    v23 = 0;
    goto LABEL_22;
  }
  if (*(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    swift_retain();
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

void CorrectionsEngine.setUndoInvocation(directInvocation:context:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t *v5;
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
  NSObject *v16;
  uint64_t v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
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
  _QWORD v37[8];
  _QWORD v38[4];

  OUTLINED_FUNCTION_62();
  v3 = v2;
  v5 = v4;
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?);
  OUTLINED_FUNCTION_8_3();
  MEMORY[0x1E0C80A78](v7, v8);
  OUTLINED_FUNCTION_79();
  v9 = type metadata accessor for OSSignpostID();
  v28 = *(_QWORD *)(v9 - 8);
  v29 = v9;
  OUTLINED_FUNCTION_8_3();
  MEMORY[0x1E0C80A78](v10, v11);
  OUTLINED_FUNCTION_28_0();
  v13 = *v5;
  v12 = v5[1];
  v14 = v5[2];
  v15 = *v3;
  v35 = v3[2];
  v36 = v3[1];
  v33 = v3[4];
  v34 = v3[3];
  v31 = v3[6];
  v32 = v3[5];
  v30 = v3[7];
  if (one-time initialization token for log != -1)
    swift_once();
  v16 = (id)static Logger.log;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  if (one-time initialization token for logger != -1)
    swift_once();
  v17 = OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_3(v17, (uint64_t)static Logger.logger);
  v18 = OUTLINED_FUNCTION_38_0();
  if (os_log_type_enabled(v16, v18))
  {
    v19 = (uint8_t *)OUTLINED_FUNCTION_3_2();
    *(_WORD *)v19 = 0;
    OUTLINED_FUNCTION_10_2(&dword_1C2EAE000, v16, v18, "[CorrectionsEngine.setUndoInvocation] storing an undo direct invocation.", v19);
    OUTLINED_FUNCTION_0_4();
  }

  if (one-time initialization token for shared != -1)
    swift_once();
  v38[0] = v13;
  v38[1] = v12;
  v38[2] = v14;
  v37[0] = v15;
  v37[1] = v36;
  v37[2] = v35;
  v37[3] = v34;
  v37[4] = v33;
  v37[5] = v32;
  v37[6] = v31;
  v37[7] = v30;
  (*(void (**)(_QWORD *, _QWORD *))(*(_QWORD *)static CorrectionsSELFHelper.shared + 152))(v38, v37);
  if (one-time initialization token for parseStoredTime != -1)
    swift_once();
  v20 = __swift_project_value_buffer(v6, (uint64_t)static CorrectionsEngine.parseStoredTime);
  static Date.now.getter();
  v21 = type metadata accessor for Date();
  __swift_storeEnumTagSinglePayload(v1, 0, 1, v21);
  OUTLINED_FUNCTION_1_3();
  outlined assign with take of Date?(v1, v20);
  swift_endAccess();
  if (one-time initialization token for inverseDirectInvocation != -1)
    swift_once();
  OUTLINED_FUNCTION_1_3();
  v22 = static CorrectionsEngine.inverseDirectInvocation;
  v23 = qword_1ED799830;
  static CorrectionsEngine.inverseDirectInvocation = v13;
  qword_1ED799830 = v12;
  qword_1ED799838 = v14;
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_17_0();
  outlined consume of CorrectionsDirectInvocation?(v22, v23);
  if (one-time initialization token for context != -1)
    swift_once();
  v24 = (uint64_t *)static CorrectionsEngine.context;
  OUTLINED_FUNCTION_1_3();
  v25 = *v24;
  v26 = v24[1];
  *v24 = v15;
  v24[1] = v36;
  v24[2] = v35;
  v24[3] = v34;
  v24[4] = v33;
  v24[5] = v32;
  v24[6] = v31;
  v24[7] = v30;
  outlined copy of CorrectionsContext?(v15, v36);
  outlined consume of CorrectionsContext?(v25, v26);
  v27 = (id)static Logger.log;
  OUTLINED_FUNCTION_92();
  os_signpost(_:dso:log:name:signpostID:)();

  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v0, v29);
  OUTLINED_FUNCTION_11_1();
}

void CorrectionsEngine.checkUndo(input:context:correctionsOutcome:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t *v27;
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
  uint64_t v63;
  uint64_t v64;
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
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  _QWORD *v128;
  id v129;
  void (*v130)(uint64_t, uint64_t);
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void (*v134)(char *, uint64_t, uint64_t);
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  _QWORD *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  char v144;
  uint64_t v145;
  uint64_t *v146;
  uint64_t v147;
  uint64_t *v148;
  uint64_t v149;
  uint64_t v150;
  int EnumCaseMultiPayload;
  int v152;
  uint64_t v153;
  uint64_t v154;
  void (*v155)(char *, uint64_t, uint64_t);
  char *v156;
  void (*v157)(uint64_t, uint64_t);
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  void (*v161)(uint64_t, uint64_t);
  uint64_t v162;
  os_log_type_t v163;
  int v164;
  _WORD *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  void (*v169)(char *, uint64_t, uint64_t);
  char *v170;
  char v171;
  char *v172;
  uint64_t v173;
  os_log_type_t v174;
  _WORD *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  os_log_type_t v179;
  int v180;
  _WORD *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t (*v185)(uint64_t, uint64_t);
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  os_log_type_t v192;
  uint8_t *v193;
  uint64_t v194;
  NSObject *v195;
  os_log_type_t v196;
  uint8_t *v197;
  uint64_t v198;
  uint64_t v199;
  void (*v200)(NSObject *, uint64_t, uint64_t);
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  BOOL v206;
  NSObject *v207;
  double v208;
  uint64_t v209;
  os_log_type_t v210;
  _WORD *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  void (*v215)(uint64_t, uint64_t);
  uint64_t v216;
  uint64_t v217;
  os_log_type_t v218;
  _WORD *v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  void (*v223)(uint64_t, uint64_t);
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  BOOL v227;
  BOOL v228;
  uint64_t v229;
  os_log_type_t v230;
  int v231;
  _WORD *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  os_log_type_t v237;
  uint8_t *v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  os_log_type_t v245;
  int v246;
  _WORD *v247;
  uint64_t v248;
  uint64_t v249;
  id v250;
  uint64_t v251;
  void (*v252)(char *, uint64_t, uint64_t);
  uint64_t v253;
  unsigned int v254;
  char *v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  char *v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  NSObject *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  _QWORD *v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  _QWORD *v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  _QWORD v287[8];
  uint64_t v288;

  OUTLINED_FUNCTION_62();
  a19 = v23;
  a20 = v24;
  v283 = v25;
  v27 = v26;
  v274 = v28;
  v271 = v29;
  v261 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?);
  OUTLINED_FUNCTION_8_3();
  MEMORY[0x1E0C80A78](v30, v31);
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_26_0(v32);
  v33 = type metadata accessor for Date();
  OUTLINED_FUNCTION_36_0(v33, (uint64_t)&v286);
  v262 = v34;
  OUTLINED_FUNCTION_8_3();
  MEMORY[0x1E0C80A78](v35, v36);
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_26_0(v37);
  v38 = type metadata accessor for Siri_Nlu_External_UserParse();
  OUTLINED_FUNCTION_36_0(v38, (uint64_t)&a15);
  v257 = v39;
  OUTLINED_FUNCTION_8_3();
  MEMORY[0x1E0C80A78](v40, v41);
  OUTLINED_FUNCTION_11_2();
  v253 = v42;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UserDialogAct?);
  OUTLINED_FUNCTION_8_3();
  MEMORY[0x1E0C80A78](v43, v44);
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_6_3();
  MEMORY[0x1E0C80A78](v45, v46);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_6_3();
  MEMORY[0x1E0C80A78](v47, v48);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_6_3();
  MEMORY[0x1E0C80A78](v49, v50);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_6_3();
  MEMORY[0x1E0C80A78](v51, v52);
  v54 = OUTLINED_FUNCTION_58((uint64_t)&v251 - v53);
  OUTLINED_FUNCTION_36_0(v54, (uint64_t)&v288);
  v260 = v55;
  OUTLINED_FUNCTION_8_3();
  MEMORY[0x1E0C80A78](v56, v57);
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_6_3();
  MEMORY[0x1E0C80A78](v58, v59);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_6_3();
  MEMORY[0x1E0C80A78](v60, v61);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_6_3();
  MEMORY[0x1E0C80A78](v62, v63);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_6_3();
  MEMORY[0x1E0C80A78](v64, v65);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_6_3();
  MEMORY[0x1E0C80A78](v66, v67);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_6_3();
  MEMORY[0x1E0C80A78](v68, v69);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_6_3();
  MEMORY[0x1E0C80A78](v70, v71);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_6_3();
  MEMORY[0x1E0C80A78](v72, v73);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_6_3();
  MEMORY[0x1E0C80A78](v74, v75);
  OUTLINED_FUNCTION_26_0((uint64_t)&v251 - v76);
  v77 = type metadata accessor for Siri_Nlu_External_CorrectionOutcome();
  v263 = *(_QWORD *)(v77 - 8);
  OUTLINED_FUNCTION_8_3();
  MEMORY[0x1E0C80A78](v78, v79);
  OUTLINED_FUNCTION_11_2();
  v81 = OUTLINED_FUNCTION_26_0(v80);
  type metadata accessor for CorrectionsUSOParse(v81);
  OUTLINED_FUNCTION_8_3();
  MEMORY[0x1E0C80A78](v82, v83);
  OUTLINED_FUNCTION_11_2();
  v85 = OUTLINED_FUNCTION_26_0(v84);
  v273 = type metadata accessor for CorrectionsParse(v85);
  OUTLINED_FUNCTION_8_3();
  MEMORY[0x1E0C80A78](v86, v87);
  OUTLINED_FUNCTION_11_2();
  v280 = v88;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UserParse?);
  OUTLINED_FUNCTION_8_3();
  MEMORY[0x1E0C80A78](v89, v90);
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_6_3();
  v93 = MEMORY[0x1E0C80A78](v91, v92);
  OUTLINED_FUNCTION_74(v93, v94, v95, v96, v97, v98, v99, v100, v251);
  v101 = type metadata accessor for Siri_Nlu_External_CorrectionOutcome.CorrectionType();
  v284 = *(_QWORD *)(v101 - 8);
  OUTLINED_FUNCTION_8_3();
  MEMORY[0x1E0C80A78](v102, v103);
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_6_3();
  MEMORY[0x1E0C80A78](v104, v105);
  v259 = (char *)&v251 - v106;
  v107 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (Siri_Nlu_External_CorrectionOutcome.CorrectionType?, Siri_Nlu_External_CorrectionOutcome.CorrectionType?));
  OUTLINED_FUNCTION_8_3();
  MEMORY[0x1E0C80A78](v108, v109);
  OUTLINED_FUNCTION_79();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_CorrectionOutcome?);
  OUTLINED_FUNCTION_8_3();
  MEMORY[0x1E0C80A78](v110, v111);
  OUTLINED_FUNCTION_28_0();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_CorrectionOutcome.CorrectionType?);
  OUTLINED_FUNCTION_8_3();
  MEMORY[0x1E0C80A78](v112, v113);
  OUTLINED_FUNCTION_54();
  v116 = MEMORY[0x1E0C80A78](v114, v115);
  v118 = (char *)&v251 - v117;
  MEMORY[0x1E0C80A78](v116, v119);
  v121 = (char *)&v251 - v120;
  v122 = type metadata accessor for OSSignpostID();
  OUTLINED_FUNCTION_36_0(v122, (uint64_t)&a11);
  v272 = v123;
  OUTLINED_FUNCTION_8_3();
  MEMORY[0x1E0C80A78](v124, v125);
  OUTLINED_FUNCTION_17();
  v128 = (_QWORD *)(v127 - v126);
  v277 = *v27;
  v282 = v27[1];
  v276 = v27[2];
  v279 = v27[3];
  v267 = v27[4];
  v268 = v27[5];
  v269 = v27[6];
  v270 = v27[7];
  if (one-time initialization token for log != -1)
    swift_once();
  v129 = (id)static Logger.log;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  v281 = v128;
  os_signpost(_:dso:log:name:signpostID:)();

  outlined init with copy of CorrectionsCustomizing?(v283, v20, &demangling cache variable for type metadata for Siri_Nlu_External_CorrectionOutcome?);
  OUTLINED_FUNCTION_23_0(v20, 1, v77);
  v258 = v77;
  if (v144)
  {
    outlined destroy of CorrectionsCustomizing?(v20, &demangling cache variable for type metadata for Siri_Nlu_External_CorrectionOutcome?);
    v131 = 1;
  }
  else
  {
    Siri_Nlu_External_CorrectionOutcome.type.getter();
    OUTLINED_FUNCTION_65();
    v130(v20, v77);
    v131 = 0;
  }
  OUTLINED_FUNCTION_108((uint64_t)v121, v131);
  v132 = *MEMORY[0x1E0D9F6F8];
  OUTLINED_FUNCTION_99();
  v134 = *(void (**)(char *, uint64_t, uint64_t))(v133 + 104);
  v134(v118, v132, v101);
  OUTLINED_FUNCTION_108((uint64_t)v118, 0);
  v135 = v22 + *(int *)(v107 + 48);
  outlined init with copy of CorrectionsCustomizing?((uint64_t)v121, v22, &demangling cache variable for type metadata for Siri_Nlu_External_CorrectionOutcome.CorrectionType?);
  v136 = OUTLINED_FUNCTION_55();
  outlined init with copy of CorrectionsCustomizing?(v136, v137, &demangling cache variable for type metadata for Siri_Nlu_External_CorrectionOutcome.CorrectionType?);
  OUTLINED_FUNCTION_23_0(v22, 1, v101);
  v138 = v278;
  v254 = v132;
  if (v144)
  {
    outlined destroy of CorrectionsCustomizing?((uint64_t)v118, &demangling cache variable for type metadata for Siri_Nlu_External_CorrectionOutcome.CorrectionType?);
    outlined destroy of CorrectionsCustomizing?((uint64_t)v121, &demangling cache variable for type metadata for Siri_Nlu_External_CorrectionOutcome.CorrectionType?);
    OUTLINED_FUNCTION_23_0(v135, 1, v101);
    v139 = v275;
    if (v144)
    {
      outlined destroy of CorrectionsCustomizing?(v22, &demangling cache variable for type metadata for Siri_Nlu_External_CorrectionOutcome.CorrectionType?);
      v140 = 0;
      v141 = 8;
      v142 = 1;
      OUTLINED_FUNCTION_81();
      v143 = v138;
      goto LABEL_17;
    }
    goto LABEL_14;
  }
  outlined init with copy of CorrectionsCustomizing?(v22, v21, &demangling cache variable for type metadata for Siri_Nlu_External_CorrectionOutcome.CorrectionType?);
  OUTLINED_FUNCTION_23_0(v135, 1, v101);
  if (v144)
  {
    v145 = OUTLINED_FUNCTION_55();
    outlined destroy of CorrectionsCustomizing?(v145, v146);
    v147 = OUTLINED_FUNCTION_6_1();
    outlined destroy of CorrectionsCustomizing?(v147, v148);
    OUTLINED_FUNCTION_99();
    (*(void (**)(uint64_t, uint64_t))(v149 + 8))(v21, v101);
    v139 = v275;
LABEL_14:
    outlined destroy of CorrectionsCustomizing?(v22, &demangling cache variable for type metadata for (Siri_Nlu_External_CorrectionOutcome.CorrectionType?, Siri_Nlu_External_CorrectionOutcome.CorrectionType?));
    v143 = v138;
    goto LABEL_15;
  }
  v168 = v284;
  v169 = *(void (**)(char *, uint64_t, uint64_t))(v284 + 32);
  v252 = v134;
  v170 = v259;
  v169(v259, v135, v101);
  lazy protocol witness table accessor for type Siri_Nlu_External_CorrectionOutcome.CorrectionType and conformance Siri_Nlu_External_CorrectionOutcome.CorrectionType(&lazy protocol witness table cache variable for type Siri_Nlu_External_CorrectionOutcome.CorrectionType and conformance Siri_Nlu_External_CorrectionOutcome.CorrectionType, MEMORY[0x1E0D9F710]);
  v171 = dispatch thunk of static Equatable.== infix(_:_:)();
  v132 = *(_QWORD *)(v168 + 8);
  v172 = v170;
  v134 = v252;
  ((void (*)(char *, uint64_t))v132)(v172, v101);
  OUTLINED_FUNCTION_91((uint64_t)v118);
  OUTLINED_FUNCTION_91((uint64_t)v121);
  ((void (*)(uint64_t, uint64_t))v132)(v21, v101);
  v143 = v138;
  OUTLINED_FUNCTION_91(v22);
  v139 = v275;
  if ((v171 & 1) != 0)
  {
    v140 = 0;
    v141 = 8;
    v142 = 1;
    goto LABEL_16;
  }
LABEL_15:
  v142 = 0;
  v141 = 7;
  v140 = 1;
LABEL_16:
  OUTLINED_FUNCTION_81();
LABEL_17:
  v150 = v280;
  __swift_storeEnumTagSinglePayload(v285, 1, 1, v132);
  outlined init with copy of CorrectionsParse(v274, v150);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    outlined init with take of CorrectionsUSOParse(v150, v266);
    v153 = v258;
    OUTLINED_FUNCTION_23_0(v283, 1, v258);
    if (v144)
    {
      v154 = v256;
      Siri_Nlu_External_UserParse.correctionOutcome.getter();
      v155 = v134;
      v156 = v259;
      Siri_Nlu_External_CorrectionOutcome.type.getter();
      OUTLINED_FUNCTION_65();
      v157(v154, v153);
      v158 = v255;
      v155((char *)v255, v254, v101);
      lazy protocol witness table accessor for type Siri_Nlu_External_CorrectionOutcome.CorrectionType and conformance Siri_Nlu_External_CorrectionOutcome.CorrectionType(&lazy protocol witness table cache variable for type Siri_Nlu_External_CorrectionOutcome.CorrectionType and conformance Siri_Nlu_External_CorrectionOutcome.CorrectionType, MEMORY[0x1E0D9F718]);
      OUTLINED_FUNCTION_86();
      OUTLINED_FUNCTION_86();
      v140 = v287[0];
      v159 = v286;
      OUTLINED_FUNCTION_99();
      v161 = *(void (**)(uint64_t, uint64_t))(v160 + 8);
      v161(v158, v101);
      v161((uint64_t)v156, v101);
      if (v140 != v159)
        goto LABEL_36;
    }
    else if ((_DWORD)v140)
    {
LABEL_36:
      OUTLINED_FUNCTION_69();
      OUTLINED_FUNCTION_43();
    }
    OUTLINED_FUNCTION_69();
    if (one-time initialization token for logger != -1)
      swift_once();
    v173 = OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_5_3(v173, (uint64_t)static Logger.logger);
    v174 = OUTLINED_FUNCTION_14_1();
    if (OUTLINED_FUNCTION_2_5(v174))
    {
      v175 = (_WORD *)OUTLINED_FUNCTION_3_2();
      OUTLINED_FUNCTION_16_0(v175);
      OUTLINED_FUNCTION_1_5(&dword_1C2EAE000, v176, v177, "[CorrectionsEngine.checkUndo] Corrections signal detected");
      OUTLINED_FUNCTION_0_4();
    }

    OUTLINED_FUNCTION_96(8);
    if (one-time initialization token for logger != -1)
      swift_once();
    v194 = OUTLINED_FUNCTION_3();
    v195 = __swift_project_value_buffer(v194, (uint64_t)static Logger.logger);
    Logger.logObject.getter();
    v196 = OUTLINED_FUNCTION_38_0();
    if (os_log_type_enabled(v195, v196))
    {
      v197 = (uint8_t *)OUTLINED_FUNCTION_3_2();
      *(_WORD *)v197 = 0;
      OUTLINED_FUNCTION_10_2(&dword_1C2EAE000, v195, v196, "[CorrectionsEngine.checkUndo] undo request detected in uso", v197);
      OUTLINED_FUNCTION_0_4();
    }

    OUTLINED_FUNCTION_43();
  }
  if (EnumCaseMultiPayload == 1)
  {
    objc_opt_self();
    v140 = OUTLINED_FUNCTION_100();
    objc_opt_self();
    if (OUTLINED_FUNCTION_100())
    {
      if (v140)
        v152 = 1;
      else
        v152 = 2;
    }
    else
    {
      if (!v140)
      {
        OUTLINED_FUNCTION_105();
        if (one-time initialization token for logger != -1)
          swift_once();
        v244 = OUTLINED_FUNCTION_3();
        OUTLINED_FUNCTION_5_3(v244, (uint64_t)static Logger.logger);
        v245 = OUTLINED_FUNCTION_14_1();
        OUTLINED_FUNCTION_2_5(v245);
        OUTLINED_FUNCTION_60();
        if (v246)
        {
          v247 = (_WORD *)OUTLINED_FUNCTION_3_2();
          OUTLINED_FUNCTION_16_0(v247);
          OUTLINED_FUNCTION_1_5(&dword_1C2EAE000, v248, v249, "[CorrectionsEngine.checkUndo] undo was not requested");
          OUTLINED_FUNCTION_0_4();
        }

        if (one-time initialization token for shared != -1)
          swift_once();
        v222 = OUTLINED_FUNCTION_0_5();
        v224 = v141;
        goto LABEL_129;
      }
      v152 = 1;
    }
    OUTLINED_FUNCTION_96(v152);
    if (one-time initialization token for logger != -1)
      swift_once();
    v191 = OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_5_3(v191, (uint64_t)static Logger.logger);
    v192 = OUTLINED_FUNCTION_38_0();
    if (OUTLINED_FUNCTION_30_0(v192))
    {
      v193 = (uint8_t *)OUTLINED_FUNCTION_3_2();
      *(_WORD *)v193 = 0;
      OUTLINED_FUNCTION_10_2(&dword_1C2EAE000, v142, (os_log_type_t)v141, "[CorrectionsEngine.checkUndo] undo request detected in NLv4", v193);
      OUTLINED_FUNCTION_0_4();
    }

    OUTLINED_FUNCTION_105();
    v140 = 2;
    OUTLINED_FUNCTION_93();
LABEL_62:
    if (one-time initialization token for parseStoredTime != -1)
      swift_once();
    v198 = __swift_project_value_buffer(v261, (uint64_t)static CorrectionsEngine.parseStoredTime);
    OUTLINED_FUNCTION_16();
    outlined init with copy of CorrectionsCustomizing?(v198, v141, (uint64_t *)&demangling cache variable for type metadata for Date?);
    v199 = v265;
    OUTLINED_FUNCTION_23_0(v141, 1, v265);
    if (v144)
    {
      outlined destroy of CorrectionsCustomizing?(v141, (uint64_t *)&demangling cache variable for type metadata for Date?);
      OUTLINED_FUNCTION_60();
    }
    else
    {
      OUTLINED_FUNCTION_61();
      v200(v264, v141, v199);
      if (one-time initialization token for inverseDirectInvocation != -1)
        swift_once();
      OUTLINED_FUNCTION_16();
      v201 = qword_1ED799830;
      v139 = v281;
      if (qword_1ED799830)
      {
        v202 = static CorrectionsEngine.inverseDirectInvocation;
        v203 = qword_1ED799838;
        v204 = one-time initialization token for context;
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_56();
        if (v204 != -1)
          swift_once();
        v139 = (_QWORD *)static CorrectionsEngine.context;
        OUTLINED_FUNCTION_16();
        v205 = v139[1];
        v206 = v205 == 1 || v282 == 1;
        if (v206
          || ((v225 = v139[2], v226 = v139[3], !v205)
           || !v282
           || (*v139 == v277 ? (v227 = v205 == v282) : (v227 = 0), v227 || (OUTLINED_FUNCTION_13_0() & 1) != 0))
          && (!v226
           || !v279
           || (v225 == v276 ? (v228 = v226 == v279) : (v228 = 0), v228 || (OUTLINED_FUNCTION_13_0() & 1) != 0)))
        {
          v207 = v264;
          Date.timeIntervalSinceNow.getter();
          if (v208 >= -30.0)
          {
            v139 = v281;
            if (one-time initialization token for logger != -1)
              swift_once();
            v236 = OUTLINED_FUNCTION_3();
            OUTLINED_FUNCTION_5_3(v236, (uint64_t)static Logger.logger);
            v237 = OUTLINED_FUNCTION_38_0();
            if (os_log_type_enabled(v207, v237))
            {
              v238 = (uint8_t *)OUTLINED_FUNCTION_3_2();
              *(_WORD *)v238 = 0;
              OUTLINED_FUNCTION_10_2(&dword_1C2EAE000, v207, v237, "[CorrectionsEngine.checkUndo] undo action being returned", v238);
              OUTLINED_FUNCTION_60();
              OUTLINED_FUNCTION_0_4();
            }

            if (one-time initialization token for shared != -1)
              swift_once();
            v287[0] = v277;
            v287[1] = v282;
            v287[2] = v276;
            v287[3] = v279;
            v287[4] = v267;
            v287[5] = v268;
            v287[6] = v269;
            v287[7] = v270;
            (*(void (**)(uint64_t, _QWORD, _QWORD *))(*(_QWORD *)static CorrectionsSELFHelper.shared + 144))(2, v284, v287);
            OUTLINED_FUNCTION_20_0((uint64_t)v264, *(uint64_t (**)(uint64_t, _QWORD))(v262 + 8));
            v140 = OUTLINED_FUNCTION_37_0();
            v239 = v271;
            outlined init with take of Siri_Nlu_External_UserParse?(v285, v271 + *(int *)(v140 + 24));
            *(_QWORD *)v239 = v202;
            *(_QWORD *)(v239 + 8) = v201;
            *(_QWORD *)(v239 + 16) = v203;
            *(_BYTE *)(v239 + 24) = 1;
            v240 = v239;
            v241 = 0;
            v242 = 1;
            v243 = v140;
            goto LABEL_131;
          }
          OUTLINED_FUNCTION_59();
          v139 = v281;
          if (one-time initialization token for logger != -1)
            swift_once();
          v209 = OUTLINED_FUNCTION_3();
          OUTLINED_FUNCTION_5_3(v209, (uint64_t)static Logger.logger);
          v210 = OUTLINED_FUNCTION_14_1();
          if (OUTLINED_FUNCTION_2_5(v210))
          {
            v211 = (_WORD *)OUTLINED_FUNCTION_3_2();
            OUTLINED_FUNCTION_16_0(v211);
            OUTLINED_FUNCTION_1_5(&dword_1C2EAE000, v212, v213, "[CorrectionsEngine.checkUndo] undo action has gone stale.");
            OUTLINED_FUNCTION_0_4();
          }

          v140 = v285;
          if (one-time initialization token for shared != -1)
            swift_once();
          v214 = OUTLINED_FUNCTION_0_5();
          v216 = 4;
        }
        else
        {
          OUTLINED_FUNCTION_59();
          if (one-time initialization token for logger != -1)
            swift_once();
          v229 = OUTLINED_FUNCTION_3();
          OUTLINED_FUNCTION_5_3(v229, (uint64_t)static Logger.logger);
          v230 = OUTLINED_FUNCTION_14_1();
          OUTLINED_FUNCTION_2_5(v230);
          OUTLINED_FUNCTION_60();
          if (v231)
          {
            v232 = (_WORD *)OUTLINED_FUNCTION_3_2();
            OUTLINED_FUNCTION_16_0(v232);
            OUTLINED_FUNCTION_1_5(&dword_1C2EAE000, v233, v234, "[CorrectionsEngine.checkUndo] mismatched context.");
            OUTLINED_FUNCTION_0_4();
          }

          v140 = v285;
          if (one-time initialization token for shared != -1)
            swift_once();
          v214 = OUTLINED_FUNCTION_0_5();
          v216 = 5;
        }
        v215(v214, v216);
        OUTLINED_FUNCTION_20_0((uint64_t)v264, *(uint64_t (**)(uint64_t, _QWORD))(v262 + 8));
        v235 = v140;
LABEL_130:
        outlined destroy of CorrectionsCustomizing?(v235, &demangling cache variable for type metadata for Siri_Nlu_External_UserParse?);
        OUTLINED_FUNCTION_37_0();
        v240 = OUTLINED_FUNCTION_73();
LABEL_131:
        __swift_storeEnumTagSinglePayload(v240, v241, v242, v243);
        goto LABEL_132;
      }
      (*(void (**)(NSObject *, uint64_t))(v262 + 8))(v264, v199);
    }
    if (one-time initialization token for logger != -1)
      swift_once();
    v217 = OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_5_3(v217, (uint64_t)static Logger.logger);
    v218 = OUTLINED_FUNCTION_14_1();
    if (OUTLINED_FUNCTION_2_5(v218))
    {
      v219 = (_WORD *)OUTLINED_FUNCTION_3_2();
      OUTLINED_FUNCTION_16_0(v219);
      OUTLINED_FUNCTION_1_5(&dword_1C2EAE000, v220, v221, "[CorrectionsEngine.checkUndo] nothing to undo.");
      OUTLINED_FUNCTION_0_4();
    }

    if (one-time initialization token for shared != -1)
      swift_once();
    v222 = OUTLINED_FUNCTION_0_5();
    v224 = 3;
LABEL_129:
    v223(v222, v224);
    v235 = v285;
    goto LABEL_130;
  }
  if ((v142 & 1) != 0)
  {
    if (one-time initialization token for logger != -1)
      swift_once();
    v162 = OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_5_3(v162, (uint64_t)static Logger.logger);
    v163 = OUTLINED_FUNCTION_14_1();
    OUTLINED_FUNCTION_2_5(v163);
    OUTLINED_FUNCTION_93();
    if (v164)
    {
      v165 = (_WORD *)OUTLINED_FUNCTION_3_2();
      OUTLINED_FUNCTION_16_0(v165);
      OUTLINED_FUNCTION_1_5(&dword_1C2EAE000, v166, v167, "[CorrectionsEngine.checkUndo] this is not nlv4 or uso parse, but correction signal is present");
      OUTLINED_FUNCTION_0_4();
    }

    outlined destroy of CorrectionsParse(v150, type metadata accessor for CorrectionsParse);
    v140 = 2;
    OUTLINED_FUNCTION_96(8);
    goto LABEL_62;
  }
  if (one-time initialization token for logger != -1)
    swift_once();
  v178 = OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_3(v178, (uint64_t)static Logger.logger);
  v179 = OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_2_5(v179);
  OUTLINED_FUNCTION_60();
  if (v180)
  {
    v181 = (_WORD *)OUTLINED_FUNCTION_3_2();
    OUTLINED_FUNCTION_16_0(v181);
    OUTLINED_FUNCTION_1_5(&dword_1C2EAE000, v182, v183, "[CorrectionsEngine.checkUndo] this is not nlv4 or uso parse");
    OUTLINED_FUNCTION_0_4();
  }

  if (one-time initialization token for shared != -1)
    swift_once();
  v184 = OUTLINED_FUNCTION_0_5();
  v186 = v185(v184, 6);
  OUTLINED_FUNCTION_27_0(v186, &demangling cache variable for type metadata for Siri_Nlu_External_UserParse?);
  OUTLINED_FUNCTION_37_0();
  v187 = OUTLINED_FUNCTION_73();
  __swift_storeEnumTagSinglePayload(v187, v188, v189, v190);
  outlined destroy of CorrectionsParse(v150, type metadata accessor for CorrectionsParse);
LABEL_132:
  v250 = (id)static Logger.log;
  OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_51();

  (*(void (**)(_QWORD *, uint64_t))(v272 + 8))(v139, v143);
  OUTLINED_FUNCTION_11_1();
}

uint64_t specialized RangeReplaceableCollection.removeFirst()@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UserDialogAct?);
  result = MEMORY[0x1E0C80A78](v3, v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  if (!*(_QWORD *)(*v1 + 16))
  {
    __break(1u);
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  specialized Collection.first.getter(*v1, (uint64_t)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = type metadata accessor for Siri_Nlu_External_UserDialogAct();
  result = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  if ((_DWORD)result != 1)
  {
    result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, v7, v9);
    if (*(_QWORD *)(v8 + 16))
      return specialized Array.replaceSubrange<A>(_:with:)(0, 1);
    goto LABEL_6;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t UndoAction.init(directInvocation:isExclusive:parseExludingUndoUserDialogActs:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;

  v6 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)a4 = *(_OWORD *)a1;
  *(_QWORD *)(a4 + 16) = v6;
  *(_BYTE *)(a4 + 24) = a2;
  v7 = a4 + *(int *)(OUTLINED_FUNCTION_37_0() + 24);
  return outlined init with take of Siri_Nlu_External_UserParse?(a3, v7);
}

Swift::Bool __swiftcall CorrectionsEngine.isUndoPossible(context:)(SiriCorrections::CorrectionsContext_optional *context)
{
  NSObject *v1;
  objc_class **v2;
  objc_class **v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  objc_class *v14;
  objc_class *v15;
  objc_class *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  double v20;
  uint64_t v21;
  os_log_type_t v22;
  uint8_t *v23;
  const char *v24;
  uint64_t v25;
  os_log_type_t v26;
  _WORD *v27;
  uint64_t v28;
  uint64_t v29;
  Class isa;
  Class v32;
  BOOL v33;
  BOOL v34;
  uint64_t v35;
  os_log_type_t v36;

  OUTLINED_FUNCTION_62();
  v3 = v2;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?);
  OUTLINED_FUNCTION_8_3();
  MEMORY[0x1E0C80A78](v5, v6);
  OUTLINED_FUNCTION_17();
  v9 = v8 - v7;
  v10 = (_QWORD *)type metadata accessor for Date();
  v11 = *(v10 - 1);
  MEMORY[0x1E0C80A78](v10, v12);
  OUTLINED_FUNCTION_28_0();
  v14 = *v3;
  v13 = v3[1];
  v16 = v3[2];
  v15 = v3[3];
  if (one-time initialization token for parseStoredTime != -1)
    swift_once();
  v17 = __swift_project_value_buffer(v4, (uint64_t)static CorrectionsEngine.parseStoredTime);
  OUTLINED_FUNCTION_16();
  outlined init with copy of CorrectionsCustomizing?(v17, v9, (uint64_t *)&demangling cache variable for type metadata for Date?);
  v18 = OUTLINED_FUNCTION_23_0(v9, 1, (uint64_t)v10);
  if (v33)
  {
    OUTLINED_FUNCTION_72(v18, (uint64_t *)&demangling cache variable for type metadata for Date?);
LABEL_17:
    if (one-time initialization token for logger != -1)
      swift_once();
    v25 = OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_5_3(v25, (uint64_t)static Logger.logger);
    v26 = OUTLINED_FUNCTION_14_1();
    if (OUTLINED_FUNCTION_2_5(v26))
    {
      v27 = (_WORD *)OUTLINED_FUNCTION_3_2();
      OUTLINED_FUNCTION_16_0(v27);
      OUTLINED_FUNCTION_1_5(&dword_1C2EAE000, v28, v29, "[CorrectionsEngine.isUndoPossible] nothing to undo.");
      OUTLINED_FUNCTION_0_4();
    }

    return 0;
  }
  (*(void (**)(NSObject *, uint64_t, _QWORD *))(v11 + 32))(v1, v9, v10);
  if (one-time initialization token for inverseDirectInvocation != -1)
    swift_once();
  OUTLINED_FUNCTION_16();
  if (!qword_1ED799830)
  {
    OUTLINED_FUNCTION_31_0();
    goto LABEL_17;
  }
  v19 = v1;
  Date.timeIntervalSinceNow.getter();
  if (v20 < -30.0)
  {
    if (one-time initialization token for logger != -1)
      swift_once();
    v21 = OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_5_3(v21, (uint64_t)static Logger.logger);
    v22 = OUTLINED_FUNCTION_38_0();
    if (OUTLINED_FUNCTION_30_0(v22))
    {
      v23 = (uint8_t *)OUTLINED_FUNCTION_3_2();
      *(_WORD *)v23 = 0;
      v24 = "[CorrectionsEngine.isUndoPossible] undo action has gone stale.";
      goto LABEL_14;
    }
LABEL_15:

    OUTLINED_FUNCTION_31_0();
    return 0;
  }
  if (v13 != (objc_class *)1)
  {
    if (one-time initialization token for context != -1)
      swift_once();
    v19 = static CorrectionsEngine.context;
    OUTLINED_FUNCTION_16();
    isa = v19[1].isa;
    if (isa != (Class)1)
    {
      v32 = v19[3].isa;
      if (v32)
      {
        if (!v15)
          goto LABEL_47;
        v33 = v19[2].isa == v16 && v32 == v15;
        if (!v33)
        {
          if ((OUTLINED_FUNCTION_13_0() & 1) == 0)
            goto LABEL_47;
          isa = v19[1].isa;
          if (isa == (Class)1)
            goto LABEL_46;
        }
      }
      else if (v15)
      {
        goto LABEL_47;
      }
      if (isa)
      {
        if (v13)
        {
          v34 = v19->isa == v14 && isa == v13;
          if (v34 || (OUTLINED_FUNCTION_13_0() & 1) != 0)
            goto LABEL_27;
        }
        goto LABEL_47;
      }
LABEL_46:
      swift_bridgeObjectRelease();
      if (!v13)
        goto LABEL_27;
LABEL_47:
      if (one-time initialization token for logger != -1)
        swift_once();
      v35 = OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_5_3(v35, (uint64_t)static Logger.logger);
      v36 = OUTLINED_FUNCTION_38_0();
      if (OUTLINED_FUNCTION_30_0(v36))
      {
        v23 = (uint8_t *)OUTLINED_FUNCTION_3_2();
        *(_WORD *)v23 = 0;
        v24 = "[CorrectionsEngine.isUndoPossible] Correction is not possible with the given context.";
LABEL_14:
        OUTLINED_FUNCTION_10_2(&dword_1C2EAE000, v19, (os_log_type_t)v13, v24, v23);
        OUTLINED_FUNCTION_0_4();
      }
      goto LABEL_15;
    }
  }
LABEL_27:
  OUTLINED_FUNCTION_31_0();
  return 1;
}

Swift::Void __swiftcall CorrectionsEngine.commit()()
{
  void *v0;
  uint64_t v1;
  os_log_type_t v2;
  _WORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (one-time initialization token for logger != -1)
    swift_once();
  v1 = OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_3(v1, (uint64_t)static Logger.logger);
  v2 = OUTLINED_FUNCTION_14_1();
  if (OUTLINED_FUNCTION_2_5(v2))
  {
    v3 = (_WORD *)OUTLINED_FUNCTION_3_2();
    OUTLINED_FUNCTION_16_0(v3);
    OUTLINED_FUNCTION_1_5(&dword_1C2EAE000, v4, v5, "[CorrectionsEngine.commit] clearing corrections context");
    OUTLINED_FUNCTION_0_4();
  }

  if (one-time initialization token for inverseDirectInvocation != -1)
    swift_once();
  OUTLINED_FUNCTION_1_3();
  v6 = static CorrectionsEngine.inverseDirectInvocation;
  v7 = qword_1ED799830;
  qword_1ED799830 = 0;
  qword_1ED799838 = 0;
  static CorrectionsEngine.inverseDirectInvocation = 0;
  outlined consume of CorrectionsDirectInvocation?(v6, v7);
  if (one-time initialization token for context != -1)
    swift_once();
  v8 = static CorrectionsEngine.context;
  OUTLINED_FUNCTION_1_3();
  v9 = *(_QWORD *)v8;
  v10 = *(_QWORD *)(v8 + 8);
  *(_OWORD *)v8 = xmmword_1C2EC31C0;
  *(_OWORD *)(v8 + 16) = 0u;
  *(_OWORD *)(v8 + 32) = 0u;
  *(_OWORD *)(v8 + 48) = 0u;
  outlined consume of CorrectionsContext?(v9, v10);
}

uint64_t CorrectionsEngine.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t CorrectionsEngine.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t protocol witness for Corrections.checkCorrection(input:) in conformance CorrectionsEngine()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 104))();
}

uint64_t protocol witness for Corrections.setUndoInvocation(directInvocation:context:) in conformance CorrectionsEngine()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 120))();
}

uint64_t protocol witness for Corrections.checkUndo(input:context:correctionsOutcome:) in conformance CorrectionsEngine()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 128))();
}

uint64_t UndoAction.directInvocation.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = v1[1];
  v3 = v1[2];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = v3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t UndoAction.isExclusive.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 24);
}

void UndoAction.parseExludingUndoUserDialogActs.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_37_0();
  outlined init with copy of CorrectionsCustomizing?(v1 + *(int *)(v3 + 24), a1, &demangling cache variable for type metadata for Siri_Nlu_External_UserParse?);
}

uint64_t UndoAction.init(directInvocation:isExclusive:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)a3 = *(_OWORD *)a1;
  *(_QWORD *)(a3 + 16) = v4;
  *(_BYTE *)(a3 + 24) = a2;
  v5 = a3 + *(int *)(OUTLINED_FUNCTION_37_0() + 24);
  v6 = type metadata accessor for Siri_Nlu_External_UserParse();
  return __swift_storeEnumTagSinglePayload(v5, 1, 1, v6);
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, uint64_t a4)
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
  uint64_t v17;
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
        goto LABEL_24;
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
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Siri_Nlu_External_UserDialogAct>);
  v10 = *(_QWORD *)(type metadata accessor for Siri_Nlu_External_UserDialogAct() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_24:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for Siri_Nlu_External_UserDialogAct() - 8) + 80);
  v17 = (v16 + 32) & ~v16;
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    specialized UnsafeMutablePointer.moveInitialize(from:count:)(a4 + v17, v8, v18);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, v18, a4);
  }
  return (uint64_t)v13;
}

uint64_t specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(type metadata accessor for Siri_Nlu_External_UserDialogAct() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
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
    v5 = a4 + 24 * a1 + 32;
    v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
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
      swift_bridgeObjectRelease();
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
    v5 = a4 + 40 * a1 + 32;
    v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized UnsafeMutablePointer.moveInitialize(from:count:)(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a2 < 0)
  {
    result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (a3 < a1
         || (result = type metadata accessor for Siri_Nlu_External_UserDialogAct(),
             a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    type metadata accessor for Siri_Nlu_External_UserDialogAct();
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *specialized UnsafeMutablePointer.moveInitialize(from:count:)(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[24 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 24 * a2);
  }
  return __src;
}

{
  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }
  return __src;
}

{
  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[40 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 40 * a2);
  }
  return __src;
}

uint64_t specialized UnsafeMutablePointer.initialize(from:count:)(unint64_t a1, uint64_t a2, unint64_t a3)
{
  BOOL v3;
  uint64_t result;

  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (v3 = a1 + 8 * a2 > a3) : (v3 = 0), v3))
  {
    result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    type metadata accessor for UsoEntity();
    return swift_arrayInitWithCopy();
  }
  return result;
}

{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0 && (a3 + 32 * a2 <= a1 || a1 + 32 * a2 <= a3))
    return swift_arrayInitWithCopy();
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0 && (a3 + 40 * a2 <= a1 || a1 + 40 * a2 <= a3))
    return swift_arrayInitWithCopy();
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized Array.replaceSubrange<A>(_:with:)(uint64_t result, int64_t a2)
{
  uint64_t *v2;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  int64_t v9;
  int isUniquelyReferenced_nonNull_native;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;

  if (result < 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v6 = result;
  v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v8 = result - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > *(_QWORD *)(v4 + 24) >> 1)
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  v12 = *(_QWORD *)(type metadata accessor for Siri_Nlu_External_UserDialogAct() - 8);
  v13 = v4 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  v14 = *(_QWORD *)(v12 + 72);
  v15 = v13 + v14 * v6;
  result = swift_arrayDestroy();
  if (!v7)
    goto LABEL_16;
  v16 = *(_QWORD *)(v4 + 16);
  if (__OFSUB__(v16, a2))
    goto LABEL_22;
  result = specialized UnsafeMutablePointer.moveInitialize(from:count:)(v13 + v14 * a2, v16 - a2, v15);
  v17 = *(_QWORD *)(v4 + 16);
  v18 = __OFADD__(v17, v8);
  v19 = v17 - v7;
  if (!v18)
  {
    *(_QWORD *)(v4 + 16) = v19;
LABEL_16:
    *v2 = v4;
    return result;
  }
LABEL_23:
  __break(1u);
  return result;
}

uint64_t specialized Array.replaceSubrange<A>(_:with:)(uint64_t result, int64_t a2, uint64_t a3)
{
  char **v3;
  char *v5;
  int64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;
  char *isUniquelyReferenced_nonNull_native;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  __int128 v19;

  if (result < 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  v5 = *v3;
  v6 = *((_QWORD *)*v3 + 2);
  if (v6 < a2)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v7 = result;
  v8 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = 1 - v8;
  if (__OFSUB__(1, v8))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v10 = v6 + v9;
  if (__OFADD__(v6, v9))
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v10 > *((_QWORD *)v5 + 3) >> 1)
  {
    if (v6 <= v10)
      v13 = v6 + v9;
    else
      v13 = v6;
    v5 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(isUniquelyReferenced_nonNull_native, v13, 1, (uint64_t)v5);
  }
  v14 = (uint64_t)&v5[40 * v7 + 32];
  result = swift_arrayDestroy();
  if (!v9)
    goto LABEL_16;
  v15 = *((_QWORD *)v5 + 2);
  if (__OFSUB__(v15, a2))
    goto LABEL_22;
  result = (uint64_t)specialized UnsafeMutablePointer.moveInitialize(from:count:)(&v5[40 * a2 + 32], v15 - a2, (char *)(v14 + 40));
  v16 = *((_QWORD *)v5 + 2);
  v17 = __OFADD__(v16, v9);
  v18 = v16 + v9;
  if (!v17)
  {
    *((_QWORD *)v5 + 2) = v18;
LABEL_16:
    v19 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)v14 = *(_OWORD *)a3;
    *(_OWORD *)(v14 + 16) = v19;
    *(_BYTE *)(v14 + 32) = *(_BYTE *)(a3 + 32);
    *v3 = v5;
    return result;
  }
LABEL_23:
  __break(1u);
  return result;
}

unint64_t specialized Array._checkSubscript(_:wasNativeTypeChecked:)(unint64_t result, char a2, uint64_t a3)
{
  if ((a2 & 1) != 0)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > result)
    {
      return result;
    }
    __break(1u);
  }
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

void (*specialized protocol witness for Collection.subscript.read in conformance [A](uint64_t **a1, unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  uint64_t *v6;

  v6 = (uint64_t *)malloc(0x28uLL);
  *a1 = v6;
  v6[4] = (uint64_t)specialized Array.subscript.read(v6, a2, a3);
  return protocol witness for Collection.subscript.read in conformance [A]specialized ;
}

void protocol witness for Collection.subscript.read in conformance [A]specialized (_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*specialized Array.subscript.read(uint64_t *a1, unint64_t a2, uint64_t a3))()
{
  unint64_t v6;
  uint64_t v7;

  v6 = a3 & 0xC000000000000001;
  specialized Array._checkSubscript(_:wasNativeTypeChecked:)(a2, (a3 & 0xC000000000000001) == 0, a3);
  if (v6)
    v7 = MEMORY[0x1C3BCBA14](a2, a3);
  else
    v7 = swift_retain();
  *a1 = v7;
  return Array.subscript.readspecialized ;
}

uint64_t Array.subscript.readspecialized ()
{
  return swift_release();
}

uint64_t specialized Array._copyContents(initializing:)(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  void (*v10)(_QWORD *);
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13[4];

  v5 = result;
  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = _CocoaArrayWrapper.endIndex.getter();
    result = swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      v8 = _CocoaArrayWrapper.endIndex.getter();
      result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          lazy protocol witness table accessor for type [UsoEntity] and conformance [A]();
          swift_bridgeObjectRetain();
          for (i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [UsoEntity]);
            v10 = specialized protocol witness for Collection.subscript.read in conformance [A](v13, i, a3);
            v12 = *v11;
            swift_retain();
            ((void (*)(uint64_t **, _QWORD))v10)(v13, 0);
            *(_QWORD *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        specialized UnsafeMutablePointer.initialize(from:count:)((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10), v5);
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type [UsoEntity] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [UsoEntity] and conformance [A];
  if (!lazy protocol witness table cache variable for type [UsoEntity] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [UsoEntity]);
    result = MEMORY[0x1C3BCBE28](MEMORY[0x1E0DEAF50], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [UsoEntity] and conformance [A]);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1C3BCBE1C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t outlined init with take of CorrectionsCustomizing(__int128 *a1, uint64_t a2)
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

uint64_t outlined assign with take of Date?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t outlined consume of CorrectionsDirectInvocation?(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t outlined consume of CorrectionsContext?(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t outlined init with copy of CorrectionsParse(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CorrectionsParse(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for UndoAction()
{
  uint64_t result;

  result = type metadata singleton initialization cache for UndoAction;
  if (!type metadata singleton initialization cache for UndoAction)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t outlined init with take of Siri_Nlu_External_UserParse?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UserParse?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with take of CorrectionsUSOParse(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CorrectionsUSOParse(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void outlined destroy of CorrectionsParse(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = a2(0);
  OUTLINED_FUNCTION_52(v2);
  OUTLINED_FUNCTION_0();
}

void outlined destroy of CorrectionsCustomizing?(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_52(v2);
  OUTLINED_FUNCTION_0();
}

void lazy protocol witness table accessor for type Siri_Nlu_External_CorrectionOutcome.CorrectionType and conformance Siri_Nlu_External_CorrectionOutcome.CorrectionType(unint64_t *a1, uint64_t a2)
{
  uint64_t v4;

  if (!*a1)
  {
    v4 = type metadata accessor for Siri_Nlu_External_CorrectionOutcome.CorrectionType();
    atomic_store(MEMORY[0x1C3BCBE28](a2, v4), a1);
  }
  OUTLINED_FUNCTION_0();
}

void outlined init with copy of CorrectionsCustomizing?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  void (*v4)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledName(a3);
  v3 = OUTLINED_FUNCTION_6_1();
  v4(v3);
  OUTLINED_FUNCTION_0();
}

uint64_t method lookup function for CorrectionsEngine()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static CorrectionsEngine.shared()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of CorrectionsEngine.checkCorrection(input:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of CorrectionsEngine.checkCorrection(input:customizations:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of CorrectionsEngine.setUndoInvocation(directInvocation:context:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of CorrectionsEngine.checkUndo(input:context:correctionsOutcome:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of CorrectionsEngine.isUndoPossible(context:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of CorrectionsEngine.commit()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

_QWORD *initializeBufferWithCopyOfBuffer for UndoAction(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v11 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v5;
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_BYTE *)(a1 + 24) = *((_BYTE *)a2 + 24);
    v6 = *(int *)(a3 + 24);
    v7 = (void *)(a1 + v6);
    v8 = (char *)a2 + v6;
    v9 = type metadata accessor for Siri_Nlu_External_UserParse();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9))
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UserParse?);
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
    }
  }
  return v3;
}

uint64_t destroy for UndoAction(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = type metadata accessor for Siri_Nlu_External_UserParse();
  result = __swift_getEnumTagSinglePayload(v4, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return result;
}

uint64_t initializeWithCopy for UndoAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const void *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v5 = *(int *)(a3 + 24);
  v6 = (void *)(a1 + v5);
  v7 = (const void *)(a2 + v5);
  v8 = type metadata accessor for Siri_Nlu_External_UserParse();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UserParse?);
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
    __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v8);
  }
  return a1;
}

uint64_t assignWithCopy for UndoAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  int EnumTagSinglePayload;
  int v11;
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v6 = *(int *)(a3 + 24);
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = type metadata accessor for Siri_Nlu_External_UserParse();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (!EnumTagSinglePayload)
  {
    v12 = *(_QWORD *)(v9 - 8);
    if (!v11)
    {
      (*(void (**)(void *, const void *, uint64_t))(v12 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UserParse?);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
  return a1;
}

uint64_t initializeWithTake for UndoAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v4 = *(int *)(a3 + 24);
  v5 = (void *)(a1 + v4);
  v6 = (const void *)(a2 + v4);
  v7 = type metadata accessor for Siri_Nlu_External_UserParse();
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UserParse?);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
    __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v7);
  }
  return a1;
}

uint64_t assignWithTake for UndoAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  int EnumTagSinglePayload;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v7 = *(int *)(a3 + 24);
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = type metadata accessor for Siri_Nlu_External_UserParse();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (!EnumTagSinglePayload)
  {
    v13 = *(_QWORD *)(v10 - 8);
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(v13 + 40))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UserParse?);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for UndoAction()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_1C2EC07A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    OUTLINED_FUNCTION_15_0();
  }
  else
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UserParse?);
    __swift_getEnumTagSinglePayload(a1 + *(int *)(a3 + 24), a2, v6);
  }
}

uint64_t storeEnumTagSinglePayload for UndoAction()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1C2EC081C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Siri_Nlu_External_UserParse?);
    return __swift_storeEnumTagSinglePayload(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

void type metadata completion function for UndoAction()
{
  unint64_t v0;

  type metadata accessor for Siri_Nlu_External_UserParse?();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void type metadata accessor for Siri_Nlu_External_UserParse?()
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for Siri_Nlu_External_UserParse?)
  {
    type metadata accessor for Siri_Nlu_External_UserParse();
    v0 = type metadata accessor for Optional();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Siri_Nlu_External_UserParse?);
  }
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    result = MEMORY[0x1C3BCBE28](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

void initializeBufferWithCopyOfBuffer for ModifiedNode(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0();
}

_QWORD *assignWithCopy for ModifiedNode(_QWORD *a1, _QWORD *a2)
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

void *type metadata accessor for ModifiedNode()
{
  return &unk_1E7CC6EF0;
}

uint64_t destroy for CorrectionCandidateTask()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for CorrectionCandidateTask(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for CorrectionCandidateTask(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for CorrectionCandidateTask(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CorrectionCandidateTask(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CorrectionCandidateTask(uint64_t result, int a2, int a3)
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

void *type metadata accessor for CorrectionCandidateTask()
{
  return &unk_1E7CC6F70;
}

uint64_t OUTLINED_FUNCTION_0_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 - 280);
  *(_QWORD *)(v0 - 152) = *(_QWORD *)(v0 - 328);
  *(_QWORD *)(v0 - 144) = v1;
  v2 = *(_QWORD *)(v0 - 312);
  *(_QWORD *)(v0 - 136) = *(_QWORD *)(v0 - 336);
  *(_QWORD *)(v0 - 128) = v2;
  v3 = *(_QWORD *)(v0 - 408);
  *(_QWORD *)(v0 - 120) = *(_QWORD *)(v0 - 416);
  *(_QWORD *)(v0 - 112) = v3;
  v4 = *(_QWORD *)(v0 - 392);
  *(_QWORD *)(v0 - 104) = *(_QWORD *)(v0 - 400);
  *(_QWORD *)(v0 - 96) = v4;
  return 1;
}

void OUTLINED_FUNCTION_1_5(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

BOOL OUTLINED_FUNCTION_2_5(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_5_3(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return Logger.logObject.getter();
}

void OUTLINED_FUNCTION_6_3()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = v0;
}

void OUTLINED_FUNCTION_10_2(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 2u);
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  return static os_log_type_t.debug.getter();
}

_WORD *OUTLINED_FUNCTION_16_0(_WORD *result)
{
  *result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_20_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, _QWORD)@<X8>)
{
  uint64_t v2;

  return a2(a1, *(_QWORD *)(v2 - 256));
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_23_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_25_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_26_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return 0;
}

void OUTLINED_FUNCTION_27_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  outlined destroy of CorrectionsCustomizing?(*(_QWORD *)(v2 - 256), a2);
}

uint64_t OUTLINED_FUNCTION_29_0()
{
  return swift_bridgeObjectRelease();
}

BOOL OUTLINED_FUNCTION_30_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

char *OUTLINED_FUNCTION_33_0(char *a1, int64_t a2)
{
  uint64_t v2;

  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_34_0()
{
  uint64_t (*v0)(_QWORD, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(*(_QWORD *)(v2 - 504), v1);
}

uint64_t OUTLINED_FUNCTION_35_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_36_0@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)(a2 - 256) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_37_0()
{
  return type metadata accessor for UndoAction();
}

uint64_t OUTLINED_FUNCTION_38_0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t OUTLINED_FUNCTION_39_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 480) + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_40(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_41(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

void (*OUTLINED_FUNCTION_42())(_QWORD *a1)
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  return specialized protocol witness for Collection.subscript.read in conformance [A]((uint64_t **)(v2 - 240), v1, v0);
}

void OUTLINED_FUNCTION_43()
{
  JUMPOUT(0x1C3BCB618);
}

uint64_t OUTLINED_FUNCTION_44()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_46()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t OUTLINED_FUNCTION_47@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t (*v2)(_QWORD, uint64_t, uint64_t);
  uint64_t v3;

  return v2(*(_QWORD *)(a1 - 256), v1, v3);
}

uint64_t OUTLINED_FUNCTION_49@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v2, v3);
}

uint64_t OUTLINED_FUNCTION_50@<X0>(uint64_t a1@<X8>)
{
  uint64_t (*v1)(_QWORD, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(*(_QWORD *)(a1 - 256), v3, v2);
}

uint64_t OUTLINED_FUNCTION_51()
{
  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t OUTLINED_FUNCTION_52(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_53()
{
  return swift_arrayInitWithCopy();
}

uint64_t OUTLINED_FUNCTION_55()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_56()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_58@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return type metadata accessor for Siri_Nlu_External_UserDialogAct();
}

uint64_t OUTLINED_FUNCTION_59()
{
  uint64_t v0;
  uint64_t v1;

  return outlined consume of CorrectionsDirectInvocation?(v1, v0);
}

uint64_t OUTLINED_FUNCTION_63()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t OUTLINED_FUNCTION_64()
{
  uint64_t v0;
  uint64_t v1;

  return outlined consume of CorrectionsDirectInvocation?(v1, v0);
}

uint64_t OUTLINED_FUNCTION_68(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 0, 1, v1);
}

void OUTLINED_FUNCTION_72(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  outlined destroy of CorrectionsCustomizing?(v2, a2);
}

uint64_t OUTLINED_FUNCTION_73()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 384);
}

uint64_t OUTLINED_FUNCTION_74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v10 - 256) = (char *)&a9 - v9;
  return 0;
}

uint64_t OUTLINED_FUNCTION_76()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_77()
{
  return swift_retain();
}

void OUTLINED_FUNCTION_78(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 - 304);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(v1 - 312);
  *(_QWORD *)(a1 + 40) = v2;
}

uint64_t OUTLINED_FUNCTION_80()
{
  uint64_t v0;

  return v0;
}

unint64_t OUTLINED_FUNCTION_82()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 288) = v0;
  return lazy protocol witness table accessor for type [UsoEntity] and conformance [A]();
}

uint64_t OUTLINED_FUNCTION_84()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t OUTLINED_FUNCTION_85()
{
  return type metadata accessor for UsoEntity();
}

uint64_t OUTLINED_FUNCTION_86()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

void OUTLINED_FUNCTION_87(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  outlined destroy of CorrectionsParse(v2, a2);
}

uint64_t OUTLINED_FUNCTION_89()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

void OUTLINED_FUNCTION_91(uint64_t a1)
{
  uint64_t *v1;

  outlined destroy of CorrectionsCustomizing?(a1, v1);
}

uint64_t OUTLINED_FUNCTION_92()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t OUTLINED_FUNCTION_94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return specialized Collection.first.getter(a1, *(_QWORD *)(a2 - 256));
}

void OUTLINED_FUNCTION_95()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 8 * v1) = v0;
}

void OUTLINED_FUNCTION_96(int a1@<W8>)
{
  uint64_t v1;

  *(_DWORD *)(v1 - 264) = a1;
}

uint64_t OUTLINED_FUNCTION_98()
{
  uint64_t (*v0)(uint64_t, _QWORD);
  uint64_t v1;

  return v0(v1 - 240, 0);
}

uint64_t OUTLINED_FUNCTION_100()
{
  return swift_dynamicCastObjCClass();
}

uint64_t OUTLINED_FUNCTION_103()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t OUTLINED_FUNCTION_105()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_106()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_107()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_108(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

void OUTLINED_FUNCTION_109()
{
  JUMPOUT(0x1C3BCBA20);
}

char *OUTLINED_FUNCTION_110(char *a1, int64_t a2)
{
  uint64_t v2;

  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, 1, v2);
}

uint64_t dispatch thunk of Corrections.checkCorrection(input:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of Corrections.setUndoInvocation(directInvocation:context:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of Corrections.checkUndo(input:context:correctionsOutcome:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t ReferenceResolutionUtils.__allocating_init()()
{
  return swift_allocObject();
}

void (*ReferenceResolutionUtils.resolveReference(usoEntity:)())(_QWORD, _QWORD, _QWORD)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(_QWORD, _QWORD, _QWORD);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
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
  char *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  _BOOL4 v47;
  uint8_t *v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint8_t *v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(_QWORD, _QWORD, _QWORD);
  uint64_t v62;
  id *v63;
  id v64;
  id v65;
  id v66;
  NSObject *v67;
  os_log_type_t v68;
  _DWORD *v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  os_log_type_t v73;
  uint64_t v74;
  _DWORD *v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void (*v80)(NSObject *, id *, uint64_t);
  NSObject *v81;
  uint64_t v82;
  uint64_t *v83;
  int v84;
  uint64_t v85;
  NSObject *v86;
  uint64_t v87;
  os_log_type_t v88;
  _BOOL4 v89;
  char *v90;
  uint8_t *v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void (*v97)(_QWORD, _QWORD, _QWORD);
  id v98;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  NSObject *v103;
  os_log_type_t v104;
  uint64_t v105;
  uint64_t v106;
  os_log_type_t v107;
  uint8_t *v108;
  void (*v109)(NSObject *, uint64_t);
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  char *v123;
  uint64_t v124;
  NSObject *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  NSObject *v134;
  uint64_t *v135;
  uint64_t *v136;
  uint64_t v137;
  uint8_t *v138;
  uint64_t v139;
  void (*v140)(_QWORD, _QWORD, _QWORD);
  uint64_t v141;
  char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void (*v146)(_QWORD, _QWORD, _QWORD);

  v0 = type metadata accessor for RREntity();
  v1 = *(_QWORD *)(v0 - 8);
  v132 = v0;
  v133 = v1;
  OUTLINED_FUNCTION_8_3();
  MEMORY[0x1E0C80A78](v2, v3);
  v5 = (char *)&v121 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v131 = type metadata accessor for RRCandidate();
  v143 = *(_QWORD *)(v131 - 8);
  OUTLINED_FUNCTION_8_3();
  MEMORY[0x1E0C80A78](v6, v7);
  OUTLINED_FUNCTION_24_0();
  v128 = v8;
  OUTLINED_FUNCTION_19();
  MEMORY[0x1E0C80A78](v9, v10);
  v129 = (char *)&v121 - v11;
  OUTLINED_FUNCTION_19();
  MEMORY[0x1E0C80A78](v12, v13);
  v134 = ((char *)&v121 - v14);
  v15 = type metadata accessor for RRResult();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15, v17);
  OUTLINED_FUNCTION_24_0();
  v135 = v18;
  OUTLINED_FUNCTION_19();
  MEMORY[0x1E0C80A78](v19, v20);
  v22 = ((char *)&v121 - v21);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for RRFilter?);
  OUTLINED_FUNCTION_8_3();
  MEMORY[0x1E0C80A78](v23, v24);
  OUTLINED_FUNCTION_11_2();
  v140 = v25;
  v26 = type metadata accessor for RRQuery();
  v138 = *(uint8_t **)(v26 - 8);
  v139 = v26;
  OUTLINED_FUNCTION_8_3();
  MEMORY[0x1E0C80A78](v27, v28);
  OUTLINED_FUNCTION_11_2();
  v136 = v29;
  v137 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<RRResult, Error>);
  OUTLINED_FUNCTION_8_3();
  MEMORY[0x1E0C80A78](v30, v31);
  OUTLINED_FUNCTION_24_0();
  v141 = v32;
  OUTLINED_FUNCTION_19();
  MEMORY[0x1E0C80A78](v33, v34);
  v142 = (char *)&v121 - v35;
  v36 = type metadata accessor for OSSignpostID();
  v144 = *(_QWORD *)(v36 - 8);
  v145 = v36;
  OUTLINED_FUNCTION_8_3();
  MEMORY[0x1E0C80A78](v37, v38);
  v40 = (char *)&v121 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for log != -1)
    swift_once();
  v41 = (id)static Logger.log;
  OSSignpostID.init(log:)();
  static os_signpost_type_t.begin.getter();
  OUTLINED_FUNCTION_15_1();

  type metadata accessor for ReferenceResolutionClient();
  v42 = ReferenceResolutionClient.__allocating_init()();
  if ((dispatch thunk of ReferenceResolutionClient.hasReference(usoEntity:)() & 1) == 0)
    goto LABEL_18;
  v122 = v5;
  v125 = v22;
  v130 = v16;
  if (one-time initialization token for logger != -1)
    swift_once();
  v43 = type metadata accessor for Logger();
  v44 = __swift_project_value_buffer(v43, (uint64_t)static Logger.logger);
  OUTLINED_FUNCTION_22_1();
  v127 = v44;
  v45 = Logger.logObject.getter();
  v46 = static os_log_type_t.debug.getter();
  v47 = os_log_type_enabled(v45, v46);
  v124 = v15;
  if (v47)
  {
    v48 = (uint8_t *)OUTLINED_FUNCTION_1_4();
    v146 = (void (*)(_QWORD, _QWORD, _QWORD))OUTLINED_FUNCTION_1_4();
    v123 = v40;
    *(_DWORD *)v48 = 136315138;
    v49 = UsoTask.verbString.getter();
    v51 = OUTLINED_FUNCTION_3_1(v49, v50);
    OUTLINED_FUNCTION_8_2(v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    OUTLINED_FUNCTION_16_1();
    OUTLINED_FUNCTION_5_2();
    _os_log_impl(&dword_1C2EAE000, v45, v46, "[ReferenceResolutionUtils.resolveReference] Reference resolver detects a reference in entity %s", v48, 0xCu);
    OUTLINED_FUNCTION_17_1();
    OUTLINED_FUNCTION_0_4();
  }

  OUTLINED_FUNCTION_16_1();
  v52 = v130;
  v53 = UsoTask.verbString.getter();
  type metadata accessor for UsoEntityBuilder();
  swift_allocObject();
  v54 = UsoEntityBuilder.init(valueTypeString:)();
  v55 = MEMORY[0x1C3BCB72C]();
  if (!v55)
  {
    OUTLINED_FUNCTION_22_1();
    OUTLINED_FUNCTION_2_6();
    v73 = OUTLINED_FUNCTION_14_1();
    if (os_log_type_enabled(v53, v73))
    {
      v74 = OUTLINED_FUNCTION_1_4();
      v126 = v54;
      v75 = (_DWORD *)v74;
      v146 = (void (*)(_QWORD, _QWORD, _QWORD))OUTLINED_FUNCTION_1_4();
      v139 = v42;
      *v75 = 136315138;
      v76 = UsoTask.verbString.getter();
      v78 = OUTLINED_FUNCTION_3_1(v76, v77);
      OUTLINED_FUNCTION_8_4(v78);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      OUTLINED_FUNCTION_16_1();
      OUTLINED_FUNCTION_5_2();
      OUTLINED_FUNCTION_7_2(&dword_1C2EAE000, v53, v73, "[ReferenceResolutionUtils.resolveReference] Failed to create query entity for %s");
      OUTLINED_FUNCTION_17_1();
      OUTLINED_FUNCTION_0_4();
    }

    OUTLINED_FUNCTION_16_1();
    swift_release();
LABEL_18:
    swift_release();
LABEL_21:
    v97 = (void (*)(_QWORD, _QWORD, _QWORD))MEMORY[0x1E0DEE9D8];
    goto LABEL_22;
  }
  v56 = v55;
  v126 = v54;
  v57 = v136;
  *v136 = v55;
  v58 = v138;
  v59 = v139;
  (*((void (**)(uint64_t *, _QWORD, uint64_t))v138 + 13))(v57, *MEMORY[0x1E0DA3DE0], v139);
  v60 = type metadata accessor for RRFilter();
  v61 = v140;
  __swift_storeEnumTagSinglePayload((uint64_t)v140, 1, 1, v60);
  v121 = v56;
  swift_retain();
  v62 = (uint64_t)v142;
  dispatch thunk of ReferenceResolutionClient.resolve(reference:filter:)();
  outlined destroy of Siri_Nlu_External_Parser.ParserIdentifier?((uint64_t)v61, &demangling cache variable for type metadata for RRFilter?);
  (*((void (**)(uint64_t *, uint64_t))v58 + 1))(v57, v59);
  v63 = (id *)v141;
  outlined init with copy of Result<RRResult, Error>(v62, v141);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v139 = v42;
    v64 = *v63;
    v65 = *v63;
    v66 = v64;
    v67 = OUTLINED_FUNCTION_2_6();
    v68 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v67, v68))
    {
      v69 = (_DWORD *)OUTLINED_FUNCTION_1_4();
      v146 = (void (*)(_QWORD, _QWORD, _QWORD))OUTLINED_FUNCTION_1_4();
      v123 = v40;
      *v69 = 136315138;
      swift_getErrorValue();
      v70 = Error.localizedDescription.getter();
      v72 = OUTLINED_FUNCTION_3_1(v70, v71);
      OUTLINED_FUNCTION_8_4(v72);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      OUTLINED_FUNCTION_5_2();
      OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_7_2(&dword_1C2EAE000, v67, v68, "[ReferenceResolutionUtils.resolveReference] SRR failed %s");
      OUTLINED_FUNCTION_17_1();
      OUTLINED_FUNCTION_0_4();
    }
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_4_2();

LABEL_20:
    OUTLINED_FUNCTION_3_3();
    swift_release();
    v96 = swift_release();
    OUTLINED_FUNCTION_25_1(v96, &demangling cache variable for type metadata for Result<RRResult, Error>);
    goto LABEL_21;
  }
  v79 = v52;
  v80 = *(void (**)(NSObject *, id *, uint64_t))(v52 + 32);
  v81 = v125;
  v82 = v124;
  v80(v125, v63, v124);
  v83 = v135;
  (*(void (**)(uint64_t *, NSObject *, uint64_t))(v79 + 16))(v135, v81, v82);
  v84 = (*(uint64_t (**)(uint64_t *, uint64_t))(v79 + 88))(v83, v82);
  if (v84 == *MEMORY[0x1E0DA3E88])
  {
    OUTLINED_FUNCTION_6_4();
    v85 = v143;
    v86 = v134;
    v87 = v131;
    (*(void (**)(NSObject *, uint64_t *, uint64_t))(v143 + 32))(v134, v83, v131);
    (*(void (**)(char *, NSObject *, uint64_t))(v85 + 16))(v129, v86, v87);
    OUTLINED_FUNCTION_2_6();
    v88 = OUTLINED_FUNCTION_14_1();
    v89 = OUTLINED_FUNCTION_2_5(v88);
    v90 = v122;
    if (v89)
    {
      LODWORD(v141) = (_DWORD)v83;
      v91 = (uint8_t *)OUTLINED_FUNCTION_1_4();
      v140 = (void (*)(_QWORD, _QWORD, _QWORD))OUTLINED_FUNCTION_1_4();
      v146 = v140;
      *(_DWORD *)v91 = 136315138;
      v137 = (uint64_t)(v91 + 4);
      v138 = v91;
      RRCandidate.entity.getter();
      RREntity.usoEntity.getter();
      OUTLINED_FUNCTION_12_1();
      v92 = UsoEntity.debugString.getter();
      v94 = v93;
      swift_release();
      v95 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v92, v94, (uint64_t *)&v146);
      OUTLINED_FUNCTION_8_2(v95);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_11_3();
      _os_log_impl(&dword_1C2EAE000, v86, (os_log_type_t)v141, "[ReferenceResolutionUtils.resolveReference] found match %s", v138, 0xCu);
      OUTLINED_FUNCTION_17_1();
      OUTLINED_FUNCTION_0_4();
    }
    OUTLINED_FUNCTION_11_3();

    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    v105 = swift_allocObject();
    *(_OWORD *)(v105 + 16) = xmmword_1C2EC31D0;
    RRCandidate.entity.getter();
    RREntity.usoEntity.getter();
    OUTLINED_FUNCTION_12_1();
    *(_QWORD *)(v105 + 32) = v90;
    v146 = (void (*)(_QWORD, _QWORD, _QWORD))v105;
    specialized Array._endMutation()();
    v97 = v146;
    OUTLINED_FUNCTION_3_3();
    OUTLINED_FUNCTION_3_3();
    OUTLINED_FUNCTION_21_0();
    OUTLINED_FUNCTION_11_3();
    v106 = OUTLINED_FUNCTION_9_3();
    OUTLINED_FUNCTION_25_1(v106, &demangling cache variable for type metadata for Result<RRResult, Error>);
  }
  else
  {
    v100 = v122;
    v101 = v133;
    if (v84 != *MEMORY[0x1E0DA3E90])
    {
      OUTLINED_FUNCTION_2_6();
      v107 = OUTLINED_FUNCTION_14_1();
      if (OUTLINED_FUNCTION_2_5(v107))
      {
        v108 = (uint8_t *)OUTLINED_FUNCTION_1_4();
        *(_WORD *)v108 = 0;
        _os_log_impl(&dword_1C2EAE000, v81, (os_log_type_t)v83, "[ReferenceResolutionUtils.resolveReference] Failed to find match", v108, 2u);
        OUTLINED_FUNCTION_0_4();
      }

      v109 = *(void (**)(NSObject *, uint64_t))(v79 + 8);
      v109(v125, v82);
      v109(v135, v82);
      goto LABEL_20;
    }
    OUTLINED_FUNCTION_6_4();
    v102 = *v83;
    swift_bridgeObjectRetain();
    v103 = OUTLINED_FUNCTION_2_6();
    v104 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v103, v104))
    {
      *(_DWORD *)OUTLINED_FUNCTION_1_4() = 134217984;
      v146 = *(void (**)(_QWORD, _QWORD, _QWORD))(v102 + 16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      OUTLINED_FUNCTION_29_0();
      OUTLINED_FUNCTION_7_2(&dword_1C2EAE000, v103, v104, "[ReferenceResolutionUtils.resolveReference] found plural match, number of matches %ld");
      OUTLINED_FUNCTION_0_4();
    }

    OUTLINED_FUNCTION_29_0();
    v110 = *(_QWORD *)(v102 + 16);
    if (v110)
    {
      v123 = v40;
      v146 = (void (*)(_QWORD, _QWORD, _QWORD))MEMORY[0x1E0DEE9D8];
      specialized ContiguousArray.reserveCapacity(_:)();
      v111 = v143;
      v112 = (*(unsigned __int8 *)(v111 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v111 + 80);
      v138 = (uint8_t *)v102;
      v113 = v102 + v112;
      v114 = *(_QWORD *)(v143 + 72);
      v140 = *(void (**)(_QWORD, _QWORD, _QWORD))(v143 + 16);
      v141 = v114;
      v115 = v100;
      v116 = v101;
      v117 = v131;
      v118 = v132;
      v119 = v128;
      do
      {
        v140(v119, v113, v117);
        RRCandidate.entity.getter();
        RREntity.usoEntity.getter();
        (*(void (**)(char *, uint64_t))(v116 + 8))(v115, v118);
        (*(void (**)(uint64_t, uint64_t))(v111 + 8))(v119, v117);
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        v111 = v143;
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
        v113 += v141;
        --v110;
      }
      while (v110);
      v97 = v146;
      OUTLINED_FUNCTION_3_3();
      OUTLINED_FUNCTION_3_3();
      OUTLINED_FUNCTION_21_0();
      v40 = v123;
    }
    else
    {
      OUTLINED_FUNCTION_3_3();
      OUTLINED_FUNCTION_3_3();
      OUTLINED_FUNCTION_21_0();
      v97 = (void (*)(_QWORD, _QWORD, _QWORD))MEMORY[0x1E0DEE9D8];
    }
    v120 = OUTLINED_FUNCTION_9_3();
    OUTLINED_FUNCTION_25_1(v120, &demangling cache variable for type metadata for Result<RRResult, Error>);
    OUTLINED_FUNCTION_29_0();
  }
LABEL_22:
  v98 = (id)static Logger.log;
  static os_signpost_type_t.end.getter();
  OUTLINED_FUNCTION_15_1();

  (*(void (**)(char *, uint64_t))(v144 + 8))(v40, v145);
  return v97;
}

uint64_t ReferenceResolutionUtils.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t ReferenceResolutionUtils.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t ReferenceResolutionUtils.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t outlined init with copy of Result<RRResult, Error>(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<RRResult, Error>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for ReferenceResolutionUtils()
{
  return objc_opt_self();
}

uint64_t method lookup function for ReferenceResolutionUtils()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ReferenceResolutionUtils.resolveReference(usoEntity:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 80))();
}

uint64_t dispatch thunk of ReferenceResolutionUtils.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t OUTLINED_FUNCTION_2_6()
{
  return Logger.logObject.getter();
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return swift_release();
}

void OUTLINED_FUNCTION_4_2()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_6_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 - 192) = v1;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 96))(v0, v2);
}

void OUTLINED_FUNCTION_7_2(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_8_4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 104) = a1;
  return v1 - 104;
}

uint64_t OUTLINED_FUNCTION_9_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, uint64_t))(v1 + 8))(*(_QWORD *)(v2 - 304), v0);
}

uint64_t OUTLINED_FUNCTION_11_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t OUTLINED_FUNCTION_12_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v1 + 8))(v0, *(_QWORD *)(v2 - 248));
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t OUTLINED_FUNCTION_16_1()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_17_1()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_22_1()
{
  return swift_retain_n();
}

uint64_t OUTLINED_FUNCTION_25_1(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  return outlined destroy of Siri_Nlu_External_Parser.ParserIdentifier?(*(_QWORD *)(v2 - 168), a2);
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x1E0CAF990]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x1E0CB01F0]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t Date.timeIntervalSinceNow.getter()
{
  return MEMORY[0x1E0CB0708]();
}

uint64_t static Date.now.getter()
{
  return MEMORY[0x1E0CB07F8]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t UUID.uuidString.getter()
{
  return MEMORY[0x1E0CB0910]();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)MEMORY[0x1E0CB0930]();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t UUID.init()()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t type metadata accessor for Siri_Nlu_External_Parser.ParserIdentifier()
{
  return MEMORY[0x1E0D9F148]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UsoGraph()
{
  return MEMORY[0x1E0D9F278]();
}

uint64_t Siri_Nlu_External_UserParse.userDialogActs.modify()
{
  return MEMORY[0x1E0D9F2B0]();
}

uint64_t Siri_Nlu_External_UserParse.userDialogActs.getter()
{
  return MEMORY[0x1E0D9F2C0]();
}

uint64_t Siri_Nlu_External_UserParse.correctionOutcome.getter()
{
  return MEMORY[0x1E0D9F2D8]();
}

uint64_t static Siri_Nlu_External_UserParse.== infix(_:_:)()
{
  return MEMORY[0x1E0D9F300]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserParse()
{
  return MEMORY[0x1E0D9F348]();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasUserStatedTask.getter()
{
  return MEMORY[0x1E0D9F3F0]();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasAccepted.getter()
{
  return MEMORY[0x1E0D9F3F8]();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasRejected.getter()
{
  return MEMORY[0x1E0D9F408]();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasCancelled.getter()
{
  return MEMORY[0x1E0D9F420]();
}

uint64_t Siri_Nlu_External_UserDialogAct.userStatedTask.getter()
{
  return MEMORY[0x1E0D9F440]();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasWantedToUndo.getter()
{
  return MEMORY[0x1E0D9F460]();
}

uint64_t Siri_Nlu_External_UserDialogAct.hasWantedToProceed.getter()
{
  return MEMORY[0x1E0D9F480]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserDialogAct()
{
  return MEMORY[0x1E0D9F4B8]();
}

uint64_t Siri_Nlu_External_UserStatedTask.task.getter()
{
  return MEMORY[0x1E0D9F5C0]();
}

uint64_t type metadata accessor for Siri_Nlu_External_UserStatedTask()
{
  return MEMORY[0x1E0D9F5E0]();
}

uint64_t type metadata accessor for Siri_Nlu_External_CorrectionOutcome.CorrectionType()
{
  return MEMORY[0x1E0D9F700]();
}

uint64_t Siri_Nlu_External_CorrectionOutcome.type.getter()
{
  return MEMORY[0x1E0D9F720]();
}

uint64_t type metadata accessor for Siri_Nlu_External_CorrectionOutcome()
{
  return MEMORY[0x1E0D9F728]();
}

uint64_t static UsoGraphProtoReader.fromSwiftProtobuf(protobufGraph:vocabManager:)()
{
  return MEMORY[0x1E0D9F948]();
}

uint64_t UsoExpression.operandAsValue.getter()
{
  return MEMORY[0x1E0DA05C8]();
}

uint64_t UsoExpression.operatorAsString.getter()
{
  return MEMORY[0x1E0DA05D0]();
}

uint64_t UsoEntityBuilder.init(valueTypeString:)()
{
  return MEMORY[0x1E0DA0CE0]();
}

uint64_t type metadata accessor for UsoEntityBuilder()
{
  return MEMORY[0x1E0DA0CE8]();
}

uint64_t static UsoConversionUtils.convertGraphToTasks(graph:)()
{
  return MEMORY[0x1E0DA0EB0]();
}

uint64_t static UsoBuilderConversionUtils.convertEntityBuilderToEntity(entityBuilder:)()
{
  return MEMORY[0x1E0DA1318]();
}

uint64_t static Name.primitiveString.getter()
{
  return MEMORY[0x1E0DA2850]();
}

uint64_t static Name.primitiveInteger.getter()
{
  return MEMORY[0x1E0DA2858]();
}

uint64_t Name.value.getter()
{
  return MEMORY[0x1E0DA2880]();
}

uint64_t type metadata accessor for Name()
{
  return MEMORY[0x1E0DA2888]();
}

uint64_t UsoTask.verbString.getter()
{
  return MEMORY[0x1E0DA2A48]();
}

uint64_t UsoTask.baseEntityAsString.getter()
{
  return MEMORY[0x1E0DA2A50]();
}

uint64_t UsoTask.arguments.getter()
{
  return MEMORY[0x1E0DA2A58]();
}

uint64_t dispatch thunk of UsoValue.getAsEntity()()
{
  return MEMORY[0x1E0DA2AB8]();
}

uint64_t dispatch thunk of UsoValue.getAsExpression()()
{
  return MEMORY[0x1E0DA2AC8]();
}

uint64_t UsoEntity.debugString.getter()
{
  return MEMORY[0x1E0DA3D40]();
}

uint64_t UsoEntity.attributes.getter()
{
  return MEMORY[0x1E0DA2BA8]();
}

uint64_t UsoEntity.valueTypeString.getter()
{
  return MEMORY[0x1E0DA2BC0]();
}

uint64_t type metadata accessor for UsoEntity()
{
  return MEMORY[0x1E0DA2BD8]();
}

uint64_t dispatch thunk of ReferenceResolutionClient.hasReference(usoEntity:)()
{
  return MEMORY[0x1E0DA3C88]();
}

uint64_t dispatch thunk of ReferenceResolutionClient.resolve(reference:filter:)()
{
  return MEMORY[0x1E0DA3CB0]();
}

uint64_t ReferenceResolutionClient.__allocating_init()()
{
  return MEMORY[0x1E0DA3CD0]();
}

uint64_t type metadata accessor for ReferenceResolutionClient()
{
  return MEMORY[0x1E0DA3CD8]();
}

uint64_t os_signpost(_:dso:log:name:signpostID:)()
{
  return MEMORY[0x1E0DF2090]();
}

uint64_t OSSignpostID.init(log:)()
{
  return MEMORY[0x1E0DF2100]();
}

uint64_t static OSSignpostID.exclusive.getter()
{
  return MEMORY[0x1E0DF2110]();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return MEMORY[0x1E0DF2118]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t Logger.init(_:)()
{
  return MEMORY[0x1E0DF2268]();
}

uint64_t RRCandidate.entity.getter()
{
  return MEMORY[0x1E0DA3D68]();
}

uint64_t type metadata accessor for RRCandidate()
{
  return MEMORY[0x1E0DA3D70]();
}

uint64_t type metadata accessor for RRQuery()
{
  return MEMORY[0x1E0DA3DE8]();
}

uint64_t RREntity.usoEntity.getter()
{
  return MEMORY[0x1E0DA3E48]();
}

uint64_t type metadata accessor for RREntity()
{
  return MEMORY[0x1E0DA3E50]();
}

uint64_t type metadata accessor for RRFilter()
{
  return MEMORY[0x1E0DA3E78]();
}

uint64_t type metadata accessor for RRResult()
{
  return MEMORY[0x1E0DA3EB0]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x1E0CB17D8]();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x1E0DEA568]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x1E0CB1940]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x1E0DEA5F8]();
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0;
  void *v1;
  Swift::String result;

  v0 = MEMORY[0x1E0DEA610]();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x1E0DEA758]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x1E0DEA800](a1._countAndFlagsBits, a1._object);
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return MEMORY[0x1E0DEAC88]();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t static os_signpost_type_t.end.getter()
{
  return MEMORY[0x1E0DF2298]();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return MEMORY[0x1E0DF22A0]();
}

uint64_t static os_signpost_type_t.event.getter()
{
  return MEMORY[0x1E0DF22A8]();
}

uint64_t OS_os_log.signpostsEnabled.getter()
{
  return MEMORY[0x1E0DF22B0]();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t StringProtocol.components<A>(separatedBy:)()
{
  return MEMORY[0x1E0CB2410]();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return MEMORY[0x1E0CB2588]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x1E0DEBE50]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x1E0DEC2A8](a1);
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x1E0DEC8E0]();
}

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return MEMORY[0x1E0DECAE0](isUnique, capacity);
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x1E0DECD70]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x1E0DECF28](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x1E0DECF88]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t Error.localizedDescription.getter()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x1E0DEDEF8]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x1E0DEDF10](a1);
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t CodingKey.description.getter()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t CodingKey.debugDescription.getter()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t AFDeviceSupportsSAE()
{
  return MEMORY[0x1E0CFE438]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x1E0DEEB78]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x1E0DEED80]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1E0DEEEB8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

