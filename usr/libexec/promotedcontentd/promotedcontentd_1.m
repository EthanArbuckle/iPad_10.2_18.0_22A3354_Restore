uint64_t storeEnumTagSinglePayload for GroupConfig.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100159BB8 + 4 * byte_1001BA754[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_100159BEC + 4 * byte_1001BA74F[v4]))();
}

uint64_t sub_100159BEC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100159BF4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100159BFCLL);
  return result;
}

uint64_t sub_100159C08(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100159C10);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_100159C14(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100159C1C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for GroupConfig.CodingKeys()
{
  return &type metadata for GroupConfig.CodingKeys;
}

unint64_t sub_100159C3C()
{
  unint64_t result;

  result = qword_100267980;
  if (!qword_100267980)
  {
    result = swift_getWitnessTable(&unk_1001BA854, &type metadata for GroupConfig.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100267980);
  }
  return result;
}

unint64_t sub_100159C84()
{
  unint64_t result;

  result = qword_100267988;
  if (!qword_100267988)
  {
    result = swift_getWitnessTable(&unk_1001BA7C4, &type metadata for GroupConfig.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100267988);
  }
  return result;
}

unint64_t sub_100159CCC()
{
  unint64_t result;

  result = qword_100267990;
  if (!qword_100267990)
  {
    result = swift_getWitnessTable(&unk_1001BA7EC, &type metadata for GroupConfig.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100267990);
  }
  return result;
}

unint64_t sub_100159D20(unint64_t a1)
{
  unint64_t v1;
  Swift::String v2;
  Swift::String v3;
  void *object;
  Swift::String v5;
  unint64_t v6;
  _QWORD *v7;

  v1 = a1;
  if (a1 > 2)
  {
    _StringGuts.grow(_:)(64);
    v2._object = (void *)0x80000001001F5E50;
    v2._countAndFlagsBits = 0xD00000000000003DLL;
    String.append(_:)(v2);
    v3._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
    object = v3._object;
    String.append(_:)(v3);
    swift_bridgeObjectRelease(object);
    v5._countAndFlagsBits = 34;
    v5._object = (void *)0xE100000000000000;
    String.append(_:)(v5);
    v1 = 0;
    v6 = sub_10014D4A4();
    swift_allocError(&type metadata for DeserializationError, v6, 0, 0);
    *v7 = 0;
    v7[1] = 0xE000000000000000;
    swift_willThrow();
  }
  return v1;
}

uint64_t sub_100159E10(unint64_t a1)
{
  unint64_t v1;
  Swift::String v2;
  Swift::String v3;
  void *object;
  Swift::String v5;
  unint64_t v6;
  _QWORD *v7;

  v1 = a1;
  if (a1 > 8)
  {
    _StringGuts.grow(_:)(64);
    v2._object = (void *)0x80000001001F5E50;
    v2._countAndFlagsBits = 0xD00000000000003DLL;
    String.append(_:)(v2);
    v3._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
    object = v3._object;
    String.append(_:)(v3);
    swift_bridgeObjectRelease(object);
    v5._countAndFlagsBits = 34;
    v5._object = (void *)0xE100000000000000;
    String.append(_:)(v5);
    v6 = sub_10014D4A4();
    swift_allocError(&type metadata for DeserializationError, v6, 0, 0);
    *v7 = 0;
    v7[1] = 0xE000000000000000;
    swift_willThrow();
    return 9;
  }
  return v1;
}

uint64_t sub_100159F04(uint64_t result)
{
  Swift::String v1;
  Swift::String v2;
  void *object;
  Swift::String v4;
  unint64_t v5;
  _QWORD *v6;

  if (result)
  {
    if (result == 1)
    {
      return 1;
    }
    else
    {
      _StringGuts.grow(_:)(63);
      v1._object = (void *)0x80000001001F5E10;
      v1._countAndFlagsBits = 0xD00000000000003CLL;
      String.append(_:)(v1);
      v2._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
      object = v2._object;
      String.append(_:)(v2);
      swift_bridgeObjectRelease(object);
      v4._countAndFlagsBits = 34;
      v4._object = (void *)0xE100000000000000;
      String.append(_:)(v4);
      v5 = sub_10014D4A4();
      swift_allocError(&type metadata for DeserializationError, v5, 0, 0);
      *v6 = 0;
      v6[1] = 0xE000000000000000;
      return swift_willThrow();
    }
  }
  return result;
}

uint64_t sub_100159FF8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100008A18(&qword_100265B70);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for DeserializationError()
{
  return &type metadata for DeserializationError;
}

uint64_t static ObservabilityManager.create(with:database:)(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t inited;
  id v5;
  uint64_t v6;
  _BYTE v8[64];
  __int128 v9[2];

  sub_10000D4D8(a1, (uint64_t)v9);
  v3 = type metadata accessor for ObservabilityManagerBuilder();
  inited = swift_initStackObject(v3, v8);
  sub_100136930(v9, inited + 16);
  *(_QWORD *)(inited + 56) = a2;
  v5 = a2;
  v6 = sub_100144CE0();
  swift_setDeallocating(inited);
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0((_QWORD *)(inited + 16));

  return v6;
}

uint64_t ObservabilityManager.deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  sub_100146820(v0 + 24);
  return v0;
}

uint64_t ObservabilityManager.__deallocating_deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  sub_100146820(v0 + 24);
  return swift_deallocClassInstance(v0, 160, 7);
}

uint64_t type metadata accessor for ObservabilityManager()
{
  return objc_opt_self(_TtC7Metrics20ObservabilityManager);
}

Swift::Int sub_10015A13C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, 0);
  v0 = type metadata accessor for ExtendedUUID(0);
  v1 = sub_1000A3560(&qword_100267B10, (uint64_t (*)(uint64_t))&type metadata accessor for ExtendedUUID, (uint64_t)&protocol conformance descriptor for ExtendedUUID);
  dispatch thunk of Hashable.hash(into:)(v3, v0, v1);
  return Hasher._finalize()();
}

uint64_t sub_10015A1A8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = type metadata accessor for ExtendedUUID(0);
  v3 = sub_1000A3560(&qword_100267B10, (uint64_t (*)(uint64_t))&type metadata accessor for ExtendedUUID, (uint64_t)&protocol conformance descriptor for ExtendedUUID);
  return dispatch thunk of Hashable.hash(into:)(a1, v2, v3);
}

Swift::Int sub_10015A200(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[9];

  Hasher.init(_seed:)(v4, a1);
  v1 = type metadata accessor for ExtendedUUID(0);
  v2 = sub_1000A3560(&qword_100267B10, (uint64_t (*)(uint64_t))&type metadata accessor for ExtendedUUID, (uint64_t)&protocol conformance descriptor for ExtendedUUID);
  dispatch thunk of Hashable.hash(into:)(v4, v1, v2);
  return Hasher._finalize()();
}

uint64_t sub_10015A270(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ExtendedUUID(0);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_10015A2AC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ExtendedUUID(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_10015A2E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ExtendedUUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_10015A324(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ExtendedUUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_10015A368(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ExtendedUUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_10015A3AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ExtendedUUID(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_10015A3F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10015A3FC);
}

uint64_t sub_10015A3FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ExtendedUUID(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_10015A438(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ExtendedUUID(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_10015A478(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;

  result = type metadata accessor for ExtendedUUID(319);
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 256, 1, &v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t sub_10015A4E0()
{
  return sub_1000A3560(&qword_100267B08, type metadata accessor for BatchID, (uint64_t)&unk_1001BA9A0);
}

void sub_10015A560()
{
  id v0;
  id v1;
  NSString v2;
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t isUniquelyReferenced_nonNull_native;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  char v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  int64_t v33;
  int64_t v34;
  unint64_t v35;
  unint64_t v36;
  int64_t v37;
  unint64_t v38;
  int64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t inited;
  unint64_t v45;
  void *v46;
  NSString v47;
  Class isa;
  id v49;
  NSString v50;
  _BYTE v51[80];

  v0 = objc_msgSend((id)objc_opt_self(MetricsModuleClasses), "batchClass");
  swift_getObjCClassMetadata(v0);
  v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v2 = String._bridgeToObjectiveC()();
  v3 = objc_msgSend(v1, "initWithPath:", v2);

  if (!v3)
  {
    v27 = static os_log_type_t.error.getter(v4);
    sub_10003E180(0, (unint64_t *)&qword_100264750, OS_os_log_ptr);
    v28 = (void *)OS_os_log.init(subsystem:category:)(0xD000000000000015, 0x80000001001ED670, 0x76726573624F4345, 0xEF7974696C696261);
    os_log(_:dso:log:_:_:)(v27, &_mh_execute_header, v28, "Failed to open expired observability batch.", 43, 2, _swiftEmptyArrayStorage);

    v50 = String._bridgeToObjectiveC()();
    APSimulateCrash(5, v50, 0);

    return;
  }
  v5 = objc_msgSend(v3, "nextMetric");
  v49 = v3;
  if (v5)
  {
    v6 = v5;
    do
    {
      v8 = objc_msgSend((id)swift_unknownObjectRetain(v6), "metric");
      v9 = objc_msgSend(v6, "metric");
      v10 = *((_QWORD *)&_swiftEmptyDictionarySingleton + 2);
      if (v10)
      {
        v11 = sub_100138848((uint64_t)v9);
        if ((v12 & 1) != 0)
          v10 = *(_QWORD *)(*((_QWORD *)&_swiftEmptyDictionarySingleton + 7) + 8 * v11);
        else
          v10 = 0;
      }
      v13 = v10 + 1;
      if (__OFADD__(v10, 1))
      {
        __break(1u);
LABEL_46:
        __break(1u);
LABEL_47:
        __break(1u);
LABEL_48:
        __break(1u);
        goto LABEL_49;
      }
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(&_swiftEmptyDictionarySingleton);
      v16 = sub_100138848((uint64_t)v8);
      v17 = *((_QWORD *)&_swiftEmptyDictionarySingleton + 2);
      v18 = (v15 & 1) == 0;
      v19 = v17 + v18;
      if (__OFADD__(v17, v18))
        goto LABEL_46;
      v20 = v15;
      if (*((_QWORD *)&_swiftEmptyDictionarySingleton + 3) >= v19)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
          if ((v15 & 1) != 0)
            goto LABEL_4;
        }
        else
        {
          sub_1001411F4();
          if ((v20 & 1) != 0)
            goto LABEL_4;
        }
      }
      else
      {
        sub_1001405F4(v19, isUniquelyReferenced_nonNull_native);
        v21 = sub_100138848((uint64_t)v8);
        if ((v20 & 1) != (v22 & 1))
          goto LABEL_50;
        v16 = v21;
        if ((v20 & 1) != 0)
        {
LABEL_4:
          *(_QWORD *)(*((_QWORD *)&_swiftEmptyDictionarySingleton + 7) + 8 * v16) = v13;
          goto LABEL_5;
        }
      }
      *((_QWORD *)&_swiftEmptyDictionarySingleton + (v16 >> 6) + 8) |= 1 << v16;
      v23 = 8 * v16;
      *(_QWORD *)(*((_QWORD *)&_swiftEmptyDictionarySingleton + 6) + v23) = v8;
      *(_QWORD *)(*((_QWORD *)&_swiftEmptyDictionarySingleton + 7) + v23) = v13;
      v24 = *((_QWORD *)&_swiftEmptyDictionarySingleton + 2);
      v25 = __OFADD__(v24, 1);
      v26 = v24 + 1;
      if (v25)
        goto LABEL_48;
      *((_QWORD *)&_swiftEmptyDictionarySingleton + 2) = v26;
LABEL_5:
      swift_bridgeObjectRelease(0x8000000000000000);
      v7 = objc_msgSend(v49, "nextMetric");
      swift_unknownObjectRelease_n(v6, 2);
      v6 = v7;
    }
    while (v7);
  }
  v29 = (char *)&_swiftEmptyDictionarySingleton + 64;
  v30 = 1 << *((_BYTE *)&_swiftEmptyDictionarySingleton + 32);
  v31 = -1;
  if (v30 < 64)
    v31 = ~(-1 << v30);
  v32 = v31 & *((_QWORD *)&_swiftEmptyDictionarySingleton + 8);
  v33 = (unint64_t)(v30 + 63) >> 6;
  swift_bridgeObjectRetain(&_swiftEmptyDictionarySingleton);
  v34 = 0;
  while (v32)
  {
    v35 = __clz(__rbit64(v32));
    v32 &= v32 - 1;
    v36 = v35 | (v34 << 6);
LABEL_42:
    v40 = *(_QWORD *)(*((_QWORD *)&_swiftEmptyDictionarySingleton + 6) + 8 * v36);
    if ((unint64_t)(v40 - 2801) < 3)
    {
      v41 = *(_QWORD *)(*((_QWORD *)&_swiftEmptyDictionarySingleton + 7) + 8 * v36);
      v42 = 2803 - v40;
      v43 = sub_100008A18(&qword_100265F70);
      inited = swift_initStackObject(v43, v51);
      *(_OWORD *)(inited + 16) = xmmword_1001B77A0;
      strcpy((char *)(inited + 32), "metricsCount");
      *(_BYTE *)(inited + 45) = 0;
      *(_WORD *)(inited + 46) = -5120;
      *(_QWORD *)(inited + 48) = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithInteger:", v41);
      *(_QWORD *)(inited + 56) = 1701869940;
      *(_QWORD *)(inited + 64) = 0xE400000000000000;
      *(_QWORD *)(inited + 72) = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithInteger:", v42);
      v45 = sub_10013E6E8(inited);
      v46 = (void *)objc_opt_self(APAnalytics);
      v47 = String._bridgeToObjectiveC()();
      sub_10003E180(0, (unint64_t *)&qword_100265F78, NSObject_ptr);
      isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v45);
      objc_msgSend(v46, "sendEvent:customPayload:", v47, isa);

    }
  }
  v37 = v34 + 1;
  if (__OFADD__(v34, 1))
    goto LABEL_47;
  if (v37 >= v33)
  {
LABEL_44:
    swift_release(&_swiftEmptyDictionarySingleton);
    swift_bridgeObjectRelease(&_swiftEmptyDictionarySingleton);
    swift_unknownObjectRelease(v49);
    return;
  }
  v38 = *(_QWORD *)&v29[8 * v37];
  ++v34;
  if (v38)
    goto LABEL_41;
  v34 = v37 + 1;
  if (v37 + 1 >= v33)
    goto LABEL_44;
  v38 = *(_QWORD *)&v29[8 * v34];
  if (v38)
    goto LABEL_41;
  v34 = v37 + 2;
  if (v37 + 2 >= v33)
    goto LABEL_44;
  v38 = *(_QWORD *)&v29[8 * v34];
  if (v38)
  {
LABEL_41:
    v32 = (v38 - 1) & v38;
    v36 = __clz(__rbit64(v38)) + (v34 << 6);
    goto LABEL_42;
  }
  v39 = v37 + 3;
  if (v39 >= v33)
    goto LABEL_44;
  v38 = *(_QWORD *)&v29[8 * v39];
  if (v38)
  {
    v34 = v39;
    goto LABEL_41;
  }
  while (1)
  {
    v34 = v39 + 1;
    if (__OFADD__(v39, 1))
      break;
    if (v34 >= v33)
      goto LABEL_44;
    v38 = *(_QWORD *)&v29[8 * v34];
    ++v39;
    if (v38)
      goto LABEL_41;
  }
LABEL_49:
  __break(1u);
LABEL_50:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for Int);
  __break(1u);
}

id sub_10015AB6C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ExpiredObservabilityBatchesReporter();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ExpiredObservabilityBatchesReporter()
{
  return objc_opt_self(APExpiredObservabilityBatchesReporter);
}

unint64_t sub_10015ABD0(unint64_t result, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  a4[(result >> 6) + 8] |= 1 << result;
  v4 = 8 * result;
  *(_QWORD *)(a4[6] + v4) = a2;
  *(_QWORD *)(a4[7] + v4) = a3;
  v5 = a4[2];
  v6 = __OFADD__(v5, 1);
  v7 = v5 + 1;
  if (v6)
    __break(1u);
  else
    a4[2] = v7;
  return result;
}

uint64_t sub_10015AC18(unint64_t a1, char a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_BYTE *)(a4[6] + a1) = a2;
  v7 = a4[7];
  v8 = type metadata accessor for Date(0);
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v7 + *(_QWORD *)(*(_QWORD *)(v8 - 8) + 72) * a1, a3, v8);
  v10 = a4[2];
  v11 = __OFADD__(v10, 1);
  v12 = v10 + 1;
  if (v11)
    __break(1u);
  else
    a4[2] = v12;
  return result;
}

uint64_t sub_10015ACA4(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSNumber v17;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v19;
  char v20;
  unint64_t v21;
  uint64_t v22;
  _BOOL8 v23;
  uint64_t v24;
  char v25;
  unint64_t v26;
  char v27;
  _QWORD *v28;
  uint64_t *v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t result;
  uint64_t v34;
  int64_t v35;
  int64_t v37;
  _QWORD *v38;

  v3 = 1 << *(_BYTE *)(a1 + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *(_QWORD *)(a1 + 56);
  v35 = (unint64_t)(v3 + 63) >> 6;
  swift_bridgeObjectRetain(a1);
  for (i = 0; ; i = v37)
  {
    if (v5)
    {
      v5 &= v5 - 1;
      v37 = i;
    }
    else
    {
      v10 = i + 1;
      if (__OFADD__(i, 1))
        goto LABEL_38;
      if (v10 >= v35)
        return swift_release(a1);
      v11 = *(_QWORD *)(v34 + 8 * v10);
      v12 = i + 1;
      if (!v11)
      {
        v12 = i + 2;
        if (i + 2 >= v35)
          return swift_release(a1);
        v11 = *(_QWORD *)(v34 + 8 * v12);
        if (!v11)
        {
          v12 = i + 3;
          if (i + 3 >= v35)
            return swift_release(a1);
          v11 = *(_QWORD *)(v34 + 8 * v12);
          if (!v11)
          {
            v12 = i + 4;
            if (i + 4 >= v35)
              return swift_release(a1);
            v11 = *(_QWORD *)(v34 + 8 * v12);
            if (!v11)
            {
              v13 = i + 5;
              if (i + 5 >= v35)
                return swift_release(a1);
              v11 = *(_QWORD *)(v34 + 8 * v13);
              if (!v11)
              {
                while (1)
                {
                  v12 = v13 + 1;
                  if (__OFADD__(v13, 1))
                    goto LABEL_39;
                  if (v12 >= v35)
                    return swift_release(a1);
                  v11 = *(_QWORD *)(v34 + 8 * v12);
                  ++v13;
                  if (v11)
                    goto LABEL_23;
                }
              }
              v12 = i + 5;
            }
          }
        }
      }
LABEL_23:
      v5 = (v11 - 1) & v11;
      v37 = v12;
    }
    v14 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
    v16 = v15;
    v17.super.super.isa = Int._bridgeToObjectiveC()().super.super.isa;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*a2);
    v19 = *a2;
    v38 = (_QWORD *)*a2;
    *a2 = 0x8000000000000000;
    v21 = sub_10002DDCC(v14, v16);
    v22 = *(_QWORD *)(v19 + 16);
    v23 = (v20 & 1) == 0;
    v24 = v22 + v23;
    if (__OFADD__(v22, v23))
      break;
    v25 = v20;
    if (*(_QWORD *)(v19 + 24) >= v24)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v28 = v38;
        if ((v20 & 1) != 0)
          goto LABEL_4;
      }
      else
      {
        sub_100141380();
        v28 = v38;
        if ((v25 & 1) != 0)
          goto LABEL_4;
      }
    }
    else
    {
      sub_100140898(v24, isUniquelyReferenced_nonNull_native);
      v26 = sub_10002DDCC(v14, v16);
      if ((v25 & 1) != (v27 & 1))
        goto LABEL_40;
      v21 = v26;
      v28 = v38;
      if ((v25 & 1) != 0)
      {
LABEL_4:
        v7 = v28[7];
        v8 = 8 * v21;

        *(NSNumber *)(v7 + v8) = v17;
        goto LABEL_5;
      }
    }
    v28[(v21 >> 6) + 8] |= 1 << v21;
    v29 = (uint64_t *)(v28[6] + 16 * v21);
    *v29 = v14;
    v29[1] = v16;
    *(NSNumber *)(v28[7] + 8 * v21) = v17;
    v30 = v28[2];
    v31 = __OFADD__(v30, 1);
    v32 = v30 + 1;
    if (v31)
      goto LABEL_37;
    v28[2] = v32;
    swift_bridgeObjectRetain(v16);
LABEL_5:
    v9 = *a2;
    *a2 = v28;
    swift_bridgeObjectRelease(v16);
    swift_bridgeObjectRelease(v9);
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

unint64_t sub_10015AFB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t inited;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  Class isa;
  unint64_t v8;
  _BYTE v9[80];

  v1 = sub_100008A18(&qword_100265FA0);
  inited = swift_initStackObject(v1, v9);
  *(_OWORD *)(inited + 16) = xmmword_1001B77A0;
  strcpy((char *)(inited + 32), "date_MMDDHHmm");
  *(_WORD *)(inited + 46) = -4864;
  *(_QWORD *)(inited + 48) = sub_10015B0DC();
  *(_QWORD *)(inited + 56) = 0x73726F727265;
  *(_QWORD *)(inited + 64) = 0xE600000000000000;
  v8 = sub_10013E6D0((uint64_t)_swiftEmptyArrayStorage);
  v3 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for ObservabilityCommunicationReport(0) + 20));
  v4 = swift_bridgeObjectRetain(v3);
  sub_10015ACA4(v4, &v8);
  swift_bridgeObjectRelease(v3);
  v5 = v8;
  sub_10003E180(0, (unint64_t *)&qword_100265FB0, NSNumber_ptr);
  swift_bridgeObjectRetain(v5);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease_n(v5, 2);
  *(_QWORD *)(inited + 72) = isa;
  return sub_10013E6DC(inited);
}

unint64_t sub_10015B0DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t result;
  char v19;
  char v20;
  char v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v1 = type metadata accessor for TimeZone(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for Calendar(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DateComponents(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100264E60 != -1)
    swift_once(&qword_100264E60, sub_10012F9C0);
  v13 = sub_10000ABD8(v5, (uint64_t)qword_10026D1E0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v13, v5);
  if (qword_100264E80 != -1)
    swift_once(&qword_100264E80, sub_10015B3D8);
  v14 = sub_10000ABD8(v1, (uint64_t)qword_10026D228);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v14, v1);
  Calendar.dateComponents(in:from:)(v4, v0);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_10003E180(0, (unint64_t *)&qword_100265FD0, NSString_ptr);
  v15 = (void *)NSString.init(stringLiteral:)("%02d%02d%02d%02d", v26, v27, v28, v29);
  v16 = sub_100008A18((uint64_t *)&unk_1002653F0);
  v17 = swift_allocObject(v16, 192, 7);
  *(_OWORD *)(v17 + 16) = xmmword_1001B88D0;
  result = DateComponents.month.getter();
  if ((v19 & 1) != 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  *(_QWORD *)(v17 + 56) = &type metadata for Int;
  *(_QWORD *)(v17 + 64) = &protocol witness table for Int;
  *(_QWORD *)(v17 + 32) = result;
  result = DateComponents.day.getter(result);
  if ((v20 & 1) != 0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  *(_QWORD *)(v17 + 96) = &type metadata for Int;
  *(_QWORD *)(v17 + 104) = &protocol witness table for Int;
  *(_QWORD *)(v17 + 72) = result;
  result = DateComponents.hour.getter();
  if ((v21 & 1) != 0)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  *(_QWORD *)(v17 + 136) = &type metadata for Int;
  *(_QWORD *)(v17 + 144) = &protocol witness table for Int;
  *(_QWORD *)(v17 + 112) = result;
  result = DateComponents.minute.getter(result);
  if ((v22 & 1) == 0)
  {
    *(_QWORD *)(v17 + 176) = &type metadata for Int;
    *(_QWORD *)(v17 + 184) = &protocol witness table for Int;
    if ((result & 0x8000000000000000) == 0)
    {
      v23 = 15 * (result / 0xF);
LABEL_13:
      *(_QWORD *)(v17 + 152) = v23;
      v25 = NSString.init(format:_:)(v15, v17);

      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      return v25;
    }
    v23 = -15 * (-(uint64_t)result / 0xFuLL);
    if (v23 == result)
      goto LABEL_13;
    v24 = __OFSUB__(v23, 15);
    v23 -= 15;
    if (!v24)
      goto LABEL_13;
    __break(1u);
    goto LABEL_15;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_10015B3D8()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  sub_100008A18(&qword_1002654D8);
  __chkstk_darwin();
  v1 = (char *)&v6 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for TimeZone(0);
  sub_10012FAA4(v2, qword_10026D228);
  v3 = sub_10000ABD8(v2, (uint64_t)qword_10026D228);
  TimeZone.init(abbreviation:)(4412501, 0xE300000000000000);
  v4 = *(_QWORD *)(v2 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48))(v1, 1, v2);
  if ((_DWORD)result != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v4 + 32))(v3, v1, v2);
  __break(1u);
  return result;
}

uint64_t destroy for GroupConfigOutput(_QWORD *a1)
{
  swift_bridgeObjectRelease(a1[1]);
  swift_bridgeObjectRelease(a1[7]);
  swift_bridgeObjectRelease(a1[9]);
  swift_bridgeObjectRelease(a1[11]);
  swift_bridgeObjectRelease(a1[13]);
  swift_bridgeObjectRelease(a1[15]);
  swift_bridgeObjectRelease(a1[17]);
  return swift_bridgeObjectRelease(a1[18]);
}

uint64_t initializeWithCopy for GroupConfigOutput(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v4 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v4;
  v5 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v5;
  v6 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v6;
  v7 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v7;
  v8 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v8;
  v9 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v9;
  v10 = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 144) = v10;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRetain(v10);
  return a1;
}

uint64_t assignWithCopy for GroupConfigOutput(uint64_t a1, uint64_t a2)
{
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

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  v6 = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v6;
  v7 = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v8 = *(_QWORD *)(a2 + 56);
  v9 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 56) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  v10 = *(_QWORD *)(a2 + 72);
  v11 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a1 + 72) = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  v12 = *(_QWORD *)(a2 + 88);
  v13 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 88) = v12;
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRelease(v13);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  v14 = *(_QWORD *)(a2 + 104);
  v15 = *(_QWORD *)(a1 + 104);
  *(_QWORD *)(a1 + 104) = v14;
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRelease(v15);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  v16 = *(_QWORD *)(a2 + 120);
  v17 = *(_QWORD *)(a1 + 120);
  *(_QWORD *)(a1 + 120) = v16;
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRelease(v17);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  v18 = *(_QWORD *)(a2 + 136);
  v19 = *(_QWORD *)(a1 + 136);
  *(_QWORD *)(a1 + 136) = v18;
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRelease(v19);
  v20 = *(_QWORD *)(a1 + 144);
  v21 = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 144) = v21;
  swift_bridgeObjectRetain(v21);
  swift_bridgeObjectRelease(v20);
  return a1;
}

__n128 initializeWithTake for GroupConfigOutput(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;
  __int128 v7;
  __int128 v8;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  result = *(__n128 *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  v8 = *(_OWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  *(__n128 *)(a1 + 96) = result;
  return result;
}

uint64_t assignWithTake for GroupConfigOutput(uint64_t a1, uint64_t a2)
{
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

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v6 = *(_QWORD *)(a2 + 56);
  v7 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  swift_bridgeObjectRelease(v7);
  v8 = *(_QWORD *)(a2 + 72);
  v9 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v8;
  swift_bridgeObjectRelease(v9);
  v10 = *(_QWORD *)(a2 + 88);
  v11 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v10;
  swift_bridgeObjectRelease(v11);
  v12 = *(_QWORD *)(a2 + 104);
  v13 = *(_QWORD *)(a1 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v12;
  swift_bridgeObjectRelease(v13);
  v14 = *(_QWORD *)(a2 + 120);
  v15 = *(_QWORD *)(a1 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v14;
  swift_bridgeObjectRelease(v15);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 136));
  v16 = *(_QWORD *)(a1 + 144);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  swift_bridgeObjectRelease(v16);
  return a1;
}

uint64_t getEnumTagSinglePayload for GroupConfigOutput(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 152))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for GroupConfigOutput(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 152) = 1;
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
    *(_BYTE *)(result + 152) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for GroupConfigOutput()
{
  return &type metadata for GroupConfigOutput;
}

uint64_t sub_10015B8D0(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_10015B8FC
                                                            + 4 * asc_1001BAA90[a1]))(1701667182, 0xE400000000000000);
}

uint64_t sub_10015B8FC()
{
  return 0x61566D6F646E6172;
}

uint64_t sub_10015B91C()
{
  return 0x65736F70727570;
}

uint64_t sub_10015B934()
{
  return 0x746E65696C63;
}

uint64_t sub_10015B948()
{
  return 0x7461447472617473;
}

uint64_t sub_10015B964()
{
  return 0x6144657269707865;
}

uint64_t sub_10015B980()
{
  return 0x6F72477265707573;
}

uint64_t sub_10015B9A0()
{
  return 0x7265506563617267;
}

uint64_t sub_10015B9C0()
{
  return 0x6E656B6F74;
}

uint64_t sub_10015B9D4()
{
  return 0x65676E6172;
}

uint64_t sub_10015B9E8(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
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
  uint64_t v33;
  char v34;
  char v35[8];
  _BYTE v36[8];

  v3 = v1;
  v5 = sub_100008A18(&qword_100267B58);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_10000B748(a1, v9);
  v11 = sub_10015CE64();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for GroupConfigOutput.CodingKeys, &type metadata for GroupConfigOutput.CodingKeys, v11, v9, v10);
  v12 = *v3;
  v13 = v3[1];
  v35[0] = 0;
  KeyedEncodingContainer.encode(_:forKey:)(v12, v13, v35, v5);
  if (!v2)
  {
    v14 = v3[2];
    v15 = *((unsigned __int8 *)v3 + 24);
    v35[0] = 1;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v14, v15, v35, v5);
    v16 = v3[4];
    v17 = *((unsigned __int8 *)v3 + 40);
    v35[0] = 2;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v16, v17, v35, v5);
    v18 = v3[6];
    v19 = v3[7];
    v35[0] = 3;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v18, v19, v35, v5);
    v20 = v3[8];
    v21 = v3[9];
    v35[0] = 4;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v20, v21, v35, v5);
    v22 = v3[10];
    v23 = v3[11];
    v35[0] = 5;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v22, v23, v35, v5);
    v24 = v3[12];
    v25 = v3[13];
    v35[0] = 6;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v24, v25, v35, v5);
    v26 = v3[14];
    v27 = v3[15];
    v35[0] = 7;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v26, v27, v35, v5);
    v28 = v3[16];
    v29 = v3[17];
    v35[0] = 8;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v28, v29, v35, v5);
    sub_100159A34((uint64_t)(v3 + 18), (uint64_t)v36);
    sub_100159A34((uint64_t)v36, (uint64_t)v35);
    v34 = 9;
    v30 = sub_100008A18(&qword_1002663C8);
    v31 = sub_100159A7C(&qword_100267978, (uint64_t)&protocol witness table for Int, (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v35, &v34, v5, v30, v31);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_10015BC90()
{
  unsigned __int8 *v0;

  return sub_10015B8D0(*v0);
}

uint64_t sub_10015BC98@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_10015C25C(a1, a2);
  *a3 = result;
  return result;
}

void sub_10015BCBC(_BYTE *a1@<X8>)
{
  *a1 = 10;
}

uint64_t sub_10015BCC8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10015CE64();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10015BCF0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10015CE64();
  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_10015BD18@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v9[9];
  uint64_t v10;

  sub_10015C690(a1, (uint64_t)v9);
  if (!v2)
  {
    v5 = v9[7];
    *(_OWORD *)(a2 + 96) = v9[6];
    *(_OWORD *)(a2 + 112) = v5;
    *(_OWORD *)(a2 + 128) = v9[8];
    *(_QWORD *)(a2 + 144) = v10;
    v6 = v9[3];
    *(_OWORD *)(a2 + 32) = v9[2];
    *(_OWORD *)(a2 + 48) = v6;
    v7 = v9[5];
    *(_OWORD *)(a2 + 64) = v9[4];
    *(_OWORD *)(a2 + 80) = v7;
    result = *(double *)v9;
    v8 = v9[1];
    *(_OWORD *)a2 = v9[0];
    *(_OWORD *)(a2 + 16) = v8;
  }
  return result;
}

uint64_t sub_10015BD88(_QWORD *a1)
{
  return sub_10015B9E8(a1);
}

BOOL sub_10015BDE0(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v11[9];
  uint64_t v12;
  _OWORD v13[9];
  uint64_t v14;

  v2 = *(_OWORD *)(a1 + 112);
  v11[6] = *(_OWORD *)(a1 + 96);
  v11[7] = v2;
  v11[8] = *(_OWORD *)(a1 + 128);
  v12 = *(_QWORD *)(a1 + 144);
  v3 = *(_OWORD *)(a1 + 48);
  v11[2] = *(_OWORD *)(a1 + 32);
  v11[3] = v3;
  v4 = *(_OWORD *)(a1 + 80);
  v11[4] = *(_OWORD *)(a1 + 64);
  v11[5] = v4;
  v5 = *(_OWORD *)(a1 + 16);
  v11[0] = *(_OWORD *)a1;
  v11[1] = v5;
  v6 = *(_OWORD *)(a2 + 112);
  v13[6] = *(_OWORD *)(a2 + 96);
  v13[7] = v6;
  v13[8] = *(_OWORD *)(a2 + 128);
  v14 = *(_QWORD *)(a2 + 144);
  v7 = *(_OWORD *)(a2 + 48);
  v13[2] = *(_OWORD *)(a2 + 32);
  v13[3] = v7;
  v8 = *(_OWORD *)(a2 + 80);
  v13[4] = *(_OWORD *)(a2 + 64);
  v13[5] = v8;
  v9 = *(_OWORD *)(a2 + 16);
  v13[0] = *(_OWORD *)a2;
  v13[1] = v9;
  return sub_10015BFF8((uint64_t *)v11, (uint64_t)v13);
}

uint64_t sub_10015BE70(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  BOOL v17;
  uint64_t v19;

  v4 = type metadata accessor for BatchID(0);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v10 = (char *)&v19 - v9;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11 == *(_QWORD *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      v15 = 1;
    }
    else
    {
      v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      v13 = *(_QWORD *)(v8 + 72);
      v14 = v11 - 1;
      do
      {
        sub_10002E894(a1 + v12, (uint64_t)v10);
        sub_10002E894(a2 + v12, (uint64_t)v7);
        v15 = static ExtendedUUID.== infix(_:_:)(v10, v7);
        sub_10002E858((uint64_t)v7);
        sub_10002E858((uint64_t)v10);
        v17 = v14-- != 0;
        if ((v15 & 1) == 0)
          break;
        v12 += v13;
      }
      while (v17);
    }
  }
  else
  {
    v15 = 0;
  }
  return v15 & 1;
}

BOOL sub_10015BF8C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;
  _BOOL8 result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a1[2];
  if (v2 != a2[2])
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  if (a1[4] != a2[4])
    return 0;
  v3 = a1 + 5;
  v4 = a2 + 5;
  v5 = v2 - 1;
  do
  {
    result = v5 == 0;
    if (!v5)
      break;
    v8 = *v3++;
    v7 = v8;
    v9 = *v4++;
    --v5;
  }
  while (v7 == v9);
  return result;
}

BOOL sub_10015BFF8(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  _BOOL8 result;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
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
  unint64_t v43;

  v4 = *a1;
  v5 = a1[1];
  v6 = *(_QWORD *)(a2 + 8);
  if (v4 != *(_QWORD *)a2 || v5 != v6)
  {
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v5, *(_QWORD *)a2, v6, 0);
    result = 0;
    if ((v8 & 1) == 0)
      return result;
  }
  v10 = *(_BYTE *)(a2 + 24);
  if ((a1[3] & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 24))
      return 0;
  }
  else
  {
    if (a1[2] != *(_QWORD *)(a2 + 16))
      v10 = 1;
    if ((v10 & 1) != 0)
      return 0;
  }
  v11 = *(_BYTE *)(a2 + 40);
  if ((a1[5] & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 40))
      return 0;
  }
  else
  {
    if (a1[4] != *(_QWORD *)(a2 + 32))
      v11 = 1;
    if ((v11 & 1) != 0)
      return 0;
  }
  v12 = a1[7];
  v13 = *(_QWORD *)(a2 + 56);
  if (!v12)
  {
    if (v13)
      return 0;
    goto LABEL_25;
  }
  if (!v13)
    return 0;
  v14 = a1[6];
  v15 = *(_QWORD *)(a2 + 48);
  if (v14 == v15 && v12 == v13
    || (v16 = _stringCompareWithSmolCheck(_:_:expecting:)(v14, v12, v15, v13, 0), result = 0, (v16 & 1) != 0))
  {
LABEL_25:
    v17 = a1[9];
    v18 = *(_QWORD *)(a2 + 72);
    if (v17)
    {
      if (!v18)
        return 0;
      v19 = a1[8];
      v20 = *(_QWORD *)(a2 + 64);
      if (v19 != v20 || v17 != v18)
      {
        v21 = _stringCompareWithSmolCheck(_:_:expecting:)(v19, v17, v20, v18, 0);
        result = 0;
        if ((v21 & 1) == 0)
          return result;
      }
    }
    else if (v18)
    {
      return 0;
    }
    v22 = a1[11];
    v23 = *(_QWORD *)(a2 + 88);
    if (v22)
    {
      if (!v23)
        return 0;
      v24 = a1[10];
      v25 = *(_QWORD *)(a2 + 80);
      if (v24 != v25 || v22 != v23)
      {
        v26 = _stringCompareWithSmolCheck(_:_:expecting:)(v24, v22, v25, v23, 0);
        result = 0;
        if ((v26 & 1) == 0)
          return result;
      }
    }
    else if (v23)
    {
      return 0;
    }
    v27 = a1[13];
    v28 = *(_QWORD *)(a2 + 104);
    if (v27)
    {
      if (!v28)
        return 0;
      v29 = a1[12];
      v30 = *(_QWORD *)(a2 + 96);
      if (v29 != v30 || v27 != v28)
      {
        v31 = _stringCompareWithSmolCheck(_:_:expecting:)(v29, v27, v30, v28, 0);
        result = 0;
        if ((v31 & 1) == 0)
          return result;
      }
    }
    else if (v28)
    {
      return 0;
    }
    v32 = a1[15];
    v33 = *(_QWORD *)(a2 + 120);
    if (v32)
    {
      if (!v33)
        return 0;
      v34 = a1[14];
      v35 = *(_QWORD *)(a2 + 112);
      if (v34 != v35 || v32 != v33)
      {
        v36 = _stringCompareWithSmolCheck(_:_:expecting:)(v34, v32, v35, v33, 0);
        result = 0;
        if ((v36 & 1) == 0)
          return result;
      }
    }
    else if (v33)
    {
      return 0;
    }
    v37 = a1[17];
    v38 = *(_QWORD *)(a2 + 136);
    if (v37)
    {
      if (v38)
      {
        v39 = a1[16];
        v40 = *(_QWORD *)(a2 + 128);
        if (v39 != v40 || v37 != v38)
        {
          v41 = _stringCompareWithSmolCheck(_:_:expecting:)(v39, v37, v40, v38, 0);
          result = 0;
          if ((v41 & 1) == 0)
            return result;
        }
LABEL_62:
        v42 = a1[18];
        v43 = *(_QWORD *)(a2 + 144);
        result = (v42 | v43) == 0;
        if (v42)
        {
          if (v43)
            return sub_10015BF8C((_QWORD *)a1[18], (_QWORD *)v43);
        }
        return result;
      }
    }
    else if (!v38)
    {
      goto LABEL_62;
    }
    return 0;
  }
  return result;
}

uint64_t sub_10015C25C(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char v15;

  if (a1 == 1701667182 && a2 == 0xE400000000000000)
  {
    v5 = 0xE400000000000000;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(1701667182, 0xE400000000000000, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x61566D6F646E6172 && a2 == 0xEB0000000065756CLL)
  {
    v7 = 0xEB0000000065756CLL;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x61566D6F646E6172, 0xEB0000000065756CLL, a1, a2, 0) & 1) != 0)
  {
    v7 = a2;
    goto LABEL_14;
  }
  if (a1 == 0x65736F70727570 && a2 == 0xE700000000000000)
  {
    v8 = 0xE700000000000000;
LABEL_20:
    swift_bridgeObjectRelease(v8);
    return 2;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x65736F70727570, 0xE700000000000000, a1, a2, 0) & 1) != 0)
  {
    v8 = a2;
    goto LABEL_20;
  }
  if (a1 == 0x746E65696C63 && a2 == 0xE600000000000000)
  {
    v9 = 0xE600000000000000;
LABEL_26:
    swift_bridgeObjectRelease(v9);
    return 3;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x746E65696C63, 0xE600000000000000, a1, a2, 0) & 1) != 0)
  {
    v9 = a2;
    goto LABEL_26;
  }
  if (a1 == 0x7461447472617473 && a2 == 0xE900000000000065)
  {
    v10 = 0xE900000000000065;
LABEL_32:
    swift_bridgeObjectRelease(v10);
    return 4;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x7461447472617473, 0xE900000000000065, a1, a2, 0) & 1) != 0)
  {
    v10 = a2;
    goto LABEL_32;
  }
  if (a1 == 0x6144657269707865 && a2 == 0xEA00000000006574)
  {
    v11 = 0xEA00000000006574;
LABEL_38:
    swift_bridgeObjectRelease(v11);
    return 5;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6144657269707865, 0xEA00000000006574, a1, a2, 0) & 1) != 0)
  {
    v11 = a2;
    goto LABEL_38;
  }
  if (a1 == 0x6F72477265707573 && a2 == 0xEA00000000007075)
  {
    v12 = 0xEA00000000007075;
LABEL_44:
    swift_bridgeObjectRelease(v12);
    return 6;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6F72477265707573, 0xEA00000000007075, a1, a2, 0) & 1) != 0)
  {
    v12 = a2;
    goto LABEL_44;
  }
  if (a1 == 0x7265506563617267 && a2 == 0xEB00000000646F69)
  {
    v13 = 0xEB00000000646F69;
LABEL_50:
    swift_bridgeObjectRelease(v13);
    return 7;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x7265506563617267, 0xEB00000000646F69, a1, a2, 0) & 1) != 0)
  {
    v13 = a2;
    goto LABEL_50;
  }
  if (a1 == 0x6E656B6F74 && a2 == 0xE500000000000000)
  {
    v14 = 0xE500000000000000;
LABEL_56:
    swift_bridgeObjectRelease(v14);
    return 8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6E656B6F74, 0xE500000000000000, a1, a2, 0) & 1) != 0)
  {
    v14 = a2;
    goto LABEL_56;
  }
  if (a1 == 0x65676E6172 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease(0xE500000000000000);
    return 9;
  }
  else
  {
    v15 = _stringCompareWithSmolCheck(_:_:expecting:)(0x65676E6172, 0xE500000000000000, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v15 & 1) != 0)
      return 9;
    else
      return 10;
  }
}

_QWORD *sub_10015C690@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
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
  _QWORD *result;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
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
  int v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  __int128 v75;
  uint64_t v76;
  char v77;
  _BYTE v78[7];
  uint64_t v79;
  char v80;
  _BYTE v81[7];
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
  char v95;
  uint64_t v96;
  _BYTE v97[7];
  char v98;
  _BYTE v99[7];
  char v100;
  uint64_t v101;

  v101 = sub_100008A18(&qword_100267B48);
  v5 = *(_QWORD *)(v101 - 8);
  __chkstk_darwin(v101);
  v7 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v100 = 1;
  v98 = 1;
  v8 = a1[3];
  v9 = a1[4];
  sub_10000B748(a1, v8);
  v10 = sub_10015CE64();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for GroupConfigOutput.CodingKeys, &type metadata for GroupConfigOutput.CodingKeys, v10, v8, v9);
  if (v2)
  {
    _s7Metrics31ObservabilitySignalDeserializerVwxx_0(a1);
    swift_bridgeObjectRelease(0);
    swift_bridgeObjectRelease(0);
    swift_bridgeObjectRelease(0);
    swift_bridgeObjectRelease(0);
    swift_bridgeObjectRelease(0);
    swift_bridgeObjectRelease(0);
    return (_QWORD *)swift_bridgeObjectRelease(0);
  }
  else
  {
    v63 = a1;
    v64 = v5;
    LOBYTE(v75) = 0;
    v11 = v101;
    v12 = KeyedDecodingContainer.decode(_:forKey:)(&v75, v101);
    v14 = v13;
    LOBYTE(v75) = 1;
    swift_bridgeObjectRetain(v13);
    v60 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v75, v11);
    *(_QWORD *)&v61 = v12;
    *((_QWORD *)&v61 + 1) = v14;
    v100 = v15 & 1;
    LOBYTE(v75) = 2;
    LODWORD(v14) = v15;
    v16 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v75, v11);
    v58 = v14;
    v59 = v16;
    v98 = v17 & 1;
    LOBYTE(v75) = 3;
    LODWORD(v14) = v17;
    v18 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v75, v11);
    v56 = v14;
    v57 = v18;
    LOBYTE(v75) = 4;
    v20 = v19;
    swift_bridgeObjectRetain(v19);
    v54 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v75, v11);
    v55 = v20;
    LOBYTE(v75) = 5;
    v22 = v21;
    swift_bridgeObjectRetain(v21);
    v52 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v75, v11);
    v53 = v22;
    LOBYTE(v75) = 6;
    v24 = v23;
    swift_bridgeObjectRetain(v23);
    v50 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v75, v11);
    v51 = v24;
    LOBYTE(v75) = 7;
    v26 = v25;
    swift_bridgeObjectRetain(v25);
    v27 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v75, v11);
    v29 = v28;
    v48 = v27;
    v49 = v26;
    LOBYTE(v75) = 8;
    swift_bridgeObjectRetain(v28);
    v62 = v29;
    v47 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v75, v11);
    v31 = v30;
    v32 = sub_100008A18(&qword_1002663C8);
    v95 = 9;
    v33 = sub_100159A7C(&qword_100267960, (uint64_t)&protocol witness table for Int, (uint64_t)&protocol conformance descriptor for <A> [A]);
    swift_bridgeObjectRetain(v31);
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(&v96, v32, &v95, v11, v32, v33);
    (*(void (**)(char *, uint64_t))(v64 + 8))(v7, v101);
    v34 = v96;
    swift_bridgeObjectRetain(v96);
    swift_bridgeObjectRelease(0);
    v65 = v61;
    *(_QWORD *)&v66 = v60;
    BYTE8(v66) = v58 & 1;
    *(_QWORD *)&v67 = v59;
    BYTE8(v67) = v56 & 1;
    v35 = v55;
    *(_QWORD *)&v68 = v57;
    *((_QWORD *)&v68 + 1) = v55;
    v36 = v53;
    *(_QWORD *)&v69 = v54;
    *((_QWORD *)&v69 + 1) = v53;
    v37 = v51;
    *(_QWORD *)&v70 = v52;
    *((_QWORD *)&v70 + 1) = v51;
    v38 = v49;
    *(_QWORD *)&v71 = v50;
    *((_QWORD *)&v71 + 1) = v49;
    *(_QWORD *)&v72 = v48;
    *((_QWORD *)&v72 + 1) = v62;
    *(_QWORD *)&v73 = v47;
    *((_QWORD *)&v73 + 1) = v31;
    v74 = v34;
    sub_10015CEA8(&v65);
    swift_bridgeObjectRelease(*((_QWORD *)&v61 + 1));
    swift_bridgeObjectRelease(v35);
    swift_bridgeObjectRelease(v36);
    v39 = v37;
    swift_bridgeObjectRelease(v37);
    swift_bridgeObjectRelease(v38);
    v40 = v62;
    swift_bridgeObjectRelease(v62);
    swift_bridgeObjectRelease(v31);
    swift_bridgeObjectRelease(v34);
    _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v63);
    v75 = v61;
    v76 = v60;
    v77 = v100;
    *(_DWORD *)v78 = *(_DWORD *)v99;
    *(_DWORD *)&v78[3] = *(_DWORD *)&v99[3];
    v79 = v59;
    v80 = v98;
    *(_DWORD *)v81 = *(_DWORD *)v97;
    *(_DWORD *)&v81[3] = *(_DWORD *)&v97[3];
    v82 = v57;
    v83 = v55;
    v84 = v54;
    v85 = v36;
    v86 = v52;
    v87 = v39;
    v88 = v50;
    v89 = v38;
    v90 = v48;
    v91 = v40;
    v92 = v47;
    v93 = v31;
    v94 = v34;
    result = sub_10015CF38(&v75);
    v42 = v72;
    *(_OWORD *)(a2 + 96) = v71;
    *(_OWORD *)(a2 + 112) = v42;
    *(_OWORD *)(a2 + 128) = v73;
    *(_QWORD *)(a2 + 144) = v74;
    v43 = v68;
    *(_OWORD *)(a2 + 32) = v67;
    *(_OWORD *)(a2 + 48) = v43;
    v44 = v70;
    *(_OWORD *)(a2 + 64) = v69;
    *(_OWORD *)(a2 + 80) = v44;
    v45 = v66;
    *(_OWORD *)a2 = v65;
    *(_OWORD *)(a2 + 16) = v45;
  }
  return result;
}

unint64_t sub_10015CE64()
{
  unint64_t result;

  result = qword_100267B50;
  if (!qword_100267B50)
  {
    result = swift_getWitnessTable(&unk_1001BAC00, &type metadata for GroupConfigOutput.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100267B50);
  }
  return result;
}

_QWORD *sub_10015CEA8(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = a1[1];
  v3 = a1[7];
  v4 = a1[9];
  v5 = a1[11];
  v6 = a1[13];
  v7 = a1[15];
  v8 = a1[17];
  swift_bridgeObjectRetain(a1[18]);
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  return a1;
}

_QWORD *sub_10015CF38(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = a1[7];
  v3 = a1[9];
  v4 = a1[11];
  v5 = a1[13];
  v6 = a1[15];
  v7 = a1[17];
  v8 = a1[18];
  swift_bridgeObjectRelease(a1[1]);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for GroupConfigOutput.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF7)
    goto LABEL_17;
  if (a2 + 9 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 9) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 9;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 9;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 9;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xA;
  v8 = v6 - 10;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for GroupConfigOutput.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 9 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 9) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF7)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF6)
    return ((uint64_t (*)(void))((char *)&loc_10015D0A4 + 4 * byte_1001BAA9F[v4]))();
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_10015D0D8 + 4 * byte_1001BAA9A[v4]))();
}

uint64_t sub_10015D0D8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10015D0E0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10015D0E8);
  return result;
}

uint64_t sub_10015D0F4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10015D0FCLL);
  *(_BYTE *)result = a2 + 9;
  return result;
}

uint64_t sub_10015D100(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10015D108(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for GroupConfigOutput.CodingKeys()
{
  return &type metadata for GroupConfigOutput.CodingKeys;
}

unint64_t sub_10015D128()
{
  unint64_t result;

  result = qword_100267B60;
  if (!qword_100267B60)
  {
    result = swift_getWitnessTable(&unk_1001BABD8, &type metadata for GroupConfigOutput.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100267B60);
  }
  return result;
}

unint64_t sub_10015D170()
{
  unint64_t result;

  result = qword_100267B68;
  if (!qword_100267B68)
  {
    result = swift_getWitnessTable(&unk_1001BAB48, &type metadata for GroupConfigOutput.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100267B68);
  }
  return result;
}

unint64_t sub_10015D1B8()
{
  unint64_t result;

  result = qword_100267B70[0];
  if (!qword_100267B70[0])
  {
    result = swift_getWitnessTable(&unk_1001BAB70, &type metadata for GroupConfigOutput.CodingKeys);
    atomic_store(result, qword_100267B70);
  }
  return result;
}

uint64_t sub_10015D1FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 48);
}

uint64_t sub_10015D204(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[6];

  result = swift_checkMetadataState(319, *(_QWORD *)(a1 + 16));
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = v4[0];
    v4[2] = v4[0];
    v4[3] = v4[0];
    v4[4] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[5] = (char *)&value witness table for Builtin.Int64 + 64;
    swift_initStructMetadata(a1, 0, 6, v4, a1 + 40);
    return 0;
  }
  return result;
}

uint64_t *sub_10015D284(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t *, uint64_t *, uint64_t);
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  _QWORD *v21;

  v4 = a1;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_DWORD *)(v6 + 80);
  v9 = v7 + v8;
  v10 = v7 + 7;
  v11 = ((((v7 + 7 + ((v7 + v8 + ((v7 + v8 + ((v7 + v8) & ~v8)) & ~v8)) & ~v8)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
      + 8;
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || v11 > 0x18)
  {
    v14 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v14 + ((v8 & 0xF8 ^ 0x1F8) & (v8 + 16)));
    swift_retain(v14, a2);
  }
  else
  {
    v15 = ~v8;
    v16 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16);
    v16(a1, a2, *(_QWORD *)(a3 + 16));
    v17 = ((unint64_t)a2 + v9) & v15;
    v16((uint64_t *)(((unint64_t)v4 + v9) & v15), (uint64_t *)v17, v5);
    v18 = (v9 + v17) & v15;
    v16((uint64_t *)((v9 + (((unint64_t)v4 + v9) & v15)) & v15), (uint64_t *)v18, v5);
    v19 = (v9 + v18) & v15;
    v16((uint64_t *)((v9 + ((v9 + (((unint64_t)v4 + v9) & v15)) & v15)) & v15), (uint64_t *)v19, v5);
    v20 = (_QWORD *)((v10 + ((v9 + ((v9 + (((unint64_t)v4 + v9) & v15)) & v15)) & v15)) & 0xFFFFFFFFFFFFF8);
    v21 = (_QWORD *)((v10 + v19) & 0xFFFFFFFFFFFFF8);
    *v20 = *v21;
    *(_QWORD *)(((unint64_t)v20 + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v21 + 15) & 0xFFFFFFFFFFFFF8);
  }
  return v4;
}

uint64_t sub_10015D3DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v11)(uint64_t, uint64_t);

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  v11 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v11(a1, v3);
  v5 = *(_QWORD *)(v4 + 64);
  v6 = *(unsigned __int8 *)(v4 + 80);
  v7 = v5 + v6;
  v8 = (v5 + v6 + a1) & ~v6;
  v11(v8, v3);
  v9 = (v7 + v8) & ~v6;
  v11(v9, v3);
  return ((uint64_t (*)(uint64_t, uint64_t))v11)((v7 + v9) & ~v6, v3);
}

uint64_t sub_10015D474(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v7(a1, a2, v5);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = v8 + v9;
  v11 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v11, v5);
  v12 = (v8 + v9 + v11) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v12, v5);
  v13 = (v8 + v9 + v12) & ~v9;
  v7((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9, v13, v5);
  v14 = (_QWORD *)((v8 + 7 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFF8);
  v15 = (_QWORD *)((v8 + 7 + v13) & 0xFFFFFFFFFFFFF8);
  *v14 = *v15;
  *(_QWORD *)(((unint64_t)v14 + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v15 + 15) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_10015D55C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24);
  v7(a1, a2, v5);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = v8 + v9;
  v11 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v11, v5);
  v12 = (v8 + v9 + v11) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v12, v5);
  v13 = (v8 + v9 + v12) & ~v9;
  v7((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9, v13, v5);
  v14 = (_QWORD *)((v8 + 7 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFF8);
  v15 = (_QWORD *)((v8 + 7 + v13) & 0xFFFFFFFFFFFFF8);
  *v14 = *v15;
  *(_QWORD *)(((unint64_t)v14 + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v15 + 15) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_10015D644(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
  v7(a1, a2, v5);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = v8 + v9;
  v11 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v11, v5);
  v12 = (v8 + v9 + v11) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v12, v5);
  v13 = (v8 + v9 + v12) & ~v9;
  v7((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9, v13, v5);
  v14 = (_QWORD *)((v8 + 7 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFF8);
  v15 = (_QWORD *)((v8 + 7 + v13) & 0xFFFFFFFFFFFFF8);
  *v14 = *v15;
  *(_QWORD *)(((unint64_t)v14 + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v15 + 15) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_10015D72C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 40);
  v7(a1, a2, v5);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = v8 + v9;
  v11 = (v8 + v9 + a2) & ~v9;
  v7((v8 + v9 + a1) & ~v9, v11, v5);
  v12 = (v8 + v9 + v11) & ~v9;
  v7((v8 + v9 + ((v8 + v9 + a1) & ~v9)) & ~v9, v12, v5);
  v13 = (v8 + v9 + v12) & ~v9;
  v7((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9, v13, v5);
  v14 = (_QWORD *)((v8 + 7 + ((v10 + ((v10 + ((v8 + v9 + a1) & ~v9)) & ~v9)) & ~v9)) & 0xFFFFFFFFFFFFF8);
  v15 = (_QWORD *)((v8 + 7 + v13) & 0xFFFFFFFFFFFFF8);
  *v14 = *v15;
  *(_QWORD *)(((unint64_t)v14 + 15) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v15 + 15) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_10015D814(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 >= a2)
  {
    if (v5)
      return (*(uint64_t (**)(void))(v4 + 48))();
    return 0;
  }
  v6 = *(unsigned __int8 *)(v4 + 80);
  if (((((((*(_QWORD *)(v4 + 64)
           + ((*(_QWORD *)(v4 + 64) + v6 + ((*(_QWORD *)(v4 + 64) + v6 + ((*(_QWORD *)(v4 + 64) + v6) & ~v6)) & ~v6)) & ~v6)
           + 7) & 0xFFFFFFFFFFFFFFF8)
         + 15) & 0xFFFFFFFFFFFFFFF8)
       + 8) & 0xFFFFFFF8) != 0)
    v7 = 2;
  else
    v7 = a2 - v5 + 1;
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
  return ((uint64_t (*)(void))((char *)&loc_10015D8AC + 4 * byte_1001BAC60[v9]))();
}

void sub_10015D904(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  int v12;
  unsigned int v13;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(unsigned __int8 *)(v6 + 80);
  if (v7 >= a3)
  {
    v12 = 0;
    if (a2 <= v7)
      goto LABEL_14;
  }
  else
  {
    v9 = a3 - v7;
    if (((((*(_DWORD *)(v6 + 64)
           + ((*(_DWORD *)(v6 + 64)
             + (_DWORD)v8
             + ((*(_DWORD *)(v6 + 64) + (_DWORD)v8 + ((*(_DWORD *)(v6 + 64) + (_DWORD)v8) & ~(_DWORD)v8)) & ~(_DWORD)v8)) & ~(_DWORD)v8)
           + 7) & 0xFFFFFFF8)
         + 15) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v10 = v9 + 1;
    else
      v10 = 2;
    if (v10 >= 0x10000)
      v11 = 4;
    else
      v11 = 2;
    if (v10 < 0x100)
      v11 = 1;
    if (v10 >= 2)
      v12 = v11;
    else
      v12 = 0;
    if (a2 <= v7)
LABEL_14:
      __asm { BR              X11 }
  }
  if (((((*(_DWORD *)(v6 + 64)
         + ((*(_DWORD *)(v6 + 64)
           + (_DWORD)v8
           + ((*(_DWORD *)(v6 + 64) + (_DWORD)v8 + ((*(_DWORD *)(v6 + 64) + (_DWORD)v8) & ~(_DWORD)v8)) & ~(_DWORD)v8)) & ~(_DWORD)v8)
         + 7) & 0xFFFFFFF8)
       + 15) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    v13 = ~v7 + a2;
    bzero(a1, ((((*(_QWORD *)(v6 + 64)+ ((*(_QWORD *)(v6 + 64) + v8 + ((*(_QWORD *)(v6 + 64) + v8 + ((*(_QWORD *)(v6 + 64) + v8) & ~v8)) & ~v8)) & ~v8)+ 7) & 0xFFFFFFFFFFFFFFF8)+ 15) & 0xFFFFFFFFFFFFFFF8)+ 8);
    *a1 = v13;
  }
  __asm { BR              X10 }
}

void sub_10015DA14()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_10015DA1C(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x10015DA24);
}

void sub_10015DA40()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
}

void sub_10015DA48()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
}

uint64_t sub_10015DA50(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_WORD *)(v4 + v5) = 0;
  if (!a2)
    JUMPOUT(0x10015DA58);
  return (*(uint64_t (**)(uint64_t))(v3 + 56))(v4);
}

uint64_t type metadata accessor for SixNumberSummary(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100131764(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SixNumberSummary);
}

BOOL sub_10015DA7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  int *v11;

  v10 = *(_QWORD *)(a4 + 8);
  if ((dispatch thunk of static Equatable.== infix(_:_:)(a1, a2, a3, v10) & 1) != 0
    && (v11 = (int *)type metadata accessor for SixNumberSummary(0, a3, a4, a5),
        (dispatch thunk of static Equatable.== infix(_:_:)(a1 + v11[11], a2 + v11[11], a3, v10) & 1) != 0)
    && (dispatch thunk of static Equatable.== infix(_:_:)(a1 + v11[12], a2 + v11[12], a3, v10) & 1) != 0
    && (dispatch thunk of static Equatable.== infix(_:_:)(a1 + v11[13], a2 + v11[13], a3, v10) & 1) != 0
    && *(_QWORD *)(a1 + v11[14]) == *(_QWORD *)(a2 + v11[14]))
  {
    return *(_QWORD *)(a1 + v11[15]) == *(_QWORD *)(a2 + v11[15]);
  }
  else
  {
    return 0;
  }
}

BOOL sub_10015DB64(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_10015DA7C(a1, a2, a3[2], a3[3], a3[4]);
}

uint64_t *sub_10015DB74(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v15;
  uint64_t v16;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v12, a2);
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
    if (EnumCaseMultiPayload == 2)
    {
      v13 = type metadata accessor for Date(0);
      v14 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
      v14(a1, a2, v13);
      v15 = sub_100008A18(&qword_100266AB0);
      v14((uint64_t *)((char *)a1 + *(int *)(v15 + 48)), (uint64_t *)((char *)a2 + *(int *)(v15 + 48)), v13);
      v9 = a1;
      v10 = a3;
      v11 = 2;
    }
    else if (EnumCaseMultiPayload == 1)
    {
      v8 = type metadata accessor for Date(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      v9 = a1;
      v10 = a3;
      v11 = 1;
    }
    else
    {
      v16 = type metadata accessor for Date(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(a1, a2, v16);
      v9 = a1;
      v10 = a3;
      v11 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v10, v11);
  }
  return a1;
}

uint64_t sub_10015DCA8(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);

  result = swift_getEnumCaseMultiPayload(a1, a2);
  if ((_DWORD)result == 2)
  {
    v5 = type metadata accessor for Date(0);
    v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
    v7(a1, v5);
    v6 = a1 + *(int *)(sub_100008A18(&qword_100266AB0) + 48);
    return ((uint64_t (*)(uint64_t, uint64_t))v7)(v6, v5);
  }
  else if (result <= 1)
  {
    v4 = type metadata accessor for Date(0);
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  return result;
}

uint64_t sub_10015DD54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
  if ((_DWORD)EnumCaseMultiPayload == 2)
  {
    v8 = type metadata accessor for Date(0);
    v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
    v9(a1, a2, v8);
    v10 = sub_100008A18(&qword_100266AB0);
    v9(a1 + *(int *)(v10 + 48), a2 + *(int *)(v10 + 48), v8);
  }
  else
  {
    v7 = type metadata accessor for Date(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
  }
  swift_storeEnumTagMultiPayload(a1, a3, EnumCaseMultiPayload);
  return a1;
}

uint64_t sub_10015DE20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  if (a1 != a2)
  {
    sub_10015DEFC(a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
    if ((_DWORD)EnumCaseMultiPayload == 2)
    {
      v8 = type metadata accessor for Date(0);
      v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
      v9(a1, a2, v8);
      v10 = sub_100008A18(&qword_100266AB0);
      v9(a1 + *(int *)(v10 + 48), a2 + *(int *)(v10 + 48), v8);
    }
    else
    {
      v7 = type metadata accessor for Date(0);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    swift_storeEnumTagMultiPayload(a1, a3, EnumCaseMultiPayload);
  }
  return a1;
}

uint64_t sub_10015DEFC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for PeriodicWorkRequest(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10015DF38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
  if ((_DWORD)EnumCaseMultiPayload == 2)
  {
    v8 = type metadata accessor for Date(0);
    v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32);
    v9(a1, a2, v8);
    v10 = sub_100008A18(&qword_100266AB0);
    v9(a1 + *(int *)(v10 + 48), a2 + *(int *)(v10 + 48), v8);
  }
  else
  {
    v7 = type metadata accessor for Date(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
  }
  swift_storeEnumTagMultiPayload(a1, a3, EnumCaseMultiPayload);
  return a1;
}

uint64_t sub_10015E004(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  if (a1 != a2)
  {
    sub_10015DEFC(a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
    if ((_DWORD)EnumCaseMultiPayload == 2)
    {
      v8 = type metadata accessor for Date(0);
      v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32);
      v9(a1, a2, v8);
      v10 = sub_100008A18(&qword_100266AB0);
      v9(a1 + *(int *)(v10 + 48), a2 + *(int *)(v10 + 48), v8);
    }
    else
    {
      v7 = type metadata accessor for Date(0);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    }
    swift_storeEnumTagMultiPayload(a1, a3, EnumCaseMultiPayload);
  }
  return a1;
}

uint64_t sub_10015E0E0(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _BYTE v4[32];
  _QWORD v5[3];

  result = type metadata accessor for Date(319);
  if (v3 <= 0x3F)
  {
    v5[0] = *(_QWORD *)(result - 8) + 64;
    v5[1] = v5[0];
    swift_getTupleTypeLayout2(v4, v5[0], v5[0]);
    v5[2] = v4;
    swift_initEnumMetadataMultiPayload(a1, 256, 3, v5);
    return 0;
  }
  return result;
}

uint64_t sub_10015E15C(uint64_t a1, uint64_t a2)
{
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  int EnumCaseMultiPayload;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  void (*v35)(char *, uint64_t);
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  void (*v41)(char *, uint64_t, uint64_t);
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  char v46;
  void (*v47)(char *, uint64_t);
  char *v48;
  void (*v49)(char *, uint64_t);
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v55;
  char *v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;

  v4 = type metadata accessor for Date(0);
  v59 = *(_QWORD *)(v4 - 8);
  v60 = v4;
  v5 = __chkstk_darwin(v4);
  v56 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v5);
  v57 = (char *)&v55 - v8;
  v9 = __chkstk_darwin(v7);
  v58 = (char *)&v55 - v10;
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v55 - v12;
  __chkstk_darwin(v11);
  v15 = (char *)&v55 - v14;
  v16 = type metadata accessor for PeriodicWorkRequest(0);
  v17 = __chkstk_darwin(v16);
  v19 = (char *)&v55 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __chkstk_darwin(v17);
  v22 = (char *)&v55 - v21;
  __chkstk_darwin(v20);
  v24 = (char *)&v55 - v23;
  v25 = sub_100008A18((uint64_t *)&unk_100267CA0);
  v26 = __chkstk_darwin(v25);
  v28 = (char *)&v55 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = (uint64_t)&v28[*(int *)(v26 + 48)];
  sub_10000CE70(a1, (uint64_t)v28);
  sub_10000CE70(a2, v29);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v28, v16);
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_10000CE70((uint64_t)v28, (uint64_t)v22);
      if (swift_getEnumCaseMultiPayload(v29, v16) == 1)
      {
        v31 = v59;
        v32 = v29;
        v33 = v60;
        (*(void (**)(char *, uint64_t, uint64_t))(v59 + 32))(v13, v32, v60);
        v34 = static Date.== infix(_:_:)(v22, v13);
        v35 = *(void (**)(char *, uint64_t))(v31 + 8);
        v35(v13, v33);
        v35(v22, v33);
LABEL_17:
        sub_10015DEFC((uint64_t)v28);
        return v34 & 1;
      }
      (*(void (**)(char *, uint64_t))(v59 + 8))(v22, v60);
      goto LABEL_13;
    }
    sub_10000CE70((uint64_t)v28, (uint64_t)v19);
    v36 = *(int *)(sub_100008A18(&qword_100266AB0) + 48);
    v37 = &v19[v36];
    if (swift_getEnumCaseMultiPayload(v29, v16) == 2)
    {
      v38 = v29 + v36;
      v40 = v58;
      v39 = v59;
      v41 = *(void (**)(char *, uint64_t, uint64_t))(v59 + 32);
      v42 = v29;
      v43 = v60;
      v41(v58, v42, v60);
      v44 = v57;
      v41(v57, (uint64_t)v37, v43);
      v45 = v56;
      v41(v56, v38, v43);
      v46 = static Date.== infix(_:_:)(v19, v40);
      v47 = *(void (**)(char *, uint64_t))(v39 + 8);
      v47(v19, v43);
      if ((v46 & 1) == 0)
      {
        v47(v45, v43);
        v47(v44, v43);
        v47(v40, v43);
        sub_10015DEFC((uint64_t)v28);
        goto LABEL_14;
      }
      v34 = static Date.== infix(_:_:)(v44, v45);
      v47(v45, v43);
      v47(v44, v43);
      v48 = v40;
LABEL_16:
      v47(v48, v43);
      goto LABEL_17;
    }
    v49 = *(void (**)(char *, uint64_t))(v59 + 8);
    v50 = v37;
    v51 = v60;
    v49(v50, v60);
    v49(v19, v51);
  }
  else
  {
    sub_10000CE70((uint64_t)v28, (uint64_t)v24);
    if (!swift_getEnumCaseMultiPayload(v29, v16))
    {
      v52 = v59;
      v53 = v29;
      v43 = v60;
      (*(void (**)(char *, uint64_t, uint64_t))(v59 + 32))(v15, v53, v60);
      v34 = static Date.== infix(_:_:)(v24, v15);
      v47 = *(void (**)(char *, uint64_t))(v52 + 8);
      v47(v15, v43);
      v48 = v24;
      goto LABEL_16;
    }
    (*(void (**)(char *, uint64_t))(v59 + 8))(v24, v60);
  }
LABEL_13:
  sub_10015E570((uint64_t)v28);
LABEL_14:
  v34 = 0;
  return v34 & 1;
}

uint64_t sub_10015E570(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100008A18((uint64_t *)&unk_100267CA0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10015E5B0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _BYTE *v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  _QWORD *v28;
  _BYTE v29[2];
  char v30;
  _BYTE v31[2];

  v24 = a2;
  v25 = type metadata accessor for UtcDate(0);
  __chkstk_darwin(v25);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_100008A18(&qword_100267F70);
  v5 = *(_QWORD *)(v27 - 8);
  __chkstk_darwin(v27);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for ObservabilityReportWorkerParamsRange(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1[3];
  v11 = a1[4];
  sub_10000B748(a1, v12);
  v13 = sub_1001616D4();
  v26 = v7;
  v14 = v28;
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for ObservabilityReportWorkerParamsRange.CodingKeys, &type metadata for ObservabilityReportWorkerParamsRange.CodingKeys, v13, v12, v11);
  if (v14)
    return _s7Metrics31ObservabilitySignalDeserializerVwxx_0(a1);
  v15 = v25;
  v28 = a1;
  v16 = v10;
  v31[0] = 0;
  v17 = sub_100161718();
  v18 = v26;
  v19 = v27;
  KeyedDecodingContainer.decode<A>(_:forKey:)(&type metadata for ObservabilityReportType, v31, v27, &type metadata for ObservabilityReportType, v17);
  *v16 = v31[1];
  v30 = 1;
  v20 = sub_1000A3560(&qword_100265370, type metadata accessor for UtcDate, (uint64_t)&unk_1001BB148);
  KeyedDecodingContainer.decode<A>(_:forKey:)(v15, &v30, v19, v15, v20);
  sub_10000BCFC((uint64_t)v4, (uint64_t)&v16[*(int *)(v8 + 20)], type metadata accessor for UtcDate);
  v29[0] = 2;
  v21 = sub_10016175C();
  KeyedDecodingContainer.decode<A>(_:forKey:)(&type metadata for TimeRange.Duration, v29, v19, &type metadata for TimeRange.Duration, v21);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v18, v19);
  v16[*(int *)(v8 + 24)] = v29[1];
  sub_10000BD40((uint64_t)v16, v24, type metadata accessor for ObservabilityReportWorkerParamsRange);
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v28);
  return sub_1000070D8((uint64_t)v16, type metadata accessor for ObservabilityReportWorkerParamsRange);
}

uint64_t sub_10015E86C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v18 = a2;
  v4 = type metadata accessor for UtcDate(0);
  __chkstk_darwin(v4);
  v20 = (uint64_t)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100008A18(&qword_100267F98);
  v19 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for ObservabilityReportWorkerParamsTime(0);
  __chkstk_darwin(v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1[3];
  v13 = a1[4];
  sub_10000B748(a1, v12);
  v14 = sub_1001617A0();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for ObservabilityReportWorkerParamsTime.CodingKeys, &type metadata for ObservabilityReportWorkerParamsTime.CodingKeys, v14, v12, v13);
  if (!v2)
  {
    v15 = sub_1000A3560(&qword_100265370, type metadata accessor for UtcDate, (uint64_t)&unk_1001BB148);
    KeyedDecodingContainer.decode<A>(_:forKey:)(v4, v16, v6, v4, v15);
    (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v6);
    sub_10000BCFC(v20, (uint64_t)v11, type metadata accessor for UtcDate);
    sub_10000BCFC((uint64_t)v11, v18, type metadata accessor for ObservabilityReportWorkerParamsTime);
  }
  return _s7Metrics31ObservabilitySignalDeserializerVwxx_0(a1);
}

uint64_t sub_10015EA38()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x7472617473;
  if (*v0 != 1)
    v1 = 0x6E6F697461727564;
  if (*v0)
    return v1;
  else
    return 0x74726F706572;
}

uint64_t sub_10015EA8C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_100161AFC(a1, a2);
  *a3 = result;
  return result;
}

void sub_10015EAB0(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_10015EABC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1001616D4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10015EAE4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1001616D4();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10015EB0C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10015E5B0(a1, a2);
}

uint64_t sub_10015EB20(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1001617A0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10015EB48(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1001617A0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10015EB70@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10015E86C(a1, a2);
}

void sub_10015EB84()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  NSString v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  NSString v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void **v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t, const void *);
  void *v25;
  uint64_t (*v26)(uint64_t, uint64_t, void (*)(_QWORD), uint64_t);
  uint64_t v27;

  if (objc_msgSend((id)objc_opt_self(APSystemInternal), "isAppleInternalInstall"))
  {
    v1 = (void *)objc_opt_self(APTestingRig);
    v2 = objc_msgSend(v1, "sharedInstance");
    if (v2)
    {
      v3 = v2;
      v4 = swift_allocObject(&unk_1002182C0, 24, 7);
      swift_weakInit(v4 + 16, v0);
      v5 = objc_msgSend(v1, "sharedInstance");
      if (v5)
      {
        v6 = v5;
        v7 = String._bridgeToObjectiveC()();
        v8 = swift_allocObject(&unk_100218338, 32, 7);
        *(_QWORD *)(v8 + 16) = sub_100160FD8;
        *(_QWORD *)(v8 + 24) = v4;
        v26 = sub_100160FF0;
        v27 = v8;
        v22 = _NSConcreteStackBlock;
        v23 = 1107296256;
        v24 = sub_100155378;
        v25 = &unk_100218350;
        v9 = _Block_copy(&v22);
        v10 = v27;
        swift_retain(v4, v11);
        swift_release(v10);
        objc_msgSend(v6, "subscribeForMessage:handler:", v7, v9);
        _Block_release(v9);

        swift_release(v4);
      }
      else
      {

        swift_release(v4);
      }
    }
    v12 = objc_msgSend(v1, "sharedInstance");
    if (v12)
    {
      v13 = v12;
      v14 = swift_allocObject(&unk_1002182C0, 24, 7);
      swift_weakInit(v14 + 16, v0);
      v15 = objc_msgSend(v1, "sharedInstance");
      if (v15)
      {
        v16 = v15;
        v17 = String._bridgeToObjectiveC()();
        v18 = swift_allocObject(&unk_1002182E8, 32, 7);
        *(_QWORD *)(v18 + 16) = sub_100160F7C;
        *(_QWORD *)(v18 + 24) = v14;
        v26 = sub_100160FB8;
        v27 = v18;
        v22 = _NSConcreteStackBlock;
        v23 = 1107296256;
        v24 = sub_100155378;
        v25 = &unk_100218300;
        v19 = _Block_copy(&v22);
        v20 = v27;
        swift_retain(v14, v21);
        swift_release(v20);
        objc_msgSend(v16, "subscribeForMessage:handler:", v17, v19);
        _Block_release(v19);

        swift_release(v14);
      }
      else
      {

        swift_release(v14);
      }
    }
  }
}

_QWORD *sub_10015EE64()
{
  _QWORD *v0;

  swift_bridgeObjectRelease(v0[3]);
  swift_unknownObjectRelease(v0[4]);
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v0 + 5);
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v0 + 10);
  swift_bridgeObjectRelease(v0[16]);
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v0 + 17);
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v0 + 22);
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v0 + 27);
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v0 + 32);
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v0 + 37);
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v0 + 42);
  return v0;
}

uint64_t sub_10015EED0()
{
  uint64_t v0;

  sub_10015EE64();
  return swift_deallocClassInstance(v0, 376, 7);
}

uint64_t type metadata accessor for ObservabilityProductionWorkerFactory()
{
  return objc_opt_self(_TtC7Metrics36ObservabilityProductionWorkerFactory);
}

uint64_t sub_10015EF10(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t Strong;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  unsigned __int8 *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  uint64_t v53;
  uint64_t v54;
  void *v55;
  Class isa;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[2];
  uint64_t v61;
  unsigned __int8 *v62;
  uint64_t v63;
  char *v64;
  unint64_t v65;
  __int128 v66;
  uint64_t v67;
  uint64_t v68[3];
  uint64_t v69;
  uint64_t v70;
  char v71[24];
  uint64_t v72;

  v5 = type metadata accessor for UtcDate(0);
  __chkstk_darwin(v5);
  v7 = (char *)v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for TimeRange(0);
  v9 = __chkstk_darwin(v8);
  v11 = (char *)v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)v60 - v12;
  a2 += 16;
  swift_beginAccess(a2, v71, 0, 0);
  Strong = swift_weakLoadStrong(a2);
  if (!Strong)
    return 1701736270;
  v15 = Strong;
  v16 = type metadata accessor for ObservabilityReportWorkerParamsRange(0);
  sub_10000BD40((uint64_t)&a1[*(int *)(v16 + 20)], (uint64_t)v7, type metadata accessor for UtcDate);
  v17 = type metadata accessor for Date(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v13, v7, v17);
  v18 = *(int *)(v16 + 24);
  v62 = a1;
  v13[*(int *)(v8 + 20)] = a1[v18];
  if (qword_100264E78 != -1)
    swift_once(&qword_100264E78, sub_100150610);
  v19 = type metadata accessor for Logger(0);
  sub_10000ABD8(v19, (uint64_t)qword_10026D208);
  v64 = v13;
  v20 = sub_10000BD40((uint64_t)v13, (uint64_t)v11, type metadata accessor for TimeRange);
  v21 = Logger.logObject.getter(v20);
  v22 = static os_log_type_t.debug.getter(v21);
  v23 = os_log_type_enabled(v21, v22);
  v60[1] = v2;
  v61 = v15;
  if (v23)
  {
    v24 = (uint8_t *)swift_slowAlloc(12, -1);
    v25 = swift_slowAlloc(32, -1);
    v68[0] = v25;
    *(_DWORD *)v24 = 136315138;
    v26 = sub_10014E218();
    v28 = v27;
    *(_QWORD *)&v66 = sub_1000A8B30(v26, v27, v68);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v66, (char *)&v66 + 8, v24 + 4, v24 + 12);
    swift_bridgeObjectRelease(v28);
    sub_1000070D8((uint64_t)v11, type metadata accessor for TimeRange);
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "Running manual reports for %s", v24, 0xCu);
    swift_arrayDestroy(v25, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v25, -1, -1);
    swift_slowDealloc(v24, -1, -1);
  }
  else
  {
    sub_1000070D8((uint64_t)v11, type metadata accessor for TimeRange);
  }

  v30 = (uint64_t)sub_10015F498();
  v31 = v30;
  v32 = v62;
  if (!((unint64_t)v30 >> 62))
  {
    v33 = *(_QWORD *)((v30 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain(v30);
    if (v33)
      goto LABEL_10;
LABEL_26:
    swift_bridgeObjectRelease_n(v31, 2);
    swift_release(v61);
    sub_1000070D8((uint64_t)v64, type metadata accessor for TimeRange);
    return 19279;
  }
  if (v30 < 0)
    v59 = v30;
  else
    v59 = v30 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v30);
  result = _CocoaArrayWrapper.endIndex.getter(v59);
  v33 = result;
  if (!result)
    goto LABEL_26;
LABEL_10:
  if (v33 >= 1)
  {
    v35 = 0;
    v65 = v31 & 0xC000000000000001;
    v63 = v31;
    v72 = v33;
    do
    {
      if (v65)
      {
        v36 = (_QWORD *)specialized _ArrayBuffer._getElementSlowPath(_:)(v35, v31);
      }
      else
      {
        v36 = *(_QWORD **)(v31 + 8 * v35 + 32);
        swift_retain(v36, v34);
      }
      v37 = *v32;
      v38 = v36[16];
      v39 = v36[17];
      sub_10000B748(v36 + 13, v38);
      if (v37 == (*(unsigned __int8 (**)(uint64_t, uint64_t))(v39 + 8))(v38, v39))
      {
        v40 = v36[16];
        v41 = v36[17];
        sub_10000B748(v36 + 13, v40);
        v42 = (*(uint64_t (**)(uint64_t, uint64_t))(v41 + 8))(v40, v41);
        v43 = v36[16];
        v44 = v36[17];
        sub_10000B748(v36 + 13, v43);
        v45 = (uint64_t)v64;
        (*(void (**)(__int128 *__return_ptr, char *, uint64_t, uint64_t))(v44 + 16))(&v66, v64, v43, v44);
        if (v67)
        {
          sub_100136930(&v66, (uint64_t)v68);
          v46 = sub_10000B748(v36 + 3, v36[6]);
          v47 = v36[16];
          v48 = v36[17];
          sub_10000B748(v36 + 13, v47);
          v49 = (*(unsigned __int8 (**)(uint64_t, uint64_t))(v48 + 8))(v47, v48) + 2801;
          v50 = v69;
          v51 = v70;
          sub_10000B748(v68, v69);
          v52 = *(uint64_t (**)(uint64_t, uint64_t))(v51 + 8);
          v53 = v51;
          v32 = v62;
          v54 = v52(v50, v53);
          v55 = *(void **)(*v46 + 16);
          sub_100008A18(&qword_1002654D0);
          isa = Dictionary._bridgeToObjectiveC()().super.isa;
          objc_msgSend(v55, "recordMetric:forPurpose:properties:internalProperties:order:options:", v49, 8501, isa, 0, 0, 0);
          swift_bridgeObjectRelease(v54);

          v57 = v36[21];
          v58 = v36[22];
          sub_10000B748(v36 + 18, v57);
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v58 + 32))(v45, v42, v57, v58);
          _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v68);
        }
        else
        {
          sub_10016100C((uint64_t)&v66);
        }
        swift_release(v36);
        v31 = v63;
      }
      else
      {
        swift_release(v36);
      }
      ++v35;
    }
    while (v72 != v35);
    goto LABEL_26;
  }
  __break(1u);
  return result;
}

_QWORD *sub_10015F498()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _BYTE v13[40];
  uint64_t v14;
  _QWORD v15[5];
  unint64_t v16;

  v0 = sub_10015F9C0();
  v1 = v0;
  v2 = _swiftEmptyArrayStorage;
  v16 = (unint64_t)_swiftEmptyArrayStorage;
  v3 = v0[2];
  if (v3)
  {
    v4 = (uint64_t)(v0 + 4);
    do
    {
      sub_10000D4D8(v4, (uint64_t)v15);
      sub_10000D4D8((uint64_t)v15, (uint64_t)v13);
      v6 = sub_100008A18(&qword_100267DB8);
      v7 = type metadata accessor for ObservabilityReportWorker();
      if ((swift_dynamicCast(&v14, v13, v6, v7, 6) & 1) == 0)
        v14 = 0;
      v8 = _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v15);
      v9 = v14;
      if (v14)
      {
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v8);
        v11 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
        v10 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x18);
        if (v11 >= v10 >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v10 > 1, v11 + 1, 1);
        v5 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v11, v9);
        specialized Array._endMutation()(v5);
      }
      v4 += 40;
      --v3;
    }
    while (v3);
    v2 = (_QWORD *)v16;
  }
  swift_bridgeObjectRelease(v1);
  return v2;
}

uint64_t sub_10015F5B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t Strong;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  int v20;
  uint8_t *v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint8_t *v37;
  uint8_t *v38;
  os_log_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE v46[24];
  uint64_t v47;

  v44 = a1;
  v4 = type metadata accessor for UtcDate(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Date(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for ObservabilityReportWorkerParamsTime(0);
  __chkstk_darwin(v11);
  v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  a2 += 16;
  swift_beginAccess(a2, v46, 0, 0);
  Strong = swift_weakLoadStrong(a2);
  if (!Strong)
    return 1701736270;
  v15 = Strong;
  v43 = v2;
  if (qword_100264E78 != -1)
    swift_once(&qword_100264E78, sub_100150610);
  v16 = type metadata accessor for Logger(0);
  sub_10000ABD8(v16, (uint64_t)qword_10026D208);
  v17 = sub_10000BD40(v44, (uint64_t)v13, type metadata accessor for ObservabilityReportWorkerParamsTime);
  v18 = Logger.logObject.getter(v17);
  v19 = static os_log_type_t.debug.getter(v18);
  v20 = v19;
  if (os_log_type_enabled(v18, v19))
  {
    v41 = v20;
    v21 = (uint8_t *)swift_slowAlloc(12, -1);
    v40 = swift_slowAlloc(32, -1);
    v47 = v40;
    v38 = v21;
    v39 = v18;
    *(_DWORD *)v21 = 136315138;
    v22 = v21 + 12;
    v37 = v21 + 4;
    sub_10000BD40((uint64_t)v13, (uint64_t)v6, type metadata accessor for UtcDate);
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    v23 = sub_1000A3560((unint64_t *)&qword_1002677F0, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
    v24 = dispatch thunk of CustomStringConvertible.description.getter(v7, v23);
    v26 = v25;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    v45 = sub_1000A8B30(v24, v26, &v47);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, v46, v37, v22);
    swift_bridgeObjectRelease(v26);
    sub_1000070D8((uint64_t)v13, type metadata accessor for ObservabilityReportWorkerParamsTime);
    v27 = v38;
    v18 = v39;
    _os_log_impl((void *)&_mh_execute_header, v39, (os_log_type_t)v41, "Running manual reports at %s", v38, 0xCu);
    v28 = v40;
    swift_arrayDestroy(v40, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v28, -1, -1);
    swift_slowDealloc(v27, -1, -1);
  }
  else
  {
    sub_1000070D8((uint64_t)v13, type metadata accessor for ObservabilityReportWorkerParamsTime);
  }

  v30 = (uint64_t)sub_10015F498();
  v31 = v30;
  v42 = v15;
  if (!((unint64_t)v30 >> 62))
  {
    v32 = *(_QWORD *)((v30 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain(v30);
    if (v32)
      goto LABEL_10;
LABEL_20:
    swift_bridgeObjectRelease_n(v31, 2);
    swift_release(v42);
    return 19279;
  }
  if (v30 < 0)
    v36 = v30;
  else
    v36 = v30 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v30);
  result = _CocoaArrayWrapper.endIndex.getter(v36);
  v32 = result;
  if (!result)
    goto LABEL_20;
LABEL_10:
  if (v32 >= 1)
  {
    v34 = 0;
    do
    {
      if ((v31 & 0xC000000000000001) != 0)
      {
        v35 = specialized _ArrayBuffer._getElementSlowPath(_:)(v34, v31);
      }
      else
      {
        v35 = *(_QWORD *)(v31 + 8 * v34 + 32);
        swift_retain(v35, v33);
      }
      ++v34;
      sub_10000BD40(v44, (uint64_t)v6, type metadata accessor for UtcDate);
      sub_10013574C((uint64_t)v6);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
      swift_release(v35);
    }
    while (v32 != v34);
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

_QWORD *sub_10015F9C0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t inited;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *);
  unint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  _QWORD v42[5];
  _QWORD v43[5];
  __int128 v44;
  uint64_t v45;
  _UNKNOWN **v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49[2];
  _BYTE v50[160];

  v1 = sub_100008A18(&qword_100267DA0);
  inited = swift_initStackObject(v1, v50);
  *(_OWORD *)(inited + 16) = xmmword_1001B7630;
  sub_10000D4D8((uint64_t)(v0 + 5), (uint64_t)v49);
  sub_10000D4D8((uint64_t)(v0 + 10), (uint64_t)&v47);
  sub_10000D4D8((uint64_t)(v0 + 37), (uint64_t)&v44);
  v3 = type metadata accessor for ObservabilityCommunicationReporter();
  v4 = swift_allocObject(v3, 136, 7);
  sub_100136930(v49, v4 + 16);
  sub_100136930(&v47, v4 + 56);
  sub_100136930(&v44, v4 + 96);
  *(_QWORD *)(inited + 56) = v3;
  *(_QWORD *)(inited + 64) = &off_100217710;
  *(_QWORD *)(inited + 32) = v4;
  v41 = inited + 32;
  sub_10000D4D8((uint64_t)(v0 + 37), (uint64_t)v49);
  v40 = v0 + 42;
  sub_10000D4D8((uint64_t)(v0 + 42), (uint64_t)&v47);
  v5 = sub_100136C8C((uint64_t)&v47, v48);
  __chkstk_darwin(v5);
  v7 = (uint64_t *)((char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v8 + 16))(v7);
  v9 = *v7;
  v10 = type metadata accessor for ObservabilityStateStoreDatabase();
  v45 = v10;
  v46 = &off_1002176D0;
  *(_QWORD *)&v44 = v9;
  v11 = type metadata accessor for ObservabilityHourlyReporter();
  v12 = (_QWORD *)swift_allocObject(v11, 96, 7);
  v13 = sub_100136C8C((uint64_t)&v44, v10);
  v14 = *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64);
  __chkstk_darwin(v13);
  v38 = *(void (**)(char *))(v15 + 16);
  v39 = (v14 + 15) & 0xFFFFFFFFFFFFFFF0;
  v38((char *)&v35 - v39);
  v16 = *(uint64_t *)((char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12[10] = v10;
  v12[11] = &off_1002176D0;
  v12[7] = v16;
  sub_100136930(v49, (uint64_t)(v12 + 2));
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0(&v44);
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0(&v47);
  *(_QWORD *)(inited + 96) = v11;
  *(_QWORD *)(inited + 104) = &off_100217880;
  *(_QWORD *)(inited + 72) = v12;
  v17 = v0[2];
  v18 = v0[3];
  v36 = v0[15];
  v37 = v17;
  v35 = v0[16];
  sub_10000D4D8((uint64_t)(v0 + 17), (uint64_t)v49);
  sub_10000D4D8((uint64_t)(v0 + 22), (uint64_t)&v47);
  sub_10000D4D8((uint64_t)(v0 + 37), (uint64_t)&v44);
  sub_10000D4D8((uint64_t)v40, (uint64_t)v43);
  v19 = sub_100136C8C((uint64_t)v43, v43[3]);
  __chkstk_darwin(v19);
  v21 = (uint64_t *)((char *)&v35 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v22 + 16))(v21);
  v23 = *v21;
  v42[3] = v10;
  v42[4] = &off_1002176D0;
  v42[0] = v23;
  v24 = type metadata accessor for ObservabilityDailyReporter();
  v25 = (_QWORD *)swift_allocObject(v24, 208, 7);
  v26 = sub_100136C8C((uint64_t)v42, v10);
  __chkstk_darwin(v26);
  v27 = (uint64_t *)((char *)&v35 - v39);
  v38((char *)&v35 - v39);
  v28 = *v27;
  v25[24] = v10;
  v25[25] = &off_1002176D0;
  v25[21] = v28;
  v25[2] = v37;
  v25[3] = v18;
  v29 = v35;
  v25[4] = v36;
  v25[5] = v29;
  sub_100136930(v49, (uint64_t)(v25 + 6));
  sub_100136930(&v47, (uint64_t)(v25 + 11));
  sub_100136930(&v44, (uint64_t)(v25 + 16));
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRetain(v29);
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v42);
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v43);
  *(_QWORD *)(inited + 136) = v24;
  *(_QWORD *)(inited + 144) = &off_100216AB8;
  *(_QWORD *)(inited + 112) = v25;
  swift_retain(v0, v30);
  v31 = sub_100160ABC(inited, (uint64_t)v0);
  swift_release(v0);
  swift_setDeallocating(inited);
  v32 = *(_QWORD *)(inited + 16);
  v33 = sub_100008A18(&qword_100267DA8);
  swift_arrayDestroy(v41, v32, v33);
  return v31;
}

uint64_t sub_10015FDA0(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_10015FF24(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_10015FDBC(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1001601DC(a1, a2, a3, (_QWORD *)*v3, &qword_100266AC8, (uint64_t *)&unk_100267DF0);
  *v3 = result;
  return result;
}

uint64_t sub_10015FDE8(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_100160658(a1, a2, a3, (_QWORD *)*v3, &qword_100265D38, &qword_100267E00);
  *v3 = result;
  return result;
}

uint64_t sub_10015FE14(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_100160080(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_10015FE30(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1001601DC(a1, a2, a3, (_QWORD *)*v3, (uint64_t *)&unk_100267E10, &qword_100265D20);
  *v3 = result;
  return result;
}

uint64_t sub_10015FE5C(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_100160658(a1, a2, a3, (_QWORD *)*v3, (uint64_t *)&unk_100267E20, &qword_1002664E0);
  *v3 = result;
  return result;
}

uint64_t sub_10015FE88(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_100160384(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_10015FEA4(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1001604E0(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_10015FEC0(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_100160658(a1, a2, a3, (_QWORD *)*v3, &qword_100267DB0, &qword_100267DB8);
  *v3 = result;
  return result;
}

uint64_t sub_10015FEEC(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1001607FC(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_10015FF08(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_100160964(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_10015FF24(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
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
    v10 = sub_100008A18((uint64_t *)&unk_100267DE0);
    v11 = (char *)swift_allocObject(v10, 8 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 25;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 3);
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[8 * v8])
      memmove(v14, v15, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v15 >= &v14[8 * v8] || v14 >= &v15[8 * v8])
  {
    memcpy(v14, v15, 8 * v8);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100160080(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
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
    v10 = sub_100008A18(&qword_100267E08);
    v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8])
      memmove(v14, v15, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v15 >= &v14[16 * v8] || v14 >= &v15[16 * v8])
  {
    memcpy(v14, v15, 16 * v8);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_1001601DC(char a1, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t *a6)
{
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  size_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (v12)
  {
    v13 = sub_100008A18(a5);
    v14 = (_QWORD *)swift_allocObject(v13, 48 * v12 + 32, 7);
    v15 = j__malloc_size(v14);
    v14[2] = v11;
    v14[3] = 2 * ((uint64_t)(v15 - 32) / 48);
  }
  else
  {
    v14 = _swiftEmptyArrayStorage;
  }
  v16 = (unint64_t)(v14 + 4);
  v17 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v14 != a4 || v16 >= v17 + 48 * v11)
      memmove(v14 + 4, a4 + 4, 48 * v11);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v17 >= v16 + 48 * v11 || v16 >= v17 + 48 * v11)
  {
    sub_100008A18(a6);
    swift_arrayInitWithCopy(v14 + 4);
LABEL_28:
    swift_release(a4);
    return (uint64_t)v14;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100160384(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
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
    v10 = sub_100008A18((uint64_t *)&unk_100267E30);
    v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8])
      memmove(v14, v15, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v15 >= &v14[16 * v8] || v14 >= &v15[16 * v8])
  {
    memcpy(v14, v15, 16 * v8);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_1001604E0(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
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
    v10 = sub_100008A18(&qword_100266AD0);
    v11 = (char *)swift_allocObject(v10, 24 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 24);
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[24 * v8])
      memmove(v13, v14, 24 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[24 * v8] || v13 >= &v14[24 * v8])
  {
    memcpy(v13, v14, 24 * v8);
LABEL_28:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100160658(char a1, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t *a6)
{
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  size_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (v12)
  {
    v13 = sub_100008A18(a5);
    v14 = (_QWORD *)swift_allocObject(v13, 40 * v12 + 32, 7);
    v15 = j__malloc_size(v14);
    v14[2] = v11;
    v14[3] = 2 * ((uint64_t)(v15 - 32) / 40);
  }
  else
  {
    v14 = _swiftEmptyArrayStorage;
  }
  v16 = (unint64_t)(v14 + 4);
  v17 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v14 != a4 || v16 >= v17 + 40 * v11)
      memmove(v14 + 4, a4 + 4, 40 * v11);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v17 >= v16 + 40 * v11 || v16 >= v17 + 40 * v11)
  {
    sub_100008A18(a6);
    swift_arrayInitWithCopy(v14 + 4);
LABEL_28:
    swift_release(a4);
    return (uint64_t)v14;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_1001607FC(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
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
    v10 = sub_100008A18(&qword_100266AD8);
    v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8])
      memmove(v14, v15, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v15 >= &v14[16 * v8] || v14 >= &v15[16 * v8])
  {
    swift_arrayInitWithCopy(v14);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100160964(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  size_t v16;
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
    v10 = sub_100008A18((uint64_t *)&unk_100267DC0);
    v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  v16 = 16 * v8;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[v16])
      memmove(v14, v15, v16);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v15 >= &v14[v16] || v14 >= &v15[v16])
  {
    memcpy(v14, v15, v16);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

_QWORD *sub_100160ABC(uint64_t a1, uint64_t a2)
{
  int64_t v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE v40[16];
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE *v45;
  _BYTE *v46;
  _BYTE *v47;
  uint64_t v48;
  int64_t v49;
  _QWORD v50[3];
  uint64_t v51;
  _UNKNOWN **v52;
  _QWORD v53[5];
  __int128 v54[2];
  __int128 v55[2];
  __int128 v56;
  uint64_t v57;
  _UNKNOWN **v58;
  _QWORD *v59;
  uint64_t v60;
  _UNKNOWN **v61;
  _QWORD *v62;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = _swiftEmptyArrayStorage;
  if (v2)
  {
    v62 = _swiftEmptyArrayStorage;
    sub_10015FEC0(0, v2, 0);
    v6 = a1 + 32;
    v44 = a2 + 216;
    v43 = a2 + 256;
    v42 = *(_QWORD *)(a2 + 32);
    v41 = a2 + 296;
    do
    {
      v49 = v2;
      sub_10000D4D8(v44, (uint64_t)&v59);
      sub_10000D4D8(v43, (uint64_t)&v56);
      v48 = v6;
      sub_10000D4D8(v6, (uint64_t)v55);
      sub_10000D4D8(v41, (uint64_t)v54);
      v7 = sub_100136C8C((uint64_t)&v59, v60);
      v47 = v40;
      __chkstk_darwin(v7);
      v9 = (uint64_t *)&v40[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
      (*(void (**)(uint64_t *))(v10 + 16))(v9);
      v11 = sub_100136C8C((uint64_t)&v56, v57);
      v46 = v40;
      __chkstk_darwin(v11);
      v13 = (uint64_t *)&v40[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
      (*(void (**)(uint64_t *))(v14 + 16))(v13);
      v15 = *v9;
      v16 = *v13;
      v17 = type metadata accessor for ECPrimitiveEventSink();
      v53[4] = &off_100217B08;
      v53[3] = v17;
      v53[0] = v15;
      v18 = type metadata accessor for OffsetTimeRangeReferenceFrame();
      v52 = &off_100217290;
      v51 = v18;
      v50[0] = v16;
      v19 = type metadata accessor for ObservabilityReportWorker();
      v20 = (_QWORD *)swift_allocObject(v19, 184, 7);
      v21 = sub_100136C8C((uint64_t)v53, v17);
      v45 = v40;
      __chkstk_darwin(v21);
      v23 = (uint64_t *)&v40[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
      (*(void (**)(uint64_t *))(v24 + 16))(v23);
      v25 = sub_100136C8C((uint64_t)v50, v51);
      __chkstk_darwin(v25);
      v27 = (uint64_t *)&v40[-((v26 + 15) & 0xFFFFFFFFFFFFFFF0)];
      (*(void (**)(uint64_t *))(v28 + 16))(v27);
      v29 = *v23;
      v30 = *v27;
      v20[6] = v17;
      v20[7] = &off_100217B08;
      v20[11] = v18;
      v20[12] = &off_100217290;
      v20[8] = v30;
      v31 = v42;
      v20[2] = v42;
      v20[3] = v29;
      sub_100136930(v55, (uint64_t)(v20 + 13));
      sub_100136930(v54, (uint64_t)(v20 + 18));
      swift_unknownObjectRetain(v31);
      _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v50);
      _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v53);
      _s7Metrics31ObservabilitySignalDeserializerVwxx_0(&v56);
      _s7Metrics31ObservabilitySignalDeserializerVwxx_0(&v59);
      v60 = v19;
      v61 = &off_100216818;
      v59 = v20;
      v3 = v62;
      if ((swift_isUniquelyReferenced_nonNull_native(v62) & 1) == 0)
      {
        sub_10015FEC0(0, v3[2] + 1, 1);
        v3 = v62;
      }
      v33 = v3[2];
      v32 = v3[3];
      if (v33 >= v32 >> 1)
      {
        sub_10015FEC0(v32 > 1, v33 + 1, 1);
        v3 = v62;
      }
      v34 = sub_100136C8C((uint64_t)&v59, v60);
      __chkstk_darwin(v34);
      v36 = (uint64_t *)&v40[-((v35 + 15) & 0xFFFFFFFFFFFFFFF0)];
      (*(void (**)(uint64_t *))(v37 + 16))(v36);
      v38 = *v36;
      v57 = v19;
      v58 = &off_100216818;
      *(_QWORD *)&v56 = v38;
      v3[2] = v33 + 1;
      sub_100136930(&v56, (uint64_t)&v3[5 * v33 + 4]);
      _s7Metrics31ObservabilitySignalDeserializerVwxx_0(&v59);
      v6 = v48 + 40;
      v2 = v49 - 1;
    }
    while (v49 != 1);
  }
  return v3;
}

uint64_t sub_100160F58()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100160F7C(uint64_t a1)
{
  uint64_t v1;

  return sub_10015F5B8(a1, v1);
}

uint64_t sub_100160F94()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100160FB8(uint64_t a1, uint64_t a2, void (*a3)(_QWORD), uint64_t a4)
{
  uint64_t v4;

  return sub_100154D18(a1, a2, a3, a4, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24));
}

uint64_t sub_100160FC0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2, a2);
}

uint64_t sub_100160FD0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100160FD8(unsigned __int8 *a1)
{
  uint64_t v1;

  return sub_10015EF10(a1, v1);
}

uint64_t sub_100160FF0(uint64_t a1, uint64_t a2, void (*a3)(_QWORD), uint64_t a4)
{
  uint64_t v4;

  return sub_100154D58(a1, a2, a3, a4, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24));
}

uint64_t type metadata accessor for ObservabilityReportWorkerParamsRange(uint64_t a1)
{
  return sub_1000AA054(a1, qword_100267F30, (uint64_t)&nominal type descriptor for ObservabilityReportWorkerParamsRange);
}

uint64_t sub_10016100C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100008A18(&qword_100267E40);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for ObservabilityReportWorkerParamsTime(uint64_t a1)
{
  return sub_1000AA054(a1, qword_100267EA0, (uint64_t)&nominal type descriptor for ObservabilityReportWorkerParamsTime);
}

uint64_t sub_100161060(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Date(0);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_10016109C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_1001610E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_100161124(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_100161168(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_1001611AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1001611B8);
}

uint64_t sub_1001611B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for UtcDate(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_1001611F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100161200);
}

uint64_t sub_100161200(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for UtcDate(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_100161240(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;

  result = type metadata accessor for Date(319);
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 256, 1, &v4, a1 + 16);
    return 0;
  }
  return result;
}

_QWORD *sub_1001612A8(_BYTE *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  _BYTE *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v11, a2);
  }
  else
  {
    *a1 = *(_BYTE *)a2;
    v7 = *(int *)(a3 + 20);
    v8 = &a1[v7];
    v9 = (char *)a2 + v7;
    v10 = type metadata accessor for Date(0);
    (*(void (**)(_BYTE *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    *((_BYTE *)v4 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  }
  return v4;
}

uint64_t sub_10016134C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = type metadata accessor for Date(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

_BYTE *sub_100161384(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = type metadata accessor for Date(0);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

_BYTE *sub_1001613FC(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = type metadata accessor for Date(0);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

_BYTE *sub_100161474(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = type metadata accessor for Date(0);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

_BYTE *sub_1001614EC(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = type metadata accessor for Date(0);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

uint64_t sub_100161564(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100161570);
}

uint64_t sub_100161570(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4;
  uint64_t v8;

  if ((_DWORD)a2 == 253)
  {
    v4 = *a1;
    if (v4 >= 3)
      return v4 - 2;
    else
      return 0;
  }
  else
  {
    v8 = type metadata accessor for UtcDate(0);
    return (*(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t sub_1001615E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1001615F0);
}

_BYTE *sub_1001615F0(_BYTE *result, uint64_t a2, int a3, uint64_t a4)
{
  _BYTE *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 253)
  {
    *result = a2 + 2;
  }
  else
  {
    v7 = type metadata accessor for UtcDate(0);
    return (_BYTE *)(*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_100161660(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  v4[0] = &unk_1001BAE08;
  result = type metadata accessor for Date(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(result - 8) + 64;
    v4[2] = &unk_1001BAE08;
    swift_initStructMetadata(a1, 256, 3, v4, a1 + 16);
    return 0;
  }
  return result;
}

unint64_t sub_1001616D4()
{
  unint64_t result;

  result = qword_100267F78;
  if (!qword_100267F78)
  {
    result = swift_getWitnessTable(&unk_1001BB03C, &type metadata for ObservabilityReportWorkerParamsRange.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100267F78);
  }
  return result;
}

unint64_t sub_100161718()
{
  unint64_t result;

  result = qword_100267F80;
  if (!qword_100267F80)
  {
    result = swift_getWitnessTable(&unk_1001BB108, &type metadata for ObservabilityReportType);
    atomic_store(result, (unint64_t *)&qword_100267F80);
  }
  return result;
}

unint64_t sub_10016175C()
{
  unint64_t result;

  result = qword_100267F90;
  if (!qword_100267F90)
  {
    result = swift_getWitnessTable(&unk_1001BB0E0, &type metadata for TimeRange.Duration);
    atomic_store(result, (unint64_t *)&qword_100267F90);
  }
  return result;
}

unint64_t sub_1001617A0()
{
  unint64_t result;

  result = qword_100267FA0;
  if (!qword_100267FA0)
  {
    result = swift_getWitnessTable(&unk_1001BAFEC, &type metadata for ObservabilityReportWorkerParamsTime.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100267FA0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for ObservabilityReportWorkerParamsTime.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_100161824 + 4 * byte_1001BAD00[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_100161844 + 4 * byte_1001BAD05[v4]))();
}

_BYTE *sub_100161824(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_100161844(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10016184C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100161854(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10016185C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100161864(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ObservabilityReportWorkerParamsTime.CodingKeys()
{
  return &type metadata for ObservabilityReportWorkerParamsTime.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for ObservabilityReportWorkerParamsRange.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1001618CC + 4 * byte_1001BAD0F[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_100161900 + 4 * byte_1001BAD0A[v4]))();
}

uint64_t sub_100161900(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100161908(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100161910);
  return result;
}

uint64_t sub_10016191C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100161924);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_100161928(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100161930(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ObservabilityReportWorkerParamsRange.CodingKeys()
{
  return &type metadata for ObservabilityReportWorkerParamsRange.CodingKeys;
}

unint64_t sub_100161950()
{
  unint64_t result;

  result = qword_100267FA8;
  if (!qword_100267FA8)
  {
    result = swift_getWitnessTable(&unk_1001BAF0C, &type metadata for ObservabilityReportWorkerParamsRange.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100267FA8);
  }
  return result;
}

unint64_t sub_100161998()
{
  unint64_t result;

  result = qword_100267FB0;
  if (!qword_100267FB0)
  {
    result = swift_getWitnessTable(&unk_1001BAFC4, &type metadata for ObservabilityReportWorkerParamsTime.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100267FB0);
  }
  return result;
}

unint64_t sub_1001619E0()
{
  unint64_t result;

  result = qword_100267FB8;
  if (!qword_100267FB8)
  {
    result = swift_getWitnessTable(&unk_1001BAF34, &type metadata for ObservabilityReportWorkerParamsTime.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100267FB8);
  }
  return result;
}

unint64_t sub_100161A28()
{
  unint64_t result;

  result = qword_100267FC0;
  if (!qword_100267FC0)
  {
    result = swift_getWitnessTable(&unk_1001BAF5C, &type metadata for ObservabilityReportWorkerParamsTime.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100267FC0);
  }
  return result;
}

unint64_t sub_100161A70()
{
  unint64_t result;

  result = qword_100267FC8;
  if (!qword_100267FC8)
  {
    result = swift_getWitnessTable(&unk_1001BAE7C, &type metadata for ObservabilityReportWorkerParamsRange.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100267FC8);
  }
  return result;
}

unint64_t sub_100161AB8()
{
  unint64_t result;

  result = qword_100267FD0;
  if (!qword_100267FD0)
  {
    result = swift_getWitnessTable(&unk_1001BAEA4, &type metadata for ObservabilityReportWorkerParamsRange.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100267FD0);
  }
  return result;
}

uint64_t sub_100161AFC(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  unint64_t v7;
  char v8;

  if (a1 == 0x74726F706572 && a2 == 0xE600000000000000)
  {
    v5 = 0xE600000000000000;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x74726F706572, 0xE600000000000000, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x7472617473 && a2 == 0xE500000000000000)
  {
    v7 = 0xE500000000000000;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x7472617473, 0xE500000000000000, a1, a2, 0) & 1) != 0)
  {
    v7 = a2;
    goto LABEL_14;
  }
  if (a1 == 0x6E6F697461727564 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease(0xE800000000000000);
    return 2;
  }
  else
  {
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6E6F697461727564, 0xE800000000000000, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v8 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t *sub_100161C4C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  _OWORD *v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v19 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v19, a2);
  }
  else
  {
    v7 = type metadata accessor for Date(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    v9 = (_OWORD *)((char *)a1 + v8);
    v10 = (_OWORD *)((char *)a2 + v8);
    v11 = v10[1];
    *v9 = *v10;
    v9[1] = v11;
    v9[2] = v10[2];
    v12 = a3[8];
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    *(uint64_t *)((char *)a1 + v12) = *(uint64_t *)((char *)a2 + v12);
    v13 = a3[9];
    v14 = a3[10];
    v15 = (char *)a1 + v13;
    v16 = (char *)a2 + v13;
    v17 = *((_OWORD *)v16 + 1);
    *(_OWORD *)v15 = *(_OWORD *)v16;
    *((_OWORD *)v15 + 1) = v17;
    *((_OWORD *)v15 + 2) = *((_OWORD *)v16 + 2);
    v15[48] = v16[48];
    *(uint64_t *)((char *)a1 + v14) = *(uint64_t *)((char *)a2 + v14);
    v18 = a3[12];
    *(uint64_t *)((char *)a1 + a3[11]) = *(uint64_t *)((char *)a2 + a3[11]);
    *(uint64_t *)((char *)a1 + v18) = *(uint64_t *)((char *)a2 + v18);
    *(uint64_t *)((char *)a1 + a3[13]) = *(uint64_t *)((char *)a2 + a3[13]);
  }
  return a1;
}

uint64_t sub_100161D4C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  _OWORD *v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;

  v6 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  v8 = (_OWORD *)(a1 + v7);
  v9 = (_OWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  v8[2] = v9[2];
  v11 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v11) = *(_QWORD *)(a2 + v11);
  v12 = a3[9];
  v13 = a3[10];
  v14 = a1 + v12;
  v15 = a2 + v12;
  v16 = *(_OWORD *)(v15 + 16);
  *(_OWORD *)v14 = *(_OWORD *)v15;
  *(_OWORD *)(v14 + 16) = v16;
  *(_OWORD *)(v14 + 32) = *(_OWORD *)(v15 + 32);
  *(_BYTE *)(v14 + 48) = *(_BYTE *)(v15 + 48);
  *(_QWORD *)(a1 + v13) = *(_QWORD *)(a2 + v13);
  v17 = a3[12];
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  *(_QWORD *)(a1 + v17) = *(_QWORD *)(a2 + v17);
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  return a1;
}

uint64_t sub_100161E20(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;

  v6 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  v7 = a3[6];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  v8[2] = v9[2];
  v8[3] = v9[3];
  v8[4] = v9[4];
  v8[5] = v9[5];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  v10 = a3[9];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = *(_BYTE *)(v12 + 8);
  *(_QWORD *)v11 = *(_QWORD *)v12;
  *(_BYTE *)(v11 + 8) = v13;
  v14 = *(_BYTE *)(v12 + 24);
  *(_QWORD *)(v11 + 16) = *(_QWORD *)(v12 + 16);
  *(_BYTE *)(v11 + 24) = v14;
  *(_QWORD *)(v11 + 32) = *(_QWORD *)(v12 + 32);
  v15 = *(_QWORD *)(v12 + 40);
  *(_BYTE *)(v11 + 48) = *(_BYTE *)(v12 + 48);
  *(_QWORD *)(v11 + 40) = v15;
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  *(_QWORD *)(a1 + a3[12]) = *(_QWORD *)(a2 + a3[12]);
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  return a1;
}

uint64_t sub_100161F44(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  _OWORD *v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;

  v6 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  v8 = (_OWORD *)(a1 + v7);
  v9 = (_OWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  v8[2] = v9[2];
  v11 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v11) = *(_QWORD *)(a2 + v11);
  v12 = a3[9];
  v13 = a3[10];
  v14 = a1 + v12;
  v15 = a2 + v12;
  v16 = *(_OWORD *)(v15 + 16);
  *(_OWORD *)v14 = *(_OWORD *)v15;
  *(_OWORD *)(v14 + 16) = v16;
  *(_OWORD *)(v14 + 32) = *(_OWORD *)(v15 + 32);
  *(_BYTE *)(v14 + 48) = *(_BYTE *)(v15 + 48);
  *(_QWORD *)(a1 + v13) = *(_QWORD *)(a2 + v13);
  v17 = a3[12];
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  *(_QWORD *)(a1 + v17) = *(_QWORD *)(a2 + v17);
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  return a1;
}

uint64_t sub_100162018(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  _OWORD *v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  v8 = (_OWORD *)(a1 + v7);
  v9 = (_OWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  v8[2] = v9[2];
  v11 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v11) = *(_QWORD *)(a2 + v11);
  v12 = a3[9];
  v13 = a3[10];
  v14 = a1 + v12;
  v15 = a2 + v12;
  *(_QWORD *)v14 = *(_QWORD *)v15;
  *(_BYTE *)(v14 + 8) = *(_BYTE *)(v15 + 8);
  *(_QWORD *)(v14 + 16) = *(_QWORD *)(v15 + 16);
  *(_BYTE *)(v14 + 24) = *(_BYTE *)(v15 + 24);
  v16 = *(_QWORD *)(v15 + 40);
  *(_QWORD *)(v14 + 32) = *(_QWORD *)(v15 + 32);
  *(_QWORD *)(v14 + 40) = v16;
  *(_BYTE *)(v14 + 48) = *(_BYTE *)(v15 + 48);
  *(_QWORD *)(a1 + v13) = *(_QWORD *)(a2 + v13);
  v17 = a3[12];
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  *(_QWORD *)(a1 + v17) = *(_QWORD *)(a2 + v17);
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  return a1;
}

uint64_t sub_100162104(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100162110);
}

uint64_t sub_100162110(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Date(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_10016214C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100162158);
}

uint64_t sub_100162158(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Date(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for ObservabilityHourlyReport(uint64_t a1)
{
  uint64_t result;

  result = qword_100268038;
  if (!qword_100268038)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ObservabilityHourlyReport);
  return result;
}

uint64_t sub_1001621D4(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[10];

  result = type metadata accessor for Date(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[2] = "0";
    v4[3] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[4] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[5] = &unk_1001BB0C8;
    v4[6] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[7] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[8] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[9] = (char *)&value witness table for Builtin.Int64 + 64;
    swift_initStructMetadata(a1, 256, 10, v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t *sub_100162268(uint64_t a1, uint64_t a2, void (*a3)(_QWORD))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *object;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  _OWORD v33[9];
  _QWORD v34[3];
  uint64_t v35;
  uint64_t v36[18];
  _QWORD v37[18];
  Swift::String v38[9];
  _OWORD v39[10];

  v6 = type metadata accessor for String.Encoding(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2)
    goto LABEL_4;
  v10 = type metadata accessor for JSONDecoder(0);
  swift_allocObject(v10, *(unsigned int *)(v10 + 48), *(unsigned __int16 *)(v10 + 52));
  v11 = JSONDecoder.init()();
  static String.Encoding.utf8.getter(v11);
  v12 = String.data(using:allowLossyConversion:)(v9, 0, a1, a2);
  v14 = v13;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if (v14 >> 60 == 15)
  {
    swift_release(v11);
LABEL_4:
    sub_100162F6C((uint64_t)v39);
    sub_100162F90((uint64_t)v39, (uint64_t)v38);
    goto LABEL_5;
  }
  v19 = sub_1001630CC();
  dispatch thunk of JSONDecoder.decode<A>(_:from:)(v38, &type metadata for MetricsInjector.MetricsInjectorParams, v12, v14, &type metadata for MetricsInjector.MetricsInjectorParams, v19);
  nullsub_1(v38);
  sub_1000ABBF0(v12, v14);
  swift_release(v11);
LABEL_5:
  sub_100162F90((uint64_t)v38, (uint64_t)v36);
  sub_100162F90((uint64_t)v36, (uint64_t)v37);
  if (sub_100162FD8((uint64_t)v37) == 1)
  {
    v15 = sub_1001554F0();
    v16 = swift_allocError(&type metadata for TestingRigError, v15, 0, 0);
    *v17 = 0xD00000000000001DLL;
    v17[1] = 0x80000001001F5AC0;
    swift_willThrow();
    v36[0] = v16;
    swift_errorRetain(v16);
    v20 = sub_100008A18(&qword_1002674A8);
    if (swift_dynamicCast(v38, v36, v20, &type metadata for TestingRigError, 0))
    {
      swift_errorRelease(v16);
      object = v38[0]._object;
      strcpy((char *)v37, "Parse Error: ");
      HIWORD(v37[1]) = -4864;
      String.append(_:)(v38[0]);
      swift_bridgeObjectRelease(object);
      v22 = v37[1];
      ((void (*)(_QWORD, _QWORD))a3)(v37[0], v37[1]);
      swift_bridgeObjectRelease(v22);
      return (uint64_t *)swift_errorRelease(v36[0]);
    }
    else
    {
      swift_errorRelease(v36[0]);
      swift_getErrorValue(v16, &v35, v34);
      v23 = Error.localizedDescription.getter(v34[1], v34[2]);
      v25 = v24;
      v26 = String.debugDescription.getter(v23);
      v28 = v27;
      swift_bridgeObjectRelease(v25);
      ((void (*)(uint64_t, uint64_t))a3)(v26, v28);
      swift_bridgeObjectRelease(v28);
      return (uint64_t *)swift_errorRelease(v16);
    }
  }
  else
  {
    sub_100162F90((uint64_t)v36, (uint64_t)v33);
    v39[6] = v33[6];
    v39[7] = v33[7];
    v39[8] = v33[8];
    v39[2] = v33[2];
    v39[3] = v33[3];
    v39[4] = v33[4];
    v39[5] = v33[5];
    v39[0] = v33[0];
    v39[1] = v33[1];
    v18 = sub_100143DA0((uint64_t)v39);
    v30 = v29;
    a3(v18);
    swift_bridgeObjectRelease(v30);
    return sub_100162FFC(v36);
  }
}

uint64_t sub_1001625D0@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_100162B1C(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_1001625F8@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_100162D40(a1);
  if (!v2)
    *a2 = result;
  return result;
}

id sub_100162620()
{
  id result;

  result = sub_10016263C();
  qword_10026D240 = (uint64_t)result;
  return result;
}

id sub_10016263C()
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
  NSString v10;
  uint64_t v11;
  Class v12;
  uint64_t v14;

  v0 = type metadata accessor for TimeZone(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for Locale(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_msgSend(objc_allocWithZone((Class)NSDateFormatter), "init");
  Locale.init(identifier:)(0x4F505F53555F6E65, 0xEB00000000584953);
  isa = Locale._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  objc_msgSend(v8, "setLocale:", isa);

  v10 = String._bridgeToObjectiveC()();
  objc_msgSend(v8, "setDateFormat:", v10);

  if (qword_100264E80 != -1)
    swift_once(&qword_100264E80, sub_10015B3D8);
  v11 = sub_10000ABD8(v0, (uint64_t)qword_10026D228);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v11, v0);
  v12 = TimeZone._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  objc_msgSend(v8, "setTimeZone:", v12);

  return v8;
}

uint64_t sub_10016280C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  NSString v25;
  id v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  void (*v32)(char *, char *, uint64_t);
  uint64_t v33;
  unint64_t v34;
  uint64_t *v35;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  _QWORD v44[3];
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;

  v42 = a2;
  v3 = sub_100008A18(&qword_100262C10);
  __chkstk_darwin(v3);
  v5 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Date(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v37 - v11;
  v13 = type metadata accessor for UtcDate(0);
  __chkstk_darwin(v13);
  v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = a1[3];
  v17 = a1[4];
  v47 = a1;
  sub_10000B748(a1, v16);
  v18 = v43;
  dispatch thunk of Decoder.singleValueContainer()(v44, v16, v17);
  if (!v18)
  {
    v38 = v10;
    v39 = v15;
    v40 = v7;
    v41 = v12;
    v43 = v5;
    v20 = v45;
    v19 = v46;
    sub_10000B748(v44, v45);
    v21 = dispatch thunk of SingleValueDecodingContainer.decode(_:)(v20, v19);
    v23 = v22;
    _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v44);
    if (qword_100264E88 != -1)
      swift_once(&qword_100264E88, sub_100162620);
    v24 = (id)qword_10026D240;
    v37 = v21;
    v25 = String._bridgeToObjectiveC()();
    v26 = objc_msgSend(v24, "dateFromString:", v25);

    v27 = v6;
    v29 = v40;
    v28 = v41;
    v30 = v38;
    v31 = (uint64_t)v39;
    if (v26)
    {
      static Date._unconditionallyBridgeFromObjectiveC(_:)(v26);

      v32 = *(void (**)(char *, char *, uint64_t))(v29 + 32);
      v33 = (uint64_t)v43;
      v32(v43, v30, v27);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v29 + 56))(v33, 0, 1, v27);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v29 + 48))(v33, 1, v27) != 1)
      {
        swift_bridgeObjectRelease(v23);
        v32(v28, (char *)v33, v27);
        v32((char *)v31, v28, v27);
        sub_1001631F0(v31, v42);
        return _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v47);
      }
    }
    else
    {
      v33 = (uint64_t)v43;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v40 + 56))(v43, 1, 1, v27);
    }
    sub_10000D51C(v33);
    v34 = sub_1001554F0();
    swift_allocError(&type metadata for TestingRigError, v34, 0, 0);
    *v35 = v37;
    v35[1] = v23;
    swift_willThrow();
  }
  return _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v47);
}

uint64_t sub_100162B08@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10016280C(a1, a2);
}

uint64_t sub_100162B1C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t *v16;
  _QWORD v17[3];
  uint64_t v18;
  uint64_t v19;

  v3 = a1[3];
  v4 = a1[4];
  v5 = (uint64_t)sub_10000B748(a1, v3);
  dispatch thunk of Decoder.singleValueContainer()(v17, v3, v4);
  if (!v1)
  {
    v6 = v18;
    v7 = v19;
    sub_10000B748(v17, v18);
    v8 = dispatch thunk of SingleValueDecodingContainer.decode(_:)(v6, v7);
    v5 = v9;
    _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v17);
    if (v8 == 0x63696E756D6D6F63 && v5 == 0xED00006E6F697461)
    {
      v12 = 0xED00006E6F697461;
      goto LABEL_11;
    }
    if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x63696E756D6D6F63, 0xED00006E6F697461, v8, v5, 0) & 1) != 0)
    {
      v12 = v5;
LABEL_11:
      swift_bridgeObjectRelease(v12);
      v5 = 0;
      goto LABEL_3;
    }
    if (v8 == 0x796C72756F68 && v5 == 0xE600000000000000)
    {
      v13 = 0xE600000000000000;
LABEL_17:
      swift_bridgeObjectRelease(v13);
      v5 = 1;
      goto LABEL_3;
    }
    if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x796C72756F68, 0xE600000000000000, v8, v5, 0) & 1) != 0)
    {
      v13 = v5;
      goto LABEL_17;
    }
    if (v8 == 0x796C696164 && v5 == 0xE500000000000000)
    {
      v14 = 0xE500000000000000;
    }
    else
    {
      if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x796C696164, 0xE500000000000000, v8, v5, 0) & 1) == 0)
      {
        v15 = sub_1001554F0();
        swift_allocError(&type metadata for TestingRigError, v15, 0, 0);
        *v16 = v8;
        v16[1] = v5;
        swift_willThrow();
        goto LABEL_3;
      }
      v14 = v5;
    }
    swift_bridgeObjectRelease(v14);
    v5 = 2;
  }
LABEL_3:
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0(a1);
  return v5;
}

uint64_t sub_100162D40(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t *v16;
  _QWORD v17[3];
  uint64_t v18;
  uint64_t v19;

  v3 = a1[3];
  v4 = a1[4];
  v5 = (uint64_t)sub_10000B748(a1, v3);
  dispatch thunk of Decoder.singleValueContainer()(v17, v3, v4);
  if (!v1)
  {
    v6 = v18;
    v7 = v19;
    sub_10000B748(v17, v18);
    v8 = dispatch thunk of SingleValueDecodingContainer.decode(_:)(v6, v7);
    v5 = v9;
    _s7Metrics31ObservabilitySignalDeserializerVwxx_0(v17);
    if (v8 == 0x796144656E6FLL && v5 == 0xE600000000000000)
    {
      v12 = 0xE600000000000000;
      goto LABEL_11;
    }
    if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x796144656E6FLL, 0xE600000000000000, v8, v5, 0) & 1) != 0)
    {
      v12 = v5;
LABEL_11:
      swift_bridgeObjectRelease(v12);
      v5 = 0;
      goto LABEL_3;
    }
    if (v8 == 0x72756F48656E6FLL && v5 == 0xE700000000000000)
    {
      v13 = 0xE700000000000000;
LABEL_17:
      swift_bridgeObjectRelease(v13);
      v5 = 1;
      goto LABEL_3;
    }
    if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x72756F48656E6FLL, 0xE700000000000000, v8, v5, 0) & 1) != 0)
    {
      v13 = v5;
      goto LABEL_17;
    }
    if (v8 == 0x4D6E656574666966 && v5 == 0xEE00736574756E69)
    {
      v14 = 0xEE00736574756E69;
    }
    else
    {
      if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x4D6E656574666966, 0xEE00736574756E69, v8, v5, 0) & 1) == 0)
      {
        v15 = sub_1001554F0();
        swift_allocError(&type metadata for TestingRigError, v15, 0, 0);
        *v16 = v8;
        v16[1] = v5;
        swift_willThrow();
        goto LABEL_3;
      }
      v14 = v5;
    }
    swift_bridgeObjectRelease(v14);
    v5 = 2;
  }
LABEL_3:
  _s7Metrics31ObservabilitySignalDeserializerVwxx_0(a1);
  return v5;
}

double sub_100162F6C(uint64_t a1)
{
  double result;

  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 1;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  return result;
}

uint64_t sub_100162F90(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100008A18(&qword_100268090);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100162FD8(uint64_t a1)
{
  unint64_t v1;
  int v2;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  v2 = v1 - 1;
  if (v2 < 0)
    v2 = -1;
  return (v2 + 1);
}

uint64_t *sub_100162FFC(uint64_t *a1)
{
  sub_100163054(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15], a1[16], a1[17]);
  return a1;
}

uint64_t sub_100163054(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t result;

  if (a8 != 1)
  {
    swift_bridgeObjectRelease(a8);
    swift_bridgeObjectRelease(a10);
    swift_bridgeObjectRelease(a12);
    swift_bridgeObjectRelease(a13);
    swift_bridgeObjectRelease(a15);
    swift_bridgeObjectRelease(a17);
    return swift_bridgeObjectRelease(a18);
  }
  return result;
}

unint64_t sub_1001630CC()
{
  unint64_t result;

  result = qword_100268098;
  if (!qword_100268098)
  {
    result = swift_getWitnessTable(&unk_1001B97E0, &type metadata for MetricsInjector.MetricsInjectorParams);
    atomic_store(result, (unint64_t *)&qword_100268098);
  }
  return result;
}

uint64_t sub_100163110(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10016311C);
}

uint64_t sub_10016311C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Date(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_100163158(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100163164);
}

uint64_t sub_100163164(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Date(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for UtcDate(uint64_t a1)
{
  uint64_t result;

  result = qword_1002680F8;
  if (!qword_1002680F8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for UtcDate);
  return result;
}

ValueMetadata *type metadata accessor for TestingRigError()
{
  return &type metadata for TestingRigError;
}

uint64_t sub_1001631F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for UtcDate(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

BOOL sub_100165840(double *a1)
{
  void *v2;
  _QWORD *v3;
  _BOOL8 v4;
  _QWORD *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;

  if (!a1)
    return 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "filesEnumerator"));
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "nextObject"));

  v4 = v3 != 0;
  if (v3)
  {
    v5 = sub_100166D58(v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(v6, "timeIntervalSince1970");
    v8 = v7;
    v9 = a1[1];

    if (v8 >= v9)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "ancientItemBlock"));

      if (!v12)
        goto LABEL_10;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "now"));
      v14 = sub_100166CDC(v3);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      objc_msgSend(v13, "timeIntervalSinceDate:", v15);
      v17 = v16;

      if (v17 <= a1[2])
        goto LABEL_10;
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "ancientItemBlock"));
      goto LABEL_9;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "removalBlock"));

    if (v10)
    {
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "removalBlock"));
LABEL_9:
      v18 = (void *)v11;
      (*(void (**)(uint64_t, _QWORD *))(v11 + 16))(v11, v3);

    }
  }
LABEL_10:

  return v4;
}

void sub_100165E88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100165EC4(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = sub_10010344C(a2);
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v2, "_removeItem:", v4);

}

void sub_100165F08(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = sub_10010344C(a2);
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v2, "_handleAncientItem:", v4);

}

void sub_100165F4C(uint64_t a1)
{
  unsigned int *WeakRetained;
  id v3;
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  unsigned int v7;
  unsigned int v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  int v11;
  const __CFString *v12;
  __int16 v13;
  unsigned int v14;
  __int16 v15;
  unsigned int v16;

  WeakRetained = (unsigned int *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
    v4 = APLogForCategory(33);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("completed");
      v7 = atomic_load(WeakRetained + 2);
      v8 = atomic_load(WeakRetained + 3);
      v11 = 138543874;
      if ((_DWORD)v3)
        v6 = CFSTR("cancelled");
      v12 = v6;
      v13 = 1026;
      v14 = v7;
      v15 = 1026;
      v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Garbage collection was %{public}@. Removed objects: %{public}d, ancient objects: %{public}d.", (uint8_t *)&v11, 0x18u);
    }

    objc_msgSend(*(id *)(a1 + 32), "duration");
    objc_msgSend(WeakRetained, "_reportStatisticsForDuration:storageInfo:cancelled:", *(_QWORD *)(a1 + 40), v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "completionHandler"));

    if (v9)
    {
      v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "completionHandler"));
      ((void (**)(_QWORD, id))v10)[2](v10, v3);

      objc_msgSend(WeakRetained, "setCompletionHandler:", 0);
    }
  }

}

void sub_100166284(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1001662A8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_removeItemInBlockForKey:", *(_QWORD *)(a1 + 32));

}

id sub_100166864(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[2];
  const __CFString *v19;
  const __CFString *v20;
  uint8_t buf[4];
  id v22;

  v5 = a2;
  objc_opt_self(a1);
  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pathComponents"));
    if (objc_msgSend(v6, "count"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 0));
      v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("/"));

      if (v8)
      {
        v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subarrayWithRange:", 1, (char *)objc_msgSend(v6, "count") - 1));

        v6 = (void *)v9;
      }
    }
    if (objc_msgSend(v6, "count") == (id)1 || objc_msgSend(v6, "count") == (id)2)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", &stru_100219118));
    }
    else
    {
      v13 = APLogForCategory(32);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        v22 = v5;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "File path contains illegal characters. %{private}@", buf, 0xCu);
      }

      if (a3)
      {
        v17[0] = CFSTR("name");
        v17[1] = CFSTR("reason");
        v18[0] = v5;
        v18[1] = CFSTR("File path contains illegal characters.");
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2));
        *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("APFileSystemNameErrorDomain"), 2, v15));

      }
      v10 = 0;
    }
  }
  else
  {
    v11 = APLogForCategory(32);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v22 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "File path is empty. %{private}@", buf, 0xCu);
    }

    if (!a3)
    {
      v10 = 0;
      goto LABEL_18;
    }
    v19 = CFSTR("reason");
    v20 = CFSTR("File path is empty.");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    v10 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("APFileSystemNameErrorDomain"), 2, v6));
  }

LABEL_18:
  return v10;
}

id *sub_100166B2C(id *a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  id v10;
  id *v11;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (a1)
  {
    v11 = objc_msgSend(a1, "init");
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 5, a4);
      objc_storeStrong(a1 + 3, a2);
      objc_storeStrong(a1 + 4, a3);
    }
  }

  return a1;
}

_QWORD *sub_100166CDC(_QWORD *a1)
{
  _QWORD *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[1];
    if (!v2)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fileManager"));
      v4 = (id)v1[4];
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "createdDateForFileAtPath:error:", v4, 0));
      v6 = (void *)v1[1];
      v1[1] = v5;

      v2 = (void *)v1[1];
    }
    a1 = v2;
  }
  return a1;
}

_QWORD *sub_100166D58(_QWORD *a1)
{
  _QWORD *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[2];
    if (!v2)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fileManager"));
      v4 = (id)v1[4];
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastModifiedDateForFileAtPath:error:", v4, 0));
      v6 = (void *)v1[2];
      v1[2] = v5;

      v2 = (void *)v1[2];
    }
    a1 = v2;
  }
  return a1;
}

NSString *__cdecl sub_1001679AC(id a1, id a2)
{
  return (NSString *)sub_10010344C((uint64_t)a2);
}

void sub_100167B38(uint64_t a1)
{
  uintptr_t data;
  const __CFString *v2;
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  const __CFString *v7;

  data = dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32));
  if (data != 1)
  {
    v2 = CFSTR("WARNING");
    if (data != 2)
      v2 = 0;
    if (data == 4)
      v3 = CFSTR("CRITICAL");
    else
      v3 = v2;
    v4 = APLogForCategory(32);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = 138543362;
      v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Cache Stats: Received a memory pressure event: %{public}@", (uint8_t *)&v6, 0xCu);
    }

  }
}

void sub_100167C08(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_printCacheStatistics");

}

void sub_100167F94(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_printCacheStatistics");

}

void sub_100169874(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_handleRankedRepresentations:params:", v4, *(_QWORD *)(a1 + 32));

}

void sub_100169DA0(id *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;

  v6 = a2;
  if (objc_msgSend(a1[4], "countForObject:", v6))
  {
    v7 = a1[5];
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "bundleID"));
    objc_msgSend(v7, "markInUseByClientWithId:", v8);

    objc_msgSend(a1[4], "removeObject:", v6);
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "deliveryBlock"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "contentData"));
    v12 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    ((void (**)(_QWORD, void *))v9)[2](v9, v11);

    *a4 = 1;
  }

}

void sub_10016A6BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10016A798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10016A7BC(id *a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v3 = a2;
  v4 = (void *)os_transaction_create("com.apple.ap.promotedcontentd.integrity-listener");
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016A8AC;
  block[3] = &unk_10020DF88;
  objc_copyWeak(&v12, a1);
  v10 = v3;
  v11 = v4;
  v7 = v4;
  v8 = v3;
  dispatch_async(v6, block);

  objc_destroyWeak(&v12);
}

void sub_10016A8AC(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_storeIntegrityEvent:", *(_QWORD *)(a1 + 32));

}

void sub_10016ADC4(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  int v23;

  v5 = a3;
  switch(a2)
  {
    case 1:
      v6 = APLogForCategory(23);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v8 = *(_QWORD *)(a1 + 32);
        v20 = 136380675;
        v21 = v8;
        v9 = "connection at %{private}s waiting";
        goto LABEL_12;
      }
      break;
    case 3:
      v14 = APLogForCategory(23);
      v7 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v15 = *(_QWORD *)(a1 + 32);
        v20 = 136380675;
        v21 = v15;
        v9 = "connection at %{private}s is ready";
        goto LABEL_12;
      }
      break;
    case 4:
      v16 = APLogForCategory(23);
      v7 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v17 = *(_QWORD *)(a1 + 32);
        v20 = 136380675;
        v21 = v17;
        v9 = "connection at %{private}s failed";
        goto LABEL_12;
      }
      break;
    case 5:
      v18 = APLogForCategory(23);
      v7 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v19 = *(_QWORD *)(a1 + 32);
        v20 = 136380675;
        v21 = v19;
        v9 = "connection at %{private}s is cancelled ";
LABEL_12:
        v12 = v7;
        v13 = 12;
        goto LABEL_13;
      }
      break;
    default:
      v10 = APLogForCategory(23);
      v7 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v11 = *(_QWORD *)(a1 + 32);
        v20 = 136380931;
        v21 = v11;
        v22 = 1026;
        v23 = a2;
        v9 = "connection at %{private}s state %{public}d";
        v12 = v7;
        v13 = 18;
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, v9, (uint8_t *)&v20, v13);
      }
      break;
  }

}

void sub_10016B0D8(id a1, OS_nw_error *a2)
{
  OS_nw_error *v2;
  OS_nw_error *v3;
  int error_code;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  int v9;
  OS_nw_error *v10;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    error_code = nw_error_get_error_code((nw_error_t)v2);
    v5 = APLogForCategory(23);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (error_code == 57)
    {
      if (v7)
      {
        v9 = 138543362;
        v10 = v3;
        v8 = "Error sending data socket not connected %{public}@";
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v9, 0xCu);
      }
    }
    else if (v7)
    {
      v9 = 138543362;
      v10 = v3;
      v8 = "Error sending data %{public}@";
      goto LABEL_7;
    }

  }
}

void sub_10016B4EC(id a1)
{
  NSArray *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  _QWORD v18[3];

  v1 = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastObject"));

  v18[0] = v3;
  v18[1] = CFSTR("com.apple.ap.promotedcontentd");
  v18[2] = CFSTR("ecs");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 3));
  v5 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](NSURL, "fileURLWithPathComponents:", v4));
  v6 = (void *)qword_10026D0F8;
  qword_10026D0F8 = v5;

  v7 = objc_alloc_init((Class)NSFileManager);
  v13 = 0;
  objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", qword_10026D0F8, 1, 0, &v13);
  v8 = v13;
  if (v8)
  {
    v9 = APLogForCategory(29);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_msgSend(v8, "code");
      *(_DWORD *)buf = 134349315;
      v15 = v11;
      v16 = 2113;
      v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to create sessions folder. Code: %{public}ld. %{private}@", buf, 0x16u);
    }

    v12 = (void *)qword_10026D0F8;
    qword_10026D0F8 = 0;

  }
}

id sub_10016B8D8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = (void *)objc_opt_self(a1);
  objc_opt_self(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[APPersistentCacheStoreProvider persistentCacheStore](APPersistentCacheStoreProvider, "persistentCacheStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cacheKeyForIdentifier:", v3));

  v7 = objc_msgSend(v5, "isObjectAliveForKey:", v6);
  return v7;
}

id sub_10016B95C(id result)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  if (result)
  {
    v1 = result;
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[APPersistentCacheStoreProvider persistentCacheStore](APPersistentCacheStoreProvider, "persistentCacheStore"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "createTransaction"));

    sub_10000E19C(v1, v3);
    v4 = objc_msgSend(v3, "commit");

    return v4;
  }
  return result;
}

id sub_10016B9C8(id result)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (result)
  {
    v1 = result;
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[APPersistentCacheStoreProvider persistentCacheStore](APPersistentCacheStoreProvider, "persistentCacheStore"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "createTransaction"));

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[APPersistentCacheStoreProvider persistentCacheStore](APPersistentCacheStoreProvider, "persistentCacheStore"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "cacheKey"));
    objc_msgSend(v4, "removeObjectForKey:transaction:", v5, v3);

    v6 = objc_msgSend(v3, "commit");
    return v6;
  }
  return result;
}

void sub_10016BA60(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    v5 = (id)objc_claimAutoreleasedReturnValue(+[APPersistentCacheStoreProvider persistentCacheStore](APPersistentCacheStoreProvider, "persistentCacheStore"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cacheKey"));
    objc_msgSend(v5, "removeObjectForKey:transaction:", v4, v3);

  }
}

void sub_10016BAE0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = a2;
  v7 = (void *)objc_opt_self(a1);
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cacheKeyForIdentifier:", v6));

  objc_opt_self(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[APPersistentCacheStoreProvider persistentCacheStore](APPersistentCacheStoreProvider, "persistentCacheStore"));
  objc_msgSend(v8, "removeObjectForKey:transaction:", v9, v5);

}

id sub_10016BB74(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = (void *)objc_opt_self(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cacheKeyForIdentifier:", v3));

  objc_opt_self(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[APPersistentCacheStoreProvider persistentCacheStore](APPersistentCacheStoreProvider, "persistentCacheStore"));
  v7 = objc_msgSend(v6, "hasObjectForKey:", v5);

  return v7;
}

void sub_10016BBF4(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    v5 = (id)objc_claimAutoreleasedReturnValue(+[APPersistentCacheStoreProvider persistentCacheStore](APPersistentCacheStoreProvider, "persistentCacheStore"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cacheKey"));
    objc_msgSend(v5, "touchObjectForKey:transaction:", v4, v3);

  }
}

id cloneSecureCodingObject(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a1, 1, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", a2, v3, 0));

  return v4;
}

void sub_10016CA44(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10016CBA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10016CBC8(id *a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v3 = a2;
  v4 = (void *)os_transaction_create("com.apple.ap.promotedcontentd.event-storage-listener");
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016CCB8;
  block[3] = &unk_10020DF88;
  objc_copyWeak(&v12, a1);
  v10 = v3;
  v11 = v4;
  v7 = v4;
  v8 = v3;
  dispatch_async(v6, block);

  objc_destroyWeak(&v12);
}

void sub_10016CCB8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_storeEvent:", *(_QWORD *)(a1 + 32));

}

void sub_10016D5F8(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  char v23;
  _QWORD v24[4];
  id v25;
  char v26;

  v2 = objc_autoreleasePoolPush();
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10016D7EC;
  v24[3] = &unk_1002188D0;
  v26 = *(_BYTE *)(a1 + 72);
  v25 = *(id *)(a1 + 32);
  +[APAMSBagManager shouldUseAMSMescalWithCompletionHandler:](APAMSBagManager, "shouldUseAMSMescalWithCompletionHandler:", v24);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10016D8B8;
  v21[3] = &unk_1002188D0;
  v22 = *(id *)(a1 + 32);
  v23 = *(_BYTE *)(a1 + 73);
  +[APAMSBagManager httpUseFixedHttpSessionManagerWithCompletionHandler:](APAMSBagManager, "httpUseFixedHttpSessionManagerWithCompletionHandler:", v21);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10016D9A0;
  v18[3] = &unk_1002188F8;
  v19 = *(id *)(a1 + 32);
  v20 = *(_QWORD *)(a1 + 40);
  +[APAMSBagManager httpLookBackWindowWithCompletionHandler:](APAMSBagManager, "httpLookBackWindowWithCompletionHandler:", v18);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10016DA8C;
  v15[3] = &unk_100218920;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  v16 = v3;
  v17 = v4;
  +[APAMSBagManager httpMaximumConnectionsPerHostWithCompletionHandler:](APAMSBagManager, "httpMaximumConnectionsPerHostWithCompletionHandler:", v15);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10016DB70;
  v12[3] = &unk_100218920;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 56);
  v13 = v5;
  v14 = v6;
  +[APAMSBagManager httpMaximumConnectionsPerHostTempSessionWithCompletionHandler:](APAMSBagManager, "httpMaximumConnectionsPerHostTempSessionWithCompletionHandler:", v12);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10016DC54;
  v9[3] = &unk_100218920;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 64);
  v10 = v7;
  v11 = v8;
  +[APAMSBagManager cacheSizeWithCompletionHandler:](APAMSBagManager, "cacheSizeWithCompletionHandler:", v9);

  objc_autoreleasePoolPop(v2);
}

id *sub_10016D7EC(id *result, uint64_t a2)
{
  id *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;

  if (*((unsigned __int8 *)result + 40) != (_DWORD)a2)
  {
    v3 = result;
    v4 = APLogForCategory(41);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = 134349056;
      v7 = a2;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Loaded new 'useAMSMescal' value from Bag: %{public}ld", (uint8_t *)&v6, 0xCu);
    }

    return (id *)objc_msgSend(v3[4], "setUseAMSMescalValue:", a2);
  }
  return result;
}

void sub_10016D8B8(uint64_t a1, id a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;

  v5 = a3;
  if (v5)
    a2 = objc_msgSend(*(id *)(a1 + 32), "httpUseFixedHttpSessionManagerDefaultValue");
  if (*(unsigned __int8 *)(a1 + 40) != (_DWORD)a2)
  {
    v6 = APLogForCategory(41);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = 134349056;
      v9 = a2;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Loaded new 'useFixedHttpSessionManager' value from Bag: %{public}ld", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setHttpUseFixedHttpSessionManagerValue:", a2);
  }

}

void sub_10016D9A0(uint64_t a1, void *a2, double a3)
{
  id v5;
  double v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  double v10;

  v5 = a2;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "httpLookBackWindowDefaultValue");
    a3 = v6;
  }
  if (*(double *)(a1 + 40) != a3)
  {
    v7 = APLogForCategory(41);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = 134349056;
      v10 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Loaded new 'httpLookBackWindow' value from Bag: %{public}f", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setHttpLookBackWindowValue:", a3);
  }

}

void sub_10016DA8C(uint64_t a1, id a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  id v9;

  v5 = a3;
  if (v5)
    a2 = objc_msgSend(*(id *)(a1 + 32), "httpMaximumConnectionsPerHostDefaultValue");
  if (*(id *)(a1 + 40) != a2)
  {
    v6 = APLogForCategory(41);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = 134349056;
      v9 = a2;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Loaded new 'httpMaximumConnectionsPerHost' value from Bag: %{public}ld", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setHttpMaximumConnectionsPerHostValue:", a2);
  }

}

void sub_10016DB70(uint64_t a1, id a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  id v9;

  v5 = a3;
  if (v5)
    a2 = objc_msgSend(*(id *)(a1 + 32), "httpMaximumConnectionsPerHostTempSessionDefaultValue");
  if (*(id *)(a1 + 40) != a2)
  {
    v6 = APLogForCategory(41);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = 134349056;
      v9 = a2;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Loaded new 'httpMaximumConnectionsPerHostTempSession' value from Bag: %{public}ld", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setHttpMaximumConnectionsPerHostTempSessionValue:", a2);
  }

}

void sub_10016DC54(uint64_t a1, id a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  id v9;

  v5 = a3;
  if (v5)
    a2 = objc_msgSend(*(id *)(a1 + 32), "cacheSizeLimitDefaultValue");
  if (*(id *)(a1 + 40) != a2)
  {
    v6 = APLogForCategory(41);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = 134349056;
      v9 = a2;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Loaded new 'cacheSize' value from Bag: %{public}ld", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setCacheSizeLimitValue:", a2);
  }

}

void sub_10016DD98(id a1)
{
  APIDAccountsWeakContainer *v1;
  void *v2;

  v1 = objc_alloc_init(APIDAccountsWeakContainer);
  v2 = (void *)qword_10026D110;
  qword_10026D110 = (uint64_t)v1;

}

void sub_10016E208(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  unsigned int v8;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "identifier"));
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

uint64_t sub_10016E334(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "identifier"));
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32)) ^ 1;

  return v4;
}

void sub_10016E684(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_10016E6BC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(id, const __CFString *);
  id WeakRetained;
  NSObject *v8;
  _QWORD block[4];
  id v10;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "gcSchedulerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016E7AC;
  block[3] = &unk_100213F18;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  dispatch_async(v8, block);

  v6[2](v6, CFSTR("Started..."));
  objc_destroyWeak(&v10);

}

void sub_10016E798(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10016E7AC(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(WeakRetained, "_performGC:completionHandler:", v1, 0);

}

void sub_10016E804(id *a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "gcSchedulerQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10016E8D0;
  v8[3] = &unk_100218A48;
  v9 = v4;
  v7 = v4;
  objc_copyWeak(&v10, a1);
  dispatch_async(v6, v8);

  objc_destroyWeak(&v10);
}

void sub_10016E8D0(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_dumpCache"));
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);

}

void sub_10016EBFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10016EC24(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setGarbageCollector:", 0);
  if ((a2 & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_msgSend(WeakRetained, "_setLastGCDate:", v4);

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);

}

int64_t sub_10016F324(id a1, APContentData *a2, APContentData *a3)
{
  APContentData *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int64_t v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APContentData representations](a2, "representations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "anyObject"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APContentData representations](v4, "representations"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "anyObject"));

  v9 = objc_msgSend(v6, "rank");
  if ((uint64_t)v9 >= (uint64_t)objc_msgSend(v8, "rank"))
  {
    v11 = objc_msgSend(v6, "rank");
    v10 = (uint64_t)v11 > (uint64_t)objc_msgSend(v8, "rank");
  }
  else
  {
    v10 = -1;
  }

  return v10;
}

void sub_10016FB10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_10016FB3C(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_heavyContentKeyNames"));

  return v2;
}

void sub_100170DDC(uint64_t a1)
{
  id v2;
  APJourneyDaemonMetricHelper *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", *(_QWORD *)(a1 + 32));
  v6 = (id)objc_claimAutoreleasedReturnValue(+[APContentData createForServerUnfilledReason:placementType:contextIdentifier:](APContentData, "createForServerUnfilledReason:placementType:contextIdentifier:", 0, 5, v2));

  v3 = -[APJourneyDaemonMetricHelper initWithContentData:]([APJourneyDaemonMetricHelper alloc], "initWithContentData:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "requestID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  -[APJourneyDaemonMetricHelper requestFailedForBundleID:withCode:requestID:placement:placementType:](v3, "requestFailedForBundleID:withCode:requestID:placement:placementType:", CFSTR("com.apple.AppStore"), 3303, v5, objc_msgSend(*(id *)(a1 + 40), "placement"), 5);

}

void sub_1001711F4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MetricsModule storage](MetricsModule, "storage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "notificationRegistrar"));
  v8 = objc_msgSend(v7, "registerHandlerForPurpose:closure:", a2, v5);

  v9 = *(void **)(a1 + 32);
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v8));
  objc_msgSend(v9, "addObject:", v10);

}

void sub_1001712A0(id a1, APMetricProtocol *a2)
{
  _objc_msgSend((id)qword_10026D120, "metricReceived:", a2);
}

void sub_1001712B0(id a1, APMetricProtocol *a2)
{
  _objc_msgSend((id)qword_10026D120, "internalMetricReceived:", a2);
}

void sub_1001712C0(id a1, APMetricProtocol *a2)
{
  _objc_msgSend((id)qword_10026D120, "metricReceived:", a2);
}

void sub_1001712D0(id a1, APMetricProtocol *a2)
{
  _objc_msgSend((id)qword_10026D120, "internalSignalReceived:", a2);
}

void sub_1001712E0(id a1, APMetricProtocol *a2)
{
  _objc_msgSend((id)qword_10026D120, "handleMetricForTesting:", a2);
}

void sub_1001712F0(id a1, APMetricProtocol *a2)
{
  _objc_msgSend((id)qword_10026D120, "handleMetricForTesting:", a2);
}

id sub_100171598(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "processSignalMetric:", *(_QWORD *)(a1 + 40));
}

void sub_100171754(id *a1)
{
  void *v2;
  APMetricClientConnection *v3;
  void *v4;
  void *v5;
  APMetricClientConnection *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  NSObject *v16;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "clientConnection"));

  if (!v2)
  {
    v3 = [APMetricClientConnection alloc];
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "objectAtIndexedSubscript:", 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "objectAtIndexedSubscript:", 1));
    v6 = -[APMetricClientConnection initWithHost:port:](v3, "initWithHost:port:", v4, v5);
    objc_msgSend(a1[4], "setClientConnection:", v6);

  }
  if ((objc_opt_respondsToSelector(a1[6], "ecServerDictionaryRepresentation") & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "ecServerDictionaryRepresentation"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "additives:", v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject jsonDataWithOptions:](v8, "jsonDataWithOptions:", 0x400000));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithData:](NSData, "dataWithData:", v9));

    if (v10 && objc_msgSend(v10, "length"))
    {
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "clientConnection"));
      -[NSObject send:](v11, "send:", v10);
    }
    else
    {
      v14 = APLogForCategory(23);
      v11 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v15 = 138543362;
        v16 = v8;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Error representation %{public}@ to json", (uint8_t *)&v15, 0xCu);
      }
    }

  }
  else
  {
    v12 = APLogForCategory(23);
    v8 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v13 = a1[6];
      v15 = 138543362;
      v16 = v13;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Error converting metric to dictionary representation %{public}@", (uint8_t *)&v15, 0xCu);
    }
  }

}

id sub_100171978(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_provideEnvironmentForMetric:", *(_QWORD *)(a1 + 40));
}

id sub_100171FC0(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_provideEnvironmentForMetric:", *(_QWORD *)(a1 + 40));
}

BOOL sub_100176EE4(id a1, NSURL *a2, NSError *a3)
{
  NSURL *v4;
  NSError *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;

  v4 = a2;
  v5 = a3;
  v6 = APLogForCategory(44);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](v4, "path"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedDescription](v5, "localizedDescription"));
    v11 = 141558530;
    v12 = 1752392040;
    v13 = 2112;
    v14 = v8;
    v15 = 2114;
    v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "An error occurred enumerating url:%{mask.hash}@. %{public}@", (uint8_t *)&v11, 0x20u);

  }
  return 1;
}

void sub_1001772E8(id a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[7];
  _QWORD v19[7];

  v18[0] = CFSTR("com.apple.news");
  v17 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("751A1F1B-43AB-40F2-BB35-C6731882A9F7"));
  v16 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("0900CB86-3865-4C60-8D49-A05C853628D4"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v17, v16, 0));
  v19[0] = v15;
  v18[1] = CFSTR("com.apple.appstored");
  v14 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("876F12EE-055C-49EB-8909-3BE6753CA832"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v14, 0));
  v19[1] = v13;
  v18[2] = CFSTR("com.apple.appstoreagent");
  v1 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("876F12EE-055C-49EB-8909-3BE6753CA832"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v1, 0));
  v19[2] = v2;
  v18[3] = CFSTR("com.apple.passd");
  v3 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("5DE1449E-0748-6CC5-CA7D-548E7E7AC24C"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, 0));
  v19[3] = v4;
  v18[4] = CFSTR("com.apple.watchlistd");
  v5 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("25EF2050-5D1D-419D-AC15-CCA299E77EE0"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, 0));
  v19[4] = v6;
  v18[5] = CFSTR("com.apple.fitcored");
  v7 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("13616005-2862-4801-8CC1-662AD06477DE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, 0));
  v19[5] = v8;
  v18[6] = CFSTR("com.apple.stocks");
  v9 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", CFSTR("751A1F1B-43AB-40F2-BB35-C6731882A9F7"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, 0));
  v19[6] = v10;
  v11 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 7));
  v12 = (void *)qword_10026D138;
  qword_10026D138 = v11;

}

void sub_1001776E0(id a1)
{
  void *v1;

  v1 = (void *)qword_10026D148;
  qword_10026D148 = (uint64_t)&off_10022B380;

}

void sub_1001777B8(id *a1)
{
  id v2;
  void *v3;
  unsigned __int8 v4;
  void *v5;
  NSString *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  NSErrorUserInfoKey v24;
  void *v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;

  if ((objc_msgSend(a1[4], "hasWriteEntitlement") & 1) != 0)
  {
    v2 = a1[5];
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "bundleID"));
    v4 = +[PCStatusConditionsReceiver validateWhitelistingForCondition:forBundleIdentifier:](PCStatusConditionsReceiver, "validateWhitelistingForCondition:forBundleIdentifier:", v2, v3);

    if ((v4 & 1) != 0)
    {
LABEL_11:
      v14 = a1[4];
      v15 = a1[5];
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundleID"));
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100177A54;
      v20[3] = &unk_100218D98;
      v17 = a1[5];
      v18 = a1[4];
      v21 = v17;
      v22 = v18;
      v23 = a1[6];
      objc_msgSend(v14, "_isStatusConditionRegistered:bundleIdentifier:completionHandler:", v15, v16, v20);

      v7 = v21;
      goto LABEL_12;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "bundleID"));
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ : %@ is not a whitelisted status condition."), v5, a1[5]);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "bundleID"));
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Ignoring request from unentitled client %@"), v5, v19);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (!v7)
    goto LABEL_11;
  v8 = APLogForCategory(44);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136643075;
    v27 = "-[PCStatusConditionsReceiver setStatusCondition:completionHandler:]_block_invoke";
    v28 = 2114;
    v29 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{sensitive}s]: %{public}@", buf, 0x16u);
  }

  v10 = (void (**)(id, void *))a1[6];
  if (v10)
  {
    v24 = NSLocalizedDescriptionKey;
    v25 = v7;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.statusconditionserror"), -1100, v11));
    v10[2](v10, v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "connection"));
  objc_msgSend(v13, "invalidate");

  objc_msgSend(a1[4], "setConnection:", 0);
LABEL_12:

}

void sub_100177A54(uint64_t a1, char a2, void *a3)
{
  id v5;
  PCBooleanCondition *v6;
  void *v7;
  void *v8;
  PCBooleanCondition *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v5 = a3;
  if (!v5)
  {
    v6 = [PCBooleanCondition alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "UUIDString"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "bundleID"));
    v9 = -[PCBooleanCondition initWithType:value:identifier:](v6, "initWithType:value:identifier:", CFSTR("sc"), v7, v8);

    v12 = objc_claimAutoreleasedReturnValue(+[PCStatusConditionStorage setStatusCondition:](PCStatusConditionStorage, "setStatusCondition:", v9));
    if ((a2 & 1) == 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "conditionsService"));
      objc_msgSend(v10, "clearCache");

    }
    v5 = (id)v12;
  }
  v11 = *(_QWORD *)(a1 + 48);
  if (v11)
  {
    v13 = v5;
    (*(void (**)(void))(v11 + 16))();
    v5 = v13;
  }

}

void sub_100177C08(id *a1)
{
  id v2;
  void *v3;
  unsigned __int8 v4;
  void *v5;
  NSString *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  NSErrorUserInfoKey v24;
  void *v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;

  if ((objc_msgSend(a1[4], "hasWriteEntitlement") & 1) != 0)
  {
    v2 = a1[5];
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "bundleID"));
    v4 = +[PCStatusConditionsReceiver validateWhitelistingForCondition:forBundleIdentifier:](PCStatusConditionsReceiver, "validateWhitelistingForCondition:forBundleIdentifier:", v2, v3);

    if ((v4 & 1) != 0)
    {
LABEL_11:
      v14 = a1[4];
      v15 = a1[5];
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundleID"));
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100177EA4;
      v20[3] = &unk_100218D98;
      v17 = a1[5];
      v18 = a1[4];
      v21 = v17;
      v22 = v18;
      v23 = a1[6];
      objc_msgSend(v14, "_isStatusConditionRegistered:bundleIdentifier:completionHandler:", v15, v16, v20);

      v7 = v21;
      goto LABEL_12;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "bundleID"));
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ : %@ is not a whitelisted status condition."), v5, a1[5]);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "bundleID"));
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Ignoring request from unentitled client %@"), v5, v19);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (!v7)
    goto LABEL_11;
  v8 = APLogForCategory(44);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136643075;
    v27 = "-[PCStatusConditionsReceiver clearStatusCondition:completionHandler:]_block_invoke";
    v28 = 2114;
    v29 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{sensitive}s]: %{public}@", buf, 0x16u);
  }

  v10 = (void (**)(id, void *))a1[6];
  if (v10)
  {
    v24 = NSLocalizedDescriptionKey;
    v25 = v7;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.statusconditionserror"), -1100, v11));
    v10[2](v10, v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "connection"));
  objc_msgSend(v13, "invalidate");

  objc_msgSend(a1[4], "setConnection:", 0);
LABEL_12:

}

void sub_100177EA4(uint64_t a1, int a2, void *a3)
{
  id v5;
  PCBooleanCondition *v6;
  void *v7;
  void *v8;
  PCBooleanCondition *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v5 = a3;
  if (!v5)
  {
    v6 = [PCBooleanCondition alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "UUIDString"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "bundleID"));
    v9 = -[PCBooleanCondition initWithType:value:identifier:](v6, "initWithType:value:identifier:", CFSTR("sc"), v7, v8);

    v12 = objc_claimAutoreleasedReturnValue(+[PCStatusConditionStorage clearStatusCondition:](PCStatusConditionStorage, "clearStatusCondition:", v9));
    if (a2)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "conditionsService"));
      objc_msgSend(v10, "clearCache");

    }
    v5 = (id)v12;
  }
  v11 = *(_QWORD *)(a1 + 48);
  if (v11)
  {
    v13 = v5;
    (*(void (**)(void))(v11 + 16))();
    v5 = v13;
  }

}

void sub_100178080(uint64_t a1)
{
  unsigned __int8 v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  NSErrorUserInfoKey v31;
  void *v32;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasReadEntitlement");
  v3 = *(void **)(a1 + 32);
  if ((v2 & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleID"));
    v5 = +[PCStatusConditionsReceiver validateWhitelistingForRead:](PCStatusConditionsReceiver, "validateWhitelistingForRead:", v4);

    if ((v5 & 1) != 0)
      goto LABEL_11;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleID"));
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ : %@ is not a whitelisted status condition reader."), v6, *(_QWORD *)(a1 + 40));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleID"));
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Ignoring request from unentitled client %@"), v6, v22);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    v9 = APLogForCategory(44);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136643075;
      v26 = "-[PCStatusConditionsReceiver isStatusConditionRegistered:bundleIdentifier:completionHandler:]_block_invoke";
      v27 = 2114;
      v28 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{sensitive}s]: %{public}@", buf, 0x16u);
    }

    v11 = *(_QWORD *)(a1 + 56);
    if (v11)
    {
      v31 = NSLocalizedDescriptionKey;
      v32 = v8;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.statusconditionserror"), -1100, v12));
      (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v13);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connection"));
    objc_msgSend(v14, "invalidate");

    objc_msgSend(*(id *)(a1 + 32), "setConnection:", 0);
    goto LABEL_14;
  }
LABEL_11:
  v15 = APLogForCategory(44);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = *(void **)(a1 + 40);
    v18 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 136643331;
    v26 = "-[PCStatusConditionsReceiver isStatusConditionRegistered:bundleIdentifier:completionHandler:]_block_invoke";
    v27 = 2114;
    v28 = v17;
    v29 = 2114;
    v30 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{sensitive}s]: retrieving registration for condition %{public}@ and bundle %{public}@.", buf, 0x20u);
  }

  v19 = *(void **)(a1 + 32);
  v20 = *(_QWORD *)(a1 + 40);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100178364;
  v23[3] = &unk_100218DC0;
  v21 = *(_QWORD *)(a1 + 48);
  v24 = *(id *)(a1 + 56);
  objc_msgSend(v19, "_isStatusConditionRegistered:bundleIdentifier:completionHandler:", v20, v21, v23);
  v8 = v24;
LABEL_14:

}

uint64_t sub_100178364(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_1001796F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10017970C(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "description"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\n%@"), v8));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingString:", v4));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void sub_1001797F0(id a1)
{
  void *v1;

  v1 = (void *)qword_10026D158;
  qword_10026D158 = (uint64_t)&off_10022B398;

}

void sub_100179FBC(id a1)
{
  PCStatusConditionsService *v1;
  void *v2;

  v1 = objc_alloc_init(PCStatusConditionsService);
  v2 = (void *)qword_10026D168;
  qword_10026D168 = (uint64_t)v1;

}

void sub_10017A10C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10017A880(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10017A8A8(id a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[APDataAdaptorRepository sharedRepository](APDataAdaptorRepository, "sharedRepository"));
  v2 = objc_msgSend(v1, "registerAdaptorClass:", objc_opt_class(APStatusConditionDataAdaptor));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);

  if (v3)
  {
    v4 = APLogForCategory(44);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = objc_msgSend(v3, "code");
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedDescription"));
      v8 = 134218242;
      v9 = v6;
      v10 = 2114;
      v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error %ld registering status condition data adaptor: %{public}@", (uint8_t *)&v8, 0x16u);

    }
  }

}

void sub_10017B510(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v12 = APLogForCategory(27);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_opt_class(*(_QWORD *)(a1 + 32));
      v19 = 138412546;
      v20 = v14;
      v21 = 2114;
      v22 = v7;
      v15 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@: Error fetching API host from AMSMediaTask bag. Error: %{public}@", (uint8_t *)&v19, 0x16u);

    }
    v16 = objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithString:](NSURLComponents, "componentsWithString:", CFSTR("https://amp-api-edge.apps.apple.com")));
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

  }
  else
  {
    v8 = objc_alloc_init((Class)NSURLComponents);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absoluteString"));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setHost:", v11);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setScheme:", CFSTR("https"));
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void sub_10017B6A0(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;

  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }
  else
  {
    v5 = APLogForCategory(27);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_opt_class(*(_QWORD *)(a1 + 32));
      v11 = 138412290;
      v12 = v7;
      v8 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@: Error fetching country code from AMSMediaTask bag", (uint8_t *)&v11, 0xCu);

    }
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = CFSTR("us");

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

id sub_10017B7B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", a3, a2);
}

id _contentDataWithContextIDAndError(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;

  v3 = a1;
  v4 = a2;
  v5 = _contentDataWithContextID(v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = APLogForCategory(27);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v11 = 138543874;
    v12 = v9;
    v13 = 2114;
    v14 = v3;
    v15 = 2114;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Content %{public}@ for context %{public}@ is being returned with error: %{public}@", (uint8_t *)&v11, 0x20u);

  }
  objc_msgSend(v6, "setError:", v4);

  return v6;
}

void sub_10017BA58()
{
  int v0;
  _DWORD v1[2];

  v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failed to initialize temporary directory: %{darwin.errno}d", (uint8_t *)v1, 8u);
}

void sub_10017BADC()
{
  __assert_rtn("-[APPBAdDataUpdate writeTo:]", "APPBAdDataUpdate.m", 157, "nil != self->_uniqueIdentifier");
}

void sub_10017BB04()
{
  __assert_rtn("-[APPBMediaAsset writeTo:]", "APPBMediaAsset.m", 378, "nil != self->_mediaURL");
}

void sub_10017BB2C()
{
  __assert_rtn("-[APPBParameter writeTo:]", "APPBParameter.m", 96, "nil != self->_key");
}

void sub_10017BB54()
{
  __assert_rtn("-[APPBParameter writeTo:]", "APPBParameter.m", 101, "nil != self->_value");
}

void sub_10017BB7C()
{
  __assert_rtn("-[APPBUserTransparencyResponse writeTo:]", "APPBUserTransparencyResponse.m", 86, "self->_transparencyDetails != nil");
}

void sub_10017BBA4()
{
  __assert_rtn("-[APPBAdAction writeTo:]", "APPBAdAction.m", 770, "nil != self->_identifier");
}

void sub_10017BBCC()
{
  __assert_rtn("-[APPBLocalizedStringEntry writeTo:]", "APPBLocalizedStringEntry.m", 83, "nil != self->_languageIdentifier");
}

void sub_10017BBF4()
{
  __assert_rtn("-[APPBLocalizedStringEntry writeTo:]", "APPBLocalizedStringEntry.m", 88, "nil != self->_value");
}

void sub_10017BC1C()
{
  __assert_rtn("-[APPBTargetingCriteria writeTo:]", "APPBTargetingCriteria.m", 110, "nil != self->_criteriaIdentifier");
}

void sub_10017BC44()
{
  __assert_rtn("-[APPBMerchant writeTo:]", "APPBMerchant.m", 281, "nil != self->_identifier");
}

void sub_10017BC6C()
{
  __assert_rtn("-[APPBMerchant writeTo:]", "APPBMerchant.m", 286, "nil != self->_countryCode");
}

void sub_10017BC94()
{
  __assert_rtn("-[APPBMerchant writeTo:]", "APPBMerchant.m", 313, "nil != self->_paymentProcessingURL");
}

void sub_10017BCBC()
{
  __assert_rtn("-[APPBNumericParameter writeTo:]", "APPBNumericParameter.m", 92, "nil != self->_key");
}

void sub_10017BCE4()
{
  __assert_rtn("-[APPBKeyedParameterList writeTo:]", "APPBKeyedParameterList.m", 139, "nil != self->_key");
}

id objc_msgSend_AdDataUnfilledReasonCodeToASECode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "AdDataUnfilledReasonCodeToASECode:");
}

id objc_msgSend_AdDataUnfilledReasonCodeToUnfilledReasonCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "AdDataUnfilledReasonCodeToUnfilledReasonCode:");
}

id objc_msgSend_AdPlatforms(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "AdPlatforms");
}

id objc_msgSend_App(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "App");
}

id objc_msgSend_AppStoreViewTemplateTypeToTemplateType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "AppStoreViewTemplateTypeToTemplateType:");
}

id objc_msgSend_DPID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "DPID");
}

id objc_msgSend_DiscardReasons(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "DiscardReasons");
}

id objc_msgSend_IDAccountsRecord(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "IDAccountsRecord");
}

id objc_msgSend_InFocus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "InFocus");
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_JSONObjectWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithObject:");
}

id objc_msgSend_MarketplaceHealth(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "MarketplaceHealth");
}

id objc_msgSend_Media(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "Media");
}

id objc_msgSend_Notification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "Notification");
}

id objc_msgSend_NowPlaying(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "NowPlaying");
}

id objc_msgSend_POST_client_headers_body_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "POST:client:headers:body:completionHandler:");
}

id objc_msgSend_POST_headers_body_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "POST:headers:body:withCompletionHandler:");
}

id objc_msgSend_RelevantIdentifierToRelevantIdentifierType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "RelevantIdentifierToRelevantIdentifierType:");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URL");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByDeletingLastPathComponent");
}

id objc_msgSend_URLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForKey:");
}

id objc_msgSend_URLResponse(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLResponse");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_URLWithString_encodingInvalidCharacters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:encodingInvalidCharacters:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUIDString");
}

id objc_msgSend_Usage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "Usage");
}

id objc_msgSend__accountIDsDict(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accountIDsDict");
}

id objc_msgSend__accumulatePlaybackTimeIfNoDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accumulatePlaybackTimeIfNoDuration");
}

id objc_msgSend__accumulationReasonToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accumulationReasonToString:");
}

id objc_msgSend__adRequestDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_adRequestDictionary");
}

id objc_msgSend__addAdjacentContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addAdjacentContext");
}

id objc_msgSend__addContentDataWithErrorForError_identifier_toResults_journeyStartRelayValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addContentDataWithErrorForError:identifier:toResults:journeyStartRelayValues:");
}

id objc_msgSend__addContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addContext:");
}

id objc_msgSend__addCurrentArticleContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addCurrentArticleContext");
}

id objc_msgSend__addDays_toDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addDays:toDate:");
}

id objc_msgSend__addFrequencyCappingDataToRequestDictionary_fromSupplementalContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addFrequencyCappingDataToRequestDictionary:fromSupplementalContext:");
}

id objc_msgSend__addImpressionCap_clickCap_toDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addImpressionCap:clickCap:toDictionary:");
}

id objc_msgSend__addProperty_fromSupplementalContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addProperty:fromSupplementalContext:");
}

id objc_msgSend__addToCacheContentData_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addToCacheContentData:context:");
}

id objc_msgSend__appendMetricToFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_appendMetricToFile:");
}

id objc_msgSend__asyncProcessMetrics_forChannel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_asyncProcessMetrics:forChannel:");
}

id objc_msgSend__attributionTokenRequestTimestamp_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_attributionTokenRequestTimestamp:completionHandler:");
}

id objc_msgSend__backoffTimerReset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_backoffTimerReset");
}

id objc_msgSend__backoffTimerScheduleNextLevel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_backoffTimerScheduleNextLevel");
}

id objc_msgSend__batchClosedWithBatchLifetime_batchID_eventsCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_batchClosedWithBatchLifetime:batchID:eventsCount:");
}

id objc_msgSend__biomeStream(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_biomeStream");
}

id objc_msgSend__buildPayloadForTimingAnalytics_startDate_endDate_additionalFields_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_buildPayloadForTimingAnalytics:startDate:endDate:additionalFields:");
}

id objc_msgSend__buildQueryParamsForDevicePlatform_placement_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_buildQueryParamsForDevicePlatform:placement:parameters:");
}

id objc_msgSend__callAccumulationHandlerWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_callAccumulationHandlerWithReason:");
}

id objc_msgSend__canSendLocationInformationForClientInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_canSendLocationInformationForClientInfo:");
}

id objc_msgSend__cancelConfigRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cancelConfigRequest");
}

id objc_msgSend__capArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_capArray:");
}

id objc_msgSend__checkClassType_name_expectedClass_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkClassType:name:expectedClass:error:");
}

id objc_msgSend__checkErrorState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkErrorState");
}

id objc_msgSend__cleanupLeftovers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cleanupLeftovers");
}

id objc_msgSend__clearCapDownloadDataProperties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clearCapDownloadDataProperties");
}

id objc_msgSend__clicked_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clicked:");
}

id objc_msgSend__clientProcessInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientProcessInfo");
}

id objc_msgSend__clientSourceIDMap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clientSourceIDMap");
}

id objc_msgSend__closeBatchForChannel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_closeBatchForChannel:");
}

id objc_msgSend__closeBatchesForChannels_shelved_groupBatches_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_closeBatchesForChannels:shelved:groupBatches:");
}

id objc_msgSend__closedFileDirectory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_closedFileDirectory");
}

id objc_msgSend__closedFilePath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_closedFilePath");
}

id objc_msgSend__closedPathForChannel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_closedPathForChannel:");
}

id objc_msgSend__commit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_commit");
}

id objc_msgSend__completeServerRequestId_serverFailureCount_result_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_completeServerRequestId:serverFailureCount:result:");
}

id objc_msgSend__computeMinimumSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_computeMinimumSize:");
}

id objc_msgSend__configurationPollValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configurationPollValue");
}

id objc_msgSend__configurePreparedDataObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configurePreparedDataObjects");
}

id objc_msgSend__confirmed50PercentImpressionRequest_internalContent_context_clientInfo_idAccount_forClickInteraction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_confirmed50PercentImpressionRequest:internalContent:context:clientInfo:idAccount:forClickInteraction:");
}

id objc_msgSend__confirmedImpressionRequest_internalContent_context_clientInfo_idAccount_forClickInteraction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_confirmedImpressionRequest:internalContent:context:clientInfo:idAccount:forClickInteraction:");
}

id objc_msgSend__contextDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contextDictionary");
}

id objc_msgSend__continueAttribution_token_cached_requestTimestamp_error_constructionWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_continueAttribution:token:cached:requestTimestamp:error:constructionWithCompletionHandler:");
}

id objc_msgSend__convertOperator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_convertOperator:");
}

id objc_msgSend__coordinatorForRequester_clientInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_coordinatorForRequester:clientInfo:");
}

id objc_msgSend__countEventsInBatch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_countEventsInBatch:");
}

id objc_msgSend__createBranchForEnvironments(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createBranchForEnvironments");
}

id objc_msgSend__createContentDataInternalFrom_newContentDataId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createContentDataInternalFrom:newContentDataId:");
}

id objc_msgSend__createEventTableIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createEventTableIfNeeded");
}

id objc_msgSend__createEventTableWithManager_dayOfYear_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createEventTableWithManager:dayOfYear:");
}

id objc_msgSend__createEventViewForDay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createEventViewForDay:");
}

id objc_msgSend__createEventViewQueryForDay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createEventViewQueryForDay:");
}

id objc_msgSend__createInstallAttributionFromAdData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createInstallAttributionFromAdData:");
}

id objc_msgSend__createManagedContextWithId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createManagedContextWithId:");
}

id objc_msgSend__createNodeFromDictionary_identifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createNodeFromDictionary:identifier:error:");
}

id objc_msgSend__createProperties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createProperties");
}

id objc_msgSend__createRepresentationsFromAdData_placementType_maxSize_mediaAssets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createRepresentationsFromAdData:placementType:maxSize:mediaAssets:");
}

id objc_msgSend__createSessionForBag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createSessionForBag:");
}

id objc_msgSend__createTokenDetailed_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createTokenDetailed:error:");
}

id objc_msgSend__currentDayOfYear(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_currentDayOfYear");
}

id objc_msgSend__currentRateLimits(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_currentRateLimits");
}

id objc_msgSend__dataFromBatchDictionaries_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dataFromBatchDictionaries:");
}

id objc_msgSend__dayOfYearForDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dayOfYearForDate:");
}

id objc_msgSend__delay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_delay");
}

id objc_msgSend__deleteByFilePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deleteByFilePath:");
}

id objc_msgSend__deliveryLeeway(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deliveryLeeway");
}

id objc_msgSend__descriptionWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_descriptionWithFormat:");
}

id objc_msgSend__deserializeResponse_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deserializeResponse:error:");
}

id objc_msgSend__destinationHashFromPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_destinationHashFromPath:");
}

id objc_msgSend__determineBillable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_determineBillable:");
}

id objc_msgSend__devicePlatform(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_devicePlatform");
}

id objc_msgSend__dictionariesFromBatchesInStorage_useShelvedData_channels_groupBatches_batchInfos_billing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dictionariesFromBatchesInStorage:useShelvedData:channels:groupBatches:batchInfos:billing:");
}

id objc_msgSend__dropExpiredEventTables(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dropExpiredEventTables");
}

id objc_msgSend__dumpCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dumpCache");
}

id objc_msgSend__encryptIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_encryptIDs");
}

id objc_msgSend__evaluatableChildNode_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_evaluatableChildNode:error:");
}

id objc_msgSend__eventCountDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_eventCountDictionary");
}

id objc_msgSend__eventViewTableNamesForDay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_eventViewTableNamesForDay:");
}

id objc_msgSend__executeOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_executeOperation:");
}

id objc_msgSend__expirationOfData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_expirationOfData");
}

id objc_msgSend__failedPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_failedPath:");
}

id objc_msgSend__fakeID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fakeID");
}

id objc_msgSend__findPotentiallyDeliverableRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findPotentiallyDeliverableRequest");
}

id objc_msgSend__finishedWithAllRequests(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_finishedWithAllRequests");
}

id objc_msgSend__finishedWithRequestsForCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_finishedWithRequestsForCoordinator:");
}

id objc_msgSend__frequencyCapDataFromAdData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_frequencyCapDataFromAdData:");
}

id objc_msgSend__generateOnDemandToken_interval_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_generateOnDemandToken:interval:completionHandler:");
}

id objc_msgSend__getAppStorePlacement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getAppStorePlacement:");
}

id objc_msgSend__getCachedToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getCachedToken:");
}

id objc_msgSend__getLastGCDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getLastGCDate");
}

id objc_msgSend__handleAdValidationErrorDomainWithJourneyMetricsHelper_code_internalContent_type_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleAdValidationErrorDomainWithJourneyMetricsHelper:code:internalContent:type:");
}

id objc_msgSend__handleAncientItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleAncientItem:");
}

id objc_msgSend__handleMediaServiceResponse_params_error_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleMediaServiceResponse:params:error:completionHandler:");
}

id objc_msgSend__handleMissingClientInfoForRequestOfTypes_forContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleMissingClientInfoForRequestOfTypes:forContext:");
}

id objc_msgSend__handleRankedRepresentations_params_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleRankedRepresentations:params:");
}

id objc_msgSend__handleResponseJsonData_error_params_responseReceivedTimestamp_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleResponseJsonData:error:params:responseReceivedTimestamp:completionHandler:");
}

id objc_msgSend__handleResult_error_params_responseReceivedTimestamp_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleResult:error:params:responseReceivedTimestamp:completionHandler:");
}

id objc_msgSend__hasObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hasObjectForKey:");
}

id objc_msgSend__hasSentFinalEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hasSentFinalEvent");
}

id objc_msgSend__hasSession_purpose_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hasSession:purpose:");
}

id objc_msgSend__hashAndSavePayloadForInternalTesting_signature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hashAndSavePayloadForInternalTesting:signature:");
}

id objc_msgSend__heavyContentKeyNames(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_heavyContentKeyNames");
}

id objc_msgSend__incrementBundleIDCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_incrementBundleIDCount:");
}

id objc_msgSend__incrementCount_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_incrementCount:forKey:");
}

id objc_msgSend__initWithExpression_subExpressions_data_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithExpression:subExpressions:data:error:");
}

id objc_msgSend__initWithReference_subExpressions_data_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithReference:subExpressions:data:error:");
}

id objc_msgSend__internalProperties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_internalProperties");
}

id objc_msgSend__invalidElementError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_invalidElementError:");
}

id objc_msgSend__isEventDatabaseStorageEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isEventDatabaseStorageEnabled");
}

id objc_msgSend__isStatusConditionRegistered_bundleIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isStatusConditionRegistered:bundleIdentifier:completionHandler:");
}

id objc_msgSend__lastEventInsertOrder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lastEventInsertOrder");
}

id objc_msgSend__launchHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_launchHandler");
}

id objc_msgSend__loadAllDataFromKeychainForKey_clickCountData_downloadData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadAllDataFromKeychainForKey:clickCountData:downloadData:");
}

id objc_msgSend__loadAllSampleRates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadAllSampleRates");
}

id objc_msgSend__loadBatchesAsDataForChannel_useShelvedData_groupBatches_batchInfos_billing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadBatchesAsDataForChannel:useShelvedData:groupBatches:batchInfos:billing:");
}

id objc_msgSend__loadFailedRequestsCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadFailedRequestsCache");
}

id objc_msgSend__loadIDAccounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadIDAccounts");
}

id objc_msgSend__loadInternalPropertiesFromContentData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadInternalPropertiesFromContentData:");
}

id objc_msgSend__loadJourneyStartRelayValuesFromAdData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadJourneyStartRelayValuesFromAdData:");
}

id objc_msgSend__loadJourneyStartRelayValuesFromContentData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadJourneyStartRelayValuesFromContentData:");
}

id objc_msgSend__loadOverrideContextForMetric_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadOverrideContextForMetric:");
}

id objc_msgSend__loadRateLimitSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadRateLimitSettings");
}

id objc_msgSend__loadRateLimitsFromUserDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadRateLimitsFromUserDefaults");
}

id objc_msgSend__loadSampleSessionsfromStorage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadSampleSessionsfromStorage");
}

id objc_msgSend__loadServerConfig(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadServerConfig");
}

id objc_msgSend__loadSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadSettings");
}

id objc_msgSend__locationDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_locationDictionary");
}

id objc_msgSend__logRequestURL_headers_body_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_logRequestURL:headers:body:");
}

id objc_msgSend__logRequestURL_requestID_headers_innerRequestJson_prettyPrint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_logRequestURL:requestID:headers:innerRequestJson:prettyPrint:");
}

id objc_msgSend__logResponse_requestID_error_prettyPrint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_logResponse:requestID:error:prettyPrint:");
}

id objc_msgSend__logResponse_responseProtobuf_requestProtobufClass_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_logResponse:responseProtobuf:requestProtobufClass:error:");
}

id objc_msgSend__makeApplicationSupportSubdirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_makeApplicationSupportSubdirectory:");
}

id objc_msgSend__makeRequest_serverFailureCount_responseCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_makeRequest:serverFailureCount:responseCallback:");
}

id objc_msgSend__markRequestAsFailed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_markRequestAsFailed:");
}

id objc_msgSend__markRequestsAsSucceeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_markRequestsAsSucceeded:");
}

id objc_msgSend__metric(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_metric");
}

id objc_msgSend__metricsByNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_metricsByNumber:");
}

id objc_msgSend__migrateData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_migrateData");
}

id objc_msgSend__moveAllPendingRequestsToFailed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_moveAllPendingRequestsToFailed");
}

id objc_msgSend__notifyListenersOfMetric_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_notifyListenersOfMetric:");
}

id objc_msgSend__objectForKey_ignoreKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_objectForKey:ignoreKeys:");
}

id objc_msgSend__odmlProperties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_odmlProperties");
}

id objc_msgSend__openBatchForChannel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_openBatchForChannel:");
}

id objc_msgSend__openFileDirectory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_openFileDirectory");
}

id objc_msgSend__openFilePath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_openFilePath");
}

id objc_msgSend__options(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_options");
}

id objc_msgSend__optionsArray(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_optionsArray");
}

id objc_msgSend__parseContentDataJson_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_parseContentDataJson:");
}

id objc_msgSend__pastDueDailyReportDates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pastDueDailyReportDates");
}

id objc_msgSend__pastDueMonthlyReportDates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pastDueMonthlyReportDates");
}

id objc_msgSend__pastDueWeeklyReportDates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pastDueWeeklyReportDates");
}

id objc_msgSend__payloadUploadFailureWithType_code_batchInfos_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_payloadUploadFailureWithType:code:batchInfos:");
}

id objc_msgSend__payloadUploadSuccessForBatchInfos_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_payloadUploadSuccessForBatchInfos:");
}

id objc_msgSend__pendingPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pendingPath:");
}

id objc_msgSend__performForceReconcile(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performForceReconcile");
}

id objc_msgSend__performGC_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performGC:completionHandler:");
}

id objc_msgSend__periodicDelay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_periodicDelay");
}

id objc_msgSend__persistNewReferences(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_persistNewReferences");
}

id objc_msgSend__placementForPlacement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_placementForPlacement:");
}

id objc_msgSend__policyDataFromAdData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_policyDataFromAdData:");
}

id objc_msgSend__printCacheStatistics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_printCacheStatistics");
}

id objc_msgSend__processContentIdOverrideIfNecessaryForMetric_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processContentIdOverrideIfNecessaryForMetric:");
}

id objc_msgSend__processMetric_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processMetric:");
}

id objc_msgSend__processNextFile_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processNextFile:completionHandler:");
}

id objc_msgSend__processSigningQueue_useFpdi_signingAuthorityPoolManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processSigningQueue:useFpdi:signingAuthorityPoolManager:");
}

id objc_msgSend__properties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_properties");
}

id objc_msgSend__propertiesDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_propertiesDictionary");
}

id objc_msgSend__proxiedObjectIsAlive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_proxiedObjectIsAlive");
}

id objc_msgSend__purpose(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_purpose");
}

id objc_msgSend__purposeConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_purposeConfig:");
}

id objc_msgSend__purposeFromPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_purposeFromPath:");
}

id objc_msgSend__rateLimitPlacementTypes_context_token_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rateLimitPlacementTypes:context:token:completionHandler:");
}

id objc_msgSend__readChannels(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_readChannels");
}

id objc_msgSend__readResponseJsonForPlacement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_readResponseJsonForPlacement:");
}

id objc_msgSend__refillCacheWithTokensDetail_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_refillCacheWithTokensDetail:");
}

id objc_msgSend__registerMetricRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerMetricRequest:");
}

id objc_msgSend__relayData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_relayData");
}

id objc_msgSend__removeItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeItem:");
}

id objc_msgSend__removeItemInBlockForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeItemInBlockForKey:");
}

id objc_msgSend__removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeObjectForKey:");
}

id objc_msgSend__removePendingRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removePendingRequest:");
}

id objc_msgSend__reportBuildRequestForPlacement_duration_bagDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reportBuildRequestForPlacement:duration:bagDuration:");
}

id objc_msgSend__reportStatisticsForDuration_storageInfo_cancelled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reportStatisticsForDuration:storageInfo:cancelled:");
}

id objc_msgSend__requestDebugInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requestDebugInfo");
}

id objc_msgSend__requestFromMediaApi_params_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requestFromMediaApi:params:completionHandler:");
}

id objc_msgSend__requestFromMediaWithParams_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requestFromMediaWithParams:completionHandler:");
}

id objc_msgSend__requestJsonCatchingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requestJsonCatchingError:");
}

id objc_msgSend__requireClassType_name_expectedClass_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requireClassType:name:expectedClass:error:");
}

id objc_msgSend__resultForResponseStatusCode_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resultForResponseStatusCode:error:");
}

id objc_msgSend__resumeTelephonyAndReachability(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resumeTelephonyAndReachability");
}

id objc_msgSend__retrievePersonalizedAdsValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_retrievePersonalizedAdsValue");
}

id objc_msgSend__retryFailedIfAvailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_retryFailedIfAvailable");
}

id objc_msgSend__run_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_run:");
}

id objc_msgSend__samplePeriodFromConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_samplePeriodFromConfig:");
}

id objc_msgSend__sampleRateFromConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sampleRateFromConfig:");
}

id objc_msgSend__sendEventDatabaseCoreAnalytics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendEventDatabaseCoreAnalytics");
}

id objc_msgSend__sendFirstRequestMetricIfRequiredForPlacement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendFirstRequestMetricIfRequiredForPlacement:");
}

id objc_msgSend__sendPayload_successCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendPayload:successCompletionHandler:");
}

id objc_msgSend__sendRawData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendRawData:");
}

id objc_msgSend__sendReportWithProperties_environment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendReportWithProperties:environment:");
}

id objc_msgSend__sendRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendRequest:");
}

id objc_msgSend__sendRequest_responseCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendRequest:responseCallback:");
}

id objc_msgSend__serverConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverConfiguration");
}

id objc_msgSend__serverEnvironmentTranslation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverEnvironmentTranslation:");
}

id objc_msgSend__serverPost_requestTimestamp_payloadDeliveryStartDate_interval_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverPost:requestTimestamp:payloadDeliveryStartDate:interval:completionHandler:");
}

id objc_msgSend__serverURLForPurpose_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serverURLForPurpose:");
}

id objc_msgSend__setLastGCDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setLastGCDate:");
}

id objc_msgSend__setObject_objectSerializedData_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setObject:objectSerializedData:forKey:");
}

id objc_msgSend__setRateLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setRateLimit:");
}

id objc_msgSend__setupAccumulator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupAccumulator");
}

id objc_msgSend__setupConnection_port_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupConnection:port:");
}

id objc_msgSend__setupNotifyListener(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupNotifyListener");
}

id objc_msgSend__shelvedPathForChannel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shelvedPathForChannel:");
}

id objc_msgSend__shouldBackoffForDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldBackoffForDestination:");
}

id objc_msgSend__shouldReturnFakeResponse(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldReturnFakeResponse");
}

id objc_msgSend__shouldSample_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldSample:");
}

id objc_msgSend__signFile_usingSigningAuthority_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_signFile:usingSigningAuthority:completionHandler:");
}

id objc_msgSend__sortByRank_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sortByRank:completionHandler:");
}

id objc_msgSend__startAccumulationSource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startAccumulationSource");
}

id objc_msgSend__startInactivitySource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startInactivitySource");
}

id objc_msgSend__startMonitoringTelephony(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startMonitoringTelephony");
}

id objc_msgSend__startTestCommandsListener(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startTestCommandsListener");
}

id objc_msgSend__stopAccumulationSource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stopAccumulationSource");
}

id objc_msgSend__stopDeliveryTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stopDeliveryTimer");
}

id objc_msgSend__stopInactivitySource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stopInactivitySource");
}

id objc_msgSend__storeEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_storeEvent:");
}

id objc_msgSend__storeIntegrityEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_storeIntegrityEvent:");
}

id objc_msgSend__storefront(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_storefront");
}

id objc_msgSend__submitNewTask(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_submitNewTask");
}

id objc_msgSend__tapActionFromAdData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tapActionFromAdData:error:");
}

id objc_msgSend__targetingDimensionsFromAdData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_targetingDimensionsFromAdData:");
}

id objc_msgSend__timeIntervalToTomorrow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_timeIntervalToTomorrow");
}

id objc_msgSend__translateAd_contextID_iAdID_placement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_translateAd:contextID:iAdID:placement:");
}

id objc_msgSend__translateAdResult_contextID_iAdID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_translateAdResult:contextID:iAdID:");
}

id objc_msgSend__translateChildNodesToExpressionFormat_dataDictionary_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_translateChildNodesToExpressionFormat:dataDictionary:error:");
}

id objc_msgSend__translateMediaApiResponseToAds_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_translateMediaApiResponseToAds:error:");
}

id objc_msgSend__translateNodeToDataAdaptor_dataDictionary_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_translateNodeToDataAdaptor:dataDictionary:error:");
}

id objc_msgSend__translateRootNodeToExpressionFormat_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_translateRootNodeToExpressionFormat:error:");
}

id objc_msgSend__typeDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_typeDictionary");
}

id objc_msgSend__unconfirmedImpressionRequest_internalContent_context_clientInfo_idAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unconfirmedImpressionRequest:internalContent:context:clientInfo:idAccount:");
}

id objc_msgSend__unloadHeavyContentFromContentData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_unloadHeavyContentFromContentData");
}

id objc_msgSend__update(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_update");
}

id objc_msgSend__updateLastPlaybackTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLastPlaybackTimestamp");
}

id objc_msgSend__updateRateAndTime_rate_purpose_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateRateAndTime:rate:purpose:");
}

id objc_msgSend__updateSampleSessionStorage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSampleSessionStorage:");
}

id objc_msgSend__uploadFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_uploadFile:");
}

id objc_msgSend__validateAndAddReference_reference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_validateAndAddReference:reference:");
}

id objc_msgSend__validateMetric_forKey_fromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_validateMetric:forKey:fromDictionary:");
}

id objc_msgSend__validateMetric_withMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_validateMetric:withMetrics:");
}

id objc_msgSend__validateParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_validateParameters:");
}

id objc_msgSend__validateRouteDefinition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_validateRouteDefinition:");
}

id objc_msgSend__visibleStateChanged_duration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_visibleStateChanged:duration:");
}

id objc_msgSend__withdrawShelvedBatchesForChannel_groupBatches_signingAuthority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_withdrawShelvedBatchesForChannel:groupBatches:signingAuthority:");
}

id objc_msgSend__writeChannels(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_writeChannels");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_accessAdCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessAdCopy");
}

id objc_msgSend_accessCaption(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessCaption");
}

id objc_msgSend_accessHeadline(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessHeadline");
}

id objc_msgSend_accessText(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessText");
}

id objc_msgSend_accessibilityDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessibilityDescription");
}

id objc_msgSend_accountSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountSettings");
}

id objc_msgSend_accountStateAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountStateAtIndex:");
}

id objc_msgSend_accountStatesCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountStatesCount");
}

id objc_msgSend_accountTypeAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountTypeAtIndex:");
}

id objc_msgSend_accountTypesCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountTypesCount");
}

id objc_msgSend_accumulate50PercentVisibilityTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accumulate50PercentVisibilityTime:");
}

id objc_msgSend_accumulate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accumulate:");
}

id objc_msgSend_accumulateAdRequests_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accumulateAdRequests:");
}

id objc_msgSend_accumulateVisibilityTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accumulateVisibilityTime:");
}

id objc_msgSend_accumulated50PercentVisibilityTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accumulated50PercentVisibilityTime");
}

id objc_msgSend_accumulatedItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accumulatedItems");
}

id objc_msgSend_accumulatedPlaybackTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accumulatedPlaybackTime");
}

id objc_msgSend_accumulatedVisibilityTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accumulatedVisibilityTime");
}

id objc_msgSend_accumulationHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accumulationHandler");
}

id objc_msgSend_accumulationTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accumulationTime");
}

id objc_msgSend_accumulatorLock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accumulatorLock");
}

id objc_msgSend_acknowledgedVersionForPersonalizedAds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acknowledgedVersionForPersonalizedAds");
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "action");
}

id objc_msgSend_actionURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionURL");
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actions");
}

id objc_msgSend_actionsAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionsAtIndex:");
}

id objc_msgSend_actionsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionsCount");
}

id objc_msgSend_activeChannels(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeChannels");
}

id objc_msgSend_activeCleanupOperation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeCleanupOperation");
}

id objc_msgSend_activeDataTask(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeDataTask");
}

id objc_msgSend_adAccumulator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adAccumulator");
}

id objc_msgSend_adAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adAtIndex:");
}

id objc_msgSend_adCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adCopy");
}

id objc_msgSend_adDataResponseIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adDataResponseIdentifier");
}

id objc_msgSend_adFormatType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adFormatType");
}

id objc_msgSend_adFrequencyCapData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adFrequencyCapData");
}

id objc_msgSend_adFrequencyDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adFrequencyDuration");
}

id objc_msgSend_adFrequencyValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adFrequencyValue");
}

id objc_msgSend_adLayoutDataAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adLayoutDataAtIndex:");
}

id objc_msgSend_adLayoutDatas(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adLayoutDatas");
}

id objc_msgSend_adLayoutDatasCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adLayoutDatasCount");
}

id objc_msgSend_adLayoutDetails(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adLayoutDetails");
}

id objc_msgSend_adMetadata(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adMetadata");
}

id objc_msgSend_adNetworkId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adNetworkId");
}

id objc_msgSend_adOriginalRequesterId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adOriginalRequesterId");
}

id objc_msgSend_adPolicies(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adPolicies");
}

id objc_msgSend_adPosition(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adPosition");
}

id objc_msgSend_adPrivacyMarkPosition(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adPrivacyMarkPosition");
}

id objc_msgSend_adPrivacyMarkPositionToAdPrivacyMarkerPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adPrivacyMarkPositionToAdPrivacyMarkerPosition:");
}

id objc_msgSend_adRequesterLock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adRequesterLock");
}

id objc_msgSend_adRequesters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adRequesters");
}

id objc_msgSend_adResponseAudio(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adResponseAudio");
}

id objc_msgSend_adResponseBanner(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adResponseBanner");
}

id objc_msgSend_adResponseDataForPlacementType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adResponseDataForPlacementType:");
}

id objc_msgSend_adResponseIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adResponseIdentifier");
}

id objc_msgSend_adResponseInterstitial(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adResponseInterstitial");
}

id objc_msgSend_adResponseNative(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adResponseNative");
}

id objc_msgSend_adResponseSponsorship(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adResponseSponsorship");
}

id objc_msgSend_adResponseVideo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adResponseVideo");
}

id objc_msgSend_adServerEnvironment(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adServerEnvironment");
}

id objc_msgSend_adSizeForContainerSize_adData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adSizeForContainerSize:adData:");
}

id objc_msgSend_adTag(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adTag");
}

id objc_msgSend_adTagContentString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adTagContentString");
}

id objc_msgSend_adType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adType");
}

id objc_msgSend_adUpdatesAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adUpdatesAtIndex:");
}

id objc_msgSend_adUpdatesCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adUpdatesCount");
}

id objc_msgSend_adamID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adamID");
}

id objc_msgSend_adamId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adamId");
}

id objc_msgSend_adamIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adamIdentifier");
}

id objc_msgSend_adaptorIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adaptorIdentifier");
}

id objc_msgSend_adaptorWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adaptorWithIdentifier:");
}

id objc_msgSend_add_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "add:");
}

id objc_msgSend_addAccountProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAccountProperties:");
}

id objc_msgSend_addAccountState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAccountState:");
}

id objc_msgSend_addAccountType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAccountType:");
}

id objc_msgSend_addActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addActions:");
}

id objc_msgSend_addActiveChannel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addActiveChannel:");
}

id objc_msgSend_addAd_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAd:");
}

id objc_msgSend_addAdLayoutData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAdLayoutData:");
}

id objc_msgSend_addAdUpdates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAdUpdates:");
}

id objc_msgSend_addAdsToEvict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAdsToEvict:");
}

id objc_msgSend_addAllowedExternalDomains_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAllowedExternalDomains:");
}

id objc_msgSend_addAssetInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAssetInfo:");
}

id objc_msgSend_addAssociatedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAssociatedObject:");
}

id objc_msgSend_addCachedAds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCachedAds:");
}

id objc_msgSend_addCapData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCapData:");
}

id objc_msgSend_addClasses_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addClasses:");
}

id objc_msgSend_addClientInfoProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addClientInfoProperties:");
}

id objc_msgSend_addClientToSegments_token_bundleID_replaceExisting_privateSegment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addClientToSegments:token:bundleID:replaceExisting:privateSegment:");
}

id objc_msgSend_addColors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addColors:");
}

id objc_msgSend_addConfirmedClickPixelURLs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addConfirmedClickPixelURLs:");
}

id objc_msgSend_addContentData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addContentData:");
}

id objc_msgSend_addContentDataOnly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addContentDataOnly:");
}

id objc_msgSend_addContentRestrictionProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addContentRestrictionProperties:");
}

id objc_msgSend_addCountForDayOfYear_purpose_event_value_environment_branch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCountForDayOfYear:purpose:event:value:environment:branch:");
}

id objc_msgSend_addCreativeSizes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCreativeSizes:");
}

id objc_msgSend_addCriteriaValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCriteriaValues:");
}

id objc_msgSend_addCurrentConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCurrentConfiguration:");
}

id objc_msgSend_addDarkModeColors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDarkModeColors:");
}

id objc_msgSend_addData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addData:error:");
}

id objc_msgSend_addDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDelegate:");
}

id objc_msgSend_addDeviceInfoProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDeviceInfoProperties:");
}

id objc_msgSend_addDeviceMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDeviceMode:");
}

id objc_msgSend_addDistributionMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDistributionMetrics:");
}

id objc_msgSend_addElements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addElements:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEvent:");
}

id objc_msgSend_addEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEvents:");
}

id objc_msgSend_addExcludeTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addExcludeTag:");
}

id objc_msgSend_addExclusionCriteria_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addExclusionCriteria:");
}

id objc_msgSend_addExecutionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addExecutionBlock:");
}

id objc_msgSend_addFailingURLs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFailingURLs:");
}

id objc_msgSend_addFakeResponseHeadersToHeaders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFakeResponseHeadersToHeaders:");
}

id objc_msgSend_addFinishBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFinishBlock:");
}

id objc_msgSend_addFunctionNames_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFunctionNames:");
}

id objc_msgSend_addGeofences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addGeofences:");
}

id objc_msgSend_addIDAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIDAccount:");
}

id objc_msgSend_addITunesMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addITunesMetadata:");
}

id objc_msgSend_addInclusionCriteria_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addInclusionCriteria:");
}

id objc_msgSend_addInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addInfo:");
}

id objc_msgSend_addInternalPropertyValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addInternalPropertyValue:forKey:");
}

id objc_msgSend_addJourneyStartRelayValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addJourneyStartRelayValues:");
}

id objc_msgSend_addLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addLines:");
}

id objc_msgSend_addLocalizedHeadlines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addLocalizedHeadlines:");
}

id objc_msgSend_addMatchTagClause_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addMatchTagClause:");
}

id objc_msgSend_addMediaAssets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addMediaAssets:");
}

id objc_msgSend_addMetaData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addMetaData:");
}

id objc_msgSend_addMetric_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addMetric:");
}

id objc_msgSend_addMiscellaneousProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addMiscellaneousProperties:");
}

id objc_msgSend_addNativeMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addNativeMetadata:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObject_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:error:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_addOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOffset:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_addOperations_waitUntilFinished_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperations:waitUntilFinished:");
}

id objc_msgSend_addPandoraTestProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPandoraTestProperties:");
}

id objc_msgSend_addParameter_value_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addParameter:value:parameters:");
}

id objc_msgSend_addParameterList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addParameterList:");
}

id objc_msgSend_addParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addParameters:");
}

id objc_msgSend_addPaymentCapabilities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPaymentCapabilities:");
}

id objc_msgSend_addPointer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPointer:");
}

id objc_msgSend_addPolicyValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPolicyValues:");
}

id objc_msgSend_addReference_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addReference:");
}

id objc_msgSend_addRepeatingObject_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRepeatingObject:count:");
}

id objc_msgSend_addRepresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRepresentation:");
}

id objc_msgSend_addRepresentationWithSize_andPlacementType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRepresentationWithSize:andPlacementType:");
}

id objc_msgSend_addRepresentations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRepresentations:");
}

id objc_msgSend_addRequesters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRequesters:");
}

id objc_msgSend_addRequestersToRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRequestersToRequest:");
}

id objc_msgSend_addRequiredTags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRequiredTags:");
}

id objc_msgSend_addResourceCacheEntries_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addResourceCacheEntries:");
}

id objc_msgSend_addResultTags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addResultTags:");
}

id objc_msgSend_addRewardTokens_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRewardTokens:");
}

id objc_msgSend_addScalarMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addScalarMetrics:");
}

id objc_msgSend_addScreenSaverImageURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addScreenSaverImageURL:");
}

id objc_msgSend_addSegmentIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSegmentIdentifiers:");
}

id objc_msgSend_addStoryboardSizes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addStoryboardSizes:");
}

id objc_msgSend_addSupportedPaymentNetworks_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSupportedPaymentNetworks:");
}

id objc_msgSend_addTagTransformations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTagTransformations:");
}

id objc_msgSend_addTags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTags:");
}

id objc_msgSend_addTheConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTheConfiguration:");
}

id objc_msgSend_addTiltTrackBlob_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTiltTrackBlob:");
}

id objc_msgSend_addToken_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addToken:bundleID:");
}

id objc_msgSend_addTokens_isDetailed_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTokens:isDetailed:error:");
}

id objc_msgSend_addTrackingURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTrackingURL:");
}

id objc_msgSend_addURLsToEvict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addURLsToEvict:");
}

id objc_msgSend_addUserKeyboard_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addUserKeyboard:");
}

id objc_msgSend_addVersionedAttributionDetails_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addVersionedAttributionDetails:");
}

id objc_msgSend_addVideoAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addVideoAsset:");
}

id objc_msgSend_addedToDirectoryDateForFileAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addedToDirectoryDateForFileAtPath:error:");
}

id objc_msgSend_additionalRequestDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "additionalRequestDescription");
}

id objc_msgSend_additives_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "additives:");
}

id objc_msgSend_adjacency(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adjacency");
}

id objc_msgSend_adjacent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adjacent");
}

id objc_msgSend_adminArea(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adminArea");
}

id objc_msgSend_administrativeArea(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "administrativeArea");
}

id objc_msgSend_adprivacydBag(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adprivacydBag");
}

id objc_msgSend_ads(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ads");
}

id objc_msgSend_adsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adsCount");
}

id objc_msgSend_adsToEvictAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adsToEvictAtIndex:");
}

id objc_msgSend_adsToEvictsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adsToEvictsCount");
}

id objc_msgSend_ageGenderData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ageGenderData");
}

id objc_msgSend_ageUnknown(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ageUnknown");
}

id objc_msgSend_alias(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alias");
}

id objc_msgSend_aliasTransformedPolicies_alias_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aliasTransformedPolicies:alias:");
}

id objc_msgSend_allEvents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allEvents");
}

id objc_msgSend_allEventsForHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allEventsForHandle:");
}

id objc_msgSend_allHTTPHeaderFields(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allHTTPHeaderFields");
}

id objc_msgSend_allIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allIdentifiers");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allKeysForObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allKeysForObject:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allPlacementTypesForContentData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allPlacementTypesForContentData:");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allValues");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_allocatedSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocatedSize");
}

id objc_msgSend_allowEmptyParameters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowEmptyParameters");
}

id objc_msgSend_allowList(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowList");
}

id objc_msgSend_allowedExternalDomainsAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowedExternalDomainsAtIndex:");
}

id objc_msgSend_allowedExternalDomainsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowedExternalDomainsCount");
}

id objc_msgSend_allowedPurposes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowedPurposes");
}

id objc_msgSend_allowedSources(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowedSources");
}

id objc_msgSend_analytics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "analytics");
}

id objc_msgSend_ancientItemBlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ancientItemBlock");
}

id objc_msgSend_anonymousDemandID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anonymousDemandID");
}

id objc_msgSend_anonymousDemandId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anonymousDemandId");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anyObject");
}

id objc_msgSend_apDefaultSharedFormatter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "apDefaultSharedFormatter");
}

id objc_msgSend_apLocalSharedFormatter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "apLocalSharedFormatter");
}

id objc_msgSend_apUTCSharedFormatter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "apUTCSharedFormatter");
}

id objc_msgSend_appAdTrackingStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appAdTrackingStatus");
}

id objc_msgSend_appMetadataFields(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appMetadataFields");
}

id objc_msgSend_appStoreViewTemplate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appStoreViewTemplate");
}

id objc_msgSend_appTrackingStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appTrackingStatus:");
}

id objc_msgSend_appVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appVersion");
}

id objc_msgSend_appearedOnScreenWithStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appearedOnScreenWithStatus:");
}

id objc_msgSend_appendBytes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendBytes:");
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendData:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayByAddingObject_forIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObject:forIdentifier:");
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayByRemovingObjectForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByRemovingObjectForIdentifier:");
}

id objc_msgSend_arrayForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayForKey:");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithCountedSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCountedSet:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_artist(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "artist");
}

id objc_msgSend_asHexString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "asHexString");
}

id objc_msgSend_asset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "asset");
}

id objc_msgSend_assetInfoAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetInfoAtIndex:");
}

id objc_msgSend_assetInfos(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetInfos");
}

id objc_msgSend_assetInfosCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetInfosCount");
}

id objc_msgSend_assignPersistentCacheStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assignPersistentCacheStore:");
}

id objc_msgSend_associatedObjectFileNameForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "associatedObjectFileNameForIdentifier:");
}

id objc_msgSend_associatedObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "associatedObjects");
}

id objc_msgSend_attemptId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attemptId");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_attributionDownloadType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributionDownloadType");
}

id objc_msgSend_attributionKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributionKey");
}

id objc_msgSend_attributionMetadataExistsOnDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributionMetadataExistsOnDevice");
}

id objc_msgSend_attributionSignature(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributionSignature");
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "auditToken");
}

id objc_msgSend_autoloop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "autoloop");
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundColor");
}

id objc_msgSend_backoffFromResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backoffFromResponse:");
}

id objc_msgSend_backoffIndex(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backoffIndex");
}

id objc_msgSend_backoffLevels(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backoffLevels");
}

id objc_msgSend_backoffTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backoffTimer");
}

id objc_msgSend_backoffTimerForDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backoffTimerForDestination:");
}

id objc_msgSend_backoffTimers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backoffTimers");
}

id objc_msgSend_bagForProfile_profileVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bagForProfile:profileVersion:");
}

id objc_msgSend_bagSubProfile(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bagSubProfile");
}

id objc_msgSend_bagSubProfileVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bagSubProfileVersion");
}

id objc_msgSend_bannerImpressionThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bannerImpressionThreshold");
}

id objc_msgSend_bars(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bars");
}

id objc_msgSend_base64Decode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "base64Decode:");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_base64FilenameSafeEncoded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "base64FilenameSafeEncoded");
}

id objc_msgSend_baseHandleInterfaceOnScreen_internalContent_context_idAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "baseHandleInterfaceOnScreen:internalContent:context:idAccount:");
}

id objc_msgSend_baseURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "baseURL");
}

id objc_msgSend_batchClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "batchClass");
}

id objc_msgSend_batchClosedWithBatchLifetime_eventsCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "batchClosedWithBatchLifetime:eventsCount:");
}

id objc_msgSend_batchDeliveredClosure(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "batchDeliveredClosure");
}

id objc_msgSend_batchDequeuedWithWaitingTime_queueLength_batchID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "batchDequeuedWithWaitingTime:queueLength:batchID:");
}

id objc_msgSend_batchEnqueuedWithQueueLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "batchEnqueuedWithQueueLength:");
}

id objc_msgSend_batchExpiredWithBatchID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "batchExpiredWithBatchID:");
}

id objc_msgSend_batchId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "batchId");
}

id objc_msgSend_batchInfos(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "batchInfos");
}

id objc_msgSend_batchPathToPurpose_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "batchPathToPurpose:");
}

id objc_msgSend_batchResponseFromBase64EncodedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "batchResponseFromBase64EncodedString:");
}

id objc_msgSend_batchResponseID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "batchResponseID");
}

id objc_msgSend_batchSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "batchSize");
}

id objc_msgSend_batchSizeUInteger(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "batchSizeUInteger");
}

id objc_msgSend_batchedRequests(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "batchedRequests");
}

id objc_msgSend_batchesData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "batchesData");
}

id objc_msgSend_beginSignpostForPlacement_log_logID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginSignpostForPlacement:log:logID:");
}

id objc_msgSend_beginTransaction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginTransaction");
}

id objc_msgSend_billing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "billing");
}

id objc_msgSend_bitrate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bitrate");
}

id objc_msgSend_block(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "block");
}

id objc_msgSend_blockAdsForSubscribers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "blockAdsForSubscribers");
}

id objc_msgSend_body(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "body");
}

id objc_msgSend_bodyContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bodyContext");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_borderStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "borderStyle");
}

id objc_msgSend_branch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "branch");
}

id objc_msgSend_brandIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "brandIdentifier");
}

id objc_msgSend_buffer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buffer");
}

id objc_msgSend_buildFinalPolicies_policyValue_policyType_expression_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildFinalPolicies:policyValue:policyType:expression:");
}

id objc_msgSend_buildMetricDeliveryRequestFromData_toChannel_billing_signingAuthority_failIfSignatureIsNotAvailable_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildMetricDeliveryRequestFromData:toChannel:billing:signingAuthority:failIfSignatureIsNotAvailable:error:");
}

id objc_msgSend_buildSignatureUsingSigningAuthority_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildSignatureUsingSigningAuthority:error:");
}

id objc_msgSend_buildURLForRequestProtobuf_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildURLForRequestProtobuf:");
}

id objc_msgSend_buildVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildVersion");
}

id objc_msgSend_bundleContainerURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleContainerURL");
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleID");
}

id objc_msgSend_bundleIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIDs");
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleId");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundleIdentifierAllowList(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIdentifierAllowList");
}

id objc_msgSend_bundles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundles");
}

id objc_msgSend_buttonStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonStyle");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bytes");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_cache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cache");
}

id objc_msgSend_cacheKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cacheKey");
}

id objc_msgSend_cacheKeyForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cacheKeyForIdentifier:");
}

id objc_msgSend_cacheObjectTTL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cacheObjectTTL");
}

id objc_msgSend_cacheSizeLimit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cacheSizeLimit");
}

id objc_msgSend_cacheSizeLimitDefaultValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cacheSizeLimitDefaultValue");
}

id objc_msgSend_cacheSizeLimitValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cacheSizeLimitValue");
}

id objc_msgSend_cacheSizeWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cacheSizeWithCompletionHandler:");
}

id objc_msgSend_cacheStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cacheStore");
}

id objc_msgSend_cachedAdsAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachedAdsAtIndex:");
}

id objc_msgSend_cachedAdsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachedAdsCount");
}

id objc_msgSend_cachedCertificate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachedCertificate");
}

id objc_msgSend_cachedElementForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachedElementForBundleIdentifier:");
}

id objc_msgSend_calculateDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "calculateDuration");
}

id objc_msgSend_calendarWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "calendarWithIdentifier:");
}

id objc_msgSend_campaignId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "campaignId");
}

id objc_msgSend_campaignNamespace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "campaignNamespace");
}

id objc_msgSend_campaignNamespaceForPlacement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "campaignNamespaceForPlacement:");
}

id objc_msgSend_canBeGarbageCollected(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canBeGarbageCollected");
}

id objc_msgSend_canReturnToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canReturnToken:");
}

id objc_msgSend_canSend50PercentImpression_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canSend50PercentImpression:");
}

id objc_msgSend_canSendImpression_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canSendImpression:");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancel");
}

id objc_msgSend_cancel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancel:");
}

id objc_msgSend_cancelActiveWork_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelActiveWork:");
}

id objc_msgSend_cancelConfigurationUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelConfigurationUpdate");
}

id objc_msgSend_cancelDelayedRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelDelayedRequest");
}

id objc_msgSend_cancelRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelRequest");
}

id objc_msgSend_cancelled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelled");
}

id objc_msgSend_capDataFromKeyChain_adamID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "capDataFromKeyChain:adamID:");
}

id objc_msgSend_caption(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "caption");
}

id objc_msgSend_carousel50PercentVisibleTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "carousel50PercentVisibleTime");
}

id objc_msgSend_carouselElementClicked_element_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "carouselElementClicked:element:");
}

id objc_msgSend_carouselElementsPartiallyVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "carouselElementsPartiallyVisible");
}

id objc_msgSend_carouselElementsVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "carouselElementsVisible");
}

id objc_msgSend_carouselFinishedSent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "carouselFinishedSent");
}

id objc_msgSend_carouselVisibleStateChanged_duration_elements_partialElements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "carouselVisibleStateChanged:duration:elements:partialElements:");
}

id objc_msgSend_carouselVisibleTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "carouselVisibleTime");
}

id objc_msgSend_cartesianProduct_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cartesianProduct:");
}

id objc_msgSend_categories(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "categories");
}

id objc_msgSend_certificate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "certificate");
}

id objc_msgSend_certificateRetrievalDidFinish_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "certificateRetrievalDidFinish:error:");
}

id objc_msgSend_channel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "channel");
}

id objc_msgSend_channels(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "channels");
}

id objc_msgSend_charValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "charValue");
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "characterSetWithCharactersInString:");
}

id objc_msgSend_checkExpiry(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkExpiry");
}

id objc_msgSend_checkForDiscards_placementType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkForDiscards:placementType:");
}

id objc_msgSend_checkForNonWKDiscardOverrides_forAdamID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkForNonWKDiscardOverrides:forAdamID:");
}

id objc_msgSend_checkin(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkin");
}

id objc_msgSend_children(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "children");
}

id objc_msgSend_cleanCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanCache");
}

id objc_msgSend_cleanupOldStorage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanupOldStorage");
}

id objc_msgSend_clearAccountStates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearAccountStates");
}

id objc_msgSend_clearAccountTypes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearAccountTypes");
}

id objc_msgSend_clearActions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearActions");
}

id objc_msgSend_clearAdLayoutDatas(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearAdLayoutDatas");
}

id objc_msgSend_clearAdUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearAdUpdates");
}

id objc_msgSend_clearAds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearAds");
}

id objc_msgSend_clearAdsToEvicts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearAdsToEvicts");
}

id objc_msgSend_clearAllowedExternalDomains(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearAllowedExternalDomains");
}

id objc_msgSend_clearAssetInfos(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearAssetInfos");
}

id objc_msgSend_clearCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearCache");
}

id objc_msgSend_clearCachedAds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearCachedAds");
}

id objc_msgSend_clearColors(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearColors");
}

id objc_msgSend_clearConfirmedClickPixelURLs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearConfirmedClickPixelURLs");
}

id objc_msgSend_clearCreativeSizes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearCreativeSizes");
}

id objc_msgSend_clearCriteriaValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearCriteriaValues");
}

id objc_msgSend_clearCurrentConfigurations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearCurrentConfigurations");
}

id objc_msgSend_clearDarkModeColors(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearDarkModeColors");
}

id objc_msgSend_clearDeviceModes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearDeviceModes");
}

id objc_msgSend_clearDistributionMetrics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearDistributionMetrics");
}

id objc_msgSend_clearElements(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearElements");
}

id objc_msgSend_clearEvents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearEvents");
}

id objc_msgSend_clearExcludeTags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearExcludeTags");
}

id objc_msgSend_clearExclusionCriterias(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearExclusionCriterias");
}

id objc_msgSend_clearFailingURLs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearFailingURLs");
}

id objc_msgSend_clearFunctionNames(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearFunctionNames");
}

id objc_msgSend_clearGeofences(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearGeofences");
}

id objc_msgSend_clearITunesMetadatas(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearITunesMetadatas");
}

id objc_msgSend_clearInclusionCriterias(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearInclusionCriterias");
}

id objc_msgSend_clearInfos(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearInfos");
}

id objc_msgSend_clearJourneyStartRelayValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearJourneyStartRelayValues");
}

id objc_msgSend_clearLines(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearLines");
}

id objc_msgSend_clearLocalizedHeadlines(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearLocalizedHeadlines");
}

id objc_msgSend_clearMatchTagClauses(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearMatchTagClauses");
}

id objc_msgSend_clearMediaAssets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearMediaAssets");
}

id objc_msgSend_clearMetrics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearMetrics");
}

id objc_msgSend_clearNativeMetadatas(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearNativeMetadatas");
}

id objc_msgSend_clearOffsets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearOffsets");
}

id objc_msgSend_clearOneofValuesForValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearOneofValuesForValue");
}

id objc_msgSend_clearParameterLists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearParameterLists");
}

id objc_msgSend_clearParameters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearParameters");
}

id objc_msgSend_clearPaymentCapabilities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearPaymentCapabilities");
}

id objc_msgSend_clearPolicyValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearPolicyValues");
}

id objc_msgSend_clearRequesters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRequesters");
}

id objc_msgSend_clearRequiredTags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRequiredTags");
}

id objc_msgSend_clearResourceCacheEntries(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearResourceCacheEntries");
}

id objc_msgSend_clearResultTags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearResultTags");
}

id objc_msgSend_clearRewardTokens(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearRewardTokens");
}

id objc_msgSend_clearScalarMetrics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearScalarMetrics");
}

id objc_msgSend_clearScreenSaverImageURLs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearScreenSaverImageURLs");
}

id objc_msgSend_clearSegmentIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearSegmentIdentifiers");
}

id objc_msgSend_clearStatusCondition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearStatusCondition:");
}

id objc_msgSend_clearStoryboardSizes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearStoryboardSizes");
}

id objc_msgSend_clearSupportedPaymentNetworks(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearSupportedPaymentNetworks");
}

id objc_msgSend_clearTagTransformations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearTagTransformations");
}

id objc_msgSend_clearTags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearTags");
}

id objc_msgSend_clearTheConfigurations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearTheConfigurations");
}

id objc_msgSend_clearTiltTrackBlobs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearTiltTrackBlobs");
}

id objc_msgSend_clearTrackingURLs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearTrackingURLs");
}

id objc_msgSend_clearURLsToEvicts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearURLsToEvicts");
}

id objc_msgSend_clearUserKeyboards(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearUserKeyboards");
}

id objc_msgSend_clearVersionedAttributionDetails(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearVersionedAttributionDetails");
}

id objc_msgSend_clearVideoAssets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearVideoAssets");
}

id objc_msgSend_clickActionTypeToTapActionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clickActionTypeToTapActionType:");
}

id objc_msgSend_clickCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clickCount");
}

id objc_msgSend_clickLocation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clickLocation");
}

id objc_msgSend_clickTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clickTime");
}

id objc_msgSend_clicked_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clicked:");
}

id objc_msgSend_clickedCarouselElement(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clickedCarouselElement");
}

id objc_msgSend_clientConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientConnection");
}

id objc_msgSend_clientId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientId");
}

id objc_msgSend_clientInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientInfo");
}

id objc_msgSend_clock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clock");
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "close");
}

id objc_msgSend_closeActiveBatches(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "closeActiveBatches");
}

id objc_msgSend_closeBatchesForChannels_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "closeBatchesForChannels:");
}

id objc_msgSend_closeShelvedBatchesForChannel_groupBatches_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "closeShelvedBatchesForChannel:groupBatches:");
}

id objc_msgSend_closedStoragePathPrefix(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "closedStoragePathPrefix");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "code");
}

id objc_msgSend_collect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collect");
}

id objc_msgSend_collection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collection");
}

id objc_msgSend_collectionProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionProvider");
}

id objc_msgSend_collectionProviderLock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionProviderLock");
}

id objc_msgSend_collectionType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionType");
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "color");
}

id objc_msgSend_colors(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colors");
}

id objc_msgSend_colorsAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorsAtIndex:");
}

id objc_msgSend_colorsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorsCount");
}

id objc_msgSend_columns(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "columns");
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commit");
}

id objc_msgSend_commitTransaction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commitTransaction");
}

id objc_msgSend_compactMapObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compactMapObjectsUsingBlock:");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_completeServerRequestId_result_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "completeServerRequestId:result:");
}

id objc_msgSend_completeServerRequestId_serverFailureCount_result_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "completeServerRequestId:serverFailureCount:result:");
}

id objc_msgSend_completionHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "completionHandler");
}

id objc_msgSend_component_fromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "component:fromDate:");
}

id objc_msgSend_components_fromDate_toDate_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "components:fromDate:toDate:options:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_componentsWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsWithString:");
}

id objc_msgSend_conditionsService(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conditionsService");
}

id objc_msgSend_configDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configDictionary");
}

id objc_msgSend_configRequester(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configRequester");
}

id objc_msgSend_configurationForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationForClass:");
}

id objc_msgSend_configurationForClass_usingCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationForClass:usingCache:");
}

id objc_msgSend_configurationStorage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationStorage");
}

id objc_msgSend_configurations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurations");
}

id objc_msgSend_confirm50PercentImpression(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "confirm50PercentImpression");
}

id objc_msgSend_confirmClick(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "confirmClick");
}

id objc_msgSend_confirmImpression(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "confirmImpression");
}

id objc_msgSend_confirmedClickInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "confirmedClickInterval");
}

id objc_msgSend_confirmedClickLock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "confirmedClickLock");
}

id objc_msgSend_confirmedClickPixelURLsAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "confirmedClickPixelURLsAtIndex:");
}

id objc_msgSend_confirmedClickPixelURLsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "confirmedClickPixelURLsCount");
}

id objc_msgSend_confirmedClickTimeInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "confirmedClickTimeInterval");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connection");
}

id objc_msgSend_connectionType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionType");
}

id objc_msgSend_connectionTypeToAPPBAdConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionTypeToAPPBAdConnection:");
}

id objc_msgSend_connectionTypeToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionTypeToString:");
}

id objc_msgSend_consumed50PercentImpressions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "consumed50PercentImpressions");
}

id objc_msgSend_consumedImpressions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "consumedImpressions");
}

id objc_msgSend_container(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "container");
}

id objc_msgSend_containerType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerType");
}

id objc_msgSend_containsDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsDate:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "content");
}

id objc_msgSend_contentData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentData");
}

id objc_msgSend_contentDataItemIds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentDataItemIds");
}

id objc_msgSend_contentDataItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentDataItems");
}

id objc_msgSend_contentDataObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentDataObjects");
}

id objc_msgSend_contentDataPrivate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentDataPrivate");
}

id objc_msgSend_contentDataPrivateWrapper(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentDataPrivateWrapper");
}

id objc_msgSend_contentDataTransient(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentDataTransient");
}

id objc_msgSend_contentDataTransientWrapper(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentDataTransientWrapper");
}

id objc_msgSend_contentDataWithError_identifier_journeyStartRelayValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentDataWithError:identifier:journeyStartRelayValues:");
}

id objc_msgSend_contentDataWrapper(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentDataWrapper");
}

id objc_msgSend_contentID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentID");
}

id objc_msgSend_contentId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentId");
}

id objc_msgSend_contentIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentIdentifier");
}

id objc_msgSend_contentResponses_requester_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentResponses:requester:");
}

id objc_msgSend_contentType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentType");
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentsOfDirectoryAtPath:error:");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "context");
}

id objc_msgSend_contextFingerprint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contextFingerprint");
}

id objc_msgSend_contextIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contextIdentifier");
}

id objc_msgSend_contextJSONForRequest_andPlacementType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contextJSONForRequest:andPlacementType:");
}

id objc_msgSend_contextWrapper(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contextWrapper");
}

id objc_msgSend_conversionDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversionDate");
}

id objc_msgSend_coordinators(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coordinators");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copy");
}

id objc_msgSend_copyContentDataId_toNewContentDataId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyContentDataId:toNewContentDataId:");
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_cornerRadius(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cornerRadius");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countForObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countForObject:");
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countryCode");
}

id objc_msgSend_createChildrenFromExpression_subExpressions_data_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createChildrenFromExpression:subExpressions:data:error:");
}

id objc_msgSend_createContentDataForContextId_contentId_withServerUnfilledReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createContentDataForContextId:contentId:withServerUnfilledReason:");
}

id objc_msgSend_createContentDatasFromContext_unfilledReasonCode_types_diagnosticCode_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createContentDatasFromContext:unfilledReasonCode:types:diagnosticCode:completionHandler:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createEventViewIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createEventViewIfNeeded");
}

id objc_msgSend_createFileAtPath_contents_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createFileAtPath:contents:attributes:");
}

id objc_msgSend_createForServerUnfilledReason_placementType_contextIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createForServerUnfilledReason:placementType:contextIdentifier:");
}

id objc_msgSend_createForServerUnfilledReason_placementType_contextIdentifier_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createForServerUnfilledReason:placementType:contextIdentifier:size:");
}

id objc_msgSend_createItemWithRequest_requestTimestamp_interval_jsonBody_startDate_deliveryStartDate_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createItemWithRequest:requestTimestamp:interval:jsonBody:startDate:deliveryStartDate:completionHandler:");
}

id objc_msgSend_createManagedContextWithContext_idAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createManagedContextWithContext:idAccount:");
}

id objc_msgSend_createServiceWithAMSProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createServiceWithAMSProvider:");
}

id objc_msgSend_createSharedNetworkClientWithConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createSharedNetworkClientWithConfig:");
}

id objc_msgSend_createTableLock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createTableLock");
}

id objc_msgSend_createTransaction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createTransaction");
}

id objc_msgSend_createViewLock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createViewLock");
}

id objc_msgSend_createWithTimerXPCActivity_database_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createWithTimerXPCActivity:database:");
}

id objc_msgSend_createWithTotalCostLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createWithTotalCostLimit:");
}

id objc_msgSend_createdDateForFileAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createdDateForFileAtPath:error:");
}

id objc_msgSend_creativeSizes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "creativeSizes");
}

id objc_msgSend_creativeSizesAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "creativeSizesAtIndex:");
}

id objc_msgSend_creativeSizesCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "creativeSizesCount");
}

id objc_msgSend_creativeTypeToPlacementType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "creativeTypeToPlacementType:");
}

id objc_msgSend_criteriaIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "criteriaIdentifier");
}

id objc_msgSend_criteriaValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "criteriaValues");
}

id objc_msgSend_criteriaValuesAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "criteriaValuesAtIndex:");
}

id objc_msgSend_criteriaValuesCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "criteriaValuesCount");
}

id objc_msgSend_crossAppTrackingAllowedSwitchEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crossAppTrackingAllowedSwitchEnabled");
}

id objc_msgSend_ctClient(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ctClient");
}

id objc_msgSend_ctSubscriptionContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ctSubscriptionContext");
}

id objc_msgSend_ctaButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ctaButton");
}

id objc_msgSend_current(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "current");
}

id objc_msgSend_currentBatches(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentBatches");
}

id objc_msgSend_currentConfigurationAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentConfigurationAtIndex:");
}

id objc_msgSend_currentConfigurationsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentConfigurationsCount");
}

id objc_msgSend_currentContentDataItemIdIndex(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentContentDataItemIdIndex");
}

id objc_msgSend_currentDateMinusDays_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentDateMinusDays:");
}

id objc_msgSend_currentEncryptedIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentEncryptedIDs");
}

id objc_msgSend_currentIndex(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentIndex");
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentLocale");
}

id objc_msgSend_currentSigningAuthority(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentSigningAuthority");
}

id objc_msgSend_currentStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentStatus");
}

id objc_msgSend_currentTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentTimer");
}

id objc_msgSend_daemonBundleId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "daemonBundleId");
}

id objc_msgSend_daemonStartTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "daemonStartTime");
}

id objc_msgSend_darkModeColors(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "darkModeColors");
}

id objc_msgSend_darkModeColorsAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "darkModeColorsAtIndex:");
}

id objc_msgSend_darkModeColorsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "darkModeColorsCount");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "data");
}

id objc_msgSend_dataAdapters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataAdapters");
}

id objc_msgSend_dataFetchedFromServer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataFetchedFromServer");
}

id objc_msgSend_dataIndicatorToConnectionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataIndicatorToConnectionType:");
}

id objc_msgSend_dataTaskPromiseWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataTaskPromiseWithRequest:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_dataWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithData:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_databaseFilePath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "databaseFilePath");
}

id objc_msgSend_databaseManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "databaseManager");
}

id objc_msgSend_datasource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "datasource");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "date");
}

id objc_msgSend_dateByAddingComponents_toDate_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingComponents:toDate:options:");
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_dateFormatter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateFormatter");
}

id objc_msgSend_dateFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateFromString:");
}

id objc_msgSend_dateWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSince1970:");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "day");
}

id objc_msgSend_dbManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dbManager");
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "debugDescription");
}

id objc_msgSend_decimalNumberByRoundingAccordingToBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decimalNumberByRoundingAccordingToBehavior:");
}

id objc_msgSend_decimalNumberHandlerWithRoundingMode_scale_raiseOnExactness_raiseOnOverflow_raiseOnUnderflow_raiseOnDivideByZero_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:");
}

id objc_msgSend_decimalNumberWithDecimal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decimalNumberWithDecimal:");
}

id objc_msgSend_decimalValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decimalValue");
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeBoolForKey:");
}

id objc_msgSend_decodeDictionaryWithKeysOfClass_objectsOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:");
}

id objc_msgSend_decodeDoubleForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeDoubleForKey:");
}

id objc_msgSend_decodeInt32ForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeInt32ForKey:");
}

id objc_msgSend_decodeIntForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeIntForKey:");
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeIntegerForKey:");
}

id objc_msgSend_decodeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_decodeTopLevelObjectOfClasses_forKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeTopLevelObjectOfClasses:forKey:error:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultSessionConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultSessionConfiguration");
}

id objc_msgSend_defaultTracker(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultTracker");
}

id objc_msgSend_defaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaults");
}

id objc_msgSend_delayedRequestLock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delayedRequestLock");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegate");
}

id objc_msgSend_delete(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delete");
}

id objc_msgSend_deleteAdInstancesWithNoEvents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteAdInstancesWithNoEvents");
}

id objc_msgSend_deleteCountsOlderThan_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteCountsOlderThan:");
}

id objc_msgSend_deleteEventsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteEventsPassingTest:");
}

id objc_msgSend_deleteReportsOlderThan_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteReportsOlderThan:");
}

id objc_msgSend_deliverEntireBatch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deliverEntireBatch");
}

id objc_msgSend_deliveredReport(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deliveredReport");
}

id objc_msgSend_deliveryBlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deliveryBlock");
}

id objc_msgSend_deliveryLeeway(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deliveryLeeway");
}

id objc_msgSend_deliveryReportWithType_dayOfYear_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deliveryReportWithType:dayOfYear:");
}

id objc_msgSend_deliveryReportsWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deliveryReportsWithType:");
}

id objc_msgSend_deliveryStartDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deliveryStartDate");
}

id objc_msgSend_dequeue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeue");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "description");
}

id objc_msgSend_deserializeFromData_ignoreKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deserializeFromData:ignoreKeys:");
}

id objc_msgSend_deserializeProtobufferData_ofClass_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deserializeProtobufferData:ofClass:error:");
}

id objc_msgSend_desiredPosition(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "desiredPosition");
}

id objc_msgSend_destination(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destination");
}

id objc_msgSend_destinationHash(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destinationHash");
}

id objc_msgSend_destinationsStoragePath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destinationsStoragePath");
}

id objc_msgSend_developmentApp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "developmentApp");
}

id objc_msgSend_deviceClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceClass");
}

id objc_msgSend_deviceIsAppleTV(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceIsAppleTV");
}

id objc_msgSend_deviceIsAppleWatch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceIsAppleWatch");
}

id objc_msgSend_deviceIsLocked(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceIsLocked");
}

id objc_msgSend_deviceIsMac(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceIsMac");
}

id objc_msgSend_deviceIsiPad(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceIsiPad");
}

id objc_msgSend_deviceIsiPhone(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceIsiPhone");
}

id objc_msgSend_deviceIsiPod(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceIsiPod");
}

id objc_msgSend_deviceModeAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceModeAtIndex:");
}

id objc_msgSend_deviceModel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceModel");
}

id objc_msgSend_deviceModesCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceModesCount");
}

id objc_msgSend_deviceNewsPlusSubscriberID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceNewsPlusSubscriberID");
}

id objc_msgSend_devicePlatform(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "devicePlatform");
}

id objc_msgSend_deviceTypeOverride(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceTypeOverride");
}

id objc_msgSend_dfsWithStartPath_nodeCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dfsWithStartPath:nodeCallback:");
}

id objc_msgSend_diagnosticDaemonMetricHelper(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "diagnosticDaemonMetricHelper");
}

id objc_msgSend_diagnosticsInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "diagnosticsInterval");
}

id objc_msgSend_diagnosticsIntervalValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "diagnosticsIntervalValue");
}

id objc_msgSend_diary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "diary");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryForKey:");
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryRepresentation");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_didAppTrackingStateChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didAppTrackingStateChange:");
}

id objc_msgSend_didFetchFromServer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFetchFromServer");
}

id objc_msgSend_didToroIDChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didToroIDChange:");
}

id objc_msgSend_direction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "direction");
}

id objc_msgSend_directionToGradientOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "directionToGradientOrientation:");
}

id objc_msgSend_directoryExistsAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "directoryExistsAtPath:error:");
}

id objc_msgSend_disablePlacementParam(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disablePlacementParam");
}

id objc_msgSend_disablePlacementParamValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disablePlacementParamValue");
}

id objc_msgSend_disableTelephonyMethod(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disableTelephonyMethod");
}

id objc_msgSend_disabledColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disabledColor");
}

id objc_msgSend_discardReason(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discardReason");
}

id objc_msgSend_discarded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discarded");
}

id objc_msgSend_discardedErrorWithCode_andReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discardedErrorWithCode:andReason:");
}

id objc_msgSend_discardedForBundleID_withCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discardedForBundleID:withCode:");
}

id objc_msgSend_dispatchQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dispatchQueue");
}

id objc_msgSend_dispatchSourceAccumulation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dispatchSourceAccumulation");
}

id objc_msgSend_dispatchSourceInactivity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dispatchSourceInactivity");
}

id objc_msgSend_displayOrder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayOrder");
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distantPast");
}

id objc_msgSend_distributionMetricsAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distributionMetricsAtIndex:");
}

id objc_msgSend_distributionMetricsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distributionMetricsCount");
}

id objc_msgSend_distributorID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distributorID");
}

id objc_msgSend_distributorInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distributorInfo");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "domain");
}

id objc_msgSend_doubleForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleForKey:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_downloadClickTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadClickTimestamp");
}

id objc_msgSend_downloadType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadType");
}

id objc_msgSend_downloadedApps(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadedApps");
}

id objc_msgSend_dropExpiredEventTables(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dropExpiredEventTables");
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "duration");
}

id objc_msgSend_eCServerURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eCServerURL");
}

id objc_msgSend_ecRouter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ecRouter");
}

id objc_msgSend_ecServerDictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ecServerDictionaryRepresentation");
}

id objc_msgSend_educationModeEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "educationModeEnabled");
}

id objc_msgSend_effectiveBoolValueForSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectiveBoolValueForSetting:");
}

id objc_msgSend_effectiveValueForSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectiveValueForSetting:");
}

id objc_msgSend_elementID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "elementID");
}

id objc_msgSend_elementWithToken_andBundle_andAppTrackingStatus_andToroID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "elementWithToken:andBundle:andAppTrackingStatus:andToroID:");
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "elements");
}

id objc_msgSend_elementsAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "elementsAtIndex:");
}

id objc_msgSend_elementsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "elementsCount");
}

id objc_msgSend_enableDiagnosticsWithInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableDiagnosticsWithInterval:");
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeBool:forKey:");
}

id objc_msgSend_encodeDouble_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeDouble:forKey:");
}

id objc_msgSend_encodeInt32_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInt32:forKey:");
}

id objc_msgSend_encodeInt_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInt:forKey:");
}

id objc_msgSend_encodeInteger_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInteger:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encryptedIDsForIDAccountPrivate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encryptedIDsForIDAccountPrivate:");
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endDate");
}

id objc_msgSend_endSignpostForPlacement_log_logID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endSignpostForPlacement:log:logID:");
}

id objc_msgSend_enqueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueue:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
}

id objc_msgSend_enumeratorForFilesWithExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratorForFilesWithExtension:");
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "environment");
}

id objc_msgSend_environmentToBranchDic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "environmentToBranchDic");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "error");
}

id objc_msgSend_errorAdSizeForContainerSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorAdSizeForContainerSize:");
}

id objc_msgSend_errorDetails(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorDetails");
}

id objc_msgSend_errorWithBatchParseErrors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithBatchParseErrors:");
}

id objc_msgSend_errorWithCode_internalError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithCode:internalError:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_evaluate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evaluate:");
}

id objc_msgSend_evaluate_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evaluate:error:");
}

id objc_msgSend_evaluateUsingLibrary_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evaluateUsingLibrary:error:");
}

id objc_msgSend_event(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "event");
}

id objc_msgSend_eventAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventAtIndex:");
}

id objc_msgSend_eventBody(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventBody");
}

id objc_msgSend_eventSavedWithCreatedToSavedTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventSavedWithCreatedToSavedTimeInterval:");
}

id objc_msgSend_eventSent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventSent");
}

id objc_msgSend_eventStorageListener(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventStorageListener");
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventType");
}

id objc_msgSend_eventsAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventsAtIndex:");
}

id objc_msgSend_eventsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventsCount");
}

id objc_msgSend_evictObjectFromMemoryCacheForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evictObjectFromMemoryCacheForKey:");
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_excludeTagAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "excludeTagAtIndex:");
}

id objc_msgSend_excludeTagsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "excludeTagsCount");
}

id objc_msgSend_exclusionCriteriaAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exclusionCriteriaAtIndex:");
}

id objc_msgSend_exclusionCriterias(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exclusionCriterias");
}

id objc_msgSend_exclusionCriteriasCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exclusionCriteriasCount");
}

id objc_msgSend_execute(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "execute");
}

id objc_msgSend_executeBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeBlock:");
}

id objc_msgSend_executeInsertQuery_withParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeInsertQuery:withParameters:");
}

id objc_msgSend_executeQuery_withParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeQuery:withParameters:");
}

id objc_msgSend_executeQueryFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeQueryFromString:");
}

id objc_msgSend_executeSelectNumberQuery_withParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeSelectNumberQuery:withParameters:");
}

id objc_msgSend_executeSelectQuery_forTable_withParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeSelectQuery:forTable:withParameters:");
}

id objc_msgSend_executeSelectQuery_forTable_withParameters_groupedByColumn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeSelectQuery:forTable:withParameters:groupedByColumn:");
}

id objc_msgSend_executeSelectStringsQuery_withParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeSelectStringsQuery:withParameters:");
}

id objc_msgSend_expirationDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "expirationDate");
}

id objc_msgSend_expirationOfData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "expirationOfData");
}

id objc_msgSend_expression(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "expression");
}

id objc_msgSend_expressionDict(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "expressionDict");
}

id objc_msgSend_expressionToEvaluate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "expressionToEvaluate");
}

id objc_msgSend_expressions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "expressions");
}

id objc_msgSend_extension(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extension");
}

id objc_msgSend_failedRequests(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failedRequests");
}

id objc_msgSend_failingURLsAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failingURLsAtIndex:");
}

id objc_msgSend_failingURLsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failingURLsCount");
}

id objc_msgSend_fairPlaySAPExchange_certificateIsCached_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fairPlaySAPExchange:certificateIsCached:");
}

id objc_msgSend_fakeNetworkResponse(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fakeNetworkResponse");
}

id objc_msgSend_fetchGenderAndAgeData_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchGenderAndAgeData:completionHandler:");
}

id objc_msgSend_fileExists_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExists:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:error:");
}

id objc_msgSend_fileForAppendingAtKeyPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileForAppendingAtKeyPath:error:");
}

id objc_msgSend_fileForReadingAtKeyPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileForReadingAtKeyPath:error:");
}

id objc_msgSend_fileForWritingAtKeyPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileForWritingAtKeyPath:error:");
}

id objc_msgSend_fileManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileManager");
}

id objc_msgSend_fileName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileName");
}

id objc_msgSend_fileNameForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileNameForIdentifier:");
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileSize");
}

id objc_msgSend_fileStorage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileStorage");
}

id objc_msgSend_fileSystemToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileSystemToken");
}

id objc_msgSend_fileToFilePath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileToFilePath:error:");
}

id objc_msgSend_fileURLForCondition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLForCondition:");
}

id objc_msgSend_fileURLWithFileSystemRepresentation_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileURLWithPathComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPathComponents:");
}

id objc_msgSend_files(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "files");
}

id objc_msgSend_filesCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filesCount");
}

id objc_msgSend_filesEnumerator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filesEnumerator");
}

id objc_msgSend_filterUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterUsingPredicate:");
}

id objc_msgSend_filteredArrayUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredArrayUsingBlock:");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_finalize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finalize");
}

id objc_msgSend_find_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "find:");
}

id objc_msgSend_findBucketForCode_type_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findBucketForCode:type:");
}

id objc_msgSend_findBucketForDaemonRunningTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findBucketForDaemonRunningTime:");
}

id objc_msgSend_findById_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findById:");
}

id objc_msgSend_findCacheableObjectForId_inPersistentStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findCacheableObjectForId:inPersistentStore:");
}

id objc_msgSend_findInternalContentDataById_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findInternalContentDataById:");
}

id objc_msgSend_findManagedContextByFingerprint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findManagedContextByFingerprint:");
}

id objc_msgSend_findQualifiedPlacementFromCachedData_forRequests_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findQualifiedPlacementFromCachedData:forRequests:");
}

id objc_msgSend_findValidObjectsInContentDataItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findValidObjectsInContentDataItems:");
}

id objc_msgSend_fingerprint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fingerprint");
}

id objc_msgSend_finished(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finished");
}

id objc_msgSend_finishedWithRequests(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishedWithRequests");
}

id objc_msgSend_firstMatchInString_options_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstMatchInString:options:range:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstObject");
}

id objc_msgSend_firstRunSinceReboot(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstRunSinceReboot");
}

id objc_msgSend_fixupFormattedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fixupFormattedText:");
}

id objc_msgSend_flattenPolicy_policyType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flattenPolicy:policyType:");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "floatValue");
}

id objc_msgSend_forceReconcile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "forceReconcile:");
}

id objc_msgSend_formattedText(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formattedText");
}

id objc_msgSend_foundArtists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "foundArtists");
}

id objc_msgSend_foundBundleIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "foundBundleIDs");
}

id objc_msgSend_foundGenres(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "foundGenres");
}

id objc_msgSend_fpdiSignature(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fpdiSignature");
}

id objc_msgSend_functionNamesAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "functionNamesAtIndex:");
}

id objc_msgSend_functionNamesCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "functionNamesCount");
}

id objc_msgSend_garbageCollect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "garbageCollect");
}

id objc_msgSend_garbageCollector(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "garbageCollector");
}

id objc_msgSend_gcSchedulerQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gcSchedulerQueue");
}

id objc_msgSend_generatePolicyDataObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generatePolicyDataObjects:");
}

id objc_msgSend_genre(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "genre");
}

id objc_msgSend_geofencesAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "geofencesAtIndex:");
}

id objc_msgSend_geofencesCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "geofencesCount");
}

id objc_msgSend_getBytes_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBytes:range:");
}

id objc_msgSend_getDataStatus_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDataStatus:error:");
}

id objc_msgSend_getPreferredDataSubscriptionContextSync_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getPreferredDataSubscriptionContextSync:");
}

id objc_msgSend_getRepresentation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getRepresentation");
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_getSignalStrengthInfo_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSignalStrengthInfo:error:");
}

id objc_msgSend_getStorageInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getStorageInfo");
}

id objc_msgSend_getStorageSize_allocatedSize_files_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getStorageSize:allocatedSize:files:");
}

id objc_msgSend_getTableForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getTableForClass:");
}

id objc_msgSend_getToken_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getToken:error:");
}

id objc_msgSend_gregorianCalendar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gregorianCalendar");
}

id objc_msgSend_groupedEventCountForDayOfYear_purpose_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupedEventCountForDayOfYear:purpose:");
}

id objc_msgSend_handle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handle");
}

id objc_msgSend_handleArticleLoadFailure_internalContent_context_idAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleArticleLoadFailure:internalContent:context:idAccount:");
}

id objc_msgSend_handleClientDiscarded_internalContent_context_idAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleClientDiscarded:internalContent:context:idAccount:");
}

id objc_msgSend_handleDaemonRequestFailed_internalContent_context_idAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDaemonRequestFailed:internalContent:context:idAccount:");
}

id objc_msgSend_handleExpandedPlaceholderWithUnfilledReason_metric_internalContent_context_idAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleExpandedPlaceholderWithUnfilledReason:metric:internalContent:context:idAccount:");
}

id objc_msgSend_handleInterfaceExceededContainer_internalContent_context_idAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleInterfaceExceededContainer:internalContent:context:idAccount:");
}

id objc_msgSend_handleInterfaceInteracted_internalContent_context_clientInfo_idAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleInterfaceInteracted:internalContent:context:clientInfo:idAccount:");
}

id objc_msgSend_handleInterfaceOffScreen_internalContent_context_clientInfo_idAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleInterfaceOffScreen:internalContent:context:clientInfo:idAccount:");
}

id objc_msgSend_handleInterfaceOnScreen_internalContent_context_idAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleInterfaceOnScreen:internalContent:context:idAccount:");
}

id objc_msgSend_handleInterfaceReady_internalContent_context_clientInfo_idAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleInterfaceReady:internalContent:context:clientInfo:idAccount:");
}

id objc_msgSend_handleInterfaceReplaced_metricEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleInterfaceReplaced:metricEnvironment:");
}

id objc_msgSend_handleInterfaceVisible_internalContent_context_clientInfo_idAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleInterfaceVisible:internalContent:context:clientInfo:idAccount:");
}

id objc_msgSend_handleInterstitialOnScreen_internalContent_context_idAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleInterstitialOnScreen:internalContent:context:idAccount:");
}

id objc_msgSend_handleLoadFailed_internalContent_context_idAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleLoadFailed:internalContent:context:idAccount:");
}

id objc_msgSend_handleMediaComplete_internalContent_context_clientInfo_idAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleMediaComplete:internalContent:context:clientInfo:idAccount:");
}

id objc_msgSend_handleMetricResponse_error_forRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleMetricResponse:error:forRequest:");
}

id objc_msgSend_handleNewPromotedContent_adsReceived_adsRequested_token_context_lastInBatch_deliverEntireBatch_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleNewPromotedContent:adsReceived:adsRequested:token:context:lastInBatch:deliverEntireBatch:completionHandler:");
}

id objc_msgSend_handlePrivacyAdMetric_internalContent_context_clientInfo_idAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePrivacyAdMetric:internalContent:context:clientInfo:idAccount:");
}

id objc_msgSend_handleQuickReturn_internalContent_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleQuickReturn:internalContent:context:");
}

id objc_msgSend_handleSubscription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleSubscription:");
}

id objc_msgSend_handleValidationFailed_internalContent_context_idAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleValidationFailed:internalContent:context:idAccount:");
}

id objc_msgSend_handleVideoMetric_internalContent_context_clientInfo_idAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleVideoMetric:internalContent:context:clientInfo:idAccount:");
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handler");
}

id objc_msgSend_hasAccessibilityDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasAccessibilityDescription");
}

id objc_msgSend_hasAdDataResponseIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasAdDataResponseIdentifier");
}

id objc_msgSend_hasAdFormatType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasAdFormatType");
}

id objc_msgSend_hasAdFrequencyCapData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasAdFrequencyCapData");
}

id objc_msgSend_hasAdPrivacyMarkPosition(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasAdPrivacyMarkPosition");
}

id objc_msgSend_hasAdTagContentString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasAdTagContentString");
}

id objc_msgSend_hasAdType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasAdType");
}

id objc_msgSend_hasAnonymousDemandiAdID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasAnonymousDemandiAdID");
}

id objc_msgSend_hasAppStoreViewTemplate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasAppStoreViewTemplate");
}

id objc_msgSend_hasBacklogForChannel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasBacklogForChannel:");
}

id objc_msgSend_hasBannerImpressionThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasBannerImpressionThreshold");
}

id objc_msgSend_hasBeenOnScreen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasBeenOnScreen");
}

id objc_msgSend_hasConfirmed50PercentImpression(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasConfirmed50PercentImpression");
}

id objc_msgSend_hasConfirmedClick(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasConfirmedClick");
}

id objc_msgSend_hasConfirmedImpression(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasConfirmedImpression");
}

id objc_msgSend_hasContentiAdID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasContentiAdID");
}

id objc_msgSend_hasDesiredPosition(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasDesiredPosition");
}

id objc_msgSend_hasDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasDuration");
}

id objc_msgSend_hasElementID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasElementID");
}

id objc_msgSend_hasEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasEntitlement:");
}

id objc_msgSend_hasError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasError");
}

id objc_msgSend_hasExpirationDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasExpirationDate");
}

id objc_msgSend_hasExpressionToEvaluate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasExpressionToEvaluate");
}

id objc_msgSend_hasHumanReadableName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasHumanReadableName");
}

id objc_msgSend_hasIAdID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasIAdID");
}

id objc_msgSend_hasImpressionIdentifierData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasImpressionIdentifierData");
}

id objc_msgSend_hasInstallAttribution(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasInstallAttribution");
}

id objc_msgSend_hasKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasKey");
}

id objc_msgSend_hasMediaFiles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasMediaFiles");
}

id objc_msgSend_hasMinimumIntervalBetweenPresentations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasMinimumIntervalBetweenPresentations");
}

id objc_msgSend_hasObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasObjectForKey:");
}

id objc_msgSend_hasOdml(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasOdml");
}

id objc_msgSend_hasPolicyData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPolicyData");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasReadEntitlement(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasReadEntitlement");
}

id objc_msgSend_hasRunningLandingPageRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasRunningLandingPageRequest");
}

id objc_msgSend_hasSentStatusEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSentStatusEvent:");
}

id objc_msgSend_hasSpecification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSpecification");
}

id objc_msgSend_hasTargetingDimensions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasTargetingDimensions");
}

id objc_msgSend_hasTransparencyDetails(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasTransparencyDetails");
}

id objc_msgSend_hasTransparencyRendererURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasTransparencyRendererURL");
}

id objc_msgSend_hasType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasType");
}

id objc_msgSend_hasUnfilledReasonCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasUnfilledReasonCode");
}

id objc_msgSend_hasUniqueIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasUniqueIdentifier");
}

id objc_msgSend_hasValueBool(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasValueBool");
}

id objc_msgSend_hasValueDouble(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasValueDouble");
}

id objc_msgSend_hasValueInt(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasValueInt");
}

id objc_msgSend_hasValueString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasValueString");
}

id objc_msgSend_hasWriteEntitlement(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasWriteEntitlement");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hash");
}

id objc_msgSend_header(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "header");
}

id objc_msgSend_headerContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "headerContext");
}

id objc_msgSend_headerName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "headerName");
}

id objc_msgSend_headerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "headerValue");
}

id objc_msgSend_headers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "headers");
}

id objc_msgSend_headline(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "headline");
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "height");
}

id objc_msgSend_highlightedColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "highlightedColor");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "host");
}

id objc_msgSend_httpDelivery(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "httpDelivery");
}

id objc_msgSend_httpDeliveryClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "httpDeliveryClass");
}

id objc_msgSend_httpLookBackWindow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "httpLookBackWindow");
}

id objc_msgSend_httpLookBackWindowDefaultValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "httpLookBackWindowDefaultValue");
}

id objc_msgSend_httpLookBackWindowValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "httpLookBackWindowValue");
}

id objc_msgSend_httpLookBackWindowWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "httpLookBackWindowWithCompletionHandler:");
}

id objc_msgSend_httpMaximumConnectionsPerHost(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "httpMaximumConnectionsPerHost");
}

id objc_msgSend_httpMaximumConnectionsPerHostDefaultValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "httpMaximumConnectionsPerHostDefaultValue");
}

id objc_msgSend_httpMaximumConnectionsPerHostTempSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "httpMaximumConnectionsPerHostTempSession");
}

id objc_msgSend_httpMaximumConnectionsPerHostTempSessionDefaultValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "httpMaximumConnectionsPerHostTempSessionDefaultValue");
}

id objc_msgSend_httpMaximumConnectionsPerHostTempSessionValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "httpMaximumConnectionsPerHostTempSessionValue");
}

id objc_msgSend_httpMaximumConnectionsPerHostTempSessionWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "httpMaximumConnectionsPerHostTempSessionWithCompletionHandler:");
}

id objc_msgSend_httpMaximumConnectionsPerHostValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "httpMaximumConnectionsPerHostValue");
}

id objc_msgSend_httpMaximumConnectionsPerHostWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "httpMaximumConnectionsPerHostWithCompletionHandler:");
}

id objc_msgSend_httpUseFixedHttpSessionManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "httpUseFixedHttpSessionManager");
}

id objc_msgSend_httpUseFixedHttpSessionManagerDefaultValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "httpUseFixedHttpSessionManagerDefaultValue");
}

id objc_msgSend_httpUseFixedHttpSessionManagerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "httpUseFixedHttpSessionManagerValue");
}

id objc_msgSend_httpUseFixedHttpSessionManagerWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "httpUseFixedHttpSessionManagerWithCompletionHandler:");
}

id objc_msgSend_humanReadableName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "humanReadableName");
}

id objc_msgSend_iAdAttribution(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iAdAttribution");
}

id objc_msgSend_iAdConversionDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iAdConversionDate");
}

id objc_msgSend_iAdConversionTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iAdConversionTimestamp");
}

id objc_msgSend_iAdID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iAdID");
}

id objc_msgSend_iAdImpressionDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iAdImpressionDate");
}

id objc_msgSend_iAdImpressionTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iAdImpressionTimestamp");
}

id objc_msgSend_iTunesDSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iTunesDSID");
}

id objc_msgSend_iTunesMetadata(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iTunesMetadata");
}

id objc_msgSend_iTunesMetadataAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iTunesMetadataAtIndex:");
}

id objc_msgSend_iTunesMetadatas(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iTunesMetadatas");
}

id objc_msgSend_iTunesMetadatasCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iTunesMetadatasCount");
}

id objc_msgSend_idAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idAccount");
}

id objc_msgSend_idAccounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idAccounts");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifier");
}

id objc_msgSend_idsAsString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsAsString");
}

id objc_msgSend_ignoreBagKeyCheck(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ignoreBagKeyCheck");
}

id objc_msgSend_ignoreBagKeyCheckValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ignoreBagKeyCheckValue");
}

id objc_msgSend_ignoreKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ignoreKeys");
}

id objc_msgSend_impressionCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "impressionCount");
}

id objc_msgSend_impressionDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "impressionDate");
}

id objc_msgSend_impressionEventsForHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "impressionEventsForHandle:");
}

id objc_msgSend_impressionID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "impressionID");
}

id objc_msgSend_impressionIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "impressionIdentifier");
}

id objc_msgSend_impressionIdentifierData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "impressionIdentifierData");
}

id objc_msgSend_impressionSequenceNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "impressionSequenceNumber");
}

id objc_msgSend_impressionThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "impressionThreshold");
}

id objc_msgSend_impressionsRemaining(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "impressionsRemaining");
}

id objc_msgSend_inactivityTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inactivityTime");
}

id objc_msgSend_inclusionCriteriaAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inclusionCriteriaAtIndex:");
}

id objc_msgSend_inclusionCriterias(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inclusionCriterias");
}

id objc_msgSend_inclusionCriteriasCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inclusionCriteriasCount");
}

id objc_msgSend_incrementVideoEventSequence(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "incrementVideoEventSequence");
}

id objc_msgSend_incrementalVacuumIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "incrementalVacuumIfNeeded");
}

id objc_msgSend_indexContainingDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexContainingDuration:");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indicator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indicator");
}

id objc_msgSend_infoAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "infoAtIndex:");
}

id objc_msgSend_infosCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "infosCount");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "init");
}

id objc_msgSend_initForReadingFromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForReadingFromData:error:");
}

id objc_msgSend_initFromServerRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initFromServerRequest:");
}

id objc_msgSend_initHandle_bundleId_adamId_adMetadata_properties_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initHandle:bundleId:adamId:adMetadata:properties:table:");
}

id objc_msgSend_initHandle_campaign_adGroup_ad_creative_bundleId_searchTermId_adamId_adType_adFormatType_containerType_relay_adMetadata_properties_brand_advertiserCategory_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initHandle:campaign:adGroup:ad:creative:bundleId:searchTermId:adamId:adType:adFormatType:containerType:relay:adMetadata:properties:brand:advertiserCategory:table:");
}

id objc_msgSend_initHandle_timestamp_event_impression_insertOrder_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initHandle:timestamp:event:impression:insertOrder:table:");
}

id objc_msgSend_initHandle_timestamp_purpose_event_source_unknownSource_handleSet_eventOrder_trace_branch_environment_impression_properties_internalProperties_insertOrder_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initHandle:timestamp:purpose:event:source:unknownSource:handleSet:eventOrder:trace:branch:environment:impression:properties:internalProperties:insertOrder:table:");
}

id objc_msgSend_initInPersistentStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initInPersistentStore:");
}

id objc_msgSend_initRateLimitedForContextId_containerSize_placementType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initRateLimitedForContextId:containerSize:placementType:");
}

id objc_msgSend_initType_dayOfYear_frequency_reportDate_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initType:dayOfYear:frequency:reportDate:table:");
}

id objc_msgSend_initWith_andToken_andAppTrackingStatus_andToroID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWith:andToken:andAppTrackingStatus:andToroID:");
}

id objc_msgSend_initWithAMSProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAMSProvider:");
}

id objc_msgSend_initWithAccumulationTime_inactivityTime_itemLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccumulationTime:inactivityTime:itemLimit:");
}

id objc_msgSend_initWithAdData_forPlacementType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAdData:forPlacementType:");
}

id objc_msgSend_initWithAdData_identifier_contextIdentifier_placementType_maxSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAdData:identifier:contextIdentifier:placementType:maxSize:");
}

id objc_msgSend_initWithAdData_placementType_maxSize_mediaAsset_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAdData:placementType:maxSize:mediaAsset:error:");
}

id objc_msgSend_initWithAdData_placementType_maxSize_nativeLayout_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAdData:placementType:maxSize:nativeLayout:error:");
}

id objc_msgSend_initWithAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAsset:");
}

id objc_msgSend_initWithAssetInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAssetInfo:");
}

id objc_msgSend_initWithBase64EncodedString_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBase64EncodedString:options:");
}

id objc_msgSend_initWithBatch_bundleID_requestIdentifier_clientInfo_idAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBatch:bundleID:requestIdentifier:clientInfo:idAccount:");
}

id objc_msgSend_initWithBatchPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBatchPath:");
}

id objc_msgSend_initWithBorderStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBorderStyle:");
}

id objc_msgSend_initWithBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleID:");
}

id objc_msgSend_initWithBundleID_connection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleID:connection:");
}

id objc_msgSend_initWithBundleID_idAccount_contentId_contextId_adDataResponseIdentifier_batchId_impressionIdentifierData_timeSpent_databaseManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleID:idAccount:contentId:contextId:adDataResponseIdentifier:batchId:impressionIdentifierData:timeSpent:databaseManager:");
}

id objc_msgSend_initWithBundleID_identifier_clientInfo_idAccount_accumulateRequests_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleID:identifier:clientInfo:idAccount:accumulateRequests:");
}

id objc_msgSend_initWithBundleID_identifier_segmentIdentifiers_replaceExisting_privateSegment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleID:identifier:segmentIdentifiers:replaceExisting:privateSegment:");
}

id objc_msgSend_initWithBundleID_requestIdentifier_contextIdentifier_contentIdentifier_idAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleID:requestIdentifier:contextIdentifier:contentIdentifier:idAccount:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithButton:");
}

id objc_msgSend_initWithButtonStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithButtonStyle:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCString:encoding:");
}

id objc_msgSend_initWithCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCache:");
}

id objc_msgSend_initWithCacheSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCacheSize:");
}

id objc_msgSend_initWithCacheStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCacheStore:");
}

id objc_msgSend_initWithCacheStore_expirationDate_timeSincePrevLaunch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCacheStore:expirationDate:timeSincePrevLaunch:");
}

id objc_msgSend_initWithCacheStore_key_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCacheStore:key:");
}

id objc_msgSend_initWithCacheStore_key_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCacheStore:key:object:");
}

id objc_msgSend_initWithCacheStore_key_timestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCacheStore:key:timestamp:");
}

id objc_msgSend_initWithCachedToken_detailed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCachedToken:detailed:");
}

id objc_msgSend_initWithCalendarIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCalendarIdentifier:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithClientIdentifier_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClientIdentifier:bag:");
}

id objc_msgSend_initWithClock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClock:");
}

id objc_msgSend_initWithColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithColor:");
}

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:");
}

id objc_msgSend_initWithConfigurationStorage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfigurationStorage:");
}

id objc_msgSend_initWithConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConnection:");
}

id objc_msgSend_initWithContent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContent:");
}

id objc_msgSend_initWithContent_privateContent_andTransientContent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContent:privateContent:andTransientContent:");
}

id objc_msgSend_initWithContentData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentData:");
}

id objc_msgSend_initWithContentDataProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentDataProvider:");
}

id objc_msgSend_initWithContext_bundleID_identifier_placement_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContext:bundleID:identifier:placement:completionHandler:");
}

id objc_msgSend_initWithContext_contentIdentifier_placementType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContext:contentIdentifier:placementType:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDatabase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDatabase:");
}

id objc_msgSend_initWithDatasource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDatasource:");
}

id objc_msgSend_initWithDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDate:");
}

id objc_msgSend_initWithDbManager_retryManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDbManager:retryManager:");
}

id objc_msgSend_initWithDefaultValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDefaultValues:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithDestination_purpose_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDestination:purpose:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDomain:code:userInfo:");
}

id objc_msgSend_initWithElement_elementIndex_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithElement:elementIndex:error:");
}

id objc_msgSend_initWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithError:");
}

id objc_msgSend_initWithExpression_version_andParent_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExpression:version:andParent:error:");
}

id objc_msgSend_initWithFileManager_startDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFileManager:startDirectory:");
}

id objc_msgSend_initWithFileStorage_memoryCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFileStorage:memoryCache:");
}

id objc_msgSend_initWithFilesEnumerator_expirationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFilesEnumerator:expirationDate:");
}

id objc_msgSend_initWithHost_port_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHost:port:");
}

id objc_msgSend_initWithHttpHeaders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHttpHeaders:");
}

id objc_msgSend_initWithID_ofType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithID:ofType:");
}

id objc_msgSend_initWithIDAccountPrivate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIDAccountPrivate:");
}

id objc_msgSend_initWithIDAccountsRecord_storefront_monthlyIDResetCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIDAccountsRecord:storefront:monthlyIDResetCount:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithIdentifier_inPersistentStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:inPersistentStore:");
}

id objc_msgSend_initWithIdentifier_maxSize_requestedAdIdentifier_currentContent_adjacentContent_supplementalContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:maxSize:requestedAdIdentifier:currentContent:adjacentContent:supplementalContext:");
}

id objc_msgSend_initWithInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInterval:");
}

id objc_msgSend_initWithKey_payload_token_signature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:payload:token:signature:");
}

id objc_msgSend_initWithLegacyInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLegacyInterface:");
}

id objc_msgSend_initWithLocalizedStringEntry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLocalizedStringEntry:");
}

id objc_msgSend_initWithMachServiceName_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:options:");
}

id objc_msgSend_initWithManagedContext_contentData_transaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithManagedContext:contentData:transaction:");
}

id objc_msgSend_initWithManagedContext_contentDataItemIds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithManagedContext:contentDataItemIds:");
}

id objc_msgSend_initWithMetric_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMetric:bundleID:");
}

id objc_msgSend_initWithMetric_internalContent_andContext_clientInfo_idAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMetric:internalContent:andContext:clientInfo:idAccount:");
}

id objc_msgSend_initWithMetric_internalContent_andContext_idAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMetric:internalContent:andContext:idAccount:");
}

id objc_msgSend_initWithMetric_internalContent_context_idAccount_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMetric:internalContent:context:idAccount:error:");
}

id objc_msgSend_initWithName_forColumnType_withValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:forColumnType:withValue:");
}

id objc_msgSend_initWithName_poolSize_numberToStash_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:poolSize:numberToStash:");
}

id objc_msgSend_initWithName_poolSize_numberToStash_setupCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:poolSize:numberToStash:setupCompletion:");
}

id objc_msgSend_initWithNotificationRegister_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNotificationRegister:");
}

id objc_msgSend_initWithObject_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObject:identifier:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjectsAndKeys:");
}

id objc_msgSend_initWithObjectsIterator_fileManager_extension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjectsIterator:fileManager:extension:");
}

id objc_msgSend_initWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOptions:");
}

id objc_msgSend_initWithOptions_capacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOptions:capacity:");
}

id objc_msgSend_initWithParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithParams:");
}

id objc_msgSend_initWithParent_identifier_dataSource_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithParent:identifier:dataSource:error:");
}

id objc_msgSend_initWithParent_identifier_expressionOrReference_subExpressions_data_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithParent:identifier:expressionOrReference:subExpressions:data:error:");
}

id objc_msgSend_initWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPath:");
}

id objc_msgSend_initWithPathPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPathPrefix:");
}

id objc_msgSend_initWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPattern:options:error:");
}

id objc_msgSend_initWithPolicyType_policyValue_isXLFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPolicyType:policyValue:isXLFormat:");
}

id objc_msgSend_initWithPoolName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPoolName:");
}

id objc_msgSend_initWithPurpose_metric_contentIdentifier_contextIdentifier_handle_branch_properties_internalProperties_relayData_environment_order_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPurpose:metric:contentIdentifier:contextIdentifier:handle:branch:properties:internalProperties:relayData:environment:order:options:");
}

id objc_msgSend_initWithPurposeDefinition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPurposeDefinition:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithRGBA_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRGBA:");
}

id objc_msgSend_initWithReportDatasource_deliveredReport_currentDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithReportDatasource:deliveredReport:currentDate:");
}

id objc_msgSend_initWithReportDate_purpose_reportEventCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithReportDate:purpose:reportEventCount:");
}

id objc_msgSend_initWithResponse_forRequester_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithResponse:forRequester:");
}

id objc_msgSend_initWithResponse_forRequester_contentIdentifier_withContext_placement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithResponse:forRequester:contentIdentifier:withContext:placement:");
}

id objc_msgSend_initWithRetryManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRetryManager:");
}

id objc_msgSend_initWithRetryManager_databaseManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRetryManager:databaseManager:");
}

id objc_msgSend_initWithRoutingType_preferencesStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRoutingType:preferencesStore:");
}

id objc_msgSend_initWithSchedule_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSchedule:name:");
}

id objc_msgSend_initWithSecureFileManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSecureFileManager:");
}

id objc_msgSend_initWithShadowStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithShadowStyle:");
}

id objc_msgSend_initWithSigningPercentageFPDIValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSigningPercentageFPDIValue:");
}

id objc_msgSend_initWithStartDate_duration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStartDate:duration:");
}

id objc_msgSend_initWithStartDate_endDate_maxEvents_lastN_reversed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStartDate:endDate:maxEvents:lastN:reversed:");
}

id objc_msgSend_initWithStorage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStorage:");
}

id objc_msgSend_initWithStorage_andSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStorage:andSize:");
}

id objc_msgSend_initWithStorefront_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStorefront:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStyle:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithToken_source_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithToken:source:");
}

id objc_msgSend_initWithTokenService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTokenService:");
}

id objc_msgSend_initWithTokenService_bag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTokenService:bag:");
}

id objc_msgSend_initWithTokens_legacyInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTokens:legacyInterface:");
}

id objc_msgSend_initWithTotalCostLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTotalCostLimit:");
}

id objc_msgSend_initWithTransmitter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTransmitter:");
}

id objc_msgSend_initWithType_value_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:value:identifier:");
}

id objc_msgSend_initWithURL_HTTPMethod_HTTPHeaders_HTTPBody_serviceName_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:HTTPMethod:HTTPHeaders:HTTPBody:serviceName:completionHandler:");
}

id objc_msgSend_initWithURL_bundleID_header_body_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:bundleID:header:body:");
}

id objc_msgSend_initWithURL_headers_defaultValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:headers:defaultValues:");
}

id objc_msgSend_initWithURL_statusCode_HTTPVersion_headerFields_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:statusCode:HTTPVersion:headerFields:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithUnfilledReason_error_contentIdentifier_contextIdentifier_containerSize_placementType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUnfilledReason:error:contentIdentifier:contextIdentifier:containerSize:placementType:");
}

id objc_msgSend_initWithUnfilledReason_error_contentIdentifier_contextIdentifier_containerSize_placementType_journeyStartRelayValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUnfilledReason:error:contentIdentifier:contextIdentifier:containerSize:placementType:journeyStartRelayValues:");
}

id objc_msgSend_initialize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initialize");
}

id objc_msgSend_initializeFairPlay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initializeFairPlay");
}

id objc_msgSend_initializeMescalProvider_interval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initializeMescalProvider:interval:");
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inputs");
}

id objc_msgSend_insertAdInstanceWithHandle_bundleId_adamId_adMetadata_properties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertAdInstanceWithHandle:bundleId:adamId:adMetadata:properties:");
}

id objc_msgSend_insertEvent_handle_impression_timestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertEvent:handle:impression:timestamp:");
}

id objc_msgSend_insertOrUpdateAdInstanceWithHandle_campaign_adGroup_ad_creative_bundleId_searchTermId_adamId_adType_adFormatType_containerType_relay_adMetadata_properties_brand_advertiserCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertOrUpdateAdInstanceWithHandle:campaign:adGroup:ad:creative:bundleId:searchTermId:adamId:adType:adFormatType:containerType:relay:adMetadata:properties:brand:advertiserCategory:");
}

id objc_msgSend_insertOrUpdateIgnoringNilColumns(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertOrUpdateIgnoringNilColumns");
}

id objc_msgSend_insertOrder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertOrder");
}

id objc_msgSend_insertReceivedEventWithHandle_bundleId_adamId_adMetadata_adProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertReceivedEventWithHandle:bundleId:adamId:adMetadata:adProperties:");
}

id objc_msgSend_installAttribution(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "installAttribution");
}

id objc_msgSend_installedAsTestApp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "installedAsTestApp");
}

id objc_msgSend_installedByAppStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "installedByAppStore");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerForKey:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerValue");
}

id objc_msgSend_integrityReportEventListener(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integrityReportEventListener");
}

id objc_msgSend_interactedEventsForHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interactedEventsForHandle:");
}

id objc_msgSend_interfaceIdiom(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceIdiom");
}

id objc_msgSend_interfaceReady(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceReady");
}

id objc_msgSend_interfaceReplaced(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceReplaced");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_internalContent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "internalContent");
}

id objc_msgSend_internalErrors(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "internalErrors");
}

id objc_msgSend_internalProperties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "internalProperties");
}

id objc_msgSend_intersectsSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intersectsSet:");
}

id objc_msgSend_intervalId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intervalId");
}

id objc_msgSend_invalidRequestErrorWithCode_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidRequestErrorWithCode:reason:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invoke(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invoke");
}

id objc_msgSend_invokeHandlerForMessage_payload_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invokeHandlerForMessage:payload:completionHandler:");
}

id objc_msgSend_isAdResponseMockedForPlacementType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAdResponseMockedForPlacementType:");
}

id objc_msgSend_isAdolescent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAdolescent");
}

id objc_msgSend_isAdult(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAdult");
}

id objc_msgSend_isAllowedEmptyResponse(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAllowedEmptyResponse");
}

id objc_msgSend_isAppTrackingAuthorizedByUser_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAppTrackingAuthorizedByUser:");
}

id objc_msgSend_isAppleInternalInstall(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAppleInternalInstall");
}

id objc_msgSend_isAtEnd(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAtEnd");
}

id objc_msgSend_isAttributed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAttributed");
}

id objc_msgSend_isAvailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAvailable");
}

id objc_msgSend_isBefore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBefore:");
}

id objc_msgSend_isBlockedForNewsSubscriber_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBlockedForNewsSubscriber:bundleID:");
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCancelled");
}

id objc_msgSend_isCapableOfAction_capabilities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCapableOfAction:capabilities:");
}

id objc_msgSend_isCarouselAd(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCarouselAd");
}

id objc_msgSend_isChild(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isChild");
}

id objc_msgSend_isClientRenderedAd(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isClientRenderedAd");
}

id objc_msgSend_isDNUEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDNUEnabled");
}

id objc_msgSend_isEarlierThan_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEarlierThan:");
}

id objc_msgSend_isEmpty(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEmpty");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDestination:");
}

id objc_msgSend_isEqualToEventChannel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToEventChannel:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isEventDatabaseStorageEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEventDatabaseStorageEnabled");
}

id objc_msgSend_isExpired(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isExpired");
}

id objc_msgSend_isFinalMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFinalMessage:");
}

id objc_msgSend_isFirstMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFirstMessage:");
}

id objc_msgSend_isLocationAvailableForAd(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLocationAvailableForAd");
}

id objc_msgSend_isManagedAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isManagedAccount");
}

id objc_msgSend_isMasterObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMasterObject");
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMemberOfClass:");
}

id objc_msgSend_isNativeAd(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNativeAd");
}

id objc_msgSend_isNewObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNewObject");
}

id objc_msgSend_isNoServicesRegion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNoServicesRegion");
}

id objc_msgSend_isObjectAliveForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isObjectAliveForKey:");
}

id objc_msgSend_isOnDeviceAppInstallationAllowed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isOnDeviceAppInstallationAllowed");
}

id objc_msgSend_isOutstreamVideo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isOutstreamVideo");
}

id objc_msgSend_isPlaceholder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPlaceholder");
}

id objc_msgSend_isPlaceholderIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPlaceholderIdentifier:");
}

id objc_msgSend_isPrerollVideo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPrerollVideo");
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRunning");
}

id objc_msgSend_isRunningTests(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRunningTests");
}

id objc_msgSend_isSampleRateExpired_purpose_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSampleRateExpired:purpose:");
}

id objc_msgSend_isSearchLandingAdsEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSearchLandingAdsEnabled");
}

id objc_msgSend_isSharedIPad(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSharedIPad");
}

id objc_msgSend_isSponsorshipAd(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSponsorshipAd");
}

id objc_msgSend_isStatusConditionRegistered_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isStatusConditionRegistered:error:");
}

id objc_msgSend_isStorefrontAdPlatformsEnabledForBag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isStorefrontAdPlatformsEnabledForBag:");
}

id objc_msgSend_isSubclassOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSubclassOfClass:");
}

id objc_msgSend_isSubscriber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSubscriber");
}

id objc_msgSend_isSubsetOfSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSubsetOfSet:");
}

id objc_msgSend_isTest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTest");
}

id objc_msgSend_isTokenUsed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTokenUsed:");
}

id objc_msgSend_isTokenUsedByOtherBundle_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTokenUsedByOtherBundle:bundleID:");
}

id objc_msgSend_isValidCheckWithToroID_andTrackingStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidCheckWithToroID:andTrackingStatus:");
}

id objc_msgSend_isValidJSONObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidJSONObject:");
}

id objc_msgSend_isValidPolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidPolicy:");
}

id objc_msgSend_isVideo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isVideo");
}

id objc_msgSend_isViewableImpression(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isViewableImpression");
}

id objc_msgSend_isWaitingForBackoff(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isWaitingForBackoff");
}

id objc_msgSend_isXLFormat(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isXLFormat");
}

id objc_msgSend_isiCloudLoggedIn(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isiCloudLoggedIn");
}

id objc_msgSend_isiCloudSameAsiTunes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isiCloudSameAsiTunes");
}

id objc_msgSend_isiTunesLoggedIn(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isiTunesLoggedIn");
}

id objc_msgSend_iso8601TruncatedToMinutes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iso8601TruncatedToMinutes");
}

id objc_msgSend_isoCountryCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isoCountryCode");
}

id objc_msgSend_itemID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemID");
}

id objc_msgSend_itemLimit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemLimit");
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "items");
}

id objc_msgSend_iterateObjectsIncludingFolders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iterateObjectsIncludingFolders:");
}

id objc_msgSend_journeyBatchSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "journeyBatchSettings");
}

id objc_msgSend_journeyDaemonMetricHelper(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "journeyDaemonMetricHelper");
}

id objc_msgSend_journeyIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "journeyIdentifier");
}

id objc_msgSend_journeyRelayAdGroupId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "journeyRelayAdGroupId");
}

id objc_msgSend_journeyRelayCampaignId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "journeyRelayCampaignId");
}

id objc_msgSend_journeySettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "journeySettings");
}

id objc_msgSend_journeyStartRelayValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "journeyStartRelayValues");
}

id objc_msgSend_journeyStartRelayValuesAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "journeyStartRelayValuesAtIndex:");
}

id objc_msgSend_journeyStartRelayValuesCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "journeyStartRelayValuesCount");
}

id objc_msgSend_jsonBody(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "jsonBody");
}

id objc_msgSend_jsonDataWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "jsonDataWithOptions:");
}

id objc_msgSend_jsonRepresentationWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "jsonRepresentationWithOptions:");
}

id objc_msgSend_jsonString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "jsonString");
}

id objc_msgSend_jsonStringWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "jsonStringWithOptions:");
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "key");
}

id objc_msgSend_keyChainLock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyChainLock");
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyEnumerator");
}

id objc_msgSend_keyboardOverride(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyboardOverride");
}

id objc_msgSend_keyboards(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyboards");
}

id objc_msgSend_keywords(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keywords");
}

id objc_msgSend_kind(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "kind");
}

id objc_msgSend_language(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "language");
}

id objc_msgSend_languageIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "languageIdentifier");
}

id objc_msgSend_lastActivity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastActivity");
}

id objc_msgSend_lastDeliveryReportWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastDeliveryReportWithType:");
}

id objc_msgSend_lastGarbageCollected(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastGarbageCollected");
}

id objc_msgSend_lastModifiedDateForFileAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastModifiedDateForFileAtPath:error:");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_lastPlaybackTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastPlaybackTimestamp");
}

id objc_msgSend_lastPosition(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastPosition");
}

id objc_msgSend_lastProcessingDateForDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastProcessingDateForDestination:");
}

id objc_msgSend_lastProcessingDates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastProcessingDates");
}

id objc_msgSend_lastReport(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastReport");
}

id objc_msgSend_lastSentEventTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastSentEventTime");
}

id objc_msgSend_lastStatusCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastStatusCode");
}

id objc_msgSend_lastUpdated(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastUpdated");
}

id objc_msgSend_latestCellularSignalStrength(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "latestCellularSignalStrength");
}

id objc_msgSend_legacyInterface(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "legacyInterface");
}

id objc_msgSend_legacyMetrics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "legacyMetrics");
}

id objc_msgSend_legacyServerErrorCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "legacyServerErrorCode");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_level(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "level");
}

id objc_msgSend_lineBreakFramer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lineBreakFramer:");
}

id objc_msgSend_linesAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "linesAtIndex:");
}

id objc_msgSend_linesCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "linesCount");
}

id objc_msgSend_liveObjectsTracker(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "liveObjectsTracker");
}

id objc_msgSend_loadCapData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadCapData:");
}

id objc_msgSend_loadConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadConfig:");
}

id objc_msgSend_loadDeviceHeaderInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadDeviceHeaderInfo");
}

id objc_msgSend_loadDeviceInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadDeviceInfo");
}

id objc_msgSend_loadFailed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadFailed");
}

id objc_msgSend_loadIDAccountDetails(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadIDAccountDetails");
}

id objc_msgSend_loadMetaDataWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadMetaDataWithError:");
}

id objc_msgSend_localTimeZone(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localTimeZone");
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localeIdentifier");
}

id objc_msgSend_localeWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localeWithLocaleIdentifier:");
}

id objc_msgSend_locality(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locality");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedFailureReason(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedFailureReason");
}

id objc_msgSend_localizedHeadlines(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedHeadlines");
}

id objc_msgSend_localizedHeadlinesAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedHeadlinesAtIndex:");
}

id objc_msgSend_localizedHeadlinesCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedHeadlinesCount");
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "location");
}

id objc_msgSend_locationInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locationInfo");
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lock");
}

id objc_msgSend_lockObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockObject");
}

id objc_msgSend_logAdResponsesAsText(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logAdResponsesAsText");
}

id objc_msgSend_logMetadata(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logMetadata");
}

id objc_msgSend_longBuildVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "longBuildVersion");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "longValue");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainDatabase(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainDatabase");
}

id objc_msgSend_makeDelayedRequest_requestSentHandler_responseCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeDelayedRequest:requestSentHandler:responseCallback:");
}

id objc_msgSend_makeNetworkRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeNetworkRequest:");
}

id objc_msgSend_makeRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeRequest:");
}

id objc_msgSend_makeTimeSpentRequests_activity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeTimeSpentRequests:activity:");
}

id objc_msgSend_managedContentDataEnumerator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managedContentDataEnumerator");
}

id objc_msgSend_managedContentDataForId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managedContentDataForId:");
}

id objc_msgSend_managedContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managedContext");
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "manager");
}

id objc_msgSend_mapObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mapObjectsUsingBlock:");
}

id objc_msgSend_markInUseByClientWithId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markInUseByClientWithId:");
}

id objc_msgSend_markUsed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markUsed");
}

id objc_msgSend_masterId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "masterId");
}

id objc_msgSend_masterObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "masterObject");
}

id objc_msgSend_masterObjectFileNameForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "masterObjectFileNameForIdentifier:");
}

id objc_msgSend_matchTagClauseAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "matchTagClauseAtIndex:");
}

id objc_msgSend_matchTagClausesCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "matchTagClausesCount");
}

id objc_msgSend_matchesInString_options_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "matchesInString:options:range:");
}

id objc_msgSend_maxDisplayBars(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maxDisplayBars");
}

id objc_msgSend_maxObjectLifeTimeDays(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maxObjectLifeTimeDays");
}

id objc_msgSend_maxObjectLifetime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maxObjectLifetime");
}

id objc_msgSend_maxSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maxSize");
}

id objc_msgSend_maxVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maxVersion");
}

id objc_msgSend_mediaAPICountryCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaAPICountryCode");
}

id objc_msgSend_mediaAPIHostURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaAPIHostURL");
}

id objc_msgSend_mediaAssets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaAssets");
}

id objc_msgSend_mediaAssetsAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaAssetsAtIndex:");
}

id objc_msgSend_mediaAssetsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaAssetsCount");
}

id objc_msgSend_mediaFiles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaFiles");
}

id objc_msgSend_mediaServiceRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaServiceRequest");
}

id objc_msgSend_mediaServiceRequestClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaServiceRequestClass");
}

id objc_msgSend_mediaServiceSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaServiceSession");
}

id objc_msgSend_mediaURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaURL");
}

id objc_msgSend_memoryCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "memoryCache");
}

id objc_msgSend_mergeFrom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeFrom:");
}

id objc_msgSend_mescalSignature(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mescalSignature");
}

id objc_msgSend_mescalSigningSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mescalSigningSettings");
}

id objc_msgSend_mescalStateChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mescalStateChanged:");
}

id objc_msgSend_mescalStateDelegates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mescalStateDelegates");
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadata");
}

id objc_msgSend_metadataForBundleContainerURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataForBundleContainerURL:error:");
}

id objc_msgSend_methodSignatureForSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "methodSignatureForSelector:");
}

id objc_msgSend_metric(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metric");
}

id objc_msgSend_metricAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricAtIndex:");
}

id objc_msgSend_metricClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricClass");
}

id objc_msgSend_metricIsDefined_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricIsDefined:");
}

id objc_msgSend_metricIsDiagnosticsAndUsage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricIsDiagnosticsAndUsage:");
}

id objc_msgSend_metricRetryManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricRetryManager");
}

id objc_msgSend_metricRoute(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricRoute");
}

id objc_msgSend_metricRouteForPurpose_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricRouteForPurpose:");
}

id objc_msgSend_metricsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricsCount");
}

id objc_msgSend_metricsFileManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricsFileManager");
}

id objc_msgSend_metricsQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricsQueue");
}

id objc_msgSend_minCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minCount");
}

id objc_msgSend_minimumIntervalBetweenPresentations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minimumIntervalBetweenPresentations");
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minusSet:");
}

id objc_msgSend_mockAdServerUrl(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mockAdServerUrl");
}

id objc_msgSend_mockRequestJson(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mockRequestJson");
}

id objc_msgSend_mockResponseResultForPlacement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mockResponseResultForPlacement:");
}

id objc_msgSend_monitor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monitor");
}

id objc_msgSend_monitorQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monitorQueue");
}

id objc_msgSend_monthDayInteger(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monthDayInteger");
}

id objc_msgSend_monthlyIDResetCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monthlyIDResetCount");
}

id objc_msgSend_moveExistingOpenFilesToClosed_closedPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveExistingOpenFilesToClosed:closedPrefix:");
}

id objc_msgSend_moveItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveItemAtPath:toPath:error:");
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableBytes");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_mutableResults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableResults");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "name");
}

id objc_msgSend_nativeMetadataAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nativeMetadataAtIndex:");
}

id objc_msgSend_nativeMetadatas(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nativeMetadatas");
}

id objc_msgSend_nativeMetadatasCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nativeMetadatasCount");
}

id objc_msgSend_networkDataValid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkDataValid");
}

id objc_msgSend_networkInfoUpdatingInProgress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkInfoUpdatingInProgress");
}

id objc_msgSend_networkType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkType");
}

id objc_msgSend_nextDateAfterDate_matchingComponents_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextDateAfterDate:matchingComponents:options:");
}

id objc_msgSend_nextIndex(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextIndex");
}

id objc_msgSend_nextMetric(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextMetric");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextObject");
}

id objc_msgSend_nextObjectData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextObjectData");
}

id objc_msgSend_notANumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notANumber");
}

id objc_msgSend_notificationRegistrar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationRegistrar");
}

id objc_msgSend_notificationRegistrarClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationRegistrarClass");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "now");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "null");
}

id objc_msgSend_numberFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberFromString:");
}

id objc_msgSend_numberOfDaysSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfDaysSinceDate:");
}

id objc_msgSend_numberOfRanges(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfRanges");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithShort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithShort:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLong:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_numericParameterArrayToDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numericParameterArrayToDictionary:");
}

id objc_msgSend_o11y(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "o11y");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "object");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectClass");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectEnumerator");
}

id objc_msgSend_objectForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForIdentifier:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:error:");
}

id objc_msgSend_objectForKey_ignoreKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:ignoreKeys:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectForPropertyListKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForPropertyListKey:error:");
}

id objc_msgSend_objectIsLoaded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectIsLoaded:");
}

id objc_msgSend_objectSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectSize");
}

id objc_msgSend_objectStoredAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectStoredAtPath:error:");
}

id objc_msgSend_objectsIterator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsIterator");
}

id objc_msgSend_observeClientError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observeClientError:");
}

id objc_msgSend_observeClientTimeout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observeClientTimeout");
}

id objc_msgSend_observerServerResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observerServerResponse:");
}

id objc_msgSend_offsetAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "offsetAtIndex:");
}

id objc_msgSend_offsets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "offsets");
}

id objc_msgSend_offsetsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "offsetsCount");
}

id objc_msgSend_oldEncryptedIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "oldEncryptedIDs");
}

id objc_msgSend_opacity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "opacity");
}

id objc_msgSend_openStoragePathPrefix(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openStoragePathPrefix");
}

id objc_msgSend_operatingSystemVersionString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operatingSystemVersionString");
}

id objc_msgSend_operationQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operationQueue");
}

id objc_msgSend_operations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operations");
}

id objc_msgSend_operator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operator");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "options");
}

id objc_msgSend_order(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "order");
}

id objc_msgSend_orderedSetWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orderedSetWithArray:");
}

id objc_msgSend_ordinalityOfUnit_inUnit_forDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ordinalityOfUnit:inUnit:forDate:");
}

id objc_msgSend_orientation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orientation");
}

id objc_msgSend_originalContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "originalContext");
}

id objc_msgSend_osBuild(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "osBuild");
}

id objc_msgSend_osIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "osIdentifier");
}

id objc_msgSend_osPlatform(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "osPlatform");
}

id objc_msgSend_osVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "osVersion");
}

id objc_msgSend_osVersionAndBuild(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "osVersionAndBuild");
}

id objc_msgSend_osVersionOverride(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "osVersionOverride");
}

id objc_msgSend_parameterArrayToDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parameterArrayToDictionary:");
}

id objc_msgSend_parameterArrayToDictionaryForMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parameterArrayToDictionaryForMetadata:");
}

id objc_msgSend_parameterListAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parameterListAtIndex:");
}

id objc_msgSend_parameterListsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parameterListsCount");
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parameters");
}

id objc_msgSend_parametersAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parametersAtIndex:");
}

id objc_msgSend_parametersCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parametersCount");
}

id objc_msgSend_params(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "params");
}

id objc_msgSend_parent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parent");
}

id objc_msgSend_pastDueReportDates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pastDueReportDates");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "path");
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathComponents");
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathExtension");
}

id objc_msgSend_pathForName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathForName:");
}

id objc_msgSend_pathWithComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathWithComponents:");
}

id objc_msgSend_pathsToExpiredBatchesWithFileManager_closedPathPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathsToExpiredBatchesWithFileManager:closedPathPrefix:");
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pause");
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "payload");
}

id objc_msgSend_payloadForRequestBodyABCLog(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "payloadForRequestBodyABCLog");
}

id objc_msgSend_payloadForRequestHeaderABCLog(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "payloadForRequestHeaderABCLog");
}

id objc_msgSend_paymentCapabilitiesAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "paymentCapabilitiesAtIndex:");
}

id objc_msgSend_paymentCapabilitiesCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "paymentCapabilitiesCount");
}

id objc_msgSend_pendingConfirmedClick(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingConfirmedClick");
}

id objc_msgSend_pendingConfirmedClick_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingConfirmedClick:");
}

id objc_msgSend_pendingDelayedRequests(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingDelayedRequests");
}

id objc_msgSend_pendingRequestsForContent_filterPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingRequestsForContent:filterPredicate:");
}

id objc_msgSend_performSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:");
}

id objc_msgSend_performSelector_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:withObject:");
}

id objc_msgSend_periodicDelay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "periodicDelay");
}

id objc_msgSend_periodicDelayTimeInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "periodicDelayTimeInterval");
}

id objc_msgSend_persist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persist:");
}

id objc_msgSend_persistentCacheStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistentCacheStore");
}

id objc_msgSend_persistentStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistentStore");
}

id objc_msgSend_personalizedAds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personalizedAds");
}

id objc_msgSend_personalizedAdsAcknowledged(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personalizedAdsAcknowledged");
}

id objc_msgSend_personalizedAdsEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personalizedAdsEnabled");
}

id objc_msgSend_placement(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "placement");
}

id objc_msgSend_placementDescriptor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "placementDescriptor");
}

id objc_msgSend_placementType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "placementType");
}

id objc_msgSend_placementTypeToCreativeType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "placementTypeToCreativeType:");
}

id objc_msgSend_placementTypes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "placementTypes");
}

id objc_msgSend_playbackInProgress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackInProgress");
}

id objc_msgSend_playbackTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackTime");
}

id objc_msgSend_policiesForContainerType_adType_adFormatType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "policiesForContainerType:adType:adFormatType:");
}

id objc_msgSend_policiesToEnforce(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "policiesToEnforce");
}

id objc_msgSend_policy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "policy");
}

id objc_msgSend_policyData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "policyData");
}

id objc_msgSend_policySettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "policySettings");
}

id objc_msgSend_policySettingsURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "policySettingsURL");
}

id objc_msgSend_policyType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "policyType");
}

id objc_msgSend_policyValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "policyValue");
}

id objc_msgSend_policyValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "policyValues");
}

id objc_msgSend_policyValuesAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "policyValuesAtIndex:");
}

id objc_msgSend_policyValuesCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "policyValuesCount");
}

id objc_msgSend_poll(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "poll");
}

id objc_msgSend_positionInformation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "positionInformation");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_postalCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postalCode");
}

id objc_msgSend_predefined(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predefined");
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithBlock:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_prefetchTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prefetchTimestamp");
}

id objc_msgSend_prepareDelivery(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareDelivery");
}

id objc_msgSend_preparedDataPathForDestination_purpose_containsSignature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preparedDataPathForDestination:purpose:containsSignature:");
}

id objc_msgSend_preparedDataServerDelivery(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preparedDataServerDelivery");
}

id objc_msgSend_preparedMetricDataForDestination_purpose_containsSignature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preparedMetricDataForDestination:purpose:containsSignature:");
}

id objc_msgSend_preparedUnsignedDataProcessor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preparedUnsignedDataProcessor");
}

id objc_msgSend_prettyPrintJson(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prettyPrintJson");
}

id objc_msgSend_prettyPrintJsonValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prettyPrintJsonValue");
}

id objc_msgSend_privateContent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "privateContent");
}

id objc_msgSend_privateDataDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "privateDataDidChange");
}

id objc_msgSend_privateSegment(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "privateSegment");
}

id objc_msgSend_privateUserAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "privateUserAccount");
}

id objc_msgSend_processAdPolicyData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processAdPolicyData");
}

id objc_msgSend_processErrorsForContentDataItems_error_contextFingerprint_params_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processErrorsForContentDataItems:error:contextFingerprint:params:");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processInfo");
}

id objc_msgSend_processMetric_environmentProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processMetric:environmentProvider:");
}

id objc_msgSend_processMetrics_forChannel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processMetrics:forChannel:");
}

id objc_msgSend_processServerDeliveryTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processServerDeliveryTimer");
}

id objc_msgSend_processWithFPDISigningAuthorityPoolManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processWithFPDISigningAuthorityPoolManager:");
}

id objc_msgSend_processWithMescal(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processWithMescal");
}

id objc_msgSend_processingDestinations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processingDestinations");
}

id objc_msgSend_processingDestinationsLock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processingDestinationsLock");
}

id objc_msgSend_processor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processor");
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "properties");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_protectedDestination(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "protectedDestination");
}

id objc_msgSend_protectedEventChannel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "protectedEventChannel");
}

id objc_msgSend_protoBuffer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "protoBuffer");
}

id objc_msgSend_protocolHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "protocolHandler");
}

id objc_msgSend_provideIgnorableKeyNamesBlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "provideIgnorableKeyNamesBlock");
}

id objc_msgSend_provider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "provider");
}

id objc_msgSend_proxy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "proxy");
}

id objc_msgSend_proxyForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "proxyForIdentifier:");
}

id objc_msgSend_proxyObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "proxyObject");
}

id objc_msgSend_proxyWithCacheKey_object_identifier_inPersistentStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "proxyWithCacheKey:object:identifier:inPersistentStore:");
}

id objc_msgSend_proxyWithCacheKey_object_inPersistentStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "proxyWithCacheKey:object:inPersistentStore:");
}

id objc_msgSend_pruner(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pruner");
}

id objc_msgSend_publisherWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publisherWithOptions:");
}

id objc_msgSend_purchaseDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purchaseDate");
}

id objc_msgSend_purchaseTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purchaseTimestamp");
}

id objc_msgSend_purpose(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purpose");
}

id objc_msgSend_purposeClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purposeClass");
}

id objc_msgSend_purposeConfig_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purposeConfig:");
}

id objc_msgSend_qToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "qToken");
}

id objc_msgSend_queryCacheForRequests_managedContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryCacheForRequests:managedContext:");
}

id objc_msgSend_queryItemWithName_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryItemWithName:value:");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queue");
}

id objc_msgSend_queueRawSignatureRequest_waitTime_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queueRawSignatureRequest:waitTime:completion:");
}

id objc_msgSend_queueSignatureRequest_waitTime_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queueSignatureRequest:waitTime:completion:");
}

id objc_msgSend_radius(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "radius");
}

id objc_msgSend_raise(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise");
}

id objc_msgSend_rangeAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeAtIndex:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_rangeOfUnit_startDate_interval_forDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfUnit:startDate:interval:forDate:");
}

id objc_msgSend_rank(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rank");
}

id objc_msgSend_rankRepresentations_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rankRepresentations:completionHandler:");
}

id objc_msgSend_rateLimitLock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rateLimitLock");
}

id objc_msgSend_rateLimits(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rateLimits");
}

id objc_msgSend_rateLimitsLastUpdatedOn(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rateLimitsLastUpdatedOn");
}

id objc_msgSend_rateLimitsObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rateLimitsObject");
}

id objc_msgSend_rawSignatureForData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rawSignatureForData:error:");
}

id objc_msgSend_rawSignatureForData_waitTime_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rawSignatureForData:waitTime:completion:");
}

id objc_msgSend_reachability(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reachability");
}

id objc_msgSend_reachabilityChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reachabilityChanged:");
}

id objc_msgSend_readDataFromFile_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readDataFromFile:error:");
}

id objc_msgSend_readFrom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readFrom:");
}

id objc_msgSend_readMessageType_fromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readMessageType:fromString:");
}

id objc_msgSend_receivedContentDataItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receivedContentDataItems");
}

id objc_msgSend_receivedForBundleID_adServer_elapsedTime_relayValues_internalProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receivedForBundleID:adServer:elapsedTime:relayValues:internalProperties:");
}

id objc_msgSend_receivedForBundleID_elapsedTime_relayValues_internalProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receivedForBundleID:elapsedTime:relayValues:internalProperties:");
}

id objc_msgSend_receivedMetric_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receivedMetric:");
}

id objc_msgSend_recordCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordCount");
}

id objc_msgSend_recordFailure(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordFailure");
}

id objc_msgSend_recordFailure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordFailure:");
}

id objc_msgSend_recordMetric_forPurpose_bundleID_handleOverride_properties_internalProperties_relayData_order_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordMetric:forPurpose:bundleID:handleOverride:properties:internalProperties:relayData:order:options:");
}

id objc_msgSend_recordMetric_forPurpose_properties_internalProperties_order_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordMetric:forPurpose:properties:internalProperties:order:options:");
}

id objc_msgSend_recordSuccess(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordSuccess");
}

id objc_msgSend_referenceCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "referenceCache");
}

id objc_msgSend_referenceFromIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "referenceFromIdentifier:error:");
}

id objc_msgSend_registerAdaptorClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerAdaptorClass:");
}

id objc_msgSend_registerForTaskWithIdentifier_usingQueue_launchHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForTaskWithIdentifier:usingQueue:launchHandler:");
}

id objc_msgSend_registerHandlerForExternalPurposesAndAllMetricsWithClosure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerHandlerForExternalPurposesAndAllMetricsWithClosure:");
}

id objc_msgSend_registerHandlerForPurpose_andMetric_closure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerHandlerForPurpose:andMetric:closure:");
}

id objc_msgSend_registerHandlerForPurpose_closure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerHandlerForPurpose:closure:");
}

id objc_msgSend_registerMetricRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerMetricRequest:");
}

id objc_msgSend_registerTask(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerTask");
}

id objc_msgSend_registeredAdaptors(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registeredAdaptors");
}

id objc_msgSend_registrationTokens(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registrationTokens");
}

id objc_msgSend_relayData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relayData");
}

id objc_msgSend_relevantIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relevantIdentifier");
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteObjectProxy");
}

id objc_msgSend_removalBlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removalBlock");
}

id objc_msgSend_remove_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remove:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeAssociatedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAssociatedObject:");
}

id objc_msgSend_removeBatchByFileSystemToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeBatchByFileSystemToken:");
}

id objc_msgSend_removeDataAfterDays(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDataAfterDays");
}

id objc_msgSend_removeDelayedRequest_cancel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDelayedRequest:cancel:");
}

id objc_msgSend_removeEntriesForContentIds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeEntriesForContentIds:");
}

id objc_msgSend_removeExpiredBatchesFromClosedPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeExpiredBatchesFromClosedPrefix:");
}

id objc_msgSend_removeFile_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFile:error:");
}

id objc_msgSend_removeHandlerWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeHandlerWithIdentifier:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeLastObject");
}

id objc_msgSend_removeManagedContentDataForId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeManagedContentDataForId:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtPath:error:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectForKey_transaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:transaction:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeWaitingForNetworkDateDirectory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeWaitingForNetworkDateDirectory");
}

id objc_msgSend_replaceExisting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceExisting");
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceObjectAtIndex:withObject:");
}

id objc_msgSend_reportDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportDate");
}

id objc_msgSend_reportDayMinus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportDayMinus:");
}

id objc_msgSend_reportDayString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportDayString");
}

id objc_msgSend_reportEndDay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportEndDay");
}

id objc_msgSend_reportEventCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportEventCount");
}

id objc_msgSend_reportFrequency(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportFrequency");
}

id objc_msgSend_reportFrequencyStringKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportFrequencyStringKey");
}

id objc_msgSend_reportType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportType");
}

id objc_msgSend_reportingFrequency(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingFrequency");
}

id objc_msgSend_reportingPurposes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingPurposes");
}

id objc_msgSend_reportingStorefront(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportingStorefront");
}

id objc_msgSend_representationWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "representationWithIdentifier:");
}

id objc_msgSend_representations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "representations");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "request");
}

id objc_msgSend_requestAds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestAds:");
}

id objc_msgSend_requestBody(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestBody");
}

id objc_msgSend_requestByEncodingRequest_parameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestByEncodingRequest:parameters:");
}

id objc_msgSend_requestCertificate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestCertificate");
}

id objc_msgSend_requestCertificateWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestCertificateWithCompletion:");
}

id objc_msgSend_requestConfigurationWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestConfigurationWithCompletionHandler:");
}

id objc_msgSend_requestFailedForBundleID_withCode_requestID_placement_placementType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestFailedForBundleID:withCode:requestID:placement:placementType:");
}

id objc_msgSend_requestFromLegacyInterfaceForPromotedContents_context_withToken_andBundleID_clientInfo_idAccount_deliverEntireBatch_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestFromLegacyInterfaceForPromotedContents:context:withToken:andBundleID:clientInfo:idAccount:deliverEntireBatch:completionHandler:");
}

id objc_msgSend_requestFromRequestID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestFromRequestID:");
}

id objc_msgSend_requestHeader(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestHeader");
}

id objc_msgSend_requestID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestID");
}

id objc_msgSend_requestIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestIdentifier");
}

id objc_msgSend_requestMescalSetupForData_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestMescalSetupForData:completionHandler:");
}

id objc_msgSend_requestParameters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestParameters");
}

id objc_msgSend_requestPromotedContentOfTypes_forContext_withToken_andBundleID_clientInfo_idAccount_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestPromotedContentOfTypes:forContext:withToken:andBundleID:clientInfo:idAccount:completionHandler:");
}

id objc_msgSend_requestProperties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestProperties");
}

id objc_msgSend_requestQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestQueue");
}

id objc_msgSend_requestTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestTime");
}

id objc_msgSend_requestTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestTimestamp");
}

id objc_msgSend_requestWillSend_headers_request_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWillSend:headers:request:");
}

id objc_msgSend_requestWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithURL:");
}

id objc_msgSend_requestedAdIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestedAdIdentifier");
}

id objc_msgSend_requester(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requester");
}

id objc_msgSend_requesters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requesters");
}

id objc_msgSend_requestersAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestersAtIndex:");
}

id objc_msgSend_requestersCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestersCount");
}

id objc_msgSend_requestsWhileInitializing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestsWhileInitializing");
}

id objc_msgSend_requiredTagsAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requiredTagsAtIndex:");
}

id objc_msgSend_requiredTagsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requiredTagsCount");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reset");
}

id objc_msgSend_resetConfigurationSystem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetConfigurationSystem");
}

id objc_msgSend_resetRouteOffsets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetRouteOffsets");
}

id objc_msgSend_resetTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetTimer");
}

id objc_msgSend_resourceCacheEntriesAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resourceCacheEntriesAtIndex:");
}

id objc_msgSend_resourceCacheEntriesCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resourceCacheEntriesCount");
}

id objc_msgSend_resourceConnectProxyURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resourceConnectProxyURL");
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "response");
}

id objc_msgSend_responseBody(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "responseBody");
}

id objc_msgSend_responseClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "responseClass");
}

id objc_msgSend_responseError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "responseError");
}

id objc_msgSend_responseHeaders(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "responseHeaders");
}

id objc_msgSend_responseJson(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "responseJson");
}

id objc_msgSend_responseReceived_responseProtobuf_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "responseReceived:responseProtobuf:error:");
}

id objc_msgSend_responseResult(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "responseResult");
}

id objc_msgSend_responseStatusCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "responseStatusCode");
}

id objc_msgSend_responseTTL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "responseTTL");
}

id objc_msgSend_responseTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "responseTime");
}

id objc_msgSend_restoreCapDataArrayFromPlist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreCapDataArrayFromPlist:");
}

id objc_msgSend_resultForResponse_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resultForResponse:error:");
}

id objc_msgSend_resultTagsAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resultTagsAtIndex:");
}

id objc_msgSend_resultTagsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resultTagsCount");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resume");
}

id objc_msgSend_retrieveTimeSpentEntriesOlderThan_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retrieveTimeSpentEntriesOlderThan:");
}

id objc_msgSend_retrieveTimeSpentTTLConfigValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retrieveTimeSpentTTLConfigValue");
}

id objc_msgSend_retryManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retryManager");
}

id objc_msgSend_retrySetup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retrySetup");
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reverseObjectEnumerator");
}

id objc_msgSend_rewardTokensAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rewardTokensAtIndex:");
}

id objc_msgSend_rewardTokensCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rewardTokensCount");
}

id objc_msgSend_rollBack(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rollBack");
}

id objc_msgSend_rootNode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rootNode");
}

id objc_msgSend_rotateIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rotateIdentifiers");
}

id objc_msgSend_rotateWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rotateWithError:");
}

id objc_msgSend_roundedTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "roundedTimestamp");
}

id objc_msgSend_rowid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rowid");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "run");
}

id objc_msgSend_runWithParameters_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runWithParameters:handler:");
}

id objc_msgSend_runWithParameters_mediaServiceSession_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runWithParameters:mediaServiceSession:completionHandler:");
}

id objc_msgSend_runWithParametersSync_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runWithParametersSync:handler:");
}

id objc_msgSend_sampleEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sampleEvent:");
}

id objc_msgSend_samplePercentage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "samplePercentage");
}

id objc_msgSend_samplePeriod(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "samplePeriod");
}

id objc_msgSend_sampleSessionStartTimeFromPurpose_purpose_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sampleSessionStartTimeFromPurpose:purpose:");
}

id objc_msgSend_sampler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sampler");
}

id objc_msgSend_samplingSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "samplingSettings");
}

id objc_msgSend_save(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "save");
}

id objc_msgSend_savedPolicies(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "savedPolicies");
}

id objc_msgSend_scalarMetricsAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scalarMetricsAtIndex:");
}

id objc_msgSend_scalarMetricsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scalarMetricsCount");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scale");
}

id objc_msgSend_scanInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanInt:");
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scannerWithString:");
}

id objc_msgSend_schedule(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "schedule");
}

id objc_msgSend_scheduleNextLevelWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleNextLevelWithQueue:");
}

id objc_msgSend_scheduledDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledDate");
}

id objc_msgSend_screenHeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenHeight");
}

id objc_msgSend_screenSaverImageURLAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenSaverImageURLAtIndex:");
}

id objc_msgSend_screenSaverImageURLsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenSaverImageURLsCount");
}

id objc_msgSend_screenSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenSize");
}

id objc_msgSend_screenWidth(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenWidth");
}

id objc_msgSend_searchAdClickTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "searchAdClickTimestamp");
}

id objc_msgSend_searchTerms(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "searchTerms");
}

id objc_msgSend_secondsFromGMT(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secondsFromGMT");
}

id objc_msgSend_secureFile(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secureFile");
}

id objc_msgSend_secureFileManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secureFileManager");
}

id objc_msgSend_segmentData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "segmentData");
}

id objc_msgSend_segmentIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "segmentIdentifiers");
}

id objc_msgSend_segmentIdentifiersAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "segmentIdentifiersAtIndex:");
}

id objc_msgSend_segmentIdentifiersCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "segmentIdentifiersCount");
}

id objc_msgSend_selectRandomSigningService(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectRandomSigningService");
}

id objc_msgSend_selectedCreativeSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectedCreativeSize");
}

id objc_msgSend_selectorWithAttributionConfig(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectorWithAttributionConfig");
}

id objc_msgSend_send_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "send:");
}

id objc_msgSend_send_ofType_withMetadata_forIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "send:ofType:withMetadata:forIDs:");
}

id objc_msgSend_send_withMetadata_forIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "send:withMetadata:forIDs:");
}

id objc_msgSend_sendAnalytics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendAnalytics");
}

id objc_msgSend_sendAnalyticsForGettingAdResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendAnalyticsForGettingAdResponse:");
}

id objc_msgSend_sendAnalyticsForMakingRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendAnalyticsForMakingRequest");
}

id objc_msgSend_sendDeliveryEventWithError_successCount_backoffIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendDeliveryEventWithError:successCount:backoffIndex:");
}

id objc_msgSend_sendDiagnosticReport_context_isUserChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendDiagnosticReport:context:isUserChanged:");
}

id objc_msgSend_sendEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEvent:");
}

id objc_msgSend_sendEvent_customPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEvent:customPayload:");
}

id objc_msgSend_sendEvent_statusDetail_startDate_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEvent:statusDetail:startDate:error:");
}

id objc_msgSend_sendHTTPDeliveryRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendHTTPDeliveryRequest:error:");
}

id objc_msgSend_sendLegacyMetric_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendLegacyMetric:");
}

id objc_msgSend_sendLegacyMetricWithDelay_legacyMetric_requestSentHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendLegacyMetricWithDelay:legacyMetric:requestSentHandler:");
}

id objc_msgSend_sendPayload_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendPayload:error:");
}

id objc_msgSend_sendRequest_params_mediaServiceSession_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendRequest:params:mediaServiceSession:completionHandler:");
}

id objc_msgSend_sendRequestToServer_requestTimestamp_payloadDeliveryTimestamp_interval_error_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendRequestToServer:requestTimestamp:payloadDeliveryTimestamp:interval:error:completionHandler:");
}

id objc_msgSend_sendTimeSpentMetric(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendTimeSpentMetric");
}

id objc_msgSend_sendTimeSpentMetricFor_contentId_contextId_adDataResponseIdentifier_batchId_impressionIdentifierData_timeSpent_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendTimeSpentMetricFor:contentId:contextId:adDataResponseIdentifier:batchId:impressionIdentifierData:timeSpent:completionHandler:");
}

id objc_msgSend_sendTimedAnalytic_fieldName_startDate_endDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendTimedAnalytic:fieldName:startDate:endDate:");
}

id objc_msgSend_sendTimedAnalytic_fieldName_startDate_endDate_additionalFields_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendTimedAnalytic:fieldName:startDate:endDate:additionalFields:");
}

id objc_msgSend_sendTimingAnalytics_startDate_endDate_additionalFields_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendTimingAnalytics:startDate:endDate:additionalFields:");
}

id objc_msgSend_sendTokenAnalytics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendTokenAnalytics");
}

id objc_msgSend_sendTokenDuplicateAnalytics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendTokenDuplicateAnalytics:");
}

id objc_msgSend_sensitiveContentEligible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sensitiveContentEligible");
}

id objc_msgSend_sentStatusCodes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sentStatusCodes");
}

id objc_msgSend_sequenceNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sequenceNumber");
}

id objc_msgSend_serialize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serialize");
}

id objc_msgSend_serializeProtobuffer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serializeProtobuffer:");
}

id objc_msgSend_serveProductionAds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serveProductionAds");
}

id objc_msgSend_serverConfig(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverConfig");
}

id objc_msgSend_serverConfigRecord(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverConfigRecord");
}

id objc_msgSend_serverDelivery(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverDelivery");
}

id objc_msgSend_serverDeliveryClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverDeliveryClass");
}

id objc_msgSend_serverDeliveryLock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverDeliveryLock");
}

id objc_msgSend_serverDeliveryQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverDeliveryQueue");
}

id objc_msgSend_serverDeliveryTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverDeliveryTimer");
}

id objc_msgSend_serverDeliveryTimerWasRunningWhenPaused(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverDeliveryTimerWasRunningWhenPaused");
}

id objc_msgSend_serverDictionaryRepresentationWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverDictionaryRepresentationWithBlock:");
}

id objc_msgSend_serverEnvironment(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverEnvironment");
}

id objc_msgSend_serverRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverRequest");
}

id objc_msgSend_serverSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverSettings");
}

id objc_msgSend_serverURLForMessageID_andBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverURLForMessageID:andBundleID:");
}

id objc_msgSend_serverUnfilledReason(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverUnfilledReason");
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "service");
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set");
}

id objc_msgSend_setATVTunerImageURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setATVTunerImageURL:");
}

id objc_msgSend_setAccessAdCopy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessAdCopy:");
}

id objc_msgSend_setAccessCaption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessCaption:");
}

id objc_msgSend_setAccessHeadline_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessHeadline:");
}

id objc_msgSend_setAccessText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessText:");
}

id objc_msgSend_setAccessibilityDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityDescription:");
}

id objc_msgSend_setAccessibleAdCopy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibleAdCopy:");
}

id objc_msgSend_setAccessibleCaption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibleCaption:");
}

id objc_msgSend_setAccessibleHeadline_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibleHeadline:");
}

id objc_msgSend_setAccessibleText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibleText:");
}

id objc_msgSend_setAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccount:");
}

id objc_msgSend_setAccountType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountType:");
}

id objc_msgSend_setAccumulated50PercentVisibilityTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccumulated50PercentVisibilityTime:");
}

id objc_msgSend_setAccumulatedPlaybackTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccumulatedPlaybackTime:");
}

id objc_msgSend_setAccumulatedVisibilityTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccumulatedVisibilityTime:");
}

id objc_msgSend_setAccumulationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccumulationHandler:");
}

id objc_msgSend_setAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAction:");
}

id objc_msgSend_setActionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionIdentifier:");
}

id objc_msgSend_setActionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionType:");
}

id objc_msgSend_setActionURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionURL:");
}

id objc_msgSend_setActionWebArchiveURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionWebArchiveURL:");
}

id objc_msgSend_setActiveCleanupOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveCleanupOperation:");
}

id objc_msgSend_setActiveDataTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveDataTask:");
}

id objc_msgSend_setAdCopy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdCopy:");
}

id objc_msgSend_setAdDataResponseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdDataResponseIdentifier:");
}

id objc_msgSend_setAdFormatType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdFormatType:");
}

id objc_msgSend_setAdFrequencyCapData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdFrequencyCapData:");
}

id objc_msgSend_setAdIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdIdentifier:");
}

id objc_msgSend_setAdLayoutDetails_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdLayoutDetails:");
}

id objc_msgSend_setAdMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdMetadata:");
}

id objc_msgSend_setAdNetworkId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdNetworkId:");
}

id objc_msgSend_setAdOriginIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdOriginIdentifier:");
}

id objc_msgSend_setAdOriginalRequesterId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdOriginalRequesterId:");
}

id objc_msgSend_setAdServerEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdServerEnvironment:");
}

id objc_msgSend_setAdServerResponseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdServerResponseIdentifier:");
}

id objc_msgSend_setAdTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdTag:");
}

id objc_msgSend_setAdTagContentString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdTagContentString:");
}

id objc_msgSend_setAdType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdType:");
}

id objc_msgSend_setAdamID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdamID:");
}

id objc_msgSend_setAdamId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdamId:");
}

id objc_msgSend_setAdamIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdamIdentifier:");
}

id objc_msgSend_setAdministrativeArea_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdministrativeArea:");
}

id objc_msgSend_setAdvertiserName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdvertiserName:");
}

id objc_msgSend_setAdvertisingIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdvertisingIdentifier:");
}

id objc_msgSend_setAdvertisingIdentifierMonthResetCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdvertisingIdentifierMonthResetCount:");
}

id objc_msgSend_setAllocatedSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllocatedSize:");
}

id objc_msgSend_setAllowITunes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowITunes:");
}

id objc_msgSend_setAllowInstallApps_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowInstallApps:");
}

id objc_msgSend_setAncientItemBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAncientItemBlock:");
}

id objc_msgSend_setAnonymousDemandId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnonymousDemandId:");
}

id objc_msgSend_setAnonymousDemandiAdID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnonymousDemandiAdID:");
}

id objc_msgSend_setApiFramework_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApiFramework:");
}

id objc_msgSend_setAppID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppID:");
}

id objc_msgSend_setAppMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppMetadata:");
}

id objc_msgSend_setAppStoreViewAdVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppStoreViewAdVersion:");
}

id objc_msgSend_setAppVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppVersion:");
}

id objc_msgSend_setApplicationLinkedOnOS_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApplicationLinkedOnOS:");
}

id objc_msgSend_setAppsRank_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppsRank:");
}

id objc_msgSend_setArticleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArticleID:");
}

id objc_msgSend_setArticleTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArticleTitle:");
}

id objc_msgSend_setArtist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArtist:");
}

id objc_msgSend_setAsset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAsset:");
}

id objc_msgSend_setAssetInformation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssetInformation:");
}

id objc_msgSend_setAttemptId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttemptId:");
}

id objc_msgSend_setAttributionDownloadType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributionDownloadType:");
}

id objc_msgSend_setAttributionKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributionKey:");
}

id objc_msgSend_setAttributionMetadataExistsOnDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributionMetadataExistsOnDevice:");
}

id objc_msgSend_setAttributionSignature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributionSignature:");
}

id objc_msgSend_setAudioURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioURL:");
}

id objc_msgSend_setAutoloop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoloop:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBackgroundImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundImage:");
}

id objc_msgSend_setBackoffTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackoffTimer:");
}

id objc_msgSend_setBadResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBadResponse:");
}

id objc_msgSend_setBannerCustomMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBannerCustomMetadata:");
}

id objc_msgSend_setBannerQueryString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBannerQueryString:");
}

id objc_msgSend_setBannerURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBannerURL:");
}

id objc_msgSend_setBannerWebArchiveURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBannerWebArchiveURL:");
}

id objc_msgSend_setBaseUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBaseUrl:");
}

id objc_msgSend_setBatchId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBatchId:");
}

id objc_msgSend_setBatchInfos_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBatchInfos:");
}

id objc_msgSend_setBatchResponseID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBatchResponseID:");
}

id objc_msgSend_setBatchesData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBatchesData:");
}

id objc_msgSend_setBilling_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBilling:");
}

id objc_msgSend_setBitrate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBitrate:");
}

id objc_msgSend_setBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBlock:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setBorderStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBorderStyle:");
}

id objc_msgSend_setBranch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBranch:");
}

id objc_msgSend_setBrandName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBrandName:");
}

id objc_msgSend_setBuffer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBuffer:");
}

id objc_msgSend_setBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleID:");
}

id objc_msgSend_setBundleIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleIDs:");
}

id objc_msgSend_setBundleId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleId:");
}

id objc_msgSend_setButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButton:");
}

id objc_msgSend_setButtonStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonStyle:");
}

id objc_msgSend_setByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setByAddingObject:");
}

id objc_msgSend_setByAddingObjectsFromSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setByAddingObjectsFromSet:");
}

id objc_msgSend_setCacheSizeLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCacheSizeLimit:");
}

id objc_msgSend_setCacheSizeLimitValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCacheSizeLimitValue:");
}

id objc_msgSend_setCachedCertificate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedCertificate:");
}

id objc_msgSend_setCalendar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCalendar:");
}

id objc_msgSend_setCampaignData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCampaignData:");
}

id objc_msgSend_setCampaignId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCampaignId:");
}

id objc_msgSend_setCampaignNameSpace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCampaignNameSpace:");
}

id objc_msgSend_setCampaignText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCampaignText:");
}

id objc_msgSend_setCancelButtonForPurchaseDialog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCancelButtonForPurchaseDialog:");
}

id objc_msgSend_setCancelLabelForExitDialog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCancelLabelForExitDialog:");
}

id objc_msgSend_setCancelled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCancelled:");
}

id objc_msgSend_setCaption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCaption:");
}

id objc_msgSend_setCarousel50PercentVisibleTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCarousel50PercentVisibleTime:");
}

id objc_msgSend_setCarouselElementsPartiallyVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCarouselElementsPartiallyVisible:");
}

id objc_msgSend_setCarouselElementsVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCarouselElementsVisible:");
}

id objc_msgSend_setCarouselFinishedSent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCarouselFinishedSent:");
}

id objc_msgSend_setCarouselVisibleTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCarouselVisibleTime:");
}

id objc_msgSend_setCarrierMCC_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCarrierMCC:");
}

id objc_msgSend_setCarrierMNC_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCarrierMNC:");
}

id objc_msgSend_setChannel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChannel:");
}

id objc_msgSend_setChannels_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChannels:");
}

id objc_msgSend_setChildren_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChildren:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setClickCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClickCount:");
}

id objc_msgSend_setClickLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClickLocation:");
}

id objc_msgSend_setClickOrigin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClickOrigin:");
}

id objc_msgSend_setClickTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClickTime:");
}

id objc_msgSend_setClickedCarouselElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClickedCarouselElement:");
}

id objc_msgSend_setClientClockTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientClockTime:");
}

id objc_msgSend_setClientConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientConnection:");
}

id objc_msgSend_setClientId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientId:");
}

id objc_msgSend_setClientInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientInfo:");
}

id objc_msgSend_setClientRequestID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientRequestID:");
}

id objc_msgSend_setClientViewSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientViewSize:");
}

id objc_msgSend_setCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCollection:");
}

id objc_msgSend_setCollectionProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCollectionProvider:");
}

id objc_msgSend_setColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setColor:");
}

id objc_msgSend_setCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletionHandler:");
}

id objc_msgSend_setConfigRequester_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfigRequester:");
}

id objc_msgSend_setConfigVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfigVersion:");
}

id objc_msgSend_setConfigurations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfigurations:");
}

id objc_msgSend_setConfirmedClickInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfirmedClickInterval:");
}

id objc_msgSend_setConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnection:");
}

id objc_msgSend_setConnectionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnectionType:");
}

id objc_msgSend_setConsumed50PercentImpressions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConsumed50PercentImpressions:");
}

id objc_msgSend_setConsumedImpressions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConsumedImpressions:");
}

id objc_msgSend_setContainerType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContainerType:");
}

id objc_msgSend_setContentData_forIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentData:forIdentifier:");
}

id objc_msgSend_setContentDataIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentDataIdentifier:");
}

id objc_msgSend_setContentDataItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentDataItems:");
}

id objc_msgSend_setContentType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentType:");
}

id objc_msgSend_setContentiAdID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentiAdID:");
}

id objc_msgSend_setContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContext:");
}

id objc_msgSend_setContextFingerprint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContextFingerprint:");
}

id objc_msgSend_setContextIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContextIdentifier:");
}

id objc_msgSend_setContextJSON_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContextJSON:");
}

id objc_msgSend_setContextString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContextString:");
}

id objc_msgSend_setContextWrapper_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContextWrapper:");
}

id objc_msgSend_setContinueLabelForExitDialog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContinueLabelForExitDialog:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setCountryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountryCode:");
}

id objc_msgSend_setCppIds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCppIds:");
}

id objc_msgSend_setCreativeIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCreativeIdentifier:");
}

id objc_msgSend_setCriteriaIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCriteriaIdentifier:");
}

id objc_msgSend_setCtClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCtClient:");
}

id objc_msgSend_setCtSubscriptionContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCtSubscriptionContext:");
}

id objc_msgSend_setCtaButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCtaButton:");
}

id objc_msgSend_setCurrentContentDataItemIdIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentContentDataItemIdIndex:");
}

id objc_msgSend_setCurrentEncryptedIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentEncryptedIDs:");
}

id objc_msgSend_setCurrentIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentIndex:");
}

id objc_msgSend_setCurrentPlaybackTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentPlaybackTime:");
}

id objc_msgSend_setCurrentTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentTimer:");
}

id objc_msgSend_setDPID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDPID:");
}

id objc_msgSend_setDaemonBundleId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDaemonBundleId:");
}

id objc_msgSend_setDaemonRunningTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDaemonRunningTime:");
}

id objc_msgSend_setDarkModeColors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDarkModeColors:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDataAdapters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataAdapters:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDay:");
}

id objc_msgSend_setDecodingFailurePolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDecodingFailurePolicy:");
}

id objc_msgSend_setDefaultStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultStyle:");
}

id objc_msgSend_setDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelay:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDeliverEntireBatch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeliverEntireBatch:");
}

id objc_msgSend_setDeliveryBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeliveryBlock:");
}

id objc_msgSend_setDeliveryStartDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeliveryStartDate:");
}

id objc_msgSend_setDenyExplicit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDenyExplicit:");
}

id objc_msgSend_setDescriptionForLCD_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDescriptionForLCD:");
}

id objc_msgSend_setDesiredPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDesiredPosition:");
}

id objc_msgSend_setDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDestination:");
}

id objc_msgSend_setDevelopmentApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDevelopmentApp:");
}

id objc_msgSend_setDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDevice:");
}

id objc_msgSend_setDeviceIsLocked_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceIsLocked:");
}

id objc_msgSend_setDeviceMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceMode:");
}

id objc_msgSend_setDeviceModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceModel:");
}

id objc_msgSend_setDiagnosticCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiagnosticCode:");
}

id objc_msgSend_setDisableTelephonyMethod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisableTelephonyMethod:");
}

id objc_msgSend_setDisabledColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisabledColor:");
}

id objc_msgSend_setDiscarded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscarded:");
}

id objc_msgSend_setDisclosureRendererPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisclosureRendererPayload:");
}

id objc_msgSend_setDisclosureURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisclosureURL:");
}

id objc_msgSend_setDispatchSourceAccumulation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDispatchSourceAccumulation:");
}

id objc_msgSend_setDispatchSourceInactivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDispatchSourceInactivity:");
}

id objc_msgSend_setDouble_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDouble:forKey:");
}

id objc_msgSend_setDownloadClickTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownloadClickTimestamp:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setElementID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElementID:");
}

id objc_msgSend_setElements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElements:");
}

id objc_msgSend_setEnd_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnd:");
}

id objc_msgSend_setEndCard_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndCard:");
}

id objc_msgSend_setEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnvironment:");
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setError:");
}

id objc_msgSend_setErrorCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setErrorCode:");
}

id objc_msgSend_setErrorDetails_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setErrorDetails:");
}

id objc_msgSend_setErrorMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setErrorMessage:");
}

id objc_msgSend_setEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEvent:");
}

id objc_msgSend_setEventCollectionDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventCollectionDisabled:");
}

id objc_msgSend_setEventSequence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventSequence:");
}

id objc_msgSend_setEventStorageListener_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventStorageListener:");
}

id objc_msgSend_setEventTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventTime:");
}

id objc_msgSend_setEventType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventType:");
}

id objc_msgSend_setExclusionCriteria_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExclusionCriteria:");
}

id objc_msgSend_setExpirationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpirationDate:");
}

id objc_msgSend_setExpirationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpirationHandler:");
}

id objc_msgSend_setExpression_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpression:");
}

id objc_msgSend_setExpressionToEvaluate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpressionToEvaluate:");
}

id objc_msgSend_setFakeNetworkResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFakeNetworkResponse:");
}

id objc_msgSend_setFileSystemToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFileSystemToken:");
}

id objc_msgSend_setFiles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFiles:");
}

id objc_msgSend_setFilesCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFilesCount:");
}

id objc_msgSend_setFirstMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstMessage:");
}

id objc_msgSend_setFoundArtists_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFoundArtists:");
}

id objc_msgSend_setFoundBundleIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFoundBundleIDs:");
}

id objc_msgSend_setFoundGenres_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFoundGenres:");
}

id objc_msgSend_setFpdiSignature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFpdiSignature:");
}

id objc_msgSend_setFrequencyCapData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrequencyCapData:");
}

id objc_msgSend_setGarbageCollector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGarbageCollector:");
}

id objc_msgSend_setGenre_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGenre:");
}

id objc_msgSend_setGracePeriod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGracePeriod:");
}

id objc_msgSend_setGradientOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGradientOrientation:");
}

id objc_msgSend_setHTTPBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPBody:");
}

id objc_msgSend_setHTTPMethod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPMethod:");
}

id objc_msgSend_setHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandler:");
}

id objc_msgSend_setHasBeenOnScreen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasBeenOnScreen:");
}

id objc_msgSend_setHasConfirmed50PercentImpression_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasConfirmed50PercentImpression:");
}

id objc_msgSend_setHasConfirmedClick_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasConfirmedClick:");
}

id objc_msgSend_setHasConfirmedImpression_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasConfirmedImpression:");
}

id objc_msgSend_setHasIsTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasIsTest:");
}

id objc_msgSend_setHasOdml_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasOdml:");
}

id objc_msgSend_setHasRunningLandingPageRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasRunningLandingPageRequest:");
}

id objc_msgSend_setHeaderName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeaderName:");
}

id objc_msgSend_setHeaderValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeaderValue:");
}

id objc_msgSend_setHeaders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeaders:");
}

id objc_msgSend_setHeadline_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeadline:");
}

id objc_msgSend_setHeadlineForLCD_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeadlineForLCD:");
}

id objc_msgSend_setHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeight:");
}

id objc_msgSend_setHighlightColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHighlightColor:");
}

id objc_msgSend_setHighlightedColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHighlightedColor:");
}

id objc_msgSend_setHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHost:");
}

id objc_msgSend_setHour_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHour:");
}

id objc_msgSend_setHttpLookBackWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHttpLookBackWindow:");
}

id objc_msgSend_setHttpLookBackWindowValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHttpLookBackWindowValue:");
}

id objc_msgSend_setHttpMaximumConnectionsPerHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHttpMaximumConnectionsPerHost:");
}

id objc_msgSend_setHttpMaximumConnectionsPerHostTempSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHttpMaximumConnectionsPerHostTempSession:");
}

id objc_msgSend_setHttpMaximumConnectionsPerHostTempSessionValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHttpMaximumConnectionsPerHostTempSessionValue:");
}

id objc_msgSend_setHttpMaximumConnectionsPerHostValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHttpMaximumConnectionsPerHostValue:");
}

id objc_msgSend_setHttpUseFixedHttpSessionManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHttpUseFixedHttpSessionManager:");
}

id objc_msgSend_setHttpUseFixedHttpSessionManagerValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHttpUseFixedHttpSessionManagerValue:");
}

id objc_msgSend_setHumanReadableName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHumanReadableName:");
}

id objc_msgSend_setIAdConversionTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIAdConversionTimestamp:");
}

id objc_msgSend_setIAdID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIAdID:");
}

id objc_msgSend_setIAdImpressionTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIAdImpressionTimestamp:");
}

id objc_msgSend_setIAdJSURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIAdJSURL:");
}

id objc_msgSend_setIAdJSVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIAdJSVersion:");
}

id objc_msgSend_setITunesMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setITunesMetadata:");
}

id objc_msgSend_setITunesStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setITunesStore:");
}

id objc_msgSend_setIdAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdAccount:");
}

id objc_msgSend_setIdDebug_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdDebug:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIgnoreKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIgnoreKeys:");
}

id objc_msgSend_setImpressionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImpressionID:");
}

id objc_msgSend_setImpressionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImpressionIdentifier:");
}

id objc_msgSend_setImpressionIdentifierData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImpressionIdentifierData:");
}

id objc_msgSend_setImpressionSequence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImpressionSequence:");
}

id objc_msgSend_setImpressionThreshold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImpressionThreshold:");
}

id objc_msgSend_setInclusionCriteria_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInclusionCriteria:");
}

id objc_msgSend_setInfos_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInfos:");
}

id objc_msgSend_setInsertOrder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInsertOrder:");
}

id objc_msgSend_setInstallAttribution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInstallAttribution:");
}

id objc_msgSend_setInsufficientPlaybackTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInsufficientPlaybackTime:");
}

id objc_msgSend_setInteger_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteger:forKey:");
}

id objc_msgSend_setIntegrityReportEventListener_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntegrityReportEventListener:");
}

id objc_msgSend_setInterfaceReady_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterfaceReady:");
}

id objc_msgSend_setInterfaceReplaced_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterfaceReplaced:");
}

id objc_msgSend_setInternalContent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInternalContent:");
}

id objc_msgSend_setInternalProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInternalProperties:");
}

id objc_msgSend_setInternalUserWantsProdAds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInternalUserWantsProdAds:");
}

id objc_msgSend_setInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterval:");
}

id objc_msgSend_setIntervalId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntervalId:");
}

id objc_msgSend_setIsCPUIntensive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsCPUIntensive:");
}

id objc_msgSend_setIsCancelled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsCancelled:");
}

id objc_msgSend_setIsLocationAvailableForAd_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsLocationAvailableForAd:");
}

id objc_msgSend_setIsNewObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsNewObject:");
}

id objc_msgSend_setIsPAAvailableForAd_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsPAAvailableForAd:");
}

id objc_msgSend_setIsRepeating_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsRepeating:");
}

id objc_msgSend_setIsRunning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsRunning:");
}

id objc_msgSend_setIsTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsTest:");
}

id objc_msgSend_setIsoCountryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsoCountryCode:");
}

id objc_msgSend_setJourneyRelayAdGroupId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setJourneyRelayAdGroupId:");
}

id objc_msgSend_setJourneyRelayCampaignId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setJourneyRelayCampaignId:");
}

id objc_msgSend_setJsonBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setJsonBody:");
}

id objc_msgSend_setKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKey:");
}

id objc_msgSend_setLanguageIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLanguageIdentifier:");
}

id objc_msgSend_setLastActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastActivity:");
}

id objc_msgSend_setLastGarbageCollected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastGarbageCollected:");
}

id objc_msgSend_setLastModifiedDate_toFile_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastModifiedDate:toFile:error:");
}

id objc_msgSend_setLastPlaybackTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastPlaybackTimestamp:");
}

id objc_msgSend_setLastPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastPosition:");
}

id objc_msgSend_setLastProcessingDate_forDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastProcessingDate:forDestination:");
}

id objc_msgSend_setLastSentEventTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastSentEventTime:");
}

id objc_msgSend_setLastStatusCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastStatusCode:");
}

id objc_msgSend_setLastUpdated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastUpdated:");
}

id objc_msgSend_setLatestCellularSignalStrength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLatestCellularSignalStrength:");
}

id objc_msgSend_setLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLength:");
}

id objc_msgSend_setLightModeColors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLightModeColors:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocaleIdentifier:");
}

id objc_msgSend_setLocality_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocality:");
}

id objc_msgSend_setLocalizedHeadlines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalizedHeadlines:");
}

id objc_msgSend_setLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocation:");
}

id objc_msgSend_setLock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLock:");
}

id objc_msgSend_setLogoImageURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLogoImageURL:");
}

id objc_msgSend_setLookBackWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLookBackWindow:");
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxConcurrentOperationCount:");
}

id objc_msgSend_setMaxObjectLifeTimeDays_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxObjectLifeTimeDays:");
}

id objc_msgSend_setMediaContentHash_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaContentHash:");
}

id objc_msgSend_setMediaFiles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaFiles:");
}

id objc_msgSend_setMediaServiceRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaServiceRequest:");
}

id objc_msgSend_setMediaServiceSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaServiceSession:");
}

id objc_msgSend_setMediaURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaURL:");
}

id objc_msgSend_setMerchant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMerchant:");
}

id objc_msgSend_setMescalSignature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMescalSignature:");
}

id objc_msgSend_setMessageForExitDialog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessageForExitDialog:");
}

id objc_msgSend_setMessageForPurchaseDialog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessageForPurchaseDialog:");
}

id objc_msgSend_setMessageSequence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessageSequence:");
}

id objc_msgSend_setMetaData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetaData:");
}

id objc_msgSend_setMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadata:");
}

id objc_msgSend_setMetric_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetric:");
}

id objc_msgSend_setMetricPurpose_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetricPurpose:");
}

id objc_msgSend_setMetricsCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetricsCount:");
}

id objc_msgSend_setMinCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinCount:");
}

id objc_msgSend_setMinDurationBetweenInstances_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinDurationBetweenInstances:");
}

id objc_msgSend_setMinimumTimeBetweenPresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumTimeBetweenPresentation:");
}

id objc_msgSend_setMinute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinute:");
}

id objc_msgSend_setMockData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMockData:");
}

id objc_msgSend_setMockResponseHeaders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMockResponseHeaders:");
}

id objc_msgSend_setMockResponseStatusCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMockResponseStatusCode:");
}

id objc_msgSend_setMoviesRank_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMoviesRank:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNativeMediaCreativeMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNativeMediaCreativeMetadata:");
}

id objc_msgSend_setNetworkError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNetworkError:");
}

id objc_msgSend_setNetworkInfoUpdatingInProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNetworkInfoUpdatingInProgress:");
}

id objc_msgSend_setNetworkType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNetworkType:");
}

id objc_msgSend_setNumberStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberStyle:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKey_cost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:cost:");
}

id objc_msgSend_setObject_forKey_transaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:transaction:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setObjectSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObjectSize:");
}

id objc_msgSend_setOffsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOffsets:");
}

id objc_msgSend_setOkButtonForPurchaseDialog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOkButtonForPurchaseDialog:");
}

id objc_msgSend_setOldEncryptedIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOldEncryptedIDs:");
}

id objc_msgSend_setOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpacity:");
}

id objc_msgSend_setOperatingSystemDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOperatingSystemDescription:");
}

id objc_msgSend_setOperator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOperator:");
}

id objc_msgSend_setOsBuild_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOsBuild:");
}

id objc_msgSend_setOsPlatform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOsPlatform:");
}

id objc_msgSend_setOsVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOsVersion:");
}

id objc_msgSend_setOsVersionAndBuild_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOsVersionAndBuild:");
}

id objc_msgSend_setOverclickCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverclickCount:");
}

id objc_msgSend_setParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParameters:");
}

id objc_msgSend_setParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParams:");
}

id objc_msgSend_setParent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParent:");
}

id objc_msgSend_setParentAppCheckEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParentAppCheckEnabled:");
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPath:");
}

id objc_msgSend_setPaymentProcessingCertificate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPaymentProcessingCertificate:");
}

id objc_msgSend_setPaymentProcessingURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPaymentProcessingURL:");
}

id objc_msgSend_setPendingConfirmedClick_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPendingConfirmedClick:");
}

id objc_msgSend_setPersistentStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersistentStore:");
}

id objc_msgSend_setPersonalizedAdsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersonalizedAdsEnabled:");
}

id objc_msgSend_setPlacement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlacement:");
}

id objc_msgSend_setPlacementDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlacementDescriptor:");
}

id objc_msgSend_setPlacementType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlacementType:");
}

id objc_msgSend_setPlaybackInProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaybackInProgress:");
}

id objc_msgSend_setPlaybackTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaybackTime:");
}

id objc_msgSend_setPolicyData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPolicyData:");
}

id objc_msgSend_setPolicyValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPolicyValue:");
}

id objc_msgSend_setPositionInformation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPositionInformation:");
}

id objc_msgSend_setPostalCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPostalCode:");
}

id objc_msgSend_setPreparedDataServerDelivery_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreparedDataServerDelivery:");
}

id objc_msgSend_setPreparedUnsignedDataProcessor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreparedUnsignedDataProcessor:");
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPriority:");
}

id objc_msgSend_setPrivacyMarkerPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrivacyMarkerPosition:");
}

id objc_msgSend_setPrivateSegment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrivateSegment:");
}

id objc_msgSend_setProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperties:");
}

id objc_msgSend_setProtocolHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProtocolHandler:");
}

id objc_msgSend_setProvideIgnorableKeyNamesBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProvideIgnorableKeyNamesBlock:");
}

id objc_msgSend_setPurchaseTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPurchaseTimestamp:");
}

id objc_msgSend_setPurpose_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPurpose:");
}

id objc_msgSend_setQToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQToken:");
}

id objc_msgSend_setQualityOfService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQualityOfService:");
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueryItems:");
}

id objc_msgSend_setRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRadius:");
}

id objc_msgSend_setRank_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRank:");
}

id objc_msgSend_setRateLimitRequestsInFeed_inArticle_betweenArticle_videoInArticle_nativeInFeed_nativeInArticle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRateLimitRequestsInFeed:inArticle:betweenArticle:videoInArticle:nativeInFeed:nativeInArticle:");
}

id objc_msgSend_setRateLimits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRateLimits:");
}

id objc_msgSend_setRateLimitsLastUpdatedOn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRateLimitsLastUpdatedOn:");
}

id objc_msgSend_setRateLimitsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRateLimitsObject:");
}

id objc_msgSend_setRawAdFormatType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRawAdFormatType:");
}

id objc_msgSend_setRawAdType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRawAdType:");
}

id objc_msgSend_setReceivedContentDataItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReceivedContentDataItems:");
}

id objc_msgSend_setReceivedReferenceTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReceivedReferenceTime:");
}

id objc_msgSend_setRelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelay:");
}

id objc_msgSend_setRelevantIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelevantIdentifier:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRemovalBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemovalBlock:");
}

id objc_msgSend_setReportDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReportDate:");
}

id objc_msgSend_setRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequest:");
}

id objc_msgSend_setRequestID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestID:");
}

id objc_msgSend_setRequestProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestProperties:");
}

id objc_msgSend_setRequestTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestTimestamp:");
}

id objc_msgSend_setRequesters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequesters:");
}

id objc_msgSend_setRequestsWhileInitializing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestsWhileInitializing:");
}

id objc_msgSend_setRequireClassCData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequireClassCData:");
}

id objc_msgSend_setRequireSleep_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequireSleep:");
}

id objc_msgSend_setRequiresExternalPower_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiresExternalPower:");
}

id objc_msgSend_setRequiresNetworkConnectivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiresNetworkConnectivity:");
}

id objc_msgSend_setRequiresProtectionClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiresProtectionClass:");
}

id objc_msgSend_setRequiresSecureCoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiresSecureCoding:");
}

id objc_msgSend_setResetSegmentMembership_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResetSegmentMembership:");
}

id objc_msgSend_setResourceConnectProxyURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResourceConnectProxyURL:");
}

id objc_msgSend_setResourceProxyURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResourceProxyURL:");
}

id objc_msgSend_setResponseTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResponseTime:");
}

id objc_msgSend_setRetryManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRetryManager:");
}

id objc_msgSend_setRunState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRunState:");
}

id objc_msgSend_setScheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScheme:");
}

id objc_msgSend_setScreenDPI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenDPI:");
}

id objc_msgSend_setScreenHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenHeight:");
}

id objc_msgSend_setScreenScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenScale:");
}

id objc_msgSend_setScreenSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenSize:");
}

id objc_msgSend_setScreenWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenWidth:");
}

id objc_msgSend_setSearchAdClickTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSearchAdClickTimestamp:");
}

id objc_msgSend_setSecond_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecond:");
}

id objc_msgSend_setSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSection:");
}

id objc_msgSend_setSegmentIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSegmentIdentifiers:");
}

id objc_msgSend_setSegmentInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSegmentInfo:");
}

id objc_msgSend_setSelectedCreativeSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedCreativeSize:");
}

id objc_msgSend_setSequenceNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSequenceNumber:");
}

id objc_msgSend_setServerDeliveryTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServerDeliveryTimer:");
}

id objc_msgSend_setServerDeliveryTimerWasRunningWhenPaused_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServerDeliveryTimerWasRunningWhenPaused:");
}

id objc_msgSend_setServerPostStart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServerPostStart:");
}

id objc_msgSend_setServerResponseReceivedTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServerResponseReceivedTimestamp:");
}

id objc_msgSend_setServerUnfilledReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServerUnfilledReason:");
}

id objc_msgSend_setSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSession:");
}

id objc_msgSend_setSetupStartTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSetupStartTime:");
}

id objc_msgSend_setShadowStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowStyle:");
}

id objc_msgSend_setShippingUpdateCertificate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShippingUpdateCertificate:");
}

id objc_msgSend_setShippingUpdateURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShippingUpdateURL:");
}

id objc_msgSend_setSignalStrength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSignalStrength:");
}

id objc_msgSend_setSignature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSignature:");
}

id objc_msgSend_setSigningAuthorityPoolManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSigningAuthorityPoolManager:");
}

id objc_msgSend_setSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSize:");
}

id objc_msgSend_setSkipEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSkipEnabled:");
}

id objc_msgSend_setSkipThreshold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSkipThreshold:");
}

id objc_msgSend_setSlateImageURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSlateImageURL:");
}

id objc_msgSend_setSlotIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSlotIdentifier:");
}

id objc_msgSend_setSlotNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSlotNumber:");
}

id objc_msgSend_setSlotPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSlotPosition:");
}

id objc_msgSend_setSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSource:");
}

id objc_msgSend_setSourceAppAdamId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceAppAdamId:");
}

id objc_msgSend_setSpecification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpecification:");
}

id objc_msgSend_setSponsor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSponsor:");
}

id objc_msgSend_setSponsoredBy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSponsoredBy:");
}

id objc_msgSend_setSponsoredByAssetURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSponsoredByAssetURL:");
}

id objc_msgSend_setSponsoredByAssetURLForDarkMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSponsoredByAssetURLForDarkMode:");
}

id objc_msgSend_setSrcEnumerator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSrcEnumerator:");
}

id objc_msgSend_setStart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStart:");
}

id objc_msgSend_setStartDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartDate:");
}

id objc_msgSend_setStartTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartTime:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:");
}

id objc_msgSend_setStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatus:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setStatusCondition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatusCondition:");
}

id objc_msgSend_setStoreFront_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStoreFront:");
}

id objc_msgSend_setStoreFrontLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStoreFrontLocale:");
}

id objc_msgSend_setStorefront_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStorefront:");
}

id objc_msgSend_setStorefrontID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStorefrontID:");
}

id objc_msgSend_setStream_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStream:");
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStyle:");
}

id objc_msgSend_setSubAdministrativeArea_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubAdministrativeArea:");
}

id objc_msgSend_setSubscriptionSourceID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubscriptionSourceID:");
}

id objc_msgSend_setSuccessCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuccessCount:");
}

id objc_msgSend_setTableDayOfYear_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTableDayOfYear:");
}

id objc_msgSend_setTapAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTapAction:");
}

id objc_msgSend_setTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTarget:");
}

id objc_msgSend_setTargetAppBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTargetAppBundleID:");
}

id objc_msgSend_setTargetAppURLScheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTargetAppURLScheme:");
}

id objc_msgSend_setTargetingDimensions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTargetingDimensions:");
}

id objc_msgSend_setTargetingExpression_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTargetingExpression:");
}

id objc_msgSend_setTargetingExpressionId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTargetingExpressionId:");
}

id objc_msgSend_setTaskCompleted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskCompleted");
}

id objc_msgSend_setTaskExpiredWithRetryAfter_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskExpiredWithRetryAfter:error:");
}

id objc_msgSend_setTelephonyError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTelephonyError:");
}

id objc_msgSend_setTemplateType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTemplateType:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTiltID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTiltID:");
}

id objc_msgSend_setTiltStationBlob_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTiltStationBlob:");
}

id objc_msgSend_setTimeSinceAppResume_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeSinceAppResume:");
}

id objc_msgSend_setTimeSpent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeSpent:");
}

id objc_msgSend_setTimeSpentLegacyInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeSpentLegacyInterface:");
}

id objc_msgSend_setTimeStamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeStamp:");
}

id objc_msgSend_setTimeToDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeToDisplay:");
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeZone:");
}

id objc_msgSend_setTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimestamp:");
}

id objc_msgSend_setTimezone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimezone:");
}

id objc_msgSend_setTitleForExitDialog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleForExitDialog:");
}

id objc_msgSend_setTitleForPurchaseDialog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleForPurchaseDialog:");
}

id objc_msgSend_setToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setToken:");
}

id objc_msgSend_setTokenDaemonEnd_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTokenDaemonEnd:");
}

id objc_msgSend_setTokenDaemonStart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTokenDaemonStart:");
}

id objc_msgSend_setTokenEnd_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTokenEnd:");
}

id objc_msgSend_setTokenStart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTokenStart:");
}

id objc_msgSend_setToroID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setToroID:");
}

id objc_msgSend_setToroId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setToroId:");
}

id objc_msgSend_setTotalCostLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTotalCostLimit:");
}

id objc_msgSend_setTotalDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTotalDuration:");
}

id objc_msgSend_setTotalSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTotalSize:");
}

id objc_msgSend_setTrackingURLSubstitutionParameter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrackingURLSubstitutionParameter:");
}

id objc_msgSend_setTransformationBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransformationBlock:");
}

id objc_msgSend_setTransparencyDetails_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransparencyDetails:");
}

id objc_msgSend_setTransparencyDetailsUnavailableMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransparencyDetailsUnavailableMessage:");
}

id objc_msgSend_setTransparencyRendererPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransparencyRendererPayload:");
}

id objc_msgSend_setTransparencyRendererURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransparencyRendererURL:");
}

id objc_msgSend_setTreatment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTreatment:");
}

id objc_msgSend_setTvshowsRank_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTvshowsRank:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setType:");
}

id objc_msgSend_setURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setURL:");
}

id objc_msgSend_setUnbranded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnbranded:");
}

id objc_msgSend_setUnfilledReasonInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnfilledReasonInfo:");
}

id objc_msgSend_setUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUniqueIdentifier:");
}

id objc_msgSend_setUpMainDatabase(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpMainDatabase");
}

id objc_msgSend_setUpdateCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateCount:");
}

id objc_msgSend_setUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUrl:");
}

id objc_msgSend_setUseAMSMescal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseAMSMescal:");
}

id objc_msgSend_setUseAMSMescalObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseAMSMescalObject:");
}

id objc_msgSend_setUseAMSMescalValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseAMSMescalValue:");
}

id objc_msgSend_setUseFixedHttpSessionManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseFixedHttpSessionManager:");
}

id objc_msgSend_setUserAgent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserAgent:");
}

id objc_msgSend_setUserKeyboards_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserKeyboards:");
}

id objc_msgSend_setUserStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserStatus:");
}

id objc_msgSend_setUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUuid:");
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:");
}

id objc_msgSend_setValue_forColumnName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forColumnName:");
}

id objc_msgSend_setValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forHTTPHeaderField:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setValue_forKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:error:");
}

id objc_msgSend_setValue_forKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKeyPath:");
}

id objc_msgSend_setValueString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValueString:");
}

id objc_msgSend_setValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValues:");
}

id objc_msgSend_setVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVersion:");
}

id objc_msgSend_setVideoEventSequence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideoEventSequence:");
}

id objc_msgSend_setVideoFileURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideoFileURL:");
}

id objc_msgSend_setVideoFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideoFormat:");
}

id objc_msgSend_setVideoSoundCheckData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideoSoundCheckData:");
}

id objc_msgSend_setVideoState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideoState:");
}

id objc_msgSend_setVideoURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideoURL:");
}

id objc_msgSend_setVideoUnloadedSent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideoUnloadedSent:");
}

id objc_msgSend_setVideoVisibility_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideoVisibility:");
}

id objc_msgSend_setViewDayOfYear_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViewDayOfYear:");
}

id objc_msgSend_setVisibilityTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVisibilityTimestamp:");
}

id objc_msgSend_setVisiblePercentage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVisiblePercentage:");
}

id objc_msgSend_setVolume_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVolume:");
}

id objc_msgSend_setWasFullyVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWasFullyVisible:");
}

id objc_msgSend_setWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWidth:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithCapacity:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setX_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setX:");
}

id objc_msgSend_setY_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setY:");
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "settings");
}

id objc_msgSend_setup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setup");
}

id objc_msgSend_setupNegotiationStepDidFinish_certificateIsCached_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupNegotiationStepDidFinish:certificateIsCached:error:");
}

id objc_msgSend_setupQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupQueue");
}

id objc_msgSend_setupStartTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupStartTime");
}

id objc_msgSend_setupWithCompletion_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupWithCompletion:completion:");
}

id objc_msgSend_setupWithTimeout_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupWithTimeout:completion:");
}

id objc_msgSend_sha1(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sha1");
}

id objc_msgSend_sha256(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sha256");
}

id objc_msgSend_sha256hash(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sha256hash");
}

id objc_msgSend_shadowStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shadowStyle");
}

id objc_msgSend_sharedAPNetworkClient(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedAPNetworkClient");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedConnection");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_sharedRepository(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedRepository");
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedScheduler");
}

id objc_msgSend_shelveClosedForChannel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shelveClosedForChannel:");
}

id objc_msgSend_shortCircuitBundleIdentifier_condition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shortCircuitBundleIdentifier:condition:");
}

id objc_msgSend_shouldIgnoreMetric_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldIgnoreMetric:");
}

id objc_msgSend_shouldRotate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldRotate");
}

id objc_msgSend_shouldSendAdSpaceStatusEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldSendAdSpaceStatusEvent:");
}

id objc_msgSend_shouldSignRequestWithMessageId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldSignRequestWithMessageId:");
}

id objc_msgSend_shouldUseAMSMescalWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldUseAMSMescalWithCompletionHandler:");
}

id objc_msgSend_signPayloadWithFpdi_requestTimestamp_interval_jsonBody_startDate_payloadDeliveryStartDate_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signPayloadWithFpdi:requestTimestamp:interval:jsonBody:startDate:payloadDeliveryStartDate:completionHandler:");
}

id objc_msgSend_signPayloadWithMescal_requestTimestamp_interval_jsonBody_startDate_deliveryStartDate_isFallback_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signPayloadWithMescal:requestTimestamp:interval:jsonBody:startDate:deliveryStartDate:isFallback:completionHandler:");
}

id objc_msgSend_signalMonitor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signalMonitor");
}

id objc_msgSend_signalStrength(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signalStrength");
}

id objc_msgSend_signature(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signature");
}

id objc_msgSend_signatureForData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signatureForData:error:");
}

id objc_msgSend_signatureForData_waitTime_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signatureForData:waitTime:completion:");
}

id objc_msgSend_signatureFromData_type_bag_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signatureFromData:type:bag:error:");
}

id objc_msgSend_signatureIsValid_data_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signatureIsValid:data:error:");
}

id objc_msgSend_signatureWithObjCTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signatureWithObjCTypes:");
}

id objc_msgSend_signedAttributionToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signedAttributionToken");
}

id objc_msgSend_signedPathFromUnsigned_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signedPathFromUnsigned:");
}

id objc_msgSend_signingAuthorityPoolManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signingAuthorityPoolManager");
}

id objc_msgSend_signingPercentageFPDI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signingPercentageFPDI");
}

id objc_msgSend_signpostID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signpostID");
}

id objc_msgSend_sinkWithCompletion_receiveInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sinkWithCompletion:receiveInput:");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "size");
}

id objc_msgSend_skipThreshold(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "skipThreshold");
}

id objc_msgSend_sortByRank_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortByRank:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "source");
}

id objc_msgSend_sourceAppAdamId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceAppAdamId");
}

id objc_msgSend_specification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specification");
}

id objc_msgSend_splitCapData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "splitCapData:");
}

id objc_msgSend_sponsoredBy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sponsoredBy");
}

id objc_msgSend_sponsoredByAssetURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sponsoredByAssetURL");
}

id objc_msgSend_sponsoredByAssetURLForDarkMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sponsoredByAssetURLForDarkMode");
}

id objc_msgSend_srcEnumerator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "srcEnumerator");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "start");
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startDate");
}

id objc_msgSend_startDeliveryTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startDeliveryTimer");
}

id objc_msgSend_startDirectory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startDirectory");
}

id objc_msgSend_startGCWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startGCWithCompletionHandler:");
}

id objc_msgSend_startListeners(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startListeners");
}

id objc_msgSend_startMinimumTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startMinimumTimer:");
}

id objc_msgSend_startMonitoring(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startMonitoring");
}

id objc_msgSend_startNextTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startNextTimer");
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startTime");
}

id objc_msgSend_startTimer_withResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startTimer:withResponse:");
}

id objc_msgSend_startWithLegacyInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startWithLegacyInterface:");
}

id objc_msgSend_startWithSession_request_requestorId_intervalId_reportingStorefront_requestTimestamp_daemonStartTime_tokenReturnedToClientDate_payloadDeliveryStartDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startWithSession:request:requestorId:intervalId:reportingStorefront:requestTimestamp:daemonStartTime:tokenReturnedToClientDate:payloadDeliveryStartDate:");
}

id objc_msgSend_startWorkCoordinator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startWorkCoordinator");
}

id objc_msgSend_starting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "starting");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "state");
}

id objc_msgSend_stateLock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateLock");
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "status");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusCode");
}

id objc_msgSend_statusConditionExpression(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusConditionExpression");
}

id objc_msgSend_statusEventSent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusEventSent:");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stop");
}

id objc_msgSend_stopGC(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopGC");
}

id objc_msgSend_stopMonitoring(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopMonitoring");
}

id objc_msgSend_storage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storage");
}

id objc_msgSend_storageClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storageClass");
}

id objc_msgSend_storageLock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storageLock");
}

id objc_msgSend_storageRepresentation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storageRepresentation");
}

id objc_msgSend_storeAdPolicies_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeAdPolicies:");
}

id objc_msgSend_storeDeliveryReportType_dayOfYear_frequency_reportDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeDeliveryReportType:dayOfYear:frequency:reportDate:");
}

id objc_msgSend_storeEntryForContentId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeEntryForContentId:");
}

id objc_msgSend_storeFront(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeFront");
}

id objc_msgSend_storeFrontLocale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeFrontLocale");
}

id objc_msgSend_storeObject_atPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeObject:atPath:error:");
}

id objc_msgSend_storefront(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storefront");
}

id objc_msgSend_storefrontCountryOnly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storefrontCountryOnly:");
}

id objc_msgSend_storefrontOverride(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storefrontOverride");
}

id objc_msgSend_storyboardSizesAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storyboardSizesAtIndex:");
}

id objc_msgSend_storyboardSizesCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storyboardSizesCount");
}

id objc_msgSend_stream(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stream");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathExtension:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByDeletingPathExtension");
}

id objc_msgSend_stringByReplacingCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingCharactersInRange:withString:");
}

id objc_msgSend_stringByReplacingMatchesInString_options_range_withTemplate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingMatchesInString:options:range:withTemplate:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringForMetric_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForMetric:");
}

id objc_msgSend_stringFromByteCount_countStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromByteCount:countStyle:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithValidatedFormat:validFormatSpecifiers:error:");
}

id objc_msgSend_stringsToColorArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringsToColorArray:");
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "style");
}

id objc_msgSend_subAdminArea(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subAdminArea");
}

id objc_msgSend_subAdministrativeArea(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subAdministrativeArea");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_subdataWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subdataWithRange:");
}

id objc_msgSend_submitReport(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitReport");
}

id objc_msgSend_submitTaskRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitTaskRequest:error:");
}

id objc_msgSend_subscribeForDictMessage_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribeForDictMessage:handler:");
}

id objc_msgSend_subscribeForMessage_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribeForMessage:handler:");
}

id objc_msgSend_subscriptionSourceID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscriptionSourceID");
}

id objc_msgSend_subscriptionType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscriptionType");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_successCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "successCount");
}

id objc_msgSend_supplementalContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supplementalContext");
}

id objc_msgSend_supportedPaymentNetworksAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportedPaymentNetworksAtIndex:");
}

id objc_msgSend_supportedPaymentNetworksCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportedPaymentNetworksCount");
}

id objc_msgSend_syncRequestsLock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncRequestsLock");
}

id objc_msgSend_systemDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemDescription");
}

id objc_msgSend_systemName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemName");
}

id objc_msgSend_systemVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemVersion");
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "table");
}

id objc_msgSend_tableDayOfYear(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableDayOfYear");
}

id objc_msgSend_tagTransformationsAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tagTransformationsAtIndex:");
}

id objc_msgSend_tagTransformationsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tagTransformationsCount");
}

id objc_msgSend_tagsAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tagsAtIndex:");
}

id objc_msgSend_tagsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tagsCount");
}

id objc_msgSend_tapAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tapAction");
}

id objc_msgSend_targetingDimensions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "targetingDimensions");
}

id objc_msgSend_targetingExpression(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "targetingExpression");
}

id objc_msgSend_targetingExpressionId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "targetingExpressionId");
}

id objc_msgSend_taskRequestForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskRequestForIdentifier:");
}

id objc_msgSend_telephony(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "telephony");
}

id objc_msgSend_telephonyError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "telephonyError");
}

id objc_msgSend_temporarySessionForClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "temporarySessionForClient:");
}

id objc_msgSend_terminateConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "terminateConnection");
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "text");
}

id objc_msgSend_textColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textColor");
}

id objc_msgSend_theConfigurationAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "theConfigurationAtIndex:");
}

id objc_msgSend_theConfigurationsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "theConfigurationsCount");
}

id objc_msgSend_tiltStationBlob(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tiltStationBlob");
}

id objc_msgSend_tiltTrackBlobAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tiltTrackBlobAtIndex:");
}

id objc_msgSend_tiltTrackBlobs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tiltTrackBlobs");
}

id objc_msgSend_tiltTrackBlobsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tiltTrackBlobsCount");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeSincePrevLaunch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeSincePrevLaunch");
}

id objc_msgSend_timeSpent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeSpent");
}

id objc_msgSend_timeSpentLegacyInterface(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeSpentLegacyInterface");
}

id objc_msgSend_timeSpentMetricTTL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeSpentMetricTTL");
}

id objc_msgSend_timeSpentProcessor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeSpentProcessor");
}

id objc_msgSend_timeZoneWithAbbreviation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeZoneWithAbbreviation:");
}

id objc_msgSend_timeZoneWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeZoneWithName:");
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timestamp");
}

id objc_msgSend_toJSONObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toJSONObject");
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "token");
}

id objc_msgSend_tokenCount_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tokenCount:error:");
}

id objc_msgSend_tokenDaemonStart(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tokenDaemonStart");
}

id objc_msgSend_tokenPayloadDeliveryStartTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tokenPayloadDeliveryStartTime");
}

id objc_msgSend_tokenReturnedToClientDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tokenReturnedToClientDate");
}

id objc_msgSend_tokenService(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tokenService");
}

id objc_msgSend_tokenWithDetail_interval_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tokenWithDetail:interval:completionHandler:");
}

id objc_msgSend_tokens(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tokens");
}

id objc_msgSend_tokensLock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tokensLock");
}

id objc_msgSend_toroID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toroID");
}

id objc_msgSend_toroId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toroId");
}

id objc_msgSend_totalSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "totalSize");
}

id objc_msgSend_touch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "touch");
}

id objc_msgSend_touchFileAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "touchFileAtPath:error:");
}

id objc_msgSend_touchObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "touchObjectForKey:");
}

id objc_msgSend_touchObjectForKey_transaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "touchObjectForKey:transaction:");
}

id objc_msgSend_trace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trace");
}

id objc_msgSend_trackingURLAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackingURLAtIndex:");
}

id objc_msgSend_trackingURLsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackingURLsCount");
}

id objc_msgSend_transformationBlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transformationBlock");
}

id objc_msgSend_transformedContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transformedContext");
}

id objc_msgSend_transformedContextJSON_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transformedContextJSON:");
}

id objc_msgSend_transientContent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transientContent");
}

id objc_msgSend_transientDataDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transientDataDidChange");
}

id objc_msgSend_translate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "translate:");
}

id objc_msgSend_translateResponse_requestParams_responseReceivedTimestamp_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "translateResponse:requestParams:responseReceivedTimestamp:error:");
}

id objc_msgSend_translateWithPromotedContent_placement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "translateWithPromotedContent:placement:");
}

id objc_msgSend_transmitter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transmitter");
}

id objc_msgSend_transparencyDetails(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transparencyDetails");
}

id objc_msgSend_transparencyRendererPayload(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transparencyRendererPayload");
}

id objc_msgSend_transparencyRendererURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transparencyRendererURL");
}

id objc_msgSend_treatment(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "treatment");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "type");
}

id objc_msgSend_uRLsToEvictAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uRLsToEvictAtIndex:");
}

id objc_msgSend_uRLsToEvictsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uRLsToEvictsCount");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_underlyingErrors(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "underlyingErrors");
}

id objc_msgSend_unencryptedIAdID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unencryptedIAdID");
}

id objc_msgSend_unfilledReasonCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unfilledReasonCode");
}

id objc_msgSend_unfilledReasonCodeToASEStatusCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unfilledReasonCodeToASEStatusCode:");
}

id objc_msgSend_unfilledReasonInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unfilledReasonInfo");
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uniqueIdentifier");
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unlock");
}

id objc_msgSend_unlockObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unlockObject");
}

id objc_msgSend_unsavedReferences(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsavedReferences");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unused(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unused");
}

id objc_msgSend_updateCellularSignalStrength(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCellularSignalStrength");
}

id objc_msgSend_updateClientBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateClientBundleID:");
}

id objc_msgSend_updateConfigurationSystemWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateConfigurationSystemWithData:");
}

id objc_msgSend_updateCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCount");
}

id objc_msgSend_updateTelephonyProperties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTelephonyProperties");
}

id objc_msgSend_uploadFailureWithType_code_batchIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uploadFailureWithType:code:batchIDs:");
}

id objc_msgSend_uploadSuccess(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uploadSuccess");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uppercaseString");
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "url");
}

id objc_msgSend_useAMSBag(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "useAMSBag");
}

id objc_msgSend_useAMSBagValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "useAMSBagValue");
}

id objc_msgSend_useAMSMescal(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "useAMSMescal");
}

id objc_msgSend_useAMSMescalObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "useAMSMescalObject");
}

id objc_msgSend_useAMSMescalValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "useAMSMescalValue");
}

id objc_msgSend_userAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userAccount");
}

id objc_msgSend_userAgent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userAgent");
}

id objc_msgSend_userAgentStringForBundleID_storefront_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userAgentStringForBundleID:storefront:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userKeyboardAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userKeyboardAtIndex:");
}

id objc_msgSend_userKeyboardsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userKeyboardsCount");
}

id objc_msgSend_userStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userStatus");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uuid");
}

id objc_msgSend_valid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valid");
}

id objc_msgSend_validClassInputs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validClassInputs");
}

id objc_msgSend_validate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validate");
}

id objc_msgSend_validateCurrent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateCurrent");
}

id objc_msgSend_validateName_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateName:error:");
}

id objc_msgSend_validateWhitelistingForCondition_forBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateWhitelistingForCondition:forBundleIdentifier:");
}

id objc_msgSend_validateWhitelistingForRead_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateWhitelistingForRead:");
}

id objc_msgSend_validationErrorWithCode_andReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validationErrorWithCode:andReason:");
}

id objc_msgSend_validationFailed_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validationFailed:reason:");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "value");
}

id objc_msgSend_valueBool(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueBool");
}

id objc_msgSend_valueDouble(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueDouble");
}

id objc_msgSend_valueForColumnName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForColumnName:");
}

id objc_msgSend_valueForHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForHTTPHeaderField:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueForKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:error:");
}

id objc_msgSend_valueForKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKeyPath:");
}

id objc_msgSend_valueInt(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueInt");
}

id objc_msgSend_valuePromise(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valuePromise");
}

id objc_msgSend_valueString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueString");
}

id objc_msgSend_valueTranslated_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueTranslated:forKey:");
}

id objc_msgSend_valueWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithCompletion:");
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "version");
}

id objc_msgSend_versionedAttributionDetailsAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "versionedAttributionDetailsAtIndex:");
}

id objc_msgSend_versionedAttributionDetailsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "versionedAttributionDetailsCount");
}

id objc_msgSend_videoAssetAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "videoAssetAtIndex:");
}

id objc_msgSend_videoAssetsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "videoAssetsCount");
}

id objc_msgSend_videoEventSequence(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "videoEventSequence");
}

id objc_msgSend_videoLoaded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "videoLoaded:");
}

id objc_msgSend_videoState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "videoState");
}

id objc_msgSend_videoStateChanged_fromMetric_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "videoStateChanged:fromMetric:");
}

id objc_msgSend_videoUnloaded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "videoUnloaded");
}

id objc_msgSend_videoUnloadedSent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "videoUnloadedSent");
}

id objc_msgSend_videoVisibility(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "videoVisibility");
}

id objc_msgSend_viewDayOfYear(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewDayOfYear");
}

id objc_msgSend_visibilityTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visibilityTimestamp");
}

id objc_msgSend_visiblePercent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visiblePercent");
}

id objc_msgSend_visibleStateChanged_duration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visibleStateChanged:duration:");
}

id objc_msgSend_volume(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "volume");
}

id objc_msgSend_volumeChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "volumeChanged:");
}

id objc_msgSend_wasFullyVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wasFullyVisible");
}

id objc_msgSend_weakObjectsPointerArray(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "weakObjectsPointerArray");
}

id objc_msgSend_weakToWeakObjectsMapTable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "weakToWeakObjectsMapTable");
}

id objc_msgSend_whitelistingsDisabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "whitelistingsDisabled");
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "width");
}

id objc_msgSend_willUploadWithBatchCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willUploadWithBatchCount:");
}

id objc_msgSend_withdrawShelvedBatchesForChannel_groupBatches_withSaveObjectBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "withdrawShelvedBatchesForChannel:groupBatches:withSaveObjectBlock:");
}

id objc_msgSend_workBlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "workBlock");
}

id objc_msgSend_wrapper(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wrapper");
}

id objc_msgSend_writable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writable");
}

id objc_msgSend_writeData_toFile_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeData:toFile:error:");
}

id objc_msgSend_writeTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeTo:");
}

id objc_msgSend_writeToFile_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:atomically:encoding:error:");
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:options:error:");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:options:error:");
}

id objc_msgSend_yearDayOfYearHourMinute(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "yearDayOfYearHourMinute");
}

