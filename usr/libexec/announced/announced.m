int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  void **v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  NSString v45;
  void *v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  void **aBlock;
  _QWORD v67[5];

  v3 = type metadata accessor for Feature(0, argv, envp);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Logger(0);
  sub_1000029C8(v7, qword_100008050);
  sub_100002A08(v7, (uint64_t)qword_100008050);
  v8 = Logger.init(subsystem:category:)(0xD000000000000012, 0x8000000100003510, 1852399981, 0xE400000000000000);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "announced launching", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

  v12 = _set_user_dir_suffix("com.apple.announced");
  if ((v12 & 1) == 0)
  {
    v13 = Logger.logObject.getter(v12);
    v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "_set_user_dir_suffix failed!", v15, 2u);
      swift_slowDealloc(v15, -1, -1);
    }

  }
  qword_100008068 = (uint64_t)objc_msgSend(objc_allocWithZone((Class)ANRapportEventStreamHandler), "init");
  qword_100008070 = (uint64_t)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AnnounceServer(0)), "init");
  v16 = Logger.logObject.getter(qword_100008070);
  v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    v64 = v4;
    v18 = (uint8_t *)swift_slowAlloc(12, -1);
    v19 = swift_slowAlloc(8, -1);
    v63 = v6;
    v20 = (_QWORD *)v19;
    *(_DWORD *)v18 = 138412290;
    v21 = qword_100008070;
    aBlock = (void **)qword_100008070;
    v22 = (id)qword_100008070;
    v4 = v64;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, v67, v18 + 4, v18 + 12);
    *v20 = v21;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "XPC server started: %@", v18, 0xCu);
    v23 = sub_100002B1C(&qword_100008040);
    swift_arrayDestroy(v20, 1, v23);
    v24 = v20;
    v6 = v63;
    swift_slowDealloc(v24, -1, -1);
    swift_slowDealloc(v18, -1, -1);
  }

  byte_100008078 = 1;
  v25 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, enum case for Feature.server(_:), v3);
  v26 = Feature.isEnabled.getter(v25);
  v27 = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  if ((v26 & 1) != 0 && byte_100008078 == 1)
  {
    v28 = objc_msgSend((id)objc_opt_self(ANHomeManager), "shared");
    v29 = type metadata accessor for DropInCoreService(0);
    swift_allocObject(v29, *(unsigned int *)(v29 + 48), *(unsigned __int16 *)(v29 + 52));
    qword_100008080 = DropInCoreService.init(homeManagerProvider:)(v28);
    v30 = Logger.logObject.getter(qword_100008080);
    v31 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc(12, -1);
      v33 = (void **)swift_slowAlloc(32, -1);
      aBlock = v33;
      *(_DWORD *)v32 = 136315138;
      v65 = qword_100008080;
      swift_retain(qword_100008080);
      v34 = sub_100002B1C(&qword_100008038);
      v35 = String.init<A>(describing:)(&v65, v34);
      v37 = v36;
      v65 = sub_100002B5C(v35, v36, (uint64_t *)&aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v65, &aBlock, v32 + 4, v32 + 12);
      swift_bridgeObjectRelease(v37);
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "Drop In Core Service started: %s", v32, 0xCu);
      swift_arrayDestroy(v33, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v33, -1, -1);
      swift_slowDealloc(v32, -1, -1);
    }

    v39 = Logger.logObject.getter(v38);
    v40 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v41 = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, v40, "Adding Drop In Service to Rapport event stream handler", v41, 2u);
      swift_slowDealloc(v41, -1, -1);
    }

    v42 = (void *)qword_100008068;
    static Constants.Rapport.dropInServiceType.getter();
    v44 = v43;
    v45 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v44);
    v67[3] = sub_100002A20;
    v67[4] = 0;
    aBlock = _NSConcreteStackBlock;
    v67[0] = 1107296256;
    v67[1] = sub_100002A48;
    v67[2] = &unk_100004228;
    v46 = _Block_copy(&aBlock);
    objc_msgSend(v42, "addRapportServiceType:activationBlock:", v45, v46);
    _Block_release(v46);

  }
  v47 = Logger.logObject.getter(v27);
  v48 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v47, v48))
  {
    v49 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v49 = 0;
    _os_log_impl((void *)&_mh_execute_header, v47, v48, "Adding Announce Service to Rapport event stream handler", v49, 2u);
    swift_slowDealloc(v49, -1, -1);
  }

  v50 = Logger.logObject.getter(objc_msgSend((id)qword_100008068, "addAnnounceRapportServiceType"));
  v51 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v50, v51))
  {
    v52 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v52 = 0;
    _os_log_impl((void *)&_mh_execute_header, v50, v51, "Rapport event stream handler set", v52, 2u);
    swift_slowDealloc(v52, -1, -1);
  }

  v53 = Logger.logObject.getter(objc_msgSend((id)qword_100008068, "setEventStreamHandler"));
  v54 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v53, v54))
  {
    v55 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v55 = 0;
    _os_log_impl((void *)&_mh_execute_header, v53, v54, "announced finished launching", v55, 2u);
    swift_slowDealloc(v55, -1, -1);
  }

  v56 = static String._unconditionallyBridgeFromObjectiveC(_:)(ANDaemonUp);
  v58 = v57;
  v59 = String.utf8CString.getter(v56);
  swift_bridgeObjectRelease(v58);
  notify_post((const char *)(v59 + 32));
  swift_release(v59);
  v60 = objc_msgSend((id)objc_opt_self(NSRunLoop), "mainRunLoop");
  objc_msgSend(v60, "run");

  return 0;
}

uint64_t *sub_1000029C8(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100002A08(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_100002A20()
{
  uint64_t result;

  if (qword_100008080)
    return dispatch thunk of DropInCoreService.activateCompanionLinkClient(completionHandler:)();
  return result;
}

uint64_t sub_100002A48(uint64_t a1, void *aBlock)
{
  uint64_t v2;
  void (*v3)(void (*)(uint64_t), uint64_t);
  void *v4;
  uint64_t v5;

  v3 = *(void (**)(void (*)(uint64_t), uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = _Block_copy(aBlock);
  v5 = swift_allocObject(&unk_100004370, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  swift_retain(v2);
  v3(sub_100003220, v5);
  swift_release(v2);
  return swift_release(v5);
}

void sub_100002AB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = _convertErrorToNSError(_:)();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

uint64_t sub_100002B04(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100002B14(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100002B1C(uint64_t *a1)
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

uint64_t sub_100002B5C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100002C2C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100002E04((uint64_t)v12, *a3);
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
      sub_100002E04((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100002DE4(v12);
  return v7;
}

uint64_t sub_100002C2C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_100002E40(a5, a6);
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

uint64_t sub_100002DE4(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100002E04(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100002E40(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100002ED4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1000030AC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1000030AC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100002ED4(uint64_t a1, unint64_t a2)
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
      v5 = sub_100003048(v4, 0);
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

_QWORD *sub_100003048(uint64_t a1, uint64_t a2)
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
  v4 = sub_100002B1C(&qword_100008048);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_1000030AC(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100002B1C(&qword_100008048);
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

uint64_t sub_1000031FC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_100003220(uint64_t a1)
{
  uint64_t v1;

  sub_100002AB8(a1, *(_QWORD *)(v1 + 16));
}
