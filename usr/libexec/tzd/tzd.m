void sub_1000054B0(id a1)
{
  void *v1;

  v1 = (void *)qword_100026050;
  qword_100026050 = (uint64_t)&off_100021A58;

}

uint64_t sub_1000055AC(uint64_t a1, uint64_t a2)
{
  char v4;
  unsigned int v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  int v10;
  uint64_t String;
  uint64_t v13;
  void *v14;
  uint64_t result;

  while (*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
      break;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    while (1)
    {
      v7 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
        break;
      v8 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0)
        goto LABEL_11;
      v4 += 7;
      if (v5++ >= 9)
      {
        LODWORD(v6) = 0;
        v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
      LODWORD(v6) = 0;
LABEL_13:
    if (v10 || (v6 & 7) == 4)
      break;
    if ((v6 & 0x7FFF8) == 8)
    {
      String = PBReaderReadString(a2);
      v13 = objc_claimAutoreleasedReturnValue(String);
      v14 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v13;

    }
    else
    {
      result = PBReaderSkipValueWithTag(a2, (unsigned __int16)(v6 >> 3));
      if (!(_DWORD)result)
        return result;
    }
  }
  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

int main(int argc, const char **argv, const char **envp)
{
  if (qword_100025830 != -1)
    swift_once(&qword_100025830, sub_100013B30);
  sub_100013E44();
  return 0;
}

void type metadata accessor for MAAssetState(uint64_t a1)
{
  sub_100005B70(a1, &qword_100025888, (uint64_t)&unk_100020B68);
}

void type metadata accessor for MAPurgeResult(uint64_t a1)
{
  sub_100005B70(a1, &qword_100025890, (uint64_t)&unk_100020B88);
}

void type metadata accessor for MAQueryResult(uint64_t a1)
{
  sub_100005B70(a1, &qword_100025898, (uint64_t)&unk_100020BA8);
}

void type metadata accessor for MADownloadResult(uint64_t a1)
{
  sub_100005B70(a1, &qword_1000258A0, (uint64_t)&unk_100020BC8);
}

BOOL sub_100005978(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_10000598C(uint64_t a1, uint64_t a2)
{
  return sub_100005DF0(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_1000059A0(uint64_t a1, uint64_t a2)
{
  return sub_100005DF0(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_1000059B8(uint64_t a1, id *a2)
{
  uint64_t result;
  uint64_t v5;
  NSString v6;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  result = static String._forceBridgeFromObjectiveC(_:result:)(a1, &v7);
  v5 = v8;
  if (v8)
  {
    v6 = String._bridgeToObjectiveC()();
    result = swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return result;
}

uint64_t sub_100005A2C(uint64_t a1, id *a2)
{
  char v4;
  uint64_t v5;
  NSString v6;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v8);
  v5 = v9;
  if (v9)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return v4 & 1;
}

uint64_t sub_100005AA8@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  uint64_t result;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v3);
  *a1 = v4;
  return result;
}

_QWORD *sub_100005AE8@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_100005AF8(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

void sub_100005B04(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_100005B10@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_100005B20@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void type metadata accessor for FileProtectionType(uint64_t a1)
{
  sub_100005B70(a1, &qword_100025908, (uint64_t)&unk_100020BE8);
}

void type metadata accessor for FileAttributeKey(uint64_t a1)
{
  sub_100005B70(a1, &qword_100025910, (uint64_t)&unk_100020C10);
}

void sub_100005B70(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v5;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, a3);
    if (!v5)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_100005BB4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100005C90(&qword_100025958, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_10001B100);
  v3 = sub_100005C90((unint64_t *)&unk_100025960, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_10001AEFC);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100005C38()
{
  return sub_100005C90(&qword_100025918, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_10001AEC0);
}

uint64_t sub_100005C64()
{
  return sub_100005C90(&qword_100025920, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_10001AE94);
}

uint64_t sub_100005C90(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100005CD0@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  NSString v4;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_100005D14(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100005C90(&qword_100025948, (uint64_t (*)(uint64_t))type metadata accessor for FileProtectionType, (uint64_t)&unk_10001B070);
  v3 = sub_100005C90(&qword_100025950, (uint64_t (*)(uint64_t))type metadata accessor for FileProtectionType, (uint64_t)&unk_10001B010);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100005D98()
{
  return sub_100005C90(&qword_100025928, (uint64_t (*)(uint64_t))type metadata accessor for FileProtectionType, (uint64_t)&unk_10001AFD4);
}

uint64_t sub_100005DC4()
{
  return sub_100005C90(&qword_100025930, (uint64_t (*)(uint64_t))type metadata accessor for FileProtectionType, (uint64_t)&unk_10001AFA8);
}

uint64_t sub_100005DF0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
  v7 = v6;
  v8 = a3(v5);
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_100005E2C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_100005E6C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::Int v6;
  _QWORD v8[9];

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_100005EDC(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;

  v2 = *a2;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*a1);
  v5 = v4;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  if (v3 == v6 && v5 == v7)
  {
    v10 = 1;
    v9 = v5;
  }
  else
  {
    v9 = v7;
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0);
  }
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

uint64_t sub_100005F64()
{
  return sub_100005C90(&qword_100025938, (uint64_t (*)(uint64_t))type metadata accessor for FileProtectionType, (uint64_t)&unk_10001B044);
}

uint64_t sub_100005F90()
{
  return sub_100005C90(&qword_100025940, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_10001AF30);
}

uint64_t initializeBufferWithCopyOfBuffer for TZInfo(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for TZInfo(_QWORD *a1)
{
  swift_bridgeObjectRelease(a1[1]);
  swift_bridgeObjectRelease(a1[3]);
  swift_bridgeObjectRelease(a1[5]);
  return swift_bridgeObjectRelease(a1[6]);
}

uint64_t initializeWithCopy for TZInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 48) = v6;
  *(_WORD *)(a1 + 56) = *(_WORD *)(a2 + 56);
  ((void (*)(void))swift_bridgeObjectRetain)();
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  return a1;
}

uint64_t assignWithCopy for TZInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 48) = v11;
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRelease(v10);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_BYTE *)(a1 + 57) = *(_BYTE *)(a2 + 57);
  return a1;
}

__n128 initializeWithTake for TZInfo(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 42) = *(_OWORD *)(a2 + 42);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for TZInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  swift_bridgeObjectRelease(v7);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 40));
  v8 = *(_QWORD *)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease(v8);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_BYTE *)(a1 + 57) = *(_BYTE *)(a2 + 57);
  return a1;
}

uint64_t getEnumTagSinglePayload for TZInfo(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 58))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TZInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 56) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 58) = 1;
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
    *(_BYTE *)(result + 58) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TZInfo()
{
  return &type metadata for TZInfo;
}

uint64_t sub_10000628C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  BOOL v5;
  BOOL v6;
  Swift::String v7;
  Swift::String v8;

  v1 = *v0;
  v2 = v0[1];
  v4 = v0[2];
  v3 = (void *)v0[3];
  if (*v0)
    v5 = 0;
  else
    v5 = v2 == 0xE000000000000000;
  if (v5 || (_stringCompareWithSmolCheck(_:_:expecting:)(0, 0xE000000000000000, *v0, v0[1], 0) & 1) != 0)
  {
    v6 = !v4 && v3 == (void *)0xE000000000000000;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)(0, 0xE000000000000000, v4, v3, 0) & 1) != 0)
      return 0;
  }
  if (!v4 && v3 == (void *)0xE000000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0, 0xE000000000000000, v4, v3, 0) & 1) != 0)
  {
    swift_bridgeObjectRetain(v2);
  }
  else
  {
    swift_bridgeObjectRetain(v2);
    v7._countAndFlagsBits = 46;
    v7._object = (void *)0xE100000000000000;
    String.append(_:)(v7);
    swift_bridgeObjectRetain(v3);
    v8._countAndFlagsBits = v4;
    v8._object = v3;
    String.append(_:)(v8);
    swift_bridgeObjectRelease(v3);
  }
  return v1;
}

id sub_1000063A8(uint64_t a1)
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

  v2 = v1;
  URL._bridgeToObjectiveC()(__stack_chk_guard);
  v5 = v4;
  v14 = 0;
  v6 = objc_msgSend(v2, "initWithContentsOfURL:error:", v4, &v14);

  v7 = v14;
  if (v6)
  {
    v8 = type metadata accessor for URL(0);
    v9 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8);
    v10 = v7;
    v9(a1, v8);
  }
  else
  {
    v11 = v14;
    _convertNSErrorToError(_:)(v7);

    swift_willThrow();
    v12 = type metadata accessor for URL(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(a1, v12);
  }
  return v6;
}

uint64_t sub_1000064B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  id v20;
  unsigned __int16 v21;
  unint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  NSURL *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  unint64_t v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[24];
  uint64_t v58;

  sub_100007280((uint64_t *)&unk_100025AF0);
  ((void (*)(void))__chkstk_darwin)();
  v5 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  v10 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v47 - v11;
  sub_1000072C0(a1, (uint64_t)v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
  {
    v52 = a1;
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v5, v6);
    URL.appendingPathComponent(_:)(0x736E6F6973726576, 0xEE007473696C702ELL);
    v24 = objc_allocWithZone((Class)NSDictionary);
    v25 = sub_1000063A8((uint64_t)v10);
    *(_QWORD *)&v55 = 0x7372655661746144;
    *((_QWORD *)&v55 + 1) = 0xEB000000006E6F69;
    v26 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v55, &type metadata for String);
    v27 = objc_msgSend(v25, "__swift_objectForKeyedSubscript:", v26);
    swift_unknownObjectRelease(v26);
    if (v27)
    {
      _bridgeAnyObjectToAny(_:)(&v55, v27);
      swift_unknownObjectRelease(v27);
    }
    else
    {
      v55 = 0u;
      v56 = 0u;
    }
    sub_100007348((uint64_t)&v55, (uint64_t)v57, (uint64_t *)&unk_100025CD0);
    v51 = v7;
    if (v58)
    {
      v28 = swift_dynamicCast(&v53, v57, (char *)&type metadata for Any + 8, &type metadata for String, 6);
      if ((v28 & 1) == 0)
        goto LABEL_22;
      v14 = (uint64_t)v53;
      v16 = v54;
      strcpy((char *)&v55, "BundleVersion");
      HIWORD(v55) = -4864;
      v29 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v55, &type metadata for String);
      v30 = objc_msgSend(v25, "__swift_objectForKeyedSubscript:", v29);
      swift_unknownObjectRelease(v29);
      if (v30)
      {
        _bridgeAnyObjectToAny(_:)(&v55, v30);
        swift_unknownObjectRelease(v30);
      }
      else
      {
        v55 = 0u;
        v56 = 0u;
      }
      sub_100007348((uint64_t)&v55, (uint64_t)v57, (uint64_t *)&unk_100025CD0);
      if (v58)
      {
        if ((swift_dynamicCast(&v53, v57, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
        {
          v31 = v25;
          v23 = (uint64_t)v53;
          v22 = v54;
          *(_QWORD *)&v55 = 0xD000000000000012;
          *((_QWORD *)&v55 + 1) = 0x800000010001B640;
          v32 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v55, &type metadata for String);
          v50 = v31;
          v33 = objc_msgSend(v31, "__swift_objectForKeyedSubscript:", v32);
          swift_unknownObjectRelease(v32);
          if (v33)
          {
            _bridgeAnyObjectToAny(_:)(&v55, v33);
            swift_unknownObjectRelease(v33);
          }
          else
          {
            v55 = 0u;
            v56 = 0u;
          }
          sub_100007348((uint64_t)&v55, (uint64_t)v57, (uint64_t *)&unk_100025CD0);
          if (v58)
          {
            if ((swift_dynamicCast(&v53, v57, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
            {
              v49 = v6;
              v17 = (uint64_t)v53;
              v18 = v54;
              *(_QWORD *)&v55 = 0x6E6F5A7472656C41;
              *((_QWORD *)&v55 + 1) = 0xEA00000000007365;
              v42 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v55, &type metadata for String);
              v43 = objc_msgSend(v50, "__swift_objectForKeyedSubscript:", v42);
              swift_unknownObjectRelease(v42);
              if (v43)
              {
                _bridgeAnyObjectToAny(_:)(&v55, v43);
                swift_unknownObjectRelease(v43);
              }
              else
              {
                v55 = 0u;
                v56 = 0u;
              }
              sub_100007348((uint64_t)&v55, (uint64_t)v57, (uint64_t *)&unk_100025CD0);
              if (v58)
              {
                v44 = sub_100007280(&qword_100025A00);
                if ((swift_dynamicCast(&v53, v57, (char *)&type metadata for Any + 8, v44, 6) & 1) == 0)
                {
LABEL_45:
                  swift_bridgeObjectRelease(v18);
                  swift_bridgeObjectRelease(v22);
                  v28 = swift_bridgeObjectRelease(v16);
                  goto LABEL_46;
                }
                v20 = v53;
                strcpy((char *)&v55, "ShouldAlertAll");
                HIBYTE(v55) = -18;
                v48 = (id)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v55, &type metadata for String);
                v45 = objc_msgSend(v50, "__swift_objectForKeyedSubscript:", v48);
                swift_unknownObjectRelease(v48);
                if (v45)
                {
                  _bridgeAnyObjectToAny(_:)(&v55, v45);
                  swift_unknownObjectRelease(v45);
                }
                else
                {
                  v55 = 0u;
                  v56 = 0u;
                }
                sub_100007348((uint64_t)&v55, (uint64_t)v57, (uint64_t *)&unk_100025CD0);
                if (v58)
                {
                  v46 = sub_10000738C(0, &qword_100025A08, NSNumber_ptr);
                  if ((swift_dynamicCast(&v53, v57, (char *)&type metadata for Any + 8, v46, 6) & 1) != 0)
                  {
                    v48 = v53;
                    v21 = (unsigned __int16)objc_msgSend(v53, "BOOLValue");

                    sub_1000077AC(v52, (uint64_t *)&unk_100025AF0);
                    result = (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v12, v49);
                    goto LABEL_24;
                  }
                  swift_bridgeObjectRelease(v20);
                  goto LABEL_45;
                }
                swift_bridgeObjectRelease(v20);
              }
              swift_bridgeObjectRelease(v18);
              swift_bridgeObjectRelease(v22);
              swift_bridgeObjectRelease(v16);
              v28 = sub_1000077AC((uint64_t)v57, (uint64_t *)&unk_100025CD0);
LABEL_46:
              v6 = v49;
              v25 = v50;
              goto LABEL_22;
            }
            swift_bridgeObjectRelease(v22);
            v28 = swift_bridgeObjectRelease(v16);
            v25 = v50;
          }
          else
          {
            swift_bridgeObjectRelease(v22);
            swift_bridgeObjectRelease(v16);
            v28 = sub_1000077AC((uint64_t)v57, (uint64_t *)&unk_100025CD0);
            v25 = v50;
          }
        }
        else
        {
          v28 = swift_bridgeObjectRelease(v16);
        }
LABEL_22:
        v34 = static os_log_type_t.error.getter(v28);
        v35 = sub_100007280(&qword_1000259D8);
        v36 = swift_allocObject(v35, 112, 7);
        *(_OWORD *)(v36 + 16) = xmmword_10001B160;
        *(_QWORD *)(v36 + 56) = sub_10000738C(0, &qword_1000259F0, NSDictionary_ptr);
        *(_QWORD *)(v36 + 64) = sub_100007308(&qword_1000259F8, &qword_1000259F0, NSDictionary_ptr);
        *(_QWORD *)(v36 + 32) = v25;
        v37 = v25;
        URL._bridgeToObjectiveC()(v38);
        v40 = v39;
        *(_QWORD *)(v36 + 96) = sub_10000738C(0, (unint64_t *)&unk_100025D50, NSURL_ptr);
        *(_QWORD *)(v36 + 104) = sub_100007308(&qword_1000259E0, (unint64_t *)&unk_100025D50, NSURL_ptr);
        *(_QWORD *)(v36 + 72) = v40;
        sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
        v41 = (void *)static OS_os_log.default.getter();
        os_log(_:dso:log:type:_:)("Version plist %{public}@ fetched from %{public}@ is invalid", 59, 2, &_mh_execute_header, v41, v34, v36);

        swift_bridgeObjectRelease(v36);
        sub_1000077AC(v52, (uint64_t *)&unk_100025AF0);
        result = (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v12, v6);
        v14 = 0;
        v16 = 0;
        v23 = 0;
        v22 = 0;
        v17 = 0;
        v18 = 0;
        goto LABEL_23;
      }
      swift_bridgeObjectRelease(v16);
    }
    v28 = sub_1000077AC((uint64_t)v57, (uint64_t *)&unk_100025CD0);
    goto LABEL_22;
  }
  sub_1000077AC((uint64_t)v5, (uint64_t *)&unk_100025AF0);
  v13 = objc_msgSend((id)objc_opt_self(NSTimeZone), "timeZoneDataVersion");
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
  v16 = v15;

  if (qword_100025880 != -1)
    swift_once(&qword_100025880, sub_100019E48);
  v17 = qword_100026B98;
  v18 = qword_100026BA0;
  swift_bridgeObjectRetain(qword_100026BA0);
  result = sub_1000077AC(a1, (uint64_t *)&unk_100025AF0);
  if (!v18)
  {
    swift_bridgeObjectRelease(0xE300000000000000);
    result = swift_bridgeObjectRelease(v16);
    v14 = 0;
    v16 = 0;
    v23 = 0;
    v22 = 0;
    v17 = 0;
LABEL_23:
    v20 = 0;
    v21 = 0;
    goto LABEL_24;
  }
  v20 = 0;
  v21 = 256;
  v22 = 0xE300000000000000;
  v23 = 3157553;
LABEL_24:
  *(_QWORD *)a2 = v14;
  *(_QWORD *)(a2 + 8) = v16;
  *(_QWORD *)(a2 + 16) = v23;
  *(_QWORD *)(a2 + 24) = v22;
  *(_QWORD *)(a2 + 32) = v17;
  *(_QWORD *)(a2 + 40) = v18;
  *(_QWORD *)(a2 + 48) = v20;
  *(_WORD *)(a2 + 56) = v21;
  return result;
}

void sub_100006EE0(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  id v9;
  NSString v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  uint64_t v33;
  _BYTE v35[64];
  id v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  char v43;
  char v44;

  v2 = type metadata accessor for URL(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = &v35[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = sub_100007280((uint64_t *)&unk_100025AF0);
  __chkstk_darwin(v6);
  v8 = &v35[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v9 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  if (qword_100025870 != -1)
    swift_once(&qword_100025870, sub_100019D40);
  v10 = String._bridgeToObjectiveC()();
  v36 = 0;
  v11 = objc_msgSend(v9, "destinationOfSymbolicLinkAtPath:error:", v10, &v36);

  v12 = v36;
  if (!v11)
  {
    v17 = v36;
    v18 = _convertNSErrorToError(_:)(v12);

    swift_willThrow();
    v19 = swift_errorRelease(v18);
    v20 = static os_log_type_t.fault.getter(v19);
    sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
    v21 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)("Unable to determine current time zone version info; zoneinfo symlink broken",
      75,
      2,
      &_mh_execute_header,
      v21,
      v20,
      &_swiftEmptyArrayStorage);
LABEL_15:

    v25 = 0;
    v26 = 0;
    v28 = 0;
    v30 = 0;
    v32 = 0;
    v31 = 0;
    v24 = 0xE000000000000000;
    v27 = 0xE000000000000000;
    v29 = 0xE000000000000000;
    goto LABEL_16;
  }
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
  v15 = v14;
  v16 = v12;

  if (qword_100025840 != -1)
    swift_once(&qword_100025840, sub_100019A58);
  if (v13 == qword_100026B18 && v15 == qword_100026B20
    || (_stringCompareWithSmolCheck(_:_:expecting:)(v13, v15, qword_100026B18, qword_100026B20, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(v15);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v8, 1, 1, v2);
  }
  else
  {
    URL.init(fileURLWithPath:)(v13, v15);
    v22 = swift_bridgeObjectRelease(v15);
    URL.deletingLastPathComponent()(v22);
    (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v3 + 56))(v8, 0, 1, v2);
  }
  sub_1000064B0((uint64_t)v8, (uint64_t)v35);
  v23 = sub_100007348((uint64_t)v35, (uint64_t)&v36, (uint64_t *)&unk_100025FF0);
  v24 = v37;
  if (!v37)
  {
    v33 = static os_log_type_t.error.getter(v23);
    sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
    v21 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)("Unable to determine current time zone version info", 50, 2, &_mh_execute_header, v21, v33, &_swiftEmptyArrayStorage);
    goto LABEL_15;
  }
  v25 = v36;
  v26 = v38;
  v27 = v39;
  v28 = v40;
  v29 = v41;
  v30 = v42;
  v31 = v44 & 1;
  v32 = v43 & 1;
LABEL_16:
  *(_QWORD *)a1 = v25;
  *(_QWORD *)(a1 + 8) = v24;
  *(_QWORD *)(a1 + 16) = v26;
  *(_QWORD *)(a1 + 24) = v27;
  *(_QWORD *)(a1 + 32) = v28;
  *(_QWORD *)(a1 + 40) = v29;
  *(_QWORD *)(a1 + 48) = v30;
  *(_BYTE *)(a1 + 56) = v32;
  *(_BYTE *)(a1 + 57) = v31;
}

uint64_t sub_100007280(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000072C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100007280((uint64_t *)&unk_100025AF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100007308(unint64_t *a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_10000738C(255, a2, a3);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100007348(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100007280(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000738C(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a2;
  if (!*a2)
  {
    v5 = objc_opt_self(*a3);
    result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_1000073C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  NSString v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t result;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;
  _OWORD v23[3];
  uint64_t v24;
  __int16 v25;

  v2 = sub_100007280((uint64_t *)&unk_100025AF0);
  __chkstk_darwin(v2);
  v4 = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  if (qword_100025858 != -1)
    swift_once(&qword_100025858, sub_100019B94);
  v6 = String._bridgeToObjectiveC()();
  *(_QWORD *)&v23[0] = 0;
  v7 = objc_msgSend(v5, "destinationOfSymbolicLinkAtPath:error:", v6, v23);

  v8 = *(void **)&v23[0];
  if (v7)
  {
    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
    v11 = v10;
    v12 = v8;

    URL.init(fileURLWithPath:)(v9, v11);
    swift_bridgeObjectRelease(v11);
    v13 = type metadata accessor for URL(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v4, 0, 1, v13);
    result = sub_1000064B0((uint64_t)v4, (uint64_t)v23);
    v15 = v23[0];
    v16 = v23[1];
    v17 = v23[2];
    v18 = v24;
    v19 = v25;
  }
  else
  {
    v20 = *(id *)&v23[0];
    v21 = _convertNSErrorToError(_:)(v8);

    swift_willThrow();
    result = swift_errorRelease(v21);
    v18 = 0;
    v19 = 0;
    v15 = 0uLL;
    v16 = 0uLL;
    v17 = 0uLL;
  }
  *(_OWORD *)a1 = v15;
  *(_OWORD *)(a1 + 16) = v16;
  *(_OWORD *)(a1 + 32) = v17;
  *(_QWORD *)(a1 + 48) = v18;
  *(_WORD *)(a1 + 56) = v19;
  return result;
}

__n128 sub_1000075B4@<Q0>(__n128 *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  __n128 *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unint64_t v17;
  __n128 result;
  __n128 v19;
  _QWORD v20[4];
  _QWORD v21[8];
  uint64_t v22[8];
  _OWORD v23[2];
  _OWORD v24[2];
  _OWORD v25[2];
  _OWORD v26[2];

  v2 = sub_100007280(&qword_100025A10);
  __chkstk_darwin(v2);
  v4 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (__n128 *)v21;
  sub_100006EE0((uint64_t)v21);
  sub_1000073C4((uint64_t)v22);
  sub_100007348((uint64_t)v22, (uint64_t)v23, (uint64_t *)&unk_100025FF0);
  if (*((_QWORD *)&v23[0] + 1))
  {
    v25[0] = v23[0];
    v25[1] = v23[1];
    v26[0] = v24[0];
    *(_OWORD *)((char *)v26 + 10) = *(_OWORD *)((char *)v24 + 10);
    v6 = sub_10000628C();
    v8 = v7;
    v9 = sub_10000628C();
    v11 = v10;
    v20[2] = v6;
    v20[3] = v8;
    v20[0] = v9;
    v20[1] = v10;
    v12 = type metadata accessor for Locale(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v4, 1, 1, v12);
    v13 = sub_100007768();
    v14 = StringProtocol.compare<A>(_:options:range:locale:)(v20, 64, 0, 0, 1, v4, &type metadata for String, &type metadata for String, v13, v13);
    sub_1000077AC((uint64_t)v4, &qword_100025A10);
    swift_bridgeObjectRelease(v8);
    swift_bridgeObjectRelease(v11);
    if (v14 == -1)
    {
      sub_100007870(v21);
      v5 = (__n128 *)v25;
    }
    else
    {
      sub_1000077E8(v22);
      v5 = (__n128 *)v21;
    }
  }
  v15 = v5[3].n128_u8[9];
  v16 = v5[3].n128_u8[8];
  v17 = v5[3].n128_u64[0];
  v19 = v5[1];
  result = v5[2];
  *a1 = *v5;
  a1[1] = v19;
  a1[2] = result;
  a1[3].n128_u64[0] = v17;
  a1[3].n128_u8[8] = v16;
  a1[3].n128_u8[9] = v15;
  return result;
}

unint64_t sub_100007768()
{
  unint64_t result;

  result = qword_100025CC0;
  if (!qword_100025CC0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100025CC0);
  }
  return result;
}

uint64_t sub_1000077AC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100007280(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *sub_1000077E8(uint64_t *a1)
{
  sub_100007820(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6]);
  return a1;
}

uint64_t sub_100007820(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease(a2);
    swift_bridgeObjectRelease(a4);
    swift_bridgeObjectRelease(a6);
    return swift_bridgeObjectRelease(a7);
  }
  return result;
}

_QWORD *sub_100007870(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a1[1];
  v3 = a1[3];
  v4 = a1[6];
  swift_bridgeObjectRelease(a1[5]);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v4);
  return a1;
}

_QWORD *sub_1000078C4(uint64_t a1)
{
  int64_t v2;
  _QWORD *v3;
  uint64_t i;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v11;
  _BYTE v12[32];
  _QWORD *v13;

  v2 = *(_QWORD *)(a1 + 16);
  v13 = &_swiftEmptyArrayStorage;
  sub_100009094(0, v2, 0);
  v3 = &_swiftEmptyArrayStorage;
  if (v2)
  {
    for (i = a1 + 32; ; i += 32)
    {
      sub_10000B02C(i, (uint64_t)v12);
      v5 = sub_100007280((uint64_t *)&unk_100025CD0);
      v6 = sub_100007280(&qword_100025A38);
      if (!swift_dynamicCast(&v11, v12, v5, v6, 6))
        break;
      v7 = v11;
      if ((swift_isUniquelyReferenced_nonNull_native(v3) & 1) == 0)
      {
        sub_100009094(0, v3[2] + 1, 1);
        v3 = v13;
      }
      v9 = v3[2];
      v8 = v3[3];
      if (v9 >= v8 >> 1)
      {
        sub_100009094((_QWORD *)(v8 > 1), v9 + 1, 1);
        v3 = v13;
      }
      v3[2] = v9 + 1;
      v3[v9 + 4] = v7;
      if (!--v2)
        return v3;
    }
    v11 = 0;
    swift_release(v3);
    swift_bridgeObjectRelease(v11);
    return 0;
  }
  return v3;
}

uint64_t sub_100007A10(uint64_t a1, void *a2, uint64_t a3, void (*a4)(uint64_t, uint64_t), uint64_t a5)
{
  void *v5;
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
  void *v21;
  _QWORD *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  _QWORD *v45;
  uint64_t v46;
  void *v47;
  _QWORD *v48;
  uint64_t v49;
  _BYTE *v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _BYTE *v54;
  uint64_t v55;
  uint64_t v56;
  _BYTE v57[12];
  unsigned int v58;
  void *v59;
  _BYTE *v60;
  uint64_t v61;
  uint64_t v62;
  _BYTE *v63;
  uint64_t v64;
  uint64_t v65;
  char v66[24];
  _QWORD aBlock[5];
  _QWORD *v68;
  char v69[32];
  uint64_t v70;

  v70 = a5;
  v10 = type metadata accessor for DispatchWorkItemFlags(0);
  v64 = *(_QWORD *)(v10 - 8);
  v65 = v10;
  __chkstk_darwin(v10);
  v63 = &v57[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = type metadata accessor for DispatchQoS(0);
  v61 = *(_QWORD *)(v12 - 8);
  v62 = v12;
  v13 = __chkstk_darwin(v12);
  v60 = &v57[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a1)
  {
    v15 = swift_errorRetain(a1);
    v58 = static os_log_type_t.error.getter(v15);
    v16 = sub_100007280(&qword_1000259D8);
    v17 = swift_allocObject(v16, 72, 7);
    *(_OWORD *)(v17 + 16) = xmmword_10001B180;
    v18 = _convertErrorToNSError(_:)(a1);
    v59 = a2;
    v19 = v18;
    *(_QWORD *)(v17 + 56) = sub_10000738C(0, (unint64_t *)&unk_100025CF0, NSError_ptr);
    *(_QWORD *)(v17 + 64) = sub_100007308((unint64_t *)&qword_1000259E8, (unint64_t *)&unk_100025CF0, NSError_ptr);
    *(_QWORD *)(v17 + 32) = v19;
    v20 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
    v21 = (void *)static OS_os_log.default.getter(v20);
    os_log(_:dso:log:type:_:)("timeZonesForCurrentClockWidgets() returned error %{public}@", 59, 2, &_mh_execute_header, v21, v58, v17);
    swift_bridgeObjectRelease(v17);

    a2 = v59;
    v13 = swift_errorRelease(a1);
  }
  v22 = (_QWORD *)(a3 + 16);
  if (a2)
  {
    aBlock[0] = 0;
    static Array._conditionallyBridgeFromObjectiveC(_:result:)(a2, aBlock, &type metadata for String);
    v23 = aBlock[0];
    if (aBlock[0])
    {
      swift_beginAccess(a3 + 16, v66, 1, 0);
      v24 = (char *)swift_bridgeObjectRetain(v23);
      sub_100008EAC(v24);
      v25 = swift_bridgeObjectRelease(v23);
    }
    else
    {
      v33 = a2;
      v58 = static os_log_type_t.fault.getter(v33);
      v34 = sub_100007280(&qword_1000259D8);
      v35 = swift_allocObject(v34, 72, 7);
      *(_OWORD *)(v35 + 16) = xmmword_10001B180;
      v59 = v5;
      *(_QWORD *)(v35 + 56) = sub_10000738C(0, &qword_100025A50, NSArray_ptr);
      *(_QWORD *)(v35 + 64) = sub_100007308(&qword_100025A58, &qword_100025A50, NSArray_ptr);
      *(_QWORD *)(v35 + 32) = v33;
      sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
      v36 = v33;
      v37 = (void *)static OS_os_log.default.getter(v36);
      os_log(_:dso:log:type:_:)("Widget zones returned as unexpected type %@", 43, 2, &_mh_execute_header, v37, v58, v35);

      swift_bridgeObjectRelease(v35);
    }
    v38 = static os_log_type_t.debug.getter(v25);
    v39 = sub_100007280(&qword_1000259D8);
    v40 = swift_allocObject(v39, 72, 7);
    *(_OWORD *)(v40 + 16) = xmmword_10001B180;
    swift_beginAccess(v22, v69, 0, 0);
    v41 = *(_QWORD *)(a3 + 16);
    *(_QWORD *)(v40 + 56) = sub_100007280(&qword_100025A60);
    *(_QWORD *)(v40 + 64) = sub_10000B0FC((unint64_t *)&qword_100025A68, &qword_100025A60, (uint64_t)&protocol conformance descriptor for [A]);
    *(_QWORD *)(v40 + 32) = v41;
    sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
    v42 = swift_bridgeObjectRetain(v41);
    v43 = (void *)static OS_os_log.default.getter(v42);
    os_log(_:dso:log:type:_:)("World clock time zones: %@", 26, 2, &_mh_execute_header, v43, v38, v40);
    swift_bridgeObjectRelease(v40);

    sub_10000738C(0, (unint64_t *)&unk_100025C00, OS_dispatch_queue_ptr);
    v44 = (void *)static OS_dispatch_queue.main.getter();
    v45 = (_QWORD *)swift_allocObject(&unk_100020E40, 48, 7);
    v45[2] = a4;
    v46 = v70;
    v45[3] = v70;
    v45[4] = a3;
    v45[5] = a1;
    aBlock[4] = sub_10000B0A8;
    v68 = v45;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100013674;
    aBlock[3] = &unk_100020E58;
    v47 = _Block_copy(aBlock);
    v48 = v68;
    swift_errorRetain(a1);
    swift_retain(v46);
    swift_retain(a3);
    v49 = swift_release(v48);
    v50 = v60;
    static DispatchQoS.unspecified.getter(v49);
    aBlock[0] = &_swiftEmptyArrayStorage;
    v51 = sub_10000B0B4();
    v52 = sub_100007280((uint64_t *)&unk_100025C10);
    v53 = sub_10000B0FC((unint64_t *)&qword_100025FE0, (uint64_t *)&unk_100025C10, (uint64_t)&protocol conformance descriptor for [A]);
    v54 = v63;
    v55 = v52;
    v56 = v65;
    dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v55, v53, v65, v51);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v50, v54, v47);
    _Block_release(v47);

    (*(void (**)(_BYTE *, uint64_t))(v64 + 8))(v54, v56);
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v61 + 8))(v50, v62);
  }
  else
  {
    v26 = a4;
    v27 = static os_log_type_t.error.getter(v13);
    v28 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
    v29 = (void *)static OS_os_log.default.getter(v28);
    os_log(_:dso:log:type:_:)("Widget zones returned as nil", 28, 2, &_mh_execute_header, v29, v27, &_swiftEmptyArrayStorage);

    swift_beginAccess(a3 + 16, aBlock, 0, 0);
    v30 = *v22;
    v31 = swift_bridgeObjectRetain(*v22);
    v26(v31, a1);
    return swift_bridgeObjectRelease(v30);
  }
}

uint64_t sub_100007FFC(void (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  _BYTE v10[24];

  swift_beginAccess(a3 + 16, v10, 0, 0);
  v7 = *(_QWORD *)(a3 + 16);
  v8 = swift_bridgeObjectRetain(v7);
  a1(v8, a4);
  return swift_bridgeObjectRelease(v7);
}

void sub_100008070(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void (*v6)(void *, void *);
  id v7;
  id v8;

  v6 = *(void (**)(void *, void *))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  swift_retain(v5);
  v8 = a2;
  v7 = a3;
  v6(a2, a3);
  swift_release(v5);

}

uint64_t sub_1000080E4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void), uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v23;
  _QWORD v24[6];
  uint64_t v25;
  uint64_t v26;

  v10 = swift_allocObject(&unk_100020D78, 32, 7);
  *(_QWORD *)(v10 + 16) = a4;
  *(_QWORD *)(v10 + 24) = a5;
  if ((*(_BYTE *)(a1 + 56) & 1) != 0)
  {
    swift_retain_n(a5, 2);
    sub_100008368(1, a4, a5);
    swift_release(a5);
    return swift_release(v10);
  }
  else
  {
    sub_100007348(a1 + 48, (uint64_t)&v25, &qword_100025A18);
    v11 = sub_100007348((uint64_t)&v25, (uint64_t)&v26, &qword_100025A18);
    v12 = v26;
    if (v26)
    {
      __chkstk_darwin(v11);
      v24[2] = a2;
      v24[3] = a3;
      swift_retain_n(a5, 2);
      sub_10000ADE0(&v25);
      v13 = sub_10000AC70(v12, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100008AAC, (uint64_t)v24);
      sub_10000AE08(&v25);
      v14 = sub_100008AB4(v13);
      swift_release(v13);
      v15 = sub_10000AE30((uint64_t)v14);
      v16 = swift_bridgeObjectRelease(v14);
      v17 = static os_log_type_t.debug.getter(v16);
      v18 = sub_100007280(&qword_1000259D8);
      v19 = swift_allocObject(v18, 72, 7);
      *(_OWORD *)(v19 + 16) = xmmword_10001B180;
      *(_QWORD *)(v19 + 56) = sub_100007280(&qword_100025A20);
      *(_QWORD *)(v19 + 64) = sub_10000B0FC(&qword_100025A28, &qword_100025A20, (uint64_t)&protocol conformance descriptor for Set<A>);
      *(_QWORD *)(v19 + 32) = v15;
      sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
      v20 = swift_bridgeObjectRetain(v15);
      v21 = (void *)static OS_os_log.default.getter(v20);
      os_log(_:dso:log:type:_:)("Zones to present alerts for: %@", 31, 2, &_mh_execute_header, v21, v17, v19);
      swift_bridgeObjectRelease(v19);

      sub_10000A3DC((uint64_t (*)(BOOL))sub_100008A50, v10, v15);
      swift_release(a5);
      swift_release(v10);
      return swift_bridgeObjectRelease(v15);
    }
    else
    {
      v23 = swift_retain_n(a5, 2);
      ((void (*)(uint64_t))a4)(v23);
      swift_release(a5);
      return swift_release(v10);
    }
  }
}

void sub_100008368(char a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  Swift::String v17;
  Swift::String v18;
  Swift::String v19;
  unint64_t v20;
  id v21;
  NSString v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __CFString *v28;
  __CFString *v29;
  void **v30;
  uint64_t v31;
  _UNKNOWN **v32;
  id v33;
  Class isa;
  uint64_t v35;
  void *v36;
  Class v37;
  id v38;
  _QWORD *v39;
  uint64_t v40;
  unint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSString v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  NSString v51;
  NSString v52;
  id v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  NSString v59;
  id v60;
  void *v61;
  void *v62;
  int v63;
  char *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(void);
  _UNKNOWN **v70;
  void **aBlock;
  unint64_t v72;
  void (*v73)(uint64_t, void *);
  void *v74;
  void (*v75)(uint64_t);
  uint64_t v76;

  v6 = type metadata accessor for UUID(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Locale(0);
  __chkstk_darwin(v10);
  v12 = (char *)&v64 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for String.LocalizationValue(0);
  v14 = __chkstk_darwin(v13);
  v16 = (char *)&v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) == 0)
  {
    ((void (*)(uint64_t))a2)(v14);
    return;
  }
  v67 = v6;
  v68 = a3;
  v69 = a2;
  v65 = objc_msgSend(objc_allocWithZone((Class)UNMutableNotificationContent), "init");
  aBlock = 0;
  v72 = 0xE000000000000000;
  _StringGuts.grow(_:)(51);
  v17._countAndFlagsBits = 0xD00000000000002ALL;
  v17._object = (void *)0x800000010001B820;
  String.append(_:)(v17);
  v18._object = (void *)0x800000010001B850;
  v18._countAndFlagsBits = 0xD00000000000001DLL;
  String.append(_:)(v18);
  v19._countAndFlagsBits = 0x656C646E75622ELL;
  v19._object = (void *)0xE700000000000000;
  String.append(_:)(v19);
  v20 = v72;
  v21 = objc_allocWithZone((Class)NSBundle);
  v22 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v20);
  v23 = objc_msgSend(v21, "initWithPath:", v22);

  if (!v23)
  {
    v25 = static os_log_type_t.fault.getter(v24);
    v26 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
    v27 = (void *)static OS_os_log.default.getter(v26);
    os_log(_:dso:log:type:_:)("Could not locate bundle", 23, 2, &_mh_execute_header, v27, v25, &_swiftEmptyArrayStorage);

  }
  v28 = (__CFString *)String._bridgeToObjectiveC()();
  v29 = (__CFString *)String._bridgeToObjectiveC()();
  v30 = (void **)CFPreferencesCopyValue(v28, kCFPreferencesAnyApplication, v29, kCFPreferencesAnyHost);

  if (v30
    && (aBlock = v30,
        v31 = sub_100007280(&qword_100025A60),
        swift_dynamicCast(&v70, &aBlock, (char *)&type metadata for Swift.AnyObject + 8, v31, 6)))
  {
    v32 = v70;
  }
  else
  {
    v32 = &off_100020A68;
  }
  v66 = v7;
  v64 = v9;
  if (!v23)
  {
    swift_bridgeObjectRelease(v32);
LABEL_16:
    v41 = 0xE200000000000000;
    v40 = 28261;
    goto LABEL_17;
  }
  v33 = v23;
  isa = (Class)objc_msgSend(v33, "localizations");
  if (!isa)
  {
    v35 = static Array._unconditionallyBridgeFromObjectiveC(_:)(0, &type metadata for String);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v35);
  }
  v36 = (void *)objc_opt_self(NSBundle);
  v37 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v32);
  v38 = objc_msgSend(v36, "preferredLocalizationsFromArray:forPreferences:", isa, v37);

  v39 = (_QWORD *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v38, &type metadata for String);
  if (!v39[2])
  {
    swift_bridgeObjectRelease(v39);

    goto LABEL_16;
  }
  v40 = v39[4];
  v41 = v39[5];
  swift_bridgeObjectRetain(v41);
  swift_bridgeObjectRelease(v39);

LABEL_17:
  String.LocalizationValue.init(stringLiteral:)(0xD000000000000027, 0x800000010001B890);
  v42 = v23;
  v43 = swift_bridgeObjectRetain(v41);
  static Locale.current.getter(v43);
  String.init(localized:table:bundle:localization:locale:comment:)(v16, 0, 0, v23, v40, v41, v12, "Title for time zone update notification", 39, 2);
  v45 = v44;
  v46 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v45);
  v47 = v65;
  objc_msgSend(v65, "setTitle:", v46);

  String.LocalizationValue.init(stringLiteral:)(0xD00000000000002BLL, 0x800000010001B8F0);
  v48 = v42;
  static Locale.current.getter(v48);
  LOWORD(v63) = 2;
  String.init(localized:table:bundle:localization:locale:comment:)(v16, 0, 0, v23, v40, v41, v12, "Body for time zone update notification", 38, v63);
  v50 = v49;
  v51 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v50);
  objc_msgSend(v47, "setBody:", v51);

  v52 = String._bridgeToObjectiveC()();
  objc_msgSend(v47, "setCategoryIdentifier:", v52);

  v53 = objc_msgSend(v47, "setShouldSuppressDefaultAction:", 1);
  v54 = v64;
  v55 = UUID.init()(v53);
  UUID.uuidString.getter(v55);
  v57 = v56;
  (*(void (**)(char *, uint64_t))(v66 + 8))(v54, v67);
  v58 = v47;
  v59 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v57);
  v60 = objc_msgSend((id)objc_opt_self(UNNotificationRequest), "requestWithIdentifier:content:trigger:", v59, v58, 0);

  if (qword_100025830 != -1)
    swift_once(&qword_100025830, sub_100013B30);
  v61 = *(void **)(qword_100026B00 + OBJC_IVAR____TtC3tzd6Daemon_notificationCenter);
  v75 = sub_100016EA4;
  v76 = 0;
  aBlock = _NSConcreteStackBlock;
  v72 = 1107296256;
  v73 = sub_100008A58;
  v74 = &unk_100020E80;
  v62 = _Block_copy(&aBlock);
  objc_msgSend(v61, "addNotificationRequest:withCompletionHandler:", v60, v62);
  _Block_release(v62);
  v69();

}

uint64_t sub_100008A2C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

void sub_100008A50(char a1)
{
  uint64_t v1;

  sub_100008368(a1, *(void (**)(void))(v1 + 16), *(_QWORD *)(v1 + 24));
}

void sub_100008A58(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void *);
  id v5;

  v4 = *(void (**)(void *))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4(a2);
  swift_release(v3);

}

BOOL sub_100008AAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_100018EE8(a1, a2, a3, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24));
}

char *sub_100008AB4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  int64_t v5;
  char *result;
  int64_t v7;
  char *v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;

  v23 = a1 + 64;
  v2 = 1 << *(_BYTE *)(a1 + 32);
  v3 = -1;
  if (v2 < 64)
    v3 = ~(-1 << v2);
  v4 = v3 & *(_QWORD *)(a1 + 64);
  v5 = (unint64_t)(v2 + 63) >> 6;
  result = (char *)swift_bridgeObjectRetain(a1);
  v7 = 0;
  v8 = (char *)&_swiftEmptyArrayStorage;
  while (1)
  {
    if (v4)
    {
      v9 = __clz(__rbit64(v4));
      v4 &= v4 - 1;
      v10 = v9 | (v7 << 6);
    }
    else
    {
      v11 = v7 + 1;
      if (__OFADD__(v7, 1))
        goto LABEL_42;
      if (v11 >= v5)
      {
LABEL_37:
        swift_release(a1);
        return v8;
      }
      v12 = *(_QWORD *)(v23 + 8 * v11);
      ++v7;
      if (!v12)
      {
        v7 = v11 + 1;
        if (v11 + 1 >= v5)
          goto LABEL_37;
        v12 = *(_QWORD *)(v23 + 8 * v7);
        if (!v12)
        {
          v7 = v11 + 2;
          if (v11 + 2 >= v5)
            goto LABEL_37;
          v12 = *(_QWORD *)(v23 + 8 * v7);
          if (!v12)
          {
            v7 = v11 + 3;
            if (v11 + 3 >= v5)
              goto LABEL_37;
            v12 = *(_QWORD *)(v23 + 8 * v7);
            if (!v12)
            {
              v13 = v11 + 4;
              if (v13 >= v5)
                goto LABEL_37;
              v12 = *(_QWORD *)(v23 + 8 * v13);
              if (!v12)
              {
                while (1)
                {
                  v7 = v13 + 1;
                  if (__OFADD__(v13, 1))
                    goto LABEL_43;
                  if (v7 >= v5)
                    goto LABEL_37;
                  v12 = *(_QWORD *)(v23 + 8 * v7);
                  ++v13;
                  if (v12)
                    goto LABEL_23;
                }
              }
              v7 = v13;
            }
          }
        }
      }
LABEL_23:
      v4 = (v12 - 1) & v12;
      v10 = __clz(__rbit64(v12)) + (v7 << 6);
    }
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v10);
    v15 = *(_QWORD *)(v14 + 16);
    v16 = *((_QWORD *)v8 + 2);
    v17 = v16 + v15;
    if (__OFADD__(v16, v15))
      break;
    swift_bridgeObjectRetain(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v10));
    result = (char *)swift_isUniquelyReferenced_nonNull_native(v8);
    if ((_DWORD)result && v17 <= *((_QWORD *)v8 + 3) >> 1)
    {
      if (!*(_QWORD *)(v14 + 16))
        goto LABEL_4;
    }
    else
    {
      if (v16 <= v17)
        v18 = v16 + v15;
      else
        v18 = v16;
      result = sub_100008F94(result, v18, 1, v8);
      v8 = result;
      if (!*(_QWORD *)(v14 + 16))
      {
LABEL_4:
        if (v15)
          goto LABEL_39;
        goto LABEL_5;
      }
    }
    v19 = *((_QWORD *)v8 + 2);
    if ((*((_QWORD *)v8 + 3) >> 1) - v19 < v15)
      goto LABEL_40;
    result = (char *)swift_arrayInitWithCopy(&v8[16 * v19 + 32], v14 + 32, v15, &type metadata for String);
    if (v15)
    {
      v20 = *((_QWORD *)v8 + 2);
      v21 = __OFADD__(v20, v15);
      v22 = v20 + v15;
      if (v21)
        goto LABEL_41;
      *((_QWORD *)v8 + 2) = v22;
    }
LABEL_5:
    result = (char *)swift_bridgeObjectRelease(v14);
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
  return result;
}

uint64_t sub_100008CF4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v16 = a1;
    else
      v16 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v3 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (!((unint64_t)*v1 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v4 < 0)
    v17 = *v1;
  else
    v17 = v4 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(*v1);
  v5 = _CocoaArrayWrapper.endIndex.getter(v17);
  swift_bridgeObjectRelease(v4);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_29;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v1);
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if ((unint64_t)v4 >> 62)
    goto LABEL_31;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain(v4);
    v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v5, v9, 1, v4);
    swift_bridgeObjectRelease(*v1);
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_10000A224(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_30:
    __break(1u);
LABEL_31:
    if (v4 < 0)
      v18 = v4;
    else
      v18 = v4 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v4);
    v9 = _CocoaArrayWrapper.endIndex.getter(v18);
    swift_bridgeObjectRelease(v4);
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    v15 = swift_bridgeObjectRelease(result);
    return specialized Array._endMutation()(v15);
  }
  __break(1u);
  return result;
}

char *sub_100008EAC(char *result)
{
  char **v1;
  uint64_t v2;
  char *v3;
  int64_t v4;
  int64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  int64_t v11;

  v2 = *((_QWORD *)result + 2);
  v3 = *v1;
  v4 = *((_QWORD *)*v1 + 2);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  result = (char *)swift_isUniquelyReferenced_nonNull_native(*v1);
  if ((_DWORD)result && v5 <= *((_QWORD *)v3 + 3) >> 1)
  {
    if (*((_QWORD *)v6 + 2))
      goto LABEL_5;
    goto LABEL_13;
  }
  if (v4 <= v5)
    v11 = v4 + v2;
  else
    v11 = v4;
  result = sub_100008F94(result, v11, 1, v3);
  v3 = result;
  if (!*((_QWORD *)v6 + 2))
  {
LABEL_13:
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
LABEL_5:
  v7 = *((_QWORD *)v3 + 2);
  if ((*((_QWORD *)v3 + 3) >> 1) - v7 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  result = (char *)swift_arrayInitWithCopy(&v3[16 * v7 + 32], v6 + 32, v2, &type metadata for String);
  if (!v2)
  {
LABEL_14:
    result = (char *)swift_bridgeObjectRelease(v6);
    *v1 = v3;
    return result;
  }
  v8 = *((_QWORD *)v3 + 2);
  v9 = __OFADD__(v8, v2);
  v10 = v8 + v2;
  if (!v9)
  {
    *((_QWORD *)v3 + 2) = v10;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

char *sub_100008F94(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
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
    v10 = sub_100007280(&qword_100025F60);
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
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8])
      memmove(v14, v15, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy(v14, v15, v8, &type metadata for String);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

_QWORD *sub_100009094(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_1000090E8(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

_QWORD *sub_1000090B0(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_100009208(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_1000090CC(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_100009410(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

_QWORD *sub_1000090E8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v15;

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
    v10 = sub_100007280(&qword_100025A40);
    v11 = (_QWORD *)swift_allocObject(v10, 8 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 25;
    v11[2] = v8;
    v11[3] = 2 * (v13 >> 3);
  }
  else
  {
    v11 = &_swiftEmptyArrayStorage;
  }
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v11 + 4 >= &a4[v8 + 4])
      memmove(v11 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
  }
  else
  {
    v15 = sub_100007280(&qword_100025A38);
    swift_arrayInitWithCopy(v11 + 4, a4 + 4, v8, v15);
  }
  swift_release(a4);
  return v11;
}

_QWORD *sub_100009208(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v15;

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
    v10 = sub_100007280(&qword_100025A48);
    v11 = (_QWORD *)swift_allocObject(v10, 32 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 1;
    v11[2] = v8;
    v11[3] = 2 * (v13 >> 5);
  }
  else
  {
    v11 = &_swiftEmptyArrayStorage;
  }
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v11 + 4 >= &a4[4 * v8 + 4])
      memmove(v11 + 4, a4 + 4, 32 * v8);
    a4[2] = 0;
  }
  else
  {
    v15 = sub_100007280((uint64_t *)&unk_100025CD0);
    swift_arrayInitWithCopy(v11 + 4, a4 + 4, v8, v15);
  }
  swift_release(a4);
  return v11;
}

char *sub_100009328(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
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
    v10 = sub_100007280((uint64_t *)&unk_100025A90);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, v8);
  }
  swift_release(a4);
  return v11;
}

char *sub_100009410(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
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
    v10 = sub_100007280(&qword_100025F60);
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
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8])
      memmove(v14, v15, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy(v14, v15, v8, &type metadata for String);
  }
  swift_release(a4);
  return v11;
}

uint64_t sub_100009510(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v7;
  Swift::Int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  BOOL v21;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v23;
  _QWORD v24[9];

  v7 = *v3;
  Hasher.init(_seed:)(v24, *(_QWORD *)(*v3 + 40));
  swift_bridgeObjectRetain(v7);
  String.hash(into:)(v24, a2, a3);
  v8 = Hasher._finalize()();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = v12[1];
    v14 = *v12 == a2 && v13 == a3;
    if (v14 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v12, v13, a2, a3, 0) & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease(a3);
      swift_bridgeObjectRelease(v7);
      v15 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v16 = v15[1];
      *a1 = *v15;
      a1[1] = v16;
      swift_bridgeObjectRetain(v16);
      return 0;
    }
    v18 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v18;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v19 = (_QWORD *)(v11 + 16 * v10);
      v20 = v19[1];
      v21 = *v19 == a2 && v20 == a3;
      if (v21 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v19, v20, a2, a3, 0) & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease(v7);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  v24[0] = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain(a3);
  sub_100009998(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  v23 = *v3;
  *v3 = v24[0];
  swift_bridgeObjectRelease(v23);
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

Swift::Int sub_1000096BC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  Swift::Int result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  _QWORD *v33;
  _QWORD v34[9];

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_100007280(&qword_100025A70);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1);
  v6 = v5;
  if (*(_QWORD *)(v3 + 16))
  {
    v7 = 1 << *(_BYTE *)(v3 + 32);
    v32 = v2;
    v33 = (_QWORD *)(v3 + 56);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v3 + 56);
    v10 = (unint64_t)(v7 + 63) >> 6;
    v11 = v5 + 56;
    result = swift_retain(v3);
    v13 = 0;
    while (1)
    {
      if (v9)
      {
        v16 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v17 = v16 | (v13 << 6);
      }
      else
      {
        v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v18 >= v10)
          goto LABEL_36;
        v19 = v33[v18];
        ++v13;
        if (!v19)
        {
          v13 = v18 + 1;
          if (v18 + 1 >= v10)
            goto LABEL_36;
          v19 = v33[v13];
          if (!v19)
          {
            v13 = v18 + 2;
            if (v18 + 2 >= v10)
              goto LABEL_36;
            v19 = v33[v13];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v10)
              {
LABEL_36:
                swift_release(v3);
                v2 = v32;
                v31 = 1 << *(_BYTE *)(v3 + 32);
                if (v31 > 63)
                  bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v33 = -1 << v31;
                *(_QWORD *)(v3 + 16) = 0;
                break;
              }
              v19 = v33[v20];
              if (!v19)
              {
                while (1)
                {
                  v13 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_42;
                  if (v13 >= v10)
                    goto LABEL_36;
                  v19 = v33[v13];
                  ++v20;
                  if (v19)
                    goto LABEL_26;
                }
              }
              v13 = v20;
            }
          }
        }
LABEL_26:
        v9 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v17);
      v22 = *v21;
      v23 = v21[1];
      Hasher.init(_seed:)(v34, *(_QWORD *)(v6 + 40));
      String.hash(into:)(v34, v22, v23);
      result = Hasher._finalize()();
      v24 = -1 << *(_BYTE *)(v6 + 32);
      v25 = result & ~v24;
      v26 = v25 >> 6;
      if (((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v27 = 0;
        v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v29 = v26 == v28;
          if (v26 == v28)
            v26 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v11 + 8 * v26);
        }
        while (v30 == -1);
        v14 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = (_QWORD *)(*(_QWORD *)(v6 + 48) + 16 * v14);
      *v15 = v22;
      v15[1] = v23;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release(v3);
  *v2 = v6;
  return result;
}

uint64_t sub_100009998(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD v28[9];

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  v11 = v9 + 1;
  if ((a4 & 1) != 0)
  {
    sub_1000096BC(v11);
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_100009B30();
      goto LABEL_22;
    }
    sub_100009CE0(v11);
  }
  v12 = *v4;
  Hasher.init(_seed:)(v28, *(_QWORD *)(*v4 + 40));
  String.hash(into:)(v28, v8, a2);
  result = Hasher._finalize()();
  v13 = -1 << *(_BYTE *)(v12 + 32);
  a3 = result & ~v13;
  v14 = v12 + 56;
  if (((*(_QWORD *)(v12 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v15 = *(_QWORD *)(v12 + 48);
    v16 = (_QWORD *)(v15 + 16 * a3);
    v17 = v16[1];
    v18 = *v16 == v8 && v17 == a2;
    if (v18 || (result = _stringCompareWithSmolCheck(_:_:expecting:)(*v16, v17, v8, a2, 0), (result & 1) != 0))
    {
LABEL_21:
      result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
      __break(1u);
    }
    else
    {
      v19 = ~v13;
      while (1)
      {
        a3 = (a3 + 1) & v19;
        if (((*(_QWORD *)(v14 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v20 = (_QWORD *)(v15 + 16 * a3);
        v21 = v20[1];
        if (*v20 != v8 || v21 != a2)
        {
          result = _stringCompareWithSmolCheck(_:_:expecting:)(*v20, v21, v8, a2, 0);
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v23 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v24 = (uint64_t *)(*(_QWORD *)(v23 + 48) + 16 * a3);
  *v24 = v8;
  v24[1] = a2;
  v25 = *(_QWORD *)(v23 + 16);
  v26 = __OFADD__(v25, 1);
  v27 = v25 + 1;
  if (v26)
    __break(1u);
  else
    *(_QWORD *)(v23 + 16) = v27;
  return result;
}

void *sub_100009B30()
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
  sub_100007280(&qword_100025A70);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release(v2);
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
    result = (void *)swift_bridgeObjectRetain(v18);
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

Swift::Int sub_100009CE0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  Swift::Int result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  int64_t v32;
  _QWORD v33[9];

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_100007280(&qword_100025A70);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0);
  v6 = v5;
  if (!*(_QWORD *)(v3 + 16))
  {
    result = swift_release(v3);
LABEL_38:
    *v2 = v6;
    return result;
  }
  v7 = 1 << *(_BYTE *)(v3 + 32);
  v8 = v3 + 56;
  if (v7 < 64)
    v9 = ~(-1 << v7);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v3 + 56);
  v31 = v2;
  v32 = (unint64_t)(v7 + 63) >> 6;
  v11 = v5 + 56;
  result = swift_retain(v3);
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v13 << 6);
      goto LABEL_27;
    }
    v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v18 >= v32)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v18);
    ++v13;
    if (!v19)
    {
      v13 = v18 + 1;
      if (v18 + 1 >= v32)
        goto LABEL_36;
      v19 = *(_QWORD *)(v8 + 8 * v13);
      if (!v19)
      {
        v13 = v18 + 2;
        if (v18 + 2 >= v32)
          goto LABEL_36;
        v19 = *(_QWORD *)(v8 + 8 * v13);
        if (!v19)
          break;
      }
    }
LABEL_26:
    v10 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v13 << 6);
LABEL_27:
    v21 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v17);
    v22 = *v21;
    v23 = v21[1];
    Hasher.init(_seed:)(v33, *(_QWORD *)(v6 + 40));
    swift_bridgeObjectRetain(v23);
    String.hash(into:)(v33, v22, v23);
    result = Hasher._finalize()();
    v24 = -1 << *(_BYTE *)(v6 + 32);
    v25 = result & ~v24;
    v26 = v25 >> 6;
    if (((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v29 = v26 == v28;
        if (v26 == v28)
          v26 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v11 + 8 * v26);
      }
      while (v30 == -1);
      v14 = __clz(__rbit64(~v30)) + (v26 << 6);
    }
    *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    v15 = (_QWORD *)(*(_QWORD *)(v6 + 48) + 16 * v14);
    *v15 = v22;
    v15[1] = v23;
    ++*(_QWORD *)(v6 + 16);
  }
  v20 = v18 + 3;
  if (v20 >= v32)
  {
LABEL_36:
    result = swift_release_n(v3, 2);
    v2 = v31;
    goto LABEL_38;
  }
  v19 = *(_QWORD *)(v8 + 8 * v20);
  if (v19)
  {
    v13 = v20;
    goto LABEL_26;
  }
  while (1)
  {
    v13 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v13 >= v32)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v13);
    ++v20;
    if (v19)
      goto LABEL_26;
  }
LABEL_40:
  __break(1u);
  return result;
}

Swift::Int sub_100009F8C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  Swift::Int result;
  Swift::Int v9;
  unint64_t v10;
  uint64_t v11;
  Swift::Int v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  _QWORD *v30;
  unint64_t *v32;
  uint64_t v33;
  _QWORD v34[9];

  if (!a3)
    return (Swift::Int)&_swiftEmptyDictionarySingleton;
  v4 = a4;
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
  {
    swift_retain(a4);
    return v4;
  }
  sub_100007280(&qword_100025A78);
  result = static _DictionaryStorage.allocate(capacity:)(v5);
  v9 = result;
  v32 = a1;
  v33 = a2;
  if (a2 < 1)
    v10 = 0;
  else
    v10 = *a1;
  v11 = 0;
  v12 = result + 64;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v14 = v13 | (v11 << 6);
    }
    else
    {
      v15 = v11 + 1;
      if (__OFADD__(v11, 1))
        goto LABEL_40;
      if (v15 >= v33)
        return v9;
      v16 = v32[v15];
      ++v11;
      if (!v16)
      {
        v11 = v15 + 1;
        if (v15 + 1 >= v33)
          return v9;
        v16 = v32[v11];
        if (!v16)
        {
          v11 = v15 + 2;
          if (v15 + 2 >= v33)
            return v9;
          v16 = v32[v11];
          if (!v16)
          {
            v17 = v15 + 3;
            if (v17 >= v33)
              return v9;
            v16 = v32[v17];
            if (!v16)
            {
              while (1)
              {
                v11 = v17 + 1;
                if (__OFADD__(v17, 1))
                  goto LABEL_41;
                if (v11 >= v33)
                  return v9;
                v16 = v32[v11];
                ++v17;
                if (v16)
                  goto LABEL_24;
              }
            }
            v11 = v17;
          }
        }
      }
LABEL_24:
      v10 = (v16 - 1) & v16;
      v14 = __clz(__rbit64(v16)) + (v11 << 6);
    }
    v18 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v14);
    v20 = *v18;
    v19 = v18[1];
    v21 = *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v14);
    Hasher.init(_seed:)(v34, *(_QWORD *)(v9 + 40));
    swift_bridgeObjectRetain(v19);
    swift_bridgeObjectRetain(v21);
    String.hash(into:)(v34, v20, v19);
    result = Hasher._finalize()();
    v22 = -1 << *(_BYTE *)(v9 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
    {
      v25 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v28 = v24 == v27;
        if (v24 == v27)
          v24 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v24);
      }
      while (v29 == -1);
      v25 = __clz(__rbit64(~v29)) + (v24 << 6);
    }
    *(_QWORD *)(v12 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
    v30 = (_QWORD *)(*(_QWORD *)(v9 + 48) + 16 * v25);
    *v30 = v20;
    v30[1] = v19;
    *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v25) = v21;
    ++*(_QWORD *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
      break;
    if (!v5)
      return v9;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_10000A224(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t i;
  void (*v13)(_QWORD *);
  id *v14;
  id v15;
  uint64_t v16;
  void (*v17[4])(id *);

  v5 = result;
  v6 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0)
      v16 = a3;
    else
      v16 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v7 = _CocoaArrayWrapper.endIndex.getter(v16);
    result = swift_bridgeObjectRelease(a3);
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
      if (a3 < 0)
        v10 = a3;
      else
        v10 = a3 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(a3);
      v11 = _CocoaArrayWrapper.endIndex.getter(v10);
      result = swift_bridgeObjectRelease(a3);
      if (v11 <= a2)
      {
        if (v7 >= 1)
        {
          sub_10000B0FC(&qword_100025A88, &qword_100025A80, (uint64_t)&protocol conformance descriptor for [A]);
          swift_bridgeObjectRetain(a3);
          for (i = 0; i != v7; ++i)
          {
            sub_100007280(&qword_100025A80);
            v13 = sub_100013154(v17, i, a3);
            v15 = *v14;
            ((void (*)(void (**)(id *), _QWORD))v13)(v17, 0);
            *(_QWORD *)(v5 + 8 * i) = v15;
          }
          swift_bridgeObjectRelease(a3);
          return a3;
        }
        goto LABEL_22;
      }
    }
    else
    {
      v8 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v8 <= a2)
      {
        v9 = sub_10000738C(0, (unint64_t *)&unk_100025CF0, NSError_ptr);
        swift_arrayInitWithCopy(v5, (a3 & 0xFFFFFFFFFFFFFF8) + 32, v8, v9);
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_22:
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_10000A3DC(uint64_t (*a1)(BOOL), uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  CFPropertyListRef v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t *v14;
  int64_t v15;
  uint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t v19;
  char v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  unint64_t *v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  char *v42;
  id v43;
  NSString v44;
  id v45;
  NSString v46;
  id v47;
  uint64_t ObjCClassMetadata;
  id v49;
  _QWORD *v50;
  void *v51;
  _QWORD *v52;
  id v53;
  id v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t (*v61)(BOOL);
  unint64_t *v62;
  uint64_t v63;
  __int128 aBlock;
  __int128 v65;
  uint64_t (*v66)(void *, uint64_t);
  _QWORD *v67;

  v6 = (_QWORD *)swift_allocObject(&unk_100020DA0, 40, 7);
  v6[2] = a1;
  v6[3] = a2;
  v6[4] = a3;
  v7 = swift_allocObject(&unk_100020DC8, 24, 7);
  *(_QWORD *)(v7 + 16) = &_swiftEmptyArrayStorage;
  swift_retain(a2);
  swift_bridgeObjectRetain(a3);
  v8 = (__CFString *)String._bridgeToObjectiveC()();
  v9 = (__CFString *)String._bridgeToObjectiveC()();
  v10 = (__CFString *)String._bridgeToObjectiveC()();
  v11 = CFPreferencesCopyValue(v8, v9, v10, kCFPreferencesAnyHost);

  if (v11)
  {
    v61 = a1;
    *(_QWORD *)&aBlock = v11;
    swift_unknownObjectRetain(v11);
    v12 = sub_100007280(&qword_100025A30);
    v13 = swift_dynamicCast(&v62, &aBlock, (char *)&type metadata for Swift.AnyObject + 8, v12, 6);
    if ((v13 & 1) == 0)
      goto LABEL_31;
    v57 = a3;
    v58 = a2;
    v14 = v62;
    v15 = v62[2];
    v59 = v7;
    v60 = v6;
    if (v15)
    {
      v62 = (unint64_t *)&_swiftEmptyArrayStorage;
      sub_1000090B0(0, v15, 0);
      v16 = 0;
      v17 = v62;
      do
      {
        v18 = v14[v16 + 4];
        if (*(_QWORD *)(v18 + 16))
        {
          swift_bridgeObjectRetain(v14[v16 + 4]);
          v19 = sub_100017124(2037672291, 0xE400000000000000);
          if ((v20 & 1) != 0)
          {
            sub_10000AFEC(*(_QWORD *)(v18 + 56) + 32 * v19, (uint64_t)&aBlock);
          }
          else
          {
            aBlock = 0u;
            v65 = 0u;
          }
          swift_bridgeObjectRelease(v18);
        }
        else
        {
          aBlock = 0u;
          v65 = 0u;
        }
        v62 = v17;
        v22 = v17[2];
        v21 = v17[3];
        if (v22 >= v21 >> 1)
        {
          sub_1000090B0((_QWORD *)(v21 > 1), v22 + 1, 1);
          v17 = v62;
        }
        ++v16;
        v17[2] = v22 + 1;
        sub_100007348((uint64_t)&aBlock, (uint64_t)&v17[4 * v22 + 4], (uint64_t *)&unk_100025CD0);
      }
      while (v15 != v16);
      swift_bridgeObjectRelease(v14);
    }
    else
    {
      swift_bridgeObjectRelease(v62);
      v17 = (unint64_t *)&_swiftEmptyArrayStorage;
    }
    a3 = v57;
    v26 = sub_1000078C4((uint64_t)v17);
    v13 = swift_bridgeObjectRelease(v17);
    v7 = v59;
    a2 = v58;
    if (v26)
    {
      v27 = v26[2];
      if (v27)
      {
        swift_bridgeObjectRetain(v26);
        v28 = 0;
        v29 = (char *)&_swiftEmptyArrayStorage;
        do
        {
          v31 = v26[v28 + 4];
          v32 = *(_QWORD *)(v31 + 16);
          swift_bridgeObjectRetain(v31);
          if (!v32
            || (v33 = sub_100017124(0x656E6F5A656D6974, 0xE800000000000000), (v34 & 1) == 0)
            || (sub_10000AFEC(*(_QWORD *)(v31 + 56) + 32 * v33, (uint64_t)&aBlock),
                (swift_dynamicCast(&v62, &aBlock, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) == 0))
          {
            v62 = 0;
            v63 = 0;
          }
          swift_bridgeObjectRelease(v31);
          v35 = v63;
          if (v63)
          {
            v36 = v62;
            if ((swift_isUniquelyReferenced_nonNull_native(v29) & 1) == 0)
              v29 = sub_100008F94(0, *((_QWORD *)v29 + 2) + 1, 1, v29);
            v38 = *((_QWORD *)v29 + 2);
            v37 = *((_QWORD *)v29 + 3);
            if (v38 >= v37 >> 1)
              v29 = sub_100008F94((char *)(v37 > 1), v38 + 1, 1, v29);
            *((_QWORD *)v29 + 2) = v38 + 1;
            v30 = &v29[16 * v38];
            *((_QWORD *)v30 + 4) = v36;
            *((_QWORD *)v30 + 5) = v35;
          }
          ++v28;
        }
        while (v27 != v28);
        swift_bridgeObjectRelease(v26);
        a3 = v57;
      }
      else
      {
        v29 = (char *)&_swiftEmptyArrayStorage;
      }
      swift_bridgeObjectRelease(v26);
      v42 = (char *)swift_bridgeObjectRetain(v29);
      sub_100008EAC(v42);
      swift_bridgeObjectRelease(v29);
      swift_unknownObjectRelease(v11);
      v7 = v59;
      v6 = v60;
      a2 = v58;
    }
    else
    {
LABEL_31:
      v39 = static os_log_type_t.error.getter(v13);
      v40 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
      v41 = (void *)static OS_os_log.default.getter(v40);
      os_log(_:dso:log:type:_:)("World clock cities not in correct format", 40, 2, &_mh_execute_header, v41, v39, &_swiftEmptyArrayStorage);

      swift_unknownObjectRelease(v11);
    }
    a1 = v61;
  }
  else
  {
    v23 = static os_log_type_t.info.getter();
    v24 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
    v25 = (void *)static OS_os_log.default.getter(v24);
    os_log(_:dso:log:type:_:)("World clock preferences missing", 31, 2, &_mh_execute_header, v25, v23, &_swiftEmptyArrayStorage);

  }
  v43 = objc_allocWithZone((Class)NSBundle);
  v44 = String._bridgeToObjectiveC()();
  v45 = objc_msgSend(v43, "initWithPath:", v44);

  if (v45)
  {
    v46 = String._bridgeToObjectiveC()();
    v47 = objc_msgSend(v45, "classNamed:", v46);

    if (v47)
    {
      ObjCClassMetadata = swift_getObjCClassMetadata(v47);
      v49 = objc_msgSend((id)swift_getObjCClassFromMetadata(ObjCClassMetadata), "timeZonesForCurrentClockWidgets");
      v50 = (_QWORD *)swift_allocObject(&unk_100020DF0, 48, 7);
      v50[2] = v49;
      v50[3] = v7;
      v50[4] = sub_10000AF34;
      v50[5] = v6;
      v66 = sub_10000AF98;
      v67 = v50;
      *(_QWORD *)&aBlock = _NSConcreteStackBlock;
      *((_QWORD *)&aBlock + 1) = 1107296256;
      *(_QWORD *)&v65 = sub_100008070;
      *((_QWORD *)&v65 + 1) = &unk_100020E08;
      v51 = _Block_copy(&aBlock);
      v52 = v67;
      v53 = v49;
      swift_retain(v7);
      swift_retain(v6);
      swift_release(v52);
      v54 = objc_msgSend(v53, "addCompletionBlock:", v51);
      _Block_release(v51);
      swift_release(v6);
      swift_release(v7);

      return;
    }

  }
  v55 = *(_QWORD *)(v7 + 16);
  v56 = (char *)swift_bridgeObjectRetain(v55);
  sub_100018FD8(v56, 0, a1, a2, a3);
  swift_release(v6);
  swift_release(v7);
  swift_bridgeObjectRelease(v55);
}

uint64_t sub_10000AA74(uint64_t result, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t))
{
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;

  v22 = (unint64_t *)result;
  v23 = 0;
  v6 = 0;
  v7 = 1 << *(_BYTE *)(a3 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(a3 + 64);
  v25 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    if (v9)
    {
      v10 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v11 = v10 | (v6 << 6);
      goto LABEL_5;
    }
    v17 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v17 >= v25)
      return sub_100009F8C(v22, a2, v23, a3);
    v18 = *(_QWORD *)(v24 + 8 * v17);
    ++v6;
    if (!v18)
    {
      v6 = v17 + 1;
      if (v17 + 1 >= v25)
        return sub_100009F8C(v22, a2, v23, a3);
      v18 = *(_QWORD *)(v24 + 8 * v6);
      if (!v18)
      {
        v6 = v17 + 2;
        if (v17 + 2 >= v25)
          return sub_100009F8C(v22, a2, v23, a3);
        v18 = *(_QWORD *)(v24 + 8 * v6);
        if (!v18)
          break;
      }
    }
LABEL_20:
    v9 = (v18 - 1) & v18;
    v11 = __clz(__rbit64(v18)) + (v6 << 6);
LABEL_5:
    v12 = (uint64_t *)(*(_QWORD *)(a3 + 48) + 16 * v11);
    v13 = *v12;
    v14 = v12[1];
    v15 = *(_QWORD *)(*(_QWORD *)(a3 + 56) + 8 * v11);
    swift_bridgeObjectRetain(v14);
    swift_bridgeObjectRetain(v15);
    v16 = a4(v13, v14, v15);
    swift_bridgeObjectRelease(v14);
    result = swift_bridgeObjectRelease(v15);
    if ((v16 & 1) != 0)
    {
      *(unint64_t *)((char *)v22 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      if (__OFADD__(v23++, 1))
      {
        __break(1u);
        return sub_100009F8C(v22, a2, v23, a3);
      }
    }
  }
  v19 = v17 + 3;
  if (v19 >= v25)
    return sub_100009F8C(v22, a2, v23, a3);
  v18 = *(_QWORD *)(v24 + 8 * v19);
  if (v18)
  {
    v6 = v19;
    goto LABEL_20;
  }
  while (1)
  {
    v6 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v6 >= v25)
      return sub_100009F8C(v22, a2, v23, a3);
    v18 = *(_QWORD *)(v24 + 8 * v6);
    ++v19;
    if (v18)
      goto LABEL_20;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_10000AC70(uint64_t isStackAllocationSafe, uint64_t (*a2)(uint64_t, uint64_t, uint64_t), uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  char v7;
  unsigned int v8;
  unint64_t v9;
  uint64_t v10;
  size_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;

  v6 = isStackAllocationSafe;
  v7 = *(_BYTE *)(isStackAllocationSafe + 32);
  v8 = v7 & 0x3F;
  v9 = (1 << v7) + 63;
  v10 = v9 >> 6;
  v11 = 8 * (v9 >> 6);
  if (v8 <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(8 * (v9 >> 6), 8), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v15 - ((v11 + 15) & 0x3FFFFFFFFFFFFFF0), v11);
    v12 = sub_10000AA74((uint64_t)&v15 - ((v11 + 15) & 0x3FFFFFFFFFFFFFF0), v10, v6, a2);
    if (v3)
      swift_willThrow(v12);
    else
      return v12;
  }
  else
  {
    v13 = (void *)swift_slowAlloc(v11, -1);
    bzero(v13, v11);
    a3 = sub_10000AA74((uint64_t)v13, v10, v6, a2);
    swift_slowDealloc(v13, -1, -1);
  }
  return a3;
}

_QWORD *sub_10000ADE0(_QWORD *a1)
{
  swift_bridgeObjectRetain(*a1);
  return a1;
}

_QWORD *sub_10000AE08(_QWORD *a1)
{
  swift_bridgeObjectRelease(*a1);
  return a1;
}

uint64_t sub_10000AE30(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7[2];
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = Set.init(minimumCapacity:)(v2, &type metadata for String, &protocol witness table for String);
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain(*v4);
      sub_100009510(v7, v5, v6);
      swift_bridgeObjectRelease(v7[1]);
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_10000AEC4(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContextInMetadataState2(255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000AF08()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000AF34(char *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100018FD8(a1, a2, *(uint64_t (**)(BOOL))(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32));
}

uint64_t sub_10000AF40()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000AF64()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000AF98(void *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100007A10(a2, a1, *(_QWORD *)(v2 + 24), *(void (**)(uint64_t, uint64_t))(v2 + 32), *(_QWORD *)(v2 + 40));
}

uint64_t sub_10000AFD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000AFE4(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000AFEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000B02C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100007280((uint64_t *)&unk_100025CD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000B074()
{
  _QWORD *v0;

  swift_release(v0[3]);
  swift_release(v0[4]);
  swift_errorRelease(v0[5]);
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000B0A8()
{
  uint64_t v0;

  return sub_100007FFC(*(void (**)(uint64_t, uint64_t))(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

unint64_t sub_10000B0B4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100025FD0;
  if (!qword_100025FD0)
  {
    v1 = type metadata accessor for DispatchWorkItemFlags(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_100025FD0);
  }
  return result;
}

uint64_t sub_10000B0FC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_10000AEC4(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

id sub_10000B14C()
{
  id result;

  result = (id)MobileGestalt_get_current_device();
  qword_100026AE0 = (uint64_t)result;
  return result;
}

id sub_10000B170()
{
  void *v0;
  id result;
  void *v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v6;
  _QWORD v7[5];
  __int128 v8;
  __int128 v9;

  result = objc_msgSend(v0, "attributes");
  if (result)
  {
    v2 = result;
    v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(result, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

    strcpy((char *)&v8, "BundleVersion");
    HIWORD(v8) = -4864;
    AnyHashable.init<A>(_:)(v7, &v8, &type metadata for String, &protocol witness table for String);
    if (*(_QWORD *)(v3 + 16) && (v4 = sub_1000170F4((uint64_t)v7), (v5 & 1) != 0))
    {
      sub_10000AFEC(*(_QWORD *)(v3 + 56) + 32 * v4, (uint64_t)&v8);
    }
    else
    {
      v8 = 0u;
      v9 = 0u;
    }
    swift_bridgeObjectRelease(v3);
    sub_100010E24((uint64_t)v7);
    if (*((_QWORD *)&v9 + 1))
    {
      if (swift_dynamicCast(&v6, &v8, (char *)&type metadata for Any + 8, &type metadata for String, 6))
        return (id)v6;
      else
        return 0;
    }
    else
    {
      sub_1000077AC((uint64_t)&v8, (uint64_t *)&unk_100025CD0);
      return 0;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_10000B2B4()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone((Class)MADownloadOptions), "init");
  objc_msgSend(v0, "setDiscretionary:", 0);
  result = objc_msgSend(v0, "setAllowsCellularAccess:", 1);
  qword_100026AE8 = (uint64_t)v0;
  return result;
}

uint64_t sub_10000B314(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  Class isa;
  NSString v14;
  unsigned int v15;
  uint64_t v16;
  id v17;
  NSString v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  Class v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t);
  NSString v31;
  id v32;
  uint64_t v33;
  NSString v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  NSString v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  __int128 v67[2];
  uint64_t v68;
  _QWORD v69[4];
  _OWORD v70[2];
  __int128 v71;
  uint64_t v72;

  v4 = v3;
  v61 = type metadata accessor for NSFastEnumerationIterator(0);
  v60 = *(_QWORD *)(v61 - 8);
  __chkstk_darwin(v61);
  v65 = (char *)&v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = type metadata accessor for URL(0);
  v63 = *(_QWORD *)(v64 - 8);
  v9 = __chkstk_darwin(v64);
  v11 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v66 = (char *)&v58 - v12;
  type metadata accessor for FileAttributeKey(0);
  sub_100005C90(&qword_100025958, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_10001B100);
  v62 = a1;
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v14 = String._bridgeToObjectiveC()();
  *(_QWORD *)&v67[0] = 0;
  v15 = objc_msgSend(v4, "setAttributes:ofItemAtPath:error:", isa, v14, v67);

  v16 = *(_QWORD *)&v67[0];
  if (!v15)
  {
    v35 = *(id *)&v67[0];
    _convertNSErrorToError(_:)(v16);
LABEL_10:

    return swift_willThrow();
  }
  v17 = *(id *)&v67[0];
  v18 = String._bridgeToObjectiveC()();
  v19 = objc_msgSend(v4, "enumeratorAtPath:", v18);

  if (!v19)
  {
    v36 = static os_log_type_t.fault.getter(v20);
    v37 = sub_100007280(&qword_1000259D8);
    v38 = swift_allocObject(v37, 72, 7);
    *(_OWORD *)(v38 + 16) = xmmword_10001B180;
    *(_QWORD *)(v38 + 56) = &type metadata for String;
    *(_QWORD *)(v38 + 64) = sub_100010248();
    *(_QWORD *)(v38 + 32) = a2;
    *(_QWORD *)(v38 + 40) = a3;
    sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
    v39 = swift_bridgeObjectRetain(a3);
    v40 = (void *)static OS_os_log.default.getter(v39);
    os_log(_:dso:log:type:_:)("Could not create file enumerator for path %{public}@", 52, 2, &_mh_execute_header, v40, v36, v38);
    swift_bridgeObjectRelease(v38);

    static String._unconditionallyBridgeFromObjectiveC(_:)(NSCocoaErrorDomain);
    v42 = v41;
    v43 = objc_allocWithZone((Class)NSError);
    v35 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v42);
    objc_msgSend(v43, "initWithDomain:code:userInfo:", v35, 256, 0);
    goto LABEL_10;
  }
  v21 = URL.init(fileURLWithPath:)(a2, a3);
  v59 = v19;
  v22 = NSEnumerator.makeIterator()(v21);
  NSFastEnumerationIterator.next()(&v71, v22);
  if (v72)
  {
    while (1)
    {
      sub_1000116C4(&v71, v70);
      sub_10000AFEC((uint64_t)v70, (uint64_t)v67);
      v23 = swift_dynamicCast(v69, v67, (char *)&type metadata for Any + 8, &type metadata for String, 6);
      if (!(_DWORD)v23)
        break;
      v24 = v69[0];
      v25 = v69[1];
      v26 = Dictionary._bridgeToObjectiveC()().super.isa;
      URL.appendingPathComponent(_:)(v24, v25);
      v27 = swift_bridgeObjectRelease(v25);
      URL.path.getter(v27);
      v29 = v28;
      v30 = *(void (**)(char *, uint64_t))(v63 + 8);
      v30(v11, v64);
      v31 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v29);
      *(_QWORD *)&v67[0] = 0;
      LOBYTE(v29) = objc_msgSend(v4, "setAttributes:ofItemAtPath:error:", v26, v31, v67);

      v32 = *(id *)&v67[0];
      if ((v29 & 1) == 0)
      {
        v48 = v32;
        _convertNSErrorToError(_:)(v32);

        swift_willThrow();
        sub_100011718(v70);
        (*(void (**)(char *, uint64_t))(v60 + 8))(v65, v61);
        return ((uint64_t (*)(char *, uint64_t))v30)(v66, v64);
      }
      v33 = sub_100011718(v70);
      NSFastEnumerationIterator.next()(&v71, v33);
      if (!v72)
        goto LABEL_7;
    }
    v44 = static os_log_type_t.fault.getter(v23);
    v45 = sub_100007280(&qword_1000259D8);
    v46 = swift_allocObject(v45, 72, 7);
    *(_OWORD *)(v46 + 16) = xmmword_10001B180;
    sub_10000AFEC((uint64_t)v70, (uint64_t)v69);
    v47 = sub_100007280(&qword_100026040);
    if (swift_dynamicCast(v67, v69, (char *)&type metadata for Any + 8, v47, 6))
    {
      sub_10001167C(v67, v46 + 32);
    }
    else
    {
      v68 = 0;
      memset(v67, 0, sizeof(v67));
      *(_QWORD *)(v46 + 56) = &type metadata for String;
      *(_QWORD *)(v46 + 64) = sub_100010248();
      *(_QWORD *)(v46 + 32) = 0x6E776F6E6B6E7528;
      *(_QWORD *)(v46 + 40) = 0xE900000000000029;
      sub_1000077AC((uint64_t)v67, (uint64_t *)&unk_100025D20);
    }
    v49 = v61;
    v50 = v60;
    v51 = v59;
    v52 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
    v53 = (void *)static OS_os_log.default.getter(v52);
    os_log(_:dso:log:type:_:)("FileManager.enumerator returned non-String %{public}@", 53, 2, &_mh_execute_header, v53, v44, v46);
    swift_bridgeObjectRelease(v46);

    static String._unconditionallyBridgeFromObjectiveC(_:)(NSCocoaErrorDomain);
    v55 = v54;
    v56 = objc_allocWithZone((Class)NSError);
    v57 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v55);
    objc_msgSend(v56, "initWithDomain:code:userInfo:", v57, 256, 0);

    swift_willThrow();
    sub_100011718(v70);
    (*(void (**)(char *, uint64_t))(v50 + 8))(v65, v49);
    return (*(uint64_t (**)(char *, uint64_t))(v63 + 8))(v66, v64);
  }
  else
  {
LABEL_7:

    (*(void (**)(char *, uint64_t))(v60 + 8))(v65, v61);
    return (*(uint64_t (**)(char *, uint64_t))(v63 + 8))(v66, v64);
  }
}

uint64_t MADownloadResult.debugDescription.getter(uint64_t a1)
{
  return sub_10000BAC8(a1, 20, 0xD000000000000011, 0x800000010001B9E0, (uint64_t (*)(uint64_t))&MAStringForMADownloadResult);
}

uint64_t sub_10000BA58()
{
  uint64_t *v0;

  return MADownloadResult.debugDescription.getter(*v0);
}

uint64_t MAQueryResult.debugDescription.getter(uint64_t a1)
{
  return sub_10000BAC8(a1, 17, 0x527972657551414DLL, 0xEE0028746C757365, (uint64_t (*)(uint64_t))&MAStringForMAQueryResult);
}

uint64_t sub_10000BA90()
{
  uint64_t *v0;

  return MAQueryResult.debugDescription.getter(*v0);
}

uint64_t MAPurgeResult.debugDescription.getter(uint64_t a1)
{
  return sub_10000BAC8(a1, 17, 0x526567727550414DLL, 0xEE0028746C757365, (uint64_t (*)(uint64_t))&MAStringForMAPurgeResult);
}

uint64_t sub_10000BAC8(uint64_t a1, Swift::Int a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  Swift::String v14;
  Swift::String v15;

  _StringGuts.grow(_:)(a2);
  swift_bridgeObjectRelease(0xE000000000000000);
  v8 = (id)a5(a1);
  if (v8)
  {
    v9 = v8;
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
    v12 = v11;

  }
  else
  {
    v10 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
    v12 = v13;
  }
  v14._countAndFlagsBits = v10;
  v14._object = v12;
  String.append(_:)(v14);
  swift_bridgeObjectRelease(v12);
  v15._countAndFlagsBits = 41;
  v15._object = (void *)0xE100000000000000;
  String.append(_:)(v15);
  return a3;
}

uint64_t sub_10000BBA4()
{
  uint64_t *v0;

  return MAPurgeResult.debugDescription.getter(*v0);
}

uint64_t sub_10000BBAC()
{
  uint64_t result;

  if (qword_100025810 != -1)
    swift_once(&qword_100025810, sub_10000B14C);
  result = qword_100026AE0;
  if (qword_100026AE0)
    result = MobileGestalt_get_internalBuild();
  byte_100026AF0 = result;
  return result;
}

void *sub_10000BBFC()
{
  void *v0;
  void *result;

  if (qword_100025820 != -1)
    swift_once(&qword_100025820, sub_10000BBAC);
  if (byte_100026AF0 == 1)
  {
    v0 = dlopen("/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport", 256);
    result = dlsym(v0, "SimulateCrash");
  }
  else
  {
    result = 0;
  }
  off_100026AF8 = result;
  return result;
}

void sub_10000BC70(id a1)
{
  void (*v2)(uint64_t, _QWORD, NSString);
  id v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  id v8;
  id v9;
  NSString v10;
  NSString v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  Swift::String v49;
  Swift::String v50;
  uint64_t v51;
  Swift::String v52;
  void *object;
  Swift::String v54;
  Swift::String v55;
  void *v56;
  Swift::String v57;
  uint64_t v58;
  Swift::String v59;
  void *v60;
  uint64_t v61;
  NSString v62;
  uint64_t v63;
  void *v64;
  void *v65;
  id v66;
  __int128 v67;
  __int128 v68;

  if (qword_100025820 != -1)
    swift_once(&qword_100025820, sub_10000BBAC);
  if (byte_100026AF0 == 1)
  {
    if (qword_100025828 != -1)
      swift_once(&qword_100025828, sub_10000BBFC);
    v2 = (void (*)(uint64_t, _QWORD, NSString))off_100026AF8;
    if (off_100026AF8)
    {
      v3 = objc_msgSend(a1, "userInfo");
      v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);

      if (*(_QWORD *)(v4 + 16) && (v5 = sub_100017124(0x6150656C6946534ELL, 0xEA00000000006874), (v6 & 1) != 0))
      {
        sub_10000AFEC(*(_QWORD *)(v4 + 56) + 32 * v5, (uint64_t)&v67);
        swift_bridgeObjectRelease(v4);
        if (*((_QWORD *)&v68 + 1))
        {
          v7 = sub_10000738C(0, &qword_100025F90, NSString_ptr);
          if ((swift_dynamicCast(&v66, &v67, (char *)&type metadata for Any + 8, v7, 6) & 1) != 0)
          {
            v8 = v66;
            v9 = objc_msgSend(v66, "stringByDeletingLastPathComponent");
            v10 = v9;
            v11 = v9;
            if (!v9)
            {
              static String._unconditionallyBridgeFromObjectiveC(_:)(0);
              v13 = v12;
              v11 = String._bridgeToObjectiveC()();
              swift_bridgeObjectRelease(v13);
              static String._unconditionallyBridgeFromObjectiveC(_:)(0);
              v15 = v14;
              v10 = String._bridgeToObjectiveC()();
              swift_bridgeObjectRelease(v15);
            }
            v16 = (void *)objc_opt_self(NSFileManager);
            v17 = v9;
            v18 = objc_msgSend(v16, "defaultManager");
            *(_QWORD *)&v67 = 0;
            v19 = objc_msgSend(v18, "contentsOfDirectoryAtPath:error:", v11, &v67);

            v20 = (void *)v67;
            if (v19)
            {
              v63 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v19, &type metadata for String);
              v21 = v20;

            }
            else
            {
              v22 = (id)v67;
              v23 = _convertNSErrorToError(_:)(v20);

              swift_willThrow();
              swift_errorRelease(v23);
              v63 = 0;
            }
            v24 = objc_msgSend(v16, "defaultManager", v63);
            *(_QWORD *)&v67 = 0;
            v65 = v8;
            v25 = objc_msgSend(v24, "attributesOfItemAtPath:error:", v8, &v67);

            v26 = (void *)v67;
            if (v25)
            {
              type metadata accessor for FileAttributeKey(0);
              v28 = v27;
              v29 = sub_100005C90(&qword_100025958, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_10001B100);
              v30 = (void *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v25, v28, (char *)&type metadata for Any + 8, v29);
              v31 = v26;

            }
            else
            {
              v32 = (id)v67;
              v33 = _convertNSErrorToError(_:)(v26);

              swift_willThrow();
              swift_errorRelease(v33);
              v30 = 0;
            }
            v34 = objc_msgSend(v16, "defaultManager");
            *(_QWORD *)&v67 = 0;
            v35 = objc_msgSend(v34, "attributesOfItemAtPath:error:", v10, &v67);

            v36 = (void *)v67;
            if (v35)
            {
              type metadata accessor for FileAttributeKey(0);
              v38 = v37;
              v39 = sub_100005C90(&qword_100025958, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_10001B100);
              v40 = (void *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v35, v38, (char *)&type metadata for Any + 8, v39);
              v41 = v36;

            }
            else
            {
              v42 = (id)v67;
              v43 = _convertNSErrorToError(_:)(v36);

              swift_willThrow();
              swift_errorRelease(v43);
              v40 = 0;
            }
            v44 = getpid();
            *(_QWORD *)&v67 = 0;
            *((_QWORD *)&v67 + 1) = 0xE000000000000000;
            _StringGuts.grow(_:)(82);
            v45 = objc_msgSend(a1, "description");
            v46 = static String._unconditionallyBridgeFromObjectiveC(_:)(v45);
            v48 = v47;

            v49._countAndFlagsBits = v46;
            v49._object = v48;
            String.append(_:)(v49);
            swift_bridgeObjectRelease(v48);
            v50._countAndFlagsBits = 0xD00000000000001BLL;
            v50._object = (void *)0x800000010001C0C0;
            String.append(_:)(v50);
            v66 = v30;
            v51 = sub_100007280(&qword_100025D30);
            v52._countAndFlagsBits = String.init<A>(describing:)(&v66, v51);
            object = v52._object;
            String.append(_:)(v52);
            swift_bridgeObjectRelease(object);
            v54._countAndFlagsBits = 0xD00000000000001ALL;
            v54._object = (void *)0x800000010001C0E0;
            String.append(_:)(v54);
            v66 = v40;
            v55._countAndFlagsBits = String.init<A>(describing:)(&v66, v51);
            v56 = v55._object;
            String.append(_:)(v55);
            swift_bridgeObjectRelease(v56);
            v57._object = (void *)0x800000010001C100;
            v57._countAndFlagsBits = 0xD000000000000015;
            String.append(_:)(v57);
            v66 = v64;
            v58 = sub_100007280(&qword_100025D38);
            v59._countAndFlagsBits = String.init<A>(describing:)(&v66, v58);
            v60 = v59._object;
            String.append(_:)(v59);
            swift_bridgeObjectRelease(v60);
            v61 = *((_QWORD *)&v67 + 1);
            v62 = String._bridgeToObjectiveC()();
            swift_bridgeObjectRelease(v61);
            v2(v44, 0, v62);

          }
          return;
        }
      }
      else
      {
        v67 = 0u;
        v68 = 0u;
        swift_bridgeObjectRelease(v4);
      }
      sub_1000077AC((uint64_t)&v67, (uint64_t *)&unk_100025CD0);
    }
  }
}

uint64_t sub_10000C24C()
{
  return 1;
}

Swift::Int sub_10000C254()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

void sub_10000C294()
{
  Hasher._combine(_:)(0);
}

Swift::Int sub_10000C2B8(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

uint64_t sub_10000C314()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t inited;
  uint64_t v8;
  NSString *v9;
  NSString *v10;
  unint64_t v11;
  Class isa;
  NSString v13;
  unsigned __int8 v14;
  id v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  NSString v22;
  unint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  _BYTE v34[72];

  v0 = (char *)String.utf8CString.getter();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v0 = sub_1000105E8((uint64_t)v0);
  if (!mkdtemp(v0 + 32))
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(NSPOSIXErrorDomain);
    v19 = v18;
    v20 = (int)errno.getter();
    v21 = objc_allocWithZone((Class)NSError);
    v22 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v19);
    objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, v20, 0);

LABEL_9:
    swift_willThrow();
    return swift_release(v0);
  }
  v1 = String.init(validatingUTF8:)();
  if (!v2)
  {
    v23 = sub_100011738();
    swift_allocError(&type metadata for TemporaryDirectoryError, v23, 0, 0);
    goto LABEL_9;
  }
  v3 = v1;
  v4 = v2;
  swift_release(v0);
  v5 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  v6 = sub_100007280(&qword_100025CE0);
  inited = swift_initStackObject(v6, v34);
  *(_OWORD *)(inited + 16) = xmmword_10001B180;
  *(_QWORD *)(inited + 32) = NSFileProtectionKey;
  type metadata accessor for FileProtectionType(0);
  *(_QWORD *)(inited + 64) = v8;
  *(_QWORD *)(inited + 40) = NSFileProtectionNone;
  v9 = NSFileProtectionKey;
  v10 = NSFileProtectionNone;
  v11 = sub_1000138C4(inited);
  type metadata accessor for FileAttributeKey(0);
  sub_100005C90(&qword_100025958, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_10001B100);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v11);
  v13 = String._bridgeToObjectiveC()();
  v33 = 0;
  v14 = objc_msgSend(v5, "setAttributes:ofItemAtPath:error:", isa, v13, &v33);

  v15 = v33;
  if ((v14 & 1) != 0)
  {
    v16 = v33;
    URL.init(fileURLWithPath:)(v3, v4);
    return swift_bridgeObjectRelease(v4);
  }
  else
  {
    v24 = v33;
    swift_bridgeObjectRelease(v4);
    v25 = _convertNSErrorToError(_:)(v15);

    v26 = swift_willThrow();
    v27 = static os_log_type_t.fault.getter(v26);
    v28 = sub_100007280(&qword_1000259D8);
    v29 = swift_allocObject(v28, 72, 7);
    *(_OWORD *)(v29 + 16) = xmmword_10001B180;
    v30 = _convertErrorToNSError(_:)(v25);
    *(_QWORD *)(v29 + 56) = sub_10000738C(0, (unint64_t *)&unk_100025F80, NSObject_ptr);
    *(_QWORD *)(v29 + 64) = sub_100007308((unint64_t *)&qword_100025D00, (unint64_t *)&unk_100025F80, NSObject_ptr);
    *(_QWORD *)(v29 + 32) = v30;
    v31 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
    v32 = (void *)static OS_os_log.default.getter(v31);
    os_log(_:dso:log:type:_:)("Could not set protection class on temporary directory: %{public}@", 65, 2, &_mh_execute_header, v32, v27, v29);
    swift_bridgeObjectRelease(v29);

    return swift_willThrow();
  }
}

id sub_10000C6B0()
{
  uint64_t v0;
  id result;

  if (*(_BYTE *)(v0 + 48) != 1)
    return *(id *)(v0 + 40);
  result = objc_msgSend(*(id *)(v0 + 16), "state");
  *(_QWORD *)(v0 + 40) = result;
  *(_BYTE *)(v0 + 48) = 0;
  return result;
}

uint64_t sub_10000C6F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v18;
  _BYTE v19[24];
  _BYTE v20[24];

  v3 = sub_100007280((uint64_t *)&unk_100025AF0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v19[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_100007280(&qword_100025CC8);
  v8 = __chkstk_darwin(v7);
  v10 = &v19[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v8);
  v12 = &v19[-v11];
  v13 = v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___localURL;
  swift_beginAccess(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___localURL, v20, 0, 0);
  sub_100011818(v13, (uint64_t)v12, &qword_100025CC8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v4 + 48))(v12, 1, v3) != 1)
    return sub_100007348((uint64_t)v12, a1, (uint64_t *)&unk_100025AF0);
  sub_1000077AC((uint64_t)v12, &qword_100025CC8);
  v14 = objc_msgSend(*(id *)(v1 + 16), "getLocalFileUrl");
  if (v14)
  {
    v15 = v14;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    v16 = type metadata accessor for URL(0);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v6, 0, 1, v16);
  }
  else
  {
    v18 = type metadata accessor for URL(0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v6, 1, 1, v18);
  }
  sub_100007348((uint64_t)v6, a1, (uint64_t *)&unk_100025AF0);
  sub_100011818(a1, (uint64_t)v10, (uint64_t *)&unk_100025AF0);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v4 + 56))(v10, 0, 1, v3);
  swift_beginAccess(v13, v19, 33, 0);
  sub_10001185C((uint64_t)v10, v13);
  return swift_endAccess(v19);
}

uint64_t sub_10000C910@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
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
  __int16 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
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
  __int16 v43;

  v3 = v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info;
  v4 = *(_QWORD *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info);
  v5 = *(_QWORD *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 8);
  v6 = *(_QWORD *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 16);
  v7 = *(_QWORD *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 24);
  v8 = *(_QWORD *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 32);
  v9 = *(_QWORD *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 40);
  v10 = *(_QWORD *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 48);
  v34 = v5;
  v35 = v4;
  v11 = v6;
  v12 = v7;
  v13 = v8;
  v14 = v9;
  v15 = v10;
  v16 = *(_WORD *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 56);
  if (v5 == 1)
  {
    v32 = *(_QWORD *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 24);
    v33 = *(_QWORD *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info);
    v17 = v1;
    v30 = *(_QWORD *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 40);
    v31 = *(_QWORD *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 16);
    v29 = *(_QWORD *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 32);
    v18 = *(_QWORD *)(v1 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 48);
    sub_10000CA88(v17, (uint64_t)&v36);
    v19 = v37;
    v20 = v38;
    v12 = v39;
    v13 = v40;
    v14 = v41;
    v15 = v42;
    v16 = v43;
    v28 = *(_QWORD *)v3;
    v27 = *(_QWORD *)(v3 + 8);
    v26 = *(_QWORD *)(v3 + 16);
    v25 = *(_QWORD *)(v3 + 24);
    v24 = *(_QWORD *)(v3 + 32);
    v23 = *(_QWORD *)(v3 + 40);
    v22 = *(_QWORD *)(v3 + 48);
    v34 = v37;
    v35 = v36;
    *(_QWORD *)v3 = v36;
    *(_QWORD *)(v3 + 8) = v19;
    v11 = v20;
    *(_QWORD *)(v3 + 16) = v20;
    *(_QWORD *)(v3 + 24) = v12;
    *(_QWORD *)(v3 + 32) = v13;
    *(_QWORD *)(v3 + 40) = v14;
    *(_QWORD *)(v3 + 48) = v15;
    *(_WORD *)(v3 + 56) = v16;
    sub_10001177C((uint64_t)&v36, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1000117B8);
    sub_100010E14(v28, v27, v26, v25, v24, v23, v22);
    v10 = v18;
    v8 = v29;
    v9 = v30;
    v6 = v31;
    v7 = v32;
    v4 = v33;
  }
  result = sub_100011808(v4, v5, v6, v7, v8, v9, v10);
  *(_QWORD *)a1 = v35;
  *(_QWORD *)(a1 + 8) = v34;
  *(_QWORD *)(a1 + 16) = v11;
  *(_QWORD *)(a1 + 24) = v12;
  *(_QWORD *)(a1 + 32) = v13;
  *(_QWORD *)(a1 + 40) = v14;
  *(_QWORD *)(a1 + 48) = v15;
  *(_WORD *)(a1 + 56) = v16;
  return result;
}

void sub_10000CA88(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int16 v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  int v55;
  unsigned int v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD v61[7];
  __int16 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[26];
  __int128 v66;
  __int128 v67;
  _OWORD v68[3];

  v4 = sub_100007280((uint64_t *)&unk_100025AF0);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v54 - v8;
  v10 = type metadata accessor for URL(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_10000C6B0() != (id)2)
    goto LABEL_4;
  sub_10000C6F0((uint64_t)v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v9, v10);
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v7, v13, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
    sub_1000064B0((uint64_t)v7, (uint64_t)v61);
    v60 = v61[0];
    v57 = (char *)v61[1];
    v59 = v61[2];
    v58 = v61[3];
    v26 = v13;
    v22 = v61[4];
    v23 = v61[5];
    v24 = v61[6];
    v25 = v62;
    v27 = sub_100007348((uint64_t)v61, (uint64_t)&v63, (uint64_t *)&unk_100025FF0);
    v19 = (char *)*((_QWORD *)&v63 + 1);
    if (*((_QWORD *)&v63 + 1))
    {
      v57 = v26;
      v66 = v63;
      v67 = v64;
      v68[0] = *(_OWORD *)v65;
      *(_OWORD *)((char *)v68 + 10) = *(_OWORD *)&v65[10];
      v60 = v63;
      v59 = v64;
      v22 = *(_QWORD *)v65;
      v58 = *((_QWORD *)&v64 + 1);
      v23 = *(_QWORD *)&v65[8];
      v24 = *(_QWORD *)&v65[16];
      v56 = v65[24];
      v55 = v65[25];
      v28 = sub_10000628C();
      v30 = v29;
      v32 = *(_QWORD *)(a1 + 24);
      v31 = *(_QWORD *)(a1 + 32);
      if (v28 == v32 && v29 == v31)
      {
        swift_bridgeObjectRelease(v29);
      }
      else
      {
        v40 = *(_QWORD *)(a1 + 24);
        v54 = *(_QWORD *)(a1 + 32);
        v41 = _stringCompareWithSmolCheck(_:_:expecting:)(v28, v29, v40, v31, 0);
        v42 = swift_bridgeObjectRelease(v30);
        if ((v41 & 1) == 0)
        {
          v44 = static os_log_type_t.error.getter(v42);
          v45 = sub_100007280(&qword_1000259D8);
          v46 = swift_allocObject(v45, 112, 7);
          *(_OWORD *)(v46 + 16) = xmmword_10001B160;
          *(_QWORD *)(v46 + 56) = &type metadata for String;
          v47 = sub_100010248();
          *(_QWORD *)(v46 + 64) = v47;
          v48 = v54;
          *(_QWORD *)(v46 + 32) = v32;
          *(_QWORD *)(v46 + 40) = v48;
          swift_bridgeObjectRetain(v48);
          v49 = sub_10000628C();
          v51 = v50;
          sub_10001177C((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_100007820);
          *(_QWORD *)(v46 + 96) = &type metadata for String;
          *(_QWORD *)(v46 + 104) = v47;
          *(_QWORD *)(v46 + 72) = v49;
          *(_QWORD *)(v46 + 80) = v51;
          v52 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
          v53 = (void *)static OS_os_log.default.getter(v52);
          os_log(_:dso:log:type:_:)("Asset attribute version %{public}@ does not match info version %{public}@", 73, 2, &_mh_execute_header, v53, v44, v46);
          swift_bridgeObjectRelease(v46);

          (*(void (**)(char *, uint64_t))(v11 + 8))(v57, v10);
          goto LABEL_4;
        }
      }
      (*(void (**)(char *, uint64_t))(v11 + 8))(v57, v10);
      if (v55)
        v43 = 256;
      else
        v43 = 0;
      v25 = v43 | v56;
      v18 = v60;
    }
    else
    {
      v56 = static os_log_type_t.error.getter(v27);
      v33 = sub_100007280(&qword_1000259D8);
      v34 = swift_allocObject(v33, 72, 7);
      *(_OWORD *)(v34 + 16) = xmmword_10001B180;
      v35 = v26;
      URL._bridgeToObjectiveC()((NSURL *)&unk_10001B000);
      v37 = v36;
      *(_QWORD *)(v34 + 56) = sub_10000738C(0, (unint64_t *)&unk_100025D50, NSURL_ptr);
      *(_QWORD *)(v34 + 64) = sub_100007308(&qword_1000259E0, (unint64_t *)&unk_100025D50, NSURL_ptr);
      *(_QWORD *)(v34 + 32) = v37;
      v38 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
      v39 = (void *)static OS_os_log.default.getter(v38);
      os_log(_:dso:log:type:_:)("Cannot fetch info from installed asset at %{public}@", 52, 2, &_mh_execute_header, v39, v56, v34);
      swift_bridgeObjectRelease(v34);

      v18 = v60;
      (*(void (**)(char *, uint64_t))(v11 + 8))(v35, v10);
      v19 = v57;
    }
    v20 = v59;
    v21 = v58;
    goto LABEL_16;
  }
  v14 = sub_1000077AC((uint64_t)v9, (uint64_t *)&unk_100025AF0);
  v15 = static os_log_type_t.error.getter(v14);
  v16 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
  v17 = (void *)static OS_os_log.default.getter(v16);
  os_log(_:dso:log:type:_:)("Nil localURL for installed asset", 32, 2, &_mh_execute_header, v17, v15, &_swiftEmptyArrayStorage);

LABEL_4:
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  v22 = 0;
  v23 = 0;
  v24 = 0;
  v25 = 0;
LABEL_16:
  *(_QWORD *)a2 = v18;
  *(_QWORD *)(a2 + 8) = v19;
  *(_QWORD *)(a2 + 16) = v20;
  *(_QWORD *)(a2 + 24) = v21;
  *(_QWORD *)(a2 + 32) = v22;
  *(_QWORD *)(a2 + 40) = v23;
  *(_QWORD *)(a2 + 48) = v24;
  *(_WORD *)(a2 + 56) = v25;
}

uint64_t sub_10000CFE0(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = v1;
  *(_QWORD *)(v2 + 40) = 0;
  *(_BYTE *)(v2 + 48) = 1;
  v4 = v2 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___localURL;
  v5 = sub_100007280((uint64_t *)&unk_100025AF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v6 = (_OWORD *)(v2 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info);
  *v6 = xmmword_10001B1A0;
  v6[1] = 0u;
  v6[2] = 0u;
  *(_OWORD *)((char *)v6 + 42) = 0u;
  *(_QWORD *)(v2 + 16) = a1;
  v7 = a1;
  v8 = sub_10000B170();
  v10 = v9;

  if (v10)
  {
    *(_QWORD *)(v2 + 24) = v8;
    *(_QWORD *)(v2 + 32) = v10;
  }
  else
  {

    sub_1000077AC(v2 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___localURL, &qword_100025CC8);
    sub_100010E14(*(_QWORD *)(v2 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info), *(_QWORD *)(v2 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 8), *(_QWORD *)(v2 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 16), *(_QWORD *)(v2 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 24), *(_QWORD *)(v2 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 32), *(_QWORD *)(v2 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 40), *(_QWORD *)(v2 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 48));
    v11 = type metadata accessor for TZSAsset(0);
    swift_deallocPartialClassInstance(v2, v11, *(unsigned int *)(*(_QWORD *)v2 + 48), *(unsigned __int16 *)(*(_QWORD *)v2 + 52));
    return 0;
  }
  return v2;
}

void **sub_10000D104(void **a1, void *a2, uint64_t a3, unint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
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
  void *v29;
  void *v30;
  _QWORD *v31;
  void *v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void **result;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t i;
  uint64_t v49;
  uint64_t v50;
  id v51;
  void *v52;
  uint64_t v53;
  id v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  unint64_t v67;
  id v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  void **v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  _QWORD *v83;
  void *v84;
  _QWORD *v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  char *v93;
  char *v94;
  uint64_t v95;
  __int128 v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  void *v101;
  uint64_t v102;
  _QWORD v103[2];
  unint64_t aBlock;
  uint64_t v105;
  uint64_t (*v106)(uint64_t);
  void *v107;
  uint64_t (*v108)();
  _QWORD *v109;

  v97 = a3;
  v7 = type metadata accessor for DispatchWorkItemFlags(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v92 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for DispatchQoS(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v92 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_100007280(&qword_100025A10);
  v16 = __chkstk_darwin(v15);
  v18 = (char *)&v92 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v98 = v12;
  v99 = v8;
  if (a1)
  {
    v19 = static os_log_type_t.error.getter(v16);
    v20 = sub_100007280(&qword_1000259D8);
    v21 = v14;
    v22 = swift_allocObject(v20, 72, 7);
    *(_OWORD *)(v22 + 16) = xmmword_10001B180;
    aBlock = (unint64_t)a1;
    type metadata accessor for MAQueryResult(0);
    v24 = String.init<A>(describing:)(&aBlock, v23);
    v25 = v7;
    v27 = v26;
    *(_QWORD *)(v22 + 56) = &type metadata for String;
    *(_QWORD *)(v22 + 64) = sub_100010248();
    *(_QWORD *)(v22 + 32) = v24;
    *(_QWORD *)(v22 + 40) = v27;
    v28 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
    v29 = (void *)static OS_os_log.default.getter(v28);
    os_log(_:dso:log:type:_:)("MobileAsset query failed, error %{public}@", 42, 2, &_mh_execute_header, v29, v19, v22);
    swift_bridgeObjectRelease(v22);

    sub_10000738C(0, (unint64_t *)&unk_100025C00, OS_dispatch_queue_ptr);
    v30 = (void *)static OS_dispatch_queue.main.getter();
    v31 = (_QWORD *)swift_allocObject(&unk_100020F80, 48, 7);
    v31[2] = v97;
    v31[3] = a4;
    v31[4] = 0;
    v31[5] = a1;
    v108 = sub_100010D9C;
    v109 = v31;
    aBlock = (unint64_t)_NSConcreteStackBlock;
    v105 = 1107296256;
    v106 = sub_100013674;
    v107 = &unk_100020F98;
    v32 = _Block_copy(&aBlock);
    v33 = v109;
    swift_retain(a4);
    v34 = swift_release(v33);
    static DispatchQoS.unspecified.getter(v34);
    aBlock = (unint64_t)&_swiftEmptyArrayStorage;
    v35 = sub_100005C90((unint64_t *)&qword_100025FD0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v36 = sub_100007280((uint64_t *)&unk_100025C10);
    v37 = sub_10000B0FC((unint64_t *)&qword_100025FE0, (uint64_t *)&unk_100025C10, (uint64_t)&protocol conformance descriptor for [A]);
    dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v36, v37, v25, v35);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v21, v10, v32);
    _Block_release(v32);

    (*(void (**)(char *, uint64_t))(v99 + 8))(v10, v25);
    return (void **)(*(uint64_t (**)(char *, uint64_t))(v98 + 8))(v21, v11);
  }
  v101 = (void *)a4;
  v93 = v14;
  v94 = v10;
  v39 = objc_msgSend(a2, "results");
  v95 = v11;
  if (v39)
  {
    v102 = sub_10000738C(0, &qword_100025CA0, MAAsset_ptr);
    v40 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v39, v102);

    v42 = static os_log_type_t.info.getter(v41);
    v100 = sub_100007280(&qword_1000259D8);
    v43 = swift_allocObject(v100, 72, 7);
    v96 = xmmword_10001B180;
    *(_OWORD *)(v43 + 16) = xmmword_10001B180;
    *(_QWORD *)(v43 + 56) = sub_100007280(&qword_100025CA8);
    *(_QWORD *)(v43 + 64) = sub_10000B0FC(&qword_100025CB0, &qword_100025CA8, (uint64_t)&protocol conformance descriptor for [A]);
    *(_QWORD *)(v43 + 32) = v40;
    sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
    v44 = swift_bridgeObjectRetain(v40);
    v45 = (void *)static OS_os_log.default.getter(v44);
    os_log(_:dso:log:type:_:)("Query returned results %{public}@", 33, 2, &_mh_execute_header, v45, v42, v43);
    swift_bridgeObjectRelease(v43);

    aBlock = (unint64_t)&_swiftEmptyArrayStorage;
    v46 = v101;
    if ((unint64_t)v40 >> 62)
    {
      if (v40 < 0)
        v63 = v40;
      else
        v63 = v40 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v40);
      v47 = _CocoaArrayWrapper.endIndex.getter(v63);
      swift_bridgeObjectRelease(v40);
      v92 = v7;
      if (v47)
      {
LABEL_6:
        if (v47 < 1)
        {
          __break(1u);
          goto LABEL_52;
        }
        for (i = 0; i != v47; ++i)
        {
          if ((v40 & 0xC000000000000001) != 0)
            v54 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v40);
          else
            v54 = *(id *)(v40 + 8 * i + 32);
          v55 = v54;
          sub_10000B170();
          v57 = v56;
          v58 = swift_bridgeObjectRelease(v56);
          if (v57)
          {
            specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v58);
            v59 = *(void **)(aBlock + 16);
            specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v59);
            v60 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v59, v55);
            specialized ContiguousArray._endMutation()(v60);
          }
          else
          {
            v49 = static os_log_type_t.error.getter(v58);
            v50 = swift_allocObject(v100, 72, 7);
            *(_OWORD *)(v50 + 16) = v96;
            *(_QWORD *)(v50 + 56) = v102;
            *(_QWORD *)(v50 + 64) = sub_100007308(&qword_100025CB8, &qword_100025CA0, MAAsset_ptr);
            *(_QWORD *)(v50 + 32) = v55;
            v51 = v55;
            v52 = (void *)static OS_os_log.default.getter(v51);
            os_log(_:dso:log:type:_:)("Malformed asset; could not read tz version: %{public}@",
              54,
              2,
              &_mh_execute_header,
              v52,
              v49,
              v50);

            v53 = v50;
            v46 = v101;
            swift_bridgeObjectRelease(v53);

          }
        }
        swift_bridgeObjectRelease(v40);
        a4 = aBlock;
        if ((aBlock & 0x8000000000000000) != 0)
        {
LABEL_46:
          while (1)
          {
            v81 = swift_retain(a4);
            result = (void **)_CocoaArrayWrapper.endIndex.getter(v81);
            v102 = (uint64_t)result;
            if (!result)
              goto LABEL_47;
LABEL_25:
            v100 = a4 & 0xC000000000000001;
            if ((a4 & 0xC000000000000001) != 0)
            {
LABEL_52:
              v65 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, a4);
            }
            else
            {
              if (!*(_QWORD *)(a4 + 16))
              {
                __break(1u);
LABEL_54:
                __break(1u);
LABEL_55:
                __break(1u);
                return result;
              }
              v65 = *(id *)(a4 + 32);
            }
            v46 = v65;
            if (v102 == 1)
            {
LABEL_43:
              swift_release_n(a4, 2);
              v80 = type metadata accessor for TZSAsset(0);
              swift_allocObject(v80, *(unsigned int *)(v80 + 48), *(unsigned __int16 *)(v80 + 52));
              v39 = (id)sub_10000CFE0(v46);
              v62 = v92;
              v46 = v101;
              goto LABEL_48;
            }
            v66 = 5;
            while (1)
            {
              v67 = v66 - 4;
              if (v100)
              {
                v68 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v66 - 4, a4);
              }
              else
              {
                if (v67 >= *(_QWORD *)(a4 + 16))
                  goto LABEL_45;
                v68 = *(id *)(a4 + 8 * v66);
              }
              v69 = v68;
              v70 = v66 - 3;
              if (__OFADD__(v67, 1))
                break;
              result = (void **)sub_10000B170();
              if (!v71)
                goto LABEL_54;
              v72 = result;
              v73 = v71;
              result = (void **)sub_10000B170();
              if (!v74)
                goto LABEL_55;
              v75 = v74;
              aBlock = (unint64_t)v72;
              v105 = v73;
              v103[0] = result;
              v103[1] = v74;
              v76 = type metadata accessor for Locale(0);
              (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v76 - 8) + 56))(v18, 1, 1, v76);
              v77 = sub_100007768();
              v78 = StringProtocol.compare<A>(_:options:range:locale:)(v103, 64, 0, 0, 1, v18, &type metadata for String, &type metadata for String, v77, v77);
              sub_1000077AC((uint64_t)v18, &qword_100025A10);
              swift_bridgeObjectRelease(v73);
              swift_bridgeObjectRelease(v75);
              if (v78 == -1)
                v79 = v46;
              else
                v79 = v69;
              if (v78 == -1)
                v46 = v69;

              ++v66;
              if (v70 == v102)
                goto LABEL_43;
            }
            __break(1u);
LABEL_45:
            __break(1u);
          }
        }
LABEL_23:
        if ((a4 & 0x4000000000000000) != 0)
          goto LABEL_46;
        v64 = *(_QWORD *)(a4 + 16);
        result = (void **)swift_retain(a4);
        v102 = v64;
        if (v64)
          goto LABEL_25;
LABEL_47:
        swift_release_n(a4, 2);
        v39 = 0;
        v62 = v92;
LABEL_48:
        v61 = v97;
        goto LABEL_49;
      }
    }
    else
    {
      v47 = *(_QWORD *)((v40 & 0xFFFFFFFFFFFFF8) + 0x10);
      v92 = v7;
      if (v47)
        goto LABEL_6;
    }
    swift_bridgeObjectRelease(v40);
    a4 = (unint64_t)&_swiftEmptyArrayStorage;
    if (((unint64_t)&_swiftEmptyArrayStorage & 0x8000000000000000) != 0)
      goto LABEL_46;
    goto LABEL_23;
  }
  v46 = v101;
  v61 = v97;
  v62 = v7;
LABEL_49:
  sub_10000738C(0, (unint64_t *)&unk_100025C00, OS_dispatch_queue_ptr);
  v82 = (void *)static OS_dispatch_queue.main.getter();
  v83 = (_QWORD *)swift_allocObject(&unk_100020FD0, 40, 7);
  v83[2] = v61;
  v83[3] = v46;
  v83[4] = v39;
  v108 = sub_100010DE8;
  v109 = v83;
  aBlock = (unint64_t)_NSConcreteStackBlock;
  v105 = 1107296256;
  v106 = sub_100013674;
  v107 = &unk_100020FE8;
  v84 = _Block_copy(&aBlock);
  v85 = v109;
  swift_retain(v39);
  swift_retain(v46);
  v86 = swift_release(v85);
  v87 = v93;
  static DispatchQoS.unspecified.getter(v86);
  aBlock = (unint64_t)&_swiftEmptyArrayStorage;
  v88 = sub_100005C90((unint64_t *)&qword_100025FD0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v89 = sub_100007280((uint64_t *)&unk_100025C10);
  v90 = sub_10000B0FC((unint64_t *)&qword_100025FE0, (uint64_t *)&unk_100025C10, (uint64_t)&protocol conformance descriptor for [A]);
  v91 = v94;
  dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v89, v90, v62, v88);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v87, v91, v84);
  _Block_release(v84);
  swift_release(v39);

  (*(void (**)(char *, uint64_t))(v99 + 8))(v91, v62);
  return (void **)(*(uint64_t (**)(char *, uint64_t))(v98 + 8))(v87, v95);
}

uint64_t sub_10000DA74(void (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = sub_100010D40();
  v8 = swift_allocError(&type metadata for TZError, v7, 0, 0);
  *(_QWORD *)v9 = a4;
  *(_BYTE *)(v9 + 8) = 1;
  a1(a3, v8);
  return swift_errorRelease(v8);
}

void sub_10000DAF0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD aBlock[6];

  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchQoS(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v11 = static os_log_type_t.error.getter(v8);
    v12 = sub_100007280(&qword_1000259D8);
    v13 = swift_allocObject(v12, 72, 7);
    *(_OWORD *)(v13 + 16) = xmmword_10001B180;
    aBlock[0] = a1;
    type metadata accessor for MADownloadResult(0);
    v15 = String.init<A>(describing:)(aBlock, v14);
    v17 = v16;
    *(_QWORD *)(v13 + 56) = &type metadata for String;
    *(_QWORD *)(v13 + 64) = sub_100010248();
    *(_QWORD *)(v13 + 32) = v15;
    *(_QWORD *)(v13 + 40) = v17;
    v18 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
    v19 = (void *)static OS_os_log.default.getter(v18);
    os_log(_:dso:log:type:_:)("Catalog download failed: %{public}@", 35, 2, &_mh_execute_header, v19, v11, v13);
    swift_bridgeObjectRelease(v13);

  }
  else
  {
    v20 = static os_log_type_t.info.getter(v8);
    v30 = v3;
    v21 = v20;
    v22 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
    v23 = (void *)static OS_os_log.default.getter(v22);
    os_log(_:dso:log:type:_:)("Catalog download successful", 27, 2, &_mh_execute_header, v23, v21, &_swiftEmptyArrayStorage);

    sub_10000738C(0, (unint64_t *)&unk_100025C00, OS_dispatch_queue_ptr);
    v24 = (void *)static OS_dispatch_queue.main.getter();
    aBlock[4] = sub_10000DDF8;
    aBlock[5] = 0;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100013674;
    aBlock[3] = &unk_100020EA8;
    v25 = _Block_copy(aBlock);
    static DispatchQoS.unspecified.getter(v25);
    aBlock[0] = &_swiftEmptyArrayStorage;
    v26 = sub_100005C90((unint64_t *)&qword_100025FD0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v27 = sub_100007280((uint64_t *)&unk_100025C10);
    v28 = sub_10000B0FC((unint64_t *)&qword_100025FE0, (uint64_t *)&unk_100025C10, (uint64_t)&protocol conformance descriptor for [A]);
    dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v27, v28, v2, v26);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v10, v5, v25);
    _Block_release(v25);

    (*(void (**)(char *, uint64_t))(v30 + 8))(v5, v2);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
}

uint64_t sub_10000DDF8(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;

  if (qword_100025830 != -1)
    a1 = swift_once(&qword_100025830, sub_100013B30);
  v1 = (void *)qword_100026B00;
  v2 = static os_log_type_t.debug.getter(a1);
  v3 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
  v4 = (void *)static OS_os_log.default.getter(v3);
  os_log(_:dso:log:type:_:)("New asset metadata notification", 31, 2, &_mh_execute_header, v4, v2, &_swiftEmptyArrayStorage);

  v5 = os_transaction_create("com.apple.tzd.newMetadata");
  v6 = swift_allocObject(&unk_100020EE0, 32, 7);
  *(_QWORD *)(v6 + 16) = v5;
  *(_QWORD *)(v6 + 24) = v1;
  swift_unknownObjectRetain_n(v5, 2);
  v7 = v1;
  v8 = static os_log_type_t.debug.getter(v7);
  v9 = sub_100007280(&qword_1000259D8);
  v10 = swift_allocObject(v9, 72, 7);
  *(_OWORD *)(v10 + 16) = xmmword_10001B180;
  *(_QWORD *)(v10 + 56) = &type metadata for String;
  v11 = sub_100010248();
  *(_QWORD *)(v10 + 64) = v11;
  *(_QWORD *)(v10 + 32) = 0x65736C6166;
  *(_QWORD *)(v10 + 40) = 0xE500000000000000;
  v12 = (void *)static OS_os_log.default.getter(v11);
  os_log(_:dso:log:type:_:)("Beginning advancePipeline with forceCatalogDownload: %{public}@", 63, 2, &_mh_execute_header, v12, v8, v10);
  swift_bridgeObjectRelease(v10);

  sub_100010948(sub_1000102A8, v6);
  swift_unknownObjectRelease_n(v5, 2);
  return swift_release(v6);
}

uint64_t sub_10000DFB0(_QWORD *a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v41[4];
  __n128 v42[4];

  v6 = sub_100007280(&qword_100025A10);
  v7 = __chkstk_darwin(v6);
  v9 = (char *)v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    swift_errorRetain(a2);
    a3(0, 0, a2);
    return swift_errorRelease(a2);
  }
  if (a1)
  {
    swift_retain(a1);
    sub_1000075B4(v42);
    v11 = sub_10000628C();
    v13 = v12;
    sub_100007870(v42);
    v15 = a1[3];
    v14 = a1[4];
    v41[2] = v11;
    v41[3] = v13;
    v41[0] = v15;
    v41[1] = v14;
    v16 = type metadata accessor for Locale(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v9, 1, 1, v16);
    v17 = sub_100007768();
    swift_bridgeObjectRetain(v14);
    v18 = StringProtocol.compare<A>(_:options:range:locale:)(v41, 64, 0, 0, 1, v9, &type metadata for String, &type metadata for String, v17, v17);
    sub_1000077AC((uint64_t)v9, &qword_100025A10);
    v19 = swift_bridgeObjectRelease(v13);
    if (v18 == -1)
    {
      v26 = (char *)sub_10000C6B0();
      if ((unint64_t)(v26 - 2) < 2)
      {
        sub_10000E57C();
        goto LABEL_7;
      }
      if (v26 == (char *)1)
      {
        sub_10000F664();
        goto LABEL_7;
      }
      if (v26 != (char *)4)
      {
        v31 = static os_log_type_t.error.getter(v26);
        v32 = sub_100007280(&qword_1000259D8);
        v33 = swift_allocObject(v32, 72, 7);
        *(_OWORD *)(v33 + 16) = xmmword_10001B180;
        v34 = (void *)a1[2];
        *(_QWORD *)(v33 + 56) = sub_10000738C(0, &qword_100025CA0, MAAsset_ptr);
        *(_QWORD *)(v33 + 64) = sub_100007308(&qword_100025CB8, &qword_100025CA0, MAAsset_ptr);
        *(_QWORD *)(v33 + 32) = v34;
        sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
        v35 = (void *)static OS_os_log.default.getter(v34);
        os_log(_:dso:log:type:_:)("Unexpected state for asset %{public}@", 37, 2, &_mh_execute_header, v35, v31, v33);
        swift_bridgeObjectRelease(v33);

        v36 = a1[5];
        v37 = sub_100010D40();
        v38 = swift_allocError(&type metadata for TZError, v37, 0, 0);
        *(_QWORD *)v39 = v36;
        *(_BYTE *)(v39 + 8) = 0;
        swift_bridgeObjectRetain(v14);
        a3(v15, v14, v38);
        swift_errorRelease(v38);
        swift_bridgeObjectRelease(v14);
        goto LABEL_7;
      }
      v27 = static os_log_type_t.info.getter(4);
      v28 = sub_100007280(&qword_1000259D8);
      v29 = swift_allocObject(v28, 72, 7);
      *(_OWORD *)(v29 + 16) = xmmword_10001B180;
      v30 = (void *)a1[2];
      *(_QWORD *)(v29 + 56) = sub_10000738C(0, &qword_100025CA0, MAAsset_ptr);
      *(_QWORD *)(v29 + 64) = sub_100007308(&qword_100025CB8, &qword_100025CA0, MAAsset_ptr);
      *(_QWORD *)(v29 + 32) = v30;
      sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
      v22 = (void *)static OS_os_log.default.getter(v30);
      os_log(_:dso:log:type:_:)("Asset download in progress: %{public}@", 38, 2, &_mh_execute_header, v22, v27, v29);
      swift_bridgeObjectRelease(v29);
    }
    else
    {
      v20 = static os_log_type_t.info.getter(v19);
      v21 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
      v22 = (void *)static OS_os_log.default.getter(v21);
      os_log(_:dso:log:type:_:)("No newer assets found", 21, 2, &_mh_execute_header, v22, v20, &_swiftEmptyArrayStorage);
    }

LABEL_7:
    a3(v15, v14, 0);
    swift_release(a1);
    return swift_bridgeObjectRelease(v14);
  }
  v23 = static os_log_type_t.info.getter(v7);
  v24 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
  v25 = (void *)static OS_os_log.default.getter(v24);
  os_log(_:dso:log:type:_:)("No assets found", 15, 2, &_mh_execute_header, v25, v23, &_swiftEmptyArrayStorage);

  return ((uint64_t (*)(_QWORD, _QWORD, _QWORD))a3)(0, 0, 0);
}

uint64_t sub_10000E4B8(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t *v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;

  v3 = a3[2];
  if (!v3)
    return 0;
  v7 = a3[4];
  v8 = a3[5];
  if (v7 == a1 && v8 == a2)
    return 1;
  result = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v8, a1, a2, 0);
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v11 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v13 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v14 = *(v11 - 1);
    v15 = *v11;
    v16 = v14 == a1 && v15 == a2;
    if (v16 || (_stringCompareWithSmolCheck(_:_:expecting:)(v14, v15, a1, a2, 0) & 1) != 0)
      return 1;
    result = 0;
    v11 += 2;
    if (v13 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000E57C()
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
  uint64_t v9;
  uint64_t v10;
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
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t (*v28)(char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t inited;
  uint64_t v34;
  NSString *v35;
  char *v36;
  NSString *v37;
  NSString *v38;
  NSString *v39;
  unint64_t v40;
  NSString *v41;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSString v54;
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
  char *v65;
  id v66;
  char *v67;
  char *v68;
  char *v69;
  void (*v70)(char *, uint64_t);
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  NSURL *v90;
  void *v91;
  void *v92;
  NSURL *v93;
  void *v94;
  void *v95;
  id v96;
  uint64_t v97;
  id v98;
  NSString v99;
  unint64_t v100;
  Class isa;
  unsigned int v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  id v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  void *v124;
  uint64_t v125;
  char *v126;
  void (*v127)(char *, uint64_t);
  uint64_t v128;
  NSURL *v129;
  void *v130;
  void *v131;
  NSURL *v132;
  void *v133;
  void *v134;
  unsigned int v135;
  uint64_t v136;
  uint64_t v137;
  id v138;
  NSString v139;
  unsigned int v140;
  uint64_t v141;
  uint64_t v142;
  id v143;
  id v144;
  uint64_t v145;
  id v146;
  uint64_t v147;
  uint64_t v148;
  NSString v149;
  uint64_t v150;
  uint64_t v151;
  NSString v152;
  unsigned int v153;
  id v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  unint64_t v160;
  void *v161;
  void *v162;
  _OWORD *v163;
  __int128 v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  unsigned int v168;
  unint64_t v169;
  __int128 v170;
  unint64_t v171;
  char *v172;
  uint64_t v173;
  char *v174;
  uint64_t (*v175)(char *, uint64_t);
  uint64_t v176;
  id v177;
  uint64_t v178;
  uint64_t v179;
  char *v180;
  char *v181;
  char *v182;
  unint64_t v183;
  __int128 v184;
  uint64_t (*v185)(uint64_t, uint64_t);
  void *v186;
  void (*v187)(uint64_t);
  uint64_t v188;
  uint64_t v189;
  _OWORD v190[2];
  uint64_t v191;
  _BYTE v192[64];
  __n128 v193[4];
  _OWORD v194[2];
  _OWORD v195[2];
  __int128 v196;
  __int128 v197;
  _OWORD v198[2];
  __int128 v199;
  uint64_t v200;
  uint64_t v201;
  char v202;

  v2 = sub_100007280((uint64_t *)&unk_100025AF0);
  __chkstk_darwin(v2);
  v4 = (char *)&v166 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v180 = (char *)&v166 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v7);
  v181 = (char *)&v166 - v10;
  v11 = __chkstk_darwin(v9);
  v182 = (char *)&v166 - v12;
  v13 = __chkstk_darwin(v11);
  v15 = (char *)&v166 - v14;
  v16 = __chkstk_darwin(v13);
  v18 = (char *)&v166 - v17;
  __chkstk_darwin(v16);
  v20 = (char *)&v166 - v19;
  sub_10000C910((uint64_t)v192);
  sub_100007348((uint64_t)v192, (uint64_t)v194, (uint64_t *)&unk_100025FF0);
  if (!*((_QWORD *)&v194[0] + 1))
    goto LABEL_4;
  v196 = v194[0];
  v197 = v194[1];
  v198[0] = v195[0];
  *(_OWORD *)((char *)v198 + 10) = *(_OWORD *)((char *)v195 + 10);
  v179 = v0;
  sub_10000C6F0((uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_10001177C((uint64_t)v192, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_100007820);
    sub_1000077AC((uint64_t)v4, (uint64_t *)&unk_100025AF0);
LABEL_4:
    v21 = sub_100010D40();
    v22 = swift_allocError(&type metadata for TZError, v21, 0, 0);
    *(_QWORD *)v23 = 1;
    *(_BYTE *)(v23 + 8) = 3;
    return swift_willThrow(v22);
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v20, v4, v5);
  sub_1000075B4(v193);
  v173 = sub_10000628C();
  v178 = v25;
  sub_100007870(v193);
  v26 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  v27 = objc_msgSend(v26, "temporaryDirectory");
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  URL.appendingPathComponent(_:)(0xD000000000000017, 0x800000010001BEC0);
  v28 = *(uint64_t (**)(char *, uint64_t))(v6 + 8);
  v29 = v28(v15, v5);
  URL.path.getter(v29);
  v31 = v30;
  sub_10000C314();
  if (v1)
  {
    sub_10001177C((uint64_t)v192, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_100007820);

    swift_bridgeObjectRelease(v178);
    swift_bridgeObjectRelease(v31);
    v28(v18, v5);
    return v28(v20, v5);
  }
  v176 = v5;
  v177 = v26;
  v174 = v20;
  v175 = v28;
  v172 = v18;
  swift_bridgeObjectRelease(v31);
  v32 = sub_100007280(&qword_100025CE0);
  inited = swift_initStackObject(v32, &v191);
  v170 = xmmword_10001B150;
  *(_OWORD *)(inited + 16) = xmmword_10001B150;
  *(_QWORD *)(inited + 32) = NSFileProtectionKey;
  type metadata accessor for FileProtectionType(0);
  *(_QWORD *)(inited + 40) = NSFileProtectionNone;
  *(_QWORD *)(inited + 64) = v34;
  *(_QWORD *)(inited + 72) = NSFileOwnerAccountID;
  *(_QWORD *)(inited + 80) = 0;
  *(_QWORD *)(inited + 104) = &type metadata for Int;
  *(_QWORD *)(inited + 112) = NSFileGroupOwnerAccountID;
  *(_QWORD *)(inited + 144) = &type metadata for Int;
  *(_QWORD *)(inited + 120) = 0;
  v35 = NSFileProtectionKey;
  v36 = v182;
  v37 = NSFileProtectionNone;
  v38 = NSFileOwnerAccountID;
  v39 = NSFileGroupOwnerAccountID;
  v40 = sub_1000138C4(inited);
  v186 = &type metadata for Int;
  *(_QWORD *)&v184 = 493;
  sub_1000116C4(&v184, v190);
  swift_bridgeObjectRetain(v40);
  v41 = NSFilePosixPermissions;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v40);
  v171 = v40;
  v183 = v40;
  sub_1000105FC(v190, v41, isUniquelyReferenced_nonNull_native);
  v43 = v183;

  swift_bridgeObjectRelease(0x8000000000000000);
  v44 = sub_10000628C();
  v46 = v45;
  URL.appendingPathComponent(_:)(v44, v45);
  swift_bridgeObjectRelease(v46);
  if (qword_100025878 != -1)
    swift_once(&qword_100025878, sub_100019DC8);
  URL.init(fileURLWithPath:)(qword_100026B88, unk_100026B90);
  v47 = sub_10000628C();
  v49 = v48;
  v50 = v180;
  URL.appendingPathComponent(_:)(v47, v48);
  swift_bridgeObjectRelease(v49);
  v51 = v175(v15, v176);
  LOBYTE(v183) = 0;
  URL.path.getter(v51);
  v53 = v52;
  v54 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v53);
  LODWORD(v53) = objc_msgSend(v177, "fileExistsAtPath:isDirectory:", v54, &v183);

  if ((_DWORD)v53)
  {
    if (v183 == 1)
    {
      swift_bridgeObjectRelease(v43);
      sub_10001177C((uint64_t)v192, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_100007820);
      swift_bridgeObjectRelease(v171);
      v56 = swift_bridgeObjectRelease(v178);
      v57 = static os_log_type_t.info.getter(v56);
      v58 = sub_100007280(&qword_1000259D8);
      v59 = swift_allocObject(v58, 72, 7);
      *(_OWORD *)(v59 + 16) = xmmword_10001B180;
      v60 = URL.path.getter(v59);
      v62 = v61;
      *(_QWORD *)(v59 + 56) = &type metadata for String;
      *(_QWORD *)(v59 + 64) = sub_100010248();
      *(_QWORD *)(v59 + 32) = v60;
      *(_QWORD *)(v59 + 40) = v62;
      v63 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
      v64 = static OS_os_log.default.getter(v63);
      os_log(_:dso:log:type:_:)("Asset installation bypassed; %{public}@ already exists",
        54,
        2,
        &_mh_execute_header,
        v64,
        v57,
        v59);

      v65 = v181;
      swift_bridgeObjectRelease(v59);
      v66 = (id)v64;
      v67 = v50;
      v68 = v172;
LABEL_12:

      v69 = v67;
      v70 = (void (*)(char *, uint64_t))v175;
      v71 = v176;
      v175(v69, v176);
      v70(v65, v71);
      v70(v36, v71);
      v70(v68, v71);
      return ((uint64_t (*)(char *, uint64_t))v70)(v174, v71);
    }
    v72 = static os_log_type_t.fault.getter(v55);
    v73 = sub_100007280(&qword_1000259D8);
    v74 = swift_allocObject(v73, 72, 7);
    *(_OWORD *)(v74 + 16) = xmmword_10001B180;
    v75 = URL.path.getter(v74);
    v77 = v76;
    *(_QWORD *)(v74 + 56) = &type metadata for String;
    *(_QWORD *)(v74 + 64) = sub_100010248();
    *(_QWORD *)(v74 + 32) = v75;
    *(_QWORD *)(v74 + 40) = v77;
    v78 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
    v79 = (void *)static OS_os_log.default.getter(v78);
    os_log(_:dso:log:type:_:)("Asset installation failure: %{public}@ exists but is not a directory", 68, 2, &_mh_execute_header, v79, v72, v74);
    swift_bridgeObjectRelease(v74);

  }
  v169 = v43;
  v168 = ((uint64_t (*)(void))static os_log_type_t.info.getter)();
  v167 = sub_100007280(&qword_1000259D8);
  v80 = swift_allocObject(v167, 152, 7);
  *(_OWORD *)(v80 + 16) = v170;
  v81 = URL.path.getter(v80);
  v83 = v82;
  *(_QWORD *)(v80 + 56) = &type metadata for String;
  v84 = sub_100010248();
  *(_QWORD *)(v80 + 64) = v84;
  *(_QWORD *)(v80 + 32) = v81;
  *(_QWORD *)(v80 + 40) = v83;
  v85 = URL.path.getter(v84);
  *(_QWORD *)(v80 + 96) = &type metadata for String;
  *(_QWORD *)(v80 + 104) = v84;
  *(_QWORD *)(v80 + 72) = v85;
  *(_QWORD *)(v80 + 80) = v86;
  v87 = URL.path.getter(v85);
  *(_QWORD *)(v80 + 136) = &type metadata for String;
  *(_QWORD *)(v80 + 144) = v84;
  *(_QWORD *)(v80 + 112) = v87;
  *(_QWORD *)(v80 + 120) = v88;
  *(_QWORD *)&v170 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
  v89 = (void *)static OS_os_log.default.getter(v170);
  os_log(_:dso:log:type:_:)("Beginning installation of %{public}@ to %{public}@ via %{public}@", 65, 2, &_mh_execute_header, v89, v168, v80);
  swift_bridgeObjectRelease(v80);

  URL._bridgeToObjectiveC()(v90);
  v92 = v91;
  URL._bridgeToObjectiveC()(v93);
  v95 = v94;
  *(_QWORD *)&v184 = 0;
  v96 = v177;
  LODWORD(v83) = objc_msgSend(v177, "copyItemAtURL:toURL:error:", v92, v94, &v184);

  v97 = v184;
  if (!(_DWORD)v83)
  {
    v110 = (id)v184;
    swift_bridgeObjectRelease(v169);
    sub_10001177C((uint64_t)v192, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_100007820);
    swift_bridgeObjectRelease(v171);
    swift_bridgeObjectRelease(v178);
    v111 = _convertNSErrorToError(_:)(v97);

    swift_willThrow(v112);
    *(_QWORD *)&v184 = v111;
    swift_errorRetain(v111);
    v113 = sub_100007280(&qword_100025CE8);
    v114 = sub_10000738C(0, (unint64_t *)&unk_100025CF0, NSError_ptr);
    if (swift_dynamicCast(v190, &v184, v113, v114, 0))
    {
      swift_errorRelease(v111);
      v111 = *(_QWORD *)&v190[0];
      sub_10000BC70(*(id *)&v190[0]);
      swift_willThrow(v115);
    }
    v116 = swift_errorRelease(v184);
    goto LABEL_21;
  }
  v98 = (id)v184;
  v99 = String._bridgeToObjectiveC()();
  type metadata accessor for FileAttributeKey(0);
  sub_100005C90(&qword_100025958, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_10001B100);
  v100 = v169;
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v100);
  *(_QWORD *)&v184 = 0;
  v102 = objc_msgSend(v96, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v99, 1, isa, &v184);

  v103 = v184;
  v104 = v178;
  if (!v102)
  {
    v117 = (id)v184;
    sub_10001177C((uint64_t)v192, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_100007820);
    swift_bridgeObjectRelease(v171);
    swift_bridgeObjectRelease(v104);
    v111 = _convertNSErrorToError(_:)(v103);

    v116 = swift_willThrow(v118);
LABEL_21:
    v109 = v180;
    goto LABEL_22;
  }
  v105 = URL.path.getter((id)v184);
  v107 = v106;
  v108 = v171;
  sub_10000B314(v171, v105, v106);
  v109 = v180;
  swift_bridgeObjectRelease(v107);
  swift_bridgeObjectRelease(v108);
  URL._bridgeToObjectiveC()(v129);
  v131 = v130;
  URL._bridgeToObjectiveC()(v132);
  v134 = v133;
  *(_QWORD *)&v184 = 0;
  v135 = objc_msgSend(v96, "moveItemAtURL:toURL:error:", v131, v133, &v184);

  v136 = v184;
  if (v135)
  {
    v137 = qword_100025858;
    v138 = (id)v184;
    if (v137 != -1)
      swift_once(&qword_100025858, sub_100019B94);
    v139 = String._bridgeToObjectiveC()();
    *(_QWORD *)&v184 = 0;
    v140 = objc_msgSend(v177, "removeItemAtPath:error:", v139, &v184);

    v141 = v184;
    v142 = v179;
    if (v140)
    {
      v143 = (id)v184;
    }
    else
    {
      v146 = (id)v184;
      v147 = _convertNSErrorToError(_:)(v141);

      swift_willThrow(v148);
      swift_errorRelease(v147);
    }
    v109 = v180;
    v149 = String._bridgeToObjectiveC()();
    URL.path.getter(v149);
    v151 = v150;
    v152 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v151);
    *(_QWORD *)&v184 = 0;
    v153 = objc_msgSend(v177, "createSymbolicLinkAtPath:withDestinationPath:error:", v149, v152, &v184);

    v136 = v184;
    if (v153)
    {
      v154 = (id)v184;
      sub_10000628C();
      v156 = v155;
      v157 = sub_100007280((uint64_t *)&unk_100025D10);
      v158 = swift_initStackObject(v157, &v189);
      *(_OWORD *)(v158 + 16) = xmmword_10001B160;
      *(_QWORD *)(v158 + 32) = 0x6973726556646C6FLL;
      *(_QWORD *)(v158 + 40) = 0xEA00000000006E6FLL;
      v159 = v178;
      *(_QWORD *)(v158 + 48) = String._bridgeToObjectiveC()();
      *(_QWORD *)(v158 + 56) = 0x697372655677656ELL;
      *(_QWORD *)(v158 + 64) = 0xEA00000000006E6FLL;
      *(_QWORD *)(v158 + 72) = String._bridgeToObjectiveC()();
      v160 = sub_1000137AC(v158);
      sub_100013074(0x736E497465737361, (void *)0xEE0064656C6C6174);
      swift_bridgeObjectRelease(v156);
      swift_bridgeObjectRelease(v159);
      swift_bridgeObjectRelease(v160);
      v161 = *(void **)(v142 + 16);
      v187 = sub_10000F4BC;
      v188 = 0;
      *(_QWORD *)&v184 = _NSConcreteStackBlock;
      *((_QWORD *)&v184 + 1) = 1107296256;
      v185 = sub_10000DAEC;
      v186 = &unk_1000211A0;
      v162 = _Block_copy(&v184);
      objc_msgSend(v161, "purge:", v162);
      _Block_release(v162);
      v68 = v172;
      if (qword_100025830 != -1)
        swift_once(&qword_100025830, sub_100013B30);
      v163 = (_OWORD *)swift_allocObject(&unk_1000211D8, 74, 7);
      v164 = v197;
      v163[1] = v196;
      v163[2] = v164;
      v163[3] = v198[0];
      *(_OWORD *)((char *)v163 + 58) = *(_OWORD *)((char *)v198 + 10);
      sub_100017E70(0xD000000000000026, 0x800000010001BF60, (uint64_t)sub_100011710, (uint64_t)v163);
      swift_release(v163);
      v65 = v181;
      v36 = v182;
      v67 = v180;
      v66 = v177;
      goto LABEL_12;
    }
    v144 = (id)v184;
    sub_10001177C((uint64_t)v192, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_100007820);
    v145 = v178;
  }
  else
  {
    v144 = (id)v184;
    sub_10001177C((uint64_t)v192, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_100007820);
    v145 = v104;
  }
  swift_bridgeObjectRelease(v145);
  v111 = _convertNSErrorToError(_:)(v136);

  v116 = swift_willThrow(v165);
LABEL_22:
  v119 = static os_log_type_t.error.getter(v116);
  v120 = swift_allocObject(v167, 72, 7);
  *(_OWORD *)(v120 + 16) = xmmword_10001B180;
  v121 = _convertErrorToNSError(_:)(v111);
  *(_QWORD *)(v120 + 56) = sub_10000738C(0, (unint64_t *)&unk_100025F80, NSObject_ptr);
  v122 = sub_100007308((unint64_t *)&qword_100025D00, (unint64_t *)&unk_100025F80, NSObject_ptr);
  *(_QWORD *)(v120 + 64) = v122;
  *(_QWORD *)(v120 + 32) = v121;
  v123 = (void *)static OS_os_log.default.getter(v122);
  os_log(_:dso:log:type:_:)("Asset installation failed: %{public}@", 37, 2, &_mh_execute_header, v123, v119, v120);
  swift_bridgeObjectRelease(v120);

  v124 = (void *)_convertErrorToNSError(_:)(v111);
  v199 = (unint64_t)v124;
  v200 = 0;
  v201 = 0;
  v202 = 3;
  sub_100012894(&v199);

  swift_willThrow(v125);
  v126 = v109;
  v127 = (void (*)(char *, uint64_t))v175;
  v128 = v176;
  v175(v126, v176);
  v127(v181, v128);
  v127(v182, v128);
  v127(v172, v128);
  return ((uint64_t (*)(char *, uint64_t))v127)(v174, v128);
}

void sub_10000F4BC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  if (a1)
  {
    v2 = static os_log_type_t.error.getter(a1);
    v3 = sub_100007280(&qword_1000259D8);
    v4 = swift_allocObject(v3, 72, 7);
    *(_OWORD *)(v4 + 16) = xmmword_10001B180;
    v11 = a1;
    type metadata accessor for MAPurgeResult(0);
    v6 = String.init<A>(describing:)(&v11, v5);
    v8 = v7;
    *(_QWORD *)(v4 + 56) = &type metadata for String;
    *(_QWORD *)(v4 + 64) = sub_100010248();
    *(_QWORD *)(v4 + 32) = v6;
    *(_QWORD *)(v4 + 40) = v8;
    v9 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
    v10 = (void *)static OS_os_log.default.getter(v9);
    os_log(_:dso:log:type:_:)("Asset purge failed: %{public}@", 30, 2, &_mh_execute_header, v10, v2, v4);
    swift_bridgeObjectRelease(v4);

  }
}

uint64_t sub_10000F5AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v4(a2);
  return swift_release(v3);
}

uint64_t sub_10000F5E8(void (*a1)(void), uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[8];

  sub_100006EE0((uint64_t)v10);
  v6 = sub_10000628C();
  v8 = v7;
  sub_100007870(v10);
  sub_1000080E4(a3, v6, v8, a1, a2);
  return swift_bridgeObjectRelease(v8);
}

void sub_10000F664()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[5];
  uint64_t v27;

  v1 = v0;
  v2 = sub_10000C6B0();
  if (v2 == (id)1)
  {
    v3 = *(void **)(v0 + 16);
    if (qword_100025818 != -1)
      swift_once(&qword_100025818, sub_10000B2B4);
    v4 = qword_100026AE8;
    v5 = swift_allocObject(&unk_1000210E8, 24, 7);
    swift_weakInit(v5 + 16, v1);
    v26[4] = sub_100011674;
    v27 = v5;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 1107296256;
    v26[2] = sub_10000F5AC;
    v26[3] = &unk_100021100;
    v6 = _Block_copy(v26);
    swift_release(v27);
    objc_msgSend(v3, "startDownload:then:", v4, v6);
    _Block_release(v6);
    v8 = static os_log_type_t.info.getter(v7);
    v9 = sub_100007280(&qword_1000259D8);
    v10 = swift_allocObject(v9, 72, 7);
    *(_OWORD *)(v10 + 16) = xmmword_10001B180;
    *(_QWORD *)(v10 + 56) = sub_10000738C(0, &qword_100025CA0, MAAsset_ptr);
    *(_QWORD *)(v10 + 64) = sub_100007308(&qword_100025CB8, &qword_100025CA0, MAAsset_ptr);
    *(_QWORD *)(v10 + 32) = v3;
    sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
    v11 = (void *)static OS_os_log.default.getter(v3);
    os_log(_:dso:log:type:_:)("Download initiated for asset %{public}@", 39, 2, &_mh_execute_header, v11, v8, v10);
    v12 = v10;
    goto LABEL_7;
  }
  if ((unint64_t)(*(_QWORD *)(v0 + 40) - 2) < 3)
  {
    v13 = static os_log_type_t.info.getter(v2);
    v14 = sub_100007280(&qword_1000259D8);
    v15 = swift_allocObject(v14, 72, 7);
    *(_OWORD *)(v15 + 16) = xmmword_10001B180;
    v16 = *(void **)(v0 + 16);
    *(_QWORD *)(v15 + 56) = sub_10000738C(0, &qword_100025CA0, MAAsset_ptr);
    *(_QWORD *)(v15 + 64) = sub_100007308(&qword_100025CB8, &qword_100025CA0, MAAsset_ptr);
    *(_QWORD *)(v15 + 32) = v16;
    sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
    v11 = (void *)static OS_os_log.default.getter(v16);
    os_log(_:dso:log:type:_:)("Asset already downloaded/downloading: %{public}@", 48, 2, &_mh_execute_header, v11, v13, v15);
    v12 = v15;
LABEL_7:
    swift_bridgeObjectRelease(v12);

    return;
  }
  v17 = static os_log_type_t.error.getter(v2);
  v18 = sub_100007280(&qword_1000259D8);
  v19 = swift_allocObject(v18, 72, 7);
  *(_OWORD *)(v19 + 16) = xmmword_10001B180;
  v20 = *(void **)(v0 + 16);
  *(_QWORD *)(v19 + 56) = sub_10000738C(0, &qword_100025CA0, MAAsset_ptr);
  *(_QWORD *)(v19 + 64) = sub_100007308(&qword_100025CB8, &qword_100025CA0, MAAsset_ptr);
  *(_QWORD *)(v19 + 32) = v20;
  sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
  v21 = (void *)static OS_os_log.default.getter(v20);
  os_log(_:dso:log:type:_:)("Attempted download; bad asset state for %{public}@",
    50,
    2,
    &_mh_execute_header,
    v21,
    v17,
    v19);
  swift_bridgeObjectRelease(v19);

  v22 = *(_QWORD *)(v1 + 40);
  v23 = sub_100010D40();
  v24 = swift_allocError(&type metadata for TZError, v23, 0, 0);
  *(_QWORD *)v25 = v22;
  *(_BYTE *)(v25 + 8) = 0;
  swift_willThrow(v24);
}

uint64_t sub_10000FA24(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t Strong;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 aBlock;
  uint64_t (*v46)(uint64_t);
  void *v47;
  uint64_t (*v48)();
  uint64_t v49;
  _BYTE v50[24];

  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = v9;
  if (a1)
  {
    v42 = v8;
    v43 = v5;
    v13 = a2 + 16;
    v14 = static os_log_type_t.error.getter(v10);
    v15 = sub_100007280(&qword_1000259D8);
    v16 = swift_allocObject(v15, 112, 7);
    *(_OWORD *)(v16 + 16) = xmmword_10001B160;
    *(_QWORD *)&aBlock = a1;
    type metadata accessor for MADownloadResult(0);
    v18 = String.init<A>(describing:)(&aBlock, v17);
    v20 = v19;
    *(_QWORD *)(v16 + 56) = &type metadata for String;
    v21 = sub_100010248();
    *(_QWORD *)(v16 + 64) = v21;
    *(_QWORD *)(v16 + 32) = v18;
    *(_QWORD *)(v16 + 40) = v20;
    swift_beginAccess(v13, v50, 0, 0);
    Strong = swift_weakLoadStrong(v13);
    if (Strong)
    {
      v23 = Strong;
      v24 = *(id *)(Strong + 16);
      swift_release(v23);
      v47 = (void *)sub_10000738C(0, &qword_100025CA0, MAAsset_ptr);
      v48 = (uint64_t (*)())sub_100007308(&qword_100025CB8, &qword_100025CA0, MAAsset_ptr);
      *(_QWORD *)&aBlock = v24;
      sub_10001167C(&aBlock, v16 + 72);
    }
    else
    {
      *(_QWORD *)(v16 + 96) = &type metadata for String;
      *(_QWORD *)(v16 + 104) = v21;
      *(_QWORD *)(v16 + 72) = 0x296C696E28;
      *(_QWORD *)(v16 + 80) = 0xE500000000000000;
    }
    v35 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
    v36 = (void *)static OS_os_log.default.getter(v35);
    os_log(_:dso:log:type:_:)("Asset download failed with status %{public}@; asset = %{public}@",
      64,
      2,
      &_mh_execute_header,
      v36,
      v14,
      v16);
    swift_bridgeObjectRelease(v16);

    sub_10000738C(0, (unint64_t *)&unk_100025C00, OS_dispatch_queue_ptr);
    v28 = (void *)static OS_dispatch_queue.main.getter();
    v48 = nullsub_1;
    v49 = 0;
    *(_QWORD *)&aBlock = _NSConcreteStackBlock;
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v46 = sub_100013674;
    v47 = &unk_100021128;
    v29 = _Block_copy(&aBlock);
    v37 = swift_release(v49);
    static DispatchQoS.unspecified.getter(v37);
    *(_QWORD *)&aBlock = &_swiftEmptyArrayStorage;
    v38 = sub_100005C90((unint64_t *)&qword_100025FD0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v39 = sub_100007280((uint64_t *)&unk_100025C10);
    v40 = sub_10000B0FC((unint64_t *)&qword_100025FE0, (uint64_t *)&unk_100025C10, (uint64_t)&protocol conformance descriptor for [A]);
    dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v39, v40, v4, v38);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v12, v7, v29);
    v8 = v42;
    v5 = v43;
    v34 = v44;
  }
  else
  {
    v25 = static os_log_type_t.info.getter(v10);
    v26 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
    v27 = (void *)static OS_os_log.default.getter(v26);
    os_log(_:dso:log:type:_:)("Asset download successful", 25, 2, &_mh_execute_header, v27, v25, &_swiftEmptyArrayStorage);

    sub_10000738C(0, (unint64_t *)&unk_100025C00, OS_dispatch_queue_ptr);
    v28 = (void *)static OS_dispatch_queue.main.getter();
    v48 = (uint64_t (*)())sub_10000FEF0;
    v49 = 0;
    *(_QWORD *)&aBlock = _NSConcreteStackBlock;
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v46 = sub_100013674;
    v47 = &unk_100021150;
    v29 = _Block_copy(&aBlock);
    static DispatchQoS.unspecified.getter(v29);
    *(_QWORD *)&aBlock = &_swiftEmptyArrayStorage;
    v30 = sub_100005C90((unint64_t *)&qword_100025FD0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v31 = sub_100007280((uint64_t *)&unk_100025C10);
    v32 = sub_10000B0FC((unint64_t *)&qword_100025FE0, (uint64_t *)&unk_100025C10, (uint64_t)&protocol conformance descriptor for [A]);
    v33 = v30;
    v34 = v44;
    dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v31, v32, v4, v33);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v12, v7, v29);
  }
  _Block_release(v29);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v12, v8);
}

uint64_t sub_10000FEF0(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;

  if (qword_100025830 != -1)
    a1 = swift_once(&qword_100025830, sub_100013B30);
  v1 = (void *)qword_100026B00;
  v2 = static os_log_type_t.debug.getter(a1);
  v3 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
  v4 = (void *)static OS_os_log.default.getter(v3);
  os_log(_:dso:log:type:_:)("Asset downloaded notification", 29, 2, &_mh_execute_header, v4, v2, &_swiftEmptyArrayStorage);

  v5 = os_transaction_create("com.apple.tzd.newAsset");
  v6 = swift_allocObject(&unk_100021188, 32, 7);
  *(_QWORD *)(v6 + 16) = v5;
  *(_QWORD *)(v6 + 24) = v1;
  swift_unknownObjectRetain_n(v5, 2);
  v7 = v1;
  v8 = static os_log_type_t.debug.getter(v7);
  v9 = sub_100007280(&qword_1000259D8);
  v10 = swift_allocObject(v9, 72, 7);
  *(_OWORD *)(v10 + 16) = xmmword_10001B180;
  *(_QWORD *)(v10 + 56) = &type metadata for String;
  v11 = sub_100010248();
  *(_QWORD *)(v10 + 64) = v11;
  *(_QWORD *)(v10 + 32) = 0x65736C6166;
  *(_QWORD *)(v10 + 40) = 0xE500000000000000;
  v12 = (void *)static OS_os_log.default.getter(v11);
  os_log(_:dso:log:type:_:)("Beginning advancePipeline with forceCatalogDownload: %{public}@", 63, 2, &_mh_execute_header, v12, v8, v10);
  swift_bridgeObjectRelease(v10);

  sub_100010948(sub_10001286C, v6);
  swift_unknownObjectRelease_n(v5, 2);
  return swift_release(v6);
}

uint64_t sub_1000100A8()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  sub_1000077AC(v0 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___localURL, &qword_100025CC8);
  sub_100010E14(*(_QWORD *)(v0 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info), *(_QWORD *)(v0 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 8), *(_QWORD *)(v0 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 16), *(_QWORD *)(v0 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 24), *(_QWORD *)(v0 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 32), *(_QWORD *)(v0 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 40), *(_QWORD *)(v0 + OBJC_IVAR____TtC3tzd8TZSAsset____lazy_storage___info + 48));
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_100010114()
{
  return type metadata accessor for TZSAsset(0);
}

uint64_t type metadata accessor for TZSAsset(uint64_t a1)
{
  uint64_t result;

  result = qword_100025AD8;
  if (!qword_100025AD8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for TZSAsset);
  return result;
}

void sub_100010158(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[5];

  v4[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[1] = &unk_10001B270;
  v4[2] = &unk_10001B288;
  sub_1000101F0(319);
  if (v3 <= 0x3F)
  {
    v4[3] = *(_QWORD *)(v2 - 8) + 64;
    v4[4] = &unk_10001B2A0;
    swift_updateClassMetadata2(a1, 256, 5, v4, a1 + 80);
  }
}

void sub_1000101F0(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100025AE8)
  {
    v2 = sub_10000AEC4((uint64_t *)&unk_100025AF0);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100025AE8);
  }
}

unint64_t sub_100010248()
{
  unint64_t result;

  result = qword_100025BF0;
  if (!qword_100025BF0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100025BF0);
  }
  return result;
}

uint64_t sub_10001028C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10001029C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void sub_1000102A8(uint64_t a1, unint64_t a2, uint64_t a3)
{
  sub_100014CA8(a1, a2, a3);
}

_OWORD *sub_1000102B0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _OWORD *result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  _QWORD *v19;
  unint64_t v20;
  int64_t v21;
  void *v22;
  _OWORD *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  Swift::Int v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  char v33;
  unint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  int64_t v38;
  uint64_t v39;
  char v40;
  _QWORD v41[9];
  _OWORD v42[2];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_100007280(&qword_100025D40);
  v40 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_44;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v39 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v38 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = (_OWORD *)swift_retain(v5);
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v16 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v17 = v16 | (v14 << 6);
      goto LABEL_25;
    }
    v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
      return result;
    }
    if (v18 >= v38)
      break;
    v19 = (_QWORD *)(v5 + 64);
    v20 = *(_QWORD *)(v39 + 8 * v18);
    ++v14;
    if (!v20)
    {
      v14 = v18 + 1;
      if (v18 + 1 >= v38)
        goto LABEL_37;
      v20 = *(_QWORD *)(v39 + 8 * v14);
      if (!v20)
      {
        v21 = v18 + 2;
        if (v21 >= v38)
        {
LABEL_37:
          swift_release(v5);
          if ((v40 & 1) == 0)
            goto LABEL_44;
          goto LABEL_40;
        }
        v20 = *(_QWORD *)(v39 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            v14 = v21 + 1;
            if (__OFADD__(v21, 1))
              goto LABEL_46;
            if (v14 >= v38)
              goto LABEL_37;
            v20 = *(_QWORD *)(v39 + 8 * v14);
            ++v21;
            if (v20)
              goto LABEL_24;
          }
        }
        v14 = v21;
      }
    }
LABEL_24:
    v11 = (v20 - 1) & v20;
    v17 = __clz(__rbit64(v20)) + (v14 << 6);
LABEL_25:
    v22 = *(void **)(*(_QWORD *)(v5 + 48) + 8 * v17);
    v23 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v17);
    if ((v40 & 1) != 0)
    {
      sub_1000116C4(v23, v42);
    }
    else
    {
      sub_10000AFEC((uint64_t)v23, (uint64_t)v42);
      v24 = v22;
    }
    v25 = *(_QWORD *)(v8 + 40);
    v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
    v28 = v27;
    Hasher.init(_seed:)(v41, v25);
    String.hash(into:)(v41, v26, v28);
    v29 = Hasher._finalize()();
    result = (_OWORD *)swift_bridgeObjectRelease(v28);
    v30 = -1 << *(_BYTE *)(v8 + 32);
    v31 = v29 & ~v30;
    v32 = v31 >> 6;
    if (((-1 << v31) & ~*(_QWORD *)(v12 + 8 * (v31 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v31) & ~*(_QWORD *)(v12 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v33 = 0;
      v34 = (unint64_t)(63 - v30) >> 6;
      do
      {
        if (++v32 == v34 && (v33 & 1) != 0)
        {
          __break(1u);
          goto LABEL_45;
        }
        v35 = v32 == v34;
        if (v32 == v34)
          v32 = 0;
        v33 |= v35;
        v36 = *(_QWORD *)(v12 + 8 * v32);
      }
      while (v36 == -1);
      v15 = __clz(__rbit64(~v36)) + (v32 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(_QWORD *)(*(_QWORD *)(v8 + 48) + 8 * v15) = v22;
    result = sub_1000116C4(v42, (_OWORD *)(*(_QWORD *)(v8 + 56) + 32 * v15));
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v19 = (_QWORD *)(v5 + 64);
  if ((v40 & 1) == 0)
    goto LABEL_44;
LABEL_40:
  v37 = 1 << *(_BYTE *)(v5 + 32);
  if (v37 >= 64)
    bzero(v19, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v19 = -1 << v37;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_44:
  result = (_OWORD *)swift_release(v5);
  *v3 = v8;
  return result;
}

char *sub_1000105E8(uint64_t a1)
{
  return sub_100009328(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

_OWORD *sub_1000105FC(_OWORD *a1, void *a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _OWORD *result;
  unint64_t v18;
  char v19;

  v4 = (_QWORD **)v3;
  v7 = (_QWORD *)*v3;
  v9 = sub_100017188((uint64_t)a2);
  v10 = v7[2];
  v11 = (v8 & 1) == 0;
  v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
  }
  else
  {
    v13 = v8;
    v14 = v7[3];
    if (v14 >= v12 && (a3 & 1) != 0)
    {
LABEL_7:
      v15 = *v4;
      if ((v13 & 1) != 0)
      {
LABEL_8:
        v16 = (_QWORD *)(v15[7] + 32 * v9);
        sub_100011718(v16);
        return sub_1000116C4(a1, v16);
      }
      goto LABEL_11;
    }
    if (v14 >= v12 && (a3 & 1) == 0)
    {
      sub_100010780();
      goto LABEL_7;
    }
    sub_1000102B0(v12, a3 & 1);
    v18 = sub_100017188((uint64_t)a2);
    if ((v13 & 1) == (v19 & 1))
    {
      v9 = v18;
      v15 = *v4;
      if ((v13 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_10001071C(v9, (uint64_t)a2, a1, v15);
      return a2;
    }
  }
  type metadata accessor for FileAttributeKey(0);
  result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

_OWORD *sub_10001071C(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  _OWORD *result;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_QWORD *)(a4[6] + 8 * a1) = a2;
  result = sub_1000116C4(a3, (_OWORD *)(a4[7] + 32 * a1));
  v6 = a4[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a4[2] = v8;
  return result;
}

id sub_100010780()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
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
  void *v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  _OWORD v22[2];

  v1 = v0;
  sub_100007280(&qword_100025D40);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
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
    v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13)
      goto LABEL_26;
    v20 = *(_QWORD *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      v9 = v19 + 1;
      if (v19 + 1 >= v13)
        goto LABEL_26;
      v20 = *(_QWORD *)(v6 + 8 * v9);
      if (!v20)
        break;
    }
LABEL_25:
    v12 = (v20 - 1) & v20;
    v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 32 * v15;
    sub_10000AFEC(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v22);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    sub_1000116C4(v22, (_OWORD *)(*(_QWORD *)(v4 + 56) + v18));
    result = v17;
  }
  v21 = v19 + 2;
  if (v21 >= v13)
    goto LABEL_26;
  v20 = *(_QWORD *)(v6 + 8 * v21);
  if (v20)
  {
    v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v20 = *(_QWORD *)(v6 + 8 * v9);
    ++v21;
    if (v20)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_100010948(void (*a1)(_QWORD, _QWORD, uint64_t), uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSString v10;
  id v11;
  uint64_t v12;
  NSString v13;
  NSString v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  _QWORD *v22;
  id v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[5];
  _QWORD *v30;

  v4 = swift_allocObject(&unk_100020F08, 32, 7);
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  v5 = swift_retain(a2);
  v6 = static os_log_type_t.debug.getter(v5);
  v7 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
  v8 = (void *)static OS_os_log.default.getter(v7);
  os_log(_:dso:log:type:_:)("Beginning MobileAsset local catalog query", 41, 2, &_mh_execute_header, v8, v6, &_swiftEmptyArrayStorage);

  v9 = objc_allocWithZone((Class)MAAssetQuery);
  v10 = String._bridgeToObjectiveC()();
  v11 = objc_msgSend(v9, "initWithType:", v10);

  if (v11)
  {
    if (qword_100025880 != -1)
      swift_once(&qword_100025880, sub_100019E48);
    if (qword_100026BA0)
    {
      v13 = String._bridgeToObjectiveC()();
      v14 = String._bridgeToObjectiveC()();
      objc_msgSend(v11, "addKeyValuePair:with:", v13, v14);

      v15 = static os_log_type_t.info.getter(objc_msgSend(v11, "returnTypes:", 2));
      v16 = sub_100007280(&qword_1000259D8);
      v17 = swift_allocObject(v16, 72, 7);
      *(_OWORD *)(v17 + 16) = xmmword_10001B180;
      *(_QWORD *)(v17 + 56) = sub_10000738C(0, &qword_100025C88, MAAssetQuery_ptr);
      *(_QWORD *)(v17 + 64) = sub_100007308((unint64_t *)&unk_100025C90, &qword_100025C88, MAAssetQuery_ptr);
      *(_QWORD *)(v17 + 32) = v11;
      v18 = v11;
      v19 = (void *)static OS_os_log.default.getter(v18);
      os_log(_:dso:log:type:_:)("Starting MobileAsset query %{public}@", 37, 2, &_mh_execute_header, v19, v15, v17);
      swift_bridgeObjectRelease(v17);

      v20 = (_QWORD *)swift_allocObject(&unk_100020F30, 40, 7);
      v20[2] = v18;
      v20[3] = sub_100010D38;
      v20[4] = v4;
      v29[4] = sub_100010D88;
      v30 = v20;
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 1107296256;
      v29[2] = sub_10000DAEC;
      v29[3] = &unk_100020F48;
      v21 = _Block_copy(v29);
      v22 = v30;
      v23 = v18;
      swift_retain(v4);
      swift_release(v22);
      objc_msgSend(v23, "queryMetaData:", v21);
      _Block_release(v21);
      swift_release(v4);

      return;
    }

  }
  v24 = static os_log_type_t.fault.getter(v12);
  v25 = (void *)static OS_os_log.default.getter(v24);
  os_log(_:dso:log:type:_:)("Unable to construct MobileAsset query", 37, 2, &_mh_execute_header, v25, v24, &_swiftEmptyArrayStorage);

  v26 = sub_100010D40();
  v27 = swift_allocError(&type metadata for TZError, v26, 0, 0);
  *(_QWORD *)v28 = 0;
  *(_BYTE *)(v28 + 8) = 3;
  swift_errorRetain(v27);
  a1(0, 0, v27);
  swift_errorRelease(v27);
  swift_errorRelease(v27);
  swift_release(v4);
}

uint64_t sub_100010D14()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100010D38(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_10000DFB0(a1, a2, *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16));
}

unint64_t sub_100010D40()
{
  unint64_t result;

  result = qword_100025C80;
  if (!qword_100025C80)
  {
    atomic_store(result, (unint64_t *)&qword_100025C80);
  }
  return result;
}

void **sub_100010D88(void **a1)
{
  uint64_t v1;

  return sub_10000D104(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_100010D94()
{
  return sub_100010DB0(48);
}

uint64_t sub_100010D9C()
{
  uint64_t v0;

  return sub_10000DA74(*(void (**)(uint64_t, uint64_t))(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_100010DA8()
{
  return sub_100010DB0(40);
}

uint64_t sub_100010DB0(uint64_t a1)
{
  uint64_t v1;

  swift_release(*(_QWORD *)(v1 + 24));
  swift_release(*(_QWORD *)(v1 + 32));
  return swift_deallocObject(v1, a1, 7);
}

uint64_t sub_100010DE8()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 16))(*(_QWORD *)(v0 + 32), 0);
}

uint64_t sub_100010E14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a2 != 1)
    return sub_100007820(a1, a2, a3, a4, a5, a6, a7);
  return a1;
}

uint64_t sub_100010E24(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_100010E58(uint64_t a1, void **a2, uint64_t a3, void (*a4)(_QWORD), uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSString v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  _QWORD v36[2];
  void **aBlock;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void *v40;
  void (*v41)(uint64_t);
  uint64_t v42;

  v10 = sub_100007280(&qword_100025A10);
  __chkstk_darwin(v10);
  v12 = (char *)v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v13 = *(_QWORD *)(a1 + 24);
    v14 = *(_QWORD *)(a1 + 32);
    aBlock = a2;
    v38 = a3;
    v36[0] = v13;
    v36[1] = v14;
    v15 = type metadata accessor for Locale(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v12, 1, 1, v15);
    v16 = sub_100007768();
    swift_retain(a1);
    swift_bridgeObjectRetain(v14);
    v17 = StringProtocol.compare<A>(_:options:range:locale:)(v36, 64, 0, 0, 1, v12, &type metadata for String, &type metadata for String, v16, v16);
    sub_1000077AC((uint64_t)v12, &qword_100025A10);
    swift_bridgeObjectRelease(v14);
    if (v17 != 1)
    {
      v28 = swift_allocObject(&unk_1000210C0, 32, 7);
      *(_QWORD *)(v28 + 16) = a4;
      *(_QWORD *)(v28 + 24) = a5;
      v29 = swift_retain(a5);
      v30 = static os_log_type_t.debug.getter(v29);
      v31 = sub_100007280(&qword_1000259D8);
      v32 = swift_allocObject(v31, 72, 7);
      *(_OWORD *)(v32 + 16) = xmmword_10001B180;
      *(_QWORD *)(v32 + 56) = &type metadata for String;
      *(_QWORD *)(v32 + 64) = sub_100010248();
      *(_QWORD *)(v32 + 32) = 0x65736C6166;
      *(_QWORD *)(v32 + 40) = 0xE500000000000000;
      v33 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
      v34 = (void *)static OS_os_log.default.getter(v33);
      os_log(_:dso:log:type:_:)("Beginning advancePipeline with forceCatalogDownload: %{public}@", 63, 2, &_mh_execute_header, v34, v30, v32);
      swift_bridgeObjectRelease(v32);

      sub_100010948((void (*)(_QWORD, _QWORD, uint64_t))sub_10001162C, v28);
      swift_release(a1);
      a5 = v28;
      return swift_release(a5);
    }
    swift_release(a1);
  }
  v18 = swift_retain(a5);
  v19 = static os_log_type_t.debug.getter(v18);
  v20 = sub_100007280(&qword_1000259D8);
  v21 = swift_allocObject(v20, 72, 7);
  *(_OWORD *)(v21 + 16) = xmmword_10001B180;
  *(_QWORD *)(v21 + 56) = &type metadata for String;
  *(_QWORD *)(v21 + 64) = sub_100010248();
  *(_QWORD *)(v21 + 32) = 1702195828;
  *(_QWORD *)(v21 + 40) = 0xE400000000000000;
  v22 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
  v23 = (void *)static OS_os_log.default.getter(v22);
  os_log(_:dso:log:type:_:)("Beginning advancePipeline with forceCatalogDownload: %{public}@", 63, 2, &_mh_execute_header, v23, v19, v21);
  swift_bridgeObjectRelease(v21);

  v24 = (void *)objc_opt_self(MAAsset);
  v25 = String._bridgeToObjectiveC()();
  if (qword_100025818 != -1)
    swift_once(&qword_100025818, sub_10000B2B4);
  v26 = qword_100026AE8;
  v41 = sub_10000DAF0;
  v42 = 0;
  aBlock = _NSConcreteStackBlock;
  v38 = 1107296256;
  v39 = sub_10000F5AC;
  v40 = &unk_100021088;
  v27 = _Block_copy(&aBlock);
  objc_msgSend(v24, "startCatalogDownload:options:then:", v25, v26, v27);
  _Block_release(v27);

  a4(0);
  return swift_release(a5);
}

void sub_10001120C(void **a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD), uint64_t a5)
{
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSString v16;
  id v17;
  uint64_t v18;
  NSString v19;
  NSString v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  _QWORD *v26;
  void *v27;
  _QWORD *v28;
  id v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[5];
  _QWORD *v33;

  v10 = (_QWORD *)swift_allocObject(&unk_100021020, 56, 7);
  v10[2] = a1;
  v10[3] = a2;
  v10[4] = a3;
  v10[5] = a4;
  v10[6] = a5;
  swift_bridgeObjectRetain(a2);
  v11 = swift_retain(a5);
  v12 = static os_log_type_t.debug.getter(v11);
  v13 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
  v14 = (void *)static OS_os_log.default.getter(v13);
  os_log(_:dso:log:type:_:)("Beginning MobileAsset local catalog query", 41, 2, &_mh_execute_header, v14, v12, &_swiftEmptyArrayStorage);

  v15 = objc_allocWithZone((Class)MAAssetQuery);
  v16 = String._bridgeToObjectiveC()();
  v17 = objc_msgSend(v15, "initWithType:", v16);

  if (v17)
  {
    if (qword_100025880 != -1)
      swift_once(&qword_100025880, sub_100019E48);
    if (qword_100026BA0)
    {
      v19 = String._bridgeToObjectiveC()();
      v20 = String._bridgeToObjectiveC()();
      objc_msgSend(v17, "addKeyValuePair:with:", v19, v20);

      v21 = static os_log_type_t.info.getter(objc_msgSend(v17, "returnTypes:", 2));
      v22 = sub_100007280(&qword_1000259D8);
      v23 = swift_allocObject(v22, 72, 7);
      *(_OWORD *)(v23 + 16) = xmmword_10001B180;
      *(_QWORD *)(v23 + 56) = sub_10000738C(0, &qword_100025C88, MAAssetQuery_ptr);
      *(_QWORD *)(v23 + 64) = sub_100007308((unint64_t *)&unk_100025C90, &qword_100025C88, MAAssetQuery_ptr);
      *(_QWORD *)(v23 + 32) = v17;
      v24 = v17;
      v25 = (void *)static OS_os_log.default.getter(v24);
      os_log(_:dso:log:type:_:)("Starting MobileAsset query %{public}@", 37, 2, &_mh_execute_header, v25, v21, v23);
      swift_bridgeObjectRelease(v23);

      v26 = (_QWORD *)swift_allocObject(&unk_100021048, 40, 7);
      v26[2] = v24;
      v26[3] = sub_1000115F0;
      v26[4] = v10;
      v32[4] = sub_100012840;
      v33 = v26;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 1107296256;
      v32[2] = sub_10000DAEC;
      v32[3] = &unk_100021060;
      v27 = _Block_copy(v32);
      v28 = v33;
      v29 = v24;
      swift_retain(v10);
      swift_release(v28);
      objc_msgSend(v29, "queryMetaData:", v27);
      _Block_release(v27);
      swift_release(v10);

      return;
    }

  }
  v30 = static os_log_type_t.fault.getter(v18);
  v31 = (void *)static OS_os_log.default.getter(v30);
  os_log(_:dso:log:type:_:)("Unable to construct MobileAsset query", 37, 2, &_mh_execute_header, v31, v30, &_swiftEmptyArrayStorage);

  sub_100010E58(0, a1, a2, a4, a5);
  swift_release(v10);
}

uint64_t sub_1000115C4()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 48));
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000115F0(uint64_t a1)
{
  uint64_t v1;

  return sub_100010E58(a1, *(void ***)(v1 + 16), *(_QWORD *)(v1 + 24), *(void (**)(_QWORD))(v1 + 40), *(_QWORD *)(v1 + 48));
}

uint64_t sub_100011600()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10001162C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t))(v3 + 16))(a3);
}

uint64_t sub_100011650()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100011674(uint64_t a1)
{
  uint64_t v1;

  return sub_10000FA24(a1, v1);
}

uint64_t sub_10001167C(__int128 *a1, uint64_t a2)
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

uint64_t sub_100011698()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 32, 7);
}

_OWORD *sub_1000116C4(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000116D4()
{
  _QWORD *v0;

  swift_bridgeObjectRelease(v0[3]);
  swift_bridgeObjectRelease(v0[5]);
  swift_bridgeObjectRelease(v0[7]);
  swift_bridgeObjectRelease(v0[8]);
  return swift_deallocObject(v0, 74, 7);
}

uint64_t sub_100011710(void (*a1)(void), uint64_t a2)
{
  uint64_t v2;

  return sub_10000F5E8(a1, a2, v2 + 16);
}

uint64_t sub_100011718(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

unint64_t sub_100011738()
{
  unint64_t result;

  result = qword_100025D48;
  if (!qword_100025D48)
  {
    result = swift_getWitnessTable(&unk_10001B388, &type metadata for TemporaryDirectoryError);
    atomic_store(result, (unint64_t *)&qword_100025D48);
  }
  return result;
}

uint64_t sub_10001177C(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int16 *)(a1 + 56));
  return a1;
}

uint64_t sub_1000117B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain(a7);
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(a4);
    return swift_bridgeObjectRetain(a6);
  }
  return result;
}

uint64_t sub_100011808(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a2 != 1)
    return sub_1000117B8(a1, a2, a3, a4, a5, a6, a7);
  return a1;
}

uint64_t sub_100011818(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100007280(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001185C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100007280(&qword_100025CC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000118A4(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  unint64_t *i;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  BOOL v23;
  _BOOL4 v24;
  Swift::String v25;
  Swift::String v26;
  Swift::String v27;
  Swift::String v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  unint64_t v34;
  unint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  _QWORD *v48;

  v4 = sub_100007280(&qword_100025A10);
  result = __chkstk_darwin(v4);
  v42 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a1 + 16);
  if (v7)
  {
    v8 = 0;
    v9 = a1 + 40;
    v10 = &_swiftEmptyArrayStorage;
    v41 = -(uint64_t)v7;
    v38 = a1 + 40;
    v39 = v7;
    while (1)
    {
      v40 = v10;
      if (v8 <= v7)
        v11 = v7;
      else
        v11 = v8;
      v43 = -(uint64_t)v11;
      for (i = (unint64_t *)(v9 + 16 * v8++); ; i += 2)
      {
        if (v43 + v8 == 1)
        {
          __break(1u);
          return result;
        }
        v19 = *(i - 1);
        v20 = *i;
        v13 = *a2;
        v14 = a2[1];
        v22 = a2[2];
        v21 = (void *)a2[3];
        v23 = !*a2 && v14 == 0xE000000000000000;
        v24 = v23;
        if ((*((_BYTE *)a2 + 57) & 1) != 0)
          break;
        if ((v24 || (_stringCompareWithSmolCheck(_:_:expecting:)(0, 0xE000000000000000, *a2, a2[1], 0) & 1) != 0)
          && (!v22 && v21 == (void *)0xE000000000000000
           || (_stringCompareWithSmolCheck(_:_:expecting:)(0, 0xE000000000000000, v22, v21, 0) & 1) != 0))
        {
          swift_bridgeObjectRetain(v20);
          v13 = 0;
          v14 = 0xE000000000000000;
        }
        else if (!v22 && v21 == (void *)0xE000000000000000
               || (_stringCompareWithSmolCheck(_:_:expecting:)(0, 0xE000000000000000, v22, v21, 0) & 1) != 0)
        {
          swift_bridgeObjectRetain(v20);
          swift_bridgeObjectRetain(v14);
        }
        else
        {
          v46 = v13;
          v47 = v14;
          swift_bridgeObjectRetain(v20);
          swift_bridgeObjectRetain(v14);
          v25._countAndFlagsBits = 46;
          v25._object = (void *)0xE100000000000000;
          String.append(_:)(v25);
          swift_bridgeObjectRetain(v21);
          v26._countAndFlagsBits = v22;
          v26._object = v21;
          String.append(_:)(v26);
          swift_bridgeObjectRelease(v21);
          v13 = v46;
          v14 = v47;
        }
        v46 = v19;
        v47 = v20;
        v44 = v13;
        v45 = v14;
        v15 = type metadata accessor for Locale(0);
        v16 = (uint64_t)v42;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v42, 1, 1, v15);
        v17 = sub_100007768();
        v18 = StringProtocol.compare<A>(_:options:range:locale:)(&v44, 64, 0, 0, 1, v16, &type metadata for String, &type metadata for String, v17, v17);
        sub_1000077AC(v16, &qword_100025A10);
        swift_bridgeObjectRelease(v14);
        if (v18 == -1)
          goto LABEL_40;
LABEL_9:
        result = swift_bridgeObjectRelease(v20);
        ++v8;
        if (v41 + v8 == 1)
          return (uint64_t)v40;
      }
      if ((v24 || (_stringCompareWithSmolCheck(_:_:expecting:)(0, 0xE000000000000000, *a2, a2[1], 0) & 1) != 0)
        && (!v22 && v21 == (void *)0xE000000000000000
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0, 0xE000000000000000, v22, v21, 0) & 1) != 0))
      {
        swift_bridgeObjectRetain(v20);
        v13 = 0;
        v14 = 0xE000000000000000;
      }
      else if (!v22 && v21 == (void *)0xE000000000000000
             || (_stringCompareWithSmolCheck(_:_:expecting:)(0, 0xE000000000000000, v22, v21, 0) & 1) != 0)
      {
        swift_bridgeObjectRetain(v20);
        swift_bridgeObjectRetain(v14);
      }
      else
      {
        v46 = v13;
        v47 = v14;
        swift_bridgeObjectRetain(v20);
        swift_bridgeObjectRetain(v14);
        v27._countAndFlagsBits = 46;
        v27._object = (void *)0xE100000000000000;
        String.append(_:)(v27);
        swift_bridgeObjectRetain(v21);
        v28._countAndFlagsBits = v22;
        v28._object = v21;
        String.append(_:)(v28);
        swift_bridgeObjectRelease(v21);
        v13 = v46;
        v14 = v47;
      }
      v46 = v19;
      v47 = v20;
      v44 = v13;
      v45 = v14;
      v29 = type metadata accessor for Locale(0);
      v30 = (uint64_t)v42;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v42, 1, 1, v29);
      v31 = sub_100007768();
      v32 = StringProtocol.compare<A>(_:options:range:locale:)(&v44, 64, 0, 0, 1, v30, &type metadata for String, &type metadata for String, v31, v31);
      sub_1000077AC(v30, &qword_100025A10);
      swift_bridgeObjectRelease(v14);
      if (v32 == 1)
        goto LABEL_9;
LABEL_40:
      v33 = v40;
      result = swift_isUniquelyReferenced_nonNull_native(v40);
      v10 = v33;
      v48 = v33;
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_1000090CC(0, v33[2] + 1, 1);
        v10 = v48;
      }
      v35 = v10[2];
      v34 = v10[3];
      if (v35 >= v34 >> 1)
      {
        result = (uint64_t)sub_1000090CC((char *)(v34 > 1), v35 + 1, 1);
        v10 = v48;
      }
      v10[2] = v35 + 1;
      v36 = (char *)&v10[2 * v35];
      *((_QWORD *)v36 + 4) = v19;
      *((_QWORD *)v36 + 5) = v20;
      v9 = v38;
      v7 = v39;
      if (!(v41 + v8))
        return (uint64_t)v10;
    }
  }
  return (uint64_t)&_swiftEmptyArrayStorage;
}

void sub_100011D44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  id v27;
  NSString v28;
  id v29;
  void *v30;
  uint64_t v31;
  id v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  NSURL *v54;
  void *v55;
  void *v56;
  unsigned int v57;
  id v58;
  id v59;
  NSString v60;
  id v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void (*v72)(char *, uint64_t);
  id v73;
  NSString v74;
  unsigned int v75;
  uint64_t v76;
  id v77;
  void *v78;
  uint64_t v79;
  void (*v80)(char *, uint64_t);
  uint64_t v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  NSString v86;
  unsigned int v87;
  id v88;
  NSString v89;
  unsigned int v90;
  uint64_t v91;
  void (*v92)(char *, uint64_t);
  id v93;
  id v94;
  uint64_t v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  __int128 v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  unint64_t v112;
  __int128 v113;
  uint64_t v114;
  uint64_t v115;
  char v116;

  v0 = type metadata accessor for CocoaError.Code(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v104 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for URL(0);
  v109 = *(_QWORD *)(v4 - 8);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v104 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v5);
  v10 = (char *)&v104 - v9;
  v11 = __chkstk_darwin(v8);
  v110 = (char *)&v104 - v12;
  v13 = static os_log_type_t.info.getter(v11);
  v14 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
  v15 = (void *)static OS_os_log.default.getter(v14);
  os_log(_:dso:log:type:_:)("Starting periodic cleanup of stale tz assets", 44, 2, &_mh_execute_header, v15, v13, &_swiftEmptyArrayStorage);

  sub_100006EE0((uint64_t)&v111);
  if ((v112 & 0x2000000000000000) != 0)
    v17 = HIBYTE(v112) & 0xF;
  else
    v17 = v111 & 0xFFFFFFFFFFFFLL;
  if (!v17)
  {
    v35 = sub_100007870(&v111);
    v36 = static os_log_type_t.fault.getter(v35);
    v37 = (void *)static OS_os_log.default.getter(v36);
    os_log(_:dso:log:type:_:)("Can't determine current tz data", 31, 2, &_mh_execute_header, v37, v36, &_swiftEmptyArrayStorage);

    return;
  }
  v106 = v7;
  v107 = v1;
  v18 = static os_log_type_t.debug.getter(v16);
  v19 = sub_100007280(&qword_1000259D8);
  v20 = swift_allocObject(v19, 72, 7);
  v108 = xmmword_10001B180;
  *(_OWORD *)(v20 + 16) = xmmword_10001B180;
  v21 = sub_10000628C();
  v23 = v22;
  *(_QWORD *)(v20 + 56) = &type metadata for String;
  v24 = sub_100010248();
  *(_QWORD *)(v20 + 64) = v24;
  *(_QWORD *)(v20 + 32) = v21;
  *(_QWORD *)(v20 + 40) = v23;
  v25 = (void *)static OS_os_log.default.getter(v24);
  os_log(_:dso:log:type:_:)("Comparing assets against current version %{public}@", 51, 2, &_mh_execute_header, v25, v18, v20);
  swift_bridgeObjectRelease(v20);

  v26 = (void *)objc_opt_self(NSFileManager);
  v27 = objc_msgSend(v26, "defaultManager");
  if (qword_100025878 != -1)
    swift_once(&qword_100025878, sub_100019DC8);
  v28 = String._bridgeToObjectiveC()();
  *(_QWORD *)&v113 = 0;
  v29 = objc_msgSend(v27, "contentsOfDirectoryAtPath:error:", v28, &v113);

  v30 = (void *)v113;
  if (v29)
  {
    v31 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v29, &type metadata for String);
    v32 = v30;

    v33 = (_QWORD *)sub_1000118A4(v31, &v111);
    sub_100007870(&v111);
    v34 = swift_bridgeObjectRelease(v31);
  }
  else
  {
    v38 = (id)v113;
    sub_100007870(&v111);
    v39 = _convertNSErrorToError(_:)(v30);

    swift_willThrow(v40);
    v41 = swift_errorRetain(v39);
    static CocoaError.fileReadNoSuchFile.getter(v41);
    v42 = sub_100005C90((unint64_t *)&unk_100025D60, (uint64_t (*)(uint64_t))&type metadata accessor for CocoaError.Code, (uint64_t)&protocol conformance descriptor for CocoaError.Code);
    LOBYTE(v38) = static _ErrorCodeProtocol.~= infix(_:_:)(v3, v39, v0, v42);
    swift_errorRelease(v39);
    v43 = (*(uint64_t (**)(char *, uint64_t))(v107 + 8))(v3, v0);
    if ((v38 & 1) == 0)
      goto LABEL_33;
    v34 = swift_errorRelease(v39);
    v33 = &_swiftEmptyArrayStorage;
  }
  v44 = static os_log_type_t.debug.getter(v34);
  v45 = swift_allocObject(v19, 72, 7);
  *(_OWORD *)(v45 + 16) = v108;
  v46 = v33[2];
  *(_QWORD *)(v45 + 56) = &type metadata for Int;
  *(_QWORD *)(v45 + 64) = &protocol witness table for Int;
  *(_QWORD *)(v45 + 32) = v46;
  v47 = (void *)static OS_os_log.default.getter(v45);
  os_log(_:dso:log:type:_:)("Found %{public}ld stale assets", 30, 2, &_mh_execute_header, v47, v44, v45);
  swift_bridgeObjectRelease(v45);

  URL.init(fileURLWithPath:)(qword_100026B88, unk_100026B90);
  v48 = v33[2];
  if (v48)
  {
    v105 = v19;
    v49 = v4;
    v107 = v14;
    swift_bridgeObjectRetain(v33);
    v50 = v33 + 5;
    while (1)
    {
      v52 = *(v50 - 1);
      v51 = *v50;
      swift_bridgeObjectRetain(*v50);
      URL.appendingPathComponent(_:)(v52, v51);
      swift_bridgeObjectRelease(v51);
      v53 = objc_msgSend(v26, "defaultManager");
      URL._bridgeToObjectiveC()(v54);
      v56 = v55;
      *(_QWORD *)&v113 = 0;
      v57 = objc_msgSend(v53, "removeItemAtURL:error:", v55, &v113);

      v58 = (id)v113;
      if (!v57)
        break;
      v50 += 2;
      (*(void (**)(char *, uint64_t))(v109 + 8))(v10, v49);
      if (!--v48)
      {
        swift_bridgeObjectRelease(v33);
        v4 = v49;
        v19 = v105;
        goto LABEL_17;
      }
    }
    v78 = v58;
    swift_bridgeObjectRelease_n(v33, 2);
    v39 = _convertNSErrorToError(_:)(v78);

    swift_willThrow(v79);
    v80 = *(void (**)(char *, uint64_t))(v109 + 8);
    v81 = v49;
    v80(v10, v49);
    v19 = v105;
    v43 = ((uint64_t (*)(char *, uint64_t))v80)(v110, v81);
    goto LABEL_33;
  }
LABEL_17:
  v59 = objc_msgSend(v26, "defaultManager");
  if (qword_100025858 != -1)
    swift_once(&qword_100025858, sub_100019B94);
  v60 = String._bridgeToObjectiveC()();
  *(_QWORD *)&v113 = 0;
  v61 = objc_msgSend(v59, "destinationOfSymbolicLinkAtPath:error:", v60, &v113);

  v62 = (void *)v113;
  if (v61)
  {
    v63 = static String._unconditionallyBridgeFromObjectiveC(_:)(v61);
    v65 = v64;
    v66 = v62;

    v67 = v106;
    URL.init(fileURLWithPath:)(v63, v65);
    v68 = swift_bridgeObjectRelease(v65);
    v69 = URL.lastPathComponent.getter(v68);
    v71 = v70;
    v72 = *(void (**)(char *, uint64_t))(v109 + 8);
    v72(v67, v4);
    LOBYTE(v69) = sub_10000E4B8(v69, v71, v33);
    swift_bridgeObjectRelease(v33);
    swift_bridgeObjectRelease(v71);
    if ((v69 & 1) != 0)
    {
      v73 = objc_msgSend(v26, "defaultManager");
      v74 = String._bridgeToObjectiveC()();
      *(_QWORD *)&v113 = 0;
      v75 = objc_msgSend(v73, "removeItemAtPath:error:", v74, &v113);

      v76 = v113;
      if (!v75)
      {
        v96 = (id)v113;
        v39 = _convertNSErrorToError(_:)(v76);

        swift_willThrow(v97);
        v43 = ((uint64_t (*)(char *, uint64_t))v72)(v110, v4);
        goto LABEL_33;
      }
      v77 = (id)v113;
    }
  }
  else
  {
    v82 = (id)v113;
    swift_bridgeObjectRelease(v33);
    v83 = _convertNSErrorToError(_:)(v62);

    swift_willThrow(v84);
    swift_errorRelease(v83);
  }
  v85 = objc_msgSend(v26, "defaultManager");
  if (qword_100025860 != -1)
    swift_once(&qword_100025860, sub_100019C20);
  v86 = String._bridgeToObjectiveC()();
  v87 = objc_msgSend(v85, "fileExistsAtPath:", v86);

  if (!v87)
  {
    (*(void (**)(char *, uint64_t))(v109 + 8))(v110, v4);
    return;
  }
  v88 = objc_msgSend(v26, "defaultManager");
  v89 = String._bridgeToObjectiveC()();
  *(_QWORD *)&v113 = 0;
  v90 = objc_msgSend(v88, "removeItemAtPath:error:", v89, &v113);

  v91 = v113;
  if (v90)
  {
    v92 = *(void (**)(char *, uint64_t))(v109 + 8);
    v93 = (id)v113;
    v92(v110, v4);
    return;
  }
  v94 = (id)v113;
  v39 = _convertNSErrorToError(_:)(v91);

  swift_willThrow(v95);
  v43 = (*(uint64_t (**)(char *, uint64_t))(v109 + 8))(v110, v4);
LABEL_33:
  v98 = static os_log_type_t.error.getter(v43);
  v99 = swift_allocObject(v19, 72, 7);
  *(_OWORD *)(v99 + 16) = v108;
  v100 = _convertErrorToNSError(_:)(v39);
  *(_QWORD *)(v99 + 56) = sub_10000738C(0, (unint64_t *)&unk_100025CF0, NSError_ptr);
  v101 = sub_100007308((unint64_t *)&qword_1000259E8, (unint64_t *)&unk_100025CF0, NSError_ptr);
  *(_QWORD *)(v99 + 64) = v101;
  *(_QWORD *)(v99 + 32) = v100;
  v102 = (void *)static OS_os_log.default.getter(v101);
  os_log(_:dso:log:type:_:)("Stale asset cleanup failed due to %{public}@", 44, 2, &_mh_execute_header, v102, v98, v99);
  swift_bridgeObjectRelease(v99);

  v103 = (void *)_convertErrorToNSError(_:)(v39);
  v113 = (unint64_t)v103;
  v114 = 0;
  v115 = 0;
  v116 = 2;
  sub_100012894(&v113);

  swift_errorRelease(v39);
}

uint64_t getEnumTagSinglePayload for TemporaryDirectoryError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for TemporaryDirectoryError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_100012790 + 4 * byte_10001B1B0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1000127B0 + 4 * byte_10001B1B5[v4]))();
}

_BYTE *sub_100012790(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1000127B0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1000127B8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1000127C0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1000127C8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1000127D0(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_1000127DC()
{
  return 0;
}

ValueMetadata *type metadata accessor for TemporaryDirectoryError()
{
  return &type metadata for TemporaryDirectoryError;
}

unint64_t sub_1000127FC()
{
  unint64_t result;

  result = qword_100025D70;
  if (!qword_100025D70)
  {
    result = swift_getWitnessTable(&unk_10001B360, &type metadata for TemporaryDirectoryError);
    atomic_store(result, (unint64_t *)&qword_100025D70);
  }
  return result;
}

uint64_t sub_100012894(__int128 *a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t inited;
  unint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  Swift::String v24;
  Swift::String v25;
  void *object;
  unint64_t v27;
  NSString v28;
  unint64_t v29;
  NSString v30;
  Class isa;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  Swift::String v43;
  Swift::String v44;
  void *v45;
  NSString v46;
  unint64_t v47;
  NSString v48;
  Class v49;
  uint64_t v50;
  __int128 *v51;
  char v52[56];
  id v53;
  uint64_t v54;
  unint64_t v55;
  char v56[56];
  char v57[80];
  char v58[80];
  void *v59;
  uint64_t v60;
  char v61;

  sub_100013248(a1, (uint64_t)&v59);
  v2 = v59;
  result = sub_100013248(a1, (uint64_t)&v60);
  switch(v61)
  {
    case 0:
      v4 = sub_100007280((uint64_t *)&unk_100025D10);
      inited = swift_initStackObject(v4, v58);
      *(_OWORD *)(inited + 16) = xmmword_10001B160;
      *(_QWORD *)(inited + 32) = 0x6973726556646C6FLL;
      *(_QWORD *)(inited + 40) = 0xEA00000000006E6FLL;
      *(_QWORD *)(inited + 48) = String._bridgeToObjectiveC()();
      *(_QWORD *)(inited + 56) = 0x697372655677656ELL;
      *(_QWORD *)(inited + 64) = 0xEA00000000006E6FLL;
      *(_QWORD *)(inited + 72) = String._bridgeToObjectiveC()();
      v6 = sub_1000137AC(inited);
      v7 = 0x7463417465737361;
      v8 = 1952544361;
      goto LABEL_4;
    case 1:
      v9 = sub_100007280((uint64_t *)&unk_100025D10);
      v10 = swift_initStackObject(v9, v57);
      *(_OWORD *)(v10 + 16) = xmmword_10001B160;
      *(_QWORD *)(v10 + 32) = 0x6973726556646C6FLL;
      *(_QWORD *)(v10 + 40) = 0xEA00000000006E6FLL;
      *(_QWORD *)(v10 + 48) = String._bridgeToObjectiveC()();
      *(_QWORD *)(v10 + 56) = 0x697372655677656ELL;
      *(_QWORD *)(v10 + 64) = 0xEA00000000006E6FLL;
      *(_QWORD *)(v10 + 72) = String._bridgeToObjectiveC()();
      v6 = sub_1000137AC(v10);
      v7 = 0x736E497465737361;
      v8 = 1819042164;
LABEL_4:
      sub_100013074(v7, (void *)(v8 | 0xEE00646500000000));
      return swift_bridgeObjectRelease(v6);
    case 2:
      v11 = v2;
      v12 = sub_100012EC0();
      v13 = v12;
      if (!((unint64_t)v12 >> 62))
      {
        v14 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (v14)
          goto LABEL_7;
LABEL_29:
        swift_bridgeObjectRelease(v13);
        v50 = (uint64_t)a1;
        return sub_100013260(v50);
      }
      if (v12 >= 0)
        v12 &= 0xFFFFFFFFFFFFFF8uLL;
      v14 = _CocoaArrayWrapper.endIndex.getter(v12);
      if (!v14)
        goto LABEL_29;
LABEL_7:
      v51 = a1;
      if (v14 < 1)
      {
        __break(1u);
        goto LABEL_32;
      }
      v15 = 0;
      do
      {
        if ((v13 & 0xC000000000000001) != 0)
          v16 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v15, v13);
        else
          v16 = *(id *)(v13 + 8 * v15 + 32);
        v17 = v16;
        ++v15;
        v18 = sub_100007280((uint64_t *)&unk_100025D10);
        v19 = swift_initStackObject(v18, v52);
        *(_OWORD *)(v19 + 16) = xmmword_10001B180;
        *(_QWORD *)(v19 + 32) = 0x726F727265;
        *(_QWORD *)(v19 + 40) = 0xE500000000000000;
        v20 = objc_msgSend(v17, "domain");
        v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
        v23 = v22;

        v54 = v21;
        v55 = v23;
        v24._countAndFlagsBits = 58;
        v24._object = (void *)0xE100000000000000;
        String.append(_:)(v24);
        v53 = objc_msgSend(v17, "code");
        v25._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
        object = v25._object;
        String.append(_:)(v25);
        swift_bridgeObjectRelease(object);
        v27 = v55;
        v28 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v27);
        *(_QWORD *)(v19 + 48) = v28;
        v29 = sub_1000137AC(v19);
        v54 = 0;
        v55 = 0xE000000000000000;
        _StringGuts.grow(_:)(27);
        swift_bridgeObjectRelease(v55);
        v30 = String._bridgeToObjectiveC()();
        sub_10000738C(0, (unint64_t *)&unk_100025F80, NSObject_ptr);
        isa = Dictionary._bridgeToObjectiveC()().super.isa;
        AnalyticsSendEvent(v30, isa);

        swift_bridgeObjectRelease(v29);
      }
      while (v14 != v15);
LABEL_21:
      swift_bridgeObjectRelease(v13);
      v50 = (uint64_t)v51;
      return sub_100013260(v50);
    case 3:
      v32 = v2;
      v33 = sub_100012EC0();
      v13 = v33;
      if ((unint64_t)v33 >> 62)
      {
        if (v33 >= 0)
          v33 &= 0xFFFFFFFFFFFFFF8uLL;
        v34 = _CocoaArrayWrapper.endIndex.getter(v33);
        if (!v34)
          goto LABEL_29;
      }
      else
      {
        v34 = *(_QWORD *)((v33 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (!v34)
          goto LABEL_29;
      }
      v51 = a1;
      if (v34 >= 1)
      {
        v35 = 0;
        do
        {
          if ((v13 & 0xC000000000000001) != 0)
            v36 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v35, v13);
          else
            v36 = *(id *)(v13 + 8 * v35 + 32);
          v37 = v36;
          ++v35;
          v38 = sub_100007280((uint64_t *)&unk_100025D10);
          v39 = swift_initStackObject(v38, v56);
          *(_OWORD *)(v39 + 16) = xmmword_10001B180;
          *(_QWORD *)(v39 + 32) = 0x726F727265;
          *(_QWORD *)(v39 + 40) = 0xE500000000000000;
          v40 = objc_msgSend(v37, "domain");
          static String._unconditionallyBridgeFromObjectiveC(_:)(v40);
          v42 = v41;

          v43._countAndFlagsBits = 58;
          v43._object = (void *)0xE100000000000000;
          String.append(_:)(v43);
          v53 = objc_msgSend(v37, "code");
          v44._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
          v45 = v44._object;
          String.append(_:)(v44);
          swift_bridgeObjectRelease(v45);
          v46 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(v42);
          *(_QWORD *)(v39 + 48) = v46;
          v47 = sub_1000137AC(v39);
          v54 = 0;
          v55 = 0xE000000000000000;
          _StringGuts.grow(_:)(27);
          swift_bridgeObjectRelease(0xE000000000000000);
          v48 = String._bridgeToObjectiveC()();
          sub_10000738C(0, (unint64_t *)&unk_100025F80, NSObject_ptr);
          v49 = Dictionary._bridgeToObjectiveC()().super.isa;
          AnalyticsSendEvent(v48, v49);

          swift_bridgeObjectRelease(v47);
        }
        while (v34 != v35);
        goto LABEL_21;
      }
LABEL_32:
      __break(1u);
      JUMPOUT(0x100012EB0);
    default:
      return result;
  }
}

uint64_t sub_100012EC0()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v20;
  __int128 v21;
  __int128 v22;

  v1 = v0;
  v2 = objc_msgSend(v0, "userInfo");
  v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v2, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(NSUnderlyingErrorKey);
  v6 = v5;
  if (!*(_QWORD *)(v3 + 16) || (v7 = sub_100017124(v4, v5), (v8 & 1) == 0))
  {
    v21 = 0u;
    v22 = 0u;
    swift_bridgeObjectRelease(v6);
    swift_bridgeObjectRelease(v3);
    goto LABEL_7;
  }
  sub_10000AFEC(*(_QWORD *)(v3 + 56) + 32 * v7, (uint64_t)&v21);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v3);
  if (!*((_QWORD *)&v22 + 1))
  {
LABEL_7:
    sub_1000132FC((uint64_t)&v21);
    goto LABEL_8;
  }
  v9 = sub_10000738C(0, (unint64_t *)&unk_100025CF0, NSError_ptr);
  if ((swift_dynamicCast(&v20, &v21, (char *)&type metadata for Any + 8, v9, 6) & 1) == 0)
  {
LABEL_8:
    v16 = sub_100007280((uint64_t *)&unk_100025D80);
    v17 = swift_allocObject(v16, 40, 7);
    *(_OWORD *)(v17 + 16) = xmmword_10001B3D0;
    *(_QWORD *)(v17 + 32) = v1;
    *(_QWORD *)&v21 = v17;
    specialized Array._endMutation()(v17);
    v15 = v21;
    v18 = v1;
    return v15;
  }
  v10 = v20;
  v11 = sub_100007280((uint64_t *)&unk_100025D80);
  v12 = swift_allocObject(v11, 40, 7);
  *(_OWORD *)(v12 + 16) = xmmword_10001B3D0;
  *(_QWORD *)(v12 + 32) = v1;
  *(_QWORD *)&v21 = v12;
  specialized Array._endMutation()(v12);
  v13 = v21;
  v14 = sub_100012EC0(v1);
  *(_QWORD *)&v21 = v13;
  sub_100008CF4(v14);

  return v21;
}

void sub_100013074(uint64_t a1, void *a2)
{
  Swift::String v4;
  NSString v5;
  Class isa;

  _StringGuts.grow(_:)(27);
  swift_bridgeObjectRelease(0xE000000000000000);
  v4._countAndFlagsBits = a1;
  v4._object = a2;
  String.append(_:)(v4);
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(0x800000010001C380);
  sub_10000738C(0, (unint64_t *)&unk_100025F80, NSObject_ptr);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  AnalyticsSendEvent(v5, isa);

}

void (*sub_100013154(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_1000131D4(v6, a2, a3);
  return sub_1000131A8;
}

void sub_1000131A8(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_1000131D4(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_100013240;
  }
  __break(1u);
  return result;
}

void sub_100013240(id *a1)
{

}

uint64_t sub_100013248(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_BYTE *)(a2 + 32) = *((_BYTE *)a1 + 32);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_100013260(uint64_t a1)
{
  sub_100013294(*(void **)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
  return a1;
}

void sub_100013294(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 0:
    case 1:
      swift_bridgeObjectRelease(a2);
      swift_bridgeObjectRelease(a4);
      break;
    case 2:
    case 3:

      break;
    default:
      return;
  }
}

uint64_t sub_1000132FC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100007280((uint64_t *)&unk_100025CD0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_10001333C(id result, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 0:
    case 1:
      swift_bridgeObjectRetain(a2);
      result = (id)swift_bridgeObjectRetain(a4);
      break;
    case 2:
    case 3:
      result = result;
      break;
    default:
      return result;
  }
  return result;
}

void destroy for TZLogEvent(uint64_t a1)
{
  sub_100013294(*(void **)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
}

uint64_t initializeWithCopy for TZLogEvent(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_10001333C(*(id *)a2, v4, v5, v6, v7);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for TZLogEvent(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_10001333C(*(id *)a2, v4, v5, v6, v7);
  v8 = *(void **)a1;
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  v12 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v7;
  sub_100013294(v8, v9, v10, v11, v12);
  return a1;
}

__n128 initializeWithTake for TZLogEvent(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for TZLogEvent(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  char v9;

  v3 = *(_BYTE *)(a2 + 32);
  v4 = *(void **)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  v9 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v3;
  sub_100013294(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for TZLogEvent(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFB && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 251);
  v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 5)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TZLogEvent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 251;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)(result + 32) = -(char)a2;
  }
  return result;
}

uint64_t sub_100013574(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t sub_10001357C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for TZLogEvent()
{
  return &type metadata for TZLogEvent;
}

uint64_t initializeBufferWithCopyOfBuffer for TZError(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for TZError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TZError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 253;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_100013634(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 2u)
    return *(unsigned __int8 *)(a1 + 8);
  else
    return (*(_DWORD *)a1 + 3);
}

uint64_t sub_10001364C(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(_QWORD *)result = a2 - 3;
    LOBYTE(a2) = 3;
  }
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for TZError()
{
  return &type metadata for TZError;
}

uint64_t sub_100013674(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

uint64_t sub_1000136A0(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0)
      v3 = a1;
    else
      v3 = a1 & 0xFFFFFFFFFFFFFF8;
    v4 = __CocoaSet.startIndex.getter(v3);
    v6 = v5;
    v7 = __CocoaSet.endIndex.getter(v3);
    v9 = static __CocoaSet.Index.== infix(_:_:)(v4, v6, v7, v8);
    swift_bridgeObjectRelease(v7);
    if ((v9 & 1) != 0)
      goto LABEL_6;
    goto LABEL_10;
  }
  result = sub_100017788(a1);
  if ((v13 & 1) == 0)
  {
    v6 = v12;
    if (*(_DWORD *)(a1 + 36) == (_DWORD)v12)
    {
      v4 = result;
      if (result == 1 << *(_BYTE *)(a1 + 32))
      {
LABEL_6:
        sub_100018300(v4, v6, v2 != 0);
        return 0;
      }
LABEL_10:
      sub_100017520(v4, v6, v2 != 0, a1);
      v10 = v14;
      sub_100018300(v4, v6, v2 != 0);
      return v10;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t sub_1000137AC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  void **v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  unint64_t result;
  char v12;
  uint64_t *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007280((uint64_t *)&unk_100026020);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  swift_retain(v3);
  v6 = (void **)(a1 + 48);
  while (1)
  {
    v7 = (uint64_t)*(v6 - 2);
    v8 = (uint64_t)*(v6 - 1);
    v9 = *v6;
    swift_bridgeObjectRetain(v8);
    v10 = v9;
    result = sub_100017124(v7, v8);
    if ((v12 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v13 = (uint64_t *)(v4[6] + 16 * result);
    *v13 = v7;
    v13[1] = v8;
    *(_QWORD *)(v4[7] + 8 * result) = v10;
    v14 = v4[2];
    v15 = __OFADD__(v14, 1);
    v16 = v14 + 1;
    if (v15)
      goto LABEL_11;
    v4[2] = v16;
    v6 += 3;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1000138C4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007280(&qword_100025D40);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  v6 = v3 + 64;
  v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_100011818(v7, (uint64_t)&v14, &qword_100026030);
    v8 = v14;
    result = sub_100017188(v14);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v4[6] + 8 * result) = v8;
    result = (unint64_t)sub_1000116C4(&v15, (_OWORD *)(v4[7] + 32 * result));
    v11 = v4[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4[2] = v13;
    v7 += 40;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1000139F0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  _OWORD v16[2];
  uint64_t v17;
  __int128 v18;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007280(&qword_100025FA0);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  v6 = v3 + 64;
  v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_100011818(v7, (uint64_t)v16, &qword_100025FA8);
    result = sub_1000170F4((uint64_t)v16);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v10 = v4[6] + 40 * result;
    v11 = v16[0];
    v12 = v16[1];
    *(_QWORD *)(v10 + 32) = v17;
    *(_OWORD *)v10 = v11;
    *(_OWORD *)(v10 + 16) = v12;
    result = (unint64_t)sub_1000116C4(&v18, (_OWORD *)(v4[7] + 32 * result));
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
    v7 += 72;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

id sub_100013B30()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for Daemon()), "init");
  qword_100026B00 = (uint64_t)result;
  return result;
}

void sub_100013B5C()
{
  void *v0;
  id v1;
  char *v2;
  NSString v3;
  id v4;
  id v5;
  NSString v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSString v11;
  id v12;
  char *v13;
  void *v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  objc_super v26;

  v1 = objc_allocWithZone((Class)IDSService);
  v2 = v0;
  v3 = String._bridgeToObjectiveC()();
  v4 = objc_msgSend(v1, "initWithService:", v3);

  if (v4)
  {
    *(_QWORD *)&v2[OBJC_IVAR____TtC3tzd6Daemon_companionService] = v4;
    v5 = objc_allocWithZone((Class)UNUserNotificationCenter);
    v6 = String._bridgeToObjectiveC()();
    v7 = objc_msgSend(v5, "initWithBundleIdentifier:", v6);

    *(_QWORD *)&v2[OBJC_IVAR____TtC3tzd6Daemon_notificationCenter] = v7;
    static String._unconditionallyBridgeFromObjectiveC(_:)(CFSTR("com.apple.timezoneupdates.tzd.server"));
    v9 = v8;
    v10 = objc_allocWithZone((Class)NSXPCListener);
    v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
    v12 = objc_msgSend(v10, "initWithMachServiceName:", v11);

    *(_QWORD *)&v2[OBJC_IVAR____TtC3tzd6Daemon_listener] = v12;
    *(_WORD *)&v2[OBJC_IVAR____TtC3tzd6Daemon_assetDetectedType] = 0;

    v26.receiver = v2;
    v26.super_class = (Class)type metadata accessor for Daemon();
    v13 = (char *)objc_msgSendSuper2(&v26, "init");
    v14 = *(void **)&v13[OBJC_IVAR____TtC3tzd6Daemon_listener];
    v15 = v13;
    objc_msgSend(v14, "setDelegate:", v15);
    v16 = *(void **)&v15[OBJC_IVAR____TtC3tzd6Daemon_notificationCenter];
    objc_msgSend(v16, "setDelegate:", v15);
    v17 = static os_log_type_t.debug.getter(objc_msgSend(v16, "setWantsNotificationResponsesDelivered"));
    v18 = sub_100007280(&qword_1000259D8);
    v19 = swift_allocObject(v18, 72, 7);
    *(_OWORD *)(v19 + 16) = xmmword_10001B180;
    if (qword_100025820 != -1)
      swift_once(&qword_100025820, sub_10000BBAC);
    v20 = byte_100026AF0;
    v21 = sub_100010248();
    v22 = 29545;
    if (!v20)
      v22 = 0x746F6E207369;
    v23 = 0xE600000000000000;
    *(_QWORD *)(v19 + 56) = &type metadata for String;
    *(_QWORD *)(v19 + 64) = v21;
    if (v20)
      v23 = 0xE200000000000000;
    *(_QWORD *)(v19 + 32) = v22;
    *(_QWORD *)(v19 + 40) = v23;
    v24 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
    v25 = (void *)static OS_os_log.default.getter(v24);
    os_log(_:dso:log:type:_:)("Device %{public}@ internal build", 32, 2, &_mh_execute_header, v25, v17, v19);
    swift_bridgeObjectRelease(v19);

  }
  else
  {
    __break(1u);
  }
}

void sub_100013E44()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void **v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void *v19;
  void *v20;
  uint64_t v21;

  sub_1000157B4();
  sub_100017810();
  sub_10000738C(0, (unint64_t *)&unk_100025C00, OS_dispatch_queue_ptr);
  v1 = static OS_dispatch_queue.main.getter();
  v2 = swift_allocObject(&unk_100021658, 24, 7);
  *(_QWORD *)(v2 + 16) = v0;
  v20 = sub_100018DF8;
  v21 = v2;
  v16 = _NSConcreteStackBlock;
  v17 = 1107296256;
  v18 = sub_1000149E0;
  v19 = &unk_100021670;
  v3 = _Block_copy(&v16);
  v4 = v21;
  v5 = v0;
  swift_release(v4);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v1, v3);
  _Block_release(v3);

  objc_msgSend(*(id *)&v5[OBJC_IVAR____TtC3tzd6Daemon_listener], "resume");
  v6 = swift_allocObject(&unk_1000216A8, 24, 7);
  *(_QWORD *)(v6 + 16) = v5;
  v20 = sub_100018E00;
  v21 = v6;
  v16 = _NSConcreteStackBlock;
  v17 = 1107296256;
  v18 = sub_1000149E0;
  v19 = &unk_1000216C0;
  v7 = _Block_copy(&v16);
  v8 = v21;
  v9 = v5;
  swift_release(v8);
  xpc_activity_register("com.apple.timezoneupdates.local-asset-check", XPC_ACTIVITY_CHECK_IN, v7);
  _Block_release(v7);
  v20 = sub_100015550;
  v21 = 0;
  v16 = _NSConcreteStackBlock;
  v17 = 1107296256;
  v18 = sub_1000149E0;
  v19 = &unk_1000216E8;
  v10 = _Block_copy(&v16);
  xpc_activity_register("com.apple.timezoneupdates.stale-data-cleanup", XPC_ACTIVITY_CHECK_IN, v10);
  _Block_release(v10);
  v12 = static os_log_type_t.debug.getter(v11);
  v13 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
  v14 = (void *)static OS_os_log.default.getter(v13);
  os_log(_:dso:log:type:_:)("tzd initialization complete; starting run loop",
    46,
    2,
    &_mh_execute_header,
    v14,
    v12,
    &_swiftEmptyArrayStorage);

  v15 = objc_msgSend((id)objc_opt_self(NSRunLoop), "mainRunLoop");
  objc_msgSend(v15, "run");

}

void sub_1000140B0(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  xpc_type_t type;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  unint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  void **aBlock;
  uint64_t v63;
  uint64_t (*v64)(uint64_t);
  void *v65;
  uint64_t (*v66)();
  uint64_t v67;

  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (xpc_dictionary_get_string(a1, _xpc_event_key_name))
  {
    v60 = v8;
    v61 = a2;
    v58 = v9;
    v59 = v5;
    v12 = String.init(cString:)();
    v14 = v13;
    v15 = static os_log_type_t.debug.getter(v12);
    v57 = sub_100007280(&qword_1000259D8);
    v16 = swift_allocObject(v57, 112, 7);
    *(_OWORD *)(v16 + 16) = xmmword_10001B160;
    type = xpc_get_type(a1);
    *(_QWORD *)(v16 + 56) = &type metadata for OpaquePointer;
    *(_QWORD *)(v16 + 64) = &protocol witness table for OpaquePointer;
    *(_QWORD *)(v16 + 32) = type;
    *(_QWORD *)(v16 + 96) = &type metadata for String;
    v18 = sub_100010248();
    *(_QWORD *)(v16 + 104) = v18;
    *(_QWORD *)(v16 + 72) = v12;
    *(_QWORD *)(v16 + 80) = v14;
    sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
    v19 = swift_bridgeObjectRetain(v14);
    v20 = (void *)static OS_os_log.default.getter(v19);
    os_log(_:dso:log:type:_:)("notifyd event type: %{public}@, event name: %{public}@", 54, 2, &_mh_execute_header, v20, v15, v16);
    swift_bridgeObjectRelease(v16);

    if (v12 != 0xD00000000000003FLL || (v21 = 0x800000010001CB50, v14 != 0x800000010001CB50))
    {
      if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD00000000000003FLL, 0x800000010001CB50, v12, v14, 0) & 1) == 0)
      {
        if (v12 != 0xD00000000000003BLL || (v42 = 0x800000010001CB90, v14 != 0x800000010001CB90))
        {
          v43 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD00000000000003BLL, 0x800000010001CB90, v12, v14, 0);
          if ((v43 & 1) == 0)
          {
            v54 = static os_log_type_t.fault.getter(v43);
            v55 = swift_allocObject(v57, 72, 7);
            *(_OWORD *)(v55 + 16) = xmmword_10001B180;
            *(_QWORD *)(v55 + 56) = &type metadata for String;
            *(_QWORD *)(v55 + 64) = v18;
            *(_QWORD *)(v55 + 32) = v12;
            *(_QWORD *)(v55 + 40) = v14;
            v61 = (id)static OS_os_log.default.getter(v55);
            os_log(_:dso:log:type:_:)("Unexpected XPC event name %{public}@", 36, 2, &_mh_execute_header, v61, v54, v55);
            swift_bridgeObjectRelease(v55);

            return;
          }
          v42 = v14;
        }
        swift_bridgeObjectRelease(v42);
        sub_10000738C(0, (unint64_t *)&unk_100025C00, OS_dispatch_queue_ptr);
        v44 = (void *)static OS_dispatch_queue.main.getter();
        v45 = swift_allocObject(&unk_1000217C0, 24, 7);
        v46 = v61;
        *(_QWORD *)(v45 + 16) = v61;
        v66 = sub_100018E60;
        v67 = v45;
        aBlock = _NSConcreteStackBlock;
        v63 = 1107296256;
        v64 = sub_100013674;
        v65 = &unk_1000217D8;
        v47 = _Block_copy(&aBlock);
        v48 = v67;
        v49 = v46;
        v50 = swift_release(v48);
        static DispatchQoS.unspecified.getter(v50);
        aBlock = (void **)&_swiftEmptyArrayStorage;
        v51 = sub_10000B0B4();
        v52 = sub_100007280((uint64_t *)&unk_100025C10);
        v53 = sub_10001837C();
        dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v52, v53, v4, v51);
        OS_dispatch_queue.async(group:qos:flags:execute:)(0, v11, v7, v47);
        _Block_release(v47);

        (*(void (**)(char *, uint64_t))(v59 + 8))(v7, v4);
        (*(void (**)(char *, uint64_t))(v58 + 8))(v11, v60);
        return;
      }
      v21 = v14;
    }
    swift_bridgeObjectRelease(v21);
    v23 = v59;
    v22 = v60;
    v24 = v58;
    sub_10000738C(0, (unint64_t *)&unk_100025C00, OS_dispatch_queue_ptr);
    v25 = (void *)static OS_dispatch_queue.main.getter();
    v26 = swift_allocObject(&unk_100021810, 24, 7);
    v27 = v61;
    *(_QWORD *)(v26 + 16) = v61;
    v66 = sub_100018E68;
    v67 = v26;
    aBlock = _NSConcreteStackBlock;
    v63 = 1107296256;
    v64 = sub_100013674;
    v65 = &unk_100021828;
    v28 = _Block_copy(&aBlock);
    v29 = v67;
    v30 = v27;
    v31 = swift_release(v29);
    static DispatchQoS.unspecified.getter(v31);
    aBlock = (void **)&_swiftEmptyArrayStorage;
    v32 = sub_10000B0B4();
    v33 = sub_100007280((uint64_t *)&unk_100025C10);
    v34 = sub_10001837C();
    dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v33, v34, v4, v32);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v11, v7, v28);
    _Block_release(v28);

    (*(void (**)(char *, uint64_t))(v23 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v22);
  }
  else
  {
    v35 = static os_log_type_t.fault.getter(0);
    v36 = sub_100007280(&qword_1000259D8);
    v37 = swift_allocObject(v36, 72, 7);
    *(_OWORD *)(v37 + 16) = xmmword_10001B180;
    aBlock = (void **)a1;
    swift_unknownObjectRetain(a1);
    v38 = sub_100007280(&qword_100026038);
    v39 = sub_100007280(&qword_100026040);
    swift_dynamicCast(v37 + 32, &aBlock, v38, v39, 7);
    v40 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
    v41 = (void *)static OS_os_log.default.getter(v40);
    os_log(_:dso:log:type:_:)("Unexpected XPC event %{public}@", 31, 2, &_mh_execute_header, v41, v35, v37);
    swift_bridgeObjectRelease(v37);

  }
}

uint64_t sub_1000146C8(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;

  v2 = static os_log_type_t.debug.getter(a1);
  v3 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
  v4 = (void *)static OS_os_log.default.getter(v3);
  os_log(_:dso:log:type:_:)("New asset metadata notification", 31, 2, &_mh_execute_header, v4, v2, &_swiftEmptyArrayStorage);

  v5 = os_transaction_create("com.apple.tzd.newMetadata");
  v6 = swift_allocObject(&unk_100021860, 32, 7);
  *(_QWORD *)(v6 + 16) = v5;
  *(_QWORD *)(v6 + 24) = a1;
  swift_unknownObjectRetain_n(v5, 2);
  v7 = a1;
  v8 = static os_log_type_t.debug.getter(v7);
  v9 = sub_100007280(&qword_1000259D8);
  v10 = swift_allocObject(v9, 72, 7);
  *(_OWORD *)(v10 + 16) = xmmword_10001B180;
  *(_QWORD *)(v10 + 56) = &type metadata for String;
  v11 = sub_100010248();
  *(_QWORD *)(v10 + 64) = v11;
  *(_QWORD *)(v10 + 32) = 0x65736C6166;
  *(_QWORD *)(v10 + 40) = 0xE500000000000000;
  v12 = (void *)static OS_os_log.default.getter(v11);
  os_log(_:dso:log:type:_:)("Beginning advancePipeline with forceCatalogDownload: %{public}@", 63, 2, &_mh_execute_header, v12, v8, v10);
  swift_bridgeObjectRelease(v10);

  sub_100010948((void (*)(_QWORD, _QWORD, uint64_t))sub_10001286C, v6);
  swift_unknownObjectRelease_n(v5, 2);
  return swift_release(v6);
}

uint64_t sub_100014854(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;

  v2 = static os_log_type_t.debug.getter(a1);
  v3 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
  v4 = (void *)static OS_os_log.default.getter(v3);
  os_log(_:dso:log:type:_:)("Asset downloaded notification", 29, 2, &_mh_execute_header, v4, v2, &_swiftEmptyArrayStorage);

  v5 = os_transaction_create("com.apple.tzd.newAsset");
  v6 = swift_allocObject(&unk_100021888, 32, 7);
  *(_QWORD *)(v6 + 16) = v5;
  *(_QWORD *)(v6 + 24) = a1;
  swift_unknownObjectRetain_n(v5, 2);
  v7 = a1;
  v8 = static os_log_type_t.debug.getter(v7);
  v9 = sub_100007280(&qword_1000259D8);
  v10 = swift_allocObject(v9, 72, 7);
  *(_OWORD *)(v10 + 16) = xmmword_10001B180;
  *(_QWORD *)(v10 + 56) = &type metadata for String;
  v11 = sub_100010248();
  *(_QWORD *)(v10 + 64) = v11;
  *(_QWORD *)(v10 + 32) = 0x65736C6166;
  *(_QWORD *)(v10 + 40) = 0xE500000000000000;
  v12 = (void *)static OS_os_log.default.getter(v11);
  os_log(_:dso:log:type:_:)("Beginning advancePipeline with forceCatalogDownload: %{public}@", 63, 2, &_mh_execute_header, v12, v8, v10);
  swift_bridgeObjectRelease(v10);

  sub_100010948((void (*)(_QWORD, _QWORD, uint64_t))sub_10001286C, v6);
  swift_unknownObjectRelease_n(v5, 2);
  return swift_release(v6);
}

uint64_t sub_1000149E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = swift_unknownObjectRetain(a2);
  v4(v5);
  swift_release(v3);
  return swift_unknownObjectRelease(a2);
}

void sub_100014A28(char a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSString v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[6];

  v5 = swift_allocObject(&unk_1000214C8, 32, 7);
  *(_QWORD *)(v5 + 16) = a2;
  *(_QWORD *)(v5 + 24) = v2;
  swift_unknownObjectRetain_n(a2, 2);
  v6 = v2;
  v7 = static os_log_type_t.debug.getter(v6);
  v8 = sub_100007280(&qword_1000259D8);
  v9 = swift_allocObject(v8, 72, 7);
  *(_OWORD *)(v9 + 16) = xmmword_10001B180;
  v10 = sub_100010248();
  v11 = 1702195828;
  if ((a1 & 1) == 0)
    v11 = 0x65736C6166;
  v12 = 0xE500000000000000;
  *(_QWORD *)(v9 + 56) = &type metadata for String;
  *(_QWORD *)(v9 + 64) = v10;
  if ((a1 & 1) != 0)
    v12 = 0xE400000000000000;
  *(_QWORD *)(v9 + 32) = v11;
  *(_QWORD *)(v9 + 40) = v12;
  v13 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
  v14 = (void *)static OS_os_log.default.getter(v13);
  os_log(_:dso:log:type:_:)("Beginning advancePipeline with forceCatalogDownload: %{public}@", 63, 2, &_mh_execute_header, v14, v7, v9);
  swift_bridgeObjectRelease(v9);

  if ((a1 & 1) != 0)
  {
    v15 = (void *)objc_opt_self(MAAsset);
    v16 = String._bridgeToObjectiveC()();
    if (qword_100025818 != -1)
      swift_once(&qword_100025818, sub_10000B2B4);
    v17 = qword_100026AE8;
    v22[4] = sub_10000DAF0;
    v22[5] = 0;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 1107296256;
    v22[2] = sub_10000F5AC;
    v22[3] = &unk_1000214E0;
    v18 = _Block_copy(v22);
    objc_msgSend(v15, "startCatalogDownload:options:then:", v16, v17, v18);
    _Block_release(v18);

    v20 = static os_log_type_t.debug.getter(v19);
    v21 = (void *)static OS_os_log.default.getter(v20);
    os_log(_:dso:log:type:_:)("Advanced asset pipeline", 23, 2, &_mh_execute_header, v21, v20, &_swiftEmptyArrayStorage);
    swift_unknownObjectRelease(a2);
    swift_release(v5);

  }
  else
  {
    sub_100010948(sub_1000102A8, v5);
    swift_unknownObjectRelease(a2);
    swift_release(v5);
  }

}

void sub_100014CA8(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  if (a3)
  {
    v6 = swift_errorRetain(a3);
    v7 = static os_log_type_t.error.getter(v6);
    v8 = sub_100007280(&qword_1000259D8);
    v9 = swift_allocObject(v8, 72, 7);
    *(_OWORD *)(v9 + 16) = xmmword_10001B180;
    v10 = _convertErrorToNSError(_:)(a3);
    *(_QWORD *)(v9 + 56) = sub_10000738C(0, (unint64_t *)&unk_100025CF0, NSError_ptr);
    *(_QWORD *)(v9 + 64) = sub_10001827C((unint64_t *)&qword_1000259E8, (unint64_t *)&unk_100025CF0, NSError_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
    *(_QWORD *)(v9 + 32) = v10;
    v11 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
    v12 = (void *)static OS_os_log.default.getter(v11);
    os_log(_:dso:log:type:_:)("Error advancing asset pipeline: %{public}@", 42, 2, &_mh_execute_header, v12, v7, v9);
    swift_bridgeObjectRelease(v9);

    swift_errorRelease(a3);
    if (!a2)
      return;
  }
  else
  {
    v13 = static os_log_type_t.debug.getter(a1);
    v14 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
    v15 = (void *)static OS_os_log.default.getter(v14);
    os_log(_:dso:log:type:_:)("Advanced asset pipeline", 23, 2, &_mh_execute_header, v15, v13, &_swiftEmptyArrayStorage);

    if (!a2)
      return;
  }
  sub_1000169CC(a1, a2);
}

uint64_t sub_100014E58(void (*a1)(uint64_t (*)(), uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = swift_allocObject(&unk_100021630, 24, 7);
  *(_QWORD *)(v5 + 16) = a3;
  swift_unknownObjectRetain(a3);
  a1(nullsub_1, v5);
  return swift_release(v5);
}

uint64_t sub_100014F18(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
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
  void *v17;
  _QWORD *v18;
  void *v19;
  _QWORD *v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD aBlock[5];
  _QWORD *v32;

  v3 = v2;
  v6 = type metadata accessor for DispatchWorkItemFlags(0);
  v30 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchQoS(0);
  v28 = *(_QWORD *)(v9 - 8);
  v29 = v9;
  v10 = __chkstk_darwin(v9);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = static os_log_type_t.debug.getter(v10);
  v14 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
  v15 = (void *)static OS_os_log.default.getter(v14);
  os_log(_:dso:log:type:_:)("Begin isUpdateWaiting", 21, 2, &_mh_execute_header, v15, v13, &_swiftEmptyArrayStorage);

  v16 = os_transaction_create("com.apple.tzd.isUpdateWaiting");
  sub_10000738C(0, (unint64_t *)&unk_100025C00, OS_dispatch_queue_ptr);
  v17 = (void *)static OS_dispatch_queue.main.getter();
  v18 = (_QWORD *)swift_allocObject(&unk_100021478, 48, 7);
  v18[2] = v3;
  v18[3] = a1;
  v18[4] = a2;
  v18[5] = v16;
  aBlock[4] = sub_100018348;
  v32 = v18;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100013674;
  aBlock[3] = &unk_100021490;
  v19 = _Block_copy(aBlock);
  v20 = v32;
  v21 = v3;
  sub_10001836C(a1, a2);
  swift_unknownObjectRetain(v16);
  v22 = swift_release(v20);
  static DispatchQoS.unspecified.getter(v22);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v23 = sub_10000B0B4();
  v24 = sub_100007280((uint64_t *)&unk_100025C10);
  v25 = sub_10001837C();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v24, v25, v6, v23);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v12, v8, v19);
  _Block_release(v19);
  swift_unknownObjectRelease(v16);

  (*(void (**)(char *, uint64_t))(v30 + 8))(v8, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v12, v29);
}

void sub_10001518C(uint64_t a1, void (*a2)(BOOL), uint64_t a3, uint64_t a4)
{
  BOOL v6;

  v6 = sub_10001851C();
  if (a2)
  {
    a2(v6);
    sub_100014A28(1, a4);
  }
  else
  {
    __break(1u);
  }
}

xpc_activity_state_t sub_1000152E0(_xpc_activity_s *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  xpc_activity_state_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD aBlock[5];
  uint64_t v30;

  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = xpc_activity_get_state(a1);
  if (result == 2)
  {
    v13 = static os_log_type_t.info.getter(2);
    v28 = v5;
    v14 = v13;
    v15 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
    v16 = (void *)static OS_os_log.default.getter(v15);
    os_log(_:dso:log:type:_:)("Beginning periodic remote asset check", 37, 2, &_mh_execute_header, v16, v14, &_swiftEmptyArrayStorage);

    v17 = os_transaction_create("com.apple.tzd.local-asset-check");
    sub_10000738C(0, (unint64_t *)&unk_100025C00, OS_dispatch_queue_ptr);
    v18 = (void *)static OS_dispatch_queue.main.getter();
    v19 = swift_allocObject(&unk_100021770, 32, 7);
    *(_QWORD *)(v19 + 16) = a2;
    *(_QWORD *)(v19 + 24) = v17;
    aBlock[4] = sub_100018E38;
    v30 = v19;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100013674;
    aBlock[3] = &unk_100021788;
    v20 = _Block_copy(aBlock);
    v21 = v30;
    v22 = a2;
    swift_unknownObjectRetain(v17);
    v23 = swift_release(v21);
    static DispatchQoS.unspecified.getter(v23);
    aBlock[0] = &_swiftEmptyArrayStorage;
    v24 = sub_10000B0B4();
    v25 = sub_100007280((uint64_t *)&unk_100025C10);
    v26 = sub_10001837C();
    dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v25, v26, v4, v24);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v11, v7, v20);
    _Block_release(v20);
    swift_unknownObjectRelease(v17);

    (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v4);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return result;
}

xpc_activity_state_t sub_100015550(_xpc_activity_s *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  xpc_activity_state_t result;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD aBlock[5];
  uint64_t v26;

  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchQoS(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = xpc_activity_get_state(a1);
  if (result == 2)
  {
    v11 = static os_log_type_t.info.getter();
    v24 = v3;
    v12 = v11;
    sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
    v13 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)("Beginning periodic stale data cleanup", 37, 2, &_mh_execute_header, v13, v12, &_swiftEmptyArrayStorage);

    v14 = os_transaction_create("com.apple.tzd.stale-data-cleanup");
    sub_10000738C(0, (unint64_t *)&unk_100025C00, OS_dispatch_queue_ptr);
    v15 = (void *)static OS_dispatch_queue.main.getter();
    v16 = swift_allocObject(&unk_100021720, 24, 7);
    *(_QWORD *)(v16 + 16) = v14;
    aBlock[4] = sub_100018E08;
    v26 = v16;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100013674;
    aBlock[3] = &unk_100021738;
    v17 = _Block_copy(aBlock);
    v18 = v26;
    swift_unknownObjectRetain(v14);
    v19 = swift_release(v18);
    static DispatchQoS.unspecified.getter(v19);
    aBlock[0] = &_swiftEmptyArrayStorage;
    v20 = sub_10000B0B4();
    v21 = sub_100007280((uint64_t *)&unk_100025C10);
    v22 = sub_10001837C();
    dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v21, v22, v2, v20);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v9, v5, v17);
    _Block_release(v17);
    swift_unknownObjectRelease(v14);

    (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v2);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  return result;
}

void sub_1000157B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  __int16 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[5];
  _OWORD v16[2];

  v1 = v0;
  v2 = sub_10000738C(0, (unint64_t *)&unk_100025FC0, &off_100020648);
  v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(v2), "options");
  if (v3)
  {
    v4 = v3;
    v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

    *(_QWORD *)&v16[0] = 0x496567617373654DLL;
    *((_QWORD *)&v16[0] + 1) = 0xE900000000000044;
    AnyHashable.init<A>(_:)(v15, v16, &type metadata for String, &protocol witness table for String);
    if (*(_QWORD *)(v5 + 16) && (v6 = sub_1000170F4((uint64_t)v15), (v7 & 1) != 0))
    {
      sub_10000AFEC(*(_QWORD *)(v5 + 56) + 32 * v6, (uint64_t)&v13);
    }
    else
    {
      v13 = 0u;
      v14 = 0u;
    }
    swift_bridgeObjectRelease(v5);
    if (*((_QWORD *)&v14 + 1))
    {
      sub_100010E24((uint64_t)v15);
      sub_1000116C4(&v13, v16);
      swift_dynamicCast(&v12, v16, (char *)&type metadata for Any + 8, &type metadata for UInt16, 7);
      *(_WORD *)(v1 + OBJC_IVAR____TtC3tzd6Daemon_assetDetectedType) = v12;
      v8 = OBJC_IVAR____TtC3tzd6Daemon_companionService;
      objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC3tzd6Daemon_companionService), "setProtobufAction:forIncomingRequestsOfType:", "handleAssetDetectedMsg:");
      v9 = *(void **)(v1 + v8);
      sub_10000738C(0, (unint64_t *)&unk_100025C00, OS_dispatch_queue_ptr);
      v10 = v9;
      v11 = (void *)static OS_dispatch_queue.main.getter();
      objc_msgSend(v10, "addDelegate:queue:", v1, v11);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_100015970(uint64_t a1, unint64_t a2, unsigned __int16 a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t inited;
  uint64_t v10;
  Swift::Int v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  Class isa;
  id v21;
  id v22;
  id v23;
  id v24;
  Swift::Int v25;
  Class v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  unint64_t v32;
  Class v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  Class v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  Class v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  id v58;
  _QWORD v59[2];
  _BYTE v60[104];
  _BYTE v61[48];

  v8 = sub_100007280(&qword_100025F60);
  inited = swift_initStackObject(v8, v61);
  *(_OWORD *)(inited + 16) = xmmword_10001B180;
  *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(IDSDefaultPairedDevice);
  *(_QWORD *)(inited + 40) = v10;
  v11 = sub_100018098(inited);
  swift_setDeallocating(inited);
  swift_arrayDestroy(inited + 32, 1, &type metadata for String);
  v12 = OBJC_IVAR____TtC3tzd6Daemon_companionService;
  v13 = objc_msgSend(*(id *)(v4 + OBJC_IVAR____TtC3tzd6Daemon_companionService), "accounts");
  if (!v13)
    __break(1u);
  v14 = v13;
  v15 = sub_10000738C(0, &qword_100025F68, IDSAccount_ptr);
  v16 = sub_10001827C(&qword_100025F70, &qword_100025F68, IDSAccount_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
  v17 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v14, v15, v16);

  v18 = (void *)sub_1000136A0(v17);
  swift_bridgeObjectRelease(v17);
  if (!v18)
    goto LABEL_8;
  v19 = objc_allocWithZone((Class)IDSProtobuf);
  sub_100018238(a1, a2);
  isa = Data._bridgeToObjectiveC()().super.isa;
  sub_100016E60(a1, a2);
  v21 = objc_msgSend(v19, "initWithProtobufData:type:isResponse:", isa, a3, 0);

  if (!v21)
  {

LABEL_8:
    swift_bridgeObjectRelease(v11);
    return;
  }
  v22 = *(id *)(v4 + v12);
  v23 = v21;
  v24 = v18;
  v25 = sub_100015FD4(v11);
  swift_bridgeObjectRelease(v11);
  v26 = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v25);
  v27 = sub_100007280(&qword_100025F78);
  v28 = swift_initStackObject(v27, v60);
  *(_OWORD *)(v28 + 16) = xmmword_10001B180;
  v59[0] = static String._unconditionallyBridgeFromObjectiveC(_:)(IDSSendMessageOptionTimeoutKey);
  v59[1] = v29;
  AnyHashable.init<A>(_:)((_QWORD *)(v28 + 32), v59, &type metadata for String, &protocol witness table for String);
  *(_QWORD *)(v28 + 96) = &type metadata for Double;
  *(_QWORD *)(v28 + 72) = 0x410FA40000000000;
  v30 = v28;
  v31 = v24;
  v32 = sub_1000139F0(v30);
  v33 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v32);
  v58 = 0;
  v59[0] = 0;
  LOBYTE(v32) = objc_msgSend(v22, "sendProtobuf:fromAccount:toDestinations:priority:options:identifier:error:", v23, v24, v26, a4, v33, v59, &v58);

  v35 = v58;
  v34 = (void *)v59[0];
  if ((v32 & 1) != 0)
  {
    v36 = v58;
    v37 = v34;
    v38 = static os_log_type_t.debug.getter(v37);
    v39 = sub_100007280(&qword_1000259D8);
    v40 = swift_allocObject(v39, 112, 7);
    *(_OWORD *)(v40 + 16) = xmmword_10001B160;
    v41 = Data._bridgeToObjectiveC()().super.isa;
    *(_QWORD *)(v40 + 56) = sub_10000738C(0, (unint64_t *)&unk_100025F80, NSObject_ptr);
    *(_QWORD *)(v40 + 64) = sub_10001827C((unint64_t *)&qword_100025D00, (unint64_t *)&unk_100025F80, NSObject_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
    *(_QWORD *)(v40 + 32) = v41;
    if (v37)
    {
      *(_QWORD *)(v40 + 96) = sub_10000738C(0, &qword_100025F90, NSString_ptr);
      *(_QWORD *)(v40 + 104) = sub_10001827C(&qword_100025F98, &qword_100025F90, NSString_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
      *(_QWORD *)(v40 + 72) = v37;
      sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
      v42 = v37;
      v43 = (void *)static OS_os_log.default.getter(v42);
      os_log(_:dso:log:type:_:)("IDS send successful: %{public}@ with ID %{public}@", 50, 2, &_mh_execute_header, v43, v38, v40);

      swift_bridgeObjectRelease(v40);
      return;
    }
    __break(1u);
    goto LABEL_14;
  }
  v44 = v58;
  v45 = v34;
  v46 = _convertNSErrorToError(_:)(v35);

  v48 = swift_willThrow(v47);
  v49 = static os_log_type_t.info.getter(v48);
  v50 = sub_100007280(&qword_1000259D8);
  v51 = swift_allocObject(v50, 152, 7);
  *(_OWORD *)(v51 + 16) = xmmword_10001B150;
  v52 = Data._bridgeToObjectiveC()().super.isa;
  *(_QWORD *)(v51 + 56) = sub_10000738C(0, (unint64_t *)&unk_100025F80, NSObject_ptr);
  *(_QWORD *)(v51 + 64) = sub_10001827C((unint64_t *)&qword_100025D00, (unint64_t *)&unk_100025F80, NSObject_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
  *(_QWORD *)(v51 + 32) = v52;
  if (!v45)
  {
LABEL_14:
    __break(1u);
    return;
  }
  *(_QWORD *)(v51 + 96) = sub_10000738C(0, &qword_100025F90, NSString_ptr);
  *(_QWORD *)(v51 + 104) = sub_10001827C(&qword_100025F98, &qword_100025F90, NSString_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
  *(_QWORD *)(v51 + 72) = v45;
  v53 = v45;
  v54 = _convertErrorToNSError(_:)(v46);
  *(_QWORD *)(v51 + 136) = sub_10000738C(0, (unint64_t *)&unk_100025CF0, NSError_ptr);
  *(_QWORD *)(v51 + 144) = sub_10001827C((unint64_t *)&qword_1000259E8, (unint64_t *)&unk_100025CF0, NSError_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
  *(_QWORD *)(v51 + 112) = v54;
  v55 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
  v56 = (void *)static OS_os_log.default.getter(v55);
  os_log(_:dso:log:type:_:)("IDS send failed: %{public}@ with ID %{public}@, error %@", 56, 2, &_mh_execute_header, v56, v49, v51);
  swift_bridgeObjectRelease(v51);

  swift_errorRelease(v46);
}

Swift::Int sub_100015FD4(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  char *v9;
  Swift::Int result;
  int64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  _OWORD v32[2];
  uint64_t v33;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    sub_100007280((uint64_t *)&unk_100025FB0);
    v3 = (_QWORD *)static _SetStorage.allocate(capacity:)(v2);
  }
  else
  {
    v3 = &_swiftEmptySetSingleton;
  }
  v4 = a1 + 56;
  v5 = -1 << *(_BYTE *)(a1 + 32);
  if (-v5 < 64)
    v6 = ~(-1 << -(char)v5);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(a1 + 56);
  v8 = (unint64_t)(63 - v5) >> 6;
  v9 = (char *)(v3 + 7);
  swift_bridgeObjectRetain(a1);
  result = swift_retain(v3);
  v11 = 0;
  while (1)
  {
    if (v7)
    {
      v14 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_28;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v16 >= v8)
      goto LABEL_37;
    v17 = *(_QWORD *)(v4 + 8 * v16);
    v18 = v11 + 1;
    if (!v17)
    {
      v18 = v11 + 2;
      if (v11 + 2 >= v8)
        goto LABEL_37;
      v17 = *(_QWORD *)(v4 + 8 * v18);
      if (!v17)
      {
        v18 = v11 + 3;
        if (v11 + 3 >= v8)
          goto LABEL_37;
        v17 = *(_QWORD *)(v4 + 8 * v18);
        if (!v17)
        {
          v18 = v11 + 4;
          if (v11 + 4 >= v8)
            goto LABEL_37;
          v17 = *(_QWORD *)(v4 + 8 * v18);
          if (!v17)
            break;
        }
      }
    }
LABEL_27:
    v7 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v18 << 6);
    v11 = v18;
LABEL_28:
    v20 = (_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * v15);
    v21 = v20[1];
    *(_QWORD *)&v29 = *v20;
    *((_QWORD *)&v29 + 1) = v21;
    swift_bridgeObjectRetain(v21);
    swift_dynamicCast(v32, &v29, &type metadata for String, &type metadata for AnyHashable, 7);
    v29 = v32[0];
    v30 = v32[1];
    v31 = v33;
    result = AnyHashable._rawHashValue(seed:)(v3[5]);
    v22 = -1 << *((_BYTE *)v3 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)&v9[8 * (v23 >> 6)]) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)&v9[8 * (v23 >> 6)])) | v23 & 0x7FFFFFFFFFFFFFC0;
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
        v28 = *(_QWORD *)&v9[8 * v24];
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)&v9[(v12 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v12;
    v13 = v3[6] + 40 * v12;
    *(_OWORD *)v13 = v29;
    *(_OWORD *)(v13 + 16) = v30;
    *(_QWORD *)(v13 + 32) = v31;
    ++v3[2];
  }
  v19 = v11 + 5;
  if (v11 + 5 >= v8)
  {
LABEL_37:
    swift_release(v3);
    sub_1000182F8(a1);
    return (Swift::Int)v3;
  }
  v17 = *(_QWORD *)(v4 + 8 * v19);
  if (v17)
  {
    v18 = v11 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v18 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v18 >= v8)
      goto LABEL_37;
    v17 = *(_QWORD *)(v4 + 8 * v18);
    ++v19;
    if (v17)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

void sub_100016448(void *a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void **v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSString v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  _QWORD aBlock[6];

  v2 = os_transaction_create("com.apple.tzd.handleAssetDetectedMsg");
  if (a1 && (v3 = objc_msgSend(a1, "assetVersion")) != 0)
  {
    v4 = v3;
    v5 = (void **)static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v32 = type metadata accessor for TZSAsset(0);
  v8 = swift_allocObject(&unk_100021568, 24, 7);
  *(_QWORD *)(v8 + 16) = v2;
  v9 = swift_unknownObjectRetain_n(v2, 2);
  v10 = static os_log_type_t.debug.getter(v9);
  v11 = sub_100007280(&qword_1000259D8);
  v12 = swift_allocObject(v11, 72, 7);
  *(_OWORD *)(v12 + 16) = xmmword_10001B180;
  *(_QWORD *)(v12 + 56) = &type metadata for String;
  v13 = sub_100010248();
  *(_QWORD *)(v12 + 64) = v13;
  v14 = 0x29656E6F6E28;
  if (v7)
    v14 = (uint64_t)v5;
  v15 = 0xE600000000000000;
  if (v7)
    v15 = v7;
  *(_QWORD *)(v12 + 32) = v14;
  *(_QWORD *)(v12 + 40) = v15;
  sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
  v16 = swift_bridgeObjectRetain(v7);
  v17 = (void *)static OS_os_log.default.getter(v16);
  os_log(_:dso:log:type:_:)("synchronizeAssetsConditional with version %{public}@", 52, 2, &_mh_execute_header, v17, v10, v12);
  swift_bridgeObjectRelease(v12);

  if (v7)
  {
    swift_bridgeObjectRetain(v7);
    sub_10001120C(v5, v7, v32, sub_100018D2C, v8);
    swift_unknownObjectRelease_n(v2, 2);
    swift_bridgeObjectRelease_n(v7, 2);
    swift_release(v8);
  }
  else
  {
    v18 = v2;
    v19 = swift_retain(v8);
    v20 = static os_log_type_t.debug.getter(v19);
    v21 = swift_allocObject(v11, 72, 7);
    *(_OWORD *)(v21 + 16) = xmmword_10001B180;
    *(_QWORD *)(v21 + 56) = &type metadata for String;
    *(_QWORD *)(v21 + 64) = v13;
    *(_QWORD *)(v21 + 32) = 1702195828;
    *(_QWORD *)(v21 + 40) = 0xE400000000000000;
    v22 = (void *)static OS_os_log.default.getter(v21);
    os_log(_:dso:log:type:_:)("Beginning advancePipeline with forceCatalogDownload: %{public}@", 63, 2, &_mh_execute_header, v22, v20, v21);
    swift_bridgeObjectRelease(v21);

    v23 = (void *)objc_opt_self(MAAsset);
    v24 = String._bridgeToObjectiveC()();
    v25 = v11;
    if (qword_100025818 != -1)
      swift_once(&qword_100025818, sub_10000B2B4);
    v26 = qword_100026AE8;
    aBlock[4] = sub_10000DAF0;
    aBlock[5] = 0;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000F5AC;
    aBlock[3] = &unk_100021580;
    v27 = _Block_copy(aBlock);
    objc_msgSend(v23, "startCatalogDownload:options:then:", v24, v26, v27);
    _Block_release(v27);

    v29 = static os_log_type_t.info.getter(v28);
    v30 = swift_allocObject(v25, 72, 7);
    *(_OWORD *)(v30 + 16) = xmmword_10001B180;
    *(_QWORD *)(v30 + 56) = &type metadata for String;
    *(_QWORD *)(v30 + 64) = v13;
    *(_QWORD *)(v30 + 32) = 1701736302;
    *(_QWORD *)(v30 + 40) = 0xE400000000000000;
    v31 = (void *)static OS_os_log.default.getter(v30);
    os_log(_:dso:log:type:_:)("Checked for updated assets in response to IDS; error: %{public}@",
      64,
      2,
      &_mh_execute_header,
      v31,
      v29,
      v30);
    swift_unknownObjectRelease_n(v18, 2);
    swift_release_n(v8, 2);
    swift_bridgeObjectRelease(v30);

  }
}

void sub_10001682C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  v2 = static os_log_type_t.info.getter(a1);
  v3 = sub_100007280(&qword_1000259D8);
  v4 = swift_allocObject(v3, 72, 7);
  v5 = v4;
  *(_OWORD *)(v4 + 16) = xmmword_10001B180;
  if (a1)
  {
    v6 = _convertErrorToNSError(_:)(a1);
    v10 = sub_10000738C(0, (unint64_t *)&unk_100025CF0, NSError_ptr);
    v11 = sub_10001827C((unint64_t *)&qword_1000259E8, (unint64_t *)&unk_100025CF0, NSError_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
    *(_QWORD *)&v9 = v6;
    sub_10001167C(&v9, v5 + 32);
  }
  else
  {
    *(_QWORD *)(v4 + 56) = &type metadata for String;
    *(_QWORD *)(v4 + 64) = sub_100010248();
    *(_QWORD *)(v5 + 32) = 1701736302;
    *(_QWORD *)(v5 + 40) = 0xE400000000000000;
  }
  v7 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
  v8 = (void *)static OS_os_log.default.getter(v7);
  os_log(_:dso:log:type:_:)("Checked for updated assets in response to IDS; error: %{public}@",
    64,
    2,
    &_mh_execute_header,
    v8,
    v2,
    v5);
  swift_bridgeObjectRelease(v5);

}

void sub_1000169CC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;

  v3 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v3 = a1 & 0xFFFFFFFFFFFFLL;
  if (v3)
  {
    v10 = objc_msgSend(objc_allocWithZone((Class)TZDAssetDetectedMsg), "init");
    if (v10)
    {
      v4 = String._bridgeToObjectiveC()();
      objc_msgSend(v10, "setAssetVersion:", v4);

      v5 = objc_msgSend(v10, "data");
      if (v5)
      {
        v6 = v5;
        v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
        v9 = v8;

        sub_100015970(v7, v9, *(_WORD *)(v2 + OBJC_IVAR____TtC3tzd6Daemon_assetDetectedType), 300);
        sub_100016E60(v7, v9);

        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
}

id sub_100016AD0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Daemon();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for Daemon()
{
  return objc_opt_self(_TtC3tzd6Daemon);
}

void sub_100016B68(void *a1, void (**a2)(_QWORD))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  id v18;
  NSString v19;
  id v20;
  id v21;

  v4 = static os_log_type_t.debug.getter(a1);
  v5 = sub_100007280(&qword_1000259D8);
  v6 = swift_allocObject(v5, 72, 7);
  *(_OWORD *)(v6 + 16) = xmmword_10001B180;
  v7 = objc_msgSend(a1, "actionIdentifier");
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
  v10 = v9;

  *(_QWORD *)(v6 + 56) = &type metadata for String;
  *(_QWORD *)(v6 + 64) = sub_100010248();
  *(_QWORD *)(v6 + 32) = v8;
  *(_QWORD *)(v6 + 40) = v10;
  v11 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
  v12 = (void *)static OS_os_log.default.getter(v11);
  os_log(_:dso:log:type:_:)("Notification response received: %{public}@", 42, 2, &_mh_execute_header, v12, v4, v6);
  swift_bridgeObjectRelease(v6);

  v13 = objc_msgSend(a1, "actionIdentifier");
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
  v16 = v15;

  if (v14 == 0xD00000000000004ALL && v16 == 0x800000010001C570)
  {
    swift_bridgeObjectRelease(0x800000010001C570);
LABEL_5:
    v18 = objc_allocWithZone((Class)FBSShutdownOptions);
    v19 = String._bridgeToObjectiveC()();
    v20 = objc_msgSend(v18, "initWithReason:", v19);

    objc_msgSend(v20, "setRebootType:", 1);
    v21 = objc_msgSend((id)objc_opt_self(FBSSystemService), "sharedService");
    objc_msgSend(v21, "shutdownWithOptions:", v20);

    goto LABEL_6;
  }
  v17 = _stringCompareWithSmolCheck(_:_:expecting:)(v14, v16, 0xD00000000000004ALL, 0x800000010001C570, 0);
  swift_bridgeObjectRelease(v16);
  if ((v17 & 1) != 0)
    goto LABEL_5;
LABEL_6:
  a2[2](a2);
  _Block_release(a2);
}

uint64_t sub_100016E60(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

void sub_100016EA4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v2 = static os_log_type_t.debug.getter();
  v3 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
  v4 = (void *)static OS_os_log.default.getter(v3);
  os_log(_:dso:log:type:_:)("User notification posted", 24, 2, &_mh_execute_header, v4, v2, &_swiftEmptyArrayStorage);

  if (a1)
  {
    v5 = swift_errorRetain(a1);
    v6 = static os_log_type_t.error.getter(v5);
    v7 = sub_100007280(&qword_1000259D8);
    v8 = swift_allocObject(v7, 72, 7);
    *(_OWORD *)(v8 + 16) = xmmword_10001B180;
    v9 = _convertErrorToNSError(_:)(a1);
    *(_QWORD *)(v8 + 56) = sub_10000738C(0, (unint64_t *)&unk_100025CF0, NSError_ptr);
    v10 = sub_10001827C((unint64_t *)&qword_1000259E8, (unint64_t *)&unk_100025CF0, NSError_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
    *(_QWORD *)(v8 + 64) = v10;
    *(_QWORD *)(v8 + 32) = v9;
    v11 = (void *)static OS_os_log.default.getter(v10);
    os_log(_:dso:log:type:_:)("Failed to register notification request for updated time zones. Error: %{public}@", 81, 2, &_mh_execute_header, v11, v6, v8);
    swift_bridgeObjectRelease(v8);

    swift_errorRelease(a1);
  }
}

id sub_10001701C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  NSString v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v12;

  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v12 = 0;
  v7 = objc_msgSend(v3, "initWithPattern:options:error:", v6, a3, &v12);

  v8 = v12;
  if (v7)
  {
    v9 = v12;
  }
  else
  {
    v10 = v12;
    _convertNSErrorToError(_:)(v8);

    swift_willThrow();
  }
  return v7;
}

unint64_t sub_1000170F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_100017208(a1, v4);
}

unint64_t sub_100017124(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_1000172CC(a1, a2, v5);
}

unint64_t sub_100017188(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  Swift::Int v7;
  _QWORD v9[9];

  v3 = *(_QWORD *)(v1 + 40);
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v6 = v5;
  Hasher.init(_seed:)(v9, v3);
  String.hash(into:)(v9, v4, v6);
  v7 = Hasher._finalize()();
  swift_bridgeObjectRelease(v6);
  return sub_1000173AC(a1, v7);
}

unint64_t sub_100017208(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_1000182BC(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_100010E24((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_1000172CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = v10[1];
    v12 = *v10 == a1 && v11 == a2;
    if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0) & 1) == 0)
    {
      v13 = ~v5;
      do
      {
        v6 = (v6 + 1) & v13;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v14 = (_QWORD *)(v9 + 16 * v6);
        v15 = v14[1];
        v16 = *v14 == a1 && v15 == a2;
      }
      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0) & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1000173AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  char v22;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v5));
    v9 = v8;
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
    if (v7 == v10 && v9 == v11)
    {
LABEL_16:
      swift_bridgeObjectRelease_n(v9, 2);
      return v5;
    }
    v13 = v11;
    v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v9, v10, v11, 0);
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v13);
    if ((v14 & 1) == 0)
    {
      v15 = ~v4;
      v5 = (v5 + 1) & v15;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v5));
          v9 = v17;
          v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
          if (v16 == v18 && v9 == v19)
            break;
          v21 = v19;
          v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v9, v18, v19, 0);
          swift_bridgeObjectRelease(v9);
          swift_bridgeObjectRelease(v21);
          if ((v22 & 1) == 0)
          {
            v5 = (v5 + 1) & v15;
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

void sub_100017520(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  void *v4;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  Swift::Int v13;
  uint64_t v14;
  id v15;
  char v16;
  uint64_t v17;
  id v18;
  char v19;
  id v20;
  uint64_t v21;
  void *v22;

  v7 = a1;
  if ((a4 & 0xC000000000000001) == 0)
  {
    if ((a3 & 1) != 0)
      goto LABEL_13;
    if (a1 < 0 || 1 << *(_BYTE *)(a4 + 32) <= a1)
    {
      __break(1u);
    }
    else if (((*(_QWORD *)(a4 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2)
        goto LABEL_20;
      __break(1u);
LABEL_13:
      if (__CocoaSet.Index.age.getter(a1, a2) == *(_DWORD *)(a4 + 36))
      {
        v11 = __CocoaSet.Index.element.getter(v7, a2);
        v21 = v11;
        v12 = sub_10000738C(0, &qword_100025F68, IDSAccount_ptr);
        swift_unknownObjectRetain(v11);
        swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v12, 7);
        v4 = v22;
        swift_unknownObjectRelease(v11);
        v13 = NSObject._rawHashValue(seed:)(*(_QWORD *)(a4 + 40));
        v14 = -1 << *(_BYTE *)(a4 + 32);
        v7 = v13 & ~v14;
        if (((*(_QWORD *)(a4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0)
        {
          v15 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v7);
          v16 = static NSObject.== infix(_:_:)(v15);

          if ((v16 & 1) == 0)
          {
            v17 = ~v14;
            do
            {
              v7 = (v7 + 1) & v17;
              if (((*(_QWORD *)(a4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
                goto LABEL_24;
              v18 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v7);
              v19 = static NSObject.== infix(_:_:)(v18);

            }
            while ((v19 & 1) == 0);
          }

LABEL_20:
          v20 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v7);
          return;
        }
LABEL_24:

        __break(1u);
        goto LABEL_25;
      }
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }
    __break(1u);
    goto LABEL_23;
  }
  if ((a3 & 1) == 0)
  {
LABEL_25:
    __break(1u);
    return;
  }
  if (a4 < 0)
    v8 = a4;
  else
    v8 = a4 & 0xFFFFFFFFFFFFFF8;
  v9 = __CocoaSet.element(at:)(a1, a2, v8);
  v21 = v9;
  v10 = sub_10000738C(0, &qword_100025F68, IDSAccount_ptr);
  swift_unknownObjectRetain(v9);
  swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v10, 7);
  swift_unknownObjectRelease(v9);
}

uint64_t sub_100017788(uint64_t a1)
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

  v1 = *(_QWORD *)(a1 + 56);
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
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 72);
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

void sub_100017810()
{
  void *v0;
  id v1;
  NSString v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  NSString v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  NSString v30;
  unsigned int v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
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
  uint64_t inited;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  id v66[2];
  _BYTE v67[80];

  v0 = (void *)objc_opt_self(NSFileManager);
  v1 = objc_msgSend(v0, "defaultManager");
  if (qword_100025868 != -1)
    swift_once(&qword_100025868, sub_100019CB4);
  v2 = String._bridgeToObjectiveC()();
  v3 = objc_msgSend(v1, "fileExistsAtPath:", v2);

  if (v3)
  {
    v4 = String.init(contentsOfFile:)(qword_100026B68, unk_100026B70);
    v6 = v5;
    v7 = objc_allocWithZone((Class)NSRegularExpression);
    v8 = sub_10001701C(0xD000000000000041, 0x800000010001CC40, 0);
    swift_bridgeObjectRetain(v6);
    v9 = String.UTF16View.count.getter(v4, v6);
    swift_bridgeObjectRelease(v6);
    v10 = String._bridgeToObjectiveC()();
    v11 = objc_msgSend(v8, "matchesInString:options:range:", v10, 0, 0, v9);

    v12 = sub_10000738C(0, &qword_100026048, NSTextCheckingResult_ptr);
    v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v11, v12);

    if ((unint64_t)v13 >> 62)
    {
      if (v13 < 0)
        v63 = v13;
      else
        v63 = v13 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v13);
      v14 = _CocoaArrayWrapper.endIndex.getter(v63);
      swift_bridgeObjectRelease(v13);
    }
    else
    {
      v14 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v65 = v8;
    if (v14 != 1)
      goto LABEL_13;
    if ((v13 & 0xC000000000000001) != 0)
    {
      v15 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v13);
    }
    else
    {
      if (!*(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10))
        __break(1u);
      v15 = *(id *)(v13 + 32);
    }
    v16 = v15;
    v17 = objc_msgSend(v15, "rangeAtIndex:", 1);
    v19 = v18;

    v64 = Range<>.init(_:in:)(v17, v19, v4, v6);
    if ((v21 & 1) != 0)
    {
LABEL_13:
      v24 = swift_bridgeObjectRelease(v13);
    }
    else
    {
      v22 = v20;
      if ((v13 & 0xC000000000000001) != 0)
        v23 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v13);
      else
        v23 = *(id *)(v13 + 32);
      v42 = v23;
      swift_bridgeObjectRelease(v13);
      v43 = objc_msgSend(v42, "rangeAtIndex:", 2);
      v45 = v44;

      v24 = Range<>.init(_:in:)(v43, v45, v4, v6);
      if ((v47 & 1) == 0)
      {
        v48 = v24;
        v49 = v46;
        v50 = String.subscript.getter(v64, v22, v4, v6);
        v52 = v51;
        static String._fromSubstring(_:)(v50);
        v54 = v53;
        swift_bridgeObjectRelease(v52);
        v55 = String.subscript.getter(v48, v49, v4, v6);
        v57 = v56;
        swift_bridgeObjectRelease(v6);
        static String._fromSubstring(_:)(v55);
        v59 = v58;
        swift_bridgeObjectRelease(v57);
        v60 = sub_100007280((uint64_t *)&unk_100025D10);
        inited = swift_initStackObject(v60, v67);
        *(_OWORD *)(inited + 16) = xmmword_10001B160;
        *(_QWORD *)(inited + 32) = 0x6973726556646C6FLL;
        *(_QWORD *)(inited + 40) = 0xEA00000000006E6FLL;
        *(_QWORD *)(inited + 48) = String._bridgeToObjectiveC()();
        *(_QWORD *)(inited + 56) = 0x697372655677656ELL;
        *(_QWORD *)(inited + 64) = 0xEA00000000006E6FLL;
        *(_QWORD *)(inited + 72) = String._bridgeToObjectiveC()();
        v62 = sub_1000137AC(inited);
        sub_100013074(0x7463417465737361, (void *)0xEE00646574617669);
        swift_bridgeObjectRelease(v59);
        swift_bridgeObjectRelease(v54);
        swift_bridgeObjectRelease(v62);
LABEL_15:
        v29 = objc_msgSend(v0, "defaultManager", v64);
        v30 = String._bridgeToObjectiveC()();
        v66[0] = 0;
        v31 = objc_msgSend(v29, "removeItemAtPath:error:", v30, v66);

        v32 = v66[0];
        if (v31)
        {
          v33 = v66[0];

        }
        else
        {
          v34 = v66[0];
          v35 = _convertNSErrorToError(_:)(v32);

          swift_willThrow();
          v37 = static os_log_type_t.error.getter(v36);
          v38 = sub_100007280(&qword_1000259D8);
          v39 = swift_allocObject(v38, 72, 7);
          *(_OWORD *)(v39 + 16) = xmmword_10001B180;
          v40 = _convertErrorToNSError(_:)(v35);
          *(_QWORD *)(v39 + 56) = sub_10000738C(0, (unint64_t *)&unk_100025CF0, NSError_ptr);
          *(_QWORD *)(v39 + 64) = sub_10001827C((unint64_t *)&qword_1000259E8, (unint64_t *)&unk_100025CF0, NSError_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
          *(_QWORD *)(v39 + 32) = v40;
          sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
          v41 = (void *)static OS_os_log.default.getter();
          os_log(_:dso:log:type:_:)("Could not read version transition file due to %{public}@", 56, 2, &_mh_execute_header, v41, v37, v39);
          swift_bridgeObjectRelease(v39);

          swift_errorRelease(v35);
        }
        return;
      }
    }
    v25 = static os_log_type_t.fault.getter(v24);
    v26 = sub_100007280(&qword_1000259D8);
    v27 = swift_allocObject(v26, 72, 7);
    *(_OWORD *)(v27 + 16) = xmmword_10001B180;
    *(_QWORD *)(v27 + 56) = &type metadata for String;
    *(_QWORD *)(v27 + 64) = sub_100010248();
    *(_QWORD *)(v27 + 32) = v4;
    *(_QWORD *)(v27 + 40) = v6;
    sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
    v28 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)("Corrupt version transition string %{public}@", 44, 2, &_mh_execute_header, v28, v25, v27);
    swift_bridgeObjectRelease(v27);

    goto LABEL_15;
  }
}

uint64_t sub_100017E70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v26;
  uint64_t v27;
  _QWORD aBlock[5];
  _QWORD *v29;

  v8 = type metadata accessor for DispatchWorkItemFlags(0);
  v27 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for DispatchQoS(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = String.utf8CString.getter(a1, a2);
  v16 = os_transaction_create(v15 + 32);
  swift_release(v15);
  sub_10000738C(0, (unint64_t *)&unk_100025C00, OS_dispatch_queue_ptr);
  v17 = (void *)static OS_dispatch_queue.main.getter();
  v18 = (_QWORD *)swift_allocObject(&unk_1000215E0, 40, 7);
  v18[2] = a3;
  v18[3] = a4;
  v18[4] = v16;
  aBlock[4] = sub_100018DC8;
  v29 = v18;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100013674;
  aBlock[3] = &unk_1000215F8;
  v19 = _Block_copy(aBlock);
  v20 = v29;
  swift_retain(a4);
  swift_unknownObjectRetain(v16);
  v21 = swift_release(v20);
  static DispatchQoS.unspecified.getter(v21);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v22 = sub_10000B0B4();
  v23 = sub_100007280((uint64_t *)&unk_100025C10);
  v24 = sub_10001837C();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v23, v24, v8, v22);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v14, v10, v19);
  _Block_release(v19);
  swift_unknownObjectRelease(v16);

  (*(void (**)(char *, uint64_t))(v27 + 8))(v10, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

Swift::Int sub_100018098(uint64_t a1)
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
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[9];

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    sub_100007280(&qword_100025A70);
    v3 = static _SetStorage.allocate(capacity:)(v1);
    v4 = 0;
    v5 = v3 + 56;
    v27 = a1 + 32;
    while (1)
    {
      v6 = (uint64_t *)(v27 + 16 * v4);
      v8 = *v6;
      v7 = v6[1];
      Hasher.init(_seed:)(v28, *(_QWORD *)(v3 + 40));
      swift_bridgeObjectRetain(v7);
      String.hash(into:)(v28, v8, v7);
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
        v17 = v16[1];
        v18 = *v16 == v8 && v17 == v7;
        if (v18 || (result = _stringCompareWithSmolCheck(_:_:expecting:)(*v16, v17, v8, v7, 0), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease(v7);
          goto LABEL_4;
        }
        v19 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v19;
          v12 = v11 >> 6;
          v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
          v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0)
            break;
          v20 = (_QWORD *)(v15 + 16 * v11);
          v21 = v20[1];
          if (*v20 != v8 || v21 != v7)
          {
            result = _stringCompareWithSmolCheck(_:_:expecting:)(*v20, v21, v8, v7, 0);
            if ((result & 1) == 0)
              continue;
          }
          goto LABEL_3;
        }
      }
      *(_QWORD *)(v5 + 8 * v12) = v14 | v13;
      v23 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v11);
      *v23 = v8;
      v23[1] = v7;
      v24 = *(_QWORD *)(v3 + 16);
      v25 = __OFADD__(v24, 1);
      v26 = v24 + 1;
      if (v25)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v26;
LABEL_4:
      if (++v4 == v1)
        return v3;
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

uint64_t sub_100018238(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain(result);
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10001827C(unint64_t *a1, unint64_t *a2, _QWORD *a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = sub_10000738C(255, a2, a3);
    result = swift_getWitnessTable(a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000182BC(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_1000182F8(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100018300(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease(result);
  return result;
}

uint64_t sub_10001830C()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 24))
    swift_release(*(_QWORD *)(v0 + 32));
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

void sub_100018348()
{
  uint64_t v0;

  sub_10001518C(*(_QWORD *)(v0 + 16), *(void (**)(BOOL))(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_100018354(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100018364(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10001836C(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

unint64_t sub_10001837C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100025FE0;
  if (!qword_100025FE0)
  {
    v1 = sub_10000AEC4((uint64_t *)&unk_100025C10);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100025FE0);
  }
  return result;
}

BOOL sub_1000183C8(void *a1)
{
  uint64_t v1;
  id v3;
  id v4;
  id v5;
  void *v6;
  char **v7;
  _OWORD v9[2];

  v3 = objc_msgSend(a1, "valueForEntitlement:", CFSTR("com.apple.private.timezoneupdates.tzd.access"));
  v4 = v3;
  if (v3)
  {
    _bridgeAnyObjectToAny(_:)(v9, v3);
    swift_unknownObjectRelease(v4);
    sub_1000077AC((uint64_t)v9, (uint64_t *)&unk_100025CD0);
    objc_msgSend(a1, "setExportedObject:", v1);
    v5 = objc_msgSend((id)objc_opt_self(NSXPCInterface), "interfaceWithProtocol:", &OBJC_PROTOCOL___TZUpdateProtocol);
    objc_msgSend(a1, "setExportedInterface:", v5);

    sub_10000738C(0, (unint64_t *)&unk_100025C00, OS_dispatch_queue_ptr);
    v6 = (void *)static OS_dispatch_queue.main.getter();
    objc_msgSend(a1, "_setQueue:", v6);

    v7 = &selRef_resume;
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    sub_1000077AC((uint64_t)v9, (uint64_t *)&unk_100025CD0);
    v7 = &selRef_invalidate;
  }
  objc_msgSend(a1, *v7);
  return v4 != 0;
}

BOOL sub_10001851C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD v13[4];
  uint64_t v14[8];
  _QWORD v15[8];
  _OWORD v16[2];
  _OWORD v17[4];
  _OWORD v18[2];

  v0 = sub_100007280(&qword_100025A10);
  __chkstk_darwin(v0);
  v2 = (char *)v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000073C4((uint64_t)v14);
  sub_100018698((uint64_t)v14, (uint64_t)v16);
  if (!*((_QWORD *)&v16[0] + 1))
    return 0;
  v17[2] = v16[0];
  v17[3] = v16[1];
  v18[0] = v17[0];
  *(_OWORD *)((char *)v18 + 10) = *(_OWORD *)((char *)v17 + 10);
  v3 = sub_10000628C();
  v5 = v4;
  sub_1000077E8(v14);
  sub_100006EE0((uint64_t)v15);
  v6 = sub_10000628C();
  v8 = v7;
  sub_100007870(v15);
  v13[2] = v6;
  v13[3] = v8;
  v13[0] = v3;
  v13[1] = v5;
  v9 = type metadata accessor for Locale(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v2, 1, 1, v9);
  v10 = sub_100007768();
  v11 = StringProtocol.compare<A>(_:options:range:locale:)(v13, 64, 0, 0, 1, v2, &type metadata for String, &type metadata for String, v10, v10);
  sub_1000077AC((uint64_t)v2, &qword_100025A10);
  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v5);
  return v11 == -1;
}

uint64_t sub_100018698(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100007280((uint64_t *)&unk_100025FF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1000186E4(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  if ((a3 & 1) != 0)
  {
    static os_log_type_t.debug.getter(a1);
    v6 = sub_100007280(&qword_1000259D8);
    v7 = swift_allocObject(v6, 72, 7);
    *(_OWORD *)(v7 + 16) = xmmword_10001B180;
    if (a2)
    {
      v8 = (_QWORD *)v7;
      *(_QWORD *)(v7 + 56) = &type metadata for String;
      *(_QWORD *)(v7 + 64) = sub_100010248();
      v8[4] = a1;
      v8[5] = a2;
      sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
      v9 = swift_bridgeObjectRetain(a2);
      v10 = static OS_os_log.default.getter(v9);
      v11 = "IDS Message delivered successfully with ID %{public}@";
      v12 = 53;
LABEL_7:
      v18 = (id)v10;
      os_log(_:dso:log:type:_:)(v11, v12, 2, &_mh_execute_header);
      swift_bridgeObjectRelease(v8);

      return;
    }
    __break(1u);
    goto LABEL_9;
  }
  static os_log_type_t.info.getter(a1);
  v14 = sub_100007280(&qword_1000259D8);
  v15 = swift_allocObject(v14, 112, 7);
  *(_OWORD *)(v15 + 16) = xmmword_10001B160;
  if (!a2)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v8 = (_QWORD *)v15;
  *(_QWORD *)(v15 + 56) = &type metadata for String;
  *(_QWORD *)(v15 + 64) = sub_100010248();
  v8[4] = a1;
  v8[5] = a2;
  if (a4)
  {
    swift_bridgeObjectRetain(a2);
    v16 = _convertErrorToNSError(_:)(a4);
    v8[12] = sub_10000738C(0, (unint64_t *)&unk_100025CF0, NSError_ptr);
    v8[13] = sub_10001827C((unint64_t *)&qword_1000259E8, (unint64_t *)&unk_100025CF0, NSError_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
    v8[9] = v16;
    v17 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
    v10 = static OS_os_log.default.getter(v17);
    v11 = "IDS Message delivery failed for ID %{public}@ with error %@";
    v12 = 59;
    goto LABEL_7;
  }
LABEL_10:
  __break(1u);
}

void sub_1000188C8(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  id v13;

  v8 = static os_log_type_t.info.getter(a1);
  v9 = sub_100007280(&qword_1000259D8);
  v10 = swift_allocObject(v9, 152, 7);
  *(_OWORD *)(v10 + 16) = xmmword_10001B150;
  if (!a2)
  {
    __break(1u);
    goto LABEL_6;
  }
  v11 = (_QWORD *)v10;
  *(_QWORD *)(v10 + 56) = sub_10000738C(0, &qword_100026000, IDSProtobuf_ptr);
  v11[8] = sub_10001827C(&qword_100026008, &qword_100026000, IDSProtobuf_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
  v11[4] = a2;
  if (!a4)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v11[12] = &type metadata for String;
  v11[13] = sub_100010248();
  v11[9] = a3;
  v11[10] = a4;
  if (a1)
  {
    v11[17] = sub_10000738C(0, &qword_100025F68, IDSAccount_ptr);
    v11[18] = sub_10001827C((unint64_t *)&unk_100026010, &qword_100025F68, IDSAccount_ptr, (uint64_t)&protocol conformance descriptor for NSObject);
    v11[14] = a1;
    sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
    v12 = a2;
    swift_bridgeObjectRetain(a4);
    v13 = (id)static OS_os_log.default.getter(a1);
    os_log(_:dso:log:type:_:)("Unhandled incoming protobuf %@ fromID: %{public}@ on account %{public}@", 71, 2, &_mh_execute_header, v13, v8, v11);
    swift_bridgeObjectRelease(v11);

    return;
  }
LABEL_7:
  __break(1u);
}

uint64_t sub_100018A6C(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  objc_class *v8;
  Class isa;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD aBlock[5];
  uint64_t v29;

  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v27 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for DispatchQoS(0);
  v25 = *(_QWORD *)(v5 - 8);
  v26 = v5;
  __chkstk_darwin(v5);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (objc_class *)objc_msgSend(a1, "data");
  isa = v8;
  if (v8)
  {
    v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v8);
    v12 = v11;

    sub_100018238(v10, v12);
    isa = Data._bridgeToObjectiveC()().super.isa;
    sub_100016E60(v10, v12);
  }
  else
  {
    v10 = 0;
    v12 = 0xF000000000000000;
  }
  v13 = objc_msgSend(objc_allocWithZone((Class)TZDAssetDetectedMsg), "initWithData:", isa);

  sub_10000738C(0, (unint64_t *)&unk_100025C00, OS_dispatch_queue_ptr);
  v14 = (void *)static OS_dispatch_queue.main.getter();
  v15 = swift_allocObject(&unk_100021518, 24, 7);
  *(_QWORD *)(v15 + 16) = v13;
  aBlock[4] = sub_100018CEC;
  v29 = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100013674;
  aBlock[3] = &unk_100021530;
  v16 = _Block_copy(aBlock);
  v17 = v29;
  v18 = v13;
  v19 = swift_release(v17);
  static DispatchQoS.unspecified.getter(v19);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v20 = sub_10000B0B4();
  v21 = sub_100007280((uint64_t *)&unk_100025C10);
  v22 = sub_10001837C();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v21, v22, v2, v20);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v7, v4, v16);
  _Block_release(v16);

  sub_100018CF4(v10, v12);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v4, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v7, v26);
}

void sub_100018CEC()
{
  uint64_t v0;

  sub_100016448(*(void **)(v0 + 16));
}

uint64_t sub_100018CF4(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_100016E60(result, a2);
  return result;
}

uint64_t sub_100018D08()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_100018D2C(uint64_t a1)
{
  sub_10001682C(a1);
}

uint64_t sub_100018D54(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_100018D64()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100018D88(char a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 16) + 16))(*(_QWORD *)(v1 + 16), a1 & 1);
}

uint64_t sub_100018D9C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100018DC8()
{
  uint64_t v0;

  return sub_100014E58(*(void (**)(uint64_t (*)(), uint64_t))(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_100018DD4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_100018DF8(void *a1)
{
  uint64_t v1;

  sub_1000140B0(a1, *(void **)(v1 + 16));
}

xpc_activity_state_t sub_100018E00(_xpc_activity_s *a1)
{
  uint64_t v1;

  return sub_1000152E0(a1, *(void **)(v1 + 16));
}

uint64_t sub_100018E0C()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

void sub_100018E38()
{
  uint64_t v0;

  sub_100014A28(1, *(_QWORD *)(v0 + 24));
}

uint64_t sub_100018E60()
{
  uint64_t v0;

  return sub_100014854(*(void **)(v0 + 16));
}

uint64_t sub_100018E68()
{
  uint64_t v0;

  return sub_1000146C8(*(void **)(v0 + 16));
}

BOOL sub_100018EE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD v16[4];

  v9 = sub_100007280(&qword_100025A10);
  __chkstk_darwin(v9);
  v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[2] = a4;
  v16[3] = a5;
  v16[0] = a1;
  v16[1] = a2;
  v12 = type metadata accessor for Locale(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  v13 = sub_100007768();
  v14 = StringProtocol.compare<A>(_:options:range:locale:)(v16, 64, 0, 0, 1, v11, &type metadata for String, &type metadata for String, v13, v13);
  sub_1000199B0((uint64_t)v11);
  return v14 == -1;
}

uint64_t sub_100018FD8(char *a1, uint64_t a2, uint64_t (*a3)(BOOL), uint64_t a4, uint64_t a5)
{
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
  uint64_t v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  Swift::Int v35;
  uint64_t v36;
  uint64_t v37;

  v9 = type metadata accessor for TimeZone(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v14 = swift_errorRetain(a2);
    v15 = static os_log_type_t.fault.getter(v14);
    v16 = sub_100007280(&qword_1000259D8);
    v17 = swift_allocObject(v16, 72, 7);
    *(_OWORD *)(v17 + 16) = xmmword_10001B180;
    v18 = _convertErrorToNSError(_:)(a2);
    *(_QWORD *)(v17 + 56) = sub_10000738C(0, (unint64_t *)&unk_100025CF0, NSError_ptr);
    *(_QWORD *)(v17 + 64) = sub_1000194B4();
    *(_QWORD *)(v17 + 32) = v18;
    v19 = sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
    v20 = (void *)static OS_os_log.default.getter(v19);
    os_log(_:dso:log:type:_:)("Unable to fetch time zones from World Clock. Error: %{public}@", 62, 2, &_mh_execute_header, v20, v15, v17);
    swift_bridgeObjectRelease(v17);

    a3(0);
    return swift_errorRelease(a2);
  }
  else
  {
    v22 = static TimeZone.current.getter(v11);
    v23 = TimeZone.identifier.getter(v22);
    v25 = v24;
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    swift_bridgeObjectRetain(a1);
    swift_bridgeObjectRetain(v25);
    if ((swift_isUniquelyReferenced_nonNull_native(a1) & 1) == 0)
      a1 = sub_100008F94(0, *((_QWORD *)a1 + 2) + 1, 1, a1);
    v27 = *((_QWORD *)a1 + 2);
    v26 = *((_QWORD *)a1 + 3);
    if (v27 >= v26 >> 1)
      a1 = sub_100008F94((char *)(v26 > 1), v27 + 1, 1, a1);
    *((_QWORD *)a1 + 2) = v27 + 1;
    v28 = &a1[16 * v27];
    *((_QWORD *)v28 + 4) = v23;
    *((_QWORD *)v28 + 5) = v25;
    v29 = swift_bridgeObjectRelease(v25);
    v30 = static os_log_type_t.debug.getter(v29);
    v31 = sub_100007280(&qword_1000259D8);
    v32 = swift_allocObject(v31, 72, 7);
    *(_OWORD *)(v32 + 16) = xmmword_10001B180;
    *(_QWORD *)(v32 + 56) = sub_100007280(&qword_100025A60);
    *(_QWORD *)(v32 + 64) = sub_1000192E8();
    *(_QWORD *)(v32 + 32) = a1;
    sub_10000738C(0, &qword_1000259D0, OS_os_log_ptr);
    v33 = swift_bridgeObjectRetain(a1);
    v34 = (void *)static OS_os_log.default.getter(v33);
    os_log(_:dso:log:type:_:)("Zones in use: %@", 16, 2, &_mh_execute_header, v34, v30, v32);
    swift_bridgeObjectRelease(v32);

    swift_bridgeObjectRetain(a5);
    v35 = sub_100019334((uint64_t)a1, a5);
    swift_bridgeObjectRelease(a1);
    v36 = *(_QWORD *)(v35 + 16);
    swift_release(v35);
    return a3(v36 != 0);
  }
}

unint64_t sub_1000192E8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100025A68;
  if (!qword_100025A68)
  {
    v1 = sub_10000AEC4(&qword_100025A60);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100025A68);
  }
  return result;
}

Swift::Int sub_100019334(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3;
  char v4;
  unsigned int v5;
  unint64_t v6;
  uint64_t v7;
  size_t v8;
  Swift::Int v9;
  void *v10;
  uint64_t v12;

  v3 = isStackAllocationSafe;
  v4 = *(_BYTE *)(a2 + 32);
  v5 = v4 & 0x3F;
  v6 = (1 << v4) + 63;
  v7 = v6 >> 6;
  v8 = 8 * (v6 >> 6);
  if (v5 <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(8 * (v6 >> 6), 8), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v12 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    v9 = sub_10001950C((unint64_t *)((char *)&v12 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0)), v7, v3, a2);
    swift_release(a2);
  }
  else
  {
    v10 = (void *)swift_slowAlloc(v8, -1);
    bzero(v10, v8);
    v9 = sub_10001950C((unint64_t *)v10, v7, v3, a2);
    swift_release(a2);
    swift_slowDealloc(v10, -1, -1);
  }
  return v9;
}

unint64_t sub_1000194B4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000259E8;
  if (!qword_1000259E8)
  {
    v1 = sub_10000738C(255, (unint64_t *)&unk_100025CF0, NSError_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_1000259E8);
  }
  return result;
}

Swift::Int sub_10001950C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t i;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  Swift::Int v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  BOOL v18;
  Swift::Int result;
  unint64_t v20;
  uint64_t v22;
  unint64_t j;
  unint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[9];
  uint64_t v36;

  v5 = a2;
  v34 = *(_QWORD *)(a3 + 16);
  if (!v34)
  {
    v28 = 0;
    goto LABEL_27;
  }
  v36 = a4 + 56;
  v33 = a3 + 32;
  swift_bridgeObjectRetain(a3);
  v31 = 0;
  for (i = 0; i != v34; ++i)
  {
    v7 = (uint64_t *)(v33 + 16 * i);
    v9 = *v7;
    v8 = v7[1];
    Hasher.init(_seed:)(v35, *(_QWORD *)(a4 + 40));
    swift_bridgeObjectRetain(v8);
    String.hash(into:)(v35, v9, v8);
    v10 = Hasher._finalize()();
    v11 = -1 << *(_BYTE *)(a4 + 32);
    v12 = v10 & ~v11;
    v13 = v12 >> 6;
    v14 = 1 << v12;
    if (((1 << v12) & *(_QWORD *)(v36 + 8 * (v12 >> 6))) == 0)
      goto LABEL_3;
    v15 = *(_QWORD *)(a4 + 48);
    v16 = (_QWORD *)(v15 + 16 * v12);
    v17 = v16[1];
    v18 = *v16 == v9 && v17 == v8;
    if (!v18 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v16, v17, v9, v8, 0) & 1) == 0)
    {
      v22 = ~v11;
      for (j = v12 + 1; ; j = v24 + 1)
      {
        v24 = j & v22;
        if (((*(_QWORD *)(v36 + (((j & v22) >> 3) & 0xFFFFFFFFFFFFF8)) >> (j & v22)) & 1) == 0)
          break;
        v25 = (_QWORD *)(v15 + 16 * v24);
        v26 = v25[1];
        v27 = *v25 == v9 && v26 == v8;
        if (v27 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v25, v26, v9, v8, 0) & 1) != 0)
        {
          result = swift_bridgeObjectRelease(v8);
          v13 = v24 >> 6;
          v14 = 1 << v24;
          goto LABEL_12;
        }
      }
LABEL_3:
      swift_bridgeObjectRelease(v8);
      continue;
    }
    result = swift_bridgeObjectRelease(v8);
LABEL_12:
    v20 = a1[v13];
    a1[v13] = v14 | v20;
    if ((v14 & v20) == 0 && __OFADD__(v31++, 1))
    {
      __break(1u);
      return result;
    }
  }
  swift_bridgeObjectRelease(a3);
  v5 = a2;
  v28 = v31;
LABEL_27:
  swift_retain(a4);
  return sub_10001971C(a1, v5, v28, a4);
}

Swift::Int sub_10001971C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  Swift::Int result;
  _QWORD *v8;
  unint64_t v9;
  uint64_t v10;
  Swift::Int v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v30;
  _QWORD v32[9];

  v4 = a4;
  if (!a3)
  {
    v8 = &_swiftEmptySetSingleton;
LABEL_36:
    swift_release(v4);
    return (Swift::Int)v8;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  sub_100007280(&qword_100025A70);
  result = static _SetStorage.allocate(capacity:)(v5);
  v8 = (_QWORD *)result;
  v30 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    v14 = v10 + 1;
    if (__OFADD__(v10, 1))
      goto LABEL_39;
    if (v14 >= v30)
      goto LABEL_36;
    v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      v10 = v14 + 1;
      if (v14 + 1 >= v30)
        goto LABEL_36;
      v15 = a1[v10];
      if (!v15)
      {
        v10 = v14 + 2;
        if (v14 + 2 >= v30)
          goto LABEL_36;
        v15 = a1[v10];
        if (!v15)
          break;
      }
    }
LABEL_23:
    v9 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v13);
    v18 = *v17;
    v19 = v17[1];
    Hasher.init(_seed:)(v32, v8[5]);
    swift_bridgeObjectRetain(v19);
    String.hash(into:)(v32, v18, v19);
    result = Hasher._finalize()();
    v20 = -1 << *((_BYTE *)v8 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(_QWORD *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = (_QWORD *)(v8[6] + 16 * v23);
    *v28 = v18;
    v28[1] = v19;
    ++v8[2];
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5)
      goto LABEL_36;
  }
  v16 = v14 + 3;
  if (v16 >= v30)
    goto LABEL_36;
  v15 = a1[v16];
  if (v15)
  {
    v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v10 >= v30)
      goto LABEL_36;
    v15 = a1[v10];
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_1000199B0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100007280(&qword_100025A10);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1000199F0()
{
  Swift::String v0;

  v0._countAndFlagsBits = 0x656E6F7A656D6974;
  v0._object = (void *)0xE90000000000002FLL;
  String.append(_:)(v0);
  qword_100026B08 = 0x2F62642F7261762FLL;
  unk_100026B10 = 0xE800000000000000;
}

void sub_100019A58(int a1)
{
  Swift::String v1;

  v1._object = (void *)0x800000010001CD70;
  v1._countAndFlagsBits = 0xD000000000000010;
  sub_100019A80(a1, v1, &qword_100026B18, &qword_100026B20);
}

void sub_100019A80(int a1, Swift::String a2, _QWORD *a3, _QWORD *a4)
{
  String.append(_:)(a2);
  *a3 = 0x6168732F7273752FLL;
  *a4 = 0xEB000000002F6572;
}

void sub_100019AEC(int a1)
{
  Swift::String v1;

  v1._countAndFlagsBits = 7693161;
  v1._object = (void *)0xE300000000000000;
  sub_100019A80(a1, v1, &qword_100026B28, &qword_100026B30);
}

void sub_100019B08()
{
  Swift::String v0;
  uint64_t v1;
  uint64_t v2;

  if (qword_100025848 != -1)
    swift_once(&qword_100025848, sub_100019AEC);
  v1 = qword_100026B28;
  v2 = qword_100026B30;
  swift_bridgeObjectRetain(qword_100026B30);
  v0._object = (void *)0x800000010001CD50;
  v0._countAndFlagsBits = 0xD000000000000010;
  String.append(_:)(v0);
  qword_100026B38 = v1;
  unk_100026B40 = v2;
}

void sub_100019B94()
{
  Swift::String v0;
  uint64_t v1;
  uint64_t v2;

  if (qword_100025838 != -1)
    swift_once(&qword_100025838, sub_1000199F0);
  v1 = qword_100026B08;
  v2 = unk_100026B10;
  swift_bridgeObjectRetain(unk_100026B10);
  v0._countAndFlagsBits = 0x736574616C5F7A74;
  v0._object = (void *)0xE900000000000074;
  String.append(_:)(v0);
  qword_100026B48 = v1;
  unk_100026B50 = v2;
}

void sub_100019C20()
{
  Swift::String v0;
  uint64_t v1;
  uint64_t v2;

  if (qword_100025838 != -1)
    swift_once(&qword_100025838, sub_1000199F0);
  v1 = qword_100026B08;
  v2 = unk_100026B10;
  swift_bridgeObjectRetain(unk_100026B10);
  v0._countAndFlagsBits = 0x6C635F736465656ELL;
  v0._object = (void *)0xED000070756E6165;
  String.append(_:)(v0);
  qword_100026B58 = v1;
  unk_100026B60 = v2;
}

void sub_100019CB4()
{
  Swift::String v0;
  uint64_t v1;
  uint64_t v2;

  if (qword_100025838 != -1)
    swift_once(&qword_100025838, sub_1000199F0);
  v1 = qword_100026B08;
  v2 = unk_100026B10;
  swift_bridgeObjectRetain(unk_100026B10);
  v0._object = (void *)0x800000010001CD90;
  v0._countAndFlagsBits = 0xD000000000000013;
  String.append(_:)(v0);
  qword_100026B68 = v1;
  unk_100026B70 = v2;
}

void sub_100019D40()
{
  Swift::String v0;
  uint64_t v1;
  uint64_t v2;

  if (qword_100025838 != -1)
    swift_once(&qword_100025838, sub_1000199F0);
  v1 = qword_100026B08;
  v2 = unk_100026B10;
  swift_bridgeObjectRetain(unk_100026B10);
  v0._countAndFlagsBits = 0x6F666E69656E6F7ALL;
  v0._object = (void *)0xE800000000000000;
  String.append(_:)(v0);
  qword_100026B78 = v1;
  unk_100026B80 = v2;
}

void sub_100019DC8()
{
  Swift::String v0;
  uint64_t v1;
  uint64_t v2;

  if (qword_100025838 != -1)
    swift_once(&qword_100025838, sub_1000199F0);
  v1 = qword_100026B08;
  v2 = unk_100026B10;
  swift_bridgeObjectRetain(unk_100026B10);
  v0._countAndFlagsBits = 3111540;
  v0._object = (void *)0xE300000000000000;
  String.append(_:)(v0);
  qword_100026B88 = v1;
  unk_100026B90 = v2;
}

uint64_t sub_100019E48()
{
  uint64_t result;
  uint64_t v1;

  result = sub_100019E68();
  qword_100026B98 = result;
  qword_100026BA0 = v1;
  return result;
}

uint64_t sub_100019E68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  v0 = type metadata accessor for URL(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100025850 != -1)
    swift_once(&qword_100025850, sub_100019B08);
  URL.init(fileURLWithPath:)(qword_100026B38, unk_100026B40);
  v4 = String.init(contentsOf:)(v3);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

unint64_t sub_10001A01C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100025D00;
  if (!qword_100025D00)
  {
    v1 = sub_10000738C(255, (unint64_t *)&unk_100025F80, NSObject_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_100025D00);
  }
  return result;
}

void sub_10001A074()
{
  __assert_rtn("-[TZDAssetDetectedMsg writeTo:]", "TZDAssetDetectedMsg.m", 81, "nil != self->_assetVersion");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryRepresentation");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "init");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMemberOfClass:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}
