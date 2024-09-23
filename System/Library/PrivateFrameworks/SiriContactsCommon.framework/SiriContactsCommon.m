uint64_t one-time initialization function for decoder()
{
  uint64_t result;

  type metadata accessor for JSONDecoder();
  swift_allocObject();
  result = JSONDecoder.init()();
  static PhonemeDataParser.decoder = result;
  return result;
}

void static PhonemeDataParser.parse(from:)()
{
  void *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  v2 = OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_21(v2);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_19();
  if (one-time initialization token for siriContacts != -1)
    swift_once();
  v4 = type metadata accessor for Logger();
  __swift_project_value_buffer(v4, (uint64_t)static Logger.siriContacts);
  v5 = v0;
  v6 = (void *)Logger.logObject.getter();
  v7 = static os_log_type_t.debug.getter();
  if (OUTLINED_FUNCTION_18(v7))
  {
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_20(4.8149e-34);
    OUTLINED_FUNCTION_8(v8, (SEL *)&selRef_phonemeData);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
    v9 = OUTLINED_FUNCTION_22();
    v11 = OUTLINED_FUNCTION_6(v9, v10);
    OUTLINED_FUNCTION_1(v11);

    OUTLINED_FUNCTION_14();
    OUTLINED_FUNCTION_5(&dword_24618F000, v12, v13, "[PhonemeDataParser] phonemeData: %s");
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_0();
  }

  OUTLINED_FUNCTION_8(v14, (SEL *)&selRef_phonemeData);
  if (v15
    && (OUTLINED_FUNCTION_12(), OUTLINED_FUNCTION_9(), OUTLINED_FUNCTION_11(), OUTLINED_FUNCTION_13(), v1 >> 60 != 15))
  {
    CNContact.formattedFullName.getter();
    OUTLINED_FUNCTION_2(v21, v22);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_23();
  }
  else
  {
    v16 = (void *)Logger.logObject.getter();
    v17 = static os_log_type_t.debug.getter();
    if (OUTLINED_FUNCTION_17(v17))
    {
      *(_WORD *)OUTLINED_FUNCTION_3() = 0;
      OUTLINED_FUNCTION_7(&dword_24618F000, v18, v19, "phonemeData string is empty");
      OUTLINED_FUNCTION_0();
    }

    v20 = type metadata accessor for PhonemeData();
    OUTLINED_FUNCTION_10(v20);
  }
  OUTLINED_FUNCTION_4();
}

{
  void *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;

  v2 = OUTLINED_FUNCTION_15();
  v3 = OUTLINED_FUNCTION_21(v2);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_19();
  if (one-time initialization token for siriContacts != -1)
    swift_once();
  v4 = type metadata accessor for Logger();
  __swift_project_value_buffer(v4, (uint64_t)static Logger.siriContacts);
  v5 = v0;
  v6 = (void *)Logger.logObject.getter();
  v7 = static os_log_type_t.debug.getter();
  if (OUTLINED_FUNCTION_18(v7))
  {
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_20(4.8149e-34);
    OUTLINED_FUNCTION_8(v8, (SEL *)&selRef_phonemeData);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
    v9 = OUTLINED_FUNCTION_22();
    v11 = OUTLINED_FUNCTION_6(v9, v10);
    OUTLINED_FUNCTION_1(v11);

    OUTLINED_FUNCTION_14();
    OUTLINED_FUNCTION_5(&dword_24618F000, v12, v13, "[PhonemeDataParser] phonemeData: %s");
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_0();
  }

  OUTLINED_FUNCTION_8(v14, (SEL *)&selRef_phonemeData);
  if (v15
    && (OUTLINED_FUNCTION_12(),
        OUTLINED_FUNCTION_9(),
        OUTLINED_FUNCTION_11(),
        v16 = OUTLINED_FUNCTION_13(),
        v1 >> 60 != 15))
  {
    v22 = OUTLINED_FUNCTION_8(v16, (SEL *)&selRef_fullName);
    OUTLINED_FUNCTION_2(v22, v23);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_23();
  }
  else
  {
    v17 = (void *)Logger.logObject.getter();
    v18 = static os_log_type_t.debug.getter();
    if (OUTLINED_FUNCTION_17(v18))
    {
      *(_WORD *)OUTLINED_FUNCTION_3() = 0;
      OUTLINED_FUNCTION_7(&dword_24618F000, v19, v20, "[PhonemeDataParser] phonemeData string is empty");
      OUTLINED_FUNCTION_0();
    }

    v21 = type metadata accessor for PhonemeData();
    OUTLINED_FUNCTION_10(v21);
  }
  OUTLINED_FUNCTION_4();
}

uint64_t static PhonemeDataParser.decodePhonemeDataString(_:_:)@<X0>(uint64_t a1@<X2>, void *a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  Swift::String v26;
  void (*v27)(char *, char *, uint64_t);
  char *v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  _QWORD v40[2];
  uint8_t *v41;
  void (*v42)(char *, char *, uint64_t);
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47[2];
  uint64_t v48;

  v46 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PhonemeData?);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for PhonemeData();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v45 = (char *)v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v40 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v40 - v14;
  if (one-time initialization token for decoder != -1)
    swift_once();
  lazy protocol witness table accessor for type PhonemeData and conformance PhonemeData();
  dispatch thunk of JSONDecoder.decode<A>(_:from:)();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v7);
  v42 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  v42(v15, v6, v7);
  if (one-time initialization token for siriContacts != -1)
    swift_once();
  v16 = type metadata accessor for Logger();
  v17 = __swift_project_value_buffer(v16, (uint64_t)static Logger.siriContacts);
  swift_bridgeObjectRetain_n();
  v18 = Logger.logObject.getter();
  v19 = static os_log_type_t.debug.getter();
  v20 = os_log_type_enabled(v18, v19);
  v43 = v13;
  if (v20)
  {
    v44 = a3;
    v21 = swift_slowAlloc();
    v41 = (uint8_t *)v17;
    v22 = (uint8_t *)v21;
    v23 = swift_slowAlloc();
    v47[1] = (uint64_t)a2;
    v48 = v23;
    *(_DWORD *)v22 = 136315138;
    v40[1] = v22 + 4;
    v47[0] = v46;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for String?);
    v24 = String.init<A>(describing:)();
    v47[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, v25, &v48);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    a3 = v44;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24618F000, v18, v19, "[PhonemeDataParser] fullName: %s", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249552F14](v23, -1, -1);
    MEMORY[0x249552F14](v22, -1, -1);

    if (!a2)
      goto LABEL_12;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    if (!a2)
      goto LABEL_12;
  }
  v26._countAndFlagsBits = v46;
  v26._object = a2;
  if (PhonemeData.validateChecksum(fullName:)(v26))
  {
    v27 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
    v28 = v43;
    v27(v43, v15, v7);
    v29 = Logger.logObject.getter();
    v30 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      v46 = swift_slowAlloc();
      v47[0] = v46;
      v44 = a3;
      *(_DWORD *)v31 = 136315138;
      v41 = v31 + 4;
      v27(v45, v28, v7);
      v32 = String.init<A>(describing:)();
      v48 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v32, v33, v47);
      a3 = v44;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v28, v7);
      _os_log_impl(&dword_24618F000, v29, v30, "[PhonemeDataParser] after: %s", v31, 0xCu);
      v34 = v46;
      swift_arrayDestroy();
      MEMORY[0x249552F14](v34, -1, -1);
      MEMORY[0x249552F14](v31, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v8 + 8))(v28, v7);
    }

    v42((char *)a3, v15, v7);
    v38 = 0;
    return __swift_storeEnumTagSinglePayload(a3, v38, 1, v7);
  }
LABEL_12:
  v35 = Logger.logObject.getter();
  v36 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v35, v36))
  {
    v37 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v37 = 0;
    _os_log_impl(&dword_24618F000, v35, v36, "[PhonemeDataParser] phonemeData checksum is invalid", v37, 2u);
    MEMORY[0x249552F14](v37, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v8 + 8))(v15, v7);
  v38 = 1;
  return __swift_storeEnumTagSinglePayload(a3, v38, 1, v7);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t protocol witness for SetAlgebra.init() in conformance NSPersonNameComponentsFormatterOptions@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = specialized OptionSet<>.init()();
  *a1 = result;
  return result;
}

_QWORD *protocol witness for OptionSet.init(rawValue:) in conformance NSPropertyListMutabilityOptions@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
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
    return MEMORY[0x24BEE4AF8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x24BEE4AF8];
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
    return (_QWORD *)MEMORY[0x24BEE4AF8];
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
    v10 = (char *)MEMORY[0x24BEE4AF8];
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<IDSHelper.SearchHandle>);
    v10 = (char *)OUTLINED_FUNCTION_26();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 72);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  if ((v5 & 1) != 0)
  {
    specialized UnsafeMutablePointer.moveInitialize(from:count:)((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    OUTLINED_FUNCTION_3_0();
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<FaceTimeHandles.FacetimeHandle>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 56);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
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

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
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

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249552E90]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t outlined bridged method (pb) of @objc CNContact.phonemeData.getter(void *a1, SEL *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(a1, *a2);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v4;
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

unint64_t lazy protocol witness table accessor for type PhonemeData and conformance PhonemeData()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type PhonemeData and conformance PhonemeData;
  if (!lazy protocol witness table cache variable for type PhonemeData and conformance PhonemeData)
  {
    v1 = type metadata accessor for PhonemeData();
    result = MEMORY[0x249552EA8](MEMORY[0x24BE92980], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type PhonemeData and conformance PhonemeData);
  }
  return result;
}

uint64_t outlined destroy of PhonemeData?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PhonemeData?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void OUTLINED_FUNCTION_0()
{
  JUMPOUT(0x249552F14);
}

uint64_t OUTLINED_FUNCTION_1(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 104) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_2(uint64_t a1, void *a2)
{
  uint64_t v2;

  return static PhonemeDataParser.decodePhonemeDataString(_:_:)(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_6(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, (uint64_t *)(v2 - 88));
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  uint8_t *v4;
  NSObject *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v5, v6, a4, v4, 2u);
}

uint64_t OUTLINED_FUNCTION_8(uint64_t a1, SEL *a2)
{
  void *v2;

  return outlined bridged method (pb) of @objc CNContact.phonemeData.getter(v2, a2);
}

uint64_t OUTLINED_FUNCTION_9()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t OUTLINED_FUNCTION_10(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_11()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_12()
{
  return static String.Encoding.utf8.getter();
}

uint64_t OUTLINED_FUNCTION_13()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 8))(v1, *(_QWORD *)(v2 - 112));
}

uint64_t OUTLINED_FUNCTION_14()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_15()
{
  return type metadata accessor for String.Encoding();
}

uint64_t OUTLINED_FUNCTION_16()
{
  return swift_arrayDestroy();
}

BOOL OUTLINED_FUNCTION_17(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

BOOL OUTLINED_FUNCTION_18(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_20(float a1)
{
  uint64_t v1;
  float *v2;
  uint64_t v3;

  *(_QWORD *)(v3 - 128) = v1;
  *v2 = a1;
}

uint64_t OUTLINED_FUNCTION_21(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 112) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_22()
{
  return String.init<A>(describing:)();
}

uint64_t OUTLINED_FUNCTION_23()
{
  uint64_t v0;
  unint64_t v1;

  return outlined consume of Data?(v0, v1);
}

uint64_t SiriContactsActionType.id.getter()
{
  char *v0;

  return *(_QWORD *)&aMessage_2[8 * *v0];
}

uint64_t SiriContactsActionType.rawValue.getter()
{
  char *v0;

  return *(_QWORD *)&aMessage_2[8 * *v0];
}

void *static SiriContactsActionType.compactCases.getter()
{
  return &outlined read-only object #0 of static SiriContactsActionType.compactCases.getter;
}

void *static SiriContactsActionType.watchCases.getter()
{
  return &outlined read-only object #0 of static SiriContactsActionType.watchCases.getter;
}

void SiriContactsActionType.isCallable.getter()
{
  __asm { BR              X9 }
}

void sub_246192240()
{
  int v0;
  char v1;

  v1 = _stringCompareWithSmolCheck(_:_:expecting:)();
  OUTLINED_FUNCTION_4_0();
  if ((v1 & 1) != 0)
    OUTLINED_FUNCTION_0_0();
  else
    ((void (*)(unint64_t))((char *)&loc_2461922E0 + 4 * byte_2461AF1E5[v0]))(0xE90000000000006CLL);
}

void specialized == infix<A>(_:_:)()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;

  OUTLINED_FUNCTION_2_0();
  v2 = v2 && v0 == v1;
  if (!v2)
    OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0();
}

{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;

  OUTLINED_FUNCTION_2_0();
  v2 = v2 && v0 == v1;
  if (!v2)
    OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0();
}

SiriContactsCommon::SiriContactsActionType_optional __swiftcall SiriContactsActionType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  void *object;
  Swift::String v3;
  char *v4;
  unint64_t v5;
  SiriContactsCommon::SiriContactsActionType_optional result;
  char v7;

  object = rawValue._object;
  v3._countAndFlagsBits = rawValue._countAndFlagsBits;
  v4 = v1;
  v3._object = object;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of SiriContactsActionType.init(rawValue:), v3);
  result.value = OUTLINED_FUNCTION_3_0();
  v7 = 5;
  if (v5 < 5)
    v7 = v5;
  *v4 = v7;
  return result;
}

void *static SiriContactsActionType.allCases.getter()
{
  return &outlined read-only object #0 of static SiriContactsActionType.allCases.getter;
}

void protocol witness for static Equatable.== infix(_:_:) in conformance SiriContactsActionType()
{
  specialized == infix<A>(_:_:)();
}

void protocol witness for Hashable.hashValue.getter in conformance SiriContactsActionType()
{
  specialized RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance SiriContactsActionType()
{
  return specialized RawRepresentable<>.hash(into:)();
}

void protocol witness for Hashable._rawHashValue(seed:) in conformance SiriContactsActionType()
{
  specialized RawRepresentable<>._rawHashValue(seed:)();
}

SiriContactsCommon::SiriContactsActionType_optional protocol witness for RawRepresentable.init(rawValue:) in conformance SiriContactsActionType(Swift::String *a1)
{
  return SiriContactsActionType.init(rawValue:)(*a1);
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance SiriContactsActionType@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = SiriContactsActionType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void protocol witness for static CaseIterable.allCases.getter in conformance SiriContactsActionType(_QWORD *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of static SiriContactsActionType.allCases.getter;
}

uint64_t protocol witness for Identifiable.id.getter in conformance SiriContactsActionType@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = SiriContactsActionType.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t protocol witness for Decodable.init(from:) in conformance SiriContactsActionType()
{
  lazy protocol witness table accessor for type SiriContactsActionType and conformance SiriContactsActionType();
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance SiriContactsActionType()
{
  lazy protocol witness table accessor for type SiriContactsActionType and conformance SiriContactsActionType();
  return RawRepresentable<>.encode(to:)();
}

unint64_t lazy protocol witness table accessor for type SiriContactsActionType and conformance SiriContactsActionType()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SiriContactsActionType and conformance SiriContactsActionType;
  if (!lazy protocol witness table cache variable for type SiriContactsActionType and conformance SiriContactsActionType)
  {
    result = MEMORY[0x249552EA8]("51Y\vhU", &type metadata for SiriContactsActionType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriContactsActionType and conformance SiriContactsActionType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SiriContactsActionType and conformance SiriContactsActionType;
  if (!lazy protocol witness table cache variable for type SiriContactsActionType and conformance SiriContactsActionType)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for SiriContactsActionType, &type metadata for SiriContactsActionType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriContactsActionType and conformance SiriContactsActionType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SiriContactsActionType and conformance SiriContactsActionType;
  if (!lazy protocol witness table cache variable for type SiriContactsActionType and conformance SiriContactsActionType)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for SiriContactsActionType, &type metadata for SiriContactsActionType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriContactsActionType and conformance SiriContactsActionType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SiriContactsActionType and conformance SiriContactsActionType;
  if (!lazy protocol witness table cache variable for type SiriContactsActionType and conformance SiriContactsActionType)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for SiriContactsActionType, &type metadata for SiriContactsActionType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriContactsActionType and conformance SiriContactsActionType);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [SiriContactsActionType] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [SiriContactsActionType] and conformance [A];
  if (!lazy protocol witness table cache variable for type [SiriContactsActionType] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [SiriContactsActionType]);
    result = MEMORY[0x249552EA8](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [SiriContactsActionType] and conformance [A]);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249552E9C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t associated type witness table accessor for Identifiable.ID : Hashable in SiriContactsActionType()
{
  return MEMORY[0x24BEE0D10];
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SiriContactsActionType(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFC)
  {
    if (a2 + 4 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 4) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v5 = v6 - 5;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriContactsActionType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_246192754 + 4 * byte_2461AF1EF[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_246192788 + 4 * byte_2461AF1EA[v4]))();
}

uint64_t sub_246192788(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246192790(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246192798);
  return result;
}

uint64_t sub_2461927A4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2461927ACLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_2461927B0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2461927B8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for SiriContactsActionType(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for SiriContactsActionType(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SiriContactsActionType()
{
  return &type metadata for SiriContactsActionType;
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t static IDSHelper.format(emailAddresses:phoneNumbers:)(unint64_t a1, unint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char *v7;
  SEL *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char *v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  char *v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  char v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD v62[2];
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  uint64_t v71;

  v3 = a1;
  v71 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
  {
    OUTLINED_FUNCTION_13_0();
    result = _CocoaArrayWrapper.endIndex.getter();
    v4 = result;
  }
  else
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = OUTLINED_FUNCTION_13_0();
  }
  v52 = a2;
  if (v4)
  {
    if (v4 < 1)
    {
      __break(1u);
      goto LABEL_45;
    }
    v6 = 0;
    v7 = (char *)MEMORY[0x24BEE4AF8];
    v53 = v3 & 0xC000000000000001;
    v54 = v4;
    v8 = (SEL *)&unk_251743000;
    v56 = v3;
    do
    {
      if (v53)
        v9 = (id)MEMORY[0x249552908](v6, v3);
      else
        v9 = *(id *)(v3 + 8 * v6 + 32);
      v10 = v9;
      v11 = objc_msgSend(v9, v8[473]);
      v12 = (void *)MEMORY[0x249552B9C]();

      if (v12)
      {
        v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v16 = v15;

      }
      else
      {
        v14 = 0;
        v16 = 0;
      }
      v17 = OUTLINED_FUNCTION_17_0(v13, sel_label);
      if (v17)
      {
        v18 = v17;
        v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v58 = v20;
        v60 = v19;

      }
      else
      {
        v58 = 0xE000000000000000;
        v60 = 0;
      }
      v21 = OUTLINED_FUNCTION_17_0((uint64_t)v17, v8[473]);
      v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v24 = v23;

      v26 = OUTLINED_FUNCTION_17_0(v25, sel_identifier);
      v27 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v29 = v28;

      if (v16)
        v30 = v14;
      else
        v30 = 0;
      if (v16)
        v31 = v16;
      else
        v31 = 0xE000000000000000;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v7 = OUTLINED_FUNCTION_0_1(0, *((_QWORD *)v7 + 2) + 1);
      v33 = *((_QWORD *)v7 + 2);
      v32 = *((_QWORD *)v7 + 3);
      if (v33 >= v32 >> 1)
        v7 = OUTLINED_FUNCTION_0_1((char *)(v32 > 1), v33 + 1);
      *((_QWORD *)v7 + 2) = v33 + 1;
      v34 = &v7[72 * v33];
      v34[32] = 0;
      ++v6;
      *((_QWORD *)v34 + 5) = v60;
      *((_QWORD *)v34 + 6) = v58;
      *((_QWORD *)v34 + 7) = v22;
      *((_QWORD *)v34 + 8) = v24;
      *((_QWORD *)v34 + 9) = v27;
      *((_QWORD *)v34 + 10) = v29;
      *((_QWORD *)v34 + 11) = v30;
      *((_QWORD *)v34 + 12) = v31;
      v3 = v56;
      v8 = (SEL *)&unk_251743000;
    }
    while (v54 != v6);
  }
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_15_0();
  v35 = v52;
  if (!(v52 >> 62))
  {
    v36 = *(_QWORD *)((v52 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v36)
      goto LABEL_28;
LABEL_43:
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_15_0();
    return v71;
  }
  swift_bridgeObjectRetain();
  result = _CocoaArrayWrapper.endIndex.getter();
  v36 = result;
  if (!result)
    goto LABEL_43;
LABEL_28:
  if (v36 >= 1)
  {
    v37 = 0;
    v38 = 0;
    v39 = (char *)MEMORY[0x24BEE4AF8];
    v51 = v36;
    do
    {
      if ((v52 & 0xC000000000000001) != 0)
        v40 = (id)MEMORY[0x249552908](v37, v35);
      else
        v40 = *(id *)(v35 + 8 * v37 + 32);
      v41 = v40;
      v70 = v40;
      closure #2 in static IDSHelper.format(emailAddresses:phoneNumbers:)(&v70, v62);

      v42 = v63;
      if (v63)
      {
        v61 = v38;
        v55 = v62[0];
        v44 = v64;
        v43 = v65;
        v46 = v66;
        v45 = v67;
        v47 = v68;
        v57 = v62[1];
        v59 = v69;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v39 = OUTLINED_FUNCTION_0_1(0, *((_QWORD *)v39 + 2) + 1);
        v49 = *((_QWORD *)v39 + 2);
        v48 = *((_QWORD *)v39 + 3);
        if (v49 >= v48 >> 1)
          v39 = OUTLINED_FUNCTION_0_1((char *)(v48 > 1), v49 + 1);
        *((_QWORD *)v39 + 2) = v49 + 1;
        v50 = &v39[72 * v49];
        v50[32] = v55 & 1;
        *((_QWORD *)v50 + 5) = v57;
        *((_QWORD *)v50 + 6) = v42;
        *((_QWORD *)v50 + 7) = v44;
        *((_QWORD *)v50 + 8) = v43;
        *((_QWORD *)v50 + 9) = v46;
        *((_QWORD *)v50 + 10) = v45;
        *((_QWORD *)v50 + 11) = v47;
        *((_QWORD *)v50 + 12) = v59;
        v36 = v51;
        v35 = v52;
        v38 = v61;
      }
      ++v37;
    }
    while (v36 != v37);
    goto LABEL_43;
  }
LABEL_45:
  __break(1u);
  return result;
}

uint64_t closure #2 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[6] = a5;
  v6[7] = a6;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  return OUTLINED_FUNCTION_2_1();
}

uint64_t closure #2 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_1(v1);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Bool]);
  *v2 = v0;
  v2[1] = closure #2 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:);
  OUTLINED_FUNCTION_7_0();
  return OUTLINED_FUNCTION_3_1();
}

{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t closure #1 in closure #2 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v24 = a5;
  v25 = a6;
  v23 = a4;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[String : Bool], Never>);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v9);
  v13 = a2[3];
  v12 = a2[4];
  v22 = __swift_project_boxed_opaque_existential_1(a2, v13);
  v14 = specialized _arrayForceCast<A, B>(_:)(a3);
  v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v16 = v15;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  v17 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v18 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v18 + v17, (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v12 + 8))(v14, v23, v24, v21, v16, v25, partial apply for closure #1 in closure #1 in closure #2 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:), v18, v13, v12);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t specialized _arrayForceCast<A, B>(_:)(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  __int128 v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v9 = MEMORY[0x24BEE4AF8];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v1, 0);
    v2 = v9;
    v4 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v9;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v5 > 1), v6 + 1, 1);
        v2 = v9;
      }
      v4 += 16;
      *(_QWORD *)(v2 + 16) = v6 + 1;
      outlined init with take of Any(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t static IDSHelper.makeHandleStatuses(rawResults:)(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  BOOL v19;
  unint64_t v20;
  char v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  _BOOL8 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  unint64_t v40;
  char v41;
  unint64_t v42;
  char v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  _BOOL8 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  NSObject *v69;
  os_log_type_t v70;
  uint8_t *v71;
  uint64_t result;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78[5];

  if (!a1 || (v1 = specialized _dictionaryDownCastConditional<A, B, C, D>(_:)(a1)) == 0)
  {
    if (one-time initialization token for siriContacts != -1)
LABEL_53:
      swift_once();
    v68 = type metadata accessor for Logger();
    __swift_project_value_buffer(v68, (uint64_t)static Logger.siriContacts);
    OUTLINED_FUNCTION_13_0();
    v69 = Logger.logObject.getter();
    v70 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v69, v70))
    {
      v71 = (uint8_t *)OUTLINED_FUNCTION_3();
      v78[0] = OUTLINED_FUNCTION_3();
      *(_DWORD *)v71 = 136315138;
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000026, 0x80000002461B29D0, v78);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      OUTLINED_FUNCTION_14_0();
      _os_log_impl(&dword_24618F000, v69, v70, "#IDSHelper makeHandleStatuses - unrecognized IDS results format: %s", v71, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_14_0();
    return Dictionary.init(dictionaryLiteral:)();
  }
  v2 = v1;
  v3 = Dictionary.init(dictionaryLiteral:)();
  specialized _NativeDictionary.makeIterator()(v2, v78);
  v4 = v78[0];
  v5 = v78[1];
  v6 = v78[3];
  v7 = v78[4];
  v8 = v2;
  v9 = (unint64_t)(v78[2] + 64) >> 6;
  v74 = v8;
  swift_bridgeObjectRetain();
  v76 = v5;
  do
  {
    while (1)
    {
      if (v7)
      {
        v10 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v11 = v10 | (v6 << 6);
      }
      else
      {
        v12 = v6 + 1;
        if (__OFADD__(v6, 1))
        {
          __break(1u);
LABEL_51:
          __break(1u);
LABEL_52:
          __break(1u);
          goto LABEL_53;
        }
        if (v12 >= v9)
          goto LABEL_47;
        v13 = *(_QWORD *)(v5 + 8 * v12);
        v14 = v6 + 1;
        if (!v13)
        {
          v14 = v6 + 2;
          if (v6 + 2 >= v9)
            goto LABEL_47;
          v13 = *(_QWORD *)(v5 + 8 * v14);
          if (!v13)
          {
            v14 = v6 + 3;
            if (v6 + 3 >= v9)
              goto LABEL_47;
            v13 = *(_QWORD *)(v5 + 8 * v14);
            if (!v13)
            {
              v14 = v6 + 4;
              if (v6 + 4 >= v9)
                goto LABEL_47;
              v13 = *(_QWORD *)(v5 + 8 * v14);
              if (!v13)
              {
                v14 = v6 + 5;
                if (v6 + 5 >= v9)
                  goto LABEL_47;
                v13 = *(_QWORD *)(v5 + 8 * v14);
                if (!v13)
                {
                  v14 = v6 + 6;
                  if (v6 + 6 >= v9)
                    goto LABEL_47;
                  v13 = *(_QWORD *)(v5 + 8 * v14);
                  if (!v13)
                  {
                    v15 = v6 + 7;
                    while (v15 < v9)
                    {
                      v13 = *(_QWORD *)(v5 + 8 * v15++);
                      if (v13)
                      {
                        v14 = v15 - 1;
                        goto LABEL_23;
                      }
                    }
LABEL_47:
                    swift_release();
                    swift_bridgeObjectRelease();
                    return v3;
                  }
                }
              }
            }
          }
        }
LABEL_23:
        v7 = (v13 - 1) & v13;
        v11 = __clz(__rbit64(v13)) + (v14 << 6);
        v6 = v14;
      }
      v16 = *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v11);
      if (v16 != 2)
        break;
      OUTLINED_FUNCTION_6_0();
      swift_isUniquelyReferenced_nonNull_native();
      OUTLINED_FUNCTION_5_0();
      OUTLINED_FUNCTION_16_0();
      if (v19)
        goto LABEL_52;
      v42 = v40;
      v43 = v41;
      v44 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<String, Bool>);
      v52 = OUTLINED_FUNCTION_8_0(v44, v45, v46, v47, v48, v49, v50, v51, v73, v74, v75, v76, v77);
      if (v52)
      {
        v60 = OUTLINED_FUNCTION_11_0(v52, v53, v54, v55, v56, v57, v58, v59, v73, v74, v75);
        if ((v43 & 1) != (v61 & 1))
          goto LABEL_55;
        v42 = v60;
      }
      v3 = v77;
      if ((v43 & 1) != 0)
      {
        *(_BYTE *)(*(_QWORD *)(v77 + 56) + v42) = 0;
        goto LABEL_43;
      }
      OUTLINED_FUNCTION_1_1(v77 + 8 * (v42 >> 6), v73, v74, v75);
      *(_BYTE *)(v66 + v42) = 0;
      v67 = *(_QWORD *)(v77 + 16);
      v19 = __OFADD__(v67, 1);
      v65 = v67 + 1;
      if (v19)
        goto LABEL_54;
LABEL_42:
      *(_QWORD *)(v3 + 16) = v65;
      swift_bridgeObjectRetain();
LABEL_43:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v5 = v76;
    }
  }
  while (v16 != 1);
  OUTLINED_FUNCTION_6_0();
  swift_isUniquelyReferenced_nonNull_native();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_16_0();
  if (v19)
    goto LABEL_51;
  v20 = v17;
  v21 = v18;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<String, Bool>);
  v30 = OUTLINED_FUNCTION_8_0(v22, v23, v24, v25, v26, v27, v28, v29, v73, v74, v75, v76, v77);
  if (v30)
  {
    v38 = OUTLINED_FUNCTION_11_0(v30, v31, v32, v33, v34, v35, v36, v37, v73, v74, v75);
    if ((v21 & 1) != (v39 & 1))
      goto LABEL_55;
    v20 = v38;
  }
  v3 = v77;
  if ((v21 & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(v77 + 56) + v20) = 1;
    goto LABEL_43;
  }
  OUTLINED_FUNCTION_1_1(v77 + 8 * (v20 >> 6), v73, v74, v75);
  *(_BYTE *)(v62 + v20) = v63;
  v64 = *(_QWORD *)(v77 + 16);
  v19 = __OFADD__(v64, 1);
  v65 = v64 + 1;
  if (!v19)
    goto LABEL_42;
  __break(1u);
LABEL_54:
  __break(1u);
LABEL_55:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[6] = a5;
  v6[7] = a6;
  v6[4] = a3;
  v6[5] = a4;
  v6[2] = a1;
  v6[3] = a2;
  return OUTLINED_FUNCTION_2_1();
}

uint64_t closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4_1(v1);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Bool]);
  *v2 = v0;
  v2[1] = closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:);
  OUTLINED_FUNCTION_7_0();
  return OUTLINED_FUNCTION_3_1();
}

uint64_t closure #1 in closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v24 = a5;
  v25 = a6;
  v23 = a4;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[String : Bool], Never>);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v9);
  v13 = a2[3];
  v12 = a2[4];
  v22 = __swift_project_boxed_opaque_existential_1(a2, v13);
  v14 = specialized _arrayForceCast<A, B>(_:)(a3);
  v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v16 = v15;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  v17 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v18 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v18 + v17, (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v12 + 16))(v14, v23, v24, v21, v16, v25, partial apply for closure #1 in closure #1 in closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:), v18, v13, v12);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t closure #1 in closure #1 in closure #2 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(uint64_t a1, uint64_t a2, const char *a3)
{
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;

  if (one-time initialization token for siriContacts != -1)
    swift_once();
  v5 = type metadata accessor for Logger();
  __swift_project_value_buffer(v5, (uint64_t)static Logger.siriContacts);
  v6 = Logger.logObject.getter();
  v7 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)OUTLINED_FUNCTION_3();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_24618F000, v6, v7, a3, v8, 2u);
    OUTLINED_FUNCTION_0();
  }

  static IDSHelper.makeHandleStatuses(rawResults:)(a1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[String : Bool], Never>);
  return CheckedContinuation.resume(returning:)();
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
  result = specialized UnsafeMutablePointer.initialize(from:count:)(v6 + 32, v2, v3 + 72 * v8 + 32);
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

void closure #2 in static IDSHelper.format(emailAddresses:phoneNumbers:)(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;

  v3 = *a1;
  v4 = objc_msgSend(*a1, sel_value);
  v5 = objc_msgSend(v4, sel_stringValue);

  if (!v5)
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v5 = (id)MEMORY[0x249552728](v6);
    swift_bridgeObjectRelease();
  }
  v7 = (void *)IDSCopyIDForPhoneNumber();

  if (v7)
  {
    v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v9 = v8;

  }
  else
  {
    v26 = 0;
    v9 = 0;
  }
  v10 = objc_msgSend(v3, sel_label);
  if (v10)
  {
    v11 = v10;
    v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v14 = v13;

  }
  else
  {
    v12 = 0;
    v14 = 0xE000000000000000;
  }
  v15 = objc_msgSend(v3, sel_value);
  v16 = objc_msgSend(v15, sel_stringValue);

  v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v19 = v18;

  v20 = objc_msgSend(v3, sel_identifier);
  v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v23 = v22;

  v24 = v26;
  if (!v9)
    v24 = 0;
  *a2 = 1;
  a2[1] = v12;
  v25 = 0xE000000000000000;
  if (v9)
    v25 = v9;
  a2[2] = v14;
  a2[3] = v17;
  a2[4] = v19;
  a2[5] = v21;
  a2[6] = v23;
  a2[7] = v24;
  a2[8] = v25;
}

unint64_t specialized _dictionaryDownCastConditional<A, B, C, D>(_:)(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  int64_t v4;
  unint64_t v5;
  _BYTE *v6;
  unint64_t result;
  uint64_t v8;
  unint64_t v9;
  int64_t i;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  char v15;
  _BYTE *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[40];
  _BYTE __dst[72];
  _BYTE __src[72];
  _QWORD v29[6];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Int>);
    v2 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
  }
  specialized _NativeDictionary.makeIterator()(a1, v29);
  v3 = v29[0];
  v4 = v29[3];
  v5 = v29[4];
  v22 = (unint64_t)(v29[2] + 64) >> 6;
  v23 = v29[1];
  v6 = &__src[40];
  result = swift_bridgeObjectRetain();
  if (!v5)
    goto LABEL_6;
LABEL_5:
  v8 = (v5 - 1) & v5;
  v9 = __clz(__rbit64(v5)) | (v4 << 6);
  for (i = v4; ; v9 = __clz(__rbit64(v12)) + (i << 6))
  {
    outlined init with copy of AnyHashable(*(_QWORD *)(v3 + 48) + 40 * v9, (uint64_t)__src);
    outlined init with copy of Any(*(_QWORD *)(v3 + 56) + 32 * v9, (uint64_t)v6);
    memcpy(__dst, __src, sizeof(__dst));
    outlined init with copy of AnyHashable((uint64_t)__dst, (uint64_t)v26);
    if (!swift_dynamicCast())
    {
      outlined destroy of (key: AnyHashable, value: Any)((uint64_t)__dst);
LABEL_32:
      swift_bridgeObjectRelease();
      outlined consume of [AnyHashable : Any].Iterator._Variant();
      swift_release();
      return 0;
    }
    outlined init with copy of Any((uint64_t)&__dst[40], (uint64_t)v26);
    outlined destroy of (key: AnyHashable, value: Any)((uint64_t)__dst);
    if ((swift_dynamicCast() & 1) == 0)
      goto LABEL_32;
    result = specialized __RawDictionaryStorage.find<A>(_:)(v24, v25);
    v14 = result;
    if ((v15 & 1) != 0)
    {
      v16 = v6;
      v17 = (uint64_t *)(v2[6] + 16 * result);
      result = swift_bridgeObjectRelease();
      *v17 = v24;
      v17[1] = v25;
      v6 = v16;
      *(_QWORD *)(v2[7] + 8 * v14) = v24;
      goto LABEL_29;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v18 = (uint64_t *)(v2[6] + 16 * result);
    *v18 = v24;
    v18[1] = v25;
    *(_QWORD *)(v2[7] + 8 * result) = v24;
    v19 = v2[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_36;
    v2[2] = v21;
LABEL_29:
    v4 = i;
    v5 = v8;
    if (v8)
      goto LABEL_5;
LABEL_6:
    v11 = v4 + 1;
    if (__OFADD__(v4, 1))
      goto LABEL_37;
    if (v11 >= v22)
      goto LABEL_33;
    v12 = *(_QWORD *)(v23 + 8 * v11);
    i = v4 + 1;
    if (!v12)
    {
      i = v4 + 2;
      if (v4 + 2 >= v22)
        goto LABEL_33;
      v12 = *(_QWORD *)(v23 + 8 * i);
      if (!v12)
      {
        i = v4 + 3;
        if (v4 + 3 >= v22)
          goto LABEL_33;
        v12 = *(_QWORD *)(v23 + 8 * i);
        if (!v12)
        {
          i = v4 + 4;
          if (v4 + 4 >= v22)
            goto LABEL_33;
          v12 = *(_QWORD *)(v23 + 8 * i);
          if (!v12)
          {
            i = v4 + 5;
            if (v4 + 5 >= v22)
              goto LABEL_33;
            v12 = *(_QWORD *)(v23 + 8 * i);
            if (!v12)
            {
              v13 = v4 + 6;
              while (v13 < v22)
              {
                v12 = *(_QWORD *)(v23 + 8 * v13++);
                if (v12)
                {
                  i = v13 - 1;
                  goto LABEL_21;
                }
              }
LABEL_33:
              outlined consume of [AnyHashable : Any].Iterator._Variant();
              return (unint64_t)v2;
            }
          }
        }
      }
    }
LABEL_21:
    v8 = (v12 - 1) & v12;
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
  return result;
}

unint64_t protocol witness for IDSStatusProviding.currentIDStatus(forDestinations:service:listenerID:queue:completionBlock:) in conformance IDSIDQueryController(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, void *a7, uint64_t a8)
{
  return (unint64_t)@nonobjc IDSIDQueryController.currentIDStatus(forDestinations:service:listenerID:queue:completionBlock:)(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)&block_descriptor_3, (SEL *)&selRef_currentIDStatusForDestinations_service_listenerID_queue_completionBlock_) & 1;
}

unint64_t protocol witness for IDSStatusProviding.requiredIDStatus(forDestinations:service:listenerID:queue:completionBlock:) in conformance IDSIDQueryController(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, void *a7, uint64_t a8)
{
  return (unint64_t)@nonobjc IDSIDQueryController.currentIDStatus(forDestinations:service:listenerID:queue:completionBlock:)(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)&block_descriptor, (SEL *)&selRef_requiredIDStatusForDestinations_service_listenerID_queue_completionBlock_) & 1;
}

uint64_t dispatch thunk of IDSStatusProviding.currentIDStatus(forDestinations:service:listenerID:queue:completionBlock:)(uint64_t a1, uint64_t a2)
{
  return OUTLINED_FUNCTION_9_0(a1, a2);
}

uint64_t dispatch thunk of IDSStatusProviding.requiredIDStatus(forDestinations:service:listenerID:queue:completionBlock:)(uint64_t a1, uint64_t a2)
{
  return OUTLINED_FUNCTION_9_0(a1, a2);
}

id @nonobjc IDSIDQueryController.currentIDStatus(forDestinations:service:listenerID:queue:completionBlock:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, SEL *a10)
{
  void *v10;
  void *v16;
  NSArray v18;
  id v19;
  _QWORD v21[6];

  v16 = a3;
  if (a1)
  {
    v18.super.isa = Array._bridgeToObjectiveC()().super.isa;
    if (!v16)
      goto LABEL_4;
    goto LABEL_3;
  }
  v18.super.isa = 0;
  if (a3)
LABEL_3:
    v16 = (void *)MEMORY[0x249552728](a2, v16);
LABEL_4:
  if (a5)
    a5 = (void *)MEMORY[0x249552728](a4, a5);
  if (a7)
  {
    v21[4] = a7;
    v21[5] = a8;
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 1107296256;
    v21[2] = thunk for @escaping @callee_guaranteed (@guaranteed [AnyHashable : Any]?) -> ();
    v21[3] = a9;
    a7 = _Block_copy(v21);
    swift_retain();
    swift_release();
  }
  v19 = objc_msgSend(v10, *a10, v18.super.isa, v16, a5, a6, a7);
  _Block_release(a7);

  return v19;
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

uint64_t partial apply for closure #1 in closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(uint64_t a1)
{
  return partial apply for closure #1 in closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))closure #1 in closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:));
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t partial apply for closure #1 in closure #1 in closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(uint64_t a1)
{
  return partial apply for closure #1 in closure #1 in closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(a1, "#IDSHelper getAvailableHandles in remote completion block");
}

uint64_t specialized _NativeDictionary.makeIterator()@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v2 = -1;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  *a2 = a1;
  v6 = *(_QWORD *)(a1 + 64);
  result = a1 + 64;
  v5 = v6;
  if (-v3 < 64)
    v2 = ~(-1 << -(char)v3);
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0;
  a2[4] = v2 & v5;
  return result;
}

uint64_t outlined init with copy of AnyHashable(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t outlined destroy of (key: AnyHashable, value: Any)(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (key: AnyHashable, value: Any));
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
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

uint64_t partial apply for closure #1 in closure #2 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(uint64_t a1)
{
  return partial apply for closure #1 in closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))closure #1 in closure #2 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:));
}

uint64_t partial apply for closure #1 in closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v2;

  return a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6]);
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[String : Bool], Never>);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in closure #1 in closure #2 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(uint64_t a1)
{
  return partial apply for closure #1 in closure #1 in closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(a1, "#IDSHelper getAvailableHandles in local completion block");
}

uint64_t partial apply for closure #1 in closure #1 in closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<[String : Bool], Never>)
                                      - 8)
                          + 80);
  return closure #1 in closure #1 in closure #2 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(a1, v2 + ((v5 + 16) & ~v5), a2);
}

ValueMetadata *type metadata accessor for IDSHelper()
{
  return &type metadata for IDSHelper;
}

uint64_t initializeBufferWithCopyOfBuffer for IDSHelper.SearchHandle(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for IDSHelper.SearchHandle()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for IDSHelper.SearchHandle(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  v6 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for IDSHelper.SearchHandle(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy72_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x48uLL);
}

uint64_t assignWithTake for IDSHelper.SearchHandle(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for IDSHelper.SearchHandle(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 72))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 16);
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

uint64_t storeEnumTagSinglePayload for IDSHelper.SearchHandle(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 72) = 1;
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
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for IDSHelper.SearchHandle()
{
  return &type metadata for IDSHelper.SearchHandle;
}

char *OUTLINED_FUNCTION_0_1(char *a1, int64_t a2)
{
  uint64_t v2;

  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, 1, v2);
}

void OUTLINED_FUNCTION_1_1(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  *(_QWORD *)(a1 + 64) |= v4;
  v8 = (_QWORD *)(*(_QWORD *)(v5 + 48) + 16 * v7);
  *v8 = a4;
  v8[1] = v6;
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return withCheckedContinuation<A>(isolation:function:_:)();
}

__n128 OUTLINED_FUNCTION_4_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  __n128 result;
  __int128 v4;

  *(_QWORD *)(v2 + 64) = a1;
  result = *(__n128 *)(v2 + 24);
  v4 = *(_OWORD *)(v2 + 48);
  *(__n128 *)(a1 + 16) = result;
  *(_QWORD *)(a1 + 32) = v1;
  *(_OWORD *)(a1 + 40) = v4;
  return result;
}

unint64_t OUTLINED_FUNCTION_5_0()
{
  uint64_t v0;
  uint64_t v1;

  return specialized __RawDictionaryStorage.find<A>(_:)(v1, v0);
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return swift_bridgeObjectRetain();
}

BOOL OUTLINED_FUNCTION_8_0(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  Swift::Bool v13;
  Swift::Int v14;

  return _NativeDictionary.ensureUnique(isUnique:capacity:)(v13, v14);
}

uint64_t OUTLINED_FUNCTION_9_0(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, a2);
}

unint64_t OUTLINED_FUNCTION_11_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;

  return specialized __RawDictionaryStorage.find<A>(_:)(a11, v11);
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  uint64_t v0;

  return specialized Array.append<A>(contentsOf:)(v0);
}

id OUTLINED_FUNCTION_17_0(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

void SiriContactsActionItem.bundleIdentifier.getter()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_12_1();
}

void SiriContactsActionItem.displayHandle.getter()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_12_1();
}

void SiriContactsActionItem.label.getter()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_12_1();
}

void SiriContactsActionItem.sanitizedHandle.getter()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_12_1();
}

uint64_t SiriContactsActionItem.shouldGroupByBundleIdentifier.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0
                            + OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_shouldGroupByBundleIdentifier);
}

void SiriContactsActionItem.type.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_type);
}

void SiriContactsActionItem.url.getter(uint64_t a1@<X8>)
{
  uint64_t v1;

  outlined init with copy of URL?(v1 + OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_url, a1, &demangling cache variable for type metadata for URL?);
}

void SiriContactsActionItem.id.getter()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_12_1();
}

id SiriContactsActionItem.__allocating_init(bundleIdentifier:displayHandle:label:sanitizedHandle:shouldGroupByBundleIdentifier:type:url:id:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, void *a8, char a9, __int128 a10, uint64_t a11, uint64_t a12)
{
  objc_class *v12;
  id v19;

  v19 = objc_allocWithZone(v12);
  return SiriContactsActionItem.init(bundleIdentifier:displayHandle:label:sanitizedHandle:shouldGroupByBundleIdentifier:type:url:id:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, (char *)a10, *((uint64_t *)&a10 + 1), a11, a12);
}

id SiriContactsActionItem.init(bundleIdentifier:displayHandle:label:sanitizedHandle:shouldGroupByBundleIdentifier:type:url:id:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, void *a8, char a9, char *a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  _BYTE *v13;
  _BYTE *v14;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t *v25;
  uint64_t *v26;
  _BYTE *v28;
  Swift::String v29;
  Swift::String v30;
  _BYTE *v31;
  uint64_t v32;
  void *v33;
  Swift::String v34;
  _QWORD *v35;
  id v36;
  objc_super v38;
  uint64_t v39;
  uint64_t v40;

  v14 = v13;
  v21 = a13;
  v22 = *a10;
  v23 = &v14[OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_bundleIdentifier];
  *v23 = a1;
  v23[1] = a2;
  v24 = &v14[OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_displayHandle];
  *v24 = a3;
  v24[1] = a4;
  v25 = (uint64_t *)&v14[OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_label];
  *v25 = a5;
  v25[1] = (uint64_t)a6;
  v26 = (uint64_t *)&v14[OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_sanitizedHandle];
  *v26 = a7;
  v26[1] = (uint64_t)a8;
  v14[OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_shouldGroupByBundleIdentifier] = a9;
  v14[OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_type] = v22;
  outlined init with copy of URL?(a11, (uint64_t)&v14[OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_url], &demangling cache variable for type metadata for URL?);
  if (a13)
  {
    v28 = v14;
  }
  else
  {
    v39 = a1;
    v40 = a2;
    swift_bridgeObjectRetain();
    v29._countAndFlagsBits = a5;
    v29._object = a6;
    String.append(_:)(v29);
    swift_bridgeObjectRetain();
    v30._countAndFlagsBits = a7;
    v30._object = a8;
    String.append(_:)(v30);
    v31 = v14;
    swift_bridgeObjectRelease();
    v32 = *(_QWORD *)&aMessage_3[8 * v22];
    v33 = *(void **)&aNavigate_2[8 * v22 + 8];
    v39 = a1;
    swift_bridgeObjectRetain();
    v34._countAndFlagsBits = v32;
    v34._object = v33;
    String.append(_:)(v34);
    OUTLINED_FUNCTION_17_1();
    swift_bridgeObjectRelease();
    a12 = a1;
    v21 = v40;
  }
  v35 = &v14[OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_id];
  *v35 = a12;
  v35[1] = v21;

  v38.receiver = v14;
  v38.super_class = (Class)ObjC metadata update function for SiriContactsActionItem();
  v36 = objc_msgSendSuper2(&v38, sel_init);
  outlined destroy of URL?(a11, &demangling cache variable for type metadata for URL?);
  return v36;
}

uint64_t type metadata accessor for SiriContactsActionItem()
{
  uint64_t result;

  result = type metadata singleton initialization cache for SiriContactsActionItem;
  if (!type metadata singleton initialization cache for SiriContactsActionItem)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t SiriContactsActionItem.description.getter()
{
  uint64_t v0;
  Swift::String v1;
  Swift::String v2;
  Swift::String v3;
  Swift::String v4;
  Swift::String v5;
  uint64_t v6;
  Swift::String v7;

  _StringGuts.grow(_:)(88);
  v1._countAndFlagsBits = 540689481;
  v1._object = (void *)0xE400000000000000;
  String.append(_:)(v1);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_17_1();
  v2._countAndFlagsBits = 0x203A65707954202CLL;
  v2._object = (void *)0xE800000000000000;
  String.append(_:)(v2);
  OUTLINED_FUNCTION_19_0(*(_QWORD *)&aMessage_3[8
                                              * *(char *)(v0
                                                        + OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_type)]);
  OUTLINED_FUNCTION_14_0();
  v3._countAndFlagsBits = 0x656C646E6148202CLL;
  v3._object = (void *)0xEA0000000000203ALL;
  String.append(_:)(v3);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_17_1();
  v4._countAndFlagsBits = 0x3A6C6562614C202CLL;
  v4._object = (void *)0xE900000000000020;
  String.append(_:)(v4);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_17_1();
  v5._countAndFlagsBits = 0xD000000000000019;
  v5._object = (void *)0x80000002461B2A00;
  String.append(_:)(v5);
  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_shouldGroupByBundleIdentifier))
    v6 = 1702195828;
  else
    v6 = 0x65736C6166;
  OUTLINED_FUNCTION_19_0(v6);
  OUTLINED_FUNCTION_14_0();
  v7._object = (void *)0x80000002461B2A20;
  v7._countAndFlagsBits = 0xD000000000000014;
  String.append(_:)(v7);
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_19_0(v0);
  OUTLINED_FUNCTION_14_0();
  return 0;
}

Swift::Int SiriContactsActionItem.hash.getter()
{
  _BYTE v1[72];
  _BYTE __dst[72];

  Hasher.init()();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_14_0();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  memcpy(__dst, v1, sizeof(__dst));
  return Hasher.finalize()();
}

uint64_t SiriContactsActionItem.isEqual(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  char v10;
  char v11;
  void *v13;
  _BYTE v14[24];
  uint64_t v15;

  outlined init with copy of URL?(a1, (uint64_t)v14, &demangling cache variable for type metadata for Any?);
  if (!v15)
  {
    outlined destroy of URL?((uint64_t)v14, &demangling cache variable for type metadata for Any?);
    goto LABEL_21;
  }
  ObjC metadata update function for SiriContactsActionItem();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_21:
    v11 = 0;
    return v11 & 1;
  }
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_bundleIdentifier);
  v3 = v3 && v1 == v2;
  if (!v3 && (OUTLINED_FUNCTION_22_0() & 1) == 0
    || ((OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_label), v3)
      ? (v6 = v4 == v5)
      : (v6 = 0),
        !v6 && (OUTLINED_FUNCTION_22_0() & 1) == 0
     || ((OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_sanitizedHandle), v3)
       ? (v9 = v7 == v8)
       : (v9 = 0),
         !v9 && (OUTLINED_FUNCTION_22_0() & 1) == 0)))
  {

    goto LABEL_21;
  }
  specialized == infix<A>(_:_:)();
  v11 = v10;

  return v11 & 1;
}

void outlined init with copy of URL?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  void (*v4)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledName(a3);
  v3 = OUTLINED_FUNCTION_13_1();
  v4(v3);
  OUTLINED_FUNCTION_12_1();
}

void outlined destroy of URL?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_12_1();
}

id SiriContactsActionItem.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void SiriContactsActionItem.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

BOOL static SiriContactsActionItem.CodingKeys.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void SiriContactsActionItem.CodingKeys.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
  Hasher._combine(_:)(a2);
}

uint64_t SiriContactsActionItem.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  char v11;

  if (a1 == 0xD000000000000010 && a2 == 0x80000002461B2AE0
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v5 = a1 == 0x4879616C70736964 && a2 == 0xED0000656C646E61;
    if (v5 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v6 = a1 == 0x6C6562616CLL && a2 == 0xE500000000000000;
      if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v7 = a1 == 0x657A6974696E6173 && a2 == 0xEF656C646E614864;
        if (v7 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else if (a1 == 0xD00000000000001DLL && a2 == 0x80000002461B2B20
               || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          v8 = a1 == 1701869940 && a2 == 0xE400000000000000;
          if (v8 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            v9 = a1 == 7107189 && a2 == 0xE300000000000000;
            if (v9 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 6;
            }
            else if (a1 == 25705 && a2 == 0xE200000000000000)
            {
              swift_bridgeObjectRelease();
              return 7;
            }
            else
            {
              v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
              swift_bridgeObjectRelease();
              if ((v11 & 1) != 0)
                return 7;
              else
                return 8;
            }
          }
        }
      }
    }
  }
}

uint64_t SiriContactsActionItem.CodingKeys.init(intValue:)()
{
  return 8;
}

Swift::Int SiriContactsActionItem.CodingKeys.hashValue.getter(unsigned __int8 a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

uint64_t SiriContactsActionItem.CodingKeys.intValue.getter()
{
  return 0;
}

uint64_t SiriContactsActionItem.CodingKeys.stringValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2461951D8
                                                                     + 4 * asc_2461AF520[a1]))(0xD000000000000010, 0x80000002461B2AE0);
}

uint64_t sub_2461951D8()
{
  return 0x4879616C70736964;
}

uint64_t sub_2461951FC()
{
  return 0x6C6562616CLL;
}

uint64_t sub_246195210()
{
  return 0x657A6974696E6173;
}

uint64_t sub_246195234(uint64_t a1)
{
  return a1 + 13;
}

uint64_t sub_24619524C()
{
  return 1701869940;
}

uint64_t sub_24619525C()
{
  return 7107189;
}

uint64_t sub_24619526C()
{
  return 25705;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance SiriContactsActionItem.CodingKeys(char *a1, char *a2)
{
  return static SiriContactsActionItem.CodingKeys.== infix(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance SiriContactsActionItem.CodingKeys()
{
  unsigned __int8 *v0;

  return SiriContactsActionItem.CodingKeys.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance SiriContactsActionItem.CodingKeys(uint64_t a1)
{
  unsigned __int8 *v1;

  SiriContactsActionItem.CodingKeys.hash(into:)(a1, *v1);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SiriContactsActionItem.CodingKeys()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance SiriContactsActionItem.CodingKeys()
{
  unsigned __int8 *v0;

  return SiriContactsActionItem.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance SiriContactsActionItem.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = SiriContactsActionItem.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance SiriContactsActionItem.CodingKeys()
{
  return SiriContactsActionItem.CodingKeys.intValue.getter();
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance SiriContactsActionItem.CodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = SiriContactsActionItem.CodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance SiriContactsActionItem.CodingKeys()
{
  lazy protocol witness table accessor for type SiriContactsActionItem.CodingKeys and conformance SiriContactsActionItem.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance SiriContactsActionItem.CodingKeys()
{
  lazy protocol witness table accessor for type SiriContactsActionItem.CodingKeys and conformance SiriContactsActionItem.CodingKeys();
  return CodingKey.debugDescription.getter();
}

id SiriContactsActionItem.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)ObjC metadata update function for SiriContactsActionItem();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t SiriContactsActionItem.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<SiriContactsActionItem.CodingKeys>);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_14_1();
  v7 = v6 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type SiriContactsActionItem.CodingKeys and conformance SiriContactsActionItem.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  OUTLINED_FUNCTION_16_1(OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_bundleIdentifier);
  OUTLINED_FUNCTION_2_2();
  if (!v1)
  {
    OUTLINED_FUNCTION_16_1(OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_displayHandle);
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_16_1(OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_label);
    OUTLINED_FUNCTION_2_2();
    OUTLINED_FUNCTION_16_1(OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_sanitizedHandle);
    OUTLINED_FUNCTION_2_2();
    KeyedEncodingContainer.encode(_:forKey:)();
    lazy protocol witness table accessor for type SiriContactsActionType and conformance SiriContactsActionType();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    type metadata accessor for URL();
    lazy protocol witness table accessor for type URL and conformance URL(&lazy protocol witness table cache variable for type URL and conformance URL, MEMORY[0x24BDCDAE0]);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    OUTLINED_FUNCTION_16_1(OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_id);
    OUTLINED_FUNCTION_2_2();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v7, v3);
}

unint64_t lazy protocol witness table accessor for type SiriContactsActionItem.CodingKeys and conformance SiriContactsActionItem.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SiriContactsActionItem.CodingKeys and conformance SiriContactsActionItem.CodingKeys;
  if (!lazy protocol witness table cache variable for type SiriContactsActionItem.CodingKeys and conformance SiriContactsActionItem.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for SiriContactsActionItem.CodingKeys, &unk_251742608);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriContactsActionItem.CodingKeys and conformance SiriContactsActionItem.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SiriContactsActionItem.CodingKeys and conformance SiriContactsActionItem.CodingKeys;
  if (!lazy protocol witness table cache variable for type SiriContactsActionItem.CodingKeys and conformance SiriContactsActionItem.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for SiriContactsActionItem.CodingKeys, &unk_251742608);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriContactsActionItem.CodingKeys and conformance SiriContactsActionItem.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SiriContactsActionItem.CodingKeys and conformance SiriContactsActionItem.CodingKeys;
  if (!lazy protocol witness table cache variable for type SiriContactsActionItem.CodingKeys and conformance SiriContactsActionItem.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for SiriContactsActionItem.CodingKeys, &unk_251742608);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriContactsActionItem.CodingKeys and conformance SiriContactsActionItem.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SiriContactsActionItem.CodingKeys and conformance SiriContactsActionItem.CodingKeys;
  if (!lazy protocol witness table cache variable for type SiriContactsActionItem.CodingKeys and conformance SiriContactsActionItem.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for SiriContactsActionItem.CodingKeys, &unk_251742608);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriContactsActionItem.CodingKeys and conformance SiriContactsActionItem.CodingKeys);
  }
  return result;
}

id SiriContactsActionItem.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return SiriContactsActionItem.init(from:)(a1);
}

id SiriContactsActionItem.init(from:)(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
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
  id v22;
  objc_super v23;
  char v24;
  char v25;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_14_1();
  v8 = v7 - v6;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<SiriContactsActionItem.CodingKeys>);
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_14_1();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type SiriContactsActionItem.CodingKeys and conformance SiriContactsActionItem.CodingKeys();
  v22 = v3;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
  {
    v10 = v22;
    OUTLINED_FUNCTION_18_0();

    type metadata accessor for SiriContactsActionItem();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v9 = KeyedDecodingContainer.decode(_:forKey:)();
    OUTLINED_FUNCTION_15_1(v9, v12, OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_bundleIdentifier);
    v13 = OUTLINED_FUNCTION_1_2(1);
    OUTLINED_FUNCTION_15_1(v13, v14, OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_displayHandle);
    v15 = OUTLINED_FUNCTION_1_2(2);
    OUTLINED_FUNCTION_15_1(v15, v16, OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_label);
    v17 = OUTLINED_FUNCTION_1_2(3);
    OUTLINED_FUNCTION_15_1(v17, v18, OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_sanitizedHandle);
    v25 = 4;
    *((_BYTE *)v22 + OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_shouldGroupByBundleIdentifier) = KeyedDecodingContainer.decode(_:forKey:)() & 1;
    v24 = 5;
    lazy protocol witness table accessor for type SiriContactsActionType and conformance SiriContactsActionType();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    *((_BYTE *)v22 + OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_type) = v25;
    type metadata accessor for URL();
    v25 = 6;
    lazy protocol witness table accessor for type URL and conformance URL(&lazy protocol witness table cache variable for type URL and conformance URL, MEMORY[0x24BDCDB10]);
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
    outlined init with take of URL?(v8, (uint64_t)v22 + OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_url);
    v19 = OUTLINED_FUNCTION_1_2(7);
    OUTLINED_FUNCTION_15_1(v19, v20, OBJC_IVAR____TtC18SiriContactsCommon22SiriContactsActionItem_id);

    v23.receiver = v22;
    v23.super_class = (Class)type metadata accessor for SiriContactsActionItem();
    v10 = objc_msgSendSuper2(&v23, sel_init);
    OUTLINED_FUNCTION_0_2();
    OUTLINED_FUNCTION_18_0();
  }
  return v10;
}

void lazy protocol witness table accessor for type URL and conformance URL(unint64_t *a1, uint64_t a2)
{
  uint64_t v4;

  if (!*a1)
  {
    v4 = type metadata accessor for URL();
    atomic_store(MEMORY[0x249552EA8](a2, v4), a1);
  }
  OUTLINED_FUNCTION_12_1();
}

uint64_t outlined init with take of URL?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id protocol witness for Decodable.init(from:) in conformance SiriContactsActionItem@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  id result;

  result = SiriContactsActionItem.__allocating_init(from:)(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance SiriContactsActionItem(_QWORD *a1)
{
  return SiriContactsActionItem.encode(to:)(a1);
}

void protocol witness for Identifiable.id.getter in conformance SiriContactsActionItem(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  SiriContactsActionItem.id.getter();
  *a1 = v2;
  a1[1] = v3;
}

uint64_t ObjC metadata update function for SiriContactsActionItem()
{
  return type metadata accessor for SiriContactsActionItem();
}

void type metadata completion function for SiriContactsActionItem()
{
  unint64_t v0;

  type metadata accessor for URL?();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for SiriContactsActionItem()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SiriContactsActionItem.__allocating_init(bundleIdentifier:displayHandle:label:sanitizedHandle:shouldGroupByBundleIdentifier:type:url:id:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of SiriContactsActionItem.encode(to:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of SiriContactsActionItem.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

void type metadata accessor for URL?()
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for URL?)
  {
    type metadata accessor for URL();
    v0 = type metadata accessor for Optional();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for URL?);
  }
}

uint64_t getEnumTagSinglePayload for SiriContactsActionItem.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xF9)
  {
    if (a2 + 7 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 7) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 8;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v5 = v6 - 8;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriContactsActionItem.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 7 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 7) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_246195EA8 + 4 * byte_2461AF52D[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_246195EDC + 4 * byte_2461AF528[v4]))();
}

uint64_t sub_246195EDC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246195EE4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246195EECLL);
  return result;
}

uint64_t sub_246195EF8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246195F00);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_246195F04(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246195F0C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void *type metadata accessor for SiriContactsActionItem.CodingKeys()
{
  return &unk_251742608;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_1_2@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 65) = a1;
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_4_2@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  return String.hash(into:)();
}

void OUTLINED_FUNCTION_9_1()
{
  uint64_t v0;
  void *v1;
  Swift::String v2;

  v2._countAndFlagsBits = v0;
  v2._object = v1;
  String.append(_:)(v2);
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_15_1@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  _QWORD *v4;

  v4 = (_QWORD *)(v3 + a3);
  *v4 = result;
  v4[1] = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_16_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_17_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_0(v0);
}

void OUTLINED_FUNCTION_19_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = v1;
  String.append(_:)(*(Swift::String *)&a1);
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

void static DateComponents.startOfToday.getter()
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = type metadata accessor for Date();
  v15 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_4_3();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_14_1();
  v7 = v6 - v5;
  v8 = OUTLINED_FUNCTION_5_2();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_14_1();
  v12 = v11 - v10;
  v13 = type metadata accessor for Calendar();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_3_3();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v9 + 104))(v12, *MEMORY[0x24BDCEF70], v8);
  Calendar.init(identifier:)();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v12, v8);
  static TimeZone.current.getter();
  Calendar.timeZone.setter();
  Calendar.timeZone.getter();
  static Date.startOfToday.getter();
  Calendar.dateComponents(in:from:)();
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v2, v16);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v7, v3);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v0, v13);
  OUTLINED_FUNCTION_4();
}

uint64_t static Calendar.gregorianCurrent.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v0 = type metadata accessor for TimeZone();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_14_1();
  v1 = OUTLINED_FUNCTION_5_2();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BDCEF70], v1);
  Calendar.init(identifier:)();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  static TimeZone.current.getter();
  return Calendar.timeZone.setter();
}

void static Date.startOfToday.getter()
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

  v4 = type metadata accessor for Date();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = OUTLINED_FUNCTION_1_3();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_14_1();
  v7 = OUTLINED_FUNCTION_5_2();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_14_1();
  v11 = v10 - v9;
  type metadata accessor for Calendar();
  OUTLINED_FUNCTION_4_3();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_3_3();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v8 + 104))(v11, *MEMORY[0x24BDCEF70], v7);
  Calendar.init(identifier:)();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v11, v7);
  static TimeZone.current.getter();
  Calendar.timeZone.setter();
  static Date.now.getter();
  Calendar.startOfDay(for:)();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v0, v3);
  OUTLINED_FUNCTION_4();
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return type metadata accessor for TimeZone();
}

uint64_t OUTLINED_FUNCTION_5_2()
{
  return type metadata accessor for Calendar.Identifier();
}

void CNContact.formattedFullName.getter()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  Class isa;
  id v11;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Locale?);
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_14_1();
  v4 = v3 - v2;
  v5 = type metadata accessor for PersonNameComponents();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_14_1();
  v7 = type metadata accessor for Locale();
  OUTLINED_FUNCTION_52(v4, 1, v8, v7);
  PersonNameComponents.init(from:for:)(v0, v4);
  v9 = (void *)objc_opt_self();
  isa = PersonNameComponents._bridgeToObjectiveC()().super.isa;
  v11 = objc_msgSend(v9, sel_localizedStringFromPersonNameComponents_style_options_, isa, 2, 0);

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  OUTLINED_FUNCTION_48(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  OUTLINED_FUNCTION_17_2();
}

uint64_t specialized static SiriContactsTaskUtil.runTaskWithSafeTimeout<A>(_:fallback:task:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v10;

  *(_QWORD *)(v5 + 56) = a3;
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 64) = v10;
  *v10 = v5;
  v10[1] = specialized static SiriContactsTaskUtil.runTaskWithSafeTimeout<A>(_:fallback:task:);
  return specialized static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)(a1, a2, a4, a5, a1, a2);
}

uint64_t specialized static SiriContactsTaskUtil.runTaskWithSafeTimeout<A>(_:fallback:task:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  OUTLINED_FUNCTION_5_3();
  v4 = *v2;
  *v5 = v4;
  *(_QWORD *)(v6 + 72) = v1;
  swift_task_dealloc();
  if (!v1)
    return OUTLINED_FUNCTION_30(a1, *(uint64_t (**)(void))(v4 + 8));
  OUTLINED_FUNCTION_11_1();
  return OUTLINED_FUNCTION_0_3();
}

uint64_t specialized static SiriContactsTaskUtil.runTaskWithSafeTimeout<A>(_:fallback:task:)()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  _DWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t (*v12)(uint64_t);
  uint64_t v13;

  if (one-time initialization token for siriContacts != -1)
    swift_once();
  v1 = (void *)v0[9];
  v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Logger.siriContacts);
  v3 = v1;
  v4 = v1;
  v5 = Logger.logObject.getter();
  v6 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (_DWORD *)OUTLINED_FUNCTION_3();
    v13 = OUTLINED_FUNCTION_3();
    *v7 = 136315138;
    swift_getErrorValue();
    v8 = Error.localizedDescription.getter();
    v0[6] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v8, v9, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_18_1();
    OUTLINED_FUNCTION_18_1();
    OUTLINED_FUNCTION_53(&dword_24618F000, v5, v6, "#SiriContactsTaskUtil runTaskWithSafeTimeout error caught: %s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_18_1();

  v12 = (uint64_t (*)(uint64_t))v0[1];
  v10 = swift_bridgeObjectRetain();
  return v12(v10);
}

uint64_t specialized _ArrayProtocol.filter(_:)(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = result;
  v4 = *(_QWORD *)(result + 16);
  if (v4)
  {
    v5 = 0;
    v6 = result + 40;
    v7 = MEMORY[0x24BEE4AF8];
    v19 = result + 40;
    do
    {
      v20 = v7;
      v8 = (uint64_t *)(v6 + 16 * v5);
      v9 = v5;
      while (1)
      {
        if (v9 >= *(_QWORD *)(v3 + 16))
        {
          __break(1u);
          return result;
        }
        v11 = *(v8 - 1);
        v10 = *v8;
        v5 = v9 + 1;
        v12 = *(_QWORD *)(a2 + 16);
        swift_bridgeObjectRetain();
        if (!v12)
          break;
        swift_bridgeObjectRetain();
        specialized __RawDictionaryStorage.find<A>(_:)(v11, v10);
        v14 = v13;
        swift_bridgeObjectRelease();
        if ((v14 & 1) == 0)
          break;
        result = swift_bridgeObjectRelease();
        v8 += 2;
        ++v9;
        if (v4 == v5)
        {
          v7 = v20;
          goto LABEL_16;
        }
      }
      v7 = v20;
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v20 + 16) + 1, 1);
        v7 = v20;
      }
      v16 = *(_QWORD *)(v7 + 16);
      v15 = *(_QWORD *)(v7 + 24);
      v17 = v16 + 1;
      if (v16 >= v15 >> 1)
      {
        result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v15 > 1), v16 + 1, 1);
        v17 = v16 + 1;
        v7 = v20;
      }
      *(_QWORD *)(v7 + 16) = v17;
      v18 = v7 + 16 * v16;
      *(_QWORD *)(v18 + 32) = v11;
      *(_QWORD *)(v18 + 40) = v10;
      v6 = v19;
    }
    while (v4 - 1 != v9);
  }
  else
  {
    v7 = MEMORY[0x24BEE4AF8];
  }
LABEL_16:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t specialized Dictionary.merging(_:uniquingKeysWith:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v8;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v8 = a2;
  specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(a1, (uint64_t)specialized thunk for @escaping @callee_guaranteed (@in_guaranteed A, @in_guaranteed B) -> (@out A, @out B), 0, isUniquelyReferenced_nonNull_native, &v8);
  v6 = v8;
  swift_bridgeObjectRelease();
  if (v2)
    swift_bridgeObjectRelease();
  return v6;
}

uint64_t specialized Sequence.compactMap<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  unint64_t v21;
  unint64_t v22;
  char *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = a1;
    v5 = swift_bridgeObjectRetain();
    v6 = 0;
    v25 = MEMORY[0x24BEE4AF8];
    v26 = v5;
    do
    {
      if (*(_QWORD *)(a2 + 16))
      {
        v7 = (_QWORD *)(v4 + v6);
        v28 = *(_BYTE *)(v4 + v6 + 32);
        v8 = *(_QWORD *)(v4 + v6 + 56);
        v9 = *(_QWORD *)(v4 + v6 + 64);
        v29 = v8;
        v10 = v7[10];
        v27 = v7[9];
        v12 = v7[11];
        v11 = v7[12];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain_n();
        v13 = specialized __RawDictionaryStorage.find<A>(_:)(v12, v11);
        if ((v14 & 1) != 0)
        {
          v15 = *(_BYTE *)(*(_QWORD *)(a2 + 56) + v13);
          swift_bridgeObjectRelease();
          if ((v15 & 1) != 0)
          {
            swift_bridgeObjectRetain();
            String.sanitizeCNLabel.getter();
            v17 = v16;
            v19 = v18;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
              v20 = (char *)v25;
            else
              v20 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v25 + 16) + 1, 1, v25);
            v22 = *((_QWORD *)v20 + 2);
            v21 = *((_QWORD *)v20 + 3);
            if (v22 >= v21 >> 1)
              v20 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v21 > 1), v22 + 1, 1, (uint64_t)v20);
            *((_QWORD *)v20 + 2) = v22 + 1;
            v25 = (uint64_t)v20;
            v23 = &v20[56 * v22];
            v23[32] = v28;
            *((_QWORD *)v23 + 5) = v27;
            *((_QWORD *)v23 + 6) = v10;
            *((_QWORD *)v23 + 7) = v17;
            *((_QWORD *)v23 + 8) = v19;
            *((_QWORD *)v23 + 9) = v29;
            *((_QWORD *)v23 + 10) = v9;
          }
          else
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
        }
        v4 = v26;
      }
      v6 += 72;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v25;
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
}

uint64_t FaceTimeHandles.FacetimeHandle.isPhoneNumber.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

void FaceTimeHandles.FacetimeHandle.identifier.getter()
{
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_12_1();
}

void FaceTimeHandles.FacetimeHandle.label.getter()
{
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_12_1();
}

void FaceTimeHandles.FacetimeHandle.value.getter()
{
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_12_1();
}

uint64_t FaceTimeHandles.audioHandles.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FaceTimeHandles.videoHandles.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t CNContact.getEmailIMessageHandles()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_2_1();
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_5_3();
  v1 = *(void **)(v0 + 32);
  OUTLINED_FUNCTION_4_4();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3_0();

  v2 = OUTLINED_FUNCTION_55();
  return OUTLINED_FUNCTION_30(v2, v3);
}

id CNContact.getEmailIMessageHandles()()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id result;
  id v8;
  _QWORD *v9;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t, _QWORD, id);

  v1 = (void *)v0[2];
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = v3;
  v5 = objc_msgSend(v1, sel_emailAddresses);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CNLabeledValue);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v0[3] = v6;

  result = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v0[4] = result;
  if (result)
  {
    v8 = result;
    v0[5] = v4;
    v9 = (_QWORD *)OUTLINED_FUNCTION_6_2();
    v0[6] = v9;
    *v9 = v0;
    v9[1] = CNContact.getEmailIMessageHandles();
    return (id)v10(v2, v4, v6, MEMORY[0x24BEE4AF8], v8);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t CNContact.getFacetimeAudioHandles()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_2_1();
}

{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_5_3();
  v1 = *(void **)(v0 + 40);
  OUTLINED_FUNCTION_4_4();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_3_0();

  v2 = OUTLINED_FUNCTION_55();
  return OUTLINED_FUNCTION_9_2(v2, v3);
}

id CNContact.getFacetimeAudioHandles()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id result;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(void);

  v1 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3 = v2;
  v4 = OUTLINED_FUNCTION_32(v1, sel_emailAddresses);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CNLabeledValue);
  v5 = OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_60(v5);
  v7 = OUTLINED_FUNCTION_32(v6, sel_phoneNumbers);
  v8 = OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_63(v8);
  result = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v0[5] = result;
  if (result)
  {
    v0[6] = v3;
    v10 = (_QWORD *)OUTLINED_FUNCTION_6_2();
    v0[7] = v10;
    v11 = OUTLINED_FUNCTION_16_2(v10, (uint64_t)CNContact.getFacetimeAudioHandles());
    return (id)OUTLINED_FUNCTION_13_2(v11, v12, v13, v14, v15, v16);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t CNContact.getFacetimeVideoHandles()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_2_1();
}

id CNContact.getFacetimeVideoHandles()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id result;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(void);

  v1 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3 = v2;
  v4 = OUTLINED_FUNCTION_32(v1, sel_emailAddresses);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CNLabeledValue);
  v5 = OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_60(v5);
  v7 = OUTLINED_FUNCTION_32(v6, sel_phoneNumbers);
  v8 = OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_63(v8);
  result = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v0[5] = result;
  if (result)
  {
    v0[6] = v3;
    v10 = (_QWORD *)OUTLINED_FUNCTION_6_2();
    v0[7] = v10;
    v11 = OUTLINED_FUNCTION_16_2(v10, (uint64_t)CNContact.getFacetimeVideoHandles());
    return (id)OUTLINED_FUNCTION_13_2(v11, v12, v13, v14, v15, v16);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t CNContact.facetimeURL(forEmail:isVideo:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  return CNContact.facetimeURL(for:handleType:isVideo:)(a1, a2, 3, a3, a4);
}

uint64_t CNContact.facetimeURL(for:handleType:isVideo:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  void *v5;
  void *v6;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;

  v6 = v5;
  v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEB4950]), sel_init);
  v13 = objc_msgSend(v12, sel_faceTimeProvider);

  v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEB49D0]), sel_initWithProvider_, v13);
  type metadata accessor for TUHandle(0, &lazy cache variable for type metadata for TUHandle);
  OUTLINED_FUNCTION_25();
  v15 = TUHandle.__allocating_init(type:value:)(a3, a1, a2);
  objc_msgSend(v14, sel_setHandle_, v15);

  if (objc_msgSend(v6, sel_hasBeenPersisted))
  {
    v16 = objc_msgSend(v6, sel_identifier);
    v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v19 = v18;

    outlined bridged method (mbnn) of @objc TUDialRequest.contactIdentifier.setter(v17, v19, v14);
  }
  objc_msgSend(v14, sel_setVideo_, a4 & 1);
  v20 = OUTLINED_FUNCTION_32((uint64_t)objc_msgSend(v14, sel_setTtyType_, 0), sel_URL);
  if (v20)
  {
    v21 = v20;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    v22 = 0;
    v14 = v21;
  }
  else
  {
    v22 = 1;
  }

  v23 = type metadata accessor for URL();
  return __swift_storeEnumTagSinglePayload(a5, v22, 1, v23);
}

uint64_t CNContact.facetimeURL(forPhone:isVideo:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  return CNContact.facetimeURL(for:handleType:isVideo:)(a1, a2, 2, a3, a4);
}

id TUHandle.__allocating_init(type:value:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;
  void *v7;
  id v8;

  v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v7 = (void *)MEMORY[0x249552728](a2, a3);
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v6, sel_initWithType_value_, a1, v7);

  return v8;
}

void CNContact.familyNamePronunciationString.getter()
{
  CNContact.familyNamePronunciationString.getter(&selRef_pronunciationFamilyName, (const char **)&selRef_phoneticFamilyName);
}

void CNContact.givenNamePronunciationString.getter()
{
  CNContact.familyNamePronunciationString.getter(&selRef_pronunciationGivenName, (const char **)&selRef_phoneticGivenName);
}

void CNContact.familyNamePronunciationString.getter(void *a1, const char **a2)
{
  uint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v4 = OUTLINED_FUNCTION_64();
  v6 = Optional<A>.isNilOrEmpty.getter(v4, v5);
  v7 = swift_bridgeObjectRelease();
  if ((v6 & 1) != 0)
  {
    v8 = OUTLINED_FUNCTION_47(v7, *a2);
    v9 = OUTLINED_FUNCTION_45();
    v11 = v10;

    v12 = OUTLINED_FUNCTION_24();
    v13 = HIBYTE(v11) & 0xF;
    if ((v11 & 0x2000000000000000) == 0)
      v13 = v9 & 0xFFFFFFFFFFFFLL;
    if (v13)
    {
      v14 = OUTLINED_FUNCTION_47(v12, *a2);
      OUTLINED_FUNCTION_45();
      OUTLINED_FUNCTION_29();
    }
  }
  else
  {
    OUTLINED_FUNCTION_64();
  }
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_17_2();
}

void CNContact.middleNamePronunciationString.getter(uint64_t a1)
{
  id v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v1 = OUTLINED_FUNCTION_47(a1, sel_phoneticMiddleName);
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v4 = v3;

  v5 = swift_bridgeObjectRelease();
  v6 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0)
    v6 = v2 & 0xFFFFFFFFFFFFLL;
  if (v6)
  {
    v7 = OUTLINED_FUNCTION_47(v5, sel_phoneticMiddleName);
    OUTLINED_FUNCTION_45();
    OUTLINED_FUNCTION_29();
  }
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_17_2();
}

uint64_t CNContact.getPhoneticRepresentation(locale:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v23;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PhonemeData?);
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_31();
  v6 = type metadata accessor for PhonemeData();
  v23 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_14_1();
  v9 = v8 - v7;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Locale?);
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_14_1();
  v13 = v12 - v11;
  v14 = type metadata accessor for Locale();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_14_1();
  v18 = v17 - v16;
  outlined init with copy of URL?(a1, v13, &demangling cache variable for type metadata for Locale?);
  if (__swift_getEnumTagSinglePayload(v13, 1, v14) == 1)
  {
    outlined destroy of URL?(v13, &demangling cache variable for type metadata for Locale?);
LABEL_5:
    PersonNameComponents.init()();
    CNContact.givenNamePronunciationString.getter();
    PersonNameComponents.givenName.setter();
    CNContact.familyNamePronunciationString.getter();
    v19 = PersonNameComponents.familyName.setter();
    CNContact.middleNamePronunciationString.getter(v19);
    PersonNameComponents.middleName.setter();
    v20 = type metadata accessor for PersonNameComponents();
    return OUTLINED_FUNCTION_52(a2, 0, v21, v20);
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32))(v18, v13, v14);
  ((void (*)())static PhonemeDataParser.parse(from:))();
  if (__swift_getEnumTagSinglePayload(v2, 1, v6) == 1)
  {
    OUTLINED_FUNCTION_42();
    outlined destroy of URL?(v2, &demangling cache variable for type metadata for PhonemeData?);
    goto LABEL_5;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 32))(v9, v2, v6);
  PhonemeData.asNameComponents(locale:)();
  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v9, v6);
  return OUTLINED_FUNCTION_42();
}

BOOL CNContact.isBirthdayToday.getter()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  id v18;
  void *v19;
  void (*v20)(void *, char *, uint64_t);
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  uint64_t v29;
  char v30;
  char v31;
  uint64_t v32;
  char v33;
  char v34;
  uint64_t v35;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DateComponents?);
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_31();
  v2 = type metadata accessor for DateComponents();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v35 - v8;
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v35 - v11;
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v35 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v35 - v16;
  static DateComponents.startOfToday.getter();
  v18 = objc_msgSend(v0, sel_birthday);
  if (!v18)
  {
    OUTLINED_FUNCTION_51((uint64_t)v0, 1);
    goto LABEL_8;
  }
  v19 = v18;
  static DateComponents._unconditionallyBridgeFromObjectiveC(_:)();

  v20 = *(void (**)(void *, char *, uint64_t))(v3 + 32);
  v20(v0, v12, v2);
  OUTLINED_FUNCTION_51((uint64_t)v0, 0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v0, 1, v2) == 1)
  {
LABEL_8:
    OUTLINED_FUNCTION_48(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
    outlined destroy of URL?((uint64_t)v0, &demangling cache variable for type metadata for DateComponents?);
    return 0;
  }
  v20(v15, (char *)v0, v2);
  v21 = DateComponents.month.getter();
  v23 = v22;
  v24 = DateComponents.month.getter();
  if ((v23 & 1) == 0)
  {
    if ((v25 & 1) == 0)
    {
      v26 = v24;
      v27 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
      v27(v9, v17, v2);
      v27(v6, v15, v2);
      if (v21 == v26)
        goto LABEL_15;
LABEL_11:
      OUTLINED_FUNCTION_37((uint64_t)v6);
      OUTLINED_FUNCTION_37((uint64_t)v9);
      OUTLINED_FUNCTION_37((uint64_t)v15);
      OUTLINED_FUNCTION_37((uint64_t)v17);
      return 0;
    }
LABEL_10:
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_46();
    goto LABEL_11;
  }
  if ((v25 & 1) == 0)
    goto LABEL_10;
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_46();
LABEL_15:
  v29 = DateComponents.day.getter();
  v31 = v30;
  v32 = DateComponents.day.getter();
  v34 = v33;
  OUTLINED_FUNCTION_36((uint64_t)v6);
  OUTLINED_FUNCTION_36((uint64_t)v9);
  OUTLINED_FUNCTION_36((uint64_t)v15);
  OUTLINED_FUNCTION_36((uint64_t)v17);
  if ((v31 & 1) == 0)
    return (v34 & 1) == 0 && v29 == v32;
  return (v34 & 1) != 0;
}

uint64_t specialized static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[7] = a3;
  v6[8] = a4;
  v6[5] = a1;
  v6[6] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  v6[9] = swift_task_alloc();
  v6[2] = a5;
  v6[3] = a6;
  return swift_task_switch();
}

uint64_t specialized static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;

  v2 = v0[8];
  v1 = v0[9];
  v3 = v0[6];
  v4 = v0[7];
  v5 = v0[5];
  v6 = type metadata accessor for TaskPriority();
  OUTLINED_FUNCTION_52(v1, 1, v7, v6);
  v8 = (_QWORD *)OUTLINED_FUNCTION_26();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = v4;
  v8[5] = v2;
  swift_retain();
  v9 = _sScTss5Error_pRs_rlE8detached8priority9operationScTyxsAA_pGScPSg_xyYaKYAcntFZSDySSSbG_Tgm5(v1, (uint64_t)&async function pointer to partial apply for specialized closure #1 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:), (uint64_t)v8);
  v0[10] = v9;
  outlined destroy of URL?(v1, &demangling cache variable for type metadata for TaskPriority?);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Bool]);
  v10 = (_QWORD *)swift_task_alloc();
  v0[11] = v10;
  v10[2] = v9;
  v10[3] = v5;
  v10[4] = v3;
  v10[5] = v0 + 2;
  v11 = (_QWORD *)swift_task_alloc();
  v0[12] = v11;
  *v11 = v0;
  v11[1] = specialized static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:);
  return withThrowingTaskGroup<A, B>(of:returning:isolation:body:)();
}

{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  OUTLINED_FUNCTION_43();
  *v3 = *v2;
  *(_QWORD *)(v0 + 104) = v1;
  swift_task_dealloc();
  if (!v1)
    swift_task_dealloc();
  OUTLINED_FUNCTION_11_1();
  return OUTLINED_FUNCTION_0_3();
}

{
  uint64_t v0;
  uint64_t v1;

  swift_release();
  v1 = *(_QWORD *)(v0 + 32);
  OUTLINED_FUNCTION_34();
  return OUTLINED_FUNCTION_22_1(v1, *(uint64_t (**)(void))(v0 + 8));
}

{
  uint64_t v0;

  swift_release();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_19_1();
  return OUTLINED_FUNCTION_2_3(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t specialized closure #1 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v4;
  *v4 = v3;
  v4[1] = specialized closure #1 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:);
  return v6(v3 + 16);
}

uint64_t specialized closure #1 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_5_3();
  *v2 = *v1;
  *(_QWORD *)(v3 + 32) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_11_1();
  return OUTLINED_FUNCTION_21_0();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t _sScTss5Error_pRs_rlE8detached8priority9operationScTyxsAA_pGScPSg_xyYaKYAcntFZSDySSSbG_Tgm5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[4];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of URL?(a1, (uint64_t)v7, &demangling cache variable for type metadata for TaskPriority?);
  v8 = type metadata accessor for TaskPriority();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8) == 1)
  {
    outlined destroy of URL?((uint64_t)v7, &demangling cache variable for type metadata for TaskPriority?);
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    v9 = dispatch thunk of Actor.unownedExecutor.getter();
    v11 = v10;
    swift_unknownObjectRelease();
  }
  else
  {
    v9 = 0;
    v11 = 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Bool]);
  if (v11 | v9)
  {
    v13[0] = 0;
    v13[1] = 0;
    v13[2] = v9;
    v13[3] = v11;
  }
  return swift_task_create();
}

uint64_t specialized closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[12] = a5;
  v6[13] = a6;
  v6[10] = a3;
  v6[11] = a4;
  v6[8] = a1;
  v6[9] = a2;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ThrowingTaskGroup<[String : Bool], Error>.Iterator);
  v6[14] = v7;
  v6[15] = *(_QWORD *)(v7 - 8);
  v6[16] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  v6[17] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t specialized closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)()
{
  __n128 *v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  __n128 *v8;
  __n128 *v9;
  _QWORD *v10;

  v2 = v0[6].n128_u64[0];
  v1 = v0[6].n128_u64[1];
  v3 = v0[5].n128_u64[0];
  v4 = v0[5].n128_u64[1];
  v5 = v0[4].n128_u64[1];
  type metadata accessor for TaskPriority();
  OUTLINED_FUNCTION_28();
  v6 = (_QWORD *)OUTLINED_FUNCTION_26();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v5;
  v7 = swift_retain();
  OUTLINED_FUNCTION_49(v7, (uint64_t)&async function pointer to partial apply for specialized closure #1 in closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:));
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_28();
  v0[1].n128_u64[0] = v2;
  v0[1].n128_u64[1] = v1;
  v8 = (__n128 *)OUTLINED_FUNCTION_26();
  v8[1].n128_u64[0] = 0;
  v8[1].n128_u64[1] = 0;
  v8[2].n128_u64[0] = v3;
  v8[2].n128_u64[1] = v4;
  v9 = outlined init with take of SiriContactsTaskUtil.TimeoutError(v0 + 1, v8 + 3);
  OUTLINED_FUNCTION_49((uint64_t)v9, (uint64_t)&async function pointer to partial apply for specialized closure #2 in closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:));
  OUTLINED_FUNCTION_50();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Bool]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  ThrowingTaskGroup.makeAsyncIterator()();
  v10 = (_QWORD *)swift_task_alloc();
  v0[9].n128_u64[0] = (unint64_t)v10;
  *v10 = v0;
  v10[1] = specialized closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:);
  OUTLINED_FUNCTION_11_1();
  return _sScg8IteratorV4next9isolationxSgScA_pSgYi_tYaq_YKF();
}

{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_11_1();
  return OUTLINED_FUNCTION_21_0();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  _OWORD *v4;

  OUTLINED_FUNCTION_44();
  if (*(_QWORD *)(v0 + 48))
  {
    OUTLINED_FUNCTION_57();
    OUTLINED_FUNCTION_19_1();
    v1 = OUTLINED_FUNCTION_55();
    return v2(v1);
  }
  else
  {
    *(_OWORD *)(v0 + 32) = *(_OWORD *)(v0 + 96);
    lazy protocol witness table accessor for type SiriContactsTaskUtil.TimeoutError and conformance SiriContactsTaskUtil.TimeoutError();
    if (!_getErrorEmbeddedNSError<A>(_:)())
    {
      OUTLINED_FUNCTION_38();
      *v4 = *(_OWORD *)(v0 + 32);
    }
    swift_willThrow();
    OUTLINED_FUNCTION_57();
    OUTLINED_FUNCTION_19_1();
    return OUTLINED_FUNCTION_14_2(*(uint64_t (**)(void))(v0 + 8));
  }
}

{
  uint64_t v0;

  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_57();
  OUTLINED_FUNCTION_19_1();
  return OUTLINED_FUNCTION_2_3(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t specialized closure #1 in closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Bool]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  *v1 = v0;
  v1[1] = specialized closure #1 in closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:);
  return Task.value.getter();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_59(v3);
  if (v1)
    return OUTLINED_FUNCTION_2_3(*(uint64_t (**)(void))(v2 + 8));
  else
    return OUTLINED_FUNCTION_22_1(*(_QWORD *)(v0 + 16), *(uint64_t (**)(void))(v2 + 8));
}

uint64_t _sScg7addTask8priority9operationyScPSg_xyYaKYAcntFSDySSSbG_s5Error_pTg5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD v17[4];
  _QWORD v18[4];

  v4 = v3;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of URL?(a1, (uint64_t)v9, &demangling cache variable for type metadata for TaskPriority?);
  v10 = type metadata accessor for TaskPriority();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10) == 1)
  {
    outlined destroy of URL?((uint64_t)v9, &demangling cache variable for type metadata for TaskPriority?);
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    v11 = dispatch thunk of Actor.unownedExecutor.getter();
    v13 = v12;
    swift_unknownObjectRelease();
  }
  else
  {
    v11 = 0;
    v13 = 0;
  }
  v14 = *v4;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Bool]);
  v15 = (_QWORD *)(v13 | v11);
  if (v13 | v11)
  {
    v18[0] = 0;
    v18[1] = 0;
    v15 = v18;
    v18[2] = v11;
    v18[3] = v13;
  }
  v17[1] = 1;
  v17[2] = v15;
  v17[3] = v14;
  swift_task_create();
  return swift_release();
}

uint64_t specialized closure #2 in closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[6] = a5;
  v6[7] = a6;
  v6[4] = a3;
  v6[5] = a4;
  v7 = type metadata accessor for ContinuousClock();
  v6[8] = v7;
  v6[9] = *(_QWORD *)(v7 - 8);
  v6[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t specialized closure #2 in closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t, uint64_t, char);

  ContinuousClock.init()();
  v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&async function pointer to specialized Clock.sleep(for:tolerance:)
                                                                        + async function pointer to specialized Clock.sleep(for:tolerance:));
  v1 = (_QWORD *)swift_task_alloc();
  v0[11] = v1;
  *v1 = v0;
  v1[1] = specialized closure #2 in closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:);
  return v3(v0[4], v0[5], 0, 0, 1);
}

{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  OUTLINED_FUNCTION_43();
  *v3 = *v2;
  v0[12] = v1;
  swift_task_dealloc();
  (*(void (**)(_QWORD, _QWORD))(v0[9] + 8))(v0[10], v0[8]);
  OUTLINED_FUNCTION_11_1();
  return OUTLINED_FUNCTION_0_3();
}

{
  uint64_t v0;
  _OWORD *v1;

  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v0 + 48);
  lazy protocol witness table accessor for type SiriContactsTaskUtil.TimeoutError and conformance SiriContactsTaskUtil.TimeoutError();
  if (!_getErrorEmbeddedNSError<A>(_:)())
  {
    OUTLINED_FUNCTION_38();
    *v1 = *(_OWORD *)(v0 + 16);
  }
  swift_willThrow();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_14_2(*(uint64_t (**)(void))(v0 + 8));
}

{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t specialized OptionSet<>.init()()
{
  return 0;
}

uint64_t specialized Clock.sleep(for:tolerance:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v12;

  *(_QWORD *)(v6 + 56) = v5;
  v12 = type metadata accessor for ContinuousClock.Instant();
  *(_QWORD *)(v6 + 64) = v12;
  *(_QWORD *)(v6 + 72) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v6 + 80) = swift_task_alloc();
  *(_QWORD *)(v6 + 88) = swift_task_alloc();
  *(_QWORD *)(v6 + 40) = a1;
  *(_QWORD *)(v6 + 48) = a2;
  *(_QWORD *)(v6 + 16) = a3;
  *(_QWORD *)(v6 + 24) = a4;
  *(_BYTE *)(v6 + 32) = a5 & 1;
  return swift_task_switch();
}

uint64_t specialized Clock.sleep(for:tolerance:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  _QWORD *v6;

  v1 = v0[10];
  v2 = v0[8];
  v3 = v0[9];
  type metadata accessor for ContinuousClock();
  lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type ContinuousClock and conformance ContinuousClock, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
  dispatch thunk of Clock.now.getter();
  lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type ContinuousClock.Instant and conformance ContinuousClock.Instant, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
  MEMORY[0x24955295C](v0 + 5, v2, v4);
  v5 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v5;
  v5(v1, v2);
  v6 = (_QWORD *)swift_task_alloc();
  v0[13] = v6;
  *v6 = v0;
  v6[1] = specialized Clock.sleep(for:tolerance:);
  return dispatch thunk of Clock.sleep(until:tolerance:)();
}

{
  uint64_t v0;
  uint64_t *v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  v3 = *(_QWORD *)(*v1 + 88);
  v4 = *(_QWORD *)(*v1 + 64);
  v5 = *v1;
  *(_QWORD *)(v5 + 112) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (v0)
  {
    OUTLINED_FUNCTION_11_1();
    return swift_task_switch();
  }
  else
  {
    swift_task_dealloc();
    OUTLINED_FUNCTION_34();
    return (*(uint64_t (**)(void))(v5 + 8))();
  }
}

{
  uint64_t v0;

  swift_task_dealloc();
  OUTLINED_FUNCTION_34();
  return OUTLINED_FUNCTION_20_0(*(uint64_t (**)(void))(v0 + 8));
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
    v5 = a4 + 72 * a1 + 32;
    v6 = a3 + 72 * v4;
    if (v5 >= v6 || v5 + 72 * v4 <= a3)
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
    v5 = a4 + 56 * a1 + 32;
    v6 = a3 + 56 * v4;
    if (v5 >= v6 || v5 + 56 * v4 <= a3)
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

char *specialized UnsafeMutablePointer.moveInitialize(from:count:)(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[72 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 72 * a2);
  }
  return __src;
}

{
  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[56 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 56 * a2);
  }
  return __src;
}

{
  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
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

uint64_t specialized UnsafeMutablePointer.initialize(from:count:)(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0 && (a3 + 72 * a2 <= a1 || a1 + 72 * a2 <= a3))
    return swift_arrayInitWithCopy();
  OUTLINED_FUNCTION_58();
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0 && (a3 + 16 * a2 <= a1 || a1 + 16 * a2 <= a3))
    return swift_arrayInitWithCopy();
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
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

uint64_t specialized closure #1 in Dictionary.merge(_:uniquingKeysWith:)(_BYTE *a1, uint64_t a2, uint64_t a3, char a4)
{
  *a1 = a4;
  swift_bridgeObjectRetain();
  return a2;
}

uint64_t specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  _QWORD *v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  unint64_t v20;
  char v21;
  int v22;
  _QWORD *v23;
  BOOL v24;
  char v25;
  uint64_t *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t result;
  __int128 v33;

  specialized LazyMapSequence.makeIterator()(a1, a2, a3, &v33);
  swift_bridgeObjectRetain();
  swift_retain();
  v7 = specialized LazyMapSequence.Iterator.next()();
  if (v8)
  {
    v10 = v7;
    v11 = v8;
    v12 = v9;
    while (1)
    {
      v13 = (_QWORD *)*a5;
      v15 = specialized __RawDictionaryStorage.find<A>(_:)(v10, v11);
      v16 = v13[2];
      v17 = (v14 & 1) == 0;
      v18 = v16 + v17;
      if (__OFADD__(v16, v17))
        break;
      v19 = v14;
      if (v13[3] >= v18)
      {
        if ((a4 & 1) == 0)
        {
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<String, Bool>);
          _NativeDictionary.copy()();
        }
      }
      else
      {
        specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v18, a4 & 1);
        v20 = specialized __RawDictionaryStorage.find<A>(_:)(v10, v11);
        if ((v19 & 1) != (v21 & 1))
          goto LABEL_17;
        v15 = v20;
      }
      v22 = v12 & 1;
      v23 = (_QWORD *)*a5;
      if ((v19 & 1) != 0)
      {
        v24 = v22 != 0;
        v25 = *(_BYTE *)(v23[7] + v15);
        swift_bridgeObjectRelease();
        *(_BYTE *)(v23[7] + v15) = (v25 | v24) & 1;
      }
      else
      {
        v23[(v15 >> 6) + 8] |= 1 << v15;
        v26 = (uint64_t *)(v23[6] + 16 * v15);
        *v26 = v10;
        v26[1] = v11;
        *(_BYTE *)(v23[7] + v15) = v22;
        v27 = v23[2];
        v28 = __OFADD__(v27, 1);
        v29 = v27 + 1;
        if (v28)
          goto LABEL_16;
        v23[2] = v29;
      }
      v10 = specialized LazyMapSequence.Iterator.next()();
      v11 = v30;
      v12 = v31;
      a4 = 1;
      if (!v30)
        goto LABEL_14;
    }
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
  }
  else
  {
LABEL_14:
    swift_bridgeObjectRelease();
    swift_release();
    outlined consume of [AnyHashable : Any].Iterator._Variant();
    return swift_release();
  }
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
  unint64_t v14;
  unint64_t i;
  int64_t v16;
  _QWORD *v17;
  unint64_t v18;
  int64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Bool>);
  v37 = a2;
  v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_39;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = v2;
  v35 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  if (!v10)
    goto LABEL_7;
LABEL_6:
  v14 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (i = v14 | (v13 << 6); ; i = __clz(__rbit64(v18)) + (v13 << 6))
  {
    v20 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * i);
    v22 = *v20;
    v21 = v20[1];
    v23 = *(_BYTE *)(*(_QWORD *)(v5 + 56) + i);
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    Hasher.init(_seed:)();
    String.hash(into:)();
    result = Hasher._finalize()();
    v24 = -1 << *(_BYTE *)(v7 + 32);
    v25 = result & ~v24;
    v26 = v25 >> 6;
    if (((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6))) == 0)
    {
      v28 = 0;
      v29 = (unint64_t)(63 - v24) >> 6;
      while (++v26 != v29 || (v28 & 1) == 0)
      {
        v30 = v26 == v29;
        if (v26 == v29)
          v26 = 0;
        v28 |= v30;
        v31 = *(_QWORD *)(v11 + 8 * v26);
        if (v31 != -1)
        {
          v27 = __clz(__rbit64(~v31)) + (v26 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    v27 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v11 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
    v32 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v27);
    *v32 = v22;
    v32[1] = v21;
    *(_BYTE *)(*(_QWORD *)(v7 + 56) + v27) = v23;
    ++*(_QWORD *)(v7 + 16);
    if (v10)
      goto LABEL_6;
LABEL_7:
    v16 = v13 + 1;
    if (__OFADD__(v13, 1))
      goto LABEL_41;
    if (v16 >= v35)
    {
      swift_release();
      v3 = v34;
      v17 = (_QWORD *)(v5 + 64);
      goto LABEL_34;
    }
    v17 = (_QWORD *)(v5 + 64);
    v18 = *(_QWORD *)(v36 + 8 * v16);
    ++v13;
    if (!v18)
    {
      v13 = v16 + 1;
      if (v16 + 1 >= v35)
        goto LABEL_32;
      v18 = *(_QWORD *)(v36 + 8 * v13);
      if (!v18)
        break;
    }
LABEL_18:
    v10 = (v18 - 1) & v18;
  }
  v19 = v16 + 2;
  if (v19 < v35)
  {
    v18 = *(_QWORD *)(v36 + 8 * v19);
    if (!v18)
    {
      while (1)
      {
        v13 = v19 + 1;
        if (__OFADD__(v19, 1))
          goto LABEL_42;
        if (v13 >= v35)
          goto LABEL_32;
        v18 = *(_QWORD *)(v36 + 8 * v13);
        ++v19;
        if (v18)
          goto LABEL_18;
      }
    }
    v13 = v19;
    goto LABEL_18;
  }
LABEL_32:
  swift_release();
  v3 = v34;
LABEL_34:
  if ((v37 & 1) != 0)
  {
    v33 = 1 << *(_BYTE *)(v5 + 32);
    if (v33 >= 64)
      specialized UnsafeMutablePointer.assign(repeating:count:)(0, (unint64_t)(v33 + 63) >> 6, v17);
    else
      *v17 = -1 << v33;
    *(_QWORD *)(v5 + 16) = 0;
  }
LABEL_39:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t specialized UnsafeMutablePointer.assign(repeating:count:)(uint64_t result, uint64_t a2, _QWORD *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

char *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

{
  uint64_t *v3;
  char *result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

char *specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
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
    specialized UnsafeMutablePointer.initialize(from:count:)((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
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
    specialized UnsafeMutablePointer.initialize(from:count:)((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t outlined bridged method (pb) of @objc CNContact.pronunciationGivenName.getter(void *a1, SEL *a2)
{
  if (objc_msgSend(a1, *a2))
  {
    OUTLINED_FUNCTION_45();
    OUTLINED_FUNCTION_29();
  }
  return OUTLINED_FUNCTION_13_1();
}

void outlined bridged method (mbnn) of @objc TUDialRequest.contactIdentifier.setter(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)MEMORY[0x249552728]();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setContactIdentifier_, v4);

}

uint64_t specialized thunk for @escaping @callee_guaranteed (@in_guaranteed A, @in_guaranteed B) -> (@out A, @out B)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;
  uint64_t v5;
  char v6;

  result = specialized closure #1 in Dictionary.merge(_:uniquingKeysWith:)(&v6, *(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  v4 = v6;
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v5;
  *(_BYTE *)(a2 + 16) = v4;
  return result;
}

uint64_t specialized LazyMapSequence.makeIterator()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = -1 << *(_BYTE *)(a1 + 32);
  *a4 = a1;
  v7 = *(_QWORD *)(a1 + 64);
  result = a1 + 64;
  v6 = v7;
  a4[1] = result;
  a4[2] = ~v4;
  if (-v4 < 64)
    v8 = ~(-1 << -(char)v4);
  else
    v8 = -1;
  a4[3] = 0;
  a4[4] = v8 & v6;
  a4[5] = a2;
  a4[6] = a3;
  return result;
}

uint64_t specialized LazyMapSequence.Iterator.next()()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  void (*v11)(uint64_t *__return_ptr, _QWORD *);
  uint64_t result;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  _QWORD v20[2];
  char v21;

  v1 = *v0;
  v3 = v0[3];
  v2 = v0[4];
  v4 = v3;
  if (v2)
  {
    v5 = (v2 - 1) & v2;
    v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    v7 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v6);
    v8 = *v7;
    v9 = v7[1];
    v10 = *(_BYTE *)(*(_QWORD *)(v1 + 56) + v6);
    v0[3] = v4;
    v0[4] = v5;
    v11 = (void (*)(uint64_t *__return_ptr, _QWORD *))v0[5];
    v20[0] = v8;
    v20[1] = v9;
    v21 = v10;
    swift_bridgeObjectRetain();
    v11(&v19, v20);
    swift_bridgeObjectRelease();
    return v19;
  }
  v13 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    v14 = (unint64_t)(v0[2] + 64) >> 6;
    if (v13 < v14)
    {
      v15 = v0[1];
      v16 = *(_QWORD *)(v15 + 8 * v13);
      if (v16)
      {
LABEL_7:
        v5 = (v16 - 1) & v16;
        v6 = __clz(__rbit64(v16)) + (v13 << 6);
        v4 = v13;
        goto LABEL_3;
      }
      v17 = v3 + 2;
      v4 = v3 + 1;
      if (v3 + 2 < v14)
      {
        v16 = *(_QWORD *)(v15 + 8 * v17);
        if (v16)
        {
LABEL_10:
          v13 = v17;
          goto LABEL_7;
        }
        v4 = v3 + 2;
        if (v3 + 3 < v14)
        {
          v16 = *(_QWORD *)(v15 + 8 * (v3 + 3));
          if (v16)
          {
            v13 = v3 + 3;
            goto LABEL_7;
          }
          v17 = v3 + 4;
          v4 = v3 + 3;
          if (v3 + 4 < v14)
          {
            v16 = *(_QWORD *)(v15 + 8 * v17);
            if (v16)
              goto LABEL_10;
            v13 = v3 + 5;
            v4 = v3 + 4;
            if (v3 + 5 < v14)
            {
              v16 = *(_QWORD *)(v15 + 8 * v13);
              if (v16)
                goto LABEL_7;
              v4 = v14 - 1;
              v18 = v3 + 6;
              while (v18 < v14)
              {
                v16 = *(_QWORD *)(v15 + 8 * v18++);
                if (v16)
                {
                  v13 = v18 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    result = 0;
    v0[3] = v4;
    v0[4] = 0;
  }
  return result;
}

uint64_t specialized closure #1 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v8;

  *(_QWORD *)(v4 + 16) = a1;
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 24) = v8;
  *v8 = v4;
  v8[1] = specialized closure #1 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:);
  return specialized closure #1 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)(a2, a3, a4);
}

uint64_t specialized closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  uint64_t v6;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  *(_QWORD *)(v6 + 16) = a1;
  v11 = *a6;
  v12 = a6[1];
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 24) = v13;
  *v13 = v6;
  v13[1] = specialized closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:);
  return specialized closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)(a2, a3, a4, a5, v11, v12);
}

uint64_t specialized closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v6;

  v4 = *v2;
  v6 = *v2;
  OUTLINED_FUNCTION_59(&v6);
  if (!v1)
    **(_QWORD **)(v4 + 16) = a1;
  return ((uint64_t (*)(void))v2[1])();
}

uint64_t specialized closure #1 in closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  *(_QWORD *)(v1 + 16) = a1;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = specialized closure #1 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:);
  return specialized closure #1 in closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)();
}

uint64_t specialized closure #2 in closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  uint64_t v6;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  *(_QWORD *)(v6 + 16) = a1;
  v11 = *a6;
  v12 = a6[1];
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 24) = v13;
  *v13 = v6;
  v13[1] = specialized closure #1 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:);
  return specialized closure #2 in closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)(a2, a3, a4, a5, v11, v12);
}

uint64_t specialized static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  _QWORD *v5;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v5[21] = a3;
  v5[22] = a4;
  v5[19] = a1;
  v5[20] = a2;
  v7 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  v5[23] = v7;
  v5[24] = *(_QWORD *)(v7 - 8);
  v5[25] = swift_task_alloc();
  v5[26] = type metadata accessor for OS_dispatch_queue.Attributes();
  v5[27] = swift_task_alloc();
  type metadata accessor for DispatchQoS();
  v5[28] = swift_task_alloc();
  type metadata accessor for TUHandle(0, &lazy cache variable for type metadata for IDSIDQueryController);
  v5[5] = v8;
  v5[6] = &protocol witness table for IDSIDQueryController;
  v5[2] = a5;
  v9 = a5;
  return swift_task_switch();
}

uint64_t specialized static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD *v24;
  id v25;
  _QWORD *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;

  v1 = v0;
  if (one-time initialization token for siriContacts != -1)
    swift_once();
  v2 = type metadata accessor for Logger();
  v0[29] = __swift_project_value_buffer(v2, (uint64_t)static Logger.siriContacts);
  v3 = Logger.logObject.getter();
  v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)OUTLINED_FUNCTION_3();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_24618F000, v3, v4, "#IDSHelper getAvailableHandles", v5, 2u);
    OUTLINED_FUNCTION_0();
  }
  v7 = v0[21];
  v6 = v0[22];

  v8 = static IDSHelper.format(emailAddresses:phoneNumbers:)(v7, v6);
  v0[30] = v8;
  v9 = *(_QWORD *)(v8 + 16);
  v10 = MEMORY[0x24BEE4AF8];
  if (v9)
  {
    v11 = v8;
    v33 = MEMORY[0x24BEE4AF8];
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v9, 0);
    v12 = v33;
    v13 = *(_QWORD *)(v33 + 16);
    v14 = 16 * v13;
    v15 = (uint64_t *)(v11 + 96);
    do
    {
      v17 = *(v15 - 1);
      v16 = *v15;
      v18 = v13 + 1;
      v19 = *(_QWORD *)(v33 + 24);
      swift_bridgeObjectRetain();
      if (v13 >= v19 >> 1)
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v19 > 1), v18, 1);
      *(_QWORD *)(v33 + 16) = v18;
      v20 = v33 + v14;
      *(_QWORD *)(v20 + 32) = v17;
      *(_QWORD *)(v20 + 40) = v16;
      v14 += 16;
      v15 += 9;
      ++v13;
      --v9;
    }
    while (v9);
    v10 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v12 = MEMORY[0x24BEE4AF8];
  }
  v1[31] = v12;
  v21 = v1[25];
  v28 = v1[24];
  v29 = v1[23];
  v30 = v1[19];
  v32 = v1[20];
  type metadata accessor for TUHandle(0, &lazy cache variable for type metadata for OS_dispatch_queue);
  static DispatchQoS.userInitiated.getter();
  v1[17] = v10;
  lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688], MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v28 + 104))(v21, *MEMORY[0x24BEE5750], v29);
  v22 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  v1[32] = v22;
  v23 = Dictionary.init(dictionaryLiteral:)();
  v1[33] = v23;
  outlined init with copy of IDSStatusProviding((uint64_t)(v1 + 2), (uint64_t)(v1 + 7));
  v24 = (_QWORD *)OUTLINED_FUNCTION_26();
  v1[34] = v24;
  outlined init with take of IDSStatusProviding((__int128 *)(v1 + 7), (uint64_t)(v24 + 2));
  v24[7] = v12;
  v24[8] = v30;
  v24[9] = v32;
  v24[10] = v22;
  v31 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&async function pointer to specialized static SiriContactsTaskUtil.runTaskWithSafeTimeout<A>(_:fallback:task:)
                                                                            + async function pointer to specialized static SiriContactsTaskUtil.runTaskWithSafeTimeout<A>(_:fallback:task:));
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_61();
  v25 = v22;
  v26 = (_QWORD *)swift_task_alloc();
  v1[35] = v26;
  *v26 = v1;
  v26[1] = specialized static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:);
  return v31(50000000000000000, 0, v23, (uint64_t)&async function pointer to partial apply for closure #2 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:), (uint64_t)v24);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  _QWORD *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v23;

  v1 = *(_QWORD *)(v0 + 288);
  v2 = *(_QWORD *)(v0 + 248);
  OUTLINED_FUNCTION_61();
  v3 = specialized _ArrayProtocol.filter(_:)(v2, v1);
  *(_QWORD *)(v0 + 296) = 0;
  swift_bridgeObjectRetain_n();
  v4 = Logger.logObject.getter();
  v5 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (_DWORD *)OUTLINED_FUNCTION_3();
    v23 = OUTLINED_FUNCTION_3();
    *v6 = 136315138;
    v7 = OUTLINED_FUNCTION_61();
    v8 = MEMORY[0x2495527F4](v7, MEMORY[0x24BEE0D00]);
    v10 = v9;
    OUTLINED_FUNCTION_24();
    *(_QWORD *)(v0 + 144) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v8, v10, &v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_62();
    OUTLINED_FUNCTION_53(&dword_24618F000, v4, v5, "#IDSHelper getAvailableHandles remainingDestinations: %s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_62();

  v11 = *(void **)(v0 + 256);
  if (*(_QWORD *)(v3 + 16))
  {
    v13 = *(_QWORD *)(v0 + 152);
    v12 = *(_QWORD *)(v0 + 160);
    v14 = Dictionary.init(dictionaryLiteral:)();
    *(_QWORD *)(v0 + 304) = v14;
    outlined init with copy of IDSStatusProviding(v0 + 16, v0 + 96);
    v15 = (_QWORD *)OUTLINED_FUNCTION_26();
    *(_QWORD *)(v0 + 312) = v15;
    outlined init with take of IDSStatusProviding((__int128 *)(v0 + 96), (uint64_t)(v15 + 2));
    v15[7] = v3;
    v15[8] = v13;
    v15[9] = v12;
    v15[10] = v11;
    v22 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&async function pointer to specialized static SiriContactsTaskUtil.runTaskWithSafeTimeout<A>(_:fallback:task:)
                                                                              + async function pointer to specialized static SiriContactsTaskUtil.runTaskWithSafeTimeout<A>(_:fallback:task:));
    swift_bridgeObjectRetain();
    v16 = v11;
    v17 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 320) = v17;
    *v17 = v0;
    v17[1] = specialized static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:);
    return v22(2500000000000000000, 0, v14, (uint64_t)&async function pointer to partial apply for closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:), (uint64_t)v15);
  }
  else
  {
    OUTLINED_FUNCTION_24();
    OUTLINED_FUNCTION_25();
    v19 = OUTLINED_FUNCTION_13_1();
    v21 = specialized Sequence.compactMap<A>(_:)(v19, v20);
    swift_bridgeObjectRelease();

    OUTLINED_FUNCTION_3_0();
    __swift_destroy_boxed_opaque_existential_0(v0 + 16);
    OUTLINED_FUNCTION_34();
    OUTLINED_FUNCTION_19_1();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v21);
  }
}

{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = specialized Dictionary.merging(_:uniquingKeysWith:)(v0[41], v0[36]);
  v2 = (void *)v0[32];
  v3 = v0[30];
  if (*(_QWORD *)(v1 + 16))
  {
    swift_bridgeObjectRetain();
    specialized Sequence.compactMap<A>(_:)(v3, v1);
    OUTLINED_FUNCTION_3_0();

    OUTLINED_FUNCTION_24();
  }
  else
  {
    OUTLINED_FUNCTION_24();
    OUTLINED_FUNCTION_3_0();

  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)(v0 + 2));
  OUTLINED_FUNCTION_19_1();
  swift_task_dealloc();
  swift_task_dealloc();
  v4 = OUTLINED_FUNCTION_55();
  return OUTLINED_FUNCTION_9_2(v4, v5);
}

uint64_t specialized static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 288) = a1;
  swift_task_dealloc();
  swift_release();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_11_1();
  return OUTLINED_FUNCTION_0_3();
}

{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 328) = a1;
  swift_task_dealloc();
  swift_release();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_11_1();
  return OUTLINED_FUNCTION_0_3();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t destroy for FaceTimeHandles()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void initializeBufferWithCopyOfBuffer for FaceTimeHandles(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  v2 = a2[1];
  *a1 = *a2;
  a1[1] = v2;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_12_1();
}

_QWORD *assignWithCopy for FaceTimeHandles(_QWORD *a1, _QWORD *a2)
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

_OWORD *assignWithTake for FaceTimeHandles(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FaceTimeHandles(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for FaceTimeHandles(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for FaceTimeHandles()
{
  return &type metadata for FaceTimeHandles;
}

uint64_t destroy for FaceTimeHandles.FacetimeHandle()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for FaceTimeHandles.FacetimeHandle(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for FaceTimeHandles.FacetimeHandle(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for FaceTimeHandles.FacetimeHandle(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FaceTimeHandles.FacetimeHandle(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 56))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 16);
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

uint64_t storeEnumTagSinglePayload for FaceTimeHandles.FacetimeHandle(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for FaceTimeHandles.FacetimeHandle()
{
  return &type metadata for FaceTimeHandles.FacetimeHandle;
}

void type metadata accessor for TUHandle(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    objc_opt_self();
    atomic_store(swift_getObjCClassMetadata(), a2);
  }
  OUTLINED_FUNCTION_12_1();
}

unint64_t lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A];
  if (!lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
    result = MEMORY[0x249552EA8](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A]);
  }
  return result;
}

uint64_t outlined init with copy of IDSStatusProviding(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t outlined init with take of IDSStatusProviding(__int128 *a1, uint64_t a2)
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

uint64_t partial apply for closure #2 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_56();
  v1 = swift_task_alloc();
  v2 = (_QWORD *)OUTLINED_FUNCTION_33(v1);
  *v2 = v0;
  v2[1] = partial apply for closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:);
  v3 = OUTLINED_FUNCTION_1_4();
  return closure #2 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(v3, v4, v5, v6, v7, v8);
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t partial apply for closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_56();
  v1 = swift_task_alloc();
  v2 = (_QWORD *)OUTLINED_FUNCTION_33(v1);
  *v2 = v0;
  v2[1] = partial apply for closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:);
  v3 = OUTLINED_FUNCTION_1_4();
  return closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:)(v3, v4, v5, v6, v7, v8);
}

uint64_t sub_24619AA74()
{
  OUTLINED_FUNCTION_54();
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for specialized closure #1 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = swift_task_alloc();
  v8 = (_QWORD *)OUTLINED_FUNCTION_33(v7);
  *v8 = v2;
  v8[1] = partial apply for closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&async function pointer to specialized closure #1 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)
                                                                   + async function pointer to specialized closure #1 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)))(a1, v4, v5, v6);
}

uint64_t partial apply for specialized closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v6 = v2[2];
  v7 = v2[3];
  v9 = v2[4];
  v8 = v2[5];
  v10 = swift_task_alloc();
  v11 = (_QWORD *)OUTLINED_FUNCTION_33(v10);
  *v11 = v3;
  v11[1] = partial apply for specialized closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:);
  return OUTLINED_FUNCTION_7_2(a1, a2, v6, v7, v9, v8, (uint64_t (*)(void))((char *)&async function pointer to specialized closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)+ async function pointer to specialized closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)));
}

uint64_t partial apply for specialized closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)()
{
  uint64_t v0;

  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_4_4();
  return OUTLINED_FUNCTION_20_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_24619ABC4()
{
  OUTLINED_FUNCTION_54();
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for specialized closure #1 in closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD *v4;

  v3 = swift_task_alloc();
  v4 = (_QWORD *)OUTLINED_FUNCTION_33(v3);
  *v4 = v1;
  v4[1] = partial apply for closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:);
  return ((uint64_t (*)(uint64_t))((char *)&async function pointer to specialized closure #1 in closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)
                                          + async function pointer to specialized closure #1 in closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)))(a1);
}

uint64_t sub_24619AC68()
{
  OUTLINED_FUNCTION_54();
  return swift_deallocObject();
}

__n128 *outlined init with take of SiriContactsTaskUtil.TimeoutError(__n128 *a1, __n128 *a2)
{
  __swift_memcpy16_8(a2, a1);
  return a2;
}

uint64_t partial apply for specialized closure #2 in closure #2 in static SiriContactsTaskUtil.runTask<A, B>(_:task:timeoutError:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(void);

  v1 = swift_task_alloc();
  v2 = (_QWORD *)OUTLINED_FUNCTION_33(v1);
  *v2 = v0;
  v2[1] = partial apply for closure #4 in static IDSHelper.getAvailableHandles(for:given:phoneNumbers:idsStatusProvider:);
  v3 = OUTLINED_FUNCTION_1_4();
  return OUTLINED_FUNCTION_7_2(v3, v4, v5, v6, v7, v8, v9);
}

unint64_t lazy protocol witness table accessor for type SiriContactsTaskUtil.TimeoutError and conformance SiriContactsTaskUtil.TimeoutError()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type SiriContactsTaskUtil.TimeoutError and conformance SiriContactsTaskUtil.TimeoutError;
  if (!lazy protocol witness table cache variable for type SiriContactsTaskUtil.TimeoutError and conformance SiriContactsTaskUtil.TimeoutError)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for SiriContactsTaskUtil.TimeoutError, &type metadata for SiriContactsTaskUtil.TimeoutError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SiriContactsTaskUtil.TimeoutError and conformance SiriContactsTaskUtil.TimeoutError);
  }
  return result;
}

void lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x249552EA8](a3, v5), a1);
  }
  OUTLINED_FUNCTION_12_1();
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_2_3(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_5_3()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_7_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(void))
{
  return a7();
}

uint64_t OUTLINED_FUNCTION_9_2(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_13_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(void))
{
  return a6();
}

uint64_t OUTLINED_FUNCTION_14_2(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_16_2@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

void OUTLINED_FUNCTION_18_1()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_19_1()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_20_0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_22_1(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_24()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_25()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_26()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_27()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v1, v0);
}

uint64_t OUTLINED_FUNCTION_28()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v0, 1, 1, v1);
}

void OUTLINED_FUNCTION_29()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_30(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_31()
{
  return 0;
}

id OUTLINED_FUNCTION_32(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_33(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_34()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_36(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_37(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_38()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_41()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t OUTLINED_FUNCTION_42()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

void OUTLINED_FUNCTION_43()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_44()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0[15] + 8))(v0[16], v0[14]);
}

uint64_t OUTLINED_FUNCTION_45()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t OUTLINED_FUNCTION_46()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(v2, v3, v0);
}

id OUTLINED_FUNCTION_47(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_48@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_49(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return _sScg7addTask8priority9operationyScPSg_xyYaKYAcntFSDySSSbG_s5Error_pTg5(v2, a2, v3);
}

void OUTLINED_FUNCTION_50()
{
  uint64_t v0;
  uint64_t *v1;

  outlined destroy of URL?(v0, v1);
}

uint64_t OUTLINED_FUNCTION_51(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_52(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, 1, a4);
}

void OUTLINED_FUNCTION_53(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_54()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_55()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_57()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_59@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_60(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  *(_QWORD *)(v1 + 24) = a1;

}

uint64_t OUTLINED_FUNCTION_61()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_62()
{
  return swift_bridgeObjectRelease_n();
}

void OUTLINED_FUNCTION_63(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  *(_QWORD *)(v1 + 32) = a1;

}

uint64_t OUTLINED_FUNCTION_64()
{
  void *v0;
  SEL *v1;

  return outlined bridged method (pb) of @objc CNContact.pronunciationGivenName.getter(v0, v1);
}

uint64_t getEnumTagSinglePayload for SiriContactsTaskUtil.TimeoutError(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SiriContactsTaskUtil.TimeoutError(uint64_t result, int a2, int a3)
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

uint64_t getEnumTag for SiriContactsTaskUtil.TimeoutError()
{
  return 0;
}

ValueMetadata *type metadata accessor for SiriContactsTaskUtil.TimeoutError()
{
  return &type metadata for SiriContactsTaskUtil.TimeoutError;
}

uint64_t SiriContactsTaskUtil.TimeoutError.errorDescription.getter()
{
  Swift::String v0;
  Swift::String v1;
  Swift::String v2;

  _StringGuts.grow(_:)(51);
  v0._object = (void *)0x80000002461B2B90;
  v0._countAndFlagsBits = 0xD000000000000028;
  String.append(_:)(v0);
  v1._countAndFlagsBits = Duration.description.getter();
  String.append(_:)(v1);
  swift_bridgeObjectRelease();
  v2._countAndFlagsBits = 0x6564656563786520;
  v2._object = (void *)0xE900000000000064;
  String.append(_:)(v2);
  return 0;
}

uint64_t protocol witness for LocalizedError.errorDescription.getter in conformance SiriContactsTaskUtil.TimeoutError()
{
  return SiriContactsTaskUtil.TimeoutError.errorDescription.getter();
}

uint64_t Optional<A>.isNilOrEmpty.getter(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _BOOL4 v3;

  v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  v3 = v2 == 0;
  return !a2 || v3;
}

uint64_t Optional<A>.emptyToNil.getter(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  if (!a2)
    return 0;
  v2 = a1;
  v3 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v3 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v3)
    return 0;
  swift_bridgeObjectRetain();
  return v2;
}

void String.sanitizeCNLabel.getter()
{
  uint64_t v0;
  uint64_t v1;

  v0 = OUTLINED_FUNCTION_2_4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_19();
  CharacterSet.init(charactersIn:)();
  lazy protocol witness table accessor for type String and conformance String();
  StringProtocol.trimmingCharacters(in:)();
  String.lowercased()();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5_4(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_17_2();
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    result = MEMORY[0x249552EA8](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

uint64_t static String.EMPTY.getter()
{
  return 0;
}

void String.sanitizePhoneNumber.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = OUTLINED_FUNCTION_2_4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_19();
  static CharacterSet.urlPathAllowed.getter();
  lazy protocol witness table accessor for type String and conformance String();
  StringProtocol.addingPercentEncoding(withAllowedCharacters:)();
  v3 = v2;
  OUTLINED_FUNCTION_5_4(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  if (v3)
  {
    OUTLINED_FUNCTION_13_1();
    OUTLINED_FUNCTION_17_2();
  }
  else
  {
    __break(1u);
  }
}

unint64_t static String.facetimeAppID.getter()
{
  return OUTLINED_FUNCTION_4_5(18);
}

unint64_t static String.messagesAppID.getter()
{
  return OUTLINED_FUNCTION_4_5(19);
}

unint64_t static String.phoneAppID.getter()
{
  return OUTLINED_FUNCTION_4_5(21);
}

void one-time initialization function for phoneURLPrefix()
{
  static String.phoneURLPrefix = 980182388;
  *(_QWORD *)algn_257551108 = 0xE400000000000000;
}

uint64_t static String.phoneURLPrefix.getter()
{
  if (one-time initialization token for phoneURLPrefix != -1)
    swift_once();
  swift_bridgeObjectRetain();
  return OUTLINED_FUNCTION_13_1();
}

uint64_t static String.appName(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  if (a2)
  {
    objc_allocWithZone(MEMORY[0x24BDC1540]);
    swift_bridgeObjectRetain();
    v2 = OUTLINED_FUNCTION_13_1();
    v4 = @nonobjc LSApplicationRecord.init(bundleIdentifier:allowPlaceholder:)(v2, v3, 1);
    v5 = v4;
    if (v4)
    {
      v6 = objc_msgSend(v4, sel_localizedName);

      static String._unconditionallyBridgeFromObjectiveC(_:)();
    }
  }
  return OUTLINED_FUNCTION_13_1();
}

id @nonobjc LSApplicationRecord.init(bundleIdentifier:allowPlaceholder:)(uint64_t a1, uint64_t a2, char a3)
{
  void *v3;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x249552728]();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  v6 = objc_msgSend(v3, sel_initWithBundleIdentifier_allowPlaceholder_error_, v5, a3 & 1, v10);

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

uint64_t OUTLINED_FUNCTION_2_4()
{
  return type metadata accessor for CharacterSet();
}

unint64_t OUTLINED_FUNCTION_4_5(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000;
}

uint64_t OUTLINED_FUNCTION_5_4@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t PersonNameComponents.init(from:for:)(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v20;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PersonNameComponents?);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = PersonNameComponents.init()();
  v8 = OUTLINED_FUNCTION_3_4(v7, sel_namePrefix);
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_5();
  v9 = PersonNameComponents.namePrefix.setter();
  v10 = OUTLINED_FUNCTION_3_4(v9, sel_givenName);
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_5();
  v11 = PersonNameComponents.givenName.setter();
  v12 = OUTLINED_FUNCTION_3_4(v11, sel_middleName);
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_5();
  v13 = PersonNameComponents.middleName.setter();
  v14 = OUTLINED_FUNCTION_3_4(v13, sel_nickname);
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_5();
  v15 = PersonNameComponents.nickname.setter();
  v16 = OUTLINED_FUNCTION_3_4(v15, sel_familyName);
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_5();
  v17 = PersonNameComponents.familyName.setter();
  v18 = OUTLINED_FUNCTION_3_4(v17, sel_nameSuffix);
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_5();
  PersonNameComponents.nameSuffix.setter();
  CNContact.getPhoneticRepresentation(locale:)(a2, (uint64_t)v6);
  PersonNameComponents.phoneticRepresentation.setter();

  return outlined destroy of Locale?(a2);
}

uint64_t outlined destroy of Locale?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Locale?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void OUTLINED_FUNCTION_0_4()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_1_5()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

id OUTLINED_FUNCTION_3_4(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t CNLabeledValue<>.formattedString.getter()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  uint64_t v4;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBAD98]), sel_init);
  v2 = objc_msgSend(v0, sel_value);
  v3 = objc_msgSend(v1, sel_stringFromPostalAddress_, v2);

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return v4;
}

uint64_t one-time initialization function for siriContacts()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v0, static Logger.siriContacts);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.siriContacts);
  if (one-time initialization token for siriContacts != -1)
    swift_once();
  swift_bridgeObjectRetain();
  return Logger.init(subsystem:category:)();
}

uint64_t static Logger.siriContacts.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (one-time initialization token for siriContacts != -1)
    swift_once();
  v2 = type metadata accessor for Logger();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static Logger.siriContacts);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

ValueMetadata *type metadata accessor for Logger()
{
  return &type metadata for Logger;
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

void one-time initialization function for siriContacts()
{
  strcpy((char *)&static LogConst.Category.siriContacts, "SiriContacts");
  algn_257558008[5] = 0;
  *(_WORD *)&algn_257558008[6] = -5120;
}

uint64_t static SABaseCommand.from(data:)()
{
  void *v0;
  Class isa;
  id v2;
  id v3;
  void *v4;
  id v5;
  uint64_t result;
  uint64_t v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  id v12;
  uint64_t v13;
  void *v14;
  os_log_type_t v15;
  _DWORD *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  os_log_type_t v22;
  uint64_t v23;
  id v24[5];

  v24[4] = *(id *)MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_opt_self();
  isa = Data._bridgeToObjectiveC()().super.isa;
  v24[0] = 0;
  v2 = objc_msgSend(v0, sel_propertyListWithData_options_format_error_, isa, 0, 0, v24);

  if (v2)
  {
    v3 = v24[0];
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [AnyHashable : Any]);
    if (swift_dynamicCast())
    {
      v2 = (id)v23;
      v4 = (void *)objc_opt_self();
      v5 = outlined bridged method (mbnn) of @objc static AceObject.aceObject(with:)(v23, v4);
      if (v5)
      {
        v2 = v5;
        objc_opt_self();
        result = swift_dynamicCastObjCClass();
        if (result)
          return result;

      }
      if (one-time initialization token for siriContacts != -1)
        swift_once();
      v7 = OUTLINED_FUNCTION_4_6();
      OUTLINED_FUNCTION_10_0(v7, (uint64_t)static Logger.siriContacts);
      v8 = OUTLINED_FUNCTION_12_2();
      if (OUTLINED_FUNCTION_3_5(v8))
      {
        *(_WORD *)OUTLINED_FUNCTION_3() = 0;
        v11 = "#SABaseCommand from(data:) failed to convert deserialized data to command, returning nil";
        goto LABEL_18;
      }
    }
    else
    {
      if (one-time initialization token for siriContacts != -1)
        swift_once();
      v21 = OUTLINED_FUNCTION_4_6();
      OUTLINED_FUNCTION_10_0(v21, (uint64_t)static Logger.siriContacts);
      v22 = OUTLINED_FUNCTION_12_2();
      if (OUTLINED_FUNCTION_3_5(v22))
      {
        *(_WORD *)OUTLINED_FUNCTION_3() = 0;
        v11 = "#SABaseCommand from(data:) failed to deserialize input, returning nil";
LABEL_18:
        OUTLINED_FUNCTION_5_5(&dword_24618F000, v9, v10, v11);
        OUTLINED_FUNCTION_0();
      }
    }

  }
  else
  {
    v12 = v24[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
    if (one-time initialization token for siriContacts != -1)
      swift_once();
    v13 = OUTLINED_FUNCTION_4_6();
    __swift_project_value_buffer(v13, (uint64_t)static Logger.siriContacts);
    OUTLINED_FUNCTION_7_3();
    OUTLINED_FUNCTION_7_3();
    v14 = (void *)Logger.logObject.getter();
    v15 = static os_log_type_t.error.getter();
    if (OUTLINED_FUNCTION_9_3(v15))
    {
      v16 = (_DWORD *)OUTLINED_FUNCTION_3();
      v24[0] = (id)OUTLINED_FUNCTION_3();
      *v16 = 136315138;
      swift_getErrorValue();
      v17 = Error.localizedDescription.getter();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v17, v18, (uint64_t *)v24);
      OUTLINED_FUNCTION_11_2();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_0_5();
      OUTLINED_FUNCTION_0_5();
      OUTLINED_FUNCTION_6_3(&dword_24618F000, v19, v20, "#SABaseCommand from(data:) failed to deserialize input, returning nil with error: %s");
      OUTLINED_FUNCTION_8_2();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_0_5();
    OUTLINED_FUNCTION_0_5();
    OUTLINED_FUNCTION_0_5();

  }
  return 0;
}

uint64_t SAClientBoundCommand.data.getter()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  os_log_type_t v14;
  _DWORD *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v21[2];

  v21[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(v1, sel_dictionary);
  if (!v2)
  {
    if (one-time initialization token for siriContacts != -1)
      swift_once();
    v7 = OUTLINED_FUNCTION_4_6();
    OUTLINED_FUNCTION_10_0(v7, (uint64_t)static Logger.siriContacts);
    v8 = OUTLINED_FUNCTION_12_2();
    if (OUTLINED_FUNCTION_3_5(v8))
    {
      *(_WORD *)OUTLINED_FUNCTION_3() = 0;
      OUTLINED_FUNCTION_5_5(&dword_24618F000, v9, v10, "#SAClientBoundCommand data could not obtain necessary info to serialize, returning empty object");
      OUTLINED_FUNCTION_0();
    }

    return 0;
  }
  v3 = v2;
  v21[0] = 0;
  v4 = objc_msgSend((id)objc_opt_self(), sel_dataWithPropertyList_format_options_error_, v2, 200, 0, v21);
  v5 = v21[0];
  if (!v4)
  {
    v11 = v5;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    if (one-time initialization token for siriContacts != -1)
      swift_once();
    v12 = OUTLINED_FUNCTION_4_6();
    __swift_project_value_buffer(v12, (uint64_t)static Logger.siriContacts);
    OUTLINED_FUNCTION_7_3();
    OUTLINED_FUNCTION_7_3();
    v13 = (void *)Logger.logObject.getter();
    v14 = static os_log_type_t.error.getter();
    if (OUTLINED_FUNCTION_9_3(v14))
    {
      v15 = (_DWORD *)OUTLINED_FUNCTION_3();
      v21[0] = (id)OUTLINED_FUNCTION_3();
      *v15 = 136315138;
      swift_getErrorValue();
      v16 = Error.localizedDescription.getter();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v16, v17, (uint64_t *)v21);
      OUTLINED_FUNCTION_11_2();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_0_5();
      OUTLINED_FUNCTION_0_5();
      OUTLINED_FUNCTION_6_3(&dword_24618F000, v18, v19, "#SAClientBoundCommand data failed to serialize command, returning empty object with error: %s");
      OUTLINED_FUNCTION_8_2();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_0_5();
    OUTLINED_FUNCTION_0_5();

    OUTLINED_FUNCTION_0_5();
    return 0;
  }
  v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)();

  return v6;
}

id outlined bridged method (mbnn) of @objc static AceObject.aceObject(with:)(uint64_t a1, void *a2)
{
  Class isa;
  id v4;

  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v4 = objc_msgSend(a2, sel_aceObjectWithDictionary_, isa);

  return v4;
}

void OUTLINED_FUNCTION_0_5()
{
  void *v0;

}

BOOL OUTLINED_FUNCTION_3_5(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_4_6()
{
  return type metadata accessor for Logger();
}

void OUTLINED_FUNCTION_5_5(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

void OUTLINED_FUNCTION_6_3(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

id OUTLINED_FUNCTION_7_3()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_8_2()
{
  return swift_arrayDestroy();
}

BOOL OUTLINED_FUNCTION_9_3(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_10_0(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return Logger.logObject.getter();
}

uint64_t OUTLINED_FUNCTION_11_2()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_12_2()
{
  return static os_log_type_t.error.getter();
}

uint64_t specialized SAClientBoundCommand.data.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  id v22[2];

  v22[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = objc_msgSend(v0, sel_dictionary);
  if (!v1)
  {
    if (one-time initialization token for siriContacts != -1)
      swift_once();
    v6 = type metadata accessor for Logger();
    __swift_project_value_buffer(v6, (uint64_t)static Logger.siriContacts);
    v7 = Logger.logObject.getter();
    v8 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_24618F000, v7, v8, "#SAClientBoundCommand data could not obtain necessary info to serialize, returning empty object", v9, 2u);
      MEMORY[0x249552F14](v9, -1, -1);
    }

    return 0;
  }
  v2 = v1;
  v22[0] = 0;
  v3 = objc_msgSend((id)objc_opt_self(), sel_dataWithPropertyList_format_options_error_, v1, 200, 0, v22);
  v4 = v22[0];
  if (!v3)
  {
    v10 = v4;
    v11 = (void *)_convertNSErrorToError(_:)();

    swift_willThrow();
    if (one-time initialization token for siriContacts != -1)
      swift_once();
    v12 = type metadata accessor for Logger();
    __swift_project_value_buffer(v12, (uint64_t)static Logger.siriContacts);
    v13 = v11;
    v14 = v11;
    v15 = Logger.logObject.getter();
    v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = (void *)swift_slowAlloc();
      v22[0] = v18;
      *(_DWORD *)v17 = 136315138;
      swift_getErrorValue();
      v19 = Error.localizedDescription.getter();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v19, v20, (uint64_t *)v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_24618F000, v15, v16, "#SAClientBoundCommand data failed to serialize command, returning empty object with error: %s", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249552F14](v18, -1, -1);
      MEMORY[0x249552F14](v17, -1, -1);
    }
    else
    {

    }
    return 0;
  }
  v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();

  return v5;
}

uint64_t GetContactDirectInvocationsModel.contactCardPunchout.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)v0;
  outlined copy of Data?(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  return v1;
}

uint64_t outlined copy of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return outlined copy of Data._Representation(a1, a2);
  return a1;
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

uint64_t GetContactDirectInvocationsModel.sendEmailPunchouts.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t GetContactDirectInvocationsModel.sendMessagePunchouts.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t GetContactDirectInvocationsModel.navigationPunchouts.getter()
{
  return swift_bridgeObjectRetain();
}

__n128 GetContactDirectInvocationsModel.init()@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __n128 result;
  _OWORD v7[2];
  uint64_t v8;

  type metadata accessor for SAUIAppPunchOut();
  v2 = OUTLINED_FUNCTION_5_6();
  v3 = OUTLINED_FUNCTION_5_6();
  v4 = OUTLINED_FUNCTION_5_6();
  GetContactDirectInvocationsModel.init(contactCardPunchout:sendEmailPunchouts:sendMessagePunchouts:navigationPunchouts:)(0, 0xF000000000000000, v2, v3, v4, (uint64_t *)v7);
  v5 = v8;
  result = (__n128)v7[1];
  *(_OWORD *)a1 = v7[0];
  *(__n128 *)(a1 + 16) = result;
  *(_QWORD *)(a1 + 32) = v5;
  return result;
}

unint64_t type metadata accessor for SAUIAppPunchOut()
{
  unint64_t result;

  result = lazy cache variable for type metadata for SAUIAppPunchOut;
  if (!lazy cache variable for type metadata for SAUIAppPunchOut)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for SAUIAppPunchOut);
  }
  return result;
}

uint64_t GetContactDirectInvocationsModel.init(contactCardPunchout:sendEmailPunchouts:sendMessagePunchouts:navigationPunchouts:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  char v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  char v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  unint64_t v40;
  char v41;
  uint64_t *v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  unint64_t v58;
  char v59;
  unint64_t v60;
  char v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  BOOL v70;
  unint64_t v71;
  uint64_t *v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v94;
  char v95;
  uint64_t v96;
  _BOOL8 v97;
  Swift::Int v98;
  unint64_t v99;
  char v100;
  char *v101;
  Swift::Bool v102;
  unint64_t v103;
  uint64_t *v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t result;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  unint64_t v114;
  uint64_t v115;
  uint64_t v116;
  _QWORD *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char v122[8];

  v115 = a5;
  v116 = a4;
  v110 = a1;
  v111 = a2;
  v112 = a6;
  v10 = 0;
  v118 = a3;
  v13 = *(_QWORD *)(a3 + 64);
  v11 = a3 + 64;
  v12 = v13;
  v14 = 1 << *(_BYTE *)(v11 - 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v113 = v11;
  v114 = (unint64_t)(v14 + 63) >> 6;
  v16 = (_QWORD *)MEMORY[0x24BEE4B00];
  if ((v15 & v12) == 0)
    goto LABEL_5;
LABEL_4:
  OUTLINED_FUNCTION_3_6();
  while (1)
  {
    OUTLINED_FUNCTION_8_3();
    v24 = v6;
    v6 = (void *)OUTLINED_FUNCTION_17_3();
    v26 = v25;
    swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)v122 = v16;
    v27 = v16;
    v28 = specialized __RawDictionaryStorage.find<A>(_:)(v8, v9);
    if (__OFADD__(v16[2], (v29 & 1) == 0))
    {
      __break(1u);
      goto LABEL_98;
    }
    v30 = v28;
    v31 = v29;
    v32 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<String, Data>);
    if (OUTLINED_FUNCTION_12_3(v32, v33, v34, v35, v36, v37, v38, v39, v109, v110, v111, (uint64_t)v112, v113, v114, v115, v116, v118, v120, v121,
           v122[0]))
    {
      v27 = *(_QWORD **)v122;
      OUTLINED_FUNCTION_13_3();
      OUTLINED_FUNCTION_21_1();
      if (!v41)
        goto LABEL_109;
      v30 = v40;
    }
    v16 = *(_QWORD **)v122;
    if ((v31 & 1) != 0)
    {
      OUTLINED_FUNCTION_16_3(*(_QWORD *)(*(_QWORD *)v122 + 56));
      *v27 = v6;
      v27[1] = v26;
    }
    else
    {
      OUTLINED_FUNCTION_6_4(*(_QWORD *)v122 + 8 * (v30 >> 6));
      v42 = (uint64_t *)(*(_QWORD *)(*(_QWORD *)v122 + 48) + 16 * v30);
      *v42 = v8;
      v42[1] = v9;
      v43 = (_QWORD *)(v16[7] + 16 * v30);
      *v43 = v6;
      v43[1] = v26;
      v44 = v16[2];
      v18 = __OFADD__(v44, 1);
      v45 = v44 + 1;
      if (v18)
        goto LABEL_100;
      v16[2] = v45;
      OUTLINED_FUNCTION_11_3();
    }

    OUTLINED_FUNCTION_27_0();
    OUTLINED_FUNCTION_22_2();
    v10 = v121;
    if (v120)
      goto LABEL_4;
LABEL_5:
    if (__OFADD__(v10, 1))
      goto LABEL_103;
    OUTLINED_FUNCTION_15_2();
    if (v17 == v18)
      goto LABEL_34;
    OUTLINED_FUNCTION_20_1();
    if (!v19)
    {
      OUTLINED_FUNCTION_7_4();
      if (v17 == v18)
        goto LABEL_34;
      OUTLINED_FUNCTION_14_3();
      if (!v20)
      {
        OUTLINED_FUNCTION_7_4();
        if (v17 == v18)
          goto LABEL_34;
        OUTLINED_FUNCTION_14_3();
        if (!v21)
        {
          OUTLINED_FUNCTION_15_2();
          if (v17 == v18)
          {
LABEL_34:
            swift_release();
            OUTLINED_FUNCTION_2_6();
            v47 = (_QWORD *)MEMORY[0x24BEE4B00];
            v119 = (uint64_t)v16;
            if (!v48)
              goto LABEL_36;
LABEL_35:
            OUTLINED_FUNCTION_3_6();
            while (1)
            {
              OUTLINED_FUNCTION_8_3();
              v54 = v6;
              v6 = (void *)OUTLINED_FUNCTION_17_3();
              v56 = v55;
              swift_isUniquelyReferenced_nonNull_native();
              v57 = v47;
              *(_QWORD *)v122 = v47;
              v58 = OUTLINED_FUNCTION_13_3();
              if (__OFADD__(v47[2], (v59 & 1) == 0))
                break;
              v60 = v58;
              v61 = v59;
              v62 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<String, Data>);
              v70 = OUTLINED_FUNCTION_12_3(v62, v63, v64, v65, v66, v67, v68, v69, v109, v110, v111, (uint64_t)v112, v113, v114, v115, v116, v119, v120, v121,
                      v122[0]);
              v16 = (_QWORD *)v119;
              if (v70)
              {
                v57 = *(_QWORD **)v122;
                OUTLINED_FUNCTION_13_3();
                OUTLINED_FUNCTION_21_1();
                if (!v41)
                  goto LABEL_109;
                v60 = v71;
              }
              v47 = *(_QWORD **)v122;
              if ((v61 & 1) != 0)
              {
                OUTLINED_FUNCTION_16_3(*(_QWORD *)(*(_QWORD *)v122 + 56));
                *v57 = v6;
                v57[1] = v56;
              }
              else
              {
                OUTLINED_FUNCTION_6_4(*(_QWORD *)v122 + 8 * (v60 >> 6));
                v72 = (uint64_t *)(*(_QWORD *)(*(_QWORD *)v122 + 48) + 16 * v60);
                *v72 = v8;
                v72[1] = v9;
                v73 = (_QWORD *)(v47[7] + 16 * v60);
                *v73 = v6;
                v73[1] = v56;
                v74 = v47[2];
                v18 = __OFADD__(v74, 1);
                v75 = v74 + 1;
                if (v18)
                  goto LABEL_101;
                v47[2] = v75;
                OUTLINED_FUNCTION_11_3();
              }

              OUTLINED_FUNCTION_27_0();
              OUTLINED_FUNCTION_22_2();
              v46 = v121;
              if (v120)
                goto LABEL_35;
LABEL_36:
              if (__OFADD__(v46, 1))
                goto LABEL_104;
              OUTLINED_FUNCTION_15_2();
              if (v17 == v18)
              {
LABEL_65:
                swift_release();
                OUTLINED_FUNCTION_2_6();
                v77 = (char *)MEMORY[0x24BEE4B00];
                v117 = v47;
                if (!v78)
                  goto LABEL_67;
LABEL_66:
                OUTLINED_FUNCTION_3_6();
                while (1)
                {
                  v85 = (uint64_t *)(*(_QWORD *)(v115 + 48) + 16 * v79);
                  v86 = *v85;
                  v87 = v85[1];
                  v88 = *(void **)(*(_QWORD *)(v115 + 56) + 8 * v79);
                  OUTLINED_FUNCTION_11_3();
                  v89 = v88;
                  v90 = OUTLINED_FUNCTION_17_3();
                  v92 = v91;
                  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                  *(_QWORD *)v122 = v77;
                  v94 = specialized __RawDictionaryStorage.find<A>(_:)(v86, v87);
                  v96 = *((_QWORD *)v77 + 2);
                  v97 = (v95 & 1) == 0;
                  v98 = v96 + v97;
                  if (__OFADD__(v96, v97))
                    goto LABEL_99;
                  v99 = v94;
                  v100 = v95;
                  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<String, Data>);
                  v101 = v122;
                  v102 = _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v98);
                  v16 = (_QWORD *)v119;
                  if (v102)
                  {
                    v101 = *(char **)v122;
                    specialized __RawDictionaryStorage.find<A>(_:)(v86, v87);
                    OUTLINED_FUNCTION_21_1();
                    if (!v41)
                      goto LABEL_109;
                    v99 = v103;
                  }
                  v77 = *(char **)v122;
                  if ((v100 & 1) != 0)
                  {
                    OUTLINED_FUNCTION_16_3(*(_QWORD *)(*(_QWORD *)v122 + 56));
                    *(_QWORD *)v101 = v90;
                    *((_QWORD *)v101 + 1) = v92;
                  }
                  else
                  {
                    OUTLINED_FUNCTION_6_4(*(_QWORD *)v122 + 8 * (v99 >> 6));
                    v104 = (uint64_t *)(*((_QWORD *)v77 + 6) + 16 * v99);
                    *v104 = v86;
                    v104[1] = v87;
                    v105 = (uint64_t *)(*((_QWORD *)v77 + 7) + 16 * v99);
                    *v105 = v90;
                    v105[1] = v92;
                    v106 = *((_QWORD *)v77 + 2);
                    v18 = __OFADD__(v106, 1);
                    v107 = v106 + 1;
                    if (v18)
                      goto LABEL_102;
                    *((_QWORD *)v77 + 2) = v107;
                    OUTLINED_FUNCTION_11_3();
                  }

                  OUTLINED_FUNCTION_27_0();
                  OUTLINED_FUNCTION_22_2();
                  v47 = v117;
                  v76 = v121;
                  if (v120)
                    goto LABEL_66;
LABEL_67:
                  if (__OFADD__(v76, 1))
                    goto LABEL_105;
                  OUTLINED_FUNCTION_15_2();
                  if (v17 == v18)
                  {
LABEL_96:
                    result = swift_release();
                    *v112 = v110;
                    v112[1] = v111;
                    v112[2] = (uint64_t)v16;
                    v112[3] = (uint64_t)v47;
                    v112[4] = (uint64_t)v77;
                    return result;
                  }
                  OUTLINED_FUNCTION_20_1();
                  if (!v80)
                  {
                    OUTLINED_FUNCTION_7_4();
                    if (v17 == v18)
                      goto LABEL_96;
                    OUTLINED_FUNCTION_14_3();
                    if (!v81)
                    {
                      OUTLINED_FUNCTION_7_4();
                      if (v17 == v18)
                        goto LABEL_96;
                      OUTLINED_FUNCTION_14_3();
                      if (!v82)
                      {
                        OUTLINED_FUNCTION_15_2();
                        if (v17 == v18)
                          goto LABEL_96;
                        if (!*(_QWORD *)(v113 + 8 * v83))
                        {
                          while (!__OFADD__(v83, 1))
                          {
                            OUTLINED_FUNCTION_7_4();
                            if (v17 == v18)
                              goto LABEL_96;
                            OUTLINED_FUNCTION_19_2();
                            if (v84)
                              goto LABEL_84;
                          }
                          goto LABEL_108;
                        }
                      }
                    }
                  }
LABEL_84:
                  OUTLINED_FUNCTION_4_7();
                }
              }
              OUTLINED_FUNCTION_20_1();
              if (!v49)
              {
                OUTLINED_FUNCTION_7_4();
                if (v17 == v18)
                  goto LABEL_65;
                OUTLINED_FUNCTION_14_3();
                if (!v50)
                {
                  OUTLINED_FUNCTION_7_4();
                  if (v17 == v18)
                    goto LABEL_65;
                  OUTLINED_FUNCTION_14_3();
                  if (!v51)
                  {
                    OUTLINED_FUNCTION_15_2();
                    if (v17 == v18)
                      goto LABEL_65;
                    if (!*(_QWORD *)(v113 + 8 * v52))
                    {
                      while (!__OFADD__(v52, 1))
                      {
                        OUTLINED_FUNCTION_7_4();
                        if (v17 == v18)
                          goto LABEL_65;
                        OUTLINED_FUNCTION_19_2();
                        if (v53)
                          goto LABEL_53;
                      }
                      goto LABEL_107;
                    }
                  }
                }
              }
LABEL_53:
              OUTLINED_FUNCTION_4_7();
            }
LABEL_98:
            __break(1u);
LABEL_99:
            __break(1u);
LABEL_100:
            __break(1u);
LABEL_101:
            __break(1u);
LABEL_102:
            __break(1u);
LABEL_103:
            __break(1u);
LABEL_104:
            __break(1u);
LABEL_105:
            __break(1u);
            goto LABEL_106;
          }
          if (!*(_QWORD *)(v113 + 8 * v22))
            break;
        }
      }
    }
LABEL_22:
    OUTLINED_FUNCTION_4_7();
  }
  while (!__OFADD__(v22, 1))
  {
    OUTLINED_FUNCTION_7_4();
    if (v17 == v18)
      goto LABEL_34;
    OUTLINED_FUNCTION_19_2();
    if (v23)
      goto LABEL_22;
  }
LABEL_106:
  __break(1u);
LABEL_107:
  __break(1u);
LABEL_108:
  __break(1u);
LABEL_109:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t GetContactDirectInvocationsModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000013 && a2 == 0x80000002461B2C40
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000002461B2C60
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x80000002461B2C80
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x80000002461B2CA0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t GetContactDirectInvocationsModel.CodingKeys.init(intValue:)()
{
  return 4;
}

uint64_t GetContactDirectInvocationsModel.CodingKeys.stringValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_24619CDF0 + 4 * byte_2461AF920[a1]))(0xD000000000000013, 0x80000002461B2C40);
}

uint64_t sub_24619CDF0(uint64_t a1)
{
  return a1 - 1;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance GetContactDirectInvocationsModel.CodingKeys()
{
  unsigned __int8 *v0;

  return GetContactDirectInvocationsModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance GetContactDirectInvocationsModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = GetContactDirectInvocationsModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance GetContactDirectInvocationsModel.CodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = GetContactDirectInvocationsModel.CodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GetContactDirectInvocationsModel.CodingKeys()
{
  lazy protocol witness table accessor for type GetContactDirectInvocationsModel.CodingKeys and conformance GetContactDirectInvocationsModel.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GetContactDirectInvocationsModel.CodingKeys()
{
  lazy protocol witness table accessor for type GetContactDirectInvocationsModel.CodingKeys and conformance GetContactDirectInvocationsModel.CodingKeys();
  return CodingKey.debugDescription.getter();
}

void GetContactDirectInvocationsModel.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  char v19;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GetContactDirectInvocationsModel.CodingKeys>);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  v8 = v1[1];
  v9 = v1[2];
  v14 = v1[3];
  v15 = v9;
  v13 = v1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GetContactDirectInvocationsModel.CodingKeys and conformance GetContactDirectInvocationsModel.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v17 = v7;
  v18 = v8;
  v19 = 0;
  lazy protocol witness table accessor for type Data and conformance Data();
  v10 = v16;
  KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
  if (!v10)
  {
    v11 = v13;
    v12 = v14;
    v17 = v15;
    v19 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Data]);
    lazy protocol witness table accessor for type [String : Data] and conformance <> [A : B](&lazy protocol witness table cache variable for type [String : Data] and conformance <> [A : B], (uint64_t (*)(void))lazy protocol witness table accessor for type Data and conformance Data, MEMORY[0x24BEE0D08], MEMORY[0x24BEE04C0]);
    OUTLINED_FUNCTION_0_6();
    v17 = v12;
    v19 = 2;
    OUTLINED_FUNCTION_0_6();
    v17 = v11;
    v19 = 3;
    OUTLINED_FUNCTION_0_6();
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  OUTLINED_FUNCTION_10_1();
}

void GetContactDirectInvocationsModel.init(from:)(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GetContactDirectInvocationsModel.CodingKeys>);
  MEMORY[0x24BDAC7A8](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type GetContactDirectInvocationsModel.CodingKeys and conformance GetContactDirectInvocationsModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
  {
    OUTLINED_FUNCTION_25_0();
  }
  else
  {
    lazy protocol witness table accessor for type Data and conformance Data();
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : Data]);
    outlined copy of Data?(v6, v7);
    lazy protocol witness table accessor for type [String : Data] and conformance <> [A : B](&lazy protocol witness table cache variable for type [String : Data] and conformance <> [A : B], (uint64_t (*)(void))lazy protocol witness table accessor for type Data and conformance Data, MEMORY[0x24BEE0D38], MEMORY[0x24BEE04E0]);
    OUTLINED_FUNCTION_24_0();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_9_4();
    OUTLINED_FUNCTION_24_0();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_9_4();
    OUTLINED_FUNCTION_24_0();
    OUTLINED_FUNCTION_1_6();
    outlined copy of Data?(v6, v7);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_26_0();
    *a2 = v6;
    a2[1] = v7;
    a2[2] = v6;
    a2[3] = v6;
    a2[4] = v6;
    OUTLINED_FUNCTION_25_0();
    OUTLINED_FUNCTION_26_0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_10_1();
}

void protocol witness for Decodable.init(from:) in conformance GetContactDirectInvocationsModel(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  GetContactDirectInvocationsModel.init(from:)(a1, a2);
}

void protocol witness for Encodable.encode(to:) in conformance GetContactDirectInvocationsModel(_QWORD *a1)
{
  GetContactDirectInvocationsModel.encode(to:)(a1);
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

unint64_t lazy protocol witness table accessor for type GetContactDirectInvocationsModel.CodingKeys and conformance GetContactDirectInvocationsModel.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GetContactDirectInvocationsModel.CodingKeys and conformance GetContactDirectInvocationsModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GetContactDirectInvocationsModel.CodingKeys and conformance GetContactDirectInvocationsModel.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for GetContactDirectInvocationsModel.CodingKeys, &unk_251742AC8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactDirectInvocationsModel.CodingKeys and conformance GetContactDirectInvocationsModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GetContactDirectInvocationsModel.CodingKeys and conformance GetContactDirectInvocationsModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GetContactDirectInvocationsModel.CodingKeys and conformance GetContactDirectInvocationsModel.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for GetContactDirectInvocationsModel.CodingKeys, &unk_251742AC8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactDirectInvocationsModel.CodingKeys and conformance GetContactDirectInvocationsModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GetContactDirectInvocationsModel.CodingKeys and conformance GetContactDirectInvocationsModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GetContactDirectInvocationsModel.CodingKeys and conformance GetContactDirectInvocationsModel.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for GetContactDirectInvocationsModel.CodingKeys, &unk_251742AC8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactDirectInvocationsModel.CodingKeys and conformance GetContactDirectInvocationsModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GetContactDirectInvocationsModel.CodingKeys and conformance GetContactDirectInvocationsModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GetContactDirectInvocationsModel.CodingKeys and conformance GetContactDirectInvocationsModel.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for GetContactDirectInvocationsModel.CodingKeys, &unk_251742AC8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactDirectInvocationsModel.CodingKeys and conformance GetContactDirectInvocationsModel.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Data and conformance Data()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Data and conformance Data;
  if (!lazy protocol witness table cache variable for type Data and conformance Data)
  {
    result = MEMORY[0x249552EA8](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Data and conformance Data);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Data and conformance Data;
  if (!lazy protocol witness table cache variable for type Data and conformance Data)
  {
    result = MEMORY[0x249552EA8](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Data and conformance Data);
  }
  return result;
}

uint64_t destroy for GetContactDirectInvocationsModel(uint64_t *a1)
{
  unint64_t v1;

  v1 = a1[1];
  if (v1 >> 60 != 15)
    outlined consume of Data._Representation(*a1, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for GetContactDirectInvocationsModel(uint64_t a1, uint64_t *a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a2[1];
  if (v4 >> 60 == 15)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    v5 = *a2;
    outlined copy of Data._Representation(*a2, a2[1]);
    *(_QWORD *)a1 = v5;
    *(_QWORD *)(a1 + 8) = v4;
  }
  v6 = a2[3];
  *(_QWORD *)(a1 + 16) = a2[2];
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for GetContactDirectInvocationsModel(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2[1];
  if ((unint64_t)a1[1] >> 60 != 15)
  {
    if (v4 >> 60 != 15)
    {
      v6 = *a2;
      outlined copy of Data._Representation(*a2, a2[1]);
      v7 = *a1;
      v8 = a1[1];
      *a1 = v6;
      a1[1] = v4;
      outlined consume of Data._Representation(v7, v8);
      goto LABEL_8;
    }
    outlined destroy of Data((uint64_t)a1);
    goto LABEL_6;
  }
  if (v4 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  v5 = *a2;
  outlined copy of Data._Representation(*a2, a2[1]);
  *a1 = v5;
  a1[1] = v4;
LABEL_8:
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t outlined destroy of Data(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BDCDDE8] - 8) + 8))();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t *assignWithTake for GetContactDirectInvocationsModel(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v4 = a1[1];
  if (v4 >> 60 != 15)
  {
    v5 = a2[1];
    if (v5 >> 60 != 15)
    {
      v6 = *a1;
      *a1 = *a2;
      a1[1] = v5;
      outlined consume of Data._Representation(v6, v4);
      goto LABEL_6;
    }
    outlined destroy of Data((uint64_t)a1);
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_6:
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for GetContactDirectInvocationsModel(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 16);
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

uint64_t storeEnumTagSinglePayload for GetContactDirectInvocationsModel(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for GetContactDirectInvocationsModel()
{
  return &type metadata for GetContactDirectInvocationsModel;
}

uint64_t getEnumTagSinglePayload for GetContactDirectInvocationsModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFD)
  {
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
    v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v5 = v6 - 4;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for GetContactDirectInvocationsModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24619D998 + 4 * byte_2461AF929[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_24619D9CC + 4 * byte_2461AF924[v4]))();
}

uint64_t sub_24619D9CC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24619D9D4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24619D9DCLL);
  return result;
}

uint64_t sub_24619D9E8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24619D9F0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_24619D9F4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24619D9FC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void *type metadata accessor for GetContactDirectInvocationsModel.CodingKeys()
{
  return &unk_251742AC8;
}

uint64_t OUTLINED_FUNCTION_0_6()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_1_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_5_6()
{
  return Dictionary.init(dictionaryLiteral:)();
}

void OUTLINED_FUNCTION_6_4(uint64_t a1@<X8>)
{
  char v1;

  *(_QWORD *)(a1 + 64) |= 1 << v1;
}

uint64_t OUTLINED_FUNCTION_8_3()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_9_4()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_11_3()
{
  return swift_bridgeObjectRetain();
}

BOOL OUTLINED_FUNCTION_12_3(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
  Swift::Bool v20;
  Swift::Int v21;

  return _NativeDictionary.ensureUnique(isUnique:capacity:)(v20, v21);
}

unint64_t OUTLINED_FUNCTION_13_3()
{
  uint64_t v0;
  uint64_t v1;

  return specialized __RawDictionaryStorage.find<A>(_:)(v0, v1);
}

uint64_t OUTLINED_FUNCTION_16_3@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return outlined consume of Data._Representation(*(_QWORD *)(a1 + 16 * v1), *(_QWORD *)(a1 + 16 * v1 + 8));
}

uint64_t OUTLINED_FUNCTION_17_3()
{
  return specialized SAClientBoundCommand.data.getter();
}

uint64_t OUTLINED_FUNCTION_18_2()
{
  uint64_t v0;
  uint64_t v1;

  return outlined consume of Data?(v0, *(_QWORD *)(v1 - 120));
}

uint64_t OUTLINED_FUNCTION_22_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_24_0()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_25_0()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_0(v0);
}

uint64_t OUTLINED_FUNCTION_26_0()
{
  uint64_t v0;
  unint64_t v1;

  return outlined consume of Data?(v0, v1);
}

uint64_t OUTLINED_FUNCTION_27_0()
{
  return swift_bridgeObjectRelease();
}

void specialized RawRepresentable<>.hashValue.getter()
{
  specialized RawRepresentable<>.hashValue.getter();
}

{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_187(v0);
  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_13_4();
}

uint64_t specialized RawRepresentable<>.hash(into:)()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

void specialized RawRepresentable<>._rawHashValue(seed:)()
{
  specialized RawRepresentable<>._rawHashValue(seed:)();
}

{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_136();
  OUTLINED_FUNCTION_187(v0);
  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_13_4();
}

unint64_t static ContactsSnippetPluginModel.bundleName.getter()
{
  return 0xD000000000000014;
}

uint64_t ContactsSnippetPluginModel.responseViewID.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(_QWORD);
  int EnumCaseMultiPayload;
  uint64_t v13;
  uint64_t v15;
  BOOL v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v29;

  v3 = v1;
  v4 = OUTLINED_FUNCTION_106();
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for GetContactAttributeSnippetModel(0);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v8);
  v9 = OUTLINED_FUNCTION_40();
  type metadata accessor for ContactsSnippetPluginModel(v9);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_19();
  outlined init with copy of ContactsSnippetPluginModel(v3, v2, v11);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      outlined init with take of ModifyContactAttributeSnippetModel(v2, v0, type metadata accessor for GetContactAttributeSnippetModel);
      if (*(_QWORD *)(*(_QWORD *)v0 + 16))
        __asm { BR              X10 }
      if (one-time initialization token for siriContacts != -1)
        swift_once();
      v21 = type metadata accessor for Logger();
      __swift_project_value_buffer(v21, (uint64_t)static Logger.siriContacts);
      v22 = Logger.logObject.getter();
      v23 = static os_log_type_t.error.getter();
      if (OUTLINED_FUNCTION_17(v23))
      {
        v24 = (uint8_t *)OUTLINED_FUNCTION_154();
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_24618F000, v22, v4, "#GetContactAttributeSnippetModel responseViewID unexpected configuration, returning nil", v24, 2u);
        MEMORY[0x249552F14](v24, -1, -1);
      }

      OUTLINED_FUNCTION_54_0(v25, (void (*)(_QWORD))type metadata accessor for GetContactAttributeSnippetModel);
      return 0;
    }
    else
    {
      outlined init with take of ModifyContactAttributeSnippetModel(v2, (uint64_t)v7, type metadata accessor for ModifyContactAttributeSnippetModel);
      OUTLINED_FUNCTION_162();
      v16 = v16 || v15 == 0x7000000000000000;
      if (v16)
      {
        v17 = v7[16];
        outlined destroy of ModifyContactAttributeSnippetModel((uint64_t)v7, (void (*)(_QWORD))type metadata accessor for ModifyContactAttributeSnippetModel);
        OUTLINED_FUNCTION_69();
        v19 = v18 + 6;
        v20 = v18 + 10;
        if (v17)
          return v20;
        else
          return v19;
      }
      else
      {
        v26 = v7[16];
        outlined destroy of ModifyContactAttributeSnippetModel((uint64_t)v7, (void (*)(_QWORD))type metadata accessor for ModifyContactAttributeSnippetModel);
        OUTLINED_FUNCTION_69();
        if (v26)
          return v27 + 4;
        else
          return v27;
      }
    }
  }
  else
  {
    outlined destroy of ModifyContactAttributeSnippetModel(v2, (void (*)(_QWORD))type metadata accessor for GetContactSnippetModel);
    OUTLINED_FUNCTION_69();
    return v13 - 12;
  }
}

uint64_t type metadata accessor for ModifyContactAttributeSnippetModel(uint64_t a1)
{
  return type metadata accessor for ModifyContactAttributeSnippetModel(a1, (uint64_t *)&type metadata singleton initialization cache for ModifyContactAttributeSnippetModel);
}

uint64_t type metadata accessor for GetContactAttributeSnippetModel(uint64_t a1)
{
  return type metadata accessor for ModifyContactAttributeSnippetModel(a1, (uint64_t *)&type metadata singleton initialization cache for GetContactAttributeSnippetModel);
}

uint64_t type metadata accessor for ContactsSnippetPluginModel(uint64_t a1)
{
  return type metadata accessor for ModifyContactAttributeSnippetModel(a1, (uint64_t *)&type metadata singleton initialization cache for ContactsSnippetPluginModel);
}

void outlined init with take of ModifyContactAttributeSnippetModel(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_137(a1, a2, a3);
  OUTLINED_FUNCTION_181(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_12_1();
}

void outlined destroy of ModifyContactAttributeSnippetModel(uint64_t a1, void (*a2)(_QWORD))
{
  uint64_t v2;
  void (*v3)(uint64_t);

  a2(0);
  v2 = OUTLINED_FUNCTION_161();
  v3(v2);
  OUTLINED_FUNCTION_12_1();
}

uint64_t ContactsSnippetPluginModel.snippetHidden(for:idiom:)(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(_QWORD);
  uint64_t EnumCaseMultiPayload;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t (*v15)(uint64_t);
  uint64_t v16;

  v5 = v2;
  type metadata accessor for DeviceIdiom();
  OUTLINED_FUNCTION_27_1();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_106();
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_19();
  type metadata accessor for ContactsSnippetPluginModel(0);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_8_4();
  outlined init with copy of ContactsSnippetPluginModel(v5, v4, v10);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if ((_DWORD)EnumCaseMultiPayload == 2)
  {
    outlined init with take of ModifyContactAttributeSnippetModel(v4, v3, type metadata accessor for ModifyContactAttributeSnippetModel);
    OUTLINED_FUNCTION_112(v12, *MEMORY[0x24BEA8968]);
    OUTLINED_FUNCTION_160();
    OUTLINED_FUNCTION_108();
    if ((a2 & 1) != 0)
    {
      OUTLINED_FUNCTION_162();
      v14 = v14 || v13 == 0x7000000000000000;
      a2 = v14;
    }
    else
    {
      a2 = 0;
    }
    v15 = type metadata accessor for ModifyContactAttributeSnippetModel;
    v16 = v3;
  }
  else
  {
    OUTLINED_FUNCTION_112(EnumCaseMultiPayload, *MEMORY[0x24BEA8968]);
    OUTLINED_FUNCTION_160();
    OUTLINED_FUNCTION_108();
    v15 = type metadata accessor for ContactsSnippetPluginModel;
    v16 = v4;
  }
  outlined destroy of ModifyContactAttributeSnippetModel(v16, (void (*)(_QWORD))v15);
  return a2 & 1;
}

uint64_t ContactsSnippetPluginModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x61746E6F43746567 && a2 == 0xEA00000000007463;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x80000002461B2F90
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x80000002461B2FB0)
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

uint64_t ContactsSnippetPluginModel.CodingKeys.stringValue.getter(char a1)
{
  if (!a1)
    return 0x61746E6F43746567;
  if (a1 == 1)
    return 0xD000000000000013;
  return 0xD000000000000016;
}

uint64_t static ContactsSnippetPluginModel.GetContactCodingKeys.== infix(_:_:)()
{
  return 1;
}

void ContactsSnippetPluginModel.GetContactCodingKeys.hash(into:)()
{
  Hasher._combine(_:)(0);
}

uint64_t ContactsSnippetPluginModel.GetContactCodingKeys.stringValue.getter()
{
  return 0x6C65646F6DLL;
}

void ContactsSnippetPluginModel.GetContactAttributeCodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  if (a1 != 0x6C65646F6DLL || a2 != 0xE500000000000000)
    OUTLINED_FUNCTION_146();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12_1();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance ContactsSnippetPluginModel.CodingKeys()
{
  char *v0;

  return ContactsSnippetPluginModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance ContactsSnippetPluginModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = ContactsSnippetPluginModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsSnippetPluginModel.CodingKeys()
{
  lazy protocol witness table accessor for type ContactsSnippetPluginModel.CodingKeys and conformance ContactsSnippetPluginModel.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsSnippetPluginModel.CodingKeys()
{
  lazy protocol witness table accessor for type ContactsSnippetPluginModel.CodingKeys and conformance ContactsSnippetPluginModel.CodingKeys();
  return CodingKey.debugDescription.getter();
}

void protocol witness for Hashable.hashValue.getter in conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys()
{
  ContactsSnippetPluginModel.GetContactAttributeCodingKeys.hashValue.getter();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys()
{
  lazy protocol witness table accessor for type ContactsSnippetPluginModel.GetContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys()
{
  lazy protocol witness table accessor for type ContactsSnippetPluginModel.GetContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys();
  return CodingKey.debugDescription.getter();
}

void protocol witness for CodingKey.init(stringValue:) in conformance ContactsSnippetPluginModel.GetContactCodingKeys(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v4;

  ContactsSnippetPluginModel.GetContactAttributeCodingKeys.init(stringValue:)(a1, a2);
  *a3 = v4 & 1;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsSnippetPluginModel.GetContactCodingKeys()
{
  lazy protocol witness table accessor for type ContactsSnippetPluginModel.GetContactCodingKeys and conformance ContactsSnippetPluginModel.GetContactCodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsSnippetPluginModel.GetContactCodingKeys()
{
  lazy protocol witness table accessor for type ContactsSnippetPluginModel.GetContactCodingKeys and conformance ContactsSnippetPluginModel.GetContactCodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys()
{
  lazy protocol witness table accessor for type ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys()
{
  lazy protocol witness table accessor for type ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys();
  return CodingKey.debugDescription.getter();
}

void ContactsSnippetPluginModel.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
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
  int EnumCaseMultiPayload;
  uint64_t (*v19)(uint64_t);
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

  OUTLINED_FUNCTION_3_7();
  v28 = v0;
  v6 = v5;
  v27 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys>)
                  - 8);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_10_2(v8, v21);
  OUTLINED_FUNCTION_106();
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_9_5(v10, v22);
  v25 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsSnippetPluginModel.GetContactAttributeCodingKeys>)
                  - 8);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_42_0(v12, v23);
  OUTLINED_FUNCTION_134();
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_11_4();
  v24 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsSnippetPluginModel.GetContactCodingKeys>)
                  - 8);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_135();
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_29_0();
  type metadata accessor for ContactsSnippetPluginModel(0);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_19();
  v29 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsSnippetPluginModel.CodingKeys>)
                  - 8);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_7_5();
  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  lazy protocol witness table accessor for type ContactsSnippetPluginModel.CodingKeys and conformance ContactsSnippetPluginModel.CodingKeys();
  OUTLINED_FUNCTION_188();
  outlined init with copy of ContactsSnippetPluginModel(v28, v1, type metadata accessor for ContactsSnippetPluginModel);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      v19 = type metadata accessor for GetContactAttributeSnippetModel;
      OUTLINED_FUNCTION_103(v1, v4);
      OUTLINED_FUNCTION_182();
      OUTLINED_FUNCTION_18_3();
      OUTLINED_FUNCTION_167((uint64_t)&lazy protocol witness table cache variable for type GetContactAttributeSnippetModel and conformance GetContactAttributeSnippetModel);
      OUTLINED_FUNCTION_177();
      OUTLINED_FUNCTION_17_4(*(uint64_t (**)(uint64_t, uint64_t))(v25 + 8));
      v20 = v4;
    }
    else
    {
      v19 = type metadata accessor for ModifyContactAttributeSnippetModel;
      OUTLINED_FUNCTION_103(v1, v26);
      OUTLINED_FUNCTION_174();
      OUTLINED_FUNCTION_18_3();
      OUTLINED_FUNCTION_167((uint64_t)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel and conformance ModifyContactAttributeSnippetModel);
      OUTLINED_FUNCTION_177();
      OUTLINED_FUNCTION_17_4(*(uint64_t (**)(uint64_t, uint64_t))(v27 + 8));
      v20 = v26;
    }
  }
  else
  {
    v19 = type metadata accessor for GetContactSnippetModel;
    OUTLINED_FUNCTION_103(v1, v3);
    lazy protocol witness table accessor for type ContactsSnippetPluginModel.GetContactCodingKeys and conformance ContactsSnippetPluginModel.GetContactCodingKeys();
    OUTLINED_FUNCTION_18_3();
    OUTLINED_FUNCTION_167((uint64_t)&lazy protocol witness table cache variable for type GetContactSnippetModel and conformance GetContactSnippetModel);
    OUTLINED_FUNCTION_177();
    OUTLINED_FUNCTION_47_0(v2, *(uint64_t (**)(uint64_t, uint64_t))(v24 + 8));
    v20 = v3;
  }
  outlined destroy of ModifyContactAttributeSnippetModel(v20, (void (*)(_QWORD))v19);
  OUTLINED_FUNCTION_24_1(*(uint64_t (**)(uint64_t, uint64_t))(v29 + 8));
  OUTLINED_FUNCTION_10_1();
}

void ContactsSnippetPluginModel.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  char *v57;
  char *v58;
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
  _QWORD *v70;
  uint64_t v71;

  OUTLINED_FUNCTION_3_7();
  v71 = v1;
  v3 = v2;
  v66 = v4;
  v65 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys>);
  v62 = *(_QWORD *)(v65 - 8);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_96(v6, v53);
  v64 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsSnippetPluginModel.GetContactAttributeCodingKeys>);
  v61 = *(_QWORD *)(v64 - 8);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_10_2(v8, v53);
  v63 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsSnippetPluginModel.GetContactCodingKeys>);
  v60 = *(_QWORD *)(v63 - 8);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_9_5(v10, v53);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsSnippetPluginModel.CodingKeys>);
  v68 = *(_QWORD *)(v11 - 8);
  v69 = v11;
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v12);
  v13 = OUTLINED_FUNCTION_40();
  v14 = type metadata accessor for ContactsSnippetPluginModel(v13);
  OUTLINED_FUNCTION_1_7();
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v53 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v53 - v20;
  v22 = MEMORY[0x24BDAC7A8](v19);
  v24 = (char *)&v53 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v53 - v25;
  v27 = v3[3];
  v70 = v3;
  __swift_project_boxed_opaque_existential_1(v3, v27);
  lazy protocol witness table accessor for type ContactsSnippetPluginModel.CodingKeys and conformance ContactsSnippetPluginModel.CodingKeys();
  v28 = v71;
  OUTLINED_FUNCTION_155();
  if (v28)
    goto LABEL_2;
  v57 = v21;
  v58 = v18;
  v55 = v24;
  v56 = v26;
  v59 = v14;
  v71 = v0;
  v30 = KeyedDecodingContainer.allKeys.getter();
  v32 = *(_QWORD *)(v30 + 16);
  if (!v32)
  {
    v29 = (uint64_t)v70;
LABEL_10:
    v38 = v59;
    OUTLINED_FUNCTION_107();
    OUTLINED_FUNCTION_30_0();
    v40 = v39;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
    *v40 = v38;
    KeyedDecodingContainer.codingPath.getter();
    v41 = OUTLINED_FUNCTION_22_3();
    OUTLINED_FUNCTION_21_2(v41, *MEMORY[0x24BEE26D0]);
    swift_willThrow();
    OUTLINED_FUNCTION_53_0();
    v42 = OUTLINED_FUNCTION_159();
    v43(v42);
    goto LABEL_11;
  }
  v54 = 0;
  v33 = *(unsigned __int8 *)(v30 + 32);
  OUTLINED_FUNCTION_89(1, v32, v30, v30 + 32, v31, (2 * v32) | 1);
  v35 = v34;
  v37 = v36;
  swift_bridgeObjectRelease();
  if (v35 != v37 >> 1)
  {
    v29 = (uint64_t)v70;
    goto LABEL_10;
  }
  if (v33)
  {
    if (v33 == 1)
    {
      OUTLINED_FUNCTION_182();
      OUTLINED_FUNCTION_63_0();
      OUTLINED_FUNCTION_134();
      lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel and conformance ModifyContactAttributeSnippetModel((uint64_t)&lazy protocol witness table cache variable for type GetContactAttributeSnippetModel and conformance GetContactAttributeSnippetModel);
      OUTLINED_FUNCTION_88();
      v29 = (uint64_t)v70;
      OUTLINED_FUNCTION_38_0(v61);
      OUTLINED_FUNCTION_53_0();
      OUTLINED_FUNCTION_24_1(*(uint64_t (**)(uint64_t, uint64_t))(v68 + 8));
      v49 = (uint64_t)v57;
    }
    else
    {
      OUTLINED_FUNCTION_174();
      OUTLINED_FUNCTION_63_0();
      OUTLINED_FUNCTION_106();
      lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel and conformance ModifyContactAttributeSnippetModel((uint64_t)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel and conformance ModifyContactAttributeSnippetModel);
      OUTLINED_FUNCTION_88();
      v29 = (uint64_t)v70;
      v48 = v68;
      OUTLINED_FUNCTION_38_0(v62);
      OUTLINED_FUNCTION_53_0();
      OUTLINED_FUNCTION_24_1(*(uint64_t (**)(uint64_t, uint64_t))(v48 + 8));
      v49 = (uint64_t)v58;
    }
    goto LABEL_16;
  }
  lazy protocol witness table accessor for type ContactsSnippetPluginModel.GetContactCodingKeys and conformance ContactsSnippetPluginModel.GetContactCodingKeys();
  v44 = v67;
  v45 = v54;
  KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
  if (!v45)
  {
    OUTLINED_FUNCTION_135();
    lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel and conformance ModifyContactAttributeSnippetModel((uint64_t)&lazy protocol witness table cache variable for type GetContactSnippetModel and conformance GetContactSnippetModel);
    v49 = (uint64_t)v55;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    v29 = (uint64_t)v70;
    OUTLINED_FUNCTION_57_0(v44, *(uint64_t (**)(uint64_t, uint64_t))(v60 + 8));
    OUTLINED_FUNCTION_53_0();
    v50 = OUTLINED_FUNCTION_51_0();
    OUTLINED_FUNCTION_39(v50, v51);
LABEL_16:
    swift_storeEnumTagMultiPayload();
    v52 = (uint64_t)v56;
    OUTLINED_FUNCTION_103(v49, (uint64_t)v56);
    OUTLINED_FUNCTION_103(v52, v66);
    goto LABEL_11;
  }
  OUTLINED_FUNCTION_53_0();
  v46 = OUTLINED_FUNCTION_51_0();
  OUTLINED_FUNCTION_39(v46, v47);
LABEL_2:
  v29 = (uint64_t)v70;
LABEL_11:
  __swift_destroy_boxed_opaque_existential_0(v29);
  OUTLINED_FUNCTION_10_1();
}

unint64_t protocol witness for static SnippetPluginModel.bundleName.getter in conformance ContactsSnippetPluginModel()
{
  static ContactsSnippetPluginModel.bundleName.getter();
  return 0xD000000000000014;
}

void protocol witness for Decodable.init(from:) in conformance ContactsSnippetPluginModel()
{
  ContactsSnippetPluginModel.init(from:)();
}

void protocol witness for Encodable.encode(to:) in conformance ContactsSnippetPluginModel()
{
  ContactsSnippetPluginModel.encode(to:)();
}

void *static ContactsSnippetFlowState.allCases.getter()
{
  return &outlined read-only object #0 of static ContactsSnippetFlowState.allCases.getter;
}

uint64_t ContactsSnippetFlowState.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  char v8;

  v3 = a1 == 0x6D7269666E6F63 && a2 == 0xE700000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6148746E65746E69 && a2 == 0xED000064656C646ELL;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x726F707075736E75 && a2 == 0xEB00000000646574)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if ((v8 & 1) != 0)
        return 2;
      else
        return 3;
    }
  }
}

uint64_t ContactsSnippetFlowState.CodingKeys.init(intValue:)()
{
  return 3;
}

uint64_t ContactsSnippetFlowState.CodingKeys.stringValue.getter(char a1)
{
  return *(_QWORD *)&aConfirm_0[8 * a1];
}

BOOL static ContactsSnippetFlowState.ConfirmCodingKeys.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void ContactsSnippetFlowState.ConfirmCodingKeys.hash(into:)(uint64_t a1, char a2)
{
  Hasher._combine(_:)(a2 & 1);
}

uint64_t ContactsSnippetFlowState.ConfirmCodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000011 && a2 == 0x80000002461B2FD0
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x80000002461B2FF0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t ContactsSnippetFlowState.ConfirmCodingKeys.init(intValue:)()
{
  return 2;
}

unint64_t ContactsSnippetFlowState.ConfirmCodingKeys.stringValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000010;
  else
    return 0xD000000000000011;
}

uint64_t ContactsSnippetFlowState.UnsupportedCodingKeys.init(stringValue:)()
{
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t ContactsSnippetFlowState.UnsupportedCodingKeys.stringValue.getter()
{
  return 0;
}

void protocol witness for Hashable.hashValue.getter in conformance ContactsSnippetFlowState.CodingKeys()
{
  unsigned __int8 *v0;

  ContactsSnippetPluginModel.CodingKeys.hashValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance ContactsSnippetFlowState.CodingKeys()
{
  char *v0;

  return ContactsSnippetFlowState.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance ContactsSnippetFlowState.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = ContactsSnippetFlowState.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance ContactsSnippetFlowState.CodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = ContactsSnippetFlowState.CodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsSnippetFlowState.CodingKeys()
{
  lazy protocol witness table accessor for type ContactsSnippetFlowState.CodingKeys and conformance ContactsSnippetFlowState.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsSnippetFlowState.CodingKeys()
{
  lazy protocol witness table accessor for type ContactsSnippetFlowState.CodingKeys and conformance ContactsSnippetFlowState.CodingKeys();
  return CodingKey.debugDescription.getter();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance ContactsSnippetFlowState.ConfirmCodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return static ContactsSnippetFlowState.ConfirmCodingKeys.== infix(_:_:)(*a1, *a2);
}

void protocol witness for Hashable.hashValue.getter in conformance ContactsSnippetFlowState.ConfirmCodingKeys()
{
  char *v0;

  ContactsSnippetFlowState.ConfirmCodingKeys.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance ContactsSnippetFlowState.ConfirmCodingKeys(uint64_t a1)
{
  char *v1;

  ContactsSnippetFlowState.ConfirmCodingKeys.hash(into:)(a1, *v1);
}

unint64_t protocol witness for CodingKey.stringValue.getter in conformance ContactsSnippetFlowState.ConfirmCodingKeys()
{
  char *v0;

  return ContactsSnippetFlowState.ConfirmCodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance ContactsSnippetFlowState.ConfirmCodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = ContactsSnippetFlowState.ConfirmCodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance ContactsSnippetFlowState.ConfirmCodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = ContactsSnippetFlowState.ConfirmCodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsSnippetFlowState.ConfirmCodingKeys()
{
  lazy protocol witness table accessor for type ContactsSnippetFlowState.ConfirmCodingKeys and conformance ContactsSnippetFlowState.ConfirmCodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsSnippetFlowState.ConfirmCodingKeys()
{
  lazy protocol witness table accessor for type ContactsSnippetFlowState.ConfirmCodingKeys and conformance ContactsSnippetFlowState.ConfirmCodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsSnippetFlowState.IntentHandledCodingKeys()
{
  lazy protocol witness table accessor for type ContactsSnippetFlowState.IntentHandledCodingKeys and conformance ContactsSnippetFlowState.IntentHandledCodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsSnippetFlowState.IntentHandledCodingKeys()
{
  lazy protocol witness table accessor for type ContactsSnippetFlowState.IntentHandledCodingKeys and conformance ContactsSnippetFlowState.IntentHandledCodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance ContactsSnippetFlowState.UnsupportedCodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = ContactsSnippetFlowState.UnsupportedCodingKeys.init(stringValue:)();
  *a1 = result & 1;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance ContactsSnippetFlowState.UnsupportedCodingKeys()
{
  return SiriContactsActionItem.CodingKeys.intValue.getter();
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance ContactsSnippetFlowState.UnsupportedCodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = static ContactsSnippetPluginModel.GetContactCodingKeys.== infix(_:_:)();
  *a1 = result & 1;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsSnippetFlowState.UnsupportedCodingKeys()
{
  lazy protocol witness table accessor for type ContactsSnippetFlowState.UnsupportedCodingKeys and conformance ContactsSnippetFlowState.UnsupportedCodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsSnippetFlowState.UnsupportedCodingKeys()
{
  lazy protocol witness table accessor for type ContactsSnippetFlowState.UnsupportedCodingKeys and conformance ContactsSnippetFlowState.UnsupportedCodingKeys();
  return CodingKey.debugDescription.getter();
}

void ContactsSnippetFlowState.encode(to:)()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  unint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  uint64_t (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;

  OUTLINED_FUNCTION_3_7();
  v6 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsSnippetFlowState.UnsupportedCodingKeys>);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_95(v8, v23);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsSnippetFlowState.IntentHandledCodingKeys>);
  v26 = *(_QWORD *)(v9 - 8);
  v27 = v9;
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_8_4();
  v25 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsSnippetFlowState.ConfirmCodingKeys>)
                  - 8);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_10_2(v12, v24);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsSnippetFlowState.CodingKeys>);
  OUTLINED_FUNCTION_27_1();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_7_5();
  v14 = *v0;
  v29 = v0[2];
  v30 = v0[3];
  v15 = v6[3];
  v16 = v6;
  v17 = v0[1];
  __swift_project_boxed_opaque_existential_1(v16, v15);
  lazy protocol witness table accessor for type ContactsSnippetFlowState.CodingKeys and conformance ContactsSnippetFlowState.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  if ((v17 & 0xF000000000000000) == 0xB000000000000000)
  {
    OUTLINED_FUNCTION_184();
    OUTLINED_FUNCTION_18_3();
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v3, v27);
    v20 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8);
    goto LABEL_5;
  }
  if ((v17 & 0xF000000000000000) == 0x7000000000000000)
  {
    OUTLINED_FUNCTION_175();
    OUTLINED_FUNCTION_18_3();
    v18 = OUTLINED_FUNCTION_161();
    v19(v18);
    v20 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8);
LABEL_5:
    OUTLINED_FUNCTION_47_0(v2, v20);
    goto LABEL_10;
  }
  outlined copy of Data?(v14, v17);
  outlined copy of Data?(v29, v30);
  lazy protocol witness table accessor for type ContactsSnippetFlowState.ConfirmCodingKeys and conformance ContactsSnippetFlowState.ConfirmCodingKeys();
  OUTLINED_FUNCTION_18_3();
  lazy protocol witness table accessor for type Data and conformance Data();
  KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
  if (v1)
  {
    outlined consume of Data?(v29, v30);
    OUTLINED_FUNCTION_47_0(v28, *(uint64_t (**)(uint64_t, uint64_t))(v25 + 8));
    OUTLINED_FUNCTION_113();
    v21 = v14;
    v22 = v17;
  }
  else
  {
    OUTLINED_FUNCTION_132();
    OUTLINED_FUNCTION_142();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    outlined consume of Data?(v14, v17);
    OUTLINED_FUNCTION_47_0(v28, *(uint64_t (**)(uint64_t, uint64_t))(v25 + 8));
    OUTLINED_FUNCTION_113();
    v21 = v29;
    v22 = v30;
  }
  outlined consume of Data?(v21, v22);
LABEL_10:
  OUTLINED_FUNCTION_189();
  OUTLINED_FUNCTION_10_1();
}

void ContactsSnippetFlowState.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
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
  int v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  __int128 v23;
  unint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  __int128 v39;
  uint64_t v40;
  unint64_t v41;

  OUTLINED_FUNCTION_3_7();
  v5 = v4;
  v37 = v6;
  v36 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsSnippetFlowState.UnsupportedCodingKeys>)
                  - 8);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_10_2(v8, v31);
  v35 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsSnippetFlowState.IntentHandledCodingKeys>)
                  - 8);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_9_5(v10, v32);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsSnippetFlowState.ConfirmCodingKeys>);
  OUTLINED_FUNCTION_81();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_28_0();
  v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsSnippetFlowState.CodingKeys>);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_59_0();
  v38 = v5;
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  lazy protocol witness table accessor for type ContactsSnippetFlowState.CodingKeys and conformance ContactsSnippetFlowState.CodingKeys();
  OUTLINED_FUNCTION_155();
  if (v1)
    goto LABEL_8;
  v33 = v2;
  v34 = v0;
  v14 = KeyedDecodingContainer.allKeys.getter();
  v16 = *(_QWORD *)(v14 + 16);
  if (!v16
    || (v17 = *(unsigned __int8 *)(v14 + 32),
        OUTLINED_FUNCTION_89(1, v16, v14, v14 + 32, v15, (2 * v16) | 1),
        v19 = v18,
        v21 = v20,
        OUTLINED_FUNCTION_128(),
        v19 != v21 >> 1))
  {
    OUTLINED_FUNCTION_107();
    OUTLINED_FUNCTION_30_0();
    v26 = v25;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
    *v26 = &type metadata for ContactsSnippetFlowState;
    KeyedDecodingContainer.codingPath.getter();
    v27 = OUTLINED_FUNCTION_22_3();
    OUTLINED_FUNCTION_21_2(v27, *MEMORY[0x24BEE26D0]);
    swift_willThrow();
    OUTLINED_FUNCTION_52_0();
    OUTLINED_FUNCTION_20_2(v3, *(uint64_t (**)(uint64_t, uint64_t))(v13 + 8));
LABEL_8:
    v28 = (uint64_t)v38;
    goto LABEL_9;
  }
  if (v17)
  {
    if (v17 == 1)
    {
      OUTLINED_FUNCTION_184();
      OUTLINED_FUNCTION_78();
      OUTLINED_FUNCTION_91(v35);
      OUTLINED_FUNCTION_52_0();
      OUTLINED_FUNCTION_20_2(v19, *(uint64_t (**)(uint64_t, uint64_t))(v13 + 8));
      v22 = 0;
      v23 = 0uLL;
      v24 = 0xB000000000000000;
    }
    else
    {
      OUTLINED_FUNCTION_175();
      OUTLINED_FUNCTION_78();
      OUTLINED_FUNCTION_91(v36);
      OUTLINED_FUNCTION_52_0();
      OUTLINED_FUNCTION_20_2(v19, *(uint64_t (**)(uint64_t, uint64_t))(v13 + 8));
      v22 = 0;
      v23 = 0uLL;
      v24 = 0x7000000000000000;
    }
  }
  else
  {
    LOBYTE(v40) = 0;
    lazy protocol witness table accessor for type ContactsSnippetFlowState.ConfirmCodingKeys and conformance ContactsSnippetFlowState.ConfirmCodingKeys();
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    LOBYTE(v39) = 0;
    lazy protocol witness table accessor for type Data and conformance Data();
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
    v22 = v40;
    v24 = v41;
    OUTLINED_FUNCTION_132();
    OUTLINED_FUNCTION_170();
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
    OUTLINED_FUNCTION_110(v34, *(uint64_t (**)(uint64_t, uint64_t))(v33 + 8));
    OUTLINED_FUNCTION_52_0();
    v29 = OUTLINED_FUNCTION_76();
    OUTLINED_FUNCTION_20_2(v29, v30);
    v23 = v39;
  }
  v28 = (uint64_t)v38;
  *(_QWORD *)v37 = v22;
  *(_QWORD *)(v37 + 8) = v24;
  *(_OWORD *)(v37 + 16) = v23;
LABEL_9:
  __swift_destroy_boxed_opaque_existential_0(v28);
  OUTLINED_FUNCTION_10_1();
}

void protocol witness for static CaseIterable.allCases.getter in conformance ContactsSnippetFlowState(_QWORD *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of static ContactsSnippetFlowState.allCases.getter;
}

void protocol witness for Decodable.init(from:) in conformance ContactsSnippetFlowState()
{
  ContactsSnippetFlowState.init(from:)();
}

void protocol witness for Encodable.encode(to:) in conformance ContactsSnippetFlowState()
{
  ContactsSnippetFlowState.encode(to:)();
}

uint64_t GetContactSnippetModel.contact.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  return Loggable.wrappedValue.getter();
}

uint64_t key path getter for GetContactSnippetModel.contact : GetContactSnippetModel@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = GetContactSnippetModel.contact.getter();
  *a1 = v3;
  return result;
}

uint64_t key path setter for GetContactSnippetModel.contact : GetContactSnippetModel(id *a1)
{
  id v1;

  v1 = *a1;
  return GetContactSnippetModel.contact.setter();
}

uint64_t GetContactSnippetModel.contact.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  return OUTLINED_FUNCTION_87();
}

void GetContactSnippetModel.contact.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_49_0();
  *v0 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  v1[4] = OUTLINED_FUNCTION_48_0();
  OUTLINED_FUNCTION_0_0();
}

uint64_t GetContactSnippetModel.directInvocationsModel.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (uint64_t *)(v1 + *(int *)(OUTLINED_FUNCTION_70() + 20));
  v3 = *v2;
  v4 = v2[1];
  v5 = v2[2];
  v6 = v2[3];
  v7 = v2[4];
  *v0 = *v2;
  v0[1] = v4;
  v0[2] = v5;
  v0[3] = v6;
  v0[4] = v7;
  outlined copy of Data?(v3, v4);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_13_0();
  return OUTLINED_FUNCTION_77();
}

uint64_t GetContactSnippetModel.flowState.getter()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v0 = OUTLINED_FUNCTION_70();
  v1 = OUTLINED_FUNCTION_126(*(int *)(v0 + 24));
  return OUTLINED_FUNCTION_101(v1, v2, v3, v4);
}

void GetContactSnippetModel.labelCATs.getter()
{
  OUTLINED_FUNCTION_70();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
  OUTLINED_FUNCTION_122();
  OUTLINED_FUNCTION_12_1();
}

double key path getter for GetContactSnippetModel.labelCATs : GetContactSnippetModel@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  GetContactSnippetModel.labelCATs.getter();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

void GetContactSnippetModel.labelCATs.setter()
{
  type metadata accessor for GetContactSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
  OUTLINED_FUNCTION_151();
  OUTLINED_FUNCTION_66();
}

void GetContactSnippetModel.labelCATs.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_49_0();
  *v0 = v1;
  type metadata accessor for GetContactSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
  v1[4] = OUTLINED_FUNCTION_48_0();
  OUTLINED_FUNCTION_0_0();
}

uint64_t GetContactSnippetModel.shouldDisplayLightText.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for GetContactSnippetModel(0) + 32));
}

void GetContactSnippetModel.shouldDisplayLightText.setter(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + *(int *)(type metadata accessor for GetContactSnippetModel(0) + 32)) = a1;
  OUTLINED_FUNCTION_12_1();
}

uint64_t (*GetContactSnippetModel.shouldDisplayLightText.modify())()
{
  type metadata accessor for GetContactSnippetModel(0);
  return destructiveProjectEnumData for SiriContactsActionType;
}

void GetContactSnippetModel.init(contact:directInvocationsModel:flowState:labelCATs:)(uint64_t *a1@<X1>, __int128 *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *ContactSnippetModel;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;

  v5 = *a1;
  v6 = a1[1];
  v7 = a1[4];
  v13 = *a2;
  v8 = *((_QWORD *)a2 + 2);
  v9 = *((_QWORD *)a2 + 3);
  ContactSnippetModel = (int *)type metadata accessor for GetContactSnippetModel(0);
  *(_BYTE *)(a3 + ContactSnippetModel[8]) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodableContact<CNContact>);
  Loggable.init(wrappedValue:)();
  v11 = a3 + ContactSnippetModel[5];
  *(_QWORD *)v11 = v5;
  *(_QWORD *)(v11 + 8) = v6;
  *(_OWORD *)(v11 + 16) = *((_OWORD *)a1 + 1);
  *(_QWORD *)(v11 + 32) = v7;
  v12 = a3 + ContactSnippetModel[6];
  *(_OWORD *)v12 = v13;
  *(_QWORD *)(v12 + 16) = v8;
  *(_QWORD *)(v12 + 24) = v9;
  Loggable.init(wrappedValue:)();
  OUTLINED_FUNCTION_62_0();
}

void GetContactSnippetModel.init(from:)(uint64_t a1)
{
  uint64_t v1;
  int *v3;
  uint64_t ContactAttributeSnippetModel;
  uint64_t *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t *v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v3 = (int *)OUTLINED_FUNCTION_70();
  v21 = v3[8];
  *(_BYTE *)(v1 + v21) = 0;
  ContactAttributeSnippetModel = type metadata accessor for GetContactAttributeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  Loggable.wrappedValue.getter();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodableContact<CNContact>);
  Loggable.init(wrappedValue:)();
  v5 = (uint64_t *)(a1 + *(int *)(ContactAttributeSnippetModel + 24));
  v6 = *v5;
  v7 = v5[1];
  v8 = v5[2];
  v9 = v5[3];
  v10 = v5[4];
  v19 = ContactAttributeSnippetModel;
  v20 = v1;
  v11 = (uint64_t *)(v1 + v3[5]);
  *v11 = v6;
  v11[1] = v7;
  v11[2] = v8;
  v11[3] = v9;
  v11[4] = v10;
  v12 = (uint64_t *)(a1 + *(int *)(ContactAttributeSnippetModel + 28));
  v13 = *v12;
  v14 = v12[1];
  v15 = v12[2];
  v16 = v12[3];
  v17 = (uint64_t *)(v1 + v3[6]);
  *v17 = v13;
  v17[1] = v14;
  v17[2] = v15;
  v17[3] = v16;
  outlined copy of Data?(v6, v7);
  OUTLINED_FUNCTION_25();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  outlined copy of ContactsSnippetFlowState(v13, v14, v15, v16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  Loggable.init(wrappedValue:)();
  v18 = *(_BYTE *)(a1 + *(int *)(v19 + 36));
  outlined destroy of ModifyContactAttributeSnippetModel(a1, (void (*)(_QWORD))type metadata accessor for GetContactAttributeSnippetModel);
  *(_BYTE *)(v20 + v21) = v18;
}

void GetContactAttributeSnippetModel.contact.getter()
{
  OUTLINED_FUNCTION_72();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  OUTLINED_FUNCTION_122();
  OUTLINED_FUNCTION_12_1();
}

uint64_t GetContactSnippetModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  BOOL v7;
  char v8;

  v3 = a1 == 0x746361746E6F63 && a2 == 0xE700000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x80000002461B3010
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = a1 == 0x74617453776F6C66 && a2 == 0xE900000000000065;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v7 = a1 == 0x5441436C6562616CLL && a2 == 0xE900000000000073;
      if (v7 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0xD000000000000016 && a2 == 0x80000002461B3030)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else
      {
        v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if ((v8 & 1) != 0)
          return 4;
        else
          return 5;
      }
    }
  }
}

uint64_t GetContactSnippetModel.CodingKeys.init(intValue:)()
{
  return 5;
}

uint64_t GetContactSnippetModel.CodingKeys.stringValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2461A04DC + 4 * byte_2461AFAF9[a1]))(0xD000000000000016, 0x80000002461B3010);
}

uint64_t sub_2461A04DC()
{
  return 0x746361746E6F63;
}

uint64_t sub_2461A04F4()
{
  return 0x74617453776F6C66;
}

uint64_t sub_2461A0510()
{
  return 0x5441436C6562616CLL;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance GetContactSnippetModel.CodingKeys()
{
  unsigned __int8 *v0;

  return GetContactSnippetModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance GetContactSnippetModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = GetContactSnippetModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance GetContactSnippetModel.CodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = GetContactSnippetModel.CodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GetContactSnippetModel.CodingKeys()
{
  lazy protocol witness table accessor for type GetContactSnippetModel.CodingKeys and conformance GetContactSnippetModel.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GetContactSnippetModel.CodingKeys()
{
  lazy protocol witness table accessor for type GetContactSnippetModel.CodingKeys and conformance GetContactSnippetModel.CodingKeys();
  return CodingKey.debugDescription.getter();
}

void GetContactSnippetModel.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GetContactSnippetModel.CodingKeys>);
  OUTLINED_FUNCTION_27_1();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_73();
  lazy protocol witness table accessor for type GetContactSnippetModel.CodingKeys and conformance GetContactSnippetModel.CodingKeys();
  OUTLINED_FUNCTION_26_1();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  lazy protocol witness table accessor for type Loggable<CodableContact<CNContact>> and conformance <A> Loggable<A>((uint64_t)&lazy protocol witness table cache variable for type Loggable<CodableContact<CNContact>> and conformance <A> Loggable<A>);
  OUTLINED_FUNCTION_14_4();
  if (!v0)
  {
    v2 = OUTLINED_FUNCTION_135();
    OUTLINED_FUNCTION_111(*(int *)(v2 + 20));
    lazy protocol witness table accessor for type GetContactDirectInvocationsModel and conformance GetContactDirectInvocationsModel();
    OUTLINED_FUNCTION_14_4();
    lazy protocol witness table accessor for type ContactsSnippetFlowState and conformance ContactsSnippetFlowState();
    OUTLINED_FUNCTION_14_4();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
    lazy protocol witness table accessor for type Loggable<ContactsLabelCATContainer> and conformance <A> Loggable<A>((uint64_t)&lazy protocol witness table cache variable for type Loggable<ContactsLabelCATContainer> and conformance <A> Loggable<A>);
    OUTLINED_FUNCTION_14_4();
    OUTLINED_FUNCTION_82(4);
  }
  OUTLINED_FUNCTION_37_0();
  OUTLINED_FUNCTION_55_0();
}

void GetContactSnippetModel.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
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
  int *ContactSnippetModel;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD *v17;
  char v18;
  uint64_t v19;
  void (*v20)(_QWORD);
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
  __int128 v31;
  __int128 v32;
  uint64_t v33;

  OUTLINED_FUNCTION_3_7();
  v3 = v2;
  v23 = v4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
  v25 = *(_QWORD *)(v5 - 8);
  v26 = v5;
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_98(v7, v21);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  v27 = *(_QWORD *)(v8 - 8);
  v28 = v8;
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_41_0(v10, v22);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GetContactSnippetModel.CodingKeys>);
  MEMORY[0x24BDAC7A8](v29);
  v11 = OUTLINED_FUNCTION_40();
  ContactSnippetModel = (int *)type metadata accessor for GetContactSnippetModel(v11);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_8_4();
  v15 = *(int *)(v14 + 32);
  *(_BYTE *)(v1 + v15) = 0;
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  lazy protocol witness table accessor for type GetContactSnippetModel.CodingKeys and conformance GetContactSnippetModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v0)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
  }
  else
  {
    LOBYTE(v31) = 0;
    lazy protocol witness table accessor for type Loggable<CodableContact<CNContact>> and conformance <A> Loggable<A>((uint64_t)&lazy protocol witness table cache variable for type Loggable<CodableContact<CNContact>> and conformance <A> Loggable<A>);
    OUTLINED_FUNCTION_60_0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 32))(v1, v30, v28);
    OUTLINED_FUNCTION_132();
    lazy protocol witness table accessor for type GetContactDirectInvocationsModel and conformance GetContactDirectInvocationsModel();
    OUTLINED_FUNCTION_179();
    OUTLINED_FUNCTION_60_0();
    v16 = v1 + ContactSnippetModel[5];
    *(_OWORD *)v16 = v31;
    *(_OWORD *)(v16 + 16) = v32;
    *(_QWORD *)(v16 + 32) = v33;
    lazy protocol witness table accessor for type ContactsSnippetFlowState and conformance ContactsSnippetFlowState();
    OUTLINED_FUNCTION_179();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    v17 = (_OWORD *)(v1 + ContactSnippetModel[6]);
    *v17 = v31;
    v17[1] = v32;
    lazy protocol witness table accessor for type Loggable<ContactsLabelCATContainer> and conformance <A> Loggable<A>((uint64_t)&lazy protocol witness table cache variable for type Loggable<ContactsLabelCATContainer> and conformance <A> Loggable<A>);
    OUTLINED_FUNCTION_60_0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 32))(v1 + ContactSnippetModel[7], v24, v26);
    v18 = KeyedDecodingContainer.decode(_:forKey:)();
    OUTLINED_FUNCTION_15_3();
    *(_BYTE *)(v1 + v15) = v18 & 1;
    outlined init with copy of ContactsSnippetPluginModel(v1, v23, type metadata accessor for GetContactSnippetModel);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
    v19 = OUTLINED_FUNCTION_157();
    outlined destroy of ModifyContactAttributeSnippetModel(v19, v20);
  }
  OUTLINED_FUNCTION_10_1();
}

void protocol witness for Decodable.init(from:) in conformance GetContactSnippetModel()
{
  GetContactSnippetModel.init(from:)();
}

void protocol witness for Encodable.encode(to:) in conformance GetContactSnippetModel()
{
  GetContactSnippetModel.encode(to:)();
}

void GetContactAttributeSnippetModel.DisplayAttribute.AttributeType.redacted.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_165(a1);
}

SiriContactsCommon::GetContactAttributeSnippetModel::DisplayAttribute::AttributeType_optional __swiftcall GetContactAttributeSnippetModel.DisplayAttribute.AttributeType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  void *object;
  Swift::String v3;
  char *v4;
  unint64_t v5;
  char v6;
  SiriContactsCommon::GetContactAttributeSnippetModel::DisplayAttribute::AttributeType_optional result;

  object = rawValue._object;
  v3._countAndFlagsBits = rawValue._countAndFlagsBits;
  v4 = v1;
  v3._object = object;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of GetContactAttributeSnippetModel.DisplayAttribute.AttributeType.init(rawValue:), v3);
  OUTLINED_FUNCTION_3_0();
  v6 = 9;
  if (v5 < 9)
    v6 = v5;
  *v4 = v6;
  OUTLINED_FUNCTION_0_0();
  return result;
}

void *static GetContactAttributeSnippetModel.DisplayAttribute.AttributeType.allCases.getter()
{
  return &outlined read-only object #0 of static GetContactAttributeSnippetModel.DisplayAttribute.AttributeType.allCases.getter;
}

uint64_t GetContactAttributeSnippetModel.DisplayAttribute.AttributeType.rawValue.getter()
{
  char *v0;

  return qword_2461B2458[*v0];
}

void protocol witness for static Equatable.== infix(_:_:) in conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType()
{
  specialized == infix<A>(_:_:)();
}

void protocol witness for Hashable.hashValue.getter in conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType()
{
  specialized RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType()
{
  return specialized RawRepresentable<>.hash(into:)();
}

void protocol witness for Hashable._rawHashValue(seed:) in conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType()
{
  specialized RawRepresentable<>._rawHashValue(seed:)();
}

SiriContactsCommon::GetContactAttributeSnippetModel::DisplayAttribute::AttributeType_optional protocol witness for RawRepresentable.init(rawValue:) in conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType(Swift::String *a1)
{
  return GetContactAttributeSnippetModel.DisplayAttribute.AttributeType.init(rawValue:)(*a1);
}

void protocol witness for RawRepresentable.rawValue.getter in conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = GetContactAttributeSnippetModel.DisplayAttribute.AttributeType.rawValue.getter();
  a1[1] = v2;
  OUTLINED_FUNCTION_12_1();
}

void protocol witness for static CaseIterable.allCases.getter in conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType(_QWORD *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of static GetContactAttributeSnippetModel.DisplayAttribute.AttributeType.allCases.getter;
}

uint64_t protocol witness for Decodable.init(from:) in conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType()
{
  lazy protocol witness table accessor for type GetContactAttributeSnippetModel.DisplayAttribute.AttributeType and conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType();
  return RawRepresentable<>.init(from:)();
}

uint64_t protocol witness for Encodable.encode(to:) in conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType()
{
  lazy protocol witness table accessor for type GetContactAttributeSnippetModel.DisplayAttribute.AttributeType and conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType();
  return RawRepresentable<>.encode(to:)();
}

void GetContactAttributeSnippetModel.DisplayAttribute.id.getter()
{
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_12_1();
}

void GetContactAttributeSnippetModel.DisplayAttribute.displayLabel.getter()
{
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_12_1();
}

void GetContactAttributeSnippetModel.DisplayAttribute.displayValue.getter()
{
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_12_1();
}

void GetContactAttributeSnippetModel.DisplayAttribute.type.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_165(a1);
}

void __swiftcall GetContactAttributeSnippetModel.DisplayAttribute.init(id:displayLabel:displayValue:type:)(SiriContactsCommon::GetContactAttributeSnippetModel::DisplayAttribute *__return_ptr retstr, Swift::String id, Swift::String_optional displayLabel, Swift::String_optional displayValue, SiriContactsCommon::GetContactAttributeSnippetModel::DisplayAttribute::AttributeType type)
{
  SiriContactsCommon::GetContactAttributeSnippetModel::DisplayAttribute::AttributeType v5;

  v5 = *(_BYTE *)type;
  retstr->id = id;
  retstr->displayLabel = displayLabel;
  retstr->displayValue = displayValue;
  retstr->type = v5;
}

uint64_t GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  BOOL v7;
  char v9;

  v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x4C79616C70736964 && a2 == 0xEC0000006C656261;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x5679616C70736964 && a2 == 0xEC00000065756C61;
      if (v7 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 1701869940 && a2 == 0xE400000000000000)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if ((v9 & 1) != 0)
          return 3;
        else
          return 4;
      }
    }
  }
}

uint64_t GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys.stringValue.getter(char a1)
{
  return qword_2461B24E8[a1];
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys()
{
  char *v0;

  return GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys()
{
  lazy protocol witness table accessor for type GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys and conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys()
{
  lazy protocol witness table accessor for type GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys and conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys();
  return CodingKey.debugDescription.getter();
}

void GetContactAttributeSnippetModel.DisplayAttribute.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_7();
  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys>);
  OUTLINED_FUNCTION_123();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_19();
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  lazy protocol witness table accessor for type GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys and conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  OUTLINED_FUNCTION_176();
  if (!v1)
  {
    OUTLINED_FUNCTION_121();
    OUTLINED_FUNCTION_121();
    lazy protocol witness table accessor for type GetContactAttributeSnippetModel.DisplayAttribute.AttributeType and conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType();
    OUTLINED_FUNCTION_16_4();
  }
  OUTLINED_FUNCTION_20_2(v2, *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  OUTLINED_FUNCTION_10_1();
}

void GetContactAttributeSnippetModel.DisplayAttribute.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, char a11)
{
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
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
  unint64_t ContactAttributeSnippet;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  OUTLINED_FUNCTION_3_7();
  v13 = v12;
  v15 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys>);
  OUTLINED_FUNCTION_75();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_11_4();
  __swift_project_boxed_opaque_existential_1(v13, v13[3]);
  lazy protocol witness table accessor for type GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys and conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v11)
  {
    OUTLINED_FUNCTION_25_0();
  }
  else
  {
    OUTLINED_FUNCTION_142();
    v17 = KeyedDecodingContainer.decode(_:forKey:)();
    v19 = v18;
    v27 = v17;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_142();
    v20 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
    v28 = v21;
    v26 = v20;
    swift_bridgeObjectRetain();
    v25 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
    v23 = v22;
    ContactAttributeSnippet = lazy protocol witness table accessor for type GetContactAttributeSnippetModel.DisplayAttribute.AttributeType and conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType();
    OUTLINED_FUNCTION_25();
    OUTLINED_FUNCTION_142();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    OUTLINED_FUNCTION_23_1();
    if (ContactAttributeSnippet)
    {
      OUTLINED_FUNCTION_24();
      OUTLINED_FUNCTION_149();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_25_0();
      OUTLINED_FUNCTION_24();
      OUTLINED_FUNCTION_149();
    }
    else
    {
      *(_QWORD *)v15 = v27;
      *(_QWORD *)(v15 + 8) = v19;
      *(_QWORD *)(v15 + 16) = v26;
      *(_QWORD *)(v15 + 24) = v28;
      *(_QWORD *)(v15 + 32) = v25;
      *(_QWORD *)(v15 + 40) = v23;
      *(_BYTE *)(v15 + 48) = a11;
      OUTLINED_FUNCTION_25_0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_4_0();
    }
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_189();
  OUTLINED_FUNCTION_10_1();
}

void protocol witness for Decodable.init(from:) in conformance GetContactAttributeSnippetModel.DisplayAttribute(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t vars0;
  _BYTE vars8[5];

  GetContactAttributeSnippetModel.DisplayAttribute.init(from:)(a1, a2, a3, a4, a5, a6, a7, a8, vars0, *(int *)vars8, vars8[4]);
}

void protocol witness for Encodable.encode(to:) in conformance GetContactAttributeSnippetModel.DisplayAttribute()
{
  GetContactAttributeSnippetModel.DisplayAttribute.encode(to:)();
}

void protocol witness for Identifiable.id.getter in conformance GetContactAttributeSnippetModel.DisplayAttribute(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  GetContactAttributeSnippetModel.DisplayAttribute.id.getter();
  *a1 = v2;
  a1[1] = v3;
}

void key path getter for GetContactAttributeSnippetModel.contact : GetContactAttributeSnippetModel(_QWORD *a1@<X8>)
{
  uint64_t v2;

  GetContactAttributeSnippetModel.contact.getter();
  *a1 = v2;
}

void key path setter for GetContactAttributeSnippetModel.contact : GetContactAttributeSnippetModel(id *a1)
{
  id v1;

  v1 = *a1;
  GetContactAttributeSnippetModel.contact.setter();
}

void GetContactAttributeSnippetModel.contact.setter()
{
  OUTLINED_FUNCTION_72();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  OUTLINED_FUNCTION_87();
  OUTLINED_FUNCTION_66();
}

void GetContactAttributeSnippetModel.contact.modify()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = OUTLINED_FUNCTION_49_0();
  *v0 = v1;
  OUTLINED_FUNCTION_72();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  v1[4] = OUTLINED_FUNCTION_48_0();
  OUTLINED_FUNCTION_0_0();
}

uint64_t GetContactAttributeSnippetModel.directInvocationsModel.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (uint64_t *)(v1 + *(int *)(OUTLINED_FUNCTION_93() + 24));
  v3 = *v2;
  v4 = v2[1];
  v5 = v2[2];
  v6 = v2[3];
  v7 = v2[4];
  *v0 = *v2;
  v0[1] = v4;
  v0[2] = v5;
  v0[3] = v6;
  v0[4] = v7;
  outlined copy of Data?(v3, v4);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_13_0();
  return OUTLINED_FUNCTION_77();
}

uint64_t GetContactAttributeSnippetModel.flowState.getter()
{
  return GetContactAttributeSnippetModel.flowState.getter(type metadata accessor for GetContactAttributeSnippetModel);
}

uint64_t GetContactAttributeSnippetModel.labelCATs.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_148(*(_QWORD *)(v0 + *(int *)(v1 + 32)));
  return OUTLINED_FUNCTION_99();
}

uint64_t GetContactAttributeSnippetModel.contactIdentifier.getter()
{
  id v0;
  uint64_t v1;
  id v3;

  OUTLINED_FUNCTION_72();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  Loggable.wrappedValue.getter();
  v0 = objc_msgSend(v3, sel_identifier);

  v1 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return v1;
}

BOOL GetContactAttributeSnippetModel.hasSingleResult.getter()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)v0 + 16) == 1;
}

uint64_t GetContactAttributeSnippetModel.shouldDisplayLightText.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for GetContactAttributeSnippetModel(0) + 36));
}

void GetContactAttributeSnippetModel.shouldDisplayLightText.setter(char a1)
{
  uint64_t v1;

  *(_BYTE *)(v1 + *(int *)(type metadata accessor for GetContactAttributeSnippetModel(0) + 36)) = a1;
  OUTLINED_FUNCTION_12_1();
}

uint64_t (*GetContactAttributeSnippetModel.shouldDisplayLightText.modify())()
{
  type metadata accessor for GetContactAttributeSnippetModel(0);
  return destructiveProjectEnumData for SiriContactsActionType;
}

void GetContactAttributeSnippetModel.shouldRenderAsContactCard.getter()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(_QWORD);
  uint64_t v8;

  type metadata accessor for GetContactAttributeSnippetModel(0);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_28_0();
  v2 = *(_QWORD **)v0;
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 16);
  if (v3 == 1 && (specialized == infix<A>(_:_:)(), (v4 & 1) != 0))
  {
    if (v2[2])
      Optional<A>.isNilOrEmpty.getter(v2[8], v2[9]);
    else
      __break(1u);
  }
  else
  {
    v5 = OUTLINED_FUNCTION_157();
    outlined init with copy of ContactsSnippetPluginModel(v5, v6, v7);
    OUTLINED_FUNCTION_54_0(v8, (void (*)(_QWORD))type metadata accessor for GetContactAttributeSnippetModel);
    OUTLINED_FUNCTION_0_0();
  }
}

uint64_t static ContactsLabelCATContainer.empty.getter()
{
  if (one-time initialization token for empty != -1)
    swift_once();
  OUTLINED_FUNCTION_148(static ContactsLabelCATContainer.empty);
  return OUTLINED_FUNCTION_99();
}

void GetContactAttributeSnippetModel.init(attributes:contact:flowState:directInvocationsModel:labelCATs:)(uint64_t a1@<X0>, __int128 *a2@<X2>, uint64_t *a3@<X3>, _OWORD *a4@<X4>, _QWORD *a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int *ContactAttributeSnippetModel;
  char *v14;
  char *v15;
  __int128 v16;

  v16 = *a2;
  v8 = *((_QWORD *)a2 + 2);
  v9 = *((_QWORD *)a2 + 3);
  v10 = *a3;
  v11 = a3[1];
  v12 = a3[4];
  ContactAttributeSnippetModel = (int *)type metadata accessor for GetContactAttributeSnippetModel(0);
  *((_BYTE *)a5 + ContactAttributeSnippetModel[9]) = 0;
  *a5 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodableContact<CNContact>);
  Loggable.init(wrappedValue:)();
  v14 = (char *)a5 + ContactAttributeSnippetModel[7];
  *(_OWORD *)v14 = v16;
  *((_QWORD *)v14 + 2) = v8;
  *((_QWORD *)v14 + 3) = v9;
  v15 = (char *)a5 + ContactAttributeSnippetModel[6];
  *(_QWORD *)v15 = v10;
  *((_QWORD *)v15 + 1) = v11;
  *((_OWORD *)v15 + 1) = *((_OWORD *)a3 + 1);
  *((_QWORD *)v15 + 4) = v12;
  *(_OWORD *)((char *)a5 + ContactAttributeSnippetModel[8]) = *a4;
  OUTLINED_FUNCTION_62_0();
}

uint64_t GetContactAttributeSnippetModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  char v9;

  v3 = a1 == 0x7475626972747461 && a2 == 0xEA00000000007365;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x746361746E6F63 && a2 == 0xE700000000000000;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000016 && a2 == 0x80000002461B3010
           || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v7 = a1 == 0x74617453776F6C66 && a2 == 0xE900000000000065;
      if (v7 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        v8 = a1 == 0x5441436C6562616CLL && a2 == 0xE900000000000073;
        if (v8 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else if (a1 == 0xD000000000000016 && a2 == 0x80000002461B3030)
        {
          swift_bridgeObjectRelease();
          return 5;
        }
        else
        {
          v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          if ((v9 & 1) != 0)
            return 5;
          else
            return 6;
        }
      }
    }
  }
}

uint64_t GetContactAttributeSnippetModel.CodingKeys.init(intValue:)()
{
  return 6;
}

uint64_t GetContactAttributeSnippetModel.CodingKeys.stringValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2461A1A98 + 4 * byte_2461AFAFE[a1]))(0xD000000000000016, 0x80000002461B3010);
}

uint64_t sub_2461A1A98()
{
  return 0x7475626972747461;
}

uint64_t sub_2461A1AB4()
{
  return 0x746361746E6F63;
}

uint64_t sub_2461A1ACC()
{
  return 0x74617453776F6C66;
}

uint64_t sub_2461A1AE8()
{
  return 0x5441436C6562616CLL;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance GetContactAttributeSnippetModel.CodingKeys()
{
  unsigned __int8 *v0;

  return GetContactAttributeSnippetModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance GetContactAttributeSnippetModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = GetContactAttributeSnippetModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance GetContactAttributeSnippetModel.CodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = GetContactAttributeSnippetModel.CodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance GetContactAttributeSnippetModel.CodingKeys()
{
  lazy protocol witness table accessor for type GetContactAttributeSnippetModel.CodingKeys and conformance GetContactAttributeSnippetModel.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance GetContactAttributeSnippetModel.CodingKeys()
{
  lazy protocol witness table accessor for type GetContactAttributeSnippetModel.CodingKeys and conformance GetContactAttributeSnippetModel.CodingKeys();
  return CodingKey.debugDescription.getter();
}

void GetContactAttributeSnippetModel.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<GetContactAttributeSnippetModel.CodingKeys>);
  OUTLINED_FUNCTION_27_1();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_73();
  lazy protocol witness table accessor for type GetContactAttributeSnippetModel.CodingKeys and conformance GetContactAttributeSnippetModel.CodingKeys();
  OUTLINED_FUNCTION_26_1();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GetContactAttributeSnippetModel.DisplayAttribute]);
  lazy protocol witness table accessor for type [GetContactAttributeSnippetModel.DisplayAttribute] and conformance <A> [A]((uint64_t)&lazy protocol witness table cache variable for type [GetContactAttributeSnippetModel.DisplayAttribute] and conformance <A> [A]);
  OUTLINED_FUNCTION_14_4();
  if (!v1)
  {
    v3 = OUTLINED_FUNCTION_134();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
    lazy protocol witness table accessor for type Loggable<CodableContact<CNContact>> and conformance <A> Loggable<A>((uint64_t)&lazy protocol witness table cache variable for type Loggable<CodableContact<CNContact>> and conformance <A> Loggable<A>);
    OUTLINED_FUNCTION_14_4();
    OUTLINED_FUNCTION_111(*(int *)(v3 + 24));
    lazy protocol witness table accessor for type GetContactDirectInvocationsModel and conformance GetContactDirectInvocationsModel();
    OUTLINED_FUNCTION_14_4();
    OUTLINED_FUNCTION_83((_OWORD *)(v0 + *(int *)(v3 + 28)));
    OUTLINED_FUNCTION_14_4();
    lazy protocol witness table accessor for type ContactsLabelCATContainer and conformance ContactsLabelCATContainer();
    OUTLINED_FUNCTION_14_4();
    OUTLINED_FUNCTION_82(5);
  }
  OUTLINED_FUNCTION_37_0();
  OUTLINED_FUNCTION_55_0();
}

void GetContactAttributeSnippetModel.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  char *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  char v17;
  uint64_t v18;
  void (*v19)(_QWORD);
  uint64_t v20;
  uint64_t v21;
  int *v22;
  char *v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  OUTLINED_FUNCTION_3_7();
  v5 = v4;
  v7 = v6;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  v20 = *(_QWORD *)(v8 - 8);
  v21 = v8;
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_59_0();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<GetContactAttributeSnippetModel.CodingKeys>);
  OUTLINED_FUNCTION_123();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_129();
  OUTLINED_FUNCTION_134();
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_6_5();
  v22 = v12;
  v23 = v13;
  v14 = v12[9];
  v13[v14] = 0;
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  lazy protocol witness table accessor for type GetContactAttributeSnippetModel.CodingKeys and conformance GetContactAttributeSnippetModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v1)
  {
    OUTLINED_FUNCTION_191();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [GetContactAttributeSnippetModel.DisplayAttribute]);
    lazy protocol witness table accessor for type [GetContactAttributeSnippetModel.DisplayAttribute] and conformance <A> [A]((uint64_t)&lazy protocol witness table cache variable for type [GetContactAttributeSnippetModel.DisplayAttribute] and conformance <A> [A]);
    OUTLINED_FUNCTION_56_0();
    *(_QWORD *)v23 = v24;
    LOBYTE(v24) = 1;
    lazy protocol witness table accessor for type Loggable<CodableContact<CNContact>> and conformance <A> Loggable<A>((uint64_t)&lazy protocol witness table cache variable for type Loggable<CodableContact<CNContact>> and conformance <A> Loggable<A>);
    OUTLINED_FUNCTION_56_0();
    (*(void (**)(char *, uint64_t, uint64_t))(v20 + 32))(&v23[v22[5]], v2, v21);
    lazy protocol witness table accessor for type GetContactDirectInvocationsModel and conformance GetContactDirectInvocationsModel();
    OUTLINED_FUNCTION_56_0();
    v15 = &v23[v22[6]];
    *(_OWORD *)v15 = v24;
    *((_OWORD *)v15 + 1) = v25;
    *((_QWORD *)v15 + 4) = v26;
    OUTLINED_FUNCTION_141();
    OUTLINED_FUNCTION_56_0();
    v16 = &v23[v22[7]];
    *(_OWORD *)v16 = v24;
    *((_OWORD *)v16 + 1) = v25;
    lazy protocol witness table accessor for type ContactsLabelCATContainer and conformance ContactsLabelCATContainer();
    OUTLINED_FUNCTION_56_0();
    *(_OWORD *)&v23[v22[8]] = v24;
    v17 = KeyedDecodingContainer.decode(_:forKey:)();
    OUTLINED_FUNCTION_47_0(v3, *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
    v23[v14] = v17 & 1;
    outlined init with copy of ContactsSnippetPluginModel((uint64_t)v23, v7, type metadata accessor for GetContactAttributeSnippetModel);
    OUTLINED_FUNCTION_191();
    v18 = OUTLINED_FUNCTION_13_1();
    outlined destroy of ModifyContactAttributeSnippetModel(v18, v19);
  }
  OUTLINED_FUNCTION_10_1();
}

uint64_t ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v7;

  v3 = a1 == 0x656D616E6B63696ELL && a2 == 0xE800000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F6974616C6572 && a2 == 0xEC00000070696873)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys.stringValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6E6F6974616C6572;
  else
    return 0x656D616E6B63696ELL;
}

uint64_t ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys.stringValue.getter()
{
  return 12383;
}

void ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  if (a1 != 12383 || a2 != 0xE200000000000000)
    OUTLINED_FUNCTION_146();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12_1();
}

void ContactsSnippetPluginModel.GetContactAttributeCodingKeys.hashValue.getter()
{
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_104();
  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_13_4();
}

void protocol witness for Decodable.init(from:) in conformance GetContactAttributeSnippetModel()
{
  GetContactAttributeSnippetModel.init(from:)();
}

void protocol witness for Encodable.encode(to:) in conformance GetContactAttributeSnippetModel()
{
  GetContactAttributeSnippetModel.encode(to:)();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys()
{
  char *v0;

  return ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys()
{
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys()
{
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys();
  return CodingKey.debugDescription.getter();
}

void protocol witness for CodingKey.init(stringValue:) in conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v4;

  ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys.init(stringValue:)(a1, a2);
  *a3 = v4 & 1;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys()
{
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys()
{
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys();
  return CodingKey.debugDescription.getter();
}

void protocol witness for Hashable._rawHashValue(seed:) in conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys()
{
  OUTLINED_FUNCTION_136();
  OUTLINED_FUNCTION_104();
  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_13_4();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys()
{
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys()
{
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys();
  return CodingKey.debugDescription.getter();
}

void ModifyContactAttributeSnippetModel.ContactAttributeToModify.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_3_7();
  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys>);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_29_0();
  v10 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys>)
                  - 8);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_11_4();
  v11 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys>)
                  - 8);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_7_5();
  v7 = *(_BYTE *)(v0 + 16);
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  if ((v7 & 1) != 0)
  {
    OUTLINED_FUNCTION_183();
    OUTLINED_FUNCTION_18_3();
    OUTLINED_FUNCTION_176();
    v8 = OUTLINED_FUNCTION_51_0();
  }
  else
  {
    lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys();
    OUTLINED_FUNCTION_18_3();
    OUTLINED_FUNCTION_176();
    v9 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
    v8 = v1;
  }
  OUTLINED_FUNCTION_20_2(v8, v9);
  OUTLINED_FUNCTION_24_1(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8));
  OUTLINED_FUNCTION_10_1();
}

void ModifyContactAttributeSnippetModel.ContactAttributeToModify.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
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
  char v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
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

  OUTLINED_FUNCTION_3_7();
  v5 = v4;
  v32 = v6;
  v34 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys>)
                  - 8);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_97(v8, v30);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys>);
  v9 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_28_0();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys>);
  OUTLINED_FUNCTION_75();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_7_5();
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v1)
    goto LABEL_10;
  v36 = v3;
  v12 = KeyedDecodingContainer.allKeys.getter();
  v14 = *(_QWORD *)(v12 + 16);
  v15 = v10;
  if (!v14)
  {
LABEL_8:
    v23 = OUTLINED_FUNCTION_107();
    OUTLINED_FUNCTION_30_0();
    v25 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
    *v25 = &type metadata for ModifyContactAttributeSnippetModel.ContactAttributeToModify;
    KeyedDecodingContainer.codingPath.getter();
    OUTLINED_FUNCTION_22_3();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v25, *MEMORY[0x24BEE26D0], v23);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v2, v15);
LABEL_10:
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
    goto LABEL_11;
  }
  v16 = *(_BYTE *)(v12 + 32);
  OUTLINED_FUNCTION_89(1, v14, v12, v12 + 32, v13, (2 * v14) | 1);
  v18 = v17;
  v20 = v19;
  OUTLINED_FUNCTION_128();
  if (v18 != v20 >> 1)
  {
    v15 = v10;
    goto LABEL_8;
  }
  if ((v16 & 1) != 0)
  {
    OUTLINED_FUNCTION_183();
    OUTLINED_FUNCTION_166();
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    v21 = KeyedDecodingContainer.decode(_:forKey:)();
    v22 = v36;
    v28 = v27;
    v31 = v21;
    OUTLINED_FUNCTION_34_0(v35, *(uint64_t (**)(uint64_t, uint64_t))(v34 + 8));
  }
  else
  {
    lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys();
    OUTLINED_FUNCTION_166();
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
    v26 = KeyedDecodingContainer.decode(_:forKey:)();
    v28 = v29;
    v31 = v26;
    OUTLINED_FUNCTION_57_0(v0, *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8));
    v22 = v36;
  }
  OUTLINED_FUNCTION_52_0();
  OUTLINED_FUNCTION_24_1(*(uint64_t (**)(uint64_t, uint64_t))(v22 + 8));
  *(_QWORD *)v32 = v31;
  *(_QWORD *)(v32 + 8) = v28;
  *(_BYTE *)(v32 + 16) = v16;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
LABEL_11:
  OUTLINED_FUNCTION_10_1();
}

void protocol witness for Decodable.init(from:) in conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify()
{
  ModifyContactAttributeSnippetModel.ContactAttributeToModify.init(from:)();
}

void protocol witness for Encodable.encode(to:) in conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify()
{
  ModifyContactAttributeSnippetModel.ContactAttributeToModify.encode(to:)();
}

uint64_t ModifyContactAttributeSnippetModel.ModificationType.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  BOOL v7;
  char v9;

  v3 = a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 6579297 && a2 == 0xE300000000000000;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x6563616C706572 && a2 == 0xE700000000000000;
      if (v7 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0x6574656C6564 && a2 == 0xE600000000000000)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if ((v9 & 1) != 0)
          return 3;
        else
          return 4;
      }
    }
  }
}

uint64_t ModifyContactAttributeSnippetModel.ModificationType.CodingKeys.stringValue.getter(char a1)
{
  return *(_QWORD *)&aUnknown_1[8 * a1];
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys()
{
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys()
{
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys()
{
  char *v0;

  return ModifyContactAttributeSnippetModel.ModificationType.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = ModifyContactAttributeSnippetModel.ModificationType.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys()
{
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.CodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys()
{
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.CodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys()
{
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys()
{
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys()
{
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys()
{
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys()
{
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys()
{
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys();
  return CodingKey.debugDescription.getter();
}

void ModifyContactAttributeSnippetModel.ModificationType.encode(to:)()
{
  unsigned __int8 *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_3_7();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys>);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_94(v2, v11);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys>);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_9_5(v4, v12);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys>);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_7_5();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys>);
  OUTLINED_FUNCTION_27_1();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_29_0();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ModifyContactAttributeSnippetModel.ModificationType.CodingKeys>);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_8_4();
  v8 = *v0;
  v9 = (_QWORD *)OUTLINED_FUNCTION_157();
  __swift_project_boxed_opaque_existential_1(v9, v10);
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.CodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  __asm { BR              X9 }
}

void sub_2461A2EE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v3 - 68) = 0;
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys();
  OUTLINED_FUNCTION_44_0();
  (*(void (**)(uint64_t, _QWORD))(v2 + 8))(v1, *(_QWORD *)(v3 - 168));
  OUTLINED_FUNCTION_39(v0, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 96) + 8));
  OUTLINED_FUNCTION_10_1();
}

void ModifyContactAttributeSnippetModel.ModificationType.init(from:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
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
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  OUTLINED_FUNCTION_3_7();
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys>);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_6_5();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys>);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_97(v5, v25);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys>);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_94(v7, v26);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys>);
  OUTLINED_FUNCTION_123();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_7_5();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ModifyContactAttributeSnippetModel.ModificationType.CodingKeys>);
  OUTLINED_FUNCTION_81();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_129();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.CodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v0)
  {
    v10 = KeyedDecodingContainer.allKeys.getter();
    if (*(_QWORD *)(v10 + 16))
    {
      OUTLINED_FUNCTION_152();
      v27 = v11;
      OUTLINED_FUNCTION_89(1, v12, v10, v13, v14, v15);
      v17 = v16;
      v19 = v18;
      swift_bridgeObjectRelease();
      if (v17 == v19 >> 1)
        __asm { BR              X9 }
    }
    OUTLINED_FUNCTION_107();
    OUTLINED_FUNCTION_30_0();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
    *v21 = &type metadata for ModifyContactAttributeSnippetModel.ModificationType;
    KeyedDecodingContainer.codingPath.getter();
    v22 = OUTLINED_FUNCTION_22_3();
    OUTLINED_FUNCTION_21_2(v22, *MEMORY[0x24BEE26D0]);
    swift_willThrow();
    OUTLINED_FUNCTION_19_3();
    v23 = OUTLINED_FUNCTION_51_0();
    OUTLINED_FUNCTION_34_0(v23, v24);
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
  OUTLINED_FUNCTION_10_1();
}

void sub_2461A3250()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_186();
  v2 = OUTLINED_FUNCTION_25_1();
  if (!v0)
  {
    OUTLINED_FUNCTION_76();
    JUMPOUT(0x2461A3304);
  }
  OUTLINED_FUNCTION_19_3(v2);
  OUTLINED_FUNCTION_17_4(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  JUMPOUT(0x2461A3238);
}

void sub_2461A3280()
{
  uint64_t v0;

  OUTLINED_FUNCTION_173();
  OUTLINED_FUNCTION_25_1();
  if (v0)
    JUMPOUT(0x2461A32A8);
  JUMPOUT(0x2461A3300);
}

void sub_2461A32C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, _QWORD);

  OUTLINED_FUNCTION_140();
  OUTLINED_FUNCTION_25_1();
  if (v0)
  {
    OUTLINED_FUNCTION_19_3();
    OUTLINED_FUNCTION_17_4(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    JUMPOUT(0x2461A3238);
  }
  v3 = OUTLINED_FUNCTION_76();
  v4(v3, *(_QWORD *)(v2 - 128));
  OUTLINED_FUNCTION_19_3();
  OUTLINED_FUNCTION_17_4(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  JUMPOUT(0x2461A334CLL);
}

void protocol witness for Decodable.init(from:) in conformance ModifyContactAttributeSnippetModel.ModificationType()
{
  ModifyContactAttributeSnippetModel.ModificationType.init(from:)();
}

void protocol witness for Encodable.encode(to:) in conformance ModifyContactAttributeSnippetModel.ModificationType()
{
  ModifyContactAttributeSnippetModel.ModificationType.encode(to:)();
}

uint64_t ModifyContactAttributeSnippetModel.attributeToModify.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(v1 + 8);
  v3 = *(_BYTE *)(v1 + 16);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 16) = v3;
  return outlined copy of ModifyContactAttributeSnippetModel.ContactAttributeToModify();
}

void ModifyContactAttributeSnippetModel.modificationType.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_165(a1);
}

void ModifyContactAttributeSnippetModel.contact.getter()
{
  OUTLINED_FUNCTION_168();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  OUTLINED_FUNCTION_122();
  OUTLINED_FUNCTION_12_1();
}

void key path getter for ModifyContactAttributeSnippetModel.contact : ModifyContactAttributeSnippetModel(_QWORD *a1@<X8>)
{
  uint64_t v2;

  ModifyContactAttributeSnippetModel.contact.getter();
  *a1 = v2;
}

void key path setter for ModifyContactAttributeSnippetModel.contact : ModifyContactAttributeSnippetModel(id *a1)
{
  id v1;

  v1 = *a1;
  ModifyContactAttributeSnippetModel.contact.setter();
}

void ModifyContactAttributeSnippetModel.contact.setter()
{
  type metadata accessor for ModifyContactAttributeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  OUTLINED_FUNCTION_87();
  OUTLINED_FUNCTION_66();
}

void ModifyContactAttributeSnippetModel.contact.modify()
{
  uint64_t v0;
  void *v1;

  v1 = OUTLINED_FUNCTION_49_0();
  OUTLINED_FUNCTION_130((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  *(_QWORD *)(v0 + 32) = OUTLINED_FUNCTION_48_0();
  OUTLINED_FUNCTION_0_0();
}

uint64_t ModifyContactAttributeSnippetModel.flowState.getter()
{
  return GetContactAttributeSnippetModel.flowState.getter(type metadata accessor for ModifyContactAttributeSnippetModel);
}

uint64_t GetContactAttributeSnippetModel.flowState.getter(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v1 = a1(0);
  v2 = OUTLINED_FUNCTION_126(*(int *)(v1 + 28));
  return OUTLINED_FUNCTION_101(v2, v3, v4, v5);
}

void ModifyContactAttributeSnippetModel.labelCATs.getter()
{
  OUTLINED_FUNCTION_168();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
  OUTLINED_FUNCTION_122();
  OUTLINED_FUNCTION_12_1();
}

double key path getter for ModifyContactAttributeSnippetModel.labelCATs : ModifyContactAttributeSnippetModel@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  ModifyContactAttributeSnippetModel.labelCATs.getter();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t key path setter for GetContactSnippetModel.labelCATs : GetContactSnippetModel(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD *))
{
  uint64_t v6;
  _QWORD v8[2];

  v6 = a1[1];
  v8[0] = *a1;
  v8[1] = v6;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_13_0();
  return a5(v8);
}

void ModifyContactAttributeSnippetModel.labelCATs.setter()
{
  type metadata accessor for ModifyContactAttributeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
  OUTLINED_FUNCTION_151();
  OUTLINED_FUNCTION_66();
}

void ModifyContactAttributeSnippetModel.labelCATs.modify()
{
  uint64_t v0;
  void *v1;

  v1 = OUTLINED_FUNCTION_49_0();
  OUTLINED_FUNCTION_130((uint64_t)v1);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
  *(_QWORD *)(v0 + 32) = OUTLINED_FUNCTION_48_0();
  OUTLINED_FUNCTION_0_0();
}

void GetContactSnippetModel.contact.modify(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

void ModifyContactAttributeSnippetModel.meCardPunchout.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_106();
  outlined copy of Data?(*(_QWORD *)(v0 + *(int *)(v1 + 36)), *(_QWORD *)(v0 + *(int *)(v1 + 36) + 8));
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_12_1();
}

void ModifyContactAttributeSnippetModel.targetPunchout.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_106();
  outlined copy of Data?(*(_QWORD *)(v0 + *(int *)(v1 + 40)), *(_QWORD *)(v0 + *(int *)(v1 + 40) + 8));
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_12_1();
}

void ModifyContactAttributeSnippetModel.modificationDisplayString.getter()
{
  outlined copy of ModifyContactAttributeSnippetModel.ContactAttributeToModify();
  OUTLINED_FUNCTION_0_0();
}

uint64_t ModifyContactAttributeSnippetModel.init(attributeToModify:modificationType:contact:flowState:labelCATs:meCardPunchout:targetPunchout:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, __int128 *a3@<X3>, uint64_t a4@<X5>, uint64_t a5@<X6>, uint64_t a6@<X7>, uint64_t a7@<X8>, uint64_t a8)
{
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  uint64_t result;
  _QWORD *v18;
  _QWORD *v19;
  __int128 v20;

  v11 = *(_BYTE *)(a1 + 16);
  v12 = *a2;
  v20 = *a3;
  v14 = *((_QWORD *)a3 + 2);
  v13 = *((_QWORD *)a3 + 3);
  *(_OWORD *)a7 = *(_OWORD *)a1;
  *(_BYTE *)(a7 + 16) = v11;
  *(_BYTE *)(a7 + 17) = v12;
  v15 = (int *)OUTLINED_FUNCTION_106();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CodableContact<CNContact>);
  Loggable.init(wrappedValue:)();
  v16 = a7 + v15[7];
  *(_OWORD *)v16 = v20;
  *(_QWORD *)(v16 + 16) = v14;
  *(_QWORD *)(v16 + 24) = v13;
  result = Loggable.init(wrappedValue:)();
  v18 = (_QWORD *)(a7 + v15[9]);
  *v18 = a4;
  v18[1] = a5;
  v19 = (_QWORD *)(a7 + v15[10]);
  *v19 = a6;
  v19[1] = a8;
  return result;
}

uint64_t ModifyContactAttributeSnippetModel.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  char v10;

  if (a1 == 0xD000000000000011 && a2 == 0x80000002461B3050
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x80000002461B3070
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = a1 == 0x746361746E6F63 && a2 == 0xE700000000000000;
    if (v5 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v6 = a1 == 0x74617453776F6C66 && a2 == 0xE900000000000065;
      if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        v7 = a1 == 0x5441436C6562616CLL && a2 == 0xE900000000000073;
        if (v7 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          v8 = a1 == 0x755064726143656DLL && a2 == 0xEE0074756F68636ELL;
          if (v8 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else if (a1 == 0x7550746567726174 && a2 == 0xEE0074756F68636ELL)
          {
            swift_bridgeObjectRelease();
            return 6;
          }
          else
          {
            v10 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
            if ((v10 & 1) != 0)
              return 6;
            else
              return 7;
          }
        }
      }
    }
  }
}

uint64_t ModifyContactAttributeSnippetModel.CodingKeys.init(intValue:)()
{
  return 7;
}

uint64_t ModifyContactAttributeSnippetModel.CodingKeys.stringValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2461A3B14 + 4 * byte_2461AFB0C[a1]))(0xD000000000000011, 0x80000002461B3050);
}

unint64_t sub_2461A3B14()
{
  return 0xD000000000000010;
}

uint64_t sub_2461A3B30()
{
  return 0x746361746E6F63;
}

uint64_t sub_2461A3B48()
{
  return 0x74617453776F6C66;
}

uint64_t sub_2461A3B64()
{
  return 0x5441436C6562616CLL;
}

uint64_t sub_2461A3B84()
{
  return 0x755064726143656DLL;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance ModifyContactAttributeSnippetModel.CodingKeys()
{
  unsigned __int8 *v0;

  return ModifyContactAttributeSnippetModel.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance ModifyContactAttributeSnippetModel.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = ModifyContactAttributeSnippetModel.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance ModifyContactAttributeSnippetModel.CodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = ModifyContactAttributeSnippetModel.CodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ModifyContactAttributeSnippetModel.CodingKeys()
{
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.CodingKeys and conformance ModifyContactAttributeSnippetModel.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ModifyContactAttributeSnippetModel.CodingKeys()
{
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.CodingKeys and conformance ModifyContactAttributeSnippetModel.CodingKeys();
  return CodingKey.debugDescription.getter();
}

void ModifyContactAttributeSnippetModel.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ModifyContactAttributeSnippetModel.CodingKeys>);
  OUTLINED_FUNCTION_27_1();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_73();
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.CodingKeys and conformance ModifyContactAttributeSnippetModel.CodingKeys();
  OUTLINED_FUNCTION_26_1();
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ContactAttributeToModify and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify();
  OUTLINED_FUNCTION_16_4();
  if (!v1)
  {
    OUTLINED_FUNCTION_132();
    lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType and conformance ModifyContactAttributeSnippetModel.ModificationType();
    OUTLINED_FUNCTION_16_4();
    v3 = OUTLINED_FUNCTION_106();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
    lazy protocol witness table accessor for type Loggable<CodableContact<CNContact>> and conformance <A> Loggable<A>((uint64_t)&lazy protocol witness table cache variable for type Loggable<CodableContact<CNContact>> and conformance <A> Loggable<A>);
    OUTLINED_FUNCTION_16_4();
    OUTLINED_FUNCTION_83((_OWORD *)(v0 + *(int *)(v3 + 28)));
    OUTLINED_FUNCTION_16_4();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
    lazy protocol witness table accessor for type Loggable<ContactsLabelCATContainer> and conformance <A> Loggable<A>((uint64_t)&lazy protocol witness table cache variable for type Loggable<ContactsLabelCATContainer> and conformance <A> Loggable<A>);
    OUTLINED_FUNCTION_16_4();
    lazy protocol witness table accessor for type Data and conformance Data();
    OUTLINED_FUNCTION_61_0();
    OUTLINED_FUNCTION_61_0();
  }
  OUTLINED_FUNCTION_37_0();
  OUTLINED_FUNCTION_55_0();
}

void ModifyContactAttributeSnippetModel.init(from:)()
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
  _QWORD *v11;
  uint64_t v12;
  _OWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;

  OUTLINED_FUNCTION_3_7();
  v4 = v3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
  v14 = *(_QWORD *)(v5 - 8);
  v15 = v5;
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_59_0();
  v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  v16 = *(_QWORD *)(v18 - 8);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_8_4();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ModifyContactAttributeSnippetModel.CodingKeys>);
  OUTLINED_FUNCTION_81();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_11_4();
  v17 = (int *)OUTLINED_FUNCTION_106();
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_6_5();
  v19 = v10;
  v11 = (_QWORD *)OUTLINED_FUNCTION_158();
  __swift_project_boxed_opaque_existential_1(v11, v12);
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.CodingKeys and conformance ModifyContactAttributeSnippetModel.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v0)
  {
    OUTLINED_FUNCTION_144();
  }
  else
  {
    lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ContactAttributeToModify and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify();
    OUTLINED_FUNCTION_46_0();
    *(_OWORD *)v19 = v20;
    *(_BYTE *)(v19 + 16) = v21;
    OUTLINED_FUNCTION_132();
    lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType and conformance ModifyContactAttributeSnippetModel.ModificationType();
    OUTLINED_FUNCTION_170();
    OUTLINED_FUNCTION_46_0();
    *(_BYTE *)(v19 + 17) = v20;
    LOBYTE(v20) = 2;
    lazy protocol witness table accessor for type Loggable<CodableContact<CNContact>> and conformance <A> Loggable<A>((uint64_t)&lazy protocol witness table cache variable for type Loggable<CodableContact<CNContact>> and conformance <A> Loggable<A>);
    OUTLINED_FUNCTION_46_0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v19 + v17[6], v1, v18);
    OUTLINED_FUNCTION_141();
    OUTLINED_FUNCTION_46_0();
    v13 = (_OWORD *)(v19 + v17[7]);
    *v13 = v20;
    v13[1] = v21;
    LOBYTE(v20) = 4;
    lazy protocol witness table accessor for type Loggable<ContactsLabelCATContainer> and conformance <A> Loggable<A>((uint64_t)&lazy protocol witness table cache variable for type Loggable<ContactsLabelCATContainer> and conformance <A> Loggable<A>);
    OUTLINED_FUNCTION_46_0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 32))(v19 + v17[8], v2, v15);
    lazy protocol witness table accessor for type Data and conformance Data();
    OUTLINED_FUNCTION_58_0();
    *(_OWORD *)(v19 + v17[9]) = v20;
    OUTLINED_FUNCTION_58_0();
    OUTLINED_FUNCTION_36_0();
    *(_OWORD *)(v19 + v17[10]) = v20;
    outlined init with copy of ContactsSnippetPluginModel(v19, v4, type metadata accessor for ModifyContactAttributeSnippetModel);
    OUTLINED_FUNCTION_144();
    outlined destroy of ModifyContactAttributeSnippetModel(v19, (void (*)(_QWORD))type metadata accessor for ModifyContactAttributeSnippetModel);
  }
  OUTLINED_FUNCTION_10_1();
}

void protocol witness for Decodable.init(from:) in conformance ModifyContactAttributeSnippetModel()
{
  ModifyContactAttributeSnippetModel.init(from:)();
}

void protocol witness for Encodable.encode(to:) in conformance ModifyContactAttributeSnippetModel()
{
  ModifyContactAttributeSnippetModel.encode(to:)();
}

uint64_t one-time initialization function for empty()
{
  uint64_t v0;
  uint64_t result;

  lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType and conformance ContactsLabelCATContainer.LabelType();
  v0 = Dictionary.init(dictionaryLiteral:)();
  result = Dictionary.init(dictionaryLiteral:)();
  static ContactsLabelCATContainer.empty = v0;
  unk_2575511B0 = result;
  return result;
}

SiriContactsCommon::ContactsLabelCATContainer __swiftcall ContactsLabelCATContainer.init(labels:localizedAttributeLabels:)(Swift::OpaquePointer labels, Swift::OpaquePointer localizedAttributeLabels)
{
  Swift::OpaquePointer *v2;
  SiriContactsCommon::ContactsLabelCATContainer result;

  v2->_rawValue = labels._rawValue;
  v2[1]._rawValue = localizedAttributeLabels._rawValue;
  result.localizedAttributeLabels = localizedAttributeLabels;
  result.labels = labels;
  return result;
}

BOOL static ContactsLabelCATContainer.LabelType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void ContactsLabelCATContainer.LabelType.hash(into:)()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
  OUTLINED_FUNCTION_12_1();
}

uint64_t ContactsLabelCATContainer.LabelType.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  char v14;

  v3 = a1 == 0x7374696E55656761 && a2 == 0xE800000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 1819042147 && a2 == 0xE400000000000000;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x6C65636E6163 && a2 == 0xE600000000000000;
      if (v7 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 28519 && a2 == 0xE200000000000000;
        if (v8 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          v9 = a1 == 1818845549 && a2 == 0xE400000000000000;
          if (v9 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            v10 = a1 == 0x6567617373656DLL && a2 == 0xE700000000000000;
            if (v10 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else
            {
              v11 = a1 == 1702257011 && a2 == 0xE400000000000000;
              if (v11 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 6;
              }
              else
              {
                v12 = a1 == 0x6465766173 && a2 == 0xE500000000000000;
                if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 7;
                }
                else if (a1 == 0x6F65646976 && a2 == 0xE500000000000000)
                {
                  swift_bridgeObjectRelease();
                  return 8;
                }
                else
                {
                  v14 = _stringCompareWithSmolCheck(_:_:expecting:)();
                  swift_bridgeObjectRelease();
                  if ((v14 & 1) != 0)
                    return 8;
                  else
                    return 9;
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t ContactsLabelCATContainer.LabelType.CodingKeys.init(intValue:)()
{
  return 9;
}

void ContactsSnippetPluginModel.CodingKeys.hashValue.getter(unsigned __int8 a1)
{
  OUTLINED_FUNCTION_35();
  Hasher._combine(_:)(a1);
  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_13_4();
}

uint64_t ContactsLabelCATContainer.LabelType.CodingKeys.stringValue.getter(char a1)
{
  return *(_QWORD *)&aAgeunitscall[8 * a1];
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys()
{
  lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys and conformance ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys()
{
  lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys and conformance ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsLabelCATContainer.LabelType.CallCodingKeys()
{
  lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.CallCodingKeys and conformance ContactsLabelCATContainer.LabelType.CallCodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsLabelCATContainer.LabelType.CallCodingKeys()
{
  lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.CallCodingKeys and conformance ContactsLabelCATContainer.LabelType.CallCodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsLabelCATContainer.LabelType.CancelCodingKeys()
{
  lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.CancelCodingKeys and conformance ContactsLabelCATContainer.LabelType.CancelCodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsLabelCATContainer.LabelType.CancelCodingKeys()
{
  lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.CancelCodingKeys and conformance ContactsLabelCATContainer.LabelType.CancelCodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance ContactsLabelCATContainer.LabelType.CodingKeys()
{
  char *v0;

  return ContactsLabelCATContainer.LabelType.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance ContactsLabelCATContainer.LabelType.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = ContactsLabelCATContainer.LabelType.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.init(intValue:) in conformance ContactsLabelCATContainer.LabelType.CodingKeys@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = ContactsLabelCATContainer.LabelType.CodingKeys.init(intValue:)();
  *a1 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsLabelCATContainer.LabelType.CodingKeys()
{
  lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.CodingKeys and conformance ContactsLabelCATContainer.LabelType.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsLabelCATContainer.LabelType.CodingKeys()
{
  lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.CodingKeys and conformance ContactsLabelCATContainer.LabelType.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsLabelCATContainer.LabelType.GoCodingKeys()
{
  lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.GoCodingKeys and conformance ContactsLabelCATContainer.LabelType.GoCodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsLabelCATContainer.LabelType.GoCodingKeys()
{
  lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.GoCodingKeys and conformance ContactsLabelCATContainer.LabelType.GoCodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsLabelCATContainer.LabelType.MailCodingKeys()
{
  lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.MailCodingKeys and conformance ContactsLabelCATContainer.LabelType.MailCodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsLabelCATContainer.LabelType.MailCodingKeys()
{
  lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.MailCodingKeys and conformance ContactsLabelCATContainer.LabelType.MailCodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsLabelCATContainer.LabelType.MessageCodingKeys()
{
  lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.MessageCodingKeys and conformance ContactsLabelCATContainer.LabelType.MessageCodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsLabelCATContainer.LabelType.MessageCodingKeys()
{
  lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.MessageCodingKeys and conformance ContactsLabelCATContainer.LabelType.MessageCodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsLabelCATContainer.LabelType.SaveCodingKeys()
{
  lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.SaveCodingKeys and conformance ContactsLabelCATContainer.LabelType.SaveCodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsLabelCATContainer.LabelType.SaveCodingKeys()
{
  lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.SaveCodingKeys and conformance ContactsLabelCATContainer.LabelType.SaveCodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsLabelCATContainer.LabelType.SavedCodingKeys()
{
  lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.SavedCodingKeys and conformance ContactsLabelCATContainer.LabelType.SavedCodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsLabelCATContainer.LabelType.SavedCodingKeys()
{
  lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.SavedCodingKeys and conformance ContactsLabelCATContainer.LabelType.SavedCodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsLabelCATContainer.LabelType.VideoCodingKeys()
{
  lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.VideoCodingKeys and conformance ContactsLabelCATContainer.LabelType.VideoCodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsLabelCATContainer.LabelType.VideoCodingKeys()
{
  lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.VideoCodingKeys and conformance ContactsLabelCATContainer.LabelType.VideoCodingKeys();
  return CodingKey.debugDescription.getter();
}

void *static ContactsLabelCATContainer.LabelType.allCases.getter()
{
  return &outlined read-only object #0 of static ContactsLabelCATContainer.LabelType.allCases.getter;
}

void ContactsLabelCATContainer.LabelType.encode(to:)()
{
  unsigned __int8 *v0;
  _QWORD *v1;
  _QWORD *v2;
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

  OUTLINED_FUNCTION_3_7();
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsLabelCATContainer.LabelType.VideoCodingKeys>);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_41_0(v4, v17);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsLabelCATContainer.LabelType.SavedCodingKeys>);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_42_0(v6, v18);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsLabelCATContainer.LabelType.SaveCodingKeys>);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_98(v8, v19);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsLabelCATContainer.LabelType.MessageCodingKeys>);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_6_5();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsLabelCATContainer.LabelType.MailCodingKeys>);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_6_5();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsLabelCATContainer.LabelType.GoCodingKeys>);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_6_5();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsLabelCATContainer.LabelType.CancelCodingKeys>);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_6_5();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsLabelCATContainer.LabelType.CallCodingKeys>);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_11_4();
  v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys>);
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_19();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsLabelCATContainer.LabelType.CodingKeys>);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_28_0();
  v16 = *v0;
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.CodingKeys and conformance ContactsLabelCATContainer.LabelType.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  __asm { BR              X9 }
}

void sub_2461A4C9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);

  *(_BYTE *)(v3 - 89) = 0;
  lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys and conformance ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys();
  OUTLINED_FUNCTION_5_7();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
  v4 = OUTLINED_FUNCTION_157();
  v5(v4);
  OUTLINED_FUNCTION_10_1();
}

void ModifyContactAttributeSnippetModel.ModificationType.hashValue.getter()
{
  int v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  char v9;

  v0 = OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_105(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9);
  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_13_4();
}

void ContactsLabelCATContainer.LabelType.init(from:)()
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
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

  OUTLINED_FUNCTION_3_7();
  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsLabelCATContainer.LabelType.VideoCodingKeys>);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_96(v6, v37);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsLabelCATContainer.LabelType.SavedCodingKeys>);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_10_2(v8, v38);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsLabelCATContainer.LabelType.SaveCodingKeys>);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_9_5(v10, v39);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsLabelCATContainer.LabelType.MessageCodingKeys>);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_41_0(v12, v40);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsLabelCATContainer.LabelType.MailCodingKeys>);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_95(v14, v41);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsLabelCATContainer.LabelType.GoCodingKeys>);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_6_5();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsLabelCATContainer.LabelType.CancelCodingKeys>);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_42_0(v17, v42);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsLabelCATContainer.LabelType.CallCodingKeys>);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_6_5();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys>);
  OUTLINED_FUNCTION_81();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_11_4();
  v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsLabelCATContainer.LabelType.CodingKeys>);
  OUTLINED_FUNCTION_75();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_7_5();
  v44 = v4;
  v22 = (_QWORD *)OUTLINED_FUNCTION_159();
  __swift_project_boxed_opaque_existential_1(v22, v23);
  lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.CodingKeys and conformance ContactsLabelCATContainer.LabelType.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v0)
  {
    v45 = v2;
    v24 = KeyedDecodingContainer.allKeys.getter();
    if (*(_QWORD *)(v24 + 16))
    {
      OUTLINED_FUNCTION_152();
      v43 = v25;
      OUTLINED_FUNCTION_89(1, v26, v24, v27, v28, v29);
      v31 = v30;
      v33 = v32;
      swift_bridgeObjectRelease();
      if (v31 == v33 >> 1)
        __asm { BR              X9 }
    }
    OUTLINED_FUNCTION_107();
    OUTLINED_FUNCTION_30_0();
    v35 = v34;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
    *v35 = &type metadata for ContactsLabelCATContainer.LabelType;
    KeyedDecodingContainer.codingPath.getter();
    v36 = OUTLINED_FUNCTION_22_3();
    OUTLINED_FUNCTION_21_2(v36, *MEMORY[0x24BEE26D0]);
    swift_willThrow();
    OUTLINED_FUNCTION_19_3();
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v1, v20);
  }
  __swift_destroy_boxed_opaque_existential_0(v44);
  OUTLINED_FUNCTION_10_1();
}

void sub_2461A527C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, _QWORD);

  OUTLINED_FUNCTION_185();
  OUTLINED_FUNCTION_2_7();
  if (!v0)
  {
    v2 = OUTLINED_FUNCTION_51_0();
    v3(v2, *(_QWORD *)(v1 - 304));
    OUTLINED_FUNCTION_19_3();
    OUTLINED_FUNCTION_156();
    JUMPOUT(0x2461A5480);
  }
  OUTLINED_FUNCTION_19_3();
  OUTLINED_FUNCTION_156();
  JUMPOUT(0x2461A5260);
}

void sub_2461A53BC()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(void);
  uint64_t v4;
  void (*v5)(uint64_t, _QWORD);

  OUTLINED_FUNCTION_164();
  OUTLINED_FUNCTION_4_8();
  if (v1)
  {
    OUTLINED_FUNCTION_19_3();
    OUTLINED_FUNCTION_159();
    JUMPOUT(0x2461A5260);
  }
  v4 = OUTLINED_FUNCTION_124();
  v5(v4, *(_QWORD *)(v2 - 208));
  OUTLINED_FUNCTION_19_3();
  OUTLINED_FUNCTION_159();
  v3();
  *v0 = *(_QWORD *)(v2 - 336);
  JUMPOUT(0x2461A5264);
}

void sub_2461A5400()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_163();
  v5 = *(_QWORD *)(v4 - 320);
  OUTLINED_FUNCTION_4_8();
  if (v2)
  {
    OUTLINED_FUNCTION_19_3();
    JUMPOUT(0x2461A5258);
  }
  OUTLINED_FUNCTION_91(*(_QWORD *)(v4 - 200));
  OUTLINED_FUNCTION_19_3();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v5);
  *v0 = *(_QWORD *)(v4 - 336);
  JUMPOUT(0x2461A5264);
}

void protocol witness for Hashable._rawHashValue(seed:) in conformance ContactsSnippetPluginModel.CodingKeys()
{
  int v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  char v9;

  v0 = OUTLINED_FUNCTION_136();
  OUTLINED_FUNCTION_105(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9);
  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_13_4();
}

void protocol witness for static CaseIterable.allCases.getter in conformance ContactsLabelCATContainer.LabelType(_QWORD *a1@<X8>)
{
  *a1 = &outlined read-only object #0 of static ContactsLabelCATContainer.LabelType.allCases.getter;
}

void protocol witness for Decodable.init(from:) in conformance ContactsLabelCATContainer.LabelType()
{
  ContactsLabelCATContainer.LabelType.init(from:)();
}

void protocol witness for Encodable.encode(to:) in conformance ContactsLabelCATContainer.LabelType()
{
  ContactsLabelCATContainer.LabelType.encode(to:)();
}

uint64_t ContactsLabelCATContainer.localizedAttributeLabels.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ContactsLabelCATContainer.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x736C6562616CLL && a2 == 0xE600000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x80000002461B3090)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

void ContactsSnippetFlowState.ConfirmCodingKeys.hashValue.getter(char a1)
{
  OUTLINED_FUNCTION_35();
  Hasher._combine(_:)(a1 & 1);
  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_13_4();
}

uint64_t ContactsLabelCATContainer.CodingKeys.stringValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000018;
  else
    return 0x736C6562616CLL;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance ContactsLabelCATContainer.CodingKeys()
{
  char *v0;

  return ContactsLabelCATContainer.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance ContactsLabelCATContainer.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = ContactsLabelCATContainer.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ContactsLabelCATContainer.CodingKeys()
{
  lazy protocol witness table accessor for type ContactsLabelCATContainer.CodingKeys and conformance ContactsLabelCATContainer.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ContactsLabelCATContainer.CodingKeys()
{
  lazy protocol witness table accessor for type ContactsLabelCATContainer.CodingKeys and conformance ContactsLabelCATContainer.CodingKeys();
  return CodingKey.debugDescription.getter();
}

void ContactsLabelCATContainer.encode(to:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_3_7();
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<ContactsLabelCATContainer.CodingKeys>);
  OUTLINED_FUNCTION_27_1();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_19();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  lazy protocol witness table accessor for type ContactsLabelCATContainer.CodingKeys and conformance ContactsLabelCATContainer.CodingKeys();
  OUTLINED_FUNCTION_26_1();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [ContactsLabelCATContainer.LabelType : String]);
  lazy protocol witness table accessor for type [ContactsLabelCATContainer.LabelType : String] and conformance <> [A : B]((uint64_t)&lazy protocol witness table cache variable for type [ContactsLabelCATContainer.LabelType : String] and conformance <> [A : B]);
  OUTLINED_FUNCTION_16_4();
  if (!v0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : String]);
    lazy protocol witness table accessor for type [String : String] and conformance <> [A : B]((uint64_t)&lazy protocol witness table cache variable for type [String : String] and conformance <> [A : B]);
    OUTLINED_FUNCTION_16_4();
  }
  OUTLINED_FUNCTION_37_0();
  OUTLINED_FUNCTION_10_1();
}

void ContactsLabelCATContainer.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  OUTLINED_FUNCTION_3_7();
  v13 = v12;
  v15 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ContactsLabelCATContainer.CodingKeys>);
  OUTLINED_FUNCTION_75();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_29_0();
  __swift_project_boxed_opaque_existential_1(v13, v13[3]);
  lazy protocol witness table accessor for type ContactsLabelCATContainer.CodingKeys and conformance ContactsLabelCATContainer.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v10)
  {
    OUTLINED_FUNCTION_25_0();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [ContactsLabelCATContainer.LabelType : String]);
    lazy protocol witness table accessor for type [ContactsLabelCATContainer.LabelType : String] and conformance <> [A : B]((uint64_t)&lazy protocol witness table cache variable for type [ContactsLabelCATContainer.LabelType : String] and conformance <> [A : B]);
    OUTLINED_FUNCTION_119();
    OUTLINED_FUNCTION_178();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : String]);
    lazy protocol witness table accessor for type [String : String] and conformance <> [A : B]((uint64_t)&lazy protocol witness table cache variable for type [String : String] and conformance <> [A : B]);
    v18 = v17;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_119();
    OUTLINED_FUNCTION_178();
    OUTLINED_FUNCTION_17_4(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8));
    if (v18)
    {
      OUTLINED_FUNCTION_128();
      OUTLINED_FUNCTION_25_0();
    }
    else
    {
      *v15 = a10;
      v15[1] = a10;
      OUTLINED_FUNCTION_25();
      OUTLINED_FUNCTION_25_0();
      OUTLINED_FUNCTION_4_0();
    }
    OUTLINED_FUNCTION_128();
  }
  OUTLINED_FUNCTION_189();
  OUTLINED_FUNCTION_10_1();
}

void CodableContact.CodingKeys.init(rawValue:)(Swift::String string)
{
  void *object;
  Swift::String v2;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of CodableContact.CodingKeys.init(rawValue:), v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_12_1();
}

uint64_t CodableContact.CodingKeys.stringValue.getter()
{
  return 1635017060;
}

void protocol witness for Decodable.init(from:) in conformance ContactsLabelCATContainer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t vars0;
  uint64_t vars8;

  ContactsLabelCATContainer.init(from:)(a1, a2, a3, a4, a5, a6, a7, a8, vars0, vars8);
}

void protocol witness for Encodable.encode(to:) in conformance ContactsLabelCATContainer()
{
  ContactsLabelCATContainer.encode(to:)();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance CodableContact<A>.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x249552EA8](&protocol conformance descriptor for CodableContact<A>.CodingKeys, a3);
  return == infix<A>(_:_:)();
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance CodableContact<A>.CodingKeys(uint64_t a1)
{
  MEMORY[0x249552EA8](&protocol conformance descriptor for CodableContact<A>.CodingKeys, a1);
  return RawRepresentable<>.hashValue.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance CodableContact<A>.CodingKeys()
{
  MEMORY[0x249552EA8](&protocol conformance descriptor for CodableContact<A>.CodingKeys);
  return RawRepresentable<>.hash(into:)();
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance CodableContact<A>.CodingKeys()
{
  MEMORY[0x249552EA8](&protocol conformance descriptor for CodableContact<A>.CodingKeys);
  return RawRepresentable<>._rawHashValue(seed:)();
}

void protocol witness for RawRepresentable.init(rawValue:) in conformance CodableContact<A>.CodingKeys(Swift::String *a1@<X0>, BOOL *a2@<X8>)
{
  char v3;

  CodableContact.CodingKeys.init(rawValue:)(*a1);
  *a2 = v3 != 0;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance CodableContact<A>.CodingKeys@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = CodableContact.CodingKeys.stringValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance CodableContact<A>.CodingKeys@<X0>(BOOL *a1@<X8>)
{
  uint64_t result;

  result = CodableContact.CodingKeys.init(stringValue:)();
  *a1 = result != 0;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance CodableContact<A>.CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CodableContact<A>.CodingKeys(uint64_t a1)
{
  MEMORY[0x249552EA8](&protocol conformance descriptor for CodableContact<A>.CodingKeys, a1);
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance CodableContact<A>.CodingKeys(uint64_t a1)
{
  MEMORY[0x249552EA8](&protocol conformance descriptor for CodableContact<A>.CodingKeys, a1);
  return CodingKey.debugDescription.getter();
}

uint64_t static CodableContact.Error.== infix(_:_:)()
{
  return 1;
}

void CodableContact.Error.hash(into:)()
{
  Hasher._combine(_:)(0);
  OUTLINED_FUNCTION_12_1();
}

void CodableContact.Error.hashValue.getter()
{
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_104();
  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_13_4();
}

void protocol witness for Hashable.hashValue.getter in conformance CodableContact<A>.Error()
{
  CodableContact.Error.hashValue.getter();
}

void protocol witness for Hashable.hash(into:) in conformance CodableContact<A>.Error()
{
  CodableContact.Error.hash(into:)();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance CodableContact<A>.Error()
{
  Hasher.init(_seed:)();
  CodableContact.Error.hash(into:)();
  return Hasher._finalize()();
}

id CodableContact.wrappedValue.getter()
{
  id *v0;

  return *v0;
}

void CodableContact.wrappedValue.setter(void *a1)
{
  id *v1;

  *v1 = a1;
  OUTLINED_FUNCTION_12_1();
}

uint64_t (*CodableContact.wrappedValue.modify())()
{
  return destructiveProjectEnumData for SiriContactsActionType;
}

uint64_t CodableContact.init(wrappedValue:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void CodableContact.init(from:)()
{
  void *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  uint64_t v26;
  _QWORD v27[2];
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30[6];

  OUTLINED_FUNCTION_3_7();
  v2 = v1;
  v28 = v4;
  v29 = v3;
  v7 = type metadata accessor for CodableContact.CodingKeys(255, v3, v5, v6);
  MEMORY[0x249552EA8](&protocol conformance descriptor for CodableContact<A>.CodingKeys, v7);
  v8 = type metadata accessor for KeyedDecodingContainer();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v27 - v10;
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  OUTLINED_FUNCTION_155();
  v12 = v0;
  if (!v0)
  {
    lazy protocol witness table accessor for type Data and conformance Data();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    type metadata accessor for NSKeyedUnarchiver();
    v13 = static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
    v25 = (id)v13;
    if (v13)
    {
      OUTLINED_FUNCTION_47_0((uint64_t)v11, *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8));
      OUTLINED_FUNCTION_84();
      goto LABEL_8;
    }
    v26 = type metadata accessor for CodableContact.Error(0, v29, v14, v15);
    MEMORY[0x249552EA8](&protocol conformance descriptor for CodableContact<A>.Error, v26);
    v12 = (void *)OUTLINED_FUNCTION_30_0();
    swift_willThrow();
    OUTLINED_FUNCTION_84();
    OUTLINED_FUNCTION_47_0((uint64_t)v11, *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8));
  }
  if (one-time initialization token for siriContacts != -1)
    swift_once();
  v16 = type metadata accessor for Logger();
  __swift_project_value_buffer(v16, (uint64_t)static Logger.siriContacts);
  v17 = v12;
  v18 = v12;
  v19 = Logger.logObject.getter();
  v20 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    v22 = swift_slowAlloc();
    v27[1] = 0;
    v30[0] = v22;
    *(_DWORD *)v21 = 136315138;
    swift_getErrorValue();
    v23 = Error.localizedDescription.getter();
    v30[2] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v23, v24, v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    OUTLINED_FUNCTION_4_0();
    OUTLINED_FUNCTION_85();
    OUTLINED_FUNCTION_85();
    _os_log_impl(&dword_24618F000, v19, v20, "Failed to decode, will make an empty CNContact instead. Error: %s", v21, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_85();
  OUTLINED_FUNCTION_85();

  v25 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  OUTLINED_FUNCTION_85();
LABEL_8:
  *v28 = v25;
  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_189();
  OUTLINED_FUNCTION_10_1();
}

void CodableContact.encode(to:)()
{
  uint64_t *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17[3];

  OUTLINED_FUNCTION_3_7();
  v2 = v1;
  v17[2] = *(id *)MEMORY[0x24BDAC8D0];
  v6 = type metadata accessor for CodableContact.CodingKeys(255, *(_QWORD *)(v3 + 16), v4, v5);
  MEMORY[0x249552EA8](&protocol conformance descriptor for CodableContact<A>.CodingKeys, v6);
  v15 = type metadata accessor for KeyedEncodingContainer();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v7 = *v0;
  v8 = (void *)objc_opt_self();
  v17[0] = 0;
  v9 = objc_msgSend(v8, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v7, 1, v17);
  v10 = v17[0];
  if (v9)
  {
    v11 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v13 = v12;

    __swift_project_boxed_opaque_existential_1(v2, v2[3]);
    OUTLINED_FUNCTION_188();
    v17[0] = v11;
    v17[1] = v13;
    lazy protocol witness table accessor for type Data and conformance Data();
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    OUTLINED_FUNCTION_24_1(*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8));
    outlined consume of Data._Representation((uint64_t)v11, (unint64_t)v13);
  }
  else
  {
    v14 = v10;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  OUTLINED_FUNCTION_10_1();
}

void protocol witness for Decodable.init(from:) in conformance CodableContact<A>()
{
  CodableContact.init(from:)();
}

void protocol witness for Encodable.encode(to:) in conformance CodableContact<A>()
{
  CodableContact.encode(to:)();
}

uint64_t type metadata accessor for GetContactSnippetModel(uint64_t a1)
{
  return type metadata accessor for ModifyContactAttributeSnippetModel(a1, (uint64_t *)&type metadata singleton initialization cache for GetContactSnippetModel);
}

uint64_t type metadata accessor for ModifyContactAttributeSnippetModel(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsSnippetPluginModel.CodingKeys and conformance ContactsSnippetPluginModel.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsSnippetPluginModel.CodingKeys and conformance ContactsSnippetPluginModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetPluginModel.CodingKeys and conformance ContactsSnippetPluginModel.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsSnippetPluginModel.CodingKeys, &unk_2517439B0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetPluginModel.CodingKeys and conformance ContactsSnippetPluginModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsSnippetPluginModel.CodingKeys and conformance ContactsSnippetPluginModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetPluginModel.CodingKeys and conformance ContactsSnippetPluginModel.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsSnippetPluginModel.CodingKeys, &unk_2517439B0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetPluginModel.CodingKeys and conformance ContactsSnippetPluginModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsSnippetPluginModel.CodingKeys and conformance ContactsSnippetPluginModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetPluginModel.CodingKeys and conformance ContactsSnippetPluginModel.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsSnippetPluginModel.CodingKeys, &unk_2517439B0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetPluginModel.CodingKeys and conformance ContactsSnippetPluginModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsSnippetPluginModel.CodingKeys and conformance ContactsSnippetPluginModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetPluginModel.CodingKeys and conformance ContactsSnippetPluginModel.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsSnippetPluginModel.CodingKeys, &unk_2517439B0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetPluginModel.CodingKeys and conformance ContactsSnippetPluginModel.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys, &unk_251743B60);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys, &unk_251743B60);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys, &unk_251743B60);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys, &unk_251743B60);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsSnippetPluginModel.GetContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsSnippetPluginModel.GetContactAttributeCodingKeys, &unk_251743AD0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsSnippetPluginModel.GetContactAttributeCodingKeys, &unk_251743AD0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsSnippetPluginModel.GetContactAttributeCodingKeys, &unk_251743AD0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsSnippetPluginModel.GetContactAttributeCodingKeys, &unk_251743AD0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys);
  }
  return result;
}

void lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel and conformance ModifyContactAttributeSnippetModel(uint64_t a1)
{
  void (*v1)(uint64_t);

  if (!OUTLINED_FUNCTION_74(a1))
  {
    v1(255);
    OUTLINED_FUNCTION_150();
  }
  OUTLINED_FUNCTION_12_1();
}

unint64_t lazy protocol witness table accessor for type ContactsSnippetPluginModel.GetContactCodingKeys and conformance ContactsSnippetPluginModel.GetContactCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactCodingKeys and conformance ContactsSnippetPluginModel.GetContactCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactCodingKeys and conformance ContactsSnippetPluginModel.GetContactCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsSnippetPluginModel.GetContactCodingKeys, &unk_251743A40);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactCodingKeys and conformance ContactsSnippetPluginModel.GetContactCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactCodingKeys and conformance ContactsSnippetPluginModel.GetContactCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactCodingKeys and conformance ContactsSnippetPluginModel.GetContactCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsSnippetPluginModel.GetContactCodingKeys, &unk_251743A40);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactCodingKeys and conformance ContactsSnippetPluginModel.GetContactCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactCodingKeys and conformance ContactsSnippetPluginModel.GetContactCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactCodingKeys and conformance ContactsSnippetPluginModel.GetContactCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsSnippetPluginModel.GetContactCodingKeys, &unk_251743A40);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactCodingKeys and conformance ContactsSnippetPluginModel.GetContactCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactCodingKeys and conformance ContactsSnippetPluginModel.GetContactCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactCodingKeys and conformance ContactsSnippetPluginModel.GetContactCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsSnippetPluginModel.GetContactCodingKeys, &unk_251743A40);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetPluginModel.GetContactCodingKeys and conformance ContactsSnippetPluginModel.GetContactCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsSnippetFlowState.CodingKeys and conformance ContactsSnippetFlowState.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsSnippetFlowState.CodingKeys and conformance ContactsSnippetFlowState.CodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetFlowState.CodingKeys and conformance ContactsSnippetFlowState.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsSnippetFlowState.CodingKeys, &unk_251743850);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetFlowState.CodingKeys and conformance ContactsSnippetFlowState.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsSnippetFlowState.CodingKeys and conformance ContactsSnippetFlowState.CodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetFlowState.CodingKeys and conformance ContactsSnippetFlowState.CodingKeys)
  {
    result = MEMORY[0x249552EA8]("u.Y\v\bA", &unk_251743850);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetFlowState.CodingKeys and conformance ContactsSnippetFlowState.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsSnippetFlowState.CodingKeys and conformance ContactsSnippetFlowState.CodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetFlowState.CodingKeys and conformance ContactsSnippetFlowState.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsSnippetFlowState.CodingKeys, &unk_251743850);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetFlowState.CodingKeys and conformance ContactsSnippetFlowState.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsSnippetFlowState.CodingKeys and conformance ContactsSnippetFlowState.CodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetFlowState.CodingKeys and conformance ContactsSnippetFlowState.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsSnippetFlowState.CodingKeys, &unk_251743850);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetFlowState.CodingKeys and conformance ContactsSnippetFlowState.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsSnippetFlowState.UnsupportedCodingKeys and conformance ContactsSnippetFlowState.UnsupportedCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsSnippetFlowState.UnsupportedCodingKeys and conformance ContactsSnippetFlowState.UnsupportedCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetFlowState.UnsupportedCodingKeys and conformance ContactsSnippetFlowState.UnsupportedCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsSnippetFlowState.UnsupportedCodingKeys, &unk_251743920);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetFlowState.UnsupportedCodingKeys and conformance ContactsSnippetFlowState.UnsupportedCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsSnippetFlowState.UnsupportedCodingKeys and conformance ContactsSnippetFlowState.UnsupportedCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetFlowState.UnsupportedCodingKeys and conformance ContactsSnippetFlowState.UnsupportedCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsSnippetFlowState.UnsupportedCodingKeys, &unk_251743920);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetFlowState.UnsupportedCodingKeys and conformance ContactsSnippetFlowState.UnsupportedCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsSnippetFlowState.UnsupportedCodingKeys and conformance ContactsSnippetFlowState.UnsupportedCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetFlowState.UnsupportedCodingKeys and conformance ContactsSnippetFlowState.UnsupportedCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsSnippetFlowState.UnsupportedCodingKeys, &unk_251743920);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetFlowState.UnsupportedCodingKeys and conformance ContactsSnippetFlowState.UnsupportedCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsSnippetFlowState.IntentHandledCodingKeys and conformance ContactsSnippetFlowState.IntentHandledCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsSnippetFlowState.IntentHandledCodingKeys and conformance ContactsSnippetFlowState.IntentHandledCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetFlowState.IntentHandledCodingKeys and conformance ContactsSnippetFlowState.IntentHandledCodingKeys)
  {
    result = MEMORY[0x249552EA8]("%\x1BY\v(-", &unk_251743900);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetFlowState.IntentHandledCodingKeys and conformance ContactsSnippetFlowState.IntentHandledCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsSnippetFlowState.IntentHandledCodingKeys and conformance ContactsSnippetFlowState.IntentHandledCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetFlowState.IntentHandledCodingKeys and conformance ContactsSnippetFlowState.IntentHandledCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsSnippetFlowState.IntentHandledCodingKeys, &unk_251743900);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetFlowState.IntentHandledCodingKeys and conformance ContactsSnippetFlowState.IntentHandledCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsSnippetFlowState.IntentHandledCodingKeys and conformance ContactsSnippetFlowState.IntentHandledCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetFlowState.IntentHandledCodingKeys and conformance ContactsSnippetFlowState.IntentHandledCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsSnippetFlowState.IntentHandledCodingKeys, &unk_251743900);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetFlowState.IntentHandledCodingKeys and conformance ContactsSnippetFlowState.IntentHandledCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsSnippetFlowState.ConfirmCodingKeys and conformance ContactsSnippetFlowState.ConfirmCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsSnippetFlowState.ConfirmCodingKeys and conformance ContactsSnippetFlowState.ConfirmCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetFlowState.ConfirmCodingKeys and conformance ContactsSnippetFlowState.ConfirmCodingKeys)
  {
    result = MEMORY[0x249552EA8]("u\x1BY\vT-", &unk_2517438E0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetFlowState.ConfirmCodingKeys and conformance ContactsSnippetFlowState.ConfirmCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsSnippetFlowState.ConfirmCodingKeys and conformance ContactsSnippetFlowState.ConfirmCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetFlowState.ConfirmCodingKeys and conformance ContactsSnippetFlowState.ConfirmCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsSnippetFlowState.ConfirmCodingKeys, &unk_2517438E0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetFlowState.ConfirmCodingKeys and conformance ContactsSnippetFlowState.ConfirmCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsSnippetFlowState.ConfirmCodingKeys and conformance ContactsSnippetFlowState.ConfirmCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetFlowState.ConfirmCodingKeys and conformance ContactsSnippetFlowState.ConfirmCodingKeys)
  {
    result = MEMORY[0x249552EA8]("u0Y\vtB", &unk_2517438E0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetFlowState.ConfirmCodingKeys and conformance ContactsSnippetFlowState.ConfirmCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsSnippetFlowState.ConfirmCodingKeys and conformance ContactsSnippetFlowState.ConfirmCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsSnippetFlowState.ConfirmCodingKeys and conformance ContactsSnippetFlowState.ConfirmCodingKeys)
  {
    result = MEMORY[0x249552EA8]("]0Y\vLB", &unk_2517438E0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetFlowState.ConfirmCodingKeys and conformance ContactsSnippetFlowState.ConfirmCodingKeys);
  }
  return result;
}

uint64_t outlined copy of ContactsSnippetFlowState(uint64_t result, unint64_t a2, uint64_t a3, unint64_t a4)
{
  if ((a2 & 0xF000000000000000) != 0xB000000000000000 && (a2 & 0xF000000000000000) != 0x7000000000000000)
  {
    outlined copy of Data?(result, a2);
    return outlined copy of Data?(a3, a4);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GetContactSnippetModel.CodingKeys and conformance GetContactSnippetModel.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GetContactSnippetModel.CodingKeys and conformance GetContactSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GetContactSnippetModel.CodingKeys and conformance GetContactSnippetModel.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for GetContactSnippetModel.CodingKeys, &unk_2517437C0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactSnippetModel.CodingKeys and conformance GetContactSnippetModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GetContactSnippetModel.CodingKeys and conformance GetContactSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GetContactSnippetModel.CodingKeys and conformance GetContactSnippetModel.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for GetContactSnippetModel.CodingKeys, &unk_2517437C0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactSnippetModel.CodingKeys and conformance GetContactSnippetModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GetContactSnippetModel.CodingKeys and conformance GetContactSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GetContactSnippetModel.CodingKeys and conformance GetContactSnippetModel.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for GetContactSnippetModel.CodingKeys, &unk_2517437C0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactSnippetModel.CodingKeys and conformance GetContactSnippetModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GetContactSnippetModel.CodingKeys and conformance GetContactSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GetContactSnippetModel.CodingKeys and conformance GetContactSnippetModel.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for GetContactSnippetModel.CodingKeys, &unk_2517437C0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactSnippetModel.CodingKeys and conformance GetContactSnippetModel.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GetContactDirectInvocationsModel and conformance GetContactDirectInvocationsModel()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GetContactDirectInvocationsModel and conformance GetContactDirectInvocationsModel;
  if (!lazy protocol witness table cache variable for type GetContactDirectInvocationsModel and conformance GetContactDirectInvocationsModel)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for GetContactDirectInvocationsModel, &type metadata for GetContactDirectInvocationsModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactDirectInvocationsModel and conformance GetContactDirectInvocationsModel);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GetContactDirectInvocationsModel and conformance GetContactDirectInvocationsModel;
  if (!lazy protocol witness table cache variable for type GetContactDirectInvocationsModel and conformance GetContactDirectInvocationsModel)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for GetContactDirectInvocationsModel, &type metadata for GetContactDirectInvocationsModel);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactDirectInvocationsModel and conformance GetContactDirectInvocationsModel);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsSnippetFlowState and conformance ContactsSnippetFlowState()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsSnippetFlowState and conformance ContactsSnippetFlowState;
  if (!lazy protocol witness table cache variable for type ContactsSnippetFlowState and conformance ContactsSnippetFlowState)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsSnippetFlowState, &type metadata for ContactsSnippetFlowState);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetFlowState and conformance ContactsSnippetFlowState);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsSnippetFlowState and conformance ContactsSnippetFlowState;
  if (!lazy protocol witness table cache variable for type ContactsSnippetFlowState and conformance ContactsSnippetFlowState)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsSnippetFlowState, &type metadata for ContactsSnippetFlowState);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsSnippetFlowState and conformance ContactsSnippetFlowState);
  }
  return result;
}

void lazy protocol witness table accessor for type Loggable<ContactsLabelCATContainer> and conformance <A> Loggable<A>(uint64_t a1)
{
  if (!OUTLINED_FUNCTION_74(a1))
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
    lazy protocol witness table accessor for type ContactsLabelCATContainer and conformance ContactsLabelCATContainer();
    lazy protocol witness table accessor for type ContactsLabelCATContainer and conformance ContactsLabelCATContainer();
    OUTLINED_FUNCTION_131();
  }
  OUTLINED_FUNCTION_64_0();
}

unint64_t lazy protocol witness table accessor for type ContactsLabelCATContainer and conformance ContactsLabelCATContainer()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer and conformance ContactsLabelCATContainer;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer and conformance ContactsLabelCATContainer)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer, &type metadata for ContactsLabelCATContainer);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer and conformance ContactsLabelCATContainer);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer and conformance ContactsLabelCATContainer;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer and conformance ContactsLabelCATContainer)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer, &type metadata for ContactsLabelCATContainer);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer and conformance ContactsLabelCATContainer);
  }
  return result;
}

void lazy protocol witness table accessor for type Loggable<CodableContact<CNContact>> and conformance <A> Loggable<A>(uint64_t a1)
{
  if (!OUTLINED_FUNCTION_74(a1))
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
    lazy protocol witness table accessor for type CodableContact<CNContact> and conformance CodableContact<A>((uint64_t)&lazy protocol witness table cache variable for type CodableContact<CNContact> and conformance CodableContact<A>);
    lazy protocol witness table accessor for type CodableContact<CNContact> and conformance CodableContact<A>((uint64_t)&lazy protocol witness table cache variable for type CodableContact<CNContact> and conformance CodableContact<A>);
    OUTLINED_FUNCTION_131();
  }
  OUTLINED_FUNCTION_109();
}

uint64_t outlined consume of ContactsSnippetFlowState(uint64_t result, unint64_t a2, uint64_t a3, unint64_t a4)
{
  if ((a2 & 0xF000000000000000) != 0xB000000000000000 && (a2 & 0xF000000000000000) != 0x7000000000000000)
  {
    outlined consume of Data?(result, a2);
    return outlined consume of Data?(a3, a4);
  }
  return result;
}

void outlined init with copy of ContactsSnippetPluginModel(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_137(a1, a2, a3);
  OUTLINED_FUNCTION_181(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_12_1();
}

unint64_t lazy protocol witness table accessor for type GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys and conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys and conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys;
  if (!lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys and conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys, &unk_251743730);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys and conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys and conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys;
  if (!lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys and conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys, &unk_251743730);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys and conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys and conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys;
  if (!lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys and conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys, &unk_251743730);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys and conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys and conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys;
  if (!lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys and conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys, &unk_251743730);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys and conformance GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GetContactAttributeSnippetModel.DisplayAttribute.AttributeType and conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.AttributeType and conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType;
  if (!lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.AttributeType and conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for GetContactAttributeSnippetModel.DisplayAttribute.AttributeType, &type metadata for GetContactAttributeSnippetModel.DisplayAttribute.AttributeType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.AttributeType and conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.AttributeType and conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType;
  if (!lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.AttributeType and conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for GetContactAttributeSnippetModel.DisplayAttribute.AttributeType, &type metadata for GetContactAttributeSnippetModel.DisplayAttribute.AttributeType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.AttributeType and conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.AttributeType and conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType;
  if (!lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.AttributeType and conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for GetContactAttributeSnippetModel.DisplayAttribute.AttributeType, &type metadata for GetContactAttributeSnippetModel.DisplayAttribute.AttributeType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.AttributeType and conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.AttributeType and conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType;
  if (!lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.AttributeType and conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for GetContactAttributeSnippetModel.DisplayAttribute.AttributeType, &type metadata for GetContactAttributeSnippetModel.DisplayAttribute.AttributeType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute.AttributeType and conformance GetContactAttributeSnippetModel.DisplayAttribute.AttributeType);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GetContactAttributeSnippetModel.CodingKeys and conformance GetContactAttributeSnippetModel.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.CodingKeys and conformance GetContactAttributeSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.CodingKeys and conformance GetContactAttributeSnippetModel.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for GetContactAttributeSnippetModel.CodingKeys, &unk_2517436A0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.CodingKeys and conformance GetContactAttributeSnippetModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.CodingKeys and conformance GetContactAttributeSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.CodingKeys and conformance GetContactAttributeSnippetModel.CodingKeys)
  {
    result = MEMORY[0x249552EA8]("M,Y\vt>", &unk_2517436A0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.CodingKeys and conformance GetContactAttributeSnippetModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.CodingKeys and conformance GetContactAttributeSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.CodingKeys and conformance GetContactAttributeSnippetModel.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for GetContactAttributeSnippetModel.CodingKeys, &unk_2517436A0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.CodingKeys and conformance GetContactAttributeSnippetModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.CodingKeys and conformance GetContactAttributeSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.CodingKeys and conformance GetContactAttributeSnippetModel.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for GetContactAttributeSnippetModel.CodingKeys, &unk_2517436A0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.CodingKeys and conformance GetContactAttributeSnippetModel.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type GetContactAttributeSnippetModel.DisplayAttribute and conformance GetContactAttributeSnippetModel.DisplayAttribute()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute and conformance GetContactAttributeSnippetModel.DisplayAttribute;
  if (!lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute and conformance GetContactAttributeSnippetModel.DisplayAttribute)
  {
    result = MEMORY[0x249552EA8]("!=Y\v4K", &type metadata for GetContactAttributeSnippetModel.DisplayAttribute);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute and conformance GetContactAttributeSnippetModel.DisplayAttribute);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute and conformance GetContactAttributeSnippetModel.DisplayAttribute;
  if (!lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute and conformance GetContactAttributeSnippetModel.DisplayAttribute)
  {
    result = MEMORY[0x249552EA8]("9=Y\v\\K", &type metadata for GetContactAttributeSnippetModel.DisplayAttribute);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type GetContactAttributeSnippetModel.DisplayAttribute and conformance GetContactAttributeSnippetModel.DisplayAttribute);
  }
  return result;
}

void lazy protocol witness table accessor for type [GetContactAttributeSnippetModel.DisplayAttribute] and conformance <A> [A](uint64_t a1)
{
  unint64_t *v1;
  void (*v2)(void);
  void (*v3)(void);
  uint64_t v4;

  if (!OUTLINED_FUNCTION_74(a1))
  {
    v3 = v2;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [GetContactAttributeSnippetModel.DisplayAttribute]);
    v3();
    v4 = OUTLINED_FUNCTION_156();
    atomic_store(MEMORY[0x249552EA8](v4), v1);
  }
  OUTLINED_FUNCTION_64_0();
}

unint64_t lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys, &unk_2517434F0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys, &unk_2517434F0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys)
  {
    result = MEMORY[0x249552EA8]("m+Y\vp<", &unk_2517434F0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys)
  {
    result = MEMORY[0x249552EA8]("U+Y\vH<", &unk_2517434F0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys, &unk_251743610);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys, &unk_251743610);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys, &unk_251743610);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys, &unk_251743610);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys, &unk_251743580);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys, &unk_251743580);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys)
  {
    result = MEMORY[0x249552EA8]("%,Y\vL=", &unk_251743580);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys)
  {
    result = MEMORY[0x249552EA8]("\r,Y\v$=", &unk_251743580);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.CodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.CodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.CodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ModifyContactAttributeSnippetModel.ModificationType.CodingKeys, &unk_2517433E0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.CodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.CodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.CodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys)
  {
    result = MEMORY[0x249552EA8]("-(Y\v49", &unk_2517433E0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.CodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.CodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.CodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ModifyContactAttributeSnippetModel.ModificationType.CodingKeys, &unk_2517433E0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.CodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.CodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.CodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ModifyContactAttributeSnippetModel.ModificationType.CodingKeys, &unk_2517433E0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.CodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys, &unk_251743460);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys, &unk_251743460);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys, &unk_251743460);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys, &unk_251743440);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys)
  {
    result = MEMORY[0x249552EA8]("e*Y\v ;", &unk_251743440);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys, &unk_251743440);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys, &unk_251743420);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys, &unk_251743420);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys, &unk_251743420);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys, &unk_251743400);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys, &unk_251743400);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys, &unk_251743400);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys);
  }
  return result;
}

uint64_t outlined copy of ModifyContactAttributeSnippetModel.ContactAttributeToModify()
{
  return swift_bridgeObjectRetain();
}

unint64_t lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.CodingKeys and conformance ModifyContactAttributeSnippetModel.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.CodingKeys and conformance ModifyContactAttributeSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.CodingKeys and conformance ModifyContactAttributeSnippetModel.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ModifyContactAttributeSnippetModel.CodingKeys, &unk_251743350);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.CodingKeys and conformance ModifyContactAttributeSnippetModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.CodingKeys and conformance ModifyContactAttributeSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.CodingKeys and conformance ModifyContactAttributeSnippetModel.CodingKeys)
  {
    result = MEMORY[0x249552EA8]("u'Y\vX8", &unk_251743350);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.CodingKeys and conformance ModifyContactAttributeSnippetModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.CodingKeys and conformance ModifyContactAttributeSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.CodingKeys and conformance ModifyContactAttributeSnippetModel.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ModifyContactAttributeSnippetModel.CodingKeys, &unk_251743350);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.CodingKeys and conformance ModifyContactAttributeSnippetModel.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.CodingKeys and conformance ModifyContactAttributeSnippetModel.CodingKeys;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.CodingKeys and conformance ModifyContactAttributeSnippetModel.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ModifyContactAttributeSnippetModel.CodingKeys, &unk_251743350);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.CodingKeys and conformance ModifyContactAttributeSnippetModel.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ContactAttributeToModify and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ModifyContactAttributeSnippetModel.ContactAttributeToModify, &type metadata for ModifyContactAttributeSnippetModel.ContactAttributeToModify);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ModifyContactAttributeSnippetModel.ContactAttributeToModify, &type metadata for ModifyContactAttributeSnippetModel.ContactAttributeToModify);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ContactAttributeToModify and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType and conformance ModifyContactAttributeSnippetModel.ModificationType()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType and conformance ModifyContactAttributeSnippetModel.ModificationType;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType and conformance ModifyContactAttributeSnippetModel.ModificationType)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ModifyContactAttributeSnippetModel.ModificationType, &type metadata for ModifyContactAttributeSnippetModel.ModificationType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType and conformance ModifyContactAttributeSnippetModel.ModificationType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType and conformance ModifyContactAttributeSnippetModel.ModificationType;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType and conformance ModifyContactAttributeSnippetModel.ModificationType)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ModifyContactAttributeSnippetModel.ModificationType, &type metadata for ModifyContactAttributeSnippetModel.ModificationType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType and conformance ModifyContactAttributeSnippetModel.ModificationType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType and conformance ModifyContactAttributeSnippetModel.ModificationType;
  if (!lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType and conformance ModifyContactAttributeSnippetModel.ModificationType)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ModifyContactAttributeSnippetModel.ModificationType, &type metadata for ModifyContactAttributeSnippetModel.ModificationType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel.ModificationType and conformance ModifyContactAttributeSnippetModel.ModificationType);
  }
  return result;
}

uint64_t outlined consume of ModifyContactAttributeSnippetModel.ContactAttributeToModify()
{
  return swift_bridgeObjectRelease();
}

unint64_t lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.CodingKeys and conformance ContactsLabelCATContainer.LabelType.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CodingKeys and conformance ContactsLabelCATContainer.LabelType.CodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CodingKeys and conformance ContactsLabelCATContainer.LabelType.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer.LabelType.CodingKeys, &unk_2517431A0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CodingKeys and conformance ContactsLabelCATContainer.LabelType.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CodingKeys and conformance ContactsLabelCATContainer.LabelType.CodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CodingKeys and conformance ContactsLabelCATContainer.LabelType.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer.LabelType.CodingKeys, &unk_2517431A0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CodingKeys and conformance ContactsLabelCATContainer.LabelType.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CodingKeys and conformance ContactsLabelCATContainer.LabelType.CodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CodingKeys and conformance ContactsLabelCATContainer.LabelType.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer.LabelType.CodingKeys, &unk_2517431A0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CodingKeys and conformance ContactsLabelCATContainer.LabelType.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CodingKeys and conformance ContactsLabelCATContainer.LabelType.CodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CodingKeys and conformance ContactsLabelCATContainer.LabelType.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer.LabelType.CodingKeys, &unk_2517431A0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CodingKeys and conformance ContactsLabelCATContainer.LabelType.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.VideoCodingKeys and conformance ContactsLabelCATContainer.LabelType.VideoCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.VideoCodingKeys and conformance ContactsLabelCATContainer.LabelType.VideoCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.VideoCodingKeys and conformance ContactsLabelCATContainer.LabelType.VideoCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer.LabelType.VideoCodingKeys, &unk_2517432C0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.VideoCodingKeys and conformance ContactsLabelCATContainer.LabelType.VideoCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.VideoCodingKeys and conformance ContactsLabelCATContainer.LabelType.VideoCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.VideoCodingKeys and conformance ContactsLabelCATContainer.LabelType.VideoCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer.LabelType.VideoCodingKeys, &unk_2517432C0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.VideoCodingKeys and conformance ContactsLabelCATContainer.LabelType.VideoCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.VideoCodingKeys and conformance ContactsLabelCATContainer.LabelType.VideoCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.VideoCodingKeys and conformance ContactsLabelCATContainer.LabelType.VideoCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer.LabelType.VideoCodingKeys, &unk_2517432C0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.VideoCodingKeys and conformance ContactsLabelCATContainer.LabelType.VideoCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.SavedCodingKeys and conformance ContactsLabelCATContainer.LabelType.SavedCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.SavedCodingKeys and conformance ContactsLabelCATContainer.LabelType.SavedCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.SavedCodingKeys and conformance ContactsLabelCATContainer.LabelType.SavedCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer.LabelType.SavedCodingKeys, &unk_2517432A0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.SavedCodingKeys and conformance ContactsLabelCATContainer.LabelType.SavedCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.SavedCodingKeys and conformance ContactsLabelCATContainer.LabelType.SavedCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.SavedCodingKeys and conformance ContactsLabelCATContainer.LabelType.SavedCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer.LabelType.SavedCodingKeys, &unk_2517432A0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.SavedCodingKeys and conformance ContactsLabelCATContainer.LabelType.SavedCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.SavedCodingKeys and conformance ContactsLabelCATContainer.LabelType.SavedCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.SavedCodingKeys and conformance ContactsLabelCATContainer.LabelType.SavedCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer.LabelType.SavedCodingKeys, &unk_2517432A0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.SavedCodingKeys and conformance ContactsLabelCATContainer.LabelType.SavedCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.SaveCodingKeys and conformance ContactsLabelCATContainer.LabelType.SaveCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.SaveCodingKeys and conformance ContactsLabelCATContainer.LabelType.SaveCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.SaveCodingKeys and conformance ContactsLabelCATContainer.LabelType.SaveCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer.LabelType.SaveCodingKeys, &unk_251743280);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.SaveCodingKeys and conformance ContactsLabelCATContainer.LabelType.SaveCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.SaveCodingKeys and conformance ContactsLabelCATContainer.LabelType.SaveCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.SaveCodingKeys and conformance ContactsLabelCATContainer.LabelType.SaveCodingKeys)
  {
    result = MEMORY[0x249552EA8]("e'Y\v$7", &unk_251743280);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.SaveCodingKeys and conformance ContactsLabelCATContainer.LabelType.SaveCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.SaveCodingKeys and conformance ContactsLabelCATContainer.LabelType.SaveCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.SaveCodingKeys and conformance ContactsLabelCATContainer.LabelType.SaveCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer.LabelType.SaveCodingKeys, &unk_251743280);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.SaveCodingKeys and conformance ContactsLabelCATContainer.LabelType.SaveCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.MessageCodingKeys and conformance ContactsLabelCATContainer.LabelType.MessageCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.MessageCodingKeys and conformance ContactsLabelCATContainer.LabelType.MessageCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.MessageCodingKeys and conformance ContactsLabelCATContainer.LabelType.MessageCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer.LabelType.MessageCodingKeys, &unk_251743260);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.MessageCodingKeys and conformance ContactsLabelCATContainer.LabelType.MessageCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.MessageCodingKeys and conformance ContactsLabelCATContainer.LabelType.MessageCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.MessageCodingKeys and conformance ContactsLabelCATContainer.LabelType.MessageCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer.LabelType.MessageCodingKeys, &unk_251743260);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.MessageCodingKeys and conformance ContactsLabelCATContainer.LabelType.MessageCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.MessageCodingKeys and conformance ContactsLabelCATContainer.LabelType.MessageCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.MessageCodingKeys and conformance ContactsLabelCATContainer.LabelType.MessageCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer.LabelType.MessageCodingKeys, &unk_251743260);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.MessageCodingKeys and conformance ContactsLabelCATContainer.LabelType.MessageCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.MailCodingKeys and conformance ContactsLabelCATContainer.LabelType.MailCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.MailCodingKeys and conformance ContactsLabelCATContainer.LabelType.MailCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.MailCodingKeys and conformance ContactsLabelCATContainer.LabelType.MailCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer.LabelType.MailCodingKeys, &unk_251743240);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.MailCodingKeys and conformance ContactsLabelCATContainer.LabelType.MailCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.MailCodingKeys and conformance ContactsLabelCATContainer.LabelType.MailCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.MailCodingKeys and conformance ContactsLabelCATContainer.LabelType.MailCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer.LabelType.MailCodingKeys, &unk_251743240);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.MailCodingKeys and conformance ContactsLabelCATContainer.LabelType.MailCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.MailCodingKeys and conformance ContactsLabelCATContainer.LabelType.MailCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.MailCodingKeys and conformance ContactsLabelCATContainer.LabelType.MailCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer.LabelType.MailCodingKeys, &unk_251743240);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.MailCodingKeys and conformance ContactsLabelCATContainer.LabelType.MailCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.GoCodingKeys and conformance ContactsLabelCATContainer.LabelType.GoCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.GoCodingKeys and conformance ContactsLabelCATContainer.LabelType.GoCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.GoCodingKeys and conformance ContactsLabelCATContainer.LabelType.GoCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer.LabelType.GoCodingKeys, &unk_251743220);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.GoCodingKeys and conformance ContactsLabelCATContainer.LabelType.GoCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.GoCodingKeys and conformance ContactsLabelCATContainer.LabelType.GoCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.GoCodingKeys and conformance ContactsLabelCATContainer.LabelType.GoCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer.LabelType.GoCodingKeys, &unk_251743220);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.GoCodingKeys and conformance ContactsLabelCATContainer.LabelType.GoCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.GoCodingKeys and conformance ContactsLabelCATContainer.LabelType.GoCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.GoCodingKeys and conformance ContactsLabelCATContainer.LabelType.GoCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer.LabelType.GoCodingKeys, &unk_251743220);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.GoCodingKeys and conformance ContactsLabelCATContainer.LabelType.GoCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.CancelCodingKeys and conformance ContactsLabelCATContainer.LabelType.CancelCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CancelCodingKeys and conformance ContactsLabelCATContainer.LabelType.CancelCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CancelCodingKeys and conformance ContactsLabelCATContainer.LabelType.CancelCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer.LabelType.CancelCodingKeys, &unk_251743200);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CancelCodingKeys and conformance ContactsLabelCATContainer.LabelType.CancelCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CancelCodingKeys and conformance ContactsLabelCATContainer.LabelType.CancelCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CancelCodingKeys and conformance ContactsLabelCATContainer.LabelType.CancelCodingKeys)
  {
    result = MEMORY[0x249552EA8]("%&Y\vT5", &unk_251743200);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CancelCodingKeys and conformance ContactsLabelCATContainer.LabelType.CancelCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CancelCodingKeys and conformance ContactsLabelCATContainer.LabelType.CancelCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CancelCodingKeys and conformance ContactsLabelCATContainer.LabelType.CancelCodingKeys)
  {
    result = MEMORY[0x249552EA8]("\r&Y\v,5", &unk_251743200);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CancelCodingKeys and conformance ContactsLabelCATContainer.LabelType.CancelCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.CallCodingKeys and conformance ContactsLabelCATContainer.LabelType.CallCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CallCodingKeys and conformance ContactsLabelCATContainer.LabelType.CallCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CallCodingKeys and conformance ContactsLabelCATContainer.LabelType.CallCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer.LabelType.CallCodingKeys, &unk_2517431E0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CallCodingKeys and conformance ContactsLabelCATContainer.LabelType.CallCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CallCodingKeys and conformance ContactsLabelCATContainer.LabelType.CallCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CallCodingKeys and conformance ContactsLabelCATContainer.LabelType.CallCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer.LabelType.CallCodingKeys, &unk_2517431E0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CallCodingKeys and conformance ContactsLabelCATContainer.LabelType.CallCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CallCodingKeys and conformance ContactsLabelCATContainer.LabelType.CallCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CallCodingKeys and conformance ContactsLabelCATContainer.LabelType.CallCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer.LabelType.CallCodingKeys, &unk_2517431E0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.CallCodingKeys and conformance ContactsLabelCATContainer.LabelType.CallCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys and conformance ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys and conformance ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys and conformance ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys, &unk_2517431C0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys and conformance ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys and conformance ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys and conformance ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys, &unk_2517431C0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys and conformance ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys and conformance ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys and conformance ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys)
  {
    result = MEMORY[0x249552EA8]("m%Y\vD4", &unk_2517431C0);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys and conformance ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys);
  }
  return result;
}

uint64_t specialized ArraySlice.subscript.getter(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (result < a5)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((uint64_t)(a6 >> 1) < result || (uint64_t)(a6 >> 1) < a2)
    goto LABEL_10;
  if (a2 < a5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((a2 & 0x8000000000000000) == 0)
    return swift_unknownObjectRetain();
LABEL_12:
  __break(1u);
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsLabelCATContainer.CodingKeys and conformance ContactsLabelCATContainer.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.CodingKeys and conformance ContactsLabelCATContainer.CodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.CodingKeys and conformance ContactsLabelCATContainer.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer.CodingKeys, &unk_251743110);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.CodingKeys and conformance ContactsLabelCATContainer.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.CodingKeys and conformance ContactsLabelCATContainer.CodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.CodingKeys and conformance ContactsLabelCATContainer.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer.CodingKeys, &unk_251743110);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.CodingKeys and conformance ContactsLabelCATContainer.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.CodingKeys and conformance ContactsLabelCATContainer.CodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.CodingKeys and conformance ContactsLabelCATContainer.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer.CodingKeys, &unk_251743110);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.CodingKeys and conformance ContactsLabelCATContainer.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.CodingKeys and conformance ContactsLabelCATContainer.CodingKeys;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.CodingKeys and conformance ContactsLabelCATContainer.CodingKeys)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer.CodingKeys, &unk_251743110);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.CodingKeys and conformance ContactsLabelCATContainer.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType and conformance ContactsLabelCATContainer.LabelType()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType and conformance ContactsLabelCATContainer.LabelType;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType and conformance ContactsLabelCATContainer.LabelType)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer.LabelType, &type metadata for ContactsLabelCATContainer.LabelType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType and conformance ContactsLabelCATContainer.LabelType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType and conformance ContactsLabelCATContainer.LabelType;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType and conformance ContactsLabelCATContainer.LabelType)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer.LabelType, &type metadata for ContactsLabelCATContainer.LabelType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType and conformance ContactsLabelCATContainer.LabelType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType and conformance ContactsLabelCATContainer.LabelType;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType and conformance ContactsLabelCATContainer.LabelType)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer.LabelType, &type metadata for ContactsLabelCATContainer.LabelType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType and conformance ContactsLabelCATContainer.LabelType);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType and conformance ContactsLabelCATContainer.LabelType;
  if (!lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType and conformance ContactsLabelCATContainer.LabelType)
  {
    result = MEMORY[0x249552EA8](&protocol conformance descriptor for ContactsLabelCATContainer.LabelType, &type metadata for ContactsLabelCATContainer.LabelType);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ContactsLabelCATContainer.LabelType and conformance ContactsLabelCATContainer.LabelType);
  }
  return result;
}

uint64_t type metadata accessor for CodableContact.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CodableContact.CodingKeys);
}

unint64_t type metadata accessor for NSKeyedUnarchiver()
{
  unint64_t result;

  result = lazy cache variable for type metadata for NSKeyedUnarchiver;
  if (!lazy cache variable for type metadata for NSKeyedUnarchiver)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSKeyedUnarchiver);
  }
  return result;
}

uint64_t type metadata accessor for CodableContact.Error(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CodableContact.Error);
}

void base witness table accessor for Decodable in ContactsSnippetPluginModel()
{
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel and conformance ModifyContactAttributeSnippetModel((uint64_t)&lazy protocol witness table cache variable for type ContactsSnippetPluginModel and conformance ContactsSnippetPluginModel);
}

void base witness table accessor for Encodable in ContactsSnippetPluginModel()
{
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel and conformance ModifyContactAttributeSnippetModel((uint64_t)&lazy protocol witness table cache variable for type ContactsSnippetPluginModel and conformance ContactsSnippetPluginModel);
}

void associated type witness table accessor for CaseIterable.AllCases : Collection in ContactsSnippetFlowState()
{
  lazy protocol witness table accessor for type CodableContact<CNContact> and conformance CodableContact<A>((uint64_t)&lazy protocol witness table cache variable for type [ContactsSnippetFlowState] and conformance [A]);
}

void base witness table accessor for Decodable in GetContactSnippetModel()
{
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel and conformance ModifyContactAttributeSnippetModel((uint64_t)&lazy protocol witness table cache variable for type GetContactSnippetModel and conformance GetContactSnippetModel);
}

void base witness table accessor for Encodable in GetContactSnippetModel()
{
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel and conformance ModifyContactAttributeSnippetModel((uint64_t)&lazy protocol witness table cache variable for type GetContactSnippetModel and conformance GetContactSnippetModel);
}

void associated type witness table accessor for CaseIterable.AllCases : Collection in GetContactAttributeSnippetModel.DisplayAttribute.AttributeType()
{
  lazy protocol witness table accessor for type CodableContact<CNContact> and conformance CodableContact<A>((uint64_t)&lazy protocol witness table cache variable for type [GetContactAttributeSnippetModel.DisplayAttribute.AttributeType] and conformance [A]);
}

void base witness table accessor for Decodable in GetContactAttributeSnippetModel()
{
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel and conformance ModifyContactAttributeSnippetModel((uint64_t)&lazy protocol witness table cache variable for type GetContactAttributeSnippetModel and conformance GetContactAttributeSnippetModel);
}

void base witness table accessor for Encodable in GetContactAttributeSnippetModel()
{
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel and conformance ModifyContactAttributeSnippetModel((uint64_t)&lazy protocol witness table cache variable for type GetContactAttributeSnippetModel and conformance GetContactAttributeSnippetModel);
}

void base witness table accessor for Decodable in ModifyContactAttributeSnippetModel()
{
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel and conformance ModifyContactAttributeSnippetModel((uint64_t)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel and conformance ModifyContactAttributeSnippetModel);
}

void base witness table accessor for Encodable in ModifyContactAttributeSnippetModel()
{
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel and conformance ModifyContactAttributeSnippetModel((uint64_t)&lazy protocol witness table cache variable for type ModifyContactAttributeSnippetModel and conformance ModifyContactAttributeSnippetModel);
}

void associated type witness table accessor for CaseIterable.AllCases : Collection in ContactsLabelCATContainer.LabelType()
{
  lazy protocol witness table accessor for type CodableContact<CNContact> and conformance CodableContact<A>((uint64_t)&lazy protocol witness table cache variable for type [ContactsLabelCATContainer.LabelType] and conformance [A]);
}

void lazy protocol witness table accessor for type CodableContact<CNContact> and conformance CodableContact<A>(uint64_t a1)
{
  uint64_t *v1;

  if (!OUTLINED_FUNCTION_74(a1))
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v1);
    OUTLINED_FUNCTION_150();
  }
  OUTLINED_FUNCTION_12_1();
}

void base witness table accessor for Equatable in CodableContact<A>.Error()
{
  JUMPOUT(0x249552EA8);
}

uint64_t sub_2461A742C(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for GetContactSnippetModel.labelCATs : GetContactSnippetModel(a1, a2, a3, a4, (uint64_t (*)(_QWORD *))GetContactSnippetModel.labelCATs.setter);
}

uint64_t sub_2461A745C(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for GetContactSnippetModel.labelCATs : GetContactSnippetModel(a1, a2, a3, a4, (uint64_t (*)(_QWORD *))ModifyContactAttributeSnippetModel.labelCATs.setter);
}

uint64_t initializeBufferWithCopyOfBuffer for ContactsSnippetPluginModel(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  int EnumCaseMultiPayload;
  int *ContactAttributeSnippetModel;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  int *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  unint64_t v28;
  __int128 v30;
  uint64_t v31;
  int *ContactSnippetModel;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  unint64_t v42;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  unint64_t v50;
  __int128 v52;
  uint64_t v53;
  uint64_t *v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t *v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t *v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD *v79;
  _QWORD *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v16 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v17 = *a2;
      v18 = a2[1];
      v19 = *((_BYTE *)a2 + 16);
      outlined copy of ModifyContactAttributeSnippetModel.ContactAttributeToModify();
      *(_QWORD *)a1 = v17;
      *(_QWORD *)(a1 + 8) = v18;
      *(_BYTE *)(a1 + 16) = v19;
      *(_BYTE *)(a1 + 17) = *((_BYTE *)a2 + 17);
      v20 = (int *)type metadata accessor for ModifyContactAttributeSnippetModel(0);
      v21 = v20[6];
      v22 = a1 + v21;
      v23 = (uint64_t)a2 + v21;
      v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v22, v23, v24);
      v25 = v20[7];
      v26 = a1 + v25;
      v27 = (uint64_t *)((char *)a2 + v25);
      v28 = *(uint64_t *)((char *)a2 + v25 + 8);
      if ((v28 & 0xF000000000000000) == 0xB000000000000000 || (v28 & 0xF000000000000000) == 0x7000000000000000)
      {
        v30 = *((_OWORD *)v27 + 1);
        *(_OWORD *)v26 = *(_OWORD *)v27;
        *(_OWORD *)(v26 + 16) = v30;
      }
      else
      {
        if (v28 >> 60 == 15)
        {
          *(_OWORD *)v26 = *(_OWORD *)v27;
        }
        else
        {
          v53 = *v27;
          outlined copy of Data._Representation(*v27, v28);
          *(_QWORD *)v26 = v53;
          *(_QWORD *)(v26 + 8) = v28;
        }
        v54 = v27 + 2;
        v55 = v27[3];
        if (v55 >> 60 == 15)
        {
          *(_OWORD *)(v26 + 16) = *(_OWORD *)v54;
        }
        else
        {
          v62 = *v54;
          outlined copy of Data._Representation(*v54, v27[3]);
          *(_QWORD *)(v26 + 16) = v62;
          *(_QWORD *)(v26 + 24) = v55;
        }
      }
      v63 = v20[8];
      v64 = a1 + v63;
      v65 = (uint64_t)a2 + v63;
      v66 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v66 - 8) + 16))(v64, v65, v66);
      v67 = v20[9];
      v68 = a1 + v67;
      v69 = (uint64_t *)((char *)a2 + v67);
      v70 = v69[1];
      if (v70 >> 60 == 15)
      {
        *(_OWORD *)v68 = *(_OWORD *)v69;
      }
      else
      {
        v71 = *v69;
        outlined copy of Data._Representation(*v69, v69[1]);
        *(_QWORD *)v68 = v71;
        *(_QWORD *)(v68 + 8) = v70;
      }
      v72 = v20[10];
      v73 = a1 + v72;
      v74 = (uint64_t *)((char *)a2 + v72);
      v75 = v74[1];
      if (v75 >> 60 == 15)
      {
        *(_OWORD *)v73 = *(_OWORD *)v74;
      }
      else
      {
        v76 = *v74;
        outlined copy of Data._Representation(*v74, v74[1]);
        *(_QWORD *)v73 = v76;
        *(_QWORD *)(v73 + 8) = v75;
      }
    }
    else if (EnumCaseMultiPayload == 1)
    {
      *(_QWORD *)a1 = *a2;
      ContactAttributeSnippetModel = (int *)type metadata accessor for GetContactAttributeSnippetModel(0);
      v8 = ContactAttributeSnippetModel[5];
      v9 = a1 + v8;
      v10 = (uint64_t)a2 + v8;
      swift_bridgeObjectRetain();
      v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
      v12 = ContactAttributeSnippetModel[6];
      v13 = a1 + v12;
      v14 = (uint64_t *)((char *)a2 + v12);
      v15 = *(uint64_t *)((char *)a2 + v12 + 8);
      if (v15 >> 60 == 15)
      {
        *(_OWORD *)v13 = *(_OWORD *)v14;
      }
      else
      {
        v37 = *v14;
        outlined copy of Data._Representation(*v14, v15);
        *(_QWORD *)v13 = v37;
        *(_QWORD *)(v13 + 8) = v15;
      }
      v38 = v14[3];
      *(_QWORD *)(v13 + 16) = v14[2];
      *(_QWORD *)(v13 + 24) = v38;
      *(_QWORD *)(v13 + 32) = v14[4];
      v39 = ContactAttributeSnippetModel[7];
      v40 = a1 + v39;
      v41 = (uint64_t *)((char *)a2 + v39);
      v42 = *(uint64_t *)((char *)a2 + v39 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if ((v42 & 0xF000000000000000) == 0xB000000000000000 || (v42 & 0xF000000000000000) == 0x7000000000000000)
      {
        v44 = *((_OWORD *)v41 + 1);
        *(_OWORD *)v40 = *(_OWORD *)v41;
        *(_OWORD *)(v40 + 16) = v44;
      }
      else
      {
        if (v42 >> 60 == 15)
        {
          *(_OWORD *)v40 = *(_OWORD *)v41;
        }
        else
        {
          v56 = *v41;
          outlined copy of Data._Representation(*v41, v42);
          *(_QWORD *)v40 = v56;
          *(_QWORD *)(v40 + 8) = v42;
        }
        v57 = v41 + 2;
        v58 = v41[3];
        if (v58 >> 60 == 15)
        {
          *(_OWORD *)(v40 + 16) = *(_OWORD *)v57;
        }
        else
        {
          v77 = *v57;
          outlined copy of Data._Representation(*v57, v41[3]);
          *(_QWORD *)(v40 + 16) = v77;
          *(_QWORD *)(v40 + 24) = v58;
        }
      }
      v78 = ContactAttributeSnippetModel[8];
      v79 = (_QWORD *)(a1 + v78);
      v80 = (uint64_t *)((char *)a2 + v78);
      v81 = v80[1];
      *v79 = *v80;
      v79[1] = v81;
      *(_BYTE *)(a1 + ContactAttributeSnippetModel[9]) = *((_BYTE *)a2 + ContactAttributeSnippetModel[9]);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      v31 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
      (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v31 - 8) + 16))(a1, a2, v31);
      ContactSnippetModel = (int *)type metadata accessor for GetContactSnippetModel(0);
      v33 = ContactSnippetModel[5];
      v34 = a1 + v33;
      v35 = (uint64_t *)((char *)a2 + v33);
      v36 = *(uint64_t *)((char *)a2 + v33 + 8);
      if (v36 >> 60 == 15)
      {
        *(_OWORD *)v34 = *(_OWORD *)v35;
      }
      else
      {
        v45 = *v35;
        outlined copy of Data._Representation(*v35, v36);
        *(_QWORD *)v34 = v45;
        *(_QWORD *)(v34 + 8) = v36;
      }
      v46 = v35[3];
      *(_QWORD *)(v34 + 16) = v35[2];
      *(_QWORD *)(v34 + 24) = v46;
      *(_QWORD *)(v34 + 32) = v35[4];
      v47 = ContactSnippetModel[6];
      v48 = a1 + v47;
      v49 = (uint64_t *)((char *)a2 + v47);
      v50 = *(uint64_t *)((char *)a2 + v47 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if ((v50 & 0xF000000000000000) == 0xB000000000000000 || (v50 & 0xF000000000000000) == 0x7000000000000000)
      {
        v52 = *((_OWORD *)v49 + 1);
        *(_OWORD *)v48 = *(_OWORD *)v49;
        *(_OWORD *)(v48 + 16) = v52;
      }
      else
      {
        if (v50 >> 60 == 15)
        {
          *(_OWORD *)v48 = *(_OWORD *)v49;
        }
        else
        {
          v59 = *v49;
          outlined copy of Data._Representation(*v49, v50);
          *(_QWORD *)v48 = v59;
          *(_QWORD *)(v48 + 8) = v50;
        }
        v60 = v49 + 2;
        v61 = v49[3];
        if (v61 >> 60 == 15)
        {
          *(_OWORD *)(v48 + 16) = *(_OWORD *)v60;
        }
        else
        {
          v82 = *v60;
          outlined copy of Data._Representation(*v60, v49[3]);
          *(_QWORD *)(v48 + 16) = v82;
          *(_QWORD *)(v48 + 24) = v61;
        }
      }
      v83 = ContactSnippetModel[7];
      v84 = a1 + v83;
      v85 = (uint64_t)a2 + v83;
      v86 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v86 - 8) + 16))(v84, v85, v86);
      *(_BYTE *)(a1 + ContactSnippetModel[8]) = *((_BYTE *)a2 + ContactSnippetModel[8]);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for ContactsSnippetPluginModel(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  int *ContactSnippetModel;
  uint64_t *v5;
  unint64_t v6;
  uint64_t *v7;
  unint64_t v8;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  unint64_t v17;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  unint64_t v23;
  uint64_t *v24;
  unint64_t v25;
  int *ContactAttributeSnippetModel;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  unint64_t v30;
  uint64_t *v31;
  unint64_t v32;
  unint64_t v34;

  result = swift_getEnumCaseMultiPayload();
  switch((_DWORD)result)
  {
    case 2:
      outlined consume of ModifyContactAttributeSnippetModel.ContactAttributeToModify();
      v13 = (int *)type metadata accessor for ModifyContactAttributeSnippetModel(0);
      v14 = a1 + v13[6];
      v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14, v15);
      v16 = (uint64_t *)(a1 + v13[7]);
      v17 = v16[1];
      if ((v17 & 0xF000000000000000) != 0xB000000000000000 && (v17 & 0xF000000000000000) != 0x7000000000000000)
      {
        if (v17 >> 60 != 15)
          outlined consume of Data._Representation(*v16, v17);
        v19 = v16[3];
        if (v19 >> 60 != 15)
          outlined consume of Data._Representation(v16[2], v19);
      }
      v20 = a1 + v13[8];
      v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 8))(v20, v21);
      v22 = (uint64_t *)(a1 + v13[9]);
      v23 = v22[1];
      if (v23 >> 60 != 15)
        result = outlined consume of Data._Representation(*v22, v23);
      v24 = (uint64_t *)(a1 + v13[10]);
      v25 = v24[1];
      if (v25 >> 60 != 15)
        return outlined consume of Data._Representation(*v24, v25);
      break;
    case 1:
      swift_bridgeObjectRelease();
      ContactAttributeSnippetModel = (int *)type metadata accessor for GetContactAttributeSnippetModel(0);
      v27 = a1 + ContactAttributeSnippetModel[5];
      v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 8))(v27, v28);
      v29 = (uint64_t *)(a1 + ContactAttributeSnippetModel[6]);
      v30 = v29[1];
      if (v30 >> 60 != 15)
        outlined consume of Data._Representation(*v29, v30);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v31 = (uint64_t *)(a1 + ContactAttributeSnippetModel[7]);
      v32 = v31[1];
      if ((v32 & 0xF000000000000000) != 0xB000000000000000 && (v32 & 0xF000000000000000) != 0x7000000000000000)
      {
        if (v32 >> 60 != 15)
          outlined consume of Data._Representation(*v31, v32);
        v34 = v31[3];
        if (v34 >> 60 != 15)
          outlined consume of Data._Representation(v31[2], v34);
      }
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    case 0:
      v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
      ContactSnippetModel = (int *)type metadata accessor for GetContactSnippetModel(0);
      v5 = (uint64_t *)(a1 + ContactSnippetModel[5]);
      v6 = v5[1];
      if (v6 >> 60 != 15)
        outlined consume of Data._Representation(*v5, v6);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v7 = (uint64_t *)(a1 + ContactSnippetModel[6]);
      v8 = v7[1];
      if ((v8 & 0xF000000000000000) != 0xB000000000000000 && (v8 & 0xF000000000000000) != 0x7000000000000000)
      {
        if (v8 >> 60 != 15)
          outlined consume of Data._Representation(*v7, v8);
        v10 = v7[3];
        if (v10 >> 60 != 15)
          outlined consume of Data._Representation(v7[2], v10);
      }
      v11 = a1 + ContactSnippetModel[7];
      v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  }
  return result;
}

uint64_t initializeWithCopy for ContactsSnippetPluginModel(uint64_t a1, uint64_t *a2)
{
  int EnumCaseMultiPayload;
  int *ContactAttributeSnippetModel;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  unint64_t v25;
  __int128 v27;
  uint64_t v28;
  int *ContactSnippetModel;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  unint64_t v39;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  unint64_t v47;
  __int128 v49;
  uint64_t v50;
  uint64_t *v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD *v76;
  _QWORD *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    v14 = *a2;
    v15 = a2[1];
    v16 = *((_BYTE *)a2 + 16);
    outlined copy of ModifyContactAttributeSnippetModel.ContactAttributeToModify();
    *(_QWORD *)a1 = v14;
    *(_QWORD *)(a1 + 8) = v15;
    *(_BYTE *)(a1 + 16) = v16;
    *(_BYTE *)(a1 + 17) = *((_BYTE *)a2 + 17);
    v17 = (int *)type metadata accessor for ModifyContactAttributeSnippetModel(0);
    v18 = v17[6];
    v19 = a1 + v18;
    v20 = (uint64_t)a2 + v18;
    v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v19, v20, v21);
    v22 = v17[7];
    v23 = a1 + v22;
    v24 = (uint64_t *)((char *)a2 + v22);
    v25 = *(uint64_t *)((char *)a2 + v22 + 8);
    if ((v25 & 0xF000000000000000) == 0xB000000000000000 || (v25 & 0xF000000000000000) == 0x7000000000000000)
    {
      v27 = *((_OWORD *)v24 + 1);
      *(_OWORD *)v23 = *(_OWORD *)v24;
      *(_OWORD *)(v23 + 16) = v27;
    }
    else
    {
      if (v25 >> 60 == 15)
      {
        *(_OWORD *)v23 = *(_OWORD *)v24;
      }
      else
      {
        v50 = *v24;
        outlined copy of Data._Representation(*v24, v25);
        *(_QWORD *)v23 = v50;
        *(_QWORD *)(v23 + 8) = v25;
      }
      v51 = v24 + 2;
      v52 = v24[3];
      if (v52 >> 60 == 15)
      {
        *(_OWORD *)(v23 + 16) = *(_OWORD *)v51;
      }
      else
      {
        v59 = *v51;
        outlined copy of Data._Representation(*v51, v24[3]);
        *(_QWORD *)(v23 + 16) = v59;
        *(_QWORD *)(v23 + 24) = v52;
      }
    }
    v60 = v17[8];
    v61 = a1 + v60;
    v62 = (uint64_t)a2 + v60;
    v63 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v63 - 8) + 16))(v61, v62, v63);
    v64 = v17[9];
    v65 = a1 + v64;
    v66 = (uint64_t *)((char *)a2 + v64);
    v67 = v66[1];
    if (v67 >> 60 == 15)
    {
      *(_OWORD *)v65 = *(_OWORD *)v66;
    }
    else
    {
      v68 = *v66;
      outlined copy of Data._Representation(*v66, v66[1]);
      *(_QWORD *)v65 = v68;
      *(_QWORD *)(v65 + 8) = v67;
    }
    v69 = v17[10];
    v70 = a1 + v69;
    v71 = (uint64_t *)((char *)a2 + v69);
    v72 = v71[1];
    if (v72 >> 60 == 15)
    {
      *(_OWORD *)v70 = *(_OWORD *)v71;
    }
    else
    {
      v73 = *v71;
      outlined copy of Data._Representation(*v71, v71[1]);
      *(_QWORD *)v70 = v73;
      *(_QWORD *)(v70 + 8) = v72;
    }
  }
  else if (EnumCaseMultiPayload == 1)
  {
    *(_QWORD *)a1 = *a2;
    ContactAttributeSnippetModel = (int *)type metadata accessor for GetContactAttributeSnippetModel(0);
    v6 = ContactAttributeSnippetModel[5];
    v7 = a1 + v6;
    v8 = (uint64_t)a2 + v6;
    swift_bridgeObjectRetain();
    v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
    v10 = ContactAttributeSnippetModel[6];
    v11 = a1 + v10;
    v12 = (uint64_t *)((char *)a2 + v10);
    v13 = *(uint64_t *)((char *)a2 + v10 + 8);
    if (v13 >> 60 == 15)
    {
      *(_OWORD *)v11 = *(_OWORD *)v12;
    }
    else
    {
      v34 = *v12;
      outlined copy of Data._Representation(*v12, v13);
      *(_QWORD *)v11 = v34;
      *(_QWORD *)(v11 + 8) = v13;
    }
    v35 = v12[3];
    *(_QWORD *)(v11 + 16) = v12[2];
    *(_QWORD *)(v11 + 24) = v35;
    *(_QWORD *)(v11 + 32) = v12[4];
    v36 = ContactAttributeSnippetModel[7];
    v37 = a1 + v36;
    v38 = (uint64_t *)((char *)a2 + v36);
    v39 = *(uint64_t *)((char *)a2 + v36 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((v39 & 0xF000000000000000) == 0xB000000000000000 || (v39 & 0xF000000000000000) == 0x7000000000000000)
    {
      v41 = *((_OWORD *)v38 + 1);
      *(_OWORD *)v37 = *(_OWORD *)v38;
      *(_OWORD *)(v37 + 16) = v41;
    }
    else
    {
      if (v39 >> 60 == 15)
      {
        *(_OWORD *)v37 = *(_OWORD *)v38;
      }
      else
      {
        v53 = *v38;
        outlined copy of Data._Representation(*v38, v39);
        *(_QWORD *)v37 = v53;
        *(_QWORD *)(v37 + 8) = v39;
      }
      v54 = v38 + 2;
      v55 = v38[3];
      if (v55 >> 60 == 15)
      {
        *(_OWORD *)(v37 + 16) = *(_OWORD *)v54;
      }
      else
      {
        v74 = *v54;
        outlined copy of Data._Representation(*v54, v38[3]);
        *(_QWORD *)(v37 + 16) = v74;
        *(_QWORD *)(v37 + 24) = v55;
      }
    }
    v75 = ContactAttributeSnippetModel[8];
    v76 = (_QWORD *)(a1 + v75);
    v77 = (uint64_t *)((char *)a2 + v75);
    v78 = v77[1];
    *v76 = *v77;
    v76[1] = v78;
    *(_BYTE *)(a1 + ContactAttributeSnippetModel[9]) = *((_BYTE *)a2 + ContactAttributeSnippetModel[9]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
    (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v28 - 8) + 16))(a1, a2, v28);
    ContactSnippetModel = (int *)type metadata accessor for GetContactSnippetModel(0);
    v30 = ContactSnippetModel[5];
    v31 = a1 + v30;
    v32 = (uint64_t *)((char *)a2 + v30);
    v33 = *(uint64_t *)((char *)a2 + v30 + 8);
    if (v33 >> 60 == 15)
    {
      *(_OWORD *)v31 = *(_OWORD *)v32;
    }
    else
    {
      v42 = *v32;
      outlined copy of Data._Representation(*v32, v33);
      *(_QWORD *)v31 = v42;
      *(_QWORD *)(v31 + 8) = v33;
    }
    v43 = v32[3];
    *(_QWORD *)(v31 + 16) = v32[2];
    *(_QWORD *)(v31 + 24) = v43;
    *(_QWORD *)(v31 + 32) = v32[4];
    v44 = ContactSnippetModel[6];
    v45 = a1 + v44;
    v46 = (uint64_t *)((char *)a2 + v44);
    v47 = *(uint64_t *)((char *)a2 + v44 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((v47 & 0xF000000000000000) == 0xB000000000000000 || (v47 & 0xF000000000000000) == 0x7000000000000000)
    {
      v49 = *((_OWORD *)v46 + 1);
      *(_OWORD *)v45 = *(_OWORD *)v46;
      *(_OWORD *)(v45 + 16) = v49;
    }
    else
    {
      if (v47 >> 60 == 15)
      {
        *(_OWORD *)v45 = *(_OWORD *)v46;
      }
      else
      {
        v56 = *v46;
        outlined copy of Data._Representation(*v46, v47);
        *(_QWORD *)v45 = v56;
        *(_QWORD *)(v45 + 8) = v47;
      }
      v57 = v46 + 2;
      v58 = v46[3];
      if (v58 >> 60 == 15)
      {
        *(_OWORD *)(v45 + 16) = *(_OWORD *)v57;
      }
      else
      {
        v79 = *v57;
        outlined copy of Data._Representation(*v57, v46[3]);
        *(_QWORD *)(v45 + 16) = v79;
        *(_QWORD *)(v45 + 24) = v58;
      }
    }
    v80 = ContactSnippetModel[7];
    v81 = a1 + v80;
    v82 = (uint64_t)a2 + v80;
    v83 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v83 - 8) + 16))(v81, v82, v83);
    *(_BYTE *)(a1 + ContactSnippetModel[8]) = *((_BYTE *)a2 + ContactSnippetModel[8]);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for ContactsSnippetPluginModel(uint64_t a1, uint64_t *a2)
{
  int EnumCaseMultiPayload;
  int *ContactAttributeSnippetModel;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  unint64_t v25;
  __int128 v27;
  uint64_t v28;
  int *ContactSnippetModel;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  unint64_t v38;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  unint64_t v45;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  _QWORD *v76;
  uint64_t v78;
  uint64_t *v79;
  unint64_t v80;
  uint64_t v81;

  if ((uint64_t *)a1 != a2)
  {
    outlined destroy of ModifyContactAttributeSnippetModel(a1, (void (*)(_QWORD))type metadata accessor for ContactsSnippetPluginModel);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v14 = *a2;
      v15 = a2[1];
      v16 = *((_BYTE *)a2 + 16);
      outlined copy of ModifyContactAttributeSnippetModel.ContactAttributeToModify();
      *(_QWORD *)a1 = v14;
      *(_QWORD *)(a1 + 8) = v15;
      *(_BYTE *)(a1 + 16) = v16;
      *(_BYTE *)(a1 + 17) = *((_BYTE *)a2 + 17);
      v17 = (int *)type metadata accessor for ModifyContactAttributeSnippetModel(0);
      v18 = v17[6];
      v19 = a1 + v18;
      v20 = (uint64_t)a2 + v18;
      v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v19, v20, v21);
      v22 = v17[7];
      v23 = a1 + v22;
      v24 = (uint64_t *)((char *)a2 + v22);
      v25 = *(uint64_t *)((char *)a2 + v22 + 8);
      if ((v25 & 0xF000000000000000) == 0xB000000000000000 || (v25 & 0xF000000000000000) == 0x7000000000000000)
      {
        v27 = *((_OWORD *)v24 + 1);
        *(_OWORD *)v23 = *(_OWORD *)v24;
        *(_OWORD *)(v23 + 16) = v27;
      }
      else
      {
        if (v25 >> 60 == 15)
        {
          *(_OWORD *)v23 = *(_OWORD *)v24;
        }
        else
        {
          v52 = *v24;
          outlined copy of Data._Representation(*v24, v25);
          *(_QWORD *)v23 = v52;
          *(_QWORD *)(v23 + 8) = v25;
        }
        v53 = v24 + 2;
        v54 = v24[3];
        if (v54 >> 60 == 15)
        {
          *(_OWORD *)(v23 + 16) = *(_OWORD *)v53;
        }
        else
        {
          v58 = *v53;
          outlined copy of Data._Representation(*v53, v24[3]);
          *(_QWORD *)(v23 + 16) = v58;
          *(_QWORD *)(v23 + 24) = v54;
        }
      }
      v59 = v17[8];
      v60 = a1 + v59;
      v61 = (uint64_t)a2 + v59;
      v62 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v62 - 8) + 16))(v60, v61, v62);
      v63 = v17[9];
      v64 = a1 + v63;
      v65 = (uint64_t *)((char *)a2 + v63);
      v66 = v65[1];
      if (v66 >> 60 == 15)
      {
        *(_OWORD *)v64 = *(_OWORD *)v65;
      }
      else
      {
        v67 = *v65;
        outlined copy of Data._Representation(*v65, v65[1]);
        *(_QWORD *)v64 = v67;
        *(_QWORD *)(v64 + 8) = v66;
      }
      v68 = v17[10];
      v69 = a1 + v68;
      v70 = (uint64_t *)((char *)a2 + v68);
      v71 = v70[1];
      if (v71 >> 60 == 15)
      {
        *(_OWORD *)v69 = *(_OWORD *)v70;
      }
      else
      {
        v72 = *v70;
        outlined copy of Data._Representation(*v70, v70[1]);
        *(_QWORD *)v69 = v72;
        *(_QWORD *)(v69 + 8) = v71;
      }
    }
    else if (EnumCaseMultiPayload == 1)
    {
      *(_QWORD *)a1 = *a2;
      ContactAttributeSnippetModel = (int *)type metadata accessor for GetContactAttributeSnippetModel(0);
      v6 = ContactAttributeSnippetModel[5];
      v7 = a1 + v6;
      v8 = (uint64_t)a2 + v6;
      swift_bridgeObjectRetain();
      v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
      v10 = ContactAttributeSnippetModel[6];
      v11 = a1 + v10;
      v12 = (uint64_t *)((char *)a2 + v10);
      v13 = *(uint64_t *)((char *)a2 + v10 + 8);
      if (v13 >> 60 == 15)
      {
        *(_OWORD *)v11 = *(_OWORD *)v12;
      }
      else
      {
        v34 = *v12;
        outlined copy of Data._Representation(*v12, v13);
        *(_QWORD *)v11 = v34;
        *(_QWORD *)(v11 + 8) = v13;
      }
      *(_QWORD *)(v11 + 16) = v12[2];
      *(_QWORD *)(v11 + 24) = v12[3];
      *(_QWORD *)(v11 + 32) = v12[4];
      v35 = ContactAttributeSnippetModel[7];
      v36 = a1 + v35;
      v37 = (uint64_t *)((char *)a2 + v35);
      v38 = *(uint64_t *)((char *)a2 + v35 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if ((v38 & 0xF000000000000000) == 0xB000000000000000 || (v38 & 0xF000000000000000) == 0x7000000000000000)
      {
        v40 = *((_OWORD *)v37 + 1);
        *(_OWORD *)v36 = *(_OWORD *)v37;
        *(_OWORD *)(v36 + 16) = v40;
      }
      else
      {
        if (v38 >> 60 == 15)
        {
          *(_OWORD *)v36 = *(_OWORD *)v37;
        }
        else
        {
          v55 = *v37;
          outlined copy of Data._Representation(*v37, v38);
          *(_QWORD *)v36 = v55;
          *(_QWORD *)(v36 + 8) = v38;
        }
        v56 = v37 + 2;
        v57 = v37[3];
        if (v57 >> 60 == 15)
        {
          *(_OWORD *)(v36 + 16) = *(_OWORD *)v56;
        }
        else
        {
          v73 = *v56;
          outlined copy of Data._Representation(*v56, v37[3]);
          *(_QWORD *)(v36 + 16) = v73;
          *(_QWORD *)(v36 + 24) = v57;
        }
      }
      v74 = ContactAttributeSnippetModel[8];
      v75 = (_QWORD *)(a1 + v74);
      v76 = (uint64_t *)((char *)a2 + v74);
      *v75 = *v76;
      v75[1] = v76[1];
      *(_BYTE *)(a1 + ContactAttributeSnippetModel[9]) = *((_BYTE *)a2 + ContactAttributeSnippetModel[9]);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
      (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v28 - 8) + 16))(a1, a2, v28);
      ContactSnippetModel = (int *)type metadata accessor for GetContactSnippetModel(0);
      v30 = ContactSnippetModel[5];
      v31 = a1 + v30;
      v32 = (uint64_t *)((char *)a2 + v30);
      v33 = *(uint64_t *)((char *)a2 + v30 + 8);
      if (v33 >> 60 == 15)
      {
        *(_OWORD *)v31 = *(_OWORD *)v32;
      }
      else
      {
        v41 = *v32;
        outlined copy of Data._Representation(*v32, v33);
        *(_QWORD *)v31 = v41;
        *(_QWORD *)(v31 + 8) = v33;
      }
      *(_QWORD *)(v31 + 16) = v32[2];
      *(_QWORD *)(v31 + 24) = v32[3];
      *(_QWORD *)(v31 + 32) = v32[4];
      v42 = ContactSnippetModel[6];
      v43 = a1 + v42;
      v44 = (uint64_t *)((char *)a2 + v42);
      v45 = *(uint64_t *)((char *)a2 + v42 + 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if ((v45 & 0xF000000000000000) == 0xB000000000000000 || (v45 & 0xF000000000000000) == 0x7000000000000000)
      {
        v47 = *((_OWORD *)v44 + 1);
        *(_OWORD *)v43 = *(_OWORD *)v44;
        *(_OWORD *)(v43 + 16) = v47;
      }
      else
      {
        if (v45 >> 60 == 15)
        {
          *(_OWORD *)v43 = *(_OWORD *)v44;
        }
        else
        {
          v78 = *v44;
          outlined copy of Data._Representation(*v44, v45);
          *(_QWORD *)v43 = v78;
          *(_QWORD *)(v43 + 8) = v45;
        }
        v79 = v44 + 2;
        v80 = v44[3];
        if (v80 >> 60 == 15)
        {
          *(_OWORD *)(v43 + 16) = *(_OWORD *)v79;
        }
        else
        {
          v81 = *v79;
          outlined copy of Data._Representation(*v79, v44[3]);
          *(_QWORD *)(v43 + 16) = v81;
          *(_QWORD *)(v43 + 24) = v80;
        }
      }
      v48 = ContactSnippetModel[7];
      v49 = a1 + v48;
      v50 = (uint64_t)a2 + v48;
      v51 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v51 - 8) + 16))(v49, v50, v51);
      *(_BYTE *)(a1 + ContactSnippetModel[8]) = *((_BYTE *)a2 + ContactSnippetModel[8]);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for ContactsSnippetPluginModel(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload;
  int *ContactAttributeSnippetModel;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  __int128 v17;
  uint64_t v18;
  int *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _OWORD *v25;
  _OWORD *v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int *ContactSnippetModel;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  _OWORD *v39;
  _OWORD *v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
    v19 = (int *)type metadata accessor for ModifyContactAttributeSnippetModel(0);
    v20 = v19[6];
    v21 = a1 + v20;
    v22 = a2 + v20;
    v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(v21, v22, v23);
    v24 = v19[7];
    v25 = (_OWORD *)(a1 + v24);
    v26 = (_OWORD *)(a2 + v24);
    v27 = v26[1];
    *v25 = *v26;
    v25[1] = v27;
    v28 = v19[8];
    v29 = a1 + v28;
    v30 = a2 + v28;
    v31 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 32))(v29, v30, v31);
    *(_OWORD *)(a1 + v19[9]) = *(_OWORD *)(a2 + v19[9]);
    *(_OWORD *)(a1 + v19[10]) = *(_OWORD *)(a2 + v19[10]);
  }
  else
  {
    if (EnumCaseMultiPayload == 1)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      ContactAttributeSnippetModel = (int *)type metadata accessor for GetContactAttributeSnippetModel(0);
      v6 = ContactAttributeSnippetModel[5];
      v7 = a1 + v6;
      v8 = a2 + v6;
      v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
      v10 = ContactAttributeSnippetModel[6];
      v11 = a1 + v10;
      v12 = a2 + v10;
      v13 = *(_OWORD *)(v12 + 16);
      *(_OWORD *)v11 = *(_OWORD *)v12;
      *(_OWORD *)(v11 + 16) = v13;
      *(_QWORD *)(v11 + 32) = *(_QWORD *)(v12 + 32);
      v14 = ContactAttributeSnippetModel[7];
      v15 = (_OWORD *)(a1 + v14);
      v16 = (_OWORD *)(a2 + v14);
      v17 = v16[1];
      *v15 = *v16;
      v15[1] = v17;
      *(_OWORD *)(a1 + ContactAttributeSnippetModel[8]) = *(_OWORD *)(a2 + ContactAttributeSnippetModel[8]);
      v18 = ContactAttributeSnippetModel[9];
    }
    else
    {
      v32 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 32))(a1, a2, v32);
      ContactSnippetModel = (int *)type metadata accessor for GetContactSnippetModel(0);
      v34 = ContactSnippetModel[5];
      v35 = a1 + v34;
      v36 = a2 + v34;
      v37 = *(_OWORD *)(v36 + 16);
      *(_OWORD *)v35 = *(_OWORD *)v36;
      *(_OWORD *)(v35 + 16) = v37;
      *(_QWORD *)(v35 + 32) = *(_QWORD *)(v36 + 32);
      v38 = ContactSnippetModel[6];
      v39 = (_OWORD *)(a1 + v38);
      v40 = (_OWORD *)(a2 + v38);
      v41 = v40[1];
      *v39 = *v40;
      v39[1] = v41;
      v42 = ContactSnippetModel[7];
      v43 = a1 + v42;
      v44 = a2 + v42;
      v45 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 32))(v43, v44, v45);
      v18 = ContactSnippetModel[8];
    }
    *(_BYTE *)(a1 + v18) = *(_BYTE *)(a2 + v18);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for ContactsSnippetPluginModel(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload;
  int *ContactAttributeSnippetModel;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  __int128 v17;
  uint64_t v18;
  int *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _OWORD *v25;
  _OWORD *v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int *ContactSnippetModel;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  _OWORD *v39;
  _OWORD *v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  if (a1 != a2)
  {
    outlined destroy of ModifyContactAttributeSnippetModel(a1, (void (*)(_QWORD))type metadata accessor for ContactsSnippetPluginModel);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
      v19 = (int *)type metadata accessor for ModifyContactAttributeSnippetModel(0);
      v20 = v19[6];
      v21 = a1 + v20;
      v22 = a2 + v20;
      v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(v21, v22, v23);
      v24 = v19[7];
      v25 = (_OWORD *)(a1 + v24);
      v26 = (_OWORD *)(a2 + v24);
      v27 = v26[1];
      *v25 = *v26;
      v25[1] = v27;
      v28 = v19[8];
      v29 = a1 + v28;
      v30 = a2 + v28;
      v31 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 32))(v29, v30, v31);
      *(_OWORD *)(a1 + v19[9]) = *(_OWORD *)(a2 + v19[9]);
      *(_OWORD *)(a1 + v19[10]) = *(_OWORD *)(a2 + v19[10]);
    }
    else
    {
      if (EnumCaseMultiPayload == 1)
      {
        *(_QWORD *)a1 = *(_QWORD *)a2;
        ContactAttributeSnippetModel = (int *)type metadata accessor for GetContactAttributeSnippetModel(0);
        v6 = ContactAttributeSnippetModel[5];
        v7 = a1 + v6;
        v8 = a2 + v6;
        v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
        v10 = ContactAttributeSnippetModel[6];
        v11 = a1 + v10;
        v12 = a2 + v10;
        v13 = *(_OWORD *)(v12 + 16);
        *(_OWORD *)v11 = *(_OWORD *)v12;
        *(_OWORD *)(v11 + 16) = v13;
        *(_QWORD *)(v11 + 32) = *(_QWORD *)(v12 + 32);
        v14 = ContactAttributeSnippetModel[7];
        v15 = (_OWORD *)(a1 + v14);
        v16 = (_OWORD *)(a2 + v14);
        v17 = v16[1];
        *v15 = *v16;
        v15[1] = v17;
        *(_OWORD *)(a1 + ContactAttributeSnippetModel[8]) = *(_OWORD *)(a2 + ContactAttributeSnippetModel[8]);
        v18 = ContactAttributeSnippetModel[9];
      }
      else
      {
        v32 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 32))(a1, a2, v32);
        ContactSnippetModel = (int *)type metadata accessor for GetContactSnippetModel(0);
        v34 = ContactSnippetModel[5];
        v35 = a1 + v34;
        v36 = a2 + v34;
        v37 = *(_OWORD *)(v36 + 16);
        *(_OWORD *)v35 = *(_OWORD *)v36;
        *(_OWORD *)(v35 + 16) = v37;
        *(_QWORD *)(v35 + 32) = *(_QWORD *)(v36 + 32);
        v38 = ContactSnippetModel[6];
        v39 = (_OWORD *)(a1 + v38);
        v40 = (_OWORD *)(a2 + v38);
        v41 = v40[1];
        *v39 = *v40;
        v39[1] = v41;
        v42 = ContactSnippetModel[7];
        v43 = a1 + v42;
        v44 = a2 + v42;
        v45 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 32))(v43, v44, v45);
        v18 = ContactSnippetModel[8];
      }
      *(_BYTE *)(a1 + v18) = *(_BYTE *)(a2 + v18);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destructiveInjectEnumTag for ContactsSnippetPluginModel()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t type metadata completion function for ContactsSnippetPluginModel()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  result = type metadata accessor for GetContactSnippetModel(319);
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for GetContactAttributeSnippetModel(319);
    if (v2 <= 0x3F)
    {
      result = type metadata accessor for ModifyContactAttributeSnippetModel(319);
      if (v3 <= 0x3F)
      {
        swift_initEnumMetadataMultiPayload();
        return 0;
      }
    }
  }
  return result;
}

uint64_t *destroy for ContactsSnippetFlowState(uint64_t *result)
{
  unint64_t v1;
  BOOL v2;
  uint64_t *v3;
  unint64_t v4;

  v1 = result[1];
  if (4 * ((v1 >> 60) & 3))
    v2 = (((v1 >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((v1 >> 60) & 3))) == 15;
  else
    v2 = 1;
  if (v2)
  {
    v3 = result;
    if (v1 >> 60 != 15)
      result = (uint64_t *)outlined consume of Data._Representation(*result, v1);
    v4 = v3[3];
    if (v4 >> 60 != 15)
      return (uint64_t *)outlined consume of Data._Representation(v3[2], v4);
  }
  return result;
}

uint64_t initializeWithCopy for ContactsSnippetFlowState(uint64_t a1, uint64_t *a2)
{
  unint64_t v4;
  BOOL v5;
  __int128 v6;
  uint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  uint64_t v10;

  v4 = a2[1];
  if (4 * ((v4 >> 60) & 3))
    v5 = (((v4 >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((v4 >> 60) & 3))) == 15;
  else
    v5 = 1;
  if (v5)
  {
    if (v4 >> 60 == 15)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
    }
    else
    {
      v7 = *a2;
      outlined copy of Data._Representation(*a2, a2[1]);
      *(_QWORD *)a1 = v7;
      *(_QWORD *)(a1 + 8) = v4;
    }
    v8 = a2 + 2;
    v9 = a2[3];
    if (v9 >> 60 == 15)
    {
      *(_OWORD *)(a1 + 16) = *(_OWORD *)v8;
    }
    else
    {
      v10 = *v8;
      outlined copy of Data._Representation(*v8, v9);
      *(_QWORD *)(a1 + 16) = v10;
      *(_QWORD *)(a1 + 24) = v9;
    }
  }
  else
  {
    v6 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
  }
  return a1;
}

uint64_t *assignWithCopy for ContactsSnippetFlowState(uint64_t *a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  _BOOL4 v6;
  BOOL v7;
  uint64_t v8;
  unint64_t v9;
  __int128 v10;
  uint64_t v11;
  _OWORD *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;

  v4 = a1[1];
  v5 = *(_QWORD *)(a2 + 8);
  v6 = ((4 * (v5 >> 60)) & 0xC | ((v5 >> 60) >> 2)) == 0xF || ((4 * (v5 >> 60)) & 0xC) == 0;
  if (4 * ((v4 >> 60) & 3))
    v7 = (((v4 >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((v4 >> 60) & 3))) == 15;
  else
    v7 = 1;
  if (v7)
  {
    if (!v6)
    {
      if (v4 >> 60 != 15)
        outlined consume of Data._Representation(*a1, v4);
      v9 = a1[3];
      if (v9 >> 60 != 15)
        outlined consume of Data._Representation(a1[2], v9);
      goto LABEL_20;
    }
    if (v4 >> 60 == 15)
    {
      if (v5 >> 60 != 15)
      {
        v8 = *(_QWORD *)a2;
        outlined copy of Data._Representation(*(_QWORD *)a2, *(_QWORD *)(a2 + 8));
        *a1 = v8;
        a1[1] = v5;
        goto LABEL_29;
      }
    }
    else
    {
      if (v5 >> 60 != 15)
      {
        v15 = *(_QWORD *)a2;
        outlined copy of Data._Representation(*(_QWORD *)a2, *(_QWORD *)(a2 + 8));
        v16 = *a1;
        v17 = a1[1];
        *a1 = v15;
        a1[1] = v5;
        outlined consume of Data._Representation(v16, v17);
LABEL_29:
        v18 = (uint64_t *)(a2 + 16);
        v13 = *(_QWORD *)(a2 + 24);
        if ((unint64_t)a1[3] >> 60 == 15)
        {
          if (v13 >> 60 != 15)
          {
            v14 = *v18;
            goto LABEL_32;
          }
        }
        else
        {
          if (v13 >> 60 != 15)
          {
            v19 = *v18;
            outlined copy of Data._Representation(*v18, v13);
            v20 = a1[2];
            v21 = a1[3];
            a1[2] = v19;
            a1[3] = v13;
            outlined consume of Data._Representation(v20, v21);
            return a1;
          }
          outlined destroy of Data((uint64_t)(a1 + 2));
        }
        *((_OWORD *)a1 + 1) = *(_OWORD *)v18;
        return a1;
      }
      outlined destroy of Data((uint64_t)a1);
    }
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_29;
  }
  if (v6)
  {
    if (v5 >> 60 == 15)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
    }
    else
    {
      v11 = *(_QWORD *)a2;
      outlined copy of Data._Representation(*(_QWORD *)a2, *(_QWORD *)(a2 + 8));
      *a1 = v11;
      a1[1] = v5;
    }
    v12 = (_OWORD *)(a2 + 16);
    v13 = *(_QWORD *)(a2 + 24);
    if (v13 >> 60 == 15)
    {
      *((_OWORD *)a1 + 1) = *v12;
      return a1;
    }
    v14 = *(_QWORD *)v12;
LABEL_32:
    outlined copy of Data._Representation(v14, v13);
    a1[2] = v14;
    a1[3] = v13;
    return a1;
  }
LABEL_20:
  v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v10;
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

uint64_t *assignWithTake for ContactsSnippetFlowState(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4;
  BOOL v5;
  unint64_t v6;
  BOOL v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v11;
  uint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;

  v4 = a1[1];
  if (4 * ((v4 >> 60) & 3))
    v5 = (((v4 >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((v4 >> 60) & 3))) == 15;
  else
    v5 = 1;
  if (!v5)
  {
LABEL_19:
    v9 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *((_OWORD *)a1 + 1) = v9;
    return a1;
  }
  v6 = a2[1];
  if (4 * ((v6 >> 60) & 3))
    v7 = (((v6 >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((v6 >> 60) & 3))) == 15;
  else
    v7 = 1;
  if (!v7)
  {
    if (v4 >> 60 != 15)
      outlined consume of Data._Representation(*a1, v4);
    v8 = a1[3];
    if (v8 >> 60 != 15)
      outlined consume of Data._Representation(a1[2], v8);
    goto LABEL_19;
  }
  if (v4 >> 60 != 15)
  {
    if (v6 >> 60 != 15)
    {
      v11 = *a1;
      *a1 = *a2;
      a1[1] = v6;
      outlined consume of Data._Representation(v11, v4);
      goto LABEL_22;
    }
    outlined destroy of Data((uint64_t)a1);
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_22:
  v12 = a2 + 2;
  v13 = a1[3];
  if (v13 >> 60 != 15)
  {
    v14 = a2[3];
    if (v14 >> 60 != 15)
    {
      v15 = a1[2];
      a1[2] = *v12;
      a1[3] = v14;
      outlined consume of Data._Representation(v15, v13);
      return a1;
    }
    outlined destroy of Data((uint64_t)(a1 + 2));
  }
  *((_OWORD *)a1 + 1) = *(_OWORD *)v12;
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactsSnippetFlowState(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  BOOL v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xA && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 10);
  v3 = *(_QWORD *)(a1 + 8) >> 60;
  v4 = ((4 * (_DWORD)v3) & 0xC) == 0;
  v5 = ((4 * v3) & 0xC | (v3 >> 2)) ^ 0xF;
  if (v4)
    v5 = 0;
  if (v5 >= 3)
    return v5 - 2;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ContactsSnippetFlowState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 9)
  {
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 10;
    if (a3 >= 0xA)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0xA)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (unint64_t)((4 * (13 - a2)) | ((13 - a2) >> 2)) << 60;
    }
  }
  return result;
}

uint64_t getEnumTag for ContactsSnippetFlowState(uint64_t a1)
{
  uint64_t v1;
  BOOL v2;
  unsigned int v3;

  v1 = *(_QWORD *)(a1 + 8) >> 60;
  v2 = ((4 * (_DWORD)v1) & 0xC) == 0;
  v3 = ((4 * v1) & 0xC | (v1 >> 2)) ^ 0xF;
  if (v2)
    return 0;
  else
    return v3;
}

_QWORD *destructiveInjectEnumTag for ContactsSnippetFlowState(_QWORD *result, unsigned int a2)
{
  if (a2 > 0xB)
  {
    result[2] = 0;
    result[3] = 0;
    *result = a2 - 12;
    result[1] = 0;
  }
  else if (a2)
  {
    *result = 0;
    result[1] = (unint64_t)((4 * (a2 ^ 0xF)) | ((a2 ^ 0xF) >> 2)) << 60;
  }
  return result;
}

void type metadata accessor for ContactsSnippetFlowState()
{
  OUTLINED_FUNCTION_65();
}

_QWORD *initializeBufferWithCopyOfBuffer for GetContactSnippetModel(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  unint64_t v18;
  __int128 v20;
  uint64_t v21;
  uint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (_QWORD *)((char *)a2 + v8);
    v11 = *(_QWORD *)((char *)a2 + v8 + 8);
    if (v11 >> 60 == 15)
    {
      *(_OWORD *)v9 = *(_OWORD *)v10;
    }
    else
    {
      v13 = *v10;
      outlined copy of Data._Representation(*v10, v11);
      *(_QWORD *)v9 = v13;
      *((_QWORD *)v9 + 1) = v11;
    }
    v14 = v10[3];
    *((_QWORD *)v9 + 2) = v10[2];
    *((_QWORD *)v9 + 3) = v14;
    *((_QWORD *)v9 + 4) = v10[4];
    v15 = a3[6];
    v16 = (char *)a1 + v15;
    v17 = (char *)a2 + v15;
    v18 = *(_QWORD *)((char *)a2 + v15 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((v18 & 0xF000000000000000) == 0xB000000000000000 || (v18 & 0xF000000000000000) == 0x7000000000000000)
    {
      v20 = *((_OWORD *)v17 + 1);
      *(_OWORD *)v16 = *(_OWORD *)v17;
      *((_OWORD *)v16 + 1) = v20;
    }
    else
    {
      if (v18 >> 60 == 15)
      {
        *(_OWORD *)v16 = *(_OWORD *)v17;
      }
      else
      {
        v21 = *(_QWORD *)v17;
        outlined copy of Data._Representation(*(_QWORD *)v17, v18);
        *(_QWORD *)v16 = v21;
        *((_QWORD *)v16 + 1) = v18;
      }
      v22 = (uint64_t *)(v17 + 16);
      v23 = *((_QWORD *)v17 + 3);
      if (v23 >> 60 == 15)
      {
        *((_OWORD *)v16 + 1) = *(_OWORD *)v22;
      }
      else
      {
        v24 = *v22;
        outlined copy of Data._Representation(*v22, *((_QWORD *)v17 + 3));
        *((_QWORD *)v16 + 2) = v24;
        *((_QWORD *)v16 + 3) = v23;
      }
    }
    v25 = a3[7];
    v26 = (char *)a1 + v25;
    v27 = (char *)a2 + v25;
    v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 16))(v26, v27, v28);
    *((_BYTE *)a1 + a3[8]) = *((_BYTE *)a2 + a3[8]);
  }
  return a1;
}

uint64_t destroy for GetContactSnippetModel(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t *v5;
  unint64_t v6;
  uint64_t *v7;
  unint64_t v8;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = (uint64_t *)(a1 + a2[5]);
  v6 = v5[1];
  if (v6 >> 60 != 15)
    outlined consume of Data._Representation(*v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7 = (uint64_t *)(a1 + a2[6]);
  v8 = v7[1];
  if ((v8 & 0xF000000000000000) != 0xB000000000000000 && (v8 & 0xF000000000000000) != 0x7000000000000000)
  {
    if (v8 >> 60 != 15)
      outlined consume of Data._Representation(*v7, v8);
    v10 = v7[3];
    if (v10 >> 60 != 15)
      outlined consume of Data._Representation(v7[2], v10);
  }
  v11 = a1 + a2[7];
  v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
}

uint64_t initializeWithCopy for GetContactSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  unint64_t v16;
  __int128 v18;
  uint64_t v19;
  uint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = (uint64_t *)(a2 + v7);
  v10 = *(_QWORD *)(a2 + v7 + 8);
  if (v10 >> 60 == 15)
  {
    *(_OWORD *)v8 = *(_OWORD *)v9;
  }
  else
  {
    v11 = *v9;
    outlined copy of Data._Representation(*v9, v10);
    *(_QWORD *)v8 = v11;
    *(_QWORD *)(v8 + 8) = v10;
  }
  v12 = v9[3];
  *(_QWORD *)(v8 + 16) = v9[2];
  *(_QWORD *)(v8 + 24) = v12;
  *(_QWORD *)(v8 + 32) = v9[4];
  v13 = a3[6];
  v14 = a1 + v13;
  v15 = (uint64_t *)(a2 + v13);
  v16 = *(_QWORD *)(a2 + v13 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((v16 & 0xF000000000000000) == 0xB000000000000000 || (v16 & 0xF000000000000000) == 0x7000000000000000)
  {
    v18 = *((_OWORD *)v15 + 1);
    *(_OWORD *)v14 = *(_OWORD *)v15;
    *(_OWORD *)(v14 + 16) = v18;
  }
  else
  {
    if (v16 >> 60 == 15)
    {
      *(_OWORD *)v14 = *(_OWORD *)v15;
    }
    else
    {
      v19 = *v15;
      outlined copy of Data._Representation(*v15, v16);
      *(_QWORD *)v14 = v19;
      *(_QWORD *)(v14 + 8) = v16;
    }
    v20 = v15 + 2;
    v21 = v15[3];
    if (v21 >> 60 == 15)
    {
      *(_OWORD *)(v14 + 16) = *(_OWORD *)v20;
    }
    else
    {
      v22 = *v20;
      outlined copy of Data._Representation(*v20, v15[3]);
      *(_QWORD *)(v14 + 16) = v22;
      *(_QWORD *)(v14 + 24) = v21;
    }
  }
  v23 = a3[7];
  v24 = a1 + v23;
  v25 = a2 + v23;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(v24, v25, v26);
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  return a1;
}

uint64_t assignWithCopy for GetContactSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  unint64_t v18;
  unint64_t v20;
  __int128 v22;
  unint64_t v23;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = (uint64_t *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v10 = *(_QWORD *)(a2 + v7 + 8);
  if (*(_QWORD *)(a1 + v7 + 8) >> 60 == 15)
  {
    if (v10 >> 60 != 15)
    {
      v11 = *v9;
      outlined copy of Data._Representation(*v9, v10);
      *v8 = v11;
      v8[1] = v10;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v10 >> 60 == 15)
  {
    outlined destroy of Data((uint64_t)v8);
LABEL_6:
    *(_OWORD *)v8 = *(_OWORD *)v9;
    goto LABEL_8;
  }
  v12 = *v9;
  outlined copy of Data._Representation(*v9, v10);
  v13 = *v8;
  v14 = v8[1];
  *v8 = v12;
  v8[1] = v10;
  outlined consume of Data._Representation(v13, v14);
LABEL_8:
  v8[2] = v9[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[3] = v9[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8[4] = v9[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v15 = a3[6];
  v16 = a1 + v15;
  v17 = (uint64_t *)(a2 + v15);
  v18 = *(_QWORD *)(a1 + v15 + 8);
  if ((v18 & 0xF000000000000000) == 0xB000000000000000 || (v18 & 0xF000000000000000) == 0x7000000000000000)
  {
    v20 = v17[1];
    if ((v20 & 0xF000000000000000) == 0xB000000000000000 || (v20 & 0xF000000000000000) == 0x7000000000000000)
    {
      v22 = *((_OWORD *)v17 + 1);
      *(_OWORD *)v16 = *(_OWORD *)v17;
      *(_OWORD *)(v16 + 16) = v22;
    }
    else
    {
      if (v20 >> 60 == 15)
      {
        *(_OWORD *)v16 = *(_OWORD *)v17;
      }
      else
      {
        v27 = *v17;
        outlined copy of Data._Representation(*v17, v17[1]);
        *(_QWORD *)v16 = v27;
        *(_QWORD *)(v16 + 8) = v20;
      }
      v28 = v17 + 2;
      v29 = v17[3];
      if (v29 >> 60 != 15)
      {
        v30 = *v28;
LABEL_41:
        outlined copy of Data._Representation(v30, v29);
        *(_QWORD *)(v16 + 16) = v30;
        *(_QWORD *)(v16 + 24) = v29;
        goto LABEL_46;
      }
      *(_OWORD *)(v16 + 16) = *(_OWORD *)v28;
    }
  }
  else
  {
    v23 = v17[1];
    if ((v23 & 0xF000000000000000) != 0xB000000000000000 && (v23 & 0xF000000000000000) != 0x7000000000000000)
    {
      if (v18 >> 60 == 15)
      {
        if (v23 >> 60 != 15)
        {
          v26 = *v17;
          outlined copy of Data._Representation(*v17, v17[1]);
          *(_QWORD *)v16 = v26;
          *(_QWORD *)(v16 + 8) = v23;
          goto LABEL_38;
        }
      }
      else
      {
        if (v23 >> 60 != 15)
        {
          v31 = *v17;
          outlined copy of Data._Representation(*v17, v17[1]);
          v32 = *(_QWORD *)v16;
          v33 = *(_QWORD *)(v16 + 8);
          *(_QWORD *)v16 = v31;
          *(_QWORD *)(v16 + 8) = v23;
          outlined consume of Data._Representation(v32, v33);
LABEL_38:
          v34 = v17 + 2;
          v29 = v17[3];
          if (*(_QWORD *)(v16 + 24) >> 60 == 15)
          {
            if (v29 >> 60 != 15)
            {
              v30 = *v34;
              goto LABEL_41;
            }
          }
          else
          {
            if (v29 >> 60 != 15)
            {
              v35 = *v34;
              outlined copy of Data._Representation(*v34, v17[3]);
              v36 = *(_QWORD *)(v16 + 16);
              v37 = *(_QWORD *)(v16 + 24);
              *(_QWORD *)(v16 + 16) = v35;
              *(_QWORD *)(v16 + 24) = v29;
              outlined consume of Data._Representation(v36, v37);
              goto LABEL_46;
            }
            outlined destroy of Data(v16 + 16);
          }
          *(_OWORD *)(v16 + 16) = *(_OWORD *)v34;
          goto LABEL_46;
        }
        outlined destroy of Data(v16);
      }
      *(_OWORD *)v16 = *(_OWORD *)v17;
      goto LABEL_38;
    }
    outlined destroy of (confirmActionData: Data?, cancelActionData: Data?)(v16);
    v25 = *((_OWORD *)v17 + 1);
    *(_OWORD *)v16 = *(_OWORD *)v17;
    *(_OWORD *)(v16 + 16) = v25;
  }
LABEL_46:
  v38 = a3[7];
  v39 = a1 + v38;
  v40 = a2 + v38;
  v41 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 24))(v39, v40, v41);
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  return a1;
}

uint64_t outlined destroy of (confirmActionData: Data?, cancelActionData: Data?)(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (confirmActionData: Data?, cancelActionData: Data?));
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t initializeWithTake for GetContactSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 *v10;
  __int128 v11;
  __int128 v12;
  _OWORD *v13;
  _OWORD *v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = a1 + v7;
  v10 = (__int128 *)(a2 + v7);
  v11 = *v10;
  v12 = v10[1];
  *(_QWORD *)(v9 + 32) = *((_QWORD *)v10 + 4);
  *(_OWORD *)v9 = v11;
  *(_OWORD *)(v9 + 16) = v12;
  v13 = (_OWORD *)(a1 + v8);
  v14 = (_OWORD *)(a2 + v8);
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  v16 = a3[7];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  return a1;
}

uint64_t assignWithTake for GetContactSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v18;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  _QWORD *v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_QWORD *)(a1 + v7 + 8);
  if (v10 >> 60 == 15)
    goto LABEL_4;
  v11 = *(_QWORD *)(v9 + 8);
  if (v11 >> 60 == 15)
  {
    outlined destroy of Data(v8);
LABEL_4:
    *(_OWORD *)v8 = *(_OWORD *)v9;
    goto LABEL_6;
  }
  v12 = *(_QWORD *)v8;
  *(_QWORD *)v8 = *(_QWORD *)v9;
  *(_QWORD *)(v8 + 8) = v11;
  outlined consume of Data._Representation(v12, v10);
LABEL_6:
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v9 + 16);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v8 + 24) = *(_QWORD *)(v9 + 24);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v8 + 32) = *(_QWORD *)(v9 + 32);
  swift_bridgeObjectRelease();
  v13 = a3[6];
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = *(_QWORD *)(a1 + v13 + 8);
  if ((v16 & 0xF000000000000000) == 0xB000000000000000 || (v16 & 0xF000000000000000) == 0x7000000000000000)
    goto LABEL_18;
  v18 = *(_QWORD *)(v15 + 8);
  if ((v18 & 0xF000000000000000) == 0xB000000000000000 || (v18 & 0xF000000000000000) == 0x7000000000000000)
  {
    outlined destroy of (confirmActionData: Data?, cancelActionData: Data?)(v14);
LABEL_18:
    v20 = *(_OWORD *)(v15 + 16);
    *(_OWORD *)v14 = *(_OWORD *)v15;
    *(_OWORD *)(v14 + 16) = v20;
    goto LABEL_19;
  }
  if (v16 >> 60 != 15)
  {
    if (v18 >> 60 != 15)
    {
      v26 = *(_QWORD *)v14;
      *(_QWORD *)v14 = *(_QWORD *)v15;
      *(_QWORD *)(v14 + 8) = v18;
      outlined consume of Data._Representation(v26, v16);
      goto LABEL_25;
    }
    outlined destroy of Data(v14);
  }
  *(_OWORD *)v14 = *(_OWORD *)v15;
LABEL_25:
  v27 = (_QWORD *)(v15 + 16);
  v28 = *(_QWORD *)(v14 + 24);
  if (v28 >> 60 != 15)
  {
    v29 = *(_QWORD *)(v15 + 24);
    if (v29 >> 60 != 15)
    {
      v30 = *(_QWORD *)(v14 + 16);
      *(_QWORD *)(v14 + 16) = *v27;
      *(_QWORD *)(v14 + 24) = v29;
      outlined consume of Data._Representation(v30, v28);
      goto LABEL_19;
    }
    outlined destroy of Data(v14 + 16);
  }
  *(_OWORD *)(v14 + 16) = *(_OWORD *)v27;
LABEL_19:
  v21 = a3[7];
  v22 = a1 + v21;
  v23 = a2 + v21;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 40))(v22, v23, v24);
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  return a1;
}

uint64_t getEnumTagSinglePayload for GetContactSnippetModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_2461A9C4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_171();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)v3)
  {
    v7 = v6;
    v8 = v4;
  }
  else
  {
    if ((_DWORD)v3 == 0x7FFFFFFF)
    {
      OUTLINED_FUNCTION_169(*(_QWORD *)(v4 + *(int *)(a3 + 20) + 16));
      OUTLINED_FUNCTION_0_0();
      return;
    }
    v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
    v8 = v4 + *(int *)(a3 + 28);
  }
  OUTLINED_FUNCTION_32_0(v8, v3, v7);
}

uint64_t storeEnumTagSinglePayload for GetContactSnippetModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_2461A9CE0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_171();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = v5;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(v5 + *(int *)(a4 + 20) + 16) = (v4 - 1);
      OUTLINED_FUNCTION_0_0();
      return;
    }
    v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
    v10 = v5 + *(int *)(a4 + 28);
  }
  OUTLINED_FUNCTION_33_0(v10, v4, v4, v9);
}

void type metadata completion function for GetContactSnippetModel()
{
  unint64_t v0;
  unint64_t v1;

  type metadata accessor for Loggable<CodableContact<CNContact>>();
  if (v0 <= 0x3F)
  {
    type metadata accessor for Loggable<ContactsLabelCATContainer>();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void type metadata accessor for Loggable<CodableContact<CNContact>>()
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for Loggable<CodableContact<CNContact>>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for CodableContact<CNContact>);
    v0 = type metadata accessor for Loggable();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  }
}

void type metadata accessor for Loggable<ContactsLabelCATContainer>()
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for Loggable<ContactsLabelCATContainer>)
  {
    v0 = type metadata accessor for Loggable();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
  }
}

_QWORD *initializeBufferWithCopyOfBuffer for GetContactAttributeSnippetModel(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v4;
  uint64_t v5;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  unint64_t v21;
  __int128 v23;
  uint64_t v24;
  uint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;

  v4 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (_QWORD *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    swift_bridgeObjectRetain();
    v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = a3[6];
    v13 = (char *)a1 + v12;
    v14 = (_QWORD *)((char *)a2 + v12);
    v15 = *(_QWORD *)((char *)a2 + v12 + 8);
    if (v15 >> 60 == 15)
    {
      *(_OWORD *)v13 = *(_OWORD *)v14;
    }
    else
    {
      v16 = *v14;
      outlined copy of Data._Representation(*v14, v15);
      *(_QWORD *)v13 = v16;
      *((_QWORD *)v13 + 1) = v15;
    }
    v17 = v14[3];
    *((_QWORD *)v13 + 2) = v14[2];
    *((_QWORD *)v13 + 3) = v17;
    *((_QWORD *)v13 + 4) = v14[4];
    v18 = a3[7];
    v19 = (char *)a1 + v18;
    v20 = (char *)a2 + v18;
    v21 = *(_QWORD *)((char *)a2 + v18 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((v21 & 0xF000000000000000) == 0xB000000000000000 || (v21 & 0xF000000000000000) == 0x7000000000000000)
    {
      v23 = *((_OWORD *)v20 + 1);
      *(_OWORD *)v19 = *(_OWORD *)v20;
      *((_OWORD *)v19 + 1) = v23;
    }
    else
    {
      if (v21 >> 60 == 15)
      {
        *(_OWORD *)v19 = *(_OWORD *)v20;
      }
      else
      {
        v24 = *(_QWORD *)v20;
        outlined copy of Data._Representation(*(_QWORD *)v20, v21);
        *(_QWORD *)v19 = v24;
        *((_QWORD *)v19 + 1) = v21;
      }
      v25 = (uint64_t *)(v20 + 16);
      v26 = *((_QWORD *)v20 + 3);
      if (v26 >> 60 == 15)
      {
        *((_OWORD *)v19 + 1) = *(_OWORD *)v25;
      }
      else
      {
        v27 = *v25;
        outlined copy of Data._Representation(*v25, *((_QWORD *)v20 + 3));
        *((_QWORD *)v19 + 2) = v27;
        *((_QWORD *)v19 + 3) = v26;
      }
    }
    v28 = a3[8];
    v29 = a3[9];
    v30 = (_QWORD *)((char *)a1 + v28);
    v31 = (_QWORD *)((char *)a2 + v28);
    v32 = v31[1];
    *v30 = *v31;
    v30[1] = v32;
    *((_BYTE *)a1 + v29) = *((_BYTE *)a2 + v29);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for GetContactAttributeSnippetModel(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  unint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  unint64_t v11;

  swift_bridgeObjectRelease();
  v4 = a1 + a2[5];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = (uint64_t *)(a1 + a2[6]);
  v7 = v6[1];
  if (v7 >> 60 != 15)
    outlined consume of Data._Representation(*v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8 = (uint64_t *)(a1 + a2[7]);
  v9 = v8[1];
  if ((v9 & 0xF000000000000000) != 0xB000000000000000 && (v9 & 0xF000000000000000) != 0x7000000000000000)
  {
    if (v9 >> 60 != 15)
      outlined consume of Data._Representation(*v8, v9);
    v11 = v8[3];
    if (v11 >> 60 != 15)
      outlined consume of Data._Representation(v8[2], v11);
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for GetContactAttributeSnippetModel(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  unint64_t v19;
  __int128 v21;
  uint64_t v22;
  uint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  swift_bridgeObjectRetain();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  v10 = a3[6];
  v11 = (char *)a1 + v10;
  v12 = (_QWORD *)((char *)a2 + v10);
  v13 = *(_QWORD *)((char *)a2 + v10 + 8);
  if (v13 >> 60 == 15)
  {
    *(_OWORD *)v11 = *(_OWORD *)v12;
  }
  else
  {
    v14 = *v12;
    outlined copy of Data._Representation(*v12, v13);
    *(_QWORD *)v11 = v14;
    *((_QWORD *)v11 + 1) = v13;
  }
  v15 = v12[3];
  *((_QWORD *)v11 + 2) = v12[2];
  *((_QWORD *)v11 + 3) = v15;
  *((_QWORD *)v11 + 4) = v12[4];
  v16 = a3[7];
  v17 = (char *)a1 + v16;
  v18 = (char *)a2 + v16;
  v19 = *(_QWORD *)((char *)a2 + v16 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((v19 & 0xF000000000000000) == 0xB000000000000000 || (v19 & 0xF000000000000000) == 0x7000000000000000)
  {
    v21 = *((_OWORD *)v18 + 1);
    *(_OWORD *)v17 = *(_OWORD *)v18;
    *((_OWORD *)v17 + 1) = v21;
  }
  else
  {
    if (v19 >> 60 == 15)
    {
      *(_OWORD *)v17 = *(_OWORD *)v18;
    }
    else
    {
      v22 = *(_QWORD *)v18;
      outlined copy of Data._Representation(*(_QWORD *)v18, v19);
      *(_QWORD *)v17 = v22;
      *((_QWORD *)v17 + 1) = v19;
    }
    v23 = (uint64_t *)(v18 + 16);
    v24 = *((_QWORD *)v18 + 3);
    if (v24 >> 60 == 15)
    {
      *((_OWORD *)v17 + 1) = *(_OWORD *)v23;
    }
    else
    {
      v25 = *v23;
      outlined copy of Data._Representation(*v23, *((_QWORD *)v18 + 3));
      *((_QWORD *)v17 + 2) = v25;
      *((_QWORD *)v17 + 3) = v24;
    }
  }
  v26 = a3[8];
  v27 = a3[9];
  v28 = (_QWORD *)((char *)a1 + v26);
  v29 = (_QWORD *)((char *)a2 + v26);
  v30 = v29[1];
  *v28 = *v29;
  v28[1] = v30;
  *((_BYTE *)a1 + v27) = *((_BYTE *)a2 + v27);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for GetContactAttributeSnippetModel(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  unint64_t v21;
  unint64_t v23;
  __int128 v25;
  unint64_t v26;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[6];
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  v13 = *(_QWORD *)((char *)a2 + v10 + 8);
  if (*(_QWORD *)((char *)a1 + v10 + 8) >> 60 == 15)
  {
    if (v13 >> 60 != 15)
    {
      v14 = *v12;
      outlined copy of Data._Representation(*v12, v13);
      *v11 = v14;
      v11[1] = v13;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v13 >> 60 == 15)
  {
    outlined destroy of Data((uint64_t)v11);
LABEL_6:
    *(_OWORD *)v11 = *(_OWORD *)v12;
    goto LABEL_8;
  }
  v15 = *v12;
  outlined copy of Data._Representation(*v12, v13);
  v16 = *v11;
  v17 = v11[1];
  *v11 = v15;
  v11[1] = v13;
  outlined consume of Data._Representation(v16, v17);
LABEL_8:
  v11[2] = v12[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11[3] = v12[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11[4] = v12[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v18 = a3[7];
  v19 = (uint64_t)a1 + v18;
  v20 = (char *)a2 + v18;
  v21 = *(_QWORD *)((char *)a1 + v18 + 8);
  if ((v21 & 0xF000000000000000) == 0xB000000000000000 || (v21 & 0xF000000000000000) == 0x7000000000000000)
  {
    v23 = *((_QWORD *)v20 + 1);
    if ((v23 & 0xF000000000000000) == 0xB000000000000000 || (v23 & 0xF000000000000000) == 0x7000000000000000)
    {
      v25 = *((_OWORD *)v20 + 1);
      *(_OWORD *)v19 = *(_OWORD *)v20;
      *(_OWORD *)(v19 + 16) = v25;
    }
    else
    {
      if (v23 >> 60 == 15)
      {
        *(_OWORD *)v19 = *(_OWORD *)v20;
      }
      else
      {
        v30 = *(_QWORD *)v20;
        outlined copy of Data._Representation(*(_QWORD *)v20, *((_QWORD *)v20 + 1));
        *(_QWORD *)v19 = v30;
        *(_QWORD *)(v19 + 8) = v23;
      }
      v31 = (uint64_t *)(v20 + 16);
      v32 = *((_QWORD *)v20 + 3);
      if (v32 >> 60 != 15)
      {
        v33 = *v31;
LABEL_41:
        outlined copy of Data._Representation(v33, v32);
        *(_QWORD *)(v19 + 16) = v33;
        *(_QWORD *)(v19 + 24) = v32;
        goto LABEL_46;
      }
      *(_OWORD *)(v19 + 16) = *(_OWORD *)v31;
    }
  }
  else
  {
    v26 = *((_QWORD *)v20 + 1);
    if ((v26 & 0xF000000000000000) != 0xB000000000000000 && (v26 & 0xF000000000000000) != 0x7000000000000000)
    {
      if (v21 >> 60 == 15)
      {
        if (v26 >> 60 != 15)
        {
          v29 = *(_QWORD *)v20;
          outlined copy of Data._Representation(*(_QWORD *)v20, *((_QWORD *)v20 + 1));
          *(_QWORD *)v19 = v29;
          *(_QWORD *)(v19 + 8) = v26;
          goto LABEL_38;
        }
      }
      else
      {
        if (v26 >> 60 != 15)
        {
          v34 = *(_QWORD *)v20;
          outlined copy of Data._Representation(*(_QWORD *)v20, *((_QWORD *)v20 + 1));
          v35 = *(_QWORD *)v19;
          v36 = *(_QWORD *)(v19 + 8);
          *(_QWORD *)v19 = v34;
          *(_QWORD *)(v19 + 8) = v26;
          outlined consume of Data._Representation(v35, v36);
LABEL_38:
          v37 = (uint64_t *)(v20 + 16);
          v32 = *((_QWORD *)v20 + 3);
          if (*(_QWORD *)(v19 + 24) >> 60 == 15)
          {
            if (v32 >> 60 != 15)
            {
              v33 = *v37;
              goto LABEL_41;
            }
          }
          else
          {
            if (v32 >> 60 != 15)
            {
              v38 = *v37;
              outlined copy of Data._Representation(*v37, *((_QWORD *)v20 + 3));
              v39 = *(_QWORD *)(v19 + 16);
              v40 = *(_QWORD *)(v19 + 24);
              *(_QWORD *)(v19 + 16) = v38;
              *(_QWORD *)(v19 + 24) = v32;
              outlined consume of Data._Representation(v39, v40);
              goto LABEL_46;
            }
            outlined destroy of Data(v19 + 16);
          }
          *(_OWORD *)(v19 + 16) = *(_OWORD *)v37;
          goto LABEL_46;
        }
        outlined destroy of Data(v19);
      }
      *(_OWORD *)v19 = *(_OWORD *)v20;
      goto LABEL_38;
    }
    outlined destroy of (confirmActionData: Data?, cancelActionData: Data?)(v19);
    v28 = *((_OWORD *)v20 + 1);
    *(_OWORD *)v19 = *(_OWORD *)v20;
    *(_OWORD *)(v19 + 16) = v28;
  }
LABEL_46:
  v41 = a3[8];
  v42 = (char *)a1 + v41;
  v43 = (char *)a2 + v41;
  *(_QWORD *)((char *)a1 + v41) = *(_QWORD *)((char *)a2 + v41);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)v42 + 1) = *((_QWORD *)v43 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  return a1;
}

_QWORD *initializeWithTake for GetContactAttributeSnippetModel(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  __int128 v14;
  __int128 v15;
  _OWORD *v16;
  _OWORD *v17;
  __int128 v18;
  uint64_t v19;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[6];
  v11 = a3[7];
  v12 = (char *)a1 + v10;
  v13 = (char *)a2 + v10;
  v14 = *(_OWORD *)v13;
  v15 = *((_OWORD *)v13 + 1);
  *((_QWORD *)v12 + 4) = *((_QWORD *)v13 + 4);
  *(_OWORD *)v12 = v14;
  *((_OWORD *)v12 + 1) = v15;
  v16 = (_OWORD *)((char *)a1 + v11);
  v17 = (_OWORD *)((char *)a2 + v11);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  v19 = a3[9];
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  *((_BYTE *)a1 + v19) = *((_BYTE *)a2 + v19);
  return a1;
}

_QWORD *assignWithTake for GetContactAttributeSnippetModel(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  unint64_t v19;
  unint64_t v21;
  __int128 v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = a3[6];
  v11 = (uint64_t)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = *(_QWORD *)((char *)a1 + v10 + 8);
  if (v13 >> 60 == 15)
    goto LABEL_4;
  v14 = *((_QWORD *)v12 + 1);
  if (v14 >> 60 == 15)
  {
    outlined destroy of Data(v11);
LABEL_4:
    *(_OWORD *)v11 = *(_OWORD *)v12;
    goto LABEL_6;
  }
  v15 = *(_QWORD *)v11;
  *(_QWORD *)v11 = *(_QWORD *)v12;
  *(_QWORD *)(v11 + 8) = v14;
  outlined consume of Data._Representation(v15, v13);
LABEL_6:
  *(_QWORD *)(v11 + 16) = *((_QWORD *)v12 + 2);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v11 + 24) = *((_QWORD *)v12 + 3);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v11 + 32) = *((_QWORD *)v12 + 4);
  swift_bridgeObjectRelease();
  v16 = a3[7];
  v17 = (uint64_t)a1 + v16;
  v18 = (char *)a2 + v16;
  v19 = *(_QWORD *)((char *)a1 + v16 + 8);
  if ((v19 & 0xF000000000000000) == 0xB000000000000000 || (v19 & 0xF000000000000000) == 0x7000000000000000)
    goto LABEL_18;
  v21 = *((_QWORD *)v18 + 1);
  if ((v21 & 0xF000000000000000) == 0xB000000000000000 || (v21 & 0xF000000000000000) == 0x7000000000000000)
  {
    outlined destroy of (confirmActionData: Data?, cancelActionData: Data?)(v17);
LABEL_18:
    v23 = *((_OWORD *)v18 + 1);
    *(_OWORD *)v17 = *(_OWORD *)v18;
    *(_OWORD *)(v17 + 16) = v23;
    goto LABEL_19;
  }
  if (v19 >> 60 != 15)
  {
    if (v21 >> 60 != 15)
    {
      v28 = *(_QWORD *)v17;
      *(_QWORD *)v17 = *(_QWORD *)v18;
      *(_QWORD *)(v17 + 8) = v21;
      outlined consume of Data._Representation(v28, v19);
      goto LABEL_25;
    }
    outlined destroy of Data(v17);
  }
  *(_OWORD *)v17 = *(_OWORD *)v18;
LABEL_25:
  v29 = v18 + 16;
  v30 = *(_QWORD *)(v17 + 24);
  if (v30 >> 60 != 15)
  {
    v31 = *((_QWORD *)v18 + 3);
    if (v31 >> 60 != 15)
    {
      v32 = *(_QWORD *)(v17 + 16);
      *(_QWORD *)(v17 + 16) = *v29;
      *(_QWORD *)(v17 + 24) = v31;
      outlined consume of Data._Representation(v32, v30);
      goto LABEL_19;
    }
    outlined destroy of Data(v17 + 16);
  }
  *(_OWORD *)(v17 + 16) = *(_OWORD *)v29;
LABEL_19:
  v24 = a3[8];
  v25 = (char *)a1 + v24;
  v26 = (char *)a2 + v24;
  *(_QWORD *)((char *)a1 + v24) = *(_QWORD *)((char *)a2 + v24);
  swift_bridgeObjectRelease();
  *((_QWORD *)v25 + 1) = *((_QWORD *)v26 + 1);
  swift_bridgeObjectRelease();
  *((_BYTE *)a1 + a3[9]) = *((_BYTE *)a2 + a3[9]);
  return a1;
}

uint64_t getEnumTagSinglePayload for GetContactAttributeSnippetModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_2461AA938(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    OUTLINED_FUNCTION_169(*a1);
    OUTLINED_FUNCTION_0_0();
  }
  else
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
    OUTLINED_FUNCTION_32_0((uint64_t)a1 + *(int *)(a3 + 20), a2, v6);
  }
}

uint64_t storeEnumTagSinglePayload for GetContactAttributeSnippetModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_2461AA9A0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_171();
  if (v3 == 0x7FFFFFFF)
  {
    *v1 = (v0 - 1);
    OUTLINED_FUNCTION_0_0();
  }
  else
  {
    v4 = v2;
    v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
    OUTLINED_FUNCTION_33_0((uint64_t)v1 + *(int *)(v4 + 20), v0, v0, v5);
  }
}

void type metadata completion function for GetContactAttributeSnippetModel()
{
  unint64_t v0;

  type metadata accessor for Loggable<CodableContact<CNContact>>();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t destroy for GetContactAttributeSnippetModel.DisplayAttribute()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for GetContactAttributeSnippetModel.DisplayAttribute(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for GetContactAttributeSnippetModel.DisplayAttribute(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for GetContactAttributeSnippetModel.DisplayAttribute(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for GetContactAttributeSnippetModel.DisplayAttribute(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 49))
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

uint64_t storeEnumTagSinglePayload for GetContactAttributeSnippetModel.DisplayAttribute(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 49) = 1;
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
    *(_BYTE *)(result + 49) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for GetContactAttributeSnippetModel.DisplayAttribute()
{
  OUTLINED_FUNCTION_65();
}

void type metadata accessor for GetContactAttributeSnippetModel.DisplayAttribute.AttributeType()
{
  OUTLINED_FUNCTION_65();
}

uint64_t initializeBufferWithCopyOfBuffer for ModifyContactAttributeSnippetModel(uint64_t a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  unint64_t v17;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  unint64_t v37;
  uint64_t v38;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v20 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v20 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    v7 = *a2;
    v8 = a2[1];
    v9 = *((_BYTE *)a2 + 16);
    outlined copy of ModifyContactAttributeSnippetModel.ContactAttributeToModify();
    *(_QWORD *)a1 = v7;
    *(_QWORD *)(a1 + 8) = v8;
    *(_BYTE *)(a1 + 16) = v9;
    *(_BYTE *)(a1 + 17) = *((_BYTE *)a2 + 17);
    v10 = a3[6];
    v11 = a1 + v10;
    v12 = (uint64_t)a2 + v10;
    v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
    v14 = a3[7];
    v15 = a1 + v14;
    v16 = (uint64_t *)((char *)a2 + v14);
    v17 = *(uint64_t *)((char *)a2 + v14 + 8);
    if ((v17 & 0xF000000000000000) == 0xB000000000000000 || (v17 & 0xF000000000000000) == 0x7000000000000000)
    {
      v19 = *((_OWORD *)v16 + 1);
      *(_OWORD *)v15 = *(_OWORD *)v16;
      *(_OWORD *)(v15 + 16) = v19;
    }
    else
    {
      if (v17 >> 60 == 15)
      {
        *(_OWORD *)v15 = *(_OWORD *)v16;
      }
      else
      {
        v21 = *v16;
        outlined copy of Data._Representation(*v16, v17);
        *(_QWORD *)v15 = v21;
        *(_QWORD *)(v15 + 8) = v17;
      }
      v22 = v16 + 2;
      v23 = v16[3];
      if (v23 >> 60 == 15)
      {
        *(_OWORD *)(v15 + 16) = *(_OWORD *)v22;
      }
      else
      {
        v24 = *v22;
        outlined copy of Data._Representation(*v22, v16[3]);
        *(_QWORD *)(v15 + 16) = v24;
        *(_QWORD *)(v15 + 24) = v23;
      }
    }
    v25 = a3[8];
    v26 = a1 + v25;
    v27 = (uint64_t)a2 + v25;
    v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 16))(v26, v27, v28);
    v29 = a3[9];
    v30 = a1 + v29;
    v31 = (uint64_t *)((char *)a2 + v29);
    v32 = v31[1];
    if (v32 >> 60 == 15)
    {
      *(_OWORD *)v30 = *(_OWORD *)v31;
    }
    else
    {
      v33 = *v31;
      outlined copy of Data._Representation(*v31, v31[1]);
      *(_QWORD *)v30 = v33;
      *(_QWORD *)(v30 + 8) = v32;
    }
    v34 = a3[10];
    v35 = a1 + v34;
    v36 = (uint64_t *)((char *)a2 + v34);
    v37 = v36[1];
    if (v37 >> 60 == 15)
    {
      *(_OWORD *)v35 = *(_OWORD *)v36;
    }
    else
    {
      v38 = *v36;
      outlined copy of Data._Representation(*v36, v36[1]);
      *(_QWORD *)v35 = v38;
      *(_QWORD *)(v35 + 8) = v37;
    }
  }
  return a1;
}

uint64_t destroy for ModifyContactAttributeSnippetModel(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  unint64_t v7;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t *v13;
  unint64_t v14;
  uint64_t *v15;
  unint64_t v16;

  outlined consume of ModifyContactAttributeSnippetModel.ContactAttributeToModify();
  v4 = a1 + a2[6];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = (uint64_t *)(a1 + a2[7]);
  v7 = v6[1];
  if ((v7 & 0xF000000000000000) != 0xB000000000000000 && (v7 & 0xF000000000000000) != 0x7000000000000000)
  {
    if (v7 >> 60 != 15)
      outlined consume of Data._Representation(*v6, v7);
    v9 = v6[3];
    if (v9 >> 60 != 15)
      outlined consume of Data._Representation(v6[2], v9);
  }
  v10 = a1 + a2[8];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  v13 = (uint64_t *)(a1 + a2[9]);
  v14 = v13[1];
  if (v14 >> 60 != 15)
    result = outlined consume of Data._Representation(*v13, v14);
  v15 = (uint64_t *)(a1 + a2[10]);
  v16 = v15[1];
  if (v16 >> 60 != 15)
    return outlined consume of Data._Representation(*v15, v16);
  return result;
}

uint64_t initializeWithCopy for ModifyContactAttributeSnippetModel(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  unint64_t v16;
  __int128 v18;
  uint64_t v19;
  uint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  unint64_t v35;
  uint64_t v36;

  v6 = *a2;
  v7 = a2[1];
  v8 = *((_BYTE *)a2 + 16);
  outlined copy of ModifyContactAttributeSnippetModel.ContactAttributeToModify();
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = v8;
  *(_BYTE *)(a1 + 17) = *((_BYTE *)a2 + 17);
  v9 = a3[6];
  v10 = a1 + v9;
  v11 = (uint64_t)a2 + v9;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
  v13 = a3[7];
  v14 = a1 + v13;
  v15 = (uint64_t *)((char *)a2 + v13);
  v16 = *(uint64_t *)((char *)a2 + v13 + 8);
  if ((v16 & 0xF000000000000000) == 0xB000000000000000 || (v16 & 0xF000000000000000) == 0x7000000000000000)
  {
    v18 = *((_OWORD *)v15 + 1);
    *(_OWORD *)v14 = *(_OWORD *)v15;
    *(_OWORD *)(v14 + 16) = v18;
  }
  else
  {
    if (v16 >> 60 == 15)
    {
      *(_OWORD *)v14 = *(_OWORD *)v15;
    }
    else
    {
      v19 = *v15;
      outlined copy of Data._Representation(*v15, v16);
      *(_QWORD *)v14 = v19;
      *(_QWORD *)(v14 + 8) = v16;
    }
    v20 = v15 + 2;
    v21 = v15[3];
    if (v21 >> 60 == 15)
    {
      *(_OWORD *)(v14 + 16) = *(_OWORD *)v20;
    }
    else
    {
      v22 = *v20;
      outlined copy of Data._Representation(*v20, v15[3]);
      *(_QWORD *)(v14 + 16) = v22;
      *(_QWORD *)(v14 + 24) = v21;
    }
  }
  v23 = a3[8];
  v24 = a1 + v23;
  v25 = (uint64_t)a2 + v23;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(v24, v25, v26);
  v27 = a3[9];
  v28 = a1 + v27;
  v29 = (uint64_t *)((char *)a2 + v27);
  v30 = v29[1];
  if (v30 >> 60 == 15)
  {
    *(_OWORD *)v28 = *(_OWORD *)v29;
  }
  else
  {
    v31 = *v29;
    outlined copy of Data._Representation(*v29, v29[1]);
    *(_QWORD *)v28 = v31;
    *(_QWORD *)(v28 + 8) = v30;
  }
  v32 = a3[10];
  v33 = a1 + v32;
  v34 = (uint64_t *)((char *)a2 + v32);
  v35 = v34[1];
  if (v35 >> 60 == 15)
  {
    *(_OWORD *)v33 = *(_OWORD *)v34;
  }
  else
  {
    v36 = *v34;
    outlined copy of Data._Representation(*v34, v34[1]);
    *(_QWORD *)v33 = v36;
    *(_QWORD *)(v33 + 8) = v35;
  }
  return a1;
}

uint64_t assignWithCopy for ModifyContactAttributeSnippetModel(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  unint64_t v16;
  unint64_t v18;
  __int128 v20;
  unint64_t v21;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  _OWORD *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t *v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t *v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;

  v6 = *a2;
  v7 = a2[1];
  v8 = *((_BYTE *)a2 + 16);
  outlined copy of ModifyContactAttributeSnippetModel.ContactAttributeToModify();
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = v8;
  outlined consume of ModifyContactAttributeSnippetModel.ContactAttributeToModify();
  *(_BYTE *)(a1 + 17) = *((_BYTE *)a2 + 17);
  v9 = a3[6];
  v10 = a1 + v9;
  v11 = (uint64_t)a2 + v9;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  v13 = a3[7];
  v14 = a1 + v13;
  v15 = (uint64_t *)((char *)a2 + v13);
  v16 = *(_QWORD *)(a1 + v13 + 8);
  if ((v16 & 0xF000000000000000) == 0xB000000000000000 || (v16 & 0xF000000000000000) == 0x7000000000000000)
  {
    v18 = v15[1];
    if ((v18 & 0xF000000000000000) == 0xB000000000000000 || (v18 & 0xF000000000000000) == 0x7000000000000000)
    {
      v20 = *((_OWORD *)v15 + 1);
      *(_OWORD *)v14 = *(_OWORD *)v15;
      *(_OWORD *)(v14 + 16) = v20;
      goto LABEL_39;
    }
    if (v18 >> 60 == 15)
    {
      *(_OWORD *)v14 = *(_OWORD *)v15;
    }
    else
    {
      v25 = *v15;
      outlined copy of Data._Representation(*v15, v15[1]);
      *(_QWORD *)v14 = v25;
      *(_QWORD *)(v14 + 8) = v18;
    }
    v26 = v15 + 2;
    v27 = v15[3];
    if (v27 >> 60 == 15)
    {
      *(_OWORD *)(v14 + 16) = *v26;
      goto LABEL_39;
    }
    v28 = *(_QWORD *)v26;
    goto LABEL_34;
  }
  v21 = v15[1];
  if ((v21 & 0xF000000000000000) == 0xB000000000000000 || (v21 & 0xF000000000000000) == 0x7000000000000000)
  {
    outlined destroy of (confirmActionData: Data?, cancelActionData: Data?)(v14);
    v23 = *((_OWORD *)v15 + 1);
    *(_OWORD *)v14 = *(_OWORD *)v15;
    *(_OWORD *)(v14 + 16) = v23;
    goto LABEL_39;
  }
  if (v16 >> 60 == 15)
  {
    if (v21 >> 60 != 15)
    {
      v24 = *v15;
      outlined copy of Data._Representation(*v15, v15[1]);
      *(_QWORD *)v14 = v24;
      *(_QWORD *)(v14 + 8) = v21;
      goto LABEL_31;
    }
    goto LABEL_29;
  }
  if (v21 >> 60 == 15)
  {
    outlined destroy of Data(v14);
LABEL_29:
    *(_OWORD *)v14 = *(_OWORD *)v15;
    goto LABEL_31;
  }
  v29 = *v15;
  outlined copy of Data._Representation(*v15, v15[1]);
  v30 = *(_QWORD *)v14;
  v31 = *(_QWORD *)(v14 + 8);
  *(_QWORD *)v14 = v29;
  *(_QWORD *)(v14 + 8) = v21;
  outlined consume of Data._Representation(v30, v31);
LABEL_31:
  v32 = v15 + 2;
  v27 = v15[3];
  if (*(_QWORD *)(v14 + 24) >> 60 == 15)
  {
    if (v27 >> 60 != 15)
    {
      v28 = *v32;
LABEL_34:
      outlined copy of Data._Representation(v28, v27);
      *(_QWORD *)(v14 + 16) = v28;
      *(_QWORD *)(v14 + 24) = v27;
      goto LABEL_39;
    }
    goto LABEL_37;
  }
  if (v27 >> 60 == 15)
  {
    outlined destroy of Data(v14 + 16);
LABEL_37:
    *(_OWORD *)(v14 + 16) = *(_OWORD *)v32;
    goto LABEL_39;
  }
  v33 = *v32;
  outlined copy of Data._Representation(*v32, v15[3]);
  v34 = *(_QWORD *)(v14 + 16);
  v35 = *(_QWORD *)(v14 + 24);
  *(_QWORD *)(v14 + 16) = v33;
  *(_QWORD *)(v14 + 24) = v27;
  outlined consume of Data._Representation(v34, v35);
LABEL_39:
  v36 = a3[8];
  v37 = a1 + v36;
  v38 = (uint64_t)a2 + v36;
  v39 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 24))(v37, v38, v39);
  v40 = a3[9];
  v41 = (uint64_t *)(a1 + v40);
  v42 = (uint64_t *)((char *)a2 + v40);
  v43 = *(uint64_t *)((char *)a2 + v40 + 8);
  if (*(_QWORD *)(a1 + v40 + 8) >> 60 == 15)
  {
    if (v43 >> 60 != 15)
    {
      v44 = *v42;
      outlined copy of Data._Representation(v44, v43);
      *v41 = v44;
      v41[1] = v43;
      goto LABEL_46;
    }
    goto LABEL_44;
  }
  if (v43 >> 60 == 15)
  {
    outlined destroy of Data((uint64_t)v41);
LABEL_44:
    *(_OWORD *)v41 = *(_OWORD *)v42;
    goto LABEL_46;
  }
  v45 = *v42;
  outlined copy of Data._Representation(v45, v43);
  v46 = *v41;
  v47 = v41[1];
  *v41 = v45;
  v41[1] = v43;
  outlined consume of Data._Representation(v46, v47);
LABEL_46:
  v48 = a3[10];
  v49 = (uint64_t *)(a1 + v48);
  v50 = (uint64_t *)((char *)a2 + v48);
  v51 = *(uint64_t *)((char *)a2 + v48 + 8);
  if (*(_QWORD *)(a1 + v48 + 8) >> 60 != 15)
  {
    if (v51 >> 60 != 15)
    {
      v53 = *v50;
      outlined copy of Data._Representation(v53, v51);
      v54 = *v49;
      v55 = v49[1];
      *v49 = v53;
      v49[1] = v51;
      outlined consume of Data._Representation(v54, v55);
      return a1;
    }
    outlined destroy of Data((uint64_t)v49);
    goto LABEL_51;
  }
  if (v51 >> 60 == 15)
  {
LABEL_51:
    *(_OWORD *)v49 = *(_OWORD *)v50;
    return a1;
  }
  v52 = *v50;
  outlined copy of Data._Representation(v52, v51);
  *v49 = v52;
  v49[1] = v51;
  return a1;
}

uint64_t initializeWithTake for ModifyContactAttributeSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[7];
  v11 = a3[8];
  v12 = (_OWORD *)(a1 + v10);
  v13 = (_OWORD *)(a2 + v10);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  v15 = a1 + v11;
  v16 = a2 + v11;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v15, v16, v17);
  v18 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v18) = *(_OWORD *)(a2 + v18);
  return a1;
}

uint64_t assignWithTake for ModifyContactAttributeSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v16;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t *v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v36;
  _OWORD *v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;

  v6 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v6;
  outlined consume of ModifyContactAttributeSnippetModel.ContactAttributeToModify();
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  v7 = a3[6];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[7];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = *(_QWORD *)(a1 + v11 + 8);
  if ((v14 & 0xF000000000000000) == 0xB000000000000000 || (v14 & 0xF000000000000000) == 0x7000000000000000)
    goto LABEL_13;
  v16 = *(_QWORD *)(v13 + 8);
  if ((v16 & 0xF000000000000000) == 0xB000000000000000 || (v16 & 0xF000000000000000) == 0x7000000000000000)
  {
    outlined destroy of (confirmActionData: Data?, cancelActionData: Data?)(v12);
LABEL_13:
    v18 = *(_OWORD *)(v13 + 16);
    *(_OWORD *)v12 = *(_OWORD *)v13;
    *(_OWORD *)(v12 + 16) = v18;
    goto LABEL_14;
  }
  if (v14 >> 60 == 15)
  {
LABEL_28:
    *(_OWORD *)v12 = *(_OWORD *)v13;
    goto LABEL_30;
  }
  if (v16 >> 60 == 15)
  {
    outlined destroy of Data(v12);
    goto LABEL_28;
  }
  v36 = *(_QWORD *)v12;
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *(_QWORD *)(v12 + 8) = v16;
  outlined consume of Data._Representation(v36, v14);
LABEL_30:
  v37 = (_OWORD *)(v13 + 16);
  v38 = *(_QWORD *)(v12 + 24);
  if (v38 >> 60 == 15)
  {
LABEL_33:
    *(_OWORD *)(v12 + 16) = *v37;
    goto LABEL_14;
  }
  v39 = *(_QWORD *)(v13 + 24);
  if (v39 >> 60 == 15)
  {
    outlined destroy of Data(v12 + 16);
    goto LABEL_33;
  }
  v40 = *(_QWORD *)(v12 + 16);
  *(_QWORD *)(v12 + 16) = *(_QWORD *)v37;
  *(_QWORD *)(v12 + 24) = v39;
  outlined consume of Data._Representation(v40, v38);
LABEL_14:
  v19 = a3[8];
  v20 = a1 + v19;
  v21 = a2 + v19;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 40))(v20, v21, v22);
  v23 = a3[9];
  v24 = a1 + v23;
  v25 = a2 + v23;
  v26 = *(_QWORD *)(a1 + v23 + 8);
  if (v26 >> 60 == 15)
  {
LABEL_17:
    *(_OWORD *)v24 = *(_OWORD *)v25;
    goto LABEL_19;
  }
  v27 = *(_QWORD *)(v25 + 8);
  if (v27 >> 60 == 15)
  {
    outlined destroy of Data(v24);
    goto LABEL_17;
  }
  v28 = *(_QWORD *)v24;
  *(_QWORD *)v24 = *(_QWORD *)v25;
  *(_QWORD *)(v24 + 8) = v27;
  outlined consume of Data._Representation(v28, v26);
LABEL_19:
  v29 = a3[10];
  v30 = (uint64_t *)(a1 + v29);
  v31 = (uint64_t *)(a2 + v29);
  v32 = *(_QWORD *)(a1 + v29 + 8);
  if (v32 >> 60 != 15)
  {
    v33 = v31[1];
    if (v33 >> 60 != 15)
    {
      v34 = *v30;
      *v30 = *v31;
      v30[1] = v33;
      outlined consume of Data._Representation(v34, v32);
      return a1;
    }
    outlined destroy of Data((uint64_t)v30);
  }
  *(_OWORD *)v30 = *(_OWORD *)v31;
  return a1;
}

uint64_t getEnumTagSinglePayload for ModifyContactAttributeSnippetModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_2461AB894(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((_DWORD)a2 == 254)
  {
    OUTLINED_FUNCTION_0_0();
  }
  else
  {
    v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
    if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    {
      v7 = v6;
      v8 = *(int *)(a3 + 24);
    }
    else
    {
      v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
      v8 = *(int *)(a3 + 32);
    }
    OUTLINED_FUNCTION_32_0(a1 + v8, a2, v7);
  }
}

uint64_t storeEnumTagSinglePayload for ModifyContactAttributeSnippetModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_2461AB928()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_171();
  if (v2 == 254)
  {
    *(_BYTE *)(v1 + 16) = -(char)v0;
    OUTLINED_FUNCTION_0_0();
  }
  else
  {
    v4 = v3;
    v5 = v2;
    v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<CodableContact<CNContact>>);
    if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == v5)
    {
      v7 = v6;
      v8 = *(int *)(v4 + 24);
    }
    else
    {
      v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Loggable<ContactsLabelCATContainer>);
      v8 = *(int *)(v4 + 32);
    }
    OUTLINED_FUNCTION_33_0(v1 + v8, v0, v0, v7);
  }
}

void type metadata completion function for ModifyContactAttributeSnippetModel()
{
  unint64_t v0;
  unint64_t v1;

  type metadata accessor for Loggable<CodableContact<CNContact>>();
  if (v0 <= 0x3F)
  {
    type metadata accessor for Loggable<ContactsLabelCATContainer>();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t destroy for ModifyContactAttributeSnippetModel.ContactAttributeToModify()
{
  return outlined consume of ModifyContactAttributeSnippetModel.ContactAttributeToModify();
}

uint64_t initializeBufferWithCopyOfBuffer for ModifyContactAttributeSnippetModel.ContactAttributeToModify(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  outlined copy of ModifyContactAttributeSnippetModel.ContactAttributeToModify();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ModifyContactAttributeSnippetModel.ContactAttributeToModify(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  outlined copy of ModifyContactAttributeSnippetModel.ContactAttributeToModify();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  outlined consume of ModifyContactAttributeSnippetModel.ContactAttributeToModify();
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

uint64_t assignWithTake for ModifyContactAttributeSnippetModel.ContactAttributeToModify(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  outlined consume of ModifyContactAttributeSnippetModel.ContactAttributeToModify();
  return a1;
}

uint64_t getEnumTagSinglePayload for ModifyContactAttributeSnippetModel.ContactAttributeToModify(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    {
      v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 1)
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

uint64_t storeEnumTagSinglePayload for ModifyContactAttributeSnippetModel.ContactAttributeToModify(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t getEnumTag for ModifyContactAttributeSnippetModel.ContactAttributeToModify(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t destructiveInjectEnumTag for ModifyContactAttributeSnippetModel.ContactAttributeToModify(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

void type metadata accessor for ModifyContactAttributeSnippetModel.ContactAttributeToModify()
{
  OUTLINED_FUNCTION_65();
}

void type metadata accessor for ModifyContactAttributeSnippetModel.ModificationType()
{
  OUTLINED_FUNCTION_65();
}

void initializeBufferWithCopyOfBuffer for ContactsLabelCATContainer(uint64_t a1, uint64_t *a2)
{
  OUTLINED_FUNCTION_148(*a2);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_12_1();
}

void type metadata accessor for ContactsLabelCATContainer()
{
  OUTLINED_FUNCTION_65();
}

void type metadata accessor for ContactsLabelCATContainer.LabelType()
{
  OUTLINED_FUNCTION_65();
}

uint64_t type metadata instantiation function for CodableContact()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata accessor for CodableContact(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CodableContact);
}

uint64_t type metadata instantiation function for CodableContact.Error()
{
  return swift_allocateGenericValueMetadata();
}

void *type metadata accessor for ContactsLabelCATContainer.CodingKeys()
{
  return &unk_251743110;
}

uint64_t getEnumTagSinglePayload for GetContactAttributeSnippetModel.DisplayAttribute.AttributeType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return OUTLINED_FUNCTION_118(-1);
  if (a2 < 0xF8)
    goto LABEL_17;
  if (a2 + 8 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 8) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return OUTLINED_FUNCTION_118((*a1 | (v4 << 8)) - 9);
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return OUTLINED_FUNCTION_118((*a1 | (v4 << 8)) - 9);
    }
    v4 = a1[1];
    if (a1[1])
      return OUTLINED_FUNCTION_118((*a1 | (v4 << 8)) - 9);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 9;
  v8 = v6 - 9;
  if (!v7)
    v8 = -1;
  return OUTLINED_FUNCTION_118(v8);
}

uint64_t storeEnumTagSinglePayload for GetContactAttributeSnippetModel.DisplayAttribute.AttributeType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 8 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 8) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF7)
    return ((uint64_t (*)(void))((char *)&loc_2461ABD6C + 4 * byte_2461AFB2A[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)j__OUTLINED_FUNCTION_117 + 4 * byte_2461AFB25[v4]))();
}

uint64_t sub_2461ABDA4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2461ABDACLL);
  return result;
}

uint64_t sub_2461ABDB4(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x2461ABDBCLL);
  return OUTLINED_FUNCTION_116();
}

void *type metadata accessor for ContactsLabelCATContainer.LabelType.CodingKeys()
{
  return &unk_2517431A0;
}

void *type metadata accessor for ContactsLabelCATContainer.LabelType.AgeUnitsCodingKeys()
{
  return &unk_2517431C0;
}

void *type metadata accessor for ContactsLabelCATContainer.LabelType.CallCodingKeys()
{
  return &unk_2517431E0;
}

void *type metadata accessor for ContactsLabelCATContainer.LabelType.CancelCodingKeys()
{
  return &unk_251743200;
}

void *type metadata accessor for ContactsLabelCATContainer.LabelType.GoCodingKeys()
{
  return &unk_251743220;
}

void *type metadata accessor for ContactsLabelCATContainer.LabelType.MailCodingKeys()
{
  return &unk_251743240;
}

void *type metadata accessor for ContactsLabelCATContainer.LabelType.MessageCodingKeys()
{
  return &unk_251743260;
}

void *type metadata accessor for ContactsLabelCATContainer.LabelType.SaveCodingKeys()
{
  return &unk_251743280;
}

void *type metadata accessor for ContactsLabelCATContainer.LabelType.SavedCodingKeys()
{
  return &unk_2517432A0;
}

void *type metadata accessor for ContactsLabelCATContainer.LabelType.VideoCodingKeys()
{
  return &unk_2517432C0;
}

uint64_t getEnumTagSinglePayload for ModifyContactAttributeSnippetModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFA)
  {
    if (a2 + 6 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 6) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 7;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v5 = v6 - 7;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ModifyContactAttributeSnippetModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_2461ABF40 + 4 * byte_2461AFB34[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_2461ABF74 + 4 * byte_2461AFB2F[v4]))();
}

uint64_t sub_2461ABF74(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2461ABF7C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2461ABF84);
  return result;
}

uint64_t sub_2461ABF90(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2461ABF98);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_2461ABF9C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2461ABFA4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void *type metadata accessor for ModifyContactAttributeSnippetModel.CodingKeys()
{
  return &unk_251743350;
}

void *type metadata accessor for ModifyContactAttributeSnippetModel.ModificationType.CodingKeys()
{
  return &unk_2517433E0;
}

void *type metadata accessor for ModifyContactAttributeSnippetModel.ModificationType.UnknownCodingKeys()
{
  return &unk_251743400;
}

void *type metadata accessor for ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys()
{
  return &unk_251743420;
}

void *type metadata accessor for ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys()
{
  return &unk_251743440;
}

void *type metadata accessor for ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys()
{
  return &unk_251743460;
}

void *type metadata accessor for ModifyContactAttributeSnippetModel.ContactAttributeToModify.CodingKeys()
{
  return &unk_2517434F0;
}

void *type metadata accessor for ModifyContactAttributeSnippetModel.ContactAttributeToModify.NicknameCodingKeys()
{
  return &unk_251743580;
}

void *type metadata accessor for ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys()
{
  return &unk_251743610;
}

uint64_t getEnumTagSinglePayload for GetContactAttributeSnippetModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFB)
  {
    if (a2 + 5 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 5) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v5 = v6 - 6;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for GetContactAttributeSnippetModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_2461AC114 + 4 * byte_2461AFB3E[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_2461AC148 + 4 * byte_2461AFB39[v4]))();
}

uint64_t sub_2461AC148(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2461AC150(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2461AC158);
  return result;
}

uint64_t sub_2461AC164(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2461AC16CLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_2461AC170(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2461AC178(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void *type metadata accessor for GetContactAttributeSnippetModel.CodingKeys()
{
  return &unk_2517436A0;
}

uint64_t getEnumTagSinglePayload for ModifyContactAttributeSnippetModel.ModificationType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return OUTLINED_FUNCTION_118(-1);
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
      return OUTLINED_FUNCTION_118((*a1 | (v4 << 8)) - 4);
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return OUTLINED_FUNCTION_118((*a1 | (v4 << 8)) - 4);
    }
    v4 = a1[1];
    if (a1[1])
      return OUTLINED_FUNCTION_118((*a1 | (v4 << 8)) - 4);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return OUTLINED_FUNCTION_118(v8);
}

uint64_t storeEnumTagSinglePayload for ModifyContactAttributeSnippetModel.ModificationType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2461AC264 + 4 * byte_2461AFB48[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)j__OUTLINED_FUNCTION_117_0 + 4 * byte_2461AFB43[v4]))();
}

uint64_t sub_2461AC29C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2461AC2A4);
  return result;
}

uint64_t sub_2461AC2AC(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x2461AC2B4);
  return OUTLINED_FUNCTION_116();
}

void *type metadata accessor for GetContactAttributeSnippetModel.DisplayAttribute.CodingKeys()
{
  return &unk_251743730;
}

uint64_t storeEnumTagSinglePayload for GetContactSnippetModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_2461AC320 + 4 * byte_2461AFB52[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_2461AC354 + 4 * byte_2461AFB4D[v4]))();
}

uint64_t sub_2461AC354(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2461AC35C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2461AC364);
  return result;
}

uint64_t sub_2461AC370(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2461AC378);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_2461AC37C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2461AC384(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void *type metadata accessor for GetContactSnippetModel.CodingKeys()
{
  return &unk_2517437C0;
}

void *type metadata accessor for ContactsSnippetFlowState.CodingKeys()
{
  return &unk_251743850;
}

uint64_t getEnumTagSinglePayload for ContactsLabelCATContainer.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return OUTLINED_FUNCTION_118(-1);
  if (a2 < 0xFF)
    goto LABEL_17;
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
    if (v4)
      return OUTLINED_FUNCTION_118((*a1 | (v4 << 8)) - 2);
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return OUTLINED_FUNCTION_118((*a1 | (v4 << 8)) - 2);
    }
    v4 = a1[1];
    if (a1[1])
      return OUTLINED_FUNCTION_118((*a1 | (v4 << 8)) - 2);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return OUTLINED_FUNCTION_118(v8);
}

uint64_t storeEnumTagSinglePayload for ContactsLabelCATContainer.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2461AC488 + 4 * byte_2461AFB5C[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)j__OUTLINED_FUNCTION_117_1 + 4 * byte_2461AFB57[v4]))();
}

uint64_t sub_2461AC4C0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2461AC4C8);
  return result;
}

uint64_t sub_2461AC4D0(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x2461AC4D8);
  return OUTLINED_FUNCTION_116();
}

_BYTE *destructiveInjectEnumTag for ContactsSnippetFlowState.ConfirmCodingKeys(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

void *type metadata accessor for ContactsSnippetFlowState.ConfirmCodingKeys()
{
  return &unk_2517438E0;
}

void *type metadata accessor for ContactsSnippetFlowState.IntentHandledCodingKeys()
{
  return &unk_251743900;
}

void *type metadata accessor for ContactsSnippetFlowState.UnsupportedCodingKeys()
{
  return &unk_251743920;
}

uint64_t getEnumTagSinglePayload for ContactsSnippetFlowState.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return OUTLINED_FUNCTION_118(-1);
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
      return OUTLINED_FUNCTION_118((*a1 | (v4 << 8)) - 3);
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return OUTLINED_FUNCTION_118((*a1 | (v4 << 8)) - 3);
    }
    v4 = a1[1];
    if (a1[1])
      return OUTLINED_FUNCTION_118((*a1 | (v4 << 8)) - 3);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return OUTLINED_FUNCTION_118(v8);
}

uint64_t storeEnumTagSinglePayload for ContactsSnippetFlowState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2461AC5F4 + 4 * byte_2461AFB66[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)j__OUTLINED_FUNCTION_117_2 + 4 * byte_2461AFB61[v4]))();
}

uint64_t sub_2461AC62C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2461AC634);
  return result;
}

uint64_t sub_2461AC63C(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x2461AC644);
  return OUTLINED_FUNCTION_116();
}

void *type metadata accessor for ContactsSnippetPluginModel.CodingKeys()
{
  return &unk_2517439B0;
}

void *type metadata accessor for ContactsSnippetPluginModel.GetContactCodingKeys()
{
  return &unk_251743A40;
}

void *type metadata accessor for ContactsSnippetPluginModel.GetContactAttributeCodingKeys()
{
  return &unk_251743AD0;
}

uint64_t getEnumTagSinglePayload for CodableContact.Error(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for CodableContact.Error(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2461AC714 + 4 * byte_2461AFB6B[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2461AC734 + 4 * byte_2461AFB70[v4]))();
}

_BYTE *sub_2461AC714(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2461AC734(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2461AC73C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2461AC744(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2461AC74C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2461AC754(_DWORD *result)
{
  *result = 0;
  return result;
}

void *type metadata accessor for ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys()
{
  return &unk_251743B60;
}

void base witness table accessor for Equatable in CodableContact<A>.CodingKeys()
{
  JUMPOUT(0x249552EA8);
}

void base witness table accessor for CustomDebugStringConvertible in CodableContact<A>.CodingKeys()
{
  JUMPOUT(0x249552EA8);
}

void base witness table accessor for CustomStringConvertible in CodableContact<A>.CodingKeys()
{
  JUMPOUT(0x249552EA8);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x249552E54](a1, v6, a5);
}

uint64_t OUTLINED_FUNCTION_2_7()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t OUTLINED_FUNCTION_4_8()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t OUTLINED_FUNCTION_5_7()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

void OUTLINED_FUNCTION_9_5(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 144) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_10_2(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 136) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_14_4()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_15_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, uint64_t))(v0 + 8))(*(_QWORD *)(v2 - 144), v1);
}

uint64_t OUTLINED_FUNCTION_16_4()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_17_4@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_18_3()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t OUTLINED_FUNCTION_19_3()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_20_2@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_21_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 104))(v3, a2, v2);
}

uint64_t OUTLINED_FUNCTION_22_3()
{
  return DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
}

uint64_t OUTLINED_FUNCTION_23_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_24_1@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_25_1()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t OUTLINED_FUNCTION_26_1()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t OUTLINED_FUNCTION_30_0()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_32_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_33_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_34_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_35()
{
  return Hasher.init(_seed:)();
}

uint64_t OUTLINED_FUNCTION_36_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 8))(v1, *(_QWORD *)(v2 - 152));
}

uint64_t OUTLINED_FUNCTION_37_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_38_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_39@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_40()
{
  return 0;
}

void OUTLINED_FUNCTION_41_0(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 152) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_42_0(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 176) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_44_0()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

Swift::Int OUTLINED_FUNCTION_45_0()
{
  return Hasher._finalize()();
}

uint64_t OUTLINED_FUNCTION_46_0()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_47_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_48_0()
{
  return Loggable.wrappedValue.modify();
}

void *OUTLINED_FUNCTION_49_0()
{
  return malloc(0x28uLL);
}

uint64_t OUTLINED_FUNCTION_51_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_52_0()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_53_0()
{
  return swift_unknownObjectRelease();
}

void OUTLINED_FUNCTION_54_0(uint64_t a1, void (*a2)(_QWORD))
{
  uint64_t v2;

  outlined destroy of ModifyContactAttributeSnippetModel(v2, a2);
}

uint64_t OUTLINED_FUNCTION_56_0()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_57_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_58_0()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_60_0()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_61_0()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_63_0()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t OUTLINED_FUNCTION_70()
{
  return type metadata accessor for GetContactSnippetModel(0);
}

uint64_t OUTLINED_FUNCTION_72()
{
  return type metadata accessor for GetContactAttributeSnippetModel(0);
}

_QWORD *OUTLINED_FUNCTION_73()
{
  _QWORD *v0;

  return __swift_project_boxed_opaque_existential_1(v0, v0[3]);
}

uint64_t OUTLINED_FUNCTION_74(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t OUTLINED_FUNCTION_76()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_77()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_78()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t OUTLINED_FUNCTION_82@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 112) = a1;
  return KeyedEncodingContainer.encode(_:forKey:)();
}

unint64_t OUTLINED_FUNCTION_83@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v1;
  __int128 v2;

  v2 = a1[1];
  *(_OWORD *)(v1 - 112) = *a1;
  *(_OWORD *)(v1 - 96) = v2;
  *(_BYTE *)(v1 - 65) = 3;
  return lazy protocol witness table accessor for type ContactsSnippetFlowState and conformance ContactsSnippetFlowState();
}

uint64_t OUTLINED_FUNCTION_84()
{
  unint64_t v0;
  uint64_t v1;

  return outlined consume of Data._Representation(v1, v0);
}

void OUTLINED_FUNCTION_85()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_86()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_87()
{
  return Loggable.wrappedValue.setter();
}

uint64_t OUTLINED_FUNCTION_88()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_89(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  return specialized ArraySlice.subscript.getter(a1, a2, a3, a4, 0, a6);
}

uint64_t OUTLINED_FUNCTION_91@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t OUTLINED_FUNCTION_92@<X0>(uint64_t a1@<X8>)
{
  return outlined consume of ContactsSnippetFlowState(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

uint64_t OUTLINED_FUNCTION_93()
{
  return type metadata accessor for GetContactAttributeSnippetModel(0);
}

void OUTLINED_FUNCTION_94(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 120) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_95(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 160) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_96(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 128) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_97(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 104) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_98(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 200) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_99()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_101(uint64_t result, unint64_t a2, uint64_t a3, unint64_t a4)
{
  return outlined copy of ContactsSnippetFlowState(result, a2, a3, a4);
}

void OUTLINED_FUNCTION_103(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  outlined init with take of ModifyContactAttributeSnippetModel(a1, a2, v2);
}

void OUTLINED_FUNCTION_104()
{
  Hasher._combine(_:)(0);
}

void OUTLINED_FUNCTION_105(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  Swift::UInt v10;

  Hasher._combine(_:)(v10);
}

uint64_t OUTLINED_FUNCTION_106()
{
  return type metadata accessor for ModifyContactAttributeSnippetModel(0);
}

uint64_t OUTLINED_FUNCTION_107()
{
  return type metadata accessor for DecodingError();
}

uint64_t OUTLINED_FUNCTION_108()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_110@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

__n128 OUTLINED_FUNCTION_111@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __n128 result;
  __int128 v6;

  v3 = v1 + a1;
  v4 = *(_QWORD *)(v3 + 32);
  result = *(__n128 *)v3;
  v6 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)(v2 - 112) = *(_OWORD *)v3;
  *(_OWORD *)(v2 - 96) = v6;
  *(_QWORD *)(v2 - 80) = v4;
  return result;
}

uint64_t OUTLINED_FUNCTION_112(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 104))(v3, a2, v2);
}

uint64_t OUTLINED_FUNCTION_113()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v1 + 8))(v0, *(_QWORD *)(v2 - 144));
}

uint64_t OUTLINED_FUNCTION_114(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_115(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

_BYTE *OUTLINED_FUNCTION_116@<X0>(_BYTE *result@<X0>, char a2@<W8>)
{
  *result = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_117(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_118@<X0>(int a1@<W8>)
{
  return (a1 + 1);
}

uint64_t OUTLINED_FUNCTION_119()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_121()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_122()
{
  return Loggable.wrappedValue.getter();
}

uint64_t OUTLINED_FUNCTION_124()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_125@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 + 8))();
}

uint64_t OUTLINED_FUNCTION_126@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (uint64_t *)(v2 + a1);
  result = *v3;
  v5 = v3[1];
  v6 = v3[2];
  v7 = v3[3];
  *v1 = *v3;
  v1[1] = v5;
  v1[2] = v6;
  v1[3] = v7;
  return result;
}

uint64_t OUTLINED_FUNCTION_128()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_130(uint64_t a1)
{
  _QWORD *v1;

  *v1 = a1;
  return type metadata accessor for ModifyContactAttributeSnippetModel(0);
}

void OUTLINED_FUNCTION_131()
{
  JUMPOUT(0x249552EA8);
}

void OUTLINED_FUNCTION_132()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 1;
}

uint64_t OUTLINED_FUNCTION_134()
{
  return type metadata accessor for GetContactAttributeSnippetModel(0);
}

uint64_t OUTLINED_FUNCTION_135()
{
  return type metadata accessor for GetContactSnippetModel(0);
}

uint64_t OUTLINED_FUNCTION_136()
{
  return Hasher.init(_seed:)();
}

uint64_t OUTLINED_FUNCTION_137(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  return a3(0);
}

uint64_t OUTLINED_FUNCTION_138()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 8))(v1, *(_QWORD *)(v2 - 160));
}

unint64_t OUTLINED_FUNCTION_139()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 70) = 3;
  return lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.GoCodingKeys and conformance ContactsLabelCATContainer.LabelType.GoCodingKeys();
}

unint64_t OUTLINED_FUNCTION_140()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 3;
  return lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.DeleteCodingKeys();
}

unint64_t OUTLINED_FUNCTION_141()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 3;
  return lazy protocol witness table accessor for type ContactsSnippetFlowState and conformance ContactsSnippetFlowState();
}

unint64_t OUTLINED_FUNCTION_143()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 68) = 5;
  return lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.MessageCodingKeys and conformance ContactsLabelCATContainer.LabelType.MessageCodingKeys();
}

uint64_t OUTLINED_FUNCTION_144()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_0(*(_QWORD *)(v0 - 120));
}

unint64_t OUTLINED_FUNCTION_145()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 67) = 6;
  return lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.SaveCodingKeys and conformance ContactsLabelCATContainer.LabelType.SaveCodingKeys();
}

uint64_t OUTLINED_FUNCTION_146()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t OUTLINED_FUNCTION_148(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  *v1 = a1;
  v1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_149()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_150()
{
  JUMPOUT(0x249552EA8);
}

uint64_t OUTLINED_FUNCTION_151()
{
  return Loggable.wrappedValue.setter();
}

uint64_t OUTLINED_FUNCTION_154()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_155()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t OUTLINED_FUNCTION_156()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_157()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_158()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_159()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_160()
{
  return static DeviceIdiom.== infix(_:_:)();
}

uint64_t OUTLINED_FUNCTION_161()
{
  uint64_t v0;

  return v0;
}

unint64_t OUTLINED_FUNCTION_163()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 8;
  return lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.VideoCodingKeys and conformance ContactsLabelCATContainer.LabelType.VideoCodingKeys();
}

unint64_t OUTLINED_FUNCTION_164()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 7;
  return lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.SavedCodingKeys and conformance ContactsLabelCATContainer.LabelType.SavedCodingKeys();
}

void OUTLINED_FUNCTION_165(_BYTE *a1@<X8>)
{
  char v1;

  *a1 = v1;
}

void OUTLINED_FUNCTION_167(uint64_t a1)
{
  lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel and conformance ModifyContactAttributeSnippetModel(a1);
}

uint64_t OUTLINED_FUNCTION_168()
{
  return type metadata accessor for ModifyContactAttributeSnippetModel(0);
}

uint64_t OUTLINED_FUNCTION_169@<X0>(unint64_t a1@<X8>)
{
  if (a1 >= 0xFFFFFFFF)
    LODWORD(a1) = -1;
  return (a1 + 1);
}

unint64_t OUTLINED_FUNCTION_172()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 71) = 2;
  return lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.CancelCodingKeys and conformance ContactsLabelCATContainer.LabelType.CancelCodingKeys();
}

unint64_t OUTLINED_FUNCTION_173()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 2;
  return lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.ReplaceCodingKeys();
}

unint64_t OUTLINED_FUNCTION_174()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 2;
  return lazy protocol witness table accessor for type ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.ModifyContactAttributeCodingKeys();
}

unint64_t OUTLINED_FUNCTION_175()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 96) = 2;
  return lazy protocol witness table accessor for type ContactsSnippetFlowState.UnsupportedCodingKeys and conformance ContactsSnippetFlowState.UnsupportedCodingKeys();
}

uint64_t OUTLINED_FUNCTION_176()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_177()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_178()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_181@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

unint64_t OUTLINED_FUNCTION_182()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 1;
  return lazy protocol witness table accessor for type ContactsSnippetPluginModel.GetContactAttributeCodingKeys and conformance ContactsSnippetPluginModel.GetContactAttributeCodingKeys();
}

unint64_t OUTLINED_FUNCTION_183()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 1;
  return lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys and conformance ModifyContactAttributeSnippetModel.ContactAttributeToModify.RelationshipCodingKeys();
}

unint64_t OUTLINED_FUNCTION_184()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 96) = 1;
  return lazy protocol witness table accessor for type ContactsSnippetFlowState.IntentHandledCodingKeys and conformance ContactsSnippetFlowState.IntentHandledCodingKeys();
}

unint64_t OUTLINED_FUNCTION_185()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 72) = 1;
  return lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.CallCodingKeys and conformance ContactsLabelCATContainer.LabelType.CallCodingKeys();
}

unint64_t OUTLINED_FUNCTION_186()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 67) = 1;
  return lazy protocol witness table accessor for type ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys and conformance ModifyContactAttributeSnippetModel.ModificationType.AddCodingKeys();
}

uint64_t OUTLINED_FUNCTION_187(uint64_t a1, ...)
{
  uint64_t (*v1)(char *, uint64_t);
  uint64_t v2;
  va_list va;

  va_start(va, a1);
  return v1(va, v2);
}

uint64_t OUTLINED_FUNCTION_188()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

unint64_t OUTLINED_FUNCTION_190()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 69) = 4;
  return lazy protocol witness table accessor for type ContactsLabelCATContainer.LabelType.MailCodingKeys and conformance ContactsLabelCATContainer.LabelType.MailCodingKeys();
}

uint64_t OUTLINED_FUNCTION_191()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_0(*(_QWORD *)(v0 - 136));
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t JSONDecoder.init()()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t CharacterSet.init(charactersIn:)()
{
  return MEMORY[0x24BDCB630]();
}

uint64_t static CharacterSet.urlPathAllowed.getter()
{
  return MEMORY[0x24BDCB660]();
}

uint64_t type metadata accessor for CharacterSet()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t static DateComponents._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCBCC0]();
}

uint64_t DateComponents.day.getter()
{
  return MEMORY[0x24BDCBCC8]();
}

uint64_t DateComponents.month.getter()
{
  return MEMORY[0x24BDCBD38]();
}

uint64_t type metadata accessor for DateComponents()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t LocalizedError.helpAnchor.getter()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t LocalizedError.failureReason.getter()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t LocalizedError.recoverySuggestion.getter()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t PersonNameComponents.givenName.setter()
{
  return MEMORY[0x24BDCCB28]();
}

uint64_t PersonNameComponents.familyName.setter()
{
  return MEMORY[0x24BDCCB38]();
}

uint64_t PersonNameComponents.middleName.setter()
{
  return MEMORY[0x24BDCCB48]();
}

uint64_t PersonNameComponents.namePrefix.setter()
{
  return MEMORY[0x24BDCCB68]();
}

uint64_t PersonNameComponents.nameSuffix.setter()
{
  return MEMORY[0x24BDCCB78]();
}

NSPersonNameComponents __swiftcall PersonNameComponents._bridgeToObjectiveC()()
{
  objc_class *v0;
  void *v1;
  NSPersonNameComponents result;

  v0 = (objc_class *)MEMORY[0x24BDCCBB0]();
  result._private = v1;
  result.super.isa = v0;
  return result;
}

uint64_t PersonNameComponents.phoneticRepresentation.setter()
{
  return MEMORY[0x24BDCCBC0]();
}

uint64_t PersonNameComponents.nickname.setter()
{
  return MEMORY[0x24BDCCBE0]();
}

uint64_t PersonNameComponents.init()()
{
  return MEMORY[0x24BDCCC00]();
}

uint64_t type metadata accessor for PersonNameComponents()
{
  return MEMORY[0x24BDCCC10]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x24BDCDAC0]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x24BDCDCA0]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t static Date.now.getter()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t type metadata accessor for Locale()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t type metadata accessor for Calendar.Identifier()
{
  return MEMORY[0x24BDCEF80]();
}

uint64_t Calendar.init(identifier:)()
{
  return MEMORY[0x24BDCEFA0]();
}

uint64_t Calendar.startOfDay(for:)()
{
  return MEMORY[0x24BDCEFC8]();
}

uint64_t Calendar.dateComponents(in:from:)()
{
  return MEMORY[0x24BDCF030]();
}

uint64_t Calendar.timeZone.getter()
{
  return MEMORY[0x24BDCF1C8]();
}

uint64_t Calendar.timeZone.setter()
{
  return MEMORY[0x24BDCF1D0]();
}

uint64_t type metadata accessor for Calendar()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t static TimeZone.current.getter()
{
  return MEMORY[0x24BDCF500]();
}

uint64_t type metadata accessor for TimeZone()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t Loggable.init(wrappedValue:)()
{
  return MEMORY[0x24BEAD338]();
}

uint64_t Loggable.wrappedValue.modify()
{
  return MEMORY[0x24BEAD340]();
}

uint64_t Loggable.wrappedValue.getter()
{
  return MEMORY[0x24BEAD348]();
}

uint64_t Loggable.wrappedValue.setter()
{
  return MEMORY[0x24BEAD350]();
}

uint64_t type metadata accessor for Loggable()
{
  return MEMORY[0x24BEAD360]();
}

uint64_t static DeviceIdiom.== infix(_:_:)()
{
  return MEMORY[0x24BEA8958]();
}

uint64_t type metadata accessor for DeviceIdiom()
{
  return MEMORY[0x24BEA89B0]();
}

uint64_t PhonemeData.asNameComponents(locale:)()
{
  return MEMORY[0x24BE92960]();
}

Swift::Bool __swiftcall PhonemeData.validateChecksum(fullName:)(Swift::String fullName)
{
  return MEMORY[0x24BE92968](fullName._countAndFlagsBits, fullName._object);
}

uint64_t type metadata accessor for PhonemeData()
{
  return MEMORY[0x24BE92970]();
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

uint64_t static DispatchQoS.userInitiated.getter()
{
  return MEMORY[0x24BEE54D0]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x24BEE5500]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x24BDCF808]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return MEMORY[0x24BEE02B0]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t String.data(using:allowLossyConversion:)()
{
  return MEMORY[0x24BDCFA38]();
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

uint64_t String.hash(into:)()
{
  return MEMORY[0x24BEE0B20]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x24BEE0BC0](a1._countAndFlagsBits, a1._object);
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t RawRepresentable<>.hashValue.getter()
{
  return MEMORY[0x24BEE1068]();
}

uint64_t RawRepresentable<>._rawHashValue(seed:)()
{
  return MEMORY[0x24BEE1070]();
}

uint64_t RawRepresentable<>.hash(into:)()
{
  return MEMORY[0x24BEE1078]();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return MEMORY[0x24BEE1080]();
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

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t Task.value.getter()
{
  return MEMORY[0x24BEE6AC0]();
}

uint64_t ThrowingTaskGroup.makeAsyncIterator()()
{
  return MEMORY[0x24BEE6B98]();
}

uint64_t _sScg8IteratorV4next9isolationxSgScA_pSgYi_tYaq_YKF()
{
  return MEMORY[0x24BEE6BB8]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)()
{
  return MEMORY[0x24BDCFFB0]();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return MEMORY[0x24BEE57A0]();
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

uint64_t StringProtocol.trimmingCharacters(in:)()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t StringProtocol.addingPercentEncoding(withAllowedCharacters:)()
{
  return MEMORY[0x24BDD0570]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x24BEE22C0]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE2510](a1);
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t type metadata accessor for DecodingError()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t type metadata accessor for ContinuousClock.Instant()
{
  return MEMORY[0x24BEE6DC8]();
}

uint64_t ContinuousClock.init()()
{
  return MEMORY[0x24BEE6E08]();
}

uint64_t type metadata accessor for ContinuousClock()
{
  return MEMORY[0x24BEE6E10]();
}

uint64_t dispatch thunk of InstantProtocol.advanced(by:)()
{
  return MEMORY[0x24BEE2AE0]();
}

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return MEMORY[0x24BEE2E58](isUnique, capacity);
}

Swift::Void __swiftcall _NativeDictionary.copy()()
{
  MEMORY[0x24BEE2E68]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x24BEE3068]();
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

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x24BEE3290](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t withThrowingTaskGroup<A, B>(of:returning:isolation:body:)()
{
  return MEMORY[0x24BEE6FA8]();
}

uint64_t KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t KeyedDecodingContainer.codingPath.getter()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x24BEE3350]();
}

{
  return MEMORY[0x24BEE3358]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t KeyedDecodingContainer.allKeys.getter()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t type metadata accessor for KeyedDecodingContainer()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent(_:forKey:)()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x24BEE34A0]();
}

{
  return MEMORY[0x24BEE34A8]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t type metadata accessor for KeyedEncodingContainer()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t withCheckedContinuation<A>(isolation:function:_:)()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t _getErrorEmbeddedNSError<A>(_:)()
{
  return MEMORY[0x24BEE3880]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t == infix<A>(_:_:)()
{
  return MEMORY[0x24BEE3BB8]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t dispatch thunk of Clock.now.getter()
{
  return MEMORY[0x24BEE7110]();
}

uint64_t dispatch thunk of Clock.sleep(until:tolerance:)()
{
  return MEMORY[0x24BEE7118]();
}

uint64_t Error.localizedDescription.getter()
{
  return MEMORY[0x24BDD0708]();
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

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x24BEE42E0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x24BEE42F8](a1);
}

Swift::Int __swiftcall Hasher.finalize()()
{
  return MEMORY[0x24BEE4320]();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t Hasher.init()()
{
  return MEMORY[0x24BEE4330]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t Duration.description.getter()
{
  return MEMORY[0x24BEE4830]();
}

uint64_t CodingKey.description.getter()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t CodingKey.debugDescription.getter()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t IDSCopyIDForEmailAddress()
{
  return MEMORY[0x24BE4F980]();
}

uint64_t IDSCopyIDForPhoneNumber()
{
  return MEMORY[0x24BE4F988]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
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

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

