BOOL sub_1000054B8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_1000054CC()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100005510()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100005538(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_100005588(uint64_t a1, uint64_t a2, void (*a3)(__int128 *, uint64_t))
{
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  __int128 v14;
  uint64_t v15;
  _OWORD v16[2];

  sub_10000B77C(a1, (uint64_t)&v14, &qword_1000145B0);
  if (v15)
  {
    sub_10000B764(&v14, v16);
    if (qword_1000144B8 != -1)
      swift_once(&qword_1000144B8, sub_10000DB54);
    v5 = type metadata accessor for Logger(0);
    sub_10000B4A0(v5, (uint64_t)qword_1000156E0);
    v6 = Logger.logObject.getter();
    v7 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Returning values to AMS", v8, 2u);
      swift_slowDealloc(v8, -1, -1);
    }

    sub_10000B728((uint64_t)v16, (uint64_t)&v14);
    a3(&v14, 0);
    sub_10000B9EC((uint64_t)&v14, &qword_1000145B0);
    return sub_10000B430(v16);
  }
  else
  {
    sub_10000B9EC((uint64_t)&v14, &qword_1000145B0);
    if (qword_1000144B8 != -1)
      swift_once(&qword_1000144B8, sub_10000DB54);
    v10 = type metadata accessor for Logger(0);
    sub_10000B4A0(v10, (uint64_t)qword_1000156E0);
    v11 = Logger.logObject.getter();
    v12 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Tried to run command but no value was found", v13, 2u);
      swift_slowDealloc(v13, -1, -1);
    }

    memset(v16, 0, sizeof(v16));
    a3(v16, a2);
    return sub_10000B9EC((uint64_t)v16, &qword_1000145B0);
  }
}

void sub_10000582C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD v11[3];
  uint64_t v12;

  sub_10000B77C(a1, (uint64_t)v11, &qword_1000145B0);
  v5 = v12;
  if (!v12)
  {
    v10 = 0;
    if (!a2)
      goto LABEL_4;
    goto LABEL_3;
  }
  v6 = sub_10000B47C(v11, v12);
  v7 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  v10 = _bridgeAnythingToObjectiveC<A>(_:)(v9, v5);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
  sub_10000B430(v11);
  if (a2)
LABEL_3:
    a2 = (void *)_convertErrorToNSError(_:)(a2);
LABEL_4:
  (*(void (**)(uint64_t, uint64_t, void *))(a3 + 16))(a3, v10, a2);
  swift_unknownObjectRelease(v10);

}

unint64_t sub_10000593C(uint64_t a1)
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
  sub_10000B4FC(&qword_1000145D8);
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
    sub_10000B77C(v7, (uint64_t)&v16, &qword_1000145E8);
    v8 = v16;
    v9 = v17;
    result = sub_100009A9C(v16, v17);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v8;
    v12[1] = v9;
    result = (unint64_t)sub_10000B764(&v18, (_OWORD *)(v4[7] + 32 * result));
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

unint64_t sub_100005A70(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t result;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000B4FC(&qword_1000145E0);
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
  v6 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v7 = *(v6 - 2);
    v8 = *(v6 - 1);
    v9 = *v6;
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v9);
    result = sub_100009A9C(v7, v8);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v7;
    v12[1] = v8;
    *(_QWORD *)(v4[7] + 8 * result) = v9;
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
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

unint64_t sub_100005B88(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t *v7;
  uint64_t *v8;
  unint64_t result;
  int64_t i;
  uint64_t *v11;
  char *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  char *v16;
  uint64_t *v17;
  uint64_t *v18;
  _QWORD *v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  int64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t *v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  int64_t v37;
  uint64_t v38;
  int64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  _OWORD v47[2];

  v1 = a1;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    sub_10000B4FC(&qword_1000145D8);
    v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v2);
  }
  else
  {
    v3 = &_swiftEmptyDictionarySingleton;
  }
  v38 = v1 + 64;
  v4 = -1 << *(_BYTE *)(v1 + 32);
  if (-v4 < 64)
    v5 = ~(-1 << -(char)v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(v1 + 64);
  v37 = (unint64_t)(63 - v4) >> 6;
  v7 = &v44;
  v8 = &v46;
  result = swift_bridgeObjectRetain(v1);
  i = 0;
  v11 = (uint64_t *)&unk_1000145C0;
  v12 = (char *)&type metadata for Any + 8;
  if (v6)
    goto LABEL_10;
LABEL_11:
  v21 = i + 1;
  if (__OFADD__(i, 1))
    goto LABEL_35;
  if (v21 >= v37)
    goto LABEL_32;
  v22 = *(_QWORD *)(v38 + 8 * v21);
  v23 = i + 1;
  if (!v22)
  {
    v23 = i + 2;
    if (i + 2 >= v37)
      goto LABEL_32;
    v22 = *(_QWORD *)(v38 + 8 * v23);
    if (!v22)
    {
      v23 = i + 3;
      if (i + 3 >= v37)
        goto LABEL_32;
      v22 = *(_QWORD *)(v38 + 8 * v23);
      if (!v22)
      {
        v23 = i + 4;
        if (i + 4 >= v37)
          goto LABEL_32;
        v22 = *(_QWORD *)(v38 + 8 * v23);
        if (!v22)
        {
          v24 = i + 5;
          if (i + 5 < v37)
          {
            v22 = *(_QWORD *)(v38 + 8 * v24);
            if (v22)
            {
              v23 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              v23 = v24 + 1;
              if (__OFADD__(v24, 1))
                goto LABEL_36;
              if (v23 >= v37)
                break;
              v22 = *(_QWORD *)(v38 + 8 * v23);
              ++v24;
              if (v22)
                goto LABEL_26;
            }
          }
LABEL_32:
          sub_10000B774(v1);
          return (unint64_t)v3;
        }
      }
    }
  }
LABEL_26:
  v40 = (v22 - 1) & v22;
  v20 = __clz(__rbit64(v22)) + (v23 << 6);
  for (i = v23; ; v20 = __clz(__rbit64(v6)) | (i << 6))
  {
    v25 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v20);
    v26 = v25[1];
    v27 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8 * v20);
    v42 = *v25;
    v43 = v26;
    v41 = v27;
    swift_bridgeObjectRetain(v26);
    swift_bridgeObjectRetain(v27);
    v28 = sub_10000B4FC(v11);
    swift_dynamicCast(v7, &v41, v28, v12, 7);
    v29 = v42;
    v30 = v43;
    sub_10000B764(v7, v8);
    sub_10000B764(v8, v47);
    sub_10000B764(v47, &v45);
    result = sub_100009A9C(v29, v30);
    v31 = result;
    if ((v32 & 1) != 0)
    {
      v39 = i;
      v13 = v8;
      v14 = v7;
      v15 = v1;
      v16 = v12;
      v17 = v11;
      v18 = (uint64_t *)(v3[6] + 16 * result);
      swift_bridgeObjectRelease(v18[1]);
      *v18 = v29;
      v18[1] = v30;
      v11 = v17;
      v12 = v16;
      v1 = v15;
      v7 = v14;
      v8 = v13;
      i = v39;
      v19 = (_QWORD *)(v3[7] + 32 * v31);
      sub_10000B430(v19);
      result = (unint64_t)sub_10000B764(&v45, v19);
      v6 = v40;
      if (!v40)
        goto LABEL_11;
      goto LABEL_10;
    }
    if (v3[2] >= v3[3])
      break;
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v33 = (uint64_t *)(v3[6] + 16 * result);
    *v33 = v29;
    v33[1] = v30;
    result = (unint64_t)sub_10000B764(&v45, (_OWORD *)(v3[7] + 32 * result));
    v34 = v3[2];
    v35 = __OFADD__(v34, 1);
    v36 = v34 + 1;
    if (v35)
      goto LABEL_34;
    v3[2] = v36;
    v6 = v40;
    if (!v40)
      goto LABEL_11;
LABEL_10:
    v40 = (v6 - 1) & v6;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

id sub_100005F2C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BooksEngagementPluginProvider();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for BooksEngagementPluginProvider()
{
  return objc_opt_self(_TtC24BooksEngagementExtension29BooksEngagementPluginProvider);
}

uint64_t sub_100005F84(uint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(unint64_t *, _QWORD))
{
  uint64_t v5;
  uint64_t inited;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  char *v33;
  uint64_t *v34;
  char *v35;
  uint64_t v37;
  unint64_t v38;
  _QWORD v39[3];
  _BYTE v40[56];
  _BYTE v41[80];
  char *v42[5];

  if (a1)
  {
    sub_10000646C(a1, a1, v42);
    v5 = sub_10000B4FC(&qword_1000145C8);
    inited = swift_initStackObject(v5, v41);
    *(_OWORD *)(inited + 16) = xmmword_10000E1E0;
    *(_QWORD *)(inited + 32) = 0x65736E6F70736572;
    *(_QWORD *)(inited + 40) = 0xE800000000000000;
    sub_10000B728((uint64_t)v42, inited + 48);
    v7 = sub_10000593C(inited);
    v8 = sub_10000B4FC(&qword_1000145D0);
    v9 = swift_initStackObject(v8, v40);
    *(_OWORD *)(v9 + 16) = xmmword_10000E1E0;
    strcpy((char *)(v9 + 32), "json-payload");
    *(_BYTE *)(v9 + 45) = 0;
    *(_WORD *)(v9 + 46) = -5120;
    *(_QWORD *)(v9 + 48) = v7;
    v10 = sub_100005A70(v9);
    v11 = sub_100005B88(v10);
    swift_bridgeObjectRelease(v10);
    if (qword_1000144B8 != -1)
      swift_once(&qword_1000144B8, sub_10000DB54);
    v12 = type metadata accessor for Logger(0);
    v13 = sub_10000B4A0(v12, (uint64_t)qword_1000156E0);
    v14 = Logger.logObject.getter(v13);
    v15 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "PerformRequest: Sending value back to AMS", v16, 2u);
      swift_slowDealloc(v16, -1, -1);
    }

    v17 = swift_bridgeObjectRetain_n(v11, 2);
    v18 = Logger.logObject.getter(v17);
    v19 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc(12, -1);
      v21 = swift_slowAlloc(32, -1);
      v38 = v21;
      *(_DWORD *)v20 = 136315138;
      v22 = swift_bridgeObjectRetain(v11);
      v23 = Dictionary.description.getter(v22, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
      v25 = v24;
      swift_bridgeObjectRelease(v11);
      v37 = sub_10000945C(v23, v25, (uint64_t *)&v38);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v37, &v38, v20 + 4);
      swift_bridgeObjectRelease_n(v11, 2);
      swift_bridgeObjectRelease(v25);
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Plugin Response = %s", v20, 0xCu);
      swift_arrayDestroy(v21, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v21, -1, -1);
      swift_slowDealloc(v20, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v11, 2);
    }
    v39[2] = sub_10000B4FC(&qword_1000145C0);
    v38 = v11;
    a4(&v38, 0);
    sub_10000B430(v42);
    v34 = (uint64_t *)&v38;
  }
  else
  {
    if (qword_1000144B8 != -1)
      swift_once(&qword_1000144B8, sub_10000DB54);
    v28 = type metadata accessor for Logger(0);
    sub_10000B4A0(v28, (uint64_t)qword_1000156E0);
    v29 = swift_bridgeObjectRetain_n(a3, 2);
    v30 = Logger.logObject.getter(v29);
    v31 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc(12, -1);
      v33 = (char *)swift_slowAlloc(32, -1);
      v42[0] = v33;
      *(_DWORD *)v32 = 136315138;
      swift_bridgeObjectRetain(a3);
      v38 = sub_10000945C(a2, a3, (uint64_t *)v42);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v38, v39, v32 + 4);
      swift_bridgeObjectRelease_n(a3, 3);
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "Failed to get propertyValues for %s, returning empty response", v32, 0xCu);
      swift_arrayDestroy(v33, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v33, -1, -1);
      swift_slowDealloc(v32, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(a3, 2);
    }
    v35 = (char *)sub_10000B630();
    v42[3] = (char *)sub_10000B4FC(&qword_1000145C0);
    v42[0] = v35;
    a4((unint64_t *)v42, 0);
    v34 = (uint64_t *)v42;
  }
  return sub_10000B9EC((uint64_t)v34, &qword_1000145B0);
}

char *sub_10000646C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char **a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char **v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char *result;
  __int128 v36;
  uint64_t v37;
  _OWORD v38[2];
  __int128 v39;
  uint64_t v40;
  _OWORD v41[3];
  uint64_t v42[5];
  char v43;

  if (!a1 || !*(_QWORD *)(a1 + 16))
  {
    if (qword_1000144B8 != -1)
      swift_once(&qword_1000144B8, sub_10000DB54);
    v18 = type metadata accessor for Logger(0);
    v19 = sub_10000B4A0(v18, (uint64_t)qword_1000156E0);
    v20 = Logger.logObject.getter(v19);
    v21 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Engagement Property did not return any property value", v22, 2u);
      swift_slowDealloc(v22, -1, -1);
    }

    v23 = *(_QWORD *)(a2 + 16);
    if (v23)
    {
      v24 = a2 + 32;
      swift_bridgeObjectRetain(a2);
      v25 = (char *)&_swiftEmptyArrayStorage;
      do
      {
        sub_10000B7C0(v24, (uint64_t)v42);
        v26 = sub_10000B85C((uint64_t)v42, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000B7FC);
        PropertyValue.rawValue.getter(&v39, v26);
        sub_10000B85C((uint64_t)v42, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000B894);
        if (v40)
        {
          sub_10000B764(&v39, v41);
          sub_10000B764(v41, &v39);
          if ((swift_isUniquelyReferenced_nonNull_native(v25) & 1) == 0)
            v25 = sub_100009350(0, *((_QWORD *)v25 + 2) + 1, 1, v25);
          v28 = *((_QWORD *)v25 + 2);
          v27 = *((_QWORD *)v25 + 3);
          if (v28 >= v27 >> 1)
            v25 = sub_100009350((char *)(v27 > 1), v28 + 1, 1, v25);
          *((_QWORD *)v25 + 2) = v28 + 1;
          sub_10000B764(&v39, &v25[32 * v28 + 32]);
        }
        else
        {
          sub_10000B9EC((uint64_t)&v39, &qword_1000145B0);
        }
        v24 += 48;
        --v23;
      }
      while (v23);
      goto LABEL_33;
    }
LABEL_34:
    v25 = (char *)&_swiftEmptyArrayStorage;
    goto LABEL_35;
  }
  sub_10000B7C0(a1 + 32, (uint64_t)&v39);
  sub_10000B85C((uint64_t)&v39, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000B7FC);
  if (qword_1000144B8 != -1)
    swift_once(&qword_1000144B8, sub_10000DB54);
  v5 = type metadata accessor for Logger(0);
  sub_10000B4A0(v5, (uint64_t)qword_1000156E0);
  sub_10000B85C((uint64_t)&v39, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000B7FC);
  v6 = sub_10000B85C((uint64_t)&v39, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000B7FC);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc(12, -1);
    v10 = swift_slowAlloc(32, -1);
    v42[0] = v10;
    *(_DWORD *)v9 = 136315138;
    v11 = sub_10000B85C((uint64_t)&v39, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000B7FC);
    v12 = PropertyValue.description.getter(v11);
    v13 = a2;
    v14 = a3;
    v16 = v15;
    sub_10000B85C((uint64_t)&v39, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000B894);
    *(_QWORD *)&v41[0] = sub_10000945C(v12, v16, v42);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v41, (char *)v41 + 8, v9 + 4);
    v17 = v16;
    a3 = v14;
    a2 = v13;
    swift_bridgeObjectRelease(v17);
    sub_10000B85C((uint64_t)&v39, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000B894);
    sub_10000B85C((uint64_t)&v39, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000B894);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Engagement Property found a value of type: %s", v9, 0xCu);
    swift_arrayDestroy(v10, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1, -1);
    swift_slowDealloc(v9, -1, -1);
  }
  else
  {
    sub_10000B85C((uint64_t)&v39, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000B894);
    sub_10000B85C((uint64_t)&v39, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000B894);
  }

  v29 = sub_10000B7C0((uint64_t)&v39, (uint64_t)v42);
  if (v43)
  {
    sub_10000B85C((uint64_t)&v39, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000B894);
    v30 = *(_QWORD *)(a2 + 16);
    if (v30)
    {
      v31 = a2 + 32;
      swift_bridgeObjectRetain(a2);
      v25 = (char *)&_swiftEmptyArrayStorage;
      do
      {
        sub_10000B7C0(v31, (uint64_t)v41);
        v32 = sub_10000B85C((uint64_t)v41, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000B7FC);
        PropertyValue.rawValue.getter(&v36, v32);
        sub_10000B85C((uint64_t)v41, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000B894);
        if (v37)
        {
          sub_10000B764(&v36, v38);
          sub_10000B764(v38, &v36);
          if ((swift_isUniquelyReferenced_nonNull_native(v25) & 1) == 0)
            v25 = sub_100009350(0, *((_QWORD *)v25 + 2) + 1, 1, v25);
          v34 = *((_QWORD *)v25 + 2);
          v33 = *((_QWORD *)v25 + 3);
          if (v34 >= v33 >> 1)
            v25 = sub_100009350((char *)(v33 > 1), v34 + 1, 1, v25);
          *((_QWORD *)v25 + 2) = v34 + 1;
          sub_10000B764(&v36, &v25[32 * v34 + 32]);
        }
        else
        {
          sub_10000B9EC((uint64_t)&v36, &qword_1000145B0);
        }
        v31 += 48;
        --v30;
      }
      while (v30);
LABEL_33:
      swift_bridgeObjectRelease(a2);
LABEL_35:
      result = (char *)sub_10000B4FC(&qword_1000145F0);
      a3[3] = result;
      *a3 = v25;
      return result;
    }
    goto LABEL_34;
  }
  return (char *)PropertyValue.rawValue.getter(a3, v29);
}

uint64_t sub_1000069E0(uint64_t a1, void (*a2)(_QWORD, _QWORD), uint64_t a3)
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
  char *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  unint64_t v25;
  __int128 *v26;
  _QWORD *v27;
  void *v28;
  uint64_t v29;
  _QWORD *v30;
  void *v31;
  char *v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  NSString v38;
  void *v39;
  id v40;
  char *v41;
  void *v42;
  uint64_t v43;
  void (*v44)(char *, char *, uint64_t);
  uint64_t v45;
  char *v46;
  unsigned int (*v47)(uint64_t, uint64_t, uint64_t);
  char *v48;
  uint64_t v49;
  char *v50;
  char v51;
  unint64_t v52;
  unint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t inited;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  os_log_type_t v71;
  uint8_t *v72;
  uint64_t v73;
  NSObject *v74;
  os_log_type_t v75;
  uint8_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  uint64_t v82;
  id v83;
  _QWORD *v85;
  char *v86;
  char *v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void (*v92)(_QWORD, _QWORD);
  char *v93;
  char *v94;
  id v95;
  char *v96;
  __int128 v97;
  char v98[56];
  char v99[80];
  __int128 v100;
  uint64_t v101;
  __int128 v102;
  uint64_t v103;
  _QWORD v104[4];

  v90 = type metadata accessor for Calendar(0);
  v89 = *(_QWORD *)(v90 - 8);
  __chkstk_darwin(v90);
  v88 = (char *)&v85 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_10000B4FC(&qword_100014600);
  __chkstk_darwin(v7);
  v9 = (char *)&v85 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Date(0);
  *(_QWORD *)&v97 = *(_QWORD *)(v10 - 8);
  v11 = __chkstk_darwin(v10);
  v94 = (char *)&v85 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  if (a1)
  {
    v96 = v9;
    v86 = (char *)&v85 - v13;
    v95 = objc_msgSend(objc_allocWithZone((Class)NSISO8601DateFormatter), "init");
    v14 = *(_QWORD *)(a1 + 16);
    v92 = a2;
    v91 = a3;
    if (v14)
    {
      v93 = (char *)v10;
      v15 = a1 + 32;
      swift_bridgeObjectRetain(a1);
      v16 = (char *)&_swiftEmptyArrayStorage;
      do
      {
        sub_10000B7C0(v15, (uint64_t)v104);
        v17 = sub_10000B85C((uint64_t)v104, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000B7FC);
        PropertyValue.rawValue.getter(&v100, v17);
        sub_10000B85C((uint64_t)v104, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000B894);
        if (v101)
        {
          sub_10000B764(&v100, &v102);
          sub_10000B764(&v102, &v100);
          if ((swift_isUniquelyReferenced_nonNull_native(v16) & 1) == 0)
            v16 = sub_100009350(0, *((_QWORD *)v16 + 2) + 1, 1, v16);
          v19 = *((_QWORD *)v16 + 2);
          v18 = *((_QWORD *)v16 + 3);
          if (v19 >= v18 >> 1)
            v16 = sub_100009350((char *)(v18 > 1), v19 + 1, 1, v16);
          *((_QWORD *)v16 + 2) = v19 + 1;
          sub_10000B764(&v100, &v16[32 * v19 + 32]);
        }
        else
        {
          sub_10000B9EC((uint64_t)&v100, &qword_1000145B0);
        }
        v15 += 48;
        --v14;
      }
      while (v14);
      swift_bridgeObjectRelease(a1);
      a2 = v92;
      v10 = (uint64_t)v93;
    }
    else
    {
      v16 = (char *)&_swiftEmptyArrayStorage;
    }
    v27 = sub_100007514((uint64_t)v16);
    swift_bridgeObjectRelease(v16);
    v28 = v95;
    if (v27)
    {
      v29 = v27[2];
      v85 = v27;
      if (v29)
      {
        v30 = v27 + 4;
        v87 = (char *)&_swiftEmptyArrayStorage;
        v31 = &type metadata for String;
        v32 = (char *)&type metadata for Any + 8;
        v93 = (char *)&type metadata for Any + 8;
        while (1)
        {
          v33 = *v30;
          if (*(_QWORD *)(*v30 + 16))
          {
            swift_bridgeObjectRetain(*v30);
            v34 = sub_100009A9C(0x7461447472617473, 0xE900000000000065);
            if ((v35 & 1) != 0
              && (sub_10000B728(*(_QWORD *)(v33 + 56) + 32 * v34, (uint64_t)&v102),
                  (swift_dynamicCast(&v100, &v102, v32, v31, 6) & 1) != 0))
            {
              v36 = v10;
              v37 = *((_QWORD *)&v100 + 1);
              v38 = String._bridgeToObjectiveC()();
              swift_bridgeObjectRelease(v37);
              v39 = v28;
              v40 = objc_msgSend(v28, "dateFromString:", v38, v85);

              if (v40)
              {
                v41 = v94;
                static Date._unconditionallyBridgeFromObjectiveC(_:)(v40);

                v42 = v31;
                v43 = v97;
                v44 = *(void (**)(char *, char *, uint64_t))(v97 + 32);
                v45 = (uint64_t)v96;
                v46 = v41;
                v10 = v36;
                v44(v96, v46, v36);
                (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v43 + 56))(v45, 0, 1, v36);
                v47 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v43 + 48);
                v31 = v42;
                if (v47(v45, 1, v36) != 1)
                {
                  v48 = v86;
                  v49 = ((uint64_t (*)(char *, uint64_t, uint64_t))v44)(v86, v45, v36);
                  v50 = v88;
                  static Calendar.current.getter(v49);
                  v51 = Calendar.isDateInToday(_:)(v48);
                  (*(void (**)(char *, uint64_t))(v89 + 8))(v50, v90);
                  if ((v51 & 1) != 0)
                  {
                    v103 = sub_10000B4FC(&qword_1000145C0);
                    *(_QWORD *)&v102 = v33;
                    if ((swift_isUniquelyReferenced_nonNull_native(v87) & 1) == 0)
                      v87 = sub_100009350(0, *((_QWORD *)v87 + 2) + 1, 1, v87);
                    v10 = v36;
                    v28 = v95;
                    v31 = v42;
                    v53 = *((_QWORD *)v87 + 2);
                    v52 = *((_QWORD *)v87 + 3);
                    v32 = v93;
                    if (v53 >= v52 >> 1)
                      v87 = sub_100009350((char *)(v52 > 1), v53 + 1, 1, v87);
                    v54 = v87;
                    *((_QWORD *)v87 + 2) = v53 + 1;
                    sub_10000B764(&v102, &v54[32 * v53 + 32]);
                    (*(void (**)(char *, uint64_t))(v97 + 8))(v86, v36);
                  }
                  else
                  {
                    (*(void (**)(char *, uint64_t))(v97 + 8))(v48, v36);
                    swift_bridgeObjectRelease(v33);
                    v10 = v36;
                    v28 = v95;
                    v31 = v42;
                    v32 = v93;
                  }
                  goto LABEL_23;
                }
              }
              else
              {
                v45 = (uint64_t)v96;
                v10 = v36;
                (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v97 + 56))(v96, 1, 1, v36);
              }
              swift_bridgeObjectRelease(v33);
              sub_10000B9EC(v45, &qword_100014600);
              v32 = v93;
              v28 = v39;
            }
            else
            {
              swift_bridgeObjectRelease(v33);
            }
          }
LABEL_23:
          ++v30;
          if (!--v29)
            goto LABEL_44;
        }
      }
      v87 = (char *)&_swiftEmptyArrayStorage;
LABEL_44:
      swift_bridgeObjectRelease(v85);
      v103 = sub_10000B4FC(&qword_1000145F0);
      *(_QWORD *)&v102 = v87;
      v61 = sub_10000B4FC(&qword_1000145C8);
      inited = swift_initStackObject(v61, v99);
      v97 = xmmword_10000E1E0;
      *(_OWORD *)(inited + 16) = xmmword_10000E1E0;
      *(_QWORD *)(inited + 32) = 0x65736E6F70736572;
      *(_QWORD *)(inited + 40) = 0xE800000000000000;
      sub_10000B728((uint64_t)&v102, inited + 48);
      v63 = sub_10000593C(inited);
      v64 = sub_10000B4FC(&qword_1000145D0);
      v65 = swift_initStackObject(v64, v98);
      *(_OWORD *)(v65 + 16) = v97;
      strcpy((char *)(v65 + 32), "json-payload");
      *(_BYTE *)(v65 + 45) = 0;
      *(_WORD *)(v65 + 46) = -5120;
      *(_QWORD *)(v65 + 48) = v63;
      v66 = sub_100005A70(v65);
      v67 = sub_100005B88(v66);
      swift_bridgeObjectRelease(v66);
      sub_10000B430(&v102);
      if (qword_1000144B8 != -1)
        swift_once(&qword_1000144B8, sub_10000DB54);
      v68 = type metadata accessor for Logger(0);
      v69 = sub_10000B4A0(v68, (uint64_t)qword_1000156E0);
      v70 = Logger.logObject.getter(v69);
      v71 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v70, v71))
      {
        v72 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v72 = 0;
        _os_log_impl((void *)&_mh_execute_header, v70, v71, "PerformRequest: Sending value back to AMS", v72, 2u);
        swift_slowDealloc(v72, -1, -1);
      }

      v73 = swift_bridgeObjectRetain_n(v67, 2);
      v74 = Logger.logObject.getter(v73);
      v75 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v74, v75))
      {
        v76 = (uint8_t *)swift_slowAlloc(12, -1);
        v77 = swift_slowAlloc(32, -1);
        *(_QWORD *)&v102 = v77;
        *(_DWORD *)v76 = 136315138;
        v78 = swift_bridgeObjectRetain(v67);
        v79 = Dictionary.description.getter(v78, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
        v81 = v80;
        swift_bridgeObjectRelease(v67);
        v82 = v79;
        v83 = v95;
        *(_QWORD *)&v100 = sub_10000945C(v82, v81, (uint64_t *)&v102);
        v28 = v83;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v100, (char *)&v100 + 8, v76 + 4);
        swift_bridgeObjectRelease_n(v67, 2);
        swift_bridgeObjectRelease(v81);
        _os_log_impl((void *)&_mh_execute_header, v74, v75, "Plugin Response = %s", v76, 0xCu);
        swift_arrayDestroy(v77, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v77, -1, -1);
        swift_slowDealloc(v76, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(v67, 2);
      }
      v103 = sub_10000B4FC(&qword_1000145C0);
      *(_QWORD *)&v102 = v67;
      v92(&v102, 0);
    }
    else
    {
      if (qword_1000144B8 != -1)
        swift_once(&qword_1000144B8, sub_10000DB54);
      v55 = type metadata accessor for Logger(0);
      v56 = sub_10000B4A0(v55, (uint64_t)qword_1000156E0);
      v57 = Logger.logObject.getter(v56);
      v58 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v57, v58))
      {
        v59 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v59 = 0;
        _os_log_impl((void *)&_mh_execute_header, v57, v58, "Failed to cast response from session, returning empty response", v59, 2u);
        swift_slowDealloc(v59, -1, -1);
      }

      v60 = sub_10000B630();
      v103 = sub_10000B4FC(&qword_1000145C0);
      *(_QWORD *)&v102 = v60;
      a2(&v102, 0);
    }

    v26 = &v102;
  }
  else
  {
    if (qword_1000144B8 != -1)
      swift_once(&qword_1000144B8, sub_10000DB54);
    v20 = type metadata accessor for Logger(0);
    v21 = sub_10000B4A0(v20, (uint64_t)qword_1000156E0);
    v22 = Logger.logObject.getter(v21);
    v23 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Failed to get propertyValues for 'session', returning empty response", v24, 2u);
      swift_slowDealloc(v24, -1, -1);
    }

    v25 = sub_10000B630();
    v104[3] = sub_10000B4FC(&qword_1000145C0);
    v104[0] = v25;
    a2(v104, 0);
    v26 = (__int128 *)v104;
  }
  return sub_10000B9EC((uint64_t)v26, &qword_1000145B0);
}

_QWORD *sub_100007514(uint64_t a1)
{
  int64_t v2;
  _QWORD *v3;
  uint64_t i;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  _BYTE v11[32];
  _QWORD *v12;

  v2 = *(_QWORD *)(a1 + 16);
  v12 = &_swiftEmptyArrayStorage;
  sub_100009BE0(0, v2, 0);
  v3 = &_swiftEmptyArrayStorage;
  if (v2)
  {
    for (i = a1 + 32; ; i += 32)
    {
      sub_10000B728(i, (uint64_t)v11);
      v5 = sub_10000B4FC(&qword_1000145C0);
      if (!swift_dynamicCast(&v10, v11, (char *)&type metadata for Any + 8, v5, 6))
        break;
      v6 = v10;
      if ((swift_isUniquelyReferenced_nonNull_native(v3) & 1) == 0)
      {
        sub_100009BE0(0, v3[2] + 1, 1);
        v3 = v12;
      }
      v8 = v3[2];
      v7 = v3[3];
      if (v8 >= v7 >> 1)
      {
        sub_100009BE0(v7 > 1, v8 + 1, 1);
        v3 = v12;
      }
      v3[2] = v8 + 1;
      v3[v8 + 4] = v6;
      if (!--v2)
        return v3;
    }
    v10 = 0;
    swift_release(v3);
    swift_bridgeObjectRelease(v10);
    return 0;
  }
  return v3;
}

uint64_t sub_100007658(uint64_t a1, void (*a2)(__int128 *, _QWORD), uint64_t a3)
{
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  unint64_t v28;
  __int128 *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  void *v34;
  _QWORD *v35;
  unint64_t v36;
  char v37;
  uint64_t v38;
  NSString v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t, uint64_t);
  uint64_t v45;
  char *v46;
  char v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  BOOL v53;
  void (*v54)(__int128 *, _QWORD);
  uint8_t *v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t inited;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  NSObject *v67;
  os_log_type_t v68;
  uint8_t *v69;
  uint64_t v70;
  NSObject *v71;
  os_log_type_t v72;
  uint8_t *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  char *v79;
  uint64_t v81;
  _QWORD *v82;
  void *v83;
  uint64_t v84;
  void (*v85)(__int128 *, _QWORD);
  char *v86;
  uint64_t v87;
  char *v88;
  __int128 v89;
  id v90;
  uint64_t v91;
  char v92[56];
  char v93[80];
  __int128 v94;
  uint64_t v95;
  __int128 v96;
  uint64_t v97;
  _QWORD v98[5];

  v6 = sub_10000B4FC(&qword_100014600);
  __chkstk_darwin(v6);
  v8 = (char *)&v81 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Date(0);
  v91 = *(_QWORD *)(v9 - 8);
  v10 = __chkstk_darwin(v9);
  *(_QWORD *)&v89 = (char *)&v81 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v10);
  v86 = (char *)&v81 - v13;
  v14 = __chkstk_darwin(v12);
  v16 = (char *)&v81 - v15;
  if (a1)
  {
    v87 = v14;
    v84 = a3;
    v85 = a2;
    v90 = objc_msgSend(objc_allocWithZone((Class)NSISO8601DateFormatter), "init");
    v88 = v16;
    Date.init(timeIntervalSinceReferenceDate:)(0.0);
    v17 = *(_QWORD *)(a1 + 16);
    if (v17)
    {
      v18 = a1 + 32;
      swift_bridgeObjectRetain(a1);
      v19 = (char *)&_swiftEmptyArrayStorage;
      do
      {
        sub_10000B7C0(v18, (uint64_t)v98);
        v20 = sub_10000B85C((uint64_t)v98, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000B7FC);
        PropertyValue.rawValue.getter(&v94, v20);
        sub_10000B85C((uint64_t)v98, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000B894);
        if (v95)
        {
          sub_10000B764(&v94, &v96);
          sub_10000B764(&v96, &v94);
          if ((swift_isUniquelyReferenced_nonNull_native(v19) & 1) == 0)
            v19 = sub_100009350(0, *((_QWORD *)v19 + 2) + 1, 1, v19);
          v22 = *((_QWORD *)v19 + 2);
          v21 = *((_QWORD *)v19 + 3);
          if (v22 >= v21 >> 1)
            v19 = sub_100009350((char *)(v21 > 1), v22 + 1, 1, v19);
          *((_QWORD *)v19 + 2) = v22 + 1;
          sub_10000B764(&v94, &v19[32 * v22 + 32]);
        }
        else
        {
          sub_10000B9EC((uint64_t)&v94, &qword_1000145B0);
        }
        v18 += 48;
        --v17;
      }
      while (v17);
      swift_bridgeObjectRelease(a1);
    }
    else
    {
      v19 = (char *)&_swiftEmptyArrayStorage;
    }
    v30 = sub_100007514((uint64_t)v19);
    swift_bridgeObjectRelease(v19);
    v31 = v87;
    if (v30)
    {
      v32 = v30[2];
      v82 = v30;
      if (v32)
      {
        v33 = v30 + 4;
        v83 = &_swiftEmptyDictionarySingleton;
        v34 = &type metadata for String;
        while (1)
        {
          v35 = (_QWORD *)*v33;
          if (*(_QWORD *)(*v33 + 16))
          {
            swift_bridgeObjectRetain(*v33);
            v36 = sub_100009A9C(0x7461447472617473, 0xE900000000000065);
            if ((v37 & 1) == 0)
              goto LABEL_22;
            sub_10000B728(v35[7] + 32 * v36, (uint64_t)&v96);
            if ((swift_dynamicCast(&v94, &v96, (char *)&type metadata for Any + 8, v34, 6) & 1) == 0)
              goto LABEL_22;
            v38 = *((_QWORD *)&v94 + 1);
            v39 = String._bridgeToObjectiveC()();
            swift_bridgeObjectRelease(v38);
            v40 = objc_msgSend(v90, "dateFromString:", v39);

            if (!v40)
            {
              (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v91 + 56))(v8, 1, 1, v31);
LABEL_32:
              swift_bridgeObjectRelease(v35);
              sub_10000B9EC((uint64_t)v8, &qword_100014600);
              goto LABEL_23;
            }
            v41 = v34;
            v42 = v89;
            static Date._unconditionallyBridgeFromObjectiveC(_:)(v40);

            v43 = v91;
            v44 = *(void (**)(char *, uint64_t, uint64_t))(v91 + 32);
            v45 = v42;
            v34 = v41;
            v44(v8, v45, v31);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v43 + 56))(v8, 0, 1, v31);
            if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v43 + 48))(v8, 1, v31) == 1)
              goto LABEL_32;
            v46 = v86;
            v44(v86, (uint64_t)v8, v31);
            v47 = static Date.> infix(_:_:)(v46, v88);
            (*(void (**)(char *, uint64_t))(v91 + 8))(v46, v31);
            if ((v47 & 1) != 0)
            {
              swift_bridgeObjectRelease(v83);
              v83 = v35;
            }
            else
            {
LABEL_22:
              swift_bridgeObjectRelease(v35);
            }
          }
LABEL_23:
          ++v33;
          if (!--v32)
            goto LABEL_39;
        }
      }
      v83 = &_swiftEmptyDictionarySingleton;
LABEL_39:
      swift_bridgeObjectRelease(v82);
      v57 = sub_10000B4FC(&qword_1000145C0);
      v97 = v57;
      *(_QWORD *)&v96 = v83;
      v58 = sub_10000B4FC(&qword_1000145C8);
      inited = swift_initStackObject(v58, v93);
      v89 = xmmword_10000E1E0;
      *(_OWORD *)(inited + 16) = xmmword_10000E1E0;
      *(_QWORD *)(inited + 32) = 0x65736E6F70736572;
      *(_QWORD *)(inited + 40) = 0xE800000000000000;
      sub_10000B728((uint64_t)&v96, inited + 48);
      v60 = sub_10000593C(inited);
      v61 = sub_10000B4FC(&qword_1000145D0);
      v62 = swift_initStackObject(v61, v92);
      *(_OWORD *)(v62 + 16) = v89;
      strcpy((char *)(v62 + 32), "json-payload");
      *(_BYTE *)(v62 + 45) = 0;
      *(_WORD *)(v62 + 46) = -5120;
      *(_QWORD *)(v62 + 48) = v60;
      v63 = sub_100005A70(v62);
      v64 = sub_100005B88(v63);
      swift_bridgeObjectRelease(v63);
      sub_10000B430(&v96);
      if (qword_1000144B8 != -1)
        swift_once(&qword_1000144B8, sub_10000DB54);
      v65 = type metadata accessor for Logger(0);
      v66 = sub_10000B4A0(v65, (uint64_t)qword_1000156E0);
      v67 = Logger.logObject.getter(v66);
      v68 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v67, v68))
      {
        v69 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v69 = 0;
        _os_log_impl((void *)&_mh_execute_header, v67, v68, "PerformRequest: Sending value back to AMS", v69, 2u);
        swift_slowDealloc(v69, -1, -1);
      }

      v70 = swift_bridgeObjectRetain_n(v64, 2);
      v71 = Logger.logObject.getter(v70);
      v72 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v71, v72))
      {
        *(_QWORD *)&v89 = v57;
        v73 = (uint8_t *)swift_slowAlloc(12, -1);
        v74 = swift_slowAlloc(32, -1);
        *(_QWORD *)&v96 = v74;
        *(_DWORD *)v73 = 136315138;
        v75 = swift_bridgeObjectRetain(v64);
        v76 = Dictionary.description.getter(v75, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
        v78 = v77;
        swift_bridgeObjectRelease(v64);
        *(_QWORD *)&v94 = sub_10000945C(v76, v78, (uint64_t *)&v96);
        v31 = v87;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v94, (char *)&v94 + 8, v73 + 4);
        swift_bridgeObjectRelease_n(v64, 2);
        swift_bridgeObjectRelease(v78);
        _os_log_impl((void *)&_mh_execute_header, v71, v72, "Plugin Response = %s", v73, 0xCu);
        v57 = v89;
        swift_arrayDestroy(v74, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v74, -1, -1);
        swift_slowDealloc(v73, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(v64, 2);
      }
      v79 = v88;
      v97 = v57;
      *(_QWORD *)&v96 = v64;
      v85(&v96, 0);

      (*(void (**)(char *, uint64_t))(v91 + 8))(v79, v31);
    }
    else
    {
      v48 = v88;
      if (qword_1000144B8 != -1)
        swift_once(&qword_1000144B8, sub_10000DB54);
      v49 = type metadata accessor for Logger(0);
      v50 = sub_10000B4A0(v49, (uint64_t)qword_1000156E0);
      v51 = Logger.logObject.getter(v50);
      v52 = static os_log_type_t.error.getter();
      v53 = os_log_type_enabled(v51, v52);
      v54 = v85;
      if (v53)
      {
        v55 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v55 = 0;
        _os_log_impl((void *)&_mh_execute_header, v51, v52, "Failed to cast response from session, returning empty response", v55, 2u);
        swift_slowDealloc(v55, -1, -1);
      }

      v56 = sub_10000B630();
      v97 = sub_10000B4FC(&qword_1000145C0);
      *(_QWORD *)&v96 = v56;
      v54(&v96, 0);

      (*(void (**)(char *, uint64_t))(v91 + 8))(v48, v31);
    }
    v29 = &v96;
  }
  else
  {
    if (qword_1000144B8 != -1)
      swift_once(&qword_1000144B8, sub_10000DB54);
    v23 = type metadata accessor for Logger(0);
    v24 = sub_10000B4A0(v23, (uint64_t)qword_1000156E0);
    v25 = Logger.logObject.getter(v24);
    v26 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Failed to get propertyValues for 'session', returning empty response", v27, 2u);
      swift_slowDealloc(v27, -1, -1);
    }

    v28 = sub_10000B630();
    v98[3] = sub_10000B4FC(&qword_1000145C0);
    v98[0] = v28;
    a2((__int128 *)v98, 0);
    v29 = (__int128 *)v98;
  }
  return sub_10000B9EC((uint64_t)v29, &qword_1000145B0);
}

uint64_t sub_10000805C(uint64_t a1, void (*a2)(_QWORD *, _QWORD), uint64_t a3)
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  unint64_t v42;
  __int128 *v43;
  _QWORD *v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  char *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint8_t *v57;
  uint8_t *v58;
  void (*v59)(__int128 *, _QWORD);
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  os_log_type_t v63;
  BOOL v64;
  char *v65;
  uint8_t *v66;
  unint64_t v67;
  uint64_t v68;
  NSObject *v69;
  os_log_type_t v70;
  uint8_t *v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  NSObject *v75;
  os_log_type_t v76;
  uint8_t *v77;
  unint64_t v78;
  uint64_t result;
  uint64_t (*v80)(char *, uint64_t, uint8_t *);
  uint64_t v81;
  unint64_t v82;
  char v83;
  char v84;
  uint64_t v85;
  uint64_t v86;
  NSString v87;
  id v88;
  char *v89;
  uint64_t v90;
  uint8_t *v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  char v95;
  char *v96;
  unint64_t v97;
  char v98;
  uint64_t v99;
  NSObject *v100;
  os_log_type_t v101;
  double v102;
  double v103;
  uint64_t v104;
  uint64_t inited;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  unint64_t v110;
  uint64_t v111;
  NSObject *v112;
  os_log_type_t v113;
  uint8_t *v114;
  uint64_t v115;
  NSObject *v116;
  os_log_type_t v117;
  uint8_t *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  unint64_t v123;
  unsigned int (*v124)(_QWORD, _QWORD, _QWORD);
  void (*v125)(_QWORD, _QWORD);
  uint64_t v126;
  NSObject *v127;
  os_log_type_t v128;
  uint8_t *v129;
  uint8_t *v130;
  double v131;
  double v132;
  uint64_t v133;
  uint64_t v134;
  id v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  char *v139;
  char *v140;
  unsigned int (*v141)(_QWORD, _QWORD, _QWORD);
  uint64_t v142;
  uint64_t v143;
  char *v144;
  void (*v145)(_QWORD *, _QWORD);
  char *v146;
  char *v147;
  char *v148;
  char *v149;
  char *v150;
  uint64_t v151;
  char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  __int128 v157;
  char v158[40];
  char v159[8];
  __int128 v160;
  uint64_t v161;
  __int128 v162;
  __int128 v163;
  _QWORD v164[4];

  v154 = type metadata accessor for Calendar.SearchDirection(0);
  v153 = *(_QWORD *)(v154 - 8);
  __chkstk_darwin(v154);
  v152 = (char *)&v133 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v151 = type metadata accessor for Calendar.RepeatedTimePolicy(0);
  *(_QWORD *)&v157 = *(_QWORD *)(v151 - 8);
  __chkstk_darwin(v151);
  v150 = (char *)&v133 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v156 = type metadata accessor for Calendar.MatchingPolicy(0);
  v155 = *(_QWORD *)(v156 - 8);
  __chkstk_darwin(v156);
  v9 = (char *)&v133 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_10000B4FC(&qword_100014600);
  v11 = __chkstk_darwin(v10);
  v148 = (char *)&v133 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v149 = (char *)&v133 - v13;
  v14 = type metadata accessor for Date(0);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = __chkstk_darwin(v14);
  v147 = (char *)&v133 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __chkstk_darwin(v16);
  v20 = (char *)&v133 - v19;
  v21 = __chkstk_darwin(v18);
  v23 = (char *)&v133 - v22;
  __chkstk_darwin(v21);
  v25 = (char *)&v133 - v24;
  v26 = type metadata accessor for Calendar(0);
  v27 = __chkstk_darwin(v26);
  v28 = __chkstk_darwin(v27);
  if (!a1)
  {
    if (qword_1000144B8 != -1)
      swift_once(&qword_1000144B8, sub_10000DB54);
    v38 = type metadata accessor for Logger(0);
    sub_10000B4A0(v38, (uint64_t)qword_1000156E0);
    v39 = ((uint64_t (*)(void))Logger.logObject.getter)();
    v40 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v41 = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, v40, "Failed to get propertyValues for 'session', returning empty response", v41, 2u);
      swift_slowDealloc(v41, -1, -1);
    }

    v42 = sub_10000B630();
    v164[3] = sub_10000B4FC(&qword_1000145C0);
    v164[0] = v42;
    a2(v164, 0);
    v43 = (__int128 *)v164;
    return sub_10000B9EC((uint64_t)v43, &qword_1000145B0);
  }
  v136 = v31;
  v139 = v23;
  v140 = (char *)&v133 - v29;
  v137 = v30;
  v138 = v28;
  v142 = v15;
  v141 = (unsigned int (*)(_QWORD, _QWORD, _QWORD))v14;
  v32 = *(_QWORD *)(a1 + 16);
  if (v32)
  {
    v144 = v20;
    v146 = v25;
    v143 = a3;
    v145 = a2;
    v33 = a1 + 32;
    swift_bridgeObjectRetain(a1);
    v34 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      sub_10000B7C0(v33, (uint64_t)v164);
      v35 = sub_10000B85C((uint64_t)v164, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000B7FC);
      PropertyValue.rawValue.getter(&v160, v35);
      sub_10000B85C((uint64_t)v164, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10000B894);
      if (v161)
      {
        sub_10000B764(&v160, &v162);
        sub_10000B764(&v162, &v160);
        if ((swift_isUniquelyReferenced_nonNull_native(v34) & 1) == 0)
          v34 = sub_100009350(0, *((_QWORD *)v34 + 2) + 1, 1, v34);
        v37 = *((_QWORD *)v34 + 2);
        v36 = *((_QWORD *)v34 + 3);
        if (v37 >= v36 >> 1)
          v34 = sub_100009350((char *)(v36 > 1), v37 + 1, 1, v34);
        *((_QWORD *)v34 + 2) = v37 + 1;
        sub_10000B764(&v160, &v34[32 * v37 + 32]);
      }
      else
      {
        sub_10000B9EC((uint64_t)&v160, &qword_1000145B0);
      }
      v33 += 48;
      --v32;
    }
    while (v32);
    swift_bridgeObjectRelease(a1);
    a2 = v145;
    a3 = v143;
    v25 = v146;
    v20 = v144;
  }
  else
  {
    v34 = (char *)&_swiftEmptyArrayStorage;
  }
  v44 = sub_100007514((uint64_t)v34);
  swift_bridgeObjectRelease(v34);
  if (!v44)
  {
LABEL_36:
    if (qword_1000144B8 == -1)
    {
LABEL_37:
      v73 = type metadata accessor for Logger(0);
      v74 = sub_10000B4A0(v73, (uint64_t)qword_1000156E0);
      v75 = Logger.logObject.getter(v74);
      v76 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v75, v76))
      {
        v77 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v77 = 0;
        _os_log_impl((void *)&_mh_execute_header, v75, v76, "Failed to cast response from session, returning empty response", v77, 2u);
        swift_slowDealloc(v77, -1, -1);
      }

      v78 = sub_10000B630();
      *((_QWORD *)&v163 + 1) = sub_10000B4FC(&qword_1000145C0);
      *(_QWORD *)&v162 = v78;
      a2(&v162, 0);
      goto LABEL_40;
    }
LABEL_83:
    swift_once(&qword_1000144B8, sub_10000DB54);
    goto LABEL_37;
  }
  if (!v44[2])
  {
    swift_bridgeObjectRelease(v44);
    goto LABEL_36;
  }
  v45 = v44[4];
  swift_bridgeObjectRetain(v45);
  swift_bridgeObjectRelease(v44);
  v135 = objc_msgSend(objc_allocWithZone((Class)NSISO8601DateFormatter), "init");
  if (!*(_QWORD *)(v45 + 16)
    || (v46 = sub_100009A9C(0x47676E6964616572, 0xEB000000006C616FLL), (v47 & 1) == 0)
    || (v144 = v20,
        sub_10000B728(*(_QWORD *)(v45 + 56) + 32 * v46, (uint64_t)&v162),
        (swift_dynamicCast(&v160, &v162, (char *)&type metadata for Any + 8, &type metadata for Int, 6) & 1) == 0))
  {
    swift_bridgeObjectRelease(v45);
    if (qword_1000144B8 != -1)
      swift_once(&qword_1000144B8, sub_10000DB54);
    v68 = type metadata accessor for Logger(0);
    sub_10000B4A0(v68, (uint64_t)qword_1000156E0);
    v69 = ((uint64_t (*)(void))Logger.logObject.getter)();
    v70 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v69, v70))
    {
      v71 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v71 = 0;
      _os_log_impl((void *)&_mh_execute_header, v69, v70, "Failed to retrieve reading goal, returning empty response", v71, 2u);
      swift_slowDealloc(v71, -1, -1);
    }

    v72 = sub_10000B630();
    *((_QWORD *)&v163 + 1) = sub_10000B4FC(&qword_1000145C0);
    *(_QWORD *)&v162 = v72;
    a2(&v162, 0);

    goto LABEL_40;
  }
  v134 = v45;
  v145 = a2;
  v48 = v25;
  v133 = v160;
  v49 = ((uint64_t (*)(void))static Calendar.current.getter)();
  Date.init()(v49);
  (*(void (**)(char *, _QWORD, uint64_t))(v155 + 104))(v9, enum case for Calendar.MatchingPolicy.nextTime(_:), v156);
  v50 = v150;
  v51 = v151;
  (*(void (**)(char *, _QWORD, uint64_t))(v157 + 104))(v150, enum case for Calendar.RepeatedTimePolicy.first(_:), v151);
  v52 = v153;
  v53 = v152;
  v54 = v154;
  (*(void (**)(char *, _QWORD, uint64_t))(v153 + 104))(v152, enum case for Calendar.SearchDirection.forward(_:), v154);
  v55 = (uint64_t)v149;
  v146 = v48;
  Calendar.date(bySettingHour:minute:second:of:matchingPolicy:repeatedTimePolicy:direction:)(23, 59, 59, v48, v9, v50, v53);
  (*(void (**)(char *, uint64_t))(v52 + 8))(v53, v54);
  (*(void (**)(char *, uint64_t))(v157 + 8))(v50, v51);
  (*(void (**)(char *, uint64_t))(v155 + 8))(v9, v156);
  v56 = v142;
  v57 = *(uint8_t **)(v142 + 48);
  v58 = v141;
  if (((unsigned int (*)(uint64_t, uint64_t, _QWORD))v57)(v55, 1, v141) == 1)
  {
    swift_bridgeObjectRelease(v134);
    sub_10000B9EC(v55, &qword_100014600);
    v59 = (void (*)(__int128 *, _QWORD))v145;
    if (qword_1000144B8 != -1)
      swift_once(&qword_1000144B8, sub_10000DB54);
    v60 = type metadata accessor for Logger(0);
    v61 = sub_10000B4A0(v60, (uint64_t)qword_1000156E0);
    v62 = Logger.logObject.getter(v61);
    v63 = static os_log_type_t.error.getter();
    v64 = os_log_type_enabled(v62, v63);
    v65 = v146;
    if (v64)
    {
      v66 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v66 = 0;
      _os_log_impl((void *)&_mh_execute_header, v62, v63, "Failed computing the time remaining to reach the goal today", v66, 2u);
      swift_slowDealloc(v66, -1, -1);
    }

    v67 = sub_10000B630();
    *((_QWORD *)&v163 + 1) = sub_10000B4FC(&qword_1000145C0);
    *(_QWORD *)&v162 = v67;
    v59(&v162, 0);

    (*(void (**)(char *, unsigned int (*)(_QWORD, _QWORD, _QWORD)))(v142 + 8))(v65, v141);
LABEL_72:
    (*(void (**)(char *, uint64_t))(v137 + 8))(v140, v138);
LABEL_40:
    v43 = &v162;
    return sub_10000B9EC((uint64_t)v43, &qword_1000145B0);
  }
  v143 = a3;
  v80 = *(uint64_t (**)(char *, uint64_t, uint8_t *))(v56 + 32);
  v80(v139, v55, (uint8_t *)v58);
  v81 = v134;
  a2 = v145;
  if (!*(_QWORD *)(v134 + 16) || (v82 = sub_100009A9C(1702125924, 0xE400000000000000), (v83 & 1) == 0))
  {
    swift_bridgeObjectRelease(v81);
    v96 = v139;
    v85 = v133;
    goto LABEL_57;
  }
  sub_10000B728(*(_QWORD *)(v81 + 56) + 32 * v82, (uint64_t)&v162);
  v84 = swift_dynamicCast(&v160, &v162, (char *)&type metadata for Any + 8, &type metadata for String, 6);
  v85 = v133;
  if ((v84 & 1) == 0)
    goto LABEL_55;
  v86 = *((_QWORD *)&v160 + 1);
  v87 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v86);
  v88 = objc_msgSend(v135, "dateFromString:", v87);

  if (!v88)
  {
    v90 = (uint64_t)v148;
    (*(void (**)(char *, uint64_t, uint64_t, unsigned int (*)(_QWORD, _QWORD, _QWORD)))(v142 + 56))(v148, 1, 1, v141);
    goto LABEL_53;
  }
  v89 = v147;
  static Date._unconditionallyBridgeFromObjectiveC(_:)(v88);

  v90 = (uint64_t)v148;
  v91 = (uint8_t *)v141;
  v80(v148, (uint64_t)v89, (uint8_t *)v141);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint8_t *))(v142 + 56))(v90, 0, 1, v91);
  if (((unsigned int (*)(uint64_t, uint64_t, uint8_t *))v57)(v90, 1, v91) == 1)
  {
LABEL_53:
    swift_bridgeObjectRelease(v81);
    sub_10000B9EC(v90, &qword_100014600);
LABEL_56:
    v96 = v139;
    goto LABEL_57;
  }
  v57 = v91;
  v92 = v144;
  v93 = v80(v144, v90, v91);
  v94 = v136;
  static Calendar.current.getter(v93);
  v95 = Calendar.isDateInToday(_:)(v92);
  (*(void (**)(uint64_t, uint64_t))(v137 + 8))(v94, v138);
  if ((v95 & 1) == 0)
  {
    (*(void (**)(char *, uint8_t *))(v142 + 8))(v92, v57);
LABEL_55:
    swift_bridgeObjectRelease(v81);
    goto LABEL_56;
  }
  v96 = v139;
  if (*(_QWORD *)(v81 + 16) && (v97 = sub_100009A9C(0xD000000000000013, 0x800000010000EA90), (v98 & 1) != 0))
  {
    sub_10000B728(*(_QWORD *)(v81 + 56) + 32 * v97, (uint64_t)&v162);
  }
  else
  {
    v162 = 0u;
    v163 = 0u;
  }
  swift_bridgeObjectRelease(v81);
  if (*((_QWORD *)&v163 + 1))
  {
    if ((swift_dynamicCast(&v160, &v162, (char *)&type metadata for Any + 8, &type metadata for Int, 6) & 1) != 0)
    {
      v85 = v160;
      if (qword_1000144B8 == -1)
        goto LABEL_77;
      goto LABEL_89;
    }
  }
  else
  {
    sub_10000B9EC((uint64_t)&v162, &qword_1000145B0);
  }
  (*(void (**)(char *, uint8_t *))(v142 + 8))(v144, v57);
LABEL_57:
  if (qword_1000144B8 != -1)
    swift_once(&qword_1000144B8, sub_10000DB54);
  v99 = type metadata accessor for Logger(0);
  sub_10000B4A0(v99, (uint64_t)qword_1000156E0);
  v100 = ((uint64_t (*)(void))Logger.logObject.getter)();
  v101 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v100, v101))
  {
    v57 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v57 = 0;
    _os_log_impl((void *)&_mh_execute_header, v100, v101, "No reading activity today", v57, 2u);
    swift_slowDealloc(v57, -1, -1);
  }

  v102 = Date.timeIntervalSince1970.getter();
  v103 = v102 - Date.timeIntervalSince1970.getter();
  if ((~*(_QWORD *)&v103 & 0x7FF0000000000000) != 0)
  {
    if (v103 > -9.22337204e18)
    {
      if (v103 < 9.22337204e18)
        goto LABEL_64;
      goto LABEL_88;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_88:
  __break(1u);
LABEL_89:
  swift_once(&qword_1000144B8, sub_10000DB54);
LABEL_77:
  v126 = type metadata accessor for Logger(0);
  sub_10000B4A0(v126, (uint64_t)qword_1000156E0);
  v127 = ((uint64_t (*)(void))Logger.logObject.getter)();
  v128 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v127, v128))
  {
    v129 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v129 = 134217984;
    v96 = v139;
    *(_QWORD *)&v162 = v85;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v162, (char *)&v162 + 8, v129 + 4);
    _os_log_impl((void *)&_mh_execute_header, v127, v128, "remainingTimeToRead: %ld", v129, 0xCu);
    v130 = v129;
    v57 = (uint8_t *)v141;
    swift_slowDealloc(v130, -1, -1);
  }

  v131 = Date.timeIntervalSince1970.getter();
  v132 = Date.timeIntervalSince1970.getter();
  result = (*(uint64_t (**)(char *, uint8_t *))(v142 + 8))(v144, v57);
  v103 = v131 - v132;
  if ((~COERCE__INT64(v131 - v132) & 0x7FF0000000000000) != 0)
  {
    if (v103 > -9.22337204e18)
    {
      if (v103 >= 9.22337204e18)
      {
        __break(1u);
        goto LABEL_83;
      }
LABEL_64:
      *((_QWORD *)&v163 + 1) = &type metadata for Bool;
      LOBYTE(v162) = v85 < (uint64_t)v103;
      v104 = sub_10000B4FC(&qword_1000145C8);
      inited = swift_initStackObject(v104, v159);
      v157 = xmmword_10000E1E0;
      *(_OWORD *)(inited + 16) = xmmword_10000E1E0;
      *(_QWORD *)(inited + 32) = 0x65736E6F70736572;
      *(_QWORD *)(inited + 40) = 0xE800000000000000;
      sub_10000B728((uint64_t)&v162, inited + 48);
      v106 = sub_10000593C(inited);
      v107 = sub_10000B4FC(&qword_1000145D0);
      v108 = swift_initStackObject(v107, v158);
      *(_OWORD *)(v108 + 16) = v157;
      strcpy((char *)(v108 + 32), "json-payload");
      *(_BYTE *)(v108 + 45) = 0;
      *(_WORD *)(v108 + 46) = -5120;
      *(_QWORD *)(v108 + 48) = v106;
      v109 = sub_100005A70(v108);
      v110 = sub_100005B88(v109);
      swift_bridgeObjectRelease(v109);
      sub_10000B430(&v162);
      if (qword_1000144B8 != -1)
        swift_once(&qword_1000144B8, sub_10000DB54);
      v111 = type metadata accessor for Logger(0);
      sub_10000B4A0(v111, (uint64_t)qword_1000156E0);
      v112 = ((uint64_t (*)(void))Logger.logObject.getter)();
      v113 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v112, v113))
      {
        v114 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v114 = 0;
        _os_log_impl((void *)&_mh_execute_header, v112, v113, "PerformRequest: Sending value back to AMS", v114, 2u);
        swift_slowDealloc(v114, -1, -1);
      }

      v115 = swift_bridgeObjectRetain_n(v110, 2);
      v116 = Logger.logObject.getter(v115);
      v117 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v116, v117))
      {
        v118 = (uint8_t *)swift_slowAlloc(12, -1);
        v119 = swift_slowAlloc(32, -1);
        *(_QWORD *)&v162 = v119;
        *(_DWORD *)v118 = 136315138;
        v120 = swift_bridgeObjectRetain(v110);
        v121 = Dictionary.description.getter(v120, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
        v123 = v122;
        swift_bridgeObjectRelease(v110);
        *(_QWORD *)&v160 = sub_10000945C(v121, v123, (uint64_t *)&v162);
        a2 = v145;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v160, (char *)&v160 + 8, v118 + 4);
        swift_bridgeObjectRelease_n(v110, 2);
        swift_bridgeObjectRelease(v123);
        _os_log_impl((void *)&_mh_execute_header, v116, v117, "Plugin Response = %s", v118, 0xCu);
        v96 = v139;
        swift_arrayDestroy(v119, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v119, -1, -1);
        swift_slowDealloc(v118, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n(v110, 2);
      }
      v124 = v141;
      *((_QWORD *)&v163 + 1) = sub_10000B4FC(&qword_1000145C0);
      *(_QWORD *)&v162 = v110;
      a2(&v162, 0);

      v125 = *(void (**)(_QWORD, _QWORD))(v142 + 8);
      v125(v96, v124);
      v125(v146, v124);
      goto LABEL_72;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

char *sub_100009350(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;

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
      v10 = sub_10000B4FC(&qword_1000145F8);
      v11 = (char *)swift_allocObject(v10, 32 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 1;
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * (v13 >> 5);
      v14 = v11 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = (char *)&_swiftEmptyArrayStorage;
      v14 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[32 * v8 + 32])
          memmove(v14, a4 + 32, 32 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10000B8F4(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000945C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_10000952C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_10000B728((uint64_t)v12, *a3);
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
      sub_10000B728((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10000B430(v12);
  return v7;
}

uint64_t sub_10000952C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  int v14;
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
    result = sub_1000096E4(a5, a6);
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
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, v14, 1173, 0);
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
}

uint64_t sub_1000096E4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100009778(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100009950(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100009950(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100009778(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

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
      v5 = sub_1000098EC(v4, 0);
      if (v4 < 0)
        break;
      v6 = v5;
      v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0)
        goto LABEL_14;
      if (v7 == v4)
        return v6;
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, v10, 1122, 0);
      __break(1u);
LABEL_10:
      v4 = String.UTF8View._foreignCount()();
      if (!v4)
        return &_swiftEmptyArrayStorage;
    }
    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, v10, 71, 0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_1000098EC(uint64_t a1, uint64_t a2)
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
  v4 = sub_10000B4FC(&qword_100014618);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100009950(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_10000B4FC(&qword_100014618);
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

unint64_t sub_100009A9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_100009B00(a1, a2, v5);
}

unint64_t sub_100009B00(uint64_t a1, uint64_t a2, uint64_t a3)
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

uint64_t sub_100009BE0(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_100009BFC(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_100009BFC(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
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
    v10 = sub_10000B4FC(&qword_100014608);
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
  v14 = (unint64_t)(v11 + 4);
  v15 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= v15 + 8 * v8)
      memmove(v11 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v15 >= v14 + 8 * v8 || v14 >= v15 + 8 * v8)
  {
    sub_10000B4FC(&qword_1000145C0);
    swift_arrayInitWithCopy(v11 + 4);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100009D84()
{
  uint64_t v0;
  char *v1;
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
  NSString v13;
  id v14;
  void (*v15)(char *, char *, uint64_t);
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t);
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v26;

  sub_10000B4FC(&qword_100014610);
  ((void (*)(void))__chkstk_darwin)();
  v1 = (char *)&v26 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for URL(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v4);
  v9 = (char *)&v26 - v8;
  __chkstk_darwin(v7);
  v11 = (char *)&v26 - v10;
  v12 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  v13 = String._bridgeToObjectiveC()();
  v14 = objc_msgSend(v12, "containerURLForSecurityApplicationGroupIdentifier:", v13);

  if (v14)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v14);

    v15 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
    v15(v1, v9, v2);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v3 + 56))(v1, 0, 1, v2);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) != 1)
    {
      v15(v11, v1, v2);
      URL.appendingPathComponent(_:isDirectory:)(0xD000000000000013, 0x800000010000EAD0, 1);
      (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v9, v2);
      v16 = objc_allocWithZone((Class)type metadata accessor for ManagerConfiguration(0));
      v17 = ManagerConfiguration.init(localStorageDirectory:shouldRunUpdatesOnSchedule:shouldPurgeOutdatedData:)(v6, 0, 0);
      v18 = objc_allocWithZone((Class)type metadata accessor for Manager(0));
      v19 = Manager.init(configuration:)(v17);
      v20 = *(void (**)(char *, uint64_t))(v3 + 8);
      v20(v9, v2);
      v20(v11, v2);
      return v19;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
  }
  sub_10000B9EC((uint64_t)v1, &qword_100014610);
  if (qword_1000144B8 != -1)
    swift_once(&qword_1000144B8, sub_10000DB54);
  v21 = type metadata accessor for Logger(0);
  sub_10000B4A0(v21, (uint64_t)qword_1000156E0);
  v22 = Logger.logObject.getter();
  v23 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v24 = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "Error while loading container for book messages. Ensure you have access to the application group folder.", v24, 2u);
    swift_slowDealloc(v24, -1, -1);
  }

  return 0;
}

uint64_t sub_10000A0C0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  _QWORD v26[3];
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  _OWORD v30[2];

  sub_10000B77C(a1, (uint64_t)&v28, &qword_1000145B0);
  if (!v29)
  {
    sub_10000B9EC((uint64_t)&v28, &qword_1000145B0);
    if (qword_1000144B8 != -1)
      swift_once(&qword_1000144B8, sub_10000DB54);
    v15 = type metadata accessor for Logger(0);
    sub_10000B4A0(v15, (uint64_t)qword_1000156E0);
    v16 = Logger.logObject.getter();
    v17 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Tried to run command but no value was found", v18, 2u);
      swift_slowDealloc(v18, -1, -1);
    }

    memset(v30, 0, sizeof(v30));
    sub_10000B77C((uint64_t)v30, (uint64_t)&v28, &qword_1000145B0);
    v19 = v29;
    if (v29)
    {
      v20 = sub_10000B47C(&v28, v29);
      v21 = *(_QWORD *)(v19 - 8);
      __chkstk_darwin(v20);
      v23 = (char *)v26 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v21 + 16))(v23);
      v24 = _bridgeAnythingToObjectiveC<A>(_:)(v23, v19);
      (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v19);
      sub_10000B430(&v28);
      if (!a2)
      {
LABEL_15:
        (*(void (**)(uint64_t, uint64_t, void *))(a3 + 16))(a3, v24, a2);
        swift_unknownObjectRelease(v24);

        return sub_10000B9EC((uint64_t)v30, &qword_1000145B0);
      }
    }
    else
    {
      v24 = 0;
      if (!a2)
        goto LABEL_15;
    }
    a2 = (void *)_convertErrorToNSError(_:)(a2);
    goto LABEL_15;
  }
  sub_10000B764(&v28, v30);
  if (qword_1000144B8 != -1)
    swift_once(&qword_1000144B8, sub_10000DB54);
  v5 = type metadata accessor for Logger(0);
  sub_10000B4A0(v5, (uint64_t)qword_1000156E0);
  v6 = Logger.logObject.getter();
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Returning values to AMS", v8, 2u);
    swift_slowDealloc(v8, -1, -1);
  }

  sub_10000B728((uint64_t)v30, (uint64_t)&v28);
  sub_10000B77C((uint64_t)&v28, (uint64_t)v26, &qword_1000145B0);
  v9 = v27;
  if (v27)
  {
    v10 = sub_10000B47C(v26, v27);
    v11 = *(_QWORD *)(v9 - 8);
    __chkstk_darwin(v10);
    v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v11 + 16))(v13);
    v14 = _bridgeAnythingToObjectiveC<A>(_:)(v13, v9);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v9);
    sub_10000B430(v26);
  }
  else
  {
    v14 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, _QWORD))(a3 + 16))(a3, v14, 0);
  swift_unknownObjectRelease(v14);
  sub_10000B9EC((uint64_t)&v28, &qword_1000145B0);
  return sub_10000B430(v30);
}

void sub_10000A45C(_QWORD *a1, uint64_t a2, void (**a3)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  Swift::String v18;
  Swift::String v19;
  __int128 v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint8_t *v45;
  uint8_t *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  _DWORD *v52;
  uint64_t v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  unint64_t v57;
  uint64_t v58;
  _QWORD v59[4];
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;

  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  _Block_copy(a3);
  _Block_copy(a3);
  v10 = swift_allocObject(&unk_100010658, 24, 7);
  *(_QWORD *)(v10 + 16) = a3;
  v11 = (void *)objc_opt_self(NSJSONSerialization);
  v12 = a1[3];
  v13 = sub_10000B47C(a1, v12);
  _Block_copy(a3);
  _Block_copy(a3);
  _Block_copy(a3);
  _Block_copy(a3);
  v14 = _bridgeAnythingToObjectiveC<A>(_:)(v13, v12);
  LODWORD(v11) = objc_msgSend(v11, "isValidJSONObject:", v14);
  swift_unknownObjectRelease(v14);
  if ((_DWORD)v11)
  {
    v15 = type metadata accessor for JSONDecoder(0);
    swift_allocObject(v15, *(unsigned int *)(v15 + 48), *(unsigned __int16 *)(v15 + 52));
    v16 = JSONDecoder.init()();
    v17 = sub_10000B53C();
    JSONDecoder.decode<A>(_:withJSONObject:options:)(&v66, &type metadata for PluginRequest, a1, 0, &type metadata for PluginRequest, v17);
    swift_release(v16);
    v61 = v66;
    v37 = v67;
    v59[3] = *((_QWORD *)&v66 + 1);
    if (qword_1000144B8 != -1)
      swift_once(&qword_1000144B8, sub_10000DB54);
    v38 = sub_10000B4A0(v6, (uint64_t)qword_1000156E0);
    v39 = Logger.logObject.getter(v38);
    v40 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = (uint8_t *)swift_slowAlloc(2, -1);
      v60 = a2;
      v42 = v10;
      v43 = v37;
      v44 = v38;
      v45 = v41;
      *(_WORD *)v41 = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, v40, "Setting up Engagement Collector", v41, 2u);
      v46 = v45;
      v38 = v44;
      v37 = v43;
      v10 = v42;
      a2 = v60;
      swift_slowDealloc(v46, -1, -1);
    }

    v47 = sub_100009D84();
    v48 = (void *)qword_1000144B0;
    qword_1000144B0 = v47;

    if (qword_1000144B0)
    {
      v49 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v38, v6);
      v50 = Logger.logObject.getter(v49);
      v51 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v50, v51))
      {
        v59[1] = v38;
        v59[2] = v37;
        v60 = a2;
        v62 = v10;
        v52 = (_DWORD *)swift_slowAlloc(12, -1);
        *(_QWORD *)&v66 = swift_slowAlloc(32, -1);
        *v52 = 136315138;
        __asm { BR              X9 }
      }

      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      v58 = swift_allocObject(&unk_100010680, 32, 7);
      *(_QWORD *)(v58 + 16) = sub_10000B474;
      *(_QWORD *)(v58 + 24) = v10;
      __asm { BR              X9 }
    }
    v53 = swift_bridgeObjectRelease(v37);
    v54 = Logger.logObject.getter(v53);
    v55 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v54, v55))
    {
      v56 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v56 = 0;
      _os_log_impl((void *)&_mh_execute_header, v54, v55, "Failed to instantiate Engagement Collector Manager", v56, 2u);
      swift_slowDealloc(v56, -1, -1);
    }

    v57 = sub_10000B4B8();
    v66 = 0u;
    v67 = 0u;
    v28 = swift_allocError(&type metadata for BooksEngagementPluginError, v57, 0, 0);
    v29 = 5;
  }
  else
  {
    *(_QWORD *)&v66 = 0;
    *((_QWORD *)&v66 + 1) = 0xE000000000000000;
    v18._countAndFlagsBits = 91;
    v18._object = (void *)0xE100000000000000;
    String.append(_:)(v18);
    _print_unlocked<A, B>(_:_:)(a1, &v66, (char *)&type metadata for Any + 8, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
    v19._countAndFlagsBits = 93;
    v19._object = (void *)0xE100000000000000;
    String.append(_:)(v19);
    v20 = v66;
    if (qword_1000144B8 != -1)
      swift_once(&qword_1000144B8, sub_10000DB54);
    sub_10000B4A0(v6, (uint64_t)qword_1000156E0);
    v21 = swift_bridgeObjectRetain(*((_QWORD *)&v20 + 1));
    v22 = Logger.logObject.getter(v21);
    v23 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc(12, -1);
      v25 = swift_slowAlloc(32, -1);
      *(_QWORD *)&v66 = v25;
      *(_DWORD *)v24 = 136315138;
      swift_bridgeObjectRetain(*((_QWORD *)&v20 + 1));
      v63 = sub_10000945C(v20, *((unint64_t *)&v20 + 1), (uint64_t *)&v66);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v63, &v64, v24 + 4);
      swift_bridgeObjectRelease_n(*((_QWORD *)&v20 + 1), 3);
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Invalid input = %s", v24, 0xCu);
      swift_arrayDestroy(v25, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v25, -1, -1);
      swift_slowDealloc(v24, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(*((_QWORD *)&v20 + 1), 2);
    }
    v26 = sub_10000B4B8();
    v66 = 0u;
    v67 = 0u;
    v28 = swift_allocError(&type metadata for BooksEngagementPluginError, v26, 0, 0);
    v29 = 3;
  }
  *v27 = v29;
  sub_10000B77C((uint64_t)&v66, (uint64_t)&v63, &qword_1000145B0);
  v30 = v65;
  if (v65)
  {
    v31 = sub_10000B47C(&v63, v65);
    v32 = *(_QWORD *)(v30 - 8);
    __chkstk_darwin(v31);
    v34 = (char *)v59 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v32 + 16))(v34);
    v35 = _bridgeAnythingToObjectiveC<A>(_:)(v34, v30);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v34, v30);
    sub_10000B430(&v63);
  }
  else
  {
    v35 = 0;
  }
  v36 = (void *)_convertErrorToNSError(_:)(v28);
  ((void (**)(_QWORD, uint64_t, void *))a3)[2](a3, v35, v36);
  swift_unknownObjectRelease(v35);

  swift_errorRelease(v28);
  sub_10000B9EC((uint64_t)&v66, &qword_1000145B0);
  swift_release(v10);
  _Block_release(a3);
  _Block_release(a3);
  _Block_release(a3);
  _Block_release(a3);
  _Block_release(a3);
}

uint64_t sub_10000B430(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_10000B450()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_10000B474(uint64_t a1, void *a2)
{
  uint64_t v2;

  sub_10000582C(a1, a2, *(_QWORD *)(v2 + 16));
}

_QWORD *sub_10000B47C(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000B4A0(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_10000B4B8()
{
  unint64_t result;

  result = qword_1000145A8;
  if (!qword_1000145A8)
  {
    result = swift_getWitnessTable(&unk_10000E2F4, &type metadata for BooksEngagementPluginError);
    atomic_store(result, (unint64_t *)&qword_1000145A8);
  }
  return result;
}

uint64_t sub_10000B4FC(uint64_t *a1)
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

unint64_t sub_10000B53C()
{
  unint64_t result;

  result = qword_1000145B8;
  if (!qword_1000145B8)
  {
    result = swift_getWitnessTable(&unk_10000E43C, &type metadata for PluginRequest);
    atomic_store(result, (unint64_t *)&qword_1000145B8);
  }
  return result;
}

uint64_t sub_10000B580()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000B5A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100005588(a1, a2, *(void (**)(__int128 *, uint64_t))(v2 + 16));
}

uint64_t sub_10000B5AC(uint64_t a1)
{
  uint64_t v1;

  return sub_10000805C(a1, *(void (**)(_QWORD *, _QWORD))(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_10000B5B8(uint64_t a1)
{
  uint64_t v1;

  return sub_100007658(a1, *(void (**)(__int128 *, _QWORD))(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_10000B5C4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000B5E8(uint64_t a1)
{
  uint64_t v1;

  return sub_1000069E0(a1, *(void (**)(_QWORD, _QWORD))(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_10000B5F4()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10000B620(uint64_t a1)
{
  uint64_t v1;

  return sub_100005F84(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void (**)(unint64_t *, _QWORD))(v1 + 32));
}

unint64_t sub_10000B630()
{
  uint64_t v0;
  uint64_t inited;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _BYTE v8[56];
  _BYTE v9[80];
  _QWORD v10[4];

  v10[3] = sub_10000B4FC(&qword_1000145C0);
  v10[0] = &_swiftEmptyDictionarySingleton;
  v0 = sub_10000B4FC(&qword_1000145C8);
  inited = swift_initStackObject(v0, v9);
  *(_OWORD *)(inited + 16) = xmmword_10000E1E0;
  *(_QWORD *)(inited + 32) = 0x65736E6F70736572;
  *(_QWORD *)(inited + 40) = 0xE800000000000000;
  sub_10000B728((uint64_t)v10, inited + 48);
  v2 = sub_10000593C(inited);
  v3 = sub_10000B4FC(&qword_1000145D0);
  v4 = swift_initStackObject(v3, v8);
  *(_OWORD *)(v4 + 16) = xmmword_10000E1E0;
  strcpy((char *)(v4 + 32), "json-payload");
  *(_BYTE *)(v4 + 45) = 0;
  *(_WORD *)(v4 + 46) = -5120;
  *(_QWORD *)(v4 + 48) = v2;
  v5 = sub_100005A70(v4);
  v6 = sub_100005B88(v5);
  swift_bridgeObjectRelease(v5);
  sub_10000B430(v10);
  return v6;
}

uint64_t sub_10000B728(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_10000B764(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000B774(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000B77C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_10000B4FC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000B7C0(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for PropertyValue - 1) + 32))(a2, a1);
  return a2;
}

uint64_t sub_10000B7FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;
  uint64_t result;

  v6 = a2;
  if (a6 == 1)
  {
    a5 = a2;
    v6 = a3;
  }
  else
  {
    if (a6 != 2)
      return result;
    swift_bridgeObjectRetain(a4);
  }
  swift_bridgeObjectRetain(a5);
  return swift_bridgeObjectRetain(v6);
}

uint64_t sub_10000B85C(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
  return a1;
}

uint64_t sub_10000B894(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t result;

  if (a6 == 1)
  {
    a4 = a2;
  }
  else
  {
    if (a6 != 2)
      return result;
    swift_bridgeObjectRelease(a5);
    a3 = a2;
  }
  swift_bridgeObjectRelease(a3);
  return swift_bridgeObjectRelease(a4);
}

uint64_t sub_10000B8F4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  else
  {
    if (v4 < 0)
    {
      result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
      goto LABEL_9;
    }
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy(a3);
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_10000B9EC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_10000B4FC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_BYTE *initializeBufferWithCopyOfBuffer for BooksEngagementPluginError(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for BooksEngagementPluginError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for BooksEngagementPluginError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000BB14 + 4 * byte_10000E21D[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_10000BB48 + 4 * byte_10000E218[v4]))();
}

uint64_t sub_10000BB48(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000BB50(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000BB58);
  return result;
}

uint64_t sub_10000BB64(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000BB6CLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_10000BB70(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000BB78(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000BB84(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000BB90(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for BooksEngagementPluginError()
{
  return &type metadata for BooksEngagementPluginError;
}

unint64_t sub_10000BBAC()
{
  unint64_t result;

  result = qword_100014620;
  if (!qword_100014620)
  {
    result = swift_getWitnessTable(&unk_10000E2CC, &type metadata for BooksEngagementPluginError);
    atomic_store(result, (unint64_t *)&qword_100014620);
  }
  return result;
}

uint64_t sub_10000BBF8(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_10000BC34 + 4 * byte_10000E340[a1]))(0xD000000000000013, 0x800000010000E910);
}

unint64_t sub_10000BC34()
{
  return 0xD000000000000010;
}

uint64_t sub_10000BC50()
{
  return 0x6F72506863746566;
}

uint64_t sub_10000BC74()
{
  uint64_t v0;

  return v0 + 6;
}

void sub_10000BC90(char a1)
{
  __asm { BR              X12 }
}

uint64_t sub_10000BCDC(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_10000BD54 + 4 * byte_10000E348[a2]))(0xD000000000000010);
}

uint64_t sub_10000BD54(uint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  char v3;

  v2 = 0x800000010000E930;
  if (a1 == 0xD000000000000010 && v1 == 0x800000010000E930)
  {
    v3 = 1;
    v2 = v1;
  }
  else
  {
    v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRelease(v2);
  return v3 & 1;
}

void sub_10000BE10(char a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, 0);
  __asm { BR              X10 }
}

Swift::Int sub_10000BE6C()
{
  uint64_t v1;

  ((void (*)(uint64_t *, unint64_t, unint64_t))String.hash(into:))(&v1, 0xD000000000000010, 0x800000010000E930);
  swift_bridgeObjectRelease(0x800000010000E930);
  return Hasher._finalize()();
}

void sub_10000BEF4(uint64_t a1, char a2)
{
  __asm { BR              X11 }
}

uint64_t sub_10000BF3C(uint64_t a1)
{
  ((void (*)(uint64_t, unint64_t, unint64_t))String.hash(into:))(a1, 0xD000000000000010, 0x800000010000E930);
  return swift_bridgeObjectRelease(0x800000010000E930);
}

void sub_10000BFAC(uint64_t a1, char a2)
{
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, a1);
  __asm { BR              X10 }
}

Swift::Int sub_10000C004()
{
  uint64_t v1;

  ((void (*)(uint64_t *, unint64_t, unint64_t))String.hash(into:))(&v1, 0xD000000000000010, 0x800000010000E930);
  swift_bridgeObjectRelease(0x800000010000E930);
  return Hasher._finalize()();
}

uint64_t sub_10000C088@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::String v3;
  void *v4;
  Swift::Int v5;
  uint64_t result;

  v3._countAndFlagsBits = *a1;
  v4 = (void *)a1[1];
  v3._object = v4;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100010480, v3);
  result = swift_bridgeObjectRelease(v4);
  *a2 = v5 != 0;
  return result;
}

uint64_t sub_10000C0D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_10000CA04();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000C100@<X0>(Swift::String string@<0:X0, 8:X1>, BOOL *a2@<X8>)
{
  void *object;
  Swift::String v3;
  Swift::Int v5;
  uint64_t result;

  object = string._object;
  v3._countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000104B8, v3);
  result = swift_bridgeObjectRelease(object);
  *a2 = v5 != 0;
  return result;
}

uint64_t sub_10000C154()
{
  return 0;
}

void sub_10000C160(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_10000C16C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000CC1C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000C194(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000CC1C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000C1BC(_QWORD *a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _BYTE v17[8];
  uint64_t v18;
  uint64_t v19;

  v8 = sub_10000B4FC(&qword_1000146D0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = &v17[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v12 = a1[3];
  v13 = a1[4];
  sub_10000B47C(a1, v12);
  v14 = sub_10000CC1C();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for PluginRequest.CodingKeys, &type metadata for PluginRequest.CodingKeys, v14, v12, v13);
  v17[0] = a2;
  v18 = a3;
  v19 = a4;
  sub_10000CF38();
  KeyedEncodingContainer.encode<A>(_:forKey:)(v17);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

unint64_t sub_10000C2C8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  unint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = sub_10000CAF0(a1);
  if (!v2)
  {
    *(_BYTE *)a2 = result;
    *(_QWORD *)(a2 + 8) = v5;
    *(_QWORD *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_10000C2F4(_QWORD *a1)
{
  uint64_t v1;

  return sub_10000C1BC(a1, *(_BYTE *)v1, *(_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 16));
}

uint64_t sub_10000C310(char a1, uint64_t a2, uint64_t a3)
{
  Swift::String v6;
  Swift::String v7;
  _BYTE v9[8];
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[0] = 0;
  v12[1] = 0xE000000000000000;
  v6._countAndFlagsBits = 0x646E616D6D6F635BLL;
  v6._object = (void *)0xEA0000000000203ALL;
  String.append(_:)(v6);
  v9[0] = a1;
  v10 = a2;
  v11 = a3;
  _print_unlocked<A, B>(_:_:)(v9, v12, &type metadata for JsonPayload, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  v7._countAndFlagsBits = 93;
  v7._object = (void *)0xE100000000000000;
  String.append(_:)(v7);
  return v12[0];
}

uint64_t sub_10000C3AC(_QWORD *a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _BYTE v17[8];
  uint64_t v18;
  uint64_t v19;

  v8 = sub_10000B4FC(&qword_1000146C0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = &v17[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v12 = a1[3];
  v13 = a1[4];
  sub_10000B47C(a1, v12);
  v14 = sub_10000CE6C();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for JsonPayload.CodingKeys, &type metadata for JsonPayload.CodingKeys, v14, v12, v13);
  v17[0] = a2;
  v18 = a3;
  v19 = a4;
  sub_10000CEF4();
  KeyedEncodingContainer.encode<A>(_:forKey:)(v17);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_10000C4B8(char a1)
{
  if ((a1 & 1) != 0)
    return 0x79747265706F7270;
  else
    return 0x646E616D6D6F63;
}

uint64_t sub_10000C4F8(_QWORD *a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;
  _BYTE v18[2];
  char v19;

  v17 = a4;
  v8 = sub_10000B4FC(&qword_100014728);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1[3];
  v13 = a1[4];
  sub_10000B47C(a1, v12);
  v14 = sub_10000D614();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for Request.CodingKeys, &type metadata for Request.CodingKeys, v14, v12, v13);
  v19 = a2;
  v18[1] = 0;
  sub_10000D69C();
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v19);
  if (!v4)
  {
    v18[0] = 1;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(a3, v17, v18, v8);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_10000C634()
{
  uint64_t v0;

  return sub_10000C310(*(_BYTE *)v0, *(_QWORD *)(v0 + 8), *(_QWORD *)(v0 + 16));
}

uint64_t destroy for JsonPayload(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 16));
}

__n128 initializeWithTake for Request(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for JsonPayload()
{
  return &type metadata for JsonPayload;
}

ValueMetadata *type metadata accessor for PluginRequest()
{
  return &type metadata for PluginRequest;
}

uint64_t sub_10000C690()
{
  return 1;
}

Swift::Int sub_10000C698()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

void sub_10000C6D8()
{
  Hasher._combine(_:)(0);
}

Swift::Int sub_10000C6FC(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

uint64_t sub_10000C73C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_10000CCA4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_10000C764(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000CE6C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000C78C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000CE6C();
  return CodingKey.debugDescription.getter(a1, v2);
}

unint64_t sub_10000C7B4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  unint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = sub_10000CD40(a1);
  if (!v2)
  {
    *(_BYTE *)a2 = result;
    *(_QWORD *)(a2 + 8) = v5;
    *(_QWORD *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_10000C7E0(_QWORD *a1)
{
  uint64_t v1;

  return sub_10000C3AC(a1, *(_BYTE *)v1, *(_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 16));
}

BOOL sub_10000C7FC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_10000C814()
{
  char *v0;

  return sub_10000C4B8(*v0);
}

uint64_t sub_10000C81C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_10000D3B0(a1, a2);
  *a3 = result;
  return result;
}

void sub_10000C840(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_10000C84C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000D614();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000C874(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000D614();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000C89C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = sub_10000D4A8(a1);
  if (!v2)
  {
    *(_BYTE *)a2 = result;
    *(_QWORD *)(a2 + 8) = v5;
    *(_QWORD *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_10000C8C8(_QWORD *a1)
{
  uint64_t v1;

  return sub_10000C4F8(a1, *(_BYTE *)v1, *(_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 16));
}

void sub_10000C8E4(char *a1)
{
  sub_10000BC90(*a1);
}

void sub_10000C8F0()
{
  char *v0;

  sub_10000BE10(*v0);
}

void sub_10000C8F8(uint64_t a1)
{
  char *v1;

  sub_10000BEF4(a1, *v1);
}

void sub_10000C900(uint64_t a1)
{
  char *v1;

  sub_10000BFAC(a1, *v1);
}

unint64_t sub_10000C908@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_10000DB08(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_10000C934@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_10000BBF8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10000C95C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_10000DAC4();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_10000C9B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_10000DAC4();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

uint64_t sub_10000CA04()
{
  return 0x7961702D6E6F736ALL;
}

Swift::Int sub_10000CA24()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  String.hash(into:)(v1, 0x7961702D6E6F736ALL, 0xEC00000064616F6CLL);
  return Hasher._finalize()();
}

uint64_t sub_10000CA7C(uint64_t a1)
{
  return String.hash(into:)(a1, 0x7961702D6E6F736ALL, 0xEC00000064616F6CLL);
}

Swift::Int sub_10000CA9C(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  String.hash(into:)(v2, 0x7961702D6E6F736ALL, 0xEC00000064616F6CLL);
  return Hasher._finalize()();
}

unint64_t sub_10000CAF0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v3 = sub_10000B4FC(&qword_100014690);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (unint64_t)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[3];
  v8 = a1[4];
  sub_10000B47C(a1, v7);
  v9 = sub_10000CC1C();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for PluginRequest.CodingKeys, &type metadata for PluginRequest.CodingKeys, v9, v7, v8);
  if (v1)
  {
    sub_10000B430(a1);
  }
  else
  {
    sub_10000CC60();
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v12);
    (*(void (**)(unint64_t, uint64_t))(v4 + 8))(v6, v3);
    v6 = v12;
    sub_10000B430(a1);
  }
  return v6;
}

unint64_t sub_10000CC1C()
{
  unint64_t result;

  result = qword_100014698;
  if (!qword_100014698)
  {
    result = swift_getWitnessTable(&unk_10000E6C0, &type metadata for PluginRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100014698);
  }
  return result;
}

unint64_t sub_10000CC60()
{
  unint64_t result;

  result = qword_1000146A0;
  if (!qword_1000146A0)
  {
    result = swift_getWitnessTable(&unk_10000E414, &type metadata for JsonPayload);
    atomic_store(result, (unint64_t *)&qword_1000146A0);
  }
  return result;
}

uint64_t sub_10000CCA4(uint64_t a1, uint64_t a2)
{
  char v4;
  char v5;

  if (a1 == 0x74736575716572 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease(a2);
    v5 = 0;
  }
  else
  {
    v4 = _stringCompareWithSmolCheck(_:_:expecting:)(0x74736575716572, 0xE700000000000000, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    v5 = v4 ^ 1;
  }
  return v5 & 1;
}

uint64_t sub_10000CD28()
{
  return 0x74736575716572;
}

unint64_t sub_10000CD40(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v3 = sub_10000B4FC(&qword_1000146A8);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (unint64_t)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[3];
  v8 = a1[4];
  sub_10000B47C(a1, v7);
  v9 = sub_10000CE6C();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for JsonPayload.CodingKeys, &type metadata for JsonPayload.CodingKeys, v9, v7, v8);
  if (v1)
  {
    sub_10000B430(a1);
  }
  else
  {
    sub_10000CEB0();
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v12);
    (*(void (**)(unint64_t, uint64_t))(v4 + 8))(v6, v3);
    v6 = v12;
    sub_10000B430(a1);
  }
  return v6;
}

unint64_t sub_10000CE6C()
{
  unint64_t result;

  result = qword_1000146B0;
  if (!qword_1000146B0)
  {
    result = swift_getWitnessTable(&unk_10000E670, &type metadata for JsonPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000146B0);
  }
  return result;
}

unint64_t sub_10000CEB0()
{
  unint64_t result;

  result = qword_1000146B8;
  if (!qword_1000146B8)
  {
    result = swift_getWitnessTable(&unk_10000E648, &type metadata for Request);
    atomic_store(result, (unint64_t *)&qword_1000146B8);
  }
  return result;
}

unint64_t sub_10000CEF4()
{
  unint64_t result;

  result = qword_1000146C8;
  if (!qword_1000146C8)
  {
    result = swift_getWitnessTable(&unk_10000E620, &type metadata for Request);
    atomic_store(result, (unint64_t *)&qword_1000146C8);
  }
  return result;
}

unint64_t sub_10000CF38()
{
  unint64_t result;

  result = qword_1000146D8;
  if (!qword_1000146D8)
  {
    result = swift_getWitnessTable(&unk_10000E3EC, &type metadata for JsonPayload);
    atomic_store(result, (unint64_t *)&qword_1000146D8);
  }
  return result;
}

uint64_t sub_10000CF88()
{
  return 0;
}

ValueMetadata *type metadata accessor for JsonPayload.CodingKeys()
{
  return &type metadata for JsonPayload.CodingKeys;
}

uint64_t _s24BooksEngagementExtension11JsonPayloadV10CodingKeysOwet_0(unsigned int *a1, int a2)
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

uint64_t _s24BooksEngagementExtension11JsonPayloadV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_10000D030 + 4 * byte_10000E358[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_10000D050 + 4 * byte_10000E35D[v4]))();
}

_BYTE *sub_10000D030(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_10000D050(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10000D058(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10000D060(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10000D068(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10000D070(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for PluginRequest.CodingKeys()
{
  return &type metadata for PluginRequest.CodingKeys;
}

uint64_t _s24BooksEngagementExtension7RequestVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t _s24BooksEngagementExtension7RequestVwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t _s24BooksEngagementExtension7RequestVwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t _s24BooksEngagementExtension7RequestVwet_0(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t _s24BooksEngagementExtension7RequestVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for Request()
{
  return &type metadata for Request;
}

unint64_t sub_10000D204()
{
  unint64_t result;

  result = qword_1000146E0;
  if (!qword_1000146E0)
  {
    result = swift_getWitnessTable(&unk_10000E540, &type metadata for PluginRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000146E0);
  }
  return result;
}

unint64_t sub_10000D24C()
{
  unint64_t result;

  result = qword_1000146E8;
  if (!qword_1000146E8)
  {
    result = swift_getWitnessTable(&unk_10000E5F8, &type metadata for JsonPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000146E8);
  }
  return result;
}

unint64_t sub_10000D294()
{
  unint64_t result;

  result = qword_1000146F0;
  if (!qword_1000146F0)
  {
    result = swift_getWitnessTable(&unk_10000E568, &type metadata for JsonPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000146F0);
  }
  return result;
}

unint64_t sub_10000D2DC()
{
  unint64_t result;

  result = qword_1000146F8;
  if (!qword_1000146F8)
  {
    result = swift_getWitnessTable(&unk_10000E590, &type metadata for JsonPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000146F8);
  }
  return result;
}

unint64_t sub_10000D324()
{
  unint64_t result;

  result = qword_100014700;
  if (!qword_100014700)
  {
    result = swift_getWitnessTable(&unk_10000E478, &type metadata for PluginRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100014700);
  }
  return result;
}

unint64_t sub_10000D36C()
{
  unint64_t result;

  result = qword_100014708;
  if (!qword_100014708)
  {
    result = swift_getWitnessTable(&unk_10000E4A0, &type metadata for PluginRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100014708);
  }
  return result;
}

uint64_t sub_10000D3B0(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x646E616D6D6F63 && a2 == 0xE700000000000000;
  if (v3
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x646E616D6D6F63, 0xE700000000000000, a1, a2, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 0;
  }
  else if (a1 == 0x79747265706F7270 && a2 == 0xEC000000656D614ELL)
  {
    swift_bridgeObjectRelease(0xEC000000656D614ELL);
    return 1;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x79747265706F7270, 0xEC000000656D614ELL, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_10000D4A8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _BYTE v12[2];
  uint64_t v13;

  v3 = sub_10000B4FC(&qword_100014710);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 3];
  v7 = a1[3];
  v8 = a1[4];
  sub_10000B47C(a1, v7);
  v9 = sub_10000D614();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for Request.CodingKeys, &type metadata for Request.CodingKeys, v9, v7, v8);
  if (!v1)
  {
    v12[1] = 0;
    sub_10000D658();
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v13);
    v7 = v13;
    v12[0] = 1;
    KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v12, v3);
    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
  }
  sub_10000B430(a1);
  return v7;
}

unint64_t sub_10000D614()
{
  unint64_t result;

  result = qword_100014718;
  if (!qword_100014718)
  {
    result = swift_getWitnessTable(&unk_10000E8C0, &type metadata for Request.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100014718);
  }
  return result;
}

unint64_t sub_10000D658()
{
  unint64_t result;

  result = qword_100014720;
  if (!qword_100014720)
  {
    result = swift_getWitnessTable(&unk_10000E898, &type metadata for Command);
    atomic_store(result, (unint64_t *)&qword_100014720);
  }
  return result;
}

unint64_t sub_10000D69C()
{
  unint64_t result;

  result = qword_100014730;
  if (!qword_100014730)
  {
    result = swift_getWitnessTable(&unk_10000E870, &type metadata for Command);
    atomic_store(result, (unint64_t *)&qword_100014730);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for Request.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
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
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for Request.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000D7BC + 4 * byte_10000E367[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10000D7F0 + 4 * byte_10000E362[v4]))();
}

uint64_t sub_10000D7F0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000D7F8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000D800);
  return result;
}

uint64_t sub_10000D80C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000D814);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_10000D818(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000D820(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_10000D82C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Request.CodingKeys()
{
  return &type metadata for Request.CodingKeys;
}

uint64_t getEnumTagSinglePayload for Command(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for Command(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000D924 + 4 * byte_10000E371[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_10000D958 + 4 * byte_10000E36C[v4]))();
}

uint64_t sub_10000D958(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000D960(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000D968);
  return result;
}

uint64_t sub_10000D974(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000D97CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_10000D980(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000D988(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Command()
{
  return &type metadata for Command;
}

unint64_t sub_10000D9A8()
{
  unint64_t result;

  result = qword_100014738;
  if (!qword_100014738)
  {
    result = swift_getWitnessTable(&unk_10000E790, &type metadata for Command);
    atomic_store(result, (unint64_t *)&qword_100014738);
  }
  return result;
}

unint64_t sub_10000D9F0()
{
  unint64_t result;

  result = qword_100014740;
  if (!qword_100014740)
  {
    result = swift_getWitnessTable(&unk_10000E848, &type metadata for Request.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100014740);
  }
  return result;
}

unint64_t sub_10000DA38()
{
  unint64_t result;

  result = qword_100014748;
  if (!qword_100014748)
  {
    result = swift_getWitnessTable(&unk_10000E7B8, &type metadata for Request.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100014748);
  }
  return result;
}

unint64_t sub_10000DA80()
{
  unint64_t result;

  result = qword_100014750;
  if (!qword_100014750)
  {
    result = swift_getWitnessTable(&unk_10000E7E0, &type metadata for Request.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100014750);
  }
  return result;
}

unint64_t sub_10000DAC4()
{
  unint64_t result;

  result = qword_100014758;
  if (!qword_100014758)
  {
    result = swift_getWitnessTable(&unk_10000E718, &type metadata for Command);
    atomic_store(result, (unint64_t *)&qword_100014758);
  }
  return result;
}

unint64_t sub_10000DB08(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000104F0, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 4)
    return 4;
  else
    return v3;
}

uint64_t sub_10000DB54()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_10000DBD0(v0, qword_1000156E0);
  sub_10000B4A0(v0, (uint64_t)qword_1000156E0);
  return Logger.init(subsystem:category:)(0xD000000000000010, 0x800000010000ECD0, 0xD000000000000018, 0x800000010000ECF0);
}

uint64_t *sub_10000DBD0(uint64_t a1, uint64_t *a2)
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
