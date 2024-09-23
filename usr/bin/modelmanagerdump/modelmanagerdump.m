uint64_t sub_100002C04()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  uint64_t v6;

  sub_100002FA4(&qword_100008040);
  __chkstk_darwin();
  v1 = (char *)&v6 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for CommandConfiguration(0);
  sub_100003240(v2, qword_100008088);
  sub_100003228(v2, (uint64_t)qword_100008088);
  v3 = type metadata accessor for NameSpecification(0);
  sub_100003280((uint64_t)v1, 1, 1, v3);
  v5 = 1;
  return CommandConfiguration.init(commandName:abstract:usage:discussion:version:shouldDisplay:subcommands:defaultSubcommand:helpNames:)(0, 0, 0xD000000000000019, 0x8000000100003D00, 0, 0, 0, 0xE000000000000000, 0, 0xE000000000000000, v5, &_swiftEmptyArrayStorage, 0, 0, v1);
}

uint64_t sub_100002D08()
{
  uint64_t v0;

  if (qword_100008000 != -1)
    swift_once(&qword_100008000, sub_100002C04);
  v0 = type metadata accessor for CommandConfiguration(0);
  return sub_100003228(v0, (uint64_t)qword_100008088);
}

uint64_t sub_100002D50()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = type metadata accessor for String.Encoding(0);
  v0[2] = sub_1000032B8(*(_QWORD *)(v1 - 8));
  v2 = type metadata accessor for StateDump(0);
  v0[3] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v0[4] = v3;
  v4 = sub_1000032B8(v3);
  v0[5] = v4;
  v5 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to static StateDump.dump() + 1));
  v0[6] = v5;
  *v5 = v0;
  v5[1] = sub_100002DD4;
  return static StateDump.dump()(v4);
}

uint64_t sub_100002DD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)();

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 48);
  *(_QWORD *)(*(_QWORD *)v1 + 56) = v0;
  swift_task_dealloc(v2);
  if (v0)
    v3 = sub_100002F6C;
  else
    v3 = sub_100002E38;
  return swift_task_switch(v3, 0, 0);
}

uint64_t sub_100002E38()
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
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v2 = *(_QWORD *)(v0 + 32);
  v1 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 16);
  v4 = *(_QWORD *)(v0 + 24);
  v5 = sub_100002FA4(&qword_100008018);
  v6 = swift_allocObject(v5, 64, 7);
  *(_OWORD *)(v6 + 16) = xmmword_100003AB0;
  v7 = StateDump.dataValue.getter();
  if (v8 >> 60 == 15)
    v9 = 0;
  else
    v9 = v7;
  if (v8 >> 60 == 15)
    v10 = 0xC000000000000000;
  else
    v10 = v8;
  static String.Encoding.utf8.getter(v7);
  v11 = String.init(data:encoding:)(v9, v10, v3);
  v13 = v12;
  sub_100002FE4(v9, v10);
  *(_QWORD *)(v6 + 56) = &type metadata for String;
  v14 = 0xD000000000000013;
  if (v13)
    v14 = v11;
  v15 = 0x8000000100003CE0;
  if (v13)
    v15 = v13;
  *(_QWORD *)(v6 + 32) = v14;
  *(_QWORD *)(v6 + 40) = v15;
  print(_:separator:terminator:)(v6, 32, 0xE100000000000000, 10, 0xE100000000000000);
  swift_bridgeObjectRelease(v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v4);
  swift_task_dealloc(v1);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100002F6C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_task_dealloc(*(_QWORD *)(v0 + 40));
  swift_task_dealloc(v1);
  return sub_1000032AC(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_100002FA4(uint64_t *a1)
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

uint64_t sub_100002FE4(uint64_t a1, unint64_t a2)
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

ValueMetadata *type metadata accessor for DumpState()
{
  return &type metadata for DumpState;
}

uint64_t sub_100003038(_QWORD *a1)
{
  return sub_10000328C(a1);
}

uint64_t sub_10000305C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_100008014);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1000030A0;
  return sub_100002D50();
}

uint64_t sub_1000030A0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return sub_1000032AC(*(uint64_t (**)(void))(v2 + 8));
}

uint64_t sub_1000030E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100002D08();
  v3 = type metadata accessor for CommandConfiguration(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v2, v3);
}

void sub_100003124()
{
  ParsableCommand.run()();
}

void sub_10000313C()
{
  ParsableArguments.validate()();
}

uint64_t sub_100003154(_QWORD *a1)
{
  return sub_100003038(a1);
}

unint64_t sub_10000316C()
{
  unint64_t result;

  result = qword_100008020;
  if (!qword_100008020)
  {
    result = swift_getWitnessTable(&unk_100003B74, &type metadata for DumpState);
    atomic_store(result, (unint64_t *)&qword_100008020);
  }
  return result;
}

unint64_t sub_1000031AC()
{
  unint64_t result;

  result = qword_100008028;
  if (!qword_100008028)
  {
    result = swift_getWitnessTable(&unk_100003B04, &type metadata for DumpState);
    atomic_store(result, (unint64_t *)&qword_100008028);
  }
  return result;
}

unint64_t sub_1000031EC()
{
  unint64_t result;

  result = qword_100008038;
  if (!qword_100008038)
  {
    result = swift_getWitnessTable("%\a", &type metadata for DumpState);
    atomic_store(result, (unint64_t *)&qword_100008038);
  }
  return result;
}

uint64_t sub_100003228(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *sub_100003240(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100003280(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_10000328C(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1000032AC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1000032B8@<X0>(uint64_t a1@<X8>)
{
  return swift_task_alloc((*(_QWORD *)(a1 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_1000032C8()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  uint64_t v6;

  sub_100002FA4(&qword_100008040);
  __chkstk_darwin();
  v1 = (char *)&v6 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for CommandConfiguration(0);
  sub_100003240(v2, qword_1000080A0);
  sub_100003228(v2, (uint64_t)qword_1000080A0);
  v3 = type metadata accessor for NameSpecification(0);
  sub_100003280((uint64_t)v1, 1, 1, v3);
  v5 = 1;
  return CommandConfiguration.init(commandName:abstract:usage:discussion:version:shouldDisplay:subcommands:defaultSubcommand:helpNames:)(0, 0, 0xD00000000000002DLL, 0x8000000100003D20, 0, 0, 0, 0xE000000000000000, 0, 0xE000000000000000, v5, &_swiftEmptyArrayStorage, 0, 0, v1);
}

uint64_t sub_1000033CC()
{
  uint64_t v0;

  if (qword_100008008 != -1)
    swift_once(&qword_100008008, sub_1000032C8);
  v0 = type metadata accessor for CommandConfiguration(0);
  return sub_100003228(v0, (uint64_t)qword_1000080A0);
}

uint64_t sub_100003414()
{
  return swift_task_switch(sub_100003428, 0, 0);
}

uint64_t sub_100003428()
{
  uint64_t v0;
  _QWORD *v1;

  sub_10000316C();
  static ParsableArguments.parse(_:)(&_swiftEmptyArrayStorage);
  v1 = (_QWORD *)swift_task_alloc(dword_100008014);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1000034B8;
  return sub_100002D50();
}

uint64_t sub_1000034B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)();

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  *(_QWORD *)(*(_QWORD *)v1 + 24) = v0;
  swift_task_dealloc(v2);
  if (v0)
    v3 = sub_100003528;
  else
    v3 = sub_10000351C;
  return swift_task_switch(v3, 0, 0);
}

uint64_t sub_10000351C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100003528()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100003534()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_100008084);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_100003578;
  return sub_100003414();
}

uint64_t sub_100003578()
{
  uint64_t v0;

  sub_1000038B8();
  return sub_1000032AC(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_10000359C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1000033CC();
  v3 = type metadata accessor for CommandConfiguration(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v2, v3);
}

uint64_t sub_1000035DC()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[2] = type metadata accessor for MainActor(0);
  v0[3] = static MainActor.shared.getter();
  v1 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to static AsyncParsableCommand.main() + 1));
  v0[4] = v1;
  sub_1000037AC();
  *v1 = v0;
  v1[1] = sub_100003654;
  return static AsyncParsableCommand.main()();
}

uint64_t sub_100003654()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 16);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 32));
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_1000036C4, v2, v3);
}

void sub_1000036C4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  exit(0);
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t MainExecutor;
  uint64_t v5;
  uint64_t v6;
  int result;

  v3 = swift_task_create(2048, 0, (char *)&type metadata for () + 8, &unk_100008048, 0);
  MainExecutor = swift_task_getMainExecutor();
  v6 = swift_job_run(v3, MainExecutor, v5);
  result = swift_task_asyncMainDrainQueue(v6);
  __break(1u);
  return result;
}

uint64_t sub_100003740()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_100008054);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_100003784;
  return sub_1000035DC();
}

uint64_t sub_100003784()
{
  uint64_t v0;

  sub_1000038B8();
  return sub_1000032AC(*(uint64_t (**)(void))(v0 + 8));
}

unint64_t sub_1000037AC()
{
  unint64_t result;

  result = qword_100008058;
  if (!qword_100008058)
  {
    result = swift_getWitnessTable(asc_100003C7C, &type metadata for modelmanagerdump);
    atomic_store(result, (unint64_t *)&qword_100008058);
  }
  return result;
}

ValueMetadata *type metadata accessor for modelmanagerdump()
{
  return &type metadata for modelmanagerdump;
}

unint64_t sub_1000037FC()
{
  unint64_t result;

  result = qword_100008060;
  if (!qword_100008060)
  {
    result = swift_getWitnessTable(byte_100003BD4, &type metadata for modelmanagerdump);
    atomic_store(result, (unint64_t *)&qword_100008060);
  }
  return result;
}

unint64_t sub_10000383C()
{
  unint64_t result;

  result = qword_100008068;
  if (!qword_100008068)
  {
    result = swift_getWitnessTable(byte_100003BFC, &type metadata for modelmanagerdump);
    atomic_store(result, (unint64_t *)&qword_100008068);
  }
  return result;
}

unint64_t sub_10000387C()
{
  unint64_t result;

  result = qword_100008070;
  if (!qword_100008070)
  {
    result = swift_getWitnessTable(byte_100003C3C, &type metadata for modelmanagerdump);
    atomic_store(result, (unint64_t *)&qword_100008070);
  }
  return result;
}

uint64_t sub_1000038B8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  v3 = *(_QWORD *)(v2 + 16);
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc(v3);
}
