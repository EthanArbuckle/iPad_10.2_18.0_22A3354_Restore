id DatabaseManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

id DatabaseManager.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "init");
}

id DatabaseManager.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100001AE0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100001BB0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1000026F4((uint64_t)v12, *a3);
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
      sub_1000026F4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_1000026D4(v12);
  return v7;
}

uint64_t sub_100001BB0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_100001D68(a5, a6);
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

uint64_t sub_100001D68(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100001DFC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100001FD0(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100001FD0(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100001DFC(uint64_t a1, unint64_t a2)
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
      v5 = sub_100001F70(v4, 0);
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

_QWORD *sub_100001F70(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return &_swiftEmptyArrayStorage;
  sub_100002730();
  v4 = (_QWORD *)swift_allocObject();
  v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100001FD0(char a1, int64_t a2, char a3, char *a4)
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
    sub_100002730();
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)&_swiftEmptyArrayStorage;
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
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v10;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100002118(uint64_t a1, uint64_t a2)
{
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;

  v26 = a1;
  v3 = type metadata accessor for Database.VacuumMode(0);
  v30 = *(_QWORD *)(v3 - 8);
  v31 = v3;
  __chkstk_darwin();
  v29 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for Database.CacheSize(0);
  v27 = *(_QWORD *)(v5 - 8);
  v28 = v5;
  __chkstk_darwin();
  v25 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = type metadata accessor for Database.RecoveryMode(0);
  v7 = *(_QWORD *)(v24 - 8);
  __chkstk_darwin();
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Database.JournalingMode(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin();
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for Database.Location(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin();
  v17 = (uint64_t *)((char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  v23 = type metadata accessor for Database(0);
  *v17 = v26;
  v17[1] = a2;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v15 + 104))(v17, enum case for Database.Location.path(_:), v14);
  (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v13, enum case for Database.JournalingMode.wal(_:), v10);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, enum case for Database.RecoveryMode.throw(_:), v24);
  v18 = v25;
  (*(void (**)(char *, _QWORD, uint64_t))(v27 + 104))(v25, enum case for Database.CacheSize.default(_:), v28);
  v19 = v29;
  (*(void (**)(char *, _QWORD, uint64_t))(v30 + 104))(v29, enum case for Database.VacuumMode.none(_:), v31);
  swift_bridgeObjectRetain(a2);
  v33 = 0;
  v20 = v32;
  result = Database.__allocating_init(location:journalingMode:recoveryMode:cacheSize:vacuumMode:shouldTakeRBAssertion:busyTimeout:)(v17, v13, v9, v18, v19, 1, 1000);
  if (!v20)
  {
    v22 = result;
    Database.checkpoint()();
    return swift_release(v22);
  }
  return result;
}

uint64_t _s25StocksDiagnosticExtension15DatabaseManagerC10checkpointyyF_0()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
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

  if (qword_1000083C0 != -1)
    swift_once(&qword_1000083C0, sub_100002788);
  v0 = type metadata accessor for Logger(0);
  v1 = sub_100002668(v0, (uint64_t)qword_100008430);
  v2 = Logger.logObject.getter(v1);
  v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Performing checkpoint operation on databases", v4, 2u);
    swift_slowDealloc(v4, -1, -1);
  }

  v5 = static Caches.Default.location.getter();
  v7 = v6;
  sub_100002118(v5, v6);
  v8 = swift_bridgeObjectRelease(v7);
  v9 = static Caches.Shared.location.getter(v8);
  v11 = v10;
  sub_100002118(v9, v10);
  v12 = swift_bridgeObjectRelease(v11);
  v13 = static Caches.Charts.location.getter(v12);
  v15 = v14;
  sub_100002118(v13, v14);
  return swift_bridgeObjectRelease(v15);
}

uint64_t type metadata accessor for DatabaseManager()
{
  return objc_opt_self(SDEDatabaseManager);
}

uint64_t sub_100002668(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_100002680()
{
  unint64_t result;
  void *v1;

  result = qword_1000083F0;
  if (!qword_1000083F0)
  {
    v1 = &protocol descriptor for Error;
    result = swift_getExistentialTypeMetadata(1, 0, 1, &v1);
    atomic_store(result, (unint64_t *)&qword_1000083F0);
  }
  return result;
}

uint64_t sub_1000026D4(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1000026F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_100002730()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1000083F8)
  {
    v0 = type metadata accessor for _ContiguousArrayStorage(0, &type metadata for UInt8);
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1000083F8);
  }
}

uint64_t sub_100002788()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100002804(v0, qword_100008430);
  sub_100002668(v0, (uint64_t)qword_100008430);
  return Logger.init(subsystem:category:)(0xD000000000000010, 0x8000000100003C70, 0x74736F6E67616944, 0xEB00000000736369);
}

uint64_t *sub_100002804(uint64_t a1, uint64_t *a2)
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

uint64_t sub_1000028C0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;

  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = URL.appendingPathComponent(_:)(*a1, a1[1]);
  v9 = URL.path.getter(v8);
  v11 = v10;
  result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  *a2 = v9;
  a2[1] = v11;
  return result;
}

unint64_t *sub_100002970(void (*a1)(_QWORD *__return_ptr, _QWORD *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  unint64_t *v6;
  uint64_t *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t *v14;
  _QWORD v17[2];
  _QWORD v18[2];
  unint64_t *v19;

  v4 = v3;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (v5)
  {
    v19 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_100002B98(0, v5, 0);
    v6 = (unint64_t *)&_swiftEmptyArrayStorage;
    v8 = (uint64_t *)(a3 + 40);
    while (1)
    {
      v9 = *v8;
      v17[0] = *(v8 - 1);
      v17[1] = v9;
      swift_bridgeObjectRetain(v9);
      a1(v18, v17);
      if (v4)
        break;
      v4 = 0;
      swift_bridgeObjectRelease(v9);
      v11 = v18[0];
      v10 = v18[1];
      v19 = v6;
      v13 = v6[2];
      v12 = v6[3];
      if (v13 >= v12 >> 1)
      {
        sub_100002B98(v12 > 1, v13 + 1, 1);
        v6 = v19;
      }
      v8 += 2;
      v6[2] = v13 + 1;
      v14 = &v6[2 * v13];
      v14[4] = v11;
      v14[5] = v10;
      if (!--v5)
        return v6;
    }
    swift_release(v6);
    swift_bridgeObjectRelease(v9);
  }
  return v6;
}

char *sub_100002A90(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
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
      sub_100003214();
      v10 = (char *)swift_allocObject();
      v11 = j__malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      *((_QWORD *)v10 + 2) = v8;
      *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
      v13 = v10 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (char *)&_swiftEmptyArrayStorage;
      v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32])
          memmove(v13, a4 + 32, 16 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100002F5C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100002B98(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_100002BB4(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_100002BB4(char a1, int64_t a2, char a3, char *a4)
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
    sub_100003214();
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)&_swiftEmptyArrayStorage;
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
    swift_arrayInitWithCopy(v13);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v10;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

unint64_t *sub_100002D18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  void (*v8)(_BYTE *, uint64_t);
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSString v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  unint64_t *v18;
  id v19;
  uint64_t v20;
  _BYTE v22[16];
  id v23;

  v0 = type metadata accessor for URL(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  v4 = &v22[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v2);
  v6 = &v22[-v5];
  type metadata accessor for AppGroup(0);
  v7 = static AppGroup.stocks.getter();
  AppGroup.containerURL.getter();
  swift_release(v7);
  URL.appendingPathComponent(_:)(0x74736F6E67616964, 0xEB00000000736369);
  v8 = *(void (**)(_BYTE *, uint64_t))(v1 + 8);
  v8(v4, v0);
  v9 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  URL.path.getter(v9);
  v11 = v10;
  v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  v23 = 0;
  v13 = objc_msgSend(v9, "contentsOfDirectoryAtPath:error:", v12, &v23);

  v14 = v23;
  if (v13)
  {
    v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v13, &type metadata for String);
    v16 = v14;

    __chkstk_darwin(v17);
    *(_QWORD *)&v22[-16] = v6;
    v18 = sub_100002970((void (*)(_QWORD *__return_ptr, _QWORD *))sub_100003268, (uint64_t)&v22[-32], v15);
    v8(v6, v0);
    swift_bridgeObjectRelease(v15);
  }
  else
  {
    v19 = v23;
    v20 = _convertNSErrorToError(_:)(v14);

    swift_willThrow();
    swift_errorRelease(v20);
    v8(v6, v0);
    return (unint64_t *)&_swiftEmptyArrayStorage;
  }
  return v18;
}

uint64_t sub_100002F5C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

char *_s25StocksDiagnosticExtension0B12FileProviderC5filesSaySSGyF_0()
{
  uint64_t v0;
  unint64_t v1;
  char *v2;
  unint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  int64_t v13;
  uint64_t v14;
  char *isUniquelyReferenced_nonNull_native;
  int64_t v16;
  char *v17;
  unint64_t v18;
  char *v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  uint64_t v24;

  v3 = sub_100002D18();
  v4 = static Caches.Default.location.getter();
  v6 = v5;
  v7 = static Caches.Shared.location.getter(v4);
  v9 = v8;
  v10 = static Caches.Charts.location.getter(v7);
  v12 = v3[2];
  v13 = v12 + 3;
  if (__OFADD__(v12, 3))
  {
    __break(1u);
LABEL_15:
    v2 = sub_100002A90((char *)(v1 > 1), v12, 1, v2);
    goto LABEL_9;
  }
  v0 = v11;
  v24 = v10;
  v14 = swift_bridgeObjectRetain(v3);
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native(v14);
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || (v2 = (char *)v3, v13 > (uint64_t)(v3[3] >> 1)))
  {
    if (v12 <= v13)
      v16 = v12 + 3;
    else
      v16 = v12;
    v2 = sub_100002A90(isUniquelyReferenced_nonNull_native, v16, 1, (char *)v3);
  }
  v13 = *((_QWORD *)v2 + 2);
  v1 = *((_QWORD *)v2 + 3);
  v12 = v13 + 1;
  swift_bridgeObjectRetain(v6);
  if (v13 >= v1 >> 1)
    goto LABEL_15;
LABEL_9:
  *((_QWORD *)v2 + 2) = v12;
  v17 = &v2[16 * v13];
  *((_QWORD *)v17 + 4) = v4;
  *((_QWORD *)v17 + 5) = v6;
  v18 = *((_QWORD *)v2 + 3);
  swift_bridgeObjectRetain(v9);
  if (v12 >= v18 >> 1)
    v2 = sub_100002A90((char *)(v18 > 1), v13 + 2, 1, v2);
  *((_QWORD *)v2 + 2) = v13 + 2;
  v19 = &v2[16 * v12];
  *((_QWORD *)v19 + 4) = v7;
  *((_QWORD *)v19 + 5) = v9;
  v21 = *((_QWORD *)v2 + 2);
  v20 = *((_QWORD *)v2 + 3);
  swift_bridgeObjectRetain(v0);
  if (v21 >= v20 >> 1)
    v2 = sub_100002A90((char *)(v20 > 1), v21 + 1, 1, v2);
  *((_QWORD *)v2 + 2) = v21 + 1;
  v22 = &v2[16 * v21];
  *((_QWORD *)v22 + 4) = v24;
  *((_QWORD *)v22 + 5) = v0;
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v0);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v6);
  return v2;
}

uint64_t type metadata accessor for DiagnosticFileProvider()
{
  return objc_opt_self(SDEDiagnosticFileProvider);
}

void sub_100003214()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_100008428)
  {
    v0 = type metadata accessor for _ContiguousArrayStorage(0, &type metadata for String);
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_100008428);
  }
}

uint64_t sub_100003268@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_1000028C0(a1, a2);
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_attachmentWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachmentWithPath:");
}

id objc_msgSend_checkpoint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkpoint");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_databaseManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "databaseManager");
}

id objc_msgSend_fileProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileProvider");
}

id objc_msgSend_files(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "files");
}
