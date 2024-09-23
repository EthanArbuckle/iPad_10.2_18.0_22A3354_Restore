uint64_t sub_100002F28(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  int64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_10000E354(&qword_10003DDE8);
  result = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v9 = 0;
    v10 = (uint64_t *)(v5 + 64);
    v11 = 1 << *(_BYTE *)(v5 + 32);
    v33 = -1 << v11;
    v34 = v11;
    if (v11 < 64)
      v12 = ~(-1 << v11);
    else
      v12 = -1;
    v13 = v12 & *(_QWORD *)(v5 + 64);
    v35 = (unint64_t)(v11 + 63) >> 6;
    v14 = result + 64;
    while (1)
    {
      if (v13)
      {
        v20 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        v21 = v20 | (v9 << 6);
      }
      else
      {
        v22 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
          return result;
        }
        if (v22 >= v35)
          goto LABEL_36;
        v23 = v10[v22];
        ++v9;
        if (!v23)
        {
          v9 = v22 + 1;
          if (v22 + 1 >= v35)
            goto LABEL_36;
          v23 = v10[v9];
          if (!v23)
          {
            v24 = v22 + 2;
            if (v24 >= v35)
            {
LABEL_36:
              if ((a2 & 1) != 0)
              {
                if (v34 >= 64)
                  bzero((void *)(v5 + 64), 8 * v35);
                else
                  *v10 = v33;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v23 = v10[v24];
            if (!v23)
            {
              while (1)
              {
                v9 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_44;
                if (v9 >= v35)
                  goto LABEL_36;
                v23 = v10[v9];
                ++v24;
                if (v23)
                  goto LABEL_33;
              }
            }
            v9 = v24;
          }
        }
LABEL_33:
        v13 = (v23 - 1) & v23;
        v21 = __clz(__rbit64(v23)) + (v9 << 6);
      }
      v29 = 8 * v21;
      v30 = *(_QWORD *)(v5 + 56);
      v31 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v29);
      v32 = *(_QWORD *)(v30 + v29);
      if ((a2 & 1) == 0)
        swift_retain(*(_QWORD *)(v30 + v29));
      result = static Hasher._hash(seed:_:)(*(_QWORD *)(v8 + 40), v31);
      v15 = -1 << *(_BYTE *)(v8 + 32);
      v16 = result & ~v15;
      v17 = v16 >> 6;
      if (((-1 << v16) & ~*(_QWORD *)(v14 + 8 * (v16 >> 6))) != 0)
      {
        v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v14 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_43;
          }
          v27 = v17 == v26;
          if (v17 == v26)
            v17 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v14 + 8 * v17);
        }
        while (v28 == -1);
        v18 = __clz(__rbit64(~v28)) + (v17 << 6);
      }
      *(_QWORD *)(v14 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      v19 = 8 * v18;
      *(_QWORD *)(*(_QWORD *)(v8 + 48) + v19) = v31;
      *(_QWORD *)(*(_QWORD *)(v8 + 56) + v19) = v32;
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

uint64_t sub_1000031DC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_10000E354(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

void sub_10000327C(uint64_t a1, uint64_t a2, void *a3)
{
  _BYTE v6[24];
  id v7;

  swift_beginAccess(a1 + OBJC_IVAR____TtC15audioanalyticsd6Server_clientServerInstances, v6, 33, 0);
  swift_retain(a2);
  sub_100003338((uint64_t *)&v7, a2);
  swift_endAccess(v6);
  swift_release(v7);
  swift_beginAccess(a1 + OBJC_IVAR____TtC15audioanalyticsd6Server_xpcConnections, v6, 33, 0);
  sub_100003C18((Swift::Int *)&v7, a3);
  swift_endAccess(v6);

}

uint64_t sub_100003338(uint64_t *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  Swift::Int v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v26;
  uint64_t v27;
  Swift::Int v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[9];
  uint64_t v34;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(*v2);
    v8 = swift_retain(a2);
    v9 = __CocoaSet.member(for:)(v8, v7);
    swift_release(a2);
    if (v9)
    {
      swift_bridgeObjectRelease(v6);
      swift_release(a2);
      v34 = v9;
      v10 = type metadata accessor for ClientServerInstance(0);
      swift_unknownObjectRetain(v9, v11);
      swift_dynamicCast(v33, &v34, (char *)&type metadata for Swift.AnyObject + 8, v10, 7);
      *a1 = v33[0];
      swift_unknownObjectRelease(v9);
      return 0;
    }
    result = __CocoaSet.count.getter(v7);
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v28 = sub_10001EDDC(v7, result + 1);
    v33[0] = v28;
    v29 = *(_QWORD *)(v28 + 16);
    if (*(_QWORD *)(v28 + 24) <= v29)
    {
      v32 = v29 + 1;
      swift_retain(a2);
      sub_10001F204(v32);
      v30 = v33[0];
    }
    else
    {
      v30 = v28;
      swift_retain(a2);
    }
    sub_10001F7A0(a2, v30);
    v27 = *v3;
    *v3 = v30;
  }
  else
  {
    Hasher.init(_seed:)(v33, *(_QWORD *)(v6 + 40));
    v13 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
    Hasher._combine(_:)(*(_DWORD *)(a2 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid));
    v14 = *(_QWORD *)(a2 + 24);
    v15 = *(_QWORD *)(a2 + 32);
    swift_bridgeObjectRetain(v6);
    swift_bridgeObjectRetain(v15);
    String.hash(into:)(v33, v14, v15);
    swift_bridgeObjectRelease(v15);
    v16 = Hasher._finalize()();
    v17 = -1 << *(_BYTE *)(v6 + 32);
    v18 = v16 & ~v17;
    if (((*(_QWORD *)(v6 + 56 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) != 0)
    {
      v19 = ~v17;
      v20 = *(_QWORD *)(v6 + 48);
      v21 = *(_DWORD *)(a2 + v13);
      v22 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
      do
      {
        v23 = *(_QWORD *)(v20 + 8 * v18);
        if (*(_DWORD *)(v23 + v22) == v21)
        {
          v24 = *(_QWORD *)(v23 + 24) == *(_QWORD *)(a2 + 24) && *(_QWORD *)(v23 + 32) == *(_QWORD *)(a2 + 32);
          if (v24 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
          {
            swift_release(a2);
            swift_bridgeObjectRelease(v6);
            v31 = *(_QWORD *)(*(_QWORD *)(*v3 + 48) + 8 * v18);
            *a1 = v31;
            swift_retain(v31);
            return 0;
          }
          v22 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
        }
        v18 = (v18 + 1) & v19;
      }
      while (((*(_QWORD *)(v6 + 56 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) != 0);
    }
    swift_bridgeObjectRelease(v6);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v33[0] = *v3;
    *v3 = 0x8000000000000000;
    v26 = swift_retain(a2);
    sub_10000F6B0(v26, v18, isUniquelyReferenced_nonNull_native);
    v27 = *v3;
    *v3 = v33[0];
  }
  swift_bridgeObjectRelease(v27);
  *a1 = a2;
  return 1;
}

uint64_t sub_1000035FC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t result;
  void *v11;

  v4 = *a1;
  swift_bridgeObjectRetain(*a1);
  v6 = sub_10002AB14(v5);
  swift_bridgeObjectRelease(v4);
  v7 = *(_QWORD *)(v6 + 16);
  if (v7)
  {
    sub_10000E354(&qword_10003D680);
    v8 = (void *)static _DictionaryStorage.allocate(capacity:)(v7);
  }
  else
  {
    v8 = &_swiftEmptyDictionarySingleton;
  }
  v11 = v8;
  swift_bridgeObjectRetain(v6);
  sub_1000042F8(v9, 1, &v11);
  if (v2)
  {
    result = swift_unexpectedError(v2, "Swift/Dictionary.swift", 22, 1, 489);
    __break(1u);
  }
  else
  {
    result = swift_bridgeObjectRelease(v6);
    *a2 = v11;
  }
  return result;
}

unint64_t sub_1000036D4()
{
  _QWORD *v0;
  uint64_t Strong;
  uint64_t v2;
  uint64_t v3;
  _BYTE v5[24];

  Strong = swift_weakLoadStrong(*v0 + 56);
  if (!Strong)
    return sub_10000A0B4((uint64_t)_swiftEmptyArrayStorage);
  v2 = Strong;
  swift_beginAccess(Strong + 72, v5, 0, 0);
  v3 = *(_QWORD *)(v2 + 72);
  swift_bridgeObjectRetain(v3);
  swift_release(v2);
  return v3;
}

_QWORD *sub_10000374C(int a1, uint64_t a2, unint64_t a3, uint64_t a4, void *a5, _QWORD *a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v31;
  uint64_t v32;

  v12 = type metadata accessor for Date(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = __chkstk_darwin();
  v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = static Logger.service.getter(v14);
  *(_QWORD *)((char *)a6 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID) = &_swiftEmptyDictionarySingleton;
  v18 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation;
  *(double *)((char *)a6 + v18) = static Double.now()(v17);
  v19 = a2;
  v20 = a4;
  *(_DWORD *)((char *)a6 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid) = a1;
  a6[3] = v19;
  a6[4] = a3;
  v21 = (_QWORD *)((char *)a6 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_server);
  *v21 = a5;
  v21[1] = &off_100039AD0;
  a6[2] = a4;
  swift_bridgeObjectRetain(a3);
  v22 = a5;
  v23 = swift_retain(a4);
  Date.init()(v23);
  (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))((uint64_t)a6 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_clientStartDate, v16, v12);
  swift_retain_n(a6, 2);
  v24 = swift_bridgeObjectRetain(a3);
  v25 = Logger.logObject.getter(v24);
  v26 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = swift_slowAlloc(18, -1);
    v28 = swift_slowAlloc(32, -1);
    v32 = v28;
    *(_DWORD *)v27 = 136380931;
    swift_bridgeObjectRetain(a3);
    v31 = sub_10000A7E4(v19, a3, &v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, &v32, v27 + 4, v27 + 12);
    swift_bridgeObjectRelease_n(a3, 3);
    *(_WORD *)(v27 + 12) = 1024;
    v29 = *(_DWORD *)((char *)a6 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid);
    swift_release(a6);
    LODWORD(v31) = v29;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, (char *)&v31 + 4, v27 + 14, v27 + 18);
    swift_release(a6);
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "ClientServerInstance created. { processName=%{private}s, pid=%d", (uint8_t *)v27, 0x12u);
    swift_arrayDestroy(v28, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v28, -1, -1);
    swift_slowDealloc(v27, -1, -1);

    swift_release(v20);
  }
  else
  {
    swift_bridgeObjectRelease_n(a3, 2);

    swift_release(a4);
    swift_release_n(a6, 2);
  }
  return a6;
}

uint64_t sub_100003A30(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  size_t v16;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
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
    v15 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_10000E354(&qword_10003E058);
  v11 = *(_QWORD *)(sub_10000E354(&qword_10003D678) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  v16 = j__malloc_size(v15);
  if (!v12)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v16 - v14 == 0x8000000000000000 && v12 == -1)
    goto LABEL_34;
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  v18 = sub_10000E354(&qword_10003D678);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (char *)v15 + v20;
  v22 = (char *)a4 + v20;
  if ((a1 & 1) != 0)
  {
    if (v15 < a4 || v21 >= &v22[*(_QWORD *)(v19 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack(v21, v22, v8, v18);
    }
    else if (v15 != a4)
    {
      swift_arrayInitWithTakeBackToFront(v21);
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v23 = *(_QWORD *)(v19 + 72) * v8;
  v24 = &v21[v23];
  v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy(v21);
LABEL_32:
    swift_release(a4);
    return (uint64_t)v15;
  }
LABEL_36:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100003C18(Swift::Int *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  Swift::Int v13;
  Swift::Int v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  id v20;
  char v21;
  void *v22;
  id v23;
  Swift::Int v24;
  unint64_t v25;
  uint64_t v26;
  id v27;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  Swift::Int v33;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(*v2);
    v8 = a2;
    v9 = __CocoaSet.member(for:)(v8, v7);

    if (v9)
    {
      swift_bridgeObjectRelease(v6);

      v32 = v9;
      v10 = sub_10000F8F8(0, &qword_10003DBB0, NSXPCConnection_ptr);
      swift_unknownObjectRetain(v9, v11);
      swift_dynamicCast(&v33, &v32, (char *)&type metadata for Swift.AnyObject + 8, v10, 7);
      *a1 = v33;
      swift_unknownObjectRelease(v9);
      return 0;
    }
    result = __CocoaSet.count.getter(v7);
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v24 = sub_10001F010(v7, result + 1);
    v33 = v24;
    v25 = *(_QWORD *)(v24 + 16);
    if (*(_QWORD *)(v24 + 24) <= v25)
    {
      v30 = v25 + 1;
      v31 = v8;
      sub_10001F504(v30);
      v26 = v33;
    }
    else
    {
      v26 = v24;
      v27 = v8;
    }
    sub_10001F870((uint64_t)v8, v26);
    v29 = *v3;
    *v3 = v26;
  }
  else
  {
    v13 = *(_QWORD *)(v6 + 40);
    swift_bridgeObjectRetain(v6);
    v14 = NSObject._rawHashValue(seed:)(v13);
    v15 = -1 << *(_BYTE *)(v6 + 32);
    v16 = v14 & ~v15;
    if (((*(_QWORD *)(v6 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) != 0)
    {
      sub_10000F8F8(0, &qword_10003DBB0, NSXPCConnection_ptr);
      v17 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v16);
      v18 = static NSObject.== infix(_:_:)();

      if ((v18 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease(v6);
        v22 = *(void **)(*(_QWORD *)(*v3 + 48) + 8 * v16);
        *a1 = (Swift::Int)v22;
        v23 = v22;
        return 0;
      }
      v19 = ~v15;
      while (1)
      {
        v16 = (v16 + 1) & v19;
        if (((*(_QWORD *)(v6 + 56 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8)) >> v16) & 1) == 0)
          break;
        v20 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v16);
        v21 = static NSObject.== infix(_:_:)();

        if ((v21 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease(v6);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v33 = *v3;
    *v3 = 0x8000000000000000;
    v8 = a2;
    sub_10000F52C((uint64_t)v8, v16, isUniquelyReferenced_nonNull_native);
    v29 = *v3;
    *v3 = v33;
  }
  swift_bridgeObjectRelease(v29);
  *a1 = (Swift::Int)v8;
  return 1;
}

uint64_t sub_100003EB4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;

  return sub_100003ECC(*(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_100003ECC@<X0>(unint64_t a1@<X1>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_10000BF8C(a1);
  *a2 = result & 1;
  return result;
}

uint64_t sub_100003F0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t Strong;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v16[24];

  v1 = sub_10000E354(&qword_10003DA70);
  __chkstk_darwin(v1);
  v3 = &v16[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v4 = type metadata accessor for Keys(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  Strong = swift_weakLoadStrong(v0 + 56);
  if (Strong)
  {
    v9 = Strong;
    swift_beginAccess(Strong + 72, v16, 0, 0);
    v10 = *(_QWORD *)(v9 + 72);
    swift_bridgeObjectRetain(v10);
    swift_release(v9);
  }
  else
  {
    v10 = sub_10000A0B4((uint64_t)_swiftEmptyArrayStorage);
  }
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, enum case for Keys.applicationName(_:), v4);
  Dictionary<>.subscript.getter(v7, v10);
  swift_bridgeObjectRelease(v10);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v11 = type metadata accessor for SimpleType(0);
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v3, 1, v11) == 1)
  {
    sub_1000180B4((uint64_t)v3);
LABEL_9:
    v13 = *(_QWORD *)(v0 + 16);
    swift_bridgeObjectRetain(*(_QWORD *)(v0 + 24));
    return v13;
  }
  if ((*(unsigned int (**)(char *, uint64_t))(v12 + 88))(v3, v11) != enum case for SimpleType.string(_:))
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v3, v11);
    goto LABEL_9;
  }
  (*(void (**)(char *, uint64_t))(v12 + 96))(v3, v11);
  return *(_QWORD *)v3;
}

uint64_t sub_1000040DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t Strong;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  _BYTE v21[24];

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = &v21[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  a1 += 16;
  swift_beginAccess(a1, v21, 0, 0);
  Strong = swift_weakLoadStrong(a1);
  if (Strong)
  {
    v9 = Strong;
    v10 = Logger.logObject.getter(Strong);
    v11 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc(12, -1);
      *(_DWORD *)v12 = 134217984;
      v20 = a2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, v21, v12 + 4, v12 + 12);
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "startSession() called. { reporterID=%lld }", v12, 0xCu);
      swift_slowDealloc(v12, -1, -1);
    }

    *(double *)(v9 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) = *(double *)(v9 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation)
                                                                                                 + 5.0;
    v13 = sub_10000E3D4(a2, 0, 0x7472617473, 0xE500000000000000);
    if (v13)
    {
      v14 = v13;
      sub_100004B54();
      swift_release(v14);
    }
    return swift_release(v9);
  }
  else
  {
    v16 = static Logger.service.getter(0);
    v17 = Logger.logObject.getter(v16);
    v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "ClientServerInstance is gone. { action=startSession }", v19, 2u);
      swift_slowDealloc(v19, -1, -1);
    }

    return (*(uint64_t (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_1000042F8(uint64_t a1, int a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t);
  _QWORD *v22;
  char v23;
  unint64_t v24;
  uint64_t v25;
  _BOOL8 v26;
  uint64_t v27;
  char v28;
  unint64_t v29;
  char v30;
  uint64_t result;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  BOOL v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  unint64_t v48;
  char v49;
  uint64_t v50;
  _BOOL8 v51;
  uint64_t v52;
  char v53;
  char v54;
  _QWORD *v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  Swift::String v59;
  Swift::String v60;
  _QWORD v61[2];
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;

  v7 = type metadata accessor for SimpleType(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_10000E354(&qword_10003D678);
  v12 = __chkstk_darwin(v11);
  v15 = (_QWORD *)((char *)v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v16 = *(_QWORD *)(a1 + 16);
  if (!v16)
    return swift_bridgeObjectRelease(a1);
  LODWORD(v65) = a2;
  v61[1] = v3;
  v62 = v16;
  v17 = (char *)v15 + *(int *)(v12 + 48);
  v61[0] = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v18 = a1 + v61[0];
  v67 = *(_QWORD *)(v13 + 72);
  v64 = a1;
  swift_bridgeObjectRetain(a1);
  sub_1000047AC(v18, (uint64_t)v15, &qword_10003D678);
  v19 = v15[1];
  v72 = *v15;
  v20 = v72;
  v73 = v19;
  v63 = v8;
  v21 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  v68 = v7;
  v69 = v10;
  v66 = v17;
  v21(v10, v17, v7);
  v22 = (_QWORD *)*a3;
  v24 = sub_10000D9BC(v20, v19);
  v25 = v22[2];
  v26 = (v23 & 1) == 0;
  v27 = v25 + v26;
  if (__OFADD__(v25, v26))
    goto LABEL_23;
  v28 = v23;
  if (v22[3] >= v27)
  {
    if ((v65 & 1) != 0)
    {
      if ((v23 & 1) != 0)
        goto LABEL_10;
    }
    else
    {
      sub_10000EEA4();
      if ((v28 & 1) != 0)
        goto LABEL_10;
    }
LABEL_13:
    v36 = (_QWORD *)*a3;
    *(_QWORD *)(*a3 + 8 * (v24 >> 6) + 64) |= 1 << v24;
    v37 = (uint64_t *)(v36[6] + 16 * v24);
    *v37 = v20;
    v37[1] = v19;
    v38 = v36[7];
    v65 = *(_QWORD *)(v63 + 72);
    v39 = v68;
    v21((char *)(v38 + v65 * v24), v69, v68);
    v40 = v36[2];
    v41 = __OFADD__(v40, 1);
    v42 = v40 + 1;
    if (v41)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v36[2] = v42;
    v43 = v62 - 1;
    if (v62 == 1)
      return swift_bridgeObjectRelease_n(v64, 2);
    v44 = v64 + v67 + v61[0];
    while (1)
    {
      sub_1000047AC(v44, (uint64_t)v15, &qword_10003D678);
      v46 = v15[1];
      v72 = *v15;
      v45 = v72;
      v73 = v46;
      v21(v69, v66, v39);
      v47 = (_QWORD *)*a3;
      v48 = sub_10000D9BC(v45, v46);
      v50 = v47[2];
      v51 = (v49 & 1) == 0;
      v41 = __OFADD__(v50, v51);
      v52 = v50 + v51;
      if (v41)
        break;
      v53 = v49;
      if (v47[3] < v52)
      {
        sub_10000DB84(v52, 1);
        v48 = sub_10000D9BC(v45, v46);
        if ((v53 & 1) != (v54 & 1))
          goto LABEL_25;
      }
      if ((v53 & 1) != 0)
        goto LABEL_10;
      v55 = (_QWORD *)*a3;
      *(_QWORD *)(*a3 + 8 * (v48 >> 6) + 64) |= 1 << v48;
      v56 = (uint64_t *)(v55[6] + 16 * v48);
      *v56 = v45;
      v56[1] = v46;
      v39 = v68;
      v21((char *)(v55[7] + v65 * v48), v69, v68);
      v57 = v55[2];
      v41 = __OFADD__(v57, 1);
      v58 = v57 + 1;
      if (v41)
        goto LABEL_24;
      v55[2] = v58;
      v44 += v67;
      if (!--v43)
        return swift_bridgeObjectRelease_n(v64, 2);
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_10000DB84(v27, v65 & 1);
  v29 = sub_10000D9BC(v20, v19);
  if ((v28 & 1) == (v30 & 1))
  {
    v24 = v29;
    if ((v28 & 1) == 0)
      goto LABEL_13;
LABEL_10:
    v32 = swift_allocError(&type metadata for _MergeError, &protocol witness table for _MergeError, 0, 0);
    swift_willThrow(v32);
    v74 = v32;
    swift_errorRetain(v32);
    v33 = sub_10000E354(&qword_10003E280);
    if ((swift_dynamicCast(v33, &v74, v33, &type metadata for _MergeError, 0) & 1) == 0)
    {
      v34 = v64;
      swift_bridgeObjectRelease(v64);
      (*(void (**)(char *, uint64_t))(v63 + 8))(v69, v68);
      v35 = v73;
      swift_bridgeObjectRelease(v34);
      swift_bridgeObjectRelease(v35);
      return swift_errorRelease(v74);
    }
    goto LABEL_26;
  }
LABEL_25:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
LABEL_26:
  v70 = 0;
  v71 = 0xE000000000000000;
  _StringGuts.grow(_:)(30);
  v59._object = (void *)0x80000001000337A0;
  v59._countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v59);
  _print_unlocked<A, B>(_:_:)(&v72, &v70, &type metadata for String, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  v60._countAndFlagsBits = 39;
  v60._object = (void *)0xE100000000000000;
  String.append(_:)(v60);
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v70, v71, "Swift/NativeDictionary.swift", 28, 2, 783, 0);
  __break(1u);
  return result;
}

uint64_t sub_1000047AC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_10000E354(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_1000047F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[16];

  v1 = v0;
  v2 = sub_10000E354(&qword_10003E040);
  __chkstk_darwin(v2);
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for DispatchPredicate(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (uint64_t *)((char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = *(void **)(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
  *v8 = v9;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v6 + 104))(v8, enum case for DispatchPredicate.onQueue(_:), v5);
  v10 = v9;
  LOBYTE(v9) = _dispatchPreconditionTest(_:)(v8);
  (*(void (**)(_QWORD *, uint64_t))(v6 + 8))(v8, v5);
  if ((v9 & 1) == 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  v11 = swift_retain(v1);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v14 = 134217984;
    v23 = *(_QWORD *)(v1 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, v24, v14 + 4, v14 + 12);
    swift_release(v1);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "startOnQueue() called. { reporterID=%lld }", v14, 0xCu);
    swift_slowDealloc(v14, -1, -1);
  }
  else
  {
    swift_release(v1);
  }

  v15 = type metadata accessor for Date(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v4, 1, 1, v15);
  v16 = v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_stopSignalTime;
  swift_beginAccess(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_stopSignalTime, &v23, 33, 0);
  sub_1000031DC((uint64_t)v4, v16, &qword_10003E040);
  swift_endAccess(&v23);
  if (*(_BYTE *)(v1 + 66) != 1)
  {
    *(_BYTE *)(v1 + 66) = 1;
    if (qword_10003D630 == -1)
    {
LABEL_9:
      sub_100008194(qword_10003E378);
      sub_100004C8C();
      v21 = (void *)objc_opt_self(Trace);
      objc_msgSend(v21, "post:arg1:arg2:arg3:arg4:", 4618, static Utilities.positiveReporterID(_:)(*(_QWORD *)(v1 + 16)), *(unsigned __int16 *)(v1 + 64), 0, 0);
      return;
    }
LABEL_13:
    swift_once(&qword_10003D630, sub_1000301F0);
    goto LABEL_9;
  }
  v17 = swift_retain(v1);
  v18 = Logger.logObject.getter(v17);
  v19 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v20 = 134217984;
    v23 = *(_QWORD *)(v1 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, v24, v20 + 4, v20 + 12);
    swift_release(v1);
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Session already started. { reporterID=%lld }", v20, 0xCu);
    swift_slowDealloc(v20, -1, -1);
  }
  else
  {
    swift_release(v1);
  }

}

uint64_t sub_100004B54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t result;
  _QWORD v8[5];
  uint64_t v9;

  v1 = v0;
  type metadata accessor for OsTransactionHandler(0);
  v2 = static OsTransactionHandler.shared.getter();
  OsTransactionHandler.sessionStarted(for:)(*(_QWORD *)(v1 + 16));
  swift_release(v2);
  v3 = *(NSObject **)(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
  v4 = swift_allocObject(&unk_10003A2B0, 32, 7);
  *(_QWORD *)(v4 + 16) = sub_10000F9B8;
  *(_QWORD *)(v4 + 24) = v1;
  v8[4] = sub_100005D74;
  v9 = v4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_100005D54;
  v8[3] = &unk_10003A2C8;
  v5 = _Block_copy(v8);
  v6 = v9;
  swift_retain(v1);
  swift_retain(v4);
  swift_release(v6);
  dispatch_sync(v3, v5);
  _Block_release(v5);
  LOBYTE(v3) = swift_isEscapingClosureAtFileLocation(v4, "", 111, 88, 24, 1);
  swift_release(v1);
  result = swift_release(v4);
  if ((v3 & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_100004C8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  Swift::OpaquePointer v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  _BYTE v28[16];
  void *v29;
  _BYTE v30[32];
  uint64_t v31;
  uint64_t v32;
  void *v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  char v37;

  v1 = v0;
  v2 = sub_10000E354(&qword_10003D6F0);
  __chkstk_darwin(v2);
  v4 = &v28[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = type metadata accessor for Message(0);
  v6 = *(_QWORD *)(v5 - 8);
  result = __chkstk_darwin(v5);
  v9 = &v28[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if ((*(_BYTE *)(v0 + 24) & 1) == 0)
  {
    v10 = *(_QWORD *)(v0 + OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessages);
    v11 = *(_QWORD *)(v0 + OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessagesUnique);
    v12 = *(void **)(v0 + 16);
    v13 = *(_BYTE *)(v0 + 66);
    v14 = *(_QWORD *)(v0 + 32);
    v15 = *(_QWORD *)(v0 + 40);
    v30[24] = 0;
    v31 = v10;
    v32 = v11;
    v33 = v12;
    v34 = v13;
    v35 = v14;
    v36 = v15;
    v37 = 0;
    swift_bridgeObjectRetain(v15);
    v16 = sub_100004F88();
    swift_bridgeObjectRelease(v15);
    v17 = type metadata accessor for Message.Metadata(0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v4, 1, 1, v17);
    Message.init(category:type:content:metadata:)(8, 1, v16, v4);
    v18 = *(_QWORD *)(v1 + 80);
    if (v18 && *(_QWORD *)(v18 + 16))
    {
      swift_bridgeObjectRetain(*(_QWORD *)(v1 + 80));
      v20 = Config.neededPreviousFields.getter(v19);
      Message.copyPrevious(fields:from:)(v20, v18);
      swift_bridgeObjectRelease(v18);
      swift_bridgeObjectRelease(v20);
    }
    swift_beginAccess(&static SystemMonitor.shared, v30, 0, 0);
    v21 = static SystemMonitor.shared;
    if (static SystemMonitor.shared)
    {
      v22 = *(_QWORD *)(static SystemMonitor.shared + 16);
      swift_retain(static SystemMonitor.shared);
      swift_retain(v22);
      os_unfair_lock_lock((os_unfair_lock_t)(v22 + 24));
      sub_1000035FC((_QWORD *)(v22 + 16), &v29);
      os_unfair_lock_unlock((os_unfair_lock_t)(v22 + 24));
      v23._rawValue = v29;
      swift_release(v21);
      swift_release(v22);
      Message.addToContent(from:)(v23);
      swift_bridgeObjectRelease(v23._rawValue);
    }
    if ((sub_10000BF8C((unint64_t)v9) & 1) == 0)
    {
      v24 = swift_retain(v1);
      v25 = Logger.logObject.getter(v24);
      v26 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v25, v26))
      {
        v27 = (uint8_t *)swift_slowAlloc(12, -1);
        *(_DWORD *)v27 = 134217984;
        v29 = v12;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, v30, v27 + 4, v27 + 12);
        swift_release(v1);
        _os_log_impl((void *)&_mh_execute_header, v25, v26, "Start message dropped. { reporterID=%lld }", v27, 0xCu);
        swift_slowDealloc(v27, -1, -1);

      }
      else
      {

        swift_release(v1);
      }
    }
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v9, v5);
  }
  return result;
}

unint64_t sub_100004F88()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  int v17;
  uint64_t v18;
  int *v19;
  uint64_t v20;
  uint64_t *v21;
  void *v22;
  uint64_t v23;
  void (*v24)(void);
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  void (*v28)(void);
  unint64_t *v29;
  uint64_t v30;
  _QWORD *v31;
  Swift::String v32;
  unint64_t v33;
  unsigned __int8 *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t *v41;
  int *v42;
  _QWORD *v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t *v46;
  _QWORD *v47;
  _QWORD *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  int *v58;
  _OWORD *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(void);
  int *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  unint64_t *v71;
  _BYTE *v72;
  Swift::String v73;
  unint64_t v74;
  uint64_t v75;
  unint64_t v76;
  _BYTE *v77;
  uint64_t v78;
  char isUniquelyReferenced_nonNull_native;
  _BYTE *v81;
  uint64_t v82;
  char *v83;
  void (*v84)(char *, uint64_t);
  uint64_t v85;
  uint64_t (*v86)(char *, _QWORD, uint64_t);
  int *v87;
  unsigned int v88;
  char *v89;
  uint64_t v90;
  char *v91;
  _QWORD *v92;
  uint64_t v93;
  uint64_t v94;
  int v95;
  unsigned __int8 *v96;
  void (*v97)(void);
  unint64_t v98;
  unint64_t v99;

  v1 = type metadata accessor for SimpleType(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  v83 = (char *)&v81 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v81 = (char *)&v81 - v5;
  v90 = type metadata accessor for Keys(0);
  v92 = *(_QWORD **)(v90 - 8);
  v6 = __chkstk_darwin(v90);
  v91 = (char *)&v81 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v89 = (char *)&v81 - v8;
  v9 = sub_10000E354(&qword_10003E058);
  v10 = sub_10000E354(&qword_10003D678);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = swift_allocObject(v9, v14 + 6 * v12, v13 | 7);
  *(_OWORD *)(v15 + 16) = xmmword_100032080;
  v93 = v15;
  v16 = (_QWORD *)(v15 + v14);
  *v16 = 0x646F6874656DLL;
  v16[1] = 0xE600000000000000;
  v96 = v0;
  v17 = *v0;
  v82 = v2;
  v95 = v17;
  if (v17 == 2)
  {
    v18 = 1886352499;
    v23 = *(int *)(v10 + 48);
    v19 = (int *)(v10 + 48);
    v21 = (_QWORD *)((char *)v16 + v23);
    v22 = (void *)0xE400000000000000;
    goto LABEL_5;
  }
  if (v17 == 1)
  {
    v18 = 0x735F6C616E676973;
    v20 = *(int *)(v10 + 48);
    v19 = (int *)(v10 + 48);
    v21 = (_QWORD *)((char *)v16 + v20);
    v22 = (void *)0xEB00000000706F74;
LABEL_5:
    *v21 = v18;
    v21[1] = (uint64_t)v22;
    v24 = *(void (**)(void))(v2 + 104);
    v88 = enum case for SimpleType.string(_:);
    v25 = v1;
    v97 = v24;
    v24();
    v98 = 0x7373656D5F6D756ELL;
    goto LABEL_7;
  }
  v25 = v1;
  v26 = *(int *)(v10 + 48);
  v19 = (int *)(v10 + 48);
  v27 = (_QWORD *)((char *)v16 + v26);
  v22 = (void *)0xE500000000000000;
  *v27 = 0x7472617473;
  v27[1] = 0xE500000000000000;
  v28 = *(void (**)(void))(v2 + 104);
  v88 = enum case for SimpleType.string(_:);
  v97 = v28;
  v28();
  v98 = 0x7373656D5F6D756ELL;
  v18 = 0x7472617473;
LABEL_7:
  v87 = v19;
  v99 = 0xED00005F73656761;
  v29 = (_QWORD *)((char *)v16 + v12);
  v30 = *v19;
  v94 = v12;
  v31 = (_QWORD *)((char *)v16 + v12 + v30);
  v32._countAndFlagsBits = v18;
  v32._object = v22;
  String.append(_:)(v32);
  swift_bridgeObjectRelease(v22);
  v33 = v99;
  *v29 = v98;
  v29[1] = v33;
  v34 = v96;
  *v31 = *((_QWORD *)v96 + 1);
  LODWORD(v86) = enum case for SimpleType.uint(_:);
  ((void (*)(_QWORD *))v97)(v31);
  v98 = 0;
  v99 = 0xE000000000000000;
  _StringGuts.grow(_:)(22);
  swift_bridgeObjectRelease(v99);
  v98 = 0xD000000000000014;
  v99 = 0x80000001000336B0;
  v35 = 0x735F6C616E676973;
  v36 = 0xEB00000000706F74;
  if (v95 != 1)
  {
    v35 = 1886352499;
    v36 = 0xE400000000000000;
  }
  if (v95)
    v37 = v35;
  else
    v37 = 0x7472617473;
  if (v95)
    v38 = v36;
  else
    v38 = 0xE500000000000000;
  v39 = v25;
  v40 = v94;
  v41 = (_QWORD *)((char *)v16 + 2 * v94);
  v42 = v87;
  v43 = (unint64_t *)((char *)v41 + *v87);
  v44 = v38;
  String.append(_:)(*(Swift::String *)&v37);
  swift_bridgeObjectRelease(v38);
  v45 = v99;
  *v41 = v98;
  v41[1] = v45;
  *v43 = *((_QWORD *)v34 + 2);
  v85 = v39;
  ((void (*)(_QWORD *, _QWORD, uint64_t))v97)(v43, v86, v39);
  v46 = (_QWORD *)((char *)v16 + 3 * v40);
  v47 = (uint64_t *)((char *)v46 + *v42);
  v48 = v92;
  v86 = (uint64_t (*)(char *, _QWORD, uint64_t))v92[13];
  v49 = v89;
  v50 = v90;
  v51 = v86(v89, enum case for Keys.reporterID(_:), v90);
  v52 = Keys.rawValue.getter(v51);
  v54 = v53;
  v84 = (void (*)(char *, uint64_t))v48[1];
  v84(v49, v50);
  *v46 = v52;
  v46[1] = v54;
  v55 = (uint64_t)v96;
  *v47 = *((_QWORD *)v96 + 3);
  v56 = v85;
  ((void (*)(_QWORD *, _QWORD, uint64_t))v97)(v47, enum case for SimpleType.int(_:), v85);
  v92 = v16;
  v57 = (_QWORD *)((char *)v16 + 4 * v40);
  v58 = v42;
  v59 = (_OWORD *)((char *)v57 + *v42);
  v60 = v91;
  v61 = v86(v91, enum case for Keys.applicationName(_:), v50);
  v62 = Keys.rawValue.getter(v61);
  v64 = v63;
  v84(v60, v50);
  *v57 = v62;
  v57[1] = v64;
  *v59 = *(_OWORD *)(v55 + 40);
  v65 = v97;
  ((void (*)(_OWORD *, _QWORD, uint64_t))v97)(v59, v88, v56);
  v98 = 0x5F676E696E6E7572;
  v99 = 0xEB000000005F7461;
  v66 = v58;
  if (v95)
  {
    v67 = v56;
    if (v95 == 1)
    {
      v68 = 0x735F6C616E676973;
      v69 = (void *)0xEB00000000706F74;
    }
    else
    {
      v69 = (void *)0xE400000000000000;
      v68 = 1886352499;
    }
    v70 = v55;
  }
  else
  {
    v67 = v56;
    v69 = (void *)0xE500000000000000;
    v70 = v55;
    v68 = 0x7472617473;
  }
  v71 = (_QWORD *)((char *)v92 + 5 * v94);
  v72 = (char *)v71 + *v66;
  sub_10000FA74(v70);
  v73._countAndFlagsBits = v68;
  v73._object = v69;
  String.append(_:)(v73);
  swift_bridgeObjectRelease(v69);
  v74 = v99;
  *v71 = v98;
  v71[1] = v74;
  *v72 = *(_BYTE *)(v70 + 32);
  v75 = enum case for SimpleType.BOOL(_:);
  ((void (*)(_BYTE *, _QWORD, uint64_t))v65)(v72, enum case for SimpleType.BOOL(_:), v67);
  v76 = sub_10000A0B4(v93);
  if ((*(_BYTE *)(v70 + 56) & 1) != 0)
  {
    v77 = v81;
    *v81 = *(_BYTE *)(v70 + 56);
    ((void (*)(_BYTE *, uint64_t, uint64_t))v65)(v77, v75, v67);
    v78 = (uint64_t)v83;
    (*(void (**)(char *, _BYTE *, uint64_t))(v82 + 32))(v83, v77, v67);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v76);
    v98 = v76;
    sub_100023B38(v78, 0xD000000000000014, 0x80000001000336D0, isUniquelyReferenced_nonNull_native);
    v76 = v98;
    swift_bridgeObjectRelease(0x8000000000000000);
  }
  return v76;
}

uint64_t sub_1000055F8(__int16 a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v24;
  _QWORD *v25;
  _QWORD aBlock[5];
  uint64_t v27;

  v3 = v2;
  v6 = type metadata accessor for DispatchWorkItemFlags(0);
  v24 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchQoS(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(void **)(*(_QWORD *)(v3 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_server)
                 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  v14 = swift_allocObject(&unk_1000392C8, 24, 7);
  swift_weakInit(v14 + 16, v3);
  v15 = swift_allocObject(&unk_100039728, 34, 7);
  *(_QWORD *)(v15 + 16) = v14;
  *(_QWORD *)(v15 + 24) = a2;
  *(_WORD *)(v15 + 32) = a1;
  aBlock[4] = sub_100008188;
  v27 = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006CEC;
  aBlock[3] = &unk_100039740;
  v16 = _Block_copy(aBlock);
  v17 = v13;
  v18 = swift_retain(v14);
  static DispatchQoS.unspecified.getter(v18);
  v25 = _swiftEmptyArrayStorage;
  v19 = sub_1000130D8();
  v20 = sub_10000E354((uint64_t *)&unk_10003DBA0);
  v21 = sub_100006858();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v25, v20, v21, v6, v19);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v12, v8, v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v24 + 8))(v8, v6);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v22 = v27;
  swift_release(v14);
  return swift_release(v22);
}

uint64_t sub_100005818(void *a1)
{
  char *v1;
  unint64_t v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  char *v9;
  _QWORD *v10;
  id v11;
  NSObject *v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  char *v17;
  id v18;
  uint64_t result;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  _QWORD *v23;
  id v24;
  uint64_t v25;
  _QWORD *v26;
  void *v27;
  _QWORD *v28;
  id v29;
  id v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  void **v34;
  uint64_t v35;
  uint64_t v36;
  void **aBlock;
  uint64_t v38;
  uint64_t (*v39)(uint64_t);
  void *v40;
  uint64_t (*v41)();
  _QWORD *v42;

  v35 = static Utilities.processName(for:)(objc_msgSend(a1, "processIdentifier"));
  if (!v3)
    v35 = static Constants.unknown.getter();
  v4 = v3;
  v5 = objc_msgSend(a1, "processIdentifier");
  v6 = *(_QWORD *)&v1[OBJC_IVAR____TtC15audioanalyticsd6Server_config];
  v7 = type metadata accessor for ClientServerInstance(0);
  v8 = (_QWORD *)swift_allocObject(v7, *(unsigned int *)(v7 + 48), *(unsigned __int16 *)(v7 + 52));
  swift_bridgeObjectRetain(v4);
  swift_retain(v6);
  v9 = v1;
  v10 = sub_10000374C(v5, v35, v4, v6, v9, v8);
  v11 = objc_msgSend((id)objc_opt_self(NSXPCInterface), "interfaceWithProtocol:", &OBJC_PROTOCOL____TtP15audioanalyticsd14ServerProtocol_);
  objc_msgSend(a1, "setExportedInterface:", v11);

  objc_msgSend(a1, "setExportedObject:", v10);
  v12 = *(NSObject **)&v9[OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue];
  v13 = (_QWORD *)swift_allocObject(&unk_100039B08, 40, 7);
  v13[2] = v9;
  v13[3] = v10;
  v13[4] = a1;
  v14 = swift_allocObject(&unk_100039B30, 32, 7);
  *(_QWORD *)(v14 + 16) = sub_10000F9BC;
  *(_QWORD *)(v14 + 24) = v13;
  v41 = sub_100005D7C;
  v42 = (_QWORD *)v14;
  aBlock = _NSConcreteStackBlock;
  v38 = 1107296256;
  v39 = sub_100005D54;
  v40 = &unk_100039B48;
  v15 = _Block_copy(&aBlock);
  v16 = v42;
  v17 = v9;
  swift_retain(v10);
  v18 = a1;
  swift_retain(v14);
  swift_release(v16);
  dispatch_sync(v12, v15);
  _Block_release(v15);
  LOBYTE(v12) = swift_isEscapingClosureAtFileLocation(v14, "", 99, 303, 26, 1);
  result = swift_release(v14);
  if ((v12 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v20 = swift_allocObject(&unk_100039B80, 24, 7);
    swift_unknownObjectWeakInit(v20 + 16, v17);
    v21 = (_QWORD *)swift_allocObject(&unk_100039BA8, 56, 7);
    v21[2] = v20;
    v21[3] = v18;
    v21[4] = v35;
    v21[5] = v4;
    v21[6] = v10;
    v41 = sub_100021FEC;
    v42 = v21;
    aBlock = _NSConcreteStackBlock;
    v38 = 1107296256;
    v39 = sub_100006CEC;
    v40 = &unk_100039BC0;
    v22 = _Block_copy(&aBlock);
    v23 = v42;
    swift_bridgeObjectRetain(v4);
    swift_retain(v10);
    v24 = v18;
    swift_release(v23);
    objc_msgSend(v24, "setInterruptionHandler:", v22);
    _Block_release(v22);
    v25 = swift_allocObject(&unk_100039B80, 24, 7);
    swift_unknownObjectWeakInit(v25 + 16, v17);
    v26 = (_QWORD *)swift_allocObject(&unk_100039BF8, 56, 7);
    v26[2] = v25;
    v26[3] = v10;
    v26[4] = v24;
    v26[5] = v35;
    v26[6] = v4;
    v41 = sub_100021FFC;
    v42 = v26;
    aBlock = _NSConcreteStackBlock;
    v38 = 1107296256;
    v39 = sub_100006CEC;
    v40 = &unk_100039C10;
    v27 = _Block_copy(&aBlock);
    v28 = v42;
    swift_bridgeObjectRetain(v4);
    swift_retain(v10);
    v29 = v24;
    swift_release(v28);
    objc_msgSend(v29, "setInvalidationHandler:", v27);
    _Block_release(v27);
    swift_bridgeObjectRetain(v4);
    v30 = v29;
    v31 = Logger.logObject.getter(v30);
    v32 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = swift_slowAlloc(18, -1);
      v34 = (void **)swift_slowAlloc(32, -1);
      aBlock = v34;
      *(_DWORD *)v33 = 67174915;
      LODWORD(v36) = objc_msgSend(v30, "processIdentifier");
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, (char *)&v36 + 4, v33 + 4, v33 + 8);

      *(_WORD *)(v33 + 8) = 2081;
      swift_bridgeObjectRetain(v4);
      v36 = sub_10000A7E4(v35, v4, (uint64_t *)&aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, &aBlock, v33 + 10, v33 + 18);
      swift_bridgeObjectRelease_n(v4, 3);
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "New connection. { pid=%{private}d, clientProcessName=%{private}s }", (uint8_t *)v33, 0x12u);
      swift_arrayDestroy(v34, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v34, -1, -1);
      swift_slowDealloc(v33, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n(v4, 2);

    }
    objc_msgSend(v30, "activate");
    swift_release(v13);
    swift_release(v10);
    return 1;
  }
  return result;
}

uint64_t sub_100005D54(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_100005D74()
{
  uint64_t v0;

  return sub_100005D9C(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_100005D7C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100005D9C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100005DBC()
{
  uint64_t v0;

  return sub_100005DC4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_100005DC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  id v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v16[24];

  v4 = type metadata accessor for DispatchPredicate(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v8 = *(void **)(a1 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
  *v7 = v8;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v5 + 104))(v7, enum case for DispatchPredicate.onQueue(_:), v4);
  v9 = v8;
  LOBYTE(v8) = _dispatchPreconditionTest(_:)(v7);
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v5 + 8))(v7, v4);
  if ((v8 & 1) != 0)
  {
    swift_beginAccess(a1 + 72, v16, 1, 0);
    v11 = *(_QWORD *)(a1 + 72);
    swift_bridgeObjectRetain(v11);
    swift_bridgeObjectRetain(a2);
    v13 = sub_10000EBE4(v12, v11);
    v14 = *(_QWORD *)(a1 + 72);
    *(_QWORD *)(a1 + 72) = v13;
    return swift_bridgeObjectRelease(v14);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100005ECC(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = type metadata accessor for SystemMonitorConfig.MonitorType(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[5] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[6] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[7] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[8] + 8));
  v5 = a1 + a2[9];
  v6 = type metadata accessor for SystemMonitorConfig.DataType(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

uint64_t sub_100005F68()
{
  _QWORD *v0;
  uint64_t Strong;
  uint64_t v2;

  Strong = swift_weakLoadStrong(*v0 + 56);
  if (!Strong)
    return 0xFFFFLL;
  v2 = *(unsigned __int16 *)(Strong + 64);
  swift_release();
  return v2;
}

uint64_t sub_100005FA4(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v5;
  unint64_t v6;
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
  Swift::Int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t result;
  _QWORD v27[9];
  uint64_t v28;

  v5 = a2;
  v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if ((a3 & 1) != 0)
    {
      if (a4 < 0)
        v7 = a4;
      else
        v7 = a4 & 0xFFFFFFFFFFFFFF8;
      v8 = __CocoaSet.element(at:)(a1, a2, v7);
      v28 = v8;
      v9 = type metadata accessor for ClientServerInstance(0);
      swift_unknownObjectRetain(v8, v10);
      swift_dynamicCast(v27, &v28, (char *)&type metadata for Swift.AnyObject + 8, v9, 7);
      v11 = v27[0];
      swift_unknownObjectRelease(v8);
      return v11;
    }
    goto LABEL_31;
  }
  if ((a3 & 1) == 0)
  {
    if (a1 < 0 || 1 << *(_BYTE *)(a4 + 32) <= a1)
    {
      __break(1u);
      goto LABEL_28;
    }
    if (((*(_QWORD *)(a4 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> a1) & 1) == 0)
      goto LABEL_29;
    if (*(_DWORD *)(a4 + 36) == (_DWORD)a2)
      goto LABEL_25;
    __break(1u);
  }
  if (__CocoaSet.Index.age.getter(a1, a2) != *(_DWORD *)(a4 + 36))
  {
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    swift_release(v5);
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v12 = __CocoaSet.Index.element.getter(v6, v5);
  v28 = v12;
  v13 = type metadata accessor for ClientServerInstance(0);
  swift_unknownObjectRetain(v12, v14);
  swift_dynamicCast(v27, &v28, (char *)&type metadata for Swift.AnyObject + 8, v13, 7);
  v5 = v27[0];
  swift_unknownObjectRelease(v12);
  Hasher.init(_seed:)(v27, *(_QWORD *)(a4 + 40));
  v15 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
  Hasher._combine(_:)(*(_DWORD *)(v5 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid));
  v16 = *(_QWORD *)(v5 + 24);
  v17 = *(_QWORD *)(v5 + 32);
  swift_bridgeObjectRetain(v17);
  String.hash(into:)(v27, v16, v17);
  swift_bridgeObjectRelease(v17);
  v18 = Hasher._finalize()();
  v19 = -1 << *(_BYTE *)(a4 + 32);
  v6 = v18 & ~v19;
  if (((*(_QWORD *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
  {
LABEL_32:
    result = swift_release(v5);
    __break(1u);
    return result;
  }
  v20 = ~v19;
  v21 = *(_DWORD *)(v5 + v15);
  v22 = *(_QWORD *)(a4 + 48);
  v23 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
  while (1)
  {
    v24 = *(_QWORD *)(v22 + 8 * v6);
    if (*(_DWORD *)(v24 + v23) == v21)
      break;
LABEL_16:
    v6 = (v6 + 1) & v20;
    if (((*(_QWORD *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
      goto LABEL_30;
  }
  v25 = *(_QWORD *)(v24 + 24) == *(_QWORD *)(v5 + 24) && *(_QWORD *)(v24 + 32) == *(_QWORD *)(v5 + 32);
  if (!v25 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {
    v23 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
    goto LABEL_16;
  }
  swift_release(v5);
LABEL_25:
  v11 = *(_QWORD *)(*(_QWORD *)(a4 + 48) + 8 * v6);
  swift_retain(v11);
  return v11;
}

int64_t sub_10000622C(int64_t result, int a2, char a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if ((a3 & 1) != 0)
    goto LABEL_20;
  v4 = result;
  if (result < 0 || (result = 1 << *(_BYTE *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  v5 = v4 >> 6;
  v6 = a4 + 56;
  v7 = *(_QWORD *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8)
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  v9 = v5 + 1;
  v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    v11 = *(_QWORD *)(v6 + 8 * v9);
    if (v11)
      return __clz(__rbit64(v11)) + (v9 << 6);
    v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      v11 = *(_QWORD *)(v6 + 8 * v9);
      if (v11)
        return __clz(__rbit64(v11)) + (v9 << 6);
      while (v10 - 3 != v5)
      {
        v11 = *(_QWORD *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_100006384(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  uint64_t v24;
  _QWORD *v25;
  _QWORD aBlock[5];
  _QWORD *v27;

  v3 = v2;
  v6 = type metadata accessor for DispatchWorkItemFlags(0);
  v24 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchQoS(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(void **)(*(_QWORD *)(v3 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_server)
                 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  v14 = swift_allocObject(&unk_1000392C8, 24, 7);
  swift_weakInit(v14 + 16, v3);
  v15 = (_QWORD *)swift_allocObject(&unk_1000395E8, 40, 7);
  v15[2] = v14;
  v15[3] = a2;
  v15[4] = a1;
  aBlock[4] = sub_1000071C8;
  v27 = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006CEC;
  aBlock[3] = &unk_100039600;
  v16 = _Block_copy(aBlock);
  v17 = v13;
  swift_retain(v14);
  swift_bridgeObjectRetain(a1);
  static DispatchQoS.unspecified.getter(v18);
  v25 = _swiftEmptyArrayStorage;
  v19 = sub_1000130D8();
  v20 = sub_10000E354((uint64_t *)&unk_10003DBA0);
  v21 = sub_100006858();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v25, v20, v21, v6, v19);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v12, v8, v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v24 + 8))(v8, v6);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v22 = v27;
  swift_release(v14);
  return swift_release(v22);
}

uint64_t sub_1000065AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  swift_retain(a1);
  sub_100006608(a3, a4, a5, a6);
  return swift_release(a1);
}

uint64_t sub_100006608(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD aBlock[5];
  uint64_t v32;

  v8 = v4;
  v10 = type metadata accessor for DispatchWorkItemFlags(0);
  v29 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for DispatchQoS(0);
  v27 = *(_QWORD *)(v13 - 8);
  v28 = v13;
  __chkstk_darwin(v13);
  v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(void **)(*(_QWORD *)(v8 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_server)
                 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  v17 = swift_allocObject(&unk_1000392C8, 24, 7);
  swift_weakInit(v17 + 16, v8);
  v18 = swift_allocObject(a2, 32, 7);
  *(_QWORD *)(v18 + 16) = v17;
  *(_QWORD *)(v18 + 24) = a1;
  aBlock[4] = a3;
  v32 = v18;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006CEC;
  aBlock[3] = a4;
  v19 = _Block_copy(aBlock);
  v20 = v16;
  v21 = swift_retain(v17);
  static DispatchQoS.unspecified.getter(v21);
  v30 = _swiftEmptyArrayStorage;
  v22 = sub_1000130D8();
  v23 = sub_10000E354((uint64_t *)&unk_10003DBA0);
  v24 = sub_100006858();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v30, v23, v24, v10, v22);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v15, v12, v19);
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v29 + 8))(v12, v10);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v15, v28);
  v25 = v32;
  swift_release(v17);
  return swift_release(v25);
}

uint64_t sub_100006818(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

unint64_t sub_100006858()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003D6E0;
  if (!qword_10003D6E0)
  {
    v1 = sub_1000101F8((uint64_t *)&unk_10003DBA0);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10003D6E0);
  }
  return result;
}

uint64_t sub_1000068A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = type metadata accessor for SystemMonitorConfig.MonitorType(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = (int *)type metadata accessor for FeatureInfo(0);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + v5[5] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + v5[6] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + v5[7] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + v5[8] + 8));
  v6 = a1 + v5[9];
  v7 = type metadata accessor for SystemMonitorConfig.DataType(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = a1 + *(int *)(a2 + 20);
  v9 = type metadata accessor for SimpleType(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
}

uint64_t sub_100006978(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000069BC(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata(a1, a3);
  return result;
}

uint64_t type metadata accessor for FeatureState(uint64_t a1)
{
  return sub_1000069BC(a1, qword_10003E198, (uint64_t)&nominal type descriptor for FeatureState);
}

uint64_t sub_100006A04(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t, uint64_t);

  v6 = type metadata accessor for SystemMonitorConfig.MonitorType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = (_QWORD *)(a1 + v8);
  v13 = (_QWORD *)(a2 + v8);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  v15 = a3[7];
  v16 = a3[8];
  v17 = (_QWORD *)(a1 + v15);
  v18 = (_QWORD *)(a2 + v15);
  v19 = v18[1];
  *v17 = *v18;
  v17[1] = v19;
  v20 = (_QWORD *)(a1 + v16);
  v21 = (uint64_t *)(a2 + v16);
  v22 = *v21;
  v23 = v21[1];
  v24 = a3[9];
  v25 = a2 + v24;
  v26 = a1 + v24;
  *v20 = v22;
  v20[1] = v23;
  v27 = type metadata accessor for SystemMonitorConfig.DataType(0);
  v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 16);
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRetain(v19);
  swift_bridgeObjectRetain(v23);
  v28(v26, v25, v27);
  return a1;
}

uint64_t sub_100006B04(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_10000E354(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100006B40(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_10000E354(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100006B84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  int *v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t, uint64_t, __n128);
  __n128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v5 = type metadata accessor for SystemMonitorConfig.MonitorType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
  v6 = (int *)type metadata accessor for FeatureInfo(0);
  v7 = v6[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  v11 = v6[6];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  v15 = v6[7];
  v16 = (_QWORD *)(a1 + v15);
  v17 = (_QWORD *)(a2 + v15);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  v19 = v6[8];
  v20 = (_QWORD *)(a1 + v19);
  v21 = (_QWORD *)(a2 + v19);
  v22 = v21[1];
  *v20 = *v21;
  v20[1] = v22;
  v23 = v6[9];
  v24 = a1 + v23;
  v25 = a2 + v23;
  v26 = type metadata accessor for SystemMonitorConfig.DataType(0);
  v27 = *(void (**)(uint64_t, uint64_t, uint64_t, __n128))(*(_QWORD *)(v26 - 8) + 16);
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRetain(v18);
  v28 = swift_bridgeObjectRetain(v22);
  v27(v24, v25, v26, v28);
  v29 = *(int *)(a3 + 20);
  v30 = a1 + v29;
  v31 = a2 + v29;
  v32 = type metadata accessor for SimpleType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 16))(v30, v31, v32);
  *(_DWORD *)(a1 + *(int *)(a3 + 24)) = *(_DWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t type metadata accessor for FeatureInfo(uint64_t a1)
{
  return sub_1000069BC(a1, qword_10003E230, (uint64_t)&nominal type descriptor for FeatureInfo);
}

uint64_t sub_100006CEC(uint64_t a1)
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

uint64_t sub_100006D18(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  id v15;
  uint64_t result;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v3 = v2;
  v6 = type metadata accessor for Message.Metadata(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for DispatchPredicate(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (uint64_t *)((char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = *(void **)(*(_QWORD *)(v3 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_server)
                 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  *v13 = v14;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v11 + 104))(v13, enum case for DispatchPredicate.onQueue(_:), v10);
  v15 = v14;
  LOBYTE(v14) = _dispatchPreconditionTest(_:)(v13);
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v11 + 8))(v13, v10);
  if ((v14 & 1) != 0)
  {
    if (static Constants.unknownReporterID.getter(result) == a2)
    {
      v17 = sub_100013760(a1);
      return v17 & 1;
    }
    v18 = sub_10000E3D4(a2, 0, 0x737365636F7270, 0xE700000000000000);
    if (v18)
    {
      v19 = v18;
      v20 = Message.metadata.getter(v18);
      v21 = Message.Metadata.isBroadcast.getter(v20);
      v22 = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v21 & 1) == 0 || *(_BYTE *)(v19 + 66) == 1)
      {
        v17 = sub_100007030(a1, v19);
        swift_release(v19);
        return v17 & 1;
      }
      v26 = Logger.logObject.getter(v22);
      v27 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v26, v27))
      {
        v28 = (uint8_t *)swift_slowAlloc(12, -1);
        *(_DWORD *)v28 = 134217984;
        v30 = a2;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v28 + 4, v28 + 12);
        _os_log_impl((void *)&_mh_execute_header, v26, v27, "Session is not started. Abandoning broadcast message. { reporterID=%lld }", v28, 0xCu);
        swift_slowDealloc(v28, -1, -1);
      }

      swift_release(v19);
    }
    else
    {
      v23 = Logger.logObject.getter(0);
      v24 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v23, v24))
      {
        v25 = (uint8_t *)swift_slowAlloc(12, -1);
        *(_DWORD *)v25 = 134217984;
        v30 = a2;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v25 + 4, v25 + 12);
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "Session not found! Abandoning message. { reporterID=%lld }", v25, 0xCu);
        swift_slowDealloc(v25, -1, -1);
      }

    }
    v17 = 0;
    return v17 & 1;
  }
  __break(1u);
  return result;
}

uint64_t sub_100007030(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = *(_QWORD *)(v2 + 16);
  sub_100008DA4((uint64_t)&v14);
  v6 = sub_10001911C(v5, a1, (uint64_t)&v14, 0);
  LOWORD(v5) = v7;
  sub_10000E394((uint64_t)&v14);
  v8 = swift_bridgeObjectRelease(v6);
  if ((v5 & 0x100) != 0)
  {
    v10 = swift_retain(a2);
    v11 = Logger.logObject.getter(v10);
    v12 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc(12, -1);
      *(_DWORD *)v13 = 134217984;
      v14 = *(_QWORD *)(a2 + 16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v14, &v15, v13 + 4, v13 + 12);
      swift_release(a2);
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Discarding message { reporterID=%lld }", v13, 0xCu);
      swift_slowDealloc(v13, -1, -1);
    }
    else
    {
      swift_release(a2);
    }

    return 0;
  }
  else
  {
    __chkstk_darwin(v8);
    OS_dispatch_queue.sync<A>(execute:)(&v14, sub_100003EB4);
    return v14;
  }
}

void sub_1000071C8()
{
  uint64_t *v0;

  sub_1000071D4(v0[2], v0[3], v0[4]);
}

void sub_1000071D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t Strong;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  void **v21;
  __n128 v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  void **v34;
  __n128 v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  void **aBlock;
  _QWORD v50[4];
  uint64_t v51;
  uint64_t v52;
  _BYTE v53[24];

  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  a1 += 16;
  swift_beginAccess(a1, v53, 0, 0);
  Strong = swift_weakLoadStrong(a1);
  if (Strong)
  {
    v11 = Strong;
    *(double *)(Strong + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) = *(double *)(Strong + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) + 1.0;
    v12 = Logger.logObject.getter(Strong);
    v13 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc(12, -1);
      *(_DWORD *)v14 = 134217984;
      aBlock = (void **)a2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v50, v14 + 4, v14 + 12);
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "setConfiguration() called. { reporterID=%lld }", v14, 0xCu);
      swift_slowDealloc(v14, -1, -1);
    }

    v15 = Dictionary<>.asSimpleType()(a3);
    if (v15)
    {
      v16 = v15;
      v17 = swift_bridgeObjectRetain_n(a3, 2);
      v18 = Logger.logObject.getter(v17);
      v19 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v18, v19))
      {
        v20 = swift_slowAlloc(22, -1);
        v21 = (void **)swift_slowAlloc(32, -1);
        aBlock = v21;
        *(_DWORD *)v20 = 136380931;
        v47 = v20 + 4;
        v22 = swift_bridgeObjectRetain(a3);
        v48 = (char *)&type metadata for Any + 8;
        v23 = Dictionary.description.getter(v22);
        v25 = v24;
        swift_bridgeObjectRelease(a3);
        v52 = sub_10000A7E4(v23, v25, (uint64_t *)&aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, v53, v47, v20 + 12);
        swift_bridgeObjectRelease_n(a3, 2);
        swift_bridgeObjectRelease(v25);
        *(_WORD *)(v20 + 12) = 2048;
        v52 = a2;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, v53, v20 + 14, v20 + 22);
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "Setting configuration { configuration=%{private}s, reporterID=%lld }", (uint8_t *)v20, 0x16u);
        swift_arrayDestroy(v21, 1, v48);
        swift_slowDealloc(v21, -1, -1);
        swift_slowDealloc(v20, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n(a3, 2);
      }

      v40 = sub_10000E3D4(a2, 0, 0x69666E6F43746573, 0xE900000000000067);
      if (v40)
      {
        v41 = v40;
        v42 = *(NSObject **)(v40 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
        v43 = swift_allocObject(&unk_100039638, 32, 7);
        *(_QWORD *)(v43 + 16) = v41;
        *(_QWORD *)(v43 + 24) = v16;
        v44 = swift_allocObject(&unk_100039660, 32, 7);
        *(_QWORD *)(v44 + 16) = sub_100005DBC;
        *(_QWORD *)(v44 + 24) = v43;
        v50[3] = sub_1000133A4;
        v51 = v44;
        aBlock = _NSConcreteStackBlock;
        v50[0] = 1107296256;
        v50[1] = sub_100005D54;
        v50[2] = &unk_100039678;
        v45 = _Block_copy(&aBlock);
        v46 = v51;
        swift_retain(v41);
        swift_bridgeObjectRetain(v16);
        swift_retain(v44);
        swift_release(v46);
        dispatch_sync(v42, v45);
        _Block_release(v45);
        LOBYTE(v42) = swift_isEscapingClosureAtFileLocation(v44, "", 111, 100, 24, 1);
        swift_release(v41);
        swift_release(v11);
        swift_bridgeObjectRelease(v16);
        swift_release(v43);
        swift_release(v44);
        if ((v42 & 1) == 0)
          return;
        __break(1u);
      }
      swift_release(v11);
      swift_bridgeObjectRelease(v16);
    }
    else
    {
      v30 = swift_bridgeObjectRetain_n(a3, 2);
      v31 = Logger.logObject.getter(v30);
      v32 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v31, v32))
      {
        v33 = swift_slowAlloc(22, -1);
        v34 = (void **)swift_slowAlloc(32, -1);
        aBlock = v34;
        *(_DWORD *)v33 = 136380931;
        v35 = swift_bridgeObjectRetain(a3);
        v48 = (char *)&type metadata for Any + 8;
        v36 = a2;
        v37 = Dictionary.description.getter(v35);
        v39 = v38;
        swift_bridgeObjectRelease(a3);
        v52 = sub_10000A7E4(v37, v39, (uint64_t *)&aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, v53, v33 + 4, v33 + 12);
        swift_bridgeObjectRelease_n(a3, 2);
        swift_bridgeObjectRelease(v39);
        *(_WORD *)(v33 + 12) = 2048;
        v52 = v36;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, v53, v33 + 14, v33 + 22);
        _os_log_impl((void *)&_mh_execute_header, v31, v32, "Error converting session configuration. { configuration=%{private}s, reporterID=%lld }", (uint8_t *)v33, 0x16u);
        swift_arrayDestroy(v34, 1, v48);
        swift_slowDealloc(v34, -1, -1);
        swift_slowDealloc(v33, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease_n(a3, 2);
      }
      swift_release(v11);

    }
  }
  else
  {
    v26 = static Logger.service.getter(0);
    v27 = Logger.logObject.getter(v26);
    v28 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "ClientServerInstance is gone. { action=set:configuration }", v29, 2u);
      swift_slowDealloc(v29, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

void sub_100007818()
{
  uint64_t v0;

  sub_100009084(*(_QWORD *)(v0 + 16), *(void ***)(v0 + 24));
}

void sub_100007820(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t Strong;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  void **v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  const char *v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t *v38;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  void **v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void **v60;
  NSObject *v61;
  uint64_t v62;
  void **aBlock;
  _QWORD v64[4];
  uint64_t v65;
  char v66[24];

  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  a1 += 16;
  swift_beginAccess(a1, v66, 0, 0);
  Strong = swift_weakLoadStrong(a1);
  if (Strong)
  {
    v11 = Strong;
    v12 = Logger.logObject.getter(Strong);
    v13 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc(12, -1);
      *(_DWORD *)v14 = 134217984;
      aBlock = (void **)a2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v64, v14 + 4, v14 + 12);
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "setServiceType() called. { reporterID=%lld }", v14, 0xCu);
      swift_slowDealloc(v14, -1, -1);
    }

    *(double *)(v11 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) = *(double *)(v11 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) + 1.0;
    v15 = sub_10000E3D4(a2, 0, 0x6976726553746573, 0xEE00657079546563);
    if (v15)
    {
      v16 = v15;
      v17 = *(unsigned __int16 *)(v15 + 64);
      if (v17 == (unsigned __int16)a3)
      {
        v18 = Logger.logObject.getter(v15);
        v19 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v18, v19))
        {
          v20 = swift_slowAlloc(22, -1);
          v21 = (void **)swift_slowAlloc(32, -1);
          aBlock = v21;
          *(_DWORD *)v20 = 136446466;
          v22 = static Utilities.serviceTypeDescription(from:)(a3);
          v24 = v23;
          v62 = sub_10000A7E4(v22, v23, (uint64_t *)&aBlock);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, &aBlock, v20 + 4, v20 + 12);
          swift_bridgeObjectRelease(v24);
          *(_WORD *)(v20 + 12) = 2048;
          v62 = a2;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, &aBlock, v20 + 14, v20 + 22);
          v25 = "ServiceType did not change. { serviceType=%{public}s, reporterID=%lld }";
LABEL_18:
          _os_log_impl((void *)&_mh_execute_header, v18, v19, v25, (uint8_t *)v20, 0x16u);
          swift_arrayDestroy(v21, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v21, -1, -1);
          swift_slowDealloc(v20, -1, -1);
          goto LABEL_19;
        }
        goto LABEL_19;
      }
      if (v17 == 0xFFFF)
      {
        sub_100007FF4(a3);
        *(_WORD *)(v16 + 64) = a3;
        v18 = Logger.logObject.getter(v54);
        v19 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v18, v19))
        {
          v20 = swift_slowAlloc(22, -1);
          v21 = (void **)swift_slowAlloc(32, -1);
          aBlock = v21;
          *(_DWORD *)v20 = 136446466;
          v55 = static Utilities.serviceTypeDescription(from:)(a3);
          v57 = v56;
          v62 = sub_10000A7E4(v55, v56, (uint64_t *)&aBlock);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, &aBlock, v20 + 4, v20 + 12);
          swift_bridgeObjectRelease(v57);
          *(_WORD *)(v20 + 12) = 2048;
          v62 = a2;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, &aBlock, v20 + 14, v20 + 22);
          v25 = "Received serviceType for reporterID. { serviceType=%{public}s, reporterID=%lld }";
          goto LABEL_18;
        }
LABEL_19:
        swift_release(v16);
        swift_release(v11);

        return;
      }
      v31 = *(NSObject **)(v15 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
      v32 = swift_allocObject(&unk_100039778, 25, 7);
      *(_QWORD *)(v32 + 16) = v16;
      *(_BYTE *)(v32 + 24) = 0;
      v33 = swift_allocObject(&unk_1000397A0, 32, 7);
      *(_QWORD *)(v33 + 16) = sub_1000133A8;
      *(_QWORD *)(v33 + 24) = v32;
      v64[3] = sub_1000133A4;
      v65 = v33;
      aBlock = _NSConcreteStackBlock;
      v64[0] = 1107296256;
      v64[1] = sub_100005D54;
      v64[2] = &unk_1000397B8;
      v34 = _Block_copy(&aBlock);
      v35 = v65;
      swift_retain(v16);
      swift_retain(v33);
      swift_release(v35);
      dispatch_sync(v31, v34);
      _Block_release(v34);
      LOBYTE(v31) = swift_isEscapingClosureAtFileLocation(v33, "", 111, 96, 24, 1);
      swift_release(v32);
      swift_release(v33);
      if ((v31 & 1) != 0)
      {
        __break(1u);
        return;
      }
      v36 = (_QWORD *)swift_retain(v16);
      v37 = sub_10002A2F8(v36);
      sub_100007FF4(a3);
      *(_WORD *)(v37 + 64) = a3;
      v38 = (uint64_t *)(v11 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID);
      swift_beginAccess(v11 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID, &aBlock, 33, 0);
      swift_retain(v37);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v38);
      v62 = *v38;
      *v38 = 0x8000000000000000;
      sub_1000097B8(v37, a2, isUniquelyReferenced_nonNull_native);
      v40 = *v38;
      *v38 = v62;
      swift_bridgeObjectRelease(v40);
      swift_endAccess(&aBlock);
      v41 = static Utilities.serviceTypeDescription(from:)(*(unsigned __int16 *)(v16 + 64));
      v43 = v42;
      v44 = static Utilities.serviceTypeDescription(from:)(a3);
      v46 = v45;
      swift_bridgeObjectRetain(v45);
      swift_bridgeObjectRetain(v43);
      v48 = Logger.logObject.getter(v47);
      v49 = static os_log_type_t.debug.getter();
      v61 = v48;
      if (os_log_type_enabled(v48, v49))
      {
        v50 = v44;
        v51 = swift_slowAlloc(32, -1);
        v60 = (void **)swift_slowAlloc(64, -1);
        aBlock = v60;
        *(_DWORD *)v51 = 136446722;
        v59 = v41;
        swift_bridgeObjectRetain(v46);
        v62 = sub_10000A7E4(v50, v46, (uint64_t *)&aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, &aBlock, v51 + 4, v51 + 12);
        swift_bridgeObjectRelease_n(v46, 3);
        *(_WORD *)(v51 + 12) = 2082;
        swift_bridgeObjectRetain(v43);
        v62 = sub_10000A7E4(v59, v43, (uint64_t *)&aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, &aBlock, v51 + 14, v51 + 22);
        swift_bridgeObjectRelease_n(v43, 3);
        *(_WORD *)(v51 + 22) = 2048;
        v62 = a2;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, &aBlock, v51 + 24, v51 + 32);
        v52 = v61;
        _os_log_impl((void *)&_mh_execute_header, v61, v49, "setServiceType() { serviceType=%{public}s, prevServiceType=%{public}s, reporterID=%lld }", (uint8_t *)v51, 0x20u);
        v53 = v60;
        swift_arrayDestroy(v60, 2, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v53, -1, -1);
        swift_slowDealloc(v51, -1, -1);
        swift_release(v16);
        swift_release(v11);

      }
      else
      {
        swift_bridgeObjectRelease_n(v43, 2);
        swift_bridgeObjectRelease_n(v46, 2);
        swift_release(v16);
        swift_release(v11);

      }
      v30 = v37;
    }
    else
    {
      v30 = v11;
    }
    swift_release(v30);
  }
  else
  {
    v26 = static Logger.service.getter(0);
    v27 = Logger.logObject.getter(v26);
    v28 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "ClientServerInstance is gone. { action=set:serviceType }", v29, 2u);
      swift_slowDealloc(v29, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

void sub_100007FF4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v2 = v1;
  v4 = swift_retain_n(v1, 2);
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = swift_slowAlloc(22, -1);
    v8 = swift_slowAlloc(32, -1);
    v14 = v8;
    *(_DWORD *)v7 = 136380931;
    v9 = static Utilities.serviceTypeDescription(from:)(a1);
    v11 = v10;
    v13 = sub_10000A7E4(v9, v10, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v7 + 4, v7 + 12);
    swift_bridgeObjectRelease(v11);
    *(_WORD *)(v7 + 12) = 2048;
    v12 = *(_QWORD *)(v2 + 16);
    swift_release(v2);
    v13 = v12;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v7 + 14, v7 + 22);
    swift_release(v2);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "serviceType set. { serviceType=%{private}s, reporterID=%lld }", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy(v8, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1, -1);
    swift_slowDealloc(v7, -1, -1);

  }
  else
  {

    swift_release_n(v1, 2);
  }
}

void sub_100008188()
{
  uint64_t v0;

  sub_100007820(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(unsigned __int16 *)(v0 + 32));
}

uint64_t sub_100008194(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  __n128 v6;
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
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  char **v31;
  char *v32;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  __int128 *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  os_log_type_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  os_log_type_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69;
  char **v70;
  char *v71;
  char v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t v75;
  NSObject *v76;
  os_log_type_t v77;
  uint64_t v78;
  uint64_t v79;
  __int128 v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char **v88;
  __int128 *v90;
  char *v91;
  __n128 v92;
  char **v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char **v99;
  __n128 v100;
  int v101;
  uint64_t v102;
  __int128 v103;
  uint64_t v104;
  __int128 v105[2];
  uint64_t v106;
  __int128 v107;
  uint64_t v108;
  uint64_t v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  uint64_t v113;
  uint64_t v114;

  v2 = v1;
  v97 = type metadata accessor for Config.WorkerConfigs(0);
  v96 = *(_QWORD *)(v97 - 8);
  __chkstk_darwin(v97);
  v95 = (char *)&v90 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(_QWORD *)(a1 + 16);
  if (v5)
  {
    v102 = v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_logger;
    v99 = (char **)(v1 + 88);
    v93 = (char **)(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_summaryDecoratorWorkers);
    v101 = *(unsigned __int8 *)(v1 + 24);
    v90 = v105;
    v6 = swift_bridgeObjectRetain(a1);
    v7 = 0;
    v6.n128_u64[0] = 136380931;
    v100 = v6;
    v91 = (char *)&type metadata for Any + 8;
    v6.n128_u64[0] = 136315394;
    v92 = v6;
    v94 = a1;
    v98 = v5;
    while (1)
    {
      v103 = *(_OWORD *)(a1 + 16 * v7 + 32);
      if (v101
        && ((v8 = v103, swift_conformsToProtocol2(v103, &protocol descriptor for RunOnSingleMessageSession))
          ? (v9 = v8)
          : (v9 = 0),
            !v9))
      {
        v63 = swift_retain_n(v2, 2);
        v17 = Logger.logObject.getter(v63);
        v64 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v17, v64))
        {
          v19 = swift_slowAlloc(22, -1);
          v20 = swift_slowAlloc(32, -1);
          *(_QWORD *)&v110 = v20;
          *(_DWORD *)v19 = v100.n128_u32[0];
          v112 = v103;
          v65 = sub_10000E354(&qword_10003E028);
          v66 = String.init<A>(describing:)(&v112, v65);
          v68 = v67;
          *(_QWORD *)(v19 + 4) = sub_10000A7E4(v66, v67, (uint64_t *)&v110);
          swift_bridgeObjectRelease(v68);
          *(_WORD *)(v19 + 12) = 2048;
          v69 = *(_QWORD *)(v2 + 16);
          swift_release(v2);
          *(_QWORD *)(v19 + 14) = v69;
          swift_release(v2);
          _os_log_impl((void *)&_mh_execute_header, v17, v64, "Skipping worker on singleMessageSession. { worker=%{private}s, reporterID=%lld }", (uint8_t *)v19, 0x16u);
          v27 = v20;
          v26 = v91;
          goto LABEL_25;
        }
      }
      else
      {
        sub_100008DA4((uint64_t)&v107);
        v10 = v103;
        v11 = type metadata accessor for Optional(0, v103);
        v12 = *(_QWORD *)(v11 - 8);
        __chkstk_darwin(v11);
        v14 = (char *)&v90 - v13;
        dispatch thunk of WorkerProtocol.init(with:)(&v107, v10, *((_QWORD *)&v103 + 1));
        v15 = *(_QWORD *)(v10 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v14, 1, v10) != 1)
        {
          v111 = v103;
          v28 = sub_100008F08(&v110);
          (*(void (**)(_QWORD *, char *, uint64_t))(v15 + 32))(v28, v14, v10);
          sub_10000BF74(&v110, (uint64_t)&v112);
          v29 = v113;
          v30 = v114;
          sub_10000CCB0(&v112, v113);
          if ((dispatch thunk of WorkerProtocol.start()(v29, v30) & 1) != 0)
          {
            sub_10000CCD4((uint64_t)&v112, (uint64_t)&v110);
            v31 = v99;
            swift_beginAccess(v99, &v107, 33, 0);
            v32 = *v31;
            isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v31);
            *v31 = v32;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              v32 = sub_100008F44(0, *((_QWORD *)v32 + 2) + 1, 1, v32, &qword_10003DFD8, &qword_10003DDF0);
              *v99 = v32;
            }
            v35 = *((_QWORD *)v32 + 2);
            v34 = *((_QWORD *)v32 + 3);
            if (v35 >= v34 >> 1)
            {
              v32 = sub_100008F44((char *)(v34 > 1), v35 + 1, 1, v32, &qword_10003DFD8, &qword_10003DDF0);
              *v99 = v32;
            }
            *((_QWORD *)v32 + 2) = v35 + 1;
            sub_10000BF74(&v110, (uint64_t)&v32[40 * v35 + 32]);
            swift_endAccess(&v107);
            sub_10000CCD4((uint64_t)&v112, (uint64_t)&v107);
            v36 = sub_10000E354(&qword_10003DDF0);
            v37 = sub_10000E354(&qword_10003DDF8);
            if ((swift_dynamicCast(v105, &v107, v36, v37, 6) & 1) != 0)
            {
              sub_10000BF74(v105, (uint64_t)&v110);
              sub_10000CCD4((uint64_t)&v112, (uint64_t)&v107);
              v38 = swift_retain_n(v2, 2);
              v39 = Logger.logObject.getter(v38);
              v40 = static os_log_type_t.debug.getter();
              if (os_log_type_enabled(v39, v40))
              {
                v41 = swift_slowAlloc(22, -1);
                v42 = swift_slowAlloc(32, -1);
                *(_QWORD *)&v105[0] = v42;
                *(_DWORD *)v41 = v100.n128_u32[0];
                *(_QWORD *)&v103 = v41 + 4;
                v44 = v108;
                v43 = v109;
                sub_10000CCB0(&v107, v108);
                v45 = v95;
                v46 = dispatch thunk of WorkerProtocol.workerConfig.getter(v44, v43);
                v47 = Config.WorkerConfigs.rawValue.getter(v46);
                v49 = v48;
                (*(void (**)(char *, uint64_t))(v96 + 8))(v45, v97);
                v104 = sub_10000A7E4(v47, v49, (uint64_t *)v105);
                v50 = v90;
                UnsafeMutableRawBufferPointer.copyMemory(from:)(&v104, v90, v103, v41 + 12);
                swift_bridgeObjectRelease(v49);
                sub_10000CC90(&v107);
                *(_WORD *)(v41 + 12) = 2048;
                v51 = *(_QWORD *)(v2 + 16);
                swift_release(v2);
                v104 = v51;
                UnsafeMutableRawBufferPointer.copyMemory(from:)(&v104, v50, v41 + 14, v41 + 22);
                swift_release(v2);
                _os_log_impl((void *)&_mh_execute_header, v39, v40, "Adding decorator worker. { worker=%{private}s, reporterID=%lld }", (uint8_t *)v41, 0x16u);
                swift_arrayDestroy(v42, 1, (char *)&type metadata for Any + 8);
                swift_slowDealloc(v42, -1, -1);
                v52 = v41;
                a1 = v94;
                swift_slowDealloc(v52, -1, -1);

              }
              else
              {

                swift_release(v2);
                sub_10000CC90(&v107);
                swift_release(v2);
              }
              sub_10000CCD4((uint64_t)&v110, (uint64_t)&v107);
              v70 = v93;
              swift_beginAccess(v93, v105, 33, 0);
              v71 = *v70;
              v72 = swift_isUniquelyReferenced_nonNull_native(*v70);
              *v70 = v71;
              if ((v72 & 1) == 0)
              {
                v71 = sub_100008F44(0, *((_QWORD *)v71 + 2) + 1, 1, v71, &qword_10003DFD0, &qword_10003DDF8);
                *v93 = v71;
              }
              v74 = *((_QWORD *)v71 + 2);
              v73 = *((_QWORD *)v71 + 3);
              if (v74 >= v73 >> 1)
              {
                v71 = sub_100008F44((char *)(v73 > 1), v74 + 1, 1, v71, &qword_10003DFD0, &qword_10003DDF8);
                *v93 = v71;
              }
              *((_QWORD *)v71 + 2) = v74 + 1;
              sub_10000BF74(&v107, (uint64_t)&v71[40 * v74 + 32]);
              swift_endAccess(v105);
              sub_10000CC90(&v110);
            }
            else
            {
              v106 = 0;
              memset(v105, 0, sizeof(v105));
              sub_100006B04((uint64_t)v105, &qword_10003DFC8);
            }
            sub_10000CCD4((uint64_t)&v112, (uint64_t)&v110);
            v75 = swift_retain_n(v2, 2);
            v76 = Logger.logObject.getter(v75);
            v77 = static os_log_type_t.debug.getter();
            if (os_log_type_enabled(v76, v77))
            {
              v78 = swift_slowAlloc(22, -1);
              v79 = swift_slowAlloc(32, -1);
              *(_QWORD *)&v107 = v79;
              *(_DWORD *)v78 = v92.n128_u32[0];
              v80 = v111;
              sub_10000CCB0(&v110, v111);
              v81 = v95;
              v82 = dispatch thunk of WorkerProtocol.workerConfig.getter(v80, *((_QWORD *)&v80 + 1));
              v83 = Config.WorkerConfigs.rawValue.getter(v82);
              v85 = v84;
              (*(void (**)(char *, uint64_t))(v96 + 8))(v81, v97);
              *(_QWORD *)(v78 + 4) = sub_10000A7E4(v83, v85, (uint64_t *)&v107);
              swift_bridgeObjectRelease(v85);
              sub_10000CC90(&v110);
              *(_WORD *)(v78 + 12) = 2048;
              v86 = *(_QWORD *)(v2 + 16);
              swift_release(v2);
              *(_QWORD *)(v78 + 14) = v86;
              swift_release(v2);
              _os_log_impl((void *)&_mh_execute_header, v76, v77, "Started worker. { worker=%s, reporterID=%lld }", (uint8_t *)v78, 0x16u);
              swift_arrayDestroy(v79, 1, (char *)&type metadata for Any + 8);
              v87 = v79;
              a1 = v94;
              swift_slowDealloc(v87, -1, -1);
              swift_slowDealloc(v78, -1, -1);

            }
            else
            {

              swift_release(v2);
              sub_10000CC90(&v110);
              swift_release(v2);
            }
            v5 = v98;
          }
          else
          {
            v53 = swift_retain_n(v2, 2);
            v54 = Logger.logObject.getter(v53);
            v55 = static os_log_type_t.debug.getter();
            if (os_log_type_enabled(v54, v55))
            {
              v56 = swift_slowAlloc(22, -1);
              v57 = swift_slowAlloc(32, -1);
              *(_QWORD *)&v107 = v57;
              *(_DWORD *)v56 = v100.n128_u32[0];
              v110 = v103;
              v58 = sub_10000E354(&qword_10003E028);
              v59 = String.init<A>(describing:)(&v110, v58);
              v61 = v60;
              *(_QWORD *)(v56 + 4) = sub_10000A7E4(v59, v60, (uint64_t *)&v107);
              swift_bridgeObjectRelease(v61);
              *(_WORD *)(v56 + 12) = 2048;
              v62 = *(_QWORD *)(v2 + 16);
              swift_release(v2);
              *(_QWORD *)(v56 + 14) = v62;
              swift_release(v2);
              _os_log_impl((void *)&_mh_execute_header, v54, v55, "Unable to start worker. Disabled for session lifetime. { worker=%{private}s, reporterID=%lld }", (uint8_t *)v56, 0x16u);
              swift_arrayDestroy(v57, 1, (char *)&type metadata for Any + 8);
              swift_slowDealloc(v57, -1, -1);
              swift_slowDealloc(v56, -1, -1);

            }
            else
            {

              swift_release_n(v2, 2);
            }
          }
          sub_10000CC90(&v112);
          goto LABEL_4;
        }
        (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
        v16 = swift_retain_n(v2, 2);
        v17 = Logger.logObject.getter(v16);
        v18 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v17, v18))
        {
          v19 = swift_slowAlloc(22, -1);
          v20 = swift_slowAlloc(32, -1);
          *(_QWORD *)&v110 = v20;
          *(_DWORD *)v19 = v100.n128_u32[0];
          v112 = v103;
          v21 = sub_10000E354(&qword_10003E028);
          v22 = String.init<A>(describing:)(&v112, v21);
          v24 = v23;
          *(_QWORD *)(v19 + 4) = sub_10000A7E4(v22, v23, (uint64_t *)&v110);
          swift_bridgeObjectRelease(v24);
          *(_WORD *)(v19 + 12) = 2048;
          v25 = *(_QWORD *)(v2 + 16);
          swift_release(v2);
          *(_QWORD *)(v19 + 14) = v25;
          swift_release(v2);
          _os_log_impl((void *)&_mh_execute_header, v17, v18, "Unable to initialize worker. Disabled for session lifetime. { worker=%{private}s, reporterID=%lld }", (uint8_t *)v19, 0x16u);
          v26 = (char *)&type metadata for Any + 8;
          v27 = v20;
LABEL_25:
          swift_arrayDestroy(v27, 1, v26);
          swift_slowDealloc(v20, -1, -1);
          swift_slowDealloc(v19, -1, -1);

          goto LABEL_4;
        }
      }

      swift_release_n(v2, 2);
LABEL_4:
      if (v5 == ++v7)
      {
        swift_bridgeObjectRelease(a1);
        break;
      }
    }
  }
  v88 = (char **)(v2 + 88);
  swift_beginAccess(v88, &v112, 33, 0);
  sub_10000B264(v88, (uint64_t (*)(uint64_t))&Config.WorkerConfigs.messageProcessOrder.getter);
  return swift_endAccess(&v112);
}

uint64_t sub_100008DA4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v9[24];
  _BYTE v10[40];
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v14[24];

  swift_beginAccess(v1 + 96, v14, 0, 0);
  sub_1000047AC(v1 + 96, (uint64_t)&v11, &qword_10003D808);
  if (!v12)
  {
    sub_100006B04((uint64_t)&v11, &qword_10003D808);
    v3 = type metadata accessor for NonOwningSession();
    v4 = swift_allocObject(v3, 64, 7);
    v5 = swift_weakInit(v4 + 56, 0);
    v6 = *(_QWORD *)(v1 + 40);
    *(_QWORD *)(v4 + 16) = *(_QWORD *)(v1 + 32);
    *(_QWORD *)(v4 + 24) = v6;
    *(_QWORD *)(v4 + 32) = *(_QWORD *)(v1 + 16);
    *(_BYTE *)(v4 + 40) = *(_BYTE *)(v1 + 24);
    *(_DWORD *)(v4 + 44) = *(_DWORD *)(v1 + 48);
    v7 = *(_QWORD *)(v1 + 56);
    *(_QWORD *)(v4 + 48) = v7;
    swift_weakAssign(v5, v1);
    v12 = v3;
    v13 = sub_100006818(&qword_10003E020, (uint64_t (*)(uint64_t))type metadata accessor for NonOwningSession, (uint64_t)&unk_100031D34);
    *(_QWORD *)&v11 = v4;
    sub_10000CCD4((uint64_t)&v11, (uint64_t)v10);
    swift_beginAccess(v1 + 96, v9, 33, 0);
    swift_bridgeObjectRetain(v6);
    swift_retain(v7);
    sub_1000031DC((uint64_t)v10, v1 + 96, &qword_10003D808);
    swift_endAccess(v9);
  }
  return sub_10000BF74(&v11, a1);
}

_QWORD *sub_100008F08(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (_QWORD *)v2;
  }
  return v1;
}

char *sub_100008F44(char *result, int64_t a2, char a3, char *a4, uint64_t *a5, uint64_t *a6)
{
  char v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  size_t v15;
  char *v16;

  v8 = (char)result;
  if ((a3 & 1) == 0)
  {
    v10 = a2;
    goto LABEL_8;
  }
  v9 = *((_QWORD *)a4 + 3);
  v10 = v9 >> 1;
  if ((uint64_t)(v9 >> 1) >= a2)
    goto LABEL_8;
  if (v10 + 0x4000000000000000 >= 0)
  {
    v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v10 = a2;
LABEL_8:
    v11 = *((_QWORD *)a4 + 2);
    if (v10 <= v11)
      v12 = *((_QWORD *)a4 + 2);
    else
      v12 = v10;
    if (v12)
    {
      v13 = sub_10000E354(a5);
      v14 = (char *)swift_allocObject(v13, 40 * v12 + 32, 7);
      v15 = j__malloc_size(v14);
      *((_QWORD *)v14 + 2) = v11;
      *((_QWORD *)v14 + 3) = 2 * ((uint64_t)(v15 - 32) / 40);
      v16 = v14 + 32;
      if ((v8 & 1) != 0)
      {
LABEL_13:
        if (v14 != a4 || v16 >= &a4[40 * v11 + 32])
          memmove(v16, a4 + 32, 40 * v11);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v14 = (char *)&_swiftEmptyArrayStorage;
      v16 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_10000B15C(0, v11, (unint64_t)v16, (uint64_t)a4, a6);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v14;
  }
  __break(1u);
  return result;
}

char *sub_100009070(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_100008F44(a1, a2, a3, a4, &qword_10003DFD8, &qword_10003DDF0);
}

void sub_100009084(uint64_t a1, void **a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t Strong;
  _QWORD *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  os_log_type_t v28;
  uint64_t v29;
  int v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void **v54;
  uint64_t v55;
  char v56[24];

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  a1 += 16;
  swift_beginAccess(a1, v56, 0, 0);
  Strong = swift_weakLoadStrong(a1);
  if (Strong)
  {
    v9 = (_QWORD *)Strong;
    v10 = Logger.logObject.getter(Strong);
    v11 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc(12, -1);
      *(_DWORD *)v12 = 134217984;
      v54 = a2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v54, &v55, v12 + 4, v12 + 12);
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "createSession() called. { reporterID=%lld }", v12, 0xCu);
      swift_slowDealloc(v12, -1, -1);
    }

    v13 = (_QWORD *)((char *)v9 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID);
    swift_beginAccess((char *)v9 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID, &v54, 0, 0);
    v15 = *v13;
    if (*(_QWORD *)(*v13 + 16) > 0x63uLL)
    {
      v18 = Logger.logObject.getter(v14);
      v28 = static os_log_type_t.fault.getter();
      if (!os_log_type_enabled(v18, v28))
      {
LABEL_15:
        swift_release(v9);

        return;
      }
      v20 = swift_slowAlloc(12, -1);
      *(_DWORD *)v20 = 134217984;
      v52 = 100;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, &v53, v20 + 4, v20 + 12);
      _os_log_impl((void *)&_mh_execute_header, v18, v28, "Not creating session. Client has exceeded max number of sessions. { maxNumberOfSessions=%ld }", (uint8_t *)v20, 0xCu);
LABEL_14:
      swift_slowDealloc(v20, -1, -1);
      goto LABEL_15;
    }
    *(double *)((char *)v9 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) = *(double *)((char *)v9 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) + 30.0;
    if (*(_QWORD *)(v15 + 16) && (sub_10000E860((uint64_t)a2), (v16 & 1) != 0))
    {
      v17 = swift_retain_n(v9, 3);
      v18 = Logger.logObject.getter(v17);
      v19 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v18, v19))
      {
        v20 = swift_slowAlloc(28, -1);
        v21 = swift_slowAlloc(32, -1);
        v51 = (uint64_t)a2;
        v52 = v21;
        *(_DWORD *)v20 = 134218499;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, &v52, v20 + 4, v20 + 12);
        *(_WORD *)(v20 + 12) = 1024;
        LODWORD(v51) = *(_DWORD *)((char *)v9 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, (char *)&v51 + 4, v20 + 14, v20 + 18);
        swift_release(v9);
        *(_WORD *)(v20 + 18) = 2081;
        v22 = v9[3];
        v23 = v9[4];
        swift_bridgeObjectRetain(v23);
        v51 = sub_10000A7E4(v22, v23, &v52);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, &v52, v20 + 20, v20 + 28);
        swift_release_n(v9, 2);
        swift_bridgeObjectRelease(v23);
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "createSession skipped, session already exists. { reporterID=%lld, pid=%d, processName=%{private}s }", (uint8_t *)v20, 0x1Cu);
        swift_arrayDestroy(v21, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v21, -1, -1);
        goto LABEL_14;
      }
      swift_release_n(v9, 4);

    }
    else
    {
      v29 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
      v30 = *(_DWORD *)((char *)v9 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid);
      v32 = v9[3];
      v31 = v9[4];
      v33 = v9[2];
      v34 = type metadata accessor for Session(0);
      swift_allocObject(v34, *(unsigned int *)(v34 + 48), *(unsigned __int16 *)(v34 + 52));
      swift_bridgeObjectRetain(v31);
      swift_retain(v33);
      v35 = sub_1000098F0(a2, v30, v32, v31, v33, 0);
      swift_beginAccess(v13, &v52, 33, 0);
      swift_retain(v35);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v13);
      v51 = *v13;
      *v13 = 0x8000000000000000;
      sub_1000097B8(v35, (uint64_t)a2, isUniquelyReferenced_nonNull_native);
      v37 = *v13;
      *v13 = v51;
      swift_bridgeObjectRelease(v37);
      swift_endAccess(&v52);
      v38 = swift_retain_n(v9, 3);
      v39 = Logger.logObject.getter(v38);
      v40 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v39, v40))
      {
        v41 = swift_slowAlloc(28, -1);
        v42 = swift_slowAlloc(32, -1);
        v50 = v35;
        v51 = (uint64_t)a2;
        v43 = v42;
        v52 = v42;
        *(_DWORD *)v41 = 134218499;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, &v52, v41 + 4, v41 + 12);
        *(_WORD *)(v41 + 12) = 1024;
        LODWORD(v51) = *(_DWORD *)((char *)v9 + v29);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, (char *)&v51 + 4, v41 + 14, v41 + 18);
        swift_release(v9);
        *(_WORD *)(v41 + 18) = 2081;
        v45 = v9[3];
        v44 = v9[4];
        swift_bridgeObjectRetain(v44);
        v51 = sub_10000A7E4(v45, v44, &v52);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, &v52, v41 + 20, v41 + 28);
        swift_release_n(v9, 2);
        swift_bridgeObjectRelease(v44);
        _os_log_impl((void *)&_mh_execute_header, v39, v40, "Created session. { reporterID=%lld, pid=%d, processName=%{private}s }", (uint8_t *)v41, 0x1Cu);
        swift_arrayDestroy(v43, 1, (char *)&type metadata for Any + 8);
        v46 = v43;
        v35 = v50;
        swift_slowDealloc(v46, -1, -1);
        swift_slowDealloc(v41, -1, -1);
      }
      else
      {
        swift_release_n(v9, 3);
      }

      v47 = (void *)objc_opt_self(Trace);
      v48 = objc_msgSend(objc_allocWithZone((Class)TraceArgs), "initWithArg1:", static Utilities.positiveReporterID(_:)(a2));
      objc_msgSend(v47, "post:args:", 4613, v48);

      sub_10000A254();
      swift_release(v9);
      swift_release(v35);
    }
  }
  else
  {
    v24 = static Logger.service.getter(0);
    v25 = Logger.logObject.getter(v24);
    v26 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "ClientServerInstance is gone. { action=createSession }", v27, 2u);
      swift_slowDealloc(v27, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t type metadata accessor for Session(uint64_t a1)
{
  uint64_t result;

  result = qword_10003DE90;
  if (!qword_10003DE90)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for Session);
  return result;
}

uint64_t sub_1000097B8(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t result;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v4 = v3;
  v8 = *v3;
  v10 = sub_10000E860(a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= result && (a3 & 1) == 0)
  {
    result = (uint64_t)sub_100024568();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      v17 = v16[7];
      result = swift_release(*(_QWORD *)(v17 + 8 * v10));
      *(_QWORD *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    v19 = 8 * v10;
    *(_QWORD *)(v16[6] + v19) = a2;
    *(_QWORD *)(v16[7] + v19) = a1;
    v20 = v16[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return result;
    }
    goto LABEL_14;
  }
  sub_100002F28(result, a3 & 1);
  result = sub_10000E860(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    v10 = result;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for Int64);
  __break(1u);
  return result;
}

uint64_t sub_1000098F0(void **a1, int a2, uint64_t a3, unint64_t a4, uint64_t a5, int a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  unint64_t v28;
  Swift::String v29;
  void *object;
  uint64_t v31;
  uint64_t v32;
  void **v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t result;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  _QWORD *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  NSObject *v62;
  os_log_type_t v63;
  uint8_t *v64;
  void **v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  void **aBlock;
  _QWORD v75[4];
  uint64_t v76;
  void **v77;

  v7 = v6;
  v73 = a6;
  v69 = a3;
  v70 = a4;
  v11 = type metadata accessor for Keys(0);
  v67 = *(_QWORD *)(v11 - 8);
  v68 = v11;
  __chkstk_darwin(v11);
  v66 = (char *)&v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v13);
  v15 = (char *)&v65 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v71 = *(_QWORD *)(v16 - 8);
  v72 = v16;
  __chkstk_darwin(v16);
  v18 = (char *)&v65 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v19);
  v21 = (char *)&v65 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_WORD *)(v7 + 64) = -1;
  *(_BYTE *)(v7 + 66) = 0;
  *(_QWORD *)(v7 + 72) = sub_10000A0B4((uint64_t)_swiftEmptyArrayStorage);
  *(_QWORD *)(v7 + 80) = 0;
  *(_QWORD *)(v7 + 88) = _swiftEmptyArrayStorage;
  *(_OWORD *)(v7 + 96) = 0u;
  *(_OWORD *)(v7 + 112) = 0u;
  *(_OWORD *)(v7 + 128) = 0u;
  static Logger.session.getter();
  *(_QWORD *)(v7 + OBJC_IVAR____TtC15audioanalyticsd7Session_summaryDecoratorWorkers) = _swiftEmptyArrayStorage;
  v22 = v7 + OBJC_IVAR____TtC15audioanalyticsd7Session_stopSignalTime;
  v23 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v22, 1, 1, v23);
  v24 = OBJC_IVAR____TtC15audioanalyticsd7Session_messageHistory;
  *(_QWORD *)(v7 + v24) = sub_100009F4C((uint64_t)_swiftEmptyArrayStorage);
  *(_QWORD *)(v7 + OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessages) = 0;
  *(_QWORD *)(v7 + OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessagesUnique) = 0;
  *(_BYTE *)(v7 + OBJC_IVAR____TtC15audioanalyticsd7Session_startOnFirstMessageCalled) = 0;
  *(_QWORD *)(v7 + 16) = a1;
  *(_DWORD *)(v7 + 48) = a2;
  v25 = v70;
  *(_QWORD *)(v7 + 32) = v69;
  *(_QWORD *)(v7 + 40) = v25;
  *(_QWORD *)(v7 + 56) = a5;
  LOBYTE(v25) = v73;
  *(_BYTE *)(v7 + 24) = v73;
  v26 = (v25 & 1) == 0;
  v27 = 5;
  if (v26)
    v27 = 1;
  *(_QWORD *)(v7 + OBJC_IVAR____TtC15audioanalyticsd7Session_stopWaitTime) = v27;
  v28 = sub_100009F10();
  v69 = a5;
  v70 = v28;
  aBlock = 0;
  v75[0] = 0xE000000000000000;
  swift_retain(a5);
  _StringGuts.grow(_:)(39);
  swift_bridgeObjectRelease(v75[0]);
  aBlock = (void **)0xD000000000000025;
  v75[0] = 0x8000000100033680;
  v65 = a1;
  v77 = a1;
  v29._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int64, &protocol witness table for Int64);
  object = v29._object;
  String.append(_:)(v29);
  v31 = swift_bridgeObjectRelease(object);
  v33 = aBlock;
  v32 = v75[0];
  static DispatchQoS.userInteractive.getter(v31);
  (*(void (**)(char *, _QWORD, uint64_t))(v71 + 104))(v18, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v72);
  aBlock = (void **)_swiftEmptyArrayStorage;
  v34 = sub_100006818((unint64_t *)&unk_10003DBF0, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  v35 = sub_10000E354(&qword_10003D648);
  v36 = sub_10000AD58((unint64_t *)&qword_10003DC00, &qword_10003D648);
  dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v35, v36, v13, v34);
  result = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(v33, v32, v21, v15, v18, 0);
  *(_QWORD *)(v7 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue) = result;
  if ((v73 & 1) == 0)
    goto LABEL_6;
  *(_WORD *)(v7 + 64) = 5;
  v38 = sub_10000E354(&qword_10003E058);
  v39 = sub_10000E354(&qword_10003D678);
  v40 = *(_QWORD *)(v39 - 8);
  v41 = *(_QWORD *)(v40 + 72);
  v42 = *(unsigned __int8 *)(v40 + 80);
  v43 = (v42 + 32) & ~v42;
  v44 = swift_allocObject(v38, v43 + v41, v42 | 7);
  *(_OWORD *)(v44 + 16) = xmmword_100031B80;
  v45 = (uint64_t *)(v44 + v43);
  v46 = (_QWORD *)(v44 + v43 + *(int *)(v39 + 48));
  v48 = v66;
  v47 = v67;
  v49 = v68;
  v50 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v67 + 104))(v66, enum case for Keys.applicationName(_:), v68);
  v51 = Keys.rawValue.getter(v50);
  v53 = v52;
  (*(void (**)(char *, uint64_t))(v47 + 8))(v48, v49);
  *v45 = v51;
  v45[1] = v53;
  *v46 = 0x6E776F6E6B6E55;
  v46[1] = 0xE700000000000000;
  v54 = enum case for SimpleType.string(_:);
  v55 = type metadata accessor for SimpleType(0);
  (*(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v55 - 8) + 104))(v46, v54, v55);
  v56 = sub_10000A0B4(v44);
  v57 = *(NSObject **)(v7 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
  v58 = swift_allocObject(&unk_10003A378, 32, 7);
  *(_QWORD *)(v58 + 16) = v7;
  *(_QWORD *)(v58 + 24) = v56;
  v59 = swift_allocObject(&unk_10003A3A0, 32, 7);
  *(_QWORD *)(v59 + 16) = sub_10002AAE4;
  *(_QWORD *)(v59 + 24) = v58;
  v75[3] = sub_1000133A4;
  v76 = v59;
  aBlock = _NSConcreteStackBlock;
  v75[0] = 1107296256;
  v75[1] = sub_100005D54;
  v75[2] = &unk_10003A3B8;
  v60 = _Block_copy(&aBlock);
  v61 = v76;
  swift_retain(v7);
  swift_bridgeObjectRetain(v56);
  swift_retain(v59);
  swift_release(v61);
  dispatch_sync(v57, v60);
  _Block_release(v60);
  LOBYTE(v57) = swift_isEscapingClosureAtFileLocation(v59, "", 111, 100, 24, 1);
  swift_bridgeObjectRelease(v56);
  swift_release(v58);
  result = swift_release(v59);
  if ((v57 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
LABEL_6:
    v62 = Logger.logObject.getter(result);
    v63 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v62, v63))
    {
      v64 = (uint8_t *)swift_slowAlloc(12, -1);
      *(_DWORD *)v64 = 134217984;
      aBlock = v65;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v75, v64 + 4, v64 + 12);
      _os_log_impl((void *)&_mh_execute_header, v62, v63, "Created reporting session. { reporterID=%lld }", v64, 0xCu);
      swift_slowDealloc(v64, -1, -1);
    }

    swift_release(v69);
    return v7;
  }
  return result;
}

unint64_t sub_100009F10()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003D640;
  if (!qword_10003D640)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10003D640);
  }
  return result;
}

unint64_t sub_100009F4C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  Swift::UInt32 *v5;
  uint64_t v6;
  _QWORD *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  Swift::UInt32 v11;
  unint64_t result;
  char v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;

  v2 = sub_10000E354(&qword_10003D6A0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (Swift::UInt32 *)((char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = *(_QWORD *)(a1 + 16);
  if (v6)
  {
    sub_10000E354(&qword_10003D6A8);
    v7 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v6);
    v8 = (char *)v5 + *(int *)(v2 + 48);
    v9 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v10 = *(_QWORD *)(v3 + 72);
    while (1)
    {
      sub_1000047AC(v9, (uint64_t)v5, &qword_10003D6A0);
      v11 = *v5;
      result = sub_10000D54C(*v5);
      if ((v13 & 1) != 0)
        break;
      v14 = result;
      *(_QWORD *)((char *)v7 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_DWORD *)(v7[6] + 4 * result) = v11;
      v15 = v7[7];
      v16 = type metadata accessor for Message(0);
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v15 + *(_QWORD *)(*(_QWORD *)(v16 - 8) + 72) * v14, v8, v16);
      v17 = v7[2];
      v18 = __OFADD__(v17, 1);
      v19 = v17 + 1;
      if (v18)
        goto LABEL_10;
      v7[2] = v19;
      v9 += v10;
      if (!--v6)
        return (unint64_t)v7;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  return result;
}

unint64_t sub_10000A0B4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t result;
  char v18;
  unint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v2 = sub_10000E354(&qword_10003D678);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (uint64_t *)((char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
  {
    v8 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    v26 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v26);
    return (unint64_t)v8;
  }
  sub_10000E354(&qword_10003D680);
  v7 = static _DictionaryStorage.allocate(capacity:)(v6);
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
    goto LABEL_9;
  v10 = (char *)v5 + *(int *)(v2 + 48);
  v11 = v7 + 64;
  v12 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v28 = a1;
  v13 = a1 + v12;
  v14 = *(_QWORD *)(v3 + 72);
  swift_retain(v7);
  while (1)
  {
    sub_1000047AC(v13, (uint64_t)v5, &qword_10003D678);
    v15 = *v5;
    v16 = v5[1];
    result = sub_10000D9BC(*v5, v16);
    if ((v18 & 1) != 0)
      break;
    v19 = result;
    *(_QWORD *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v20 = (uint64_t *)(v8[6] + 16 * result);
    *v20 = v15;
    v20[1] = v16;
    v21 = v8[7];
    v22 = type metadata accessor for SimpleType(0);
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v21 + *(_QWORD *)(*(_QWORD *)(v22 - 8) + 72) * v19, v10, v22);
    v23 = v8[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (v24)
      goto LABEL_12;
    v8[2] = v25;
    v13 += v14;
    if (!--v9)
    {
      swift_release(v8);
      v26 = v28;
      goto LABEL_10;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

void sub_10000A254()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void (*v9)(_QWORD *, uint64_t, uint64_t);
  id v10;
  void (*v11)(_QWORD *, uint64_t);
  void *v12;
  id v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  unint64_t *v27;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v29;
  unint64_t v30;
  int64_t v31;
  int64_t *v32;
  uint64_t v33;
  unint64_t *v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  uint64_t v50;
  unint64_t *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  int64_t *v57;
  uint64_t v58;
  unint64_t *v59;
  char v60[24];

  v1 = type metadata accessor for DispatchPredicate(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin();
  v4 = (_QWORD **)((char *)&v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v56 = v0;
  v5 = *(_QWORD *)(v0 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_server);
  v6 = OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue;
  v7 = *(void **)(v5 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  *v4 = v7;
  v8 = enum case for DispatchPredicate.onQueue(_:);
  v9 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v2 + 104);
  v9(v4, enum case for DispatchPredicate.onQueue(_:), v1);
  v10 = v7;
  LOBYTE(v7) = _dispatchPreconditionTest(_:)(v4);
  v11 = *(void (**)(_QWORD *, uint64_t))(v2 + 8);
  v11(v4, v1);
  if ((v7 & 1) == 0)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v12 = *(void **)(v5 + v6);
  *v4 = v12;
  v9(v4, v8, v1);
  v13 = v12;
  v14 = _dispatchPreconditionTest(_:)(v4);
  v11(v4, v1);
  if ((v14 & 1) == 0)
  {
LABEL_32:
    __break(1u);
    return;
  }
  v15 = v56;
  v16 = (_QWORD *)(v56 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID);
  swift_beginAccess(v56 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID, v60, 0, 0);
  v17 = *v16;
  v18 = swift_bridgeObjectRetain(*v16);
  v19 = sub_10000AD98(v18);
  swift_bridgeObjectRelease(v17);
  v20 = (_QWORD *)v19[2];
  swift_retain(v15);
  if (v20)
  {
    v21 = 0;
    v55 = (_QWORD *)((char *)v20 - 1);
    v57 = (int64_t *)&_swiftEmptyArrayStorage;
    do
    {
      if (v21 <= v20)
        v22 = v20;
      else
        v22 = v21;
      v23 = v21;
      while (1)
      {
        if (v22 == v23)
        {
          __break(1u);
          goto LABEL_31;
        }
        v24 = v19[(_QWORD)v23 + 4];
        v25 = sub_10000E3D4(v24, 0, 0x7669746341746567, 0xE900000000000065);
        if (v25)
        {
          v26 = *(unsigned __int8 *)(v25 + 66);
          swift_release(v25);
          if (v26 == 1)
            break;
        }
        v23 = (_QWORD *)((char *)v23 + 1);
        if (v20 == v23)
          goto LABEL_20;
      }
      v27 = (unint64_t *)v57;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v57);
      v59 = v27;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_100028B40(0, v27[2] + 1, 1);
        v27 = v59;
      }
      v30 = v27[2];
      v29 = v27[3];
      if (v30 >= v29 >> 1)
      {
        sub_100028B40(v29 > 1, v30 + 1, 1);
        v27 = v59;
      }
      v21 = (_QWORD *)((char *)v23 + 1);
      v27[2] = v30 + 1;
      v57 = (int64_t *)v27;
      v27[v30 + 4] = v24;
      v15 = v56;
    }
    while (v55 != v23);
  }
  else
  {
    v57 = (int64_t *)&_swiftEmptyArrayStorage;
  }
LABEL_20:
  v55 = v16;
  swift_release(v19);
  swift_release(v15);
  v31 = v57[2];
  if (v31)
  {
    v59 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_100028B24(0, v31, 0);
    v32 = v57;
    v33 = 0;
    v34 = v59;
    do
    {
      v58 = v32[v33 + 4];
      v35 = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int64, &protocol witness table for Int64);
      v37 = v36;
      v59 = v34;
      v39 = v34[2];
      v38 = v34[3];
      if (v39 >= v38 >> 1)
      {
        sub_100028B24(v38 > 1, v39 + 1, 1);
        v34 = v59;
      }
      ++v33;
      v34[2] = v39 + 1;
      v40 = &v34[2 * v39];
      v40[4] = v35;
      v40[5] = v37;
      v32 = v57;
    }
    while (v31 != v33);
    swift_release(v57);
  }
  else
  {
    swift_release(v57);
    v34 = (unint64_t *)&_swiftEmptyArrayStorage;
  }
  v59 = v34;
  v41 = sub_10000E354(&qword_10003D7F0);
  v42 = sub_10000AD18(&qword_10003D7F8, &qword_10003D7F0, (uint64_t)&protocol conformance descriptor for [A]);
  v43 = BidirectionalCollection<>.joined(separator:)(44, 0xE100000000000000, v41, v42);
  v45 = v44;
  swift_bridgeObjectRelease(v34);
  v46 = v56;
  swift_retain_n(v56, 4);
  v47 = swift_bridgeObjectRetain(v45);
  v48 = Logger.logObject.getter(v47);
  v49 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v48, v49))
  {
    v50 = swift_slowAlloc(32, -1);
    v51 = (unint64_t *)swift_slowAlloc(64, -1);
    v59 = v51;
    *(_DWORD *)v50 = 136381187;
    v52 = *(_QWORD *)(v46 + 24);
    v53 = *(_QWORD *)(v46 + 32);
    swift_bridgeObjectRetain(v53);
    v58 = sub_10000A7E4(v52, v53, (uint64_t *)&v59);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, &v59, v50 + 4, v50 + 12);
    swift_release_n(v46, 2);
    swift_bridgeObjectRelease(v53);
    *(_WORD *)(v50 + 12) = 2048;
    v54 = *(_QWORD *)(*v55 + 16);
    swift_release(v46);
    v58 = v54;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, &v59, v50 + 14, v50 + 22);
    swift_release(v46);
    *(_WORD *)(v50 + 22) = 2081;
    swift_bridgeObjectRetain(v45);
    v58 = sub_10000A7E4(v43, v45, (uint64_t *)&v59);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, &v59, v50 + 24, v50 + 32);
    swift_bridgeObjectRelease_n(v45, 3);
    _os_log_impl((void *)&_mh_execute_header, v48, v49, "Active reporting sessions. { clientProcessName=%{private}s, sessionCount=%ld, activeSessions=%{private}s }", (uint8_t *)v50, 0x20u);
    swift_arrayDestroy(v51, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v51, -1, -1);
    swift_slowDealloc(v50, -1, -1);

  }
  else
  {
    swift_bridgeObjectRelease_n(v45, 2);

    swift_release_n(v46, 4);
  }
}

uint64_t sub_10000A7E4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_10000A8B4(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_10000AA6C((uint64_t)v12, *a3);
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
      sub_10000AA6C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10000CC90(v12);
  return v7;
}

uint64_t sub_10000A8B4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_10000AAA8(a5, a6);
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

uint64_t sub_10000AA6C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000AAA8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_10000AB3C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_10000AE7C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_10000AE7C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_10000AB3C(uint64_t a1, unint64_t a2)
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
      v5 = sub_10000ACB0(v4, 0);
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

_QWORD *sub_10000ACB0(uint64_t a1, uint64_t a2)
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
  v4 = sub_10000E354(&qword_10003DFE0);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10000AD18(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_1000101F8(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000AD58(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_1000101F8(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
    atomic_store(result, a1);
  }
  return result;
}

_QWORD *sub_10000AD98(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v10;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return &_swiftEmptyArrayStorage;
  v3 = sub_10000E354(&qword_10003D800);
  v4 = (_QWORD *)swift_allocObject(v3, 8 * v1 + 32, 7);
  v5 = j__malloc_size(v4);
  v6 = v5 - 32;
  if (v5 < 32)
    v6 = v5 - 25;
  v4[2] = v1;
  v4[3] = 2 * (v6 >> 3);
  v7 = sub_10000AFC8(&v10, v4 + 4, v1, a1);
  v8 = v10;
  swift_bridgeObjectRetain(a1);
  sub_100014E70(v8);
  if (v7 != (_QWORD *)v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }
  return v4;
}

uint64_t sub_10000AE7C(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_10000E354(&qword_10003DFE0);
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

_QWORD *sub_10000AFC8(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;

  v4 = a4 + 64;
  v5 = -1;
  v6 = -1 << *(_BYTE *)(a4 + 32);
  if (-v6 < 64)
    v5 = ~(-1 << -(char)v6);
  v7 = v5 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v8 = 0;
    a3 = 0;
LABEL_35:
    *result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (_QWORD *)a3;
  }
  if (!a3)
  {
    v8 = 0;
    goto LABEL_35;
  }
  if (a3 < 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  v8 = 0;
  v9 = 0;
  v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    v12 = v11 | (v8 << 6);
LABEL_8:
    ++v9;
    *a2++ = *(_QWORD *)(*(_QWORD *)(a4 + 48) + 8 * v12);
    if (v9 == a3)
      goto LABEL_35;
  }
  v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v13 >= v10)
    goto LABEL_30;
  v14 = *(_QWORD *)(v4 + 8 * v13);
  if (v14)
    goto LABEL_19;
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    v7 = 0;
    v8 = v13;
    goto LABEL_34;
  }
  v14 = *(_QWORD *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_15:
    v13 = v8;
LABEL_19:
    v16 = __clz(__rbit64(v14));
    v7 = (v14 - 1) & v14;
    v12 = v16 + (v13 << 6);
    v8 = v13;
    goto LABEL_8;
  }
  v15 = v13 + 2;
  if (v13 + 2 >= v10)
    goto LABEL_30;
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_18:
    v13 = v15;
    goto LABEL_19;
  }
  v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    v7 = 0;
    v8 = v13 + 2;
    goto LABEL_34;
  }
  v14 = *(_QWORD *)(v4 + 8 * v8);
  if (v14)
    goto LABEL_15;
  v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_30:
    v7 = 0;
LABEL_34:
    a3 = v9;
    goto LABEL_35;
  }
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
    goto LABEL_18;
  while (1)
  {
    v13 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v13 >= v10)
    {
      v7 = 0;
      v8 = v10 - 1;
      goto LABEL_34;
    }
    v14 = *(_QWORD *)(v4 + 8 * v13);
    ++v15;
    if (v14)
      goto LABEL_19;
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_10000B15C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5;
  unint64_t v7;
  unint64_t v8;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v5 < 0)
  {
LABEL_9:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v7 = a4 + 40 * a1 + 32;
  v8 = a3 + 40 * v5;
  if (v7 >= v8 || v7 + 40 * v5 <= a3)
  {
    sub_10000E354(a5);
    swift_arrayInitWithCopy(a3);
    return v8;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

Swift::Int sub_10000B264(char **a1, uint64_t (*a2)(uint64_t))
{
  char *v4;
  uint64_t v5;
  Swift::Int result;
  _QWORD v7[2];

  v4 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0)
    v4 = sub_100029FE4((uint64_t)v4);
  v5 = *((_QWORD *)v4 + 2);
  v7[0] = v4 + 32;
  v7[1] = v5;
  result = sub_10000B2D8(v7, a2);
  *a1 = v4;
  return result;
}

Swift::Int sub_10000B2D8(_QWORD *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::Int v6;
  Swift::Int result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  Swift::Int v13;
  unint64_t v14;
  Swift::Int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void (*v22)(char *, uint64_t);
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  Swift::Int v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t);
  char *v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t);
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  Swift::Int v45;
  Swift::Int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  Swift::Int v51;
  uint64_t v52;
  Swift::Int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t);
  void (*v60)(char *, uint64_t);
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  __int128 v69;
  unint64_t v70;
  unint64_t v71;
  char *v72;
  char *v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  BOOL v85;
  unint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  BOOL v95;
  uint64_t v96;
  char v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  BOOL v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  unint64_t v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  unint64_t v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  unint64_t v130;
  _QWORD *v131;
  uint64_t v132;
  char *v133;
  _QWORD *v134;
  Swift::Int v135;
  uint64_t v136;
  void (*v137)(char *, uint64_t);
  Swift::Int v138;
  Swift::Int v139;
  uint64_t v140;
  _QWORD *v141;
  char *v142;
  uint64_t v143;
  uint64_t v144;
  Swift::Int v145;
  char *v146;
  char *v147;
  uint64_t v148;
  uint64_t (*v149)(uint64_t);
  Swift::Int v150;
  _QWORD v151[3];
  uint64_t v152;
  uint64_t v153;
  __int128 v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;

  v149 = a2;
  v148 = type metadata accessor for Config.WorkerConfigs(0);
  v144 = *(_QWORD *)(v148 - 8);
  v3 = __chkstk_darwin(v148);
  v147 = (char *)&v132 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v146 = (char *)&v132 - v5;
  v6 = a1[1];
  result = _minimumMergeRunLength(_:)(v6);
  if (result >= v6)
  {
    if (v6 < 0)
      goto LABEL_136;
    if (v6)
      return sub_10000BD48(0, v6, 1, a1, v149);
    return result;
  }
  if (v6 >= 0)
    v8 = v6;
  else
    v8 = v6 + 1;
  if (v6 < -1)
    goto LABEL_144;
  v141 = a1;
  if (v6 < 2)
  {
    v12 = (char *)_swiftEmptyArrayStorage;
    v142 = (char *)&_swiftEmptyArrayStorage[4];
    v134 = _swiftEmptyArrayStorage;
    if (v6 != 1)
    {
      v14 = _swiftEmptyArrayStorage[2];
LABEL_102:
      v123 = v143;
      if (v14 >= 2)
      {
        v124 = *v141;
        do
        {
          v125 = v14 - 2;
          if (v14 < 2)
            goto LABEL_131;
          if (!v124)
            goto LABEL_143;
          v113 = v12;
          v126 = v12 + 32;
          v127 = *(_QWORD *)&v12[16 * v125 + 32];
          v128 = *(_QWORD *)&v12[16 * v14 + 24];
          sub_10002949C((char *)(v124 + 40 * v127), (char *)(v124 + 40 * *(_QWORD *)&v126[16 * v14 - 16]), v124 + 40 * v128, v142, v149);
          if (v123)
            goto LABEL_99;
          if (v128 < v127)
            goto LABEL_132;
          if ((swift_isUniquelyReferenced_nonNull_native(v113) & 1) == 0)
            v113 = sub_100029BF8((uint64_t)v113);
          if (v125 >= *((_QWORD *)v113 + 2))
            goto LABEL_133;
          v129 = &v113[16 * v125 + 32];
          *(_QWORD *)v129 = v127;
          *((_QWORD *)v129 + 1) = v128;
          v130 = *((_QWORD *)v113 + 2);
          if (v14 > v130)
            goto LABEL_134;
          v12 = v113;
          memmove(&v113[16 * v14 + 16], &v113[16 * v14 + 32], 16 * (v130 - v14));
          *((_QWORD *)v113 + 2) = v130 - 1;
          v14 = v130 - 1;
        }
        while (v130 > 2);
      }
      v122 = v12;
LABEL_114:
      swift_bridgeObjectRelease(v122);
      v131 = v134;
      v134[2] = 0;
      return swift_bridgeObjectRelease(v131);
    }
    v135 = result;
  }
  else
  {
    v135 = result;
    v9 = v8 >> 1;
    v10 = sub_10000E354(&qword_10003DDF0);
    v11 = static Array._allocateBufferUninitialized(minimumCapacity:)(v9, v10);
    *(_QWORD *)(v11 + 16) = v9;
    v134 = (_QWORD *)v11;
    v142 = (char *)(v11 + 32);
  }
  v13 = 0;
  v12 = (char *)_swiftEmptyArrayStorage;
  while (1)
  {
    v15 = v13++;
    v139 = v15;
    if (v13 < v6)
    {
      v136 = *a1;
      v16 = v136;
      sub_10000CCD4(v136 + 40 * v13, (uint64_t)&v154);
      sub_10000CCD4(v16 + 40 * v15, (uint64_t)v151);
      v18 = v155;
      v17 = v156;
      sub_10000CCB0(&v154, v155);
      v145 = v6;
      v19 = v146;
      v20 = dispatch thunk of WorkerProtocol.workerConfig.getter(v18, v17);
      v21 = v149;
      LODWORD(v140) = v149(v20);
      v22 = *(void (**)(char *, uint64_t))(v144 + 8);
      v23 = v19;
      v24 = v148;
      v22(v23, v148);
      v25 = v152;
      v157 = v153;
      sub_10000CCB0(v151, v152);
      v26 = v147;
      v27 = dispatch thunk of WorkerProtocol.workerConfig.getter(v25, v157);
      LODWORD(v138) = v21(v27);
      v6 = v145;
      v137 = v22;
      v22(v26, v24);
      sub_10000CC90(v151);
      sub_10000CC90(&v154);
      v13 = v15 + 2;
      if (v15 + 2 < v6)
      {
        v133 = v12;
        v28 = v136 + 40 * v15 + 40;
        while (1)
        {
          v29 = v13;
          LODWORD(v157) = v140 < v138;
          sub_10000CCD4(v28 + 40, (uint64_t)&v154);
          sub_10000CCD4(v28, (uint64_t)v151);
          v30 = v155;
          v31 = v156;
          sub_10000CCB0(&v154, v155);
          v32 = v146;
          v33 = dispatch thunk of WorkerProtocol.workerConfig.getter(v30, v31);
          v34 = v149;
          LOBYTE(v150) = v149(v33);
          LODWORD(v150) = v150;
          v35 = v32;
          v36 = v148;
          v37 = v137;
          v137(v35, v148);
          v38 = v152;
          v39 = v153;
          sub_10000CCB0(v151, v152);
          v40 = v147;
          v41 = dispatch thunk of WorkerProtocol.workerConfig.getter(v38, v39);
          LOBYTE(v38) = v34(v41);
          v37(v40, v36);
          LODWORD(v38) = v150 >= v38;
          sub_10000CC90(v151);
          sub_10000CC90(&v154);
          if ((_DWORD)v157 == (_DWORD)v38)
            break;
          v13 = v29 + 1;
          v28 += 40;
          v6 = v145;
          if (v145 == v29 + 1)
          {
            v13 = v145;
            v12 = v133;
            a1 = v141;
            v15 = v139;
            goto LABEL_24;
          }
        }
        a1 = v141;
        v13 = v29;
        v12 = v133;
        v15 = v139;
        v6 = v145;
      }
LABEL_24:
      if (v140 < v138)
      {
        if (v13 < v15)
          goto LABEL_137;
        if (v15 < v13)
        {
          v42 = v12;
          v43 = 40 * v13 - 40;
          v44 = 40 * v15;
          v45 = v13;
          v46 = v15;
          do
          {
            if (v46 != --v45)
            {
              if (!v136)
                goto LABEL_142;
              v47 = v136 + v44;
              v48 = v136 + v43;
              sub_10000BF74((__int128 *)(v136 + v44), (uint64_t)&v154);
              v49 = *(_QWORD *)(v48 + 32);
              v50 = *(_OWORD *)(v48 + 16);
              *(_OWORD *)v47 = *(_OWORD *)v48;
              *(_OWORD *)(v47 + 16) = v50;
              *(_QWORD *)(v47 + 32) = v49;
              sub_10000BF74(&v154, v48);
            }
            ++v46;
            v43 -= 40;
            v44 += 40;
          }
          while (v46 < v45);
          v12 = v42;
          a1 = v141;
          v6 = v145;
        }
      }
    }
    if (v13 < v6)
    {
      if (__OFSUB__(v13, v15))
        goto LABEL_135;
      if (v13 - v15 < v135)
        break;
    }
LABEL_52:
    if (v13 < v15)
      goto LABEL_130;
    if ((swift_isUniquelyReferenced_nonNull_native(v12) & 1) == 0)
      v12 = sub_1000299A0(0, *((_QWORD *)v12 + 2) + 1, 1, v12);
    v71 = *((_QWORD *)v12 + 2);
    v70 = *((_QWORD *)v12 + 3);
    v14 = v71 + 1;
    if (v71 >= v70 >> 1)
      v12 = sub_1000299A0((char *)(v70 > 1), v71 + 1, 1, v12);
    *((_QWORD *)v12 + 2) = v14;
    v72 = v12 + 32;
    v73 = &v12[16 * v71 + 32];
    *(_QWORD *)v73 = v15;
    *((_QWORD *)v73 + 1) = v13;
    if (v71)
    {
      while (1)
      {
        v74 = v14 - 1;
        if (v14 >= 4)
        {
          v79 = &v72[16 * v14];
          v80 = *((_QWORD *)v79 - 8);
          v81 = *((_QWORD *)v79 - 7);
          v85 = __OFSUB__(v81, v80);
          v82 = v81 - v80;
          if (v85)
            goto LABEL_119;
          v84 = *((_QWORD *)v79 - 6);
          v83 = *((_QWORD *)v79 - 5);
          v85 = __OFSUB__(v83, v84);
          v77 = v83 - v84;
          v78 = v85;
          if (v85)
            goto LABEL_120;
          v86 = v14 - 2;
          v87 = &v72[16 * v14 - 32];
          v89 = *(_QWORD *)v87;
          v88 = *((_QWORD *)v87 + 1);
          v85 = __OFSUB__(v88, v89);
          v90 = v88 - v89;
          if (v85)
            goto LABEL_122;
          v85 = __OFADD__(v77, v90);
          v91 = v77 + v90;
          if (v85)
            goto LABEL_125;
          if (v91 >= v82)
          {
            v109 = &v72[16 * v74];
            v111 = *(_QWORD *)v109;
            v110 = *((_QWORD *)v109 + 1);
            v85 = __OFSUB__(v110, v111);
            v112 = v110 - v111;
            if (v85)
              goto LABEL_129;
            v102 = v77 < v112;
            goto LABEL_89;
          }
        }
        else
        {
          if (v14 != 3)
          {
            v103 = *((_QWORD *)v12 + 4);
            v104 = *((_QWORD *)v12 + 5);
            v85 = __OFSUB__(v104, v103);
            v96 = v104 - v103;
            v97 = v85;
            goto LABEL_83;
          }
          v76 = *((_QWORD *)v12 + 4);
          v75 = *((_QWORD *)v12 + 5);
          v85 = __OFSUB__(v75, v76);
          v77 = v75 - v76;
          v78 = v85;
        }
        if ((v78 & 1) != 0)
          goto LABEL_121;
        v86 = v14 - 2;
        v92 = &v72[16 * v14 - 32];
        v94 = *(_QWORD *)v92;
        v93 = *((_QWORD *)v92 + 1);
        v95 = __OFSUB__(v93, v94);
        v96 = v93 - v94;
        v97 = v95;
        if (v95)
          goto LABEL_124;
        v98 = &v72[16 * v74];
        v100 = *(_QWORD *)v98;
        v99 = *((_QWORD *)v98 + 1);
        v85 = __OFSUB__(v99, v100);
        v101 = v99 - v100;
        if (v85)
          goto LABEL_127;
        if (__OFADD__(v96, v101))
          goto LABEL_128;
        if (v96 + v101 >= v77)
        {
          v102 = v77 < v101;
LABEL_89:
          if (v102)
            v74 = v86;
          goto LABEL_91;
        }
LABEL_83:
        if ((v97 & 1) != 0)
          goto LABEL_123;
        v105 = &v72[16 * v74];
        v107 = *(_QWORD *)v105;
        v106 = *((_QWORD *)v105 + 1);
        v85 = __OFSUB__(v106, v107);
        v108 = v106 - v107;
        if (v85)
          goto LABEL_126;
        if (v108 < v96)
          goto LABEL_15;
LABEL_91:
        v113 = v12;
        v114 = v74 - 1;
        if (v74 - 1 >= v14)
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
        v115 = *a1;
        if (!*a1)
          goto LABEL_141;
        v116 = &v72[16 * v114];
        v117 = *(_QWORD *)v116;
        v118 = &v72[16 * v74];
        v119 = *((_QWORD *)v118 + 1);
        v120 = v143;
        sub_10002949C((char *)(v115 + 40 * *(_QWORD *)v116), (char *)(v115 + 40 * *(_QWORD *)v118), v115 + 40 * v119, v142, v149);
        v143 = v120;
        if (v120)
        {
LABEL_99:
          v122 = v113;
          goto LABEL_114;
        }
        if (v119 < v117)
          goto LABEL_116;
        if (v74 > *((_QWORD *)v113 + 2))
          goto LABEL_117;
        *(_QWORD *)v116 = v117;
        *(_QWORD *)&v72[16 * v114 + 8] = v119;
        v121 = *((_QWORD *)v113 + 2);
        if (v74 >= v121)
          goto LABEL_118;
        v12 = v113;
        v14 = v121 - 1;
        memmove(&v72[16 * v74], v118 + 16, 16 * (v121 - 1 - v74));
        *((_QWORD *)v113 + 2) = v121 - 1;
        a1 = v141;
        if (v121 <= 2)
          goto LABEL_15;
      }
    }
    v14 = 1;
LABEL_15:
    v6 = a1[1];
    if (v13 >= v6)
      goto LABEL_102;
  }
  if (__OFADD__(v15, v135))
    goto LABEL_138;
  if (v15 + v135 >= v6)
    v51 = v6;
  else
    v51 = v15 + v135;
  if (v51 >= v15)
  {
    if (v13 != v51)
    {
      v133 = v12;
      v52 = 40 * v13 - 40;
      v138 = v51;
      do
      {
        v140 = v52;
        v145 = v13;
        while (1)
        {
          v150 = v15;
          v54 = *a1 + v52;
          sub_10000CCD4(v54 + 40, (uint64_t)&v154);
          sub_10000CCD4(v54, (uint64_t)v151);
          v55 = v155;
          v56 = v156;
          sub_10000CCB0(&v154, v155);
          v57 = v146;
          v58 = dispatch thunk of WorkerProtocol.workerConfig.getter(v55, v56);
          v59 = v149;
          LOBYTE(v157) = v149(v58);
          LODWORD(v157) = v157;
          v60 = *(void (**)(char *, uint64_t))(v144 + 8);
          v61 = v57;
          v62 = v148;
          v60(v61, v148);
          v63 = v152;
          v64 = v153;
          sub_10000CCB0(v151, v152);
          v65 = v147;
          v66 = dispatch thunk of WorkerProtocol.workerConfig.getter(v63, v64);
          LOBYTE(v63) = v59(v66);
          v60(v65, v62);
          sub_10000CC90(v151);
          sub_10000CC90(&v154);
          if (v157 >= v63)
            break;
          v67 = *a1;
          if (!*a1)
            goto LABEL_140;
          v68 = v67 + v52;
          sub_10000BF74((__int128 *)(v67 + v52 + 40), (uint64_t)&v154);
          v69 = *(_OWORD *)(v68 + 16);
          *(_OWORD *)(v68 + 40) = *(_OWORD *)v68;
          *(_OWORD *)(v68 + 56) = v69;
          *(_QWORD *)(v68 + 72) = *(_QWORD *)(v68 + 32);
          sub_10000BF74(&v154, v68);
          v52 -= 40;
          v15 = v150 + 1;
          v53 = v145;
          if (v145 == v150 + 1)
            goto LABEL_45;
        }
        v53 = v145;
LABEL_45:
        v13 = v53 + 1;
        v52 = v140 + 40;
        v15 = v139;
      }
      while (v13 != v138);
      v13 = v138;
      v12 = v133;
    }
    goto LABEL_52;
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
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Can't construct Array with count < 0", 36, 2, "Swift/Array.swift", 17, 2, 936, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000BD48(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t);
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t);
  uint64_t v41;
  _QWORD v42[3];
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int v48;

  v40 = a5;
  v33 = a1;
  v8 = type metadata accessor for Config.WorkerConfigs(0);
  v38 = *(_QWORD *)(v8 - 8);
  v39 = v8;
  v9 = __chkstk_darwin(v8);
  v37 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = __chkstk_darwin(v9);
  v36 = (char *)&v31 - v12;
  v41 = a3;
  v32 = a2;
  if (a3 != a2)
  {
    v13 = v40;
    v14 = 40 * v41 - 40;
    v35 = a4;
LABEL_5:
    v15 = v33;
    v34 = v14;
    while (1)
    {
      v16 = *a4 + v14;
      sub_10000CCD4(v16 + 40, (uint64_t)&v45);
      sub_10000CCD4(v16, (uint64_t)v42);
      v18 = v46;
      v17 = v47;
      sub_10000CCB0(&v45, v46);
      v19 = v36;
      v20 = dispatch thunk of WorkerProtocol.workerConfig.getter(v18, v17);
      LOBYTE(v48) = v13(v20);
      v48 = v48;
      v21 = *(void (**)(char *, uint64_t))(v38 + 8);
      v22 = v19;
      v23 = v39;
      v21(v22, v39);
      v24 = v43;
      v25 = v44;
      sub_10000CCB0(v42, v43);
      v26 = v37;
      v27 = dispatch thunk of WorkerProtocol.workerConfig.getter(v24, v25);
      LOBYTE(v16) = v13(v27);
      v21(v26, v23);
      sub_10000CC90(v42);
      result = sub_10000CC90(&v45);
      a4 = v35;
      if (v48 >= v16)
      {
LABEL_4:
        v14 = v34 + 40;
        if (++v41 == v32)
          return result;
        goto LABEL_5;
      }
      v28 = *v35;
      if (!*v35)
        break;
      v29 = v28 + v14;
      sub_10000BF74((__int128 *)(v28 + v14 + 40), (uint64_t)&v45);
      v30 = *(_OWORD *)(v29 + 16);
      *(_OWORD *)(v29 + 40) = *(_OWORD *)v29;
      *(_OWORD *)(v29 + 56) = v30;
      *(_QWORD *)(v29 + 72) = *(_QWORD *)(v29 + 32);
      result = sub_10000BF74(&v45, v29);
      v14 -= 40;
      if (v41 == ++v15)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_10000BF74(__int128 *a1, uint64_t a2)
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

uint64_t sub_10000BF8C(unint64_t a1)
{
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
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  _BOOL4 v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  int v40;
  char v41;
  void (*v42)(uint64_t *, _QWORD);
  uint64_t v43;
  uint64_t (*v44)(uint64_t *, _QWORD);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  void (*v56)(uint64_t *, _QWORD);
  char *v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD *v68;
  uint64_t v69;
  NSObject *v70;
  os_log_type_t v71;
  uint8_t *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  __n128 v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  char v89;
  uint64_t result;
  Swift::UInt32 v91;
  uint64_t v92;
  uint64_t v93;
  BOOL v94;
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
  void (*v105)(char *, uint64_t);
  char *v106;
  uint64_t v107;
  char *v108;
  int v109;
  unint64_t v110;
  char *v111;
  __n128 v112;
  char *v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  void (*v122)(char *, uint64_t, uint64_t);
  uint64_t v123;
  char *v124;
  char v125[24];
  char v126[8];
  uint64_t v127;
  _BYTE v128[4];
  uint64_t v129;
  uint64_t v130;

  v2 = v1;
  v110 = a1;
  v116 = type metadata accessor for Config.WorkerConfigs(0);
  v115 = *(_QWORD *)(v116 - 8);
  __chkstk_darwin(v116);
  v114 = (char *)&v104 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_10000E354(&qword_10003DFC0);
  __chkstk_darwin(v4);
  v106 = (char *)&v104 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for OperatingSystem(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v104 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Message.Metadata(0);
  v118 = *(char **)(v10 - 8);
  __chkstk_darwin(v10);
  v108 = (char *)&v104 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v121 = type metadata accessor for Message(0);
  v117 = *(_QWORD *)(v121 - 8);
  v12 = __chkstk_darwin(v121);
  v113 = (char *)&v104 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __chkstk_darwin(v12);
  v120 = (char *)&v104 - v15;
  v16 = __chkstk_darwin(v14);
  v18 = (char *)&v104 - v17;
  v19 = __chkstk_darwin(v16);
  v112.n128_u64[0] = (unint64_t)&v104 - v20;
  __chkstk_darwin(v19);
  v124 = (char *)&v104 - v21;
  v22 = type metadata accessor for DispatchPredicate(0);
  v23 = *(_QWORD *)(v22 - 8);
  __chkstk_darwin(v22);
  v25 = (uint64_t *)((char *)&v104 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  v26 = *(void **)(v2 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
  *v25 = v26;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v23 + 104))(v25, enum case for DispatchPredicate.onQueue(_:), v22);
  v27 = v26;
  LOBYTE(v26) = _dispatchPreconditionTest(_:)(v25);
  (*(void (**)(_QWORD *, uint64_t))(v23 + 8))(v25, v22);
  if ((v26 & 1) == 0)
  {
    __break(1u);
LABEL_44:
    swift_once(&qword_10003D628, sub_1000300A0);
    goto LABEL_4;
  }
  v23 = OBJC_IVAR____TtC15audioanalyticsd7Session_startOnFirstMessageCalled;
  if ((*(_BYTE *)(v2 + OBJC_IVAR____TtC15audioanalyticsd7Session_startOnFirstMessageCalled) & 1) != 0)
    goto LABEL_5;
  if (qword_10003D628 != -1)
    goto LABEL_44;
LABEL_4:
  sub_100008194(qword_10003E370);
  *(_BYTE *)(v2 + v23) = 1;
LABEL_5:
  v28 = v2 + OBJC_IVAR____TtC15audioanalyticsd7Session_logger;
  v29 = swift_retain_n(v2, 2);
  v119 = v28;
  v30 = Logger.logObject.getter(v29);
  v31 = static os_log_type_t.debug.getter();
  v32 = os_log_type_enabled(v30, v31);
  v123 = v2;
  if (v32)
  {
    v33 = swift_slowAlloc(18, -1);
    *(_DWORD *)v33 = 134218240;
    v127 = *(_QWORD *)(v2 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v127, v128, v33 + 4, v33 + 12);
    *(_WORD *)(v33 + 12) = 1024;
    v34 = *(unsigned __int8 *)(v123 + 24);
    swift_release(v123);
    LODWORD(v127) = v34;
    v2 = v123;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v127, (char *)&v127 + 4, v33 + 14, v33 + 18);
    swift_release(v2);
    _os_log_impl((void *)&_mh_execute_header, v30, v31, "Processing message. { reporterID=%lld, singleServerSession=%{BOOL}d }", (uint8_t *)v33, 0x12u);
    swift_slowDealloc(v33, -1, -1);
  }
  else
  {
    swift_release_n(v2, 2);
  }
  v35 = v110;
  v36 = v117;

  v37 = *(_QWORD *)(v2 + 56);
  sub_100008DA4((uint64_t)&v127);
  v38 = sub_10001911C(v37, v35, (uint64_t)&v127, 0);
  v40 = v39;
  sub_100006B04((uint64_t)&v127, &qword_10003D808);
  v109 = v40;
  if ((v40 & 0x100) == 0)
  {
    v111 = (char *)v38;
    v107 = v10;
    v122 = *(void (**)(char *, uint64_t, uint64_t))(v36 + 16);
    v122(v124, v35, v121);
    v41 = sub_10000D0A4(v35);
    v42 = (void (*)(uint64_t *, _QWORD))Message.metadata.modify(&v127);
    Message.Metadata.isRedundant.setter(v41 & 1);
    v42(&v127, 0);
    v43 = *(unsigned __int8 *)(v2 + 66);
    v44 = (uint64_t (*)(uint64_t *, _QWORD))Message.metadata.modify(&v127);
    Message.Metadata.isSessionStarted.setter(v43);
    v45 = v44(&v127, 0);
    v46 = Message.appName.getter(v45);
    if (!v47)
      v46 = sub_10000EC60();
    v48 = v107;
    v49 = Message.appName.setter(v46);
    v50 = v108;
    v51 = Message.metadata.getter(v49);
    v52 = Message.Metadata.requiresSummaryDecoration.getter(v51);
    v105 = (void (*)(char *, uint64_t))*((_QWORD *)v118 + 1);
    v105(v50, v48);
    v53 = v121;
    v54 = v117;
    if ((v52 & 1) != 0)
    {
      v55 = v124;
      v56 = (void (*)(uint64_t *, _QWORD))Message.metadata.modify(&v127);
      Message.Metadata.requiresSummaryDecoration.setter(0);
      v56(&v127, 0);
      v57 = v111;
      swift_bridgeObjectRetain(v111);
      v59 = sub_100026998(v58);
      swift_bridgeObjectRelease(v57);
      v122(v18, (uint64_t)v55, v53);
      v60 = *((_QWORD *)v59 + 2);
      if (v60)
      {
        v61 = (uint64_t)(v59 + 32);
        v118 = v59;
        swift_bridgeObjectRetain(v59);
        do
        {
          sub_10000CCD4(v61, (uint64_t)&v127);
          v63 = v129;
          v62 = v130;
          sub_10000CCB0(&v127, v129);
          static DeviceUtilities.currentOperatingSystem.getter();
          dispatch thunk of SummaryDecorator.addDecoratorData(_:operatingSystem:)(v18, v9, v63, v62);
          (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
          sub_10000CC90(&v127);
          v61 += 40;
          --v60;
        }
        while (v60);
        v59 = v118;
        swift_bridgeObjectRelease(v118);
        v2 = v123;
      }
      v54 = v117;
      v64 = v112.n128_u64[0];
      (*(void (**)(unint64_t, char *, uint64_t))(v117 + 32))(v112.n128_u64[0], v18, v53);
      swift_bridgeObjectRelease(v59);
      (*(void (**)(char *, unint64_t, uint64_t))(v54 + 40))(v124, v64, v53);
    }
    swift_beginAccess(v2 + 88, v126, 0, 0);
    v65 = *(_QWORD *)(v2 + 88);
    v66 = (uint64_t)v111;
    v67 = *((_QWORD *)v111 + 2);
    swift_bridgeObjectRetain(v65);
    if (v67)
    {
      v68 = sub_10002A580(v65, v66);
      swift_bridgeObjectRelease(v65);
      v65 = (uint64_t)v68;
    }
    swift_bridgeObjectRelease(v66);
    v76 = *(_QWORD *)(v65 + 16);
    v77 = v120;
    if (v76)
    {
      v104 = v65;
      v78 = v65 + 32;
      v79 = swift_beginAccess(v124, v125, 0, 0);
      v79.n128_u64[0] = 136381187;
      v112 = v79;
      v111 = (char *)&type metadata for Any + 8;
      do
      {
        sub_10000CCD4(v78, (uint64_t)&v127);
        v80 = v129;
        v81 = v130;
        sub_10000CCB0(&v127, v129);
        v122(v77, (uint64_t)v124, v53);
        dispatch thunk of WorkerProtocol.process(message:)(v77, v80, v81);
        (*(void (**)(char *, uint64_t))(v54 + 8))(v77, v53);
        sub_10000CC90(&v127);
        v78 += 40;
        --v76;
      }
      while (v76);
      v82 = v104;
    }
    else
    {
      v82 = v65;
    }
    v83 = swift_bridgeObjectRelease(v82);
    v84 = v110;
    if ((Message.shouldRetain.getter(v83) & 1) != 0)
    {
      v85 = sub_100026BD4();
      sub_100022800(v84);
      swift_release(v85);
    }
    swift_beginAccess(v124, &v127, 32, 0);
    v86 = v108;
    v88 = Message.metadata.getter(v87);
    v89 = Message.Metadata.isRedundant.getter(v88);
    v105(v86, v107);
    result = swift_endAccess(&v127);
    if ((v89 & 1) == 0)
    {
      v91 = Message.category.getter(result);
      v92 = (uint64_t)v106;
      v122(v106, v84, v53);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v54 + 56))(v92, 0, 1, v53);
      swift_beginAccess(v2 + OBJC_IVAR____TtC15audioanalyticsd7Session_messageHistory, &v127, 33, 0);
      sub_10000CECC(v92, v91);
      result = swift_endAccess(&v127);
      v93 = *(_QWORD *)(v2 + OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessagesUnique);
      v94 = __CFADD__(v93, 1);
      v95 = v93 + 1;
      if (v94)
        goto LABEL_46;
      *(_QWORD *)(v2 + OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessagesUnique) = v95;
    }
    v96 = *(_QWORD *)(v2 + OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessages);
    v94 = __CFADD__(v96, 1);
    v97 = v96 + 1;
    if (!v94)
    {
      *(_QWORD *)(v2 + OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessages) = v97;
      v98 = (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v124, v53);
      v73 = Message.content.getter(v98);
      swift_retain(v2);
      v74 = v73;
      v75 = v2;
      goto LABEL_36;
    }
    __break(1u);
LABEL_46:
    __break(1u);
    return result;
  }
  swift_bridgeObjectRelease(v38);
  v69 = swift_retain(v2);
  v70 = Logger.logObject.getter(v69);
  v71 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v70, v71))
  {
    v72 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v72 = 134217984;
    v127 = *(_QWORD *)(v2 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v127, v128, v72 + 4, v72 + 12);
    swift_release(v2);
    _os_log_impl((void *)&_mh_execute_header, v70, v71, "Discarding message. { reporterID=%lld }", v72, 0xCu);
    swift_slowDealloc(v72, -1, -1);
  }
  else
  {
    swift_release(v2);
  }

  v73 = ((uint64_t (*)(void))Message.content.getter)();
  swift_retain(v2);
  v74 = v73;
  v75 = v2;
LABEL_36:
  v99 = sub_10000CD18(v74, v75);
  swift_release(v2);
  if (*(_QWORD *)(v99 + 16))
  {
    v100 = *(_QWORD *)(v2 + 80);
    if (v100)
    {
      swift_bridgeObjectRetain(*(_QWORD *)(v2 + 80));
      v101 = sub_10000EBE4(v99, v100);
      v102 = *(_QWORD *)(v2 + 80);
      *(_QWORD *)(v2 + 80) = v101;
      swift_bridgeObjectRelease(v73);
      v103 = v102;
    }
    else
    {
      *(_QWORD *)(v2 + 80) = v99;
      swift_bridgeObjectRelease(v73);
      v103 = 0;
    }
    swift_bridgeObjectRelease(v103);
  }
  else
  {
    swift_bridgeObjectRelease(v73);
    swift_release(v99);
  }
  return (v109 & 0x100) == 0;
}

uint64_t sub_10000CC90(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

_QWORD *sub_10000CCB0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000CCD4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000CD18(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char v6;
  unsigned int v7;
  unint64_t v8;
  size_t v9;
  uint64_t isStackAllocationSafe;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;

  v3 = v2;
  v6 = *(_BYTE *)(a1 + 32);
  v7 = v6 & 0x3F;
  v8 = (unint64_t)((1 << v6) + 63) >> 6;
  v9 = 8 * v8;
  isStackAllocationSafe = swift_retain_n(a2, 2);
  if (v7 <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(v9, 8), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v15 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0), v9);
    swift_retain(a2);
    v11 = sub_10000DEEC((unint64_t *)((char *)&v15 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0)), v8, a1, a2);
    v12 = swift_release(a2);
    if (v3)
      swift_willThrow(v12);
    swift_release_n(a2, 2);
  }
  else
  {
    v13 = (void *)swift_slowAlloc(v9, -1);
    bzero(v13, v9);
    swift_retain(a2);
    v11 = sub_10000DEEC((unint64_t *)v13, v8, a1, a2);
    swift_release(a2);
    swift_slowDealloc(v13, -1, -1);
    swift_release_n(a2, 2);
  }
  return v11;
}

uint64_t sub_10000CECC(uint64_t a1, Swift::UInt32 a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;

  v3 = v2;
  v6 = sub_10000E354(&qword_10003DFC0);
  __chkstk_darwin(v6);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Message(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(a1, 1, v9) == 1)
  {
    sub_100006B04(a1, &qword_10003DFC0);
    v13 = sub_10000D54C(a2);
    if ((v14 & 1) != 0)
    {
      v15 = v13;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
      v17 = *v3;
      v24 = *v3;
      *v3 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_1000248B8();
        v17 = v24;
      }
      (*(void (**)(char *, unint64_t, uint64_t))(v10 + 32))(v8, *(_QWORD *)(v17 + 56) + *(_QWORD *)(v10 + 72) * v15, v9);
      sub_100028568(v15, v17);
      v18 = *v3;
      *v3 = v17;
      swift_bridgeObjectRelease(v18);
      v19 = 0;
    }
    else
    {
      v19 = 1;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, v19, 1, v9);
    return sub_100006B04((uint64_t)v8, &qword_10003DFC0);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v12, a1, v9);
    v20 = swift_isUniquelyReferenced_nonNull_native(*v3);
    v24 = *v3;
    *v3 = 0x8000000000000000;
    sub_10000D428((uint64_t)v12, a2, v20);
    v21 = *v3;
    *v3 = v24;
    return swift_bridgeObjectRelease(v21);
  }
}

uint64_t sub_10000D0A4(uint64_t a1)
{
  uint64_t v1;
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
  uint64_t v15;
  uint64_t v16;
  char *v17;
  Swift::UInt32 v18;
  uint64_t *v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  void (*v23)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t, uint64_t);
  int v26;
  uint64_t *v27;
  char v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t);
  uint64_t v34;
  char *v35;
  uint64_t v36;
  _BYTE v37[24];

  v3 = type metadata accessor for Message(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v35 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_10000E354(&qword_10003E010);
  __chkstk_darwin(v6);
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_10000E354(&qword_10003DFC0);
  v10 = __chkstk_darwin(v9);
  v36 = (uint64_t)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v34 - v13;
  v15 = __chkstk_darwin(v12);
  v17 = (char *)&v34 - v16;
  v18 = Message.category.getter(v15);
  v19 = (uint64_t *)(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_messageHistory);
  swift_beginAccess(v19, v37, 32, 0);
  v20 = *v19;
  if (*(_QWORD *)(v20 + 16) && (v21 = sub_10000D54C(v18), (v22 & 1) != 0))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v17, *(_QWORD *)(v20 + 56) + *(_QWORD *)(v4 + 72) * v21, v3);
    v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
    v23(v17, 0, 1, v3);
  }
  else
  {
    v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
    v23(v17, 1, 1, v3);
  }
  swift_endAccess(v37);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v14, a1, v3);
  v23(v14, 0, 1, v3);
  v24 = (uint64_t)&v8[*(int *)(v6 + 48)];
  sub_1000047AC((uint64_t)v17, (uint64_t)v8, &qword_10003DFC0);
  sub_1000047AC((uint64_t)v14, v24, &qword_10003DFC0);
  v25 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  if (v25((uint64_t)v8, 1, v3) == 1)
  {
    sub_100006B04((uint64_t)v14, &qword_10003DFC0);
    sub_100006B04((uint64_t)v17, &qword_10003DFC0);
    v26 = v25(v24, 1, v3);
    if (v26 == 1)
      v27 = &qword_10003DFC0;
    else
      v27 = &qword_10003E010;
    if (v26 == 1)
      v28 = -1;
    else
      v28 = 0;
  }
  else
  {
    v29 = v36;
    sub_1000047AC((uint64_t)v8, v36, &qword_10003DFC0);
    if (v25(v24, 1, v3) == 1)
    {
      sub_100006B04((uint64_t)v14, &qword_10003DFC0);
      sub_100006B04((uint64_t)v17, &qword_10003DFC0);
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v29, v3);
      v28 = 0;
      v27 = &qword_10003E010;
    }
    else
    {
      v30 = v35;
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 32))(v35, v24, v3);
      v31 = sub_100006818(&qword_10003E018, (uint64_t (*)(uint64_t))&type metadata accessor for Message, (uint64_t)&protocol conformance descriptor for Message);
      v28 = dispatch thunk of static Equatable.== infix(_:_:)(v29, v30, v3, v31);
      v32 = *(void (**)(char *, uint64_t))(v4 + 8);
      v32(v30, v3);
      v27 = &qword_10003DFC0;
      sub_100006B04((uint64_t)v14, &qword_10003DFC0);
      sub_100006B04((uint64_t)v17, &qword_10003DFC0);
      v32((char *)v29, v3);
    }
  }
  sub_100006B04((uint64_t)v8, v27);
  return v28 & 1;
}

uint64_t sub_10000D428(uint64_t a1, Swift::UInt32 a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  unint64_t v20;
  char v21;
  uint64_t v22;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = sub_10000D54C(a2);
  v11 = v8[2];
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }
  else
  {
    v14 = v9;
    v15 = v8[3];
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      v16 = *v4;
      if ((v14 & 1) != 0)
      {
LABEL_8:
        v17 = v16[7];
        v18 = type metadata accessor for Message(0);
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 40))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v10, a1, v18);
      }
      return sub_10000EE18(v10, a2, a1, v16);
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_1000248B8();
      goto LABEL_7;
    }
    sub_10000F100(v13, a3 & 1);
    v20 = sub_10000D54C(a2);
    if ((v14 & 1) == (v21 & 1))
    {
      v10 = v20;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
      return sub_10000EE18(v10, a2, a1, v16);
    }
  }
  type metadata accessor for AudioEventCategory(0);
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v22);
  __break(1u);
  return result;
}

unint64_t sub_10000D54C(Swift::UInt32 a1)
{
  uint64_t v1;
  Swift::Int v3;
  _QWORD v5[9];

  Hasher.init(_seed:)(v5, *(_QWORD *)(v1 + 40));
  Hasher._combine(_:)(a1);
  v3 = Hasher._finalize()();
  return sub_10000D5A4(a1, v3);
}

unint64_t sub_10000D5A4(int a1, uint64_t a2)
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

uint64_t sub_10000D640(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char v31;
  unint64_t v32;
  uint64_t v33;
  _BOOL8 v34;
  uint64_t v35;
  char v36;
  unint64_t v37;
  char v38;
  _QWORD *v39;
  uint64_t *v40;
  uint64_t v41;
  BOOL v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  void (*v49)(char *, char *, uint64_t);
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;

  v57 = a5;
  v9 = type metadata accessor for SimpleType(0);
  v48 = *(_QWORD *)(v9 - 8);
  v10 = __chkstk_darwin(v9);
  v47 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v13 = (char *)&v44 - v12;
  v14 = sub_10000E354(&qword_10003E000);
  __chkstk_darwin(v14);
  v16 = (uint64_t *)((char *)&v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  v17 = -1 << *(_BYTE *)(a1 + 32);
  v18 = ~v17;
  v19 = *(_QWORD *)(a1 + 64);
  v20 = -v17;
  v50 = a1;
  v51 = a1 + 64;
  if (v20 < 64)
    v21 = ~(-1 << v20);
  else
    v21 = -1;
  v52 = v18;
  v53 = 0;
  v54 = v21 & v19;
  v55 = a2;
  v56 = a3;
  v46 = a1;
  swift_bridgeObjectRetain(a1);
  v45 = a3;
  swift_retain(a3);
  sub_100029C9C((uint64_t)v16);
  v22 = sub_10000E354(&qword_10003D678);
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 48))(v16, 1, v22) == 1)
  {
LABEL_5:
    swift_release(v45);
    swift_bridgeObjectRelease(v46);
    sub_100014E70(v50);
    return swift_release(v56);
  }
  v49 = *(void (**)(char *, char *, uint64_t))(v48 + 32);
  while (1)
  {
    v26 = (char *)v16 + *(int *)(v22 + 48);
    v27 = *v16;
    v28 = v16[1];
    v29 = v13;
    v49(v13, v26, v9);
    v30 = *v57;
    v32 = sub_10000D9BC(v27, v28);
    v33 = *(_QWORD *)(v30 + 16);
    v34 = (v31 & 1) == 0;
    v35 = v33 + v34;
    if (__OFADD__(v33, v34))
      break;
    v36 = v31;
    if (*(_QWORD *)(v30 + 24) >= v35)
    {
      if ((a4 & 1) != 0)
      {
        if ((v31 & 1) != 0)
          goto LABEL_7;
      }
      else
      {
        sub_10000EEA4();
        if ((v36 & 1) != 0)
          goto LABEL_7;
      }
    }
    else
    {
      sub_10000DB84(v35, a4 & 1);
      v37 = sub_10000D9BC(v27, v28);
      if ((v36 & 1) != (v38 & 1))
        goto LABEL_22;
      v32 = v37;
      if ((v36 & 1) != 0)
      {
LABEL_7:
        v25 = v47;
        v24 = v48;
        v13 = v29;
        (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v47, v29, v9);
        (*(void (**)(char *, uint64_t))(v24 + 8))(v29, v9);
        swift_bridgeObjectRelease(v28);
        (*(void (**)(unint64_t, char *, uint64_t))(v24 + 40))(*(_QWORD *)(*v57 + 56) + *(_QWORD *)(v24 + 72) * v32, v25, v9);
        goto LABEL_8;
      }
    }
    v39 = (_QWORD *)*v57;
    *(_QWORD *)(*v57 + 8 * (v32 >> 6) + 64) |= 1 << v32;
    v40 = (uint64_t *)(v39[6] + 16 * v32);
    *v40 = v27;
    v40[1] = v28;
    v13 = v29;
    v49((char *)(v39[7] + *(_QWORD *)(v48 + 72) * v32), v29, v9);
    v41 = v39[2];
    v42 = __OFADD__(v41, 1);
    v43 = v41 + 1;
    if (v42)
      goto LABEL_21;
    v39[2] = v43;
LABEL_8:
    sub_100029C9C((uint64_t)v16);
    v22 = sub_10000E354(&qword_10003D678);
    a4 = 1;
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 48))(v16, 1, v22) == 1)
      goto LABEL_5;
  }
  __break(1u);
LABEL_21:
  __break(1u);
LABEL_22:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

unint64_t sub_10000D9BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_10000DA20(a1, a2, v5);
}

unint64_t sub_10000DA20(uint64_t a1, uint64_t a2, uint64_t a3)
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

double sub_10000DB00@<D0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double result;

  v4 = (char *)a1 + *(int *)(sub_10000E354(&qword_10003DFF8) + 48);
  v5 = (char *)a2 + *(int *)(sub_10000E354(&qword_10003D678) + 48);
  v7 = *a1;
  v6 = a1[1];
  v8 = type metadata accessor for SimpleType(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v5, v4, v8);
  *a2 = v7;
  a2[1] = v6;
  *(_QWORD *)&result = swift_bridgeObjectRetain(v6).n128_u64[0];
  return result;
}

Swift::Int sub_10000DB84(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  Swift::Int result;
  int64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char v35;
  unint64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  int64_t v42;
  _QWORD *v43;
  int v44;
  char *v45;
  uint64_t v46;
  _QWORD v47[9];

  v3 = v2;
  v46 = type metadata accessor for SimpleType(0);
  v6 = *(_QWORD *)(v46 - 8);
  __chkstk_darwin();
  v45 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v3;
  if (*(_QWORD *)(*v3 + 24) > a1)
    a1 = *(_QWORD *)(*v3 + 24);
  sub_10000E354(&qword_10003D680);
  v44 = a2;
  v9 = static _DictionaryStorage.resize(original:capacity:move:)(v8, a1, a2);
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
    goto LABEL_41;
  v41 = v3;
  v11 = 1 << *(_BYTE *)(v8 + 32);
  v12 = *(_QWORD *)(v8 + 64);
  v43 = (_QWORD *)(v8 + 64);
  if (v11 < 64)
    v13 = ~(-1 << v11);
  else
    v13 = -1;
  v14 = v13 & v12;
  v42 = (unint64_t)(v11 + 63) >> 6;
  v15 = v9 + 64;
  result = swift_retain(v8);
  v17 = 0;
  while (1)
  {
    if (v14)
    {
      v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v21 = v20 | (v17 << 6);
      goto LABEL_24;
    }
    v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v42)
      goto LABEL_36;
    v23 = v43[v22];
    ++v17;
    if (!v23)
    {
      v17 = v22 + 1;
      if (v22 + 1 >= v42)
        goto LABEL_36;
      v23 = v43[v17];
      if (!v23)
        break;
    }
LABEL_23:
    v14 = (v23 - 1) & v23;
    v21 = __clz(__rbit64(v23)) + (v17 << 6);
LABEL_24:
    v25 = *(_QWORD *)(v8 + 56);
    v26 = v8;
    v27 = (uint64_t *)(*(_QWORD *)(v8 + 48) + 16 * v21);
    v29 = *v27;
    v28 = v27[1];
    v30 = *(_QWORD *)(v6 + 72);
    v31 = v25 + v30 * v21;
    if ((v44 & 1) != 0)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 32))(v45, v31, v46);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v45, v31, v46);
      swift_bridgeObjectRetain(v28);
    }
    Hasher.init(_seed:)(v47, *(_QWORD *)(v10 + 40));
    String.hash(into:)(v47, v29, v28);
    result = Hasher._finalize()();
    v32 = -1 << *(_BYTE *)(v10 + 32);
    v33 = result & ~v32;
    v34 = v33 >> 6;
    if (((-1 << v33) & ~*(_QWORD *)(v15 + 8 * (v33 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v33) & ~*(_QWORD *)(v15 + 8 * (v33 >> 6)))) | v33 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v35 = 0;
      v36 = (unint64_t)(63 - v32) >> 6;
      do
      {
        if (++v34 == v36 && (v35 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v37 = v34 == v36;
        if (v34 == v36)
          v34 = 0;
        v35 |= v37;
        v38 = *(_QWORD *)(v15 + 8 * v34);
      }
      while (v38 == -1);
      v18 = __clz(__rbit64(~v38)) + (v34 << 6);
    }
    *(_QWORD *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v10 + 48) + 16 * v18);
    *v19 = v29;
    v19[1] = v28;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v10 + 56) + v30 * v18, v45, v46);
    ++*(_QWORD *)(v10 + 16);
    v8 = v26;
  }
  v24 = v22 + 2;
  if (v24 < v42)
  {
    v23 = v43[v24];
    if (!v23)
    {
      while (1)
      {
        v17 = v24 + 1;
        if (__OFADD__(v24, 1))
          goto LABEL_43;
        if (v17 >= v42)
          goto LABEL_36;
        v23 = v43[v17];
        ++v24;
        if (v23)
          goto LABEL_23;
      }
    }
    v17 = v24;
    goto LABEL_23;
  }
LABEL_36:
  swift_release(v8);
  v3 = v41;
  if ((v44 & 1) != 0)
  {
    v39 = 1 << *(_BYTE *)(v8 + 32);
    if (v39 >= 64)
      bzero(v43, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
    else
      *v43 = -1 << v39;
    *(_QWORD *)(v8 + 16) = 0;
  }
LABEL_41:
  result = swift_release(v8);
  *v3 = v10;
  return result;
}

uint64_t sub_10000DEEC(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, unint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  unint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  int64_t v37;
  uint64_t *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  int64_t v45;

  v33 = a2;
  v43 = a4;
  v34 = a1;
  v42 = sub_10000E354(&qword_10003DFF8);
  __chkstk_darwin(v42);
  v38 = (uint64_t *)((char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = type metadata accessor for SimpleType(0);
  v7 = *(_QWORD *)(v6 - 8);
  v40 = v6;
  v41 = v7;
  result = __chkstk_darwin(v6);
  v39 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = 0;
  v44 = (_QWORD *)a3;
  v11 = *(_QWORD *)(a3 + 64);
  v35 = 0;
  v36 = a3 + 64;
  v12 = 1 << *(_BYTE *)(a3 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & v11;
  v37 = (unint64_t)(v12 + 63) >> 6;
  v16 = v40;
  v15 = v41;
  v18 = v38;
  v17 = v39;
  while (1)
  {
    if (v14)
    {
      v19 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v45 = v10;
      v20 = v19 | (v10 << 6);
      goto LABEL_5;
    }
    v27 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v27 >= v37)
      return sub_10000E89C(v34, v33, v35, v44);
    v28 = *(_QWORD *)(v36 + 8 * v27);
    v29 = v10 + 1;
    if (!v28)
    {
      v29 = v10 + 2;
      if (v10 + 2 >= v37)
        return sub_10000E89C(v34, v33, v35, v44);
      v28 = *(_QWORD *)(v36 + 8 * v29);
      if (!v28)
      {
        v29 = v10 + 3;
        if (v10 + 3 >= v37)
          return sub_10000E89C(v34, v33, v35, v44);
        v28 = *(_QWORD *)(v36 + 8 * v29);
        if (!v28)
          break;
      }
    }
LABEL_20:
    v14 = (v28 - 1) & v28;
    v45 = v29;
    v20 = __clz(__rbit64(v28)) + (v29 << 6);
LABEL_5:
    v21 = (uint64_t *)(v44[6] + 16 * v20);
    v22 = *v21;
    v23 = v21[1];
    v24 = *(void (**)(char *, unint64_t, uint64_t))(v15 + 16);
    v24(v17, v44[7] + *(_QWORD *)(v15 + 72) * v20, v16);
    *v18 = v22;
    v18[1] = v23;
    v24((char *)v18 + *(int *)(v42 + 48), (unint64_t)v17, v16);
    v25 = swift_bridgeObjectRetain_n(v23, 2);
    v26 = Config.neededPreviousFields.getter(v25);
    LOBYTE(v22) = sub_10000E1D8(v22, v23, v26);
    swift_bridgeObjectRelease(v26);
    sub_100006B04((uint64_t)v18, &qword_10003DFF8);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v16);
    result = swift_bridgeObjectRelease(v23);
    v10 = v45;
    if ((v22 & 1) != 0)
    {
      *(unint64_t *)((char *)v34 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
      if (__OFADD__(v35++, 1))
      {
        __break(1u);
        return sub_10000E89C(v34, v33, v35, v44);
      }
    }
  }
  v30 = v10 + 4;
  if (v10 + 4 >= v37)
    return sub_10000E89C(v34, v33, v35, v44);
  v28 = *(_QWORD *)(v36 + 8 * v30);
  if (v28)
  {
    v29 = v10 + 4;
    goto LABEL_20;
  }
  while (1)
  {
    v29 = v30 + 1;
    if (__OFADD__(v30, 1))
      break;
    if (v29 >= v37)
      return sub_10000E89C(v34, v33, v35, v44);
    v28 = *(_QWORD *)(v36 + 8 * v29);
    ++v30;
    if (v28)
      goto LABEL_20;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_10000E1D8(uint64_t a1, uint64_t a2, uint64_t a3)
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
  _QWORD v18[9];

  if (*(_QWORD *)(a3 + 16))
  {
    Hasher.init(_seed:)(v18, *(_QWORD *)(a3 + 40));
    String.hash(into:)(v18, a1, a2);
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

uint64_t sub_10000E30C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000E354(&qword_10003D808);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000E354(uint64_t *a1)
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

uint64_t sub_10000E394(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10000E354(&qword_10003D808);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000E3D4(uint64_t a1, char a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  id v15;
  uint64_t result;
  uint64_t *v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34[3];

  v5 = v4;
  v10 = type metadata accessor for DispatchPredicate(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin();
  v13 = (uint64_t *)((char *)&v34[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = *(void **)(*(_QWORD *)(v5 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_server)
                 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  *v13 = v14;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v11 + 104))(v13, enum case for DispatchPredicate.onQueue(_:), v10);
  v15 = v14;
  LOBYTE(v14) = _dispatchPreconditionTest(_:)(v13);
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v11 + 8))(v13, v10);
  if ((v14 & 1) != 0)
  {
    v17 = (uint64_t *)(v5 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID);
    swift_beginAccess(v5 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID, v34, 32, 0);
    v18 = *v17;
    if (*(_QWORD *)(v18 + 16) && (v19 = sub_10000E860(a1), (v20 & 1) != 0))
    {
      v21 = *(_QWORD *)(*(_QWORD *)(v18 + 56) + 8 * v19);
      swift_endAccess(v34);
      swift_retain(v21);
    }
    else
    {
      swift_endAccess(v34);
      if ((a2 & 1) != 0 || (v22 = sub_10001D980(a1, v5)) == 0)
      {
        v28 = swift_bridgeObjectRetain_n(a4, 2);
        v29 = Logger.logObject.getter(v28);
        v30 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v29, v30))
        {
          v31 = swift_slowAlloc(22, -1);
          v32 = swift_slowAlloc(32, -1);
          v33 = a1;
          v34[0] = v32;
          *(_DWORD *)v31 = 134218243;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, v34, v31 + 4, v31 + 12);
          *(_WORD *)(v31 + 12) = 2081;
          swift_bridgeObjectRetain(a4);
          v33 = sub_10000A7E4(a3, a4, v34);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, v34, v31 + 14, v31 + 22);
          swift_bridgeObjectRelease_n(a4, 3);
          _os_log_impl((void *)&_mh_execute_header, v29, v30, "Session not found. { reporterID=%lld, action=%{private}s }", (uint8_t *)v31, 0x16u);
          swift_arrayDestroy(v32, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v32, -1, -1);
          swift_slowDealloc(v31, -1, -1);
        }
        else
        {
          swift_bridgeObjectRelease_n(a4, 2);
        }

        return 0;
      }
      else
      {
        v21 = v22;
        v23 = swift_bridgeObjectRetain_n(a4, 2);
        v24 = Logger.logObject.getter(v23);
        v25 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v24, v25))
        {
          v26 = swift_slowAlloc(22, -1);
          v27 = swift_slowAlloc(32, -1);
          v33 = a1;
          v34[0] = v27;
          *(_DWORD *)v26 = 134218243;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, v34, v26 + 4, v26 + 12);
          *(_WORD *)(v26 + 12) = 2081;
          swift_bridgeObjectRetain(a4);
          v33 = sub_10000A7E4(a3, a4, v34);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, v34, v26 + 14, v26 + 22);
          swift_bridgeObjectRelease_n(a4, 3);
          _os_log_impl((void *)&_mh_execute_header, v24, v25, "Found session on another instance. { reporterID=%lld, action=%{private}s }", (uint8_t *)v26, 0x16u);
          swift_arrayDestroy(v27, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v27, -1, -1);
          swift_slowDealloc(v26, -1, -1);
        }
        else
        {
          swift_bridgeObjectRelease_n(a4, 2);
        }

      }
    }
    return v21;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_10000E7C4(uint64_t a1, uint64_t a2)
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

unint64_t sub_10000E860(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = static Hasher._hash(seed:_:)(*(_QWORD *)(v1 + 40), a1);
  return sub_10000E7C4(a1, v3);
}

uint64_t sub_10000E890()
{
  uint64_t v0;

  return *(unsigned __int8 *)(*(_QWORD *)v0 + 40);
}

Swift::Int sub_10000E89C(unint64_t *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  Swift::Int result;
  Swift::Int v14;
  unint64_t v15;
  uint64_t v16;
  Swift::Int v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, char *, uint64_t);
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char v37;
  unint64_t v38;
  BOOL v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v43;
  unint64_t *v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  _QWORD v52[9];

  v8 = type metadata accessor for SimpleType(0);
  v49 = *(_QWORD *)(v8 - 8);
  v9 = __chkstk_darwin(v8);
  v51 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v9);
  v48 = (char *)&v43 - v12;
  if (!a3)
    return (Swift::Int)&_swiftEmptyDictionarySingleton;
  if (a4[2] == a3)
  {
    swift_retain(a4);
    return (Swift::Int)a4;
  }
  v47 = v11;
  sub_10000E354(&qword_10003D680);
  result = static _DictionaryStorage.allocate(capacity:)(a3);
  v14 = result;
  v44 = a1;
  v45 = a2;
  if (a2 < 1)
    v15 = 0;
  else
    v15 = *a1;
  v16 = 0;
  v17 = result + 64;
  v18 = v47;
  v19 = v48;
  v46 = a4;
  while (1)
  {
    if (v15)
    {
      v20 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v50 = v16;
      v21 = v20 | (v16 << 6);
    }
    else
    {
      v22 = v16 + 1;
      if (__OFADD__(v16, 1))
        goto LABEL_40;
      if (v22 >= v45)
        return v14;
      v23 = v44[v22];
      v24 = v16 + 1;
      if (!v23)
      {
        v24 = v16 + 2;
        if (v16 + 2 >= v45)
          return v14;
        v23 = v44[v24];
        if (!v23)
        {
          v24 = v16 + 3;
          if (v16 + 3 >= v45)
            return v14;
          v23 = v44[v24];
          if (!v23)
          {
            v25 = v16 + 4;
            if (v16 + 4 >= v45)
              return v14;
            v23 = v44[v25];
            if (!v23)
            {
              while (1)
              {
                v24 = v25 + 1;
                if (__OFADD__(v25, 1))
                  goto LABEL_41;
                if (v24 >= v45)
                  return v14;
                v23 = v44[v24];
                ++v25;
                if (v23)
                  goto LABEL_24;
              }
            }
            v24 = v16 + 4;
          }
        }
      }
LABEL_24:
      v15 = (v23 - 1) & v23;
      v50 = v24;
      v21 = __clz(__rbit64(v23)) + (v24 << 6);
    }
    v26 = a4[7];
    v27 = (uint64_t *)(a4[6] + 16 * v21);
    v28 = *v27;
    v29 = v27[1];
    v30 = v49;
    v31 = *(_QWORD *)(v49 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v49 + 16))(v19, v26 + v31 * v21, v18);
    v32 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
    v32(v51, v19, v18);
    Hasher.init(_seed:)(v52, *(_QWORD *)(v14 + 40));
    swift_bridgeObjectRetain(v29);
    String.hash(into:)(v52, v28, v29);
    result = Hasher._finalize()();
    v33 = -1 << *(_BYTE *)(v14 + 32);
    v34 = result & ~v33;
    v35 = v34 >> 6;
    if (((-1 << v34) & ~*(_QWORD *)(v17 + 8 * (v34 >> 6))) != 0)
    {
      v36 = __clz(__rbit64((-1 << v34) & ~*(_QWORD *)(v17 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
      v18 = v47;
    }
    else
    {
      v37 = 0;
      v38 = (unint64_t)(63 - v33) >> 6;
      v18 = v47;
      do
      {
        if (++v35 == v38 && (v37 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v39 = v35 == v38;
        if (v35 == v38)
          v35 = 0;
        v37 |= v39;
        v40 = *(_QWORD *)(v17 + 8 * v35);
      }
      while (v40 == -1);
      v36 = __clz(__rbit64(~v40)) + (v35 << 6);
    }
    *(_QWORD *)(v17 + ((v36 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v36;
    v41 = (_QWORD *)(*(_QWORD *)(v14 + 48) + 16 * v36);
    *v41 = v28;
    v41[1] = v29;
    result = ((uint64_t (*)(unint64_t, char *, uint64_t))v32)(*(_QWORD *)(v14 + 56) + v36 * v31, v51, v18);
    ++*(_QWORD *)(v14 + 16);
    if (__OFSUB__(a3--, 1))
      break;
    a4 = v46;
    v16 = v50;
    if (!a3)
      return v14;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_10000EBE4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v8;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(a2);
  v8 = a2;
  sub_10000D640(a1, (uint64_t)sub_10000DB00, 0, isUniquelyReferenced_nonNull_native, &v8);
  v6 = v8;
  swift_bridgeObjectRelease(0x8000000000000000);
  if (v2)
    swift_bridgeObjectRelease(v6);
  return v6;
}

uint64_t sub_10000EC60()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v13[24];

  v1 = sub_10000E354(&qword_10003DA70);
  __chkstk_darwin(v1);
  v3 = (uint64_t *)&v13[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v4 = type metadata accessor for Keys(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v5 + 104))(v7, enum case for Keys.applicationName(_:), v4);
  swift_beginAccess(v0 + 9, v13, 32, 0);
  Dictionary<>.subscript.getter(v7, v0[9]);
  v8 = type metadata accessor for SimpleType(0);
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v9 + 48))(v3, 1, v8) == 1)
  {
    sub_100006B04((uint64_t)v3, &qword_10003DA70);
LABEL_6:
    swift_endAccess(v13);
    (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
    v10 = v0[4];
    swift_bridgeObjectRetain(v0[5]);
    return v10;
  }
  if ((*(unsigned int (**)(uint64_t *, uint64_t))(v9 + 88))(v3, v8) != enum case for SimpleType.string(_:))
  {
    (*(void (**)(uint64_t *, uint64_t))(v9 + 8))(v3, v8);
    goto LABEL_6;
  }
  (*(void (**)(uint64_t *, uint64_t))(v9 + 96))(v3, v8);
  v10 = *v3;
  swift_endAccess(v13);
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  return v10;
}

uint64_t sub_10000EE18(unint64_t a1, int a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_DWORD *)(a4[6] + 4 * a1) = a2;
  v7 = a4[7];
  v8 = type metadata accessor for Message(0);
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

void *sub_10000EEA4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;

  v34 = type metadata accessor for SimpleType(0);
  v1 = *(_QWORD *)(v34 - 8);
  __chkstk_darwin();
  v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000E354(&qword_10003D680);
  v31 = v0;
  v4 = *v0;
  v5 = static _DictionaryStorage.copy(original:)(*v0);
  v6 = *(_QWORD *)(v4 + 16);
  v35 = v5;
  if (!v6)
  {
    result = (void *)swift_release(v4);
    v29 = v35;
    v28 = v31;
LABEL_28:
    *v28 = v29;
    return result;
  }
  v7 = v5;
  result = (void *)(v5 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    v7 = v35;
  }
  v32 = v4 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v4 + 16);
  v12 = 1 << *(_BYTE *)(v4 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v4 + 64);
  v33 = (unint64_t)(v12 + 63) >> 6;
  v15 = v34;
  while (1)
  {
    if (v14)
    {
      v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }
    v25 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v25 >= v33)
      goto LABEL_26;
    v26 = *(_QWORD *)(v32 + 8 * v25);
    ++v11;
    if (!v26)
    {
      v11 = v25 + 1;
      if (v25 + 1 >= v33)
        goto LABEL_26;
      v26 = *(_QWORD *)(v32 + 8 * v11);
      if (!v26)
        break;
    }
LABEL_25:
    v14 = (v26 - 1) & v26;
    v17 = __clz(__rbit64(v26)) + (v11 << 6);
LABEL_12:
    v18 = 16 * v17;
    v19 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v17);
    v21 = *v19;
    v20 = v19[1];
    v22 = *(_QWORD *)(v1 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(_QWORD *)(v4 + 56) + v22, v15);
    v23 = v35;
    v24 = (_QWORD *)(*(_QWORD *)(v35 + 48) + v18);
    *v24 = v21;
    v24[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(_QWORD *)(v23 + 56) + v22, v3, v15);
    result = (void *)swift_bridgeObjectRetain(v20);
  }
  v27 = v25 + 2;
  if (v27 >= v33)
  {
LABEL_26:
    result = (void *)swift_release(v4);
    v28 = v31;
    v29 = v35;
    goto LABEL_28;
  }
  v26 = *(_QWORD *)(v32 + 8 * v27);
  if (v26)
  {
    v11 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v11 >= v33)
      goto LABEL_26;
    v26 = *(_QWORD *)(v32 + 8 * v11);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

Swift::Int sub_10000F100(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  Swift::Int *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  Swift::Int v9;
  Swift::Int result;
  Swift::Int v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  Swift::Int v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  Swift::UInt32 v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  int v37;
  int64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42[9];

  v3 = v2;
  v41 = type metadata accessor for Message(0);
  v6 = *(_QWORD *)(v41 - 8);
  __chkstk_darwin(v41);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v3;
  if (*(_QWORD *)(*v3 + 24) > a1)
    a1 = *(_QWORD *)(*v3 + 24);
  sub_10000E354(&qword_10003D6A8);
  result = static _DictionaryStorage.resize(original:capacity:move:)(v9, a1, a2);
  v11 = result;
  if (*(_QWORD *)(v9 + 16))
  {
    v36 = v3;
    v12 = 0;
    v13 = *(_QWORD *)(v9 + 64);
    v39 = (_QWORD *)(v9 + 64);
    v14 = 1 << *(_BYTE *)(v9 + 32);
    if (v14 < 64)
      v15 = ~(-1 << v14);
    else
      v15 = -1;
    v16 = v15 & v13;
    v38 = (unint64_t)(v14 + 63) >> 6;
    v17 = result + 64;
    v37 = a2;
    v18 = 16;
    if ((a2 & 1) != 0)
      v18 = 32;
    v40 = v18;
    while (1)
    {
      if (v16)
      {
        v20 = __clz(__rbit64(v16));
        v16 &= v16 - 1;
        v21 = v20 | (v12 << 6);
      }
      else
      {
        v22 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
          return result;
        }
        result = (Swift::Int)v39;
        if (v22 >= v38)
          goto LABEL_35;
        v23 = v39[v22];
        ++v12;
        if (!v23)
        {
          v12 = v22 + 1;
          if (v22 + 1 >= v38)
            goto LABEL_35;
          v23 = v39[v12];
          if (!v23)
          {
            v24 = v22 + 2;
            if (v24 >= v38)
            {
LABEL_35:
              if ((v37 & 1) == 0)
              {
                result = swift_release(v9);
                v3 = v36;
                goto LABEL_42;
              }
              v34 = 1 << *(_BYTE *)(v9 + 32);
              if (v34 >= 64)
                bzero(v39, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v39 = -1 << v34;
              v3 = v36;
              *(_QWORD *)(v9 + 16) = 0;
              break;
            }
            v23 = v39[v24];
            if (!v23)
            {
              while (1)
              {
                v12 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_44;
                if (v12 >= v38)
                  goto LABEL_35;
                v23 = v39[v12];
                ++v24;
                if (v23)
                  goto LABEL_25;
              }
            }
            v12 = v24;
          }
        }
LABEL_25:
        v16 = (v23 - 1) & v23;
        v21 = __clz(__rbit64(v23)) + (v12 << 6);
      }
      v25 = *(_DWORD *)(*(_QWORD *)(v9 + 48) + 4 * v21);
      v26 = *(_QWORD *)(v6 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + v40))(v8, *(_QWORD *)(v9 + 56) + v26 * v21, v41);
      Hasher.init(_seed:)(v42, *(_QWORD *)(v11 + 40));
      Hasher._combine(_:)(v25);
      result = Hasher._finalize()();
      v27 = -1 << *(_BYTE *)(v11 + 32);
      v28 = result & ~v27;
      v29 = v28 >> 6;
      if (((-1 << v28) & ~*(_QWORD *)(v17 + 8 * (v28 >> 6))) != 0)
      {
        v19 = __clz(__rbit64((-1 << v28) & ~*(_QWORD *)(v17 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v30 = 0;
        v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_43;
          }
          v32 = v29 == v31;
          if (v29 == v31)
            v29 = 0;
          v30 |= v32;
          v33 = *(_QWORD *)(v17 + 8 * v29);
        }
        while (v33 == -1);
        v19 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(_QWORD *)(v17 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      *(_DWORD *)(*(_QWORD *)(v11 + 48) + 4 * v19) = v25;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 56) + v26 * v19, v8, v41);
      ++*(_QWORD *)(v11 + 16);
    }
  }
  result = swift_release(v9);
LABEL_42:
  *v3 = v11;
  return result;
}

uint64_t sub_10000F43C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000F444(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000F44C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000F454(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000F45C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000F464(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000F474(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000F484(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000F494(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000F4A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000F4BC()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)v0 + 32);
}

uint64_t sub_10000F4FC(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_100003A30(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

char *sub_10000F518(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_100008F44(a1, a2, a3, a4, &qword_10003DFD0, &qword_10003DDF8);
}

void sub_10000F52C(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Swift::Int v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v4 = v3;
  v7 = *(_QWORD *)(*v3 + 16);
  v8 = *(_QWORD *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0)
    goto LABEL_14;
  v9 = v7 + 1;
  if ((a3 & 1) != 0)
  {
    sub_10001F504(v9);
  }
  else
  {
    if (v8 > v7)
    {
      sub_10001FA98();
      goto LABEL_14;
    }
    sub_10001FF10(v9);
  }
  v10 = *v3;
  v11 = NSObject._rawHashValue(seed:)(*(_QWORD *)(*v3 + 40));
  v12 = -1 << *(_BYTE *)(v10 + 32);
  a2 = v11 & ~v12;
  if (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v13 = sub_10000F8F8(0, &qword_10003DBB0, NSXPCConnection_ptr);
    v14 = *(id *)(*(_QWORD *)(v10 + 48) + 8 * a2);
    v15 = static NSObject.== infix(_:_:)();

    if ((v15 & 1) != 0)
    {
LABEL_13:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v13);
      __break(1u);
    }
    else
    {
      v16 = ~v12;
      while (1)
      {
        a2 = (a2 + 1) & v16;
        if (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v17 = *(id *)(*(_QWORD *)(v10 + 48) + 8 * a2);
        v18 = static NSObject.== infix(_:_:)();

        if ((v18 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v19 = *v4;
  *(_QWORD *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v19 + 48) + 8 * a2) = a1;
  v20 = *(_QWORD *)(v19 + 16);
  v21 = __OFADD__(v20, 1);
  v22 = v20 + 1;
  if (v21)
    __break(1u);
  else
    *(_QWORD *)(v19 + 16) = v22;
}

uint64_t sub_10000F6B0(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  _QWORD v26[9];

  v4 = v3;
  v6 = result;
  v7 = *(_QWORD *)(*v3 + 16);
  v8 = *(_QWORD *)(*v3 + 24);
  if (v8 <= v7 || (a3 & 1) == 0)
  {
    v9 = v7 + 1;
    if ((a3 & 1) != 0)
    {
      sub_10001F204(v9);
    }
    else
    {
      if (v8 > v7)
      {
        result = (uint64_t)sub_10001F8F0();
        goto LABEL_18;
      }
      sub_10001FC40(v9);
    }
    v10 = *v3;
    Hasher.init(_seed:)(v26, *(_QWORD *)(*v3 + 40));
    v11 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
    Hasher._combine(_:)(*(_DWORD *)(v6 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid));
    v12 = *(_QWORD *)(v6 + 24);
    v13 = *(_QWORD *)(v6 + 32);
    swift_bridgeObjectRetain(v13);
    String.hash(into:)(v26, v12, v13);
    swift_bridgeObjectRelease(v13);
    v3 = v26;
    result = Hasher._finalize()();
    v14 = -1 << *(_BYTE *)(v10 + 32);
    a2 = result & ~v14;
    v15 = v10 + 56;
    if (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
    {
      v16 = ~v14;
      result = type metadata accessor for ClientServerInstance(0);
      v3 = (uint64_t *)result;
      v17 = *(_QWORD *)(v10 + 48);
      v18 = *(_DWORD *)(v6 + v11);
      v19 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
      do
      {
        v20 = *(_QWORD *)(v17 + 8 * a2);
        if (*(_DWORD *)(v20 + v19) == v18)
        {
          if (*(_QWORD *)(v20 + 24) == *(_QWORD *)(v6 + 24) && *(_QWORD *)(v20 + 32) == *(_QWORD *)(v6 + 32))
            goto LABEL_21;
          result = _stringCompareWithSmolCheck(_:_:expecting:)();
          if ((result & 1) != 0)
            goto LABEL_21;
          v19 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
        }
        a2 = (a2 + 1) & v16;
      }
      while (((*(_QWORD *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
    }
  }
LABEL_18:
  v22 = *v4;
  *(_QWORD *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v22 + 48) + 8 * a2) = v6;
  v23 = *(_QWORD *)(v22 + 16);
  v24 = __OFADD__(v23, 1);
  v25 = v23 + 1;
  if (v24)
  {
    __break(1u);
LABEL_21:
    result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v3);
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v22 + 16) = v25;
  }
  return result;
}

uint64_t sub_10000F870(uint64_t a1)
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

uint64_t sub_10000F8F8(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_10000F930(uint64_t a1)
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

void sub_10000F9BC()
{
  uint64_t v0;

  sub_10000327C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t type metadata accessor for ClientServerInstance(uint64_t a1)
{
  uint64_t result;

  result = qword_10003D728;
  if (!qword_10003D728)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ClientServerInstance);
  return result;
}

uint64_t sub_10000FA04()
{
  uint64_t v0;

  return sub_1000040DC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t type metadata accessor for NonOwningSession()
{
  return objc_opt_self(_TtC15audioanalyticsd16NonOwningSession);
}

uint64_t sub_10000FA48()
{
  return sub_100003F0C();
}

uint64_t sub_10000FA68()
{
  uint64_t v0;

  return swift_retain(*(_QWORD *)(*(_QWORD *)v0 + 48));
}

uint64_t sub_10000FA74(uint64_t a1)
{
  swift_bridgeObjectRetain(*(_QWORD *)(a1 + 48));
  return a1;
}

int main(int argc, const char **argv, const char **envp)
{
  id v3;

  v3 = objc_allocWithZone((Class)type metadata accessor for Server(0));
  qword_10003E318 = (uint64_t)sub_100019D38(0);
  dispatch_main();
}

unint64_t sub_10000FACC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t result;
  char v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = sub_10000E354(&qword_10003D6B0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
  {
    v8 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    v25 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v25);
    return (unint64_t)v8;
  }
  sub_10000E354(&qword_10003D6B8);
  v7 = static _DictionaryStorage.allocate(capacity:)(v6);
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
    goto LABEL_9;
  v10 = (uint64_t)&v5[*(int *)(v2 + 48)];
  v11 = v7 + 64;
  v12 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v27 = a1;
  v13 = a1 + v12;
  v14 = *(_QWORD *)(v3 + 72);
  swift_retain(v7);
  while (1)
  {
    sub_1000047AC(v13, (uint64_t)v5, &qword_10003D6B0);
    result = sub_10002326C((uint64_t)v5);
    if ((v16 & 1) != 0)
      break;
    v17 = result;
    *(_QWORD *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v18 = v8[6];
    v19 = type metadata accessor for FeatureInfo(0);
    sub_10001059C((uint64_t)v5, v18 + *(_QWORD *)(*(_QWORD *)(v19 - 8) + 72) * v17, type metadata accessor for FeatureInfo);
    v20 = v8[7];
    v21 = type metadata accessor for FeatureState(0);
    result = sub_10001059C(v10, v20 + *(_QWORD *)(*(_QWORD *)(v21 - 8) + 72) * v17, type metadata accessor for FeatureState);
    v22 = v8[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (v23)
      goto LABEL_12;
    v8[2] = v24;
    v13 += v14;
    if (!--v9)
    {
      swift_release(v8);
      v25 = v27;
      goto LABEL_10;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_10000FC84(uint64_t a1)
{
  return sub_10000FDBC(a1, &qword_10003D698);
}

unint64_t sub_10000FC90(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t result;
  char v12;
  uint64_t *v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000E354(&qword_10003D690);
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
  v6 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v7 = *(v6 - 3);
    v8 = *(v6 - 2);
    v10 = *(v6 - 1);
    v9 = *v6;
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v9);
    result = sub_10000D9BC(v7, v8);
    if ((v12 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v13 = (uint64_t *)(v4[6] + 16 * result);
    *v13 = v7;
    v13[1] = v8;
    v14 = (_QWORD *)(v4[7] + 16 * result);
    *v14 = v10;
    v14[1] = v9;
    v15 = v4[2];
    v16 = __OFADD__(v15, 1);
    v17 = v15 + 1;
    if (v16)
      goto LABEL_11;
    v6 += 4;
    v4[2] = v17;
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

unint64_t sub_10000FDB0(uint64_t a1)
{
  return sub_10000FDBC(a1, &qword_10003D688);
}

unint64_t sub_10000FDBC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  void **v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  unint64_t result;
  char v13;
  uint64_t *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
    v5 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000E354(a2);
  v4 = static _DictionaryStorage.allocate(capacity:)(v3);
  v5 = (_QWORD *)v4;
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v5;
  }
  swift_retain(v4);
  v7 = (void **)(a1 + 48);
  while (1)
  {
    v8 = (uint64_t)*(v7 - 2);
    v9 = (uint64_t)*(v7 - 1);
    v10 = *v7;
    swift_bridgeObjectRetain(v9);
    v11 = v10;
    result = sub_10000D9BC(v8, v9);
    if ((v13 & 1) != 0)
      break;
    *(_QWORD *)((char *)v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v14 = (uint64_t *)(v5[6] + 16 * result);
    *v14 = v8;
    v14[1] = v9;
    *(_QWORD *)(v5[7] + 8 * result) = v11;
    v15 = v5[2];
    v16 = __OFADD__(v15, 1);
    v17 = v15 + 1;
    if (v16)
      goto LABEL_11;
    v5[2] = v17;
    v7 += 3;
    if (!--v6)
    {
      swift_release(v5);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t variable initialization expression of MobileAssetsHandler.downloadedCallback()
{
  return 0;
}

id variable initialization expression of MobileAssetsHandler.downloadOptions()
{
  id v0;

  v0 = objc_msgSend(objc_allocWithZone((Class)MADownloadOptions), "init");
  objc_msgSend(v0, "setAllowsCellularAccess:", 1);
  objc_msgSend(v0, "setRequiresPowerPluggedIn:", 1);
  objc_msgSend(v0, "setCanUseLocalCacheServer:", 1);
  if (qword_10003D610 != -1)
    swift_once(&qword_10003D610, sub_100017B44);
  objc_msgSend(v0, "setTimeoutIntervalForResource:", qword_10003D828);
  return v0;
}

unint64_t variable initialization expression of MobileAssetsHandler.assetType()
{
  return 0xD000000000000024;
}

unint64_t variable initialization expression of MobileAssetsHandler.xpcActivityRefreshID()
{
  return 0xD000000000000028;
}

uint64_t variable initialization expression of SystemMonitor.currentFeatureStates()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t result;

  v0 = sub_10000FACC((uint64_t)_swiftEmptyArrayStorage);
  v1 = sub_10000E354(&qword_10003D638);
  result = swift_allocObject(v1, 28, 7);
  *(_DWORD *)(result + 24) = 0;
  *(_QWORD *)(result + 16) = v0;
  return result;
}

uint64_t variable initialization expression of SystemMonitor.notificationQueue()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  _QWORD *v15;

  v0 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v0);
  v2 = (char *)&v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100009F10();
  static DispatchQoS.default.getter();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v3);
  v15 = _swiftEmptyArrayStorage;
  v10 = sub_100006818((unint64_t *)&unk_10003DBF0, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  v11 = sub_10000E354(&qword_10003D648);
  v12 = sub_1000101AC();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v15, v11, v12, v0, v10);
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD00000000000002FLL, 0x8000000100032940, v9, v2, v6, 0);
}

unint64_t sub_1000101AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003DC00;
  if (!qword_10003DC00)
  {
    v1 = sub_1000101F8(&qword_10003D648);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10003DC00);
  }
  return result;
}

uint64_t sub_1000101F8(uint64_t *a1)
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

void type metadata accessor for AudioEventCategory(uint64_t a1)
{
  sub_100010608(a1, &qword_10003D650, (uint64_t)&unk_100039150);
}

void type metadata accessor for AudioServiceType(uint64_t a1)
{
  sub_100010608(a1, &qword_10003D658, (uint64_t)&unk_100039170);
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_100010608(a1, &qword_10003D660, (uint64_t)&unk_100039190);
}

uint64_t sub_10001027C()
{
  return sub_100006818(&qword_10003D668, (uint64_t (*)(uint64_t))type metadata accessor for AudioEventCategory, (uint64_t)&unk_1000319C0);
}

void sub_1000102A8(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

_QWORD *sub_1000102B4@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

_WORD *sub_1000102C4@<X0>(_WORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_WORD *)a2 = *result;
  *(_BYTE *)(a2 + 2) = 0;
  return result;
}

void sub_1000102D4(_WORD *a1@<X8>)
{
  _WORD *v1;

  *a1 = *v1;
}

_DWORD *sub_1000102E0@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void sub_1000102F0(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

Swift::Int sub_1000102FC()
{
  Swift::UInt32 *v0;
  Swift::UInt32 v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100010340()
{
  Swift::UInt32 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100010368(uint64_t a1)
{
  Swift::UInt32 *v1;
  Swift::UInt32 v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

Swift::Int sub_1000103A8()
{
  Swift::UInt16 *v0;
  Swift::UInt16 v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_1000103EC()
{
  Swift::UInt16 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100010414(uint64_t a1)
{
  Swift::UInt16 *v1;
  Swift::UInt16 v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

BOOL sub_100010454(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

BOOL sub_100010468(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_10001047C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  sub_10000E354(&qword_10003D670);
  v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v1);
  v4 = *(unsigned int *)(a1 + 32);
  v5 = *(unsigned __int16 *)(a1 + 36);
  v6 = *(_QWORD *)(a1 + 40);
  result = sub_1000233F8(v4 | (v5 << 32));
  if ((v8 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_retain(v6);
    return (unint64_t)v3;
  }
  v9 = (uint64_t *)(a1 + 56);
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = v3[6] + 8 * result;
    *(_DWORD *)v10 = v4;
    *(_WORD *)(v10 + 4) = v5;
    *(_QWORD *)(v3[7] + 8 * result) = v6;
    v11 = v3[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      break;
    v3[2] = v13;
    if (!--v1)
      goto LABEL_8;
    v14 = v9 + 2;
    v4 = *((unsigned int *)v9 - 2);
    v5 = *((unsigned __int16 *)v9 - 2);
    v15 = *v9;
    swift_retain(v6);
    result = sub_1000233F8(v4 | (v5 << 32));
    v9 = v14;
    v6 = v15;
    if ((v16 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001059C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void type metadata accessor for MADownloadResult(uint64_t a1)
{
  sub_100010608(a1, &qword_10003D6C0, (uint64_t)&unk_1000391B8);
}

void type metadata accessor for AudioEventType(uint64_t a1)
{
  sub_100010608(a1, &qword_10003D6C8, (uint64_t)&unk_1000391D8);
}

void sub_100010608(uint64_t a1, unint64_t *a2, uint64_t a3)
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

uint64_t sub_10001064C()
{
  return sub_100006818(&qword_10003D6D0, (uint64_t (*)(uint64_t))type metadata accessor for AudioEventType, (uint64_t)&unk_100031A94);
}

uint64_t sub_100010688(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t Strong;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  _BYTE v24[24];

  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = &v24[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  a1 += 16;
  swift_beginAccess(a1, v24, 0, 0);
  Strong = swift_weakLoadStrong(a1);
  if (Strong)
  {
    v11 = Strong;
    *(double *)(Strong + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) = *(double *)(Strong + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) + 1.0;
    v12 = Logger.logObject.getter(Strong);
    v13 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc(12, -1);
      *(_DWORD *)v14 = 134217984;
      v23 = a2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, v24, v14 + 4, v14 + 12);
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "getServiceName() called. { reporterID=%lld }", v14, 0xCu);
      swift_slowDealloc(v14, -1, -1);
    }

    v15 = sub_10000E3D4(a2, 0, 0x4E65636976726573, 0xEB00000000656D61);
    if (!v15 || (v16 = *(unsigned __int16 *)(v15 + 64), swift_release(v15), (_DWORD)v16 == 0xFFFF))
    {
      v17 = static Utilities.generateError(with:code:)(0xD00000000000002DLL, 0x8000000100032A40, -1);
      v16 = 0xFFFFLL;
    }
    else
    {
      v17 = 0;
    }
    a3(v17, v16);
    swift_errorRelease(v17);
    return swift_release(v11);
  }
  else
  {
    v19 = static Logger.service.getter(0);
    v20 = Logger.logObject.getter(v19);
    v21 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "ClientServerInstance is gone. { action=getServiceName }", v22, 2u);
      swift_slowDealloc(v22, -1, -1);
    }

    return (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
  }
}

void sub_10001099C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  id v5;

  if (a1)
    v4 = _convertErrorToNSError(_:)();
  else
    v4 = 0;
  v5 = (id)v4;
  (*(void (**)(uint64_t))(a3 + 16))(a3);

}

uint64_t sub_1000109F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  uint64_t v18;
  _QWORD *v19;
  void *v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD aBlock[5];
  _QWORD *v35;

  v28 = a5;
  v29 = a6;
  v11 = type metadata accessor for DispatchWorkItemFlags(0);
  v32 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for DispatchQoS(0);
  v30 = *(_QWORD *)(v14 - 8);
  v31 = v14;
  __chkstk_darwin(v14);
  v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *(void **)(*(_QWORD *)(v6 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_server)
                 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  v18 = swift_allocObject(&unk_1000392C8, 24, 7);
  swift_weakInit(v18 + 16, v6);
  v19 = (_QWORD *)swift_allocObject(a4, 48, 7);
  v19[2] = v18;
  v19[3] = a1;
  v19[4] = a2;
  v19[5] = a3;
  aBlock[4] = v28;
  v35 = v19;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006CEC;
  aBlock[3] = v29;
  v20 = _Block_copy(aBlock);
  v21 = v17;
  swift_retain(v18);
  v22 = swift_retain(a3);
  static DispatchQoS.unspecified.getter(v22);
  v33 = _swiftEmptyArrayStorage;
  v23 = sub_1000130D8();
  v24 = sub_10000E354((uint64_t *)&unk_10003DBA0);
  v25 = sub_100006858();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v33, v24, v25, v11, v23);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v16, v13, v20);
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v32 + 8))(v13, v11);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v16, v31);
  v26 = v35;
  swift_release(v18);
  return swift_release(v26);
}

uint64_t sub_100010C14(uint64_t a1, uint64_t a2, void (*a3)(_QWORD, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t Strong;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t inited;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE v28[80];
  _BYTE v29[24];

  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = &v28[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  a1 += 16;
  swift_beginAccess(a1, v29, 0, 0);
  Strong = swift_weakLoadStrong(a1);
  if (Strong)
  {
    v11 = Strong;
    *(double *)(Strong + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) = *(double *)(Strong + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) + 1.0;
    v12 = Logger.logObject.getter(Strong);
    v13 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc(12, -1);
      *(_DWORD *)v14 = 134217984;
      v27 = a2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, v28, v14 + 4, v14 + 12);
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "validate() called. { reporterID=%lld }", v14, 0xCu);
      swift_slowDealloc(v14, -1, -1);
    }

    v15 = sub_10000E3D4(a2, 0, 0x65746164696C6176, 0xE800000000000000);
    v16 = sub_10000E354(&qword_10003D6F8);
    inited = swift_initStackObject(v16, v28);
    *(_OWORD *)(inited + 16) = xmmword_100031B70;
    *(_QWORD *)(inited + 32) = 0x726574726F706572;
    *(_QWORD *)(inited + 40) = 0xEA00000000004449;
    if (v15)
    {
      *(_QWORD *)(inited + 48) = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithLongLong:", *(_QWORD *)(v15 + 16));
      *(_QWORD *)(inited + 56) = 0x5465636976726573;
      *(_QWORD *)(inited + 64) = 0xEB00000000657079;
      v18 = *(unsigned __int16 *)(v15 + 64);
    }
    else
    {
      *(_QWORD *)(inited + 48) = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithLongLong:", 0);
      *(_QWORD *)(inited + 56) = 0x5465636976726573;
      *(_QWORD *)(inited + 64) = 0xEB00000000657079;
      v18 = 0xFFFFLL;
    }
    *(_QWORD *)(inited + 72) = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithUnsignedShort:", v18);
    v24 = sub_10000FC84(inited);
    sub_1000180F4(v24);
    v26 = v25;
    swift_bridgeObjectRelease(v24);
    a3(0, v26);
    swift_release(v11);
    swift_release(v15);
    return swift_bridgeObjectRelease(v26);
  }
  else
  {
    v19 = static Logger.service.getter(0);
    v20 = Logger.logObject.getter(v19);
    v21 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "ClientServerInstance is gone. { action=validate }", v22, 2u);
      swift_slowDealloc(v22, -1, -1);
    }

    return (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
  }
}

void sub_100010FEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  Class isa;

  if (a1)
    v4 = (void *)_convertErrorToNSError(_:)();
  else
    v4 = 0;
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, void *, Class))(a3 + 16))(a3, v4, isa);

}

uint64_t sub_100011074(uint64_t a1, int a2, __int16 a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD aBlock[5];
  uint64_t v32;

  v5 = v4;
  v10 = type metadata accessor for DispatchWorkItemFlags(0);
  v29 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for DispatchQoS(0);
  v27 = *(_QWORD *)(v13 - 8);
  v28 = v13;
  __chkstk_darwin(v13);
  v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(void **)(*(_QWORD *)(v5 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_server)
                 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  v17 = swift_allocObject(&unk_1000392C8, 24, 7);
  swift_weakInit(v17 + 16, v5);
  v18 = swift_allocObject(&unk_1000394D0, 48, 7);
  *(_QWORD *)(v18 + 16) = v17;
  *(_QWORD *)(v18 + 24) = a4;
  *(_DWORD *)(v18 + 32) = a2;
  *(_WORD *)(v18 + 36) = a3;
  *(_QWORD *)(v18 + 40) = a1;
  aBlock[4] = sub_1000131C4;
  v32 = v18;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006CEC;
  aBlock[3] = &unk_1000394E8;
  v19 = _Block_copy(aBlock);
  v20 = v16;
  swift_retain(v17);
  swift_bridgeObjectRetain(a1);
  static DispatchQoS.unspecified.getter(v21);
  v30 = _swiftEmptyArrayStorage;
  v22 = sub_1000130D8();
  v23 = sub_10000E354((uint64_t *)&unk_10003DBA0);
  v24 = sub_100006858();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v30, v23, v24, v10, v22);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v15, v12, v19);
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v29 + 8))(v12, v10);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v15, v28);
  v25 = v32;
  swift_release(v17);
  return swift_release(v25);
}

void sub_1000112AC(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t Strong;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  void *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  uint64_t v57;
  uint8_t *v58;
  _QWORD v59[2];
  uint64_t v60;
  uint64_t v61;
  unsigned int v62;
  uint64_t v63;
  unsigned int v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _BYTE v69[24];

  v66 = a5;
  v9 = sub_10000E354(&qword_10003D6F0);
  __chkstk_darwin(v9);
  v65 = (char *)v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Message(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for Logger(0);
  v16 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin(v15);
  v18 = (char *)v59 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  a1 += 16;
  swift_beginAccess(a1, v69, 0, 0);
  Strong = swift_weakLoadStrong(a1);
  if (Strong)
  {
    v20 = Strong;
    v64 = a3;
    v21 = Strong + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_logger;
    v22 = Logger.logObject.getter(Strong);
    v23 = static os_log_type_t.debug.getter();
    v24 = os_log_type_enabled(v22, v23);
    v63 = a2;
    v62 = a4;
    if (v24)
    {
      v25 = swift_slowAlloc(32, -1);
      v59[1] = v21;
      v26 = v25;
      v27 = swift_slowAlloc(64, -1);
      v67 = a2;
      v68 = v27;
      *(_DWORD *)v26 = 134284035;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v67, &v68, v26 + 4, v26 + 12);
      *(_WORD *)(v26 + 12) = 2082;
      v60 = v11;
      v61 = v12;
      v28 = static Utilities.eventCategoryDescription(from:)(v64);
      v29 = a4;
      v31 = v30;
      v67 = sub_10000A7E4(v28, v30, &v68);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v67, &v68, v26 + 14, v26 + 22);
      swift_bridgeObjectRelease(v31);
      *(_WORD *)(v26 + 22) = 2082;
      v32 = static Utilities.eventTypeDescription(from:)(v29);
      v34 = v33;
      v67 = sub_10000A7E4(v32, v33, &v68);
      v11 = v60;
      v12 = v61;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v67, &v68, v26 + 24, v26 + 32);
      swift_bridgeObjectRelease(v34);
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "sendMessage() called. { reporterID=%{private}lld, category=%{public}s, type=%{public}s }", (uint8_t *)v26, 0x20u);
      swift_arrayDestroy(v27, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v27, -1, -1);
      swift_slowDealloc(v26, -1, -1);
    }

    v35 = v66;
    *(double *)(v20 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) = *(double *)(v20 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) + 1.0;
    v36 = Dictionary<>.asSimpleType()(v35);
    if (v36)
    {
      v37 = v36;
      v38 = Logger.logObject.getter(v36);
      v39 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v38, v39))
      {
        v40 = (uint8_t *)swift_slowAlloc(12, -1);
        *(_DWORD *)v40 = 134217984;
        v68 = v63;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v68, v69, v40 + 4, v40 + 12);
        _os_log_impl((void *)&_mh_execute_header, v38, v39, "sendMessage { reporterID=%lld }", v40, 0xCu);
        swift_slowDealloc(v40, -1, -1);
      }

      v41 = (void *)objc_opt_self(Trace);
      v42 = v63;
      v43 = objc_msgSend(objc_allocWithZone((Class)TraceArgs), "initWithArg1:", static Utilities.positiveReporterID(_:)(v63));
      objc_msgSend(v41, "post:args:", 4617, v43);

      v44 = type metadata accessor for Message.Metadata(0);
      v45 = v65;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 56))(v65, 1, 1, v44);
      Message.init(category:type:content:metadata:)(v64, v62, v37, v45);
      v46 = sub_100006D18((uint64_t)v14, v42);
      if ((v46 & 1) != 0)
      {
        (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
        swift_release(v20);
      }
      else
      {
        v54 = Logger.logObject.getter(v46);
        v55 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v54, v55))
        {
          v56 = (uint8_t *)swift_slowAlloc(12, -1);
          v57 = v42;
          v58 = v56;
          *(_DWORD *)v56 = 134217984;
          v68 = v57;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v68, v69, v56 + 4, v56 + 12);
          _os_log_impl((void *)&_mh_execute_header, v54, v55, "Message not sent. { reporterID=%lld }", v58, 0xCu);
          swift_slowDealloc(v58, -1, -1);
        }
        swift_release(v20);

        (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
      }
    }
    else
    {
      v51 = Logger.logObject.getter(0);
      v52 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v51, v52))
      {
        v53 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v53 = 0;
        _os_log_impl((void *)&_mh_execute_header, v51, v52, "Message cannot be converted to simple type. Aborting send.", v53, 2u);
        swift_slowDealloc(v53, -1, -1);
      }
      swift_release(v20);

    }
  }
  else
  {
    v47 = static Logger.service.getter(0);
    v48 = Logger.logObject.getter(v47);
    v49 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v48, v49))
    {
      v50 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v50 = 0;
      _os_log_impl((void *)&_mh_execute_header, v48, v49, "ClientServerInstance is gone. { action=send }", v50, 2u);
      swift_slowDealloc(v50, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  }
}

void sub_100011958(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t Strong;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  void **aBlock;
  _QWORD v31[4];
  uint64_t v32;
  char v33[24];

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  a1 += 16;
  swift_beginAccess(a1, v33, 0, 0);
  Strong = swift_weakLoadStrong(a1);
  if (Strong)
  {
    v9 = Strong;
    v10 = Logger.logObject.getter(Strong);
    v11 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc(12, -1);
      *(_DWORD *)v12 = 134217984;
      aBlock = (void **)a2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v31, v12 + 4, v12 + 12);
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "stopSession() called. { reporterID=%lld }", v12, 0xCu);
      swift_slowDealloc(v12, -1, -1);
    }

    *(double *)(v9 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) = *(double *)(v9 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation)
                                                                                                 + 5.0;
    v13 = sub_10000E3D4(a2, 0, 1886352499, 0xE400000000000000);
    if (!v13)
      goto LABEL_6;
    v14 = v13;
    v15 = *(NSObject **)(v13 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
    v16 = swift_allocObject(&unk_100039480, 32, 7);
    *(_QWORD *)(v16 + 16) = sub_10001319C;
    *(_QWORD *)(v16 + 24) = v14;
    v31[3] = sub_1000133A4;
    v32 = v16;
    aBlock = _NSConcreteStackBlock;
    v31[0] = 1107296256;
    v31[1] = sub_100005D54;
    v31[2] = &unk_100039498;
    v17 = _Block_copy(&aBlock);
    v18 = v32;
    swift_retain(v14);
    swift_retain(v16);
    swift_release(v18);
    dispatch_sync(v15, v17);
    _Block_release(v17);
    LOBYTE(v15) = swift_isEscapingClosureAtFileLocation(v16, "", 111, 92, 24, 1);
    swift_release_n(v14, 2);
    swift_release(v16);
    if ((v15 & 1) != 0)
    {
      __break(1u);
    }
    else
    {
LABEL_6:
      v19 = (void *)objc_opt_self(Trace);
      v20 = objc_msgSend(objc_allocWithZone((Class)TraceArgs), "initWithArg1:", static Utilities.positiveReporterID(_:)(a2));
      objc_msgSend(v19, "post:args:", 4615, v20);

      v22 = Logger.logObject.getter(v21);
      v23 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v22, v23))
      {
        v24 = (uint8_t *)swift_slowAlloc(12, -1);
        *(_DWORD *)v24 = 134217984;
        aBlock = (void **)a2;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v31, v24 + 4, v24 + 12);
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "Session stop signaled. { reporterID=%lld }", v24, 0xCu);
        swift_slowDealloc(v24, -1, -1);
      }
      swift_release(v9);

    }
  }
  else
  {
    v25 = static Logger.service.getter(0);
    v26 = Logger.logObject.getter(v25);
    v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "ClientServerInstance is gone. { action=stopSession }", v28, 2u);
      swift_slowDealloc(v28, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_100011D60(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t Strong;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  void **aBlock;
  _QWORD v36[4];
  uint64_t v37;
  char v38[24];

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  a1 += 16;
  swift_beginAccess(a1, v38, 0, 0);
  Strong = swift_weakLoadStrong(a1);
  if (Strong)
  {
    v9 = Strong;
    v10 = Logger.logObject.getter(Strong);
    v11 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc(12, -1);
      *(_DWORD *)v12 = 134217984;
      aBlock = (void **)a2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v36, v12 + 4, v12 + 12);
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "destroySession() called. { reporterID=%lld }", v12, 0xCu);
      swift_slowDealloc(v12, -1, -1);
    }

    v13 = sub_10000E3D4(a2, 0, 0x796F7274736564, 0xE700000000000000);
    if (v13)
    {
      v14 = v13;
      v15 = *(_BYTE *)(v13 + 66);
      v16 = *(NSObject **)(v13 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
      v17 = swift_allocObject(&unk_100039250, 25, 7);
      *(_QWORD *)(v17 + 16) = v14;
      *(_BYTE *)(v17 + 24) = v15;
      v18 = swift_allocObject(&unk_100039278, 32, 7);
      *(_QWORD *)(v18 + 16) = sub_100012ED0;
      *(_QWORD *)(v18 + 24) = v17;
      v36[3] = sub_100005D74;
      v37 = v18;
      aBlock = _NSConcreteStackBlock;
      v36[0] = 1107296256;
      v36[1] = sub_100005D54;
      v36[2] = &unk_100039290;
      v19 = _Block_copy(&aBlock);
      v20 = v37;
      swift_retain(v14);
      swift_retain(v18);
      swift_release(v20);
      dispatch_sync(v16, v19);
      _Block_release(v19);
      LOBYTE(v16) = swift_isEscapingClosureAtFileLocation(v18, "", 111, 96, 24, 1);
      swift_release(v17);
      result = swift_release(v18);
      if ((v16 & 1) != 0)
      {
        __break(1u);
        return result;
      }
      swift_beginAccess(v9 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID, &aBlock, 33, 0);
      v22 = sub_100012EEC(a2);
      swift_endAccess(&aBlock);
      v23 = swift_release(v22);
      v24 = Logger.logObject.getter(v23);
      v25 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v24, v25))
      {
        v26 = (uint8_t *)swift_slowAlloc(12, -1);
        *(_DWORD *)v26 = 134217984;
        aBlock = (void **)a2;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v36, v26 + 4, v26 + 12);
        _os_log_impl((void *)&_mh_execute_header, v24, v25, "Removing from session list. { reporterID=%lld }", v26, 0xCu);
        swift_slowDealloc(v26, -1, -1);
      }

      v27 = (void *)objc_opt_self(Trace);
      v28 = objc_msgSend(objc_allocWithZone((Class)TraceArgs), "initWithArg1:", static Utilities.positiveReporterID(_:)(a2));
      objc_msgSend(v27, "post:args:", 4616, v28);

      sub_10000A254();
      swift_release(v9);
      v29 = v14;
    }
    else
    {
      v29 = v9;
    }
    return swift_release(v29);
  }
  else
  {
    v30 = static Logger.service.getter(0);
    v31 = Logger.logObject.getter(v30);
    v32 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v33 = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "ClientServerInstance is gone. { action=destroySession }", v33, 2u);
      swift_slowDealloc(v33, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_1000121D4(uint64_t a1, int a2, __int16 a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD aBlock[5];
  uint64_t v32;

  v6 = v5;
  v12 = type metadata accessor for DispatchWorkItemFlags(0);
  v29 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for DispatchQoS(0);
  v27 = *(_QWORD *)(v15 - 8);
  v28 = v15;
  __chkstk_darwin(v15);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *(void **)(*(_QWORD *)(v6 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_server)
                 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  v19 = swift_allocObject(&unk_1000393E0, 54, 7);
  *(_QWORD *)(v19 + 16) = v6;
  *(_QWORD *)(v19 + 24) = a1;
  *(_QWORD *)(v19 + 32) = a4;
  *(_QWORD *)(v19 + 40) = a5;
  *(_DWORD *)(v19 + 48) = a2;
  *(_WORD *)(v19 + 52) = a3;
  aBlock[4] = sub_100013180;
  v32 = v19;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006CEC;
  aBlock[3] = &unk_1000393F8;
  v20 = _Block_copy(aBlock);
  v21 = v18;
  swift_retain(v6);
  v22 = swift_retain(a5);
  static DispatchQoS.unspecified.getter(v22);
  v30 = _swiftEmptyArrayStorage;
  v23 = sub_1000130D8();
  v24 = sub_10000E354((uint64_t *)&unk_10003DBA0);
  v25 = sub_100006858();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v30, v24, v25, v12, v23);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v17, v14, v20);
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v29 + 8))(v14, v12);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v17, v28);
  return swift_release(v32);
}

void sub_1000123E0(uint64_t a1, uint64_t a2, void (*a3)(id, _QWORD), uint64_t a4, int a5, __int16 a6)
{
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  id v19;
  Swift::String v20;
  Swift::String v21;
  Swift::String v22;
  uint64_t v23;
  uint64_t inited;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  NSString v32;
  Class isa;
  id v34;
  id v35;
  uint64_t v36;
  _BYTE v37[64];
  Swift::String v38;

  v11 = Logger.logObject.getter(a1);
  v12 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v13 = 134217984;
    v36 = a2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, v37, v13 + 4, v13 + 12);
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "requestMessage() called. { reporterID=%lld }", v13, 0xCu);
    swift_slowDealloc(v13, -1, -1);
  }

  v14 = sub_10000E3D4(a2, 0, 0x4D74736575716572, 0xEE00656761737365);
  if (v14)
  {
    v15 = v14;
    v16 = Logger.logObject.getter(v14);
    v17 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Registering callback until message arrives.", v18, 2u);
      swift_slowDealloc(v18, -1, -1);
    }

    sub_1000256E4((uint64_t)a3, a4, a5, a6);
    swift_release(v15);
  }
  else
  {
    v19 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v38._object = (void *)0xE000000000000000;
    v20._object = (void *)0x8000000100032A20;
    v21._countAndFlagsBits = 0x2064696C61766E49;
    v21._object = (void *)0xEF6E6F6973736553;
    v20._countAndFlagsBits = 0xD000000000000016;
    v38._countAndFlagsBits = 0;
    v22 = NSLocalizedString(_:tableName:bundle:value:comment:)(v21, (Swift::String_optional)0, (NSBundle)v19, v20, v38);

    v23 = sub_10000E354(&qword_10003D6E8);
    inited = swift_initStackObject(v23, v37);
    *(_OWORD *)(inited + 16) = xmmword_100031B80;
    *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(NSLocalizedDescriptionKey);
    *(_QWORD *)(inited + 40) = v25;
    *(Swift::String *)(inited + 48) = v22;
    v26 = sub_10000FC90(inited);
    static Constants.machServiceName.getter();
    v28 = v27;
    sub_10001880C(v26);
    v30 = v29;
    swift_bridgeObjectRelease(v26);
    v31 = objc_allocWithZone((Class)NSError);
    v32 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v28);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v30);
    v34 = objc_msgSend(v31, "initWithDomain:code:userInfo:", v32, -1, isa);

    v35 = v34;
    a3(v34, 0);

  }
}

void sub_1000127CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  NSDictionary v6;
  Class isa;

  if (!a1)
  {
    v5 = 0;
    if (a2)
      goto LABEL_3;
LABEL_5:
    v6.super.isa = 0;
    goto LABEL_6;
  }
  v5 = (void *)_convertErrorToNSError(_:)();
  if (!a2)
    goto LABEL_5;
LABEL_3:
  v6.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
LABEL_6:
  isa = v6.super.isa;
  (*(void (**)(uint64_t, void *))(a3 + 16))(a3, v5);

}

uint64_t sub_100012860(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v24;
  _QWORD *v25;
  _QWORD aBlock[5];
  _QWORD *v27;

  v4 = v3;
  v8 = type metadata accessor for DispatchWorkItemFlags(0);
  v24 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for DispatchQoS(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(void **)(*(_QWORD *)(v4 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_server)
                 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  v16 = (_QWORD *)swift_allocObject(&unk_100039368, 48, 7);
  v16[2] = v4;
  v16[3] = a1;
  v16[4] = a2;
  v16[5] = a3;
  aBlock[4] = sub_10001315C;
  v27 = v16;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006CEC;
  aBlock[3] = &unk_100039380;
  v17 = _Block_copy(aBlock);
  v18 = v15;
  swift_retain(v4);
  v19 = swift_retain(a3);
  static DispatchQoS.unspecified.getter(v19);
  v25 = _swiftEmptyArrayStorage;
  v20 = sub_1000130D8();
  v21 = sub_10000E354((uint64_t *)&unk_10003DBA0);
  v22 = sub_100006858();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v25, v21, v22, v8, v20);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v14, v10, v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v24 + 8))(v10, v8);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return swift_release(v27);
}

void sub_100012A5C(uint64_t a1, uint64_t a2, void (*a3)(id, _QWORD, _QWORD))
{
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  id v9;
  Swift::String v10;
  Swift::String v11;
  Swift::String v12;
  uint64_t v13;
  uint64_t inited;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  NSString v22;
  Class isa;
  id v24;
  id v25;
  void (*v26)(_QWORD, uint64_t, _QWORD);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  __n128 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE v42[64];
  Swift::String v43;

  v5 = Logger.logObject.getter(a1);
  v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v7 = 134217984;
    v41 = a2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, v42, v7 + 4, v7 + 12);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "getTailspinSessionID() called. { reporterID=%lld }", v7, 0xCu);
    swift_slowDealloc(v7, -1, -1);
  }

  if (static Constants.unknownReporterID.getter(v8) == a2)
  {
    v9 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v43._object = (void *)0xE000000000000000;
    v10._object = (void *)0x80000001000329F0;
    v11._countAndFlagsBits = 0x2064696C61766E49;
    v11._object = (void *)0xEF6E6F6973736553;
    v10._countAndFlagsBits = 0xD000000000000024;
    v43._countAndFlagsBits = 0;
    v12 = NSLocalizedString(_:tableName:bundle:value:comment:)(v11, (Swift::String_optional)0, (NSBundle)v9, v10, v43);

    v13 = sub_10000E354(&qword_10003D6E8);
    inited = swift_initStackObject(v13, v42);
    *(_OWORD *)(inited + 16) = xmmword_100031B80;
    *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(NSLocalizedDescriptionKey);
    *(_QWORD *)(inited + 40) = v15;
    *(Swift::String *)(inited + 48) = v12;
    v16 = sub_10000FC90(inited);
    static Constants.machServiceName.getter();
    v18 = v17;
    sub_10001880C(v16);
    v20 = v19;
    swift_bridgeObjectRelease(v16);
    v21 = objc_allocWithZone((Class)NSError);
    v22 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v18);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v20);
    v24 = objc_msgSend(v21, "initWithDomain:code:userInfo:", v22, -1, isa);

    v25 = v24;
    a3(v24, 0, 0);

  }
  else
  {
    v26 = (void (*)(_QWORD, uint64_t, _QWORD))a3;
    v27 = static TailspinKeys.all.getter();
    v28 = v27;
    v29 = *(_QWORD *)(v27 + 16);
    if (v29)
    {
      swift_bridgeObjectRetain(v27);
      v30 = (_QWORD *)(v28 + 40);
      while (1)
      {
        v32 = *(v30 - 1);
        v31 = *v30;
        v33 = swift_bridgeObjectRetain(*v30);
        v34 = static DefaultsUtilities.reportingDomain.getter(v33);
        v36 = v35;
        v37 = static DefaultsUtilities.platformDefaultUserName.getter();
        v39 = v38;
        static DefaultsUtilities.get<A>(key:applicationID:userName:)(&v41, v32, v31, v34, v36, v37, v38, &type metadata for Bool);
        swift_bridgeObjectRelease(v31);
        swift_bridgeObjectRelease(v36);
        swift_bridgeObjectRelease(v39);
        if (v41 == 2 || (v41 & 1) == 0)
          break;
        v30 += 2;
        if (!--v29)
        {
          swift_bridgeObjectRelease_n(v28, 2);
          goto LABEL_13;
        }
      }
      swift_bridgeObjectRelease_n(v28, 2);
      v40 = 0;
    }
    else
    {
      swift_bridgeObjectRelease(v27);
LABEL_13:
      v40 = 1;
    }
    v26(0, v40, 0);
  }
}

void sub_100012E48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  id v6;

  if (a1)
    v5 = _convertErrorToNSError(_:)();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t))(a4 + 16))(a4);

}

uint64_t sub_100012EAC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 25, 7);
}

uint64_t sub_100012ED0()
{
  uint64_t v0;

  return sub_1000262D0(*(_QWORD *)(v0 + 16), *(unsigned __int8 *)(v0 + 24));
}

uint64_t sub_100012EDC()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100012EEC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  unint64_t v3;
  char v4;
  unint64_t v5;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v2 = v1;
  v3 = sub_10000E860(a1);
  if ((v4 & 1) == 0)
    return 0;
  v5 = v3;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v1);
  v7 = *v1;
  v11 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_100024568();
    v7 = v11;
  }
  v8 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v5);
  sub_1000283D4(v5, v7);
  v9 = *v2;
  *v2 = v7;
  swift_bridgeObjectRelease(v9);
  return v8;
}

uint64_t sub_100012F80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  unint64_t v7;
  char v8;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;

  v3 = v2;
  v6 = *v3;
  swift_bridgeObjectRetain(*v3);
  v7 = sub_10002326C(a1);
  LOBYTE(a1) = v8;
  swift_bridgeObjectRelease(v6);
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v10 = *v3;
    v19 = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_100024AD8();
      v10 = v19;
    }
    v11 = *(_QWORD *)(v10 + 48);
    v12 = type metadata accessor for FeatureInfo(0);
    sub_100013324(v11 + *(_QWORD *)(*(_QWORD *)(v12 - 8) + 72) * v7);
    v13 = *(_QWORD *)(v10 + 56);
    v14 = type metadata accessor for FeatureState(0);
    v15 = *(_QWORD *)(v14 - 8);
    sub_100013360(v13 + *(_QWORD *)(v15 + 72) * v7, a2);
    sub_100028748(v7, v10);
    v16 = *v3;
    *v3 = v10;
    swift_bridgeObjectRelease(v16);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v15 + 56))(a2, 0, 1, v14);
  }
  else
  {
    v18 = type metadata accessor for FeatureState(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(a2, 1, 1, v18);
  }
}

uint64_t sub_1000130AC()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000130D0()
{
  uint64_t v0;

  return sub_100011D60(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

unint64_t sub_1000130D8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003D6D8;
  if (!qword_10003D6D8)
  {
    v1 = type metadata accessor for DispatchWorkItemFlags(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_10003D6D8);
  }
  return result;
}

uint64_t sub_100013120()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_100013144(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_100012E48(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

uint64_t sub_10001314C()
{
  return sub_10001327C((void (*)(_QWORD))&_swift_release, 48);
}

void sub_10001315C()
{
  uint64_t v0;

  sub_100012A5C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void (**)(id, _QWORD, _QWORD))(v0 + 32));
}

void sub_100013168(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1000127CC(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_100013170()
{
  return sub_10001327C((void (*)(_QWORD))&_swift_release, 54);
}

void sub_100013180()
{
  uint64_t v0;

  sub_1000123E0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void (**)(id, _QWORD))(v0 + 32), *(_QWORD *)(v0 + 40), *(_DWORD *)(v0 + 48), *(_WORD *)(v0 + 52));
}

void sub_100013194()
{
  uint64_t v0;

  sub_100011958(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

void sub_10001319C()
{
  sub_100025CCC();
}

uint64_t sub_1000131A4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000131B4()
{
  return sub_10001327C((void (*)(_QWORD))&_swift_bridgeObjectRelease, 48);
}

void sub_1000131C4()
{
  uint64_t v0;

  sub_1000112AC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_DWORD *)(v0 + 32), *(unsigned __int16 *)(v0 + 36), *(_QWORD *)(v0 + 40));
}

void sub_1000131D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_100010FEC(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_1000131E0()
{
  return sub_10001327C((void (*)(_QWORD))&_swift_release, 48);
}

uint64_t sub_1000131F0()
{
  uint64_t v0;

  return sub_100010C14(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void (**)(_QWORD, uint64_t))(v0 + 32));
}

uint64_t sub_1000131FC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100013228()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100013254()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

void sub_100013264(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_10001099C(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_10001326C()
{
  return sub_10001327C((void (*)(_QWORD))&_swift_release, 48);
}

uint64_t sub_10001327C(void (*a1)(_QWORD), uint64_t a2)
{
  uint64_t v2;

  swift_release(*(_QWORD *)(v2 + 16));
  a1(*(_QWORD *)(v2 + 40));
  return swift_deallocObject(v2, a2, 7);
}

uint64_t sub_1000132C0()
{
  uint64_t v0;

  return sub_100010688(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void (**)(uint64_t, uint64_t))(v0 + 32));
}

uint64_t sub_1000132CC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 34, 7);
}

uint64_t sub_1000132F0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100013300()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100013324(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for FeatureInfo(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100013360(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FeatureState(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100013438()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  Swift::Int64 v13;
  uint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[24];

  v1 = v0;
  v2 = (_QWORD *)(v0 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID);
  swift_beginAccess(v0 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID, v22, 0, 0);
  v3 = *v2;
  v4 = *v2 + 64;
  v5 = 1 << *(_BYTE *)(*v2 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(*v2 + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  result = swift_bridgeObjectRetain(*v2);
  v10 = 0;
  while (1)
  {
    if (v7)
    {
      v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v12 = v11 | (v10 << 6);
      goto LABEL_5;
    }
    v15 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v15 >= v8)
      goto LABEL_25;
    v16 = *(_QWORD *)(v4 + 8 * v15);
    ++v10;
    if (!v16)
    {
      v10 = v15 + 1;
      if (v15 + 1 >= v8)
        goto LABEL_25;
      v16 = *(_QWORD *)(v4 + 8 * v10);
      if (!v16)
      {
        v10 = v15 + 2;
        if (v15 + 2 >= v8)
          goto LABEL_25;
        v16 = *(_QWORD *)(v4 + 8 * v10);
        if (!v16)
        {
          v10 = v15 + 3;
          if (v15 + 3 >= v8)
            goto LABEL_25;
          v16 = *(_QWORD *)(v4 + 8 * v10);
          if (!v16)
          {
            v10 = v15 + 4;
            if (v15 + 4 >= v8)
              goto LABEL_25;
            v16 = *(_QWORD *)(v4 + 8 * v10);
            if (!v16)
              break;
          }
        }
      }
    }
LABEL_24:
    v7 = (v16 - 1) & v16;
    v12 = __clz(__rbit64(v16)) + (v10 << 6);
LABEL_5:
    v13 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v12);
    type metadata accessor for OsTransactionHandler(0);
    v14 = static OsTransactionHandler.shared.getter();
    OsTransactionHandler.sessionStopped(for:)(v13);
    result = swift_release(v14);
  }
  v17 = v15 + 5;
  if (v17 >= v8)
  {
LABEL_25:
    swift_release(v3);
    swift_release(*(_QWORD *)(v1 + 16));
    swift_bridgeObjectRelease(*(_QWORD *)(v1 + 32));
    v18 = v1 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_logger;
    v19 = type metadata accessor for Logger(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(v18, v19);
    swift_unknownObjectRelease(*(_QWORD *)(v1 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_server));
    v20 = v1 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_clientStartDate;
    v21 = type metadata accessor for Date(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 8))(v20, v21);
    swift_bridgeObjectRelease(*v2);
    return v1;
  }
  v16 = *(_QWORD *)(v4 + 8 * v17);
  if (v16)
  {
    v10 = v17;
    goto LABEL_24;
  }
  while (1)
  {
    v10 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v10 >= v8)
      goto LABEL_25;
    v16 = *(_QWORD *)(v4 + 8 * v10);
    ++v17;
    if (v16)
      goto LABEL_24;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_10001366C()
{
  uint64_t v0;

  sub_100013438();
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_100013690()
{
  return type metadata accessor for ClientServerInstance(0);
}

uint64_t sub_100013698(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;
  _QWORD v5[8];

  v5[0] = (char *)&value witness table for Builtin.NativeObject + 64;
  v5[1] = &unk_100031BE8;
  result = type metadata accessor for Logger(319);
  if (v3 <= 0x3F)
  {
    v5[2] = *(_QWORD *)(result - 8) + 64;
    v5[3] = &unk_100031BE8;
    v5[4] = (char *)&value witness table for Builtin.Int32 + 64;
    result = type metadata accessor for Date(319);
    if (v4 <= 0x3F)
    {
      v5[5] = *(_QWORD *)(result - 8) + 64;
      v5[6] = (char *)&value witness table for Builtin.BridgeObject + 64;
      v5[7] = (char *)&value witness table for Builtin.Int64 + 64;
      return swift_updateClassMetadata2(a1, 256, 8, v5, a1 + 80);
    }
  }
  return result;
}

uint64_t sub_100013760(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void (*v13)(_QWORD *, uint64_t, uint64_t);
  id v14;
  uint64_t (*v15)(_QWORD *, uint64_t);
  uint64_t result;
  uint64_t v17;
  char v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int16 v33;
  __int16 v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _OWORD v43[2];
  uint64_t v44;

  v42 = a1;
  v2 = type metadata accessor for Message.Metadata(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchPredicate(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (uint64_t *)((char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v41 = v1;
  v10 = OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue;
  v40 = *(_QWORD *)(v1 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_server);
  v11 = *(void **)(v40 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  *v9 = v11;
  v12 = enum case for DispatchPredicate.onQueue(_:);
  v13 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v7 + 104);
  v13(v9, enum case for DispatchPredicate.onQueue(_:), v6);
  v14 = v11;
  LOBYTE(v11) = _dispatchPreconditionTest(_:)(v9);
  v15 = *(uint64_t (**)(_QWORD *, uint64_t))(v7 + 8);
  result = v15(v9, v6);
  if ((v11 & 1) != 0)
  {
    v17 = Message.metadata.getter(result);
    v18 = Message.Metadata.isBroadcast.getter(v17);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    if ((v18 & 1) == 0)
    {
      v30 = v42;
      v31 = *(_QWORD *)(v41 + 16);
      v44 = 0;
      memset(v43, 0, sizeof(v43));
      v32 = sub_10001911C(v31, v42, (uint64_t)v43, 1);
      v34 = v33;
      sub_10000E394((uint64_t)v43);
      v35 = swift_bridgeObjectRelease(v32);
      if ((v34 & 0x100) != 0)
      {
        v36 = Logger.logObject.getter(v35);
        v37 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v36, v37))
        {
          v38 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v38 = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, v37, "Discarding single message", v38, 2u);
          swift_slowDealloc(v38, -1, -1);
        }

        v29 = 0;
      }
      else if ((v34 & 1) != 0)
      {
        sub_10001B380(v30);
        v29 = 1;
      }
      else
      {
        v29 = 0;
      }
      return v29 & 1;
    }
    v19 = v42;
    v20 = *(void **)(v40 + v10);
    *v9 = v20;
    v13(v9, v12, v6);
    v21 = v20;
    LOBYTE(v20) = _dispatchPreconditionTest(_:)(v9);
    result = v15(v9, v6);
    if ((v20 & 1) != 0)
    {
      v22 = v41;
      v23 = (uint64_t *)(v41 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID);
      swift_beginAccess(v41 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID, v43, 0, 0);
      v24 = *v23;
      swift_bridgeObjectRetain(v24);
      v26 = sub_10000AD98(v25);
      v27 = swift_bridgeObjectRelease(v24);
      __chkstk_darwin(v27);
      *(&v39 - 2) = v22;
      *(&v39 - 1) = v19;
      v28 = sub_100014094((void (*)(uint64_t *__return_ptr, uint64_t *))sub_100014E78, (uint64_t)(&v39 - 4), (uint64_t)v26);
      swift_release(v26);
      v29 = sub_1000148E8(1, (uint64_t)v28);
      swift_bridgeObjectRelease(v28);
      return v29 & 1;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_100013A7C()
{
  char *v0;
  char *v1;
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
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  void (*v15)(_QWORD);
  id v16;
  uint64_t result;
  uint64_t v18;
  NSObject *v19;
  _BOOL4 v20;
  uint8_t *v21;
  void *v22;
  id v23;
  char v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  os_log_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  const void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint8_t *v68;
  uint64_t v69;
  os_log_t v70;
  uint64_t v71;
  int v72;
  uint64_t v73;
  uint64_t (*v74)(_QWORD *, uint64_t);
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD *v80;
  char v81[24];
  _QWORD *v82;
  uint64_t aBlock[5];
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;

  v1 = v0;
  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchQoS(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v77 = (char *)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchPredicate(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (uint64_t *)((char *)&v67 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = *(_QWORD *)&v1[OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_server];
  v78 = OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue;
  v79 = v13;
  v14 = *(void **)(v13 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  *v12 = v14;
  v15 = *(void (**)(_QWORD))(v10 + 104);
  LODWORD(v75) = enum case for DispatchPredicate.onQueue(_:);
  v80 = v15;
  v15(v12);
  v16 = v14;
  LOBYTE(v14) = _dispatchPreconditionTest(_:)(v12);
  v74 = *(uint64_t (**)(_QWORD *, uint64_t))(v10 + 8);
  result = v74(v12, v9);
  if ((v14 & 1) == 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  v18 = swift_retain_n(v1, 2);
  v19 = Logger.logObject.getter(v18);
  v72 = static os_log_type_t.debug.getter();
  v20 = os_log_type_enabled(v19, (os_log_type_t)v72);
  v76 = v2;
  if (v20)
  {
    v70 = v19;
    v71 = v7;
    v21 = (uint8_t *)swift_slowAlloc(12, -1);
    v69 = swift_slowAlloc(32, -1);
    aBlock[0] = v69;
    *(_DWORD *)v21 = 136380675;
    v22 = *(void **)(v79 + v78);
    *v12 = v22;
    ((void (*)(_QWORD *, _QWORD, uint64_t))v80)(v12, v75, v9);
    v23 = v22;
    v24 = _dispatchPreconditionTest(_:)(v12);
    result = v74(v12, v9);
    if ((v24 & 1) == 0)
    {
LABEL_14:
      __break(1u);
      return result;
    }
    v68 = v21 + 4;
    v25 = &v1[OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID];
    swift_beginAccess(&v1[OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID], v81, 0, 0);
    v26 = *(_QWORD *)v25;
    swift_bridgeObjectRetain(v26);
    v28 = v6;
    v29 = v5;
    v30 = v3;
    v31 = sub_10000AD98(v27);
    swift_bridgeObjectRelease(v26);
    v32 = Array.description.getter(v31, &type metadata for Int64);
    v34 = v33;
    v35 = v31;
    v3 = v30;
    v5 = v29;
    v6 = v28;
    v36 = v79;
    swift_release(v35);
    v85 = sub_10000A7E4(v32, v34, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v85, &v86, v68, v21 + 12);
    swift_release_n(v1, 2);
    swift_bridgeObjectRelease(v34);
    v37 = v70;
    _os_log_impl((void *)&_mh_execute_header, v70, (os_log_type_t)v72, "destroyAllSessions() { sessionIDs=%{private}s }", v21, 0xCu);
    v38 = v69;
    swift_arrayDestroy(v69, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v38, -1, -1);
    swift_slowDealloc(v21, -1, -1);

    v7 = v71;
  }
  else
  {
    swift_release_n(v1, 2);

    v36 = v79;
  }
  v39 = *(void **)(v36 + v78);
  *v12 = v39;
  ((void (*)(_QWORD *, _QWORD, uint64_t))v80)(v12, v75, v9);
  v40 = v39;
  LOBYTE(v39) = _dispatchPreconditionTest(_:)(v12);
  result = v74(v12, v9);
  if ((v39 & 1) == 0)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v41 = &v1[OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID];
  swift_beginAccess(&v1[OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID], &v85, 0, 0);
  v42 = *(_QWORD *)v41;
  swift_bridgeObjectRetain(v42);
  v44 = sub_10000AD98(v43);
  swift_bridgeObjectRelease(v42);
  v80 = v44;
  v45 = v44[2];
  if (v45)
  {
    swift_retain(v80);
    v74 = (uint64_t (*)(_QWORD *, uint64_t))v1;
    v46 = 0;
    v75 = v45;
    v73 = v6;
    do
    {
      v47 = v80[v46++ + 4];
      v48 = *(void **)(v79 + v78);
      v49 = swift_allocObject(&unk_100039840, 24, 7);
      swift_weakInit(v49 + 16, v74);
      v50 = swift_allocObject(&unk_100039868, 32, 7);
      *(_QWORD *)(v50 + 16) = v49;
      *(_QWORD *)(v50 + 24) = v47;
      aBlock[4] = (uint64_t)sub_1000130D0;
      v84 = v50;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_100006CEC;
      aBlock[3] = (uint64_t)&unk_100039880;
      v51 = v3;
      v52 = _Block_copy(aBlock);
      v53 = v48;
      v54 = swift_retain(v49);
      static DispatchQoS.unspecified.getter(v54);
      v82 = _swiftEmptyArrayStorage;
      v55 = v7;
      v56 = sub_100006818((unint64_t *)&qword_10003D6D8, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
      v57 = sub_10000E354((uint64_t *)&unk_10003DBA0);
      v58 = sub_10000AD18((unint64_t *)&qword_10003D6E0, (uint64_t *)&unk_10003DBA0, (uint64_t)&protocol conformance descriptor for [A]);
      v59 = v76;
      v60 = v56;
      v7 = v55;
      v61 = v77;
      dispatch thunk of SetAlgebra.init<A>(_:)(&v82, v57, v58, v76, v60);
      OS_dispatch_queue.async(group:qos:flags:execute:)(0, v61, v5, v52);
      v62 = v52;
      v3 = v51;
      v63 = v73;
      _Block_release(v62);

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v59);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v61, v63);
      v64 = v84;
      swift_release(v49);
      v65 = v64;
      v66 = v75;
      swift_release(v65);
    }
    while (v66 != v46);
    swift_release(v80);
  }
  return swift_release(v80);
}

_QWORD *sub_100014094(void (*a1)(uint64_t *__return_ptr, uint64_t *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  _QWORD *v6;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;

  v4 = v3;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = _swiftEmptyArrayStorage;
  if (v5)
  {
    v17 = _swiftEmptyArrayStorage;
    sub_100028B5C(0, v5, 0);
    v6 = _swiftEmptyArrayStorage;
    v9 = (uint64_t *)(a3 + 32);
    while (1)
    {
      v10 = *v9++;
      v15 = v10;
      a1(&v16, &v15);
      if (v4)
        break;
      v4 = 0;
      v11 = v16;
      v17 = v6;
      v13 = v6[2];
      v12 = v6[3];
      if (v13 >= v12 >> 1)
      {
        sub_100028B5C(v12 > 1, v13 + 1, 1);
        v6 = v17;
      }
      v6[2] = v13 + 1;
      *((_BYTE *)v6 + v13 + 32) = v11;
      if (!--v5)
        return v6;
    }
    swift_release(v6);
  }
  return v6;
}

uint64_t sub_10001419C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void (*v10)(_QWORD *, uint64_t, uint64_t);
  id v11;
  uint64_t (*v12)(_QWORD *, uint64_t);
  uint64_t result;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD *v22;
  NSObject *v23;
  os_log_t v24;
  uint64_t v25;
  int v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t (*v40)(_QWORD *, uint64_t);
  uint64_t v41;
  void *v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  id v53;
  uint64_t (*v54)(_QWORD *, uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  void *v59;
  id v60;
  unint64_t v61;
  unint64_t v62;
  _QWORD *v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  int v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  os_log_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  os_log_t v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD *v81;
  void (*v82)(_QWORD *, uint64_t, uint64_t);
  uint64_t (*v83)(_QWORD *, uint64_t);
  unsigned int v84;
  uint64_t v85;
  uint64_t v86;
  _QWORD *v87;
  char v88[24];

  v1 = v0;
  v2 = type metadata accessor for DispatchPredicate(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (uint64_t *)((char *)&v75 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = *(_QWORD *)(v0 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_server);
  v7 = OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue;
  v8 = *(void **)(v6 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  *v5 = v8;
  v9 = enum case for DispatchPredicate.onQueue(_:);
  v10 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v3 + 104);
  v10(v5, enum case for DispatchPredicate.onQueue(_:), v2);
  v11 = v8;
  LOBYTE(v8) = _dispatchPreconditionTest(_:)(v5);
  v12 = *(uint64_t (**)(_QWORD *, uint64_t))(v3 + 8);
  result = v12(v5, v2);
  if ((v8 & 1) == 0)
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  v14 = (_QWORD *)(v1 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID);
  swift_beginAccess(v1 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_sessionsByReporterID, v88, 0, 0);
  v81 = v14;
  v15 = *v14;
  swift_bridgeObjectRetain(v15);
  v17 = sub_10000AD98(v16);
  swift_bridgeObjectRelease(v15);
  v18 = *(void **)(v6 + v7);
  *v5 = v18;
  v10(v5, v9, v2);
  v19 = v18;
  LOBYTE(v18) = _dispatchPreconditionTest(_:)(v5);
  result = v12(v5, v2);
  if ((v18 & 1) == 0)
  {
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  v82 = v10;
  v79 = v6;
  v80 = v2;
  v20 = v17[2];
  result = swift_retain(v1);
  if (v20)
  {
    v21 = 0;
    v78 = ((char *)v20 - 1);
    v22 = _swiftEmptyArrayStorage;
    v85 = v7;
    v84 = v9;
    v83 = v12;
    do
    {
      if (v21 <= v20)
        v23 = v20;
      else
        v23 = v21;
      v24 = v21;
      while (1)
      {
        if (v23 == v24)
        {
          __break(1u);
          goto LABEL_50;
        }
        v25 = v17[(_QWORD)v24 + 4];
        result = sub_10000E3D4(v25, 0, 0x7669746341746567, 0xE900000000000065);
        if (result)
        {
          v26 = *(unsigned __int8 *)(result + 66);
          result = swift_release(result);
          if (v26 == 1)
            break;
        }
        v24 = (os_log_t)((char *)v24 + 1);
        if (v20 == v24)
        {
          v7 = v85;
          v9 = v84;
          v12 = v83;
          goto LABEL_22;
        }
      }
      result = swift_isUniquelyReferenced_nonNull_native(v22);
      v87 = v22;
      if ((result & 1) == 0)
      {
        result = sub_100028B40(0, v22[2] + 1, 1);
        v22 = v87;
      }
      v28 = v22[2];
      v27 = v22[3];
      v29 = v28 + 1;
      if (v28 >= v27 >> 1)
      {
        result = sub_100028B40(v27 > 1, v28 + 1, 1);
        v29 = v28 + 1;
        v22 = v87;
      }
      v21 = ((char *)&v24->isa + 1);
      v22[2] = v29;
      v22[v28 + 4] = v25;
      v30 = v78 == v24;
      v7 = v85;
      v9 = v84;
      v12 = v83;
    }
    while (!v30);
  }
  else
  {
    v22 = _swiftEmptyArrayStorage;
  }
LABEL_22:
  swift_release(v17);
  swift_release(v1);
  v31 = v22[2];
  v32 = swift_release(v22);
  if (v31
    || *(double *)(v1 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_timeToInvalidation) >= static Double.now()(v32))
  {
    return 0;
  }
  v33 = swift_retain_n(v1, 5);
  v34 = Logger.logObject.getter(v33);
  v35 = static os_log_type_t.debug.getter();
  if (!os_log_type_enabled(v34, (os_log_type_t)v35))
  {
    swift_release_n(v1, 5);

    return 1;
  }
  v77 = v35;
  v78 = v34;
  v36 = swift_slowAlloc(38, -1);
  v76 = swift_slowAlloc(32, -1);
  v87 = (_QWORD *)v76;
  *(_DWORD *)v36 = 136381443;
  v37 = v7;
  v38 = *(_QWORD *)(v1 + 24);
  v39 = *(_QWORD *)(v1 + 32);
  swift_bridgeObjectRetain(v39);
  v86 = sub_10000A7E4(v38, v39, (uint64_t *)&v87);
  v40 = v12;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v86, &v87, v36 + 4, v36 + 12);
  swift_bridgeObjectRelease(v39);
  *(_WORD *)(v36 + 12) = 1024;
  LODWORD(v86) = *(_DWORD *)(v1 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v86, (char *)&v86 + 4, v36 + 14, v36 + 18);
  swift_release(v1);
  *(_WORD *)(v36 + 18) = 2048;
  v85 = v37;
  v41 = v79;
  v42 = *(void **)(v79 + v37);
  *v5 = v42;
  v84 = v9;
  v43 = v80;
  v82(v5, v9, v80);
  v44 = v42;
  LOBYTE(v39) = _dispatchPreconditionTest(_:)(v5);
  v83 = v40;
  result = v40(v5, v43);
  if ((v39 & 1) == 0)
  {
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }
  v45 = *v81;
  swift_bridgeObjectRetain(*v81);
  v47 = sub_10000AD98(v46);
  swift_bridgeObjectRelease(v45);
  v48 = v47[2];
  swift_release(v1);
  swift_release(v47);
  v86 = v48;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v86, &v87, v36 + 20, v36 + 28);
  swift_release(v1);
  *(_WORD *)(v36 + 28) = 2048;
  v49 = v85;
  v50 = v41;
  v51 = *(void **)(v41 + v85);
  *v5 = v51;
  v52 = v84;
  v82(v5, v84, v43);
  v53 = v51;
  LOBYTE(v51) = _dispatchPreconditionTest(_:)(v5);
  v54 = v83;
  result = v83(v5, v43);
  if ((v51 & 1) == 0)
  {
LABEL_54:
    __break(1u);
    goto LABEL_55;
  }
  v55 = v43;
  v56 = *v81;
  swift_bridgeObjectRetain(*v81);
  v58 = sub_10000AD98(v57);
  swift_bridgeObjectRelease(v56);
  v59 = *(void **)(v50 + v49);
  *v5 = v59;
  v82(v5, v52, v55);
  v60 = v59;
  LOBYTE(v59) = _dispatchPreconditionTest(_:)(v5);
  result = v54(v5, v55);
  if ((v59 & 1) != 0)
  {
    v61 = v58[2];
    result = swift_retain(v1);
    if (v61)
    {
      v62 = 0;
      v85 = v61 - 1;
      v63 = _swiftEmptyArrayStorage;
LABEL_30:
      if (v62 <= v61)
        v64 = v61;
      else
        v64 = v62;
      v65 = v62;
      while (v64 != v65)
      {
        v66 = v58[v65 + 4];
        result = sub_10000E3D4(v66, 0, 0x7669746341746567, 0xE900000000000065);
        if (result)
        {
          v67 = *(unsigned __int8 *)(result + 66);
          result = swift_release(result);
          if (v67 == 1)
          {
            result = swift_isUniquelyReferenced_nonNull_native(v63);
            v86 = (uint64_t)v63;
            if ((result & 1) == 0)
            {
              result = sub_100028B40(0, v63[2] + 1, 1);
              v63 = (_QWORD *)v86;
            }
            v69 = v63[2];
            v68 = v63[3];
            v70 = v69 + 1;
            if (v69 >= v68 >> 1)
            {
              result = sub_100028B40(v68 > 1, v69 + 1, 1);
              v70 = v69 + 1;
              v63 = (_QWORD *)v86;
            }
            v62 = v65 + 1;
            v63[2] = v70;
            v63[v69 + 4] = v66;
            if (v85 != v65)
              goto LABEL_30;
            goto LABEL_48;
          }
        }
        if (v61 == ++v65)
          goto LABEL_48;
      }
LABEL_50:
      __break(1u);
      goto LABEL_51;
    }
    v63 = _swiftEmptyArrayStorage;
LABEL_48:
    swift_release(v58);
    swift_release(v1);
    v72 = v63[2];
    swift_release(v1);
    swift_release(v63);
    v86 = v72;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v86, &v87, v36 + 30, v36 + 38);
    swift_release(v1);
    v73 = v78;
    _os_log_impl((void *)&_mh_execute_header, v78, (os_log_type_t)v77, "ClientServerInstance should be invalidated. { clientProcessName=%{private}s, pid=%d, sessionCount=%ld, activeSessions=%ld }", (uint8_t *)v36, 0x26u);
    v71 = 1;
    v74 = v76;
    swift_arrayDestroy(v76, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v74, -1, -1);
    swift_slowDealloc(v36, -1, -1);

    return v71;
  }
LABEL_55:
  __break(1u);
  return result;
}

uint64_t sub_1000148E8(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return v2 & 1;
  if (*(_BYTE *)(a2 + 32) == (result & 1))
    return 1;
  if (v2 == 1)
    return 0;
  v3 = 33;
  while (1)
  {
    v4 = v3 - 31;
    if (__OFADD__(v3 - 32, 1))
      break;
    v5 = *(_BYTE *)(a2 + v3) ^ result;
    if ((v5 & 1) != 0)
    {
      ++v3;
      if (v4 != v2)
        continue;
    }
    LOBYTE(v2) = v5 ^ 1;
    return v2 & 1;
  }
  __break(1u);
  return result;
}

Swift::Int sub_100014958()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[9];

  v1 = *v0;
  Hasher.init(_seed:)(v5, 0);
  Hasher._combine(_:)(*(_DWORD *)(v1 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid));
  v2 = *(_QWORD *)(v1 + 24);
  v3 = *(_QWORD *)(v1 + 32);
  swift_bridgeObjectRetain(v3);
  String.hash(into:)(v5, v2, v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

uint64_t sub_1000149D0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *v1;
  Hasher._combine(_:)(*(_DWORD *)(*v1 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid));
  v4 = *(_QWORD *)(v3 + 24);
  v5 = *(_QWORD *)(v3 + 32);
  swift_bridgeObjectRetain(v5);
  String.hash(into:)(a1, v4, v5);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_100014A2C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[9];

  v2 = *v1;
  Hasher.init(_seed:)(v6, a1);
  Hasher._combine(_:)(*(_DWORD *)(v2 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid));
  v3 = *(_QWORD *)(v2 + 24);
  v4 = *(_QWORD *)(v2 + 32);
  swift_bridgeObjectRetain(v4);
  String.hash(into:)(v6, v3, v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t sub_100014AA0(uint64_t *a1, uint64_t *a2)
{
  return sub_100014DD8(*a1, *a2);
}

uint64_t sub_100014AAC()
{
  return sub_100006818(&qword_10003D7E8, type metadata accessor for ClientServerInstance, (uint64_t)&unk_100031C00);
}

_QWORD *sub_100014AD8(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __n128 v10;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_10;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v2)
    return _swiftEmptyArrayStorage;
  while (1)
  {
    if (v2 <= 0)
    {
      v4 = _swiftEmptyArrayStorage;
    }
    else
    {
      v3 = sub_10000E354(&qword_10003D810);
      v4 = (_QWORD *)swift_allocObject(v3, 8 * v2 + 32, 7);
      v5 = j__malloc_size(v4);
      v6 = v5 - 32;
      if (v5 < 32)
        v6 = v5 - 25;
      v4[2] = v2;
      v4[3] = (2 * (v6 >> 3)) | 1;
    }
    swift_bridgeObjectRetain(v1);
    v7 = sub_100014BCC((unint64_t)(v4 + 4), v2, v1);
    v1 = v8;
    swift_bridgeObjectRelease(v7);
    if (v1 == v2)
      break;
    __break(1u);
LABEL_10:
    if (v1 < 0)
      v9 = v1;
    else
      v9 = v1 & 0xFFFFFFFFFFFFFF8;
    v10 = swift_bridgeObjectRetain(v1);
    v2 = _CocoaArrayWrapper.endIndex.getter(v9, v10);
    swift_bridgeObjectRelease(v1);
    if (!v2)
      return _swiftEmptyArrayStorage;
  }
  return v4;
}

uint64_t sub_100014BCC(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __n128 v11;
  uint64_t v12;
  unint64_t i;
  void (*v14)(_QWORD *);
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  __n128 v18;
  uint64_t result;
  uint64_t *v20[4];

  v6 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0)
      v17 = a3;
    else
      v17 = a3 & 0xFFFFFFFFFFFFFF8;
    v18 = swift_bridgeObjectRetain(a3);
    v7 = _CocoaArrayWrapper.endIndex.getter(v17, v18);
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
      v10 = a3;
    else
      v10 = a3 & 0xFFFFFFFFFFFFFF8;
    v11 = swift_bridgeObjectRetain(a3);
    v12 = _CocoaArrayWrapper.endIndex.getter(v10, v11);
    swift_bridgeObjectRelease(a3);
    if (v12 <= a2)
    {
      if (v7 >= 1)
      {
        sub_10000AD18(&qword_10003D820, &qword_10003D818, (uint64_t)&protocol conformance descriptor for [A]);
        swift_bridgeObjectRetain(a3);
        for (i = 0; i != v7; ++i)
        {
          sub_10000E354(&qword_10003D818);
          v14 = sub_100020C68(v20, i, a3);
          v16 = *v15;
          swift_retain(*v15);
          ((void (*)(uint64_t **, _QWORD))v14)(v20, 0);
          *(_QWORD *)(a1 + 8 * i) = v16;
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
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for Config(0);
    swift_arrayInitWithCopy(a1);
    return a3;
  }
LABEL_26:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100014DD8(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid) != *(_DWORD *)(a2
                                                                                                  + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid))
    return 0;
  if (*(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 24) && *(_QWORD *)(a1 + 32) == *(_QWORD *)(a2 + 32))
    return 1;
  else
    return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100014E28()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100014E4C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100014E70(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100014E78@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_100006D18(*(_QWORD *)(v2 + 24), *a1);
  *a2 = result & 1;
  return result;
}

_QWORD *sub_100014EC0(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  id v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;
  uint64_t v11;
  NSString v12;
  void *v13;
  _QWORD *v14;
  id v15;
  _QWORD v17[5];
  _QWORD *v18;

  v2 = v1;
  v1[2] = 0;
  v1[3] = 0;
  v4 = objc_msgSend(objc_allocWithZone((Class)MADownloadOptions), "init");
  objc_msgSend(v4, "setAllowsCellularAccess:", 1);
  objc_msgSend(v4, "setRequiresPowerPluggedIn:", 1);
  objc_msgSend(v4, "setCanUseLocalCacheServer:", 1);
  if (qword_10003D610 != -1)
    swift_once(&qword_10003D610, sub_100017B44);
  v5 = objc_msgSend(v4, "setTimeoutIntervalForResource:", qword_10003D828);
  v2[4] = v4;
  v2[5] = 0xD000000000000024;
  v2[6] = 0x80000001000328E0;
  v2[7] = 0xD000000000000028;
  v2[8] = 0x8000000100032910;
  v6 = static Logger.mobileAsset.getter(v5);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "MobileAssetsHandler init", v9, 2u);
    swift_slowDealloc(v9, -1, -1);
  }

  v10 = objc_msgSend((id)objc_opt_self(BGSystemTaskScheduler), "sharedScheduler");
  v11 = v2[8];
  swift_bridgeObjectRetain(v11);
  v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  v17[4] = sub_100017EAC;
  v18 = v2;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  v17[2] = sub_1000152B8;
  v17[3] = &unk_1000399A8;
  v13 = _Block_copy(v17);
  v14 = v18;
  v15 = a1;
  swift_retain(v2);
  swift_release(v14);
  objc_msgSend(v10, "registerForTaskWithIdentifier:usingQueue:launchHandler:", v12, v15, v13);

  _Block_release(v13);
  return v2;
}

id sub_100015128(void *a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v4 = swift_retain_n(a2, 2);
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(12, -1);
    v8 = swift_slowAlloc(32, -1);
    v14 = v8;
    *(_DWORD *)v7 = 136380675;
    v9 = *(_QWORD *)(a2 + 56);
    v10 = *(_QWORD *)(a2 + 64);
    swift_bridgeObjectRetain(v10);
    v13 = sub_10000A7E4(v9, v10, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v7 + 4, v7 + 12);
    swift_release_n(a2, 2);
    swift_bridgeObjectRelease(v10);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "ScheduledActivity { activity=%{private}s }", v7, 0xCu);
    swift_arrayDestroy(v8, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1, -1);
    swift_slowDealloc(v7, -1, -1);
  }
  else
  {
    swift_release_n(a2, 2);
  }

  sub_100015BE4(v11);
  return objc_msgSend(a1, "setTaskCompleted");
}

void sub_1000152B8(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void);
  id v5;

  v4 = *(void (**)(void))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4();
  swift_release(v3);

}

NSObject *sub_100015308(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  id v8;
  NSString v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint8_t *v15;
  os_log_type_t v16;
  uint8_t *v17;
  id v18;
  NSObject *result;
  NSObject *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  __n128 v31;
  uint64_t v32;
  uint64_t v33;

  v7 = *(_QWORD *)(v3 + 48);
  v8 = objc_allocWithZone((Class)MAAssetQuery);
  swift_bridgeObjectRetain(v7);
  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  v10 = objc_msgSend(v8, "initWithType:", v9);

  if (!v10)
  {
    v10 = Logger.logObject.getter(v11);
    v16 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v10, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v16, "Failed to create query", v17, 2u);
      swift_slowDealloc(v17, -1, -1);
    }
    goto LABEL_20;
  }
  -[NSObject returnTypes:](v10, "returnTypes:", a1);
  -[NSObject setDoNotBlockBeforeFirstUnlock:](v10, "setDoNotBlockBeforeFirstUnlock:", 1);
  if (-[NSObject queryMetaDataSync](v10, "queryMetaDataSync") == (id)5)
  {
    v12 = Logger.logObject.getter(5);
    v13 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v12, v13))
    {
LABEL_19:

LABEL_20:
      return 0;
    }
    v14 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Missing entitlement!", v14, 2u);
    v15 = v14;
LABEL_17:
    swift_slowDealloc(v15, -1, -1);
    goto LABEL_19;
  }
  v18 = -[NSObject results](v10, "results");
  if (!v18)
  {
    v29 = swift_bridgeObjectRetain_n(a3, 2);
    v12 = Logger.logObject.getter(v29);
    LOBYTE(v25) = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v12, (os_log_type_t)v25))
    {
      v26 = (uint8_t *)swift_slowAlloc(12, -1);
      v27 = swift_slowAlloc(32, -1);
      v33 = v27;
      *(_DWORD *)v26 = 136380675;
      swift_bridgeObjectRetain(a3);
      v32 = sub_10000A7E4(a2, a3, &v33);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33, v26 + 4, v26 + 12);
      swift_bridgeObjectRelease_n(a3, 3);
      v28 = "query.results is nil { errorNote=\"%{private}s\" }";
      goto LABEL_16;
    }
LABEL_18:
    swift_bridgeObjectRelease_n(a3, 2);
    goto LABEL_19;
  }

  result = -[NSObject results](v10, "results");
  if (result)
  {
    v20 = result;
    v21 = sub_100015B68();
    v22 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v20, v21);

    if ((unint64_t)v22 >> 62)
    {
      if (v22 < 0)
        v30 = v22;
      else
        v30 = v22 & 0xFFFFFFFFFFFFFF8;
      v31 = swift_bridgeObjectRetain(v22);
      v23 = _CocoaArrayWrapper.endIndex.getter(v30, v31);
      swift_bridgeObjectRelease(v22);
    }
    else
    {
      v23 = *(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease(v22);
    if (v23)
      return v10;
    v24 = swift_bridgeObjectRetain_n(a3, 2);
    v12 = Logger.logObject.getter(v24);
    v25 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v12, (os_log_type_t)v25))
    {
      v26 = (uint8_t *)swift_slowAlloc(12, -1);
      v27 = swift_slowAlloc(32, -1);
      v33 = v27;
      *(_DWORD *)v26 = 136380675;
      swift_bridgeObjectRetain(a3);
      v32 = sub_10000A7E4(a2, a3, &v33);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33, v26 + 4, v26 + 12);
      swift_bridgeObjectRelease_n(a3, 3);
      v28 = "query.results.isEmpty! { errorNote=\"%{private}s\" }";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v12, (os_log_type_t)v25, v28, v26, 0xCu);
      swift_arrayDestroy(v27, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v27, -1, -1);
      v15 = v26;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

Swift::String_optional __swiftcall MobileAssetsHandler.getMobileAssetsConfigPath()()
{
  char **v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char **v10;
  void (**v11)(char *, uint64_t, uint64_t, char **);
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  NSObject *v17;
  void *object;
  id countAndFlagsBits;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (**v23)(char *, uint64_t, uint64_t, char **);
  uint64_t v24;
  id v25;
  uint64_t v26;
  char **v27;
  unint64_t v28;
  char **v29;
  void (**v30)(char *, uint64_t, uint64_t, char **);
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  unint64_t v35;
  Swift::String v36;
  void (*v37)(char *, uint64_t, uint64_t, char **);
  uint64_t v38;
  __n128 v39;
  uint64_t v40;
  void *v41;
  Swift::String_optional result;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char **v46;
  char *v47;
  void (**v48)(char *, uint64_t, uint64_t, char **);
  char **v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;

  v0 = (char **)type metadata accessor for URL.DirectoryHint(0);
  v1 = (unint64_t)*(v0 - 1);
  __chkstk_darwin(v0);
  v3 = (uint64_t)&v43 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_10000E354(&qword_10003D830);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v43 - v8;
  v10 = (char **)type metadata accessor for URL(0);
  v11 = (void (**)(char *, uint64_t, uint64_t, char **))*(v10 - 1);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v16 = (char *)&v43 - v15;
  v17 = sub_100015308(1, 0xD000000000000011, 0x8000000100032CD0);
  object = v17;
  if (!v17)
  {
    countAndFlagsBits = 0;
    goto LABEL_29;
  }
  v50 = v16;
  countAndFlagsBits = -[NSObject results](v17, "results");

  if (!countAndFlagsBits)
  {
LABEL_28:
    object = 0;
    goto LABEL_29;
  }
  v47 = v14;
  v20 = sub_100015B68();
  v21 = static Array._unconditionallyBridgeFromObjectiveC(_:)(countAndFlagsBits, v20);

  if (!((unint64_t)v21 >> 62))
  {
    v22 = *(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v22)
      goto LABEL_5;
    goto LABEL_26;
  }
LABEL_22:
  if (v21 < 0)
    v38 = v21;
  else
    v38 = v21 & 0xFFFFFFFFFFFFFF8;
  v39 = swift_bridgeObjectRetain(v21);
  v22 = _CocoaArrayWrapper.endIndex.getter(v38, v39);
  swift_bridgeObjectRelease(v21);
  if (!v22)
  {
LABEL_26:
    swift_bridgeObjectRelease(v21);
LABEL_27:
    countAndFlagsBits = 0;
    goto LABEL_28;
  }
LABEL_5:
  v48 = v11;
  v49 = v10;
  v44 = v3;
  v45 = v1;
  v46 = v0;
  v1 = v21 & 0xC000000000000001;
  swift_bridgeObjectRetain(v21);
  v3 = 4;
  v0 = &selRef_removeObject_;
  v10 = &selRef_removeObject_;
  while (1)
  {
    if (v1)
      v23 = (void (**)(char *, uint64_t, uint64_t, char **))specialized _ArrayBuffer._getElementSlowPath(_:)(v3 - 4, v21);
    else
      v23 = (void (**)(char *, uint64_t, uint64_t, char **))*(id *)(v21 + 8 * v3);
    v11 = v23;
    v24 = v3 - 3;
    if (__OFADD__(v3 - 4, 1))
    {
      __break(1u);
      goto LABEL_22;
    }
    if (objc_msgSend(v23, "wasLocal") && objc_msgSend(v11, "state") == (id)2)
      break;

    ++v3;
    if (v24 == v22)
    {
      swift_bridgeObjectRelease_n(v21, 2);
      v48[7](v9, 1, 1, v49);
LABEL_19:
      sub_100015BA4((uint64_t)v9);
      goto LABEL_27;
    }
  }
  swift_bridgeObjectRelease_n(v21, 2);
  v25 = objc_msgSend(v11, "getLocalUrl");

  if (v25)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v25);

    v26 = 0;
  }
  else
  {
    v26 = 1;
  }
  v28 = v45;
  v27 = v46;
  v30 = v48;
  v29 = v49;
  v31 = v44;
  v32 = v47;
  v48[7](v7, v26, 1, v49);
  sub_100017C7C((uint64_t)v7, (uint64_t)v9);
  if (((unsigned int (*)(char *, uint64_t, char **))v30[6])(v9, 1, v29) == 1)
    goto LABEL_19;
  v33 = v50;
  ((void (*)(char *, char *, char **))v30[4])(v50, v9, v29);
  type metadata accessor for Config(0);
  v51 = static Config.distributedConfigName.getter();
  v52 = v34;
  (*(void (**)(uint64_t, _QWORD, char **))(v28 + 104))(v31, enum case for URL.DirectoryHint.inferFromPath(_:), v27);
  v35 = sub_100017CC4();
  URL.appending<A>(component:directoryHint:)(&v51, v31, &type metadata for String, v35);
  (*(void (**)(uint64_t, char **))(v28 + 8))(v31, v27);
  swift_bridgeObjectRelease(v52);
  v36 = URL.path(percentEncoded:)(0);
  countAndFlagsBits = (id)v36._countAndFlagsBits;
  object = v36._object;
  v37 = v30[1];
  ((void (*)(char *, char **))v37)(v32, v29);
  ((void (*)(char *, char **))v37)(v33, v29);
LABEL_29:
  v40 = (uint64_t)countAndFlagsBits;
  v41 = object;
  result.value._object = v41;
  result.value._countAndFlagsBits = v40;
  return result;
}

unint64_t sub_100015B68()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003D838;
  if (!qword_10003D838)
  {
    v1 = objc_opt_self(MAAsset);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10003D838);
  }
  return result;
}

uint64_t sub_100015BA4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10000E354(&qword_10003D830);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_100015BE4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  NSString v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t aBlock[5];
  uint64_t v23;

  v2 = v1;
  v3 = Logger.logObject.getter(a1);
  v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Updating assets.", v5, 2u);
    swift_slowDealloc(v5, -1, -1);
  }

  v6 = swift_retain_n(v1, 2);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.debug.getter();
  if (!os_log_type_enabled(v7, v8))
  {
    swift_release_n(v2, 2);
    goto LABEL_7;
  }
  v9 = (uint8_t *)swift_slowAlloc(12, -1);
  v10 = swift_slowAlloc(32, -1);
  aBlock[0] = v10;
  *(_DWORD *)v9 = 136380675;
  v11 = objc_msgSend(*(id *)(v2 + 32), "tightSummaryIncludingAdditional:", 1);
  if (v11)
  {
    v12 = v11;
    v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v15 = v14;

    v21 = sub_10000A7E4(v13, v15, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, aBlock, v9 + 4, v9 + 12);
    swift_release_n(v2, 2);
    swift_bridgeObjectRelease(v15);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Options summary. { summary=%{private}s }", v9, 0xCu);
    swift_arrayDestroy(v10, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1, -1);
    swift_slowDealloc(v9, -1, -1);
LABEL_7:

    v16 = (void *)objc_opt_self(MAAsset);
    v17 = String._bridgeToObjectiveC()();
    v18 = *(_QWORD *)(v2 + 32);
    aBlock[4] = (uint64_t)sub_100017DEC;
    v23 = v2;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100017B08;
    aBlock[3] = (uint64_t)&unk_1000398E0;
    v19 = _Block_copy(aBlock);
    v20 = v23;
    swift_retain(v2);
    swift_release(v20);
    objc_msgSend(v16, "startCatalogDownload:options:then:", v17, v18, v19);
    _Block_release(v19);

    return;
  }
  swift_release(v2);
  __break(1u);
}

void sub_100015E90(uint64_t a1, _QWORD *a2)
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
  char *v17;
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  uint8_t *v21;
  void **v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char *v27;
  uint64_t v28;
  void **v29;
  uint8_t *v30;
  NSObject *v31;
  id v32;
  void *v33;
  unint64_t v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  void **v42;
  void **v43;
  NSObject *v44;
  int v45;
  uint64_t v46;
  void **v47;
  id v48;
  void *v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  id v53;
  void *v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  id v58;
  void *v59;
  char *v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  double v68;
  id v69;
  uint64_t v70;
  unsigned int v71;
  void **v72;
  NSObject *v73;
  int v74;
  uint64_t v75;
  id v76;
  void *v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  void ***v81;
  id v82;
  void *v83;
  uint64_t v84;
  unint64_t v85;
  unint64_t v86;
  id v87;
  void *v88;
  char *v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  unint64_t v95;
  NSObject *v96;
  uint64_t v97;
  NSObject *v98;
  os_log_type_t v99;
  uint64_t v100;
  void **v101;
  char *v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  void **v106;
  uint64_t v107;
  NSObject *v108;
  uint64_t v109;
  void **v110;
  id v111;
  void *v112;
  uint64_t v113;
  void (*v114)(void);
  char *v115;
  char *v116;
  unint64_t v117;
  uint64_t v118;
  unint64_t v119;
  unint64_t v120;
  NSObject *v121;
  NSObject *v122;
  os_log_type_t v123;
  uint64_t v124;
  void **v125;
  char *v126;
  uint64_t v127;
  unint64_t v128;
  uint64_t v129;
  void **v130;
  uint64_t v131;
  uint64_t v132;
  NSObject *v133;
  os_log_type_t v134;
  uint64_t v135;
  void **v136;
  id v137;
  void *v138;
  char *v139;
  uint64_t v140;
  char *v141;
  uint64_t v142;
  uint64_t v143;
  unint64_t v144;
  unint64_t v145;
  double *v146;
  void *v147;
  double *v148;
  void **v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  double *v153;
  void **v154;
  uint64_t v155;
  __n128 v156;
  NSObject *v157;
  int v158;
  char *v159;
  char *v160;
  __int128 v161;
  char *v162;
  char *v163;
  __int128 v164;
  char *v165;
  char *v166;
  __int128 v167;
  uint64_t v168;
  char *v169;
  uint64_t v170;
  _QWORD *v171;
  NSObject *v172;
  uint64_t v173;
  unint64_t v174;
  char *v175;
  uint64_t v176;
  void ***p_aBlock;
  void **v178;
  uint64_t v179;
  uint64_t v180;
  void **aBlock;
  uint64_t v182;
  void *v183;
  void *v184;
  void *v185;
  double *v186;

  v4 = type metadata accessor for URL(0);
  v170 = *(_QWORD *)(v4 - 8);
  v5 = __chkstk_darwin(v4);
  v162 = (char *)&v157 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v169 = (char *)&v157 - v7;
  v8 = sub_10000E354(&qword_10003D830);
  v9 = __chkstk_darwin(v8);
  v163 = (char *)&v157 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v9);
  v160 = (char *)&v157 - v12;
  v13 = __chkstk_darwin(v11);
  v159 = (char *)&v157 - v14;
  v15 = __chkstk_darwin(v13);
  v166 = (char *)&v157 - v16;
  v17 = (char *)a2 + OBJC_IVAR____TtC15audioanalyticsd19MobileAssetsHandler_logger;
  v18 = Logger.logObject.getter(v15);
  v19 = static os_log_type_t.debug.getter();
  v20 = os_log_type_enabled(v18, v19);
  v175 = v17;
  v176 = v4;
  v171 = a2;
  if (v20)
  {
    v21 = (uint8_t *)swift_slowAlloc(12, -1);
    v22 = (void **)swift_slowAlloc(32, -1);
    v180 = a1;
    aBlock = v22;
    *(_DWORD *)v21 = 136380675;
    type metadata accessor for MADownloadResult(0);
    v24 = String.init<A>(describing:)(&v180, v23);
    v26 = v25;
    v180 = sub_10000A7E4(v24, v25, (uint64_t *)&aBlock);
    v27 = v175;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v180, &aBlock, v21 + 4, v21 + 12);
    a2 = v171;
    v28 = v176;
    swift_bridgeObjectRelease(v26);
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Got the download metadata { reply=%{private}s }", v21, 0xCu);
    swift_arrayDestroy(v22, 1, (char *)&type metadata for Any + 8);
    v29 = v22;
    v17 = v27;
    swift_slowDealloc(v29, -1, -1);
    v30 = v21;
    v4 = v28;
    swift_slowDealloc(v30, -1, -1);
  }

  v31 = sub_100015308(4, 0xD00000000000001CLL, 0x8000000100032D80);
  if (!v31)
    return;
  v157 = v31;
  v32 = -[NSObject results](v31, "results");
  if (!v32)
    goto LABEL_72;
  v33 = v32;
  v34 = sub_100015B68();
  v35 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v33, v34);

  if ((unint64_t)v35 >> 62)
  {
LABEL_54:
    if (v35 < 0)
      v155 = v35;
    else
      v155 = v35 & 0xFFFFFFFFFFFFFF8;
    v156 = swift_bridgeObjectRetain(v35);
    v37 = _CocoaArrayWrapper.endIndex.getter(v155, v156);
    swift_bridgeObjectRelease(v35);
    if (v37)
      goto LABEL_7;
LABEL_58:

    swift_bridgeObjectRelease(v35);
    return;
  }
  v37 = *(_QWORD *)((v35 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v37)
    goto LABEL_58;
LABEL_7:
  v174 = v35 & 0xC000000000000001;
  p_aBlock = &aBlock;
  v38 = 4;
  *(_QWORD *)&v36 = 136381187;
  v167 = v36;
  v165 = (char *)&type metadata for Any + 8;
  *(_QWORD *)&v36 = 136380675;
  v164 = v36;
  *(_QWORD *)&v36 = 136380931;
  v161 = v36;
  v168 = v35;
  v173 = v37;
  while (1)
  {
    v40 = v38 - 4;
    if (v174)
    {
      v41 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v38 - 4, v35);
      v42 = (void **)(v38 - 3);
      if (__OFADD__(v40, 1))
        goto LABEL_53;
    }
    else
    {
      v41 = *(id *)(v35 + 8 * v38);
      v42 = (void **)(v38 - 3);
      if (__OFADD__(v40, 1))
      {
LABEL_53:
        __break(1u);
        goto LABEL_54;
      }
    }
    v179 = v38;
    v43 = (void **)v41;
    v44 = Logger.logObject.getter(v43);
    v45 = static os_log_type_t.debug.getter();
    if (!os_log_type_enabled(v44, (os_log_type_t)v45))
    {

      goto LABEL_22;
    }
    LODWORD(v172) = v45;
    v178 = v42;
    v46 = swift_slowAlloc(32, -1);
    v47 = (void **)swift_slowAlloc(96, -1);
    aBlock = v47;
    *(_DWORD *)v46 = v167;
    v48 = objc_msgSend(v43, "assetType");
    if (!v48)
      break;
    v49 = v48;
    v50 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v52 = v51;

    v180 = sub_10000A7E4(v50, v52, (uint64_t *)&aBlock);
    v35 = (uint64_t)p_aBlock;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v180, p_aBlock, v46 + 4, v46 + 12);

    swift_bridgeObjectRelease(v52);
    v4 = 2081;
    *(_WORD *)(v46 + 12) = 2081;
    v53 = objc_msgSend(v43, "assetId");
    if (!v53)
      goto LABEL_61;
    v54 = v53;
    v55 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v57 = v56;

    v180 = sub_10000A7E4(v55, v57, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v180, v35, v46 + 14, v46 + 22);

    swift_bridgeObjectRelease(v57);
    *(_WORD *)(v46 + 22) = 2081;
    v58 = objc_msgSend(v43, "assetServerUrl");
    if (!v58)
      goto LABEL_62;
    v59 = v58;
    v60 = v169;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    v61 = v170;
    v62 = v166;
    v4 = v176;
    (*(void (**)(char *, char *, uint64_t))(v170 + 32))(v166, v60, v176);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v61 + 56))(v62, 0, 1, v4);
    v63 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v61 + 48))(v62, 1, v4);
    if ((_DWORD)v63 == 1)
      goto LABEL_63;
    v64 = URL.absoluteString.getter(v63);
    v66 = v65;
    (*(void (**)(char *, uint64_t))(v61 + 8))(v62, v4);
    v180 = sub_10000A7E4(v64, v66, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v180, p_aBlock, v46 + 24, v46 + 32);

    swift_bridgeObjectRelease(v66);
    _os_log_impl((void *)&_mh_execute_header, v44, (os_log_type_t)v172, "Found asset to download. { assetType=%{private}s, assetId=%{private}s, url=%{private}s }", (uint8_t *)v46, 0x20u);
    swift_arrayDestroy(v47, 3, v165);
    swift_slowDealloc(v47, -1, -1);
    swift_slowDealloc(v46, -1, -1);

    a2 = v171;
    v17 = v175;
    v35 = v168;
    v37 = v173;
    v42 = v178;
LABEL_22:
    v68 = static Double.now()(v67);
    v69 = objc_msgSend(v43, "state");
    if (v69 == (id)4)
    {
      v97 = swift_retain_n(a2, 2);
      v98 = Logger.logObject.getter(v97);
      v99 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v98, v99))
      {
        v100 = swift_slowAlloc(12, -1);
        v101 = (void **)swift_slowAlloc(32, -1);
        aBlock = v101;
        *(_DWORD *)v100 = v164;
        v178 = v42;
        v102 = v17;
        v103 = a2[5];
        v104 = a2[6];
        swift_bridgeObjectRetain(v104);
        v105 = v103;
        v17 = v102;
        v42 = v178;
        *(_QWORD *)(v100 + 4) = sub_10000A7E4(v105, v104, (uint64_t *)&aBlock);
        swift_release_n(a2, 2);
        swift_bridgeObjectRelease(v104);
        _os_log_impl((void *)&_mh_execute_header, v98, v99, "Downloading { assetType=%{private}s }", (uint8_t *)v100, 0xCu);
        swift_arrayDestroy(v101, 1, (char *)&type metadata for Any + 8);
        v106 = v101;
        v4 = v176;
        swift_slowDealloc(v106, -1, -1);
        swift_slowDealloc(v100, -1, -1);
      }
      else
      {
        swift_release_n(a2, 2);
      }

      v39 = v179;
      v37 = v173;
      goto LABEL_9;
    }
    if (v69 != (id)2)
    {
      if (v69 != (id)1)
      {
        swift_retain_n(a2, 2);
        v121 = v43;
        v122 = Logger.logObject.getter(v121);
        v123 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v122, v123))
        {
          v124 = swift_slowAlloc(22, -1);
          v178 = (void **)swift_slowAlloc(32, -1);
          aBlock = v178;
          *(_DWORD *)v124 = v161;
          v172 = v121;
          v125 = v42;
          v126 = v17;
          v127 = a2[5];
          v128 = a2[6];
          swift_bridgeObjectRetain(v128);
          v129 = v127;
          v17 = v126;
          v42 = v125;
          *(_QWORD *)(v124 + 4) = sub_10000A7E4(v129, v128, (uint64_t *)&aBlock);
          swift_release_n(a2, 2);
          swift_bridgeObjectRelease(v128);
          *(_WORD *)(v124 + 12) = 2049;
          v121 = v172;
          *(_QWORD *)(v124 + 14) = -[NSObject state](v172, "state");

          _os_log_impl((void *)&_mh_execute_header, v122, v123, "Unknown asset state { assetType=%{private}s, state=%{private}ld }", (uint8_t *)v124, 0x16u);
          v130 = v178;
          swift_arrayDestroy(v178, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v130, -1, -1);
          v131 = v124;
          v4 = v176;
          swift_slowDealloc(v131, -1, -1);

        }
        else
        {
          swift_release_n(a2, 2);

        }
        v39 = v179;
        goto LABEL_9;
      }
      v70 = v37;
      v71 = objc_msgSend(v43, "nonUserInitiatedDownloadsAllowed");
      v72 = v43;
      v47 = v72;
      if (v71)
      {
        v43 = v72;
        v73 = Logger.logObject.getter(v43);
        v74 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v73, (os_log_type_t)v74))
        {
          v158 = v74;
          v172 = v73;
          v178 = v42;
          v75 = swift_slowAlloc(32, -1);
          v47 = (void **)swift_slowAlloc(96, -1);
          aBlock = v47;
          *(_DWORD *)v75 = v167;
          v76 = objc_msgSend(v43, "assetType");
          if (!v76)
            goto LABEL_66;
          v77 = v76;
          v78 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          v80 = v79;

          v180 = sub_10000A7E4(v78, v80, (uint64_t *)&aBlock);
          v81 = p_aBlock;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v180, p_aBlock, v75 + 4, v75 + 12);

          swift_bridgeObjectRelease(v80);
          *(_WORD *)(v75 + 12) = 2081;
          v82 = objc_msgSend(v43, "assetId");
          if (!v82)
            goto LABEL_67;
          v83 = v82;
          v84 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          v86 = v85;

          v180 = sub_10000A7E4(v84, v86, (uint64_t *)&aBlock);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v180, v81, v75 + 14, v75 + 22);

          swift_bridgeObjectRelease(v86);
          *(_WORD *)(v75 + 22) = 2081;
          v87 = objc_msgSend(v43, "assetServerUrl");
          if (!v87)
            goto LABEL_68;
          v88 = v87;
          v89 = v169;
          static URL._unconditionallyBridgeFromObjectiveC(_:)();

          v90 = v170;
          v91 = v159;
          v35 = v176;
          (*(void (**)(char *, char *, uint64_t))(v170 + 32))(v159, v89, v176);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v90 + 56))(v91, 0, 1, v35);
          v92 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v90 + 48))(v91, 1, v35);
          if ((_DWORD)v92 == 1)
            goto LABEL_69;
          v93 = URL.absoluteString.getter(v92);
          v95 = v94;
          (*(void (**)(char *, uint64_t))(v90 + 8))(v91, v35);
          v180 = sub_10000A7E4(v93, v95, (uint64_t *)&aBlock);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v180, p_aBlock, v75 + 24, v75 + 32);

          swift_bridgeObjectRelease(v95);
          v96 = v172;
          _os_log_impl((void *)&_mh_execute_header, v172, (os_log_type_t)v158, "Downloading asset. { assetType=%{private}s, assetId=%{private}s, url=%{private}s }", (uint8_t *)v75, 0x20u);
          swift_arrayDestroy(v47, 3, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v47, -1, -1);
          swift_slowDealloc(v75, -1, -1);

          a2 = v171;
          v35 = v168;
          v70 = v173;
          v17 = v175;
          v42 = v178;
        }
        else
        {

        }
        v146 = (double *)swift_allocObject(&unk_100039918, 40, 7);
        *((_QWORD *)v146 + 2) = a2;
        v146[3] = v68;
        *((_QWORD *)v146 + 4) = v43;
        v185 = sub_100017E68;
        v186 = v146;
        aBlock = _NSConcreteStackBlock;
        v182 = 1107296256;
        v183 = sub_1000175BC;
        v184 = &unk_100039930;
        v147 = _Block_copy(&aBlock);
        v148 = v186;
        v149 = v43;
        swift_retain(a2);
        swift_release(v148);
        objc_msgSend(v149, "attachProgressCallBack:", v147);
        _Block_release(v147);
        v150 = a2[4];
        v151 = swift_allocObject(&unk_100039968, 32, 7);
        *(_QWORD *)(v151 + 16) = v149;
        *(_QWORD *)(v151 + 24) = a2;
        v185 = sub_100017EA4;
        v186 = (double *)v151;
        aBlock = _NSConcreteStackBlock;
        v182 = 1107296256;
        v183 = sub_100017B08;
        v184 = &unk_100039980;
        v152 = _Block_copy(&aBlock);
        v153 = v186;
        v154 = v149;
        swift_retain(a2);
        swift_release(v153);
        objc_msgSend(v154, "startDownload:then:", v150, v152);

        _Block_release(v152);
        v39 = v179;
        v4 = v176;
        goto LABEL_52;
      }
      v132 = v35;
      v35 = v4;
      v133 = Logger.logObject.getter(v72);
      v134 = static os_log_type_t.debug.getter();
      if (!os_log_type_enabled(v133, v134))
      {

        v39 = v179;
        v4 = v35;
        v17 = v175;
        v35 = v132;
LABEL_52:
        v37 = v70;
        goto LABEL_9;
      }
      v135 = swift_slowAlloc(12, -1);
      v136 = (void **)swift_slowAlloc(32, -1);
      aBlock = v136;
      *(_DWORD *)v135 = v164;
      v137 = objc_msgSend(v47, "assetServerUrl");
      if (!v137)
        goto LABEL_70;
      v138 = v137;
      v178 = v42;
      v139 = v169;
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      v140 = v170;
      v141 = v160;
      (*(void (**)(char *, char *, uint64_t))(v170 + 32))(v160, v139, v35);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v140 + 56))(v141, 0, 1, v35);
      v142 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v140 + 48))(v141, 1, v35);
      if ((_DWORD)v142 == 1)
        goto LABEL_71;
      v143 = URL.absoluteString.getter(v142);
      v145 = v144;
      (*(void (**)(char *, uint64_t))(v140 + 8))(v141, v35);
      *(_QWORD *)(v135 + 4) = sub_10000A7E4(v143, v145, (uint64_t *)&aBlock);

      swift_bridgeObjectRelease(v145);
      _os_log_impl((void *)&_mh_execute_header, v133, v134, "Cannot download asset, as nonUserInitiatedDownloadsAllowed is false. { url=%{private}s }", (uint8_t *)v135, 0xCu);
      swift_arrayDestroy(v136, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v136, -1, -1);
      swift_slowDealloc(v135, -1, -1);

      v37 = v173;
      v39 = v179;
      v4 = v35;
      v35 = v168;
      goto LABEL_44;
    }
    v107 = v35;
    v35 = v43;
    v108 = Logger.logObject.getter(v35);
    v109 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v108, (os_log_type_t)v109))
    {
      v47 = (void **)v109;
      v178 = v42;
      v43 = (void **)swift_slowAlloc(12, -1);
      v110 = (void **)swift_slowAlloc(32, -1);
      aBlock = v110;
      *(_DWORD *)v43 = v164;
      v111 = objc_msgSend((id)v35, "getLocalUrl");
      if (!v111)
        goto LABEL_64;
      v112 = v111;
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      v113 = v170;
      v114 = *(void (**)(void))(v170 + 32);
      v115 = v163;
      v114();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v113 + 56))(v115, 0, 1, v4);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v113 + 48))(v115, 1, v4) == 1)
        goto LABEL_65;
      v116 = v162;
      ((void (*)(char *, char *, uint64_t))v114)(v162, v115, v4);
      v117 = sub_100017DF4();
      v118 = dispatch thunk of CustomStringConvertible.description.getter(v4, v117);
      v120 = v119;
      (*(void (**)(char *, uint64_t))(v113 + 8))(v116, v4);
      *(void **)((char *)v43 + 4) = (void *)sub_10000A7E4(v118, v120, (uint64_t *)&aBlock);

      swift_bridgeObjectRelease(v120);
      _os_log_impl((void *)&_mh_execute_header, v108, (os_log_type_t)v47, "Installed { assetType=%{private}s }", (uint8_t *)v43, 0xCu);
      swift_arrayDestroy(v110, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v110, -1, -1);
      swift_slowDealloc(v43, -1, -1);

      v35 = v168;
      v37 = v173;
      v39 = v179;
LABEL_44:
      v17 = v175;
      v42 = v178;
      a2 = v171;
      goto LABEL_9;
    }

    v39 = v179;
    v17 = v175;
    v35 = v107;
LABEL_9:
    v38 = v39 + 1;
    if (v42 == (void **)v37)
      goto LABEL_58;
  }

  __break(1u);
LABEL_61:

  __break(1u);
LABEL_62:

  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v170 + 56))(v166, 1, 1, v176);
  __break(1u);
LABEL_63:

  __break(1u);
LABEL_64:

  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v170 + 56))(v163, 1, 1, v4);
  __break(1u);
LABEL_65:

  __break(1u);
LABEL_66:

  __break(1u);
LABEL_67:

  __break(1u);
LABEL_68:

  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v170 + 56))(v159, 1, 1, v176);
  __break(1u);
LABEL_69:

  __break(1u);
LABEL_70:

  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v170 + 56))(v160, 1, 1, v35);
  __break(1u);
LABEL_71:

  __break(1u);
LABEL_72:
  __break(1u);
}

void sub_10001710C(void *a1, double a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  NSObject *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  NSObject *v34;
  id v35;
  uint64_t v36;

  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_10000E354(&qword_10003D830);
  v12 = __chkstk_darwin(v11);
  v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    v34 = Logger.logObject.getter(v12);
    v29 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v34, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, v29, "Progress callback, but nil update object.", v30, 2u);
      swift_slowDealloc(v30, -1, -1);
    }
    goto LABEL_13;
  }
  v34 = a1;
  v15 = a4;
  v16 = Logger.logObject.getter(v15);
  v17 = (uint64_t *)static os_log_type_t.debug.getter();
  if (!os_log_type_enabled(v16, (os_log_type_t)v17))
  {

LABEL_13:
    return;
  }
  v18 = swift_slowAlloc(52, -1);
  v19 = swift_slowAlloc(32, -1);
  v36 = v19;
  *(_DWORD *)v18 = 134219011;
  v20 = v18 + 4;
  v21 = static Double.now()(v19) - a2;
  if ((~*(_QWORD *)&v21 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (v21 <= -9.22337204e18)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v21 >= 9.22337204e18)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v32 = v19;
  v33 = (int)v17;
  v35 = (id)(uint64_t)v21;
  v17 = &v36;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36, v18 + 4, v18 + 12);
  LOWORD(v19) = 2048;
  *(_WORD *)(v18 + 12) = 2048;
  v20 = v18 + 14;
  if (qword_10003D610 != -1)
LABEL_17:
    swift_once(&qword_10003D610, sub_100017B44);
  v35 = (id)qword_10003D828;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, v17, v20, v18 + 22);
  *(_WORD *)(v18 + 22) = v19;
  v35 = -[NSObject totalWritten](v34, "totalWritten");
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, v17, v18 + 24, v18 + 32);
  *(_WORD *)(v18 + 32) = v19;
  v22 = -[NSObject totalExpected](v34, "totalExpected");

  v35 = v22;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, v17, v18 + 34, v18 + 42);

  *(_WORD *)(v18 + 42) = 2081;
  v23 = objc_msgSend(v15, "assetServerUrl");
  if (v23)
  {
    v24 = v23;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v14, v10, v7);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v14, 0, 1, v7);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v14, 1, v7) != 1)
    {
      v25 = URL.absoluteString.getter();
      v27 = v26;
      (*(void (**)(char *, uint64_t))(v8 + 8))(v14, v7);
      v35 = (id)sub_10000A7E4(v25, v27, &v36);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36, v18 + 44, v18 + 52);

      swift_bridgeObjectRelease(v27);
      _os_log_impl((void *)&_mh_execute_header, v16, (os_log_type_t)v33, "Progress callback. { runningTime=%ld, timeout=%ld, totalWritten=%lld, totalExpected=%lld, url=%{private}s }", (uint8_t *)v18, 0x34u);
      v28 = v32;
      swift_arrayDestroy(v32, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v28, -1, -1);
      swift_slowDealloc(v18, -1, -1);

      return;
    }
  }
  else
  {

    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v14, 1, 1, v7);
    __break(1u);
  }

  __break(1u);
}

void sub_1000175BC(uint64_t a1, void *a2)
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

void sub_100017610(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint8_t *v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100017970(a2);
  v12 = v10;
  if (a1)
  {
    static Logger.mobileAsset.getter();
    swift_bridgeObjectRetain(v12);
    v14 = Logger.logObject.getter(v13);
    v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = swift_slowAlloc(22, -1);
      v31 = swift_slowAlloc(64, -1);
      v33 = v31;
      *(_DWORD *)v16 = 136380931;
      swift_bridgeObjectRetain(v12);
      v32 = sub_10000A7E4(v11, v12, &v33);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33, v16 + 4, v16 + 12);
      swift_bridgeObjectRelease_n(v12, 3);
      *(_WORD *)(v16 + 12) = 2081;
      v32 = a1;
      type metadata accessor for MADownloadResult(0);
      v18 = String.init<A>(describing:)(&v32, v17);
      v20 = v19;
      v32 = sub_10000A7E4(v18, v19, &v33);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33, v16 + 14, v16 + 22);
      swift_bridgeObjectRelease(v20);
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Download failed. { url=%{private}s, result=%{private}s }", (uint8_t *)v16, 0x16u);
      v21 = v31;
      swift_arrayDestroy(v31, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v21, -1, -1);
      swift_slowDealloc(v16, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v12, 2);
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else
  {
    swift_bridgeObjectRetain(v10);
    v23 = Logger.logObject.getter(v22);
    v24 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v23, (os_log_type_t)v24))
    {
      v25 = (uint8_t *)swift_slowAlloc(12, -1);
      v26 = swift_slowAlloc(32, -1);
      v33 = v26;
      *(_DWORD *)v25 = 136380675;
      swift_bridgeObjectRetain(v12);
      v32 = sub_10000A7E4(v11, v12, &v33);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33, v25 + 4, v25 + 12);
      swift_bridgeObjectRelease_n(v12, 3);
      _os_log_impl((void *)&_mh_execute_header, v23, (os_log_type_t)v24, "Downloaded asset. Calling downloadedCallback. { url=%{private}s }", v25, 0xCu);
      swift_arrayDestroy(v26, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v26, -1, -1);
      swift_slowDealloc(v25, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n(v12, 2);
    }

    v27 = *(void (**)(uint64_t))(a3 + 16);
    if (v27)
    {
      v28 = *(_QWORD *)(a3 + 24);
      v29 = swift_retain(v28);
      v27(v29);
      sub_100017D08((uint64_t)v27, v28);
    }
  }
}

uint64_t sub_100017970(void *a1)
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
  char *v11;
  id v12;
  void *v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v2 = sub_10000E354(&qword_10003D830);
  __chkstk_darwin(v2);
  v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v18 - v10;
  v12 = objc_msgSend(a1, "assetServerUrl");
  if (!v12)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
    goto LABEL_5;
  }
  v13 = v12;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  v14 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
  v14(v4, v9, v5);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
LABEL_5:
    sub_100015BA4((uint64_t)v4);
    return 560753006;
  }
  v15 = ((uint64_t (*)(char *, char *, uint64_t))v14)(v11, v4, v5);
  v16 = URL.absoluteString.getter(v15);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  return v16;
}

uint64_t sub_100017B08(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v4(a2);
  return swift_release(v3);
}

void sub_100017B44()
{
  double v0;

  v0 = static Double.minutes(_:)(30.0);
  if ((~*(_QWORD *)&v0 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v0 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v0 < 9.22337204e18)
  {
    qword_10003D828 = (uint64_t)v0;
    return;
  }
LABEL_7:
  __break(1u);
}

uint64_t MobileAssetsHandler.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_100017D08(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 64));
  v1 = v0 + OBJC_IVAR____TtC15audioanalyticsd19MobileAssetsHandler_logger;
  v2 = type metadata accessor for Logger(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t MobileAssetsHandler.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_100017D08(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 64));
  v1 = v0 + OBJC_IVAR____TtC15audioanalyticsd19MobileAssetsHandler_logger;
  v2 = type metadata accessor for Logger(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_100017C7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000E354(&qword_10003D830);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_100017CC4()
{
  unint64_t result;

  result = qword_10003D840;
  if (!qword_10003D840)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10003D840);
  }
  return result;
}

uint64_t sub_100017D08(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_100017D18()
{
  return type metadata accessor for MobileAssetsHandler(0);
}

uint64_t type metadata accessor for MobileAssetsHandler(uint64_t a1)
{
  uint64_t result;

  result = qword_10003D878;
  if (!qword_10003D878)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for MobileAssetsHandler);
  return result;
}

uint64_t sub_100017D5C(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[5];

  v4[0] = &unk_100031CB8;
  v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[2] = &unk_100031CD0;
  v4[3] = &unk_100031CD0;
  result = type metadata accessor for Logger(319);
  if (v3 <= 0x3F)
  {
    v4[4] = *(_QWORD *)(result - 8) + 64;
    result = swift_updateClassMetadata2(a1, 256, 5, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

void sub_100017DEC(uint64_t a1)
{
  _QWORD *v1;

  sub_100015E90(a1, v1);
}

unint64_t sub_100017DF4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003D950;
  if (!qword_10003D950)
  {
    v1 = type metadata accessor for URL(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for URL, v1);
    atomic_store(result, (unint64_t *)&qword_10003D950);
  }
  return result;
}

uint64_t sub_100017E3C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 40, 7);
}

void sub_100017E68(void *a1)
{
  uint64_t v1;

  sub_10001710C(a1, *(double *)(v1 + 24), *(_QWORD *)(v1 + 16), *(void **)(v1 + 32));
}

uint64_t sub_100017E78()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

void sub_100017EA4(uint64_t a1)
{
  uint64_t v1;

  sub_100017610(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

id sub_100017EAC(void *a1)
{
  uint64_t v1;

  return sub_100015128(a1, v1);
}

uint64_t sub_100017ECC()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 48));
  swift_weakDestroy(v0 + 56);
  return swift_deallocClassInstance(v0, 64, 7);
}

uint64_t sub_100017F00(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = swift_weakLoadStrong(*v1 + 56);
  if (result)
  {
    v4 = result;
    sub_100007FF4(a1);
    *(_WORD *)(v4 + 64) = a1;
    return swift_release(v4);
  }
  return result;
}

uint64_t (*sub_100017F4C(uint64_t *a1))(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  __int16 *v3;
  uint64_t Strong;
  __int16 v5;

  v2 = *v1;
  *a1 = *v1;
  v3 = (__int16 *)(a1 + 1);
  Strong = swift_weakLoadStrong(v2 + 56);
  if (Strong)
  {
    v5 = *(_WORD *)(Strong + 64);
    swift_release(Strong);
  }
  else
  {
    v5 = -1;
  }
  *v3 = v5;
  return sub_100017F9C;
}

uint64_t sub_100017F9C(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;

  v1 = *(unsigned __int16 *)(a1 + 8);
  result = swift_weakLoadStrong(*(_QWORD *)a1 + 56);
  if (result)
  {
    v3 = result;
    sub_100007FF4(v1);
    *(_WORD *)(v3 + 64) = v1;
    return swift_release(v3);
  }
  return result;
}

uint64_t sub_100017FE8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 16);
  swift_bridgeObjectRetain(*(_QWORD *)(*(_QWORD *)v0 + 24));
  return v1;
}

uint64_t sub_100018018()
{
  uint64_t v0;

  return *(unsigned int *)(*(_QWORD *)v0 + 44);
}

uint64_t sub_100018024(unint64_t a1)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;
  char v5;

  result = swift_weakLoadStrong(*v1 + 56);
  if (result)
  {
    v4 = result;
    v5 = sub_10000BF8C(a1);
    swift_release(v4);
    return v5 & 1;
  }
  return result;
}

uint64_t sub_10001806C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = swift_weakLoadStrong(*v1 + 56);
  if (result)
  {
    v4 = result;
    sub_1000258F8(a1);
    return swift_release(v4);
  }
  return result;
}

uint64_t sub_1000180B4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10000E354(&qword_10003DA70);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1000180F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t *v7;
  uint64_t *v8;
  int64_t i;
  char *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  int64_t v14;
  char *v15;
  uint64_t *v16;
  _QWORD *v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  int64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  char v33;
  uint64_t *v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  int64_t v38;
  uint64_t v39;
  unint64_t v40;
  void *v41;
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
    sub_10000E354(&qword_10003DA80);
    v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v2);
  }
  else
  {
    v3 = &_swiftEmptyDictionarySingleton;
  }
  v39 = v1 + 64;
  v4 = -1 << *(_BYTE *)(v1 + 32);
  if (-v4 < 64)
    v5 = ~(-1 << -(char)v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(v1 + 64);
  v38 = (unint64_t)(63 - v4) >> 6;
  v7 = &v44;
  v8 = &v46;
  swift_bridgeObjectRetain(v1);
  i = 0;
  v10 = (char *)&type metadata for Any + 8;
  if (v6)
    goto LABEL_10;
LABEL_11:
  v20 = i + 1;
  if (__OFADD__(i, 1))
    goto LABEL_35;
  if (v20 >= v38)
    goto LABEL_32;
  v21 = *(_QWORD *)(v39 + 8 * v20);
  v22 = i + 1;
  if (!v21)
  {
    v22 = i + 2;
    if (i + 2 >= v38)
      goto LABEL_32;
    v21 = *(_QWORD *)(v39 + 8 * v22);
    if (!v21)
    {
      v22 = i + 3;
      if (i + 3 >= v38)
        goto LABEL_32;
      v21 = *(_QWORD *)(v39 + 8 * v22);
      if (!v21)
      {
        v22 = i + 4;
        if (i + 4 >= v38)
          goto LABEL_32;
        v21 = *(_QWORD *)(v39 + 8 * v22);
        if (!v21)
        {
          v23 = i + 5;
          if (i + 5 < v38)
          {
            v21 = *(_QWORD *)(v39 + 8 * v23);
            if (v21)
            {
              v22 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              v22 = v23 + 1;
              if (__OFADD__(v23, 1))
                goto LABEL_36;
              if (v22 >= v38)
                break;
              v21 = *(_QWORD *)(v39 + 8 * v22);
              ++v23;
              if (v21)
                goto LABEL_26;
            }
          }
LABEL_32:
          sub_100014E70(v1);
          return;
        }
      }
    }
  }
LABEL_26:
  v6 = (v21 - 1) & v21;
  v19 = __clz(__rbit64(v21)) + (v22 << 6);
  for (i = v22; ; v19 = v18 | (i << 6))
  {
    v24 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v19);
    v25 = v24[1];
    v26 = *(void **)(*(_QWORD *)(v1 + 56) + 8 * v19);
    v42 = *v24;
    v43 = v25;
    v41 = v26;
    v27 = sub_100019C14();
    swift_bridgeObjectRetain(v25);
    v28 = v26;
    swift_dynamicCast(v7, &v41, v27, v10, 7);
    v29 = v42;
    v30 = v43;
    sub_100019C04(v7, v8);
    sub_100019C04(v8, v47);
    sub_100019C04(v47, &v45);
    v31 = sub_10000D9BC(v29, v30);
    v32 = v31;
    if ((v33 & 1) != 0)
    {
      v40 = v6;
      v11 = v8;
      v12 = v7;
      v13 = v1;
      v14 = i;
      v15 = v10;
      v16 = (uint64_t *)(v3[6] + 16 * v31);
      swift_bridgeObjectRelease(v16[1]);
      *v16 = v29;
      v16[1] = v30;
      v10 = v15;
      i = v14;
      v1 = v13;
      v7 = v12;
      v8 = v11;
      v6 = v40;
      v17 = (_QWORD *)(v3[7] + 32 * v32);
      sub_10000CC90(v17);
      sub_100019C04(&v45, v17);
      if (!v40)
        goto LABEL_11;
      goto LABEL_10;
    }
    if (v3[2] >= v3[3])
      break;
    *(_QWORD *)((char *)v3 + ((v31 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v31;
    v34 = (uint64_t *)(v3[6] + 16 * v31);
    *v34 = v29;
    v34[1] = v30;
    sub_100019C04(&v45, (_OWORD *)(v3[7] + 32 * v31));
    v35 = v3[2];
    v36 = __OFADD__(v35, 1);
    v37 = v35 + 1;
    if (v36)
      goto LABEL_34;
    v3[2] = v37;
    if (!v6)
      goto LABEL_11;
LABEL_10:
    v18 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
}

uint64_t sub_100018448(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char *v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  int64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  _OWORD v33[2];
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  _OWORD v37[2];
  _OWORD v38[3];
  _OWORD v39[2];
  __int128 v40;
  _OWORD v41[2];

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    sub_10000E354(&qword_10003DA78);
    v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v2);
  }
  else
  {
    v3 = &_swiftEmptyDictionarySingleton;
  }
  v29 = a1 + 64;
  v4 = -1 << *(_BYTE *)(a1 + 32);
  if (-v4 < 64)
    v5 = ~(-1 << -(char)v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v28 = (unint64_t)(63 - v4) >> 6;
  v7 = (char *)(v3 + 8);
  swift_bridgeObjectRetain(a1);
  result = swift_retain(v3);
  v9 = 0;
  while (1)
  {
    if (v6)
    {
      v12 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v13 = v12 | (v9 << 6);
      goto LABEL_28;
    }
    v14 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v14 >= v28)
      goto LABEL_37;
    v15 = *(_QWORD *)(v29 + 8 * v14);
    v16 = v9 + 1;
    if (!v15)
    {
      v16 = v9 + 2;
      if (v9 + 2 >= v28)
        goto LABEL_37;
      v15 = *(_QWORD *)(v29 + 8 * v16);
      if (!v15)
      {
        v16 = v9 + 3;
        if (v9 + 3 >= v28)
          goto LABEL_37;
        v15 = *(_QWORD *)(v29 + 8 * v16);
        if (!v15)
        {
          v16 = v9 + 4;
          if (v9 + 4 >= v28)
            goto LABEL_37;
          v15 = *(_QWORD *)(v29 + 8 * v16);
          if (!v15)
            break;
        }
      }
    }
LABEL_27:
    v6 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v16 << 6);
    v9 = v16;
LABEL_28:
    v18 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v13);
    v20 = *v18;
    v19 = v18[1];
    sub_10000AA6C(*(_QWORD *)(a1 + 56) + 32 * v13, (uint64_t)v41);
    *(_QWORD *)&v40 = v20;
    *((_QWORD *)&v40 + 1) = v19;
    v38[2] = v40;
    v39[0] = v41[0];
    v39[1] = v41[1];
    *(_QWORD *)&v38[0] = v20;
    *((_QWORD *)&v38[0] + 1) = v19;
    swift_bridgeObjectRetain(v19);
    swift_dynamicCast(&v30, v38, &type metadata for String, &type metadata for AnyHashable, 7);
    sub_100019C04(v39, v33);
    v34 = v30;
    v35 = v31;
    v36 = v32;
    sub_100019C04(v33, v37);
    v30 = v34;
    v31 = v35;
    v32 = v36;
    sub_100019C04(v37, v38);
    sub_100019C04(v38, &v34);
    result = AnyHashable._rawHashValue(seed:)(v3[5]);
    v21 = -1 << *((_BYTE *)v3 + 32);
    v22 = result & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)&v7[8 * (v22 >> 6)]) != 0)
    {
      v10 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)&v7[8 * (v22 >> 6)])) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v26 = v23 == v25;
        if (v23 == v25)
          v23 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)&v7[8 * v23];
      }
      while (v27 == -1);
      v10 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(_QWORD *)&v7[(v10 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v10;
    v11 = v3[6] + 40 * v10;
    *(_OWORD *)v11 = v30;
    *(_OWORD *)(v11 + 16) = v31;
    *(_QWORD *)(v11 + 32) = v32;
    result = (uint64_t)sub_100019C04(&v34, (_OWORD *)(v3[7] + 32 * v10));
    ++v3[2];
  }
  v17 = v9 + 5;
  if (v9 + 5 >= v28)
  {
LABEL_37:
    swift_release(v3);
    sub_100014E70(a1);
    return (uint64_t)v3;
  }
  v15 = *(_QWORD *)(v29 + 8 * v17);
  if (v15)
  {
    v16 = v9 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v16 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v16 >= v28)
      goto LABEL_37;
    v15 = *(_QWORD *)(v29 + 8 * v16);
    ++v17;
    if (v15)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

void sub_10001880C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t *v7;
  uint64_t *v8;
  int64_t i;
  char *v10;
  void *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  char *v16;
  uint64_t *v17;
  _QWORD *v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char v35;
  uint64_t *v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  int64_t v40;
  uint64_t v41;
  int64_t v42;
  uint64_t v43;
  _QWORD v44[2];
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  uint64_t v49;
  _OWORD v50[2];

  v1 = a1;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    sub_10000E354(&qword_10003DA80);
    v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v2);
  }
  else
  {
    v3 = &_swiftEmptyDictionarySingleton;
  }
  v41 = v1 + 64;
  v4 = -1 << *(_BYTE *)(v1 + 32);
  if (-v4 < 64)
    v5 = ~(-1 << -(char)v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(v1 + 64);
  v40 = (unint64_t)(63 - v4) >> 6;
  v7 = &v47;
  v8 = &v49;
  swift_bridgeObjectRetain(v1);
  i = 0;
  v10 = (char *)&type metadata for Any + 8;
  v11 = &type metadata for String;
  if (v6)
    goto LABEL_10;
LABEL_11:
  v20 = i + 1;
  if (__OFADD__(i, 1))
    goto LABEL_35;
  if (v20 >= v40)
    goto LABEL_32;
  v21 = *(_QWORD *)(v41 + 8 * v20);
  v22 = i + 1;
  if (!v21)
  {
    v22 = i + 2;
    if (i + 2 >= v40)
      goto LABEL_32;
    v21 = *(_QWORD *)(v41 + 8 * v22);
    if (!v21)
    {
      v22 = i + 3;
      if (i + 3 >= v40)
        goto LABEL_32;
      v21 = *(_QWORD *)(v41 + 8 * v22);
      if (!v21)
      {
        v22 = i + 4;
        if (i + 4 >= v40)
          goto LABEL_32;
        v21 = *(_QWORD *)(v41 + 8 * v22);
        if (!v21)
        {
          v23 = i + 5;
          if (i + 5 < v40)
          {
            v21 = *(_QWORD *)(v41 + 8 * v23);
            if (v21)
            {
              v22 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              v22 = v23 + 1;
              if (__OFADD__(v23, 1))
                goto LABEL_36;
              if (v22 >= v40)
                break;
              v21 = *(_QWORD *)(v41 + 8 * v22);
              ++v23;
              if (v21)
                goto LABEL_26;
            }
          }
LABEL_32:
          sub_100014E70(v1);
          return;
        }
      }
    }
  }
LABEL_26:
  v43 = (v21 - 1) & v21;
  v19 = __clz(__rbit64(v21)) + (v22 << 6);
  for (i = v22; ; v19 = __clz(__rbit64(v6)) | (i << 6))
  {
    v24 = 16 * v19;
    v25 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v19);
    v27 = *v25;
    v26 = v25[1];
    v28 = (uint64_t *)(*(_QWORD *)(v1 + 56) + v24);
    v29 = *v28;
    v30 = v28[1];
    v45 = v27;
    v46 = v26;
    v44[0] = v29;
    v44[1] = v30;
    swift_bridgeObjectRetain(v26);
    swift_bridgeObjectRetain(v30);
    swift_dynamicCast(v7, v44, v11, v10, 7);
    v31 = v45;
    v32 = v46;
    sub_100019C04(v7, v8);
    sub_100019C04(v8, v50);
    sub_100019C04(v50, &v48);
    v33 = sub_10000D9BC(v31, v32);
    v34 = v33;
    if ((v35 & 1) != 0)
    {
      v42 = i;
      v12 = v8;
      v13 = v7;
      v14 = v1;
      v15 = v11;
      v16 = v10;
      v17 = (uint64_t *)(v3[6] + 16 * v33);
      swift_bridgeObjectRelease(v17[1]);
      *v17 = v31;
      v17[1] = v32;
      v10 = v16;
      v11 = v15;
      v1 = v14;
      v7 = v13;
      v8 = v12;
      i = v42;
      v18 = (_QWORD *)(v3[7] + 32 * v34);
      sub_10000CC90(v18);
      sub_100019C04(&v48, v18);
      v6 = v43;
      if (!v43)
        goto LABEL_11;
      goto LABEL_10;
    }
    if (v3[2] >= v3[3])
      break;
    *(_QWORD *)((char *)v3 + ((v33 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v33;
    v36 = (uint64_t *)(v3[6] + 16 * v33);
    *v36 = v31;
    v36[1] = v32;
    sub_100019C04(&v48, (_OWORD *)(v3[7] + 32 * v33));
    v37 = v3[2];
    v38 = __OFADD__(v37, 1);
    v39 = v37 + 1;
    if (v38)
      goto LABEL_34;
    v3[2] = v39;
    v6 = v43;
    if (!v43)
      goto LABEL_11;
LABEL_10:
    v43 = (v6 - 1) & v6;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
}

void sub_100018B74()
{
  qword_10003E350 = (uint64_t)&_swiftEmptySetSingleton;
  word_10003E358 = 0;
}

uint64_t static MessageRuleResult.__derived_struct_equals(_:_:)(uint64_t a1, __int16 a2, uint64_t a3, int a4)
{
  return sub_100018BE0(a1, a3) & (((a2 & 1) == 0) ^ a4) & (((a2 & 0x100) == 0) ^ ((unsigned __int16)(a4 & 0x100) >> 8));
}

uint64_t sub_100018BE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t result;
  uint64_t v12;
  char *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t i;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, unint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  void (*v35)(char *, uint64_t);
  char *v36;
  uint64_t v37;
  uint64_t v38;
  int64_t v39;
  uint64_t v40;
  int64_t v41;
  uint64_t v42;
  uint64_t v43;

  v4 = type metadata accessor for Config.WorkerConfigs(0);
  v43 = *(_QWORD *)(v4 - 8);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v5);
  v10 = (char *)&v36 - v9;
  result = __chkstk_darwin(v8);
  v13 = (char *)&v36 - v12;
  if (a1 == a2)
    return 1;
  if (*(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v14 = 0;
  v15 = *(_QWORD *)(a1 + 56);
  v37 = a1;
  v38 = a1 + 56;
  v16 = 1 << *(_BYTE *)(a1 + 32);
  if (v16 < 64)
    v17 = ~(-1 << v16);
  else
    v17 = -1;
  v18 = v17 & v15;
  v39 = (unint64_t)(v16 + 63) >> 6;
  v42 = a2 + 56;
  v36 = (char *)&v36 - v12;
  if (!v18)
    goto LABEL_9;
LABEL_7:
  v40 = (v18 - 1) & v18;
  v41 = v14;
  for (i = __clz(__rbit64(v18)) | (v14 << 6); ; i = __clz(__rbit64(v21)) + (v22 << 6))
  {
    v24 = v43;
    v25 = *(_QWORD *)(v43 + 72);
    v26 = *(void (**)(char *, unint64_t, uint64_t))(v43 + 16);
    v26(v13, *(_QWORD *)(a1 + 48) + v25 * i, v4);
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v10, v13, v4);
    v27 = *(_QWORD *)(a2 + 40);
    v28 = sub_100019C50(&qword_10003DA90, (uint64_t)&protocol conformance descriptor for Config.WorkerConfigs);
    v29 = dispatch thunk of Hashable._rawHashValue(seed:)(v27, v4, v28);
    v30 = -1 << *(_BYTE *)(a2 + 32);
    v31 = v29 & ~v30;
    if (((*(_QWORD *)(v42 + ((v31 >> 3) & 0xFFFFFFFFFFFFF8)) >> v31) & 1) == 0)
    {
      (*(void (**)(char *, uint64_t))(v43 + 8))(v10, v4);
      return 0;
    }
    v32 = ~v30;
    while (1)
    {
      v26(v7, *(_QWORD *)(a2 + 48) + v31 * v25, v4);
      v33 = sub_100019C50(&qword_10003DA98, (uint64_t)&protocol conformance descriptor for Config.WorkerConfigs);
      v34 = dispatch thunk of static Equatable.== infix(_:_:)(v7, v10, v4, v33);
      v35 = *(void (**)(char *, uint64_t))(v43 + 8);
      v35(v7, v4);
      if ((v34 & 1) != 0)
        break;
      v31 = (v31 + 1) & v32;
      if (((*(_QWORD *)(v42 + ((v31 >> 3) & 0xFFFFFFFFFFFFF8)) >> v31) & 1) == 0)
      {
        v35(v10, v4);
        return 0;
      }
    }
    result = ((uint64_t (*)(char *, uint64_t))v35)(v10, v4);
    v13 = v36;
    a1 = v37;
    v18 = v40;
    v14 = v41;
    if (v40)
      goto LABEL_7;
LABEL_9:
    v20 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_35;
    }
    if (v20 >= v39)
      return 1;
    v21 = *(_QWORD *)(v38 + 8 * v20);
    v22 = v14 + 1;
    if (!v21)
    {
      v22 = v20 + 1;
      if (v20 + 1 >= v39)
        return 1;
      v21 = *(_QWORD *)(v38 + 8 * v22);
      if (!v21)
      {
        v22 = v20 + 2;
        if (v20 + 2 >= v39)
          return 1;
        v21 = *(_QWORD *)(v38 + 8 * v22);
        if (!v21)
        {
          v22 = v20 + 3;
          if (v20 + 3 >= v39)
            return 1;
          v21 = *(_QWORD *)(v38 + 8 * v22);
          if (!v21)
            break;
        }
      }
    }
LABEL_24:
    v40 = (v21 - 1) & v21;
    v41 = v22;
  }
  v23 = v20 + 4;
  if (v23 >= v39)
    return 1;
  v21 = *(_QWORD *)(v38 + 8 * v23);
  if (v21)
  {
    v22 = v23;
    goto LABEL_24;
  }
  while (1)
  {
    v22 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v22 >= v39)
      return 1;
    v21 = *(_QWORD *)(v38 + 8 * v22);
    ++v23;
    if (v21)
      goto LABEL_24;
  }
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_100018F40(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  int v5;

  v2 = *(unsigned __int8 *)(a1 + 8);
  v3 = *(unsigned __int8 *)(a1 + 9);
  v4 = *(unsigned __int8 *)(a2 + 8);
  v5 = *(unsigned __int8 *)(a2 + 9);
  return sub_100018BE0(*(_QWORD *)a1, *(_QWORD *)a2) & ~(v2 ^ v4) & ~(v3 ^ v5) & 1;
}

uint64_t destroy for MessageRuleResult(_QWORD *a1)
{
  return swift_bridgeObjectRelease(*a1);
}

uint64_t _s15audioanalyticsd17MessageRuleResultVwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = *a2;
  *(_QWORD *)a1 = *a2;
  *(_WORD *)(a1 + 8) = *((_WORD *)a2 + 4);
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t *assignWithCopy for MessageRuleResult(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *a2;
  v5 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *((_BYTE *)a1 + 8) = *((_BYTE *)a2 + 8);
  *((_BYTE *)a1 + 9) = *((_BYTE *)a2 + 9);
  return a1;
}

uint64_t initializeWithTake for MessageRuleResult(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_WORD *)(result + 8) = *((_WORD *)a2 + 4);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t *assignWithTake for MessageRuleResult(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;

  v4 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRelease(v4);
  *((_BYTE *)a1 + 8) = *((_BYTE *)a2 + 8);
  *((_BYTE *)a1 + 9) = *((_BYTE *)a2 + 9);
  return a1;
}

uint64_t getEnumTagSinglePayload for MessageRuleResult(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 10))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MessageRuleResult(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_WORD *)(result + 8) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 10) = 1;
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
    *(_BYTE *)(result + 10) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MessageRuleResult()
{
  return &type metadata for MessageRuleResult;
}

uint64_t sub_10001911C(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
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
  char *v26;
  uint64_t v27;
  unint64_t v28;
  BOOL v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  int v35;
  uint64_t (*v36)(char *, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  char *v41;
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
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  uint64_t (*v62)(char *, uint64_t, uint64_t);
  uint64_t v63;
  uint64_t (*v64)(char *, uint64_t);
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  Class isa;
  unsigned __int8 v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char v82;
  char v83;
  void (*v84)(char *, uint64_t);
  char *v85;
  uint64_t v86;
  BOOL v87;
  BOOL v88;
  char *v89;
  uint64_t v90;
  char v91;
  uint64_t result;
  _QWORD *v93;
  uint64_t v94;
  uint64_t v95;
  BOOL v96;
  _QWORD *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  char *v112;
  unint64_t v113;
  uint64_t v114;
  char *v115;
  char *v116;
  int v117;
  char *v118;
  char *v119;
  char *v120;
  uint64_t v121;
  unint64_t v122;
  int v123;
  int v124;
  int v125;
  int v126;
  _BOOL4 v127;
  uint64_t (*v128)(char *, unint64_t, uint64_t);
  uint64_t v129;
  uint64_t v130;
  char *v131;
  uint64_t v132;
  uint64_t v133;
  _QWORD v134[3];
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;

  v117 = a4;
  v132 = a3;
  v106 = type metadata accessor for Message.Metadata(0);
  v105 = *(_QWORD *)(v106 - 8);
  __chkstk_darwin(v106);
  v104 = (char *)&v103 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Message(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v103 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v8);
  v116 = (char *)&v103 - v12;
  __chkstk_darwin(v11);
  v14 = (char *)&v103 - v13;
  v15 = type metadata accessor for CommonConfigFields(0);
  v121 = *(_QWORD *)(v15 - 8);
  v16 = __chkstk_darwin(v15);
  v118 = (char *)&v103 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __chkstk_darwin(v16);
  v120 = (char *)&v103 - v19;
  __chkstk_darwin(v18);
  v119 = (char *)&v103 - v20;
  v133 = type metadata accessor for RouterConfig(0);
  v21 = *(_QWORD *)(v133 - 8);
  v22 = __chkstk_darwin(v133);
  v115 = (char *)&v103 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __chkstk_darwin(v22);
  v26 = (char *)&v103 - v25;
  v27 = Config.routerConfigs.getter(v24);
  v114 = *(_QWORD *)(v27 + 16);
  if (v114)
  {
    v28 = 0;
    v113 = v27 + ((*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80));
    v107 = (char *)&type metadata for Any + 8;
    v130 = a2;
    v112 = v10;
    v131 = v26;
    v109 = v7;
    v110 = v14;
    v108 = v15;
    v129 = v21;
    v111 = v27;
    do
    {
      if (v28 >= *(_QWORD *)(v27 + 16))
      {
        __break(1u);
        goto LABEL_87;
      }
      v31 = *(_QWORD *)(v21 + 72);
      v122 = v28;
      v128 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v21 + 16);
      v32 = v128(v26, v113 + v31 * v28, v133);
      v33 = v119;
      v34 = RouterConfig.commonFields.getter(v32);
      v35 = CommonConfigFields.audioServiceType.getter(v34);
      v36 = *(uint64_t (**)(char *, uint64_t))(v121 + 8);
      v37 = v36(v33, v15);
      if ((v35 & 0x10000) != 0)
      {
        v127 = 1;
      }
      else
      {
        sub_10000E30C(v132, (uint64_t)&v137);
        v38 = v138;
        if (v138)
        {
          v39 = v139;
          sub_10000CCB0(&v137, v138);
          v40 = (unsigned __int16)dispatch thunk of SessionProtocol.serviceType.getter(v38, v39);
          v37 = sub_10000CC90(&v137);
          v127 = v40 == (unsigned __int16)v35;
        }
        else
        {
          v37 = sub_10000E394((uint64_t)&v137);
          v127 = 0;
        }
      }
      v41 = v120;
      v42 = RouterConfig.commonFields.getter(v37);
      v43 = (_QWORD *)CommonConfigFields.clientProcessNames.getter(v42);
      v44 = v36(v41, v15);
      if (v43)
      {
        sub_10000E30C(v132, (uint64_t)&v137);
        v45 = v138;
        if (v138)
        {
          v46 = v139;
          sub_10000CCB0(&v137, v138);
          v47 = dispatch thunk of SessionProtocol.clientProcessName.getter(v45, v46);
          v49 = v48;
          sub_10000CC90(&v137);
          v50 = v43[2];
          if (v50)
          {
            if (v43[4] == v47 && v43[5] == v49 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
            {
LABEL_17:
              swift_bridgeObjectRelease(v43);
              v44 = swift_bridgeObjectRelease(v49);
              v126 = 0;
              goto LABEL_22;
            }
            if (v50 != 1)
            {
              if (v43[6] == v47 && v43[7] == v49)
                goto LABEL_17;
              result = _stringCompareWithSmolCheck(_:_:expecting:)();
              if ((result & 1) != 0)
                goto LABEL_17;
              if (v50 != 2)
              {
                v93 = v43 + 9;
                v94 = 2;
                while (1)
                {
                  v95 = v94 + 1;
                  if (__OFADD__(v94, 1))
                    break;
                  v96 = *(v93 - 1) == v47 && *v93 == v49;
                  if (v96 || (result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
                  {
                    swift_bridgeObjectRelease(v43);
                    v44 = swift_bridgeObjectRelease(v49);
                    v126 = 0;
                    goto LABEL_79;
                  }
                  v93 += 2;
                  ++v94;
                  if (v95 == v50)
                  {
                    swift_bridgeObjectRelease(v43);
                    v44 = swift_bridgeObjectRelease(v49);
                    v126 = 1;
LABEL_79:
                    v7 = v109;
                    v14 = v110;
                    v15 = v108;
                    goto LABEL_22;
                  }
                }
                __break(1u);
LABEL_89:
                __break(1u);
                return result;
              }
            }
          }
          swift_bridgeObjectRelease(v43);
          v44 = swift_bridgeObjectRelease(v49);
          v126 = 1;
        }
        else
        {
          swift_bridgeObjectRelease(v43);
          v44 = sub_10000E394((uint64_t)&v137);
          v126 = 1;
        }
      }
      else
      {
        v126 = 0;
      }
LABEL_22:
      v51 = v118;
      v52 = RouterConfig.commonFields.getter(v44);
      v53 = (_QWORD *)CommonConfigFields.hostApplicationDisplayIDs.getter(v52);
      v54 = v36(v51, v15);
      if (!v53)
        goto LABEL_29;
      sub_10000E30C(v132, (uint64_t)&v137);
      v55 = v138;
      if (!v138)
      {
        swift_bridgeObjectRelease(v53);
        v54 = sub_10000E394((uint64_t)&v137);
LABEL_31:
        v123 = 1;
        goto LABEL_33;
      }
      v56 = v139;
      sub_10000CCB0(&v137, v138);
      v57 = dispatch thunk of SessionProtocol.appName.getter(v55, v56);
      v59 = v58;
      sub_10000CC90(&v137);
      v60 = v53[2];
      if (v60)
      {
        if (v53[4] == v57 && v53[5] == v59 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
LABEL_28:
          swift_bridgeObjectRelease(v53);
          v54 = swift_bridgeObjectRelease(v59);
LABEL_29:
          v123 = 0;
          goto LABEL_33;
        }
        if (v60 != 1)
        {
          if (v53[6] == v57 && v53[7] == v59)
            goto LABEL_28;
          result = _stringCompareWithSmolCheck(_:_:expecting:)();
          if ((result & 1) != 0)
            goto LABEL_28;
          if (v60 != 2)
          {
            v97 = v53 + 9;
            v98 = 2;
            while (1)
            {
              v99 = v98 + 1;
              if (__OFADD__(v98, 1))
                goto LABEL_89;
              if (*(v97 - 1) == v57 && *v97 == v59)
                break;
              result = _stringCompareWithSmolCheck(_:_:expecting:)();
              if ((result & 1) != 0)
                break;
              v97 += 2;
              ++v98;
              if (v99 == v60)
              {
                swift_bridgeObjectRelease(v53);
                v54 = swift_bridgeObjectRelease(v59);
                v123 = 1;
LABEL_81:
                v14 = v110;
                goto LABEL_33;
              }
            }
            swift_bridgeObjectRelease(v53);
            v54 = swift_bridgeObjectRelease(v59);
            v123 = 0;
            goto LABEL_81;
          }
        }
        swift_bridgeObjectRelease(v53);
        v54 = swift_bridgeObjectRelease(v59);
        goto LABEL_31;
      }
      swift_bridgeObjectRelease(v53);
      v54 = swift_bridgeObjectRelease(v59);
      v123 = 1;
LABEL_33:
      v61 = RouterConfig.audioEventType.getter(v54);
      v62 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 16);
      v63 = v62(v14, a2, v6);
      if ((v61 & 0x10000) != 0)
        LOWORD(v61) = Message.type.getter(v63);
      v64 = *(uint64_t (**)(char *, uint64_t))(v7 + 8);
      v65 = v64(v14, v6);
      v125 = Message.type.getter(v65);
      v66 = RouterConfig.audioEventCategory.getter();
      v67 = v116;
      v68 = v62(v116, a2, v6);
      if ((v66 & 0x100000000) != 0)
        LODWORD(v66) = Message.category.getter(v68);
      v69 = v6;
      v70 = v64(v67, v6);
      v124 = Message.category.getter(v70);
      v71 = RouterConfig.predicate.getter();
      if (v71)
      {
        v72 = (void *)v71;
        v73 = (void *)objc_opt_self(PredicateHelper);
        v74 = Message.flattenToAnyDictionary()();
        v75 = sub_100018448(v74);
        swift_bridgeObjectRelease(v74);
        isa = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v75);
        v77 = objc_msgSend(v73, "evaluatePredicate:with:", v72, isa);

      }
      else
      {
        v77 = 1;
      }
      v78 = v115;
      sub_10000E30C(v132, (uint64_t)&v137);
      if ((v117 & 1) != 0)
      {
        sub_10000E394((uint64_t)&v137);
        v26 = v131;
        v79 = v128(v78, (unint64_t)v131, v133);
LABEL_44:
        v83 = RouterConfig.broadcast.getter(v79);
        goto LABEL_47;
      }
      sub_10000E30C((uint64_t)&v137, (uint64_t)v134);
      v80 = v135;
      if (v135)
      {
        v81 = v136;
        sub_10000CCB0(v134, v135);
        v82 = dispatch thunk of SessionProtocol.isSingleMessageSession.getter(v80, v81);
        sub_10000E394((uint64_t)&v137);
        sub_10000CC90(v134);
        v26 = v131;
        v79 = v128(v78, (unint64_t)v131, v133);
        if ((v82 & 1) != 0)
          goto LABEL_44;
      }
      else
      {
        sub_10000E394((uint64_t)&v137);
        sub_10000E394((uint64_t)v134);
        v26 = v131;
        v128(v78, (unint64_t)v131, v133);
      }
      v83 = 0;
LABEL_47:
      v84 = *(void (**)(char *, uint64_t))(v129 + 8);
      v84(v78, v133);
      v85 = v112;
      v86 = v62(v112, v130, v69);
      if ((v83 & 1) != 0)
      {
        v87 = (_DWORD)v66 != v124;
        v88 = (unsigned __int16)v61 != (unsigned __int16)v125;
        v89 = v104;
        v90 = Message.metadata.getter(v86);
        Message.Metadata.isBroadcast.getter(v90);
        (*(void (**)(char *, uint64_t))(v105 + 8))(v89, v106);
        v64(v85, v69);
        v91 = v88 | ~v127 | v87;
        v26 = v131;
        v6 = v69;
        if (!((v123 | v126) & 1 | v91 & 1 | ((v77 & 1) == 0)))
        {
LABEL_84:
          v102 = swift_bridgeObjectRelease(v111);
          v101 = RouterConfig.workers.getter(v102);
          RouterConfig.discard.getter();
          v84(v26, v133);
          return v101;
        }
      }
      else
      {
        v29 = (_DWORD)v66 != v124;
        v30 = (unsigned __int16)v61 != (unsigned __int16)v125;
        v64(v85, v69);
        v6 = v69;
        if (!((v126 | v123) & 1 | (v30 || !v127 || v29 || (v77 & 1) == 0)))
          goto LABEL_84;
      }
      v28 = v122 + 1;
      v84(v26, v133);
      v21 = v129;
      a2 = v130;
      v7 = v109;
      v14 = v110;
      v15 = v108;
      v27 = v111;
    }
    while (v28 != v114);
  }
  swift_bridgeObjectRelease(v27);
  if (qword_10003D618 != -1)
LABEL_87:
    swift_once(&qword_10003D618, sub_100018B74);
  v101 = qword_10003E350;
  swift_bridgeObjectRetain(qword_10003E350);
  return v101;
}

_OWORD *sub_100019C04(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_100019C14()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003DA88;
  if (!qword_10003DA88)
  {
    v1 = objc_opt_self(NSNumber);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10003DA88);
  }
  return result;
}

uint64_t sub_100019C50(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for Config.WorkerConfigs(255);
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100019C90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v5;
  char v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (*(_QWORD *)(a2 + 16) && (v5 = sub_10002326C(a1), (v6 & 1) != 0))
  {
    v7 = v5;
    v8 = *(_QWORD *)(a2 + 56);
    v9 = type metadata accessor for FeatureState(0);
    v10 = *(_QWORD *)(v9 - 8);
    sub_100006978(v8 + *(_QWORD *)(v10 + 72) * v7, a3, type metadata accessor for FeatureState);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56);
    v12 = a3;
    v13 = 0;
    v14 = v9;
  }
  else
  {
    v14 = type metadata accessor for FeatureState(0);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56);
    v12 = a3;
    v13 = 1;
  }
  return v11(v12, v13, 1, v14);
}

char *sub_100019D38(void *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t, uint64_t);
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  NSString v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  id v53;
  id v54;
  _QWORD *v55;
  Swift::String_optional v56;
  _QWORD *v57;
  _QWORD *v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void **v74;
  id v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  _QWORD *v87;
  char *v88;
  uint64_t v89;
  _QWORD *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  BOOL v94;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  NSObject *v105;
  os_log_type_t v106;
  uint8_t *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  char v114;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  NSObject *v122;
  os_log_type_t v123;
  uint8_t *v124;
  objc_class *ObjectType;
  void (*v126)(char *, uint64_t, uint64_t);
  uint64_t v127;
  uint64_t v128;
  unint64_t v129;
  uint64_t v130;
  unint64_t v131;
  char *v132;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  unint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  _QWORD v141[3];
  objc_super v142;

  v134 = a1;
  ObjectType = (objc_class *)swift_getObjectType(v1);
  *(_QWORD *)&v1[OBJC_IVAR____TtC15audioanalyticsd6Server_systemMonitor] = 0;
  v133 = OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue;
  v135 = sub_10000F8F8(0, (unint64_t *)&qword_10003D640, OS_dispatch_queue_ptr);
  v2 = type metadata accessor for DispatchQoS(0);
  v3 = *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64);
  __chkstk_darwin(v2);
  v130 = v3;
  v131 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = (char *)&ObjectType - v131;
  v132 = v1;
  static DispatchQoS.default.getter();
  v5 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  v137 = *(_QWORD *)(*(_QWORD *)(v5 - 8) + 64);
  __chkstk_darwin(v5);
  v136 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
  v7 = (char *)&ObjectType - v136;
  v141[0] = _swiftEmptyArrayStorage;
  v9 = sub_100006818((unint64_t *)&unk_10003DBF0, v8, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  v138 = v9;
  v10 = sub_10000E354(&qword_10003D648);
  v140 = v10;
  v139 = sub_10000AD58((unint64_t *)&qword_10003DC00, &qword_10003D648);
  dispatch thunk of SetAlgebra.init<A>(_:)(v141, v10, v139, v5, v9);
  v11 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v12 = *(_QWORD *)(v11 - 8);
  v127 = v11;
  v13 = *(_QWORD *)(v12 + 64);
  __chkstk_darwin(v11);
  v14 = (v13 + 15) & 0xFFFFFFFFFFFFFFF0;
  v128 = v13;
  v129 = v14;
  v15 = enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:);
  v126 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 104);
  ((void (*)(char *, _QWORD))v126)((char *)&ObjectType - v14, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:));
  v17 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD000000000000030, 0x8000000100033030, v4, v7, (char *)&ObjectType - v14, 0);
  *(_QWORD *)&v1[v133] = v17;
  v18 = OBJC_IVAR____TtC15audioanalyticsd6Server_mobileAssetsQueue;
  v19 = __chkstk_darwin(v17);
  v20 = v131;
  v21 = static DispatchQoS.background.getter(v19);
  __chkstk_darwin(v21);
  v22 = (char *)&ObjectType - v136;
  v141[0] = _swiftEmptyArrayStorage;
  v23 = dispatch thunk of SetAlgebra.init<A>(_:)(v141, v140, v139, v5, v138);
  __chkstk_darwin(v23);
  v24 = (char *)&ObjectType - v14;
  v25 = (char *)&ObjectType - v14;
  v27 = v126;
  v26 = v127;
  v126(v25, v15, v127);
  v28 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD00000000000002ALL, 0x8000000100033070, (char *)&ObjectType - v20, v22, v24, 0);
  v133 = v18;
  v29 = v132;
  *(_QWORD *)&v132[v18] = v28;
  *(_QWORD *)&v29[OBJC_IVAR____TtC15audioanalyticsd6Server_clientServerInstances] = &_swiftEmptySetSingleton;
  *(_QWORD *)&v29[OBJC_IVAR____TtC15audioanalyticsd6Server_xpcConnections] = &_swiftEmptySetSingleton;
  *(_QWORD *)&v29[OBJC_IVAR____TtC15audioanalyticsd6Server_activeReporterIDs] = &_swiftEmptySetSingleton;
  v30 = OBJC_IVAR____TtC15audioanalyticsd6Server_clientConnectionMonitorQueue;
  v31 = __chkstk_darwin(v28);
  v32 = static DispatchQoS.unspecified.getter(v31);
  __chkstk_darwin(v32);
  v33 = (char *)&ObjectType - v136;
  v141[0] = _swiftEmptyArrayStorage;
  v34 = dispatch thunk of SetAlgebra.init<A>(_:)(v141, v140, v139, v5, v138);
  __chkstk_darwin(v34);
  v35 = (char *)&ObjectType - v129;
  v27((char *)&ObjectType - v129, v15, v26);
  *(_QWORD *)&v29[v30] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD000000000000031, 0x80000001000330A0, (char *)&ObjectType - v20, v33, v35, 0);
  v36 = v29;
  v37 = OBJC_IVAR____TtC15audioanalyticsd6Server_clientConnectionMonitorFrequency;
  v38 = static Double.seconds(_:)(5.0);
  *(_QWORD *)&v29[v37] = v39;
  v40 = static Logger.service.getter(v38);
  v41 = Logger.logObject.getter(v40);
  v42 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v41, v42))
  {
    v43 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v43 = 0;
    _os_log_impl((void *)&_mh_execute_header, v41, v42, "Starting Server.", v43, 2u);
    swift_slowDealloc(v43, -1, -1);
  }

  v44 = v134;
  if (v134)
  {
    v45 = v134;
  }
  else
  {
    static Constants.machServiceName.getter();
    v47 = v46;
    v48 = objc_allocWithZone((Class)NSXPCListener);
    v49 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v47);
    v45 = objc_msgSend(v48, "initWithMachServiceName:", v49);

  }
  v50 = v133;
  *(_QWORD *)&v36[OBJC_IVAR____TtC15audioanalyticsd6Server_listener] = v45;
  v51 = *(void **)&v36[v50];
  v52 = type metadata accessor for MobileAssetsHandler(0);
  swift_allocObject(v52, *(unsigned int *)(v52 + 48), *(unsigned __int16 *)(v52 + 52));
  v53 = v51;
  v54 = v44;
  v55 = sub_100014EC0(v53);
  v56 = MobileAssetsHandler.getMobileAssetsConfigPath()();
  if (!v56.value._object)
  {
    v58 = _swiftEmptyArrayStorage;
    if ((static DeviceUtilities.isInternalBuild.getter(v56.value._countAndFlagsBits) & 1) == 0)
      goto LABEL_17;
    goto LABEL_12;
  }
  v57 = sub_100027F20(0, 1, 1, _swiftEmptyArrayStorage);
  v58 = v57;
  v60 = v57[2];
  v59 = v57[3];
  if (v60 >= v59 >> 1)
  {
    v57 = sub_100027F20((_QWORD *)(v59 > 1), v60 + 1, 1, v57);
    v58 = v57;
  }
  v58[2] = v60 + 1;
  *(Swift::String_optional *)&v58[2 * v60 + 4] = v56;
  if ((static DeviceUtilities.isInternalBuild.getter(v57) & 1) != 0)
  {
LABEL_12:
    type metadata accessor for Config(0);
    v61 = static Config.assetConfigPath.getter();
    v63 = v62;
    if ((swift_isUniquelyReferenced_nonNull_native(v58) & 1) == 0)
      v58 = sub_100027F20(0, v58[2] + 1, 1, v58);
    v65 = v58[2];
    v64 = v58[3];
    if (v65 >= v64 >> 1)
      v58 = sub_100027F20((_QWORD *)(v64 > 1), v65 + 1, 1, v58);
    v58[2] = v65 + 1;
    v66 = &v58[2 * v65];
    v66[4] = v61;
    v66[5] = v63;
  }
LABEL_17:
  swift_bridgeObjectRetain(v58);
  v68 = sub_1000217B4(v67);
  swift_bridgeObjectRelease(v58);
  if (!v68)
  {
    v116 = type metadata accessor for Logger(0);
    v117 = *(_QWORD *)(v116 - 8);
    v118 = __chkstk_darwin(v116);
    v120 = (char *)&ObjectType - ((v119 + 15) & 0xFFFFFFFFFFFFFFF0);
    v121 = static Logger.config.getter(v118);
    v122 = Logger.logObject.getter(v121);
    v123 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v122, v123))
    {
      v124 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v124 = 0;
      _os_log_impl((void *)&_mh_execute_header, v122, v123, "Failed to find a config! Exiting.", v124, 2u);
      swift_slowDealloc(v124, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v117 + 8))(v120, v116);
    exit(-1);
  }
  swift_bridgeObjectRelease(v58);
  v69 = OBJC_IVAR____TtC15audioanalyticsd6Server_config;
  *(_QWORD *)&v36[OBJC_IVAR____TtC15audioanalyticsd6Server_config] = v68;
  type metadata accessor for Config(0);
  v70 = swift_retain(v68);
  v71 = Config.sortableConfigVersion.getter(v70);
  static Config.configVersion.setter(v71);
  v72 = qword_10003D620;
  swift_retain(v68);
  if (v72 != -1)
    swift_once(&qword_10003D620, sub_10002F994);
  Config.updateNeededPreviousFields(workers:)((Swift::OpaquePointer)qword_10003E368);
  v73 = swift_release(v68);
  v74 = (void **)static Constants.unknownReporterID.getter(v73);
  v75 = objc_msgSend(objc_allocWithZone((Class)NSProcessInfo), "init");
  v76 = objc_msgSend(v75, "processIdentifier");

  v77 = *(_QWORD *)&v36[v69];
  v78 = type metadata accessor for Session(0);
  swift_allocObject(v78, *(unsigned int *)(v78 + 48), *(unsigned __int16 *)(v78 + 52));
  swift_retain(v77);
  *(_QWORD *)&v36[OBJC_IVAR____TtC15audioanalyticsd6Server_singleMessageSession] = sub_1000098F0(v74, v76, 0xD000000000000014, 0x8000000100032F70, v77, 1);

  v142.receiver = v36;
  v142.super_class = ObjectType;
  v79 = (char *)objc_msgSendSuper2(&v142, "init");
  sub_10001A860();
  v80 = OBJC_IVAR____TtC15audioanalyticsd6Server_config;
  v81 = *(_QWORD *)&v79[OBJC_IVAR____TtC15audioanalyticsd6Server_config];
  swift_beginAccess(&static SystemMonitor.shared, v141, 1, 0);
  v82 = static SystemMonitor.shared;
  if (static SystemMonitor.shared)
  {
    v83 = v79;
    swift_retain(v81);
    v84 = swift_retain(v82);
    sub_10002B008(v84);
    swift_release(v82);
  }
  else
  {
    v85 = v79;
    swift_retain(v81);
  }
  v86 = type metadata accessor for SystemMonitor(0);
  v87 = (_QWORD *)swift_allocObject(v86, *(unsigned int *)(v86 + 48), *(unsigned __int16 *)(v86 + 52));
  v88 = v79;
  v89 = swift_retain(v81);
  v90 = sub_100020D5C(v89, v88, v87);
  v91 = static SystemMonitor.shared;
  static SystemMonitor.shared = (uint64_t)v90;
  swift_release(v81);

  swift_release(v91);
  type metadata accessor for TailspinWorker(0);
  v92 = *(_QWORD *)&v79[v80];
  v93 = swift_retain(v92);
  static TailspinWorker.initialize(config:)(v93);
  swift_release(v92);
  if (&type metadata accessor for ABCManager)
    v94 = &type metadata for ABCManager == 0;
  else
    v94 = 1;
  if (!v94 && &nominal type descriptor for ABCManager != 0 && &metaclass for ABCManager != 0)
  {
    type metadata accessor for ABCManager(0);
    v97 = *(_QWORD *)&v79[v80];
    v98 = swift_retain(v97);
    static ABCManager.initialize(config:)(v98);
    swift_release(v97);
  }
  v99 = *(void **)&v88[OBJC_IVAR____TtC15audioanalyticsd6Server_listener];
  objc_msgSend(v99, "setDelegate:", v88, ObjectType);
  objc_msgSend(v99, "activate");
  v100 = swift_allocObject(&unk_100039DD8, 24, 7);
  *(_QWORD *)(v100 + 16) = v88;
  v101 = v55[2];
  v102 = v55[3];
  v55[2] = sub_10002211C;
  v55[3] = v100;
  v103 = v88;
  v104 = sub_100017D08(v101, v102);
  v105 = Logger.logObject.getter(v104);
  v106 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v105, v106))
  {
    v107 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v107 = 0;
    _os_log_impl((void *)&_mh_execute_header, v105, v106, "Server created", v107, 2u);
    swift_slowDealloc(v107, -1, -1);
  }

  v108 = type metadata accessor for ServerConfig(0);
  v109 = *(_QWORD *)(v108 - 8);
  v110 = __chkstk_darwin(v108);
  v112 = (char *)&ObjectType - ((v111 + 15) & 0xFFFFFFFFFFFFFFF0);
  v113 = Config.serverConfig.getter(v110);
  v114 = ServerConfig.monitorClientConnections.getter(v113);
  (*(void (**)(char *, uint64_t))(v109 + 8))(v112, v108);
  if ((v114 & 1) != 0)
    sub_10001AD40();

  swift_release(v55);
  swift_release(v68);
  return v103;
}

void sub_10001A860()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD v9[5];
  uint64_t v10;

  v1 = objc_msgSend(objc_allocWithZone((Class)CLISignalHandler), "initWithSignal:", 15);
  v2 = swift_allocObject(&unk_10003A028, 24, 7);
  *(_QWORD *)(v2 + 16) = v0;
  v9[4] = sub_100022694;
  v10 = v2;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_100017B08;
  v9[3] = &unk_10003A040;
  v3 = _Block_copy(v9);
  v4 = v10;
  v5 = v0;
  swift_release(v4);
  objc_msgSend(v1, "setExecutionBlock:", v3);
  _Block_release(v3);
  v6 = Logger.logObject.getter(objc_msgSend(v1, "setEnabled:", 1));
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Listening for SIGTERM.", v8, 2u);
    swift_slowDealloc(v8, -1, -1);
  }

}

uint64_t sub_10001A9C4(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  void (*v22)(char *, uint64_t);
  char *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  void *v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  _QWORD v36[2];
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  _QWORD aBlock[5];
  _QWORD *v48;

  v3 = v2;
  v37 = a2;
  v38 = a1;
  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v44 = *(_QWORD *)(v4 - 8);
  v45 = v4;
  __chkstk_darwin(v4);
  v43 = (char *)v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchQoS(0);
  v41 = *(_QWORD *)(v6 - 8);
  v42 = v6;
  __chkstk_darwin(v6);
  v40 = (char *)v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchTimeInterval(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (_QWORD *)((char *)v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v39 = type metadata accessor for DispatchTime(0);
  v12 = *(_QWORD *)(v39 - 8);
  v13 = __chkstk_darwin(v39);
  v15 = (char *)v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __chkstk_darwin(v13);
  v18 = (char *)v36 - v17;
  v19 = Logger.logObject.getter(v16);
  v20 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "Scheduling server exit.", v21, 2u);
    swift_slowDealloc(v21, -1, -1);
  }

  v36[1] = *(_QWORD *)&v3[OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue];
  static DispatchTime.now()();
  *v11 = 1;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v9 + 104))(v11, enum case for DispatchTimeInterval.seconds(_:), v8);
  + infix(_:_:)(v15, v11);
  (*(void (**)(_QWORD *, uint64_t))(v9 + 8))(v11, v8);
  v22 = *(void (**)(char *, uint64_t))(v12 + 8);
  v23 = v15;
  v24 = v39;
  v22(v23, v39);
  v25 = (_QWORD *)swift_allocObject(&unk_100039EA0, 48, 7);
  v26 = v37;
  v25[2] = v3;
  v25[3] = v26;
  v25[4] = v38;
  v25[5] = 1;
  aBlock[4] = sub_1000221D0;
  v48 = v25;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006CEC;
  aBlock[3] = &unk_100039EB8;
  v27 = _Block_copy(aBlock);
  v28 = v3;
  v29 = v40;
  static DispatchQoS.unspecified.getter(v28);
  v46 = _swiftEmptyArrayStorage;
  v30 = sub_100006818((unint64_t *)&qword_10003D6D8, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v31 = sub_10000E354((uint64_t *)&unk_10003DBA0);
  v32 = sub_10000AD58((unint64_t *)&qword_10003D6E0, (uint64_t *)&unk_10003DBA0);
  v33 = v43;
  v34 = v45;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v46, v31, v32, v45, v30);
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v18, v29, v33, v27);
  _Block_release(v27);
  (*(void (**)(char *, uint64_t))(v44 + 8))(v33, v34);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v29, v42);
  v22(v18, v24);
  return swift_release(v48);
}

uint64_t sub_10001AD40()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void (*v15)(char *, uint64_t);
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[2];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD aBlock[5];
  uint64_t v28;

  v1 = type metadata accessor for DispatchWorkItemFlags(0);
  v25 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v3 = (char *)v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for DispatchQoS(0);
  v23 = *(_QWORD *)(v4 - 8);
  v24 = v4;
  __chkstk_darwin(v4);
  v6 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchTime(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v9);
  v14 = (char *)v22 - v13;
  v22[1] = *(_QWORD *)&v0[OBJC_IVAR____TtC15audioanalyticsd6Server_clientConnectionMonitorQueue];
  static DispatchTime.now()(v12);
  + infix(_:_:)(v11, *(double *)&v0[OBJC_IVAR____TtC15audioanalyticsd6Server_clientConnectionMonitorFrequency]);
  v15 = *(void (**)(char *, uint64_t))(v8 + 8);
  v15(v11, v7);
  v16 = swift_allocObject(&unk_100039E00, 24, 7);
  *(_QWORD *)(v16 + 16) = v0;
  aBlock[4] = sub_100022144;
  v28 = v16;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006CEC;
  aBlock[3] = &unk_100039E18;
  v17 = _Block_copy(aBlock);
  static DispatchQoS.unspecified.getter(v0);
  v26 = _swiftEmptyArrayStorage;
  v18 = sub_100006818((unint64_t *)&qword_10003D6D8, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v19 = sub_10000E354((uint64_t *)&unk_10003DBA0);
  v20 = sub_10000AD58((unint64_t *)&qword_10003D6E0, (uint64_t *)&unk_10003DBA0);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v26, v19, v20, v1, v18);
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v14, v6, v3, v17);
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v3, v1);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v6, v24);
  v15(v14, v7);
  return swift_release(v28);
}

uint64_t sub_10001AFBC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[2];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD aBlock[5];
  uint64_t v31;

  v2 = v1;
  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v28 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchQoS(0);
  v26 = *(_QWORD *)(v7 - 8);
  v27 = v7;
  __chkstk_darwin(v7);
  v9 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Message(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  __chkstk_darwin(v10);
  v13 = (char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25[1] = *(_QWORD *)(v2 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  v14 = swift_allocObject(&unk_100039B80, 24, 7);
  swift_unknownObjectWeakInit(v14 + 16, v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, v10);
  v15 = *(unsigned __int8 *)(v11 + 80);
  v16 = (v15 + 24) & ~v15;
  v17 = swift_allocObject(&unk_100039FD8, v16 + v12, v15 | 7);
  *(_QWORD *)(v17 + 16) = v14;
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v17 + v16, v13, v10);
  aBlock[4] = sub_100022664;
  v31 = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006CEC;
  aBlock[3] = &unk_100039FF0;
  v18 = _Block_copy(aBlock);
  v19 = swift_retain(v14);
  static DispatchQoS.unspecified.getter(v19);
  v29 = _swiftEmptyArrayStorage;
  v20 = sub_100006818((unint64_t *)&qword_10003D6D8, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v21 = sub_10000E354((uint64_t *)&unk_10003DBA0);
  v22 = sub_10000AD58((unint64_t *)&qword_10003D6E0, (uint64_t *)&unk_10003DBA0);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v29, v21, v22, v4, v20);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v9, v6, v18);
  _Block_release(v18);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v6, v4);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v27);
  v23 = v31;
  swift_release(v14);
  return swift_release(v23);
}

void sub_10001B250(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  __n128 v8;
  uint64_t Strong;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  _BYTE v16[24];

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  a1 += 16;
  v8 = swift_beginAccess(a1, v16, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(a1, v8);
  if (Strong)
  {
    v10 = (void *)Strong;
    sub_10001B380(a2);

  }
  else
  {
    v11 = static Logger.service.getter(0);
    v12 = Logger.logObject.getter(v11);
    v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Server is gone. {action=broadcast}", v14, 2u);
      swift_slowDealloc(v14, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

void sub_10001B380(uint64_t a1)
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
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  id v16;
  void (*v17)(_QWORD *, _QWORD);
  uint64_t *v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(char *, uint64_t);
  NSObject *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  _QWORD v58[2];
  char *v59;
  uint64_t v60;
  int64_t v61;
  uint64_t v62;
  void (*v63)(char *, uint64_t, uint64_t);
  uint64_t v64;
  char *v65;
  uint64_t v66;
  _QWORD aBlock[5];
  uint64_t v68;
  char v69[24];
  _QWORD v70[6];

  v2 = v1;
  v4 = type metadata accessor for Message(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)v58 - v9;
  v11 = type metadata accessor for DispatchPredicate(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (_QWORD *)((char *)v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = *(void **)(v2 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  *v14 = v15;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v12 + 104))(v14, enum case for DispatchPredicate.onQueue(_:), v11);
  v16 = v15;
  LOBYTE(v15) = _dispatchPreconditionTest(_:)(v14);
  (*(void (**)(_QWORD *, uint64_t))(v12 + 8))(v14, v11);
  if ((v15 & 1) == 0)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  v63 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v63(v10, a1, v4);
  v65 = v10;
  v17 = (void (*)(_QWORD *, _QWORD))Message.metadata.modify(aBlock);
  Message.Metadata.isBroadcast.setter(1);
  v17(aBlock, 0);
  v18 = (uint64_t *)(v2 + OBJC_IVAR____TtC15audioanalyticsd6Server_clientServerInstances);
  swift_beginAccess(v2 + OBJC_IVAR____TtC15audioanalyticsd6Server_clientServerInstances, v69, 0, 0);
  v19 = *v18;
  v20 = (*v18 & 0xC000000000000001) == 0;
  v64 = v5;
  if (v20)
  {
    v29 = -1 << *(_BYTE *)(v19 + 32);
    v30 = *(_QWORD *)(v19 + 56);
    v62 = v19 + 56;
    v31 = ~v29;
    v32 = -v29;
    if (v32 < 64)
      v33 = ~(-1 << v32);
    else
      v33 = -1;
    v28 = v33 & v30;
    swift_bridgeObjectRetain(v19);
    v26 = v31;
    v27 = 0;
  }
  else
  {
    if (v19 < 0)
      v21 = v19;
    else
      v21 = v19 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v19);
    v22 = __CocoaSet.makeIterator()(v21);
    v23 = type metadata accessor for ClientServerInstance(0);
    v24 = sub_100006818((unint64_t *)&unk_10003DBE0, type metadata accessor for ClientServerInstance, (uint64_t)&unk_100031C28);
    v25 = Set.Iterator.init(_cocoa:)(v70, v22, v23, v24);
    v19 = v70[0];
    v62 = v70[1];
    v26 = v70[2];
    v27 = v70[3];
    v28 = v70[4];
  }
  v58[0] = v2;
  v34 = 0;
  v60 = v19 & 0x7FFFFFFFFFFFFFFFLL;
  v58[1] = v26;
  v61 = (unint64_t)(v26 + 64) >> 6;
  v59 = (char *)&type metadata for Swift.AnyObject + 8;
  if (v19 < 0)
    goto LABEL_14;
  while (1)
  {
    if (v28)
    {
      v35 = (v28 - 1) & v28;
      v36 = __clz(__rbit64(v28)) | (v27 << 6);
      v37 = v27;
      goto LABEL_31;
    }
    v43 = v27 + 1;
    if (__OFADD__(v27, 1))
    {
      __break(1u);
      goto LABEL_39;
    }
    if (v43 >= v61)
      goto LABEL_34;
    v44 = *(_QWORD *)(v62 + 8 * v43);
    v37 = v27 + 1;
    if (!v44)
    {
      v37 = v27 + 2;
      if (v27 + 2 >= v61)
        goto LABEL_34;
      v44 = *(_QWORD *)(v62 + 8 * v37);
      if (!v44)
      {
        v37 = v27 + 3;
        if (v27 + 3 >= v61)
          goto LABEL_34;
        v44 = *(_QWORD *)(v62 + 8 * v37);
        if (!v44)
        {
          v37 = v27 + 4;
          if (v27 + 4 >= v61)
            goto LABEL_34;
          v44 = *(_QWORD *)(v62 + 8 * v37);
          if (!v44)
            break;
        }
      }
    }
LABEL_30:
    v35 = (v44 - 1) & v44;
    v36 = __clz(__rbit64(v44)) + (v37 << 6);
LABEL_31:
    v42 = *(_QWORD *)(*(_QWORD *)(v19 + 48) + 8 * v36);
    swift_retain(v42);
    if (!v42)
      goto LABEL_34;
    while (1)
    {
      v46 = ((uint64_t (*)(char *, char *, uint64_t))v63)(v8, v65, v4);
      v47 = static Constants.unknownReporterID.getter(v46);
      v48 = sub_100006D18((uint64_t)v8, v47);
      swift_release(v42);
      v25 = (_QWORD *)(*(uint64_t (**)(char *, uint64_t))(v64 + 8))(v8, v4);
      v34 |= v48;
      v27 = v37;
      v28 = v35;
      if ((v19 & 0x8000000000000000) == 0)
        break;
LABEL_14:
      v38 = __CocoaSet.Iterator.next()(v25);
      if (v38)
      {
        v39 = v38;
        v66 = v38;
        v40 = type metadata accessor for ClientServerInstance(0);
        swift_unknownObjectRetain(v39, v41);
        swift_dynamicCast(aBlock, &v66, v59, v40, 7);
        v42 = aBlock[0];
        swift_unknownObjectRelease(v39);
        v37 = v27;
        v35 = v28;
        if (v42)
          continue;
      }
      goto LABEL_34;
    }
  }
  v45 = v27 + 5;
  while (v61 != v45)
  {
    v44 = *(_QWORD *)(v62 + 8 * v45++);
    if (v44)
    {
      v37 = v45 - 1;
      goto LABEL_30;
    }
  }
LABEL_34:
  sub_100014E70(v19);
  if ((v34 & 1) != 0)
  {
    (*(void (**)(char *, uint64_t))(v64 + 8))(v65, v4);
    return;
  }
  v49 = *(_QWORD *)(v58[0] + OBJC_IVAR____TtC15audioanalyticsd6Server_singleMessageSession);
  sub_100004B54();
  v50 = v65;
  v51 = ((uint64_t (*)(char *, char *, uint64_t))v63)(v8, v65, v4);
  v52 = OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue;
  __chkstk_darwin(v51);
  v58[-2] = v49;
  v58[-1] = v8;
  OS_dispatch_queue.sync<A>(execute:)(aBlock, sub_100003EB4);
  v53 = *(void (**)(char *, uint64_t))(v64 + 8);
  v53(v8, v4);
  v54 = *(NSObject **)(v49 + v52);
  v55 = swift_allocObject(&unk_100039D88, 32, 7);
  *(_QWORD *)(v55 + 16) = sub_10001319C;
  *(_QWORD *)(v55 + 24) = v49;
  aBlock[4] = sub_10002269C;
  v68 = v55;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100005D54;
  aBlock[3] = &unk_100039DA0;
  v56 = _Block_copy(aBlock);
  v57 = v68;
  swift_retain(v49);
  swift_retain(v55);
  swift_release(v57);
  dispatch_sync(v54, v56);
  _Block_release(v56);
  LOBYTE(v54) = swift_isEscapingClosureAtFileLocation(v55, "", 111, 92, 24, 1);
  swift_release(v49);
  swift_release(v55);
  if ((v54 & 1) == 0)
  {
    v53(v50, v4);
    return;
  }
LABEL_40:
  __break(1u);
}

uint64_t sub_10001B960(uint64_t a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  uint64_t result;
  uint64_t v16;
  void *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD aBlock[5];
  uint64_t v31;

  v2 = v1;
  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v28 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = type metadata accessor for DispatchQoS(0);
  v7 = *(_QWORD *)(v27 - 8);
  __chkstk_darwin(v27);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for DispatchPredicate(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (id *)((char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = *(void **)&v2[OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue];
  *v13 = v14;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v11 + 104))(v13, enum case for DispatchPredicate.onQueue(_:), v10);
  v26 = v14;
  LOBYTE(v14) = _dispatchPreconditionTest(_:)(v13);
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v11 + 8))(v13, v10);
  if ((v14 & 1) != 0)
  {
    sub_100013A7C();
    v16 = swift_allocObject(&unk_100039CE8, 32, 7);
    *(_QWORD *)(v16 + 16) = v2;
    *(_QWORD *)(v16 + 24) = a1;
    aBlock[4] = sub_100022074;
    v31 = v16;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100006CEC;
    aBlock[3] = &unk_100039D00;
    v17 = _Block_copy(aBlock);
    v18 = v2;
    v19 = swift_retain(a1);
    static DispatchQoS.unspecified.getter(v19);
    v29 = _swiftEmptyArrayStorage;
    v20 = sub_100006818((unint64_t *)&qword_10003D6D8, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v21 = sub_10000E354((uint64_t *)&unk_10003DBA0);
    v22 = sub_10000AD58((unint64_t *)&qword_10003D6E0, (uint64_t *)&unk_10003DBA0);
    dispatch thunk of SetAlgebra.init<A>(_:)(&v29, v21, v22, v4, v20);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v9, v6, v17);
    _Block_release(v17);
    (*(void (**)(char *, uint64_t))(v28 + 8))(v6, v4);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v27);
    swift_release(v31);
    v23 = (uint64_t *)&v18[OBJC_IVAR____TtC15audioanalyticsd6Server_clientServerInstances];
    swift_beginAccess(&v18[OBJC_IVAR____TtC15audioanalyticsd6Server_clientServerInstances], aBlock, 0, 0);
    v24 = *v23;
    swift_bridgeObjectRetain(v24);
    v25 = sub_100025B5C(a1, v24);
    swift_bridgeObjectRelease(v24);
    return v25 & 1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10001BC2C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _BYTE v5[24];

  swift_beginAccess(a1 + OBJC_IVAR____TtC15audioanalyticsd6Server_clientServerInstances, v5, 33, 0);
  v3 = sub_100020188(a2);
  swift_endAccess(v5);
  return swift_release(v3);
}

uint64_t sub_10001BC8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  Swift::Bool v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  _BOOL4 v12;
  uint8_t *v13;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint8_t *v18;

  type metadata accessor for OsTransactionHandler(0);
  v7 = static OsTransactionHandler.shared.getter();
  v8 = OsTransactionHandler.inactive()();
  v9 = swift_release(v7);
  if (v8)
  {
LABEL_10:
    v15 = Logger.logObject.getter(v9);
    v16 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Exit requested, and no active transaction. Calling exit.", v17, 2u);
      swift_slowDealloc(v17, -1, -1);
    }

    exit(0);
  }
  if (__OFSUB__(a3, a4))
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.debug.getter();
  v12 = os_log_type_enabled(v10, v11);
  if (a3 - a4 <= a2)
  {
    if (v12)
    {
      v18 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Exit requested, and timeout reached. Calling exit.", v18, 2u);
      swift_slowDealloc(v18, -1, -1);
    }

    exit(0);
  }
  if (v12)
  {
    v13 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Exit requested, but active transactions. Will try again in 10 seconds.", v13, 2u);
    swift_slowDealloc(v13, -1, -1);
  }

  if (__OFADD__(a2, a4))
    goto LABEL_9;
  return sub_10001A9C4(a3, a2 + a4);
}

uint64_t sub_10001BE70(char *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[2];
  uint64_t v17;
  _QWORD *v18;
  _QWORD aBlock[5];
  uint64_t v20;

  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v17 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v4 = (char *)v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for DispatchQoS(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[1] = *(_QWORD *)&a1[OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue];
  v9 = swift_allocObject(&unk_100039E50, 24, 7);
  *(_QWORD *)(v9 + 16) = a1;
  aBlock[4] = sub_10002214C;
  v20 = v9;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006CEC;
  aBlock[3] = &unk_100039E68;
  v10 = _Block_copy(aBlock);
  static DispatchQoS.unspecified.getter(a1);
  v18 = _swiftEmptyArrayStorage;
  v11 = sub_100006818((unint64_t *)&qword_10003D6D8, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v12 = sub_10000E354((uint64_t *)&unk_10003DBA0);
  v13 = sub_10000AD58((unint64_t *)&qword_10003D6E0, (uint64_t *)&unk_10003DBA0);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v18, v12, v13, v2, v11);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v8, v4, v10);
  _Block_release(v10);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v4, v2);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v14 = swift_release(v20);
  return sub_10001AD40(v14);
}

uint64_t sub_10001C06C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  int64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  unint64_t v32;
  unint64_t v33;
  int64_t v34;
  uint64_t result;
  uint64_t v36;
  uint64_t i;
  id v38;
  void *v39;
  uint64_t v40;
  __n128 v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  char v46[24];
  char v47[24];
  unint64_t v48;
  _QWORD v49[6];

  v48 = (unint64_t)_swiftEmptyArrayStorage;
  v1 = (uint64_t *)(a1 + OBJC_IVAR____TtC15audioanalyticsd6Server_clientServerInstances);
  swift_beginAccess(a1 + OBJC_IVAR____TtC15audioanalyticsd6Server_clientServerInstances, v47, 0, 0);
  v2 = *v1;
  if ((*v1 & 0xC000000000000001) != 0)
  {
    if (v2 < 0)
      v3 = *v1;
    else
      v3 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v2);
    v4 = __CocoaSet.makeIterator()(v3);
    v5 = type metadata accessor for ClientServerInstance(0);
    v6 = sub_100006818((unint64_t *)&unk_10003DBE0, type metadata accessor for ClientServerInstance, (uint64_t)&unk_100031C28);
    v7 = Set.Iterator.init(_cocoa:)(v49, v4, v5, v6);
    v2 = v49[0];
    v8 = v49[1];
    v9 = v49[2];
    v10 = v49[3];
    v11 = v49[4];
  }
  else
  {
    v12 = -1 << *(_BYTE *)(v2 + 32);
    v8 = v2 + 56;
    v9 = ~v12;
    v13 = -v12;
    if (v13 < 64)
      v14 = ~(-1 << v13);
    else
      v14 = -1;
    v11 = v14 & *(_QWORD *)(v2 + 56);
    swift_bridgeObjectRetain(*v1);
    v10 = 0;
  }
  v42 = v9;
  v15 = (unint64_t)(v9 + 64) >> 6;
  while (v2 < 0)
  {
    v19 = __CocoaSet.Iterator.next()(v7);
    if (!v19)
      goto LABEL_39;
    v20 = v19;
    v44 = v19;
    v21 = type metadata accessor for ClientServerInstance(0);
    swift_unknownObjectRetain(v20, v22);
    swift_dynamicCast(&v45, &v44, (char *)&type metadata for Swift.AnyObject + 8, v21, 7);
    v23 = v45;
    swift_unknownObjectRelease(v20);
    v18 = v10;
    v9 = v11;
    if (!v23)
      goto LABEL_39;
LABEL_29:
    if ((sub_10001419C() & 1) != 0)
    {
      v26 = (uint64_t *)(a1 + OBJC_IVAR____TtC15audioanalyticsd6Server_xpcConnections);
      swift_beginAccess(a1 + OBJC_IVAR____TtC15audioanalyticsd6Server_xpcConnections, v46, 0, 0);
      v27 = *v26;
      swift_retain(v23);
      swift_bridgeObjectRetain(v27);
      sub_100021C58(v28, v23);
      v30 = v29;
      swift_bridgeObjectRelease(v27);
      swift_release(v23);
      if (v30)
      {
        v31 = v30;
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        v33 = *(_QWORD *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x10);
        v32 = *(_QWORD *)((v48 & 0xFFFFFFFFFFFFFF8) + 0x18);
        if (v33 >= v32 >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v32 > 1, v33 + 1, 1);
        v16 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v33, v31);
        specialized Array._endMutation()(v16);

      }
    }
    v7 = (_QWORD *)swift_release(v23);
    v10 = v18;
    v11 = v9;
  }
  if (v11)
  {
    v9 = (v11 - 1) & v11;
    v17 = __clz(__rbit64(v11)) | (v10 << 6);
    v18 = v10;
    goto LABEL_28;
  }
  v18 = v10 + 1;
  if (__OFADD__(v10, 1))
  {
    __break(1u);
    goto LABEL_48;
  }
  if (v18 >= v15)
    goto LABEL_39;
  v24 = *(_QWORD *)(v8 + 8 * v18);
  if (v24)
  {
LABEL_27:
    v9 = (v24 - 1) & v24;
    v17 = __clz(__rbit64(v24)) + (v18 << 6);
LABEL_28:
    v23 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v17);
    swift_retain(v23);
    if (!v23)
      goto LABEL_39;
    goto LABEL_29;
  }
  v25 = v10 + 2;
  if (v10 + 2 >= v15)
    goto LABEL_39;
  v24 = *(_QWORD *)(v8 + 8 * v25);
  if (v24)
    goto LABEL_26;
  v25 = v10 + 3;
  if (v10 + 3 >= v15)
    goto LABEL_39;
  v24 = *(_QWORD *)(v8 + 8 * v25);
  if (v24)
  {
LABEL_26:
    v18 = v25;
    goto LABEL_27;
  }
  v18 = v10 + 4;
  if (v10 + 4 >= v15)
    goto LABEL_39;
  v24 = *(_QWORD *)(v8 + 8 * v18);
  if (v24)
    goto LABEL_27;
  v34 = v10 + 5;
  while (v15 != v34)
  {
    v24 = *(_QWORD *)(v8 + 8 * v34++);
    if (v24)
    {
      v18 = v34 - 1;
      goto LABEL_27;
    }
  }
LABEL_39:
  result = sub_100014E70(v2);
  v9 = v48;
  if (!(v48 >> 62))
  {
    v36 = *(_QWORD *)((v48 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v36)
      goto LABEL_41;
    return swift_bridgeObjectRelease(v9);
  }
LABEL_48:
  if (v9 < 0)
    v40 = v9;
  else
    v40 = v9 & 0xFFFFFFFFFFFFFF8;
  v41 = swift_bridgeObjectRetain(v9);
  v36 = _CocoaArrayWrapper.endIndex.getter(v40, v41);
  result = swift_bridgeObjectRelease(v9);
  if (!v36)
    return swift_bridgeObjectRelease(v9);
LABEL_41:
  if (v36 >= 1)
  {
    for (i = 0; i != v36; ++i)
    {
      if ((v9 & 0xC000000000000001) != 0)
        v38 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v9);
      else
        v38 = *(id *)(v9 + 8 * i + 32);
      v39 = v38;
      objc_msgSend(v38, "invalidate", v42);

    }
    return swift_bridgeObjectRelease(v9);
  }
  __break(1u);
  return result;
}

uint64_t sub_10001C46C(uint64_t a1)
{
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;

  v1 = Logger.logObject.getter(a1);
  v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Got SIGTERM. Should die within 2 seconds.", v3, 2u);
    swift_slowDealloc(v3, -1, -1);
  }

  return sub_10001A9C4(2, 0);
}

id sub_10001C544()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10001C658()
{
  return type metadata accessor for Server(0);
}

uint64_t type metadata accessor for Server(uint64_t a1)
{
  uint64_t result;

  result = qword_10003DB28;
  if (!qword_10003DB28)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for Server);
  return result;
}

uint64_t sub_10001C69C(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[12];

  v4[0] = "\b";
  v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[3] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v4[4] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v4[5] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v4[6] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[7] = (char *)&value witness table for Builtin.Int64 + 64;
  result = type metadata accessor for Logger(319);
  if (v3 <= 0x3F)
  {
    v4[8] = *(_QWORD *)(result - 8) + 64;
    v4[9] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[10] = (char *)&value witness table for Builtin.NativeObject + 64;
    v4[11] = (char *)&value witness table for Builtin.NativeObject + 64;
    return swift_updateClassMetadata2(a1, 256, 12, v4, a1 + 80);
  }
  return result;
}

uint64_t sub_10001C750(uint64_t a1, void *a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  __n128 v16;
  uint64_t result;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t aBlock[5];
  _QWORD *v50;
  char v51[24];

  v46 = a3;
  v47 = a5;
  v8 = type metadata accessor for DispatchWorkItemFlags(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for DispatchQoS(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  a1 += 16;
  v16 = swift_beginAccess(a1, v51, 0, 0);
  result = swift_unknownObjectWeakLoadStrong(a1, v16);
  if (result)
  {
    v18 = (void *)result;
    v41 = v13;
    v42 = v12;
    v43 = v11;
    v44 = v9;
    v45 = v8;
    v19 = a2;
    swift_bridgeObjectRetain_n(a4, 2);
    v20 = v19;
    v21 = Logger.logObject.getter(v20);
    v22 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = swift_slowAlloc(18, -1);
      v24 = swift_slowAlloc(32, -1);
      aBlock[0] = v24;
      *(_DWORD *)v23 = 67174915;
      v25 = objc_msgSend(v20, "processIdentifier");

      LODWORD(v48) = v25;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v48, (char *)&v48 + 4, v23 + 4, v23 + 8);

      *(_WORD *)(v23 + 8) = 2081;
      swift_bridgeObjectRetain(a4);
      v26 = v46;
      v48 = (_QWORD *)sub_10000A7E4(v46, a4, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v48, aBlock, v23 + 10, v23 + 18);
      swift_bridgeObjectRelease_n(a4, 3);
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "XPC connection was interrupted. { pid=%{private}d, clientProcessName=%{private}s }", (uint8_t *)v23, 0x12u);
      swift_arrayDestroy(v24, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v24, -1, -1);
      swift_slowDealloc(v23, -1, -1);

    }
    else
    {
      swift_bridgeObjectRelease_n(a4, 2);

      v26 = v46;
    }
    v27 = swift_allocObject(&unk_100039B80, 24, 7);
    swift_unknownObjectWeakInit(v27 + 16, v18);
    v28 = (_QWORD *)swift_allocObject(&unk_100039D38, 56, 7);
    v29 = v47;
    v28[2] = v27;
    v28[3] = v29;
    v28[4] = v20;
    v28[5] = v26;
    v28[6] = a4;
    aBlock[4] = (uint64_t)sub_1000220C8;
    v50 = v28;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100006CEC;
    aBlock[3] = (uint64_t)&unk_100039D50;
    v30 = _Block_copy(aBlock);
    v31 = v20;
    swift_bridgeObjectRetain(a4);
    swift_retain(v27);
    v32 = swift_retain(v29);
    static DispatchQoS.unspecified.getter(v32);
    v48 = _swiftEmptyArrayStorage;
    v33 = sub_100006818((unint64_t *)&qword_10003D6D8, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v34 = sub_10000E354((uint64_t *)&unk_10003DBA0);
    v35 = sub_10000AD58((unint64_t *)&qword_10003D6E0, (uint64_t *)&unk_10003DBA0);
    v36 = v43;
    v37 = v34;
    v38 = v45;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v48, v37, v35, v45, v33);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v15, v36, v30);
    _Block_release(v30);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v36, v38);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v15, v42);

    v39 = v50;
    swift_release(v27);
    return swift_release(v39);
  }
  return result;
}

void sub_10001CB58(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  __n128 v14;
  uint64_t Strong;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  id v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[24];

  v10 = type metadata accessor for Logger(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  a1 += 16;
  v14 = swift_beginAccess(a1, v31, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(a1, v14);
  if (Strong)
  {
    v16 = (void *)Strong;
    if ((sub_10001B960(a2) & 1) != 0)
    {

    }
    else
    {
      v21 = a3;
      swift_bridgeObjectRetain_n(a5, 2);
      v22 = v21;
      v23 = Logger.logObject.getter(v22);
      v24 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v23, v24))
      {
        v25 = swift_slowAlloc(18, -1);
        v26 = swift_slowAlloc(32, -1);
        v30 = v26;
        *(_DWORD *)v25 = 67174915;
        v27 = objc_msgSend(v22, "processIdentifier");

        LODWORD(v29) = v27;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, (char *)&v29 + 4, v25 + 4, v25 + 8);

        *(_WORD *)(v25 + 8) = 2081;
        swift_bridgeObjectRetain(a5);
        v29 = sub_10000A7E4(a4, a5, &v30);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, &v30, v25 + 10, v25 + 18);
        swift_bridgeObjectRelease_n(a5, 3);
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "Failed to remove client. { pid=%{private}d, clientProcessName=%{private}s }", (uint8_t *)v25, 0x12u);
        swift_arrayDestroy(v26, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v26, -1, -1);
        swift_slowDealloc(v25, -1, -1);

      }
      else
      {
        swift_bridgeObjectRelease_n(a5, 2);

      }
    }
  }
  else
  {
    v17 = static Logger.service.getter(0);
    v18 = Logger.logObject.getter(v17);
    v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Server is gone. { action=interruptionHandler }", v20, 2u);
      swift_slowDealloc(v20, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
}

uint64_t sub_10001CE2C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unint64_t a5)
{
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
  __n128 v19;
  uint64_t result;
  void *v21;
  double v22;
  id v23;
  id v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  void **v28;
  unsigned int v29;
  NSString v30;
  uint64_t v31;
  void *v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  double v55;
  void **aBlock;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD *v61;
  char v62[32];

  v54 = a4;
  v9 = type metadata accessor for DispatchWorkItemFlags(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for DispatchQoS(0);
  v52 = *(_QWORD *)(v13 - 8);
  v53 = v13;
  __chkstk_darwin(v13);
  v51 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for Date(0);
  v16 = *(_QWORD *)(v15 - 8);
  __chkstk_darwin(v15);
  v18 = (char *)&v48 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  a1 += 16;
  v19 = swift_beginAccess(a1, v62, 0, 0);
  result = swift_unknownObjectWeakLoadStrong(a1, v19);
  if (result)
  {
    v21 = (void *)result;
    v48 = v12;
    v49 = v10;
    v50 = v9;
    Date.init()(result);
    v22 = Date.timeIntervalSince(_:)(a2 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_clientStartDate);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
    v23 = a3;
    swift_bridgeObjectRetain_n(a5, 2);
    v24 = v23;
    v25 = Logger.logObject.getter(v24);
    v26 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = swift_slowAlloc(28, -1);
      v28 = (void **)swift_slowAlloc(32, -1);
      aBlock = v28;
      *(_DWORD *)v27 = 67175171;
      v29 = objc_msgSend(v24, "processIdentifier");

      LODWORD(v55) = v29;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v55, (char *)&v55 + 4, v27 + 4, v27 + 8);

      *(_WORD *)(v27 + 8) = 2081;
      swift_bridgeObjectRetain(a5);
      v55 = COERCE_DOUBLE(sub_10000A7E4(v54, a5, (uint64_t *)&aBlock));
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v55, &aBlock, v27 + 10, v27 + 18);
      swift_bridgeObjectRelease_n(a5, 3);
      *(_WORD *)(v27 + 18) = 2049;
      v55 = v22;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v55, &aBlock, v27 + 20, v27 + 28);
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "XPC connection was invalidated. { pid=%{private}d, clientProcessName=%{private}s, uptimeSeconds=%{private}f }", (uint8_t *)v27, 0x1Cu);
      swift_arrayDestroy(v28, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v28, -1, -1);
      swift_slowDealloc(v27, -1, -1);

    }
    else
    {
      swift_bridgeObjectRelease_n(a5, 2);

    }
    v30 = String._bridgeToObjectiveC()();
    v31 = swift_allocObject(&unk_100039C48, 32, 7);
    *(_QWORD *)(v31 + 16) = a2;
    *(double *)(v31 + 24) = v22;
    v60 = sub_10002202C;
    v61 = (_QWORD *)v31;
    aBlock = _NSConcreteStackBlock;
    v57 = 1107296256;
    v58 = sub_10001D470;
    v59 = &unk_100039C60;
    v32 = _Block_copy(&aBlock);
    v33 = v61;
    swift_retain(a2);
    swift_release(v33);
    AnalyticsSendEventLazy(v30, v32);
    _Block_release(v32);

    v34 = swift_allocObject(&unk_100039B80, 24, 7);
    swift_unknownObjectWeakInit(v34 + 16, v21);
    v35 = (_QWORD *)swift_allocObject(&unk_100039C98, 56, 7);
    v35[2] = v34;
    v35[3] = a2;
    v36 = v54;
    v35[4] = v24;
    v35[5] = v36;
    v35[6] = a5;
    v60 = sub_10002203C;
    v61 = v35;
    aBlock = _NSConcreteStackBlock;
    v57 = 1107296256;
    v58 = sub_100006CEC;
    v59 = &unk_100039CB0;
    v37 = _Block_copy(&aBlock);
    v38 = v24;
    swift_bridgeObjectRetain(a5);
    swift_retain(a2);
    v39 = swift_retain(v34);
    v40 = v51;
    static DispatchQoS.unspecified.getter(v39);
    v55 = COERCE_DOUBLE(_swiftEmptyArrayStorage);
    v41 = sub_100006818((unint64_t *)&qword_10003D6D8, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v42 = sub_10000E354((uint64_t *)&unk_10003DBA0);
    v43 = sub_10000AD58((unint64_t *)&qword_10003D6E0, (uint64_t *)&unk_10003DBA0);
    v44 = v48;
    v45 = v42;
    v46 = v50;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v55, v45, v43, v50, v41);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v40, v44, v37);
    _Block_release(v37);
    (*(void (**)(char *, uint64_t))(v49 + 8))(v44, v46);
    (*(void (**)(char *, uint64_t))(v52 + 8))(v40, v53);

    v47 = v61;
    swift_release(v34);
    return swift_release(v47);
  }
  return result;
}

unint64_t sub_10001D360(uint64_t a1, double a2)
{
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  id v7;
  NSString v8;
  id v9;
  uint64_t v11;

  v4 = sub_10000E354(&qword_10003DBD8);
  inited = swift_initStackObject(v4, &v11);
  *(_OWORD *)(inited + 16) = xmmword_100031B70;
  *(_QWORD *)(inited + 32) = 0x4E737365636F7270;
  *(_QWORD *)(inited + 40) = 0xEB00000000656D61;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = objc_allocWithZone((Class)NSString);
  swift_bridgeObjectRetain(v6);
  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  v9 = objc_msgSend(v7, "initWithString:", v8);

  *(_QWORD *)(inited + 48) = v9;
  *(_QWORD *)(inited + 56) = 0x73646E6F636573;
  *(_QWORD *)(inited + 64) = 0xE700000000000000;
  *(_QWORD *)(inited + 72) = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithDouble:", a2);
  return sub_10000FDB0(inited);
}

Class sub_10001D470(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSDictionary v5;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  v4 = v1(v3);
  swift_release(v2);
  if (v4)
  {
    sub_10000F8F8(0, &qword_10003DBD0, NSObject_ptr);
    v5.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5.super.isa = 0;
  }
  return v5.super.isa;
}

void sub_10001D4F4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  __n128 v14;
  uint64_t Strong;
  char *v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  NSObject *v28;
  id v29;
  id v30;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37[3];
  _BYTE v38[24];

  v10 = type metadata accessor for Logger(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  a1 += 16;
  v14 = swift_beginAccess(a1, v38, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(a1, v14);
  if (Strong)
  {
    v16 = (char *)Strong;
    if ((sub_10001B960(a2) & 1) == 0)
    {
      v17 = a3;
      swift_bridgeObjectRetain_n(a5, 2);
      v18 = v17;
      v19 = Logger.logObject.getter(v18);
      v20 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v19, v20))
      {
        v21 = swift_slowAlloc(18, -1);
        v35 = swift_slowAlloc(32, -1);
        v37[0] = v35;
        *(_DWORD *)v21 = 67174915;
        v22 = objc_msgSend(v18, "processIdentifier");

        LODWORD(v36) = v22;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, (char *)&v36 + 4, v21 + 4, v21 + 8);

        *(_WORD *)(v21 + 8) = 2081;
        swift_bridgeObjectRetain(a5);
        v36 = sub_10000A7E4(a4, a5, v37);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, v37, v21 + 10, v21 + 18);
        swift_bridgeObjectRelease_n(a5, 3);
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "Failed to remove client. { pid=%{private}d, clientProcessName=%{private}s }", (uint8_t *)v21, 0x12u);
        v23 = v35;
        swift_arrayDestroy(v35, 1, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v23, -1, -1);
        swift_slowDealloc(v21, -1, -1);

      }
      else
      {
        swift_bridgeObjectRelease_n(a5, 2);

      }
    }
    swift_beginAccess(&v16[OBJC_IVAR____TtC15audioanalyticsd6Server_xpcConnections], v37, 33, 0);
    v28 = sub_100020388(a3);
    swift_endAccess(v37);
    if (v28)
      goto LABEL_12;
    v29 = a3;
    swift_bridgeObjectRetain_n(a5, 2);
    v30 = v29;
    v28 = Logger.logObject.getter(v30);
    v31 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v28, v31))
    {
      v32 = swift_slowAlloc(18, -1);
      v33 = swift_slowAlloc(32, -1);
      v37[0] = v33;
      *(_DWORD *)v32 = 67174915;
      v34 = objc_msgSend(v30, "processIdentifier");

      LODWORD(v36) = v34;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, (char *)&v36 + 4, v32 + 4, v32 + 8);

      *(_WORD *)(v32 + 8) = 2081;
      swift_bridgeObjectRetain(a5);
      v36 = sub_10000A7E4(a4, a5, v37);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, v37, v32 + 10, v32 + 18);
      swift_bridgeObjectRelease_n(a5, 3);
      _os_log_impl((void *)&_mh_execute_header, v28, v31, "Failed to remove connection. { pid=%{private}d, clientProcessName=%{private}s }", (uint8_t *)v32, 0x12u);
      swift_arrayDestroy(v33, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v33, -1, -1);
      swift_slowDealloc(v32, -1, -1);
LABEL_12:

      return;
    }
    swift_bridgeObjectRelease_n(a5, 2);

  }
  else
  {
    v24 = static Logger.service.getter(0);
    v25 = Logger.logObject.getter(v24);
    v26 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "Server is gone. { action=invalidationHandler }", v27, 2u);
      swift_slowDealloc(v27, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
}

uint64_t sub_10001D980(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  id v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  unint64_t v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;
  uint64_t v36;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v38;
  void (*v39)(_BYTE *, _QWORD);
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  char v61;
  char v62;
  char v63;
  uint64_t v64;
  void (*v65)(_BYTE *, _QWORD);
  uint64_t v66;
  int64_t v67;
  uint64_t v68;
  char v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  char v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char v82;
  char v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t result;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  _BYTE v93[32];
  int64_t v94;
  uint64_t v95;
  char v96;
  char v97[24];

  v90 = a1;
  v4 = type metadata accessor for DispatchPredicate(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (uint64_t *)((char *)&v87 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = *(void **)(v2 + OBJC_IVAR____TtC15audioanalyticsd6Server_serverQueue);
  *v7 = v8;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v5 + 104))(v7, enum case for DispatchPredicate.onQueue(_:), v4);
  v9 = v8;
  LOBYTE(v8) = _dispatchPreconditionTest(_:)(v7);
  (*(void (**)(_QWORD *, uint64_t))(v5 + 8))(v7, v4);
  if ((v8 & 1) == 0)
  {
LABEL_86:
    __break(1u);
LABEL_87:
    swift_release(a2);
    __break(1u);
LABEL_88:
    __break(1u);
LABEL_89:
    swift_release(a2);
    __break(1u);
    goto LABEL_90;
  }
  v10 = (uint64_t *)(v2 + OBJC_IVAR____TtC15audioanalyticsd6Server_clientServerInstances);
  swift_beginAccess(v10, v97, 0, 0);
  v11 = *v10;
  v12 = *v10 & 0xC000000000000001;
  if (v12)
  {
    v13 = v11 & 0xFFFFFFFFFFFFFF8;
    if (v11 < 0)
      v14 = v11;
    else
      v14 = v11 & 0xFFFFFFFFFFFFFF8;
    v15 = __CocoaSet.startIndex.getter(v14);
    v17 = v16;
    v18 = 1;
  }
  else
  {
    v15 = sub_10000F870(*v10);
    v17 = v19;
    v18 = v20 & 1;
    v13 = v11 & 0xFFFFFFFFFFFFFF8;
  }
  v94 = v15;
  v95 = v17;
  v96 = v18;
  v92 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
  if (v11 < 0)
    v21 = v11;
  else
    v21 = v13;
  swift_bridgeObjectRetain(v11);
  swift_retain(a2);
  v91 = v12;
  v22 = v18;
  if (!v12)
    goto LABEL_15;
LABEL_12:
  v23 = __CocoaSet.endIndex.getter(v21);
  if ((v22 & 1) == 0)
    goto LABEL_92;
  v25 = v23;
  v26 = v24;
  v27 = static __CocoaSet.Index.== infix(_:_:)(v15, v17, v23, v24);
  sub_10002207C(v25, v26, 1);
  if ((v27 & 1) != 0)
  {
    v22 = 1;
  }
  else
  {
    do
    {
      swift_bridgeObjectRetain(v11);
      v28 = sub_100005FA4(v15, v17, v22 & 1, v11);
      swift_bridgeObjectRelease(v11);
      if (*(_DWORD *)(v28 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid) != *(_DWORD *)(a2 + v92))
      {
        swift_release(v28);
        goto LABEL_34;
      }
      if (*(_QWORD *)(v28 + 24) == *(_QWORD *)(a2 + 24) && *(_QWORD *)(v28 + 32) == *(_QWORD *)(a2 + 32))
      {
        swift_release(v28);
      }
      else
      {
        v29 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_release(v28);
        if ((v29 & 1) == 0)
          goto LABEL_34;
      }
      v30 = v91;
      if (v91)
      {
        if ((v18 & 1) == 0)
          goto LABEL_95;
        v36 = __CocoaSet.Index.handleBitPattern.getter(v15, v17);
        if (v36)
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v36);
        else
          isUniquelyReferenced_nonNull_native = 1;
        v38 = sub_10000E354(&qword_10003DBC8);
        v39 = (void (*)(_BYTE *, _QWORD))Set.Index._asCocoa.modify(v93, v38);
        __CocoaSet.formIndex(after:isUnique:)(v40, isUniquelyReferenced_nonNull_native, v21);
        v39(v93, 0);
        v18 = v96;
        v15 = v94;
        v17 = v95;
        v22 = v96;
        if (v30)
          goto LABEL_12;
      }
      else
      {
        v31 = sub_10000622C(v15, v17, v22 & 1, v11);
        v33 = v32;
        v35 = v34;
        sub_10002207C(v15, v17, v22 & 1);
        v94 = v31;
        v95 = v33;
        v96 = v35 & 1;
        v17 = v33;
        v15 = v31;
        v22 = v35;
        if (v91)
          goto LABEL_12;
      }
LABEL_15:
      if ((v22 & 1) != 0)
        goto LABEL_92;
      if (*(_DWORD *)(v11 + 36) != (_DWORD)v17)
        goto LABEL_85;
    }
    while (v15 != 1 << *(_BYTE *)(v11 + 32));
    v22 = 0;
  }
LABEL_34:
  v41 = v91;
  v88 = (unint64_t)"@\"NSDictionary\"8@?0";
  v89 = 0x8000000100032FF0;
LABEL_36:
  if (v41)
  {
    v42 = __CocoaSet.endIndex.getter(v21);
    if ((v22 & 1) != 0)
    {
      v44 = v42;
      v45 = v43;
      v46 = static __CocoaSet.Index.== infix(_:_:)(v15, v17, v42, v43);
      sub_10002207C(v44, v45, 1);
      if ((v46 & 1) != 0)
      {
        v78 = __CocoaSet.endIndex.getter(v21);
LABEL_73:
        v80 = v78;
        v81 = v79;
        v82 = static __CocoaSet.Index.== infix(_:_:)(v15, v17, v78, v79);
        v83 = 1;
        sub_10002207C(v80, v81, 1);
        if ((v82 & 1) != 0)
        {
LABEL_74:
          v84 = 0;
LABEL_80:
          sub_10002207C(v15, v17, v83);
          swift_bridgeObjectRelease(v11);
          swift_release(a2);
          return v84;
        }
        goto LABEL_79;
      }
      goto LABEL_43;
    }
LABEL_90:
    swift_release(a2);
    __break(1u);
    goto LABEL_91;
  }
  if ((v22 & 1) != 0)
    goto LABEL_90;
  v47 = *(_DWORD *)(v11 + 36);
  if (v47 != (_DWORD)v17)
  {
LABEL_83:
    __break(1u);
LABEL_84:
    __break(1u);
LABEL_85:
    __break(1u);
    goto LABEL_86;
  }
  if (v15 == 1 << *(_BYTE *)(v11 + 32))
  {
LABEL_77:
    if (v47 == (_DWORD)v17)
    {
      v83 = 0;
      if (v15 == 1 << *(_BYTE *)(v11 + 32))
        goto LABEL_74;
LABEL_79:
      v85 = sub_100005FA4(v15, v17, v83, v11);
      v84 = sub_10000E3D4(v90, 1, 0xD000000000000011, v88 | 0x8000000000000000);
      swift_release(v85);
      if (v84)
        goto LABEL_80;
      goto LABEL_93;
    }
    goto LABEL_88;
  }
LABEL_43:
  swift_bridgeObjectRetain(v11);
  v48 = sub_100005FA4(v15, v17, v22 & 1, v11);
  v49 = sub_10000E3D4(v90, 1, 0xD000000000000011, v89);
  swift_bridgeObjectRelease(v11);
  swift_release(v48);
  swift_release(v49);
  if (v49)
  {
    if (v41)
    {
      v78 = __CocoaSet.endIndex.getter(v21);
      if ((v22 & 1) == 0)
        goto LABEL_94;
      goto LABEL_73;
    }
    if ((v22 & 1) != 0)
      goto LABEL_94;
    v47 = *(_DWORD *)(v11 + 36);
    goto LABEL_77;
  }
  v94 = v15;
  v95 = v17;
  v96 = v22 & 1;
  if (v41)
  {
    v50 = __CocoaSet.endIndex.getter(v21);
    if ((v22 & 1) != 0)
    {
      v52 = v50;
      v53 = v51;
      v54 = static __CocoaSet.Index.== infix(_:_:)(v15, v17, v50, v51);
      sub_10002207C(v52, v53, 1);
      if ((v54 & 1) == 0)
        goto LABEL_53;
LABEL_82:
      __break(1u);
      goto LABEL_83;
    }
  }
  else if ((v22 & 1) == 0)
  {
    if (*(_DWORD *)(v11 + 36) != (_DWORD)v17)
      goto LABEL_84;
    if (v15 != 1 << *(_BYTE *)(v11 + 32))
    {
      while (1)
      {
LABEL_53:
        if (v41)
        {
          if ((v96 & 1) == 0)
            goto LABEL_89;
          v55 = __CocoaSet.Index.handleBitPattern.getter(v94, v95);
          if (v55)
            v56 = swift_isUniquelyReferenced_nonNull_native(v55);
          else
            v56 = 1;
          v64 = sub_10000E354(&qword_10003DBC8);
          v65 = (void (*)(_BYTE *, _QWORD))Set.Index._asCocoa.modify(v93, v64);
          __CocoaSet.formIndex(after:isUnique:)(v66, v56, v21);
          v65(v93, 0);
          v67 = v94;
          v68 = v95;
          v69 = v96;
          v70 = __CocoaSet.endIndex.getter(v21);
          if ((v69 & 1) == 0)
            goto LABEL_87;
          v72 = v70;
          v73 = v71;
          v74 = static __CocoaSet.Index.== infix(_:_:)(v67, v68, v70, v71);
          sub_10002207C(v72, v73, 1);
          v15 = v94;
          v17 = v95;
          v22 = v96;
          if ((v74 & 1) != 0)
            goto LABEL_36;
        }
        else
        {
          v57 = v94;
          v58 = v95;
          v59 = v96;
          v15 = sub_10000622C(v94, v95, v96, v11);
          v17 = v60;
          v62 = v61;
          v63 = v61 & 1;
          sub_10002207C(v57, v58, v59);
          v94 = v15;
          v95 = v17;
          v96 = v63;
          v41 = v91;
          if ((v62 & 1) != 0)
            goto LABEL_87;
          if (*(_DWORD *)(v11 + 36) != (_DWORD)v17)
          {
            __break(1u);
            goto LABEL_82;
          }
          v22 = 0;
          if (v15 == 1 << *(_BYTE *)(v11 + 32))
            goto LABEL_36;
        }
        swift_bridgeObjectRetain(v11);
        v75 = sub_100005FA4(v15, v17, v22, v11);
        swift_bridgeObjectRelease(v11);
        if (*(_DWORD *)(v75 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid) != *(_DWORD *)(a2 + v92))
        {
          swift_release(v75);
          goto LABEL_36;
        }
        if (*(_QWORD *)(v75 + 24) == *(_QWORD *)(a2 + 24) && *(_QWORD *)(v75 + 32) == *(_QWORD *)(a2 + 32))
        {
          swift_release(v75);
        }
        else
        {
          v77 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_release(v75);
          if ((v77 & 1) == 0)
            goto LABEL_36;
        }
      }
    }
    goto LABEL_82;
  }
LABEL_91:
  swift_release(a2);
  __break(1u);
LABEL_92:
  swift_release(a2);
  __break(1u);
LABEL_93:
  swift_release(a2);
  __break(1u);
LABEL_94:
  swift_release(a2);
  __break(1u);
LABEL_95:
  result = swift_release(a2);
  __break(1u);
  return result;
}

uint64_t sub_10001E140(uint64_t *a1)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v4;
  Swift::Int v5;
  uint64_t v7[2];

  v2 = *a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*a1);
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v2 = sub_100029C88(v2);
    *a1 = v2;
  }
  v4 = *(_QWORD *)(v2 + 16);
  v7[0] = v2 + 32;
  v7[1] = v4;
  v5 = sub_10001E2C8(v7);
  return specialized ContiguousArray._endMutation()(v5);
}

uint64_t sub_10001E1B8(uint64_t a1, uint64_t a2)
{
  return sub_10002F514(a2, a1);
}

Swift::Int sub_10001E1C8()
{
  return sub_10002E6DC();
}

uint64_t sub_10001E1E8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_100019C90(a2, *a1, a3);
}

uint64_t sub_10001E1F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t (*v11)(_QWORD);
  uint64_t v13;

  v5 = sub_10000E354((uint64_t *)&unk_10003DC10);
  __chkstk_darwin(v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for FeatureInfo(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006978(a3, (uint64_t)v10, v11);
  sub_1000225A8(a1, (uint64_t)v7);
  return sub_100025594((uint64_t)v7, (uint64_t)v10);
}

Swift::Int sub_10001E2C8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t *v2;
  Swift::Int v3;
  Swift::Int result;
  uint64_t v5;
  Swift::Int v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  Swift::Int v12;
  uint64_t v13;
  unint64_t v14;
  Swift::Int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  Swift::Int v23;
  Swift::Int v24;
  uint64_t *v25;
  uint64_t v26;
  Swift::Int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  Swift::Int v32;
  Swift::Int v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  char *v39;
  char *v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  BOOL v52;
  unint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  BOOL v62;
  uint64_t v63;
  char v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  BOOL v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  char *v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  unint64_t v87;
  char *v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  unint64_t v96;
  char *v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  Swift::Int v101;
  Swift::Int v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;

  v2 = a1;
  v3 = a1[1];
  result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3)
        return sub_10001E9EC(0, v3, 1, v2);
      return result;
    }
    goto LABEL_134;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_142;
  v6 = result;
  v98 = v2;
  if (v3 < 2)
  {
    v11 = (char *)_swiftEmptyArrayStorage;
    v107 = (uint64_t)_swiftEmptyArrayStorage;
    v104 = (char *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v3 != 1)
    {
      v14 = _swiftEmptyArrayStorage[2];
LABEL_101:
      v89 = v11;
      if (v14 < 2)
        goto LABEL_98;
      v91 = *v98;
      while (1)
      {
        v92 = v14 - 2;
        if (v14 < 2)
          goto LABEL_129;
        if (!v91)
          goto LABEL_141;
        v88 = v89;
        v93 = *(_QWORD *)&v89[16 * v92 + 32];
        v94 = *(_QWORD *)&v89[16 * v14 + 24];
        sub_10001EAE4((char *)(v91 + 8 * v93), (char *)(v91 + 8 * *(_QWORD *)&v89[16 * v14 + 16]), v91 + 8 * v94, v104);
        if (v1)
          goto LABEL_97;
        if (v94 < v93)
          goto LABEL_130;
        if ((swift_isUniquelyReferenced_nonNull_native(v88) & 1) == 0)
          v88 = sub_100029BF8((uint64_t)v88);
        if (v92 >= *((_QWORD *)v88 + 2))
          goto LABEL_131;
        v95 = &v88[16 * v92 + 32];
        *(_QWORD *)v95 = v93;
        *((_QWORD *)v95 + 1) = v94;
        v96 = *((_QWORD *)v88 + 2);
        if (v14 > v96)
          goto LABEL_132;
        memmove(&v88[16 * v14 + 16], &v88[16 * v14 + 32], 16 * (v96 - v14));
        v89 = v88;
        *((_QWORD *)v88 + 2) = v96 - 1;
        v14 = v96 - 1;
        if (v96 <= 2)
          goto LABEL_98;
      }
    }
  }
  else
  {
    v7 = v2;
    v8 = v5 >> 1;
    v9 = type metadata accessor for Config(0);
    v10 = static Array._allocateBufferUninitialized(minimumCapacity:)(v8, v9);
    *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) = v8;
    v2 = v7;
    v104 = (char *)((v10 & 0xFFFFFFFFFFFFFF8) + 32);
    v107 = v10;
  }
  v12 = 0;
  v13 = *v2;
  v100 = *v2 + 16;
  v101 = v6;
  v99 = *v2 - 8;
  v11 = (char *)_swiftEmptyArrayStorage;
  v102 = v3;
  v103 = *v2;
  while (1)
  {
    v15 = v12++;
    if (v12 >= v3)
      goto LABEL_31;
    v16 = *(_QWORD *)(v13 + 8 * v15);
    v106 = *(_QWORD *)(v13 + 8 * v12);
    v105 = v16;
    v17 = type metadata accessor for Config(0);
    v18 = sub_100006818(&qword_10003DC28, (uint64_t (*)(uint64_t))&type metadata accessor for Config, (uint64_t)&protocol conformance descriptor for Config);
    v19 = dispatch thunk of static Comparable.< infix(_:_:)(&v106, &v105, v17, v18);
    v12 = v15 + 2;
    if (v15 + 2 >= v3)
      goto LABEL_21;
    v20 = (uint64_t *)(v100 + 8 * v15);
    do
    {
      v21 = *(v20 - 1);
      v106 = *v20;
      v105 = v21;
      if (((v19 ^ dispatch thunk of static Comparable.< infix(_:_:)(&v106, &v105, v17, v18)) & 1) != 0)
      {
        v3 = v102;
        if ((v19 & 1) == 0)
          goto LABEL_31;
LABEL_24:
        if (v12 >= v15)
        {
          if (v15 < v12)
          {
            v22 = (uint64_t *)(v99 + 8 * v12);
            v23 = v12;
            v24 = v15;
            v25 = (uint64_t *)(v13 + 8 * v15);
            while (1)
            {
              if (v24 != --v23)
              {
                if (!v13)
                  goto LABEL_140;
                v26 = *v25;
                *v25 = *v22;
                *v22 = v26;
              }
              ++v24;
              --v22;
              ++v25;
              if (v24 >= v23)
                goto LABEL_31;
            }
          }
          goto LABEL_31;
        }
        goto LABEL_135;
      }
      ++v12;
      ++v20;
    }
    while (v102 != v12);
    v3 = v102;
    v12 = v102;
LABEL_21:
    if ((v19 & 1) != 0)
      goto LABEL_24;
LABEL_31:
    if (v12 >= v3)
      goto LABEL_48;
    if (__OFSUB__(v12, v15))
      goto LABEL_133;
    if (v12 - v15 >= v101)
      goto LABEL_48;
    if (__OFADD__(v15, v101))
      goto LABEL_136;
    if (v15 + v101 >= v3)
      v27 = v3;
    else
      v27 = v15 + v101;
    if (v27 < v15)
      goto LABEL_137;
    if (v12 != v27)
    {
      v97 = v11;
      v28 = type metadata accessor for Config(0);
      v29 = sub_100006818(&qword_10003DC28, (uint64_t (*)(uint64_t))&type metadata accessor for Config, (uint64_t)&protocol conformance descriptor for Config);
      v30 = (uint64_t *)(v99 + 8 * v12);
      do
      {
        v31 = *(_QWORD *)(v13 + 8 * v12);
        v32 = v15;
        v33 = v15;
        v34 = v30;
        do
        {
          v35 = *v34;
          v106 = v31;
          v105 = v35;
          if ((dispatch thunk of static Comparable.< infix(_:_:)(&v106, &v105, v28, v29) & 1) == 0)
            break;
          if (!v13)
            goto LABEL_138;
          v36 = *v34;
          v31 = v34[1];
          *v34 = v31;
          v34[1] = v36;
          --v34;
          ++v33;
        }
        while (v12 != v33);
        ++v12;
        ++v30;
        v15 = v32;
      }
      while (v12 != v27);
      v12 = v27;
      v11 = v97;
    }
LABEL_48:
    if (v12 < v15)
    {
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
LABEL_139:
      __break(1u);
LABEL_140:
      __break(1u);
LABEL_141:
      __break(1u);
LABEL_142:
      result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Can't construct Array with count < 0", 36, 2, "Swift/Array.swift", 17, 2, 936, 0);
      __break(1u);
      return result;
    }
    if ((swift_isUniquelyReferenced_nonNull_native(v11) & 1) == 0)
      v11 = sub_1000299A0(0, *((_QWORD *)v11 + 2) + 1, 1, v11);
    v38 = *((_QWORD *)v11 + 2);
    v37 = *((_QWORD *)v11 + 3);
    v14 = v38 + 1;
    if (v38 >= v37 >> 1)
      v11 = sub_1000299A0((char *)(v37 > 1), v38 + 1, 1, v11);
    *((_QWORD *)v11 + 2) = v14;
    v39 = v11 + 32;
    v40 = &v11[16 * v38 + 32];
    *(_QWORD *)v40 = v15;
    *((_QWORD *)v40 + 1) = v12;
    if (v38)
      break;
    v14 = 1;
    v13 = v103;
LABEL_14:
    v3 = v102;
    if (v12 >= v102)
      goto LABEL_101;
  }
  v13 = v103;
  while (1)
  {
    v41 = v14 - 1;
    if (v14 >= 4)
    {
      v46 = &v39[16 * v14];
      v47 = *((_QWORD *)v46 - 8);
      v48 = *((_QWORD *)v46 - 7);
      v52 = __OFSUB__(v48, v47);
      v49 = v48 - v47;
      if (v52)
        goto LABEL_117;
      v51 = *((_QWORD *)v46 - 6);
      v50 = *((_QWORD *)v46 - 5);
      v52 = __OFSUB__(v50, v51);
      v44 = v50 - v51;
      v45 = v52;
      if (v52)
        goto LABEL_118;
      v53 = v14 - 2;
      v54 = &v39[16 * v14 - 32];
      v56 = *(_QWORD *)v54;
      v55 = *((_QWORD *)v54 + 1);
      v52 = __OFSUB__(v55, v56);
      v57 = v55 - v56;
      if (v52)
        goto LABEL_120;
      v52 = __OFADD__(v44, v57);
      v58 = v44 + v57;
      if (v52)
        goto LABEL_123;
      if (v58 >= v49)
      {
        v76 = &v39[16 * v41];
        v78 = *(_QWORD *)v76;
        v77 = *((_QWORD *)v76 + 1);
        v52 = __OFSUB__(v77, v78);
        v79 = v77 - v78;
        if (v52)
          goto LABEL_127;
        v69 = v44 < v79;
        goto LABEL_86;
      }
    }
    else
    {
      if (v14 != 3)
      {
        v70 = *((_QWORD *)v11 + 4);
        v71 = *((_QWORD *)v11 + 5);
        v52 = __OFSUB__(v71, v70);
        v63 = v71 - v70;
        v64 = v52;
        goto LABEL_80;
      }
      v43 = *((_QWORD *)v11 + 4);
      v42 = *((_QWORD *)v11 + 5);
      v52 = __OFSUB__(v42, v43);
      v44 = v42 - v43;
      v45 = v52;
    }
    if ((v45 & 1) != 0)
      goto LABEL_119;
    v53 = v14 - 2;
    v59 = &v39[16 * v14 - 32];
    v61 = *(_QWORD *)v59;
    v60 = *((_QWORD *)v59 + 1);
    v62 = __OFSUB__(v60, v61);
    v63 = v60 - v61;
    v64 = v62;
    if (v62)
      goto LABEL_122;
    v65 = &v39[16 * v41];
    v67 = *(_QWORD *)v65;
    v66 = *((_QWORD *)v65 + 1);
    v52 = __OFSUB__(v66, v67);
    v68 = v66 - v67;
    if (v52)
      goto LABEL_125;
    if (__OFADD__(v63, v68))
      goto LABEL_126;
    if (v63 + v68 >= v44)
    {
      v69 = v44 < v68;
LABEL_86:
      if (v69)
        v41 = v53;
      goto LABEL_88;
    }
LABEL_80:
    if ((v64 & 1) != 0)
      goto LABEL_121;
    v72 = &v39[16 * v41];
    v74 = *(_QWORD *)v72;
    v73 = *((_QWORD *)v72 + 1);
    v52 = __OFSUB__(v73, v74);
    v75 = v73 - v74;
    if (v52)
      goto LABEL_124;
    if (v75 < v63)
      goto LABEL_14;
LABEL_88:
    v80 = v41 - 1;
    if (v41 - 1 >= v14)
    {
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
      goto LABEL_128;
    }
    if (!v13)
      goto LABEL_139;
    v81 = v11;
    v82 = v13;
    v83 = &v39[16 * v80];
    v84 = *(_QWORD *)v83;
    v85 = &v39[16 * v41];
    v86 = *((_QWORD *)v85 + 1);
    sub_10001EAE4((char *)(v82 + 8 * *(_QWORD *)v83), (char *)(v82 + 8 * *(_QWORD *)v85), v82 + 8 * v86, v104);
    if (v1)
      break;
    if (v86 < v84)
      goto LABEL_114;
    if (v41 > *((_QWORD *)v81 + 2))
      goto LABEL_115;
    *(_QWORD *)v83 = v84;
    *(_QWORD *)&v39[16 * v80 + 8] = v86;
    v87 = *((_QWORD *)v81 + 2);
    if (v41 >= v87)
      goto LABEL_116;
    v11 = v81;
    v14 = v87 - 1;
    memmove(&v39[16 * v41], v85 + 16, 16 * (v87 - 1 - v41));
    *((_QWORD *)v81 + 2) = v87 - 1;
    v69 = v87 > 2;
    v13 = v103;
    if (!v69)
      goto LABEL_14;
  }
  v88 = v81;
LABEL_97:
  v89 = v88;
LABEL_98:
  v90 = swift_bridgeObjectRelease(v89);
  *(_QWORD *)((v107 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
  specialized Array._endMutation()(v90);
  return swift_bridgeObjectRelease(v107);
}

uint64_t sub_10001E9EC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (a3 != a2)
  {
    v4 = a3;
    v6 = result;
    v7 = *a4;
    v8 = type metadata accessor for Config(0);
    v9 = sub_100006818(&qword_10003DC28, (uint64_t (*)(uint64_t))&type metadata accessor for Config, (uint64_t)&protocol conformance descriptor for Config);
    v10 = v7 + 8 * v4 - 8;
LABEL_5:
    v11 = *(_QWORD *)(v7 + 8 * v4);
    v12 = v6;
    v13 = (uint64_t *)v10;
    while (1)
    {
      v14 = *v13;
      v17 = v11;
      v16 = v14;
      result = dispatch thunk of static Comparable.< infix(_:_:)(&v17, &v16, v8, v9);
      if ((result & 1) == 0)
      {
LABEL_4:
        ++v4;
        v10 += 8;
        if (v4 == a2)
          return result;
        goto LABEL_5;
      }
      if (!v7)
        break;
      v15 = *v13;
      v11 = v13[1];
      *v13 = v11;
      v13[1] = v15;
      --v13;
      if (v4 == ++v12)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_10001EAE4(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t result;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t *v31;
  char *v32;

  v4 = (uint64_t *)__dst;
  v6 = a2;
  v7 = __src;
  v8 = a2 - __src;
  v9 = a2 - __src + 7;
  if (a2 - __src >= 0)
    v9 = a2 - __src;
  v10 = v9 >> 3;
  v11 = a3 - (_QWORD)a2;
  v12 = a3 - (_QWORD)a2 + 7;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v12 = a3 - (_QWORD)a2;
  v13 = v12 >> 3;
  v32 = __src;
  v31 = (uint64_t *)__dst;
  if (v10 >= v12 >> 3)
  {
    if (v11 >= -7)
    {
      if (__dst != a2 || &a2[8 * v13] <= __dst)
        memmove(__dst, a2, 8 * v13);
      v19 = &v4[v13];
      v30 = v19;
      v32 = v6;
      if (v7 < v6 && v11 >= 8)
      {
        v20 = type metadata accessor for Config(0);
        v27 = sub_100006818(&qword_10003DC28, (uint64_t (*)(uint64_t))&type metadata accessor for Config, (uint64_t)&protocol conformance descriptor for Config);
        v21 = (char *)(a3 - 8);
        v22 = v6;
        while (1)
        {
          v23 = *(v19 - 1);
          v24 = *((_QWORD *)v22 - 1);
          v22 -= 8;
          v25 = v21 + 8;
          v28 = v24;
          v29 = v23;
          if ((dispatch thunk of static Comparable.< infix(_:_:)(&v29, &v28, v20, v27) & 1) != 0)
          {
            if (v25 != v6 || v21 >= v6)
              *(_QWORD *)v21 = *(_QWORD *)v22;
            v32 = v22;
            if (v22 <= v7)
              goto LABEL_43;
          }
          else
          {
            v30 = v19 - 1;
            if (v25 < (char *)v19 || v21 >= (char *)v19 || v25 != (char *)v19)
              *(_QWORD *)v21 = *(v19 - 1);
            v22 = v6;
            --v19;
            if (v6 <= v7)
              goto LABEL_43;
          }
          v21 -= 8;
          v6 = v22;
          if (v19 <= v4)
            goto LABEL_43;
        }
      }
      goto LABEL_43;
    }
  }
  else if (v8 >= -7)
  {
    if (__dst != __src || &__src[8 * v10] <= __dst)
      memmove(__dst, __src, 8 * v10);
    v14 = &v4[v10];
    v30 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 8)
    {
      v15 = type metadata accessor for Config(0);
      v16 = sub_100006818(&qword_10003DC28, (uint64_t (*)(uint64_t))&type metadata accessor for Config, (uint64_t)&protocol conformance descriptor for Config);
      do
      {
        v17 = *(_QWORD *)v6;
        v28 = *v4;
        v29 = v17;
        if ((dispatch thunk of static Comparable.< infix(_:_:)(&v29, &v28, v15, v16) & 1) != 0)
        {
          v18 = v6 + 8;
          if (v7 < v6 || v7 >= v18 || v7 != v6)
            *(_QWORD *)v7 = *(_QWORD *)v6;
        }
        else
        {
          if (v7 != (char *)v4)
            *(_QWORD *)v7 = *v4;
          v31 = ++v4;
          v18 = v6;
        }
        v7 += 8;
        if (v4 >= v14)
          break;
        v6 = v18;
      }
      while ((unint64_t)v18 < a3);
      v32 = v7;
    }
LABEL_43:
    sub_100029A98((void **)&v32, (const void **)&v31, &v30);
    return 1;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
  __break(1u);
  return result;
}

Swift::Int sub_10001EDDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  Swift::Int result;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  unint64_t v20;
  BOOL v21;
  uint64_t v22;
  _QWORD v23[9];
  uint64_t v24;
  uint64_t v25;

  if (a2)
  {
    sub_10000E354(&qword_10003DBC0);
    v4 = static _SetStorage.convert(_:capacity:)(a1, a2);
    v25 = v4;
    v5 = __CocoaSet.makeIterator()(a1);
    v6 = __CocoaSet.Iterator.next()();
    if (v6)
    {
      v7 = v6;
      v8 = type metadata accessor for ClientServerInstance(0);
      do
      {
        v23[0] = v7;
        swift_dynamicCast(&v24, v23, (char *)&type metadata for Swift.AnyObject + 8, v8, 7);
        v4 = v25;
        v18 = *(_QWORD *)(v25 + 16);
        if (*(_QWORD *)(v25 + 24) <= v18)
        {
          sub_10001F204(v18 + 1);
          v4 = v25;
        }
        v9 = v24;
        Hasher.init(_seed:)(v23, *(_QWORD *)(v4 + 40));
        Hasher._combine(_:)(*(_DWORD *)(v9 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid));
        v10 = *(_QWORD *)(v9 + 24);
        v11 = *(_QWORD *)(v9 + 32);
        swift_bridgeObjectRetain(v11);
        String.hash(into:)(v23, v10, v11);
        swift_bridgeObjectRelease(v11);
        result = Hasher._finalize()();
        v13 = v4 + 56;
        v14 = -1 << *(_BYTE *)(v4 + 32);
        v15 = result & ~v14;
        v16 = v15 >> 6;
        if (((-1 << v15) & ~*(_QWORD *)(v4 + 56 + 8 * (v15 >> 6))) != 0)
        {
          v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v4 + 56 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v19 = 0;
          v20 = (unint64_t)(63 - v14) >> 6;
          do
          {
            if (++v16 == v20 && (v19 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v21 = v16 == v20;
            if (v16 == v20)
              v16 = 0;
            v19 |= v21;
            v22 = *(_QWORD *)(v13 + 8 * v16);
          }
          while (v22 == -1);
          v17 = __clz(__rbit64(~v22)) + (v16 << 6);
        }
        *(_QWORD *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
        *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v17) = v9;
        ++*(_QWORD *)(v4 + 16);
        v7 = __CocoaSet.Iterator.next()();
      }
      while (v7);
    }
    swift_release(v5);
  }
  else
  {
    swift_unknownObjectRelease(a1);
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v4;
}

Swift::Int sub_10001F010(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Swift::Int result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a2)
  {
    sub_10000E354(&qword_10003DBB8);
    v4 = static _SetStorage.convert(_:capacity:)(a1, a2);
    v23 = v4;
    v5 = __CocoaSet.makeIterator()(a1);
    v6 = __CocoaSet.Iterator.next()();
    if (v6)
    {
      v7 = v6;
      v8 = sub_10000F8F8(0, &qword_10003DBB0, NSXPCConnection_ptr);
      do
      {
        v21 = v7;
        swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v8, 7);
        v4 = v23;
        v16 = *(_QWORD *)(v23 + 16);
        if (*(_QWORD *)(v23 + 24) <= v16)
        {
          sub_10001F504(v16 + 1);
          v4 = v23;
        }
        v9 = v22;
        result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v4 + 40));
        v11 = v4 + 56;
        v12 = -1 << *(_BYTE *)(v4 + 32);
        v13 = result & ~v12;
        v14 = v13 >> 6;
        if (((-1 << v13) & ~*(_QWORD *)(v4 + 56 + 8 * (v13 >> 6))) != 0)
        {
          v15 = __clz(__rbit64((-1 << v13) & ~*(_QWORD *)(v4 + 56 + 8 * (v13 >> 6)))) | v13 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v17 = 0;
          v18 = (unint64_t)(63 - v12) >> 6;
          do
          {
            if (++v14 == v18 && (v17 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v19 = v14 == v18;
            if (v14 == v18)
              v14 = 0;
            v17 |= v19;
            v20 = *(_QWORD *)(v11 + 8 * v14);
          }
          while (v20 == -1);
          v15 = __clz(__rbit64(~v20)) + (v14 << 6);
        }
        *(_QWORD *)(v11 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
        *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = v9;
        ++*(_QWORD *)(v4 + 16);
        v7 = __CocoaSet.Iterator.next()();
      }
      while (v7);
    }
    swift_release(v5);
  }
  else
  {
    swift_unknownObjectRelease(a1);
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v4;
}

Swift::Int sub_10001F204(uint64_t a1)
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
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  _QWORD *v32;
  _QWORD v33[9];

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_10000E354(&qword_10003DBC0);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1);
  v6 = v5;
  if (*(_QWORD *)(v3 + 16))
  {
    v7 = 1 << *(_BYTE *)(v3 + 32);
    v31 = v2;
    v32 = (_QWORD *)(v3 + 56);
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
        v15 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v16 = v15 | (v13 << 6);
      }
      else
      {
        v17 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v17 >= v10)
          goto LABEL_36;
        v18 = v32[v17];
        ++v13;
        if (!v18)
        {
          v13 = v17 + 1;
          if (v17 + 1 >= v10)
            goto LABEL_36;
          v18 = v32[v13];
          if (!v18)
          {
            v13 = v17 + 2;
            if (v17 + 2 >= v10)
              goto LABEL_36;
            v18 = v32[v13];
            if (!v18)
            {
              v19 = v17 + 3;
              if (v19 >= v10)
              {
LABEL_36:
                swift_release(v3);
                v2 = v31;
                v30 = 1 << *(_BYTE *)(v3 + 32);
                if (v30 > 63)
                  bzero(v32, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v32 = -1 << v30;
                *(_QWORD *)(v3 + 16) = 0;
                break;
              }
              v18 = v32[v19];
              if (!v18)
              {
                while (1)
                {
                  v13 = v19 + 1;
                  if (__OFADD__(v19, 1))
                    goto LABEL_42;
                  if (v13 >= v10)
                    goto LABEL_36;
                  v18 = v32[v13];
                  ++v19;
                  if (v18)
                    goto LABEL_26;
                }
              }
              v13 = v19;
            }
          }
        }
LABEL_26:
        v9 = (v18 - 1) & v18;
        v16 = __clz(__rbit64(v18)) + (v13 << 6);
      }
      v20 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v16);
      Hasher.init(_seed:)(v33, *(_QWORD *)(v6 + 40));
      Hasher._combine(_:)(*(_DWORD *)(v20 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid));
      v21 = *(_QWORD *)(v20 + 24);
      v22 = *(_QWORD *)(v20 + 32);
      swift_bridgeObjectRetain(v22);
      String.hash(into:)(v33, v21, v22);
      swift_bridgeObjectRelease(v22);
      result = Hasher._finalize()();
      v23 = -1 << *(_BYTE *)(v6 + 32);
      v24 = result & ~v23;
      v25 = v24 >> 6;
      if (((-1 << v24) & ~*(_QWORD *)(v11 + 8 * (v24 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v11 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v26 = 0;
        v27 = (unint64_t)(63 - v23) >> 6;
        do
        {
          if (++v25 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v28 = v25 == v27;
          if (v25 == v27)
            v25 = 0;
          v26 |= v28;
          v29 = *(_QWORD *)(v11 + 8 * v25);
        }
        while (v29 == -1);
        v14 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v14) = v20;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release(v3);
  *v2 = v6;
  return result;
}

Swift::Int sub_10001F504(uint64_t a1)
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
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_10000E354(&qword_10003DBB8);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1);
  v6 = v5;
  if (*(_QWORD *)(v3 + 16))
  {
    v30 = v2;
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
                v2 = v30;
                v29 = 1 << *(_BYTE *)(v3 + 32);
                if (v29 > 63)
                  bzero((void *)(v3 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v8 = -1 << v29;
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
      v21 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v17);
      result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v6 + 40));
      v22 = -1 << *(_BYTE *)(v6 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_41;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v21;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release(v3);
  *v2 = v6;
  return result;
}

unint64_t sub_10001F7A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  Swift::Int v6;
  unint64_t result;
  _QWORD v8[9];

  Hasher.init(_seed:)(v8, *(_QWORD *)(a2 + 40));
  Hasher._combine(_:)(*(_DWORD *)(a1 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid));
  v4 = *(_QWORD *)(a1 + 24);
  v5 = *(_QWORD *)(a1 + 32);
  swift_bridgeObjectRetain(v5);
  String.hash(into:)(v8, v4, v5);
  swift_bridgeObjectRelease(v5);
  v6 = Hasher._finalize()();
  result = _HashTable.nextHole(atOrAfter:)(v6 & ~(-1 << *(_BYTE *)(a2 + 32)), a2 + 56, ~(-1 << *(_BYTE *)(a2 + 32)));
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

unint64_t sub_10001F870(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;
  unint64_t result;

  v4 = NSObject._rawHashValue(seed:)(*(_QWORD *)(a2 + 40));
  result = _HashTable.nextHole(atOrAfter:)(v4 & ~(-1 << *(_BYTE *)(a2 + 32)), a2 + 56, ~(-1 << *(_BYTE *)(a2 + 32)));
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

void *sub_10001F8F0()
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
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  sub_10000E354(&qword_10003DBC0);
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_28;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
      {
        v9 = v18 + 2;
        if (v18 + 2 >= v13)
          goto LABEL_28;
        v19 = *(_QWORD *)(v6 + 8 * v9);
        if (!v19)
          break;
      }
    }
LABEL_27:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = (void *)swift_retain(v17);
  }
  v20 = v18 + 3;
  if (v20 >= v13)
    goto LABEL_28;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_10001FA98()
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
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  sub_10000E354(&qword_10003DBB8);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 56);
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_28;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
      {
        v9 = v18 + 2;
        if (v18 + 2 >= v13)
          goto LABEL_28;
        v19 = *(_QWORD *)(v6 + 8 * v9);
        if (!v19)
          break;
      }
    }
LABEL_27:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = v17;
  }
  v20 = v18 + 3;
  if (v20 >= v13)
    goto LABEL_28;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

Swift::Int sub_10001FC40(uint64_t a1)
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
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  int64_t v31;
  _QWORD v32[9];

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_10000E354(&qword_10003DBC0);
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
  v30 = v2;
  v31 = (unint64_t)(v7 + 63) >> 6;
  v11 = v5 + 56;
  result = swift_retain(v3);
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v15 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v16 = v15 | (v13 << 6);
      goto LABEL_27;
    }
    v17 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v31)
      goto LABEL_36;
    v18 = *(_QWORD *)(v8 + 8 * v17);
    ++v13;
    if (!v18)
    {
      v13 = v17 + 1;
      if (v17 + 1 >= v31)
        goto LABEL_36;
      v18 = *(_QWORD *)(v8 + 8 * v13);
      if (!v18)
      {
        v13 = v17 + 2;
        if (v17 + 2 >= v31)
          goto LABEL_36;
        v18 = *(_QWORD *)(v8 + 8 * v13);
        if (!v18)
          break;
      }
    }
LABEL_26:
    v10 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v13 << 6);
LABEL_27:
    v20 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v16);
    Hasher.init(_seed:)(v32, *(_QWORD *)(v6 + 40));
    Hasher._combine(_:)(*(_DWORD *)(v20 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid));
    v21 = *(_QWORD *)(v20 + 24);
    v22 = *(_QWORD *)(v20 + 32);
    swift_retain(v20);
    swift_bridgeObjectRetain(v22);
    String.hash(into:)(v32, v21, v22);
    swift_bridgeObjectRelease(v22);
    result = Hasher._finalize()();
    v23 = -1 << *(_BYTE *)(v6 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v11 + 8 * (v24 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v11 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v11 + 8 * v25);
      }
      while (v29 == -1);
      v14 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v14) = v20;
    ++*(_QWORD *)(v6 + 16);
  }
  v19 = v17 + 3;
  if (v19 >= v31)
  {
LABEL_36:
    result = swift_release_n(v3, 2);
    v2 = v30;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v8 + 8 * v19);
  if (v18)
  {
    v13 = v19;
    goto LABEL_26;
  }
  while (1)
  {
    v13 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v13 >= v31)
      goto LABEL_36;
    v18 = *(_QWORD *)(v8 + 8 * v13);
    ++v19;
    if (v18)
      goto LABEL_26;
  }
LABEL_40:
  __break(1u);
  return result;
}

Swift::Int sub_10001FF10(uint64_t a1)
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
  Swift::Int v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_10000E354(&qword_10003DBB8);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0);
  v6 = v5;
  if (!*(_QWORD *)(v3 + 16))
  {
    result = swift_release(v3);
LABEL_38:
    *v2 = v6;
    return result;
  }
  v30 = v2;
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
    v21 = *(_QWORD *)(v6 + 40);
    v22 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v17);
    result = NSObject._rawHashValue(seed:)(v21);
    v23 = -1 << *(_BYTE *)(v6 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v12 + 8 * (v24 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v12 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v25);
      }
      while (v29 == -1);
      v15 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v22;
    ++*(_QWORD *)(v6 + 16);
  }
  v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_36:
    result = swift_release_n(v3, 2);
    v2 = v30;
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

uint64_t sub_100020188(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  Swift::UInt32 v8;
  uint64_t v9;
  uint64_t v10;
  Swift::Int v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[9];

  v3 = *v1;
  if ((*v1 & 0xC000000000000001) != 0)
  {
    if (v3 < 0)
      v4 = *v1;
    else
      v4 = v3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v3);
    v5 = swift_retain(a1);
    v6 = __CocoaSet.contains(_:)(v5, v4);
    swift_release(a1);
    if ((v6 & 1) != 0)
    {
      v7 = sub_10002055C(v4, a1);
      swift_bridgeObjectRelease(v3);
      return v7;
    }
LABEL_17:
    swift_bridgeObjectRelease(v3);
    return 0;
  }
  Hasher.init(_seed:)(v25, *(_QWORD *)(v3 + 40));
  v8 = *(_DWORD *)(a1 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid);
  Hasher._combine(_:)(v8);
  v9 = *(_QWORD *)(a1 + 24);
  v10 = *(_QWORD *)(a1 + 32);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v10);
  String.hash(into:)(v25, v9, v10);
  swift_bridgeObjectRelease(v10);
  v11 = Hasher._finalize()();
  v12 = -1 << *(_BYTE *)(v3 + 32);
  v13 = v11 & ~v12;
  if (((*(_QWORD *)(v3 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
    goto LABEL_17;
  v14 = ~v12;
  v15 = *(_QWORD *)(v3 + 48);
  v16 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
  while (1)
  {
    v17 = *(_QWORD *)(v15 + 8 * v13);
    if (*(_DWORD *)(v17 + v16) == v8)
      break;
LABEL_9:
    v13 = (v13 + 1) & v14;
    if (((*(_QWORD *)(v3 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      goto LABEL_17;
  }
  v18 = *(_QWORD *)(v17 + 24);
  v19 = *(_QWORD *)(v17 + 32);
  v20 = v18 == v9 && v19 == v10;
  if (!v20 && (_stringCompareWithSmolCheck(_:_:expecting:)(v18, v19) & 1) == 0)
  {
    v16 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
    goto LABEL_9;
  }
  swift_bridgeObjectRelease(v3);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v1);
  v23 = *v1;
  v25[0] = *v1;
  *v1 = 0x8000000000000000;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    sub_10001F8F0();
    v23 = v25[0];
  }
  v7 = *(_QWORD *)(*(_QWORD *)(v23 + 48) + 8 * v13);
  sub_1000208D4(v13);
  v24 = *v1;
  *v1 = v25[0];
  swift_bridgeObjectRelease(v24);
  return v7;
}

uint64_t sub_100020388(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  id v6;
  char v7;
  uint64_t v8;
  Swift::Int v9;
  Swift::Int v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  char v14;
  uint64_t v15;
  id v16;
  char v17;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;

  v2 = v1;
  v4 = *v1;
  if ((*v1 & 0xC000000000000001) != 0)
  {
    if (v4 < 0)
      v5 = *v1;
    else
      v5 = v4 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v4);
    v6 = a1;
    v7 = __CocoaSet.contains(_:)(v6, v5);

    if ((v7 & 1) != 0)
    {
      v8 = sub_10002073C(v5, (uint64_t)v6);
      swift_bridgeObjectRelease(v4);
      return v8;
    }
LABEL_15:
    swift_bridgeObjectRelease(v4);
    return 0;
  }
  v9 = *(_QWORD *)(v4 + 40);
  swift_bridgeObjectRetain(v4);
  v10 = NSObject._rawHashValue(seed:)(v9);
  v11 = -1 << *(_BYTE *)(v4 + 32);
  v12 = v10 & ~v11;
  if (((*(_QWORD *)(v4 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
    goto LABEL_15;
  sub_10000F8F8(0, &qword_10003DBB0, NSXPCConnection_ptr);
  v13 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v12);
  v14 = static NSObject.== infix(_:_:)(v13, a1);

  if ((v14 & 1) == 0)
  {
    v15 = ~v11;
    do
    {
      v12 = (v12 + 1) & v15;
      if (((*(_QWORD *)(v4 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
        goto LABEL_15;
      v16 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v12);
      v17 = static NSObject.== infix(_:_:)(v16, a1);

    }
    while ((v17 & 1) == 0);
  }
  swift_bridgeObjectRelease(v4);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
  v19 = *v2;
  v22 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10001FA98();
    v19 = v22;
  }
  v8 = *(_QWORD *)(*(_QWORD *)(v19 + 48) + 8 * v12);
  sub_100020AC8(v12);
  v20 = *v2;
  *v2 = v22;
  swift_bridgeObjectRelease(v20);
  return v8;
}

uint64_t sub_10002055C(uint64_t a1, uint64_t a2)
{
  Swift::Int *v2;
  Swift::Int *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  Swift::Int v9;
  Swift::UInt32 v10;
  uint64_t v11;
  uint64_t v12;
  Swift::Int v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  BOOL v21;
  uint64_t result;
  _QWORD v23[9];
  Swift::Int v24;

  v3 = v2;
  swift_bridgeObjectRelease(*v3);
  v6 = __CocoaSet.count.getter(a1);
  v8 = swift_unknownObjectRetain(a1, v7);
  v9 = sub_10001EDDC(v8, v6);
  v24 = v9;
  Hasher.init(_seed:)(v23, *(_QWORD *)(v9 + 40));
  v10 = *(_DWORD *)(a2 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid);
  Hasher._combine(_:)(v10);
  v11 = *(_QWORD *)(a2 + 24);
  v12 = *(_QWORD *)(a2 + 32);
  swift_retain(v9);
  swift_bridgeObjectRetain(v12);
  String.hash(into:)(v23, v11, v12);
  swift_bridgeObjectRelease(v12);
  v13 = Hasher._finalize()();
  v14 = -1 << *(_BYTE *)(v9 + 32);
  v15 = v13 & ~v14;
  if (((*(_QWORD *)(v9 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
    goto LABEL_21;
  v16 = ~v14;
  v17 = *(_QWORD *)(v9 + 48);
  v18 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
  while (1)
  {
    v19 = *(_QWORD *)(v17 + 8 * v15);
    if (*(_DWORD *)(v19 + v18) == v10)
      break;
LABEL_3:
    v15 = (v15 + 1) & v16;
    if (((*(_QWORD *)(v9 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
      goto LABEL_20;
  }
  v20 = *(_QWORD *)(v19 + 24) == v11 && *(_QWORD *)(v19 + 32) == v12;
  if (!v20 && (((uint64_t (*)(void))_stringCompareWithSmolCheck(_:_:expecting:))() & 1) == 0)
  {
    v18 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
    goto LABEL_3;
  }
  swift_release(v9);
  v9 = *(_QWORD *)(*(_QWORD *)(v9 + 48) + 8 * v15);
  sub_1000208D4(v15);
  if (v10 == *(_DWORD *)(v9 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid))
  {
    v21 = v11 == *(_QWORD *)(v9 + 24) && v12 == *(_QWORD *)(v9 + 32);
    if (v21 || (_stringCompareWithSmolCheck(_:_:expecting:)(v11, v12) & 1) != 0)
    {
      *v3 = v24;
      return v9;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_20:
  swift_release(v9);
  __break(1u);
LABEL_21:
  result = swift_release(v9);
  __break(1u);
  return result;
}

uint64_t sub_10002073C(uint64_t a1, uint64_t a2)
{
  Swift::Int *v2;
  Swift::Int *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  Swift::Int v9;
  Swift::Int v10;
  Swift::Int v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t result;
  Swift::Int v20;

  v3 = v2;
  swift_bridgeObjectRelease(*v3);
  v6 = __CocoaSet.count.getter(a1);
  v8 = swift_unknownObjectRetain(a1, v7);
  v9 = sub_10001F010(v8, v6);
  v20 = v9;
  v10 = *(_QWORD *)(v9 + 40);
  swift_retain(v9);
  v11 = NSObject._rawHashValue(seed:)(v10);
  v12 = -1 << *(_BYTE *)(v9 + 32);
  v13 = v11 & ~v12;
  if (((*(_QWORD *)(v9 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
  {
    sub_10000F8F8(0, &qword_10003DBB0, NSXPCConnection_ptr);
    v14 = *(id *)(*(_QWORD *)(v9 + 48) + 8 * v13);
    v15 = ((uint64_t (*)(void))static NSObject.== infix(_:_:))();

    if ((v15 & 1) != 0)
    {
LABEL_6:
      swift_release(v9);
      v9 = *(_QWORD *)(*(_QWORD *)(v9 + 48) + 8 * v13);
      sub_100020AC8(v13);
      if ((static NSObject.== infix(_:_:)(a2, v9) & 1) != 0)
      {
        *v3 = v20;
        return v9;
      }
      __break(1u);
    }
    else
    {
      v16 = ~v12;
      while (1)
      {
        v13 = (v13 + 1) & v16;
        if (((*(_QWORD *)(v9 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
          break;
        v17 = *(id *)(*(_QWORD *)(v9 + 48) + 8 * v13);
        v18 = ((uint64_t (*)(void))static NSObject.== infix(_:_:))();

        if ((v18 & 1) != 0)
          goto LABEL_6;
      }
    }
    swift_release(v9);
    __break(1u);
  }
  result = swift_release(v9);
  __break(1u);
  return result;
}

unint64_t sub_1000208D4(unint64_t result)
{
  _QWORD *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  Swift::Int v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  _QWORD v21[9];

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain(*v1);
    v8 = _HashTable.previousHole(before:)(v2, v4, v7);
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v10 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v6);
        Hasher.init(_seed:)(v21, *(_QWORD *)(v3 + 40));
        Hasher._combine(_:)(*(_DWORD *)(v10 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid));
        v11 = *(_QWORD *)(v10 + 24);
        v12 = *(_QWORD *)(v10 + 32);
        swift_retain(v10);
        swift_bridgeObjectRetain(v12);
        String.hash(into:)(v21, v11, v12);
        swift_bridgeObjectRelease(v12);
        v13 = Hasher._finalize()();
        swift_release(v10);
        v14 = v13 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v14 < v9)
            goto LABEL_5;
        }
        else if (v14 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v14)
        {
LABEL_11:
          v15 = *(_QWORD *)(v3 + 48);
          v16 = (_QWORD *)(v15 + 8 * v2);
          v17 = (_QWORD *)(v15 + 8 * v6);
          if (v2 != v6 || (v2 = v6, v16 >= v17 + 1))
          {
            *v16 = *v17;
            v2 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release(v3);
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v18 = *(_QWORD *)(v3 + 16);
  v19 = __OFSUB__(v18, 1);
  v20 = v18 - 1;
  if (v19)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v20;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

unint64_t sub_100020AC8(unint64_t result)
{
  _QWORD *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  Swift::Int v10;
  id v11;
  Swift::Int v12;
  Swift::Int v13;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain(*v1);
    v8 = _HashTable.previousHole(before:)(v2, v4, v7);
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v10 = *(_QWORD *)(v3 + 40);
        v11 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v6);
        v12 = NSObject._rawHashValue(seed:)(v10);

        v13 = v12 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v13 >= v9 && v2 >= v13)
          {
LABEL_16:
            v16 = *(_QWORD *)(v3 + 48);
            v17 = (_QWORD *)(v16 + 8 * v2);
            v18 = (_QWORD *)(v16 + 8 * v6);
            if (v2 != v6 || (v2 = v6, v17 >= v18 + 1))
            {
              *v17 = *v18;
              v2 = v6;
            }
          }
        }
        else if (v13 >= v9 || v2 >= v13)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release(v3);
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v19 = *(_QWORD *)(v3 + 16);
  v20 = __OFSUB__(v19, 1);
  v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v21;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

void (*sub_100020C68(uint64_t **a1, unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  uint64_t *v6;

  v6 = (uint64_t *)malloc(0x28uLL);
  *a1 = v6;
  v6[4] = (uint64_t)sub_100020CE8(v6, a2, a3);
  return sub_100020CBC;
}

void sub_100020CBC(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t *sub_100020CE8(uint64_t *result, unint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = specialized _ArrayBuffer._getElementSlowPath(_:)(a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = swift_retain(*(_QWORD *)(a3 + 8 * a2 + 32));
LABEL_5:
    *v3 = v4;
    return (uint64_t *)sub_100020D54;
  }
  __break(1u);
  return result;
}

uint64_t sub_100020D54(_QWORD *a1)
{
  return swift_release(*a1);
}

_QWORD *sub_100020D5C(uint64_t a1, void *a2, _QWORD *a3)
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __n128 v40;
  _QWORD *v41;
  uint64_t v42;
  char *v43;
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
  char *v54;
  uint64_t KeyPath;
  int v56;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  NSObject *v70;
  uint64_t v71;
  uint32_t v72;
  uint64_t v73;
  NSObject *v74;
  os_log_type_t v75;
  uint64_t v76;
  NSObject *v77;
  os_log_type_t v78;
  const char *v79;
  uint64_t v80;
  NSObject *v81;
  os_log_type_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t v87;
  uint64_t v88;
  int v89;
  uint64_t v91;
  _QWORD *v92;
  uint64_t v93;
  char *v94;
  __n128 v95;
  __n128 v96;
  unint64_t v97;
  unint64_t v98;
  uint64_t v99;
  int v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  id v109;
  _QWORD *v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  int v115;
  int v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t aBlock[5];
  uint64_t v120;

  v109 = a2;
  v5 = sub_10000E354((uint64_t *)&unk_10003DC10);
  __chkstk_darwin(v5);
  v103 = (uint64_t)&v91 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v108 = type metadata accessor for SystemMonitorConfig.MonitorType(0);
  v112 = *(_QWORD *)(v108 - 8);
  __chkstk_darwin(v108);
  v107 = (char *)&v91 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v102 = type metadata accessor for FeatureInfo(0);
  v114 = *(_QWORD *)(v102 - 8);
  v8 = __chkstk_darwin(v102);
  v117 = (uint64_t)&v91 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v8);
  v105 = (char *)&v91 - v11;
  v106 = v12;
  __chkstk_darwin(v10);
  v104 = (uint64_t)&v91 - v13;
  v14 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v14);
  v16 = (char *)&v91 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v18 = *(_QWORD *)(v17 - 8);
  __chkstk_darwin(v17);
  v20 = (char *)&v91 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v21);
  v23 = (char *)&v91 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_10000FACC((uint64_t)_swiftEmptyArrayStorage);
  v25 = sub_10000E354(&qword_10003D638);
  v26 = swift_allocObject(v25, 28, 7);
  *(_DWORD *)(v26 + 24) = 0;
  *(_QWORD *)(v26 + 16) = v24;
  a3[2] = v26;
  v118 = sub_10000F8F8(0, (unint64_t *)&qword_10003D640, OS_dispatch_queue_ptr);
  static DispatchQoS.default.getter();
  (*(void (**)(char *, _QWORD, uint64_t))(v18 + 104))(v20, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v17);
  aBlock[0] = (uint64_t)_swiftEmptyArrayStorage;
  v27 = sub_100006818((unint64_t *)&unk_10003DBF0, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  v28 = sub_10000E354(&qword_10003D648);
  v29 = sub_10000AD58((unint64_t *)&qword_10003DC00, &qword_10003D648);
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v28, v29, v14, v27);
  v30 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD00000000000002FLL, 0x8000000100032940, v23, v16, v20, 0);
  a3[5] = v30;
  v31 = static Logger.service.getter(v30);
  v32 = Logger.logObject.getter(v31);
  v33 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v34 = 0;
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "SystemMonitor.init()", v34, 2u);
    swift_slowDealloc(v34, -1, -1);
  }

  a3[4] = a1;
  swift_retain(a1);
  v93 = a1;
  v35 = sub_10002F300();
  a3[3] = v35;
  v36 = v35[2];
  v92 = v35;
  if (v36)
  {
    v111 = (char *)a3 + OBJC_IVAR____TtC15audioanalyticsd13SystemMonitor_logger;
    v37 = *(unsigned __int8 *)(v114 + 80);
    v38 = (v37 + 32) & ~v37;
    v39 = (uint64_t)v35 + v38;
    v116 = enum case for SystemMonitorConfig.MonitorType.defaults(_:);
    v115 = enum case for SystemMonitorConfig.MonitorType.notify(_:);
    v100 = enum case for SystemMonitorConfig.MonitorType.other(_:);
    v99 = v37 | 7;
    v101 = v38;
    v98 = (v106 + v38 + 7) & 0xFFFFFFFFFFFFFFF8;
    v97 = v98 + 8;
    v114 = *(_QWORD *)(v114 + 72);
    v40 = swift_bridgeObjectRetain(v35);
    v40.n128_u64[0] = 67109376;
    v96 = v40;
    v40.n128_u64[0] = 136380675;
    v95 = v40;
    v94 = (char *)&type metadata for Any + 8;
    v41 = a3;
    v110 = a3;
    v42 = v112;
    v43 = v107;
    v44 = v108;
    v45 = v104;
    v46 = (uint64_t)v105;
    while (1)
    {
      sub_100006978(v39, v45, type metadata accessor for FeatureInfo);
      (*(void (**)(char *, uint64_t, uint64_t))(v42 + 16))(v43, v45, v44);
      v56 = (*(uint64_t (**)(char *, uint64_t))(v42 + 88))(v43, v44);
      if (v56 != v116 && v56 != v115)
      {
        if (v56 == v100)
        {
          sub_100013324(v45);
        }
        else
        {
          v118 = v36;
          v80 = sub_100006978(v45, v46, type metadata accessor for FeatureInfo);
          v81 = Logger.logObject.getter(v80);
          v82 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v81, v82))
          {
            v83 = swift_slowAlloc(12, -1);
            v84 = swift_slowAlloc(32, -1);
            aBlock[0] = v84;
            *(_DWORD *)v83 = v95.n128_u32[0];
            v85 = SystemMonitorConfig.MonitorType.rawValue.getter();
            v87 = v86;
            *(_QWORD *)(v83 + 4) = sub_10000A7E4(v85, v86, aBlock);
            swift_bridgeObjectRelease(v87);
            sub_100013324(v46);
            _os_log_impl((void *)&_mh_execute_header, v81, v82, "Encountered unknown monitorType. { monitorType=%{private}s }", (uint8_t *)v83, 0xCu);
            swift_arrayDestroy(v84, 1, v94);
            v88 = v84;
            v41 = v110;
            swift_slowDealloc(v88, -1, -1);
            swift_slowDealloc(v83, -1, -1);
          }
          else
          {
            sub_100013324(v46);
          }

          sub_100013324(v45);
          v36 = v118;
          v42 = v112;
          (*(void (**)(char *, uint64_t))(v112 + 8))(v43, v44);
        }
        goto LABEL_7;
      }
      v118 = v36;
      v58 = swift_allocObject(&unk_100039EF0, 20, 7);
      *(_DWORD *)(v58 + 16) = -1;
      v59 = (uint64_t *)(v45 + *(int *)(v102 + 28));
      v113 = *v59;
      v60 = v45;
      v61 = v59[1];
      v62 = (void *)v41[5];
      v63 = swift_allocObject(&unk_100039F18, 24, 7);
      swift_weakInit(v63 + 16, v41);
      v64 = swift_allocObject(&unk_100039F40, 32, 7);
      *(_QWORD *)(v64 + 24) = &off_100039AD0;
      swift_unknownObjectWeakInit(v64 + 16, v109);
      v65 = v60;
      v66 = v117;
      sub_100006978(v65, v117, type metadata accessor for FeatureInfo);
      v67 = swift_allocObject(&unk_100039F68, v97, v99);
      *(_QWORD *)(v67 + 16) = v63;
      *(_QWORD *)(v67 + 24) = v64;
      sub_100022338(v66, v67 + v101);
      *(_QWORD *)(v67 + v98) = v58;
      aBlock[4] = (uint64_t)sub_10002237C;
      v120 = v67;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_100017B08;
      aBlock[3] = (uint64_t)&unk_100039F80;
      v68 = _Block_copy(aBlock);
      v69 = v120;
      swift_bridgeObjectRetain(v61);
      v70 = v62;
      swift_retain(v58);
      swift_release(v69);
      v71 = String.utf8CString.getter(v113, v61);
      swift_bridgeObjectRelease(v61);
      swift_beginAccess(v58 + 16, aBlock, 33, 0);
      v72 = notify_register_dispatch((const char *)(v71 + 32), (int *)(v58 + 16), v70, v68);
      swift_endAccess(aBlock);
      swift_release(v71);
      _Block_release(v68);

      v73 = swift_retain(v58);
      v74 = Logger.logObject.getter(v73);
      if (v72)
      {
        v75 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v74, v75))
        {
          v76 = swift_slowAlloc(14, -1);
          *(_DWORD *)v76 = v96.n128_u32[0];
          *(_DWORD *)(v76 + 4) = v72;
          *(_WORD *)(v76 + 8) = 1024;
          *(_DWORD *)(v76 + 10) = *(_DWORD *)(v58 + 16);
          swift_release(v58);
          v77 = v74;
          v78 = v75;
          v79 = "Notify setup result is not OK! { result=%u, token=%d }";
LABEL_22:
          _os_log_impl((void *)&_mh_execute_header, v77, v78, v79, (uint8_t *)v76, 0xEu);
          swift_slowDealloc(v76, -1, -1);
          goto LABEL_6;
        }
      }
      else
      {
        v89 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v74, (os_log_type_t)v89))
        {
          v76 = swift_slowAlloc(14, -1);
          *(_QWORD *)v76 = v96.n128_u32[0];
          *(_WORD *)(v76 + 8) = 1024;
          *(_DWORD *)(v76 + 10) = *(_DWORD *)(v58 + 16);
          swift_release(v58);
          v77 = v74;
          v78 = v89;
          v79 = "Notify setup result. { result=%u, token=%d }";
          goto LABEL_22;
        }
      }
      swift_release(v58);
LABEL_6:
      v41 = v110;

      v47 = *(unsigned int *)(v58 + 16);
      LOBYTE(aBlock[0]) = 0;
      v48 = v103;
      v49 = v104;
      sub_10002C1A4(v104, v47, v103);
      v50 = v41[2];
      v51 = v117;
      v52 = sub_100006978(v49, v117, type metadata accessor for FeatureInfo);
      __chkstk_darwin(v52);
      v54 = (char *)&v91 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_100022338(v51, (uint64_t)v54);
      KeyPath = swift_getKeyPath(&unk_100031E60, v54);
      swift_retain(v50);
      OSAllocatedUnfairLock.assign<A>(_:newValue:)(KeyPath, v48, v50);
      swift_release(v50);
      swift_release(KeyPath);
      v45 = v49;
      sub_100022568(v48);
      sub_100013324(v49);
      swift_release(v58);
      v43 = v107;
      v44 = v108;
      v46 = (uint64_t)v105;
      v36 = v118;
      v42 = v112;
LABEL_7:
      v39 += v114;
      if (!--v36)
        goto LABEL_26;
    }
  }
  swift_bridgeObjectRetain(v35);
  v41 = a3;
LABEL_26:
  swift_release(v93);

  swift_bridgeObjectRelease(v92);
  return v41;
}

uint64_t sub_1000217B4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Swift::String v11;
  Swift::Bool v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
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
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  __n128 v53;
  uint64_t v54;
  uint64_t result;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;

  v57 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v57 - 8);
  __chkstk_darwin(v57);
  v4 = (char *)&v56 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (unint64_t)_swiftEmptyArrayStorage;
  v61 = (unint64_t)_swiftEmptyArrayStorage;
  v6 = *(_QWORD *)(a1 + 16);
  if (v6)
  {
    swift_bridgeObjectRetain(a1);
    v7 = (_QWORD *)(a1 + 40);
    do
    {
      v9 = *(v7 - 1);
      v10 = *v7;
      swift_bridgeObjectRetain_n(*v7, 2);
      v11._countAndFlagsBits = 1668179246;
      v11._object = (void *)0xE400000000000000;
      v12 = String.hasSuffix(_:)(v11);
      v13 = static DeviceUtilities.currentPlatform.getter();
      v15 = v14;
      v16 = type metadata accessor for Config(0);
      swift_allocObject(v16, *(unsigned int *)(v16 + 48), *(unsigned __int16 *)(v16 + 52));
      v17 = Config.init(configPath:allowUnknownFields:platform:encrypted:)(v9, v10, 1, v13, v15, v12);
      v18 = swift_bridgeObjectRelease(v10);
      if (v17)
      {
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v18);
        v20 = *(_QWORD *)((v61 & 0xFFFFFFFFFFFFFF8) + 0x10);
        v19 = *(_QWORD *)((v61 & 0xFFFFFFFFFFFFFF8) + 0x18);
        if (v20 >= v19 >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v19 > 1, v20 + 1, 1);
        v8 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v20, v17);
        specialized Array._endMutation()(v8);
      }
      v7 += 2;
      --v6;
    }
    while (v6);
    swift_bridgeObjectRelease(a1);
    v5 = v61;
  }
  v61 = v5;
  v21 = type metadata accessor for Config(0);
  v22 = static Config.defaultConfigPathEncrypted.getter();
  v24 = v23;
  v25 = static DeviceUtilities.currentPlatform.getter();
  v27 = v26;
  swift_allocObject(v21, *(unsigned int *)(v21 + 48), *(unsigned __int16 *)(v21 + 52));
  v28 = Config.init(configPath:allowUnknownFields:platform:encrypted:)(v22, v24, 0, v25, v27, 1);
  if (v28)
  {
    v29 = v28;
    v30 = swift_retain(v28);
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v30);
    v32 = *(_QWORD *)((v61 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v31 = *(_QWORD *)((v61 & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v32 >= v31 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v31 > 1, v32 + 1, 1);
    v33 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v32, v29);
    specialized Array._endMutation()(v33);
    swift_release(v29);
    v5 = v61;
  }
  if ((v5 & 0x8000000000000000) != 0 || (v5 & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain(v5);
    v34 = (uint64_t)sub_100014AD8(v52);
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v34 = v5 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v5);
  }
  v60 = v34;
  sub_10001E140(&v60);
  swift_bridgeObjectRelease(v5);
  v35 = v60;
  if ((v60 & 0x8000000000000000) == 0 && (v60 & 0x4000000000000000) == 0)
  {
    v36 = *(_QWORD *)(v60 + 16);
    if (v36)
      goto LABEL_19;
LABEL_30:
    swift_release(v35);
    return 0;
  }
  v53 = swift_bridgeObjectRetain(v60);
  v36 = _CocoaArrayWrapper.endIndex.getter(v54, v53);
  swift_release(v35);
  if (!v36)
    goto LABEL_30;
LABEL_19:
  v37 = v36 - 1;
  if (__OFSUB__(v36, 1))
  {
    __break(1u);
    goto LABEL_33;
  }
  if ((v35 & 0xC000000000000001) != 0)
  {
LABEL_33:
    v38 = specialized _ArrayBuffer._getElementSlowPath(_:)(v37, v35);
    goto LABEL_24;
  }
  if ((v37 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v37 < *(_QWORD *)(v35 + 16))
  {
    v38 = *(_QWORD *)(v35 + 8 * v37 + 32);
    swift_retain(v38);
LABEL_24:
    v39 = swift_release(v35);
    static Logger.config.getter(v39);
    v40 = swift_retain_n(v38, 4);
    v41 = Logger.logObject.getter(v40);
    v42 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = swift_slowAlloc(22, -1);
      v44 = swift_slowAlloc(64, -1);
      v60 = v44;
      *(_DWORD *)v43 = 136380931;
      v45 = Config.configPath.getter();
      v47 = v46;
      v58 = sub_10000A7E4(v45, v46, &v60);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, &v59, v43 + 4, v43 + 12);
      swift_release_n(v38, 2);
      v48 = swift_bridgeObjectRelease(v47);
      *(_WORD *)(v43 + 12) = 2081;
      v49 = Config.sortableConfigVersion.getter(v48);
      v51 = v50;
      v58 = sub_10000A7E4(v49, v50, &v60);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, &v59, v43 + 14, v43 + 22);
      swift_release_n(v38, 2);
      swift_bridgeObjectRelease(v51);
      _os_log_impl((void *)&_mh_execute_header, v41, v42, "Server.findConfig returning. { path=%{private}s, configVersion=%{private}s }", (uint8_t *)v43, 0x16u);
      swift_arrayDestroy(v44, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v44, -1, -1);
      swift_slowDealloc(v43, -1, -1);

    }
    else
    {

      swift_release_n(v38, 4);
    }
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v57);
    return v38;
  }
  __break(1u);
  result = swift_release(v60);
  __break(1u);
  return result;
}

void sub_100021C58(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id i;
  int64_t v23;
  unint64_t v24;
  uint64_t v25;
  unsigned int v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[5];
  void *v31;

  v3 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0)
      v4 = a1;
    else
      v4 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v5 = __CocoaSet.makeIterator()(v4);
    v6 = sub_10000F8F8(0, &qword_10003DBB0, NSXPCConnection_ptr);
    v7 = sub_100022154();
    v8 = Set.Iterator.init(_cocoa:)(v30, v5, v6, v7);
    v3 = v30[0];
    v28 = v30[1];
    v9 = v30[2];
    v10 = v30[3];
    v11 = v30[4];
  }
  else
  {
    v12 = -1 << *(_BYTE *)(a1 + 32);
    v28 = a1 + 56;
    v9 = ~v12;
    v13 = -v12;
    if (v13 < 64)
      v14 = ~(-1 << v13);
    else
      v14 = -1;
    v11 = v14 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain(a1);
    v10 = 0;
  }
  v27 = (unint64_t)(v9 + 64) >> 6;
  if (v3 < 0)
    goto LABEL_13;
LABEL_11:
  if (v11)
  {
    v15 = (v11 - 1) & v11;
    v16 = __clz(__rbit64(v11)) | (v10 << 6);
    v17 = v10;
    goto LABEL_32;
  }
  v23 = v10 + 1;
  if (!__OFADD__(v10, 1))
  {
    if (v23 < v27)
    {
      v24 = *(_QWORD *)(v28 + 8 * v23);
      v17 = v10 + 1;
      if (v24)
        goto LABEL_31;
      v17 = v10 + 2;
      if (v10 + 2 >= v27)
        goto LABEL_36;
      v24 = *(_QWORD *)(v28 + 8 * v17);
      if (v24)
        goto LABEL_31;
      v17 = v10 + 3;
      if (v10 + 3 >= v27)
        goto LABEL_36;
      v24 = *(_QWORD *)(v28 + 8 * v17);
      if (v24)
        goto LABEL_31;
      v17 = v10 + 4;
      if (v10 + 4 >= v27)
        goto LABEL_36;
      v24 = *(_QWORD *)(v28 + 8 * v17);
      if (v24)
      {
LABEL_31:
        v15 = (v24 - 1) & v24;
        v16 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_32:
        for (i = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v16); i; v15 = v11)
        {
          v26 = objc_msgSend(i, "processIdentifier");
          if (v26 == *(_DWORD *)(a2 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid))
            break;

          v10 = v17;
          v11 = v15;
          if ((v3 & 0x8000000000000000) == 0)
            goto LABEL_11;
LABEL_13:
          v18 = __CocoaSet.Iterator.next()(v8);
          if (!v18)
            break;
          v19 = v18;
          v29 = v18;
          v20 = sub_10000F8F8(0, &qword_10003DBB0, NSXPCConnection_ptr);
          swift_unknownObjectRetain(v19, v21);
          swift_dynamicCast(&v31, &v29, (char *)&type metadata for Swift.AnyObject + 8, v20, 7);
          i = v31;
          swift_unknownObjectRelease(v19);
          v17 = v10;
        }
        goto LABEL_36;
      }
      v17 = v10 + 5;
      if (v10 + 5 < v27)
      {
        v24 = *(_QWORD *)(v28 + 8 * v17);
        if (!v24)
        {
          v25 = v10 + 6;
          while (v27 != v25)
          {
            v24 = *(_QWORD *)(v28 + 8 * v25++);
            if (v24)
            {
              v17 = v25 - 1;
              goto LABEL_31;
            }
          }
          goto LABEL_36;
        }
        goto LABEL_31;
      }
    }
LABEL_36:
    sub_100014E70(v3);
    return;
  }
  __break(1u);
}

uint64_t sub_100021F48()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100021F7C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100021F8C()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100021FB0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 40));
  swift_release(*(_QWORD *)(v0 + 48));
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100021FEC()
{
  return sub_1000220D4((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10001C750);
}

uint64_t sub_100021FFC()
{
  return sub_1000220D4((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10001CE2C);
}

uint64_t sub_100022008()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 32, 7);
}

unint64_t sub_10002202C()
{
  uint64_t v0;

  return sub_10001D360(*(_QWORD *)(v0 + 16), *(double *)(v0 + 24));
}

uint64_t sub_10002203C()
{
  return sub_1000220D4((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10001D4F4);
}

uint64_t sub_100022048()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100022074()
{
  uint64_t v0;

  return sub_10001BC2C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_10002207C(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease(result);
  return result;
}

uint64_t sub_10002208C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000220C8()
{
  return sub_1000220D4((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10001CB58);
}

uint64_t sub_1000220D4(uint64_t (*a1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v1;

  return a1(v1[2], v1[3], v1[4], v1[5], v1[6]);
}

uint64_t sub_1000220E8()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000220F8()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002211C()
{
  return sub_10001A9C4(60, 0);
}

uint64_t sub_100022144()
{
  uint64_t v0;

  return sub_10001BE70(*(char **)(v0 + 16));
}

uint64_t sub_10002214C()
{
  uint64_t v0;

  return sub_10001C06C(*(_QWORD *)(v0 + 16));
}

unint64_t sub_100022154()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10003DC08;
  if (!qword_10003DC08)
  {
    v1 = sub_10000F8F8(255, &qword_10003DBB0, NSXPCConnection_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_10003DC08);
  }
  return result;
}

uint64_t sub_1000221AC()
{
  uint64_t v0;

  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000221D0()
{
  uint64_t *v0;

  return sub_10001BC8C(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t sub_1000221DC()
{
  uint64_t v0;

  return swift_deallocObject(v0, 20, 7);
}

uint64_t sub_1000221EC()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100022210()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100022234()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = (int *)type metadata accessor for FeatureInfo(0);
  v2 = *((_QWORD *)v1 - 1);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 32) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  v7 = v0 + v4;
  v8 = type metadata accessor for SystemMonitorConfig.MonitorType(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  swift_bridgeObjectRelease(*(_QWORD *)(v7 + v1[5] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(v7 + v1[6] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(v7 + v1[7] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(v7 + v1[8] + 8));
  v9 = v7 + v1[9];
  v10 = type metadata accessor for SystemMonitorConfig.DataType(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  swift_release(*(_QWORD *)(v0 + v6));
  return swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_100022338(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FeatureInfo(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002237C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(type metadata accessor for FeatureInfo(0) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_10002B0E4(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), v1 + v4, *(char **)(v1 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_1000223D0()
{
  return sub_100006818(&qword_10003DC20, type metadata accessor for FeatureInfo, (uint64_t)&unk_100032128);
}

uint64_t sub_1000223FC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_100019C90(a2, *a1, a3);
}

unint64_t sub_100022410()
{
  return (*(_QWORD *)(*(_QWORD *)(type metadata accessor for FeatureInfo(0) - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8;
}

uint64_t sub_100022444(uint64_t a1)
{
  uint64_t v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = type metadata accessor for SystemMonitorConfig.MonitorType(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  v3 = (int *)type metadata accessor for FeatureInfo(0);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + v3[5] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + v3[6] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + v3[7] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + v3[8] + 8));
  v4 = a1 + v3[9];
  v5 = type metadata accessor for SystemMonitorConfig.DataType(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t sub_1000224E8(uint64_t a1, uint64_t a2)
{
  sub_100006978(a1, a2, type metadata accessor for FeatureInfo);
  return type metadata accessor for FeatureInfo(0);
}

uint64_t sub_100022508(uint64_t a1, uint64_t a2)
{
  return sub_10002F514(a2, a1);
}

Swift::Int sub_100022518()
{
  return sub_10002E6DC();
}

uint64_t sub_100022538(uint64_t a1, uint64_t a2)
{
  type metadata accessor for FeatureInfo(0);
  return sub_100022338(a1, a2);
}

uint64_t sub_100022568(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10000E354((uint64_t *)&unk_10003DC10);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000225A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000E354((uint64_t *)&unk_10003DC10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000225F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for Message(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 24) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  swift_release(*(_QWORD *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

void sub_100022664()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for Message(0) - 8) + 80);
  sub_10001B250(*(_QWORD *)(v0 + 16), v0 + ((v1 + 24) & ~v1));
}

uint64_t sub_100022694(uint64_t a1)
{
  return sub_10001C46C(a1);
}

uint64_t sub_100022700()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *);
  uint64_t v10;
  uint64_t v11;
  _BYTE v12[24];

  swift_beginAccess(v0 + 16, v12, 0, 0);
  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain(v1);
  sub_100022ECC(v2);
  v4 = v3;
  swift_bridgeObjectRelease(v1);
  v5 = *(_QWORD *)(v4 + 16);
  if (v5)
  {
    swift_bridgeObjectRetain(v4);
    v6 = (uint64_t *)(v4 + 40);
    do
    {
      v8 = (void (*)(uint64_t *, uint64_t *))*(v6 - 1);
      v7 = *v6;
      v10 = 0;
      v11 = 0;
      swift_retain(v7);
      v8(&v11, &v10);
      swift_release(v7);
      v6 += 2;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease(v4);
  }
  return swift_bridgeObjectRelease(v4);
}

uint64_t sub_1000227B8()
{
  uint64_t v0;

  sub_100022700();
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocClassInstance(v0, 24, 7);
}

uint64_t _s16RetainedMessagesCMa()
{
  return objc_opt_self(_TtCC15audioanalyticsd7Session16RetainedMessages);
}

uint64_t sub_100022800(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t (*v9)(char *, unint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unsigned __int16 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD *, uint64_t *);
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[3];
  char v31[24];

  v2 = type metadata accessor for Message(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v28 - v7;
  v9 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v3 + 16);
  v10 = v9((char *)&v28 - v7, a1, v2);
  v11 = Message.category.getter(v10);
  v12 = v11;
  v13 = Message.type.getter(v11);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  v14 = sub_100022AFC(v12 | ((unint64_t)v13 << 32));
  v15 = v14 + 16;
  swift_beginAccess(v14 + 16, v31, 0, 0);
  if (!*(_QWORD *)(*(_QWORD *)(v14 + 16) + 16))
  {
    v9(v6, a1, v2);
    v15 = v14 + 24;
    swift_beginAccess(v14 + 24, v30, 33, 0);
    a1 = *(_QWORD *)(v14 + 24);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(a1);
    *(_QWORD *)(v14 + 24) = a1;
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      goto LABEL_8;
    goto LABEL_16;
  }
  swift_beginAccess(v15, v30, 33, 0);
  v16 = *(_QWORD *)v15;
  if (!*(_QWORD *)(*(_QWORD *)v15 + 16))
  {
    __break(1u);
LABEL_16:
    a1 = sub_100028154(0, *(_QWORD *)(a1 + 16) + 1, 1, a1);
    *(_QWORD *)v15 = a1;
LABEL_8:
    v26 = *(_QWORD *)(a1 + 16);
    v25 = *(_QWORD *)(a1 + 24);
    if (v26 >= v25 >> 1)
    {
      a1 = sub_100028154(v25 > 1, v26 + 1, 1, a1);
      *(_QWORD *)v15 = a1;
    }
    *(_QWORD *)(a1 + 16) = v26 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(a1+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(_QWORD *)(v3 + 72) * v26, v6, v2);
    v27 = *(_QWORD *)v15;
    swift_endAccess(v30);
    if (*(_QWORD *)(v27 + 16) >= 0xBuLL)
    {
      result = swift_beginAccess(v15, v30, 33, 0);
      if (!*(_QWORD *)(*(_QWORD *)v15 + 16))
        goto LABEL_18;
      sub_1000251AC(0, 1);
      swift_endAccess(v30);
    }
    v23 = v14;
    return swift_release(v23);
  }
  v18 = *(void (**)(_QWORD *, uint64_t *))(v16 + 32);
  v17 = *(_QWORD *)(v16 + 40);
  swift_retain(v17);
  sub_10002503C(0, 1);
  v19 = swift_endAccess(v30);
  if (*(_QWORD *)(*(_QWORD *)v15 + 16) <= 0xAuLL)
  {
LABEL_6:
    v22 = Message.flattenToAnyDictionary()(v19);
    v29 = v22;
    v30[0] = 0;
    v18(v30, &v29);
    swift_bridgeObjectRelease(v22);
    swift_release(v14);
    v23 = v17;
    return swift_release(v23);
  }
  result = swift_beginAccess(v15, v30, 33, 0);
  if (*(_QWORD *)(*(_QWORD *)v15 + 16))
  {
    v21 = *(_QWORD *)(*(_QWORD *)v15 + 40);
    swift_retain(v21);
    sub_10002503C(0, 1);
    swift_endAccess(v30);
    v19 = swift_release(v21);
    goto LABEL_6;
  }
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_100022AFC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v13;
  _BYTE v14[24];

  v3 = (_QWORD *)(v1 + 16);
  swift_beginAccess(v1 + 16, v14, 32, 0);
  v4 = *(_QWORD *)(v1 + 16);
  v5 = a1 & 0xFFFFFFFFFFFFLL;
  if (*(_QWORD *)(v4 + 16) && (v6 = sub_1000233F8(v5), (v7 & 1) != 0))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v6);
    swift_endAccess(v14);
    swift_retain(v8);
  }
  else
  {
    swift_endAccess(v14);
    v9 = _s16RetainedMessagesC12MessageQueueCMa();
    v8 = swift_allocObject(v9, 32, 7);
    *(_QWORD *)(v8 + 16) = _swiftEmptyArrayStorage;
    *(_QWORD *)(v8 + 24) = _swiftEmptyArrayStorage;
    swift_beginAccess(v3, v14, 33, 0);
    swift_retain(v8);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v13 = *v3;
    *v3 = 0x8000000000000000;
    sub_100023A24(v8, v5, isUniquelyReferenced_nonNull_native);
    v11 = *v3;
    *v3 = v13;
    swift_bridgeObjectRelease(v11);
    swift_endAccess(v14);
  }
  return v8;
}

void sub_100022C04(_QWORD *a1, uint64_t a2, unsigned int a3, unsigned __int16 a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  __n128 v14;
  uint64_t v15;
  uint64_t v16;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[24];
  char v25[24];

  v8 = type metadata accessor for Message(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = &v24[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = sub_100022AFC(a3 | ((unint64_t)a4 << 32));
  v13 = v12 + 24;
  swift_beginAccess(v12 + 24, v25, 0, 0);
  if (*(_QWORD *)(*(_QWORD *)(v12 + 24) + 16))
  {
    v14 = swift_beginAccess(v13, v24, 33, 0);
    if (*(_QWORD *)(*(_QWORD *)v13 + 16))
    {
      (*(void (**)(_BYTE *, unint64_t, uint64_t, __n128))(v9 + 16))(v11, *(_QWORD *)v13 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)), v8, v14);
      sub_1000251AC(0, 1);
      v15 = swift_endAccess(v24);
      if (*(_QWORD *)(*(_QWORD *)v13 + 16) < 0xBuLL)
      {
LABEL_6:
        v16 = Message.flattenToAnyDictionary()(v15);
        ((void (*)(_QWORD, uint64_t))a1)(0, v16);
        swift_release(v12);
        swift_bridgeObjectRelease(v16);
        (*(void (**)(_BYTE *, uint64_t))(v9 + 8))(v11, v8);
        return;
      }
      swift_beginAccess(v13, v24, 33, 0);
      if (*(_QWORD *)(*(_QWORD *)v13 + 16))
      {
        sub_1000251AC(0, 1);
        v15 = swift_endAccess(v24);
        goto LABEL_6;
      }
      __break(1u);
      goto LABEL_18;
    }
    __break(1u);
  }
  else
  {
    v8 = swift_allocObject(&unk_10003A108, 32, 7);
    *(_QWORD *)(v8 + 16) = a1;
    *(_QWORD *)(v8 + 24) = a2;
    v13 = v12 + 16;
    swift_beginAccess(v12 + 16, v24, 33, 0);
    a1 = *(_QWORD **)(v12 + 16);
    swift_retain(a2);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(a1);
    *(_QWORD *)(v12 + 16) = a1;
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      goto LABEL_8;
  }
  a1 = sub_10002802C(0, a1[2] + 1, 1, a1);
  *(_QWORD *)v13 = a1;
LABEL_8:
  v19 = a1[2];
  v18 = a1[3];
  if (v19 >= v18 >> 1)
  {
    a1 = sub_10002802C((_QWORD *)(v18 > 1), v19 + 1, 1, a1);
    *(_QWORD *)v13 = a1;
  }
  a1[2] = v19 + 1;
  v20 = &a1[2 * v19];
  v20[4] = sub_100025528;
  v20[5] = v8;
  v21 = *(_QWORD *)v13;
  swift_endAccess(v24);
  if (*(_QWORD *)(v21 + 16) < 0xBuLL)
  {
    v23 = v12;
    goto LABEL_14;
  }
  swift_beginAccess(v13, v24, 33, 0);
  if (*(_QWORD *)(*(_QWORD *)v13 + 16))
  {
    v22 = *(_QWORD *)(*(_QWORD *)v13 + 40);
    swift_retain(v22);
    sub_10002503C(0, 1);
    swift_endAccess(v24);
    swift_release(v12);
    v23 = v22;
LABEL_14:
    swift_release(v23);
    return;
  }
LABEL_18:
  __break(1u);
}

void sub_100022ECC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  _BYTE v15[24];
  _QWORD *v16;

  v16 = _swiftEmptyArrayStorage;
  v2 = a1 + 64;
  v3 = 1 << *(_BYTE *)(a1 + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v6 = (unint64_t)(v3 + 63) >> 6;
  swift_bridgeObjectRetain(a1);
  v7 = 0;
  while (1)
  {
    if (v5)
    {
      v8 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v9 = v8 | (v7 << 6);
      goto LABEL_5;
    }
    v12 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v12 >= v6)
      goto LABEL_23;
    v13 = *(_QWORD *)(v2 + 8 * v12);
    ++v7;
    if (!v13)
    {
      v7 = v12 + 1;
      if (v12 + 1 >= v6)
        goto LABEL_23;
      v13 = *(_QWORD *)(v2 + 8 * v7);
      if (!v13)
      {
        v7 = v12 + 2;
        if (v12 + 2 >= v6)
          goto LABEL_23;
        v13 = *(_QWORD *)(v2 + 8 * v7);
        if (!v13)
        {
          v7 = v12 + 3;
          if (v12 + 3 >= v6)
            goto LABEL_23;
          v13 = *(_QWORD *)(v2 + 8 * v7);
          if (!v13)
            break;
        }
      }
    }
LABEL_22:
    v5 = (v13 - 1) & v13;
    v9 = __clz(__rbit64(v13)) + (v7 << 6);
LABEL_5:
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v9);
    swift_beginAccess(v10 + 16, v15, 0, 0);
    swift_bridgeObjectRetain(*(_QWORD *)(v10 + 16));
    sub_100024D70(v11);
  }
  v14 = v12 + 4;
  if (v14 >= v6)
  {
LABEL_23:
    swift_release(a1);
    return;
  }
  v13 = *(_QWORD *)(v2 + 8 * v14);
  if (v13)
  {
    v7 = v14;
    goto LABEL_22;
  }
  while (1)
  {
    v7 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v7 >= v6)
      goto LABEL_23;
    v13 = *(_QWORD *)(v2 + 8 * v7);
    ++v14;
    if (v13)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
}

Swift::Int sub_100023054()
{
  uint64_t v0;
  Swift::UInt32 v1;
  Swift::UInt16 v2;
  _QWORD v4[9];

  v1 = *(_DWORD *)v0;
  v2 = *(_WORD *)(v0 + 4);
  Hasher.init(_seed:)(v4, 0);
  Hasher._combine(_:)(v1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

void sub_1000230B0()
{
  uint64_t v0;
  Swift::UInt16 v1;

  v1 = *(_WORD *)(v0 + 4);
  Hasher._combine(_:)(*(_DWORD *)v0);
  Hasher._combine(_:)(v1);
}

Swift::Int sub_1000230EC(uint64_t a1)
{
  uint64_t v1;
  Swift::UInt32 v2;
  Swift::UInt16 v3;
  _QWORD v5[9];

  v2 = *(_DWORD *)v1;
  v3 = *(_WORD *)(v1 + 4);
  Hasher.init(_seed:)(v5, a1);
  Hasher._combine(_:)(v2);
  Hasher._combine(_:)(v3);
  return Hasher._finalize()();
}

BOOL sub_100023144(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)a1 == *(_DWORD *)a2 && *(unsigned __int16 *)(a1 + 4) == *(unsigned __int16 *)(a2 + 4);
}

uint64_t sub_100023164()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocClassInstance(v0, 32, 7);
}

uint64_t _s16RetainedMessagesC12MessageQueueCMa()
{
  return objc_opt_self(_TtCCC15audioanalyticsd7Session16RetainedMessages12MessageQueue);
}

uint64_t _s16RetainedMessagesC16CategoryTypePairVwCP(uint64_t result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_WORD *)(result + 4) = *((_WORD *)a2 + 2);
  *(_DWORD *)result = v2;
  return result;
}

uint64_t _s16RetainedMessagesC16CategoryTypePairVwet(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 6))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t _s16RetainedMessagesC16CategoryTypePairVwst(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_WORD *)(result + 4) = 0;
    *(_DWORD *)result = a2 - 1;
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
  *(_BYTE *)(result + 6) = v3;
  return result;
}

ValueMetadata *_s16RetainedMessagesC16CategoryTypePairVMa()
{
  return &_s16RetainedMessagesC16CategoryTypePairVN;
}

unint64_t sub_100023228()
{
  unint64_t result;

  result = qword_10003DDD8;
  if (!qword_10003DDD8)
  {
    result = swift_getWitnessTable(&unk_100031F34, &_s16RetainedMessagesC16CategoryTypePairVN);
    atomic_store(result, (unint64_t *)&qword_10003DDD8);
  }
  return result;
}

unint64_t sub_10002326C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  Swift::Int v20;
  _QWORD v22[9];

  Hasher.init(_seed:)(v22, *(_QWORD *)(v1 + 40));
  v3 = type metadata accessor for SystemMonitorConfig.MonitorType(0);
  v4 = sub_100006818(&qword_10003DE00, (uint64_t (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.MonitorType, (uint64_t)&protocol conformance descriptor for SystemMonitorConfig.MonitorType);
  dispatch thunk of Hashable.hash(into:)(v22, v3, v4);
  v5 = (int *)type metadata accessor for FeatureInfo(0);
  v6 = (uint64_t *)(a1 + v5[5]);
  v7 = *v6;
  v8 = v6[1];
  swift_bridgeObjectRetain(v8);
  String.hash(into:)(v22, v7, v8);
  swift_bridgeObjectRelease(v8);
  v9 = (uint64_t *)(a1 + v5[6]);
  v10 = *v9;
  v11 = v9[1];
  swift_bridgeObjectRetain(v11);
  String.hash(into:)(v22, v10, v11);
  swift_bridgeObjectRelease(v11);
  v12 = (uint64_t *)(a1 + v5[7]);
  v13 = *v12;
  v14 = v12[1];
  swift_bridgeObjectRetain(v14);
  String.hash(into:)(v22, v13, v14);
  swift_bridgeObjectRelease(v14);
  v15 = (uint64_t *)(a1 + v5[8]);
  v16 = *v15;
  v17 = v15[1];
  swift_bridgeObjectRetain(v17);
  String.hash(into:)(v22, v16, v17);
  swift_bridgeObjectRelease(v17);
  v18 = type metadata accessor for SystemMonitorConfig.DataType(0);
  v19 = sub_100006818(&qword_10003DE08, (uint64_t (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.DataType, (uint64_t)&protocol conformance descriptor for SystemMonitorConfig.DataType);
  dispatch thunk of Hashable.hash(into:)(v22, v18, v19);
  v20 = Hasher._finalize()();
  return sub_1000241B8(a1, v20);
}

unint64_t sub_1000233F8(unint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  Swift::Int v4;
  _QWORD v6[9];

  v3 = HIDWORD(a1);
  Hasher.init(_seed:)(v6, *(_QWORD *)(v1 + 40));
  Hasher._combine(_:)(a1);
  Hasher._combine(_:)(v3);
  v4 = Hasher._finalize()();
  return sub_1000244E4(a1 & 0xFFFFFFFFFFFFLL, v4);
}

Swift::Int sub_100023460(uint64_t a1, uint64_t a2)
{
  Swift::Int *v2;
  Swift::Int *v3;
  Swift::Int v5;
  uint64_t v6;
  Swift::Int result;
  Swift::Int v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  Swift::Int v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  Swift::UInt32 v31;
  Swift::UInt16 v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  _QWORD *v36;
  char v37;
  uint64_t v38[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_10000E354(&qword_10003D670);
  v37 = a2;
  result = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v9 = 0;
    v36 = (_QWORD *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v35 = (unint64_t)(v10 + 63) >> 6;
    v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        v20 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v21 = v20 | (v9 << 6);
      }
      else
      {
        v22 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v22 >= v35)
          goto LABEL_36;
        v23 = v36[v22];
        ++v9;
        if (!v23)
        {
          v9 = v22 + 1;
          if (v22 + 1 >= v35)
            goto LABEL_36;
          v23 = v36[v9];
          if (!v23)
          {
            v24 = v22 + 2;
            if (v24 >= v35)
            {
LABEL_36:
              if ((v37 & 1) != 0)
              {
                v34 = 1 << *(_BYTE *)(v5 + 32);
                if (v34 >= 64)
                  bzero(v36, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v36 = -1 << v34;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v23 = v36[v24];
            if (!v23)
            {
              while (1)
              {
                v9 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_44;
                if (v9 >= v35)
                  goto LABEL_36;
                v23 = v36[v9];
                ++v24;
                if (v23)
                  goto LABEL_33;
              }
            }
            v9 = v24;
          }
        }
LABEL_33:
        v12 = (v23 - 1) & v23;
        v21 = __clz(__rbit64(v23)) + (v9 << 6);
      }
      v29 = 8 * v21;
      v30 = *(_QWORD *)(v5 + 48) + v29;
      v31 = *(_DWORD *)v30;
      v32 = *(_WORD *)(v30 + 4);
      v33 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v29);
      if ((v37 & 1) == 0)
        swift_retain(v33);
      Hasher.init(_seed:)(v38, *(_QWORD *)(v8 + 40));
      Hasher._combine(_:)(v31);
      Hasher._combine(_:)(v32);
      result = Hasher._finalize()();
      v14 = -1 << *(_BYTE *)(v8 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_43;
          }
          v27 = v16 == v26;
          if (v16 == v26)
            v16 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v13 + 8 * v16);
        }
        while (v28 == -1);
        v17 = __clz(__rbit64(~v28)) + (v16 << 6);
      }
      *(_QWORD *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = 8 * v17;
      v19 = *(_QWORD *)(v8 + 48) + v18;
      *(_DWORD *)v19 = v31;
      *(_WORD *)(v19 + 4) = v32;
      *(_QWORD *)(*(_QWORD *)(v8 + 56) + v18) = v33;
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

uint64_t sub_100023760(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t result;
  int64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v3 = v2;
  v6 = type metadata accessor for FeatureState(0);
  v31 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for FeatureInfo(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *v3;
  if (*(_QWORD *)(*v3 + 24) > a1)
    a1 = *(_QWORD *)(*v3 + 24);
  sub_10000E354(&qword_10003D6B8);
  v14 = a2;
  v32 = static _DictionaryStorage.resize(original:capacity:move:)(v13, a1, a2);
  if (*(_QWORD *)(v13 + 16))
  {
    v30 = v3;
    v15 = 1 << *(_BYTE *)(v13 + 32);
    v16 = (_QWORD *)(v13 + 64);
    v17 = -1;
    if (v15 < 64)
      v17 = ~(-1 << v15);
    v18 = v17 & *(_QWORD *)(v13 + 64);
    v19 = (unint64_t)(v15 + 63) >> 6;
    result = swift_retain(v13);
    v21 = 0;
    while (1)
    {
      if (v18)
      {
        v22 = __clz(__rbit64(v18));
        v18 &= v18 - 1;
        v23 = v22 | (v21 << 6);
      }
      else
      {
        v24 = v21 + 1;
        if (__OFADD__(v21, 1))
        {
          __break(1u);
LABEL_34:
          __break(1u);
          return result;
        }
        if (v24 >= v19)
          goto LABEL_25;
        v25 = v16[v24];
        ++v21;
        if (!v25)
        {
          v21 = v24 + 1;
          if (v24 + 1 >= v19)
            goto LABEL_25;
          v25 = v16[v21];
          if (!v25)
          {
            v26 = v24 + 2;
            if (v26 >= v19)
            {
LABEL_25:
              swift_release(v13);
              if ((v14 & 1) == 0)
              {
                result = swift_release(v13);
                v3 = v30;
                goto LABEL_32;
              }
              v28 = 1 << *(_BYTE *)(v13 + 32);
              if (v28 >= 64)
                bzero((void *)(v13 + 64), ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v16 = -1 << v28;
              v3 = v30;
              *(_QWORD *)(v13 + 16) = 0;
              break;
            }
            v25 = v16[v26];
            if (!v25)
            {
              while (1)
              {
                v21 = v26 + 1;
                if (__OFADD__(v26, 1))
                  goto LABEL_34;
                if (v21 >= v19)
                  goto LABEL_25;
                v25 = v16[v21];
                ++v26;
                if (v25)
                  goto LABEL_22;
              }
            }
            v21 = v26;
          }
        }
LABEL_22:
        v18 = (v25 - 1) & v25;
        v23 = __clz(__rbit64(v25)) + (v21 << 6);
      }
      v27 = *(_QWORD *)(v13 + 48) + *(_QWORD *)(v10 + 72) * v23;
      if ((v14 & 1) != 0)
      {
        sub_10001059C(v27, (uint64_t)v12, type metadata accessor for FeatureInfo);
        sub_10001059C(*(_QWORD *)(v13 + 56) + *(_QWORD *)(v31 + 72) * v23, (uint64_t)v8, type metadata accessor for FeatureState);
      }
      else
      {
        sub_100006978(v27, (uint64_t)v12, type metadata accessor for FeatureInfo);
        sub_100006978(*(_QWORD *)(v13 + 56) + *(_QWORD *)(v31 + 72) * v23, (uint64_t)v8, type metadata accessor for FeatureState);
      }
      result = sub_100023DF4((uint64_t)v12, (uint64_t)v8, v32);
    }
  }
  result = swift_release(v13);
LABEL_32:
  *v3 = v32;
  return result;
}

uint64_t sub_100023A24(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v7;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t result;
  unint64_t v19;
  char v20;

  v4 = (_QWORD **)v3;
  v7 = (_QWORD *)*v3;
  v8 = a2 & 0xFFFFFFFFFFFFLL;
  v10 = sub_1000233F8(a2 & 0xFFFFFFFFFFFFLL);
  v11 = v7[2];
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }
  else
  {
    v14 = v9;
    v15 = v7[3];
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      v16 = *v4;
      if ((v14 & 1) != 0)
      {
LABEL_8:
        v17 = v16[7];
        result = swift_release(*(_QWORD *)(v17 + 8 * v10));
        *(_QWORD *)(v17 + 8 * v10) = a1;
        return result;
      }
      return sub_10002401C(v10, v8, a1, v16);
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_100024708();
      goto LABEL_7;
    }
    sub_100023460(v13, a3 & 1);
    v19 = sub_1000233F8(v8);
    if ((v14 & 1) == (v20 & 1))
    {
      v10 = v19;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
      return sub_10002401C(v10, v8, a1, v16);
    }
  }
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&_s16RetainedMessagesC16CategoryTypePairVN);
  __break(1u);
  return result;
}

uint64_t sub_100023B38(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  unint64_t v22;
  char v23;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_10000D9BC(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = v18[7];
        v20 = type metadata accessor for SimpleType(0);
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 40))(v19 + *(_QWORD *)(*(_QWORD *)(v20 - 8) + 72) * v12, a1, v20);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_10000EEA4();
      goto LABEL_7;
    }
    sub_10000DB84(v15, a4 & 1);
    v22 = sub_10000D9BC(a2, a3);
    if ((v16 & 1) == (v23 & 1))
    {
      v12 = v22;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_100024070(v12, a2, a3, a1, v18);
      return swift_bridgeObjectRetain(a3);
    }
  }
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

uint64_t sub_100023C74(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t v25;

  v4 = (_QWORD **)v3;
  v8 = type metadata accessor for FeatureInfo(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (_QWORD *)*v3;
  v13 = sub_10002326C(a2);
  v14 = v11[2];
  v15 = (v12 & 1) == 0;
  v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
  }
  else
  {
    v17 = v12;
    v18 = v11[3];
    if (v18 >= v16 && (a3 & 1) != 0)
    {
LABEL_7:
      v19 = *v4;
      if ((v17 & 1) != 0)
      {
LABEL_8:
        v20 = v19[7];
        v21 = type metadata accessor for FeatureState(0);
        return sub_100025550(a1, v20 + *(_QWORD *)(*(_QWORD *)(v21 - 8) + 72) * v13);
      }
      goto LABEL_11;
    }
    if (v18 >= v16 && (a3 & 1) == 0)
    {
      sub_100024AD8();
      goto LABEL_7;
    }
    sub_100023760(v16, a3 & 1);
    v23 = sub_10002326C(a2);
    if ((v17 & 1) == (v24 & 1))
    {
      v13 = v23;
      v19 = *v4;
      if ((v17 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_100006978(a2, (uint64_t)v10, type metadata accessor for FeatureInfo);
      return sub_100024100(v13, (uint64_t)v10, a1, v19);
    }
  }
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v8);
  __break(1u);
  return result;
}

uint64_t sub_100023DF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  Swift::Int v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t result;
  _QWORD v28[9];

  Hasher.init(_seed:)(v28, *(_QWORD *)(a3 + 40));
  v6 = type metadata accessor for SystemMonitorConfig.MonitorType(0);
  v7 = sub_100006818(&qword_10003DE00, (uint64_t (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.MonitorType, (uint64_t)&protocol conformance descriptor for SystemMonitorConfig.MonitorType);
  dispatch thunk of Hashable.hash(into:)(v28, v6, v7);
  v8 = (int *)type metadata accessor for FeatureInfo(0);
  v9 = (uint64_t *)(a1 + v8[5]);
  v10 = *v9;
  v11 = v9[1];
  swift_bridgeObjectRetain(v11);
  String.hash(into:)(v28, v10, v11);
  swift_bridgeObjectRelease(v11);
  v12 = (uint64_t *)(a1 + v8[6]);
  v13 = *v12;
  v14 = v12[1];
  swift_bridgeObjectRetain(v14);
  String.hash(into:)(v28, v13, v14);
  swift_bridgeObjectRelease(v14);
  v15 = (uint64_t *)(a1 + v8[7]);
  v16 = *v15;
  v17 = v15[1];
  swift_bridgeObjectRetain(v17);
  String.hash(into:)(v28, v16, v17);
  swift_bridgeObjectRelease(v17);
  v18 = (uint64_t *)(a1 + v8[8]);
  v19 = *v18;
  v20 = v18[1];
  swift_bridgeObjectRetain(v20);
  String.hash(into:)(v28, v19, v20);
  swift_bridgeObjectRelease(v20);
  v21 = type metadata accessor for SystemMonitorConfig.DataType(0);
  v22 = sub_100006818(&qword_10003DE08, (uint64_t (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.DataType, (uint64_t)&protocol conformance descriptor for SystemMonitorConfig.DataType);
  dispatch thunk of Hashable.hash(into:)(v28, v21, v22);
  v23 = Hasher._finalize()();
  v24 = _HashTable.nextHole(atOrAfter:)(v23 & ~(-1 << *(_BYTE *)(a3 + 32)), a3 + 64, ~(-1 << *(_BYTE *)(a3 + 32)));
  *(_QWORD *)(a3 + 64 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
  sub_10001059C(a1, *(_QWORD *)(a3 + 48) + *(_QWORD *)(*((_QWORD *)v8 - 1) + 72) * v24, type metadata accessor for FeatureInfo);
  v25 = *(_QWORD *)(a3 + 56);
  v26 = type metadata accessor for FeatureState(0);
  result = sub_10001059C(a2, v25 + *(_QWORD *)(*(_QWORD *)(v26 - 8) + 72) * v24, type metadata accessor for FeatureState);
  ++*(_QWORD *)(a3 + 16);
  return result;
}

unint64_t sub_10002401C(unint64_t result, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  a4[(result >> 6) + 8] |= 1 << result;
  v4 = a4[6] + 8 * result;
  *(_DWORD *)v4 = a2;
  *(_WORD *)(v4 + 4) = WORD2(a2);
  *(_QWORD *)(a4[7] + 8 * result) = a3;
  v5 = a4[2];
  v6 = __OFADD__(v5, 1);
  v7 = v5 + 1;
  if (v6)
    __break(1u);
  else
    a4[2] = v7;
  return result;
}

uint64_t sub_100024070(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
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
  v10 = type metadata accessor for SimpleType(0);
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

uint64_t sub_100024100(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = type metadata accessor for FeatureInfo(0);
  sub_10001059C(a2, v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, type metadata accessor for FeatureInfo);
  v10 = a4[7];
  v11 = type metadata accessor for FeatureState(0);
  result = sub_10001059C(a3, v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * a1, type metadata accessor for FeatureState);
  v13 = a4[2];
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    a4[2] = v15;
  return result;
}

unint64_t sub_1000241B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v3 = v2;
  v6 = (int *)type metadata accessor for FeatureInfo(0);
  __chkstk_darwin(v6);
  v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = v2 + 64;
  v11 = -1 << *(_BYTE *)(v2 + 32);
  v12 = a2 & ~v11;
  if (((*(_QWORD *)(v2 + 64 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
    return v12;
  v13 = ~v11;
  v14 = *(_QWORD *)(v7 + 72);
  v46 = v2;
  v47 = v14;
  while (1)
  {
    sub_100006978(*(_QWORD *)(v3 + 48) + v47 * v12, (uint64_t)v9, type metadata accessor for FeatureInfo);
    v16 = type metadata accessor for SystemMonitorConfig.MonitorType(0);
    v17 = sub_100006818(&qword_10003DE10, (uint64_t (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.MonitorType, (uint64_t)&protocol conformance descriptor for SystemMonitorConfig.MonitorType);
    dispatch thunk of RawRepresentable.rawValue.getter(&v50, v16, v17);
    dispatch thunk of RawRepresentable.rawValue.getter(&v48, v16, v17);
    v18 = v51;
    v19 = v49;
    if (v50 == v48 && v51 == v49)
    {
      swift_bridgeObjectRelease_n(v51, 2);
    }
    else
    {
      v21 = _stringCompareWithSmolCheck(_:_:expecting:)(v50, v51);
      swift_bridgeObjectRelease(v18);
      swift_bridgeObjectRelease(v19);
      if ((v21 & 1) == 0)
        goto LABEL_4;
    }
    v22 = v6[5];
    v23 = *(_QWORD *)&v9[v22];
    v24 = *(_QWORD *)&v9[v22 + 8];
    v25 = (_QWORD *)(a1 + v22);
    v26 = v23 == *v25 && v24 == v25[1];
    if (!v26 && (_stringCompareWithSmolCheck(_:_:expecting:)(v23, v24) & 1) == 0)
      goto LABEL_4;
    v27 = v6[6];
    v28 = *(_QWORD *)&v9[v27];
    v29 = *(_QWORD *)&v9[v27 + 8];
    v30 = (_QWORD *)(a1 + v27);
    if ((v28 != *v30 || v29 != v30[1]) && (_stringCompareWithSmolCheck(_:_:expecting:)(v28, v29) & 1) == 0)
      goto LABEL_4;
    v31 = v6[7];
    v32 = *(_QWORD *)&v9[v31];
    v33 = *(_QWORD *)&v9[v31 + 8];
    v34 = (_QWORD *)(a1 + v31);
    if ((v32 != *v34 || v33 != v34[1]) && (_stringCompareWithSmolCheck(_:_:expecting:)(v32, v33) & 1) == 0)
      goto LABEL_4;
    v35 = v6[8];
    v36 = *(_QWORD *)&v9[v35];
    v37 = *(_QWORD *)&v9[v35 + 8];
    v38 = (_QWORD *)(a1 + v35);
    if ((v36 != *v38 || v37 != v38[1]) && (_stringCompareWithSmolCheck(_:_:expecting:)(v36, v37) & 1) == 0)
      goto LABEL_4;
    v39 = v10;
    v40 = v13;
    v41 = type metadata accessor for SystemMonitorConfig.DataType(0);
    v42 = sub_100006818(&qword_10003DE18, (uint64_t (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.DataType, (uint64_t)&protocol conformance descriptor for SystemMonitorConfig.DataType);
    dispatch thunk of RawRepresentable.rawValue.getter(&v50, v41, v42);
    dispatch thunk of RawRepresentable.rawValue.getter(&v48, v41, v42);
    v43 = v51;
    v44 = v49;
    if (v50 == v48 && v51 == v49)
      break;
    v15 = _stringCompareWithSmolCheck(_:_:expecting:)(v50, v51);
    swift_bridgeObjectRelease(v43);
    swift_bridgeObjectRelease(v44);
    v13 = v40;
    v10 = v39;
    v3 = v46;
    if ((v15 & 1) != 0)
      goto LABEL_29;
LABEL_4:
    sub_100013324((uint64_t)v9);
    v12 = (v12 + 1) & v13;
    if (((*(_QWORD *)(v10 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
      return v12;
  }
  swift_bridgeObjectRelease_n(v51, 2);
LABEL_29:
  sub_100013324((uint64_t)v9);
  return v12;
}

unint64_t sub_1000244E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  unint64_t result;
  uint64_t v6;

  v4 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v6 = ~v4;
    do
    {
      if (__PAIR64__(*(unsigned __int16 *)(*(_QWORD *)(v2 + 48) + 8 * result + 4), *(_DWORD *)(*(_QWORD *)(v2 + 48) + 8 * result)) == __PAIR64__(WORD2(a1), a1))break;
      result = (result + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0);
  }
  return result;
}

void *sub_100024568()
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
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  sub_10000E354(&qword_10003DDE8);
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_26;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
        break;
    }
LABEL_25:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
    result = (void *)swift_retain(v17);
  }
  v20 = v18 + 2;
  if (v20 >= v13)
    goto LABEL_26;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_100024708()
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
  int v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;

  v1 = v0;
  sub_10000E354(&qword_10003D670);
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
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      v9 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_26;
      v22 = *(_QWORD *)(v6 + 8 * v9);
      if (!v22)
        break;
    }
LABEL_25:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(v2 + 48) + v16;
    v18 = *(_DWORD *)v17;
    LOWORD(v17) = *(_WORD *)(v17 + 4);
    v19 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    v20 = *(_QWORD *)(v4 + 48) + v16;
    *(_DWORD *)v20 = v18;
    *(_WORD *)(v20 + 4) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v19;
    result = (void *)swift_retain(v19);
  }
  v23 = v21 + 2;
  if (v23 >= v13)
    goto LABEL_26;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1000248B8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  int v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int64_t v26;

  v1 = type metadata accessor for Message(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000E354(&qword_10003D6A8);
  v24 = v0;
  v5 = *v0;
  v6 = static _DictionaryStorage.copy(original:)(*v0);
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v5);
    *v24 = v7;
    return result;
  }
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v25 = v5 + 64;
  v26 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }
    v20 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v20);
    ++v11;
    if (!v21)
    {
      v11 = v20 + 1;
      if (v20 + 1 >= v26)
        goto LABEL_26;
      v21 = *(_QWORD *)(v25 + 8 * v11);
      if (!v21)
        break;
    }
LABEL_25:
    v14 = (v21 - 1) & v21;
    v16 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_12:
    v17 = 4 * v16;
    v18 = *(_DWORD *)(*(_QWORD *)(v5 + 48) + 4 * v16);
    v19 = *(_QWORD *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v5 + 56) + v19, v1);
    *(_DWORD *)(*(_QWORD *)(v7 + 48) + v17) = v18;
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 56) + v19, v4, v1);
  }
  v22 = v20 + 2;
  if (v22 >= v26)
    goto LABEL_26;
  v21 = *(_QWORD *)(v25 + 8 * v22);
  if (v21)
  {
    v11 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v11 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v11);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_100024AD8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *result;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;

  v1 = v0;
  v2 = type metadata accessor for FeatureState(0);
  v29 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for FeatureInfo(0);
  v28 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000E354(&qword_10003D6B8);
  v8 = *v0;
  v9 = static _DictionaryStorage.copy(original:)(*v0);
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
  {
    result = (void *)swift_release(v8);
LABEL_25:
    *v1 = v10;
    return result;
  }
  v25 = v1;
  result = (void *)(v9 + 64);
  v12 = (unint64_t)((1 << *(_BYTE *)(v10 + 32)) + 63) >> 6;
  if (v10 != v8 || (unint64_t)result >= v8 + 64 + 8 * v12)
    result = memmove(result, (const void *)(v8 + 64), 8 * v12);
  v13 = 0;
  *(_QWORD *)(v10 + 16) = *(_QWORD *)(v8 + 16);
  v14 = 1 << *(_BYTE *)(v8 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v8 + 64);
  v26 = v8 + 64;
  v27 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      v17 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v18 = v17 | (v13 << 6);
      goto LABEL_9;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v21 >= v27)
      goto LABEL_23;
    v22 = *(_QWORD *)(v26 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v27)
        goto LABEL_23;
      v22 = *(_QWORD *)(v26 + 8 * v13);
      if (!v22)
        break;
    }
LABEL_22:
    v16 = (v22 - 1) & v22;
    v18 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_9:
    v19 = *(_QWORD *)(v28 + 72) * v18;
    sub_100006978(*(_QWORD *)(v8 + 48) + v19, (uint64_t)v7, type metadata accessor for FeatureInfo);
    v20 = *(_QWORD *)(v29 + 72) * v18;
    sub_100006978(*(_QWORD *)(v8 + 56) + v20, (uint64_t)v4, type metadata accessor for FeatureState);
    sub_10001059C((uint64_t)v7, *(_QWORD *)(v10 + 48) + v19, type metadata accessor for FeatureInfo);
    result = (void *)sub_10001059C((uint64_t)v4, *(_QWORD *)(v10 + 56) + v20, type metadata accessor for FeatureState);
  }
  v23 = v21 + 2;
  if (v23 >= v27)
  {
LABEL_23:
    result = (void *)swift_release(v8);
    v1 = v25;
    goto LABEL_25;
  }
  v22 = *(_QWORD *)(v26 + 8 * v23);
  if (v22)
  {
    v13 = v23;
    goto LABEL_22;
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v27)
      goto LABEL_23;
    v22 = *(_QWORD *)(v26 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_22;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_100024D70(uint64_t a1)
{
  _QWORD *v1;
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
  char v16;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = (_QWORD *)*v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native(*v1);
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
  v3 = sub_10002802C(isUniquelyReferenced_nonNull_native, v14, 1, v3);
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
  sub_10000E354(&qword_10003DDE0);
  swift_arrayInitWithCopy(v9);
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease(a1);
    *v1 = v3;
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
  v16 = 2;
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, v16, 1092, 0);
  __break(1u);
  return result;
}

_QWORD *sub_100024ED0(uint64_t a1, int64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v6;
  int64_t v7;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  _QWORD *result;
  int64_t v15;
  _QWORD *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  v6 = (_QWORD *)*v4;
  v7 = *(_QWORD *)(*v4 + 16);
  if (v7 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v10 = 1 - v9;
  if (__OFSUB__(1, v9))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v11 = v7 + v10;
  if (__OFADD__(v7, v10))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  result = (_QWORD *)swift_isUniquelyReferenced_nonNull_native(*v4);
  if (!(_DWORD)result || v11 > v6[3] >> 1)
  {
    if (v7 <= v11)
      v15 = v7 + v10;
    else
      v15 = v7;
    result = sub_100027F0C(result, v15, 1, v6);
    v6 = result;
  }
  v16 = &v6[2 * a1 + 4];
  if (!v10)
    goto LABEL_20;
  v17 = v6[2];
  v18 = __OFSUB__(v17, a2);
  v19 = v17 - a2;
  if (v18)
    goto LABEL_26;
  if ((v19 & 0x8000000000000000) == 0)
  {
    result = v16 + 2;
    v20 = &v6[2 * a2 + 4];
    if (v16 + 2 != v20 || result >= &v20[2 * v19])
      result = memmove(result, v20, 16 * v19);
    v21 = v6[2];
    v18 = __OFADD__(v21, v10);
    v22 = v21 + v10;
    if (!v18)
    {
      v6[2] = v22;
LABEL_20:
      *v16 = a3;
      v16[1] = a4;
      *v4 = v6;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  v23 = 2;
  result = (_QWORD *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v23, 1046, 0);
  __break(1u);
  return result;
}

void *sub_10002503C(uint64_t a1, int64_t a2)
{
  _QWORD *v2;
  _QWORD *v4;
  int64_t v5;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  _QWORD *isUniquelyReferenced_nonNull_native;
  int64_t v11;
  uint64_t v12;
  void *result;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  v4 = (_QWORD *)*v2;
  v5 = *(_QWORD *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native(*v2);
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    v4 = sub_10002802C(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  v12 = sub_10000E354(&qword_10003DDE0);
  result = (void *)swift_arrayDestroy(&v4[2 * a1 + 4], v7, v12);
  if (!v7)
    goto LABEL_20;
  v14 = v4[2];
  v15 = __OFSUB__(v14, a2);
  v16 = v14 - a2;
  if (v15)
    goto LABEL_26;
  if ((v16 & 0x8000000000000000) == 0)
  {
    v17 = (char *)&v4[2 * a2 + 4];
    if (a1 != a2 || &v4[2 * a1 + 4] >= (_QWORD *)&v17[16 * v16])
      result = memmove(&v4[2 * a1 + 4], v17, 16 * v16);
    v18 = v4[2];
    v15 = __OFADD__(v18, v8);
    v19 = v18 - v7;
    if (!v15)
    {
      v4[2] = v19;
LABEL_20:
      *v2 = v4;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  v20 = 2;
  result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v20, 1046, 0);
  __break(1u);
  return result;
}

uint64_t sub_1000251AC(uint64_t a1, int64_t a2)
{
  unint64_t *v2;
  unint64_t v4;
  int64_t v5;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int isUniquelyReferenced_nonNull_native;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  char v26;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_27;
  }
  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
  if (!isUniquelyReferenced_nonNull_native || v9 > *(_QWORD *)(v4 + 24) >> 1)
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    v4 = sub_100028154(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  v12 = type metadata accessor for Message(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = v4 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
  v15 = *(_QWORD *)(v13 + 72);
  v16 = v15 * a1;
  v17 = v14 + v15 * a1;
  result = swift_arrayDestroy(v17, v7, v12);
  if (!v7)
    goto LABEL_25;
  v19 = *(_QWORD *)(v4 + 16);
  v20 = v19 - a2;
  if (__OFSUB__(v19, a2))
    goto LABEL_31;
  if ((v20 & 0x8000000000000000) == 0)
  {
    v21 = v14 + v15 * a2;
    if (v16 < v15 * a2 || v17 >= v21 + v20 * v15)
    {
      result = swift_arrayInitWithTakeFrontToBack(v17, v21, v20, v12);
    }
    else if (v16 != v15 * a2)
    {
      result = swift_arrayInitWithTakeBackToFront(v17);
    }
    v23 = *(_QWORD *)(v4 + 16);
    v24 = __OFADD__(v23, v8);
    v25 = v23 - v7;
    if (!v24)
    {
      *(_QWORD *)(v4 + 16) = v25;
LABEL_25:
      *v2 = v4;
      return result;
    }
    goto LABEL_32;
  }
LABEL_33:
  v26 = 2;
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v26, 1046, 0);
  __break(1u);
  return result;
}

void *sub_100025354(uint64_t a1, uint64_t a2)
{
  return sub_10002537C(a1, a2, (uint64_t (*)(void))sub_100009070, &qword_10003DDF0);
}

void *sub_100025368(uint64_t a1, uint64_t a2)
{
  return sub_10002537C(a1, a2, (uint64_t (*)(void))sub_10000F518, &qword_10003DDF8);
}

void *sub_10002537C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t *a4)
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v13;
  void *result;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  const void *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_19;
  }
  v6 = *v4;
  v7 = *(_QWORD *)(*v4 + 16);
  if (v7 < a2)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v10 = a1 - a2;
  if (__OFSUB__(0, v9))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (__OFADD__(v7, v10))
  {
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (!swift_isUniquelyReferenced_nonNull_native(*v4) || v7 - v9 > *(_QWORD *)(v6 + 24) >> 1)
    v6 = a3();
  v13 = sub_10000E354(a4);
  result = (void *)swift_arrayDestroy(v6 + 32 + 40 * a1, v9, v13);
  if (!v9)
    goto LABEL_17;
  v15 = *(_QWORD *)(v6 + 16);
  v16 = __OFSUB__(v15, a2);
  v17 = v15 - a2;
  if (v16)
    goto LABEL_23;
  if ((v17 & 0x8000000000000000) == 0)
  {
    v18 = (const void *)(v6 + 32 + 40 * a2);
    if (a1 != a2 || v6 + 32 + 40 * a1 >= (unint64_t)v18 + 40 * v17)
      result = memmove((void *)(v6 + 32 + 40 * a1), v18, 40 * v17);
    v19 = *(_QWORD *)(v6 + 16);
    v16 = __OFADD__(v19, v10);
    v20 = v19 - v9;
    if (!v16)
    {
      *(_QWORD *)(v6 + 16) = v20;
LABEL_17:
      *v4 = v6;
      return result;
    }
    goto LABEL_24;
  }
LABEL_25:
  v21 = 2;
  result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v21, 1046, 0);
  __break(1u);
  return result;
}

uint64_t sub_100025504()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100025528(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v2 + 16))(*a1, *a2);
}

uint64_t sub_100025550(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FeatureState(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100025594(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = v2;
  v6 = sub_10000E354((uint64_t *)&unk_10003DC10);
  __chkstk_darwin(v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for FeatureState(0);
  __chkstk_darwin(v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v12 + 48))(a1, 1) == 1)
  {
    sub_100006B04(a1, (uint64_t *)&unk_10003DC10);
    sub_100012F80(a2, (uint64_t)v8);
    sub_100013324(a2);
    return sub_100006B04((uint64_t)v8, (uint64_t *)&unk_10003DC10);
  }
  else
  {
    sub_100013360(a1, (uint64_t)v11);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v17 = *v3;
    *v3 = 0x8000000000000000;
    sub_100023C74((uint64_t)v11, a2, isUniquelyReferenced_nonNull_native);
    v15 = *v3;
    *v3 = v17;
    swift_bridgeObjectRelease(v15);
    return sub_100013324(a2);
  }
}

uint64_t sub_1000256E4(uint64_t a1, uint64_t a2, int a3, __int16 a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v24[2];
  uint64_t v25;
  _QWORD *v26;
  _QWORD aBlock[5];
  uint64_t v28;

  v5 = v4;
  v10 = type metadata accessor for DispatchWorkItemFlags(0);
  v25 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for DispatchQoS(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24[1] = *(_QWORD *)(v5 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
  v17 = swift_allocObject(&unk_10003A1C0, 46, 7);
  *(_QWORD *)(v17 + 16) = v5;
  *(_QWORD *)(v17 + 24) = a1;
  *(_QWORD *)(v17 + 32) = a2;
  *(_DWORD *)(v17 + 40) = a3;
  *(_WORD *)(v17 + 44) = a4;
  aBlock[4] = sub_10002A9A8;
  v28 = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006CEC;
  aBlock[3] = &unk_10003A1D8;
  v18 = _Block_copy(aBlock);
  swift_retain(v5);
  v19 = swift_retain(a2);
  static DispatchQoS.unspecified.getter(v19);
  v26 = _swiftEmptyArrayStorage;
  v20 = sub_100006818((unint64_t *)&qword_10003D6D8, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v21 = sub_10000E354((uint64_t *)&unk_10003DBA0);
  v22 = sub_10000AD58((unint64_t *)&qword_10003D6E0, (uint64_t *)&unk_10003DBA0);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v26, v21, v22, v10, v20);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v16, v12, v18);
  _Block_release(v18);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v10);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  return swift_release(v28);
}

uint64_t sub_1000258F8(uint64_t a1)
{
  uint64_t v1;
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
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD aBlock[5];
  uint64_t v27;

  v3 = type metadata accessor for DispatchWorkItemFlags(0);
  v24 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchQoS(0);
  v22 = *(_QWORD *)(v6 - 8);
  v23 = v6;
  __chkstk_darwin(v6);
  v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Message(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  __chkstk_darwin(v9);
  v21[1] = *(_QWORD *)(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  v12 = *(unsigned __int8 *)(v10 + 80);
  v13 = (v12 + 24) & ~v12;
  v14 = swift_allocObject(&unk_10003A170, v13 + v11, v12 | 7);
  *(_QWORD *)(v14 + 16) = v1;
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v14 + v13, (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  aBlock[4] = sub_100027ECC;
  v27 = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006CEC;
  aBlock[3] = &unk_10003A188;
  v15 = _Block_copy(aBlock);
  v16 = swift_retain(v1);
  static DispatchQoS.unspecified.getter(v16);
  v25 = _swiftEmptyArrayStorage;
  v17 = sub_100006818((unint64_t *)&qword_10003D6D8, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v18 = sub_10000E354((uint64_t *)&unk_10003DBA0);
  v19 = sub_10000AD58((unint64_t *)&qword_10003D6E0, (uint64_t *)&unk_10003DBA0);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v25, v18, v19, v3, v17);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v8, v5, v15);
  _Block_release(v15);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v3);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v8, v23);
  return swift_release(v27);
}

uint64_t sub_100025B5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  Swift::UInt32 v8;
  uint64_t v9;
  uint64_t v10;
  Swift::Int v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  _QWORD v20[9];

  if ((a2 & 0xC000000000000001) != 0)
  {
    if (a2 < 0)
      v4 = a2;
    else
      v4 = a2 & 0xFFFFFFFFFFFFFF8;
    v5 = swift_retain(a1);
    v6 = __CocoaSet.contains(_:)(v5, v4);
    swift_release(a1);
    return v6 & 1;
  }
  else
  {
    if (*(_QWORD *)(a2 + 16))
    {
      Hasher.init(_seed:)(v20, *(_QWORD *)(a2 + 40));
      v8 = *(_DWORD *)(a1 + OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid);
      Hasher._combine(_:)(v8);
      v9 = *(_QWORD *)(a1 + 24);
      v10 = *(_QWORD *)(a1 + 32);
      swift_bridgeObjectRetain(v10);
      String.hash(into:)(v20, v9, v10);
      swift_bridgeObjectRelease(v10);
      v11 = Hasher._finalize()();
      v12 = -1 << *(_BYTE *)(a2 + 32);
      v13 = v11 & ~v12;
      v14 = a2 + 56;
      if (((*(_QWORD *)(a2 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
      {
        v15 = ~v12;
        v16 = *(_QWORD *)(a2 + 48);
        v17 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
        do
        {
          v18 = *(_QWORD *)(v16 + 8 * v13);
          if (*(_DWORD *)(v18 + v17) == v8)
          {
            v19 = *(_QWORD *)(v18 + 24) == v9 && *(_QWORD *)(v18 + 32) == v10;
            if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
              return 1;
            v17 = OBJC_IVAR____TtC15audioanalyticsd20ClientServerInstance_pid;
          }
          v13 = (v13 + 1) & v15;
        }
        while (((*(_QWORD *)(v14 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0);
      }
    }
    return 0;
  }
}

void sub_100025CCC()
{
  sub_100025CEC();
}

void sub_100025CEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  _QWORD *v17;
  void *v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  _DWORD *v23;
  _DWORD *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  _DWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  char *v53;
  _BYTE v54[24];
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[3];
  char v59;
  uint64_t v60;
  uint64_t v61;
  char v62;

  v1 = v0;
  v2 = sub_10000E354(&qword_10003E040);
  v3 = __chkstk_darwin(v2);
  v5 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v7 = (char *)&v50 - v6;
  v8 = sub_10000E354(&qword_10003D6F0);
  __chkstk_darwin(v8);
  v53 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Message(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for DispatchPredicate(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (uint64_t *)((char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  v18 = *(void **)(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
  *v17 = v18;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v15 + 104))(v17, enum case for DispatchPredicate.onQueue(_:), v14);
  v19 = v18;
  LOBYTE(v18) = _dispatchPreconditionTest(_:)(v17);
  (*(void (**)(_QWORD *, uint64_t))(v15 + 8))(v17, v14);
  if ((v18 & 1) != 0)
  {
    v20 = swift_retain_n(v1, 2);
    v21 = Logger.logObject.getter(v20);
    v22 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (_DWORD *)swift_slowAlloc(18, -1);
      v51 = v5;
      v52 = v10;
      v24 = v23;
      *v23 = 67174913;
      LODWORD(v57) = *(unsigned __int8 *)(v1 + 66);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v57, (char *)&v57 + 4, v23 + 1, v23 + 2);
      *((_WORD *)v24 + 4) = 2048;
      v25 = v13;
      v26 = v7;
      v27 = *(_QWORD *)(v1 + 16);
      swift_release(v1);
      v57 = v27;
      v7 = v26;
      v13 = v25;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v57, v58, (char *)v24 + 10, (char *)v24 + 18);
      swift_release(v1);
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "signalStop() called. { isStarted=%{BOOL,private}d, reporterID=%lld }", (uint8_t *)v24, 0x12u);
      v28 = v24;
      v5 = v51;
      v10 = v52;
      swift_slowDealloc(v28, -1, -1);
    }
    else
    {
      swift_release_n(v1, 2);
    }

    if ((*(_BYTE *)(v1 + 24) & 1) == 0)
    {
      if (*(_BYTE *)(v1 + 66) == 1)
      {
        v29 = *(_QWORD *)(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessages);
        v30 = *(_QWORD *)(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessagesUnique);
        v31 = *(_QWORD *)(v1 + 16);
        v32 = *(_QWORD *)(v1 + 32);
        v33 = *(_QWORD *)(v1 + 40);
        LOBYTE(v57) = 1;
        v58[0] = v29;
        v58[1] = v30;
        v58[2] = v31;
        v59 = 1;
        v60 = v32;
        v61 = v33;
        v62 = 0;
        swift_bridgeObjectRetain(v33);
        v34 = sub_100004F88();
        swift_bridgeObjectRelease(v33);
        v35 = type metadata accessor for Message.Metadata(0);
        v36 = v53;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v53, 1, 1, v35);
        Message.init(category:type:content:metadata:)(8, 2, v34, v36);
        if ((sub_10000BF8C((unint64_t)v13) & 1) == 0)
        {
          v53 = v13;
          v37 = swift_retain(v1);
          v38 = Logger.logObject.getter(v37);
          v39 = static os_log_type_t.debug.getter();
          if (os_log_type_enabled(v38, v39))
          {
            v40 = (uint8_t *)swift_slowAlloc(12, -1);
            *(_DWORD *)v40 = 134217984;
            v55 = v31;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v55, &v56, v40 + 4, v40 + 12);
            swift_release(v1);
            _os_log_impl((void *)&_mh_execute_header, v38, v39, "signalStop message dropped. { reporterID=%lld }", v40, 0xCu);
            swift_slowDealloc(v40, -1, -1);

          }
          else
          {

            swift_release(v1);
          }
          v13 = v53;
        }
        (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
      }
      else
      {
        v41 = swift_retain(v1);
        v42 = Logger.logObject.getter(v41);
        v43 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v42, v43))
        {
          v44 = (uint8_t *)swift_slowAlloc(12, -1);
          *(_DWORD *)v44 = 134217984;
          v57 = *(_QWORD *)(v1 + 16);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v57, v58, v44 + 4, v44 + 12);
          swift_release(v1);
          _os_log_impl((void *)&_mh_execute_header, v42, v43, "Not sending stop message, because !isStarted. { reporterID=%lld }", v44, 0xCu);
          swift_slowDealloc(v44, -1, -1);
        }
        else
        {
          swift_release(v1);
        }

      }
    }
    if (*(_BYTE *)(v1 + 66) == 1)
    {
      v45 = v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_stopSignalTime;
      swift_beginAccess(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_stopSignalTime, &v55, 0, 0);
      sub_1000047AC(v45, (uint64_t)v7, &qword_10003E040);
      v46 = type metadata accessor for Date(0);
      v47 = *(_QWORD *)(v46 - 8);
      v48 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v47 + 48))(v7, 1, v46);
      v49 = sub_100006B04((uint64_t)v7, &qword_10003E040);
      if (v48 == 1)
      {
        Date.init()(v49);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v47 + 56))(v5, 0, 1, v46);
        swift_beginAccess(v45, v54, 33, 0);
        sub_1000031DC((uint64_t)v5, v45, &qword_10003E040);
        swift_endAccess(v54);
        sub_100027024();
      }
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1000262D0(uint64_t a1, int a2)
{
  return sub_1000262F4(a2);
}

uint64_t sub_1000262F4(int a1)
{
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  id v17;
  char v18;
  uint64_t result;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  Swift::Int64 v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  char *v39;
  unint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  void *v53;
  id v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  Swift::Int64 v59;
  uint64_t v60;
  _QWORD v61[3];
  char v62;
  uint64_t v63;
  uint64_t v64;
  char v65;

  v2 = v1;
  LODWORD(v58) = a1;
  v3 = sub_10000E354(&qword_10003D6F0);
  __chkstk_darwin(v3);
  v5 = (char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Message(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v57 = (char *)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_10000E354(&qword_10003E040);
  __chkstk_darwin(v9);
  v11 = (char *)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for DispatchPredicate(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char **)((char *)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v16 = *(void **)(v2 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
  *v15 = v16;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v13 + 104))(v15, enum case for DispatchPredicate.onQueue(_:), v12);
  v17 = v16;
  v18 = _dispatchPreconditionTest(_:)(v15);
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v13 + 8))(v15, v12);
  if ((v18 & 1) != 0)
  {
    v20 = swift_retain_n(v2, 2);
    v21 = Logger.logObject.getter(v20);
    v22 = static os_log_type_t.debug.getter();
    v23 = os_log_type_enabled(v21, v22);
    v56 = v5;
    if (v23)
    {
      v24 = swift_slowAlloc(18, -1);
      *(_DWORD *)v24 = 67174913;
      LODWORD(v60) = *(unsigned __int8 *)(v2 + 66);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v60, (char *)&v60 + 4, v24 + 4, v24 + 8);
      *(_WORD *)(v24 + 8) = 2048;
      v25 = v6;
      v26 = *(_QWORD *)(v2 + 16);
      swift_release(v2);
      v60 = v26;
      v6 = v25;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v60, v61, v24 + 10, v24 + 18);
      swift_release(v2);
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "stop() called. { isStarted=%{BOOL,private}d, reporterID=%lld }", (uint8_t *)v24, 0x12u);
      swift_slowDealloc(v24, -1, -1);
    }
    else
    {
      swift_release_n(v2, 2);
    }

    v27 = type metadata accessor for Date(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v11, 1, 1, v27);
    v28 = v2 + OBJC_IVAR____TtC15audioanalyticsd7Session_stopSignalTime;
    swift_beginAccess(v2 + OBJC_IVAR____TtC15audioanalyticsd7Session_stopSignalTime, &v60, 33, 0);
    sub_1000031DC((uint64_t)v11, v28, &qword_10003E040);
    swift_endAccess(&v60);
    v29 = OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessages;
    v30 = *(_QWORD *)(v2 + OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessages);
    v31 = OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessagesUnique;
    v32 = *(_QWORD *)(v2 + OBJC_IVAR____TtC15audioanalyticsd7Session_numProcessedMessagesUnique);
    v33 = *(_QWORD *)(v2 + 16);
    v34 = *(unsigned __int8 *)(v2 + 66);
    v35 = *(_QWORD *)(v2 + 32);
    v36 = *(_QWORD *)(v2 + 40);
    LOBYTE(v60) = 2;
    v61[0] = v30;
    v61[1] = v32;
    v61[2] = v33;
    v62 = v34;
    v63 = v35;
    v64 = v36;
    v65 = v58 & 1;
    if (v34 == 1)
    {
      swift_bridgeObjectRetain(v36);
      v37 = sub_100004F88();
      swift_bridgeObjectRelease(v36);
      v38 = type metadata accessor for Message.Metadata(0);
      v39 = v56;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(v56, 1, 1, v38);
      v40 = (unint64_t)v57;
      Message.init(category:type:content:metadata:)(8, 2, v37, v39);
      if ((sub_10000BF8C(v40) & 1) == 0)
      {
        v58 = v7;
        v41 = swift_retain(v2);
        v42 = Logger.logObject.getter(v41);
        v43 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v42, v43))
        {
          v44 = (uint8_t *)swift_slowAlloc(12, -1);
          *(_DWORD *)v44 = 134217984;
          v40 = (unint64_t)v57;
          v59 = v33;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &v60, v44 + 4, v44 + 12);
          swift_release(v2);
          _os_log_impl((void *)&_mh_execute_header, v42, v43, "Stop message dropped. { reporterID=%lld }", v44, 0xCu);
          swift_slowDealloc(v44, -1, -1);

        }
        else
        {

          swift_release(v2);
        }
        v7 = v58;
      }
      (*(void (**)(unint64_t, uint64_t))(v7 + 8))(v40, v6);
    }
    else
    {
      v45 = swift_retain(v2);
      v46 = Logger.logObject.getter(v45);
      v47 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v46, v47))
      {
        v48 = (uint8_t *)swift_slowAlloc(12, -1);
        *(_DWORD *)v48 = 134217984;
        v59 = v33;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &v60, v48 + 4, v48 + 12);
        swift_release(v2);
        _os_log_impl((void *)&_mh_execute_header, v46, v47, "Not sending stop message, because !isStarted. { reporterID=%lld }", v48, 0xCu);
        swift_slowDealloc(v48, -1, -1);
      }
      else
      {
        swift_release(v2);
      }

    }
    v49 = swift_retain(v2);
    v50 = Logger.logObject.getter(v49);
    v51 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v50, v51))
    {
      v52 = (uint8_t *)swift_slowAlloc(12, -1);
      *(_DWORD *)v52 = 134217984;
      v59 = v33;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &v60, v52 + 4, v52 + 12);
      swift_release(v2);
      _os_log_impl((void *)&_mh_execute_header, v50, v51, "Ending session. { reporterID=%lld }", v52, 0xCu);
      swift_slowDealloc(v52, -1, -1);
    }
    else
    {
      swift_release(v2);
    }

    v53 = (void *)objc_opt_self(Trace);
    v54 = objc_msgSend(objc_allocWithZone((Class)TraceArgs), "initWithArg1:arg2:", static Utilities.positiveReporterID(_:)(v33), *(unsigned __int16 *)(v2 + 64));
    objc_msgSend(v53, "post:args:", 4620, v54);

    sub_100026C4C();
    *(_BYTE *)(v2 + OBJC_IVAR____TtC15audioanalyticsd7Session_startOnFirstMessageCalled) = 0;
    *(_QWORD *)(v2 + v29) = 0;
    *(_QWORD *)(v2 + v31) = 0;
    *(_BYTE *)(v2 + 66) = 0;
    type metadata accessor for OsTransactionHandler(0);
    v55 = static OsTransactionHandler.shared.getter();
    OsTransactionHandler.sessionStopped(for:)(v33);
    return swift_release(v55);
  }
  else
  {
    __break(1u);
  }
  return result;
}

char *sub_100026998(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19[2];
  _QWORD v20[5];
  _BYTE v21[32];

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_summaryDecoratorWorkers);
  swift_beginAccess(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_summaryDecoratorWorkers, v21, 0, 0);
  v4 = *v3;
  swift_bridgeObjectRetain(*v3);
  v6 = sub_100027AAC(v5);
  swift_bridgeObjectRelease(v4);
  if (a1 && *(_QWORD *)(a1 + 16))
  {
    swift_bridgeObjectRetain(a1);
    v7 = sub_10002A580((uint64_t)v6, a1);
    swift_bridgeObjectRelease(v6);
    swift_bridgeObjectRelease(a1);
    v6 = v7;
  }
  v8 = v6[2];
  if (v8)
  {
    v9 = (uint64_t)(v6 + 4);
    swift_bridgeObjectRetain(v6);
    v10 = (char *)_swiftEmptyArrayStorage;
    do
    {
      sub_10000CCD4(v9, (uint64_t)v20);
      sub_10000CCD4((uint64_t)v20, (uint64_t)v19);
      v11 = sub_10000E354(&qword_10003DDF0);
      v12 = sub_10000E354(&qword_10003DDF8);
      if ((swift_dynamicCast(&v16, v19, v11, v12, 6) & 1) == 0)
      {
        v18 = 0;
        v16 = 0u;
        v17 = 0u;
      }
      sub_10000CC90(v20);
      if (*((_QWORD *)&v17 + 1))
      {
        sub_10000BF74(&v16, (uint64_t)v19);
        sub_10000BF74(v19, (uint64_t)&v16);
        if ((swift_isUniquelyReferenced_nonNull_native(v10) & 1) == 0)
          v10 = sub_100008F44(0, *((_QWORD *)v10 + 2) + 1, 1, v10, &qword_10003DFD0, &qword_10003DDF8);
        v14 = *((_QWORD *)v10 + 2);
        v13 = *((_QWORD *)v10 + 3);
        if (v14 >= v13 >> 1)
          v10 = sub_100008F44((char *)(v13 > 1), v14 + 1, 1, v10, &qword_10003DFD0, &qword_10003DDF8);
        *((_QWORD *)v10 + 2) = v14 + 1;
        sub_10000BF74(&v16, (uint64_t)&v10[40 * v14 + 32]);
      }
      else
      {
        sub_100006B04((uint64_t)&v16, &qword_10003DFC8);
      }
      v9 += 40;
      --v8;
    }
    while (v8);
    swift_bridgeObjectRelease_n(v6, 2);
  }
  else
  {
    swift_bridgeObjectRelease(v6);
    return (char *)_swiftEmptyArrayStorage;
  }
  return v10;
}

uint64_t sub_100026BD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 136);
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + 136);
  }
  else
  {
    v3 = _s16RetainedMessagesCMa();
    v2 = swift_allocObject(v3, 24, 7);
    *(_QWORD *)(v2 + 16) = sub_10001047C((uint64_t)_swiftEmptyArrayStorage);
    v4 = *(_QWORD *)(v0 + 136);
    *(_QWORD *)(v0 + 136) = v2;
    swift_retain(v2);
    swift_release(v4);
    v1 = 0;
  }
  swift_retain(v1);
  return v2;
}

void sub_100026C4C()
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
  __n128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v30;
  _QWORD *v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  char *v37;
  __n128 v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[3];
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[3];
  uint64_t v49;
  uint64_t v50;
  char v51[32];

  v1 = v0;
  v2 = type metadata accessor for Config.WorkerConfigs(0);
  v40 = *(_QWORD *)(v2 - 8);
  v41 = v2;
  __chkstk_darwin(v2);
  v39 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (_QWORD *)(v0 + 88);
  swift_beginAccess(v0 + 88, v51, 0, 0);
  if (*(_QWORD *)(*(_QWORD *)(v0 + 88) + 16))
  {
    swift_beginAccess(v0 + 88, v48, 33, 0);
    sub_10000B264((char **)(v0 + 88), (uint64_t (*)(uint64_t))&Config.WorkerConfigs.stopOrder.getter);
    swift_endAccess(v48);
    v5 = *v4;
    v6 = *(_QWORD *)(*v4 + 16);
    if (v6)
    {
      v36 = (_QWORD *)(v0 + 88);
      v7 = v0 + OBJC_IVAR____TtC15audioanalyticsd7Session_logger;
      v8 = v5 + 32;
      v35 = v5;
      v9 = swift_bridgeObjectRetain(v5);
      v9.n128_u64[0] = 136315394;
      v38 = v9;
      v37 = (char *)&type metadata for Any + 8;
      do
      {
        sub_10000CCD4(v8, (uint64_t)v48);
        sub_10000CCD4((uint64_t)v48, (uint64_t)v45);
        v12 = swift_retain_n(v1, 2);
        v13 = Logger.logObject.getter(v12);
        v14 = static os_log_type_t.debug.getter();
        v15 = v14;
        if (os_log_type_enabled(v13, v14))
        {
          v16 = swift_slowAlloc(22, -1);
          v43 = swift_slowAlloc(32, -1);
          v44 = v43;
          *(_DWORD *)v16 = v38.n128_u32[0];
          v17 = v46;
          v18 = v47;
          sub_10000CCB0(v45, v46);
          v19 = v7;
          v20 = v1;
          v21 = v39;
          v42 = v15;
          v22 = dispatch thunk of WorkerProtocol.workerConfig.getter(v17, v18);
          v23 = Config.WorkerConfigs.rawValue.getter(v22);
          v25 = v24;
          v26 = v21;
          v1 = v20;
          v7 = v19;
          (*(void (**)(char *, uint64_t))(v40 + 8))(v26, v41);
          *(_QWORD *)(v16 + 4) = sub_10000A7E4(v23, v25, &v44);
          swift_bridgeObjectRelease(v25);
          sub_10000CC90(v45);
          *(_WORD *)(v16 + 12) = 2048;
          v27 = *(_QWORD *)(v1 + 16);
          swift_release(v1);
          *(_QWORD *)(v16 + 14) = v27;
          swift_release(v1);
          _os_log_impl((void *)&_mh_execute_header, v13, (os_log_type_t)v42, "Stopping worker { worker=%s, reporterID=%lld  }", (uint8_t *)v16, 0x16u);
          v28 = v43;
          swift_arrayDestroy(v43, 1, v37);
          swift_slowDealloc(v28, -1, -1);
          swift_slowDealloc(v16, -1, -1);

        }
        else
        {

          swift_release(v1);
          sub_10000CC90(v45);
          swift_release(v1);
        }
        v10 = v49;
        v11 = v50;
        sub_10000CCB0(v48, v49);
        dispatch thunk of WorkerProtocol.stop()(v10, v11);
        sub_10000CC90(v48);
        v8 += 40;
        --v6;
      }
      while (v6);
      swift_bridgeObjectRelease(v35);
      v4 = v36;
    }
    swift_beginAccess(v4, v48, 33, 0);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
    v30 = *v4;
    if (isUniquelyReferenced_nonNull_native)
    {
      sub_100025354(0, *(_QWORD *)(v30 + 16));
    }
    else
    {
      *v4 = sub_100029C0C(0, *(_QWORD *)(v30 + 24) >> 1, &qword_10003DFD8);
      swift_bridgeObjectRelease(v30);
    }
    swift_endAccess(v48);
    v31 = (_QWORD *)(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_summaryDecoratorWorkers);
    swift_beginAccess(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_summaryDecoratorWorkers, v48, 33, 0);
    v32 = swift_isUniquelyReferenced_nonNull_native(*v31);
    v33 = *v31;
    if (v32)
    {
      sub_100025368(0, *(_QWORD *)(v33 + 16));
    }
    else
    {
      *v31 = sub_100029C0C(0, *(_QWORD *)(v33 + 24) >> 1, &qword_10003DFD0);
      swift_bridgeObjectRelease(v33);
    }
    swift_endAccess(v48);
  }
}

void sub_100027024()
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
  _QWORD *v9;
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
  _QWORD *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  _QWORD *v54;
  void **aBlock;
  _QWORD v56[4];
  uint64_t v57;
  char v58[32];

  v1 = v0;
  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v51 = *(_QWORD *)(v2 - 8);
  v52 = v2;
  __chkstk_darwin(v2);
  v50 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for DispatchQoS(0);
  v48 = *(_QWORD *)(v4 - 8);
  v49 = v4;
  __chkstk_darwin(v4);
  v47 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchTimeInterval(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (uint64_t *)((char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v46 = type metadata accessor for DispatchTime(0);
  v44 = *(_QWORD *)(v46 - 8);
  v10 = __chkstk_darwin(v46);
  v12 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v53 = (char *)&v43 - v13;
  v14 = sub_10000E354(&qword_10003E040);
  __chkstk_darwin(v14);
  v16 = (char *)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for DispatchPredicate(0);
  v18 = *(_QWORD *)(v17 - 8);
  __chkstk_darwin(v17);
  v20 = (uint64_t *)((char *)&v43 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  v21 = *(void **)(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
  *v20 = v21;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v18 + 104))(v20, enum case for DispatchPredicate.onQueue(_:), v17);
  v45 = v21;
  LOBYTE(v21) = _dispatchPreconditionTest(_:)(v20);
  (*(void (**)(_QWORD *, uint64_t))(v18 + 8))(v20, v17);
  if ((v21 & 1) != 0)
  {
    v22 = swift_retain(v1);
    v23 = Logger.logObject.getter(v22);
    v24 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc(12, -1);
      *(_DWORD *)v25 = 134217984;
      aBlock = *(void ***)(v1 + 16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v56, v25 + 4, v25 + 12);
      swift_release(v1);
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "enqueueStop() called. { reporterID=%lld }", v25, 0xCu);
      swift_slowDealloc(v25, -1, -1);
    }
    else
    {
      swift_release(v1);
    }

    if (*(_BYTE *)(v1 + 66) == 1)
    {
      v26 = v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_stopSignalTime;
      swift_beginAccess(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_stopSignalTime, v58, 0, 0);
      sub_1000047AC(v26, (uint64_t)v16, &qword_10003E040);
      v27 = type metadata accessor for Date(0);
      LODWORD(v26) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 48))(v16, 1, v27);
      v28 = sub_100006B04((uint64_t)v16, &qword_10003E040);
      if ((_DWORD)v26 != 1)
      {
        static DispatchTime.now()(v28);
        *v9 = *(_QWORD *)(v1 + OBJC_IVAR____TtC15audioanalyticsd7Session_stopWaitTime);
        (*(void (**)(_QWORD *, _QWORD, uint64_t))(v7 + 104))(v9, enum case for DispatchTimeInterval.seconds(_:), v6);
        + infix(_:_:)(v12, v9);
        (*(void (**)(_QWORD *, uint64_t))(v7 + 8))(v9, v6);
        v29 = *(void (**)(char *, uint64_t))(v44 + 8);
        v30 = v46;
        v29(v12, v46);
        v31 = swift_allocObject(&unk_10003A210, 24, 7);
        swift_weakInit(v31 + 16, v1);
        v56[3] = sub_10002AA28;
        v57 = v31;
        aBlock = _NSConcreteStackBlock;
        v56[0] = 1107296256;
        v56[1] = sub_100006CEC;
        v56[2] = &unk_10003A228;
        v32 = _Block_copy(&aBlock);
        v33 = swift_retain(v31);
        v34 = v47;
        static DispatchQoS.unspecified.getter(v33);
        v54 = _swiftEmptyArrayStorage;
        v35 = sub_100006818((unint64_t *)&qword_10003D6D8, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
        v36 = sub_10000E354((uint64_t *)&unk_10003DBA0);
        v37 = sub_10000AD58((unint64_t *)&qword_10003D6E0, (uint64_t *)&unk_10003DBA0);
        v38 = v50;
        v39 = v36;
        v40 = v52;
        dispatch thunk of SetAlgebra.init<A>(_:)(&v54, v39, v37, v52, v35);
        v41 = v53;
        OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)(v53, v34, v38, v32);
        _Block_release(v32);
        (*(void (**)(char *, uint64_t))(v51 + 8))(v38, v40);
        (*(void (**)(char *, uint64_t))(v48 + 8))(v34, v49);
        v29(v41, v30);
        v42 = v57;
        swift_release(v31);
        swift_release(v42);
      }
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_100027540(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  _BOOL4 v26;
  uint8_t *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  _QWORD *v44;
  double aBlock;
  _QWORD v46[3];
  uint64_t (*v47)();
  uint64_t v48;
  char v49[24];
  char v50[32];

  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v43 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v42 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for DispatchQoS(0);
  v41 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_10000E354(&qword_10003E040);
  v8 = __chkstk_darwin(v7);
  v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v38 - v11;
  v13 = type metadata accessor for Date(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  a1 += 16;
  swift_beginAccess(a1, v50, 0, 0);
  result = swift_weakLoadStrong(a1);
  if (result)
  {
    v18 = result;
    v40 = v4;
    v19 = result + OBJC_IVAR____TtC15audioanalyticsd7Session_stopSignalTime;
    swift_beginAccess(result + OBJC_IVAR____TtC15audioanalyticsd7Session_stopSignalTime, v49, 0, 0);
    sub_1000047AC(v19, (uint64_t)v12, &qword_10003E040);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
    {
      swift_release(v18);
      return sub_100006B04((uint64_t)v12, &qword_10003E040);
    }
    else
    {
      v20 = (*(uint64_t (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
      v21 = fabs(Date.timeIntervalSinceNow.getter(v20));
      v22 = (double)*(uint64_t *)(v18 + OBJC_IVAR____TtC15audioanalyticsd7Session_stopWaitTime);
      v23 = swift_retain(v18);
      v24 = Logger.logObject.getter(v23);
      v25 = static os_log_type_t.debug.getter();
      v26 = os_log_type_enabled(v24, v25);
      v39 = v2;
      if (v21 <= v22)
      {
        if (v26)
        {
          v28 = swift_slowAlloc(22, -1);
          *(_DWORD *)v28 = 134218240;
          aBlock = v22 - v21;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v46, v28 + 4, v28 + 12);
          *(_WORD *)(v28 + 12) = 2048;
          aBlock = *(double *)(v18 + 16);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v46, v28 + 14, v28 + 22);
          swift_release(v18);
          _os_log_impl((void *)&_mh_execute_header, v24, v25, "Not stopping session from timer. { remainingTime=%f, reporterID=%lld }", (uint8_t *)v28, 0x16u);
          swift_slowDealloc(v28, -1, -1);
        }
        else
        {
          swift_release(v18);
        }

        v38 = *(_QWORD *)(v18 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
        v47 = sub_10002AA30;
        v48 = v18;
        aBlock = COERCE_DOUBLE(_NSConcreteStackBlock);
        v46[0] = 1107296256;
        v29 = &unk_10003A250;
      }
      else
      {
        if (v26)
        {
          v27 = (uint8_t *)swift_slowAlloc(12, -1);
          *(_DWORD *)v27 = 134217984;
          aBlock = *(double *)(v18 + 16);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v46, v27 + 4, v27 + 12);
          swift_release(v18);
          _os_log_impl((void *)&_mh_execute_header, v24, v25, "Calling stop on session from timer. { reporterID=%lld }", v27, 0xCu);
          swift_slowDealloc(v27, -1, -1);
        }
        else
        {
          swift_release(v18);
        }

        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v10, 1, 1, v13);
        swift_beginAccess(v19, &aBlock, 33, 0);
        sub_1000031DC((uint64_t)v10, v19, &qword_10003E040);
        swift_endAccess(&aBlock);
        v38 = *(_QWORD *)(v18 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
        v47 = sub_10002AA34;
        v48 = v18;
        aBlock = COERCE_DOUBLE(_NSConcreteStackBlock);
        v46[0] = 1107296256;
        v29 = &unk_10003A278;
      }
      v46[1] = sub_100006CEC;
      v46[2] = v29;
      v30 = _Block_copy(&aBlock);
      v31 = swift_retain(v18);
      static DispatchQoS.unspecified.getter(v31);
      v44 = _swiftEmptyArrayStorage;
      v32 = sub_100006818((unint64_t *)&qword_10003D6D8, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
      v33 = sub_10000E354((uint64_t *)&unk_10003DBA0);
      v34 = sub_10000AD58((unint64_t *)&qword_10003D6E0, (uint64_t *)&unk_10003DBA0);
      v35 = v42;
      v36 = v33;
      v37 = v39;
      dispatch thunk of SetAlgebra.init<A>(_:)(&v44, v36, v34, v39, v32);
      OS_dispatch_queue.async(group:qos:flags:execute:)(0, v6, v35, v30);
      _Block_release(v30);
      (*(void (**)(char *, uint64_t))(v43 + 8))(v35, v37);
      (*(void (**)(char *, uint64_t))(v41 + 8))(v6, v40);
      (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
      swift_release(v18);
      return swift_release(v48);
    }
  }
  return result;
}

_QWORD *sub_100027AAC(uint64_t a1)
{
  int64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _BYTE v10[40];
  __int128 v11[2];
  _QWORD *v12;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = _swiftEmptyArrayStorage;
  if (v1)
  {
    v12 = _swiftEmptyArrayStorage;
    sub_100028B94(0, v1, 0);
    v4 = a1 + 32;
    v2 = _swiftEmptyArrayStorage;
    do
    {
      sub_10000CCD4(v4, (uint64_t)v10);
      v5 = sub_10000E354(&qword_10003DDF8);
      v6 = sub_10000E354(&qword_10003DDF0);
      swift_dynamicCast(v11, v10, v5, v6, 7);
      if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
      {
        sub_100028B94(0, v2[2] + 1, 1);
        v2 = v12;
      }
      v8 = v2[2];
      v7 = v2[3];
      if (v8 >= v7 >> 1)
      {
        sub_100028B94(v7 > 1, v8 + 1, 1);
        v2 = v12;
      }
      v2[2] = v8 + 1;
      sub_10000BF74(v11, (uint64_t)&v2[5 * v8 + 4]);
      v4 += 40;
      --v1;
    }
    while (v1);
  }
  return v2;
}

_QWORD *sub_100027BE4()
{
  _QWORD *v0;
  char *v1;
  uint64_t v2;

  swift_bridgeObjectRelease(v0[5]);
  swift_release(v0[7]);
  swift_bridgeObjectRelease(v0[9]);
  swift_bridgeObjectRelease(v0[10]);
  swift_bridgeObjectRelease(v0[11]);
  sub_100006B04((uint64_t)(v0 + 12), &qword_10003D808);
  swift_release(v0[17]);
  v1 = (char *)v0 + OBJC_IVAR____TtC15audioanalyticsd7Session_logger;
  v2 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  swift_bridgeObjectRelease(*(_QWORD *)((char *)v0 + OBJC_IVAR____TtC15audioanalyticsd7Session_summaryDecoratorWorkers));
  sub_100006B04((uint64_t)v0 + OBJC_IVAR____TtC15audioanalyticsd7Session_stopSignalTime, &qword_10003E040);
  swift_bridgeObjectRelease(*(_QWORD *)((char *)v0 + OBJC_IVAR____TtC15audioanalyticsd7Session_messageHistory));
  return v0;
}

uint64_t sub_100027CB0()
{
  uint64_t v0;

  sub_100027BE4();
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_100027CD4()
{
  return type metadata accessor for Session(0);
}

void sub_100027CDC(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[21];

  v6[0] = (char *)&value witness table for Builtin.Int64 + 64;
  v6[1] = &unk_100032020;
  v6[2] = &unk_100032038;
  v6[3] = (char *)&value witness table for Builtin.Int32 + 64;
  v6[4] = (char *)&value witness table for Builtin.NativeObject + 64;
  v6[5] = (char *)&value witness table for Builtin.Int16 + 64;
  v6[6] = &unk_100032020;
  v6[7] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v6[8] = &unk_100032050;
  v6[9] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v6[10] = &unk_100032068;
  v6[11] = &unk_100032050;
  v2 = type metadata accessor for Logger(319);
  if (v3 <= 0x3F)
  {
    v6[12] = *(_QWORD *)(v2 - 8) + 64;
    v6[13] = (char *)&value witness table for Builtin.Int64 + 64;
    v6[14] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v6[15] = (char *)&value witness table for Builtin.BridgeObject + 64;
    sub_100027E04(319);
    if (v5 <= 0x3F)
    {
      v6[16] = *(_QWORD *)(v4 - 8) + 64;
      v6[17] = (char *)&value witness table for Builtin.BridgeObject + 64;
      v6[18] = (char *)&value witness table for Builtin.Int64 + 64;
      v6[19] = (char *)&value witness table for Builtin.Int64 + 64;
      v6[20] = &unk_100032020;
      swift_updateClassMetadata2(a1, 256, 21, v6, a1 + 80);
    }
  }
}

void sub_100027E04(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_10003DEA0)
  {
    v2 = type metadata accessor for Date(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_10003DEA0);
  }
}

uint64_t sub_100027E58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for Message(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 24) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  swift_release(*(_QWORD *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100027ECC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for Message(0) - 8) + 80);
  return sub_10000BF8C(v0 + ((v1 + 24) & ~v1));
}

_QWORD *sub_100027F0C(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_100028040(a1, a2, a3, a4, &qword_10003E038, (void (*)(_QWORD, int64_t, _QWORD *, _QWORD *))sub_10002A108);
}

_QWORD *sub_100027F20(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  _QWORD *v14;

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
      v10 = sub_10000E354(&qword_10003E048);
      v11 = (_QWORD *)swift_allocObject(v10, 16 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 17;
      v11[2] = v8;
      v11[3] = 2 * (v13 >> 4);
      v14 = v11 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = _swiftEmptyArrayStorage;
      v14 = &_swiftEmptyArrayStorage[4];
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[2 * v8 + 4])
          memmove(v14, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_10002A018(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

_QWORD *sub_10002802C(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_100028040(a1, a2, a3, a4, &qword_10003DFF0, (void (*)(_QWORD, int64_t, _QWORD *, _QWORD *))sub_10002A1F0);
}

_QWORD *sub_100028040(_QWORD *result, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, void (*a6)(_QWORD, int64_t, _QWORD *, _QWORD *))
{
  char v8;
  unint64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  uint64_t v13;
  _QWORD *v14;
  int64_t v15;
  uint64_t v16;
  _QWORD *v17;

  v8 = (char)result;
  if ((a3 & 1) == 0)
  {
    v10 = a2;
    goto LABEL_8;
  }
  v9 = a4[3];
  v10 = v9 >> 1;
  if ((uint64_t)(v9 >> 1) >= a2)
    goto LABEL_8;
  if (v10 + 0x4000000000000000 >= 0)
  {
    v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v10 = a2;
LABEL_8:
    v11 = a4[2];
    if (v10 <= v11)
      v12 = a4[2];
    else
      v12 = v10;
    if (v12)
    {
      v13 = sub_10000E354(a5);
      v14 = (_QWORD *)swift_allocObject(v13, 16 * v12 + 32, 7);
      v15 = j__malloc_size(v14);
      v16 = v15 - 32;
      if (v15 < 32)
        v16 = v15 - 17;
      v14[2] = v11;
      v14[3] = 2 * (v16 >> 4);
      v17 = v14 + 4;
      if ((v8 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v14 = _swiftEmptyArrayStorage;
      v17 = &_swiftEmptyArrayStorage[4];
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v14 != a4 || v17 >= &a4[2 * v11 + 4])
          memmove(v17, a4 + 4, 16 * v11);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    a6(0, v11, v17, a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v14;
  }
  __break(1u);
  return result;
}

uint64_t sub_100028154(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  size_t v16;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
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
LABEL_29:
        result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division by zero", 16, 2, "Swift/IntegerTypes.swift", 24, 2, 14377, 0);
LABEL_31:
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
  if (!v9)
  {
    v15 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_10000E354(&qword_10003DFE8);
  v11 = *(_QWORD *)(type metadata accessor for Message(0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  v16 = j__malloc_size(v15);
  if (!v12)
    goto LABEL_29;
  if (v16 - v14 == 0x8000000000000000 && v12 == -1)
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division results in an overflow", 31, 2, "Swift/IntegerTypes.swift", 24, 2, 14384, 0);
    goto LABEL_31;
  }
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  v18 = type metadata accessor for Message(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v15 + v20;
  if ((a1 & 1) != 0)
  {
    v22 = a4 + v20;
    if ((unint64_t)v15 < a4 || v21 >= v22 + *(_QWORD *)(v19 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack((char *)v15 + v20, v22, v8, v18);
    }
    else if (v15 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront((char *)v15 + v20);
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_10002A864(0, v8, v21, a4);
  }
  swift_bridgeObjectRelease(a4);
  return (uint64_t)v15;
}

uint64_t sub_10002835C(unint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_1000283D4(unint64_t result, uint64_t a2)
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
  _QWORD *v16;
  _QWORD *v17;
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
            v16 = (_QWORD *)(v15 + 8 * v3);
            v17 = (_QWORD *)(v15 + 8 * v6);
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

unint64_t sub_100028568(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  Swift::UInt32 v9;
  unint64_t v10;
  uint64_t v11;
  _DWORD *v12;
  _DWORD *v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  int64_t v17;
  unint64_t v18;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26[9];

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
      while (1)
      {
        v9 = *(_DWORD *)(*(_QWORD *)(a2 + 48) + 4 * v6);
        Hasher.init(_seed:)(v26, *(_QWORD *)(a2 + 40));
        Hasher._combine(_:)(v9);
        result = Hasher._finalize()();
        v10 = result & v7;
        if (v3 >= (uint64_t)v8)
          break;
        if (v10 < v8)
          goto LABEL_11;
LABEL_12:
        v11 = *(_QWORD *)(a2 + 48);
        v12 = (_DWORD *)(v11 + 4 * v3);
        v13 = (_DWORD *)(v11 + 4 * v6);
        if (v3 != v6 || v12 >= v13 + 1)
          *v12 = *v13;
        v14 = *(_QWORD *)(a2 + 56);
        v15 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for Message(0) - 8) + 72);
        v16 = v15 * v3;
        result = v14 + v15 * v3;
        v17 = v15 * v6;
        v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v3 = v6;
          if (v16 == v17)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v3 = v6;
LABEL_6:
        v6 = (v6 + 1) & v7;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          goto LABEL_21;
      }
      if (v10 < v8)
        goto LABEL_6;
LABEL_11:
      if (v3 < (uint64_t)v10)
        goto LABEL_6;
      goto LABEL_12;
    }
LABEL_21:
    v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v21 = *v20;
    v22 = (-1 << v3) - 1;
  }
  else
  {
    v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    v22 = *v20;
    v21 = (-1 << result) - 1;
  }
  *v20 = v22 & v21;
  v23 = *(_QWORD *)(a2 + 16);
  v24 = __OFSUB__(v23, 1);
  v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_100028748(int64_t a1, uint64_t a2)
{
  int *v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
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
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  Swift::Int v32;
  Swift::Int v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  BOOL v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  _QWORD v51[9];

  v4 = (int *)type metadata accessor for FeatureInfo(0);
  v5 = *((_QWORD *)v4 - 1);
  result = __chkstk_darwin(v4);
  v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    v50 = a2 + 64;
    result = _HashTable.previousHole(before:)(a1, a2 + 64, ~v9);
    v12 = v50;
    if ((*(_QWORD *)(v50 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v48 = v11;
      v49 = (result + 1) & v11;
      v13 = *(_QWORD *)(v5 + 72);
      do
      {
        v14 = v13;
        v15 = v13 * v10;
        sub_10002AAA0(*(_QWORD *)(a2 + 48) + v13 * v10, (uint64_t)v8);
        Hasher.init(_seed:)(v51, *(_QWORD *)(a2 + 40));
        v16 = type metadata accessor for SystemMonitorConfig.MonitorType(0);
        v17 = sub_100006818(&qword_10003DE00, (uint64_t (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.MonitorType, (uint64_t)&protocol conformance descriptor for SystemMonitorConfig.MonitorType);
        dispatch thunk of Hashable.hash(into:)(v51, v16, v17);
        v18 = &v8[v4[5]];
        v19 = *(_QWORD *)v18;
        v20 = *((_QWORD *)v18 + 1);
        swift_bridgeObjectRetain(v20);
        String.hash(into:)(v51, v19, v20);
        swift_bridgeObjectRelease(v20);
        v21 = &v8[v4[6]];
        v22 = *(_QWORD *)v21;
        v23 = *((_QWORD *)v21 + 1);
        swift_bridgeObjectRetain(v23);
        String.hash(into:)(v51, v22, v23);
        swift_bridgeObjectRelease(v23);
        v24 = &v8[v4[7]];
        v25 = *(_QWORD *)v24;
        v26 = *((_QWORD *)v24 + 1);
        swift_bridgeObjectRetain(v26);
        String.hash(into:)(v51, v25, v26);
        swift_bridgeObjectRelease(v26);
        v27 = &v8[v4[8]];
        v28 = *(_QWORD *)v27;
        v29 = *((_QWORD *)v27 + 1);
        swift_bridgeObjectRetain(v29);
        String.hash(into:)(v51, v28, v29);
        swift_bridgeObjectRelease(v29);
        v30 = type metadata accessor for SystemMonitorConfig.DataType(0);
        v31 = sub_100006818(&qword_10003DE08, (uint64_t (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.DataType, (uint64_t)&protocol conformance descriptor for SystemMonitorConfig.DataType);
        dispatch thunk of Hashable.hash(into:)(v51, v30, v31);
        v32 = Hasher._finalize()();
        result = sub_100013324((uint64_t)v8);
        v33 = v32 & v11;
        if (a1 >= (uint64_t)v49)
        {
          if (v33 < v49)
          {
            v13 = v14;
          }
          else
          {
            v13 = v14;
            if (a1 >= v33)
              goto LABEL_12;
          }
        }
        else
        {
          v13 = v14;
          if (v33 >= v49 || a1 >= v33)
          {
LABEL_12:
            v34 = *(_QWORD *)(a2 + 48);
            v35 = v34 + v13 * a1;
            v36 = v34 + v15;
            if (v13 * a1 < v15 || v35 >= v36 + v13)
            {
              swift_arrayInitWithTakeFrontToBack(v35, v36, 1, v4);
            }
            else if (v13 * a1 != v15)
            {
              swift_arrayInitWithTakeBackToFront(v35);
            }
            v37 = *(_QWORD *)(a2 + 56);
            v38 = type metadata accessor for FeatureState(0);
            v39 = *(_QWORD *)(*(_QWORD *)(v38 - 8) + 72);
            v40 = v39 * a1;
            result = v37 + v39 * a1;
            v41 = v37 + v39 * v10;
            if (v39 * a1 < (uint64_t)(v39 * v10) || result >= v41 + v39)
            {
              result = swift_arrayInitWithTakeFrontToBack(result, v41, 1, v38);
              a1 = v10;
              v11 = v48;
            }
            else
            {
              a1 = v10;
              v11 = v48;
              if (v40 != v39 * v10)
              {
                result = swift_arrayInitWithTakeBackToFront(result);
                a1 = v10;
              }
            }
          }
        }
        v10 = (v10 + 1) & v11;
        v12 = v50;
      }
      while (((*(_QWORD *)(v50 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v42 = (uint64_t *)(v12 + 8 * ((unint64_t)a1 >> 6));
    v43 = *v42;
    v44 = (-1 << a1) - 1;
  }
  else
  {
    v42 = (uint64_t *)(a2 + 64 + 8 * ((unint64_t)a1 >> 6));
    v44 = *v42;
    v43 = (-1 << a1) - 1;
  }
  *v42 = v44 & v43;
  v45 = *(_QWORD *)(a2 + 16);
  v46 = __OFSUB__(v45, 1);
  v47 = v45 - 1;
  if (v46)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v47;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_100028B08(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_100028BB0(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_100028B24(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_100028D90(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_100028B40(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_100028EF8(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_100028B5C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_100029054(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_100028B78(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1000291A0(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_100028B94(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1000292FC(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_100028BB0(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  size_t v16;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
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
    v15 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_10000E354(&qword_10003E060);
  v11 = *(_QWORD *)(type metadata accessor for FeatureInfo(0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  v16 = j__malloc_size(v15);
  if (!v12)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v16 - v14 == 0x8000000000000000 && v12 == -1)
    goto LABEL_34;
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  v18 = type metadata accessor for FeatureInfo(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (char *)v15 + v20;
  v22 = (char *)a4 + v20;
  if ((a1 & 1) != 0)
  {
    if (v15 < a4 || v21 >= &v22[*(_QWORD *)(v19 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack(v21, v22, v8, v18);
    }
    else if (v15 != a4)
    {
      swift_arrayInitWithTakeBackToFront(v21);
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v23 = *(_QWORD *)(v19 + 72) * v8;
  v24 = &v21[v23];
  v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy(v21);
LABEL_32:
    swift_release(a4);
    return (uint64_t)v15;
  }
LABEL_36:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100028D90(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_10000E354(&qword_10003E048);
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

uint64_t sub_100028EF8(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_10000E354(&qword_10003D800);
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
    v11 = (char *)&_swiftEmptyArrayStorage;
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

uint64_t sub_100029054(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_10000E354(&qword_10003E050);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
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
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_1000291A0(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_10000E354(&qword_10003E038);
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

uint64_t sub_1000292FC(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  size_t v12;
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_10000E354(&qword_10003DFD8);
    v11 = (_QWORD *)swift_allocObject(v10, 40 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v11[2] = v8;
    v11[3] = 2 * ((uint64_t)(v12 - 32) / 40);
  }
  else
  {
    v11 = _swiftEmptyArrayStorage;
  }
  v13 = (unint64_t)(v11 + 4);
  v14 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= v14 + 40 * v8)
      memmove(v11 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v14 >= v13 + 40 * v8 || v13 >= v14 + 40 * v8)
  {
    sub_10000E354(&qword_10003DDF0);
    swift_arrayInitWithCopy(v11 + 4);
LABEL_28:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10002949C(char *a1, char *a2, unint64_t a3, char *a4, uint64_t (*a5)(uint64_t))
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
  char *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  unsigned int v23;
  char *v24;
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  _OWORD *v30;
  unint64_t v31;
  __int128 v32;
  __int128 v33;
  char *v34;
  __int128 v35;
  __int128 v36;
  char *v37;
  unint64_t v38;
  uint64_t (*v39)(uint64_t);
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t);
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  unint64_t v54;
  char *v55;
  char *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t result;
  uint64_t v62;
  char *v63;
  char *v64;
  unsigned int v65;
  unint64_t v66;
  unint64_t v67;
  char *v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t);
  _QWORD v73[3];
  uint64_t v74;
  uint64_t v75;
  _QWORD v76[3];
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  char *v80;
  char *v81;

  v72 = a5;
  v9 = type metadata accessor for Config.WorkerConfigs(0);
  v70 = *(_QWORD *)(v9 - 8);
  v71 = v9;
  v10 = __chkstk_darwin(v9);
  v69 = (char *)&v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v67 = a3;
  v68 = (char *)&v62 - v12;
  v13 = a2 - a1;
  v14 = (a2 - a1) / 40;
  v15 = a3 - (_QWORD)a2;
  v16 = v15 / 40;
  v81 = a1;
  v80 = a4;
  if (v14 >= v15 / 40)
  {
    if (v15 < -39)
      goto LABEL_43;
    if (a4 != a2 || &a2[40 * v16] <= a4)
      memmove(a4, a2, 40 * v16);
    v37 = &a4[40 * v16];
    v79 = (unint64_t)v37;
    v81 = a2;
    if (v15 < 40 || a1 >= a2)
      goto LABEL_42;
    v38 = v67 - 40;
    v64 = a4;
    v63 = a1;
    v39 = v72;
    while (1)
    {
      v66 = (unint64_t)a2;
      v67 = v38 + 40;
      sub_10000CCD4((uint64_t)(v37 - 40), (uint64_t)v76);
      v40 = a2 - 40;
      sub_10000CCD4((uint64_t)(a2 - 40), (uint64_t)v73);
      v41 = v77;
      v42 = v78;
      sub_10000CCB0(v76, v77);
      v43 = v68;
      v44 = dispatch thunk of WorkerProtocol.workerConfig.getter(v41, v42);
      LOBYTE(v65) = v39(v44);
      v65 = v65;
      v45 = *(void (**)(char *, uint64_t))(v70 + 8);
      v46 = v43;
      v47 = v71;
      v45(v46, v71);
      v48 = v74;
      v49 = v75;
      sub_10000CCB0(v73, v74);
      v50 = v69;
      v51 = dispatch thunk of WorkerProtocol.workerConfig.getter(v48, v49);
      LOBYTE(v48) = v39(v51);
      v45(v50, v47);
      sub_10000CC90(v73);
      sub_10000CC90(v76);
      if (v65 >= v48)
      {
        v40 = (char *)v66;
        v54 = v79;
        v37 = (char *)(v79 - 40);
        v79 -= 40;
        if (v67 >= v54 && v38 < v54)
        {
          v55 = v64;
          v56 = v63;
          if (v67 != v54)
          {
            v57 = *(_OWORD *)v37;
            v58 = *((_OWORD *)v37 + 1);
            *(_QWORD *)(v38 + 32) = *((_QWORD *)v37 + 4);
            *(_OWORD *)v38 = v57;
            *(_OWORD *)(v38 + 16) = v58;
          }
          goto LABEL_40;
        }
        v59 = *(_OWORD *)v37;
        v60 = *(_OWORD *)(v54 - 24);
        *(_QWORD *)(v38 + 32) = *(_QWORD *)(v54 - 8);
        *(_OWORD *)v38 = v59;
        *(_OWORD *)(v38 + 16) = v60;
      }
      else
      {
        if (v67 != v66 || v38 >= v66)
        {
          v52 = *(_OWORD *)v40;
          v53 = *((_OWORD *)v40 + 1);
          *(_QWORD *)(v38 + 32) = *((_QWORD *)v40 + 4);
          *(_OWORD *)v38 = v52;
          *(_OWORD *)(v38 + 16) = v53;
        }
        v81 -= 40;
        v37 = (char *)v79;
      }
      v55 = v64;
      v56 = v63;
LABEL_40:
      if (v37 > v55)
      {
        v38 -= 40;
        a2 = v40;
        if (v40 > v56)
          continue;
      }
      goto LABEL_42;
    }
  }
  if (v13 >= -39)
  {
    if (a4 != a1 || &a1[40 * v14] <= a4)
      memmove(a4, a1, 40 * v14);
    v66 = (unint64_t)&a4[40 * v14];
    v79 = v66;
    if (v13 >= 40 && (unint64_t)a2 < v67)
    {
      v17 = v71;
      do
      {
        sub_10000CCD4((uint64_t)a2, (uint64_t)v76);
        sub_10000CCD4((uint64_t)a4, (uint64_t)v73);
        v18 = v77;
        v19 = v78;
        sub_10000CCB0(v76, v77);
        v20 = v68;
        v21 = dispatch thunk of WorkerProtocol.workerConfig.getter(v18, v19);
        v22 = v72;
        v23 = v72(v21);
        v24 = a2;
        v25 = *(void (**)(char *, uint64_t))(v70 + 8);
        v25(v20, v17);
        v26 = v74;
        v27 = v75;
        sub_10000CCB0(v73, v74);
        v28 = v69;
        v29 = dispatch thunk of WorkerProtocol.workerConfig.getter(v26, v27);
        LOBYTE(v26) = v22(v29);
        v25(v28, v17);
        sub_10000CC90(v73);
        sub_10000CC90(v76);
        v30 = v81;
        if (v23 >= v26)
        {
          v34 = v80 + 40;
          if (v81 != v80 || v81 >= v34)
          {
            v35 = *(_OWORD *)v80;
            v36 = *((_OWORD *)v80 + 1);
            *((_QWORD *)v81 + 4) = *((_QWORD *)v80 + 4);
            *v30 = v35;
            v30[1] = v36;
          }
          v80 = v34;
          v31 = (unint64_t)v24;
        }
        else
        {
          v31 = (unint64_t)(v24 + 40);
          if (v81 >= v24 && (unint64_t)v81 < v31 && v81 == v24)
          {
            v30 = v24;
          }
          else
          {
            v32 = *(_OWORD *)v24;
            v33 = *((_OWORD *)v24 + 1);
            *((_QWORD *)v81 + 4) = *((_QWORD *)v24 + 4);
            *v30 = v32;
            v30[1] = v33;
          }
        }
        v81 = (char *)v30 + 40;
        a4 = v80;
        if ((unint64_t)v80 >= v66)
          break;
        a2 = (char *)v31;
      }
      while (v31 < v67);
    }
LABEL_42:
    sub_100029B40((void **)&v81, (const void **)&v80, &v79);
    return 1;
  }
LABEL_43:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
  __break(1u);
  return result;
}

char *sub_1000299A0(char *result, int64_t a2, char a3, char *a4)
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
    v10 = sub_10000E354(&qword_10003E030);
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

char *sub_100029A98(void **a1, const void **a2, _QWORD *a3)
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

char *sub_100029B40(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  char *result;
  uint64_t v6;
  char v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  if (v4 <= -40)
  {
    v7 = 2;
    result = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v7, 1046, 0);
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v6 = v4 / 40;
    if (result != v3 || result >= &v3[40 * v6])
      return (char *)memmove(result, v3, 40 * v6);
  }
  return result;
}

char *sub_100029BF8(uint64_t a1)
{
  return sub_1000299A0(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

_QWORD *sub_100029C0C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v5;
  _QWORD *v6;
  size_t v7;

  if (a2 <= a1)
    v3 = a1;
  else
    v3 = a2;
  if (!v3)
    return _swiftEmptyArrayStorage;
  v5 = sub_10000E354(a3);
  v6 = (_QWORD *)swift_allocObject(v5, 40 * v3 + 32, 7);
  v7 = j__malloc_size(v6);
  v6[2] = a1;
  v6[3] = 2 * ((uint64_t)(v7 - 32) / 40);
  return v6;
}

uint64_t sub_100029C88(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t sub_100029C9C@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  int64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  int64_t v30;
  unint64_t v31;
  int64_t v32;
  uint64_t v33;
  int64_t v34;
  void (*v35)(uint64_t);
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  int64_t v46;

  v3 = sub_10000E354(&qword_10003DFF8);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_10000E354(&qword_10003E008);
  v8 = __chkstk_darwin(v7);
  v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v41 - v11;
  v13 = *v1;
  v14 = v1[1];
  v16 = v1[2];
  v15 = v1[3];
  v17 = v15;
  v18 = v1[4];
  v41 = v6;
  if (v18)
  {
    v45 = a1;
    v46 = v15;
    v42 = v16;
    v43 = v14;
    v44 = v10;
    v19 = v4;
    v20 = (v18 - 1) & v18;
    v21 = __clz(__rbit64(v18)) | (v15 << 6);
LABEL_3:
    v22 = *(_QWORD *)(v13 + 56);
    v23 = (uint64_t *)(*(_QWORD *)(v13 + 48) + 16 * v21);
    v24 = v13;
    v26 = *v23;
    v25 = v23[1];
    v27 = type metadata accessor for SimpleType(0);
    (*(void (**)(char *, unint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(&v12[*(int *)(v3 + 48)], v22 + *(_QWORD *)(*(_QWORD *)(v27 - 8) + 72) * v21, v27);
    *(_QWORD *)v12 = v26;
    *((_QWORD *)v12 + 1) = v25;
    v4 = v19;
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v12, 0, 1, v3);
    v28 = v25;
    v13 = v24;
    swift_bridgeObjectRetain(v28);
    v10 = v44;
    a1 = v45;
    v16 = v42;
    v14 = v43;
    goto LABEL_25;
  }
  v29 = v15 + 1;
  if (__OFADD__(v15, 1))
  {
    __break(1u);
LABEL_23:
    v17 = v11;
    goto LABEL_24;
  }
  v30 = (unint64_t)(v16 + 64) >> 6;
  if (v29 < v30)
  {
    v31 = *(_QWORD *)(v14 + 8 * v29);
    if (v31)
    {
LABEL_7:
      v42 = v16;
      v43 = v14;
      v44 = v10;
      v45 = a1;
      v19 = v4;
      v20 = (v31 - 1) & v31;
      v21 = __clz(__rbit64(v31)) + (v29 << 6);
      v46 = v29;
      goto LABEL_3;
    }
    v32 = v15 + 2;
    v17 = v15 + 1;
    if (v15 + 2 < v30)
    {
      v31 = *(_QWORD *)(v14 + 8 * v32);
      if (v31)
      {
LABEL_10:
        v29 = v32;
        goto LABEL_7;
      }
      v17 = v15 + 2;
      if (v15 + 3 < v30)
      {
        v31 = *(_QWORD *)(v14 + 8 * (v15 + 3));
        if (v31)
        {
          v29 = v15 + 3;
          goto LABEL_7;
        }
        v32 = v15 + 4;
        v17 = v15 + 3;
        if (v15 + 4 < v30)
        {
          v31 = *(_QWORD *)(v14 + 8 * v32);
          if (v31)
            goto LABEL_10;
          v29 = v15 + 5;
          v17 = v15 + 4;
          if (v15 + 5 < v30)
          {
            v31 = *(_QWORD *)(v14 + 8 * v29);
            if (v31)
              goto LABEL_7;
            v11 = v30 - 1;
            v33 = v15 + 6;
            while (v30 != v33)
            {
              v31 = *(_QWORD *)(v14 + 8 * v33++);
              if (v31)
              {
                v29 = v33 - 1;
                goto LABEL_7;
              }
            }
            goto LABEL_23;
          }
        }
      }
    }
  }
LABEL_24:
  v46 = v17;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v12, 1, 1, v3);
  v20 = 0;
LABEL_25:
  *v1 = v13;
  v1[1] = v14;
  v34 = v46;
  v1[2] = v16;
  v1[3] = v34;
  v1[4] = v20;
  v35 = (void (*)(uint64_t))v1[5];
  sub_100006B40((uint64_t)v12, (uint64_t)v10, &qword_10003E008);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v10, 1, v3) == 1)
  {
    v36 = sub_10000E354(&qword_10003D678);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(a1, 1, 1, v36);
  }
  else
  {
    v38 = (uint64_t)v10;
    v39 = (uint64_t)v41;
    sub_100006B40(v38, (uint64_t)v41, &qword_10003DFF8);
    v35(v39);
    sub_100006B04(v39, &qword_10003DFF8);
    v40 = sub_10000E354(&qword_10003D678);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(a1, 0, 1, v40);
  }
}

char *sub_100029FE4(uint64_t a1)
{
  return sub_100008F44(0, *(_QWORD *)(a1 + 16), 0, (char *)a1, &qword_10003DFD8, &qword_10003DDF0);
}

uint64_t sub_10002A018(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
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

char *sub_10002A108(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
  else
  {
    if (v4 < 0)
    {
      result = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
      goto LABEL_9;
    }
    v5 = (char *)(a4 + 16 * a1 + 32);
    v6 = 16 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_10002A1F0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v6;
  unint64_t v7;
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
    v6 = a4 + 16 * a1 + 32;
    v7 = a3 + 16 * v4;
    if (v6 >= v7 || v6 + 16 * v4 <= a3)
    {
      sub_10000E354(&qword_10003DDE0);
      swift_arrayInitWithCopy(a3);
      return v7;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_10002A2F8(_QWORD *a1)
{
  void **v2;
  int v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD aBlock[5];
  uint64_t v24;
  char v25[24];

  v2 = (void **)a1[2];
  v3 = *((_DWORD *)a1 + 12);
  v4 = a1[4];
  v5 = a1[5];
  v6 = a1[7];
  v7 = *((unsigned __int8 *)a1 + 24);
  v8 = swift_allocObject(*a1, *(unsigned int *)(*a1 + 48), *(unsigned __int16 *)(*a1 + 52));
  swift_bridgeObjectRetain(v5);
  swift_retain(v6);
  sub_1000098F0(v2, v3, v4, v5, v6, v7);
  swift_beginAccess(a1 + 9, v25, 0, 0);
  v9 = a1[9];
  v10 = *(NSObject **)(v8 + OBJC_IVAR____TtC15audioanalyticsd7Session_workQueue);
  v11 = swift_allocObject(&unk_10003A300, 32, 7);
  *(_QWORD *)(v11 + 16) = v8;
  *(_QWORD *)(v11 + 24) = v9;
  v12 = swift_allocObject(&unk_10003A328, 32, 7);
  *(_QWORD *)(v12 + 16) = sub_100005DBC;
  *(_QWORD *)(v12 + 24) = v11;
  aBlock[4] = sub_1000133A4;
  v24 = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100005D54;
  aBlock[3] = &unk_10003A340;
  v13 = _Block_copy(aBlock);
  v14 = v24;
  swift_retain_n(v8, 2);
  swift_bridgeObjectRetain_n(v9, 2);
  swift_retain(v12);
  swift_release(v14);
  dispatch_sync(v10, v13);
  _Block_release(v13);
  LOBYTE(v10) = swift_isEscapingClosureAtFileLocation(v12, "", 111, 100, 24, 1);
  swift_bridgeObjectRelease(v9);
  swift_release(v11);
  result = swift_release(v12);
  if ((v10 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v16 = a1[10];
    if (v16)
    {
      swift_retain(v8);
      swift_bridgeObjectRetain(v16);
      v18 = sub_10000CD18(v17, v8);
      swift_release(v8);
      if (*(_QWORD *)(v18 + 16))
      {
        v19 = *(_QWORD *)(v8 + 80);
        if (v19)
        {
          swift_bridgeObjectRetain(*(_QWORD *)(v8 + 80));
          v20 = sub_10000EBE4(v18, v19);
          v21 = *(_QWORD *)(v8 + 80);
          *(_QWORD *)(v8 + 80) = v20;
          swift_release(v8);
          swift_release(a1);
          v22 = v21;
        }
        else
        {
          *(_QWORD *)(v8 + 80) = v18;
          swift_release(v8);
          swift_release(a1);
          v22 = 0;
        }
        swift_bridgeObjectRelease(v22);
      }
      else
      {
        swift_release(v8);
        swift_release(a1);
        swift_release(v18);
      }
      swift_bridgeObjectRelease(v16);
    }
    else
    {
      swift_release(v8);
      swift_release(a1);
    }
    return v8;
  }
  return result;
}

_QWORD *sub_10002A580(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  _QWORD *result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, unint64_t, uint64_t);
  uint64_t v24;
  char v25;
  void (*v26)(char *, uint64_t);
  _QWORD *v27;
  unint64_t v28;
  unint64_t v29;
  _QWORD v30[2];
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  __int128 v37[2];
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;

  v5 = type metadata accessor for Config.WorkerConfigs(0);
  v35 = *(_QWORD **)(v5 - 8);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)v30 - v9;
  result = _swiftEmptyArrayStorage;
  v41 = _swiftEmptyArrayStorage;
  v32 = *(_QWORD *)(a1 + 16);
  if (v32)
  {
    v12 = 0;
    v30[1] = v2;
    v31 = a1 + 32;
    v36 = a2;
    v34 = a2 + 56;
    do
    {
      v33 = v12;
      sub_10000CCD4(v31 + 40 * v12, (uint64_t)&v38);
      v14 = v39;
      v13 = v40;
      sub_10000CCB0(&v38, v39);
      dispatch thunk of WorkerProtocol.workerConfig.getter(v14, v13);
      if (*(_QWORD *)(v36 + 16)
        && (v15 = *(_QWORD *)(v36 + 40),
            v16 = sub_100006818(&qword_10003DA90, (uint64_t (*)(uint64_t))&type metadata accessor for Config.WorkerConfigs, (uint64_t)&protocol conformance descriptor for Config.WorkerConfigs), v17 = dispatch thunk of Hashable._rawHashValue(seed:)(v15, v5, v16), v18 = v36, v19 = -1 << *(_BYTE *)(v36 + 32), v20 = v17 & ~v19, ((*(_QWORD *)(v34 + ((v20 >> 3) & 0xFFFFFFFFFFFFF8)) >> v20) & 1) != 0))
      {
        v21 = ~v19;
        v22 = v35[9];
        v23 = (void (*)(char *, unint64_t, uint64_t))v35[2];
        while (1)
        {
          v23(v8, *(_QWORD *)(v18 + 48) + v22 * v20, v5);
          v24 = sub_100006818(&qword_10003DA98, (uint64_t (*)(uint64_t))&type metadata accessor for Config.WorkerConfigs, (uint64_t)&protocol conformance descriptor for Config.WorkerConfigs);
          v25 = dispatch thunk of static Equatable.== infix(_:_:)(v8, v10, v5, v24);
          v26 = (void (*)(char *, uint64_t))v35[1];
          v26(v8, v5);
          if ((v25 & 1) != 0)
            break;
          v20 = (v20 + 1) & v21;
          v18 = v36;
          if (((*(_QWORD *)(v34 + ((v20 >> 3) & 0xFFFFFFFFFFFFF8)) >> v20) & 1) == 0)
            goto LABEL_3;
        }
        v26(v10, v5);
        sub_10000BF74(&v38, (uint64_t)v37);
        v27 = v41;
        if ((swift_isUniquelyReferenced_nonNull_native(v41) & 1) == 0)
        {
          sub_100028B94(0, v27[2] + 1, 1);
          v27 = v41;
        }
        v29 = v27[2];
        v28 = v27[3];
        if (v29 >= v28 >> 1)
        {
          sub_100028B94(v28 > 1, v29 + 1, 1);
          v27 = v41;
        }
        v27[2] = v29 + 1;
        sub_10000BF74(v37, (uint64_t)&v27[5 * v29 + 4]);
      }
      else
      {
LABEL_3:
        ((void (*)(char *, uint64_t))v35[1])(v10, v5);
        sub_10000CC90(&v38);
      }
      v12 = v33 + 1;
    }
    while (v33 + 1 != v32);
    return v41;
  }
  return result;
}

uint64_t sub_10002A864(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    goto LABEL_9;
  }
  if (v4 < 0)
  {
LABEL_9:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v8 = *(_QWORD *)(type metadata accessor for Message(0) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = *(_QWORD *)(v8 + 72);
  v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
  v12 = v10 * v4;
  v13 = a3 + v12;
  v14 = v11 + v12;
  if (v11 >= v13 || v14 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v13;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10002A97C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 46, 7);
}

uint64_t sub_10002A9A8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  unsigned int v3;
  unsigned __int16 v4;
  uint64_t v5;

  v1 = *(_QWORD **)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_DWORD *)(v0 + 40);
  v4 = *(_WORD *)(v0 + 44);
  v5 = sub_100026BD4();
  sub_100022C04(v1, v2, v3, v4);
  return swift_release(v5);
}

uint64_t sub_10002AA04()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002AA28()
{
  uint64_t v0;

  return sub_100027540(v0);
}

uint64_t sub_10002AA34()
{
  return sub_1000262F4(0);
}

uint64_t sub_10002AA3C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002AA50()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002AA64()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002AA90()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002AAA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FeatureInfo(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002AB14(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  _QWORD *v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  int64_t v19;
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
  _QWORD *v32;
  char *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  _QWORD v46[2];
  uint64_t v47;
  int64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;

  v58 = sub_10000E354(&qword_10003E288);
  v3 = __chkstk_darwin(v58);
  v57 = (uint64_t)v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __chkstk_darwin(v3);
  v56 = (uint64_t)v46 - v6;
  __chkstk_darwin(v5);
  v55 = (char *)v46 - v7;
  v8 = sub_10000E354(&qword_10003D678);
  v53 = *(_QWORD *)(v8 - 8);
  v54 = v8;
  __chkstk_darwin(v8);
  v10 = (char *)v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(a1 + 16);
  v12 = _swiftEmptyArrayStorage;
  if (!v11)
    return (uint64_t)v12;
  v46[1] = v1;
  v61 = _swiftEmptyArrayStorage;
  sub_10000F4FC(0, v11, 0);
  result = sub_10000F930(a1);
  v15 = result;
  v16 = 0;
  v17 = a1 + 64;
  v47 = a1 + 80;
  v48 = v11;
  v51 = v10;
  v52 = a1;
  v49 = v14;
  v50 = a1 + 64;
  while ((v15 & 0x8000000000000000) == 0 && v15 < 1 << *(_BYTE *)(a1 + 32))
  {
    v20 = (unint64_t)v15 >> 6;
    if ((*(_QWORD *)(v17 + 8 * ((unint64_t)v15 >> 6)) & (1 << v15)) == 0)
      goto LABEL_25;
    if (*(_DWORD *)(a1 + 36) != (_DWORD)v14)
      goto LABEL_26;
    v59 = v16;
    v60 = 1 << v15;
    v21 = v58;
    v22 = (uint64_t)v55;
    v23 = (uint64_t)&v55[*(int *)(v58 + 48)];
    v24 = *(_QWORD *)(a1 + 48);
    v25 = type metadata accessor for FeatureInfo(0);
    sub_100006978(v24 + *(_QWORD *)(*(_QWORD *)(v25 - 8) + 72) * v15, v22, type metadata accessor for FeatureInfo);
    v26 = *(_QWORD *)(a1 + 56);
    v27 = type metadata accessor for FeatureState(0);
    sub_100006978(v26 + *(_QWORD *)(*(_QWORD *)(v27 - 8) + 72) * v15, v23, type metadata accessor for FeatureState);
    v28 = v56;
    sub_100006978(v22, v56, type metadata accessor for FeatureInfo);
    sub_100006978(v23, v28 + *(int *)(v21 + 48), type metadata accessor for FeatureState);
    v29 = v28;
    v30 = v57;
    sub_100006B40(v29, v57, &qword_10003E288);
    sub_100006B04(v22, &qword_10003E288);
    v31 = *(int *)(v21 + 48);
    v32 = v51;
    v33 = (char *)v51 + *(int *)(v54 + 48);
    v34 = (uint64_t *)(v30 + *(int *)(v25 + 20));
    v36 = *v34;
    v35 = v34[1];
    v37 = v30 + v31 + *(int *)(v27 + 20);
    v38 = type metadata accessor for SimpleType(0);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 16))(v33, v37, v38);
    *v32 = v36;
    v32[1] = v35;
    swift_bridgeObjectRetain(v35);
    sub_100006B04(v30, &qword_10003E288);
    v12 = v61;
    if ((swift_isUniquelyReferenced_nonNull_native(v61) & 1) == 0)
    {
      sub_10000F4FC(0, v12[2] + 1, 1);
      v12 = v61;
    }
    v40 = v12[2];
    v39 = v12[3];
    a1 = v52;
    if (v40 >= v39 >> 1)
    {
      sub_10000F4FC(v39 > 1, v40 + 1, 1);
      v12 = v61;
    }
    v12[2] = v40 + 1;
    result = sub_100006B40((uint64_t)v32, (uint64_t)v12+ ((*(unsigned __int8 *)(v53 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80))+ *(_QWORD *)(v53 + 72) * v40, &qword_10003D678);
    v18 = 1 << *(_BYTE *)(a1 + 32);
    if (v15 >= v18)
      goto LABEL_27;
    v17 = v50;
    v41 = *(_QWORD *)(v50 + 8 * v20);
    if ((v41 & v60) == 0)
      goto LABEL_28;
    LODWORD(v14) = v49;
    if (*(_DWORD *)(a1 + 36) != (_DWORD)v49)
      goto LABEL_29;
    v42 = v41 & (-2 << (v15 & 0x3F));
    if (v42)
    {
      v18 = __clz(__rbit64(v42)) | v15 & 0xFFFFFFFFFFFFFFC0;
      v19 = v48;
    }
    else
    {
      v43 = v20 + 1;
      v44 = (unint64_t)(v18 + 63) >> 6;
      v19 = v48;
      if (v20 + 1 < v44)
      {
        v45 = *(_QWORD *)(v50 + 8 * v43);
        if (v45)
        {
LABEL_22:
          v18 = __clz(__rbit64(v45)) + (v43 << 6);
        }
        else
        {
          while (v44 - 2 != v20)
          {
            v45 = *(_QWORD *)(v47 + 8 * v20++);
            if (v45)
            {
              v43 = v20 + 1;
              goto LABEL_22;
            }
          }
        }
      }
    }
    v16 = v59 + 1;
    v15 = v18;
    if (v59 + 1 == v19)
      return (uint64_t)v12;
  }
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

uint64_t *SystemMonitor.shared.unsafeMutableAddressor()
{
  return &static SystemMonitor.shared;
}

uint64_t SystemMonitor.currentMessageContents.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 16);
  swift_retain(v1);
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 24));
  sub_1000035FC((_QWORD *)(v1 + 16), &v4);
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 24));
  v2 = v4;
  swift_release(v1);
  return v2;
}

uint64_t static SystemMonitor.shared.getter()
{
  _BYTE v1[24];

  swift_beginAccess(&static SystemMonitor.shared, v1, 0, 0);
  return swift_retain(static SystemMonitor.shared);
}

uint64_t sub_10002B008(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;

  v2 = v1;
  v3 = Logger.logObject.getter(a1);
  v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "SystemMonitor.shutdown()", v5, 2u);
    swift_slowDealloc(v5, -1, -1);
  }

  v6 = *(_QWORD *)(v2 + 16);
  swift_retain(v6);
  os_unfair_lock_lock((os_unfair_lock_t)(v6 + 24));
  sub_10002D120((_QWORD *)(v6 + 16), v2);
  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 24));
  return swift_release(v6);
}

uint64_t sub_10002B0E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
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
  _BYTE *v24;
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
  _BYTE *v46;
  uint64_t v47;
  _BYTE *v48;
  uint64_t Strong;
  uint64_t v50;
  uint64_t v51;
  __n128 v52;
  uint64_t v53;
  unsigned int *v54;
  uint64_t v55;
  uint64_t v56;
  unsigned int (*v57)(_BYTE *, uint64_t, uint64_t);
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  os_log_type_t v61;
  uint8_t *v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v68;
  NSObject *v69;
  os_log_type_t v70;
  uint8_t *v71;
  uint64_t v72;
  NSObject *v73;
  os_log_type_t v74;
  uint8_t *v75;
  _BYTE *v76;
  _BYTE *v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  _BYTE *v82;
  uint64_t v83;
  uint64_t KeyPath;
  _BYTE *v85;
  _BYTE *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t (*v90)(uint64_t);
  _BYTE *v91;
  uint64_t *v92;
  uint64_t v93;
  _BYTE *v94;
  _BYTE *v95;
  char v96;
  _BYTE *v97;
  _BYTE *v98;
  uint64_t v99;
  uint64_t v100;
  _BYTE *v101;
  _BYTE *v102;
  uint64_t v103;
  NSObject *v104;
  os_log_type_t v105;
  uint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  _BYTE *v111;
  _BYTE *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  unint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  _BYTE *v121;
  uint64_t v122;
  _BYTE *v123;
  uint64_t v124;
  _BYTE *v125;
  _BYTE *v126;
  uint64_t v127;
  NSObject *v128;
  os_log_type_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t *v132;
  uint64_t v133;
  unint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  unint64_t v139;
  unint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  _BYTE *v145;
  uint64_t v146;
  uint64_t v147;
  _BYTE v148[4];
  int v149;
  uint64_t v150;
  _BYTE *v151;
  _BYTE *v152;
  _BYTE *v153;
  _BYTE *v154;
  _BYTE *v155;
  _BYTE *v156;
  _BYTE *v157;
  _BYTE *v158;
  _BYTE *v159;
  _BYTE *v160;
  uint64_t v161;
  uint64_t v162;
  _BYTE *v163;
  uint64_t v164;
  _BYTE *v165;
  uint64_t v166;
  _BYTE *v167;
  _BYTE *v168;
  _BYTE *v169;
  char *v170;
  _BYTE *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  char v176[24];
  char v177[12];
  char v178[8];

  v170 = a5;
  v172 = a4;
  v173 = a3;
  v6 = sub_10000E354(&qword_10003D6F0);
  __chkstk_darwin(v6);
  v159 = &v148[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v162 = type metadata accessor for Message(0);
  v161 = *(_QWORD *)(v162 - 8);
  __chkstk_darwin(v162);
  v160 = &v148[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v164 = sub_10000E354(&qword_10003E290);
  __chkstk_darwin(v164);
  v165 = &v148[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v166 = type metadata accessor for FeatureInfo(0);
  v10 = *(_QWORD *)(*(_QWORD *)(v166 - 8) + 64);
  v11 = __chkstk_darwin(v166);
  v169 = &v148[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v11);
  v13 = &v148[-v12];
  v14 = sub_10000E354((uint64_t *)&unk_10003DC10);
  v15 = __chkstk_darwin(v14);
  v157 = &v148[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = __chkstk_darwin(v15);
  v156 = &v148[-v18];
  v19 = __chkstk_darwin(v17);
  v167 = &v148[-v20];
  v21 = __chkstk_darwin(v19);
  v168 = &v148[-v22];
  __chkstk_darwin(v21);
  v24 = &v148[-v23];
  v25 = type metadata accessor for FeatureState(0);
  v26 = *(_QWORD *)(v25 - 8);
  v27 = __chkstk_darwin(v25);
  v155 = &v148[-((v28 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v29 = __chkstk_darwin(v27);
  v154 = &v148[-v30];
  v31 = __chkstk_darwin(v29);
  v158 = &v148[-v32];
  v33 = __chkstk_darwin(v31);
  v163 = &v148[-v34];
  v35 = __chkstk_darwin(v33);
  v151 = &v148[-v36];
  v37 = __chkstk_darwin(v35);
  v152 = &v148[-v38];
  v39 = __chkstk_darwin(v37);
  v153 = &v148[-v40];
  __chkstk_darwin(v39);
  v171 = &v148[-v41];
  v42 = type metadata accessor for Logger(0);
  v43 = *(_QWORD *)(v42 - 8);
  v44 = __chkstk_darwin(v42);
  v46 = &v148[-((v45 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v44);
  v48 = &v148[-v47];
  a2 += 16;
  swift_beginAccess(a2, v178, 0, 0);
  Strong = swift_weakLoadStrong(a2);
  if (Strong)
  {
    v50 = Strong;
    v51 = v173 + 16;
    v52 = swift_beginAccess(v173 + 16, v177, 0, 0);
    v53 = swift_unknownObjectWeakLoadStrong(v51, v52);
    if (v53)
    {
      v173 = v53;
      v54 = (unsigned int *)(v170 + 16);
      swift_beginAccess(v170 + 16, v176, 0, 0);
      v55 = *v54;
      LOBYTE(v175) = 0;
      v56 = v172;
      sub_10002C1A4(v172, v55, (uint64_t)v24);
      v57 = *(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v26 + 48);
      v58 = v25;
      if (v57(v24, 1, v25) == 1)
      {
        sub_100006B04((uint64_t)v24, (uint64_t *)&unk_10003DC10);
        v59 = sub_100006978(v56, (uint64_t)v13, type metadata accessor for FeatureInfo);
        v60 = Logger.logObject.getter(v59);
        v61 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v60, v61))
        {
          v62 = (uint8_t *)swift_slowAlloc(12, -1);
          v63 = swift_slowAlloc(32, -1);
          *(_DWORD *)v62 = 136380675;
          v175 = v63;
          v64 = (uint64_t *)&v13[*(int *)(v166 + 28)];
          v65 = *v64;
          v66 = v64[1];
          swift_bridgeObjectRetain(v66);
          v174 = sub_10000A7E4(v65, v66, &v175);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v174, &v175, v62 + 4, v62 + 12);
          swift_bridgeObjectRelease(v66);
          sub_10002F7D8((uint64_t)v13, type metadata accessor for FeatureInfo);
          _os_log_impl((void *)&_mh_execute_header, v60, v61, "No value found, even though we received a notification! { notification=%{private}s }", v62, 0xCu);
          swift_arrayDestroy(v63, 1, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v63, -1, -1);
          swift_slowDealloc(v62, -1, -1);
          swift_release(v50);

          return swift_unknownObjectRelease(v173);
        }
        swift_release(v50);

        swift_unknownObjectRelease(v173);
        v90 = type metadata accessor for FeatureInfo;
        goto LABEL_32;
      }
      v76 = v171;
      sub_10001059C((uint64_t)v24, (uint64_t)v171, type metadata accessor for FeatureState);
      v77 = v168;
      sub_100006978((uint64_t)v76, (uint64_t)v168, type metadata accessor for FeatureState);
      v78 = v56;
      v79 = *(char **)(v26 + 56);
      ((void (*)(_BYTE *, _QWORD, uint64_t, uint64_t))v79)(v77, 0, 1, v58);
      v150 = v50;
      v80 = *(_QWORD *)(v50 + 16);
      v81 = v78;
      v82 = v169;
      v83 = sub_100006978(v81, (uint64_t)v169, type metadata accessor for FeatureInfo);
      __chkstk_darwin(v83);
      sub_10001059C((uint64_t)v82, (uint64_t)&v148[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)], type metadata accessor for FeatureInfo);
      KeyPath = swift_getKeyPath(&unk_100032190, &v148[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)]);
      swift_retain(v80);
      v85 = v167;
      OSAllocatedUnfairLock.load<A>(_:)(KeyPath, v80);
      swift_release(KeyPath);
      swift_release(v80);
      v86 = v165;
      v87 = (uint64_t)&v165[*(int *)(v164 + 48)];
      sub_1000047AC((uint64_t)v77, (uint64_t)v165, (uint64_t *)&unk_10003DC10);
      sub_1000047AC((uint64_t)v85, v87, (uint64_t *)&unk_10003DC10);
      v88 = v58;
      if (v57(v86, 1, v58) == 1)
      {
        sub_100006B04((uint64_t)v85, (uint64_t *)&unk_10003DC10);
        sub_100006B04((uint64_t)v77, (uint64_t *)&unk_10003DC10);
        if (v57((_BYTE *)v87, 1, v58) == 1)
        {
          sub_100006B04((uint64_t)v86, (uint64_t *)&unk_10003DC10);
          v89 = v150;
          v13 = v171;
LABEL_21:
          v101 = v154;
          sub_100006978((uint64_t)v13, (uint64_t)v154, type metadata accessor for FeatureState);
          v102 = v155;
          v103 = sub_100006978((uint64_t)v13, (uint64_t)v155, type metadata accessor for FeatureState);
          v104 = Logger.logObject.getter(v103);
          v105 = static os_log_type_t.debug.getter();
          if (os_log_type_enabled(v104, v105))
          {
            v106 = swift_slowAlloc(22, -1);
            v172 = swift_slowAlloc(64, -1);
            v175 = v172;
            *(_DWORD *)v106 = 136380931;
            v107 = (uint64_t *)&v101[*(int *)(v166 + 20)];
            v108 = (uint64_t)v101;
            v109 = *v107;
            v110 = v107[1];
            swift_bridgeObjectRetain(v110);
            v174 = sub_10000A7E4(v109, v110, &v175);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v174, &v175, v106 + 4, v106 + 12);
            swift_bridgeObjectRelease(v110);
            sub_10002F7D8(v108, type metadata accessor for FeatureState);
            *(_WORD *)(v106 + 12) = 2081;
            v111 = v155;
            v112 = v13;
            v113 = type metadata accessor for SimpleType(0);
            v114 = sub_100006818(&qword_10003E298, (uint64_t (*)(uint64_t))&type metadata accessor for SimpleType, (uint64_t)&protocol conformance descriptor for SimpleType);
            v115 = dispatch thunk of CustomStringConvertible.description.getter(v113, v114);
            v117 = v116;
            v174 = sub_10000A7E4(v115, v116, &v175);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v174, &v175, v106 + 14, v106 + 22);
            swift_bridgeObjectRelease(v117);
            sub_10002F7D8((uint64_t)v111, type metadata accessor for FeatureState);
            _os_log_impl((void *)&_mh_execute_header, v104, v105, "Value did not change. { feature=%{private}s, value=%{private}s }", (uint8_t *)v106, 0x16u);
            v118 = v172;
            swift_arrayDestroy(v172, 2, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v118, -1, -1);
            swift_slowDealloc(v106, -1, -1);
            swift_unknownObjectRelease(v173);
            swift_release(v150);

            v119 = (uint64_t)v112;
          }
          else
          {
            swift_unknownObjectRelease(v173);
            sub_10002F7D8((uint64_t)v101, type metadata accessor for FeatureState);
            sub_10002F7D8((uint64_t)v102, type metadata accessor for FeatureState);
            swift_release(v89);

            v119 = (uint64_t)v13;
          }
          v90 = type metadata accessor for FeatureState;
          return sub_10002F7D8(v119, v90);
        }
        v92 = &qword_10003E290;
        v89 = v150;
        v93 = (uint64_t)v163;
        v13 = v171;
      }
      else
      {
        v91 = v156;
        sub_1000047AC((uint64_t)v86, (uint64_t)v156, (uint64_t *)&unk_10003DC10);
        if (v57((_BYTE *)v87, 1, v88) == 1)
        {
          v92 = &qword_10003E290;
          v93 = (uint64_t)v163;
          v94 = v168;
          v13 = v171;
        }
        else
        {
          v164 = v88;
          v170 = v79;
          v95 = v153;
          sub_10001059C(v87, (uint64_t)v153, type metadata accessor for FeatureState);
          v96 = sub_10002F514((uint64_t)v91, (uint64_t)v95);
          v97 = v152;
          sub_100006978((uint64_t)v91, (uint64_t)v152, type metadata accessor for FeatureState);
          v98 = v151;
          sub_100006978((uint64_t)v95, (uint64_t)v151, type metadata accessor for FeatureState);
          v93 = (uint64_t)v163;
          v13 = v171;
          if ((v96 & 1) != 0)
          {
            v99 = v164;
            v149 = static SimpleType.== infix(_:_:)(&v97[*(int *)(v164 + 20)], &v98[*(int *)(v164 + 20)]);
            v100 = (uint64_t)v98;
            v88 = v99;
            sub_10002F7D8(v100, type metadata accessor for FeatureState);
            sub_10002F7D8((uint64_t)v97, type metadata accessor for FeatureState);
            sub_10002F7D8((uint64_t)v95, type metadata accessor for FeatureState);
            sub_100006B04((uint64_t)v167, (uint64_t *)&unk_10003DC10);
            sub_100006B04((uint64_t)v168, (uint64_t *)&unk_10003DC10);
            sub_10002F7D8((uint64_t)v91, type metadata accessor for FeatureState);
            sub_100006B04((uint64_t)v86, (uint64_t *)&unk_10003DC10);
            v89 = v150;
            v79 = v170;
            if ((v149 & 1) != 0)
              goto LABEL_21;
LABEL_28:
            v120 = *(_QWORD *)(v89 + 16);
            v121 = v169;
            v122 = sub_100006978(v172, (uint64_t)v169, type metadata accessor for FeatureInfo);
            __chkstk_darwin(v122);
            v123 = &v148[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
            sub_10001059C((uint64_t)v121, (uint64_t)v123, type metadata accessor for FeatureInfo);
            v124 = swift_getKeyPath(&unk_100032190, v123);
            v125 = v157;
            sub_100006978((uint64_t)v13, (uint64_t)v157, type metadata accessor for FeatureState);
            ((void (*)(_BYTE *, _QWORD, uint64_t, uint64_t))v79)(v125, 0, 1, v88);
            swift_retain(v120);
            OSAllocatedUnfairLock.assign<A>(_:newValue:)(v124, v125, v120);
            swift_release(v120);
            swift_release(v124);
            sub_100006B04((uint64_t)v125, (uint64_t *)&unk_10003DC10);
            sub_100006978((uint64_t)v13, v93, type metadata accessor for FeatureState);
            v126 = v158;
            v127 = sub_100006978((uint64_t)v13, (uint64_t)v158, type metadata accessor for FeatureState);
            v128 = Logger.logObject.getter(v127);
            v129 = static os_log_type_t.debug.getter();
            if (os_log_type_enabled(v128, v129))
            {
              v130 = swift_slowAlloc(22, -1);
              v131 = swift_slowAlloc(64, -1);
              v175 = v131;
              *(_DWORD *)v130 = 136380931;
              v132 = (uint64_t *)(v93 + *(int *)(v166 + 20));
              v133 = *v132;
              v134 = v132[1];
              swift_bridgeObjectRetain(v134);
              v174 = sub_10000A7E4(v133, v134, &v175);
              UnsafeMutableRawBufferPointer.copyMemory(from:)(&v174, &v175, v130 + 4, v130 + 12);
              swift_bridgeObjectRelease(v134);
              sub_10002F7D8(v93, type metadata accessor for FeatureState);
              *(_WORD *)(v130 + 12) = 2081;
              v135 = type metadata accessor for SimpleType(0);
              v136 = sub_100006818(&qword_10003E298, (uint64_t (*)(uint64_t))&type metadata accessor for SimpleType, (uint64_t)&protocol conformance descriptor for SimpleType);
              v137 = v135;
              v13 = v171;
              v138 = dispatch thunk of CustomStringConvertible.description.getter(v137, v136);
              v140 = v139;
              v174 = sub_10000A7E4(v138, v139, &v175);
              UnsafeMutableRawBufferPointer.copyMemory(from:)(&v174, &v175, v130 + 14, v130 + 22);
              swift_bridgeObjectRelease(v140);
              sub_10002F7D8((uint64_t)v126, type metadata accessor for FeatureState);
              _os_log_impl((void *)&_mh_execute_header, v128, v129, "Broadcasting new value. { feature=%{private}s, value=%{private}s }", (uint8_t *)v130, 0x16u);
              swift_arrayDestroy(v131, 2, (char *)&type metadata for Any + 8);
              v141 = v131;
              v89 = v150;
              swift_slowDealloc(v141, -1, -1);
              swift_slowDealloc(v130, -1, -1);

            }
            else
            {

              sub_10002F7D8(v93, type metadata accessor for FeatureState);
              sub_10002F7D8((uint64_t)v126, type metadata accessor for FeatureState);
            }
            v142 = *(_QWORD *)(v89 + 16);
            swift_retain(v142);
            os_unfair_lock_lock((os_unfair_lock_t)(v142 + 24));
            sub_1000035FC((_QWORD *)(v142 + 16), &v175);
            os_unfair_lock_unlock((os_unfair_lock_t)(v142 + 24));
            v143 = v175;
            swift_release(v142);
            v144 = type metadata accessor for Message.Metadata(0);
            v145 = v159;
            (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v144 - 8) + 56))(v159, 1, 1, v144);
            v146 = (uint64_t)v160;
            Message.init(category:type:content:metadata:)(8, 5, v143, v145);
            v147 = v173;
            sub_10001AFBC(v146);
            swift_release(v89);
            swift_unknownObjectRelease(v147);
            (*(void (**)(uint64_t, uint64_t))(v161 + 8))(v146, v162);
            v90 = type metadata accessor for FeatureState;
LABEL_32:
            v119 = (uint64_t)v13;
            return sub_10002F7D8(v119, v90);
          }
          sub_10002F7D8((uint64_t)v98, type metadata accessor for FeatureState);
          sub_10002F7D8((uint64_t)v97, type metadata accessor for FeatureState);
          sub_10002F7D8((uint64_t)v95, type metadata accessor for FeatureState);
          v92 = (uint64_t *)&unk_10003DC10;
          v94 = v168;
          v79 = v170;
          v88 = v164;
        }
        sub_100006B04((uint64_t)v167, (uint64_t *)&unk_10003DC10);
        sub_100006B04((uint64_t)v94, (uint64_t *)&unk_10003DC10);
        sub_10002F7D8((uint64_t)v91, type metadata accessor for FeatureState);
        v89 = v150;
      }
      sub_100006B04((uint64_t)v86, v92);
      goto LABEL_28;
    }
    v72 = static Logger.service.getter(0);
    v73 = Logger.logObject.getter(v72);
    v74 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v73, v74))
    {
      v75 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v75 = 0;
      _os_log_impl((void *)&_mh_execute_header, v73, v74, "Somehow Server no longer exists!", v75, 2u);
      swift_slowDealloc(v75, -1, -1);
    }

    swift_release(v50);
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v43 + 8))(v46, v42);
  }
  else
  {
    v68 = static Logger.service.getter(0);
    v69 = Logger.logObject.getter(v68);
    v70 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v69, v70))
    {
      v71 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v71 = 0;
      _os_log_impl((void *)&_mh_execute_header, v69, v70, "Somehow SystemMonitor no longer exists!", v71, 2u);
      swift_slowDealloc(v71, -1, -1);
    }

    return (*(uint64_t (**)(_BYTE *, uint64_t))(v43 + 8))(v48, v42);
  }
}

void sub_10002C1A4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int *v4;
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
  _BYTE *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
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
  uint64_t *v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unsigned __int8 *v64;
  uint64_t v65;
  char v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  _QWORD *v71;
  uint64_t v72;
  NSObject *v73;
  os_log_type_t v74;
  uint8_t *v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  _BYTE *v92;
  int v93;
  NSObject *v94;
  os_log_type_t v95;
  uint8_t *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  _QWORD *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void (*v113)(_BYTE *, _QWORD, uint64_t);
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  NSObject *v118;
  os_log_type_t v119;
  uint8_t *v120;
  uint64_t v121;
  uint64_t v122;
  unsigned __int8 *v123;
  unsigned int v124;
  uint64_t v125;
  char v126;
  uint64_t v127;
  void (*v128)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v129;
  double v130;
  double *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  unsigned __int8 *v135;
  unsigned int v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t *v140;
  uint64_t v141;
  uint64_t v142;
  unsigned __int8 *v143;
  unsigned int v144;
  uint64_t v145;
  __n128 v146;
  _BYTE *v147;
  char v148;
  __n128 v149;
  uint64_t v150;
  uint64_t v151;
  double *v152;
  uint64_t v153;
  uint64_t *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  double v160;
  uint64_t state64;
  uint64_t v162;

  v156 = a2;
  v159 = a3;
  v4 = (int *)type metadata accessor for FeatureInfo(0);
  v5 = __chkstk_darwin(v4);
  v153 = (uint64_t)&v150 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v5);
  v155 = (uint64_t)&v150 - v8;
  __chkstk_darwin(v7);
  v151 = (uint64_t)&v150 - v9;
  v10 = type metadata accessor for SimpleType(0);
  v157 = *(_QWORD *)(v10 - 8);
  v158 = v10;
  v11 = __chkstk_darwin(v10);
  v152 = (double *)((char *)&v150 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = __chkstk_darwin(v11);
  v154 = (uint64_t *)((char *)&v150 - v14);
  v15 = __chkstk_darwin(v13);
  v17 = (char *)&v150 - v16;
  __chkstk_darwin(v15);
  v19 = (uint64_t *)((char *)&v150 - v18);
  v20 = type metadata accessor for SystemMonitorConfig.DataType(0);
  v21 = *(_QWORD *)(v20 - 8);
  __chkstk_darwin(v20);
  v23 = (char *)&v150 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = type metadata accessor for SystemMonitorConfig.MonitorType(0);
  v25 = *(_QWORD *)(v24 - 8);
  __chkstk_darwin(v24);
  v27 = (char *)&v150 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v27, a1, v24);
  v28 = (*(uint64_t (**)(char *, uint64_t))(v25 + 88))(v27, v24);
  if ((_DWORD)v28 == enum case for SystemMonitorConfig.MonitorType.defaults(_:))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v23, a1 + v4[9], v20);
    v29 = (*(uint64_t (**)(char *, uint64_t))(v21 + 88))(v23, v20);
    if ((_DWORD)v29 == enum case for SystemMonitorConfig.DataType.string(_:))
    {
      v30 = (uint64_t *)(a1 + v4[5]);
      v31 = *v30;
      v32 = v30[1];
      v33 = (uint64_t *)(a1 + v4[6]);
      v34 = *v33;
      v35 = v33[1];
      v36 = static DefaultsUtilities.platformDefaultUserName.getter();
      v38 = v37;
      static DefaultsUtilities.get<A>(key:applicationID:userName:)(&state64, v31, v32, v34, v35, v36, v37, &type metadata for String);
      swift_bridgeObjectRelease(v38);
      v39 = v162;
      if (v162)
      {
        v40 = state64;
        v41 = a1;
        v42 = v159;
        sub_100006978(v41, v159, type metadata accessor for FeatureInfo);
        v43 = type metadata accessor for FeatureState(0);
        v44 = (uint64_t *)(v42 + *(int *)(v43 + 20));
        *v44 = v40;
        v44[1] = v39;
LABEL_58:
        (*(void (**)(void))(v157 + 104))();
        *(_DWORD *)(v42 + *(int *)(v43 + 24)) = -1;
        v128 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56);
        v129 = v42;
LABEL_86:
        v128(v129, 0, 1, v43);
        return;
      }
LABEL_21:
      v68 = v159;
      sub_100006978(a1, v159, type metadata accessor for FeatureInfo);
      v69 = type metadata accessor for FeatureState(0);
      v70 = (_QWORD *)(v68 + *(int *)(v69 + 20));
      v71 = (_QWORD *)(a1 + v4[8]);
      v72 = v71[1];
      *v70 = *v71;
      v70[1] = v72;
      (*(void (**)(void))(v157 + 104))();
      *(_DWORD *)(v68 + *(int *)(v69 + 24)) = -1;
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v69 - 8) + 56))(v68, 0, 1, v69);
      swift_bridgeObjectRetain(v72);
      return;
    }
    if ((_DWORD)v29 == enum case for SystemMonitorConfig.DataType.int(_:))
    {
      v48 = (uint64_t *)(a1 + v4[5]);
      v49 = *v48;
      v50 = v48[1];
      v51 = (uint64_t *)(a1 + v4[6]);
      v52 = *v51;
      v53 = v51[1];
      v54 = static DefaultsUtilities.platformDefaultUserName.getter();
      v56 = v55;
      static DefaultsUtilities.get<A>(key:applicationID:userName:)(&state64, v49, v50, v52, v53, v54, v55, &type metadata for Int64);
      swift_bridgeObjectRelease(v56);
      if ((v162 & 1) == 0)
      {
        v98 = state64;
        v99 = a1;
        v42 = v159;
        sub_100006978(v99, v159, type metadata accessor for FeatureInfo);
        v43 = type metadata accessor for FeatureState(0);
        *(_QWORD *)(v42 + *(int *)(v43 + 20)) = v98;
        goto LABEL_58;
      }
      v57 = v155;
      sub_100006978(a1, v155, type metadata accessor for FeatureInfo);
      v58 = (uint64_t *)(a1 + v4[8]);
      v59 = *v58;
      v60 = v58[1];
      v61 = HIBYTE(v60) & 0xF;
      v62 = v59 & 0xFFFFFFFFFFFFLL;
      if ((v60 & 0x2000000000000000) != 0)
        v63 = HIBYTE(v60) & 0xF;
      else
        v63 = v59 & 0xFFFFFFFFFFFFLL;
      if (!v63)
      {
        v139 = 0;
LABEL_84:
        v140 = v154;
        *v154 = v139;
        v142 = v157;
        v141 = v158;
        (*(void (**)(uint64_t *, _QWORD, uint64_t))(v157 + 104))(v140, enum case for SimpleType.int(_:), v158);
        v116 = v159;
        sub_10001059C(v57, v159, type metadata accessor for FeatureInfo);
        v43 = type metadata accessor for FeatureState(0);
        (*(void (**)(uint64_t, uint64_t *, uint64_t))(v142 + 32))(v116 + *(int *)(v43 + 20), v140, v141);
        goto LABEL_85;
      }
      if ((v60 & 0x1000000000000000) != 0)
      {
        swift_bridgeObjectRetain(v60);
        v65 = (uint64_t)sub_10002EAE4(v59, v60, 10);
        v67 = v148;
        swift_bridgeObjectRelease(v60);
LABEL_81:
        if ((v67 & 1) != 0)
          v139 = 0;
        else
          v139 = v65;
        goto LABEL_84;
      }
      if ((v60 & 0x2000000000000000) == 0)
      {
        if ((v59 & 0x1000000000000000) != 0)
          v64 = (unsigned __int8 *)((v60 & 0xFFFFFFFFFFFFFFFLL) + 32);
        else
          v64 = (unsigned __int8 *)_StringObject.sharedUTF8.getter(v59, v60);
        v65 = (uint64_t)sub_10002EBC8(v64, v62, 10);
        v67 = v66 & 1;
        goto LABEL_81;
      }
      state64 = v59;
      v162 = v60 & 0xFFFFFFFFFFFFFFLL;
      if (v59 == 43)
      {
        if (!v61)
          goto LABEL_102;
        if (v61 == 1 || (BYTE1(v59) - 48) > 9u)
          goto LABEL_78;
        v65 = (BYTE1(v59) - 48);
        v134 = v61 - 2;
        if (v134)
        {
          v135 = (unsigned __int8 *)&state64 + 2;
          while (1)
          {
            v136 = *v135 - 48;
            if (v136 > 9)
              goto LABEL_78;
            v137 = 10 * v65;
            if ((unsigned __int128)(v65 * (__int128)10) >> 64 != (10 * v65) >> 63)
              goto LABEL_78;
            v65 = v137 + v136;
            if (__OFADD__(v137, v136))
              goto LABEL_78;
            v67 = 0;
            ++v135;
            if (!--v134)
              goto LABEL_81;
          }
        }
      }
      else
      {
        if (v59 == 45)
        {
          if (v61)
          {
            if (v61 != 1 && (BYTE1(v59) - 48) <= 9u)
            {
              v65 = -(uint64_t)(BYTE1(v59) - 48);
              v122 = v61 - 2;
              if (v122)
              {
                v123 = (unsigned __int8 *)&state64 + 2;
                while (1)
                {
                  v124 = *v123 - 48;
                  if (v124 > 9)
                    goto LABEL_78;
                  v125 = 10 * v65;
                  if ((unsigned __int128)(v65 * (__int128)10) >> 64 != (10 * v65) >> 63)
                    goto LABEL_78;
                  v65 = v125 - v124;
                  if (__OFSUB__(v125, v124))
                    goto LABEL_78;
                  v67 = 0;
                  ++v123;
                  if (!--v122)
                    goto LABEL_81;
                }
              }
              goto LABEL_80;
            }
LABEL_78:
            v65 = 0;
            v67 = 1;
            goto LABEL_81;
          }
          __break(1u);
LABEL_102:
          __break(1u);
        }
        if (!v61 || (v59 - 48) > 9u)
          goto LABEL_78;
        v65 = (v59 - 48);
        v138 = v61 - 1;
        if (v138)
        {
          v143 = (unsigned __int8 *)&state64 + 1;
          while (1)
          {
            v144 = *v143 - 48;
            if (v144 > 9)
              goto LABEL_78;
            v145 = 10 * v65;
            if ((unsigned __int128)(v65 * (__int128)10) >> 64 != (10 * v65) >> 63)
              goto LABEL_78;
            v65 = v145 + v144;
            if (__OFADD__(v145, v144))
              goto LABEL_78;
            v67 = 0;
            ++v143;
            if (!--v138)
              goto LABEL_81;
          }
        }
      }
LABEL_80:
      v67 = 0;
      goto LABEL_81;
    }
    if ((_DWORD)v29 == enum case for SystemMonitorConfig.DataType.double(_:))
    {
      v77 = (uint64_t *)(a1 + v4[5]);
      v78 = *v77;
      v79 = v77[1];
      v80 = (uint64_t *)(a1 + v4[6]);
      v81 = *v80;
      v82 = v80[1];
      v83 = static DefaultsUtilities.platformDefaultUserName.getter();
      v85 = v84;
      static DefaultsUtilities.get<A>(key:applicationID:userName:)(&state64, v78, v79, v81, v82, v83, v84, &type metadata for Double);
      swift_bridgeObjectRelease(v85);
      if ((v162 & 1) != 0)
      {
        v86 = v153;
        v87 = sub_100006978(a1, v153, type metadata accessor for FeatureInfo);
        v88 = (uint64_t *)(a1 + v4[8]);
        v89 = *v88;
        v90 = v88[1];
        v160 = 0.0;
        __chkstk_darwin(v87);
        *(&v150 - 2) = (uint64_t)&v160;
        if ((v90 & 0x1000000000000000) != 0 || !(v90 & 0x2000000000000000 | v89 & 0x1000000000000000))
        {
          v149 = swift_bridgeObjectRetain(v90);
          _StringGuts._slowWithCString<A>(_:)(&state64, sub_10002F76C, &v150 - 4, v89, v90, &type metadata for Bool, v149);
          swift_bridgeObjectRelease(v90);
          v93 = state64;
          goto LABEL_63;
        }
        if ((v90 & 0x2000000000000000) != 0)
        {
          state64 = v89;
          v162 = v90 & 0xFFFFFFFFFFFFFFLL;
          switch((char)v89)
          {
            case 0:
            case 9:
            case 10:
            case 11:
            case 12:
            case 13:
            case 32:
              swift_bridgeObjectRetain(v90);
              goto LABEL_61;
            default:
              v146 = swift_bridgeObjectRetain(v90);
              v147 = (_BYTE *)_swift_stdlib_strtod_clocale(&state64, &v160, v146);
              if (v147)
                v93 = *v147 == 0;
              else
LABEL_61:
                v93 = 0;
              swift_bridgeObjectRelease(v90);
              break;
          }
          goto LABEL_63;
        }
        if ((v89 & 0x1000000000000000) != 0)
        {
          v91 = (v90 & 0xFFFFFFFFFFFFFFFLL) + 32;
          swift_bridgeObjectRetain(v90);
        }
        else
        {
          v91 = _StringObject.sharedUTF8.getter(v89, v90);
          swift_bridgeObjectRetain(v90);
          if (!v91)
          {
            v92 = 0;
            goto LABEL_33;
          }
        }
        v92 = (_BYTE *)v91;
LABEL_33:
        sub_10002F76C(v92, (BOOL *)&state64);
        v93 = state64;
        swift_bridgeObjectRelease(v90);
LABEL_63:
        v130 = v160;
        if (!v93)
          v130 = 0.0;
        v131 = v152;
        *v152 = v130;
        v133 = v157;
        v132 = v158;
        (*(void (**)(double *, _QWORD, uint64_t))(v157 + 104))(v131, enum case for SimpleType.double(_:), v158);
        v116 = v159;
        sub_10001059C(v86, v159, type metadata accessor for FeatureInfo);
        v43 = type metadata accessor for FeatureState(0);
        (*(void (**)(uint64_t, double *, uint64_t))(v133 + 32))(v116 + *(int *)(v43 + 20), v131, v132);
        goto LABEL_85;
      }
      v117 = state64;
      v116 = v159;
      sub_100006978(a1, v159, type metadata accessor for FeatureInfo);
      v43 = type metadata accessor for FeatureState(0);
      *(_QWORD *)(v116 + *(int *)(v43 + 20)) = v117;
      (*(void (**)(void))(v157 + 104))();
LABEL_85:
      *(_DWORD *)(v116 + *(int *)(v43 + 24)) = -1;
      v128 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56);
      v129 = v116;
      goto LABEL_86;
    }
    if ((_DWORD)v29 == enum case for SystemMonitorConfig.DataType.BOOL(_:))
    {
      v100 = (uint64_t *)(a1 + v4[5]);
      v101 = *v100;
      v102 = v100[1];
      v103 = (uint64_t *)(a1 + v4[6]);
      v104 = *v103;
      v105 = v103[1];
      v106 = static DefaultsUtilities.platformDefaultUserName.getter();
      v108 = v107;
      static DefaultsUtilities.get<A>(key:applicationID:userName:)(&state64, v101, v102, v104, v105, v106, v107, &type metadata for Bool);
      swift_bridgeObjectRelease(v108);
      if (state64 != 2)
      {
        v126 = state64 & 1;
        v127 = a1;
        v42 = v159;
        sub_100006978(v127, v159, type metadata accessor for FeatureInfo);
        v43 = type metadata accessor for FeatureState(0);
        *(_BYTE *)(v42 + *(int *)(v43 + 20)) = v126;
        goto LABEL_58;
      }
      v109 = (_QWORD *)(a1 + v4[8]);
      v110 = v109[1];
      *v19 = *v109;
      v19[1] = v110;
      v112 = v157;
      v111 = v158;
      v113 = *(void (**)(_BYTE *, _QWORD, uint64_t))(v157 + 104);
      v113(v19, enum case for SimpleType.string(_:), v158);
      v114 = a1;
      v115 = v151;
      sub_100006978(v114, v151, type metadata accessor for FeatureInfo);
      swift_bridgeObjectRetain(v110);
      LOBYTE(v110) = SimpleType.isTrue()();
      (*(void (**)(_QWORD *, uint64_t))(v112 + 8))(v19, v111);
      *v17 = v110 & 1;
      v113(v17, enum case for SimpleType.BOOL(_:), v111);
      v116 = v159;
      sub_10001059C(v115, v159, type metadata accessor for FeatureInfo);
      v43 = type metadata accessor for FeatureState(0);
      (*(void (**)(uint64_t, _BYTE *, uint64_t))(v112 + 32))(v116 + *(int *)(v43 + 20), v17, v111);
      goto LABEL_85;
    }
    v118 = Logger.logObject.getter(v29);
    v119 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v118, v119))
    {
      v120 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v120 = 0;
      _os_log_impl((void *)&_mh_execute_header, v118, v119, "Unknown featureInfo dataType received.", v120, 2u);
      swift_slowDealloc(v120, -1, -1);
    }

    v121 = type metadata accessor for FeatureState(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v121 - 8) + 56))(v159, 1, 1, v121);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
  }
  else if ((_DWORD)v28 == enum case for SystemMonitorConfig.MonitorType.notify(_:))
  {
    v45 = v156;
    if ((v156 & 0x100000000) == 0)
    {
      state64 = 0;
      if (!notify_get_state(v156, &state64))
      {
        v46 = v159;
        sub_100006978(a1, v159, type metadata accessor for FeatureInfo);
        v47 = type metadata accessor for FeatureState(0);
        *(_BYTE *)(v46 + *(int *)(v47 + 20)) = state64 == 1;
        (*(void (**)(void))(v157 + 104))();
        *(_DWORD *)(v46 + *(int *)(v47 + 24)) = v45;
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 56))(v46, 0, 1, v47);
        return;
      }
      goto LABEL_21;
    }
    v73 = Logger.logObject.getter(v28);
    v74 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v73, v74))
    {
      v75 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v75 = 0;
      _os_log_impl((void *)&_mh_execute_header, v73, v74, "cachedToken is nil.", v75, 2u);
      swift_slowDealloc(v75, -1, -1);
    }

    v76 = type metadata accessor for FeatureState(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v76 - 8) + 56))(v159, 1, 1, v76);
  }
  else
  {
    if ((_DWORD)v28 == enum case for SystemMonitorConfig.MonitorType.other(_:))
      goto LABEL_21;
    v94 = Logger.logObject.getter(v28);
    v95 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v94, v95))
    {
      v96 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v96 = 0;
      _os_log_impl((void *)&_mh_execute_header, v94, v95, "Unknown featureInfo monitorType received.", v96, 2u);
      swift_slowDealloc(v96, -1, -1);
    }

    v97 = type metadata accessor for FeatureState(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v97 - 8) + 56))(v159, 1, 1, v97);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v24);
  }
}

uint64_t SystemMonitor.currentMessage.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v1 = sub_10000E354(&qword_10003D6F0);
  __chkstk_darwin(v1);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *(_QWORD *)(v0 + 16);
  swift_retain(v4);
  os_unfair_lock_lock((os_unfair_lock_t)(v4 + 24));
  sub_1000035FC((_QWORD *)(v4 + 16), &v9);
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 24));
  v5 = v9;
  swift_release(v4);
  v6 = type metadata accessor for Message.Metadata(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v3, 1, 1, v6);
  return Message.init(category:type:content:metadata:)(8, 5, v5, v3);
}

void sub_10002D120(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  __n128 v18;
  int64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  __n128 v36;
  char *v37;
  uint64_t v38;
  int64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int64_t v43;

  v4 = type metadata accessor for FeatureState(0);
  v40 = *(_QWORD *)(v4 - 8);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v5);
  v10 = (char *)&v35 - v9;
  __chkstk_darwin(v8);
  v12 = (char *)&v35 - v11;
  v35 = a1;
  v13 = *a1;
  v14 = *(_QWORD *)(*a1 + 64);
  v38 = *a1 + 64;
  v15 = 1 << *(_BYTE *)(v13 + 32);
  v16 = -1;
  if (v15 < 64)
    v16 = ~(-1 << v15);
  v17 = v16 & v14;
  v41 = a2 + OBJC_IVAR____TtC15audioanalyticsd13SystemMonitor_logger;
  v42 = v13;
  v39 = (unint64_t)(v15 + 63) >> 6;
  v18 = swift_bridgeObjectRetain(v13);
  v19 = 0;
  v18.n128_u64[0] = 67240192;
  v36 = v18;
  v37 = v10;
  while (1)
  {
    if (v17)
    {
      v20 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v43 = v19;
      v21 = v20 | (v19 << 6);
      goto LABEL_24;
    }
    v22 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v39)
      goto LABEL_26;
    v23 = *(_QWORD *)(v38 + 8 * v22);
    v24 = v19 + 1;
    if (!v23)
    {
      v24 = v19 + 2;
      if (v19 + 2 >= v39)
        goto LABEL_26;
      v23 = *(_QWORD *)(v38 + 8 * v24);
      if (!v23)
      {
        v24 = v19 + 3;
        if (v19 + 3 >= v39)
          goto LABEL_26;
        v23 = *(_QWORD *)(v38 + 8 * v24);
        if (!v23)
        {
          v24 = v19 + 4;
          if (v19 + 4 >= v39)
            goto LABEL_26;
          v23 = *(_QWORD *)(v38 + 8 * v24);
          if (!v23)
            break;
        }
      }
    }
LABEL_23:
    v17 = (v23 - 1) & v23;
    v43 = v24;
    v21 = __clz(__rbit64(v23)) + (v24 << 6);
LABEL_24:
    sub_100006978(*(_QWORD *)(v42 + 56) + *(_QWORD *)(v40 + 72) * v21, (uint64_t)v12, type metadata accessor for FeatureState);
    sub_10001059C((uint64_t)v12, (uint64_t)v10, type metadata accessor for FeatureState);
    v26 = sub_100006978((uint64_t)v10, (uint64_t)v7, type metadata accessor for FeatureState);
    v27 = Logger.logObject.getter(v26);
    v28 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = swift_slowAlloc(8, -1);
      *(_DWORD *)v29 = v36.n128_u32[0];
      v30 = v12;
      v31 = v4;
      v32 = *(_DWORD *)&v7[*(int *)(v4 + 24)];
      sub_10002F7D8((uint64_t)v7, type metadata accessor for FeatureState);
      *(_DWORD *)(v29 + 4) = v32;
      v4 = v31;
      v12 = v30;
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "notify_cancel(%{public}d)", (uint8_t *)v29, 8u);
      v33 = v29;
      v10 = v37;
      swift_slowDealloc(v33, -1, -1);
    }
    else
    {
      sub_10002F7D8((uint64_t)v7, type metadata accessor for FeatureState);
    }
    v19 = v43;

    notify_cancel(*(_DWORD *)&v10[*(int *)(v4 + 24)]);
    sub_10002F7D8((uint64_t)v10, type metadata accessor for FeatureState);
  }
  v25 = v19 + 5;
  if (v19 + 5 >= v39)
  {
LABEL_26:
    swift_release(v42);
    v34 = v35;
    swift_bridgeObjectRelease(*v35);
    *v34 = &_swiftEmptyDictionarySingleton;
    return;
  }
  v23 = *(_QWORD *)(v38 + 8 * v25);
  if (v23)
  {
    v24 = v19 + 5;
    goto LABEL_23;
  }
  while (1)
  {
    v24 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v24 >= v39)
      goto LABEL_26;
    v23 = *(_QWORD *)(v38 + 8 * v24);
    ++v25;
    if (v23)
      goto LABEL_23;
  }
LABEL_28:
  __break(1u);
}

uint64_t sub_10002D484@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
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
  uint64_t (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint8_t *v22;
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
  int *v38;
  uint64_t result;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t v45;
  uint8_t *v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v52 = a2;
  v3 = type metadata accessor for SystemMonitorConfig(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin(v3);
  v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v45 - v8;
  v10 = type metadata accessor for Logger(0);
  v49 = *(_QWORD *)(v10 - 8);
  v50 = v10;
  v11 = __chkstk_darwin(v10);
  v13 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.service.getter(v11);
  v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v51 = a1;
  v15 = v14(v9, a1, v3);
  v16 = Logger.logObject.getter(v15);
  v17 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc(12, -1);
    v48 = swift_slowAlloc(32, -1);
    v55 = v48;
    v47 = v18;
    *(_DWORD *)v18 = 136380675;
    v46 = v18 + 4;
    v14(v7, (uint64_t)v9, v3);
    v19 = String.init<A>(describing:)(v7, v3);
    v21 = v20;
    v53 = sub_10000A7E4(v19, v20, &v55);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, &v54, v46, v18 + 12);
    swift_bridgeObjectRelease(v21);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
    v22 = v47;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "SystemMonitor.buildFeatureInfos. { config=%{private}s }", v47, 0xCu);
    v23 = v48;
    swift_arrayDestroy(v48, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v23, -1, -1);
    swift_slowDealloc(v22, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  }

  v24 = (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v13, v50);
  v25 = v52;
  v26 = SystemMonitorConfig.monitorType.getter(v24);
  v27 = SystemMonitorConfig.name.getter(v26);
  v49 = v28;
  v50 = v27;
  v29 = SystemMonitorConfig.domain.getter();
  v31 = v30;
  v32 = SystemMonitorConfig.notification.getter();
  v34 = v33;
  v35 = SystemMonitorConfig.defaultValue.getter();
  v37 = v36;
  v38 = (int *)type metadata accessor for FeatureInfo(0);
  result = SystemMonitorConfig.dataType.getter();
  v40 = (uint64_t *)(v25 + v38[5]);
  v41 = v49;
  *v40 = v50;
  v40[1] = v41;
  v42 = (uint64_t *)(v25 + v38[6]);
  *v42 = v29;
  v42[1] = v31;
  v43 = (uint64_t *)(v25 + v38[7]);
  *v43 = v32;
  v43[1] = v34;
  v44 = (uint64_t *)(v25 + v38[8]);
  *v44 = v35;
  v44[1] = v37;
  return result;
}

uint64_t SystemMonitor.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 32));

  v1 = v0 + OBJC_IVAR____TtC15audioanalyticsd13SystemMonitor_logger;
  v2 = type metadata accessor for Logger(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t SystemMonitor.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 32));

  v1 = v0 + OBJC_IVAR____TtC15audioanalyticsd13SystemMonitor_logger;
  v2 = type metadata accessor for Logger(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_10002D824()
{
  return type metadata accessor for SystemMonitor(0);
}

uint64_t type metadata accessor for SystemMonitor(uint64_t a1)
{
  return sub_1000069BC(a1, qword_10003E098, (uint64_t)&nominal type descriptor for SystemMonitor);
}

uint64_t sub_10002D840(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[5];

  v4[0] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[1] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v4[2] = (char *)&value witness table for Builtin.NativeObject + 64;
  v4[3] = (char *)&value witness table for Builtin.UnknownObject + 64;
  result = type metadata accessor for Logger(319);
  if (v3 <= 0x3F)
  {
    v4[4] = *(_QWORD *)(result - 8) + 64;
    result = swift_updateClassMetadata2(a1, 256, 5, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t *sub_10002D8D8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  void (*v28)(char *, char *, uint64_t, __n128);
  __n128 v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v36;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v34 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v34 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v34);
  }
  else
  {
    v7 = type metadata accessor for SystemMonitorConfig.MonitorType(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = (int *)type metadata accessor for FeatureInfo(0);
    v9 = v8[5];
    v10 = (uint64_t *)((char *)a1 + v9);
    v11 = (uint64_t *)((char *)a2 + v9);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = v8[6];
    v14 = (uint64_t *)((char *)a1 + v13);
    v15 = (uint64_t *)((char *)a2 + v13);
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    v17 = v8[7];
    v18 = (uint64_t *)((char *)a1 + v17);
    v19 = (uint64_t *)((char *)a2 + v17);
    v20 = v19[1];
    *v18 = *v19;
    v18[1] = v20;
    v21 = v8[8];
    v22 = (uint64_t *)((char *)a1 + v21);
    v23 = (uint64_t *)((char *)a2 + v21);
    v24 = v23[1];
    *v22 = *v23;
    v22[1] = v24;
    v25 = v8[9];
    v36 = (char *)a1 + v25;
    v26 = (char *)a2 + v25;
    v27 = type metadata accessor for SystemMonitorConfig.DataType(0);
    v28 = *(void (**)(char *, char *, uint64_t, __n128))(*(_QWORD *)(v27 - 8) + 16);
    swift_bridgeObjectRetain(v12);
    swift_bridgeObjectRetain(v16);
    swift_bridgeObjectRetain(v20);
    v29 = swift_bridgeObjectRetain(v24);
    v28(v36, v26, v27, v29);
    v30 = *(int *)(a3 + 20);
    v31 = (char *)a1 + v30;
    v32 = (char *)a2 + v30;
    v33 = type metadata accessor for SimpleType(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 16))(v31, v32, v33);
    *(_DWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_DWORD *)((char *)a2 + *(int *)(a3 + 24));
  }
  return a1;
}

uint64_t sub_10002DA58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
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

  v6 = type metadata accessor for SystemMonitorConfig.MonitorType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = (int *)type metadata accessor for FeatureInfo(0);
  v8 = v7[5];
  v9 = (_QWORD *)(a1 + v8);
  v10 = (_QWORD *)(a2 + v8);
  *v9 = *v10;
  v11 = v10[1];
  v12 = v9[1];
  v9[1] = v11;
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRelease(v12);
  v13 = v7[6];
  v14 = (_QWORD *)(a1 + v13);
  v15 = (_QWORD *)(a2 + v13);
  *v14 = *v15;
  v16 = v15[1];
  v17 = v14[1];
  v14[1] = v16;
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRelease(v17);
  v18 = v7[7];
  v19 = (_QWORD *)(a1 + v18);
  v20 = (_QWORD *)(a2 + v18);
  *v19 = *v20;
  v21 = v20[1];
  v22 = v19[1];
  v19[1] = v21;
  swift_bridgeObjectRetain(v21);
  swift_bridgeObjectRelease(v22);
  v23 = v7[8];
  v24 = (_QWORD *)(a1 + v23);
  v25 = (_QWORD *)(a2 + v23);
  *v24 = *v25;
  v26 = v25[1];
  v27 = v24[1];
  v24[1] = v26;
  swift_bridgeObjectRetain(v26);
  swift_bridgeObjectRelease(v27);
  v28 = v7[9];
  v29 = a1 + v28;
  v30 = a2 + v28;
  v31 = type metadata accessor for SystemMonitorConfig.DataType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 24))(v29, v30, v31);
  v32 = *(int *)(a3 + 20);
  v33 = a1 + v32;
  v34 = a2 + v32;
  v35 = type metadata accessor for SimpleType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 24))(v33, v34, v35);
  *(_DWORD *)(a1 + *(int *)(a3 + 24)) = *(_DWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_10002DBD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = type metadata accessor for SystemMonitorConfig.MonitorType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = (int *)type metadata accessor for FeatureInfo(0);
  *(_OWORD *)(a1 + v7[5]) = *(_OWORD *)(a2 + v7[5]);
  *(_OWORD *)(a1 + v7[6]) = *(_OWORD *)(a2 + v7[6]);
  *(_OWORD *)(a1 + v7[7]) = *(_OWORD *)(a2 + v7[7]);
  *(_OWORD *)(a1 + v7[8]) = *(_OWORD *)(a2 + v7[8]);
  v8 = v7[9];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = type metadata accessor for SystemMonitorConfig.DataType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  v12 = *(int *)(a3 + 20);
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = type metadata accessor for SimpleType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  *(_DWORD *)(a1 + *(int *)(a3 + 24)) = *(_DWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_10002DCC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  int *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t *v28;
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

  v6 = type metadata accessor for SystemMonitorConfig.MonitorType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = (int *)type metadata accessor for FeatureInfo(0);
  v8 = v7[5];
  v9 = (_QWORD *)(a1 + v8);
  v10 = (uint64_t *)(a2 + v8);
  v12 = *v10;
  v11 = v10[1];
  v13 = v9[1];
  *v9 = v12;
  v9[1] = v11;
  swift_bridgeObjectRelease(v13);
  v14 = v7[6];
  v15 = (_QWORD *)(a1 + v14);
  v16 = (uint64_t *)(a2 + v14);
  v18 = *v16;
  v17 = v16[1];
  v19 = v15[1];
  *v15 = v18;
  v15[1] = v17;
  swift_bridgeObjectRelease(v19);
  v20 = v7[7];
  v21 = (_QWORD *)(a1 + v20);
  v22 = (uint64_t *)(a2 + v20);
  v24 = *v22;
  v23 = v22[1];
  v25 = v21[1];
  *v21 = v24;
  v21[1] = v23;
  swift_bridgeObjectRelease(v25);
  v26 = v7[8];
  v27 = (_QWORD *)(a1 + v26);
  v28 = (uint64_t *)(a2 + v26);
  v30 = *v28;
  v29 = v28[1];
  v31 = v27[1];
  *v27 = v30;
  v27[1] = v29;
  swift_bridgeObjectRelease(v31);
  v32 = v7[9];
  v33 = a1 + v32;
  v34 = a2 + v32;
  v35 = type metadata accessor for SystemMonitorConfig.DataType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 40))(v33, v34, v35);
  v36 = *(int *)(a3 + 20);
  v37 = a1 + v36;
  v38 = a2 + v36;
  v39 = type metadata accessor for SimpleType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 40))(v37, v38, v39);
  *(_DWORD *)(a1 + *(int *)(a3 + 24)) = *(_DWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_10002DDFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002DE08);
}

uint64_t sub_10002DE08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = type metadata accessor for FeatureInfo(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = type metadata accessor for SimpleType(0);
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t sub_10002DE7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002DE88);
}

uint64_t sub_10002DE88(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = type metadata accessor for FeatureInfo(0);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = type metadata accessor for SimpleType(0);
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_10002DF04(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;
  _QWORD v5[3];

  result = type metadata accessor for FeatureInfo(319);
  if (v3 <= 0x3F)
  {
    v5[0] = *(_QWORD *)(result - 8) + 64;
    result = type metadata accessor for SimpleType(319);
    if (v4 <= 0x3F)
    {
      v5[1] = *(_QWORD *)(result - 8) + 64;
      v5[2] = (char *)&value witness table for Builtin.Int32 + 64;
      swift_initStructMetadata(a1, 256, 3, v5, a1 + 16);
      return 0;
    }
  }
  return result;
}

uint64_t *sub_10002DF94(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  void (*v29)(char *, char *, uint64_t);
  uint64_t v30;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v30 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v30 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v30);
  }
  else
  {
    v7 = type metadata accessor for SystemMonitorConfig.MonitorType(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = a3[6];
    v10 = (uint64_t *)((char *)a1 + v8);
    v11 = (uint64_t *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = (uint64_t *)((char *)a1 + v9);
    v14 = (uint64_t *)((char *)a2 + v9);
    v15 = v14[1];
    *v13 = *v14;
    v13[1] = v15;
    v16 = a3[7];
    v17 = a3[8];
    v18 = (uint64_t *)((char *)a1 + v16);
    v19 = (uint64_t *)((char *)a2 + v16);
    v20 = v19[1];
    *v18 = *v19;
    v18[1] = v20;
    v21 = (uint64_t *)((char *)a1 + v17);
    v22 = (uint64_t *)((char *)a2 + v17);
    v23 = *v22;
    v24 = v22[1];
    v25 = a3[9];
    v26 = (char *)a2 + v25;
    v27 = (char *)a1 + v25;
    *v21 = v23;
    v21[1] = v24;
    v28 = type metadata accessor for SystemMonitorConfig.DataType(0);
    v29 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 16);
    swift_bridgeObjectRetain(v12);
    swift_bridgeObjectRetain(v15);
    swift_bridgeObjectRetain(v20);
    swift_bridgeObjectRetain(v24);
    v29(v27, v26, v28);
  }
  return a1;
}

uint64_t sub_10002E0C0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v6 = type metadata accessor for SystemMonitorConfig.MonitorType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v10 = v9[1];
  v11 = v8[1];
  v8[1] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  v12 = a3[6];
  v13 = (_QWORD *)(a1 + v12);
  v14 = (_QWORD *)(a2 + v12);
  *v13 = *v14;
  v15 = v14[1];
  v16 = v13[1];
  v13[1] = v15;
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRelease(v16);
  v17 = a3[7];
  v18 = (_QWORD *)(a1 + v17);
  v19 = (_QWORD *)(a2 + v17);
  *v18 = *v19;
  v20 = v19[1];
  v21 = v18[1];
  v18[1] = v20;
  swift_bridgeObjectRetain(v20);
  swift_bridgeObjectRelease(v21);
  v22 = a3[8];
  v23 = (_QWORD *)(a1 + v22);
  v24 = (_QWORD *)(a2 + v22);
  *v23 = *v24;
  v25 = v24[1];
  v26 = v23[1];
  v23[1] = v25;
  swift_bridgeObjectRetain(v25);
  swift_bridgeObjectRelease(v26);
  v27 = a3[9];
  v28 = a1 + v27;
  v29 = a2 + v27;
  v30 = type metadata accessor for SystemMonitorConfig.DataType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 24))(v28, v29, v30);
  return a1;
}

uint64_t sub_10002E1EC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = type metadata accessor for SystemMonitorConfig.MonitorType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  v9 = a3[9];
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = type metadata accessor for SystemMonitorConfig.DataType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  return a1;
}

uint64_t sub_10002E290(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v6 = type metadata accessor for SystemMonitorConfig.MonitorType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  v12 = v8[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease(v12);
  v13 = a3[6];
  v14 = (_QWORD *)(a1 + v13);
  v15 = (uint64_t *)(a2 + v13);
  v17 = *v15;
  v16 = v15[1];
  v18 = v14[1];
  *v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease(v18);
  v19 = a3[7];
  v20 = (_QWORD *)(a1 + v19);
  v21 = (uint64_t *)(a2 + v19);
  v23 = *v21;
  v22 = v21[1];
  v24 = v20[1];
  *v20 = v23;
  v20[1] = v22;
  swift_bridgeObjectRelease(v24);
  v25 = a3[8];
  v26 = (_QWORD *)(a1 + v25);
  v27 = (uint64_t *)(a2 + v25);
  v29 = *v27;
  v28 = v27[1];
  v30 = v26[1];
  *v26 = v29;
  v26[1] = v28;
  swift_bridgeObjectRelease(v30);
  v31 = a3[9];
  v32 = a1 + v31;
  v33 = a2 + v31;
  v34 = type metadata accessor for SystemMonitorConfig.DataType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 40))(v32, v33, v34);
  return a1;
}

uint64_t sub_10002E37C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10002E388);
}

uint64_t sub_10002E388(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;

  v6 = type metadata accessor for SystemMonitorConfig.MonitorType(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v8 = type metadata accessor for SystemMonitorConfig.DataType(0);
    v10 = a1 + *(int *)(a3 + 36);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t sub_10002E434(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10002E440);
}

uint64_t sub_10002E440(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = type metadata accessor for SystemMonitorConfig.MonitorType(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
      return result;
    }
    v10 = type metadata accessor for SystemMonitorConfig.DataType(0);
    v12 = a1 + *(int *)(a4 + 36);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_10002E4E8(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;
  _QWORD v5[6];

  result = type metadata accessor for SystemMonitorConfig.MonitorType(319);
  if (v3 <= 0x3F)
  {
    v5[0] = *(_QWORD *)(result - 8) + 64;
    v5[1] = &unk_1000320E8;
    v5[2] = &unk_1000320E8;
    v5[3] = &unk_1000320E8;
    v5[4] = &unk_1000320E8;
    result = type metadata accessor for SystemMonitorConfig.DataType(319);
    if (v4 <= 0x3F)
    {
      v5[5] = *(_QWORD *)(result - 8) + 64;
      swift_initStructMetadata(a1, 256, 6, v5, a1 + 16);
      return 0;
    }
  }
  return result;
}

uint64_t sub_10002E57C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = type metadata accessor for SystemMonitorConfig.MonitorType(0);
  v4 = sub_100006818(&qword_10003DE00, (uint64_t (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.MonitorType, (uint64_t)&protocol conformance descriptor for SystemMonitorConfig.MonitorType);
  dispatch thunk of Hashable.hash(into:)(a1, v3, v4);
  v5 = (int *)type metadata accessor for FeatureInfo(0);
  v6 = (uint64_t *)(v1 + v5[5]);
  v7 = *v6;
  v8 = v6[1];
  swift_bridgeObjectRetain(v8);
  String.hash(into:)(a1, v7, v8);
  swift_bridgeObjectRelease(v8);
  v9 = (uint64_t *)(v1 + v5[6]);
  v10 = *v9;
  v11 = v9[1];
  swift_bridgeObjectRetain(v11);
  String.hash(into:)(a1, v10, v11);
  swift_bridgeObjectRelease(v11);
  v12 = (uint64_t *)(v1 + v5[7]);
  v13 = *v12;
  v14 = v12[1];
  swift_bridgeObjectRetain(v14);
  String.hash(into:)(a1, v13, v14);
  swift_bridgeObjectRelease(v14);
  v15 = (uint64_t *)(v1 + v5[8]);
  v16 = *v15;
  v17 = v15[1];
  swift_bridgeObjectRetain(v17);
  String.hash(into:)(a1, v16, v17);
  swift_bridgeObjectRelease(v17);
  v18 = type metadata accessor for SystemMonitorConfig.DataType(0);
  v19 = sub_100006818(&qword_10003DE08, (uint64_t (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.DataType, (uint64_t)&protocol conformance descriptor for SystemMonitorConfig.DataType);
  return dispatch thunk of Hashable.hash(into:)(a1, v18, v19);
}

Swift::Int sub_10002E6DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[9];

  Hasher.init(_seed:)(v19, 0);
  v1 = type metadata accessor for SystemMonitorConfig.MonitorType(0);
  v2 = sub_100006818(&qword_10003DE00, (uint64_t (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.MonitorType, (uint64_t)&protocol conformance descriptor for SystemMonitorConfig.MonitorType);
  dispatch thunk of Hashable.hash(into:)(v19, v1, v2);
  v3 = (int *)type metadata accessor for FeatureInfo(0);
  v4 = (uint64_t *)(v0 + v3[5]);
  v5 = *v4;
  v6 = v4[1];
  swift_bridgeObjectRetain(v6);
  String.hash(into:)(v19, v5, v6);
  swift_bridgeObjectRelease(v6);
  v7 = (uint64_t *)(v0 + v3[6]);
  v8 = *v7;
  v9 = v7[1];
  swift_bridgeObjectRetain(v9);
  String.hash(into:)(v19, v8, v9);
  swift_bridgeObjectRelease(v9);
  v10 = (uint64_t *)(v0 + v3[7]);
  v11 = *v10;
  v12 = v10[1];
  swift_bridgeObjectRetain(v12);
  String.hash(into:)(v19, v11, v12);
  swift_bridgeObjectRelease(v12);
  v13 = (uint64_t *)(v0 + v3[8]);
  v14 = *v13;
  v15 = v13[1];
  swift_bridgeObjectRetain(v15);
  String.hash(into:)(v19, v14, v15);
  swift_bridgeObjectRelease(v15);
  v16 = type metadata accessor for SystemMonitorConfig.DataType(0);
  v17 = sub_100006818(&qword_10003DE08, (uint64_t (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.DataType, (uint64_t)&protocol conformance descriptor for SystemMonitorConfig.DataType);
  dispatch thunk of Hashable.hash(into:)(v19, v16, v17);
  return Hasher._finalize()();
}

Swift::Int sub_10002E854(uint64_t a1, int *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[9];

  Hasher.init(_seed:)(v21, a1);
  v4 = type metadata accessor for SystemMonitorConfig.MonitorType(0);
  v5 = sub_100006818(&qword_10003DE00, (uint64_t (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.MonitorType, (uint64_t)&protocol conformance descriptor for SystemMonitorConfig.MonitorType);
  dispatch thunk of Hashable.hash(into:)(v21, v4, v5);
  v6 = (uint64_t *)(v2 + a2[5]);
  v7 = *v6;
  v8 = v6[1];
  swift_bridgeObjectRetain(v8);
  String.hash(into:)(v21, v7, v8);
  swift_bridgeObjectRelease(v8);
  v9 = (uint64_t *)(v2 + a2[6]);
  v10 = *v9;
  v11 = v9[1];
  swift_bridgeObjectRetain(v11);
  String.hash(into:)(v21, v10, v11);
  swift_bridgeObjectRelease(v11);
  v12 = (uint64_t *)(v2 + a2[7]);
  v13 = *v12;
  v14 = v12[1];
  swift_bridgeObjectRetain(v14);
  String.hash(into:)(v21, v13, v14);
  swift_bridgeObjectRelease(v14);
  v15 = (uint64_t *)(v2 + a2[8]);
  v16 = *v15;
  v17 = v15[1];
  swift_bridgeObjectRetain(v17);
  String.hash(into:)(v21, v16, v17);
  swift_bridgeObjectRelease(v17);
  v18 = type metadata accessor for SystemMonitorConfig.DataType(0);
  v19 = sub_100006818(&qword_10003DE08, (uint64_t (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.DataType, (uint64_t)&protocol conformance descriptor for SystemMonitorConfig.DataType);
  dispatch thunk of Hashable.hash(into:)(v21, v18, v19);
  return Hasher._finalize()();
}

uint64_t sub_10002E9BC()
{
  return sub_100006818(&qword_10003E278, type metadata accessor for FeatureInfo, (uint64_t)&unk_100032100);
}

uint64_t sub_10002E9E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v16;

  v6 = __chkstk_darwin(a1);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v6);
  v11 = (char *)&v16 - v10;
  v13 = sub_10002F514(v9, v12);
  sub_100006978(a1, (uint64_t)v11, type metadata accessor for FeatureState);
  sub_100006978(a2, (uint64_t)v8, type metadata accessor for FeatureState);
  if ((v13 & 1) != 0)
    v14 = static SimpleType.== infix(_:_:)(&v11[*(int *)(a3 + 20)], &v8[*(int *)(a3 + 20)]);
  else
    v14 = 0;
  sub_10002F7D8((uint64_t)v8, type metadata accessor for FeatureState);
  sub_10002F7D8((uint64_t)v11, type metadata accessor for FeatureState);
  return v14 & 1;
}

unsigned __int8 *sub_10002EAE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __n128 v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int8 *v13;
  uint64_t v15;
  uint64_t v16;

  v15 = a1;
  v16 = a2;
  v4 = swift_bridgeObjectRetain(a2);
  v5 = String.init<A>(_:)(&v15, &type metadata for String, &protocol witness table for String, &protocol witness table for String, v4);
  v7 = v5;
  v8 = v6;
  if ((v6 & 0x1000000000000000) == 0)
  {
    if ((v6 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v10 = HIBYTE(v8) & 0xF;
    v15 = v7;
    v16 = v8 & 0xFFFFFFFFFFFFFFLL;
    v9 = (unsigned __int8 *)&v15;
    goto LABEL_7;
  }
  v7 = sub_10002EE44(v5, v6);
  v12 = v11;
  swift_bridgeObjectRelease(v8);
  v8 = v12;
  if ((v12 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v7 & 0x1000000000000000) != 0)
  {
    v9 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v9 = (unsigned __int8 *)_StringObject.sharedUTF8.getter(v7, v8);
  }
LABEL_7:
  v13 = sub_10002EBC8(v9, v10, a3);
  swift_bridgeObjectRelease(v8);
  return v13;
}

unsigned __int8 *sub_10002EBC8(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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

uint64_t sub_10002EE44(uint64_t a1, unint64_t a2)
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
  v9 = sub_10002EEC0(v4, v7, v8, v5);
  swift_bridgeObjectRelease(v6);
  return v9;
}

uint64_t sub_10002EEC0(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
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
    v12 = sub_10002F004(a1, a2, a3, a4);
    if (v12)
    {
      v9 = v12;
      v8 = (unint64_t)sub_10000ACB0(v12, 0);
      v5 = sub_10002F0F0((unint64_t)v15, v8 + 32, v9, a1, a2, v5, a4);
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
      v8 = (unint64_t)_swiftEmptyArrayStorage;
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

unint64_t sub_10002F004(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
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
    result = sub_10002835C(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_10002835C(a2, a3, a4);
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

unint64_t sub_10002F0F0(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
      result = sub_10002835C(v12, a6, a7);
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
    result = sub_10002835C(v12, a6, a7);
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

_QWORD *sub_10002F300()
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
  uint64_t v10;
  int64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v19;
  void (*v20)(char *, unint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;

  v0 = type metadata accessor for SystemMonitorConfig(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for FeatureInfo(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = Config.systemMonitorConfigs.getter(v6);
  v10 = v9;
  v11 = *(_QWORD *)(v9 + 16);
  if (v11)
  {
    v23 = _swiftEmptyArrayStorage;
    sub_100028B08(0, v11, 0);
    v12 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
    v19 = v10;
    v13 = v10 + v12;
    v14 = *(_QWORD *)(v1 + 72);
    v20 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
    v21 = v14;
    v22 = v1;
    do
    {
      v20(v3, v13, v0);
      sub_10002D484((uint64_t)v3, (uint64_t)v8);
      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
      v15 = v23;
      if ((swift_isUniquelyReferenced_nonNull_native(v23) & 1) == 0)
      {
        sub_100028B08(0, v15[2] + 1, 1);
        v15 = v23;
      }
      v17 = v15[2];
      v16 = v15[3];
      if (v17 >= v16 >> 1)
      {
        sub_100028B08(v16 > 1, v17 + 1, 1);
        v15 = v23;
      }
      v15[2] = v17 + 1;
      sub_10001059C((uint64_t)v8, (uint64_t)v15+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v17, type metadata accessor for FeatureInfo);
      v1 = v22;
      v13 += v21;
      --v11;
    }
    while (v11);
    swift_bridgeObjectRelease(v19);
  }
  else
  {
    swift_bridgeObjectRelease(v9);
    return _swiftEmptyArrayStorage;
  }
  return v15;
}

uint64_t sub_10002F514(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;
  char v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v4 = type metadata accessor for SystemMonitorConfig.MonitorType(0);
  v5 = sub_100006818(&qword_10003DE10, (uint64_t (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.MonitorType, (uint64_t)&protocol conformance descriptor for SystemMonitorConfig.MonitorType);
  dispatch thunk of RawRepresentable.rawValue.getter(&v37, v4, v5);
  dispatch thunk of RawRepresentable.rawValue.getter(&v35, v4, v5);
  v6 = v38;
  v7 = v36;
  if (v37 == v35 && v38 == v36)
  {
    swift_bridgeObjectRelease_n(v38, 2);
  }
  else
  {
    v9 = _stringCompareWithSmolCheck(_:_:expecting:)(v37, v38);
    swift_bridgeObjectRelease(v6);
    swift_bridgeObjectRelease(v7);
    v10 = 0;
    if ((v9 & 1) == 0)
      return v10 & 1;
  }
  v11 = (int *)type metadata accessor for FeatureInfo(0);
  v12 = v11[5];
  v13 = *(_QWORD *)(a1 + v12);
  v14 = *(_QWORD *)(a1 + v12 + 8);
  v15 = (_QWORD *)(a2 + v12);
  v16 = v13 == *v15 && v14 == v15[1];
  if (v16 || (v10 = 0, (_stringCompareWithSmolCheck(_:_:expecting:)(v13, v14) & 1) != 0))
  {
    v17 = v11[6];
    v18 = *(_QWORD *)(a1 + v17);
    v19 = *(_QWORD *)(a1 + v17 + 8);
    v20 = (_QWORD *)(a2 + v17);
    v21 = v18 == *v20 && v19 == v20[1];
    if (v21 || (v10 = 0, (_stringCompareWithSmolCheck(_:_:expecting:)(v18, v19) & 1) != 0))
    {
      if ((v22 = v11[7],
            v23 = *(_QWORD *)(a1 + v22),
            v24 = *(_QWORD *)(a1 + v22 + 8),
            v25 = (_QWORD *)(a2 + v22),
            v23 == *v25)
        && v24 == v25[1]
        || (v10 = 0, (_stringCompareWithSmolCheck(_:_:expecting:)(v23, v24) & 1) != 0))
      {
        if ((v26 = v11[8],
              v27 = *(_QWORD *)(a1 + v26),
              v28 = *(_QWORD *)(a1 + v26 + 8),
              v29 = (_QWORD *)(a2 + v26),
              v27 == *v29)
          && v28 == v29[1]
          || (v10 = 0, (_stringCompareWithSmolCheck(_:_:expecting:)(v27, v28) & 1) != 0))
        {
          v30 = type metadata accessor for SystemMonitorConfig.DataType(0);
          v31 = sub_100006818(&qword_10003DE18, (uint64_t (*)(uint64_t))&type metadata accessor for SystemMonitorConfig.DataType, (uint64_t)&protocol conformance descriptor for SystemMonitorConfig.DataType);
          dispatch thunk of RawRepresentable.rawValue.getter(&v37, v30, v31);
          dispatch thunk of RawRepresentable.rawValue.getter(&v35, v30, v31);
          v32 = v38;
          v33 = v36;
          if (v37 == v35 && v38 == v36)
          {
            v10 = 1;
            v33 = v38;
          }
          else
          {
            v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v37, v38);
          }
          swift_bridgeObjectRelease(v32);
          swift_bridgeObjectRelease(v33);
        }
      }
    }
  }
  return v10 & 1;
}

_BYTE *sub_10002F76C@<X0>(_BYTE *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3;
  BOOL v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;

  v3 = *result;
  v4 = v3 > 0x20;
  v5 = (1 << v3) & 0x100003E01;
  v6 = v4 || v5 == 0;
  v7 = v6 && (result = (_BYTE *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

uint64_t sub_10002F7D8(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10002F814()
{
  return sub_100006818(&qword_10003DC20, type metadata accessor for FeatureInfo, (uint64_t)&unk_100032128);
}

unint64_t sub_10002F848()
{
  return (*(_QWORD *)(*(_QWORD *)(type metadata accessor for FeatureInfo(0) - 8) + 64) + 7) & 0xFFFFFFFFFFFFFFF8;
}

uint64_t sub_10002F87C(uint64_t a1)
{
  uint64_t v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = type metadata accessor for SystemMonitorConfig.MonitorType(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  v3 = (int *)type metadata accessor for FeatureInfo(0);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + v3[5] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + v3[6] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + v3[7] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + v3[8] + 8));
  v4 = a1 + v3[9];
  v5 = type metadata accessor for SystemMonitorConfig.DataType(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t sub_10002F920(uint64_t a1, uint64_t a2)
{
  sub_100006978(a1, a2, type metadata accessor for FeatureInfo);
  return type metadata accessor for FeatureInfo(0);
}

uint64_t sub_10002F948(uint64_t a1, uint64_t a2)
{
  type metadata accessor for FeatureInfo(0);
  return sub_10001059C(a1, a2, type metadata accessor for FeatureInfo);
}

ValueMetadata *type metadata accessor for Workers()
{
  return &type metadata for Workers;
}

_QWORD *sub_10002F994()
{
  _QWORD *result;

  result = sub_10002F9B0();
  qword_10003E368 = (uint64_t)result;
  return result;
}

_QWORD *sub_10002F9B0()
{
  uint64_t v0;
  uint64_t inited;
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
  BOOL v23;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  uint64_t v37;
  NSString v38;
  unsigned __int8 v39;
  _QWORD *v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  BOOL v47;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  BOOL v56;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  BOOL v66;
  unint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  _QWORD *v77;
  _BYTE v78[176];

  v0 = sub_10000E354(&qword_10003E038);
  inited = swift_initStackObject(v0, v78);
  *(_OWORD *)(inited + 16) = xmmword_1000321E0;
  v2 = type metadata accessor for CoreAnalyticsWorker(0);
  v3 = sub_100006818(&qword_10003E2A0, (uint64_t (*)(uint64_t))&type metadata accessor for CoreAnalyticsWorker, (uint64_t)&protocol conformance descriptor for CoreAnalyticsWorker);
  *(_QWORD *)(inited + 32) = v2;
  *(_QWORD *)(inited + 40) = v3;
  v4 = type metadata accessor for RTCWorker(0);
  v5 = sub_100006818(&qword_10003E2A8, (uint64_t (*)(uint64_t))&type metadata accessor for RTCWorker, (uint64_t)&protocol conformance descriptor for RTCWorker);
  *(_QWORD *)(inited + 48) = v4;
  *(_QWORD *)(inited + 56) = v5;
  v6 = type metadata accessor for TailspinWorker(0);
  v7 = sub_100006818(&qword_10003E2B0, (uint64_t (*)(uint64_t))&type metadata accessor for TailspinWorker, (uint64_t)&protocol conformance descriptor for TailspinWorker);
  *(_QWORD *)(inited + 64) = v6;
  *(_QWORD *)(inited + 72) = v7;
  v8 = type metadata accessor for SummaryDecoratorWorker(0);
  v9 = sub_100006818(&qword_10003E2B8, (uint64_t (*)(uint64_t))&type metadata accessor for SummaryDecoratorWorker, (uint64_t)&protocol conformance descriptor for SummaryDecoratorWorker);
  *(_QWORD *)(inited + 80) = v8;
  *(_QWORD *)(inited + 88) = v9;
  v10 = type metadata accessor for SessionSummaryWorker(0);
  v11 = sub_100006818(&qword_10003E2C0, (uint64_t (*)(uint64_t))&type metadata accessor for SessionSummaryWorker, (uint64_t)&protocol conformance descriptor for SessionSummaryWorker);
  *(_QWORD *)(inited + 96) = v10;
  *(_QWORD *)(inited + 104) = v11;
  v12 = type metadata accessor for DurationSummaryWorker(0);
  v13 = sub_100006818(&qword_10003E2C8, (uint64_t (*)(uint64_t))&type metadata accessor for DurationSummaryWorker, (uint64_t)&protocol conformance descriptor for DurationSummaryWorker);
  *(_QWORD *)(inited + 112) = v12;
  *(_QWORD *)(inited + 120) = v13;
  v14 = type metadata accessor for DriverSnapshotWorker(0);
  v15 = sub_100006818(&qword_10003E2D0, (uint64_t (*)(uint64_t))&type metadata accessor for DriverSnapshotWorker, (uint64_t)&protocol conformance descriptor for DriverSnapshotWorker);
  *(_QWORD *)(inited + 128) = v14;
  *(_QWORD *)(inited + 136) = v15;
  v16 = type metadata accessor for PowerLogWorker(0);
  v17 = sub_100006818(&qword_10003E2D8, (uint64_t (*)(uint64_t))&type metadata accessor for PowerLogWorker, (uint64_t)&protocol conformance descriptor for PowerLogWorker);
  *(_QWORD *)(inited + 144) = v16;
  *(_QWORD *)(inited + 152) = v17;
  v18 = type metadata accessor for AirPodWorker(0);
  v19 = sub_100006818(&qword_10003E2E0, (uint64_t (*)(uint64_t))&type metadata accessor for AirPodWorker, (uint64_t)&protocol conformance descriptor for AirPodWorker);
  *(_QWORD *)(inited + 160) = v18;
  *(_QWORD *)(inited + 168) = v19;
  v20 = type metadata accessor for AdaptiveVolumeWorker(0);
  v21 = sub_100006818(&qword_10003E2E8, (uint64_t (*)(uint64_t))&type metadata accessor for AdaptiveVolumeWorker, (uint64_t)&protocol conformance descriptor for AdaptiveVolumeWorker);
  v22 = sub_100027F0C((_QWORD *)1, 10, 1, (_QWORD *)inited);
  v22[2] = 10;
  v22[22] = v20;
  v22[23] = v21;
  v77 = v22;
  if (&protocol conformance descriptor for JsonFileWorker)
    v23 = &type metadata accessor for JsonFileWorker == 0;
  else
    v23 = 1;
  if (!v23
    && &type metadata for JsonFileWorker != 0
    && &nominal type descriptor for JsonFileWorker != 0
    && &metaclass for JsonFileWorker != 0)
  {
    v27 = type metadata accessor for JsonFileWorker(0);
    v28 = sub_100006818(&qword_10003E308, (uint64_t (*)(uint64_t))&type metadata accessor for JsonFileWorker, (uint64_t)&protocol conformance descriptor for JsonFileWorker);
    sub_100024ED0(0, 0, v27, v28);
    v29 = objc_msgSend((id)objc_opt_self(NSProcessInfo), "processInfo");
    v30 = objc_msgSend(v29, "environment");

    v31 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v30, &type metadata for String, &type metadata for String, &protocol witness table for String);
    v32 = static Constants.loadTestWorkerEnv.getter();
    v34 = v33;
    if (*(_QWORD *)(v31 + 16) && (v35 = sub_10000D9BC(v32, v33), (v36 & 1) != 0))
    {
      v37 = *(_QWORD *)(*(_QWORD *)(v31 + 56) + 16 * v35 + 8);
      swift_bridgeObjectRetain(v37);
      swift_bridgeObjectRelease(v34);
      swift_bridgeObjectRelease(v31);
      v38 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v37);
      v39 = objc_msgSend(v38, "BOOLValue");

      if ((v39 & 1) != 0)
      {
        v40 = v77;
        if ((swift_isUniquelyReferenced_nonNull_native(v77) & 1) == 0)
          v40 = sub_100027F0C(0, v77[2] + 1, 1, v77);
        v42 = v40[2];
        v41 = v40[3];
        if (v42 >= v41 >> 1)
          v40 = sub_100027F0C((_QWORD *)(v41 > 1), v42 + 1, 1, v40);
        v43 = type metadata accessor for TestWorker(0);
        v44 = sub_100006818(&qword_10003E310, (uint64_t (*)(uint64_t))&type metadata accessor for TestWorker, (uint64_t)&protocol conformance descriptor for TestWorker);
        v40[2] = v42 + 1;
        v45 = &v40[2 * v42];
        v45[4] = v43;
        v45[5] = v44;
        v77 = v40;
      }
    }
    else
    {
      swift_bridgeObjectRelease(v34);
      swift_bridgeObjectRelease(v31);
    }
  }
  v46 = v77;
  if (&protocol conformance descriptor for ABCWorker)
    v47 = &type metadata accessor for ABCWorker == 0;
  else
    v47 = 1;
  if (!v47
    && &type metadata for ABCWorker != 0
    && &nominal type descriptor for ABCWorker != 0
    && &metaclass for ABCWorker != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native(v77) & 1) == 0)
      v46 = sub_100027F0C(0, v77[2] + 1, 1, v77);
    v52 = v46[2];
    v51 = v46[3];
    if (v52 >= v51 >> 1)
      v46 = sub_100027F0C((_QWORD *)(v51 > 1), v52 + 1, 1, v46);
    v53 = type metadata accessor for ABCWorker(0);
    v54 = sub_100006818(&qword_10003E300, (uint64_t (*)(uint64_t))&type metadata accessor for ABCWorker, (uint64_t)&protocol conformance descriptor for ABCWorker);
    v46[2] = v52 + 1;
    v55 = &v46[2 * v52];
    v55[4] = v53;
    v55[5] = v54;
  }
  if (&protocol conformance descriptor for AudioCaptureNotificationsWorker)
    v56 = &protocol conformance descriptor for AudioCaptureNotificationsWorker == 0;
  else
    v56 = 1;
  if (!v56
    && &type metadata accessor for AudioCaptureNotificationsWorker != 0
    && &type metadata for AudioCaptureNotificationsWorker != 0
    && &nominal type descriptor for AudioCaptureNotificationsWorker != 0
    && &metaclass for AudioCaptureNotificationsWorker != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native(v46) & 1) == 0)
      v46 = sub_100027F0C(0, v46[2] + 1, 1, v46);
    v62 = v46[2];
    v61 = v46[3];
    if (v62 >= v61 >> 1)
      v46 = sub_100027F0C((_QWORD *)(v61 > 1), v62 + 1, 1, v46);
    v63 = type metadata accessor for AudioCaptureNotificationsWorker(0);
    v64 = sub_100006818(&qword_10003E2F8, (uint64_t (*)(uint64_t))&type metadata accessor for AudioCaptureNotificationsWorker, (uint64_t)&protocol conformance descriptor for AudioCaptureNotificationsWorker);
    v46[2] = v62 + 1;
    v65 = &v46[2 * v62];
    v65[4] = v63;
    v65[5] = v64;
  }
  if (&protocol conformance descriptor for AudioCaptureLogsWorker)
    v66 = &protocol conformance descriptor for AudioCaptureLogsWorker == 0;
  else
    v66 = 1;
  if (!v66
    && &type metadata accessor for AudioCaptureLogsWorker != 0
    && &type metadata for AudioCaptureLogsWorker != 0
    && &nominal type descriptor for AudioCaptureLogsWorker != 0
    && &metaclass for AudioCaptureLogsWorker != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native(v46) & 1) == 0)
      v46 = sub_100027F0C(0, v46[2] + 1, 1, v46);
    v72 = v46[2];
    v71 = v46[3];
    if (v72 >= v71 >> 1)
      v46 = sub_100027F0C((_QWORD *)(v71 > 1), v72 + 1, 1, v46);
    v73 = type metadata accessor for AudioCaptureLogsWorker(0);
    v74 = sub_100006818(&qword_10003E2F0, (uint64_t (*)(uint64_t))&type metadata accessor for AudioCaptureLogsWorker, (uint64_t)&protocol conformance descriptor for AudioCaptureLogsWorker);
    v46[2] = v72 + 1;
    v75 = &v46[2 * v72];
    v75[4] = v73;
    v75[5] = v74;
  }
  return v46;
}

void sub_1000300A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t i;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;

  if (qword_10003D620 != -1)
    swift_once(&qword_10003D620, sub_10002F994);
  v0 = qword_10003E368;
  v1 = *(_QWORD *)(qword_10003E368 + 16);
  if (v1)
  {
    swift_bridgeObjectRetain(qword_10003E368);
    for (i = 0; i != v1; ++i)
    {
      v7 = *(_OWORD *)(v0 + 16 * i + 32);
      v5 = *(_QWORD *)(v0 + 16 * i + 32);
      if (swift_conformsToProtocol2(v5, &protocol descriptor for StartOnFirstMessage))
        v6 = v5;
      else
        v6 = 0;
      if (v6)
      {
        if ((swift_isUniquelyReferenced_nonNull_native(_swiftEmptyArrayStorage) & 1) == 0)
          sub_100028B78(0, _swiftEmptyArrayStorage[2] + 1, 1);
        v4 = _swiftEmptyArrayStorage[2];
        v3 = _swiftEmptyArrayStorage[3];
        if (v4 >= v3 >> 1)
          sub_100028B78(v3 > 1, v4 + 1, 1);
        _swiftEmptyArrayStorage[2] = v4 + 1;
        *(_OWORD *)&_swiftEmptyArrayStorage[2 * v4 + 4] = v7;
      }
    }
    swift_bridgeObjectRelease(v0);
  }
  qword_10003E370 = (uint64_t)_swiftEmptyArrayStorage;
}

void sub_1000301F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t i;
  __int128 v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  if (qword_10003D620 != -1)
    swift_once(&qword_10003D620, sub_10002F994);
  v0 = qword_10003E368;
  v1 = *(_QWORD *)(qword_10003E368 + 16);
  if (v1)
  {
    swift_bridgeObjectRetain(qword_10003E368);
    for (i = 0; i != v1; ++i)
    {
      v8 = *(_OWORD *)(v0 + 16 * i + 32);
      v6 = *(_QWORD *)(v0 + 16 * i + 32);
      if (swift_conformsToProtocol2(v6, &protocol descriptor for StartOnFirstMessage))
        v7 = v6;
      else
        v7 = 0;
      if (!v7)
      {
        if ((swift_isUniquelyReferenced_nonNull_native(_swiftEmptyArrayStorage) & 1) == 0)
          sub_100028B78(0, _swiftEmptyArrayStorage[2] + 1, 1);
        v3 = v8;
        v5 = _swiftEmptyArrayStorage[2];
        v4 = _swiftEmptyArrayStorage[3];
        if (v5 >= v4 >> 1)
        {
          sub_100028B78(v4 > 1, v5 + 1, 1);
          v3 = v8;
        }
        _swiftEmptyArrayStorage[2] = v5 + 1;
        *(_OWORD *)&_swiftEmptyArrayStorage[2 * v5 + 4] = v3;
      }
    }
    swift_bridgeObjectRelease(v0);
  }
  qword_10003E378 = (uint64_t)_swiftEmptyArrayStorage;
}

uint64_t sub_100030444(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

void sub_100030568(id a1)
{
  NSMutableSet *v1;
  void *v2;

  v1 = objc_opt_new(NSMutableSet);
  v2 = (void *)qword_10003EC80;
  qword_10003EC80 = (uint64_t)v1;

}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setExecutionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExecutionBlock:");
}
