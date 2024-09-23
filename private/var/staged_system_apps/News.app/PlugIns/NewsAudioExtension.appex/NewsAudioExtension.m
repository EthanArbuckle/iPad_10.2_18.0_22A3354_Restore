id sub_100002928@<X0>(void *a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;
  void *v3;
  uint64_t ObjectType;
  uint64_t v7;
  id result;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  Swift::String v13;
  id v14;

  v3 = v2;
  v14 = v3;
  ObjectType = swift_getObjectType(v3);
  v7 = objc_opt_self(INPlayMediaIntent);
  if (swift_dynamicCastObjCClass(a1, v7))
  {
    a2[3] = ObjectType;
    *a2 = v14;
    return v14;
  }
  else
  {
    _StringGuts.grow(_:)(25);
    swift_bridgeObjectRelease(0xE000000000000000);
    v9 = objc_msgSend(a1, "description");
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v12 = v11;

    v13._countAndFlagsBits = v10;
    v13._object = v12;
    String.append(_:)(v13);
    swift_bridgeObjectRelease(v12);
    result = (id)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000017, 0x8000000100003900, "NewsAudioExtension/IntentHandler.swift", 38, 2, 20, 0);
    __break(1u);
  }
  return result;
}

void sub_100002AC0()
{
  void *v0;
  id v1;
  void *v2;
  int64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v1 = objc_msgSend(v0, "mediaItems");
  if (v1)
  {
    v2 = v1;
    v3 = sub_100003588();
    v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v2, v3);

    if ((unint64_t)v4 >> 62)
    {
      if (v4 < 0)
        v25 = v4;
      else
        v25 = v4 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v4);
      v26 = _CocoaArrayWrapper.endIndex.getter(v25);
      swift_bridgeObjectRelease(v4);
      if (v26)
        goto LABEL_4;
    }
    else if (*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_4:
      if ((v4 & 0xC000000000000001) != 0)
      {
        v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v4);
      }
      else
      {
        if (!*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_37;
        }
        v5 = *(id *)(v4 + 32);
      }
      v6 = v5;
      swift_bridgeObjectRelease(v4);
      v7 = objc_msgSend(v6, "identifier");
      if (!v7)
      {

        goto LABEL_20;
      }
      v8 = v7;
      v9 = ((uint64_t (*)(void))static String._unconditionallyBridgeFromObjectiveC(_:))();
      v4 = v10;

      if ((sub_1000030BC(65, 0xE100000000000000, v9, v4) & 1) != 0)
      {
        swift_bridgeObjectRelease(v4);

        v11 = objc_msgSend(v0, "mediaItems");
        v12 = v11;
        if (!v11)
          return;
        v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v11, v3);

        if (!((unint64_t)v3 >> 62))
        {
          if (*(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_12;
          goto LABEL_41;
        }
LABEL_37:
        if (v3 < 0)
          v27 = v3;
        else
          v27 = v3 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v3);
        v28 = _CocoaArrayWrapper.endIndex.getter(v27);
        swift_bridgeObjectRelease(v3);
        if (v28)
        {
LABEL_12:
          if ((v3 & 0xC000000000000001) != 0)
          {
            v13 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v3);
          }
          else
          {
            if (!*(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
              return;
            }
            v13 = *(id *)(v3 + 32);
          }
          v14 = v13;
          swift_bridgeObjectRelease(v3);
          v15 = objc_msgSend(v14, "title");

          if (!v15)
            return;
LABEL_25:
          static String._unconditionallyBridgeFromObjectiveC(_:)(v15);

          return;
        }
LABEL_41:
        swift_bridgeObjectRelease(v3);
        return;
      }

    }
    swift_bridgeObjectRelease(v4);
  }
LABEL_20:
  v16 = objc_msgSend(v0, "mediaContainer");
  v17 = v16;
  if (!v16)
    return;
  v18 = objc_msgSend(v16, "identifier");
  if (!v18)
  {

    return;
  }
  v19 = v18;
  v20 = ((uint64_t (*)(void))static String._unconditionallyBridgeFromObjectiveC(_:))();
  v22 = v21;

  if ((sub_1000030BC(65, 0xE100000000000000, v20, v22) & 1) == 0)
  {

    swift_bridgeObjectRelease(v22);
    return;
  }
  swift_bridgeObjectRelease(v22);

  v23 = objc_msgSend(v0, "mediaContainer");
  v24 = v23;
  if (v23)
  {
    v15 = objc_msgSend(v23, "title");

    if (v15)
      goto LABEL_25;
  }
}

unint64_t sub_100002DF4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t result;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000034F0(&qword_100008610);
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
    sub_100003530(v7, (uint64_t)&v16);
    v8 = v16;
    v9 = v17;
    result = sub_100003220(v16, v17);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v8;
    v12[1] = v9;
    result = (unint64_t)sub_100003578(&v18, (_OWORD *)(v4[7] + 32 * result));
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
    v7 += 48;
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

id sub_100003068()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for IntentHandler()
{
  return objc_opt_self(_TtC18NewsAudioExtension13IntentHandler);
}

uint64_t sub_1000030BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  Swift::String_optional v5;
  uint64_t countAndFlagsBits;
  void *object;
  char v8;
  Swift::String_optional v9;
  Swift::String_optional v10;
  void *v11;
  _BOOL8 v12;

  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(a4);
  v5 = String.Iterator.next()();
  if (v5.value._object)
  {
    countAndFlagsBits = v5.value._countAndFlagsBits;
    object = v5.value._object;
    do
    {
      v10 = String.Iterator.next()();
      if (!v10.value._object)
      {
        swift_bridgeObjectRelease(object);
        swift_bridgeObjectRelease(a4);
        swift_bridgeObjectRelease(a2);
        return 1;
      }
      if (countAndFlagsBits == v10.value._countAndFlagsBits && object == v10.value._object)
      {
        swift_bridgeObjectRelease(object);
        swift_bridgeObjectRelease(v10.value._object);
      }
      else
      {
        v8 = _stringCompareWithSmolCheck(_:_:expecting:)(countAndFlagsBits, object);
        swift_bridgeObjectRelease(object);
        swift_bridgeObjectRelease(v10.value._object);
        if ((v8 & 1) == 0)
        {
          swift_bridgeObjectRelease(a4);
          swift_bridgeObjectRelease(a2);
          return 0;
        }
      }
      v9 = String.Iterator.next()();
      countAndFlagsBits = v9.value._countAndFlagsBits;
      object = v9.value._object;
    }
    while (v9.value._object);
  }
  swift_bridgeObjectRelease(a4);
  v11 = String.Iterator.next()().value._object;
  swift_bridgeObjectRelease(a2);
  v12 = v11 == 0;
  swift_bridgeObjectRelease(v11);
  return v12;
}

unint64_t sub_100003220(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_100003284(a1, a2, v5);
}

unint64_t sub_100003284(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11) & 1) == 0)
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
      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15) & 1) == 0);
    }
  }
  return v6;
}

void sub_100003364(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t inited;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  Class isa;
  id v14;
  _BYTE v15[128];

  sub_100002AC0();
  if (v4)
  {
    v5 = v3;
    v6 = v4;
    v7 = objc_msgSend(objc_allocWithZone((Class)INPlayMediaIntentResponse), "initWithCode:userActivity:", 1, 0);
    v8 = sub_1000034F0(&qword_100008608);
    inited = swift_initStackObject(v8, v15);
    *(_OWORD *)(inited + 16) = xmmword_100003850;
    *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(MPMediaItemPropertyTitle);
    *(_QWORD *)(inited + 40) = v10;
    *(_QWORD *)(inited + 72) = &type metadata for String;
    *(_QWORD *)(inited + 48) = v5;
    *(_QWORD *)(inited + 56) = v6;
    *(_QWORD *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)(MPMediaItemPropertyMediaType);
    *(_QWORD *)(inited + 88) = v11;
    *(_QWORD *)(inited + 120) = &type metadata for UInt;
    *(_QWORD *)(inited + 96) = 2;
    v12 = sub_100002DF4(inited);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v12);
    objc_msgSend(v7, "setNowPlayingInfo:", isa);

    (*(void (**)(uint64_t, id))(a2 + 16))(a2, v7);
  }
  else
  {
    v14 = objc_msgSend(objc_allocWithZone((Class)INPlayMediaIntentResponse), "initWithCode:userActivity:", 6, 0);
    (*(void (**)(uint64_t, id))(a2 + 16))(a2, v14);

  }
}

uint64_t sub_1000034F0(uint64_t *a1)
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

uint64_t sub_100003530(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000034F0(&qword_100008618);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_100003578(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_100003588()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100008620;
  if (!qword_100008620)
  {
    v1 = objc_opt_self(INMediaItem);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100008620);
  }
  return result;
}

_QWORD *sub_1000035C4(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1000035E8(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}
