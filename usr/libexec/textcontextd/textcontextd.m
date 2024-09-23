int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  if (qword_10000CCF0 != -1)
    swift_once(&qword_10000CCF0, sub_100002DA4, envp);
  qword_10000CF60 = qword_10000CF70;
  v3 = qword_10000CCF8;
  v4 = (id)qword_10000CF70;
  if (v3 != -1)
    swift_once(&qword_10000CCF8, sub_1000043D4, v5);
  v6 = (void *)qword_10000CF78;
  qword_10000CF68 = qword_10000CF78;
  v7 = (void *)objc_opt_self(NSRunLoop);
  v8 = v6;
  v9 = objc_msgSend(v7, "mainRunLoop");
  objc_msgSend(v9, "run");

  return 0;
}

void type metadata accessor for CFBoolean()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_10000CD00)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, &unk_1000085B8);
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10000CD00);
  }
}

id sub_100002DA4()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ATRawAssortmentServer()), "init");
  qword_10000CF70 = (uint64_t)result;
  return result;
}

char *sub_100002DD0()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  NSString v20;
  id v21;
  objc_class *v22;
  char *v23;
  uint64_t v24;
  void *v25;
  char *v26;
  id v27;
  uint64_t v29;
  objc_super v30;
  void *v31;

  v1 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin();
  v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin();
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DispatchQoS(0);
  __chkstk_darwin();
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = OBJC_IVAR____TtC12textcontextd21ATRawAssortmentServer_serviceHandler;
  v11 = objc_allocWithZone((Class)type metadata accessor for ATRawAssortmentServiceHandler());
  v12 = v0;
  *(_QWORD *)&v0[v10] = objc_msgSend(v11, "init");
  v13 = OBJC_IVAR____TtC12textcontextd21ATRawAssortmentServer_interface;
  *(_QWORD *)&v12[v13] = objc_msgSend((id)objc_opt_self(NSXPCInterface), "interfaceWithProtocol:", &OBJC_PROTOCOL____TtP9Archetype30ATRawAssortmentServiceProtocol_);
  sub_1000034D8();
  static DispatchQoS.default.getter();
  v31 = &_swiftEmptyArrayStorage;
  v14 = sub_100003514();
  v15 = sub_10000355C(&qword_10000CD68);
  v16 = sub_10000359C();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v31, v15, v16, v5, v14);
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v1);
  *(_QWORD *)&v12[OBJC_IVAR____TtC12textcontextd21ATRawAssortmentServer_dispatchQueue] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD00000000000003ALL, 0x8000000100006C70, v9, v7, v4, 0);
  ATRawAssortmentServiceName.getter();
  v18 = v17;
  v19 = objc_allocWithZone((Class)NSXPCListener);
  v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v18);
  v21 = objc_msgSend(v19, "initWithMachServiceName:", v20);

  *(_QWORD *)&v12[OBJC_IVAR____TtC12textcontextd21ATRawAssortmentServer_listener] = v21;
  v22 = (objc_class *)type metadata accessor for ATRawAssortmentServer();
  v30.receiver = v12;
  v30.super_class = v22;
  v23 = (char *)objc_msgSendSuper2(&v30, "init");
  v24 = OBJC_IVAR____TtC12textcontextd21ATRawAssortmentServer_listener;
  v25 = *(void **)&v23[OBJC_IVAR____TtC12textcontextd21ATRawAssortmentServer_listener];
  v26 = v23;
  objc_msgSend(v25, "setDelegate:", v26);
  objc_msgSend(*(id *)&v23[v24], "_setQueue:", *(_QWORD *)&v26[OBJC_IVAR____TtC12textcontextd21ATRawAssortmentServer_dispatchQueue]);
  v27 = *(id *)&v23[v24];
  objc_msgSend(v27, "resume");

  return v26;
}

id sub_1000030D0()
{
  char *v0;
  uint64_t v1;
  objc_super v3;

  v1 = OBJC_IVAR____TtC12textcontextd21ATRawAssortmentServer_listener;
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC12textcontextd21ATRawAssortmentServer_listener], "setDelegate:", 0);
  objc_msgSend(*(id *)&v0[v1], "invalidate");
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for ATRawAssortmentServer();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for ATRawAssortmentServer()
{
  return objc_opt_self(_TtC12textcontextd21ATRawAssortmentServer);
}

uint64_t sub_100003284(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  SecTaskRef v7;
  __SecTask *v8;
  __CFString *v9;
  CFTypeRef v10;
  CFTypeID v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFBoolean *v15;
  int Value;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  audit_token_t token;

  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&token - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(a1, "auditToken");
  v7 = SecTaskCreateWithAuditToken(0, &token);
  if (v7)
  {
    v8 = v7;
    v9 = (__CFString *)String._bridgeToObjectiveC()();
    v10 = SecTaskCopyValueForEntitlement(v8, v9, 0);

    if (v10)
    {
      v11 = CFGetTypeID(v10);
      if (v11 == CFBooleanGetTypeID())
      {
        type metadata accessor for CFBoolean();
        v13 = v12;
        v14 = swift_unknownObjectRetain(v10);
        v15 = (const __CFBoolean *)swift_dynamicCastUnknownClassUnconditional(v14, v13, 0, 0, 0);
        Value = CFBooleanGetValue(v15);

        v7 = (SecTaskRef)swift_unknownObjectRelease(v10);
        if (Value)
        {
          objc_msgSend(a1, "setExportedInterface:", *(_QWORD *)(v1 + OBJC_IVAR____TtC12textcontextd21ATRawAssortmentServer_interface));
          objc_msgSend(a1, "setExportedObject:", *(_QWORD *)(v1 + OBJC_IVAR____TtC12textcontextd21ATRawAssortmentServer_serviceHandler));
          objc_msgSend(a1, "_setQueue:", *(_QWORD *)(v1 + OBJC_IVAR____TtC12textcontextd21ATRawAssortmentServer_dispatchQueue));
          objc_msgSend(a1, "resume");
          return 1;
        }
      }
      else
      {

        v7 = (SecTaskRef)swift_unknownObjectRelease(v10);
      }
    }
    else
    {

    }
  }
  v18 = Logger.init()(v7);
  v19 = Logger.logObject.getter(v18);
  v20 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "ATRawAssortmentServer is denying connection because client is missing entitlement", v21, 2u);
    swift_slowDealloc(v21, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return 0;
}

unint64_t sub_1000034D8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000CD58;
  if (!qword_10000CD58)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10000CD58);
  }
  return result;
}

unint64_t sub_100003514()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000CD60;
  if (!qword_10000CD60)
  {
    v1 = type metadata accessor for OS_dispatch_queue.Attributes(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for OS_dispatch_queue.Attributes, v1);
    atomic_store(result, (unint64_t *)&qword_10000CD60);
  }
  return result;
}

uint64_t sub_10000355C(uint64_t *a1)
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

unint64_t sub_10000359C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000CD70;
  if (!qword_10000CD70)
  {
    v1 = sub_1000035E8(&qword_10000CD68);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10000CD70);
  }
  return result;
}

uint64_t sub_1000035E8(uint64_t *a1)
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

id ATRawAssortmentServiceHandler.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

uint64_t sub_100003650(uint64_t a1)
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

void sub_100003710(uint64_t a1, NSString a2, uint64_t a3)
{
  id v4;

  if (a2)
    a2 = String._bridgeToObjectiveC()();
  v4 = a2;
  (*(void (**)(uint64_t))(a3 + 16))(a3);

}

uint64_t sub_100003758(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD *v22;
  void *v23;
  _QWORD *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD aBlock[5];
  _QWORD *v37;

  v31 = a5;
  v32 = a6;
  v10 = type metadata accessor for DispatchWorkItemFlags(0);
  v35 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin();
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for DispatchQoS(0);
  v33 = *(_QWORD *)(v13 - 8);
  v34 = v13;
  __chkstk_darwin();
  v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock[0] = a1;
  v16 = sub_10000355C(&qword_10000CE20);
  v17 = sub_1000042BC(&qword_10000CE28, &qword_10000CE20, (uint64_t)&protocol conformance descriptor for [A]);
  v18 = BidirectionalCollection<>.joined(separator:)(2099744, 0xE300000000000000, v16, v17);
  v20 = v19;
  sub_1000034D8();
  v21 = (void *)static OS_dispatch_queue.main.getter();
  v22 = (_QWORD *)swift_allocObject(a4, 48, 7);
  v22[2] = a2;
  v22[3] = a3;
  v22[4] = v18;
  v22[5] = v20;
  aBlock[4] = v31;
  v37 = v22;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100003650;
  aBlock[3] = v32;
  v23 = _Block_copy(aBlock);
  v24 = v37;
  sub_100004230(a2, a3);
  v25 = swift_release(v24);
  static DispatchQoS.unspecified.getter(v25);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v26 = sub_100004240();
  v27 = sub_10000355C(&qword_10000CE10);
  v28 = sub_1000042BC(&qword_10000CE18, &qword_10000CE10, (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v27, v28, v10, v26);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v15, v12, v23);
  _Block_release(v23);

  (*(void (**)(char *, uint64_t))(v35 + 8))(v12, v10);
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v15, v34);
}

uint64_t sub_100003A3C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void (*v7)(uint64_t, uint64_t);

  if (result)
  {
    v7 = (void (*)(uint64_t, uint64_t))result;
    swift_retain(a2);
    v7(a3, a4);
    return sub_1000041D8((uint64_t)v7, a2);
  }
  return result;
}

id ATRawAssortmentServiceHandler.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ATRawAssortmentServiceHandler();
  return objc_msgSendSuper2(&v2, "init");
}

id ATRawAssortmentServiceHandler.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ATRawAssortmentServiceHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t _s12textcontextd29ATRawAssortmentServiceHandlerC19spotlightItemTitles_010completionE0ySi_ySSSgcSgtF_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  _QWORD *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t (*)(uint64_t), uint64_t);
  uint64_t v19;

  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin();
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = Logger.init()(v8);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Retrieving item titles from spotlight", v14, 2u);
    swift_slowDealloc(v14, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  v15 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ArchetypeRawAssortment(0)), "init");
  v16 = swift_allocObject(&unk_100008728, 32, 7);
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  v17 = *(void (**)(uint64_t, uint64_t (*)(uint64_t), uint64_t))((swift_isaMask & *v15) + 0x58);
  sub_100004230(a2, a3);
  v17(a1, sub_100004330, v16);

  return swift_release(v16);
}

uint64_t _s12textcontextd29ATRawAssortmentServiceHandlerC24spotlightEmailAttributes_010completionE0ySi_ySSSgcSgtF_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  _QWORD *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t (*)(uint64_t), uint64_t);
  uint64_t v19;

  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin();
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = Logger.init()(v8);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Retrieving email attributes from spotlight", v14, 2u);
    swift_slowDealloc(v14, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  v15 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ArchetypeRawAssortment(0)), "init");
  v16 = swift_allocObject(&unk_1000086B0, 32, 7);
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  v17 = *(void (**)(uint64_t, uint64_t (*)(uint64_t), uint64_t))((swift_isaMask & *v15) + 0x60);
  sub_100004230(a2, a3);
  v17(a1, sub_10000428C, v16);

  return swift_release(v16);
}

uint64_t _s12textcontextd29ATRawAssortmentServiceHandlerC4text10onScreenAXyySSSgcSg_tF_0(uint64_t a1, uint64_t a2)
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
  char *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD *v23;
  uint64_t v24;
  void *v25;
  _QWORD *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD aBlock[5];
  _QWORD *v37;

  v32 = a2;
  v3 = type metadata accessor for DispatchWorkItemFlags(0);
  v35 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin();
  v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchQoS(0);
  v33 = *(_QWORD *)(v6 - 8);
  v34 = v6;
  __chkstk_darwin();
  v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Logger(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin();
  v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = Logger.init()(v11);
  v15 = Logger.logObject.getter(v14);
  v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Retrieving text on-screen using accessibility", v17, 2u);
    swift_slowDealloc(v17, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  v18 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ArchetypeRawAssortment(0)), "init");
  v19 = (*(uint64_t (**)(void))((swift_isaMask & *v18) + 0x68))();
  v21 = v20;
  sub_1000034D8();
  v22 = (void *)static OS_dispatch_queue.main.getter();
  v23 = (_QWORD *)swift_allocObject(&unk_100008660, 48, 7);
  v24 = v32;
  v23[2] = a1;
  v23[3] = v24;
  v23[4] = v19;
  v23[5] = v21;
  aBlock[4] = sub_1000043B8;
  v37 = v23;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100003650;
  aBlock[3] = &unk_100008678;
  v25 = _Block_copy(aBlock);
  v26 = v37;
  sub_100004230(a1, v24);
  v27 = swift_release(v26);
  static DispatchQoS.unspecified.getter(v27);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v28 = sub_100004240();
  v29 = sub_10000355C(&qword_10000CE10);
  v30 = sub_1000042BC(&qword_10000CE18, &qword_10000CE10, (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v29, v30, v3, v28);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v8, v5, v25);
  _Block_release(v25);

  (*(void (**)(char *, uint64_t))(v35 + 8))(v5, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v8, v34);
}

uint64_t type metadata accessor for ATRawAssortmentServiceHandler()
{
  return objc_opt_self(_TtC12textcontextd29ATRawAssortmentServiceHandler);
}

uint64_t sub_1000041D8(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_1000041E8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_10000420C(uint64_t a1, void *a2)
{
  uint64_t v2;

  sub_100003710(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_100004218(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100004228(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100004230(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

unint64_t sub_100004240()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000CE08;
  if (!qword_10000CE08)
  {
    v1 = type metadata accessor for DispatchWorkItemFlags(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_10000CE08);
  }
  return result;
}

uint64_t sub_10000428C(uint64_t a1)
{
  uint64_t v1;

  return sub_100003758(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t)&unk_1000086D8, (uint64_t)sub_1000043B8, (uint64_t)&unk_1000086F0);
}

uint64_t sub_1000042BC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_1000035E8(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100004304()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100004330(uint64_t a1)
{
  uint64_t v1;

  return sub_100003758(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t)&unk_100008750, (uint64_t)sub_100004398, (uint64_t)&unk_100008768);
}

uint64_t sub_100004364()
{
  _QWORD *v0;

  if (v0[2])
    swift_release(v0[3]);
  swift_bridgeObjectRelease(v0[5]);
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100004398()
{
  uint64_t *v0;

  return sub_100003A3C(v0[2], v0[3], v0[4], v0[5]);
}

id sub_1000043D4()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ATPersonalizationServer()), "init");
  qword_10000CF78 = (uint64_t)result;
  return result;
}

char *sub_100004400()
{
  void *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  NSString v5;
  id v6;
  char *v7;
  void *v8;
  char *v9;
  id v10;
  objc_super v12;

  v1 = v0;
  ATPersonalizationServiceName.getter();
  v3 = v2;
  v4 = objc_allocWithZone((Class)NSXPCListener);
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  v6 = objc_msgSend(v4, "initWithMachServiceName:", v5);

  *(_QWORD *)&v1[OBJC_IVAR____TtC12textcontextd23ATPersonalizationServer_listener] = v6;
  v12.receiver = v1;
  v12.super_class = (Class)type metadata accessor for ATPersonalizationServer();
  v7 = (char *)objc_msgSendSuper2(&v12, "init");
  v8 = *(void **)&v7[OBJC_IVAR____TtC12textcontextd23ATPersonalizationServer_listener];
  v9 = v7;
  objc_msgSend(v8, "setDelegate:", v9);
  v10 = v8;
  objc_msgSend(v10, "resume");

  return v9;
}

uint64_t sub_100004694(char a1, void *aBlock)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(char);

  *(_QWORD *)(v2 + 16) = _Block_copy(aBlock);
  v6 = (uint64_t (*)(char))((char *)&dword_10000CF50 + dword_10000CF50);
  v4 = (_QWORD *)swift_task_alloc(unk_10000CF54);
  *(_QWORD *)(v2 + 24) = v4;
  *v4 = v2;
  v4[1] = sub_100004700;
  return v6(a1);
}

uint64_t sub_100004700(void *a1)
{
  uint64_t *v1;
  void (**v3)(_QWORD, _QWORD);
  uint64_t v5;

  v3 = *(void (***)(_QWORD, _QWORD))(*v1 + 16);
  v5 = *v1;
  swift_task_dealloc(*(_QWORD *)(*v1 + 24));
  ((void (**)(_QWORD, void *))v3)[2](v3, a1);
  _Block_release(v3);

  return (*(uint64_t (**)(void))(v5 + 8))();
}

void sub_100004768(uint64_t a1)
{
  __asm { BR              X13 }
}

uint64_t sub_10000480C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t result;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;

  if (v3)
    v8 = v3;
  else
    v8 = 0xE000000000000000;
  if (!v3)
    v2 = 0;
  v16 = v2;
  v17 = v8;
  if (v4)
    v9 = v4;
  else
    v9 = 0xE000000000000000;
  v15 = v9;
  if (v4)
    v10 = v1;
  else
    v10 = 0;
  if (v5)
    v11 = v5;
  else
    v11 = 0xE000000000000000;
  if (v5)
    v12 = a1;
  else
    v12 = 0;
  v13 = objc_allocWithZone((Class)((uint64_t (*)(_QWORD))type metadata accessor for ATPlayedMediaItem)(0));
  ((void (*)(uint64_t))swift_bridgeObjectRetain)(v6);
  ((void (*)(unint64_t))swift_bridgeObjectRetain)(v5);
  ((void (*)(unint64_t))swift_bridgeObjectRetain)(v4);
  ((void (*)(unint64_t))swift_bridgeObjectRetain)(v3);
  ((void (*)())swift_bridgeObjectRetain)();
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, unint64_t, double))ATPlayedMediaItem.init(title:artist:album:link:bundleID:mediaType:playTime:))(v19, v18, v12, v11, v10, v15, v16, v17, v7);
  *v20 = result;
  return result;
}

uint64_t sub_100004A74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *aBlock, void *a6)
{
  _QWORD *v6;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _QWORD *v17;
  uint64_t (*v19)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v6[2] = a6;
  v6[3] = _Block_copy(aBlock);
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = v13;
  v6[4] = v13;
  v15 = unk_10000CF2C;
  v19 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_10000CF28 + dword_10000CF28);
  v16 = a6;
  v17 = (_QWORD *)swift_task_alloc(v15);
  v6[5] = v17;
  *v17 = v6;
  v17[1] = sub_100004B38;
  return v19(a1, a2, a3, v12, v14);
}

uint64_t sub_100004B38(void *a1)
{
  uint64_t *v1;
  uint64_t v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  uint64_t v7;

  v3 = *(_QWORD *)(*v1 + 32);
  v5 = *(void **)(*v1 + 16);
  v4 = *(void (***)(_QWORD, _QWORD))(*v1 + 24);
  v7 = *v1;
  swift_task_dealloc(*(_QWORD *)(*v1 + 40));
  swift_bridgeObjectRelease(v3);

  ((void (**)(_QWORD, void *))v4)[2](v4, a1);
  _Block_release(v4);

  return (*(uint64_t (**)(void))(v7 + 8))();
}

uint64_t sub_100004CE8(uint64_t a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  uint64_t v6;
  id v7;

  v3[5] = a3;
  v3[6] = _Block_copy(aBlock);
  v3[7] = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v3[8] = v6;
  v7 = a3;
  return swift_task_switch(sub_100004D44, 0, 0);
}

uint64_t sub_100004D44()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  _QWORD *v4;
  int *v5;
  _QWORD *v6;
  uint64_t (*v8)(void);

  v1 = v0[7];
  v2 = v0[8];
  v3 = objc_allocWithZone((Class)type metadata accessor for ATLocationRetriever(0));
  swift_bridgeObjectRetain(v2);
  v4 = (_QWORD *)ATLocationRetriever.init(effectiveBundleIdentifier:)(v1, v2);
  v0[9] = v4;
  (*(void (**)(void))((swift_isaMask & *v4) + 0x80))();
  v5 = *(int **)((swift_isaMask & *v4) + 0x98);
  v8 = (uint64_t (*)(void))((char *)v5 + *v5);
  v6 = (_QWORD *)swift_task_alloc(v5[1]);
  v0[10] = v6;
  *v6 = v0;
  v6[1] = sub_100004DFC;
  return v8();
}

uint64_t sub_100004DFC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)*v2;
  v3[2] = v2;
  v3[3] = a1;
  v3[4] = a2;
  v4 = v3[10];
  v3[11] = a2;
  swift_task_dealloc(v4);
  return swift_task_switch(sub_100004E58, 0, 0);
}

uint64_t sub_100004E58()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  unint64_t v5;
  NSString v6;

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 64);
  v3 = *(void **)(v0 + 72);
  v4 = *(void (***)(_QWORD, _QWORD))(v0 + 48);

  swift_bridgeObjectRelease(v2);
  if (v1)
    v5 = v1;
  else
    v5 = 0x8000000100006EA0;
  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  ((void (**)(_QWORD, NSString))v4)[2](v4, v6);

  _Block_release(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_100004F04()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ATPersonalizationServer();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ATPersonalizationServer()
{
  return objc_opt_self(_TtC12textcontextd23ATPersonalizationServer);
}

uint64_t sub_100004F64()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100004F98()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc(dword_10000CECC);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1000060DC;
  return ((uint64_t (*)(uint64_t, void *, void *))((char *)&dword_10000CEC8 + dword_10000CEC8))(v2, v3, v4);
}

uint64_t sub_100005004(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100005014(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc(a3[1]);
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_1000060DC;
  return v6();
}

uint64_t sub_10000506C()
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
  v5 = (_QWORD *)swift_task_alloc(dword_10000CEDC);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1000060DC;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_10000CED8 + dword_10000CED8))(v2, v3, v4);
}

uint64_t sub_1000050E4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc(a4[1]);
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_1000060DC;
  return v7();
}

uint64_t sub_10000513C(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc(dword_10000CEEC);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_1000060DC;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_10000CEE8 + dword_10000CEE8))(a1, v4, v5, v6);
}

uint64_t sub_1000051C0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_100005304(a1);
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
  v16 = swift_allocObject(&unk_100008818, 32, 7);
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
  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_10000CF00, v16);
}

uint64_t sub_100005304(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10000355C(&qword_10000CEC0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100005344(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1000053A8;
  return v6(a1);
}

uint64_t sub_1000053A8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1000053F4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100005418(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10000CEFC);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_100005488;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10000CEF8 + dword_10000CEF8))(a1, v4);
}

uint64_t sub_100005488()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1000054D0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 48));
  return swift_deallocObject(v0, 64, 7);
}

uint64_t sub_100005504()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD *v8;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = v0[5];
  v7 = (void *)v0[6];
  v6 = (void *)v0[7];
  v8 = (_QWORD *)swift_task_alloc(dword_10000CF0C);
  *(_QWORD *)(v1 + 16) = v8;
  *v8 = v1;
  v8[1] = sub_100005488;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, void *, void *))((char *)&dword_10000CF08
                                                                                     + dword_10000CF08))(v2, v3, v4, v5, v7, v6);
}

uint64_t sub_100005598(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  SecTaskRef v7;
  __SecTask *v8;
  __CFString *v9;
  CFTypeRef v10;
  CFTypeID v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFBoolean *v15;
  int Value;
  id v17;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  audit_token_t token;

  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&token - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(a1, "auditToken");
  v7 = SecTaskCreateWithAuditToken(0, &token);
  if (v7)
  {
    v8 = v7;
    v9 = (__CFString *)String._bridgeToObjectiveC()();
    v10 = SecTaskCopyValueForEntitlement(v8, v9, 0);

    if (v10)
    {
      v11 = CFGetTypeID(v10);
      if (v11 == CFBooleanGetTypeID())
      {
        type metadata accessor for CFBoolean();
        v13 = v12;
        v14 = swift_unknownObjectRetain(v10);
        v15 = (const __CFBoolean *)swift_dynamicCastUnknownClassUnconditional(v14, v13, 0, 0, 0);
        Value = CFBooleanGetValue(v15);

        v7 = (SecTaskRef)swift_unknownObjectRelease(v10);
        if (Value)
        {
          v17 = objc_msgSend((id)objc_opt_self(NSXPCInterface), "interfaceWithProtocol:", &OBJC_PROTOCOL____TtP9Archetype24ATPersonalizationService_);
          objc_msgSend(a1, "setExportedInterface:", v17);

          objc_msgSend(a1, "setExportedObject:", v1);
          objc_msgSend(a1, "resume");
          return 1;
        }
      }
      else
      {

        v7 = (SecTaskRef)swift_unknownObjectRelease(v10);
      }
    }
    else
    {

    }
  }
  v19 = Logger.init()(v7);
  v20 = Logger.logObject.getter(v19);
  v21 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v22 = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "ATPersonalizationServer is denying connection because client is missing entitlement", v22, 2u);
    swift_slowDealloc(v22, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return 0;
}

uint64_t sub_1000057F4(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v1 + 88) = a1;
  v2 = type metadata accessor for ATSpotlightDataRecord(0);
  *(_QWORD *)(v1 + 16) = v2;
  v3 = *(_QWORD *)(v2 - 8);
  *(_QWORD *)(v1 + 24) = v3;
  *(_QWORD *)(v1 + 32) = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for Date(0);
  *(_QWORD *)(v1 + 40) = v4;
  v5 = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v1 + 48) = v5;
  *(_QWORD *)(v1 + 56) = swift_task_alloc((*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10000587C, 0, 0);
}

uint64_t sub_10000587C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int *v3;
  _QWORD *v4;
  int *v6;

  v1 = type metadata accessor for ATSpotlightCalendarRetriever(0);
  swift_allocObject(v1, *(unsigned int *)(v1 + 48), *(unsigned __int16 *)(v1 + 52));
  v2 = ATSpotlightCalendarRetriever.init()();
  *(_QWORD *)(v0 + 64) = v2;
  Date.init()();
  v3 = *(int **)(*(_QWORD *)v2 + 216);
  v6 = (int *)((char *)v3 + *v3);
  v4 = (_QWORD *)swift_task_alloc(v3[1]);
  *(_QWORD *)(v0 + 72) = v4;
  *v4 = v0;
  v4[1] = sub_100005918;
  return ((uint64_t (*)(_QWORD, _QWORD, uint64_t))v6)(*(_QWORD *)(v0 + 56), *(unsigned __int8 *)(v0 + 88), 100);
}

uint64_t sub_100005918(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 72);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 48);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 56);
  v5 = *(_QWORD *)(*(_QWORD *)v1 + 40);
  *(_QWORD *)(*(_QWORD *)v1 + 80) = a1;
  swift_task_dealloc(v2);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  return swift_task_switch(sub_100005994, 0, 0);
}

uint64_t sub_100005994()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v4 = *(_QWORD *)(v0 + 16);
    v3 = *(_QWORD *)(v0 + 24);
    specialized ContiguousArray.reserveCapacity(_:)(v2);
    v5 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v6 = *(_QWORD *)(v3 + 72);
    do
    {
      v14 = *(_QWORD *)(v0 + 32);
      sub_10000605C(v5, v14);
      v15 = (uint64_t *)(v14 + *(int *)(v4 + 84));
      v16 = v15[1];
      if (v16)
      {
        v7 = *v15;
        v8 = v15[1];
      }
      else
      {
        v8 = 0xEF5D656C74697420;
        v7 = 0x6E776F6E6B6E755BLL;
      }
      v9 = *(_QWORD *)(v0 + 32);
      objc_allocWithZone((Class)type metadata accessor for ATCalendarEvent(0));
      swift_bridgeObjectRetain(v16);
      v10 = ATCalendarEvent.init(eventTitle:)(v7, v8);
      v11 = sub_1000060A0(v9);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v11);
      v12 = _swiftEmptyArrayStorage[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v12);
      v13 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v12, v10);
      specialized ContiguousArray._endMutation()(v13);
      v5 += v6;
      --v2;
    }
    while (v2);
  }
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 80));
  v18 = *(_QWORD *)(v0 + 56);
  v17 = *(_QWORD *)(v0 + 64);
  v19 = *(_QWORD *)(v0 + 32);
  v20 = objc_allocWithZone((Class)type metadata accessor for ATArrayOfCalendarEvents(0));
  v21 = ATArrayOfCalendarEvents.init(calendarEvents:)(_swiftEmptyArrayStorage);
  swift_release(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v21);
}

uint64_t sub_100005B44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[7] = a4;
  v5[8] = a5;
  v5[5] = a2;
  v5[6] = a3;
  v5[4] = a1;
  return swift_task_switch(sub_100005B64, 0, 0);
}

uint64_t sub_100005B64()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  _UNKNOWN **v5;
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = v0[7];
  v1 = v0[8];
  v3 = type metadata accessor for ATBiomeDataRetriever(0);
  v0[9] = swift_initStackObject(v3, v0 + 2);
  v4 = v2 == 1735290739 && v1 == 0xE400000000000000;
  if (v4
    || (_stringCompareWithSmolCheck(_:_:expecting:)(1735290739, 0xE400000000000000, v0[7], v0[8], 0) & 1) != 0)
  {
    v5 = &off_1000083C8;
  }
  else
  {
    v8 = v0[7];
    v9 = v0[8];
    if (v8 == 0x74736163646F70 && v9 == 0xE700000000000000
      || (_stringCompareWithSmolCheck(_:_:expecting:)(0x74736163646F70, 0xE700000000000000, v8, v9, 0) & 1) != 0)
    {
      v5 = &off_1000083F0;
    }
    else
    {
      v10 = v0[7];
      v11 = v0[8];
      if (v10 == 0x6F6F626F69647561 && v11 == 0xE90000000000006BLL
        || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6F6F626F69647561, 0xE90000000000006BLL, v10, v11, 0) & 1) != 0)
      {
        v5 = &off_100008418;
      }
      else
      {
        v12 = v0[7];
        v13 = v0[8];
        v5 = &off_100008440;
        if ((v12 != 0x54724F6569766F6DLL || v13 != 0xED0000776F685356)
          && (_stringCompareWithSmolCheck(_:_:expecting:)(0x54724F6569766F6DLL, 0xED0000776F685356, v12, v13, 0) & 1) == 0)
        {
          v5 = &off_100008468;
        }
      }
    }
  }
  v0[10] = v5;
  v6 = (_QWORD *)swift_task_alloc(async function pointer to ATBiomeDataRetriever.getTopPlayedMedia(k:start:end:mediaTypesOfInterest:maxNumRecordsToFetch:)[1]);
  v0[11] = v6;
  *v6 = v0;
  v6[1] = sub_100005D50;
  return ATBiomeDataRetriever.getTopPlayedMedia(k:start:end:mediaTypesOfInterest:maxNumRecordsToFetch:)(v0[4], v0[5], v0[6], v5, 1000);
}

uint64_t sub_100005D50(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 88);
  *(_QWORD *)(*(_QWORD *)v1 + 96) = a1;
  swift_task_dealloc(v2);
  swift_bridgeObjectRelease(v3);
  return swift_task_switch(sub_100005DB4, 0, 0);
}

uint64_t sub_100005DB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  char v26;
  uint64_t v27;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    specialized ContiguousArray.reserveCapacity(_:)(v2);
    v3 = (_QWORD *)(v1 + 136);
    do
    {
      v4 = *(v3 - 2);
      v5 = *((_BYTE *)v3 - 8);
      v6 = *v3;
      v19 = *(v3 - 13);
      v7 = *((_OWORD *)v3 - 5);
      v20 = *((_OWORD *)v3 - 6);
      v21 = v7;
      v8 = *((_OWORD *)v3 - 3);
      v22 = *((_OWORD *)v3 - 4);
      v23 = v8;
      v24 = *((_OWORD *)v3 - 2);
      v25 = v4;
      v9 = v20;
      v10 = v7;
      v26 = v5;
      v11 = v22;
      v12 = v8;
      v13 = v24;
      v27 = v6;
      swift_bridgeObjectRetain(v24);
      swift_bridgeObjectRetain(v4);
      swift_bridgeObjectRetain(v9);
      swift_bridgeObjectRetain(v10);
      swift_bridgeObjectRetain(v11);
      swift_bridgeObjectRetain(v12);
      sub_100004768((uint64_t)&v19);
      swift_bridgeObjectRelease(v9);
      swift_bridgeObjectRelease(v10);
      swift_bridgeObjectRelease(v11);
      swift_bridgeObjectRelease(v12);
      swift_bridgeObjectRelease(v13);
      v14 = swift_bridgeObjectRelease(v4);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v14);
      v15 = _swiftEmptyArrayStorage[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v15);
      v16 = ((uint64_t (*)(uint64_t))specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:))(v15);
      specialized ContiguousArray._endMutation()(v16);
      v3 += 14;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 96));
  }
  else
  {
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 96));
  }
  objc_allocWithZone((Class)type metadata accessor for ATArrayOfPlayedMediaItems(0));
  v17 = ATArrayOfPlayedMediaItems.init(playedMediaItems:)(_swiftEmptyArrayStorage);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v17);
}

uint64_t sub_100005F90()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));

  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100005FBC()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  void *v3;
  _QWORD *v4;

  v2 = *(_BYTE *)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc(dword_10000CF34);
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_1000060DC;
  return ((uint64_t (*)(char, void *))((char *)&dword_10000CF30 + dword_10000CF30))(v2, v3);
}

uint64_t sub_100006030()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000605C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ATSpotlightDataRecord(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000060A0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ATSpotlightDataRecord(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}
