id sub_1000032D0()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)EKEventStore), "initWithEKOptions:", 0x2000);
  if (!result)
    __break(1u);
  return result;
}

id sub_100003304@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)CalLinkREMStoreWrapper), "init");
  *a1 = result;
  return result;
}

id sub_10000333C@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)CNContactStore), "init");
  *a1 = result;
  return result;
}

uint64_t sub_100003374()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100003938(v0, qword_100008530);
  sub_100003820(v0, (uint64_t)qword_100008530);
  return Logger.init(subsystem:category:)(0xD000000000000012, 0x8000000100003CA0, 0xD000000000000018, 0x8000000100003B70);
}

uint64_t sub_1000033F0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000350C();
  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_100003484();
  static AppExtension.main()();
  return 0;
}

unint64_t sub_100003484()
{
  unint64_t result;

  result = qword_100008330;
  if (!qword_100008330)
  {
    result = swift_getWitnessTable(&unk_100003B48, &type metadata for CalendarIntentsExtension);
    atomic_store(result, (unint64_t *)&qword_100008330);
  }
  return result;
}

uint64_t sub_1000034CC(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_10000350C();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of AppIntentsExtension.configuration>>, 1);
}

unint64_t sub_10000350C()
{
  unint64_t result;

  result = qword_100008338;
  if (!qword_100008338)
  {
    result = swift_getWitnessTable(&unk_100003B20, &type metadata for CalendarIntentsExtension);
    atomic_store(result, (unint64_t *)&qword_100008338);
  }
  return result;
}

ValueMetadata *type metadata accessor for CalendarIntentsExtension()
{
  return &type metadata for CalendarIntentsExtension;
}

id sub_100003560(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  v4 = (void *)v1(v3);
  swift_release(v2);
  return v4;
}

uint64_t sub_100003598()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  id (*v20)();
  uint64_t v21;

  if (qword_100008420 != -1)
    swift_once(&qword_100008420, sub_100003374);
  v0 = type metadata accessor for Logger(0);
  sub_100003820(v0, (uint64_t)qword_100008530);
  v1 = Logger.logObject.getter();
  v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Initializing", v3, 2u);
    swift_slowDealloc(v3, -1, -1);
  }

  v4 = objc_allocWithZone((Class)EKEphemeralCacheEventStoreProvider);
  v20 = sub_1000032D0;
  v21 = 0;
  *(_QWORD *)&v18 = _NSConcreteStackBlock;
  *((_QWORD *)&v18 + 1) = 1107296256;
  *(_QWORD *)&v19 = sub_100003560;
  *((_QWORD *)&v19 + 1) = &unk_100004270;
  v5 = _Block_copy(&v18);
  v6 = objc_msgSend(v4, "initWithCreationBlock:", v5);
  _Block_release(v5);
  swift_release(v21);
  type metadata accessor for AppDependencyManager(0);
  v7 = ((uint64_t (*)(void))static AppDependencyManager.shared.getter)();
  v20 = 0;
  v18 = 0u;
  v19 = 0u;
  v8 = swift_allocObject(&unk_1000042A8, 24, 7);
  *(_QWORD *)(v8 + 16) = v6;
  v9 = v6;
  v10 = sub_100003880(&qword_1000083A0);
  AppDependencyManager.add<A>(key:dependency:)(&v18, sub_100003874, v8, v10);
  swift_release(v7);
  swift_release(v8);
  v11 = sub_1000038C0((uint64_t)&v18);
  v12 = static AppDependencyManager.shared.getter(v11);
  v13 = sub_100003900(0, &qword_1000083B0, CalLinkREMStoreWrapper_ptr);
  v18 = 0u;
  v19 = 0u;
  v20 = 0;
  AppDependencyManager.add<A>(key:dependency:)(&v18, sub_100003304, 0, v13);
  swift_release(v12);
  v14 = sub_1000038C0((uint64_t)&v18);
  v15 = static AppDependencyManager.shared.getter(v14);
  v16 = sub_100003900(0, &qword_1000083B8, CNContactStore_ptr);
  v18 = 0u;
  v19 = 0u;
  v20 = 0;
  AppDependencyManager.add<A>(key:dependency:)(&v18, sub_10000333C, 0, v16);

  swift_release(v15);
  return sub_1000038C0((uint64_t)&v18);
}

uint64_t sub_100003820(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_100003838(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100003848(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100003850()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100003874@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 16);
  return swift_unknownObjectRetain();
}

uint64_t sub_100003880(uint64_t *a1)
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

uint64_t sub_1000038C0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100003880(&qword_1000083A8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100003900(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t *sub_100003938(uint64_t a1, uint64_t *a2)
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
