uint64_t start()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint8_t v5[16];

  v0 = objc_autoreleasePoolPush();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Hello World!", v5, 2u);
  }
  v1 = +[DPDBackgroundTaskManager sharedInstance](DPDBackgroundTaskManager, "sharedInstance");
  v2 = +[DPDPushManager sharedInstance](DPDPushManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  objc_msgSend(v3, "run");

  objc_autoreleasePoolPop(v0);
  return 0;
}

id sub_1000018D8()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PushManager()), "init");
  qword_100010DD8 = (uint64_t)result;
  return result;
}

void sub_100001944()
{
  char *v0;
  uint64_t ObjectType;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  void *v11;
  NSString v12;
  id v13;
  objc_class *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  NSString v22;
  uint64_t v23;
  NSString v24;
  uint64_t v25;
  id v26;
  char *v27;
  uint64_t v28;
  void *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  Class isa;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t, uint64_t);
  char *v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  objc_super v58;

  ObjectType = swift_getObjectType(v0);
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v54 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = &v0[OBJC_IVAR___DPDPushManager_pushTopic];
  *(_QWORD *)v5 = 0xD000000000000019;
  *((_QWORD *)v5 + 1) = 0x800000010000A520;
  v6 = qword_100010980;
  v7 = v0;
  if (v6 != -1)
    swift_once(&qword_100010980, sub_100009148);
  v53 = sub_100003768(v2, (uint64_t)qword_100010DF8);
  v8 = Logger.logObject.getter();
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Registering for pushes...", v10, 2u);
    swift_slowDealloc(v10, -1, -1);
  }

  if (qword_100010970 != -1)
    swift_once(&qword_100010970, sub_100007FF0);
  v11 = *(void **)(qword_100010DE8 + 16);
  v55 = v2;
  if (v11
    && (v12 = String._bridgeToObjectiveC()(),
        v13 = objc_msgSend(v11, "stringForKey:", v12),
        v12,
        v13))
  {
    v14 = (objc_class *)ObjectType;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
    v16 = v15;

  }
  else
  {
    v14 = (objc_class *)ObjectType;
    static String._unconditionallyBridgeFromObjectiveC(_:)(APSEnvironmentProduction);
    v16 = v17;
  }
  v18 = *((_QWORD *)v5 + 1);
  sub_100003EF0();
  v19 = swift_bridgeObjectRetain(v18);
  v20 = (void *)static OS_dispatch_queue.main.getter(v19);
  v21 = objc_allocWithZone((Class)APSConnection);
  v22 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v16, v23);
  v24 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v18, v25);
  v26 = objc_msgSend(v21, "initWithEnvironmentName:namedDelegatePort:queue:", v22, v24, v20);

  if (v26)
  {
    *(_QWORD *)&v7[OBJC_IVAR___DPDPushManager_connection] = v26;

    v58.receiver = v7;
    v58.super_class = v14;
    v27 = (char *)objc_msgSendSuper2(&v58, "init");
    v28 = OBJC_IVAR___DPDPushManager_connection;
    v29 = *(void **)&v27[OBJC_IVAR___DPDPushManager_connection];
    v30 = v27;
    objc_msgSend(v29, "setDelegate:", v30);
    v31 = sub_100003780(&qword_100010A78);
    v32 = swift_allocObject(v31, 48, 7);
    *(_OWORD *)(v32 + 16) = xmmword_100009A10;
    v33 = *(_QWORD *)&v30[OBJC_IVAR___DPDPushManager_pushTopic + 8];
    *(_QWORD *)(v32 + 32) = *(_QWORD *)&v30[OBJC_IVAR___DPDPushManager_pushTopic];
    *(_QWORD *)(v32 + 40) = v33;
    v34 = v29;
    swift_bridgeObjectRetain(v33);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v32, v36);
    objc_msgSend(v34, "_setEnabledTopics:", isa);

    v37 = v3;
    v38 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v39 = v54;
    v40 = v55;
    v38(v54, v53, v55);
    v14 = v30;
    v41 = Logger.logObject.getter();
    v42 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v41, v42))
    {

      (*(void (**)(char *, uint64_t))(v37 + 8))(v39, v40);
      return;
    }
    v53 = v37;
    v43 = (uint8_t *)swift_slowAlloc(12, -1);
    v44 = swift_slowAlloc(32, -1);
    v57 = v44;
    *(_DWORD *)v43 = 136315138;
    v45 = objc_msgSend(*(id *)&v27[v28], "enabledTopics");
    if (v45)
    {
      v46 = v45;
      v47 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v45, &type metadata for String);

      v48 = Array.description.getter(v47, &type metadata for String);
      v50 = v49;
      swift_bridgeObjectRelease(v47, v49);
      v56 = sub_100008AA8(v48, v50, &v57);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v56, &v57);

      swift_bridgeObjectRelease(v50, v51);
      _os_log_impl((void *)&_mh_execute_header, v41, v42, "Registered for push topics: %s", v43, 0xCu);
      swift_arrayDestroy(v44, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v44, -1, -1);
      swift_slowDealloc(v43, -1, -1);

      (*(void (**)(char *, uint64_t))(v53 + 8))(v39, v55);
      return;
    }
  }
  else
  {
    __break(1u);
  }

  __break(1u);
}

uint64_t sub_100001F4C@<X0>(char *a1@<X0>, uint64_t *a2@<X8>)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  v4 = sub_100003780(&qword_100010A68);
  v5 = swift_allocObject(v4, 72, 7);
  *(_OWORD *)(v5 + 16) = xmmword_100009A10;
  *(_QWORD *)(v5 + 56) = &type metadata for UInt8;
  *(_QWORD *)(v5 + 64) = &protocol witness table for UInt8;
  *(_BYTE *)(v5 + 32) = v3;
  result = String.init(format:_:)(0x786868323025, 0xE600000000000000, v5);
  *a2 = result;
  a2[1] = v7;
  return result;
}

void sub_100001FD4(uint64_t a1, uint64_t a2)
{
  __asm { BR              X9 }
}

uint64_t sub_10000202C(uint64_t a1)
{
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
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  __int16 v27;
  char v28;
  char v29;
  char v30;
  char v31;
  unsigned __int8 v32;

  v5 = v32;
  if (v32)
  {
    *(_QWORD *)(v4 - 104) = v1;
    v6 = v32;
    v7 = sub_100004F20(0, v32, 0);
    v8 = a1;
    v1 = *(_QWORD *)(v4 - 104);
    if ((_DWORD)v3)
    {
      if ((_DWORD)v3 == 1)
        v9 = (int)a1;
      else
        v9 = *(_QWORD *)(a1 + 16);
    }
    else
    {
      v9 = 0;
    }
    while (1)
    {
      if (!v6)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
LABEL_33:
        __break(1u);
LABEL_34:
        __break(1u);
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
        __break(1u);
        JUMPOUT(0x100002338);
      }
      *(_QWORD *)(v4 - 144) = v6;
      if ((_DWORD)v3)
      {
        if ((_DWORD)v3 == 1)
        {
          if (v9 < (int)a1 || v9 >= a1 >> 32)
            goto LABEL_31;
          v10 = v1;
          v11 = v2;
          v12 = ((uint64_t (*)(uint64_t))__DataStorage._bytes.getter)(v7);
          if (!v12)
          {
            __break(1u);
LABEL_38:
            __break(1u);
          }
          v13 = v12;
          v14 = ((uint64_t (*)(void))__DataStorage._offset.getter)();
          v15 = v9 - v14;
          if (__OFSUB__(v9, v14))
            goto LABEL_34;
        }
        else
        {
          if (v9 < *(_QWORD *)(v8 + 16))
            goto LABEL_33;
          if (v9 >= *(_QWORD *)(v8 + 24))
            goto LABEL_35;
          v10 = v1;
          v11 = v2;
          v17 = ((uint64_t (*)(uint64_t))__DataStorage._bytes.getter)(v7);
          if (!v17)
            goto LABEL_38;
          v13 = v17;
          v18 = ((uint64_t (*)(void))__DataStorage._offset.getter)();
          v15 = v9 - v18;
          if (__OFSUB__(v9, v18))
            goto LABEL_36;
        }
        v16 = *(_BYTE *)(v13 + v15);
        v2 = v11;
        v8 = a1;
      }
      else
      {
        if (v9 >= v32)
          goto LABEL_32;
        v10 = v1;
        *(_BYTE *)(v4 - 134) = v8;
        *(_DWORD *)(v4 - 133) = *(_DWORD *)((char *)&a1 + 1);
        *(_WORD *)(v4 - 129) = *(_WORD *)((char *)&a1 + 5);
        *(_BYTE *)(v4 - 127) = HIBYTE(a1);
        *(_WORD *)(v4 - 126) = v27;
        *(_BYTE *)(v4 - 124) = v28;
        *(_BYTE *)(v4 - 123) = v29;
        *(_BYTE *)(v4 - 122) = v30;
        *(_BYTE *)(v4 - 121) = v31;
        v16 = *(_BYTE *)(v4 - 134 + v9);
      }
      *(_BYTE *)(v4 - 134) = v16;
      v7 = sub_100001F4C((char *)(v4 - 134), (uint64_t *)(v4 - 120));
      if (v2)
        break;
      v19 = v8;
      v20 = v3;
      v21 = *(_QWORD *)(v4 - 120);
      v22 = *(_QWORD *)(v4 - 112);
      v1 = v10;
      *(_QWORD *)(v4 - 104) = v10;
      v24 = *(_QWORD *)(v10 + 16);
      v23 = *(_QWORD *)(v10 + 24);
      if (v24 >= v23 >> 1)
      {
        v7 = sub_100004F20(v23 > 1, v24 + 1, 1);
        v19 = a1;
        v1 = *(_QWORD *)(v4 - 104);
      }
      *(_QWORD *)(v1 + 16) = v24 + 1;
      v25 = v1 + 16 * v24;
      *(_QWORD *)(v25 + 32) = v21;
      *(_QWORD *)(v25 + 40) = v22;
      ++v9;
      v6 = *(_QWORD *)(v4 - 144) - 1;
      --v5;
      v3 = v20;
      v8 = v19;
      if (!v5)
        return v1;
    }
    swift_release(v10);
  }
  return v1;
}

uint64_t sub_10000245C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  __int128 v11;
  __int128 v12;
  _OWORD v14[4];
  uint64_t v15;

  sub_100003780(&qword_100010A40);
  v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  v6 = (char *)v14 - v5;
  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_OWORD *)(a1 + 48);
  v14[2] = *(_OWORD *)(a1 + 32);
  v14[3] = v11;
  v15 = *(_QWORD *)(a1 + 64);
  v12 = *(_OWORD *)(a1 + 16);
  v14[0] = *(_OWORD *)a1;
  v14[1] = v12;
  sub_100004858();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v4, 0, 1, v7);
  sub_100003918((uint64_t)v4, (uint64_t)v6, &qword_100010A40);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
    return sub_10000395C((uint64_t)v6);
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
  sub_10000399C((uint64_t)v10);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

id sub_1000025C8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PushManager()
{
  return objc_opt_self(DPDPushManager);
}

void sub_100002658(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_100002660(uint64_t a1)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_100009B00, a1);
  return _CFObject.hashValue.getter(a1, WitnessTable);
}

uint64_t sub_10000269C(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_100009B00, a2);
  return _CFObject.hash(into:)(a1, a2, WitnessTable);
}

Swift::Int sub_1000026E4(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable;
  _QWORD v5[9];

  Hasher.init(_seed:)(v5);
  WitnessTable = swift_getWitnessTable(&unk_100009B00, a2);
  _CFObject.hash(into:)(v5, a2, WitnessTable);
  return Hasher._finalize()();
}

_QWORD *sub_10000273C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_100002748(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t WitnessTable;

  v4 = *a1;
  v5 = *a2;
  WitnessTable = swift_getWitnessTable(&unk_100009B00, a3);
  return static _CFObject.== infix(_:_:)(v4, v5, a3, WitnessTable);
}

uint64_t sub_100002794(uint64_t (*a1)(void))
{
  uint64_t v1;

  v1 = a1();
  return _swift_stdlib_bridgeErrorToNSError(v1);
}

uint64_t sub_1000027B4(uint64_t (*a1)(void))
{
  return a1();
}

void sub_1000027D4(void *a1, char a2)
{
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  if (qword_100010980 != -1)
    swift_once(&qword_100010980, sub_100009148);
  v4 = type metadata accessor for Logger(0);
  sub_100003768(v4, (uint64_t)qword_100010DF8);
  v12 = a1;
  v5 = Logger.logObject.getter();
  v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = swift_slowAlloc(28, -1);
    v8 = (_QWORD *)swift_slowAlloc(8, -1);
    v9 = swift_slowAlloc(32, -1);
    v14 = v9;
    *(_DWORD *)v7 = 138412802;
    if (a1)
    {
      v13 = (uint64_t)v12;
      v10 = v12;
    }
    else
    {
      v13 = 0;
    }
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14);
    *v8 = a1;

    *(_WORD *)(v7 + 12) = 2080;
    v13 = sub_100008AA8(0xD000000000000027, 0x800000010000A4F0, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14);
    *(_WORD *)(v7 + 22) = 1024;
    LODWORD(v13) = a2 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, (char *)&v13 + 4);
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%@ %s connected: %{BOOL}d", (uint8_t *)v7, 0x1Cu);
    v11 = sub_100003780(&qword_100010A48);
    swift_arrayDestroy(v8, 1, v11);
    swift_slowDealloc(v8, -1, -1);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v7, -1, -1);

  }
  else
  {

  }
}

void sub_100002A94(void *a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  if (qword_100010980 != -1)
    swift_once(&qword_100010980, sub_100009148);
  v2 = type metadata accessor for Logger(0);
  sub_100003768(v2, (uint64_t)qword_100010DF8);
  v10 = a1;
  v3 = Logger.logObject.getter();
  v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = swift_slowAlloc(22, -1);
    v6 = (_QWORD *)swift_slowAlloc(8, -1);
    v7 = swift_slowAlloc(32, -1);
    v12 = v7;
    *(_DWORD *)v5 = 138412546;
    if (a1)
    {
      v11 = (uint64_t)v10;
      v8 = v10;
    }
    else
    {
      v11 = 0;
    }
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12);
    *v6 = a1;

    *(_WORD *)(v5 + 12) = 2080;
    v11 = sub_100008AA8(0xD00000000000001ALL, 0x800000010000A4D0, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%@ %s", (uint8_t *)v5, 0x16u);
    v9 = sub_100003780(&qword_100010A48);
    swift_arrayDestroy(v6, 1, v9);
    swift_slowDealloc(v6, -1, -1);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v5, -1, -1);

  }
  else
  {

  }
}

void sub_100002D2C(void *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[16];
  uint64_t v25;

  if (a3 >> 60 != 15)
  {
    sub_100003E1C(a2, a3);
    sub_100001FD4(a2, a3);
    v7 = v6;
    v25 = v6;
    v8 = sub_100003780(&qword_100010A58);
    v9 = sub_100003E60();
    v10 = BidirectionalCollection<>.joined(separator:)(0, 0xE000000000000000, v8, v9);
    v12 = v11;
    swift_bridgeObjectRelease(v7, v11);
    if (qword_100010980 != -1)
      swift_once(&qword_100010980, sub_100009148);
    v13 = type metadata accessor for Logger(0);
    sub_100003768(v13, (uint64_t)qword_100010DF8);
    v14 = a1;
    v15 = swift_bridgeObjectRetain(v12);
    v16 = Logger.logObject.getter(v15);
    v17 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = swift_slowAlloc(32, -1);
      v21 = (_QWORD *)swift_slowAlloc(8, -1);
      v22 = swift_slowAlloc(64, -1);
      v25 = v22;
      *(_DWORD *)v18 = 138412802;
      if (a1)
      {
        v23 = (uint64_t)v14;
        v19 = v14;
      }
      else
      {
        v23 = 0;
      }
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, v24);
      *v21 = a1;

      *(_WORD *)(v18 + 12) = 2080;
      v23 = sub_100008AA8(0xD000000000000024, 0x800000010000A4A0, &v25);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, v24);
      *(_WORD *)(v18 + 22) = 2080;
      swift_bridgeObjectRetain(v12);
      v23 = sub_100008AA8(v10, v12, &v25);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, v24);
      swift_bridgeObjectRelease_n(v12, 3);
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "%@ %s token: %s", (uint8_t *)v18, 0x20u);
      v20 = sub_100003780(&qword_100010A48);
      swift_arrayDestroy(v21, 1, v20);
      swift_slowDealloc(v21, -1, -1);
      swift_arrayDestroy(v22, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v22, -1, -1);
      swift_slowDealloc(v18, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n(v12, 2);

    }
    sub_100003DC4(a2, a3);

  }
}

void sub_10000306C(id a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t, uint64_t);
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  __objc2_prot_list *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t);
  char *v31;
  id v32;
  __objc2_prot_list *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  char *v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  uint64_t v54;
  id v55;
  void *v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  void (*v71)(char *, uint64_t, uint64_t);
  char *v72;
  _QWORD v73[9];
  _OWORD v74[4];
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;

  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v63 - v7;
  if (qword_100010980 != -1)
    swift_once(&qword_100010980, sub_100009148);
  v9 = sub_100003768(v2, (uint64_t)qword_100010DF8);
  v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v10(v8, v9, v2);
  v11 = a1;
  v12 = Logger.logObject.getter(v11);
  v67 = static os_log_type_t.default.getter();
  v13 = os_log_type_enabled(v12, (os_log_type_t)v67);
  v14 = &DPDPushManager__prots;
  v71 = v10;
  v70 = v9;
  if (!v13)
  {

    v30 = *(void (**)(char *, uint64_t))(v3 + 8);
    v30(v8, v2);
    v31 = v72;
    if (a1)
      goto LABEL_9;
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v66 = v3;
  v69 = v6;
  v15 = swift_slowAlloc(22, -1);
  v16 = swift_slowAlloc(64, -1);
  *(_QWORD *)&v76 = v16;
  *(_DWORD *)v15 = 136315394;
  if (!a1)
  {
    __break(1u);
    goto LABEL_26;
  }
  v65 = v16;
  v17 = objc_msgSend(v11, "topic");
  if (!v17)
  {
LABEL_26:

    __break(1u);
    goto LABEL_27;
  }
  v18 = v17;
  v68 = v2;
  a1 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
  v20 = v19;

  *(_QWORD *)&v74[0] = sub_100008AA8((uint64_t)a1, v20, (uint64_t *)&v76);
  v64 = (char *)v74 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(v74, (char *)v74 + 8);

  swift_bridgeObjectRelease(v20, v21);
  *(_WORD *)(v15 + 12) = 2080;
  v22 = objc_msgSend(v11, "userInfo");
  if (!v22)
  {
LABEL_27:

    __break(1u);
    goto LABEL_28;
  }
  v23 = v22;
  v24 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v22, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  v25 = Dictionary.description.getter(v24, &type metadata for AnyHashable);
  v27 = v26;
  swift_bridgeObjectRelease(v24, v26);
  *(_QWORD *)&v74[0] = sub_100008AA8(v25, v27, (uint64_t *)&v76);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(v74, v64);

  swift_bridgeObjectRelease(v27, v28);
  _os_log_impl((void *)&_mh_execute_header, v12, (os_log_type_t)v67, "Received push with topic: %s userInfo: %s", (uint8_t *)v15, 0x16u);
  v29 = v65;
  swift_arrayDestroy(v65, 2, (char *)&type metadata for Any + 8);
  swift_slowDealloc(v29, -1, -1);
  swift_slowDealloc(v15, -1, -1);

  v30 = *(void (**)(char *, uint64_t))(v66 + 8);
  v2 = v68;
  v30(v8, v68);
  v6 = v69;
  v31 = v72;
  v14 = &DPDPushManager__prots;
LABEL_9:
  v32 = objc_msgSend(v11, (SEL)v14[235].count);
  if (!v32)
    goto LABEL_19;
  a1 = v32;
  v33 = v14;
  v34 = static String._unconditionallyBridgeFromObjectiveC(_:)(v32);
  v36 = v35;

  v38 = *(_QWORD *)&v31[OBJC_IVAR___DPDPushManager_pushTopic];
  v39 = *(_QWORD *)&v31[OBJC_IVAR___DPDPushManager_pushTopic + 8];
  if (v34 == v38 && v36 == v39)
  {
    swift_bridgeObjectRelease(v36, v37);
    goto LABEL_14;
  }
  v40 = _stringCompareWithSmolCheck(_:_:expecting:)(v34, v36, v38, v39, 0);
  swift_bridgeObjectRelease(v36, v41);
  v14 = v33;
  if ((v40 & 1) == 0)
  {
LABEL_19:
    v71(v6, v70, v2);
    a1 = v11;
    v51 = Logger.logObject.getter(a1);
    v52 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v51, v52))
    {
      v69 = v6;
      v68 = v2;
      v53 = (uint8_t *)swift_slowAlloc(12, -1);
      v54 = swift_slowAlloc(32, -1);
      *(_QWORD *)&v76 = v54;
      *(_DWORD *)v53 = 136315138;
      v55 = objc_msgSend(a1, (SEL)v14[235].count);
      if (!v55)
      {
LABEL_30:

        __break(1u);
        return;
      }
      v56 = v55;
      v57 = static String._unconditionallyBridgeFromObjectiveC(_:)(v55);
      v59 = v58;

      *(_QWORD *)&v74[0] = sub_100008AA8(v57, v59, (uint64_t *)&v76);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v74, (char *)v74 + 8);

      swift_bridgeObjectRelease(v59, v60);
      _os_log_impl((void *)&_mh_execute_header, v51, v52, "Received push from unknown topic: %s", v53, 0xCu);
      swift_arrayDestroy(v54, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v54, -1, -1);
      swift_slowDealloc(v53, -1, -1);

      v61 = v69;
      v62 = v68;
    }
    else
    {

      v61 = v6;
      v62 = v2;
    }
    v30(v61, v62);
    return;
  }
LABEL_14:
  v42 = objc_msgSend(v11, "userInfo");
  if (!v42)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v43 = v42;
  v44 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v42, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  sub_1000053EC(v44, v73);
  swift_bridgeObjectRelease(v44, v45);
  sub_100003918((uint64_t)v73, (uint64_t)v74, &qword_100010A38);
  if (*((_QWORD *)&v74[0] + 1))
  {
    v78 = v74[2];
    v79 = v74[3];
    v80 = v75;
    v76 = v74[0];
    v77 = v74[1];
    if (qword_100010968 != -1)
      swift_once(&qword_100010968, sub_10000749C);
    v46 = swift_allocObject(&unk_10000C6F0, 96, 7);
    v47 = v79;
    *(_OWORD *)(v46 + 48) = v78;
    *(_OWORD *)(v46 + 64) = v47;
    v48 = v80;
    v49 = v77;
    *(_OWORD *)(v46 + 16) = v76;
    *(_OWORD *)(v46 + 32) = v49;
    *(_QWORD *)(v46 + 80) = v48;
    *(_QWORD *)(v46 + 88) = v31;
    sub_100003874(v73, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_100003818);
    v50 = v31;
    sub_100007058((uint64_t *)&v76, (uint64_t)sub_10000380C, v46);
    swift_release(v46);
    sub_100003874(v73, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1000038BC);
  }
}

uint64_t sub_100003768(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_100003780(uint64_t *a1)
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

uint64_t sub_1000037C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_bridgeObjectRelease(*(_QWORD *)(v2 + 24), a2);
  swift_bridgeObjectRelease(*(_QWORD *)(v2 + 40), v3);
  swift_bridgeObjectRelease(*(_QWORD *)(v2 + 56), v4);
  swift_bridgeObjectRelease(*(_QWORD *)(v2 + 72), v5);
  swift_bridgeObjectRelease(*(_QWORD *)(v2 + 80), v6);

  return swift_deallocObject(v2, 96, 7);
}

uint64_t sub_10000380C()
{
  uint64_t v0;

  return sub_10000245C(v0 + 16);
}

uint64_t sub_100003818(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain(a9);
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(a4);
    swift_bridgeObjectRetain(a6);
    return swift_bridgeObjectRetain(a8);
  }
  return result;
}

_QWORD *sub_100003874(_QWORD *a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8]);
  return a1;
}

uint64_t sub_1000038BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease(a2, a2);
    swift_bridgeObjectRelease(a4, v12);
    swift_bridgeObjectRelease(a6, v13);
    swift_bridgeObjectRelease(a8, v14);
    return swift_bridgeObjectRelease(a9, v15);
  }
  return result;
}

uint64_t sub_100003918(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100003780(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000395C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100003780(&qword_100010A40);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_10000399C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint8_t *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  NSURL *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  _QWORD *v33;
  void *v34;
  uint64_t v35;
  _QWORD v36[2];
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;

  v2 = type metadata accessor for URL(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100010980 != -1)
    swift_once(&qword_100010980, sub_100009148);
  v6 = type metadata accessor for Logger(0);
  v7 = sub_100003768(v6, (uint64_t)qword_100010DF8);
  v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v36[0] = a1;
    v11 = swift_slowAlloc(12, -1);
    v36[1] = v7;
    v12 = (uint8_t *)v11;
    v13 = (void *)swift_slowAlloc(32, -1);
    v39 = v13;
    *(_DWORD *)v12 = 136315138;
    v14 = sub_100003FC4(&qword_100010A50, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
    v15 = dispatch thunk of CustomStringConvertible.description.getter(v2, v14);
    v17 = v16;
    v37 = sub_100008AA8(v15, v16, (uint64_t *)&v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v37, &v38);
    swift_bridgeObjectRelease(v17, v18);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Opening URL %s", v12, 0xCu);
    swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v12, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }

  v19 = objc_msgSend((id)objc_opt_self(LSApplicationWorkspace), "defaultWorkspace");
  if (!v19)
    __break(1u);
  v21 = v19;
  URL._bridgeToObjectiveC()(v20);
  v23 = v22;
  v39 = 0;
  v24 = objc_msgSend(v21, "openURL:configuration:error:", v22, 0, &v39);

  v25 = v39;
  if (v24)
  {
    v26 = v39;

  }
  else
  {
    v27 = v39;
    v28 = _convertNSErrorToError(_:)(v25);

    swift_willThrow();
    swift_errorRetain(v28);
    v29 = swift_errorRetain(v28);
    v30 = Logger.logObject.getter(v29);
    v31 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc(12, -1);
      v33 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v32 = 138412290;
      swift_errorRetain(v28);
      v34 = (void *)_swift_stdlib_bridgeErrorToNSError(v28);
      v39 = v34;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, &v40);
      *v33 = v34;
      swift_errorRelease(v28);
      swift_errorRelease(v28);
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "Failed to open url: %@", v32, 0xCu);
      v35 = sub_100003780(&qword_100010A48);
      swift_arrayDestroy(v33, 1, v35);
      swift_slowDealloc(v33, -1, -1);
      swift_slowDealloc(v32, -1, -1);

      swift_errorRelease(v28);
    }
    else
    {
      swift_errorRelease(v28);
      swift_errorRelease(v28);
      swift_errorRelease(v28);

    }
  }
}

uint64_t sub_100003DC4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_100003DD8(a1, a2);
  return a1;
}

uint64_t sub_100003DD8(uint64_t a1, unint64_t a2)
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

uint64_t sub_100003E1C(uint64_t a1, unint64_t a2)
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

unint64_t sub_100003E60()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100010A60;
  if (!qword_100010A60)
  {
    v1 = sub_100003EAC(&qword_100010A58);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100010A60);
  }
  return result;
}

uint64_t sub_100003EAC(uint64_t *a1)
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

unint64_t sub_100003EF0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100010A70;
  if (!qword_100010A70)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100010A70);
  }
  return result;
}

void type metadata accessor for CFString(uint64_t a1)
{
  sub_100003F54(a1, &qword_100010A80, (uint64_t)&unk_10000C718);
}

void type metadata accessor for CFDictionary(uint64_t a1)
{
  sub_100003F54(a1, &qword_100010A88, (uint64_t)&unk_10000C748);
}

void sub_100003F54(uint64_t a1, unint64_t *a2, uint64_t a3)
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

uint64_t sub_100003F98()
{
  return sub_100003FC4(&qword_100010A90, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_100009B2C);
}

uint64_t sub_100003FC4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100004004()
{
  return sub_100003FC4(&qword_100010A98, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_100009AD4);
}

uint64_t sub_100004030(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int64_t v6;
  unint64_t *v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  int64_t v14;
  unint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t *v40;

  v3 = type metadata accessor for URLQueryItem(0);
  v37 = *(_QWORD *)(v3 - 8);
  v38 = v3;
  __chkstk_darwin();
  v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (!v6)
    return (uint64_t)v7;
  v32 = v1;
  v40 = (unint64_t *)&_swiftEmptyArrayStorage;
  sub_100004F3C(0, v6, 0);
  v7 = v40;
  result = sub_1000052E0(a1);
  v10 = result;
  v11 = 0;
  v12 = a1 + 64;
  v33 = a1 + 80;
  v34 = v6;
  v35 = v9;
  v36 = a1 + 64;
  while ((v10 & 0x8000000000000000) == 0 && v10 < 1 << *(_BYTE *)(a1 + 32))
  {
    v15 = (unint64_t)v10 >> 6;
    if ((*(_QWORD *)(v12 + 8 * ((unint64_t)v10 >> 6)) & (1 << v10)) == 0)
      goto LABEL_23;
    if (*(_DWORD *)(a1 + 36) != (_DWORD)v9)
      goto LABEL_24;
    v39 = v11;
    v16 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v10);
    v17 = *v16;
    v18 = v16[1];
    v19 = (uint64_t *)(*(_QWORD *)(a1 + 56) + 16 * v10);
    v20 = a1;
    v21 = *v19;
    v22 = v19[1];
    swift_bridgeObjectRetain(v18);
    swift_bridgeObjectRetain(v22);
    URLQueryItem.init(name:value:)(v17, v18, v21, v22);
    swift_bridgeObjectRelease(v22, v23);
    swift_bridgeObjectRelease(v18, v24);
    v40 = v7;
    v26 = v7[2];
    v25 = v7[3];
    if (v26 >= v25 >> 1)
    {
      sub_100004F3C(v25 > 1, v26 + 1, 1);
      v7 = v40;
    }
    v7[2] = v26 + 1;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v37 + 32))((unint64_t)v7+ ((*(unsigned __int8 *)(v37 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80))+ *(_QWORD *)(v37 + 72) * v26, v5, v38);
    v13 = 1 << *(_BYTE *)(v20 + 32);
    if (v10 >= v13)
      goto LABEL_25;
    v12 = v36;
    v27 = *(_QWORD *)(v36 + 8 * v15);
    if ((v27 & (1 << v10)) == 0)
      goto LABEL_26;
    a1 = v20;
    LODWORD(v9) = v35;
    if (*(_DWORD *)(v20 + 36) != (_DWORD)v35)
      goto LABEL_27;
    v28 = v27 & (-2 << (v10 & 0x3F));
    if (v28)
    {
      v13 = __clz(__rbit64(v28)) | v10 & 0xFFFFFFFFFFFFFFC0;
      v14 = v34;
    }
    else
    {
      v29 = v15 + 1;
      v30 = (unint64_t)(v13 + 63) >> 6;
      v14 = v34;
      if (v15 + 1 < v30)
      {
        v31 = *(_QWORD *)(v36 + 8 * v29);
        if (v31)
        {
LABEL_20:
          v13 = __clz(__rbit64(v31)) + (v29 << 6);
        }
        else
        {
          while (v30 - 2 != v15)
          {
            v31 = *(_QWORD *)(v33 + 8 * v15++);
            if (v31)
            {
              v29 = v15 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    v11 = v39 + 1;
    v10 = v13;
    if (v39 + 1 == v14)
      return (uint64_t)v7;
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_1000042DC()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  sub_100003780(&qword_100010A40);
  __chkstk_darwin();
  v1 = (char *)&v6 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for URL(0);
  sub_1000052A0(v2, qword_100010B00);
  v3 = sub_100003768(v2, (uint64_t)qword_100010B00);
  URL.init(string:)(0x2F2F3A7367616964, 0xE800000000000000);
  v4 = *(_QWORD *)(v2 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48))(v1, 1, v2);
  if ((_DWORD)result != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v4 + 32))(v3, v1, v2);
  __break(1u);
  return result;
}

void sub_1000043B8()
{
  qword_100010B18 = 25705;
  unk_100010B20 = 0xE200000000000000;
}

uint64_t sub_1000043D0()
{
  return 1;
}

uint64_t sub_1000043E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1000059B8(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_10000440C()
{
  return 0;
}

void sub_100004418(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_100004424(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100005BBC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000444C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100005BBC();
  return CodingKey.debugDescription.getter(a1, v2);
}

__n128 sub_100004474@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v5;
  _OWORD v6[4];
  uint64_t v7;

  sub_100005A3C(a1, (uint64_t)v6);
  if (!v2)
  {
    v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_QWORD *)(a2 + 64) = v7;
    result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

Swift::Int sub_1000044C4()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

void sub_100004504()
{
  Hasher._combine(_:)(0);
}

Swift::Int sub_100004528()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

uint64_t sub_100004568@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_100005DA8(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_100004590(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100005F94();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000045B8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100005F94();
  return CodingKey.debugDescription.getter(a1, v2);
}

__n128 sub_1000045E0@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v5;
  _OWORD v6[4];
  uint64_t v7;

  sub_100005E38(a1, (uint64_t)v6);
  if (!v2)
  {
    v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_QWORD *)(a2 + 64) = v7;
    result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

Swift::Int sub_100004634()
{
  return sub_1000063C0(0x74736F6E67616964, 0xEB00000000736369);
}

Swift::Int sub_100004668(uint64_t a1)
{
  return sub_100005368(a1, 0x74736F6E67616964, 0xEB00000000736369);
}

uint64_t sub_100004698@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::OpaquePointer v2;

  v2._rawValue = &off_10000C5D8;
  return sub_10000478C(v2, a1, a2);
}

uint64_t sub_1000046A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1000063A0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000046C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_100006FC8();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

Swift::Int sub_100004724()
{
  return sub_1000063C0(0x697373655377656ELL, 0xEA00000000006E6FLL);
}

Swift::Int sub_100004754(uint64_t a1)
{
  return sub_100005368(a1, 0x697373655377656ELL, 0xEA00000000006E6FLL);
}

uint64_t sub_100004780@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::OpaquePointer v2;

  v2._rawValue = &off_10000C610;
  return sub_10000478C(v2, a1, a2);
}

uint64_t sub_10000478C@<X0>(Swift::OpaquePointer cases@<0:X3>, uint64_t *a2@<X0>, BOOL *a3@<X8>)
{
  Swift::String v4;
  void *v5;
  Swift::Int v6;
  uint64_t v7;
  uint64_t result;

  v4._countAndFlagsBits = *a2;
  v5 = (void *)a2[1];
  v4._object = v5;
  v6 = _findStringSwitchCase(cases:string:)(cases, v4);
  result = swift_bridgeObjectRelease(v5, v7);
  *a3 = v6 != 0;
  return result;
}

uint64_t sub_1000047D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_10000640C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000047FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_10000700C();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

id sub_100004858()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id result;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE v27[16];

  v1 = type metadata accessor for URLQueryItem(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin();
  v5 = &v27[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = *(_QWORD *)(v0 + 64);
  if (v6)
  {
    v7 = *(_QWORD *)(v0 + 64);
  }
  else
  {
    v7 = sub_10000737C((uint64_t)&_swiftEmptyArrayStorage, v3);
    v6 = 0;
  }
  swift_bridgeObjectRetain(v6);
  v9 = sub_100004030(v7);
  if (qword_100010960 != -1)
    swift_once(&qword_100010960, sub_1000043B8);
  if (*(_QWORD *)(v7 + 16)
    && (v11 = qword_100010B18,
        v10 = unk_100010B20,
        swift_bridgeObjectRetain(unk_100010B20),
        sub_100007B50(v11, v10),
        LOBYTE(v11) = v12,
        swift_bridgeObjectRelease(v10, v12),
        (v11 & 1) != 0))
  {
    swift_bridgeObjectRelease(v7, v8);
  }
  else
  {
    v13 = swift_bridgeObjectRelease(v7, v8);
    v14 = qword_100010B18;
    v15 = unk_100010B20;
    result = (id)MobileGestalt_get_current_device(v13);
    if (!result)
    {
      __break(1u);
      return result;
    }
    v17 = result;
    v18 = (id)MobileGestalt_copy_serialNumber_obj();

    if (v18)
    {
      v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
      v21 = v20;

    }
    else
    {
      v19 = 0;
      v21 = 0;
    }
    URLQueryItem.init(name:value:)(v14, v15, v19, v21);
    swift_bridgeObjectRelease(v21, v22);
    if ((swift_isUniquelyReferenced_nonNull_native(v9) & 1) == 0)
      v9 = sub_100004D18(0, *(_QWORD *)(v9 + 16) + 1, 1, v9);
    v24 = *(_QWORD *)(v9 + 16);
    v23 = *(_QWORD *)(v9 + 24);
    if (v24 >= v23 >> 1)
      v9 = sub_100004D18(v23 > 1, v24 + 1, 1, v9);
    *(_QWORD *)(v9 + 16) = v24 + 1;
    (*(void (**)(unint64_t, _BYTE *, uint64_t))(v2 + 32))(v9+ ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))+ *(_QWORD *)(v2 + 72) * v24, v5, v1);
  }
  if (qword_100010958 != -1)
    swift_once(&qword_100010958, sub_1000042DC);
  v25 = type metadata accessor for URL(0);
  sub_100003768(v25, (uint64_t)qword_100010B00);
  URL.appending(queryItems:)(v9);
  return (id)swift_bridgeObjectRelease(v9, v26);
}

uint64_t sub_100004AD4(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_100004B0C + 4 * byte_100009B80[a1]))(0xD000000000000012, 0x800000010000A650);
}

uint64_t sub_100004B0C()
{
  return 0x79726F6765746163;
}

uint64_t sub_100004B24()
{
  return 0x6E6F69746361;
}

uint64_t sub_100004B38()
{
  return 0x656C746974;
}

uint64_t sub_100004B4C()
{
  return 2036625250;
}

BOOL sub_100004B80(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100004B94()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100004BD8()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100004C00()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_100004C40()
{
  unsigned __int8 *v0;

  return sub_100004AD4(*v0);
}

uint64_t sub_100004C48@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_100006428(a1, a2);
  *a3 = result;
  return result;
}

void sub_100004C6C(_BYTE *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_100004C78(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100006AC4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100004CA0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100006AC4();
  return CodingKey.debugDescription.getter(a1, v2);
}

__n128 sub_100004CC8@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v5;
  _OWORD v6[4];
  uint64_t v7;

  sub_1000066B0(a1, (uint64_t *)v6);
  if (!v2)
  {
    v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_QWORD *)(a2 + 64) = v7;
    result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_100004D18(char a1, int64_t a2, char a3, unint64_t a4)
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
    v15 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_100003780(&qword_100010B28);
  v11 = *(_QWORD *)(type metadata accessor for URLQueryItem(0) - 8);
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
  v18 = type metadata accessor for URLQueryItem(0);
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
    sub_10000580C(0, v8, v21, a4);
  }
  swift_bridgeObjectRelease(a4, v22);
  return (uint64_t)v15;
}

uint64_t sub_100004F20(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_100004F58(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_100004F3C(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1000050C0(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_100004F58(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100003780(&qword_100010A78);
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

uint64_t sub_1000050C0(char a1, int64_t a2, char a3, _QWORD *a4)
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
    v15 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_100003780(&qword_100010B28);
  v11 = *(_QWORD *)(type metadata accessor for URLQueryItem(0) - 8);
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
  v18 = type metadata accessor for URLQueryItem(0);
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
      swift_arrayInitWithTakeBackToFront();
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

uint64_t *sub_1000052A0(uint64_t a1, uint64_t *a2)
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

uint64_t sub_1000052E0(uint64_t a1)
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

Swift::Int sub_100005368(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD v6[9];

  Hasher.init(_seed:)(v6);
  String.hash(into:)(v6, a2, a3);
  return Hasher._finalize()();
}

uint64_t sub_1000053B0(uint64_t a1)
{
  return String.hash(into:)(a1, 0x697373655377656ELL, 0xEA00000000006E6FLL);
}

uint64_t sub_1000053CC(uint64_t a1)
{
  return String.hash(into:)(a1, 0x74736F6E67616964, 0xEB00000000736369);
}

void sub_1000053EC(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  void *v4;
  Class isa;
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id v41[9];

  v4 = (void *)objc_opt_self(NSJSONSerialization);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v41[0] = 0;
  v6 = objc_msgSend(v4, "dataWithJSONObject:options:error:", isa, 0, v41);

  v7 = v41[0];
  if (v6)
  {
    v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v6);
    v10 = v9;

    v11 = type metadata accessor for JSONDecoder(0);
    swift_allocObject(v11, *(unsigned int *)(v11 + 48), *(unsigned __int16 *)(v11 + 52));
    v12 = JSONDecoder.init()();
    v13 = sub_100005928();
    dispatch thunk of JSONDecoder.decode<A>(_:from:)(v41, &type metadata for PushPayload, v8, v10, &type metadata for PushPayload, v13);
    sub_100003DD8(v8, v10);
    swift_release(v12);
    v29 = v41[0];
    v30 = v41[1];
    v31 = v41[2];
    v32 = v41[3];
    v33 = v41[4];
    v34 = v41[5];
    v35 = v41[6];
    v36 = v41[7];
    v37 = v41[8];
  }
  else
  {
    v14 = v7;
    v15 = _convertNSErrorToError(_:)(v7);

    swift_willThrow();
    if (qword_100010988 != -1)
      swift_once(&qword_100010988, sub_100009160);
    v16 = type metadata accessor for Logger(0);
    sub_100003768(v16, (uint64_t)qword_100010E10);
    swift_bridgeObjectRetain(a1);
    swift_errorRetain(v15);
    swift_bridgeObjectRetain(a1);
    v17 = swift_errorRetain(v15);
    v18 = Logger.logObject.getter(v17);
    v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = swift_slowAlloc(22, -1);
      v21 = (uint64_t *)swift_slowAlloc(8, -1);
      v38 = (void *)swift_slowAlloc(32, -1);
      v41[0] = v38;
      *(_DWORD *)v20 = 136446466;
      v22 = swift_bridgeObjectRetain(a1);
      v23 = Dictionary.description.getter(v22, &type metadata for AnyHashable);
      v25 = v24;
      swift_bridgeObjectRelease(a1, v24);
      v39 = sub_100008AA8(v23, v25, (uint64_t *)v41);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, &v40);
      swift_bridgeObjectRelease_n(a1, 2);
      swift_bridgeObjectRelease(v25, v26);
      *(_WORD *)(v20 + 12) = 2114;
      swift_errorRetain(v15);
      v27 = _swift_stdlib_bridgeErrorToNSError(v15);
      v39 = v27;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, &v40);
      *v21 = v27;
      swift_errorRelease(v15);
      swift_errorRelease(v15);
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Failed to decode push payload %{public}s with error: %{public}@", (uint8_t *)v20, 0x16u);
      v28 = sub_100003780(&qword_100010A48);
      swift_arrayDestroy(v21, 1, v28);
      swift_slowDealloc(v21, -1, -1);
      swift_arrayDestroy(v38, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v38, -1, -1);
      swift_slowDealloc(v20, -1, -1);

      swift_errorRelease(v15);
    }
    else
    {
      swift_errorRelease(v15);
      swift_bridgeObjectRelease_n(a1, 2);
      swift_errorRelease(v15);
      swift_errorRelease(v15);

    }
    v29 = 0;
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    v37 = 0;
  }
  *a2 = v29;
  a2[1] = v30;
  a2[2] = v31;
  a2[3] = v32;
  a2[4] = v33;
  a2[5] = v34;
  a2[6] = v35;
  a2[7] = v36;
  a2[8] = v37;
}

uint64_t sub_10000580C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  v8 = *(_QWORD *)(type metadata accessor for URLQueryItem(0) - 8);
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

unint64_t sub_100005928()
{
  unint64_t result;

  result = qword_100010B30;
  if (!qword_100010B30)
  {
    result = swift_getWitnessTable("Y0", &type metadata for PushPayload);
    atomic_store(result, (unint64_t *)&qword_100010B30);
  }
  return result;
}

__n128 initializeWithTake for AlertPayload(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

ValueMetadata *type metadata accessor for PushPayload()
{
  return &type metadata for PushPayload;
}

uint64_t sub_1000059B8(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  char v6;

  if (a1 == 7565409 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease(a2, a2);
    v6 = 0;
  }
  else
  {
    v4 = _stringCompareWithSmolCheck(_:_:expecting:)(7565409, 0xE300000000000000, a1, a2, 0);
    swift_bridgeObjectRelease(a2, v5);
    v6 = v4 ^ 1;
  }
  return v6 & 1;
}

uint64_t sub_100005A2C()
{
  return 7565409;
}

uint64_t sub_100005A3C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _OWORD v20[4];
  uint64_t v21;

  v5 = sub_100003780(&qword_100010B38);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_100005B98(a1, v9);
  v11 = sub_100005BBC();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for PushPayload.CodingKeys, &type metadata for PushPayload.CodingKeys, v11, v9, v10);
  if (v2)
    return sub_100005C00(a1);
  sub_100005C20();
  KeyedDecodingContainer.decode<A>(_:forKey:)(v20);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v18 = v20[1];
  v19 = v20[0];
  v16 = v20[3];
  v17 = v20[2];
  v12 = v21;
  result = sub_100005C00(a1);
  v14 = v18;
  *(_OWORD *)a2 = v19;
  *(_OWORD *)(a2 + 16) = v14;
  v15 = v16;
  *(_OWORD *)(a2 + 32) = v17;
  *(_OWORD *)(a2 + 48) = v15;
  *(_QWORD *)(a2 + 64) = v12;
  return result;
}

_QWORD *sub_100005B98(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100005BBC()
{
  unint64_t result;

  result = qword_100010B40;
  if (!qword_100010B40)
  {
    result = swift_getWitnessTable(&unk_100009CE0, &type metadata for PushPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010B40);
  }
  return result;
}

uint64_t sub_100005C00(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

unint64_t sub_100005C20()
{
  unint64_t result;

  result = qword_100010B48;
  if (!qword_100010B48)
  {
    result = swift_getWitnessTable(&unk_100009CB8, &type metadata for APSPayload);
    atomic_store(result, (unint64_t *)&qword_100010B48);
  }
  return result;
}

uint64_t sub_100005C74()
{
  return 0;
}

ValueMetadata *type metadata accessor for PushPayload.CodingKeys()
{
  return &type metadata for PushPayload.CodingKeys;
}

uint64_t initializeBufferWithCopyOfBuffer for APSPayload(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

ValueMetadata *type metadata accessor for APSPayload()
{
  return &type metadata for APSPayload;
}

unint64_t sub_100005CD4()
{
  unint64_t result;

  result = qword_100010B50;
  if (!qword_100010B50)
  {
    result = swift_getWitnessTable(&unk_100009C90, &type metadata for PushPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010B50);
  }
  return result;
}

unint64_t sub_100005D1C()
{
  unint64_t result;

  result = qword_100010B58;
  if (!qword_100010B58)
  {
    result = swift_getWitnessTable(")0", &type metadata for PushPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010B58);
  }
  return result;
}

unint64_t sub_100005D64()
{
  unint64_t result;

  result = qword_100010B60;
  if (!qword_100010B60)
  {
    result = swift_getWitnessTable(&unk_100009C28, &type metadata for PushPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010B60);
  }
  return result;
}

uint64_t sub_100005DA8(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  char v6;

  if (a1 == 0x7472656C61 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease(a2, a2);
    v6 = 0;
  }
  else
  {
    v4 = _stringCompareWithSmolCheck(_:_:expecting:)(0x7472656C61, 0xE500000000000000, a1, a2, 0);
    swift_bridgeObjectRelease(a2, v5);
    v6 = v4 ^ 1;
  }
  return v6 & 1;
}

uint64_t sub_100005E24()
{
  return 0x7472656C61;
}

uint64_t sub_100005E38@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _OWORD v20[4];
  uint64_t v21;

  v5 = sub_100003780(&qword_100010B68);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_100005B98(a1, v9);
  v11 = sub_100005F94();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for APSPayload.CodingKeys, &type metadata for APSPayload.CodingKeys, v11, v9, v10);
  if (v2)
    return sub_100005C00(a1);
  sub_100005FD8();
  KeyedDecodingContainer.decode<A>(_:forKey:)(v20);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v18 = v20[1];
  v19 = v20[0];
  v16 = v20[3];
  v17 = v20[2];
  v12 = v21;
  result = sub_100005C00(a1);
  v14 = v18;
  *(_OWORD *)a2 = v19;
  *(_OWORD *)(a2 + 16) = v14;
  v15 = v16;
  *(_OWORD *)(a2 + 32) = v17;
  *(_OWORD *)(a2 + 48) = v15;
  *(_QWORD *)(a2 + 64) = v12;
  return result;
}

unint64_t sub_100005F94()
{
  unint64_t result;

  result = qword_100010B70;
  if (!qword_100010B70)
  {
    result = swift_getWitnessTable(&unk_100009E20, &type metadata for APSPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010B70);
  }
  return result;
}

unint64_t sub_100005FD8()
{
  unint64_t result;

  result = qword_100010B78;
  if (!qword_100010B78)
  {
    result = swift_getWitnessTable(&unk_100009DF8, &type metadata for AlertPayload);
    atomic_store(result, (unint64_t *)&qword_100010B78);
  }
  return result;
}

ValueMetadata *type metadata accessor for APSPayload.CodingKeys()
{
  return &type metadata for APSPayload.CodingKeys;
}

uint64_t _s16diagnosticspushd12AlertPayloadVwxx_0(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_bridgeObjectRelease(a1[1], a2);
  swift_bridgeObjectRelease(a1[3], v3);
  swift_bridgeObjectRelease(a1[5], v4);
  swift_bridgeObjectRelease(a1[7], v5);
  return swift_bridgeObjectRelease(a1[8], v6);
}

_QWORD *_s16diagnosticspushd12AlertPayloadVwcp_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  v7 = a2[8];
  a1[8] = v7;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  return a1;
}

_QWORD *_s16diagnosticspushd12AlertPayloadVwca_0(_QWORD *a1, _QWORD *a2)
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

  *a1 = *a2;
  v4 = a2[1];
  v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5, v6);
  a1[2] = a2[2];
  v7 = a2[3];
  v8 = a1[3];
  a1[3] = v7;
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRelease(v8, v9);
  a1[4] = a2[4];
  v10 = a2[5];
  v11 = a1[5];
  a1[5] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11, v12);
  a1[6] = a2[6];
  v13 = a2[7];
  v14 = a1[7];
  a1[7] = v13;
  swift_bridgeObjectRetain(v13);
  swift_bridgeObjectRelease(v14, v15);
  v16 = a1[8];
  v17 = a2[8];
  a1[8] = v17;
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRelease(v16, v18);
  return a1;
}

_QWORD *_s16diagnosticspushd12AlertPayloadVwta_0(_QWORD *a1, uint64_t a2)
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

  v4 = *(_QWORD *)(a2 + 8);
  v5 = a1[1];
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  swift_bridgeObjectRelease(v5, a2);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = a1[3];
  a1[2] = *(_QWORD *)(a2 + 16);
  a1[3] = v6;
  swift_bridgeObjectRelease(v7, v8);
  v9 = *(_QWORD *)(a2 + 40);
  v10 = a1[5];
  a1[4] = *(_QWORD *)(a2 + 32);
  a1[5] = v9;
  swift_bridgeObjectRelease(v10, v11);
  a1[6] = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease(a1[7], v12);
  v13 = a1[8];
  *(_OWORD *)(a1 + 7) = *(_OWORD *)(a2 + 56);
  swift_bridgeObjectRelease(v13, v14);
  return a1;
}

uint64_t _s16diagnosticspushd12AlertPayloadVwet_0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 72))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_100006268(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 72) = 1;
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
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AlertPayload()
{
  return &type metadata for AlertPayload;
}

unint64_t sub_1000062CC()
{
  unint64_t result;

  result = qword_100010B80;
  if (!qword_100010B80)
  {
    result = swift_getWitnessTable(&unk_100009DD0, &type metadata for APSPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010B80);
  }
  return result;
}

unint64_t sub_100006314()
{
  unint64_t result;

  result = qword_100010B88;
  if (!qword_100010B88)
  {
    result = swift_getWitnessTable(&unk_100009D40, &type metadata for APSPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010B88);
  }
  return result;
}

unint64_t sub_10000635C()
{
  unint64_t result;

  result = qword_100010B90;
  if (!qword_100010B90)
  {
    result = swift_getWitnessTable(&unk_100009D68, &type metadata for APSPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010B90);
  }
  return result;
}

uint64_t sub_1000063A0()
{
  return 0x74736F6E67616964;
}

Swift::Int sub_1000063C0(uint64_t a1, uint64_t a2)
{
  _QWORD v5[9];

  Hasher.init(_seed:)(v5);
  String.hash(into:)(v5, a1, a2);
  return Hasher._finalize()();
}

uint64_t sub_10000640C()
{
  return 0x697373655377656ELL;
}

uint64_t sub_100006428(uint64_t a1, unint64_t a2)
{
  BOOL v3;
  unint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;

  v3 = a1 == 0x79726F6765746163 && a2 == 0xE800000000000000;
  if (v3
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x79726F6765746163, 0xE800000000000000, a1, a2, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2, a2);
    return 0;
  }
  if (a1 == 0x6E6F69746361 && a2 == 0xE600000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6E6F69746361, 0xE600000000000000, a1, a2, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2, a2);
    return 1;
  }
  if (a1 == 0x656C746974 && a2 == 0xE500000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x656C746974, 0xE500000000000000, a1, a2, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2, a2);
    return 2;
  }
  if (a1 == 2036625250 && a2 == 0xE400000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)(2036625250, 0xE400000000000000, a1, a2, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2, a2);
    return 3;
  }
  if (a1 == 0xD000000000000012)
  {
    v6 = 0x800000010000A650;
    if (a2 == 0x800000010000A650)
      goto LABEL_23;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000012, 0x800000010000A650, a1, a2, 0) & 1) != 0)
  {
    v6 = a2;
LABEL_23:
    swift_bridgeObjectRelease(v6, a2);
    return 4;
  }
  if (a1 == 0xD000000000000012)
  {
    v7 = 0x800000010000A670;
    if (a2 == 0x800000010000A670)
      goto LABEL_28;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000012, 0x800000010000A670, a1, a2, 0) & 1) != 0)
  {
    v7 = a2;
LABEL_28:
    swift_bridgeObjectRelease(v7, a2);
    return 5;
  }
  if (a1 == 0xD000000000000013 && a2 == 0x800000010000A690)
  {
    swift_bridgeObjectRelease(0x800000010000A690, a2);
    return 6;
  }
  else
  {
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000013, 0x800000010000A690, a1, a2, 0);
    swift_bridgeObjectRelease(a2, v9);
    if ((v8 & 1) != 0)
      return 6;
    else
      return 7;
  }
}

uint64_t sub_1000066B0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t result;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  char v42;
  char v43;
  char v44;
  _BYTE v45[3];

  v5 = sub_100003780(&qword_100010B98);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_100005B98(a1, v9);
  v11 = sub_100006AC4();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for AlertPayload.CodingKeys, &type metadata for AlertPayload.CodingKeys, v11, v9, v10);
  if (v2)
  {
    sub_100005C00(a1);
    return v5;
  }
  else
  {
    v45[2] = 0;
    sub_100006B08();
    KeyedDecodingContainer.decode<A>(_:forKey:)(v12);
    v45[1] = 1;
    sub_100006B4C();
    KeyedDecodingContainer.decode<A>(_:forKey:)(v13);
    v45[0] = 2;
    v14 = KeyedDecodingContainer.decode(_:forKey:)(v45, v5);
    v44 = 3;
    v16 = v15;
    swift_bridgeObjectRetain(v15);
    v38 = KeyedDecodingContainer.decode(_:forKey:)(&v44, v5);
    v39 = v14;
    v17 = v16;
    v43 = 4;
    v19 = v18;
    swift_bridgeObjectRetain(v18);
    v36 = KeyedDecodingContainer.decode(_:forKey:)(&v43, v5);
    v37 = v20;
    v42 = 5;
    swift_bridgeObjectRetain(v20);
    v33 = KeyedDecodingContainer.decode(_:forKey:)(&v42, v5);
    v22 = v21;
    v35 = sub_100003780(&qword_100010BB8);
    v41 = 6;
    v23 = sub_100006B90();
    v34 = v22;
    swift_bridgeObjectRetain(v22);
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(&v40, v35, &v41, v5, v35, v23);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v24 = v40;
    swift_bridgeObjectRetain(v40);
    sub_100005C00(a1);
    swift_bridgeObjectRelease(v24, v25);
    v26 = v34;
    swift_bridgeObjectRelease(v34, v27);
    v28 = v37;
    swift_bridgeObjectRelease(v37, v29);
    swift_bridgeObjectRelease(v19, v30);
    result = swift_bridgeObjectRelease(v17, v31);
    *a2 = v39;
    a2[1] = v17;
    a2[2] = v38;
    a2[3] = v19;
    a2[4] = v36;
    a2[5] = v28;
    a2[6] = v33;
    a2[7] = v26;
    a2[8] = v24;
  }
  return result;
}

unint64_t sub_100006AC4()
{
  unint64_t result;

  result = qword_100010BA0;
  if (!qword_100010BA0)
  {
    result = swift_getWitnessTable(&unk_10000A0C8, &type metadata for AlertPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010BA0);
  }
  return result;
}

unint64_t sub_100006B08()
{
  unint64_t result;

  result = qword_100010BA8;
  if (!qword_100010BA8)
  {
    result = swift_getWitnessTable(&unk_10000A0A0, &type metadata for AlertPayload.Category);
    atomic_store(result, (unint64_t *)&qword_100010BA8);
  }
  return result;
}

unint64_t sub_100006B4C()
{
  unint64_t result;

  result = qword_100010BB0;
  if (!qword_100010BB0)
  {
    result = swift_getWitnessTable(&unk_10000A078, &type metadata for AlertPayload.Action);
    atomic_store(result, (unint64_t *)&qword_100010BB0);
  }
  return result;
}

unint64_t sub_100006B90()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100010BC0;
  if (!qword_100010BC0)
  {
    v1 = sub_100003EAC(&qword_100010BB8);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> [A : B], v1);
    atomic_store(result, (unint64_t *)&qword_100010BC0);
  }
  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for AlertPayload.CodingKeys(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AlertPayload.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFA)
    goto LABEL_17;
  if (a2 + 6 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 6) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 6;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 6;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 6;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v8 = v6 - 7;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AlertPayload.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100006CD4 + 4 * byte_100009B8C[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_100006D08 + 4 * byte_100009B87[v4]))();
}

uint64_t sub_100006D08(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100006D10(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100006D18);
  return result;
}

uint64_t sub_100006D24(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100006D2CLL);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_100006D30(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100006D38(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100006D44(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100006D4C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AlertPayload.CodingKeys()
{
  return &type metadata for AlertPayload.CodingKeys;
}

ValueMetadata *type metadata accessor for AlertPayload.Action()
{
  return &type metadata for AlertPayload.Action;
}

uint64_t _s16diagnosticspushd12AlertPayloadV8CategoryOwet_0(unsigned int *a1, int a2)
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

uint64_t _s16diagnosticspushd12AlertPayloadV8CategoryOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_100006E04 + 4 * byte_100009B91[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_100006E24 + 4 * byte_100009B96[v4]))();
}

_BYTE *sub_100006E04(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_100006E24(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100006E2C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100006E34(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100006E3C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100006E44(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for AlertPayload.Category()
{
  return &type metadata for AlertPayload.Category;
}

unint64_t sub_100006E64()
{
  unint64_t result;

  result = qword_100010BC8;
  if (!qword_100010BC8)
  {
    result = swift_getWitnessTable(&unk_100009EF8, &type metadata for AlertPayload.Category);
    atomic_store(result, (unint64_t *)&qword_100010BC8);
  }
  return result;
}

unint64_t sub_100006EAC()
{
  unint64_t result;

  result = qword_100010BD0;
  if (!qword_100010BD0)
  {
    result = swift_getWitnessTable(&unk_100009F98, &type metadata for AlertPayload.Action);
    atomic_store(result, (unint64_t *)&qword_100010BD0);
  }
  return result;
}

unint64_t sub_100006EF4()
{
  unint64_t result;

  result = qword_100010BD8;
  if (!qword_100010BD8)
  {
    result = swift_getWitnessTable(&unk_10000A050, &type metadata for AlertPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010BD8);
  }
  return result;
}

unint64_t sub_100006F3C()
{
  unint64_t result;

  result = qword_100010BE0;
  if (!qword_100010BE0)
  {
    result = swift_getWitnessTable(&unk_100009FC0, &type metadata for AlertPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010BE0);
  }
  return result;
}

unint64_t sub_100006F84()
{
  unint64_t result;

  result = qword_100010BE8;
  if (!qword_100010BE8)
  {
    result = swift_getWitnessTable(&unk_100009FE8, &type metadata for AlertPayload.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010BE8);
  }
  return result;
}

unint64_t sub_100006FC8()
{
  unint64_t result;

  result = qword_100010BF0;
  if (!qword_100010BF0)
  {
    result = swift_getWitnessTable("9.", &type metadata for AlertPayload.Category);
    atomic_store(result, (unint64_t *)&qword_100010BF0);
  }
  return result;
}

unint64_t sub_10000700C()
{
  unint64_t result;

  result = qword_100010BF8;
  if (!qword_100010BF8)
  {
    result = swift_getWitnessTable(&unk_100009F20, &type metadata for AlertPayload.Action);
    atomic_store(result, (unint64_t *)&qword_100010BF8);
  }
  return result;
}

uint64_t sub_100007058(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  Class v12;
  _QWORD *v13;
  void *v14;
  objc_class *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD aBlock[5];
  _QWORD *v26;

  v6 = type metadata accessor for DispatchWorkItemFlags(0);
  v23 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = type metadata accessor for DispatchQoS(0);
  v9 = *(_QWORD *)(v22 - 8);
  __chkstk_darwin(v22);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100007D9C(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7]);
  v13 = (_QWORD *)swift_allocObject(&unk_10000CCE8, 40, 7);
  v13[2] = v12;
  v13[3] = a2;
  v13[4] = a3;
  aBlock[4] = sub_100007F10;
  v26 = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100007974;
  aBlock[3] = &unk_10000CD00;
  v14 = _Block_copy(aBlock);
  v15 = v12;
  v16 = swift_retain(a3);
  static DispatchQoS.unspecified.getter(v16);
  v24 = &_swiftEmptyArrayStorage;
  v17 = sub_100003FC4(&qword_100010CA0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v18 = sub_100003780(&qword_100010CA8);
  v19 = sub_100007FB0(&qword_100010CB0, &qword_100010CA8);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v24, v18, v19, v6, v17);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v11, v8, v14);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v6);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v22);
  return swift_release(v26);
}

unint64_t sub_10000726C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  unint64_t result;
  char v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
    v5 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100003780(&qword_100010CD0);
  v4 = static _DictionaryStorage.allocate(capacity:)(v3);
  v5 = (_QWORD *)v4;
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1, a2);
    return (unint64_t)v5;
  }
  swift_retain(v4);
  v7 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v8 = (void *)*(v7 - 2);
    v9 = *(v7 - 1);
    v10 = *v7;
    v11 = v8;
    swift_bridgeObjectRetain(v10);
    result = sub_100007A94(v8);
    if ((v13 & 1) != 0)
      break;
    *(_QWORD *)((char *)v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_QWORD *)(v5[6] + 8 * result) = v8;
    v14 = (_QWORD *)(v5[7] + 16 * result);
    *v14 = v9;
    v14[1] = v10;
    v15 = v5[2];
    v16 = __OFADD__(v15, 1);
    v17 = v15 + 1;
    if (v16)
      goto LABEL_11;
    v7 += 3;
    v5[2] = v17;
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

unint64_t sub_10000737C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t result;
  char v13;
  uint64_t *v14;
  _QWORD *v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;

  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
    v5 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100003780(&qword_100010CE0);
  v4 = static _DictionaryStorage.allocate(capacity:)(v3);
  v5 = (_QWORD *)v4;
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1, a2);
    return (unint64_t)v5;
  }
  swift_retain(v4);
  v7 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v8 = *(v7 - 3);
    v9 = *(v7 - 2);
    v11 = *(v7 - 1);
    v10 = *v7;
    swift_bridgeObjectRetain(v9);
    swift_bridgeObjectRetain(v10);
    result = sub_100007B50(v8, v9);
    if ((v13 & 1) != 0)
      break;
    *(_QWORD *)((char *)v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v14 = (uint64_t *)(v5[6] + 16 * result);
    *v14 = v8;
    v14[1] = v9;
    v15 = (_QWORD *)(v5[7] + 16 * result);
    *v15 = v11;
    v15[1] = v10;
    v16 = v5[2];
    v17 = __OFADD__(v16, 1);
    v18 = v16 + 1;
    if (v17)
      goto LABEL_11;
    v7 += 4;
    v5[2] = v18;
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

uint64_t sub_10000749C()
{
  uint64_t v0;
  uint64_t result;

  v0 = type metadata accessor for AlertManager();
  swift_allocObject(v0, 24, 7);
  result = sub_1000074D4();
  qword_100010DE0 = result;
  return result;
}

uint64_t sub_1000074D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  void *v17;

  v0 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100003EF0();
  static DispatchQoS.userInteractive.getter();
  v17 = &_swiftEmptyArrayStorage;
  v10 = sub_100003FC4(&qword_100010CE8, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  v11 = sub_100003780(&qword_100010CF0);
  v12 = sub_100007FB0(&qword_100010CF8, &qword_100010CF0);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v17, v11, v12, v4, v10);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v0);
  v13 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD000000000000025, 0x800000010000A6F0, v9, v6, v3, 0);
  v14 = v16;
  *(_QWORD *)(v16 + 16) = v13;
  return v14;
}

void sub_100007698(void *a1, void (*a2)(void))
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  id v9;
  uint64_t v10;
  __CFUserNotification *v11;
  uint64_t v12;
  CFOptionFlags v13;
  NSObject *v14;
  os_log_type_t v15;
  _BOOL4 v16;
  uint8_t *v17;
  uint8_t *v18;
  _QWORD *v19;
  CFOptionFlags responseFlags;
  uint64_t v21;

  if (qword_100010990 != -1)
    swift_once(&qword_100010990, sub_100009180);
  v4 = type metadata accessor for Logger(0);
  sub_100003768(v4, (uint64_t)qword_100010E28);
  v5 = a1;
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v19 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v8 = 138412290;
    responseFlags = (CFOptionFlags)v5;
    v9 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&responseFlags, &v21);
    *v19 = v5;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Showing alert with options: %@", v8, 0xCu);
    v10 = sub_100003780(&qword_100010A48);
    swift_arrayDestroy(v19, 1, v10);
    swift_slowDealloc(v19, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

  }
  v11 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, 0, (CFDictionaryRef)v5);
  responseFlags = 0;
  v12 = CFUserNotificationReceiveResponse(v11, 0.0, &responseFlags);
  v13 = responseFlags & 3;
  v14 = Logger.logObject.getter(v12);
  v15 = static os_log_type_t.default.getter();
  v16 = os_log_type_enabled(v14, v15);
  if (v13)
  {
    if (v16)
    {
      v17 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "User selected dismiss button", v17, 2u);
      swift_slowDealloc(v17, -1, -1);
    }

  }
  else
  {
    if (v16)
    {
      v18 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "User selected default button", v18, 2u);
      swift_slowDealloc(v18, -1, -1);
    }

    a2();
  }

}

uint64_t sub_100007974(uint64_t a1)
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

uint64_t sub_1000079A0()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for AlertManager()
{
  return objc_opt_self(_TtC16diagnosticspushd12AlertManager);
}

void sub_1000079E4(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a4();
  v7 = (void *)v6;
  v8 = *a1 + 8;
  if (v6)
    v10 = v6;
  else
    v10 = 0;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11);
  *a1 = v8;
  v9 = *a2;
  if (*a2)
  {
    *v9 = v7;
    *a2 = v9 + 1;
  }
  else
  {

  }
}

unint64_t sub_100007A94(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  Swift::Int v6;
  _QWORD v8[9];

  Hasher.init(_seed:)(v8);
  if (a1)
  {
    Hasher._combine(_:)(1u);
    type metadata accessor for CFString(0);
    v3 = v2;
    v4 = sub_100003FC4(&qword_100010CD8, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_100009B00);
    v5 = a1;
    _CFObject.hash(into:)(v8, v3, v4);

  }
  else
  {
    Hasher._combine(_:)(0);
  }
  v6 = Hasher._finalize()();
  return sub_100007BB4((uint64_t)a1, v6);
}

unint64_t sub_100007B50(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;
  _QWORD v6[9];

  Hasher.init(_seed:)(v6);
  String.hash(into:)(v6, a1, a2);
  v4 = Hasher._finalize()();
  return sub_100007CBC(a1, a2, v4);
}

unint64_t sub_100007BB4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = v2;
    v8 = ~v4;
    do
    {
      v9 = *(void **)(*(_QWORD *)(v6 + 48) + 8 * v5);
      if (v9)
      {
        if (a1)
        {
          type metadata accessor for CFString(0);
          v11 = v10;
          v12 = sub_100003FC4(&qword_100010CD8, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_100009B00);
          v13 = v9;
          LOBYTE(v11) = static _CFObject.== infix(_:_:)(v13, a1, v11, v12);

          if ((v11 & 1) != 0)
            return v5;
        }
      }
      else if (!a1)
      {
        return v5;
      }
      v5 = (v5 + 1) & v8;
    }
    while (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0);
  }
  return v5;
}

unint64_t sub_100007CBC(uint64_t a1, uint64_t a2, uint64_t a3)
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

Class sub_100007D9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v15;
  uint64_t inited;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  uint64_t v21;
  unint64_t v22;
  Class isa;
  uint64_t v24;
  _BYTE v27[128];

  v15 = sub_100003780(&qword_100010CB8);
  inited = swift_initStackObject(v15, v27);
  *(_OWORD *)(inited + 16) = xmmword_10000A130;
  *(_QWORD *)(inited + 32) = kCFUserNotificationAlertHeaderKey;
  *(_QWORD *)(inited + 40) = a1;
  *(_QWORD *)(inited + 48) = a2;
  *(_QWORD *)(inited + 56) = kCFUserNotificationAlertMessageKey;
  *(_QWORD *)(inited + 80) = kCFUserNotificationDefaultButtonTitleKey;
  *(_QWORD *)(inited + 88) = a5;
  *(_QWORD *)(inited + 64) = a3;
  *(_QWORD *)(inited + 72) = a4;
  *(_QWORD *)(inited + 96) = a6;
  *(_QWORD *)(inited + 104) = kCFUserNotificationAlternateButtonTitleKey;
  *(_QWORD *)(inited + 112) = a7;
  *(_QWORD *)(inited + 120) = a8;
  v17 = (id)kCFUserNotificationAlternateButtonTitleKey;
  swift_bridgeObjectRetain(a8);
  v18 = (id)kCFUserNotificationAlertHeaderKey;
  swift_bridgeObjectRetain(a2);
  v19 = (id)kCFUserNotificationAlertMessageKey;
  swift_bridgeObjectRetain(a4);
  v20 = (id)kCFUserNotificationDefaultButtonTitleKey;
  swift_bridgeObjectRetain(a6);
  v22 = sub_10000726C(inited, v21);
  sub_100003780(&qword_100010CC0);
  sub_100007F34();
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v22, v24);
  return isa;
}

uint64_t sub_100007EE4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

void sub_100007F10()
{
  uint64_t v0;

  sub_100007698(*(void **)(v0 + 16), *(void (**)(void))(v0 + 24));
}

uint64_t sub_100007F1C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100007F2C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_100007F34()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100010CC8;
  if (!qword_100010CC8)
  {
    v1 = sub_100003EAC(&qword_100010CC0);
    sub_100003FC4(&qword_100010A90, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_100009B2C);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_100010CC8);
  }
  return result;
}

uint64_t sub_100007FB0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_100003EAC(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
    atomic_store(result, a1);
  }
  return result;
}

void sub_100007FF0()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  NSString v3;
  id v4;

  v0 = type metadata accessor for DefaultsManager();
  v1 = swift_allocObject(v0, 24, 7);
  v2 = objc_allocWithZone((Class)NSUserDefaults);
  v3 = String._bridgeToObjectiveC()();
  v4 = objc_msgSend(v2, "initWithSuiteName:", v3);

  *(_QWORD *)(v1 + 16) = v4;
  qword_100010DE8 = v1;
}

uint64_t type metadata accessor for DefaultsManager()
{
  return objc_opt_self(_TtC16diagnosticspushd15DefaultsManager);
}

id sub_10000809C()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for BackgroundTaskManager()), "init");
  qword_100010DF0 = (uint64_t)result;
  return result;
}

char *sub_100008108()
{
  char *v0;
  objc_class *ObjectType;
  char *v2;
  id v3;
  void *v4;
  char *v5;
  id v6;
  uint64_t *v7;
  uint64_t v8;
  NSString v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t aBlock[5];
  uint64_t v32;
  objc_super v33;

  ObjectType = (objc_class *)swift_getObjectType(v0);
  v2 = &v0[OBJC_IVAR___DPDBackgroundTaskManager_postInstallTaskIdentifier];
  *(_QWORD *)v2 = 0xD000000000000026;
  *((_QWORD *)v2 + 1) = 0x800000010000A7C0;
  v33.receiver = v0;
  v33.super_class = ObjectType;
  v3 = objc_msgSendSuper2(&v33, "init");
  v4 = (void *)objc_opt_self(BGSystemTaskScheduler);
  v5 = (char *)v3;
  v6 = objc_msgSend(v4, "sharedScheduler");
  v7 = (uint64_t *)&v5[OBJC_IVAR___DPDBackgroundTaskManager_postInstallTaskIdentifier];
  v8 = *(_QWORD *)&v5[OBJC_IVAR___DPDBackgroundTaskManager_postInstallTaskIdentifier + 8];
  swift_bridgeObjectRetain(v8);
  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v8, v10);
  v11 = swift_allocObject(&unk_10000CD38, 24, 7);
  *(_QWORD *)(v11 + 16) = v5;
  aBlock[4] = (uint64_t)sub_1000089D4;
  v32 = v11;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_10000890C;
  aBlock[3] = (uint64_t)&unk_10000CD50;
  v12 = _Block_copy(aBlock);
  v13 = v32;
  v14 = v5;
  swift_release(v13);
  LODWORD(v13) = objc_msgSend(v6, "registerForTaskWithIdentifier:usingQueue:launchHandler:", v9, 0, v12);
  _Block_release(v12);

  if (!(_DWORD)v13)
  {
    if (qword_100010998 != -1)
      swift_once(&qword_100010998, sub_10000919C);
    v25 = type metadata accessor for Logger(0);
    sub_100003768(v25, (uint64_t)qword_100010E40);
    v16 = v14;
    v17 = Logger.logObject.getter(v16);
    v18 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc(12, -1);
      v20 = swift_slowAlloc(32, -1);
      aBlock[0] = v20;
      *(_DWORD *)v19 = 136446210;
      v26 = *v7;
      v27 = v7[1];
      swift_bridgeObjectRetain(v27);
      v30 = sub_100008AA8(v26, v27, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, aBlock);

      swift_bridgeObjectRelease(v27, v28);
      v24 = "Task %{public}s was not registered successfully";
      goto LABEL_10;
    }
LABEL_11:

    goto LABEL_12;
  }
  if (qword_100010998 != -1)
    swift_once(&qword_100010998, sub_10000919C);
  v15 = type metadata accessor for Logger(0);
  sub_100003768(v15, (uint64_t)qword_100010E40);
  v16 = v14;
  v17 = Logger.logObject.getter(v16);
  v18 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v17, v18))
    goto LABEL_11;
  v19 = (uint8_t *)swift_slowAlloc(12, -1);
  v20 = swift_slowAlloc(32, -1);
  aBlock[0] = v20;
  *(_DWORD *)v19 = 136446210;
  v21 = *v7;
  v22 = v7[1];
  swift_bridgeObjectRetain(v22);
  v30 = sub_100008AA8(v21, v22, aBlock);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, aBlock);

  swift_bridgeObjectRelease(v22, v23);
  v24 = "Task %{public}s registered successfully";
LABEL_10:
  _os_log_impl((void *)&_mh_execute_header, v17, v18, v24, v19, 0xCu);
  swift_arrayDestroy(v20, 1, (char *)&type metadata for Any + 8);
  swift_slowDealloc(v20, -1, -1);
  swift_slowDealloc(v19, -1, -1);

LABEL_12:
  return v14;
}

id sub_1000084E0(void *a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t aBlock[5];
  uint64_t v20;

  v4 = swift_allocObject(&unk_10000CD88, 24, 7);
  *(_QWORD *)(v4 + 16) = a2;
  aBlock[4] = (uint64_t)sub_100009134;
  v20 = v4;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100007974;
  aBlock[3] = (uint64_t)&unk_10000CDA0;
  v5 = _Block_copy(aBlock);
  v6 = v20;
  v7 = a2;
  swift_release(v6);
  objc_msgSend(a1, "setExpirationHandler:", v5);
  _Block_release(v5);
  if (qword_100010998 != -1)
    swift_once(&qword_100010998, sub_10000919C);
  v8 = type metadata accessor for Logger(0);
  sub_100003768(v8, (uint64_t)qword_100010E40);
  v9 = (char *)v7;
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc(12, -1);
    v13 = swift_slowAlloc(32, -1);
    aBlock[0] = v13;
    *(_DWORD *)v12 = 136446210;
    v14 = *(_QWORD *)&v9[OBJC_IVAR___DPDBackgroundTaskManager_postInstallTaskIdentifier];
    v15 = *(_QWORD *)&v9[OBJC_IVAR___DPDBackgroundTaskManager_postInstallTaskIdentifier + 8];
    swift_bridgeObjectRetain(v15);
    v18 = sub_100008AA8(v14, v15, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v18, aBlock);

    swift_bridgeObjectRelease(v15, v16);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Handling task %{public}s", v12, 0xCu);
    swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v12, -1, -1);

  }
  else
  {

  }
  if (qword_100010950 != -1)
    swift_once(&qword_100010950, sub_1000018D8);
  return objc_msgSend(a1, "setTaskCompleted");
}

void sub_100008750(void *a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  if (qword_100010998 != -1)
    swift_once(&qword_100010998, sub_10000919C);
  v2 = type metadata accessor for Logger(0);
  sub_100003768(v2, (uint64_t)qword_100010E40);
  v10 = a1;
  v3 = Logger.logObject.getter(v10);
  v4 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(12, -1);
    v6 = swift_slowAlloc(32, -1);
    v12 = v6;
    *(_DWORD *)v5 = 136446210;
    v7 = *(_QWORD *)&v10[OBJC_IVAR___DPDBackgroundTaskManager_postInstallTaskIdentifier];
    v8 = *(_QWORD *)&v10[OBJC_IVAR___DPDBackgroundTaskManager_postInstallTaskIdentifier + 8];
    swift_bridgeObjectRetain(v8);
    v11 = sub_100008AA8(v7, v8, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12);

    swift_bridgeObjectRelease(v8, v9);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Task %{public}s expired by DAS", v5, 0xCu);
    swift_arrayDestroy(v6, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v6, -1, -1);
    swift_slowDealloc(v5, -1, -1);

  }
  else
  {

  }
}

void sub_10000890C(uint64_t a1, void *a2)
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

uint64_t type metadata accessor for BackgroundTaskManager()
{
  return objc_opt_self(DPDBackgroundTaskManager);
}

uint64_t sub_1000089B0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

id sub_1000089D4(void *a1)
{
  uint64_t v1;

  return sub_1000084E0(a1, *(void **)(v1 + 16));
}

uint64_t sub_1000089DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000089EC(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1000089F4(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100008A04(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_100008A38(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;

  v6 = a4();
  v8 = v7;
  v9 = sub_100008AA8(v6, v7, a3);
  v10 = *a1 + 8;
  v13 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14);
  result = swift_bridgeObjectRelease(v8, v11);
  *a1 = v10;
  return result;
}

uint64_t sub_100008AA8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100008B78(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1000090F8((uint64_t)v12, *a3);
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
      sub_1000090F8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100005C00(v12);
  return v7;
}

uint64_t sub_100008B78(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_100008D30(a5, a6);
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

uint64_t sub_100008D30(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100008DC4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100008F9C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100008F9C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100008DC4(uint64_t a1, unint64_t a2)
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
      v5 = sub_100008F38(v4, 0);
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

_QWORD *sub_100008F38(uint64_t a1, uint64_t a2)
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
  v4 = sub_100003780(&qword_100010DD0);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100008F9C(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100003780(&qword_100010DD0);
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
    swift_bridgeObjectRelease(a4, v14);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

_BYTE **sub_1000090E8(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_1000090F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_100009134()
{
  uint64_t v0;

  sub_100008750(*(void **)(v0 + 16));
}

uint64_t sub_100009148(uint64_t a1)
{
  return sub_1000091C8(a1, qword_100010DF8, 1752397168, 0xE400000000000000);
}

uint64_t sub_100009160(uint64_t a1)
{
  return sub_1000091C8(a1, qword_100010E10, 0x64616F6C796170, 0xE700000000000000);
}

uint64_t sub_100009180(uint64_t a1)
{
  return sub_1000091C8(a1, qword_100010E28, 0x7472656C61, 0xE500000000000000);
}

uint64_t sub_10000919C(uint64_t a1)
{
  return sub_1000091C8(a1, qword_100010E40, 0x656863536B736174, 0xEE00676E696C7564);
}

uint64_t sub_1000091C8(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  v7 = type metadata accessor for Logger(0);
  sub_1000052A0(v7, a2);
  sub_100003768(v7, (uint64_t)a2);
  return Logger.init(subsystem:category:)(0xD00000000000001ALL, 0x800000010000A760, a3, a4);
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "run");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}
