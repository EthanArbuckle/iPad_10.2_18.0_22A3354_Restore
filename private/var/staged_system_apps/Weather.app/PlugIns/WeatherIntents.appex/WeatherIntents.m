uint64_t LocationSearchCompleter.onUpdate.getter()
{
  return sub_10000528C(&OBJC_IVAR____TtC14WeatherIntents23LocationSearchCompleter_onUpdate, (void (*)(_QWORD, _QWORD))sub_100005208);
}

uint64_t sub_100005208(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

uint64_t LocationSearchCompleter.onUpdate.setter(uint64_t a1, uint64_t a2)
{
  return sub_1000052FC(a1, a2, &OBJC_IVAR____TtC14WeatherIntents23LocationSearchCompleter_onUpdate, sub_10000522C);
}

uint64_t sub_10000522C(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

void LocationSearchCompleter.onUpdate.modify(uint64_t a1)
{
  uint64_t v1;

  sub_1000064C4(v1 + OBJC_IVAR____TtC14WeatherIntents23LocationSearchCompleter_onUpdate, a1, 33);
  sub_1000064E0();
}

uint64_t LocationSearchCompleter.onError.getter()
{
  return sub_10000528C(&OBJC_IVAR____TtC14WeatherIntents23LocationSearchCompleter_onError, (void (*)(_QWORD, _QWORD))sub_1000064B8);
}

uint64_t sub_10000528C(_QWORD *a1, void (*a2)(_QWORD, _QWORD))
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  _BYTE v7[24];

  v4 = (_QWORD *)(v2 + *a1);
  sub_1000064C4((uint64_t)v4, (uint64_t)v7, 0);
  v5 = *v4;
  a2(*v4, v4[1]);
  return v5;
}

uint64_t LocationSearchCompleter.onError.setter(uint64_t a1, uint64_t a2)
{
  return sub_1000052FC(a1, a2, &OBJC_IVAR____TtC14WeatherIntents23LocationSearchCompleter_onError, sub_1000064BC);
}

uint64_t sub_1000052FC(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v12[24];

  v8 = (uint64_t *)(v4 + *a3);
  sub_1000064C4((uint64_t)v8, (uint64_t)v12, 1);
  v9 = *v8;
  v10 = v8[1];
  *v8 = a1;
  v8[1] = a2;
  return a4(v9, v10);
}

void LocationSearchCompleter.onError.modify(uint64_t a1)
{
  uint64_t v1;

  sub_1000064C4(v1 + OBJC_IVAR____TtC14WeatherIntents23LocationSearchCompleter_onError, a1, 33);
  sub_1000064E0();
}

char *LocationSearchCompleter.__allocating_init(searchCompleter:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return LocationSearchCompleter.init(searchCompleter:)(a1);
}

char *LocationSearchCompleter.init(searchCompleter:)(void *a1)
{
  char *v1;
  objc_class *ObjectType;
  char *v4;
  char *v5;
  id v6;
  char *v7;
  void *v8;
  char *v9;
  char *v10;
  id v11;
  objc_super v13;

  ObjectType = (objc_class *)swift_getObjectType(v1);
  v4 = &v1[OBJC_IVAR____TtC14WeatherIntents23LocationSearchCompleter_onUpdate];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = &v1[OBJC_IVAR____TtC14WeatherIntents23LocationSearchCompleter_onError];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC14WeatherIntents23LocationSearchCompleter_searchCompleter] = a1;
  v13.receiver = v1;
  v13.super_class = ObjectType;
  v6 = a1;
  v7 = (char *)objc_msgSendSuper2(&v13, "init");
  v8 = *(void **)&v7[OBJC_IVAR____TtC14WeatherIntents23LocationSearchCompleter_searchCompleter];
  v9 = v7;
  objc_msgSend(v8, "wi_applyLocalitiesAndLandmarksFilterType", v13.receiver, v13.super_class);
  v10 = v9;
  v11 = v8;
  objc_msgSend(v11, "setDelegate:", v10);

  return v10;
}

Swift::Void __swiftcall LocationSearchCompleter.searchLocations(for:)(Swift::String a1)
{
  uint64_t v1;
  void *object;
  uint64_t countAndFlagsBits;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v10;
  NSString v11;

  object = a1._object;
  countAndFlagsBits = a1._countAndFlagsBits;
  v4 = *(void **)(v1 + OBJC_IVAR____TtC14WeatherIntents23LocationSearchCompleter_searchCompleter);
  v5 = objc_msgSend(v4, "queryFragment");
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  v8 = v7;

  if (v6 == countAndFlagsBits && v8 == object)
  {
    swift_bridgeObjectRelease(object);
  }
  else
  {
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v6, v8, countAndFlagsBits, object, 0);
    swift_bridgeObjectRelease(v8);
    if ((v10 & 1) == 0)
    {
      v11 = String._bridgeToObjectiveC()();
      objc_msgSend(v4, "setQueryFragment:", v11);

      return;
    }
  }
  _s14WeatherIntents23LocationSearchCompleterC25completerDidUpdateResultsyySo07MKLocaldE0CF_0();
}

uint64_t _s14WeatherIntents23LocationSearchCompleterC25completerDidUpdateResultsyySo07MKLocaldE0CF_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  void (*v3)(uint64_t);
  uint64_t v4;
  void *v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  _BYTE v9[24];

  v1 = v0 + OBJC_IVAR____TtC14WeatherIntents23LocationSearchCompleter_onUpdate;
  result = swift_beginAccess(v0 + OBJC_IVAR____TtC14WeatherIntents23LocationSearchCompleter_onUpdate, v9, 0, 0);
  v3 = *(void (**)(uint64_t))v1;
  if (*(_QWORD *)v1)
  {
    v4 = *(_QWORD *)(v1 + 8);
    v5 = *(void **)(v0 + OBJC_IVAR____TtC14WeatherIntents23LocationSearchCompleter_searchCompleter);
    swift_retain(v4);
    v6 = objc_msgSend(v5, "results");
    v7 = sub_10000647C();
    v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v6, v7);

    v3(v8);
    sub_10000522C((uint64_t)v3, v4);
    return swift_bridgeObjectRelease(v8);
  }
  return result;
}

id LocationSearchCompleter.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

void LocationSearchCompleter.init()()
{
  _swift_stdlib_reportUnimplementedInitializer("WeatherIntents.LocationSearchCompleter", 38, "init()", 6, 0);
  __break(1u);
}

id LocationSearchCompleter.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t LocationSearchCompleter.completer(_:didFailWithError:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t result;
  void (*v30)(uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37[3];

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin();
  v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.intents.getter(v6);
  v9 = v2;
  sub_1000064E8();
  v10 = (char *)v9;
  v11 = sub_1000064E8();
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.error.getter();
  v14 = v13;
  if (os_log_type_enabled(v12, v13))
  {
    v15 = swift_slowAlloc(32, -1);
    v35 = v5;
    v16 = v15;
    v17 = swift_slowAlloc(64, -1);
    v34 = v17;
    *(_DWORD *)v16 = 141558531;
    v36 = 1752392040;
    v37[0] = v17;
    HIDWORD(v32) = v14;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, v37, v16 + 4, v16 + 12);
    *(_WORD *)(v16 + 12) = 2085;
    v18 = objc_msgSend(*(id *)&v10[OBJC_IVAR____TtC14WeatherIntents23LocationSearchCompleter_searchCompleter], "queryFragment");
    v33 = v4;
    v19 = v18;
    v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
    v22 = v21;

    v36 = sub_100005B8C(v20, v22, v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, v37, v16 + 14, v16 + 22);

    swift_bridgeObjectRelease(v22);
    *(_WORD *)(v16 + 22) = 2082;
    v36 = a2;
    sub_1000064E8();
    v23 = sub_1000062F4(&qword_1000193F0);
    v24 = String.init<A>(describing:)(&v36, v23);
    v26 = v25;
    v36 = sub_100005B8C(v24, v25, v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, v37, v16 + 24, v16 + 32);
    swift_bridgeObjectRelease(v26);
    sub_1000064CC();
    sub_1000064CC();
    _os_log_impl((void *)&_mh_execute_header, v12, BYTE4(v32), "Received an error while requesting a local search completion. searchQuery=%{sensitive,mask.hash}s, error=%{public}s", (uint8_t *)v16, 0x20u);
    v27 = v34;
    swift_arrayDestroy(v34, 2, (char *)&type metadata for Any + 8);
    sub_1000064D4(v27);
    sub_1000064D4(v16);

    (*(void (**)(char *, uint64_t))(v35 + 8))(v8, v33);
  }
  else
  {

    sub_1000064CC();
    sub_1000064CC();

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  v28 = &v10[OBJC_IVAR____TtC14WeatherIntents23LocationSearchCompleter_onError];
  result = sub_1000064C4((uint64_t)&v10[OBJC_IVAR____TtC14WeatherIntents23LocationSearchCompleter_onError], (uint64_t)v37, 0);
  v30 = *(void (**)(uint64_t))v28;
  if (*(_QWORD *)v28)
  {
    v31 = *((_QWORD *)v28 + 1);
    swift_retain(v31);
    v30(a2);
    return sub_10000522C((uint64_t)v30, v31);
  }
  return result;
}

uint64_t variable initialization expression of LocalSearchRequestManager.geocodeRequestDeduper()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;
  void *v9;

  v0 = type metadata accessor for PromiseDeduperFlags(0);
  __chkstk_darwin();
  v2 = (char *)&v8 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = &_swiftEmptyArrayStorage;
  v3 = sub_100006334();
  v4 = sub_1000062F4(&qword_100019400);
  v5 = sub_100006374();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v9, v4, v5, v0, v3);
  v6 = sub_1000062F4(&qword_100019410);
  swift_allocObject(v6, *(unsigned int *)(v6 + 48), *(unsigned __int16 *)(v6 + 52));
  return PromiseDeduper.init(options:)(v2);
}

double variable initialization expression of LocalSearchRequestManager.$__lazy_storage_$_store@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)&result = 1;
  *(_OWORD *)(a1 + 24) = xmmword_1000118D0;
  return result;
}

uint64_t variable initialization expression of WeatherIntentResponse.code()
{
  return 0;
}

uint64_t sub_100005B8C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  void *ObjectType;

  v6 = sub_100005C5C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_10000643C((uint64_t)v12, *a3);
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
      sub_10000643C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10000641C(v12);
  return v7;
}

_QWORD *sub_100005C5C(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  _QWORD *result;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_100005DB0((char *)__src, HIBYTE(a6) & 0xF, __dst);
      UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_100005E74(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = _StringObject.sharedUTF8.getter(a5, a6);
    if (!v8)
    {
      result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return (_QWORD *)swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
}

void *sub_100005DB0(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) != 0)
  {
    result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory with negative count", 60, 2, "Swift/UnsafeRawPointer.swift", 28, 2, 1170, 0);
  }
  else
  {
    if (&__dst[__n] <= __src || &__src[__n] <= __dst)
      return memcpy(__dst, __src, __n);
    result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, 2, 1173, 0);
  }
  __break(1u);
  return result;
}

_QWORD *sub_100005E74(uint64_t a1, unint64_t a2)
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_100005F08(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1000060DC(0, v2[2] + 1, 1, (uint64_t)v2);
  v4 = v2[2];
  v3 = v2[3];
  if (v4 >= v3 >> 1)
    v2 = sub_1000060DC((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  v2[2] = v4 + 1;
  *((_BYTE *)v2 + v4 + 32) = 0;
  return v2;
}

_QWORD *sub_100005F08(uint64_t a1, unint64_t a2)
{
  Swift::Int v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v4 = String.UTF8View._foreignCount()();
    if (v4)
      goto LABEL_6;
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v4)
    return &_swiftEmptyArrayStorage;
LABEL_6:
  v5 = sub_100006078(v4, 0);
  if (v4 < 0)
  {
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, 2, 71, 0);
    __break(1u);
    goto LABEL_14;
  }
  v6 = v5;
  v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
  if ((v8 & 1) != 0)
  {
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    goto LABEL_15;
  }
  if (v7 == v4)
    return v6;
  result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, 2, 1122, 0);
LABEL_15:
  __break(1u);
  return result;
}

_QWORD *sub_100006078(uint64_t a1, uint64_t a2)
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
  v4 = sub_1000062F4(&qword_1000194A0);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_1000060DC(char *result, int64_t a2, char a3, uint64_t a4)
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
    v10 = sub_1000062F4(&qword_1000194A0);
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
  v14 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_100006274(v14, v8, v13);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1000061B0(v14, v8, v13);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

void *sub_1000061B0(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) != 0)
  {
    result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
  }
  else
  {
    if (&__dst[__n] <= __src || &__src[__n] <= __dst)
      return memcpy(__dst, __src, __n);
    result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  }
  __break(1u);
  return result;
}

char *sub_100006274(char *__src, size_t __len, char *__dst)
{
  char v4;

  if ((__len & 0x8000000000000000) != 0)
  {
    v4 = 2;
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v4, 1046, 0);
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_1000062F4(uint64_t *a1)
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

unint64_t sub_100006334()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000193F8;
  if (!qword_1000193F8)
  {
    v1 = type metadata accessor for PromiseDeduperFlags(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for PromiseDeduperFlags, v1);
    atomic_store(result, (unint64_t *)&qword_1000193F8);
  }
  return result;
}

unint64_t sub_100006374()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100019408;
  if (!qword_100019408)
  {
    v1 = sub_1000063B8(&qword_100019400);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100019408);
  }
  return result;
}

uint64_t sub_1000063B8(uint64_t *a1)
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

uint64_t type metadata accessor for LocationSearchCompleter()
{
  return objc_opt_self(_TtC14WeatherIntents23LocationSearchCompleter);
}

uint64_t sub_10000641C(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_10000643C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_10000647C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000194A8;
  if (!qword_1000194A8)
  {
    v1 = objc_opt_self(MKLocalSearchCompletion);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000194A8);
  }
  return result;
}

uint64_t sub_1000064C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_beginAccess(a1, a2, a3, 0);
}

uint64_t sub_1000064CC()
{
  uint64_t v0;

  return swift_errorRelease(v0);
}

uint64_t sub_1000064D4(uint64_t a1)
{
  return swift_slowDealloc(a1, -1, -1);
}

uint64_t sub_1000064E8()
{
  uint64_t v0;

  return swift_errorRetain(v0);
}

uint64_t _s14WeatherIntents23LocationSearchCompleterC8onUpdateySaySo07MKLocalD10CompletionCGcSgvpfi_0()
{
  return 0;
}

uint64_t sub_1000064FC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  id v21;
  id v22;
  id v23;
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  double v55;

  v4 = sub_1000062F4(&qword_100019510);
  __chkstk_darwin(v4, v5);
  v7 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1000062F4(&qword_100019518);
  __chkstk_darwin(v8, v9);
  v11 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for TimeZone(0);
  v13 = *(_QWORD *)(v12 - 8);
  v15 = __chkstk_darwin(v12, v14);
  v17 = (char *)&v47 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15, v18);
  v20 = (char *)&v47 - v19;
  v54 = 0.0;
  v55 = 0.0;
  v21 = objc_msgSend(a1, "wi_getCoordinate:", &v54);
  if (!(_DWORD)v21)
  {

LABEL_9:
    v44 = 1;
    goto LABEL_10;
  }
  v22 = sub_100006904((uint64_t)v21, "wi_mapItem");
  v23 = objc_msgSend(v22, "timeZone");

  if (!v23)
  {
    sub_10000690C((uint64_t)v11, 1);
    goto LABEL_8;
  }
  static TimeZone._unconditionallyBridgeFromObjectiveC(_:)(v23);

  v24 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
  v24(v11, v17, v12);
  sub_10000690C((uint64_t)v11, 0);
  if (sub_10000687C((uint64_t)v11, 1, v12) == 1)
  {
LABEL_8:

    sub_10000683C((uint64_t)v11);
    goto LABEL_9;
  }
  v25 = ((uint64_t (*)(char *, char *, uint64_t))v24)(v20, v11, v12);
  v26 = sub_100006904(v25, "wi_mapItem");
  v27 = sub_100006888(v26);
  if (!v28)
  {

    sub_1000068F4();
    goto LABEL_9;
  }
  v29 = v54;
  v30 = v55;
  v52 = v27;
  v53 = v28;
  v31 = CLLocationCoordinate2D.id.getter(v54, v55);
  v50 = v32;
  v51 = v31;
  v33 = (*(uint64_t (**)(char *, char *, uint64_t))(v13 + 16))(v17, v20, v12);
  Date.init()(v33);
  v34 = type metadata accessor for Date(0);
  v35 = sub_100006830((uint64_t)v7, 0, 1, v34);
  v36 = sub_100006904(v35, "title");
  v37 = static String._unconditionallyBridgeFromObjectiveC(_:)(v36);
  v48 = v38;
  v49 = v37;

  v40 = sub_100006904(v39, "subtitle");
  v41 = static String._unconditionallyBridgeFromObjectiveC(_:)(v40);
  v43 = v42;

  Location.init(id:name:timeZone:coordinate:lastRefreshDate:searchTitle:searchSubtitle:preciseName:)(v51, v50, v52, v53, v17, v7, v49, v48, v29, v30, v41, v43, 0, 0);
  sub_1000068F4();
  v44 = 0;
LABEL_10:
  v45 = type metadata accessor for Location(0);
  return sub_100006830(a2, v44, 1, v45);
}

uint64_t sub_100006830(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_10000683C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000062F4(&qword_100019518);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000687C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_100006888(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, "name");

  if (!v2)
    return 0;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);

  return v3;
}

uint64_t sub_1000068F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

id sub_100006904(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t sub_10000690C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100006830(a1, a2, 1, v2);
}

uint64_t *WeatherLocation.currentLocationID.unsafeMutableAddressor()
{
  if (qword_1000193C0 != -1)
    swift_once(&qword_1000193C0, sub_100006998);
  return &static WeatherLocation.currentLocationID;
}

uint64_t *WeatherLocation.alternateCurrentLocationID.unsafeMutableAddressor()
{
  if (qword_1000193C8 != -1)
    swift_once(&qword_1000193C8, sub_1000069D4);
  return &static WeatherLocation.alternateCurrentLocationID;
}

uint64_t sub_100006998()
{
  uint64_t result;
  uint64_t v1;

  result = static Location.currentLocationIntentID.getter();
  static WeatherLocation.currentLocationID = result;
  unk_100019930 = v1;
  return result;
}

uint64_t static WeatherLocation.currentLocationID.getter()
{
  return sub_100006A6C(&qword_1000193C0, &static WeatherLocation.currentLocationID);
}

void sub_1000069D4()
{
  static WeatherLocation.alternateCurrentLocationID = 0x69436C61636F6C5FLL;
  unk_100019940 = 0xEB000000005F7974;
}

uint64_t static WeatherLocation.alternateCurrentLocationID.getter()
{
  return sub_100006A6C(&qword_1000193C8, &static WeatherLocation.alternateCurrentLocationID);
}

uint64_t sub_100006A1C(_QWORD *a1, uint64_t *a2, _QWORD *a3)
{
  uint64_t v5;

  if (*a1 != -1)
    swift_once();
  v5 = *a2;
  swift_bridgeObjectRetain(*a3);
  return v5;
}

uint64_t sub_100006A6C(_QWORD *a1, uint64_t *a2)
{
  return sub_100006A1C(a1, a2, a2 + 1);
}

uint64_t MKPlacemark.safeTitle.getter()
{
  return sub_100006A8C((SEL *)&selRef_title);
}

uint64_t MKPlacemark.safeSubtitle.getter()
{
  return sub_100006A8C((SEL *)&selRef_subtitle);
}

uint64_t sub_100006A8C(SEL *a1)
{
  void *v1;

  if (objc_msgSend(v1, "respondsToSelector:", *a1))
    return sub_100006AD8(v1, a1);
  else
    return 0;
}

uint64_t sub_100006AD8(void *a1, SEL *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(a1, *a2);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);

  return v4;
}

uint64_t sub_100006B34()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for BundleLookup()
{
  return objc_opt_self(_TtC14WeatherIntentsP33_3928C5971172A0B518F45FDC8E5FDA2412BundleLookup);
}

id sub_100006B64()
{
  uint64_t v0;
  uint64_t ObjCClassFromMetadata;
  id result;

  v0 = type metadata accessor for BundleLookup();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v0);
  result = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  qword_100019948 = (uint64_t)result;
  return result;
}

unint64_t static LocalSearchRequestManager.dependencyKey.getter()
{
  return 0xD00000000000001DLL;
}

double sub_100006BD4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double refreshed;
  uint64_t v11;

  v1 = type metadata accessor for AppConfiguration(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1, v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = v0[5];
  v7 = v0[6];
  sub_100008388(v0 + 2, v6);
  v8 = dispatch thunk of AppConfigurationManagerType.appConfiguration.getter(v6, v7);
  refreshed = AppConfiguration.reverseGeocodingRefreshTimeInterval.getter(v8);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  return refreshed;
}

uint64_t sub_100006C84@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  _BYTE v4[24];
  _BYTE v5[24];
  uint64_t v6;
  _BYTE v7[24];

  swift_beginAccess(v1 + 10, v7, 0, 0);
  sub_1000083E4((uint64_t)(v1 + 10), (uint64_t)v5, &qword_1000195B8);
  if (v6 != 1)
    return sub_10000846C((uint64_t)v5, a1);
  sub_1000083AC((uint64_t)v5, &qword_1000195B8);
  sub_100006D50(v1, a1);
  sub_1000083E4(a1, (uint64_t)v5, &qword_100019698);
  swift_beginAccess(v1 + 10, v4, 33, 0);
  sub_100008424((uint64_t)v5, (uint64_t)(v1 + 10));
  return swift_endAccess(v4);
}

uint64_t sub_100006D50@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 v18[16];
  _QWORD v19[3];
  uint64_t v20;
  uint64_t v21;

  v4 = *a1;
  v5 = type metadata accessor for Logger(0);
  v7 = __chkstk_darwin(v5, v6);
  ((void (*)(_QWORD *__return_ptr, uint64_t))a1[15])(v19, v7);
  type metadata accessor for SettingReader(0);
  v8 = static SettingReader.shared.getter();
  v9 = ((uint64_t (*)(void))static Settings.Geocoding.clearGeocodingCacheOnNextLaunch.getter)();
  SettingReader.read<A>(_:)(v18);
  swift_release(v8);
  swift_release(v9);
  v10 = v18[0];
  v11 = v20;
  v12 = v21;
  sub_100008388(v19, v20);
  if (v10 == 1)
  {
    v13 = dispatch thunk of GeocodeStoreType.deleteAllLocations(satisfying:)(static WeatherLocation.supportsSecureCoding.getter, 0, v11, v12);
    v14 = static Settings.Geocoding.clearGeocodingCacheOnNextLaunch.getter(v13);
    v18[0] = 0;
    sub_10000857C(&qword_1000196A8, v15, (uint64_t (*)(uint64_t))type metadata accessor for LocalSearchRequestManager, (uint64_t)&protocol conformance descriptor for LocalSearchRequestManager);
    Updatable.save<A>(setting:value:)(v14, v18, v4, v16);
    swift_release(v14);
  }
  else
  {
    dispatch thunk of GeocodeStoreType.deleteAllLocations(satisfying:)(sub_1000084B4, a1, v11, v12);
  }
  sub_100008500((uint64_t)v19, a2);
  return sub_10000641C(v19);
}

uint64_t static WeatherLocation.supportsSecureCoding.getter()
{
  return 1;
}

BOOL sub_100007060()
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
  char *v13;
  double v15;
  double v16;
  void (*v17)(char *, uint64_t);
  uint64_t v18;

  v0 = sub_1000062F4(&qword_100019510);
  __chkstk_darwin(v0, v1);
  v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for Date(0);
  v5 = *(_QWORD *)(v4 - 8);
  v7 = __chkstk_darwin(v4, v6);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v7, v10);
  v13 = (char *)&v18 - v12;
  Location.lastRefreshDate.getter(v11);
  if (sub_10000687C((uint64_t)v3, 1, v4) == 1)
  {
    sub_1000083AC((uint64_t)v3, &qword_100019510);
    return 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v13, v3, v4);
    v15 = sub_100006BD4();
    Date.init()();
    v16 = Date.timeIntervalSince(_:)(v13);
    v17 = *(void (**)(char *, uint64_t))(v5 + 8);
    v17(v9, v4);
    v17(v13, v4);
    return v15 <= v16;
  }
}

uint64_t LocalSearchRequestManager.__allocating_init(service:store:appConfigurationManager:queue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, uint64_t a6)
{
  return sub_1000071DC(a1, a2, a3, a4, a5, a6, (uint64_t (*)(uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100007E08);
}

uint64_t LocalSearchRequestManager.init(service:store:appConfigurationManager:queue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, uint64_t a6)
{
  return sub_1000071DC(a1, a2, a3, a4, a5, a6, (uint64_t (*)(uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100007F20);
}

uint64_t sub_1000071DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t ObjectType;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v23 = a7;
  ObjectType = swift_getObjectType(a1);
  v15 = a5[3];
  v14 = a5[4];
  v16 = sub_100007EF8((uint64_t)a5, v15);
  __chkstk_darwin(v16, v16);
  v18 = (char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v19 + 16))(v18);
  v20 = v23(a1, a3, a4, v18, a6, v22, ObjectType, v15, a2, v14);
  sub_10000641C(a5);
  return v20;
}

uint64_t LocalSearchRequestManager.performLocalSearch(with:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;

  v5 = *v2;
  v6 = v2[17];
  v7 = (_QWORD *)swift_allocObject(&unk_100014A88, 40, 7);
  v7[2] = a1;
  v7[3] = a2;
  v7[4] = v2;
  type metadata accessor for Location(0);
  sub_10000860C();
  swift_retain(v2);
  v8 = firstly<A, B>(on:disposeOn:closure:)(v6, v2, sub_10000828C, v7, a1, v5);
  swift_release(v7);
  return v8;
}

uint64_t sub_100007368(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD v5[6];
  _QWORD v6[2];

  v6[0] = a2;
  v6[1] = a3;
  v5[2] = a1;
  v5[3] = a2;
  v5[4] = a3;
  v5[5] = a4;
  return PromiseDeduper.promise(key:createBlock:)(v6, sub_1000084B8, v5);
}

uint64_t sub_1000073B4(_QWORD *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
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
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t ObjectType;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  _QWORD v50[3];
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[3];
  uint64_t v54;

  v48 = *a4;
  v49 = a4;
  v7 = sub_1000062F4(&qword_100019690);
  __chkstk_darwin(v7, v8);
  v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Location(0);
  v12 = *(_QWORD *)(v11 - 8);
  v14 = __chkstk_darwin(v11, v13);
  v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14, v17);
  v19 = (char *)&v42 - v18;
  type metadata accessor for SettingReader(0);
  v20 = static SettingReader.shared.getter();
  v21 = static Settings.Geocoding.bypassGeocodingCache.getter();
  SettingReader.read<A>(_:)(v53);
  swift_release(v20);
  v22 = v21;
  v23 = a1;
  swift_release(v22);
  if ((v53[0] & 1) != 0)
    goto LABEL_9;
  v42 = v16;
  v43 = v19;
  v44 = v12;
  v45 = a3;
  v46 = v11;
  v47 = a2;
  sub_100006C84((uint64_t)v53);
  if (!v54)
  {
    sub_1000083AC((uint64_t)v53, &qword_100019698);
    v11 = v46;
    sub_100006830((uint64_t)v10, 1, 1, v46);
    a3 = v45;
    goto LABEL_8;
  }
  sub_100008500((uint64_t)v53, (uint64_t)v50);
  sub_1000083AC((uint64_t)v53, &qword_100019698);
  v24 = a1;
  v26 = v51;
  v25 = v52;
  sub_100008388(v50, v51);
  a3 = v45;
  v27 = v26;
  v23 = v24;
  dispatch thunk of GeocodeStoreType.queryLocation(for:)(v47, v45, v27, v25);
  sub_10000641C(v50);
  v11 = v46;
  if (sub_10000687C((uint64_t)v10, 1, v46) == 1)
  {
LABEL_8:
    sub_1000083AC((uint64_t)v10, &qword_100019690);
    a2 = v47;
    goto LABEL_9;
  }
  v28 = v43;
  v29 = v44;
  (*(void (**)(char *, char *, uint64_t))(v44 + 32))(v43, v10, v11);
  if (!sub_100007060())
  {
    v40 = v42;
    (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v42, v28, v11);
    v41 = sub_1000062F4(&qword_1000196A0);
    swift_allocObject(v41, *(unsigned int *)(v41 + 48), *(unsigned __int16 *)(v41 + 52));
    v38 = Promise.init(value:)(v40);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v28, v11);
    return v38;
  }
  sub_100006C84((uint64_t)v53);
  if (v54)
  {
    sub_100008500((uint64_t)v53, (uint64_t)v50);
    sub_1000083AC((uint64_t)v53, &qword_100019698);
    v30 = v51;
    v31 = v52;
    sub_100008388(v50, v51);
    v32 = v31;
    v23 = v24;
    dispatch thunk of GeocodeStoreType.deleteLocation(for:)(v47, a3, v30, v32);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v28, v11);
    sub_10000641C(v50);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v29 + 8))(v28, v11);
    sub_1000083AC((uint64_t)v53, &qword_100019698);
  }
  v11 = v46;
  a2 = v47;
  a3 = v45;
LABEL_9:
  v33 = v23[8];
  ObjectType = swift_getObjectType(v23[7]);
  v35 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v33 + 8))(a2, a3, ObjectType, v33);
  v36 = v23[17];
  v37 = swift_allocObject(&unk_100014B18, 32, 7);
  *(_QWORD *)(v37 + 16) = a2;
  *(_QWORD *)(v37 + 24) = a3;
  swift_bridgeObjectRetain(a3);
  v38 = Promise.then<A, B>(on:disposeOn:closure:)(v36, v49, sub_1000085F8, v37, v11, v48);
  swift_release(v35);
  swift_release(v37);
  return v38;
}

uint64_t LocalSearchRequestManager.performLocalSearch(with:calloutTitle:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;

  v7 = *v3;
  v8 = v3[17];
  v9 = (_QWORD *)swift_allocObject(&unk_100014AB0, 48, 7);
  v9[2] = a2;
  v9[3] = a3;
  v9[4] = a1;
  v9[5] = v3;
  type metadata accessor for Location(0);
  sub_10000860C();
  v10 = a1;
  swift_retain(v3);
  v11 = firstly<A, B>(on:disposeOn:closure:)(v8, v3, sub_1000082D8, v9, a2, v7);
  swift_release(v9);
  return v11;
}

uint64_t sub_100007800(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[8];
  _QWORD v7[2];

  v7[0] = a2;
  v7[1] = a3;
  v6[2] = a2;
  v6[3] = a3;
  v6[4] = a1;
  v6[5] = a4;
  v6[6] = a5;
  return PromiseDeduper.promise(key:createBlock:)(v7, sub_100008340, v6);
}

uint64_t sub_100007850(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t ObjectType;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  _QWORD v51[3];
  uint64_t v52;
  uint64_t v53;
  _QWORD v54[3];
  uint64_t v55;

  v48 = a4;
  v49 = a5;
  v50 = *a5;
  v8 = sub_1000062F4(&qword_100019690);
  __chkstk_darwin(v8, v9);
  v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Location(0);
  v13 = *(_QWORD *)(v12 - 8);
  v15 = __chkstk_darwin(v12, v14);
  v17 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15, v18);
  v20 = (char *)&v42 - v19;
  type metadata accessor for SettingReader(0);
  v21 = static SettingReader.shared.getter();
  v22 = static Settings.Geocoding.bypassGeocodingCache.getter();
  SettingReader.read<A>(_:)(v54);
  swift_release(v21);
  v23 = v22;
  v24 = v50;
  swift_release(v23);
  if ((v54[0] & 1) != 0)
    goto LABEL_9;
  v42 = v17;
  v43 = v20;
  v44 = v13;
  v45 = a2;
  v46 = v12;
  v47 = a1;
  v25 = v24;
  sub_100006C84((uint64_t)v54);
  if (!v55)
  {
    sub_1000083AC((uint64_t)v54, &qword_100019698);
    v12 = v46;
    sub_100006830((uint64_t)v11, 1, 1, v46);
    a2 = v45;
    goto LABEL_8;
  }
  sub_100008500((uint64_t)v54, (uint64_t)v51);
  sub_1000083AC((uint64_t)v54, &qword_100019698);
  v27 = v52;
  v26 = v53;
  sub_100008388(v51, v52);
  a2 = v45;
  dispatch thunk of GeocodeStoreType.queryLocation(for:)(v47, v45, v27, v26);
  sub_10000641C(v51);
  v12 = v46;
  if (sub_10000687C((uint64_t)v11, 1, v46) == 1)
  {
LABEL_8:
    sub_1000083AC((uint64_t)v11, &qword_100019690);
    v24 = v25;
    a1 = v47;
    goto LABEL_9;
  }
  v29 = v43;
  v28 = v44;
  (*(void (**)(char *, char *, uint64_t))(v44 + 32))(v43, v11, v12);
  if (!sub_100007060())
  {
    v40 = v42;
    (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v42, v29, v12);
    v41 = sub_1000062F4(&qword_1000196A0);
    swift_allocObject(v41, *(unsigned int *)(v41 + 48), *(unsigned __int16 *)(v41 + 52));
    v38 = Promise.init(value:)(v40);
    (*(void (**)(char *, uint64_t))(v28 + 8))(v29, v12);
    return v38;
  }
  sub_100006C84((uint64_t)v54);
  v30 = a3;
  if (v55)
  {
    sub_100008500((uint64_t)v54, (uint64_t)v51);
    sub_1000083AC((uint64_t)v54, &qword_100019698);
    v31 = v52;
    v32 = v53;
    sub_100008388(v51, v52);
    dispatch thunk of GeocodeStoreType.deleteLocation(for:)(v47, a2, v31, v32);
    (*(void (**)(char *, uint64_t))(v28 + 8))(v29, v12);
    sub_10000641C(v51);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v28 + 8))(v29, v12);
    sub_1000083AC((uint64_t)v54, &qword_100019698);
  }
  v24 = v25;
  v12 = v46;
  a1 = v47;
  a2 = v45;
  a3 = v30;
LABEL_9:
  v33 = a3[8];
  ObjectType = swift_getObjectType(a3[7]);
  v35 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v33 + 16))(v48, a1, a2, ObjectType, v33);
  v36 = a3[17];
  v37 = swift_allocObject(&unk_100014AF0, 32, 7);
  *(_QWORD *)(v37 + 16) = a1;
  *(_QWORD *)(v37 + 24) = a2;
  swift_bridgeObjectRetain(a2);
  v38 = Promise.then<A, B>(on:disposeOn:closure:)(v36, v49, sub_100008370, v37, v12, v24);
  swift_release(v35);
  swift_release(v37);
  return v38;
}

uint64_t sub_100007C08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[3];
  uint64_t v18;
  uint64_t v19;
  _BYTE v20[24];
  uint64_t v21;
  uint64_t v22;

  v8 = type metadata accessor for Location(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100006C84((uint64_t)v20);
  if (v21)
  {
    sub_100008500((uint64_t)v20, (uint64_t)v17);
    sub_1000083AC((uint64_t)v20, &qword_100019698);
    v22 = v4;
    v13 = v18;
    v14 = v19;
    sub_100008388(v17, v18);
    dispatch thunk of GeocodeStoreType.saveLocation(_:for:)(a1, a3, a4, v13, v14);
    sub_10000641C(v17);
  }
  else
  {
    sub_1000083AC((uint64_t)v20, &qword_100019698);
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a1, v8);
  v15 = sub_1000062F4(&qword_1000196A0);
  swift_allocObject(v15, *(unsigned int *)(v15 + 48), *(unsigned __int16 *)(v15 + 52));
  return Promise.init(value:)(v12);
}

uint64_t LocalSearchRequestManager.deinit()
{
  uint64_t v0;

  sub_10000641C((_QWORD *)(v0 + 16));
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 56));
  swift_release(*(_QWORD *)(v0 + 72));
  sub_1000083AC(v0 + 80, &qword_1000195B8);
  swift_release(*(_QWORD *)(v0 + 128));

  return v0;
}

uint64_t LocalSearchRequestManager.__deallocating_deinit()
{
  uint64_t v0;

  LocalSearchRequestManager.deinit();
  return swift_deallocClassInstance(v0, 144, 7);
}

uint64_t sub_100007DB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  return Updatable.save<A>(setting:value:)(a1, a2, *v6, a6);
}

uint64_t sub_100007DC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  return Updatable.reset<A>(setting:)(a1, *v5, a5);
}

uint64_t sub_100007DD0(uint64_t a1)
{
  _QWORD *v1;

  return Updatable.apply(preset:)(a1, *v1);
}

uint64_t sub_100007DD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  return Configurable.setting<A>(_:)(a1, *v5, a5);
}

uint64_t sub_100007DE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  return Configurable.setting<A>(_:defaultValue:)(a1, a2, *v6, a6);
}

uint64_t sub_100007DF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  return Configurable.setting<A>(_:_:)(a1, a2, a3, *v7, a7);
}

uint64_t sub_100007DFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;

  return Configurable.setting<A>(_:defaultValue:_:)(a1, a2, a3, a4, *v8, a8);
}

uint64_t sub_100007E08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;

  v22 = a5;
  v23 = a7;
  v15 = *(_QWORD *)(a8 - 8);
  __chkstk_darwin(a1, a2);
  v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = swift_allocObject(v18, 144, 7);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, a4, a8);
  v20 = sub_100007F20(a1, a2, a3, (uint64_t)v17, v22, v19, v23, a8, a9, a10);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a4, a8);
  return v20;
}

uint64_t sub_100007EF8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_100007F20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
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
  _QWORD *v28;
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
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  char *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  _QWORD v56[5];

  v53 = a9;
  v54 = a2;
  v16 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v50 = *(_QWORD *)(v16 - 8);
  v51 = v16;
  __chkstk_darwin(v16, v17);
  v52 = (char *)&v47 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v48, v19);
  v49 = (char *)&v47 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v21, v22);
  v47 = (char *)&v47 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = type metadata accessor for PromiseDeduperFlags(0);
  __chkstk_darwin(v24, v25);
  v27 = (char *)&v47 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56[3] = a8;
  v56[4] = a10;
  v28 = sub_1000084C4(v56);
  (*(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(a8 - 8) + 32))(v28, a4, a8);
  v55 = &_swiftEmptyArrayStorage;
  sub_10000857C((unint64_t *)&qword_1000193F8, 255, (uint64_t (*)(uint64_t))&type metadata accessor for PromiseDeduperFlags, (uint64_t)&protocol conformance descriptor for PromiseDeduperFlags);
  v30 = v29;
  v31 = sub_1000062F4(&qword_100019400);
  sub_1000085B8((unint64_t *)&qword_100019408, &qword_100019400);
  v32 = v31;
  v33 = a3;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v55, v32, v34, v24, v30);
  v35 = sub_1000062F4(&qword_100019410);
  swift_allocObject(v35, *(unsigned int *)(v35 + 48), *(unsigned __int16 *)(v35 + 52));
  *(_QWORD *)(a6 + 72) = PromiseDeduper.init(options:)(v27);
  *(_QWORD *)(a6 + 80) = 0;
  *(_QWORD *)(a6 + 88) = 0;
  *(_QWORD *)(a6 + 96) = 0;
  *(_OWORD *)(a6 + 104) = xmmword_1000118D0;
  v36 = v53;
  *(_QWORD *)(a6 + 56) = a1;
  *(_QWORD *)(a6 + 64) = v36;
  *(_QWORD *)(a6 + 120) = v54;
  *(_QWORD *)(a6 + 128) = a3;
  sub_100008500((uint64_t)v56, a6 + 16);
  if (!a5)
  {
    sub_100008540();
    swift_unknownObjectRetain(a1, v37);
    v38 = swift_retain(a3);
    v39 = v47;
    static DispatchQoS.unspecified.getter(v38);
    v55 = &_swiftEmptyArrayStorage;
    sub_10000857C(&qword_1000196B8, 255, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
    v41 = v40;
    v42 = sub_1000062F4(&qword_1000196C0);
    sub_1000085B8(&qword_1000196C8, &qword_1000196C0);
    v43 = v49;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v55, v42, v44, v48, v41);
    v45 = v52;
    (*(void (**)(char *, _QWORD, uint64_t))(v50 + 104))(v52, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v51);
    a5 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD00000000000001DLL, 0x8000000100012130, v39, v43, v45, 0);
    swift_unknownObjectRelease(a1);
    swift_release(v33);
  }
  sub_10000641C(v56);
  *(_QWORD *)(a6 + 136) = a5;
  return a6;
}

uint64_t sub_100008264()
{
  uint64_t v0;

  sub_100008618();
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000828C(uint64_t a1)
{
  uint64_t *v1;

  return sub_100007368(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1000082A8()
{
  uint64_t v0;

  sub_100008618();

  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000082D8(uint64_t a1)
{
  uint64_t *v1;

  return sub_100007800(a1, v1[2], v1[3], v1[4], v1[5]);
}

void sub_1000082F4(uint64_t a1, uint64_t a2)
{
  sub_10000857C(&qword_1000195C0, a2, (uint64_t (*)(uint64_t))type metadata accessor for LocalSearchRequestManager, (uint64_t)&protocol conformance descriptor for LocalSearchRequestManager);
}

uint64_t type metadata accessor for LocalSearchRequestManager()
{
  return objc_opt_self(_TtC14WeatherIntents25LocalSearchRequestManager);
}

uint64_t sub_100008340()
{
  uint64_t v0;

  return sub_100007850(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD **)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD **)(v0 + 48));
}

uint64_t sub_100008350()
{
  uint64_t v0;

  sub_100008618();
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100008370(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100007C08(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

_QWORD *sub_100008388(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

void sub_1000083AC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1000062F4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  sub_1000064E0();
}

void sub_1000083E4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000062F4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  sub_1000064E0();
}

uint64_t sub_100008424(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000062F4(&qword_1000195B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000846C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000062F4(&qword_100019698);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000084B8()
{
  uint64_t v0;

  return sub_1000073B4(*(_QWORD **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD **)(v0 + 40));
}

_QWORD *sub_1000084C4(_QWORD *a1)
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

void sub_100008500(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v2;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v2 - 8))(a2, a1);
  sub_1000064E0();
}

unint64_t sub_100008540()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000196B0;
  if (!qword_1000196B0)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000196B0);
  }
  return result;
}

void sub_10000857C(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v6;

  if (!*a1)
  {
    v6 = a3(a2);
    atomic_store(swift_getWitnessTable(a4, v6), a1);
  }
  sub_1000064E0();
}

void sub_1000085B8(unint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = sub_1000063B8(a2);
    atomic_store(swift_getWitnessTable(&protocol conformance descriptor for [A], v3), a1);
  }
  sub_1000064E0();
}

uint64_t sub_1000085F8(uint64_t a1, uint64_t a2)
{
  return sub_100008370(a1, a2);
}

uint64_t sub_10000860C()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_100008618()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
}

uint64_t sub_100008620@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v12[24];
  _BYTE v13[40];
  __int128 v14;
  uint64_t v15;
  _UNKNOWN **v16;
  _BYTE v17[24];

  v3 = v1 + OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___localSearchManager;
  swift_beginAccess(v1 + OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___localSearchManager, v17, 0, 0);
  sub_10000D484(v3, (uint64_t)&v14, &qword_100019778);
  if (!v15)
  {
    sub_1000083AC((uint64_t)&v14, &qword_100019778);
    v4 = sub_100008770();
    v5 = type metadata accessor for LocalSearchRequestService();
    v6 = (_QWORD *)swift_allocObject(v5, 56, 7);
    v6[5] = type metadata accessor for AppConfigurationManager(0);
    v6[6] = &protocol witness table for AppConfigurationManager;
    v6[2] = v4;
    v7 = sub_100008770();
    v8 = type metadata accessor for LocalSearchRequestManager();
    v9 = swift_allocObject(v8, 144, 7);
    v10 = sub_10000CDCC((uint64_t)v6, (uint64_t)sub_1000087D4, 0, v7, 0, v9);
    v15 = v8;
    v16 = &off_100014AC8;
    *(_QWORD *)&v14 = v10;
    sub_100008500((uint64_t)&v14, (uint64_t)v13);
    swift_beginAccess(v3, v12, 33, 0);
    sub_10000D4B0((uint64_t)v13, v3, &qword_100019778);
    swift_endAccess(v12);
  }
  return sub_10000D46C(&v14, a1);
}

uint64_t sub_100008770()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___appConfigurationManager;
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___appConfigurationManager);
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___appConfigurationManager);
  }
  else
  {
    v3 = sub_100008A78(v0);
    v4 = *(_QWORD *)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v3;
    swift_retain(v3);
    swift_release(v4);
    v2 = 0;
  }
  swift_retain(v2);
  return v3;
}

uint64_t sub_1000087D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  uint64_t *v23;
  _QWORD v24[2];
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;

  v24[0] = a1;
  v1 = type metadata accessor for Database.RecoveryMode(0);
  v28 = *(_QWORD *)(v1 - 8);
  v29 = v1;
  __chkstk_darwin();
  v27 = (char *)v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for Database.JournalingMode(0);
  v25 = *(_QWORD *)(v3 - 8);
  v26 = v3;
  __chkstk_darwin();
  v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Database.VacuumMode(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Database.CacheSize(0);
  __chkstk_darwin();
  v11 = (char *)v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for AssertionOptions(0);
  __chkstk_darwin();
  v13 = (char *)v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Database.Location(0);
  __chkstk_darwin();
  v15 = (char *)v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24[1] = type metadata accessor for Database(0);
  v16 = type metadata accessor for GeocodeStore(0);
  v17 = static GeocodeStore.location.getter();
  v18 = static AssertionOptions.weatherAssertions.getter(v17);
  static GeocodeStore.preferredCacheSize.getter(v18);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, enum case for Database.VacuumMode.incremental(_:), v6);
  (*(void (**)(char *, _QWORD, uint64_t))(v25 + 104))(v5, enum case for Database.JournalingMode.wal(_:), v26);
  v19 = v27;
  (*(void (**)(char *, _QWORD, uint64_t))(v28 + 104))(v27, enum case for Database.RecoveryMode.throw(_:), v29);
  v31 = 1;
  v20 = v30;
  result = Database.init(location:assertions:journalingMode:recoveryMode:preferredCacheSize:vacuumMode:busyTimeout:)(v15, v13, v5, v19, v11, v9, 0x100000000);
  if (!v20)
  {
    v22 = result;
    swift_allocObject(v16, *(unsigned int *)(v16 + 48), *(unsigned __int16 *)(v16 + 52));
    result = GeocodeStore.init(database:)(v22);
    v23 = (uint64_t *)v24[0];
    *(_QWORD *)(v24[0] + 24) = v16;
    v23[4] = (uint64_t)&protocol witness table for GeocodeStore;
    *v23 = result;
  }
  return result;
}

uint64_t sub_100008A78(uint64_t a1)
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
  _QWORD v31[5];
  _QWORD v32[3];
  uint64_t v33;
  void *v34;
  _QWORD v35[5];
  _QWORD v36[3];
  uint64_t v37;
  void *v38;

  v2 = type metadata accessor for URL(0);
  v3 = *(_QWORD *)(v2 - 8);
  v5 = __chkstk_darwin(v2, v4);
  v7 = (char *)v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5, v8);
  v10 = (char *)v31 - v9;
  v11 = type metadata accessor for WeatherConfigurationManager(0);
  type metadata accessor for AppGroup(0);
  v12 = static AppGroup.weather.getter();
  AppGroup.cachesDirectoryURL.getter();
  swift_release(v12);
  URL.appendingPathComponent(_:isDirectory:)(0xD000000000000015, 0x80000001000123F0, 1);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v7, v2);
  v13 = WeatherConfigurationManager.__allocating_init(contentDirectoryURL:)(v10);
  v37 = v11;
  v38 = &protocol witness table for WeatherConfigurationManager;
  v36[0] = v13;
  v14 = type metadata accessor for PermanentURLFactory(0);
  swift_allocObject(v14, *(unsigned int *)(v14 + 48), *(unsigned __int16 *)(v14 + 52));
  v15 = PermanentURLFactory.init()();
  v35[3] = v14;
  v35[4] = &protocol witness table for PermanentURLFactory;
  v35[0] = v15;
  v16 = type metadata accessor for UbiquitousKeyValueStoreProvider(0);
  v17 = static UbiquitousKeyValueStoreProvider.shared.getter();
  v33 = v16;
  v34 = &protocol witness table for UbiquitousKeyValueStoreProvider;
  v32[0] = v17;
  v18 = *(_QWORD *)(a1 + OBJC_IVAR____TtC14WeatherIntents13IntentHandler_iCloudStatusProvider);
  v31[3] = type metadata accessor for iCloudStatusProvider(0);
  v31[4] = &protocol witness table for iCloudStatusProvider;
  v31[0] = v18;
  v19 = type metadata accessor for IdentityService(0);
  swift_allocObject(v19, *(unsigned int *)(v19 + 48), *(unsigned __int16 *)(v19 + 52));
  swift_retain(v18);
  v20 = IdentityService.init(keyValueStoreProvider:iCloudStatusProvider:)(v32, v31);
  v33 = v19;
  v34 = &protocol witness table for IdentityService;
  v32[0] = v20;
  v21 = type metadata accessor for AppConfigurationRemoteSettingsProvider(0);
  swift_allocObject(v21, *(unsigned int *)(v21 + 48), *(unsigned __int16 *)(v21 + 52));
  v22 = AppConfigurationRemoteSettingsProvider.init(identityService:)(v32);
  v33 = v21;
  v34 = &protocol witness table for AppConfigurationRemoteSettingsProvider;
  v32[0] = v22;
  v23 = type metadata accessor for AppConfigurationService(0);
  swift_allocObject(v23, *(unsigned int *)(v23 + 48), *(unsigned __int16 *)(v23 + 52));
  v24 = AppConfigurationService.init(appConfigurationDataService:urlFactory:settingsProvider:)(v36, v35, v32);
  sub_10000D150(&qword_100019780, (uint64_t (*)(uint64_t))&type metadata accessor for AppConfigurationService);
  v26 = v25;
  v27 = type metadata accessor for AppConfigurationStore(0);
  swift_allocObject(v27, *(unsigned int *)(v27 + 48), *(unsigned __int16 *)(v27 + 52));
  v28 = AppConfigurationStore.init()();
  v37 = v27;
  v38 = &protocol witness table for AppConfigurationStore;
  v36[0] = v28;
  v29 = type metadata accessor for AppConfigurationManager(0);
  swift_allocObject(v29, *(unsigned int *)(v29 + 48), *(unsigned __int16 *)(v29 + 52));
  return AppConfigurationManager.init(appConfigurationService:appConfigurationStore:)(v24, v26, v36);
}

uint64_t sub_100008D1C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE v7[24];
  _BYTE v8[40];
  __int128 v9;
  uint64_t v10;
  void *v11;
  _BYTE v12[24];

  v3 = v1 + OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___locationDataModelFactory;
  swift_beginAccess(v1 + OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___locationDataModelFactory, v12, 0, 0);
  sub_10000D484(v3, (uint64_t)&v9, &qword_1000197B0);
  if (!v10)
  {
    sub_1000083AC((uint64_t)&v9, &qword_1000197B0);
    v4 = type metadata accessor for LocationDataModelFactory(0);
    swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
    v5 = LocationDataModelFactory.init()();
    v10 = v4;
    v11 = &protocol witness table for LocationDataModelFactory;
    *(_QWORD *)&v9 = v5;
    sub_100008500((uint64_t)&v9, (uint64_t)v8);
    swift_beginAccess(v3, v7, 33, 0);
    sub_10000D4B0((uint64_t)v8, v3, &qword_1000197B0);
    swift_endAccess(v7);
  }
  return sub_10000D46C(&v9, a1);
}

uint64_t sub_100008E14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v1 = OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___savedLocationsReconciler;
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___savedLocationsReconciler);
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___savedLocationsReconciler);
  }
  else
  {
    v4 = v0;
    v5 = sub_100008EA0();
    v6 = type metadata accessor for SavedLocationsReconciler(0);
    swift_allocObject(v6, *(unsigned int *)(v6 + 48), *(unsigned __int16 *)(v6 + 52));
    v3 = SavedLocationsReconciler.init(defaultCityManager:)(v5);
    v7 = *(_QWORD *)(v4 + v1);
    *(_QWORD *)(v4 + v1) = v3;
    swift_retain(v3);
    swift_release(v7);
    v2 = 0;
  }
  swift_retain(v2);
  return v3;
}

id sub_100008EA0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___defaultCityManager;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___defaultCityManager);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___defaultCityManager);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone((Class)WCDefaultCityManager), "init");
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

uint64_t sub_100008F10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _BYTE v6[24];
  _BYTE v7[40];
  __int128 v8;
  uint64_t v9;
  void *v10;
  _BYTE v11[24];

  v3 = v1 + OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___savedLocationsReader;
  swift_beginAccess(v1 + OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___savedLocationsReader, v11, 0, 0);
  sub_10000D484(v3, (uint64_t)&v8, &qword_1000197A0);
  if (!v9)
  {
    sub_1000083AC((uint64_t)&v8, &qword_1000197A0);
    v4 = sub_100008FF4();
    v9 = type metadata accessor for SavedLocationsReader(0);
    v10 = &protocol witness table for SavedLocationsReader;
    *(_QWORD *)&v8 = v4;
    sub_100008500((uint64_t)&v8, (uint64_t)v7);
    swift_beginAccess(v3, v6, 33, 0);
    sub_10000D4B0((uint64_t)v7, v3, &qword_1000197A0);
    swift_endAccess(v6);
  }
  return sub_10000D46C(&v8, a1);
}

uint64_t sub_100008FF4()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[5];
  _QWORD v15[3];
  uint64_t v16;
  void *v17;
  _BYTE v18[40];
  _QWORD v19[5];

  v0 = sub_1000062F4(&qword_1000197A8);
  __chkstk_darwin(v0, v1);
  v3 = (char *)v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for UbiquitousKeyValueStoreProvider(0);
  v5 = static UbiquitousKeyValueStoreProvider.shared.getter();
  v19[3] = v4;
  v19[4] = &protocol witness table for UbiquitousKeyValueStoreProvider;
  v19[0] = v5;
  sub_100008D1C((uint64_t)v18);
  v6 = type metadata accessor for SyncedDataManager(0);
  v7 = type metadata accessor for URL(0);
  sub_100006830((uint64_t)v3, 1, 1, v7);
  v8 = type metadata accessor for SyncedDataContextProvider(0);
  swift_allocObject(v8, *(unsigned int *)(v8 + 48), *(unsigned __int16 *)(v8 + 52));
  v9 = SyncedDataContextProvider.init(dataStorageURL:useTransientContext:)(v3, 0);
  v16 = v8;
  v17 = &protocol witness table for SyncedDataContextProvider;
  v15[0] = v9;
  v10 = sub_100008E14();
  v14[3] = type metadata accessor for SavedLocationsReconciler(0);
  v14[4] = &protocol witness table for SavedLocationsReconciler;
  v14[0] = v10;
  v11 = SyncedDataManager.__allocating_init(syncedDataContextProvider:savedLocationsReconciler:)(v15, v14);
  v16 = v6;
  v17 = &protocol witness table for SyncedDataManager;
  v15[0] = v11;
  v12 = type metadata accessor for SavedLocationsReader(0);
  swift_allocObject(v12, *(unsigned int *)(v12 + 48), *(unsigned __int16 *)(v12 + 52));
  return SavedLocationsReader.init(keyValueStoreProvider:locationDataModelFactory:syncedDataManager:testConfigurable:)(v19, v18, v15, 0, 0);
}

void *sub_100009160()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v1 = OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___savedLocations;
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___savedLocations);
  if (v2)
  {
    v3 = *(void **)(v0 + OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___savedLocations);
  }
  else
  {
    v3 = sub_1000091C4();
    v4 = *(_QWORD *)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v3;
    swift_bridgeObjectRetain(v3);
    swift_bridgeObjectRelease(v4);
    v2 = 0;
  }
  swift_bridgeObjectRetain(v2);
  return v3;
}

void *sub_1000091C4()
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
  _QWORD *v21;
  int64_t v22;
  uint64_t (*v23)(char *, unint64_t, uint64_t);
  char *v24;
  uint64_t (*v25)(char *, char *, uint64_t);
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  char *v30;
  id v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t (*v36)(char *, char *, uint64_t);
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t (*v44)(char *, char *, uint64_t);
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t (*v62)(char *, unint64_t, uint64_t);
  uint64_t (*v63)(char *, char *, uint64_t);
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  _QWORD *v68;
  _QWORD v69[3];
  uint64_t v70;
  uint64_t (*v71)(char *, char *, uint64_t);

  v0 = type metadata accessor for Location(0);
  v64 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0, v1);
  v3 = (char *)&v62 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for LocationDataModel(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = type metadata accessor for Location.Identifier(0);
  v67 = *(_QWORD *)(v65 - 8);
  v10 = __chkstk_darwin(v65, v9);
  v66 = (char *)&v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v10, v12);
  v15 = (char *)&v62 - v14;
  __chkstk_darwin(v13, v16);
  v18 = (char *)&v62 - v17;
  sub_100008F10((uint64_t)v69);
  v19 = v70;
  v63 = v71;
  sub_100008388(v69, v70);
  v20 = dispatch thunk of SavedLocationsReaderType.fetchSavedLocations()(v19, v63);
  v21 = &_swiftEmptyArrayStorage;
  if (v20)
  {
    v22 = *(_QWORD *)(v20 + 16);
    if (v22)
    {
      v68 = &_swiftEmptyArrayStorage;
      v23 = (uint64_t (*)(char *, unint64_t, uint64_t))v20;
      sub_10000C840(0, v22, 0);
      v24 = (char *)v23 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
      v64 = *(_QWORD *)(v5 + 72);
      v25 = *(uint64_t (**)(char *, char *, uint64_t))(v5 + 16);
      v62 = v23;
      v63 = v25;
      do
      {
        v26 = v63(v8, v24, v4);
        LocationDataModel.identifier.getter(v26);
        (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
        v21 = v68;
        if ((swift_isUniquelyReferenced_nonNull_native(v68) & 1) == 0)
        {
          sub_10000C840(0, v21[2] + 1, 1);
          v21 = v68;
        }
        v28 = v21[2];
        v27 = v21[3];
        if (v28 >= v27 >> 1)
        {
          sub_10000C840(v27 > 1, v28 + 1, 1);
          v21 = v68;
        }
        v21[2] = v28 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v67 + 32))((unint64_t)v21+ ((*(unsigned __int8 *)(v67 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v67 + 80))+ *(_QWORD *)(v67 + 72) * v28, v18, v65);
        v68 = v21;
        v24 += v64;
        --v22;
      }
      while (v22);
      v20 = (uint64_t)v62;
    }
    swift_bridgeObjectRelease(v20);
    v30 = v66;
    v29 = v67;
    sub_10000641C(v69);
  }
  else
  {
    sub_10000641C(v69);
    v31 = sub_100008EA0();
    v32 = WCDefaultCityManager.defaultLocations()();

    v33 = *(_QWORD *)(v32 + 16);
    if (v33)
    {
      v69[0] = &_swiftEmptyArrayStorage;
      sub_10000C840(0, v33, 0);
      v34 = v64;
      v35 = v32 + ((*(unsigned __int8 *)(v34 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80));
      v36 = *(uint64_t (**)(char *, char *, uint64_t))(v64 + 72);
      v62 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v64 + 16);
      v63 = v36;
      do
      {
        v37 = v62(v3, v35, v0);
        Location.identifier.getter(v37);
        (*(void (**)(char *, uint64_t))(v34 + 8))(v3, v0);
        v21 = (_QWORD *)v69[0];
        if ((swift_isUniquelyReferenced_nonNull_native(v69[0]) & 1) == 0)
        {
          sub_10000C840(0, v21[2] + 1, 1);
          v21 = (_QWORD *)v69[0];
        }
        v39 = v21[2];
        v38 = v21[3];
        if (v39 >= v38 >> 1)
        {
          sub_10000C840(v38 > 1, v39 + 1, 1);
          v21 = (_QWORD *)v69[0];
        }
        v21[2] = v39 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v67 + 32))((unint64_t)v21+ ((*(unsigned __int8 *)(v67 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v67 + 80))+ *(_QWORD *)(v67 + 72) * v39, v15, v65);
        v69[0] = v21;
        v34 = v64;
        v35 += (unint64_t)v63;
        --v33;
      }
      while (v33);
    }
    swift_bridgeObjectRelease(v32);
    v30 = v66;
    v29 = v67;
  }
  v40 = v21[2];
  if (v40)
  {
    v69[0] = &_swiftEmptyArrayStorage;
    specialized ContiguousArray.reserveCapacity(_:)(v40);
    v64 = type metadata accessor for WeatherLocation();
    v41 = (char *)v21 + ((*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80));
    v42 = *(_QWORD *)(v29 + 72);
    v43 = v65;
    v44 = *(uint64_t (**)(char *, char *, uint64_t))(v29 + 16);
    do
    {
      v45 = v44(v30, v41, v43);
      v46 = Location.Identifier.coordinate.getter(v45);
      v48 = v47;
      v49 = Location.Identifier.name.getter();
      v51 = v50;
      v52 = CLLocationCoordinate2D.intentIdentifier.getter(v46, v48);
      v54 = v53;
      swift_bridgeObjectRetain(v51);
      v55 = v54;
      v30 = v66;
      v56 = sub_10000C284(v52, v55, v49, v51, v46, v48, v49, v51);
      v57 = (*(uint64_t (**)(char *, uint64_t))(v67 + 8))(v30, v43);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v57);
      v58 = *(_QWORD *)(v69[0] + 16);
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v58);
      v59 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v58, v56);
      specialized ContiguousArray._endMutation()(v59);
      v41 += v42;
      --v40;
    }
    while (v40);
    v60 = v69[0];
    swift_bridgeObjectRelease(v21);
  }
  else
  {
    swift_bridgeObjectRelease(v21);
    return &_swiftEmptyArrayStorage;
  }
  return (void *)v60;
}

void *sub_1000096DC(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  void *result;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  _QWORD *v18;

  v3 = v2;
  if ((unint64_t)a1 >> 62)
    goto LABEL_14;
  v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v6)
  {
    while (1)
    {
      v18 = &_swiftEmptyArrayStorage;
      result = (void *)specialized ContiguousArray.reserveCapacity(_:)(v6);
      if (v6 < 0)
        break;
      v8 = 0;
      while (v6 != v8)
      {
        if ((a1 & 0xC000000000000001) != 0)
          v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v8, a1);
        else
          v9 = *(id *)(a1 + 8 * v8 + 32);
        v10 = v9;
        v16 = v9;
        sub_10000BEDC(&v16, &v17);

        if (v3)
        {
          v14 = v18;

          swift_release(v14);
          return v10;
        }
        ++v8;
        v11 = v17;
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        v12 = v18[2];
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v12);
        v13 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v12, v11);
        specialized ContiguousArray._endMutation()(v13);
        if (v6 == v8)
        {
          v10 = v18;

          return v10;
        }
      }
      __break(1u);
LABEL_14:
      if (a1 < 0)
        v15 = a1;
      else
        v15 = a1 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(a1);
      v6 = _CocoaArrayWrapper.endIndex.getter(v15);
      swift_bridgeObjectRelease(a1);
      if (!v6)
        goto LABEL_18;
    }
    __break(1u);
  }
  else
  {
LABEL_18:

    return &_swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_100009860(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;

  v3 = type metadata accessor for Location(0);
  v33 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3, v4);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a1 + 16);
  result = &_swiftEmptyArrayStorage;
  if (v7)
  {
    v28 = v1;
    v34 = &_swiftEmptyArrayStorage;
    specialized ContiguousArray.reserveCapacity(_:)(v7);
    v32 = sub_1000062F4(&qword_100019760);
    v9 = *(_QWORD *)(v32 - 8);
    v10 = a1 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    v11 = type metadata accessor for WeatherLocation();
    v30 = *(_QWORD *)(v9 + 72);
    v31 = v11;
    v29 = *(void (**)(char *, uint64_t, uint64_t))(v33 + 16);
    do
    {
      v12 = (uint64_t *)(v10 + *(int *)(v32 + 48));
      v14 = *v12;
      v13 = v12[1];
      v29(v6, v10, v3);
      v15 = swift_bridgeObjectRetain(v13);
      v16 = Location.intentIdentifier.getter(v15);
      v18 = v17;
      v19 = Location.coordinate.getter();
      v21 = v20;
      v22 = Location.name.getter();
      v24 = sub_10000C284(v16, v18, v22, v23, v19, v21, v14, v13);
      v25 = (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v6, v3);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v25);
      v26 = v34[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v26);
      v27 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v26, v24);
      specialized ContiguousArray._endMutation()(v27);
      v10 += v30;
      --v7;
    }
    while (v7);
    return v34;
  }
  return result;
}

uint64_t sub_100009A20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  _QWORD *v9;
  id v10;

  v9 = (_QWORD *)swift_allocObject(&unk_100014BB8, 56, 7);
  v9[2] = v4;
  v9[3] = a3;
  v9[4] = a4;
  v9[5] = a1;
  v9[6] = a2;
  v10 = v4;
  swift_retain(a4);
  swift_bridgeObjectRetain(a2);
  asyncMain(block:)(sub_10000CC74, v9);
  return swift_release(v9);
}

void sub_100009AA4(uint64_t a1, void (*a2)(_QWORD, _QWORD), uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  id v16;
  id v17;
  char *v18;
  void *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  Swift::String v36;
  uint64_t v37;
  char v38[24];
  char v39[24];

  v37 = type metadata accessor for Logger(0);
  v10 = *(_QWORD *)(v37 - 8);
  __chkstk_darwin(v37, v11);
  v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = OBJC_IVAR____TtC14WeatherIntents13IntentHandler_searchCompleter;
  v15 = *(char **)(a1 + OBJC_IVAR____TtC14WeatherIntents13IntentHandler_searchCompleter);
  if (v15
    || (v16 = objc_msgSend(objc_allocWithZone((Class)MKLocalSearchCompleter), "init"),
        v17 = objc_allocWithZone((Class)type metadata accessor for LocationSearchCompleter()),
        v18 = LocationSearchCompleter.init(searchCompleter:)(v16),
        v19 = *(void **)(a1 + v14),
        *(_QWORD *)(a1 + v14) = v18,
        v19,
        (v15 = *(char **)(a1 + v14)) != 0))
  {
    v36._countAndFlagsBits = a4;
    v36._object = a5;
    v20 = swift_allocObject(&unk_100014BE0, 32, 7);
    *(_QWORD *)(v20 + 16) = a2;
    *(_QWORD *)(v20 + 24) = a3;
    v21 = (uint64_t *)&v15[OBJC_IVAR____TtC14WeatherIntents23LocationSearchCompleter_onError];
    swift_beginAccess(&v15[OBJC_IVAR____TtC14WeatherIntents23LocationSearchCompleter_onError], v39, 1, 0);
    v23 = *v21;
    v22 = v21[1];
    *v21 = (uint64_t)sub_10000CC84;
    v21[1] = v20;
    v24 = v15;
    swift_retain(a3);
    sub_10000522C(v23, v22);
    v25 = swift_allocObject(&unk_100014C08, 24, 7);
    swift_unknownObjectWeakInit(v25 + 16, a1);
    v26 = (_QWORD *)swift_allocObject(&unk_100014C30, 40, 7);
    v26[2] = v25;
    v26[3] = a2;
    v26[4] = a3;
    v27 = (uint64_t *)&v24[OBJC_IVAR____TtC14WeatherIntents23LocationSearchCompleter_onUpdate];
    swift_beginAccess(&v24[OBJC_IVAR____TtC14WeatherIntents23LocationSearchCompleter_onUpdate], v38, 1, 0);
    v28 = *v27;
    v29 = v27[1];
    *v27 = (uint64_t)sub_10000CCB4;
    v27[1] = (uint64_t)v26;
    swift_retain(a3);
    v30 = sub_10000522C(v28, v29);
    v31 = static Logger.intents.getter(v30);
    v32 = Logger.logObject.getter(v31);
    v33 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v34 = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "Starting a search ...", v34, 2u);
      swift_slowDealloc(v34, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v37);
    LocationSearchCompleter.searchLocations(for:)(v36);

  }
  else
  {
    a2(0, 0);
  }
}

uint64_t sub_100009D34(uint64_t a1, uint64_t (*a2)(_QWORD, _QWORD))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v13;

  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin();
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = static Logger.intents.getter(v5);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "We encountered an error while updating the search term.", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  return a2(0, 0);
}

void sub_100009E3C(uint64_t a1, uint64_t a2, void (*a3)(_QWORD, _QWORD), uint64_t a4)
{
  uint64_t v7;
  uint64_t Strong;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[5];
  _BYTE v22[24];

  v7 = a2 + 16;
  swift_beginAccess(a2 + 16, v22, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v7);
  if (Strong)
  {
    v10 = (void *)Strong;
    v21[2] = __chkstk_darwin(Strong, v9);
    v21[3] = a1;
    v11 = sub_1000062F4(&qword_100019758);
    v12 = firstly<A>(closure:)(sub_10000CCC0, v21, v11);
    v13 = swift_allocObject(&unk_100014C58, 32, 7);
    *(_QWORD *)(v13 + 16) = a3;
    *(_QWORD *)(v13 + 24) = a4;
    v14 = swift_retain(a4);
    v15 = (void *)zalgo.getter(v14);
    v16 = Promise.then<A>(on:closure:)(v15, sub_10000CD10, v13, (char *)&type metadata for () + 8);
    swift_release(v12);
    swift_release(v13);

    v17 = swift_allocObject(&unk_100014C80, 32, 7);
    *(_QWORD *)(v17 + 16) = a3;
    *(_QWORD *)(v17 + 24) = a4;
    v18 = swift_retain(a4);
    v19 = (void *)zalgo.getter(v18);
    v20 = Promise.error(on:closure:)(v19, sub_10000CD28, v17);

    swift_release(v20);
    swift_release(v16);
    swift_release(v17);

  }
  else
  {
    a3(0, 0);
  }
}

uint64_t sub_100009FC8(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = sub_1000096DC(a1, v1);
  v3 = (void *)zalgo.getter(v2);
  v4 = sub_1000062F4(&qword_100019760);
  v5 = when<A>(on:_:)(v3, v2, v4);
  swift_bridgeObjectRelease(v2);

  return v5;
}

uint64_t sub_10000A048(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  _QWORD *v6;

  v5 = *a1;
  v6 = (_QWORD *)swift_allocObject(&unk_100014CA8, 40, 7);
  v6[2] = v5;
  v6[3] = a2;
  v6[4] = a3;
  swift_bridgeObjectRetain(v5);
  swift_retain(a3);
  asyncMain(block:)(sub_10000CD8C, v6);
  return swift_release(v6);
}

void sub_10000A0CC(uint64_t a1, void (*a2)(_QWORD, _QWORD))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD *v9;
  id v10;
  Swift::String v11;
  Swift::String v12;
  Swift::String v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  Class isa;
  id v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void (*v32)(_QWORD, _QWORD);
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint8_t *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint8_t *v41;
  uint8_t *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  Swift::String v50;

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100009860(a1);
  if (qword_1000193D0 != -1)
    swift_once(&qword_1000193D0, sub_100006B64);
  v10 = (id)qword_100019948;
  v50._object = (void *)0x80000001000123C0;
  v11._countAndFlagsBits = 0x6F4C20726568744FLL;
  v11._object = (void *)0xEF736E6F69746163;
  v12._countAndFlagsBits = 0;
  v12._object = (void *)0xE000000000000000;
  v50._countAndFlagsBits = 0xD000000000000025;
  v13 = NSLocalizedString(_:tableName:bundle:value:comment:)(v11, (Swift::String_optional)0, (NSBundle)v10, v12, v50);

  v14 = objc_allocWithZone((Class)INObjectSection);
  v15 = sub_10000C44C(v13._countAndFlagsBits, (uint64_t)v13._object, (uint64_t)v9);
  v16 = sub_1000062F4(&qword_100019748);
  v17 = swift_allocObject(v16, 40, 7);
  *(_OWORD *)(v17 + 16) = xmmword_100011A40;
  *(_QWORD *)(v17 + 32) = v15;
  v49 = v17;
  specialized Array._endMutation()();
  v18 = v49;
  v19 = objc_allocWithZone((Class)INObjectCollection);
  v20 = v15;
  sub_1000062F4(&qword_100019750);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v18);
  v22 = objc_msgSend(v19, "initWithSections:", isa);

  static Logger.intents.getter(v23);
  v24 = v22;
  v25 = Logger.logObject.getter(v24);
  v26 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v25, v26))
  {
    v47 = v20;
    v27 = (uint8_t *)swift_slowAlloc(12, -1);
    v45 = swift_slowAlloc(32, -1);
    v49 = v45;
    v42 = v27;
    *(_DWORD *)v27 = 136446210;
    v41 = v27 + 4;
    v28 = v24;
    v29 = objc_msgSend(v28, "description");
    v46 = v4;
    v30 = v29;
    v31 = static String._unconditionallyBridgeFromObjectiveC(_:)(v29);
    v43 = v5;
    v44 = v8;
    v32 = a2;
    v33 = v31;
    v35 = v34;

    v36 = v33;
    a2 = v32;
    v48 = sub_100005B8C(v36, v35, &v49);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v48, &v49, v41, v27 + 12);

    v20 = v47;
    swift_bridgeObjectRelease(v35);
    v37 = v42;
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "We have an updated search term and the collection was just updated. Collection=%{public}s", v42, 0xCu);
    v38 = v45;
    swift_arrayDestroy(v45, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v38, -1, -1);
    swift_slowDealloc(v37, -1, -1);

    (*(void (**)(char *, uint64_t))(v43 + 8))(v44, v46);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  v39 = v24;
  a2(v24, 0);

}

id sub_10000A47C()
{
  char *v0;
  objc_class *ObjectType;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType(v0);
  v2 = &v0[OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___localSearchManager];
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *((_QWORD *)v2 + 4) = 0;
  v3 = OBJC_IVAR____TtC14WeatherIntents13IntentHandler_iCloudStatusProvider;
  v4 = type metadata accessor for iCloudStatusProvider(0);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  v5 = v0;
  *(_QWORD *)&v0[v3] = iCloudStatusProvider.init()();
  *(_QWORD *)&v5[OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___appConfigurationManager] = 0;
  v6 = &v5[OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___locationDataModelFactory];
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((_QWORD *)v6 + 4) = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___savedLocationsReconciler] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___defaultCityManager] = 0;
  v7 = &v5[OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___savedLocationsReader];
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((_QWORD *)v7 + 4) = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC14WeatherIntents13IntentHandler____lazy_storage___savedLocations] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC14WeatherIntents13IntentHandler_searchCompleter] = 0;

  v9.receiver = v5;
  v9.super_class = ObjectType;
  return objc_msgSendSuper2(&v9, "init");
}

uint64_t type metadata accessor for IntentHandler()
{
  return objc_opt_self(_TtC14WeatherIntents13IntentHandler);
}

void sub_10000A678(uint64_t a1, uint64_t a2, unint64_t a3, void (**a4)(_QWORD, _QWORD, _QWORD), void (**a5)(_QWORD, _QWORD, _QWORD))
{
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
  char *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t (*v25)(char *, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  id v33;
  Swift::String v34;
  Swift::String v35;
  Swift::String v36;
  uint64_t v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  Class isa;
  id v46;
  char *v47;
  uint64_t v48;
  id v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint8_t *v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(char *, uint64_t);
  char *v67;
  void (**v68)(_QWORD, _QWORD, _QWORD);
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  Swift::String v72;

  v68 = a4;
  v8 = type metadata accessor for Logger(0);
  v9 = *(_QWORD *)(v8 - 8);
  v11 = __chkstk_darwin(v8, v10);
  v67 = (char *)&v62 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __chkstk_darwin(v11, v13);
  v16 = (char *)&v62 - v15;
  __chkstk_darwin(v14, v17);
  v19 = (char *)&v62 - v18;
  v69 = swift_allocObject(&unk_100014B90, 24, 7);
  *(_QWORD *)(v69 + 16) = a5;
  v20 = _Block_copy(a5);
  v21 = static Logger.intents.getter(v20);
  v22 = Logger.logObject.getter(v21);
  v23 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v24 = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "About to provide locations options collection for intent handling", v24, 2u);
    swift_slowDealloc(v24, -1, -1);
  }

  v25 = *(uint64_t (**)(char *, uint64_t))(v9 + 8);
  v26 = v25(v19, v8);
  if (!a3)
    goto LABEL_10;
  v27 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v27 = a2 & 0xFFFFFFFFFFFFLL;
  if (v27)
  {
    v28 = static Logger.intents.getter(v26);
    v29 = Logger.logObject.getter(v28);
    v30 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "We have a search term so we need to reverse geocode that term ...", v31, 2u);
      swift_slowDealloc(v31, -1, -1);
    }

    v25(v16, v8);
    v32 = v69;
    sub_100009A20(a2, a3, (uint64_t)sub_10000CC38, v69);
    swift_release(v32);
  }
  else
  {
LABEL_10:
    if (qword_1000193D0 != -1)
      swift_once(&qword_1000193D0, sub_100006B64);
    v33 = (id)qword_100019948;
    v72._object = (void *)0x8000000100012380;
    v34._countAndFlagsBits = 0x636F4C2072756F59;
    v34._object = (void *)0xEE00736E6F697461;
    v35._countAndFlagsBits = 0;
    v35._object = (void *)0xE000000000000000;
    v72._countAndFlagsBits = 0xD000000000000035;
    v36 = NSLocalizedString(_:tableName:bundle:value:comment:)(v34, (Swift::String_optional)0, (NSBundle)v33, v35, v72);

    v37 = sub_10000ABC0();
    v38 = objc_allocWithZone((Class)INObjectSection);
    v39 = sub_10000C44C(v36._countAndFlagsBits, (uint64_t)v36._object, v37);
    v40 = sub_1000062F4(&qword_100019748);
    v41 = swift_allocObject(v40, 40, 7);
    *(_OWORD *)(v41 + 16) = xmmword_100011A40;
    *(_QWORD *)(v41 + 32) = v39;
    v71 = v41;
    specialized Array._endMutation()(v41);
    v42 = v71;
    v43 = objc_allocWithZone((Class)INObjectCollection);
    v44 = v39;
    sub_1000062F4(&qword_100019750);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v42);
    v46 = objc_msgSend(v43, "initWithSections:", isa);

    v47 = v67;
    static Logger.intents.getter(v48);
    v49 = v46;
    v50 = Logger.logObject.getter(v49);
    v51 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v50, v51))
    {
      v52 = (uint8_t *)swift_slowAlloc(12, -1);
      v65 = swift_slowAlloc(32, -1);
      v66 = (void (*)(char *, uint64_t))v25;
      v71 = v65;
      *(_DWORD *)v52 = 136446210;
      v63 = v52 + 4;
      v53 = v49;
      v68 = a5;
      v54 = v53;
      v55 = v44;
      v56 = objc_msgSend(v53, "description");
      v57 = static String._unconditionallyBridgeFromObjectiveC(_:)(v56);
      v64 = v8;
      v58 = v57;
      v60 = v59;

      v44 = v55;
      v70 = sub_100005B8C(v58, v60, &v71);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, &v71, v63, v52 + 12);

      a5 = v68;
      swift_bridgeObjectRelease(v60);
      _os_log_impl((void *)&_mh_execute_header, v50, v51, "We have NO search term so we need to reverse provide the zero locations list. Collection=%{public}s", v52, 0xCu);
      v61 = v65;
      swift_arrayDestroy(v65, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v61, -1, -1);
      swift_slowDealloc(v52, -1, -1);

      v66(v67, v64);
    }
    else
    {

      v25(v47, v8);
    }
    ((void (**)(_QWORD, id, _QWORD))a5)[2](a5, v49, 0);
    swift_release(v69);

  }
  _Block_release(a5);
}

uint64_t sub_10000ABC0()
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
  char *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  void (*v14)(char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __n128 v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v33;
  void (*v34)(char *, uint64_t);
  uint64_t v35;
  uint64_t v36;

  v0 = type metadata accessor for Logger(0);
  v1 = *(_QWORD *)(v0 - 8);
  v3 = __chkstk_darwin(v0, v2);
  v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v3, v6);
  v9 = (char *)&v33 - v8;
  v10 = static Logger.intents.getter(v7);
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "About to determine zero keyword locations for (current location + saved locations)", v13, 2u);
    swift_slowDealloc(v13, -1, -1);
  }

  v14 = *(void (**)(char *, uint64_t))(v1 + 8);
  v14(v9, v0);
  v15 = sub_1000062F4(&qword_100019748);
  v16 = swift_allocObject(v15, 40, 7);
  *(_OWORD *)(v16 + 16) = xmmword_100011A40;
  v17 = sub_10000B1A4();
  *(_QWORD *)(v16 + 32) = v17;
  v36 = v16;
  specialized Array._endMutation()(v17);
  v18 = v36;
  v19 = sub_100009160();
  v36 = v18;
  v20 = sub_10000C99C((uint64_t)v19);
  v21 = v36;
  static Logger.intents.getter(v20);
  v22 = swift_bridgeObjectRetain_n(v21, 2);
  v23 = Logger.logObject.getter(v22);
  v24 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = swift_slowAlloc(22, -1);
    v26 = swift_slowAlloc(32, -1);
    v34 = v14;
    v27 = v26;
    *(_DWORD *)v25 = 141558275;
    v35 = 1752392040;
    v36 = v26;
    v33 = v0;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36, v25 + 4, v25 + 12);
    *(_WORD *)(v25 + 12) = 2081;
    type metadata accessor for WeatherLocation();
    v28 = swift_bridgeObjectRetain(v21);
    v29 = Array.description.getter(v28);
    v31 = v30;
    swift_bridgeObjectRelease(v21);
    v35 = sub_100005B8C(v29, v31, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36, v25 + 14, v25 + 22);
    swift_bridgeObjectRelease_n(v21, 2);
    swift_bridgeObjectRelease(v31);
    _os_log_impl((void *)&_mh_execute_header, v23, v24, "Returning zero keyword locations=%{private,mask.hash}s", (uint8_t *)v25, 0x16u);
    swift_arrayDestroy(v27, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v27, -1, -1);
    swift_slowDealloc(v25, -1, -1);

    v34(v5, v33);
  }
  else
  {

    swift_bridgeObjectRelease_n(v21, 2);
    v14(v5, v0);
  }
  return v21;
}

void sub_10000AF70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = _convertErrorToNSError(_:)(a2);
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);

}

id sub_10000AFC8(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  NSObject *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject **v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v5 = __chkstk_darwin(v2, v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.intents.getter(v5);
  v8 = a1;
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc(22, -1);
    v20 = v3;
    v12 = v11;
    v19 = (NSObject **)swift_slowAlloc(8, -1);
    *(_DWORD *)v12 = 141558275;
    v22 = 1752392040;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, &v23, v12 + 4, v12 + 12);
    *(_WORD *)(v12 + 12) = 2113;
    v22 = (uint64_t)v8;
    v13 = v8;
    v21 = v2;
    v14 = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v22, &v23, v12 + 14, v12 + 22);
    v15 = (uint64_t)v19;
    *v19 = v8;

    v2 = v21;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "About to determine default location for intent:%{private,mask.hash}@", (uint8_t *)v12, 0x16u);
    v16 = sub_1000062F4(&qword_100019740);
    swift_arrayDestroy(v15, 1, v16);
    sub_1000064D4(v15);
    v17 = v12;
    v3 = v20;
    sub_1000064D4(v17);
  }
  else
  {

    v9 = v8;
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v7, v2);
  return sub_10000B1A4();
}

id sub_10000B1A4()
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
  id v9;
  Swift::String v10;
  Swift::String v11;
  Swift::String v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  Swift::String v35;

  v0 = type metadata accessor for Logger(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000193C0 != -1)
    swift_once(&qword_1000193C0, sub_100006998);
  v5 = static WeatherLocation.currentLocationID;
  v6 = unk_100019930;
  v7 = type metadata accessor for WeatherLocation();
  v8 = qword_1000193D0;
  swift_bridgeObjectRetain(v6);
  if (v8 != -1)
    swift_once(&qword_1000193D0, sub_100006B64);
  v9 = (id)qword_100019948;
  v35._object = (void *)0x8000000100012330;
  v10._countAndFlagsBits = 0x7461636F4C20794DLL;
  v10._object = (void *)0xEB000000006E6F69;
  v11._countAndFlagsBits = 0;
  v11._object = (void *)0xE000000000000000;
  v35._countAndFlagsBits = 0xD000000000000046;
  v12 = NSLocalizedString(_:tableName:bundle:value:comment:)(v10, (Swift::String_optional)0, (NSBundle)v9, v11, v35);

  v13 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v7));
  v14 = sub_10000C4D8(v5, v6, v12._countAndFlagsBits, (uint64_t)v12._object);
  static Logger.intents.getter(v14);
  v15 = v14;
  v16 = Logger.logObject.getter(v15);
  v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = swift_slowAlloc(22, -1);
    v19 = swift_slowAlloc(32, -1);
    v32 = v19;
    *(_DWORD *)v18 = 141558275;
    v33 = 1752392040;
    v34 = v19;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v18 + 4, v18 + 12);
    *(_WORD *)(v18 + 12) = 2081;
    v29 = v18 + 14;
    v20 = v15;
    v31 = v1;
    v21 = v20;
    v22 = objc_msgSend(v20, "description");
    v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
    v30 = v0;
    v24 = v23;
    v26 = v25;

    v33 = sub_100005B8C(v24, v26, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v29, v18 + 22);

    swift_bridgeObjectRelease(v26);
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "currentLocation=%{private,mask.hash}s", (uint8_t *)v18, 0x16u);
    v27 = v32;
    swift_arrayDestroy(v32, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v27, -1, -1);
    swift_slowDealloc(v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v31 + 8))(v4, v30);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  }
  return v15;
}

id sub_10000B518@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  id v4;

  a1[3] = swift_getObjectType(v1);
  *a1 = v4;
  return v4;
}

void sub_10000B5A8(void *a1, uint64_t a2, void (**a3)(_QWORD, _QWORD))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  int v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  os_log_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  id v42;
  _BYTE v43[12];
  int v44;
  uint64_t v45;
  os_log_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (**v50)(_QWORD, _QWORD);
  uint64_t v51;
  uint64_t v52;

  v5 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v5 - 8);
  v8 = __chkstk_darwin(v5, v7);
  v10 = &v43[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v8, v11);
  v13 = &v43[-v12];
  v14 = objc_msgSend(a1, "location");
  if (v14)
  {
    v15 = v14;
    static Logger.intents.getter(v14);
    v16 = a1;
    v17 = v15;
    v18 = v16;
    v19 = v17;
    v20 = Logger.logObject.getter(v19);
    v21 = static os_log_type_t.default.getter();
    v22 = v21;
    if (os_log_type_enabled(v20, v21))
    {
      v23 = swift_slowAlloc(42, -1);
      v45 = swift_slowAlloc(8, -1);
      v46 = v20;
      v24 = (_QWORD *)v45;
      v25 = swift_slowAlloc(32, -1);
      v47 = v25;
      *(_DWORD *)v23 = 141558787;
      v48 = v5;
      v49 = v6;
      v51 = 1752392040;
      v52 = v25;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, &v52, v23 + 4, v23 + 12);
      *(_WORD *)(v23 + 12) = 2113;
      v50 = a3;
      v51 = (uint64_t)v18;
      v26 = v18;
      v44 = v22;
      v27 = v26;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, &v52, v23 + 14, v23 + 22);
      *v24 = v18;

      *(_WORD *)(v23 + 22) = 2160;
      v51 = 1752392040;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, &v52, v23 + 24, v23 + 32);
      *(_WORD *)(v23 + 32) = 2081;
      v28 = v19;
      v29 = objc_msgSend(v28, "description");
      v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v29);
      v32 = v31;

      v51 = sub_100005B8C(v30, v32, &v52);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, &v52, v23 + 34, v23 + 42);

      a3 = v50;
      swift_bridgeObjectRelease(v32);
      v33 = v46;
      _os_log_impl((void *)&_mh_execute_header, v46, (os_log_type_t)v44, "Resolving location for intent with success. intent %{private,mask.hash}@. location: %{private,mask.hash}s", (uint8_t *)v23, 0x2Au);
      v34 = sub_1000062F4(&qword_100019740);
      v35 = v45;
      swift_arrayDestroy(v45, 1, v34);
      swift_slowDealloc(v35, -1, -1);
      v36 = v47;
      swift_arrayDestroy(v47, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v36, -1, -1);
      swift_slowDealloc(v23, -1, -1);

      (*(void (**)(_BYTE *, uint64_t))(v49 + 8))(v13, v48);
    }
    else
    {

      (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v13, v5);
    }
    type metadata accessor for WeatherLocationResolutionResult();
    v42 = static WeatherLocationResolutionResult.success(with:)();
    ((void (**)(_QWORD, id))a3)[2](a3, v42);

  }
  else
  {
    v37 = static Logger.intents.getter(0);
    v38 = Logger.logObject.getter(v37);
    v39 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v40 = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, v39, "Resolving location for intent not required.", v40, 2u);
      swift_slowDealloc(v40, -1, -1);
    }

    (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v10, v5);
    v41 = type metadata accessor for WeatherLocationResolutionResult();
    v42 = objc_msgSend((id)swift_getObjCClassFromMetadata(v41), "notRequired");
    ((void (**)(_QWORD, id))a3)[2](a3, v42);
  }

  _Block_release(a3);
}

void sub_10000B9C4(void *a1, uint64_t a2, void (**a3)(_QWORD, _QWORD))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  __objc2_prot_list *v11;
  void *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  int v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  char *v36;
  id v37;
  NSString v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  int v45;
  uint64_t v46;
  char *v47;
  void (**v48)(_QWORD, _QWORD);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v49 = 7104878;
  v5 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_msgSend(a1, "location");
  v11 = &LocationSearchCompleter;
  if (v10)
  {
    v12 = v10;
    v13 = objc_msgSend(v10, "displayString");

    v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
    v16 = v15;

  }
  else
  {
    v16 = 0xE300000000000000;
    v14 = 7104878;
  }
  v17 = objc_msgSend(a1, "location");
  v18 = v9;
  v50 = v6;
  v51 = v5;
  if (v17 && (v19 = sub_10000CBB0(v17), v20))
  {
    v21 = v20;
    v49 = v19;
  }
  else
  {
    v19 = swift_bridgeObjectRelease(0);
    v21 = 0xE300000000000000;
  }
  static Logger.intents.getter(v19);
  v22 = a1;
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRetain(v21);
  v24 = Logger.logObject.getter(v23);
  v25 = static os_log_type_t.default.getter();
  v26 = v25;
  if (os_log_type_enabled(v24, v25))
  {
    v27 = swift_slowAlloc(62, -1);
    v28 = (_QWORD *)swift_slowAlloc(8, -1);
    v44 = v28;
    v29 = swift_slowAlloc(64, -1);
    v46 = v29;
    *(_DWORD *)v27 = 141559299;
    v52 = 1752392040;
    v53 = v29;
    v47 = v18;
    v43 = v14;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, &v53, v27 + 4, v27 + 12);
    *(_WORD *)(v27 + 12) = 2113;
    v48 = a3;
    v45 = v26;
    v52 = (uint64_t)v22;
    v30 = v22;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, &v53, v27 + 14, v27 + 22);
    *v28 = v22;

    *(_WORD *)(v27 + 22) = 2160;
    v52 = 1752392040;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, &v53, v27 + 24, v27 + 32);
    *(_WORD *)(v27 + 32) = 2081;
    swift_bridgeObjectRetain(v16);
    v52 = sub_100005B8C(v43, v16, &v53);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, &v53, v27 + 34, v27 + 42);
    swift_bridgeObjectRelease_n(v16, 3);
    *(_WORD *)(v27 + 42) = 2160;
    v52 = 1752392040;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, &v53, v27 + 44, v27 + 52);
    *(_WORD *)(v27 + 52) = 2081;
    a3 = v48;
    swift_bridgeObjectRetain(v21);
    v52 = sub_100005B8C(v49, v21, &v53);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, &v53, v27 + 54, v27 + 62);
    swift_bridgeObjectRelease_n(v21, 3);
    _os_log_impl((void *)&_mh_execute_header, v24, (os_log_type_t)v45, "Handling intent %{private,mask.hash}@. displayString: %{private,mask.hash}s. identifier: %{private,mask.hash}s", (uint8_t *)v27, 0x3Eu);
    v31 = sub_1000062F4(&qword_100019740);
    v32 = v44;
    swift_arrayDestroy(v44, 1, v31);
    swift_slowDealloc(v32, -1, -1);
    v33 = v46;
    swift_arrayDestroy(v46, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v33, -1, -1);
    v34 = v27;
    v11 = &LocationSearchCompleter;
    swift_slowDealloc(v34, -1, -1);

    (*(void (**)(char *, uint64_t))(v50 + 8))(v47, v51);
  }
  else
  {

    swift_bridgeObjectRelease_n(v21, 2);
    swift_bridgeObjectRelease_n(v16, 2);

    (*(void (**)(char *, uint64_t))(v50 + 8))(v18, v51);
  }
  v35 = objc_allocWithZone((Class)type metadata accessor for WeatherIntentResponse());
  v36 = WeatherIntentResponse.init(code:userActivity:)(2, 0);
  v37 = objc_msgSend(v22, "location");
  v38 = v37;
  if (v37)
  {
    v39 = objc_msgSend(v37, (SEL)v11[415].count);

    static String._unconditionallyBridgeFromObjectiveC(_:)(v39);
    v41 = v40;

    v38 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v41);
  }
  objc_msgSend(v36, "setLocationName:", v38);

  ((void (**)(_QWORD, char *))a3)[2](a3, v36);
  _Block_release(a3);
}

void sub_10000BE68(void *a1, int a2, void *a3, void *aBlock, void (*a5)(id, id, void *))
{
  void *v8;
  id v9;
  id v10;

  v8 = _Block_copy(aBlock);
  _Block_copy(v8);
  v9 = a3;
  v10 = a1;
  a5(v9, v10, v8);
  _Block_release(v8);

}

uint64_t sub_10000BEDC@<X0>(id *a1@<X0>, uint64_t *a2@<X8>)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t result;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  _QWORD v34[5];

  v4 = sub_1000062F4(&qword_100019760);
  __chkstk_darwin(v4, v5);
  v7 = (char *)&v34[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1000062F4(&qword_100019690);
  __chkstk_darwin(v8, v9);
  v11 = (char *)&v34[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Location(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12, v14);
  v16 = (char *)&v34[-1] - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *a1;
  sub_1000064FC(v17, (uint64_t)v11);
  if (sub_10000687C((uint64_t)v11, 1, v12) == 1)
  {
    sub_1000083AC((uint64_t)v11, &qword_100019690);
    sub_100008620((uint64_t)v34);
    sub_100008388(v34, v34[3]);
    v18 = objc_msgSend(v17, "wi_calloutTitle");
    v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
    v21 = v20;

    v22 = LocalSearchRequestManager.performLocalSearch(with:calloutTitle:)(v17, v19, v21);
    swift_bridgeObjectRelease(v21);
    v23 = swift_allocObject(&unk_100014CD0, 24, 7);
    *(_QWORD *)(v23 + 16) = v17;
    v24 = (void *)zalgo.getter(v17);
    v25 = Promise.then<A>(on:closure:)(v24, sub_10000CDB4, v23, v4);
    swift_release(v22);
    swift_release(v23);

    result = sub_10000641C(v34);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v16, v11, v12);
    v27 = objc_msgSend(v17, "wi_calloutTitle");
    v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
    v30 = v29;

    v31 = (uint64_t *)&v7[*(int *)(v4 + 48)];
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v7, v16, v12);
    *v31 = v28;
    v31[1] = v30;
    v32 = sub_1000062F4(&qword_100019770);
    swift_allocObject(v32, *(unsigned int *)(v32 + 48), *(unsigned __int16 *)(v32 + 52));
    v25 = Promise.init(value:)(v7);
    result = (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v16, v12);
  }
  *a2 = v25;
  return result;
}

uint64_t sub_10000C184(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v4 = sub_1000062F4(&qword_100019760);
  __chkstk_darwin(v4, v5);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_msgSend(a2, "wi_calloutTitle");
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  v11 = v10;

  v12 = (uint64_t *)&v7[*(int *)(v4 + 48)];
  v13 = type metadata accessor for Location(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v7, a1, v13);
  *v12 = v9;
  v12[1] = v11;
  v14 = sub_1000062F4(&qword_100019770);
  swift_allocObject(v14, *(unsigned int *)(v14 + 48), *(unsigned __int16 *)(v14 + 52));
  return Promise.init(value:)(v7);
}

id sub_10000C284(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6, uint64_t a7, uint64_t a8)
{
  objc_class *v8;
  objc_class *v9;
  id v17;
  NSString v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v9 = v8;
  v17 = objc_allocWithZone(v9);
  v18 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a8);
  v19 = sub_10000CB50(a1, a2, (uint64_t)v18, v17);

  v20 = objc_allocWithZone((Class)CLLocation);
  v21 = v19;
  v22 = objc_msgSend(v20, "initWithLatitude:longitude:", a5, a6);
  sub_10000D118(0, &qword_100019768, CLPlacemark_ptr);
  v23 = v22;
  v24 = sub_10000C3B4(v23, a3, a4, 0);
  objc_msgSend(v21, "setGeolocation:", v24);

  return v21;
}

id sub_10000C3B4(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  uint64_t v5;
  NSString v9;
  id v10;

  v5 = v4;
  if (a3)
  {
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a3);
  }
  else
  {
    v9 = 0;
  }
  v10 = objc_msgSend((id)swift_getObjCClassFromMetadata(v5), "placemarkWithLocation:name:postalAddress:", a1, v9, a4);

  return v10;
}

id sub_10000C44C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  NSString v6;
  Class isa;
  id v8;

  if (a2)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v6 = 0;
  }
  type metadata accessor for WeatherLocation();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a3);
  v8 = objc_msgSend(v3, "initWithTitle:items:", v6, isa);

  return v8;
}

id sub_10000C4D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  NSString v7;
  NSString v8;
  id v9;

  if (a2)
  {
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v7 = 0;
  }
  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  v9 = objc_msgSend(v4, "initWithIdentifier:displayString:", v7, v8);

  return v9;
}

uint64_t sub_10000C568(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  char v8;

  if (a2 < 0)
  {
    v8 = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v8, 1046, 0);
    __break(1u);
  }
  else if (a3 < a1
         || (result = type metadata accessor for Location.Identifier(0),
             a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    v7 = type metadata accessor for Location.Identifier(0);
    return swift_arrayInitWithTakeFrontToBack(a3, a1, a2, v7);
  }
  else if (a3 != a1)
  {
    return swift_arrayInitWithTakeBackToFront(a3, a1, a2, result);
  }
  return result;
}

uint64_t sub_10000C664(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t result;

  if (a2 < 0)
  {
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
  }
  else
  {
    v6 = type metadata accessor for Location.Identifier(0);
    v7 = *(_QWORD *)(*(_QWORD *)(v6 - 8) + 72) * a2;
    v8 = a3 + v7;
    v9 = a1 + v7;
    if (v8 <= a1 || v9 <= a3)
      return swift_arrayInitWithCopy(a3, a1, a2, v6);
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000C758(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v7;
  uint64_t result;

  if (a2 < 0)
  {
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
  }
  else
  {
    if (a3 + 8 * a2 <= a1 || a1 + 8 * a2 <= a3)
    {
      v7 = type metadata accessor for WeatherLocation();
      return swift_arrayInitWithCopy(a3, a1, a2, v7);
    }
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  }
  __break(1u);
  return result;
}

size_t sub_10000C840(size_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  size_t result;

  result = sub_10000C85C(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

size_t sub_10000C85C(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
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
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
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
    v15 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_1000062F4(&qword_100019798);
  v11 = *(_QWORD *)(type metadata accessor for Location.Identifier(0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  result = j__malloc_size(v15);
  if (!v12)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v14 == 0x8000000000000000 && v12 == -1)
    goto LABEL_24;
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(result - v14) / v12);
LABEL_19:
  v17 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for Location.Identifier(0) - 8) + 80);
  v18 = (v17 + 32) & ~v17;
  v19 = (unint64_t)v15 + v18;
  v20 = a4 + v18;
  if ((v5 & 1) != 0)
  {
    sub_10000C568(v20, v8, v19);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_10000C664(v20, v8, v19);
  }
  swift_release(a4);
  return (size_t)v15;
}

uint64_t sub_10000C99C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  __n128 v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v17 = a1;
    else
      v17 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v3 = _CocoaArrayWrapper.endIndex.getter(v17);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if ((unint64_t)*v1 >> 62)
  {
    if (v4 < 0)
      v18 = *v1;
    else
      v18 = v4 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(*v1);
    v5 = _CocoaArrayWrapper.endIndex.getter(v18);
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
    goto LABEL_30;
  }
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v1);
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_16;
    v5 = 1;
  }
  if ((unint64_t)v4 >> 62)
    goto LABEL_31;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    v10 = swift_bridgeObjectRetain(v4);
    v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v5, v9, 1, v4, v10);
    swift_bridgeObjectRelease(*v1);
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_16:
    result = sub_10000D2A0(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v12 >= v3)
      break;
LABEL_30:
    __break(1u);
LABEL_31:
    if (v4 < 0)
      v19 = v4;
    else
      v19 = v4 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v4);
    v9 = _CocoaArrayWrapper.endIndex.getter(v19);
    swift_bridgeObjectRelease(v4);
  }
  if (v12 < 1)
    goto LABEL_20;
  v13 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v14 = __OFADD__(v13, v12);
  v15 = v13 + v12;
  if (!v14)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v15;
LABEL_20:
    v16 = swift_bridgeObjectRelease(result);
    return specialized Array._endMutation()(v16);
  }
  __break(1u);
  return result;
}

id sub_10000CB50(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  NSString v7;
  id v8;

  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v8 = objc_msgSend(a4, "initWithIdentifier:displayString:", v7, a3);

  return v8;
}

uint64_t sub_10000CBB0(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, "identifier");

  if (!v2)
    return 0;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);

  return v3;
}

uint64_t sub_10000CC1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  _Block_release(*(const void **)(v0 + 16));
  v1 = sub_10000D4F4();
  return swift_deallocObject(v1, v2, v3);
}

void sub_10000CC38(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_10000AF70(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_10000CC40()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 32));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));
  return swift_deallocObject(v0, 56, 7);
}

void sub_10000CC74()
{
  uint64_t v0;

  sub_100009AA4(*(_QWORD *)(v0 + 16), *(void (**)(_QWORD, _QWORD))(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(void **)(v0 + 48));
}

uint64_t sub_10000CC84(uint64_t a1)
{
  uint64_t v1;

  return sub_100009D34(a1, *(uint64_t (**)(_QWORD, _QWORD))(v1 + 16));
}

uint64_t sub_10000CC8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  swift_unknownObjectWeakDestroy(v0 + 16);
  v1 = sub_10000D4F4();
  return swift_deallocObject(v1, v2, v3);
}

uint64_t sub_10000CCA8()
{
  return sub_10000CD5C((void (*)(_QWORD))&_swift_release);
}

void sub_10000CCB4(uint64_t a1)
{
  uint64_t v1;

  sub_100009E3C(a1, *(_QWORD *)(v1 + 16), *(void (**)(_QWORD, _QWORD))(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_10000CCC0()
{
  uint64_t v0;

  return sub_100009FC8(*(_QWORD *)(v0 + 24));
}

uint64_t sub_10000CCEC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000CD10(uint64_t *a1)
{
  uint64_t v1;

  return sub_10000A048(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_10000CD28()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 16))(0, 0);
}

uint64_t sub_10000CD50()
{
  return sub_10000CD5C((void (*)(_QWORD))&_swift_bridgeObjectRelease);
}

uint64_t sub_10000CD5C(void (*a1)(_QWORD))
{
  uint64_t v1;

  a1(*(_QWORD *)(v1 + 16));
  swift_release(*(_QWORD *)(v1 + 32));
  return swift_deallocObject(v1, 40, 7);
}

void sub_10000CD8C()
{
  uint64_t v0;

  sub_10000A0CC(*(_QWORD *)(v0 + 16), *(void (**)(_QWORD, _QWORD))(v0 + 24));
}

uint64_t sub_10000CD98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = sub_10000D4F4();
  return swift_deallocObject(v1, v2, v3);
}

uint64_t sub_10000CDB4(uint64_t a1)
{
  uint64_t v1;

  return sub_10000C184(a1, *(void **)(v1 + 16));
}

uint64_t sub_10000CDCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
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
  uint64_t v22;
  char *v23;
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
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  void *v44;
  _QWORD v45[5];

  v43 = a2;
  v11 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v40 = *(_QWORD *)(v11 - 8);
  v41 = v11;
  __chkstk_darwin(v11, v12);
  v42 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v38, v14);
  v39 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v16, v17);
  v19 = (char *)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = type metadata accessor for PromiseDeduperFlags(0);
  __chkstk_darwin(v20, v21);
  v23 = (char *)&v38 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45[3] = type metadata accessor for AppConfigurationManager(0);
  v45[4] = &protocol witness table for AppConfigurationManager;
  v45[0] = a4;
  v44 = &_swiftEmptyArrayStorage;
  sub_10000D150((unint64_t *)&qword_1000193F8, (uint64_t (*)(uint64_t))&type metadata accessor for PromiseDeduperFlags);
  v25 = v24;
  v26 = sub_1000062F4(&qword_100019400);
  v27 = a3;
  sub_10000D438((unint64_t *)&qword_100019408, &qword_100019400);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v44, v26, v28, v20, v25);
  v29 = sub_1000062F4(&qword_100019410);
  swift_allocObject(v29, *(unsigned int *)(v29 + 48), *(unsigned __int16 *)(v29 + 52));
  *(_QWORD *)(a6 + 72) = PromiseDeduper.init(options:)(v23);
  *(_QWORD *)(a6 + 80) = 0;
  *(_QWORD *)(a6 + 88) = 0;
  *(_QWORD *)(a6 + 96) = 0;
  *(_OWORD *)(a6 + 104) = xmmword_1000118D0;
  *(_QWORD *)(a6 + 56) = a1;
  *(_QWORD *)(a6 + 64) = &protocol witness table for LocalSearchRequestService;
  *(_QWORD *)(a6 + 120) = v43;
  *(_QWORD *)(a6 + 128) = a3;
  sub_100008500((uint64_t)v45, a6 + 16);
  if (!a5)
  {
    sub_10000D118(0, (unint64_t *)&qword_1000196B0, OS_dispatch_queue_ptr);
    swift_retain(a1);
    v30 = swift_retain(a3);
    static DispatchQoS.unspecified.getter(v30);
    v44 = &_swiftEmptyArrayStorage;
    sub_10000D150(&qword_1000196B8, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
    v32 = v31;
    v33 = sub_1000062F4(&qword_1000196C0);
    sub_10000D438(&qword_1000196C8, &qword_1000196C0);
    v34 = v39;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v44, v33, v35, v38, v32);
    v36 = v42;
    (*(void (**)(char *, _QWORD, uint64_t))(v40 + 104))(v42, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v41);
    a5 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD00000000000001DLL, 0x8000000100012130, v19, v34, v36, 0);
    swift_release(a1);
    swift_release(v27);
  }
  sub_10000641C(v45);
  *(_QWORD *)(a6 + 136) = a5;
  return a6;
}

uint64_t sub_10000D118(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

void sub_10000D150(unint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = a2(255);
    atomic_store(sub_10000D518(v3), a1);
  }
  sub_1000064E0();
}

void (*sub_10000D184(_QWORD *a1, unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  _QWORD *v6;

  v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = sub_10000D204(v6, a2, a3);
  return sub_10000D1D8;
}

void sub_10000D1D8(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_10000D204(_QWORD *a1, unint64_t a2, uint64_t a3))(id *a1)
{
  unint64_t v6;
  id v7;

  v6 = a3 & 0xC000000000000001;
  sub_10000D27C(a2, (a3 & 0xC000000000000001) == 0, a3);
  if (v6)
    v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(a2, a3);
  else
    v7 = *(id *)(a3 + 8 * a2 + 32);
  *a1 = v7;
  return sub_10000D270;
}

void sub_10000D270(id *a1)
{

}

unint64_t sub_10000D27C(unint64_t result, char a2, uint64_t a3)
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

uint64_t sub_10000D2A0(uint64_t result, uint64_t a2, uint64_t a3)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t i;
  void (*v11)(_QWORD *);
  id *v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];

  v5 = result;
  v6 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0)
      v14 = a3;
    else
      v14 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v7 = _CocoaArrayWrapper.endIndex.getter(v14);
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
        v8 = a3;
      else
        v8 = a3 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(a3);
      v9 = _CocoaArrayWrapper.endIndex.getter(v8);
      result = swift_bridgeObjectRelease(a3);
      if (v9 <= a2)
      {
        if (v7 >= 1)
        {
          sub_10000D438(&qword_100019790, &qword_100019788);
          swift_bridgeObjectRetain(a3);
          for (i = 0; i != v7; ++i)
          {
            sub_1000062F4(&qword_100019788);
            v11 = sub_10000D184(v15, i, a3);
            v13 = *v12;
            ((void (*)(_QWORD *, _QWORD))v11)(v15, 0);
            *(_QWORD *)(v5 + 8 * i) = v13;
          }
          swift_bridgeObjectRelease(a3);
          return a3;
        }
        goto LABEL_22;
      }
    }
    else
    {
      if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_10000C758((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10), v5);
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

void sub_10000D438(unint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = sub_1000063B8(a2);
    atomic_store(sub_10000D518(v3), a1);
  }
  sub_1000064E0();
}

uint64_t sub_10000D46C(__int128 *a1, uint64_t a2)
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

void sub_10000D484(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = sub_10000D4E4(a1, a2, a3);
  sub_10000D504(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  sub_1000064E0();
}

void sub_10000D4B0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = sub_10000D4E4(a1, a2, a3);
  sub_10000D504(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40));
  sub_1000064E0();
}

uint64_t sub_10000D4E4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_1000062F4(a3);
}

uint64_t sub_10000D4F4()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_10000D504@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t sub_10000D510@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return swift_release(*(_QWORD *)(v1 + a1));
}

uint64_t sub_10000D518(uint64_t a1)
{
  uint64_t v1;

  return swift_getWitnessTable(v1, a1);
}

uint64_t LocalSearchRequestService.__allocating_init(appConfigurationManager:)(_QWORD *a1)
{
  return sub_10000D54C(a1, (uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))sub_10000E938);
}

uint64_t LocalSearchRequestService.init(appConfigurationManager:)(_QWORD *a1)
{
  return sub_10000D54C(a1, (uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))sub_10000E9F0);
}

uint64_t sub_10000D54C(_QWORD *a1, uint64_t (*a2)(char *, uint64_t, uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v5 = a1[3];
  v6 = a1[4];
  v7 = sub_100007EF8((uint64_t)a1, v5);
  __chkstk_darwin(v7, v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v10 + 16))(v9);
  v11 = a2(v9, v2, v5, v6);
  sub_10000641C(a1);
  return v11;
}

void LocalSearchRequestService.performLocalSearch(with:calloutTitle:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  _QWORD v7[6];

  v5 = objc_msgSend(objc_allocWithZone((Class)MKLocalSearchRequest), "initWithCompletion:", a1);
  v7[2] = v5;
  v7[3] = a2;
  v7[4] = a3;
  v6 = sub_1000062F4(&qword_1000196A0);
  sub_10000EDAC(v6);
  Promise.init(resolver:)(sub_10000EA40, v7);

  sub_10000ED9C();
}

void LocalSearchRequestService.performLocalSearch(with:)(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  _QWORD v6[6];

  sub_10000D118(0, &qword_1000197B8, MKLocalSearchRequest_ptr);
  swift_bridgeObjectRetain(a2);
  v4 = sub_10000D700(a1, a2);
  v6[2] = v4;
  v6[3] = a1;
  v6[4] = a2;
  v5 = sub_1000062F4(&qword_1000196A0);
  sub_10000EDAC(v5);
  Promise.init(resolver:)(sub_10000ED94, v6);

  sub_10000ED9C();
}

id sub_10000D700(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v4;
  NSString v5;
  id v6;

  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v2));
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v6 = objc_msgSend(v4, "initWithNaturalLanguageQuery:", v5);

  return v6;
}

void sub_10000D770(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  id v14;
  _QWORD *v15;
  void *v16;
  _QWORD *v17;
  _QWORD v18[5];
  _QWORD *v19;

  sub_10000E8F4(a6, a7, a5);
  v14 = objc_msgSend(objc_allocWithZone((Class)MKLocalSearch), "initWithRequest:", a5);
  v15 = (_QWORD *)swift_allocObject(&unk_100014D10, 64, 7);
  v15[2] = a6;
  v15[3] = a7;
  v15[4] = a3;
  v15[5] = a4;
  v15[6] = a1;
  v15[7] = a2;
  v18[4] = sub_10000EAA0;
  v19 = v15;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 1107296256;
  v18[2] = sub_10000E818;
  v18[3] = &unk_100014D28;
  v16 = _Block_copy(v18);
  v17 = v19;
  swift_bridgeObjectRetain(a7);
  swift_retain(a4);
  swift_retain(a2);
  swift_release(v17);
  objc_msgSend(v14, "startWithCompletionHandler:", v16);
  _Block_release(v16);

}

void sub_10000D89C(void *a1, uint64_t a2, uint64_t a3, unint64_t a4, void (*a5)(void), uint64_t a6, void (*a7)(char *), uint64_t a8)
{
  uint64_t v9;
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
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
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
  char *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  NSObject *v56;
  os_log_type_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  char *v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  void *v76;
  id v77;
  id v78;
  uint64_t v79;
  void (*v80)(uint64_t, uint64_t, uint64_t);
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int v84;
  char *v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  NSObject *v93;
  os_log_type_t v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  _QWORD *v99;
  uint64_t v100;
  id v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  NSObject *v108;
  os_log_type_t v109;
  uint64_t v110;
  uint64_t v111;
  id v112;
  double v113;
  double v114;
  double v115;
  double v116;
  uint64_t v117;
  uint64_t v118;
  id v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  id v123;
  char *v124;
  id v125;
  uint64_t v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  id v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  id v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  char *v147;
  uint64_t v148;
  id v149;
  NSObject *v150;
  os_log_type_t v151;
  int v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  unint64_t v157;
  unint64_t v158;
  __n128 v159;
  void (*v160)(char *, uint64_t, __n128);
  id v161;
  uint64_t v162;
  unint64_t v163;
  unint64_t v164;
  void (*v165)(void);
  uint64_t v166;
  unint64_t v167;
  uint64_t v168;
  _QWORD *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  char *v175;
  char *v176;
  char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  char *v181;
  char *v182;
  uint64_t v183;
  uint64_t v184;
  void (*v185)(char *);
  uint64_t v186;
  id v187;
  char *v188;
  uint64_t v189;
  uint64_t v190;
  void (*v191)(void);
  unint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196[2];

  v184 = a8;
  v185 = a7;
  v190 = a6;
  v191 = a5;
  v192 = a4;
  v189 = a3;
  v187 = a1;
  v9 = sub_1000062F4(&qword_100019510);
  __chkstk_darwin(v9, v10);
  v188 = (char *)&v172 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v186 = type metadata accessor for Location(0);
  v183 = *(_QWORD *)(v186 - 8);
  v13 = __chkstk_darwin(v186, v12);
  v182 = (char *)&v172 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13, v15);
  v17 = (char *)&v172 - v16;
  v18 = sub_1000062F4(&qword_100019518);
  v20 = __chkstk_darwin(v18, v19);
  v22 = (char *)&v172 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __chkstk_darwin(v20, v23);
  v26 = (char *)&v172 - v25;
  __chkstk_darwin(v24, v27);
  v29 = (char *)&v172 - v28;
  v30 = type metadata accessor for TimeZone(0);
  v31 = *(_QWORD *)(v30 - 8);
  v33 = __chkstk_darwin(v30, v32);
  v35 = (char *)&v172 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v33, v36);
  v38 = (char *)&v172 - v37;
  v39 = type metadata accessor for Logger(0);
  v193 = *(_QWORD *)(v39 - 8);
  v194 = v39;
  v41 = __chkstk_darwin(v39, v40);
  v43 = __chkstk_darwin(v41, v42);
  v45 = __chkstk_darwin(v43, v44);
  __chkstk_darwin(v45, v46);
  if (a2)
  {
    v51 = (char *)&v172 - v48;
    v52 = a2;
    v53 = swift_errorRetain(a2);
    static Logger.geocode.getter(v53);
    swift_errorRetain(a2);
    v54 = v192;
    swift_bridgeObjectRetain(v192);
    swift_errorRetain(a2);
    swift_bridgeObjectRetain(v54);
    v56 = Logger.logObject.getter(v55);
    v57 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v56, v57))
    {
      v58 = swift_slowAlloc(32, -1);
      v59 = swift_slowAlloc(64, -1);
      *(_DWORD *)v58 = 141558531;
      v195 = 1752392040;
      v196[0] = v59;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v195, v196, v58 + 4, v58 + 12);
      *(_WORD *)(v58 + 12) = 2085;
      swift_bridgeObjectRetain(v54);
      v195 = sub_100005B8C(v189, v54, v196);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v195, v196, v58 + 14, v58 + 22);
      swift_bridgeObjectRelease_n(v54, 3);
      *(_WORD *)(v58 + 22) = 2082;
      v195 = a2;
      swift_errorRetain(a2);
      v60 = sub_1000062F4(&qword_1000193F0);
      v61 = String.init<A>(describing:)(&v195, v60);
      v63 = v62;
      v195 = sub_100005B8C(v61, v62, v196);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v195, v196, v58 + 24, v58 + 32);
      swift_bridgeObjectRelease(v63);
      swift_errorRelease(v52);
      swift_errorRelease(v52);
      _os_log_impl((void *)&_mh_execute_header, v56, v57, "Failed to geocode. searchString=%{sensitive,mask.hash}s, error=%{public}s", (uint8_t *)v58, 0x20u);
      swift_arrayDestroy(v59, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v59, -1, -1);
      swift_slowDealloc(v58, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n(v54, 2);
      swift_errorRelease(a2);
      swift_errorRelease(a2);
    }

    (*(void (**)(char *, uint64_t))(v193 + 8))(v51, v194);
    v87 = sub_10000EAC8();
    v88 = swift_allocError(&type metadata for LocalSearchRequestService.LocalSearchRequestError, v87, 0, 0);
    *v89 = v52;
    swift_errorRetain(v52);
    ((void (*)(uint64_t))v191)(v88);
    swift_errorRelease(v88);
    v90 = v52;
LABEL_20:
    swift_errorRelease(v90);
    return;
  }
  v174 = (uint64_t)v22;
  v181 = v26;
  v176 = v29;
  v180 = (uint64_t)v35;
  v64 = v188;
  v177 = v38;
  v178 = v31;
  v179 = v30;
  v175 = v17;
  v65 = v192;
  if (!v187)
  {
LABEL_16:
    v91 = v47;
    ((void (*)(void))static Logger.geocode.getter)();
    v92 = swift_bridgeObjectRetain_n(v65, 2);
    v93 = Logger.logObject.getter(v92);
    v94 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v93, v94))
    {
      v95 = swift_slowAlloc(22, -1);
      v96 = swift_slowAlloc(32, -1);
      *(_DWORD *)v95 = 141558275;
      v195 = 1752392040;
      v196[0] = v96;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v195, v196, v95 + 4, v95 + 12);
      *(_WORD *)(v95 + 12) = 2085;
      swift_bridgeObjectRetain(v65);
      v195 = sub_100005B8C(v189, v65, v196);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v195, v196, v95 + 14, v95 + 22);
      swift_bridgeObjectRelease_n(v65, 3);
      swift_arrayDestroy(v96, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v96, -1, -1);
      swift_slowDealloc(v95, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v65, 2);
    }
    (*(void (**)(uint64_t, uint64_t))(v193 + 8))(v91, v194);
    v97 = sub_10000EAC8();
    v98 = swift_allocError(&type metadata for LocalSearchRequestService.LocalSearchRequestError, v97, 0, 0);
    *v99 = 0;
    v191();
    v90 = v98;
    goto LABEL_20;
  }
  v66 = v47;
  v67 = v50;
  v173 = v49;
  v68 = objc_msgSend(v187, "mapItems");
  v69 = sub_10000D118(0, &qword_100019868, MKMapItem_ptr);
  v70 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v68, v69);

  if ((unint64_t)v70 >> 62)
  {
    if (v70 < 0)
      v170 = v70;
    else
      v170 = v70 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v70);
    v71 = _CocoaArrayWrapper.endIndex.getter(v170);
    swift_bridgeObjectRelease(v70);
  }
  else
  {
    v71 = *(_QWORD *)((v70 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v72 = (uint64_t)v64;
  v74 = v180;
  v73 = (uint64_t)v181;
  if (!v71)
  {
    swift_bridgeObjectRelease(v70);
    v47 = v66;
    goto LABEL_16;
  }
  sub_10000D278(0, (v70 & 0xC000000000000001) == 0, v70);
  if ((v70 & 0xC000000000000001) != 0)
    v75 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v70);
  else
    v75 = *(id *)(v70 + 32);
  v76 = v75;
  swift_bridgeObjectRelease(v70);
  v77 = objc_msgSend(v76, "placemark");
  v78 = objc_msgSend(v77, "timeZone");

  if (!v78)
  {
    v100 = v73;
    v83 = v179;
    sub_100006830(v100, 1, 1, v179);
    v79 = v178;
    v85 = v177;
    goto LABEL_22;
  }
  static TimeZone._unconditionallyBridgeFromObjectiveC(_:)(v78);

  v79 = v178;
  v80 = *(void (**)(uint64_t, uint64_t, uint64_t))(v178 + 32);
  v81 = v73;
  v82 = v73;
  v83 = v179;
  v80(v81, v74, v179);
  sub_100006830(v82, 0, 1, v83);
  v84 = sub_10000687C(v82, 1, v83);
  v85 = v177;
  if (v84 == 1)
  {
LABEL_22:
    v101 = objc_msgSend(v76, "timeZone");
    if (v101)
    {
      v102 = v101;
      v103 = v174;
      static TimeZone._unconditionallyBridgeFromObjectiveC(_:)(v101);

      v104 = v103;
      v105 = 0;
      v86 = (uint64_t)v176;
    }
    else
    {
      v105 = 1;
      v86 = (uint64_t)v176;
      v104 = v174;
    }
    sub_100006830(v104, v105, 1, v83);
    sub_10000EB04(v104, v86);
    sub_10000683C((uint64_t)v181);
    goto LABEL_26;
  }
  v86 = (uint64_t)v176;
  v80((uint64_t)v176, (uint64_t)v181, v83);
  sub_100006830(v86, 0, 1, v83);
LABEL_26:
  if (sub_10000687C(v86, 1, v83) == 1)
  {
    v106 = sub_10000683C(v86);
    static Logger.geocode.getter(v106);
    v107 = swift_bridgeObjectRetain_n(v65, 2);
    v108 = Logger.logObject.getter(v107);
    v109 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v108, v109))
    {
      v110 = swift_slowAlloc(22, -1);
      v111 = swift_slowAlloc(32, -1);
      *(_DWORD *)v110 = 141558275;
      v195 = 1752392040;
      v196[0] = v111;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v195, v196, v110 + 4, v110 + 12);
      *(_WORD *)(v110 + 12) = 2085;
      swift_bridgeObjectRetain(v65);
      v195 = sub_100005B8C(v189, v65, v196);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v195, v196, v110 + 14, v110 + 22);
      swift_bridgeObjectRelease_n(v65, 3);
      _os_log_impl((void *)&_mh_execute_header, v108, v109, "Time zone missing while geocoding, searchString=%{sensitive,mask.hash}s.", (uint8_t *)v110, 0x16u);
      swift_arrayDestroy(v111, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v111, -1, -1);
      swift_slowDealloc(v110, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v65, 2);
    }
    (*(void (**)(uint64_t, uint64_t))(v193 + 8))(v67, v194);
    v167 = sub_10000EAC8();
    v168 = swift_allocError(&type metadata for LocalSearchRequestService.LocalSearchRequestError, v167, 0, 0);
    *v169 = 1;
    v191();
    swift_errorRelease(v168);

  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v79 + 32))(v85, v86, v83);
    v112 = objc_msgSend(v76, "placemark");
    objc_msgSend(v112, "coordinate");
    v114 = v113;
    v116 = v115;

    v117 = CLLocationCoordinate2D.id.getter(v114, v116);
    v190 = v118;
    v191 = (void (*)(void))v117;
    v119 = objc_msgSend(v76, "wc_weatherDisplayName");
    v187 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(v119);
    v181 = (char *)v120;

    v121 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v79 + 16))(v74, v85, v83);
    Date.init()(v121);
    v122 = type metadata accessor for Date(0);
    sub_100006830(v72, 0, 1, v122);
    v123 = objc_msgSend(v76, "placemark");
    v180 = MKPlacemark.safeTitle.getter();
    v176 = v124;

    v125 = objc_msgSend(v76, "placemark");
    v174 = MKPlacemark.safeSubtitle.getter();
    v172 = v126;

    v127 = objc_msgSend(v76, "wc_weatherLocationName");
    v128 = static String._unconditionallyBridgeFromObjectiveC(_:)(v127);
    v130 = v129;

    v131 = objc_msgSend(v76, "wc_weatherLocationName");
    v132 = v74;
    v133 = static String._unconditionallyBridgeFromObjectiveC(_:)(v131);
    v135 = v134;

    v136 = objc_msgSend(v76, "wc_weatherDisplayName");
    v137 = static String._unconditionallyBridgeFromObjectiveC(_:)(v136);
    v139 = v138;

    v140 = static Location.sanitizedSecondaryName(_:name:)(v133, v135, v137, v139);
    v142 = v141;
    swift_bridgeObjectRelease(v135);
    swift_bridgeObjectRelease(v139);
    v171 = v142;
    v143 = v175;
    v144 = Location.init(id:name:timeZone:coordinate:lastRefreshDate:searchTitle:searchSubtitle:preciseName:secondaryName:)(v191, v190, v187, v181, v132, v188, v180, v176, v114, v116, v174, v172, v128, v130, v140, v171);
    v145 = v173;
    static Logger.geocode.getter(v144);
    v147 = v182;
    v146 = v183;
    v148 = v186;
    (*(void (**)(char *, char *, uint64_t))(v183 + 16))(v182, v143, v186);
    swift_bridgeObjectRetain_n(v65, 2);
    v149 = v76;
    v150 = Logger.logObject.getter(v149);
    v151 = static os_log_type_t.default.getter();
    v152 = v151;
    if (os_log_type_enabled(v150, v151))
    {
      v153 = swift_slowAlloc(62, -1);
      v154 = swift_slowAlloc(96, -1);
      v191 = (void (*)(void))v154;
      *(_DWORD *)v153 = 141559299;
      v195 = 1752392040;
      v196[0] = v154;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v195, v196, v153 + 4, v153 + 12);
      *(_WORD *)(v153 + 12) = 2085;
      LODWORD(v190) = v152;
      swift_bridgeObjectRetain(v65);
      v195 = sub_100005B8C(v189, v65, v196);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v195, v196, v153 + 14, v153 + 22);
      swift_bridgeObjectRelease_n(v65, 3);
      *(_WORD *)(v153 + 22) = 2160;
      v195 = 1752392040;
      v155 = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v195, v196, v153 + 24, v153 + 32);
      *(_WORD *)(v153 + 32) = 2081;
      v156 = Location.id.getter(v155);
      v158 = v157;
      v195 = sub_100005B8C(v156, v157, v196);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v195, v196, v153 + 34, v153 + 42);
      v159 = swift_bridgeObjectRelease(v158);
      v160 = *(void (**)(char *, uint64_t, __n128))(v146 + 8);
      v160(v147, v186, v159);
      *(_WORD *)(v153 + 42) = 2160;
      v195 = 1752392040;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v195, v196, v153 + 44, v153 + 52);
      *(_WORD *)(v153 + 52) = 2081;
      v161 = objc_msgSend(v149, "wc_weatherLocationName");
      v162 = static String._unconditionallyBridgeFromObjectiveC(_:)(v161);
      v164 = v163;

      v195 = sub_100005B8C(v162, v164, v196);
      v143 = v175;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v195, v196, v153 + 54, v153 + 62);

      swift_bridgeObjectRelease(v164);
      _os_log_impl((void *)&_mh_execute_header, v150, (os_log_type_t)v190, "Successfully geocoded location. searchString=%{sensitive,mask.hash}s, location=%{private,mask.hash}s, unsanitizedSecondaryName=%{private,mask.hash}s", (uint8_t *)v153, 0x3Eu);
      v165 = v191;
      swift_arrayDestroy(v191, 3, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v165, -1, -1);
      v166 = v153;
      v148 = v186;
      swift_slowDealloc(v166, -1, -1);

    }
    else
    {
      swift_bridgeObjectRelease_n(v65, 2);
      v160 = *(void (**)(char *, uint64_t, __n128))(v146 + 8);
      ((void (*)(char *, uint64_t))v160)(v147, v148);

    }
    (*(void (**)(uint64_t, uint64_t))(v193 + 8))(v145, v194);
    v185(v143);

    ((void (*)(char *, uint64_t))v160)(v143, v148);
    (*(void (**)(char *, uint64_t))(v178 + 8))(v177, v179);
  }
}

void sub_10000E818(uint64_t a1, void *a2, void *a3)
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

uint64_t LocalSearchRequestService.deinit()
{
  uint64_t v0;

  sub_10000641C((_QWORD *)(v0 + 16));
  return v0;
}

uint64_t LocalSearchRequestService.__deallocating_deinit()
{
  uint64_t v0;

  sub_10000641C((_QWORD *)(v0 + 16));
  return swift_deallocClassInstance(v0, 56, 7);
}

void sub_10000E8CC(uint64_t a1, uint64_t a2)
{
  LocalSearchRequestService.performLocalSearch(with:)(a1, a2);
}

void sub_10000E8E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  LocalSearchRequestService.performLocalSearch(with:calloutTitle:)(a1, a2, a3);
}

void sub_10000E8F4(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4;

  v4 = String._bridgeToObjectiveC()();
  objc_msgSend(a3, "setNaturalLanguageQuery:", v4);

}

_QWORD *sub_10000E938(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v14;

  v7 = *(_QWORD *)(a3 - 8);
  __chkstk_darwin(a1, a2);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (_QWORD *)swift_allocObject(v10, 56, 7);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, a3);
  v12 = sub_10000E9F0((uint64_t)v9, v11, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, a3);
  return v12;
}

_QWORD *sub_10000E9F0(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v7;

  a2[5] = a3;
  a2[6] = a4;
  v7 = sub_1000084C4(a2 + 2);
  (*(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(v7, a1, a3);
  return a2;
}

void sub_10000EA40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  sub_10000D770(a1, a2, a3, a4, *(void **)(v4 + 16), *(_QWORD *)(v4 + 24), *(_QWORD *)(v4 + 32));
}

uint64_t type metadata accessor for LocalSearchRequestService()
{
  return objc_opt_self(_TtC14WeatherIntents25LocalSearchRequestService);
}

uint64_t sub_10000EA6C()
{
  _QWORD *v0;

  swift_bridgeObjectRelease(v0[3]);
  swift_release(v0[5]);
  swift_release(v0[7]);
  return swift_deallocObject(v0, 64, 7);
}

void sub_10000EAA0(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_10000D89C(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(void (**)(void))(v2 + 32), *(_QWORD *)(v2 + 40), *(void (**)(char *))(v2 + 48), *(_QWORD *)(v2 + 56));
}

uint64_t sub_10000EAB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000EAC0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_10000EAC8()
{
  unint64_t result;

  result = qword_100019860;
  if (!qword_100019860)
  {
    result = swift_getWitnessTable(&unk_100011B08, &type metadata for LocalSearchRequestService.LocalSearchRequestError);
    atomic_store(result, (unint64_t *)&qword_100019860);
  }
  return result;
}

uint64_t sub_10000EB04(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000062F4(&qword_100019518);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_QWORD *initializeBufferWithCopyOfBuffer for LocalSearchRequestService.LocalSearchRequestError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = *a2;
  if (*a2 >= 0xFFFFFFFFuLL)
    swift_errorRetain(*a2);
  *a1 = v3;
  return a1;
}

unint64_t destroy for LocalSearchRequestService.LocalSearchRequestError(unint64_t *a1)
{
  unint64_t result;

  result = *a1;
  if (result >= 0xFFFFFFFF)
    return swift_errorRelease(result);
  return result;
}

unint64_t *assignWithCopy for LocalSearchRequestService.LocalSearchRequestError(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = *a1;
  v4 = *a2;
  if (v3 < 0xFFFFFFFF)
  {
    if (v4 >= 0xFFFFFFFF)
      swift_errorRetain(*a2);
    *a1 = v4;
  }
  else if (v4 < 0xFFFFFFFF)
  {
    swift_errorRelease(v3);
    *a1 = *a2;
  }
  else
  {
    swift_errorRetain(*a2);
    v5 = *a1;
    *a1 = v4;
    swift_errorRelease(v5);
  }
  return a1;
}

_QWORD *initializeWithTake for LocalSearchRequestService.LocalSearchRequestError(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

unint64_t *assignWithTake for LocalSearchRequestService.LocalSearchRequestError(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *a1;
  v4 = *a2;
  if (v3 < 0xFFFFFFFF)
    goto LABEL_6;
  if (v4 < 0xFFFFFFFF)
  {
    swift_errorRelease(v3);
LABEL_6:
    *a1 = v4;
    return a1;
  }
  *a1 = v4;
  swift_errorRelease(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for LocalSearchRequestService.LocalSearchRequestError(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 1;
  if (v4 >= 3)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for LocalSearchRequestService.LocalSearchRequestError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2 + 1;
  }
  return result;
}

uint64_t sub_10000ED48(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_10000ED64(_QWORD *result, int a2)
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

ValueMetadata *type metadata accessor for LocalSearchRequestService.LocalSearchRequestError()
{
  return &type metadata for LocalSearchRequestService.LocalSearchRequestError;
}

uint64_t sub_10000EDAC(uint64_t a1)
{
  return swift_allocObject(a1, *(unsigned int *)(a1 + 48), *(unsigned __int16 *)(a1 + 52));
}

void WeatherIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  sub_10000F888();
  WeatherIntentResponse.init(code:userActivity:)(a1, a2);
  sub_10000F890();
}

id WeatherIntent.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WeatherIntent();
  return objc_msgSendSuper2(&v2, "init");
}

void WeatherIntent.init(coder:)()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for WeatherIntent();
  sub_10000F87C((uint64_t)v7.super_class, "initWithCoder:", v1, v2, v3, v4, v5, v6, v7);
  sub_10000F874();
  sub_10000F89C();
}

void WeatherIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  NSString v6;

  v4 = v3;
  if (a2)
  {
    v6 = String._bridgeToObjectiveC()();
    sub_10000F8CC();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(objc_allocWithZone(v4), "initWithIdentifier:backingStore:", v6, a3);

  sub_10000F890();
}

void WeatherIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  NSString v5;
  objc_super v6;

  if (a2)
  {
    v5 = String._bridgeToObjectiveC()();
    sub_10000F8CC();
  }
  else
  {
    v5 = 0;
  }
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for WeatherIntent();
  objc_msgSendSuper2(&v6, "initWithIdentifier:backingStore:", v5, a3);

  sub_10000F8BC();
}

uint64_t WeatherIntent.__allocating_init(domain:verb:parametersByName:)()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  NSDictionary v4;

  sub_10000F8A8();
  sub_10000F8FC();
  sub_10000F914();
  sub_10000F8E8();
  if (v3)
  {
    v4.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    sub_10000F8CC();
  }
  else
  {
    v4.super.isa = 0;
  }
  objc_msgSend(sub_10000F888(), "initWithDomain:verb:parametersByName:", v0, v2, v4.super.isa);
  sub_10000F874();

  return v1;
}

void *WeatherIntent.init(domain:verb:parametersByName:)()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  NSDictionary v4;
  objc_super v6;

  sub_10000F8A8();
  sub_10000F8FC();
  sub_10000F914();
  sub_10000F8E8();
  if (v3)
  {
    v4.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    sub_10000F8CC();
  }
  else
  {
    v4.super.isa = 0;
  }
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for WeatherIntent();
  objc_msgSendSuper2(&v6, "initWithDomain:verb:parametersByName:", v0, v2, v4.super.isa);
  sub_10000F874();

  return v1;
}

id WeatherIntent.__deallocating_deinit()
{
  return sub_10000F7A0(type metadata accessor for WeatherIntent);
}

unint64_t WeatherIntentResponseCode.init(rawValue:)(unint64_t result)
{
  if (result > 6)
    return 0;
  return result;
}

BOOL sub_10000F1C8(uint64_t *a1, uint64_t *a2)
{
  return sub_10000F1D4(*a1, *a2);
}

BOOL sub_10000F1D4(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

Swift::Int sub_10000F1E0()
{
  Swift::UInt *v0;

  return sub_10000F1E8(*v0);
}

Swift::Int sub_10000F1E8(Swift::UInt a1)
{
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

void sub_10000F22C(int a1)
{
  Swift::UInt *v1;

  sub_10000F234(a1, *v1);
}

void sub_10000F234(int a1, Swift::UInt a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int sub_10000F258(uint64_t a1)
{
  Swift::UInt *v1;

  return sub_10000F260(a1, *v1);
}

Swift::Int sub_10000F260(uint64_t a1, Swift::UInt a2)
{
  _QWORD v4[9];

  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(a2);
  return Hasher._finalize()();
}

unint64_t sub_10000F2A0@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = WeatherIntentResponseCode.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_10000F2D0(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t WeatherIntentResponse.code.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR___WeatherIntentResponse_code;
  swift_beginAccess(v0 + OBJC_IVAR___WeatherIntentResponse_code, v3, 0, 0);
  return *(_QWORD *)v1;
}

uint64_t sub_10000F364(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_QWORD *)(v1 + OBJC_IVAR___WeatherIntentResponse_code);
  result = sub_10000F8DC((uint64_t)v3, (uint64_t)v5);
  *v3 = a1;
  return result;
}

char *WeatherIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  void *v2;
  char *v5;
  char *v6;
  char *v7;
  char v9[24];

  v5 = (char *)objc_msgSend(v2, "init");
  v6 = &v5[OBJC_IVAR___WeatherIntentResponse_code];
  sub_10000F8DC((uint64_t)&v5[OBJC_IVAR___WeatherIntentResponse_code], (uint64_t)v9);
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, "setUserActivity:", a2);

  return v7;
}

uint64_t type metadata accessor for WeatherIntent()
{
  return objc_opt_self(WeatherIntent);
}

id WeatherIntentResponse.__allocating_init()()
{
  return objc_msgSend(sub_10000F888(), "init");
}

id WeatherIntentResponse.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)sub_10000F8D4(OBJC_IVAR___WeatherIntentResponse_code);
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for WeatherIntentResponse()
{
  return objc_opt_self(WeatherIntentResponse);
}

uint64_t WeatherIntentResponse.__allocating_init(coder:)()
{
  uint64_t v0;
  id v1;

  v1 = sub_10000F888();
  sub_10000F8F4(v1, "initWithCoder:");
  sub_10000F874();
  return v0;
}

void WeatherIntentResponse.init(coder:)()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = v0;
  v7.super_class = (Class)sub_10000F8D4(OBJC_IVAR___WeatherIntentResponse_code);
  sub_10000F87C((uint64_t)v7.super_class, "initWithCoder:", v1, v2, v3, v4, v5, v6, v7);
  sub_10000F874();
  sub_10000F89C();
}

uint64_t WeatherIntentResponse.__allocating_init(backingStore:)()
{
  uint64_t v0;
  id v1;

  v1 = sub_10000F888();
  sub_10000F8F4(v1, "initWithBackingStore:");
  sub_10000F874();
  return v0;
}

void WeatherIntentResponse.init(backingStore:)()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = v0;
  v7.super_class = (Class)sub_10000F8D4(OBJC_IVAR___WeatherIntentResponse_code);
  sub_10000F87C((uint64_t)v7.super_class, "initWithBackingStore:", v1, v2, v3, v4, v5, v6, v7);
  sub_10000F874();
  sub_10000F89C();
}

void WeatherIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  id v1;

  if (a1)
  {
    Dictionary._bridgeToObjectiveC()();
    sub_10000F908();
  }
  v1 = sub_10000F888();
  sub_10000F8F4(v1, "initWithPropertiesByName:");
  sub_10000F874();
  sub_10000F890();
}

void WeatherIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  objc_super v9;

  *(_QWORD *)&v1[OBJC_IVAR___WeatherIntentResponse_code] = 0;
  if (a1)
  {
    Dictionary._bridgeToObjectiveC()();
    sub_10000F908();
  }
  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for WeatherIntentResponse();
  v8 = sub_10000F87C((uint64_t)v9.super_class, "initWithPropertiesByName:", v2, v3, v4, v5, v6, v7, v9);
  sub_10000F874();
  if (v1)

  sub_10000F8BC();
}

id WeatherIntentResponse.__deallocating_deinit()
{
  return sub_10000F7A0(type metadata accessor for WeatherIntentResponse);
}

id sub_10000F7A0(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

unint64_t sub_10000F7D4()
{
  unint64_t result;

  result = qword_100019878;
  if (!qword_100019878)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for WeatherIntentResponseCode, &type metadata for WeatherIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_100019878);
  }
  return result;
}

uint64_t sub_10000F810@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = WeatherIntentResponse.code.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10000F838(uint64_t *a1)
{
  return sub_10000F364(*a1);
}

ValueMetadata *type metadata accessor for WeatherIntentResponseCode()
{
  return &type metadata for WeatherIntentResponseCode;
}

void sub_10000F874()
{
  void *v0;

}

id sub_10000F87C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v9;

  return objc_msgSendSuper2(&a9, a2, v9);
}

id sub_10000F888()
{
  objc_class *v0;

  return objc_allocWithZone(v0);
}

NSString sub_10000F8A8()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10000F8CC()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_10000F8D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 + a1) = 0;
  return type metadata accessor for WeatherIntentResponse();
}

uint64_t sub_10000F8DC(uint64_t a1, uint64_t a2)
{
  return swift_beginAccess(a1, a2, 1, 0);
}

uint64_t sub_10000F8E8()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

id sub_10000F8F4(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

uint64_t sub_10000F8FC()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_10000F908()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

NSString sub_10000F914()
{
  return String._bridgeToObjectiveC()();
}

uint64_t WeatherLocation.__allocating_init(identifier:display:pronunciationHint:)()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  sub_1000100F4();
  if (v5)
  {
    String._bridgeToObjectiveC()();
    sub_1000100D0();
  }
  else
  {
    v0 = 0;
  }
  sub_1000100B0();
  sub_100010114();
  if (v3)
  {
    sub_100010108();
    sub_1000100E8();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(sub_10000F888(), "initWithIdentifier:displayString:pronunciationHint:", v0, v2, v4);
  sub_10000F874();

  return v1;
}

void *WeatherLocation.init(identifier:display:pronunciationHint:)()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  sub_1000100F4();
  if (v5)
  {
    String._bridgeToObjectiveC()();
    sub_1000100D0();
  }
  else
  {
    v0 = 0;
  }
  sub_1000100B0();
  sub_100010114();
  if (v3)
  {
    sub_100010108();
    sub_1000100E8();
  }
  else
  {
    v4 = 0;
  }
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for WeatherLocation();
  objc_msgSendSuper2(&v7, "initWithIdentifier:displayString:pronunciationHint:", v0, v2, v4);
  sub_10000F874();

  return v1;
}

uint64_t type metadata accessor for WeatherLocation()
{
  return objc_opt_self(WeatherLocation);
}

uint64_t WeatherLocation.__allocating_init(coder:)(uint64_t a1)
{
  uint64_t v1;

  objc_msgSend(sub_10000F888(), "initWithCoder:", a1);
  sub_10000F874();
  return v1;
}

void *WeatherLocation.init(coder:)()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for WeatherLocation();
  sub_10000F87C((uint64_t)v8.super_class, "initWithCoder:", v1, v2, v3, v4, v5, v6, v8);
  sub_10000F874();
  return v0;
}

id WeatherLocation.__deallocating_deinit()
{
  return sub_10000F7A0(type metadata accessor for WeatherLocation);
}

id static WeatherLocationResolutionResult.success(with:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  objc_super v8;

  v8.receiver = (id)sub_1000100DC();
  v8.super_class = (Class)&OBJC_METACLASS___WeatherLocationResolutionResult;
  v6 = sub_10000F87C((uint64_t)v8.receiver, "successWithResolvedObject:", v0, v1, v2, v3, v4, v5, v8);
  return sub_1000100A4(v6);
}

void static WeatherLocationResolutionResult.disambiguation(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __n128 v4;
  void *ObjCClassFromMetadata;
  Class isa;
  double v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  __n128 v11;
  uint64_t v12;
  objc_super v13;

  v2 = v1;
  v3 = a1;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v9 = a1;
    else
      v9 = a1 & 0xFFFFFFFFFFFFFF8;
    v10 = sub_1000100C8();
    v11 = swift_bridgeObjectRetain(v3);
    v12 = _bridgeCocoaArray<A>(_:)(v9, v10, v11);
    swift_bridgeObjectRelease(v3);
    v3 = v12;
  }
  else
  {
    v4 = swift_bridgeObjectRetain(a1);
    dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter(v4);
    sub_1000100C8();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata(v2);
  sub_1000100C8();
  isa = Array._bridgeToObjectiveC()().super.isa;
  *(_QWORD *)&v7 = swift_bridgeObjectRelease(v3).n128_u64[0];
  v13.receiver = ObjCClassFromMetadata;
  v13.super_class = (Class)&OBJC_METACLASS___WeatherLocationResolutionResult;
  v8 = objc_msgSendSuper2(&v13, "disambiguationWithObjectsToDisambiguate:", isa, v7);

  sub_10000F8BC();
}

unint64_t sub_10000FD10()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000198F8;
  if (!qword_1000198F8)
  {
    v1 = objc_opt_self(INObject);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000198F8);
  }
  return result;
}

id static WeatherLocationResolutionResult.confirmationRequired(with:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  objc_super v8;

  v8.receiver = (id)sub_1000100DC();
  v8.super_class = (Class)&OBJC_METACLASS___WeatherLocationResolutionResult;
  v6 = sub_10000F87C((uint64_t)v8.receiver, "confirmationRequiredWithObjectToConfirm:", v0, v1, v2, v3, v4, v5, v8);
  return sub_1000100A4(v6);
}

void static WeatherLocationResolutionResult.success(with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_100010088((uint64_t)"Fatal error", a2, a3, a4, a5, (uint64_t)"WeatherIntents/WeatherLocation.swift");
  __break(1u);
}

void static WeatherLocationResolutionResult.disambiguation(with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_100010088((uint64_t)"Fatal error", a2, a3, a4, a5, (uint64_t)"WeatherIntents/WeatherLocation.swift");
  __break(1u);
}

void static WeatherLocationResolutionResult.confirmationRequired(with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_100010088((uint64_t)"Fatal error", a2, a3, a4, a5, (uint64_t)"WeatherIntents/WeatherLocation.swift");
  __break(1u);
}

id WeatherLocationResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  id v5;

  v4 = sub_10000F888();
  Dictionary._bridgeToObjectiveC()();
  sub_1000100BC();
  v5 = objc_msgSend(v4, "initWithJSONDictionary:forIntent:", v2, a2);

  return v5;
}

void WeatherLocationResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v5;
  objc_super v6;

  Dictionary._bridgeToObjectiveC()();
  sub_1000100BC();
  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for WeatherLocationResolutionResult();
  objc_msgSendSuper2(&v6, "initWithJSONDictionary:forIntent:", v3, a2);
  sub_10000F874();
  v5 = v2;

  if (v5)
  sub_10000F8BC();
}

uint64_t type metadata accessor for WeatherLocationResolutionResult()
{
  return objc_opt_self(WeatherLocationResolutionResult);
}

id WeatherLocationResolutionResult.__deallocating_deinit()
{
  return sub_10000F7A0(type metadata accessor for WeatherLocationResolutionResult);
}

uint64_t sub_100010088(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return _assertionFailure(_:_:file:line:flags:)(a1, 11, 2, 0, 0xE000000000000000, a6, 36, 2);
}

id sub_1000100A4(id a1)
{
  return a1;
}

NSString sub_1000100B0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000100BC()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

unint64_t sub_1000100C8()
{
  return sub_10000FD10();
}

uint64_t sub_1000100D0()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_1000100DC()
{
  uint64_t v0;

  return swift_getObjCClassFromMetadata(v0);
}

uint64_t sub_1000100E8()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

NSString sub_100010108()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100010114()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

id objc_msgSend__weatherDisplayName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_weatherDisplayName");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_locality(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locality");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "name");
}

id objc_msgSend_placemark(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "placemark");
}
