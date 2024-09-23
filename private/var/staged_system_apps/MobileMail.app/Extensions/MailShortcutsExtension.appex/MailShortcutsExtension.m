uint64_t sub_100003288()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t *v17;
  uint64_t *v18;
  _BYTE **v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t *v30;
  uint32_t v31;
  uint64_t v32;
  int v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE *v39;
  uint64_t v40;
  uint32_t v41;
  char *v42;

  v42 = 0;
  v23 = 0;
  v32 = 0;
  v24 = type metadata accessor for Logger();
  v25 = *(_QWORD *)(v24 - 8);
  v26 = (*(_QWORD *)(v25 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  __chkstk_darwin();
  v27 = (char *)&v9 - v26;
  v42 = (char *)&v9 - v26;
  v0 = static Logger.mailUILogger<A>(for:)(&unk_100004118);
  v34 = Logger.logObject.getter(v0);
  v33 = static os_log_type_t.default.getter();
  v30 = &v40;
  v40 = 2;
  v28 = sub_1000035D0();
  v29 = sub_100003638();
  v1 = sub_1000036A0();
  UnsignedInteger<>.init<A>(_:)(&v41, v30, &type metadata for UInt32, &type metadata for Int, v28, v29, v1);
  v31 = v41;
  v2 = sub_100003934(&qword_100008018);
  v35 = _allocateUninitializedArray<A>(_:)(v32, v2);
  if (os_log_type_enabled(v34, (os_log_type_t)v33))
  {
    v3 = v23;
    v13 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(2, &type metadata for UInt8);
    v11 = sub_100003934(&qword_100008020);
    v12 = 0;
    v14 = sub_100003818(0, v11, v11);
    v15 = sub_100003818(v12, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
    v19 = &v39;
    v39 = v13;
    v20 = &v38;
    v38 = v14;
    v17 = &v37;
    v37 = v15;
    v16 = 0;
    sub_100003870(0, &v39);
    sub_100003870(v16, v19);
    v36 = v35;
    v18 = &v9;
    __chkstk_darwin();
    v4 = v20;
    v5 = &v9 - 6;
    v21 = &v9 - 6;
    v5[2] = (uint64_t)v19;
    v5[3] = (uint64_t)v4;
    v5[4] = v6;
    v22 = sub_100003934(&qword_100008028);
    v7 = sub_1000039CC();
    Sequence.forEach(_:)(sub_1000039A0, v21, v22, v7);
    if (v3)
    {
      __break(1u);
    }
    else
    {
      _os_log_impl((void *)&_mh_execute_header, v34, (os_log_type_t)v33, "Initializing MailShortcutsExtension", v13, v31);
      v10 = 0;
      sub_1000038C8(v14, 0);
      sub_1000038C8(v15, v10);
      UnsafeMutablePointer.deallocate()();
      swift_bridgeObjectRelease(v35);
    }
  }
  else
  {
    swift_bridgeObjectRelease(v35);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v27, v24);
}

unint64_t sub_1000035D0()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_100008000;
  if (!qword_100008000)
  {
    v0 = ((uint64_t (*)(void *, void *))swift_getWitnessTable)(&protocol conformance descriptor for UInt32, &type metadata for UInt32);
    atomic_store(v0, (unint64_t *)&qword_100008000);
    return v0;
  }
  return v2;
}

unint64_t sub_100003638()
{
  unint64_t WitnessTable;
  uint64_t v2;

  v2 = qword_100008008;
  if (!qword_100008008)
  {
    WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for UInt32, &type metadata for UInt32);
    atomic_store(WitnessTable, (unint64_t *)&qword_100008008);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_1000036A0()
{
  unint64_t WitnessTable;
  uint64_t v2;

  v2 = qword_100008010;
  if (!qword_100008010)
  {
    WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(WitnessTable, (unint64_t *)&qword_100008010);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100003708()
{
  unint64_t v0;

  v0 = sub_100003B30();
  return static AppExtension.main()(&unk_100004118, v0);
}

uint64_t sub_10000377C(uint64_t a1)
{
  unint64_t v1;

  v1 = sub_100003AB0();
  return AppIntentsExtension.configuration.getter(a1, v1);
}

uint64_t sub_1000037B0()
{
  return sub_100003288();
}

int main(int argc, const char **argv, const char **envp)
{
  sub_100003708();
  return 0;
}

uint64_t sub_100003818(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
    return static UnsafeMutablePointer.allocate(capacity:)(a1, a3);
  else
    return 0;
}

uint64_t sub_100003870(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100003884(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

void sub_1000038C8(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    UnsafeMutablePointer.deinitialize(count:)(a2);
    UnsafeMutablePointer.deallocate()();
  }
}

uint64_t sub_100003934(uint64_t *a1)
{
  uint64_t TypeByMangledNameInContext2;
  uint64_t v4;

  v4 = *a1;
  if (*a1 < 0)
  {
    TypeByMangledNameInContext2 = swift_getTypeByMangledNameInContext2((char *)a1 + (int)*a1, -(*a1 >> 32), 0);
    *a1 = TypeByMangledNameInContext2;
    return TypeByMangledNameInContext2;
  }
  return v4;
}

uint64_t sub_1000039A0(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  uint64_t *v1;

  return sub_100003884(a1, v1[2], v1[3], v1[4]);
}

unint64_t sub_1000039CC()
{
  uint64_t v0;
  unint64_t WitnessTable;
  uint64_t v3;

  v3 = qword_100008030;
  if (!qword_100008030)
  {
    v0 = sub_100003A3C(&qword_100008028);
    WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for [A], v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100008030);
    return WitnessTable;
  }
  return v3;
}

uint64_t sub_100003A3C(uint64_t *a1)
{
  uint64_t TypeByMangledNameInContextInMetadataState2;
  uint64_t v4;

  v4 = *a1;
  if (*a1 < 0)
  {
    TypeByMangledNameInContextInMetadataState2 = swift_getTypeByMangledNameInContextInMetadataState2(255, (char *)a1 + (int)*a1, -(*a1 >> 32), 0);
    *a1 = TypeByMangledNameInContextInMetadataState2;
    return TypeByMangledNameInContextInMetadataState2;
  }
  return v4;
}

unint64_t sub_100003AB0()
{
  unint64_t WitnessTable;
  uint64_t v2;

  v2 = qword_100008038;
  if (!qword_100008038)
  {
    WitnessTable = swift_getWitnessTable(&unk_100003DE0, &unk_100004118);
    atomic_store(WitnessTable, (unint64_t *)&qword_100008038);
    return WitnessTable;
  }
  return v2;
}

unint64_t sub_100003B1C()
{
  return sub_100003B30();
}

unint64_t sub_100003B30()
{
  unint64_t WitnessTable;
  uint64_t v2;

  v2 = qword_100008040;
  if (!qword_100008040)
  {
    WitnessTable = swift_getWitnessTable(&unk_100003E08, &unk_100004118);
    atomic_store(WitnessTable, (unint64_t *)&qword_100008040);
    return WitnessTable;
  }
  return v2;
}

uint64_t sub_100003B9C(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_100003AB0();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of AppIntentsExtension.configuration>>, 1);
}

void *type metadata accessor for MailShortcutsExtension()
{
  return &unk_100004118;
}
