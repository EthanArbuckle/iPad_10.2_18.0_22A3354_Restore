_UNKNOWN **static CharacteristicKind.allCases.getter()
{
  return &off_100035A80;
}

unint64_t CharacteristicKind.rawValue.getter(unsigned __int8 a1)
{
  return ((unint64_t (*)())((char *)sub_100003D80 + 4 * word_100026BF0[a1]))();
}

unint64_t sub_100003D80()
{
  return 0xD000000000000024;
}

uint64_t sub_1000045AC@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO8rawValueACSgSS_tcfC_0(*a1, a1[1]);
  *a2 = result;
  return result;
}

unint64_t sub_1000045D8@<X0>(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;
  unint64_t result;
  uint64_t v4;

  result = CharacteristicKind.rawValue.getter(*v1);
  *a1 = 0xD000000000000024;
  a1[1] = v4;
  return result;
}

uint64_t sub_100004608(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v2 = *a2;
  CharacteristicKind.rawValue.getter(*a1);
  v4 = v3;
  CharacteristicKind.rawValue.getter(v2);
  if (v4 == v5)
  {
    v7 = 1;
    v6 = v4;
  }
  else
  {
    v6 = v5;
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000024, v4, 0xD000000000000024, v5, 0);
  }
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v6);
  return v7 & 1;
}

void sub_100004690(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_1000046E0(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_100004774 + 4 * byte_100026D52[a2]))(0x61746E6563726570);
}

uint64_t sub_100004774(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x61746E6563726570 && v1 == 0xEA00000000006567)
    v2 = 1;
  else
    v2 = ((uint64_t (*)(void))_stringCompareWithSmolCheck(_:_:expecting:))();
  ((void (*)(uint64_t))swift_bridgeObjectRelease)(v1);
  ((void (*)(unint64_t))swift_bridgeObjectRelease)(0xEA00000000006567);
  return v2 & 1;
}

void sub_100004858(_QWORD *a1@<X8>)
{
  *a1 = &off_100035A80;
}

uint64_t sub_100004868(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO1loiySbAC_ACtFZ_0(*a1, *a2);
}

BOOL sub_100004878(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return (_s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO1loiySbAC_ACtFZ_0(*a2, *a1) & 1) == 0;
}

BOOL sub_1000048A0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return (_s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO1loiySbAC_ACtFZ_0(*a1, *a2) & 1) == 0;
}

uint64_t sub_1000048C4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO1loiySbAC_ACtFZ_0(*a2, *a1);
}

Swift::Int sub_1000048D4()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[9];

  v1 = *v0;
  Hasher.init(_seed:)(v5, 0);
  CharacteristicKind.rawValue.getter(v1);
  v3 = v2;
  String.hash(into:)(v5, 0xD000000000000024, v2);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

void sub_100004934(char a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, 0);
  __asm { BR              X10 }
}

Swift::Int sub_100004984()
{
  uint64_t v1;

  ((void (*)(uint64_t *, uint64_t, unint64_t))String.hash(into:))(&v1, 0x61746E6563726570, 0xEA00000000006567);
  ((void (*)(unint64_t))swift_bridgeObjectRelease)(0xEA00000000006567);
  return Hasher._finalize()();
}

uint64_t sub_100004A24(uint64_t a1)
{
  unsigned __int8 *v1;
  uint64_t v3;
  uint64_t v4;

  CharacteristicKind.rawValue.getter(*v1);
  v4 = v3;
  String.hash(into:)(a1, 0xD000000000000024, v3);
  return swift_bridgeObjectRelease(v4);
}

Swift::Int sub_100004A64(uint64_t a1)
{
  unsigned __int8 *v1;
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[9];

  v2 = *v1;
  Hasher.init(_seed:)(v6, a1);
  CharacteristicKind.rawValue.getter(v2);
  v4 = v3;
  String.hash(into:)(v6, 0xD000000000000024, v3);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

void sub_100004AC0(uint64_t a1, char a2)
{
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, a1);
  __asm { BR              X10 }
}

Swift::Int sub_100004B0C()
{
  uint64_t v1;

  ((void (*)(uint64_t *, uint64_t, unint64_t))String.hash(into:))(&v1, 0x61746E6563726570, 0xEA00000000006567);
  ((void (*)(unint64_t))swift_bridgeObjectRelease)(0xEA00000000006567);
  return Hasher._finalize()();
}

uint64_t sub_100004BAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_100012408();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_100004C08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_100012408();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

uint64_t CharacteristicKind.description.getter(unsigned __int8 a1)
{
  uint64_t v2;
  _QWORD *v3;
  unint64_t v4;
  char v5;
  unint64_t v6;

  if (qword_10003D5C0 != -1)
    swift_once(&qword_10003D5C0, sub_100004EA4);
  v2 = 0x6E776F6E6B6E75;
  v3 = off_10003D5C8;
  if (*((_QWORD *)off_10003D5C8 + 2))
  {
    v4 = sub_10000A448(a1);
    if ((v5 & 1) != 0)
    {
      v6 = v3[7] + (v4 << 6);
      v2 = *(_QWORD *)(v6 + 8);
      swift_bridgeObjectRetain(*(_QWORD *)(v6 + 16));
    }
  }
  return v2;
}

uint64_t sub_100004CF0()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;
  uint64_t v2;
  _QWORD *v3;
  unint64_t v4;
  char v5;
  unint64_t v6;

  v1 = *v0;
  if (qword_10003D5C0 != -1)
    swift_once(&qword_10003D5C0, sub_100004EA4);
  v2 = 0x6E776F6E6B6E75;
  v3 = off_10003D5C8;
  if (*((_QWORD *)off_10003D5C8 + 2))
  {
    v4 = sub_10000A448(v1);
    if ((v5 & 1) != 0)
    {
      v6 = v3[7] + (v4 << 6);
      v2 = *(_QWORD *)(v6 + 8);
      swift_bridgeObjectRetain(*(_QWORD *)(v6 + 16));
    }
  }
  return v2;
}

uint64_t static CharacteristicKind.info(for:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  unsigned __int8 v2;
  _QWORD *v4;
  __int128 v5;
  char v6;
  unsigned __int8 *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  __int128 v14;

  v2 = result;
  if (qword_10003D5C0 != -1)
    result = swift_once(&qword_10003D5C0, sub_100004EA4);
  v4 = off_10003D5C8;
  v5 = 0uLL;
  if (*((_QWORD *)off_10003D5C8 + 2))
  {
    result = sub_10000A448(v2);
    if ((v6 & 1) != 0)
    {
      v7 = (unsigned __int8 *)(v4[7] + (result << 6));
      v8 = *v7;
      v10 = *((_QWORD *)v7 + 1);
      v9 = *((_QWORD *)v7 + 2);
      v11 = *((_QWORD *)v7 + 4);
      v12 = *((unsigned int *)v7 + 10) | ((unint64_t)v7[44] << 32);
      v14 = *((_OWORD *)v7 + 3);
      v13 = *((unsigned __int16 *)v7 + 12);
      swift_bridgeObjectRetain(v9);
      result = sub_10000D2D8(v11, v12);
      v5 = v14;
    }
    else
    {
      v8 = 0;
      v10 = 0;
      v9 = 0;
      v13 = 0;
      v11 = 0;
      v12 = 0;
      v5 = 0uLL;
    }
  }
  else
  {
    v8 = 0;
    v10 = 0;
    v9 = 0;
    v13 = 0;
    v11 = 0;
    v12 = 0;
  }
  *(_QWORD *)a2 = v8;
  *(_QWORD *)(a2 + 8) = v10;
  *(_QWORD *)(a2 + 16) = v9;
  *(_QWORD *)(a2 + 24) = v13;
  *(_QWORD *)(a2 + 32) = v11;
  *(_QWORD *)(a2 + 40) = v12;
  *(_OWORD *)(a2 + 48) = v5;
  return result;
}

uint64_t sub_100004EA4()
{
  void *v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  char *v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  uint64_t v21;
  void *v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  _OWORD v39[2];
  _OWORD v40[2];

  if (qword_10003D5E8 != -1)
    swift_once(&qword_10003D5E8, sub_100013968);
  v0 = (void *)static DataModel.defaultMetadataPlist;
  v29 = 0x6574636172616843;
  v30 = 0xEF73636974736972;
  v1 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v29, &type metadata for String);
  v2 = objc_msgSend(v0, "__swift_objectForKeyedSubscript:", v1);
  v3 = swift_unknownObjectRelease(v1);
  if (v2)
  {
    v4 = 0;
    _bridgeAnyObjectToAny(_:)(v39, v2);
    swift_unknownObjectRelease(v2);
    sub_10000D438(v39, v40);
    v5 = sub_10000D3B8(&qword_10003DAA8);
    swift_dynamicCast(&v38, v40, (char *)&type metadata for Any + 8, v5, 7);
    v6 = v38;
    v25 = *(_QWORD *)(v38 + 16);
    if (v25)
    {
      swift_bridgeObjectRetain(v38);
      v7 = 0;
      v28 = (char *)&_swiftEmptyArrayStorage;
      v24 = v6;
      do
      {
        v9 = *(_QWORD *)(v6 + 8 * v7 + 32);
        v37 = v9;
        swift_bridgeObjectRetain(v9);
        sub_10000518C(&v37, &v29);
        swift_bridgeObjectRelease(v9);
        v10 = v32;
        if (v32)
        {
          v11 = v29;
          v12 = v30;
          v13 = v31;
          v15 = v33;
          v14 = v34;
          v16 = v35;
          v26 = v36;
          v27 = v4;
          if ((swift_isUniquelyReferenced_nonNull_native(v28) & 1) != 0)
            v17 = v28;
          else
            v17 = sub_10000A320(0, *((_QWORD *)v28 + 2) + 1, 1, v28);
          v19 = *((_QWORD *)v17 + 2);
          v18 = *((_QWORD *)v17 + 3);
          if (v19 >= v18 >> 1)
            v17 = sub_10000A320((char *)(v18 > 1), v19 + 1, 1, v17);
          *((_QWORD *)v17 + 2) = v19 + 1;
          v28 = v17;
          v8 = &v17[72 * v19];
          v8[32] = v11;
          v8[40] = v12;
          *((_QWORD *)v8 + 6) = v13;
          *((_QWORD *)v8 + 7) = v10;
          *((_WORD *)v8 + 32) = v15;
          *((_QWORD *)v8 + 9) = v14;
          v8[84] = BYTE4(v16);
          *((_DWORD *)v8 + 20) = v16;
          *(_OWORD *)(v8 + 88) = v26;
          v4 = v27;
          v6 = v24;
        }
        ++v7;
      }
      while (v25 != v7);
      swift_bridgeObjectRelease(v6);
      v20 = v28;
    }
    else
    {
      v20 = (char *)&_swiftEmptyArrayStorage;
    }
    swift_bridgeObjectRelease(v6);
    v21 = *((_QWORD *)v20 + 2);
    if (v21)
    {
      sub_10000D3B8(&qword_10003DAB0);
      v22 = (void *)static _DictionaryStorage.allocate(capacity:)(v21);
    }
    else
    {
      v22 = &_swiftEmptyDictionarySingleton;
    }
    v29 = (uint64_t)v22;
    sub_10000CF30((uint64_t)v20, 1, &v29);
    result = swift_bridgeObjectRelease(v20);
    off_10003D5C8 = (_UNKNOWN *)v29;
  }
  else
  {
    __break(1u);
    swift_bridgeObjectRelease(v3);
    result = swift_release(v29);
    __break(1u);
  }
  return result;
}

void sub_10000518C(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  char v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unsigned __int8 v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  unsigned __int8 v27;
  unsigned __int8 v28;
  unint64_t v29;
  char v30;
  Swift::String v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  unsigned __int8 v50;
  uint64_t v51;
  unint64_t v52;
  unsigned __int8 v53;
  Swift::String v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v3 = *a1;
  if (*(_QWORD *)(*a1 + 16))
  {
    v4 = sub_10000A4BC(1145656661, 0xE400000000000000);
    if ((v5 & 1) != 0)
    {
      v54._countAndFlagsBits = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v4);
      swift_unknownObjectRetain(v54._countAndFlagsBits);
      if ((swift_dynamicCast(&v56, &v54, (char *)&type metadata for Swift.AnyObject + 8, &type metadata for String, 6) & 1) != 0)
      {
        v6 = _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO8rawValueACSgSS_tcfC_0(v56, v57);
        if (v6 != 174)
        {
          if (*(_QWORD *)(v3 + 16))
          {
            v20 = v6;
            v21 = sub_10000A4BC(1701667150, 0xE400000000000000);
            if ((v22 & 1) != 0)
            {
              v58 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v21);
              swift_unknownObjectRetain(v58);
              swift_dynamicCast(&v56, &v58, (char *)&type metadata for Swift.AnyObject + 8, &type metadata for String, 7);
              if (*(_QWORD *)(v3 + 16))
              {
                v23 = v56;
                v24 = v57;
                v25 = sub_10000A4BC(0x74616D726F46, 0xE600000000000000);
                if ((v26 & 1) != 0)
                {
                  v55 = *(void **)(*(_QWORD *)(v3 + 56) + 8 * v25);
                  swift_unknownObjectRetain(v55);
                  swift_dynamicCast(&v54, &v55, (char *)&type metadata for Swift.AnyObject + 8, &type metadata for String, 7);
                  v27 = _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO6FormatO8rawValueAESgSS_tcfC_0(v54);
                  if (v27 != 11)
                  {
                    v28 = v27;
                    if (*(_QWORD *)(v3 + 16)
                      && (v29 = sub_10000A4BC(1953066581, 0xE400000000000000), (v30 & 1) != 0)
                      && (v55 = *(void **)(*(_QWORD *)(v3 + 56) + 8 * v29),
                          swift_unknownObjectRetain(v55),
                          swift_dynamicCast(&v54, &v55, (char *)&type metadata for Swift.AnyObject + 8, &type metadata for String, 6)))
                    {
                      v31 = v54;
                    }
                    else
                    {
                      v31._countAndFlagsBits = 0;
                      v31._object = (void *)0xE000000000000000;
                    }
                    v50 = _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO4UnitO8rawValueAESgSS_tcfC_0(v31);
                    if (*(_QWORD *)(v3 + 16)
                      && (v32 = sub_10000A4BC(0x69617274736E6F43, 0xEB0000000073746ELL), (v33 & 1) != 0))
                    {
                      v54._countAndFlagsBits = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v32);
                      swift_unknownObjectRetain(v54._countAndFlagsBits);
                      v34 = sub_10000D3B8(&qword_10003DAD8);
                      if (swift_dynamicCast(&v55, &v54, (char *)&type metadata for Swift.AnyObject + 8, v34, 6))v35 = (uint64_t)v55;
                      else
                        v35 = 0;
                    }
                    else
                    {
                      v35 = 0;
                    }
                    v36 = sub_10000C83C(v35);
                    v51 = v37;
                    v52 = v36;
                    v53 = v28;
                    if (*(_QWORD *)(v3 + 16)
                      && (v38 = sub_10000A4BC(0x697373696D726550, 0xEB00000000736E6FLL), (v39 & 1) != 0))
                    {
                      v40 = v24;
                      v54._countAndFlagsBits = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v38);
                      swift_unknownObjectRetain(v54._countAndFlagsBits);
                      v41 = sub_10000D3B8(&qword_10003DAD0);
                      if (swift_dynamicCast(&v55, &v54, (char *)&type metadata for Swift.AnyObject + 8, v41, 6))
                      {
                        v42 = v23;
                        v43 = v55;
                        goto LABEL_37;
                      }
                    }
                    else
                    {
                      v40 = v24;
                    }
                    v42 = v23;
                    v43 = &_swiftEmptyArrayStorage;
LABEL_37:
                    v44 = sub_10000CB64((uint64_t)v43);
                    swift_bridgeObjectRelease(v43);
                    if (*(_QWORD *)(v3 + 16)
                      && (v45 = sub_10000A4BC(0x69747265706F7250, 0xEA00000000007365), (v46 & 1) != 0)
                      && (v54._countAndFlagsBits = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v45),
                          swift_unknownObjectRetain(v54._countAndFlagsBits),
                          v47 = sub_10000D3B8(&qword_10003DAD0),
                          swift_dynamicCast(&v55, &v54, (char *)&type metadata for Swift.AnyObject + 8, v47, 6)))
                    {
                      v48 = v55;
                    }
                    else
                    {
                      v48 = &_swiftEmptyArrayStorage;
                    }
                    v49 = sub_10000CC88((uint64_t)v48);
                    swift_bridgeObjectRelease(v48);
                    *a2 = v20;
                    a2[1] = v20;
                    a2[2] = v42;
                    a2[3] = v40;
                    a2[4] = v53 | ((unint64_t)v50 << 8);
                    a2[5] = v52;
                    a2[6] = v51 & 0xFFFFFFFFFFLL;
                    a2[7] = v44;
                    a2[8] = v49;
                    return;
                  }
LABEL_47:
                  __break(1u);
                  return;
                }
LABEL_46:
                __break(1u);
                goto LABEL_47;
              }
LABEL_45:
              __break(1u);
              goto LABEL_46;
            }
          }
          else
          {
            __break(1u);
          }
          __break(1u);
          goto LABEL_45;
        }
      }
    }
  }
  if (qword_10003D5F0 != -1)
    swift_once(&qword_10003D5F0, sub_100013BA4);
  v7 = type metadata accessor for Logger(0);
  sub_100012570(v7, (uint64_t)static DataModel.widgetLogger);
  v8 = swift_bridgeObjectRetain_n(v3, 2);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(12, -1);
    v12 = swift_slowAlloc(32, -1);
    v56 = v12;
    *(_DWORD *)v11 = 136315138;
    if (*(_QWORD *)(v3 + 16) && (v13 = sub_10000A4BC(1145656661, 0xE400000000000000), (v14 & 1) != 0))
      v15 = swift_unknownObjectRetain(*(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v13));
    else
      v15 = 0;
    v54._countAndFlagsBits = v15;
    v16 = sub_10000D3B8(&qword_10003DAC8);
    v17 = String.init<A>(describing:)(&v54, v16);
    v19 = v18;
    v54._countAndFlagsBits = sub_100013F1C(v17, v18, &v56);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v54, &v54._object, v11 + 4, v11 + 12);
    swift_bridgeObjectRelease_n(v3, 2);
    swift_bridgeObjectRelease(v19);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "missing characteristic %s", v11, 0xCu);
    swift_arrayDestroy(v12, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1, -1);
    swift_slowDealloc(v11, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v3, 2);
  }
  a2[8] = 0;
  *((_OWORD *)a2 + 2) = 0u;
  *((_OWORD *)a2 + 3) = 0u;
  *(_OWORD *)a2 = 0u;
  *((_OWORD *)a2 + 1) = 0u;
}

uint64_t CharacteristicKind.valueFormat.getter(unsigned __int8 a1)
{
  _QWORD *v2;
  unint64_t v3;
  char v4;

  if (qword_10003D5C0 != -1)
    swift_once(&qword_10003D5C0, sub_100004EA4);
  v2 = off_10003D5C8;
  if (*((_QWORD *)off_10003D5C8 + 2) && (v3 = sub_10000A448(a1), (v4 & 1) != 0))
    return *(unsigned __int8 *)(v2[7] + (v3 << 6) + 24);
  else
    return 11;
}

uint64_t CharacteristicKind.Value.id.getter(uint64_t a1, unint64_t a2, char a3)
{
  sub_10000D300(a1, a2, a3);
  return a1;
}

uint64_t static CharacteristicKind.Value.typedValue(for:valueFormat:)(uint64_t a1, char a2)
{
  int v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  __int16 v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  __int16 v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  char v27;
  uint64_t v29[2];
  _OWORD v30[2];
  uint64_t v31;
  unint64_t v32;
  __int128 v33;
  uint64_t v34;
  _OWORD v35[2];

  sub_10000D370(a1, (uint64_t)&v33);
  if (v34)
  {
    sub_10000D438(&v33, v35);
    sub_10000D448((uint64_t)v35, (uint64_t)&v33);
    if (swift_dynamicCast(&v31, &v33, (char *)&type metadata for Any + 8, &type metadata for Int, 0))
    {
      sub_10000D448((uint64_t)v35, (uint64_t)v30);
      v3 = swift_dynamicCast(v29, v30, (char *)&type metadata for Any + 8, &type metadata for Int, 6);
      v4 = v29[0];
      if (!v3)
        v4 = 0;
      v5 = v3 ^ 1;
LABEL_6:
      v6 = sub_1000062EC(v4, v5, a2);
LABEL_54:
      v7 = v6;
      sub_10001244C(v35);
LABEL_55:
      sub_10001244C(&v33);
      return v7;
    }
    if (swift_dynamicCast(&v31, &v33, (char *)&type metadata for Any + 8, &type metadata for Int8, 0))
    {
      sub_10000D448((uint64_t)v35, (uint64_t)v30);
      v8 = swift_dynamicCast(v29, v30, (char *)&type metadata for Any + 8, &type metadata for Int8, 6);
      v9 = LOBYTE(v29[0]);
      if (!v8)
        v9 = 0;
      v6 = sub_100005E98(v9 | (unsigned __int16)(((unsigned __int16)v8 ^ 1) << 8), a2);
      goto LABEL_54;
    }
    if (swift_dynamicCast(&v31, &v33, (char *)&type metadata for Any + 8, &type metadata for Int16, 0))
    {
      sub_10000D448((uint64_t)v35, (uint64_t)v30);
      v10 = swift_dynamicCast(v29, v30, (char *)&type metadata for Any + 8, &type metadata for Int16, 6);
      v11 = LOWORD(v29[0]);
      if (!v10)
        v11 = 0;
      v6 = sub_100005FF4(v11 | ((v10 ^ 1u) << 16), a2);
      goto LABEL_54;
    }
    if (swift_dynamicCast(&v31, &v33, (char *)&type metadata for Any + 8, &type metadata for Int32, 0))
    {
      sub_10000D448((uint64_t)v35, (uint64_t)v30);
      v12 = swift_dynamicCast(v29, v30, (char *)&type metadata for Any + 8, &type metadata for Int32, 6);
      v13 = LODWORD(v29[0]);
      LOBYTE(v29[0]) = v12 ^ 1;
      if (!v12)
        v13 = 0;
      v6 = sub_100006178(v13 | ((unint64_t)(v12 ^ 1u) << 32), a2);
      goto LABEL_54;
    }
    if (swift_dynamicCast(&v31, &v33, (char *)&type metadata for Any + 8, &type metadata for Int64, 0))
    {
      sub_10000D448((uint64_t)v35, (uint64_t)v30);
      v14 = swift_dynamicCast(v29, v30, (char *)&type metadata for Any + 8, &type metadata for Int64, 6);
      v4 = v29[0];
      if (!v14)
        v4 = 0;
      v5 = v14 ^ 1;
      goto LABEL_6;
    }
    if (swift_dynamicCast(&v31, &v33, (char *)&type metadata for Any + 8, &type metadata for UInt8, 0))
    {
      sub_10000D448((uint64_t)v35, (uint64_t)v30);
      v15 = swift_dynamicCast(v29, v30, (char *)&type metadata for Any + 8, &type metadata for UInt8, 6);
      v16 = LOBYTE(v29[0]);
      if (!v15)
        v16 = 0;
      v6 = sub_100006468(v16 | (unsigned __int16)(((unsigned __int16)v15 ^ 1) << 8), a2);
      goto LABEL_54;
    }
    if (swift_dynamicCast(&v31, &v33, (char *)&type metadata for Any + 8, &type metadata for UInt16, 0))
    {
      sub_10000D448((uint64_t)v35, (uint64_t)v30);
      v17 = swift_dynamicCast(v29, v30, (char *)&type metadata for Any + 8, &type metadata for UInt16, 6);
      v18 = LOWORD(v29[0]);
      if (!v17)
        v18 = 0;
      v6 = sub_100006568(v18 | ((v17 ^ 1u) << 16), a2);
      goto LABEL_54;
    }
    if (swift_dynamicCast(&v31, &v33, (char *)&type metadata for Any + 8, &type metadata for UInt32, 0))
    {
      sub_10000D448((uint64_t)v35, (uint64_t)v30);
      v19 = swift_dynamicCast(v29, v30, (char *)&type metadata for Any + 8, &type metadata for UInt32, 6);
      v20 = LODWORD(v29[0]);
      LOBYTE(v29[0]) = v19 ^ 1;
      if (!v19)
        v20 = 0;
      v6 = sub_100006674(v20 | ((unint64_t)(v19 ^ 1u) << 32), a2);
      goto LABEL_54;
    }
    if (swift_dynamicCast(&v31, &v33, (char *)&type metadata for Any + 8, &type metadata for UInt64, 0))
    {
      sub_10000D448((uint64_t)v35, (uint64_t)v30);
      v21 = swift_dynamicCast(v29, v30, (char *)&type metadata for Any + 8, &type metadata for UInt64, 6);
      v22 = v29[0];
      if (!v21)
        v22 = 0;
      v6 = sub_100006794(v22, v21 ^ 1u, a2);
      goto LABEL_54;
    }
    if (swift_dynamicCast(&v31, &v33, (char *)&type metadata for Any + 8, &type metadata for Float, 0))
    {
      sub_10000D448((uint64_t)v35, (uint64_t)v30);
      v23 = swift_dynamicCast(v29, v30, (char *)&type metadata for Any + 8, &type metadata for Float, 6);
      v24 = LODWORD(v29[0]);
      LOBYTE(v29[0]) = v23 ^ 1;
      if (!v23)
        v24 = 0;
      v6 = sub_1000068B0(v24 | ((unint64_t)(v23 ^ 1u) << 32), a2);
      goto LABEL_54;
    }
    if (swift_dynamicCast(&v31, &v33, (char *)&type metadata for Any + 8, &type metadata for Double, 0))
    {
      sub_10000D448((uint64_t)v35, (uint64_t)v30);
      v25 = swift_dynamicCast(v29, v30, (char *)&type metadata for Any + 8, &type metadata for Double, 6);
      v26 = v29[0];
      if (!v25)
        v26 = 0;
      v6 = sub_100006B28(v26, v25 ^ 1u, a2);
      goto LABEL_54;
    }
    if (swift_dynamicCast(&v31, &v33, (char *)&type metadata for Any + 8, &type metadata for Bool, 0))
    {
      sub_10000D448((uint64_t)v35, (uint64_t)v30);
      if (swift_dynamicCast(v29, v30, (char *)&type metadata for Any + 8, &type metadata for Bool, 6))
        v27 = v29[0];
      else
        v27 = 2;
      v6 = sub_10000D9D0(v27, a2);
      goto LABEL_54;
    }
    if (swift_dynamicCast(&v31, &v33, (char *)&type metadata for Any + 8, &type metadata for String, 0))
    {
      swift_bridgeObjectRelease(v32);
      sub_10000D438(v35, v30);
      if ((swift_dynamicCast(v29, v30, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
      {
        v7 = v29[0];
        goto LABEL_55;
      }
LABEL_67:
      v7 = 0;
      goto LABEL_55;
    }
    if (swift_dynamicCast(&v31, &v33, (char *)&type metadata for Any + 8, &type metadata for Data, 0))
    {
      sub_10000D484(v31, v32);
      sub_10000D438(v35, v30);
      if ((swift_dynamicCast(v29, v30, (char *)&type metadata for Any + 8, &type metadata for Data, 6) & 1) != 0)
      {
        v7 = v29[0];
        if (a2 == 10 || a2 == 9)
          goto LABEL_55;
        sub_10000D484(v29[0], v29[1]);
      }
      goto LABEL_67;
    }
    sub_10001244C(v35);
    sub_10001244C(&v33);
  }
  else
  {
    sub_10000D3F8((uint64_t)&v33);
  }
  return 0;
}

uint64_t sub_100005E98(__int16 a1, char a2)
{
  if ((a1 & 0x100) == 0)
    __asm { BR              X11 }
  return 0;
}

void sub_100005F08()
{
  JUMPOUT(0x100005EF8);
}

void sub_100005F1C()
{
  JUMPOUT(0x100005EF8);
}

void sub_100005F34()
{
  JUMPOUT(0x100005EF8);
}

void sub_100005F4C()
{
  JUMPOUT(0x100005EF8);
}

void sub_100005F60()
{
  JUMPOUT(0x100005EF8);
}

void sub_100005F74(char a1@<W8>)
{
  if (a1 < 0)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Negative value is not representable", 35, 2, "Swift/Integers.swift", 20);
    __break(1u);
  }
  JUMPOUT(0x100005EF8);
}

uint64_t sub_100005FF4(int a1, char a2)
{
  if ((a1 & 0x10000) == 0)
    __asm { BR              X11 }
  return 0;
}

void sub_100006060()
{
  JUMPOUT(0x100006050);
}

void sub_100006074()
{
  JUMPOUT(0x100006050);
}

void sub_10000608C()
{
  JUMPOUT(0x100006050);
}

void sub_1000060A4()
{
  JUMPOUT(0x100006050);
}

void sub_1000060E0()
{
  JUMPOUT(0x100006050);
}

void sub_1000060F8(__int16 a1@<W8>)
{
  if (a1 < 0)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Negative value is not representable", 35, 2, "Swift/Integers.swift", 20);
    __break(1u);
  }
  JUMPOUT(0x100006050);
}

uint64_t sub_100006178(uint64_t a1, char a2)
{
  if ((a1 & 0x100000000) == 0)
    __asm { BR              X11 }
  return 0;
}

void sub_1000061E4()
{
  JUMPOUT(0x1000061D4);
}

void sub_10000625C()
{
  JUMPOUT(0x1000061D4);
}

void sub_10000626C(int a1@<W8>)
{
  if (a1 < 0)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Negative value is not representable", 35, 2, "Swift/Integers.swift", 20);
    __break(1u);
  }
  JUMPOUT(0x1000061D4);
}

uint64_t sub_1000062EC(uint64_t a1, char a2, char a3)
{
  if ((a2 & 1) == 0)
    __asm { BR              X11 }
  return 0;
}

void sub_100006374()
{
  JUMPOUT(0x100006364);
}

void sub_100006390()
{
  JUMPOUT(0x100006364);
}

void sub_1000063A4()
{
  JUMPOUT(0x100006364);
}

void sub_1000063B8()
{
  JUMPOUT(0x100006364);
}

void sub_1000063D4()
{
  JUMPOUT(0x100006364);
}

void sub_1000063F0(uint64_t a1@<X8>)
{
  if (a1 < 0)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Negative value is not representable", 35, 2, "Swift/Integers.swift", 20);
    __break(1u);
  }
  JUMPOUT(0x100006364);
}

uint64_t sub_100006468(__int16 a1, unsigned __int8 a2)
{
  if ((a1 & 0x100) != 0)
    return 0;
  else
    return ((uint64_t (*)(_QWORD, _QWORD, uint64_t))((char *)sub_100006498 + 4 * byte_100026D90[a2]))(0, 0, 255);
}

uint64_t sub_100006498@<X0>(unsigned __int8 a1@<W8>)
{
  return a1;
}

BOOL sub_1000064B8@<W0>(char a1@<W8>)
{
  return a1 == 1;
}

uint64_t sub_1000064D0@<X0>(unsigned __int8 a1@<W8>)
{
  return a1;
}

uint64_t sub_1000064E0@<X0>(unsigned __int8 a1@<W8>)
{
  return a1;
}

uint64_t sub_1000064F0@<X0>(unsigned __int8 a1@<W8>)
{
  return a1;
}

uint64_t sub_100006500@<X0>(unsigned __int8 a1@<W8>)
{
  return a1;
}

double sub_100006510@<D0>(unsigned __int8 a1@<W8>)
{
  return (double)a1;
}

uint64_t sub_100006528()
{
  return dispatch thunk of CustomStringConvertible.description.getter(&type metadata for UInt8, &protocol witness table for UInt8);
}

uint64_t sub_100006568(int a1, unsigned __int8 a2)
{
  if ((a1 & 0x10000) != 0)
    return 0;
  else
    return ((uint64_t (*)(_QWORD, _QWORD, uint64_t))((char *)sub_100006598 + 4 * byte_100026D9B[a2]))(0, 0, 255);
}

uint64_t sub_100006598@<X0>(unsigned __int16 a1@<W8>)
{
  return a1;
}

BOOL sub_1000065B8@<W0>(__int16 a1@<W8>)
{
  return a1 == 1;
}

uint64_t sub_1000065D0@<X0>(__int16 a1@<W8>)
{
  if ((a1 & 0xFF00) != 0)
    return 255;
  else
    return a1;
}

uint64_t sub_1000065EC@<X0>(unsigned __int16 a1@<W8>)
{
  return a1;
}

uint64_t sub_1000065FC@<X0>(unsigned __int16 a1@<W8>)
{
  return a1;
}

uint64_t sub_10000660C@<X0>(unsigned __int16 a1@<W8>)
{
  return a1;
}

double sub_10000661C@<D0>(unsigned __int16 a1@<W8>)
{
  return (double)a1;
}

uint64_t sub_100006634()
{
  return dispatch thunk of CustomStringConvertible.description.getter(&type metadata for UInt16, &protocol witness table for UInt16);
}

uint64_t sub_100006674(uint64_t a1, unsigned __int8 a2)
{
  if ((a1 & 0x100000000) != 0)
    return 0;
  else
    return ((uint64_t (*)(_QWORD, _QWORD, uint64_t))((char *)&loc_1000066A4 + 4 * byte_100026DA6[a2]))(0, 0, 255);
}

BOOL sub_1000066CC@<W0>(int a1@<W8>)
{
  return a1 == 1;
}

uint64_t sub_1000066E0@<X0>(unsigned int a1@<W8>)
{
  if (a1 <= 0xFF)
    return a1;
  else
    return 255;
}

uint64_t sub_1000066FC@<X0>(unsigned int a1@<W8>)
{
  if (HIWORD(a1))
    return 0xFFFFLL;
  else
    return (unsigned __int16)a1;
}

uint64_t sub_10000671C@<X0>(unsigned int a1@<W8>)
{
  return a1;
}

uint64_t sub_10000672C@<X0>(unsigned int a1@<W8>)
{
  return a1;
}

double sub_10000673C@<D0>(unsigned int a1@<W8>)
{
  return (double)a1;
}

uint64_t sub_100006754()
{
  return dispatch thunk of CustomStringConvertible.description.getter(&type metadata for UInt32, &protocol witness table for UInt32);
}

uint64_t sub_100006794(uint64_t a1, char a2, unsigned __int8 a3)
{
  if ((a2 & 1) != 0)
    return 0;
  else
    return ((uint64_t (*)(_QWORD, _QWORD, uint64_t))((char *)&loc_1000067C8 + 4 * byte_100026DB1[a3]))(0, 0, 255);
}

BOOL sub_1000067F0@<W0>(uint64_t a1@<X8>)
{
  return a1 == 1;
}

uint64_t sub_100006804@<X0>(unint64_t a1@<X8>)
{
  if (a1 >= 0xFF)
    return 255;
  else
    return a1;
}

uint64_t sub_10000681C@<X0>(unint64_t a1@<X8>)
{
  if (a1 >= 0xFFFF)
    return 0xFFFFLL;
  else
    return a1;
}

uint64_t sub_100006834@<X0>(unint64_t a1@<X8>)
{
  if (a1 >= 0xFFFFFFFF)
    return 0xFFFFFFFFLL;
  else
    return a1;
}

uint64_t sub_10000684C@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

double sub_10000685C@<D0>(unint64_t a1@<X8>)
{
  return (double)a1;
}

uint64_t sub_100006870()
{
  return dispatch thunk of CustomStringConvertible.description.getter(&type metadata for UInt64, &protocol witness table for UInt64);
}

uint64_t sub_1000068B0(uint64_t a1, char a2)
{
  if ((a1 & 0x100000000) == 0)
    __asm { BR              X11 }
  return 0;
}

void sub_10000694C(__n128 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  Swift::String v13;
  Swift::String v14;
  Swift::String v15;
  Swift::String v16;

  sub_10000A174((uint64_t)&a12, a1);
  if ((a13 & 1) != 0)
  {
    _StringGuts.grow(_:)(80);
    v13._countAndFlagsBits = 0x74616F6C46;
    v13._object = (void *)0xE500000000000000;
    String.append(_:)(v13);
    v14._object = (void *)0x800000010002C3F0;
    v14._countAndFlagsBits = 0xD00000000000001ELL;
    String.append(_:)(v14);
    v15._countAndFlagsBits = 7630409;
    v15._object = (void *)0xE300000000000000;
    String.append(_:)(v15);
    v16._countAndFlagsBits = 0xD00000000000002ELL;
    v16._object = (void *)0x800000010002C410;
    String.append(_:)(v16);
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "Swift/Integers.swift", 20, 2, 3071, 0);
    __break(1u);
  }
  JUMPOUT(0x10000693CLL);
}

void sub_10000697C()
{
  JUMPOUT(0x10000693CLL);
}

void sub_100006990()
{
  JUMPOUT(0x10000693CLL);
}

void sub_1000069A4(__n128 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  Swift::String v13;
  Swift::String v14;
  Swift::String v15;
  Swift::String v16;

  sub_10000A174((uint64_t)&a12, a1);
  if ((a13 & 1) != 0)
  {
    _StringGuts.grow(_:)(80);
    v13._countAndFlagsBits = 0x74616F6C46;
    v13._object = (void *)0xE500000000000000;
    String.append(_:)(v13);
    v14._object = (void *)0x800000010002C3F0;
    v14._countAndFlagsBits = 0xD00000000000001ELL;
    String.append(_:)(v14);
    v15._countAndFlagsBits = 7630409;
    v15._object = (void *)0xE300000000000000;
    String.append(_:)(v15);
    v16._countAndFlagsBits = 0xD00000000000002ELL;
    v16._object = (void *)0x800000010002C410;
    String.append(_:)(v16);
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "Swift/Integers.swift", 20, 2, 3071, 0);
    __break(1u);
  }
  JUMPOUT(0x10000693CLL);
}

void sub_1000069D4(__n128 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  Swift::String v13;
  Swift::String v14;
  Swift::String v15;
  Swift::String v16;

  sub_10000A174((uint64_t)&a12, a1);
  if ((a13 & 1) != 0)
  {
    _StringGuts.grow(_:)(80);
    v13._countAndFlagsBits = 0x74616F6C46;
    v13._object = (void *)0xE500000000000000;
    String.append(_:)(v13);
    v14._object = (void *)0x800000010002C3F0;
    v14._countAndFlagsBits = 0xD00000000000001ELL;
    String.append(_:)(v14);
    v15._countAndFlagsBits = 7630409;
    v15._object = (void *)0xE300000000000000;
    String.append(_:)(v15);
    v16._countAndFlagsBits = 0xD00000000000002ELL;
    v16._object = (void *)0x800000010002C410;
    String.append(_:)(v16);
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "Swift/Integers.swift", 20, 2, 3071, 0);
    __break(1u);
  }
  JUMPOUT(0x10000693CLL);
}

void sub_100006A04(__n128 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  Swift::String v13;
  Swift::String v14;
  Swift::String v15;
  Swift::String v16;

  sub_10000A174((uint64_t)&a12, a1);
  if ((a13 & 1) != 0)
  {
    _StringGuts.grow(_:)(80);
    v13._countAndFlagsBits = 0x74616F6C46;
    v13._object = (void *)0xE500000000000000;
    String.append(_:)(v13);
    v14._object = (void *)0x800000010002C3F0;
    v14._countAndFlagsBits = 0xD00000000000001ELL;
    String.append(_:)(v14);
    v15._countAndFlagsBits = 7630409;
    v15._object = (void *)0xE300000000000000;
    String.append(_:)(v15);
    v16._countAndFlagsBits = 0xD00000000000002ELL;
    v16._object = (void *)0x800000010002C410;
    String.append(_:)(v16);
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "Swift/Integers.swift", 20, 2, 3071, 0);
    __break(1u);
  }
  JUMPOUT(0x10000693CLL);
}

void sub_100006A28(int a1@<W8>, uint64_t a2, int a3, int a4, uint64_t a5, unint64_t a6)
{
  a5 = 0;
  a6 = 0xE000000000000000;
  a4 = a1;
  _print_unlocked<A, B>(_:_:)(&a4, &a5, &type metadata for Float, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  JUMPOUT(0x10000693CLL);
}

uint64_t sub_100006B28(uint64_t a1, char a2, char a3)
{
  if ((a2 & 1) == 0)
    __asm { BR              X11 }
  return 0;
}

void sub_100006BC8(__n128 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  Swift::String v15;
  Swift::String v16;
  Swift::String v17;
  Swift::String v18;

  sub_100009FF0((uint64_t)&a14, a1);
  if ((a15 & 1) != 0)
  {
    _StringGuts.grow(_:)(80);
    v15._countAndFlagsBits = 0x656C62756F44;
    v15._object = (void *)0xE600000000000000;
    String.append(_:)(v15);
    v16._object = (void *)0x800000010002C3F0;
    v16._countAndFlagsBits = 0xD00000000000001ELL;
    String.append(_:)(v16);
    v17._countAndFlagsBits = 7630409;
    v17._object = (void *)0xE300000000000000;
    String.append(_:)(v17);
    v18._countAndFlagsBits = 0xD00000000000002ELL;
    v18._object = (void *)0x800000010002C410;
    String.append(_:)(v18);
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "Swift/Integers.swift", 20, 2, 3071, 0);
    __break(1u);
  }
  JUMPOUT(0x100006BB8);
}

void sub_100006BF8()
{
  JUMPOUT(0x100006BB8);
}

void sub_100006C08()
{
  JUMPOUT(0x100006BB8);
}

void sub_100006C1C(__n128 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  Swift::String v15;
  Swift::String v16;
  Swift::String v17;
  Swift::String v18;

  sub_100009FF0((uint64_t)&a14, a1);
  if ((a15 & 1) != 0)
  {
    _StringGuts.grow(_:)(80);
    v15._countAndFlagsBits = 0x656C62756F44;
    v15._object = (void *)0xE600000000000000;
    String.append(_:)(v15);
    v16._object = (void *)0x800000010002C3F0;
    v16._countAndFlagsBits = 0xD00000000000001ELL;
    String.append(_:)(v16);
    v17._countAndFlagsBits = 7630409;
    v17._object = (void *)0xE300000000000000;
    String.append(_:)(v17);
    v18._countAndFlagsBits = 0xD00000000000002ELL;
    v18._object = (void *)0x800000010002C410;
    String.append(_:)(v18);
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "Swift/Integers.swift", 20, 2, 3071, 0);
    __break(1u);
  }
  JUMPOUT(0x100006BB8);
}

void sub_100006C4C(__n128 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  Swift::String v15;
  Swift::String v16;
  Swift::String v17;
  Swift::String v18;

  sub_100009FF0((uint64_t)&a14, a1);
  if ((a15 & 1) != 0)
  {
    _StringGuts.grow(_:)(80);
    v15._countAndFlagsBits = 0x656C62756F44;
    v15._object = (void *)0xE600000000000000;
    String.append(_:)(v15);
    v16._object = (void *)0x800000010002C3F0;
    v16._countAndFlagsBits = 0xD00000000000001ELL;
    String.append(_:)(v16);
    v17._countAndFlagsBits = 7630409;
    v17._object = (void *)0xE300000000000000;
    String.append(_:)(v17);
    v18._countAndFlagsBits = 0xD00000000000002ELL;
    v18._object = (void *)0x800000010002C410;
    String.append(_:)(v18);
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "Swift/Integers.swift", 20, 2, 3071, 0);
    __break(1u);
  }
  JUMPOUT(0x100006BB8);
}

void sub_100006C7C(__n128 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  Swift::String v15;
  Swift::String v16;
  Swift::String v17;
  Swift::String v18;

  sub_100009FF0((uint64_t)&a14, a1);
  if ((a15 & 1) != 0)
  {
    _StringGuts.grow(_:)(80);
    v15._countAndFlagsBits = 0x656C62756F44;
    v15._object = (void *)0xE600000000000000;
    String.append(_:)(v15);
    v16._object = (void *)0x800000010002C3F0;
    v16._countAndFlagsBits = 0xD00000000000001ELL;
    String.append(_:)(v16);
    v17._countAndFlagsBits = 7630409;
    v17._object = (void *)0xE300000000000000;
    String.append(_:)(v17);
    v18._countAndFlagsBits = 0xD00000000000002ELL;
    v18._object = (void *)0x800000010002C410;
    String.append(_:)(v18);
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "Swift/Integers.swift", 20, 2, 3071, 0);
    __break(1u);
  }
  JUMPOUT(0x100006BB8);
}

void sub_100006CA0(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
  a6 = 0;
  a7 = 0xE000000000000000;
  a5 = a1;
  _print_unlocked<A, B>(_:_:)(&a5, &a6, &type metadata for Double, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  JUMPOUT(0x100006BB8);
}

void CharacteristicKind.Value.description.getter(uint64_t a1, uint64_t a2, char a3)
{
  __asm { BR              X10 }
}

uint64_t sub_100006DEC()
{
  char v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  Swift::String v4;

  if ((v0 & 1) != 0)
    v1 = 1702195828;
  else
    v1 = 0x65736C6166;
  if ((v0 & 1) != 0)
    v2 = 0xE400000000000000;
  else
    v2 = 0xE500000000000000;
  v3 = v2;
  String.append(_:)(*(Swift::String *)&v1);
  ((void (*)(unint64_t))swift_bridgeObjectRelease)(v2);
  v4._countAndFlagsBits = 41;
  v4._object = (void *)0xE100000000000000;
  String.append(_:)(v4);
  return 0x286C6F6F622ELL;
}

void sub_100006F7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unint64_t a12)
{
  double v12;
  Swift::String v13;

  a11 = 0;
  a12 = 0xE000000000000000;
  v13._countAndFlagsBits = 0x2874616F6C662ELL;
  v13._object = (void *)0xE700000000000000;
  String.append(_:)(v13);
  Double.write<A>(to:)(&a11, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation, v12);
  JUMPOUT(0x100006F50);
}

void sub_100006FC4(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  void *v13;
  Swift::String v14;

  v14._countAndFlagsBits = v12;
  v14._object = v13;
  String.append(_:)(v14);
  JUMPOUT(0x100006F50);
}

void sub_100006FF0()
{
  uint64_t v0;
  unint64_t v1;
  Swift::String v2;
  void *object;
  Swift::String v4;

  sub_10000D300(v0, v1, 9);
  v2._countAndFlagsBits = Data.description.getter(v0, v1);
  object = v2._object;
  String.append(_:)(v2);
  swift_bridgeObjectRelease(object);
  v4._countAndFlagsBits = 41;
  v4._object = (void *)0xE100000000000000;
  String.append(_:)(v4);
  sub_10000DAFC(v0, v1, 9);
  JUMPOUT(0x100006F60);
}

void CharacteristicKind.Value.hash(into:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  __asm { BR              X10 }
}

void sub_1000070F8()
{
  char v0;

  Hasher._combine(_:)(1uLL);
  Hasher._combine(_:)(v0 & 1);
}

uint64_t static CharacteristicKind.Permissions.securedRead.getter()
{
  return 1;
}

uint64_t sub_100007240()
{
  return 12383;
}

uint64_t sub_100007250()
{
  return 0;
}

void sub_10000725C(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_100007268(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000DE7C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100007290(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000DE7C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000072B8(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1000072E4 + 4 * byte_100026DEA[a1]))(1819047278, 0xE400000000000000);
}

uint64_t sub_1000072E4()
{
  return 1819242338;
}

uint64_t sub_1000072F0()
{
  return 0x38746E6975;
}

uint64_t sub_100007304()
{
  return 0x3631746E6975;
}

uint64_t sub_100007318()
{
  return 0x3233746E6975;
}

uint64_t sub_10000732C()
{
  return 0x3436746E6975;
}

uint64_t sub_100007340()
{
  return 7630441;
}

uint64_t sub_100007350()
{
  return 0x3233746E69;
}

uint64_t sub_100007364()
{
  return 0x74616F6C66;
}

uint64_t sub_100007378()
{
  return 0x676E69727473;
}

uint64_t sub_10000738C()
{
  return 947285108;
}

uint64_t sub_100007398()
{
  return 1635017060;
}

uint64_t sub_1000073AC()
{
  unsigned __int8 *v0;

  return sub_1000072B8(*v0);
}

uint64_t sub_1000073B4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_10000DF04(a1, a2);
  *a3 = result;
  return result;
}

void sub_1000073D8(_BYTE *a1@<X8>)
{
  *a1 = 12;
}

uint64_t sub_1000073E4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000DB4C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000740C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000DB4C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100007434(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000DB90();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000745C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000DB90();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100007484(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000DCA0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000074AC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000DCA0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000074D4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000DCE4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000074FC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000DCE4();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100007524(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000DD28();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000754C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000DD28();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100007574()
{
  return 0;
}

uint64_t sub_100007580@<X0>(uint64_t a1@<X1>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease(a1);
  *a2 = 1;
  return result;
}

uint64_t sub_1000075AC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000DEC0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000075D4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000DEC0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000075FC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000DC5C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100007624(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000DC5C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000764C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000DC18();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100007674(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000DC18();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000769C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000DDF4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000076C4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000DDF4();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000076EC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000DDB0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100007714(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000DDB0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000773C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000DD6C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100007764(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000DD6C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000778C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000DE38();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000077B4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000DE38();
  return CodingKey.debugDescription.getter(a1, v2);
}

void CharacteristicKind.Value.encode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD v23[5];
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;

  v56 = a4;
  v51 = a3;
  v52 = a2;
  v5 = sub_10000D3B8(&qword_10003D658);
  v49 = *(_QWORD *)(v5 - 8);
  v50 = v5;
  __chkstk_darwin();
  v48 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_10000D3B8(&qword_10003D660);
  v46 = *(_QWORD *)(v7 - 8);
  v47 = v7;
  __chkstk_darwin();
  v45 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = sub_10000D3B8(&qword_10003D668);
  v23[1] = *(_QWORD *)(v44 - 8);
  __chkstk_darwin();
  v43 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_10000D3B8(&qword_10003D670);
  v41 = *(_QWORD *)(v10 - 8);
  v42 = v10;
  __chkstk_darwin();
  v40 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = sub_10000D3B8(&qword_10003D678);
  v38 = *(_QWORD *)(v39 - 8);
  __chkstk_darwin();
  v37 = (char *)v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = sub_10000D3B8(&qword_10003D680);
  v35 = *(_QWORD *)(v36 - 8);
  __chkstk_darwin();
  v34 = (char *)v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = sub_10000D3B8(&qword_10003D688);
  v32 = *(_QWORD *)(v33 - 8);
  __chkstk_darwin();
  v31 = (char *)v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = sub_10000D3B8(&qword_10003D690);
  v29 = *(_QWORD *)(v30 - 8);
  __chkstk_darwin();
  v28 = (char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_10000D3B8(&qword_10003D698);
  v26 = *(_QWORD *)(v27 - 8);
  __chkstk_darwin();
  v25 = (char *)v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_10000D3B8(&qword_10003D6A0);
  v23[4] = *(_QWORD *)(v24 - 8);
  __chkstk_darwin();
  v23[3] = (char *)v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23[2] = *(_QWORD *)(sub_10000D3B8(&qword_10003D6A8) - 8);
  __chkstk_darwin();
  sub_10000D3B8(&qword_10003D6B0);
  __chkstk_darwin();
  v55 = sub_10000D3B8(&qword_10003D6B8);
  v53 = *(_QWORD *)(v55 - 8);
  __chkstk_darwin();
  v19 = (char *)v23 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = a1[3];
  v20 = a1[4];
  sub_10000DB28(a1, v21);
  v22 = sub_10000DB4C();
  v54 = v19;
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for CharacteristicKind.Value.CodingKeys, &type metadata for CharacteristicKind.Value.CodingKeys, v22, v21, v20);
  __asm { BR              X10 }
}

uint64_t sub_100007C0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(v2 - 152) & 1;
  *(_BYTE *)(v2 - 104) = 1;
  v4 = sub_10000DE7C();
  v6 = *(_QWORD *)(v2 - 136);
  v5 = *(_QWORD *)(v2 - 128);
  KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)(&type metadata for CharacteristicKind.Value.BoolCodingKeys, v2 - 104, v5, &type metadata for CharacteristicKind.Value.BoolCodingKeys, v4);
  ((void (*)(uint64_t))KeyedEncodingContainer.encode(_:forKey:))(v3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 400) + 8))(v1, v0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 144) + 8))(v6, v5);
}

void sub_10000800C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)(v0 - 104) = 10;
  v2 = *(_QWORD *)(v0 - 160);
  v1 = *(_QWORD *)(v0 - 152);
  sub_10000D32C(v1, v2);
  v3 = sub_10000DC18();
  v4 = *(_QWORD *)(v0 - 208);
  v6 = *(_QWORD *)(v0 - 136);
  v5 = *(_QWORD *)(v0 - 128);
  KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)(&type metadata for CharacteristicKind.Value.Tlv8CodingKeys, v0 - 104, v5, &type metadata for CharacteristicKind.Value.Tlv8CodingKeys, v3);
  *(_QWORD *)(v0 - 104) = v1;
  *(_QWORD *)(v0 - 96) = v2;
  sub_10000DBD4();
  v7 = *(_QWORD *)(v0 - 192);
  KeyedEncodingContainer.encode<A>(_:forKey:)(v0 - 104);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 - 200) + 8))(v4, v7);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 - 144) + 8))(v6, v5);
  sub_10000DAFC(v1, v2, 9);
  JUMPOUT(0x100007FE4);
}

void sub_1000080C0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)(v0 - 104) = 11;
  v2 = *(_QWORD *)(v0 - 160);
  v1 = *(_QWORD *)(v0 - 152);
  sub_10000D32C(v1, v2);
  v3 = sub_10000DB90();
  v4 = *(_QWORD *)(v0 - 184);
  v6 = *(_QWORD *)(v0 - 136);
  v5 = *(_QWORD *)(v0 - 128);
  KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)(&type metadata for CharacteristicKind.Value.DataCodingKeys, v0 - 104, v5, &type metadata for CharacteristicKind.Value.DataCodingKeys, v3);
  *(_QWORD *)(v0 - 104) = v1;
  *(_QWORD *)(v0 - 96) = v2;
  sub_10000DBD4();
  v7 = *(_QWORD *)(v0 - 168);
  KeyedEncodingContainer.encode<A>(_:forKey:)(v0 - 104);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 - 176) + 8))(v4, v7);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 - 144) + 8))(v6, v5);
  sub_10000DAFC(v1, v2, 10);
  JUMPOUT(0x100007FE4);
}

void sub_100008174()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)(v3 - 104) = 0;
  v4 = sub_10000DEC0();
  v6 = *(_QWORD *)(v3 - 136);
  v5 = *(_QWORD *)(v3 - 128);
  KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)(&type metadata for CharacteristicKind.Value.NullCodingKeys, v3 - 104, v5, &type metadata for CharacteristicKind.Value.NullCodingKeys, v4);
  (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 144) + 8))(v6, v5);
  JUMPOUT(0x100007FE4);
}

Swift::Int CharacteristicKind.Value.hashValue.getter(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, 0);
  CharacteristicKind.Value.hash(into:)((uint64_t)v7, a1, a2, a3);
  return Hasher._finalize()();
}

uint64_t CharacteristicKind.Value.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;

  result = sub_10000E354(a1);
  if (v1)
    return v3;
  return result;
}

void sub_100008248()
{
  uint64_t v0;

  CharacteristicKind.Value.description.getter(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_BYTE *)(v0 + 16));
}

void sub_100008254(uint64_t a1)
{
  _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO5ValueO21__derived_enum_equalsySbAE_AEtFZ_0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

Swift::Int sub_100008270()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  _QWORD v5[9];

  v1 = *(_QWORD *)v0;
  v2 = *(_QWORD *)(v0 + 8);
  v3 = *(_BYTE *)(v0 + 16);
  Hasher.init(_seed:)(v5, 0);
  CharacteristicKind.Value.hash(into:)((uint64_t)v5, v1, v2, v3);
  return Hasher._finalize()();
}

void sub_1000082C8(uint64_t a1)
{
  uint64_t v1;

  CharacteristicKind.Value.hash(into:)(a1, *(_QWORD *)v1, *(_QWORD *)(v1 + 8), *(_BYTE *)(v1 + 16));
}

Swift::Int sub_1000082D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  _QWORD v6[9];

  v2 = *(_QWORD *)v1;
  v3 = *(_QWORD *)(v1 + 8);
  v4 = *(_BYTE *)(v1 + 16);
  Hasher.init(_seed:)(v6, a1);
  CharacteristicKind.Value.hash(into:)((uint64_t)v6, v2, v3, v4);
  return Hasher._finalize()();
}

uint64_t sub_100008328@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  char v4;

  v2 = *(_QWORD *)v1;
  v3 = *(_QWORD *)(v1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_BYTE *)(v1 + 16);
  *(_BYTE *)(a1 + 16) = v4;
  return sub_10000D300(v2, v3, v4);
}

uint64_t sub_10000833C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  char v6;

  result = sub_10000E354(a1);
  if (!v2)
  {
    *(_QWORD *)a2 = result;
    *(_QWORD *)(a2 + 8) = v5;
    *(_BYTE *)(a2 + 16) = v6;
  }
  return result;
}

void sub_100008368(_QWORD *a1)
{
  uint64_t v1;

  CharacteristicKind.Value.encode(to:)(a1, *(_QWORD *)v1, *(_QWORD *)(v1 + 8), *(unsigned __int8 *)(v1 + 16));
}

uint64_t sub_100008384()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x566D756D6978616DLL;
  if (*v0 != 1)
    v1 = 0x756C615670657473;
  if (*v0)
    return v1;
  else
    return 0x566D756D696E696DLL;
}

uint64_t sub_1000083E8@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_10000F2B0(a1, a2);
  *a3 = result;
  return result;
}

void sub_10000840C(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_100008418(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000F26C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100008440(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000F26C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t CharacteristicKind.Constraints.MinMaxStepValues.encode(to:)(_QWORD *a1, float a2, float a3, float a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v17;
  char v18;
  char v19;
  char v20;

  v9 = sub_10000D3B8(&qword_10003D730);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin();
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a1[3];
  v14 = a1[4];
  sub_10000DB28(a1, v13);
  v15 = sub_10000F26C();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for CharacteristicKind.Constraints.MinMaxStepValues.CodingKeys, &type metadata for CharacteristicKind.Constraints.MinMaxStepValues.CodingKeys, v15, v13, v14);
  v20 = 0;
  KeyedEncodingContainer.encode(_:forKey:)(&v20, v9, a2);
  if (!v4)
  {
    v19 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(&v19, v9, a3);
    v18 = 2;
    KeyedEncodingContainer.encode(_:forKey:)(&v18, v9, a4);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

float CharacteristicKind.Constraints.MinMaxStepValues.init(from:)(_QWORD *a1)
{
  return sub_10000F43C(a1);
}

void sub_1000085E0(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  float v4;
  int v5;
  int v6;

  v4 = sub_10000F43C(a1);
  if (!v2)
  {
    *(float *)a2 = v4;
    *(_DWORD *)(a2 + 4) = v5;
    *(_DWORD *)(a2 + 8) = v6;
  }
}

uint64_t sub_10000860C(_QWORD *a1)
{
  float *v1;

  return CharacteristicKind.Constraints.MinMaxStepValues.encode(to:)(a1, *v1, v1[1], v1[2]);
}

unint64_t sub_100008628(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  unint64_t result;
  char v11;
  unint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = v3;
  if (a2)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v17 = *v3;
    *v3 = 0x8000000000000000;
    sub_10000B908(a1, a2, a3, isUniquelyReferenced_nonNull_native);
    v9 = *v3;
    *v3 = v17;
  }
  else
  {
    result = sub_10000A520(a3);
    if ((v11 & 1) == 0)
      return result;
    v12 = result;
    v13 = swift_isUniquelyReferenced_nonNull_native(*v3);
    v14 = *v3;
    v18 = *v4;
    *v4 = 0x8000000000000000;
    if (!v13)
    {
      sub_10000AA24();
      v14 = v18;
    }
    v15 = *(_QWORD *)(*(_QWORD *)(v14 + 56) + 16 * v12 + 8);
    sub_10000B774(v12, v14);
    v16 = *v4;
    *v4 = v14;
    swift_bridgeObjectRelease(v15);
    v9 = v16;
  }
  return swift_bridgeObjectRelease(v9);
}

unsigned __int8 *sub_10000871C(unsigned __int8 *result, uint64_t *a2, uint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 *v13;
  unsigned int v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 *v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  unsigned __int8 *v26;
  unsigned int v27;
  uint64_t v28;
  char v29;
  char v30;
  _QWORD v31[2];

  v4 = *a2;
  v3 = a2[1];
  v5 = HIBYTE(v3) & 0xF;
  v6 = *a2 & 0xFFFFFFFFFFFFLL;
  if ((v3 & 0x2000000000000000) != 0)
    v7 = HIBYTE(v3) & 0xF;
  else
    v7 = v6;
  if (!v7)
    return result;
  if ((v3 & 0x1000000000000000) != 0)
  {
    swift_bridgeObjectRetain(v3);
    v11 = (uint64_t)sub_10000B690(v4, v3, 10);
    v30 = v29;
    result = (unsigned __int8 *)swift_bridgeObjectRelease(v3);
    if ((v30 & 1) != 0)
      return result;
    goto LABEL_36;
  }
  if ((v3 & 0x2000000000000000) != 0)
  {
    v31[0] = v4;
    v31[1] = v3 & 0xFFFFFFFFFFFFFFLL;
    if (v4 == 43)
    {
      if (!v5)
        goto LABEL_65;
      if (v5 == 1)
        goto LABEL_63;
      if ((BYTE1(v4) - 48) > 9u)
        goto LABEL_32;
      v11 = (BYTE1(v4) - 48);
      if (v5 != 2)
      {
        if ((BYTE2(v4) - 48) > 9u)
          goto LABEL_32;
        v11 = 10 * (BYTE1(v4) - 48) + (BYTE2(v4) - 48);
        v12 = v5 - 3;
        if (v5 != 3)
        {
          v13 = (unsigned __int8 *)v31 + 3;
          while (1)
          {
            v14 = *v13 - 48;
            if (v14 > 9)
              goto LABEL_32;
            v15 = 10 * v11;
            if ((unsigned __int128)(v11 * (__int128)10) >> 64 != (10 * v11) >> 63)
              goto LABEL_32;
            v11 = v15 + v14;
            if (__OFADD__(v15, v14))
              goto LABEL_32;
            LOBYTE(v5) = 0;
            ++v13;
            if (!--v12)
              goto LABEL_35;
          }
        }
      }
    }
    else
    {
      if (v4 == 45)
      {
        if (v5)
        {
          if (v5 != 1)
          {
            if ((BYTE1(v4) - 48) > 9u)
              goto LABEL_32;
            if (v5 == 2)
            {
              LOBYTE(v5) = 0;
              v11 = -(uint64_t)(BYTE1(v4) - 48);
              goto LABEL_35;
            }
            if ((BYTE2(v4) - 48) > 9u)
              goto LABEL_32;
            v11 = -10 * (BYTE1(v4) - 48) - (BYTE2(v4) - 48);
            v25 = v5 - 3;
            if (v5 != 3)
            {
              v26 = (unsigned __int8 *)v31 + 3;
              while (1)
              {
                v27 = *v26 - 48;
                if (v27 > 9)
                  goto LABEL_32;
                v28 = 10 * v11;
                if ((unsigned __int128)(v11 * (__int128)10) >> 64 != (10 * v11) >> 63)
                  goto LABEL_32;
                v11 = v28 - v27;
                if (__OFSUB__(v28, v27))
                  goto LABEL_32;
                LOBYTE(v5) = 0;
                ++v26;
                if (!--v25)
                  goto LABEL_35;
              }
            }
            goto LABEL_34;
          }
LABEL_63:
          v11 = 0;
LABEL_35:
          if ((v5 & 1) != 0)
            return result;
          goto LABEL_36;
        }
        __break(1u);
LABEL_65:
        __break(1u);
        return result;
      }
      if (!v5 || (v4 - 48) > 9u)
      {
LABEL_32:
        v11 = 0;
        LOBYTE(v5) = 1;
        goto LABEL_35;
      }
      v11 = (v4 - 48);
      if (v5 != 1)
      {
        if ((BYTE1(v4) - 48) > 9u)
          goto LABEL_32;
        v11 = 10 * (v4 - 48) + (BYTE1(v4) - 48);
        v21 = v5 - 2;
        if (v5 != 2)
        {
          v22 = (unsigned __int8 *)v31 + 2;
          while (1)
          {
            v23 = *v22 - 48;
            if (v23 > 9)
              goto LABEL_32;
            v24 = 10 * v11;
            if ((unsigned __int128)(v11 * (__int128)10) >> 64 != (10 * v11) >> 63)
              goto LABEL_32;
            v11 = v24 + v23;
            if (__OFADD__(v24, v23))
              goto LABEL_32;
            LOBYTE(v5) = 0;
            ++v22;
            if (!--v21)
              goto LABEL_35;
          }
        }
      }
    }
LABEL_34:
    LOBYTE(v5) = 0;
    goto LABEL_35;
  }
  if ((v4 & 0x1000000000000000) != 0)
    v9 = (unsigned __int8 *)((v3 & 0xFFFFFFFFFFFFFFFLL) + 32);
  else
    v9 = (unsigned __int8 *)_StringObject.sharedUTF8.getter(v4, v3);
  result = sub_10000BA44(v9, v6, 10);
  if ((v10 & 1) != 0)
    return result;
  v11 = (uint64_t)result;
LABEL_36:
  if (*(_QWORD *)(a3 + 16))
  {
    swift_bridgeObjectRetain(v3);
    v16 = sub_10000A4BC(v4, v3);
    if ((v17 & 1) != 0)
    {
      v18 = (uint64_t *)(*(_QWORD *)(a3 + 56) + 16 * v16);
      v19 = *v18;
      v20 = v18[1];
      swift_bridgeObjectRetain(v20);
    }
    else
    {
      v19 = 0;
      v20 = 0;
    }
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v19 = 0;
    v20 = 0;
  }
  return (unsigned __int8 *)sub_100008628(v19, v20, v11);
}

BOOL sub_100008A78(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100008A8C()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100008AD0()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100008AF8(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_100008B38()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 0x74694264696C6176;
  if (*v0 != 1)
    v1 = 0xD000000000000010;
  if (*v0)
    return v1;
  else
    return 0x6C615664696C6176;
}

uint64_t sub_100008BA4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_10000F758(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100008BC8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000F5C0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100008BF0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000F5C0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100008C18(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000F604();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100008C40(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000F604();
  return CodingKey.debugDescription.getter(a1, v2);
}

void sub_100008C68()
{
  Hasher._combine(_:)(0);
}

uint64_t sub_100008C8C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000F68C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100008CB4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000F68C();
  return CodingKey.debugDescription.getter(a1, v2);
}

Swift::Int sub_100008CDC()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

Swift::Int sub_100008D1C(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

uint64_t sub_100008D58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v6;
  uint64_t result;
  char v8;

  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    result = swift_bridgeObjectRelease(0xE200000000000000);
    v8 = 0;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)(12383, 0xE200000000000000, a1, a2, 0);
    result = swift_bridgeObjectRelease(a2);
    v8 = v6 ^ 1;
  }
  *a3 = v8 & 1;
  return result;
}

uint64_t sub_100008DD4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000F714();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100008DFC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000F714();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t CharacteristicKind.Constraints.encode(to:)(_QWORD *a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  char *v23;
  unint64_t v24;
  uint64_t v25;
  unsigned int v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  int v40;

  v36 = a2;
  v5 = sub_10000D3B8(&qword_10003D740);
  v34 = *(_QWORD *)(v5 - 8);
  v35 = v5;
  __chkstk_darwin();
  v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_10000D3B8(&qword_10003D748);
  v32 = *(_QWORD *)(v8 - 8);
  v33 = v8;
  __chkstk_darwin();
  v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_10000D3B8(&qword_10003D750);
  v31 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin();
  v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_10000D3B8(&qword_10003D758);
  v37 = *(_QWORD *)(v14 - 8);
  v38 = v14;
  __chkstk_darwin();
  v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = a1[3];
  v17 = a1[4];
  sub_10000DB28(a1, v18);
  v19 = sub_10000F5C0();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for CharacteristicKind.Constraints.CodingKeys, &type metadata for CharacteristicKind.Constraints.CodingKeys, v19, v18, v17);
  if (BYTE4(a3))
  {
    if (BYTE4(a3) != 1)
    {
      v26 = v36;
      v27 = HIDWORD(v36);
      LOBYTE(v39) = 2;
      v28 = sub_10000F604();
      v21 = v38;
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)(&type metadata for CharacteristicKind.Constraints.MinMaxStepValuesCodingKeys, &v39, v38, &type metadata for CharacteristicKind.Constraints.MinMaxStepValuesCodingKeys, v28);
      v39 = __PAIR64__(v27, v26);
      v40 = a3;
      sub_10000F648();
      v29 = v35;
      KeyedEncodingContainer.encode<A>(_:forKey:)(&v39);
      v22 = *(void (**)(char *, uint64_t))(v34 + 8);
      v23 = v7;
      v25 = v29;
      goto LABEL_7;
    }
    LOBYTE(v39) = 1;
    v20 = sub_10000F68C();
    v21 = v38;
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)(&type metadata for CharacteristicKind.Constraints.ValidBitsCodingKeys, &v39, v38, &type metadata for CharacteristicKind.Constraints.ValidBitsCodingKeys, v20);
    v39 = v36;
    sub_10000D3B8(&qword_10003D780);
    sub_1000124B0(&qword_10003D788, (uint64_t)&protocol witness table for Int, (uint64_t)&protocol witness table for String, (uint64_t)&protocol conformance descriptor for <> [A : B]);
    v11 = v33;
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v39);
    v22 = *(void (**)(char *, uint64_t))(v32 + 8);
    v23 = v10;
  }
  else
  {
    LOBYTE(v39) = 0;
    v24 = sub_10000F714();
    v21 = v38;
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)(&type metadata for CharacteristicKind.Constraints.ValidValuesCodingKeys, &v39, v38, &type metadata for CharacteristicKind.Constraints.ValidValuesCodingKeys, v24);
    v39 = v36;
    sub_10000D3B8(&qword_10003D780);
    sub_1000124B0(&qword_10003D788, (uint64_t)&protocol witness table for Int, (uint64_t)&protocol witness table for String, (uint64_t)&protocol conformance descriptor for <> [A : B]);
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v39);
    v22 = *(void (**)(char *, uint64_t))(v31 + 8);
    v23 = v13;
  }
  v25 = v11;
LABEL_7:
  v22(v23, v25);
  return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v16, v21);
}

uint64_t CharacteristicKind.Constraints.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;

  result = sub_10000F8CC(a1);
  if (v1)
    return v3 & 0xFFFFFFFFFFLL;
  return result;
}

uint64_t sub_1000091B0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;

  result = sub_10000F8CC(a1);
  if (!v2)
  {
    *(_QWORD *)a2 = result;
    *(_DWORD *)(a2 + 8) = v5;
    *(_BYTE *)(a2 + 12) = BYTE4(v5);
  }
  return result;
}

uint64_t sub_1000091E4(_QWORD *a1)
{
  uint64_t v1;

  return CharacteristicKind.Constraints.encode(to:)(a1, *(_QWORD *)v1, *(unsigned int *)(v1 + 8) | ((unint64_t)*(unsigned __int8 *)(v1 + 12) << 32));
}

void *CharacteristicKind.Permissions.securedRead.unsafeMutableAddressor()
{
  return &static CharacteristicKind.Permissions.securedRead;
}

void *CharacteristicKind.Permissions.securedWrite.unsafeMutableAddressor()
{
  return &static CharacteristicKind.Permissions.securedWrite;
}

uint64_t static CharacteristicKind.Permissions.securedWrite.getter()
{
  return 2;
}

void sub_10000922C()
{
  static CharacteristicKind.Permissions.allPermissions = (uint64_t)&off_100036210;
}

uint64_t *CharacteristicKind.Permissions.allPermissions.unsafeMutableAddressor()
{
  if (qword_10003D5D0 != -1)
    swift_once(&qword_10003D5D0, sub_10000922C);
  return &static CharacteristicKind.Permissions.allPermissions;
}

uint64_t static CharacteristicKind.Permissions.allPermissions.getter()
{
  return sub_100009464(&qword_10003D5D0, &static CharacteristicKind.Permissions.allPermissions);
}

void sub_1000092A4(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_1000092B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_10000FFB0();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_10000930C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_10000FFB0();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

void sub_100009358(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_100009360(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

uint64_t sub_100009378@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = sub_100022174();
  result = swift_bridgeObjectRelease(a1);
  *a2 = v4;
  return result;
}

void *CharacteristicKind.Properties.read.unsafeMutableAddressor()
{
  return &static CharacteristicKind.Properties.read;
}

void *CharacteristicKind.Properties.write.unsafeMutableAddressor()
{
  return &static CharacteristicKind.Properties.write;
}

void *CharacteristicKind.Properties.cnotify.unsafeMutableAddressor()
{
  return &static CharacteristicKind.Properties.cnotify;
}

uint64_t static CharacteristicKind.Properties.cnotify.getter()
{
  return 4;
}

void *CharacteristicKind.Properties.uncnotify.unsafeMutableAddressor()
{
  return &static CharacteristicKind.Properties.uncnotify;
}

uint64_t static CharacteristicKind.Properties.uncnotify.getter()
{
  return 8;
}

void sub_1000093F4()
{
  static CharacteristicKind.Properties.allProperties = (uint64_t)&off_100036240;
}

uint64_t *CharacteristicKind.Properties.allProperties.unsafeMutableAddressor()
{
  if (qword_10003D5D8 != -1)
    swift_once(&qword_10003D5D8, sub_1000093F4);
  return &static CharacteristicKind.Properties.allProperties;
}

uint64_t static CharacteristicKind.Properties.allProperties.getter()
{
  return sub_100009464(&qword_10003D5D8, &static CharacteristicKind.Properties.allProperties);
}

uint64_t sub_100009464(_QWORD *a1, _QWORD *a2)
{
  if (*a1 != -1)
    swift_once();
  return swift_bridgeObjectRetain(*a2);
}

_QWORD *sub_10000949C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

BOOL sub_1000094A8(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_1000094BC()
{
  Swift::UInt *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100009500()
{
  Swift::UInt *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100009528(uint64_t a1)
{
  Swift::UInt *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_100009568(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_100010118();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_1000095C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_100010118();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

_QWORD *sub_100009610@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_100009624@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_100009638@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_10000964C(_QWORD *a1, uint64_t *a2)
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

_QWORD *sub_10000967C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_1000096A8@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *sub_1000096CC(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_1000096E0(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_1000096F4(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_100009708@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_10000971C(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_100009730(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_100009744(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_100009758()
{
  _QWORD *v0;

  return *v0 == 0;
}

_QWORD *sub_100009768(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

_QWORD *sub_10000977C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t CharacteristicKind.Format.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1000097BC + 4 * byte_100026E0E[a1]))(1819242338, 0xE400000000000000);
}

uint64_t sub_1000097BC()
{
  return 0x38746E6975;
}

uint64_t sub_1000097D0()
{
  return 0x3631746E6975;
}

uint64_t sub_1000097E4()
{
  return 0x3233746E6975;
}

uint64_t sub_1000097F8()
{
  return 0x3436746E6975;
}

uint64_t sub_10000980C()
{
  return 7630441;
}

uint64_t sub_10000981C()
{
  return 0x3233746E69;
}

uint64_t sub_100009830()
{
  return 0x74616F6C66;
}

uint64_t sub_100009844()
{
  return 947285108;
}

uint64_t sub_100009850()
{
  return 1635017060;
}

uint64_t sub_10000985C()
{
  return 0x676E69727473;
}

uint64_t _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO6FormatO2idSSvg_0(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_10000989C + 4 * byte_100026E19[a1]))(1819242338, 0xE400000000000000);
}

uint64_t sub_10000989C()
{
  return 0x38746E6975;
}

uint64_t sub_1000098B0()
{
  return 0x3631746E6975;
}

uint64_t sub_1000098C4()
{
  return 0x3233746E6975;
}

uint64_t sub_1000098D8()
{
  return 0x3436746E6975;
}

uint64_t sub_1000098EC()
{
  return 7630441;
}

uint64_t sub_1000098FC()
{
  return 0x3233746E69;
}

uint64_t sub_100009910()
{
  return 0x74616F6C66;
}

uint64_t sub_100009924()
{
  return 947285108;
}

uint64_t sub_100009930()
{
  return 1635017060;
}

uint64_t sub_10000993C()
{
  return 0x676E69727473;
}

_UNKNOWN **static CharacteristicKind.Format.allCases.getter()
{
  return &off_100036280;
}

unint64_t sub_10000995C@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO6FormatO8rawValueAESgSS_tcfC_0(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_100009988@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = CharacteristicKind.Format.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1000099B0()
{
  unsigned __int8 *v0;

  return CharacteristicKind.Format.id.getter(*v0);
}

void sub_1000099B8(_QWORD *a1@<X8>)
{
  *a1 = &off_100036280;
}

uint64_t sub_1000099C8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;

  v2 = *a2;
  v3 = CharacteristicKind.Format.rawValue.getter(*a1);
  v5 = v4;
  v6 = CharacteristicKind.Format.rawValue.getter(v2);
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

Swift::Int sub_100009A50()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[9];

  v1 = *v0;
  Hasher.init(_seed:)(v6, 0);
  v2 = CharacteristicKind.Format.rawValue.getter(v1);
  v4 = v3;
  String.hash(into:)(v6, v2, v3);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t sub_100009AB0(uint64_t a1)
{
  unsigned __int8 *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = CharacteristicKind.Format.rawValue.getter(*v1);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_100009AF0(uint64_t a1)
{
  unsigned __int8 *v1;
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[9];

  v2 = *v1;
  Hasher.init(_seed:)(v7, a1);
  v3 = CharacteristicKind.Format.rawValue.getter(v2);
  v5 = v4;
  String.hash(into:)(v7, v3, v4);
  swift_bridgeObjectRelease(v5);
  return Hasher._finalize()();
}

uint64_t sub_100009B4C@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = CharacteristicKind.Format.id.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100009B74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_1000123C4();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_100009BD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_1000123C4();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

_UNKNOWN **static CharacteristicKind.Unit.allCases.getter()
{
  return &off_1000362B0;
}

uint64_t CharacteristicKind.Unit.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_100009C5C + 4 * byte_100026E24[a1]))(0x737569736C6563, 0xE700000000000000);
}

uint64_t sub_100009C5C()
{
  return 0x61746E6563726570;
}

uint64_t sub_100009C78()
{
  return 0x6572676564637261;
}

uint64_t sub_100009C98()
{
  return 7894380;
}

uint64_t sub_100009CA8()
{
  return 0x73646E6F636573;
}

uint64_t sub_100009CBC()
{
  return 0x7373656C74696E75;
}

void sub_100009CD4(char *a1)
{
  sub_100004690(*a1);
}

void sub_100009CE0()
{
  char *v0;

  sub_100004934(*v0);
}

void sub_100009CE8()
{
  __asm { BR              X10 }
}

uint64_t sub_100009D24(uint64_t a1)
{
  ((void (*)(uint64_t, uint64_t, unint64_t))String.hash(into:))(a1, 0x61746E6563726570, 0xEA00000000006567);
  return swift_bridgeObjectRelease(0xEA00000000006567);
}

void sub_100009DB0(uint64_t a1)
{
  char *v1;

  sub_100004AC0(a1, *v1);
}

unint64_t sub_100009DB8@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO4UnitO8rawValueAESgSS_tcfC_0(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_100009DE4()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_100009E14 + 4 * byte_100026E30[*v0]))();
}

void sub_100009E14(_QWORD *a1@<X8>)
{
  *a1 = 0x61746E6563726570;
  a1[1] = 0xEA00000000006567;
}

void sub_100009E34(_QWORD *a1@<X8>)
{
  *a1 = 0x6572676564637261;
  a1[1] = 0xEA00000000007365;
}

void sub_100009E58(_QWORD *a1@<X8>)
{
  *a1 = 7894380;
  a1[1] = 0xE300000000000000;
}

void sub_100009E6C(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 0x73646E6F636573;
  a1[1] = v1;
}

void sub_100009E84(_QWORD *a1@<X8>)
{
  *a1 = 0x7373656C74696E75;
  a1[1] = 0xE800000000000000;
}

void sub_100009EA0(_QWORD *a1@<X8>)
{
  *a1 = &off_1000362B0;
}

uint64_t sub_100009EB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_100012380();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_100009F0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_100012380();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

id variable initialization expression of DataModel.homeManager()
{
  unint64_t v0;
  id v1;
  id v2;

  v0 = sub_10000FE74();
  v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(v0), "defaultPrivateConfiguration");
  objc_msgSend(v1, "setDiscretionary:", 0);
  objc_msgSend(v1, "setAdaptive:", 1);
  v2 = objc_msgSend(objc_allocWithZone((Class)HMHomeManager), "initWithConfiguration:", v1);

  return v2;
}

uint64_t variable initialization expression of DataModel.currentHome()
{
  return 0;
}

uint64_t variable initialization expression of DataModel.defaultsHomeSensingChangedNotifyToken()
{
  return 0;
}

BOOL sub_100009FF0(uint64_t a1, __n128 a2)
{
  double v2;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v2 = a2.n128_f64[0];
  v4 = (a2.n128_u64[0] >> 52) & 0x7FF;
  v5 = a2.n128_u64[0] & 0xFFFFFFFFFFFFFLL;
  v6 = v4 | a2.n128_u64[0] & 0xFFFFFFFFFFFFFLL;
  if (!v6)
  {
    v12 = 0;
    result = 1;
    goto LABEL_25;
  }
  if (v4 == 2047)
    goto LABEL_28;
  v7 = Double.exponent.getter(a2);
  if (v7 > 63)
    goto LABEL_28;
  v8 = v7;
  v9 = Double.significandWidth.getter(v2);
  result = v8 >= v9;
  v11 = v9 + __clz(__rbit64(v5));
  v12 = v8 - v11;
  if (__OFSUB__(v8, v11))
  {
    __break(1u);
LABEL_27:
    if (v2 < 0.0)
    {
LABEL_36:
      LOBYTE(v6) = 0;
      v12 = 0x8000000000000000;
      goto LABEL_25;
    }
LABEL_28:
    v12 = 0;
    result = 0;
    LOBYTE(v6) = 1;
    goto LABEL_25;
  }
  if (v11 > 63)
  {
    if (v12 < -64 || v12 > 64)
      goto LABEL_11;
  }
  else if (v12 < -64 || v12 > 64)
  {
    goto LABEL_11;
  }
  if (v12 < 0)
    goto LABEL_32;
  if ((unint64_t)v12 < 0x40)
  {
    v14 = v5 << v12;
    if (v8 != 63)
      goto LABEL_17;
LABEL_34:
    if (v2 < 0.0 && !v14)
      goto LABEL_36;
    goto LABEL_28;
  }
LABEL_11:
  if (v8 == 63)
    goto LABEL_27;
  v13 = 0;
  v14 = 0;
  if (v8 < 0)
    goto LABEL_20;
LABEL_19:
  v13 = 1 << v8;
LABEL_20:
  while (1)
  {
    v12 = v14 | v13;
    if (v2 >= 0.0)
      break;
    if ((v12 & 0x8000000000000000) == 0)
    {
      LOBYTE(v6) = 0;
      v12 = -v12;
      goto LABEL_25;
    }
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    if ((unint64_t)v12 <= 0xFFFFFFFFFFFFFFC0)
      goto LABEL_11;
    v14 = v5 >> -(char)v12;
    if (v8 == 63)
      goto LABEL_34;
LABEL_17:
    if ((v8 & 0x8000000000000000) == 0)
      goto LABEL_19;
    v13 = 0;
  }
  if (v12 < 0)
    goto LABEL_31;
  LOBYTE(v6) = 0;
LABEL_25:
  *(_QWORD *)a1 = v12;
  *(_BYTE *)(a1 + 8) = v6;
  return result;
}

BOOL sub_10000A174(uint64_t a1, __n128 a2)
{
  float v2;
  int v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v2 = a2.n128_f32[0];
  v4 = (a2.n128_u32[0] >> 23);
  v5 = a2.n128_u32[0] & 0x7FFFFF;
  v6 = v4 | a2.n128_u8[0];
  if (!(v4 | v5))
  {
    v14 = 0;
    result = 1;
    goto LABEL_26;
  }
  if (v4 == 255 || (v7 = Float.exponent.getter(a2), v7 > 63))
  {
LABEL_38:
    v14 = 0;
    result = 0;
    v6 = 1;
    goto LABEL_26;
  }
  v8 = v7;
  v9 = Float.significandWidth.getter(v2);
  result = v8 >= v9;
  v11 = v9 + __clz(__rbit32(v5));
  v12 = v8 - v11;
  if (__OFSUB__(v8, v11))
  {
    __break(1u);
    goto LABEL_31;
  }
  if (v11 > 63)
  {
    if ((unint64_t)(v12 - 33) < 0xFFFFFFFFFFFFFFBFLL)
      goto LABEL_12;
    if (v12 < 0)
    {
      if ((unint64_t)v12 <= 0xFFFFFFFFFFFFFFE0)
        LODWORD(v12) = 0;
      else
        LODWORD(v12) = v5 >> (v11 - v8);
      goto LABEL_16;
    }
    if ((unint64_t)v12 >= 0x20)
LABEL_12:
      LODWORD(v12) = 0;
    else
      LODWORD(v12) = (_DWORD)v5 << v12;
LABEL_16:
    v12 = v12;
LABEL_17:
    if (v8 != 63)
    {
      if (v8 < 0)
      {
        v13 = 0;
        goto LABEL_21;
      }
      goto LABEL_20;
    }
LABEL_31:
    if (v2 >= 0.0 || v12)
      goto LABEL_38;
    goto LABEL_33;
  }
  if (v12 >= -64 && v12 <= 64)
  {
    if (v12 < 0)
    {
      if ((unint64_t)v12 <= 0xFFFFFFFFFFFFFFC0)
        goto LABEL_8;
      v12 = v5 >> (v11 - v8);
    }
    else
    {
      if ((unint64_t)v12 >= 0x40)
        goto LABEL_8;
      v12 = v5 << v12;
    }
    goto LABEL_17;
  }
LABEL_8:
  if (v8 == 63)
    goto LABEL_37;
  v13 = 0;
  v12 = 0;
  if ((v8 & 0x8000000000000000) == 0)
LABEL_20:
    v13 = 1 << v8;
LABEL_21:
  v14 = v12 | v13;
  if (v2 >= 0.0)
  {
    if ((v14 & 0x8000000000000000) == 0)
    {
      v6 = 0;
      goto LABEL_26;
    }
    goto LABEL_36;
  }
  if ((v14 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    if (v2 >= 0.0)
      goto LABEL_38;
LABEL_33:
    v6 = 0;
    v14 = 0x8000000000000000;
    goto LABEL_26;
  }
  v6 = 0;
  v14 = -(uint64_t)v14;
LABEL_26:
  *(_QWORD *)a1 = v14;
  *(_BYTE *)(a1 + 8) = v6;
  return result;
}

char *sub_10000A320(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      v10 = sub_10000D3B8(&qword_10003DAB8);
      v11 = (char *)swift_allocObject(v10, 72 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 72);
      v13 = v11 + 32;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v11 != a4 || v13 >= &a4[72 * v8 + 32])
          memmove(v13, a4 + 32, 72 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v11 = (char *)&_swiftEmptyArrayStorage;
      v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_10000CE24(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

unint64_t sub_10000A448(unsigned __int8 a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v1 + 40));
  CharacteristicKind.rawValue.getter(a1);
  v4 = v3;
  String.hash(into:)(v7, 0xD000000000000024, v3);
  swift_bridgeObjectRelease(v4);
  v5 = Hasher._finalize()();
  return sub_10000A550(a1, v5);
}

unint64_t sub_10000A4BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_10000A6B8(a1, a2, v5);
}

unint64_t sub_10000A520(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = static Hasher._hash(seed:_:)(*(_QWORD *)(v1 + 40), a1);
  return sub_10000A798(a1, v3);
}

unint64_t sub_10000A550(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    CharacteristicKind.rawValue.getter(*(_BYTE *)(*(_QWORD *)(v2 + 48) + v5));
    v8 = v7;
    CharacteristicKind.rawValue.getter(a1);
    if (v8 == v9)
    {
LABEL_11:
      swift_bridgeObjectRelease_n(v8, 2);
      return v5;
    }
    v10 = v9;
    v11 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000024, v8, 0xD000000000000024, v9, 0);
    swift_bridgeObjectRelease(v8);
    swift_bridgeObjectRelease(v10);
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          CharacteristicKind.rawValue.getter(*(_BYTE *)(*(_QWORD *)(v2 + 48) + v5));
          if (v13 == v10)
            break;
          v14 = v13;
          v15 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000024, v13, 0xD000000000000024, v10, 0);
          swift_bridgeObjectRelease(v14);
          swift_bridgeObjectRelease(v10);
          if ((v15 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        v8 = v10;
        goto LABEL_11;
      }
    }
  }
  return v5;
}

unint64_t sub_10000A6B8(uint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_10000A798(uint64_t a1, uint64_t a2)
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
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

void *sub_10000A834()
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
  unint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  unint64_t v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;

  v1 = v0;
  sub_10000D3B8(&qword_10003DAB0);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v2);
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
    v27 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v27 >= v13)
      goto LABEL_26;
    v28 = *(_QWORD *)(v6 + 8 * v27);
    ++v9;
    if (!v28)
    {
      v9 = v27 + 1;
      if (v27 + 1 >= v13)
        goto LABEL_26;
      v28 = *(_QWORD *)(v6 + 8 * v9);
      if (!v28)
        break;
    }
LABEL_25:
    v12 = (v28 - 1) & v28;
    v15 = __clz(__rbit64(v28)) + (v9 << 6);
LABEL_12:
    v16 = *(_QWORD *)(v2 + 56) + (v15 << 6);
    v17 = *(_BYTE *)v16;
    v19 = *(_QWORD *)(v16 + 8);
    v18 = *(_QWORD *)(v16 + 16);
    v20 = *(_WORD *)(v16 + 24);
    v21 = *(_QWORD *)(v16 + 32);
    v22 = *(unsigned __int8 *)(v16 + 44);
    v23 = *(unsigned int *)(v16 + 40);
    v24 = v23 | (v22 << 32);
    v25 = *(_OWORD *)(v16 + 48);
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    v26 = *(_QWORD *)(v4 + 56) + (v15 << 6);
    *(_BYTE *)v26 = v17;
    *(_QWORD *)(v26 + 8) = v19;
    *(_QWORD *)(v26 + 16) = v18;
    *(_WORD *)(v26 + 24) = v20;
    *(_QWORD *)(v26 + 32) = v21;
    *(_BYTE *)(v26 + 44) = v22;
    *(_DWORD *)(v26 + 40) = v23;
    *(_OWORD *)(v26 + 48) = v25;
    swift_bridgeObjectRetain(v18);
    result = (void *)sub_10000D2D8(v21, v24);
  }
  v29 = v27 + 2;
  if (v29 >= v13)
    goto LABEL_26;
  v28 = *(_QWORD *)(v6 + 8 * v29);
  if (v28)
  {
    v9 = v29;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v29 + 1;
    if (__OFADD__(v29, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v28 = *(_QWORD *)(v6 + 8 * v9);
    ++v29;
    if (v28)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10000AA24()
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
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  sub_10000D3B8(&qword_10003DAE8);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v2);
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
    v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      v9 = v23 + 1;
      if (v23 + 1 >= v13)
        goto LABEL_26;
      v24 = *(_QWORD *)(v6 + 8 * v9);
      if (!v24)
        break;
    }
LABEL_25:
    v12 = (v24 - 1) & v24;
    v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 16 * v15;
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v18);
    v21 = *v19;
    v20 = v19[1];
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v18);
    *v22 = v21;
    v22[1] = v20;
    result = (void *)swift_bridgeObjectRetain(v20);
  }
  v25 = v23 + 2;
  if (v25 >= v13)
    goto LABEL_26;
  v24 = *(_QWORD *)(v6 + 8 * v25);
  if (v24)
  {
    v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v9);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

Swift::Int sub_10000ABD0(uint64_t a1, uint64_t a2)
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
  Swift::Int result;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  unsigned __int8 v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  int64_t v39;
  _QWORD *v40;
  uint64_t i;
  char v42;
  __int128 v43;
  char v44;
  char v45;
  uint64_t v46;
  _QWORD v47[10];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_10000D3B8(&qword_10003DAB0);
  v42 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (*(_QWORD *)(v5 + 16))
  {
    v38 = v3;
    v9 = 1 << *(_BYTE *)(v5 + 32);
    v40 = (_QWORD *)(v5 + 64);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v39 = (unint64_t)(v9 + 63) >> 6;
    v12 = v7 + 64;
    result = swift_retain(v5);
    v14 = 0;
    for (i = v5; ; v5 = i)
    {
      if (v11)
      {
        v22 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v23 = v22 | (v14 << 6);
      }
      else
      {
        v24 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        if (v24 >= v39)
          goto LABEL_36;
        v25 = v40[v24];
        ++v14;
        if (!v25)
        {
          v14 = v24 + 1;
          if (v24 + 1 >= v39)
            goto LABEL_36;
          v25 = v40[v14];
          if (!v25)
          {
            v26 = v24 + 2;
            if (v26 >= v39)
            {
LABEL_36:
              swift_release(v5);
              v3 = v38;
              if ((v42 & 1) != 0)
              {
                v37 = 1 << *(_BYTE *)(v5 + 32);
                if (v37 >= 64)
                  bzero(v40, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v40 = -1 << v37;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v25 = v40[v26];
            if (!v25)
            {
              while (1)
              {
                v14 = v26 + 1;
                if (__OFADD__(v26, 1))
                  goto LABEL_43;
                if (v14 >= v39)
                  goto LABEL_36;
                v25 = v40[v14];
                ++v26;
                if (v25)
                  goto LABEL_33;
              }
            }
            v14 = v26;
          }
        }
LABEL_33:
        v11 = (v25 - 1) & v25;
        v23 = __clz(__rbit64(v25)) + (v14 << 6);
      }
      v31 = *(_BYTE *)(*(_QWORD *)(v5 + 48) + v23);
      v32 = *(_QWORD *)(v5 + 56) + (v23 << 6);
      v33 = *(_BYTE *)v32;
      v34 = *(_QWORD *)(v32 + 16);
      v46 = *(_QWORD *)(v32 + 8);
      v44 = *(_BYTE *)(v32 + 25);
      v45 = *(_BYTE *)(v32 + 24);
      v35 = *(_QWORD *)(v32 + 32);
      v36 = *(unsigned int *)(v32 + 40) | ((unint64_t)*(unsigned __int8 *)(v32 + 44) << 32);
      v43 = *(_OWORD *)(v32 + 48);
      if ((v42 & 1) == 0)
      {
        swift_bridgeObjectRetain(v34);
        sub_10000D2D8(v35, v36);
      }
      Hasher.init(_seed:)(v47, *(_QWORD *)(v8 + 40));
      CharacteristicKind.rawValue.getter(v31);
      v16 = v15;
      String.hash(into:)(v47, 0xD000000000000024, v15);
      swift_bridgeObjectRelease(v16);
      result = Hasher._finalize()();
      v17 = -1 << *(_BYTE *)(v8 + 32);
      v18 = result & ~v17;
      v19 = v18 >> 6;
      if (((-1 << v18) & ~*(_QWORD *)(v12 + 8 * (v18 >> 6))) != 0)
      {
        v20 = __clz(__rbit64((-1 << v18) & ~*(_QWORD *)(v12 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v27 = 0;
        v28 = (unint64_t)(63 - v17) >> 6;
        do
        {
          if (++v19 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_42;
          }
          v29 = v19 == v28;
          if (v19 == v28)
            v19 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v12 + 8 * v19);
        }
        while (v30 == -1);
        v20 = __clz(__rbit64(~v30)) + (v19 << 6);
      }
      *(_QWORD *)(v12 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
      *(_BYTE *)(*(_QWORD *)(v8 + 48) + v20) = v31;
      v21 = *(_QWORD *)(v8 + 56) + (v20 << 6);
      *(_BYTE *)v21 = v33;
      *(_QWORD *)(v21 + 8) = v46;
      *(_QWORD *)(v21 + 16) = v34;
      *(_BYTE *)(v21 + 24) = v45;
      *(_BYTE *)(v21 + 25) = v44;
      *(_QWORD *)(v21 + 32) = v35;
      *(_BYTE *)(v21 + 44) = BYTE4(v36);
      *(_DWORD *)(v21 + 40) = v36;
      *(_OWORD *)(v21 + 48) = v43;
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

uint64_t sub_10000AF50(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t *v35;

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_10000D3B8(&qword_10003DAE8);
  result = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v9 = 0;
    v35 = (uint64_t *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    v32 = -1 << v10;
    v33 = v10;
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v34 = (unint64_t)(v10 + 63) >> 6;
    v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v20 = v19 | (v9 << 6);
      }
      else
      {
        v21 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v21 >= v34)
          goto LABEL_36;
        v22 = v35[v21];
        ++v9;
        if (!v22)
        {
          v9 = v21 + 1;
          if (v21 + 1 >= v34)
            goto LABEL_36;
          v22 = v35[v9];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v34)
            {
LABEL_36:
              if ((a2 & 1) != 0)
              {
                if (v33 >= 64)
                  bzero(v35, 8 * v34);
                else
                  *v35 = v32;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v22 = v35[v23];
            if (!v22)
            {
              while (1)
              {
                v9 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_44;
                if (v9 >= v34)
                  goto LABEL_36;
                v22 = v35[v9];
                ++v23;
                if (v22)
                  goto LABEL_33;
              }
            }
            v9 = v23;
          }
        }
LABEL_33:
        v12 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v9 << 6);
      }
      v28 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v20);
      v29 = (uint64_t *)(*(_QWORD *)(v5 + 56) + 16 * v20);
      v30 = *v29;
      v31 = v29[1];
      if ((a2 & 1) == 0)
        swift_bridgeObjectRetain(v29[1]);
      result = static Hasher._hash(seed:_:)(*(_QWORD *)(v8 + 40), v28);
      v14 = -1 << *(_BYTE *)(v8 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_43;
          }
          v26 = v16 == v25;
          if (v16 == v25)
            v16 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(_QWORD *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(_QWORD *)(*(_QWORD *)(v8 + 48) + 8 * v17) = v28;
      v18 = (_QWORD *)(*(_QWORD *)(v8 + 56) + 16 * v17);
      *v18 = v30;
      v18[1] = v31;
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

void sub_10000B204(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_10000B264(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  BOOL *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  __int16 v43;
  char v44;
  char v45;
  char v46;
  char v47;

  v42 = v39;
  v43 = v40;
  v44 = BYTE2(v40);
  v45 = BYTE3(v40);
  v46 = BYTE4(v40);
  v47 = BYTE5(v40);
  if (!v38)
  {
    __break(1u);
    JUMPOUT(0x10000B448);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

void sub_10000B46C(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_10000B4C8()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;

  v8 = v3;
  v9 = v4;
  v10 = BYTE2(v4);
  v11 = BYTE3(v4);
  v12 = BYTE4(v4);
  v13 = BYTE5(v4);
  sub_10000B204((uint64_t)&v8, (uint64_t)&v8 + BYTE6(v4), v1, v0);
  sub_10000D484(v1, v0);
  if (!v2)
    v5 = v7;
  return v5 & 1;
}

unsigned __int8 *sub_10000B690(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned __int8 *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unsigned __int8 *v12;
  uint64_t v14;
  uint64_t v15;

  v14 = a1;
  v15 = a2;
  swift_bridgeObjectRetain(a2);
  v4 = String.init<A>(_:)(&v14, &type metadata for String, &protocol witness table for String, &protocol witness table for String);
  v6 = v4;
  v7 = v5;
  if ((v5 & 0x1000000000000000) == 0)
  {
    if ((v5 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v9 = HIBYTE(v7) & 0xF;
    v14 = v6;
    v15 = v7 & 0xFFFFFFFFFFFFFFLL;
    v8 = (unsigned __int8 *)&v14;
    goto LABEL_7;
  }
  v6 = sub_10000BCC0(v4, v5);
  v11 = v10;
  swift_bridgeObjectRelease(v7);
  v7 = v11;
  if ((v11 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v6 & 0x1000000000000000) != 0)
  {
    v8 = (unsigned __int8 *)((v7 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v9 = v6 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v8 = (unsigned __int8 *)_StringObject.sharedUTF8.getter(v6, v7);
  }
LABEL_7:
  v12 = sub_10000BA44(v8, v9, a3);
  swift_bridgeObjectRelease(v7);
  return v12;
}

unint64_t sub_10000B774(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  _QWORD *v14;
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = _HashTable.previousHole(before:)(result, a2 + 64, ~v5);
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v9 = *(_QWORD *)(a2 + 48);
        v10 = (_QWORD *)(v9 + 8 * v6);
        result = static Hasher._hash(seed:_:)(*(_QWORD *)(a2 + 40), *v10);
        v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            v14 = (_QWORD *)(v9 + 8 * v3);
            if (v3 != v6 || v14 >= v10 + 1)
              *v14 = *v10;
            v15 = *(_QWORD *)(a2 + 56);
            v16 = (_OWORD *)(v15 + 16 * v3);
            v17 = (_OWORD *)(v15 + 16 * v6);
            if (v3 != v6 || (v3 = v6, v16 >= v17 + 1))
            {
              *v16 = *v17;
              v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v19 = *v18;
    v20 = (-1 << v3) - 1;
  }
  else
  {
    v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    v20 = *v18;
    v19 = (-1 << result) - 1;
  }
  *v18 = v20 & v19;
  v21 = *(_QWORD *)(a2 + 16);
  v22 = __OFSUB__(v21, 1);
  v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_10000B908(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  char v20;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v10 = *v4;
  v12 = sub_10000A520(a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= result && (a4 & 1) == 0)
  {
    result = (uint64_t)sub_10000AA24();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = (_QWORD *)(v18[7] + 16 * v12);
      result = swift_bridgeObjectRelease(v19[1]);
      *v19 = a1;
      v19[1] = a2;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    *(_QWORD *)(v18[6] + 8 * v12) = a3;
    v21 = (_QWORD *)(v18[7] + 16 * v12);
    *v21 = a1;
    v21[1] = a2;
    v22 = v18[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (!v23)
    {
      v18[2] = v24;
      return result;
    }
    goto LABEL_14;
  }
  sub_10000AF50(result, a4 & 1);
  result = sub_10000A520(a3);
  if ((v16 & 1) == (v20 & 1))
  {
    v12 = result;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for Int);
  __break(1u);
  return result;
}

unsigned __int8 *sub_10000BA44(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 *v18;
  unsigned int v19;
  char v20;
  uint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  uint64_t v25;
  unsigned int v26;
  char v27;
  uint64_t v28;

  v3 = a2;
  v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        v5 = a2 - 1;
        if (a2 != 1)
        {
          v6 = a3 + 48;
          v7 = a3 + 55;
          v8 = a3 + 87;
          if (a3 > 10)
          {
            v6 = 58;
          }
          else
          {
            v8 = 97;
            v7 = 65;
          }
          if (result)
          {
            v9 = 0;
            for (i = result + 1; ; ++i)
            {
              v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8)
                    return 0;
                  v12 = -87;
                }
                else
                {
                  v12 = -55;
                }
              }
              else
              {
                v12 = -48;
              }
              v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12)))
                return 0;
              if (!--v5)
                return (unsigned __int8 *)v9;
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      v22 = a3 + 48;
      v23 = a3 + 55;
      v24 = a3 + 87;
      if (a3 > 10)
      {
        v22 = 58;
      }
      else
      {
        v24 = 97;
        v23 = 65;
      }
      if (result)
      {
        v25 = 0;
        do
        {
          v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24)
                return 0;
              v27 = -87;
            }
            else
            {
              v27 = -55;
            }
          }
          else
          {
            v27 = -48;
          }
          v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63)
            return 0;
          v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  v14 = a2 - 1;
  if (a2 == 1)
    return 0;
  v15 = a3 + 48;
  v16 = a3 + 55;
  v17 = a3 + 87;
  if (a3 > 10)
  {
    v15 = 58;
  }
  else
  {
    v17 = 97;
    v16 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v18 = result + 1;
  do
  {
    v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17)
          return 0;
        v20 = -87;
      }
      else
      {
        v20 = -55;
      }
    }
    else
    {
      v20 = -48;
    }
    v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20)))
      return 0;
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_10000BCC0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v2 = a1;
  v3 = 7;
  if (((a2 >> 60) & ((a1 & 0x800000000000000) == 0)) != 0)
    v3 = 11;
  v4 = String.subscript.getter(15, v3 | (v2 << 16), a1, a2);
  v6 = v5;
  v9 = sub_10000BD3C(v4, v7, v8, v5);
  swift_bridgeObjectRelease(v6);
  return v9;
}

uint64_t sub_10000BD3C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v5;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];

  v5 = a3;
  if ((a4 & 0x1000000000000000) != 0)
  {
    v12 = sub_10000BE80(a1, a2, a3, a4);
    if (v12)
    {
      v9 = v12;
      v8 = (unint64_t)sub_1000143AC(v12, 0);
      v5 = sub_10000BF6C((unint64_t)v15, v8 + 32, v9, a1, a2, v5, a4);
      v13 = v15[3];
      swift_bridgeObjectRetain(a4);
      swift_bridgeObjectRelease(v13);
      if (v5 != v9)
      {
        __break(1u);
        goto LABEL_11;
      }
    }
    else
    {
      v8 = (unint64_t)&_swiftEmptyArrayStorage;
    }
    v14 = static String._uncheckedFromUTF8(_:)(v8 + 32, *(_QWORD *)(v8 + 16));
    swift_release(v8);
    return v14;
  }
  else
  {
    v8 = a1 >> 16;
    v9 = a2 >> 16;
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
      {
        v10 = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
LABEL_5:
        v10 += v8;
        return static String._uncheckedFromUTF8(_:)(v10, v9 - v8);
      }
LABEL_11:
      v10 = _StringObject.sharedUTF8.getter(v5, a4);
      if (!v10)
        return static String._uncheckedFromUTF8(_:)(v10, v9 - v8);
      goto LABEL_5;
    }
    v15[0] = a3;
    v15[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return static String._uncheckedFromUTF8(_:)((char *)v15 + v8, v9 - v8);
  }
}

unint64_t sub_10000BE80(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_100014410(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_100014410(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return String.UTF8View._foreignDistance(from:to:)(v7, a2, a3, a4);
  }
  __break(1u);
  return result;
}

unint64_t sub_10000BF6C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_100014410(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = String.UTF8View._foreignSubscript(position:)();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = _StringObject.sharedUTF8.getter(a6, a7);
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_100014410(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = String.UTF8View._foreignIndex(after:)(v12, a6, a7);
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO8rawValueACSgSS_tcfC_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v3 = _findStringSwitchCaseWithCache(cases:string:cache:)(&off_100034A10, a1, a2, &unk_10003D630);
  swift_bridgeObjectRelease(a2);
  v4 = 0;
  result = 66;
  switch(v3)
  {
    case 0:
      goto LABEL_70;
    case 1:
      v4 = 1;
      goto LABEL_70;
    case 2:
      v4 = 2;
      goto LABEL_70;
    case 3:
      v4 = 3;
      goto LABEL_70;
    case 4:
      v4 = 4;
      goto LABEL_70;
    case 5:
      v4 = 5;
      goto LABEL_70;
    case 6:
      v4 = 6;
      goto LABEL_70;
    case 7:
      v4 = 7;
      goto LABEL_70;
    case 8:
      v4 = 8;
      goto LABEL_70;
    case 9:
      v4 = 9;
      goto LABEL_70;
    case 10:
      v4 = 10;
      goto LABEL_70;
    case 11:
      v4 = 11;
      goto LABEL_70;
    case 12:
      v4 = 12;
      goto LABEL_70;
    case 13:
      v4 = 13;
      goto LABEL_70;
    case 14:
      v4 = 14;
      goto LABEL_70;
    case 15:
      v4 = 15;
      goto LABEL_70;
    case 16:
      v4 = 16;
      goto LABEL_70;
    case 17:
      v4 = 17;
      goto LABEL_70;
    case 18:
      v4 = 18;
      goto LABEL_70;
    case 19:
      v4 = 19;
      goto LABEL_70;
    case 20:
      v4 = 20;
      goto LABEL_70;
    case 21:
      v4 = 21;
      goto LABEL_70;
    case 22:
      v4 = 22;
      goto LABEL_70;
    case 23:
      v4 = 23;
      goto LABEL_70;
    case 24:
      v4 = 24;
      goto LABEL_70;
    case 25:
      v4 = 25;
      goto LABEL_70;
    case 26:
      v4 = 26;
      goto LABEL_70;
    case 27:
      v4 = 27;
      goto LABEL_70;
    case 28:
      v4 = 28;
      goto LABEL_70;
    case 29:
      v4 = 29;
      goto LABEL_70;
    case 30:
      v4 = 30;
      goto LABEL_70;
    case 31:
      v4 = 31;
      goto LABEL_70;
    case 32:
      v4 = 32;
      goto LABEL_70;
    case 33:
      v4 = 33;
      goto LABEL_70;
    case 34:
      v4 = 34;
      goto LABEL_70;
    case 35:
      v4 = 35;
      goto LABEL_70;
    case 36:
      v4 = 36;
      goto LABEL_70;
    case 37:
      v4 = 37;
      goto LABEL_70;
    case 38:
      v4 = 38;
      goto LABEL_70;
    case 39:
      v4 = 39;
      goto LABEL_70;
    case 40:
      v4 = 40;
      goto LABEL_70;
    case 41:
      v4 = 41;
      goto LABEL_70;
    case 42:
      v4 = 42;
      goto LABEL_70;
    case 43:
      v4 = 43;
      goto LABEL_70;
    case 44:
      v4 = 44;
      goto LABEL_70;
    case 45:
      v4 = 45;
      goto LABEL_70;
    case 46:
      v4 = 46;
      goto LABEL_70;
    case 47:
      v4 = 47;
      goto LABEL_70;
    case 48:
      v4 = 48;
      goto LABEL_70;
    case 49:
      v4 = 49;
      goto LABEL_70;
    case 50:
      v4 = 50;
      goto LABEL_70;
    case 51:
      v4 = 51;
      goto LABEL_70;
    case 52:
      v4 = 52;
      goto LABEL_70;
    case 53:
      v4 = 53;
      goto LABEL_70;
    case 54:
      v4 = 54;
      goto LABEL_70;
    case 55:
      v4 = 55;
      goto LABEL_70;
    case 56:
      v4 = 56;
      goto LABEL_70;
    case 57:
      v4 = 57;
      goto LABEL_70;
    case 58:
      v4 = 58;
      goto LABEL_70;
    case 59:
      v4 = 59;
      goto LABEL_70;
    case 60:
      v4 = 60;
      goto LABEL_70;
    case 61:
      v4 = 61;
      goto LABEL_70;
    case 62:
      v4 = 62;
      goto LABEL_70;
    case 63:
      v4 = 63;
      goto LABEL_70;
    case 64:
      v4 = 64;
      goto LABEL_70;
    case 65:
      v4 = 65;
LABEL_70:
      result = v4;
      break;
    case 66:
      return result;
    case 67:
      result = 67;
      break;
    case 68:
      result = 68;
      break;
    case 69:
      result = 69;
      break;
    case 70:
      result = 70;
      break;
    case 71:
      result = 71;
      break;
    case 72:
      result = 72;
      break;
    case 73:
      result = 73;
      break;
    case 74:
      result = 74;
      break;
    case 75:
      result = 75;
      break;
    case 76:
      result = 76;
      break;
    case 77:
      result = 77;
      break;
    case 78:
      result = 78;
      break;
    case 79:
      result = 79;
      break;
    case 80:
      result = 80;
      break;
    case 81:
      result = 81;
      break;
    case 82:
      result = 82;
      break;
    case 83:
      result = 83;
      break;
    case 84:
      result = 84;
      break;
    case 85:
      result = 85;
      break;
    case 86:
      result = 86;
      break;
    case 87:
      result = 87;
      break;
    case 88:
      result = 88;
      break;
    case 89:
      result = 89;
      break;
    case 90:
      result = 90;
      break;
    case 91:
      result = 91;
      break;
    case 92:
      result = 92;
      break;
    case 93:
      result = 93;
      break;
    case 94:
      result = 94;
      break;
    case 95:
      result = 95;
      break;
    case 96:
      result = 96;
      break;
    case 97:
      result = 97;
      break;
    case 98:
      result = 98;
      break;
    case 99:
      result = 99;
      break;
    case 100:
      result = 100;
      break;
    case 101:
      result = 101;
      break;
    case 102:
      result = 102;
      break;
    case 103:
      result = 103;
      break;
    case 104:
      result = 104;
      break;
    case 105:
      result = 105;
      break;
    case 106:
      result = 106;
      break;
    case 107:
      result = 107;
      break;
    case 108:
      result = 108;
      break;
    case 109:
      result = 109;
      break;
    case 110:
      result = 110;
      break;
    case 111:
      result = 111;
      break;
    case 112:
      result = 112;
      break;
    case 113:
      result = 113;
      break;
    case 114:
      result = 114;
      break;
    case 115:
      result = 115;
      break;
    case 116:
      result = 116;
      break;
    case 117:
      result = 117;
      break;
    case 118:
      result = 118;
      break;
    case 119:
      result = 119;
      break;
    case 120:
      result = 120;
      break;
    case 121:
      result = 121;
      break;
    case 122:
      result = 122;
      break;
    case 123:
      result = 123;
      break;
    case 124:
      result = 124;
      break;
    case 125:
      result = 125;
      break;
    case 126:
      result = 126;
      break;
    case 127:
      result = 127;
      break;
    default:
      if ((unint64_t)(v3 - 128) >= 0x2E)
        result = 174;
      else
        result = v3 | 0xFFFFFF80;
      break;
  }
  return result;
}

unint64_t _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO6FormatO8rawValueAESgSS_tcfC_0(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100035B50, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 0xB)
    return 11;
  else
    return v3;
}

unint64_t _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO4UnitO8rawValueAESgSS_tcfC_0(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100035C78, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 6)
    return 6;
  else
    return v3;
}

uint64_t sub_10000C680(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t i;
  unint64_t v16;
  int64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21[2];
  uint64_t v22;

  v22 = a1;
  v6 = a2 + 64;
  v7 = 1 << *(_BYTE *)(a2 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(a2 + 64);
  v10 = (unint64_t)(v7 + 63) >> 6;
  result = swift_bridgeObjectRetain(a2);
  v12 = 0;
  if (!v9)
    goto LABEL_5;
LABEL_4:
  v13 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  for (i = v13 | (v12 << 6); ; i = __clz(__rbit64(v16)) + (v12 << 6))
  {
    v18 = (uint64_t *)(*(_QWORD *)(a2 + 48) + 16 * i);
    v19 = v18[1];
    v21[0] = *v18;
    v21[1] = v19;
    swift_bridgeObjectRetain(v19);
    sub_10000871C((unsigned __int8 *)&v22, v21, a3);
    if (v3)
    {
      v20 = v22;
      swift_release(a2);
      swift_bridgeObjectRelease(v19);
      return swift_bridgeObjectRelease(v20);
    }
    result = swift_bridgeObjectRelease(v19);
    if (v9)
      goto LABEL_4;
LABEL_5:
    if (__OFADD__(v12++, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v12 >= v10)
      goto LABEL_26;
    v16 = *(_QWORD *)(v6 + 8 * v12);
    if (!v16)
      break;
LABEL_17:
    v9 = (v16 - 1) & v16;
  }
  v17 = v12 + 1;
  if (v12 + 1 >= v10)
    goto LABEL_26;
  v16 = *(_QWORD *)(v6 + 8 * v17);
  if (v16)
    goto LABEL_16;
  v17 = v12 + 2;
  if (v12 + 2 >= v10)
    goto LABEL_26;
  v16 = *(_QWORD *)(v6 + 8 * v17);
  if (v16)
    goto LABEL_16;
  v17 = v12 + 3;
  if (v12 + 3 >= v10)
    goto LABEL_26;
  v16 = *(_QWORD *)(v6 + 8 * v17);
  if (v16)
    goto LABEL_16;
  v17 = v12 + 4;
  if (v12 + 4 >= v10)
  {
LABEL_26:
    swift_release(a2);
    return v22;
  }
  v16 = *(_QWORD *)(v6 + 8 * v17);
  if (v16)
  {
LABEL_16:
    v12 = v17;
    goto LABEL_17;
  }
  while (1)
  {
    v12 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v12 >= v10)
      goto LABEL_26;
    v16 = *(_QWORD *)(v6 + 8 * v12);
    ++v17;
    if (v16)
      goto LABEL_17;
  }
LABEL_28:
  __break(1u);
  return result;
}

unint64_t sub_10000C83C(uint64_t a1)
{
  float v2;
  float v3;
  unint64_t v4;
  char v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  char v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  float v19;
  float v20;
  uint64_t v22;
  uint64_t v23;

  if (!a1)
    return 0;
  v2 = 0.0;
  v3 = 1.0;
  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_28;
  v4 = sub_10000A4BC(0x74694264696C6156, 0xE900000000000073);
  if ((v5 & 1) != 0)
  {
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v4);
    ((void (*)(void))swift_unknownObjectRetain)();
    v6 = sub_10000D3B8(&qword_10003DAE0);
    if ((swift_dynamicCast(&v22, &v23, (char *)&type metadata for Swift.AnyObject + 8, v6, 6) & 1) != 0)
      goto LABEL_8;
  }
  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_28;
  v7 = sub_10000A4BC(0x6C615664696C6156, 0xEB00000000736575);
  if ((v8 & 1) == 0
    || (v23 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v7),
        ((void (*)(void))swift_unknownObjectRetain)(),
        v9 = sub_10000D3B8(&qword_10003DAE0),
        (swift_dynamicCast(&v22, &v23, (char *)&type metadata for Swift.AnyObject + 8, v9, 6) & 1) == 0))
  {
    if (*(_QWORD *)(a1 + 16))
    {
      v12 = sub_10000A4BC(0x566D756D696E694DLL, 0xEC00000065756C61);
      if ((v13 & 1) != 0)
      {
        v23 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v12);
        ((void (*)(void))swift_unknownObjectRetain)();
        if ((swift_dynamicCast(&v22, &v23, (char *)&type metadata for Swift.AnyObject + 8, &type metadata for Float, 6) & 1) != 0)v2 = *(float *)&v22;
      }
      if (*(_QWORD *)(a1 + 16))
      {
        v14 = sub_10000A4BC(0x566D756D6978614DLL, 0xEC00000065756C61);
        if ((v15 & 1) != 0)
        {
          v23 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v14);
          ((void (*)(void))swift_unknownObjectRetain)();
          if (swift_dynamicCast(&v22, &v23, (char *)&type metadata for Swift.AnyObject + 8, &type metadata for Float, 6))v3 = *(float *)&v22;
        }
        if (*(_QWORD *)(a1 + 16))
        {
          v16 = sub_10000A4BC(0x756C615670657473, 0xE900000000000065);
          if ((v17 & 1) != 0)
          {
            v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v16);
            swift_unknownObjectRetain(v18);
            swift_bridgeObjectRelease(a1);
            v23 = v18;
            if ((swift_dynamicCast(&v22, &v23, (char *)&type metadata for Swift.AnyObject + 8, &type metadata for Float, 6) & 1) != 0)
            {
              if (v3 >= v2)
                v19 = v2;
              else
                v19 = v3;
              if (v2 > v3)
                v20 = v2;
              else
                v20 = v3;
              return LODWORD(v19) | ((unint64_t)LODWORD(v20) << 32);
            }
LABEL_29:
            if (v2 > v3)
              v20 = v2;
            else
              v20 = v3;
            if (v3 >= v2)
              v19 = v2;
            else
              v19 = v3;
            return LODWORD(v19) | ((unint64_t)LODWORD(v20) << 32);
          }
        }
      }
    }
LABEL_28:
    swift_bridgeObjectRelease(a1);
    goto LABEL_29;
  }
LABEL_8:
  swift_bridgeObjectRelease(a1);
  v10 = v22;
  swift_bridgeObjectRetain(v22);
  v11 = sub_10000C680((uint64_t)&_swiftEmptyDictionarySingleton, v10, v10);
  swift_bridgeObjectRelease_n(v10, 2);
  return v11;
}

uint64_t sub_10000CB64(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  v2 = 0;
  v3 = (_QWORD *)(a1 + 40);
  do
  {
    v4 = *(v3 - 1);
    v5 = *v3;
    v6 = v4 == 0x5264657275636573 && v5 == 0xEB00000000646165;
    if (v6
      || (_stringCompareWithSmolCheck(_:_:expecting:)(0x5264657275636573, 0xEB00000000646165, *(v3 - 1), *v3, 0) & 1) != 0)
    {
      v2 |= 1uLL;
    }
    else
    {
      v7 = v4 == 0x5764657275636573 && v5 == 0xEC00000065746972;
      if ((v7
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x5764657275636573, 0xEC00000065746972, v4, v5, 0) & 1) != 0)
        && (v2 & 2) == 0)
      {
        v2 |= 2uLL;
      }
    }
    v3 += 2;
    --v1;
  }
  while (v1);
  return v2;
}

uint64_t sub_10000CC88(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  v2 = 0;
  v3 = (_QWORD *)(a1 + 40);
  do
  {
    v4 = *(v3 - 1);
    v5 = *v3;
    v6 = v4 == 1684104562 && v5 == 0xE400000000000000;
    if (v6
      || (_stringCompareWithSmolCheck(_:_:expecting:)(1684104562, 0xE400000000000000, *(v3 - 1), *v3, 0) & 1) != 0)
    {
      v2 |= 1uLL;
    }
    else
    {
      v7 = v4 == 0x6574697277 && v5 == 0xE500000000000000;
      if (v7
        || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6574697277, 0xE500000000000000, v4, v5, 0) & 1) != 0)
      {
        v2 |= 2uLL;
      }
      else if (v4 == 0x796669746F6E63 && v5 == 0xE700000000000000
             || (_stringCompareWithSmolCheck(_:_:expecting:)(0x796669746F6E63, 0xE700000000000000, v4, v5, 0) & 1) != 0)
      {
        v2 |= 4uLL;
      }
      else if ((v4 == 0x6669746F6E636E75 && v5 == 0xE900000000000079
              || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6669746F6E636E75, 0xE900000000000079, v4, v5, 0) & 1) != 0)
             && (v2 & 8) == 0)
      {
        v2 |= 8uLL;
      }
    }
    v3 += 2;
    --v1;
  }
  while (v1);
  return v2;
}

uint64_t sub_10000CE24(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v6;
  unint64_t v7;
  uint64_t v9;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v4 < 0)
  {
LABEL_9:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v6 = a4 + 72 * a1 + 32;
  v7 = a3 + 72 * v4;
  if (v6 >= v7 || v6 + 72 * v4 <= a3)
  {
    v9 = sub_10000D3B8(&qword_10003DAC0);
    swift_arrayInitWithCopy(a3, v6, v4, v9);
    return v7;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10000CF30(uint64_t a1, char a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  char v21;
  unint64_t v22;
  char v23;
  _QWORD *v24;
  unint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t result;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  char v36;
  char v37;

  v4 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain(a1);
  if (v4)
  {
    v5 = (uint64_t *)(a1 + 48);
    do
    {
      v9 = *((unsigned int *)v5 + 8) | ((unint64_t)*((unsigned __int8 *)v5 + 36) << 32);
      v36 = *((_BYTE *)v5 + 16);
      v37 = *((_BYTE *)v5 + 17);
      v35 = *((_BYTE *)v5 - 8);
      v10 = *((_BYTE *)v5 - 16);
      v12 = v5[5];
      v11 = v5[6];
      v13 = v5[3];
      v14 = v5[1];
      v34 = *v5;
      swift_bridgeObjectRetain(v14);
      sub_10000D2D8(v13, v9);
      if (!v14)
        break;
      v32 = v12;
      v33 = v11;
      v31 = v4;
      v15 = (_QWORD *)*a3;
      v17 = sub_10000A448(v10);
      v18 = v15[2];
      v19 = (v16 & 1) == 0;
      v20 = v18 + v19;
      if (__OFADD__(v18, v19))
      {
        __break(1u);
LABEL_17:
        __break(1u);
LABEL_18:
        result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for CharacteristicKind);
        __break(1u);
        return result;
      }
      v21 = v16;
      if (v15[3] >= v20)
      {
        if ((a2 & 1) == 0)
          sub_10000A834();
      }
      else
      {
        sub_10000ABD0(v20, a2 & 1);
        v22 = sub_10000A448(v10);
        if ((v21 & 1) != (v23 & 1))
          goto LABEL_18;
        v17 = v22;
      }
      v24 = (_QWORD *)*a3;
      if ((v21 & 1) != 0)
      {
        v6 = v24[7] + (v17 << 6);
        v7 = *(_QWORD *)(v6 + 32);
        v8 = *(unsigned int *)(v6 + 40) | ((unint64_t)*(unsigned __int8 *)(v6 + 44) << 32);
        swift_bridgeObjectRelease(*(_QWORD *)(v6 + 16));
        sub_10001255C(v7, v8);
        *(_BYTE *)v6 = v35;
        *(_QWORD *)(v6 + 8) = v34;
        *(_QWORD *)(v6 + 16) = v14;
        *(_BYTE *)(v6 + 24) = v36;
        *(_BYTE *)(v6 + 25) = v37;
        *(_QWORD *)(v6 + 32) = v13;
        *(_BYTE *)(v6 + 44) = BYTE4(v9);
        *(_DWORD *)(v6 + 40) = v9;
        *(_QWORD *)(v6 + 48) = v32;
        *(_QWORD *)(v6 + 56) = v33;
      }
      else
      {
        v24[(v17 >> 6) + 8] |= 1 << v17;
        *(_BYTE *)(v24[6] + v17) = v10;
        v25 = v24[7] + (v17 << 6);
        *(_BYTE *)v25 = v35;
        *(_QWORD *)(v25 + 8) = v34;
        *(_QWORD *)(v25 + 16) = v14;
        *(_BYTE *)(v25 + 24) = v36;
        *(_BYTE *)(v25 + 25) = v37;
        *(_QWORD *)(v25 + 32) = v13;
        *(_BYTE *)(v25 + 44) = BYTE4(v9);
        *(_DWORD *)(v25 + 40) = v9;
        *(_QWORD *)(v25 + 48) = v32;
        *(_QWORD *)(v25 + 56) = v33;
        v26 = v24[2];
        v27 = __OFADD__(v26, 1);
        v28 = v26 + 1;
        if (v27)
          goto LABEL_17;
        v24[2] = v28;
      }
      v5 += 9;
      a2 = 1;
      v4 = v31 - 1;
    }
    while (v31 != 1);
  }
  return swift_bridgeObjectRelease(a1);
}

uint64_t _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO1loiySbAC_ACtFZ_0(unsigned __int8 a1, unsigned __int8 a2)
{
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  char v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  unint64_t v14;
  char v15;

  if (qword_10003D5C0 != -1)
    swift_once(&qword_10003D5C0, sub_100004EA4);
  v4 = 0x6E776F6E6B6E75;
  v5 = off_10003D5C8;
  if (!*((_QWORD *)off_10003D5C8 + 2))
  {
    v9 = 0xE700000000000000;
    v10 = 0x6E776F6E6B6E75;
    goto LABEL_12;
  }
  v6 = sub_10000A448(a1);
  if ((v7 & 1) != 0)
  {
    v8 = v5[7] + (v6 << 6);
    v10 = *(_QWORD *)(v8 + 8);
    v9 = *(_QWORD *)(v8 + 16);
    swift_bridgeObjectRetain(v9);
    if (!v5[2])
      goto LABEL_12;
  }
  else
  {
    v9 = 0xE700000000000000;
    v10 = 0x6E776F6E6B6E75;
    if (!v5[2])
      goto LABEL_12;
  }
  v11 = sub_10000A448(a2);
  if ((v12 & 1) != 0)
  {
    v13 = v5[7] + (v11 << 6);
    v4 = *(_QWORD *)(v13 + 8);
    v14 = *(_QWORD *)(v13 + 16);
    swift_bridgeObjectRetain(v14);
    if (v10 != v4)
      goto LABEL_15;
    goto LABEL_13;
  }
LABEL_12:
  v14 = 0xE700000000000000;
  if (v10 != 0x6E776F6E6B6E75)
  {
LABEL_15:
    v15 = _stringCompareWithSmolCheck(_:_:expecting:)(v10, v9, v4, v14, 1);
    goto LABEL_16;
  }
LABEL_13:
  if (v9 != v14)
    goto LABEL_15;
  v15 = 0;
  v14 = v9;
LABEL_16:
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v14);
  return v15 & 1;
}

uint64_t sub_10000D2D8(uint64_t result, uint64_t a2)
{
  if (BYTE4(a2) != 255)
    return sub_10000D2EC(result, a2, BYTE4(a2));
  return result;
}

uint64_t sub_10000D2EC(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u)
    return swift_bridgeObjectRetain(result);
  return result;
}

uint64_t sub_10000D300(uint64_t result, unint64_t a2, char a3)
{
  if (a3 == 10 || a3 == 9)
    return sub_10000D32C(result, a2);
  if (a3 == 8)
    return swift_bridgeObjectRetain(a2);
  return result;
}

uint64_t sub_10000D32C(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    ((void (*)(void))swift_retain)();
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000D370(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000D3B8(&qword_10003D650);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000D3B8(uint64_t *a1)
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

uint64_t sub_10000D3F8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10000D3B8(&qword_10003D650);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *sub_10000D438(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000D448(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000D484(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    ((void (*)(void))swift_release)();
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000D4C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;

  result = __DataStorage._bytes.getter();
  v11 = result;
  if (result)
  {
    result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  v12 = __OFSUB__(a2, a1);
  v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }
  v14 = __DataStorage._length.getter();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_10000B204(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

void _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO5ValueO21__derived_enum_equalsySbAE_AEtFZ_0(uint64_t a1, uint64_t a2, char a3)
{
  __asm { BR              X10 }
}

uint64_t sub_10000D9D0(char a1, unsigned __int8 a2)
{
  if (a1 == 2)
    return 0;
  else
    return ((uint64_t (*)(_QWORD, _QWORD, uint64_t))((char *)sub_10000DA18 + 4 * byte_100026F36[a2]))(0, 0, 255);
}

uint64_t sub_10000DA18@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

uint64_t sub_10000DA28@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

uint64_t sub_10000DA38@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

uint64_t sub_10000DA48@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

uint64_t sub_10000DA58@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

uint64_t sub_10000DA68@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

uint64_t sub_10000DA78@<X0>(int a1@<W8>)
{
  if (a1)
    return 0x3FF0000000000000;
  else
    return 0;
}

uint64_t sub_10000DA90@<X0>(int a1@<W8>)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  if (a1)
    v1 = 1702195828;
  else
    v1 = 0x65736C6166;
  if (a1)
    v2 = 0xE400000000000000;
  else
    v2 = 0xE500000000000000;
  v3 = v2;
  String.append(_:)(*(Swift::String *)&v1);
  swift_bridgeObjectRelease(v2);
  return 0;
}

uint64_t sub_10000DAFC(uint64_t result, unint64_t a2, char a3)
{
  if (a3 == 10 || a3 == 9)
    return sub_10000D484(result, a2);
  if (a3 == 8)
    return swift_bridgeObjectRelease(a2);
  return result;
}

_QWORD *sub_10000DB28(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_10000DB4C()
{
  unint64_t result;

  result = qword_10003D6C0;
  if (!qword_10003D6C0)
  {
    result = swift_getWitnessTable(&unk_100028E28, &type metadata for CharacteristicKind.Value.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D6C0);
  }
  return result;
}

unint64_t sub_10000DB90()
{
  unint64_t result;

  result = qword_10003D6C8;
  if (!qword_10003D6C8)
  {
    result = swift_getWitnessTable(&unk_100028DD8, &type metadata for CharacteristicKind.Value.DataCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D6C8);
  }
  return result;
}

unint64_t sub_10000DBD4()
{
  unint64_t result;

  result = qword_10003D6D0;
  if (!qword_10003D6D0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store(result, (unint64_t *)&qword_10003D6D0);
  }
  return result;
}

unint64_t sub_10000DC18()
{
  unint64_t result;

  result = qword_10003D6D8;
  if (!qword_10003D6D8)
  {
    result = swift_getWitnessTable(&unk_100028D88, &type metadata for CharacteristicKind.Value.Tlv8CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D6D8);
  }
  return result;
}

unint64_t sub_10000DC5C()
{
  unint64_t result;

  result = qword_10003D6E0;
  if (!qword_10003D6E0)
  {
    result = swift_getWitnessTable(&unk_100028D38, &type metadata for CharacteristicKind.Value.StringCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D6E0);
  }
  return result;
}

unint64_t sub_10000DCA0()
{
  unint64_t result;

  result = qword_10003D6E8;
  if (!qword_10003D6E8)
  {
    result = swift_getWitnessTable(&unk_100028CE8, &type metadata for CharacteristicKind.Value.FloatCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D6E8);
  }
  return result;
}

unint64_t sub_10000DCE4()
{
  unint64_t result;

  result = qword_10003D6F0;
  if (!qword_10003D6F0)
  {
    result = swift_getWitnessTable(&unk_100028C98, &type metadata for CharacteristicKind.Value.Int32CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D6F0);
  }
  return result;
}

unint64_t sub_10000DD28()
{
  unint64_t result;

  result = qword_10003D6F8;
  if (!qword_10003D6F8)
  {
    result = swift_getWitnessTable(&unk_100028C48, &type metadata for CharacteristicKind.Value.IntCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D6F8);
  }
  return result;
}

unint64_t sub_10000DD6C()
{
  unint64_t result;

  result = qword_10003D700;
  if (!qword_10003D700)
  {
    result = swift_getWitnessTable(&unk_100028BF8, &type metadata for CharacteristicKind.Value.Uint64CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D700);
  }
  return result;
}

unint64_t sub_10000DDB0()
{
  unint64_t result;

  result = qword_10003D708;
  if (!qword_10003D708)
  {
    result = swift_getWitnessTable(&unk_100028BA8, &type metadata for CharacteristicKind.Value.Uint32CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D708);
  }
  return result;
}

unint64_t sub_10000DDF4()
{
  unint64_t result;

  result = qword_10003D710;
  if (!qword_10003D710)
  {
    result = swift_getWitnessTable(&unk_100028B58, &type metadata for CharacteristicKind.Value.Uint16CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D710);
  }
  return result;
}

unint64_t sub_10000DE38()
{
  unint64_t result;

  result = qword_10003D718;
  if (!qword_10003D718)
  {
    result = swift_getWitnessTable(&unk_100028B08, &type metadata for CharacteristicKind.Value.Uint8CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D718);
  }
  return result;
}

unint64_t sub_10000DE7C()
{
  unint64_t result;

  result = qword_10003D720;
  if (!qword_10003D720)
  {
    result = swift_getWitnessTable(&unk_100028AB8, &type metadata for CharacteristicKind.Value.BoolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D720);
  }
  return result;
}

unint64_t sub_10000DEC0()
{
  unint64_t result;

  result = qword_10003D728;
  if (!qword_10003D728)
  {
    result = swift_getWitnessTable(&unk_100028A68, &type metadata for CharacteristicKind.Value.NullCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D728);
  }
  return result;
}

uint64_t sub_10000DF04(uint64_t a1, unint64_t a2)
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
  unint64_t v15;
  unint64_t v16;
  char v17;

  if (a1 == 1819047278 && a2 == 0xE400000000000000)
  {
    v5 = 0xE400000000000000;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(1819047278, 0xE400000000000000, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 1819242338 && a2 == 0xE400000000000000)
  {
    v7 = 0xE400000000000000;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(1819242338, 0xE400000000000000, a1, a2, 0) & 1) != 0)
  {
    v7 = a2;
    goto LABEL_14;
  }
  if (a1 == 0x38746E6975 && a2 == 0xE500000000000000)
  {
    v8 = 0xE500000000000000;
LABEL_20:
    swift_bridgeObjectRelease(v8);
    return 2;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x38746E6975, 0xE500000000000000, a1, a2, 0) & 1) != 0)
  {
    v8 = a2;
    goto LABEL_20;
  }
  if (a1 == 0x3631746E6975 && a2 == 0xE600000000000000)
  {
    v9 = 0xE600000000000000;
LABEL_26:
    swift_bridgeObjectRelease(v9);
    return 3;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x3631746E6975, 0xE600000000000000, a1, a2, 0) & 1) != 0)
  {
    v9 = a2;
    goto LABEL_26;
  }
  if (a1 == 0x3233746E6975 && a2 == 0xE600000000000000)
  {
    v10 = 0xE600000000000000;
LABEL_32:
    swift_bridgeObjectRelease(v10);
    return 4;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x3233746E6975, 0xE600000000000000, a1, a2, 0) & 1) != 0)
  {
    v10 = a2;
    goto LABEL_32;
  }
  if (a1 == 0x3436746E6975 && a2 == 0xE600000000000000)
  {
    v11 = 0xE600000000000000;
LABEL_38:
    swift_bridgeObjectRelease(v11);
    return 5;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x3436746E6975, 0xE600000000000000, a1, a2, 0) & 1) != 0)
  {
    v11 = a2;
    goto LABEL_38;
  }
  if (a1 == 7630441 && a2 == 0xE300000000000000)
  {
    v12 = 0xE300000000000000;
LABEL_44:
    swift_bridgeObjectRelease(v12);
    return 6;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(7630441, 0xE300000000000000, a1, a2, 0) & 1) != 0)
  {
    v12 = a2;
    goto LABEL_44;
  }
  if (a1 == 0x3233746E69 && a2 == 0xE500000000000000)
  {
    v13 = 0xE500000000000000;
LABEL_50:
    swift_bridgeObjectRelease(v13);
    return 7;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x3233746E69, 0xE500000000000000, a1, a2, 0) & 1) != 0)
  {
    v13 = a2;
    goto LABEL_50;
  }
  if (a1 == 0x74616F6C66 && a2 == 0xE500000000000000)
  {
    v14 = 0xE500000000000000;
LABEL_56:
    swift_bridgeObjectRelease(v14);
    return 8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x74616F6C66, 0xE500000000000000, a1, a2, 0) & 1) != 0)
  {
    v14 = a2;
    goto LABEL_56;
  }
  if (a1 == 0x676E69727473 && a2 == 0xE600000000000000)
  {
    v15 = 0xE600000000000000;
LABEL_62:
    swift_bridgeObjectRelease(v15);
    return 9;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x676E69727473, 0xE600000000000000, a1, a2, 0) & 1) != 0)
  {
    v15 = a2;
    goto LABEL_62;
  }
  if (a1 == 947285108 && a2 == 0xE400000000000000)
  {
    v16 = 0xE400000000000000;
LABEL_68:
    swift_bridgeObjectRelease(v16);
    return 10;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(947285108, 0xE400000000000000, a1, a2, 0) & 1) != 0)
  {
    v16 = a2;
    goto LABEL_68;
  }
  if (a1 == 1635017060 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease(0xE400000000000000);
    return 11;
  }
  else
  {
    v17 = _stringCompareWithSmolCheck(_:_:expecting:)(1635017060, 0xE400000000000000, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v17 & 1) != 0)
      return 11;
    else
      return 12;
  }
}

uint64_t sub_10000E354(_QWORD *a1)
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v38[5];
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
  char *v60;
  char *v61;
  char *v62;
  char *v63;
  char *v64;
  char *v65;
  char *v66;
  char *v67;
  char *v68;
  char *v69;
  char *v70;
  _QWORD *v71;
  uint64_t v72;

  v2 = sub_10000D3B8(&qword_10003DA38);
  v3 = *(_QWORD *)(v2 - 8);
  v58 = v2;
  v59 = v3;
  __chkstk_darwin();
  v65 = (char *)v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_10000D3B8(&qword_10003DA40);
  v56 = *(_QWORD *)(v5 - 8);
  v57 = v5;
  __chkstk_darwin();
  v70 = (char *)v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_10000D3B8(&qword_10003DA48);
  v54 = *(_QWORD *)(v7 - 8);
  v55 = v7;
  __chkstk_darwin();
  v69 = (char *)v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = sub_10000D3B8(&qword_10003DA50);
  v52 = *(_QWORD *)(v53 - 8);
  __chkstk_darwin();
  v64 = (char *)v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = sub_10000D3B8(&qword_10003DA58);
  v50 = *(_QWORD *)(v51 - 8);
  __chkstk_darwin();
  v68 = (char *)v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = sub_10000D3B8(&qword_10003DA60);
  v46 = *(_QWORD *)(v49 - 8);
  __chkstk_darwin();
  v62 = (char *)v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = sub_10000D3B8(&qword_10003DA68);
  v47 = *(_QWORD *)(v48 - 8);
  __chkstk_darwin();
  v67 = (char *)v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = sub_10000D3B8(&qword_10003DA70);
  v44 = *(_QWORD *)(v45 - 8);
  __chkstk_darwin();
  v63 = (char *)v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = sub_10000D3B8(&qword_10003DA78);
  v42 = *(_QWORD *)(v43 - 8);
  __chkstk_darwin();
  v66 = (char *)v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = sub_10000D3B8(&qword_10003DA80);
  v40 = *(_QWORD *)(v41 - 8);
  __chkstk_darwin();
  v61 = (char *)v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = sub_10000D3B8(&qword_10003DA88);
  v38[4] = *(_QWORD *)(v39 - 8);
  __chkstk_darwin();
  v60 = (char *)v38 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_10000D3B8(&qword_10003DA90);
  v18 = *(_QWORD *)(v17 - 8);
  __chkstk_darwin();
  v20 = (char *)v38 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_10000D3B8(&qword_10003DA98);
  v22 = *(_QWORD *)(v21 - 8);
  __chkstk_darwin();
  v24 = (char *)v38 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = a1[3];
  v26 = a1[4];
  v71 = a1;
  sub_10000DB28(a1, v25);
  v27 = sub_10000DB4C();
  v28 = v72;
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for CharacteristicKind.Value.CodingKeys, &type metadata for CharacteristicKind.Value.CodingKeys, v27, v25, v26);
  if (!v28)
  {
    v38[2] = v20;
    v38[0] = v18;
    v38[1] = v17;
    v38[3] = 0;
    v72 = v22;
    v29 = KeyedDecodingContainer.allKeys.getter(v21);
    v30 = v29;
    v31 = v21;
    if (*(_QWORD *)(v29 + 16) == 1)
      __asm { BR              X10 }
    v21 = type metadata accessor for DecodingError(0);
    swift_allocError(v21, &protocol witness table for DecodingError, 0, 0);
    v32 = v30;
    v34 = v33;
    sub_10000D3B8(&qword_10003DA18);
    *v34 = &type metadata for CharacteristicKind.Value;
    v35 = KeyedDecodingContainer.codingPath.getter(v31);
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)(v35, 0xD00000000000002BLL, 0x800000010002C370, 0);
    v36 = (*(uint64_t (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v21 - 8) + 104))(v34, enum case for DecodingError.typeMismatch(_:), v21);
    swift_willThrow(v36);
    swift_bridgeObjectRelease(v32);
    (*(void (**)(char *, uint64_t))(v72 + 8))(v24, v31);
  }
  sub_10001244C(v71);
  return v21;
}

void sub_10000ED90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_BYTE *)(v4 - 104) = 10;
  v5 = sub_10000DC18();
  v6 = v0;
  v7 = *(_QWORD *)(v4 - 392);
  KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)(&type metadata for CharacteristicKind.Value.Tlv8CodingKeys, v4 - 104, v0, &type metadata for CharacteristicKind.Value.Tlv8CodingKeys, v5);
  if (v7)
    JUMPOUT(0x10000EDD8);
  sub_100012514();
  v8 = *(_QWORD *)(v4 - 232);
  KeyedDecodingContainer.decode<A>(_:forKey:)((_QWORD *)(v4 - 104), &type metadata for Data);
  v9 = *(_QWORD *)(v4 - 112);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 240) + 8))(v3, v8);
  swift_bridgeObjectRelease(v1);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v2, v6);
  sub_10001244C(*(_QWORD **)(v4 - 120));
  JUMPOUT(0x10000ED5CLL);
}

void sub_10000EDEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_BYTE *)(v3 - 104) = 11;
  v4 = sub_10000DB90();
  v5 = *(_QWORD *)(v3 - 168);
  v6 = v0;
  v7 = *(_QWORD *)(v3 - 392);
  KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)(&type metadata for CharacteristicKind.Value.DataCodingKeys, v3 - 104, v0, &type metadata for CharacteristicKind.Value.DataCodingKeys, v4);
  if (v7)
  {
    swift_bridgeObjectRelease(v1);
    JUMPOUT(0x10000ED4CLL);
  }
  sub_100012514();
  v8 = *(_QWORD *)(v3 - 224);
  KeyedDecodingContainer.decode<A>(_:forKey:)((_QWORD *)(v3 - 104), &type metadata for Data);
  v9 = *(_QWORD *)(v3 - 112);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 216) + 8))(v5, v8);
  swift_bridgeObjectRelease(v1);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v2, v6);
  JUMPOUT(0x10000F260);
}

unint64_t sub_10000F26C()
{
  unint64_t result;

  result = qword_10003D738;
  if (!qword_10003D738)
  {
    result = swift_getWitnessTable(&unk_100028A18, &type metadata for CharacteristicKind.Constraints.MinMaxStepValues.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D738);
  }
  return result;
}

uint64_t sub_10000F2B0(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  unint64_t v7;
  char v8;

  if (a1 == 0x566D756D696E696DLL && a2 == 0xEC00000065756C61)
  {
    v5 = 0xEC00000065756C61;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x566D756D696E696DLL, 0xEC00000065756C61, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x566D756D6978616DLL && a2 == 0xEC00000065756C61)
  {
    v7 = 0xEC00000065756C61;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x566D756D6978616DLL, 0xEC00000065756C61, a1, a2, 0) & 1) != 0)
  {
    v7 = a2;
    goto LABEL_14;
  }
  if (a1 == 0x756C615670657473 && a2 == 0xE900000000000065)
  {
    swift_bridgeObjectRelease(0xE900000000000065);
    return 2;
  }
  else
  {
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)(0x756C615670657473, 0xE900000000000065, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v8 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

float sub_10000F43C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  float v9;
  float v10;
  uint64_t v12;
  char v13;
  char v14;
  char v15;

  v2 = sub_10000D3B8(&qword_10003DA30);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = a1[3];
  v7 = a1[4];
  sub_10000DB28(a1, v6);
  v8 = sub_10000F26C();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for CharacteristicKind.Constraints.MinMaxStepValues.CodingKeys, &type metadata for CharacteristicKind.Constraints.MinMaxStepValues.CodingKeys, v8, v6, v7);
  v15 = 0;
  KeyedDecodingContainer.decode(_:forKey:)(&v15, v2);
  v10 = v9;
  v14 = 1;
  KeyedDecodingContainer.decode(_:forKey:)(&v14, v2);
  v13 = 2;
  KeyedDecodingContainer.decode(_:forKey:)(&v13, v2);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_10001244C(a1);
  return v10;
}

unint64_t sub_10000F5C0()
{
  unint64_t result;

  result = qword_10003D760;
  if (!qword_10003D760)
  {
    result = swift_getWitnessTable(&unk_1000289C8, &type metadata for CharacteristicKind.Constraints.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D760);
  }
  return result;
}

unint64_t sub_10000F604()
{
  unint64_t result;

  result = qword_10003D768;
  if (!qword_10003D768)
  {
    result = swift_getWitnessTable(&unk_100028978, &type metadata for CharacteristicKind.Constraints.MinMaxStepValuesCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D768);
  }
  return result;
}

unint64_t sub_10000F648()
{
  unint64_t result;

  result = qword_10003D770;
  if (!qword_10003D770)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CharacteristicKind.Constraints.MinMaxStepValues, &type metadata for CharacteristicKind.Constraints.MinMaxStepValues);
    atomic_store(result, (unint64_t *)&qword_10003D770);
  }
  return result;
}

unint64_t sub_10000F68C()
{
  unint64_t result;

  result = qword_10003D778;
  if (!qword_10003D778)
  {
    result = swift_getWitnessTable(&unk_100028928, &type metadata for CharacteristicKind.Constraints.ValidBitsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D778);
  }
  return result;
}

uint64_t sub_10000F6D0(uint64_t *a1)
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

unint64_t sub_10000F714()
{
  unint64_t result;

  result = qword_10003D790;
  if (!qword_10003D790)
  {
    result = swift_getWitnessTable(&unk_1000288D8, &type metadata for CharacteristicKind.Constraints.ValidValuesCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D790);
  }
  return result;
}

uint64_t sub_10000F758(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  unint64_t v7;
  char v8;

  if (a1 == 0x6C615664696C6176 && a2 == 0xEB00000000736575)
  {
    v5 = 0xEB00000000736575;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6C615664696C6176, 0xEB00000000736575, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x74694264696C6176 && a2 == 0xE900000000000073)
  {
    v7 = 0xE900000000000073;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x74694264696C6176, 0xE900000000000073, a1, a2, 0) & 1) != 0)
  {
    v7 = a2;
    goto LABEL_14;
  }
  if (a1 == 0xD000000000000010 && a2 == 0x800000010002C350)
  {
    swift_bridgeObjectRelease(0x800000010002C350);
    return 2;
  }
  else
  {
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000010, 0x800000010002C350, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v8 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_10000F8CC(_QWORD *a1)
{
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  _QWORD *v23;
  _QWORD *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  unint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  _QWORD *v53;
  uint64_t v54;
  char *v55;

  v2 = sub_10000D3B8(&qword_10003D9F8);
  v48 = *(_QWORD *)(v2 - 8);
  v49 = v2;
  __chkstk_darwin();
  v52 = (char *)&v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = sub_10000D3B8(&qword_10003DA00);
  v47 = *(_QWORD *)(v50 - 8);
  __chkstk_darwin();
  v51 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_10000D3B8(&qword_10003DA08);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_10000D3B8(&qword_10003DA10);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin();
  v12 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a1[3];
  v14 = a1[4];
  v53 = a1;
  sub_10000DB28(a1, v13);
  v15 = sub_10000F5C0();
  v16 = v55;
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for CharacteristicKind.Constraints.CodingKeys, &type metadata for CharacteristicKind.Constraints.CodingKeys, v15, v13, v14);
  if (!v16)
  {
    v44 = v6;
    v45 = v5;
    v18 = v51;
    v17 = v52;
    v46 = v10;
    v55 = v12;
    v19 = KeyedDecodingContainer.allKeys.getter(v9);
    v20 = v19;
    if (*(_QWORD *)(v19 + 16) == 1)
    {
      if (*(_BYTE *)(v19 + 32))
      {
        if (*(_BYTE *)(v19 + 32) != 1)
        {
          v51 = (char *)*(unsigned __int8 *)(v19 + 32);
          LOBYTE(v54) = 2;
          v34 = sub_10000F604();
          v35 = v55;
          KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)(&type metadata for CharacteristicKind.Constraints.MinMaxStepValuesCodingKeys, &v54, v9, &type metadata for CharacteristicKind.Constraints.MinMaxStepValuesCodingKeys, v34);
          sub_10001246C();
          v41 = v49;
          KeyedDecodingContainer.decode<A>(_:forKey:)(&v54, &type metadata for CharacteristicKind.Constraints.MinMaxStepValues);
          v42 = v46;
          (*(void (**)(char *, uint64_t))(v48 + 8))(v17, v41);
          swift_bridgeObjectRelease(v20);
          (*(void (**)(char *, uint64_t))(v42 + 8))(v35, v9);
          v43 = v53;
          v6 = v54;
LABEL_12:
          sub_10001244C(v43);
          return v6;
        }
        LOBYTE(v54) = 1;
        v21 = sub_10000F68C();
        v22 = v55;
        KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)(&type metadata for CharacteristicKind.Constraints.ValidBitsCodingKeys, &v54, v9, &type metadata for CharacteristicKind.Constraints.ValidBitsCodingKeys, v21);
        v36 = sub_10000D3B8(&qword_10003D780);
        sub_1000124B0(&qword_10003DA28, (uint64_t)&protocol witness table for Int, (uint64_t)&protocol witness table for String, (uint64_t)&protocol conformance descriptor for <> [A : B]);
        v37 = v50;
        KeyedDecodingContainer.decode<A>(_:forKey:)(&v54, v36);
        v38 = v46;
        (*(void (**)(char *, uint64_t))(v47 + 8))(v18, v37);
        swift_bridgeObjectRelease(v20);
        (*(void (**)(char *, uint64_t))(v38 + 8))(v22, v9);
      }
      else
      {
        v29 = v19;
        LOBYTE(v54) = 0;
        v30 = sub_10000F714();
        v31 = v9;
        v32 = v9;
        v33 = v55;
        KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)(&type metadata for CharacteristicKind.Constraints.ValidValuesCodingKeys, &v54, v32, &type metadata for CharacteristicKind.Constraints.ValidValuesCodingKeys, v30);
        v39 = sub_10000D3B8(&qword_10003D780);
        sub_1000124B0(&qword_10003DA28, (uint64_t)&protocol witness table for Int, (uint64_t)&protocol witness table for String, (uint64_t)&protocol conformance descriptor for <> [A : B]);
        v40 = v45;
        KeyedDecodingContainer.decode<A>(_:forKey:)(&v54, v39);
        (*(void (**)(char *, uint64_t))(v44 + 8))(v8, v40);
        swift_bridgeObjectRelease(v29);
        (*(void (**)(char *, uint64_t))(v46 + 8))(v33, v31);
      }
      v43 = v53;
      v6 = v54;
      goto LABEL_12;
    }
    v6 = type metadata accessor for DecodingError(0);
    swift_allocError(v6, &protocol witness table for DecodingError, 0, 0);
    v24 = v23;
    sub_10000D3B8(&qword_10003DA18);
    *v24 = &type metadata for CharacteristicKind.Constraints;
    v25 = v55;
    v26 = KeyedDecodingContainer.codingPath.getter(v9);
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)(v26, 0xD00000000000002BLL, 0x800000010002C370, 0);
    v27 = (*(uint64_t (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v24, enum case for DecodingError.typeMismatch(_:), v6);
    swift_willThrow(v27);
    swift_bridgeObjectRelease(v20);
    (*(void (**)(char *, uint64_t))(v46 + 8))(v25, v9);
  }
  sub_10001244C(v53);
  return v6;
}

unint64_t sub_10000FE74()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003DB00;
  if (!qword_10003DB00)
  {
    v1 = objc_opt_self(HMMutableHomeManagerConfiguration);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10003DB00);
  }
  return result;
}

uint64_t sub_10000FEB0()
{
  return sub_100010324(&qword_10003D798, &qword_10003D7A0);
}

unint64_t sub_10000FED8()
{
  unint64_t result;

  result = qword_10003D7A8;
  if (!qword_10003D7A8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CharacteristicKind, &type metadata for CharacteristicKind);
    atomic_store(result, (unint64_t *)&qword_10003D7A8);
  }
  return result;
}

unint64_t sub_10000FF20()
{
  unint64_t result;

  result = qword_10003D7B0;
  if (!qword_10003D7B0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CharacteristicKind.Value, &type metadata for CharacteristicKind.Value);
    atomic_store(result, (unint64_t *)&qword_10003D7B0);
  }
  return result;
}

unint64_t sub_10000FF68()
{
  unint64_t result;

  result = qword_10003D7B8;
  if (!qword_10003D7B8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CharacteristicKind.Value, &type metadata for CharacteristicKind.Value);
    atomic_store(result, (unint64_t *)&qword_10003D7B8);
  }
  return result;
}

unint64_t sub_10000FFB0()
{
  unint64_t result;

  result = qword_10003D7C0;
  if (!qword_10003D7C0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CharacteristicKind.Permissions, &type metadata for CharacteristicKind.Permissions);
    atomic_store(result, (unint64_t *)&qword_10003D7C0);
  }
  return result;
}

unint64_t sub_10000FFF8()
{
  unint64_t result;

  result = qword_10003D7C8;
  if (!qword_10003D7C8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CharacteristicKind.Permissions, &type metadata for CharacteristicKind.Permissions);
    atomic_store(result, (unint64_t *)&qword_10003D7C8);
  }
  return result;
}

unint64_t sub_100010040()
{
  unint64_t result;

  result = qword_10003D7D0;
  if (!qword_10003D7D0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CharacteristicKind.Permissions, &type metadata for CharacteristicKind.Permissions);
    atomic_store(result, (unint64_t *)&qword_10003D7D0);
  }
  return result;
}

unint64_t sub_100010088()
{
  unint64_t result;

  result = qword_10003D7D8;
  if (!qword_10003D7D8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CharacteristicKind.Permissions, &type metadata for CharacteristicKind.Permissions);
    atomic_store(result, (unint64_t *)&qword_10003D7D8);
  }
  return result;
}

unint64_t sub_1000100D0()
{
  unint64_t result;

  result = qword_10003D7E0;
  if (!qword_10003D7E0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CharacteristicKind.Permissions, &type metadata for CharacteristicKind.Permissions);
    atomic_store(result, (unint64_t *)&qword_10003D7E0);
  }
  return result;
}

unint64_t sub_100010118()
{
  unint64_t result;

  result = qword_10003D7E8;
  if (!qword_10003D7E8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CharacteristicKind.Properties, &type metadata for CharacteristicKind.Properties);
    atomic_store(result, (unint64_t *)&qword_10003D7E8);
  }
  return result;
}

unint64_t sub_100010160()
{
  unint64_t result;

  result = qword_10003D7F0;
  if (!qword_10003D7F0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CharacteristicKind.Properties, &type metadata for CharacteristicKind.Properties);
    atomic_store(result, (unint64_t *)&qword_10003D7F0);
  }
  return result;
}

unint64_t sub_1000101A8()
{
  unint64_t result;

  result = qword_10003D7F8;
  if (!qword_10003D7F8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CharacteristicKind.Properties, &type metadata for CharacteristicKind.Properties);
    atomic_store(result, (unint64_t *)&qword_10003D7F8);
  }
  return result;
}

void *sub_1000101EC()
{
  return &protocol witness table for Int;
}

unint64_t sub_1000101FC()
{
  unint64_t result;

  result = qword_10003D800;
  if (!qword_10003D800)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CharacteristicKind.Properties, &type metadata for CharacteristicKind.Properties);
    atomic_store(result, (unint64_t *)&qword_10003D800);
  }
  return result;
}

uint64_t sub_100010240()
{
  return sub_100010324(&qword_10003D808, &qword_10003D810);
}

unint64_t sub_100010268()
{
  unint64_t result;

  result = qword_10003D818;
  if (!qword_10003D818)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CharacteristicKind.Format, &type metadata for CharacteristicKind.Format);
    atomic_store(result, (unint64_t *)&qword_10003D818);
  }
  return result;
}

void *sub_1000102AC()
{
  return &protocol witness table for String;
}

unint64_t sub_1000102BC()
{
  unint64_t result;

  result = qword_10003D820;
  if (!qword_10003D820)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CharacteristicKind.Unit, &type metadata for CharacteristicKind.Unit);
    atomic_store(result, (unint64_t *)&qword_10003D820);
  }
  return result;
}

uint64_t sub_100010300()
{
  return sub_100010324(&qword_10003D828, &qword_10003D830);
}

uint64_t sub_100010324(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_10000F6D0(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
    atomic_store(result, a1);
  }
  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for CharacteristicKind(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CharacteristicKind(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0x53)
    goto LABEL_17;
  if (a2 + 173 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 173) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 173;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 173;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 173;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xAE;
  v8 = v6 - 174;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CharacteristicKind(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 173 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 173) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0x53)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0x52)
    return ((uint64_t (*)(void))((char *)&loc_100010450 + 4 * byte_100026F5F[v4]))();
  *a1 = a2 - 83;
  return ((uint64_t (*)(void))((char *)sub_100010484 + 4 * byte_100026F5A[v4]))();
}

uint64_t sub_100010484(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001048C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100010494);
  return result;
}

uint64_t sub_1000104A0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1000104A8);
  *(_BYTE *)result = a2 - 83;
  return result;
}

uint64_t sub_1000104AC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000104B4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CharacteristicKind()
{
  return &type metadata for CharacteristicKind;
}

uint64_t initializeBufferWithCopyOfBuffer for CharacteristicKind.Info(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for CharacteristicKind.Info(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;

  result = swift_bridgeObjectRelease(*(_QWORD *)(a1 + 16));
  if (*(unsigned __int8 *)(a1 + 44) != 255)
  {
    v3 = *(unsigned int *)(a1 + 40) | ((unint64_t)*(unsigned __int8 *)(a1 + 44) << 32);
    return sub_100010550(*(_QWORD *)(a1 + 32), v3, BYTE4(v3));
  }
  return result;
}

uint64_t sub_100010550(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u)
    return swift_bridgeObjectRelease(result);
  return result;
}

uint64_t initializeWithCopy for CharacteristicKind.Info(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t *v5;
  unsigned __int8 v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  v5 = (uint64_t *)(a2 + 32);
  v6 = *(_BYTE *)(a2 + 44);
  v7 = *(unsigned int *)(a2 + 40);
  swift_bridgeObjectRetain(v4);
  if (v6 == 255)
  {
    *(_QWORD *)(a1 + 32) = *v5;
    *(_QWORD *)(a1 + 37) = *(uint64_t *)((char *)v5 + 5);
  }
  else
  {
    v8 = v7 & 0xFFFFFF00FFFFFFFFLL | ((unint64_t)v6 << 32);
    v9 = *v5;
    sub_10000D2EC(v9, v8, BYTE4(v8));
    *(_QWORD *)(a1 + 32) = v9;
    *(_DWORD *)(a1 + 40) = v8;
    *(_BYTE *)(a1 + 44) = BYTE4(v8);
  }
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  return a1;
}

uint64_t assignWithCopy for CharacteristicKind.Info(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  v6 = (uint64_t *)(a1 + 32);
  v7 = (uint64_t *)(a2 + 32);
  v8 = *(unsigned int *)(a2 + 40) | ((unint64_t)*(unsigned __int8 *)(a2 + 44) << 32);
  v9 = *(_BYTE *)(a2 + 44);
  if (*(unsigned __int8 *)(a1 + 44) == 255)
  {
    if (BYTE4(v8) == 255)
    {
      v10 = *v7;
      *(_QWORD *)(a1 + 37) = *(_QWORD *)(a2 + 37);
      *v6 = v10;
    }
    else
    {
      v12 = *v7;
      sub_10000D2EC(*v7, *(unsigned int *)(a2 + 40) | ((unint64_t)*(unsigned __int8 *)(a2 + 44) << 32), BYTE4(v8));
      *(_QWORD *)(a1 + 32) = v12;
      *(_DWORD *)(a1 + 40) = v8;
      *(_BYTE *)(a1 + 44) = v9;
    }
  }
  else if (BYTE4(v8) == 255)
  {
    sub_100010748(a1 + 32);
    v11 = *(_QWORD *)(a2 + 37);
    *v6 = *v7;
    *(_QWORD *)(a1 + 37) = v11;
  }
  else
  {
    v13 = *v7;
    sub_10000D2EC(*v7, *(unsigned int *)(a2 + 40) | ((unint64_t)*(unsigned __int8 *)(a2 + 44) << 32), BYTE4(v8));
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(unsigned int *)(a1 + 40);
    *(_QWORD *)(a1 + 32) = v13;
    *(_DWORD *)(a1 + 40) = v8;
    v16 = *(_BYTE *)(a1 + 44);
    *(_BYTE *)(a1 + 44) = v9;
    sub_100010550(v14, v15, v16);
  }
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  return a1;
}

uint64_t sub_100010748(uint64_t a1)
{
  sub_100010550(*(_QWORD *)a1, *(unsigned int *)(a1 + 8), *(_BYTE *)(a1 + 12));
  return a1;
}

__n128 initializeWithTake for CharacteristicKind.Info(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for CharacteristicKind.Info(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unsigned __int8 v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease(v5);
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  v6 = (_QWORD *)(a2 + 32);
  v7 = *(_BYTE *)(a1 + 44);
  if (v7 != 255)
  {
    v8 = *(unsigned int *)(a2 + 40) | ((unint64_t)*(unsigned __int8 *)(a2 + 44) << 32);
    if (HIDWORD(v8) <= 0xFE)
    {
      v9 = *(unsigned int *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 32);
      *(_QWORD *)(a1 + 32) = *v6;
      *(_DWORD *)(a1 + 40) = v8;
      *(_BYTE *)(a1 + 44) = BYTE4(v8);
      sub_100010550(v10, v9, v7);
      goto LABEL_6;
    }
    sub_100010748(a1 + 32);
  }
  *(_QWORD *)(a1 + 32) = *v6;
  *(_QWORD *)(a1 + 37) = *(_QWORD *)(a2 + 37);
LABEL_6:
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for CharacteristicKind.Info(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CharacteristicKind.Info(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Info()
{
  return &type metadata for CharacteristicKind.Info;
}

uint64_t destroy for CharacteristicKind.Value(uint64_t a1)
{
  return sub_10000DAFC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO5ValueOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_10000D300(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for CharacteristicKind.Value(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_10000D300(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_10000DAFC(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for CharacteristicKind.Value(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for CharacteristicKind.Value(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_10000DAFC(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for CharacteristicKind.Value(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xF5 && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 245);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 0xB)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CharacteristicKind.Value(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF4)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 245;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xF5)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xF5)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_100010A84(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 0xAu)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 11);
}

uint64_t sub_100010A9C(uint64_t result, unsigned int a2)
{
  if (a2 >= 0xB)
  {
    *(_QWORD *)result = a2 - 11;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 11;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Value()
{
  return &type metadata for CharacteristicKind.Value;
}

uint64_t destroy for CharacteristicKind.Constraints(uint64_t a1)
{
  return sub_100010550(*(_QWORD *)a1, *(unsigned int *)(a1 + 8), *(_BYTE *)(a1 + 12));
}

uint64_t _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO11ConstraintsOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_DWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 12);
  sub_10000D2EC(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_DWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 12) = v5;
  return a1;
}

uint64_t assignWithCopy for CharacteristicKind.Constraints(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_DWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 12);
  sub_10000D2EC(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(unsigned int *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_DWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 12);
  *(_BYTE *)(a1 + 12) = v5;
  sub_100010550(v6, v7, v8);
  return a1;
}

_QWORD *initializeWithTake for CharacteristicKind.Constraints(_QWORD *result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_QWORD *)((char *)result + 5) = *(uint64_t *)((char *)a2 + 5);
  *result = v2;
  return result;
}

uint64_t assignWithTake for CharacteristicKind.Constraints(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  int v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *a2;
  v4 = *((_DWORD *)a2 + 2);
  v5 = *((_BYTE *)a2 + 12);
  v6 = *(_QWORD *)a1;
  v7 = *(unsigned int *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_DWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 12);
  *(_BYTE *)(a1 + 12) = v5;
  sub_100010550(v6, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for CharacteristicKind.Constraints(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 13))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 12);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CharacteristicKind.Constraints(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 12) = 0;
    *(_DWORD *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 13) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 13) = 0;
    if (a2)
      *(_BYTE *)(result + 12) = -(char)a2;
  }
  return result;
}

uint64_t sub_100010C78(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 12);
}

uint64_t sub_100010C80(uint64_t result, char a2)
{
  *(_BYTE *)(result + 12) = a2;
  return result;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Constraints()
{
  return &type metadata for CharacteristicKind.Constraints;
}

uint64_t initializeBufferWithCopyOfBuffer for CharacteristicKind.Constraints.MinMaxStepValues(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_DWORD *)(result + 8) = *((_DWORD *)a2 + 2);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for CharacteristicKind.Constraints.MinMaxStepValues(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 12))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for CharacteristicKind.Constraints.MinMaxStepValues(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_DWORD *)(result + 8) = 0;
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 12) = v3;
  return result;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Constraints.MinMaxStepValues()
{
  return &type metadata for CharacteristicKind.Constraints.MinMaxStepValues;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Permissions()
{
  return &type metadata for CharacteristicKind.Permissions;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Properties()
{
  return &type metadata for CharacteristicKind.Properties;
}

uint64_t getEnumTagSinglePayload for CharacteristicKind.Format(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF6)
    goto LABEL_17;
  if (a2 + 10 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 10) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 10;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 10;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 10;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xB;
  v8 = v6 - 11;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CharacteristicKind.Format(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 10 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 10) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF6)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF5)
    return ((uint64_t (*)(void))((char *)&loc_100010E04 + 4 * byte_100026F69[v4]))();
  *a1 = a2 + 10;
  return ((uint64_t (*)(void))((char *)sub_100010E38 + 4 * byte_100026F64[v4]))();
}

uint64_t sub_100010E38(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100010E40(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100010E48);
  return result;
}

uint64_t sub_100010E54(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100010E5CLL);
  *(_BYTE *)result = a2 + 10;
  return result;
}

uint64_t sub_100010E60(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100010E68(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Format()
{
  return &type metadata for CharacteristicKind.Format;
}

uint64_t getEnumTagSinglePayload for CharacteristicKind.Unit(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CharacteristicKind.Unit(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100010F60 + 4 * byte_100026F73[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_100010F94 + 4 * byte_100026F6E[v4]))();
}

uint64_t sub_100010F94(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100010F9C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100010FA4);
  return result;
}

uint64_t sub_100010FB0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100010FB8);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_100010FBC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100010FC4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Unit()
{
  return &type metadata for CharacteristicKind.Unit;
}

uint64_t sub_100010FE8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100010FF0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Constraints.CodingKeys()
{
  return &type metadata for CharacteristicKind.Constraints.CodingKeys;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Constraints.ValidValuesCodingKeys()
{
  return &type metadata for CharacteristicKind.Constraints.ValidValuesCodingKeys;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Constraints.ValidBitsCodingKeys()
{
  return &type metadata for CharacteristicKind.Constraints.ValidBitsCodingKeys;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Constraints.MinMaxStepValuesCodingKeys()
{
  return &type metadata for CharacteristicKind.Constraints.MinMaxStepValuesCodingKeys;
}

uint64_t _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO11ConstraintsO10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO11ConstraintsO10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100011120 + 4 * byte_100026F7D[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_100011154 + 4 * byte_100026F78[v4]))();
}

uint64_t sub_100011154(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001115C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100011164);
  return result;
}

uint64_t sub_100011170(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100011178);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_10001117C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100011184(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Constraints.MinMaxStepValues.CodingKeys()
{
  return &type metadata for CharacteristicKind.Constraints.MinMaxStepValues.CodingKeys;
}

uint64_t getEnumTagSinglePayload for CharacteristicKind.Value.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF5)
    goto LABEL_17;
  if (a2 + 11 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 11) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 11;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 11;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 11;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xC;
  v8 = v6 - 12;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CharacteristicKind.Value.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 11 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 11) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF5)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF4)
    return ((uint64_t (*)(void))((char *)&loc_10001127C + 4 * byte_100026F87[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_1000112B0 + 4 * byte_100026F82[v4]))();
}

uint64_t sub_1000112B0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000112B8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1000112C0);
  return result;
}

uint64_t sub_1000112CC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1000112D4);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_1000112D8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000112E0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Value.CodingKeys()
{
  return &type metadata for CharacteristicKind.Value.CodingKeys;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Value.NullCodingKeys()
{
  return &type metadata for CharacteristicKind.Value.NullCodingKeys;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Value.BoolCodingKeys()
{
  return &type metadata for CharacteristicKind.Value.BoolCodingKeys;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Value.Uint8CodingKeys()
{
  return &type metadata for CharacteristicKind.Value.Uint8CodingKeys;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Value.Uint16CodingKeys()
{
  return &type metadata for CharacteristicKind.Value.Uint16CodingKeys;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Value.Uint32CodingKeys()
{
  return &type metadata for CharacteristicKind.Value.Uint32CodingKeys;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Value.Uint64CodingKeys()
{
  return &type metadata for CharacteristicKind.Value.Uint64CodingKeys;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Value.IntCodingKeys()
{
  return &type metadata for CharacteristicKind.Value.IntCodingKeys;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Value.Int32CodingKeys()
{
  return &type metadata for CharacteristicKind.Value.Int32CodingKeys;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Value.FloatCodingKeys()
{
  return &type metadata for CharacteristicKind.Value.FloatCodingKeys;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Value.StringCodingKeys()
{
  return &type metadata for CharacteristicKind.Value.StringCodingKeys;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Value.Tlv8CodingKeys()
{
  return &type metadata for CharacteristicKind.Value.Tlv8CodingKeys;
}

uint64_t _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO11ConstraintsO21ValidValuesCodingKeysOwet_0(unsigned int *a1, int a2)
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

uint64_t _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO11ConstraintsO21ValidValuesCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_10001143C + 4 * byte_100026F8C[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_10001145C + 4 * byte_100026F91[v4]))();
}

_BYTE *sub_10001143C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_10001145C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100011464(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10001146C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100011474(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10001147C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for CharacteristicKind.Value.DataCodingKeys()
{
  return &type metadata for CharacteristicKind.Value.DataCodingKeys;
}

unint64_t sub_10001149C()
{
  unint64_t result;

  result = qword_10003D838;
  if (!qword_10003D838)
  {
    result = swift_getWitnessTable(&unk_100027CE0, &type metadata for CharacteristicKind.Value.DataCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D838);
  }
  return result;
}

unint64_t sub_1000114E4()
{
  unint64_t result;

  result = qword_10003D840;
  if (!qword_10003D840)
  {
    result = swift_getWitnessTable(&unk_100027D98, &type metadata for CharacteristicKind.Value.Tlv8CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D840);
  }
  return result;
}

unint64_t sub_10001152C()
{
  unint64_t result;

  result = qword_10003D848;
  if (!qword_10003D848)
  {
    result = swift_getWitnessTable(&unk_100027E50, &type metadata for CharacteristicKind.Value.StringCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D848);
  }
  return result;
}

unint64_t sub_100011574()
{
  unint64_t result;

  result = qword_10003D850;
  if (!qword_10003D850)
  {
    result = swift_getWitnessTable(&unk_100027F08, &type metadata for CharacteristicKind.Value.FloatCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D850);
  }
  return result;
}

unint64_t sub_1000115BC()
{
  unint64_t result;

  result = qword_10003D858;
  if (!qword_10003D858)
  {
    result = swift_getWitnessTable(&unk_100027FC0, &type metadata for CharacteristicKind.Value.Int32CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D858);
  }
  return result;
}

unint64_t sub_100011604()
{
  unint64_t result;

  result = qword_10003D860;
  if (!qword_10003D860)
  {
    result = swift_getWitnessTable(&unk_100028078, &type metadata for CharacteristicKind.Value.IntCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D860);
  }
  return result;
}

unint64_t sub_10001164C()
{
  unint64_t result;

  result = qword_10003D868;
  if (!qword_10003D868)
  {
    result = swift_getWitnessTable(&unk_100028130, &type metadata for CharacteristicKind.Value.Uint64CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D868);
  }
  return result;
}

unint64_t sub_100011694()
{
  unint64_t result;

  result = qword_10003D870;
  if (!qword_10003D870)
  {
    result = swift_getWitnessTable(&unk_1000281E8, &type metadata for CharacteristicKind.Value.Uint32CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D870);
  }
  return result;
}

unint64_t sub_1000116DC()
{
  unint64_t result;

  result = qword_10003D878;
  if (!qword_10003D878)
  {
    result = swift_getWitnessTable(&unk_1000282A0, &type metadata for CharacteristicKind.Value.Uint16CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D878);
  }
  return result;
}

unint64_t sub_100011724()
{
  unint64_t result;

  result = qword_10003D880;
  if (!qword_10003D880)
  {
    result = swift_getWitnessTable(&unk_100028358, &type metadata for CharacteristicKind.Value.Uint8CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D880);
  }
  return result;
}

unint64_t sub_10001176C()
{
  unint64_t result;

  result = qword_10003D888;
  if (!qword_10003D888)
  {
    result = swift_getWitnessTable(&unk_100028410, &type metadata for CharacteristicKind.Value.BoolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D888);
  }
  return result;
}

unint64_t sub_1000117B4()
{
  unint64_t result;

  result = qword_10003D890;
  if (!qword_10003D890)
  {
    result = swift_getWitnessTable(&unk_100028518, &type metadata for CharacteristicKind.Value.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D890);
  }
  return result;
}

unint64_t sub_1000117FC()
{
  unint64_t result;

  result = qword_10003D898;
  if (!qword_10003D898)
  {
    result = swift_getWitnessTable(&unk_1000285D0, &type metadata for CharacteristicKind.Constraints.MinMaxStepValues.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D898);
  }
  return result;
}

unint64_t sub_100011844()
{
  unint64_t result;

  result = qword_10003D8A0;
  if (!qword_10003D8A0)
  {
    result = swift_getWitnessTable(&unk_100028688, &type metadata for CharacteristicKind.Constraints.MinMaxStepValuesCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D8A0);
  }
  return result;
}

unint64_t sub_10001188C()
{
  unint64_t result;

  result = qword_10003D8A8;
  if (!qword_10003D8A8)
  {
    result = swift_getWitnessTable(&unk_100028740, &type metadata for CharacteristicKind.Constraints.ValidBitsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D8A8);
  }
  return result;
}

unint64_t sub_1000118D4()
{
  unint64_t result;

  result = qword_10003D8B0;
  if (!qword_10003D8B0)
  {
    result = swift_getWitnessTable(&unk_1000287F8, &type metadata for CharacteristicKind.Constraints.ValidValuesCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D8B0);
  }
  return result;
}

unint64_t sub_10001191C()
{
  unint64_t result;

  result = qword_10003D8B8;
  if (!qword_10003D8B8)
  {
    result = swift_getWitnessTable(&unk_1000288B0, &type metadata for CharacteristicKind.Constraints.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D8B8);
  }
  return result;
}

unint64_t sub_100011964()
{
  unint64_t result;

  result = qword_10003D8C0;
  if (!qword_10003D8C0)
  {
    result = swift_getWitnessTable(&unk_100028768, &type metadata for CharacteristicKind.Constraints.ValidValuesCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D8C0);
  }
  return result;
}

unint64_t sub_1000119AC()
{
  unint64_t result;

  result = qword_10003D8C8;
  if (!qword_10003D8C8)
  {
    result = swift_getWitnessTable(&unk_100028790, &type metadata for CharacteristicKind.Constraints.ValidValuesCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D8C8);
  }
  return result;
}

unint64_t sub_1000119F4()
{
  unint64_t result;

  result = qword_10003D8D0;
  if (!qword_10003D8D0)
  {
    result = swift_getWitnessTable(&unk_1000286B0, &type metadata for CharacteristicKind.Constraints.ValidBitsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D8D0);
  }
  return result;
}

unint64_t sub_100011A3C()
{
  unint64_t result;

  result = qword_10003D8D8;
  if (!qword_10003D8D8)
  {
    result = swift_getWitnessTable(&unk_1000286D8, &type metadata for CharacteristicKind.Constraints.ValidBitsCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D8D8);
  }
  return result;
}

unint64_t sub_100011A84()
{
  unint64_t result;

  result = qword_10003D8E0;
  if (!qword_10003D8E0)
  {
    result = swift_getWitnessTable(&unk_1000285F8, &type metadata for CharacteristicKind.Constraints.MinMaxStepValuesCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D8E0);
  }
  return result;
}

unint64_t sub_100011ACC()
{
  unint64_t result;

  result = qword_10003D8E8;
  if (!qword_10003D8E8)
  {
    result = swift_getWitnessTable(&unk_100028620, &type metadata for CharacteristicKind.Constraints.MinMaxStepValuesCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D8E8);
  }
  return result;
}

unint64_t sub_100011B14()
{
  unint64_t result;

  result = qword_10003D8F0;
  if (!qword_10003D8F0)
  {
    result = swift_getWitnessTable(&unk_100028820, &type metadata for CharacteristicKind.Constraints.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D8F0);
  }
  return result;
}

unint64_t sub_100011B5C()
{
  unint64_t result;

  result = qword_10003D8F8;
  if (!qword_10003D8F8)
  {
    result = swift_getWitnessTable(&unk_100028848, &type metadata for CharacteristicKind.Constraints.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D8F8);
  }
  return result;
}

unint64_t sub_100011BA4()
{
  unint64_t result;

  result = qword_10003D900;
  if (!qword_10003D900)
  {
    result = swift_getWitnessTable(&unk_100028540, &type metadata for CharacteristicKind.Constraints.MinMaxStepValues.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D900);
  }
  return result;
}

unint64_t sub_100011BEC()
{
  unint64_t result;

  result = qword_10003D908;
  if (!qword_10003D908)
  {
    result = swift_getWitnessTable(&unk_100028568, &type metadata for CharacteristicKind.Constraints.MinMaxStepValues.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D908);
  }
  return result;
}

unint64_t sub_100011C34()
{
  unint64_t result;

  result = qword_10003D910;
  if (!qword_10003D910)
  {
    result = swift_getWitnessTable(&unk_100028438, &type metadata for CharacteristicKind.Value.NullCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D910);
  }
  return result;
}

unint64_t sub_100011C7C()
{
  unint64_t result;

  result = qword_10003D918;
  if (!qword_10003D918)
  {
    result = swift_getWitnessTable(&unk_100028460, &type metadata for CharacteristicKind.Value.NullCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D918);
  }
  return result;
}

unint64_t sub_100011CC4()
{
  unint64_t result;

  result = qword_10003D920;
  if (!qword_10003D920)
  {
    result = swift_getWitnessTable(&unk_100028380, &type metadata for CharacteristicKind.Value.BoolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D920);
  }
  return result;
}

unint64_t sub_100011D0C()
{
  unint64_t result;

  result = qword_10003D928;
  if (!qword_10003D928)
  {
    result = swift_getWitnessTable(&unk_1000283A8, &type metadata for CharacteristicKind.Value.BoolCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D928);
  }
  return result;
}

unint64_t sub_100011D54()
{
  unint64_t result;

  result = qword_10003D930;
  if (!qword_10003D930)
  {
    result = swift_getWitnessTable(&unk_1000282C8, &type metadata for CharacteristicKind.Value.Uint8CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D930);
  }
  return result;
}

unint64_t sub_100011D9C()
{
  unint64_t result;

  result = qword_10003D938;
  if (!qword_10003D938)
  {
    result = swift_getWitnessTable(&unk_1000282F0, &type metadata for CharacteristicKind.Value.Uint8CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D938);
  }
  return result;
}

unint64_t sub_100011DE4()
{
  unint64_t result;

  result = qword_10003D940;
  if (!qword_10003D940)
  {
    result = swift_getWitnessTable(&unk_100028210, &type metadata for CharacteristicKind.Value.Uint16CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D940);
  }
  return result;
}

unint64_t sub_100011E2C()
{
  unint64_t result;

  result = qword_10003D948;
  if (!qword_10003D948)
  {
    result = swift_getWitnessTable(&unk_100028238, &type metadata for CharacteristicKind.Value.Uint16CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D948);
  }
  return result;
}

unint64_t sub_100011E74()
{
  unint64_t result;

  result = qword_10003D950;
  if (!qword_10003D950)
  {
    result = swift_getWitnessTable(&unk_100028158, &type metadata for CharacteristicKind.Value.Uint32CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D950);
  }
  return result;
}

unint64_t sub_100011EBC()
{
  unint64_t result;

  result = qword_10003D958;
  if (!qword_10003D958)
  {
    result = swift_getWitnessTable(&unk_100028180, &type metadata for CharacteristicKind.Value.Uint32CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D958);
  }
  return result;
}

unint64_t sub_100011F04()
{
  unint64_t result;

  result = qword_10003D960;
  if (!qword_10003D960)
  {
    result = swift_getWitnessTable(&unk_1000280A0, &type metadata for CharacteristicKind.Value.Uint64CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D960);
  }
  return result;
}

unint64_t sub_100011F4C()
{
  unint64_t result;

  result = qword_10003D968;
  if (!qword_10003D968)
  {
    result = swift_getWitnessTable(&unk_1000280C8, &type metadata for CharacteristicKind.Value.Uint64CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D968);
  }
  return result;
}

unint64_t sub_100011F94()
{
  unint64_t result;

  result = qword_10003D970;
  if (!qword_10003D970)
  {
    result = swift_getWitnessTable(&unk_100027FE8, &type metadata for CharacteristicKind.Value.IntCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D970);
  }
  return result;
}

unint64_t sub_100011FDC()
{
  unint64_t result;

  result = qword_10003D978;
  if (!qword_10003D978)
  {
    result = swift_getWitnessTable(&unk_100028010, &type metadata for CharacteristicKind.Value.IntCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D978);
  }
  return result;
}

unint64_t sub_100012024()
{
  unint64_t result;

  result = qword_10003D980;
  if (!qword_10003D980)
  {
    result = swift_getWitnessTable(&unk_100027F30, &type metadata for CharacteristicKind.Value.Int32CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D980);
  }
  return result;
}

unint64_t sub_10001206C()
{
  unint64_t result;

  result = qword_10003D988;
  if (!qword_10003D988)
  {
    result = swift_getWitnessTable(&unk_100027F58, &type metadata for CharacteristicKind.Value.Int32CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D988);
  }
  return result;
}

unint64_t sub_1000120B4()
{
  unint64_t result;

  result = qword_10003D990;
  if (!qword_10003D990)
  {
    result = swift_getWitnessTable(&unk_100027E78, &type metadata for CharacteristicKind.Value.FloatCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D990);
  }
  return result;
}

unint64_t sub_1000120FC()
{
  unint64_t result;

  result = qword_10003D998;
  if (!qword_10003D998)
  {
    result = swift_getWitnessTable(&unk_100027EA0, &type metadata for CharacteristicKind.Value.FloatCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D998);
  }
  return result;
}

unint64_t sub_100012144()
{
  unint64_t result;

  result = qword_10003D9A0;
  if (!qword_10003D9A0)
  {
    result = swift_getWitnessTable(&unk_100027DC0, &type metadata for CharacteristicKind.Value.StringCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D9A0);
  }
  return result;
}

unint64_t sub_10001218C()
{
  unint64_t result;

  result = qword_10003D9A8;
  if (!qword_10003D9A8)
  {
    result = swift_getWitnessTable(&unk_100027DE8, &type metadata for CharacteristicKind.Value.StringCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D9A8);
  }
  return result;
}

unint64_t sub_1000121D4()
{
  unint64_t result;

  result = qword_10003D9B0;
  if (!qword_10003D9B0)
  {
    result = swift_getWitnessTable(&unk_100027D08, &type metadata for CharacteristicKind.Value.Tlv8CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D9B0);
  }
  return result;
}

unint64_t sub_10001221C()
{
  unint64_t result;

  result = qword_10003D9B8;
  if (!qword_10003D9B8)
  {
    result = swift_getWitnessTable(&unk_100027D30, &type metadata for CharacteristicKind.Value.Tlv8CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D9B8);
  }
  return result;
}

unint64_t sub_100012264()
{
  unint64_t result;

  result = qword_10003D9C0;
  if (!qword_10003D9C0)
  {
    result = swift_getWitnessTable(&unk_100027C50, &type metadata for CharacteristicKind.Value.DataCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D9C0);
  }
  return result;
}

unint64_t sub_1000122AC()
{
  unint64_t result;

  result = qword_10003D9C8;
  if (!qword_10003D9C8)
  {
    result = swift_getWitnessTable(&unk_100027C78, &type metadata for CharacteristicKind.Value.DataCodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D9C8);
  }
  return result;
}

unint64_t sub_1000122F4()
{
  unint64_t result;

  result = qword_10003D9D0;
  if (!qword_10003D9D0)
  {
    result = swift_getWitnessTable(&unk_100028488, &type metadata for CharacteristicKind.Value.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D9D0);
  }
  return result;
}

unint64_t sub_10001233C()
{
  unint64_t result;

  result = qword_10003D9D8;
  if (!qword_10003D9D8)
  {
    result = swift_getWitnessTable(&unk_1000284B0, &type metadata for CharacteristicKind.Value.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10003D9D8);
  }
  return result;
}

unint64_t sub_100012380()
{
  unint64_t result;

  result = qword_10003D9E0;
  if (!qword_10003D9E0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CharacteristicKind.Unit, &type metadata for CharacteristicKind.Unit);
    atomic_store(result, (unint64_t *)&qword_10003D9E0);
  }
  return result;
}

unint64_t sub_1000123C4()
{
  unint64_t result;

  result = qword_10003D9E8;
  if (!qword_10003D9E8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CharacteristicKind.Format, &type metadata for CharacteristicKind.Format);
    atomic_store(result, (unint64_t *)&qword_10003D9E8);
  }
  return result;
}

unint64_t sub_100012408()
{
  unint64_t result;

  result = qword_10003D9F0;
  if (!qword_10003D9F0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CharacteristicKind, &type metadata for CharacteristicKind);
    atomic_store(result, (unint64_t *)&qword_10003D9F0);
  }
  return result;
}

uint64_t sub_10001244C(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

unint64_t sub_10001246C()
{
  unint64_t result;

  result = qword_10003DA20;
  if (!qword_10003DA20)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CharacteristicKind.Constraints.MinMaxStepValues, &type metadata for CharacteristicKind.Constraints.MinMaxStepValues);
    atomic_store(result, (unint64_t *)&qword_10003DA20);
  }
  return result;
}

uint64_t sub_1000124B0(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = sub_10000F6D0(&qword_10003D780);
    result = swift_getWitnessTable(a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100012514()
{
  unint64_t result;

  result = qword_10003DAA0;
  if (!qword_10003DAA0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store(result, (unint64_t *)&qword_10003DAA0);
  }
  return result;
}

uint64_t sub_10001255C(uint64_t result, uint64_t a2)
{
  if (BYTE4(a2) != 255)
    return sub_100010550(result, a2, BYTE4(a2));
  return result;
}

uint64_t sub_100012570(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *DataModel.defaultMetadataPlist.unsafeMutableAddressor()
{
  if (qword_10003D5E8 != -1)
    swift_once(&qword_10003D5E8, sub_100013968);
  return &static DataModel.defaultMetadataPlist;
}

uint64_t DataModel.widgetLogger.unsafeMutableAddressor()
{
  return sub_100013C4C(&qword_10003D5F0, (uint64_t)static DataModel.widgetLogger, (uint64_t)sub_100013BA4);
}

id DataModel.homeManager.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent9DataModel_homeManager);
}

void *DataModel.currentHome.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;
  _BYTE v5[24];

  v1 = (void **)(v0 + OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent9DataModel_currentHome);
  swift_beginAccess(v0 + OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent9DataModel_currentHome, v5, 0, 0);
  v2 = *v1;
  v3 = v2;
  return v2;
}

void DataModel.currentHome.setter(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  _BYTE v5[24];

  v3 = (void **)(v1 + OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent9DataModel_currentHome);
  swift_beginAccess(v3, v5, 1, 0);
  v4 = *v3;
  *v3 = a1;

}

void *DataModel.currentHome.modify(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent9DataModel_currentHome, a1, 33, 0);
  return &j__swift_endAccess;
}

id DataModel.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

id DataModel.init()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  void *ObjCClassFromMetadata;
  char *v4;
  id v5;
  id v6;
  objc_super v8;

  v1 = OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent9DataModel_homeManager;
  v2 = sub_100017138(0, (unint64_t *)&qword_10003DB00, HMMutableHomeManagerConfiguration_ptr);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata(v2);
  v4 = v0;
  v5 = objc_msgSend(ObjCClassFromMetadata, "defaultPrivateConfiguration");
  objc_msgSend(v5, "setDiscretionary:", 0);
  objc_msgSend(v5, "setAdaptive:", 1);
  v6 = objc_msgSend(objc_allocWithZone((Class)HMHomeManager), "initWithConfiguration:", v5);

  *(_QWORD *)&v0[v1] = v6;
  *(_QWORD *)&v4[OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent9DataModel_currentHome] = 0;
  *(_DWORD *)&v4[OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent9DataModel_defaultsHomeSensingChangedNotifyToken] = 0;
  *(_DWORD *)&v4[OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent9DataModel_defaultsSelectedHomeChangedNotifyToken] = 0;

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for DataModel();
  return objc_msgSendSuper2(&v8, "init");
}

id DataModel.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DataModel();
  return objc_msgSendSuper2(&v2, "dealloc");
}

char *sub_1000128F0()
{
  char *result;

  result = sub_10001290C();
  qword_10003DFA0 = (uint64_t)result;
  return result;
}

char *sub_10001290C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  char *v4;
  uint64_t v5;
  double v6;
  void (*v7)(char *, uint64_t);
  __int128 v8;
  void **p_weak_ivar_lyt;
  void **v10;
  NSObject *v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  char *v16;
  int *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  char *v22;
  int *v23;
  id v24;
  uint64_t v25;
  id *v26;
  id v27;
  uint64_t v28;
  char *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  _UNKNOWN **v38;
  __objc2_prot_list *v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t);
  uint64_t v51;
  void **v52;
  _QWORD *v53;
  id v54;
  id v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t v60;
  char *v61;
  __int128 v62;
  uint64_t v63;
  uint64_t v64;
  void **aBlock;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void *v68;
  void (*v69)(uint64_t);
  uint64_t v70;

  v0 = type metadata accessor for Date(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v60 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DataModel()), "init");
  v60 = OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent9DataModel_homeManager;
  v61 = v4;
  v5 = Date.init()(objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent9DataModel_homeManager], "setDelegate:"));
  v6 = Date.timeIntervalSinceReferenceDate.getter(v5);
  v7 = *(void (**)(char *, uint64_t))(v1 + 8);
  v7(v3, v0);
  p_weak_ivar_lyt = &SecurityAccessoryConfigurationIntent__classData.weak_ivar_lyt;
  v10 = &SecurityAccessoryConfigurationIntent__classData.weak_ivar_lyt;
  if ((byte_10003DF98 & 1) == 0)
  {
    v38 = &_s10Foundation13__DataStorageC6_bytesSvSgvg_ptr;
    v39 = &DataModel;
    *(_QWORD *)&v8 = 138412546;
    v62 = v8;
    do
    {
      v43 = objc_autoreleasePoolPush();
      v44 = (void *)objc_opt_self(v38[227]);
      objc_msgSend(v44, (SEL)v39[349].count, 0.2);
      if (((_BYTE)p_weak_ivar_lyt[499] & 1) == 0)
      {
        if (v10[190] != (void *)-1)
          swift_once(&qword_10003D5F0, sub_100013BA4);
        v45 = type metadata accessor for Logger(0);
        v46 = sub_100012570(v45, (uint64_t)static DataModel.widgetLogger);
        v47 = Logger.logObject.getter(v46);
        v48 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v47, v48))
        {
          v49 = swift_slowAlloc(22, -1);
          v50 = v7;
          v51 = v0;
          v52 = v10;
          v53 = (_QWORD *)swift_slowAlloc(16, -1);
          *(_DWORD *)v49 = v62;
          v54 = objc_msgSend(v44, "mainThread");
          *(_QWORD *)(v49 + 4) = v54;
          *v53 = v54;
          *(_WORD *)(v49 + 12) = 2112;
          v55 = objc_msgSend(v44, "currentThread");
          *(_QWORD *)(v49 + 14) = v55;
          v53[1] = v55;
          _os_log_impl((void *)&_mh_execute_header, v47, v48, "DataModel.shared is STILL spinning waiting for HomeKit — main thread is %@ current thread is %@", (uint8_t *)v49, 0x16u);
          v56 = sub_10000D3B8(&qword_10003DBB0);
          swift_arrayDestroy(v53, 2, v56);
          v57 = v53;
          v10 = v52;
          v0 = v51;
          v7 = v50;
          p_weak_ivar_lyt = (void **)(&SecurityAccessoryConfigurationIntent__classData + 56);
          swift_slowDealloc(v57, -1, -1);
          v58 = v49;
          v38 = &_s10Foundation13__DataStorageC6_bytesSvSgvg_ptr;
          swift_slowDealloc(v58, -1, -1);
        }

        v41 = Date.init()(v40);
        v42 = Date.timeIntervalSinceReferenceDate.getter(v41);
        v7(v3, v0);
        v39 = &DataModel;
        if (v42 - v6 > 60.0)
          exit(-1);
      }
      objc_autoreleasePoolPop(v43);
    }
    while (((_BYTE)p_weak_ivar_lyt[499] & 1) == 0);
  }
  sub_100017138(0, &qword_10003DBB8, OS_dispatch_queue_ptr);
  v11 = static OS_dispatch_queue.main.getter();
  v12 = swift_allocObject(&unk_100038820, 24, 7);
  v13 = v61;
  *(_QWORD *)(v12 + 16) = v61;
  v69 = sub_1000170A0;
  v70 = v12;
  aBlock = _NSConcreteStackBlock;
  v66 = 1107296256;
  v67 = sub_100012F50;
  v68 = &unk_100038838;
  v14 = _Block_copy(&aBlock);
  v15 = v70;
  v16 = v13;
  swift_release(v15);
  v17 = (int *)&v16[OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent9DataModel_defaultsHomeSensingChangedNotifyToken];
  swift_beginAccess(&v16[OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent9DataModel_defaultsHomeSensingChangedNotifyToken], &aBlock, 33, 0);
  notify_register_dispatch("com.apple.Home.homeSensingChanged", v17, v11, v14);
  swift_endAccess(&aBlock);
  _Block_release(v14);

  v18 = static OS_dispatch_queue.main.getter();
  v19 = swift_allocObject(&unk_100038870, 24, 7);
  *(_QWORD *)(v19 + 16) = v16;
  v69 = sub_1000170D8;
  v70 = v19;
  aBlock = _NSConcreteStackBlock;
  v66 = 1107296256;
  v67 = sub_100012F50;
  v68 = &unk_100038888;
  v20 = _Block_copy(&aBlock);
  v21 = v70;
  v22 = v16;
  swift_release(v21);
  v23 = (int *)&v22[OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent9DataModel_defaultsSelectedHomeChangedNotifyToken];
  swift_beginAccess(&v22[OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent9DataModel_defaultsSelectedHomeChangedNotifyToken], &aBlock, 33, 0);
  notify_register_dispatch("com.apple.Home.selectedHomeChanged", v23, v18, v20);
  swift_endAccess(&aBlock);
  _Block_release(v20);

  v24 = *(id *)&v13[v60];
  v25 = sub_1000221BC(v24);

  v26 = (id *)&v22[OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent9DataModel_currentHome];
  swift_beginAccess(&v22[OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent9DataModel_currentHome], &aBlock, 1, 0);
  v27 = *v26;
  *v26 = (id)v25;

  if (v10[190] != (void *)-1)
    swift_once(&qword_10003D5F0, sub_100013BA4);
  v28 = type metadata accessor for Logger(0);
  sub_100012570(v28, (uint64_t)static DataModel.widgetLogger);
  v29 = v22;
  v30 = Logger.logObject.getter(v29);
  v31 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v30, v31))
  {
    v32 = (uint8_t *)swift_slowAlloc(12, -1);
    v33 = swift_slowAlloc(32, -1);
    v64 = v33;
    *(_DWORD *)v32 = 136315138;
    if (*v26)
    {
      v34 = objc_msgSend(*v26, "name");
      v35 = static String._unconditionallyBridgeFromObjectiveC(_:)(v34);
      v37 = v36;

    }
    else
    {
      v37 = 0xE400000000000000;
      v35 = 1701736302;
    }
    v63 = sub_100013F1C(v35, v37, &v64);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v63, &v64, v32 + 4, v32 + 12);

    swift_bridgeObjectRelease(v37);
    _os_log_impl((void *)&_mh_execute_header, v30, v31, "User's home is now %s", v32, 0xCu);
    swift_arrayDestroy(v33, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v33, -1, -1);
    swift_slowDealloc(v32, -1, -1);

  }
  else
  {

  }
  return v29;
}

uint64_t sub_100012F50(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v4(a2);
  return swift_release(v3);
}

void sub_100012F8C(uint64_t a1, char *a2, const char *a3)
{
  uint64_t v5;
  id *v6;
  id v7;
  uint64_t v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20[24];

  v5 = sub_1000221BC(*(void **)&a2[OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent9DataModel_homeManager]);
  v6 = (id *)&a2[OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent9DataModel_currentHome];
  swift_beginAccess(&a2[OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent9DataModel_currentHome], v20, 1, 0);
  v7 = *v6;
  *v6 = (id)v5;

  if (qword_10003D5F0 != -1)
    swift_once(&qword_10003D5F0, sub_100013BA4);
  v8 = type metadata accessor for Logger(0);
  sub_100012570(v8, (uint64_t)static DataModel.widgetLogger);
  v9 = a2;
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc(12, -1);
    v13 = swift_slowAlloc(32, -1);
    v19 = v13;
    *(_DWORD *)v12 = 136315138;
    if (*v6)
    {
      v14 = objc_msgSend(*v6, "name");
      v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
      v17 = v16;

    }
    else
    {
      v17 = 0xE400000000000000;
      v15 = 1701736302;
    }
    v18 = sub_100013F1C(v15, v17, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v18, &v19, v12 + 4, v12 + 12);

    swift_bridgeObjectRelease(v17);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, a3, v12, 0xCu);
    swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v12, -1, -1);

  }
  else
  {

  }
}

uint64_t DataModel.sortedHomes.getter()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;

  v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                             + OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent9DataModel_homeManager), "homes"));
  v2 = sub_100017138(0, (unint64_t *)&qword_10003DB18, HMHome_ptr);
  v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v1, v2);

  if (v3 < 0 || (v3 & 0x4000000000000000) != 0)
  {
    v6 = swift_bridgeObjectRetain(v3);
    v4 = (uint64_t)sub_100014664(v6, (uint64_t (*)(_QWORD *, uint64_t, uint64_t))sub_1000159B0);
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4 = v3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v3);
  }
  v7 = v4;
  sub_1000145D4(&v7);
  swift_bridgeObjectRelease(v3);
  return v7;
}

HMAccessory_optional __swiftcall DataModel.accessoryFromAnyHome(for:)(Swift::String_optional a1)
{
  uint64_t v1;
  uint64_t object;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  Swift::Bool v27;
  objc_class *v28;
  id v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  id v43;
  int64_t v44;
  uint64_t v45;
  uint64_t v46;
  int64_t v47;
  unint64_t v48;
  id v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t countAndFlagsBits;
  HMAccessory_optional result;

  object = (uint64_t)a1.value._object;
  countAndFlagsBits = a1.value._countAndFlagsBits;
  v54 = type metadata accessor for UUID(0);
  v52 = *(_QWORD *)(v54 - 8);
  v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  v51 = (char *)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v6 = (char *)&v43 - v5;
  v7 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v1
                                                             + OBJC_IVAR____TtC31HomeWidgetSingleAccessoryIntent9DataModel_homeManager), "homes"));
  v8 = sub_100017138(0, (unint64_t *)&qword_10003DB18, HMHome_ptr);
  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v7, v8);

  v55 = object;
  if ((unint64_t)v9 >> 62)
    goto LABEL_54;
  v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(object);
  v11 = (id)v1;
  if (!v10)
  {
LABEL_58:

    goto LABEL_59;
  }
LABEL_3:
  v43 = (id)v1;
  v1 = 0;
  v47 = v9;
  v48 = v9 & 0xC000000000000001;
  v44 = v9 + 32;
  v46 = v10;
  while (1)
  {
    if (v48)
    {
      swift_bridgeObjectRetain(v9);
      v12 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v1, v9);
    }
    else
    {
      v13 = *(void **)(v44 + 8 * v1);
      swift_bridgeObjectRetain(v9);
      v12 = v13;
    }
    v14 = v12;
    v15 = objc_msgSend(v12, "accessories", v43);
    object = sub_100017138(0, &qword_10003DB20, HMAccessory_ptr);
    v16 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v15, object);

    v49 = v14;
    v50 = v1;
    v45 = object;
    if ((unint64_t)v16 >> 62)
      break;
    v17 = *(void **)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(v16);
    if (v17)
      goto LABEL_9;
LABEL_25:
    swift_bridgeObjectRelease_n(v16, 2);
    v9 = v47;
    swift_bridgeObjectRelease(v47);

    v1 = v50 + 1;
    if (__OFADD__(v50, 1))
    {
LABEL_53:
      __break(1u);
LABEL_54:
      if (v9 < 0)
        v40 = v9;
      else
        v40 = v9 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(object);
      swift_bridgeObjectRetain(v9);
      v41 = (id)v1;
      v10 = _CocoaArrayWrapper.endIndex.getter(v40);
      swift_bridgeObjectRelease(v9);
      if (!v10)
        goto LABEL_58;
      goto LABEL_3;
    }
    if (v1 == v46)
    {
LABEL_30:

LABEL_59:
      swift_bridgeObjectRelease(v9);
      v17 = 0;
      goto LABEL_60;
    }
  }
  if (v16 < 0)
    v26 = v16;
  else
    v26 = v16 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain_n(v16, 2);
  v17 = (void *)_CocoaArrayWrapper.endIndex.getter(v26);
  swift_bridgeObjectRelease(v16);
  if (!v17)
    goto LABEL_25;
LABEL_9:
  v53 = (id)(v16 & 0xC000000000000001);
  v9 = 4;
  while (1)
  {
    if (v53)
      v19 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v9 - 4, v16);
    else
      v19 = *(id *)(v16 + 8 * v9);
    v20 = v19;
    object = v9 - 3;
    if (__OFADD__(v9 - 4, 1))
    {
      __break(1u);
LABEL_52:
      __break(1u);
      goto LABEL_53;
    }
    v21 = objc_msgSend(v19, "uniqueIdentifier");
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();

    v1 = (uint64_t)v6;
    v22 = UUID.uuidString.getter();
    v24 = v23;
    v25 = *(void (**)(char *, uint64_t))(v52 + 8);
    v25(v6, v54);
    if (!v55)
    {

      swift_bridgeObjectRelease(v24);
      goto LABEL_11;
    }
    if (v22 == countAndFlagsBits && v24 == v55)
    {

      v9 = v47;
      swift_bridgeObjectRelease(v47);

      swift_bridgeObjectRelease(v16);
      goto LABEL_29;
    }
    v18 = _stringCompareWithSmolCheck(_:_:expecting:)(v22, v24, countAndFlagsBits, v55, 0);
    swift_bridgeObjectRelease(v24);

    if ((v18 & 1) != 0)
      break;
LABEL_11:
    ++v9;
    if ((void *)object == v17)
      goto LABEL_25;
  }
  v9 = v47;
  swift_bridgeObjectRelease(v47);

  v24 = v16;
LABEL_29:
  swift_bridgeObjectRelease(v16);
  swift_bridgeObjectRelease(v24);
  v28 = (objc_class *)v50;
  if (v50 == v46)
    goto LABEL_30;
  if (v48)
  {
    v29 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v50, v9);
    goto LABEL_36;
  }
  if (v50 < 0)
  {
    __break(1u);
    goto LABEL_67;
  }
  if ((unint64_t)v50 >= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  v29 = *(id *)(v44 + 8 * v50);
LABEL_36:
  v30 = v45;
  v53 = v29;
  v31 = objc_msgSend(v29, "accessories");
  v32 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v31, v30);

  if ((unint64_t)v32 >> 62)
  {
    if (v32 < 0)
      v42 = v32;
    else
      v42 = v32 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v32);
    v6 = (char *)_CocoaArrayWrapper.endIndex.getter(v42);
    if (v6)
      goto LABEL_38;
  }
  else
  {
    v6 = *(char **)((v32 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(v32);
    if (v6)
    {
LABEL_38:
      v9 = v32 & 0xC000000000000001;
      v33 = 4;
      do
      {
        v1 = v33 - 4;
        v34 = v9
            ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v33 - 4, v32)
            : *(id *)(v32 + 8 * v33);
        v17 = v34;
        object = v33 - 3;
        if (__OFADD__(v1, 1))
          goto LABEL_52;
        v35 = objc_msgSend(v34, "uniqueIdentifier");
        v36 = v51;
        static UUID._unconditionallyBridgeFromObjectiveC(_:)();

        v37 = UUID.uuidString.getter();
        v24 = v38;
        v25(v36, v54);
        if (v37 == countAndFlagsBits && v24 == v55)
          goto LABEL_48;
        v39 = _stringCompareWithSmolCheck(_:_:expecting:)(v37, v24, countAndFlagsBits, v55, 0);
        swift_bridgeObjectRelease(v24);
        if ((v39 & 1) != 0)
        {

          swift_bridgeObjectRelease(v47);
          v24 = v32;
          goto LABEL_50;
        }

        ++v33;
      }
      while ((char *)object != v6);
    }
  }
  swift_bridgeObjectRelease_n(v32, 2);

  __break(1u);
LABEL_48:

  swift_bridgeObjectRelease(v47);
  swift_bridgeObjectRelease(v32);
LABEL_50:
  swift_bridgeObjectRelease(v32);
  swift_bridgeObjectRelease(v24);
LABEL_60:
  swift_bridgeObjectRelease(v55);
  v28 = (objc_class *)v17;
LABEL_68:
  result.value.super.isa = v28;
  result.is_nil = v27;
  return result;
}

HMAccessory_optional __swiftcall DataModel.accessory(for:in:)(Swift::String_optional a1, HMHome in)
{
  void *object;
  uint64_t countAndFlagsBits;
  id v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  Swift::Bool v8;
  objc_class *v9;
  HMAccessory_optional result;

  object = a1.value._object;
  countAndFlagsBits = a1.value._countAndFlagsBits;
  v4 = -[objc_class accessories](in.super.isa, "accessories");
  v5 = sub_100017138(0, &qword_10003DB20, HMAccessory_ptr);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v5);

  swift_bridgeObjectRetain(object);
  v7 = (objc_class *)sub_100016474(v6, countAndFlagsBits, (uint64_t)object);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(object);
  v9 = v7;
  result.value.super.isa = v9;
  result.is_nil = v8;
  return result;
}

_QWORD *DataModel.accessoriesFromAnyHome(for:)(unsigned __int8 a1)
{
  void *v1;
  uint64_t v3;
  id v4;
  _QWORD *v5;

  v3 = DataModel.sortedHomes.getter();
  v4 = v1;
  v5 = sub_100016A74(v3, a1);
  swift_bridgeObjectRelease(v3);

  return v5;
}

uint64_t sub_100013968()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  id v6;
  NSString v7;
  NSString v8;
  id v9;
  uint64_t result;
  id v11;
  NSURL *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;

  v0 = type metadata accessor for URL(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000D3B8((uint64_t *)&unk_10003DC10);
  __chkstk_darwin();
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v7 = String._bridgeToObjectiveC()();
  v8 = String._bridgeToObjectiveC()();
  v9 = objc_msgSend(v6, "URLForResource:withExtension:", v7, v8);

  if (!v9)
  {
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v5, 1, 1, v0);
    goto LABEL_6;
  }
  static URL._unconditionallyBridgeFromObjectiveC(_:)(v9);

  (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v5, v3, v0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v1 + 56))(v5, 0, 1, v0);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v1 + 48))(v5, 1, v0);
  if ((_DWORD)result == 1)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v11 = objc_allocWithZone((Class)NSDictionary);
  URL._bridgeToObjectiveC()(v12);
  v14 = v13;
  v15 = objc_msgSend(v11, "initWithContentsOfURL:", v13);

  result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v5, v0);
  if (v15)
  {
    static DataModel.defaultMetadataPlist = (uint64_t)v15;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

id static DataModel.defaultMetadataPlist.getter()
{
  if (qword_10003D5E8 != -1)
    swift_once(&qword_10003D5E8, sub_100013968);
  return (id)static DataModel.defaultMetadataPlist;
}

uint64_t sub_100013BA4(uint64_t a1)
{
  return sub_100013E00(a1, static DataModel.widgetLogger, 0xD000000000000014, 0x800000010002C890);
}

uint64_t type metadata accessor for DataModel()
{
  return objc_opt_self(_TtC31HomeWidgetSingleAccessoryIntent9DataModel);
}

uint64_t static DataModel.widgetLogger.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_100013CA8(&qword_10003D5F0, (uint64_t)static DataModel.widgetLogger, (uint64_t)sub_100013BA4, a1);
}

uint64_t sub_100013C04(uint64_t a1)
{
  return sub_100013E00(a1, static DataModel.widgetLoggerFetches, 0x6546746567646957, 0xED00007365686374);
}

uint64_t DataModel.widgetLoggerFetches.unsafeMutableAddressor()
{
  return sub_100013C4C(&qword_10003D5F8, (uint64_t)static DataModel.widgetLoggerFetches, (uint64_t)sub_100013C04);
}

uint64_t sub_100013C4C(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  if (*a1 != -1)
    swift_once(a1, a3);
  v4 = type metadata accessor for Logger(0);
  return sub_100012570(v4, a2);
}

uint64_t static DataModel.widgetLoggerFetches.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_100013CA8(&qword_10003D5F8, (uint64_t)static DataModel.widgetLoggerFetches, (uint64_t)sub_100013C04, a1);
}

uint64_t sub_100013CA8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;

  if (*a1 != -1)
    swift_once(a1, a3);
  v6 = type metadata accessor for Logger(0);
  v7 = sub_100012570(v6, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a4, v7, v6);
}

uint64_t sub_100013D10(uint64_t a1)
{
  return sub_100013E00(a1, static DataModel.widgetLoggerSecurity, 0x6553746567646957, 0xEE00797469727563);
}

uint64_t DataModel.widgetLoggerSecurity.unsafeMutableAddressor()
{
  return sub_100013C4C(&qword_10003D600, (uint64_t)static DataModel.widgetLoggerSecurity, (uint64_t)sub_100013D10);
}

uint64_t static DataModel.widgetLoggerSecurity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_100013CA8(&qword_10003D600, (uint64_t)static DataModel.widgetLoggerSecurity, (uint64_t)sub_100013D10, a1);
}

uint64_t sub_100013D74(uint64_t a1)
{
  return sub_100013E00(a1, static DataModel.widgetLoggerClimate, 0x6C43746567646957, 0xED00006574616D69);
}

uint64_t DataModel.widgetLoggerClimate.unsafeMutableAddressor()
{
  return sub_100013C4C(&qword_10003D608, (uint64_t)static DataModel.widgetLoggerClimate, (uint64_t)sub_100013D74);
}

uint64_t static DataModel.widgetLoggerClimate.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_100013CA8(&qword_10003D608, (uint64_t)static DataModel.widgetLoggerClimate, (uint64_t)sub_100013D74, a1);
}

uint64_t sub_100013DD8(uint64_t a1)
{
  return sub_100013E00(a1, static DataModel.widgetLoggerLights, 0x694C746567646957, 0xEC00000073746867);
}

uint64_t sub_100013E00(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  v7 = type metadata accessor for Logger(0);
  sub_1000170F8(v7, a2);
  sub_100012570(v7, (uint64_t)a2);
  return Logger.init(subsystem:category:)(0x6C7070612E6D6F63, 0xEE00656D6F482E65, a3, a4);
}

uint64_t DataModel.widgetLoggerLights.unsafeMutableAddressor()
{
  return sub_100013C4C(&qword_10003D610, (uint64_t)static DataModel.widgetLoggerLights, (uint64_t)sub_100013DD8);
}

uint64_t static DataModel.widgetLoggerLights.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_100013CA8(&qword_10003D610, (uint64_t)static DataModel.widgetLoggerLights, (uint64_t)sub_100013DD8, a1);
}

const char *DataModel.noDataString.unsafeMutableAddressor()
{
  return "––";
}

uint64_t static DataModel.noDataString.getter()
{
  return 0x9380E29380E2;
}

uint64_t sub_100013F1C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100013FEC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_10000D448((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_10000D448((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10001244C(v12);
  return v7;
}

uint64_t sub_100013FEC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1000141A4(a5, a6);
    *a1 = v13;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25);
    __break(1u);
LABEL_17:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, 2, 1173, 0);
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
}

uint64_t sub_1000141A4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100014238(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
    v2 = sub_100014488(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100014488(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100014238(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    while (1)
    {
      v5 = sub_1000143AC(v4, 0);
      if (v4 < 0)
        break;
      v6 = v5;
      v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0)
        goto LABEL_14;
      if (v7 == v4)
        return v6;
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33);
      __break(1u);
LABEL_10:
      v4 = String.UTF8View._foreignCount()();
      if (!v4)
        return &_swiftEmptyArrayStorage;
    }
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, 2, 71, 0);
    __break(1u);
LABEL_14:
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26);
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_1000143AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  size_t v6;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return &_swiftEmptyArrayStorage;
  v4 = sub_10000D3B8(&qword_10003DBC0);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100014410(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;

  v5 = a1;
  v6 = a1 >> 16;
  v7 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v13 = String.UTF16View.index(_:offsetBy:)(15, v6, a2);
    v14 = v13 + (v7 << 16);
    v15 = v13 & 0xFFFFFFFFFFFFFFFCLL | v5 & 3;
    v16 = v14 & 0xFFFFFFFFFFFF0000;
    if (!v7)
      v16 = v15;
    return v16 | 4;
  }
  else
  {
    v8 = String.UTF8View._foreignIndex(_:offsetBy:)(15, v6);
    v9 = v8 + (v7 << 16);
    v10 = v8 & 0xFFFFFFFFFFFFFFFCLL | v5 & 3;
    v11 = v9 & 0xFFFFFFFFFFFF0000;
    if (!v7)
      v11 = v10;
    return v11 | 8;
  }
}

uint64_t sub_100014488(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
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
    v10 = sub_10000D3B8(&qword_10003DBC0);
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
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_1000145D4(uint64_t *a1)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v4;
  uint64_t v6[2];

  v2 = *a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*a1);
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v2 = sub_1000243A0(v2);
    *a1 = v2;
  }
  v4 = *(_QWORD *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_100014764(v6);
  return specialized ContiguousArray._endMutation()();
}

_QWORD *sub_10001464C(uint64_t a1)
{
  return sub_100014664(a1, (uint64_t (*)(_QWORD *, uint64_t, uint64_t))sub_1000159B0);
}

_QWORD *sub_100014658(uint64_t a1)
{
  return sub_100014664(a1, (uint64_t (*)(_QWORD *, uint64_t, uint64_t))sub_100015DD8);
}

_QWORD *sub_100014664(uint64_t a1, uint64_t (*a2)(_QWORD *, uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(_QWORD *, uint64_t, uint64_t);
  uint64_t v11;

  if ((unint64_t)a1 >> 62)
    goto LABEL_10;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    return _swiftEmptyArrayStorage;
  while (1)
  {
    if (v4 <= 0)
    {
      v6 = _swiftEmptyArrayStorage;
    }
    else
    {
      v5 = sub_10000D3B8(&qword_10003DBC8);
      v6 = (_QWORD *)swift_allocObject(v5, 8 * v4 + 32, 7);
      v7 = j__malloc_size(v6);
      v8 = v7 - 32;
      if (v7 < 32)
        v8 = v7 - 25;
      v6[2] = v4;
      v6[3] = (2 * (v8 >> 3)) | 1;
    }
    swift_bridgeObjectRetain(a1);
    v9 = a2(v6 + 4, v4, a1);
    a2 = v10;
    swift_bridgeObjectRelease(v9);
    if (a2 == (uint64_t (*)(_QWORD *, uint64_t, uint64_t))v4)
      break;
    __break(1u);
LABEL_10:
    if (a1 < 0)
      v11 = a1;
    else
      v11 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v4 = _CocoaArrayWrapper.endIndex.getter(v11);
    swift_bridgeObjectRelease(a1);
    if (!v4)
      return _swiftEmptyArrayStorage;
  }
  return v6;
}

void sub_100014764(uint64_t *a1)
{
  uint64_t v1;
  Swift::Int v3;
  Swift::Int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  Swift::Int v10;
  uint64_t v11;
  __objc2_prot_list *v12;
  Swift::Int v13;
  unint64_t v14;
  Swift::Int v15;
  void *v16;
  id v17;
  id v18;
  unsigned int v19;
  unsigned int v20;
  Swift::Int v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  Swift::Int v31;
  unsigned int v32;
  void *v33;
  id v34;
  id v35;
  unsigned int v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v46;
  char v47;
  uint64_t *v48;
  Swift::Int v49;
  Swift::Int v50;
  uint64_t *v51;
  uint64_t v52;
  Swift::Int v53;
  uint64_t v54;
  void *v55;
  Swift::Int v56;
  uint64_t v57;
  void *v58;
  id v59;
  id v60;
  unsigned __int8 v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char v71;
  void *v72;
  unint64_t v73;
  unint64_t v74;
  char *v75;
  char *v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  BOOL v88;
  unint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  BOOL v98;
  uint64_t v99;
  char v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  BOOL v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  char *v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  char *v121;
  unint64_t v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  uint64_t v127;
  unint64_t v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  char *v132;
  char *v133;
  char *v134;
  unint64_t v135;
  char *v136;
  uint64_t v137;
  uint64_t *v138;
  uint64_t v139;
  Swift::Int v140;
  char *v141;
  char *v142;
  Swift::Int v143;
  Swift::Int v144;
  Swift::Int v145;
  unsigned int v146;
  uint64_t v147;
  void **v148;
  uint64_t v149;
  Swift::Int v150;
  Swift::Int v151;
  Swift::Int v152;
  Swift::Int v153;
  uint64_t v154;

  v3 = a1[1];
  v4 = _minimumMergeRunLength(_:)(v3);
  if (v4 >= v3)
  {
    if (v3 < 0)
      goto LABEL_160;
    if (v3)
      sub_10001517C(0, v3, 1, a1);
    return;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_168;
  v140 = v4;
  v145 = v3;
  v138 = a1;
  if (v3 < 2)
  {
    v9 = (char *)&_swiftEmptyArrayStorage;
    v154 = (uint64_t)&_swiftEmptyArrayStorage;
    v148 = (void **)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v3 != 1)
    {
      v14 = *((_QWORD *)&_swiftEmptyArrayStorage + 2);
LABEL_123:
      if (v14 >= 2)
      {
        v127 = *v138;
        do
        {
          v128 = v14 - 2;
          if (v14 < 2)
            goto LABEL_155;
          if (!v127)
            goto LABEL_167;
          v117 = v9;
          v129 = v9 + 32;
          v130 = *(_QWORD *)&v9[16 * v128 + 32];
          v131 = *(_QWORD *)&v9[16 * v14 + 24];
          sub_100015350((void **)(v127 + 8 * v130), (id *)(v127 + 8 * *(_QWORD *)&v129[16 * v14 - 16]), v127 + 8 * v131, v148);
          if (v1)
            goto LABEL_135;
          if (v131 < v130)
            goto LABEL_156;
          if ((swift_isUniquelyReferenced_nonNull_native(v117) & 1) == 0)
            v117 = sub_100024224((uint64_t)v117);
          if (v128 >= *((_QWORD *)v117 + 2))
            goto LABEL_157;
          v132 = v117;
          v133 = v117 + 32;
          v134 = &v117[16 * v128 + 32];
          *(_QWORD *)v134 = v130;
          *((_QWORD *)v134 + 1) = v131;
          v135 = *((_QWORD *)v117 + 2);
          if (v14 > v135)
            goto LABEL_158;
          v9 = v132;
          memmove(&v133[16 * v14 - 16], &v133[16 * v14], 16 * (v135 - v14));
          *((_QWORD *)v9 + 2) = v135 - 1;
          v14 = v135 - 1;
        }
        while (v135 > 2);
      }
      v136 = v9;
LABEL_137:
      v137 = swift_bridgeObjectRelease(v136);
      *(_QWORD *)((v154 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
      specialized Array._endMutation()(v137);
      swift_bridgeObjectRelease(v154);
      return;
    }
  }
  else
  {
    v6 = v5 >> 1;
    v7 = sub_100017138(0, (unint64_t *)&qword_10003DB18, HMHome_ptr);
    v8 = static Array._allocateBufferUninitialized(minimumCapacity:)(v6, v7);
    *(_QWORD *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) = v6;
    v148 = (void **)((v8 & 0xFFFFFFFFFFFFFF8) + 32);
    v154 = v8;
  }
  v10 = 0;
  v11 = *a1;
  v139 = *a1 - 8;
  v9 = (char *)&_swiftEmptyArrayStorage;
  v12 = &DataModel;
  v13 = v145;
  v149 = *a1;
  while (1)
  {
    v15 = v10++;
    if (v10 >= v13)
      goto LABEL_50;
    v141 = v9;
    v16 = *(void **)(v11 + 8 * v15);
    v17 = *(id *)(v11 + 8 * v10);
    v18 = v16;
    v19 = objc_msgSend(v17, (SEL)v12[356].count);
    if (v19 == objc_msgSend(v18, (SEL)v12[356].count))
    {
      v150 = v10;
      v22 = objc_msgSend(v17, "name");
      v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
      v25 = v24;

      v26 = objc_msgSend(v18, "name");
      v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(v26);
      v29 = v28;

      if (v23 == v27 && v25 == v29)
      {
        v20 = 0;
        v29 = v25;
      }
      else
      {
        v20 = _stringCompareWithSmolCheck(_:_:expecting:)(v23, v25, v27, v29, 1);
      }
      swift_bridgeObjectRelease(v25);
      swift_bridgeObjectRelease(v29);

      v21 = v15 + 2;
      v12 = &DataModel;
      v10 = v150;
      if (v15 + 2 < v145)
      {
LABEL_27:
        v31 = v21;
        v11 = v149;
        v146 = v20;
        do
        {
          v21 = v31;
          v33 = *(void **)(v11 + 8 * v10);
          v34 = *(id *)(v11 + 8 * v31);
          v35 = v33;
          v36 = objc_msgSend(v34, (SEL)v12[356].count);
          if (v36 == objc_msgSend(v35, (SEL)v12[356].count))
          {
            v151 = v21;
            v37 = objc_msgSend(v34, "name");
            v38 = static String._unconditionallyBridgeFromObjectiveC(_:)(v37);
            v40 = v39;

            v41 = objc_msgSend(v35, "name");
            v42 = static String._unconditionallyBridgeFromObjectiveC(_:)(v41);
            v44 = v43;

            if (v38 == v42 && v40 == v44)
            {

              swift_bridgeObjectRelease_n(v40, 2);
              v12 = &DataModel;
              v21 = v151;
              v20 = v146;
              if ((v146 & 1) != 0)
              {
                v9 = v141;
                v11 = v149;
                goto LABEL_41;
              }
            }
            else
            {
              v46 = _stringCompareWithSmolCheck(_:_:expecting:)(v38, v40, v42, v44, 1);

              swift_bridgeObjectRelease(v40);
              swift_bridgeObjectRelease(v44);
              v47 = v146 ^ v46;
              v20 = v146;
              v12 = &DataModel;
              v21 = v151;
              if ((v47 & 1) != 0)
                goto LABEL_19;
            }
          }
          else
          {
            v32 = objc_msgSend(v34, (SEL)v12[356].count);

            if (((v20 ^ v32) & 1) != 0)
              goto LABEL_19;
          }
          v31 = v21 + 1;
          v10 = v21;
          v11 = v149;
        }
        while (v21 + 1 < v145);
        ++v21;
        goto LABEL_40;
      }
    }
    else
    {
      v20 = objc_msgSend(v17, (SEL)v12[356].count);

      v21 = v15 + 2;
      if (v15 + 2 < v145)
        goto LABEL_27;
    }
    LOBYTE(v146) = v20;
LABEL_19:
    v11 = v149;
LABEL_40:
    v10 = v21;
    v9 = v141;
    if ((v146 & 1) != 0)
    {
LABEL_41:
      if (v21 < v15)
        goto LABEL_161;
      if (v15 < v21)
      {
        v48 = (uint64_t *)(v139 + 8 * v21);
        v49 = v21;
        v50 = v15;
        v51 = (uint64_t *)(v11 + 8 * v15);
        do
        {
          if (v50 != --v49)
          {
            if (!v11)
              goto LABEL_166;
            v52 = *v51;
            *v51 = *v48;
            *v48 = v52;
          }
          ++v50;
          --v48;
          ++v51;
        }
        while (v50 < v49);
      }
      v10 = v21;
    }
LABEL_50:
    if (v10 >= v145)
      goto LABEL_74;
    if (__OFSUB__(v10, v15))
      goto LABEL_159;
    if (v10 - v15 >= v140)
      goto LABEL_74;
    if (__OFADD__(v15, v140))
      goto LABEL_162;
    v53 = v145;
    if (v15 + v140 < v145)
      v53 = v15 + v140;
    if (v53 < v15)
      break;
    if (v10 == v53)
      goto LABEL_74;
    v142 = v9;
    v143 = v53;
    v54 = v139 + 8 * v10;
    v144 = v15;
    while (2)
    {
      v55 = *(void **)(v11 + 8 * v10);
      v56 = v15;
      v147 = v54;
      v57 = v54;
      v152 = v10;
      while (1)
      {
        v58 = *(void **)v57;
        v59 = v55;
        v60 = v58;
        LODWORD(v58) = objc_msgSend(v59, (SEL)v12[356].count);
        if ((_DWORD)v58 == objc_msgSend(v60, (SEL)v12[356].count))
          break;
        v61 = objc_msgSend(v59, (SEL)v12[356].count);

        if ((v61 & 1) == 0)
          goto LABEL_60;
LABEL_70:
        if (!v11)
          goto LABEL_164;
        v72 = *(void **)v57;
        v55 = *(void **)(v57 + 8);
        *(_QWORD *)v57 = v55;
        *(_QWORD *)(v57 + 8) = v72;
        v57 -= 8;
        if (v10 == ++v56)
          goto LABEL_60;
      }
      v62 = objc_msgSend(v59, "name");
      v63 = static String._unconditionallyBridgeFromObjectiveC(_:)(v62);
      v65 = v64;

      v66 = objc_msgSend(v60, "name");
      v67 = static String._unconditionallyBridgeFromObjectiveC(_:)(v66);
      v69 = v68;

      if (v63 != v67 || v65 != v69)
      {
        v71 = _stringCompareWithSmolCheck(_:_:expecting:)(v63, v65, v67, v69, 1);

        swift_bridgeObjectRelease(v65);
        swift_bridgeObjectRelease(v69);
        v11 = v149;
        v10 = v152;
        v12 = &DataModel;
        if ((v71 & 1) == 0)
          goto LABEL_60;
        goto LABEL_70;
      }

      swift_bridgeObjectRelease_n(v65, 2);
      v11 = v149;
      v10 = v152;
      v12 = &DataModel;
LABEL_60:
      ++v10;
      v54 = v147 + 8;
      v15 = v144;
      if (v10 != v143)
        continue;
      break;
    }
    v10 = v143;
    v9 = v142;
LABEL_74:
    if (v10 < v15)
      goto LABEL_154;
    if ((swift_isUniquelyReferenced_nonNull_native(v9) & 1) == 0)
      v9 = sub_100024080(0, *((_QWORD *)v9 + 2) + 1, 1, v9);
    v74 = *((_QWORD *)v9 + 2);
    v73 = *((_QWORD *)v9 + 3);
    v14 = v74 + 1;
    if (v74 >= v73 >> 1)
      v9 = sub_100024080((char *)(v73 > 1), v74 + 1, 1, v9);
    *((_QWORD *)v9 + 2) = v14;
    v75 = v9 + 32;
    v76 = &v9[16 * v74 + 32];
    *(_QWORD *)v76 = v15;
    *((_QWORD *)v76 + 1) = v10;
    if (v74)
    {
      v153 = v10;
      while (1)
      {
        v77 = v14 - 1;
        if (v14 >= 4)
        {
          v82 = &v75[16 * v14];
          v83 = *((_QWORD *)v82 - 8);
          v84 = *((_QWORD *)v82 - 7);
          v88 = __OFSUB__(v84, v83);
          v85 = v84 - v83;
          if (v88)
            goto LABEL_143;
          v87 = *((_QWORD *)v82 - 6);
          v86 = *((_QWORD *)v82 - 5);
          v88 = __OFSUB__(v86, v87);
          v80 = v86 - v87;
          v81 = v88;
          if (v88)
            goto LABEL_144;
          v89 = v14 - 2;
          v90 = &v75[16 * v14 - 32];
          v92 = *(_QWORD *)v90;
          v91 = *((_QWORD *)v90 + 1);
          v88 = __OFSUB__(v91, v92);
          v93 = v91 - v92;
          if (v88)
            goto LABEL_146;
          v88 = __OFADD__(v80, v93);
          v94 = v80 + v93;
          if (v88)
            goto LABEL_149;
          if (v94 >= v85)
          {
            v112 = &v75[16 * v77];
            v114 = *(_QWORD *)v112;
            v113 = *((_QWORD *)v112 + 1);
            v88 = __OFSUB__(v113, v114);
            v115 = v113 - v114;
            if (v88)
              goto LABEL_153;
            v105 = v80 < v115;
            goto LABEL_112;
          }
        }
        else
        {
          if (v14 != 3)
          {
            v106 = *((_QWORD *)v9 + 4);
            v107 = *((_QWORD *)v9 + 5);
            v88 = __OFSUB__(v107, v106);
            v99 = v107 - v106;
            v100 = v88;
            goto LABEL_106;
          }
          v79 = *((_QWORD *)v9 + 4);
          v78 = *((_QWORD *)v9 + 5);
          v88 = __OFSUB__(v78, v79);
          v80 = v78 - v79;
          v81 = v88;
        }
        if ((v81 & 1) != 0)
          goto LABEL_145;
        v89 = v14 - 2;
        v95 = &v75[16 * v14 - 32];
        v97 = *(_QWORD *)v95;
        v96 = *((_QWORD *)v95 + 1);
        v98 = __OFSUB__(v96, v97);
        v99 = v96 - v97;
        v100 = v98;
        if (v98)
          goto LABEL_148;
        v101 = &v75[16 * v77];
        v103 = *(_QWORD *)v101;
        v102 = *((_QWORD *)v101 + 1);
        v88 = __OFSUB__(v102, v103);
        v104 = v102 - v103;
        if (v88)
          goto LABEL_151;
        if (__OFADD__(v99, v104))
          goto LABEL_152;
        if (v99 + v104 >= v80)
        {
          v105 = v80 < v104;
LABEL_112:
          if (v105)
            v77 = v89;
          goto LABEL_114;
        }
LABEL_106:
        if ((v100 & 1) != 0)
          goto LABEL_147;
        v108 = &v75[16 * v77];
        v110 = *(_QWORD *)v108;
        v109 = *((_QWORD *)v108 + 1);
        v88 = __OFSUB__(v109, v110);
        v111 = v109 - v110;
        if (v88)
          goto LABEL_150;
        if (v111 < v99)
          goto LABEL_14;
LABEL_114:
        v116 = v77 - 1;
        if (v77 - 1 >= v14)
        {
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
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
LABEL_154:
          __break(1u);
LABEL_155:
          __break(1u);
LABEL_156:
          __break(1u);
LABEL_157:
          __break(1u);
LABEL_158:
          __break(1u);
LABEL_159:
          __break(1u);
LABEL_160:
          __break(1u);
LABEL_161:
          __break(1u);
LABEL_162:
          __break(1u);
          goto LABEL_163;
        }
        if (!v11)
          goto LABEL_165;
        v117 = v9;
        v118 = v11;
        v119 = &v75[16 * v116];
        v120 = *(_QWORD *)v119;
        v121 = v75;
        v122 = v77;
        v123 = &v75[16 * v77];
        v124 = *((_QWORD *)v123 + 1);
        v125 = v118;
        sub_100015350((void **)(v118 + 8 * *(_QWORD *)v119), (id *)(v118 + 8 * *(_QWORD *)v123), v118 + 8 * v124, v148);
        if (v1)
        {
LABEL_135:
          v136 = v117;
          goto LABEL_137;
        }
        if (v124 < v120)
          goto LABEL_140;
        if (v122 > *((_QWORD *)v117 + 2))
          goto LABEL_141;
        *(_QWORD *)v119 = v120;
        *(_QWORD *)&v121[16 * v116 + 8] = v124;
        v126 = *((_QWORD *)v117 + 2);
        if (v122 >= v126)
          goto LABEL_142;
        v9 = v117;
        v14 = v126 - 1;
        memmove(v123, v123 + 16, 16 * (v126 - 1 - v122));
        v75 = v121;
        *((_QWORD *)v117 + 2) = v126 - 1;
        v12 = &DataModel;
        v10 = v153;
        v11 = v125;
        if (v126 <= 2)
          goto LABEL_14;
      }
    }
    v14 = 1;
LABEL_14:
    v13 = v145;
    if (v10 >= v145)
      goto LABEL_123;
  }
LABEL_163:
  __break(1u);
LABEL_164:
  __break(1u);
LABEL_165:
  __break(1u);
LABEL_166:
  __break(1u);
LABEL_167:
  __break(1u);
LABEL_168:
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Can't construct Array with count < 0", 36, 2, "Swift/Array.swift", 17);
  __break(1u);
}

void sub_10001517C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __objc2_prot_list *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  unsigned __int8 v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v23;
  void *v24;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if (a3 != a2)
  {
    v4 = a3;
    v5 = *a4;
    v6 = *a4 + 8 * a3 - 8;
    v7 = &DataModel;
    v28 = *a4;
LABEL_6:
    v8 = *(void **)(v5 + 8 * v4);
    v9 = a1;
    v27 = v6;
    v29 = v4;
    while (1)
    {
      v10 = *(void **)v6;
      v11 = v8;
      v12 = v10;
      LODWORD(v10) = objc_msgSend(v11, (SEL)v7[356].count);
      if ((_DWORD)v10 == objc_msgSend(v12, (SEL)v7[356].count))
      {
        v14 = objc_msgSend(v11, "name");
        v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v17 = v16;

        v18 = objc_msgSend(v12, "name");
        v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v21 = v20;

        if (v15 == v19 && v17 == v21)
        {

          swift_bridgeObjectRelease_n(v17, 2);
          v4 = v29;
          v5 = v28;
          v7 = &DataModel;
LABEL_5:
          ++v4;
          v6 = v27 + 8;
          if (v4 == a2)
            return;
          goto LABEL_6;
        }
        v23 = _stringCompareWithSmolCheck(_:_:expecting:)(v15, v17, v19, v21, 1);

        swift_bridgeObjectRelease(v17);
        swift_bridgeObjectRelease(v21);
        v4 = v29;
        v5 = v28;
        v7 = &DataModel;
        if ((v23 & 1) == 0)
          goto LABEL_5;
      }
      else
      {
        v13 = objc_msgSend(v11, (SEL)v7[356].count);

        if ((v13 & 1) == 0)
          goto LABEL_5;
      }
      if (!v5)
        break;
      v24 = *(void **)v6;
      v8 = *(void **)(v6 + 8);
      *(_QWORD *)v6 = v8;
      *(_QWORD *)(v6 + 8) = v24;
      v6 -= 8;
      if (v4 == ++v9)
        goto LABEL_5;
    }
    __break(1u);
  }
}

uint64_t sub_100015350(void **__src, id *a2, unint64_t a3, void **__dst)
{
  void **v4;
  id *v5;
  void **v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void **v13;
  __objc2_prot_list *v14;
  void *v15;
  id v16;
  id v17;
  unsigned __int8 v18;
  id *v19;
  void **v20;
  void **v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v31;
  void **v32;
  void **v33;
  __objc2_prot_list *v34;
  id *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  unsigned int v41;
  unsigned __int8 v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v51;
  uint64_t result;
  void **v53;
  void **v54;
  uint64_t v55;
  void **v56;
  id *v57;
  void **v59;
  id *v60;
  id *v61;
  void **v62;
  void **v63;
  id *v64;

  v4 = __dst;
  v5 = a2;
  v6 = __src;
  v7 = (char *)a2 - (char *)__src;
  v8 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0)
    v8 = (char *)a2 - (char *)__src;
  v9 = v8 >> 3;
  v10 = a3 - (_QWORD)a2;
  v11 = a3 - (_QWORD)a2 + 7;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v11 = a3 - (_QWORD)a2;
  v12 = v11 >> 3;
  v64 = __src;
  v63 = __dst;
  if (v9 >= v11 >> 3)
  {
    if (v10 < -7)
      goto LABEL_61;
    if (__dst != a2 || &a2[v12] <= __dst)
      memmove(__dst, a2, 8 * v12);
    v32 = &v4[v12];
    v62 = v32;
    v64 = v5;
    if (v6 >= v5 || v10 < 8)
    {
LABEL_60:
      sub_100024178(&v64, &v63, &v62);
      return 1;
    }
    v33 = (void **)(a3 - 8);
    v34 = &DataModel;
    v35 = v5;
    v53 = v6;
    v54 = v4;
    while (1)
    {
      v59 = v32;
      v61 = v5;
      v57 = v33 + 1;
      v37 = *--v32;
      v36 = v37;
      v38 = *--v35;
      v39 = v36;
      v40 = v38;
      v41 = objc_msgSend(v39, (SEL)v34[356].count);
      if (v41 == objc_msgSend(v40, (SEL)v34[356].count))
      {
        v43 = objc_msgSend(v39, "name");
        v44 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v55 = v45;

        v46 = objc_msgSend(v40, "name");
        v47 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v49 = v48;

        if (v44 == v47 && v55 == v49)
        {

          swift_bridgeObjectRelease_n(v55, 2);
          v6 = v53;
          v4 = v54;
          v34 = &DataModel;
        }
        else
        {
          v51 = _stringCompareWithSmolCheck(_:_:expecting:)(v44, v55, v47, v49, 1);

          swift_bridgeObjectRelease(v55);
          swift_bridgeObjectRelease(v49);
          v6 = v53;
          v4 = v54;
          v34 = &DataModel;
          if ((v51 & 1) != 0)
          {
LABEL_47:
            v32 = v59;
            if (v57 != v61 || v33 >= v61)
              *v33 = *v35;
            v64 = v35;
            goto LABEL_56;
          }
        }
      }
      else
      {
        v42 = objc_msgSend(v39, (SEL)v34[356].count);

        if ((v42 & 1) != 0)
          goto LABEL_47;
      }
      v62 = v32;
      v35 = v61;
      if (v57 < v59 || v33 >= v59 || v57 != v59)
        *v33 = *v32;
LABEL_56:
      if (v35 > v6)
      {
        --v33;
        v5 = v35;
        if (v32 > v4)
          continue;
      }
      goto LABEL_60;
    }
  }
  if (v7 >= -7)
  {
    if (__dst != __src || &__src[v9] <= __dst)
      memmove(__dst, __src, 8 * v9);
    v13 = &v4[v9];
    v62 = v13;
    if ((unint64_t)v5 < a3 && v7 >= 8)
    {
      v14 = &DataModel;
      v56 = v13;
      while (1)
      {
        v15 = *v4;
        v16 = *v5;
        v17 = v15;
        LODWORD(v15) = objc_msgSend(v16, (SEL)v14[356].count);
        if ((_DWORD)v15 == objc_msgSend(v17, (SEL)v14[356].count))
        {
          v60 = v5;
          v20 = v6;
          v21 = v4;
          v22 = objc_msgSend(v16, "name");
          v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          v25 = v24;

          v26 = objc_msgSend(v17, "name");
          v27 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          v29 = v28;

          if (v23 == v27 && v25 == v29)
          {

            swift_bridgeObjectRelease_n(v25, 2);
            v4 = v21;
            v6 = v20;
            v5 = v60;
            v13 = v56;
            v14 = &DataModel;
            if (v6 == v4)
              goto LABEL_17;
LABEL_16:
            *v6 = *v4;
            goto LABEL_17;
          }
          v31 = _stringCompareWithSmolCheck(_:_:expecting:)(v23, v25, v27, v29, 1);

          swift_bridgeObjectRelease(v25);
          swift_bridgeObjectRelease(v29);
          v4 = v21;
          v6 = v20;
          v5 = v60;
          v13 = v56;
          v14 = &DataModel;
          if ((v31 & 1) != 0)
          {
LABEL_23:
            v19 = v5 + 1;
            if (v6 < v5 || v6 >= v19 || v6 != v5)
              *v6 = *v5;
            goto LABEL_27;
          }
        }
        else
        {
          v18 = objc_msgSend(v16, (SEL)v14[356].count);

          if ((v18 & 1) != 0)
            goto LABEL_23;
        }
        if (v6 != v4)
          goto LABEL_16;
LABEL_17:
        v63 = ++v4;
        v19 = v5;
LABEL_27:
        ++v6;
        if (v4 < v13)
        {
          v5 = v19;
          if ((unint64_t)v19 < a3)
            continue;
        }
        v64 = v6;
        goto LABEL_60;
      }
    }
    goto LABEL_60;
  }
LABEL_61:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
  __break(1u);
  return result;
}

uint64_t sub_10001582C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_100015848(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_100015848(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_10000D3B8(&qword_10003DBE0);
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
    swift_arrayInitWithCopy(v14, v15, v8, &type metadata for String);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_1000159B0(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t i;
  void (*v15)(_QWORD *);
  id *v16;
  id v17;
  uint64_t v18;
  uint64_t result;
  uint64_t (*v20[4])();

  v6 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0)
      v18 = a3;
    else
      v18 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v7 = _CocoaArrayWrapper.endIndex.getter(v18);
    swift_bridgeObjectRelease(a3);
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_25;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    if (a3 < 0)
      v12 = a3;
    else
      v12 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v13 = _CocoaArrayWrapper.endIndex.getter(v12);
    swift_bridgeObjectRelease(a3);
    if (v13 <= a2)
    {
      if (v7 >= 1)
      {
        sub_100010324(&qword_10003DC08, &qword_10003DC00);
        swift_bridgeObjectRetain(a3);
        for (i = 0; i != v7; ++i)
        {
          sub_10000D3B8(&qword_10003DC00);
          v15 = sub_100015FDC(v20, i, a3);
          v17 = *v16;
          ((void (*)(uint64_t (**)(), _QWORD))v15)(v20, 0);
          *(_QWORD *)(a1 + 8 * i) = v17;
        }
        swift_bridgeObjectRelease(a3);
        return a3;
      }
      goto LABEL_24;
    }
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_23;
  }
  v10 = v8 + 32;
  if (v8 + 32 >= a1 + 8 * v9 || v10 + 8 * v9 <= a1)
  {
    v11 = sub_100017138(0, (unint64_t *)&qword_10003DB18, HMHome_ptr);
    swift_arrayInitWithCopy(a1, v10, v9, v11);
    return a3;
  }
LABEL_26:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100015BC4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t i;
  void (*v15)(_QWORD *);
  id *v16;
  id v17;
  uint64_t v18;
  uint64_t result;
  uint64_t (*v20[4])();

  v6 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0)
      v18 = a3;
    else
      v18 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v7 = _CocoaArrayWrapper.endIndex.getter(v18);
    swift_bridgeObjectRelease(a3);
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_25;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    if (a3 < 0)
      v12 = a3;
    else
      v12 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v13 = _CocoaArrayWrapper.endIndex.getter(v12);
    swift_bridgeObjectRelease(a3);
    if (v13 <= a2)
    {
      if (v7 >= 1)
      {
        sub_100010324(&qword_10003DBF8, &qword_10003DBF0);
        swift_bridgeObjectRetain(a3);
        for (i = 0; i != v7; ++i)
        {
          sub_10000D3B8(&qword_10003DBF0);
          v15 = sub_100015FDC(v20, i, a3);
          v17 = *v16;
          ((void (*)(uint64_t (**)(), _QWORD))v15)(v20, 0);
          *(_QWORD *)(a1 + 8 * i) = v17;
        }
        swift_bridgeObjectRelease(a3);
        return a3;
      }
      goto LABEL_24;
    }
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_23;
  }
  v10 = v8 + 32;
  if (v8 + 32 >= a1 + 8 * v9 || v10 + 8 * v9 <= a1)
  {
    v11 = sub_100017138(0, &qword_10003DB20, HMAccessory_ptr);
    swift_arrayInitWithCopy(a1, v10, v9, v11);
    return a3;
  }
LABEL_26:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100015DD8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t i;
  void (*v15)(_QWORD *);
  id *v16;
  id v17;
  uint64_t v18;
  uint64_t result;
  void (*v20[4])(id *);

  v6 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0)
      v18 = a3;
    else
      v18 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v7 = _CocoaArrayWrapper.endIndex.getter(v18);
    swift_bridgeObjectRelease(a3);
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_25;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    if (a3 < 0)
      v12 = a3;
    else
      v12 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v13 = _CocoaArrayWrapper.endIndex.getter(v12);
    swift_bridgeObjectRelease(a3);
    if (v13 <= a2)
    {
      if (v7 >= 1)
      {
        sub_100010324(&qword_10003DBD8, &qword_10003DBD0);
        swift_bridgeObjectRetain(a3);
        for (i = 0; i != v7; ++i)
        {
          sub_10000D3B8(&qword_10003DBD0);
          v15 = sub_100016034(v20, i, a3);
          v17 = *v16;
          ((void (*)(void (**)(id *), _QWORD))v15)(v20, 0);
          *(_QWORD *)(a1 + 8 * i) = v17;
        }
        swift_bridgeObjectRelease(a3);
        return a3;
      }
      goto LABEL_24;
    }
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_23;
  }
  v10 = v8 + 32;
  if (v8 + 32 >= a1 + 8 * v9 || v10 + 8 * v9 <= a1)
  {
    v11 = type metadata accessor for SecurityIntentAccessory();
    swift_arrayInitWithCopy(a1, v10, v9, v11);
    return a3;
  }
LABEL_26:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

void (*sub_100015FDC(uint64_t (**a1)(), unint64_t a2, uint64_t a3))(_QWORD *)
{
  uint64_t (*v6)();

  v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_1000160B4(v6, a2, a3);
  return sub_100016030;
}

void (*sub_100016034(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_100016120(v6, a2, a3);
  return sub_100016030;
}

void sub_100016088(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*sub_1000160B4(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t (*v3)();
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
    return sub_10001717C;
  }
  __break(1u);
  return result;
}

void (*sub_100016120(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
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
    return sub_10001618C;
  }
  __break(1u);
  return result;
}

void sub_10001618C(id *a1)
{

}

void _s31HomeWidgetSingleAccessoryIntent9DataModelC15accessoryExists3for2inSbAA11ServiceKindO_So6HMHomeCtF_0(_QWORD *a1, id a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  v3 = objc_msgSend(a2, "accessories");
  v4 = sub_100017138(0, &qword_10003DB20, HMAccessory_ptr);
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v4);

  if (!((unint64_t)v5 >> 62))
  {
    v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v6)
      goto LABEL_3;
LABEL_12:
    swift_bridgeObjectRelease(v5);
    return;
  }
LABEL_19:
  if (v5 < 0)
    v14 = v5;
  else
    v14 = v5 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v5);
  v6 = _CocoaArrayWrapper.endIndex.getter(v14);
  swift_bridgeObjectRelease(v5);
  if (!v6)
    goto LABEL_12;
LABEL_3:
  v7 = 0;
  v8 = v5 & 0xC000000000000001;
  while (1)
  {
    if (v8)
    {
      swift_bridgeObjectRetain(v5);
      v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v7, v5);
      swift_bridgeObjectRelease(v5);
    }
    else
    {
      v9 = *(id *)(v5 + 8 * v7 + 32);
    }
    v10 = (void *)HMAccessory.subscript.getter(a1);

    if (v10)
      break;
    v11 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_19;
    }
    ++v7;
    if (v11 == v6)
      goto LABEL_12;
  }
  if (v6 == v7)
    goto LABEL_12;
  if (v8)
  {
    v12 = specialized _ArrayBuffer._getElementSlowPath(_:)(v7, v5);
    swift_unknownObjectRelease(v12);
    goto LABEL_12;
  }
  if ((v7 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v13 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRelease(v5);
    if (v7 < v13)
      return;
  }
  __break(1u);
}

void sub_10001632C(char a1)
{
  uint64_t v2;
  uint64_t v3;
  os_log_type_t v4;
  uint64_t v5;
  NSObject *oslog;
  int v7;
  int v8;
  uint64_t v9;

  if (qword_10003D5F0 != -1)
    swift_once(&qword_10003D5F0, sub_100013BA4);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_100012570(v2, (uint64_t)static DataModel.widgetLogger);
  oslog = Logger.logObject.getter(v3);
  v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v4))
  {
    v5 = swift_slowAlloc(14, -1);
    *(_DWORD *)v5 = 67109376;
    v8 = byte_10003DF98;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v8, &v9, v5 + 4, v5 + 8);
    *(_WORD *)(v5 + 8) = 1024;
    v7 = a1 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v7, &v8, v5 + 10, v5 + 14);
    _os_log_impl((void *)&_mh_execute_header, oslog, v4, "homeHasUpdatedOnce was %{BOOL}d is now %{BOOL}d", (uint8_t *)v5, 0xEu);
    swift_slowDealloc(v5, -1, -1);

  }
  else
  {

  }
}

void *sub_100016474(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v4 = v3;
  v24 = a2;
  v7 = type metadata accessor for UUID(0);
  v22 = *(_QWORD *)(v7 - 8);
  v23 = v7;
  __chkstk_darwin();
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((unint64_t)a1 >> 62)
    goto LABEL_20;
  v10 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  for (; v10; v10 = _CocoaArrayWrapper.endIndex.getter(v18))
  {
    v20 = v4;
    v21 = a1 & 0xC000000000000001;
    v11 = 4;
    while (1)
    {
      v12 = v21 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v11 - 4, a1) : *(id *)(a1 + 8 * v11);
      v13 = v12;
      v14 = v11 - 3;
      if (__OFADD__(v11 - 4, 1))
        break;
      v15 = objc_msgSend(v12, "uniqueIdentifier");
      static UUID._unconditionallyBridgeFromObjectiveC(_:)();

      v4 = UUID.uuidString.getter();
      v17 = v16;
      (*(void (**)(char *, uint64_t))(v22 + 8))(v9, v23);
      if (a3)
      {
        if (v4 == v24 && v17 == a3)
        {
          swift_bridgeObjectRelease(a1);
LABEL_18:
          swift_bridgeObjectRelease(v17);
          return v13;
        }
        v4 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v17, v24, a3, 0);
        swift_bridgeObjectRelease(v17);
        if ((v4 & 1) != 0)
        {
          v17 = a1;
          goto LABEL_18;
        }

      }
      else
      {

        swift_bridgeObjectRelease(v17);
      }
      ++v11;
      if (v14 == v10)
        goto LABEL_24;
    }
    __break(1u);
LABEL_20:
    if (a1 < 0)
      v18 = a1;
    else
      v18 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
  }
LABEL_24:
  swift_bridgeObjectRelease(a1);
  return 0;
}

_QWORD *_s31HomeWidgetSingleAccessoryIntent9DataModelC11accessories3for2inSaySo11HMAccessoryCGAA11ServiceKindO_So6HMHomeCtF_0(unsigned __int8 a1, id a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  BOOL v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned __int8 v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v32;
  char v33;
  void *v34;
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
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  id v51;

  v3 = objc_msgSend(a2, "accessories");
  v4 = sub_100017138(0, &qword_10003DB20, HMAccessory_ptr);
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v4);

  if ((unint64_t)v5 >> 62)
    goto LABEL_50;
  v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v6)
  {
    v7 = 0;
    v48 = v5;
    v49 = v5 & 0xC000000000000001;
    v45 = v5 + 32;
    v46 = v5 & 0xFFFFFFFFFFFFFF8;
    v47 = v6;
    while (1)
    {
      if (v49)
      {
        v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v7, v5);
        v9 = __OFADD__(v7, 1);
        v10 = v7 + 1;
        if (v9)
          goto LABEL_46;
      }
      else
      {
        if (v7 >= *(_QWORD *)(v46 + 16))
          goto LABEL_49;
        v8 = *(id *)(v45 + 8 * v7);
        v9 = __OFADD__(v7, 1);
        v10 = v7 + 1;
        if (v9)
        {
LABEL_46:
          __break(1u);
LABEL_47:
          __break(1u);
          goto LABEL_48;
        }
      }
      v50 = v10;
      v51 = v8;
      v11 = objc_msgSend(v8, "services");
      v12 = sub_100017138(0, (unint64_t *)&qword_10003DBE8, HMService_ptr);
      v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v11, v12);

      if ((unint64_t)v13 >> 62)
      {
        if (v13 < 0)
          v35 = v13;
        else
          v35 = v13 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v13);
        v14 = _CocoaArrayWrapper.endIndex.getter(v35);
        swift_bridgeObjectRelease(v13);
        if (!v14)
        {
LABEL_36:
          swift_bridgeObjectRelease(v13);
          v34 = v51;
          if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0)
            break;
          goto LABEL_37;
        }
      }
      else
      {
        v14 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (!v14)
          goto LABEL_36;
      }
      if (v14 < 1)
        goto LABEL_47;
      for (i = 0; i != v14; ++i)
      {
        if ((v13 & 0xC000000000000001) != 0)
          v19 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v13);
        else
          v19 = *(id *)(v13 + 8 * i + 32);
        v20 = v19;
        v21 = objc_msgSend(v19, "serviceType");
        v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
        v24 = v23;

        v25 = _s31HomeWidgetSingleAccessoryIntent11ServiceKindO8rawValueACSgSS_tcfC_0(v22, v24);
        if (v25 == 51)
          v25 = 0;
        v26 = ServiceKind.rawValue.getter(v25);
        v28 = v27;
        v29 = ServiceKind.rawValue.getter(a1);
        if (v26 == v29 && v28 == v30)
        {
          v16 = swift_bridgeObjectRelease_n(v28, 2);
LABEL_17:
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v16);
          v17 = _swiftEmptyArrayStorage[2];
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v17);
          v18 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v17, v20);
          specialized ContiguousArray._endMutation()(v18);
          continue;
        }
        v32 = v30;
        v33 = _stringCompareWithSmolCheck(_:_:expecting:)(v26, v28, v29, v30, 0);
        swift_bridgeObjectRelease(v28);
        v16 = swift_bridgeObjectRelease(v32);
        if ((v33 & 1) != 0)
          goto LABEL_17;

      }
      swift_bridgeObjectRelease(v13);
      v6 = v47;
      v5 = v48;
      v34 = v51;
      if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0)
        break;
LABEL_37:
      if (((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000) != 0)
        break;
      if (_swiftEmptyArrayStorage[2])
        goto LABEL_39;
LABEL_4:

      swift_release(_swiftEmptyArrayStorage);
LABEL_5:
      v7 = v50;
      if (v50 == v6)
        goto LABEL_54;
    }
    v40 = swift_bridgeObjectRetain(_swiftEmptyArrayStorage);
    v41 = _CocoaArrayWrapper.endIndex.getter(v40);
    swift_release(_swiftEmptyArrayStorage);
    if (!v41)
      goto LABEL_4;
LABEL_39:
    if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000001) != 0)
    {
      v42 = specialized _ArrayBuffer._getElementSlowPath(_:)(0, _swiftEmptyArrayStorage);
      swift_unknownObjectRelease(v42);
      v37 = swift_release(_swiftEmptyArrayStorage);
LABEL_41:
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v37);
      v38 = _swiftEmptyArrayStorage[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v38);
      v39 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v38, v34);
      specialized ContiguousArray._endMutation()(v39);
      goto LABEL_5;
    }
    v36 = _swiftEmptyArrayStorage[2];
    v37 = swift_release(_swiftEmptyArrayStorage);
    if (v36)
      goto LABEL_41;
LABEL_48:
    __break(1u);
LABEL_49:
    __break(1u);
LABEL_50:
    if (v5 < 0)
      v43 = v5;
    else
      v43 = v5 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v5);
    v6 = _CocoaArrayWrapper.endIndex.getter(v43);
    swift_bridgeObjectRelease(v5);
  }
LABEL_54:
  swift_bridgeObjectRelease(v5);
  return _swiftEmptyArrayStorage;
}

_QWORD *sub_100016A74(uint64_t a1, unsigned __int8 a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;

  if ((unint64_t)a1 >> 62)
    goto LABEL_11;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  for (; v4; v4 = _CocoaArrayWrapper.endIndex.getter(v10))
  {
    v5 = 4;
    while (1)
    {
      v6 = (a1 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5 - 4, a1)
         : *(id *)(a1 + 8 * v5);
      v7 = v6;
      v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1))
        break;
      v9 = _s31HomeWidgetSingleAccessoryIntent9DataModelC11accessories3for2inSaySo11HMAccessoryCGAA11ServiceKindO_So6HMHomeCtF_0(a2, v6);

      sub_10001C774((uint64_t)v9);
      ++v5;
      if (v8 == v4)
        goto LABEL_15;
    }
    __break(1u);
LABEL_11:
    if (a1 < 0)
      v10 = a1;
    else
      v10 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
  }
LABEL_15:
  swift_bridgeObjectRelease(a1);
  return _swiftEmptyArrayStorage;
}

void _s31HomeWidgetSingleAccessoryIntent9DataModelC25homeManagerDidUpdateHomesyySo06HMHomeI0CF_0(void *a1)
{
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  _QWORD *v39;
  os_log_type_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;

  if (qword_10003D5F0 != -1)
    swift_once(&qword_10003D5F0, sub_100013BA4);
  v2 = type metadata accessor for Logger(0);
  sub_100012570(v2, (uint64_t)static DataModel.widgetLogger);
  v3 = a1;
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v4, v5))
  {

LABEL_25:
    sub_10001632C(1);
    byte_10003DF98 = 1;
    return;
  }
  v40 = v5;
  v6 = swift_slowAlloc(42, -1);
  v39 = (_QWORD *)swift_slowAlloc(16, -1);
  v41 = swift_slowAlloc(64, -1);
  v43 = v41;
  *(_DWORD *)v6 = 136315906;
  v7 = objc_msgSend(v3, "currentHome");
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(v7, "name");

    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
    v12 = v11;

  }
  else
  {
    v12 = 0xE400000000000000;
    v10 = 1701736302;
  }
  v42 = (_QWORD *)sub_100013F1C(v10, v12, &v43);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v42, &v43, v6 + 4, v6 + 12);

  swift_bridgeObjectRelease(v12);
  *(_WORD *)(v6 + 12) = 2080;
  v38 = v3;
  v13 = objc_msgSend(v3, "homes");
  v14 = sub_100017138(0, (unint64_t *)&qword_10003DB18, HMHome_ptr);
  v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v13, v14);

  if (!((unint64_t)v15 >> 62))
  {
    v16 = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v16)
      goto LABEL_10;
LABEL_23:
    swift_bridgeObjectRelease(v15);
    v18 = _swiftEmptyArrayStorage;
LABEL_24:
    v29 = Array.description.getter(v18, &type metadata for String);
    v31 = v30;
    swift_bridgeObjectRelease(v18);
    v42 = (_QWORD *)sub_100013F1C(v29, v31, &v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v42, &v43, v6 + 14, v6 + 22);

    swift_bridgeObjectRelease(v31);
    *(_WORD *)(v6 + 22) = 2112;
    v32 = (void *)objc_opt_self(NSThread);
    v33 = objc_msgSend(v32, "mainThread");
    v42 = v33;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v42, &v43, v6 + 24, v6 + 32);
    *v39 = v33;
    *(_WORD *)(v6 + 32) = 2112;
    v34 = objc_msgSend(v32, "currentThread");
    v42 = v34;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v42, &v43, v6 + 34, v6 + 42);
    v39[1] = v34;
    v35 = sub_10000D3B8(&qword_10003DBB0);
    swift_arrayDestroy(v39, 2, v35);
    swift_slowDealloc(v39, -1, -1);
    swift_arrayDestroy(v41, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v41, -1, -1);
    swift_slowDealloc(v6, -1, -1);

    goto LABEL_25;
  }
  if (v15 < 0)
    v28 = v15;
  else
    v28 = v15 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v15);
  v16 = _CocoaArrayWrapper.endIndex.getter(v28);
  swift_bridgeObjectRelease(v15);
  if (!v16)
    goto LABEL_23;
LABEL_10:
  v42 = _swiftEmptyArrayStorage;
  sub_10001582C(0, v16 & ~(v16 >> 63), 0);
  if ((v16 & 0x8000000000000000) == 0)
  {
    v36 = v6;
    v37 = v4;
    v17 = 0;
    v18 = v42;
    do
    {
      if ((v15 & 0xC000000000000001) != 0)
        v19 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v17, v15);
      else
        v19 = *(id *)(v15 + 8 * v17 + 32);
      v20 = v19;
      v21 = objc_msgSend(v19, "name", v36, v37);
      v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
      v24 = v23;

      v42 = v18;
      v26 = v18[2];
      v25 = v18[3];
      if (v26 >= v25 >> 1)
      {
        sub_10001582C(v25 > 1, v26 + 1, 1);
        v18 = v42;
      }
      ++v17;
      v18[2] = v26 + 1;
      v27 = &v18[2 * v26];
      v27[4] = v22;
      v27[5] = v24;
    }
    while (v16 != v17);
    swift_bridgeObjectRelease(v15);
    v6 = v36;
    v4 = v37;
    goto LABEL_24;
  }
  __break(1u);
}

uint64_t sub_10001707C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_1000170A0(uint64_t a1)
{
  uint64_t v1;

  sub_100012F8C(a1, *(char **)(v1 + 16), "User Home Sensing preference has been updated, current home is now '%s'");
}

uint64_t sub_1000170C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000170D0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void sub_1000170D8(uint64_t a1)
{
  uint64_t v1;

  sub_100012F8C(a1, *(char **)(v1 + 16), "User Selected Home preference has been updated, current home is now '%s'");
}

uint64_t *sub_1000170F8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    v4 = swift_slowAlloc(*(_QWORD *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }
  return a2;
}

uint64_t sub_100017138(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t HMAccessory.subscript.getter(_QWORD *a1)
{
  void *v1;
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v24;
  char v25;
  uint64_t result;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;

  v3 = objc_msgSend(v1, "services");
  v4 = sub_1000176E8();
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v4);

  if ((unint64_t)v5 >> 62)
  {
    if (v5 < 0)
      v27 = v5;
    else
      v27 = v5 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v5);
    v6 = _CocoaArrayWrapper.endIndex.getter(v27);
    swift_bridgeObjectRelease(v5);
    if (v6)
      goto LABEL_3;
LABEL_25:
    result = swift_bridgeObjectRelease(v5);
    a1 = _swiftEmptyArrayStorage;
    if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0)
      goto LABEL_32;
    goto LABEL_26;
  }
  v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v6)
    goto LABEL_25;
LABEL_3:
  if (v6 < 1)
  {
    __break(1u);
    goto LABEL_36;
  }
  for (i = 0; i != v6; ++i)
  {
    if ((v5 & 0xC000000000000001) != 0)
      v11 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v5);
    else
      v11 = *(id *)(v5 + 8 * i + 32);
    v12 = v11;
    v13 = objc_msgSend(v11, "serviceType");
    v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
    v16 = v15;

    v17 = _s31HomeWidgetSingleAccessoryIntent11ServiceKindO8rawValueACSgSS_tcfC_0(v14, v16);
    if (v17 == 51)
      v17 = 0;
    v18 = ServiceKind.rawValue.getter(v17);
    v20 = v19;
    v21 = ServiceKind.rawValue.getter(a1);
    if (v18 == v21 && v20 == v22)
    {
      v8 = swift_bridgeObjectRelease_n(v20, 2);
LABEL_6:
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v8);
      v9 = _swiftEmptyArrayStorage[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v9);
      v10 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v9, v12);
      specialized ContiguousArray._endMutation()(v10);
      continue;
    }
    v24 = v22;
    v25 = _stringCompareWithSmolCheck(_:_:expecting:)(v18, v20, v21, v22, 0);
    swift_bridgeObjectRelease(v20);
    v8 = swift_bridgeObjectRelease(v24);
    if ((v25 & 1) != 0)
      goto LABEL_6;

  }
  result = swift_bridgeObjectRelease(v5);
  a1 = _swiftEmptyArrayStorage;
  if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) == 0)
  {
LABEL_26:
    if (((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000) != 0)
      goto LABEL_32;
    if (_swiftEmptyArrayStorage[2])
      goto LABEL_28;
LABEL_33:
    swift_release(_swiftEmptyArrayStorage);
    return 0;
  }
LABEL_32:
  v30 = swift_bridgeObjectRetain(_swiftEmptyArrayStorage);
  v31 = _CocoaArrayWrapper.endIndex.getter(v30);
  result = swift_release(_swiftEmptyArrayStorage);
  if (!v31)
    goto LABEL_33;
LABEL_28:
  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000001) != 0)
  {
LABEL_36:
    v28 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, a1);
LABEL_31:
    v29 = v28;
    swift_release(a1);
    return (uint64_t)v29;
  }
  if (_swiftEmptyArrayStorage[2])
  {
    v28 = (id)_swiftEmptyArrayStorage[4];
    goto LABEL_31;
  }
  __break(1u);
  return result;
}

uint64_t HMAccessory.categoryType.getter()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;

  v1 = objc_msgSend(v0, "category");
  v2 = objc_msgSend(v1, "categoryType");

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  return v3;
}

uint64_t HMAccessory.primaryServiceKind.getter()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v0 = (void *)HMAccessory.primaryHomeService.getter();
  v1 = v0;
  if (v0)
  {
    v2 = objc_msgSend(v0, "serviceType");

    v1 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
    v4 = v3;

  }
  else
  {
    v4 = 0xE000000000000000;
  }
  LODWORD(result) = _s31HomeWidgetSingleAccessoryIntent11ServiceKindO8rawValueACSgSS_tcfC_0((uint64_t)v1, v4);
  if (result == 51)
    return 0;
  else
    return result;
}

uint64_t HMAccessory.primaryHomeService.getter()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t result;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;

  v1 = objc_msgSend(v0, "services");
  v2 = sub_1000176E8();
  v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v1, v2);

  if ((unint64_t)v3 >> 62)
  {
    if (v3 < 0)
      v12 = v3;
    else
      v12 = v3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v3);
    v4 = _CocoaArrayWrapper.endIndex.getter(v12);
    swift_bridgeObjectRelease(v3);
    if (v4)
    {
LABEL_3:
      if (v4 < 1)
      {
        __break(1u);
        goto LABEL_29;
      }
      for (i = 0; i != v4; ++i)
      {
        if ((v3 & 0xC000000000000001) != 0)
          v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v3);
        else
          v8 = *(id *)(v3 + 8 * i + 32);
        v9 = v8;
        v10 = objc_msgSend(v8, "isPrimaryService");
        if ((_DWORD)v10)
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v10);
          v6 = _swiftEmptyArrayStorage[2];
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v6);
          v7 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v6, v9);
          specialized ContiguousArray._endMutation()(v7);
        }
        else
        {

        }
      }
      result = swift_bridgeObjectRelease(v3);
      v3 = (uint64_t)_swiftEmptyArrayStorage;
      if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0)
        goto LABEL_25;
      goto LABEL_19;
    }
  }
  else
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v4)
      goto LABEL_3;
  }
  result = swift_bridgeObjectRelease(v3);
  v3 = (uint64_t)_swiftEmptyArrayStorage;
  if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0)
    goto LABEL_25;
LABEL_19:
  if (((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000) != 0)
  {
LABEL_25:
    v15 = swift_bridgeObjectRetain(_swiftEmptyArrayStorage);
    v16 = _CocoaArrayWrapper.endIndex.getter(v15);
    result = swift_release(_swiftEmptyArrayStorage);
    if (!v16)
      goto LABEL_26;
    goto LABEL_21;
  }
  if (!_swiftEmptyArrayStorage[2])
  {
LABEL_26:
    swift_release(_swiftEmptyArrayStorage);
    return 0;
  }
LABEL_21:
  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000001) != 0)
  {
LABEL_29:
    v13 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v3);
    goto LABEL_24;
  }
  if (_swiftEmptyArrayStorage[2])
  {
    v13 = (id)_swiftEmptyArrayStorage[4];
LABEL_24:
    v14 = v13;
    swift_release(v3);
    return (uint64_t)v14;
  }
  __break(1u);
  return result;
}

unint64_t sub_1000176E8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003DBE8;
  if (!qword_10003DBE8)
  {
    v1 = objc_opt_self(HMService);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10003DBE8);
  }
  return result;
}

uint64_t HMCharacteristic.characteristicKind.getter()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v1 = objc_msgSend(v0, "characteristicType");
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);
  v4 = v3;

  LODWORD(result) = _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO8rawValueACSgSS_tcfC_0(v2, v4);
  if (result == 174)
    return 0;
  else
    return result;
}

uint64_t HMCharacteristic.description.getter()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  Swift::String v13;
  Swift::String v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  Swift::String v22;
  Swift::String v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  Swift::String v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unsigned __int8 v40;
  unsigned __int8 v41;
  uint64_t v42;
  _QWORD *v43;
  unint64_t v44;
  char v45;
  unint64_t v46;
  void *v47;
  Swift::String v48;
  Swift::String v49;
  id v50;
  id v51;
  uint64_t v52;
  Swift::String v53;
  void *object;
  Swift::String v55;
  id v56;
  unint64_t v57;
  Swift::String v58;
  void *v59;
  _OWORD v61[2];
  __int128 v62;

  v1 = v0;
  v2 = type metadata accessor for UUID(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (void *)0xE000000000000000;
  *(_QWORD *)&v61[0] = 0;
  *((_QWORD *)&v61[0] + 1) = 0xE000000000000000;
  _StringGuts.grow(_:)(17);
  v62 = v61[0];
  v7 = objc_msgSend(v0, "service");
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "accessory");

    if (v9)
    {
      v10 = objc_msgSend(v9, "home");

      if (v10)
      {
        v11 = objc_msgSend(v10, "name");

        v8 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
        v6 = v12;

      }
      else
      {
        v8 = 0;
        v6 = (void *)0xE000000000000000;
      }
    }
    else
    {
      v8 = 0;
    }
  }
  v13._countAndFlagsBits = (uint64_t)v8;
  v13._object = v6;
  String.append(_:)(v13);
  swift_bridgeObjectRelease(v6);
  v14._countAndFlagsBits = 58;
  v14._object = (void *)0xE100000000000000;
  String.append(_:)(v14);
  v15 = objc_msgSend(v1, "service");
  if (v15
    && (v16 = v15, v17 = objc_msgSend(v15, "accessory"), v16, v17))
  {
    v18 = objc_msgSend(v17, "name");

    v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
    v21 = v20;

  }
  else
  {
    v19 = 0;
    v21 = (void *)0xE000000000000000;
  }
  v22._countAndFlagsBits = v19;
  v22._object = v21;
  String.append(_:)(v22);
  swift_bridgeObjectRelease(v21);
  v23._countAndFlagsBits = 58;
  v23._object = (void *)0xE100000000000000;
  String.append(_:)(v23);
  v24 = objc_msgSend(v1, "service");
  if (v24)
  {
    v25 = v24;
    v26 = objc_msgSend(v24, "serviceType");
    v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(v26);
    v29 = v28;

    v30 = _s31HomeWidgetSingleAccessoryIntent11ServiceKindO8rawValueACSgSS_tcfC_0(v27, v29);
    if (v30 == 51)
      v31 = 0;
    else
      v31 = v30;
    ServiceKind.localizedDescription.getter(v31);
    v33 = v32;
  }
  else
  {
    v33 = 0xE000000000000000;
  }
  v34 = v33;
  String.append(_:)(*(Swift::String *)&v24);
  swift_bridgeObjectRelease(v33);
  v35._countAndFlagsBits = 58;
  v35._object = (void *)0xE100000000000000;
  String.append(_:)(v35);
  v36 = objc_msgSend(v1, "characteristicType");
  v37 = static String._unconditionallyBridgeFromObjectiveC(_:)(v36);
  v39 = v38;

  v40 = _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO8rawValueACSgSS_tcfC_0(v37, v39);
  if (v40 == 174)
    v41 = 0;
  else
    v41 = v40;
  if (qword_10003D5C0 != -1)
    swift_once(&qword_10003D5C0, sub_100004EA4);
  v42 = 0x6E776F6E6B6E75;
  v43 = off_10003D5C8;
  if (*((_QWORD *)off_10003D5C8 + 2) && (v44 = sub_10000A448(v41), (v45 & 1) != 0))
  {
    v46 = v43[7] + (v44 << 6);
    v42 = *(_QWORD *)(v46 + 8);
    v47 = *(void **)(v46 + 16);
    swift_bridgeObjectRetain(v47);
  }
  else
  {
    v47 = (void *)0xE700000000000000;
  }
  v48._countAndFlagsBits = v42;
  v48._object = v47;
  String.append(_:)(v48);
  swift_bridgeObjectRelease(v47);
  v49._countAndFlagsBits = 58;
  v49._object = (void *)0xE100000000000000;
  String.append(_:)(v49);
  v50 = objc_msgSend(v1, "value");
  if (v50)
  {
    v51 = v50;
    _bridgeAnyObjectToAny(_:)(v61, v50);
    swift_unknownObjectRelease(v51);
  }
  else
  {
    memset(v61, 0, sizeof(v61));
  }
  v52 = sub_10000D3B8(&qword_10003D650);
  v53._countAndFlagsBits = String.init<A>(describing:)(v61, v52);
  object = v53._object;
  String.append(_:)(v53);
  swift_bridgeObjectRelease(object);
  v55._countAndFlagsBits = 58;
  v55._object = (void *)0xE100000000000000;
  String.append(_:)(v55);
  v56 = objc_msgSend(v1, "uniqueIdentifier");
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  v57 = sub_100018738();
  v58._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v2, v57);
  v59 = v58._object;
  String.append(_:)(v58);
  swift_bridgeObjectRelease(v59);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v62;
}

uint64_t HMCharacteristic.fetchedValue()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 120) = a1;
  *(_QWORD *)(v2 + 128) = v1;
  return swift_task_switch(sub_100017C40, 0, 0);
}

uint64_t sub_100017C40()
{
  _QWORD *v0;
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0 + 2;
  v2 = (void *)v0[16];
  v0[2] = v0;
  v0[3] = sub_100017CCC;
  v3 = swift_continuation_init(v0 + 2, 1);
  v0[10] = _NSConcreteStackBlock;
  v4 = v0 + 10;
  v4[1] = 0x40000000;
  v4[2] = sub_100017E10;
  v4[3] = &unk_1000388B0;
  v4[4] = v3;
  objc_msgSend(v2, "readValueWithCompletionHandler:", v4);
  return swift_continuation_await(v1);
}

uint64_t sub_100017CCC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 48);
  *(_QWORD *)(*(_QWORD *)v0 + 136) = v1;
  if (v1)
    v2 = sub_100017D90;
  else
    v2 = sub_100017D2C;
  return swift_task_switch(v2, 0, 0);
}

uint64_t sub_100017D2C()
{
  uint64_t v0;
  id v1;
  _OWORD *v2;
  id v3;

  v1 = objc_msgSend(*(id *)(v0 + 128), "value");
  v2 = *(_OWORD **)(v0 + 120);
  if (v1)
  {
    v3 = v1;
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease(v3);
  }
  else
  {
    *v2 = 0u;
    v2[1] = 0u;
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100017D90()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  _OWORD *v3;
  id v4;

  v1 = *(_QWORD *)(v0 + 136);
  swift_willThrow();
  swift_errorRelease(v1);
  v2 = objc_msgSend(*(id *)(v0 + 128), "value");
  v3 = *(_OWORD **)(v0 + 120);
  if (v2)
  {
    v4 = v2;
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease(v4);
  }
  else
  {
    *v3 = 0u;
    v3[1] = 0u;
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100017E10(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  if (!a2)
    return swift_continuation_throwingResume(*(_QWORD *)(a1 + 32));
  v4 = sub_10000D3B8(&qword_10003DCB8);
  v5 = swift_allocError(v4, &protocol self-conformance witness table for Error, 0, 0);
  *v6 = a2;
  v7 = a2;
  return swift_continuation_throwingResumeWithError(v2, v5);
}

double HMCharacteristic.cachedValue.getter@<D0>(_OWORD *a1@<X8>)
{
  void *v1;
  id v3;
  id v4;
  double result;

  v3 = objc_msgSend(v1, "value");
  if (v3)
  {
    v4 = v3;
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease(v4);
  }
  else
  {
    result = 0.0;
    *a1 = 0u;
    a1[1] = 0u;
  }
  return result;
}

uint64_t HMCharacteristic.BOOL.getter()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc(dword_10003DC8C);
  *(_QWORD *)(v1 + 48) = v2;
  *v2 = v1;
  v2[1] = sub_100017F40;
  v2[15] = v1 + 16;
  v2[16] = v0;
  return swift_task_switch(sub_100017C40, 0, 0);
}

uint64_t sub_100017F40()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 48));
  return swift_task_switch(sub_100017F94, 0, 0);
}

uint64_t sub_100017F94()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 40))
  {
    if (swift_dynamicCast(v0 + 56, v0 + 16, (char *)&type metadata for Any + 8, &type metadata for Bool, 6))return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(unsigned __int8 *)(v0 + 56));
  }
  else
  {
    sub_10000D3F8(v0 + 16);
  }
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(2);
}

uint64_t HMCharacteristic.cachedBool.getter()
{
  void *v0;
  id v1;
  id v2;
  _OWORD v4[2];
  _BYTE v5[24];
  uint64_t v6;

  v1 = objc_msgSend(v0, "value");
  if (v1)
  {
    v2 = v1;
    _bridgeAnyObjectToAny(_:)(v4, v1);
    swift_unknownObjectRelease(v2);
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_100018780((uint64_t)v4, (uint64_t)v5);
  if (v6)
  {
    if (swift_dynamicCast(v4, v5, (char *)&type metadata for Any + 8, &type metadata for Bool, 6))
      return LOBYTE(v4[0]);
    else
      return 2;
  }
  else
  {
    sub_10000D3F8((uint64_t)v5);
    return 2;
  }
}

uint64_t HMCharacteristic.int.getter()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc(dword_10003DC8C);
  *(_QWORD *)(v1 + 56) = v2;
  *v2 = v1;
  v2[1] = sub_10001811C;
  v2[15] = v1 + 16;
  v2[16] = v0;
  return swift_task_switch(sub_100017C40, 0, 0);
}

uint64_t sub_10001811C()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 56));
  return swift_task_switch(sub_100018170, 0, 0);
}

uint64_t sub_100018170()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;

  if (*(_QWORD *)(v0 + 40))
  {
    v1 = swift_dynamicCast(v0 + 48, v0 + 16, (char *)&type metadata for Any + 8, &type metadata for Int, 6);
    if (v1)
      v2 = *(_QWORD *)(v0 + 48);
    else
      v2 = 0;
    v3 = v1 ^ 1u;
  }
  else
  {
    sub_10000D3F8(v0 + 16);
    v2 = 0;
    v3 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v3);
}

uint64_t HMCharacteristic.cachedInt.getter()
{
  void *v0;
  id v1;
  id v2;
  _OWORD v4[2];
  _BYTE v5[24];
  uint64_t v6;

  v1 = objc_msgSend(v0, "value");
  if (v1)
  {
    v2 = v1;
    _bridgeAnyObjectToAny(_:)(v4, v1);
    swift_unknownObjectRelease(v2);
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_100018780((uint64_t)v4, (uint64_t)v5);
  if (v6)
  {
    if (swift_dynamicCast(v4, v5, (char *)&type metadata for Any + 8, &type metadata for Int, 6))
      return *(_QWORD *)&v4[0];
    else
      return 0;
  }
  else
  {
    sub_10000D3F8((uint64_t)v5);
    return 0;
  }
}

uint64_t HMCharacteristic.float.getter()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc(dword_10003DC8C);
  *(_QWORD *)(v1 + 56) = v2;
  *v2 = v1;
  v2[1] = sub_100018308;
  v2[15] = v1 + 16;
  v2[16] = v0;
  return swift_task_switch(sub_100017C40, 0, 0);
}

uint64_t sub_100018308()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 56));
  return swift_task_switch(sub_10001835C, 0, 0);
}

uint64_t sub_10001835C()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;

  if (*(_QWORD *)(v0 + 40))
  {
    v1 = swift_dynamicCast(v0 + 48, v0 + 16, (char *)&type metadata for Any + 8, &type metadata for Double, 6);
    if (v1)
      v2 = *(_QWORD *)(v0 + 48);
    else
      v2 = 0;
    v3 = v1 ^ 1u;
  }
  else
  {
    sub_10000D3F8(v0 + 16);
    v2 = 0;
    v3 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v3);
}

uint64_t HMCharacteristic.cachedFloat.getter()
{
  void *v0;
  id v1;
  id v2;
  _OWORD v4[2];
  _BYTE v5[24];
  uint64_t v6;

  v1 = objc_msgSend(v0, "value");
  if (v1)
  {
    v2 = v1;
    _bridgeAnyObjectToAny(_:)(v4, v1);
    swift_unknownObjectRelease(v2);
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_100018780((uint64_t)v4, (uint64_t)v5);
  if (v6)
  {
    if (swift_dynamicCast(v4, v5, (char *)&type metadata for Any + 8, &type metadata for Double, 6))
      return *(_QWORD *)&v4[0];
    else
      return 0;
  }
  else
  {
    sub_10000D3F8((uint64_t)v5);
    return 0;
  }
}

uint64_t HMCharacteristic.data.getter()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc(dword_10003DC8C);
  *(_QWORD *)(v1 + 64) = v2;
  *v2 = v1;
  v2[1] = sub_1000184F4;
  v2[15] = v1 + 16;
  v2[16] = v0;
  return swift_task_switch(sub_100017C40, 0, 0);
}

uint64_t sub_1000184F4()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 64));
  return swift_task_switch(sub_100018548, 0, 0);
}

uint64_t sub_100018548()
{
  uint64_t v0;
  int v1;
  BOOL v2;
  uint64_t v3;
  unint64_t v4;

  if (*(_QWORD *)(v0 + 40))
  {
    v1 = swift_dynamicCast(v0 + 48, v0 + 16, (char *)&type metadata for Any + 8, &type metadata for Data, 6);
    v2 = v1 == 0;
    if (v1)
      v3 = *(_QWORD *)(v0 + 48);
    else
      v3 = 0;
    if (v2)
      v4 = 0xF000000000000000;
    else
      v4 = *(_QWORD *)(v0 + 56);
  }
  else
  {
    sub_10000D3F8(v0 + 16);
    v3 = 0;
    v4 = 0xF000000000000000;
  }
  return (*(uint64_t (**)(uint64_t, unint64_t))(v0 + 8))(v3, v4);
}

uint64_t HMCharacteristic.tlv8.getter()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc(dword_10003DC8C);
  *(_QWORD *)(v1 + 64) = v2;
  *v2 = v1;
  v2[1] = sub_100018628;
  v2[15] = v1 + 16;
  v2[16] = v0;
  return swift_task_switch(sub_100017C40, 0, 0);
}

uint64_t sub_100018628()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v3;

  v3 = *v0;
  v1 = *(_QWORD *)(v3 + 64);
  v3 = *v0;
  swift_task_dealloc(v1);
  return swift_task_switch(sub_1000187C8, 0, 0);
}

uint64_t _sSo16HMCharacteristicC31HomeWidgetSingleAccessoryIntentE10cachedTLV810Foundation4DataVSgvg_0()
{
  void *v0;
  id v1;
  id v2;
  _OWORD v4[2];
  _BYTE v5[24];
  uint64_t v6;

  v1 = objc_msgSend(v0, "value");
  if (v1)
  {
    v2 = v1;
    _bridgeAnyObjectToAny(_:)(v4, v1);
    swift_unknownObjectRelease(v2);
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_100018780((uint64_t)v4, (uint64_t)v5);
  if (v6)
  {
    if (swift_dynamicCast(v4, v5, (char *)&type metadata for Any + 8, &type metadata for Data, 6))
      return *(_QWORD *)&v4[0];
    else
      return 0;
  }
  else
  {
    sub_10000D3F8((uint64_t)v5);
    return 0;
  }
}

unint64_t sub_100018738()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003DC80;
  if (!qword_10003DC80)
  {
    v1 = type metadata accessor for UUID(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for UUID, v1);
    atomic_store(result, (unint64_t *)&qword_10003DC80);
  }
  return result;
}

uint64_t sub_100018780(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000D3B8(&qword_10003D650);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t HMService.serviceKind.getter()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v1 = objc_msgSend(v0, "serviceType");
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);
  v4 = v3;

  LODWORD(result) = _s31HomeWidgetSingleAccessoryIntent11ServiceKindO8rawValueACSgSS_tcfC_0(v2, v4);
  if (result == 51)
    return 0;
  else
    return result;
}

uint64_t HMService.associatedServiceKind.getter()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v1 = objc_msgSend(v0, "associatedServiceType");
  if (!v1)
    return 51;
  v2 = v1;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);
  v5 = v4;

  LODWORD(result) = _s31HomeWidgetSingleAccessoryIntent11ServiceKindO8rawValueACSgSS_tcfC_0(v3, v5);
  if (result == 51)
    return 0;
  else
    return result;
}

uint64_t HMService.allRelevantCharacteristicKinds.getter()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  void *v12;

  v1 = objc_msgSend(v0, "serviceType");
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);
  v4 = v3;

  v5 = _s31HomeWidgetSingleAccessoryIntent11ServiceKindO8rawValueACSgSS_tcfC_0(v2, v4);
  if (v5 == 51)
    v5 = 0;
  v6 = ServiceKind.requiredCharacteristicKinds.getter(v5);
  v7 = objc_msgSend(v0, "serviceType");
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
  v10 = v9;

  v11 = _s31HomeWidgetSingleAccessoryIntent11ServiceKindO8rawValueACSgSS_tcfC_0(v8, v10);
  if (v11 == 51)
    v11 = 0;
  v12 = ServiceKind.optionalCharacteristicKinds.getter(v11);
  return sub_10001895C((uint64_t)v12, v6);
}

uint64_t sub_10001895C(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  char v14;
  uint64_t v15;

  v2 = result;
  v3 = 0;
  v15 = a2;
  v4 = result + 56;
  v5 = 1 << *(_BYTE *)(result + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(result + 56);
  v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v11 >= v8)
      goto LABEL_23;
    v12 = *(_QWORD *)(v4 + 8 * v11);
    ++v3;
    if (!v12)
    {
      v3 = v11 + 1;
      if (v11 + 1 >= v8)
        goto LABEL_23;
      v12 = *(_QWORD *)(v4 + 8 * v3);
      if (!v12)
      {
        v3 = v11 + 2;
        if (v11 + 2 >= v8)
          goto LABEL_23;
        v12 = *(_QWORD *)(v4 + 8 * v3);
        if (!v12)
        {
          v3 = v11 + 3;
          if (v11 + 3 >= v8)
            goto LABEL_23;
          v12 = *(_QWORD *)(v4 + 8 * v3);
          if (!v12)
            break;
        }
      }
    }
LABEL_22:
    v7 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v3 << 6);
LABEL_5:
    result = sub_1000196FC(&v14, *(unsigned __int8 *)(*(_QWORD *)(v2 + 48) + v10));
  }
  v13 = v11 + 4;
  if (v13 >= v8)
  {
LABEL_23:
    swift_release(v2);
    return v15;
  }
  v12 = *(_QWORD *)(v4 + 8 * v13);
  if (v12)
  {
    v3 = v13;
    goto LABEL_22;
  }
  while (1)
  {
    v3 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v3 >= v8)
      goto LABEL_23;
    v12 = *(_QWORD *)(v4 + 8 * v3);
    ++v13;
    if (v12)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

void *HMService.subscript.getter(unsigned __int8 a1)
{
  void *v1;
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v22;
  char v23;
  uint64_t v25;

  v3 = objc_msgSend(v1, "characteristics");
  v4 = sub_10001A23C();
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v4);

  if ((unint64_t)v5 >> 62)
    goto LABEL_22;
  v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(v5);
  for (; v6; v6 = _CocoaArrayWrapper.endIndex.getter(v25))
  {
    v7 = 4;
    while (1)
    {
      v8 = (v5 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v7 - 4, v5)
         : *(id *)(v5 + 8 * v7);
      v9 = v8;
      v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1))
        break;
      v11 = objc_msgSend(v8, "characteristicType");
      v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
      v14 = v13;

      v15 = _s31HomeWidgetSingleAccessoryIntent18CharacteristicKindO8rawValueACSgSS_tcfC_0(v12, v14);
      if (v15 == 174)
        v15 = 0;
      v16 = CharacteristicKind.rawValue.getter(v15);
      v18 = v17;
      v19 = CharacteristicKind.rawValue.getter(a1);
      if (v16 == v19 && v18 == v20)
      {
        swift_bridgeObjectRelease_n(v5, 2);
LABEL_19:
        swift_bridgeObjectRelease_n(v18, 2);
        return v9;
      }
      v22 = v20;
      v23 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v18, v19, v20, 0);
      swift_bridgeObjectRelease(v18);
      swift_bridgeObjectRelease(v22);
      if ((v23 & 1) != 0)
      {
        v18 = v5;
        goto LABEL_19;
      }

      ++v7;
      if (v10 == v6)
        goto LABEL_16;
    }
    __break(1u);
LABEL_22:
    if (v5 < 0)
      v25 = v5;
    else
      v25 = v5 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v5);
  }
LABEL_16:
  swift_bridgeObjectRelease_n(v5, 2);
  return 0;
}

uint64_t HMService.fetchedValue(for:)(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v3 + 48) = a2;
  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = v2;
  return swift_task_switch(sub_100018CA4, 0, 0);
}

uint64_t sub_100018CA4()
{
  uint64_t v0;
  void *v1;
  _QWORD *v2;
  _OWORD *v4;

  v1 = HMService.subscript.getter(*(_BYTE *)(v0 + 48));
  *(_QWORD *)(v0 + 32) = v1;
  if (v1)
  {
    v2 = (_QWORD *)swift_task_alloc(dword_10003DC8C);
    *(_QWORD *)(v0 + 40) = v2;
    *v2 = v0;
    v2[1] = sub_100018D2C;
    return HMCharacteristic.fetchedValue()(*(_QWORD *)(v0 + 16));
  }
  else
  {
    v4 = *(_OWORD **)(v0 + 16);
    *v4 = 0u;
    v4[1] = 0u;
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_100018D2C()
{
  uint64_t *v0;
  void *v1;
  uint64_t v3;

  v1 = *(void **)(*v0 + 32);
  v3 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 40));

  return (*(uint64_t (**)(void))(v3 + 8))();
}

void HMService.cachedValue(for:)(unsigned __int8 a1@<W0>, _OWORD *a2@<X8>)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _OWORD v7[2];

  v3 = HMService.subscript.getter(a1);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, "value");
    if (v5)
    {
      v6 = v5;
      _bridgeAnyObjectToAny(_:)(v7, v5);
      swift_unknownObjectRelease(v6);
    }
    else
    {
      memset(v7, 0, sizeof(v7));
    }
    sub_100018780((uint64_t)v7, (uint64_t)a2);

  }
  else
  {
    *a2 = 0u;
    a2[1] = 0u;
  }
}

uint64_t HMService.BOOL(for:)(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 48) = v1;
  *(_BYTE *)(v2 + 73) = a1;
  return swift_task_switch(sub_100018E20, 0, 0);
}

uint64_t sub_100018E20()
{
  uint64_t v0;
  void *v1;
  _QWORD *v2;

  v1 = HMService.subscript.getter(*(_BYTE *)(v0 + 73));
  *(_QWORD *)(v0 + 56) = v1;
  if (v1)
  {
    v2 = (_QWORD *)swift_task_alloc(dword_10003DC8C);
    *(_QWORD *)(v0 + 64) = v2;
    *v2 = v0;
    v2[1] = sub_100018EB4;
    return HMCharacteristic.fetchedValue()(v0 + 16);
  }
  else
  {
    *(_OWORD *)(v0 + 16) = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    sub_10000D3F8(v0 + 16);
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(2);
  }
}

uint64_t sub_100018EB4()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(*(_QWORD *)v0 + 56);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 64));

  return swift_task_switch(sub_100018F0C, 0, 0);
}

uint64_t sub_100018F0C()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 40))
  {
    if (swift_dynamicCast(v0 + 72, v0 + 16, (char *)&type metadata for Any + 8, &type metadata for Bool, 6))return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(unsigned __int8 *)(v0 + 72));
  }
  else
  {
    sub_10000D3F8(v0 + 16);
  }
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(2);
}

Swift::Bool_optional __swiftcall HMService.cachedBool(for:)(HomeWidgetSingleAccessoryIntent::CharacteristicKind a1)
{
  void *v1;
  void *v2;
  id v3;
  id v4;
  _OWORD v6[2];
  __int128 v7;
  __int128 v8;

  v1 = HMService.subscript.getter(a1);
  if (!v1)
  {
    v7 = 0u;
    v8 = 0u;
LABEL_10:
    sub_10000D3F8((uint64_t)&v7);
    return (Swift::Bool_optional)2;
  }
  v2 = v1;
  v3 = objc_msgSend(v1, "value");
  if (v3)
  {
    v4 = v3;
    _bridgeAnyObjectToAny(_:)(v6, v3);
    swift_unknownObjectRelease(v4);
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_100018780((uint64_t)v6, (uint64_t)&v7);

  if (!*((_QWORD *)&v8 + 1))
    goto LABEL_10;
  if (swift_dynamicCast(v6, &v7, (char *)&type metadata for Any + 8, &type metadata for Bool, 6))
    return (Swift::Bool_optional)v6[0];
  else
    return (Swift::Bool_optional)2;
}

uint64_t HMService.int(for:)(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 56) = v1;
  *(_BYTE *)(v2 + 80) = a1;
  return swift_task_switch(sub_100019068, 0, 0);
}

uint64_t sub_100019068()
{
  uint64_t v0;
  void *v1;
  _QWORD *v2;

  v1 = HMService.subscript.getter(*(_BYTE *)(v0 + 80));
  *(_QWORD *)(v0 + 64) = v1;
  if (v1)
  {
    v2 = (_QWORD *)swift_task_alloc(dword_10003DC8C);
    *(_QWORD *)(v0 + 72) = v2;
    *v2 = v0;
    v2[1] = sub_100019100;
    return HMCharacteristic.fetchedValue()(v0 + 16);
  }
  else
  {
    *(_OWORD *)(v0 + 16) = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    sub_10000D3F8(v0 + 16);
    return (*(uint64_t (**)(_QWORD, uint64_t))(v0 + 8))(0, 1);
  }
}

uint64_t sub_100019100()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(*(_QWORD *)v0 + 64);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 72));

  return swift_task_switch(sub_100018170, 0, 0);
}

Swift::Int_optional __swiftcall HMService.cachedInt(for:)(HomeWidgetSingleAccessoryIntent::CharacteristicKind a1)
{
  void *v1;
  void *v2;
  id v3;
  id v4;
  int v5;
  Swift::Int v6;
  char v7;
  _OWORD v8[2];
  __int128 v9;
  __int128 v10;
  Swift::Int_optional result;

  v1 = HMService.subscript.getter(a1);
  if (!v1)
  {
    v9 = 0u;
    v10 = 0u;
LABEL_11:
    sub_10000D3F8((uint64_t)&v9);
    v6 = 0;
    v7 = 1;
    goto LABEL_12;
  }
  v2 = v1;
  v3 = objc_msgSend(v1, "value");
  if (v3)
  {
    v4 = v3;
    _bridgeAnyObjectToAny(_:)(v8, v3);
    swift_unknownObjectRelease(v4);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  sub_100018780((uint64_t)v8, (uint64_t)&v9);

  if (!*((_QWORD *)&v10 + 1))
    goto LABEL_11;
  v5 = swift_dynamicCast(v8, &v9, (char *)&type metadata for Any + 8, &type metadata for Int, 6);
  if (v5)
    v6 = *(_QWORD *)&v8[0];
  else
    v6 = 0;
  v7 = v5 ^ 1;
LABEL_12:
  result.value = v6;
  result.is_nil = v7;
  return result;
}

uint64_t HMService.float(for:)(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 56) = v1;
  *(_BYTE *)(v2 + 80) = a1;
  return swift_task_switch(sub_100019248, 0, 0);
}

uint64_t sub_100019248()
{
  uint64_t v0;
  void *v1;
  _QWORD *v2;

  v1 = HMService.subscript.getter(*(_BYTE *)(v0 + 80));
  *(_QWORD *)(v0 + 64) = v1;
  if (v1)
  {
    v2 = (_QWORD *)swift_task_alloc(dword_10003DC8C);
    *(_QWORD *)(v0 + 72) = v2;
    *v2 = v0;
    v2[1] = sub_1000192E0;
    return HMCharacteristic.fetchedValue()(v0 + 16);
  }
  else
  {
    *(_OWORD *)(v0 + 16) = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    sub_10000D3F8(v0 + 16);
    return (*(uint64_t (**)(_QWORD, uint64_t))(v0 + 8))(0, 1);
  }
}

uint64_t sub_1000192E0()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(*(_QWORD *)v0 + 64);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 72));

  return swift_task_switch(sub_10001835C, 0, 0);
}

Swift::Double_optional __swiftcall HMService.cachedFloat(for:)(HomeWidgetSingleAccessoryIntent::CharacteristicKind a1)
{
  void *v1;
  void *v2;
  id v3;
  id v4;
  double v5;
  char v6;
  _OWORD v7[2];
  __int128 v8;
  __int128 v9;
  Swift::Double_optional result;

  v1 = HMService.subscript.getter(a1);
  if (!v1)
  {
    v8 = 0u;
    v9 = 0u;
LABEL_11:
    sub_10000D3F8((uint64_t)&v8);
    v6 = 0;
    goto LABEL_12;
  }
  v2 = v1;
  v3 = objc_msgSend(v1, "value");
  if (v3)
  {
    v4 = v3;
    _bridgeAnyObjectToAny(_:)(v7, v3);
    swift_unknownObjectRelease(v4);
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  sub_100018780((uint64_t)v7, (uint64_t)&v8);

  if (!*((_QWORD *)&v9 + 1))
    goto LABEL_11;
  if (swift_dynamicCast(v7, &v8, (char *)&type metadata for Any + 8, &type metadata for Double, 6))
    v6 = v7[0];
  else
    v6 = 0;
LABEL_12:
  result.value = v5;
  result.is_nil = v6;
  return result;
}

uint64_t HMService.data(for:)(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 64) = v1;
  *(_BYTE *)(v2 + 88) = a1;
  return swift_task_switch(sub_100019428, 0, 0);
}

uint64_t sub_100019428()
{
  uint64_t v0;
  void *v1;
  _QWORD *v2;

  v1 = HMService.subscript.getter(*(_BYTE *)(v0 + 88));
  *(_QWORD *)(v0 + 72) = v1;
  if (v1)
  {
    v2 = (_QWORD *)swift_task_alloc(dword_10003DC8C);
    *(_QWORD *)(v0 + 80) = v2;
    *v2 = v0;
    v2[1] = sub_1000194C0;
    return HMCharacteristic.fetchedValue()(v0 + 16);
  }
  else
  {
    *(_OWORD *)(v0 + 16) = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    sub_10000D3F8(v0 + 16);
    return (*(uint64_t (**)(_QWORD, unint64_t))(v0 + 8))(0, 0xF000000000000000);
  }
}

uint64_t sub_1000194C0()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(*(_QWORD *)v0 + 72);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 80));

  return swift_task_switch(sub_100018548, 0, 0);
}

uint64_t HMService.tlv8(for:)(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 64) = v1;
  *(_BYTE *)(v2 + 88) = a1;
  return swift_task_switch(sub_100019538, 0, 0);
}

uint64_t sub_100019538()
{
  uint64_t v0;
  void *v1;
  _QWORD *v2;

  v1 = HMService.subscript.getter(*(_BYTE *)(v0 + 88));
  *(_QWORD *)(v0 + 72) = v1;
  if (v1)
  {
    v2 = (_QWORD *)swift_task_alloc(dword_10003DC8C);
    *(_QWORD *)(v0 + 80) = v2;
    *v2 = v0;
    v2[1] = sub_1000195D0;
    return HMCharacteristic.fetchedValue()(v0 + 16);
  }
  else
  {
    *(_OWORD *)(v0 + 16) = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
    sub_10000D3F8(v0 + 16);
    return (*(uint64_t (**)(_QWORD, unint64_t))(v0 + 8))(0, 0xF000000000000000);
  }
}

uint64_t sub_1000195D0()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(*(_QWORD *)v0 + 72);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 80));

  return swift_task_switch(sub_1000187C8, 0, 0);
}

uint64_t _sSo9HMServiceC31HomeWidgetSingleAccessoryIntentE10cachedTLV83for10Foundation4DataVSgAC18CharacteristicKindO_tF_0(unsigned __int8 a1)
{
  void *v1;
  void *v2;
  id v3;
  id v4;
  _OWORD v6[2];
  __int128 v7;
  __int128 v8;

  v1 = HMService.subscript.getter(a1);
  if (!v1)
  {
    v7 = 0u;
    v8 = 0u;
LABEL_11:
    sub_10000D3F8((uint64_t)&v7);
    return 0;
  }
  v2 = v1;
  v3 = objc_msgSend(v1, "value");
  if (v3)
  {
    v4 = v3;
    _bridgeAnyObjectToAny(_:)(v6, v3);
    swift_unknownObjectRelease(v4);
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_100018780((uint64_t)v6, (uint64_t)&v7);

  if (!*((_QWORD *)&v8 + 1))
    goto LABEL_11;
  if (swift_dynamicCast(v6, &v7, (char *)&type metadata for Any + 8, &type metadata for Data, 6))
    return *(_QWORD *)&v6[0];
  else
    return 0;
}

uint64_t sub_1000196FC(_BYTE *a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Swift::Int v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v19;
  char v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v27;
  char v28;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v30;
  uint64_t result;
  _QWORD v32[9];

  v3 = v2;
  v6 = *v2;
  Hasher.init(_seed:)(v32, *(_QWORD *)(*v2 + 40));
  v7 = CharacteristicKind.rawValue.getter(a2);
  v9 = v8;
  swift_bridgeObjectRetain(v6);
  String.hash(into:)(v32, v7, v9);
  swift_bridgeObjectRelease(v9);
  v10 = Hasher._finalize()();
  v11 = -1 << *(_BYTE *)(v6 + 32);
  v12 = v10 & ~v11;
  if (((*(_QWORD *)(v6 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) != 0)
  {
    v13 = CharacteristicKind.rawValue.getter(*(_BYTE *)(*(_QWORD *)(v6 + 48) + v12));
    v15 = v14;
    v16 = CharacteristicKind.rawValue.getter(a2);
    if (v13 == v16 && v15 == v17)
    {
LABEL_17:
      swift_bridgeObjectRelease(v6);
      swift_bridgeObjectRelease_n(v15, 2);
      goto LABEL_18;
    }
    v19 = v17;
    v20 = _stringCompareWithSmolCheck(_:_:expecting:)(v13, v15, v16, v17, 0);
    swift_bridgeObjectRelease(v15);
    swift_bridgeObjectRelease(v19);
    if ((v20 & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease(v6);
LABEL_18:
      result = 0;
      LOBYTE(a2) = *(_BYTE *)(*(_QWORD *)(*v3 + 48) + v12);
      goto LABEL_19;
    }
    v21 = ~v11;
    while (1)
    {
      v12 = (v12 + 1) & v21;
      if (((*(_QWORD *)(v6 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
        break;
      v22 = CharacteristicKind.rawValue.getter(*(_BYTE *)(*(_QWORD *)(v6 + 48) + v12));
      v15 = v23;
      v24 = CharacteristicKind.rawValue.getter(a2);
      if (v22 == v24 && v15 == v25)
        goto LABEL_17;
      v27 = v25;
      v28 = _stringCompareWithSmolCheck(_:_:expecting:)(v22, v15, v24, v25, 0);
      swift_bridgeObjectRelease(v15);
      swift_bridgeObjectRelease(v27);
      if ((v28 & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease(v6);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  v32[0] = *v3;
  *v3 = 0x8000000000000000;
  sub_100019BE8(a2, v12, isUniquelyReferenced_nonNull_native);
  v30 = *v3;
  *v3 = v32[0];
  swift_bridgeObjectRelease(v30);
  result = 1;
LABEL_19:
  *a1 = a2;
  return result;
}

Swift::Int sub_100019914(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  unsigned __int8 v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  _QWORD v34[9];

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_10000D3B8(&qword_10003DCF8);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1);
  v6 = v5;
  if (*(_QWORD *)(v3 + 16))
  {
    v33 = v2;
    v7 = 1 << *(_BYTE *)(v3 + 32);
    v8 = (_QWORD *)(v3 + 56);
    if (v7 < 64)
      v9 = ~(-1 << v7);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v3 + 56);
    v11 = (unint64_t)(v7 + 63) >> 6;
    v12 = v5 + 56;
    result = swift_retain(v3);
    v14 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v14 << 6);
      }
      else
      {
        v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v18 >= v11)
          goto LABEL_36;
        v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v11)
            goto LABEL_36;
          v19 = v8[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v11)
              goto LABEL_36;
            v19 = v8[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_36:
                swift_release(v3);
                v2 = v33;
                v32 = 1 << *(_BYTE *)(v3 + 32);
                if (v32 > 63)
                  bzero((void *)(v3 + 56), ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v8 = -1 << v32;
                *(_QWORD *)(v3 + 16) = 0;
                break;
              }
              v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_42;
                  if (v14 >= v11)
                    goto LABEL_36;
                  v19 = v8[v14];
                  ++v20;
                  if (v19)
                    goto LABEL_26;
                }
              }
              v14 = v20;
            }
          }
        }
LABEL_26:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = *(_BYTE *)(*(_QWORD *)(v3 + 48) + v17);
      Hasher.init(_seed:)(v34, *(_QWORD *)(v6 + 40));
      v22 = CharacteristicKind.rawValue.getter(v21);
      v24 = v23;
      String.hash(into:)(v34, v22, v23);
      swift_bridgeObjectRelease(v24);
      result = Hasher._finalize()();
      v25 = -1 << *(_BYTE *)(v6 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v12 + 8 * v27);
        }
        while (v31 == -1);
        v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_BYTE *)(*(_QWORD *)(v6 + 48) + v15) = v21;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release(v3);
  *v2 = v6;
  return result;
}

uint64_t sub_100019BE8(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t *v4;
  unsigned __int8 v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t *v16;
  unint64_t v17;
  uint64_t *v18;
  uint64_t *v20;
  char v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t *v24;
  unint64_t v25;
  uint64_t *v26;
  uint64_t *v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  _QWORD v34[9];

  v4 = v3;
  v6 = result;
  v7 = *(_QWORD *)(*v3 + 16);
  v8 = *(_QWORD *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0)
    goto LABEL_22;
  v9 = v7 + 1;
  if ((a3 & 1) != 0)
  {
    sub_100019914(v9);
  }
  else
  {
    if (v8 > v7)
    {
      result = (uint64_t)sub_100019E0C();
LABEL_22:
      v30 = *v4;
      *(_QWORD *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
      *(_BYTE *)(*(_QWORD *)(v30 + 48) + a2) = v6;
      v31 = *(_QWORD *)(v30 + 16);
      v32 = __OFADD__(v31, 1);
      v33 = v31 + 1;
      if (!v32)
      {
        *(_QWORD *)(v30 + 16) = v33;
        return result;
      }
      __break(1u);
      goto LABEL_25;
    }
    sub_100019F9C(v9);
  }
  v10 = *v3;
  Hasher.init(_seed:)(v34, *(_QWORD *)(*v3 + 40));
  v11 = CharacteristicKind.rawValue.getter(v6);
  v13 = v12;
  String.hash(into:)(v34, v11, v12);
  swift_bridgeObjectRelease(v13);
  v3 = v34;
  result = Hasher._finalize()();
  v14 = -1 << *(_BYTE *)(v10 + 32);
  a2 = result & ~v14;
  if (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
    goto LABEL_22;
  v15 = CharacteristicKind.rawValue.getter(*(_BYTE *)(*(_QWORD *)(v10 + 48) + a2));
  v3 = v16;
  v17 = CharacteristicKind.rawValue.getter(v6);
  if (v15 == v17 && v3 == v18)
  {
LABEL_25:
    swift_bridgeObjectRelease_n(v3, 2);
    goto LABEL_26;
  }
  v20 = v18;
  v21 = _stringCompareWithSmolCheck(_:_:expecting:)(v15, v3, v17, v18, 0);
  swift_bridgeObjectRelease(v3);
  result = swift_bridgeObjectRelease(v20);
  if ((v21 & 1) == 0)
  {
    v22 = ~v14;
    do
    {
      a2 = (a2 + 1) & v22;
      if (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
        goto LABEL_22;
      v23 = CharacteristicKind.rawValue.getter(*(_BYTE *)(*(_QWORD *)(v10 + 48) + a2));
      v3 = v24;
      v25 = CharacteristicKind.rawValue.getter(v6);
      if (v23 == v25 && v3 == v26)
        goto LABEL_25;
      v28 = v26;
      v29 = _stringCompareWithSmolCheck(_:_:expecting:)(v23, v3, v25, v26, 0);
      swift_bridgeObjectRelease(v3);
      result = swift_bridgeObjectRelease(v28);
    }
    while ((v29 & 1) == 0);
  }
LABEL_26:
  result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for CharacteristicKind);
  __break(1u);
  return result;
}

void *sub_100019E0C()
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
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  sub_10000D3B8(&qword_10003DCF8);
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
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_27:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

Swift::Int sub_100019F9C(uint64_t a1)
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
  int64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  unsigned __int8 v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t *v32;
  _QWORD v33[9];

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_10000D3B8(&qword_10003DCF8);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0);
  v6 = v5;
  if (!*(_QWORD *)(v3 + 16))
  {
    result = swift_release(v3);
LABEL_38:
    *v2 = v6;
    return result;
  }
  v32 = v2;
  v7 = 1 << *(_BYTE *)(v3 + 32);
  v8 = v3 + 56;
  if (v7 < 64)
    v9 = ~(-1 << v7);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v3 + 56);
  v11 = (unint64_t)(v7 + 63) >> 6;
  v12 = v5 + 56;
  result = swift_retain(v3);
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v14 << 6);
      goto LABEL_27;
    }
    v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v18 >= v11)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      v14 = v18 + 1;
      if (v18 + 1 >= v11)
        goto LABEL_36;
      v19 = *(_QWORD *)(v8 + 8 * v14);
      if (!v19)
      {
        v14 = v18 + 2;
        if (v18 + 2 >= v11)
          goto LABEL_36;
        v19 = *(_QWORD *)(v8 + 8 * v14);
        if (!v19)
          break;
      }
    }
LABEL_26:
    v10 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_27:
    v21 = *(_BYTE *)(*(_QWORD *)(v3 + 48) + v17);
    Hasher.init(_seed:)(v33, *(_QWORD *)(v6 + 40));
    v22 = CharacteristicKind.rawValue.getter(v21);
    v24 = v23;
    String.hash(into:)(v33, v22, v23);
    swift_bridgeObjectRelease(v24);
    result = Hasher._finalize()();
    v25 = -1 << *(_BYTE *)(v6 + 32);
    v26 = result & ~v25;
    v27 = v26 >> 6;
    if (((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v28 = 0;
      v29 = (unint64_t)(63 - v25) >> 6;
      do
      {
        if (++v27 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v30 = v27 == v29;
        if (v27 == v29)
          v27 = 0;
        v28 |= v30;
        v31 = *(_QWORD *)(v12 + 8 * v27);
      }
      while (v31 == -1);
      v15 = __clz(__rbit64(~v31)) + (v27 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(_BYTE *)(*(_QWORD *)(v6 + 48) + v15) = v21;
    ++*(_QWORD *)(v6 + 16);
  }
  v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_36:
    result = swift_release_n(v3, 2);
    v2 = v32;
    goto LABEL_38;
  }
  v19 = *(_QWORD *)(v8 + 8 * v20);
  if (v19)
  {
    v14 = v20;
    goto LABEL_26;
  }
  while (1)
  {
    v14 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v14 >= v11)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v14);
    ++v20;
    if (v19)
      goto LABEL_26;
  }
LABEL_40:
  __break(1u);
  return result;
}

unint64_t sub_10001A23C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003DCC0;
  if (!qword_10003DCC0)
  {
    v1 = objc_opt_self(HMCharacteristic);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10003DCC0);
  }
  return result;
}

id sub_10001A2B8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10001A2E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v1;
  return swift_task_switch(sub_10001A300, 0, 0);
}

uint64_t sub_10001A300()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  _BOOL4 v5;
  void *v6;
  uint8_t *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD *v12;
  _QWORD *v14;

  if (qword_10003D5F0 != -1)
    swift_once(&qword_10003D5F0, sub_100013BA4);
  v1 = *(void **)(v0 + 24);
  v2 = type metadata accessor for Logger(0);
  sub_100012570(v2, (uint64_t)static DataModel.widgetLogger);
  v3 = Logger.logObject.getter(v1);
  v4 = static os_log_type_t.default.getter();
  v5 = os_log_type_enabled(v3, v4);
  v6 = *(void **)(v0 + 24);
  if (v5)
  {
    v7 = (uint8_t *)swift_slowAlloc(12, -1);
    v14 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v7 = 138412290;
    *(_QWORD *)(v0 + 16) = v6;
    v8 = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v7 + 4, v7 + 12);
    *v14 = v6;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "HomeWidgets: SecurityAccessoryConfigurationIntentHandling -provideAccessoryOptionsCollection(for : %@)", v7, 0xCu);
    v9 = sub_10000D3B8(&qword_10003DBB0);
    swift_arrayDestroy(v14, 1, v9);
    swift_slowDealloc(v14, -1, -1);
    swift_slowDealloc(v7, -1, -1);
  }
  else
  {

  }
  v10 = dword_10003DDCC;
  v11 = *(id *)(v0 + 32);
  v12 = (_QWORD *)swift_task_alloc(v10);
  *(_QWORD *)(v0 + 40) = v12;
  *v12 = v0;
  v12[1] = sub_10001A4C8;
  return sub_10001D7C4(*(_QWORD *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_10001A4C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v4 = *(void **)(*v2 + 32);
  v3 = *(_QWORD *)(*v2 + 40);
  v5 = *v2;
  *(_QWORD *)(v5 + 48) = a1;
  swift_task_dealloc(v3);

  if (v1)
    return (*(uint64_t (**)(void))(v5 + 8))();
  else
    return swift_task_switch(sub_10001A540, 0, 0);
}

uint64_t sub_10001A540()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  Class isa;
  uint64_t v15;

  v1 = objc_msgSend(*(id *)(v0 + 48), "sections");
  v2 = sub_10000D3B8(&qword_10003DD98);
  v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v1, v2);

  if ((unint64_t)v3 >> 62)
  {
    if (v3 < 0)
      v15 = v3;
    else
      v15 = v3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v3);
    v4 = _CocoaArrayWrapper.endIndex.getter(v15);
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease(v3);
  if (v4)
  {
    v5 = *(id *)(v0 + 48);
  }
  else
  {
    v6 = sub_10000D3B8(&qword_10003DBC8);
    v7 = swift_allocObject(v6, 40, 7);
    v8 = v7;
    *(_OWORD *)(v7 + 16) = xmmword_100028F20;
    if (qword_10003D618 != -1)
      v7 = swift_once(&qword_10003D618, sub_10001A9A4);
    v9 = *(void **)(v0 + 48);
    v10 = (void *)qword_10003DD00;
    *(_QWORD *)(v8 + 32) = qword_10003DD00;
    specialized Array._endMutation()(v7);
    v11 = objc_allocWithZone((Class)INObjectCollection);
    type metadata accessor for SecurityIntentAccessory();
    v12 = v10;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v8);
    v5 = objc_msgSend(v11, "initWithItems:", isa);

  }
  return (*(uint64_t (**)(id))(v0 + 8))(v5);
}

uint64_t sub_10001A804(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD *v9;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = dword_10003DDC4;
  v7 = a1;
  v8 = a3;
  v9 = (_QWORD *)swift_task_alloc(v6);
  v3[5] = v9;
  *v9 = v3;
  v9[1] = sub_10001A894;
  v9[3] = v7;
  v9[4] = v8;
  return swift_task_switch(sub_10001A300, 0, 0);
}

uint64_t sub_10001A894(void *a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;

  v3 = v1;
  v5 = *(_QWORD *)(*v2 + 40);
  v7 = *(void **)(*v2 + 16);
  v6 = *(void **)(*v2 + 24);
  v8 = *v2;
  swift_task_dealloc(v5);

  v9 = *(void (***)(_QWORD, _QWORD, _QWORD))(v8 + 32);
  if (v3)
  {
    v10 = (void *)_convertErrorToNSError(_:)(v3);
    swift_errorRelease(v3);
    ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v10);

    _Block_release(v9);
  }
  else
  {
    ((void (**)(_QWORD, void *, _QWORD))v9)[2](v9, a1, 0);
    _Block_release(v9);

  }
  return (*(uint64_t (**)(void))(v8 + 8))();
}

void sub_10001A9A4(uint64_t a1)
{
  sub_10001AFC0(a1, (uint64_t (*)(_QWORD))type metadata accessor for SecurityIntentAccessory, &qword_10003DD00);
}

uint64_t sub_10001A9B8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v1;
  return swift_task_switch(sub_10001A9D0, 0, 0);
}

uint64_t sub_10001A9D0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  _BOOL4 v5;
  void *v6;
  uint8_t *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD *v12;
  _QWORD *v14;

  if (qword_10003D5F0 != -1)
    swift_once(&qword_10003D5F0, sub_100013BA4);
  v1 = *(void **)(v0 + 24);
  v2 = type metadata accessor for Logger(0);
  sub_100012570(v2, (uint64_t)static DataModel.widgetLogger);
  v3 = Logger.logObject.getter(v1);
  v4 = static os_log_type_t.default.getter();
  v5 = os_log_type_enabled(v3, v4);
  v6 = *(void **)(v0 + 24);
  if (v5)
  {
    v7 = (uint8_t *)swift_slowAlloc(12, -1);
    v14 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v7 = 138412290;
    *(_QWORD *)(v0 + 16) = v6;
    v8 = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v7 + 4, v7 + 12);
    *v14 = v6;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "HomeWidgets: ClimateSensorTypeConfigurationIntentHandling -provideClimateTypeOptionsCollection(for : %@)", v7, 0xCu);
    v9 = sub_10000D3B8(&qword_10003DBB0);
    swift_arrayDestroy(v14, 1, v9);
    swift_slowDealloc(v14, -1, -1);
    swift_slowDealloc(v7, -1, -1);
  }
  else
  {

  }
  v10 = dword_10003DD94;
  v11 = *(id *)(v0 + 32);
  v12 = (_QWORD *)swift_task_alloc(v10);
  *(_QWORD *)(v0 + 40) = v12;
  *v12 = v0;
  v12[1] = sub_10001AB98;
  return sub_10001DDF4(*(_QWORD *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_10001AB98(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v4 = *(void **)(*v2 + 32);
  v3 = *(_QWORD *)(*v2 + 40);
  v5 = *v2;
  *(_QWORD *)(v5 + 48) = a1;
  swift_task_dealloc(v3);

  if (v1)
    return (*(uint64_t (**)(void))(v5 + 8))();
  else
    return swift_task_switch(sub_10001AC10, 0, 0);
}

uint64_t sub_10001AC10()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  Class isa;
  uint64_t v15;

  v1 = objc_msgSend(*(id *)(v0 + 48), "sections");
  v2 = sub_10000D3B8(&qword_10003DD98);
  v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v1, v2);

  if ((unint64_t)v3 >> 62)
  {
    if (v3 < 0)
      v15 = v3;
    else
      v15 = v3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v3);
    v4 = _CocoaArrayWrapper.endIndex.getter(v15);
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease(v3);
  if (v4)
  {
    v5 = *(id *)(v0 + 48);
  }
  else
  {
    v6 = sub_10000D3B8(&qword_10003DBC8);
    v7 = swift_allocObject(v6, 40, 7);
    v8 = v7;
    *(_OWORD *)(v7 + 16) = xmmword_100028F20;
    if (qword_10003D620 != -1)
      v7 = swift_once(&qword_10003D620, sub_10001AFAC);
    v9 = *(void **)(v0 + 48);
    v10 = (void *)qword_10003DD08;
    *(_QWORD *)(v8 + 32) = qword_10003DD08;
    specialized Array._endMutation()(v7);
    v11 = objc_allocWithZone((Class)INObjectCollection);
    type metadata accessor for ClimateSensorIntentType();
    v12 = v10;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v8);
    v5 = objc_msgSend(v11, "initWithItems:", isa);

  }
  return (*(uint64_t (**)(id))(v0 + 8))(v5);
}

uint64_t sub_10001AED4(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD *v9;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = dword_10003DD8C;
  v7 = a1;
  v8 = a3;
  v9 = (_QWORD *)swift_task_alloc(v6);
  v3[5] = v9;
  *v9 = v3;
  v9[1] = sub_10001F8D4;
  v9[3] = v7;
  v9[4] = v8;
  return swift_task_switch(sub_10001A9D0, 0, 0);
}

void sub_10001AFAC(uint64_t a1)
{
  sub_10001AFC0(a1, (uint64_t (*)(_QWORD))type metadata accessor for ClimateSensorIntentType, &qword_10003DD08);
}

void sub_10001AFC0(uint64_t a1, uint64_t (*a2)(_QWORD), _QWORD *a3)
{
  uint64_t v4;
  id v5;
  NSString v6;
  NSString v7;
  id v8;

  v4 = a2(0);
  v5 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v4));
  v6 = String._bridgeToObjectiveC()();
  v7 = String._bridgeToObjectiveC()();
  v8 = objc_msgSend(v5, "initWithIdentifier:displayString:", v6, v7);

  *a3 = v8;
}

uint64_t sub_10001B050@<X0>(_QWORD **a1@<X1>, char *a2@<X0>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD **v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t result;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  uint64_t v22;
  _QWORD *v23;

  v4 = v3;
  v7 = *a2;
  if (qword_10003D5E0 != -1)
    goto LABEL_14;
  while (1)
  {
    v8 = (uint64_t)_s31HomeWidgetSingleAccessoryIntent9DataModelC11accessories3for2inSaySo11HMAccessoryCGAA11ServiceKindO_So6HMHomeCtF_0(v7, a1);
    v9 = v8;
    if ((unint64_t)v8 >> 62)
      break;
    v10 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v10)
      goto LABEL_19;
LABEL_4:
    v23 = _swiftEmptyArrayStorage;
    a1 = &v23;
    specialized ContiguousArray.reserveCapacity(_:)(v10);
    if (v10 < 0)
    {
      __break(1u);
LABEL_22:

      result = swift_release(v23);
      __break(1u);
      return result;
    }
    v20 = a3;
    v11 = 0;
    a3 = (_QWORD *)(v9 & 0xC000000000000001);
    while (v10 != v11)
    {
      if (a3)
        v12 = (_QWORD **)specialized _ArrayBuffer._getElementSlowPath(_:)(v11, v9);
      else
        v12 = (_QWORD **)*(id *)(v9 + 8 * v11 + 32);
      a1 = v12;
      v21 = v12;
      sub_10001B218(&v21, v7, &v22);
      if (v4)
        goto LABEL_22;
      v4 = 0;
      ++v11;

      v13 = v22;
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v14);
      v15 = v23[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v15);
      v16 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v15, v13);
      a1 = &v23;
      specialized ContiguousArray._endMutation()(v16);
      if (v10 == v11)
      {
        v17 = v23;
        result = swift_bridgeObjectRelease(v9);
        a3 = v20;
        goto LABEL_20;
      }
    }
    __break(1u);
LABEL_14:
    swift_once(&qword_10003D5E0, sub_1000128F0);
  }
  if (v8 < 0)
    v19 = v8;
  else
    v19 = v8 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v8);
  v10 = _CocoaArrayWrapper.endIndex.getter(v19);
  swift_bridgeObjectRelease(v9);
  if (v10)
    goto LABEL_4;
LABEL_19:
  result = swift_bridgeObjectRelease(v9);
  v17 = _swiftEmptyArrayStorage;
LABEL_20:
  *a3 = v17;
  return result;
}

void sub_10001B218(void **a1@<X0>, char a2@<W1>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  NSString v18;
  NSString v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  NSString v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSString v31;
  id v32;
  uint64_t v33;
  _QWORD *v34;

  v34 = a3;
  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *a1;
  v10 = type metadata accessor for SecurityIntentAccessory();
  v11 = objc_msgSend(v9, "uniqueIdentifier");
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  UUID.uuidString.getter();
  v13 = v12;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v14 = objc_msgSend(v9, "name");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
  v16 = v15;

  v17 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v10));
  v18 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v13);
  v19 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v16);
  v20 = objc_msgSend(v17, "initWithIdentifier:displayString:", v18, v19);

  ServiceKind.rawValue.getter(a2);
  v22 = v21;
  v23 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v22);
  objc_msgSend(v20, "setServiceType:", v23);

  v24 = v20;
  v25 = objc_msgSend(v9, "room");
  if (v25)
  {
    v26 = v25;
    v27 = objc_msgSend(v25, "name");

    static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
    v29 = v28;

  }
  else
  {
    sub_10001C93C(a2);
    if (!v30)
    {
      v31 = 0;
      goto LABEL_6;
    }
    v29 = v30;
  }
  v31 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v29);
LABEL_6:
  objc_msgSend(v24, "setSubtitleString:", v31);

  v32 = sub_10001D144(a2);
  objc_msgSend(v24, "setDisplayImage:", v32);

  *v34 = v24;
}

uint64_t static SecurityIntentAccessory.== infix(_:_:)(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;

  v3 = objc_msgSend(a1, "identifier");
  if (v3)
  {
    v4 = v3;
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = objc_msgSend(a2, "identifier");
  if (v8)
  {
    v9 = v8;
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
    v12 = v11;

    if (v7)
    {
      if (v12)
      {
        if (v5 == v10 && v7 == v12)
        {
          swift_bridgeObjectRelease(v7);
          v14 = 1;
        }
        else
        {
          v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v5, v7, v10, v12, 0);
          swift_bridgeObjectRelease(v7);
        }
        goto LABEL_18;
      }
      goto LABEL_13;
    }
    if (v12)
    {
      v14 = 0;
      goto LABEL_18;
    }
  }
  else if (v7)
  {
LABEL_13:
    v14 = 0;
    v12 = v7;
LABEL_18:
    swift_bridgeObjectRelease(v12);
    return v14 & 1;
  }
  v14 = 1;
  return v14 & 1;
}

uint64_t sub_10001B5A0(void **a1, void **a2)
{
  return _s31HomeWidgetSingleAccessoryIntent08SecurityeD0C1loiySbAC_ACtFZ_0(*a1, *a2);
}

uint64_t sub_10001B5B8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc(a3[1]);
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_10001F8D0;
  return v6();
}

uint64_t sub_10001B60C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc(a4[1]);
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_10001F8D0;
  return v7();
}

uint64_t sub_10001B660(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD v19[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_10001F6DC(a1);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      v10 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }
  else
  {
    v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v15 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
      goto LABEL_3;
  }
  v12 = 0;
  v14 = 0;
LABEL_6:
  v16 = swift_allocObject(&unk_100038950, 32, 7);
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0;
    v19[1] = 0;
    v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }
  else
  {
    v17 = 0;
  }
  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_10003DD80, v16);
}

uint64_t sub_10001B7A4(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_10001B808;
  return v6(a1);
}

uint64_t sub_10001B808()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10001B854(uint64_t *a1)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7[2];

  v2 = *a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*a1);
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v2 = sub_100024274(v2);
    *a1 = v2;
  }
  v4 = *(_QWORD *)(v2 + 16);
  v7[0] = v2 + 32;
  v7[1] = v4;
  sub_10001B8CC(v7);
  return specialized ContiguousArray._endMutation()(v5);
}

void sub_10001B8CC(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  Swift::Int v7;
  Swift::Int v8;
  uint64_t v9;
  Swift::Int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  Swift::Int v15;
  uint64_t v16;
  unint64_t v17;
  Swift::Int v18;
  void *v19;
  id v20;
  id v21;
  int v22;
  id *v23;
  void *v24;
  id v25;
  id v26;
  int v27;
  uint64_t *v28;
  Swift::Int v29;
  Swift::Int v30;
  uint64_t *v31;
  uint64_t v32;
  Swift::Int v33;
  uint64_t v34;
  Swift::Int v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  unint64_t v46;
  const char *v47;
  char *v48;
  uint64_t v49;
  char *v50;
  unint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  id v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  unint64_t v64;
  char *v65;
  unint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  char v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char v81;
  void *v82;
  unint64_t v83;
  unint64_t v84;
  char *v85;
  char *v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  BOOL v98;
  unint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  BOOL v108;
  uint64_t v109;
  char v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  BOOL v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  char *v127;
  uint64_t v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t v132;
  char *v133;
  uint64_t v134;
  unint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  char *v139;
  unint64_t v140;
  uint64_t v141;
  uint64_t v142;
  char *v143;
  uint64_t *v144;
  uint64_t v145;
  uint64_t v146;
  Swift::Int v147;
  Swift::Int v148;
  Swift::Int v149;
  Swift::Int v150;
  uint64_t v151;
  char *v152;
  unint64_t v153;
  const char *v154;
  unint64_t v155;
  const char *v156;
  unint64_t v157;
  unint64_t v158;
  unint64_t v159;
  uint64_t v160;
  Swift::Int v161;
  uint64_t v162;
  unint64_t v163;
  char *v164;
  char *v165;
  uint64_t v166;

  v3 = type metadata accessor for Locale(0);
  __chkstk_darwin(v3);
  v165 = (char *)&v142 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v5);
  v164 = (char *)&v142 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[1];
  v8 = _minimumMergeRunLength(_:)(v7);
  if (v8 >= v7)
  {
    if (v7 < 0)
      goto LABEL_163;
    if (v7)
      sub_10001C3E4(0, v7, 1, a1);
    return;
  }
  if (v7 >= 0)
    v9 = v7;
  else
    v9 = v7 + 1;
  if (v7 < -1)
    goto LABEL_171;
  v10 = v8;
  v160 = v1;
  v144 = a1;
  if (v7 < 2)
  {
    v14 = (char *)_swiftEmptyArrayStorage;
    v166 = (uint64_t)_swiftEmptyArrayStorage;
    v152 = (char *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v7 != 1)
    {
      v17 = _swiftEmptyArrayStorage[2];
LABEL_129:
      if (v17 >= 2)
      {
        v134 = *v144;
        do
        {
          v135 = v17 - 2;
          if (v17 < 2)
            goto LABEL_158;
          if (!v134)
            goto LABEL_170;
          v136 = *(_QWORD *)&v14[16 * v135 + 32];
          v137 = *(_QWORD *)&v14[16 * v17 + 24];
          v138 = v160;
          sub_10001C4B4((id *)(v134 + 8 * v136), (id *)(v134 + 8 * *(_QWORD *)&v14[16 * v17 + 16]), v134 + 8 * v137, v152);
          v160 = v138;
          if (v138)
            break;
          if (v137 < v136)
            goto LABEL_159;
          if ((swift_isUniquelyReferenced_nonNull_native(v14) & 1) == 0)
            v14 = sub_100024224((uint64_t)v14);
          if (v135 >= *((_QWORD *)v14 + 2))
            goto LABEL_160;
          v139 = &v14[16 * v135 + 32];
          *(_QWORD *)v139 = v136;
          *((_QWORD *)v139 + 1) = v137;
          v140 = *((_QWORD *)v14 + 2);
          if (v17 > v140)
            goto LABEL_161;
          memmove(&v14[16 * v17 + 16], &v14[16 * v17 + 32], 16 * (v140 - v17));
          *((_QWORD *)v14 + 2) = v140 - 1;
          v17 = v140 - 1;
        }
        while (v140 > 2);
      }
LABEL_140:
      v141 = swift_bridgeObjectRelease(v14);
      *(_QWORD *)((v166 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
      specialized Array._endMutation()(v141);
      swift_bridgeObjectRelease(v166);
      return;
    }
  }
  else
  {
    v11 = v9 >> 1;
    v12 = type metadata accessor for SecurityIntentAccessory();
    v13 = static Array._allocateBufferUninitialized(minimumCapacity:)(v11, v12);
    *(_QWORD *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10) = v11;
    v152 = (char *)((v13 & 0xFFFFFFFFFFFFFF8) + 32);
    v166 = v13;
  }
  v15 = 0;
  v16 = *a1;
  v146 = *a1 + 16;
  v147 = v10;
  v145 = v16 - 8;
  v14 = (char *)_swiftEmptyArrayStorage;
  v159 = (unint64_t)"door.garage.closed";
  v162 = v16;
  v163 = (unint64_t)"ategoryCapitalized";
  v157 = 0x800000010002CB10;
  v158 = 0x800000010002CAE0;
  v156 = "HFUserFriendlyNameLocalizable";
  v154 = "DoorLock_CategoryCapitalized";
  v155 = 0x800000010002CB30;
  v153 = 0x800000010002CB50;
  v150 = v7;
LABEL_15:
  v18 = v15 + 1;
  v149 = v15;
  if (v15 + 1 < v7)
  {
    v19 = *(void **)(v16 + 8 * v15);
    v20 = *(id *)(v16 + 8 * v18);
    v21 = v19;
    v22 = _s31HomeWidgetSingleAccessoryIntent08SecurityeD0C1loiySbAC_ACtFZ_0(v20, v21);

    v18 = v15 + 2;
    if (v15 + 2 < v7)
    {
      v23 = (id *)(v146 + 8 * v15);
      while (1)
      {
        v24 = *(v23 - 1);
        v25 = *v23;
        v26 = v24;
        v27 = _s31HomeWidgetSingleAccessoryIntent08SecurityeD0C1loiySbAC_ACtFZ_0(v25, v26);

        if (((v22 ^ v27) & 1) != 0)
          break;
        ++v18;
        ++v23;
        if (v7 == v18)
        {
          v18 = v7;
          break;
        }
      }
      v15 = v149;
    }
    v16 = v162;
    if ((v22 & 1) != 0)
    {
      if (v18 < v15)
        goto LABEL_164;
      if (v15 < v18)
      {
        v28 = (uint64_t *)(v145 + 8 * v18);
        v29 = v18;
        v30 = v15;
        v31 = (uint64_t *)(v162 + 8 * v15);
        do
        {
          if (v30 != --v29)
          {
            if (!v16)
              goto LABEL_169;
            v32 = *v31;
            *v31 = *v28;
            *v28 = v32;
          }
          ++v30;
          --v28;
          ++v31;
        }
        while (v30 < v29);
      }
    }
  }
  if (v18 >= v7)
    goto LABEL_81;
  if (__OFSUB__(v18, v15))
    goto LABEL_162;
  if (v18 - v15 >= v147)
    goto LABEL_81;
  if (__OFADD__(v15, v147))
    goto LABEL_165;
  if (v15 + v147 >= v7)
    v33 = v7;
  else
    v33 = v15 + v147;
  if (v33 >= v15)
  {
    if (v18 == v33)
      goto LABEL_81;
    v143 = v14;
    v34 = v145 + 8 * v18;
    v148 = v33;
LABEL_43:
    v36 = *(void **)(v16 + 8 * v18);
    v151 = v34;
    v161 = v18;
    while (1)
    {
      v37 = *(void **)v34;
      v38 = v36;
      v39 = v37;
      v40 = objc_msgSend(v38, "serviceType");
      if (v40)
      {
        v41 = v40;
        v42 = static String._unconditionallyBridgeFromObjectiveC(_:)(v40);
        v44 = v43;

      }
      else
      {
        v42 = 0;
        v44 = 0xE000000000000000;
      }
      v45 = _s31HomeWidgetSingleAccessoryIntent11ServiceKindO8rawValueACSgSS_tcfC_0(v42, v44);
      if (v45 == 35)
        break;
      if (v45 == 30)
      {
        v46 = 0xD00000000000001CLL;
        v47 = v156;
LABEL_52:
        v48 = v164;
        v49 = String.LocalizationValue.init(stringLiteral:)(v46, (unint64_t)v47 | 0x8000000000000000);
        v50 = v165;
        static Locale.current.getter(v49);
        v51 = v163 | 0x8000000000000000;
        v52 = v48;
LABEL_54:
        v55 = String.init(localized:table:bundle:locale:comment:)(v52, 0xD00000000000001DLL, v51, 0, v50, 0, 0, 256);
        v57 = v56;
        goto LABEL_56;
      }
      if (v45 == 19)
      {
        v46 = 0xD000000000000024;
        v47 = v154;
        goto LABEL_52;
      }
      v55 = 0;
      v57 = 0xE000000000000000;
LABEL_56:
      v58 = objc_msgSend(v39, "serviceType");
      if (v58)
      {
        v59 = v58;
        v60 = static String._unconditionallyBridgeFromObjectiveC(_:)(v58);
        v62 = v61;

      }
      else
      {
        v60 = 0;
        v62 = 0xE000000000000000;
      }
      v63 = _s31HomeWidgetSingleAccessoryIntent11ServiceKindO8rawValueACSgSS_tcfC_0(v60, v62);
      switch(v63)
      {
        case 35:
          v64 = 0xD000000000000022;
          v66 = v159 | 0x8000000000000000;
          v65 = v164;
          break;
        case 30:
          v64 = 0xD00000000000001CLL;
          v65 = v164;
          v66 = v155;
          break;
        case 19:
          v64 = 0xD000000000000024;
          v65 = v164;
          v66 = v153;
          break;
        default:
          v69 = 0;
          v71 = 0xE000000000000000;
          if (v55)
            goto LABEL_70;
          goto LABEL_68;
      }
      v67 = String.LocalizationValue.init(stringLiteral:)(v64, v66);
      v68 = v165;
      static Locale.current.getter(v67);
      v69 = String.init(localized:table:bundle:locale:comment:)(v65, 0xD00000000000001DLL, v163 | 0x8000000000000000, 0, v68, 0, 0, 256);
      v71 = v70;
      if (v55 != v69)
        goto LABEL_70;
LABEL_68:
      if (v57 == v71)
      {
        swift_bridgeObjectRelease_n(v57, 2);
        goto LABEL_73;
      }
LABEL_70:
      if ((_stringCompareWithSmolCheck(_:_:expecting:)(v55, v57, v69, v71, 1) & 1) != 0)
      {

        swift_bridgeObjectRelease(v71);
        swift_bridgeObjectRelease(v57);
        goto LABEL_76;
      }
      v72 = _stringCompareWithSmolCheck(_:_:expecting:)(v55, v57, v69, v71, 0);
      swift_bridgeObjectRelease(v71);
      swift_bridgeObjectRelease(v57);
      if ((v72 & 1) == 0)
      {

LABEL_41:
        v35 = v161;
        v16 = v162;
LABEL_42:
        v18 = v35 + 1;
        v34 = v151 + 8;
        v15 = v149;
        if (v18 != v148)
          goto LABEL_43;
        v18 = v148;
        v14 = v143;
        v7 = v150;
LABEL_81:
        if (v18 < v15)
          goto LABEL_157;
        if ((swift_isUniquelyReferenced_nonNull_native(v14) & 1) == 0)
          v14 = sub_100024080(0, *((_QWORD *)v14 + 2) + 1, 1, v14);
        v84 = *((_QWORD *)v14 + 2);
        v83 = *((_QWORD *)v14 + 3);
        v17 = v84 + 1;
        v16 = v162;
        if (v84 >= v83 >> 1)
        {
          v133 = sub_100024080((char *)(v83 > 1), v84 + 1, 1, v14);
          v16 = v162;
          v14 = v133;
        }
        *((_QWORD *)v14 + 2) = v17;
        v85 = v14 + 32;
        v86 = &v14[16 * v84 + 32];
        *(_QWORD *)v86 = v15;
        *((_QWORD *)v86 + 1) = v18;
        if (v84)
        {
          while (2)
          {
            v87 = v17 - 1;
            if (v17 >= 4)
            {
              v92 = &v85[16 * v17];
              v93 = *((_QWORD *)v92 - 8);
              v94 = *((_QWORD *)v92 - 7);
              v98 = __OFSUB__(v94, v93);
              v95 = v94 - v93;
              if (v98)
                goto LABEL_146;
              v97 = *((_QWORD *)v92 - 6);
              v96 = *((_QWORD *)v92 - 5);
              v98 = __OFSUB__(v96, v97);
              v90 = v96 - v97;
              v91 = v98;
              if (v98)
                goto LABEL_147;
              v99 = v17 - 2;
              v100 = &v85[16 * v17 - 32];
              v102 = *(_QWORD *)v100;
              v101 = *((_QWORD *)v100 + 1);
              v98 = __OFSUB__(v101, v102);
              v103 = v101 - v102;
              if (v98)
                goto LABEL_149;
              v98 = __OFADD__(v90, v103);
              v104 = v90 + v103;
              if (v98)
                goto LABEL_152;
              if (v104 >= v95)
              {
                v122 = &v85[16 * v87];
                v124 = *(_QWORD *)v122;
                v123 = *((_QWORD *)v122 + 1);
                v98 = __OFSUB__(v123, v124);
                v125 = v123 - v124;
                if (v98)
                  goto LABEL_156;
                v115 = v90 < v125;
              }
              else
              {
LABEL_100:
                if ((v91 & 1) != 0)
                  goto LABEL_148;
                v99 = v17 - 2;
                v105 = &v85[16 * v17 - 32];
                v107 = *(_QWORD *)v105;
                v106 = *((_QWORD *)v105 + 1);
                v108 = __OFSUB__(v106, v107);
                v109 = v106 - v107;
                v110 = v108;
                if (v108)
                  goto LABEL_151;
                v111 = &v85[16 * v87];
                v113 = *(_QWORD *)v111;
                v112 = *((_QWORD *)v111 + 1);
                v98 = __OFSUB__(v112, v113);
                v114 = v112 - v113;
                if (v98)
                  goto LABEL_154;
                if (__OFADD__(v109, v114))
                  goto LABEL_155;
                if (v109 + v114 < v90)
                  goto LABEL_112;
                v115 = v90 < v114;
              }
              if (v115)
                v87 = v99;
            }
            else
            {
              if (v17 == 3)
              {
                v89 = *((_QWORD *)v14 + 4);
                v88 = *((_QWORD *)v14 + 5);
                v98 = __OFSUB__(v88, v89);
                v90 = v88 - v89;
                v91 = v98;
                goto LABEL_100;
              }
              v116 = *((_QWORD *)v14 + 4);
              v117 = *((_QWORD *)v14 + 5);
              v98 = __OFSUB__(v117, v116);
              v109 = v117 - v116;
              v110 = v98;
LABEL_112:
              if ((v110 & 1) != 0)
                goto LABEL_150;
              v118 = &v85[16 * v87];
              v120 = *(_QWORD *)v118;
              v119 = *((_QWORD *)v118 + 1);
              v98 = __OFSUB__(v119, v120);
              v121 = v119 - v120;
              if (v98)
                goto LABEL_153;
              if (v121 < v109)
                goto LABEL_14;
            }
            v126 = v87 - 1;
            if (v87 - 1 >= v17)
            {
              __break(1u);
LABEL_143:
              __break(1u);
LABEL_144:
              __break(1u);
LABEL_145:
              __break(1u);
LABEL_146:
              __break(1u);
LABEL_147:
              __break(1u);
LABEL_148:
              __break(1u);
LABEL_149:
              __break(1u);
LABEL_150:
              __break(1u);
LABEL_151:
              __break(1u);
LABEL_152:
              __break(1u);
LABEL_153:
              __break(1u);
LABEL_154:
              __break(1u);
LABEL_155:
              __break(1u);
LABEL_156:
              __break(1u);
LABEL_157:
              __break(1u);
LABEL_158:
              __break(1u);
LABEL_159:
              __break(1u);
LABEL_160:
              __break(1u);
LABEL_161:
              __break(1u);
LABEL_162:
              __break(1u);
LABEL_163:
              __break(1u);
LABEL_164:
              __break(1u);
LABEL_165:
              __break(1u);
              goto LABEL_166;
            }
            if (!v16)
              goto LABEL_168;
            v127 = &v85[16 * v126];
            v128 = *(_QWORD *)v127;
            v129 = &v85[16 * v87];
            v130 = *((_QWORD *)v129 + 1);
            v131 = v160;
            sub_10001C4B4((id *)(v16 + 8 * *(_QWORD *)v127), (id *)(v16 + 8 * *(_QWORD *)v129), v16 + 8 * v130, v152);
            v160 = v131;
            if (v131)
              goto LABEL_140;
            if (v130 < v128)
              goto LABEL_143;
            if (v87 > *((_QWORD *)v14 + 2))
              goto LABEL_144;
            *(_QWORD *)v127 = v128;
            *(_QWORD *)&v85[16 * v126 + 8] = v130;
            v132 = *((_QWORD *)v14 + 2);
            if (v87 >= v132)
              goto LABEL_145;
            v17 = v132 - 1;
            memmove(&v85[16 * v87], v129 + 16, 16 * (v132 - 1 - v87));
            *((_QWORD *)v14 + 2) = v132 - 1;
            v7 = v150;
            v16 = v162;
            if (v132 <= 2)
              goto LABEL_14;
            continue;
          }
        }
        v17 = 1;
LABEL_14:
        v15 = v18;
        if (v18 >= v7)
          goto LABEL_129;
        goto LABEL_15;
      }
LABEL_73:
      v73 = objc_msgSend(v38, "displayString");
      v74 = static String._unconditionallyBridgeFromObjectiveC(_:)(v73);
      v76 = v75;

      v77 = objc_msgSend(v39, "displayString");
      v78 = static String._unconditionallyBridgeFromObjectiveC(_:)(v77);
      v80 = v79;

      if (v74 == v78 && v76 == v80)
      {

        swift_bridgeObjectRelease_n(v76, 2);
        goto LABEL_41;
      }
      v81 = _stringCompareWithSmolCheck(_:_:expecting:)(v74, v76, v78, v80, 1);

      swift_bridgeObjectRelease(v76);
      swift_bridgeObjectRelease(v80);
      if ((v81 & 1) == 0)
        goto LABEL_41;
LABEL_76:
      v35 = v161;
      v16 = v162;
      if (!v162)
        goto LABEL_167;
      v82 = *(void **)v34;
      v36 = *(void **)(v34 + 8);
      *(_QWORD *)v34 = v36;
      *(_QWORD *)(v34 + 8) = v82;
      v34 -= 8;
      if (v35 == ++v15)
        goto LABEL_42;
    }
    v53 = v164;
    v54 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000022, v158);
    v50 = v165;
    static Locale.current.getter(v54);
    v52 = v53;
    v51 = v157;
    goto LABEL_54;
  }
LABEL_166:
  __break(1u);
LABEL_167:
  __break(1u);
LABEL_168:
  __break(1u);
LABEL_169:
  __break(1u);
LABEL_170:
  __break(1u);
LABEL_171:
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Can't construct Array with count < 0", 36, 2, "Swift/Array.swift", 17);
  __break(1u);
}

void sub_10001C3E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  char v14;
  void *v15;

  if (a3 != a2)
  {
    v4 = a3;
    v6 = *a4;
    v7 = *a4 + 8 * a3 - 8;
LABEL_5:
    v8 = *(void **)(v6 + 8 * v4);
    v9 = a1;
    v10 = v7;
    while (1)
    {
      v11 = *(void **)v10;
      v12 = v8;
      v13 = v11;
      v14 = _s31HomeWidgetSingleAccessoryIntent08SecurityeD0C1loiySbAC_ACtFZ_0(v12, v13);

      if ((v14 & 1) == 0)
      {
LABEL_4:
        ++v4;
        v7 += 8;
        if (v4 == a2)
          return;
        goto LABEL_5;
      }
      if (!v6)
        break;
      v15 = *(void **)v10;
      v8 = *(void **)(v10 + 8);
      *(_QWORD *)v10 = v8;
      *(_QWORD *)(v10 + 8) = v15;
      v10 -= 8;
      if (v4 == ++v9)
        goto LABEL_4;
    }
    __break(1u);
  }
}

uint64_t sub_10001C4B4(id *a1, id *__src, unint64_t a3, char *a4)
{
  id *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void **v12;
  void **v13;
  void **v14;
  void *v15;
  id v16;
  id v17;
  char v18;
  id *v19;
  char *v20;
  id *v21;
  id *v22;
  id *v23;
  void *v24;
  id v25;
  id v26;
  char v27;
  uint64_t result;
  char *v31;
  void **v32;
  id *v33;

  v33 = a1;
  v5 = __src;
  v6 = (char *)__src - (char *)a1;
  v7 = (char *)__src - (char *)a1 + 7;
  if ((char *)__src - (char *)a1 >= 0)
    v7 = (char *)__src - (char *)a1;
  v8 = v7 >> 3;
  v9 = a3 - (_QWORD)__src;
  v10 = a3 - (_QWORD)__src + 7;
  if ((uint64_t)(a3 - (_QWORD)__src) >= 0)
    v10 = a3 - (_QWORD)__src;
  v11 = v10 >> 3;
  v32 = (void **)a4;
  if (v8 >= v10 >> 3)
  {
    if (v9 >= -7)
    {
      if (a4 != (char *)__src || &__src[v11] <= (id *)a4)
        memmove(a4, __src, 8 * v11);
      v20 = &a4[8 * v11];
      v31 = v20;
      v33 = v5;
      if (a1 < v5 && v9 >= 8)
      {
        v21 = (id *)(a3 - 8);
        v22 = v5;
        do
        {
          v23 = v21 + 1;
          v24 = *--v22;
          v25 = *((id *)v20 - 1);
          v26 = v24;
          v27 = _s31HomeWidgetSingleAccessoryIntent08SecurityeD0C1loiySbAC_ACtFZ_0(v25, v26);

          if ((v27 & 1) != 0)
          {
            if (v23 != v5 || v21 >= v5)
              *v21 = *v22;
            v33 = v22;
          }
          else
          {
            v31 = v20 - 8;
            if (v23 < (id *)v20 || v21 >= (id *)v20 || v23 != (id *)v20)
              *v21 = (id)*((_QWORD *)v20 - 1);
            v22 = v5;
            v20 -= 8;
          }
          if (v22 <= a1)
            break;
          --v21;
          v5 = v22;
        }
        while (v20 > a4);
      }
      goto LABEL_43;
    }
  }
  else if (v6 >= -7)
  {
    if (a4 != (char *)a1 || &a1[v8] <= (id *)a4)
      memmove(a4, a1, 8 * v8);
    v12 = (void **)&a4[8 * v8];
    v31 = (char *)v12;
    if ((unint64_t)v5 < a3 && v6 >= 8)
    {
      v13 = (void **)a4;
      v14 = a1;
      do
      {
        v15 = *v13;
        v16 = *v5;
        v17 = v15;
        v18 = _s31HomeWidgetSingleAccessoryIntent08SecurityeD0C1loiySbAC_ACtFZ_0(v16, v17);

        if ((v18 & 1) != 0)
        {
          v19 = v5 + 1;
          if (v14 < v5 || v14 >= v19 || v14 != v5)
            *v14 = *v5;
        }
        else
        {
          if (v14 != v13)
            *v14 = *v13;
          v32 = ++v13;
          v19 = v5;
        }
        ++v14;
        if (v13 >= v12)
          break;
        v5 = v19;
      }
      while ((unint64_t)v19 < a3);
      v33 = v14;
    }
LABEL_43:
    sub_100024178(&v33, &v32, &v31);
    return 1;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
  __break(1u);
  return result;
}

uint64_t sub_10001C774(uint64_t a1)
{
  return sub_10001C780(a1, (uint64_t (*)(uint64_t, _QWORD, uint64_t))sub_100015BC4);
}

uint64_t sub_10001C780(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, uint64_t))
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v18 = a1;
    else
      v18 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v5 = _CocoaArrayWrapper.endIndex.getter(v18);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v6 = *v2;
  if (!((unint64_t)*v2 >> 62))
  {
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    v8 = v7 + v5;
    if (!__OFADD__(v7, v5))
      goto LABEL_5;
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v6 < 0)
    v19 = *v2;
  else
    v19 = v6 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(*v2);
  v7 = _CocoaArrayWrapper.endIndex.getter(v19);
  swift_bridgeObjectRelease(v6);
  v8 = v7 + v5;
  if (__OFADD__(v7, v5))
    goto LABEL_29;
LABEL_5:
  v6 = *v2;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v2);
  *v2 = v6;
  v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
  {
    v10 = v6 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v7 = 1;
  }
  if ((unint64_t)v6 >> 62)
    goto LABEL_31;
  v11 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v11 <= v8)
      v11 = v8;
    swift_bridgeObjectRetain(v6);
    v6 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v7, v11, 1, v6);
    swift_bridgeObjectRelease(*v2);
    *v2 = v6;
    v10 = v6 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = a2(v10 + 8 * *(_QWORD *)(v10 + 16) + 32, (*(_QWORD *)(v10 + 24) >> 1) - *(_QWORD *)(v10 + 16), a1);
    if (v13 >= v5)
      break;
LABEL_30:
    __break(1u);
LABEL_31:
    if (v6 < 0)
      v20 = v6;
    else
      v20 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v6);
    v11 = _CocoaArrayWrapper.endIndex.getter(v20);
    swift_bridgeObjectRelease(v6);
  }
  if (v13 < 1)
    goto LABEL_19;
  v14 = *(_QWORD *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v15 = __OFADD__(v14, v13);
  v16 = v14 + v13;
  if (!v15)
  {
    *(_QWORD *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10) = v16;
LABEL_19:
    v17 = swift_bridgeObjectRelease(result);
    return specialized Array._endMutation()(v17);
  }
  __break(1u);
  return result;
}

uint64_t sub_10001C93C(char a1)
{
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t result;
  unint64_t v7;
  const char *v8;
  uint64_t v9;
  _BYTE v10[16];

  type metadata accessor for Locale(0);
  __chkstk_darwin();
  v3 = &v10[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin();
  v5 = &v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a1 == 35)
  {
    v7 = 0xD000000000000022;
    v8 = "SecuritySystem_CategoryCapitalized";
  }
  else if (a1 == 30)
  {
    v7 = 0xD00000000000001CLL;
    v8 = "DoorLock_CategoryCapitalized";
  }
  else
  {
    result = 0;
    if (a1 != 19)
      return result;
    v7 = 0xD000000000000024;
    v8 = "GarageDoorOpener_CategoryCapitalized";
  }
  v9 = String.LocalizationValue.init(stringLiteral:)(v7, (unint64_t)(v8 - 32) | 0x8000000000000000);
  static Locale.current.getter(v9);
  return String.init(localized:table:bundle:locale:comment:)(v5, 0xD00000000000001DLL, 0x800000010002CB10, 0, v3, 0, 0, 256);
}

uint64_t _s31HomeWidgetSingleAccessoryIntent08SecurityeD0C1loiySbAC_ACtFZ_0(void *a1, void *a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v25;
  char v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  id v30;
  uint64_t v31;
  unint64_t v32;

  v4 = objc_msgSend(a1, "serviceType");
  v5 = 0xE000000000000000;
  if (v4)
  {
    v6 = v4;
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
    v9 = v8;

  }
  else
  {
    v7 = 0;
    v9 = 0xE000000000000000;
  }
  v10 = _s31HomeWidgetSingleAccessoryIntent11ServiceKindO8rawValueACSgSS_tcfC_0(v7, v9);
  if (v10 == 51)
    v10 = 0;
  v11 = sub_10001C93C(v10);
  if (v12)
    v13 = v11;
  else
    v13 = 0;
  if (v12)
    v14 = v12;
  else
    v14 = 0xE000000000000000;
  v15 = objc_msgSend(a2, "serviceType");
  if (v15)
  {
    v16 = v15;
    v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
    v5 = v18;

  }
  else
  {
    v17 = 0;
  }
  v19 = _s31HomeWidgetSingleAccessoryIntent11ServiceKindO8rawValueACSgSS_tcfC_0(v17, v5);
  if (v19 == 51)
    v19 = 0;
  v20 = sub_10001C93C(v19);
  if (v21)
    v22 = v20;
  else
    v22 = 0;
  if (v21)
    v23 = v21;
  else
    v23 = 0xE000000000000000;
  if (v13 == v22 && v14 == v23)
  {
    swift_bridgeObjectRelease_n(v14, 2);
LABEL_31:
    v27 = objc_msgSend(a1, "displayString");
    v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
    v23 = v29;

    v30 = objc_msgSend(a2, "displayString");
    v31 = static String._unconditionallyBridgeFromObjectiveC(_:)(v30);
    v14 = v32;

    if (v28 == v31 && v23 == v14)
    {
      v25 = 0;
      v14 = v23;
    }
    else
    {
      v25 = _stringCompareWithSmolCheck(_:_:expecting:)(v28, v23, v31, v14, 1);
    }
    goto LABEL_35;
  }
  v25 = 1;
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(v13, v14, v22, v23, 1) & 1) == 0)
  {
    v26 = _stringCompareWithSmolCheck(_:_:expecting:)(v13, v14, v22, v23, 0);
    swift_bridgeObjectRelease(v23);
    swift_bridgeObjectRelease(v14);
    v25 = 0;
    if ((v26 & 1) == 0)
      return v25 & 1;
    goto LABEL_31;
  }
LABEL_35:
  swift_bridgeObjectRelease(v23);
  swift_bridgeObjectRelease(v14);
  return v25 & 1;
}

unint64_t sub_10001CC94()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003DD10;
  if (!qword_10003DD10)
  {
    v1 = type metadata accessor for SecurityIntentAccessory();
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_10003DD10);
  }
  return result;
}

uint64_t type metadata accessor for IntentHandler()
{
  return objc_opt_self(_TtC31HomeWidgetSingleAccessoryIntent13IntentHandler);
}

_QWORD *sub_10001CCFC(unint64_t *a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  _QWORD *result;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  NSString v26;
  NSString v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  NSString v33;
  id v34;
  id v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  NSString v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD **v50;
  _QWORD *v51;
  unint64_t v52;

  v5 = type metadata accessor for UUID(0);
  v48 = *(_QWORD *)(v5 - 8);
  v49 = v5;
  __chkstk_darwin(v5);
  v47 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = _swiftEmptyArrayStorage;
  v52 = (unint64_t)_swiftEmptyArrayStorage;
  v51 = (_QWORD *)a1[2];
  if (v51)
  {
    v46 = v2;
    v8 = qword_10003D5E0;
    swift_bridgeObjectRetain(a1);
    if (v8 != -1)
LABEL_36:
      swift_once(&qword_10003D5E0, sub_1000128F0);
    v9 = 0;
    v45 = a1;
    v50 = (_QWORD **)(a1 + 4);
    while (1)
    {
      v10 = (_QWORD *)((char *)v9 + 1);
      if (__OFADD__(v9, 1))
      {
LABEL_33:
        __break(1u);
LABEL_34:
        __break(1u);
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      v11 = (_QWORD *)*((unsigned __int8 *)v9 + (_QWORD)v50);
      a1 = (unint64_t *)objc_msgSend(a2, "accessories");
      v12 = sub_100017138(0, &qword_10003DB20, HMAccessory_ptr);
      v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a1, v12);

      if ((unint64_t)v13 >> 62)
      {
        if (v13 < 0)
          v43 = v13;
        else
          v43 = v13 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v13);
        v14 = _CocoaArrayWrapper.endIndex.getter(v43);
        swift_bridgeObjectRelease(v13);
        if (v14)
        {
LABEL_9:
          v15 = 0;
          v16 = v13 & 0xC000000000000001;
          while (1)
          {
            if (v16)
            {
              swift_bridgeObjectRetain(v13);
              a1 = (unint64_t *)specialized _ArrayBuffer._getElementSlowPath(_:)(v15, v13);
              swift_bridgeObjectRelease(v13);
            }
            else
            {
              a1 = (unint64_t *)*(id *)(v13 + 8 * v15 + 32);
            }
            v17 = (void *)HMAccessory.subscript.getter(v11);

            if (v17)
              break;
            v18 = v15 + 1;
            if (__OFADD__(v15, 1))
            {
              __break(1u);
              goto LABEL_33;
            }
            ++v15;
            if (v18 == v14)
              goto LABEL_4;
          }
          if (v14 == v15)
            goto LABEL_4;
          if (v16)
          {
            v19 = specialized _ArrayBuffer._getElementSlowPath(_:)(v15, v13);
            swift_unknownObjectRelease(v19);
            swift_bridgeObjectRelease(v13);
          }
          else
          {
            if ((v15 & 0x8000000000000000) != 0)
              goto LABEL_34;
            a1 = *(unint64_t **)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRelease(v13);
            if (v15 >= (unint64_t)a1)
              goto LABEL_35;
          }
          v20 = type metadata accessor for ClimateSensorIntentType();
          ServiceKind.rawValue.getter(v11);
          v22 = v21;
          ServiceKind.localizedDescription.getter((char)v11);
          v24 = v23;
          v25 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v20));
          v26 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(v22);
          v27 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(v24);
          v28 = objc_msgSend(v25, "initWithIdentifier:displayString:", v26, v27);

          v29 = (void *)objc_opt_self(INImage);
          ServiceKind.iconSymbol.getter(v11);
          v31 = v30;
          v32 = v28;
          v33 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(v31);
          v34 = objc_msgSend(v29, "systemImageNamed:", v33);

          objc_msgSend(v32, "setDisplayImage:", v34);
          v35 = objc_msgSend(a2, "uniqueIdentifier");
          v36 = v47;
          static UUID._unconditionallyBridgeFromObjectiveC(_:)();

          UUID.uuidString.getter();
          v38 = v37;
          (*(void (**)(char *, uint64_t))(v48 + 8))(v36, v49);
          v39 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(v38);
          objc_msgSend(v32, "setHomeIdentifier:", v39);

          a1 = &v52;
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
          v41 = *(_QWORD *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x10);
          v40 = *(_QWORD *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x18);
          if (v41 >= v40 >> 1)
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v40 > 1, v41 + 1, 1);
          v42 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v41, v32);
          specialized Array._endMutation()(v42);
          goto LABEL_5;
        }
      }
      else
      {
        v14 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (v14)
          goto LABEL_9;
      }
LABEL_4:
      swift_bridgeObjectRelease(v13);
LABEL_5:
      v9 = v10;
      if (v10 == v51)
      {
        swift_bridgeObjectRelease(v45);
        return (_QWORD *)v52;
      }
    }
  }
  return result;
}

id sub_10001D144(char a1)
{
  void *v1;
  NSString v2;
  id v3;

  if (a1 != 35 && a1 != 30 && a1 != 19)
    return 0;
  v1 = (void *)objc_opt_self(INImage);
  v2 = String._bridgeToObjectiveC()();
  v3 = objc_msgSend(v1, "systemImageNamed:", v2);

  return v3;
}

uint64_t sub_10001D230(_QWORD **a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;

  v8 = (uint64_t)_swiftEmptyArrayStorage;
  v7 = 19;
  sub_10001B050(a1, &v7, &v6);
  sub_10001C780(v6, (uint64_t (*)(uint64_t, _QWORD, uint64_t))sub_100015DD8);
  v7 = 30;
  sub_10001B050(a1, &v7, &v6);
  sub_10001C780(v6, (uint64_t (*)(uint64_t, _QWORD, uint64_t))sub_100015DD8);
  v7 = 35;
  sub_10001B050(a1, &v7, &v6);
  sub_10001C780(v6, (uint64_t (*)(uint64_t, _QWORD, uint64_t))sub_100015DD8);
  v2 = v8;
  if (v8 < 0 || (v8 & 0x4000000000000000) != 0)
  {
    v5 = swift_bridgeObjectRetain(v8);
    v3 = (uint64_t)sub_100014658(v5);
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3 = v8 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v8);
  }
  v8 = v3;
  sub_10001B854(&v8);
  swift_bridgeObjectRelease(v2);
  return v8;
}

_QWORD *sub_10001D370(unint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD *result;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSString v17;
  Class isa;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  unint64_t v25;

  v2 = a2;
  v3 = a1;
  if (a1 >> 62)
    goto LABEL_12;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  v5 = a2;
  if (v4)
  {
    while (1)
    {
      result = (_QWORD *)specialized ContiguousArray.reserveCapacity(_:)(v4);
      if (v4 < 0)
        break;
      v24 = v2;
      v7 = 0;
      v25 = v3 & 0xC000000000000001;
      v8 = v3;
      while (v4 != v7)
      {
        if (v25)
          v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v7, v3);
        else
          v9 = *(id *)(v3 + 8 * v7 + 32);
        v10 = v9;
        ++v7;
        v11 = v24;
        v12 = objc_msgSend(v10, "name");
        static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
        v14 = v13;

        v15 = sub_10001D230((_QWORD **)v10);
        v16 = objc_allocWithZone((Class)INObjectSection);
        v17 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v14);
        type metadata accessor for SecurityIntentAccessory();
        isa = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v15);
        v2 = objc_msgSend(v16, "initWithTitle:items:", v17, isa);

        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v19);
        v20 = _swiftEmptyArrayStorage[2];
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v20);
        v21 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v20, v2);
        specialized ContiguousArray._endMutation()(v21);
        v3 = v8;
        if (v4 == v7)
        {

          return _swiftEmptyArrayStorage;
        }
      }
      __break(1u);
LABEL_12:
      if (v3 < 0)
        v22 = v3;
      else
        v22 = v3 & 0xFFFFFFFFFFFFFF8;
      v23 = v2;
      swift_bridgeObjectRetain(v3);
      v4 = _CocoaArrayWrapper.endIndex.getter(v22);
      swift_bridgeObjectRelease(v3);
      if (!v4)
        goto LABEL_16;
    }
    __break(1u);
  }
  else
  {
LABEL_16:

    return _swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_10001D590(unint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD *result;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD *v15;
  id v16;
  NSString v17;
  Class isa;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  unint64_t v25;
  uint64_t v26;

  v2 = a2;
  v3 = a1;
  if (a1 >> 62)
    goto LABEL_12;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  v5 = a2;
  if (v4)
  {
    while (1)
    {
      result = (_QWORD *)specialized ContiguousArray.reserveCapacity(_:)(v4);
      if (v4 < 0)
        break;
      v7 = 0;
      v24 = v2;
      v25 = v3 & 0xC000000000000001;
      v26 = v3;
      while (v4 != v7)
      {
        if (v25)
          v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v7, v3);
        else
          v8 = *(id *)(v3 + 8 * v7 + 32);
        v9 = v8;
        ++v7;
        v10 = v24;
        v11 = objc_msgSend(v9, "name");
        static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
        v13 = v12;

        v14 = v9;
        v15 = sub_10001CCFC((unint64_t *)&off_100036300, v14);

        v16 = objc_allocWithZone((Class)INObjectSection);
        v17 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v13);
        type metadata accessor for ClimateSensorIntentType();
        isa = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v15);
        v19 = objc_msgSend(v16, "initWithTitle:items:", v17, isa);

        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v20);
        v2 = (void *)_swiftEmptyArrayStorage[2];
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v2);
        v21 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v2, v19);
        specialized ContiguousArray._endMutation()(v21);
        v3 = v26;
        if (v4 == v7)
        {

          return _swiftEmptyArrayStorage;
        }
      }
      __break(1u);
LABEL_12:
      if (v3 < 0)
        v22 = v3;
      else
        v22 = v3 & 0xFFFFFFFFFFFFFF8;
      v23 = v2;
      swift_bridgeObjectRetain(v3);
      v4 = _CocoaArrayWrapper.endIndex.getter(v22);
      swift_bridgeObjectRelease(v3);
      if (!v4)
        goto LABEL_16;
    }
    __break(1u);
  }
  else
  {
LABEL_16:

    return _swiftEmptyArrayStorage;
  }
  return result;
}

uint64_t sub_10001D7C4(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t v4;
  id v5;

  v2[4] = a1;
  v2[5] = a2;
  v4 = swift_task_alloc(32);
  v2[6] = v4;
  *(_QWORD *)(v4 + 16) = a2;
  v5 = a2;
  return swift_task_switch(sub_10001D814, 0, 0);
}

void sub_10001D814()
{
  uint64_t v0;
  _UNKNOWN **v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  void *v8;
  _QWORD *v9;
  uint8_t *v10;
  _QWORD *v11;
  id v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  Class isa;
  id v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  NSArray v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _UNKNOWN **v51;
  uint64_t v52;

  if (qword_10003D5F0 != -1)
    swift_once(&qword_10003D5F0, sub_100013BA4);
  v1 = (_UNKNOWN **)(v0 + 16);
  v3 = v0 + 32;
  v2 = *(void **)(v0 + 32);
  v4 = type metadata accessor for Logger(0);
  sub_100012570(v4, (uint64_t)static DataModel.widgetLogger);
  v5 = Logger.logObject.getter(v2);
  v6 = static os_log_type_t.default.getter();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 32);
  v52 = v0;
  if (v7)
  {
    v51 = (_UNKNOWN **)(v0 + 16);
    v9 = (_QWORD *)(v0 + 24);
    v10 = (uint8_t *)swift_slowAlloc(12, -1);
    v11 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v10 = 138412290;
    *v9 = v8;
    v12 = v8;
    v13 = v9;
    v1 = v51;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v13, v3, v10 + 4, v10 + 12);
    *v11 = v8;

    _os_log_impl((void *)&_mh_execute_header, v5, v6, "HomeWidgets: ConfigurationIntentHandling -provideGenericOptionsCollection(for : %@)", v10, 0xCu);
    v14 = sub_10000D3B8(&qword_10003DBB0);
    swift_arrayDestroy(v11, 1, v14);
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v10, -1, -1);
  }
  else
  {

  }
  if (qword_10003D5E0 != -1)
    swift_once(&qword_10003D5E0, sub_1000128F0);
  v15 = *(void **)(v52 + 40);
  v16 = (id)DataModel.sortedHomes.getter();
  v17 = v15;
  v18 = (uint64_t)sub_10001D370((unint64_t)v16, v17);

  swift_bridgeObjectRelease(v16);
  if ((unint64_t)v18 >> 62)
  {
    if (v18 < 0)
      v16 = (id)v18;
    else
      v16 = (id)(v18 & 0xFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain(v18);
    v19 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(v18);
    if (!v19)
      goto LABEL_30;
  }
  else
  {
    v19 = *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v19)
      goto LABEL_30;
  }
  if (v19 < 1)
  {
    __break(1u);
    goto LABEL_49;
  }
  for (i = 0; i != v19; ++i)
  {
    if ((v18 & 0xC000000000000001) != 0)
      v21 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v18);
    else
      v21 = *(id *)(v18 + 8 * i + 32);
    v22 = v21;
    v23 = objc_msgSend(v21, "items");
    v24 = type metadata accessor for SecurityIntentAccessory();
    v25 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v23, v24);

    if ((unint64_t)v25 >> 62)
    {
      if (v25 < 0)
        v30 = v25;
      else
        v30 = v25 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v25);
      v26 = _CocoaArrayWrapper.endIndex.getter(v30);
      swift_bridgeObjectRelease(v25);
    }
    else
    {
      v26 = *(_QWORD *)((v25 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v27 = swift_bridgeObjectRelease(v25);
    if (v26 < 1)
    {

    }
    else
    {
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v27);
      v28 = _swiftEmptyArrayStorage[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v28);
      v29 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v28, v22);
      specialized ContiguousArray._endMutation()(v29);
    }
  }
LABEL_30:
  swift_bridgeObjectRelease(v18);
  v1 = &_s10Foundation13__DataStorageC6_bytesSvSgvg_ptr;
  v31 = objc_allocWithZone((Class)INObjectCollection);
  v32 = sub_10000D3B8(&qword_10003DD98);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_release(_swiftEmptyArrayStorage);
  v16 = objc_msgSend(v31, "initWithSections:", isa);

  v34 = objc_msgSend(v16, "sections");
  v35 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v34, v32);

  if ((unint64_t)v35 >> 62)
  {
    if (v35 < 0)
      v48 = v35;
    else
      v48 = v35 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v35);
    v36 = _CocoaArrayWrapper.endIndex.getter(v48);
    swift_bridgeObjectRelease(v35);
  }
  else
  {
    v36 = *(_QWORD *)((v35 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease(v35);
  if (!v36)
  {
    v43 = objc_allocWithZone((Class)INObjectCollection);
    type metadata accessor for SecurityIntentAccessory();
    v44.super.isa = Array._bridgeToObjectiveC()().super.isa;
    goto LABEL_41;
  }
  if (v36 != 1)
  {
    v44.super.isa = *(Class *)(v52 + 40);
    goto LABEL_43;
  }
  v37 = objc_msgSend(v16, "sections");
  v18 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v37, v32);

  if (!((unint64_t)v18 >> 62))
  {
    if (*(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_36;
LABEL_53:

    swift_bridgeObjectRelease(v18);
    __break(1u);
    goto LABEL_54;
  }
LABEL_49:
  if (v18 < 0)
    v49 = v18;
  else
    v49 = v18 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v18);
  v50 = _CocoaArrayWrapper.endIndex.getter(v49);
  swift_bridgeObjectRelease(v18);
  if (!v50)
    goto LABEL_53;
LABEL_36:
  if ((v18 & 0xC000000000000001) != 0)
  {
LABEL_54:
    v38 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v18);
    goto LABEL_39;
  }
  if (*(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v38 = *(id *)(v18 + 32);
LABEL_39:
    v39 = v38;
    swift_bridgeObjectRelease(v18);
    v40 = objc_msgSend(v39, "items");

    v41 = type metadata accessor for SecurityIntentAccessory();
    v42 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v40, v41);

    v43 = objc_allocWithZone((Class)v1[223]);
    v44.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v42);
LABEL_41:
    v45 = *(void **)(v52 + 40);
    v46 = objc_msgSend(v43, "initWithItems:", v44.super.isa);

    v16 = v46;
LABEL_43:
    v47 = *(_QWORD *)(v52 + 48);

    swift_task_dealloc(v47);
    (*(void (**)(id))(v52 + 8))(v16);
    return;
  }
  __break(1u);
}

uint64_t sub_10001DDF4(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t v4;
  id v5;

  v2[4] = a1;
  v2[5] = a2;
  v4 = swift_task_alloc(32);
  v2[6] = v4;
  *(_QWORD *)(v4 + 16) = a2;
  v5 = a2;
  return swift_task_switch(sub_10001DE44, 0, 0);
}

void sub_10001DE44()
{
  uint64_t v0;
  _UNKNOWN **v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  void *v8;
  _QWORD *v9;
  uint8_t *v10;
  _QWORD *v11;
  id v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  Class isa;
  id v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  NSArray v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _UNKNOWN **v51;
  uint64_t v52;

  if (qword_10003D5F0 != -1)
    swift_once(&qword_10003D5F0, sub_100013BA4);
  v1 = (_UNKNOWN **)(v0 + 16);
  v3 = v0 + 32;
  v2 = *(void **)(v0 + 32);
  v4 = type metadata accessor for Logger(0);
  sub_100012570(v4, (uint64_t)static DataModel.widgetLogger);
  v5 = Logger.logObject.getter(v2);
  v6 = static os_log_type_t.default.getter();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 32);
  v52 = v0;
  if (v7)
  {
    v51 = (_UNKNOWN **)(v0 + 16);
    v9 = (_QWORD *)(v0 + 24);
    v10 = (uint8_t *)swift_slowAlloc(12, -1);
    v11 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v10 = 138412290;
    *v9 = v8;
    v12 = v8;
    v13 = v9;
    v1 = v51;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v13, v3, v10 + 4, v10 + 12);
    *v11 = v8;

    _os_log_impl((void *)&_mh_execute_header, v5, v6, "HomeWidgets: ConfigurationIntentHandling -provideGenericOptionsCollection(for : %@)", v10, 0xCu);
    v14 = sub_10000D3B8(&qword_10003DBB0);
    swift_arrayDestroy(v11, 1, v14);
    swift_slowDealloc(v11, -1, -1);
    swift_slowDealloc(v10, -1, -1);
  }
  else
  {

  }
  if (qword_10003D5E0 != -1)
    swift_once(&qword_10003D5E0, sub_1000128F0);
  v15 = *(void **)(v52 + 40);
  v16 = (id)DataModel.sortedHomes.getter();
  v17 = v15;
  v18 = (uint64_t)sub_10001D590((unint64_t)v16, v17);

  swift_bridgeObjectRelease(v16);
  if ((unint64_t)v18 >> 62)
  {
    if (v18 < 0)
      v16 = (id)v18;
    else
      v16 = (id)(v18 & 0xFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain(v18);
    v19 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(v18);
    if (!v19)
      goto LABEL_30;
  }
  else
  {
    v19 = *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v19)
      goto LABEL_30;
  }
  if (v19 < 1)
  {
    __break(1u);
    goto LABEL_49;
  }
  for (i = 0; i != v19; ++i)
  {
    if ((v18 & 0xC000000000000001) != 0)
      v21 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v18);
    else
      v21 = *(id *)(v18 + 8 * i + 32);
    v22 = v21;
    v23 = objc_msgSend(v21, "items");
    v24 = type metadata accessor for ClimateSensorIntentType();
    v25 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v23, v24);

    if ((unint64_t)v25 >> 62)
    {
      if (v25 < 0)
        v30 = v25;
      else
        v30 = v25 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v25);
      v26 = _CocoaArrayWrapper.endIndex.getter(v30);
      swift_bridgeObjectRelease(v25);
    }
    else
    {
      v26 = *(_QWORD *)((v25 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v27 = swift_bridgeObjectRelease(v25);
    if (v26 < 1)
    {

    }
    else
    {
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v27);
      v28 = _swiftEmptyArrayStorage[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v28);
      v29 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v28, v22);
      specialized ContiguousArray._endMutation()(v29);
    }
  }
LABEL_30:
  swift_bridgeObjectRelease(v18);
  v1 = &_s10Foundation13__DataStorageC6_bytesSvSgvg_ptr;
  v31 = objc_allocWithZone((Class)INObjectCollection);
  v32 = sub_10000D3B8(&qword_10003DD98);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_release(_swiftEmptyArrayStorage);
  v16 = objc_msgSend(v31, "initWithSections:", isa);

  v34 = objc_msgSend(v16, "sections");
  v35 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v34, v32);

  if ((unint64_t)v35 >> 62)
  {
    if (v35 < 0)
      v48 = v35;
    else
      v48 = v35 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v35);
    v36 = _CocoaArrayWrapper.endIndex.getter(v48);
    swift_bridgeObjectRelease(v35);
  }
  else
  {
    v36 = *(_QWORD *)((v35 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease(v35);
  if (!v36)
  {
    v43 = objc_allocWithZone((Class)INObjectCollection);
    type metadata accessor for ClimateSensorIntentType();
    v44.super.isa = Array._bridgeToObjectiveC()().super.isa;
    goto LABEL_41;
  }
  if (v36 != 1)
  {
    v44.super.isa = *(Class *)(v52 + 40);
    goto LABEL_43;
  }
  v37 = objc_msgSend(v16, "sections");
  v18 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v37, v32);

  if (!((unint64_t)v18 >> 62))
  {
    if (*(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_36;
LABEL_53:

    swift_bridgeObjectRelease(v18);
    __break(1u);
    goto LABEL_54;
  }
LABEL_49:
  if (v18 < 0)
    v49 = v18;
  else
    v49 = v18 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v18);
  v50 = _CocoaArrayWrapper.endIndex.getter(v49);
  swift_bridgeObjectRelease(v18);
  if (!v50)
    goto LABEL_53;
LABEL_36:
  if ((v18 & 0xC000000000000001) != 0)
  {
LABEL_54:
    v38 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v18);
    goto LABEL_39;
  }
  if (*(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v38 = *(id *)(v18 + 32);
LABEL_39:
    v39 = v38;
    swift_bridgeObjectRelease(v18);
    v40 = objc_msgSend(v39, "items");

    v41 = type metadata accessor for ClimateSensorIntentType();
    v42 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v40, v41);

    v43 = objc_allocWithZone((Class)v1[223]);
    v44.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v42);
LABEL_41:
    v45 = *(void **)(v52 + 40);
    v46 = objc_msgSend(v43, "initWithItems:", v44.super.isa);

    v16 = v46;
LABEL_43:
    v47 = *(_QWORD *)(v52 + 48);

    swift_task_dealloc(v47);
    (*(void (**)(id))(v52 + 8))(v16);
    return;
  }
  __break(1u);
}

uint64_t sub_10001E424()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSString v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  NSString v33;
  NSString v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  NSString v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSString v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  _QWORD **v54;
  id v55;
  id v56;
  uint64_t v57;
  id v58;
  uint64_t result;
  uint64_t v60;
  __objc2_prot_list *v61;
  uint64_t v62;
  __objc2_prot_list *v63;
  id v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  id v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  Class ObjCClassFromMetadata;
  unint64_t v76;
  uint64_t v77;
  _QWORD *v78;
  uint64_t v79;

  v0 = type metadata accessor for UUID(0);
  v73 = *(_QWORD *)(v0 - 8);
  v74 = v0;
  __chkstk_darwin(v0);
  v72 = (char *)&v60 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10003D5E0 != -1)
    goto LABEL_60;
LABEL_2:
  v2 = DataModel.sortedHomes.getter();
  v3 = v2;
  if ((unint64_t)v2 >> 62)
  {
    if (v2 < 0)
      v57 = v2;
    else
      v57 = v2 & 0xFFFFFFFFFFFFFF8;
    v58 = v64;
    swift_bridgeObjectRetain(v3);
    v4 = _CocoaArrayWrapper.endIndex.getter(v57);
    swift_bridgeObjectRelease(v3);
    if (!v4)
    {
LABEL_65:
      v53 = v64;

      swift_bridgeObjectRelease(v3);
      v56 = 0;
      goto LABEL_66;
    }
  }
  else
  {
    v4 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    v5 = v64;
    if (!v4)
      goto LABEL_65;
  }
  v6 = 0;
  v65 = v3 & 0xC000000000000001;
  v61 = (__objc2_prot_list *)(v3 + 32);
  v62 = v4;
  v70 = 0x800000010002CAC0;
  v71 = 0x800000010002CAA0;
  v63 = (__objc2_prot_list *)v3;
  while (2)
  {
    v66 = 0;
    v67 = v6;
    if (v65)
      v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v6, v3);
    else
      v7 = (id)v61[v6].count;
    v68 = v7;
    v3 = (uint64_t)&DataModel;
    v8 = 0;
    v79 = (uint64_t)_swiftEmptyArrayStorage;
    do
    {
      v10 = *((unsigned __int8 *)&off_100036F88 + v8 + 32);
      v11 = (uint64_t)_s31HomeWidgetSingleAccessoryIntent9DataModelC11accessories3for2inSaySo11HMAccessoryCGAA11ServiceKindO_So6HMHomeCtF_0(*((_BYTE *)&off_100036F88 + v8 + 32), v68);
      v12 = v11;
      if ((unint64_t)v11 >> 62)
      {
        if (v11 >= 0)
          v11 &= 0xFFFFFFFFFFFFFF8uLL;
        v13 = _CocoaArrayWrapper.endIndex.getter(v11);
        if (!v13)
          goto LABEL_36;
LABEL_13:
        v78 = _swiftEmptyArrayStorage;
        specialized ContiguousArray.reserveCapacity(_:)(v13);
        if ((v13 & 0x8000000000000000) == 0)
        {
          v69 = v8;
          v76 = v12 & 0xC000000000000001;
          v14 = type metadata accessor for SecurityIntentAccessory();
          ObjCClassFromMetadata = (Class)swift_getObjCClassFromMetadata(v14);
          v15 = 0;
          v77 = v12;
          while (1)
          {
            if (v13 == v15)
            {
              __break(1u);
              goto LABEL_51;
            }
            v22 = v76
                ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v15, v12)
                : *(id *)(v12 + 8 * v15 + 32);
            v23 = v22;
            v24 = objc_msgSend(v22, "uniqueIdentifier");
            v25 = v72;
            static UUID._unconditionallyBridgeFromObjectiveC(_:)();

            UUID.uuidString.getter();
            v27 = v26;
            (*(void (**)(char *, uint64_t))(v73 + 8))(v25, v74);
            v28 = objc_msgSend(v23, *(SEL *)(v3 + 2816));
            static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
            v29 = v3;
            v31 = v30;

            v32 = objc_allocWithZone(ObjCClassFromMetadata);
            v33 = String._bridgeToObjectiveC()();
            swift_bridgeObjectRelease(v27);
            v34 = String._bridgeToObjectiveC()();
            swift_bridgeObjectRelease(v31);
            v35 = objc_msgSend(v32, "initWithIdentifier:displayString:", v33, v34);

            ServiceKind.rawValue.getter(v10);
            v37 = v36;
            v38 = String._bridgeToObjectiveC()();
            swift_bridgeObjectRelease(v37);
            objc_msgSend(v35, "setServiceType:", v38);

            v39 = v35;
            v40 = objc_msgSend(v23, "room");
            if (v40)
              break;
            sub_10001C93C(v10);
            v3 = v29;
            if (v45)
            {
              v44 = v45;
              goto LABEL_25;
            }
            v46 = 0;
            v12 = v77;
LABEL_26:
            objc_msgSend(v39, "setSubtitleString:", v46);

            if (v10 == 35 || v10 == 30 || v10 == 19)
            {
              v16 = (void *)objc_opt_self(INImage);
              v17 = String._bridgeToObjectiveC()();
              v18 = objc_msgSend(v16, "systemImageNamed:", v17);

            }
            else
            {
              v18 = 0;
            }
            ++v15;
            objc_msgSend(v39, "setDisplayImage:", v18);

            specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v19);
            v20 = v78[2];
            specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v20);
            v21 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v20, v39);
            specialized ContiguousArray._endMutation()(v21);
            if (v13 == v15)
            {
              v9 = v78;
              swift_bridgeObjectRelease(v12);
              v8 = v69;
              goto LABEL_10;
            }
          }
          v41 = v40;
          v42 = objc_msgSend(v40, *(SEL *)(v29 + 2816));

          static String._unconditionallyBridgeFromObjectiveC(_:)(v42);
          v44 = v43;

          v3 = v29;
LABEL_25:
          v12 = v77;
          v46 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(v44);
          goto LABEL_26;
        }
        __break(1u);
LABEL_59:
        __break(1u);
LABEL_60:
        swift_once(&qword_10003D5E0, sub_1000128F0);
        goto LABEL_2;
      }
      v13 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v13)
        goto LABEL_13;
LABEL_36:
      swift_bridgeObjectRelease(v12);
      v9 = _swiftEmptyArrayStorage;
LABEL_10:
      ++v8;
      sub_10001C780((uint64_t)v9, (uint64_t (*)(uint64_t, _QWORD, uint64_t))sub_100015DD8);
    }
    while (v8 != 3);
    v47 = v79;
    if (v79 < 0 || (v79 & 0x4000000000000000) != 0)
    {
      v51 = swift_bridgeObjectRetain(v79);
      v48 = (uint64_t)sub_100014658(v51);
      swift_bridgeObjectRelease(v47);
    }
    else
    {
      v48 = v79 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v79);
    }
    v3 = (uint64_t)v63;
    v49 = v66;
    v79 = v48;
    sub_10001B854(&v79);
    if (v49)
      goto LABEL_71;

    swift_bridgeObjectRelease(v47);
    v13 = v79;
    if (v79 < 0 || (v79 & 0x4000000000000000) != 0)
    {
      v52 = swift_bridgeObjectRetain(v79);
      v50 = _CocoaArrayWrapper.endIndex.getter(v52);
      swift_release(v13);
    }
    else
    {
      v50 = *(_QWORD *)(v79 + 16);
    }
    swift_release(v13);
    if (!v50)
    {
      v6 = v67 + 1;
      if (__OFADD__(v67, 1))
        goto LABEL_59;
      if (v6 == v62)
        goto LABEL_65;
      continue;
    }
    break;
  }
LABEL_51:
  if (v65)
  {
    v54 = (_QWORD **)specialized _ArrayBuffer._getElementSlowPath(_:)(v67, v3);
    v53 = v64;
LABEL_54:
    v13 = sub_10001D230(v54);

    if ((v13 & 0xC000000000000001) != 0)
      goto LABEL_69;
    if (*(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v55 = *(id *)(v13 + 32);
      goto LABEL_57;
    }
    __break(1u);
LABEL_71:
    result = swift_release(v79);
    __break(1u);
  }
  else
  {
    v53 = v64;
    if (v67 < *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v54 = (_QWORD **)(id)v61[v67].count;
      goto LABEL_54;
    }
    __break(1u);
LABEL_69:
    v55 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v13);
LABEL_57:
    v56 = v55;
    swift_bridgeObjectRelease(v3);
    swift_bridgeObjectRelease(v13);

LABEL_66:
    return (uint64_t)v56;
  }
  return result;
}

void sub_10001EB04()
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
  id v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  char v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unsigned __int8 v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
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
  id v56;
  NSString v57;
  NSString v58;
  id v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  NSString v64;
  id v65;
  id v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  NSString v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  id v77;
  id v78;
  NSString v79;
  NSString v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t ObjCClassFromMetadata;
  void *v89;
  id v90;
  NSString v91;
  id v92;
  char *v93;
  id v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  id v98;
  uint64_t v99;
  char *v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  id v104;
  unint64_t v105;
  uint64_t v106;
  unint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  id v117;
  uint64_t v118;
  uint64_t v119;

  v1 = v0;
  v2 = type metadata accessor for Locale(0);
  __chkstk_darwin(v2);
  v101 = (char *)&v99 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v4);
  v100 = (char *)&v99 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for UUID(0);
  v109 = *(_QWORD *)(v6 - 8);
  v110 = v6;
  __chkstk_darwin(v6);
  v108 = (char *)&v99 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10003D5E0 != -1)
    goto LABEL_90;
LABEL_2:
  v8 = DataModel.sortedHomes.getter();
  v104 = (id)v1;
  v106 = v8;
  if ((unint64_t)v8 >> 62)
  {
    if (v8 < 0)
      v81 = v8;
    else
      v81 = v8 & 0xFFFFFFFFFFFFFF8;
    v82 = v8;
    v83 = v104;
    swift_bridgeObjectRetain(v82);
    v84 = v81;
    v1 = (uint64_t)v104;
    v9 = _CocoaArrayWrapper.endIndex.getter(v84);
    swift_bridgeObjectRelease(v82);
    v11 = v106;
    if (!v9)
    {
LABEL_95:
      v85 = v11;

      swift_bridgeObjectRelease(v85);
      v86 = type metadata accessor for ClimateSensorIntentType();
      v87 = sub_100017138(0, (unint64_t *)&qword_10003DBE8, HMService_ptr);
      ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v87);
      v89 = (void *)objc_opt_self(NSBundle);
      v90 = objc_msgSend(v89, "bundleForClass:", ObjCClassFromMetadata);
      v91 = String._bridgeToObjectiveC()();
      v92 = objc_msgSend(v89, "bundleWithIdentifier:", v91);

      v93 = v100;
      String.LocalizationValue.init(stringLiteral:)(0xD000000000000016, 0x800000010002CA60);
      v94 = v90;
      v95 = v101;
      static Locale.current.getter(v94);
      String.init(localized:table:bundle:locale:comment:)(v93, 0x74694B656D6F48, 0xE700000000000000, v90, v95, "Service Type", 12, 2);
      v97 = v96;

      v98 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v86));
      v79 = String._bridgeToObjectiveC()();
      v80 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v97);
      objc_msgSend(v98, "initWithIdentifier:displayString:", v79, v80);
LABEL_96:

      return;
    }
  }
  else
  {
    v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
    v10 = (id)v1;
    v11 = v106;
    if (!v9)
      goto LABEL_95;
  }
  v12 = 0;
  v105 = v11 & 0xC000000000000001;
  v102 = v11 + 32;
  v103 = v9;
  while (1)
  {
    v107 = v12;
    v13 = v105 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v12, v11) : *(id *)(v102 + 8 * v12);
    v111 = v13;
    v14 = 0;
    v119 = (uint64_t)_swiftEmptyArrayStorage;
    do
    {
      v15 = *((_BYTE *)&off_100036FB0 + v14 + 32);
      v16 = objc_msgSend(v111, "accessories");
      v17 = sub_100017138(0, &qword_10003DB20, HMAccessory_ptr);
      v18 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v16, v17);

      if ((unint64_t)v18 >> 62)
      {
        if (v18 < 0)
          v48 = v18;
        else
          v48 = v18 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v18);
        v19 = _CocoaArrayWrapper.endIndex.getter(v48);
        swift_bridgeObjectRelease(v18);
        if (!v19)
        {
LABEL_9:
          swift_bridgeObjectRelease(v18);
          goto LABEL_10;
        }
      }
      else
      {
        v19 = *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (!v19)
          goto LABEL_9;
      }
      v20 = 0;
      v115 = v18;
      v116 = v18 & 0xC000000000000001;
      v112 = v14;
      v113 = v18 + 32;
      v114 = v19;
      while (2)
      {
        if (v116)
        {
          swift_bridgeObjectRetain(v18);
          v21 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v20, v18);
          swift_bridgeObjectRelease(v18);
        }
        else
        {
          v21 = *(id *)(v113 + 8 * v20);
        }
        v1 = (uint64_t)objc_msgSend(v21, "services");
        v22 = sub_100017138(0, (unint64_t *)&qword_10003DBE8, HMService_ptr);
        v23 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v1, v22);

        v118 = (uint64_t)_swiftEmptyArrayStorage;
        if (!((unint64_t)v23 >> 62))
        {
          v24 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
          if (!v24)
            goto LABEL_42;
LABEL_19:
          if (v24 < 1)
            goto LABEL_78;
          v117 = v21;
          v25 = 0;
LABEL_23:
          if ((v23 & 0xC000000000000001) != 0)
            v26 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v25, v23);
          else
            v26 = *(id *)(v23 + 8 * v25 + 32);
          v27 = v26;
          v28 = objc_msgSend(v26, "serviceType");
          v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
          v31 = v30;

          v32 = _s31HomeWidgetSingleAccessoryIntent11ServiceKindO8rawValueACSgSS_tcfC_0(v29, v31);
          if (v32 == 51)
            v32 = 0;
          v33 = ServiceKind.rawValue.getter(v32);
          v35 = v34;
          v36 = ServiceKind.rawValue.getter(v15);
          if (v33 != v36 || v35 != v37)
          {
            v39 = v37;
            v40 = _stringCompareWithSmolCheck(_:_:expecting:)(v33, v35, v36, v37, 0);
            swift_bridgeObjectRelease(v35);
            v41 = swift_bridgeObjectRelease(v39);
            if ((v40 & 1) != 0)
            {
LABEL_35:
              specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v41);
              v42 = *(_QWORD *)(v118 + 16);
              specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v42);
              v43 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v42, v27);
              specialized ContiguousArray._endMutation()(v43);
            }
            else
            {

            }
            if (v24 == ++v25)
            {
              swift_bridgeObjectRelease(v23);
              v1 = v118;
              v19 = v114;
              v18 = v115;
              v21 = v117;
              if ((v118 & 0x8000000000000000) == 0)
                goto LABEL_43;
LABEL_48:
              v45 = swift_bridgeObjectRetain(v1);
              v46 = _CocoaArrayWrapper.endIndex.getter(v45);
              swift_release(v1);
              if (v46)
                goto LABEL_49;
LABEL_45:

              swift_release(v1);
              if (__OFADD__(v20++, 1))
              {
                __break(1u);
LABEL_78:
                __break(1u);
                goto LABEL_79;
              }
              if (v20 == v19)
              {
LABEL_52:
                swift_bridgeObjectRelease(v18);
                goto LABEL_66;
              }
              continue;
            }
            goto LABEL_23;
          }
          v41 = swift_bridgeObjectRelease_n(v35, 2);
          goto LABEL_35;
        }
        break;
      }
      if (v23 < 0)
        v1 = v23;
      else
        v1 = v23 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v23);
      v24 = _CocoaArrayWrapper.endIndex.getter(v1);
      swift_bridgeObjectRelease(v23);
      if (v24)
        goto LABEL_19;
LABEL_42:
      swift_bridgeObjectRelease(v23);
      v1 = (uint64_t)_swiftEmptyArrayStorage;
      if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0)
        goto LABEL_48;
LABEL_43:
      if ((v1 & 0x4000000000000000) != 0)
        goto LABEL_48;
      if (!*(_QWORD *)(v1 + 16))
        goto LABEL_45;
LABEL_49:
      if ((v1 & 0xC000000000000001) == 0)
      {
        v47 = *(_QWORD *)(v1 + 16);

        swift_release(v1);
        if (v47)
        {
          if (v20 == v19)
            goto LABEL_52;
          goto LABEL_59;
        }
        __break(1u);
LABEL_87:
        __break(1u);
        goto LABEL_88;
      }
      v49 = specialized _ArrayBuffer._getElementSlowPath(_:)(0, v1);

      swift_unknownObjectRelease(v49);
      swift_release(v1);
      if (v20 == v19)
        goto LABEL_52;
LABEL_59:
      if (v116)
      {
        v50 = specialized _ArrayBuffer._getElementSlowPath(_:)(v20, v18);
        swift_unknownObjectRelease(v50);
        swift_bridgeObjectRelease(v18);
        goto LABEL_63;
      }
      if ((v20 & 0x8000000000000000) != 0)
        goto LABEL_87;
      v1 = *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRelease(v18);
      if (v20 >= v1)
      {
LABEL_88:
        __break(1u);
LABEL_89:
        __break(1u);
LABEL_90:
        swift_once(&qword_10003D5E0, sub_1000128F0);
        goto LABEL_2;
      }
LABEL_63:
      v51 = type metadata accessor for ClimateSensorIntentType();
      ServiceKind.rawValue.getter(v15);
      v53 = v52;
      ServiceKind.localizedDescription.getter(v15);
      v55 = v54;
      v56 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v51));
      v57 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v53);
      v58 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v55);
      v59 = objc_msgSend(v56, "initWithIdentifier:displayString:", v57, v58);

      v60 = (void *)objc_opt_self(INImage);
      ServiceKind.iconSymbol.getter(v15);
      v62 = v61;
      v63 = v59;
      v64 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v62);
      v65 = objc_msgSend(v60, "systemImageNamed:", v64);

      objc_msgSend(v63, "setDisplayImage:", v65);
      v66 = objc_msgSend(v111, "uniqueIdentifier");
      v67 = v108;
      static UUID._unconditionallyBridgeFromObjectiveC(_:)();

      UUID.uuidString.getter();
      v69 = v68;
      (*(void (**)(char *, uint64_t))(v109 + 8))(v67, v110);
      v70 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v69);
      objc_msgSend(v63, "setHomeIdentifier:", v70);

      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      v72 = *(_QWORD *)((v119 & 0xFFFFFFFFFFFFFF8) + 0x10);
      v71 = *(_QWORD *)((v119 & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v72 >= v71 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v71 > 1, v72 + 1, 1);
      v73 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v72, v63);
      specialized Array._endMutation()(v73);
LABEL_66:
      v14 = v112;
LABEL_10:
      ++v14;
    }
    while (v14 != 6);
    v1 = v119;

    if ((unint64_t)v1 >> 62)
    {
      v75 = v1 < 0 ? v1 : v1 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v1);
      v74 = _CocoaArrayWrapper.endIndex.getter(v75);
      swift_bridgeObjectRelease(v1);
    }
    else
    {
      v74 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease(v1);
    if (v74)
      break;
    v11 = v106;
    v12 = v107 + 1;
    v1 = (uint64_t)v104;
    if (__OFADD__(v107, 1))
      goto LABEL_89;
    if (v12 == v103)
      goto LABEL_95;
  }
LABEL_79:
  if (!v105)
  {
    if (v107 < *(_QWORD *)((v106 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v76 = *(id *)(v102 + 8 * v107);
      goto LABEL_82;
    }
    __break(1u);
LABEL_99:
    specialized _ArrayBuffer._getElementSlowPath(_:)(0, v1);
LABEL_85:
    swift_bridgeObjectRelease(v106);
    swift_bridgeObjectRelease(v1);
    v79 = v104;
    v80 = v104;
    goto LABEL_96;
  }
  v76 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v107, v106);
LABEL_82:
  v77 = v76;
  v1 = (uint64_t)sub_10001CCFC((unint64_t *)&off_100036300, v77);

  if ((v1 & 0xC000000000000001) != 0)
    goto LABEL_99;
  if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v78 = *(id *)(v1 + 32);
    goto LABEL_85;
  }
  __break(1u);
}

uint64_t sub_10001F56C()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc(dword_10003DD4C);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_10001F8D0;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_10003DD48 + dword_10003DD48))(v2, v3, v4);
}

uint64_t sub_10001F5DC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc(dword_10003DD5C);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_10001F8D0;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_10003DD58 + dword_10003DD58))(v2, v3, v4);
}

uint64_t sub_10001F658(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc(dword_10003DD6C);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_10001F8D0;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_10003DD68 + dword_10003DD68))(a1, v4, v5, v6);
}

uint64_t sub_10001F6DC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10000D3B8(&qword_10003DD40);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001F71C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001F740(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10003DD7C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10001F7B0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10003DD78 + dword_10003DD78))(a1, v4);
}

uint64_t sub_10001F7B0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10001F7FC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10001F830()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc(dword_10003DDA4);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_10001F7B0;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_10003DDA0 + dword_10003DDA0))(v2, v3, v4);
}

uint64_t sub_10001F8A4()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t String.serviceKind.getter(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  swift_bridgeObjectRetain(a2);
  LODWORD(result) = _s31HomeWidgetSingleAccessoryIntent11ServiceKindO8rawValueACSgSS_tcfC_0(a1, a2);
  if (result == 51)
    return 0;
  else
    return result;
}

uint64_t ServiceKind.requiredCharacteristicKinds.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(_UNKNOWN **))((char *)sub_10001F948 + 4 * byte_100028FB0[a1]))(&off_100036328);
}

void *sub_10001F948()
{
  return &_swiftEmptySetSingleton;
}

Swift::Int sub_10001F954()
{
  return sub_1000215DC((uint64_t)&off_100036350);
}

Swift::Int sub_10001F960()
{
  return sub_1000215DC((uint64_t)&off_100036378);
}

Swift::Int sub_10001F96C()
{
  return sub_1000215DC((uint64_t)&off_1000363A0);
}

Swift::Int sub_10001F978()
{
  return sub_1000215DC((uint64_t)&off_1000363C8);
}

Swift::Int sub_10001F984()
{
  return sub_1000215DC((uint64_t)&off_1000363F0);
}

Swift::Int sub_10001F990()
{
  return sub_1000215DC((uint64_t)&off_100036418);
}

Swift::Int sub_10001F99C()
{
  return sub_1000215DC((uint64_t)&off_100036440);
}

Swift::Int sub_10001F9A8()
{
  return sub_1000215DC((uint64_t)&off_100036468);
}

Swift::Int sub_10001F9B4()
{
  return sub_1000215DC((uint64_t)&off_100036490);
}

Swift::Int sub_10001F9C0()
{
  return sub_1000215DC((uint64_t)&off_1000364B8);
}

Swift::Int sub_10001F9CC()
{
  return sub_1000215DC((uint64_t)&off_1000364E0);
}

Swift::Int sub_10001F9D8()
{
  return sub_1000215DC((uint64_t)&off_100036508);
}

Swift::Int sub_10001F9E4()
{
  return sub_1000215DC((uint64_t)&off_100036530);
}

Swift::Int sub_10001F9F0()
{
  return sub_1000215DC((uint64_t)&off_100036558);
}

Swift::Int sub_10001F9FC()
{
  return sub_1000215DC((uint64_t)&off_100036580);
}

Swift::Int sub_10001FA08()
{
  return sub_1000215DC((uint64_t)&off_1000365A8);
}

Swift::Int sub_10001FA14()
{
  return sub_1000215DC((uint64_t)&off_1000365D0);
}

Swift::Int sub_10001FA20()
{
  return sub_1000215DC((uint64_t)&off_1000365F8);
}

Swift::Int sub_10001FA2C()
{
  return sub_1000215DC((uint64_t)&off_100036620);
}

Swift::Int sub_10001FA38()
{
  return sub_1000215DC((uint64_t)&off_100036648);
}

Swift::Int sub_10001FA44()
{
  return sub_1000215DC((uint64_t)&off_100036670);
}

Swift::Int sub_10001FA50()
{
  return sub_1000215DC((uint64_t)&off_100036698);
}

Swift::Int sub_10001FA5C()
{
  return sub_1000215DC((uint64_t)&off_1000366C0);
}

Swift::Int sub_10001FA68()
{
  return sub_1000215DC((uint64_t)&off_1000366E8);
}

Swift::Int sub_10001FA74()
{
  return sub_1000215DC((uint64_t)&off_100036710);
}

Swift::Int sub_10001FA80()
{
  return sub_1000215DC((uint64_t)&off_100036738);
}

Swift::Int sub_10001FA8C()
{
  return sub_1000215DC((uint64_t)&off_100036760);
}

Swift::Int sub_10001FA98()
{
  return sub_1000215DC((uint64_t)&off_100036788);
}

Swift::Int sub_10001FAA4()
{
  return sub_1000215DC((uint64_t)&off_1000367D8);
}

Swift::Int sub_10001FAB0()
{
  return sub_1000215DC((uint64_t)&off_100036800);
}

Swift::Int sub_10001FABC()
{
  return sub_1000215DC((uint64_t)&off_100036828);
}

Swift::Int sub_10001FAC8()
{
  return sub_1000215DC((uint64_t)&off_100036850);
}

Swift::Int sub_10001FAD4()
{
  return sub_1000215DC((uint64_t)&off_100036878);
}

Swift::Int sub_10001FAE0()
{
  return sub_1000215DC((uint64_t)&off_1000368A0);
}

Swift::Int sub_10001FAEC()
{
  return sub_1000215DC((uint64_t)&off_1000368C8);
}

Swift::Int sub_10001FAF8()
{
  return sub_1000215DC((uint64_t)&off_1000368F0);
}

Swift::Int sub_10001FB04()
{
  return sub_1000215DC((uint64_t)&off_100036918);
}

Swift::Int sub_10001FB10()
{
  return sub_1000215DC((uint64_t)&off_100036940);
}

Swift::Int sub_10001FB1C()
{
  return sub_1000215DC((uint64_t)&off_100036968);
}

Swift::Int sub_10001FB28()
{
  return sub_1000215DC((uint64_t)&off_100036990);
}

Swift::Int sub_10001FB34()
{
  return sub_1000215DC((uint64_t)&off_1000367B0);
}

void *ServiceKind.optionalCharacteristicKinds.getter(char a1)
{
  char v1;

  v1 = a1 - 1;
  if ((a1 - 1) <= 0x31u && ((0x373BFFEBFE719uLL >> v1) & 1) != 0)
    return (void *)sub_1000215DC((uint64_t)off_100038AA0[v1]);
  else
    return &_swiftEmptySetSingleton;
}

unint64_t ServiceKind.rawValue.getter(unsigned __int8 a1)
{
  return ((unint64_t (*)())((char *)sub_10001FBB4 + 4 * byte_100028FE3[a1]))();
}

unint64_t sub_10001FBB4()
{
  return 0xD000000000000024;
}

void ServiceKind.localizedDescription.getter(char a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t ObjCClassFromMetadata;
  void *v6;
  id v7;
  NSString v8;
  id v9;

  v2 = type metadata accessor for Locale(0);
  __chkstk_darwin(v2);
  v3 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v3);
  v4 = sub_1000176E8();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v4);
  v6 = (void *)objc_opt_self(NSBundle);
  v7 = objc_msgSend(v6, "bundleForClass:", ObjCClassFromMetadata);
  v8 = String._bridgeToObjectiveC()();
  v9 = objc_msgSend(v6, "bundleWithIdentifier:", v8);

  __asm { BR              X10 }
}

uint64_t sub_10001FF48()
{
  void *v0;
  void *v1;

  return 0;
}

uint64_t ServiceKind.iconSymbol.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)nullsub_1 + 4 * byte_100029016[a1]))(0xD000000000000019, 0x800000010002D160);
}

uint64_t sub_100020670()
{
  return 0x69662E6F65646976;
}

uint64_t sub_10002068C()
{
  return 0x6C69662E706F7264;
}

uint64_t sub_1000206A8()
{
  return 0x656D6F6D72656874;
}

uint64_t sub_1000206C8()
{
  return 0x656C6B6E69727073;
}

uint64_t sub_1000206EC(uint64_t a1)
{
  return a1 + 9;
}

_UNKNOWN **static ServiceKind.allCases.getter()
{
  return &off_100036FD8;
}

uint64_t sub_100020944(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v2 = *a2;
  ServiceKind.rawValue.getter(*a1);
  v4 = v3;
  ServiceKind.rawValue.getter(v2);
  if (v4 == v5)
  {
    v7 = 1;
    v6 = v4;
  }
  else
  {
    v6 = v5;
    v7 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000024, v4, 0xD000000000000024, v5, 0);
  }
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v6);
  return v7 & 1;
}

Swift::Int sub_1000209CC()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[9];

  v1 = *v0;
  Hasher.init(_seed:)(v5, 0);
  ServiceKind.rawValue.getter(v1);
  v3 = v2;
  String.hash(into:)(v5, 0xD000000000000024, v2);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

uint64_t sub_100020A2C(uint64_t a1)
{
  unsigned __int8 *v1;
  uint64_t v3;
  uint64_t v4;

  ServiceKind.rawValue.getter(*v1);
  v4 = v3;
  String.hash(into:)(a1, 0xD000000000000024, v3);
  return swift_bridgeObjectRelease(v4);
}

Swift::Int sub_100020A6C(uint64_t a1)
{
  unsigned __int8 *v1;
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[9];

  v2 = *v1;
  Hasher.init(_seed:)(v6, a1);
  ServiceKind.rawValue.getter(v2);
  v4 = v3;
  String.hash(into:)(v6, 0xD000000000000024, v3);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t sub_100020AC8@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = _s31HomeWidgetSingleAccessoryIntent11ServiceKindO8rawValueACSgSS_tcfC_0(*a1, a1[1]);
  *a2 = result;
  return result;
}

unint64_t sub_100020AF4@<X0>(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;
  unint64_t result;
  uint64_t v4;

  result = ServiceKind.rawValue.getter(*v1);
  *a1 = 0xD000000000000024;
  a1[1] = v4;
  return result;
}

void sub_100020B24(_QWORD *a1@<X8>)
{
  *a1 = &off_100036FD8;
}

uint64_t sub_100020B34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_1000219E4();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_100020B90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_1000219E4();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

uint64_t ServiceKind.allRelevantCharacteristicKinds.getter(char a1)
{
  uint64_t v2;
  void *v3;

  v2 = ServiceKind.requiredCharacteristicKinds.getter(a1);
  v3 = ServiceKind.optionalCharacteristicKinds.getter(a1);
  return sub_10001895C((uint64_t)v3, v2);
}

void sub_100020C0C()
{
  char *v0;

  ServiceKind.localizedDescription.getter(*v0);
}

void ServiceKind.pluralLocalizedDescription.getter(char a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = type metadata accessor for Locale(0);
  __chkstk_darwin(v2);
  v3 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v3);
  __asm { BR              X10 }
}

uint64_t sub_100020CC4()
{
  return 0;
}

uint64_t ServiceKind.iconSymbolActivated.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)nullsub_2 + 4 * byte_1000290B0[a1]))(0xD000000000000019, 0x800000010002D160);
}

uint64_t sub_100021278()
{
  return 0x69662E6F65646976;
}

uint64_t sub_100021294()
{
  return 0x6564616C626E6166;
}

uint64_t sub_1000212B4()
{
  return 0x6C69662E706F7264;
}

uint64_t sub_1000212D0()
{
  return 0x656D6F6D72656874;
}

uint64_t sub_1000212F0(uint64_t a1)
{
  return a1 + 2;
}

_UNKNOWN **ServiceKind.umbrellaCategories.getter(char a1)
{
  if ((a1 - 3) > 0x2Fu)
    return (_UNKNOWN **)&_swiftEmptyArrayStorage;
  else
    return off_100038C30[(char)(a1 - 3)];
}

uint64_t ServiceKind.togglingCharacteristicKind.getter(unsigned __int8 a1)
{
  int v1;
  uint64_t result;

  v1 = a1 - 3;
  result = 3;
  switch(v1)
  {
    case 0:
    case 13:
    case 14:
    case 17:
    case 18:
    case 21:
    case 39:
    case 41:
    case 44:
    case 45:
      return result;
    case 25:
    case 31:
    case 38:
      result = 105;
      break;
    case 28:
    case 35:
      result = 84;
      break;
    default:
      result = 174;
      break;
  }
  return result;
}

uint64_t _s31HomeWidgetSingleAccessoryIntent11ServiceKindO8rawValueACSgSS_tcfC_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = _findStringSwitchCaseWithCache(cases:string:cache:)(&off_100035D28, a1, a2, &unk_10003D640);
  swift_bridgeObjectRelease(a2);
  if (v3 >= 0x33)
    return 51;
  else
    return v3;
}

Swift::Int sub_1000215DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Swift::Int result;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v22;
  char v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v30;
  char v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[9];

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    sub_10000D3B8(&qword_10003DCF8);
    v3 = static _SetStorage.allocate(capacity:)(v1);
    v4 = 0;
    v5 = v3 + 56;
    v35 = v1;
    v36 = a1 + 32;
    while (1)
    {
      v6 = *(_BYTE *)(v36 + v4);
      Hasher.init(_seed:)(v37, *(_QWORD *)(v3 + 40));
      v7 = CharacteristicKind.rawValue.getter(v6);
      v9 = v8;
      String.hash(into:)(v37, v7, v8);
      swift_bridgeObjectRelease(v9);
      result = Hasher._finalize()();
      v11 = -1 << *(_BYTE *)(v3 + 32);
      v12 = result & ~v11;
      v13 = v12 >> 6;
      v14 = *(_QWORD *)(v5 + 8 * (v12 >> 6));
      v15 = 1 << v12;
      if (((1 << v12) & v14) != 0)
      {
        v16 = CharacteristicKind.rawValue.getter(*(_BYTE *)(*(_QWORD *)(v3 + 48) + v12));
        v18 = v17;
        v19 = CharacteristicKind.rawValue.getter(v6);
        if (v16 == v19 && v18 == v20)
        {
LABEL_3:
          swift_bridgeObjectRelease_n(v18, 2);
          goto LABEL_4;
        }
        v22 = v20;
        v23 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v18, v19, v20, 0);
        swift_bridgeObjectRelease(v18);
        result = swift_bridgeObjectRelease(v22);
        if ((v23 & 1) != 0)
          goto LABEL_4;
        v24 = ~v11;
        while (1)
        {
          v12 = (v12 + 1) & v24;
          v13 = v12 >> 6;
          v14 = *(_QWORD *)(v5 + 8 * (v12 >> 6));
          v15 = 1 << v12;
          if ((v14 & (1 << v12)) == 0)
            break;
          v25 = CharacteristicKind.rawValue.getter(*(_BYTE *)(*(_QWORD *)(v3 + 48) + v12));
          v18 = v26;
          v27 = CharacteristicKind.rawValue.getter(v6);
          if (v25 == v27 && v18 == v28)
            goto LABEL_3;
          v30 = v28;
          v31 = _stringCompareWithSmolCheck(_:_:expecting:)(v25, v18, v27, v28, 0);
          swift_bridgeObjectRelease(v18);
          result = swift_bridgeObjectRelease(v30);
          if ((v31 & 1) != 0)
            goto LABEL_4;
        }
      }
      *(_QWORD *)(v5 + 8 * v13) = v15 | v14;
      *(_BYTE *)(*(_QWORD *)(v3 + 48) + v12) = v6;
      v32 = *(_QWORD *)(v3 + 16);
      v33 = __OFADD__(v32, 1);
      v34 = v32 + 1;
      if (v33)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v34;
LABEL_4:
      if (++v4 == v35)
        return v3;
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

unint64_t sub_1000217F4()
{
  unint64_t result;

  result = qword_10003DDD0;
  if (!qword_10003DDD0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ServiceKind, &type metadata for ServiceKind);
    atomic_store(result, (unint64_t *)&qword_10003DDD0);
  }
  return result;
}

unint64_t sub_10002183C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003DDD8;
  if (!qword_10003DDD8)
  {
    v1 = sub_10000F6D0(&qword_10003DDE0);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10003DDD8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ServiceKind(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xCE)
    goto LABEL_17;
  if (a2 + 50 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 50) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 50;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 50;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 50;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x33;
  v8 = v6 - 51;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ServiceKind(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 50 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 50) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xCE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xCD)
    return ((uint64_t (*)(void))((char *)&loc_100021964 + 4 * byte_100029116[v4]))();
  *a1 = a2 + 50;
  return ((uint64_t (*)(void))((char *)sub_100021998 + 4 * byte_100029111[v4]))();
}

uint64_t sub_100021998(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000219A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1000219A8);
  return result;
}

uint64_t sub_1000219B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1000219BCLL);
  *(_BYTE *)result = a2 + 50;
  return result;
}

uint64_t sub_1000219C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000219C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ServiceKind()
{
  return &type metadata for ServiceKind;
}

unint64_t sub_1000219E4()
{
  unint64_t result;

  result = qword_10003DDE8;
  if (!qword_10003DDE8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ServiceKind, &type metadata for ServiceKind);
    atomic_store(result, (unint64_t *)&qword_10003DDE8);
  }
  return result;
}

void *UmbrellaCategory.climate.unsafeMutableAddressor()
{
  return &static UmbrellaCategory.climate;
}

void *UmbrellaCategory.securityAndAccess.unsafeMutableAddressor()
{
  return &static UmbrellaCategory.securityAndAccess;
}

void *UmbrellaCategory.water.unsafeMutableAddressor()
{
  return &static UmbrellaCategory.water;
}

void *UmbrellaCategory.lightsAndSwitches.unsafeMutableAddressor()
{
  return &static UmbrellaCategory.lightsAndSwitches;
}

void *UmbrellaCategory.blinds.unsafeMutableAddressor()
{
  return &static UmbrellaCategory.blinds;
}

void *UmbrellaCategory.speakersAndTelevisions.unsafeMutableAddressor()
{
  return &static UmbrellaCategory.speakersAndTelevisions;
}

uint64_t static UmbrellaCategory.speakersAndTelevisions.getter()
{
  return 16;
}

uint64_t static UmbrellaCategory.water.getter()
{
  return 32;
}

void sub_100021A80()
{
  static UmbrellaCategory.allCategories = (uint64_t)&off_1000376C0;
}

uint64_t *UmbrellaCategory.allCategories.unsafeMutableAddressor()
{
  if (qword_10003D628 != -1)
    swift_once(&qword_10003D628, sub_100021A80);
  return &static UmbrellaCategory.allCategories;
}

uint64_t static UmbrellaCategory.allCategories.getter()
{
  if (qword_10003D628 != -1)
    swift_once(&qword_10003D628, sub_100021A80);
  return swift_bridgeObjectRetain(static UmbrellaCategory.allCategories);
}

uint64_t sub_100021B14@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = sub_100022178(a1);
  result = swift_bridgeObjectRelease(a1);
  *a2 = v4;
  return result;
}

uint64_t UmbrellaCategory.iconColorBase.getter(uint64_t a1)
{
  uint64_t result;

  switch(a1)
  {
    case 1:
      result = static Color.gray.getter();
      break;
    case 2:
      result = static Color.purple.getter();
      break;
    case 4:
      result = static Color.yellow.getter();
      break;
    case 8:
      result = static Color.teal.getter();
      break;
    case 16:
      result = static Color.green.getter();
      break;
    case 32:
      result = static Color.cyan.getter();
      break;
    default:
      result = static Color.black.getter();
      break;
  }
  return result;
}

uint64_t UmbrellaCategory.localizedDescription.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = a1 - 1;
  result = 0x73646E696C42;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      result = 0x6574616D696C43;
      break;
    case 3:
      result = 0x746867694CLL;
      break;
    case 7:
      result = 0x7974697275636553;
      break;
    case 15:
      result = 0x7372656B61657053;
      break;
    case 31:
      result = 0x7265746157;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t UmbrellaCategory.pluralLocalizedDescription.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = a1 - 1;
  result = 0x73646E696C42;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      result = 0x6574616D696C43;
      break;
    case 3:
      result = 0x73746867694CLL;
      break;
    case 7:
      result = 0x7974697275636553;
      break;
    case 15:
      result = 0x7372656B61657053;
      break;
    case 31:
      result = 0x7265746157;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t UmbrellaCategory.accessoryLocalizedDescription.getter(uint64_t a1)
{
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t result;
  uint64_t v7;
  _BYTE v8[16];

  type metadata accessor for Locale(0);
  __chkstk_darwin();
  v3 = &v8[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin();
  v5 = &v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  result = 0x73646E696C42;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      result = 0xD000000000000011;
      break;
    case 4:
      v7 = String.LocalizationValue.init(stringLiteral:)(0xD00000000000001DLL, 0x800000010002D6B0);
      static Locale.current.getter(v7);
      result = String.init(localized:table:bundle:locale:comment:)(v5, 0xD00000000000001DLL, 0x800000010002CB10, 0, v3, 0, 0, 256);
      break;
    case 8:
      result = 0xD000000000000012;
      break;
    case 16:
      result = 0x2072656B61657053;
      break;
    case 32:
      result = 0x65766C6156;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t UmbrellaCategory.accessoryPluralLocalizedDescription.getter(uint64_t a1)
{
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t result;
  uint64_t v7;
  _BYTE v8[16];

  type metadata accessor for Locale(0);
  __chkstk_darwin();
  v3 = &v8[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin();
  v5 = &v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  result = 0x73646E696C42;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      result = 0xD000000000000013;
      break;
    case 4:
      v7 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000023, 0x800000010002D710);
      static Locale.current.getter(v7);
      result = String.init(localized:table:bundle:locale:comment:)(v5, 0xD00000000000001DLL, 0x800000010002CB10, 0, v3, 0, 0, 256);
      break;
    case 8:
      result = 0xD000000000000014;
      break;
    case 16:
      result = 0x7372656B61657053;
      break;
    case 32:
      result = 0x7365766C6156;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

unint64_t sub_100022048()
{
  unint64_t result;

  result = qword_10003DDF0;
  if (!qword_10003DDF0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for UmbrellaCategory, &type metadata for UmbrellaCategory);
    atomic_store(result, (unint64_t *)&qword_10003DDF0);
  }
  return result;
}

unint64_t sub_100022090()
{
  unint64_t result;

  result = qword_10003DDF8;
  if (!qword_10003DDF8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for UmbrellaCategory, &type metadata for UmbrellaCategory);
    atomic_store(result, (unint64_t *)&qword_10003DDF8);
  }
  return result;
}

unint64_t sub_1000220D8()
{
  unint64_t result;

  result = qword_10003DE00;
  if (!qword_10003DE00)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for UmbrellaCategory, &type metadata for UmbrellaCategory);
    atomic_store(result, (unint64_t *)&qword_10003DE00);
  }
  return result;
}

unint64_t sub_100022120()
{
  unint64_t result;

  result = qword_10003DE08;
  if (!qword_10003DE08)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for UmbrellaCategory, &type metadata for UmbrellaCategory);
    atomic_store(result, (unint64_t *)&qword_10003DE08);
  }
  return result;
}

ValueMetadata *type metadata accessor for UmbrellaCategory()
{
  return &type metadata for UmbrellaCategory;
}

uint64_t sub_100022178(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  result = 0;
  v4 = (uint64_t *)(a1 + 32);
  do
  {
    v6 = *v4++;
    v5 = v6;
    if ((v6 & ~result) == 0)
      v5 = 0;
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

void *AppPreferences.homeSensingDefaultsChangedNotification.unsafeMutableAddressor()
{
  return &static AppPreferences.homeSensingDefaultsChangedNotification;
}

uint64_t sub_1000221BC(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  __objc2_prot_list *v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _DWORD *v19;
  unint64_t v20;
  uint64_t (*v21)(char *, uint64_t, uint64_t);
  int v22;
  int v23;
  BOOL v24;
  _DWORD *v25;
  uint64_t v26;
  os_log_type_t v27;
  uint8_t *v28;
  _QWORD *v29;
  __objc2_prot_list *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  Class v37;
  objc_class *v38;
  objc_class *v39;
  id v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _DWORD *v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  id v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  os_log_type_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  void (*v64)(char *, uint64_t);
  uint64_t v65;
  Class v66;
  objc_class *i;
  objc_class *v68;
  id v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  objc_class *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  objc_class *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t result;
  uint8_t *v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  NSObject *v92;
  uint64_t v93;

  v2 = type metadata accessor for UUID(0);
  v89 = *(_QWORD *)(v2 - 8);
  v3 = __chkstk_darwin(v2);
  v5 = (char *)&v85 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v7 = (char *)&v85 - v6;
  v8 = sub_10000D3B8(&qword_10003DE10);
  v9 = __chkstk_darwin(v8);
  v11 = (char *)&v85 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v85 - v12;
  v14 = &DataModel;
  v15 = objc_msgSend(a1, "homes");
  v16 = sub_100024238();
  v17 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v15, v16);

  if (v17 < 0 || (v17 & 0x4000000000000000) != 0)
  {
    v73 = swift_bridgeObjectRetain(v17);
    v18 = (uint64_t)sub_10001464C(v73);
    swift_bridgeObjectRelease(v17);
  }
  else
  {
    v18 = v17 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v17);
  }
  v88 = v7;
  v92 = v18;
  v19 = 0;
  sub_100023124((uint64_t *)&v92);
  swift_bridgeObjectRelease(v17);
  v20 = (unint64_t)v92;
  if ((sub_100024288() & 1) != 0)
    goto LABEL_7;
  sub_100022E78((uint64_t)v13);
  v21 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v89 + 48);
  v22 = v21(v13, 1, v2);
  v87 = v2;
  v23 = v22;
  sub_100024344((uint64_t)v13);
  v24 = v23 == 1;
  v2 = v87;
  if (v24)
  {
LABEL_7:
    v25 = objc_msgSend(a1, "currentHome");
    if (v25)
    {
      v19 = v25;
      swift_release(v20);
      if (qword_10003D5F0 != -1)
        swift_once(&qword_10003D5F0, sub_100013BA4);
      v26 = type metadata accessor for Logger(0);
      sub_100012570(v26, (uint64_t)static DataModel.widgetLogger);
      v14 = v19;
      v20 = Logger.logObject.getter(v14);
      v27 = static os_log_type_t.default.getter();
      if (os_log_type_enabled((os_log_t)v20, v27))
      {
        v28 = (uint8_t *)swift_slowAlloc(12, -1);
        v29 = (_QWORD *)swift_slowAlloc(8, -1);
        *(_DWORD *)v28 = 138412290;
        v92 = v14;
        v30 = v14;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v92, &v93, v28 + 4, v28 + 12);
        *v29 = v19;

        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v20, v27, "Using Home Sensing, home is %@", v28, 0xCu);
        v31 = sub_10000D3B8(&qword_10003DBB0);
        swift_arrayDestroy(v29, 1, v31);
        swift_slowDealloc(v29, -1, -1);
        swift_slowDealloc(v28, -1, -1);

        return (uint64_t)v19;
      }
      goto LABEL_29;
    }
    if (qword_10003D5F0 != -1)
      swift_once(&qword_10003D5F0, sub_100013BA4);
    v32 = type metadata accessor for Logger(0);
    sub_100012570(v32, (uint64_t)static DataModel.widgetLogger);
    v33 = swift_retain_n(v20, 2);
    v34 = Logger.logObject.getter(v33);
    v14 = (__objc2_prot_list *)static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v34, (os_log_type_t)v14))
    {

      swift_release_n(v20, 2);
      v36 = v20 & 0x4000000000000000;
      goto LABEL_52;
    }
    v19 = (_DWORD *)swift_slowAlloc(12, -1);
    v35 = swift_slowAlloc(32, -1);
    v92 = v35;
    *v19 = 136315138;
    v36 = v20 & 0x4000000000000000;
    if ((v20 & 0x8000000000000000) != 0 || v36)
    {
      v74 = swift_retain(v20);
      if (_CocoaArrayWrapper.endIndex.getter(v74))
        goto LABEL_18;
    }
    else
    {
      v37 = *(Class *)(v20 + 16);
      swift_retain(v20);
      if (v37)
      {
LABEL_18:
        if ((v20 & 0xC000000000000001) != 0)
        {
          v38 = (objc_class *)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v20);
        }
        else
        {
          if (!*(_QWORD *)(v20 + 16))
          {
            __break(1u);
            goto LABEL_67;
          }
          v38 = (objc_class *)*(id *)(v20 + 32);
        }
        v39 = v38;
        swift_release(v20);
        v40 = -[objc_class name](v39, "name");

        v41 = static String._unconditionallyBridgeFromObjectiveC(_:)(v40);
        v43 = v42;

        goto LABEL_51;
      }
    }
    v41 = 1701736302;
    swift_release(v20);
    v43 = 0xE400000000000000;
LABEL_51:
    v90 = sub_100013F1C(v41, v43, (uint64_t *)&v92);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v90, &v91, v19 + 1, v19 + 3);
    swift_release_n(v20, 2);
    swift_bridgeObjectRelease(v43);
    _os_log_impl((void *)&_mh_execute_header, v34, (os_log_type_t)v14, "Using Home Sensing, no 'currentHome' was found from HomeKit, falling back to %s)", (uint8_t *)v19, 0xCu);
    swift_arrayDestroy(v35, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v35, -1, -1);
    swift_slowDealloc(v19, -1, -1);

LABEL_52:
    if ((v20 & 0x8000000000000000) != 0 || v36)
    {
      v76 = swift_bridgeObjectRetain(v20);
      v77 = _CocoaArrayWrapper.endIndex.getter(v76);
      swift_release(v20);
      if (!v77)
        goto LABEL_64;
    }
    else if (!*(_QWORD *)(v20 + 16))
    {
      goto LABEL_64;
    }
    if ((v20 & 0xC000000000000001) != 0)
      goto LABEL_61;
    if (*(_QWORD *)(v20 + 16))
    {
LABEL_57:
      v75 = (objc_class *)*(id *)(v20 + 32);
LABEL_58:
      v19 = v75;
      swift_release(v20);
      return (uint64_t)v19;
    }
    __break(1u);
    goto LABEL_63;
  }
  sub_100022E78((uint64_t)v11);
  if (v21(v11, 1, v2) == 1)
  {
    sub_100024344((uint64_t)v11);
    if ((v20 & 0x8000000000000000) == 0 && (v20 & 0x4000000000000000) == 0)
    {
      if (*(_QWORD *)(v20 + 16))
        goto LABEL_26;
      goto LABEL_64;
    }
LABEL_63:
    v78 = swift_bridgeObjectRetain(v20);
    v79 = _CocoaArrayWrapper.endIndex.getter(v78);
    swift_release(v20);
    if (v79)
    {
LABEL_26:
      if ((v20 & 0xC000000000000001) == 0)
      {
        if (!*(_QWORD *)(v20 + 16))
        {
          __break(1u);
LABEL_29:

          return (uint64_t)v19;
        }
        goto LABEL_57;
      }
LABEL_61:
      v75 = (objc_class *)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v20);
      goto LABEL_58;
    }
LABEL_64:
    swift_release(v20);
    return 0;
  }
  v35 = (uint64_t)v88;
  v36 = v89;
  (*(void (**)(char *, char *, uint64_t))(v89 + 32))(v88, v11, v2);
  v44 = objc_msgSend(a1, "homes");
  v45 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v44, v16);

  __chkstk_darwin(v46);
  *(&v85 - 2) = (uint8_t *)v35;
  v19 = sub_100022D40(sub_100024384, (uint64_t)(&v85 - 4), v45);
  swift_bridgeObjectRelease(v45);
  if (v19)
  {
    swift_release(v20);
    if (qword_10003D5F0 == -1)
    {
LABEL_33:
      v47 = type metadata accessor for Logger(0);
      sub_100012570(v47, (uint64_t)static DataModel.widgetLogger);
      v48 = v19;
      v49 = Logger.logObject.getter(v48);
      v50 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v49, v50))
      {
        v51 = (uint8_t *)swift_slowAlloc(12, -1);
        v86 = swift_slowAlloc(32, -1);
        v92 = v86;
        *(_DWORD *)v51 = 136315138;
        v85 = v51 + 4;
        v52 = objc_msgSend(v48, "name");
        v53 = static String._unconditionallyBridgeFromObjectiveC(_:)(v52);
        v55 = v54;

        v2 = v87;
        v90 = sub_100013F1C(v53, v55, (uint64_t *)&v92);
        v36 = v89;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v90, &v91, v85, v51 + 12);

        swift_bridgeObjectRelease(v55);
        _os_log_impl((void *)&_mh_execute_header, v49, v50, "Home.app has locked home to '%s', using that one.", v51, 0xCu);
        v56 = v86;
        swift_arrayDestroy(v86, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v56, -1, -1);
        swift_slowDealloc(v51, -1, -1);

      }
      else
      {

      }
      (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v35, v2);
      return (uint64_t)v19;
    }
LABEL_67:
    swift_once(&qword_10003D5F0, sub_100013BA4);
    goto LABEL_33;
  }
  if (qword_10003D5F0 != -1)
    swift_once(&qword_10003D5F0, sub_100013BA4);
  v57 = type metadata accessor for Logger(0);
  sub_100012570(v57, (uint64_t)static DataModel.widgetLogger);
  (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v5, v35, v2);
  v58 = swift_retain_n(v20, 2);
  v59 = Logger.logObject.getter(v58);
  v60 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v59, v60))
  {
    v64 = *(void (**)(char *, uint64_t))(v36 + 8);
    v64(v5, v2);

    swift_release_n(v20, 2);
    v65 = v20 & 0x4000000000000000;
    goto LABEL_71;
  }
  v45 = swift_slowAlloc(22, -1);
  v14 = (__objc2_prot_list *)swift_slowAlloc(64, -1);
  v92 = v14;
  *(_DWORD *)v45 = 136315394;
  v61 = UUID.uuidString.getter();
  v63 = v62;
  v90 = sub_100013F1C(v61, v62, (uint64_t *)&v92);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v90, &v91, v45 + 4, v45 + 12);
  swift_bridgeObjectRelease(v63);
  v64 = *(void (**)(char *, uint64_t))(v36 + 8);
  v64(v5, v87);
  *(_WORD *)(v45 + 12) = 2080;
  v65 = v20 & 0x4000000000000000;
  if ((v20 & 0x8000000000000000) != 0 || v65)
  {
    v80 = swift_retain(v20);
    if (_CocoaArrayWrapper.endIndex.getter(v80))
      goto LABEL_41;
LABEL_69:
    v70 = 1701736302;
    swift_release(v20);
    v72 = 0xE400000000000000;
    goto LABEL_70;
  }
  v66 = *(Class *)(v20 + 16);
  swift_retain(v20);
  if (!v66)
    goto LABEL_69;
LABEL_41:
  if ((v20 & 0xC000000000000001) != 0)
    goto LABEL_84;
  if (!*(_QWORD *)(v20 + 16))
  {
    __break(1u);
    result = swift_release(v92);
    __break(1u);
    return result;
  }
  for (i = (objc_class *)*(id *)(v20 + 32);
        ;
        i = (objc_class *)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v20))
  {
    v68 = i;
    swift_release(v20);
    v69 = -[objc_class name](v68, "name");

    v70 = static String._unconditionallyBridgeFromObjectiveC(_:)(v69);
    v72 = v71;

LABEL_70:
    v90 = sub_100013F1C(v70, v72, (uint64_t *)&v92);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v90, &v91, v45 + 14, v45 + 22);
    swift_release_n(v20, 2);
    swift_bridgeObjectRelease(v72);
    _os_log_impl((void *)&_mh_execute_header, v59, v60, "Home.app has locked home to uuid '%s' but it wasn't found, falling back to %s)", (uint8_t *)v45, 0x16u);
    swift_arrayDestroy(v14, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v14, -1, -1);
    swift_slowDealloc(v45, -1, -1);

    v2 = v87;
LABEL_71:
    if ((v20 & 0x8000000000000000) != 0 || v65)
      break;
    if (!*(_QWORD *)(v20 + 16))
      goto LABEL_79;
LABEL_74:
    if ((v20 & 0xC000000000000001) != 0)
    {
      v81 = (objc_class *)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v20);
      goto LABEL_77;
    }
    if (*(_QWORD *)(v20 + 16))
    {
      v81 = (objc_class *)*(id *)(v20 + 32);
LABEL_77:
      v19 = v81;
      swift_release(v20);
      goto LABEL_80;
    }
    __break(1u);
LABEL_84:
    ;
  }
  v82 = swift_bridgeObjectRetain(v20);
  v83 = _CocoaArrayWrapper.endIndex.getter(v82);
  swift_release(v20);
  if (v83)
    goto LABEL_74;
LABEL_79:
  swift_release(v20);
  v19 = 0;
LABEL_80:
  v64(v88, v2);
  return (uint64_t)v19;
}

void *AppPreferences.selectedHomeChangedNotification.unsafeMutableAddressor()
{
  return &static AppPreferences.selectedHomeChangedNotification;
}

void *sub_100022D40(uint64_t (*a1)(id *), uint64_t a2, uint64_t a3)
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

void *AppPreferences.homeSharedDefaultsSuite.unsafeMutableAddressor()
{
  return &static AppPreferences.homeSharedDefaultsSuite;
}

void *AppPreferences.isHomeSensingEnabledKey.unsafeMutableAddressor()
{
  return &static AppPreferences.isHomeSensingEnabledKey;
}

uint64_t sub_100022E78@<X0>(uint64_t a1@<X8>)
{
  id v2;
  NSString v3;
  id v4;
  NSString v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v2 = objc_allocWithZone((Class)NSUserDefaults);
  v3 = String._bridgeToObjectiveC()();
  v4 = objc_msgSend(v2, "initWithSuiteName:", v3);

  if (v4
    && (v5 = String._bridgeToObjectiveC()(),
        v6 = objc_msgSend(v4, "stringForKey:", v5),
        v4,
        v5,
        v6))
  {
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
    v9 = v8;

    UUID.init(uuidString:)(v7, v9);
    return swift_bridgeObjectRelease(v9);
  }
  else
  {
    v11 = type metadata accessor for UUID(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(a1, 1, 1, v11);
  }
}

void *AppPreferences.nanoHomeSyncDomain.unsafeMutableAddressor()
{
  return &static AppPreferences.nanoHomeSyncDomain;
}

void *AppPreferences.selectedHomeKey.unsafeMutableAddressor()
{
  return &static AppPreferences.selectedHomeKey;
}

uint64_t sub_100022FAC(id *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v10;

  v4 = type metadata accessor for UUID(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_msgSend(*a1, "uniqueIdentifier");
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  LOBYTE(a2) = static UUID.== infix(_:_:)(v7, a2);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return a2 & 1;
}

unint64_t static AppPreferences.homeSharedDefaultsSuite.getter()
{
  return 0xD000000000000014;
}

unint64_t static AppPreferences.isHomeSensingEnabledKey.getter()
{
  return 0xD000000000000014;
}

unint64_t static AppPreferences.homeSensingDefaultsChangedNotification.getter()
{
  return 0xD000000000000021;
}

unint64_t static AppPreferences.selectedHomeChangedNotification.getter()
{
  return 0xD000000000000022;
}

unint64_t static AppPreferences.nanoHomeSyncDomain.getter()
{
  return 0xD000000000000017;
}

unint64_t static AppPreferences.selectedHomeKey.getter()
{
  return 0xD000000000000011;
}

ValueMetadata *type metadata accessor for AppPreferences()
{
  return &type metadata for AppPreferences;
}

uint64_t sub_100023124(uint64_t *a1)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7[2];

  v2 = *a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*a1);
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v2 = sub_100024274(v2);
    *a1 = v2;
  }
  v4 = *(_QWORD *)(v2 + 16);
  v7[0] = v2 + 32;
  v7[1] = v4;
  sub_10002319C(v7);
  return specialized ContiguousArray._endMutation()(v5);
}

void sub_10002319C(uint64_t *a1)
{
  uint64_t v1;
  Swift::Int v3;
  Swift::Int v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  Swift::Int v10;
  uint64_t v11;
  __objc2_prot_list *v12;
  Swift::Int v13;
  unint64_t v14;
  Swift::Int v15;
  void *v16;
  id v17;
  id v18;
  unsigned int v19;
  unsigned int v20;
  Swift::Int v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  Swift::Int v31;
  unsigned int v32;
  void *v33;
  id v34;
  id v35;
  unsigned int v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v46;
  char v47;
  uint64_t *v48;
  Swift::Int v49;
  Swift::Int v50;
  uint64_t *v51;
  uint64_t v52;
  Swift::Int v53;
  uint64_t v54;
  void *v55;
  Swift::Int v56;
  uint64_t v57;
  void *v58;
  id v59;
  id v60;
  unsigned __int8 v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char v71;
  void *v72;
  unint64_t v73;
  unint64_t v74;
  char *v75;
  char *v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  BOOL v88;
  unint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  BOOL v98;
  uint64_t v99;
  char v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  BOOL v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  char *v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  char *v121;
  unint64_t v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  uint64_t v127;
  unint64_t v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  char *v132;
  char *v133;
  char *v134;
  unint64_t v135;
  char *v136;
  uint64_t v137;
  uint64_t *v138;
  uint64_t v139;
  Swift::Int v140;
  char *v141;
  char *v142;
  Swift::Int v143;
  Swift::Int v144;
  Swift::Int v145;
  unsigned int v146;
  uint64_t v147;
  void **v148;
  uint64_t v149;
  Swift::Int v150;
  Swift::Int v151;
  Swift::Int v152;
  Swift::Int v153;
  uint64_t v154;

  v3 = a1[1];
  v4 = _minimumMergeRunLength(_:)(v3);
  if (v4 >= v3)
  {
    if (v3 < 0)
      goto LABEL_160;
    if (v3)
      sub_10001517C(0, v3, 1, a1);
    return;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_168;
  v140 = v4;
  v145 = v3;
  v138 = a1;
  if (v3 < 2)
  {
    v9 = (char *)_swiftEmptyArrayStorage;
    v154 = (uint64_t)_swiftEmptyArrayStorage;
    v148 = (void **)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v3 != 1)
    {
      v14 = _swiftEmptyArrayStorage[2];
LABEL_123:
      if (v14 >= 2)
      {
        v127 = *v138;
        do
        {
          v128 = v14 - 2;
          if (v14 < 2)
            goto LABEL_155;
          if (!v127)
            goto LABEL_167;
          v117 = v9;
          v129 = v9 + 32;
          v130 = *(_QWORD *)&v9[16 * v128 + 32];
          v131 = *(_QWORD *)&v9[16 * v14 + 24];
          sub_100023BA4((void **)(v127 + 8 * v130), (id *)(v127 + 8 * *(_QWORD *)&v129[16 * v14 - 16]), v127 + 8 * v131, v148);
          if (v1)
            goto LABEL_135;
          if (v131 < v130)
            goto LABEL_156;
          if ((swift_isUniquelyReferenced_nonNull_native(v117) & 1) == 0)
            v117 = sub_100024224((uint64_t)v117);
          if (v128 >= *((_QWORD *)v117 + 2))
            goto LABEL_157;
          v132 = v117;
          v133 = v117 + 32;
          v134 = &v117[16 * v128 + 32];
          *(_QWORD *)v134 = v130;
          *((_QWORD *)v134 + 1) = v131;
          v135 = *((_QWORD *)v117 + 2);
          if (v14 > v135)
            goto LABEL_158;
          v9 = v132;
          memmove(&v133[16 * v14 - 16], &v133[16 * v14], 16 * (v135 - v14));
          *((_QWORD *)v9 + 2) = v135 - 1;
          v14 = v135 - 1;
        }
        while (v135 > 2);
      }
      v136 = v9;
LABEL_137:
      v137 = swift_bridgeObjectRelease(v136);
      *(_QWORD *)((v154 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
      specialized Array._endMutation()(v137);
      swift_bridgeObjectRelease(v154);
      return;
    }
  }
  else
  {
    v6 = v5 >> 1;
    v7 = sub_100024238();
    v8 = static Array._allocateBufferUninitialized(minimumCapacity:)(v6, v7);
    *(_QWORD *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10) = v6;
    v148 = (void **)((v8 & 0xFFFFFFFFFFFFFF8) + 32);
    v154 = v8;
  }
  v10 = 0;
  v11 = *a1;
  v139 = *a1 - 8;
  v9 = (char *)_swiftEmptyArrayStorage;
  v12 = &DataModel;
  v13 = v145;
  v149 = *a1;
  while (1)
  {
    v15 = v10++;
    if (v10 >= v13)
      goto LABEL_50;
    v141 = v9;
    v16 = *(void **)(v11 + 8 * v15);
    v17 = *(id *)(v11 + 8 * v10);
    v18 = v16;
    v19 = objc_msgSend(v17, (SEL)v12[356].count);
    if (v19 == objc_msgSend(v18, (SEL)v12[356].count))
    {
      v150 = v10;
      v22 = objc_msgSend(v17, "name");
      v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
      v25 = v24;

      v26 = objc_msgSend(v18, "name");
      v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(v26);
      v29 = v28;

      if (v23 == v27 && v25 == v29)
      {
        v20 = 0;
        v29 = v25;
      }
      else
      {
        v20 = _stringCompareWithSmolCheck(_:_:expecting:)(v23, v25, v27, v29, 1);
      }
      swift_bridgeObjectRelease(v25);
      swift_bridgeObjectRelease(v29);

      v21 = v15 + 2;
      v12 = &DataModel;
      v10 = v150;
      if (v15 + 2 < v145)
      {
LABEL_27:
        v31 = v21;
        v11 = v149;
        v146 = v20;
        do
        {
          v21 = v31;
          v33 = *(void **)(v11 + 8 * v10);
          v34 = *(id *)(v11 + 8 * v31);
          v35 = v33;
          v36 = objc_msgSend(v34, (SEL)v12[356].count);
          if (v36 == objc_msgSend(v35, (SEL)v12[356].count))
          {
            v151 = v21;
            v37 = objc_msgSend(v34, "name");
            v38 = static String._unconditionallyBridgeFromObjectiveC(_:)(v37);
            v40 = v39;

            v41 = objc_msgSend(v35, "name");
            v42 = static String._unconditionallyBridgeFromObjectiveC(_:)(v41);
            v44 = v43;

            if (v38 == v42 && v40 == v44)
            {

              swift_bridgeObjectRelease_n(v40, 2);
              v12 = &DataModel;
              v21 = v151;
              v20 = v146;
              if ((v146 & 1) != 0)
              {
                v9 = v141;
                v11 = v149;
                goto LABEL_41;
              }
            }
            else
            {
              v46 = _stringCompareWithSmolCheck(_:_:expecting:)(v38, v40, v42, v44, 1);

              swift_bridgeObjectRelease(v40);
              swift_bridgeObjectRelease(v44);
              v47 = v146 ^ v46;
              v20 = v146;
              v12 = &DataModel;
              v21 = v151;
              if ((v47 & 1) != 0)
                goto LABEL_19;
            }
          }
          else
          {
            v32 = objc_msgSend(v34, (SEL)v12[356].count);

            if (((v20 ^ v32) & 1) != 0)
              goto LABEL_19;
          }
          v31 = v21 + 1;
          v10 = v21;
          v11 = v149;
        }
        while (v21 + 1 < v145);
        ++v21;
        goto LABEL_40;
      }
    }
    else
    {
      v20 = objc_msgSend(v17, (SEL)v12[356].count);

      v21 = v15 + 2;
      if (v15 + 2 < v145)
        goto LABEL_27;
    }
    LOBYTE(v146) = v20;
LABEL_19:
    v11 = v149;
LABEL_40:
    v10 = v21;
    v9 = v141;
    if ((v146 & 1) != 0)
    {
LABEL_41:
      if (v21 < v15)
        goto LABEL_161;
      if (v15 < v21)
      {
        v48 = (uint64_t *)(v139 + 8 * v21);
        v49 = v21;
        v50 = v15;
        v51 = (uint64_t *)(v11 + 8 * v15);
        do
        {
          if (v50 != --v49)
          {
            if (!v11)
              goto LABEL_166;
            v52 = *v51;
            *v51 = *v48;
            *v48 = v52;
          }
          ++v50;
          --v48;
          ++v51;
        }
        while (v50 < v49);
      }
      v10 = v21;
    }
LABEL_50:
    if (v10 >= v145)
      goto LABEL_74;
    if (__OFSUB__(v10, v15))
      goto LABEL_159;
    if (v10 - v15 >= v140)
      goto LABEL_74;
    if (__OFADD__(v15, v140))
      goto LABEL_162;
    v53 = v145;
    if (v15 + v140 < v145)
      v53 = v15 + v140;
    if (v53 < v15)
      break;
    if (v10 == v53)
      goto LABEL_74;
    v142 = v9;
    v143 = v53;
    v54 = v139 + 8 * v10;
    v144 = v15;
    while (2)
    {
      v55 = *(void **)(v11 + 8 * v10);
      v56 = v15;
      v147 = v54;
      v57 = v54;
      v152 = v10;
      while (1)
      {
        v58 = *(void **)v57;
        v59 = v55;
        v60 = v58;
        LODWORD(v58) = objc_msgSend(v59, (SEL)v12[356].count);
        if ((_DWORD)v58 == objc_msgSend(v60, (SEL)v12[356].count))
          break;
        v61 = objc_msgSend(v59, (SEL)v12[356].count);

        if ((v61 & 1) == 0)
          goto LABEL_60;
LABEL_70:
        if (!v11)
          goto LABEL_164;
        v72 = *(void **)v57;
        v55 = *(void **)(v57 + 8);
        *(_QWORD *)v57 = v55;
        *(_QWORD *)(v57 + 8) = v72;
        v57 -= 8;
        if (v10 == ++v56)
          goto LABEL_60;
      }
      v62 = objc_msgSend(v59, "name");
      v63 = static String._unconditionallyBridgeFromObjectiveC(_:)(v62);
      v65 = v64;

      v66 = objc_msgSend(v60, "name");
      v67 = static String._unconditionallyBridgeFromObjectiveC(_:)(v66);
      v69 = v68;

      if (v63 != v67 || v65 != v69)
      {
        v71 = _stringCompareWithSmolCheck(_:_:expecting:)(v63, v65, v67, v69, 1);

        swift_bridgeObjectRelease(v65);
        swift_bridgeObjectRelease(v69);
        v11 = v149;
        v10 = v152;
        v12 = &DataModel;
        if ((v71 & 1) == 0)
          goto LABEL_60;
        goto LABEL_70;
      }

      swift_bridgeObjectRelease_n(v65, 2);
      v11 = v149;
      v10 = v152;
      v12 = &DataModel;
LABEL_60:
      ++v10;
      v54 = v147 + 8;
      v15 = v144;
      if (v10 != v143)
        continue;
      break;
    }
    v10 = v143;
    v9 = v142;
LABEL_74:
    if (v10 < v15)
      goto LABEL_154;
    if ((swift_isUniquelyReferenced_nonNull_native(v9) & 1) == 0)
      v9 = sub_100024080(0, *((_QWORD *)v9 + 2) + 1, 1, v9);
    v74 = *((_QWORD *)v9 + 2);
    v73 = *((_QWORD *)v9 + 3);
    v14 = v74 + 1;
    if (v74 >= v73 >> 1)
      v9 = sub_100024080((char *)(v73 > 1), v74 + 1, 1, v9);
    *((_QWORD *)v9 + 2) = v14;
    v75 = v9 + 32;
    v76 = &v9[16 * v74 + 32];
    *(_QWORD *)v76 = v15;
    *((_QWORD *)v76 + 1) = v10;
    if (v74)
    {
      v153 = v10;
      while (1)
      {
        v77 = v14 - 1;
        if (v14 >= 4)
        {
          v82 = &v75[16 * v14];
          v83 = *((_QWORD *)v82 - 8);
          v84 = *((_QWORD *)v82 - 7);
          v88 = __OFSUB__(v84, v83);
          v85 = v84 - v83;
          if (v88)
            goto LABEL_143;
          v87 = *((_QWORD *)v82 - 6);
          v86 = *((_QWORD *)v82 - 5);
          v88 = __OFSUB__(v86, v87);
          v80 = v86 - v87;
          v81 = v88;
          if (v88)
            goto LABEL_144;
          v89 = v14 - 2;
          v90 = &v75[16 * v14 - 32];
          v92 = *(_QWORD *)v90;
          v91 = *((_QWORD *)v90 + 1);
          v88 = __OFSUB__(v91, v92);
          v93 = v91 - v92;
          if (v88)
            goto LABEL_146;
          v88 = __OFADD__(v80, v93);
          v94 = v80 + v93;
          if (v88)
            goto LABEL_149;
          if (v94 >= v85)
          {
            v112 = &v75[16 * v77];
            v114 = *(_QWORD *)v112;
            v113 = *((_QWORD *)v112 + 1);
            v88 = __OFSUB__(v113, v114);
            v115 = v113 - v114;
            if (v88)
              goto LABEL_153;
            v105 = v80 < v115;
            goto LABEL_112;
          }
        }
        else
        {
          if (v14 != 3)
          {
            v106 = *((_QWORD *)v9 + 4);
            v107 = *((_QWORD *)v9 + 5);
            v88 = __OFSUB__(v107, v106);
            v99 = v107 - v106;
            v100 = v88;
            goto LABEL_106;
          }
          v79 = *((_QWORD *)v9 + 4);
          v78 = *((_QWORD *)v9 + 5);
          v88 = __OFSUB__(v78, v79);
          v80 = v78 - v79;
          v81 = v88;
        }
        if ((v81 & 1) != 0)
          goto LABEL_145;
        v89 = v14 - 2;
        v95 = &v75[16 * v14 - 32];
        v97 = *(_QWORD *)v95;
        v96 = *((_QWORD *)v95 + 1);
        v98 = __OFSUB__(v96, v97);
        v99 = v96 - v97;
        v100 = v98;
        if (v98)
          goto LABEL_148;
        v101 = &v75[16 * v77];
        v103 = *(_QWORD *)v101;
        v102 = *((_QWORD *)v101 + 1);
        v88 = __OFSUB__(v102, v103);
        v104 = v102 - v103;
        if (v88)
          goto LABEL_151;
        if (__OFADD__(v99, v104))
          goto LABEL_152;
        if (v99 + v104 >= v80)
        {
          v105 = v80 < v104;
LABEL_112:
          if (v105)
            v77 = v89;
          goto LABEL_114;
        }
LABEL_106:
        if ((v100 & 1) != 0)
          goto LABEL_147;
        v108 = &v75[16 * v77];
        v110 = *(_QWORD *)v108;
        v109 = *((_QWORD *)v108 + 1);
        v88 = __OFSUB__(v109, v110);
        v111 = v109 - v110;
        if (v88)
          goto LABEL_150;
        if (v111 < v99)
          goto LABEL_14;
LABEL_114:
        v116 = v77 - 1;
        if (v77 - 1 >= v14)
        {
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
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
LABEL_154:
          __break(1u);
LABEL_155:
          __break(1u);
LABEL_156:
          __break(1u);
LABEL_157:
          __break(1u);
LABEL_158:
          __break(1u);
LABEL_159:
          __break(1u);
LABEL_160:
          __break(1u);
LABEL_161:
          __break(1u);
LABEL_162:
          __break(1u);
          goto LABEL_163;
        }
        if (!v11)
          goto LABEL_165;
        v117 = v9;
        v118 = v11;
        v119 = &v75[16 * v116];
        v120 = *(_QWORD *)v119;
        v121 = v75;
        v122 = v77;
        v123 = &v75[16 * v77];
        v124 = *((_QWORD *)v123 + 1);
        v125 = v118;
        sub_100023BA4((void **)(v118 + 8 * *(_QWORD *)v119), (id *)(v118 + 8 * *(_QWORD *)v123), v118 + 8 * v124, v148);
        if (v1)
        {
LABEL_135:
          v136 = v117;
          goto LABEL_137;
        }
        if (v124 < v120)
          goto LABEL_140;
        if (v122 > *((_QWORD *)v117 + 2))
          goto LABEL_141;
        *(_QWORD *)v119 = v120;
        *(_QWORD *)&v121[16 * v116 + 8] = v124;
        v126 = *((_QWORD *)v117 + 2);
        if (v122 >= v126)
          goto LABEL_142;
        v9 = v117;
        v14 = v126 - 1;
        memmove(v123, v123 + 16, 16 * (v126 - 1 - v122));
        v75 = v121;
        *((_QWORD *)v117 + 2) = v126 - 1;
        v12 = &DataModel;
        v10 = v153;
        v11 = v125;
        if (v126 <= 2)
          goto LABEL_14;
      }
    }
    v14 = 1;
LABEL_14:
    v13 = v145;
    if (v10 >= v145)
      goto LABEL_123;
  }
LABEL_163:
  __break(1u);
LABEL_164:
  __break(1u);
LABEL_165:
  __break(1u);
LABEL_166:
  __break(1u);
LABEL_167:
  __break(1u);
LABEL_168:
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Can't construct Array with count < 0", 36, 2, "Swift/Array.swift", 17);
  __break(1u);
}

uint64_t sub_100023BA4(void **__src, id *a2, unint64_t a3, void **__dst)
{
  void **v4;
  id *v5;
  void **v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void **v13;
  __objc2_prot_list *v14;
  void *v15;
  id v16;
  id v17;
  unsigned __int8 v18;
  id *v19;
  void **v20;
  void **v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v31;
  void **v32;
  void **v33;
  __objc2_prot_list *v34;
  id *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  unsigned int v41;
  unsigned __int8 v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v51;
  uint64_t result;
  void **v53;
  void **v54;
  uint64_t v55;
  void **v56;
  id *v57;
  void **v59;
  id *v60;
  id *v61;
  void **v62;
  void **v63;
  id *v64;

  v4 = __dst;
  v5 = a2;
  v6 = __src;
  v7 = (char *)a2 - (char *)__src;
  v8 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0)
    v8 = (char *)a2 - (char *)__src;
  v9 = v8 >> 3;
  v10 = a3 - (_QWORD)a2;
  v11 = a3 - (_QWORD)a2 + 7;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v11 = a3 - (_QWORD)a2;
  v12 = v11 >> 3;
  v64 = __src;
  v63 = __dst;
  if (v9 >= v11 >> 3)
  {
    if (v10 < -7)
      goto LABEL_61;
    if (__dst != a2 || &a2[v12] <= __dst)
      memmove(__dst, a2, 8 * v12);
    v32 = &v4[v12];
    v62 = v32;
    v64 = v5;
    if (v6 >= v5 || v10 < 8)
    {
LABEL_60:
      sub_10002417C((void **)&v64, (const void **)&v63, &v62);
      return 1;
    }
    v33 = (void **)(a3 - 8);
    v34 = &DataModel;
    v35 = v5;
    v53 = v6;
    v54 = v4;
    while (1)
    {
      v59 = v32;
      v61 = v5;
      v57 = v33 + 1;
      v37 = *--v32;
      v36 = v37;
      v38 = *--v35;
      v39 = v36;
      v40 = v38;
      v41 = objc_msgSend(v39, (SEL)v34[356].count);
      if (v41 == objc_msgSend(v40, (SEL)v34[356].count))
      {
        v43 = objc_msgSend(v39, "name");
        v44 = static String._unconditionallyBridgeFromObjectiveC(_:)(v43);
        v55 = v45;

        v46 = objc_msgSend(v40, "name");
        v47 = static String._unconditionallyBridgeFromObjectiveC(_:)(v46);
        v49 = v48;

        if (v44 == v47 && v55 == v49)
        {

          swift_bridgeObjectRelease_n(v55, 2);
          v6 = v53;
          v4 = v54;
          v34 = &DataModel;
        }
        else
        {
          v51 = _stringCompareWithSmolCheck(_:_:expecting:)(v44, v55, v47, v49, 1);

          swift_bridgeObjectRelease(v55);
          swift_bridgeObjectRelease(v49);
          v6 = v53;
          v4 = v54;
          v34 = &DataModel;
          if ((v51 & 1) != 0)
          {
LABEL_47:
            v32 = v59;
            if (v57 != v61 || v33 >= v61)
              *v33 = *v35;
            v64 = v35;
            goto LABEL_56;
          }
        }
      }
      else
      {
        v42 = objc_msgSend(v39, (SEL)v34[356].count);

        if ((v42 & 1) != 0)
          goto LABEL_47;
      }
      v62 = v32;
      v35 = v61;
      if (v57 < v59 || v33 >= v59 || v57 != v59)
        *v33 = *v32;
LABEL_56:
      if (v35 > v6)
      {
        --v33;
        v5 = v35;
        if (v32 > v4)
          continue;
      }
      goto LABEL_60;
    }
  }
  if (v7 >= -7)
  {
    if (__dst != __src || &__src[v9] <= __dst)
      memmove(__dst, __src, 8 * v9);
    v13 = &v4[v9];
    v62 = v13;
    if ((unint64_t)v5 < a3 && v7 >= 8)
    {
      v14 = &DataModel;
      v56 = v13;
      while (1)
      {
        v15 = *v4;
        v16 = *v5;
        v17 = v15;
        LODWORD(v15) = objc_msgSend(v16, (SEL)v14[356].count);
        if ((_DWORD)v15 == objc_msgSend(v17, (SEL)v14[356].count))
        {
          v60 = v5;
          v20 = v6;
          v21 = v4;
          v22 = objc_msgSend(v16, "name");
          v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
          v25 = v24;

          v26 = objc_msgSend(v17, "name");
          v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(v26);
          v29 = v28;

          if (v23 == v27 && v25 == v29)
          {

            swift_bridgeObjectRelease_n(v25, 2);
            v4 = v21;
            v6 = v20;
            v5 = v60;
            v13 = v56;
            v14 = &DataModel;
            if (v6 == v4)
              goto LABEL_17;
LABEL_16:
            *v6 = *v4;
            goto LABEL_17;
          }
          v31 = _stringCompareWithSmolCheck(_:_:expecting:)(v23, v25, v27, v29, 1);

          swift_bridgeObjectRelease(v25);
          swift_bridgeObjectRelease(v29);
          v4 = v21;
          v6 = v20;
          v5 = v60;
          v13 = v56;
          v14 = &DataModel;
          if ((v31 & 1) != 0)
          {
LABEL_23:
            v19 = v5 + 1;
            if (v6 < v5 || v6 >= v19 || v6 != v5)
              *v6 = *v5;
            goto LABEL_27;
          }
        }
        else
        {
          v18 = objc_msgSend(v16, (SEL)v14[356].count);

          if ((v18 & 1) != 0)
            goto LABEL_23;
        }
        if (v6 != v4)
          goto LABEL_16;
LABEL_17:
        v63 = ++v4;
        v19 = v5;
LABEL_27:
        ++v6;
        if (v4 < v13)
        {
          v5 = v19;
          if ((unint64_t)v19 < a3)
            continue;
        }
        v64 = v6;
        goto LABEL_60;
      }
    }
    goto LABEL_60;
  }
LABEL_61:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
  __break(1u);
  return result;
}

char *sub_100024080(char *result, int64_t a2, char a3, char *a4)
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
    v10 = sub_10000D3B8(&qword_10003DE18);
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
    memcpy(v14, v15, 16 * v8);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

char *sub_10002417C(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;
  char v9;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 7;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -8)
  {
    v9 = 2;
    result = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v9, 1046, 0);
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
      return (char *)memmove(result, v3, 8 * v7);
  }
  return result;
}

char *sub_100024224(uint64_t a1)
{
  return sub_100024080(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

unint64_t sub_100024238()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003DB18;
  if (!qword_10003DB18)
  {
    v1 = objc_opt_self(HMHome);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10003DB18);
  }
  return result;
}

uint64_t sub_100024274(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t sub_100024288()
{
  id v0;
  NSString v1;
  id v2;
  NSString v3;
  id v4;

  v0 = objc_allocWithZone((Class)NSUserDefaults);
  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend(v0, "initWithSuiteName:", v1);

  if (!v2)
    return 1;
  v3 = String._bridgeToObjectiveC()();
  v4 = objc_msgSend(v2, "BOOLForKey:", v3);

  return (uint64_t)v4;
}

uint64_t sub_100024344(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10000D3B8(&qword_10003DE10);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100024384(id *a1)
{
  uint64_t v1;

  return sub_100022FAC(a1, *(_QWORD *)(v1 + 16)) & 1;
}

id SecurityAccessoryConfigurationIntent.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SecurityAccessoryConfigurationIntent();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for SecurityAccessoryConfigurationIntent()
{
  return objc_opt_self(SecurityAccessoryConfigurationIntent);
}

id SecurityIntentAccessory.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), "initWithCoder:", a1);

  return v3;
}

id SecurityAccessoryConfigurationIntent.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SecurityAccessoryConfigurationIntent();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id SecurityAccessoryConfigurationIntent.__deallocating_deinit()
{
  return sub_100024914(type metadata accessor for SecurityAccessoryConfigurationIntent);
}

unint64_t SecurityAccessoryConfigurationIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_100024944(a1);
}

unint64_t sub_100024524@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_100024944(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t SecurityAccessoryConfigurationIntentResponse.code.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR___SecurityAccessoryConfigurationIntentResponse_code;
  swift_beginAccess(v0 + OBJC_IVAR___SecurityAccessoryConfigurationIntentResponse_code, v3, 0, 0);
  return *(_QWORD *)v1;
}

char *SecurityAccessoryConfigurationIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  char *v7;
  char v9[24];

  v5 = (char *)objc_msgSend(objc_allocWithZone(v2), "init");
  v6 = &v5[OBJC_IVAR___SecurityAccessoryConfigurationIntentResponse_code];
  swift_beginAccess(&v5[OBJC_IVAR___SecurityAccessoryConfigurationIntentResponse_code], v9, 1, 0);
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, "setUserActivity:", a2);

  return v7;
}

char *SecurityAccessoryConfigurationIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  void *v2;
  char *v5;
  char *v6;
  char *v7;
  char v9[24];

  v5 = (char *)objc_msgSend(v2, "init");
  v6 = &v5[OBJC_IVAR___SecurityAccessoryConfigurationIntentResponse_code];
  swift_beginAccess(&v5[OBJC_IVAR___SecurityAccessoryConfigurationIntentResponse_code], v9, 1, 0);
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, "setUserActivity:", a2);

  return v7;
}

id SecurityAccessoryConfigurationIntentResponse.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR___SecurityAccessoryConfigurationIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SecurityAccessoryConfigurationIntentResponse();
  return objc_msgSendSuper2(&v2, "init");
}

id SecurityAccessoryConfigurationIntentResponse.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___SecurityAccessoryConfigurationIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SecurityAccessoryConfigurationIntentResponse();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id SecurityAccessoryConfigurationIntentResponse.__deallocating_deinit()
{
  return sub_100024914(type metadata accessor for SecurityAccessoryConfigurationIntentResponse);
}

id sub_100024914(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

unint64_t sub_100024944(unint64_t result)
{
  if (result > 6)
    return 0;
  return result;
}

uint64_t type metadata accessor for SecurityAccessoryConfigurationIntentResponse()
{
  return objc_opt_self(SecurityAccessoryConfigurationIntentResponse);
}

unint64_t sub_100024978()
{
  unint64_t result;

  result = qword_10003DE28;
  if (!qword_10003DE28)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for SecurityAccessoryConfigurationIntentResponseCode, &type metadata for SecurityAccessoryConfigurationIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_10003DE28);
  }
  return result;
}

uint64_t sub_1000249BC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___SecurityAccessoryConfigurationIntentResponse_code);
  result = swift_beginAccess(v3, v5, 0, 0);
  *a2 = *v3;
  return result;
}

uint64_t sub_100024A0C(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___SecurityAccessoryConfigurationIntentResponse_code);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for SecurityAccessoryConfigurationIntentResponseCode()
{
  return &type metadata for SecurityAccessoryConfigurationIntentResponseCode;
}

id ClimateSensorTypeConfigurationIntent.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ClimateSensorTypeConfigurationIntent();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for ClimateSensorTypeConfigurationIntent()
{
  return objc_opt_self(ClimateSensorTypeConfigurationIntent);
}

id ClimateSensorTypeConfigurationIntent.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ClimateSensorTypeConfigurationIntent();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id ClimateSensorTypeConfigurationIntent.__deallocating_deinit()
{
  return sub_100024914(type metadata accessor for ClimateSensorTypeConfigurationIntent);
}

uint64_t ClimateSensorTypeConfigurationIntentResponse.code.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR___ClimateSensorTypeConfigurationIntentResponse_code;
  swift_beginAccess(v0 + OBJC_IVAR___ClimateSensorTypeConfigurationIntentResponse_code, v3, 0, 0);
  return *(_QWORD *)v1;
}

char *ClimateSensorTypeConfigurationIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  char *v7;
  char v9[24];

  v5 = (char *)objc_msgSend(objc_allocWithZone(v2), "init");
  v6 = &v5[OBJC_IVAR___ClimateSensorTypeConfigurationIntentResponse_code];
  swift_beginAccess(&v5[OBJC_IVAR___ClimateSensorTypeConfigurationIntentResponse_code], v9, 1, 0);
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, "setUserActivity:", a2);

  return v7;
}

char *ClimateSensorTypeConfigurationIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  void *v2;
  char *v5;
  char *v6;
  char *v7;
  char v9[24];

  v5 = (char *)objc_msgSend(v2, "init");
  v6 = &v5[OBJC_IVAR___ClimateSensorTypeConfigurationIntentResponse_code];
  swift_beginAccess(&v5[OBJC_IVAR___ClimateSensorTypeConfigurationIntentResponse_code], v9, 1, 0);
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, "setUserActivity:", a2);

  return v7;
}

id ClimateSensorTypeConfigurationIntentResponse.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR___ClimateSensorTypeConfigurationIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ClimateSensorTypeConfigurationIntentResponse();
  return objc_msgSendSuper2(&v2, "init");
}

id ClimateSensorTypeConfigurationIntentResponse.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___ClimateSensorTypeConfigurationIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ClimateSensorTypeConfigurationIntentResponse();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id ClimateSensorTypeConfigurationIntentResponse.__deallocating_deinit()
{
  return sub_100024914(type metadata accessor for ClimateSensorTypeConfigurationIntentResponse);
}

uint64_t type metadata accessor for ClimateSensorTypeConfigurationIntentResponse()
{
  return objc_opt_self(ClimateSensorTypeConfigurationIntentResponse);
}

unint64_t sub_100024F7C()
{
  unint64_t result;

  result = qword_10003DE88;
  if (!qword_10003DE88)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ClimateSensorTypeConfigurationIntentResponseCode, &type metadata for ClimateSensorTypeConfigurationIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_10003DE88);
  }
  return result;
}

uint64_t sub_100024FC0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___ClimateSensorTypeConfigurationIntentResponse_code);
  result = swift_beginAccess(v3, v5, 0, 0);
  *a2 = *v3;
  return result;
}

uint64_t sub_100025010(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___ClimateSensorTypeConfigurationIntentResponse_code);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for ClimateSensorTypeConfigurationIntentResponseCode()
{
  return &type metadata for ClimateSensorTypeConfigurationIntentResponseCode;
}

id SecurityIntentAccessory.__allocating_init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_class *v6;
  NSString v10;
  NSString v11;
  NSString v12;
  id v13;

  if (a2)
  {
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v10 = 0;
  }
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  if (a6)
  {
    v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a6);
  }
  else
  {
    v12 = 0;
  }
  v13 = objc_msgSend(objc_allocWithZone(v6), "initWithIdentifier:displayString:pronunciationHint:", v10, v11, v12);

  return v13;
}

id SecurityIntentAccessory.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v6;
  NSString v10;
  NSString v11;
  NSString v12;
  id v13;
  objc_super v15;

  if (a2)
  {
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v10 = 0;
  }
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  if (a6)
  {
    v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a6);
  }
  else
  {
    v12 = 0;
  }
  v15.receiver = v6;
  v15.super_class = (Class)type metadata accessor for SecurityIntentAccessory();
  v13 = objc_msgSendSuper2(&v15, "initWithIdentifier:displayString:pronunciationHint:", v10, v11, v12);

  return v13;
}

uint64_t type metadata accessor for SecurityIntentAccessory()
{
  return objc_opt_self(SecurityIntentAccessory);
}

id SecurityIntentAccessory.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SecurityIntentAccessory();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id SecurityIntentAccessory.__deallocating_deinit()
{
  return sub_100024914(type metadata accessor for SecurityIntentAccessory);
}

id static SecurityIntentAccessoryResolutionResult.success(with:)(uint64_t a1)
{
  uint64_t v1;
  objc_super v4;

  v4.receiver = (id)swift_getObjCClassFromMetadata(v1);
  v4.super_class = (Class)&OBJC_METACLASS___SecurityIntentAccessoryResolutionResult;
  return objc_msgSendSuper2(&v4, "successWithResolvedObject:", a1);
}

id static SecurityIntentAccessoryResolutionResult.disambiguation(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *ObjCClassFromMetadata;
  Class isa;
  id v7;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  objc_super v12;

  v2 = v1;
  v3 = a1;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v9 = a1;
    else
      v9 = a1 & 0xFFFFFFFFFFFFFF8;
    v10 = sub_1000254F4();
    swift_bridgeObjectRetain(v3);
    v11 = _bridgeCocoaArray<A>(_:)(v9, v10);
    swift_bridgeObjectRelease(v3);
    v3 = v11;
  }
  else
  {
    v4 = swift_bridgeObjectRetain(a1);
    dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter(v4);
    sub_1000254F4();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata(v2);
  sub_1000254F4();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  v12.receiver = ObjCClassFromMetadata;
  v12.super_class = (Class)&OBJC_METACLASS___SecurityIntentAccessoryResolutionResult;
  v7 = objc_msgSendSuper2(&v12, "disambiguationWithObjectsToDisambiguate:", isa);

  return v7;
}

unint64_t sub_1000254F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003DF08;
  if (!qword_10003DF08)
  {
    v1 = objc_opt_self(INObject);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10003DF08);
  }
  return result;
}

id static SecurityIntentAccessoryResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  uint64_t v1;
  objc_super v4;

  v4.receiver = (id)swift_getObjCClassFromMetadata(v1);
  v4.super_class = (Class)&OBJC_METACLASS___SecurityIntentAccessoryResolutionResult;
  return objc_msgSendSuper2(&v4, "confirmationRequiredWithObjectToConfirm:", a1);
}

void static SecurityIntentAccessoryResolutionResult.success(with:)()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "HomeWidgetSingleAccessoryIntent/SecurityIntentAccessory.swift", 61, 2, 47, 0);
  __break(1u);
}

void static SecurityIntentAccessoryResolutionResult.disambiguation(with:)()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "HomeWidgetSingleAccessoryIntent/SecurityIntentAccessory.swift", 61, 2, 52, 0);
  __break(1u);
}

void static SecurityIntentAccessoryResolutionResult.confirmationRequired(with:)()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "HomeWidgetSingleAccessoryIntent/SecurityIntentAccessory.swift", 61, 2, 57, 0);
  __break(1u);
}

id SecurityIntentAccessoryResolutionResult.__deallocating_deinit()
{
  return sub_100024914(type metadata accessor for SecurityIntentAccessoryResolutionResult);
}

uint64_t type metadata accessor for SecurityIntentAccessoryResolutionResult()
{
  return objc_opt_self(SecurityIntentAccessoryResolutionResult);
}

id ClimateSensorIntentType.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v6;
  NSString v10;
  NSString v11;
  NSString v12;
  id v13;
  objc_super v15;

  if (a2)
  {
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v10 = 0;
  }
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  if (a6)
  {
    v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a6);
  }
  else
  {
    v12 = 0;
  }
  v15.receiver = v6;
  v15.super_class = (Class)type metadata accessor for ClimateSensorIntentType();
  v13 = objc_msgSendSuper2(&v15, "initWithIdentifier:displayString:pronunciationHint:", v10, v11, v12);

  return v13;
}

uint64_t type metadata accessor for ClimateSensorIntentType()
{
  return objc_opt_self(ClimateSensorIntentType);
}

id ClimateSensorIntentType.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ClimateSensorIntentType();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id ClimateSensorIntentType.__deallocating_deinit()
{
  return sub_100024914(type metadata accessor for ClimateSensorIntentType);
}

id static ClimateSensorIntentTypeResolutionResult.success(with:)(uint64_t a1)
{
  uint64_t v1;
  objc_super v4;

  v4.receiver = (id)swift_getObjCClassFromMetadata(v1);
  v4.super_class = (Class)&OBJC_METACLASS___ClimateSensorIntentTypeResolutionResult;
  return objc_msgSendSuper2(&v4, "successWithResolvedObject:", a1);
}

id static ClimateSensorIntentTypeResolutionResult.disambiguation(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *ObjCClassFromMetadata;
  Class isa;
  id v7;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  objc_super v12;

  v2 = v1;
  v3 = a1;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v9 = a1;
    else
      v9 = a1 & 0xFFFFFFFFFFFFFF8;
    v10 = sub_1000254F4();
    swift_bridgeObjectRetain(v3);
    v11 = _bridgeCocoaArray<A>(_:)(v9, v10);
    swift_bridgeObjectRelease(v3);
    v3 = v11;
  }
  else
  {
    v4 = swift_bridgeObjectRetain(a1);
    dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter(v4);
    sub_1000254F4();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata(v2);
  sub_1000254F4();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  v12.receiver = ObjCClassFromMetadata;
  v12.super_class = (Class)&OBJC_METACLASS___ClimateSensorIntentTypeResolutionResult;
  v7 = objc_msgSendSuper2(&v12, "disambiguationWithObjectsToDisambiguate:", isa);

  return v7;
}

id static ClimateSensorIntentTypeResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  uint64_t v1;
  objc_super v4;

  v4.receiver = (id)swift_getObjCClassFromMetadata(v1);
  v4.super_class = (Class)&OBJC_METACLASS___ClimateSensorIntentTypeResolutionResult;
  return objc_msgSendSuper2(&v4, "confirmationRequiredWithObjectToConfirm:", a1);
}

void static ClimateSensorIntentTypeResolutionResult.success(with:)()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "HomeWidgetSingleAccessoryIntent/ClimateSensorIntentType.swift", 61, 2, 47, 0);
  __break(1u);
}

void static ClimateSensorIntentTypeResolutionResult.disambiguation(with:)()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "HomeWidgetSingleAccessoryIntent/ClimateSensorIntentType.swift", 61, 2, 52, 0);
  __break(1u);
}

void static ClimateSensorIntentTypeResolutionResult.confirmationRequired(with:)()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "HomeWidgetSingleAccessoryIntent/ClimateSensorIntentType.swift", 61, 2, 57, 0);
  __break(1u);
}

id ClimateSensorIntentTypeResolutionResult.__deallocating_deinit()
{
  return sub_100024914(type metadata accessor for ClimateSensorIntentTypeResolutionResult);
}

uint64_t type metadata accessor for ClimateSensorIntentTypeResolutionResult()
{
  return objc_opt_self(ClimateSensorIntentTypeResolutionResult);
}
