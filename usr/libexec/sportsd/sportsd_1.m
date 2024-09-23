uint64_t storeEnumTagSinglePayload for SportsMetricsKey(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 44 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 44) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xD4)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xD3)
    return ((uint64_t (*)(void))((char *)&loc_10007BCF8 + 4 * byte_1000A445F[v4]))();
  *a1 = a2 + 44;
  return ((uint64_t (*)(void))((char *)sub_10007BD2C + 4 * byte_1000A445A[v4]))();
}

uint64_t sub_10007BD2C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10007BD34(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10007BD3CLL);
  return result;
}

uint64_t sub_10007BD48(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10007BD50);
  *(_BYTE *)result = a2 + 44;
  return result;
}

uint64_t sub_10007BD54(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10007BD5C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SportsMetricsKey()
{
  return &type metadata for SportsMetricsKey;
}

unint64_t sub_10007BD7C()
{
  unint64_t result;

  result = qword_1000D2F40;
  if (!qword_1000D2F40)
  {
    result = swift_getWitnessTable(&unk_1000A44BC, &type metadata for SportsMetricsKey);
    atomic_store(result, (unint64_t *)&qword_1000D2F40);
  }
  return result;
}

uint64_t sub_10007BDB8()
{
  uint64_t v0;
  uint64_t inited;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v10[152];

  v0 = sub_10000738C(&qword_1000D0848);
  inited = swift_initStackObject(v0, v10);
  *(_OWORD *)(inited + 16) = xmmword_1000A0600;
  *(_BYTE *)(inited + 32) = 22;
  sub_100064B08();
  *(_QWORD *)(inited + 64) = &type metadata for Int;
  *(_QWORD *)(inited + 40) = v2;
  *(_BYTE *)(inited + 72) = 23;
  sub_1000649AC();
  *(_QWORD *)(inited + 104) = &type metadata for String;
  *(_QWORD *)(inited + 80) = v3;
  *(_QWORD *)(inited + 88) = v4;
  *(_BYTE *)(inited + 112) = 24;
  v5 = type metadata accessor for ApiAgentError(0);
  v6 = sub_10007BE98();
  v7 = Error.localizedDescription.getter(v5, v6);
  *(_QWORD *)(inited + 144) = &type metadata for String;
  *(_QWORD *)(inited + 120) = v7;
  *(_QWORD *)(inited + 128) = v8;
  sub_10000738C((uint64_t *)&unk_1000CFF70);
  sub_100021804();
  return Dictionary.init(dictionaryLiteral:)(inited, &type metadata for SportsMetricsKey);
}

unint64_t sub_10007BE98()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000D1670;
  if (!qword_1000D1670)
  {
    v1 = type metadata accessor for ApiAgentError(255);
    result = swift_getWitnessTable(&unk_1000A3138, v1);
    atomic_store(result, (unint64_t *)&qword_1000D1670);
  }
  return result;
}

id sub_10007BF08()
{
  void *v0;
  NSString v1;
  id v2;

  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend(v0, "BOOLForKey:", v1);

  return v2;
}

uint64_t sub_10007BF68()
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
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  uint64_t KeyPath;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v19[15];
  char v20;

  v0 = sub_10000738C(&qword_1000D0E50);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = &v19[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = sub_10000738C(&qword_1000D2FE8);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = &v19[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for ContainerConstants(0);
  v8 = static ContainerConstants.defaultSuiteName.getter();
  v10 = v9;
  v11 = objc_allocWithZone((Class)NSUserDefaults);
  v12 = sub_10004D3C8(v8, v10);
  if (v12)
  {
    v13 = v12;
    KeyPath = swift_getKeyPath(&unk_1000A4588);
    _KeyValueCodingAndObservingPublishing<>.publisher<A>(for:options:)(KeyPath, 5);
    swift_release(KeyPath);
    v15 = sub_10000D358(&qword_1000D2FF8, &qword_1000D2FE8, (uint64_t)&protocol conformance descriptor for NSObject.KeyValueObservingPublisher<A, B>);
    v16 = Publisher.eraseToAnyPublisher()(v4, v15);

    (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {
    v20 = 0;
    Just.init(_:)(&v20);
    v17 = sub_10000D358(&qword_1000D2FF0, &qword_1000D0E50, (uint64_t)&protocol conformance descriptor for Just<A>);
    v16 = Publisher.eraseToAnyPublisher()(v0, v17);
    (*(void (**)(_BYTE *, uint64_t))(v1 + 8))(v3, v0);
  }
  return v16;
}

uint64_t type metadata accessor for InternalSettings()
{
  return objc_opt_self(_TtC7sportsd16InternalSettings);
}

const char *sub_10007C140()
{
  return "filteringEnabled";
}

id sub_10007C14C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, "filteringEnabled");
  *a2 = (_BYTE)result;
  return result;
}

uint64_t storeEnumTagSinglePayload for TVAppFeatureFlags(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_10007C1BC + 4 * byte_1000A45B0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_10007C1DC + 4 * byte_1000A45B5[v4]))();
}

_BYTE *sub_10007C1BC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_10007C1DC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10007C1E4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10007C1EC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10007C1F4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10007C1FC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for TVAppFeatureFlags()
{
  return &type metadata for TVAppFeatureFlags;
}

unint64_t sub_10007C21C()
{
  unint64_t result;

  result = qword_1000D3000;
  if (!qword_1000D3000)
  {
    result = swift_getWitnessTable(&unk_1000A4614, &type metadata for TVAppFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_1000D3000);
  }
  return result;
}

const char *sub_10007C258()
{
  return "TVApp";
}

const char *sub_10007C26C()
{
  return "sports_app_live_activities";
}

void *sub_10007C280(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  unint64_t v23;

  v5 = a1;
  if (a1 >> 62)
    goto LABEL_20;
  v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  for (; v6; v6 = _CocoaArrayWrapper.endIndex.getter(v20))
  {
    v22 = v5;
    v23 = v5 & 0xC000000000000001;
    v7 = 4;
    while (1)
    {
      v8 = v23 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v7 - 4, v5) : *(id *)(v5 + 8 * v7);
      v9 = v7 - 3;
      if (__OFADD__(v7 - 4, 1))
        break;
      v10 = v6;
      v11 = v8;
      v12 = a3;
      v13 = (void *)SportingEventCompetitorContainer.competitor.getter();
      v14 = SportingEventCompetitor.canonicalId.getter();
      v16 = v15;

      a3 = v12;
      v17 = v14 == a2 && v16 == v12;
      if (v17)
      {
        swift_bridgeObjectRelease(v22);
        v19 = v12;
LABEL_18:
        swift_bridgeObjectRelease(v12);
        swift_bridgeObjectRelease(v19);
        return v11;
      }
      v18 = _stringCompareWithSmolCheck(_:_:expecting:)(v14, v16, a2, v12, 0);
      swift_bridgeObjectRelease(v16);
      if ((v18 & 1) != 0)
      {
        v19 = v22;
        goto LABEL_18;
      }

      ++v7;
      v6 = v10;
      v17 = v9 == v10;
      v5 = v22;
      if (v17)
      {
        swift_bridgeObjectRelease(v12);
        swift_bridgeObjectRelease(v22);
        return 0;
      }
    }
    __break(1u);
LABEL_20:
    if (v5 < 0)
      v20 = v5;
    else
      v20 = v5 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v5);
  }
  swift_bridgeObjectRelease(a3);
  swift_bridgeObjectRelease(v5);
  return 0;
}

void *sub_10007C42C(uint64_t (*a1)(id *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  char v12;
  uint64_t v14;
  id v15;

  v4 = v3;
  if ((unint64_t)a3 >> 62)
    goto LABEL_16;
  v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a3);
  for (; v7; v7 = _CocoaArrayWrapper.endIndex.getter(v14))
  {
    v8 = 4;
    while (1)
    {
      v9 = (a3 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v8 - 4, a3)
         : *(id *)(a3 + 8 * v8);
      v10 = v9;
      v11 = v8 - 3;
      if (__OFADD__(v8 - 4, 1))
        break;
      v15 = v9;
      v12 = a1(&v15);
      if (v4)
      {
        swift_bridgeObjectRelease(a3);

        return v10;
      }
      if ((v12 & 1) != 0)
      {
        swift_bridgeObjectRelease(a3);
        return v10;
      }

      ++v8;
      if (v11 == v7)
        goto LABEL_11;
    }
    __break(1u);
LABEL_16:
    if (a3 < 0)
      v14 = a3;
    else
      v14 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
  }
LABEL_11:
  swift_bridgeObjectRelease(a3);
  return 0;
}

uint64_t sub_10007C54C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __n128 v24;
  uint64_t v25;
  uint64_t isUniquelyReferenced_nonNull_native;
  char v27;
  unint64_t v28;
  _QWORD *v29;
  char v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  uint64_t v36;
  _BOOL8 v37;
  Swift::Int v38;
  unint64_t v39;
  char v40;
  Swift::Bool v41;
  unint64_t v42;
  char v43;
  uint64_t v44;
  BOOL v45;
  uint64_t v46;
  void (*v47)(uint64_t, uint64_t);
  unint64_t v48;
  _QWORD *v49;
  _QWORD *v50;
  uint64_t v51;
  unint64_t v52;
  _BYTE *v53;
  uint64_t result;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  unsigned int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD *v74;

  v4 = v3;
  v61 = a2;
  v62 = a1;
  v68 = type metadata accessor for SportingEventCompetitorScoreStatisticType.StatisticName(0);
  v6 = *(_QWORD *)(v68 - 8);
  __chkstk_darwin(v68);
  sub_10007B1E8();
  v73 = v7;
  __chkstk_darwin(v8);
  v10 = (char *)&v55 - v9;
  v59 = *(_QWORD *)(a3 + 16);
  if (v59)
  {
    v60 = a3 + 32;
    v58 = enum case for SportingEventCompetitorScoreStatisticType.StatisticName.shootout(_:);
    v56 = a3;
    sub_100018E34();
    v11 = 0;
    v12 = _swiftEmptyArrayStorage;
    v57 = xmmword_1000A06C0;
    v66 = v10;
    v67 = v6;
    while (1)
    {
      v13 = (uint64_t *)(v60 + 16 * v11);
      v14 = *v13;
      a3 = v13[1];
      v15 = sub_100018E34();
      v16 = dispatch thunk of SportingEventPlay.competitors.getter(v15);
      sub_100018E34();
      v17 = v4;
      v18 = sub_10007C280(v16, v14, a3);
      swift_bridgeObjectRelease(a3);
      sub_1000061E8();
      v71 = v18;
      if (!v18)
        break;
      v64 = v12;
      v65 = v17;
      v63 = v11 + 1;
      v19 = sub_10000738C(&qword_1000D3008);
      v20 = *(_QWORD *)(v6 + 72);
      v21 = *(unsigned __int8 *)(v6 + 80);
      v22 = (v21 + 32) & ~v21;
      v23 = swift_allocObject(v19, v22 + 2 * v20, v21 | 7);
      v24 = (__n128)v57;
      *(_OWORD *)(v23 + 16) = v57;
      v70 = v23;
      v25 = v23 + v22;
      Sport.scoreStatisticName.getter(v24);
      v72 = v20;
      v69 = v25;
      isUniquelyReferenced_nonNull_native = v68;
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v25 + v20, v58, v68);
      v27 = 0;
      v28 = 0;
      v29 = &_swiftEmptyDictionarySingleton;
      do
      {
        v30 = v27;
        if (v28 >= *(_QWORD *)(v70 + 16))
        {
          __break(1u);
LABEL_31:
          __break(1u);
LABEL_32:
          __break(1u);
LABEL_33:
          result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(isUniquelyReferenced_nonNull_native);
          __break(1u);
          return result;
        }
        sub_10007E168((uint64_t)v10, v69 + v28 * v72);
        v31 = dispatch thunk of SportingEventCompetitorContainer.getScoreEntry(name:)(v10);
        if (v31)
        {
          v32 = (void *)v31;
          v33 = SportingEventCompetitorScoreEntry.value.getter(v31);

          sub_10007E168(v73, (uint64_t)v10);
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v29);
          v74 = v29;
          sub_10001519C();
          v36 = v29[2];
          v37 = (v35 & 1) == 0;
          v38 = v36 + v37;
          if (__OFADD__(v36, v37))
            goto LABEL_31;
          v39 = v34;
          v40 = v35;
          sub_10000738C(&qword_1000D3010);
          v41 = _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v38);
          isUniquelyReferenced_nonNull_native = v68;
          if (v41)
          {
            sub_10001519C();
            if ((v40 & 1) != (v43 & 1))
              goto LABEL_33;
            v39 = v42;
          }
          v29 = v74;
          if ((v40 & 1) != 0)
          {
            *(_QWORD *)(v74[7] + 8 * v39) = v33;
          }
          else
          {
            v74[(v39 >> 6) + 8] |= 1 << v39;
            sub_10007E168(v29[6] + v39 * v72, v73);
            *(_QWORD *)(v29[7] + 8 * v39) = v33;
            v44 = v29[2];
            v45 = __OFADD__(v44, 1);
            v46 = v44 + 1;
            if (v45)
              goto LABEL_32;
            v29[2] = v46;
          }
          swift_bridgeObjectRelease(0x8000000000000000);
          v6 = v67;
          v47 = *(void (**)(uint64_t, uint64_t))(v67 + 8);
          v47(v73, isUniquelyReferenced_nonNull_native);
          v10 = v66;
          v47((uint64_t)v66, isUniquelyReferenced_nonNull_native);
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v6 + 8))(v10, isUniquelyReferenced_nonNull_native);
        }
        v27 = 1;
        v28 = 1;
      }
      while ((v30 & 1) == 0);
      swift_setDeallocating(v70);
      sub_10007DE84();
      v12 = v64;
      if ((swift_isUniquelyReferenced_nonNull_native(v64) & 1) == 0)
      {
        sub_10007E19C();
        v12 = v49;
      }
      v48 = v12[2];
      a3 = v48 + 1;
      v4 = v65;
      v11 = v63;
      if (v48 >= v12[3] >> 1)
      {
        sub_10007E19C();
        v12 = v50;
      }
      v12[2] = a3;
      v12[v48 + 4] = v29;

      if (v11 == v59)
      {
        swift_bridgeObjectRelease(v56);
        goto LABEL_26;
      }
    }
    swift_bridgeObjectRelease(v56);
    swift_bridgeObjectRelease(&_swiftEmptyDictionarySingleton);
    goto LABEL_28;
  }
  v12 = _swiftEmptyArrayStorage;
LABEL_26:
  if (v12[2] != 2)
  {
LABEL_28:
    v52 = sub_10007772C();
    sub_100043398((uint64_t)&type metadata for ActivityDataProviderError, v52);
    sub_10007E184(v53, 2);
    sub_100018D80();
    return a3;
  }
  a3 = v12[4];
  v51 = v12[5];
  sub_100018E34();
  swift_bridgeObjectRetain(v51);
  sub_100018D80();
  return a3;
}

uint64_t sub_10007C994(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
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
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  void *v38;
  uint64_t result;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  _BYTE *v44;
  uint64_t v45;
  uint64_t v46;
  __n128 v47;
  uint64_t v48;
  void (*v49)(uint64_t, uint64_t);
  __n128 v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t, uint64_t);
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  int v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void (*v72)(uint64_t, _QWORD, uint64_t);
  char v73;
  uint64_t v74;
  char v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  __n128 v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char v89;
  char v90;
  uint64_t v91;
  char v92;
  char v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  __n128 v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  __n128 v106;
  uint64_t v107;
  void (*v108)(uint64_t, uint64_t);
  char *v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  _QWORD v130[3];
  uint64_t v131;
  uint64_t v132;
  _QWORD v133[3];
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;

  v121 = a2;
  v125 = a1;
  sub_10000738C(&qword_1000D2E78);
  sub_10000A680();
  __chkstk_darwin(v8);
  sub_10007B1E8();
  sub_10007B1D8();
  __chkstk_darwin(v9);
  v11 = (char *)&v107 - v10;
  v122 = type metadata accessor for SportingEventProgressStatus(0);
  v119 = *(_QWORD *)(v122 - 8);
  sub_10000A680();
  __chkstk_darwin(v12);
  sub_10007B1E8();
  v120 = v13;
  __chkstk_darwin(v14);
  v124 = (char *)&v107 - v15;
  sub_10000738C(&qword_1000D3018);
  sub_10000A680();
  __chkstk_darwin(v16);
  sub_10007B1E8();
  sub_10007B1D8();
  __chkstk_darwin(v17);
  v18 = sub_10007E154();
  v123 = type metadata accessor for SportingEventCompetitorWinOutcome(v18);
  v116 = *(_QWORD *)(v123 - 8);
  sub_10000A680();
  __chkstk_darwin(v19);
  sub_10007B1E8();
  sub_10007B1D8();
  __chkstk_darwin(v20);
  sub_10007B1D8();
  __chkstk_darwin(v21);
  v118 = (uint64_t)&v107 - v22;
  v23 = type metadata accessor for SportingEventCompetitorScoreStatisticType.StatisticName(0);
  v126 = *(_QWORD *)(v23 - 8);
  v127 = v23;
  sub_10000A680();
  __chkstk_darwin(v24);
  sub_10007B1E8();
  sub_10007B1D8();
  __chkstk_darwin(v25);
  v26 = sub_10007E140();
  v136 = type metadata accessor for Sport(v26);
  v129 = *(_QWORD *)(v136 - 8);
  sub_10000A680();
  __chkstk_darwin(v27);
  v29 = (char *)&v107 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = a4[3];
  v30 = a4[4];
  sub_1000073CC(a4, v31);
  v32 = (*(uint64_t (**)(uint64_t, uint64_t))(v30 + 32))(v31, v30);
  v33 = *(_QWORD *)(v32 + 16);
  v34 = swift_bridgeObjectRelease(v32);
  if (v33 != 2)
  {
    v43 = sub_10007772C();
    sub_100043398((uint64_t)&type metadata for ActivityDataProviderError, v43);
    return sub_10007E184(v44, 1);
  }
  v111 = v11;
  v35 = SportingEventSubscription.sport.getter(v34);
  v36 = v29;
  v37 = Sport.init(rawValue:)(v35);
  v38 = (void *)SportingEventSubscription.sportingEventDetails.getter(v37);
  result = sub_10007E078();
  if (!*(_QWORD *)(result + 16))
  {
    __break(1u);
    goto LABEL_35;
  }
  sub_10000AE14(result + 32, (uint64_t)v133);
  sub_1000061E8();
  result = sub_10007E078();
  if (*(_QWORD *)(result + 16) < 2uLL)
  {
LABEL_35:
    __break(1u);
    return result;
  }
  sub_10000AE14(result + 72, (uint64_t)v130);
  sub_1000061E8();
  v40 = v128;
  v41 = sub_10007D598(a3, a4);
  if (!v40)
  {
    v45 = v41;
    v46 = v42;
    v47 = swift_bridgeObjectRetain(v41);
    Sport.scoreStatisticName.getter(v47);
    sub_10007E124(v4);
    v128 = v45;
    sub_100018DAC();
    v48 = v127;
    v49 = *(void (**)(uint64_t, uint64_t))(v126 + 8);
    v49(v4, v127);
    v50 = swift_bridgeObjectRetain(v46);
    Sport.scoreStatisticName.getter(v50);
    sub_10007572C(v4, v46);
    v110 = v46;
    swift_bridgeObjectRelease(v46);
    v108 = v49;
    v51 = ((uint64_t (*)(uint64_t, uint64_t))v49)(v4, v48);
    v52 = dispatch thunk of SportingEvent.competitors.getter(v51);
    __chkstk_darwin(v52);
    *(&v107 - 2) = (uint64_t)v133;
    v53 = sub_10007E190((uint64_t (*)(id *))sub_10007E038, (uint64_t)(&v107 - 4));
    v54 = sub_100018DAC();
    v109 = v36;
    if (v53)
    {
      dispatch thunk of SportingEventCompetitorContainer.winOutcome.getter(v54);

      v55 = v123;
      v56 = sub_100009658(v5, 1, v123);
      v57 = (uint64_t)v124;
      if (v56 == 1)
      {
        v58 = v5;
        v59 = v122;
      }
      else
      {
        v60 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v116 + 32);
        v61 = v60(v118, v5, v55);
        v62 = dispatch thunk of SportingEvent.competitors.getter(v61);
        __chkstk_darwin(v62);
        *(&v107 - 2) = (uint64_t)v130;
        v63 = sub_10007E190((uint64_t (*)(id *))sub_10007E01C, (uint64_t)(&v107 - 4));
        v64 = sub_100018DAC();
        if (v63)
        {
          v58 = v114;
          dispatch thunk of SportingEventCompetitorContainer.winOutcome.getter(v64);

          v65 = sub_100009658(v58, 1, v55);
          v59 = v122;
          if (v65 != 1)
          {
            v66 = v112;
            v60(v112, v58, v55);
            v67 = v113;
            sub_10007E0F4();
            v68 = sub_1000563E0(v118, v67);
            sub_10007E0CC(v67);
            sub_10007E0F4();
            LOBYTE(v69) = sub_1000563E0(v66, v67);
            sub_10007E0CC(v67);
            sub_10007E0CC(v66);
            sub_10007E0CC(v118);
            goto LABEL_22;
          }
        }
        else
        {
          v58 = v114;
          sub_10000964C(v114, 1, 1, v55);
          v59 = v122;
        }
        (*(void (**)(uint64_t, uint64_t))(v116 + 8))(v118, v55);
      }
    }
    else
    {
      sub_10000964C(v5, 1, 1, v123);
      v58 = v5;
      v59 = v122;
      v57 = (uint64_t)v124;
    }
    v70 = sub_100027964(v58, &qword_1000D3018);
    SportingEvent.progressStatus.getter(v70);
    v71 = v120;
    v72 = *(void (**)(uint64_t, _QWORD, uint64_t))(v119 + 104);
    v72(v120, enum case for SportingEventProgressStatus.final(_:), v59);
    v73 = sub_100056318(v57, v71);
    sub_10007E0D4(v71);
    v74 = sub_10007E0D4(v57);
    if ((v73 & 1) != 0
      || (SportingEvent.progressStatus.getter(v74),
          v72(v71, enum case for SportingEventProgressStatus.forfeit(_:), v59),
          v75 = sub_100056318(v57, v71),
          sub_10007E0D4(v71),
          v74 = sub_10007E0D4(v57),
          (v75 & 1) != 0))
    {
      v76 = (void *)SportingEvent.clock.getter(v74);
      v77 = (void *)SportingEventCurrentClock.current.getter();

      v78 = (void *)SportingEventClock.period.getter();
      dispatch thunk of SportingEventClockPeriod.type.getter();

      type metadata accessor for SportingEventClockPeriodType(0);
      v79 = sub_10007E170();
      v82 = sub_100009658(v79, v80, v81);
      v84 = v109;
      if (v82 != 1)
      {
        v85 = v115;
        sub_10007DFD4((uint64_t)v111, v115);
        v86 = *((_QWORD *)v77 - 1);
        if ((*(unsigned int (**)(uint64_t, void *))(v86 + 88))(v85, v77) == enum case for SportingEventClockPeriodType.shootouts(_:))
        {
          v87 = v117;
          (*(void (**)(uint64_t, _QWORD, uint64_t))(v126 + 104))(v117, enum case for SportingEventCompetitorScoreStatisticType.StatisticName.shootout(_:), v127);
LABEL_25:
          sub_100027964((uint64_t)v111, &qword_1000D2E78);
          swift_bridgeObjectRetain(v128);
          v88 = sub_10007E124(v87);
          v90 = v89;
          sub_100018DAC();
          if ((v90 & 1) != 0)
            v91 = 0;
          else
            v91 = v88;
          sub_10007E114();
          v69 = sub_10007E124(v87);
          v93 = v92;
          sub_100018DAC();
          v108(v87, v127);
          if ((v93 & 1) != 0)
          {
            v68 = v91 > 0;
            v69 = (unint64_t)v91 >> 63;
          }
          else
          {
            v68 = v69 < v91;
            LOBYTE(v69) = v91 < v69;
          }
          goto LABEL_31;
        }
        (*(void (**)(uint64_t, void *))(v86 + 8))(v85, v77);
      }
      v87 = v117;
      Sport.scoreStatisticName.getter(v83);
      goto LABEL_25;
    }
    LOBYTE(v69) = 0;
    v68 = 0;
LABEL_22:
    v84 = v109;
LABEL_31:
    v94 = v134;
    v95 = v135;
    sub_1000073CC(v133, v134);
    v96 = (*(uint64_t (**)(uint64_t, uint64_t))(v95 + 8))(v94, v95);
    v98 = v97;
    v99 = v128;
    v100 = swift_bridgeObjectRetain(v128);
    SportsActivityContender.init(canonicalId:scoreEntries:isWinnerIndicatorVisible:)(v96, v98, v99, v68 & 1, v100);
    v101 = v131;
    v102 = v132;
    sub_1000073CC(v130, v131);
    v103 = (*(uint64_t (**)(uint64_t, uint64_t))(v102 + 8))(v101, v102);
    v105 = v104;
    sub_10007E114();
    SportsActivityContender.init(canonicalId:scoreEntries:isWinnerIndicatorVisible:)(v103, v105, v101, v69 & 1, v106);
    sub_100018DAC();
    sub_100018D80();

    (*(void (**)(char *, uint64_t))(v129 + 8))(v84, v136);
    goto LABEL_32;
  }
  (*(void (**)(char *, uint64_t))(v129 + 8))(v36, v136);

LABEL_32:
  sub_100007618(v130);
  return sub_100007618(v133);
}

uint64_t sub_10007D23C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
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
  char *v29;
  char v30;
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
  void (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t, uint64_t);
  _QWORD v55[2];
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  Swift::String v60;

  v55[1] = a3;
  sub_10000738C((uint64_t *)&unk_1000D16E0);
  sub_10000A680();
  __chkstk_darwin(v9);
  sub_10007E104();
  v12 = v10 - v11;
  __chkstk_darwin(v13);
  v14 = sub_10007E140();
  v15 = type metadata accessor for URLQueryItem(v14);
  v58 = *(_QWORD *)(v15 - 8);
  v59 = v15;
  sub_10000A680();
  __chkstk_darwin(v16);
  sub_10007E104();
  v19 = v17 - v18;
  __chkstk_darwin(v20);
  v21 = sub_10007E154();
  v22 = type metadata accessor for URLComponents(v21);
  v56 = *(_QWORD *)(v22 - 8);
  v57 = v22;
  sub_10000A680();
  __chkstk_darwin(v23);
  sub_10007E104();
  v26 = v24 - v25;
  __chkstk_darwin(v27);
  v29 = (char *)v55 - v28;
  swift_bridgeObjectRetain(a2);
  v60._countAndFlagsBits = a1;
  v60._object = a2;
  sub_100044898(v60);
  if (v30 == 2)
  {
    URLComponents.init()();
    v41 = sub_10007E0DC();
    URLComponents.scheme.setter(v41, v42 & 0xFFFF0000FFFFLL | 0xEC000000326B0000);
    sub_10007E0A4();
    swift_bridgeObjectRetain(a4);
    sub_10007E050();
    swift_bridgeObjectRelease();
    v43 = sub_10000738C(&qword_1000D0518);
    v44 = v58;
    v45 = sub_10007E0B8(v43, *(_QWORD *)(v58 + 72));
    *(_OWORD *)(v45 + 16) = xmmword_10009FDB0;
    v46 = v59;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 16))(v45 + v26, v19, v59);
    v47 = URLComponents.queryItems.setter(v45);
    URLComponents.url.getter(v47);
    type metadata accessor for URL(0);
    v48 = sub_10007E170();
    v51 = sub_100009658(v48, v49, v50);
    if ((_DWORD)v51 == 1)
    {
      sub_100027964(v12, (uint64_t *)&unk_1000D16E0);
      v40 = 0;
    }
    else
    {
      v40 = v12;
      URL.absoluteString.getter(v51);
      sub_10007E12C();
      v53(v12, v45);
    }
    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v19, v46);
    (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v26, v57);
  }
  else if (v30 == 1)
  {
    URLComponents.init()();
    v31 = sub_10007E0DC();
    URLComponents.scheme.setter(v31, v32 & 0xFFFF0000FFFFLL | 0xEB000000006B0000);
    sub_10007E0A4();
    swift_bridgeObjectRetain(a4);
    sub_10007E050();
    swift_bridgeObjectRelease();
    v33 = sub_10000738C(&qword_1000D0518);
    v34 = v58;
    v35 = sub_10007E0B8(v33, *(_QWORD *)(v58 + 72));
    *(_OWORD *)(v35 + 16) = xmmword_10009FDB0;
    v36 = v59;
    (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(&v29[v35], v5, v59);
    v37 = URLComponents.queryItems.setter(v35);
    URLComponents.url.getter(v37);
    v38 = type metadata accessor for URL(0);
    v39 = sub_100009658(v4, 1, v38);
    if ((_DWORD)v39 == 1)
    {
      sub_100027964(v4, (uint64_t *)&unk_1000D16E0);
      v40 = 0;
    }
    else
    {
      v40 = v4;
      URL.absoluteString.getter(v39);
      sub_10007E12C();
      v52(v4, v38);
    }
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v5, v36);
    (*(void (**)(char *, uint64_t))(v56 + 8))(v29, v57);
  }
  else
  {
    return SportingEventSubscription.Metadata.eventURL.getter();
  }
  return v40;
}

uint64_t sub_10007D598(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v63;
  char v64;
  uint64_t v65;
  _BOOL8 v66;
  Swift::Int v67;
  unint64_t v68;
  char v69;
  Swift::Bool v70;
  unint64_t v71;
  char v72;
  _QWORD *v73;
  uint64_t v74;
  BOOL v75;
  uint64_t v76;
  void (*v77)(char *, uint64_t);
  uint64_t v78;
  _QWORD *v79;
  char v80;
  unint64_t v81;
  _QWORD *v82;
  _QWORD *v83;
  _QWORD *v84;
  unint64_t v85;
  uint64_t v86;
  _BYTE *v87;
  uint64_t v88;
  uint64_t v89;
  void (*v90)(char *, uint64_t, __n128);
  __n128 v91;
  uint64_t result;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  __int128 v97;
  unsigned int v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  unint64_t v102;
  _QWORD *v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  _QWORD *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  void (*v115)(char *, unint64_t, uint64_t);
  int v116;
  void *v117;
  char *v118;
  _QWORD v119[3];
  uint64_t v120;
  uint64_t v121;
  _QWORD *v122;

  v113 = type metadata accessor for SportingEventCompetitorScoreStatisticType.StatisticName(0);
  v108 = *(_QWORD *)(v113 - 8);
  __chkstk_darwin(v113);
  v105 = (char *)&v93 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v118 = (char *)&v93 - v7;
  v95 = type metadata accessor for Sport(0);
  v94 = *(_QWORD *)(v95 - 8);
  __chkstk_darwin(v95);
  v9 = (char *)&v93 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a2[3];
  v11 = a2[4];
  sub_1000073CC(a2, v10);
  v12 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 32);
  v13 = v12(v10, v11);
  v14 = *(_QWORD *)(v13 + 16);
  v15 = swift_bridgeObjectRelease(v13);
  if (v14 != 2)
  {
    v85 = sub_10007772C();
    v86 = swift_allocError(&type metadata for ActivityDataProviderError, v85, 0, 0);
    *v87 = 1;
    swift_willThrow(v86);
    return v10;
  }
  v107 = a1;
  v16 = SportingEventSubscription.sport.getter(v15);
  v101 = v9;
  Sport.init(rawValue:)(v16);
  v17 = v12(v10, v11);
  v100 = *(_QWORD *)(v17 + 16);
  if (v100)
  {
    v18 = 0;
    v99 = v17 + 32;
    v98 = enum case for SportingEventCompetitorScoreStatisticType.StatisticName.shootout(_:);
    v19 = _swiftEmptyArrayStorage;
    v97 = xmmword_1000A06C0;
    v20 = v113;
    v21 = v108;
    v106 = v2;
    v96 = v17;
    while (1)
    {
      if (v18 >= *(_QWORD *)(v17 + 16))
      {
LABEL_66:
        __break(1u);
        goto LABEL_67;
      }
      v103 = v19;
      v102 = v18 + 1;
      sub_10000AE14(v99 + 40 * v18, (uint64_t)v119);
      v22 = sub_10000738C(&qword_1000D3008);
      v23 = *(_QWORD *)(v21 + 72);
      v24 = *(unsigned __int8 *)(v21 + 80);
      v25 = (v24 + 32) & ~v24;
      v26 = swift_allocObject(v22, v25 + 2 * v23, v24 | 7);
      *(_OWORD *)(v26 + 16) = v97;
      v111 = v26;
      v27 = v26 + v25;
      Sport.scoreStatisticName.getter();
      v112 = v23;
      v109 = v27;
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v21 + 104))(v27 + v23, v98, v20);
      v28 = 0;
      v29 = 0;
      v110 = &_swiftEmptyDictionarySingleton;
      do
      {
        if (v29 >= *(_QWORD *)(v111 + 16))
        {
          __break(1u);
          goto LABEL_63;
        }
        v116 = v28;
        v115 = *(void (**)(char *, unint64_t, uint64_t))(v21 + 16);
        v115(v118, v109 + v29 * v112, v20);
        v30 = v120;
        v31 = v121;
        sub_1000073CC(v119, v120);
        v32 = (*(uint64_t (**)(uint64_t, uint64_t))(v31 + 8))(v30, v31);
        v34 = v33;
        v35 = SportingEventSubscription.sportingEventDetails.getter(v32);
        v36 = dispatch thunk of SportingEvent.competitors.getter(v35);
        v37 = v36;
        v117 = (void *)v35;
        if ((unint64_t)v36 >> 62)
        {
          if (v36 < 0)
            v78 = v36;
          else
            v78 = v36 & 0xFFFFFFFFFFFFFF8;
          swift_bridgeObjectRetain(v36);
          v38 = _CocoaArrayWrapper.endIndex.getter(v78);
          if (!v38)
            goto LABEL_29;
        }
        else
        {
          v38 = *(_QWORD *)((v36 & 0xFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain(v36);
          if (!v38)
            goto LABEL_29;
        }
        v114 = v37 & 0xC000000000000001;
        if ((v37 & 0xC000000000000001) != 0)
          v39 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v37);
        else
          v39 = *(id *)(v37 + 32);
        v40 = v39;
        v41 = (void *)SportingEventCompetitorContainer.competitor.getter(v39);
        v42 = SportingEventCompetitor.canonicalId.getter();
        v44 = v43;

        if (v42 == v32 && v44 == v34)
        {
LABEL_30:
          v48 = v117;
          swift_bridgeObjectRelease(v37);
          v47 = v34;
          v20 = v113;
        }
        else
        {
          v46 = _stringCompareWithSmolCheck(_:_:expecting:)(v42, v44, v32, v34, 0);
          swift_bridgeObjectRelease(v44);
          if ((v46 & 1) == 0)
          {

            if (v38 != 1)
            {
              v49 = 5;
              v104 = v38;
              while (1)
              {
                v50 = v114
                    ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v49 - 4, v37)
                    : *(id *)(v37 + 8 * v49);
                v40 = v50;
                v51 = v49 - 3;
                if (__OFADD__(v49 - 4, 1))
                  break;
                v52 = (void *)SportingEventCompetitorContainer.competitor.getter(v50);
                v53 = SportingEventCompetitor.canonicalId.getter();
                v55 = v54;

                if (v53 == v32 && v55 == v34)
                  goto LABEL_30;
                v57 = _stringCompareWithSmolCheck(_:_:expecting:)(v53, v55, v32, v34, 0);
                swift_bridgeObjectRelease(v55);
                if ((v57 & 1) != 0)
                  goto LABEL_16;

                ++v49;
                if (v51 == v104)
                  goto LABEL_29;
              }
LABEL_63:
              __break(1u);
LABEL_64:
              __break(1u);
LABEL_65:
              __break(1u);
              goto LABEL_66;
            }
LABEL_29:
            swift_bridgeObjectRelease_n(v37, 2);
            v20 = v113;
            v48 = v117;
LABEL_38:
            swift_bridgeObjectRelease(v34);

            v21 = v108;
            (*(void (**)(char *, uint64_t))(v108 + 8))(v118, v20);
            goto LABEL_42;
          }
LABEL_16:
          v47 = v37;
          v20 = v113;
          v48 = v117;
        }
        swift_bridgeObjectRelease(v37);
        swift_bridgeObjectRelease(v47);
        v58 = (void *)dispatch thunk of SportingEventCompetitorContainer.getScoreEntry(name:)(v118);

        if (!v58)
          goto LABEL_38;
        v60 = SportingEventCompetitorScoreEntry.value.getter(v59);
        swift_bridgeObjectRelease(v34);

        v115(v105, (unint64_t)v118, v20);
        v61 = v110;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v110);
        v122 = v61;
        sub_10001519C();
        v65 = v61[2];
        v66 = (v64 & 1) == 0;
        v67 = v65 + v66;
        if (__OFADD__(v65, v66))
          goto LABEL_64;
        v68 = v63;
        v69 = v64;
        sub_10000738C(&qword_1000D3010);
        v70 = _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v67);
        v21 = v108;
        if (v70)
        {
          sub_10001519C();
          if ((v69 & 1) != (v72 & 1))
            goto LABEL_69;
          v68 = v71;
        }
        v110 = v122;
        if ((v69 & 1) != 0)
        {
          *(_QWORD *)(v122[7] + 8 * v68) = v60;
          v20 = v113;
        }
        else
        {
          v122[(v68 >> 6) + 8] |= 1 << v68;
          v20 = v113;
          v115((char *)(v110[6] + v68 * v112), (unint64_t)v105, v113);
          v73 = v110;
          *(_QWORD *)(v110[7] + 8 * v68) = v60;
          v74 = v73[2];
          v75 = __OFADD__(v74, 1);
          v76 = v74 + 1;
          if (v75)
            goto LABEL_65;
          v73[2] = v76;
        }
        swift_bridgeObjectRelease(0x8000000000000000);
        v77 = *(void (**)(char *, uint64_t))(v21 + 8);
        v77(v105, v20);
        v77(v118, v20);
LABEL_42:
        v28 = 1;
        v29 = 1;
      }
      while ((v116 & 1) == 0);
      swift_setDeallocating(v111);
      sub_10007DE84();
      v79 = v103;
      v80 = swift_isUniquelyReferenced_nonNull_native(v103);
      if ((v80 & 1) == 0)
      {
        sub_1000138DC();
        v79 = v83;
      }
      v81 = v79[2];
      v19 = v79;
      v82 = v110;
      if (v81 >= v79[3] >> 1)
      {
        sub_1000138DC();
        v82 = v110;
        v19 = v84;
      }
      v19[2] = v81 + 1;
      v19[v81 + 4] = v82;
      sub_100007618(v119);
      v18 = v102;
      v17 = v96;
      if (v102 == v100)
      {
        swift_bridgeObjectRelease(v96);
        goto LABEL_58;
      }
    }
  }
  swift_bridgeObjectRelease(v17);
  v19 = _swiftEmptyArrayStorage;
LABEL_58:
  v88 = v19[2];
  if (v88)
  {
    if (v88 != 1)
    {
      v10 = v19[4];
      v89 = v19[5];
      v90 = *(void (**)(char *, uint64_t, __n128))(v94 + 8);
      swift_bridgeObjectRetain(v10);
      v91 = swift_bridgeObjectRetain(v89);
      v90(v101, v95, v91);
      swift_bridgeObjectRelease(v19);
      return v10;
    }
  }
  else
  {
LABEL_67:
    __break(1u);
  }
  __break(1u);
LABEL_69:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v113);
  __break(1u);
  return result;
}

uint64_t sub_10007DD44(uint64_t a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;

  v3 = (void *)SportingEventCompetitorContainer.competitor.getter(a1);
  v4 = SportingEventCompetitor.canonicalId.getter();
  v6 = v5;

  v7 = a2[3];
  v8 = a2[4];
  sub_1000073CC(a2, v7);
  v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v7, v8);
  if (v4 == v9 && v6 == v10)
    v12 = 1;
  else
    v12 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v6, v9, v10, 0);
  sub_100018DAC();
  sub_1000061E8();
  return v12 & 1;
}

uint64_t sub_10007DE04()
{
  uint64_t v0;

  swift_arrayDestroy(v0 + 32, *(_QWORD *)(v0 + 16));
  return swift_deallocClassInstance(v0, 32, 7);
}

uint64_t sub_10007DE34()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  sub_10000738C(&qword_1000D3020);
  swift_arrayDestroy(v0 + 32, v1);
  return swift_deallocClassInstance(v0, 32, 7);
}

uint64_t sub_10007DE84()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SportingEventCompetitorScoreStatisticType.StatisticName(0)
                                      - 8)
                          + 80);
  swift_arrayDestroy(v0 + ((v1 + 32) & ~v1), *(_QWORD *)(v0 + 16));
  return swift_deallocClassInstance(v0, 32, 7);
}

unint64_t sub_10007DECC(unint64_t result, char a2, uint64_t a3)
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

void sub_10007DEF0(_QWORD *a1, unint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  uint64_t v7;

  v6 = malloc(0x28uLL);
  *a1 = v6;
  sub_10007DF68(v6, a2, a3);
  v6[4] = v7;
  sub_10001860C();
}

void sub_10007DF3C(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void sub_10007DF68(_QWORD *a1, unint64_t a2, uint64_t a3)
{
  unint64_t v6;
  id v7;

  v6 = a3 & 0xC000000000000001;
  sub_10007DECC(a2, (a3 & 0xC000000000000001) == 0, a3);
  if (v6)
    v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(a2, a3);
  else
    v7 = *(id *)(a3 + 8 * a2 + 32);
  *a1 = v7;
  sub_10001860C();
}

void sub_10007DFCC(id *a1)
{

}

uint64_t sub_10007DFD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000738C(&qword_1000D2E78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10007E01C(uint64_t a1)
{
  uint64_t v1;

  return sub_10007DD44(a1, *(_QWORD **)(v1 + 16)) & 1;
}

uint64_t sub_10007E038(uint64_t a1)
{
  return sub_10007E01C(a1) & 1;
}

uint64_t sub_10007E050()
{
  uint64_t v0;
  uint64_t v1;

  return URLQueryItem.init(name:value:)(0x6163696E6F6E6163, 0xEB0000000064696CLL, *(_QWORD *)(v1 - 120), v0);
}

uint64_t sub_10007E078()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[3];
  v2 = v0[4];
  sub_1000073CC(v0, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 32))(v1, v2);
}

uint64_t sub_10007E0A4()
{
  return URLComponents.host.setter(0x746E657665, 0xE500000000000000);
}

uint64_t sub_10007E0B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return swift_allocObject(a1, ((v2 + 32) & ~v2) + a2, v2 | 7);
}

uint64_t sub_10007E0CC(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t sub_10007E0D4(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t sub_10007E0DC()
{
  return 0x68737374726F7073;
}

uint64_t sub_10007E0F4()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(v3, v0, v2);
}

uint64_t sub_10007E114()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(*(_QWORD *)(v0 - 328));
}

uint64_t sub_10007E124(uint64_t a1)
{
  uint64_t v1;

  return sub_10007572C(a1, v1);
}

uint64_t sub_10007E140()
{
  return 0;
}

uint64_t sub_10007E154()
{
  return 0;
}

uint64_t sub_10007E168(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t sub_10007E170()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_10007E184@<X0>(_BYTE *a1@<X1>, char a2@<W8>)
{
  *a1 = a2;
  return swift_willThrow();
}

void *sub_10007E190(uint64_t (*a1)(id *), uint64_t a2)
{
  uint64_t v2;

  return sub_10007C42C(a1, a2, v2);
}

void sub_10007E19C()
{
  sub_1000138DC();
}

_QWORD *sub_10007E1A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    sub_100015688();
    v3 = *(_QWORD *)(type metadata accessor for SportsActivityManagedContext(0) - 8);
    v4 = *(_QWORD *)(v3 + 72);
    v5 = (_QWORD *)(((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80)) + a1 + 8);
    do
    {
      v7 = *(v5 - 1);
      v6 = *v5;
      v9 = _swiftEmptyArrayStorage[2];
      v8 = _swiftEmptyArrayStorage[3];
      swift_bridgeObjectRetain(*v5);
      if (v9 >= v8 >> 1)
        sub_100015688();
      v5 = (_QWORD *)((char *)v5 + v4);
      _swiftEmptyArrayStorage[2] = v9 + 1;
      v10 = &_swiftEmptyArrayStorage[2 * v9];
      v10[4] = v7;
      v10[5] = v6;
      --v1;
    }
    while (v1);
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_10007E29C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, __int128 *a4@<X3>, uint64_t a5@<X4>, __int128 *a6@<X5>, uint64_t a7@<X8>, double a8@<D0>)
{
  uint64_t *v8;
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
  objc_class *v30;
  id v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t result;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[5];

  v16 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v42 = *(_QWORD *)(v16 - 8);
  v43 = v16;
  sub_10000A680();
  __chkstk_darwin(v17);
  sub_10000A7D4();
  v20 = v19 - v18;
  v21 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  sub_10000A680();
  __chkstk_darwin(v22);
  sub_10000A7D4();
  v25 = v24 - v23;
  type metadata accessor for DispatchQoS(0);
  sub_10000A680();
  __chkstk_darwin(v26);
  sub_10000A6E4();
  *(_QWORD *)a7 = a1;
  *(_QWORD *)(a7 + 8) = a2;
  *(_QWORD *)(a7 + 16) = a3;
  sub_10007E524(a4, (_OWORD *)(a7 + 24));
  *(_QWORD *)(a7 + 72) = a5;
  sub_100009DDC(a6, a7 + 80);
  sub_10005F450();
  static DispatchQoS.unspecified.getter();
  v44[0] = _swiftEmptyArrayStorage;
  v27 = sub_1000803D8(&qword_1000D3028, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  v28 = sub_10000738C(&qword_1000D3030);
  v29 = sub_100080684(&qword_1000D3038, &qword_1000D3030);
  dispatch thunk of SetAlgebra.init<A>(_:)(v44, v28, v29, v21, v27);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v42 + 104))(v20, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v43);
  *(_QWORD *)(a7 + 120) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD00000000000002CLL, 0x80000001000A7D00, v8, v25, v20, 0);
  *(double *)(a7 + 128) = a8;
  v30 = (objc_class *)type metadata accessor for ActivityAuthorization(0);
  v31 = objc_msgSend(objc_allocWithZone(v30), "init");
  v32 = sub_100043DEC();
  v34 = v33;
  v44[3] = v30;
  v44[4] = &off_1000C5188;
  v44[0] = v31;
  v35 = type metadata accessor for ActivityCapUtility();
  v36 = (_QWORD *)sub_10000A748(v35, 72);
  v37 = sub_10000AE58((uint64_t)v44, (uint64_t)v30);
  __chkstk_darwin(v37);
  sub_10000A6E4();
  (*(void (**)(uint64_t *))(v38 + 16))(v8);
  v39 = *v8;
  v36[5] = v30;
  v36[6] = &off_1000C5188;
  v36[2] = v39;
  v36[7] = v32;
  v36[8] = v34;
  result = sub_100007618(v44);
  *(_QWORD *)(a7 + 136) = v36;
  return result;
}

_OWORD *sub_10007E524(__int128 *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[2];
  a2[1] = a1[1];
  a2[2] = v3;
  *a2 = v2;
  return a2;
}

uint64_t destroy for SubscriptionRefreshStaleActivitiesOperation(uint64_t a1)
{
  swift_release(*(_QWORD *)(a1 + 8));
  swift_release(*(_QWORD *)(a1 + 16));
  sub_100007618((_QWORD *)(a1 + 24));
  swift_release(*(_QWORD *)(a1 + 72));
  sub_100007618((_QWORD *)(a1 + 80));

  return swift_release(*(_QWORD *)(a1 + 136));
}

uint64_t initializeWithCopy for SubscriptionRefreshStaleActivitiesOperation(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v5;
  v6 = a2 + 24;
  v7 = *(_QWORD *)(a2 + 64);
  v8 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 48) = v8;
  *(_QWORD *)(a1 + 64) = v7;
  v9 = v8;
  v10 = **(void (***)(uint64_t, uint64_t, uint64_t))(v8 - 8);
  swift_retain(v4);
  swift_retain(v5);
  v10(a1 + 24, v6, v9);
  v11 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 72) = v11;
  v12 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 104) = v12;
  v13 = v12;
  v14 = **(void (***)(uint64_t, uint64_t, uint64_t))(v12 - 8);
  swift_retain(v11);
  v14(a1 + 80, a2 + 80, v13);
  v15 = *(void **)(a2 + 120);
  v16 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 120) = v15;
  *(_QWORD *)(a1 + 128) = v16;
  v17 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 136) = v17;
  v18 = v15;
  swift_retain(v17);
  return a1;
}

_QWORD *assignWithCopy for SubscriptionRefreshStaleActivitiesOperation(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a2[1];
  v5 = a1[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain(v4);
  swift_release(v5);
  v6 = a2[2];
  v7 = a1[2];
  a1[2] = v6;
  swift_retain(v6);
  swift_release(v7);
  sub_10007E72C(a1 + 3, a2 + 3);
  v8 = a2[9];
  v9 = a1[9];
  a1[9] = v8;
  swift_retain(v8);
  swift_release(v9);
  sub_100009F58(a1 + 10, a2 + 10);
  v10 = (void *)a2[15];
  v11 = (void *)a1[15];
  a1[15] = v10;
  v12 = v10;

  a1[16] = a2[16];
  v13 = a2[17];
  v14 = a1[17];
  a1[17] = v13;
  swift_retain(v13);
  swift_release(v14);
  return a1;
}

_QWORD *sub_10007E72C(_QWORD *result, _QWORD *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v11 = *result;
        v12 = *a2;
        swift_retain(*a2);
        result = (_QWORD *)swift_release(v11);
        *v3 = v12;
      }
      else
      {
        return (_QWORD *)(*(uint64_t (**)(_QWORD *, _QWORD *, _QWORD))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      result[5] = a2[5];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        v10 = *result;
        if ((v8 & 0x20000) != 0)
        {
          v14 = *a2;
          *v3 = *a2;
          swift_retain(v14);
        }
        else
        {
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (_QWORD *)swift_release(v10);
      }
      else
      {
        (*(void (**)(_BYTE *, _QWORD *, uint64_t))(v6 + 32))(v15, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          v13 = *a2;
          *v3 = *a2;
          swift_retain(v13);
        }
        else
        {
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (_QWORD *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v15, v4);
      }
    }
  }
  return result;
}

void *initializeWithTake for SubscriptionRefreshStaleActivitiesOperation(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x90uLL);
}

uint64_t assignWithTake for SubscriptionRefreshStaleActivitiesOperation(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release(v4);
  v5 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release(v5);
  sub_100007618((_QWORD *)(a1 + 24));
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  v6 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_release(v6);
  sub_100007618((_QWORD *)(a1 + 80));
  v7 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v7;
  v8 = *(_QWORD *)(a2 + 120);
  v9 = *(void **)(a1 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v8;

  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  v10 = *(_QWORD *)(a1 + 136);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_release(v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for SubscriptionRefreshStaleActivitiesOperation(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 144))
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

uint64_t storeEnumTagSinglePayload for SubscriptionRefreshStaleActivitiesOperation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 136) = 0;
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
      *(_BYTE *)(result + 144) = 1;
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
    *(_BYTE *)(result + 144) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SubscriptionRefreshStaleActivitiesOperation()
{
  return &type metadata for SubscriptionRefreshStaleActivitiesOperation;
}

void sub_10007EA04()
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
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
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
  id v66[15];
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;

  sub_10000738C(&qword_1000D2100);
  sub_10000A680();
  __chkstk_darwin(v1);
  sub_10000A7D4();
  v4 = v3 - v2;
  v5 = sub_10000738C(&qword_1000D3040);
  v51 = *(_QWORD *)(v5 - 8);
  sub_10000A680();
  __chkstk_darwin(v6);
  sub_10000A7D4();
  v9 = v8 - v7;
  v10 = sub_10000738C(&qword_1000D3048);
  v55 = *(_QWORD *)(v10 - 8);
  sub_10000A680();
  __chkstk_darwin(v11);
  sub_10000A7D4();
  v14 = v13 - v12;
  v15 = sub_10000738C(&qword_1000D3050);
  sub_10007B2D4(v15, (uint64_t)&v67);
  v57 = v16;
  sub_10000A680();
  __chkstk_darwin(v17);
  sub_10000A7D4();
  v20 = v19 - v18;
  v21 = sub_10000738C(&qword_1000D3058);
  sub_10007B2D4(v21, (uint64_t)&v68);
  v61 = v22;
  sub_10000A680();
  __chkstk_darwin(v23);
  sub_10000CD48();
  sub_100080A04(v24);
  v25 = sub_10000738C(&qword_1000D3060);
  sub_10007B2D4(v25, (uint64_t)&v69);
  v64 = v26;
  sub_10000A680();
  __chkstk_darwin(v27);
  sub_10000CD48();
  sub_100080A04(v28);
  v63 = sub_10000738C(&qword_1000D3068);
  v65 = *(_QWORD *)(v63 - 8);
  sub_10000A680();
  __chkstk_darwin(v29);
  sub_10000CD48();
  sub_100080A04(v30);
  v50 = v0;
  sub_10007FD54(v0, (uint64_t)v66);
  v31 = sub_10000A748((uint64_t)&unk_1000C8A60, 160);
  sub_1000809D4(v31);
  v32 = sub_10000738C(&qword_1000D3070);
  v33 = sub_100080684(&qword_1000D3078, &qword_1000D3070);
  Deferred.init(createPublisher:)(sub_10007FD8C, v31, v32, v33);
  v66[0] = *(id *)(v0 + 120);
  v34 = v66[0];
  v54 = type metadata accessor for OS_dispatch_queue.SchedulerOptions(0);
  sub_10000964C(v4, 1, 1, v54);
  v53 = sub_10005F450();
  v35 = sub_100080684(&qword_1000D3080, &qword_1000D3040);
  v52 = sub_1000803D8(&qword_1000D2178, (uint64_t (*)(uint64_t))sub_10005F450);
  v36 = v34;
  Publisher.receive<A>(on:options:)(v66, v4, v5, v53, v35, v52);
  sub_10007FD94(v4);

  v37 = (*(uint64_t (**)(uint64_t, uint64_t))(v51 + 8))(v9, v5);
  v38 = static Subscribers.Demand.unlimited.getter(v37);
  v39 = sub_10000738C(&qword_1000D3088);
  v40 = sub_100080684(&qword_1000D3090, &qword_1000D3048);
  v41 = sub_100080684(&qword_1000D3098, &qword_1000D3088);
  Publisher<>.flatMap<A>(maxPublishers:_:)(v38, sub_10007F418, 0, v10, v39, v40, v41);
  (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v14, v10);
  sub_10007FD54(v50, (uint64_t)v66);
  v42 = sub_10000A748((uint64_t)&unk_1000C8A88, 160);
  sub_1000809D4(v42);
  sub_100080684(&qword_1000D30A0, &qword_1000D3050);
  Publisher.filter(_:)(sub_10007FE2C, v42, v56);
  swift_release(v42);
  (*(void (**)(uint64_t))(v57 + 8))(v20);
  sub_10007FD54(v50, (uint64_t)v66);
  v43 = sub_10000A748((uint64_t)&unk_1000C8AB0, 160);
  sub_1000809D4(v43);
  v44 = sub_10000738C(&qword_1000D1590);
  v45 = sub_100080684(&qword_1000D30A8, &qword_1000D3058);
  sub_100080684(&qword_1000D1598, &qword_1000D1590);
  Publisher.flatMap<A>(maxPublishers:_:)(1, sub_10007FE38, v43, v60, v44, v45);
  swift_release(v43);
  (*(void (**)())(v61 + 8))();
  v66[0] = *(id *)(v50 + 120);
  v46 = v66[0];
  sub_10000964C(v4, 1, 1, v54);
  v47 = sub_100080684(&qword_1000D30B0, &qword_1000D3060);
  v48 = v46;
  Publisher.subscribe<A>(on:options:)(v66, v4, v62, v53, v47);
  sub_10007FD94(v4);

  sub_100038DF8(v58, *(uint64_t (**)(uint64_t, uint64_t))(v64 + 8));
  v49 = sub_100080684(&qword_1000D30B8, &qword_1000D3068);
  Publisher.eraseToAnyPublisher()(v63, v49);
  sub_100038DF8(v59, *(uint64_t (**)(uint64_t, uint64_t))(v65 + 8));
  sub_10000A668();
}

uint64_t sub_10007EFDC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  _BYTE v6[144];

  sub_10007FD54(a1, (uint64_t)v6);
  v3 = swift_allocObject(&unk_1000C8B78, 160, 7);
  memcpy((void *)(v3 + 16), v6, 0x90uLL);
  v4 = sub_10000738C(&qword_1000D3070);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  result = Future.init(_:)(sub_1000806C0, v3);
  *a2 = result;
  return result;
}

uint64_t sub_10007F064(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _BYTE __src[144];

  v6 = sub_10000738C(&qword_1000D0578);
  __chkstk_darwin(v6);
  v8 = &__src[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = swift_allocObject(&unk_1000C8BA0, 32, 7);
  *(_QWORD *)(v9 + 16) = a1;
  *(_QWORD *)(v9 + 24) = a2;
  v10 = type metadata accessor for TaskPriority(0);
  sub_10000964C((uint64_t)v8, 1, 1, v10);
  sub_10007FD54(a3, (uint64_t)__src);
  v11 = (_QWORD *)swift_allocObject(&unk_1000C8BC8, 192, 7);
  v11[2] = 0;
  v11[3] = 0;
  memcpy(v11 + 4, __src, 0x90uLL);
  v11[22] = sub_100019408;
  v11[23] = v9;
  swift_retain(a2);
  v12 = sub_100043B28((uint64_t)v8, (uint64_t)&unk_1000D30F8, (uint64_t)v11);
  return swift_release(v12);
}

uint64_t sub_10007F174(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[5] = a5;
  v6[6] = a6;
  v6[4] = a4;
  return swift_task_switch(sub_10007F190, 0, 0);
}

uint64_t sub_10007F190()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 56) = sub_1000073CC((_QWORD *)(*(_QWORD *)(v0 + 32) + 24), *(_QWORD *)(*(_QWORD *)(v0 + 32) + 48));
  if (qword_1000CFA90 != -1)
    swift_once(&qword_1000CFA90, sub_100047918);
  return sub_1000184B8();
}

uint64_t sub_10007F1FC()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 64) = sub_10004D36C();
  return sub_1000184B8();
}

uint64_t sub_10007F238()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v1 = sub_10007E1A8(*(_QWORD *)(v0 + 64));
  swift_bridgeObjectRelease();
  if (qword_1000CFAD8 != -1)
    swift_once(&qword_1000CFAD8, sub_10006CCEC);
  v2 = type metadata accessor for Logger(0);
  sub_1000096EC(v2, (uint64_t)qword_1000DDB00);
  v3 = swift_bridgeObjectRetain_n(v1, 2);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.debug.getter(v4);
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v14 = v7;
    *(_DWORD *)v6 = 136315138;
    swift_bridgeObjectRetain(v1);
    v9 = Array.description.getter(v8, &type metadata for String);
    v11 = v10;
    swift_bridgeObjectRelease();
    sub_100014B44(v9, v11, &v14);
    *(_QWORD *)(v0 + 24) = v12;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 24, v0 + 32, v6 + 4, v6 + 12);
    swift_bridgeObjectRelease();
    sub_10002ACCC();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Checking for stale activities: '%s'", v6, 0xCu);
    swift_arrayDestroy(v7, 1);
    sub_10000A818(v7);
    sub_10000A818((uint64_t)v6);
  }
  else
  {
    sub_10002ACCC();
  }

  (*(void (**)(_QWORD *, _QWORD))(v0 + 40))(v1, 0);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10007F418(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v5 = *a1;
  swift_bridgeObjectRetain(v5);
  v1 = sub_10000738C(&qword_1000D0440);
  v2 = sub_10000738C((uint64_t *)&unk_1000D1690);
  v3 = sub_100080684(&qword_1000D30E8, &qword_1000D0440);
  return Publishers.Sequence.init(sequence:)(&v5, v1, v2, v3, &protocol self-conformance witness table for Error);
}

uint64_t sub_10007F4AC(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  _QWORD *v12;
  char v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  double v20;
  void (*v21)(char *, uint64_t);
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v31;
  double v32;
  uint64_t v33;
  _BYTE v34[128];
  double v35;

  v4 = type metadata accessor for Date(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v10 = (char *)&v31 - v9;
  v11 = a1[1];
  v31 = *a1;
  v12 = *(_QWORD **)(a2 + 16);
  if ((sub_100063B00() & 1) != 0)
    v13 = 1;
  else
    v13 = _stringCompareWithSmolCheck(_:_:expecting:)(7827308, 0xE300000000000000, 1751607656, 0xE400000000000000, 0);
  swift_bridgeObjectRelease();
  v14 = v12 + 2;
  v15 = v12[5];
  v16 = v12[6];
  sub_1000073CC(v14, v15);
  v17 = dispatch thunk of PersistentStorable.retrieveEventSubscription(canonicalId:isConventionalOrUnified:)(v31, v11, v13 & 1, v15, v16);
  if (!v17)
    return 0;
  v18 = (void *)v17;
  v19 = (*(uint64_t (**)(void))a2)();
  SportingEventSubscription.updatedAt.getter(v19);
  v20 = Date.timeIntervalSince(_:)(v7);
  v21 = *(void (**)(char *, uint64_t))(v5 + 8);
  v21(v7, v4);
  v21(v10, v4);
  if (*(double *)(a2 + 128) >= v20)
  {

    return 0;
  }
  if (qword_1000CFAD8 != -1)
    swift_once(&qword_1000CFAD8, sub_10006CCEC);
  v22 = type metadata accessor for Logger(0);
  sub_1000096EC(v22, (uint64_t)qword_1000DDB00);
  sub_10007FD54(a2, (uint64_t)v34);
  v23 = swift_bridgeObjectRetain_n(v11, 2);
  v24 = Logger.logObject.getter(v23);
  v25 = static os_log_type_t.debug.getter(v24);
  if (os_log_type_enabled(v24, v25))
  {
    v26 = swift_slowAlloc(32, -1);
    v27 = swift_slowAlloc(32, -1);
    v33 = v27;
    *(_DWORD *)v26 = 136315650;
    swift_bridgeObjectRetain(v11);
    sub_100014B44(v31, v11, &v33);
    v32 = v28;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33, v26 + 4, v26 + 12);
    swift_bridgeObjectRelease_n(v11, 3);
    *(_WORD *)(v26 + 12) = 2048;
    v32 = v20;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33, v26 + 14, v26 + 22);
    *(_WORD *)(v26 + 22) = 2048;
    v32 = v35;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33, v26 + 24, v26 + 32);
    sub_100080654((uint64_t)v34);
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "Detected stale activity %s: (%f > %f).", (uint8_t *)v26, 0x20u);
    v29 = 1;
    swift_arrayDestroy(v27, 1);
    swift_slowDealloc(v27, -1, -1);
    swift_slowDealloc(v26, -1, -1);

  }
  else
  {
    swift_bridgeObjectRelease_n(v11, 2);
    sub_100080654((uint64_t)v34);

    return 1;
  }
  return v29;
}

uint64_t sub_10007F814(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  id v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  __n128 v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v28;
  _QWORD v29[5];
  _QWORD v30[3];
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[8];

  v4 = *a1;
  v3 = a1[1];
  v28 = *(_OWORD *)(a2 + 48);
  v5 = sub_1000073CC((_QWORD *)(a2 + 24), v28);
  v31 = v28;
  v6 = sub_100023784(v30);
  (*(void (**)(_QWORD *, _QWORD *, _QWORD))(*(_QWORD *)(v28 - 8) + 16))(v6, v5, v28);
  v7 = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(a2 + 72);
  sub_10000AE14(a2 + 80, (uint64_t)v34);
  v32 = v7;
  v33 = v8;
  v34[5] = v4;
  v34[6] = v3;
  v9 = (objc_class *)type metadata accessor for ActivityAuthorization(0);
  v10 = objc_allocWithZone(v9);
  swift_retain(v7);
  swift_retain(v8);
  v11 = objc_msgSend(v10, "init", swift_bridgeObjectRetain(v3).n128_f64[0]);
  v12 = sub_100043DEC();
  v14 = v13;
  v29[3] = v9;
  v29[4] = &off_1000C5188;
  v29[0] = v11;
  v15 = type metadata accessor for ActivityCapUtility();
  v16 = (_QWORD *)swift_allocObject(v15, 72, 7);
  v17 = sub_10000AE58((uint64_t)v29, (uint64_t)v9);
  v18 = __chkstk_darwin(v17);
  v20 = (_QWORD *)((char *)&v29[-2] - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *, __n128))(v21 + 16))(v20, v18);
  v22 = *v20;
  v16[5] = v9;
  v16[6] = &off_1000C5188;
  v16[2] = v22;
  v16[7] = v12;
  v16[8] = v14;
  sub_100007618(v29);
  v34[7] = v16;
  sub_10007F9FC();
  v24 = v23;
  sub_10007FE40(v30);
  v30[0] = v24;
  LOBYTE(v29[0]) = 0;
  v25 = sub_10000738C(&qword_1000D0B18);
  v26 = sub_100080684((unint64_t *)&qword_1000D0B20, &qword_1000D0B18);
  Publisher.replaceError(with:)(v29, v25, v26);
  return swift_release(v24);
}

void sub_10007F9FC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t refreshed;
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
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
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
  __int128 __src[7];
  _BYTE v45[9];
  uint64_t v46;

  v1 = (uint64_t)v0;
  v2 = type metadata accessor for Date(0);
  sub_10007B2D4(v2, (uint64_t)&v46);
  v37 = v3;
  sub_10000A680();
  __chkstk_darwin(v4);
  sub_10000A7D4();
  v7 = v6 - v5;
  refreshed = type metadata accessor for SubscriptionRefreshOperation(0);
  sub_10000A680();
  __chkstk_darwin(v9);
  sub_10000A7D4();
  v12 = v11 - v10;
  v42 = sub_10000738C(&qword_1000D1590);
  v40 = *(_QWORD *)(v42 - 8);
  sub_10000A680();
  __chkstk_darwin(v13);
  sub_10000CD48();
  sub_100080A04(v14);
  v43 = sub_10000738C(&qword_1000D30C0);
  v41 = *(_QWORD *)(v43 - 8);
  sub_10000A680();
  __chkstk_darwin(v15);
  sub_10000CD48();
  v39 = v16;
  v17 = v0[5];
  v18 = v0[6];
  sub_10000AE14((uint64_t)(v0 + 7), (uint64_t)__src);
  v19 = v0[12];
  v20 = v0[13];
  swift_retain(v17);
  swift_retain(v18);
  swift_bridgeObjectRetain(v20);
  if ((sub_100063B00() & 1) != 0)
    v21 = 1;
  else
    v21 = _stringCompareWithSmolCheck(_:_:expecting:)(7827308, 0xE300000000000000, 1751607656, 0xE400000000000000, 0);
  v22 = swift_bridgeObjectRelease();
  static SportsManager.RefreshOptions.all.getter(v22);
  *(_QWORD *)v12 = v17;
  *(_QWORD *)(v12 + 8) = v18;
  v23 = sub_100009DDC(__src, v12 + 16);
  *(_QWORD *)(v12 + 56) = v19;
  *(_QWORD *)(v12 + 64) = v20;
  *(_BYTE *)(v12 + 72) = v21 & 1;
  v24 = *(int *)(refreshed + 40);
  Date.init()(v23);
  sub_100080BA0();
  v26 = v25;
  (*(void (**)(uint64_t))(v37 + 8))(v7);
  *(_QWORD *)(v12 + v24) = v26;
  v27 = sub_100099CE4();
  sub_10007FE6C(v12);
  *(_QWORD *)&__src[0] = v27;
  v45[0] = 0;
  v28 = sub_10000738C(&qword_1000D0B18);
  v29 = sub_100080684((unint64_t *)&qword_1000D0B20, &qword_1000D0B18);
  Publisher.replaceError(with:)(v45, v28, v29);
  swift_release(v27);
  sub_10007FF34(v1, (uint64_t)__src);
  v30 = sub_10000A748((uint64_t)&unk_1000C8AD8, 136);
  v31 = memcpy((void *)(v30 + 16), __src, 0x78uLL);
  v32 = static Subscribers.Demand.unlimited.getter(v31);
  v33 = sub_10000738C(&qword_1000D0F18);
  v34 = sub_100080684(&qword_1000D1598, &qword_1000D1590);
  v35 = sub_100080684(&qword_1000D0F20, &qword_1000D0F18);
  Publisher<>.flatMap<A>(maxPublishers:_:)(v32, sub_10007FF6C, v30, v42, v33, v34, v35);
  swift_release(v30);
  sub_100038DF8(v38, *(uint64_t (**)(uint64_t, uint64_t))(v40 + 8));
  v36 = sub_100080684(&qword_1000D30C8, &qword_1000D30C0);
  Publisher.eraseToAnyPublisher()(v43, v36);
  sub_100038DF8(v39, *(uint64_t (**)(uint64_t, uint64_t))(v41 + 8));
  sub_10000A668();
}

uint64_t sub_10007FD54(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for SubscriptionRefreshStaleActivitiesOperation(a2, a1);
  return a2;
}

uint64_t sub_10007FD8C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_10007EFDC(v1 + 16, a1);
}

uint64_t sub_10007FD94(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10000738C(&qword_1000D2100);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10007FDD8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 32));
  sub_100007618((_QWORD *)(v0 + 40));
  swift_release(*(_QWORD *)(v0 + 88));
  sub_100007618((_QWORD *)(v0 + 96));

  swift_release(*(_QWORD *)(v0 + 152));
  return swift_deallocObject(v0, 160, 7);
}

uint64_t sub_10007FE2C(uint64_t *a1)
{
  uint64_t v1;

  return sub_10007F4AC(a1, v1 + 16);
}

uint64_t sub_10007FE38(uint64_t *a1)
{
  uint64_t v1;

  return sub_10007F814(a1, v1 + 16);
}

_QWORD *sub_10007FE40(_QWORD *a1)
{
  destroy for SubscriptionRefreshActivityOperation(a1);
  return a1;
}

uint64_t sub_10007FE6C(uint64_t a1)
{
  uint64_t refreshed;

  refreshed = type metadata accessor for SubscriptionRefreshOperation(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(refreshed - 8) + 8))(a1, refreshed);
  return a1;
}

uint64_t sub_10007FEA8@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  _BYTE __src[120];

  sub_10007FF34(a1, (uint64_t)__src);
  v3 = swift_allocObject(&unk_1000C8B00, 136, 7);
  memcpy((void *)(v3 + 16), __src, 0x78uLL);
  v4 = sub_10000738C(&qword_1000D0F18);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  result = Future.init(_:)(sub_1000803AC, v3);
  *a2 = result;
  return result;
}

uint64_t sub_10007FF34(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for SubscriptionRefreshActivityOperation(a2, a1);
  return a2;
}

uint64_t sub_10007FF6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_10007FEA8(v1 + 16, a1);
}

uint64_t sub_10007FF74(void (*a1)(_QWORD *), uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  char *v25;
  int v26;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  void (*v39)(_QWORD *);
  char *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD __src[16];

  v6 = sub_10000738C(&qword_1000D0578);
  __chkstk_darwin(v6);
  v41 = (uint64_t)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for SportingEventProgressStatus(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v40 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v13 = (char *)&v39 - v12;
  v14 = swift_allocObject(&unk_1000C8B28, 32, 7);
  v39 = a1;
  *(_QWORD *)(v14 + 16) = a1;
  *(_QWORD *)(v14 + 24) = a2;
  v42 = v14;
  v15 = (_QWORD *)a3[5];
  v17 = a3[12];
  v16 = a3[13];
  swift_retain(a2);
  if ((sub_100063B00() & 1) != 0)
    v18 = 1;
  else
    v18 = _stringCompareWithSmolCheck(_:_:expecting:)(7827308, 0xE300000000000000, 1751607656, 0xE400000000000000, 0);
  swift_bridgeObjectRelease();
  v19 = v15 + 2;
  v21 = v15[5];
  v20 = v15[6];
  sub_1000073CC(v19, v21);
  v22 = dispatch thunk of PersistentStorable.retrieveEventSubscription(canonicalId:isConventionalOrUnified:)(v17, v16, v18 & 1, v21, v20);
  if (!v22)
  {
    swift_release(v42);
    v30 = type metadata accessor for PersistentStoreError(0);
    v31 = sub_1000803D8(&qword_1000D30D0, (uint64_t (*)(uint64_t))&type metadata accessor for PersistentStoreError);
    v32 = swift_allocError(v30, v31, 0, 0);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v30 - 8) + 104))(v33, enum case for PersistentStoreError.fileNotFound(_:), v30);
    __src[0] = v32;
    LOBYTE(__src[1]) = 1;
    v39(__src);
    return swift_errorRelease(v32);
  }
  v23 = v22;
  v24 = (void *)SportingEventSubscription.sportingEventDetails.getter(v22);
  SportingEvent.progressStatus.getter(v24);

  v25 = v40;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v40, v13, v8);
  v26 = (*(uint64_t (**)(char *, uint64_t))(v9 + 88))(v25, v8);
  if (v26 == enum case for SportingEventProgressStatus.preGame(_:)
    || v26 == enum case for SportingEventProgressStatus.inProgress(_:)
    || v26 == enum case for SportingEventProgressStatus.statusBreak(_:))
  {
    goto LABEL_24;
  }
  if (v26 != enum case for SportingEventProgressStatus.final(_:))
  {
    if (v26 != enum case for SportingEventProgressStatus.postponed(_:))
    {
      if (v26 == enum case for SportingEventProgressStatus.suspended(_:)
        || v26 == enum case for SportingEventProgressStatus.cancelled(_:))
      {
        goto LABEL_20;
      }
      if (v26 != enum case for SportingEventProgressStatus.delayed(_:))
      {
        if (v26 == enum case for SportingEventProgressStatus.forfeit(_:))
          goto LABEL_20;
        if (v26 != enum case for SportingEventProgressStatus.unknown(_:))
          (*(void (**)(char *, uint64_t))(v9 + 8))(v25, v8);
      }
    }
LABEL_24:
    (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
    goto LABEL_25;
  }
LABEL_20:
  (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
  SportingEventSubscription.liveActivityTTLSeconds.setter(0x4072C00000000000, 0);
LABEL_25:
  v35 = type metadata accessor for TaskPriority(0);
  v36 = v41;
  sub_10000964C(v41, 1, 1, v35);
  sub_10007FF34((uint64_t)a3, (uint64_t)__src);
  v37 = (_QWORD *)swift_allocObject(&unk_1000C8B50, 176, 7);
  v37[2] = 0;
  v37[3] = 0;
  memcpy(v37 + 4, __src, 0x78uLL);
  v37[19] = v23;
  v37[20] = sub_10002F7D0;
  v37[21] = v42;
  v38 = sub_100043B28(v36, (uint64_t)&unk_1000D30E0, (uint64_t)v37);
  return swift_release(v38);
}

uint64_t sub_100080360()
{
  _QWORD *v0;

  sub_100007618(v0 + 2);
  swift_release(v0[7]);
  swift_release(v0[8]);
  sub_100007618(v0 + 9);
  swift_bridgeObjectRelease();
  swift_release(v0[16]);
  return swift_deallocObject(v0, 136, 7);
}

uint64_t sub_1000803AC(void (*a1)(_QWORD *), uint64_t a2)
{
  uint64_t v2;

  return sub_10007FF74(a1, a2, (_QWORD *)(v2 + 16));
}

uint64_t sub_1000803B4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000803D8(unint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = a2(255);
    result = sub_10000A850(v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100080410(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[4] = a6;
  v7[5] = a7;
  v7[2] = a4;
  v7[3] = a5;
  return swift_task_switch(sub_10008042C, 0, 0);
}

uint64_t sub_10008042C()
{
  uint64_t v0;
  _QWORD *v1;

  sub_1000073CC(*(_QWORD **)(v0 + 16), *(_QWORD *)(*(_QWORD *)(v0 + 16) + 24));
  v1 = (_QWORD *)swift_task_alloc(dword_1000D1A4C);
  *(_QWORD *)(v0 + 48) = v1;
  *v1 = v0;
  v1[1] = sub_100080490;
  return sub_10004D07C(*(_QWORD *)(v0 + 24), 0, 1);
}

uint64_t sub_100080490()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 48);
  *(_QWORD *)(*(_QWORD *)v1 + 56) = v0;
  swift_task_dealloc(v2);
  return sub_1000184B8();
}

uint64_t sub_1000804EC()
{
  uint64_t v0;

  (*(void (**)(uint64_t, _QWORD))(v0 + 32))(1, 0);
  return sub_1000184C4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_10008051C()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(void (**)(uint64_t, uint64_t))(v0 + 32);
  swift_errorRetain(v1);
  v2(v1, 1);
  swift_errorRelease(v1);
  swift_errorRelease(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100080578()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  sub_100007618((_QWORD *)(v0 + 32));
  swift_release(*(_QWORD *)(v0 + 72));
  swift_release(*(_QWORD *)(v0 + 80));
  sub_100007618((_QWORD *)(v0 + 88));
  swift_bridgeObjectRelease();
  swift_release(*(_QWORD *)(v0 + 144));

  swift_release(*(_QWORD *)(v0 + 168));
  return swift_deallocObject(v0, 176, 7);
}

uint64_t sub_1000805DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(v0 + 160);
  v3 = *(_QWORD *)(v0 + 168);
  v4 = (_QWORD *)swift_task_alloc(dword_1000D30DC);
  *(_QWORD *)(v1 + 16) = v4;
  v5 = sub_1000809E4(v4);
  return sub_100080410(v5, v6, v7, v8, v9, v2, v3);
}

uint64_t sub_100080654(uint64_t a1)
{
  destroy for SubscriptionRefreshStaleActivitiesOperation(a1);
  return a1;
}

uint64_t sub_100080684(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_100007648(a2);
    result = sub_10000A850(v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000806C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_10007F064(a1, a2, v2 + 16);
}

uint64_t sub_1000806C8()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 40));
  swift_release(*(_QWORD *)(v0 + 48));
  sub_100007618((_QWORD *)(v0 + 56));
  swift_release(*(_QWORD *)(v0 + 104));
  sub_100007618((_QWORD *)(v0 + 112));

  swift_release(*(_QWORD *)(v0 + 168));
  swift_release(*(_QWORD *)(v0 + 184));
  return swift_deallocObject(v0, 192, 7);
}

uint64_t sub_10008072C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(v0 + 184);
  v3 = (_QWORD *)swift_task_alloc(dword_1000D30F4);
  *(_QWORD *)(v1 + 16) = v3;
  v4 = sub_1000809E4(v3);
  return sub_10007F174(v4, v5, v6, v7, v8, v2);
}

uint64_t destroy for SubscriptionRefreshActivityOperation(_QWORD *a1)
{
  sub_100007618(a1);
  swift_release(a1[5]);
  swift_release(a1[6]);
  sub_100007618(a1 + 7);
  swift_bridgeObjectRelease();
  return swift_release(a1[14]);
}

uint64_t initializeWithCopy for SubscriptionRefreshActivityOperation(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = *(_QWORD *)(a2 + 40);
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = v5;
  *(_QWORD *)(a1 + 48) = v6;
  v7 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v7;
  v8 = v7;
  v9 = **(void (***)(uint64_t, uint64_t, uint64_t))(v7 - 8);
  swift_retain(v5);
  swift_retain(v6);
  v9(a1 + 56, a2 + 56, v8);
  v10 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v10;
  v11 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 112) = v11;
  swift_bridgeObjectRetain(v10);
  swift_retain(v11);
  return a1;
}

_QWORD *assignWithCopy for SubscriptionRefreshActivityOperation(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_100009F58(a1, a2);
  v4 = a2[5];
  v5 = a1[5];
  a1[5] = v4;
  swift_retain(v4);
  swift_release(v5);
  v6 = a2[6];
  v7 = a1[6];
  a1[6] = v6;
  swift_retain(v6);
  swift_release(v7);
  sub_100009F58(a1 + 7, a2 + 7);
  a1[12] = a2[12];
  v8 = a2[13];
  a1[13] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease();
  v9 = a2[14];
  v10 = a1[14];
  a1[14] = v9;
  swift_retain(v9);
  swift_release(v10);
  return a1;
}

uint64_t assignWithTake for SubscriptionRefreshActivityOperation(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_100007618((_QWORD *)a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  v6 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  swift_release(v6);
  v7 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_release(v7);
  sub_100007618((_QWORD *)(a1 + 56));
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a1 + 112);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_release(v8);
  return a1;
}

ValueMetadata *type metadata accessor for SubscriptionRefreshActivityOperation()
{
  return &type metadata for SubscriptionRefreshActivityOperation;
}

void *sub_1000809D4(uint64_t a1)
{
  uint64_t v1;

  return memcpy((void *)(a1 + 16), (const void *)(v1 - 232), 0x90uLL);
}

uint64_t sub_1000809E4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

void sub_100080A04(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
}

BOOL SportsSessionType.init(rawValue:)(uint64_t a1)
{
  return a1 != 0;
}

uint64_t SportsActivityType.rawValue.getter()
{
  return 0;
}

BOOL sub_100080A30@<W0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  _BOOL8 result;

  result = SportsSessionType.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

void sub_100080A60(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

unint64_t sub_100080A6C()
{
  unint64_t result;

  result = qword_1000D3100;
  if (!qword_1000D3100)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for SportsSessionType, &type metadata for SportsSessionType);
    atomic_store(result, (unint64_t *)&qword_1000D3100);
  }
  return result;
}

unint64_t sub_100080AAC()
{
  unint64_t result;

  result = qword_1000D3108;
  if (!qword_1000D3108)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for SportsActivityType, &type metadata for SportsActivityType);
    atomic_store(result, (unint64_t *)&qword_1000D3108);
  }
  return result;
}

ValueMetadata *type metadata accessor for SportsSessionType()
{
  return &type metadata for SportsSessionType;
}

uint64_t _s7sportsd17SportsSessionTypeOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_100080B3C + 4 * byte_1000A46F0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_100080B5C + 4 * byte_1000A46F5[v4]))();
}

_BYTE *sub_100080B3C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_100080B5C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100080B64(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100080B6C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100080B74(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100080B7C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SportsActivityType()
{
  return &type metadata for SportsActivityType;
}

void sub_100080BA0()
{
  double v0;

  v0 = Date.timeIntervalSince1970.getter() * 1000.0;
  if ((~*(_QWORD *)&v0 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v0 <= -1.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v0 >= 1.84467441e19)
LABEL_7:
    __break(1u);
}

unint64_t sub_100080BFC(double a1)
{
  double v1;
  unint64_t result;

  v1 = a1 * 1000.0;
  if ((~*(_QWORD *)&v1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v1 <= -1.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v1 < 1.84467441e19)
    return (unint64_t)v1;
LABEL_7:
  __break(1u);
  return result;
}

_QWORD *sub_100080C48(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v3;
  _QWORD *result;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = *(_QWORD *)(a1 + 16);
  result = _swiftEmptyArrayStorage;
  if (v3)
  {
    specialized ContiguousArray.reserveCapacity(_:)(v3);
    v6 = (uint64_t *)(a1 + 56);
    do
    {
      v7 = *(v6 - 3);
      v8 = *(v6 - 2);
      v9 = *(v6 - 1);
      v10 = *v6;
      swift_bridgeObjectRetain(v8);
      swift_bridgeObjectRetain(v10);
      v11 = a2(v7, v8, v9, v10);
      swift_bridgeObjectRelease(v10);
      v12 = swift_bridgeObjectRelease(v8);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v12);
      v13 = _swiftEmptyArrayStorage[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v13);
      v14 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v13, v11);
      specialized ContiguousArray._endMutation()(v14);
      v6 += 4;
      --v3;
    }
    while (v3);
    return _swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_100080D40(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30[5];
  __int128 v31;
  uint64_t v32;
  char v33;
  _QWORD *v34;

  v5 = type metadata accessor for SportingEventSubscription.Competitor(0);
  v24 = *(_QWORD *)(v5 - 8);
  v25 = v5;
  __chkstk_darwin(v5);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(a1 + 16);
  if (v8)
  {
    v29 = v2;
    v26 = a2;
    v34 = _swiftEmptyArrayStorage;
    sub_1000156E8(0, v8, 0);
    v9 = v34;
    v10 = a1 + 48;
    while (1)
    {
      v27 = v8;
      v11 = *(_QWORD *)(v10 - 8);
      v12 = *(_QWORD *)v10;
      v13 = *(_QWORD *)(v10 + 8);
      v14 = *(_QWORD *)(v10 + 16);
      v15 = *(_QWORD *)(v10 + 40);
      v16 = *(_BYTE *)(v10 + 48);
      v30[0] = *(_QWORD *)(v10 - 16);
      v30[1] = v11;
      v30[2] = v12;
      v30[3] = v13;
      v30[4] = v14;
      v28 = *(_OWORD *)(v10 + 24);
      v31 = v28;
      v32 = v15;
      v33 = v16;
      swift_bridgeObjectRetain(v13);
      swift_bridgeObjectRetain(v11);
      v17 = v28;
      sub_100023F64(v14, v28);
      swift_bridgeObjectRetain(v15);
      v18 = v7;
      v19 = v29;
      sub_100086074(v30, v26, (uint64_t)v7);
      v29 = v19;
      if (v19)
        break;
      swift_bridgeObjectRelease(v13);
      swift_bridgeObjectRelease(v11);
      sub_10003C2F0(v14, v17);
      swift_bridgeObjectRelease(v15);
      v34 = v9;
      v21 = v9[2];
      v20 = v9[3];
      if (v21 >= v20 >> 1)
      {
        sub_1000156E8(v20 > 1, v21 + 1, 1);
        v9 = v34;
      }
      v10 += 72;
      v9[2] = v21 + 1;
      v22 = (unint64_t)v9
          + ((*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80))
          + *(_QWORD *)(v24 + 72) * v21;
      v7 = v18;
      (*(void (**)(unint64_t, char *, uint64_t))(v24 + 32))(v22, v18, v25);
      v8 = v27 - 1;
      if (v27 == 1)
      {
        swift_bridgeObjectRelease(v26);
        return v9;
      }
    }
    swift_bridgeObjectRelease(v13);
    swift_bridgeObjectRelease(v11);
    sub_10003C2F0(v14, v17);
    swift_bridgeObjectRelease(v26);
    swift_release(v9);
    swift_bridgeObjectRelease(v15);
  }
  else
  {
    swift_bridgeObjectRelease(a2);
    return _swiftEmptyArrayStorage;
  }
  return v9;
}

uint64_t sub_100080F7C@<X0>(void *__src@<X0>, const void *a2@<X1>, uint64_t a3@<X2>, __int128 *a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, char a12, __int128 a13, __int128 a14, uint64_t a15, uint64_t a16, char a17)
{
  objc_class *v23;
  id v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t result;
  _QWORD v36[6];

  memcpy((void *)a9, __src, 0xB8uLL);
  memcpy((void *)(a9 + 184), a2, 0x78uLL);
  *(_QWORD *)(a9 + 304) = a3;
  sub_100009DDC(a4, a9 + 312);
  *(_BYTE *)(a9 + 352) = a5;
  sub_100086E1C(a6, a9 + 360, &qword_1000D1D58);
  *(_QWORD *)(a9 + 464) = a7;
  *(_QWORD *)(a9 + 472) = a8;
  *(_QWORD *)(a9 + 480) = a10;
  *(_QWORD *)(a9 + 488) = a11;
  *(_BYTE *)(a9 + 496) = a12;
  *(_OWORD *)(a9 + 504) = a13;
  *(_OWORD *)(a9 + 520) = a14;
  *(_QWORD *)(a9 + 536) = a15;
  *(_QWORD *)(a9 + 544) = a16;
  *(_BYTE *)(a9 + 552) = a17 & 1;
  v23 = (objc_class *)type metadata accessor for ActivityAuthorization(0);
  v24 = objc_msgSend(objc_allocWithZone(v23), "init");
  v25 = sub_100043DEC();
  v27 = v26;
  v36[3] = v23;
  v36[4] = &off_1000C5188;
  v36[0] = v24;
  v28 = type metadata accessor for ActivityCapUtility();
  v29 = (_QWORD *)sub_10000A748(v28, 72);
  v30 = sub_10000AE58((uint64_t)v36, (uint64_t)v23);
  __chkstk_darwin(v30);
  sub_10000A6E4();
  (*(void (**)(__int128 *))(v31 + 16))(a4);
  v32 = *(_QWORD *)a4;
  v29[5] = v23;
  v29[6] = &off_1000C5188;
  v29[2] = v32;
  v29[7] = v25;
  v29[8] = v27;
  result = sub_100007618(v36);
  *(_QWORD *)(a9 + 560) = v29;
  return result;
}

void sub_100081130(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void))
{
  a5();
  sub_100006200();
}

void sub_10008114C()
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
  uint64_t v22;
  void *v23;
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
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  _QWORD *v54;
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
  uint64_t v68[71];
  uint64_t v69;

  v1 = sub_10000738C(&qword_1000D0F00);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  sub_10000A7D4();
  v5 = v4 - v3;
  v6 = sub_10000738C(&qword_1000D3118);
  v58 = *(_QWORD *)(v6 - 8);
  v59 = v6;
  sub_10000A680();
  __chkstk_darwin(v7);
  sub_10000A7D4();
  v10 = v9 - v8;
  v11 = sub_10000738C(&qword_1000D3120);
  v61 = *(_QWORD *)(v11 - 8);
  v62 = v11;
  sub_10000A680();
  __chkstk_darwin(v12);
  sub_10000CD48();
  v60 = v13;
  v14 = sub_10000738C(&qword_1000D3128);
  v65 = *(_QWORD *)(v14 - 8);
  v66 = v14;
  sub_10000A680();
  __chkstk_darwin(v15);
  sub_10000CD48();
  v63 = v16;
  v17 = sub_10000738C(&qword_1000D3130);
  v67 = *(_QWORD *)(v17 - 8);
  sub_10000A680();
  __chkstk_darwin(v18);
  sub_10000CD48();
  v64 = v19;
  if (qword_1000CFA98 != -1)
    swift_once(&qword_1000CFA98, sub_1000479AC);
  v20 = *(_QWORD *)(v0 + 520);
  v21 = *(_QWORD *)(v0 + 528);
  if ((dispatch thunk of ActivityAuthorization.areActivitiesEnabled(forBundleId:)(v20) & 1) != 0)
  {
    v69 = sub_1000826E4();
    sub_100087F80();
    v22 = sub_10000A748((uint64_t)&unk_1000C8E10, 584);
    v23 = sub_100087F3C(v22);
    v24 = static Subscribers.Demand.unlimited.getter(v23);
    v25 = sub_10000738C(&qword_1000D09A0);
    v57 = v17;
    v26 = sub_100088150();
    sub_100031668(&qword_1000D09A8, &qword_1000D09A0, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
    v28 = v27;
    sub_100031668(&qword_1000D3140, &qword_1000D3138, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
    Publisher<>.flatMap<A>(maxPublishers:_:)(v24, sub_100082860, v22, v25, v26, v28, v29);
    swift_release(v22);
    swift_release(v69);
    sub_100087F80();
    v30 = sub_10000A748((uint64_t)&unk_1000C8E38, 584);
    sub_100087F3C(v30);
    v31 = sub_10000A748((uint64_t)&unk_1000C8E60, 32);
    *(_QWORD *)(v31 + 16) = sub_1000829FC;
    *(_QWORD *)(v31 + 24) = v30;
    v32 = static Subscribers.Demand.unlimited.getter(v31);
    v33 = sub_10000738C(&qword_1000D0B18);
    sub_1000880B4(&qword_1000D3148, &qword_1000D3118);
    v35 = v34;
    sub_100031668((unint64_t *)&qword_1000D0B20, &qword_1000D0B18, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
    Publisher.flatMap<A, B>(maxPublishers:_:)(v32, sub_100082A18, v31, v59, &type metadata for Bool, v33, v35, v36);
    swift_release(v31);
    (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v10, v59);
    sub_100087F80();
    v37 = sub_10000A748((uint64_t)&unk_1000C8E88, 584);
    v38 = sub_100087F3C(v37);
    v39 = static Subscribers.Demand.unlimited.getter(v38);
    v40 = sub_100088150();
    sub_1000880B4(&qword_1000D3150, &qword_1000D3120);
    v42 = v41;
    sub_100031668(&qword_1000CFDF8, &qword_1000CFDF0, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
    Publisher.flatMap<A>(maxPublishers:_:)(v39, sub_100082A40, v37, v62, v40, v42, v43);
    sub_10008804C();
    (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v60, v62);
    sub_100087F80();
    v44 = sub_10000A748((uint64_t)&unk_1000C8EB0, 584);
    v45 = sub_100087F3C(v44);
    v46 = static Subscribers.Demand.unlimited.getter(v45);
    v47 = sub_100088150();
    sub_1000880B4(&qword_1000D3158, &qword_1000D3128);
    v49 = v48;
    sub_100031668(&qword_1000D0F20, &qword_1000D0F18, (uint64_t)&protocol conformance descriptor for Future<A, B>);
    Publisher.flatMap<A, B>(maxPublishers:_:)(v46, sub_100082C40, v44, v66, &type metadata for Bool, v47, v49, v50);
    sub_10008804C();
    (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v63, v66);
    sub_1000880B4(&qword_1000D3160, &qword_1000D3130);
    Publisher.eraseToAnyPublisher()(v57, v51);
    (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v64, v57);
  }
  else
  {
    v52 = sub_10003FE64();
    v53 = sub_100043398((uint64_t)&unk_1000C9DD8, v52);
    *v54 = v20;
    v54[1] = v21;
    v68[0] = v53;
    swift_bridgeObjectRetain(v21);
    v55 = sub_10000738C((uint64_t *)&unk_1000D1690);
    Fail.init(error:)(v68, &type metadata for Bool, v55, &protocol self-conformance witness table for Error);
    sub_100031668(&qword_1000D0F08, &qword_1000D0F00, (uint64_t)&protocol conformance descriptor for Fail<A, B>);
    Publisher.eraseToAnyPublisher()(v1, v56);
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v5, v1);
  }
  sub_10000A668();
}

void sub_1000816A8(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char *v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  unsigned __int8 v18;
  uint64_t v19;
  unsigned __int8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  Swift::Int v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE v36[64];
  _OWORD v37[2];
  unsigned __int8 v38[8];
  _BYTE v39[32];
  _OWORD v40[2];
  uint64_t v41;
  _OWORD v42[2];
  uint64_t v43;

  if (*(_QWORD *)(a1 + 16))
  {
    sub_10000738C(&qword_1000D3250);
    v2 = (_BYTE *)sub_1000880F0();
  }
  else
  {
    v2 = &_swiftEmptyDictionarySingleton;
  }
  v34 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v33 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain(a1);
  swift_retain(v2);
  v7 = 0;
  if (!v5)
    goto LABEL_9;
LABEL_8:
  v8 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  v9 = v8 | (v7 << 6);
  while (1)
  {
    v18 = *(_BYTE *)(*(_QWORD *)(a1 + 48) + v9);
    sub_100018090(*(_QWORD *)(a1 + 56) + 32 * v9, (uint64_t)v42 + 8);
    LOBYTE(v42[0]) = v18;
    v40[0] = v42[0];
    v40[1] = v42[1];
    v41 = v43;
    v38[0] = v18;
    sub_100022CB8((_OWORD *)((char *)v40 + 8), v37);
    v19 = sub_10000738C((uint64_t *)&unk_1000CFF70);
    swift_dynamicCast(v39, v37, (char *)&type metadata for Any + 8, v19, 7);
    v20 = v38[0];
    sub_100088118((uint64_t)v39, (uint64_t)v36);
    sub_100088118((uint64_t)v36, (uint64_t)v38);
    sub_100088118((uint64_t)v38, (uint64_t)v37);
    Hasher.init(_seed:)(&v35);
    v21 = sub_10007B6F4(v20);
    v23 = v22;
    String.hash(into:)(&v35, v21, v22);
    swift_bridgeObjectRelease(v23);
    v24 = Hasher._finalize()();
    v25 = -1 << v2[32];
    v26 = v24 & ~v25;
    v27 = v26 >> 6;
    if (((-1 << v26) & ~*(_QWORD *)&v6[8 * (v26 >> 6)]) == 0)
    {
      v29 = 0;
      v30 = (unint64_t)(63 - v25) >> 6;
      while (++v27 != v30 || (v29 & 1) == 0)
      {
        v31 = v27 == v30;
        if (v27 == v30)
          v27 = 0;
        v29 |= v31;
        v32 = *(_QWORD *)&v6[8 * v27];
        if (v32 != -1)
        {
          v28 = __clz(__rbit64(~v32)) + (v27 << 6);
          goto LABEL_38;
        }
      }
      __break(1u);
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
    v28 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)&v6[8 * (v26 >> 6)])) | v26 & 0x7FFFFFFFFFFFFFC0;
LABEL_38:
    *(_QWORD *)&v6[(v28 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v28;
    *(_BYTE *)(*((_QWORD *)v2 + 6) + v28) = v20;
    sub_100088118((uint64_t)v37, *((_QWORD *)v2 + 7) + 32 * v28);
    ++*((_QWORD *)v2 + 2);
    if (v5)
      goto LABEL_8;
LABEL_9:
    v10 = v7 + 1;
    if (__OFADD__(v7, 1))
      goto LABEL_42;
    if (v10 >= v33)
      goto LABEL_40;
    v11 = *(_QWORD *)(v34 + 8 * v10);
    v12 = v7 + 1;
    if (!v11)
    {
      sub_10008817C();
      if (v13 == v14)
        goto LABEL_40;
      sub_100088170();
      if (!v11)
      {
        sub_10008817C();
        if (v13 == v14)
          goto LABEL_40;
        sub_100088170();
        if (!v11)
        {
          sub_10008817C();
          if (v13 == v14)
            goto LABEL_40;
          sub_100088170();
          if (!v11)
            break;
        }
      }
    }
LABEL_28:
    v5 = (v11 - 1) & v11;
    v9 = __clz(__rbit64(v11)) + (v12 << 6);
    v7 = v12;
  }
  v16 = v15 + 4;
  if (v16 >= v33)
  {
LABEL_40:
    sub_10008804C();
    sub_1000180CC(a1);
    return;
  }
  v11 = *(_QWORD *)(v34 + 8 * v16);
  if (v11)
  {
    v12 = v16;
    goto LABEL_28;
  }
  while (!__OFADD__(v16, 1))
  {
    sub_10008817C();
    if (v13 == v14)
      goto LABEL_40;
    sub_100088170();
    v16 = v17 + 1;
    if (v11)
      goto LABEL_28;
  }
LABEL_43:
  __break(1u);
}

void sub_100081A3C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  int64_t v8;
  char *v9;
  _QWORD *v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  char v15;
  BOOL v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  _QWORD *v34;
  char *v35;
  uint64_t *v36;
  _QWORD *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  int64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[2];
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  _OWORD v51[2];

  v1 = a1;
  if (*(_QWORD *)(a1 + 16))
  {
    sub_10000738C(&qword_1000D0860);
    v2 = (_QWORD *)sub_1000880F0();
  }
  else
  {
    v2 = &_swiftEmptyDictionarySingleton;
  }
  v42 = v1 + 64;
  v3 = -1 << *(_BYTE *)(v1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(v1 + 64);
  v41 = (unint64_t)(63 - v3) >> 6;
  v6 = &v48;
  v7 = &v50;
  swift_bridgeObjectRetain(v1);
  v8 = 0;
  v9 = (char *)&type metadata for Any + 8;
  v10 = &type metadata for String;
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        v44 = (v5 - 1) & v5;
        v11 = __clz(__rbit64(v5)) | (v8 << 6);
      }
      else
      {
        v12 = v8 + 1;
        if (__OFADD__(v8, 1))
          goto LABEL_38;
        if (v12 >= v41)
        {
LABEL_35:
          sub_1000180CC(v1);
          return;
        }
        v13 = *(_QWORD *)(v42 + 8 * v12);
        v14 = v8 + 1;
        if (!v13)
        {
          sub_100088144();
          if (v15 == v16)
            goto LABEL_35;
          sub_100088138();
          if (!v13)
          {
            sub_100088144();
            if (v15 == v16)
              goto LABEL_35;
            sub_100088138();
            if (!v13)
            {
              sub_100088144();
              if (v15 == v16)
                goto LABEL_35;
              sub_100088138();
              if (!v13)
              {
                v18 = v17 + 4;
                if (v18 >= v41)
                  goto LABEL_35;
                v13 = *(_QWORD *)(v42 + 8 * v18);
                if (!v13)
                {
                  while (!__OFADD__(v18, 1))
                  {
                    sub_100088144();
                    if (v15 == v16)
                      goto LABEL_35;
                    sub_100088138();
                    v18 = v19 + 1;
                    if (v13)
                      goto LABEL_29;
                  }
                  goto LABEL_39;
                }
                v14 = v18;
              }
            }
          }
        }
LABEL_29:
        v44 = (v13 - 1) & v13;
        v11 = __clz(__rbit64(v13)) + (v14 << 6);
        v8 = v14;
      }
      v20 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v11);
      v22 = *v20;
      v21 = v20[1];
      v23 = (uint64_t *)(*(_QWORD *)(v1 + 56) + 16 * v11);
      v24 = *v23;
      v25 = v23[1];
      v46 = v22;
      v47 = v21;
      v45[0] = v24;
      v45[1] = v25;
      swift_bridgeObjectRetain(v21);
      swift_bridgeObjectRetain(v25);
      swift_dynamicCast(v6, v45, v10, v9, 7);
      v26 = v46;
      v27 = v47;
      sub_100022CB8(v6, v7);
      sub_100022CB8(v7, v51);
      sub_100022CB8(v51, &v49);
      v28 = sub_100015050(v26, v27);
      v29 = v28;
      if ((v30 & 1) == 0)
        break;
      v43 = v8;
      v31 = v7;
      v32 = v6;
      v33 = v1;
      v34 = v10;
      v35 = v9;
      v36 = (uint64_t *)(v2[6] + 16 * v28);
      swift_bridgeObjectRelease();
      *v36 = v26;
      v36[1] = v27;
      v9 = v35;
      v10 = v34;
      v1 = v33;
      v6 = v32;
      v7 = v31;
      v8 = v43;
      v37 = (_QWORD *)(v2[7] + 32 * v29);
      sub_100007618(v37);
      sub_100022CB8(&v49, v37);
      v5 = v44;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((v28 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v28;
    v38 = (uint64_t *)(v2[6] + 16 * v28);
    *v38 = v26;
    v38[1] = v27;
    sub_100022CB8(&v49, (_OWORD *)(v2[7] + 32 * v28));
    v39 = v2[2];
    v16 = __OFADD__(v39, 1);
    v40 = v39 + 1;
    if (v16)
      goto LABEL_37;
    v2[2] = v40;
    v5 = v44;
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

_OWORD *sub_100081D6C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  _OWORD *result;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  int64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  char *v26;
  void (*v27)(char *, char *, uint64_t);
  char *v28;
  id v29;
  _OWORD *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  Swift::Int v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  char v41;
  unint64_t v42;
  BOOL v43;
  uint64_t v44;
  uint64_t v45;
  int64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t *v49;
  char *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  int64_t v55;
  uint64_t v56;
  uint64_t v57;
  _OWORD v58[2];
  _OWORD v59[3];

  v2 = type metadata accessor for Date(0);
  v53 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v52 = (char *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = sub_10000738C(&qword_1000D31E0);
  __chkstk_darwin(v51);
  v5 = (uint64_t *)((char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v6);
  v8 = (char *)&v45 - v7;
  v54 = a1;
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    sub_10000738C(&qword_1000D31E8);
    v10 = (_BYTE *)static _DictionaryStorage.allocate(capacity:)(v9);
  }
  else
  {
    v10 = &_swiftEmptyDictionarySingleton;
  }
  v11 = *(_QWORD *)(v54 + 64);
  v47 = v54 + 64;
  v12 = -1 << *(_BYTE *)(v54 + 32);
  if (-v12 < 64)
    v13 = ~(-1 << -(char)v12);
  else
    v13 = -1;
  v14 = v13 & v11;
  v45 = -1 << *(_BYTE *)(v54 + 32);
  v46 = (unint64_t)(63 - v12) >> 6;
  v50 = (char *)v59 + 8;
  v49 = &v57;
  v15 = v10 + 64;
  swift_bridgeObjectRetain(v54);
  result = (_OWORD *)swift_retain(v10);
  v55 = 0;
  v48 = (char *)&type metadata for Any + 8;
  if (!v14)
    goto LABEL_9;
LABEL_8:
  v17 = __clz(__rbit64(v14));
  v14 &= v14 - 1;
  v18 = v17 | (v55 << 6);
  while (1)
  {
    v23 = v53;
    v24 = *(void **)(*(_QWORD *)(v54 + 48) + 8 * v18);
    v25 = v51;
    (*(void (**)(char *, unint64_t, uint64_t))(v53 + 16))(&v8[*(int *)(v51 + 48)], *(_QWORD *)(v54 + 56) + *(_QWORD *)(v53 + 72) * v18, v2);
    *(_QWORD *)v8 = v24;
    sub_100086E1C((uint64_t)v8, (uint64_t)v5, &qword_1000D31E0);
    v26 = (char *)v5 + *(int *)(v25 + 48);
    *(_QWORD *)&v59[0] = *v5;
    v27 = *(void (**)(char *, char *, uint64_t))(v23 + 32);
    v28 = v52;
    v27(v52, v26, v2);
    v29 = v24;
    v30 = v50;
    swift_dynamicCast(v50, v28, v2, v48, 7);
    v31 = *(_QWORD *)&v59[0];
    v32 = v49;
    sub_100022CB8(v30, v49);
    sub_100022CB8(v32, v59);
    sub_100022CB8(v59, v58);
    v33 = static String._unconditionallyBridgeFromObjectiveC(_:)(v31);
    v35 = v34;
    Hasher.init(_seed:)(&v56);
    String.hash(into:)(&v56, v33, v35);
    v36 = Hasher._finalize()();
    result = (_OWORD *)swift_bridgeObjectRelease(v35);
    v37 = -1 << v10[32];
    v38 = v36 & ~v37;
    v39 = v38 >> 6;
    if (((-1 << v38) & ~*(_QWORD *)&v15[8 * (v38 >> 6)]) == 0)
    {
      v41 = 0;
      v42 = (unint64_t)(63 - v37) >> 6;
      while (++v39 != v42 || (v41 & 1) == 0)
      {
        v43 = v39 == v42;
        if (v39 == v42)
          v39 = 0;
        v41 |= v43;
        v44 = *(_QWORD *)&v15[8 * v39];
        if (v44 != -1)
        {
          v40 = __clz(__rbit64(~v44)) + (v39 << 6);
          goto LABEL_34;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    v40 = __clz(__rbit64((-1 << v38) & ~*(_QWORD *)&v15[8 * (v38 >> 6)])) | v38 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(_QWORD *)&v15[(v40 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v40;
    *(_QWORD *)(*((_QWORD *)v10 + 6) + 8 * v40) = v31;
    result = sub_100022CB8(v58, (_OWORD *)(*((_QWORD *)v10 + 7) + 32 * v40));
    ++*((_QWORD *)v10 + 2);
    if (v14)
      goto LABEL_8;
LABEL_9:
    v19 = v55 + 1;
    if (__OFADD__(v55, 1))
      goto LABEL_38;
    if (v19 >= v46)
      goto LABEL_36;
    v20 = *(_QWORD *)(v47 + 8 * v19);
    v21 = v55 + 1;
    if (!v20)
    {
      v21 = v55 + 2;
      if (v55 + 2 >= v46)
        goto LABEL_36;
      v20 = *(_QWORD *)(v47 + 8 * v21);
      if (!v20)
      {
        v21 = v55 + 3;
        if (v55 + 3 >= v46)
          goto LABEL_36;
        v20 = *(_QWORD *)(v47 + 8 * v21);
        if (!v20)
        {
          v21 = v55 + 4;
          if (v55 + 4 >= v46)
            goto LABEL_36;
          v20 = *(_QWORD *)(v47 + 8 * v21);
          if (!v20)
            break;
        }
      }
    }
LABEL_24:
    v14 = (v20 - 1) & v20;
    v18 = __clz(__rbit64(v20)) + (v21 << 6);
    v55 = v21;
  }
  v22 = v55 + 5;
  if (v55 + 5 >= v46)
  {
LABEL_36:
    swift_release(v10);
    sub_1000180CC(v54);
    return v10;
  }
  v20 = *(_QWORD *)(v47 + 8 * v22);
  if (v20)
  {
    v21 = v55 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    v21 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v21 >= v46)
      goto LABEL_36;
    v20 = *(_QWORD *)(v47 + 8 * v21);
    ++v22;
    if (v20)
      goto LABEL_24;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_10008225C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v0 = type metadata accessor for SportsLogoSize(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for SportsLogoSize.default(_:), v0);
  v5 = SportsLogoSize.rawValue.getter(v4);
  result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  qword_1000D3110 = v5;
  return result;
}

void sub_1000822F4()
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
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  char v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
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
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unsigned __int8 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51[72];

  v2 = v0;
  v3 = sub_10000738C(&qword_1000D3178);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  sub_10000A7D4();
  v7 = v6 - v5;
  sub_10000738C(&qword_1000D0888);
  sub_10000A680();
  __chkstk_darwin(v8);
  sub_10000A6E4();
  v51[3] = (uint64_t)&type metadata for TVAppFeatureFlags;
  v51[4] = sub_10000A278();
  v9 = isFeatureEnabled(_:)(v51);
  sub_100007618(v51);
  if ((v9 & 1) != 0)
  {
    sub_100023E30(v2, (uint64_t)v51);
    v42 = *(_QWORD *)(v2 + 512);
    v44 = *(_QWORD *)(v2 + 504);
    v40 = *(_QWORD *)(v2 + 536);
    v10 = *(_QWORD *)(v2 + 544);
    if (*(_QWORD *)(v2 + 384) == 1)
    {
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
    }
    else
    {
      v13 = *(_QWORD *)(v2 + 432);
      v14 = *(_QWORD *)(v2 + 440);
      v11 = *(_QWORD *)(v2 + 416);
      v12 = *(_QWORD *)(v2 + 424);
      swift_bridgeObjectRetain(v12);
      swift_bridgeObjectRetain(v14);
    }
    v20 = *(_BYTE *)(v2 + 496);
    if ((*(_BYTE *)(v2 + 552) & 1) != 0)
    {
      v21 = _stringCompareWithSmolCheck(_:_:expecting:)(1751607656, 0xE400000000000000, 7827308, 0xE300000000000000, 0);
      swift_bridgeObjectRelease(0xE400000000000000);
      if ((v21 & 1) != 0)
        v22 = 4;
      else
        v22 = 1;
    }
    else
    {
      swift_bridgeObjectRelease(0xE300000000000000);
      v22 = 4;
    }
    v34 = type metadata accessor for SubscriptionRegisterOperation.PreferredData(0);
    sub_10000964C(v1, 1, 1, v34);
    LOBYTE(v38) = v22;
    LOBYTE(v37) = v20;
    sub_100023248(v44, v42, v40, v10, v13, v14, v11, v12, 0x6B5F7374726F7073, 0xEA00000000007469, v37, 0, 0, v38, v1, *(_QWORD *)(v2 + 520), *(_QWORD *)(v2 + 528), v39, v40,
      v42,
      v44,
      v46,
      v47,
      v48,
      v49,
      v50,
      v51[0],
      v51[1],
      v51[2]);
    swift_bridgeObjectRelease(v12);
    swift_bridgeObjectRelease(v14);
    sub_100038C8C(v1, &qword_1000D0888);
    sub_100023FB4(v51);
    v35 = v49;
    v36 = v50;
    sub_1000073CC(&v46, v49);
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v35, v36);
    sub_100007618(&v46);
  }
  else
  {
    v43 = v4;
    v45 = v3;
    v15 = *(_QWORD **)(v2 + 304);
    v16 = *(_QWORD *)(v2 + 536);
    v17 = *(_QWORD *)(v2 + 544);
    if ((sub_100063B00() & 1) != 0)
    {
      v19 = 1;
      v18 = 0xE400000000000000;
    }
    else
    {
      v18 = 0xE300000000000000;
      v19 = sub_100087F4C();
    }
    swift_bridgeObjectRelease(v18);
    v23 = v15[5];
    v24 = v15[6];
    sub_1000073CC(v15 + 2, v23);
    v41 = (void *)dispatch thunk of PersistentStorable.retrieveEventSubscription(canonicalId:isConventionalOrUnified:)(v16, v17, v19 & 1, v23, v24);
    v46 = sub_10008388C(v41);
    sub_100082828(v2, (uint64_t)v51);
    v25 = sub_10000A748((uint64_t)&unk_1000C8FA0, 584);
    v26 = memcpy((void *)(v25 + 16), v51, 0x238uLL);
    v27 = static Subscribers.Demand.unlimited.getter(v26);
    v28 = sub_10000738C(&qword_1000D3180);
    v29 = sub_10000738C(&qword_1000D0B18);
    sub_100031668(&qword_1000D3188, &qword_1000D3180, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
    v31 = v30;
    sub_100031668((unint64_t *)&qword_1000D0B20, &qword_1000D0B18, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
    Publisher.flatMap<A, B>(maxPublishers:_:)(v27, sub_1000868B4, v25, v28, &type metadata for Bool, v29, v31, v32);
    sub_10008804C();
    swift_release(v46);
    sub_100031668(&qword_1000D3190, &qword_1000D3178, (uint64_t)&protocol conformance descriptor for Publishers.FlatMap<A, B>);
    Publisher.eraseToAnyPublisher()(v45, v33);

    (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v7, v45);
  }
  sub_10000A668();
}

uint64_t sub_1000826E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v10[5];

  v1 = sub_10000738C(&qword_1000D09B0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v10[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10[3] = &type metadata for TVAppFeatureFlags;
  v10[4] = sub_10000A278();
  v5 = isFeatureEnabled(_:)(v10);
  sub_100007618(v10);
  if ((v5 & 1) != 0)
  {
    v6 = *(_QWORD *)(*sub_1000073CC((_QWORD *)(v0 + 312), *(_QWORD *)(v0 + 336)) + 56);
    swift_retain(v6);
  }
  else
  {
    v10[0] = 0x7FFFFFFFFFFFFFFFLL;
    Just.init(_:)(v10);
    sub_100031668(&qword_1000D09C8, &qword_1000D09B0, (uint64_t)&protocol conformance descriptor for Just<A>);
    v6 = Publisher.eraseToAnyPublisher()(v1, v7);
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return v6;
}

uint64_t sub_1000827FC@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = sub_100082868(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_100082828(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for SubscriptionCreateActivityOperation(a2, a1);
  return a2;
}

uint64_t sub_100082860@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1000827FC(a1, a2);
}

uint64_t sub_100082868(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD __src[71];

  sub_100082828(v1, (uint64_t)__src);
  v3 = swift_allocObject(&unk_1000C9040, 592, 7);
  memcpy((void *)(v3 + 16), __src, 0x238uLL);
  *(_QWORD *)(v3 + 584) = a1;
  v4 = sub_10000738C(&qword_1000D3258);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  v5 = Future.init(_:)(sub_100086CF8, v3);
  __src[0] = v5;
  sub_100031668(&qword_1000D3260, &qword_1000D3258, (uint64_t)&protocol conformance descriptor for Future<A, B>);
  v7 = Publisher.eraseToAnyPublisher()(v4, v6);
  swift_release(v5);
  return v7;
}

uint64_t sub_100082950(uint64_t a1)
{
  _QWORD *v1;
  char v3;

  sub_100007618(v1 + 2);
  swift_release(v1[7]);
  swift_release(v1[8]);
  sub_100088014();
  sub_100087FEC();
  sub_100007618(v1 + 41);
  if (v1[50] != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1000880E8();
    sub_1000880E0();
    sub_1000880D8();
  }
  if (v1[61] != 1)
  {
    swift_bridgeObjectRelease();
    sub_1000880CC();
    if (!v3)
      swift_bridgeObjectRelease();
  }
  sub_100088190();
  sub_10008805C();
  sub_100088054();
  swift_release(v1[72]);
  return swift_deallocObject(v1, a1, 7);
}

void sub_1000829FC()
{
  sub_1000822F4();
  sub_100006200();
}

void sub_100082A18(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = (*(uint64_t (**)(void))(v1 + 16))();
  sub_100006200();
}

void sub_100082A40(uint64_t *a1@<X8>)
{
  *a1 = sub_100082A64();
  sub_100006200();
}

uint64_t sub_100082A64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v10[5];

  v1 = sub_10000738C(&qword_1000D0520);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v10[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10[3] = &type metadata for TVAppFeatureFlags;
  v10[4] = sub_10000A278();
  v5 = isFeatureEnabled(_:)(v10);
  sub_100007618(v10);
  if ((v5 & 1) != 0)
  {
    v6 = *(_QWORD *)(*sub_1000073CC((_QWORD *)(v0 + 312), *(_QWORD *)(v0 + 336)) + 48);
    swift_retain(v6);
  }
  else
  {
    v10[0] = 0x53552D6E65;
    v10[1] = 0xE500000000000000;
    Just.init(_:)(v10);
    sub_100031668(&qword_1000D0538, &qword_1000D0520, (uint64_t)&protocol conformance descriptor for Just<A>);
    v6 = Publisher.eraseToAnyPublisher()(v1, v7);
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return v6;
}

uint64_t sub_100082B88@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t result;
  _BYTE __src[568];

  v5 = *a1;
  v4 = a1[1];
  sub_100082828(a2, (uint64_t)__src);
  v6 = (_QWORD *)swift_allocObject(&unk_1000C8ED8, 600, 7);
  memcpy(v6 + 2, __src, 0x238uLL);
  v6[73] = v5;
  v6[74] = v4;
  v7 = sub_10000738C(&qword_1000D0F18);
  swift_allocObject(v7, *(unsigned int *)(v7 + 48), *(unsigned __int16 *)(v7 + 52));
  swift_bridgeObjectRetain(v4);
  result = Future.init(_:)(sub_100082E30, v6);
  *a3 = result;
  return result;
}

uint64_t sub_100082C40@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_100082B88(a1, v2 + 16, a2);
}

uint64_t sub_100082C48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _BYTE v19[568];

  v10 = sub_10000738C(&qword_1000D0578);
  __chkstk_darwin(v10);
  v12 = &v19[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v13 = swift_allocObject(&unk_1000C8F00, 32, 7);
  *(_QWORD *)(v13 + 16) = a1;
  *(_QWORD *)(v13 + 24) = a2;
  v14 = type metadata accessor for TaskPriority(0);
  sub_10000964C((uint64_t)v12, 1, 1, v14);
  sub_100082828(a3, (uint64_t)v19);
  v15 = (_QWORD *)swift_allocObject(&unk_1000C8F28, 632, 7);
  v15[2] = 0;
  v15[3] = 0;
  memcpy(v15 + 4, v19, 0x238uLL);
  v15[75] = a4;
  v15[76] = a5;
  v15[77] = sub_10002F7D0;
  v15[78] = v13;
  swift_retain(a2);
  swift_bridgeObjectRetain(a5);
  v16 = sub_100043B28((uint64_t)v12, (uint64_t)&unk_1000D3170, (uint64_t)v15);
  return swift_release(v16);
}

uint64_t sub_100082D88()
{
  _QWORD *v0;
  char v1;

  sub_100007618(v0 + 2);
  swift_release(v0[7]);
  swift_release(v0[8]);
  sub_100088014();
  sub_100087FEC();
  sub_100007618(v0 + 41);
  if (v0[50] != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1000880E8();
    sub_1000880E0();
    sub_1000880D8();
  }
  if (v0[61] != 1)
  {
    swift_bridgeObjectRelease();
    sub_1000880CC();
    if (!v1)
      swift_bridgeObjectRelease();
  }
  sub_100088190();
  sub_10008805C();
  sub_100088054();
  swift_release(v0[72]);
  swift_bridgeObjectRelease();
  return swift_deallocObject(v0, 600, 7);
}

uint64_t sub_100082E30(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100082C48(a1, a2, v2 + 16, *(_QWORD *)(v2 + 584), *(_QWORD *)(v2 + 592));
}

uint64_t sub_100082E40()
{
  uint64_t v0;

  sub_1000754A0();
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100082E60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v8[82] = a8;
  v8[81] = a7;
  v8[80] = a6;
  v8[79] = a5;
  v8[78] = a4;
  v9 = type metadata accessor for SportingEventProgressStatus(0);
  v8[83] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v8[84] = v10;
  v8[85] = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100082ED0, 0, 0);
}

uint64_t sub_100082ED0()
{
  uint64_t v0;
  uint64_t v1;

  if (qword_1000CFA98 != -1)
    swift_once(&qword_1000CFA98, sub_1000479AC);
  v1 = *(_QWORD *)(v0 + 624);
  *(_QWORD *)(v0 + 688) = qword_1000DDA78;
  *(_QWORD *)(v0 + 696) = *(_QWORD *)(v1 + 536);
  *(_QWORD *)(v0 + 704) = *(_QWORD *)(v1 + 544);
  *(_BYTE *)(v0 + 760) = *(_BYTE *)(v1 + 352);
  *(_BYTE *)(v0 + 761) = *(_BYTE *)(v1 + 496);
  *(_QWORD *)(v0 + 712) = *(_QWORD *)(v1 + 520);
  *(_QWORD *)(v0 + 720) = *(_QWORD *)(v1 + 528);
  if (qword_1000CFA90 != -1)
    swift_once(&qword_1000CFA90, sub_100047918);
  return sub_1000184B8();
}

uint64_t sub_100082F98()
{
  uint64_t v0;

  sub_10004A198(*(_QWORD *)(v0 + 696), *(_QWORD *)(v0 + 704), *(_BYTE *)(v0 + 760), *(_BYTE *)(v0 + 761), *(_QWORD *)(v0 + 712), *(_QWORD *)(v0 + 720), *(_QWORD *)(v0 + 632), *(_QWORD *)(v0 + 640));
  *(_QWORD *)(v0 + 728) = 0;
  return sub_1000184D0();
}

uint64_t sub_100083010()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  char v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  os_log_type_t type;
  uint64_t v34;
  uint64_t v35;

  v1 = *(_QWORD **)(v0 + 624);
  v2 = (_QWORD *)v1[38];
  v3 = v1[67];
  v4 = v1[68];
  if ((sub_100063B00() & 1) != 0)
    v5 = 1;
  else
    v5 = sub_100087F4C();
  swift_bridgeObjectRelease();
  v6 = v2 + 2;
  v7 = v2[5];
  v8 = v2[6];
  sub_1000073CC(v6, v7);
  v9 = dispatch thunk of PersistentStorable.retrieveEventSubscription(canonicalId:isConventionalOrUnified:)(v3, v4, v5 & 1, v7, v8);
  *(_QWORD *)(v0 + 736) = v9;
  if (v9)
  {
    v10 = (void *)v9;
    if (qword_1000CFAD8 != -1)
      swift_once(&qword_1000CFAD8, sub_10006CCEC);
    v11 = *(_QWORD *)(v0 + 624);
    v12 = type metadata accessor for Logger(0);
    sub_1000096EC(v12, (uint64_t)qword_1000DDB00);
    sub_100082828(v11, v0 + 16);
    v13 = v10;
    v14 = Logger.logObject.getter(v13);
    v15 = static os_log_type_t.debug.getter(v14);
    if (os_log_type_enabled(v14, v15))
    {
      v16 = *(_QWORD *)(v0 + 680);
      v31 = *(_QWORD *)(v0 + 672);
      v32 = *(_QWORD *)(v0 + 664);
      v17 = swift_slowAlloc(22, -1);
      v34 = swift_slowAlloc(64, -1);
      v35 = v34;
      *(_DWORD *)v17 = 136315394;
      type = v15;
      v18 = *(_QWORD *)(v0 + 552);
      v19 = *(_QWORD *)(v0 + 560);
      swift_bridgeObjectRetain(v19);
      sub_100014B44(v18, v19, &v35);
      *(_QWORD *)(v0 + 608) = v20;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 608, v0 + 616, v17 + 4, v17 + 12);
      swift_bridgeObjectRelease();
      v21 = sub_10004E0C4((_QWORD *)(v0 + 16));
      *(_WORD *)(v17 + 12) = 2080;
      v22 = (void *)SportingEventSubscription.sportingEventDetails.getter(v21);
      SportingEvent.progressStatus.getter(v22);

      v24 = SportingEventProgressStatus.rawValue.getter(v23);
      v26 = v25;
      (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v16, v32);
      sub_100014B44(v24, v26, &v35);
      *(_QWORD *)(v0 + 616) = v27;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 616, v0 + 624, v17 + 14, v17 + 22);
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, v14, type, "Update activity for '%s' with latest state %s", (uint8_t *)v17, 0x16u);
      swift_arrayDestroy(v34, 2);
      sub_10000A818(v34);
      sub_10000A818(v17);
    }
    else
    {
      sub_10004E0C4((_QWORD *)(v0 + 16));

    }
    v29 = *(_BYTE *)(*(_QWORD *)(v0 + 624) + 352);
    v30 = (_QWORD *)swift_task_alloc(dword_1000D1A4C);
    *(_QWORD *)(v0 + 744) = v30;
    *v30 = v0;
    v30[1] = sub_10008333C;
    return sub_10004D07C((uint64_t)v13, 0, v29);
  }
  else
  {
    sub_1000880A0();
    sub_100088120();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_10008333C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 744);
  *(_QWORD *)(*(_QWORD *)v1 + 752) = v0;
  swift_task_dealloc(v2);
  return sub_1000184B8();
}

uint64_t sub_100083398()
{
  uint64_t v0;

  sub_1000880A0();
  sub_100088120();
  return sub_1000184C4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1000833C8()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v3 = *(_QWORD *)(v0 + 728);
  sub_1000881AC();
  v4 = sub_10000738C((uint64_t *)&unk_1000D1690);
  if ((sub_1000880BC(v4, v5, v4, (uint64_t)&unk_1000C9DD8) & 1) == 0)
    goto LABEL_4;
  sub_100088198();
  if (!v6)
  {
    sub_100088158();
LABEL_4:
    sub_100088128();
    v7 = (_QWORD *)sub_10000A748((uint64_t)&unk_1000C8F50, 40);
    sub_100088064(v7);
    v8 = qword_1000CFA60;
    swift_retain(v0 + 584);
    if (v8 != -1)
      swift_once(&qword_1000CFA60, sub_100028A24);
    v9 = sub_10008803C(*(_QWORD *)(v0 + 624));
    sub_100029330(v9, v10, v11, v12, (uint64_t)sub_1000867FC, v0 + 600);
    swift_release(v0 + 600);
    v13 = v3;
    goto LABEL_13;
  }
  sub_10002ABB8();
  if (v2 == 2)
  {
    v14 = sub_10004DDD8();
    v15 = sub_100043398((uint64_t)&unk_1000C9C28, v14);
    sub_10008808C(v15, v16);
    sub_10002ABB8();
  }
  else
  {
    v17 = (_QWORD *)sub_10000A748((uint64_t)&unk_1000C8F78, 48);
    sub_100088078(v17);
    sub_100088164();
    if (qword_1000CFA60 != -1)
      swift_once(&qword_1000CFA60, sub_100028A24);
    v18 = sub_10008803C(*(_QWORD *)(v0 + 624));
    sub_100029330(v18, v19, v20, v21, (uint64_t)sub_10008687C, v3);
    sub_100086824(v1, v2);
    sub_10008804C();
  }
  v13 = *(_QWORD *)(v0 + 600);
LABEL_13:
  swift_errorRelease(v13);
  sub_100088120();
  return sub_100087F6C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_100083554()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v3 = *(_QWORD *)(v0 + 752);
  sub_1000881AC();
  v4 = sub_10000738C((uint64_t *)&unk_1000D1690);
  if ((sub_1000880BC(v4, v5, v4, (uint64_t)&unk_1000C9DD8) & 1) == 0)
    goto LABEL_4;
  sub_100088198();
  if (!v6)
  {
    sub_100088158();
LABEL_4:
    sub_100088128();
    v7 = (_QWORD *)sub_10000A748((uint64_t)&unk_1000C8F50, 40);
    sub_100088064(v7);
    v8 = qword_1000CFA60;
    swift_retain(v0 + 584);
    if (v8 != -1)
      swift_once(&qword_1000CFA60, sub_100028A24);
    v9 = sub_10008803C(*(_QWORD *)(v0 + 624));
    sub_100029330(v9, v10, v11, v12, (uint64_t)sub_1000867FC, v0 + 600);
    swift_release(v0 + 600);
    v13 = v3;
    goto LABEL_13;
  }
  sub_10002ABB8();
  if (v2 == 2)
  {
    v14 = sub_10004DDD8();
    v15 = sub_100043398((uint64_t)&unk_1000C9C28, v14);
    sub_10008808C(v15, v16);
    sub_10002ABB8();
  }
  else
  {
    v17 = (_QWORD *)sub_10000A748((uint64_t)&unk_1000C8F78, 48);
    sub_100088078(v17);
    sub_100088164();
    if (qword_1000CFA60 != -1)
      swift_once(&qword_1000CFA60, sub_100028A24);
    v18 = sub_10008803C(*(_QWORD *)(v0 + 624));
    sub_100029330(v18, v19, v20, v21, (uint64_t)sub_10008687C, v3);
    sub_100086824(v1, v2);
    sub_10008804C();
  }
  v13 = *(_QWORD *)(v0 + 600);
LABEL_13:
  swift_errorRelease(v13);
  sub_100088120();
  return sub_100087F6C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1000836E8()
{
  _QWORD *v0;
  char v1;

  swift_unknownObjectRelease(v0[2]);
  sub_100007618(v0 + 4);
  swift_release(v0[9]);
  swift_release(v0[10]);
  sub_100087FC4();
  sub_100087F9C();
  sub_100007618(v0 + 43);
  if (v0[52] != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1000880E8();
    sub_1000880E0();
    sub_1000880D8();
    swift_bridgeObjectRelease();
  }
  sub_1000880CC();
  if (!v1)
  {
    swift_bridgeObjectRelease();
    if (v0[65] != 1)
      swift_bridgeObjectRelease();
  }
  sub_10008805C();
  sub_100088054();
  sub_100088188();
  swift_release(v0[74]);
  swift_bridgeObjectRelease();
  swift_release(v0[78]);
  return swift_deallocObject(v0, 632, 7);
}

uint64_t sub_1000837A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_100088100();
  v2 = *(_QWORD *)(v0 + 616);
  v3 = *(_QWORD *)(v0 + 624);
  v4 = (_QWORD *)swift_task_alloc(dword_1000D316C);
  *(_QWORD *)(v1 + 16) = v4;
  v5 = sub_1000734C4(v4);
  return sub_100082E60(v5, v6, v7, v8, v9, v10, v2, v3);
}

uint64_t sub_100083810(uint64_t a1, void (*a2)(uint64_t, uint64_t), uint64_t a3, uint64_t a4, unint64_t a5)
{
  unint64_t v8;
  uint64_t v9;
  uint64_t *v10;

  v8 = sub_10004DDD8();
  v9 = swift_allocError(&unk_1000C9C28, v8, 0, 0);
  *v10 = a4;
  v10[1] = a5;
  sub_10008689C(a4, a5);
  a2(v9, 1);
  return swift_errorRelease(v9);
}

uint64_t sub_10008388C(void *a1)
{
  uint64_t v1;
  uint64_t v2;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  _OWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t);
  char *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  __n128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  __int128 v44;
  __int128 v45;
  __n128 v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  uint8_t *v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint8_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint8_t *v71;
  uint8_t *v72;
  uint64_t v73;
  id v74;
  char *v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t Activity;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char v86;
  uint64_t v87;
  uint64_t v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;

  v2 = v1;
  v4 = v1 + 392;
  v5 = sub_10000738C(&qword_1000D3198);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v70 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_10000738C(&qword_1000D31A0);
  v77 = *(_QWORD *)(v9 - 8);
  v78 = v9;
  __chkstk_darwin(v9);
  v76 = (char *)&v70 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_10000738C(&qword_1000D31A8);
  v80 = *(_QWORD *)(v11 - 8);
  v81 = v11;
  __chkstk_darwin(v11);
  v79 = (char *)&v70 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  Activity = type metadata accessor for SubscriptionCreateActivityOperation.ActivityData(0);
  __chkstk_darwin(Activity);
  v14 = (char *)&v70 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v75 = (char *)&v70 - v16;
  v17 = sub_10000738C(&qword_1000D10A0);
  __chkstk_darwin(v17);
  v19 = (char *)&v70 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = type metadata accessor for SportingEventSubscription.Metadata(0);
  __chkstk_darwin(v20);
  v24 = (char *)&v70 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(_BYTE *)(v4 + 104) & 1) != 0)
  {
    v25 = *(_QWORD *)(v2 + 384);
    if (v25 != 1)
    {
      v41 = *(_QWORD *)(v2 + 456);
      v42 = *(_QWORD *)(v2 + 376);
      v43 = *(_DWORD *)(v2 + 368);
      v85 = *(_QWORD *)(v2 + 360);
      v86 = v43 & 1;
      v87 = v42;
      v88 = v25;
      v44 = *(_OWORD *)(v4 + 16);
      v89 = *(_OWORD *)v4;
      v90 = v44;
      v45 = *(_OWORD *)(v4 + 48);
      v91 = *(_OWORD *)(v4 + 32);
      v92 = v45;
      v93 = v41;
      return sub_10008448C(&v85);
    }
    v26 = sub_10003FE64();
    v27 = swift_allocError(&unk_1000C9DD8, v26, 0, 0);
    *v28 = xmmword_1000A4880;
    v85 = v27;
    v29 = sub_10000738C((uint64_t *)&unk_1000D1690);
    Fail.init(error:)(&v85, Activity, v29, &protocol self-conformance witness table for Error);
    sub_100031668(&qword_1000D31B8, &qword_1000D3198, (uint64_t)&protocol conformance descriptor for Fail<A, B>);
    v31 = Publisher.eraseToAnyPublisher()(v5, v30);
    v32 = *(void (**)(char *, uint64_t))(v6 + 8);
    v33 = v8;
    goto LABEL_4;
  }
  if (a1)
  {
    v34 = v22;
    v35 = v21;
    v36 = a1;
    v38 = SportingEventSubscription.consumers.getter(v37);
    v39 = *(_QWORD *)(v38 + 16);
    v40 = swift_bridgeObjectRelease(v38);
    if (v39)
    {
      SportingEventSubscription.metadata.getter(v40);
      v5 = v35;
      if (sub_100009658((uint64_t)v19, 1, v35) == 1)
      {
        sub_100038C8C((uint64_t)v19, &qword_1000D10A0);
        v31 = sub_100084B30();

        return v31;
      }
      v74 = v36;
      (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v24, v19, v35);
      if ((sub_100084DA8() & 1) != 0)
      {
        sub_100085370(v47);
        if (qword_1000CFAD8 != -1)
          swift_once(&qword_1000CFAD8, sub_10006CCEC);
        v48 = type metadata accessor for Logger(0);
        sub_1000096EC(v48, (uint64_t)qword_1000DDB00);
        v49 = sub_100082828(v2, (uint64_t)&v85);
        v50 = Logger.logObject.getter(v49);
        v51 = static os_log_type_t.debug.getter(v50);
        if (os_log_type_enabled(v50, v51))
        {
          v52 = (uint8_t *)swift_slowAlloc(12, -1);
          v73 = swift_slowAlloc(32, -1);
          v84 = v73;
          *(_DWORD *)v52 = 136315138;
          v53 = v52 + 12;
          v71 = v52 + 4;
          v72 = v52;
          v54 = v94;
          v55 = v95;
          swift_bridgeObjectRetain(v95);
          sub_100014B44(v54, v55, &v84);
          v83 = v56;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v83, &v84, v71, v53);
          swift_bridgeObjectRelease(v55);
          sub_10004E0C4(&v85);
          v57 = v72;
          _os_log_impl((void *)&_mh_execute_header, v50, v51, "Metadata and logos already exist, skip UTS call for %s", v72, 0xCu);
          v58 = v73;
          swift_arrayDestroy(v73, 1);
          swift_slowDealloc(v58, -1, -1);
          swift_slowDealloc(v57, -1, -1);
        }
        else
        {
          sub_10004E0C4(&v85);
        }

        v60 = SportingEventSubscription.sport.getter(v59);
        v62 = v61;
        v63 = v75;
        (*(void (**)(char *, char *, uint64_t))(v34 + 16))(&v75[*(int *)(Activity + 24)], v24, v35);
        *v63 = 0;
        v63[1] = 0;
        v63[2] = v60;
        v63[3] = v62;
        sub_100086A9C((uint64_t)v63, (uint64_t)v14, type metadata accessor for SubscriptionCreateActivityOperation.ActivityData);
        v64 = v76;
        Just.init(_:)(v14);
        v65 = sub_10000738C((uint64_t *)&unk_1000D1690);
        v66 = v78;
        v67 = v79;
        Just.setFailureType<A>(to:)(v65, v78, v65, &protocol self-conformance witness table for Error);
        (*(void (**)(char *, uint64_t))(v77 + 8))(v64, v66);
        sub_100031668(&qword_1000D31B0, &qword_1000D31A8, (uint64_t)&protocol conformance descriptor for Result<A, B>.Publisher);
        v68 = v81;
        v31 = Publisher.eraseToAnyPublisher()(v81, v69);

        (*(void (**)(char *, uint64_t))(v80 + 8))(v67, v68);
        sub_100038708((uint64_t)v63, type metadata accessor for SubscriptionCreateActivityOperation.ActivityData);
        (*(void (**)(char *, uint64_t))(v34 + 8))(v24, v35);
        return v31;
      }
      v31 = sub_100084B30();

      v32 = *(void (**)(char *, uint64_t))(v34 + 8);
      v33 = v24;
LABEL_4:
      v32(v33, v5);
      return v31;
    }

  }
  return sub_100084B30();
}

uint64_t sub_100083EDC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30[2];
  unsigned __int8 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[3];
  uint64_t v36;
  uint64_t v37;

  v29 = a3;
  v5 = sub_10000738C(&qword_1000D0888);
  __chkstk_darwin(v5);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100023E30(a2, (uint64_t)v30);
  v28 = *(_QWORD *)(a2 + 504);
  v27 = *(_QWORD *)(a2 + 512);
  v26 = *(_QWORD *)(a2 + 536);
  v25 = *(_QWORD *)(a2 + 544);
  v8 = *a1;
  v9 = a1[1];
  v11 = a1[2];
  v10 = a1[3];
  v12 = *(_QWORD *)(a2 + 384);
  if ((*(_BYTE *)(a2 + 552) & 1) != 0)
  {
    v13 = _stringCompareWithSmolCheck(_:_:expecting:)(1751607656, 0xE400000000000000, 7827308, 0xE300000000000000, 0);
    swift_bridgeObjectRelease(0xE400000000000000);
    if ((v13 & 1) != 0)
      v14 = 4;
    else
      v14 = 1;
  }
  else
  {
    swift_bridgeObjectRelease(0xE300000000000000);
    v14 = 4;
  }
  v15 = (char *)a1 + *(int *)(type metadata accessor for SubscriptionCreateActivityOperation.ActivityData(0) + 24);
  v16 = type metadata accessor for SportingEventSubscription.Metadata(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v7, v15, v16);
  sub_10000964C((uint64_t)v7, 0, 1, v16);
  v17 = type metadata accessor for SubscriptionRegisterOperation.PreferredData(0);
  sub_10000964C((uint64_t)v7, 0, 1, v17);
  LOBYTE(v23) = v14;
  LOBYTE(v22) = v12 != 1;
  sub_100023248(v28, v27, v26, v25, v8, v9, v11, v10, 0x6B5F7374726F7073, 0xEA00000000007469, v22, 0, 0, v23, (uint64_t)v7, *(_QWORD *)(a2 + 520), *(_QWORD *)(a2 + 528), v24, v25,
    v26,
    v27,
    v28,
    v29,
    v30[0],
    v30[1],
    v31,
    v32,
    v33,
    v34);
  sub_100038C8C((uint64_t)v7, &qword_1000D0888);
  sub_100023FB4(v30);
  v18 = v36;
  v19 = v37;
  sub_1000073CC(v35, v36);
  v20 = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 8))(v18, v19);
  *v29 = v20;
  return sub_100007618(v35);
}

uint64_t sub_100084134(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _BYTE v17[568];

  v8 = sub_10000738C(&qword_1000D0578);
  __chkstk_darwin(v8);
  v10 = &v17[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v11 = swift_allocObject(&unk_1000C9068, 32, 7);
  *(_QWORD *)(v11 + 16) = a1;
  *(_QWORD *)(v11 + 24) = a2;
  v12 = type metadata accessor for TaskPriority(0);
  sub_10000964C((uint64_t)v10, 1, 1, v12);
  sub_100082828(a3, (uint64_t)v17);
  v13 = (_QWORD *)swift_allocObject(&unk_1000C9090, 624, 7);
  v13[2] = 0;
  v13[3] = 0;
  memcpy(v13 + 4, v17, 0x238uLL);
  v13[75] = sub_100019408;
  v13[76] = v11;
  v13[77] = a4;
  swift_retain(a2);
  v14 = sub_100043B28((uint64_t)v10, (uint64_t)&unk_1000D3270, (uint64_t)v13);
  return swift_release(v14);
}

uint64_t sub_10008425C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[9] = a6;
  v7[10] = a7;
  v7[7] = a4;
  v7[8] = a5;
  return swift_task_switch(sub_100084278, 0, 0);
}

uint64_t sub_100084278()
{
  uint64_t v0;
  char v1;
  __n128 v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  __n128 *v7;

  *(_QWORD *)(v0 + 40) = &type metadata for TVAppFeatureFlags;
  *(_QWORD *)(v0 + 48) = sub_10000A278();
  v1 = isFeatureEnabled(_:)(v0 + 16);
  sub_100007618((_QWORD *)(v0 + 16));
  if ((v1 & 1) != 0)
  {
    if (qword_1000CFA98 != -1)
      swift_once(&qword_1000CFA98, sub_1000479AC);
    *(_QWORD *)(v0 + 88) = qword_1000DDA78;
    if (qword_1000CFA90 != -1)
      swift_once(&qword_1000CFA90, sub_100047918);
    return sub_1000184D0();
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 56);
    if (*(_BYTE *)(v4 + 496) != 1)
      goto LABEL_11;
    if (qword_1000CFA98 != -1)
    {
      swift_once(&qword_1000CFA98, sub_1000479AC);
      v4 = *(_QWORD *)(v0 + 56);
    }
    if ((sub_100047A28(*(_QWORD *)(v4 + 520), *(_QWORD *)(v4 + 528), v2) & 1) == 0)
    {
      v5 = sub_10003FE64();
      v6 = sub_100043398((uint64_t)&unk_1000C9DD8, v5);
      sub_1000881B8(v6, v7, (__n128)xmmword_1000A4890);
      swift_errorRelease(v6);
    }
    else
    {
LABEL_11:
      (*(void (**)(_QWORD, _QWORD))(v0 + 64))(0, 0);
    }
    return sub_100087F8C(*(uint64_t (**)(void))(v0 + 8));
  }
}

uint64_t sub_1000843E0()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 96) = sub_100047B30();
  return sub_1000184B8();
}

uint64_t sub_100084418()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  __n128 *v3;

  if (*(_QWORD *)(v0 + 96) >= *(_QWORD *)(v0 + 80))
  {
    v1 = sub_10003FE64();
    v2 = sub_100043398((uint64_t)&unk_1000C9DD8, v1);
    sub_1000881B8(v2, v3, (__n128)xmmword_1000A11D0);
    swift_errorRelease(v2);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v0 + 64))(0, 0);
  }
  return sub_100087F8C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_10008448C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  _QWORD *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t Activity;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  _QWORD *v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  unsigned int v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  _QWORD *v88;
  uint64_t v89;
  _QWORD v90[71];

  v2 = sub_10000738C(&qword_1000D12F0);
  v68 = *(_QWORD *)(v2 - 8);
  v69 = v2;
  __chkstk_darwin(v2);
  v67 = (char *)&v64 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_10000738C(&qword_1000D12F8);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v71 = (char *)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_10000738C(&qword_1000D31C0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for TemplateImageUrl.ImageFormat(0);
  v83 = *(_QWORD *)(v11 - 8);
  v84 = v11;
  __chkstk_darwin(v11);
  v82 = (char *)&v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_10000738C((uint64_t *)&unk_1000D16E0);
  __chkstk_darwin(v13);
  v15 = (char *)&v64 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for URL(0);
  v78 = *(_QWORD *)(v16 - 8);
  __chkstk_darwin(v16);
  v77 = (char *)&v64 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = a1;
  v73 = v10;
  v19 = a1[6];
  v74 = v5;
  v75 = v8;
  if (v19)
  {
    v66 = v4;
    v20 = *(_QWORD *)(v19 + 16);
    if (v20)
    {
      v65 = v7;
      v80 = enum case for TemplateImageUrl.ImageFormat.png(_:);
      swift_bridgeObjectRetain_n(v19, 2);
      v64 = v19;
      v21 = (uint64_t *)(v19 + 56);
      v22 = _swiftEmptyArrayStorage;
      v81 = v16;
      v76 = v15;
      do
      {
        v23 = v21[2];
        if (v23 >= 2)
        {
          v88 = v22;
          v24 = *(v21 - 2);
          v25 = v21[4];
          v26 = *v21;
          v27 = v21[1];
          v85 = *(v21 - 3);
          v86 = v26;
          swift_bridgeObjectRetain(v26);
          v89 = v24;
          swift_bridgeObjectRetain(v24);
          sub_100023F64(v27, v23);
          v87 = v25;
          swift_bridgeObjectRetain(v25);
          sub_100023F64(v27, v23);
          if (qword_1000CFB08 != -1)
            swift_once(&qword_1000CFB08, sub_10008225C);
          v28 = qword_1000D3110;
          v30 = v82;
          v29 = v83;
          v31 = v84;
          (*(void (**)(char *, _QWORD, uint64_t))(v83 + 104))(v82, v80, v84);
          static TemplateImageUrl.imageUrl(templateUrl:width:height:format:)(v27, v23, v28, v28, v30);
          sub_10003C2F0(v27, v23);
          (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v31);
          v32 = v81;
          if (sub_100009658((uint64_t)v15, 1, v81) == 1)
          {
            sub_100038C8C((uint64_t)v15, (uint64_t *)&unk_1000D16E0);
            swift_bridgeObjectRelease(v86);
            swift_bridgeObjectRelease(v89);
            sub_10003C2F0(v27, v23);
            swift_bridgeObjectRelease(v87);
            v22 = v88;
          }
          else
          {
            v34 = v77;
            v33 = v78;
            (*(void (**)(char *, char *, uint64_t))(v78 + 32))(v77, v15, v32);
            v35 = v89;
            swift_bridgeObjectRetain(v89);
            v37 = URL.absoluteString.getter(v36);
            v79 = v38;
            (*(void (**)(char *, uint64_t))(v33 + 8))(v34, v32);
            swift_bridgeObjectRelease(v86);
            swift_bridgeObjectRelease(v35);
            sub_10003C2F0(v27, v23);
            swift_bridgeObjectRelease(v87);
            v22 = v88;
            if ((swift_isUniquelyReferenced_nonNull_native(v88) & 1) == 0)
            {
              sub_1000135E0();
              v22 = v43;
            }
            v39 = v22[2];
            v15 = v76;
            if (v39 >= v22[3] >> 1)
            {
              sub_1000135E0();
              v22 = v44;
            }
            v22[2] = v39 + 1;
            v40 = &v22[4 * v39];
            v41 = v89;
            v40[4] = v85;
            v40[5] = v41;
            v42 = v79;
            v40[6] = v37;
            v40[7] = v42;
          }
        }
        v21 += 9;
        --v20;
      }
      while (v20);
      v17 = swift_bridgeObjectRelease_n(v64, 2);
      v7 = v65;
    }
    else
    {
      v22 = _swiftEmptyArrayStorage;
    }
    v4 = v66;
  }
  else
  {
    v22 = _swiftEmptyArrayStorage;
  }
  v45 = v70;
  v46 = *(_QWORD *)(v70 + 304);
  __chkstk_darwin(v17);
  *(&v64 - 2) = (uint64_t)sub_100038954;
  *(&v64 - 1) = v46;
  swift_retain(v46);
  v47 = sub_100080C48((uint64_t)v22, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1000868F4);
  swift_bridgeObjectRelease(v22);
  swift_release(v46);
  v90[0] = v47;
  v48 = sub_10000738C(&qword_1000D1310);
  v49 = sub_10000738C(&qword_1000D1318);
  sub_100031668(&qword_1000D1320, &qword_1000D1310, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
  v51 = v50;
  sub_100031668(&qword_1000D1328, &qword_1000D1318, (uint64_t)&protocol conformance descriptor for [A]);
  v52 = v67;
  Publishers.MergeMany.init<A>(_:)(v90, v48, v49, v51, v53);
  sub_100031668(&qword_1000D1330, &qword_1000D12F0, (uint64_t)&protocol conformance descriptor for Publishers.MergeMany<A>);
  v54 = v71;
  v55 = v69;
  Publisher.collect()(v69, v56);
  (*(void (**)(char *, uint64_t))(v68 + 8))(v52, v55);
  sub_100082828(v45, (uint64_t)v90);
  v57 = swift_allocObject(&unk_1000C8FC8, 688, 7);
  v58 = v72;
  memcpy((void *)(v57 + 16), v72, 0x68uLL);
  memcpy((void *)(v57 + 120), v90, 0x238uLL);
  sub_100086A2C(v58);
  Activity = type metadata accessor for SubscriptionCreateActivityOperation.ActivityData(0);
  sub_100031668(&qword_1000D1338, &qword_1000D12F8, (uint64_t)&protocol conformance descriptor for Publishers.Collect<A>);
  v60 = v73;
  Publisher.map<A>(_:)(sub_100086A20, v57, v4, Activity);
  swift_release(v57);
  (*(void (**)(char *, uint64_t))(v74 + 8))(v54, v4);
  sub_100031668(&qword_1000D31C8, &qword_1000D31C0, (uint64_t)&protocol conformance descriptor for Publishers.Map<A, B>);
  v62 = Publisher.eraseToAnyPublisher()(v7, v61);
  (*(void (**)(char *, uint64_t))(v75 + 8))(v60, v7);
  return v62;
}

uint64_t sub_100084B30()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t Activity;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE v27[568];
  uint64_t v28;

  v23 = sub_10000738C(&qword_1000D31F0);
  v25 = *(_QWORD *)(v23 - 8);
  __chkstk_darwin(v23);
  v2 = (char *)&v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_10000738C(&qword_1000D31F8);
  v26 = *(_QWORD *)(v24 - 8);
  __chkstk_darwin(v24);
  v22 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100059884();
  v28 = v4;
  sub_100082828(v0, (uint64_t)v27);
  v5 = swift_allocObject(&unk_1000C8FF0, 584, 7);
  v6 = memcpy((void *)(v5 + 16), v27, 0x238uLL);
  v21 = static Subscribers.Demand.unlimited.getter(v6);
  v7 = sub_10000738C(&qword_1000D3200);
  v8 = sub_10000738C(&qword_1000D3208);
  v9 = sub_10000738C(&qword_1000D3210);
  sub_100031668(&qword_1000D3218, &qword_1000D3200, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
  v11 = v10;
  sub_100031668(&qword_1000D3220, &qword_1000D3210, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
  Publisher.flatMap<A, B>(maxPublishers:_:)(v21, sub_100086B18, v5, v7, v8, v9, v11, v12);
  swift_release(v5);
  swift_release(v28);
  Activity = type metadata accessor for SubscriptionCreateActivityOperation.ActivityData(0);
  sub_100031668(&qword_1000D3228, &qword_1000D31F0, (uint64_t)&protocol conformance descriptor for Publishers.FlatMap<A, B>);
  v15 = v22;
  v14 = v23;
  Publisher.map<A>(_:)(sub_100085CEC, 0, v23, Activity);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v2, v14);
  sub_100031668(&qword_1000D3230, &qword_1000D31F8, (uint64_t)&protocol conformance descriptor for Publishers.Map<A, B>);
  v16 = v24;
  v18 = Publisher.eraseToAnyPublisher()(v24, v17);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v15, v16);
  return v18;
}

uint64_t sub_100084DA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  __n128 v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  __n128 v26;
  uint64_t result;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t);
  uint64_t v31;
  __n128 v32;
  uint64_t v33;
  void *v34;
  __n128 v35;
  uint64_t v36;
  void (*v37)(char *, unint64_t, uint64_t);
  uint64_t v38;
  void *v39;
  void *v40;
  __n128 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __n128 v45;
  id v46;
  void *v47;
  void *v48;
  __n128 v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  NSString v58;
  NSString v59;
  unsigned __int8 v60;
  NSString v61;
  unsigned __int8 v62;
  NSString v63;
  _QWORD v64[3];
  void (*v65)(char *, uint64_t);
  void *v66;
  void (*v67)(char *, uint64_t);
  void (*v68)(char *, unint64_t, uint64_t);
  unint64_t v69;
  char *v70;
  char *v71;

  v0 = type metadata accessor for SportingEventSubscription.Competitor(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v70 = (char *)v64 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v5 = (char *)v64 - v4;
  __chkstk_darwin(v6);
  v8 = (char *)v64 - v7;
  __chkstk_darwin(v9);
  v11 = (char *)v64 - v10;
  v12 = sub_10000738C(&qword_1000D12C0);
  __chkstk_darwin(v12);
  v71 = (char *)v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v16 = (char *)v64 - v15;
  __chkstk_darwin(v17);
  v19 = (char *)v64 - v18;
  v21 = __chkstk_darwin(v20);
  v23 = (char *)v64 - v22;
  v24 = SportingEventSubscription.Metadata.competitors.getter(v21);
  v25 = *(_QWORD *)(v24 + 16);
  swift_bridgeObjectRelease(v24);
  if (v25 != 2)
    return 0;
  result = SportingEventSubscription.Metadata.competitors.getter(v26);
  if (!*(_QWORD *)(result + 16))
  {
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v28 = result;
  v69 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v68 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
  v68(v11, result + v69, v0);
  v29 = swift_bridgeObjectRelease(v28);
  SportingEventSubscription.Competitor.logoFilePaths.getter(v29);
  v30 = *(void (**)(char *, uint64_t))(v1 + 8);
  v30(v11, v0);
  v31 = type metadata accessor for SportingEventSubscription.Competitor.LogoFilePaths(0);
  if (sub_100009658((uint64_t)v23, 1, v31) == 1)
  {
    v33 = (uint64_t)v23;
LABEL_17:
    sub_100038C8C(v33, &qword_1000D12C0);
    return 0;
  }
  v67 = v30;
  v64[2] = SportingEventSubscription.Competitor.LogoFilePaths.defaultSize.getter(v32);
  v66 = v34;
  v65 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v31 - 8) + 8);
  v65(v23, v31);
  result = SportingEventSubscription.Metadata.competitors.getter(v35);
  if (!*(_QWORD *)(result + 16))
    goto LABEL_30;
  v36 = result;
  v37 = v68;
  v68(v8, result + v69, v0);
  v38 = swift_bridgeObjectRelease(v36);
  SportingEventSubscription.Competitor.logoFilePaths.getter(v38);
  v67(v8, v0);
  if (sub_100009658((uint64_t)v19, 1, v31) == 1)
  {
    swift_bridgeObjectRelease(v66);
    v33 = (uint64_t)v19;
    goto LABEL_17;
  }
  SportingEventSubscription.Competitor.LogoFilePaths.smallSize.getter();
  v40 = v39;
  v65(v19, v31);
  if (!v40)
  {
    v46 = v66;
    goto LABEL_13;
  }
  result = SportingEventSubscription.Metadata.competitors.getter(v41);
  if (*(_QWORD *)(result + 16) < 2uLL)
    goto LABEL_31;
  v42 = result;
  v43 = *(_QWORD *)(v1 + 72);
  v37(v5, result + v69 + v43, v0);
  v44 = swift_bridgeObjectRelease(v42);
  SportingEventSubscription.Competitor.logoFilePaths.getter(v44);
  v67(v5, v0);
  if (sub_100009658((uint64_t)v16, 1, v31) == 1)
  {
    swift_bridgeObjectRelease(v40);
    swift_bridgeObjectRelease(v66);
    v33 = (uint64_t)v16;
    goto LABEL_17;
  }
  v64[1] = SportingEventSubscription.Competitor.LogoFilePaths.defaultSize.getter(v45);
  v48 = v47;
  v65(v16, v31);
  result = SportingEventSubscription.Metadata.competitors.getter(v49);
  if (*(_QWORD *)(result + 16) >= 2uLL)
  {
    v50 = result;
    v51 = v70;
    v68(v70, result + v69 + v43, v0);
    v52 = swift_bridgeObjectRelease(v50);
    v53 = (uint64_t)v71;
    SportingEventSubscription.Competitor.logoFilePaths.getter(v52);
    v67(v51, v0);
    if (sub_100009658(v53, 1, v31) == 1)
    {
      swift_bridgeObjectRelease(v40);
      swift_bridgeObjectRelease(v48);
      swift_bridgeObjectRelease(v66);
      v33 = v53;
      goto LABEL_17;
    }
    SportingEventSubscription.Competitor.LogoFilePaths.smallSize.getter();
    v54 = v55;
    v65((char *)v53, v31);
    if (!v54)
    {
      swift_bridgeObjectRelease(v40);
      swift_bridgeObjectRelease(v48);
      swift_bridgeObjectRelease(v66);
      return (uint64_t)v54;
    }
    v56 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
    v57 = v66;
    v58 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v57);
    LOBYTE(v57) = objc_msgSend(v56, "fileExistsAtPath:", v58);

    if ((v57 & 1) != 0)
    {
      v59 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v40);
      v60 = objc_msgSend(v56, "fileExistsAtPath:", v59);

      if ((v60 & 1) != 0)
      {
        v61 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v48);
        v62 = objc_msgSend(v56, "fileExistsAtPath:", v61);

        if ((v62 & 1) != 0)
        {
          v63 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(v54);
          v54 = objc_msgSend(v56, "fileExistsAtPath:", v63);

          return (uint64_t)v54;
        }

        v46 = v54;
      }
      else
      {

        swift_bridgeObjectRelease(v54);
        v46 = v48;
      }
    }
    else
    {

      swift_bridgeObjectRelease(v54);
      swift_bridgeObjectRelease(v48);
      v46 = v40;
    }
LABEL_13:
    swift_bridgeObjectRelease(v46);
    return 0;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_100085370(__n128 a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  __n128 v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  char v19;
  uint64_t v20;

  v2 = SportingEventSubscription.Metadata.competitors.getter(a1);
  v3 = *(_QWORD *)(v2 + 16);
  result = swift_bridgeObjectRelease(v2);
  if (v3 != 2)
    return result;
  v5 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  v6 = sub_10000738C(&qword_1000D0510);
  v20 = type metadata accessor for SportingEventSubscription.Competitor(0);
  v7 = *(_QWORD *)(v20 - 8);
  v8 = *(_QWORD *)(v7 + 72);
  v9 = *(unsigned __int8 *)(v7 + 80);
  v10 = (v9 + 32) & ~v9;
  v11 = swift_allocObject(v6, v10 + 2 * v8, v9 | 7);
  *(_OWORD *)(v11 + 16) = xmmword_1000A06C0;
  result = SportingEventSubscription.Metadata.competitors.getter((__n128)xmmword_1000A06C0);
  if (!*(_QWORD *)(result + 16))
  {
    __break(1u);
    goto LABEL_10;
  }
  v12 = result;
  v13 = v11 + v10;
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  v14(v11 + v10, result + v10, v20);
  swift_bridgeObjectRelease(v12);
  result = SportingEventSubscription.Metadata.competitors.getter(v15);
  if (*(_QWORD *)(result + 16) < 2uLL)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  v16 = result;
  v14(v13 + v8, result + v10 + v8, v20);
  swift_bridgeObjectRelease(v16);
  v17 = 0;
  v18 = 0;
  do
  {
    v19 = v17;
    sub_100086428(v13 + v18 * v8, v5);
    if (v1)
      break;
    v17 = 1;
    v18 = 1;
  }
  while ((v19 & 1) == 0);

  return swift_bridgeObjectRelease(v11);
}

uint64_t sub_1000854DC@<X0>(const void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
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
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD *v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t result;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  unsigned int v78;
  uint64_t v79;
  char *v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  _QWORD *v86;
  uint64_t v87;
  _QWORD *v88;
  _QWORD v89[33];
  _QWORD v90[2];

  v66 = a2;
  v5 = type metadata accessor for TemplateImageUrl.ImageFormat(0);
  v82 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v81 = (char *)&v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_10000738C((uint64_t *)&unk_1000D16E0);
  __chkstk_darwin(v7);
  v80 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = type metadata accessor for URL(0);
  v76 = *(_QWORD *)(v79 - 8);
  __chkstk_darwin(v79);
  v75 = (char *)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_10000738C(&qword_1000D12F0);
  v68 = *(_QWORD *)(v10 - 8);
  v69 = v10;
  __chkstk_darwin(v10);
  v67 = (char *)&v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_10000738C(&qword_1000D12F8);
  v72 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v70 = (char *)&v62 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_10000738C(&qword_1000D3240);
  v73 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v71 = (char *)&v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = memcpy(v89, a1, sizeof(v89));
  v17 = v89[18];
  v90[0] = v89[18];
  v18 = *(_QWORD *)(v89[18] + 16);
  if (v18)
  {
    v63 = v12;
    v64 = v14;
    v65 = a3;
    v78 = enum case for TemplateImageUrl.ImageFormat.png(_:);
    swift_bridgeObjectRetain_n(v89[18], 2);
    v19 = (uint64_t *)(v17 + 88);
    v20 = _swiftEmptyArrayStorage;
    v74 = v5;
    do
    {
      v21 = *v19;
      if ((unint64_t)*v19 >= 3)
      {
        v86 = v20;
        v22 = *(v19 - 6);
        v23 = *(v19 - 2);
        v24 = *(v19 - 1);
        v25 = *(v19 - 4);
        v83 = *(v19 - 7);
        v84 = v23;
        swift_bridgeObjectRetain(v23);
        v87 = v22;
        swift_bridgeObjectRetain(v22);
        v85 = v25;
        swift_bridgeObjectRetain(v25);
        sub_10003C2D0(v24, v21);
        sub_10003C2D0(v24, v21);
        if (qword_1000CFB08 != -1)
          swift_once(&qword_1000CFB08, sub_10008225C);
        v26 = qword_1000D3110;
        v28 = v81;
        v27 = v82;
        (*(void (**)(char *, _QWORD, uint64_t))(v82 + 104))(v81, v78, v5);
        v29 = v80;
        static TemplateImageUrl.imageUrl(templateUrl:width:height:format:)(v24, v21, v26, v26, v28);
        sub_10003C2E0(v24, v21);
        v30 = (uint64_t)v29;
        (*(void (**)(char *, uint64_t))(v27 + 8))(v28, v5);
        v31 = (uint64_t)v29;
        v32 = v79;
        if (sub_100009658(v31, 1, v79) == 1)
        {
          sub_100038C8C(v30, (uint64_t *)&unk_1000D16E0);
          swift_bridgeObjectRelease(v84);
          swift_bridgeObjectRelease(v85);
          swift_bridgeObjectRelease(v87);
          sub_10003C2E0(v24, v21);
          v20 = v86;
        }
        else
        {
          v33 = v75;
          v34 = v76;
          (*(void (**)(char *, uint64_t, uint64_t))(v76 + 32))(v75, v30, v32);
          v35 = v87;
          swift_bridgeObjectRetain(v87);
          v37 = URL.absoluteString.getter(v36);
          v77 = v38;
          (*(void (**)(char *, uint64_t))(v34 + 8))(v33, v32);
          swift_bridgeObjectRelease(v84);
          swift_bridgeObjectRelease(v85);
          swift_bridgeObjectRelease(v35);
          sub_10003C2E0(v24, v21);
          v20 = v86;
          if ((swift_isUniquelyReferenced_nonNull_native(v86) & 1) == 0)
          {
            sub_1000135E0();
            v20 = v43;
          }
          v39 = v20[2];
          if (v39 >= v20[3] >> 1)
          {
            sub_1000135E0();
            v20 = v44;
          }
          v20[2] = v39 + 1;
          v40 = &v20[4 * v39];
          v41 = v87;
          v40[4] = v83;
          v40[5] = v41;
          v42 = v77;
          v40[6] = v37;
          v40[7] = v42;
          v5 = v74;
        }
      }
      v19 += 9;
      --v18;
    }
    while (v18);
    sub_100054470(v90);
    v16 = sub_100054470(v90);
    v14 = v64;
    a3 = v65;
    v12 = v63;
  }
  else
  {
    v20 = _swiftEmptyArrayStorage;
  }
  v45 = *(_QWORD *)(v66 + 304);
  __chkstk_darwin(v16);
  *(&v62 - 2) = (uint64_t)sub_100087F30;
  *(&v62 - 1) = v45;
  swift_retain(v45);
  v46 = sub_100080C48((uint64_t)v20, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_100087F24);
  swift_bridgeObjectRelease(v20);
  swift_release(v45);
  v88 = v46;
  v47 = sub_10000738C(&qword_1000D1310);
  v48 = sub_10000738C(&qword_1000D1318);
  sub_100031668(&qword_1000D1320, &qword_1000D1310, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
  v50 = v49;
  sub_100031668(&qword_1000D1328, &qword_1000D1318, (uint64_t)&protocol conformance descriptor for [A]);
  v51 = v67;
  Publishers.MergeMany.init<A>(_:)(&v88, v47, v48, v50, v52);
  sub_100031668(&qword_1000D1330, &qword_1000D12F0, (uint64_t)&protocol conformance descriptor for Publishers.MergeMany<A>);
  v53 = v69;
  v54 = v70;
  Publisher.collect()(v69, v55);
  (*(void (**)(char *, uint64_t))(v68 + 8))(v51, v53);
  v56 = swift_allocObject(&unk_1000C9018, 280, 7);
  memcpy((void *)(v56 + 16), v89, 0x108uLL);
  sub_100086BCC(v89);
  v57 = sub_10000738C(&qword_1000D3208);
  sub_100031668(&qword_1000D1338, &qword_1000D12F8, (uint64_t)&protocol conformance descriptor for Publishers.Collect<A>);
  v58 = v71;
  Publisher.map<A>(_:)(sub_100086BC4, v56, v12, v57);
  swift_release(v56);
  (*(void (**)(char *, uint64_t))(v72 + 8))(v54, v12);
  sub_100031668(&qword_1000D3248, &qword_1000D3240, (uint64_t)&protocol conformance descriptor for Publishers.Map<A, B>);
  v60 = Publisher.eraseToAnyPublisher()(v14, v59);
  result = (*(uint64_t (**)(char *, uint64_t))(v73 + 8))(v58, v14);
  *a3 = v60;
  return result;
}

double sub_100085B74@<D0>(uint64_t *a1@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  double result;

  v5 = *a1;
  memcpy(a3, a2, 0x108uLL);
  a3[33] = v5;
  sub_100086BCC(a2);
  *(_QWORD *)&result = swift_bridgeObjectRetain(v5).n128_u64[0];
  return result;
}

void sub_100085BBC(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  uint64_t Activity;
  _QWORD __dst[21];
  _BYTE v18[24];

  v6 = type metadata accessor for Sport(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)__dst - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  memcpy(__dst, a1, sizeof(__dst));
  v10 = __dst[17];
  if (__dst[17])
    v11 = __dst[16];
  else
    v11 = 0;
  sub_100086E1C((uint64_t)&__dst[14], (uint64_t)v18, &qword_1000D3238);
  sub_10002834C((uint64_t)v18);
  swift_bridgeObjectRetain(v10);
  v12 = Sport.init(rawValue:)(v11);
  v13 = Sport.rawValue.getter(v12);
  v15 = v14;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  Activity = type metadata accessor for SubscriptionCreateActivityOperation.ActivityData(0);
  sub_10003BCA8(a1, a2, a3 + *(int *)(Activity + 24));
  sub_100086E1C((uint64_t)v18, a3, &qword_1000D3238);
  *(_QWORD *)(a3 + 16) = v13;
  *(_QWORD *)(a3 + 24) = v15;
}

void sub_100085CEC(uint64_t *__src@<X0>, uint64_t a2@<X8>)
{
  _QWORD __dst[33];

  memcpy(__dst, __src, sizeof(__dst));
  sub_100085BBC(__dst, __src[33], a2);
}

uint64_t sub_100085D3C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X2>, char *a4@<X8>)
{
  uint64_t v8;
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
  _QWORD *v21;
  uint64_t v22;
  __n128 v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  void (*v42)(char *, uint64_t, __n128);
  __n128 v43;
  char *v44;
  uint64_t Activity;
  _QWORD *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  _BYTE v55[16];
  uint64_t v56;
  uint64_t v57;
  double v58;
  char v59;

  v8 = type metadata accessor for SportingEventSubscription.Metadata(0);
  v51 = *(_QWORD *)(v8 - 8);
  v52 = v8;
  __chkstk_darwin(v8);
  v54 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Date(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v16 = (char *)&v47 - v15;
  __chkstk_darwin(v17);
  v19 = (char *)&v47 - v18;
  v20 = *a1;
  sub_100086E1C((uint64_t)(a2 + 6), (uint64_t)&v56, &qword_1000D1D60);
  sub_100086E1C((uint64_t)&v56, (uint64_t)&v57, &qword_1000D1D60);
  v22 = v57;
  if (v57)
  {
    swift_bridgeObjectRetain(v20);
    sub_10005440C(&v56);
    v47 = sub_100080D40(v22, v20);
    v21 = sub_100054470(&v56);
  }
  else
  {
    v47 = _swiftEmptyArrayStorage;
  }
  Date.init()(v21);
  sub_100086E1C((uint64_t)a2, (uint64_t)v55, &qword_1000D1490);
  sub_100086E1C((uint64_t)v55, (uint64_t)&v58, &qword_1000D1490);
  if ((v59 & 1) == 0)
  {
    v23.n128_f64[0] = v58 / 1000.0;
    Date.init(timeIntervalSince1970:)(v23);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v19, v10);
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v19, v16, v10);
  }
  v24 = a3[61];
  v25 = a3[59] == 1 || v24 == 1;
  v53 = a4;
  if (v25)
  {
    v26 = 0;
    v24 = 0;
  }
  else
  {
    v26 = a3[60];
    v23 = swift_bridgeObjectRetain(v24);
  }
  (*(void (**)(char *, char *, uint64_t, __n128))(v11 + 16))(v13, v19, v10, v23);
  v27 = a2[3];
  v50 = v10;
  if (v27)
  {
    v28 = a2[2];
    v29 = v27;
  }
  else
  {
    v28 = 0;
    v29 = 0xE000000000000000;
  }
  v48 = v19;
  v49 = v11;
  v30 = a2[5];
  v31 = v13;
  if (v30)
  {
    v32 = a2[4];
    v33 = a2[5];
  }
  else
  {
    v32 = 0;
    v33 = 0xE000000000000000;
  }
  if (v24)
    v34 = v26;
  else
    v34 = 0;
  v35 = 0xE000000000000000;
  if (!v24)
    v24 = 0xE000000000000000;
  swift_bridgeObjectRetain(v27);
  swift_bridgeObjectRetain(v30);
  SportingEventSubscription.Metadata.init(eventStartDate:competitors:preGameTitle:shortTitle:eventURL:)(v31, v47, v28, v29, v32, v33, v34, v24);
  v36 = a2[10];
  if (v36)
  {
    v37 = a2[9];
    v35 = a2[10];
  }
  else
  {
    v37 = 0;
  }
  v38 = v48;
  v39 = a2[8];
  if (v39)
  {
    v40 = a2[7];
    v41 = a2[8];
  }
  else
  {
    v40 = 0;
    v41 = 0xE000000000000000;
  }
  v42 = *(void (**)(char *, uint64_t, __n128))(v49 + 8);
  swift_bridgeObjectRetain(v36);
  v43 = swift_bridgeObjectRetain(v39);
  v42(v38, v50, v43);
  v44 = v53;
  *(_QWORD *)v53 = v37;
  *((_QWORD *)v44 + 1) = v35;
  *((_QWORD *)v44 + 2) = v40;
  *((_QWORD *)v44 + 3) = v41;
  Activity = type metadata accessor for SubscriptionCreateActivityOperation.ActivityData(0);
  return (*(uint64_t (**)(char *, char *, uint64_t))(v51 + 32))(&v44[*(int *)(Activity + 24)], v54, v52);
}

void sub_100086074(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;

  v54 = a3;
  v46 = type metadata accessor for LogoDownloadResult(0);
  v5 = *(_QWORD *)(v46 - 8);
  __chkstk_darwin(v46);
  v7 = (char **)((char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v8);
  v47 = (uint64_t)&v45 - v9;
  v10 = sub_10000738C(&qword_1000D12C0);
  __chkstk_darwin(v10);
  v53 = (uint64_t)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v14 = (char *)&v45 - v13;
  __chkstk_darwin(v15);
  v17 = (char *)&v45 - v16;
  v18 = *a1;
  v19 = a1[1];
  v20 = a1[2];
  v48 = a1[3];
  v49 = v20;
  v55 = a1[4];
  v56 = a1[5];
  v21 = a1[7];
  v50 = a1[6];
  v51 = v21;
  v52 = *((unsigned __int8 *)a1 + 64);
  v22 = *(_QWORD *)(a2 + 16);
  if (v22)
  {
    v45 = (char *)&v45 - v16;
    v23 = a2 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    v24 = *(_QWORD *)(v5 + 72);
    swift_bridgeObjectRetain(a2);
    while (1)
    {
      sub_100086A9C(v23, (uint64_t)v7, type metadata accessor for LogoDownloadResult);
      v25 = v7[1];
      v26 = *v7 == v18 && v25 == v19;
      if (v26 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v7, v25, v18, v19, 0) & 1) != 0)
        break;
      sub_100038708((uint64_t)v7, type metadata accessor for LogoDownloadResult);
      v23 += v24;
      if (!--v22)
      {
        swift_bridgeObjectRelease(a2);
        v17 = v45;
        goto LABEL_10;
      }
    }
    swift_bridgeObjectRelease(a2);
    v30 = v47;
    sub_10003C40C((uint64_t)v7, v47);
    v31 = v30 + *(int *)(v46 + 24);
    v32 = type metadata accessor for SportingEventSubscription.Competitor.LogoFilePaths(0);
    v17 = v45;
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 16))(v45, v31, v32);
    sub_100038708(v30, type metadata accessor for LogoDownloadResult);
    v28 = (uint64_t)v17;
    v29 = 0;
    v27 = v32;
  }
  else
  {
LABEL_10:
    v27 = type metadata accessor for SportingEventSubscription.Competitor.LogoFilePaths(0);
    v28 = (uint64_t)v17;
    v29 = 1;
  }
  sub_10000964C(v28, v29, 1, v27);
  v33 = v56;
  v34 = v48;
  swift_bridgeObjectRetain(v19);
  swift_bridgeObjectRetain(v34);
  if (v33 >= 2)
  {
    sub_100023F64(v55, v33);
  }
  else
  {
    sub_10003C2F0(v55, v33);
    v55 = 0;
    v56 = 0xE000000000000000;
  }
  sub_10003C384((uint64_t)v17, (uint64_t)v14);
  v35 = type metadata accessor for SportingEventSubscription.Competitor.LogoFilePaths(0);
  v36 = (uint64_t)v17;
  if (sub_100009658((uint64_t)v14, 1, v35) == 1)
  {
    sub_100038C8C((uint64_t)v14, &qword_1000D12C0);
    v37 = 0;
    v38 = 0;
  }
  else
  {
    v37 = SportingEventSubscription.Competitor.LogoFilePaths.defaultSize.getter();
    v38 = v39;
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v35 - 8) + 8))(v14, v35);
  }
  v40 = 0xE000000000000000;
  if (v34)
    v41 = v34;
  else
    v41 = 0xE000000000000000;
  if (v34)
    v42 = v49;
  else
    v42 = 0;
  v43 = v53;
  sub_10003C384(v36, v53);
  if (v51)
    v44 = v50;
  else
    v44 = 0;
  if (v51)
    v40 = v51;
  swift_bridgeObjectRetain(v51);
  SportingEventSubscription.Competitor.init(canonicalId:abbreviation:name:teamLogoUrl:localLogoUrl:logoFilePaths:teamColorHex:isHome:ordinal:)(v18, v19, v42, v41, 0, 0xE000000000000000, v55, v56, v37, v38, v43, v44, v40, v52 & 1, 0);
  sub_100038C8C(v36, &qword_1000D12C0);
}

void sub_100086428(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  __n128 v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  _OWORD *v26;
  Class isa;
  NSString v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _OWORD *v32;
  Class v33;
  NSString v34;
  unsigned __int8 v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  id v46;

  v44 = a2;
  v3 = sub_10000738C(&qword_1000D12C0);
  __chkstk_darwin(v3);
  v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v8 = (char *)&v40 - v7;
  v9 = sub_10000738C(&qword_1000D31D0);
  v10 = *(_QWORD *)(sub_10000738C(&qword_1000D31D8) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = *(unsigned __int8 *)(v10 + 80);
  v13 = (v12 + 32) & ~v12;
  v14 = swift_allocObject(v9, v13 + v11, v12 | 7);
  *(_OWORD *)(v14 + 16) = xmmword_10009FDB0;
  *(_QWORD *)(v14 + v13) = NSFileModificationDate;
  Date.init()(NSFileModificationDate);
  type metadata accessor for FileAttributeKey(0);
  v16 = v15;
  type metadata accessor for Date(0);
  v17 = sub_100086AD4();
  v18 = Dictionary.init(dictionaryLiteral:)(v14, v16);
  v42 = a1;
  SportingEventSubscription.Competitor.logoFilePaths.getter(v18);
  v19 = type metadata accessor for SportingEventSubscription.Competitor.LogoFilePaths(0);
  v20 = sub_100009658((uint64_t)v8, 1, v19);
  v40 = v17;
  v41 = v16;
  v43 = v18;
  if (v20 == 1)
  {
    sub_100038C8C((uint64_t)v8, &qword_1000D12C0);
    v23 = v44;
  }
  else
  {
    SportingEventSubscription.Competitor.LogoFilePaths.defaultSize.getter(v21);
    v25 = v24;
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(v8, v19);
    v26 = sub_100081D6C(v18);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v26);
    v28 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v25);
    v46 = 0;
    v23 = v44;
    LODWORD(v25) = objc_msgSend(v44, "setAttributes:ofItemAtPath:error:", isa, v28, &v46, v40, v41);

    v22 = v46;
    if (!(_DWORD)v25)
    {
      v37 = v22;
      swift_bridgeObjectRelease(v43);
LABEL_10:
      v38 = _convertNSErrorToError(_:)(v37);

      v45 = v38;
      swift_willThrow(v39);
      return;
    }
  }
  SportingEventSubscription.Competitor.logoFilePaths.getter(v22);
  if (sub_100009658((uint64_t)v5, 1, v19) == 1)
  {
    swift_bridgeObjectRelease(v43);
    sub_100038C8C((uint64_t)v5, &qword_1000D12C0);
    return;
  }
  SportingEventSubscription.Competitor.LogoFilePaths.smallSize.getter();
  v30 = v29;
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(v5, v19);
  v31 = v43;
  if (v30)
  {
    v32 = sub_100081D6C(v43);
    swift_bridgeObjectRelease(v31);
    v33 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v32);
    v34 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v30);
    v46 = 0;
    v35 = objc_msgSend(v23, "setAttributes:ofItemAtPath:error:", v33, v34, &v46);

    v36 = v46;
    if ((v35 & 1) != 0)
      return;
    v37 = v36;
    goto LABEL_10;
  }
  swift_bridgeObjectRelease(v43);
}

uint64_t sub_1000867D4()
{
  uint64_t v0;

  sub_1000754A0();
  swift_errorRelease(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

void sub_1000867FC()
{
  uint64_t v0;

  (*(void (**)(_QWORD, uint64_t))(v0 + 16))(*(_QWORD *)(v0 + 32), 1);
  sub_100006200();
}

uint64_t sub_100086824(uint64_t a1, unint64_t a2)
{
  if (a2 - 9 >= 2)
    return sub_100086838(a1, a2);
  return a1;
}

uint64_t sub_100086838(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 9)
    return swift_bridgeObjectRelease(a2);
  return result;
}

uint64_t sub_10008684C()
{
  uint64_t v0;

  sub_1000754A0();
  if (*(_QWORD *)(v0 + 40) >= 9uLL)
    swift_bridgeObjectRelease();
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10008687C(uint64_t a1)
{
  uint64_t v1;

  return sub_100083810(a1, *(void (**)(uint64_t, uint64_t))(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_100086888(uint64_t a1, unint64_t a2)
{
  if (a2 - 9 >= 2)
    return sub_10008689C(a1, a2);
  return a1;
}

uint64_t sub_10008689C(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 9)
    return swift_bridgeObjectRetain(a2);
  return result;
}

uint64_t sub_1000868B4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_100083EDC(a1, v2 + 16, a2);
}

uint64_t type metadata accessor for SubscriptionCreateActivityOperation.ActivityData(uint64_t a1)
{
  uint64_t result;

  result = qword_1000D32D0;
  if (!qword_1000D32D0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SubscriptionCreateActivityOperation.ActivityData);
  return result;
}

void sub_1000868F4()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 16))();
  sub_100006200();
}

uint64_t sub_100086910()
{
  _QWORD *v0;
  char v1;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100007618(v0 + 15);
  swift_release(v0[20]);
  swift_release(v0[21]);
  sub_100007618(v0 + 22);
  sub_100007618(v0 + 27);
  sub_100007618(v0 + 32);
  swift_release(v0[37]);
  sub_100007618(v0 + 38);
  sub_100007618(v0 + 43);
  sub_100007618(v0 + 48);
  swift_release(v0[53]);
  sub_100007618(v0 + 54);
  sub_1000880CC();
  if (!v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100088190();
    sub_10008805C();
    sub_100088054();
    sub_100088188();
  }
  if (v0[74] != 1)
  {
    swift_bridgeObjectRelease();
    if (v0[76] != 1)
      swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release(v0[85]);
  return swift_deallocObject(v0, 688, 7);
}

uint64_t sub_100086A20@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;

  return sub_100085D3C(a1, (_QWORD *)(v2 + 16), (_QWORD *)(v2 + 120), a2);
}

_QWORD *sub_100086A2C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = a1[3];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[8];
  v6 = a1[10];
  swift_bridgeObjectRetain(a1[12]);
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  return a1;
}

void sub_100086A9C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = a3(0);
  sub_100038D64(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  sub_100006200();
}

unint64_t sub_100086AD4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000CFBE0;
  if (!qword_1000CFBE0)
  {
    type metadata accessor for FileAttributeKey(255);
    result = swift_getWitnessTable(&unk_10009FBF4, v1);
    atomic_store(result, (unint64_t *)&qword_1000CFBE0);
  }
  return result;
}

uint64_t sub_100086B18@<X0>(const void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_1000854DC(a1, v2 + 16, a2);
}

uint64_t sub_100086B20()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease(v0[3]);
  swift_bridgeObjectRelease(v0[5]);
  swift_bridgeObjectRelease(v0[7]);
  swift_bridgeObjectRelease(v0[9]);
  swift_bridgeObjectRelease(v0[13]);
  swift_bridgeObjectRelease(v0[15]);
  swift_bridgeObjectRelease(v0[17]);
  swift_bridgeObjectRelease(v0[19]);
  swift_bridgeObjectRelease(v0[20]);
  swift_bridgeObjectRelease(v0[22]);
  v1 = v0[25];
  if (v1 != 1)
  {
    swift_bridgeObjectRelease(v1);
    swift_bridgeObjectRelease(v0[27]);
    swift_bridgeObjectRelease(v0[30]);
    swift_bridgeObjectRelease(v0[32]);
  }
  v2 = v0[34];
  if (v2 != 1)
    swift_bridgeObjectRelease(v2);
  return swift_deallocObject(v0, 280, 7);
}

double sub_100086BC4@<D0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_100085B74(a1, (_QWORD *)(v2 + 16), a2);
}

_QWORD *sub_100086BCC(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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

  v2 = a1[1];
  v3 = a1[3];
  v4 = a1[5];
  v5 = a1[7];
  v6 = a1[11];
  v7 = a1[13];
  v8 = a1[15];
  v12 = a1[17];
  v13 = a1[18];
  v20 = a1[22];
  v21 = a1[21];
  v18 = a1[24];
  v19 = a1[23];
  v16 = a1[26];
  v17 = a1[25];
  v9 = a1[29];
  v14 = a1[28];
  v15 = a1[27];
  v10 = a1[30];
  v23 = a1[31];
  v22 = a1[32];
  swift_bridgeObjectRetain(a1[20]);
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRetain(v13);
  sub_10005F37C(v21, v20, v19, v18, v17, v16, v15, v14, v9, v10);
  sub_100023F64(v23, v22);
  return a1;
}

uint64_t sub_100086CF0()
{
  return sub_100082950(592);
}

uint64_t sub_100086CF8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100084134(a1, a2, v2 + 16, *(_QWORD *)(v2 + 584));
}

uint64_t sub_100086D04()
{
  _QWORD *v0;
  char v1;

  swift_unknownObjectRelease(v0[2]);
  sub_100007618(v0 + 4);
  swift_release(v0[9]);
  swift_release(v0[10]);
  sub_100087FC4();
  sub_100087F9C();
  sub_100007618(v0 + 43);
  if (v0[52] != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1000880E8();
    sub_1000880E0();
    sub_1000880D8();
    swift_bridgeObjectRelease();
  }
  sub_1000880CC();
  if (!v1)
  {
    swift_bridgeObjectRelease();
    if (v0[65] != 1)
      swift_bridgeObjectRelease();
  }
  sub_10008805C();
  sub_100088054();
  sub_100088188();
  swift_release(v0[74]);
  swift_release(v0[76]);
  return swift_deallocObject(v0, 624, 7);
}

uint64_t sub_100086DB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_100088100();
  v2 = *(_QWORD *)(v0 + 616);
  v3 = (_QWORD *)swift_task_alloc(dword_1000D326C);
  *(_QWORD *)(v1 + 16) = v3;
  v4 = sub_1000734C4(v3);
  return sub_10008425C(v4, v5, v6, v7, v8, v9, v2);
}

void sub_100086E1C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = sub_10000738C(a3);
  sub_100038D64(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  sub_100006200();
}

uint64_t *sub_100086E54(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v12 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain(v12);
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    v7 = *(int *)(a3 + 24);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = type metadata accessor for SportingEventSubscription.Metadata(0);
    v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    swift_bridgeObjectRetain(v5);
    swift_bridgeObjectRetain(v6);
    v11(v8, v9, v10);
  }
  return v3;
}

uint64_t sub_100086F08(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 24));
  v4 = a1 + *(int *)(a2 + 24);
  v5 = type metadata accessor for SportingEventSubscription.Metadata(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_100086F58(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for SportingEventSubscription.Metadata(0);
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  v10(v7, v8, v9);
  return a1;
}

_QWORD *sub_100086FE0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  *a1 = *a2;
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[2] = a2[2];
  v8 = a2[3];
  v9 = a1[3];
  a1[3] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  v10 = *(int *)(a3 + 24);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = type metadata accessor for SportingEventSubscription.Metadata(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

_OWORD *sub_10008707C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 24);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = type metadata accessor for SportingEventSubscription.Metadata(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

_QWORD *sub_1000870D8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v6 = a2[1];
  v7 = a1[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease(v7);
  v8 = a2[3];
  v9 = a1[3];
  a1[2] = a2[2];
  a1[3] = v8;
  swift_bridgeObjectRelease(v9);
  v10 = *(int *)(a3 + 24);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = type metadata accessor for SportingEventSubscription.Metadata(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  return a1;
}

uint64_t sub_100087154(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100087160);
}

uint64_t sub_100087160(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = type metadata accessor for SportingEventSubscription.Metadata(0);
    return sub_100009658(a1 + *(int *)(a3 + 24), a2, v9);
  }
}

uint64_t sub_1000871E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000871EC);
}

uint64_t sub_1000871EC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)(result + 8) = a2;
  }
  else
  {
    v7 = type metadata accessor for SportingEventSubscription.Metadata(0);
    return sub_10000964C(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t sub_100087258(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  v4[0] = &unk_1000A48B0;
  v4[1] = &unk_1000A48B0;
  result = type metadata accessor for SportingEventSubscription.Metadata(319);
  if (v3 <= 0x3F)
  {
    v4[2] = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 256, 3, v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t destroy for SubscriptionCreateActivityOperation(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_100007618(a1);
  swift_release(a1[5]);
  swift_release(a1[6]);
  sub_100007618(a1 + 7);
  sub_100007618(a1 + 12);
  sub_100007618(a1 + 17);
  swift_release(a1[22]);
  sub_100007618(a1 + 23);
  sub_100007618(a1 + 28);
  sub_100007618(a1 + 33);
  swift_release(a1[38]);
  sub_100007618(a1 + 39);
  v2 = a1[48];
  if (v2 != 1)
  {
    swift_bridgeObjectRelease(v2);
    swift_bridgeObjectRelease(a1[50]);
    swift_bridgeObjectRelease(a1[51]);
    swift_bridgeObjectRelease(a1[53]);
    swift_bridgeObjectRelease(a1[55]);
    swift_bridgeObjectRelease(a1[57]);
  }
  v3 = a1[59];
  if (v3 != 1)
  {
    swift_bridgeObjectRelease(v3);
    v4 = a1[61];
    if (v4 != 1)
      swift_bridgeObjectRelease(v4);
  }
  swift_bridgeObjectRelease(a1[64]);
  swift_bridgeObjectRelease(a1[66]);
  swift_bridgeObjectRelease(a1[68]);
  return swift_release(a1[70]);
}

uint64_t initializeWithCopy for SubscriptionCreateActivityOperation(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t, uint64_t);
  _QWORD *v22;
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
  __int128 v33;
  _OWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = *(_QWORD *)(a2 + 40);
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = v5;
  *(_QWORD *)(a1 + 48) = v6;
  v7 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v7;
  v8 = v7;
  v9 = **(void (***)(uint64_t, uint64_t, uint64_t))(v7 - 8);
  swift_retain(v5);
  swift_retain(v6);
  v9(a1 + 56, a2 + 56, v8);
  v10 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 120) = v10;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 96, a2 + 96);
  v11 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 160) = v11;
  (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 136, a2 + 136);
  v12 = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 176) = v12;
  v13 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 208) = v13;
  v14 = v13;
  v15 = **(void (***)(uint64_t, uint64_t, uint64_t))(v13 - 8);
  swift_retain(v12);
  v15(a1 + 184, a2 + 184, v14);
  v16 = *(_OWORD *)(a2 + 248);
  *(_OWORD *)(a1 + 248) = v16;
  (**(void (***)(uint64_t, uint64_t))(v16 - 8))(a1 + 224, a2 + 224);
  v17 = *(_OWORD *)(a2 + 288);
  *(_OWORD *)(a1 + 288) = v17;
  (**(void (***)(uint64_t, uint64_t))(v17 - 8))(a1 + 264, a2 + 264);
  v18 = *(_QWORD *)(a2 + 304);
  *(_QWORD *)(a1 + 304) = v18;
  v19 = *(_OWORD *)(a2 + 336);
  *(_OWORD *)(a1 + 336) = v19;
  v20 = v19;
  v21 = **(void (***)(uint64_t, uint64_t, uint64_t))(v19 - 8);
  swift_retain(v18);
  v21(a1 + 312, a2 + 312, v20);
  *(_BYTE *)(a1 + 352) = *(_BYTE *)(a2 + 352);
  v22 = (_QWORD *)(a2 + 360);
  v23 = *(_QWORD *)(a2 + 384);
  if (v23 == 1)
  {
    memcpy((void *)(a1 + 360), v22, 0x68uLL);
  }
  else
  {
    *(_QWORD *)(a1 + 360) = *v22;
    *(_BYTE *)(a1 + 368) = *(_BYTE *)(a2 + 368);
    *(_QWORD *)(a1 + 376) = *(_QWORD *)(a2 + 376);
    *(_QWORD *)(a1 + 384) = v23;
    v24 = *(_QWORD *)(a2 + 400);
    *(_QWORD *)(a1 + 392) = *(_QWORD *)(a2 + 392);
    *(_QWORD *)(a1 + 400) = v24;
    v26 = *(_QWORD *)(a2 + 408);
    v25 = *(_QWORD *)(a2 + 416);
    *(_QWORD *)(a1 + 408) = v26;
    *(_QWORD *)(a1 + 416) = v25;
    v28 = *(_QWORD *)(a2 + 424);
    v27 = *(_QWORD *)(a2 + 432);
    *(_QWORD *)(a1 + 424) = v28;
    *(_QWORD *)(a1 + 432) = v27;
    v30 = *(_QWORD *)(a2 + 440);
    v29 = *(_QWORD *)(a2 + 448);
    *(_QWORD *)(a1 + 440) = v30;
    *(_QWORD *)(a1 + 448) = v29;
    v31 = *(_QWORD *)(a2 + 456);
    *(_QWORD *)(a1 + 456) = v31;
    swift_bridgeObjectRetain(v23);
    swift_bridgeObjectRetain(v24);
    swift_bridgeObjectRetain(v26);
    swift_bridgeObjectRetain(v28);
    swift_bridgeObjectRetain(v30);
    swift_bridgeObjectRetain(v31);
  }
  v32 = *(_QWORD *)(a2 + 472);
  if (v32 == 1)
  {
    v33 = *(_OWORD *)(a2 + 480);
    *(_OWORD *)(a1 + 464) = *(_OWORD *)(a2 + 464);
    *(_OWORD *)(a1 + 480) = v33;
  }
  else
  {
    *(_QWORD *)(a1 + 464) = *(_QWORD *)(a2 + 464);
    *(_QWORD *)(a1 + 472) = v32;
    v34 = (_OWORD *)(a2 + 480);
    v35 = *(_QWORD *)(a2 + 488);
    swift_bridgeObjectRetain(v32);
    if (v35 == 1)
    {
      *(_OWORD *)(a1 + 480) = *v34;
    }
    else
    {
      *(_QWORD *)(a1 + 480) = *(_QWORD *)v34;
      *(_QWORD *)(a1 + 488) = v35;
      swift_bridgeObjectRetain(v35);
    }
  }
  *(_BYTE *)(a1 + 496) = *(_BYTE *)(a2 + 496);
  v36 = *(_QWORD *)(a2 + 512);
  *(_QWORD *)(a1 + 504) = *(_QWORD *)(a2 + 504);
  *(_QWORD *)(a1 + 512) = v36;
  *(_QWORD *)(a1 + 520) = *(_QWORD *)(a2 + 520);
  v37 = *(_QWORD *)(a2 + 528);
  *(_QWORD *)(a1 + 528) = v37;
  *(_QWORD *)(a1 + 536) = *(_QWORD *)(a2 + 536);
  v38 = *(_QWORD *)(a2 + 544);
  *(_QWORD *)(a1 + 544) = v38;
  *(_BYTE *)(a1 + 552) = *(_BYTE *)(a2 + 552);
  v39 = *(_QWORD *)(a2 + 560);
  *(_QWORD *)(a1 + 560) = v39;
  swift_bridgeObjectRetain(v36);
  swift_bridgeObjectRetain(v37);
  swift_bridgeObjectRetain(v38);
  swift_retain(v39);
  return a1;
}

uint64_t assignWithCopy for SubscriptionCreateActivityOperation(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *v13;
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
  __int128 *v29;
  __int128 *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
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
  uint64_t v45;

  sub_100009F58((_QWORD *)a1, (_QWORD *)a2);
  v4 = *(_QWORD *)(a2 + 40);
  v5 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v4;
  swift_retain(v4);
  swift_release(v5);
  v6 = *(_QWORD *)(a2 + 48);
  v7 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v6;
  swift_retain(v6);
  swift_release(v7);
  sub_100009F58((_QWORD *)(a1 + 56), (_QWORD *)(a2 + 56));
  sub_100009F58((_QWORD *)(a1 + 96), (_QWORD *)(a2 + 96));
  sub_100009F58((_QWORD *)(a1 + 136), (_QWORD *)(a2 + 136));
  v8 = *(_QWORD *)(a2 + 176);
  v9 = *(_QWORD *)(a1 + 176);
  *(_QWORD *)(a1 + 176) = v8;
  swift_retain(v8);
  swift_release(v9);
  sub_100009F58((_QWORD *)(a1 + 184), (_QWORD *)(a2 + 184));
  sub_100009F58((_QWORD *)(a1 + 224), (_QWORD *)(a2 + 224));
  sub_100009F58((_QWORD *)(a1 + 264), (_QWORD *)(a2 + 264));
  v10 = *(_QWORD *)(a2 + 304);
  v11 = *(_QWORD *)(a1 + 304);
  *(_QWORD *)(a1 + 304) = v10;
  swift_retain(v10);
  swift_release(v11);
  sub_100009F58((_QWORD *)(a1 + 312), (_QWORD *)(a2 + 312));
  *(_BYTE *)(a1 + 352) = *(_BYTE *)(a2 + 352);
  v12 = (_QWORD *)(a1 + 360);
  v13 = (uint64_t *)(a2 + 360);
  v14 = *(_QWORD *)(a2 + 384);
  if (*(_QWORD *)(a1 + 384) == 1)
  {
    if (v14 != 1)
    {
      v15 = *v13;
      *(_BYTE *)(a1 + 368) = *(_BYTE *)(a2 + 368);
      *v12 = v15;
      *(_QWORD *)(a1 + 376) = *(_QWORD *)(a2 + 376);
      v16 = *(_QWORD *)(a2 + 384);
      *(_QWORD *)(a1 + 384) = v16;
      *(_QWORD *)(a1 + 392) = *(_QWORD *)(a2 + 392);
      v17 = *(_QWORD *)(a2 + 400);
      *(_QWORD *)(a1 + 400) = v17;
      v18 = *(_QWORD *)(a2 + 408);
      *(_QWORD *)(a1 + 408) = v18;
      *(_QWORD *)(a1 + 416) = *(_QWORD *)(a2 + 416);
      v19 = *(_QWORD *)(a2 + 424);
      *(_QWORD *)(a1 + 424) = v19;
      *(_QWORD *)(a1 + 432) = *(_QWORD *)(a2 + 432);
      v20 = *(_QWORD *)(a2 + 440);
      *(_QWORD *)(a1 + 440) = v20;
      *(_QWORD *)(a1 + 448) = *(_QWORD *)(a2 + 448);
      v21 = *(_QWORD *)(a2 + 456);
      *(_QWORD *)(a1 + 456) = v21;
      swift_bridgeObjectRetain(v16);
      swift_bridgeObjectRetain(v17);
      swift_bridgeObjectRetain(v18);
      swift_bridgeObjectRetain(v19);
      swift_bridgeObjectRetain(v20);
      swift_bridgeObjectRetain(v21);
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v14 == 1)
  {
    sub_100087ABC((_QWORD *)(a1 + 360));
LABEL_6:
    memcpy((void *)(a1 + 360), (const void *)(a2 + 360), 0x68uLL);
    goto LABEL_8;
  }
  v22 = *v13;
  *(_BYTE *)(a1 + 368) = *(_BYTE *)(a2 + 368);
  *v12 = v22;
  *(_QWORD *)(a1 + 376) = *(_QWORD *)(a2 + 376);
  v23 = *(_QWORD *)(a2 + 384);
  *(_QWORD *)(a1 + 384) = v23;
  swift_bridgeObjectRetain(v23);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 392) = *(_QWORD *)(a2 + 392);
  v24 = *(_QWORD *)(a2 + 400);
  *(_QWORD *)(a1 + 400) = v24;
  swift_bridgeObjectRetain(v24);
  swift_bridgeObjectRelease();
  v25 = *(_QWORD *)(a2 + 408);
  *(_QWORD *)(a1 + 408) = v25;
  swift_bridgeObjectRetain(v25);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 416) = *(_QWORD *)(a2 + 416);
  v26 = *(_QWORD *)(a2 + 424);
  *(_QWORD *)(a1 + 424) = v26;
  swift_bridgeObjectRetain(v26);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 432) = *(_QWORD *)(a2 + 432);
  v27 = *(_QWORD *)(a2 + 440);
  *(_QWORD *)(a1 + 440) = v27;
  swift_bridgeObjectRetain(v27);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 448) = *(_QWORD *)(a2 + 448);
  v28 = *(_QWORD *)(a2 + 456);
  *(_QWORD *)(a1 + 456) = v28;
  swift_bridgeObjectRetain(v28);
  swift_bridgeObjectRelease();
LABEL_8:
  v29 = (__int128 *)(a1 + 464);
  v30 = (__int128 *)(a2 + 464);
  v31 = *(_QWORD *)(a2 + 472);
  if (*(_QWORD *)(a1 + 472) == 1)
  {
    if (v31 == 1)
    {
      v32 = *v30;
      *(_OWORD *)(a1 + 480) = *(_OWORD *)(a2 + 480);
LABEL_21:
      *v29 = v32;
      goto LABEL_22;
    }
    *(_QWORD *)(a1 + 464) = *(_QWORD *)(a2 + 464);
    v34 = *(_QWORD *)(a2 + 472);
    *(_QWORD *)(a1 + 472) = v34;
    v35 = *(_QWORD *)(a2 + 488);
    swift_bridgeObjectRetain(v34);
    if (v35 == 1)
    {
      *(_OWORD *)(a1 + 480) = *(_OWORD *)(a2 + 480);
      goto LABEL_22;
    }
LABEL_17:
    *(_QWORD *)(a1 + 480) = *(_QWORD *)(a2 + 480);
    v38 = *(_QWORD *)(a2 + 488);
    *(_QWORD *)(a1 + 488) = v38;
    swift_bridgeObjectRetain(v38);
    goto LABEL_22;
  }
  if (v31 != 1)
  {
    *(_QWORD *)(a1 + 464) = *(_QWORD *)(a2 + 464);
    v36 = *(_QWORD *)(a2 + 472);
    *(_QWORD *)(a1 + 472) = v36;
    swift_bridgeObjectRetain(v36);
    swift_bridgeObjectRelease();
    v29 = (__int128 *)(a1 + 480);
    v37 = *(_QWORD *)(a2 + 488);
    if (*(_QWORD *)(a1 + 488) == 1)
    {
      if (v37 != 1)
        goto LABEL_17;
    }
    else
    {
      if (v37 != 1)
      {
        *(_QWORD *)(a1 + 480) = *(_QWORD *)(a2 + 480);
        v45 = *(_QWORD *)(a2 + 488);
        *(_QWORD *)(a1 + 488) = v45;
        swift_bridgeObjectRetain(v45);
        swift_bridgeObjectRelease();
        goto LABEL_22;
      }
      sub_1000282EC(a1 + 480);
    }
    v32 = *(_OWORD *)(a2 + 480);
    goto LABEL_21;
  }
  sub_100087AF0(a1 + 464);
  v33 = *(_OWORD *)(a2 + 480);
  *v29 = *v30;
  *(_OWORD *)(a1 + 480) = v33;
LABEL_22:
  *(_BYTE *)(a1 + 496) = *(_BYTE *)(a2 + 496);
  *(_QWORD *)(a1 + 504) = *(_QWORD *)(a2 + 504);
  v39 = *(_QWORD *)(a2 + 512);
  *(_QWORD *)(a1 + 512) = v39;
  swift_bridgeObjectRetain(v39);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 520) = *(_QWORD *)(a2 + 520);
  v40 = *(_QWORD *)(a2 + 528);
  *(_QWORD *)(a1 + 528) = v40;
  swift_bridgeObjectRetain(v40);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 536) = *(_QWORD *)(a2 + 536);
  v41 = *(_QWORD *)(a2 + 544);
  *(_QWORD *)(a1 + 544) = v41;
  swift_bridgeObjectRetain(v41);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 552) = *(_BYTE *)(a2 + 552);
  v42 = *(_QWORD *)(a2 + 560);
  v43 = *(_QWORD *)(a1 + 560);
  *(_QWORD *)(a1 + 560) = v42;
  swift_retain(v42);
  swift_release(v43);
  return a1;
}

_QWORD *sub_100087ABC(_QWORD *a1)
{
  sub_100054744(a1);
  return a1;
}

uint64_t sub_100087AF0(uint64_t a1)
{
  sub_100054498(a1);
  return a1;
}

void *initializeWithTake for SubscriptionCreateActivityOperation(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x238uLL);
}

uint64_t assignWithTake for SubscriptionCreateActivityOperation(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  sub_100007618((_QWORD *)a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  v6 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  swift_release(v6);
  v7 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_release(v7);
  sub_100007618((_QWORD *)(a1 + 56));
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  sub_100007618((_QWORD *)(a1 + 96));
  v8 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v8;
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  sub_100007618((_QWORD *)(a1 + 136));
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  v9 = *(_QWORD *)(a2 + 176);
  v10 = *(_QWORD *)(a1 + 176);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 176) = v9;
  swift_release(v10);
  sub_100007618((_QWORD *)(a1 + 184));
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  sub_100007618((_QWORD *)(a1 + 224));
  v11 = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 224) = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 240) = v11;
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  sub_100007618((_QWORD *)(a1 + 264));
  v12 = *(_OWORD *)(a2 + 280);
  *(_OWORD *)(a1 + 264) = *(_OWORD *)(a2 + 264);
  *(_OWORD *)(a1 + 280) = v12;
  v13 = *(_QWORD *)(a2 + 304);
  v14 = *(_QWORD *)(a1 + 304);
  *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
  *(_QWORD *)(a1 + 304) = v13;
  swift_release(v14);
  sub_100007618((_QWORD *)(a1 + 312));
  v15 = *(_OWORD *)(a2 + 328);
  *(_OWORD *)(a1 + 312) = *(_OWORD *)(a2 + 312);
  *(_OWORD *)(a1 + 328) = v15;
  *(_QWORD *)(a1 + 344) = *(_QWORD *)(a2 + 344);
  *(_BYTE *)(a1 + 352) = *(_BYTE *)(a2 + 352);
  if (*(_QWORD *)(a1 + 384) == 1)
    goto LABEL_4;
  v16 = *(_QWORD *)(a2 + 384);
  if (v16 == 1)
  {
    sub_100087ABC((_QWORD *)(a1 + 360));
LABEL_4:
    memcpy((void *)(a1 + 360), (const void *)(a2 + 360), 0x68uLL);
    goto LABEL_6;
  }
  *(_QWORD *)(a1 + 360) = *(_QWORD *)(a2 + 360);
  *(_BYTE *)(a1 + 368) = *(_BYTE *)(a2 + 368);
  *(_QWORD *)(a1 + 376) = *(_QWORD *)(a2 + 376);
  *(_QWORD *)(a1 + 384) = v16;
  swift_bridgeObjectRelease();
  v17 = *(_QWORD *)(a2 + 400);
  *(_QWORD *)(a1 + 392) = *(_QWORD *)(a2 + 392);
  *(_QWORD *)(a1 + 400) = v17;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 408) = *(_QWORD *)(a2 + 408);
  swift_bridgeObjectRelease();
  v18 = *(_QWORD *)(a2 + 424);
  *(_QWORD *)(a1 + 416) = *(_QWORD *)(a2 + 416);
  *(_QWORD *)(a1 + 424) = v18;
  swift_bridgeObjectRelease();
  v19 = *(_QWORD *)(a2 + 440);
  *(_QWORD *)(a1 + 432) = *(_QWORD *)(a2 + 432);
  *(_QWORD *)(a1 + 440) = v19;
  swift_bridgeObjectRelease();
  v20 = *(_QWORD *)(a2 + 456);
  *(_QWORD *)(a1 + 448) = *(_QWORD *)(a2 + 448);
  *(_QWORD *)(a1 + 456) = v20;
  swift_bridgeObjectRelease();
LABEL_6:
  if (*(_QWORD *)(a1 + 472) == 1)
  {
LABEL_9:
    v22 = *(_OWORD *)(a2 + 480);
    *(_OWORD *)(a1 + 464) = *(_OWORD *)(a2 + 464);
    *(_OWORD *)(a1 + 480) = v22;
    goto LABEL_15;
  }
  v21 = *(_QWORD *)(a2 + 472);
  if (v21 == 1)
  {
    sub_100087AF0(a1 + 464);
    goto LABEL_9;
  }
  *(_QWORD *)(a1 + 464) = *(_QWORD *)(a2 + 464);
  *(_QWORD *)(a1 + 472) = v21;
  swift_bridgeObjectRelease();
  v23 = (_QWORD *)(a2 + 480);
  if (*(_QWORD *)(a1 + 488) != 1)
  {
    v24 = *(_QWORD *)(a2 + 488);
    if (v24 != 1)
    {
      *(_QWORD *)(a1 + 480) = *v23;
      *(_QWORD *)(a1 + 488) = v24;
      swift_bridgeObjectRelease();
      goto LABEL_15;
    }
    sub_1000282EC(a1 + 480);
  }
  *(_OWORD *)(a1 + 480) = *(_OWORD *)v23;
LABEL_15:
  *(_BYTE *)(a1 + 496) = *(_BYTE *)(a2 + 496);
  v25 = *(_QWORD *)(a2 + 512);
  *(_QWORD *)(a1 + 504) = *(_QWORD *)(a2 + 504);
  *(_QWORD *)(a1 + 512) = v25;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 520) = *(_QWORD *)(a2 + 520);
  *(_QWORD *)(a1 + 528) = *(_QWORD *)(a2 + 528);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 536) = *(_QWORD *)(a2 + 536);
  *(_QWORD *)(a1 + 544) = *(_QWORD *)(a2 + 544);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 552) = *(_BYTE *)(a2 + 552);
  v26 = *(_QWORD *)(a1 + 560);
  *(_QWORD *)(a1 + 560) = *(_QWORD *)(a2 + 560);
  swift_release(v26);
  return a1;
}

uint64_t getEnumTagSinglePayload for SubscriptionCreateActivityOperation(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 568))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 24);
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

uint64_t storeEnumTagSinglePayload for SubscriptionCreateActivityOperation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 552) = 0u;
    *(_OWORD *)(result + 536) = 0u;
    *(_OWORD *)(result + 520) = 0u;
    *(_OWORD *)(result + 504) = 0u;
    *(_OWORD *)(result + 488) = 0u;
    *(_OWORD *)(result + 472) = 0u;
    *(_OWORD *)(result + 456) = 0u;
    *(_OWORD *)(result + 440) = 0u;
    *(_OWORD *)(result + 424) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 568) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 568) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SubscriptionCreateActivityOperation()
{
  return &type metadata for SubscriptionCreateActivityOperation;
}

uint64_t sub_100087F34()
{
  return sub_100082950(584);
}

void *sub_100087F3C(uint64_t a1)
{
  uint64_t v1;

  return memcpy((void *)(a1 + 16), (const void *)(v1 + 88), 0x238uLL);
}

uint64_t sub_100087F4C()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)(7827308, 0xE300000000000000, 1751607656, 0xE400000000000000, 0);
}

uint64_t sub_100087F6C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100087F80()
{
  uint64_t v0;
  uint64_t v1;

  return sub_100082828(v1, v0 + 88);
}

uint64_t sub_100087F8C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100087F9C()
{
  _QWORD *v0;

  sub_100007618(v0 + 27);
  sub_100007618(v0 + 32);
  sub_100007618(v0 + 37);
  return swift_release(v0[42]);
}

uint64_t sub_100087FC4()
{
  _QWORD *v0;

  sub_100007618(v0 + 11);
  sub_100007618(v0 + 16);
  sub_100007618(v0 + 21);
  return swift_release(v0[26]);
}

uint64_t sub_100087FEC()
{
  _QWORD *v0;

  sub_100007618(v0 + 25);
  sub_100007618(v0 + 30);
  sub_100007618(v0 + 35);
  return swift_release(v0[40]);
}

uint64_t sub_100088014()
{
  _QWORD *v0;

  sub_100007618(v0 + 9);
  sub_100007618(v0 + 14);
  sub_100007618(v0 + 19);
  return swift_release(v0[24]);
}

uint64_t sub_10008803C@<X0>(uint64_t a1@<X8>)
{
  return *(_QWORD *)(a1 + 504);
}

uint64_t sub_10008804C()
{
  uint64_t v0;

  return swift_release(v0);
}

uint64_t sub_100088054()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(*(_QWORD *)(v0 + 560));
}

uint64_t sub_10008805C()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(*(_QWORD *)(v0 + 544));
}

uint64_t sub_100088064(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  a1[2] = v3;
  a1[3] = v1;
  a1[4] = v2;
  return swift_errorRetain(v2);
}

uint64_t sub_100088078(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  a1[2] = v4;
  a1[3] = v1;
  a1[4] = v2;
  a1[5] = v3;
  return swift_retain(v1);
}

uint64_t sub_10008808C(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t);

  *a2 = v2;
  a2[1] = 2;
  return v3(a1, 1);
}

uint64_t sub_1000880A0()
{
  uint64_t v0;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 648))(1, 0);
}

void sub_1000880B4(unint64_t *a1, uint64_t *a2)
{
  uint64_t v2;

  sub_100031668(a1, a2, v2);
}

uint64_t sub_1000880BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  return swift_dynamicCast(v5, v4, a3, a4, 0);
}

uint64_t sub_1000880CC()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 504);
}

uint64_t sub_1000880D8()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(*(_QWORD *)(v0 + 472));
}

uint64_t sub_1000880E0()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(*(_QWORD *)(v0 + 456));
}

uint64_t sub_1000880E8()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(*(_QWORD *)(v0 + 440));
}

uint64_t sub_1000880F0()
{
  uint64_t v0;

  return static _DictionaryStorage.allocate(capacity:)(v0);
}

void sub_100088118(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_100086E1C(a1, a2, v2);
}

uint64_t sub_100088120()
{
  uint64_t v0;

  return swift_task_dealloc(*(_QWORD *)(v0 + 680));
}

uint64_t sub_100088128()
{
  uint64_t v0;

  return swift_errorRelease(*(_QWORD *)(v0 + 600));
}

uint64_t sub_100088150()
{
  uint64_t *v0;

  return sub_10000738C(v0);
}

uint64_t sub_100088158()
{
  uint64_t v0;
  unint64_t v1;

  return sub_100086824(v0, v1);
}

uint64_t sub_100088164()
{
  uint64_t v0;
  unint64_t v1;

  return sub_100086888(v0, v1);
}

uint64_t sub_100088188()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(*(_QWORD *)(v0 + 576));
}

uint64_t sub_100088190()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(*(_QWORD *)(v0 + 528));
}

uint64_t sub_1000881AC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 600) = v0;
  return swift_errorRetain(v0);
}

uint64_t sub_1000881B8(uint64_t a1, __n128 *a2, __n128 a3)
{
  uint64_t (*v3)(uint64_t, uint64_t);

  *a2 = a3;
  return v3(a1, 1);
}

id sub_1000881C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  char *v4;
  objc_super v6;

  v4 = &v3[OBJC_IVAR____TtC7sportsd16SportsXPCSession_entitlement];
  *(_QWORD *)v4 = a1;
  *((_QWORD *)v4 + 1) = a2;
  *(_QWORD *)&v3[OBJC_IVAR____TtC7sportsd16SportsXPCSession_connection] = a3;
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for SportsXPCSession();
  return objc_msgSendSuper2(&v6, "init");
}

uint64_t sub_100088210()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  void *v7;
  NSString v8;
  id v9;
  char **v10;
  char v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[32];

  v1 = v0;
  if (qword_1000CFAB0 != -1)
    swift_once(&qword_1000CFAB0, sub_10006CC14);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_1000096EC(v2, (uint64_t)qword_1000DDA88);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.debug.getter(v4);
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "New daemon connection.", v6, 2u);
    swift_slowDealloc(v6, -1, -1);
  }

  v7 = *(void **)(v1 + OBJC_IVAR____TtC7sportsd16SportsXPCSession_connection);
  v8 = String._bridgeToObjectiveC()();
  v9 = objc_msgSend(v7, "valueForEntitlement:", v8);

  if (v9)
  {
    _bridgeAnyObjectToAny(_:)(v9);
    swift_unknownObjectRelease(v9);
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
  }
  sub_10000AD8C((uint64_t)&v13, (uint64_t)v15);
  sub_10002F710((uint64_t)v15, (uint64_t)&v13);
  if (!*((_QWORD *)&v14 + 1))
  {
    sub_10000ADD4((uint64_t)&v13);
LABEL_13:
    v10 = &selRef_invalidate;
    goto LABEL_14;
  }
  if ((swift_dynamicCast(&v12, &v13, (char *)&type metadata for Any + 8, &type metadata for Bool, 6) & 1) == 0
    || (v12 & 1) == 0)
  {
    goto LABEL_13;
  }
  v10 = &selRef_resume;
LABEL_14:
  objc_msgSend(v7, *v10);
  return sub_10000ADD4((uint64_t)v15);
}

void sub_1000883D4()
{
  _swift_stdlib_reportUnimplementedInitializer("sportsd.SportsXPCSession", 24, "init()", 6, 0);
  __break(1u);
}

id sub_10008840C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SportsXPCSession();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SportsXPCSession()
{
  return objc_opt_self(_TtC7sportsd16SportsXPCSession);
}

void sub_100088498(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  __asm { BR              X10 }
}

double sub_1000884E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  double *i;
  uint64_t v5;
  uint64_t v6;
  double v7;
  BOOL v8;

  v3 = *(_QWORD *)(v2 + 16);
  if (!v3)
    return 0.0;
  for (i = (double *)(v2 + 48); ; i += 3)
  {
    v5 = *((_QWORD *)i - 2);
    v6 = *((_QWORD *)i - 1);
    v7 = *i;
    v8 = v5 == v1 && v6 == v0;
    if (v8 || (sub_100088F2C(v5, v6) & 1) != 0)
      break;
    if (!--v3)
      return 0.0;
  }
  return v7;
}

void sub_100088670(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0)
  {
    sub_10007B0A4();
    v2 = v3;
  }
  v4 = *(_QWORD *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v4;
  sub_1000886D8(v5);
  *a1 = v2;
}

void sub_1000886D8(uint64_t *a1)
{
  uint64_t v1;
  Swift::Int v3;
  Swift::Int v4;
  Swift::Int v5;
  char *v6;
  Swift::Int v7;
  uint64_t v8;
  Swift::Int v9;
  double v10;
  double v11;
  double *v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  Swift::Int v17;
  Swift::Int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  Swift::Int v25;
  char *v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  _QWORD *v30;
  Swift::Int *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  BOOL v43;
  unint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  BOOL v53;
  uint64_t v54;
  char v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  BOOL v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  _QWORD *v74;
  uint64_t v75;
  unint64_t v76;
  double *v77;
  double v78;
  Swift::Int v79;
  double *v80;
  double v81;
  uint64_t v82;
  char *v83;
  char *v84;
  uint64_t v85;
  unint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  unint64_t v91;
  char *v92;
  uint64_t *v93;
  _QWORD *v94;
  Swift::Int v95;
  uint64_t v96;
  char *v97;
  char *v98;

  v3 = a1[1];
  v4 = _minimumMergeRunLength(_:)(v3);
  if (v4 >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3)
        sub_100088D18(0, v3, 1, a1);
      return;
    }
    goto LABEL_125;
  }
  v5 = v4;
  v93 = a1;
  v94 = sub_100079D94(v3 / 2);
  v96 = v3;
  v97 = v6;
  if (v3 <= 0)
  {
    v98 = (char *)_swiftEmptyArrayStorage;
    v29 = _swiftEmptyArrayStorage[2];
LABEL_91:
    if (v29 < 2)
    {
LABEL_102:
      swift_bridgeObjectRelease();
      if (v96 >= -1)
      {
        v94[2] = 0;
        swift_bridgeObjectRelease();
        return;
      }
      goto LABEL_130;
    }
    v85 = *v93;
    while (1)
    {
      v86 = v29 - 2;
      if (v29 < 2)
        break;
      if (!v85)
        goto LABEL_134;
      v87 = v98;
      v88 = *(_QWORD *)&v98[16 * v86 + 32];
      v89 = *(_QWORD *)&v98[16 * v29 + 24];
      sub_100088D94((char *)(v85 + 24 * v88), (char *)(v85 + 24 * *(_QWORD *)&v98[16 * v29 + 16]), v85 + 24 * v89, v97);
      if (v1)
        goto LABEL_87;
      if (v89 < v88)
        goto LABEL_120;
      if ((swift_isUniquelyReferenced_nonNull_native(v98) & 1) == 0)
      {
        sub_10007ACCC((uint64_t)v98);
        v87 = v92;
      }
      if (v86 >= *((_QWORD *)v87 + 2))
        goto LABEL_121;
      v90 = &v87[16 * v86 + 32];
      *(_QWORD *)v90 = v88;
      *((_QWORD *)v90 + 1) = v89;
      v91 = *((_QWORD *)v87 + 2);
      if (v29 > v91)
        goto LABEL_122;
      memmove(&v87[16 * v29 + 16], &v87[16 * v29 + 32], 16 * (v91 - v29));
      v98 = v87;
      *((_QWORD *)v87 + 2) = v91 - 1;
      v29 = v91 - 1;
      if (v91 <= 2)
        goto LABEL_102;
    }
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
    return;
  }
  v7 = 0;
  v8 = *a1;
  v98 = (char *)_swiftEmptyArrayStorage;
  v95 = v5;
  while (1)
  {
    v9 = v7++;
    if (v7 < v3)
    {
      v10 = *(double *)(v8 + 24 * v7 + 16);
      v11 = *(double *)(v8 + 24 * v9 + 16);
      v7 = v9 + 2;
      if (v9 + 2 < v3)
      {
        v12 = (double *)(v8 + 64 + 24 * v9);
        v13 = v10;
        while (1)
        {
          v14 = v13;
          v13 = *v12;
          if (v11 < v10 == v14 >= *v12)
            break;
          ++v7;
          v12 += 3;
          if (v7 >= v3)
          {
            v7 = v3;
            break;
          }
        }
      }
      if (v11 < v10)
      {
        if (v7 < v9)
          goto LABEL_127;
        if (v9 < v7)
        {
          v15 = 24 * v7;
          v16 = 24 * v9;
          v17 = v7;
          v18 = v9;
          do
          {
            if (v18 != --v17)
            {
              if (!v8)
                goto LABEL_133;
              v19 = v8 + v16;
              v20 = v8 + v15;
              v21 = *(_QWORD *)(v8 + v16);
              v22 = *(_QWORD *)(v8 + v16 + 8);
              v23 = *(_QWORD *)(v8 + v16 + 16);
              v24 = *(_QWORD *)(v8 + v15 - 8);
              *(_OWORD *)v19 = *(_OWORD *)(v8 + v15 - 24);
              *(_QWORD *)(v19 + 16) = v24;
              *(_QWORD *)(v20 - 24) = v21;
              *(_QWORD *)(v20 - 16) = v22;
              *(_QWORD *)(v20 - 8) = v23;
            }
            ++v18;
            v15 -= 24;
            v16 += 24;
          }
          while (v18 < v17);
        }
      }
    }
    if (v7 >= v3)
      goto LABEL_26;
    if (__OFSUB__(v7, v9))
      goto LABEL_124;
    if (v7 - v9 >= v5)
      goto LABEL_26;
    v25 = v9 + v5;
    if (__OFADD__(v9, v5))
      goto LABEL_128;
    if (v25 >= v3)
      v25 = v3;
    if (v25 < v9)
      goto LABEL_129;
    if (v7 == v25)
    {
LABEL_26:
      v26 = v98;
    }
    else
    {
      v77 = (double *)(v8 + 24 * v7);
      v26 = v98;
      do
      {
        v78 = *(double *)(v8 + 24 * v7 + 16);
        v79 = v9;
        v80 = v77;
        do
        {
          if (*(v80 - 1) >= v78)
            break;
          if (!v8)
            goto LABEL_131;
          v81 = *v80;
          v82 = *((_QWORD *)v80 + 1);
          *(_OWORD *)v80 = *(_OWORD *)(v80 - 3);
          v80[2] = *(v80 - 1);
          *((_QWORD *)v80 - 2) = v82;
          *(v80 - 1) = v78;
          *(v80 - 3) = v81;
          v80 -= 3;
          ++v79;
        }
        while (v7 != v79);
        ++v7;
        v77 += 3;
      }
      while (v7 != v25);
      v7 = v25;
    }
    if (v7 < v9)
      goto LABEL_123;
    if ((swift_isUniquelyReferenced_nonNull_native(v26) & 1) == 0)
    {
      sub_10007ABF4(0, *((_QWORD *)v26 + 2) + 1, 1, v26);
      v26 = v83;
    }
    v28 = *((_QWORD *)v26 + 2);
    v27 = *((_QWORD *)v26 + 3);
    v29 = v28 + 1;
    if (v28 >= v27 >> 1)
    {
      sub_10007ABF4(v27 > 1, v28 + 1, 1, v26);
      v26 = v84;
    }
    *((_QWORD *)v26 + 2) = v29;
    v30 = v26 + 32;
    v31 = (Swift::Int *)&v26[16 * v28 + 32];
    *v31 = v9;
    v31[1] = v7;
    v98 = v26;
    if (v28)
      break;
    v29 = 1;
LABEL_75:
    v5 = v95;
    v3 = v96;
    if (v7 >= v96)
      goto LABEL_91;
  }
  while (1)
  {
    v32 = v29 - 1;
    if (v29 >= 4)
    {
      v37 = &v30[2 * v29];
      v38 = *(v37 - 8);
      v39 = *(v37 - 7);
      v43 = __OFSUB__(v39, v38);
      v40 = v39 - v38;
      if (v43)
        goto LABEL_108;
      v42 = *(v37 - 6);
      v41 = *(v37 - 5);
      v43 = __OFSUB__(v41, v42);
      v35 = v41 - v42;
      v36 = v43;
      if (v43)
        goto LABEL_109;
      v44 = v29 - 2;
      v45 = &v30[2 * v29 - 4];
      v47 = *v45;
      v46 = v45[1];
      v43 = __OFSUB__(v46, v47);
      v48 = v46 - v47;
      if (v43)
        goto LABEL_110;
      v43 = __OFADD__(v35, v48);
      v49 = v35 + v48;
      if (v43)
        goto LABEL_112;
      if (v49 >= v40)
      {
        v67 = &v30[2 * v32];
        v69 = *v67;
        v68 = v67[1];
        v43 = __OFSUB__(v68, v69);
        v70 = v68 - v69;
        if (v43)
          goto LABEL_118;
        v60 = v35 < v70;
        goto LABEL_64;
      }
    }
    else
    {
      if (v29 != 3)
      {
        v61 = *((_QWORD *)v26 + 4);
        v62 = *((_QWORD *)v26 + 5);
        v43 = __OFSUB__(v62, v61);
        v54 = v62 - v61;
        v55 = v43;
        goto LABEL_58;
      }
      v34 = *((_QWORD *)v26 + 4);
      v33 = *((_QWORD *)v26 + 5);
      v43 = __OFSUB__(v33, v34);
      v35 = v33 - v34;
      v36 = v43;
    }
    if ((v36 & 1) != 0)
      goto LABEL_111;
    v44 = v29 - 2;
    v50 = &v30[2 * v29 - 4];
    v52 = *v50;
    v51 = v50[1];
    v53 = __OFSUB__(v51, v52);
    v54 = v51 - v52;
    v55 = v53;
    if (v53)
      goto LABEL_113;
    v56 = &v30[2 * v32];
    v58 = *v56;
    v57 = v56[1];
    v43 = __OFSUB__(v57, v58);
    v59 = v57 - v58;
    if (v43)
      goto LABEL_115;
    if (__OFADD__(v54, v59))
      goto LABEL_117;
    if (v54 + v59 >= v35)
    {
      v60 = v35 < v59;
LABEL_64:
      if (v60)
        v32 = v44;
      goto LABEL_66;
    }
LABEL_58:
    if ((v55 & 1) != 0)
      goto LABEL_114;
    v63 = &v30[2 * v32];
    v65 = *v63;
    v64 = v63[1];
    v43 = __OFSUB__(v64, v65);
    v66 = v64 - v65;
    if (v43)
      goto LABEL_116;
    if (v66 < v54)
      goto LABEL_75;
LABEL_66:
    v71 = v32 - 1;
    if (v32 - 1 >= v29)
    {
      __break(1u);
LABEL_105:
      __break(1u);
LABEL_106:
      __break(1u);
LABEL_107:
      __break(1u);
LABEL_108:
      __break(1u);
LABEL_109:
      __break(1u);
LABEL_110:
      __break(1u);
LABEL_111:
      __break(1u);
LABEL_112:
      __break(1u);
LABEL_113:
      __break(1u);
LABEL_114:
      __break(1u);
LABEL_115:
      __break(1u);
LABEL_116:
      __break(1u);
LABEL_117:
      __break(1u);
LABEL_118:
      __break(1u);
      goto LABEL_119;
    }
    if (!v8)
      goto LABEL_132;
    v72 = &v30[2 * v71];
    v73 = *v72;
    v74 = &v30[2 * v32];
    v75 = v74[1];
    sub_100088D94((char *)(v8 + 24 * *v72), (char *)(v8 + 24 * *v74), v8 + 24 * v75, v97);
    if (v1)
      break;
    if (v75 < v73)
      goto LABEL_105;
    if (v32 > *((_QWORD *)v98 + 2))
      goto LABEL_106;
    *v72 = v73;
    v30[2 * v71 + 1] = v75;
    v76 = *((_QWORD *)v98 + 2);
    if (v32 >= v76)
      goto LABEL_107;
    v26 = v98;
    v29 = v76 - 1;
    memmove(&v30[2 * v32], v74 + 2, 16 * (v76 - 1 - v32));
    *((_QWORD *)v98 + 2) = v76 - 1;
    if (v76 <= 2)
      goto LABEL_75;
  }
LABEL_87:
  swift_bridgeObjectRelease();
  if (v96 < -1)
    goto LABEL_126;
  v94[2] = 0;
  swift_bridgeObjectRelease();
}

uint64_t sub_100088D18(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  double *v8;
  double v9;
  uint64_t v10;

  if (a3 != a2)
  {
    v4 = *a4;
    v5 = *a4 + 24 * a3;
    while (2)
    {
      v6 = *(double *)(v4 + 24 * a3 + 16);
      v7 = result;
      v8 = (double *)v5;
      do
      {
        if (*(v8 - 1) >= v6)
          break;
        if (!v4)
        {
          __break(1u);
          return result;
        }
        v9 = *v8;
        v10 = *((_QWORD *)v8 + 1);
        *(_OWORD *)v8 = *(_OWORD *)(v8 - 3);
        v8[2] = *(v8 - 1);
        *((_QWORD *)v8 - 2) = v10;
        *(v8 - 1) = v6;
        *(v8 - 3) = v9;
        v8 -= 3;
        ++v7;
      }
      while (a3 != v7);
      ++a3;
      v5 += 24;
      if (a3 != a2)
        continue;
      break;
    }
  }
  return result;
}

uint64_t sub_100088D94(char *a1, char *a2, unint64_t a3, char *a4)
{
  char *v4;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  BOOL v14;
  char *v15;
  __int128 v18;
  unint64_t v21;
  char *v22;
  char *v23;
  BOOL v24;
  BOOL v25;
  __int128 v26;

  v4 = a4;
  v6 = a2;
  v7 = a1;
  v8 = a2 - a1;
  v9 = (a2 - a1) / 24;
  v10 = a3 - (_QWORD)a2;
  v11 = (uint64_t)(a3 - (_QWORD)a2) / 24;
  if (v9 >= v11)
  {
    sub_100014130(a2, (uint64_t)(a3 - (_QWORD)a2) / 24, a4);
    v12 = &v4[24 * v11];
    if (v7 >= v6 || v10 < 24)
      goto LABEL_45;
    v21 = a3 - 24;
    while (1)
    {
      v22 = (char *)(v21 + 24);
      if (*((double *)v6 - 1) >= *((double *)v12 - 1))
      {
        v23 = v12 - 24;
        v25 = v22 != v12 || v21 >= (unint64_t)v12;
        v12 -= 24;
        if (!v25)
          goto LABEL_41;
      }
      else
      {
        v23 = v6 - 24;
        v24 = v22 != v6 || v21 >= (unint64_t)v6;
        v6 -= 24;
        if (!v24)
          goto LABEL_41;
      }
      v26 = *(_OWORD *)v23;
      *(_QWORD *)(v21 + 16) = *((_QWORD *)v23 + 2);
      *(_OWORD *)v21 = v26;
LABEL_41:
      v21 -= 24;
      if (v6 <= v7 || v12 <= v4)
        goto LABEL_45;
    }
  }
  sub_100014130(a1, (a2 - a1) / 24, a4);
  v12 = &v4[24 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 24)
  {
    do
    {
      if (*((double *)v4 + 2) >= *((double *)v6 + 2))
      {
        v14 = v7 == v4;
        v15 = v4;
        v4 += 24;
        if (v14 && v7 < v4)
          goto LABEL_18;
      }
      else
      {
        v14 = v7 == v6;
        v15 = v6;
        v6 += 24;
        if (v14 && v7 < v6)
          goto LABEL_18;
      }
      v18 = *(_OWORD *)v15;
      *((_QWORD *)v7 + 2) = *((_QWORD *)v15 + 2);
      *(_OWORD *)v7 = v18;
LABEL_18:
      v7 += 24;
    }
    while (v4 < v12 && (unint64_t)v6 < a3);
  }
  v6 = v7;
LABEL_45:
  sub_100014130(v4, (v12 - v4) / 24, v6);
  return 1;
}

uint64_t sub_100088F2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, v3, v2, 0);
}

uint64_t sub_100088F3C()
{
  uint64_t v0;

  return swift_release(v0);
}

uint64_t sub_100088F44()
{
  void *v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  Swift::String v9;
  uint64_t v10;
  uint64_t v11;
  Swift::String v12;
  void *object;
  Swift::String v14;
  uint64_t v15;
  Swift::String v16;
  void *v17;
  uint64_t v19;

  SportingEvent.clock.getter();
  sub_1000890F0();

  dispatch thunk of SportingEventClock.minutes.getter();
  sub_1000890F8();
  SportingEvent.clock.getter();
  v2 = sub_1000890F0();

  dispatch thunk of SportingEventClock.seconds.getter();
  sub_1000890F8();
  if ((v1 & 1) != 0)
    v3 = 0;
  else
    v3 = v2;
  SportingEvent.clock.getter();
  v4 = (void *)sub_1000890F0();

  v5 = dispatch thunk of SportingEventClock.milliseconds.getter();
  v7 = v6;

  if ((v7 & 1) != 0)
    v8 = 0;
  else
    v8 = v5;
  v19 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
  v9._countAndFlagsBits = 58;
  v9._object = (void *)0xE100000000000000;
  String.append(_:)(v9);
  v10 = sub_10000738C(&qword_1000D05A8);
  v11 = sub_1000890E4(v10);
  *(_OWORD *)(v11 + 16) = xmmword_10009FDB0;
  *(_QWORD *)(v11 + 56) = &type metadata for Int;
  *(_QWORD *)(v11 + 64) = &protocol witness table for Int;
  *(_QWORD *)(v11 + 32) = v3;
  v12._countAndFlagsBits = String.init(format:_:)(1681010725, 0xE400000000000000, v11);
  object = v12._object;
  String.append(_:)(v12);
  swift_bridgeObjectRelease(object);
  v14._countAndFlagsBits = 46;
  v14._object = (void *)0xE100000000000000;
  String.append(_:)(v14);
  v15 = sub_1000890E4(v10);
  *(_OWORD *)(v15 + 16) = xmmword_10009FDB0;
  *(_QWORD *)(v15 + 56) = &type metadata for Int;
  *(_QWORD *)(v15 + 64) = &protocol witness table for Int;
  *(_QWORD *)(v15 + 32) = v8;
  v16._countAndFlagsBits = String.init(format:_:)(1681076261, 0xE400000000000000, v15);
  v17 = v16._object;
  String.append(_:)(v16);
  swift_bridgeObjectRelease(v17);
  return v19;
}

uint64_t sub_1000890E4(uint64_t a1)
{
  return swift_allocObject(a1, 72, 7);
}

uint64_t sub_1000890F0()
{
  return SportingEventCurrentClock.current.getter();
}

void sub_1000890F8()
{
  void *v0;

}

void sub_100089104(void (*a1)(uint64_t *__return_ptr, id *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  unint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  id v19;
  uint64_t v20;
  char v21;
  _QWORD *v22;

  v4 = v3;
  if ((unint64_t)a3 >> 62)
    goto LABEL_19;
  v6 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v6)
  {
    v22 = _swiftEmptyArrayStorage;
    sub_1000157C8();
    if (v6 < 0)
    {
      __break(1u);
      return;
    }
    v7 = 0;
    v8 = v22;
    while (v6 != v7)
    {
      if ((a3 & 0xC000000000000001) != 0)
        v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v7, a3);
      else
        v9 = *(id *)(a3 + 8 * v7 + 32);
      v10 = v9;
      v19 = v9;
      a1(&v20, &v19);
      if (v4)
      {
        swift_release(v8);

        return;
      }
      v11 = v6;

      v12 = v20;
      v13 = v21;
      v22 = v8;
      v14 = v8[2];
      if (v14 >= v8[3] >> 1)
      {
        sub_1000157C8();
        v8 = v22;
      }
      ++v7;
      v8[2] = v14 + 1;
      v15 = &v8[2 * v14];
      v15[4] = v12;
      *((_BYTE *)v15 + 40) = v13;
      v6 = v11;
      v16 = v11 == v7;
      v4 = 0;
      if (v16)
        return;
    }
    __break(1u);
LABEL_19:
    if (a3 < 0)
      v17 = a3;
    else
      v17 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v6 = _CocoaArrayWrapper.endIndex.getter(v17);
    swift_bridgeObjectRelease(a3);
  }
}

_QWORD *sub_1000892A0(void (*a1)(uint64_t *__return_ptr, id *), uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;

  v4 = v3;
  v5 = a3;
  if (a3 >> 62)
    goto LABEL_19;
  v6 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a3);
  for (; v6; v6 = _CocoaArrayWrapper.endIndex.getter(v19))
  {
    v23 = v5 & 0xC000000000000001;
    v7 = _swiftEmptyArrayStorage;
    v8 = 4;
    v21 = v6;
    v22 = v5;
    while (1)
    {
      v9 = v23 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v8 - 4, v5) : *(id *)(v5 + 8 * v8);
      v10 = v9;
      v11 = v8 - 3;
      if (__OFADD__(v8 - 4, 1))
        break;
      v30 = v9;
      a1(&v26, &v30);
      if (v4)
      {
        swift_bridgeObjectRelease(v7);
        sub_100018DAC();

        return v7;
      }

      v12 = v27;
      if (v27)
      {
        v13 = v28;
        v14 = v29;
        v25 = v26;
        if ((swift_isUniquelyReferenced_nonNull_native(v7) & 1) == 0)
        {
          sub_10008DF78();
          sub_1000135E0();
          v7 = v17;
        }
        v15 = v7[2];
        if (v15 >= v7[3] >> 1)
        {
          sub_1000135E0();
          v7 = v18;
        }
        v7[2] = v15 + 1;
        v16 = &v7[4 * v15];
        v16[4] = v25;
        v16[5] = v12;
        v16[6] = v13;
        v16[7] = v14;
        v6 = v21;
        v5 = v22;
      }
      ++v8;
      if (v11 == v6)
      {
        sub_100018DAC();
        return v7;
      }
    }
    __break(1u);
LABEL_19:
    if (v5 < 0)
      v19 = v5;
    else
      v19 = v5 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v5);
  }
  sub_100018DAC();
  return _swiftEmptyArrayStorage;
}

uint64_t sub_10008945C(void *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  Class isa;
  uint64_t v16;
  uint64_t v17;
  uint8_t *v18;
  __n128 v19;
  uint8_t *v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  os_log_type_t v42;
  _BOOL4 v43;
  uint64_t v44;
  objc_class *v45;
  _QWORD *v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *inited;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  os_log_type_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  NSObject *v68;
  os_log_type_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  NSObject *v74;
  unint64_t v75;
  os_log_type_t v76;
  _QWORD *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  int v81;
  uint64_t v82;
  void (*v83)(id, uint64_t);
  _QWORD *v84;
  void *v85;
  _QWORD *v86;
  char v87;
  char v88;
  uint64_t v89;
  _QWORD *v90;
  _QWORD *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  uint64_t v95;
  int v96;
  uint64_t v97;
  uint64_t v98;
  void (*v99)(unint64_t, uint64_t);
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  NSObject *v104;
  os_log_type_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  _QWORD *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  _QWORD *v114;
  uint64_t v115;
  void *v116;
  _WORD *v117;
  id v118;
  os_log_type_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  _QWORD *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  _QWORD *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  os_log_type_t v137;
  void *v138;
  void *v139;
  id v140;
  os_log_type_t v141;
  uint64_t v142;
  uint64_t v143;
  char v144;
  uint64_t v145;
  unint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  char v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  unint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  unint64_t v163;
  _QWORD *v164;
  _QWORD *v165;
  _QWORD *v166;
  _QWORD *v167;
  _QWORD *v168;
  NSObject *v169;
  os_log_type_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  unint64_t v174;
  _QWORD *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  NSObject *v179;
  NSObject *v180;
  os_log_type_t v181;
  _BOOL4 v182;
  uint8_t *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  int v192;
  _BOOL4 v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  _QWORD *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  id v203;
  void *v204;
  void *v205;
  uint64_t v206;
  uint64_t v207;
  unint64_t v208;
  _QWORD *v209;
  _QWORD *v210;
  uint64_t v211;
  uint64_t v212;
  _QWORD *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  unint64_t v217;
  unint64_t v218;
  _QWORD *v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  unint64_t v225;
  unint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  id v231;
  NSObject *v232;
  unint64_t v233;
  uint64_t v234;
  uint64_t v235;
  unint64_t v236;
  unint64_t v237;
  unint64_t v238;
  uint64_t v239;
  void *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  unint64_t v245;
  unint64_t v246;
  unint64_t v247;
  NSObject *v248;
  int v249;
  uint64_t v250;
  _QWORD *v251;
  uint64_t *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  unint64_t v257;
  _QWORD *v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  unint64_t v265;
  unint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  NSObject *v272;
  uint64_t v273;
  unint64_t v274;
  NSObject *v275;
  NSObject *v276;
  NSObject *v277;
  uint64_t v279;
  id v280;
  uint64_t v281;
  uint64_t v282;
  char v284;
  uint64_t v285;
  objc_class *v286;
  objc_class *v287;
  uint64_t v288;
  void *v289;
  uint64_t v290;
  objc_class *v291;
  objc_class *v292;
  unint64_t v293;
  NSObject *v294;
  uint64_t v295;
  uint64_t v296;
  Class v297;
  __n128 v298;
  unint64_t *v299;
  uint64_t v300;
  unint64_t v301;
  unint64_t v302;
  uint64_t v303;
  NSObject *v304;
  os_log_type_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  void *v312;
  uint64_t v313;
  uint64_t result;
  uint64_t v315;
  uint64_t v316;
  _QWORD *v317;
  uint64_t v318;
  uint64_t v319;
  void *v320;
  uint64_t v321;
  void (*v322)(uint64_t, uint64_t, uint64_t);
  unint64_t v323;
  unint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  NSObject *v334;
  int v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  Class v342;
  NSObject *v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  _QWORD *v347;
  uint64_t v348;
  char *v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t (*v352)(char *, char *, uint64_t);
  char *v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  unint64_t v359;
  unint64_t v360;
  _QWORD *v361;
  unint64_t v362;
  uint64_t v363;
  NSObject *v364;
  Class v365;
  uint8_t *v366;
  uint64_t v367;
  unint64_t v368;
  unint64_t v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  NSObject *v374;
  uint64_t v375;
  void *v376;
  _QWORD *v377;
  uint8_t *v378;
  Class v379;
  NSObject *v380;
  void *v381;
  void *v382;
  uint64_t v383;
  char *v384;
  unint64_t v385;
  id v386;
  unint64_t v387;
  unint64_t v388;
  unint64_t v389;
  unint64_t v390;
  char *v391;
  char *v392;
  uint64_t v393;
  NSObject *v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  unint64_t v399;
  char *v400;
  NSObject *v401;
  unint64_t v402;
  unint64_t v403;
  __n128 v404;
  char v405[8];
  _QWORD *v406;
  unint64_t v407;
  objc_class *v408;
  _UNKNOWN **v409;
  uint64_t v410;
  _QWORD *v411;
  uint64_t v412;
  char v413[8];

  v381 = a2;
  sub_10000738C(&qword_1000D3348);
  sub_10000A680();
  __chkstk_darwin(v3);
  sub_10000A7D4();
  v6 = v5 - v4;
  v396 = type metadata accessor for IngestionError(0);
  v393 = *(_QWORD *)(v396 - 8);
  sub_10000A680();
  __chkstk_darwin(v7);
  v384 = (char *)&v376 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v392 = (char *)&v376 - v10;
  __chkstk_darwin(v11);
  v13 = sub_10007B1FC((uint64_t)&v376 - v12);
  v14 = type metadata accessor for Logger(v13);
  isa = v14[-1].isa;
  __chkstk_darwin(v14);
  sub_10000A7D4();
  v18 = (uint8_t *)(v17 - v16);
  v20 = (uint8_t *)type metadata accessor for SportingEventMetadataType(0, v19);
  v21 = *((_QWORD *)v20 - 1);
  __chkstk_darwin(v20);
  v23 = (char *)&v376 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  v26 = (char *)&v376 - v25;
  v404.n128_u64[0] = type metadata accessor for SportingEventCompetitorScoreStatisticType.StatisticName(0);
  v403 = *(_QWORD *)(v404.n128_u64[0] - 8);
  sub_10000A680();
  __chkstk_darwin(v27);
  sub_10000CD48();
  v29 = sub_10007B1FC(v28);
  v30 = type metadata accessor for SportingEventProgressStatus(v29);
  v394 = *(NSObject **)(sub_10008E144(v30) - 8);
  sub_10000A680();
  __chkstk_darwin(v31);
  sub_10000CD48();
  v33 = sub_10007B1FC(v32);
  v389 = type metadata accessor for SportingEventClockBreakType(v33);
  v388 = *(_QWORD *)(v389 - 8);
  sub_10000A680();
  __chkstk_darwin(v34);
  sub_10000CD48();
  v387 = v35;
  sub_10000738C(&qword_1000D3350);
  sub_10000A680();
  __chkstk_darwin(v36);
  sub_10000CD48();
  v399 = v37;
  sub_10000738C(&qword_1000D2E78);
  sub_10000A680();
  __chkstk_darwin(v38);
  sub_10000A7D4();
  v41 = (id)(v40 - v39);
  if (qword_1000CFAB8 != -1)
    swift_once(&qword_1000CFAB8, sub_10006CC6C);
  v400 = v23;
  v401 = v21;
  v395 = (uint64_t)v20;
  v378 = v18;
  v379 = isa;
  v380 = v14;
  v398 = sub_1000096EC((uint64_t)v14, (uint64_t)qword_1000DDAA0);
  Logger.logObject.getter(v398);
  v42 = sub_10008E15C();
  v43 = sub_10008E028(v42);
  v44 = (uint64_t)&objc_retain_x21;
  v385 = v6;
  v391 = v26;
  if (v43)
  {
    v376 = a1;
    v386 = v41;
    v18 = (uint8_t *)sub_100018554(12);
    v377 = (_QWORD *)sub_100018554(32);
    v411 = v377;
    *(_DWORD *)v18 = 136315138;
    v45 = (objc_class *)type metadata accessor for ActivityAuthorization(0);
    v46 = objc_msgSend(objc_allocWithZone(v45), "init");
    v47 = sub_100043DEC();
    v49 = v48;
    v408 = v45;
    v409 = &off_1000C5188;
    v406 = v46;
    v50 = type metadata accessor for ActivityCapUtility();
    inited = (_QWORD *)swift_initStackObject(v50, v405);
    v52 = sub_10000AE58((uint64_t)&v406, (uint64_t)v408);
    v6 = (unint64_t)&v376;
    __chkstk_darwin(v52);
    sub_10000A7D4();
    v55 = (uint64_t *)(v54 - v53);
    (*(void (**)(uint64_t))(v56 + 16))(v54 - v53);
    v57 = *v55;
    inited[5] = v45;
    inited[6] = &off_1000C5188;
    inited[7] = v47;
    inited[2] = v57;
    inited[8] = v49;
    sub_100007618(&v406);
    v58 = sub_100063B00();
    swift_setDeallocating(inited);
    sub_100063B38();
    if ((v58 & 1) != 0)
    {
      v21 = 1212631368;
      swift_bridgeObjectRelease(0xE400000000000000);
    }
    else
    {
      v6 = 0xE300000000000000;
      v59 = _stringCompareWithSmolCheck(_:_:expecting:)(7827308, 0xE300000000000000, 1751607656, 0xE400000000000000, 0);
      swift_bridgeObjectRelease(0xE300000000000000);
      if ((v59 & 1) != 0)
        v21 = 1212631368;
      else
        v21 = 5721932;
    }
    a1 = v376;
    LOBYTE(v23) = (_BYTE)v18 + 4;
    sub_10008DF54(v21, v60, (uint64_t *)&v411);
    v406 = (_QWORD *)v61;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v406, &v407, v18 + 4, v18 + 12);
    sub_1000061E8();
    sub_100018948((void *)&_mh_execute_header, v14, (os_log_type_t)v20, "Live activity cap: %s", v18);
    v44 = (uint64_t)v377;
    sub_100018940((uint64_t)v377);
    sub_10000A818(v44);
    sub_10000A818((uint64_t)v18);

    v41 = v386;
  }
  else
  {

  }
  v62 = a1;
  sub_10008DF00();
  v63 = sub_10008DFD4();
  if (sub_10008DF0C(v63))
  {
    v44 = 12;
    v20 = (uint8_t *)sub_100018554(12);
    v64 = sub_100018554(32);
    sub_10008E094(v64);
    sub_10008E130(4.8149e-34);
    v65 = SportingEvent.version.getter();
    sub_10008E118(v65, v66);
    sub_10008DF1C(v67);

    sub_1000061E8();
    sub_100018948((void *)&_mh_execute_header, v18, (os_log_type_t)v23, "Version: %s", v20);
    sub_100018940((uint64_t)a1);
    sub_10000A818((uint64_t)a1);
    sub_10000A818((uint64_t)v20);

  }
  else
  {

  }
  v68 = v62;
  sub_10008DF00();
  v69 = sub_10008DFD4();
  if (sub_10008DF0C(v69))
  {
    v44 = 12;
    v20 = (uint8_t *)sub_100018554(12);
    v70 = sub_100018554(32);
    sub_10008E094(v70);
    sub_10008E130(4.8149e-34);
    v71 = sub_100088F44();
    sub_10008E118(v71, v72);
    sub_10008DF1C(v73);

    sub_1000061E8();
    sub_100018948((void *)&_mh_execute_header, v18, (os_log_type_t)v23, "Event clock: %s", v20);
    sub_100018940((uint64_t)a1);
    sub_10000A818((uint64_t)a1);
    sub_10000A818((uint64_t)v20);

  }
  else
  {

  }
  v74 = v68;
  v75 = sub_10008DF00();
  v76 = static os_log_type_t.debug.getter(v75);
  if (os_log_type_enabled((os_log_t)v75, v76))
  {
    v68 = sub_100018554(32);
    v77 = (_QWORD *)sub_100018554(96);
    v406 = v77;
    LODWORD(v68->isa) = 136315650;
    sub_10008E0D4();
    v78 = (void *)sub_1000890F0();

    v79 = (void *)SportingEventClock.period.getter();
    dispatch thunk of SportingEventClockPeriod.type.getter();

    v80 = type metadata accessor for SportingEventClockPeriodType(0);
    v81 = sub_100009658((uint64_t)v41, 1, v80);
    v386 = v77;
    if (v81 == 1)
    {
      sub_10000A47C((uint64_t)v41, &qword_1000D2E78);
      v21 = 1819047278;
    }
    else
    {
      SportingEventClockPeriodType.rawValue.getter();
      sub_10008E0C0();
      v83(v41, v80);
    }
    sub_10008DF54(v21, v82, (uint64_t *)&v406);
    v411 = v84;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v411, &v412, (char *)&v68->isa + 4, (char *)&v68[1].isa + 4);

    sub_1000061E8();
    WORD2(v68[1].isa) = 2080;
    sub_10008E0D4();
    sub_1000890F0();
    sub_10008E018();
    v85 = (void *)SportingEventClock.period.getter();

    v86 = (_QWORD *)dispatch thunk of SportingEventClockPeriod.index.getter();
    v88 = v87;

    if ((v88 & 1) != 0)
    {
      v89 = sub_10008DF88();
    }
    else
    {
      v411 = v86;
      v89 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
      v86 = v90;
    }
    v6 = v399;
    v21 = (unint64_t)&v68[1].isa + 6;
    sub_10008DF38(v89);
    v411 = v91;
    sub_10008DF5C((uint64_t)&v411, (uint64_t)&v412, v92, (uint64_t)&v68[2].isa + 6);

    sub_1000061E8();
    HIWORD(v68[2].isa) = 2080;
    sub_10008E0D4();
    v93 = (void *)sub_1000890F0();

    v94 = (void *)SportingEventClock.period.getter();
    dispatch thunk of SportingEventClockPeriod.subdivision.getter();

    v95 = type metadata accessor for SportingEventClockPeriodSubdivision(0);
    v96 = sub_100009658(v6, 1, v95);
    v97 = (uint64_t)v386;
    if (v96 == 1)
    {
      sub_10000A47C(v6, &qword_1000D3350);
      v21 = 1819047278;
    }
    else
    {
      SportingEventClockPeriodSubdivision.rawValue.getter();
      sub_10008E0C0();
      v99(v6, v95);
    }
    LOBYTE(v20) = (_BYTE)v68 + 24;
    sub_10008DF54(v21, v98, (uint64_t *)&v406);
    v101 = sub_10008DF64(v100);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v101, v102, &v68[3], v103);

    sub_1000061E8();
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v75, v76, "Clock period: type=%s, index=%s, subdivision=%s", (uint8_t *)v68, 0x20u);
    swift_arrayDestroy(v97, 3);
    sub_10000A818(v97);
    sub_10000A818((uint64_t)v68);

  }
  else
  {

  }
  v104 = v74;
  sub_10008DF00();
  v105 = sub_10008E15C();
  if (sub_10008E028(v105))
  {
    v106 = sub_100018554(22);
    v107 = sub_100018554(64);
    v406 = (_QWORD *)v107;
    *(_DWORD *)v106 = 136315394;
    sub_10008DFB0();
    sub_1000890F0();
    sub_10008E018();
    v108 = dispatch thunk of SportingEventClock.runningState.getter();

    if (v108)
    {
      dispatch thunk of SportingEventClockRunningState.isReliable.getter();
      sub_10008E070();
      v109 = sub_10008DF88();
      if ((_DWORD)v6 != 2)
      {
        if ((v21 & 1) != 0)
          v109 = 1702195828;
        else
          v109 = 0x65736C6166;
      }
    }
    else
    {
      v109 = sub_10008DF88();
    }
    sub_10008DF38(v109);
    v411 = v110;
    sub_10008DF5C((uint64_t)&v411, (uint64_t)&v412, v111, v106 + 12);

    sub_1000061E8();
    *(_WORD *)(v106 + 12) = 2080;
    sub_10008DFB0();
    sub_1000890F0();
    sub_10008E018();
    v112 = dispatch thunk of SportingEventClock.runningState.getter();

    if (v112)
    {
      dispatch thunk of SportingEventClockRunningState.isActive.getter();
      sub_10008E070();
      v113 = 1819047278;
      if ((_DWORD)v6 != 2)
      {
        if ((((_BYTE)v106 + 4) & 1) != 0)
          v113 = 1702195828;
        else
          v113 = 0x65736C6166;
      }
    }
    else
    {
      v113 = sub_10008DF88();
    }
    v21 = v106 + 14;
    sub_10008DF38(v113);
    v411 = v114;
    sub_10008DF5C((uint64_t)&v411, (uint64_t)&v412, v115, v106 + 22);

    sub_1000061E8();
    _os_log_impl((void *)&_mh_execute_header, v68, (os_log_type_t)v20, "Running clock: isReliable=%s, isActive=%s", (uint8_t *)v106, 0x16u);
    sub_10004EB30(v107);
    sub_10000A818(v107);
    sub_10000A818(v106);

  }
  else
  {

  }
  v116 = v382;
  sub_10008B954((uint64_t)v381);
  sub_10008DFB0();
  v117 = (_WORD *)sub_1000890F0();

  v118 = (id)dispatch thunk of SportingEventClock.activityStatus.getter();
  v399 = (unint64_t)v104;
  if (!v118)
  {
    sub_10008DF00();
    v137 = sub_10008E15C();
    if (os_log_type_enabled(0, v137))
    {
      v117 = (_WORD *)sub_100018554(2);
      *v117 = 0;
      _os_log_impl((void *)&_mh_execute_header, 0, v137, "Clock activity status: null", (uint8_t *)v117, 2u);
      sub_10000A818((uint64_t)v117);
    }
    goto LABEL_53;
  }
  v118 = v118;
  sub_10008DF00();
  v119 = sub_10008DFD4();
  if (!sub_10008DF0C(v119))
  {

LABEL_53:
    goto LABEL_54;
  }
  v120 = sub_100018554(22);
  v121 = sub_100018554(64);
  v122 = sub_10008E094(v121);
  *(_DWORD *)v120 = 136315394;
  if ((SportingEventClockActivityStatus.isBreak.getter(v122) & 1) != 0)
    v123 = 1702195828;
  else
    v123 = 0x65736C6166;
  sub_10008DF38(v123);
  v411 = v124;
  v104 = &v412;
  sub_10008DF5C((uint64_t)&v411, (uint64_t)&v412, v125, v120 + 12);

  v126 = sub_1000061E8();
  *(_WORD *)(v120 + 12) = 2080;
  v21 = v120 + 14;
  v6 = v387;
  v127 = SportingEventClockActivityStatus.breakType.getter(v126);
  SportingEventClockBreakType.rawValue.getter(v127);
  v129 = v128;
  (*(void (**)(unint64_t, unint64_t))(v388 + 8))(v6, v389);
  sub_10008E050();
  v411 = v130;
  sub_10008E164();
  sub_10008DF5C(v131, v132, v133, v134);

  swift_bridgeObjectRelease(v129);
  sub_10008DFDC((void *)&_mh_execute_header, v135, v136, "Clock activity status: isBreak=%s, breakType=%s");
  sub_10004EB30(v75);
  sub_10000A818(v75);
  sub_10000A818(v120);

LABEL_54:
  v138 = (void *)sub_10008DFB0();
  dispatch thunk of SportingEventCurrentClock.total.getter();
  sub_10008E104();
  if (v138)
  {
    v139 = (void *)dispatch thunk of SportingEventClock.additional.getter();

    if (v139)
    {
      v140 = v139;
      sub_10008DF00();
      v141 = sub_10008DFD4();
      if (sub_10008DF0C(v141))
      {
        v142 = sub_100018554(22);
        v143 = sub_100018554(64);
        v411 = (_QWORD *)v143;
        *(_DWORD *)v142 = 136315394;
        v406 = (_QWORD *)dispatch thunk of SportingEventClock.minutes.getter();
        LOBYTE(v407) = v144 & 1;
        v104 = sub_10000738C(&qword_1000D3360);
        v6 = (unint64_t)&v406;
        v145 = String.init<A>(describing:)(&v406, v104);
        sub_10008E10C(v145, v146);
        v406 = (_QWORD *)v147;
        sub_10008DF5C((uint64_t)&v406, (uint64_t)&v407, v148, v142 + 12);

        v149 = sub_1000061E8();
        *(_WORD *)(v142 + 12) = 2080;
        v21 = v142 + 14;
        v406 = (_QWORD *)dispatch thunk of SportingEventClock.seconds.getter(v149);
        LOBYTE(v407) = v150 & 1;
        sub_10008E164();
        v153 = String.init<A>(describing:)(v151, v152);
        sub_10008E10C(v153, v154);
        v406 = (_QWORD *)v155;
        sub_10008DF5C((uint64_t)&v406, (uint64_t)&v407, v156, v142 + 22);

        sub_1000061E8();
        sub_10008DFDC((void *)&_mh_execute_header, v157, v158, "Clock injury time: minutes=%s, seconds=%s");
        sub_10004EB30(v143);
        sub_10000A818(v143);
        sub_10000A818(v142);

      }
      else
      {

      }
    }
  }
  v159 = sub_10008DFB0();
  v160 = v159;
  dispatch thunk of SportingEventCurrentClock.periods.getter();
  sub_10008E104();
  if (!v159)
  {
    v163 = 0;
    v164 = _swiftEmptyArrayStorage;
    goto LABEL_81;
  }
  if ((unint64_t)v159 >> 62)
  {
    if (v159 >= 0)
      v159 &= 0xFFFFFFFFFFFFFF8uLL;
    swift_bridgeObjectRetain(v160);
    v161 = sub_10001898C();
    if (v161)
      goto LABEL_62;
  }
  else
  {
    v161 = *(_QWORD *)((v159 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(v159);
    if (v161)
    {
LABEL_62:
      if (v161 < 1)
      {
        __break(1u);
        goto LABEL_229;
      }
      v162 = 0;
      v163 = 0;
      v104 = (v160 & 0xC000000000000001);
      v164 = _swiftEmptyArrayStorage;
      do
      {
        if (v104)
          v165 = (_QWORD *)specialized _ArrayBuffer._getElementSlowPath(_:)(v162, v160);
        else
          v165 = sub_10001887C(v160 + 8 * v162);
        v21 = (unint64_t)v165;
        v411 = v165;
        sub_10008D78C((uint64_t *)&v411, (uint64_t *)&v406);

        v6 = v407;
        if (v407)
        {
          v21 = (unint64_t)v406;
          if ((swift_isUniquelyReferenced_nonNull_native(v164) & 1) == 0)
          {
            sub_10008DF78();
            sub_100013494();
            v164 = v167;
          }
          v75 = v164[2];
          if (v75 >= v164[3] >> 1)
          {
            sub_100013494();
            v164 = v168;
          }
          v164[2] = v75 + 1;
          v166 = &v164[2 * v75];
          v166[4] = v21;
          v166[5] = v6;
        }
        ++v162;
      }
      while (v161 != v162);
      goto LABEL_80;
    }
  }
  v163 = 0;
  v164 = _swiftEmptyArrayStorage;
LABEL_80:
  sub_100018540(v160);
  sub_10008E164();
LABEL_81:
  if (v164[2])
  {
    sub_100018E34();
    v169 = sub_10008DF00();
    v170 = static os_log_type_t.debug.getter(v169);
    if (os_log_type_enabled(v169, v170))
    {
      v6 = sub_100018554(12);
      v171 = sub_100018554(32);
      v406 = (_QWORD *)v171;
      *(_DWORD *)v6 = 136315138;
      v21 = v6 + 12;
      v104 = (v6 + 4);
      v172 = sub_100018E34();
      v173 = Array.description.getter(v172, &type metadata for String);
      v75 = v174;
      sub_1000185B4();
      sub_100014B44(v173, v75, (uint64_t *)&v406);
      v411 = v175;
      sub_10008E164();
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v176, v177, v178, v6 + 12);
      sub_100018540((uint64_t)v164);
      sub_100055AA8();
      sub_100018948((void *)&_mh_execute_header, v169, v170, "AnnouncedAdditional: %s", (uint8_t *)v6);
      sub_100018940(v171);
      sub_10000A818(v171);
      sub_10000A818(v6);

    }
    else
    {

      sub_100018540((uint64_t)v164);
    }
  }
  else
  {
    sub_1000185B4();
  }
  v179 = v104;
  v180 = sub_10008DF00();
  v181 = static os_log_type_t.debug.getter(v180);
  v182 = os_log_type_enabled(v180, v181);
  v377 = 0;
  if (v182)
  {
    v183 = (uint8_t *)sub_100018554(12);
    v184 = sub_100018554(32);
    v185 = sub_10008E094(v184);
    *(_DWORD *)v183 = 136315138;
    v21 = (unint64_t)(v183 + 12);
    v163 = (unint64_t)(v183 + 4);
    v6 = v390;
    v186 = SportingEvent.progressStatus.getter(v185);
    SportingEventProgressStatus.rawValue.getter(v186);
    v188 = v187;
    ((void (*)(unint64_t, uint64_t))v394[1].isa)(v6, v397);
    sub_10008E050();
    v190 = sub_10008DF64(v189);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v190, v191, v183 + 4, v183 + 12);

    swift_bridgeObjectRelease(v188);
    sub_100018948((void *)&_mh_execute_header, v180, v181, "Progress status: %s", v183);
    sub_100018940(v75);
    sub_10000A818(v75);
    sub_10000A818((uint64_t)v183);

  }
  else
  {

  }
  v159 = v179;
  sub_10008DF00();
  v192 = sub_10008DFD4();
  v193 = os_log_type_enabled((os_log_t)v163, (os_log_type_t)v192);
  v386 = (id)v159;
  if (!v193)
  {

    goto LABEL_117;
  }
  v6 = sub_100018554(12);
  v194 = sub_100018554(32);
  v406 = (_QWORD *)v194;
  *(_DWORD *)v6 = 136315138;
  v195 = dispatch thunk of SportingEvent.competitors.getter(v194);
  v196 = v195;
  if ((unint64_t)v195 >> 62)
  {
    if (v195 < 0)
      v159 = v195;
    else
      v159 = v195 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v195);
    v197 = sub_10001898C();
  }
  else
  {
    v197 = *(_QWORD *)((v195 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(v195);
  }
  v394 = v163;
  v390 = v6;
  LODWORD(v389) = v192;
  v388 = v194;
  if (v197)
  {
    if (v197 >= 1)
    {
      v198 = 0;
      v399 = v196 & 0xC000000000000001;
      LODWORD(v397) = enum case for SportingEventCompetitorScoreStatisticType.StatisticName.score(_:);
      v199 = _swiftEmptyArrayStorage;
      v200 = v196;
      v201 = v403;
      v202 = v402;
      do
      {
        if (v399)
          v203 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v198, v196);
        else
          v203 = sub_10001887C(v196 + 8 * v198);
        v204 = v203;
        sub_10008DF98(v202, *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(v201 + 104));
        v205 = (void *)dispatch thunk of SportingEventCompetitorContainer.getScoreEntry(name:)(v202);
        v206 = (*(uint64_t (**)(uint64_t, unint64_t))(v201 + 8))(v202, v6);
        if (v205)
        {
          v207 = SportingEventCompetitorScoreEntry.value.getter(v206);

          if ((swift_isUniquelyReferenced_nonNull_native(v199) & 1) == 0)
          {
            sub_10008E038();
            sub_100013830();
            v199 = v209;
          }
          v196 = v200;
          v6 = v199[2];
          v208 = v199[3];
          if (v6 >= v208 >> 1)
          {
            sub_10008E080(v208);
            sub_100013830();
            v199 = v210;
          }
          v199[2] = v6 + 1;
          v199[v6 + 4] = v207;
        }
        else
        {

          v196 = v200;
        }
        ++v198;
      }
      while (v197 != v198);
      goto LABEL_109;
    }
LABEL_229:
    __break(1u);
    goto LABEL_230;
  }
  v199 = _swiftEmptyArrayStorage;
LABEL_109:
  sub_100018540(v196);
  v212 = v199[2];
  if (v212)
  {
    v411 = _swiftEmptyArrayStorage;
    sub_10008E170();
    sub_10008E0DC();
    v6 = 0;
    v213 = v411;
    do
    {
      v410 = v199[v6 + 4];
      v214 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
      v216 = v215;
      v411 = v213;
      v218 = v213[2];
      v217 = v213[3];
      if (v218 >= v217 >> 1)
      {
        sub_10008DFF0(v217);
        sub_10008E020();
        v213 = v411;
      }
      ++v6;
      v213[2] = v218 + 1;
      v219 = &v213[2 * v218];
      v219[4] = v214;
      v219[5] = v216;
    }
    while (v212 != v6);
    sub_100018574();
  }
  else
  {
    sub_100018574();
    v213 = _swiftEmptyArrayStorage;
  }
  v21 = v390;
  v411 = v213;
  v220 = sub_10000738C(&qword_1000D0440);
  sub_100023740();
  v221 = sub_10008DFB8();
  v224 = BidirectionalCollection<>.joined(separator:)(v221, v222, v220, v223);
  v226 = v225;
  sub_1000185B4();
  sub_100014B44(v224, v226, (uint64_t *)&v406);
  v228 = sub_10008E0A0(v227);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(v228, v229, v21 + 4, v230);
  v231 = v386;

  swift_bridgeObjectRelease(v226);
  v232 = v394;
  sub_100018948((void *)&_mh_execute_header, v394, (os_log_type_t)v389, "Scores: %s", (uint8_t *)v21);
  v163 = v388;
  sub_100018940(v388);
  sub_10000A818(v163);
  sub_10000A818(v21);

LABEL_117:
  v233 = dispatch thunk of SportingEvent.competitors.getter(v211);
  if (v233 >> 62)
  {
    sub_100018E34();
    v234 = sub_100018C80();
    if (v234)
      goto LABEL_119;
LABEL_134:
    v236 = (unint64_t)_swiftEmptyArrayStorage;
    goto LABEL_135;
  }
  v234 = *(_QWORD *)((v233 & 0xFFFFFFFFFFFFF8) + 0x10);
  sub_100018E34();
  if (!v234)
    goto LABEL_134;
LABEL_119:
  if (v234 < 1)
    goto LABEL_181;
  v235 = 0;
  v399 = v233 & 0xC000000000000001;
  LODWORD(v397) = enum case for SportingEventCompetitorScoreStatisticType.StatisticName.shootout(_:);
  v236 = (unint64_t)_swiftEmptyArrayStorage;
  v237 = v233;
  do
  {
    v238 = v236;
    if (v399)
      v239 = sub_10008E0E4();
    else
      v239 = (uint64_t)sub_10001887C(v233 + 8 * v235);
    v240 = (void *)v239;
    v241 = v403;
    v242 = v402;
    sub_10008DF98(v402, *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(v403 + 104));
    v21 = dispatch thunk of SportingEventCompetitorContainer.getScoreEntry(name:)(v242);
    v243 = (*(uint64_t (**)(uint64_t, unint64_t))(v241 + 8))(v242, v6);
    if (v21)
    {
      v244 = SportingEventCompetitorScoreEntry.value.getter(v243);

      v236 = v238;
      if ((swift_isUniquelyReferenced_nonNull_native(v238) & 1) == 0)
      {
        sub_10008DF78();
        sub_100013830();
        v236 = v246;
      }
      v233 = v237;
      v6 = *(_QWORD *)(v236 + 16);
      v245 = *(_QWORD *)(v236 + 24);
      v21 = v6 + 1;
      if (v6 >= v245 >> 1)
      {
        sub_10008E080(v245);
        sub_100013830();
        v236 = v247;
      }
      *(_QWORD *)(v236 + 16) = v21;
      *(_QWORD *)(v236 + 8 * v6 + 32) = v244;
    }
    else
    {

      v236 = v238;
      v233 = v237;
    }
    ++v235;
  }
  while (v234 != v235);
LABEL_135:
  sub_100018540(v233);
  if (*(_QWORD *)(v236 + 16))
  {
    swift_bridgeObjectRetain(v236);
    v248 = sub_10008DF00();
    v249 = static os_log_type_t.debug.getter(v248);
    if (os_log_type_enabled(v248, (os_log_type_t)v249))
    {
      v21 = sub_100018554(12);
      v404.n128_u64[0] = sub_100018554(32);
      v406 = (_QWORD *)v404.n128_u64[0];
      *(_DWORD *)v21 = 136315138;
      v250 = *(_QWORD *)(v236 + 16);
      v251 = _swiftEmptyArrayStorage;
      if (v250)
      {
        LODWORD(v399) = v249;
        v402 = v21;
        v403 = (unint64_t)v248;
        v411 = _swiftEmptyArrayStorage;
        sub_10008E170();
        sub_10008E0DC();
        v251 = v411;
        v397 = v236;
        v252 = (uint64_t *)(v236 + 32);
        do
        {
          v253 = *v252++;
          v410 = v253;
          v254 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
          v256 = v255;
          v411 = v251;
          v236 = v251[2];
          v257 = v251[3];
          if (v236 >= v257 >> 1)
          {
            sub_10008DFF0(v257);
            sub_10008E020();
            v251 = v411;
          }
          v251[2] = v236 + 1;
          v258 = &v251[2 * v236];
          v258[4] = v254;
          v258[5] = v256;
          --v250;
        }
        while (v250);
        sub_10008E150();
        v248 = v403;
        v21 = v402;
        LOBYTE(v249) = v399;
      }
      v411 = v251;
      v260 = sub_10000738C(&qword_1000D0440);
      sub_100023740();
      v261 = sub_10008DFB8();
      v264 = BidirectionalCollection<>.joined(separator:)(v261, v262, v260, v263);
      v266 = v265;
      swift_bridgeObjectRelease(v251);
      sub_100014B44(v264, v266, (uint64_t *)&v406);
      v268 = sub_10008E0A0(v267);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v268, v269, v21 + 4, v270);
      sub_100018540(v236);
      sub_100018574();
      sub_100018948((void *)&_mh_execute_header, v248, (os_log_type_t)v249, "Shootout scores: %s", (uint8_t *)v21);
      v271 = v404.n128_u64[0];
      sub_100018940(v404.n128_i64[0]);
      sub_10000A818(v271);
      sub_10000A818(v21);

    }
    else
    {

      v259 = sub_100018540(v236);
    }
    v163 = dispatch thunk of SportingEvent.competitors.getter(v259);
    v234 = v395;
    if (v163 >> 62)
      goto LABEL_182;
    v272 = *(NSObject **)((v163 & 0xFFFFFFFFFFFFF8) + 0x10);
    sub_1000185C8();
    for (; v272; v272 = sub_10001898C())
    {
      v273 = 0;
      v274 = v163 & 0xC000000000000001;
      v387 = v163 + 32;
      LODWORD(v399) = enum case for SportingEventMetadataType.shootoutsContext(_:);
      v275 = _swiftEmptyArrayStorage;
      v390 = v163;
      v388 = (unint64_t)v272;
      v389 = v163 & 0xC000000000000001;
      while (1)
      {
        v276 = v274
             ? specialized _ArrayBuffer._getElementSlowPath(_:)(v273, v163)
             : *(id *)(v387 + 8 * v273);
        v277 = v276;
        if (__OFADD__(v273++, 1))
          break;
        SportingEventCompetitorContainer.competitor.getter(v276);
        dispatch thunk of SportingEventCompetitor.metadata.getter();
        sub_10008E018();
        if (v21)
        {
          if (v21 >> 62)
          {
            sub_100055B00();
            v279 = sub_100018C80();
            if (v279)
            {
LABEL_155:
              v394 = v277;
              v395 = v273;
              v397 = (uint64_t)v275;
              v404.n128_u64[0] = v21 & 0xC000000000000001;
              v273 = 4;
              v402 = v279;
              v403 = v21;
              while (1)
              {
                v280 = v404.n128_u64[0]
                     ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v273 - 4, v21)
                     : *(id *)(v21 + 8 * v273);
                v281 = v273 - 3;
                if (__OFADD__(v273 - 4, 1))
                  break;
                v163 = (unint64_t)v280;
                SportingEventMetadata.metadataType.getter();
                v275 = v401;
                ((void (*)(char *, _QWORD, uint64_t))v401[13].isa)(v400, v399, v234);
                sub_100005B28(&qword_1000D12D0, (uint64_t (*)(uint64_t))&type metadata accessor for SportingEventMetadataType, (uint64_t)&protocol conformance descriptor for SportingEventMetadataType);
                v272 = v234;
                sub_10008E124();
                sub_10008E124();
                v282 = v412;
                if (v406 == v411 && v407 == v412)
                {
                  sub_100018540(v407);
                  sub_10008E060();
                  sub_10008E0B4();
                  v234 = (uint64_t)v272;
LABEL_169:
                  v285 = sub_100018540(v403);
                  v21 = SportingEventMetadata.value.getter(v285);
                  v287 = v286;

                  v272 = v394;
                  v289 = (void *)SportingEventCompetitorContainer.competitor.getter(v288);
                  v290 = SportingEventCompetitor.canonicalId.getter();
                  v292 = v291;

                  if ((swift_isUniquelyReferenced_nonNull_native(v397) & 1) == 0)
                  {
                    sub_10008DF78();
                    sub_1000135E0();
                    sub_10008E144(v295);
                  }
                  sub_10008E0F0();
                  v293 = *(_QWORD *)(v397 + 16);
                  if (v293 >= *(_QWORD *)(v397 + 24) >> 1)
                  {
                    sub_1000135E0();
                    sub_10008E144(v296);
                  }
                  sub_10008E150();
                  v275[2].isa = (Class)(v293 + 1);
                  v294 = &v275[4 * v293];
                  v294[4].isa = (Class)v290;
                  v294[5].isa = v292;
                  v294[6].isa = (Class)v21;
                  v294[7].isa = v287;
                  v163 = v390;
LABEL_174:
                  v274 = v389;
                  goto LABEL_177;
                }
                v284 = _stringCompareWithSmolCheck(_:_:expecting:)(v406, v407, v411, v412, 0);
                sub_1000061E8();
                swift_bridgeObjectRelease(v282);
                sub_10008E060();
                sub_10008E0B4();
                v234 = (uint64_t)v272;
                if ((v284 & 1) != 0)
                  goto LABEL_169;

                ++v273;
                v21 = v403;
                if (v281 == v402)
                {

                  sub_100018540(v21);
                  sub_10008E150();
                  v163 = v390;
                  sub_10008E0F0();
                  goto LABEL_174;
                }
              }
              __break(1u);
              break;
            }
          }
          else
          {
            v279 = *(_QWORD *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
            sub_100055B00();
            if (v279)
              goto LABEL_155;
          }

          sub_100018540(v21);
        }
        else
        {

        }
LABEL_177:
        if (v273 == v272)
          goto LABEL_184;
      }
      __break(1u);
LABEL_181:
      __break(1u);
LABEL_182:
      sub_1000185C8();
    }
    v275 = _swiftEmptyArrayStorage;
LABEL_184:
    sub_100018540(v163);
    v297 = v275[2].isa;
    if (v297)
    {
      v298 = swift_bridgeObjectRetain(v275);
      v397 = (uint64_t)v275;
      v299 = (unint64_t *)&v275[7];
      v298.n128_u64[0] = 136315394;
      v404 = v298;
      v403 = (unint64_t)&type metadata for Any + 8;
      do
      {
        v300 = *(v299 - 3);
        v301 = *(v299 - 2);
        v303 = *(v299 - 1);
        v302 = *v299;
        swift_bridgeObjectRetain_n(v301, 3);
        swift_bridgeObjectRetain_n(v302, 3);
        v304 = sub_10008DF00();
        v305 = static os_log_type_t.debug.getter(v304);
        if (os_log_type_enabled(v304, v305))
        {
          v306 = sub_100018554(22);
          v307 = sub_100018554(64);
          v406 = (_QWORD *)v307;
          *(_DWORD *)v306 = v404.n128_u32[0];
          swift_bridgeObjectRetain(v301);
          sub_100014B44(v300, v301, (uint64_t *)&v406);
          *(_QWORD *)(v306 + 4) = v308;
          sub_100018A58(v301);
          *(_WORD *)(v306 + 12) = 2080;
          sub_100055B00();
          sub_100014B44(v303, v302, (uint64_t *)&v406);
          *(_QWORD *)(v306 + 14) = v309;
          sub_100018A58(v302);
          _os_log_impl((void *)&_mh_execute_header, v304, v305, "Competitor: %s; Contextual shootout: %s)",
            (uint8_t *)v306,
            0x16u);
          swift_arrayDestroy(v307, 2);
          sub_10000A818(v307);
          sub_10000A818(v306);
          swift_bridgeObjectRelease(v302);
          swift_bridgeObjectRelease(v301);

        }
        else
        {

          sub_100018A58(v302);
          sub_100018A58(v301);
        }
        v299 += 4;
        v297 = (Class)((char *)v297 - 1);
      }
      while (v297);
      sub_10008E150();
      sub_100055AA8();
    }
  }
  v310 = sub_100055AA8();
  v311 = dispatch thunk of SportingEvent.coverage.getter(v310);
  if (!v311)
    return sub_10008C3AC(v381);
  v312 = (void *)v311;
  dispatch thunk of SportingEventCoverage.ingestion.getter();
  sub_10008E104();
  v159 = dispatch thunk of SportingEventCoverageIngestion.coverageUpdates.getter();

  if (!v159)
    return sub_10008C3AC(v381);
  if (!((unint64_t)v159 >> 62))
  {
    v313 = *(_QWORD *)((v159 & 0xFFFFFFFFFFFFFF8) + 0x10);
    result = sub_100018E34();
    goto LABEL_195;
  }
LABEL_230:
  sub_100018E34();
  result = sub_100018C80();
  v313 = result;
LABEL_195:
  v315 = v385;
  if (!v313)
  {
    v317 = _swiftEmptyArrayStorage;
LABEL_211:
    sub_100018540(v159);
    (*((void (**)(uint8_t *, uint64_t, NSObject *))v379 + 2))(v378, v398, v380);
    v331 = sub_10000A748((uint64_t)&unk_1000C9180, 24);
    *(_QWORD *)(v331 + 16) = v317;
    v332 = sub_10000A748((uint64_t)&unk_1000C91A8, 32);
    *(_QWORD *)(v332 + 16) = sub_10008DE84;
    *(_QWORD *)(v332 + 24) = v331;
    sub_1000185C8();
    v333 = swift_retain(v331);
    v334 = Logger.logObject.getter(v333);
    v335 = static os_log_type_t.debug.getter(v334);
    v336 = sub_10000A748((uint64_t)&unk_1000C91D0, 17);
    *(_BYTE *)(v336 + 16) = 32;
    v337 = sub_10000A748((uint64_t)&unk_1000C91F8, 17);
    *(_BYTE *)(v337 + 16) = 8;
    v338 = sub_10000A748((uint64_t)&unk_1000C9220, 32);
    *(_QWORD *)(v338 + 16) = sub_10008DE8C;
    *(_QWORD *)(v338 + 24) = v332;
    v339 = sub_10000A748((uint64_t)&unk_1000C9248, 32);
    *(_QWORD *)(v339 + 16) = sub_10008DEC8;
    *(_QWORD *)(v339 + 24) = v338;
    v340 = sub_10000738C(&qword_1000D3358);
    v341 = swift_initStackObject(v340, v413);
    *(_OWORD *)(v341 + 16) = xmmword_1000A0600;
    *(_QWORD *)(v341 + 32) = sub_10008DE98;
    *(_QWORD *)(v341 + 40) = v336;
    *(_QWORD *)(v341 + 48) = sub_10008DEF4;
    *(_QWORD *)(v341 + 56) = v337;
    *(_QWORD *)(v341 + 64) = sub_10008DED0;
    *(_QWORD *)(v341 + 72) = v339;
    swift_setDeallocating(v341);
    swift_retain(v332);
    swift_retain(v338);
    swift_retain(v336);
    swift_retain(v337);
    swift_retain(v339);
    sub_10007DE34();
    LODWORD(v402) = v335;
    if (os_log_type_enabled(v334, (os_log_type_t)v335))
    {
      v399 = v339;
      v400 = (char *)v338;
      v342 = v379;
      v343 = v380;
      v403 = v332;
      v404.n128_u64[0] = v331;
      v401 = v334;
      v344 = sub_100018554(12);
      v345 = sub_100018554(32);
      v406 = (_QWORD *)sub_10008E144(v345);
      *(_WORD *)v344 = 258;
      *(_BYTE *)(v344 + 2) = 32;
      swift_release(v336);
      v398 = v344;
      *(_BYTE *)(v344 + 3) = 8;
      swift_release(v337);
      v346 = v317[2];
      v347 = _swiftEmptyArrayStorage;
      if (v346)
      {
        v411 = _swiftEmptyArrayStorage;
        sub_10008E170();
        sub_10008E0DC();
        sub_10008E000();
        v349 = (char *)v317 + v348;
        v351 = *(_QWORD *)(v350 + 72);
        v352 = *(uint64_t (**)(char *, char *, uint64_t))(v350 + 16);
        do
        {
          v353 = v384;
          v354 = v396;
          v355 = v352(v384, v349, v396);
          v356 = IngestionError.rawValue.getter(v355);
          v358 = v357;
          (*(void (**)(char *, uint64_t))(v393 + 8))(v353, v354);
          v347 = v411;
          if ((swift_isUniquelyReferenced_nonNull_native(v411) & 1) == 0)
          {
            sub_10008E170();
            sub_10008E020();
            v347 = v411;
          }
          v360 = v347[2];
          v359 = v347[3];
          if (v360 >= v359 >> 1)
          {
            sub_10008DFF0(v359);
            sub_10008E020();
            v347 = v411;
          }
          v347[2] = v360 + 1;
          v361 = &v347[2 * v360];
          v361[4] = v356;
          v361[5] = v358;
          v349 += v351;
          --v346;
          v362 = v404.n128_u64[0];
          v363 = v403;
        }
        while (v346);
        v364 = v380;
        v365 = v379;
      }
      else
      {
        v362 = v404.n128_u64[0];
        v363 = v403;
        v364 = v343;
        v365 = v342;
      }
      v366 = (uint8_t *)v398;
      v367 = Array.description.getter(v347, &type metadata for String);
      v369 = v368;
      sub_1000061E8();
      sub_100014B44(v367, v369, (uint64_t *)&v406);
      v371 = sub_10008DF64(v370);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v371, v372, v366 + 4, v373);
      sub_100018574();
      swift_release(v362);
      swift_release(v363);
      swift_release(v400);
      swift_release(v399);
      swift_bridgeObjectRelease(v369);
      v374 = v401;
      sub_100018948((void *)&_mh_execute_header, v401, (os_log_type_t)v402, "Ingestion Errors: %s", v366);
      v375 = v397;
      sub_100018940(v397);
      sub_10000A818(v375);
      sub_10000A818((uint64_t)v366);

      (*((void (**)(uint8_t *, NSObject *))v365 + 1))(v378, v364);
    }
    else
    {

      sub_100018574();
      swift_release(v331);
      swift_release(v332);
      swift_release(v338);
      swift_release(v339);
      swift_release(v337);
      swift_release(v336);
      (*((void (**)(uint8_t *, NSObject *))v379 + 1))(v378, v380);
    }
    return sub_10008C3AC(v381);
  }
  if (v313 >= 1)
  {
    v316 = 0;
    v317 = _swiftEmptyArrayStorage;
    v318 = v383;
    do
    {
      if ((v159 & 0xC000000000000001) != 0)
        v319 = sub_10008E0E4();
      else
        v319 = (uint64_t)sub_10001887C(v159 + 8 * v316);
      v320 = (void *)v319;
      dispatch thunk of SportingEventCoverageIngestionUpdate.statusCode.getter();

      v321 = v396;
      if (sub_100009658(v315, 1, v396) == 1)
      {
        sub_10000A47C(v315, &qword_1000D3348);
      }
      else
      {
        v322 = *(void (**)(uint64_t, uint64_t, uint64_t))(v393 + 32);
        v322(v318, v315, v321);
        v322((uint64_t)v392, v318, v321);
        if ((swift_isUniquelyReferenced_nonNull_native(v317) & 1) == 0)
        {
          v327 = sub_10008E038();
          v317 = (_QWORD *)sub_10001381C(v327, v328, v329, v330);
        }
        v324 = v317[2];
        v323 = v317[3];
        if (v324 >= v323 >> 1)
          v317 = (_QWORD *)sub_10001381C(v323 > 1, v324 + 1, 1, (uint64_t)v317);
        v317[2] = v324 + 1;
        sub_10008E000();
        v322((uint64_t)v317 + v325 + *(_QWORD *)(v326 + 72) * v324, (uint64_t)v392, v396);
        v315 = v385;
      }
      ++v316;
    }
    while (v313 != v316);
    goto LABEL_211;
  }
  __break(1u);
  return result;
}

void sub_10008B954(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  __n128 v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void **p_vtable;
  _QWORD *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint8_t *v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51[2];

  v2 = sub_10000738C(&qword_1000D1298);
  __chkstk_darwin(v2);
  v4 = (char *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for SportingEventViewContext(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    sub_10000964C((uint64_t)v4, 1, 1, v5);
    goto LABEL_9;
  }
  SportingEventSubscription.view.getter(v7);
  if (sub_100009658((uint64_t)v4, 1, v5) == 1)
  {
LABEL_9:
    sub_10000A47C((uint64_t)v4, &qword_1000D1298);
    return;
  }
  v10 = (*(uint64_t (**)(char *, char *, uint64_t))(v6 + 32))(v9, v4, v5);
  v11 = SportingEventViewContext.mode.getter(v10);
  p_vtable = _TtC7sportsd30DirectActivityRequestXPCServer.vtable;
  v14 = &objc_retain_x21;
  if (v12)
  {
    v15 = v12;
    v48 = v11;
    if (qword_1000CFAB8 != -1)
      swift_once(&qword_1000CFAB8, sub_10006CC6C);
    v16 = type metadata accessor for Logger(0);
    sub_1000096EC(v16, (uint64_t)qword_1000DDAA0);
    v17 = swift_bridgeObjectRetain(v15);
    v18 = Logger.logObject.getter(v17);
    v19 = static os_log_type_t.debug.getter(v18);
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc(12, -1);
      v21 = swift_slowAlloc(32, -1);
      v51[0] = v21;
      *(_DWORD *)v20 = 136315138;
      v47 = v20 + 4;
      swift_bridgeObjectRetain(v15);
      sub_100014B44(v48, v15, v51);
      v49 = v22;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v49, &v50, v47, v20 + 12);
      swift_bridgeObjectRelease_n(v15, 3);
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Mode: %s", v20, 0xCu);
      swift_arrayDestroy(v21, 1);
      v23 = v21;
      v14 = (_QWORD *)&objc_retain_x21;
      swift_slowDealloc(v23, -1, -1);
      v24 = v20;
      p_vtable = (void **)(_TtC7sportsd30DirectActivityRequestXPCServer + 24);
      swift_slowDealloc(v24, -1, -1);

    }
    else
    {

      v11 = swift_bridgeObjectRelease_n(v15, 2);
    }
  }
  v25 = SportingEventViewContext.players.getter(v11);
  if (v25)
  {
    v26 = v25;
    if (p_vtable[343] != (void *)-1)
      swift_once(&qword_1000CFAB8, sub_10006CC6C);
    v27 = type metadata accessor for Logger(0);
    sub_1000096EC(v27, (uint64_t)qword_1000DDAA0);
    v28 = swift_bridgeObjectRetain(v26);
    v29 = Logger.logObject.getter(v28);
    v30 = static os_log_type_t.debug.getter(v29);
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc(12, -1);
      v48 = swift_slowAlloc(32, -1);
      v51[0] = v48;
      *(_DWORD *)v31 = v14[437];
      v32 = v31 + 12;
      v46 = v31 + 4;
      v47 = v31;
      v33 = swift_bridgeObjectRetain(v26);
      v34 = Array.description.getter(v33, &type metadata for String);
      v36 = v35;
      swift_bridgeObjectRelease(v26);
      sub_100014B44(v34, v36, v51);
      v49 = v37;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v49, &v50, v46, v32);
      swift_bridgeObjectRelease_n(v26, 2);
      swift_bridgeObjectRelease(v36);
      v38 = v47;
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "Players: %s", v47, 0xCu);
      v39 = v48;
      swift_arrayDestroy(v48, 1);
      swift_slowDealloc(v39, -1, -1);
      swift_slowDealloc(v38, -1, -1);

    }
    else
    {

      v25 = swift_bridgeObjectRelease_n(v26, 2);
    }
  }
  v40 = SportingEventViewContext.statistics.getter(v25);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)(v40 + 16);
    if (v42)
    {
      v43 = (uint64_t *)(v40 + 40);
      do
      {
        v44 = *v43;
        v51[0] = *(v43 - 1);
        v51[1] = v44;
        swift_bridgeObjectRetain(v44);
        sub_10008BDE0(v51);
        swift_bridgeObjectRelease(v44);
        v43 += 2;
        --v42;
      }
      while (v42);
    }
    swift_bridgeObjectRelease(v41);
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

void sub_10008BDE0(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  double *v15;
  unint64_t v16;
  uint64_t v17;
  double v18;
  unint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  _BYTE v40[16];
  char *v41;
  _QWORD *v42;
  unint64_t v43;
  _QWORD *v44;
  uint64_t v45;

  v2 = v1;
  v4 = sub_10000738C(qword_1000D3390);
  __chkstk_darwin(v4);
  v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *a1;
  v8 = a1[1];
  swift_bridgeObjectRetain(v8);
  v37 = v7;
  v9 = SportingEventCompetitorStatisticType.StatisticName.init(rawValue:)(v7, v8);
  v10 = dispatch thunk of SportingEvent.competitors.getter(v9);
  v39 = v6;
  v41 = v6;
  sub_100089104((void (*)(uint64_t *__return_ptr, id *))sub_10008DED8, (uint64_t)v40, v10);
  v12 = v11;
  v38 = v2;
  swift_bridgeObjectRelease(v10);
  v13 = *(_QWORD *)(v12 + 16);
  if (v13)
  {
    v36 = v8;
    v44 = _swiftEmptyArrayStorage;
    sub_100015688();
    v14 = v44;
    v35 = v12;
    v15 = (double *)(v12 + 40);
    do
    {
      if ((*(_BYTE *)v15 & 1) != 0)
      {
        v16 = 0xE300000000000000;
        v17 = 4271950;
      }
      else
      {
        v18 = *(v15 - 1);
        v42 = 0;
        v43 = 0xE000000000000000;
        Double.write<A>(to:)(v18);
        v17 = (uint64_t)v42;
        v16 = v43;
      }
      v44 = v14;
      v19 = v14[2];
      if (v19 >= v14[3] >> 1)
      {
        sub_100015688();
        v14 = v44;
      }
      v14[2] = v19 + 1;
      v20 = &v14[2 * v19];
      v20[4] = v17;
      v20[5] = v16;
      v15 += 2;
      --v13;
    }
    while (v13);
    swift_bridgeObjectRelease(v35);
    v8 = v36;
  }
  else
  {
    swift_bridgeObjectRelease(v12);
    v14 = _swiftEmptyArrayStorage;
  }
  v42 = v14;
  v21 = sub_10000738C(&qword_1000D0440);
  v22 = sub_100023740();
  v23 = BidirectionalCollection<>.joined(separator:)(2108704, 0xE300000000000000, v21, v22);
  v25 = v24;
  swift_bridgeObjectRelease(v14);
  if (qword_1000CFAB8 != -1)
    swift_once(&qword_1000CFAB8, sub_10006CC6C);
  v26 = type metadata accessor for Logger(0);
  sub_1000096EC(v26, (uint64_t)qword_1000DDAA0);
  swift_bridgeObjectRetain_n(v8, 2);
  v27 = swift_bridgeObjectRetain(v25);
  v28 = Logger.logObject.getter(v27);
  v29 = static os_log_type_t.debug.getter(v28);
  if (os_log_type_enabled(v28, v29))
  {
    v30 = swift_slowAlloc(22, -1);
    v31 = swift_slowAlloc(64, -1);
    v42 = (_QWORD *)v31;
    *(_DWORD *)v30 = 136315394;
    swift_bridgeObjectRetain(v8);
    sub_100014B44(v37, v8, (uint64_t *)&v42);
    v44 = v32;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v44, &v45, v30 + 4, v30 + 12);
    swift_bridgeObjectRelease_n(v8, 3);
    *(_WORD *)(v30 + 12) = 2080;
    swift_bridgeObjectRetain(v25);
    sub_100014B44(v23, v25, (uint64_t *)&v42);
    v44 = v33;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v44, &v45, v30 + 14, v30 + 22);
    swift_bridgeObjectRelease_n(v25, 3);
    _os_log_impl((void *)&_mh_execute_header, v28, v29, "Statistic '%s': %s", (uint8_t *)v30, 0x16u);
    swift_arrayDestroy(v31, 2);
    swift_slowDealloc(v31, -1, -1);
    swift_slowDealloc(v30, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v25, 2);
    swift_bridgeObjectRelease_n(v8, 2);
  }
  sub_10000A47C((uint64_t)v39, qword_1000D3390);
}

uint64_t sub_10008C1BC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;

  v5 = type metadata accessor for SportingEventCompetitorStatisticType.StatisticName(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_10000738C(qword_1000D3390);
  __chkstk_darwin(v9);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009D5C(a1, (uint64_t)v11, qword_1000D3390);
  result = sub_100009658((uint64_t)v11, 1, v5);
  if ((_DWORD)result == 1)
  {
    v13 = 0;
    v14 = 1;
LABEL_5:
    *(_QWORD *)a2 = v13;
    *(_BYTE *)(a2 + 8) = v14;
    return result;
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v11, v5);
  sub_10008C324((uint64_t)v8, (uint64_t)&v15);
  if (!v2)
  {
    result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v13 = v15;
    v14 = v16 & 1;
    goto LABEL_5;
  }
  result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  __break(1u);
  return result;
}

void sub_10008C324(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  void *v4;
  void *v5;
  double v6;

  v4 = (void *)SportingEventCompetitorContainer.competitor.getter();
  v5 = (void *)dispatch thunk of SportingEventCompetitor.getStatistic(name:)(a1);

  if (v5)
  {
    v6 = SportingEventCompetitorStatistic.value.getter();

  }
  else
  {
    v6 = 0.0;
  }
  *(double *)a2 = v6;
  *(_BYTE *)(a2 + 8) = v5 == 0;
}

uint64_t sub_10008C3AC(void *a1)
{
  __n128 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *p_isa;
  unint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  __n128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __n128 v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t i;
  unint64_t v20;
  NSObject *v21;
  NSObject *v22;
  BOOL v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  char v28;
  char v29;
  void *v30;
  uint64_t v31;
  char v32;
  char v33;
  unint64_t v34;
  Swift::String v35;
  uint64_t v36;
  uint64_t v37;
  Swift::String v38;
  void *object;
  NSObject *v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  unint64_t v47;
  id v48;
  void *v49;
  void *v50;
  uint64_t v51;
  id v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  Swift::String v58;
  void *v59;
  unint64_t v60;
  NSObject *v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  char *v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  NSObject *v77;
  os_log_type_t v78;
  uint8_t *v79;
  uint8_t *v80;
  uint64_t v81;
  uint64_t v82;
  NSObject *v83;
  uint64_t v84;
  NSObject *v85;
  int v86;
  _BOOL4 v87;
  NSObject *v88;
  uint64_t v89;
  uint64_t v90;
  _QWORD *v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  unint64_t v95;
  NSObject *v96;
  uint64_t v97;
  uint64_t v98;
  char v99;
  char v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  NSObject *v104;
  NSObject *v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  unint64_t v109;
  NSObject *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  unint64_t v116;
  NSObject *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  uint64_t v122;
  uint64_t (*v123)(char *, unint64_t, uint64_t);
  _QWORD *v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  _QWORD *v132;
  _QWORD *v133;
  _QWORD *v134;
  uint64_t v135;
  unint64_t v136;
  unint64_t v137;
  NSObject *v138;
  NSObject *v139;
  os_log_t v140;
  NSObject *v141;
  uint64_t v142;
  char *v143;
  uint64_t v144;
  uint64_t v145;
  unint64_t v146;
  uint64_t v147;
  char v149;
  void (*v150)(char *, _QWORD *);
  uint64_t v151;
  os_log_t v152;
  _QWORD *v153;
  void (*v154)(char *, _QWORD *);
  uint64_t v155;
  uint64_t v156;
  unint64_t v157;
  id v158;
  void *v159;
  char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  objc_class *v164;
  objc_class *v165;
  NSObject *v166;
  unint64_t isa;
  NSObject *v168;
  uint64_t v169;
  unint64_t v170;
  unint64_t v171;
  NSObject *v172;
  uint64_t v173;
  NSObject *v174;
  int v175;
  uint64_t v176;
  _QWORD *v177;
  uint64_t v178;
  char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  unint64_t v183;
  unint64_t v184;
  NSObject *v185;
  NSObject *v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  void *v190;
  void *v191;
  os_log_type_t v192;
  uint64_t v193;
  char v194;
  char v195;
  uint64_t v196;
  unint64_t v197;
  unint64_t v198;
  NSObject *v199;
  NSObject *v200;
  uint64_t v201;
  __int128 v203;
  __int128 v204;
  char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  char *v210;
  __int128 v211;
  uint64_t v212;
  unsigned int v213;
  char *v214;
  NSObject *v215;
  int v216;
  uint64_t v217;
  uint64_t v218;
  unint64_t v219;
  char *v220;
  uint64_t v221;
  uint64_t v222;
  id v223;
  os_log_t v224;
  uint64_t v225;
  unint64_t v226;
  uint64_t v227;
  _QWORD *v228;
  _QWORD *v229;
  char *v230;
  unint64_t v231;
  NSObject *v232;
  NSObject *v233;
  char *v234;
  uint64_t v235;
  uint64_t v236;
  char *v237;
  uint64_t v238;
  uint64_t v239;
  char v240[8];
  char v241[8];
  NSObject *v242;
  _QWORD v243[2];
  NSObject *v244;
  unint64_t v245;
  NSObject *v246;
  unint64_t v247;

  v223 = a1;
  v207 = type metadata accessor for SportingEventPlay.BaseballPlay(0);
  v206 = *(_QWORD *)(v207 - 8);
  v1 = __chkstk_darwin(v207);
  v205 = (char *)&v203 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for SportingEventCompetitorContainer.BaseballScores(0, v1);
  v238 = *(_QWORD *)(v3 - 8);
  v239 = v3;
  __chkstk_darwin(v3);
  v237 = (char *)&v203 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  p_isa = (_QWORD *)type metadata accessor for Sport(0);
  v6 = *(p_isa - 1);
  __chkstk_darwin(p_isa);
  v8 = (char *)&v203 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v9);
  v214 = (char *)&v203 - v11;
  v12 = type metadata accessor for SportingEventPlayAnnotation(0, v10);
  v13 = *(_QWORD *)(v12 - 8);
  v235 = v12;
  v236 = v13;
  __chkstk_darwin(v12);
  v234 = (char *)&v203 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v222 = type metadata accessor for CharacterSet(0);
  v221 = *(_QWORD *)(v222 - 8);
  v15 = __chkstk_darwin(v222);
  v220 = (char *)&v203 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = dispatch thunk of SportingEvent.plays.getter(v15);
  if ((unint64_t)v17 >> 62)
    goto LABEL_128;
  for (i = *(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10); i; i = _CocoaArrayWrapper.endIndex.getter(v201))
  {
    v20 = 0;
    v219 = v17 & 0xC000000000000001;
    v209 = v17 & 0xFFFFFFFFFFFFFF8;
    v208 = v17 + 32;
    v229 = v243;
    v213 = enum case for Sport.baseball(_:);
    *(_QWORD *)&v18 = 134219778;
    v211 = v18;
    *(_QWORD *)&v18 = 134218754;
    v204 = v18;
    v203 = xmmword_10009FDB0;
    v210 = (char *)&type metadata for Any + 8;
    v228 = p_isa;
    v231 = v6;
    v230 = v8;
    v218 = v17;
    v217 = i;
    while (1)
    {
      if (v219)
      {
        v21 = specialized _ArrayBuffer._getElementSlowPath(_:)(v20, v17);
      }
      else
      {
        if (v20 >= *(_QWORD *)(v209 + 16))
          goto LABEL_126;
        v21 = *(id *)(v208 + 8 * v20);
      }
      v22 = v21;
      v23 = __OFADD__(v20, 1);
      v24 = (v20 + 1);
      if (v23)
        goto LABEL_124;
      v233 = v24;
      v246 = 0;
      v247 = 0xE000000000000000;
      v25 = ((uint64_t (*)(void))dispatch thunk of SportingEventPlay.clock.getter)();
      if (v25)
      {
        v26 = (void *)v25;
        v27 = dispatch thunk of SportingEventClock.minutes.getter();
        v29 = v28;

        if ((v29 & 1) == 0)
        {
          v25 = ((uint64_t (*)(void))dispatch thunk of SportingEventPlay.clock.getter)();
          if (v25)
          {
            v30 = (void *)v25;
            v31 = dispatch thunk of SportingEventClock.seconds.getter();
            v33 = v32;

            if ((v33 & 1) == 0)
            {
              v242 = v27;
              v244 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
              v245 = v34;
              v35._countAndFlagsBits = 58;
              v35._object = (void *)0xE100000000000000;
              String.append(_:)(v35);
              v36 = sub_10000738C(&qword_1000D05A8);
              v37 = swift_allocObject(v36, 72, 7);
              *(_OWORD *)(v37 + 16) = v203;
              *(_QWORD *)(v37 + 56) = &type metadata for Int;
              *(_QWORD *)(v37 + 64) = &protocol witness table for Int;
              *(_QWORD *)(v37 + 32) = v31;
              v38._countAndFlagsBits = String.init(format:_:)(1681010725, 0xE400000000000000, v37);
              object = v38._object;
              String.append(_:)(v38);
              swift_bridgeObjectRelease(object);
              v40 = v244;
              v41 = v245;
              swift_beginAccess(&v246, v240, 1, 0);
              v42 = v247;
              v246 = v40;
              v247 = v41;
              v25 = swift_bridgeObjectRelease(v42);
            }
          }
        }
      }
      v43 = dispatch thunk of SportingEventPlay.competitors.getter(v25);
      v17 = v43;
      if ((unint64_t)v43 >> 62)
        break;
      v44 = *(_QWORD *)((v43 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v44)
        goto LABEL_16;
LABEL_43:
      swift_bridgeObjectRelease(v17);
      v45 = _swiftEmptyArrayStorage;
LABEL_44:
      v244 = v45;
      v62 = sub_10000738C(&qword_1000D0440);
      v63 = sub_100023740();
      v227 = v62;
      v226 = v63;
      v64 = BidirectionalCollection<>.joined(separator:)(2108704, 0xE300000000000000, v62, v63);
      v66 = v65;
      v67 = swift_bridgeObjectRelease(v45);
      v244 = SportingEventPlay.playDescription.getter(v67);
      v245 = v68;
      v69 = v220;
      static CharacterSet.whitespacesAndNewlines.getter(v244);
      v70 = sub_10000D2DC();
      v71 = StringProtocol.trimmingCharacters(in:)(v69, &type metadata for String, v70);
      v73 = v72;
      (*(void (**)(char *, uint64_t))(v221 + 8))(v69, v222);
      swift_bridgeObjectRelease(v245);
      swift_bridgeObjectRelease(v73);
      v74 = HIBYTE(v73) & 0xF;
      if ((v73 & 0x2000000000000000) == 0)
        v74 = v71 & 0xFFFFFFFFFFFFLL;
      v20 = (unint64_t)v233;
      if (!v74)
      {
        if (qword_1000CFAB8 != -1)
          swift_once(&qword_1000CFAB8, sub_10006CC6C);
        v75 = type metadata accessor for Logger(0);
        v76 = sub_1000096EC(v75, (uint64_t)qword_1000DDAA0);
        v77 = Logger.logObject.getter(v76);
        v78 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v77, v78))
        {
          v79 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v79 = 0;
          _os_log_impl((void *)&_mh_execute_header, v77, v78, "Blank Play:", v79, 2u);
          v80 = v79;
          v20 = (unint64_t)v233;
          swift_slowDealloc(v80, -1, -1);
        }

      }
      if (qword_1000CFAB8 != -1)
        swift_once(&qword_1000CFAB8, sub_10006CC6C);
      v81 = type metadata accessor for Logger(0);
      v82 = sub_1000096EC(v81, (uint64_t)qword_1000DDAA0);
      v83 = v22;
      v84 = swift_bridgeObjectRetain(v66);
      v225 = v82;
      v85 = Logger.logObject.getter(v84);
      v86 = static os_log_type_t.debug.getter(v85);
      v87 = os_log_type_enabled(v85, (os_log_type_t)v86);
      v232 = v83;
      if (v87)
      {
        v216 = v86;
        v224 = v85;
        v88 = v83;
        v89 = swift_slowAlloc(82, -1);
        v215 = swift_slowAlloc(192, -1);
        v244 = v215;
        *(_DWORD *)v89 = v211;
        v242 = v20;
        v90 = v64;
        v91 = v229;
        v92 = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v242, v229, v89 + 4, v89 + 12);
        *(_WORD *)(v89 + 12) = 2080;
        v93 = dispatch thunk of SportingEventPlay.id.getter(v92);
        if (v94)
        {
          v95 = v94;
        }
        else
        {
          v93 = 1819047278;
          v95 = 0xE400000000000000;
        }
        sub_100014B44(v93, v95, (uint64_t *)&v244);
        v242 = v96;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v242, v91, v89 + 14, v89 + 22);

        v97 = swift_bridgeObjectRelease(v95);
        *(_WORD *)(v89 + 22) = 2048;
        v98 = dispatch thunk of SportingEventPlay.stamp.getter(v97);
        v100 = v99;

        if ((v100 & 1) != 0)
          v101 = -1;
        else
          v101 = v98;
        v242 = v101;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v242, v91, v89 + 24, v89 + 32);

        *(_WORD *)(v89 + 32) = 2080;
        swift_beginAccess(&v246, v241, 0, 0);
        v102 = (uint64_t)v246;
        v103 = v247;
        swift_bridgeObjectRetain(v247);
        sub_100014B44(v102, v103, (uint64_t *)&v244);
        v242 = v104;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v242, v91, v89 + 34, v89 + 42);
        swift_bridgeObjectRelease(v103);
        *(_WORD *)(v89 + 42) = 2080;
        swift_bridgeObjectRetain(v66);
        sub_100014B44(v90, v66, (uint64_t *)&v244);
        v242 = v105;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v242, v91, v89 + 44, v89 + 52);
        v106 = swift_bridgeObjectRelease_n(v66, 3);
        *(_WORD *)(v89 + 52) = 2080;
        v107 = SportingEventPlay.playDescription.getter(v106);
        v109 = v108;
        sub_100014B44(v107, v108, (uint64_t *)&v244);
        v242 = v110;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v242, v91, v89 + 54, v89 + 62);

        v111 = swift_bridgeObjectRelease(v109);
        *(_WORD *)(v89 + 62) = 2080;
        v112 = dispatch thunk of SportingEventPlay.levels.getter(v111);
        v113 = type metadata accessor for SportingEventPlayLevel(0);
        v114 = Array.description.getter(v112, v113);
        v116 = v115;
        swift_bridgeObjectRelease(v112);
        sub_100014B44(v114, v116, (uint64_t *)&v244);
        v242 = v117;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v242, v91, v89 + 64, v89 + 72);

        v118 = swift_bridgeObjectRelease(v116);
        *(_WORD *)(v89 + 72) = 2080;
        v119 = dispatch thunk of SportingEventPlay.annotations.getter(v118);
        if (v119)
        {
          v120 = *(_QWORD *)(v119 + 16);
          v212 = v119;
          if (v120)
          {
            v121 = v119
                 + ((*(unsigned __int8 *)(v236 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v236 + 80));
            v122 = *(_QWORD *)(v236 + 72);
            v123 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v236 + 16);
            v124 = _swiftEmptyArrayStorage;
            do
            {
              v126 = v234;
              v125 = v235;
              v127 = v123(v234, v121, v235);
              v128 = SportingEventPlayAnnotation.rawValue.getter(v127);
              v130 = v129;
              (*(void (**)(char *, uint64_t))(v236 + 8))(v126, v125);
              if ((swift_isUniquelyReferenced_nonNull_native(v124) & 1) == 0)
              {
                sub_100013494();
                v124 = v133;
              }
              v131 = v124[2];
              if (v131 >= v124[3] >> 1)
              {
                sub_100013494();
                v124 = v134;
              }
              v124[2] = v131 + 1;
              v132 = &v124[2 * v131];
              v132[4] = v128;
              v132[5] = v130;
              v121 += v122;
              --v120;
            }
            while (v120);
          }
          else
          {
            v124 = _swiftEmptyArrayStorage;
          }
          swift_bridgeObjectRelease(v212);
          p_isa = v228;
        }
        else
        {
          v124 = &off_1000C2A18;
        }
        v6 = v231;
        v8 = v230;
        v135 = Array.description.getter(v124, &type metadata for String);
        v137 = v136;
        swift_bridgeObjectRelease(v124);
        sub_100014B44(v135, v137, (uint64_t *)&v244);
        v242 = v138;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v242, v229, v89 + 74, v89 + 82);
        v139 = v232;

        swift_bridgeObjectRelease(v137);
        v140 = v224;
        _os_log_impl((void *)&_mh_execute_header, v224, (os_log_type_t)v216, "Play[%ld], id: %s, play stamp: %ld, play clock: %s, play score: %s - %s, play levels: %s, play annotations: %s", (uint8_t *)v89, 0x52u);
        v141 = v215;
        swift_arrayDestroy(v215, 6);
        swift_slowDealloc(v141, -1, -1);
        swift_slowDealloc(v89, -1, -1);

        v20 = (unint64_t)v233;
      }
      else
      {

        swift_bridgeObjectRelease_n(v66, 2);
      }
      if (v223)
      {
        v224 = (os_log_t)v223;
        v142 = SportingEventSubscription.sport.getter();
        v143 = v214;
        Sport.init(rawValue:)(v142);
        (*(void (**)(char *, _QWORD, _QWORD *))(v6 + 104))(v8, v213, p_isa);
        sub_100005B28(&qword_1000D1F00, (uint64_t (*)(uint64_t))&type metadata accessor for Sport, (uint64_t)&protocol conformance descriptor for Sport);
        v145 = v144;
        dispatch thunk of RawRepresentable.rawValue.getter(p_isa, v144);
        dispatch thunk of RawRepresentable.rawValue.getter(p_isa, v145);
        v146 = v245;
        v147 = v243[0];
        if (v244 == v242 && v245 == v243[0])
        {
          swift_bridgeObjectRelease_n(v245, 2);
          v154 = *(void (**)(char *, _QWORD *))(v6 + 8);
          v154(v8, p_isa);
          v151 = ((uint64_t (*)(char *, _QWORD *))v154)(v143, p_isa);
        }
        else
        {
          v149 = _stringCompareWithSmolCheck(_:_:expecting:)(v244, v245, v242, v243[0], 0);
          swift_bridgeObjectRelease(v146);
          swift_bridgeObjectRelease(v147);
          v150 = *(void (**)(char *, _QWORD *))(v6 + 8);
          v150(v8, p_isa);
          v151 = ((uint64_t (*)(char *, _QWORD *))v150)(v143, p_isa);
          if ((v149 & 1) == 0)
          {

            v152 = v232;
            goto LABEL_113;
          }
        }
        v155 = dispatch thunk of SportingEventPlay.competitors.getter(v151);
        v17 = v155;
        if ((unint64_t)v155 >> 62)
        {
          if (v155 >= 0)
            v155 &= 0xFFFFFFFFFFFFFF8uLL;
          v156 = _CocoaArrayWrapper.endIndex.getter(v155);
          if (v156)
          {
LABEL_86:
            v244 = _swiftEmptyArrayStorage;
            sub_100015688();
            if ((v156 & 0x8000000000000000) == 0)
            {
              v8 = (char *)(v17 & 0xC000000000000001);
              p_isa = (_QWORD *)(v17 & 0xFFFFFFFFFFFFFF8);
              v6 = v156 + 3;
              while (v6 != 0x8000000000000003)
              {
                v157 = v6 - 4;
                if (v8)
                {
                  v158 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v157, v17);
                }
                else
                {
                  if ((v157 & 0x8000000000000000) != 0)
                    goto LABEL_122;
                  if (v157 >= *(_QWORD *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10))
                    goto LABEL_123;
                  v158 = *(id *)(v17 + 8 * v6);
                }
                v159 = v158;
                v160 = v237;
                SportingEventCompetitorContainer.baseballScores.getter();
                sub_100005B28(&qword_1000D3380, (uint64_t (*)(uint64_t))&type metadata accessor for SportingEventCompetitorContainer.BaseballScores, (uint64_t)&protocol conformance descriptor for SportingEventCompetitorContainer.BaseballScores);
                v161 = v239;
                v163 = dispatch thunk of CustomStringConvertible.description.getter(v239, v162);
                v165 = v164;
                (*(void (**)(char *, uint64_t))(v238 + 8))(v160, v161);

                v166 = v244;
                if ((swift_isUniquelyReferenced_nonNull_native(v244) & 1) == 0)
                {
                  sub_100015688();
                  v166 = v244;
                }
                isa = (unint64_t)v166[2].isa;
                if (isa >= (unint64_t)v166[3].isa >> 1)
                {
                  sub_100015688();
                  v166 = v244;
                }
                v166[2].isa = (Class)(isa + 1);
                v168 = &v166[2 * isa];
                v168[4].isa = (Class)v163;
                v168[5].isa = v165;
                if (--v6 == 3)
                {
                  swift_bridgeObjectRelease(v17);
                  p_isa = v228;
                  v6 = v231;
                  v8 = v230;
                  goto LABEL_104;
                }
              }
              goto LABEL_119;
            }
            goto LABEL_127;
          }
        }
        else
        {
          v156 = *(_QWORD *)((v155 & 0xFFFFFFFFFFFFF8) + 0x10);
          if (v156)
            goto LABEL_86;
        }
        swift_bridgeObjectRelease(v17);
        v166 = _swiftEmptyArrayStorage;
LABEL_104:
        v244 = v166;
        v169 = BidirectionalCollection<>.joined(separator:)(539831584, 0xE400000000000000, v227, v226);
        v171 = v170;
        swift_bridgeObjectRelease(v166);
        v172 = v232;
        v173 = swift_bridgeObjectRetain(v171);
        v174 = Logger.logObject.getter(v173);
        v175 = static os_log_type_t.debug.getter(v174);
        if (os_log_type_enabled(v174, (os_log_type_t)v175))
        {
          LODWORD(v226) = v175;
          v176 = swift_slowAlloc(42, -1);
          v232 = swift_slowAlloc(96, -1);
          v244 = v232;
          *(_DWORD *)v176 = v204;
          v242 = v233;
          v177 = v229;
          v178 = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v242, v229, v176 + 4, v176 + 12);
          *(_WORD *)(v176 + 12) = 2080;
          v227 = v169;
          v179 = v205;
          SportingEventPlay.baseballPlay.getter(v178);
          sub_100005B28(&qword_1000D3388, (uint64_t (*)(uint64_t))&type metadata accessor for SportingEventPlay.BaseballPlay, (uint64_t)&protocol conformance descriptor for SportingEventPlay.BaseballPlay);
          v180 = v207;
          v182 = dispatch thunk of CustomStringConvertible.description.getter(v207, v181);
          v184 = v183;
          (*(void (**)(char *, uint64_t))(v206 + 8))(v179, v180);
          sub_100014B44(v182, v184, (uint64_t *)&v244);
          v242 = v185;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v242, v177, v176 + 14, v176 + 22);

          swift_bridgeObjectRelease(v184);
          *(_WORD *)(v176 + 22) = 2080;
          swift_bridgeObjectRetain(v171);
          sub_100014B44(v227, v171, (uint64_t *)&v244);
          v242 = v186;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v242, v177, v176 + 24, v176 + 32);
          v187 = swift_bridgeObjectRelease_n(v171, 3);
          *(_WORD *)(v176 + 32) = 2080;
          v188 = dispatch thunk of SportingEventPlay.clock.getter(v187);
          if (v188)
          {
            v189 = (void *)v188;
            v190 = (void *)SportingEventClock.period.getter();

            v191 = (void *)dispatch thunk of SportingEventClockPeriod.subPeriod.getter();
            p_isa = v228;
            v6 = v231;
            v8 = v230;
            v192 = v226;
            if (!v191
              || (v193 = dispatch thunk of SportingEventClockPeriod.index.getter(),
                  v195 = v194,
                  v191,
                  (v195 & 1) != 0))
            {
              v198 = 0xE400000000000000;
              v196 = 1819047278;
            }
            else
            {
              v242 = v193;
              v196 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
              v198 = v197;
            }
          }
          else
          {
            v198 = 0xE400000000000000;
            v196 = 1819047278;
            p_isa = v228;
            v6 = v231;
            v8 = v230;
            v192 = v226;
          }
          sub_100014B44(v196, v198, (uint64_t *)&v244);
          v242 = v199;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v242, v229, v176 + 34, v176 + 42);

          swift_bridgeObjectRelease(v198);
          _os_log_impl((void *)&_mh_execute_header, v174, v192, "Play_baseball[%ld]: %s, Scores: %s SubPeriod: %s", (uint8_t *)v176, 0x2Au);
          v200 = v232;
          swift_arrayDestroy(v232, 3);
          swift_slowDealloc(v200, -1, -1);
          swift_slowDealloc(v176, -1, -1);

          v152 = v224;
LABEL_113:

        }
        else
        {

          swift_bridgeObjectRelease_n(v171, 2);
        }
        swift_bridgeObjectRelease(v247);
        v17 = v218;
        v153 = (_QWORD *)v217;
        v20 = (unint64_t)v233;
        goto LABEL_115;
      }

      swift_bridgeObjectRelease(v247);
      v17 = v218;
      v153 = (_QWORD *)v217;
LABEL_115:
      if ((_QWORD *)v20 == v153)
        return swift_bridgeObjectRelease(v17);
    }
    if (v43 >= 0)
      v43 &= 0xFFFFFFFFFFFFFF8uLL;
    v44 = _CocoaArrayWrapper.endIndex.getter(v43);
    if (!v44)
      goto LABEL_43;
LABEL_16:
    v242 = _swiftEmptyArrayStorage;
    sub_100015688();
    if (v44 < 0)
      goto LABEL_125;
    v232 = v22;
    v45 = v242;
    v8 = (char *)(v17 & 0xFFFFFFFFFFFFFF8);
    v46 = v44 + 3;
    while (2)
    {
      if (v46 != 0x8000000000000003)
      {
        v47 = v46 - 4;
        if ((v17 & 0xC000000000000001) != 0)
        {
          v48 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v47, v17);
        }
        else
        {
          if ((v47 & 0x8000000000000000) != 0)
            goto LABEL_120;
          if (v47 >= *(_QWORD *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_121;
          v48 = *(id *)(v17 + 8 * v46);
        }
        v49 = v48;
        v244 = 0;
        v245 = 0xE000000000000000;
        v50 = (void *)SportingEventCompetitorContainer.score.getter();
        v51 = SportingEventCompetitorScore.scoreEntries.getter();

        if ((unint64_t)v51 >> 62)
        {
          if (v51 < 0)
            v56 = v51;
          else
            v56 = v51 & 0xFFFFFFFFFFFFFF8;
          swift_bridgeObjectRetain(v51);
          v57 = _CocoaArrayWrapper.endIndex.getter(v56);
          swift_bridgeObjectRelease(v51);
          if (!v57)
            goto LABEL_34;
LABEL_26:
          if ((v51 & 0xC000000000000001) != 0)
          {
            v52 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v51);
          }
          else
          {
            if (!*(_QWORD *)((v51 & 0xFFFFFFFFFFFFF8) + 0x10))
              goto LABEL_118;
            v52 = *(id *)(v51 + 32);
          }
          v53 = v52;
          v54 = swift_bridgeObjectRelease(v51);
          v55 = SportingEventCompetitorScoreEntry.value.getter(v54);

        }
        else
        {
          if (*(_QWORD *)((v51 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_26;
LABEL_34:
          swift_bridgeObjectRelease(v51);
          v55 = -1;
        }
        v243[1] = v55;
        v58._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
        v59 = v58._object;
        String.append(_:)(v58);

        swift_bridgeObjectRelease(v59);
        p_isa = &v244->isa;
        v6 = v245;
        v242 = v45;
        v60 = (unint64_t)v45[2].isa;
        if (v60 >= (unint64_t)v45[3].isa >> 1)
        {
          sub_100015688();
          v45 = v242;
        }
        v45[2].isa = (Class)(v60 + 1);
        v61 = &v45[2 * v60];
        v61[4].isa = (Class)p_isa;
        v61[5].isa = (Class)v6;
        if (--v46 == 3)
        {
          swift_bridgeObjectRelease(v17);
          p_isa = v228;
          v6 = v231;
          v8 = v230;
          v22 = v232;
          goto LABEL_44;
        }
        continue;
      }
      break;
    }
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
    if (v17 < 0)
      v201 = v17;
    else
      v201 = v17 & 0xFFFFFFFFFFFFFF8;
  }
  return swift_bridgeObjectRelease(v17);
}

void sub_10008D78C(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  __n128 v7;
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
  uint64_t v18;
  __n128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  uint64_t v32;
  id v33;
  uint64_t v34;
  char v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  char v49;
  char v50;
  Swift::String v51;
  Swift::String v52;
  void *object;
  Swift::String v54;
  Swift::String v55;
  void *v56;
  unint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  unsigned int v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  uint64_t *v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;

  v3 = v2;
  v6 = sub_10000738C(&qword_1000D2E78);
  v7 = __chkstk_darwin(v6);
  v9 = (char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for SportingEventClockTimeType(0, v7);
  v72 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v63 = (char *)&v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = sub_10000738C(&qword_1000D3368);
  __chkstk_darwin(v70);
  v13 = (char *)&v59 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_10000738C(&qword_1000D3370);
  __chkstk_darwin(v14);
  v65 = (uint64_t)&v59 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v74 = (uint64_t *)((char *)&v59 - v17);
  v19 = __chkstk_darwin(v18);
  v66 = (uint64_t)&v59 - v20;
  v62 = *a1;
  v21 = dispatch thunk of SportingEventClockTimeContainer.clockTimes.getter(v19);
  if (!v21)
    goto LABEL_32;
  v22 = v21 & 0xFFFFFFFFFFFFFF8;
  v71 = v21;
  if ((unint64_t)v21 >> 62)
  {
LABEL_27:
    if (v21 >= 0)
      v58 = v22;
    else
      v58 = v21;
    swift_bridgeObjectRetain(v21);
    v23 = _CocoaArrayWrapper.endIndex.getter(v58);
    if (v23)
      goto LABEL_4;
LABEL_31:
    swift_bridgeObjectRelease_n(v71, 2);
    goto LABEL_32;
  }
  v23 = *(_QWORD *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(v21);
  if (!v23)
    goto LABEL_31;
LABEL_4:
  v59 = v9;
  v60 = a2;
  v61 = v3;
  v69 = v71 & 0xC000000000000001;
  v68 = enum case for SportingEventClockTimeType.announcedAdditional(_:);
  v24 = 4;
  v25 = &qword_1000D3370;
  v3 = v66;
  v67 = (char *)v23;
  while (1)
  {
    if (v69)
      v21 = specialized _ArrayBuffer._getElementSlowPath(_:)(v24 - 4, v71);
    else
      v21 = (uint64_t)*(id *)(v71 + 8 * v24);
    v9 = (char *)(v24 - 3);
    if (__OFADD__(v24 - 4, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    v73 = (id)v21;
    dispatch thunk of SportingEventClockTime.clockType.getter();
    a2 = v74;
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(v72 + 104))(v74, v68, v10);
    sub_10000964C((uint64_t)a2, 0, 1, v10);
    v26 = (uint64_t)&v13[*(int *)(v70 + 48)];
    v27 = v25;
    sub_100009D5C(v3, (uint64_t)v13, v25);
    sub_100009D5C((uint64_t)a2, v26, v25);
    if (sub_100009658((uint64_t)v13, 1, v10) == 1)
      break;
    v28 = v65;
    sub_100009D5C((uint64_t)v13, v65, v25);
    if (sub_100009658(v26, 1, v10) == 1)
    {
      (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v28, v10);
      v3 = v66;
      goto LABEL_14;
    }
    a2 = (uint64_t *)v72;
    v29 = v63;
    (*(void (**)(char *, uint64_t, uint64_t))(v72 + 32))(v63, v26, v10);
    sub_100005B28(&qword_1000D3378, (uint64_t (*)(uint64_t))&type metadata accessor for SportingEventClockTimeType, (uint64_t)&protocol conformance descriptor for SportingEventClockTimeType);
    v64 = dispatch thunk of static Equatable.== infix(_:_:)(v28, v29, v10, v30);
    v31 = (void (*)(uint64_t, uint64_t))a2[1];
    v31(v28, v10);
    v31((uint64_t)v29, v10);
    sub_10000A47C((uint64_t)v13, v27);
    sub_10000A47C((uint64_t)v74, v27);
    v3 = v66;
    sub_10000A47C(v66, v27);
    v25 = v27;
    if ((v64 & 1) != 0)
      goto LABEL_18;
LABEL_16:

    ++v24;
    if (v9 == v67)
    {
      swift_bridgeObjectRelease_n(v71, 2);
      a2 = v60;
      goto LABEL_32;
    }
  }
  if (sub_100009658(v26, 1, v10) != 1)
  {
LABEL_14:
    sub_10000A47C((uint64_t)v13, &qword_1000D3368);
    sub_10000A47C((uint64_t)v74, v25);
    sub_10000A47C(v3, v25);
    goto LABEL_16;
  }
  sub_10000A47C((uint64_t)v13, &qword_1000D3370);
  sub_10000A47C((uint64_t)v74, &qword_1000D3370);
  sub_10000A47C(v3, &qword_1000D3370);
LABEL_18:
  v32 = swift_bridgeObjectRelease_n(v71, 2);
  v33 = v73;
  v34 = dispatch thunk of SportingEventClockTime.minutes.getter(v32);
  v36 = v35;

  a2 = v60;
  v37 = (uint64_t)v59;
  if ((v36 & 1) == 0)
  {
    v38 = ((uint64_t (*)(void))dispatch thunk of SportingEventClockTimeContainer.period.getter)();
    if (v38)
    {
      v39 = (void *)v38;
      dispatch thunk of SportingEventClockPeriod.type.getter();

      v40 = type metadata accessor for SportingEventClockPeriodType(0);
      if (sub_100009658(v37, 1, v40) == 1)
      {
        sub_10000A47C(v37, &qword_1000D2E78);
        goto LABEL_32;
      }
      v41 = SportingEventClockPeriodType.rawValue.getter();
      v42 = v37;
      v44 = v43;
      v45 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 8))(v42, v40);
      v46 = dispatch thunk of SportingEventClockTimeContainer.period.getter(v45);
      if (v46)
      {
        v47 = (void *)v46;
        v48 = dispatch thunk of SportingEventClockPeriod.index.getter();
        v50 = v49;

        if ((v50 & 1) == 0)
        {
          v75 = 0;
          v76 = 0xE000000000000000;
          _StringGuts.grow(_:)(17);
          swift_bridgeObjectRelease(v76);
          v75 = v41;
          v76 = v44;
          v51._countAndFlagsBits = 32;
          v51._object = (void *)0xE100000000000000;
          String.append(_:)(v51);
          v77 = v48;
          v52._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
          object = v52._object;
          String.append(_:)(v52);
          swift_bridgeObjectRelease(object);
          v54._countAndFlagsBits = 0x736574756E696D20;
          v54._object = (void *)0xEA0000000000203ALL;
          String.append(_:)(v54);
          v77 = v34;
          v55._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
          v56 = v55._object;
          String.append(_:)(v55);
          swift_bridgeObjectRelease(v56);
          v57 = v76;
          *a2 = v75;
          a2[1] = v57;
          return;
        }
      }
      swift_bridgeObjectRelease(v44);
    }
  }
LABEL_32:
  *a2 = 0;
  a2[1] = 0;
}

void sub_10008DD68(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    sub_100015688();
    v5 = *(_QWORD *)(type metadata accessor for IngestionError(0) - 8);
    v6 = a1 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    v7 = *(_QWORD *)(v5 + 72);
    do
    {
      v8 = IngestionError.rawValue.getter();
      v10 = v9;
      v11 = _swiftEmptyArrayStorage[2];
      if (v11 >= _swiftEmptyArrayStorage[3] >> 1)
        sub_100015688();
      _swiftEmptyArrayStorage[2] = v11 + 1;
      v12 = &_swiftEmptyArrayStorage[2 * v11];
      v12[4] = v8;
      v12[5] = v10;
      v6 += v7;
      --v3;
    }
    while (v3);
  }
  *a2 = _swiftEmptyArrayStorage;
}

uint64_t sub_10008DE60()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_10008DE84(_QWORD *a1@<X8>)
{
  uint64_t v1;

  sub_10008DD68(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_10008DE8C()
{
  uint64_t v0;

  return sub_10004D47C(*(void (**)(uint64_t *__return_ptr))(v0 + 16));
}

_BYTE **sub_10008DE98(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_100015040(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10008DEA4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10008DEC8()
{
  uint64_t v0;

  return sub_100014AC4(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10008DED0(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return sub_100014AE4(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_10008DED8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_10008C1BC(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_10008DF00()
{
  return Logger.logObject.getter();
}

BOOL sub_10008DF0C(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t sub_10008DF1C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 - 184) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(v3 - 184, v3 - 176, v2, v1);
}

void sub_10008DF38(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;

  sub_100014B44(a1, v1, (uint64_t *)(v2 - 240));
}

uint64_t sub_10008DF44()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

void sub_10008DF54(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;

  sub_100014B44(a1, v3, a3);
}

uint64_t sub_10008DF5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return UnsafeMutableRawBufferPointer.copyMemory(from:)(a1, a2, v4, a4);
}

uint64_t sub_10008DF64(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 184) = a1;
  return v1 - 184;
}

uint64_t sub_10008DF78()
{
  return 0;
}

uint64_t sub_10008DF88()
{
  return 1819047278;
}

uint64_t sub_10008DF98@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, _QWORD, _QWORD)@<X8>)
{
  uint64_t v2;

  return a2(a1, *(unsigned int *)(v2 - 392), *(_QWORD *)(v2 - 336));
}

uint64_t sub_10008DFB0()
{
  return SportingEvent.clock.getter();
}

uint64_t sub_10008DFB8()
{
  return 2108704;
}

uint64_t sub_10008DFD4()
{
  return static os_log_type_t.debug.getter();
}

void sub_10008DFDC(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0x16u);
}

BOOL sub_10008DFF0@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

void sub_10008E018()
{
  void *v0;

}

void sub_10008E020()
{
  sub_100015688();
}

BOOL sub_10008E028(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t sub_10008E038()
{
  return 0;
}

void sub_10008E050()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  sub_100014B44(v0, v1, (uint64_t *)(v2 - 240));
}

uint64_t sub_10008E060()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_10008E070()
{
  uint64_t v0;

  return swift_release(v0);
}

BOOL sub_10008E080@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t sub_10008E094(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 240) = result;
  return result;
}

uint64_t sub_10008E0A0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 184) = a1;
  return v1 - 184;
}

uint64_t sub_10008E0B4()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(v2, v0);
}

uint64_t sub_10008E0D4()
{
  return SportingEvent.clock.getter();
}

void sub_10008E0DC()
{
  sub_100015688();
}

uint64_t sub_10008E0E4()
{
  uint64_t v0;
  uint64_t v1;

  return specialized _ArrayBuffer._getElementSlowPath(_:)(v1, v0);
}

void sub_10008E104()
{
  void *v0;

}

void sub_10008E10C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  sub_100014B44(a1, a2, (uint64_t *)(v2 - 184));
}

void sub_10008E118(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  sub_100014B44(a1, a2, (uint64_t *)(v2 - 240));
}

uint64_t sub_10008E124()
{
  uint64_t v0;
  uint64_t v1;

  return dispatch thunk of RawRepresentable.rawValue.getter(v0, v1);
}

void sub_10008E130(float a1)
{
  float *v1;

  *v1 = a1;
}

uint64_t sub_10008E144(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 392) = result;
  return result;
}

uint64_t sub_10008E15C()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_10008E170()
{
  return 0;
}

uint64_t sub_10008E17C(uint64_t a1)
{
  _QWORD v2[2];

  v2[0] = (char *)&value witness table for Builtin.NativeObject + 64;
  v2[1] = (char *)&value witness table for Builtin.Int64 + 64;
  return swift_initClassMetadata2(a1, 0, 2, v2, a1 + 128);
}

uint64_t sub_10008E1CC(uint64_t a1, uint64_t a2)
{
  char v4;
  char v5;

  if (a1 == 0x73746E657665 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease(0xE600000000000000);
    v5 = 0;
  }
  else
  {
    v4 = _stringCompareWithSmolCheck(_:_:expecting:)(0x73746E657665, 0xE600000000000000, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    v5 = v4 ^ 1;
  }
  return v5 & 1;
}

uint64_t sub_10008E248()
{
  return 0x73746E657665;
}

_QWORD *sub_10008E25C(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v9;
  uint64_t WitnessTable;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[8];

  v24 = a2;
  v25 = a4;
  v26[0] = a2;
  v26[1] = a3;
  v26[2] = a4;
  v26[3] = a5;
  v26[4] = a6;
  v26[5] = a7;
  v9 = type metadata accessor for ApsPayload.ContentWrapper.CodingKeys(255, (uint64_t)v26);
  WitnessTable = swift_getWitnessTable(&unk_1000A4EA0, v9);
  v11 = type metadata accessor for KeyedDecodingContainer(0, v9, WitnessTable);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v24 - v13;
  v16 = a1[3];
  v15 = a1[4];
  v17 = sub_1000073CC(a1, v16);
  v18 = v9;
  v19 = v9;
  v20 = v17;
  dispatch thunk of Decoder.container<A>(keyedBy:)(v18, v19, WitnessTable, v16, v15);
  if (!v7)
  {
    v21 = type metadata accessor for Array(0, v24);
    v26[7] = v25;
    swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v21);
    KeyedDecodingContainer.decode<A>(_:forKey:)(v21, v22, v11, v21);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    v20 = (_QWORD *)v26[0];
  }
  sub_100007618(a1);
  return v20;
}

uint64_t sub_10008E3E8()
{
  return sub_1000080AC();
}

Swift::Int sub_10008E3FC()
{
  return sub_1000525D4();
}

void sub_10008E410()
{
  sub_10005253C();
}

Swift::Int sub_10008E424()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1);
  sub_10005253C();
  return Hasher._finalize()();
}

uint64_t sub_10008E46C()
{
  return sub_10008E248();
}

uint64_t sub_10008E480@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_10008E1CC(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_10008E4B8()
{
  return sub_1000080B4();
}

uint64_t sub_10008E4E0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1000080AC();
  *a1 = result & 1;
  return result;
}

uint64_t sub_10008E518(uint64_t a1)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_1000A4EA0, a1);
  return CodingKey.description.getter(a1, WitnessTable);
}

uint64_t sub_10008E54C(uint64_t a1)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_1000A4EA0, a1);
  return CodingKey.debugDescription.getter(a1, WitnessTable);
}

_QWORD *sub_10008E580@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  _QWORD *result;

  result = sub_10008E25C(a1, a2[2], a2[3], a2[4], a2[5], a2[6], a2[7]);
  if (!v3)
    *a3 = result;
  return result;
}

void sub_10008E5B8()
{
  uint64_t v0;

  swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  sub_10008E5FC();
  sub_100090304();
}

void sub_10008E5FC()
{
  char *v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
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
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  _QWORD v53[5];
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
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
  char *v68;
  char v69;
  _QWORD v70[7];

  sub_100055A28();
  v67 = v1;
  v68 = v0;
  v3 = v2;
  v4 = *(_QWORD **)v0;
  v5 = *(_QWORD *)(*(_QWORD *)v0 + 80);
  v54 = type metadata accessor for Optional(0, v5);
  v53[4] = *(_QWORD *)(v54 - 8);
  sub_1000902B8();
  __chkstk_darwin(v6);
  v56 = (char *)v53 - v7;
  v53[1] = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v8);
  sub_10000CD48();
  v53[2] = v9;
  v10 = v4[11];
  v11 = type metadata accessor for Optional(0, v10);
  v62 = *(_QWORD *)(v11 - 8);
  v63 = v11;
  sub_1000902B8();
  __chkstk_darwin(v12);
  v57 = (char *)v53 - v13;
  v14 = type metadata accessor for Date(0);
  v15 = *(_QWORD *)(v14 - 8);
  v64 = v14;
  v65 = v15;
  __chkstk_darwin(v14);
  sub_10000CD48();
  v66 = v16;
  v17 = v4[12];
  v18 = v4[13];
  v19 = v4[14];
  v20 = v4[15];
  v58 = v5;
  v59 = v17;
  v70[0] = v5;
  v70[1] = v10;
  v61 = v10;
  v70[2] = v17;
  v70[3] = v18;
  v53[3] = v18;
  v60 = v19;
  v70[4] = v19;
  v70[5] = v20;
  v55 = v20;
  v21 = type metadata accessor for ApsPayload.PayloadWrapper.CodingKeys(255, (uint64_t)v70);
  v22 = sub_1000902DC((uint64_t)&unk_1000A4D38);
  v23 = type metadata accessor for KeyedDecodingContainer(0, v21, v22);
  v24 = *(_QWORD *)(v23 - 8);
  sub_1000902B8();
  __chkstk_darwin(v25);
  v27 = (char *)v53 - v26;
  v28 = v3[3];
  v29 = v3[4];
  sub_1000073CC(v3, v28);
  v30 = v29;
  v31 = v67;
  v32 = v68;
  dispatch thunk of Decoder.container<A>(keyedBy:)(v21, v21, v22, v28, v30);
  if (v31)
  {
    swift_deallocPartialClassInstance(v32, v4, *(unsigned int *)(*(_QWORD *)v32 + 48), *(unsigned __int16 *)(*(_QWORD *)v32 + 52));
  }
  else
  {
    v33 = v66;
    LOBYTE(v70[0]) = 0;
    v34 = v27;
    *((_QWORD *)v32 + 2) = KeyedDecodingContainer.decode(_:forKey:)(v70, v23);
    *((_QWORD *)v32 + 3) = sub_1000902A4(1);
    *((_QWORD *)v32 + 4) = v35;
    *((_QWORD *)v32 + 5) = sub_1000902A4(2);
    *((_QWORD *)v32 + 6) = v36;
    LOBYTE(v70[0]) = 3;
    sub_10008FE94(qword_1000D00E0, (uint64_t)&protocol conformance descriptor for Date);
    v37 = v33;
    v38 = v23;
    v39 = v64;
    v67 = 0;
    sub_1000902F0(v64, (uint64_t)v70, v38, v64);
    (*(void (**)(char *, uint64_t, uint64_t))(v65 + 32))(&v32[qword_1000DDB60], v37, v39);
    LOBYTE(v70[0]) = 4;
    v53[0] = v34;
    v40 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v70, v38);
    v41 = v38;
    v43 = v61;
    v44 = &v32[qword_1000DDB68];
    *(_QWORD *)v44 = v40;
    v44[8] = v42 & 1;
    LOBYTE(v70[0]) = 5;
    v45 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v70, v41);
    v46 = (uint64_t *)&v32[qword_1000DDB70];
    *v46 = v45;
    v46[1] = v47;
    LOBYTE(v70[0]) = 6;
    v48 = v57;
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(v43, v70, v41, v43, v60);
    (*(void (**)(char *, char *, uint64_t))(v62 + 32))(&v32[*(_QWORD *)(*(_QWORD *)v32 + 176)], v48, v63);
    v49 = type metadata accessor for Array(0, v58);
    v69 = 7;
    swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v49);
    v66 = v41;
    v50 = v53[0];
    sub_1000902F0(v49, (uint64_t)&v69, v41, v49);
    v51 = v70[0];
    v52 = v68;
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v50, v66);
    *(_QWORD *)((char *)v52 + *(_QWORD *)(*v52 + 184)) = v51;
  }
  sub_100007618(v3);
  sub_100055A00();
}

uint64_t sub_10008ED00(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  unint64_t v8;
  unint64_t v10;
  unint64_t v12;
  unint64_t v14;
  unint64_t v16;
  unint64_t v18;
  char v20;

  if (a1 == 1701869940 && a2 == 0xE400000000000000)
  {
    v5 = 0xE400000000000000;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(1701869940, 0xE400000000000000, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x6556616D65686373 && a2 == 0xED00006E6F697372)
  {
    v8 = 0xED00006E6F697372;
    goto LABEL_16;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6556616D65686373, 0xED00006E6F697372, a1, a2, 0) & 1) != 0)
  {
    v8 = a2;
LABEL_16:
    swift_bridgeObjectRelease(v8);
    return 1;
  }
  if (a1 == 0x7365536F706D6574 && a2 == 0xEE0064496E6F6973)
  {
    v10 = 0xEE0064496E6F6973;
    goto LABEL_24;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x7365536F706D6574, 0xEE0064496E6F6973, a1, a2, 0) & 1) != 0)
  {
    v10 = a2;
LABEL_24:
    swift_bridgeObjectRelease(v10);
    return 2;
  }
  if (a1 == 0x6D617473656D6974 && a2 == 0xE900000000000070)
  {
    v12 = 0xE900000000000070;
    goto LABEL_32;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6D617473656D6974, 0xE900000000000070, a1, a2, 0) & 1) != 0)
  {
    v12 = a2;
LABEL_32:
    swift_bridgeObjectRelease(v12);
    return 3;
  }
  if (a1 == 0x697463416576696CLL && a2 == 0xEF6C745479746976)
  {
    v14 = 0xEF6C745479746976;
    goto LABEL_40;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x697463416576696CLL, 0xEF6C745479746976, a1, a2, 0) & 1) != 0)
  {
    v14 = a2;
LABEL_40:
    swift_bridgeObjectRelease(v14);
    return 4;
  }
  if (a1 == 0x5464616F6C796170 && a2 == 0xEC0000006E656B6FLL)
  {
    v16 = 0xEC0000006E656B6FLL;
    goto LABEL_48;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x5464616F6C796170, 0xEC0000006E656B6FLL, a1, a2, 0) & 1) != 0)
  {
    v16 = a2;
LABEL_48:
    swift_bridgeObjectRelease(v16);
    return 5;
  }
  if (a1 == 2003134838 && a2 == 0xE400000000000000)
  {
    v18 = 0xE400000000000000;
    goto LABEL_56;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(2003134838, 0xE400000000000000, a1, a2, 0) & 1) != 0)
  {
    v18 = a2;
LABEL_56:
    swift_bridgeObjectRelease(v18);
    return 6;
  }
  if (a1 == 0x746E65746E6F63 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease(0xE700000000000000);
    return 7;
  }
  else
  {
    v20 = _stringCompareWithSmolCheck(_:_:expecting:)(0x746E65746E6F63, 0xE700000000000000, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v20 & 1) != 0)
      return 7;
    else
      return 8;
  }
}

uint64_t sub_10008F09C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_10008F0C8 + 4 * byte_1000A4938[a1]))(1701869940, 0xE400000000000000);
}

uint64_t sub_10008F0C8()
{
  return 0x6556616D65686373;
}

uint64_t sub_10008F0EC()
{
  return 0x7365536F706D6574;
}

uint64_t sub_10008F110()
{
  return 0x6D617473656D6974;
}

uint64_t sub_10008F12C()
{
  return 0x697463416576696CLL;
}

uint64_t sub_10008F150()
{
  return 0x5464616F6C796170;
}

uint64_t sub_10008F170()
{
  return 2003134838;
}

uint64_t sub_10008F17C()
{
  return 0x746E65746E6F63;
}

BOOL sub_10008F194(char *a1, char *a2)
{
  return sub_10000B36C(*a1, *a2);
}

Swift::Int sub_10008F1B0()
{
  unsigned __int8 *v0;

  return sub_10000B6B8(*v0);
}

void sub_10008F1C4(uint64_t a1)
{
  unsigned __int8 *v1;

  sub_10000B37C(a1, *v1);
}

Swift::Int sub_10008F1D8()
{
  unsigned __int8 *v0;
  _QWORD v2[9];

  Hasher.init(_seed:)(v2);
  sub_10000B37C((uint64_t)v2, *v0);
  return Hasher._finalize()();
}

uint64_t sub_10008F224()
{
  unsigned __int8 *v0;

  return sub_10008F09C(*v0);
}

uint64_t sub_10008F238@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, _BYTE *a4@<X8>)
{
  return sub_10008F860(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10008ED00, a4);
}

uint64_t sub_10008F244()
{
  return sub_1000080B4();
}

uint64_t sub_10008F26C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, _BYTE *a3@<X8>)
{
  return sub_10008F8D0(a1, a2, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_100069D0C, a3);
}

uint64_t sub_10008F278(uint64_t a1)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_1000A4D38, a1);
  return CodingKey.description.getter(a1, WitnessTable);
}

uint64_t sub_10008F2AC(uint64_t a1)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_1000A4D38, a1);
  return CodingKey.debugDescription.getter(a1, WitnessTable);
}

uint64_t *sub_10008F2E0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v2 = type metadata accessor for Date(0);
  sub_100022EEC(v2);
  swift_bridgeObjectRelease();
  v3 = type metadata accessor for Optional(0, *(_QWORD *)(v1 + 88));
  sub_100022EEC(v3);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_10008F370()
{
  uint64_t v0;

  sub_10008F2E0();
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

void sub_10008F394(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t WitnessTable;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;

  sub_100055A28();
  a22 = v25;
  a23 = v26;
  v27 = v23;
  v29 = v28;
  v30 = *v27;
  v31 = *(_QWORD *)(*v27 + 120);
  v62 = *(_QWORD *)(*v27 + 80);
  v63 = v24;
  v65 = v62;
  v60 = *(_OWORD *)(v30 + 88);
  v66 = v60;
  v59 = *(_OWORD *)(v30 + 104);
  v67 = v59;
  v61 = v31;
  v68 = v31;
  v32 = type metadata accessor for ApsPayload.PayloadWrapper.CodingKeys(255, (uint64_t)&v65);
  WitnessTable = swift_getWitnessTable(&unk_1000A4D38, v32);
  v34 = type metadata accessor for KeyedEncodingContainer(0, v32, WitnessTable);
  v35 = *(_QWORD *)(v34 - 8);
  sub_1000902B8();
  __chkstk_darwin(v36);
  v38 = (char *)&v59 - v37;
  v39 = v29[3];
  v40 = v29[4];
  sub_1000073CC(v29, v39);
  v41 = v32;
  v42 = v32;
  v43 = v34;
  dispatch thunk of Encoder.container<A>(keyedBy:)(v41, v42, WitnessTable, v39, v40);
  v44 = v27[2];
  LOBYTE(v65) = 0;
  v45 = v63;
  KeyedEncodingContainer.encode(_:forKey:)(v44, &v65, v34);
  if (!v45)
  {
    v47 = v61;
    v46 = v62;
    sub_10009028C(v27[3], v27[4], 1);
    sub_10009028C(v27[5], v27[6], 2);
    v63 = v27;
    v48 = (uint64_t)v27 + qword_1000DDB60;
    LOBYTE(v65) = 3;
    type metadata accessor for Date(0);
    sub_10008FE94(qword_1000D3498, (uint64_t)&protocol conformance descriptor for Date);
    sub_1000902F8(v48, (uint64_t)&v65, v43);
    v49 = v63;
    sub_1000902C4(4);
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v50, v51, v52, v53);
    sub_1000902C4(5);
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v54, v55, v56, v57);
    v58 = (uint64_t)v49 + *(_QWORD *)(*v49 + 176);
    LOBYTE(v65) = 6;
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v58, &v65, v43, v60, v47);
    v65 = *(_QWORD *)((char *)v49 + *(_QWORD *)(*v49 + 184));
    a13 = 7;
    type metadata accessor for Array(0, v46);
    v64 = v59;
    sub_1000902DC((uint64_t)&protocol conformance descriptor for <A> [A]);
    sub_1000902F8((uint64_t)&v65, (uint64_t)&a13, v43);
  }
  (*(void (**)(char *, uint64_t))(v35 + 8))(v38, v43);
  sub_100055A00();
}

void sub_10008F628(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  sub_10008E5B8();
  if (!v1)
    *a1 = v3;
}

#error "10008F660: call analysis failed (funcsize=8)"

uint64_t sub_10008F670(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  char v8;

  if (a1 == 0x64616F6C796170 && a2 == 0xE700000000000000)
  {
    v5 = 0xE700000000000000;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x64616F6C796170, 0xE700000000000000, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x756F437365747962 && a2 == 0xEA0000000000746ELL)
  {
    swift_bridgeObjectRelease(0xEA0000000000746ELL);
    return 1;
  }
  else
  {
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)(0x756F437365747962, 0xEA0000000000746ELL, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v8 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_10008F768(char a1)
{
  if ((a1 & 1) != 0)
    return 0x756F437365747962;
  else
    return 0x64616F6C796170;
}

BOOL sub_10008F7A4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_100053880(*a1, *a2);
}

Swift::Int sub_10008F7C0()
{
  char *v0;

  return sub_1000539A8(*v0);
}

void sub_10008F7D8(uint64_t a1)
{
  char *v1;

  sub_100053890(a1, *v1);
}

Swift::Int sub_10008F7F0()
{
  char *v0;
  _QWORD v2[9];

  Hasher.init(_seed:)(v2);
  sub_100053890((uint64_t)v2, *v0);
  return Hasher._finalize()();
}

uint64_t sub_10008F83C()
{
  char *v0;

  return sub_10008F768(*v0);
}

uint64_t sub_10008F854@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, _BYTE *a4@<X8>)
{
  return sub_10008F860(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10008F670, a4);
}

uint64_t sub_10008F860@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t (*a4)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD)@<X4>, _BYTE *a5@<X8>)
{
  uint64_t result;

  result = a4(a1, a2, a3[2], a3[3], a3[4], a3[5], a3[6], a3[7]);
  *a5 = result;
  return result;
}

uint64_t sub_10008F898()
{
  return sub_1000080B4();
}

uint64_t sub_10008F8C4@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, _BYTE *a3@<X8>)
{
  return sub_10008F8D0(a1, a2, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1000539A0, a3);
}

uint64_t sub_10008F8D0@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t (*a3)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD)@<X3>, _BYTE *a4@<X8>)
{
  uint64_t result;

  result = a3(a1, a2[2], a2[3], a2[4], a2[5], a2[6], a2[7]);
  *a4 = result;
  return result;
}

uint64_t sub_10008F908(uint64_t a1)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_1000A4D88, a1);
  return CodingKey.description.getter(a1, WitnessTable);
}

uint64_t sub_10008F93C(uint64_t a1)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_1000A4D88, a1);
  return CodingKey.debugDescription.getter(a1, WitnessTable);
}

uint64_t sub_10008F970()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  return v0;
}

uint64_t sub_10008F98C()
{
  uint64_t v0;

  sub_10008F970();
  return swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for ApsPayload(uint64_t a1, uint64_t a2)
{
  return swift_getGenericMetadata(a1, a2, &nominal type descriptor for ApsPayload);
}

void sub_10008F9B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t WitnessTable;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
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
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  sub_100055A28();
  a19 = v22;
  a20 = v23;
  v50 = v21;
  v24 = v20;
  v26 = v25;
  v27 = *v24;
  v29 = *(_QWORD *)(*v24 + 80);
  v28 = *(_QWORD *)(*v24 + 88);
  v30 = *(_QWORD *)(*v24 + 104);
  v47 = *(_QWORD *)(*v24 + 96);
  v48 = v28;
  v32 = *(_QWORD *)(v27 + 112);
  v31 = *(_QWORD *)(v27 + 120);
  v45 = v32;
  v46 = v30;
  v44 = v31;
  v52 = v29;
  v53 = v28;
  v54 = v47;
  v55 = v30;
  v56 = v32;
  v57 = v31;
  v33 = sub_100090310();
  WitnessTable = swift_getWitnessTable(&unk_1000A4D88, v33);
  v35 = type metadata accessor for KeyedEncodingContainer(0, v33, WitnessTable);
  v49 = *(_QWORD *)(v35 - 8);
  sub_1000902B8();
  __chkstk_darwin(v36);
  v38 = (char *)&v44 - v37;
  v39 = v26[3];
  v40 = v26[4];
  sub_1000073CC(v26, v39);
  dispatch thunk of Encoder.container<A>(keyedBy:)(v33, v33, WitnessTable, v39, v40);
  a10 = v24[2];
  v51 = 0;
  v52 = v29;
  v53 = v48;
  v54 = v47;
  v55 = v46;
  v56 = v45;
  v57 = v44;
  sub_10009031C();
  sub_1000902DC((uint64_t)&unk_1000A4A40);
  v41 = v50;
  KeyedEncodingContainer.encode<A>(_:forKey:)(&a10, &v51, v35);
  if (v41)
  {
    (*(void (**)(char *, uint64_t))(v49 + 8))(v38, v35);
  }
  else
  {
    v42 = v49;
    v43 = v24[3];
    LOBYTE(v52) = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v43, &v52, v35);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v38, v35);
  }
  sub_100055A00();
}

void sub_10008FB48(uint64_t a1)
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

  swift_allocObject(v1, 32, 7);
  sub_10008FC60(a1, v3, v4, v5, v6, v7, v8, v9, v10, v11);
  sub_100090304();
}

uint64_t sub_10008FB8C(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;
  _QWORD v5[8];

  v5[0] = (char *)&value witness table for Builtin.Int64 + 64;
  v5[1] = &unk_1000A49D0;
  v5[2] = &unk_1000A49D0;
  result = type metadata accessor for Date(319);
  if (v3 <= 0x3F)
  {
    v5[3] = *(_QWORD *)(result - 8) + 64;
    v5[4] = &unk_1000A49E8;
    v5[5] = &unk_1000A4A00;
    result = type metadata accessor for Optional(319, *(_QWORD *)(a1 + 88));
    if (v4 <= 0x3F)
    {
      v5[6] = *(_QWORD *)(result - 8) + 64;
      v5[7] = (char *)&value witness table for Builtin.BridgeObject + 64;
      result = swift_initClassMetadata2(a1, 0, 8, v5, a1 + 128);
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for ApsPayload.PayloadWrapper(uint64_t a1, uint64_t a2)
{
  return swift_getGenericMetadata(a1, a2, &nominal type descriptor for ApsPayload.PayloadWrapper);
}

void sub_10008FC60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t *v10;
  _QWORD *v11;
  uint64_t *v12;
  _QWORD *v13;
  _QWORD *v14;
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
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  sub_100055A28();
  v12 = v10;
  v14 = v13;
  v15 = *v10;
  v16 = *(_QWORD *)(*v10 + 80);
  v17 = *(_QWORD *)(*v10 + 96);
  v18 = *(_QWORD *)(*v10 + 104);
  v19 = *(_QWORD *)(*v10 + 112);
  v20 = *(_QWORD *)(*v10 + 120);
  v40 = *(_QWORD *)(*v10 + 88);
  v41 = v16;
  v44 = v11;
  v45 = v16;
  v46 = v40;
  v47 = v17;
  v38 = v18;
  v39 = v17;
  v48 = v18;
  v49 = v19;
  v36 = v20;
  v37 = v19;
  v50 = v20;
  v21 = sub_100090310();
  v22 = sub_1000902DC((uint64_t)&unk_1000A4D88);
  v43 = type metadata accessor for KeyedDecodingContainer(0, v21, v22);
  sub_1000902B8();
  __chkstk_darwin(v23);
  v25 = (char *)&v35 - v24;
  v27 = v14[3];
  v26 = v14[4];
  sub_1000073CC(v14, v27);
  v42 = v25;
  v28 = v22;
  v29 = v12;
  v30 = v44;
  dispatch thunk of Decoder.container<A>(keyedBy:)(v21, v21, v28, v27, v26);
  if (v30)
  {
    swift_deallocPartialClassInstance(v12, v15, 32, 7);
    v34 = v14;
  }
  else
  {
    v44 = v14;
    v45 = v41;
    v46 = v40;
    v47 = v39;
    v48 = v38;
    v49 = v37;
    v50 = v36;
    v31 = sub_10009031C();
    LOBYTE(v45) = 0;
    swift_getWitnessTable(&unk_1000A4A68, v31);
    v32 = v43;
    sub_1000902F0(v31, (uint64_t)&v45, v43, v31);
    v29[2] = a10;
    LOBYTE(v45) = 1;
    v33 = KeyedDecodingContainer.decode(_:forKey:)(&v45, v32);
    sub_10009027C();
    v29[3] = v33;
    v34 = v44;
  }
  sub_100007618(v34);
  sub_100055A00();
}

void sub_10008FE34(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  sub_10008FB48(a1);
  if (!v2)
    *a2 = v4;
}

#error "10008FE6C: call analysis failed (funcsize=8)"

uint64_t type metadata accessor for ApsPayload.CodingKeys(uint64_t a1, uint64_t a2)
{
  return swift_getGenericMetadata(a1, a2, &nominal type descriptor for ApsPayload.CodingKeys);
}

uint64_t type metadata accessor for ApsPayload.PayloadWrapper.CodingKeys(uint64_t a1, uint64_t a2)
{
  return swift_getGenericMetadata(a1, a2, &nominal type descriptor for ApsPayload.PayloadWrapper.CodingKeys);
}

uint64_t sub_10008FE94(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for Date(255);
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for ApsPayload.ContentWrapper(uint64_t a1, uint64_t a2)
{
  return swift_getGenericMetadata(a1, a2, &nominal type descriptor for ApsPayload.ContentWrapper);
}

uint64_t type metadata accessor for ApsPayload.PayloadError(uint64_t a1, uint64_t a2)
{
  return swift_getGenericMetadata(a1, a2, &nominal type descriptor for ApsPayload.PayloadError);
}

uint64_t sub_10008FEEC(uint64_t a1, uint64_t a2)
{
  if (sub_10008FF2C(a2, a2))
    return sub_10000738C(&qword_1000D2E50);
  else
    return type metadata accessor for _ContiguousArrayStorage(0, a2);
}

uint64_t sub_10008FF2C(uint64_t a1, uint64_t a2)
{
  if (swift_isClassType(a2))
    return a1;
  else
    return 0;
}

uint64_t sub_10008FF58(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 16))
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

uint64_t sub_10008FF98(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_10008FFD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 56);
}

uint64_t sub_10008FFDC(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100090028 + 4 * byte_1000A4945[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_10009005C + 4 * byte_1000A4940[v4]))();
}

uint64_t sub_10009005C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100090064(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10009006CLL);
  return result;
}

uint64_t sub_100090078(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100090080);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_100090084(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10009008C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100090098(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1000900E4 + 4 * byte_1000A494F[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100090118 + 4 * byte_1000A494A[v4]))();
}

uint64_t sub_100090118(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100090120(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100090128);
  return result;
}

uint64_t sub_100090134(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10009013CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_100090140(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100090148(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100090154(uint64_t a1)
{
  return swift_getWitnessTable(&unk_1000A4BF0, a1);
}

uint64_t sub_100090164(uint64_t a1)
{
  return swift_getWitnessTable(&unk_1000A4CA8, a1);
}

uint64_t sub_100090174(uint64_t a1)
{
  return swift_getWitnessTable(&unk_1000A4C18, a1);
}

uint64_t sub_100090184(uint64_t a1)
{
  return swift_getWitnessTable(&unk_1000A4C40, a1);
}

uint64_t sub_100090194(uint64_t a1)
{
  return swift_getWitnessTable(&unk_1000A4B60, a1);
}

uint64_t sub_1000901A4(uint64_t a1)
{
  return swift_getWitnessTable(&unk_1000A4B88, a1);
}

uint64_t type metadata accessor for ApsPayload.ContentWrapper.CodingKeys(uint64_t a1, uint64_t a2)
{
  return swift_getGenericMetadata(a1, a2, &nominal type descriptor for ApsPayload.ContentWrapper.CodingKeys);
}

uint64_t sub_1000901C0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_100090200 + 4 * byte_1000A4954[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_100090220 + 4 * byte_1000A4959[v4]))();
}

_BYTE *sub_100090200(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_100090220(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100090228(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100090230(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100090238(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100090240(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_10009024C(uint64_t a1)
{
  return swift_getWitnessTable(&unk_1000A4E78, a1);
}

uint64_t sub_10009025C(uint64_t a1)
{
  return swift_getWitnessTable(&unk_1000A4DE8, a1);
}

uint64_t sub_10009026C(uint64_t a1)
{
  return swift_getWitnessTable(&unk_1000A4E10, a1);
}

uint64_t sub_10009027C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t sub_10009028C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W8>)
{
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)(v4 - 128) = a3;
  return KeyedEncodingContainer.encode(_:forKey:)(a1, a2, v4 - 128, v3);
}

uint64_t sub_1000902A4@<X0>(char a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_BYTE *)(v2 - 136) = a1;
  return KeyedDecodingContainer.decode(_:forKey:)(v2 - 136, v1);
}

void sub_1000902C4(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 128) = a1;
}

uint64_t sub_1000902DC(uint64_t a1)
{
  uint64_t v1;

  return swift_getWitnessTable(a1, v1);
}

uint64_t sub_1000902E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_10000964C(a1, a2, 1, v2);
}

uint64_t sub_1000902F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)(a1, a2, a3, a4);
}

uint64_t sub_1000902F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)(a1, a2, a3);
}

uint64_t sub_100090310()
{
  uint64_t v0;

  return type metadata accessor for ApsPayload.CodingKeys(255, v0 - 128);
}

uint64_t sub_10009031C()
{
  uint64_t v0;

  return type metadata accessor for ApsPayload.PayloadWrapper(0, v0 - 128);
}

uint64_t sub_100090328(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
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
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void **v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v56;

  v9 = sub_10000738C(&qword_1000D37C0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  sub_10000A7D4();
  v13 = v12 - v11;
  v14 = sub_10000738C(&qword_1000D37C8);
  v49 = *(_QWORD *)(v14 - 8);
  v50 = v14;
  __chkstk_darwin(v14);
  sub_10000A7D4();
  v17 = v16 - v15;
  v18 = sub_10000738C(&qword_1000D37D0);
  v51 = *(_QWORD *)(v18 - 8);
  __chkstk_darwin(v18);
  sub_10000A7D4();
  v47 = v20 - v19;
  v21 = sub_10000738C((uint64_t *)&unk_1000D16E0);
  __chkstk_darwin(v21);
  sub_10000A7D4();
  v24 = v23 - v22;
  v25 = type metadata accessor for URL(0);
  v26 = *(_QWORD *)(v25 - 8);
  __chkstk_darwin(v25);
  sub_10000A7D4();
  v29 = v28 - v27;
  if (a4)
  {
    swift_bridgeObjectRetain(a4);
    URL.init(string:)(a3, a4);
    if (sub_100009658(v24, 1, v25) != 1)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 32))(v29, v24, v25);
      v35 = (void **)sub_1000073CC((_QWORD *)(v44 + 16), *(_QWORD *)(v44 + 40));
      v56 = sub_100063C34(v29, a5, a6, *v35, v35[1]);
      v36 = sub_10000738C(&qword_1000D37E0);
      v43 = v18;
      v37 = sub_10000738C((uint64_t *)&unk_1000D1690);
      sub_10000D358(&qword_1000D37E8, &qword_1000D37E0, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
      Publisher.mapError<A>(_:)(sub_100042C48, 0, v36, v37);
      swift_release(v56);
      v38 = swift_allocObject(&unk_1000C9680, 24, 7);
      swift_weakInit(v38 + 16);
      v39 = (_QWORD *)swift_allocObject(&unk_1000C96A8, 88, 7);
      v39[2] = a5;
      v39[3] = a6;
      v39[4] = a7;
      v39[5] = a8;
      v39[6] = v38;
      v39[7] = a1;
      v39[8] = a2;
      v39[9] = a3;
      v39[10] = a4;
      v40 = sub_100091904();
      sub_10000D358(&qword_1000D37F0, &qword_1000D37C8, (uint64_t)&protocol conformance descriptor for Publishers.MapError<A, B>);
      swift_bridgeObjectRetain(a6);
      swift_bridgeObjectRetain(a8);
      swift_bridgeObjectRetain(a2);
      Publisher.map<A>(_:)(sub_1000913E8, v39, v50, v40);
      swift_release(v39);
      (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v17, v50);
      v41 = sub_10000D358(&qword_1000D37F8, &qword_1000D37D0, (uint64_t)&protocol conformance descriptor for Publishers.Map<A, B>);
      v34 = Publisher.eraseToAnyPublisher()(v43, v41);
      (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v47, v43);
      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v29, v25);
      return v34;
    }
    swift_bridgeObjectRelease(a4);
    sub_100091340(v24);
  }
  v30 = objc_allocWithZone((Class)NSError);
  v56 = (uint64_t)sub_100027D60(0xD00000000000001ELL, 0x80000001000A7E30, 1, 0);
  v31 = sub_100091904();
  v32 = sub_10000738C((uint64_t *)&unk_1000D1690);
  Fail.init(error:)(&v56, v31, v32, &protocol self-conformance witness table for Error);
  v33 = sub_10000D358(&qword_1000D37D8, &qword_1000D37C0, (uint64_t)&protocol conformance descriptor for Fail<A, B>);
  v34 = Publisher.eraseToAnyPublisher()(v9, v33);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v13, v9);
  return v34;
}

uint64_t sub_10009077C(uint64_t *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  v4 = *a1;
  v5 = a1[1];
  v6 = a2[1];
  v7 = v4 == *a2 && v5 == v6;
  if (!v7 && (_stringCompareWithSmolCheck(_:_:expecting:)(v4, v5, *a2, v6, 0) & 1) == 0)
    return 0;
  v8 = a1[2];
  v9 = a1[3];
  v10 = a2[2];
  v11 = a2[3];
  v12 = v8 == v10 && v9 == v11;
  if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(v8, v9, v10, v11, 0) & 1) == 0)
    return 0;
  v13 = *(int *)(sub_100091904() + 24);
  return static SportingEventSubscription.Competitor.LogoFilePaths.== infix(_:_:)((char *)a1 + v13, (char *)a2 + v13);
}

uint64_t sub_100090804@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X6>, uint64_t a6@<X7>, char *a7@<X8>, uint64_t a8, uint64_t a9)
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t Strong;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  Swift::String v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36[24];

  v34 = a9;
  v35 = a6;
  v31 = a8;
  v32 = a5;
  v33 = type metadata accessor for SportingEventSubscription.Competitor.LogoFilePaths(0);
  v14 = *(_QWORD *)(v33 - 8);
  __chkstk_darwin(v33);
  v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for URL(0);
  v18 = *(_QWORD *)(v17 - 8);
  __chkstk_darwin(v17);
  v20 = (char *)&v31 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  a4 += 16;
  URL.init(fileURLWithPath:)(a2, a3);
  swift_beginAccess(a4, v36, 0, 0);
  Strong = swift_weakLoadStrong(a4);
  if (Strong)
  {
    v22 = Strong;
    v23 = sub_1000909B0(a1, (uint64_t)v20);
    v25 = v24;
    swift_release(v22);
  }
  else
  {
    v23 = 0;
    v25 = 0;
  }
  v26 = URL.path(percentEncoded:)(1);
  SportingEventSubscription.Competitor.LogoFilePaths.init(smallSize:defaultSize:)(v23, v25, v26._countAndFlagsBits, v26._object);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  v28 = v34;
  v27 = v35;
  *(_QWORD *)a7 = v32;
  *((_QWORD *)a7 + 1) = v27;
  *((_QWORD *)a7 + 2) = v31;
  *((_QWORD *)a7 + 3) = v28;
  v29 = type metadata accessor for LogoDownloadResult(0);
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(&a7[*(int *)(v29 + 24)], v16, v33);
  swift_bridgeObjectRetain(v27);
  return swift_bridgeObjectRetain(v28);
}

uint64_t sub_1000909B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  __n128 v13;
  uint64_t v14;
  char *v15;
  NSURL *v16;
  CGImageRef v17;
  void (*v18)(char *, uint64_t);
  CGImage *v19;
  __CFData *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t countAndFlagsBits;
  uint64_t v50;
  CGImage *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v4 = type metadata accessor for URL(0);
  v52 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  __chkstk_darwin(v5);
  v7 = (char *)&v50 - v6;
  __chkstk_darwin(v8);
  v10 = (char *)&v50 - v9;
  v11 = type metadata accessor for SportsLogoSize(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t, __n128))(v12 + 104))(v15, enum case for SportsLogoSize.small(_:), v11, v13);
  v17 = sub_100091024(v16);
  v18 = *(void (**)(char *, uint64_t))(v12 + 8);
  v19 = v17;
  v18(v15, v11);
  if (!v19)
  {
    if (qword_1000CFAC8 != -1)
      swift_once(&qword_1000CFAC8, sub_10006CCA8);
    v34 = type metadata accessor for Logger(0);
    sub_1000096EC(v34, (uint64_t)qword_1000DDAD0);
    v35 = v52;
    v36 = v4;
    v37 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v52 + 16))(v7, a1, v4);
    v38 = Logger.logObject.getter(v37);
    v39 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc(12, -1);
      v41 = swift_slowAlloc(32, -1);
      v54 = v41;
      *(_DWORD *)v40 = 136315138;
      v42 = URL.absoluteString.getter(v41);
      v44 = v43;
      sub_100014B44(v42, v43, &v54);
      v53 = v45;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, &v54, v40 + 4, v40 + 12);
      swift_bridgeObjectRelease(v44);
      (*(void (**)(char *, uint64_t))(v35 + 8))(v7, v36);
      _os_log_impl((void *)&_mh_execute_header, v38, v39, "LogoRepository: can't create CGImage from URL: %s", v40, 0xCu);
      swift_arrayDestroy(v41, 1);
      swift_slowDealloc(v41, -1, -1);
      swift_slowDealloc(v40, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v35 + 8))(v7, v4);
    }

    return 0;
  }
  v20 = sub_100091180(v19);
  if (v21 >> 60 == 15)
  {
    v22 = v4;
    if (qword_1000CFAC8 != -1)
      swift_once(&qword_1000CFAC8, sub_10006CCA8);
    v23 = type metadata accessor for Logger(0);
    sub_1000096EC(v23, (uint64_t)qword_1000DDAD0);
    v24 = v52;
    v25 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v52 + 16))(v10, a1, v22);
    v26 = Logger.logObject.getter(v25);
    v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v27))
    {
      v51 = v19;
      v28 = (uint8_t *)swift_slowAlloc(12, -1);
      v29 = swift_slowAlloc(32, -1);
      v54 = v29;
      *(_DWORD *)v28 = 136315138;
      v30 = URL.absoluteString.getter(v29);
      v32 = v31;
      sub_100014B44(v30, v31, &v54);
      v53 = v33;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, &v54, v28 + 4, v28 + 12);
      swift_bridgeObjectRelease(v32);
      (*(void (**)(char *, uint64_t))(v24 + 8))(v10, v22);
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "LogoRepository: can't create data from image with URL: %s", v28, 0xCu);
      swift_arrayDestroy(v29, 1);
      swift_slowDealloc(v29, -1, -1);
      swift_slowDealloc(v28, -1, -1);

    }
    else
    {

      (*(void (**)(char *, uint64_t))(v24 + 8))(v10, v22);
    }
    return 0;
  }
  v46 = (uint64_t)v20;
  v47 = v21;
  v51 = v19;
  Data.write(to:options:)(a2, 0, v20, v21);
  countAndFlagsBits = URL.path(percentEncoded:)(1)._countAndFlagsBits;
  sub_1000388FC(v46, v47);

  return countAndFlagsBits;
}

CGImageRef sub_100091024@<X0>(NSURL *a1@<X8>)
{
  const __CFURL *v1;
  const __CFURL *v2;
  CGImageSource *v3;
  uint64_t v4;
  uint64_t inited;
  unint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  const __CFDictionary *isa;
  CGImageRef ThumbnailAtIndex;
  _BYTE v13[152];

  URL._bridgeToObjectiveC()(a1);
  v2 = v1;
  v3 = CGImageSourceCreateWithURL(v1, 0);

  if (!v3)
    return 0;
  v4 = sub_10000738C(&qword_1000D3800);
  inited = swift_initStackObject(v4, v13);
  *(_OWORD *)(inited + 16) = xmmword_1000A0600;
  *(_QWORD *)(inited + 32) = kCGImageSourceThumbnailMaxPixelSize;
  *(_QWORD *)(inited + 40) = SportsLogoSize.rawValue.getter((id)kCGImageSourceThumbnailMaxPixelSize);
  *(_QWORD *)(inited + 64) = &type metadata for Int;
  *(_QWORD *)(inited + 72) = kCGImageSourceCreateThumbnailFromImageAlways;
  *(_BYTE *)(inited + 80) = 1;
  *(_QWORD *)(inited + 104) = &type metadata for Bool;
  *(_QWORD *)(inited + 112) = kCGImageSourceCreateThumbnailWithTransform;
  *(_QWORD *)(inited + 144) = &type metadata for Bool;
  *(_BYTE *)(inited + 120) = 1;
  v6 = sub_10009141C();
  sub_100091458();
  v7 = (id)kCGImageSourceCreateThumbnailFromImageAlways;
  v8 = (id)kCGImageSourceCreateThumbnailWithTransform;
  v9 = Dictionary.init(dictionaryLiteral:)(inited, v6);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v9);
  ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v3, 0, isa);

  return ThumbnailAtIndex;
}

__CFData *sub_100091180(CGImage *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  __CFData *Mutable;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  CGImageDestination *v11;
  __CFData *v12;
  uint64_t v14;

  v2 = type metadata accessor for UTType(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  Mutable = CFDataCreateMutable(0, 0);
  if (Mutable)
  {
    v7 = static UTType.png.getter();
    UTType.identifier.getter(v7);
    v9 = v8;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    v10 = (__CFString *)String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
    v11 = CGImageDestinationCreateWithData(Mutable, v10, 1uLL, 0);

    if (v11)
    {
      CGImageDestinationAddImage(v11, a1, 0);
      if (CGImageDestinationFinalize(v11))
      {
        v12 = Mutable;
        Mutable = (__CFData *)static Data._unconditionallyBridgeFromObjectiveC(_:)(Mutable);

        return Mutable;
      }

    }
    else
    {

    }
    return 0;
  }
  return Mutable;
}

uint64_t sub_1000912C4()
{
  uint64_t v0;

  sub_100007618((_QWORD *)(v0 + 16));
  return swift_deallocClassInstance(v0, 56, 7);
}

uint64_t type metadata accessor for LogoRepository()
{
  return objc_opt_self(_TtC7sportsd14LogoRepository);
}

uint64_t type metadata accessor for LogoDownloadResult(uint64_t a1)
{
  uint64_t result;

  result = qword_1000D3870;
  if (!qword_1000D3870)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for LogoDownloadResult);
  return result;
}

uint64_t sub_100091340(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10000738C((uint64_t *)&unk_1000D16E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100091380()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000913A4()
{
  _QWORD *v0;

  swift_bridgeObjectRelease(v0[3]);
  swift_bridgeObjectRelease(v0[5]);
  swift_release(v0[6]);
  swift_bridgeObjectRelease(v0[8]);
  swift_bridgeObjectRelease(v0[10]);
  return swift_deallocObject(v0, 88, 7);
}

uint64_t sub_1000913E8@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t *v2;

  return sub_100090804(a1, v2[4], v2[5], v2[6], v2[7], v2[8], a2, v2[9], v2[10]);
}

unint64_t sub_10009141C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000D3808;
  if (!qword_1000D3808)
  {
    v1 = objc_opt_self(NSString);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000D3808);
  }
  return result;
}

unint64_t sub_100091458()
{
  unint64_t result;
  unint64_t v1;

  result = qword_1000D3810;
  if (!qword_1000D3810)
  {
    v1 = sub_10009141C();
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_1000D3810);
  }
  return result;
}

uint64_t *sub_100091498(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v12 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain(v12);
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    v7 = *(int *)(a3 + 24);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = type metadata accessor for SportingEventSubscription.Competitor.LogoFilePaths(0);
    v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    swift_bridgeObjectRetain(v5);
    swift_bridgeObjectRetain(v6);
    v11(v8, v9, v10);
  }
  return v3;
}

uint64_t sub_10009154C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 24));
  v4 = a1 + *(int *)(a2 + 24);
  v5 = type metadata accessor for SportingEventSubscription.Competitor.LogoFilePaths(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_10009159C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for SportingEventSubscription.Competitor.LogoFilePaths(0);
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  v10(v7, v8, v9);
  return a1;
}

_QWORD *sub_100091624(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  *a1 = *a2;
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[2] = a2[2];
  v8 = a2[3];
  v9 = a1[3];
  a1[3] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  v10 = *(int *)(a3 + 24);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = type metadata accessor for SportingEventSubscription.Competitor.LogoFilePaths(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

_OWORD *sub_1000916C0(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 24);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = type metadata accessor for SportingEventSubscription.Competitor.LogoFilePaths(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

_QWORD *sub_10009171C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v6 = a2[1];
  v7 = a1[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease(v7);
  v8 = a2[3];
  v9 = a1[3];
  a1[2] = a2[2];
  a1[3] = v8;
  swift_bridgeObjectRelease(v9);
  v10 = *(int *)(a3 + 24);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = type metadata accessor for SportingEventSubscription.Competitor.LogoFilePaths(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  return a1;
}

uint64_t sub_100091798(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000917A4);
}

uint64_t sub_1000917A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for SportingEventSubscription.Competitor.LogoFilePaths(0);
    return sub_100009658(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t sub_100091818(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100091824);
}

uint64_t sub_100091824(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = type metadata accessor for SportingEventSubscription.Competitor.LogoFilePaths(0);
    return sub_10000964C(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t sub_100091890(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  v4[0] = &unk_1000A4F28;
  v4[1] = &unk_1000A4F28;
  result = type metadata accessor for SportingEventSubscription.Competitor.LogoFilePaths(319);
  if (v3 <= 0x3F)
  {
    v4[2] = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 256, 3, v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t sub_100091904()
{
  return type metadata accessor for LogoDownloadResult(0);
}

void sub_10009190C(uint64_t a1, char a2, void (*a3)(uint64_t *))
{
  uint64_t v3;
  char v4;

  v3 = a1;
  v4 = a2 & 1;
  a3(&v3);
  sub_10009259C();
}

uint64_t sub_10009193C()
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
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[224];

  v1 = v0;
  v2 = sub_10000738C(&qword_1000D38B0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100091C28(v0, (uint64_t)v19);
  v6 = sub_100092590((uint64_t)&unk_1000C96E0);
  sub_100092580(v6);
  v7 = sub_10000738C(&qword_1000D0F18);
  swift_allocObject(v7, *(unsigned int *)(v7 + 48), *(unsigned __int16 *)(v7 + 52));
  v18 = Future.init(_:)(sub_100091C60, v6);
  sub_100091C28(v1, (uint64_t)v19);
  v8 = sub_100092590((uint64_t)&unk_1000C9708);
  v9 = sub_100092580(v8);
  v10 = static Subscribers.Demand.unlimited.getter(v9);
  v11 = sub_10000738C(&qword_1000D0B18);
  v12 = sub_10000D358(&qword_1000D0F20, &qword_1000D0F18, (uint64_t)&protocol conformance descriptor for Future<A, B>);
  v13 = sub_10000D358((unint64_t *)&qword_1000D0B20, &qword_1000D0B18, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
  Publisher.flatMap<A, B>(maxPublishers:_:)(v10, sub_100092058, v8, v7, &type metadata for Bool, v11, v12, v13);
  swift_release(v8);
  swift_release(v18);
  v14 = sub_10000D358(&qword_1000D38B8, &qword_1000D38B0, (uint64_t)&protocol conformance descriptor for Publishers.FlatMap<A, B>);
  v15 = Publisher.eraseToAnyPublisher()(v2, v14);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v15;
}

uint64_t sub_100091B18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _BYTE __src[216];

  v6 = sub_10000738C(&qword_1000D0578);
  __chkstk_darwin(v6);
  v8 = &__src[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v9 = swift_allocObject(&unk_1000C9730, 32, 7);
  *(_QWORD *)(v9 + 16) = a1;
  *(_QWORD *)(v9 + 24) = a2;
  v10 = type metadata accessor for TaskPriority(0);
  sub_10000964C((uint64_t)v8, 1, 1, v10);
  sub_100091C28(a3, (uint64_t)__src);
  v11 = (_QWORD *)swift_allocObject(&unk_1000C9758, 264, 7);
  v11[2] = 0;
  v11[3] = 0;
  memcpy(v11 + 4, __src, 0xD8uLL);
  v11[31] = sub_100092084;
  v11[32] = v9;
  swift_retain(a2);
  v12 = sub_100043B28((uint64_t)v8, (uint64_t)&unk_1000D38C8, (uint64_t)v11);
  return swift_release(v12);
}

uint64_t sub_100091C28(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for SubscriptionStopActivityOperation(a2, a1);
  return a2;
}

uint64_t sub_100091C60(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100091B18(a1, a2, v2 + 16);
}

uint64_t sub_100091C68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[31] = a5;
  v6[32] = a6;
  v6[30] = a4;
  return swift_task_switch(sub_100091C84, 0, 0);
}

uint64_t sub_100091C84()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v16;

  if (qword_1000CFAD8 != -1)
    swift_once(&qword_1000CFAD8, sub_10006CCEC);
  v1 = v0[30];
  v2 = type metadata accessor for Logger(0);
  sub_1000096EC(v2, (uint64_t)qword_1000DDB00);
  v3 = sub_100091C28(v1, (uint64_t)(v0 + 2));
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.debug.getter(v4);
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v16 = v7;
    *(_DWORD *)v6 = 136315138;
    v9 = v0[27];
    v8 = v0[28];
    swift_bridgeObjectRetain(v8);
    sub_100014B44(v9, v8, &v16);
    v0[29] = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 29, v0 + 30, v6 + 4, v6 + 12);
    swift_bridgeObjectRelease();
    sub_100073210(v0 + 2);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "SubscriptionStopActivityOperation: destroying activity for '%s'", v6, 0xCu);
    swift_arrayDestroy(v7, 1);
    sub_10000A818(v7);
    sub_10000A818((uint64_t)v6);
  }
  else
  {
    sub_100073210(v0 + 2);
  }

  if (qword_1000CFA98 != -1)
    swift_once(&qword_1000CFA98, sub_1000479AC);
  v11 = v0[30];
  v12 = *(_QWORD *)(v11 + 200);
  v13 = *(_QWORD *)(v11 + 208);
  v14 = (_QWORD *)swift_task_alloc(dword_1000D19F4);
  v0[33] = v14;
  *v14 = v0;
  v14[1] = sub_100091E90;
  return sub_10004C3B8(v12, v13, 0, 1);
}

uint64_t sub_100091E90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)();

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 264);
  *(_QWORD *)(*(_QWORD *)v1 + 272) = v0;
  swift_task_dealloc(v2);
  if (v0)
    v3 = sub_100091F24;
  else
    v3 = sub_100091EF4;
  return swift_task_switch(v3, 0, 0);
}

uint64_t sub_100091EF4()
{
  uint64_t v0;

  (*(void (**)(uint64_t, _QWORD))(v0 + 248))(1, 0);
  return sub_1000184C4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_100091F24()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 272);
  v2 = *(void (**)(uint64_t, uint64_t))(v0 + 248);
  swift_errorRetain(v1);
  v2(v1, 1);
  swift_errorRelease(v1);
  swift_errorRelease(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100091F80@<X0>(uint64_t *a1@<X1>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6[3];
  uint64_t v7;
  uint64_t v8;

  sub_1000235C4(a1[23], a1[24], a1[25], a1[26], v6);
  v3 = v7;
  v4 = v8;
  sub_1000073CC(v6, v7);
  *a2 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v3, v4);
  return sub_100007618(v6);
}

uint64_t sub_100091FF4()
{
  _QWORD *v0;

  sub_100007618(v0 + 2);
  swift_release(v0[7]);
  swift_release(v0[8]);
  sub_100007618(v0 + 9);
  sub_100007618(v0 + 14);
  sub_100007618(v0 + 19);
  swift_release(v0[24]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject(v0, 232, 7);
}

uint64_t sub_100092058@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_100091F80((uint64_t *)(v1 + 16), a1);
}

uint64_t sub_100092060()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

void sub_100092084(uint64_t a1, char a2)
{
  uint64_t v2;
  void (*v3)(uint64_t *);
  uint64_t v4;
  char v5;

  v3 = *(void (**)(uint64_t *))(v2 + 16);
  v4 = a1;
  v5 = a2 & 1;
  v3(&v4);
  sub_10009259C();
}

uint64_t sub_1000920B4()
{
  _QWORD *v0;

  swift_unknownObjectRelease(v0[2]);
  sub_100007618(v0 + 4);
  swift_release(v0[9]);
  swift_release(v0[10]);
  sub_100007618(v0 + 11);
  sub_100007618(v0 + 16);
  sub_100007618(v0 + 21);
  swift_release(v0[26]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release(v0[32]);
  return swift_deallocObject(v0, 264, 7);
}

uint64_t sub_100092128(uint64_t a1)
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
  v6 = (uint64_t)(v1 + 4);
  v8 = v1[31];
  v7 = v1[32];
  v9 = (_QWORD *)swift_task_alloc(dword_1000D38C4);
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_1000388BC;
  return sub_100091C68(a1, v4, v5, v6, v8, v7);
}

uint64_t destroy for SubscriptionStopActivityOperation(_QWORD *a1)
{
  sub_100007618(a1);
  swift_release(a1[5]);
  swift_release(a1[6]);
  sub_100007618(a1 + 7);
  sub_100007618(a1 + 12);
  sub_100007618(a1 + 17);
  swift_release(a1[22]);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SubscriptionStopActivityOperation(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = *(_QWORD *)(a2 + 40);
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = v5;
  *(_QWORD *)(a1 + 48) = v6;
  v7 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v7;
  v8 = v7;
  v9 = **(void (***)(uint64_t, uint64_t, uint64_t))(v7 - 8);
  swift_retain(v5);
  swift_retain(v6);
  v9(a1 + 56, a2 + 56, v8);
  v10 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 120) = v10;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 96, a2 + 96);
  v11 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 160) = v11;
  (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 136, a2 + 136);
  v12 = *(_QWORD *)(a2 + 176);
  v13 = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 176) = v12;
  *(_QWORD *)(a1 + 184) = v13;
  v15 = *(_QWORD *)(a2 + 192);
  v14 = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 192) = v15;
  *(_QWORD *)(a1 + 200) = v14;
  v16 = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 208) = v16;
  swift_retain(v12);
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRetain(v16);
  return a1;
}

_QWORD *assignWithCopy for SubscriptionStopActivityOperation(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_100009F58(a1, a2);
  v4 = a2[5];
  v5 = a1[5];
  a1[5] = v4;
  swift_retain(v4);
  swift_release(v5);
  v6 = a2[6];
  v7 = a1[6];
  a1[6] = v6;
  swift_retain(v6);
  swift_release(v7);
  sub_100009F58(a1 + 7, a2 + 7);
  sub_100009F58(a1 + 12, a2 + 12);
  sub_100009F58(a1 + 17, a2 + 17);
  v8 = a2[22];
  v9 = a1[22];
  a1[22] = v8;
  swift_retain(v8);
  swift_release(v9);
  a1[23] = a2[23];
  v10 = a2[24];
  a1[24] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease();
  a1[25] = a2[25];
  v11 = a2[26];
  a1[26] = v11;
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRelease();
  return a1;
}

void *initializeWithTake for SubscriptionStopActivityOperation(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xD8uLL);
}

uint64_t assignWithTake for SubscriptionStopActivityOperation(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_100007618((_QWORD *)a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  v6 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  swift_release(v6);
  v7 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_release(v7);
  sub_100007618((_QWORD *)(a1 + 56));
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  sub_100007618((_QWORD *)(a1 + 96));
  v8 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v8;
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  sub_100007618((_QWORD *)(a1 + 136));
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  v9 = *(_QWORD *)(a2 + 176);
  v10 = *(_QWORD *)(a1 + 176);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 176) = v9;
  swift_release(v10);
  v11 = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 192) = v11;
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 208) = v12;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SubscriptionStopActivityOperation(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 216))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 24);
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

uint64_t storeEnumTagSinglePayload for SubscriptionStopActivityOperation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
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
      *(_BYTE *)(result + 216) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 216) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SubscriptionStopActivityOperation()
{
  return &type metadata for SubscriptionStopActivityOperation;
}

void *sub_100092580(uint64_t a1)
{
  uint64_t v1;

  return memcpy((void *)(a1 + 16), (const void *)(v1 - 304), 0xD8uLL);
}

uint64_t sub_100092590(uint64_t a1)
{
  return swift_allocObject(a1, 232, 7);
}

void sub_1000925A8(uint64_t a1, uint64_t a2)
{
  _QWORD v3[4];

  if (*(_QWORD *)(a1 + 24) == 1)
  {
    sub_100038C8C(a1, &qword_1000D39F8);
    sub_100096B1C(a2, v3);
    sub_100038C8C((uint64_t)v3, &qword_1000D39F8);
  }
  else
  {
    sub_100038CB4(a1, (uint64_t)v3, (uint64_t *)&unk_1000CFF70);
    sub_100096E70((uint64_t)v3, a2);
  }
}

void sub_100092628(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_10000738C(&qword_1000D2E00);
  sub_100018BD0();
  __chkstk_darwin(v8);
  v9 = sub_10000A770();
  v10 = type metadata accessor for DatedSubscribers(v9);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  sub_100040030();
  if (sub_100009658(a1, 1, v10) == 1)
  {
    sub_100099124(a1);
    sub_100096D2C(a2, a3, v3);
    sub_1000185B4();
    sub_100099124(v3);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v4, a1, v10);
    sub_100096F58(v4, a2, a3);
    sub_1000185B4();
  }
}

void sub_10009271C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,char a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  char v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  char v41;
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
  uint64_t inited;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  void *v59;
  void *v61;
  void *v62;
  void *v64;
  _QWORD *v66;
  uint64_t v67;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD *v76;
  _QWORD *v77;
  unint64_t v78;
  _QWORD *v79;
  unint64_t v80;
  _QWORD *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  _QWORD *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  _QWORD *v94;
  _QWORD *v95;
  _QWORD *v96;
  _QWORD v97[3];
  uint64_t v98;
  uint64_t v99;
  _BYTE v100[64];
  _BYTE v101[440];

  sub_10000A758();
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v47 = v46;
  v49 = v48;
  v51 = v50;
  v52 = sub_10000738C(&qword_1000D0848);
  inited = swift_initStackObject(v52, v101);
  v54 = inited;
  *(_OWORD *)(inited + 16) = xmmword_1000A4FB0;
  *(_BYTE *)(inited + 32) = 2;
  if (v49)
  {
    v55 = &type metadata for String;
    v56 = v49;
  }
  else
  {
    v51 = 0;
    v56 = 0;
    v55 = 0;
    *(_QWORD *)(inited + 56) = 0;
  }
  *(_QWORD *)(inited + 40) = v51;
  *(_QWORD *)(inited + 48) = v56;
  *(_QWORD *)(inited + 64) = v55;
  *(_BYTE *)(inited + 72) = 11;
  if (v45)
  {
    v57 = &type metadata for String;
    v58 = v45;
  }
  else
  {
    v47 = 0;
    v58 = 0;
    v57 = 0;
    *(_QWORD *)(inited + 96) = 0;
  }
  *(_QWORD *)(inited + 80) = v47;
  *(_QWORD *)(inited + 88) = v58;
  *(_QWORD *)(inited + 104) = v57;
  *(_BYTE *)(inited + 112) = 12;
  if ((v41 & 1) != 0)
  {
    v59 = 0;
    v43 = 0;
    *(_QWORD *)(inited + 128) = 0;
    *(_QWORD *)(inited + 136) = 0;
  }
  else
  {
    v59 = &type metadata for UInt64;
  }
  *(_QWORD *)(inited + 144) = v59;
  *(_QWORD *)(inited + 120) = v43;
  *(_BYTE *)(inited + 152) = 17;
  if ((a29 & 1) != 0)
  {
    v61 = 0;
    a28 = 0;
    *(_QWORD *)(inited + 168) = 0;
    *(_QWORD *)(inited + 176) = 0;
  }
  else
  {
    v61 = &type metadata for Int;
  }
  *(_QWORD *)(inited + 184) = v61;
  *(_QWORD *)(inited + 160) = a28;
  *(_BYTE *)(inited + 192) = 9;
  if ((v37 & 1) != 0)
  {
    v62 = 0;
    v39 = 0;
    *(_QWORD *)(inited + 208) = 0;
    *(_QWORD *)(inited + 216) = 0;
  }
  else
  {
    v62 = &type metadata for UInt64;
  }
  *(_QWORD *)(inited + 224) = v62;
  *(_QWORD *)(inited + 200) = v39;
  *(_BYTE *)(inited + 232) = 13;
  if ((a22 & 1) != 0)
  {
    v64 = 0;
    a21 = 0;
    *(_QWORD *)(inited + 248) = 0;
    *(_QWORD *)(inited + 256) = 0;
  }
  else
  {
    v64 = &type metadata for UInt64;
  }
  *(_QWORD *)(inited + 264) = v64;
  *(_QWORD *)(inited + 240) = a21;
  *(_BYTE *)(inited + 272) = 15;
  if (a24)
  {
    v66 = &type metadata for String;
    v67 = a24;
  }
  else
  {
    a23 = 0;
    v67 = 0;
    v66 = 0;
    *(_QWORD *)(inited + 296) = 0;
  }
  *(_QWORD *)(inited + 280) = a23;
  *(_QWORD *)(inited + 288) = v67;
  *(_QWORD *)(inited + 304) = v66;
  *(_BYTE *)(inited + 312) = 14;
  if ((a31 & 1) != 0)
  {
    v69 = 0;
    a30 = 0;
    *(_QWORD *)(inited + 328) = 0;
    *(_QWORD *)(inited + 336) = 0;
  }
  else
  {
    v69 = &type metadata for UInt64;
  }
  *(_QWORD *)(inited + 344) = v69;
  *(_QWORD *)(inited + 320) = a30;
  *(_BYTE *)(inited + 352) = 16;
  v70 = sub_10000738C(&qword_1000D1400);
  v71 = swift_initStackObject(v70, v100);
  v72 = (_QWORD *)v71;
  *(_OWORD *)(v71 + 16) = xmmword_1000A06C0;
  if ((a27 & 1) != 0)
  {
    *(_QWORD *)(v71 + 32) = 0;
    *(_QWORD *)(v71 + 40) = 0;
    *(_QWORD *)(v71 + 48) = a32;
    *(_QWORD *)(v71 + 56) = a33;
    sub_10001896C();
    sub_1000185C8();
    sub_10000A834();
    sub_100055B00();
    v77 = _swiftEmptyArrayStorage;
  }
  else
  {
    v97[0] = a26;
    sub_100055B00();
    sub_1000185C8();
    sub_10000A834();
    v73 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
    v75 = v74;
    v72[4] = v73;
    v72[5] = v74;
    v72[6] = a32;
    v72[7] = a33;
    sub_10001896C();
    sub_1000185C8();
    sub_100013494();
    v77 = v76;
    v78 = v76[2];
    if (v78 >= v76[3] >> 1)
    {
      sub_100099118();
      v77 = v96;
    }
    v77[2] = v78 + 1;
    v79 = &v77[2 * v78];
    v79[4] = v73;
    v79[5] = v75;
  }
  if (a33)
  {
    sub_10001896C();
    if ((swift_isUniquelyReferenced_nonNull_native(v77) & 1) == 0)
    {
      sub_100099118();
      v77 = v94;
    }
    v80 = v77[2];
    if (v80 >= v77[3] >> 1)
    {
      sub_100099118();
      v77 = v95;
    }
    v77[2] = v80 + 1;
    v81 = &v77[2 * v80];
    v81[4] = a32;
    v81[5] = a33;
  }
  swift_release(v72);
  v97[0] = v77;
  v82 = sub_10000738C(&qword_1000D0440);
  sub_10000A40C((unint64_t *)&qword_1000D0448, &qword_1000D0440);
  v84 = BidirectionalCollection<>.joined(separator:)(95, 0xE100000000000000, v82, v83);
  v86 = v85;
  swift_bridgeObjectRelease(v77);
  *(_QWORD *)(v54 + 384) = &type metadata for String;
  *(_QWORD *)(v54 + 360) = v84;
  *(_QWORD *)(v54 + 368) = v86;
  *(_BYTE *)(v54 + 392) = 1;
  if (a35)
  {
    v87 = a34;
    v88 = &type metadata for String;
    v89 = a35;
  }
  else
  {
    sub_100099010();
    *(_QWORD *)(v54 + 416) = 0;
  }
  *(_QWORD *)(v54 + 400) = v87;
  *(_QWORD *)(v54 + 408) = v89;
  *(_QWORD *)(v54 + 424) = v88;
  sub_100055B00();
  sub_10000738C((uint64_t *)&unk_1000CFF70);
  sub_100099180();
  v90 = sub_100099190(v54, (uint64_t)&type metadata for SportsMetricsKey);
  sub_100038C60(a36, (uint64_t)v97, &qword_1000D1408);
  v91 = v98;
  if (v98)
  {
    v92 = v99;
    sub_1000073CC(v97, v98);
    v93 = (*(uint64_t (**)(uint64_t, uint64_t))(v92 + 8))(v91, v92);
    sub_100007618(v97);
  }
  else
  {
    sub_100038C8C((uint64_t)v97, &qword_1000D1408);
    v93 = sub_100099190((uint64_t)_swiftEmptyArrayStorage, (uint64_t)&type metadata for SportsMetricsKey);
  }
  sub_100094058(v93, v90);
  sub_10000A668();
}

void sub_100092BD8(uint64_t a1, __int16 a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __n128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t *v29;
  __int128 *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  _QWORD *v42;
  int64_t v43;
  _QWORD *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  int64_t v48;
  unint64_t v49;
  int64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  Swift::Int v60;
  unint64_t v61;
  char v62;
  Swift::Bool v63;
  uint64_t v64;
  unint64_t v65;
  char v66;
  _QWORD *v67;
  _OWORD *v68;
  unint64_t v69;
  char v70;
  char v71;
  char v72;
  Swift::Int v73;
  uint64_t *v74;
  uint64_t v75;
  BOOL v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  uint64_t v80;
  char v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  void (*v87)(uint64_t, uint64_t);
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  int64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  _QWORD *v106;
  int64_t v107;
  int64_t v108;
  _QWORD *v109;
  _OWORD v110[2];
  __int128 v111;
  uint64_t v112;
  __int128 v113;
  __int128 v114;
  uint64_t v115;
  _QWORD v116[3];
  uint64_t v117;
  void *v118;
  uint64_t v119;
  __int16 v120;

  v4 = v2;
  v102 = sub_10000738C(&qword_1000D39E8);
  v7 = *(_QWORD *)(v102 - 8);
  __chkstk_darwin(v102);
  sub_10000CD48();
  v101 = v8;
  v9 = type metadata accessor for MetricsFieldsContext(0);
  v100 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  sub_10007B1E8();
  v98 = v10;
  sub_100043334();
  v12 = __chkstk_darwin(v11);
  v99 = (char *)&v92 - v13;
  v14 = type metadata accessor for MetricsData(0, v12);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  sub_100040030();
  sub_10000738C(&qword_1000D39F0);
  sub_100018BD0();
  __chkstk_darwin(v16);
  sub_10000A7D4();
  v19 = v18 - v17;
  v20 = objc_msgSend(objc_allocWithZone((Class)ACAccountStore), "init");
  ACAccountStore.activeAccount.getter();

  v21 = type metadata accessor for Account(0);
  if (sub_100009658(v19, 1, v21) == 1)
  {
    sub_100038C8C(v19, &qword_1000D39F0);
    return;
  }
  sub_100038C8C(v19, &qword_1000D39F0);
  v119 = a1;
  v120 = a2 & 0x101;
  v22 = &OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_notificationLottery;
  if ((a2 & 1) == 0)
    v22 = &OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_loadUrlLottery;
  v23 = *v22;
  v103 = v4;
  v24 = (uint64_t *)(v4 + v23);
  v25 = *v24;
  v26 = v24[1];
  v27 = 0x6C725564616F6CLL;
  v28 = 0x80000001000A7EE0;
  if ((a2 & 1) != 0)
    v27 = 0xD000000000000011;
  else
    v28 = 0xE700000000000000;
  v117 = (uint64_t)&type metadata for String;
  v116[0] = v27;
  v116[1] = v28;
  sub_100018E34();
  sub_1000185C8();
  sub_1000925A8((uint64_t)v116, 3);
  v117 = (uint64_t)&type metadata for Double;
  v116[0] = v25;
  sub_1000925A8((uint64_t)v116, 18);
  sub_100018574();
  v117 = (uint64_t)&type metadata for Double;
  v116[0] = v26;
  sub_1000925A8((uint64_t)v116, 19);
  v117 = (uint64_t)&type metadata for String;
  v116[0] = 0xD000000000000011;
  v116[1] = 0x80000001000A5730;
  sub_1000925A8((uint64_t)v116, 0);
  v117 = (uint64_t)&type metadata for String;
  strcpy((char *)v116, "com.apple.tv");
  BYTE5(v116[1]) = 0;
  HIWORD(v116[1]) = -5120;
  sub_1000925A8((uint64_t)v116, 1);
  sub_100075518(42, v119, &v113);
  v97 = v14;
  v96 = v15;
  v95 = v3;
  v94 = v9;
  v93 = v7;
  if (*((_QWORD *)&v114 + 1) == 1)
  {
    v29 = &qword_1000D39F8;
    v30 = &v113;
LABEL_15:
    sub_100038C8C((uint64_t)v30, v29);
    goto LABEL_16;
  }
  sub_100038CB4((uint64_t)&v113, (uint64_t)v116, (uint64_t *)&unk_1000CFF70);
  if (!v117)
  {
    v29 = (uint64_t *)&unk_1000CFF70;
    v30 = (__int128 *)v116;
    goto LABEL_15;
  }
  if ((swift_dynamicCast(&v111, v116, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
  {
    v31 = *((_QWORD *)&v111 + 1);
    v32 = (_QWORD *)(v103 + OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_environmentDataCenter);
    v33 = *(_QWORD *)(v103 + OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_environmentDataCenter + 8);
    *v32 = v111;
    v32[1] = v31;
    swift_bridgeObjectRelease(v33);
    goto LABEL_20;
  }
LABEL_16:
  v34 = *(_QWORD *)(v103 + OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_environmentDataCenter + 8);
  if (v34)
  {
    v35 = *(_QWORD *)(v103 + OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_environmentDataCenter);
    v117 = (uint64_t)&type metadata for String;
    v116[0] = v35;
    v116[1] = v34;
  }
  else
  {
    memset(v116, 0, sizeof(v116));
    v117 = 1;
  }
  swift_bridgeObjectRetain(v34);
  sub_1000925A8((uint64_t)v116, 42);
LABEL_20:
  sub_1000954A4((uint64_t)&v119);
  v36 = v119;
  v37 = *(_QWORD *)(v119 + 64);
  v105 = v119 + 64;
  v38 = 1 << *(_BYTE *)(v119 + 32);
  v39 = -1;
  if (v38 < 64)
    v39 = ~(-1 << v38);
  v40 = v39 & v37;
  v41 = (char *)&v113 + 8;
  v42 = &v116[1];
  v107 = (unint64_t)(v38 + 63) >> 6;
  v92 = v107 - 1;
  swift_bridgeObjectRetain(v119);
  v43 = 0;
  v44 = &_swiftEmptyDictionarySingleton;
  v104 = (char *)&type metadata for Any + 8;
  v106 = &v116[1];
  if (!v40)
    goto LABEL_25;
LABEL_23:
  sub_10009920C();
  v46 = v45 | (v43 << 6);
LABEL_24:
  v47 = *(_QWORD *)(v36 + 56);
  LOBYTE(v113) = *(_BYTE *)(*(_QWORD *)(v36 + 48) + v46);
  sub_100038C60(v47 + 32 * v46, (uint64_t)v41, (uint64_t *)&unk_1000CFF70);
  while (1)
  {
    sub_100038CB4((uint64_t)&v113, (uint64_t)v116, &qword_1000D3A00);
    if (v118 == (void *)1)
    {
      swift_release(v36);
      v78 = v95;
      MetricsData.init(topic:shouldFlush:fields:includingFields:excludingFields:)(0xD000000000000012, 0x80000001000A56F0, 0, v44, &_swiftEmptySetSingleton, &_swiftEmptySetSingleton);
      v79 = v120;
      v80 = sub_10001896C();
      v81 = sub_100095D54(v80, v79);
      v82 = sub_100018DAC();
      if ((v81 & 1) != 0)
      {
        v83 = v98;
        v84 = MetricsFieldsContext.init()(v82);
        v116[0] = 0xD000000000000012;
        v116[1] = 0x80000001000A56F0;
        v85 = v101;
        static MetricsFieldsContext.Property<A>.topic.getter(v84);
        v86 = v99;
        MetricsFieldsContext.addingValue<A>(_:forProperty:)(v116, v85, &type metadata for String);
        (*(void (**)(uint64_t, uint64_t))(v93 + 8))(v85, v102);
        swift_bridgeObjectRelease(v116[1]);
        v87 = *(void (**)(uint64_t, uint64_t))(v100 + 8);
        v88 = v94;
        v87(v83, v94);
        v89 = MetricsPipeline.process(_:using:)(v78, v86);
        v87((uint64_t)v86, v88);
        v90 = sub_100018468(0, (unint64_t *)&qword_1000D05D8, OS_dispatch_queue_ptr);
        v91 = static OS_dispatch_queue.main.getter(v90);
        v117 = v90;
        v118 = &protocol witness table for OS_dispatch_queue;
        v116[0] = v91;
        Promise.then(perform:orCatchError:on:)(nullsub_1, 0, sub_100095E20, 0, v116);
        swift_release(v89);
        sub_100007618(v116);
      }
      (*(void (**)(uint64_t, uint64_t))(v96 + 8))(v78, v97);
      swift_bridgeObjectRelease(v119);
      return;
    }
    v51 = LOBYTE(v116[0]);
    sub_100038CB4((uint64_t)v42, (uint64_t)&v113, (uint64_t *)&unk_1000CFF70);
    if ((v51 - 45) <= 0xFDu)
    {
      v108 = v43;
      v52 = sub_10007B6F4(v51);
      sub_100038C60((uint64_t)&v113, (uint64_t)&v111, (uint64_t *)&unk_1000CFF70);
      if (v112)
      {
        v53 = v36;
        v54 = v41;
        sub_100022CB8(&v111, v110);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v44);
        v109 = v44;
        sub_100099158();
        sub_100099148();
        v60 = v58 + v59;
        if (__OFADD__(v58, v59))
          goto LABEL_65;
        v61 = v56;
        v62 = v57;
        sub_10000738C(&qword_1000D3A08);
        v63 = _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v60);
        v64 = v51;
        if (v63)
        {
          v65 = sub_100015050(v52, v51);
          if ((v62 & 1) != (v66 & 1))
            goto LABEL_68;
          v61 = v65;
        }
        v44 = v109;
        if ((v62 & 1) != 0)
        {
          v67 = (_QWORD *)(v109[7] + 32 * v61);
          sub_100007618(v67);
          v68 = v67;
          v64 = v51;
          sub_100022CB8(v110, v68);
        }
        else
        {
          v109[(v61 >> 6) + 8] |= 1 << v61;
          v74 = (uint64_t *)(v44[6] + 16 * v61);
          *v74 = v52;
          v74[1] = v51;
          sub_100022CB8(v110, (_OWORD *)(v44[7] + 32 * v61));
          v75 = v44[2];
          v76 = __OFADD__(v75, 1);
          v77 = v75 + 1;
          if (v76)
            goto LABEL_66;
          v44[2] = v77;
          swift_bridgeObjectRetain(v51);
        }
        swift_bridgeObjectRelease(v64);
        swift_bridgeObjectRelease(0x8000000000000000);
        v41 = v54;
        v36 = v53;
        v42 = v106;
        v43 = v108;
      }
      else
      {
        sub_100099124((uint64_t)&v111);
        sub_10000A834();
        v69 = sub_100099158();
        v71 = v70;
        sub_1000061E8();
        if ((v71 & 1) != 0)
        {
          v72 = swift_isUniquelyReferenced_nonNull_native(v44);
          v109 = v44;
          v73 = v44[3];
          sub_10000738C(&qword_1000D3A08);
          _NativeDictionary.ensureUnique(isUnique:capacity:)(v72, v73);
          v44 = v109;
          sub_100099140(v109[6] + 16 * v69);
          sub_100022CB8((_OWORD *)(v44[7] + 32 * v69), v110);
          _NativeDictionary._delete(at:)(v69, v44, &type metadata for String, v104, &protocol witness table for String);
          swift_bridgeObjectRelease(0x8000000000000000);
        }
        else
        {
          memset(v110, 0, sizeof(v110));
        }
        v43 = v108;
        sub_100018574();
        sub_100099124((uint64_t)v110);
      }
    }
    sub_100099124((uint64_t)&v113);
    if (v40)
      goto LABEL_23;
LABEL_25:
    v48 = v43 + 1;
    if (__OFADD__(v43, 1))
      break;
    if (v48 < v107)
    {
      v49 = *(_QWORD *)(v105 + 8 * v48);
      if (v49)
        goto LABEL_28;
      v50 = v43 + 2;
      ++v43;
      if (v48 + 1 < v107)
      {
        v49 = *(_QWORD *)(v105 + 8 * v50);
        if (v49)
          goto LABEL_31;
        v43 = v48 + 1;
        if (v48 + 2 < v107)
        {
          v49 = *(_QWORD *)(v105 + 8 * (v48 + 2));
          if (v49)
          {
            v48 += 2;
            goto LABEL_28;
          }
          v50 = v48 + 3;
          v43 = v48 + 2;
          if (v48 + 3 < v107)
          {
            v49 = *(_QWORD *)(v105 + 8 * v50);
            if (!v49)
            {
              while (1)
              {
                v48 = v50 + 1;
                if (__OFADD__(v50, 1))
                  goto LABEL_67;
                if (v48 >= v107)
                {
                  v43 = v92;
                  goto LABEL_42;
                }
                v49 = *(_QWORD *)(v105 + 8 * v48);
                ++v50;
                if (v49)
                  goto LABEL_28;
              }
            }
LABEL_31:
            v48 = v50;
LABEL_28:
            v40 = (v49 - 1) & v49;
            v46 = __clz(__rbit64(v49)) + (v48 << 6);
            v43 = v48;
            goto LABEL_24;
          }
        }
      }
    }
LABEL_42:
    v40 = 0;
    v113 = 0u;
    v114 = 0u;
    v115 = 1;
  }
  __break(1u);
LABEL_65:
  __break(1u);
LABEL_66:
  __break(1u);
LABEL_67:
  __break(1u);
LABEL_68:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
}

uint64_t sub_10009363C()
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
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t inited;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int *v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
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
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
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
  void *v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  _QWORD *v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t v97;
  _QWORD *v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t v102;
  _QWORD *v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t v107;
  _QWORD *v108;
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t v112;
  _QWORD *v113;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;

  sub_10000A758();
  v127 = v1;
  v128 = v2;
  sub_10000738C((uint64_t *)&unk_1000D16E0);
  sub_100018BD0();
  __chkstk_darwin(v3);
  sub_10000CD48();
  v121 = v4;
  sub_10000738C(&qword_1000D0570);
  sub_100018BD0();
  __chkstk_darwin(v5);
  sub_10007B1E8();
  v125 = v6;
  sub_100043334();
  __chkstk_darwin(v7);
  v9 = (char *)&v115 - v8;
  __chkstk_darwin(v10);
  sub_100043340();
  v123 = v11;
  sub_100043334();
  __chkstk_darwin(v12);
  sub_100043340();
  v120 = v13;
  sub_100043334();
  __chkstk_darwin(v14);
  v16 = (char *)&v115 - v15;
  __chkstk_darwin(v17);
  sub_100043340();
  v119 = v18;
  sub_100043334();
  __chkstk_darwin(v19);
  sub_100043340();
  v117 = v20;
  sub_100043334();
  __chkstk_darwin(v21);
  sub_100043340();
  v116 = v22;
  sub_100043334();
  __chkstk_darwin(v23);
  v25 = (char *)&v115 - v24;
  __chkstk_darwin(v26);
  v28 = (char *)&v115 - v27;
  __chkstk_darwin(v29);
  v31 = (char *)&v115 - v30;
  v32 = sub_10000738C(&qword_1000D0848);
  inited = swift_initStackObject(v32, &v126);
  *(_OWORD *)(inited + 16) = xmmword_1000A4FC0;
  *(_BYTE *)(inited + 32) = 5;
  v122 = type metadata accessor for ApiRequestMetrics(0);
  v34 = v0;
  v35 = v0 + *(int *)(v122 + 40);
  sub_100038C60(v35, (uint64_t)v31, &qword_1000D0570);
  v36 = type metadata accessor for Date(0);
  v37 = sub_1000991F4((uint64_t)v31);
  v124 = v9;
  v118 = v35;
  if (v37 == 1)
  {
    sub_100038C8C((uint64_t)v31, &qword_1000D0570);
    *(_OWORD *)(inited + 40) = 0u;
    *(_OWORD *)(inited + 56) = 0u;
  }
  else
  {
    sub_100080BA0();
    *(_QWORD *)(inited + 64) = &type metadata for UInt64;
    *(_QWORD *)(inited + 40) = v39;
    sub_100099008((uint64_t)v31, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 8));
  }
  v40 = v34;
  v41 = (int *)v122;
  *(_BYTE *)(inited + 72) = 6;
  v42 = v40 + v41[15];
  sub_10009922C(v42, v38, &qword_1000D0570);
  v43 = sub_100098FD8((uint64_t)v28);
  v122 = v42;
  if (v44)
  {
    sub_100099188(v43, &qword_1000D0570);
    sub_100099034();
  }
  else
  {
    sub_100080BA0();
    *(_QWORD *)(inited + 104) = &type metadata for UInt64;
    *(_QWORD *)(inited + 80) = v45;
    sub_100099008((uint64_t)v28, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 8));
  }
  v46 = v121;
  *(_BYTE *)(inited + 112) = 25;
  sub_100038C60(v40, (uint64_t)v25, &qword_1000D0570);
  v47 = sub_100098FD8((uint64_t)v25);
  if (v44)
  {
    sub_1000991D4(v47, &qword_1000D0570);
    sub_100099034();
  }
  else
  {
    sub_100080BA0();
    *(_QWORD *)(inited + 144) = &type metadata for UInt64;
    *(_QWORD *)(inited + 120) = v48;
    sub_100099008((uint64_t)v25, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 8));
  }
  v50 = v119;
  v51 = v116;
  *(_BYTE *)(inited + 152) = 26;
  v52 = *(_BYTE *)(v40 + v41[11]);
  *(_QWORD *)(inited + 184) = &type metadata for Bool;
  *(_BYTE *)(inited + 160) = v52;
  *(_BYTE *)(inited + 192) = 27;
  sub_100099178(v40 + v41[5], v49, &qword_1000D0570);
  sub_100098FD8(v51);
  if (v44)
  {
    sub_100038C8C(v51, &qword_1000D0570);
    sub_100099034();
  }
  else
  {
    sub_100080BA0();
    *(_QWORD *)(inited + 224) = &type metadata for UInt64;
    *(_QWORD *)(inited + 200) = v53;
    sub_100098FF4();
  }
  v55 = v117;
  *(_BYTE *)(inited + 232) = 28;
  sub_100099178(v40 + v41[8], v54, &qword_1000D0570);
  sub_100098FD8(v55);
  if (v44)
  {
    sub_100038C8C(v55, &qword_1000D0570);
    sub_100099034();
  }
  else
  {
    sub_100080BA0();
    *(_QWORD *)(inited + 264) = &type metadata for UInt64;
    *(_QWORD *)(inited + 240) = v56;
    sub_100098FF4();
  }
  *(_BYTE *)(inited + 272) = 29;
  sub_100038C60(v40 + v41[9], v50, &qword_1000D0570);
  v57 = sub_100098FD8(v50);
  if (v44)
  {
    sub_1000991D4(v57, &qword_1000D0570);
    sub_100099034();
  }
  else
  {
    sub_100080BA0();
    *(_QWORD *)(inited + 304) = &type metadata for UInt64;
    *(_QWORD *)(inited + 280) = v58;
    sub_100099008(v50, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 8));
  }
  v59 = v118;
  *(_BYTE *)(inited + 312) = 30;
  sub_100038C60(v59, (uint64_t)v16, &qword_1000D0570);
  sub_100098FD8((uint64_t)v16);
  if (v44)
  {
    sub_100038C8C((uint64_t)v16, &qword_1000D0570);
    sub_100099034();
  }
  else
  {
    sub_100080BA0();
    *(_QWORD *)(inited + 344) = &type metadata for UInt64;
    *(_QWORD *)(inited + 320) = v60;
    sub_100099008((uint64_t)v16, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 8));
  }
  v62 = v120;
  *(_BYTE *)(inited + 352) = 31;
  v63 = (uint64_t *)(v40 + v41[12]);
  v64 = v63[1];
  if (v64)
  {
    v65 = *v63;
    v66 = &type metadata for String;
    v67 = v64;
  }
  else
  {
    sub_100099010();
    *(_QWORD *)(inited + 376) = 0;
  }
  *(_QWORD *)(inited + 360) = v65;
  *(_QWORD *)(inited + 368) = v67;
  *(_QWORD *)(inited + 384) = v66;
  *(_BYTE *)(inited + 392) = 32;
  v68 = *(_QWORD *)(v40 + v41[6]);
  *(_QWORD *)(inited + 424) = &type metadata for Int64;
  *(_QWORD *)(inited + 400) = v68;
  *(_BYTE *)(inited + 432) = 33;
  sub_100099178(v40 + v41[13], v61, &qword_1000D0570);
  v69 = sub_1000991F4(v62);
  swift_bridgeObjectRetain(v64);
  if (v69 == 1)
  {
    sub_100038C8C(v62, &qword_1000D0570);
    *(_OWORD *)(inited + 440) = 0u;
    *(_OWORD *)(inited + 456) = 0u;
  }
  else
  {
    sub_100080BA0();
    *(_QWORD *)(inited + 464) = &type metadata for UInt64;
    *(_QWORD *)(inited + 440) = v71;
    sub_100098FF4();
  }
  *(_BYTE *)(inited + 472) = 4;
  sub_10009922C(v40 + v41[14], v70, (uint64_t *)&unk_1000D16E0);
  v72 = type metadata accessor for URL(0);
  v73 = sub_100009658(v46, 1, v72);
  if ((_DWORD)v73 == 1)
  {
    sub_100099188(v73, (uint64_t *)&unk_1000D16E0);
    sub_100099034();
  }
  else
  {
    v75 = URL.absoluteString.getter(v73);
    *(_QWORD *)(inited + 504) = &type metadata for String;
    *(_QWORD *)(inited + 480) = v75;
    *(_QWORD *)(inited + 488) = v76;
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v72 - 8) + 8))(v46, v72);
  }
  v78 = v123;
  v77 = (uint64_t)v124;
  v79 = v122;
  *(_BYTE *)(inited + 512) = 34;
  sub_10009922C(v79, v74, &qword_1000D0570);
  v80 = sub_100098FD8(v78);
  if (v44)
  {
    sub_100099188(v80, &qword_1000D0570);
    sub_100099034();
  }
  else
  {
    sub_100080BA0();
    *(_QWORD *)(inited + 544) = &type metadata for UInt64;
    *(_QWORD *)(inited + 520) = v81;
    sub_100099008(v78, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 8));
  }
  *(_BYTE *)(inited + 552) = 35;
  v82 = *(_QWORD *)(v40 + v41[7]);
  *(_QWORD *)(inited + 584) = &type metadata for Int64;
  *(_QWORD *)(inited + 560) = v82;
  *(_BYTE *)(inited + 592) = 36;
  sub_100038C60(v40 + v41[16], v77, &qword_1000D0570);
  sub_100098FD8(v77);
  if (v44)
  {
    sub_100038C8C(v77, &qword_1000D0570);
    sub_100099034();
  }
  else
  {
    sub_100080BA0();
    *(_QWORD *)(inited + 624) = &type metadata for UInt64;
    *(_QWORD *)(inited + 600) = v83;
    sub_100099008(v77, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 8));
  }
  *(_BYTE *)(inited + 632) = 37;
  v85 = v125;
  sub_100099178(v40 + v41[17], v84, &qword_1000D0570);
  sub_100098FD8(v85);
  if (v44)
  {
    sub_100038C8C(v125, &qword_1000D0570);
    sub_100099034();
  }
  else
  {
    sub_100080BA0();
    *(_QWORD *)(inited + 664) = &type metadata for UInt64;
    *(_QWORD *)(inited + 640) = v86;
    sub_100098FF4();
  }
  *(_BYTE *)(inited + 672) = 38;
  v87 = v40 + v41[18];
  if ((*(_BYTE *)(v87 + 8) & 1) != 0)
  {
    v88 = 0;
    v89 = 0;
    *(_OWORD *)(inited + 688) = 0u;
  }
  else
  {
    v88 = *(_QWORD *)v87;
    v89 = &type metadata for Int;
  }
  *(_QWORD *)(inited + 680) = v88;
  *(_QWORD *)(inited + 704) = v89;
  *(_BYTE *)(inited + 712) = 39;
  v90 = (uint64_t *)(v40 + v41[19]);
  v91 = v90[1];
  if (v91)
  {
    v92 = *v90;
    v93 = &type metadata for String;
    v94 = v91;
  }
  else
  {
    sub_100099010();
    *(_QWORD *)(inited + 736) = 0;
  }
  *(_QWORD *)(inited + 720) = v92;
  *(_QWORD *)(inited + 728) = v94;
  *(_QWORD *)(inited + 744) = v93;
  *(_BYTE *)(inited + 752) = 40;
  v95 = (uint64_t *)(v40 + v41[20]);
  v96 = v95[1];
  if (v96)
  {
    v97 = *v95;
    v98 = &type metadata for String;
    v99 = v96;
  }
  else
  {
    sub_100099010();
    *(_QWORD *)(inited + 776) = 0;
  }
  *(_QWORD *)(inited + 760) = v97;
  *(_QWORD *)(inited + 768) = v99;
  *(_QWORD *)(inited + 784) = v98;
  *(_BYTE *)(inited + 792) = 41;
  v100 = (uint64_t *)(v40 + v41[21]);
  v101 = v100[1];
  if (v101)
  {
    v102 = *v100;
    v103 = &type metadata for String;
    v104 = v101;
  }
  else
  {
    sub_100099010();
    *(_QWORD *)(inited + 816) = 0;
  }
  *(_QWORD *)(inited + 800) = v102;
  *(_QWORD *)(inited + 808) = v104;
  *(_QWORD *)(inited + 824) = v103;
  *(_BYTE *)(inited + 832) = 42;
  v105 = (uint64_t *)(v40 + v41[22]);
  v106 = v105[1];
  if (v106)
  {
    v107 = *v105;
    v108 = &type metadata for String;
    v109 = v106;
  }
  else
  {
    sub_100099010();
    *(_QWORD *)(inited + 856) = 0;
  }
  *(_QWORD *)(inited + 840) = v107;
  *(_QWORD *)(inited + 848) = v109;
  *(_QWORD *)(inited + 864) = v108;
  *(_BYTE *)(inited + 872) = 15;
  v110 = (uint64_t *)(v40 + v41[23]);
  v111 = v110[1];
  if (v111)
  {
    v112 = *v110;
    v113 = &type metadata for String;
  }
  else
  {
    v112 = 0;
    v113 = 0;
    *(_QWORD *)(inited + 896) = 0;
  }
  *(_QWORD *)(inited + 880) = v112;
  *(_QWORD *)(inited + 888) = v111;
  *(_QWORD *)(inited + 904) = v113;
  swift_bridgeObjectRetain(v106);
  sub_1000185C8();
  sub_10000A834();
  sub_100055B00();
  sub_1000991CC();
  sub_10000738C((uint64_t *)&unk_1000CFF70);
  sub_100099180();
  return Dictionary.init(dictionaryLiteral:)(inited, &type metadata for SportsMetricsKey);
}

uint64_t sub_100093F60()
{
  uint64_t v0;
  uint64_t inited;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE v7[72];

  v0 = sub_10000738C(&qword_1000D0848);
  inited = swift_initStackObject(v0, v7);
  *(_OWORD *)(inited + 16) = xmmword_10009FDB0;
  *(_BYTE *)(inited + 32) = 38;
  type metadata accessor for AMSError(0);
  v3 = v2;
  sub_10000A378(&qword_1000CFBB0, (uint64_t (*)(uint64_t))type metadata accessor for AMSError);
  v5 = _BridgedStoredNSError.errorUserInfo.getter(v3, v4);
  sub_1000754DC(0x7574617453534D41, 0xED000065646F4373, v5, (_OWORD *)(inited + 40));
  sub_1000185B4();
  sub_10000738C((uint64_t *)&unk_1000CFF70);
  sub_100021804();
  return Dictionary.init(dictionaryLiteral:)(inited, &type metadata for SportsMetricsKey);
}

uint64_t sub_100094058(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v8;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(a2);
  v8 = a2;
  sub_100097104(a1, (uint64_t)sub_100097050, 0, isUniquelyReferenced_nonNull_native, (uint64_t)&v8);
  v6 = v8;
  swift_bridgeObjectRelease(0x8000000000000000);
  if (v2)
    swift_bridgeObjectRelease(v6);
  return v6;
}

void sub_1000940D4()
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
  uint64_t inited;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  sub_10000A758();
  v2 = v1;
  v4 = v3;
  sub_10000738C((uint64_t *)&unk_1000D16E0);
  sub_100018BD0();
  __chkstk_darwin(v5);
  sub_100040030();
  v6 = type metadata accessor for Date(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_10000A7D4();
  v10 = v9 - v8;
  sub_100075770(43, v4, &v35);
  if (v36)
    swift_dynamicCast(&v34, &v35, (char *)&type metadata for Any + 8, &type metadata for Bool, 6);
  else
    sub_100038C8C((uint64_t)&v35, (uint64_t *)&unk_1000CFF70);
  v11 = sub_10000738C(&qword_1000D0848);
  inited = swift_initStackObject(v11, &v38);
  *(_OWORD *)(inited + 16) = xmmword_1000A0600;
  *(_BYTE *)(inited + 32) = 9;
  Date.init()(inited);
  sub_100080BA0();
  v14 = v13;
  v15 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v10, v6);
  *(_QWORD *)(inited + 64) = &type metadata for UInt64;
  *(_QWORD *)(inited + 40) = v14;
  *(_BYTE *)(inited + 72) = 4;
  URLRequest.url.getter(v15);
  v16 = type metadata accessor for URL(0);
  v17 = sub_100009658(v0, 1, v16);
  if ((_DWORD)v17 == 1)
  {
    sub_1000991D4(v17, (uint64_t *)&unk_1000D16E0);
    v18 = 0;
    v19 = 0;
    v20 = 0;
    *(_QWORD *)(inited + 96) = 0;
  }
  else
  {
    v18 = URL.absoluteString.getter(v17);
    v19 = v21;
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v0, v16);
    v20 = &type metadata for String;
  }
  *(_QWORD *)(inited + 80) = v18;
  *(_QWORD *)(inited + 88) = v19;
  *(_QWORD *)(inited + 104) = v20;
  *(_BYTE *)(inited + 112) = 39;
  v22 = URLRequest.httpMethod.getter();
  if (v23)
  {
    v24 = &type metadata for String;
  }
  else
  {
    v22 = 0;
    v24 = 0;
    *(_QWORD *)(inited + 136) = 0;
  }
  *(_QWORD *)(inited + 120) = v22;
  *(_QWORD *)(inited + 128) = v23;
  *(_QWORD *)(inited + 144) = v24;
  sub_10000738C((uint64_t *)&unk_1000CFF70);
  sub_100099180();
  v25 = sub_10009919C(inited, (uint64_t)&type metadata for SportsMetricsKey);
  sub_1000816A8(v4);
  v27 = sub_100094058(v26, v25);
  v28 = sub_10001896C();
  v29 = sub_100094058(v28, v27);
  sub_100038C60(v2, (uint64_t)&v35, &qword_1000D1408);
  v30 = v36;
  if (v36)
  {
    v31 = v37;
    sub_1000073CC(&v35, v36);
    v32 = (*(uint64_t (**)(uint64_t, uint64_t))(v31 + 8))(v30, v31);
    sub_100007618(&v35);
  }
  else
  {
    sub_100038C8C((uint64_t)&v35, &qword_1000D1408);
    v32 = sub_10009919C((uint64_t)_swiftEmptyArrayStorage, (uint64_t)&type metadata for SportsMetricsKey);
  }
  v33 = sub_100094058(v32, v29);
  sub_100018E34();
  sub_100097FB0(v33, v4);
  sub_1000061E8();
  sub_10000A668();
}

void sub_1000943F0()
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
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[5];
  uint64_t v28;

  sub_10000A758();
  v1 = type metadata accessor for DispatchWorkItemFlags(0);
  v26 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  sub_10000A7D4();
  v4 = v3 - v2;
  v5 = type metadata accessor for DispatchQoS(0);
  v24 = *(_QWORD *)(v5 - 8);
  v25 = v5;
  __chkstk_darwin(v5);
  v6 = sub_10000A770();
  v7 = type metadata accessor for DispatchTime(v6);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v13 = (char *)&v23 - v12;
  v14 = sub_100018468(0, (unint64_t *)&qword_1000D05D8, OS_dispatch_queue_ptr);
  v15 = (void *)static OS_dispatch_queue.main.getter(v14);
  static DispatchTime.now()();
  + infix(_:_:)(v10, 2.0);
  v23 = *(void (**)(char *, uint64_t))(v8 + 8);
  v23(v10, v7);
  v16 = swift_allocObject(&unk_1000C98E8, 24, 7);
  swift_weakInit(v16 + 16);
  v27[4] = sub_100098EAC;
  v28 = v16;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 1107296256;
  v27[2] = sub_100074E8C;
  v27[3] = &unk_1000C9900;
  v17 = _Block_copy(v27);
  v18 = swift_release(v28);
  static DispatchQoS.unspecified.getter(v18);
  v27[0] = _swiftEmptyArrayStorage;
  sub_10000A378(&qword_1000D3A38, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  v20 = v19;
  v21 = sub_10000738C(&qword_1000D3A40);
  sub_10000A40C(&qword_1000D3A48, &qword_1000D3A40);
  dispatch thunk of SetAlgebra.init<A>(_:)(v27, v21, v22, v1, v20);
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v13, v0, v4, v17);
  _Block_release(v17);

  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v4, v1);
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v0, v25);
  v23(v13, v7);
  sub_10000A668();
}

unint64_t sub_10009465C(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000C31D0, v2);
  sub_1000185B4();
  if (v3 >= 5)
    return 5;
  else
    return v3;
}

uint64_t sub_1000946A0(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1000946DC + 4 * byte_1000A4FE0[a1]))(0x6172747369676572, 0xEC0000006E6F6974);
}

uint64_t sub_1000946DC()
{
  return 0x7473696765726E75;
}

uint64_t sub_100094700()
{
  return 0x6C6C416863746566;
}

uint64_t sub_100094718()
{
  return 0x61684364756F6C63;
}

uint64_t sub_100094738()
{
  return 0x4D7370416C6C7566;
}

void sub_10009475C(char *a1)
{
  sub_100055B94(*a1);
}

void sub_100094768()
{
  unsigned __int8 *v0;

  sub_100056588(*v0);
}

void sub_100094770(uint64_t a1)
{
  char *v1;

  sub_1000565DC(a1, *v1);
}

void sub_100094778(uint64_t a1)
{
  unsigned __int8 *v1;

  sub_100056D90(a1, *v1);
}

unint64_t sub_100094780@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_10009465C(*a1);
  *a2 = result;
  return result;
}

void sub_1000947AC(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t v3;

  *a1 = sub_1000946A0(*v1);
  a1[1] = v3;
  sub_100006200();
}

void sub_1000947D0()
{
  uint64_t v0;

  v0 = type metadata accessor for SportsPerformanceMeasurement(0);
  swift_allocObject(v0, *(unsigned int *)(v0 + 48), *(unsigned __int16 *)(v0 + 52));
  qword_1000DDB78 = (uint64_t)sub_100094808();
  sub_100006200();
}

_QWORD *sub_100094808()
{
  _QWORD *v0;
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
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  objc_class *v23;
  id v24;
  id v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  void (*v38)(char *, char *);
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  Swift::Int v49;
  uint64_t v50;
  uint64_t v51;
  _UNKNOWN **v52;
  Swift::Int v53;
  char *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  char *v65;
  _QWORD *v66;
  char *v67;
  void (*v68)(char *, uint64_t);
  uint64_t v69;
  char *v70;
  void (*v71)(char *, uint64_t);
  char *v72;
  double v73;
  char v74;
  double v75;
  double v76;
  double v77;
  char v78;
  double v79;
  double v80;
  char v81;
  double v82;
  char v83;
  double v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v88;
  uint64_t v89;
  void (*v90)(char *, uint64_t);
  char *v91;
  char *v92;
  char *v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  _QWORD v114[3];
  uint64_t v115;
  _UNKNOWN **v116;

  v106 = *v0;
  v103 = type metadata accessor for MetricsPipeline(0);
  v102 = *(_QWORD *)(v103 - 8);
  __chkstk_darwin(v103);
  v101 = (char *)&v88 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v99 = type metadata accessor for MetricsFieldExclusionRequest(0);
  v98 = *(_QWORD *)(v99 - 8);
  __chkstk_darwin(v99);
  v97 = (char *)&v88 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v100 = type metadata accessor for MetricsFieldsAggregator(0);
  v94 = *(_QWORD *)(v100 - 8);
  v3 = __chkstk_darwin(v100);
  v92 = (char *)&v88 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v95 = (char *)&v88 - v5;
  v105 = type metadata accessor for MetricsPipeline.Configuration(0);
  v96 = *(_QWORD *)(v105 - 8);
  v6 = __chkstk_darwin(v105);
  v91 = (char *)&v88 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v6);
  v93 = (char *)&v88 - v9;
  __chkstk_darwin(v8);
  v104 = (char *)&v88 - v10;
  v11 = sub_10000738C(&qword_1000D3A10);
  __chkstk_darwin(v11);
  v90 = (void (*)(char *, uint64_t))((char *)&v88 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = type metadata accessor for AMSMetricsIdentifierFieldsProvider(0);
  v111 = *(_QWORD *)(v13 - 8);
  v112 = v13;
  __chkstk_darwin(v13);
  v110 = (char *)&v88 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for Bag(0);
  v108 = *(_QWORD *)(v15 - 8);
  v109 = v15;
  v16 = __chkstk_darwin(v15);
  v18 = (char *)&v88 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v20 = (char *)&v88 - v19;
  v21 = OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_dataRepository;
  if (qword_1000CFA68 != -1)
    swift_once(&qword_1000CFA68, sub_10002A1D4);
  v22 = qword_1000DDA40;
  *(_QWORD *)((char *)v0 + v21) = qword_1000DDA40;
  v107 = OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_activityCapUtility;
  v23 = (objc_class *)type metadata accessor for ActivityAuthorization(0);
  v24 = objc_allocWithZone(v23);
  swift_retain(v22);
  v25 = objc_msgSend(v24, "init");
  v26 = sub_100043DEC();
  v28 = v27;
  v115 = (uint64_t)v23;
  v116 = &off_1000C5188;
  v114[0] = v25;
  v29 = type metadata accessor for ActivityCapUtility();
  v30 = (_QWORD *)swift_allocObject(v29, 72, 7);
  v31 = sub_10000AE58((uint64_t)v114, (uint64_t)v23);
  __chkstk_darwin(v31);
  v33 = (uint64_t *)((char *)&v88 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v34 + 16))(v33);
  v35 = *v33;
  v30[5] = v23;
  v30[6] = &off_1000C5188;
  v36 = v0;
  v30[2] = v35;
  v30[7] = v26;
  v30[8] = v28;
  sub_100007618(v114);
  *(_QWORD *)((char *)v0 + v107) = v30;
  v37 = (_QWORD *)((char *)v0 + OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_environmentDataCenter);
  *v37 = 0;
  v37[1] = 0;
  if (qword_1000CFA58 != -1)
    swift_once(&qword_1000CFA58, sub_100024D38);
  Bag.init(from:)(*(id *)(qword_1000DDA30 + 16));
  v89 = sub_10000738C(&qword_1000D3A18);
  v38 = *(void (**)(char *, char *))(v108 + 16);
  v39 = v109;
  v38(v18, v20);
  v107 = LowMemoryMetricsEventLinter.__allocating_init(defaultTopic:bag:rules:)(0xD000000000000012, 0x80000001000A56F0, v18, _swiftEmptyArrayStorage);
  v40 = objc_msgSend(objc_allocWithZone((Class)ACAccountStore), "init");
  v115 = sub_100018468(0, &qword_1000D3A20, ACAccountStore_ptr);
  v116 = (_UNKNOWN **)&protocol witness table for ACAccountStore;
  v114[0] = v40;
  v41 = (uint64_t)v90;
  ((void (*)(void (*)(char *, uint64_t), char *, uint64_t))v38)(v90, v20, v39);
  sub_10000964C(v41, 0, 1, v39);
  v42 = sub_10000738C(&qword_1000D2E50);
  v43 = swift_allocObject(v42, 40, 7);
  *(_OWORD *)(v43 + 16) = xmmword_1000A4FD0;
  sub_100018468(0, &qword_1000D3A28, AMSMetricsIdentifierKey_ptr);
  *(_QWORD *)(v43 + 32) = sub_10009517C(0x6449746E65696C63, 0xE800000000000000, 0);
  v113 = v43;
  specialized Array._endMutation()();
  v44 = v113;
  v45 = objc_msgSend((id)objc_opt_self(AMSProcessInfo), "currentProcess");
  static AMSMetricsIdentifierFieldsProvider.metricsResetInterval.getter();
  v46 = v110;
  AMSMetricsIdentifierFieldsProvider.init(accountProvider:process:bag:shouldMigrate:resetInterval:keys:activeITunesAccountRequired:)(v114, v45, v41, 0, v44, 0);
  v47 = type metadata accessor for AMSMetricsEventRecorder(0);
  v48 = v39;
  ((void (*)(char *, char *, uint64_t))v38)(v18, v20, v39);
  v49 = sub_10004D680((uint64_t)&off_1000C2740);
  v50 = AMSMetricsEventRecorder.__allocating_init(bag:defaultTopic:anonymousTopics:)(v18, 0xD000000000000012, 0x80000001000A56F0, v49);
  v51 = OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_eventRecorder;
  *(_QWORD *)((char *)v36 + OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_eventRecorder) = v50;
  ((void (*)(char *, char *, uint64_t))v38)(v18, v20, v48);
  v115 = v89;
  sub_10000A40C(&qword_1000D3A30, &qword_1000D3A18);
  v116 = v52;
  v114[0] = v107;
  swift_retain(v107);
  v53 = sub_10004D680((uint64_t)&off_1000C2770);
  v54 = v91;
  MetricsPipeline.Configuration.init(bag:linter:anonymousTopics:)(v18, v114, v53);
  v55 = *(_QWORD *)((char *)v36 + v51);
  v115 = v47;
  v116 = (_UNKNOWN **)&protocol witness table for AMSMetricsEventRecorder;
  v114[0] = v55;
  swift_retain(v55);
  v56 = v93;
  MetricsPipeline.Configuration.withRecorder(_:)(v114);
  v57 = v96;
  v90 = *(void (**)(char *, uint64_t))(v96 + 8);
  v58 = v54;
  v59 = v105;
  v90(v58, v105);
  v60 = sub_100007618(v114);
  v61 = v92;
  MetricsFieldsAggregator.init()(v60);
  v62 = v112;
  v115 = v112;
  v116 = (_UNKNOWN **)&protocol witness table for AMSMetricsIdentifierFieldsProvider;
  v63 = sub_100023784(v114);
  v64 = (*(uint64_t (**)(_QWORD *, char *, uint64_t))(v111 + 16))(v63, v46, v62);
  v65 = v97;
  static MetricsFieldExclusionRequest.amsMetricsID.getter(v64);
  v66 = v36;
  v67 = v95;
  MetricsFieldsAggregator.addingOptOutProvider(_:forRequest:)(v114, v65);
  (*(void (**)(char *, uint64_t))(v98 + 8))(v65, v99);
  v68 = *(void (**)(char *, uint64_t))(v94 + 8);
  v69 = v100;
  v68(v61, v100);
  sub_100007618(v114);
  v70 = v104;
  MetricsPipeline.Configuration.withAggregator(_:)(v67);
  v68(v67, v69);
  v71 = v90;
  v90(v56, v59);
  (*(void (**)(char *, char *, uint64_t))(v57 + 16))(v56, v70, v59);
  v72 = v101;
  MetricsPipeline.init(from:)(v56);
  (*(void (**)(uint64_t, char *, uint64_t))(v102 + 32))((uint64_t)v66 + OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_metricsPipeline, v72, v103);
  v73 = COERCE_DOUBLE(sub_1000951E4((uint64_t)v20, 0xD000000000000017, (void *)0x80000001000A7F30));
  v75 = 1.0;
  if ((v74 & 1) != 0)
    v76 = 1.0;
  else
    v76 = v73;
  v77 = COERCE_DOUBLE(sub_1000951E4((uint64_t)v20, 0x446E6F6973736573, (void *)0xEF6E6F6974617275));
  if ((v78 & 1) != 0)
    v79 = 60.0;
  else
    v79 = v77 / 1000.0;
  v80 = COERCE_DOUBLE(sub_1000951E4((uint64_t)v20, 0xD000000000000028, (void *)0x80000001000A7F50));
  if ((v81 & 1) == 0)
    v75 = v80;
  v82 = COERCE_DOUBLE(sub_1000951E4((uint64_t)v20, 0xD000000000000020, (void *)0x80000001000A7F80));
  if ((v83 & 1) != 0)
    v84 = 60.0;
  else
    v84 = v82 / 1000.0;
  v85 = (uint64_t)v66 + OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_loadUrlLottery;
  *(double *)v85 = v76;
  *(double *)(v85 + 8) = v79;
  *(_QWORD *)(v85 + 16) = 0x6C725564616F6CLL;
  *(_QWORD *)(v85 + 24) = 0xE700000000000000;
  swift_release(v107);
  v71(v70, v59);
  (*(void (**)(char *, uint64_t))(v111 + 8))(v110, v112);
  (*(void (**)(char *, uint64_t))(v108 + 8))(v20, v109);
  v86 = (uint64_t)v66 + OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_notificationLottery;
  *(double *)v86 = v75;
  *(double *)(v86 + 8) = v84;
  *(_QWORD *)(v86 + 16) = 0xD000000000000011;
  *(_QWORD *)(v86 + 24) = 0x80000001000A7EE0;
  return v66;
}

id sub_10009517C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  NSString v6;
  id v7;

  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v7 = objc_msgSend((id)swift_getObjCClassFromMetadata(v3), "keyWithName:crossDeviceSync:", v6, a3 & 1);

  return v7;
}

id sub_1000951E4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  Swift::String v6;
  NSString v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  int v13;
  id v14;
  uint64_t v15;
  void *v16;
  Swift::String v17;
  unint64_t v18;
  NSString v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  id v28;
  unint64_t v29;

  v5 = (void *)Bag.amsBag.getter();
  _StringGuts.grow(_:)(41);
  swift_bridgeObjectRelease(0xE000000000000000);
  v29 = 0x80000001000A7FB0;
  v6._countAndFlagsBits = a2;
  v6._object = a3;
  String.append(_:)(v6);
  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(0x80000001000A7FB0);
  v8 = objc_msgSend(v5, "doubleForKey:", v7);

  swift_unknownObjectRelease(v5);
  v28 = 0;
  v9 = objc_msgSend(v8, "valueWithError:", &v28);

  v10 = v28;
  if (v9)
  {
    v28 = 0;
    LOBYTE(v29) = 1;
    v11 = v10;
    static Double._conditionallyBridgeFromObjectiveC(_:result:)(v9, &v28);

    v12 = v28;
    v13 = v29;
  }
  else
  {
    v14 = v28;
    v15 = _convertNSErrorToError(_:)(v10);

    swift_willThrow();
    swift_errorRelease(v15);
    v12 = 0;
    v13 = 1;
  }
  v16 = (void *)Bag.amsBag.getter();
  v28 = 0;
  v29 = 0xE000000000000000;
  _StringGuts.grow(_:)(22);
  swift_bridgeObjectRelease(v29);
  v28 = (id)0xD000000000000014;
  v29 = 0x80000001000A7FE0;
  v17._countAndFlagsBits = a2;
  v17._object = a3;
  String.append(_:)(v17);
  v18 = v29;
  v19 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v18);
  v20 = objc_msgSend(v16, "doubleForKey:", v19);

  swift_unknownObjectRelease(v16);
  v28 = 0;
  v21 = objc_msgSend(v20, "valueWithError:", &v28);

  v22 = v28;
  if (v21)
  {
    v28 = 0;
    LOBYTE(v29) = 1;
    v23 = v22;
    static Double._conditionallyBridgeFromObjectiveC(_:result:)(v21, &v28);

    v24 = v28;
  }
  else
  {
    v25 = v28;
    v26 = _convertNSErrorToError(_:)(v22);

    swift_willThrow();
    swift_errorRelease(v26);
    v24 = 0;
  }
  if (v13)
    return v24;
  else
    return v12;
}

void sub_1000954A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  char v28;
  char v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  void (*v37)(char *, uint64_t);
  uint64_t *v38;
  _QWORD **v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  char v44;
  uint64_t v45;
  void *v46;
  uint64_t i;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  id v51;
  void *v53;
  void *v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  id v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t j;
  id v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  _QWORD *v76;
  _QWORD *v77;
  _QWORD *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  _QWORD *v86;
  _QWORD *v87;
  _QWORD *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  unint64_t v101;
  _QWORD *v102;
  uint64_t v103;
  id v104;
  _QWORD v105[2];
  _QWORD v106[3];
  void *v107;
  _QWORD *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;

  v2 = v1;
  v4 = type metadata accessor for Sport(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v97 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v97 - v9;
  v11 = *(_QWORD *)a1;
  if (*(_QWORD *)(*(_QWORD *)a1 + 16))
  {
    v12 = sub_1000150A4(2);
    if ((v13 & 1) != 0)
    {
      sub_100038C60(*(_QWORD *)(v11 + 56) + 32 * v12, (uint64_t)v106, (uint64_t *)&unk_1000CFF70);
      sub_100038CB4((uint64_t)v106, (uint64_t)&v108, (uint64_t *)&unk_1000CFF70);
      if (!v111)
      {
        sub_100038C8C((uint64_t)&v108, (uint64_t *)&unk_1000CFF70);
        return;
      }
      if ((swift_dynamicCast(v105, &v108, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
      {
        v14 = v105[0];
        v15 = v105[1];
        v16 = *(_QWORD **)(v2 + OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_dataRepository);
        v17 = *(unsigned __int8 *)(a1 + 9);
        v18 = v16[5];
        v19 = v16[6];
        sub_1000073CC(v16 + 2, v18);
        v20 = (void *)dispatch thunk of PersistentStorable.retrieveEventSubscription(canonicalId:isConventionalOrUnified:)(v14, v15, v17, v18, v19);
        v21 = swift_bridgeObjectRelease(v15);
        if (v20)
        {
          v22 = SportingEventSubscription.qosRegistrationId.getter(v21);
          if (v23)
          {
            v111 = (uint64_t)&type metadata for String;
            v108 = (_QWORD *)v22;
            v109 = v23;
          }
          else
          {
            v108 = 0;
            v109 = 0;
            v110 = 0;
            v111 = 1;
          }
          sub_1000925A8((uint64_t)&v108, 20);
          v24 = (void *)((uint64_t (*)(void))SportingEventSubscription.sportingEventDetails.getter)();
          v25 = (void *)dispatch thunk of SportingEvent.coverage.getter();

          if (v25
            && (v26 = (void *)dispatch thunk of SportingEventCoverage.ingestion.getter(), v25, v26)
            && (v27 = COERCE_DOUBLE(dispatch thunk of SportingEventCoverageIngestion.last.getter()),
                v29 = v28,
                v26,
                (v29 & 1) == 0))
          {
            v30 = sub_100080BFC(v27);
            v107 = &type metadata for UInt64;
            v106[0] = v30;
            sub_100038CB4((uint64_t)v106, (uint64_t)&v108, (uint64_t *)&unk_1000CFF70);
          }
          else
          {
            v111 = (uint64_t)&type metadata for Int;
            v108 = 0;
          }
          sub_1000925A8((uint64_t)&v108, 14);
          v31 = SportingEventSubscription.applicationType.getter();
          if (v32)
          {
            v111 = (uint64_t)&type metadata for String;
            v108 = (_QWORD *)v31;
            v109 = v32;
          }
          else
          {
            v108 = 0;
            v109 = 0;
            v110 = 0;
            v111 = 1;
          }
          sub_1000925A8((uint64_t)&v108, 21);
          v33 = SportingEventSubscription.clientApp.getter();
          v111 = (uint64_t)&type metadata for String;
          v108 = (_QWORD *)v33;
          v109 = v34;
          sub_1000925A8((uint64_t)&v108, 1);
          v35 = SportingEventSubscription.sport.getter();
          Sport.init(rawValue:)(v35);
          (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v8, enum case for Sport.baseball(_:), v4);
          v36 = sub_1000562FC((uint64_t)v10, (uint64_t)v8);
          v37 = *(void (**)(char *, uint64_t))(v5 + 8);
          v37(v8, v4);
          v37(v10, v4);
          if ((v36 & 1) == 0)
            goto LABEL_31;
          sub_100075518(44, *(_QWORD *)a1, v106);
          if (v107 == (void *)1)
          {
            v38 = &qword_1000D39F8;
            v39 = (_QWORD **)v106;
LABEL_30:
            sub_100038C8C((uint64_t)v39, v38);
            goto LABEL_31;
          }
          sub_100038CB4((uint64_t)v106, (uint64_t)&v108, (uint64_t *)&unk_1000CFF70);
          if (!v111)
          {
            v38 = (uint64_t *)&unk_1000CFF70;
            v39 = &v108;
            goto LABEL_30;
          }
          if ((swift_dynamicCast(v105, &v108, (char *)&type metadata for Any + 8, &type metadata for EventType.EventName, 6) & 1) != 0)
          {
            v40 = sub_1000946A0(v105[0]);
            if (v40 == 0x4D7370416C6C7566 && v41 == 0xEE00656761737365)
            {
              v45 = swift_bridgeObjectRelease(0xEE00656761737365);
              goto LABEL_34;
            }
            v43 = v41;
            v44 = _stringCompareWithSmolCheck(_:_:expecting:)(v40, v41, 0x4D7370416C6C7566, 0xEE00656761737365, 0);
            v45 = swift_bridgeObjectRelease(v43);
            if ((v44 & 1) != 0)
            {
LABEL_34:
              v46 = (void *)SportingEventSubscription.sportingEventDetails.getter(v45);
              i = dispatch thunk of SportingEvent.competitors.getter();

              if ((unint64_t)i >> 62)
                goto LABEL_98;
              v48 = *(_QWORD *)((i & 0xFFFFFFFFFFFFF8) + 0x10);
              swift_bridgeObjectRetain(i);
LABEL_36:
              v49 = _swiftEmptyArrayStorage;
              if (!v48)
              {
LABEL_90:
                swift_bridgeObjectRelease_n(i, 2);
                v108 = v49;
                v89 = sub_10000738C(&qword_1000D0440);
                sub_10000A40C((unint64_t *)&qword_1000D0448, &qword_1000D0440);
                v91 = BidirectionalCollection<>.joined(separator:)(8236, 0xE200000000000000, v89, v90);
                v93 = v92;
                swift_bridgeObjectRelease(v49);
                v94 = HIBYTE(v93) & 0xF;
                if ((v93 & 0x2000000000000000) == 0)
                  v94 = v91 & 0xFFFFFFFFFFFFLL;
                if (!v94)
                {

                  swift_bridgeObjectRelease(v93);
                  return;
                }
                v95 = sub_10002170C(v91, (void *)v93);
                swift_bridgeObjectRelease(v93);
                sub_10009707C(v95, (uint64_t)sub_100097050, 0, (_QWORD *)a1);
                goto LABEL_31;
              }
              v50 = 0;
              v100 = v20;
              v101 = i & 0xC000000000000001;
              v97 = i + 32;
              v98 = i;
              v99 = v48;
              while (1)
              {
                if (v101)
                  v51 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v50, i);
                else
                  v51 = *(id *)(v97 + 8 * v50);
                if (__OFADD__(v50++, 1))
                {
                  __break(1u);
LABEL_96:
                  __break(1u);
LABEL_97:
                  __break(1u);
LABEL_98:
                  if (i < 0)
                    v96 = i;
                  else
                    v96 = i & 0xFFFFFFFFFFFFFF8;
                  swift_bridgeObjectRetain(i);
                  v48 = _CocoaArrayWrapper.endIndex.getter(v96);
                  goto LABEL_36;
                }
                v53 = v51;
                v54 = (void *)SportingEventCompetitorContainer.competitor.getter();
                v55 = dispatch thunk of SportingEventCompetitor.members.getter();

                if (v55)
                  break;

                v20 = v100;
LABEL_89:
                if (v50 == v48)
                  goto LABEL_90;
              }
              v103 = v50;
              v104 = v53;
              v56 = _swiftEmptyArrayStorage;
              v108 = _swiftEmptyArrayStorage;
              if ((unint64_t)v55 >> 62)
              {
                if (v55 >= 0)
                  v67 = v55 & 0xFFFFFFFFFFFFFF8;
                else
                  v67 = v55;
                swift_bridgeObjectRetain(v55);
                v57 = _CocoaArrayWrapper.endIndex.getter(v67);
                swift_bridgeObjectRelease(v55);
                if (v57)
                  goto LABEL_45;
              }
              else
              {
                v57 = *(_QWORD *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10);
                if (v57)
                {
LABEL_45:
                  if (v57 < 1)
                    goto LABEL_96;
                  for (i = 0; i != v57; ++i)
                  {
                    if ((v55 & 0xC000000000000001) != 0)
                      v58 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v55);
                    else
                      v58 = *(id *)(v55 + 8 * i + 32);
                    v59 = v58;
                    v60 = dispatch thunk of SportingEventParticipant.images.getter();
                    if (!v60)
                      goto LABEL_54;
                    v61 = v60;
                    if ((unint64_t)v60 >> 62)
                    {
                      if (v60 >= 0)
                        v60 &= 0xFFFFFFFFFFFFFF8uLL;
                      v62 = _CocoaArrayWrapper.endIndex.getter(v60);
                    }
                    else
                    {
                      v62 = *(_QWORD *)((v60 & 0xFFFFFFFFFFFFFF8) + 0x10);
                    }
                    v63 = swift_bridgeObjectRelease(v61);
                    if (!v62)
                    {
                      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v63);
                      v64 = v108[2];
                      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v64);
                      v65 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v64, v59);
                      specialized ContiguousArray._endMutation()(v65);
                    }
                    else
                    {
LABEL_54:

                    }
                  }
                  swift_bridgeObjectRelease(v55);
                  v66 = (unint64_t)v108;
                  v56 = _swiftEmptyArrayStorage;
LABEL_67:
                  v102 = v49;
                  if ((v66 & 0x8000000000000000) != 0 || (v66 & 0x4000000000000000) != 0)
                  {
                    v79 = swift_retain(v66);
                    v68 = _CocoaArrayWrapper.endIndex.getter(v79);
                    if (v68)
                      goto LABEL_70;
                  }
                  else
                  {
                    v68 = *(_QWORD *)(v66 + 16);
                    swift_retain(v66);
                    if (v68)
                    {
LABEL_70:
                      if (v68 < 1)
                        goto LABEL_97;
                      for (j = 0; j != v68; ++j)
                      {
                        if ((v66 & 0xC000000000000001) != 0)
                          v70 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(j, v66);
                        else
                          v70 = *(id *)(v66 + 8 * j + 32);
                        v71 = v70;
                        v72 = dispatch thunk of SportingEventParticipant.displayName.getter();
                        v74 = v73;

                        if (v74)
                        {
                          if ((swift_isUniquelyReferenced_nonNull_native(v56) & 1) == 0)
                          {
                            sub_100013494();
                            v56 = v77;
                          }
                          v75 = v56[2];
                          if (v75 >= v56[3] >> 1)
                          {
                            sub_100013494();
                            v56 = v78;
                          }
                          v56[2] = v75 + 1;
                          v76 = &v56[2 * v75];
                          v76[4] = v72;
                          v76[5] = v74;
                        }
                      }
                    }
                  }
                  swift_release_n(v66, 2);
                  v108 = v56;
                  v80 = sub_10000738C(&qword_1000D0440);
                  sub_10000A40C((unint64_t *)&qword_1000D0448, &qword_1000D0440);
                  v82 = BidirectionalCollection<>.joined(separator:)(8236, 0xE200000000000000, v80, v81);
                  v84 = v83;

                  swift_bridgeObjectRelease(v56);
                  v49 = v102;
                  if ((swift_isUniquelyReferenced_nonNull_native(v102) & 1) == 0)
                  {
                    sub_100013494();
                    v49 = v87;
                  }
                  v20 = v100;
                  i = v98;
                  v50 = v103;
                  v85 = v49[2];
                  if (v85 >= v49[3] >> 1)
                  {
                    sub_100013494();
                    v49 = v88;
                  }
                  v49[2] = v85 + 1;
                  v86 = &v49[2 * v85];
                  v86[4] = v82;
                  v86[5] = v84;
                  v48 = v99;
                  goto LABEL_89;
                }
              }
              swift_bridgeObjectRelease(v55);
              v66 = (unint64_t)_swiftEmptyArrayStorage;
              goto LABEL_67;
            }
          }
LABEL_31:

        }
      }
    }
  }
}

uint64_t sub_100095D54(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v5;
  char v6;
  char v7;
  _QWORD v9[4];

  v3 = v2;
  if ((a2 & 1) != 0)
    return sub_10009605C(*(_QWORD *)(v2 + OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_notificationLottery + 16), *(_QWORD *)(v2 + OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_notificationLottery + 24), *(double *)(v2 + OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_notificationLottery), *(double *)(v2 + OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_notificationLottery + 8));
  if (*(_QWORD *)(a1 + 16) && (v5 = sub_1000150A4(4), (v6 & 1) != 0))
  {
    sub_100038C60(*(_QWORD *)(a1 + 56) + 32 * v5, (uint64_t)v9, (uint64_t *)&unk_1000CFF70);
    sub_100038C8C((uint64_t)v9, &qword_1000D39F8);
    v7 = sub_10009605C(*(_QWORD *)(v3 + OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_loadUrlLottery + 16), *(_QWORD *)(v3 + OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_loadUrlLottery + 24), *(double *)(v3 + OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_loadUrlLottery), *(double *)(v3 + OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_loadUrlLottery + 8));
  }
  else
  {
    memset(v9, 0, 24);
    v9[3] = 1;
    sub_100038C8C((uint64_t)v9, &qword_1000D39F8);
    v7 = 0;
  }
  return v7 & 1;
}

void sub_100095E20(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t *v6;
  uint64_t v7;
  NSObject *oslog;
  uint64_t v9;
  uint64_t v10;

  if (qword_1000CFAB8 != -1)
    swift_once(&qword_1000CFAB8, sub_10006CC6C);
  v2 = type metadata accessor for Logger(0);
  sub_1000096EC(v2, (uint64_t)qword_1000DDAA0);
  swift_errorRetain(a1);
  v3 = swift_errorRetain(a1);
  oslog = Logger.logObject.getter(v3);
  v4 = static os_log_type_t.debug.getter(oslog);
  if (os_log_type_enabled(oslog, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(12, -1);
    v6 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v5 = 138412290;
    swift_errorRetain(a1);
    v7 = _swift_stdlib_bridgeErrorToNSError(a1);
    v9 = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v9, &v10, v5 + 4, v5 + 12);
    *v6 = v7;
    swift_errorRelease(a1);
    swift_errorRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, oslog, v4, "SportsPerformanceMeasurement: error: %@", v5, 0xCu);
    sub_10000738C((uint64_t *)&unk_1000D16C0);
    swift_arrayDestroy(v6, 1);
    swift_slowDealloc(v6, -1, -1);
    swift_slowDealloc(v5, -1, -1);

  }
  else
  {
    swift_errorRelease(a1);
    swift_errorRelease(a1);

  }
}

uint64_t sub_100095FE0(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v7, 0, 0);
  result = swift_weakLoadStrong(v1);
  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)(result + OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_eventRecorder);
    swift_retain(v4);
    v5 = swift_release(v3);
    v6 = AMSMetricsEventRecorder.flush()(v5);
    swift_release(v4);
    return swift_release(v6);
  }
  return result;
}

uint64_t sub_10009605C(uint64_t a1, uint64_t a2, double a3, double a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  double v26;
  uint64_t v28;

  v8 = sub_10000738C(&qword_1000D0570);
  __chkstk_darwin(v8);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v13 = (char *)&v28 - v12;
  v14 = type metadata accessor for Date(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v20 = (char *)&v28 - v19;
  if (a3 <= 0.0)
    return 0;
  if (a3 >= 1.0)
    return 1;
  sub_1000969CC(a1, a2, (uint64_t)v13, a4);
  if (sub_100009658((uint64_t)v13, 1, v14) != 1)
  {
    v22 = (*(uint64_t (**)(char *, char *, uint64_t))(v15 + 32))(v20, v13, v14);
    Date.init()(v22);
    v23 = static Date.< infix(_:_:)(v17, v20);
    v24 = *(void (**)(char *, uint64_t))(v15 + 8);
    v24(v17, v14);
    v24(v20, v14);
    if ((v23 & 1) == 0)
      goto LABEL_8;
    return 1;
  }
  sub_100038C8C((uint64_t)v13, &qword_1000D0570);
LABEL_8:
  sub_1000989D8(0.0, 1.0);
  v21 = 0;
  if ((*(_QWORD *)&v26 & 0x7FFFFFFFFFFFFFFFLL) != 0 && v26 <= a3)
  {
    Date.init()(v25);
    v21 = 1;
    sub_10000964C((uint64_t)v10, 0, 1, v14);
    sub_100096828((uint64_t)v10, a1, a2);
  }
  return v21;
}

void sub_100096264()
{
  uint64_t v0;
  uint64_t v1;

  v1 = type metadata accessor for MetricsPipeline(0);
  sub_100022EEC(v1);
  sub_1000991E8(OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_loadUrlLottery);
  sub_1000991E8(OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_notificationLottery);
  sub_10004000C(OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_dataRepository);
  sub_10004000C(OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_eventRecorder);
  sub_10004000C(OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_activityCapUtility);
  sub_100099140(v0 + OBJC_IVAR____TtC7sportsd28SportsPerformanceMeasurement_environmentDataCenter);
  sub_100006200();
}

uint64_t sub_1000962E0()
{
  uint64_t v0;

  sub_100096264();
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_100096304()
{
  uint64_t v0;
  uint64_t inited;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v9[152];

  v0 = sub_10000738C(&qword_1000D0848);
  inited = swift_initStackObject(v0, v9);
  *(_OWORD *)(inited + 16) = xmmword_1000A0600;
  *(_BYTE *)(inited + 32) = 22;
  v2 = CloudChannelError.errorCode.getter();
  *(_QWORD *)(inited + 64) = &type metadata for Int;
  *(_QWORD *)(inited + 40) = v2;
  *(_BYTE *)(inited + 72) = 23;
  v3 = static CloudChannelError.errorDomain.getter();
  *(_QWORD *)(inited + 104) = &type metadata for String;
  *(_QWORD *)(inited + 80) = v3;
  *(_QWORD *)(inited + 88) = v4;
  *(_BYTE *)(inited + 112) = 24;
  v5 = CloudChannelError.errorUserInfo.getter();
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(NSLocalizedDescriptionKey);
  sub_1000754DC(v6, v7, v5, (_OWORD *)(inited + 120));
  sub_100018DAC();
  sub_1000061E8();
  sub_10000738C((uint64_t *)&unk_1000CFF70);
  sub_100099180();
  return Dictionary.init(dictionaryLiteral:)(inited, &type metadata for SportsMetricsKey);
}

uint64_t sub_1000963F4()
{
  return sub_100093F60();
}

uint64_t sub_1000963FC()
{
  return type metadata accessor for SportsPerformanceMeasurement(0);
}

uint64_t type metadata accessor for SportsPerformanceMeasurement(uint64_t a1)
{
  uint64_t result;

  result = qword_1000D3930;
  if (!qword_1000D3930)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SportsPerformanceMeasurement);
  return result;
}

uint64_t sub_10009643C(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[7];

  result = type metadata accessor for MetricsPipeline(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = " ";
    v4[2] = " ";
    v4[3] = (char *)&value witness table for Builtin.NativeObject + 64;
    v4[4] = (char *)&value witness table for Builtin.NativeObject + 64;
    v4[5] = (char *)&value witness table for Builtin.NativeObject + 64;
    v4[6] = &unk_1000A5088;
    result = swift_updateClassMetadata2(a1, 256, 7, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t destroy for MetricsSamplingLottery(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 24));
}

uint64_t initializeWithCopy for MetricsSamplingLottery(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  swift_bridgeObjectRetain(v3);
  return a1;
}

_QWORD *assignWithCopy for MetricsSamplingLottery(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  v3 = a2[3];
  v4 = a1[3];
  a1[3] = v3;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t assignWithTake for MetricsSamplingLottery(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  v4 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for MetricsSamplingLottery(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 24);
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

uint64_t storeEnumTagSinglePayload for MetricsSamplingLottery(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MetricsSamplingLottery()
{
  return &type metadata for MetricsSamplingLottery;
}

uint64_t sub_100096624(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[0] = a1;
  v8[1] = a2;
  v6 = a3;
  v7 = a4;
  swift_bridgeObjectRetain(a4);
  v6 = String.init<A>(_:)(&v6, &type metadata for String, &protocol witness table for String, &protocol witness table for String);
  v7 = v4;
  String.append<A>(contentsOf:)(v8, &type metadata for String, &protocol witness table for String);
  return v6;
}

uint64_t sub_1000966A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSString v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  double v14;
  _OWORD v15[2];
  _BYTE v16[24];
  uint64_t v17;

  v6 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "standardUserDefaults");
  swift_bridgeObjectRetain(a2);
  sub_100096624(a1, a2, 0xD000000000000028, 0x80000001000A7F00);
  v8 = v7;
  swift_bridgeObjectRelease(a2);
  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v8);
  v10 = objc_msgSend(v6, "objectForKey:", v9);

  if (v10)
  {
    _bridgeAnyObjectToAny(_:)(v10);
    swift_unknownObjectRelease(v10);
  }
  else
  {
    memset(v15, 0, sizeof(v15));
  }
  sub_100038CB4((uint64_t)v15, (uint64_t)v16, (uint64_t *)&unk_1000CFF70);
  if (!v17)
  {
    sub_100038C8C((uint64_t)v16, (uint64_t *)&unk_1000CFF70);
    goto LABEL_8;
  }
  if ((swift_dynamicCast(&v14, v16, (char *)&type metadata for Any + 8, &type metadata for Double, 6) & 1) == 0)
  {
LABEL_8:
    v11 = 1;
    goto LABEL_9;
  }
  Date.init(timeIntervalSinceReferenceDate:)(v14);
  v11 = 0;
LABEL_9:
  v12 = type metadata accessor for Date(0);
  return sub_10000964C(a3, v11, 1, v12);
}

void sub_100096828(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSString v14;
  uint64_t v15;
  double v16;

  v6 = sub_10000738C(&qword_1000D0570);
  __chkstk_darwin(v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "standardUserDefaults");
  sub_100038C60(a1, (uint64_t)v8, &qword_1000D0570);
  v10 = type metadata accessor for Date(0);
  if (sub_100009658((uint64_t)v8, 1, v10) == 1)
  {
    sub_100038C8C((uint64_t)v8, &qword_1000D0570);
    v11 = 0;
  }
  else
  {
    v16 = Date.timeIntervalSinceReferenceDate.getter();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v8, v10);
    v11 = _bridgeAnythingToObjectiveC<A>(_:)(&v16, &type metadata for Double);
  }
  swift_bridgeObjectRetain(a3);
  sub_100096624(a2, a3, 0xD000000000000028, 0x80000001000A7F00);
  v13 = v12;
  swift_bridgeObjectRelease(a3);
  v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v13);
  objc_msgSend(v9, "setObject:forKey:", v11, v14);

  swift_unknownObjectRelease(v11);
  sub_100038C8C(a1, &qword_1000D0570);
}

uint64_t sub_1000969CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D1>)
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
  uint64_t v18;

  v8 = sub_10000738C(&qword_1000D0570);
  __chkstk_darwin(v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Date(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000966A0(a1, a2, (uint64_t)v10);
  if (sub_100009658((uint64_t)v10, 1, v11) == 1)
  {
    sub_100038C8C((uint64_t)v10, &qword_1000D0570);
    v15 = 1;
  }
  else
  {
    v16 = (*(uint64_t (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
    Date.addingTimeInterval(_:)(v16, a4);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    v15 = 0;
  }
  return sub_10000964C(a3, v15, 1, v11);
}

uint64_t sub_100096B1C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  Swift::Int v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v3 = v2;
  v6 = *v3;
  swift_bridgeObjectRetain(*v3);
  v7 = sub_1000150A4(a1);
  LOBYTE(a1) = v8;
  result = swift_bridgeObjectRelease(v6);
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v16 = *v3;
    v11 = *v3;
    *v3 = 0x8000000000000000;
    v12 = *(_QWORD *)(v11 + 24);
    sub_10000738C(&qword_1000D16F0);
    _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v12);
    sub_100038CB4(*(_QWORD *)(v16 + 56) + 32 * v7, (uint64_t)a2, (uint64_t *)&unk_1000CFF70);
    v13 = sub_10000738C((uint64_t *)&unk_1000CFF70);
    v14 = sub_100021804();
    _NativeDictionary._delete(at:)(v7, v16, &type metadata for SportsMetricsKey, v13, v14);
    v15 = *v3;
    *v3 = v16;
    return swift_bridgeObjectRelease(v15);
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
    a2[3] = 1;
  }
  return result;
}

uint64_t sub_100096C2C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  unint64_t v6;
  char v7;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  Swift::Int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v3 = v2;
  sub_10001896C();
  v6 = sub_100015050(a1, a2);
  LOBYTE(a2) = v7;
  sub_100018DAC();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  v15 = *v3;
  v9 = *v3;
  *v3 = 0x8000000000000000;
  v10 = *(_QWORD *)(v9 + 24);
  sub_10000738C(&qword_1000D3A68);
  _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v10);
  sub_100099140(*(_QWORD *)(v15 + 48) + 16 * v6);
  v11 = *(_QWORD *)(*(_QWORD *)(v15 + 56) + 8 * v6);
  v12 = sub_10000738C(&qword_1000D1A10);
  _NativeDictionary._delete(at:)(v6, v15, &type metadata for String, v12, &protocol witness table for String);
  v13 = *v3;
  *v3 = v15;
  swift_bridgeObjectRelease(v13);
  return v11;
}

uint64_t sub_100096D2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  unint64_t v9;
  char v10;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  Swift::Int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;

  v4 = v3;
  v8 = *v4;
  swift_bridgeObjectRetain(*v4);
  v9 = sub_100015050(a1, a2);
  LOBYTE(a2) = v10;
  swift_bridgeObjectRelease(v8);
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
    v19 = *v4;
    v12 = *v4;
    *v4 = 0x8000000000000000;
    v13 = *(_QWORD *)(v12 + 24);
    sub_10000738C(&qword_1000D3A60);
    _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v13);
    sub_100099140(*(_QWORD *)(v19 + 48) + 16 * v9);
    v14 = *(_QWORD *)(v19 + 56);
    v15 = type metadata accessor for DatedSubscribers(0);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(a3, v14 + *(_QWORD *)(*(_QWORD *)(v15 - 8) + 72) * v9, v15);
    _NativeDictionary._delete(at:)(v9, v19, &type metadata for String, v15, &protocol witness table for String);
    v16 = *v4;
    *v4 = v19;
    swift_bridgeObjectRelease(v16);
    return sub_10000964C(a3, 0, 1, v15);
  }
  else
  {
    v18 = type metadata accessor for DatedSubscribers(0);
    return sub_10000964C(a3, 1, 1, v18);
  }
}

uint64_t sub_100096E70(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v8;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
  v8 = *v2;
  *v2 = 0x8000000000000000;
  sub_100097AE8(a1, a2, isUniquelyReferenced_nonNull_native);
  v6 = *v2;
  *v2 = v8;
  return swift_bridgeObjectRelease(v6);
}

uint64_t sub_100096EDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v10;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  v10 = *v3;
  *v3 = 0x8000000000000000;
  sub_100097BE0(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  v8 = *v3;
  *v3 = v10;
  return swift_bridgeObjectRelease(v8);
}

uint64_t sub_100096F58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v10;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  v10 = *v3;
  *v3 = 0x8000000000000000;
  sub_100097CF4(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  v8 = *v3;
  *v3 = v10;
  return swift_bridgeObjectRelease(v8);
}

uint64_t sub_100096FD4(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *a1 = a4;
  a1[1] = a5;
  swift_bridgeObjectRetain(a3);
  sub_100018E34();
  return a2;
}

uint64_t sub_100097018(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100038C60(a3, a1, (uint64_t *)&unk_1000CFF70);
  return a2;
}

void sub_100097050(unsigned __int8 *a1@<X0>, _BYTE *a2@<X8>)
{
  *a2 = sub_100097018((uint64_t)(a2 + 8), *a1, (uint64_t)(a1 + 8));
  sub_100006200();
}

uint64_t sub_10009707C(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  char isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v11;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*a4);
  v11 = *a4;
  *a4 = 0x8000000000000000;
  sub_100097104(a1, a2, a3, isUniquelyReferenced_nonNull_native, (uint64_t)&v11);
  v9 = *a4;
  *a4 = v11;
  return swift_bridgeObjectRelease(v9);
}

uint64_t sub_100097104(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t result;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BYTE v47[32];
  _BYTE v48[40];
  uint64_t v49;
  uint64_t v50;
  uint64_t v51[8];

  v8 = a1;
  sub_100098AE0(a1, a2, a3, v51);
  sub_10000A834();
  v9 = swift_retain(a3);
  sub_1000991C0(v9, v10, v11, v12, v13, v14, v15, v16, v39, a3, v8, v43, v44, v45, v46);
  if (v50 == 1)
  {
LABEL_14:
    swift_release(v41);
    swift_bridgeObjectRelease(v42);
    sub_1000180CC(v51[0]);
    return swift_release(v51[6]);
  }
  while (1)
  {
    v17 = v48[32];
    sub_100038CB4((uint64_t)&v49, (uint64_t)v48, (uint64_t *)&unk_1000CFF70);
    v18 = sub_1000991A8();
    sub_100099148();
    v22 = v20 + v21;
    if (__OFADD__(v20, v21))
      break;
    v23 = v19;
    if (*(_QWORD *)(v8 + 24) >= v22)
    {
      if ((a4 & 1) != 0)
      {
        if ((v19 & 1) != 0)
          goto LABEL_9;
      }
      else
      {
        sub_10000738C(&qword_1000D16F0);
        v8 = a5;
        _NativeDictionary.copy()();
        if ((v23 & 1) != 0)
          goto LABEL_9;
      }
    }
    else
    {
      v8 = a5;
      sub_100097584(v22, a4 & 1);
      v24 = sub_1000991A8();
      if ((v23 & 1) != (v25 & 1))
        goto LABEL_17;
      v18 = v24;
      if ((v23 & 1) != 0)
      {
LABEL_9:
        sub_100038C60(*(_QWORD *)(*(_QWORD *)a5 + 56) + 32 * v18, (uint64_t)&v43, (uint64_t *)&unk_1000CFF70);
        sub_100038C60((uint64_t)&v43, (uint64_t)v47, (uint64_t *)&unk_1000CFF70);
        sub_100038C8C((uint64_t)&v43, (uint64_t *)&unk_1000CFF70);
        sub_100038C8C((uint64_t)v48, (uint64_t *)&unk_1000CFF70);
        v26 = sub_100043040((uint64_t)v47, *(_QWORD *)(*(_QWORD *)a5 + 56) + 32 * v18);
        goto LABEL_13;
      }
    }
    v34 = *(_QWORD **)a5;
    *(_QWORD *)(*(_QWORD *)a5 + 8 * (v18 >> 6) + 64) |= 1 << v18;
    *(_BYTE *)(v34[6] + v18) = v17;
    sub_100038CB4((uint64_t)v48, v34[7] + 32 * v18, (uint64_t *)&unk_1000CFF70);
    v35 = v34[2];
    v36 = __OFADD__(v35, 1);
    v37 = v35 + 1;
    if (v36)
      goto LABEL_16;
    v34[2] = v37;
LABEL_13:
    sub_1000991C0(v26, v27, v28, v29, v30, v31, v32, v33, v40, v41, v42, v43, v44, v45, v46);
    a4 = 1;
    if (v50 == 1)
      goto LABEL_14;
  }
  __break(1u);
LABEL_16:
  __break(1u);
LABEL_17:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for SportsMetricsKey);
  __break(1u);
  return result;
}

void sub_100097314(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  _QWORD *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t i;
  int64_t v16;
  _QWORD *v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  char v41;
  char v42;
  uint64_t *v43;
  int64_t v44;
  _QWORD *v45;
  char v46;
  _QWORD v47[9];

  v4 = v2;
  sub_100099104();
  sub_10000738C(&qword_1000D3A50);
  v46 = a2;
  v6 = static _DictionaryStorage.resize(original:capacity:move:)(v3, v2, a2);
  if (!v3[2])
    goto LABEL_40;
  sub_10009907C();
  v45 = v9;
  if (v7 < 64)
    v10 = ~(-1 << v7);
  else
    v10 = -1;
  v11 = v10 & v8;
  v43 = v2;
  v44 = (unint64_t)(v7 + 63) >> 6;
  v12 = v6 + 64;
  sub_100024058();
  v13 = 0;
  if (!v11)
    goto LABEL_7;
LABEL_6:
  v14 = __clz(__rbit64(v11));
  v11 &= v11 - 1;
  for (i = v14 | (v13 << 6); ; i = v21 + (v13 << 6))
  {
    v22 = (uint64_t *)(v3[6] + 16 * i);
    v24 = *v22;
    v23 = v22[1];
    v25 = (uint64_t *)(v3[7] + 16 * i);
    v26 = *v25;
    v27 = v25[1];
    if ((v46 & 1) == 0)
    {
      swift_bridgeObjectRetain(v22[1]);
      sub_1000991CC();
    }
    Hasher.init(_seed:)(v47);
    sub_100099220((uint64_t)v47);
    Hasher._finalize()();
    sub_1000991B4();
    if (((v30 << v29) & ~*(_QWORD *)(v12 + 8 * v28)) == 0)
    {
      sub_100099054();
      while (1)
      {
        sub_100099200();
        if (v34)
        {
          if ((v31 & 1) != 0)
            break;
        }
        if (v32 == v33)
          v32 = 0;
        if (*(_QWORD *)(v12 + 8 * v32) != -1)
        {
          sub_100099040();
          goto LABEL_31;
        }
      }
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return;
    }
    sub_100099068();
LABEL_31:
    sub_100099020();
    *(_QWORD *)(v12 + v35) |= v36;
    v38 = (_QWORD *)(*(_QWORD *)(v6 + 48) + 16 * v37);
    *v38 = v24;
    v38[1] = v23;
    v39 = (_QWORD *)(*(_QWORD *)(v6 + 56) + 16 * v37);
    *v39 = v26;
    v39[1] = v27;
    sub_100099168();
    if (v11)
      goto LABEL_6;
LABEL_7:
    v16 = v13 + 1;
    if (__OFADD__(v13, 1))
      goto LABEL_42;
    if (v16 >= v44)
    {
      sub_10008804C();
      v4 = v43;
      v17 = v45;
      goto LABEL_35;
    }
    v17 = v45;
    ++v13;
    if (!v45[v16])
    {
      v13 = v16 + 1;
      if (v16 + 1 >= v44)
        goto LABEL_33;
      if (!v45[v13])
        break;
    }
LABEL_18:
    sub_1000990E0();
    v11 = v20 & v19;
  }
  v18 = v16 + 2;
  if (v18 < v44)
  {
    if (!v45[v18])
    {
      while (1)
      {
        v13 = v18 + 1;
        if (__OFADD__(v18, 1))
          goto LABEL_43;
        if (v13 >= v44)
          goto LABEL_33;
        ++v18;
        if (v45[v13])
          goto LABEL_18;
      }
    }
    v13 = v18;
    goto LABEL_18;
  }
LABEL_33:
  sub_10008804C();
  v4 = v43;
LABEL_35:
  if ((v46 & 1) != 0)
  {
    sub_1000990F0();
    if (v41 != v42)
      *v17 = -1 << v40;
    else
      sub_10009912C(v40);
    v3[2] = 0;
  }
LABEL_40:
  sub_10008804C();
  *v4 = v6;
}

void sub_100097584(uint64_t a1, char a2)
{
  uint64_t *v2;
  _QWORD *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  int64_t i;
  int64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned __int8 v21;
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
  char v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  char v42;
  uint64_t *v43;
  int64_t v44;
  _QWORD *v45;
  _BYTE v46[32];

  v4 = v2;
  sub_100099104();
  sub_10000738C(&qword_1000D3250);
  v6 = sub_1000990B0();
  if (v3[2])
  {
    v43 = v2;
    sub_10009907C();
    v45 = v9;
    if (v7 < 64)
      v10 = ~(-1 << v7);
    else
      v10 = -1;
    v11 = v10 & v8;
    v44 = (unint64_t)(v7 + 63) >> 6;
    v12 = v6 + 64;
    sub_100024058();
    v13 = 0;
    if (!v11)
      goto LABEL_7;
LABEL_6:
    sub_10009920C();
    for (i = v14 | (v13 << 6); ; i = v20 + (v13 << 6))
    {
      v21 = *(_BYTE *)(v3[6] + i);
      v22 = v3[7] + 32 * i;
      if ((a2 & 1) != 0)
        sub_100038CB4(v22, (uint64_t)v46, (uint64_t *)&unk_1000CFF70);
      else
        sub_100038C60(v22, (uint64_t)v46, (uint64_t *)&unk_1000CFF70);
      sub_1000991DC(v23, v24, v25, v43);
      v26 = sub_10007B6F4(v21);
      sub_1000990C8(v26, v27, v28, v29, v30);
      sub_1000061E8();
      sub_100099234();
      sub_1000991B4();
      if (((-1 << v32) & ~*(_QWORD *)(v12 + 8 * v31)) == 0)
      {
        sub_100099054();
        while (1)
        {
          sub_100099200();
          if (v36)
          {
            if ((v33 & 1) != 0)
              break;
          }
          if (v34 == v35)
            v34 = 0;
          if (*(_QWORD *)(v12 + 8 * v34) != -1)
          {
            sub_100099040();
            goto LABEL_32;
          }
        }
        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
        return;
      }
      sub_100099068();
LABEL_32:
      sub_100099020();
      *(_QWORD *)(v12 + v37) |= v38;
      *(_BYTE *)(*(_QWORD *)(v6 + 48) + v39) = v21;
      sub_100038CB4((uint64_t)v46, *(_QWORD *)(v6 + 56) + 32 * v39, (uint64_t *)&unk_1000CFF70);
      sub_100099168();
      if (v11)
        goto LABEL_6;
LABEL_7:
      v16 = v13 + 1;
      if (__OFADD__(v13, 1))
        goto LABEL_41;
      if (v16 >= v44)
        goto LABEL_34;
      ++v13;
      if (!v45[v16])
      {
        v13 = v16 + 1;
        if (v16 + 1 >= v44)
          goto LABEL_34;
        if (!v45[v13])
        {
          v17 = v16 + 2;
          if (v17 >= v44)
          {
LABEL_34:
            sub_10008804C();
            v4 = v43;
            if ((a2 & 1) != 0)
            {
              sub_1000990F0();
              if (v41 != v42)
                *v45 = -1 << v40;
              else
                sub_100015638(0, (unint64_t)(v40 + 63) >> 6, v45);
              v3[2] = 0;
            }
            break;
          }
          if (!v45[v17])
          {
            while (1)
            {
              v13 = v17 + 1;
              if (__OFADD__(v17, 1))
                goto LABEL_42;
              if (v13 >= v44)
                goto LABEL_34;
              ++v17;
              if (v45[v13])
                goto LABEL_18;
            }
          }
          v13 = v17;
        }
      }
LABEL_18:
      sub_1000990E0();
      v11 = v19 & v18;
    }
  }
  sub_10008804C();
  *v4 = v6;
  sub_100099094();
}

void sub_1000977BC(uint64_t a1, char a2)
{
  uint64_t *v2;
  _QWORD *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t i;
  int64_t v17;
  _QWORD *v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int8 v23;
  _OWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  char v44;
  uint64_t *v45;
  _QWORD *v46;
  _OWORD v47[2];

  v4 = v2;
  sub_100099104();
  sub_10000738C(&qword_1000D3A58);
  v6 = sub_1000990B0();
  if (v3[2])
  {
    sub_10009907C();
    v45 = v2;
    v46 = v9;
    if (v7 < 64)
      v10 = ~(-1 << v7);
    else
      v10 = -1;
    v11 = v10 & v8;
    v12 = (unint64_t)(v7 + 63) >> 6;
    v13 = v6 + 64;
    sub_100024058();
    v14 = 0;
    if (!v11)
      goto LABEL_7;
LABEL_6:
    v15 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    for (i = v15 | (v14 << 6); ; i = v22 + (v14 << 6))
    {
      v23 = *(_BYTE *)(v3[6] + i);
      v24 = (_OWORD *)(v3[7] + 32 * i);
      if ((a2 & 1) != 0)
        v25 = (uint64_t)sub_100022CB8(v24, v47);
      else
        v25 = sub_100018090((uint64_t)v24, (uint64_t)v47);
      sub_1000991DC(v25, v26, v27);
      v28 = sub_10007B6F4(v23);
      sub_1000990C8(v28, v29, v30, v31, v32);
      sub_1000061E8();
      sub_100099234();
      sub_1000991B4();
      if (((-1 << v34) & ~*(_QWORD *)(v13 + 8 * v33)) == 0)
      {
        sub_100099054();
        while (1)
        {
          sub_100099200();
          if (v38)
          {
            if ((v35 & 1) != 0)
              break;
          }
          if (v36 == v37)
            v36 = 0;
          if (*(_QWORD *)(v13 + 8 * v36) != -1)
          {
            sub_100099040();
            goto LABEL_32;
          }
        }
        __break(1u);
LABEL_43:
        __break(1u);
LABEL_44:
        __break(1u);
        return;
      }
      sub_100099068();
LABEL_32:
      sub_100099020();
      *(_QWORD *)(v13 + v39) |= v40;
      *(_BYTE *)(*(_QWORD *)(v6 + 48) + v41) = v23;
      sub_100022CB8(v47, (_OWORD *)(*(_QWORD *)(v6 + 56) + 32 * v41));
      sub_100099168();
      if (v11)
        goto LABEL_6;
LABEL_7:
      v17 = v14 + 1;
      if (__OFADD__(v14, 1))
        goto LABEL_43;
      if (v17 >= v12)
        break;
      v18 = v46;
      ++v14;
      if (!v46[v17])
      {
        v14 = v17 + 1;
        if (v17 + 1 >= v12)
          goto LABEL_34;
        if (!v46[v14])
        {
          v19 = v17 + 2;
          if (v19 >= v12)
          {
LABEL_34:
            sub_10008804C();
            v4 = v45;
            if ((a2 & 1) == 0)
              goto LABEL_41;
            goto LABEL_37;
          }
          if (!v46[v19])
          {
            while (1)
            {
              v14 = v19 + 1;
              if (__OFADD__(v19, 1))
                goto LABEL_44;
              if (v14 >= v12)
                goto LABEL_34;
              ++v19;
              if (v46[v14])
                goto LABEL_18;
            }
          }
          v14 = v19;
        }
      }
LABEL_18:
      sub_1000990E0();
      v11 = v21 & v20;
    }
    sub_10008804C();
    v4 = v45;
    v18 = v46;
    if ((a2 & 1) == 0)
      goto LABEL_41;
LABEL_37:
    sub_1000990F0();
    if (v43 != v44)
      *v18 = -1 << v42;
    else
      sub_10009912C(v42);
    v3[2] = 0;
  }
LABEL_41:
  sub_10008804C();
  *v4 = v6;
  sub_100099094();
}

void sub_1000979E0()
{
  _QWORD **v0;
  _QWORD **v1;
  char v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  Swift::Int v16;
  unint64_t v17;
  char v18;
  unint64_t v19;
  char v20;
  _QWORD *v21;
  uint64_t *v22;

  sub_10000A758();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  sub_100015050(v6, v4);
  sub_100099148();
  v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
    goto LABEL_9;
  }
  v17 = v12;
  v18 = v13;
  sub_10000738C(&qword_1000D2808);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(v3 & 1, v16))
    goto LABEL_5;
  v19 = sub_100015050(v7, v5);
  if ((v18 & 1) != (v20 & 1))
  {
LABEL_9:
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
    __break(1u);
    return;
  }
  v17 = v19;
LABEL_5:
  v21 = *v1;
  if ((v18 & 1) != 0)
  {
    v22 = (uint64_t *)(v21[7] + 16 * v17);
    swift_bridgeObjectRelease(v22[1]);
    *v22 = v11;
    v22[1] = v9;
    sub_10000A668();
  }
  else
  {
    sub_100097E1C(v17, v7, v5, v11, v9, v21);
    swift_bridgeObjectRetain(v5);
  }
}

void sub_100097AE8(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  _BOOL8 v12;
  Swift::Int v13;
  unint64_t v14;
  char v15;
  unint64_t v16;
  char v17;
  _QWORD *v18;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v9 = sub_1000150A4(a2);
  v11 = v8[2];
  v12 = (v10 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_9;
  }
  v14 = v9;
  v15 = v10;
  sub_10000738C(&qword_1000D16F0);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a3 & 1, v13))
    goto LABEL_5;
  v16 = sub_1000150A4(a2);
  if ((v15 & 1) != (v17 & 1))
  {
LABEL_9:
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for SportsMetricsKey);
    __break(1u);
    return;
  }
  v14 = v16;
LABEL_5:
  v18 = *v4;
  if ((v15 & 1) != 0)
    sub_100043040(a1, v18[7] + 32 * v14);
  else
    sub_100097E68(v14, a2, a1, v18);
}

void sub_100097BE0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  _BOOL8 v14;
  Swift::Int v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  char v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v11 = sub_100015050(a2, a3);
  v13 = v10[2];
  v14 = (v12 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_9;
  }
  v16 = v11;
  v17 = v12;
  sub_10000738C(&qword_1000D3A68);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v15))
    goto LABEL_5;
  v18 = sub_100015050(a2, a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_9:
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
    __break(1u);
    return;
  }
  v16 = v18;
LABEL_5:
  v20 = *v5;
  if ((v17 & 1) != 0)
  {
    v21 = v20[7];
    swift_release(*(_QWORD *)(v21 + 8 * v16));
    *(_QWORD *)(v21 + 8 * v16) = a1;
  }
  else
  {
    sub_100097ED8(v16, a2, a3, a1, v20);
    swift_bridgeObjectRetain(a3);
  }
}

uint64_t sub_100097CF4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  _BOOL8 v14;
  Swift::Int v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  char v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v11 = sub_100015050(a2, a3);
  v13 = v10[2];
  v14 = (v12 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_9;
  }
  v16 = v11;
  v17 = v12;
  sub_10000738C(&qword_1000D3A60);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v15))
    goto LABEL_5;
  v18 = sub_100015050(a2, a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_9:
    result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
    __break(1u);
    return result;
  }
  v16 = v18;
LABEL_5:
  v20 = *v5;
  if ((v17 & 1) != 0)
  {
    v21 = v20[7];
    v22 = type metadata accessor for DatedSubscribers(0);
    return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 40))(v21 + *(_QWORD *)(*(_QWORD *)(v22 - 8) + 72) * v16, a1, v22);
  }
  else
  {
    sub_100097F20(v16, a2, a3, a1, v20);
    return swift_bridgeObjectRetain(a3);
  }
}

unint64_t sub_100097E1C(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a6[(result >> 6) + 8] |= 1 << result;
  v6 = (_QWORD *)(a6[6] + 16 * result);
  *v6 = a2;
  v6[1] = a3;
  v7 = (_QWORD *)(a6[7] + 16 * result);
  *v7 = a4;
  v7[1] = a5;
  v8 = a6[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a6[2] = v10;
  return result;
}

void sub_100097E68(unint64_t a1, char a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_BYTE *)(a4[6] + a1) = a2;
  sub_100038CB4(a3, a4[7] + 32 * a1, (uint64_t *)&unk_1000CFF70);
  v5 = a4[2];
  v6 = __OFADD__(v5, 1);
  v7 = v5 + 1;
  if (v6)
    __break(1u);
  else
    a4[2] = v7;
}

unint64_t sub_100097ED8(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a5[(result >> 6) + 8] |= 1 << result;
  v5 = (_QWORD *)(a5[6] + 16 * result);
  *v5 = a2;
  v5[1] = a3;
  *(_QWORD *)(a5[7] + 8 * result) = a4;
  v6 = a5[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a5[2] = v8;
  return result;
}

uint64_t sub_100097F20(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v8 = (_QWORD *)(a5[6] + 16 * a1);
  *v8 = a2;
  v8[1] = a3;
  v9 = a5[7];
  v10 = type metadata accessor for DatedSubscribers(0);
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * a1, a4, v10);
  v12 = a5[2];
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (v13)
    __break(1u);
  else
    a5[2] = v14;
  return result;
}

uint64_t sub_100097FB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  char v5;
  unsigned int v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t isStackAllocationSafe;
  unint64_t *v10;
  uint64_t v11;
  unint64_t *v12;
  uint64_t v13;
  uint64_t v15;

  v4 = a1;
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v7 = (unint64_t)((1 << v5) + 63) >> 6;
  v8 = 8 * v7;
  isStackAllocationSafe = swift_bridgeObjectRetain_n(a2, 2);
  if (v6 <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(v8, 8), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    v10 = (unint64_t *)((char *)&v15 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0));
    sub_100015638(0, v7, v10);
    swift_bridgeObjectRetain(a2);
    sub_10009816C(v10, v7, v4, a2);
    if (v2)
      swift_willThrow(v11);
    else
      v4 = v11;
    swift_bridgeObjectRelease_n(a2, 2);
  }
  else
  {
    v12 = (unint64_t *)swift_slowAlloc(v8, -1);
    sub_100015638(0, v7, v12);
    swift_bridgeObjectRetain(a2);
    sub_10009816C(v12, v7, v4, a2);
    v4 = v13;
    swift_slowDealloc(v12, -1, -1);
    swift_bridgeObjectRelease_n(a2, 2);
  }
  swift_bridgeObjectRelease(a2);
  return v4;
}

void sub_10009816C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  unsigned __int8 v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  _BYTE v29[32];
  unsigned __int8 v30[8];
  uint64_t v31;
  _BYTE v32[40];
  char v33;

  v26 = 0;
  v6 = 0;
  v27 = a3 + 64;
  v7 = 1 << *(_BYTE *)(a3 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(a3 + 64);
  v28 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    if (v9)
    {
      v10 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v11 = v10 | (v6 << 6);
      goto LABEL_20;
    }
    v12 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_36;
    }
    if (v12 >= v28)
      goto LABEL_34;
    v13 = *(_QWORD *)(v27 + 8 * v12);
    ++v6;
    if (!v13)
    {
      v6 = v12 + 1;
      if (v12 + 1 >= v28)
        goto LABEL_34;
      v13 = *(_QWORD *)(v27 + 8 * v6);
      if (!v13)
      {
        v6 = v12 + 2;
        if (v12 + 2 >= v28)
          goto LABEL_34;
        v13 = *(_QWORD *)(v27 + 8 * v6);
        if (!v13)
          break;
      }
    }
LABEL_19:
    v9 = (v13 - 1) & v13;
    v11 = __clz(__rbit64(v13)) + (v6 << 6);
LABEL_20:
    v15 = *(_BYTE *)(*(_QWORD *)(a3 + 48) + v11);
    sub_100038C60(*(_QWORD *)(a3 + 56) + 32 * v11, (uint64_t)v32, (uint64_t *)&unk_1000CFF70);
    v30[0] = v15;
    sub_100038C60((uint64_t)v32, (uint64_t)&v31, (uint64_t *)&unk_1000CFF70);
    if (*(_QWORD *)(a4 + 16)
      && (v16 = sub_1000150A4(44), (v17 & 1) != 0)
      && (sub_100018090(*(_QWORD *)(a4 + 56) + 32 * v16, (uint64_t)v29),
          swift_dynamicCast(&v33, v29, (char *)&type metadata for Any + 8, &type metadata for EventType.EventName, 6)))
    {
      if (((1 << v33) & 0xB) == 0)
      {
        sub_100038C8C((uint64_t)v30, &qword_1000D0F10);
        sub_100038C8C((uint64_t)v32, (uint64_t *)&unk_1000CFF70);
        goto LABEL_30;
      }
      v18 = sub_10007B6F4(v15);
      v20 = v19;
      if (v18 != 0xD000000000000011)
        goto LABEL_29;
LABEL_27:
      if (v20 != 0x80000001000A5C80)
        goto LABEL_29;
      swift_bridgeObjectRelease(0x80000001000A5C80);
      sub_100038C8C((uint64_t)v30, &qword_1000D0F10);
      sub_100038C8C((uint64_t)v32, (uint64_t *)&unk_1000CFF70);
    }
    else
    {
      v18 = sub_10007B6F4(v15);
      v20 = v21;
      if (v18 == 0xD000000000000011)
        goto LABEL_27;
LABEL_29:
      v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v18, v20, 0xD000000000000011, 0x80000001000A5C80, 0);
      swift_bridgeObjectRelease(v20);
      sub_100038C8C((uint64_t)v30, &qword_1000D0F10);
      sub_100038C8C((uint64_t)v32, (uint64_t *)&unk_1000CFF70);
      if ((v22 & 1) == 0)
      {
LABEL_30:
        *(unint64_t *)((char *)a1 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
        if (__OFADD__(v26++, 1))
          goto LABEL_37;
      }
    }
  }
  v14 = v12 + 3;
  if (v14 >= v28)
  {
LABEL_34:
    sub_100098704(a1, a2, v26, (_QWORD *)a3);
    swift_bridgeObjectRelease(a4);
    return;
  }
  v13 = *(_QWORD *)(v27 + 8 * v14);
  if (v13)
  {
    v6 = v14;
    goto LABEL_19;
  }
  while (1)
  {
    v6 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v6 >= v28)
      goto LABEL_34;
    v13 = *(_QWORD *)(v27 + 8 * v6);
    ++v14;
    if (v13)
      goto LABEL_19;
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
}

void sub_1000984C4(unint64_t *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v5;
  uint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  unint64_t *v36;
  uint64_t v37;
  _QWORD v38[9];

  if (!a3)
    return;
  v5 = a3;
  if (a4[2] == a3)
  {
    swift_retain(a4);
    return;
  }
  sub_10000738C(&qword_1000D3A70);
  v8 = static _DictionaryStorage.allocate(capacity:)(v5);
  v9 = (_QWORD *)v8;
  v36 = a1;
  v37 = a2;
  if (a2 < 1)
    v10 = 0;
  else
    v10 = *a1;
  v11 = 0;
  v12 = v8 + 64;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v14 = v13 | (v11 << 6);
      goto LABEL_25;
    }
    v15 = v11 + 1;
    if (__OFADD__(v11, 1))
      goto LABEL_40;
    if (v15 >= v37)
      return;
    ++v11;
    if (!v36[v15])
    {
      v11 = v15 + 1;
      if (v15 + 1 >= v37)
        return;
      if (!v36[v11])
      {
        v11 = v15 + 2;
        if (v15 + 2 >= v37)
          return;
        if (!v36[v11])
          break;
      }
    }
LABEL_24:
    sub_1000990E0();
    v10 = v18 & v17;
    v14 = v19 + (v11 << 6);
LABEL_25:
    v20 = (uint64_t *)(a4[6] + 16 * v14);
    v22 = *v20;
    v21 = v20[1];
    v23 = *(_QWORD *)(a4[7] + 8 * v14);
    Hasher.init(_seed:)(v38);
    swift_bridgeObjectRetain(v21);
    sub_1000991CC();
    sub_100099220((uint64_t)v38);
    sub_100099234();
    sub_1000991B4();
    if (((v26 << v25) & ~*(_QWORD *)(v12 + 8 * v24)) == 0)
    {
      sub_100099054();
      while (1)
      {
        sub_100099200();
        if (v30)
        {
          if ((v27 & 1) != 0)
            break;
        }
        if (v28 == v29)
          v28 = 0;
        if (*(_QWORD *)(v12 + 8 * v28) != -1)
        {
          sub_100099040();
          goto LABEL_35;
        }
      }
      __break(1u);
LABEL_39:
      __break(1u);
LABEL_40:
      __break(1u);
      goto LABEL_41;
    }
    sub_100099068();
LABEL_35:
    sub_100099020();
    *(_QWORD *)(v12 + v31) |= v32;
    v34 = (_QWORD *)(v9[6] + 16 * v33);
    *v34 = v22;
    v34[1] = v21;
    *(_QWORD *)(v9[7] + 8 * v33) = v23;
    ++v9[2];
    if (__OFSUB__(v5--, 1))
      goto LABEL_39;
    if (!v5)
      return;
  }
  v16 = v15 + 3;
  if (v16 >= v37)
    return;
  if (v36[v16])
  {
    v11 = v16;
    goto LABEL_24;
  }
  while (1)
  {
    v11 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v11 >= v37)
      return;
    ++v16;
    if (v36[v11])
      goto LABEL_24;
  }
LABEL_41:
  __break(1u);
}

void sub_100098704(unint64_t *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unsigned __int8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  Swift::Int v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v31;
  _QWORD v33[9];
  _BYTE v34[32];
  _BYTE v35[40];

  if (!a3)
    return;
  v5 = a3;
  if (a4[2] == a3)
  {
    swift_retain(a4);
    return;
  }
  sub_10000738C(&qword_1000D3250);
  v7 = static _DictionaryStorage.allocate(capacity:)(v5);
  v8 = v7;
  v31 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = v7 + 64;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v10 << 6);
      goto LABEL_25;
    }
    v14 = v10 + 1;
    if (__OFADD__(v10, 1))
      goto LABEL_39;
    if (v14 >= v31)
      return;
    v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      v10 = v14 + 1;
      if (v14 + 1 >= v31)
        return;
      v15 = a1[v10];
      if (!v15)
      {
        v10 = v14 + 2;
        if (v14 + 2 >= v31)
          return;
        v15 = a1[v10];
        if (!v15)
          break;
      }
    }
LABEL_24:
    v9 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_25:
    v17 = *(_BYTE *)(a4[6] + v13);
    sub_100038C60(a4[7] + 32 * v13, (uint64_t)v35, (uint64_t *)&unk_1000CFF70);
    sub_100038CB4((uint64_t)v35, (uint64_t)v34, (uint64_t *)&unk_1000CFF70);
    Hasher.init(_seed:)(v33);
    v18 = sub_10007B6F4(v17);
    v20 = v19;
    String.hash(into:)(v33, v18, v19);
    swift_bridgeObjectRelease(v20);
    v21 = Hasher._finalize()();
    v22 = -1 << *(_BYTE *)(v8 + 32);
    v23 = v21 & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v11 + 8 * (v23 >> 6))) == 0)
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v22) >> 6;
      while (++v24 != v27 || (v26 & 1) == 0)
      {
        v28 = v24 == v27;
        if (v24 == v27)
          v24 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v11 + 8 * v24);
        if (v29 != -1)
        {
          v25 = __clz(__rbit64(~v29)) + (v24 << 6);
          goto LABEL_34;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    v25 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v11 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(_QWORD *)(v11 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
    *(_BYTE *)(*(_QWORD *)(v8 + 48) + v25) = v17;
    sub_100038CB4((uint64_t)v34, *(_QWORD *)(v8 + 56) + 32 * v25, (uint64_t *)&unk_1000CFF70);
    ++*(_QWORD *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
      goto LABEL_38;
    if (!v5)
      return;
  }
  v16 = v14 + 3;
  if (v16 >= v31)
    return;
  v15 = a1[v16];
  if (v15)
  {
    v10 = v16;
    goto LABEL_24;
  }
  while (1)
  {
    v10 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v10 >= v31)
      return;
    v15 = a1[v10];
    ++v16;
    if (v15)
      goto LABEL_24;
  }
LABEL_40:
  __break(1u);
}

void sub_1000989D8(double a1, double a2)
{
  if ((~COERCE__INT64(a2 - a1) & 0x7FF0000000000000) != 0)
    sub_100098A54(0x20000000000001uLL);
  else
    __break(1u);
}

unint64_t sub_100098A54(unint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  if (result)
  {
    v1 = result;
    v3 = 0;
    swift_stdlib_random(&v3, 8);
    result = (v3 * (unsigned __int128)v1) >> 64;
    if (v3 * v1 < v1)
    {
      v2 = -(uint64_t)v1 % v1;
      if (v2 > v3 * v1)
      {
        do
        {
          v3 = 0;
          swift_stdlib_random(&v3, 8);
        }
        while (v2 > v3 * v1);
        return (v3 * (unsigned __int128)v1) >> 64;
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100098AE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
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

uint64_t sub_100098B1C()
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
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t *__return_ptr, _QWORD *);
  uint64_t result;
  int64_t v15;
  int64_t v16;
  uint64_t v17;
  unint64_t v18;
  int64_t v19;
  int64_t v20;
  uint64_t v21;
  _QWORD v22[4];

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
    v10 = (uint64_t *)(*(_QWORD *)(v1 + 56) + 16 * v6);
    v11 = *v10;
    v12 = v10[1];
    v0[3] = v4;
    v0[4] = v5;
    v13 = (void (*)(uint64_t *__return_ptr, _QWORD *))v0[5];
    v22[0] = v8;
    v22[1] = v9;
    v22[2] = v11;
    v22[3] = v12;
    sub_100018E34();
    sub_1000185C8();
    v13(&v21, v22);
    sub_100018574();
    sub_1000185B4();
    return v21;
  }
  v15 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    v16 = (unint64_t)(v0[2] + 64) >> 6;
    if (v15 < v16)
    {
      v17 = v0[1];
      v18 = *(_QWORD *)(v17 + 8 * v15);
      if (v18)
      {
LABEL_7:
        v5 = (v18 - 1) & v18;
        v6 = __clz(__rbit64(v18)) + (v15 << 6);
        v4 = v15;
        goto LABEL_3;
      }
      v19 = v3 + 2;
      v4 = v3 + 1;
      if (v3 + 2 < v16)
      {
        v18 = *(_QWORD *)(v17 + 8 * v19);
        if (v18)
        {
LABEL_10:
          v15 = v19;
          goto LABEL_7;
        }
        v4 = v3 + 2;
        if (v3 + 3 < v16)
        {
          v18 = *(_QWORD *)(v17 + 8 * (v3 + 3));
          if (v18)
          {
            v15 = v3 + 3;
            goto LABEL_7;
          }
          v19 = v3 + 4;
          v4 = v3 + 3;
          if (v3 + 4 < v16)
          {
            v18 = *(_QWORD *)(v17 + 8 * v19);
            if (v18)
              goto LABEL_10;
            v15 = v3 + 5;
            v4 = v3 + 4;
            if (v3 + 5 < v16)
            {
              v18 = *(_QWORD *)(v17 + 8 * v15);
              if (v18)
                goto LABEL_7;
              v4 = v16 - 1;
              v20 = v3 + 6;
              while (v20 < v16)
              {
                v18 = *(_QWORD *)(v17 + 8 * v20++);
                if (v18)
                {
                  v15 = v20 - 1;
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

void sub_100098CA4(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  int64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  void (*v17)(_OWORD *);
  _OWORD v18[2];
  uint64_t v19;
  _OWORD v20[2];
  uint64_t v21;
  _OWORD v22[2];
  uint64_t v23;

  v3 = *v1;
  v4 = v1[1];
  v6 = v1[2];
  v5 = v1[3];
  v7 = v5;
  v8 = v1[4];
  if (v8)
  {
    v9 = (v8 - 1) & v8;
    v10 = __clz(__rbit64(v8)) | (v5 << 6);
LABEL_3:
    v11 = *(_BYTE *)(*(_QWORD *)(v3 + 48) + v10);
    sub_100038C60(*(_QWORD *)(v3 + 56) + 32 * v10, (uint64_t)v22 + 8, (uint64_t *)&unk_1000CFF70);
    LOBYTE(v22[0]) = v11;
    goto LABEL_23;
  }
  v12 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    return;
  }
  v13 = (unint64_t)(v6 + 64) >> 6;
  if (v12 < v13)
  {
    v14 = *(_QWORD *)(v4 + 8 * v12);
    if (v14)
    {
LABEL_7:
      v9 = (v14 - 1) & v14;
      v10 = __clz(__rbit64(v14)) + (v12 << 6);
      v7 = v12;
      goto LABEL_3;
    }
    v15 = v5 + 2;
    v7 = v5 + 1;
    if (v5 + 2 < v13)
    {
      v14 = *(_QWORD *)(v4 + 8 * v15);
      if (v14)
      {
LABEL_10:
        v12 = v15;
        goto LABEL_7;
      }
      v7 = v5 + 2;
      if (v5 + 3 < v13)
      {
        v14 = *(_QWORD *)(v4 + 8 * (v5 + 3));
        if (v14)
        {
          v12 = v5 + 3;
          goto LABEL_7;
        }
        v15 = v5 + 4;
        v7 = v5 + 3;
        if (v5 + 4 < v13)
        {
          v14 = *(_QWORD *)(v4 + 8 * v15);
          if (v14)
            goto LABEL_10;
          v12 = v5 + 5;
          v7 = v5 + 4;
          if (v5 + 5 < v13)
          {
            v14 = *(_QWORD *)(v4 + 8 * v12);
            if (v14)
              goto LABEL_7;
            v7 = v13 - 1;
            v16 = v5 + 6;
            while (v16 < v13)
            {
              v14 = *(_QWORD *)(v4 + 8 * v16++);
              if (v14)
              {
                v12 = v16 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }
  v9 = 0;
  memset(v22, 0, sizeof(v22));
  v23 = 1;
LABEL_23:
  *v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  v17 = (void (*)(_OWORD *))v1[5];
  sub_100038CB4((uint64_t)v22, (uint64_t)v20, &qword_1000D3A00);
  if (v21 == 1)
  {
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_QWORD *)(a1 + 32) = 1;
  }
  else
  {
    v18[0] = v20[0];
    v18[1] = v20[1];
    v19 = v21;
    v17(v18);
    sub_100038C8C((uint64_t)v18, &qword_1000D0F10);
  }
}

uint64_t sub_100098E88()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100098EAC()
{
  uint64_t v0;

  return sub_100095FE0(v0);
}

uint64_t sub_100098EB4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100098EC4(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t storeEnumTagSinglePayload for EventType.EventName(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100098F18 + 4 * byte_1000A4FEA[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_100098F4C + 4 * byte_1000A4FE5[v4]))();
}

uint64_t sub_100098F4C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100098F54(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100098F5CLL);
  return result;
}

uint64_t sub_100098F68(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100098F70);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_100098F74(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100098F7C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for EventType.EventName()
{
  return &type metadata for EventType.EventName;
}

unint64_t sub_100098F9C()
{
  unint64_t result;

  result = qword_1000D3A78;
  if (!qword_1000D3A78)
  {
    result = swift_getWitnessTable(&unk_1000A5164, &type metadata for EventType.EventName);
    atomic_store(result, (unint64_t *)&qword_1000D3A78);
  }
  return result;
}

uint64_t sub_100098FD8(uint64_t a1)
{
  uint64_t v1;

  return sub_100009658(a1, 1, v1);
}

uint64_t sub_100098FF4()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0, v1);
}

uint64_t sub_100099008@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

double sub_100099034()
{
  _OWORD *v0;
  double result;

  result = 0.0;
  *v0 = 0u;
  v0[1] = 0u;
  return result;
}

uint64_t sub_1000990B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return static _DictionaryStorage.resize(original:capacity:move:)(v1, v0, v2);
}

uint64_t sub_1000990C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  return String.hash(into:)(va, a1, a2);
}

void sub_100099118()
{
  sub_100013494();
}

void sub_100099124(uint64_t a1)
{
  uint64_t *v1;

  sub_100038C8C(a1, v1);
}

uint64_t sub_10009912C@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;

  return sub_100015638(0, (unint64_t)(a1 + 63) >> 6, v1);
}

uint64_t sub_100099140@<X0>(uint64_t a1@<X8>)
{
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
}

unint64_t sub_100099158()
{
  uint64_t v0;
  uint64_t v1;

  return sub_100015050(v1, v0);
}

void sub_100099168()
{
  uint64_t v0;

  ++*(_QWORD *)(v0 + 16);
}

void sub_100099178(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  sub_100038C60(a1, v3, a3);
}

unint64_t sub_100099180()
{
  return sub_100021804();
}

void sub_100099188(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_100038C8C(v2, a2);
}

uint64_t sub_100099190(uint64_t a1, uint64_t a2)
{
  return Dictionary.init(dictionaryLiteral:)(a1, a2);
}

uint64_t sub_10009919C(uint64_t a1, uint64_t a2)
{
  return Dictionary.init(dictionaryLiteral:)(a1, a2);
}

unint64_t sub_1000991A8()
{
  uint64_t v0;

  return sub_1000150A4(v0);
}

void sub_1000991C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  sub_100098CA4((uint64_t)va);
}

uint64_t sub_1000991CC()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(v0);
}

void sub_1000991D4(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_100038C8C(v2, a2);
}

_QWORD *sub_1000991DC(uint64_t a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  return Hasher.init(_seed:)((uint64_t *)va);
}

uint64_t sub_1000991E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return swift_bridgeObjectRelease(*(_QWORD *)(v1 + a1 + 24));
}

uint64_t sub_1000991F4(uint64_t a1)
{
  uint64_t v1;

  return sub_100009658(a1, 1, v1);
}

uint64_t sub_100099220(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return String.hash(into:)(a1, v2, v1);
}

void sub_10009922C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  sub_100038C60(a1, v3, a3);
}

Swift::Int sub_100099234()
{
  return Hasher._finalize()();
}

uint64_t sub_10009923C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
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

  v28 = a7;
  v15 = type metadata accessor for Date(0);
  v16 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin(v15);
  v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)a8 = a1;
  *(_QWORD *)(a8 + 8) = a2;
  sub_100009DDC(a3, a8 + 16);
  *(_QWORD *)(a8 + 56) = a4;
  *(_QWORD *)(a8 + 64) = a5;
  *(_BYTE *)(a8 + 72) = a6;
  v19 = sub_10009B330();
  v20 = a8 + *(int *)(v19 + 36);
  v21 = sub_10009B310();
  v22 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(v20, v28, v21);
  v23 = *(int *)(v19 + 40);
  Date.init()(v22);
  sub_100080BA0();
  v25 = v24;
  result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  *(_QWORD *)(a8 + v23) = v25;
  return result;
}

uint64_t type metadata accessor for SubscriptionRefreshOperation(uint64_t a1)
{
  uint64_t result;

  result = qword_1000D3AD8;
  if (!qword_1000D3AD8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SubscriptionRefreshOperation);
  return result;
}

uint64_t sub_10009937C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t *v9;
  __int128 v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t refreshed;
  void (*v18)(uint64_t, uint64_t, uint64_t);

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain(v5);
  }
  else
  {
    v8 = a2[1];
    *(_QWORD *)(a1 + 8) = v8;
    v9 = a2 + 2;
    v10 = *(_OWORD *)(a2 + 5);
    *(_OWORD *)(a1 + 40) = v10;
    v11 = v10;
    v12 = **(void (***)(uint64_t, uint64_t *, uint64_t))(v10 - 8);
    swift_retain(v5);
    swift_retain(v8);
    v12(a1 + 16, v9, v11);
    v13 = a2[8];
    *(_QWORD *)(a1 + 56) = a2[7];
    *(_QWORD *)(a1 + 64) = v13;
    *(_BYTE *)(a1 + 72) = *((_BYTE *)a2 + 72);
    v14 = *(int *)(a3 + 36);
    v15 = a1 + v14;
    v16 = (uint64_t)a2 + v14;
    refreshed = type metadata accessor for SportsManager.RefreshOptions(0);
    v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(refreshed - 8) + 16);
    swift_bridgeObjectRetain(v13);
    v18(v15, v16, refreshed);
    *(_QWORD *)(a1 + *(int *)(a3 + 40)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 40));
  }
  return a1;
}

uint64_t sub_10009947C(_QWORD *a1, uint64_t a2)
{
  char *v4;
  uint64_t refreshed;

  swift_release(*a1);
  swift_release(a1[1]);
  sub_100007618(a1 + 2);
  swift_bridgeObjectRelease();
  v4 = (char *)a1 + *(int *)(a2 + 36);
  refreshed = type metadata accessor for SportsManager.RefreshOptions(0);
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(refreshed - 8) + 8))(v4, refreshed);
}

uint64_t sub_1000994DC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  __int128 v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t refreshed;
  void (*v17)(uint64_t, uint64_t, uint64_t);

  v6 = *a2;
  v7 = a2[1];
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = v7;
  v8 = a2 + 2;
  v9 = *(_OWORD *)(a2 + 5);
  *(_OWORD *)(a1 + 40) = v9;
  v10 = v9;
  v11 = **(void (***)(uint64_t, uint64_t *, uint64_t))(v9 - 8);
  swift_retain(v6);
  swift_retain(v7);
  v11(a1 + 16, v8, v10);
  v12 = a2[8];
  *(_QWORD *)(a1 + 56) = a2[7];
  *(_QWORD *)(a1 + 64) = v12;
  *(_BYTE *)(a1 + 72) = *((_BYTE *)a2 + 72);
  v13 = *(int *)(a3 + 36);
  v14 = a1 + v13;
  v15 = (uint64_t)a2 + v13;
  refreshed = type metadata accessor for SportsManager.RefreshOptions(0);
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(refreshed - 8) + 16);
  swift_bridgeObjectRetain(v12);
  v17(v14, v15, refreshed);
  *(_QWORD *)(a1 + *(int *)(a3 + 40)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 40));
  return a1;
}

uint64_t *sub_1000995B0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t refreshed;

  v6 = *a2;
  v7 = *a1;
  *a1 = *a2;
  swift_retain(v6);
  swift_release(v7);
  v8 = a2[1];
  v9 = a1[1];
  a1[1] = v8;
  swift_retain(v8);
  swift_release(v9);
  sub_100009F58(a1 + 2, a2 + 2);
  a1[7] = a2[7];
  v10 = a2[8];
  a1[8] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease();
  *((_BYTE *)a1 + 72) = *((_BYTE *)a2 + 72);
  v11 = *(int *)(a3 + 36);
  v12 = (uint64_t)a1 + v11;
  v13 = (uint64_t)a2 + v11;
  refreshed = type metadata accessor for SportsManager.RefreshOptions(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(refreshed - 8) + 24))(v12, v13, refreshed);
  *(uint64_t *)((char *)a1 + *(int *)(a3 + 40)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 40));
  return a1;
}

uint64_t sub_100099684(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t refreshed;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v7 = *(_OWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  v8 = *(int *)(a3 + 36);
  v9 = a1 + v8;
  v10 = a2 + v8;
  *(_OWORD *)(a1 + 56) = v7;
  refreshed = type metadata accessor for SportsManager.RefreshOptions(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(refreshed - 8) + 32))(v9, v10, refreshed);
  *(_QWORD *)(a1 + *(int *)(a3 + 40)) = *(_QWORD *)(a2 + *(int *)(a3 + 40));
  return a1;
}

uint64_t *sub_10009971C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t refreshed;

  v6 = *a1;
  *a1 = *a2;
  swift_release(v6);
  v7 = a1[1];
  a1[1] = a2[1];
  swift_release(v7);
  sub_100007618(a1 + 2);
  v8 = *((_OWORD *)a2 + 2);
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
  *((_OWORD *)a1 + 2) = v8;
  *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
  a1[8] = a2[8];
  swift_bridgeObjectRelease();
  *((_BYTE *)a1 + 72) = *((_BYTE *)a2 + 72);
  v9 = *(int *)(a3 + 36);
  v10 = (uint64_t)a1 + v9;
  v11 = (uint64_t)a2 + v9;
  refreshed = type metadata accessor for SportsManager.RefreshOptions(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(refreshed - 8) + 40))(v10, v11, refreshed);
  *(uint64_t *)((char *)a1 + *(int *)(a3 + 40)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 40));
  return a1;
}

uint64_t sub_1000997DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000997E8);
}

uint64_t sub_1000997E8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_10009B310();
    return sub_100009658((uint64_t)a1 + *(int *)(a3 + 36), a2, v8);
  }
}

uint64_t sub_100099858(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100099864);
}

_QWORD *sub_100099864(_QWORD *result, uint64_t a2, int a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *result = (a2 - 1);
  }
  else
  {
    v7 = sub_10009B310();
    return (_QWORD *)sub_10000964C((uint64_t)v5 + *(int *)(a4 + 36), a2, a2, v7);
  }
  return result;
}

uint64_t sub_1000998CC(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[7];

  v4[0] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[1] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[2] = "(";
  v4[3] = &unk_1000A51C8;
  v4[4] = &unk_1000A51E0;
  result = type metadata accessor for SportsManager.RefreshOptions(319);
  if (v3 <= 0x3F)
  {
    v4[5] = *(_QWORD *)(result - 8) + 64;
    v4[6] = (char *)&value witness table for Builtin.Int64 + 64;
    swift_initStructMetadata(a1, 256, 7, v4, a1 + 16);
    return 0;
  }
  return result;
}

void sub_100099970(uint64_t a1)
{
  uint64_t v2;
  int64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  int64_t v9;
  int64_t v10;
  char v11;
  unsigned __int8 v12;
  _QWORD *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  Swift::Int v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  __int128 *v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  _OWORD v31[2];
  char v32;
  _BYTE v33[32];
  _OWORD v34[2];
  _OWORD v35[2];
  uint64_t v36;
  _OWORD v37[2];
  uint64_t v38;
  _QWORD *v39;
  _QWORD v40[7];
  int64_t v41;

  v39 = &_swiftEmptyDictionarySingleton;
  sub_100073004(v40, a1);
  v2 = v40[0];
  v28 = v40[1];
  v3 = v40[3];
  v4 = v40[4];
  v41 = (unint64_t)(v40[2] + 64) >> 6;
  swift_bridgeObjectRetain(a1);
  if (!v4)
    goto LABEL_3;
LABEL_2:
  v5 = __clz(__rbit64(v4));
  v4 &= v4 - 1;
  v6 = v5 | (v3 << 6);
  while (1)
  {
    v11 = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v6);
    sub_10002F710(*(_QWORD *)(v2 + 56) + 32 * v6, (uint64_t)v37 + 8);
    LOBYTE(v37[0]) = v11;
    v35[0] = v37[0];
    v35[1] = v37[1];
    v36 = v38;
    sub_10002F710((uint64_t)v35 + 8, (uint64_t)&v29);
    if (!v30)
    {
      sub_100022988((uint64_t)v35, &qword_1000D0F10);
      v23 = &v29;
      goto LABEL_33;
    }
    sub_100022CB8(&v29, v34);
    v12 = v35[0];
    v32 = v35[0];
    sub_10000AD8C((uint64_t)v35 + 8, (uint64_t)v33);
    sub_100022CB8(v34, v31);
    v13 = v39;
    v14 = v39[2];
    if (v39[3] <= v14)
    {
      sub_1000977BC(v14 + 1, 1);
      v13 = v39;
    }
    Hasher.init(_seed:)(&v29);
    v15 = sub_10007B6F4(v12);
    String.hash(into:)(&v29, v15, v16);
    swift_bridgeObjectRelease();
    v17 = Hasher._finalize()();
    v18 = v13 + 8;
    v19 = -1 << *((_BYTE *)v13 + 32);
    v20 = v17 & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~v13[(v20 >> 6) + 8]) == 0)
      break;
    v22 = __clz(__rbit64((-1 << v20) & ~v13[(v20 >> 6) + 8])) | v20 & 0x7FFFFFFFFFFFFFC0;
LABEL_32:
    *(_QWORD *)((char *)v18 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(_BYTE *)(v13[6] + v22) = v12;
    sub_100022CB8(v31, (_OWORD *)(v13[7] + 32 * v22));
    ++v13[2];
    v23 = (__int128 *)v33;
LABEL_33:
    sub_100022988((uint64_t)v23, (uint64_t *)&unk_1000CFF70);
    if (v4)
      goto LABEL_2;
LABEL_3:
    v7 = v3 + 1;
    if (__OFADD__(v3, 1))
      goto LABEL_37;
    if (v7 >= v41)
      goto LABEL_35;
    v8 = *(_QWORD *)(v28 + 8 * v7);
    v9 = v3 + 1;
    if (!v8)
    {
      v9 = v3 + 2;
      if (v3 + 2 >= v41)
        goto LABEL_35;
      v8 = *(_QWORD *)(v28 + 8 * v9);
      if (!v8)
      {
        v9 = v3 + 3;
        if (v3 + 3 >= v41)
          goto LABEL_35;
        v8 = *(_QWORD *)(v28 + 8 * v9);
        if (!v8)
        {
          v9 = v3 + 4;
          if (v3 + 4 >= v41)
            goto LABEL_35;
          v8 = *(_QWORD *)(v28 + 8 * v9);
          if (!v8)
          {
            v9 = v3 + 5;
            if (v3 + 5 >= v41)
              goto LABEL_35;
            v8 = *(_QWORD *)(v28 + 8 * v9);
            if (!v8)
            {
              v10 = v3 + 6;
              while (v10 < v41)
              {
                v8 = *(_QWORD *)(v28 + 8 * v10++);
                if (v8)
                {
                  v9 = v10 - 1;
                  goto LABEL_18;
                }
              }
LABEL_35:
              sub_1000180CC(v2);
              return;
            }
          }
        }
      }
    }
LABEL_18:
    v4 = (v8 - 1) & v8;
    v6 = __clz(__rbit64(v8)) + (v9 << 6);
    v3 = v9;
  }
  v24 = 0;
  v25 = (unint64_t)(63 - v19) >> 6;
  while (++v21 != v25 || (v24 & 1) == 0)
  {
    v26 = v21 == v25;
    if (v21 == v25)
      v21 = 0;
    v24 |= v26;
    v27 = v18[v21];
    if (v27 != -1)
    {
      v22 = __clz(__rbit64(~v27)) + (v21 << 6);
      goto LABEL_32;
    }
  }
  __break(1u);
LABEL_37:
  __break(1u);
}

uint64_t sub_100099CE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  _QWORD *v33;
  Swift::String v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(_QWORD *, uint64_t);
  _QWORD *v41;
  Swift::String v42;
  id v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(void);
  _QWORD *v49;
  char *v50;
  uint64_t v51;
  void (*v52)(void);
  _QWORD *v53;
  uint64_t v54;
  void (*v55)(char *, char *, uint64_t);
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  id v70;
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
  uint64_t v84;
  void *v85;
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
  char *v98;
  _QWORD *v99;
  uint64_t v100;
  uint64_t v101;
  _QWORD *v102;
  uint64_t v103;
  uint64_t v104;

  v1 = v0;
  v2 = sub_10000738C(&qword_1000D0F00);
  v3 = *(_QWORD *)(v2 - 8);
  v100 = v2;
  v101 = v3;
  sub_10000A680();
  __chkstk_darwin(v4);
  sub_10000CD48();
  v102 = v5;
  v6 = sub_10009B330();
  v86 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v87 = v7;
  v88 = (uint64_t)&v84 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_10000738C(&qword_1000D3B28);
  v90 = *(_QWORD *)(v8 - 8);
  v91 = v8;
  sub_10000A680();
  __chkstk_darwin(v9);
  sub_10000CD48();
  v89 = v10;
  v11 = sub_10000738C(&qword_1000D3B30);
  v93 = *(_QWORD *)(v11 - 8);
  v94 = v11;
  sub_10000A680();
  __chkstk_darwin(v12);
  sub_10000CD48();
  v92 = v13;
  v14 = sub_10000738C(&qword_1000D3B38);
  v96 = *(_QWORD *)(v14 - 8);
  v97 = v14;
  sub_10000A680();
  __chkstk_darwin(v15);
  sub_10000CD48();
  v95 = v16;
  sub_10000738C((uint64_t *)&unk_1000D16E0);
  sub_10000A680();
  __chkstk_darwin(v17);
  v19 = (char *)&v84 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = type metadata accessor for URL(0);
  v99 = *(_QWORD **)(v20 - 8);
  v21 = v99[8];
  __chkstk_darwin(v20);
  v22 = (char *)&v84 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  v98 = (char *)&v84 - v24;
  v25 = *(_QWORD **)v0;
  v27 = *(_QWORD *)(v0 + 56);
  v26 = *(_QWORD *)(v0 + 64);
  v28 = *(unsigned __int8 *)(v0 + 72);
  v29 = v25[5];
  v30 = v25[6];
  sub_1000073CC(v25 + 2, v29);
  v31 = dispatch thunk of PersistentStorable.retrieveEventSubscription(canonicalId:isConventionalOrUnified:)(v27, v26, v28, v29, v30);
  if (v31)
  {
    v32 = (void *)v31;
    v33 = v102;
    SportingEventSubscription.eventStateURL.getter();
    if (sub_100009658((uint64_t)v19, 1, v20) != 1)
    {
      v48 = (void (*)(void))v99[4];
      v49 = v99;
      v85 = v32;
      v50 = v98;
      v51 = v20;
      v48();
      v52 = v48;
      v53 = sub_1000073CC((_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 40));
      v54 = sub_10009A3D8();
      v102 = sub_1000073CC(v53, v53[3]);
      v55 = (void (*)(char *, char *, uint64_t))v49[2];
      v56 = v50;
      v57 = v51;
      v84 = v51;
      v55(v22, v56, v51);
      v58 = sub_1000680F4();
      v59 = *((unsigned __int8 *)v49 + 80);
      v60 = (v59 + 16) & ~v59;
      v61 = (v21 + v60 + 7) & 0xFFFFFFFFFFFFFFF8;
      v62 = swift_allocObject(&unk_1000C9A30, v61 + 8, v59 | 7);
      ((void (*)(uint64_t, char *, uint64_t))v52)(v62 + v60, v22, v57);
      *(_QWORD *)(v62 + v61) = v58;
      v63 = v53[5];
      sub_100018E34();
      v64 = sub_10009AE2C((uint64_t)sub_100050A44, v62, v54, 0, v63, (uint64_t)v102);
      swift_bridgeObjectRelease_n(v54, 2);
      swift_release(v62);
      v103 = v64;
      v65 = v88;
      sub_10009B0B0(v1, v88);
      v66 = *(unsigned __int8 *)(v86 + 80);
      v67 = (v66 + 24) & ~v66;
      v68 = swift_allocObject(&unk_1000C9A58, v67 + v87, v66 | 7);
      v69 = v85;
      *(_QWORD *)(v68 + 16) = v85;
      sub_10009B188(v65, v68 + v67);
      v70 = v69;
      v71 = sub_10000738C(&qword_1000D3B40);
      v72 = sub_10009B324(&qword_1000D3B48);
      v73 = v89;
      Publisher.tryFilter(_:)(sub_10009B1CC, v68, v71, v72);
      swift_release(v68);
      swift_release(v103);
      sub_10000D358(&qword_1000D3B50, &qword_1000D3B28, (uint64_t)&protocol conformance descriptor for Publishers.TryFilter<A>);
      v74 = v91;
      v75 = v92;
      Publisher.map<A>(_:)(sub_10002EA8C, 0, v91, &type metadata for Bool);
      (*(void (**)(uint64_t, uint64_t))(v90 + 8))(v73, v74);
      v76 = sub_10000738C(&qword_1000D0B18);
      v77 = sub_10000D358(&qword_1000D3B58, &qword_1000D3B30, (uint64_t)&protocol conformance descriptor for Publishers.Map<A, B>);
      v78 = sub_10009B324((unint64_t *)&qword_1000D0B20);
      v79 = v94;
      v80 = v95;
      Publisher.catch<A>(_:)(sub_10009ACC4, 0, v94, v76, v77, v78);
      (*(void (**)(uint64_t, uint64_t))(v93 + 8))(v75, v79);
      v81 = sub_10000D358(&qword_1000D3B60, &qword_1000D3B38, (uint64_t)&protocol conformance descriptor for Publishers.Catch<A, B>);
      v82 = v97;
      v39 = Publisher.eraseToAnyPublisher()(v97, v81);

      (*(void (**)(uint64_t, uint64_t))(v96 + 8))(v80, v82);
      v41 = v98;
      v40 = (void (*)(_QWORD *, uint64_t))v99[1];
      v47 = v84;
      goto LABEL_7;
    }
    sub_100022988((uint64_t)v19, (uint64_t *)&unk_1000D16E0);
    v103 = 0;
    v104 = 0xE000000000000000;
    _StringGuts.grow(_:)(55);
    v34._object = (void *)0x80000001000A8040;
    v34._countAndFlagsBits = 0xD000000000000035;
    String.append(_:)(v34);
    sub_100018E34();
    sub_10009B318();
    sub_1000185B4();
    v35 = sub_100027C78(4u, v103, v104);
    sub_1000185B4();
    v103 = (uint64_t)v35;
    v36 = sub_10000738C((uint64_t *)&unk_1000D1690);
    Fail.init(error:)(&v103, &type metadata for Bool, v36, &protocol self-conformance witness table for Error);
    v37 = sub_10000D358(&qword_1000D0F08, &qword_1000D0F00, (uint64_t)&protocol conformance descriptor for Fail<A, B>);
    v38 = v100;
    v39 = Publisher.eraseToAnyPublisher()(v100, v37);

    v40 = *(void (**)(_QWORD *, uint64_t))(v101 + 8);
    v41 = v33;
  }
  else
  {
    v103 = 0;
    v104 = 0xE000000000000000;
    _StringGuts.grow(_:)(65);
    v42._countAndFlagsBits = 0xD00000000000003FLL;
    v42._object = (void *)0x80000001000A8000;
    String.append(_:)(v42);
    sub_100018E34();
    sub_10009B318();
    sub_1000185B4();
    v43 = sub_100027C78(3u, v103, v104);
    sub_1000185B4();
    v103 = (uint64_t)v43;
    v44 = sub_10000738C((uint64_t *)&unk_1000D1690);
    v45 = v102;
    Fail.init(error:)(&v103, &type metadata for Bool, v44, &protocol self-conformance witness table for Error);
    v46 = sub_10000D358(&qword_1000D0F08, &qword_1000D0F00, (uint64_t)&protocol conformance descriptor for Fail<A, B>);
    v38 = v100;
    v39 = Publisher.eraseToAnyPublisher()(v100, v46);
    v40 = *(void (**)(_QWORD *, uint64_t))(v101 + 8);
    v41 = v45;
  }
  v47 = v38;
LABEL_7:
  v40(v41, v47);
  return v39;
}

uint64_t sub_10009A3D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t inited;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE v19[232];

  v1 = v0;
  v2 = type metadata accessor for Date(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = &v19[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = sub_10000738C(&qword_1000D0848);
  inited = swift_initStackObject(v6, v19);
  *(_OWORD *)(inited + 16) = xmmword_1000A08E0;
  *(_BYTE *)(inited + 32) = 2;
  v9 = *(_QWORD *)(v1 + 56);
  v8 = *(_QWORD *)(v1 + 64);
  *(_QWORD *)(inited + 64) = &type metadata for String;
  *(_QWORD *)(inited + 40) = v9;
  *(_QWORD *)(inited + 48) = v8;
  *(_BYTE *)(inited + 72) = 7;
  swift_bridgeObjectRetain(v8);
  Date.init()(v10);
  sub_100080BA0();
  v12 = v11;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(_QWORD *)(inited + 104) = &type metadata for UInt64;
  *(_QWORD *)(inited + 80) = v12;
  *(_BYTE *)(inited + 112) = 8;
  v13 = *(_QWORD *)(v1 + *(int *)(type metadata accessor for SubscriptionRefreshOperation(0) + 40));
  *(_QWORD *)(inited + 144) = &type metadata for UInt64;
  *(_QWORD *)(inited + 120) = v13;
  *(_BYTE *)(inited + 152) = 43;
  LOBYTE(v13) = *(_BYTE *)(v1 + 72);
  *(_QWORD *)(inited + 184) = &type metadata for Bool;
  *(_BYTE *)(inited + 160) = v13;
  *(_BYTE *)(inited + 192) = 44;
  *(_QWORD *)(inited + 224) = &type metadata for EventType.EventName;
  *(_BYTE *)(inited + 200) = 2;
  sub_10000738C((uint64_t *)&unk_1000CFF70);
  sub_100021804();
  v14 = Dictionary.init(dictionaryLiteral:)(inited, &type metadata for SportsMetricsKey);
  sub_100099970(v14);
  v16 = v15;
  swift_bridgeObjectRelease();
  return v16;
}

uint64_t sub_10009A564(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  void (*v29)(char *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  char v35;
  uint64_t v36;
  char v37;
  __n128 v38;
  uint64_t v39;
  Swift::OpaquePointer v40;
  Swift::String v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  char v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  id v59;
  id v60;
  id v61;
  NSObject *v62;
  os_log_type_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t refreshed;
  uint64_t v96;
  uint64_t v97[5];
  uint64_t v98;
  uint64_t v99;

  v4 = v3;
  v94 = a3;
  v96 = a2;
  v6 = sub_10000738C(&qword_1000D0570);
  __chkstk_darwin(v6);
  v88 = (uint64_t)&v84 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  refreshed = type metadata accessor for SubscriptionRefreshOperation(0);
  __chkstk_darwin(refreshed);
  v89 = (uint64_t)&v84 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v92 = (char *)&v84 - v10;
  __chkstk_darwin(v11);
  v13 = (char *)&v84 - v12;
  v14 = type metadata accessor for SportsManager.RefreshOptions(0);
  v93 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v16 = (char *)&v84 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for SportingEventProgressStatus(0);
  v18 = *(_QWORD *)(v17 - 8);
  __chkstk_darwin(v17);
  v20 = (char *)&v84 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  v23 = (char *)&v84 - v22;
  v24 = *(_QWORD *)(a1 + *(int *)(sub_10000738C(&qword_1000D2290) + 40));
  if (!((unint64_t)v24 >> 62))
  {
    v25 = *(_QWORD *)((v24 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(v24);
    if (v25)
      goto LABEL_3;
LABEL_29:
    swift_bridgeObjectRelease();
    v82 = sub_100027C78(5u, 0xD000000000000013, 0x80000001000A8080);
    swift_willThrow(v82);
    return 1;
  }
  if (v24 < 0)
    v81 = v24;
  else
    v81 = v24 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v24);
  if (!_CocoaArrayWrapper.endIndex.getter(v81))
    goto LABEL_29;
LABEL_3:
  v91 = v4;
  sub_10007DEC8(0, (v24 & 0xC000000000000001) == 0, v24);
  if ((v24 & 0xC000000000000001) != 0)
    v26 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v24);
  else
    v26 = *(id *)(v24 + 32);
  v90 = v26;
  v27 = swift_bridgeObjectRelease();
  v28 = (void *)SportingEventSubscription.sportingEventDetails.getter(v27);
  SportingEvent.progressStatus.getter(v28);

  (*(void (**)(char *, _QWORD, uint64_t))(v18 + 104))(v20, enum case for SportingEventProgressStatus.unknown(_:), v17);
  v87 = sub_100056318((uint64_t)v23, (uint64_t)v20);
  v29 = *(void (**)(char *, uint64_t))(v18 + 8);
  v29(v20, v17);
  v30 = ((uint64_t (*)(char *, uint64_t))v29)(v23, v17);
  v31 = v94;
  static SportsManager.RefreshOptions.plays.getter(v30);
  v32 = sub_10009B21C();
  LOBYTE(v29) = dispatch thunk of SetAlgebra.isSuperset(of:)(v16, v14, v32);
  v33 = *(void (**)(char *, uint64_t))(v93 + 8);
  v33(v16, v14);
  sub_10009B0B0(v31, (uint64_t)v13);
  v34 = v91;
  if ((v29 & 1) != 0)
  {
    v35 = v13[72];
    v36 = sub_10007FE6C((uint64_t)v13);
    if ((v35 & 1) != 0)
    {
      v97[3] = (uint64_t)&type metadata for TVAppFeatureFlags;
      v97[4] = sub_10000A278();
      v37 = isFeatureEnabled(_:)(v97);
      v36 = sub_100007618(v97);
      if ((v37 & 1) == 0)
      {
        v93 = *(_QWORD *)(v31 + 8);
        v39 = *(_QWORD *)(v31 + 56);
        v85 = *(void **)(v31 + 64);
        v86 = v39;
        v40._rawValue = (void *)dispatch thunk of SportingEvent.plays.getter(v38);
        v41._object = v85;
        v41._countAndFlagsBits = v86;
        PlaysStore.refreshAllPlays(for:with:)(v41, v40);
        v34 = v42;
        if (v42)
        {

          swift_bridgeObjectRelease();
          return 1;
        }
        v36 = swift_bridgeObjectRelease();
      }
    }
  }
  else
  {
    v36 = sub_10007FE6C((uint64_t)v13);
  }
  v43 = (uint64_t)v92;
  static SportsManager.RefreshOptions.subscription.getter(v36);
  v44 = dispatch thunk of SetAlgebra.isSuperset(of:)(v16, v14, v32);
  v33(v16, v14);
  v45 = sub_10009B0B0(v31, v43);
  if ((v44 & 1) != 0)
  {
    v46 = sub_10007FE6C(v43);
    v47 = v90;
  }
  else
  {
    static SportsManager.RefreshOptions.subscriptionIfUnknown.getter(v45);
    v48 = dispatch thunk of SetAlgebra.isSuperset(of:)(v16, v14, v32);
    v33(v16, v14);
    v46 = sub_10007FE6C(v43);
    if ((v48 & 1) == 0)
    {

      return 1;
    }
    v47 = v90;
    if ((v87 & 1) == 0)
      goto LABEL_21;
  }
  v49 = (void *)SportingEvent.partialSportingEvent.getter(v46);
  v50 = dispatch thunk of SportingEvent.versionNumber.getter(v49);

  v51 = (void *)v96;
  v53 = (void *)SportingEventSubscription.sportingEventDetails.getter(v52);
  v54 = dispatch thunk of SportingEvent.versionNumber.getter(v53);

  if (v50 >= v54)
  {
    v75 = (void *)SportingEvent.partialSportingEvent.getter(v55);
    v76 = type metadata accessor for Date(0);
    v77 = v88;
    sub_10000964C(v88, 1, 1, v76);
    SportingEventSubscription.update(sportingEventDetails:updatedAt:)(v75, v77);

    sub_100022988(v77, &qword_1000D0570);
    v78 = *(unsigned __int8 *)(v31 + 72);
    v79 = *(_QWORD *)(*(_QWORD *)v31 + 40);
    v80 = *(_QWORD *)(*(_QWORD *)v31 + 48);
    sub_1000073CC((_QWORD *)(*(_QWORD *)v31 + 16), v79);
    dispatch thunk of PersistentStorable.writeEventSubscription(_:isConventionalOrUnified:)(v51, v78, v79, v80);
LABEL_21:

    return 1;
  }
  if (qword_1000CFAB8 != -1)
    swift_once(&qword_1000CFAB8, sub_10006CC6C);
  v56 = type metadata accessor for Logger(0);
  sub_1000096EC(v56, (uint64_t)qword_1000DDAA0);
  v57 = v89;
  sub_10009B0B0(v31, v89);
  v58 = v47;
  v59 = v51;
  v60 = v58;
  v61 = v59;
  v62 = Logger.logObject.getter(v61);
  v63 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v62, v63))
  {
    v64 = swift_slowAlloc(32, -1);
    v96 = swift_slowAlloc(32, -1);
    v97[0] = v96;
    *(_DWORD *)v64 = 136315650;
    v91 = v34;
    v65 = *(_QWORD *)(v57 + 56);
    v66 = *(_QWORD *)(v57 + 64);
    swift_bridgeObjectRetain(v66);
    sub_100014B44(v65, v66, v97);
    v98 = v67;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v98, &v99, v64 + 4, v64 + 12);
    swift_bridgeObjectRelease();
    v68 = sub_10007FE6C(v57);
    *(_WORD *)(v64 + 12) = 2048;
    v69 = (void *)SportingEvent.partialSportingEvent.getter(v68);
    v70 = dispatch thunk of SportingEvent.versionNumber.getter(v69);

    v98 = v70;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v98, &v99, v64 + 14, v64 + 22);

    *(_WORD *)(v64 + 22) = 2048;
    v72 = (void *)SportingEventSubscription.sportingEventDetails.getter(v71);
    v73 = dispatch thunk of SportingEvent.versionNumber.getter(v72);

    v98 = v73;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v98, &v99, v64 + 24, v64 + 32);

    _os_log_impl((void *)&_mh_execute_header, v62, v63, "Skipped stale subscription refresh update for canonical id: %s. (%ld < %ld)", (uint8_t *)v64, 0x20u);
    v74 = v96;
    swift_arrayDestroy(v96, 1);
    swift_slowDealloc(v74, -1, -1);
    swift_slowDealloc(v64, -1, -1);

  }
  else
  {

    sub_10007FE6C(v57);
  }
  return 1;
}

uint64_t sub_10009ACC4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;

  v4 = sub_10000738C(&qword_1000D0F00);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *a1;
  swift_errorRetain(v13);
  v8 = sub_10000738C((uint64_t *)&unk_1000D1690);
  Fail.init(error:)(&v13, &type metadata for Bool, v8, &protocol self-conformance witness table for Error);
  v9 = sub_10000D358(&qword_1000D0F08, &qword_1000D0F00, (uint64_t)&protocol conformance descriptor for Fail<A, B>);
  v10 = Publisher.eraseToAnyPublisher()(v4, v9);
  result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  *a2 = v10;
  return result;
}

uint64_t sub_10009ADB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = type metadata accessor for URL(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v6));
  return swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_10009AE2C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  _QWORD *v15;
  id v16;
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
  uint64_t v30;
  uint64_t v31;
  __int128 v32[2];
  _BYTE __src[96];
  uint64_t v34;
  _QWORD v35[6];

  v12 = sub_10000738C(&qword_1000D3B70);
  v31 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35[3] = &type metadata for AMSApiRequest;
  v35[4] = &off_1000C41A0;
  v15 = (_QWORD *)swift_allocObject(&unk_1000C9A80, 48, 7);
  v35[0] = v15;
  v15[2] = a1;
  v15[3] = a2;
  v15[4] = a3;
  v15[5] = a4;
  v16 = a4;
  swift_retain(a2);
  swift_bridgeObjectRetain(a3);
  sub_10005EAC0();
  v34 = v17;
  sub_1000095FC(a6, (uint64_t)__src);
  sub_10000AE14((uint64_t)v35, (uint64_t)v32);
  v18 = swift_allocObject(&unk_1000C9AA8, 160, 7);
  *(_QWORD *)(v18 + 16) = a5;
  memcpy((void *)(v18 + 24), __src, 0x60uLL);
  sub_100009DDC(v32, v18 + 120);
  v19 = swift_allocObject(&unk_1000C9AD0, 32, 7);
  *(_QWORD *)(v19 + 16) = sub_10009B2DC;
  *(_QWORD *)(v19 + 24) = v18;
  v20 = swift_retain(a5);
  v21 = static Subscribers.Demand.unlimited.getter(v20);
  v22 = sub_10000738C(&qword_1000CFD30);
  v23 = sub_10000738C(&qword_1000D2290);
  v24 = sub_10000738C(&qword_1000D3B78);
  v25 = sub_10000D358(&qword_1000CFD38, &qword_1000CFD30, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
  v26 = sub_10000D358(&qword_1000D3B80, &qword_1000D3B78, (uint64_t)&protocol conformance descriptor for Publishers.MapError<A, B>);
  Publisher.flatMap<A, B>(maxPublishers:_:)(v21, sub_100009D14, v19, v22, v23, v24, v25, v26);
  swift_release(v19);
  swift_release(v34);
  v27 = sub_10000D358(qword_1000D3B88, &qword_1000D3B70, (uint64_t)&protocol conformance descriptor for Publishers.FlatMap<A, B>);
  v28 = Publisher.eraseToAnyPublisher()(v12, v27);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v14, v12);
  sub_100007618(v35);
  return v28;
}

uint64_t sub_10009B0B0(uint64_t a1, uint64_t a2)
{
  uint64_t refreshed;

  refreshed = type metadata accessor for SubscriptionRefreshOperation(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(refreshed - 8) + 16))(a2, a1, refreshed);
  return a2;
}

uint64_t sub_10009B0F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;

  v1 = *(_QWORD *)(sub_10009B330() - 8);
  v2 = *(unsigned __int8 *)(v1 + 80);
  v3 = (v2 + 24) & ~v2;
  v4 = v3 + *(_QWORD *)(v1 + 64);
  v5 = v2 | 7;

  v6 = (_QWORD *)(v0 + v3);
  swift_release(*v6);
  swift_release(v6[1]);
  sub_100007618(v6 + 2);
  swift_bridgeObjectRelease();
  v7 = sub_10009B310();
  sub_100022EEC(v7);
  return swift_deallocObject(v0, v4, v5);
}

uint64_t sub_10009B188(uint64_t a1, uint64_t a2)
{
  uint64_t refreshed;

  refreshed = type metadata accessor for SubscriptionRefreshOperation(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(refreshed - 8) + 32))(a2, a1, refreshed);
  return a2;
}

uint64_t sub_10009B1CC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SubscriptionRefreshOperation(0) - 8) + 80);
  return sub_10009A564(a1, *(_QWORD *)(v1 + 16), v1 + ((v3 + 24) & ~v3)) & 1;
}

unint64_t sub_10009B21C()
{
  unint64_t result;
  uint64_t refreshed;

  result = qword_1000D3B68;
  if (!qword_1000D3B68)
  {
    refreshed = type metadata accessor for SportsManager.RefreshOptions(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for SportsManager.RefreshOptions, refreshed);
    atomic_store(result, (unint64_t *)&qword_1000D3B68);
  }
  return result;
}

uint64_t sub_10009B25C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));

  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10009B290()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  sub_100007618((_QWORD *)(v0 + 32));
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 72));
  sub_100007618((_QWORD *)(v0 + 80));
  sub_100007618((_QWORD *)(v0 + 120));
  return swift_deallocObject(v0, 160, 7);
}

void sub_10009B2DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;

  sub_1000578F0(a1, a2, a3, a4, a5, *(_QWORD *)(v20 + 16), v20 + 24, v20 + 120, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20);
}

uint64_t sub_10009B2EC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10009B310()
{
  return type metadata accessor for SportsManager.RefreshOptions(0);
}

void sub_10009B318()
{
  void *v0;
  uint64_t v1;
  Swift::String v2;

  v2._countAndFlagsBits = v1;
  v2._object = v0;
  String.append(_:)(v2);
}

uint64_t sub_10009B324(unint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  return sub_10000D358(a1, v1, v2);
}

uint64_t sub_10009B330()
{
  return type metadata accessor for SubscriptionRefreshOperation(0);
}

uint64_t sub_10009B338(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;

  result = swift_checkMetadataState(319, *(_QWORD *)(a1 + 80));
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(result - 8) + 64;
    result = swift_initClassMetadata2(a1, 0, 1, &v4, a1 + 88);
    if (!result)
      return 0;
  }
  return result;
}

void sub_10009B3A8()
{
  _swift_stdlib_reportUnimplementedInitializer("sportsd.Box", 11, "init()", 6, 0);
  __break(1u);
}

void sub_10009B3D4()
{
  sub_10009B3A8();
}

id sub_10009B3E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for Box(0, *(_QWORD *)((swift_isaMask & *v4) + 0x50), a3, a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, "dealloc");
}

uint64_t sub_10009B42C(char *a1)
{
  return (*(uint64_t (**)(char *))(*(_QWORD *)(*(_QWORD *)((swift_isaMask & *(_QWORD *)a1) + 0x50) - 8)
                                           + 8))(&a1[*(_QWORD *)((swift_isaMask & *(_QWORD *)a1) + 0x58)]);
}

uint64_t type metadata accessor for Box(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000BF38(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Box);
}

uint64_t sub_10009B464(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  switch(a2)
  {
    case 0:
      return !a4;
    case 1:
      return a4 == 1;
    case 2:
      return a4 == 2;
    case 3:
      return a4 == 3;
    case 4:
      return a4 == 4;
    case 5:
      return a4 == 5;
    case 6:
      return a4 == 6;
    case 7:
      return a4 == 7;
    case 8:
      return a4 == 8;
    default:
      if (a4 < 9)
        return 0;
      if (a1 == a3 && a2 == a4)
        return 1;
      else
        return _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, a3, a4, 0);
  }
}

uint64_t sub_10009B518(uint64_t *a1, uint64_t a2)
{
  return sub_10009B464(*a1, a1[1], *(_QWORD *)a2, *(_QWORD *)(a2 + 8));
}

void sub_10009B52C(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Swift::String v11;
  uint64_t v12;
  uint64_t v13;

  switch((unint64_t)a2)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
      break;
    default:
      sub_10009BEAC();
      _StringGuts.grow(_:)(36);
      sub_10009BEA4(v3, v4, v5, v6, v7, v8, v9, v10, v12, v13);
      v11._countAndFlagsBits = 0xD000000000000014;
      v11._object = a2;
      String.append(_:)(v11);
      break;
  }
  sub_100024954();
}

void sub_10009B658()
{
  uint64_t v0;

  sub_10009B52C(*(_QWORD *)v0, *(void **)(v0 + 8));
}

void sub_10009B660()
{
  sub_10009B6CC();
}

unint64_t sub_10009B678()
{
  return 0xD000000000000029;
}

unint64_t sub_10009B694()
{
  sub_10009B678();
  return 0xD000000000000029;
}

unint64_t sub_10009B6B0()
{
  return 0xD000000000000017;
}

void sub_10009B6CC()
{
  _QWORD v0[9];

  Hasher.init(_seed:)(v0);
  sub_100063AE0();
  Hasher._finalize()();
  sub_100055B2C();
}

unint64_t sub_10009B6FC()
{
  sub_10009B6B0();
  return 0xD000000000000017;
}

void sub_10009B718()
{
  _QWORD v0[9];

  Hasher.init(_seed:)(v0);
  sub_100063AE0();
  Hasher._finalize()();
  sub_100055B2C();
}

void sub_10009B744(uint64_t a1, void *a2)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;

  if (a2 == (void *)9)
  {
    sub_10009BEAC();
    _StringGuts.grow(_:)(26);
    sub_10009BEA4(v11, v12, v13, v14, v15, v16, v17, v18, v32, v33);
  }
  else if (a2 == (void *)10)
  {
    sub_10009BEAC();
    _StringGuts.grow(_:)(25);
    sub_10009BEA4(v3, v4, v5, v6, v7, v8, v9, v10, v32, v33);
  }
  else
  {
    _StringGuts.grow(_:)(25);
    sub_10009BEA4(v20, v21, v22, v23, v24, v25, v26, v27, 0, 0xE000000000000000);
    sub_10009B52C(a1, a2);
    if (v29)
    {
      v30 = v29;
    }
    else
    {
      v28 = 0;
      v30 = 0xE000000000000000;
    }
    v31 = v30;
    String.append(_:)(*(Swift::String *)&v28);
    swift_bridgeObjectRelease();
  }
  sub_100024954();
}

void sub_10009B834()
{
  uint64_t v0;

  sub_10009B744(*(_QWORD *)v0, *(void **)(v0 + 8));
}

unint64_t sub_10009B840()
{
  unint64_t result;

  result = qword_1000D3C10;
  if (!qword_1000D3C10)
  {
    result = swift_getWitnessTable(&unk_1000A532C, &unk_1000C9D48);
    atomic_store(result, (unint64_t *)&qword_1000D3C10);
  }
  return result;
}

unint64_t sub_10009B880()
{
  unint64_t result;

  result = qword_1000D3C18;
  if (!qword_1000D3C18)
  {
    result = swift_getWitnessTable(&unk_1000A53B4, &unk_1000C9CB8);
    atomic_store(result, (unint64_t *)&qword_1000D3C18);
  }
  return result;
}

unint64_t sub_10009B8C4(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease(result);
  return result;
}

_OWORD *sub_10009B8DC(uint64_t a1, uint64_t a2)
{
  _OWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  char v5;

  v3 = sub_10009BEBC(a1, a2);
  if (v5)
    sub_10009BED0(v3, v4);
  else
    *v2 = *(_OWORD *)v4;
  return v2;
}

_QWORD *sub_10009B910(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a1[1];
  v5 = a2[1];
  if (v4 < 0xFFFFFFFF)
  {
    if (v5 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      v7 = a2[1];
      a1[1] = v7;
      swift_bridgeObjectRetain(v7);
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v5 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease(a1[1]);
    goto LABEL_7;
  }
  *a1 = *a2;
  v6 = a2[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t sub_10009B9B0(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;

  v4 = *(_QWORD *)(a1 + 8);
  if (v4 < 0xFFFFFFFF)
    goto LABEL_5;
  v5 = *(_QWORD *)(a2 + 8);
  if (v5 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease(v4);
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t sub_10009BA10(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 > 0x7FFFFFF6 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483639);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 8;
  if (v4 >= 0xA)
    return v5;
  else
    return 0;
}

uint64_t sub_10009BA68(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFF7)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483639;
    if (a3 >= 0x7FFFFFF7)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFF7)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 8;
  }
  return result;
}

void type metadata accessor for ActivityCreateError()
{
  sub_100031ABC();
}

void type metadata accessor for ActivityDestroyError()
{
  sub_100031ABC();
}

uint64_t sub_10009BAD4(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_10009BB14 + 4 * byte_1000A5252[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_10009BB34 + 4 * byte_1000A5257[v4]))();
}

_BYTE *sub_10009BB14(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_10009BB34(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10009BB3C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10009BB44(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10009BB4C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10009BB54(_DWORD *result)
{
  *result = 0;
  return result;
}

void type metadata accessor for ActivityUpdateError()
{
  sub_100031ABC();
}

_OWORD *sub_10009BB70(uint64_t a1, uint64_t a2)
{
  _OWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  int v5;
  char v6;

  v3 = sub_10009BEBC(a1, a2);
  if (!v6)
    v5 = v3;
  if ((v5 + 1) <= 9 && v5 == -1)
    sub_10009BED0(v3, v4);
  else
    *v2 = *(_OWORD *)v4;
  return v2;
}

uint64_t sub_10009BBB8(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v11;

  v4 = *(_QWORD *)(a1 + 8);
  if (v4 >= 0xFFFFFFFF)
    LODWORD(v5) = -1;
  else
    v5 = *(_QWORD *)(a1 + 8);
  v6 = v5 + 1;
  v7 = *(_QWORD *)(a2 + 8);
  if (v7 >= 0xFFFFFFFF)
    LODWORD(v7) = -1;
  v8 = v7 + 1;
  if (v6 > 9)
  {
    if (v8 <= 9 && (_DWORD)v7 == -1)
      goto LABEL_13;
LABEL_18:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v8 > 9)
  {
    if (v6)
      goto LABEL_18;
LABEL_17:
    swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
    goto LABEL_18;
  }
  if (!v6)
  {
    if ((_DWORD)v7 == -1)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      v11 = *(_QWORD *)(a2 + 8);
      *(_QWORD *)(a1 + 8) = v11;
      swift_bridgeObjectRetain(v11);
      swift_bridgeObjectRelease(v4);
      return a1;
    }
    goto LABEL_17;
  }
  if ((_DWORD)v7 != -1)
    goto LABEL_18;
LABEL_13:
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v9 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v9;
  swift_bridgeObjectRetain(v9);
  return a1;
}

uint64_t sub_10009BC88(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  unint64_t v8;
  unsigned int v9;

  v4 = *(_QWORD *)(a1 + 8);
  LODWORD(v5) = -1;
  if (v4 >= 0xFFFFFFFF)
    v6 = -1;
  else
    v6 = v4;
  v7 = v6 + 1;
  v8 = *(_QWORD *)(a2 + 8);
  if (v8 < 0xFFFFFFFF)
    v5 = *(_QWORD *)(a2 + 8);
  if (v7 > 9)
    goto LABEL_13;
  v9 = v5 + 1;
  if (v9 > 9)
  {
    if (!v7)
      goto LABEL_12;
LABEL_13:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v7)
    goto LABEL_13;
  if (v9)
  {
LABEL_12:
    swift_bridgeObjectRelease(v4);
    goto LABEL_13;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v8;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t sub_10009BD08(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 > 0x7FFFFFF4 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483637);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 8;
  if (v4 < 0xA)
    v5 = 0;
  if (v5 >= 3)
    return v5 - 2;
  else
    return 0;
}

uint64_t sub_10009BD6C(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFF5)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483637;
    if (a3 >= 0x7FFFFFF5)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFF5)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 10;
  }
  return result;
}

uint64_t sub_10009BDBC(uint64_t a1)
{
  unint64_t v1;
  unsigned int v2;
  unsigned int v3;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  v2 = v1 + 1;
  v3 = v1 - 8;
  if (v2 >= 0xA)
    return v3;
  else
    return 0;
}

_QWORD *sub_10009BDE0(_QWORD *result, unsigned int a2)
{
  if (a2 >= 0x7FFFFFF7)
  {
    *result = 0;
    result[1] = 0;
    *(_DWORD *)result = a2 - 2147483639;
  }
  else if (a2)
  {
    result[1] = a2 + 8;
  }
  return result;
}

void type metadata accessor for LiveActivityManagerError()
{
  sub_100031ABC();
}

unint64_t sub_10009BE24()
{
  unint64_t result;

  result = qword_1000D3C20;
  if (!qword_1000D3C20)
  {
    result = swift_getWitnessTable(&unk_1000A553C, &unk_1000C9D48);
    atomic_store(result, (unint64_t *)&qword_1000D3C20);
  }
  return result;
}

unint64_t sub_10009BE64()
{
  unint64_t result;

  result = qword_1000D3C28;
  if (!qword_1000D3C28)
  {
    result = swift_getWitnessTable(&unk_1000A55A4, &unk_1000C9CB8);
    atomic_store(result, (unint64_t *)&qword_1000D3C28);
  }
  return result;
}

uint64_t sub_10009BEA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return swift_bridgeObjectRelease(a10);
}

uint64_t sub_10009BEBC(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 8);
}

uint64_t sub_10009BED0(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;

  *v2 = *a2;
  v2[1] = a1;
  return swift_bridgeObjectRetain(a1);
}

_QWORD *sub_10009BEDC()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  objc_class *v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v24;
  _QWORD v25[5];
  _QWORD v26[23];
  _BYTE v27[40];
  _BYTE v28[32];
  uint64_t v29;

  v0 = type metadata accessor for URL(0);
  __chkstk_darwin(v0);
  v2 = (char *)&v25[-1] - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = 0;
  memset(v28, 0, sizeof(v28));
  if (qword_1000CFA98 != -1)
    swift_once(&qword_1000CFA98, sub_1000479AC);
  v3 = qword_1000DDA78;
  v26[3] = type metadata accessor for LiveActivityManager();
  v26[4] = &off_1000C51A8;
  v26[0] = v3;
  swift_retain(v3);
  sub_100027964((uint64_t)v28, &qword_1000D1538);
  sub_10009CE40((uint64_t)v26, (uint64_t)v28);
  sub_10009C748((uint64_t)v28, (uint64_t)v27, &qword_1000D1538);
  bzero(v26, 0xB8uLL);
  if (qword_1000CFA68 != -1)
    swift_once(&qword_1000CFA68, sub_10002A1D4);
  v4 = qword_1000CFB10;
  v24 = qword_1000DDA40;
  swift_retain(qword_1000DDA40);
  if (v4 != -1)
    swift_once(&qword_1000CFB10, sub_1000947D0);
  v5 = qword_1000DDB78;
  v6 = (void *)objc_opt_self(NSFileManager);
  swift_retain(v5);
  v7 = objc_msgSend(v6, "defaultManager");
  NSFileManager.currentContainerURL.getter();

  v8 = type metadata accessor for PlaysStore(0);
  swift_allocObject(v8, *(unsigned int *)(v8 + 48), *(unsigned __int16 *)(v8 + 52));
  v9 = PlaysStore.init(storeUrl:)(v2);
  v10 = (objc_class *)type metadata accessor for ActivityAuthorization(0);
  v11 = objc_msgSend(objc_allocWithZone(v10), "init");
  v12 = sub_100043DEC();
  v14 = v13;
  v25[3] = v10;
  v25[4] = &off_1000C5188;
  v25[0] = v11;
  v15 = type metadata accessor for ActivityCapUtility();
  v16 = (_QWORD *)swift_allocObject(v15, 72, 7);
  v17 = sub_10000AE58((uint64_t)v25, (uint64_t)v10);
  __chkstk_darwin(v17);
  v19 = (_QWORD *)((char *)&v25[-1] - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v20 + 16))(v19);
  v21 = *v19;
  v16[5] = v10;
  v16[6] = &off_1000C5188;
  v16[2] = v21;
  v16[7] = v12;
  v16[8] = v14;
  sub_100007618(v25);
  v22 = sub_10009C908(v24, v5, v9, (uint64_t)v27, (uint64_t)v16, (uint64_t)sub_100063B84, 0, (uint64_t)v26);
  sub_100027964((uint64_t)v28, &qword_1000D1538);
  return v22;
}

uint64_t sub_10009C1BC(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t (*v6)(unint64_t, unint64_t, void (*)(uint64_t, uint64_t), _QWORD *);
  _QWORD v8[3];
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = *(uint64_t (**)(unint64_t, unint64_t, void (*)(uint64_t, uint64_t), _QWORD *))(v5 + 120);
  v8[2] = a1;
  v9 = a2;
  v10 = a4;
  v11 = a5;
  v12 = a3;
  return v6(0xD00000000000001DLL, 0x80000001000A83C0, sub_10009C734, v8);
}

void sub_10009C21C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _QWORD *v29;
  id v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD *v39;
  char v40[24];
  _BYTE v41[48];

  v33 = a7;
  v34 = a5;
  v35 = a1;
  v36 = a2;
  v12 = sub_10000738C(&qword_1000D0570);
  __chkstk_darwin(v12);
  v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(_QWORD *)(a4 + 16);
  v16 = *(_QWORD *)(a4 + 64);
  sub_10009C748(a4 + 72, (uint64_t)v41, &qword_1000D1538);
  v17 = *(_QWORD *)(a4 + 320);
  swift_beginAccess(a4 + 136, v40, 0, 0);
  sub_10009C748(a4 + 136, (uint64_t)v38, &qword_1000D0C20);
  sub_10000AE14(a4 + 24, (uint64_t)v37);
  sub_10009C748(a8, (uint64_t)v14, &qword_1000D0570);
  v18 = sub_10000AE58((uint64_t)v37, v37[3]);
  __chkstk_darwin(v18);
  v20 = (uint64_t *)((char *)&v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v21 + 16))(v20);
  v22 = *v20;
  swift_bridgeObjectRetain(a3);
  swift_retain(v15);
  swift_retain(v16);
  swift_retain(v17);
  v23 = v33;
  sub_10009CE30(a6, v33);
  *((_QWORD *)&v31 + 1) = v23;
  *(_QWORD *)&v31 = a6;
  v24 = sub_10009CCB4(a3, v15, v16, (uint64_t)v41, v17, (uint64_t)v38, v22, v34, v31, (uint64_t)v14);
  sub_100007618(v37);
  v25 = (_QWORD *)swift_allocObject(&unk_1000C9E98, 40, 7);
  v26 = v35;
  v27 = v36;
  v25[2] = v24;
  v25[3] = v26;
  v25[4] = v27;
  v38[4] = sub_10009CE0C;
  v39 = v25;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 1107296256;
  v38[2] = sub_100074E8C;
  v38[3] = &unk_1000C9EB0;
  v28 = _Block_copy(v38);
  v29 = v39;
  v30 = v24;
  swift_retain(v27);
  sub_10009CE30((uint64_t)sub_10009CE0C, (uint64_t)v25);
  swift_release(v29);
  objc_msgSend(v30, "setCompletionBlock:", v28);
  _Block_release(v28);

  swift_release(v25);
  objc_msgSend(*(id *)(a4 + 112), "addOperation:", v30);

}

uint64_t sub_10009C4B8(void *a1, uint64_t (*a2)(void))
{
  uint64_t v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;

  if (qword_1000CFAB0 != -1)
    swift_once(&qword_1000CFAB0, sub_10006CC14);
  v4 = type metadata accessor for Logger(0);
  sub_1000096EC(v4, (uint64_t)qword_1000DDA88);
  v5 = a1;
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.debug.getter(v6);
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v16 = v9;
    *(_DWORD *)v8 = 136315138;
    v10 = *(_QWORD *)&v5[OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_messageVersion + 8];
    if (v10)
    {
      v11 = *(_QWORD *)&v5[OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_messageVersion];
      v12 = *(_QWORD *)&v5[OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_messageVersion + 8];
    }
    else
    {
      v12 = 0xE300000000000000;
      v11 = 7104878;
    }
    swift_bridgeObjectRetain(v10);
    sub_100014B44(v11, v12, &v16);
    v15 = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v8 + 4, v8 + 12);

    swift_bridgeObjectRelease(v12);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "releasing os_transaction taken for message version %s", v8, 0xCu);
    swift_arrayDestroy(v9, 1);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

  }
  return a2();
}

uint64_t sub_10009C690()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  sub_100007618((_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 64));
  sub_100027964(v0 + 72, &qword_1000D1538);

  swift_release(*(_QWORD *)(v0 + 128));
  sub_100027964(v0 + 136, &qword_1000D0C20);
  swift_release(*(_QWORD *)(v0 + 320));
  return v0;
}

uint64_t sub_10009C6F4()
{
  uint64_t v0;

  sub_10009C690();
  return swift_deallocClassInstance(v0, 328, 7);
}

uint64_t type metadata accessor for ApsMessageProcessor()
{
  return objc_opt_self(_TtC7sportsd19ApsMessageProcessor);
}

void sub_10009C734(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_10009C21C(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(unsigned __int8 *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56));
}

uint64_t sub_10009C748(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_10000738C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_QWORD *sub_10009C78C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _QWORD *a9)
{
  id v17;
  _BYTE v19[24];
  _QWORD v20[5];

  v20[3] = type metadata accessor for SportsPerformanceMeasurement(0);
  v20[4] = &off_1000C98C8;
  v20[0] = a2;
  bzero(a9 + 17, 0xB8uLL);
  a9[2] = a1;
  sub_10000AE14((uint64_t)v20, (uint64_t)(a9 + 3));
  a9[8] = a3;
  sub_10009C748(a4, (uint64_t)(a9 + 9), &qword_1000D1538);
  a9[40] = a5;
  a9[15] = a6;
  a9[16] = a7;
  swift_beginAccess(a9 + 17, v19, 33, 0);
  swift_retain(a1);
  swift_retain(a3);
  swift_retain(a5);
  swift_retain(a7);
  sub_10009CE88(a8, (uint64_t)(a9 + 17));
  swift_endAccess(v19);
  v17 = objc_msgSend(objc_allocWithZone((Class)NSOperationQueue), "init");
  a9[14] = v17;
  objc_msgSend(v17, "setMaxConcurrentOperationCount:", 1);
  swift_release(a1);
  swift_release(a3);
  swift_release(a5);
  swift_release(a7);
  sub_100027964(a8, &qword_1000D0C20);
  sub_100027964(a4, &qword_1000D1538);
  sub_100007618(v20);
  return a9;
}

_QWORD *sub_10009C908(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD v25[3];
  uint64_t v26;
  _UNKNOWN **v27;

  v26 = type metadata accessor for SportsPerformanceMeasurement(0);
  v27 = &off_1000C98C8;
  v25[0] = a2;
  v16 = type metadata accessor for ApsMessageProcessor();
  v17 = (_QWORD *)swift_allocObject(v16, 328, 7);
  v18 = sub_10000AE58((uint64_t)v25, v26);
  __chkstk_darwin(v18);
  v20 = (_QWORD *)((char *)&v25[-1] - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v21 + 16))(v20);
  v22 = sub_10009C78C(a1, *v20, a3, a4, a5, a6, a7, a8, v17);
  sub_100007618(v25);
  return v22;
}

id sub_10009CA20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char *a12)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  objc_class *v33;
  id v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  objc_super v43;
  _QWORD v44[5];

  v41 = a8;
  v36 = a5;
  v37 = a6;
  v42 = a4;
  v39 = a10;
  v40 = a11;
  v17 = type metadata accessor for Date(0);
  v18 = *(_QWORD *)(v17 - 8);
  __chkstk_darwin(v17);
  v20 = (char *)&v36 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for SportsPerformanceMeasurement(0);
  *(_QWORD *)&a12[OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_cancellable] = 0;
  *(_QWORD *)&a12[OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_cancellables] = _swiftEmptyArrayStorage;
  v22 = &a12[OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_messageVersion];
  *(_QWORD *)v22 = 0;
  *((_QWORD *)v22 + 1) = 0;
  *(_QWORD *)&a12[OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_message] = a1;
  v44[3] = v21;
  v44[4] = &off_1000C98C8;
  v44[0] = a7;
  *(_QWORD *)&a12[OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_dataRepository] = a2;
  v23 = a3;
  v38 = a3;
  *(_QWORD *)&a12[OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_playsStore] = a3;
  sub_10009C748(a4, (uint64_t)&a12[OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_activityUpdateable], &qword_1000D1538);
  v25 = v36;
  v24 = v37;
  *(_QWORD *)&a12[OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_activityCapUtility] = v36;
  sub_10009C748(v24, (uint64_t)&a12[OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_subscriptionOperationFactory], &qword_1000D0C20);
  v26 = a12;
  swift_retain(a2);
  swift_retain(v23);
  v27 = swift_retain(v25);
  Date.init()(v27);
  sub_100080BA0();
  v29 = v28;
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  *(_QWORD *)&v26[OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_notificationReceiptTime] = v29;
  sub_10000AE14((uint64_t)v44, (uint64_t)&v26[OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_performance]);
  v26[OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_isLowCapLiveActivity] = v41;
  v30 = (uint64_t *)&v26[OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_activityUpdateCompletion];
  v32 = v39;
  v31 = v40;
  *v30 = a9;
  v30[1] = v32;
  sub_10009C748(v31, (uint64_t)&v26[OBJC_IVAR____TtC7sportsd29ApsMessageProcessingOperation_processDate], &qword_1000D0570);
  sub_10009CE30(a9, v32);

  v33 = (objc_class *)type metadata accessor for ApsMessageProcessingOperation(0);
  v43.receiver = v26;
  v43.super_class = v33;
  v34 = objc_msgSendSuper2(&v43, "init");
  sub_10003F4BC(a9, v32);
  swift_release(a2);
  swift_release(v38);
  swift_release(v25);
  sub_100027964(v31, &qword_1000D0570);
  sub_100007618(v44);
  sub_100027964(v24, &qword_1000D0C20);
  sub_100027964(v42, &qword_1000D1538);
  return v34;
}

id sub_10009CCB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, __int128 a9, uint64_t a10)
{
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  id v22;
  __int128 v24;
  int v25;
  _QWORD v26[3];
  uint64_t v27;
  _UNKNOWN **v28;

  v25 = a8;
  v24 = a9;
  v27 = type metadata accessor for SportsPerformanceMeasurement(0);
  v28 = &off_1000C98C8;
  v26[0] = a7;
  v17 = (char *)objc_allocWithZone((Class)type metadata accessor for ApsMessageProcessingOperation(0));
  v18 = sub_10000AE58((uint64_t)v26, v27);
  __chkstk_darwin(v18);
  v20 = (uint64_t *)((char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v21 + 16))(v20);
  v22 = sub_10009CA20(a1, a2, a3, a4, a5, a6, *v20, v25, v24, *((uint64_t *)&v24 + 1), a10, v17);
  sub_100007618(v26);
  return v22;
}

uint64_t sub_10009CDE0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10009CE0C()
{
  uint64_t v0;

  return sub_10009C4B8(*(void **)(v0 + 16), *(uint64_t (**)(void))(v0 + 24));
}

uint64_t sub_10009CE18(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10009CE28(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10009CE30(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

uint64_t sub_10009CE40(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000738C(&qword_1000D1538);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10009CE88(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000738C(&qword_1000D0C20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

