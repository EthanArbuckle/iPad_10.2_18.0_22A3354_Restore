uint64_t static AccountChanged.deliveryStyle.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *MEMORY[0x24BE87248];
  v3 = sub_245E3CA30();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

uint64_t sub_245E12A3C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *MEMORY[0x24BE87248];
  v3 = sub_245E3CA30();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

ValueMetadata *type metadata accessor for AccountChanged()
{
  return &type metadata for AccountChanged;
}

void type metadata accessor for HTTPCookiePropertyKey()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_257523F60)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_257523F60);
  }
}

uint64_t sub_245E12AEC(uint64_t a1, uint64_t a2)
{
  return sub_245E12BB4(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_245E12AF8()
{
  sub_245E3CC64();
  sub_245E3CC88();
  return swift_bridgeObjectRelease();
}

uint64_t sub_245E12B38()
{
  uint64_t v0;

  sub_245E3CC64();
  sub_245E3D0CC();
  sub_245E3CC88();
  v0 = sub_245E3D0E4();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_245E12BA8(uint64_t a1, uint64_t a2)
{
  return sub_245E12BB4(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_245E12BB4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_245E3CC64();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_245E12BF0(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_245E3CC4C();
  *a2 = 0;
  return result;
}

uint64_t sub_245E12C64(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_245E3CC58();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_245E12CE0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_245E3CC64();
  v2 = sub_245E3CC40();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_245E12D20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_245E3CC64();
  v2 = v1;
  if (v0 == sub_245E3CC64() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_245E3D06C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_245E12DA8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_245E3CC40();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_245E12DEC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_245E3CC64();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_245E12E14()
{
  sub_245E12EEC((unint64_t *)&qword_257523F80, (uint64_t)&unk_245E3D924);
  sub_245E12EEC(&qword_257523F88, (uint64_t)&unk_245E3D878);
  return sub_245E3D00C();
}

uint64_t sub_245E12E80()
{
  return sub_245E12EEC(&qword_257523F68, (uint64_t)&unk_245E3D83C);
}

uint64_t sub_245E12EA4()
{
  return sub_245E12EEC(&qword_257523F70, (uint64_t)&unk_245E3D810);
}

uint64_t sub_245E12EC8()
{
  return sub_245E12EEC(&qword_257523F78, (uint64_t)&unk_245E3D8AC);
}

uint64_t sub_245E12EEC(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for HTTPCookiePropertyKey();
    result = MEMORY[0x24954A9D0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

BOOL static WristState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

BOOL sub_245E12F44(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t WristState.hash(into:)()
{
  return sub_245E3D0D8();
}

uint64_t WristState.hashValue.getter()
{
  sub_245E3D0CC();
  sub_245E3D0D8();
  return sub_245E3D0E4();
}

uint64_t sub_245E12FC8()
{
  sub_245E3D0CC();
  sub_245E3D0D8();
  return sub_245E3D0E4();
}

uint64_t sub_245E1300C()
{
  return sub_245E3D0D8();
}

uint64_t sub_245E13034()
{
  sub_245E3D0CC();
  sub_245E3D0D8();
  return sub_245E3D0E4();
}

unint64_t sub_245E13078()
{
  unint64_t result;

  result = qword_257524050;
  if (!qword_257524050)
  {
    result = MEMORY[0x24954A9D0](&protocol conformance descriptor for WristState, &type metadata for WristState);
    atomic_store(result, (unint64_t *)&qword_257524050);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for WristState(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for WristState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_245E131A8 + 4 * byte_245E3D975[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_245E131DC + 4 * byte_245E3D970[v4]))();
}

uint64_t sub_245E131DC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_245E131E4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x245E131ECLL);
  return result;
}

uint64_t sub_245E131F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x245E13200);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_245E13204(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245E1320C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245E13218(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_245E13224(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for WristState()
{
  return &type metadata for WristState;
}

uint64_t WristStateObserver.__allocating_init(eventHub:)()
{
  swift_unknownObjectRelease();
  return swift_allocObject();
}

uint64_t WristStateObserver.init(eventHub:)()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  return v0;
}

uint64_t WristStateObserver.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t WristStateObserver.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t WristStateObserver.queryState()()
{
  uint64_t v0;

  sub_245E132FC();
  v0 = swift_allocError();
  *(_QWORD *)(swift_allocObject() + 16) = v0;
  return sub_245E3C9D0();
}

unint64_t sub_245E132FC()
{
  unint64_t result;

  result = qword_257524058;
  if (!qword_257524058)
  {
    result = MEMORY[0x24954A9D0](&protocol conformance descriptor for WristMonitorError, &type metadata for WristMonitorError);
    atomic_store(result, (unint64_t *)&qword_257524058);
  }
  return result;
}

uint64_t sub_245E13340()
{
  uint64_t v0;

  sub_245E132FC();
  v0 = swift_allocError();
  *(_QWORD *)(swift_allocObject() + 16) = v0;
  return sub_245E3C9D0();
}

uint64_t sub_245E133AC()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_245E133D0()
{
  return sub_245E13418();
}

uint64_t type metadata accessor for WristStateObserver()
{
  return objc_opt_self();
}

uint64_t method lookup function for WristStateObserver()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WristStateObserver.__allocating_init(eventHub:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

id sub_245E13418()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 16);
  swift_willThrow();
  return v1;
}

id sub_245E13448(void *a1)
{
  swift_willThrow();
  return a1;
}

unint64_t static MultiUserGroupActivity.activityIdentifier.getter()
{
  return 0xD00000000000001BLL;
}

uint64_t MultiUserGroupActivity.activity.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_245E3C4FC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t MultiUserGroupActivity.activityMetadata.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for MultiUserGroupActivity() + 20);
  return sub_245E1353C(v3, a1);
}

uint64_t type metadata accessor for MultiUserGroupActivity()
{
  uint64_t result;

  result = qword_2575241B0;
  if (!qword_2575241B0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_245E1353C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575240F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24954A9B8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t MultiUserGroupActivity.activityMetadata.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for MultiUserGroupActivity() + 20);
  return sub_245E135F4(a1, v3);
}

uint64_t sub_245E135F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575240F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*MultiUserGroupActivity.activityMetadata.modify())()
{
  type metadata accessor for MultiUserGroupActivity();
  return nullsub_1;
}

uint64_t MultiUserGroupActivity.init(activity:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a2 + *(int *)(type metadata accessor for MultiUserGroupActivity() + 20);
  v5 = sub_245E3CB80();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v6 = sub_245E3C4FC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a2, a1, v6);
}

uint64_t MultiUserGroupActivity.metadata.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2575240F8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for MultiUserGroupActivity();
  sub_245E1353C(v1 + *(int *)(v5 + 20), (uint64_t)v4);
  v6 = sub_245E3CB80();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v4, 1, v6) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v4, v6);
  sub_245E137B0((uint64_t)v4);
  return sub_245E137F0();
}

uint64_t sub_245E137B0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575240F8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_245E137F0()
{
  uint64_t (*v0)(uint64_t);
  uint64_t v1;
  char *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[2];

  sub_245E3CBA4();
  v0 = (uint64_t (*)(uint64_t))MEMORY[0x24BDD1F80];
  MEMORY[0x24BDAC7A8]();
  v2 = (char *)v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257524208);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245E3CB38();
  MEMORY[0x24BDAC7A8]();
  sub_245E3CB74();
  v5 = sub_245E3C4F0();
  MEMORY[0x24954A034](v5);
  sub_245E3CB2C();
  sub_245E3CB5C();
  sub_245E3C4CC();
  v6 = sub_245E3C37C();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v4, 0, 1, v6);
  sub_245E3CB44();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257524210);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_245E3DA50;
  sub_245E3CB98();
  v9[1] = v7;
  sub_245E14CAC(&qword_257524218, v0, MEMORY[0x24BDD1F90]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257524220);
  sub_245E14CEC();
  sub_245E3CED4();
  return MEMORY[0x24954A01C](v2);
}

uint64_t sub_245E139E4()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000010;
  else
    return 0x7974697669746361;
}

uint64_t sub_245E13A24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_245E14BB8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_245E13A48()
{
  return 0;
}

void sub_245E13A54(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_245E13A60()
{
  sub_245E13C58();
  return sub_245E3D120();
}

uint64_t sub_245E13A88()
{
  sub_245E13C58();
  return sub_245E3D12C();
}

uint64_t MultiUserGroupActivity.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257524100);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245E13C58();
  sub_245E3D114();
  v8[15] = 0;
  sub_245E3C4FC();
  sub_245E14CAC(&qword_257524110, (uint64_t (*)(uint64_t))MEMORY[0x24BE8A590], MEMORY[0x24BE8A5A0]);
  sub_245E3D03C();
  if (!v1)
  {
    type metadata accessor for MultiUserGroupActivity();
    v8[14] = 1;
    sub_245E3CB80();
    sub_245E14CAC(&qword_257524118, (uint64_t (*)(uint64_t))MEMORY[0x24BDD1CC0], MEMORY[0x24BDD1CD0]);
    sub_245E3D030();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_245E13C58()
{
  unint64_t result;

  result = qword_257524108;
  if (!qword_257524108)
  {
    result = MEMORY[0x24954A9D0](&unk_245E3DC5C, &type metadata for MultiUserGroupActivity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257524108);
  }
  return result;
}

uint64_t MultiUserGroupActivity.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;

  v20 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575240F8);
  MEMORY[0x24BDAC7A8]();
  v21 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_245E3C4FC();
  v4 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8]();
  v22 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_257524120);
  v6 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MultiUserGroupActivity();
  v9 = MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (uint64_t)&v11[*(int *)(v9 + 20)];
  v13 = sub_245E3CB80();
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56);
  v26 = v12;
  v14(v12, 1, 1, v13);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245E13C58();
  v15 = v25;
  sub_245E3D108();
  if (v15)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return sub_245E137B0(v26);
  }
  else
  {
    v16 = v6;
    v17 = (uint64_t)v21;
    v28 = 0;
    sub_245E14CAC(&qword_257524128, (uint64_t (*)(uint64_t))MEMORY[0x24BE8A590], MEMORY[0x24BE8A5B0]);
    sub_245E3D024();
    v25 = v4;
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v11, v22, v23);
    v27 = 1;
    sub_245E14CAC(&qword_257524130, (uint64_t (*)(uint64_t))MEMORY[0x24BDD1CC0], MEMORY[0x24BDD1CD8]);
    sub_245E3D018();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v8, v24);
    sub_245E135F4(v17, v26);
    sub_245E13FAC((uint64_t)v11, v20);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return sub_245E13FF0((uint64_t)v11);
  }
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_245E13FAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MultiUserGroupActivity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_245E13FF0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for MultiUserGroupActivity();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_245E1402C()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_245E14048(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2575240F8);
  v6 = swift_task_alloc();
  sub_245E1353C(v2 + *(int *)(a2 + 20), v6);
  v7 = sub_245E3CB80();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_245E137B0(v6);
    sub_245E137F0();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(a1, v6, v7);
  }
  swift_task_dealloc();
  return sub_245E14CA4(*(uint64_t (**)(void))(v3 + 8));
}

uint64_t sub_245E14120@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return MultiUserGroupActivity.init(from:)(a1, a2);
}

uint64_t sub_245E14134(_QWORD *a1)
{
  return MultiUserGroupActivity.encode(to:)(a1);
}

uint64_t MultiUserGroupActivity.hashValue.getter()
{
  sub_245E3D0CC();
  _s21SeymourClientServices22MultiUserGroupActivityV4hash4intoys6HasherVz_tF_0();
  return sub_245E3D0E4();
}

uint64_t sub_245E14190()
{
  sub_245E3D0CC();
  _s21SeymourClientServices22MultiUserGroupActivityV4hash4intoys6HasherVz_tF_0();
  return sub_245E3D0E4();
}

uint64_t sub_245E141D0()
{
  sub_245E3D0CC();
  _s21SeymourClientServices22MultiUserGroupActivityV4hash4intoys6HasherVz_tF_0();
  return sub_245E3D0E4();
}

uint64_t sub_245E14208()
{
  return sub_245E14CAC(&qword_257524138, (uint64_t (*)(uint64_t))type metadata accessor for MultiUserGroupActivity, (uint64_t)&protocol conformance descriptor for MultiUserGroupActivity);
}

uint64_t sub_245E14234()
{
  return sub_245E14CAC((unint64_t *)&unk_257524140, (uint64_t (*)(uint64_t))type metadata accessor for MultiUserGroupActivity, (uint64_t)&protocol conformance descriptor for MultiUserGroupActivity);
}

uint64_t sub_245E14260()
{
  return sub_245E14CAC(&qword_257524150, (uint64_t (*)(uint64_t))type metadata accessor for MultiUserGroupActivity, (uint64_t)&protocol conformance descriptor for MultiUserGroupActivity);
}

uint64_t *initializeBufferWithCopyOfBuffer for MultiUserGroupActivity(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_245E3C4FC();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_245E3CB80();
    v12 = *(_QWORD *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575240F8);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
  }
  return a1;
}

uint64_t destroy for MultiUserGroupActivity(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v4 = sub_245E3C4FC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = sub_245E3CB80();
  v7 = *(_QWORD *)(v6 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  return result;
}

uint64_t initializeWithCopy for MultiUserGroupActivity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = sub_245E3C4FC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_245E3CB80();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575240F8);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

uint64_t assignWithCopy for MultiUserGroupActivity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;

  v6 = sub_245E3C4FC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = sub_245E3CB80();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575240F8);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t initializeWithTake for MultiUserGroupActivity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = sub_245E3C4FC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_245E3CB80();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575240F8);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

uint64_t assignWithTake for MultiUserGroupActivity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;

  v6 = sub_245E3C4FC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = sub_245E3CB80();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575240F8);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for MultiUserGroupActivity()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_245E14838(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = sub_245E3C4FC();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575240F8);
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for MultiUserGroupActivity()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_245E148BC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = sub_245E3C4FC();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575240F8);
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_245E1493C()
{
  unint64_t v0;
  unint64_t v1;

  sub_245E3C4FC();
  if (v0 <= 0x3F)
  {
    sub_245E149C0();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_245E149C0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2575241C0)
  {
    sub_245E3CB80();
    v0 = sub_245E3CE74();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2575241C0);
  }
}

uint64_t storeEnumTagSinglePayload for MultiUserGroupActivity.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_245E14A60 + 4 * byte_245E3DA65[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_245E14A94 + 4 * byte_245E3DA60[v4]))();
}

uint64_t sub_245E14A94(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_245E14A9C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x245E14AA4);
  return result;
}

uint64_t sub_245E14AB0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x245E14AB8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_245E14ABC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245E14AC4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MultiUserGroupActivity.CodingKeys()
{
  return &type metadata for MultiUserGroupActivity.CodingKeys;
}

unint64_t sub_245E14AE4()
{
  unint64_t result;

  result = qword_2575241F0;
  if (!qword_2575241F0)
  {
    result = MEMORY[0x24954A9D0](&unk_245E3DC34, &type metadata for MultiUserGroupActivity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575241F0);
  }
  return result;
}

unint64_t sub_245E14B2C()
{
  unint64_t result;

  result = qword_2575241F8;
  if (!qword_2575241F8)
  {
    result = MEMORY[0x24954A9D0](&unk_245E3DBA4, &type metadata for MultiUserGroupActivity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2575241F8);
  }
  return result;
}

unint64_t sub_245E14B74()
{
  unint64_t result;

  result = qword_257524200;
  if (!qword_257524200)
  {
    result = MEMORY[0x24954A9D0](&unk_245E3DBCC, &type metadata for MultiUserGroupActivity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257524200);
  }
  return result;
}

uint64_t sub_245E14BB8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x7974697669746361 && a2 == 0xE800000000000000;
  if (v2 || (sub_245E3D06C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000245E3E9F0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_245E3D06C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_245E14CA4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_245E14CAC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24954A9D0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_245E14CEC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257524228;
  if (!qword_257524228)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257524220);
    result = MEMORY[0x24954A9D0](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_257524228);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24954A9C4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_245E14D7C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 112) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t RequestCoalescer.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  swift_defaultActor_initialize();
  *(_QWORD *)(v0 + 112) = 0;
  return v0;
}

uint64_t RequestCoalescer.init()()
{
  uint64_t v0;

  swift_defaultActor_initialize();
  *(_QWORD *)(v0 + 112) = 0;
  return v0;
}

uint64_t RequestCoalescer.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t RequestCoalescer.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t RequestCoalescer.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_245E14E38()
{
  return RequestCoalescer.unownedExecutor.getter();
}

uint64_t RequestCoalescer.run(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  v4[6] = *v3;
  return swift_task_switch();
}

uint64_t sub_245E14E74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  _QWORD *v9;

  v5 = *(_QWORD *)(v4 + 40);
  v6 = type metadata accessor for RequestCoalescer(255, *(_QWORD *)(*(_QWORD *)(v4 + 48) + 80), a3, a4);
  MEMORY[0x24954A9D0](&protocol conformance descriptor for RequestCoalescer<A>, v6);
  v7 = swift_task_alloc();
  *(_QWORD *)(v4 + 56) = v7;
  v8 = *(_OWORD *)(v4 + 24);
  *(_QWORD *)(v7 + 16) = v5;
  *(_OWORD *)(v7 + 24) = v8;
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 64) = v9;
  *v9 = v4;
  v9[1] = sub_245E14F3C;
  return sub_245E3D078();
}

uint64_t sub_245E14F3C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_245E14FB0()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for RequestCoalescer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for RequestCoalescer);
}

uint64_t sub_245E14FF0(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;

  v8 = *(_QWORD *)(*a2 + 80);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25441B628);
  v9 = sub_245E3CDA8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v24 - v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441B5F0);
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2[14])
  {
    v25 = a2[14];
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
    sub_245E3CD78();
    swift_bridgeObjectRetain();
    sub_245E3CD6C();
    a2[14] = v25;
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_245E3D054();
    swift_allocObject();
    v16 = sub_245E3CD48();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v17, a1, v9);
    sub_245E3CD78();
    a2[14] = v16;
    swift_bridgeObjectRelease();
    v18 = sub_245E3CDD8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v14, 1, 1, v18);
    v21 = type metadata accessor for RequestCoalescer(255, v8, v19, v20);
    v22 = MEMORY[0x24954A9D0](&protocol conformance descriptor for RequestCoalescer<A>, v21);
    v23 = (_QWORD *)swift_allocObject();
    v23[2] = a2;
    v23[3] = v22;
    v23[4] = a3;
    v23[5] = a4;
    v23[6] = a2;
    swift_retain_n();
    swift_retain();
    sub_245E3662C((uint64_t)v14, (uint64_t)&unk_2575242C8, (uint64_t)v23);
    return swift_release();
  }
}

uint64_t sub_245E15220(uint64_t a1)
{
  uint64_t v1;

  return sub_245E14FF0(a1, *(_QWORD **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_245E1522C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t);

  v6[2] = a6;
  v8 = *(_QWORD *)(*(_QWORD *)a6 + 80);
  v6[3] = v8;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25441B628);
  v9 = sub_245E3D0FC();
  v6[4] = v9;
  v6[5] = *(_QWORD *)(v9 - 8);
  v6[6] = swift_task_alloc();
  v6[7] = *(_QWORD *)(v8 - 8);
  v10 = swift_task_alloc();
  v6[8] = v10;
  v13 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  v11 = (_QWORD *)swift_task_alloc();
  v6[9] = v11;
  *v11 = v6;
  v11[1] = sub_245E15308;
  return v13(v10);
}

uint64_t sub_245E15308()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245E15370()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(v0 + 56);
  v1 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 48);
  v6 = *(_QWORD *)(v0 + 24);
  v5 = *(_QWORD *)(v0 + 32);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v3, v1, v6);
  swift_storeEnumTagMultiPayload();
  sub_245E154B8(v3);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245E15420()
{
  uint64_t v0;
  void *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v1 = *(void **)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD **)(v0 + 48);
  v4 = *(_QWORD *)(v0 + 32);
  *v2 = v1;
  swift_storeEnumTagMultiPayload();
  v5 = v1;
  sub_245E154B8((uint64_t)v2);

  (*(void (**)(_QWORD *, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245E154B8(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  if (*(_QWORD *)(v1 + 112))
  {
    *(_QWORD *)(v1 + 112) = 0;
    MEMORY[0x24BDAC7A8](result);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25441B628);
    sub_245E3CDA8();
    v2 = sub_245E3CD78();
    MEMORY[0x24954A9D0](MEMORY[0x24BEE12C8], v2);
    sub_245E3CD00();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t RequestCoalescer.waitForActiveRequest()(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = v1;
  v2[4] = *v1;
  return swift_task_switch();
}

uint64_t sub_245E155B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = type metadata accessor for RequestCoalescer(255, *(_QWORD *)(*(_QWORD *)(v4 + 32) + 80), a3, a4);
  MEMORY[0x24954A9D0](&protocol conformance descriptor for RequestCoalescer<A>, v5);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 40) = v6;
  *v6 = v4;
  v6[1] = sub_245E15660;
  return sub_245E3D078();
}

uint64_t sub_245E15660()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 48) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_245E156CC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245E156D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25441B628);
  v4 = sub_245E3CDA8();
  MEMORY[0x24BDAC7A8]();
  if (*(_QWORD *)(a2 + 112))
  {
    v9 = *(_QWORD *)(a2 + 112);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v8 - v6, a1, v4);
    sub_245E3CD78();
    swift_bridgeObjectRetain();
    sub_245E3CD6C();
    *(_QWORD *)(a2 + 112) = v9;
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_245E15BB8();
    swift_allocError();
    return sub_245E3CD90();
  }
}

uint64_t sub_245E157F0(uint64_t a1)
{
  uint64_t v1;

  return sub_245E156D8(a1, v1);
}

uint64_t sub_245E157FC()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for RequestCoalescer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of RequestCoalescer.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t sub_245E15858()
{
  return swift_allocateGenericValueMetadata();
}

_QWORD *sub_245E15860(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_245E1588C()
{
  return swift_bridgeObjectRelease();
}

_QWORD *sub_245E15894(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

_QWORD *sub_245E158D8(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_245E15908(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t sub_245E15958(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

uint64_t sub_245E159AC(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_245E159C4(_QWORD *result, int a2)
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

uint64_t type metadata accessor for RequestCoalescer.State(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for RequestCoalescer.State);
}

uint64_t sub_245E159F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25441B628);
  v3 = sub_245E3CDA8();
  return sub_245E15A58(a2, v3);
}

uint64_t sub_245E15A58(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v18;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(v8 + 24);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_245E3D0FC();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v18 - v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))((char *)&v18 - v14, a1, v13);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v15, v9);
    return sub_245E3CD90();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v15, v3);
    return sub_245E3CD9C();
  }
}

unint64_t sub_245E15BB8()
{
  unint64_t result;

  result = qword_25441B6B8;
  if (!qword_25441B6B8)
  {
    result = MEMORY[0x24954A9D0](&protocol conformance descriptor for RequestCoalescerError, &type metadata for RequestCoalescerError);
    atomic_store(result, (unint64_t *)&qword_25441B6B8);
  }
  return result;
}

uint64_t sub_245E15BFC()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245E15C30(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_245E15CB0;
  return sub_245E1522C(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_245E15CB0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_245E15CF8(uint64_t a1)
{
  uint64_t v1;

  return sub_245E159F0(a1, *(_QWORD *)(v1 + 24));
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x24954A97C](a1, v6, a5);
}

uint64_t static WristMonitorError.== infix(_:_:)()
{
  return 1;
}

uint64_t WristMonitorError.hash(into:)()
{
  return sub_245E3D0D8();
}

uint64_t WristMonitorError.hashValue.getter()
{
  sub_245E3D0CC();
  sub_245E3D0D8();
  return sub_245E3D0E4();
}

uint64_t sub_245E15DAC()
{
  return 1;
}

uint64_t sub_245E15DB4()
{
  sub_245E3D0CC();
  sub_245E3D0D8();
  return sub_245E3D0E4();
}

uint64_t sub_245E15DF4()
{
  return sub_245E3D0D8();
}

uint64_t sub_245E15E18()
{
  sub_245E3D0CC();
  sub_245E3D0D8();
  return sub_245E3D0E4();
}

unint64_t sub_245E15E58()
{
  unint64_t result;

  result = qword_2575242D0;
  if (!qword_2575242D0)
  {
    result = MEMORY[0x24954A9D0](&protocol conformance descriptor for WristMonitorError, &type metadata for WristMonitorError);
    atomic_store(result, (unint64_t *)&qword_2575242D0);
  }
  return result;
}

unint64_t sub_245E15EB0()
{
  unint64_t result;

  result = qword_2575242D8;
  if (!qword_2575242D8)
  {
    result = MEMORY[0x24954A9D0](&protocol conformance descriptor for WristMonitorError, &type metadata for WristMonitorError);
    atomic_store(result, (unint64_t *)&qword_2575242D8);
  }
  return result;
}

uint64_t sub_245E15EF4(uint64_t a1, uint64_t a2)
{
  return sub_245E15F0C(a1, a2, MEMORY[0x24BE87A60]);
}

uint64_t sub_245E15F00(uint64_t a1, uint64_t a2)
{
  return sub_245E15F0C(a1, a2, MEMORY[0x24BE87A58]);
}

uint64_t sub_245E15F0C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, unint64_t, unint64_t))
{
  unint64_t v4;
  unint64_t v5;

  v4 = sub_245E16050();
  v5 = sub_245E132FC();
  return a3(a1, v4, v5);
}

uint64_t getEnumTagSinglePayload for WristMonitorError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for WristMonitorError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_245E15FEC + 4 * byte_245E3DD70[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_245E1600C + 4 * byte_245E3DD75[v4]))();
}

_BYTE *sub_245E15FEC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_245E1600C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_245E16014(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_245E1601C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_245E16024(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_245E1602C(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_245E16038()
{
  return 0;
}

ValueMetadata *type metadata accessor for WristMonitorError()
{
  return &type metadata for WristMonitorError;
}

unint64_t sub_245E16050()
{
  unint64_t result;

  result = qword_2575242E0;
  if (!qword_2575242E0)
  {
    result = MEMORY[0x24954A9D0](&protocol conformance descriptor for WristMonitorError, &type metadata for WristMonitorError);
    atomic_store(result, (unint64_t *)&qword_2575242E0);
  }
  return result;
}

id AchievementWeeklyStreak.earnedThisWeek.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id result;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void (*v16)(char *, uint64_t);
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;

  v0 = sub_245E3C3B8();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v2);
  v7 = (char *)&v21 - v6;
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v21 - v8;
  sub_245E3C3AC();
  v10 = (void *)objc_opt_self();
  result = objc_msgSend(v10, sel_hk_gregorianCalendar);
  if (result)
  {
    v12 = result;
    v13 = *MEMORY[0x24BDD45A0];
    v14 = (void *)sub_245E3C394();
    v15 = objc_msgSend(v12, sel_hk_startOfWeekWithFirstWeekday_beforeDate_addingWeeks_, v13, v14, 0);

    sub_245E3C3A0();
    v16 = *(void (**)(char *, uint64_t))(v1 + 8);
    v16(v7, v0);
    sub_245E3C634();
    result = objc_msgSend(v10, sel_hk_gregorianCalendar);
    if (result)
    {
      v17 = result;
      v18 = (void *)sub_245E3C394();
      v19 = (void *)sub_245E3C394();
      v20 = objc_msgSend(v17, sel_hk_isDate_withinNumberOfCalendarDays_ofDate_, v18, 0, v19);

      v16(v4, v0);
      v16(v9, v0);
      return v20;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t dispatch thunk of WristStateObserving.queryState()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

void WristStateChanged.state.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t static WristStateChanged.deliveryStyle.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *MEMORY[0x24BE87248];
  v3 = sub_245E3CA30();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

uint64_t storeEnumTagSinglePayload for WristStateChanged(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_245E16314 + 4 * byte_245E3DEC5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_245E16348 + 4 * byte_245E3DEC0[v4]))();
}

uint64_t sub_245E16348(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_245E16350(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x245E16358);
  return result;
}

uint64_t sub_245E16364(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x245E1636CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_245E16370(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245E16378(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WristStateChanged()
{
  return &type metadata for WristStateChanged;
}

id static AVContentKeySession.streamingKeySystem.getter()
{
  return (id)*MEMORY[0x24BDB1BB8];
}

BOOL static AccountType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t AccountType.hash(into:)()
{
  return sub_245E3D0D8();
}

uint64_t AccountType.hashValue.getter()
{
  sub_245E3D0CC();
  sub_245E3D0D8();
  return sub_245E3D0E4();
}

unint64_t sub_245E1642C()
{
  unint64_t result;

  result = qword_2575242E8;
  if (!qword_2575242E8)
  {
    result = MEMORY[0x24954A9D0](&protocol conformance descriptor for AccountType, &type metadata for AccountType);
    atomic_store(result, (unint64_t *)&qword_2575242E8);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for AccountType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_245E164BC + 4 * byte_245E3DF35[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_245E164F0 + 4 * asc_245E3DF30[v4]))();
}

uint64_t sub_245E164F0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_245E164F8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x245E16500);
  return result;
}

uint64_t sub_245E1650C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x245E16514);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_245E16518(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245E16520(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AccountType()
{
  return &type metadata for AccountType;
}

BOOL static AccountError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AccountError.hash(into:)()
{
  return sub_245E3D0D8();
}

uint64_t AccountError.hashValue.getter()
{
  sub_245E3D0CC();
  sub_245E3D0D8();
  return sub_245E3D0E4();
}

BOOL sub_245E165BC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_245E165D4()
{
  unint64_t result;

  result = qword_2575242F0;
  if (!qword_2575242F0)
  {
    result = MEMORY[0x24954A9D0](&protocol conformance descriptor for AccountError, &type metadata for AccountError);
    atomic_store(result, (unint64_t *)&qword_2575242F0);
  }
  return result;
}

unint64_t sub_245E1661C()
{
  unint64_t result;

  result = qword_2575242F8;
  if (!qword_2575242F8)
  {
    result = MEMORY[0x24954A9D0](&protocol conformance descriptor for AccountError, &type metadata for AccountError);
    atomic_store(result, (unint64_t *)&qword_2575242F8);
  }
  return result;
}

uint64_t sub_245E16660(uint64_t a1, uint64_t a2)
{
  return sub_245E16678(a1, a2, MEMORY[0x24BE87A60]);
}

uint64_t sub_245E1666C(uint64_t a1, uint64_t a2)
{
  return sub_245E16678(a1, a2, MEMORY[0x24BE87A58]);
}

uint64_t sub_245E16678(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, unint64_t, unint64_t))
{
  unint64_t v4;
  unint64_t v5;

  v4 = sub_245E16874();
  v5 = sub_245E166C8();
  return a3(a1, v4, v5);
}

unint64_t sub_245E166C8()
{
  unint64_t result;

  result = qword_257524300;
  if (!qword_257524300)
  {
    result = MEMORY[0x24954A9D0](&protocol conformance descriptor for AccountError, &type metadata for AccountError);
    atomic_store(result, (unint64_t *)&qword_257524300);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AccountError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AccountError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_245E167EC + 4 * byte_245E3DFD5[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_245E16820 + 4 * byte_245E3DFD0[v4]))();
}

uint64_t sub_245E16820(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_245E16828(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x245E16830);
  return result;
}

uint64_t sub_245E1683C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x245E16844);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_245E16848(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245E16850(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_245E1685C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AccountError()
{
  return &type metadata for AccountError;
}

unint64_t sub_245E16874()
{
  unint64_t result;

  result = qword_257524308;
  if (!qword_257524308)
  {
    result = MEMORY[0x24954A9D0](&protocol conformance descriptor for AccountError, &type metadata for AccountError);
    atomic_store(result, (unint64_t *)&qword_257524308);
  }
  return result;
}

uint64_t NotificationSettingsProvider.init(bag:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t NotificationSettingsProvider.fetchNotificationSettings(account:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v3;
  return swift_task_switch();
}

uint64_t sub_245E168DC()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;

  v2 = (void *)v0[3];
  v1 = v0[4];
  v3 = objc_allocWithZone(MEMORY[0x24BE08448]);
  v4 = v2;
  swift_unknownObjectRetain();
  v5 = (void *)sub_245E3CC40();
  v6 = (void *)sub_245E3CC40();
  v7 = objc_msgSend(v3, sel_initWithIdentifier_clientIdentifier_account_bag_, v5, v6, v4, v1);
  v0[5] = v7;
  swift_unknownObjectRelease();

  v8 = swift_task_alloc();
  v0[6] = v8;
  *(_QWORD *)(v8 + 16) = v7;
  *(_QWORD *)(v8 + 24) = v1;
  v9 = (_QWORD *)swift_task_alloc();
  v0[7] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257524318);
  *v9 = v0;
  v9[1] = sub_245E16A3C;
  return sub_245E3D078();
}

uint64_t sub_245E16A3C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245E16AA8()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_245E16ADC()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_245E16B18(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD aBlock[6];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257524360);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v9 = objc_msgSend(a2, sel_fetchAllSettings);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  v10 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v11 + v10, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  *(_QWORD *)(v11 + ((v8 + v10 + 7) & 0xFFFFFFFFFFFFFFF8)) = a3;
  aBlock[4] = sub_245E17984;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_245E16D9C;
  aBlock[3] = &block_descriptor_16;
  v12 = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  swift_release();
  objc_msgSend(v9, sel_addFinishBlock_, v12);
  _Block_release(v12);

}

void sub_245E16C88(uint64_t a1)
{
  uint64_t v1;

  sub_245E16B18(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

void sub_245E16C90(void *a1, id a2)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  _BYTE *v6;

  if (a2)
  {
    v2 = a2;
LABEL_3:
    __swift_instantiateConcreteTypeFromMangledName(&qword_257524360);
    sub_245E3CD90();
    return;
  }
  if (!a1)
  {
    sub_245E177FC();
    swift_allocError();
    *v6 = 1;
    goto LABEL_3;
  }
  v3 = a1;
  v4 = objc_msgSend(v3, sel_itemsMap);
  sub_245E177C0();
  v5 = sub_245E3CC10();

  sub_245E179E8(v5);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257524360);
  sub_245E3CD9C();

}

void sub_245E16D9C(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(void *, void *);
  id v6;
  id v7;

  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t NotificationSettingsProvider.updateNotificationSettings(settings:account:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3[2] = a1;
  v3[3] = a2;
  v4 = sub_245E3C694();
  v3[4] = v4;
  v3[5] = *(_QWORD *)(v4 - 8);
  v3[6] = swift_task_alloc();
  v3[7] = swift_task_alloc();
  v5 = sub_245E3C544();
  v3[8] = v5;
  v3[9] = *(_QWORD *)(v5 - 8);
  v6 = swift_task_alloc();
  v7 = *v2;
  v3[10] = v6;
  v3[11] = v7;
  return swift_task_switch();
}

uint64_t sub_245E16EAC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  void (*v11)(uint64_t, uint64_t);
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  _QWORD *v22;
  unsigned int v24;
  void (*v25)(uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v1 = v0[2];
  v2 = *(_QWORD *)(v1 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v4 = v0[9];
    v27 = v0[5];
    v29 = MEMORY[0x24BEE4AF8];
    sub_245E3CFA0();
    v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v25 = *(void (**)(uint64_t, uint64_t))(v4 + 16);
    v26 = *(_QWORD *)(v4 + 72);
    v24 = *MEMORY[0x24BE8C1B0];
    do
    {
      v6 = v0[10];
      v7 = v0[7];
      v28 = v0[8];
      v8 = v0[6];
      v9 = v0[4];
      v25(v6, v5);
      sub_245E3C52C();
      sub_245E3C538();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v27 + 104))(v8, v24, v9);
      v10 = sub_245E3C688();
      v11 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
      v11(v8, v9);
      v11(v7, v9);
      v12 = objc_allocWithZone(MEMORY[0x24BE08440]);
      v13 = (void *)sub_245E3CC40();
      swift_bridgeObjectRelease();
      objc_msgSend(v12, sel_initWithIdentifier_enabled_, v13, v10 & 1);

      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v6, v28);
      sub_245E3CF88();
      sub_245E3CFAC();
      sub_245E3CFB8();
      sub_245E3CF94();
      v5 += v26;
      --v2;
    }
    while (v2);
    v3 = v29;
  }
  v0[12] = v3;
  v14 = v0[11];
  v15 = (void *)v0[3];
  v16 = objc_allocWithZone(MEMORY[0x24BE08448]);
  v17 = v15;
  swift_unknownObjectRetain();
  v18 = (void *)sub_245E3CC40();
  v19 = (void *)sub_245E3CC40();
  v20 = objc_msgSend(v16, sel_initWithIdentifier_clientIdentifier_account_bag_, v18, v19, v17, v14);
  v0[13] = v20;
  swift_unknownObjectRelease();

  v21 = swift_task_alloc();
  v0[14] = v21;
  *(_QWORD *)(v21 + 16) = v20;
  *(_QWORD *)(v21 + 24) = v3;
  v22 = (_QWORD *)swift_task_alloc();
  v0[15] = v22;
  *v22 = v0;
  v22[1] = sub_245E1718C;
  return sub_245E3D078();
}

uint64_t sub_245E1718C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_245E17204()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245E17260()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_245E172D8(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  _BYTE *v12;
  _QWORD aBlock[6];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257524348);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  sub_245E177C0();
  v7 = (void *)sub_245E3CD18();
  v8 = objc_msgSend(a2, sel_updateSettings_, v7);

  if (v8)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
    v9 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    v10 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v10 + v9, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
    aBlock[4] = sub_245E178A4;
    aBlock[5] = v10;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_245E174F0;
    aBlock[3] = &block_descriptor;
    v11 = _Block_copy(aBlock);
    swift_release();
    objc_msgSend(v8, sel_addFinishBlock_, v11);
    _Block_release(v11);

  }
  else
  {
    sub_245E177FC();
    swift_allocError();
    *v12 = 0;
    sub_245E3CD90();
  }
}

void sub_245E17484(uint64_t a1)
{
  uint64_t v1;

  sub_245E172D8(a1, *(void **)(v1 + 16));
}

uint64_t sub_245E1748C(int a1, id a2)
{
  id v2;

  if (a2)
  {
    v2 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257524348);
    return sub_245E3CD90();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257524348);
    return sub_245E3CD9C();
  }
}

void sub_245E174F0(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t sub_245E17550(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_245E175B4;
  v5 = *v1;
  v4[3] = a1;
  v4[4] = v5;
  return swift_task_switch();
}

uint64_t sub_245E175B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t sub_245E17608(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_245E15CB0;
  return NotificationSettingsProvider.updateNotificationSettings(settings:account:)(a1, a2);
}

uint64_t dispatch thunk of NotificationSettingsProviding.fetchNotificationSettings(account:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 8) + *(_QWORD *)(a3 + 8));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_245E176DC;
  return v9(a1, a2, a3);
}

uint64_t sub_245E176DC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t dispatch thunk of NotificationSettingsProviding.updateNotificationSettings(settings:account:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 16) + *(_QWORD *)(a4 + 16));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_245E15CB0;
  return v11(a1, a2, a3, a4);
}

ValueMetadata *type metadata accessor for NotificationSettingsProvider()
{
  return &type metadata for NotificationSettingsProvider;
}

unint64_t sub_245E177C0()
{
  unint64_t result;

  result = qword_257524350;
  if (!qword_257524350)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257524350);
  }
  return result;
}

unint64_t sub_245E177FC()
{
  unint64_t result;

  result = qword_257524358;
  if (!qword_257524358)
  {
    result = MEMORY[0x24954A9D0](&unk_245E3E3F4, &type metadata for NotificationSettingError);
    atomic_store(result, (unint64_t *)&qword_257524358);
  }
  return result;
}

uint64_t sub_245E17840()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_257524348);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_245E178A4(int a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_257524348);
  return sub_245E1748C(a1, a2);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_245E1790C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_257524360);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

void sub_245E17984(void *a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_257524360);
  sub_245E16C90(a1, a2);
}

uint64_t sub_245E179E8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unsigned int v17;
  unsigned int v18;
  char *v19;
  unint64_t i;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int64_t v39;
  uint64_t v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int64_t v57;
  uint64_t v58;

  v2 = sub_245E3C874();
  v53 = *(_QWORD *)(v2 - 8);
  v54 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v52 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_245E3C694();
  v50 = *(_QWORD *)(v4 - 8);
  v51 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v49 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_245E3C544();
  v47 = *(_QWORD *)(v6 - 8);
  v48 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v46 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257524368);
  result = sub_245E3CFDC();
  v9 = result;
  v10 = 0;
  v55 = a1;
  v13 = *(_QWORD *)(a1 + 64);
  v12 = a1 + 64;
  v11 = v13;
  v14 = 1 << *(_BYTE *)(v12 - 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & v11;
  v38 = v12;
  v39 = (unint64_t)(v14 + 63) >> 6;
  v17 = *MEMORY[0x24BE8C1B8];
  v43 = *MEMORY[0x24BE8C1B0];
  v44 = v17;
  v18 = *MEMORY[0x24BE8D1E8];
  v41 = *MEMORY[0x24BE8D1E0];
  v42 = v18;
  v40 = result + 64;
  v45 = result;
  v19 = v46;
  if (!v16)
    goto LABEL_5;
LABEL_4:
  v56 = (v16 - 1) & v16;
  v57 = v10;
  for (i = __clz(__rbit64(v16)) | (v10 << 6); ; i = __clz(__rbit64(v22)) + (v23 << 6))
  {
    v25 = *(_QWORD *)(v55 + 56);
    v26 = (uint64_t *)(*(_QWORD *)(v55 + 48) + 16 * i);
    v27 = v26[1];
    v58 = *v26;
    v28 = *(void **)(v25 + 8 * i);
    swift_bridgeObjectRetain();
    v29 = v28;
    v30 = objc_msgSend(v29, sel_identifier);
    sub_245E3CC64();

    if (objc_msgSend(v29, sel_isEnabled))
      v31 = v43;
    else
      v31 = v44;
    (*(void (**)(char *, uint64_t, uint64_t))(v50 + 104))(v49, v31, v51);
    if (objc_msgSend(v29, sel_userChanged))
      v32 = v41;
    else
      v32 = v42;
    (*(void (**)(char *, uint64_t, uint64_t))(v53 + 104))(v52, v32, v54);
    sub_245E3C520();

    *(_QWORD *)(v40 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    v9 = v45;
    v33 = (_QWORD *)(*(_QWORD *)(v45 + 48) + 16 * i);
    *v33 = v58;
    v33[1] = v27;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v47 + 32))(*(_QWORD *)(v9 + 56) + *(_QWORD *)(v47 + 72) * i, v19, v48);
    v34 = *(_QWORD *)(v9 + 16);
    v35 = __OFADD__(v34, 1);
    v36 = v34 + 1;
    if (v35)
    {
      __break(1u);
LABEL_30:
      __break(1u);
      goto LABEL_31;
    }
    *(_QWORD *)(v9 + 16) = v36;
    v16 = v56;
    v10 = v57;
    if (v56)
      goto LABEL_4;
LABEL_5:
    v21 = v10 + 1;
    if (__OFADD__(v10, 1))
      goto LABEL_30;
    if (v21 >= v39)
      return v9;
    v22 = *(_QWORD *)(v38 + 8 * v21);
    v23 = v10 + 1;
    if (!v22)
    {
      v23 = v10 + 2;
      if (v10 + 2 >= v39)
        return v9;
      v22 = *(_QWORD *)(v38 + 8 * v23);
      if (!v22)
      {
        v23 = v10 + 3;
        if (v10 + 3 >= v39)
          return v9;
        v22 = *(_QWORD *)(v38 + 8 * v23);
        if (!v22)
          break;
      }
    }
LABEL_18:
    v56 = (v22 - 1) & v22;
    v57 = v23;
  }
  v24 = v10 + 4;
  if (v10 + 4 >= v39)
    return v9;
  v22 = *(_QWORD *)(v38 + 8 * v24);
  if (v22)
  {
    v23 = v10 + 4;
    goto LABEL_18;
  }
  while (1)
  {
    v23 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v23 >= v39)
      return v9;
    v22 = *(_QWORD *)(v38 + 8 * v23);
    ++v24;
    if (v22)
      goto LABEL_18;
  }
LABEL_31:
  __break(1u);
  return result;
}

unint64_t static NotificationSettingConstants.clientIdentifier.getter()
{
  return 0xD000000000000011;
}

unint64_t static NotificationSettingConstants.settingIdentifier.getter()
{
  return 0xD000000000000011;
}

unint64_t static NotificationSettingConstants.settingsMigratedKey.getter()
{
  return 0xD00000000000001CLL;
}

ValueMetadata *type metadata accessor for NotificationSettingConstants()
{
  return &type metadata for NotificationSettingConstants;
}

void Date.startOfWeek()()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = objc_msgSend((id)objc_opt_self(), sel_hk_gregorianCalendar);
  if (v0)
  {
    v1 = v0;
    v2 = *MEMORY[0x24BDD45A0];
    v3 = (void *)sub_245E3C394();
    v4 = objc_msgSend(v1, sel_hk_startOfWeekWithFirstWeekday_beforeDate_addingWeeks_, v2, v3, 0);

    sub_245E3C3A0();
  }
  else
  {
    __break(1u);
  }
}

id Date.isSameDay(as:)()
{
  id result;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  result = objc_msgSend((id)objc_opt_self(), sel_hk_gregorianCalendar);
  if (result)
  {
    v1 = result;
    v2 = (void *)sub_245E3C394();
    v3 = (void *)sub_245E3C394();
    v4 = objc_msgSend(v1, sel_hk_isDate_withinNumberOfCalendarDays_ofDate_, v2, 0, v3);

    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id Date.isSameWeek(as:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  void *v6;
  id result;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void (*v19)(char *, uint64_t);
  uint64_t v20;
  uint64_t v21;

  v0 = sub_245E3C3B8();
  v21 = *(_QWORD *)(v0 - 8);
  v1 = MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v20 - v4;
  v6 = (void *)objc_opt_self();
  result = objc_msgSend(v6, sel_hk_gregorianCalendar);
  if (!result)
  {
    __break(1u);
    goto LABEL_6;
  }
  v8 = result;
  v9 = *MEMORY[0x24BDD45A0];
  v10 = (void *)sub_245E3C394();
  v11 = objc_msgSend(v8, sel_hk_startOfWeekWithFirstWeekday_beforeDate_addingWeeks_, v9, v10, 0);

  sub_245E3C3A0();
  result = objc_msgSend(v6, sel_hk_gregorianCalendar);
  if (!result)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v12 = result;
  v13 = (void *)sub_245E3C394();
  v14 = objc_msgSend(v12, sel_hk_startOfWeekWithFirstWeekday_beforeDate_addingWeeks_, v9, v13, 0);

  sub_245E3C3A0();
  result = objc_msgSend(v6, sel_hk_gregorianCalendar);
  if (result)
  {
    v15 = result;
    v16 = (void *)sub_245E3C394();
    v17 = (void *)sub_245E3C394();
    v18 = objc_msgSend(v15, sel_hk_isDate_withinNumberOfCalendarDays_ofDate_, v16, 0, v17);

    v19 = *(void (**)(char *, uint64_t))(v21 + 8);
    v19(v3, v0);
    v19(v5, v0);
    return v18;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t AchievementProgressEvaluator.init(progressEnvironment:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t AchievementProgressEvaluator.makeProgressUpdates(forTemplates:)(unint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t i;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;

  v3 = sub_245E3CBC8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  if (!os_transaction_create())
  {
    sub_245E3CAF0();
    v15 = sub_245E3CBBC();
    v16 = sub_245E3CE08();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_245E10000, v15, v16, "Failed to obtain OS transaction", v17, 2u);
      MEMORY[0x24954AA78](v17, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return MEMORY[0x24BEE4AF8];
  }
  v19 = MEMORY[0x24BEE4AF8];
  if (!(a1 >> 62))
  {
    v8 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_unknownObjectRetain();
    result = swift_bridgeObjectRetain();
    if (v8)
      goto LABEL_4;
LABEL_19:
    swift_bridgeObjectRelease();
    v14 = MEMORY[0x24BEE4AF8];
LABEL_20:
    swift_unknownObjectRelease_n();
    return v14;
  }
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  result = sub_245E3CFD0();
  v8 = result;
  if (!result)
    goto LABEL_19;
LABEL_4:
  if (v8 >= 1)
  {
    for (i = 0; i != v8; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v11 = (id)MEMORY[0x24954A43C](i, a1);
      else
        v11 = *(id *)(a1 + 8 * i + 32);
      v12 = v11;
      v18 = v7;
      v13 = sub_245E183CC(v11);

      if (v13)
      {
        MEMORY[0x24954A1D8]();
        if (*(_QWORD *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_245E3CD54();
        sub_245E3CD60();
        sub_245E3CD3C();
      }
    }
    swift_bridgeObjectRelease();
    v14 = v19;
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

id sub_245E183CC(void *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  void *v35;
  id v36;
  id v37;
  id result;
  void *v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  __int128 v52;
  __int128 v53;
  _OWORD v54[2];
  _QWORD v55[4];

  v3 = sub_245E3CBC8();
  v50 = *(_QWORD *)(v3 - 8);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v48 - v7;
  v9 = *v1;
  v10 = objc_msgSend(a1, sel_progressExpression);
  if (!v10)
  {
LABEL_9:
    sub_245E3CAF0();
    v19 = a1;
    v20 = sub_245E3CBBC();
    v21 = sub_245E3CE08();
    if (os_log_type_enabled(v20, v21))
    {
      v49 = v3;
      v22 = (uint8_t *)swift_slowAlloc();
      v23 = swift_slowAlloc();
      *(_QWORD *)&v54[0] = v23;
      *(_DWORD *)v22 = 136315138;
      v24 = objc_msgSend(v19, sel_uniqueName);
      if (v24)
      {
        v25 = v24;
        v26 = sub_245E3CC64();
        v28 = v27;

      }
      else
      {
        v26 = 0;
        v28 = 0;
      }
      v55[0] = v26;
      v55[1] = v28;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25441B618);
      v29 = sub_245E3CE5C();
      v31 = v30;
      swift_bridgeObjectRelease();
      v55[0] = sub_245E19CDC(v29, v31, (uint64_t *)v54);
      sub_245E3CE80();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_245E10000, v20, v21, "Progress: %s no progressExpression/goalExpression/canonicalUnit", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24954AA78](v23, -1, -1);
      MEMORY[0x24954AA78](v22, -1, -1);

      (*(void (**)(char *, uint64_t))(v50 + 8))(v6, v49);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v50 + 8))(v6, v3);
    }
    return 0;
  }
  v11 = v10;
  sub_245E3CC64();

  v12 = objc_msgSend(a1, sel_goalExpression);
  if (!v12)
  {
LABEL_8:
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  v13 = v12;
  v49 = v3;
  sub_245E3CC64();

  v14 = objc_msgSend(a1, sel_canonicalUnit);
  if (!v14)
  {
    swift_bridgeObjectRelease();
    v3 = v49;
    goto LABEL_8;
  }
  v15 = v14;
  sub_245E189F8();
  v16 = (void *)sub_245E3CDFC();
  swift_bridgeObjectRelease();
  v17 = (void *)sub_245E3CDFC();
  v18 = v16;
  swift_bridgeObjectRelease();
  if (objc_msgSend(v16, sel_expressionValueWithObject_context_, v9, 0))
  {
    sub_245E3CEC8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v54, 0, sizeof(v54));
  }
  v32 = v49;
  sub_245E18A34((uint64_t)v54, (uint64_t)v55);
  if (objc_msgSend(v17, sel_expressionValueWithObject_context_, v9, 0))
  {
    sub_245E3CEC8();
    swift_unknownObjectRelease();
  }
  else
  {
    v52 = 0u;
    v53 = 0u;
  }
  sub_245E18A34((uint64_t)&v52, (uint64_t)v54);
  sub_245E18A7C((uint64_t)v55, (uint64_t)&v52);
  if (!*((_QWORD *)&v53 + 1))
    goto LABEL_25;
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_26:
    sub_245E3CAF0();
    v45 = sub_245E3CBBC();
    v46 = sub_245E3CE08();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v47 = 0;
      _os_log_impl(&dword_245E10000, v45, v46, "No progressValue or goalValue, returning nil", v47, 2u);
      MEMORY[0x24954AA78](v47, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v50 + 8))(v8, v32);
    sub_245E18AC4((uint64_t)v54);
    sub_245E18AC4((uint64_t)v55);
    return 0;
  }
  v33 = v51;
  sub_245E18A7C((uint64_t)v54, (uint64_t)&v52);
  if (!*((_QWORD *)&v53 + 1))
  {
LABEL_25:
    sub_245E18AC4((uint64_t)&v52);
    goto LABEL_26;
  }
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_26;
  v34 = v51;
  v35 = (void *)objc_opt_self();
  v36 = objc_msgSend(v35, sel_quantityWithUnit_doubleValue_, v15, v33);
  v37 = objc_msgSend(v35, sel_quantityWithUnit_doubleValue_, v15, v34);
  result = objc_msgSend(a1, sel_uniqueName);
  if (result)
  {
    v39 = result;
    sub_245E3CC64();

    v40 = objc_allocWithZone(MEMORY[0x24BE017B8]);
    v41 = v36;
    v42 = v37;
    v43 = (void *)sub_245E3CC40();
    swift_bridgeObjectRelease();
    v44 = objc_msgSend(v40, sel_initWithTemplateUniqueName_progressQuantity_goalQuantity_, v43, v41, v42);

    sub_245E18AC4((uint64_t)v54);
    sub_245E18AC4((uint64_t)v55);
    return v44;
  }
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for AchievementProgressEvaluator()
{
  return &type metadata for AchievementProgressEvaluator;
}

unint64_t sub_245E189F8()
{
  unint64_t result;

  result = qword_25441B5F8;
  if (!qword_25441B5F8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25441B5F8);
  }
  return result;
}

uint64_t sub_245E18A34(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_25441B630);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_245E18A7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_25441B630);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_245E18AC4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_25441B630);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void ArchivedSession.startOfWeek()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;

  v0 = sub_245E3C3B8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = objc_msgSend((id)objc_opt_self(), sel_hk_gregorianCalendar);
  if (v4)
  {
    v5 = v4;
    v6 = *MEMORY[0x24BDD45A0];
    sub_245E3C4A8();
    v7 = (void *)sub_245E3C394();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    v8 = objc_msgSend(v5, sel_hk_startOfWeekWithFirstWeekday_beforeDate_addingWeeks_, v6, v7, 0);

    sub_245E3C3A0();
  }
  else
  {
    __break(1u);
  }
}

uint64_t ACHAchievementProgressUpdate.modalityIdentifier(from:)(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[4];
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257524370);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v25 - v7;
  v9 = objc_msgSend(v1, sel_templateUniqueName);
  v10 = sub_245E3CC64();
  v12 = v11;

  v28 = v10;
  v29 = v12;
  v26 = 45;
  v27 = 0xE100000000000000;
  sub_245E18EC8();
  v13 = (_QWORD *)sub_245E3CE98();
  swift_bridgeObjectRelease();
  v14 = v13[2];
  if (v14
    && (v13[4] == 0xD000000000000027 && v13[5] == 0x8000000245E3ED20 || (sub_245E3D06C() & 1) != 0)
    && v14 >= 2)
  {
    v16 = v13[6];
    v15 = v13[7];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v28 = v16;
    v29 = v15;
    sub_245E3CAB4();
    v26 = sub_245E3CA3C();
    v27 = v17;
    v25[2] = 0;
    v25[3] = 0xE000000000000000;
    v18 = sub_245E3CEA4();
    v20 = v19;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_245E19030(a1, v18, v20, v8);
    sub_245E193E8((uint64_t)v8, (uint64_t)v6);
    v21 = sub_245E3C67C();
    v22 = *(_QWORD *)(v21 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v6, 1, v21) != 1)
    {
      v23 = sub_245E3C664();
      sub_245E1A720((uint64_t)v8, &qword_257524370);
      (*(void (**)(char *, uint64_t))(v22 + 8))(v6, v21);
      swift_bridgeObjectRelease();
      return v23;
    }
    sub_245E1A720((uint64_t)v8, &qword_257524370);
    sub_245E1A720((uint64_t)v6, &qword_257524370);
  }
  swift_bridgeObjectRelease();
  return 0;
}

unint64_t sub_245E18EC8()
{
  unint64_t result;

  result = qword_257524378;
  if (!qword_257524378)
  {
    result = MEMORY[0x24954A9D0](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_257524378);
  }
  return result;
}

uint64_t ACHAchievementProgressUpdate.isRequired.getter()
{
  void *v0;
  id v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  v1 = objc_msgSend(v0, sel_templateUniqueName);
  sub_245E3CC64();

  sub_245E18EC8();
  v2 = (_QWORD *)sub_245E3CE98();
  swift_bridgeObjectRelease();
  if (v2[2])
  {
    v4 = v2[4];
    v3 = v2[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if (v4 == 0xD00000000000001CLL && v3 == 0x8000000245E3ED50)
    {
      swift_bridgeObjectRelease();
      v5 = 1;
    }
    else
    {
      v5 = sub_245E3D06C();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    v5 = 0;
  }
  return v5 & 1;
}

uint64_t sub_245E19030@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t result;
  int64_t v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  char *v26;
  void (*v27)(char *, char *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  int64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;

  v36 = a3;
  v39 = a2;
  v35 = a4;
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_257524390);
  MEMORY[0x24BDAC7A8](v44);
  v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_245E3C514();
  v41 = *(_QWORD *)(v7 - 8);
  v42 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v40 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_245E3C67C();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v43 = (char *)&v34 - v14;
  v15 = *(_QWORD *)(a1 + 56);
  v37 = a1 + 56;
  v16 = 1 << *(_BYTE *)(a1 + 32);
  v17 = -1;
  if (v16 < 64)
    v17 = ~(-1 << v16);
  v18 = v17 & v15;
  v38 = (unint64_t)(v16 + 63) >> 6;
  v45 = a1;
  result = swift_bridgeObjectRetain();
  v20 = 0;
  while (1)
  {
    if (v18)
    {
      v21 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      v22 = v21 | (v20 << 6);
      goto LABEL_23;
    }
    v23 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
      __break(1u);
      goto LABEL_33;
    }
    if (v23 >= v38)
      goto LABEL_28;
    v24 = *(_QWORD *)(v37 + 8 * v23);
    ++v20;
    if (!v24)
    {
      v20 = v23 + 1;
      if (v23 + 1 >= v38)
        goto LABEL_28;
      v24 = *(_QWORD *)(v37 + 8 * v20);
      if (!v24)
      {
        v20 = v23 + 2;
        if (v23 + 2 >= v38)
          goto LABEL_28;
        v24 = *(_QWORD *)(v37 + 8 * v20);
        if (!v24)
        {
          v20 = v23 + 3;
          if (v23 + 3 >= v38)
            goto LABEL_28;
          v24 = *(_QWORD *)(v37 + 8 * v20);
          if (!v24)
          {
            v25 = v23 + 4;
            if (v25 >= v38)
            {
LABEL_28:
              swift_release();
              v32 = 1;
              v33 = v35;
              goto LABEL_31;
            }
            v24 = *(_QWORD *)(v37 + 8 * v25);
            v20 = v25;
            if (!v24)
              break;
          }
        }
      }
    }
LABEL_22:
    v18 = (v24 - 1) & v24;
    v22 = __clz(__rbit64(v24)) + (v20 << 6);
LABEL_23:
    v26 = v43;
    (*(void (**)(char *, unint64_t, uint64_t))(v10 + 16))(v43, *(_QWORD *)(v45 + 48) + *(_QWORD *)(v10 + 72) * v22, v9);
    v27 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v27(v13, v26, v9);
    sub_245E3C670();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v28 = (*(uint64_t (**)(char *, char *, uint64_t))(v41 + 32))(v40, v6, v42);
      v29 = MEMORY[0x2495499D4](v28);
      if (v29 == v39 && v30 == v36)
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v41 + 8))(v40, v42);
LABEL_30:
        swift_release();
        v33 = v35;
        v27(v35, v13, v9);
        v32 = 0;
LABEL_31:
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v33, v32, 1, v9);
        return swift_bridgeObjectRelease();
      }
      v31 = sub_245E3D06C();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v41 + 8))(v40, v42);
      if ((v31 & 1) != 0)
        goto LABEL_30;
    }
    else
    {
      sub_245E1A720((uint64_t)v6, &qword_257524390);
    }
    result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  }
  while (1)
  {
    v20 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v20 >= v38)
      goto LABEL_28;
    v24 = *(_QWORD *)(v37 + 8 * v20);
    ++v25;
    if (v24)
      goto LABEL_22;
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_245E193E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257524370);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t ACHAchievementProgressUpdate.isNextEarnable(for:)(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  NSObject *v38;
  os_log_type_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  id v49;
  void *v50;
  uint64_t v51;
  os_log_t v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(char *, uint64_t);
  char *v56;
  id v57;
  NSObject *v58;
  os_log_type_t v59;
  uint64_t v60;
  uint64_t v61;
  uint8_t *v62;
  id v63;
  id v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  id v68;
  uint64_t v70;
  id v71;
  uint64_t v72;
  os_log_t v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78[2];

  v3 = sub_245E3CBC8();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v70 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v70 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v70 - v12;
  v14 = v1;
  sub_245E1A2B8(a1, v14);
  v16 = v15;

  if (!v16)
  {
    sub_245E3CAF0();
    v18 = v14;
    v19 = sub_245E3CBBC();
    v20 = sub_245E3CE14();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      v22 = swift_slowAlloc();
      v78[0] = v22;
      v75 = v3;
      *(_DWORD *)v21 = 136315138;
      v74 = v21 + 4;
      v23 = objc_msgSend(v18, sel_templateUniqueName);
      v24 = sub_245E3CC64();
      v76 = v4;
      v25 = v24;
      v27 = v26;

      v77 = sub_245E19CDC(v25, v27, v78);
      sub_245E3CE80();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_245E10000, v19, v20, "No matching template for %s, marking progress update as not earnable", v21, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24954AA78](v22, -1, -1);
      MEMORY[0x24954AA78](v21, -1, -1);

      (*(void (**)(char *, uint64_t))(v76 + 8))(v7, v75);
      return 0;
    }

    v55 = *(void (**)(char *, uint64_t))(v4 + 8);
    v56 = v7;
LABEL_15:
    v55(v56, v3);
    return 0;
  }
  v17 = v16;
  v28 = sub_245E1C24C();
  v29 = objc_msgSend(v14, sel_progressQuantity);
  if (!v29
    || (v30 = v29,
        sub_245E1BABC(),
        v32 = v31,
        v30,
        (v33 = objc_msgSend(v14, sel_goalQuantity)) == 0))
  {
    sub_245E3CAF0();
    v57 = v14;
    v58 = sub_245E3CBBC();
    v59 = sub_245E3CE14();
    if (os_log_type_enabled(v58, v59))
    {
      v74 = v17;
      v75 = v3;
      v60 = swift_slowAlloc();
      v61 = swift_slowAlloc();
      v78[0] = v61;
      *(_DWORD *)v60 = 136315138;
      v73 = (os_log_t)(v60 + 4);
      v62 = (uint8_t *)v60;
      v63 = objc_msgSend(v57, sel_templateUniqueName);
      v76 = v4;
      v64 = v63;
      v65 = sub_245E3CC64();
      v67 = v66;

      v77 = sub_245E19CDC(v65, v67, v78);
      sub_245E3CE80();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_245E10000, v58, v59, "Required values not found for earnable evaluation of %s", v62, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24954AA78](v61, -1, -1);
      MEMORY[0x24954AA78](v62, -1, -1);

      v68 = v74;
      (*(void (**)(char *, uint64_t))(v76 + 8))(v11, v75);
      return 0;
    }

    v55 = *(void (**)(char *, uint64_t))(v4 + 8);
    v56 = v11;
    goto LABEL_15;
  }
  v34 = v33;
  sub_245E1BABC();
  v36 = v35;

  if (v32 < v28 || v32 >= v36)
  {

    return 0;
  }
  sub_245E3CAF0();
  v37 = v14;
  v38 = sub_245E3CBBC();
  v39 = sub_245E3CE14();
  v40 = v39;
  if (os_log_type_enabled(v38, v39))
  {
    v41 = swift_slowAlloc();
    LODWORD(v74) = v40;
    v42 = v41;
    v75 = swift_slowAlloc();
    v78[0] = v75;
    *(_DWORD *)v42 = 136315906;
    v72 = v42 + 4;
    v43 = objc_msgSend(v37, sel_templateUniqueName);
    v71 = v37;
    v44 = v43;
    v45 = sub_245E3CC64();
    v73 = v38;
    v46 = v45;
    v76 = v4;
    v48 = v47;

    v77 = sub_245E19CDC(v46, v48, v78);
    sub_245E3CE80();
    v49 = v71;

    swift_bridgeObjectRelease();
    v50 = v17;
    v51 = v3;
    *(_WORD *)(v42 + 12) = 2048;
    v77 = v28;
    sub_245E3CE80();
    *(_WORD *)(v42 + 22) = 2048;
    v77 = v32;
    sub_245E3CE80();
    *(_WORD *)(v42 + 32) = 2048;
    v77 = v36;
    sub_245E3CE80();
    v52 = v73;
    _os_log_impl(&dword_245E10000, v73, (os_log_type_t)v74, "Found next earnable progress update (%s) with prerequisiteGoalValue: %ld progressValue: %ld goalValue: %ld", (uint8_t *)v42, 0x2Au);
    v53 = 1;
    v54 = v75;
    swift_arrayDestroy();
    MEMORY[0x24954AA78](v54, -1, -1);
    MEMORY[0x24954AA78](v42, -1, -1);

    (*(void (**)(char *, uint64_t))(v76 + 8))(v13, v51);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v13, v3);
    return 1;
  }
  return v53;
}

uint64_t sub_245E19CDC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_245E19DAC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_245E1A654((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_245E1A654((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_245E19DAC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_245E3CE8C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_245E19F64(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_245E3CF7C();
  if (!v8)
  {
    sub_245E3CFC4();
    __break(1u);
LABEL_17:
    result = sub_245E3D000();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_245E19F64(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_245E19FF8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_245E1A16C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_245E1A16C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_245E19FF8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_245E2C660(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_245E3CF58();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_245E3CFC4();
      __break(1u);
LABEL_10:
      v2 = sub_245E3CCA0();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_245E3D000();
    __break(1u);
LABEL_14:
    result = sub_245E3CFC4();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

uint64_t sub_245E1A16C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25441B620);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
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
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_245E3D000();
  __break(1u);
  return result;
}

void sub_245E1A2B8(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  void *v36;

  v2 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_245E3CEEC();
    sub_245E1A694();
    sub_245E1A6D0();
    sub_245E3CDF0();
    v2 = v31;
    v28 = v32;
    v3 = v33;
    v4 = v34;
    v5 = v35;
  }
  else
  {
    v6 = -1 << *(_BYTE *)(a1 + 32);
    v28 = a1 + 56;
    v7 = ~v6;
    v8 = -v6;
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v5 = v9 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v3 = v7;
    v4 = 0;
  }
  v27 = (unint64_t)(v3 + 64) >> 6;
  v29 = v2;
  while (v2 < 0)
  {
    if (!sub_245E3CF28())
      goto LABEL_42;
    sub_245E1A694();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v13 = v36;
    swift_unknownObjectRelease();
    v12 = v4;
    v10 = v5;
    if (!v36)
      goto LABEL_42;
LABEL_33:
    v17 = objc_msgSend(v13, sel_uniqueName);
    if (v17)
    {
      v18 = v17;
      v19 = sub_245E3CC64();
      v21 = v20;

    }
    else
    {
      v19 = 0;
      v21 = 0;
    }
    v22 = objc_msgSend(a2, sel_templateUniqueName);
    v23 = sub_245E3CC64();
    v25 = v24;

    if (v21)
    {
      if (v19 == v23 && v21 == v25)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_42:
        sub_245E1A718();
        return;
      }
      v26 = sub_245E3D06C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v26 & 1) != 0)
        goto LABEL_42;

    }
    else
    {

      swift_bridgeObjectRelease();
    }
    v4 = v12;
    v5 = v10;
    v2 = v29;
  }
  if (v5)
  {
    v10 = (v5 - 1) & v5;
    v11 = __clz(__rbit64(v5)) | (v4 << 6);
    v12 = v4;
LABEL_32:
    v13 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * v11);
    if (!v13)
      goto LABEL_42;
    goto LABEL_33;
  }
  v14 = v4 + 1;
  if (!__OFADD__(v4, 1))
  {
    if (v14 >= v27)
      goto LABEL_42;
    v15 = *(_QWORD *)(v28 + 8 * v14);
    v12 = v4 + 1;
    if (!v15)
    {
      v12 = v4 + 2;
      if (v4 + 2 >= v27)
        goto LABEL_42;
      v15 = *(_QWORD *)(v28 + 8 * v12);
      if (!v15)
      {
        v12 = v4 + 3;
        if (v4 + 3 >= v27)
          goto LABEL_42;
        v15 = *(_QWORD *)(v28 + 8 * v12);
        if (!v15)
        {
          v12 = v4 + 4;
          if (v4 + 4 >= v27)
            goto LABEL_42;
          v15 = *(_QWORD *)(v28 + 8 * v12);
          if (!v15)
          {
            v12 = v4 + 5;
            if (v4 + 5 >= v27)
              goto LABEL_42;
            v15 = *(_QWORD *)(v28 + 8 * v12);
            if (!v15)
            {
              v16 = v4 + 6;
              while (v27 != v16)
              {
                v15 = *(_QWORD *)(v28 + 8 * v16++);
                if (v15)
                {
                  v12 = v16 - 1;
                  goto LABEL_31;
                }
              }
              goto LABEL_42;
            }
          }
        }
      }
    }
LABEL_31:
    v10 = (v15 - 1) & v15;
    v11 = __clz(__rbit64(v15)) + (v12 << 6);
    goto LABEL_32;
  }
  __break(1u);
}

uint64_t sub_245E1A654(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_245E1A694()
{
  unint64_t result;

  result = qword_257524380;
  if (!qword_257524380)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257524380);
  }
  return result;
}

unint64_t sub_245E1A6D0()
{
  unint64_t result;
  unint64_t v1;

  result = qword_257524388;
  if (!qword_257524388)
  {
    v1 = sub_245E1A694();
    result = MEMORY[0x24954A9D0](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_257524388);
  }
  return result;
}

uint64_t sub_245E1A718()
{
  return swift_release();
}

uint64_t sub_245E1A720(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t Set<>.removingUnrelatedTemplates(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char v18;
  unint64_t v19;
  BOOL v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  char v38;
  unint64_t v39;
  BOOL v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  id v44;

  v2 = MEMORY[0x24BEE4B08];
  if ((a2 & 0xC000000000000001) != 0)
  {
    v43 = MEMORY[0x24BEE4B08];
    swift_bridgeObjectRetain();
    sub_245E3CEEC();
    if (sub_245E3CF28())
    {
      sub_245E1A694();
      while (1)
      {
        swift_dynamicCast();
        sub_245E3CAB4();
        v3 = (_QWORD *)sub_245E3CA9C();
        result = (uint64_t)objc_msgSend(v42, sel_uniqueName);
        if (!result)
        {
LABEL_71:
          __break(1u);
          goto LABEL_72;
        }
        v5 = (void *)result;
        v6 = sub_245E3CC64();
        v8 = v7;

        v9 = v3[2];
        if (v9)
        {
          v10 = v3[4] == v6 && v3[5] == v8;
          if (v10 || (sub_245E3D06C() & 1) != 0)
          {
LABEL_4:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();

            goto LABEL_5;
          }
          if (v9 != 1)
          {
            if (v3[6] == v6 && v3[7] == v8)
              goto LABEL_4;
            result = sub_245E3D06C();
            if ((result & 1) != 0)
              goto LABEL_4;
            if (v9 != 2)
            {
              v22 = v3 + 9;
              v23 = 2;
              do
              {
                v24 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_70;
                if (*(v22 - 1) == v6 && *v22 == v8)
                  goto LABEL_4;
                result = sub_245E3D06C();
                if ((result & 1) != 0)
                  goto LABEL_4;
                v22 += 2;
                ++v23;
              }
              while (v24 != v9);
            }
          }
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v11 = v43;
        v12 = *(_QWORD *)(v43 + 16);
        if (*(_QWORD *)(v43 + 24) <= v12)
        {
          sub_245E1B16C(v12 + 1, &qword_2575243A0);
          v11 = v43;
        }
        result = sub_245E3CE44();
        v13 = v11 + 56;
        v14 = -1 << *(_BYTE *)(v11 + 32);
        v15 = result & ~v14;
        v16 = v15 >> 6;
        if (((-1 << v15) & ~*(_QWORD *)(v11 + 56 + 8 * (v15 >> 6))) == 0)
        {
          v18 = 0;
          v19 = (unint64_t)(63 - v14) >> 6;
          while (++v16 != v19 || (v18 & 1) == 0)
          {
            v20 = v16 == v19;
            if (v16 == v19)
              v16 = 0;
            v18 |= v20;
            v21 = *(_QWORD *)(v13 + 8 * v16);
            if (v21 != -1)
            {
              v17 = __clz(__rbit64(~v21)) + (v16 << 6);
              goto LABEL_26;
            }
          }
          __break(1u);
LABEL_69:
          __break(1u);
LABEL_70:
          __break(1u);
          goto LABEL_71;
        }
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 56 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
LABEL_26:
        *(_QWORD *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
        *(_QWORD *)(*(_QWORD *)(v11 + 48) + 8 * v17) = v42;
        ++*(_QWORD *)(v11 + 16);
LABEL_5:
        if (!sub_245E3CF28())
        {
          v27 = v43;
          v2 = MEMORY[0x24BEE4B08];
          goto LABEL_43;
        }
      }
    }
    v27 = v2;
LABEL_43:
    swift_release();
  }
  else
  {
    v26 = swift_bridgeObjectRetain();
    v27 = sub_245E1B404(v26, (uint64_t (*)(char *, unint64_t, uint64_t))sub_245E1B7CC);
  }
  v28 = sub_245E3C9F4();
  if (v28 != sub_245E3C9F4())
  {
    v29 = sub_245E3C9F4();
    if (v29 != sub_245E3C9F4())
      return v27;
  }
  if ((v27 & 0xC000000000000001) == 0)
    return sub_245E1B404(v27, (uint64_t (*)(char *, unint64_t, uint64_t))sub_245E1B56C);
  sub_245E3CEEC();
  if (!sub_245E3CF28())
  {
LABEL_66:
    swift_release();
    return v2;
  }
  sub_245E1A694();
  while (1)
  {
    swift_dynamicCast();
    result = (uint64_t)objc_msgSend(v44, sel_uniqueName);
    if (!result)
      break;
    v30 = (void *)result;
    sub_245E3CC64();

    sub_245E3CAB4();
    sub_245E3CA3C();
    sub_245E18EC8();
    LOBYTE(v30) = sub_245E3CEB0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v30 & 1) != 0)
    {

    }
    else
    {
      v31 = v2;
      v32 = *(_QWORD *)(v2 + 16);
      if (*(_QWORD *)(v2 + 24) <= v32)
      {
        sub_245E1B16C(v32 + 1, &qword_2575243A0);
        v31 = v2;
      }
      result = sub_245E3CE44();
      v33 = v31 + 56;
      v34 = -1 << *(_BYTE *)(v31 + 32);
      v35 = result & ~v34;
      v36 = v35 >> 6;
      if (((-1 << v35) & ~*(_QWORD *)(v31 + 56 + 8 * (v35 >> 6))) == 0)
      {
        v38 = 0;
        v39 = (unint64_t)(63 - v34) >> 6;
        while (++v36 != v39 || (v38 & 1) == 0)
        {
          v40 = v36 == v39;
          if (v36 == v39)
            v36 = 0;
          v38 |= v40;
          v41 = *(_QWORD *)(v33 + 8 * v36);
          if (v41 != -1)
          {
            v37 = __clz(__rbit64(~v41)) + (v36 << 6);
            goto LABEL_65;
          }
        }
        goto LABEL_69;
      }
      v37 = __clz(__rbit64((-1 << v35) & ~*(_QWORD *)(v31 + 56 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0;
LABEL_65:
      *(_QWORD *)(v33 + ((v37 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v37;
      *(_QWORD *)(*(_QWORD *)(v31 + 48) + 8 * v37) = v44;
      ++*(_QWORD *)(v31 + 16);
    }
    if (!sub_245E3CF28())
      goto LABEL_66;
  }
LABEL_72:
  __break(1u);
  return result;
}

id Array<A>.removingUnrelatedTemplates(for:)(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  id v6;
  void *v7;
  _QWORD *v9;
  id result;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  BOOL v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;

  v2 = a2;
  v3 = MEMORY[0x24BEE4AF8];
  v33 = MEMORY[0x24BEE4AF8];
  if (a2 >> 62)
  {
LABEL_39:
    swift_bridgeObjectRetain();
    v4 = sub_245E3CFD0();
    if (v4)
      goto LABEL_3;
  }
  else
  {
    v4 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4)
    {
LABEL_3:
      v5 = 0;
      sub_245E3CAB4();
      v32 = v2 & 0xC000000000000001;
      v30 = (_QWORD *)(v2 + 32);
      v31 = v2 & 0xFFFFFFFFFFFFFF8;
      while (1)
      {
        if (v32)
        {
          v6 = (id)MEMORY[0x24954A43C](v5, v2);
        }
        else
        {
          if (v5 >= *(_QWORD *)(v31 + 16))
            goto LABEL_37;
          v6 = (id)v30[v5];
        }
        v7 = v6;
        if (__OFADD__(v5++, 1))
        {
          __break(1u);
LABEL_37:
          __break(1u);
LABEL_38:
          __break(1u);
          goto LABEL_39;
        }
        v9 = (_QWORD *)sub_245E3CA9C();
        result = objc_msgSend(v7, sel_uniqueName);
        if (!result)
        {
          __break(1u);
LABEL_62:
          __break(1u);
          return result;
        }
        v11 = result;
        v12 = sub_245E3CC64();
        v14 = v13;

        v15 = v9[2];
        if (!v15)
        {
          swift_bridgeObjectRelease();
          goto LABEL_20;
        }
        v16 = v4;
        v17 = (_QWORD *)v2;
        v18 = v9[4] == v12 && v9[5] == v14;
        if (v18 || (sub_245E3D06C() & 1) != 0)
          goto LABEL_4;
        if (v15 == 1)
        {
LABEL_18:
          swift_bridgeObjectRelease();
          v2 = (unint64_t)v17;
          v4 = v16;
LABEL_20:
          swift_bridgeObjectRelease();
          sub_245E3CF88();
          sub_245E3CFAC();
          sub_245E3CFB8();
          sub_245E3CF94();
          if (v5 == v4)
          {
LABEL_35:
            swift_bridgeObjectRelease();
            v20 = v33;
            v3 = MEMORY[0x24BEE4AF8];
            goto LABEL_41;
          }
        }
        else
        {
          if ((v9[6] != v12 || v9[7] != v14) && (sub_245E3D06C() & 1) == 0)
          {
            if (v15 != 2)
            {
              v2 = (unint64_t)(v9 + 9);
              v3 = 2;
              while (!__OFADD__(v3, 1))
              {
                if (*(_QWORD *)(v2 - 8) == v12 && *(_QWORD *)v2 == v14)
                  goto LABEL_4;
                v29 = v3 + 1;
                if ((sub_245E3D06C() & 1) != 0)
                  goto LABEL_4;
                v2 += 16;
                ++v3;
                if (v29 == v15)
                  goto LABEL_18;
              }
              goto LABEL_38;
            }
            goto LABEL_18;
          }
LABEL_4:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          v2 = (unint64_t)v17;
          v4 = v16;
          if (v5 == v16)
            goto LABEL_35;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  v20 = MEMORY[0x24BEE4AF8];
LABEL_41:
  v21 = sub_245E3C9F4();
  if (v21 == sub_245E3C9F4() || (v22 = sub_245E3C9F4(), v22 == sub_245E3C9F4()))
  {
    if (v20 < 0 || (v20 & 0x4000000000000000) != 0)
      goto LABEL_58;
    v23 = *(_QWORD *)(v20 + 16);
    while (v23)
    {
      for (i = 4; ; ++i)
      {
        v25 = (v20 & 0xC000000000000001) != 0
            ? (id)MEMORY[0x24954A43C](i - 4, v20)
            : *(id *)(v20 + 8 * i);
        v26 = v25;
        v27 = i - 3;
        if (__OFADD__(i - 4, 1))
          break;
        result = objc_msgSend(v25, sel_uniqueName);
        if (!result)
          goto LABEL_62;
        v28 = result;
        sub_245E3CC64();

        sub_245E3CAB4();
        sub_245E3CA3C();
        sub_245E18EC8();
        LOBYTE(v28) = sub_245E3CEB0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v28 & 1) != 0)
        {

        }
        else
        {
          sub_245E3CF88();
          sub_245E3CFAC();
          sub_245E3CFB8();
          sub_245E3CF94();
        }
        if (v27 == v23)
        {
          swift_release();
          return (id)v3;
        }
      }
      __break(1u);
LABEL_58:
      swift_bridgeObjectRetain();
      v23 = sub_245E3CFD0();
      swift_release();
    }
    swift_release();
    return (id)MEMORY[0x24BEE4AF8];
  }
  return (id)v20;
}

uint64_t sub_245E1B160(uint64_t a1)
{
  return sub_245E1B16C(a1, &qword_257524398);
}

uint64_t sub_245E1B16C(uint64_t a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
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

  v3 = v2;
  v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v5 = sub_245E3CF40();
  v6 = v5;
  if (*(_QWORD *)(v4 + 16))
  {
    v30 = v2;
    v7 = 1 << *(_BYTE *)(v4 + 32);
    v8 = (_QWORD *)(v4 + 56);
    if (v7 < 64)
      v9 = ~(-1 << v7);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v4 + 56);
    v11 = (unint64_t)(v7 + 63) >> 6;
    v12 = v5 + 56;
    result = swift_retain();
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
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v11)
          goto LABEL_33;
        v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v11)
            goto LABEL_33;
          v19 = v8[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v11)
              goto LABEL_33;
            v19 = v8[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_33:
                swift_release();
                v3 = v30;
                v29 = 1 << *(_BYTE *)(v4 + 32);
                if (v29 > 63)
                  bzero((void *)(v4 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v8 = -1 << v29;
                *(_QWORD *)(v4 + 16) = 0;
                break;
              }
              v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_39;
                  if (v14 >= v11)
                    goto LABEL_33;
                  v19 = v8[v14];
                  ++v20;
                  if (v19)
                    goto LABEL_23;
                }
              }
              v14 = v20;
            }
          }
        }
LABEL_23:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v17);
      result = sub_245E3CE44();
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
            goto LABEL_38;
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
  result = swift_release();
  *v3 = v6;
  return result;
}

uint64_t sub_245E1B404(uint64_t isStackAllocationSafe, uint64_t (*a2)(char *, unint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v4;
  char v5;
  unint64_t v6;
  size_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[2];

  v4 = isStackAllocationSafe;
  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = *(_BYTE *)(isStackAllocationSafe + 32);
  v6 = (unint64_t)((1 << v5) + 63) >> 6;
  v7 = 8 * v6;
  if ((v5 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v11 - ((v7 + 15) & 0x3FFFFFFFFFFFFFF0), v7);
    v8 = a2((char *)v11 - ((v7 + 15) & 0x3FFFFFFFFFFFFFF0), v6, v4);
    swift_release();
    if (v2)
      swift_willThrow();
  }
  else
  {
    v9 = (void *)swift_slowAlloc();
    bzero(v9, v7);
    v8 = a2((char *)v9, v6, v4);
    swift_release();
    MEMORY[0x24954AA78](v9, -1, -1);
  }
  return v8;
}

unint64_t *sub_245E1B56C(unint64_t *result, uint64_t a2, uint64_t a3)
{
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  unint64_t v11;
  int64_t v12;
  id v13;
  unint64_t *v14;
  unint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;

  v16 = result;
  v17 = 0;
  v4 = 0;
  v18 = a3 + 56;
  v5 = 1 << *(_BYTE *)(a3 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a3 + 56);
  v19 = (unint64_t)(v5 + 63) >> 6;
  while (v7)
  {
    v8 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    v9 = v8 | (v4 << 6);
LABEL_17:
    v13 = *(id *)(*(_QWORD *)(a3 + 48) + 8 * v9);
    result = (unint64_t *)objc_msgSend(v13, sel_uniqueName);
    if (!result)
      goto LABEL_30;
    v14 = result;
    sub_245E3CC64();

    sub_245E3CAB4();
    sub_245E3CA3C();
    sub_245E18EC8();
    LOBYTE(v14) = sub_245E3CEB0();

    swift_bridgeObjectRelease();
    result = (unint64_t *)swift_bridgeObjectRelease();
    if ((v14 & 1) == 0)
    {
      *(unint64_t *)((char *)v16 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
      v10 = __OFADD__(v17++, 1);
      if (v10)
        goto LABEL_29;
    }
  }
  v10 = __OFADD__(v4++, 1);
  if (v10)
  {
    __break(1u);
    goto LABEL_28;
  }
  if (v4 >= v19)
    goto LABEL_26;
  v11 = *(_QWORD *)(v18 + 8 * v4);
  if (v11)
  {
LABEL_16:
    v7 = (v11 - 1) & v11;
    v9 = __clz(__rbit64(v11)) + (v4 << 6);
    goto LABEL_17;
  }
  v12 = v4 + 1;
  if (v4 + 1 >= v19)
    goto LABEL_26;
  v11 = *(_QWORD *)(v18 + 8 * v12);
  if (v11)
    goto LABEL_15;
  v12 = v4 + 2;
  if (v4 + 2 >= v19)
    goto LABEL_26;
  v11 = *(_QWORD *)(v18 + 8 * v12);
  if (v11)
    goto LABEL_15;
  v12 = v4 + 3;
  if (v4 + 3 >= v19)
  {
LABEL_26:
    swift_retain();
    return (unint64_t *)sub_245E2EB54(v16, a2, v17, a3);
  }
  v11 = *(_QWORD *)(v18 + 8 * v12);
  if (v11)
  {
LABEL_15:
    v4 = v12;
    goto LABEL_16;
  }
  while (1)
  {
    v4 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v4 >= v19)
      goto LABEL_26;
    v11 = *(_QWORD *)(v18 + 8 * v4);
    ++v12;
    if (v11)
      goto LABEL_16;
  }
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

void sub_245E1B7CC(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  id v17;
  _QWORD *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  BOOL v30;
  uint64_t v31;
  int64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  int64_t v38;

  v31 = a2;
  v3 = a3;
  v36 = 0;
  v4 = 0;
  v5 = a3 + 56;
  v6 = 1 << *(_BYTE *)(a3 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(a3 + 56);
  v9 = (unint64_t)(v6 + 63) >> 6;
  v34 = a3 + 56;
  v33 = v9;
  while (1)
  {
    while (1)
    {
      if (v8)
      {
        v37 = (v8 - 1) & v8;
        v38 = v4;
        v10 = __clz(__rbit64(v8)) | (v4 << 6);
      }
      else
      {
        v11 = v4 + 1;
        if (__OFADD__(v4, 1))
          goto LABEL_46;
        if (v11 >= v9)
          goto LABEL_44;
        v12 = *(_QWORD *)(v5 + 8 * v11);
        v13 = v4 + 1;
        if (!v12)
        {
          v13 = v4 + 2;
          if (v4 + 2 >= v9)
            goto LABEL_44;
          v12 = *(_QWORD *)(v5 + 8 * v13);
          if (!v12)
          {
            v13 = v4 + 3;
            if (v4 + 3 >= v9)
              goto LABEL_44;
            v12 = *(_QWORD *)(v5 + 8 * v13);
            if (!v12)
            {
              v14 = v4 + 4;
              if (v4 + 4 >= v9)
                goto LABEL_44;
              v12 = *(_QWORD *)(v5 + 8 * v14);
              if (!v12)
              {
                while (1)
                {
                  v13 = v14 + 1;
                  if (__OFADD__(v14, 1))
                    goto LABEL_47;
                  if (v13 >= v9)
                    goto LABEL_44;
                  v12 = *(_QWORD *)(v5 + 8 * v13);
                  ++v14;
                  if (v12)
                    goto LABEL_21;
                }
              }
              v13 = v4 + 4;
            }
          }
        }
LABEL_21:
        v37 = (v12 - 1) & v12;
        v38 = v13;
        v10 = __clz(__rbit64(v12)) + (v13 << 6);
      }
      v15 = v10;
      v16 = *(void **)(*(_QWORD *)(v3 + 48) + 8 * v10);
      sub_245E3CAB4();
      v17 = v16;
      v18 = (_QWORD *)sub_245E3CA9C();
      v19 = objc_msgSend(v17, sel_uniqueName, v31);
      if (!v19)
        goto LABEL_48;
      v20 = v19;
      v21 = sub_245E3CC64();
      v23 = v22;

      v24 = v18[2];
      if (v24)
        break;
LABEL_40:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

LABEL_41:
      *(unint64_t *)((char *)a1 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      v8 = v37;
      v30 = __OFADD__(v36++, 1);
      v4 = v38;
      if (v30)
      {
        __break(1u);
LABEL_44:
        swift_retain();
        sub_245E2EB54(a1, v31, v36, v3);
        return;
      }
    }
    v25 = v18[4] == v21 && v18[5] == v23;
    if (!v25 && (sub_245E3D06C() & 1) == 0)
      break;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

LABEL_5:
    v4 = v38;
    v8 = v37;
  }
  if (v24 == 1)
    goto LABEL_40;
  v26 = v18 + 7;
  v27 = 1;
  while (1)
  {
    v28 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    v29 = *(v26 - 1) == v21 && *v26 == v23;
    if (v29 || (sub_245E3D06C() & 1) != 0)
    {

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v5 = v34;
      v3 = a3;
      v9 = v33;
      goto LABEL_5;
    }
    v26 += 2;
    ++v27;
    if (v28 == v24)
    {

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v5 = v34;
      v3 = a3;
      v9 = v33;
      goto LABEL_41;
    }
  }
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
}

void sub_245E1BABC()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  double v7;
  double v8;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v1 = v0;
  v2 = sub_245E3CBC8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend((id)objc_opt_self(), sel_countUnit);
  objc_msgSend(v1, sel_doubleValueForUnit_, v6);
  v8 = v7;

  if (v8 < 9.22337204e18 && v8 > -9.22337204e18)
  {
    if ((~*(_QWORD *)&v8 & 0x7FF0000000000000) != 0)
    {
      if (v8 > -9.22337204e18)
        return;
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    return;
  }
  sub_245E3CAF0();
  v10 = v1;
  v11 = sub_245E3CBBC();
  v12 = sub_245E3CE14();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v21 = swift_slowAlloc();
    v23 = v21;
    *(_DWORD *)v13 = 136315394;
    v20 = v13 + 4;
    v14 = v10;
    v15 = objc_msgSend(v14, sel_description);
    v16 = sub_245E3CC64();
    v18 = v17;

    v22 = sub_245E19CDC(v16, v18, &v23);
    sub_245E3CE80();

    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2048;
    v22 = *(_QWORD *)&v8;
    sub_245E3CE80();
    _os_log_impl(&dword_245E10000, v11, v12, "HKQuantity %s had out of bounds doubleValue: %f, returning 0", (uint8_t *)v13, 0x16u);
    v19 = v21;
    swift_arrayDestroy();
    MEMORY[0x24954AA78](v19, -1, -1);
    MEMORY[0x24954AA78](v13, -1, -1);

  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

id ACHAchievementProgressUpdate.init(progressUpdate:)(uint64_t a1)
{
  uint64_t v2;
  char v3;
  double v4;
  uint64_t v5;
  char v6;
  double v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;

  v2 = sub_245E3C46C();
  if ((v3 & 1) != 0 || (v4 = *(double *)&v2, v5 = sub_245E3C460(), (v6 & 1) != 0))
  {
    v17 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    sub_245E3C454();
    v15 = (void *)sub_245E3CC40();
    swift_bridgeObjectRelease();
    v16 = objc_msgSend(v17, sel_initWithTemplateUniqueName_progressQuantity_goalQuantity_, v15, 0, 0);
  }
  else
  {
    v7 = *(double *)&v5;
    v8 = (void *)objc_opt_self();
    v9 = objc_msgSend(v8, sel_countUnit);
    v10 = (void *)objc_opt_self();
    v11 = objc_msgSend(v10, sel_quantityWithUnit_doubleValue_, v9, v4);

    v12 = objc_msgSend(v8, sel_countUnit);
    v13 = objc_msgSend(v10, sel_quantityWithUnit_doubleValue_, v12, v7);

    v14 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    sub_245E3C454();
    v15 = (void *)sub_245E3CC40();
    swift_bridgeObjectRelease();
    v16 = objc_msgSend(v14, sel_initWithTemplateUniqueName_progressQuantity_goalQuantity_, v15, v11, v13);

  }
  v18 = sub_245E3C478();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(a1, v18);
  return v16;
}

void ACHAchievementProgressUpdate.transformed()(uint64_t a1@<X8>)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  SEL *v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  id v33;
  uint64_t v34;
  _QWORD v35[2];
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v2 = v1;
  v4 = sub_245E3CBC8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_msgSend(v2, sel_goalQuantity);
  v9 = 0;
  if (!v8)
    goto LABEL_5;
  v10 = v8;
  v11 = (void *)objc_opt_self();
  v12 = objc_msgSend(v11, sel_countUnit);
  objc_msgSend(v10, sel_doubleValueForUnit_, v12);
  v14 = v13;

  v15 = objc_msgSend(v2, sel_progressQuantity);
  if (v15)
  {
    v16 = v15;
    v17 = objc_msgSend(v11, sel_countUnit);
    objc_msgSend(v16, sel_doubleValueForUnit_, v17);
    v9 = v18;

    sub_245E3CAF0();
    v19 = v2;
    v20 = sub_245E3CBBC();
    v21 = sub_245E3CE14();
    v22 = (SEL *)&unk_251705000;
    if (os_log_type_enabled(v20, v21))
    {
      v23 = swift_slowAlloc();
      v36 = swift_slowAlloc();
      v39 = v36;
      *(_DWORD *)v23 = 136315650;
      v35[1] = v23 + 4;
      v24 = objc_msgSend(v19, sel_templateUniqueName);
      v37 = v4;
      v25 = v24;
      v26 = sub_245E3CC64();
      v28 = v27;

      v38 = sub_245E19CDC(v26, v28, &v39);
      sub_245E3CE80();

      swift_bridgeObjectRelease();
      *(_WORD *)(v23 + 12) = 2048;
      v38 = v9;
      sub_245E3CE80();
      *(_WORD *)(v23 + 22) = 2048;
      v38 = v14;
      v22 = (SEL *)&unk_251705000;
      sub_245E3CE80();
      _os_log_impl(&dword_245E10000, v20, v21, "Creating SeymourAchievementProgress for %s, progress: %f, goal: %f", (uint8_t *)v23, 0x20u);
      v29 = v36;
      swift_arrayDestroy();
      MEMORY[0x24954AA78](v29, -1, -1);
      MEMORY[0x24954AA78](v23, -1, -1);

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v37);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
    v33 = objc_msgSend(v19, v22[486]);
    v30 = sub_245E3CC64();
    v31 = v34;

    v32 = 0;
  }
  else
  {
LABEL_5:
    v30 = 0;
    v31 = 0;
    v32 = -1;
    v14 = 0;
  }
  *(_QWORD *)a1 = v30;
  *(_QWORD *)(a1 + 8) = v31;
  *(_QWORD *)(a1 + 16) = v9;
  *(_QWORD *)(a1 + 24) = v14;
  *(_BYTE *)(a1 + 32) = v32;
}

uint64_t sub_245E1C24C()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t result;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  unsigned __int8 *v41;
  char v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  id v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  id v52;
  char v53;
  id v54;
  NSObject *v55;
  uint8_t *v56;
  void *v57;
  id v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unsigned __int8 *v65;
  unsigned int v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  unsigned __int8 *v70;
  unsigned int v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  id v76;
  id v77;
  NSObject *v78;
  os_log_type_t v79;
  uint8_t *v80;
  void *v81;
  id v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  id v88;
  NSObject *v89;
  os_log_type_t v90;
  uint64_t v91;
  id v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unsigned __int8 *v102;
  unsigned int v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  unint64_t v107;
  id v108;
  char v109;
  uint64_t v110;
  char *v111;
  id v112;
  uint64_t v113;
  uint64_t v114[2];
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;

  v2 = v1;
  v3 = sub_245E3CBC8();
  v117 = *(_QWORD *)(v3 - 8);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v110 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (uint64_t)&v110 - v8;
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v110 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v110 - v13;
  v15 = objc_msgSend(v0, sel_prerequisiteTemplateName);
  v113 = v3;
  if (!v15)
    goto LABEL_7;
  v16 = v15;
  v112 = v0;
  v17 = sub_245E3CC64();
  v19 = v18;

  v115 = v17;
  v116 = v19;
  v114[0] = 45;
  v114[1] = 0xE100000000000000;
  sub_245E18EC8();
  v20 = (_QWORD *)sub_245E3CE98();
  swift_bridgeObjectRelease();
  if (!v20[2])
  {
    swift_bridgeObjectRelease();
    v0 = v112;
    v3 = v113;
    v2 = v1;
LABEL_7:
    sub_245E3CAF0();
    v24 = v0;
    v25 = sub_245E3CBBC();
    v26 = sub_245E3CE14();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      v112 = (id)swift_slowAlloc();
      v114[0] = (uint64_t)v112;
      *(_DWORD *)v27 = 136315138;
      v28 = objc_msgSend(v24, sel_uniqueName);
      v110 = v2;
      if (v28)
      {
        v29 = v28;
        v30 = sub_245E3CC64();
        v32 = v31;

      }
      else
      {
        v30 = 0;
        v32 = 0;
      }
      v115 = v30;
      v116 = v32;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25441B618);
      v43 = sub_245E3CE5C();
      v45 = v44;
      swift_bridgeObjectRelease();
      v115 = sub_245E19CDC(v43, v45, v114);
      sub_245E3CE80();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_245E10000, v25, v26, "No prerequisiteNameComponents for %s, returning 0", v27, 0xCu);
      v46 = v112;
      swift_arrayDestroy();
      MEMORY[0x24954AA78](v46, -1, -1);
      MEMORY[0x24954AA78](v27, -1, -1);

      (*(void (**)(char *, uint64_t))(v117 + 8))(v6, v113);
      return 0;
    }

    (*(void (**)(char *, uint64_t))(v117 + 8))(v6, v3);
    return 0;
  }
  v111 = v14;
  v21 = v20[4];
  v22 = v20[5];
  sub_245E3CAB4();
  swift_bridgeObjectRetain();
  if (v21 == sub_245E3CA54() && v22 == v23)
  {
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  v33 = sub_245E3D06C();
  swift_bridgeObjectRelease();
  if ((v33 & 1) == 0)
  {
    if (v21 == sub_245E3CA48() && v22 == v47)
    {
      swift_bridgeObjectRelease();
      goto LABEL_37;
    }
    v48 = sub_245E3D06C();
    swift_bridgeObjectRelease();
    if ((v48 & 1) != 0)
    {
LABEL_37:
      swift_bridgeObjectRelease();
      if (v20[2] < 2uLL)
      {
        swift_bridgeObjectRelease();
        v52 = v112;
      }
      else
      {
        v49 = v20[6];
        v50 = v20[7];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v51 = sub_245E1CEE8(v49, v50);
        v52 = v112;
        if ((v53 & 1) == 0)
          return v51;
      }
      sub_245E3CAF0();
      v54 = v52;
      v55 = sub_245E3CBBC();
      v9 = sub_245E3CE14();
      if (os_log_type_enabled(v55, (os_log_type_t)v9))
      {
        v56 = (uint8_t *)swift_slowAlloc();
        v57 = (void *)swift_slowAlloc();
        v114[0] = (uint64_t)v57;
        *(_DWORD *)v56 = 136315138;
        v58 = objc_msgSend(v54, sel_uniqueName);
        v112 = v57;
        if (v58)
        {
          v59 = v58;
          v60 = sub_245E3CC64();
          v62 = v61;

        }
        else
        {
          v60 = 0;
          v62 = 0;
        }
        v115 = v60;
        v116 = v62;
        __swift_instantiateConcreteTypeFromMangledName(&qword_25441B618);
        v73 = sub_245E3CE5C();
        v75 = v74;
        swift_bridgeObjectRelease();
        v115 = sub_245E19CDC(v73, v75, v114);
        sub_245E3CE80();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_245E10000, v55, (os_log_type_t)v9, "Could not fetch previous goal value for modality award %s", v56, 0xCu);
        v76 = v112;
        swift_arrayDestroy();
        MEMORY[0x24954AA78](v76, -1, -1);
        MEMORY[0x24954AA78](v56, -1, -1);

      }
      else
      {

      }
      (*(void (**)(char *, uint64_t))(v117 + 8))(v12, v113);
      goto LABEL_90;
    }
    swift_bridgeObjectRelease();
    if (v21 == sub_245E3CA84() && v22 == v63)
    {
      swift_bridgeObjectRelease_n();
      return 0;
    }
    v68 = sub_245E3D06C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v68 & 1) == 0)
    {
      sub_245E3CAF0();
      v77 = v112;
      v78 = sub_245E3CBBC();
      v79 = sub_245E3CE14();
      if (os_log_type_enabled(v78, v79))
      {
        v80 = (uint8_t *)swift_slowAlloc();
        v81 = (void *)swift_slowAlloc();
        v114[0] = (uint64_t)v81;
        *(_DWORD *)v80 = 136315138;
        v82 = objc_msgSend(v77, sel_uniqueName);
        v112 = v81;
        if (v82)
        {
          v83 = v82;
          v84 = sub_245E3CC64();
          v86 = v85;

        }
        else
        {
          v84 = 0;
          v86 = 0;
        }
        v115 = v84;
        v116 = v86;
        __swift_instantiateConcreteTypeFromMangledName(&qword_25441B618);
        v105 = sub_245E3CE5C();
        v107 = v106;
        swift_bridgeObjectRelease();
        v115 = sub_245E19CDC(v105, v107, v114);
        sub_245E3CE80();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_245E10000, v78, v79, "Not a lifetime or modality lifetime award: %s", v80, 0xCu);
        v108 = v112;
        swift_arrayDestroy();
        MEMORY[0x24954AA78](v108, -1, -1);
        MEMORY[0x24954AA78](v80, -1, -1);

      }
      else
      {

      }
      (*(void (**)(uint64_t, uint64_t))(v117 + 8))(v9, v113);
      goto LABEL_90;
    }
    return 0;
  }
LABEL_13:
  swift_bridgeObjectRelease();
  if (v20[2] < 3uLL)
  {
    swift_bridgeObjectRelease();
    v40 = v111;
    goto LABEL_84;
  }
  v34 = v20[8];
  v35 = v20[9];
  swift_bridgeObjectRetain();
  result = swift_bridgeObjectRelease();
  v37 = HIBYTE(v35) & 0xF;
  v38 = v34 & 0xFFFFFFFFFFFFLL;
  if ((v35 & 0x2000000000000000) != 0)
    v39 = HIBYTE(v35) & 0xF;
  else
    v39 = v34 & 0xFFFFFFFFFFFFLL;
  v40 = v111;
  if (!v39)
  {
    swift_bridgeObjectRelease();
LABEL_84:
    sub_245E3CAF0();
    v88 = v112;
    v89 = sub_245E3CBBC();
    v90 = sub_245E3CE14();
    if (os_log_type_enabled(v89, v90))
    {
      v9 = swift_slowAlloc();
      v91 = swift_slowAlloc();
      v114[0] = v91;
      *(_DWORD *)v9 = 136315138;
      v92 = objc_msgSend(v88, sel_uniqueName);
      if (v92)
      {
        v93 = v92;
        v94 = sub_245E3CC64();
        v96 = v95;

      }
      else
      {
        v94 = 0;
        v96 = 0;
      }
      v115 = v94;
      v116 = v96;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25441B618);
      v97 = sub_245E3CE5C();
      v99 = v98;
      swift_bridgeObjectRelease();
      v115 = sub_245E19CDC(v97, v99, v114);
      sub_245E3CE80();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_245E10000, v89, v90, "Could not fetch previous goal value for modality award %s", (uint8_t *)v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24954AA78](v91, -1, -1);
      MEMORY[0x24954AA78](v9, -1, -1);

      (*(void (**)(char *, uint64_t))(v117 + 8))(v111, v113);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v117 + 8))(v40, v113);
    }
LABEL_90:
    v100 = sub_245E3C4C0();
    sub_245E1D134();
    swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v100 - 8) + 104))(v101, *MEMORY[0x24BE89CB8], v100);
    swift_willThrow();
    return v9;
  }
  if ((v35 & 0x1000000000000000) != 0)
  {
    v9 = (uint64_t)sub_245E2D75C(v34, v35, 10);
    LOBYTE(v34) = v109;
    goto LABEL_83;
  }
  if ((v35 & 0x2000000000000000) == 0)
  {
    if ((v34 & 0x1000000000000000) != 0)
      v41 = (unsigned __int8 *)((v35 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v41 = (unsigned __int8 *)sub_245E3CF7C();
    v9 = (uint64_t)sub_245E2D748(v41, v38, 10);
    LOBYTE(v34) = v42 & 1;
LABEL_83:
    swift_bridgeObjectRelease();
    if ((v34 & 1) != 0)
      goto LABEL_84;
    return v9;
  }
  v115 = v34;
  v116 = v35 & 0xFFFFFFFFFFFFFFLL;
  if (v34 == 43)
  {
    if (!v37)
      goto LABEL_106;
    if (v37 == 1 || (BYTE1(v34) - 48) > 9u)
      goto LABEL_62;
    v9 = (BYTE1(v34) - 48);
    if (v37 != 2)
    {
      if ((BYTE2(v34) - 48) > 9u)
        goto LABEL_62;
      v9 = 10 * (BYTE1(v34) - 48) + (BYTE2(v34) - 48);
      v64 = v37 - 3;
      if (v64)
      {
        v65 = (unsigned __int8 *)&v115 + 3;
        while (1)
        {
          v66 = *v65 - 48;
          if (v66 > 9)
            goto LABEL_62;
          v67 = 10 * v9;
          if ((unsigned __int128)(v9 * (__int128)10) >> 64 != (10 * v9) >> 63)
            goto LABEL_62;
          v9 = v67 + v66;
          if (__OFADD__(v67, v66))
            goto LABEL_62;
          LOBYTE(v34) = 0;
          ++v65;
          if (!--v64)
            goto LABEL_83;
        }
      }
    }
LABEL_82:
    LOBYTE(v34) = 0;
    goto LABEL_83;
  }
  if (v34 != 45)
  {
    if (!v37 || (v34 - 48) > 9u)
      goto LABEL_62;
    v9 = (v34 - 48);
    if (v37 != 1)
    {
      if ((BYTE1(v34) - 48) > 9u)
        goto LABEL_62;
      v9 = 10 * (v34 - 48) + (BYTE1(v34) - 48);
      v69 = v37 - 2;
      if (v69)
      {
        v70 = (unsigned __int8 *)&v115 + 2;
        while (1)
        {
          v71 = *v70 - 48;
          if (v71 > 9)
            goto LABEL_62;
          v72 = 10 * v9;
          if ((unsigned __int128)(v9 * (__int128)10) >> 64 != (10 * v9) >> 63)
            goto LABEL_62;
          v9 = v72 + v71;
          if (__OFADD__(v72, v71))
            goto LABEL_62;
          LOBYTE(v34) = 0;
          ++v70;
          if (!--v69)
            goto LABEL_83;
        }
      }
    }
    goto LABEL_82;
  }
  if (v37)
  {
    if (v37 != 1 && (BYTE1(v34) - 48) <= 9u)
    {
      if (v37 == 2)
      {
        LOBYTE(v34) = 0;
        v9 = -(uint64_t)(BYTE1(v34) - 48);
        goto LABEL_83;
      }
      if ((BYTE2(v34) - 48) <= 9u)
      {
        v9 = -10 * (BYTE1(v34) - 48) - (BYTE2(v34) - 48);
        v87 = v37 - 3;
        if (!v87)
          goto LABEL_82;
        v102 = (unsigned __int8 *)&v115 + 3;
        while (1)
        {
          v103 = *v102 - 48;
          if (v103 > 9)
            break;
          v104 = 10 * v9;
          if ((unsigned __int128)(v9 * (__int128)10) >> 64 != (10 * v9) >> 63)
            break;
          v9 = v104 - v103;
          if (__OFSUB__(v104, v103))
            break;
          LOBYTE(v34) = 0;
          ++v102;
          if (!--v87)
            goto LABEL_83;
        }
      }
    }
LABEL_62:
    v9 = 0;
    LOBYTE(v34) = 1;
    goto LABEL_83;
  }
  __break(1u);
LABEL_106:
  __break(1u);
  return result;
}

uint64_t sub_245E1CEE8(uint64_t result, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  unsigned __int8 *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  unsigned int v20;
  uint64_t v21;
  char v22;
  _QWORD v23[3];

  v3 = HIBYTE(a2) & 0xF;
  v4 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0)
    v5 = v3;
  else
    v5 = result & 0xFFFFFFFFFFFFLL;
  if (!v5)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((result & 0x1000000000000000) != 0)
        v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      else
        v6 = (unsigned __int8 *)sub_245E3CF7C();
      v7 = (uint64_t)sub_245E2D748(v6, v4, 10);
      v9 = v8 & 1;
      goto LABEL_37;
    }
    v23[0] = result;
    v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (!v3)
        goto LABEL_50;
      if (v3 == 1 || (BYTE1(result) - 48) > 9u)
        goto LABEL_34;
      v7 = (BYTE1(result) - 48);
      v14 = v3 - 2;
      if (v14)
      {
        v15 = (unsigned __int8 *)v23 + 2;
        while (1)
        {
          v16 = *v15 - 48;
          if (v16 > 9)
            goto LABEL_34;
          v17 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
            goto LABEL_34;
          v7 = v17 + v16;
          if (__OFADD__(v17, v16))
            goto LABEL_34;
          v9 = 0;
          ++v15;
          if (!--v14)
            goto LABEL_37;
        }
      }
    }
    else
    {
      if (result == 45)
      {
        if (v3)
        {
          if (v3 != 1 && (BYTE1(result) - 48) <= 9u)
          {
            v7 = -(uint64_t)(BYTE1(result) - 48);
            v10 = v3 - 2;
            if (v10)
            {
              v11 = (unsigned __int8 *)v23 + 2;
              while (1)
              {
                v12 = *v11 - 48;
                if (v12 > 9)
                  goto LABEL_34;
                v13 = 10 * v7;
                if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
                  goto LABEL_34;
                v7 = v13 - v12;
                if (__OFSUB__(v13, v12))
                  goto LABEL_34;
                v9 = 0;
                ++v11;
                if (!--v10)
                  goto LABEL_37;
              }
            }
            goto LABEL_36;
          }
LABEL_34:
          v7 = 0;
          v9 = 1;
          goto LABEL_37;
        }
        __break(1u);
LABEL_50:
        __break(1u);
        return result;
      }
      if (!v3 || (result - 48) > 9u)
        goto LABEL_34;
      v7 = (result - 48);
      v18 = v3 - 1;
      if (v18)
      {
        v19 = (unsigned __int8 *)v23 + 1;
        while (1)
        {
          v20 = *v19 - 48;
          if (v20 > 9)
            goto LABEL_34;
          v21 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
            goto LABEL_34;
          v7 = v21 + v20;
          if (__OFADD__(v21, v20))
            goto LABEL_34;
          v9 = 0;
          ++v19;
          if (!--v18)
            goto LABEL_37;
        }
      }
    }
LABEL_36:
    v9 = 0;
    goto LABEL_37;
  }
  v7 = (uint64_t)sub_245E2D75C(result, a2, 10);
  v9 = v22;
LABEL_37:
  swift_bridgeObjectRelease();
  if ((v9 & 1) != 0)
    return 0;
  else
    return v7;
}

unint64_t sub_245E1D134()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2575243A8;
  if (!qword_2575243A8)
  {
    v1 = sub_245E3C4C0();
    result = MEMORY[0x24954A9D0](MEMORY[0x24BE89CE0], v1);
    atomic_store(result, (unint64_t *)&qword_2575243A8);
  }
  return result;
}

void SeymourAchievementProgressUpdate.init(achProgressUpdate:)(void *a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;

  v1 = objc_msgSend(a1, sel_goalQuantity);
  if (v1)
  {
    v2 = objc_msgSend((id)objc_opt_self(), sel_countUnit);
    objc_msgSend(v1, sel_doubleValueForUnit_, v2);

  }
  v3 = objc_msgSend(a1, sel_progressQuantity);
  if (v3)
  {
    v4 = objc_msgSend((id)objc_opt_self(), sel_countUnit);
    objc_msgSend(v3, sel_doubleValueForUnit_, v4);

  }
  v5 = objc_msgSend(a1, sel_templateUniqueName);
  sub_245E3CC64();

  sub_245E3C448();
}

id AchievementEnvironmentCache.makeCache(from:sessionEnergyBurned:isGuided:modalityIdentifier:)@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>, double a6@<D0>)
{
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  id result;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  unint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  _BOOL4 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  os_log_type_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  unint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void (*v75)(char *, uint64_t, uint64_t);
  char *v76;
  NSObject *v77;
  os_log_type_t v78;
  int v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  char *v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  char *v89;
  void (*v90)(char *, uint64_t);
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void (*v95)(char *, uint64_t);
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  int v107;
  uint64_t v108;
  char *v109;
  char *v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115[2];

  v98 = a4;
  v113 = a3;
  v107 = a2;
  v101 = a5;
  v8 = sub_245E3C844();
  v104 = *(_QWORD *)(v8 - 8);
  v105 = v8;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v89 = (char *)&v88 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v110 = (char *)&v88 - v11;
  v108 = sub_245E3C4B4();
  v103 = *(_QWORD *)(v108 - 8);
  MEMORY[0x24BDAC7A8](v108);
  v102 = (char *)&v88 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575243B0);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v100 = (uint64_t)&v88 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v112 = (uint64_t)&v88 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v88 - v18;
  v20 = sub_245E3CBC8();
  v99 = *(_QWORD *)(v20 - 8);
  v21 = MEMORY[0x24BDAC7A8](v20);
  v109 = (char *)&v88 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v111 = (char *)&v88 - v23;
  v24 = sub_245E3C3B8();
  v25 = *(_QWORD *)(v24 - 8);
  v26 = MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)&v88 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v26);
  v30 = (char *)&v88 - v29;
  result = objc_msgSend((id)objc_opt_self(), sel_hk_gregorianCalendar);
  if (result)
  {
    v32 = result;
    v33 = *MEMORY[0x24BDD45A0];
    sub_245E3C4A8();
    v34 = (void *)sub_245E3C394();
    v95 = *(void (**)(char *, uint64_t))(v25 + 8);
    v95(v28, v24);
    v35 = objc_msgSend(v32, sel_hk_startOfWeekWithFirstWeekday_beforeDate_addingWeeks_, v33, v34, 0);

    sub_245E3C3A0();
    sub_245E3C49C();
    v37 = v36;
    sub_245E3CAB4();
    sub_245E3CA78();
    v39 = v38;
    v94 = a1;
    sub_245E3C490();
    v41 = v40;
    sub_245E3CA6C();
    v43 = v42;
    sub_245E3CAF0();
    v44 = v98;
    swift_bridgeObjectRetain_n();
    v45 = sub_245E3CBBC();
    v46 = sub_245E3CE14();
    v47 = os_log_type_enabled(v45, v46);
    v96 = v24;
    v106 = v30;
    if (v47)
    {
      v48 = swift_slowAlloc();
      v49 = swift_slowAlloc();
      v115[0] = v49;
      *(_DWORD *)v48 = 67110146;
      LODWORD(v114) = v39 < v37;
      sub_245E3CE80();
      *(_WORD *)(v48 + 8) = 1024;
      LODWORD(v114) = v43 < v41;
      sub_245E3CE80();
      *(_WORD *)(v48 + 14) = 2048;
      v114 = *(_QWORD *)&a6;
      sub_245E3CE80();
      *(_WORD *)(v48 + 24) = 1024;
      LODWORD(v114) = v107 & 1;
      sub_245E3CE80();
      *(_WORD *)(v48 + 30) = 2080;
      swift_bridgeObjectRetain();
      v50 = v113;
      v114 = sub_245E19CDC(v113, v44, v115);
      sub_245E3CE80();
      swift_bridgeObjectRelease_n();
      v51 = v46;
      v52 = v20;
      _os_log_impl(&dword_245E10000, v45, v51, "Creating a new AchievementEnvironmentCache with meetsDurationThreshold: %{BOOL}d, meetsCompletionThreshold: %{BOOL}d, sessionEnergyBurned: %f, isGuided: %{BOOL}d, modalityIdentifier: %s", (uint8_t *)v48, 0x28u);
      swift_arrayDestroy();
      MEMORY[0x24954AA78](v49, -1, -1);
      v53 = v48;
      v54 = (uint64_t)v106;
      MEMORY[0x24954AA78](v53, -1, -1);

      v90 = *(void (**)(char *, uint64_t))(v99 + 8);
      v90(v111, v20);
    }
    else
    {
      v54 = (uint64_t)v30;

      swift_bridgeObjectRelease_n();
      v52 = v20;
      v90 = *(void (**)(char *, uint64_t))(v99 + 8);
      v90(v111, v20);
      v50 = v113;
    }
    sub_245E1DC60(v54, v43 < v41, v39 < v37, (uint64_t)v19);
    v55 = sub_245E3C820();
    v57 = v56;
    v58 = sub_245E3C838();
    v92 = v59;
    v91 = sub_245E1E894(v50, v44, a6);
    sub_245E2079C((uint64_t)v19, v112);
    v111 = v19;
    v60 = v100;
    sub_245E2079C((uint64_t)v19, v100);
    v61 = sub_245E3C658();
    v62 = *(_QWORD *)(v61 - 8);
    v63 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v62 + 48))(v60, 1, v61);
    v97 = v52;
    v99 = v55;
    v98 = v57;
    v93 = v58;
    v64 = v44;
    if (v63 == 1)
    {
      sub_245E1A720(v60, &qword_2575243B0);
    }
    else
    {
      sub_245E3C64C();
      (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v60, v61);
    }
    sub_245E3C7E4();
    v65 = v107 & 1;
    v66 = v94;
    v67 = v113;
    sub_245E1ECFC(v94, v113, v64, v107 & 1, v43 < v41, v39 < v37);
    sub_245E21014(v66, v43 < v41, v39 < v37);
    sub_245E1F168(v66, v67, v64, v65, v43 < v41, v39 < v37);
    v68 = v101;
    sub_245E3C814();
    v69 = v109;
    sub_245E3CAF0();
    v71 = v102;
    v70 = v103;
    v72 = v108;
    (*(void (**)(char *, uint64_t, uint64_t))(v103 + 16))(v102, v66, v108);
    v74 = v104;
    v73 = v105;
    v75 = *(void (**)(char *, uint64_t, uint64_t))(v104 + 16);
    v76 = v110;
    v75(v110, v68, v105);
    v77 = sub_245E3CBBC();
    v78 = sub_245E3CE14();
    v79 = v78;
    if (os_log_type_enabled(v77, v78))
    {
      v80 = swift_slowAlloc();
      v113 = swift_slowAlloc();
      v115[0] = v113;
      *(_DWORD *)v80 = 136315394;
      v81 = sub_245E3C484();
      v114 = sub_245E19CDC(v81, v82, v115);
      LODWORD(v112) = v79;
      sub_245E3CE80();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v70 + 8))(v71, v108);
      *(_WORD *)(v80 + 12) = 2080;
      v83 = v110;
      v75(v89, (uint64_t)v110, v73);
      v84 = sub_245E3CC70();
      v114 = sub_245E19CDC(v84, v85, v115);
      sub_245E3CE80();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v74 + 8))(v83, v73);
      _os_log_impl(&dword_245E10000, v77, (os_log_type_t)v112, "[AchievementEnvironmentCache] New cache after updating with data from session %s: %s", (uint8_t *)v80, 0x16u);
      v86 = v113;
      swift_arrayDestroy();
      MEMORY[0x24954AA78](v86, -1, -1);
      MEMORY[0x24954AA78](v80, -1, -1);

      v87 = v109;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v74 + 8))(v76, v73);
      (*(void (**)(char *, uint64_t))(v70 + 8))(v71, v72);
      v87 = v69;
    }
    v90(v87, v97);
    sub_245E1A720((uint64_t)v111, &qword_2575243B0);
    return (id)((uint64_t (*)(char *, uint64_t))v95)(v106, v96);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_245E1DC60@<X0>(uint64_t a1@<X0>, char a2@<W1>, int a3@<W2>, uint64_t a4@<X8>)
{
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
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint8_t *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint8_t *v49;
  void (*v50)(char *, uint64_t, uint64_t);
  void (**v51)(char *, _QWORD, _QWORD);
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  void (*v59)(uint64_t, char *, _QWORD);
  id v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(char *, uint64_t);
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  NSObject *v71;
  os_log_type_t v72;
  uint8_t *v73;
  uint8_t *v74;
  void (*v75)(char *, uint64_t, uint64_t);
  uint64_t (*v76)(uint64_t, uint64_t, uint64_t, void (*)(_QWORD, _QWORD, _QWORD));
  uint64_t v77;
  uint64_t v78;
  uint64_t result;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  char v83;
  void (*v84)(char *, uint64_t);
  uint64_t v85;
  void (*v86)(char *, uint64_t, uint64_t);
  uint64_t v87;
  char v88;
  char *v89;
  char *v90;
  void (*v91)(char *, uint64_t, uint64_t);
  uint64_t v92;
  uint64_t v93;
  void (*v94)(char *, uint64_t);
  char *v95;
  unint64_t v96;
  uint64_t v97;
  char *v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  char v102;
  uint64_t v103;
  uint64_t v104;
  uint8_t *v105;
  void (*v106)(char *, uint64_t);
  uint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  char *v118;
  char *v119;
  char *v120;
  char *v121;
  uint64_t v122;
  uint64_t v123;
  void (*v124)(uint64_t, char *, _QWORD);
  void (*v125)(char *, uint64_t, uint64_t);
  uint64_t v126;
  uint64_t v127;
  uint8_t *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void (*v132)(char *, uint64_t, uint64_t);
  uint64_t v133;
  uint64_t v134[2];

  v131 = a4;
  LODWORD(v123) = a3;
  v126 = a1;
  v5 = sub_245E3C844();
  v124 = *(void (**)(uint64_t, char *, _QWORD))(v5 - 8);
  v125 = (void (*)(char *, uint64_t, uint64_t))v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v108 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_245E3CBC8();
  v129 = *(_QWORD *)(v8 - 8);
  v130 = v8;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v108 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v118 = (char *)&v108 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v111 = (char *)&v108 - v14;
  v110 = sub_245E3C34C();
  v109 = *(_QWORD *)(v110 - 8);
  MEMORY[0x24BDAC7A8](v110);
  v108 = (char *)&v108 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v117 = sub_245E3C424();
  v115 = *(_QWORD *)(v117 - 8);
  MEMORY[0x24BDAC7A8](v117);
  v17 = (char *)&v108 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575243B8);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v108 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v122 = sub_245E3C3B8();
  v127 = *(_QWORD *)(v122 - 8);
  v21 = MEMORY[0x24BDAC7A8](v122);
  v23 = (char *)&v108 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x24BDAC7A8](v21);
  v116 = (char *)&v108 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v112 = (char *)&v108 - v27;
  MEMORY[0x24BDAC7A8](v26);
  v120 = (char *)&v108 - v28;
  v114 = sub_245E3C430();
  v113 = *(_QWORD *)(v114 - 8);
  MEMORY[0x24BDAC7A8](v114);
  v119 = (char *)&v108 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575243B0);
  v31 = MEMORY[0x24BDAC7A8](v30);
  v33 = (char *)&v108 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v31);
  v35 = (char *)&v108 - v34;
  v36 = sub_245E3C658();
  v128 = *(uint8_t **)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v121 = (char *)&v108 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0 && (v123 & 1) != 0)
  {
    sub_245E3C7D8();
    v38 = v128;
    v39 = v36;
    if ((*((unsigned int (**)(char *, uint64_t, uint64_t))v128 + 6))(v35, 1, v36) == 1)
    {
      sub_245E1A720((uint64_t)v35, &qword_2575243B0);
      v40 = v118;
      sub_245E3CAF0();
      v41 = v127;
      v42 = v122;
      v132 = *(void (**)(char *, uint64_t, uint64_t))(v127 + 16);
      v132(v23, v126, v122);
      v43 = sub_245E3CBBC();
      v44 = sub_245E3CE14();
      if (os_log_type_enabled(v43, v44))
      {
        v45 = (uint8_t *)swift_slowAlloc();
        v46 = swift_slowAlloc();
        v134[0] = v46;
        *(_DWORD *)v45 = 136315138;
        sub_245E14CAC(&qword_2575243C8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
        v47 = sub_245E3D048();
        v133 = sub_245E19CDC(v47, v48, v134);
        v39 = v36;
        sub_245E3CE80();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v127 + 8))(v23, v42);
        _os_log_impl(&dword_245E10000, v43, v44, "Current streak was nil, starting a new 1 week streak with start of week %s", v45, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24954AA78](v46, -1, -1);
        v49 = v45;
        v38 = v128;
        MEMORY[0x24954AA78](v49, -1, -1);

        (*(void (**)(char *, uint64_t))(v129 + 8))(v118, v130);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v41 + 8))(v23, v42);

        (*(void (**)(char *, uint64_t))(v129 + 8))(v40, v130);
      }
      v132(v116, v126, v42);
      v80 = v131;
      sub_245E3C640();
      return (*((uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))v38 + 7))(v80, 0, 1, v39);
    }
    v59 = (void (*)(uint64_t, char *, _QWORD))*((_QWORD *)v38 + 4);
    v132 = (void (*)(char *, uint64_t, uint64_t))v36;
    v124 = v59;
    v59((uint64_t)v121, v35, v36);
    v60 = objc_msgSend((id)objc_opt_self(), sel_currentCalendar);
    v61 = v119;
    sub_245E3C3F4();

    v123 = sub_245E3C64C();
    v62 = v120;
    sub_245E3C634();
    v63 = *MEMORY[0x24BDCF220];
    v64 = v115;
    v65 = v117;
    v125 = *(void (**)(char *, uint64_t, uint64_t))(v115 + 104);
    v125(v17, v63, v117);
    sub_245E3C400();
    v66 = *(void (**)(char *, uint64_t))(v64 + 8);
    v66(v17, v65);
    v67 = v127;
    v68 = v122;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v127 + 48))(v20, 1, v122) == 1)
    {
      v69 = v68;
      sub_245E1A720((uint64_t)v20, &qword_2575243B8);
      v70 = v111;
      sub_245E3CAF0();
      v71 = sub_245E3CBBC();
      v72 = sub_245E3CE14();
      if (os_log_type_enabled(v71, v72))
      {
        v73 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v73 = 0;
        _os_log_impl(&dword_245E10000, v71, v72, "Unable to determine the first weekday of the extended streak", v73, 2u);
        MEMORY[0x24954AA78](v73, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v129 + 8))(v70, v130);
      (*(void (**)(char *, uint64_t))(v127 + 8))(v120, v69);
      (*(void (**)(char *, uint64_t))(v113 + 8))(v119, v114);
      v74 = v128;
      v75 = v132;
      (*((void (**)(char *, void (*)(char *, uint64_t, uint64_t)))v128 + 1))(v121, v132);
      v76 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void (*)(_QWORD, _QWORD, _QWORD)))*((_QWORD *)v74 + 7);
      v77 = v131;
      v78 = 1;
      goto LABEL_18;
    }
    v81 = v112;
    (*(void (**)(char *, char *, uint64_t))(v67 + 32))(v112, v20, v68);
    v125(v17, v63, v65);
    v82 = v68;
    v83 = sub_245E3C40C();
    v66(v17, v65);
    if ((v83 & 1) != 0)
    {
      v84 = *(void (**)(char *, uint64_t))(v67 + 8);
      v84(v81, v82);
      v84(v62, v82);
      (*(void (**)(char *, uint64_t))(v113 + 8))(v61, v114);
      v85 = v131;
      v75 = v132;
      v124(v131, v121, v132);
      v76 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void (*)(_QWORD, _QWORD, _QWORD)))*((_QWORD *)v128 + 7);
      v77 = v85;
      v78 = 0;
LABEL_18:
      v86 = v75;
      return v76(v77, v78, 1, (void (*)(_QWORD, _QWORD, _QWORD))v86);
    }
    v87 = v117;
    v125(v17, v63, v117);
    v88 = sub_245E3C40C();
    result = ((uint64_t (*)(char *, uint64_t))v66)(v17, v87);
    v89 = v61;
    v90 = v81;
    if ((v88 & 1) != 0)
    {
      v91 = v132;
      if (__OFADD__(v123, 1))
      {
        __break(1u);
        return result;
      }
      v92 = v127;
      (*(void (**)(char *, uint64_t, uint64_t))(v127 + 16))(v116, v126, v82);
      v93 = v131;
      sub_245E3C640();
      v94 = *(void (**)(char *, uint64_t))(v92 + 8);
      v94(v90, v82);
      v95 = v120;
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2575243C0);
      v96 = (*(unsigned __int8 *)(v115 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v115 + 80);
      v97 = swift_allocObject();
      *(_OWORD *)(v97 + 16) = xmmword_245E3DA50;
      v125((char *)(v97 + v96), v63, v117);
      sub_245E20DAC(v97);
      swift_setDeallocating();
      swift_arrayDestroy();
      swift_deallocClassInstance();
      v98 = v108;
      v99 = v120;
      v100 = v126;
      sub_245E3C3DC();
      swift_bridgeObjectRelease();
      v101 = sub_245E3C340();
      v91 = v132;
      if ((v102 & 1) != 0 || v101 < 14)
      {
        (*(void (**)(char *, uint64_t))(v109 + 8))(v98, v110);
        v106 = *(void (**)(char *, uint64_t))(v127 + 8);
        v106(v90, v82);
        v106(v99, v82);
        (*(void (**)(char *, uint64_t))(v113 + 8))(v89, v114);
        v107 = v131;
        v124(v131, v121, v91);
        v76 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void (*)(_QWORD, _QWORD, _QWORD)))*((_QWORD *)v128 + 7);
        v77 = v107;
        goto LABEL_27;
      }
      v103 = v100;
      v104 = v127;
      (*(void (**)(char *, uint64_t, uint64_t))(v127 + 16))(v116, v103, v82);
      v93 = v131;
      sub_245E3C640();
      (*(void (**)(char *, uint64_t))(v109 + 8))(v98, v110);
      v94 = *(void (**)(char *, uint64_t))(v104 + 8);
      v94(v90, v82);
      v95 = v99;
    }
    v94(v95, v82);
    (*(void (**)(char *, uint64_t))(v113 + 8))(v89, v114);
    v105 = v128;
    (*((void (**)(char *, void (*)(char *, uint64_t, uint64_t)))v128 + 1))(v121, v91);
    v76 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void (*)(_QWORD, _QWORD, _QWORD)))*((_QWORD *)v105 + 7);
    v77 = v93;
LABEL_27:
    v78 = 0;
    v86 = v91;
    return v76(v77, v78, 1, (void (*)(_QWORD, _QWORD, _QWORD))v86);
  }
  sub_245E3CAF0();
  v51 = (void (**)(char *, _QWORD, _QWORD))v124;
  v50 = v125;
  (*((void (**)(char *, _QWORD, _QWORD))v124 + 2))(v7, v132, v125);
  v52 = sub_245E3CBBC();
  v53 = sub_245E3CE14();
  if (os_log_type_enabled(v52, v53))
  {
    v54 = (uint8_t *)swift_slowAlloc();
    v55 = swift_slowAlloc();
    v134[0] = v55;
    *(_DWORD *)v54 = 136315138;
    v128 = v54 + 4;
    sub_245E3C7D8();
    v56 = sub_245E3CE5C();
    v58 = v57;
    sub_245E1A720((uint64_t)v33, &qword_2575243B0);
    v133 = sub_245E19CDC(v56, v58, v134);
    sub_245E3CE80();
    swift_bridgeObjectRelease();
    (*((void (**)(char *, void (*)(char *, uint64_t, uint64_t)))v124 + 1))(v7, v125);
    _os_log_impl(&dword_245E10000, v52, v53, "Session does not meet completion and duration threshold, returning current streak %s", v54, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954AA78](v55, -1, -1);
    MEMORY[0x24954AA78](v54, -1, -1);
  }
  else
  {
    ((void (*)(char *, void (*)(char *, uint64_t, uint64_t)))v51[1])(v7, v50);
  }

  (*(void (**)(char *, uint64_t))(v129 + 8))(v11, v130);
  return sub_245E3C7D8();
}

uint64_t sub_245E1E894(uint64_t a1, unint64_t a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  double v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t inited;
  unint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33[2];

  v6 = sub_245E3CBC8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v30 - v11;
  v13 = sub_245E3C7FC();
  v14 = sub_245E3C7FC();
  if (!*(_QWORD *)(v14 + 16))
    goto LABEL_7;
  swift_bridgeObjectRetain();
  v15 = sub_245E2E2DC(a1, a2);
  if ((v16 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_7:
    swift_bridgeObjectRelease();
    sub_245E3CAF0();
    swift_bridgeObjectRetain_n();
    v22 = sub_245E3CBBC();
    v23 = sub_245E3CE14();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = swift_slowAlloc();
      v25 = swift_slowAlloc();
      v31 = v7;
      v26 = v25;
      v33[0] = v25;
      *(_DWORD *)v24 = 136315394;
      swift_bridgeObjectRetain();
      v32 = sub_245E19CDC(a1, a2, v33);
      v30 = v6;
      sub_245E3CE80();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v24 + 12) = 2048;
      v32 = *(_QWORD *)&a3;
      sub_245E3CE80();
      _os_log_impl(&dword_245E10000, v22, v23, "[AchievementEnvironmentCache] No current best energy burned value for modality %s, using %f", (uint8_t *)v24, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24954AA78](v26, -1, -1);
      MEMORY[0x24954AA78](v24, -1, -1);

      (*(void (**)(char *, uint64_t))(v31 + 8))(v10, v30);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    }
    goto LABEL_10;
  }
  v17 = *(double *)(*(_QWORD *)(v14 + 56) + 8 * v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v17 < a3)
  {
    sub_245E3CAF0();
    swift_bridgeObjectRetain_n();
    v18 = sub_245E3CBBC();
    v19 = sub_245E3CE14();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = swift_slowAlloc();
      v30 = swift_slowAlloc();
      v33[0] = v30;
      *(_DWORD *)v20 = 134218498;
      v32 = *(_QWORD *)&a3;
      sub_245E3CE80();
      *(_WORD *)(v20 + 12) = 2048;
      v32 = *(_QWORD *)&v17;
      sub_245E3CE80();
      *(_WORD *)(v20 + 22) = 2080;
      v31 = v7;
      swift_bridgeObjectRetain();
      v32 = sub_245E19CDC(a1, a2, v33);
      sub_245E3CE80();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_245E10000, v18, v19, "[AchievementEnvironmentCache] Session energy burned (%f) is greater than the current best (%f) for %s", (uint8_t *)v20, 0x20u);
      v21 = v30;
      swift_arrayDestroy();
      MEMORY[0x24954AA78](v21, -1, -1);
      MEMORY[0x24954AA78](v20, -1, -1);

      (*(void (**)(char *, uint64_t))(v31 + 8))(v12, v6);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
    }
LABEL_10:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575243F0);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_245E3DA50;
    *(_QWORD *)(inited + 32) = a1;
    *(_QWORD *)(inited + 40) = a2;
    *(double *)(inited + 48) = a3;
    swift_bridgeObjectRetain();
    v28 = sub_245E2B780(inited);
    return sub_245E20714(v28, v13, (uint64_t)sub_245E20D7C, (void (*)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t *))sub_245E207E4);
  }
  return v13;
}

uint64_t sub_245E1ECFC(uint64_t a1, uint64_t a2, unint64_t a3, char a4, char a5, char a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t result;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v41 = a2;
  v10 = sub_245E3CBC8();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v38 - v15;
  v17 = sub_245E3C82C();
  v18 = v17;
  if ((a5 & 1) == 0 || (a6 & 1) == 0 || (a4 & 1) == 0)
  {
    v39 = v11;
    sub_245E3CAF0();
    swift_bridgeObjectRetain_n();
    v23 = sub_245E3CBBC();
    v24 = sub_245E3CE14();
    if (os_log_type_enabled(v23, v24))
    {
      v40 = v10;
      v25 = (uint8_t *)swift_slowAlloc();
      v26 = swift_slowAlloc();
      v43 = v26;
      *(_DWORD *)v25 = 136315138;
      swift_bridgeObjectRetain();
      v27 = sub_245E3CC1C();
      v29 = v28;
      swift_bridgeObjectRelease();
      v42 = sub_245E19CDC(v27, v29, &v43);
      sub_245E3CE80();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_245E10000, v23, v24, "[AchievementEnvironmentCache] Session not counted towards guided workout count, returning %s", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24954AA78](v26, -1, -1);
      MEMORY[0x24954AA78](v25, -1, -1);

      (*(void (**)(char *, uint64_t))(v39 + 8))(v14, v40);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v39 + 8))(v14, v10);
    }
    return v18;
  }
  v19 = *(_QWORD *)(v17 + 16);
  v40 = v10;
  if (v19)
  {
    swift_bridgeObjectRetain();
    v20 = sub_245E2E2DC(v41, a3);
    if ((v21 & 1) != 0)
      v22 = *(_QWORD *)(*(_QWORD *)(v18 + 56) + 8 * v20);
    else
      v22 = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    v22 = 0;
  }
  sub_245E3CAF0();
  swift_bridgeObjectRetain_n();
  v30 = sub_245E3CBBC();
  v31 = sub_245E3CE14();
  if (os_log_type_enabled(v30, v31))
  {
    v32 = swift_slowAlloc();
    v33 = swift_slowAlloc();
    v42 = v22;
    v43 = v33;
    *(_DWORD *)v32 = 134218242;
    v38 = v22;
    sub_245E3CE80();
    *(_WORD *)(v32 + 12) = 2080;
    v39 = v11;
    swift_bridgeObjectRetain();
    v34 = v41;
    v42 = sub_245E19CDC(v41, a3, &v43);
    v22 = v38;
    sub_245E3CE80();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_245E10000, v30, v31, "[AchievementEnvironmentCache] Adding to current guided workout count %ld for modality %s", (uint8_t *)v32, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24954AA78](v33, -1, -1);
    MEMORY[0x24954AA78](v32, -1, -1);

    (*(void (**)(char *, uint64_t))(v39 + 8))(v16, v40);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v40);
    v34 = v41;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575243E8);
  result = swift_initStackObject();
  *(_OWORD *)(result + 16) = xmmword_245E3DA50;
  *(_QWORD *)(result + 32) = v34;
  *(_QWORD *)(result + 40) = a3;
  if (!__OFADD__(v22, 1))
  {
    v36 = result;
    *(_QWORD *)(result + 48) = v22 + 1;
    swift_bridgeObjectRetain();
    v37 = sub_245E2B890(v36);
    return sub_245E20714(v37, v18, (uint64_t)sub_245E20D94, (void (*)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t *))sub_245E20AB0);
  }
  __break(1u);
  return result;
}

uint64_t sub_245E1F168(uint64_t a1, uint64_t a2, unint64_t a3, char a4, char a5, char a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t result;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v41 = a2;
  v10 = sub_245E3CBC8();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v38 - v15;
  v17 = sub_245E3C808();
  v18 = v17;
  if ((a5 & 1) == 0 || (a6 & 1) == 0 || (a4 & 1) != 0)
  {
    v39 = v11;
    sub_245E3CAF0();
    swift_bridgeObjectRetain_n();
    v23 = sub_245E3CBBC();
    v24 = sub_245E3CE14();
    if (os_log_type_enabled(v23, v24))
    {
      v40 = v10;
      v25 = (uint8_t *)swift_slowAlloc();
      v26 = swift_slowAlloc();
      v43 = v26;
      *(_DWORD *)v25 = 136315138;
      swift_bridgeObjectRetain();
      v27 = sub_245E3CC1C();
      v29 = v28;
      swift_bridgeObjectRelease();
      v42 = sub_245E19CDC(v27, v29, &v43);
      sub_245E3CE80();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_245E10000, v23, v24, "[AchievementEnvironmentCache] Session not counted towards modality workout count, returning %s", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24954AA78](v26, -1, -1);
      MEMORY[0x24954AA78](v25, -1, -1);

      (*(void (**)(char *, uint64_t))(v39 + 8))(v14, v40);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v39 + 8))(v14, v10);
    }
    return v18;
  }
  v19 = *(_QWORD *)(v17 + 16);
  v40 = v10;
  if (v19)
  {
    swift_bridgeObjectRetain();
    v20 = sub_245E2E2DC(v41, a3);
    if ((v21 & 1) != 0)
      v22 = *(_QWORD *)(*(_QWORD *)(v18 + 56) + 8 * v20);
    else
      v22 = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    v22 = 0;
  }
  sub_245E3CAF0();
  swift_bridgeObjectRetain_n();
  v30 = sub_245E3CBBC();
  v31 = sub_245E3CE14();
  if (os_log_type_enabled(v30, v31))
  {
    v32 = swift_slowAlloc();
    v33 = swift_slowAlloc();
    v42 = v22;
    v43 = v33;
    *(_DWORD *)v32 = 134218242;
    v38 = v22;
    sub_245E3CE80();
    *(_WORD *)(v32 + 12) = 2080;
    v39 = v11;
    swift_bridgeObjectRetain();
    v34 = v41;
    v42 = sub_245E19CDC(v41, a3, &v43);
    v22 = v38;
    sub_245E3CE80();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_245E10000, v30, v31, "[AchievementEnvironmentCache] Adding to current workout count %ld for modality %s", (uint8_t *)v32, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24954AA78](v33, -1, -1);
    MEMORY[0x24954AA78](v32, -1, -1);

    (*(void (**)(char *, uint64_t))(v39 + 8))(v16, v40);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v40);
    v34 = v41;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575243E8);
  result = swift_initStackObject();
  *(_OWORD *)(result + 16) = xmmword_245E3DA50;
  *(_QWORD *)(result + 32) = v34;
  *(_QWORD *)(result + 40) = a3;
  if (!__OFADD__(v22, 1))
  {
    v36 = result;
    *(_QWORD *)(result + 48) = v22 + 1;
    swift_bridgeObjectRetain();
    v37 = sub_245E2B890(v36);
    return sub_245E20714(v37, v18, (uint64_t)sub_245E20D94, (void (*)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t *))sub_245E20AB0);
  }
  __break(1u);
  return result;
}

uint64_t AchievementEnvironmentCache.makeCache(firstCompletedPlanSessionIdentifier:mostRecentCompletedPlanSessionIdentifier:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(char *, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(char *, uint64_t);
  uint64_t v25;
  char *v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t, uint64_t);
  char *v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v40;
  char *v41;
  uint64_t (*v42)(char *, uint64_t);
  char *v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint8_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v49 = a1;
  v50 = (uint8_t *)a3;
  v44 = a5;
  v47 = sub_245E3C844();
  v51 = *(_QWORD *)(v47 - 8);
  v7 = MEMORY[0x24BDAC7A8](v47);
  v41 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v45 = (char *)&v40 - v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575243B0);
  MEMORY[0x24BDAC7A8](v10);
  v43 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_245E3CBC8();
  v13 = *(uint64_t (**)(char *, uint64_t))(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v46 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v40 - v16;
  sub_245E3CAF0();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v18 = sub_245E3CBBC();
  v19 = sub_245E3CE14();
  v20 = os_log_type_enabled(v18, v19);
  v48 = v12;
  if (v20)
  {
    v21 = swift_slowAlloc();
    v22 = swift_slowAlloc();
    v42 = v13;
    v23 = v22;
    v53 = v22;
    *(_DWORD *)v21 = 136315394;
    swift_bridgeObjectRetain();
    v52 = sub_245E19CDC(v49, a2, &v53);
    sub_245E3CE80();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v21 + 12) = 2080;
    swift_bridgeObjectRetain();
    v52 = sub_245E19CDC((uint64_t)v50, a4, &v53);
    v12 = v48;
    sub_245E3CE80();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_245E10000, v18, v19, "Updating existing cache with firstCompletedPlanSessionIdentifier: %s and mostRecentCompletedPlanSessionIdentifier: %s", (uint8_t *)v21, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24954AA78](v23, -1, -1);
    MEMORY[0x24954AA78](v21, -1, -1);

    v24 = (uint64_t (*)(char *, uint64_t))*((_QWORD *)v42 + 1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    v24 = (uint64_t (*)(char *, uint64_t))*((_QWORD *)v13 + 1);
  }
  v42 = v24;
  v24(v17, v12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_245E3C7FC();
  sub_245E3C7D8();
  sub_245E3C7E4();
  sub_245E3C82C();
  sub_245E3C7F0();
  sub_245E3C808();
  v25 = v44;
  sub_245E3C814();
  v26 = v46;
  sub_245E3CAF0();
  v27 = v51;
  v28 = *(void (**)(char *, uint64_t, uint64_t))(v51 + 16);
  v29 = v45;
  v30 = v47;
  v28(v45, v25, v47);
  v31 = sub_245E3CBBC();
  v32 = sub_245E3CE14();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = (uint8_t *)swift_slowAlloc();
    v34 = swift_slowAlloc();
    v53 = v34;
    *(_DWORD *)v33 = 136315138;
    v50 = v33 + 4;
    v28(v41, (uint64_t)v29, v30);
    v35 = sub_245E3CC70();
    v52 = sub_245E19CDC(v35, v36, &v53);
    sub_245E3CE80();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v51 + 8))(v29, v30);
    _os_log_impl(&dword_245E10000, v31, v32, "New cache after updating plan session identifiers: %s", v33, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954AA78](v34, -1, -1);
    MEMORY[0x24954AA78](v33, -1, -1);

    v37 = v26;
    v38 = v48;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v30);

    v37 = v26;
    v38 = v12;
  }
  return v42(v37, v38);
}

id AchievementEnvironmentCache.updatingWeeklyStreak(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  id result;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  char *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  void (*v52)(char *, char *, uint64_t);
  char *v53;
  NSObject *v54;
  os_log_type_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  void (*v59)(char *, uint64_t);
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  void (*v63)(char *, uint64_t);
  char *v64;
  uint64_t v65;
  char *v66;
  char v67;
  uint64_t v68;
  NSObject *v69;
  os_log_type_t v70;
  uint8_t *v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint8_t *v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  char *v87;
  char *v88;
  char *v89;
  char *v90;
  uint8_t *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96[2];

  v81 = a1;
  v92 = a2;
  v94 = sub_245E3CBC8();
  v91 = *(uint8_t **)(v94 - 8);
  v3 = MEMORY[0x24BDAC7A8](v94);
  v5 = (char *)&v78 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v3);
  v86 = (char *)&v78 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v87 = (char *)&v78 - v8;
  v82 = sub_245E3C430();
  v9 = *(_QWORD *)(v82 - 8);
  MEMORY[0x24BDAC7A8](v82);
  v11 = (char *)&v78 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_245E3C34C();
  v84 = *(_QWORD *)(v12 - 8);
  v85 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v89 = (char *)&v78 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575243B0);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v80 = (char *)&v78 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v78 - v17;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575243B8);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v78 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_245E3C3B8();
  v23 = *(_QWORD *)(v22 - 8);
  v24 = MEMORY[0x24BDAC7A8](v22);
  v83 = (char *)&v78 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)&v78 - v27;
  v29 = MEMORY[0x24BDAC7A8](v26);
  v88 = (char *)&v78 - v30;
  MEMORY[0x24BDAC7A8](v29);
  v90 = (char *)&v78 - v31;
  v93 = v2;
  sub_245E3C7D8();
  v32 = sub_245E3C658();
  v33 = *(_QWORD *)(v32 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v18, 1, v32) == 1)
  {
    sub_245E1A720((uint64_t)v18, &qword_2575243B0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56))(v21, 1, 1, v22);
LABEL_4:
    sub_245E1A720((uint64_t)v21, &qword_2575243B8);
    sub_245E3CAF0();
    v34 = sub_245E3CBBC();
    v35 = sub_245E3CE14();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v36 = 0;
      _os_log_impl(&dword_245E10000, v34, v35, "Checking if the current streak is broken but the current streak is nil, returning existing environment cache", v36, 2u);
      MEMORY[0x24954AA78](v36, -1, -1);
    }

    (*((void (**)(char *, uint64_t))v91 + 1))(v5, v94);
    goto LABEL_7;
  }
  v79 = v33;
  sub_245E3C634();
  (*(void (**)(char *, uint64_t))(v79 + 8))(v18, v32);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v21, 0, 1, v22);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22) == 1)
    goto LABEL_4;
  v78 = v32;
  (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v90, v21, v22);
  v39 = (void *)objc_opt_self();
  result = objc_msgSend(v39, sel_hk_gregorianCalendar);
  if (result)
  {
    v40 = result;
    v41 = *MEMORY[0x24BDD45A0];
    v42 = (void *)sub_245E3C394();
    v43 = objc_msgSend(v40, sel_hk_startOfWeekWithFirstWeekday_beforeDate_addingWeeks_, v41, v42, 0);

    v44 = v88;
    sub_245E3C3A0();

    v45 = objc_msgSend(v39, sel_currentCalendar);
    sub_245E3C3F4();

    __swift_instantiateConcreteTypeFromMangledName(&qword_2575243C0);
    v46 = sub_245E3C424();
    v47 = *(_QWORD *)(v46 - 8);
    v48 = (*(unsigned __int8 *)(v47 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v47 + 80);
    v49 = swift_allocObject();
    *(_OWORD *)(v49 + 16) = xmmword_245E3DA50;
    (*(void (**)(unint64_t, _QWORD, uint64_t))(v47 + 104))(v49 + v48, *MEMORY[0x24BDCF220], v46);
    sub_245E20DAC(v49);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    v50 = v90;
    sub_245E3C3DC();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v82);
    v51 = v87;
    sub_245E3CAF0();
    v52 = *(void (**)(char *, char *, uint64_t))(v23 + 16);
    v52(v28, v50, v22);
    v53 = v83;
    v52(v83, v44, v22);
    v54 = sub_245E3CBBC();
    v55 = sub_245E3CE14();
    if (os_log_type_enabled(v54, v55))
    {
      v56 = swift_slowAlloc();
      v82 = swift_slowAlloc();
      v96[0] = v82;
      *(_DWORD *)v56 = 136315394;
      v81 = v56 + 4;
      sub_245E14CAC(&qword_2575243C8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
      v57 = sub_245E3D048();
      v95 = sub_245E19CDC(v57, v58, v96);
      sub_245E3CE80();
      swift_bridgeObjectRelease();
      v59 = *(void (**)(char *, uint64_t))(v23 + 8);
      v59(v28, v22);
      *(_WORD *)(v56 + 12) = 2080;
      v60 = sub_245E3D048();
      v95 = sub_245E19CDC(v60, v61, v96);
      sub_245E3CE80();
      swift_bridgeObjectRelease();
      v59(v53, v22);
      _os_log_impl(&dword_245E10000, v54, v55, "Determining the difference between firstWeekdayOfStreakEnd (%s), and currentStartOfWeek (%s)", (uint8_t *)v56, 0x16u);
      v62 = v82;
      swift_arrayDestroy();
      MEMORY[0x24954AA78](v62, -1, -1);
      MEMORY[0x24954AA78](v56, -1, -1);

      v63 = (void (*)(char *, uint64_t))*((_QWORD *)v91 + 1);
      v63(v87, v94);
    }
    else
    {
      v59 = *(void (**)(char *, uint64_t))(v23 + 8);
      v59(v28, v22);
      v59(v53, v22);

      v63 = (void (*)(char *, uint64_t))*((_QWORD *)v91 + 1);
      v63(v51, v94);
    }
    v64 = v86;
    v65 = sub_245E3C340();
    v66 = v90;
    if ((v67 & 1) != 0 || (v68 = v65, v65 < 14))
    {
      (*(void (**)(char *, uint64_t))(v84 + 8))(v89, v85);
      v59(v88, v22);
      v59(v66, v22);
LABEL_7:
      v37 = sub_245E3C844();
      return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 16))(v92, v93, v37);
    }
    sub_245E3CAF0();
    v69 = sub_245E3CBBC();
    v70 = sub_245E3CE14();
    if (os_log_type_enabled(v69, v70))
    {
      v71 = (uint8_t *)swift_slowAlloc();
      v72 = swift_slowAlloc();
      v95 = v68;
      v96[0] = v72;
      *(_DWORD *)v71 = 136315138;
      v91 = v71 + 4;
      v73 = sub_245E3D048();
      v95 = sub_245E19CDC(v73, v74, v96);
      sub_245E3CE80();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_245E10000, v69, v70, "Number of days since the first weekday of the streak end is %s, updating weeklyStreak to nil", v71, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24954AA78](v72, -1, -1);
      v75 = v71;
      v66 = v90;
      MEMORY[0x24954AA78](v75, -1, -1);

      v76 = v86;
    }
    else
    {

      v76 = v64;
    }
    v63(v76, v94);
    v77 = (uint64_t)v80;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v79 + 56))(v80, 1, 1, v78);
    sub_245E20414(v77, v92);
    sub_245E1A720(v77, &qword_2575243B0);
    (*(void (**)(char *, uint64_t))(v84 + 8))(v89, v85);
    v59(v88, v22);
    return (id)((uint64_t (*)(char *, uint64_t))v59)(v66, v22);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_245E20414@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  _QWORD v25[2];
  uint8_t *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v28 = sub_245E3C844();
  v31 = *(_QWORD *)(v28 - 8);
  v4 = MEMORY[0x24BDAC7A8](v28);
  v25[0] = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v25 - v6;
  v8 = sub_245E3CBC8();
  v29 = *(_QWORD *)(v8 - 8);
  v30 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v27 = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575243B0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_245E3C820();
  v25[1] = v14;
  v26 = (uint8_t *)v13;
  sub_245E3C838();
  sub_245E3C7FC();
  sub_245E2079C(a1, (uint64_t)v12);
  sub_245E3C7E4();
  sub_245E3C82C();
  sub_245E3C7F0();
  sub_245E3C808();
  v15 = v27;
  v16 = v28;
  sub_245E3C814();
  sub_245E3CAF0();
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v31 + 16);
  v17(v7, a2, v16);
  v18 = sub_245E3CBBC();
  v19 = sub_245E3CE14();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc();
    v21 = swift_slowAlloc();
    v33 = v21;
    *(_DWORD *)v20 = 136315138;
    v26 = v20 + 4;
    v17((char *)v25[0], (uint64_t)v7, v16);
    v22 = sub_245E3CC70();
    v32 = sub_245E19CDC(v22, v23, &v33);
    sub_245E3CE80();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v7, v16);
    _os_log_impl(&dword_245E10000, v18, v19, "[AchievementEnvironmentCache] New cache after updating weekly streak: %s", v20, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954AA78](v21, -1, -1);
    MEMORY[0x24954AA78](v20, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v31 + 8))(v7, v16);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v15, v30);
}

uint64_t sub_245E20714(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t *))
{
  uint64_t v4;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v12;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v12 = a2;
  a4(a1, a3, 0, isUniquelyReferenced_nonNull_native, &v12);
  v10 = v12;
  swift_bridgeObjectRelease();
  if (v4)
    swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_245E2079C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575243B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_245E207E4(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  unint64_t v20;
  char v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  char v36;
  unint64_t v37;
  uint64_t v38;
  _BOOL8 v39;
  uint64_t v40;
  char v41;
  unint64_t v42;
  char v43;
  _QWORD *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t result;

  swift_bridgeObjectRetain();
  swift_retain();
  v7 = sub_245E27DAC();
  if (!v8)
    goto LABEL_24;
  v10 = v7;
  v11 = v8;
  v12 = v9;
  v13 = (_QWORD *)*a5;
  v15 = sub_245E2E2DC(v7, v8);
  v16 = v13[2];
  v17 = (v14 & 1) == 0;
  v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v19 = v14;
  if (v13[3] >= v18)
  {
    if ((a4 & 1) != 0)
    {
      v22 = (_QWORD *)*a5;
      if ((v14 & 1) != 0)
        goto LABEL_9;
    }
    else
    {
      sub_245E35EFC();
      v22 = (_QWORD *)*a5;
      if ((v19 & 1) != 0)
        goto LABEL_9;
    }
LABEL_11:
    v22[(v15 >> 6) + 8] |= 1 << v15;
    v23 = (uint64_t *)(v22[6] + 16 * v15);
    *v23 = v10;
    v23[1] = v11;
    *(_QWORD *)(v22[7] + 8 * v15) = v12;
    v24 = v22[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (v25)
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    v22[2] = v26;
LABEL_13:
    v27 = sub_245E27DAC();
    if (v28)
    {
      v30 = v27;
      v31 = v28;
      v32 = v29;
      do
      {
        v35 = (_QWORD *)*a5;
        v37 = sub_245E2E2DC(v30, v31);
        v38 = v35[2];
        v39 = (v36 & 1) == 0;
        v40 = v38 + v39;
        if (__OFADD__(v38, v39))
          goto LABEL_25;
        v41 = v36;
        if (v35[3] < v40)
        {
          sub_245E2C73C(v40, 1);
          v42 = sub_245E2E2DC(v30, v31);
          if ((v41 & 1) != (v43 & 1))
            goto LABEL_27;
          v37 = v42;
        }
        v44 = (_QWORD *)*a5;
        if ((v41 & 1) != 0)
        {
          swift_bridgeObjectRelease();
          *(_QWORD *)(v44[7] + 8 * v37) = v32;
        }
        else
        {
          v44[(v37 >> 6) + 8] |= 1 << v37;
          v45 = (uint64_t *)(v44[6] + 16 * v37);
          *v45 = v30;
          v45[1] = v31;
          *(_QWORD *)(v44[7] + 8 * v37) = v32;
          v46 = v44[2];
          v25 = __OFADD__(v46, 1);
          v47 = v46 + 1;
          if (v25)
            goto LABEL_26;
          v44[2] = v47;
        }
        v30 = sub_245E27DAC();
        v31 = v33;
        v32 = v34;
      }
      while (v33);
    }
LABEL_24:
    swift_release();
    swift_bridgeObjectRelease();
    sub_245E1A718();
    return swift_release();
  }
  sub_245E2C73C(v18, a4 & 1);
  v20 = sub_245E2E2DC(v10, v11);
  if ((v19 & 1) == (v21 & 1))
  {
    v15 = v20;
    v22 = (_QWORD *)*a5;
    if ((v19 & 1) == 0)
      goto LABEL_11;
LABEL_9:
    swift_bridgeObjectRelease();
    *(_QWORD *)(v22[7] + 8 * v15) = v12;
    goto LABEL_13;
  }
LABEL_27:
  result = sub_245E3D084();
  __break(1u);
  return result;
}

uint64_t sub_245E20AB0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  unint64_t v20;
  char v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  char v36;
  unint64_t v37;
  uint64_t v38;
  _BOOL8 v39;
  uint64_t v40;
  char v41;
  unint64_t v42;
  char v43;
  _QWORD *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t result;

  swift_bridgeObjectRetain();
  swift_retain();
  v7 = sub_245E27F2C();
  if (!v8)
    goto LABEL_24;
  v10 = v7;
  v11 = v8;
  v12 = v9;
  v13 = (_QWORD *)*a5;
  v15 = sub_245E2E2DC(v7, v8);
  v16 = v13[2];
  v17 = (v14 & 1) == 0;
  v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v19 = v14;
  if (v13[3] >= v18)
  {
    if ((a4 & 1) != 0)
    {
      v22 = (_QWORD *)*a5;
      if ((v14 & 1) != 0)
        goto LABEL_9;
    }
    else
    {
      sub_245E360A8();
      v22 = (_QWORD *)*a5;
      if ((v19 & 1) != 0)
        goto LABEL_9;
    }
LABEL_11:
    v22[(v15 >> 6) + 8] |= 1 << v15;
    v23 = (uint64_t *)(v22[6] + 16 * v15);
    *v23 = v10;
    v23[1] = v11;
    *(_QWORD *)(v22[7] + 8 * v15) = v12;
    v24 = v22[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (v25)
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    v22[2] = v26;
LABEL_13:
    v27 = sub_245E27F2C();
    if (v28)
    {
      v30 = v27;
      v31 = v28;
      v32 = v29;
      do
      {
        v35 = (_QWORD *)*a5;
        v37 = sub_245E2E2DC(v30, v31);
        v38 = v35[2];
        v39 = (v36 & 1) == 0;
        v40 = v38 + v39;
        if (__OFADD__(v38, v39))
          goto LABEL_25;
        v41 = v36;
        if (v35[3] < v40)
        {
          sub_245E2CA40(v40, 1);
          v42 = sub_245E2E2DC(v30, v31);
          if ((v41 & 1) != (v43 & 1))
            goto LABEL_27;
          v37 = v42;
        }
        v44 = (_QWORD *)*a5;
        if ((v41 & 1) != 0)
        {
          swift_bridgeObjectRelease();
          *(_QWORD *)(v44[7] + 8 * v37) = v32;
        }
        else
        {
          v44[(v37 >> 6) + 8] |= 1 << v37;
          v45 = (uint64_t *)(v44[6] + 16 * v37);
          *v45 = v30;
          v45[1] = v31;
          *(_QWORD *)(v44[7] + 8 * v37) = v32;
          v46 = v44[2];
          v25 = __OFADD__(v46, 1);
          v47 = v46 + 1;
          if (v25)
            goto LABEL_26;
          v44[2] = v47;
        }
        v30 = sub_245E27F2C();
        v31 = v33;
        v32 = v34;
      }
      while (v33);
    }
LABEL_24:
    swift_release();
    swift_bridgeObjectRelease();
    sub_245E1A718();
    return swift_release();
  }
  sub_245E2CA40(v18, a4 & 1);
  v20 = sub_245E2E2DC(v10, v11);
  if ((v19 & 1) == (v21 & 1))
  {
    v15 = v20;
    v22 = (_QWORD *)*a5;
    if ((v19 & 1) == 0)
      goto LABEL_11;
LABEL_9:
    swift_bridgeObjectRelease();
    *(_QWORD *)(v22[7] + 8 * v15) = v12;
    goto LABEL_13;
  }
LABEL_27:
  result = sub_245E3D084();
  __break(1u);
  return result;
}

uint64_t sub_245E20D7C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[1];
  v3 = a1[2];
  *a2 = *a1;
  a2[1] = v2;
  a2[2] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_245E20D94@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[1];
  v3 = a1[2];
  *a2 = *a1;
  a2[1] = v2;
  a2[2] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_245E20DAC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t result;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;

  v2 = sub_245E3C424();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v27 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575243D0);
    v10 = sub_245E3CF4C();
    v11 = 0;
    v12 = *(unsigned __int8 *)(v3 + 80);
    v28 = v9;
    v29 = a1 + ((v12 + 32) & ~v12);
    v13 = *(_QWORD *)(v3 + 72);
    v31 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v32 = v10 + 56;
    while (1)
    {
      v30 = v11;
      v31(v8, v29 + v13 * v11, v2);
      sub_245E14CAC(&qword_2575243D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF290], MEMORY[0x24BDCF2A8]);
      v14 = sub_245E3CC28();
      v15 = ~(-1 << *(_BYTE *)(v10 + 32));
      v16 = v14 & v15;
      v17 = (v14 & (unint64_t)v15) >> 6;
      v18 = *(_QWORD *)(v32 + 8 * v17);
      v19 = 1 << (v14 & v15);
      if ((v19 & v18) != 0)
      {
        do
        {
          v31(v6, *(_QWORD *)(v10 + 48) + v16 * v13, v2);
          sub_245E14CAC(&qword_2575243E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF290], MEMORY[0x24BDCF2C0]);
          v20 = sub_245E3CC34();
          v21 = v3;
          v22 = *(void (**)(char *, uint64_t))(v3 + 8);
          v22(v6, v2);
          if ((v20 & 1) != 0)
          {
            v22(v8, v2);
            v3 = v21;
            v9 = v28;
            goto LABEL_4;
          }
          v16 = (v16 + 1) & v15;
          v17 = v16 >> 6;
          v18 = *(_QWORD *)(v32 + 8 * (v16 >> 6));
          v19 = 1 << v16;
          v3 = v21;
        }
        while ((v18 & (1 << v16)) != 0);
        v9 = v28;
      }
      *(_QWORD *)(v32 + 8 * v17) = v19 | v18;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v10 + 48) + v16 * v13, v8, v2);
      v24 = *(_QWORD *)(v10 + 16);
      v25 = __OFADD__(v24, 1);
      v26 = v24 + 1;
      if (v25)
        break;
      *(_QWORD *)(v10 + 16) = v26;
LABEL_4:
      v11 = v30 + 1;
      if (v30 + 1 == v9)
        return v10;
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B08];
  }
  return result;
}

uint64_t sub_245E21014(uint64_t a1, int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint8_t *v17;
  uint64_t v18;
  uint8_t *v19;
  void (*v20)(char *, uint64_t);
  uint64_t v21;
  BOOL v22;
  uint64_t result;
  char *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint8_t *v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  int v34;
  int v35;
  uint64_t v36;

  v34 = a3;
  v35 = a2;
  v4 = sub_245E3C844();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_245E3CBC8();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v33 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v30 - v12;
  sub_245E3CAF0();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v3, v4);
  v14 = sub_245E3CBBC();
  v15 = sub_245E3CE14();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    v31 = v8;
    v17 = v16;
    v32 = v3;
    *(_DWORD *)v16 = 134217984;
    v30 = v9;
    v18 = sub_245E3C7F0();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v36 = v18;
    v9 = v30;
    sub_245E3CE80();
    _os_log_impl(&dword_245E10000, v14, v15, "[AchievementEnvironmentCache] Total number of workouts %ld", v17, 0xCu);
    v19 = v17;
    v8 = v31;
    MEMORY[0x24954AA78](v19, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }

  v20 = *(void (**)(char *, uint64_t))(v9 + 8);
  v20(v13, v8);
  if ((v35 & 1) != 0 && (v34 & 1) != 0)
  {
    v21 = sub_245E3C7F0();
    v22 = __OFADD__(v21, 1);
    result = v21 + 1;
    if (!v22)
      return result;
    __break(1u);
  }
  v24 = v33;
  sub_245E3CAF0();
  v25 = sub_245E3CBBC();
  v26 = sub_245E3CE14();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = v8;
    v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v28 = 0;
    _os_log_impl(&dword_245E10000, v25, v26, "[AchievementEnvironmentCache] Session does not meet completion/duration thresholds, returning current count", v28, 2u);
    v29 = v28;
    v8 = v27;
    MEMORY[0x24954AA78](v29, -1, -1);
  }

  v20(v24, v8);
  return sub_245E3C7F0();
}

uint64_t static AchievementWeeklyStreakNotification.makeNotification(with:notificationRecord:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
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
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  void (*v51)(char *, uint64_t, uint64_t);
  NSObject *v52;
  os_log_type_t v53;
  _BOOL4 v54;
  uint8_t *v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  void (*v59)(char *, uint64_t);
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t, uint64_t);
  int v67;
  uint64_t v68;
  _QWORD *v69;
  _QWORD *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  NSObject *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD *v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  int v91;
  int v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  NSObject *v96;
  os_log_type_t v97;
  uint8_t *v98;
  uint64_t v99;
  unsigned __int8 v100;
  NSObject *v101;
  os_log_type_t v102;
  uint8_t *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  id v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  uint64_t v112;
  char *v113;
  void (*v114)(char *, _QWORD *);
  uint64_t v115;
  char v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  NSObject *v121;
  os_log_type_t v122;
  uint8_t *v123;
  char *v124;
  char *v125;
  unsigned __int8 v126;
  unsigned __int8 v127;
  uint64_t v128;
  char *v129;
  NSObject *v130;
  os_log_type_t v131;
  uint8_t *v132;
  char *v133;
  char *v134;
  NSObject *v135;
  os_log_type_t v136;
  _BOOL4 v137;
  uint64_t v138;
  uint8_t *v139;
  uint64_t v140;
  char *v141;
  NSObject *v142;
  os_log_type_t v143;
  uint8_t *v144;
  _QWORD v146[2];
  uint64_t v147;
  char *v148;
  char *v149;
  char *v150;
  char *v151;
  char *v152;
  char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  char *v158;
  char *v159;
  char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  char *v165;
  char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  char *v171;
  char *v172;
  uint64_t v173;
  char *v174;
  uint64_t v175;
  uint64_t v176;
  char *v177;
  char *v178;
  char *v179;
  uint64_t v180;
  uint64_t v181;
  _QWORD *v182;
  void (*v183)(char *, uint64_t);
  uint64_t v184;
  uint64_t v185;

  v169 = a2;
  v155 = sub_245E3C430();
  v154 = *(_QWORD *)(v155 - 8);
  MEMORY[0x24BDAC7A8](v155);
  v153 = (char *)v146 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v157 = sub_245E3C34C();
  v156 = *(_QWORD *)(v157 - 8);
  MEMORY[0x24BDAC7A8](v157);
  v166 = (char *)v146 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v182 = (_QWORD *)sub_245E3C3B8();
  v180 = *(v182 - 1);
  v5 = MEMORY[0x24BDAC7A8](v182);
  v165 = (char *)v146 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v159 = (char *)v146 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v146 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575243B0);
  MEMORY[0x24BDAC7A8](v11);
  v172 = (char *)v146 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_245E3C658();
  v175 = *(_QWORD *)(v13 - 8);
  v176 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v174 = (char *)v146 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575243F8);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v161 = (uint64_t)v146 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v170 = (uint64_t)v146 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v168 = (uint64_t)v146 - v20;
  v162 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575243B8);
  v21 = MEMORY[0x24BDAC7A8](v162);
  v163 = (uint64_t)v146 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x24BDAC7A8](v21);
  v164 = (uint64_t)v146 - v24;
  v25 = MEMORY[0x24BDAC7A8](v23);
  v178 = (char *)v146 - v26;
  MEMORY[0x24BDAC7A8](v25);
  v179 = (char *)v146 - v27;
  v28 = sub_245E3C844();
  v29 = *(_QWORD *)(v28 - 8);
  v30 = MEMORY[0x24BDAC7A8](v28);
  v160 = (char *)v146 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v30);
  v33 = (char *)v146 - v32;
  v34 = sub_245E3CBC8();
  v183 = *(void (**)(char *, uint64_t))(v34 - 8);
  v35 = MEMORY[0x24BDAC7A8](v34);
  v152 = (char *)v146 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = MEMORY[0x24BDAC7A8](v35);
  v151 = (char *)v146 - v38;
  v39 = MEMORY[0x24BDAC7A8](v37);
  v149 = (char *)v146 - v40;
  v41 = MEMORY[0x24BDAC7A8](v39);
  v150 = (char *)v146 - v42;
  v43 = MEMORY[0x24BDAC7A8](v41);
  v148 = (char *)v146 - v44;
  v45 = MEMORY[0x24BDAC7A8](v43);
  v171 = (char *)v146 - v46;
  v47 = MEMORY[0x24BDAC7A8](v45);
  v177 = (char *)v146 - v48;
  MEMORY[0x24BDAC7A8](v47);
  v50 = (char *)v146 - v49;
  sub_245E3CAF0();
  v167 = v29;
  v51 = *(void (**)(char *, uint64_t, uint64_t))(v29 + 16);
  v173 = a1;
  v51(v33, a1, v28);
  v52 = sub_245E3CBBC();
  v53 = sub_245E3CE14();
  v54 = os_log_type_enabled(v52, v53);
  v158 = v10;
  v181 = v34;
  if (v54)
  {
    v55 = (uint8_t *)swift_slowAlloc();
    v147 = swift_slowAlloc();
    v185 = v147;
    *(_DWORD *)v55 = 136315138;
    v146[1] = v55 + 4;
    v51(v160, (uint64_t)v33, v28);
    v56 = sub_245E3CC70();
    v184 = sub_245E19CDC(v56, v57, &v185);
    sub_245E3CE80();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v167 + 8))(v33, v28);
    _os_log_impl(&dword_245E10000, v52, v53, "Evaluating weekly streak notification with environment cache: %s", v55, 0xCu);
    v58 = v147;
    swift_arrayDestroy();
    MEMORY[0x24954AA78](v58, -1, -1);
    MEMORY[0x24954AA78](v55, -1, -1);

    v59 = (void (*)(char *, uint64_t))*((_QWORD *)v183 + 1);
    v60 = v50;
    v61 = v181;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v167 + 8))(v33, v28);

    v59 = (void (*)(char *, uint64_t))*((_QWORD *)v183 + 1);
    v60 = v50;
    v61 = v34;
  }
  v183 = v59;
  v59(v60, v61);
  v63 = v168;
  v62 = v169;
  sub_245E22480(v169, v168, &qword_2575243F8);
  v64 = sub_245E3C868();
  v65 = *(_QWORD *)(v64 - 8);
  v66 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v65 + 48);
  v67 = v66(v63, 1, v64);
  v68 = (uint64_t)v179;
  v69 = v182;
  if (v67 == 1)
  {
    sub_245E1A720(v63, &qword_2575243F8);
    v70 = v69;
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD *))(v180 + 56))(v68, 1, 1, v69);
  }
  else
  {
    v70 = v182;
    sub_245E3C850();
    (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v63, v64);
  }
  v71 = v177;
  v72 = (uint64_t)v178;
  sub_245E3CAF0();
  v73 = v170;
  sub_245E22480(v62, v170, &qword_2575243F8);
  v74 = v68;
  sub_245E22480(v68, v72, &qword_2575243B8);
  v75 = sub_245E3CBBC();
  LODWORD(v169) = sub_245E3CE14();
  if (os_log_type_enabled(v75, (os_log_type_t)v169))
  {
    v76 = swift_slowAlloc();
    v77 = swift_slowAlloc();
    v185 = v77;
    *(_DWORD *)v76 = 136315394;
    v78 = v161;
    sub_245E22480(v73, v161, &qword_2575243F8);
    if (v66(v78, 1, v64) == 1)
    {
      sub_245E1A720(v78, &qword_2575243F8);
      v79 = 0;
      v80 = 0xE000000000000000;
    }
    else
    {
      v79 = sub_245E3C85C();
      v80 = v85;
      (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v78, v64);
    }
    v84 = v175;
    v184 = sub_245E19CDC(v79, v80, &v185);
    sub_245E3CE80();
    swift_bridgeObjectRelease();
    sub_245E1A720(v73, &qword_2575243F8);
    *(_WORD *)(v76 + 12) = 2080;
    v86 = (uint64_t)v178;
    v87 = sub_245E3CE5C();
    v184 = sub_245E19CDC(v87, v88, &v185);
    sub_245E3CE80();
    swift_bridgeObjectRelease();
    sub_245E1A720(v86, &qword_2575243B8);
    _os_log_impl(&dword_245E10000, v75, (os_log_type_t)v169, "Creating achievement notification for %s with previousPresentationDate: %s", (uint8_t *)v76, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24954AA78](v77, -1, -1);
    MEMORY[0x24954AA78](v76, -1, -1);

    v81 = v181;
    v183(v177, v181);
    v82 = (uint64_t)v179;
    v83 = v182;
  }
  else
  {
    sub_245E1A720(v73, &qword_2575243F8);
    sub_245E1A720(v72, &qword_2575243B8);

    v81 = v181;
    v183(v71, v181);
    v82 = v74;
    v83 = v70;
    v84 = v175;
  }
  v89 = (uint64_t)v172;
  sub_245E3C7D8();
  v90 = v176;
  v91 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v84 + 48))(v89, 1, v176);
  v92 = v91;
  if (v91 != 1)
  {
    LODWORD(v179) = v91;
    (*(void (**)(char *, uint64_t, uint64_t))(v84 + 32))(v174, v89, v90);
    v100 = AchievementWeeklyStreak.earnedThisWeek.getter();
    sub_245E3CAF0();
    v101 = sub_245E3CBBC();
    v102 = sub_245E3CE14();
    if (os_log_type_enabled(v101, v102))
    {
      v103 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v103 = 67109120;
      v83 = v182;
      LODWORD(v185) = (v100 & 1) == 0;
      sub_245E3CE80();
      _os_log_impl(&dword_245E10000, v101, v102, "Current streak extendable: %{BOOL}d", v103, 8u);
      MEMORY[0x24954AA78](v103, -1, -1);
    }

    v183(v171, v81);
    v104 = v164;
    sub_245E22480(v82, v164, &qword_2575243B8);
    v105 = v180;
    if ((*(unsigned int (**)(uint64_t, uint64_t, _QWORD *))(v180 + 48))(v104, 1, v83) == 1)
    {
      sub_245E1A720(v104, &qword_2575243B8);
      if ((v100 & 1) != 0)
      {
        v99 = sub_245E3C4C0();
        sub_245E1D134();
        swift_allocError();
        (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v99 - 8) + 104))(v106, *MEMORY[0x24BE89CC0], v99);
        swift_willThrow();
LABEL_31:
        (*(void (**)(char *, uint64_t))(v84 + 8))(v174, v90);
        goto LABEL_43;
      }
      v129 = v150;
      sub_245E3CAF0();
      v130 = sub_245E3CBBC();
      v131 = sub_245E3CE14();
      if (os_log_type_enabled(v130, v131))
      {
        v132 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v132 = 0;
        _os_log_impl(&dword_245E10000, v130, v131, "Streak was extendable with no previous presentation date, returning maintain streak notification", v132, 2u);
        MEMORY[0x24954AA78](v132, -1, -1);
      }

      v183(v129, v81);
      v133 = v174;
      v99 = sub_245E3C64C();
    }
    else
    {
      v124 = v158;
      (*(void (**)(char *, uint64_t, _QWORD *))(v105 + 32))(v158, v104, v83);
      if ((v100 & 1) != 0
        || (v125 = v159,
            sub_245E3C3AC(),
            v126 = Date.isSameWeek(as:)(),
            v105 = v180,
            v127 = v126,
            v182 = *(_QWORD **)(v180 + 8),
            ((void (*)(char *, _QWORD *))v182)(v125, v83),
            (v127 & 1) != 0))
      {
        v99 = sub_245E3C4C0();
        sub_245E1D134();
        swift_allocError();
        (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v99 - 8) + 104))(v128, *MEMORY[0x24BE89CC0], v99);
        swift_willThrow();
        (*(void (**)(char *, _QWORD *))(v105 + 8))(v124, v83);
        goto LABEL_31;
      }
      v141 = v148;
      sub_245E3CAF0();
      v142 = sub_245E3CBBC();
      v143 = sub_245E3CE14();
      if (os_log_type_enabled(v142, v143))
      {
        v144 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v144 = 0;
        _os_log_impl(&dword_245E10000, v142, v143, "Streak was extendable with no previous presentation date this week, returning maintain streak notification", v144, 2u);
        MEMORY[0x24954AA78](v144, -1, -1);
      }

      v183(v141, v81);
      v133 = v174;
      v99 = sub_245E3C64C();
      ((void (*)(char *, _QWORD *))v182)(v158, v83);
    }
    (*(void (**)(char *, uint64_t))(v84 + 8))(v133, v90);
    goto LABEL_43;
  }
  sub_245E1A720(v89, &qword_2575243B0);
  v93 = v163;
  sub_245E22480(v82, v163, &qword_2575243B8);
  v94 = v180;
  if ((*(unsigned int (**)(uint64_t, uint64_t, _QWORD *))(v180 + 48))(v93, 1, v83) == 1)
  {
    sub_245E1A720(v93, &qword_2575243B8);
    v95 = v152;
    sub_245E3CAF0();
    v96 = sub_245E3CBBC();
    v97 = sub_245E3CE14();
    if (os_log_type_enabled(v96, v97))
    {
      v98 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v98 = 0;
      _os_log_impl(&dword_245E10000, v96, v97, "No streak and no previous presentation date, returning goForIt notification", v98, 2u);
      MEMORY[0x24954AA78](v98, -1, -1);
    }

    v183(v95, v81);
    v99 = 0;
    goto LABEL_43;
  }
  LODWORD(v179) = v92;
  (*(void (**)(char *, uint64_t, _QWORD *))(v94 + 32))(v165, v93, v83);
  v107 = objc_msgSend((id)objc_opt_self(), sel_currentCalendar);
  v108 = v153;
  sub_245E3C3F4();

  __swift_instantiateConcreteTypeFromMangledName(&qword_2575243C0);
  v109 = sub_245E3C424();
  v110 = *(_QWORD *)(v109 - 8);
  v111 = (*(unsigned __int8 *)(v110 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v110 + 80);
  v112 = swift_allocObject();
  *(_OWORD *)(v112 + 16) = xmmword_245E3DA50;
  (*(void (**)(unint64_t, _QWORD, uint64_t))(v110 + 104))(v112 + v111, *MEMORY[0x24BDCF220], v109);
  sub_245E20DAC(v112);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  v113 = v159;
  sub_245E3C3AC();
  sub_245E3C3DC();
  swift_bridgeObjectRelease();
  v114 = *(void (**)(char *, _QWORD *))(v94 + 8);
  v114(v113, v83);
  (*(void (**)(char *, uint64_t))(v154 + 8))(v108, v155);
  v115 = sub_245E3C340();
  if ((v116 & 1) != 0)
  {
    v134 = v151;
    sub_245E3CAF0();
    v135 = sub_245E3CBBC();
    v136 = sub_245E3CE14();
    v137 = os_log_type_enabled(v135, v136);
    v138 = v181;
    if (v137)
    {
      v139 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v139 = 0;
      _os_log_impl(&dword_245E10000, v135, v136, "Failed to determine the date interval since the most recent achievement notification", v139, 2u);
      MEMORY[0x24954AA78](v139, -1, -1);
    }

    v183(v134, v138);
    goto LABEL_38;
  }
  v117 = v115;
  sub_245E3CAB4();
  v118 = sub_245E3CAA8();
  v119 = v181;
  if (v117 < v118)
  {
LABEL_38:
    v99 = sub_245E3C4C0();
    sub_245E1D134();
    swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v99 - 8) + 104))(v140, *MEMORY[0x24BE89CC0], v99);
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v156 + 8))(v166, v157);
    v114(v165, v83);
    goto LABEL_43;
  }
  v120 = v149;
  sub_245E3CAF0();
  v121 = sub_245E3CBBC();
  v122 = sub_245E3CE14();
  if (os_log_type_enabled(v121, v122))
  {
    v123 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v123 = 0;
    _os_log_impl(&dword_245E10000, v121, v122, "Last presentation date was >=90 days ago, returning goForIt notification", v123, 2u);
    MEMORY[0x24954AA78](v123, -1, -1);
  }

  v183(v120, v119);
  (*(void (**)(char *, uint64_t))(v156 + 8))(v166, v157);
  v114(v165, v83);
  v99 = 0;
LABEL_43:
  sub_245E1A720(v82, &qword_2575243B8);
  return v99;
}

uint64_t sub_245E22480(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t static RequestCoalescerError.== infix(_:_:)()
{
  return 1;
}

uint64_t RequestCoalescerError.hash(into:)()
{
  return sub_245E3D0D8();
}

uint64_t RequestCoalescerError.hashValue.getter()
{
  sub_245E3D0CC();
  sub_245E3D0D8();
  return sub_245E3D0E4();
}

unint64_t sub_245E22534()
{
  unint64_t result;

  result = qword_257524400;
  if (!qword_257524400)
  {
    result = MEMORY[0x24954A9D0](&protocol conformance descriptor for RequestCoalescerError, &type metadata for RequestCoalescerError);
    atomic_store(result, (unint64_t *)&qword_257524400);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for RequestCoalescerError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_245E225BC + 4 * byte_245E3E240[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_245E225DC + 4 * byte_245E3E245[v4]))();
}

_BYTE *sub_245E225BC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_245E225DC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_245E225E4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_245E225EC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_245E225F4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_245E225FC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for RequestCoalescerError()
{
  return &type metadata for RequestCoalescerError;
}

uint64_t sub_245E22618()
{
  uint64_t v0;

  v0 = sub_245E3C37C();
  __swift_allocate_value_buffer(v0, qword_257525F00);
  __swift_project_value_buffer(v0, (uint64_t)qword_257525F00);
  return sub_245E3C358();
}

id sub_245E22678@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  id result;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  void *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v29;
  char v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  void (*v39)(char *, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  char *v44;
  void (*v45)(char *, uint64_t);
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v2 = v1;
  v49 = a1;
  v3 = sub_245E3C37C();
  v50 = *(_QWORD *)(v3 - 8);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v47 = (char *)&v47 - v8;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v48 = (char *)&v47 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v47 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v47 - v14;
  result = objc_msgSend(v1, sel_uniqueName);
  if (!result)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  v17 = result;
  v18 = sub_245E3CC64();
  v20 = v19;

  v53 = v18;
  v54 = v20;
  v51 = 45;
  v52 = 0xE100000000000000;
  sub_245E18EC8();
  v21 = (_QWORD *)sub_245E3CE98();
  swift_bridgeObjectRelease();
  if (!v21[2])
  {
    swift_bridgeObjectRelease();
    return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v50 + 56))(v49, 1, 1, v3);
  }
  v23 = v21[4];
  v22 = v21[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (v23 == 0xD00000000000001CLL && v22 == 0x8000000245E3EFC0
    || (sub_245E3D06C() & 1) != 0
    || v23 == 0xD00000000000001BLL && v22 == 0x8000000245E3EFE0
    || (sub_245E3D06C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v24 = v50;
    if (qword_257523E90 != -1)
      swift_once();
    __swift_project_value_buffer(v3, (uint64_t)qword_257525F00);
    sub_245E3C370();
    sub_245E3C370();
    v25 = *(void (**)(char *, uint64_t))(v24 + 8);
    v25(v13, v3);
    result = objc_msgSend(v2, sel_uniqueName);
    if (result)
    {
      v26 = result;
      sub_245E3CC64();

      v27 = v49;
      sub_245E3C370();
      swift_bridgeObjectRelease();
      v25(v15, v3);
      v28 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v24 + 56);
      v29 = v27;
      return (id)v28(v29, 0, 1, v3);
    }
    goto LABEL_34;
  }
  if (v23 == 0xD000000000000027 && v22 == 0x8000000245E3ED20)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v30 = sub_245E3D06C();
    swift_bridgeObjectRelease();
    if ((v30 & 1) == 0)
    {
      if (qword_257523E90 != -1)
        swift_once();
      v41 = __swift_project_value_buffer(v3, (uint64_t)qword_257525F00);
      v42 = v50;
      (*(void (**)(char *, uint64_t, uint64_t))(v50 + 16))(v6, v41, v3);
      result = objc_msgSend(v2, sel_uniqueName);
      if (result)
      {
        v43 = result;
        sub_245E3CC64();

        v44 = v47;
        sub_245E3C370();
        swift_bridgeObjectRelease();
        v45 = *(void (**)(char *, uint64_t))(v42 + 8);
        v45(v6, v3);
        v46 = v49;
        sub_245E3C370();
        v45(v44, v3);
        v28 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v42 + 56);
        v29 = v46;
        return (id)v28(v29, 0, 1, v3);
      }
      goto LABEL_36;
    }
  }
  result = objc_msgSend(v2, sel_uniqueName);
  if (!result)
  {
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
    return result;
  }
  v31 = result;
  v32 = sub_245E3CC64();
  v34 = v33;

  v53 = v32;
  v54 = v34;
  v51 = 45;
  v52 = 0xE100000000000000;
  v35 = (_QWORD *)sub_245E3CE98();
  swift_bridgeObjectRelease();
  if (v35[2] >= 3uLL)
  {
    v36 = v35[5];
    v53 = v35[4];
    v54 = v36;
    swift_bridgeObjectRetain();
    sub_245E3CC94();
    v37 = v50;
    if (v35[2] < 3uLL)
    {
      __break(1u);
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_245E3CC94();
      swift_bridgeObjectRelease();
      if (qword_257523E90 == -1)
      {
LABEL_25:
        __swift_project_value_buffer(v3, (uint64_t)qword_257525F00);
        v38 = v48;
        sub_245E3C370();
        sub_245E3C370();
        v39 = *(void (**)(char *, uint64_t))(v37 + 8);
        v39(v38, v3);
        v40 = v49;
        sub_245E3C370();
        swift_bridgeObjectRelease();
        v39(v13, v3);
        v28 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v37 + 56);
        v29 = v40;
        return (id)v28(v29, 0, 1, v3);
      }
    }
    swift_once();
    goto LABEL_25;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v50 + 56))(v49, 1, 1, v3);
  return (id)swift_bridgeObjectRelease();
}

id sub_245E22CF8@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  id result;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  void *v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v2 = v1;
  v28 = a1;
  v3 = sub_245E3C37C();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v27 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v27 - v11;
  result = objc_msgSend(v1, sel_uniqueName);
  if (!result)
  {
    __break(1u);
    goto LABEL_26;
  }
  v14 = result;
  v15 = sub_245E3CC64();
  v17 = v16;

  v31 = v15;
  v32 = v17;
  v29 = 45;
  v30 = 0xE100000000000000;
  sub_245E18EC8();
  v18 = (_QWORD *)sub_245E3CE98();
  swift_bridgeObjectRelease();
  if (!v18[2])
  {
    swift_bridgeObjectRelease();
    v21 = 1;
    v22 = v28;
    return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v22, v21, 1, v3);
  }
  v20 = v18[4];
  v19 = v18[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (v20 == 0xD00000000000001CLL && v19 == 0x8000000245E3EFC0
    || (sub_245E3D06C() & 1) != 0
    || v20 == 0xD00000000000001BLL && v19 == 0x8000000245E3EFE0
    || (sub_245E3D06C() & 1) != 0
    || v20 == 0xD000000000000027 && v19 == 0x8000000245E3ED20)
  {
    swift_bridgeObjectRelease();
LABEL_12:
    if (qword_257523E90 != -1)
      swift_once();
    __swift_project_value_buffer(v3, (uint64_t)qword_257525F00);
    sub_245E3C370();
    v22 = v28;
    sub_245E3C370();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v12, v3);
    goto LABEL_15;
  }
  v23 = sub_245E3D06C();
  swift_bridgeObjectRelease();
  if ((v23 & 1) != 0)
    goto LABEL_12;
  if (qword_257523E90 != -1)
    swift_once();
  v24 = __swift_project_value_buffer(v3, (uint64_t)qword_257525F00);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v24, v3);
  result = objc_msgSend(v2, sel_uniqueName);
  if (result)
  {
    v25 = result;
    sub_245E3CC64();

    sub_245E3C370();
    swift_bridgeObjectRelease();
    v26 = *(void (**)(char *, uint64_t))(v4 + 8);
    v26(v7, v3);
    v22 = v28;
    sub_245E3C370();
    v26(v10, v3);
LABEL_15:
    v21 = 0;
    return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v22, v21, 1, v3);
  }
LABEL_26:
  __break(1u);
  return result;
}

id sub_245E230DC@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  id result;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  void *v29;
  char v30;
  uint64_t v31;
  char *v32;
  char *v33;
  void *v34;
  void (*v35)(char *, uint64_t);
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v2 = v1;
  v39 = a1;
  v3 = sub_245E3C37C();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v38 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v36 - v8;
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v36 - v11;
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v36 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v36 - v16;
  result = objc_msgSend(v1, sel_uniqueName);
  if (!result)
  {
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v19 = result;
  v20 = sub_245E3CC64();
  v22 = v21;

  v42 = v20;
  v43 = v22;
  v40 = 45;
  v41 = 0xE100000000000000;
  sub_245E18EC8();
  v23 = (_QWORD *)sub_245E3CE98();
  swift_bridgeObjectRelease();
  if (!v23[2])
  {
    swift_bridgeObjectRelease();
    v26 = 1;
    v27 = v39;
    return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v27, v26, 1, v3);
  }
  v37 = v9;
  v25 = v23[4];
  v24 = v23[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (v25 == 0xD00000000000001CLL && v24 == 0x8000000245E3EFC0
    || (sub_245E3D06C() & 1) != 0
    || v25 == 0xD00000000000001BLL && v24 == 0x8000000245E3EFE0
    || (sub_245E3D06C() & 1) != 0
    || v25 == 0xD000000000000027 && v24 == 0x8000000245E3ED20)
  {
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  v30 = sub_245E3D06C();
  swift_bridgeObjectRelease();
  if ((v30 & 1) != 0)
  {
LABEL_12:
    if (qword_257523E90 != -1)
      swift_once();
    __swift_project_value_buffer(v3, (uint64_t)qword_257525F00);
    sub_245E3C370();
    sub_245E3C370();
    v28 = *(void (**)(char *, uint64_t))(v4 + 8);
    v28(v12, v3);
    result = objc_msgSend(v2, sel_uniqueName);
    if (result)
    {
      v29 = result;
      sub_245E3CC64();

      sub_245E3C370();
      swift_bridgeObjectRelease();
      v28(v15, v3);
      v27 = v39;
      sub_245E3C370();
      v28(v17, v3);
LABEL_16:
      v26 = 0;
      return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v27, v26, 1, v3);
    }
    goto LABEL_27;
  }
  if (qword_257523E90 != -1)
    swift_once();
  v31 = __swift_project_value_buffer(v3, (uint64_t)qword_257525F00);
  v32 = v38;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v38, v31, v3);
  result = objc_msgSend(v2, sel_uniqueName);
  v33 = v37;
  if (result)
  {
    v34 = result;
    sub_245E3CC64();

    sub_245E3C370();
    swift_bridgeObjectRelease();
    v35 = *(void (**)(char *, uint64_t))(v4 + 8);
    v35(v32, v3);
    v27 = v39;
    sub_245E3C370();
    v35(v33, v3);
    goto LABEL_16;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_245E23600(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    v3 = sub_245E3CEE0();
    v5 = v4;
    v6 = sub_245E3CF34();
    v8 = MEMORY[0x24954A3C4](v3, v5, v6, v7);
    swift_bridgeObjectRelease();
    if ((v8 & 1) != 0)
    {
LABEL_3:
      sub_245E24A90(v3, v5, v2 != 0);
      return 0;
    }
LABEL_7:
    sub_245E23EE8(v3, v5, v2 != 0, a1);
    v9 = v13;
    sub_245E24A90(v3, v5, v2 != 0);
    return v9;
  }
  result = sub_245E24150(a1);
  if ((v12 & 1) == 0)
  {
    v5 = v11;
    if (*(_DWORD *)(a1 + 36) == (_DWORD)v11)
    {
      v3 = result;
      if (result == 1 << *(_BYTE *)(a1 + 32))
        goto LABEL_3;
      goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_245E2370C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  int64_t v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  void *v32;

  v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_245E3CEEC();
    sub_245E24A9C(0, (unint64_t *)&qword_257524380);
    sub_245E1A6D0();
    sub_245E3CDF0();
    v1 = v27;
    v26 = v28;
    v2 = v29;
    v3 = v30;
    v4 = v31;
  }
  else
  {
    v5 = -1 << *(_BYTE *)(a1 + 32);
    v26 = a1 + 56;
    v6 = ~v5;
    v7 = -v5;
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v4 = v8 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v2 = v6;
    v3 = 0;
  }
  v24 = v2;
  v25 = (unint64_t)(v2 + 64) >> 6;
  while (v1 < 0)
  {
    if (!sub_245E3CF28())
      goto LABEL_42;
    sub_245E24A9C(0, (unint64_t *)&qword_257524380);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v12 = v32;
    swift_unknownObjectRelease();
    v11 = v3;
    v9 = v4;
    if (!v32)
      goto LABEL_42;
LABEL_33:
    v16 = objc_msgSend(v12, sel_uniqueName, v24);
    if (v16)
    {
      v17 = v16;
      v18 = sub_245E3CC64();
      v20 = v19;

    }
    else
    {
      v18 = 0;
      v20 = 0;
    }
    sub_245E3CAB4();
    v21 = sub_245E3CA90();
    if (v20)
    {
      if (v18 == v21 && v20 == v22)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_42:
        sub_245E1A718();
        return;
      }
      v23 = sub_245E3D06C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v23 & 1) != 0)
        goto LABEL_42;

    }
    else
    {

      swift_bridgeObjectRelease();
    }
    v3 = v11;
    v4 = v9;
  }
  if (v4)
  {
    v9 = (v4 - 1) & v4;
    v10 = __clz(__rbit64(v4)) | (v3 << 6);
    v11 = v3;
LABEL_32:
    v12 = *(id *)(*(_QWORD *)(v1 + 48) + 8 * v10);
    if (!v12)
      goto LABEL_42;
    goto LABEL_33;
  }
  v13 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v13 >= v25)
      goto LABEL_42;
    v14 = *(_QWORD *)(v26 + 8 * v13);
    v11 = v3 + 1;
    if (!v14)
    {
      v11 = v3 + 2;
      if (v3 + 2 >= v25)
        goto LABEL_42;
      v14 = *(_QWORD *)(v26 + 8 * v11);
      if (!v14)
      {
        v11 = v3 + 3;
        if (v3 + 3 >= v25)
          goto LABEL_42;
        v14 = *(_QWORD *)(v26 + 8 * v11);
        if (!v14)
        {
          v11 = v3 + 4;
          if (v3 + 4 >= v25)
            goto LABEL_42;
          v14 = *(_QWORD *)(v26 + 8 * v11);
          if (!v14)
          {
            v11 = v3 + 5;
            if (v3 + 5 >= v25)
              goto LABEL_42;
            v14 = *(_QWORD *)(v26 + 8 * v11);
            if (!v14)
            {
              v15 = v3 + 6;
              while (v25 != v15)
              {
                v14 = *(_QWORD *)(v26 + 8 * v15++);
                if (v14)
                {
                  v11 = v15 - 1;
                  goto LABEL_31;
                }
              }
              goto LABEL_42;
            }
          }
        }
      }
    }
LABEL_31:
    v9 = (v14 - 1) & v14;
    v10 = __clz(__rbit64(v14)) + (v11 << 6);
    goto LABEL_32;
  }
  __break(1u);
}

uint64_t static ACHAchievement.makeWeeklyStreakAchievement(with:environmentCache:)(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v6;
  uint64_t v7;

  sub_245E2370C(a1);
  if (v1)
  {
    v2 = v1;
    v3 = sub_245E24538();
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE017A8]), sel_initWithTemplate_relevantEarnedInstance_earnedInstanceCount_, v2, v3, v3 != 0);

    return (uint64_t)v4;
  }
  else
  {
    v6 = sub_245E3C4C0();
    sub_245E1D134();
    swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v7, *MEMORY[0x24BE89CB8], v6);
    return swift_willThrow();
  }
}

_QWORD *static ACHAchievement.makeAchievement(for:with:progressUpdates:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint8_t *v22;
  os_log_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t *v28;
  os_log_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v6 = (_QWORD *)sub_245E3CBC8();
  v7 = *(v6 - 1);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_245E241D8(a3, a1, a2);
  v11 = v10;
  swift_bridgeObjectRelease();
  if (v11)
  {
    v12 = swift_bridgeObjectRetain();
    v13 = (void *)sub_245E23600(v12);
    swift_bridgeObjectRelease();
    if (v13)
    {
      v14 = sub_245E2473C(a1, a2, v13);
      v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE017A8]), sel_initWithTemplate_relevantEarnedInstance_earnedInstanceCount_, v11, v14, v14 != 0);
      v15 = objc_msgSend(v13, sel_progressQuantity);
      objc_msgSend(v6, sel_setProgress_, v15);

      v16 = objc_msgSend(v13, sel_goalQuantity);
      objc_msgSend(v6, sel_setGoal_, v16);

    }
    else
    {
      sub_245E3CAF0();
      swift_bridgeObjectRetain_n();
      v19 = sub_245E3CBBC();
      v20 = sub_245E3CE08();
      if (os_log_type_enabled(v19, v20))
      {
        v21 = swift_slowAlloc();
        v29 = v19;
        v22 = (uint8_t *)v21;
        v30 = swift_slowAlloc();
        v32 = v30;
        *(_DWORD *)v22 = 136315138;
        v28 = v22 + 4;
        swift_bridgeObjectRetain();
        v31 = sub_245E19CDC(a1, a2, &v32);
        sub_245E3CE80();
        swift_bridgeObjectRelease_n();
        v23 = v29;
        _os_log_impl(&dword_245E10000, v29, v20, "No progress updates found, unable to populate progress info for %s", v22, 0xCu);
        v24 = v30;
        swift_arrayDestroy();
        MEMORY[0x24954AA78](v24, -1, -1);
        MEMORY[0x24954AA78](v22, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      (*(void (**)(char *, _QWORD *))(v7 + 8))(v9, v6);
      v25 = sub_245E3C4C0();
      sub_245E1D134();
      swift_allocError();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v25 - 8) + 104))(v26, *MEMORY[0x24BE89CB0], v25);
      swift_willThrow();

    }
  }
  else
  {
    v17 = sub_245E3C4C0();
    sub_245E1D134();
    swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v17 - 8) + 104))(v18, *MEMORY[0x24BE89CB8], v17);
    swift_willThrow();
  }
  return v6;
}

void sub_245E23EE8(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  void *v4;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  char v11;
  uint64_t v12;
  id v13;
  char v14;
  id v15;
  void *v16;

  v6 = a1;
  if ((a4 & 0xC000000000000001) == 0)
  {
    if ((a3 & 1) != 0)
      goto LABEL_13;
    if (a1 < 0 || 1 << *(_BYTE *)(a4 + 32) <= a1)
    {
      __break(1u);
    }
    else if (((*(_QWORD *)(a4 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2)
        goto LABEL_20;
      __break(1u);
LABEL_13:
      if (sub_245E3CF04() == *(_DWORD *)(a4 + 36))
      {
        sub_245E3CF10();
        sub_245E24A9C(0, (unint64_t *)&qword_257524408);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v4 = v16;
        swift_unknownObjectRelease();
        v8 = sub_245E3CE44();
        v9 = -1 << *(_BYTE *)(a4 + 32);
        v6 = v8 & ~v9;
        if (((*(_QWORD *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
        {
          v10 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
          v11 = sub_245E3CE50();

          if ((v11 & 1) == 0)
          {
            v12 = ~v9;
            do
            {
              v6 = (v6 + 1) & v12;
              if (((*(_QWORD *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
                goto LABEL_24;
              v13 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
              v14 = sub_245E3CE50();

            }
            while ((v14 & 1) == 0);
          }

LABEL_20:
          v15 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
          return;
        }
LABEL_24:

        __break(1u);
        goto LABEL_25;
      }
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }
    __break(1u);
    goto LABEL_23;
  }
  if ((a3 & 1) == 0)
  {
LABEL_25:
    __break(1u);
    return;
  }
  if (a4 < 0)
    v7 = a4;
  else
    v7 = a4 & 0xFFFFFFFFFFFFFF8;
  MEMORY[0x24954A3E8](a1, a2, v7);
  sub_245E24A9C(0, (unint64_t *)&qword_257524408);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
}

uint64_t sub_245E24150(uint64_t a1)
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

void sub_245E241D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  int64_t v15;
  int64_t v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  unint64_t v33;
  void *v34;

  v3 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_245E3CEEC();
    sub_245E24A9C(0, (unint64_t *)&qword_257524380);
    sub_245E1A6D0();
    sub_245E3CDF0();
    v3 = v29;
    v26 = v30;
    v4 = v31;
    v5 = v32;
    v6 = v33;
  }
  else
  {
    v7 = -1 << *(_BYTE *)(a1 + 32);
    v26 = a1 + 56;
    v8 = ~v7;
    v9 = -v7;
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v6 = v10 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v4 = v8;
    v5 = 0;
  }
  v24 = v4;
  v25 = (unint64_t)(v4 + 64) >> 6;
  while (v3 < 0)
  {
    if (!sub_245E3CF28())
      goto LABEL_37;
    sub_245E24A9C(0, (unint64_t *)&qword_257524380);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v14 = v34;
    swift_unknownObjectRelease();
    v12 = v6;
    if (!v34)
      goto LABEL_37;
LABEL_33:
    v19 = objc_msgSend(v14, sel_uniqueName, v24);
    if (v19)
    {
      v20 = v19;
      v21 = sub_245E3CC64();
      v23 = v22;

      if (v21 == a2 && v23 == a3)
      {
        swift_bridgeObjectRelease();
LABEL_37:
        sub_245E1A718();
        return;
      }
      v11 = sub_245E3D06C();
      swift_bridgeObjectRelease();
      if ((v11 & 1) != 0)
        goto LABEL_37;
    }

    v6 = v12;
  }
  if (v6)
  {
    v12 = (v6 - 1) & v6;
    v13 = __clz(__rbit64(v6)) | (v5 << 6);
LABEL_32:
    v14 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
    if (!v14)
      goto LABEL_37;
    goto LABEL_33;
  }
  v15 = v5 + 1;
  if (!__OFADD__(v5, 1))
  {
    if (v15 >= v25)
      goto LABEL_37;
    v16 = v5;
    v17 = *(_QWORD *)(v26 + 8 * v15);
    ++v5;
    if (!v17)
    {
      v5 = v15 + 1;
      if (v15 + 1 >= v25)
        goto LABEL_37;
      v17 = *(_QWORD *)(v26 + 8 * v5);
      if (!v17)
      {
        v5 = v15 + 2;
        if (v15 + 2 >= v25)
          goto LABEL_37;
        v17 = *(_QWORD *)(v26 + 8 * v5);
        if (!v17)
        {
          v5 = v15 + 3;
          if (v15 + 3 >= v25)
            goto LABEL_37;
          v17 = *(_QWORD *)(v26 + 8 * v5);
          if (!v17)
          {
            v5 = v15 + 4;
            if (v15 + 4 >= v25)
              goto LABEL_37;
            v17 = *(_QWORD *)(v26 + 8 * v5);
            if (!v17)
            {
              v18 = v16 + 6;
              while (v25 != v18)
              {
                v17 = *(_QWORD *)(v26 + 8 * v18++);
                if (v17)
                {
                  v5 = v18 - 1;
                  goto LABEL_31;
                }
              }
              goto LABEL_37;
            }
          }
        }
      }
    }
LABEL_31:
    v12 = (v17 - 1) & v17;
    v13 = __clz(__rbit64(v17)) + (v5 << 6);
    goto LABEL_32;
  }
  __break(1u);
}

id sub_245E24538()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v0 = sub_245E3CBC8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_245E3C7E4() < 1)
  {
    sub_245E3CAF0();
    v6 = sub_245E3CBBC();
    v7 = sub_245E3CE14();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      v9 = swift_slowAlloc();
      v14 = v9;
      *(_DWORD *)v8 = 136315138;
      sub_245E3CAB4();
      v10 = sub_245E3CA60();
      v13 = sub_245E19CDC(v10, v11, &v14);
      sub_245E3CE80();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_245E10000, v6, v7, "longestWeeklyStreak is 0, not adding an earned instance for %s", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24954AA78](v9, -1, -1);
      MEMORY[0x24954AA78](v8, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return 0;
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE01830]), sel_init);
    sub_245E3CAB4();
    sub_245E3CA90();
    v5 = (void *)sub_245E3CC40();
    swift_bridgeObjectRelease();
    objc_msgSend(v4, sel_setTemplateUniqueName_, v5);

  }
  return v4;
}

id sub_245E2473C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void (*v26)(unint64_t, _QWORD, uint64_t);
  void *v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v30 = sub_245E3C3B8();
  v34 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_245E3C430();
  v31 = *(_QWORD *)(v6 - 8);
  v32 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = sub_245E3C34C();
  v33 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = objc_msgSend(a3, sel_progressQuantity);
  if (v11)
  {
    sub_245E1BABC();
    v13 = v12;

  }
  else
  {
    v13 = 0;
  }
  v14 = objc_msgSend(a3, sel_goalQuantity);
  if (!v14)
  {
    if (v11)
      return 0;
LABEL_10:
    v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE01830]), sel_init);
    v19 = (void *)sub_245E3CC40();
    objc_msgSend(v18, sel_setTemplateUniqueName_, v19);

    sub_245E3C418();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2575243C0);
    v20 = sub_245E3C424();
    v21 = *(_QWORD *)(v20 - 8);
    v22 = *(_QWORD *)(v21 + 72);
    v23 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
    v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_245E3E350;
    v25 = v24 + v23;
    v26 = *(void (**)(unint64_t, _QWORD, uint64_t))(v21 + 104);
    v26(v25, *MEMORY[0x24BDCF240], v20);
    v26(v25 + v22, *MEMORY[0x24BDCF250], v20);
    v26(v25 + 2 * v22, *MEMORY[0x24BDCF220], v20);
    sub_245E20DAC(v24);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    sub_245E3C3AC();
    sub_245E3C3E8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v5, v30);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v32);
    v27 = (void *)sub_245E3C334();
    objc_msgSend(v18, sel_setEarnedDateComponents_, v27);

    (*(void (**)(char *, uint64_t))(v33 + 8))(v10, v29);
    return v18;
  }
  v15 = v14;
  sub_245E1BABC();
  v17 = v16;

  v18 = 0;
  if (v11 && v13 == v17)
    goto LABEL_10;
  return v18;
}

uint64_t sub_245E24A90(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_245E24A9C(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

unint64_t SeymourAchievementTemplate.toACHTemplate()()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = sub_245E3C43C();
  v2 = v1;
  v3 = objc_allocWithZone(MEMORY[0x24BE01810]);
  v4 = (void *)sub_245E3C388();
  sub_245E24C30(v0, v2);
  v5 = objc_msgSend(v3, sel_initWithData_, v4);

  if (v5)
  {
    v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE01850]), sel_initWithCodable_, v5);
    if (v6)
    {
      v2 = (unint64_t)v6;
    }
    else
    {
      v2 = sub_245E3C4C0();
      sub_245E1D134();
      swift_allocError();
      (*(void (**)(uint64_t, _QWORD, unint64_t))(*(_QWORD *)(v2 - 8) + 104))(v9, *MEMORY[0x24BE89CA8], v2);
      swift_willThrow();
    }

  }
  else
  {
    v7 = sub_245E3C4C0();
    sub_245E1D134();
    swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v8, *MEMORY[0x24BE89C98], v7);
    swift_willThrow();
  }
  return v2;
}

uint64_t sub_245E24C30(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

Swift::Void __swiftcall ACHAchievement.updateBundleURLs()()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(char *, uint64_t, uint64_t);
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257524208);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v3);
  v8 = (char *)&v18 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v18 - v9;
  v11 = objc_msgSend(v0, sel_template);
  sub_245E22678((uint64_t)v10);
  v12 = sub_245E3C37C();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
  v15 = 0;
  if (v14(v10, 1, v12) != 1)
  {
    v15 = (void *)sub_245E3C364();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
  }
  objc_msgSend(v1, sel_setLocalizationBundleURL_, v15);

  sub_245E22CF8((uint64_t)v8);
  if (v14(v8, 1, v12) == 1)
  {
    v16 = 0;
  }
  else
  {
    v16 = (void *)sub_245E3C364();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v12);
  }
  objc_msgSend(v1, sel_setResourceBundleURL_, v16);

  sub_245E230DC((uint64_t)v5);
  if (v14(v5, 1, v12) == 1)
  {
    v17 = 0;
  }
  else
  {
    v17 = (void *)sub_245E3C364();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v5, v12);
  }
  objc_msgSend(v1, sel_setPropertyListBundleURL_, v17);

  objc_msgSend(v1, sel_setStickerBundleURL_, 0);
}

uint64_t storeEnumTagSinglePayload for NotificationSettingError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_245E24ED4 + 4 * byte_245E3E365[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_245E24F08 + 4 * byte_245E3E360[v4]))();
}

uint64_t sub_245E24F08(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_245E24F10(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x245E24F18);
  return result;
}

uint64_t sub_245E24F24(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x245E24F2CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_245E24F30(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245E24F38(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for NotificationSettingError()
{
  return &type metadata for NotificationSettingError;
}

unint64_t sub_245E24F58()
{
  unint64_t result;

  result = qword_257524410;
  if (!qword_257524410)
  {
    result = MEMORY[0x24954A9D0](&unk_245E3E3CC, &type metadata for NotificationSettingError);
    atomic_store(result, (unint64_t *)&qword_257524410);
  }
  return result;
}

uint64_t ACAccountStore.iTunesAccount(altDSID:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[17] = a2;
  v3[18] = v2;
  v3[16] = a1;
  return swift_task_switch();
}

uint64_t sub_245E24FB8()
{
  uint64_t v0;
  id v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD *v7;
  _BYTE *v9;

  v1 = objc_msgSend(*(id *)(v0 + 144), sel_ams_mediaType);
  *(_QWORD *)(v0 + 152) = v1;
  if (v1)
  {
    v2 = v1;
    v3 = *(void **)(v0 + 144);
    v4 = (void *)sub_245E3CC40();
    v5 = objc_msgSend(v3, sel_ams_iTunesAccountWithAltDSID_forMediaType_, v4, v2);
    *(_QWORD *)(v0 + 160) = v5;

    *(_QWORD *)(v0 + 56) = v0 + 120;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_245E25104;
    v6 = swift_continuation_init();
    *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
    v7 = (_QWORD *)(v0 + 80);
    v7[1] = 0x40000000;
    v7[2] = sub_245E251EC;
    v7[3] = &block_descriptor_0;
    v7[4] = v6;
    objc_msgSend(v5, sel_resultWithCompletion_, v7);
    return swift_continuation_await();
  }
  else
  {
    sub_245E166C8();
    swift_allocError();
    *v9 = 1;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_245E25104()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 168) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_245E25164()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 160);

  v2 = *(_QWORD *)(v0 + 120);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

uint64_t sub_245E251A4()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 160);
  v2 = *(void **)(v0 + 152);
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245E251EC(uint64_t result, void *a2, void *a3)
{
  _QWORD *v4;
  id v5;
  id v6;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25441B628);
    swift_allocError();
    *v4 = a3;
    v5 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else if (a2)
  {
    **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(result + 32) + 64) + 40) = a2;
    v6 = a2;
    return swift_continuation_throwingResume();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t ACAccountStore.activeiTunesAccount()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 128) = v0;
  return swift_task_switch();
}

uint64_t sub_245E25290()
{
  uint64_t v0;
  id v1;
  id v2;
  uint64_t v3;
  _QWORD *v4;
  _BYTE *v6;

  v1 = objc_msgSend(*(id *)(v0 + 128), sel_ams_mediaType);
  *(_QWORD *)(v0 + 136) = v1;
  if (v1)
  {
    v2 = objc_msgSend(*(id *)(v0 + 128), sel_ams_activeiTunesAccountForMediaType_, v1);
    *(_QWORD *)(v0 + 144) = v2;
    *(_QWORD *)(v0 + 56) = v0 + 120;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_245E253B4;
    v3 = swift_continuation_init();
    *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
    v4 = (_QWORD *)(v0 + 80);
    v4[1] = 0x40000000;
    v4[2] = sub_245E251EC;
    v4[3] = &block_descriptor_2;
    v4[4] = v3;
    objc_msgSend(v2, sel_resultWithCompletion_, v4);
    return swift_continuation_await();
  }
  else
  {
    sub_245E166C8();
    swift_allocError();
    *v6 = 1;
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_245E253B4()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 152) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_245E25414()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 144);

  v2 = *(_QWORD *)(v0 + 120);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

uint64_t sub_245E25454()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 144);
  v2 = *(void **)(v0 + 136);
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t ACAccountStore.primaryAppleAccount()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 128) = v0;
  return swift_task_switch();
}

uint64_t sub_245E254B4()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = (void *)v0[16];
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_245E25548;
  v2 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v3 = v0 + 10;
  v3[1] = 0x40000000;
  v3[2] = sub_245E2566C;
  v3[3] = &block_descriptor_4;
  v3[4] = v2;
  objc_msgSend(v1, sel_aa_primaryAppleAccountWithCompletion_, v3);
  return swift_continuation_await();
}

uint64_t sub_245E25548()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 136) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_245E255A8()
{
  uint64_t v0;
  _BYTE *v2;

  if (!*(_QWORD *)(v0 + 120))
  {
    sub_245E166C8();
    swift_allocError();
    *v2 = 2;
    swift_willThrow();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245E25630()
{
  uint64_t v0;

  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245E2566C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  _QWORD *v5;
  id v6;
  uint64_t v8;
  id v9;
  void *v10;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25441B628);
    swift_allocError();
    *v5 = a3;
    v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    v10 = a2;
    v8 = *(_QWORD *)(*(_QWORD *)(v3 + 64) + 40);
    v9 = a2;
    sub_245E25F3C((uint64_t)&v10, v8, &qword_25441B608);
    return swift_continuation_throwingResume();
  }
}

uint64_t ACAccountStore.appleAccount(altDSID:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[17] = a2;
  v3[18] = v2;
  v3[16] = a1;
  return swift_task_switch();
}

uint64_t sub_245E25730()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = (void *)v0[18];
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_245E257C4;
  v2 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v3 = v0 + 10;
  v3[1] = 0x40000000;
  v3[2] = sub_245E2592C;
  v3[3] = &block_descriptor_6;
  v3[4] = v2;
  objc_msgSend(v1, sel_aa_appleAccountsWithCompletion_, v3);
  return swift_continuation_await();
}

uint64_t sub_245E257C4()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 152) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_245E25824()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _BYTE *v6;

  v1 = *(_QWORD *)(v0 + 120);
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + 128);
    v3 = *(_QWORD *)(v0 + 136);
    swift_bridgeObjectRetain();
    v4 = sub_245E25B90(v1, v2, v3);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v4)
      return (*(uint64_t (**)(void *))(v0 + 8))(v4);
  }
  sub_245E166C8();
  swift_allocError();
  *v6 = 1;
  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245E258F0()
{
  uint64_t v0;

  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245E2592C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  _QWORD *v5;
  id v6;
  uint64_t v8;
  uint64_t v9;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25441B628);
    swift_allocError();
    *v5 = a3;
    v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    v8 = 0;
    if (a2)
    {
      sub_245E25F00();
      v8 = sub_245E3CD24();
    }
    v9 = v8;
    sub_245E25F3C((uint64_t)&v9, *(_QWORD *)(*(_QWORD *)(v3 + 64) + 40), &qword_257524478);
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_245E259E8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v6;
  _QWORD *v7;

  v6 = *v2;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_245E25F80;
  v7[17] = a2;
  v7[18] = v6;
  v7[16] = a1;
  return swift_task_switch();
}

uint64_t sub_245E25A5C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *v0;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_245E175B4;
  v3[16] = v2;
  return swift_task_switch();
}

uint64_t sub_245E25ABC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *v0;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_245E25F80;
  v3[16] = v2;
  return swift_task_switch();
}

uint64_t sub_245E25B1C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v6;
  _QWORD *v7;

  v6 = *v2;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_245E25F80;
  v7[17] = a2;
  v7[18] = v6;
  v7[16] = a1;
  return swift_task_switch();
}

void *sub_245E25B90(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;

  if (a1 >> 62)
    goto LABEL_20;
  v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; v5 = sub_245E3CFD0())
  {
    v6 = 4;
    while (1)
    {
      v7 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x24954A43C](v6 - 4, a1) : *(id *)(a1 + 8 * v6);
      v8 = v7;
      v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1))
        break;
      v10 = objc_msgSend(v7, sel_aa_altDSID);
      if (v10)
      {
        v11 = v10;
        v12 = sub_245E3CC64();
        v14 = v13;

        if (v12 == a2 && v14 == a3)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v8;
        }
        v16 = sub_245E3D06C();
        swift_bridgeObjectRelease();
        if ((v16 & 1) != 0)
          goto LABEL_18;
      }

      ++v6;
      if (v9 == v5)
        goto LABEL_21;
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_21:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t dispatch thunk of AccountStoring.iTunesAccount(altDSID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 8) + *(_QWORD *)(a4 + 8));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_245E25F84;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of AccountStoring.activeiTunesAccount()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 16) + *(_QWORD *)(a2 + 16));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_245E176DC;
  return v7(a1, a2);
}

uint64_t dispatch thunk of AccountStoring.primaryAppleAccount()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 24) + *(_QWORD *)(a2 + 24));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_245E25F84;
  return v7(a1, a2);
}

uint64_t dispatch thunk of AccountStoring.appleAccount(altDSID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 32) + *(_QWORD *)(a4 + 32));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_245E25F84;
  return v11(a1, a2, a3, a4);
}

unint64_t sub_245E25F00()
{
  unint64_t result;

  result = qword_25441B600;
  if (!qword_25441B600)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25441B600);
  }
  return result;
}

uint64_t sub_245E25F3C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t ACAccount.type.getter@<X0>(char *a1@<X8>)
{
  void *v1;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  uint64_t v13;
  uint64_t result;
  char v15;
  char v16;

  v3 = objc_msgSend(v1, sel_accountType);
  if (v3 && (v4 = v3, v5 = objc_msgSend(v3, sel_identifier), v4, v5))
  {
    v6 = sub_245E3CC64();
    v8 = v7;

    v9 = sub_245E3CC64();
    if (v8)
    {
      if (v9 == v6 && v8 == v10)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v12 = sub_245E3D06C();
        swift_bridgeObjectRelease();
        if ((v12 & 1) == 0)
        {
          if (sub_245E3CC64() == v6 && v8 == v13)
          {
            result = swift_bridgeObjectRelease_n();
LABEL_19:
            v15 = 1;
            goto LABEL_15;
          }
          v16 = sub_245E3D06C();
          swift_bridgeObjectRelease();
          result = swift_bridgeObjectRelease();
          if ((v16 & 1) != 0)
            goto LABEL_19;
          goto LABEL_14;
        }
      }
      result = swift_bridgeObjectRelease();
      v15 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    sub_245E3CC64();
  }
  swift_bridgeObjectRelease();
  sub_245E3CC64();
  result = swift_bridgeObjectRelease();
LABEL_14:
  v15 = 2;
LABEL_15:
  *a1 = v15;
  return result;
}

uint64_t sub_245E2610C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v8;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v8 = a2;
  sub_245E278C0(a1, (uint64_t)sub_245E27880, 0, isUniquelyReferenced_nonNull_native, (uint64_t)&v8);
  v6 = v8;
  swift_bridgeObjectRelease();
  if (v2)
    swift_bridgeObjectRelease();
  return v6;
}

void ACAccount.init(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v21[16];

  v2 = sub_245E3C6AC();
  MEMORY[0x24BDAC7A8](v2);
  v4 = &v21[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_245E3C5E0();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_245E3CC64();
    sub_245E3CC64();
    v5 = objc_allocWithZone(MEMORY[0x24BDB43A8]);
    v6 = (void *)sub_245E3CC40();
    swift_bridgeObjectRelease();
    v7 = (void *)sub_245E3CC40();
    swift_bridgeObjectRelease();
    v8 = objc_msgSend(v5, sel_initWithIdentifier_description_, v6, v7);

    if (v8)
      goto LABEL_5;
    __break(1u);
  }
  sub_245E3CC64();
  sub_245E3CC64();
  v9 = objc_allocWithZone(MEMORY[0x24BDB43A8]);
  v10 = (void *)sub_245E3CC40();
  swift_bridgeObjectRelease();
  v11 = (void *)sub_245E3CC40();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v9, sel_initWithIdentifier_description_, v10, v11);

  if (!v8)
  {
LABEL_14:
    __break(1u);
    return;
  }
LABEL_5:
  sub_245E26468((uint64_t)v4);
  v12 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithAccountType_, v8);
  if (!v12)
  {
    __break(1u);
    goto LABEL_14;
  }
  v13 = v12;
  sub_245E3C580();
  if (v14)
  {
    v15 = (void *)sub_245E3CC40();
    swift_bridgeObjectRelease();
  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(v13, sel_setIdentifier_, v15);

  sub_245E3C610();
  if (v16)
  {
    v17 = (void *)sub_245E3CC40();
    swift_bridgeObjectRelease();
  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(v13, sel_setUsername_, v17);

  v18 = sub_245E264A4();
  v19 = MEMORY[0x24BDAC7A8](v18);
  *(_QWORD *)&v21[-16] = v13;
  sub_245E28288(v19, (void (*)(uint64_t, uint64_t, _BYTE *))sub_245E27108);

  v20 = sub_245E3C628();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(a1, v20);
  swift_bridgeObjectRelease();
}

uint64_t sub_245E26468(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_245E3C6AC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_245E264A4()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
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
  uint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  __int128 v96;
  uint64_t v97;
  _OWORD v98[2];
  __int128 v99;
  __int128 v100;

  v0 = sub_245E3C9B8();
  v92 = *(_QWORD *)(v0 - 8);
  v93 = v0;
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v89 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_245E3C7CC();
  v90 = *(_QWORD *)(v3 - 8);
  v91 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v89 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v94 = sub_245E3C6AC();
  v6 = MEMORY[0x24BDAC7A8](v94);
  v8 = (char *)&v89 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v89 - v9;
  v11 = sub_245E2B89C(MEMORY[0x24BEE4AF8]);
  v12 = sub_245E3CC64();
  v14 = v13;
  v15 = sub_245E3C61C();
  v17 = MEMORY[0x24BEE0D00];
  if (v16)
  {
    *((_QWORD *)&v100 + 1) = MEMORY[0x24BEE0D00];
    *(_QWORD *)&v99 = v15;
    *((_QWORD *)&v99 + 1) = v16;
  }
  else
  {
    v99 = 0u;
    v100 = 0u;
  }
  sub_245E18A7C((uint64_t)&v99, (uint64_t)&v96);
  if (v97)
  {
    sub_245E28494(&v96, v98);
    sub_245E1A654((uint64_t)v98, (uint64_t)&v96);
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v95 = v11;
    sub_245E27C14(&v96, v12, v14, isUniquelyReferenced_nonNull_native);
    v11 = v95;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
  }
  else
  {
    sub_245E1A720((uint64_t)&v96, qword_25441B630);
  }
  swift_bridgeObjectRelease();
  sub_245E1A720((uint64_t)&v99, qword_25441B630);
  v19 = sub_245E3CC64();
  v21 = v20;
  v22 = sub_245E3C58C();
  if (v23)
  {
    *((_QWORD *)&v100 + 1) = v17;
    *(_QWORD *)&v99 = v22;
    *((_QWORD *)&v99 + 1) = v23;
  }
  else
  {
    v99 = 0u;
    v100 = 0u;
  }
  sub_245E18A7C((uint64_t)&v99, (uint64_t)&v96);
  if (v97)
  {
    sub_245E28494(&v96, v98);
    sub_245E1A654((uint64_t)v98, (uint64_t)&v96);
    swift_bridgeObjectRetain();
    v24 = swift_isUniquelyReferenced_nonNull_native();
    v95 = v11;
    sub_245E27C14(&v96, v19, v21, v24);
    v11 = v95;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
  }
  else
  {
    sub_245E1A720((uint64_t)&v96, qword_25441B630);
  }
  swift_bridgeObjectRelease();
  sub_245E1A720((uint64_t)&v99, qword_25441B630);
  v25 = sub_245E3CC64();
  v27 = v26;
  v28 = sub_245E3C5F8();
  if (v29)
  {
    *((_QWORD *)&v100 + 1) = v17;
    *(_QWORD *)&v99 = v28;
    *((_QWORD *)&v99 + 1) = v29;
  }
  else
  {
    v99 = 0u;
    v100 = 0u;
  }
  sub_245E18A7C((uint64_t)&v99, (uint64_t)&v96);
  if (v97)
  {
    sub_245E28494(&v96, v98);
    sub_245E1A654((uint64_t)v98, (uint64_t)&v96);
    swift_bridgeObjectRetain();
    v30 = swift_isUniquelyReferenced_nonNull_native();
    v95 = v11;
    sub_245E27C14(&v96, v25, v27, v30);
    v11 = v95;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
  }
  else
  {
    sub_245E1A720((uint64_t)&v96, qword_25441B630);
  }
  swift_bridgeObjectRelease();
  sub_245E1A720((uint64_t)&v99, qword_25441B630);
  v31 = sub_245E3CC64();
  v33 = v32;
  v34 = sub_245E3C604();
  if (v35)
  {
    *((_QWORD *)&v100 + 1) = v17;
    *(_QWORD *)&v99 = v34;
    *((_QWORD *)&v99 + 1) = v35;
  }
  else
  {
    v99 = 0u;
    v100 = 0u;
  }
  sub_245E18A7C((uint64_t)&v99, (uint64_t)&v96);
  if (v97)
  {
    sub_245E28494(&v96, v98);
    sub_245E1A654((uint64_t)v98, (uint64_t)&v96);
    swift_bridgeObjectRetain();
    v36 = swift_isUniquelyReferenced_nonNull_native();
    v95 = v11;
    sub_245E27C14(&v96, v31, v33, v36);
    v11 = v95;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
  }
  else
  {
    sub_245E1A720((uint64_t)&v96, qword_25441B630);
  }
  swift_bridgeObjectRelease();
  sub_245E1A720((uint64_t)&v99, qword_25441B630);
  v37 = sub_245E3CC64();
  v39 = v38;
  v40 = sub_245E3C5A4();
  if (v41)
  {
    *((_QWORD *)&v100 + 1) = v17;
    *(_QWORD *)&v99 = v40;
    *((_QWORD *)&v99 + 1) = v41;
  }
  else
  {
    v99 = 0u;
    v100 = 0u;
  }
  sub_245E18A7C((uint64_t)&v99, (uint64_t)&v96);
  if (v97)
  {
    sub_245E28494(&v96, v98);
    sub_245E1A654((uint64_t)v98, (uint64_t)&v96);
    swift_bridgeObjectRetain();
    v42 = swift_isUniquelyReferenced_nonNull_native();
    v95 = v11;
    sub_245E27C14(&v96, v37, v39, v42);
    v11 = v95;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
  }
  else
  {
    sub_245E1A720((uint64_t)&v96, qword_25441B630);
  }
  swift_bridgeObjectRelease();
  sub_245E1A720((uint64_t)&v99, qword_25441B630);
  v43 = sub_245E3CC64();
  v45 = v44;
  v46 = sub_245E3C5B0();
  if (v47)
  {
    *((_QWORD *)&v100 + 1) = v17;
    *(_QWORD *)&v99 = v46;
    *((_QWORD *)&v99 + 1) = v47;
  }
  else
  {
    v99 = 0u;
    v100 = 0u;
  }
  sub_245E18A7C((uint64_t)&v99, (uint64_t)&v96);
  if (v97)
  {
    sub_245E28494(&v96, v98);
    sub_245E1A654((uint64_t)v98, (uint64_t)&v96);
    swift_bridgeObjectRetain();
    v48 = swift_isUniquelyReferenced_nonNull_native();
    v95 = v11;
    sub_245E27C14(&v96, v43, v45, v48);
    v11 = v95;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
  }
  else
  {
    sub_245E1A720((uint64_t)&v96, qword_25441B630);
  }
  swift_bridgeObjectRelease();
  sub_245E1A720((uint64_t)&v99, qword_25441B630);
  v49 = sub_245E3CC64();
  v51 = v50;
  v52 = sub_245E3C5EC();
  if (v53)
  {
    *((_QWORD *)&v100 + 1) = v17;
    *(_QWORD *)&v99 = v52;
    *((_QWORD *)&v99 + 1) = v53;
  }
  else
  {
    v99 = 0u;
    v100 = 0u;
  }
  sub_245E18A7C((uint64_t)&v99, (uint64_t)&v96);
  if (v97)
  {
    sub_245E28494(&v96, v98);
    sub_245E1A654((uint64_t)v98, (uint64_t)&v96);
    swift_bridgeObjectRetain();
    v54 = swift_isUniquelyReferenced_nonNull_native();
    v95 = v11;
    sub_245E27C14(&v96, v49, v51, v54);
    v11 = v95;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
  }
  else
  {
    sub_245E1A720((uint64_t)&v96, qword_25441B630);
  }
  swift_bridgeObjectRelease();
  sub_245E1A720((uint64_t)&v99, qword_25441B630);
  v55 = sub_245E3CC64();
  v57 = v56;
  v58 = sub_245E3C5C8();
  if (v59)
  {
    *((_QWORD *)&v100 + 1) = v17;
    *(_QWORD *)&v99 = v58;
    *((_QWORD *)&v99 + 1) = v59;
  }
  else
  {
    v99 = 0u;
    v100 = 0u;
  }
  sub_245E18A7C((uint64_t)&v99, (uint64_t)&v96);
  if (v97)
  {
    sub_245E28494(&v96, v98);
    sub_245E1A654((uint64_t)v98, (uint64_t)&v96);
    swift_bridgeObjectRetain();
    v60 = swift_isUniquelyReferenced_nonNull_native();
    v95 = v11;
    sub_245E27C14(&v96, v55, v57, v60);
    v11 = v95;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
  }
  else
  {
    sub_245E1A720((uint64_t)&v96, qword_25441B630);
  }
  swift_bridgeObjectRelease();
  sub_245E1A720((uint64_t)&v99, qword_25441B630);
  v61 = sub_245E3CC64();
  v63 = v62;
  v64 = sub_245E3C568();
  if (v65)
  {
    *((_QWORD *)&v100 + 1) = v17;
    *(_QWORD *)&v99 = v64;
    *((_QWORD *)&v99 + 1) = v65;
  }
  else
  {
    v99 = 0u;
    v100 = 0u;
  }
  sub_245E18A7C((uint64_t)&v99, (uint64_t)&v96);
  if (v97)
  {
    sub_245E28494(&v96, v98);
    sub_245E1A654((uint64_t)v98, (uint64_t)&v96);
    swift_bridgeObjectRetain();
    v66 = swift_isUniquelyReferenced_nonNull_native();
    v95 = v11;
    sub_245E27C14(&v96, v61, v63, v66);
    v11 = v95;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
  }
  else
  {
    sub_245E1A720((uint64_t)&v96, qword_25441B630);
  }
  swift_bridgeObjectRelease();
  sub_245E1A720((uint64_t)&v99, qword_25441B630);
  v67 = sub_245E3C574();
  if (v68)
  {
    *((_QWORD *)&v100 + 1) = v17;
    *(_QWORD *)&v99 = v67;
    *((_QWORD *)&v99 + 1) = v68;
  }
  else
  {
    v99 = 0u;
    v100 = 0u;
  }
  sub_245E18A7C((uint64_t)&v99, (uint64_t)&v96);
  if (v97)
  {
    sub_245E28494(&v96, v98);
    sub_245E1A654((uint64_t)v98, (uint64_t)&v96);
    v69 = swift_isUniquelyReferenced_nonNull_native();
    v95 = v11;
    sub_245E27C14(&v96, 0xD000000000000015, 0x8000000245E3F120, v69);
    v11 = v95;
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
  }
  else
  {
    sub_245E1A720((uint64_t)&v96, qword_25441B630);
  }
  sub_245E1A720((uint64_t)&v99, qword_25441B630);
  v70 = sub_245E3CC64();
  v72 = v71;
  v73 = sub_245E3C5BC();
  if (v74)
  {
    *((_QWORD *)&v100 + 1) = v17;
    *(_QWORD *)&v99 = v73;
    *((_QWORD *)&v99 + 1) = v74;
  }
  else
  {
    v99 = 0u;
    v100 = 0u;
  }
  sub_245E18A7C((uint64_t)&v99, (uint64_t)&v96);
  if (v97)
  {
    sub_245E28494(&v96, v98);
    sub_245E1A654((uint64_t)v98, (uint64_t)&v96);
    swift_bridgeObjectRetain();
    v75 = swift_isUniquelyReferenced_nonNull_native();
    v95 = v11;
    sub_245E27C14(&v96, v70, v72, v75);
    v11 = v95;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
  }
  else
  {
    sub_245E1A720((uint64_t)&v96, qword_25441B630);
  }
  swift_bridgeObjectRelease();
  sub_245E1A720((uint64_t)&v99, qword_25441B630);
  v76 = sub_245E3CC64();
  v78 = v77;
  v79 = sub_245E3C598();
  if (v80)
  {
    *((_QWORD *)&v100 + 1) = v17;
    *(_QWORD *)&v99 = v79;
    *((_QWORD *)&v99 + 1) = v80;
  }
  else
  {
    v99 = 0u;
    v100 = 0u;
  }
  sub_245E18A7C((uint64_t)&v99, (uint64_t)&v96);
  if (v97)
  {
    sub_245E28494(&v96, v98);
    sub_245E1A654((uint64_t)v98, (uint64_t)&v96);
    swift_bridgeObjectRetain();
    v81 = swift_isUniquelyReferenced_nonNull_native();
    v95 = v11;
    sub_245E27C14(&v96, v76, v78, v81);
    v11 = v95;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v98);
  }
  else
  {
    sub_245E1A720((uint64_t)&v96, qword_25441B630);
  }
  swift_bridgeObjectRelease();
  sub_245E1A720((uint64_t)&v99, qword_25441B630);
  sub_245E3C5E0();
  sub_245E284E0((uint64_t)v10, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v83 = v90;
    v82 = v91;
    (*(void (**)(char *, char *, uint64_t))(v90 + 32))(v5, v8, v91);
    v84 = sub_245E28B58();
    (*(void (**)(char *, uint64_t))(v83 + 8))(v5, v82);
  }
  else
  {
    v86 = v92;
    v85 = v93;
    (*(void (**)(char *, char *, uint64_t))(v92 + 32))(v2, v8, v93);
    v84 = sub_245E34F44();
    (*(void (**)(char *, uint64_t))(v86 + 8))(v2, v85);
  }
  sub_245E26468((uint64_t)v10);
  swift_bridgeObjectRetain();
  v87 = sub_245E2610C(v84, v11);
  swift_bridgeObjectRelease();
  return v87;
}

void sub_245E27084(uint64_t a1, uint64_t a2, _QWORD *a3, void *a4)
{
  uint64_t v5;
  id v6;

  __swift_project_boxed_opaque_existential_1(a3, a3[3]);
  v5 = sub_245E3D060();
  v6 = (id)sub_245E3CC40();
  objc_msgSend(a4, sel_setAccountProperty_forKey_, v5, v6);
  swift_unknownObjectRelease();

}

void sub_245E27108(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;

  sub_245E27084(a1, a2, a3, *(void **)(v3 + 16));
}

uint64_t sub_245E27110(uint64_t a1, uint64_t a2)
{
  return sub_245E27208(a1, a2, &qword_257524490);
}

uint64_t sub_245E2711C(uint64_t a1, uint64_t a2)
{
  return sub_245E27208(a1, a2, &qword_257524488);
}

uint64_t sub_245E27128()
{
  return sub_245E27398();
}

uint64_t sub_245E27134(uint64_t a1, uint64_t a2)
{
  return sub_245E27208(a1, a2, &qword_257524498);
}

uint64_t sub_245E27140()
{
  void *v0;
  void *v1;
  id v2;
  __int128 v4;
  _OWORD v5[2];

  v1 = (void *)sub_245E3CC40();
  v2 = objc_msgSend(v0, sel_accountPropertyForKey_, v1);

  if (v2)
  {
    sub_245E3CEC8();
    swift_unknownObjectRelease();
    sub_245E28494(&v4, v5);
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_25441B630);
  if (swift_dynamicCast())
    return v4;
  else
    return 0;
}

uint64_t sub_245E271FC(uint64_t a1, uint64_t a2)
{
  return sub_245E27208(a1, a2, &qword_2575244A0);
}

uint64_t sub_245E27208(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  void *v3;
  void *v5;
  id v6;
  __int128 v8;
  _OWORD v9[2];

  v5 = (void *)sub_245E3CC40();
  v6 = objc_msgSend(v3, sel_accountPropertyForKey_, v5);

  if (v6)
  {
    sub_245E3CEC8();
    swift_unknownObjectRelease();
    sub_245E28494(&v8, v9);
  }
  else
  {
    memset(v9, 0, sizeof(v9));
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_25441B630);
  __swift_instantiateConcreteTypeFromMangledName(a3);
  if (swift_dynamicCast())
    return v8;
  else
    return 0;
}

uint64_t sub_245E272CC()
{
  void *v0;
  void *v1;
  id v2;
  __int128 v4;
  _OWORD v5[2];

  v1 = (void *)sub_245E3CC40();
  v2 = objc_msgSend(v0, sel_accountPropertyForKey_, v1);

  if (v2)
  {
    sub_245E3CEC8();
    swift_unknownObjectRelease();
    sub_245E28494(&v4, v5);
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_25441B630);
  sub_245E284A4();
  if (swift_dynamicCast())
    return v4;
  else
    return 0;
}

uint64_t sub_245E2738C()
{
  return sub_245E27398();
}

uint64_t sub_245E27398()
{
  void *v0;
  void *v1;
  id v2;
  int v3;
  uint64_t v4;
  __int128 v6;
  _OWORD v7[2];

  v1 = (void *)sub_245E3CC40();
  v2 = objc_msgSend(v0, sel_accountPropertyForKey_, v1);

  if (v2)
  {
    sub_245E3CEC8();
    swift_unknownObjectRelease();
    sub_245E28494(&v6, v7);
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_25441B630);
  v3 = swift_dynamicCast();
  v4 = v6;
  if (!v3)
    return 0;
  return v4;
}

void RemoteBrowsingAccount.init(account:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
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
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;

  v5 = sub_245E3C6AC();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_msgSend(a1, sel_portableCopy);
  if (!v8)
  {
    v10 = sub_245E3C550();
    sub_245E2844C();
    swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v10 - 8) + 104))(v11, *MEMORY[0x24BE8AF38], v10);
    swift_willThrow();
    goto LABEL_5;
  }
  v9 = v8;
  sub_245E2856C(v9, (uint64_t)v7);
  if (v2)
  {

LABEL_5:
    return;
  }
  v12 = objc_msgSend(v9, sel_identifier);
  if (v12)
  {
    v13 = v12;
    v14 = sub_245E3CC64();
    v16 = v15;

    v17 = objc_msgSend(v9, sel_username);
    v63 = a1;
    v61 = v14;
    v62 = a2;
    v60 = v16;
    if (v17)
    {
      v18 = v17;
      v40 = sub_245E3CC64();
      v39 = v19;

    }
    else
    {
      v40 = 0;
      v39 = 0;
    }
    sub_245E3CC64();
    v20 = sub_245E27140();
    v58 = v21;
    v59 = v20;
    swift_bridgeObjectRelease();
    sub_245E3CC64();
    v22 = sub_245E27140();
    v56 = v23;
    v57 = v22;
    swift_bridgeObjectRelease();
    sub_245E3CC64();
    v24 = sub_245E27140();
    v54 = v25;
    v55 = v24;
    swift_bridgeObjectRelease();
    sub_245E3CC64();
    v26 = sub_245E27140();
    v52 = v27;
    v53 = v26;
    swift_bridgeObjectRelease();
    sub_245E3CC64();
    v28 = sub_245E27140();
    v50 = v29;
    v51 = v28;
    swift_bridgeObjectRelease();
    sub_245E3CC64();
    v30 = sub_245E27140();
    v48 = v31;
    v49 = v30;
    swift_bridgeObjectRelease();
    sub_245E3CC64();
    v32 = sub_245E27140();
    v46 = v33;
    v47 = v32;
    swift_bridgeObjectRelease();
    sub_245E3CC64();
    v34 = sub_245E27140();
    v44 = v35;
    v45 = v34;
    swift_bridgeObjectRelease();
    sub_245E3CC64();
    v36 = sub_245E27140();
    v42 = v37;
    v43 = v36;
    swift_bridgeObjectRelease();
    v41 = sub_245E27140();
    sub_245E3CC64();
    sub_245E27140();
    swift_bridgeObjectRelease();
    sub_245E3CC64();
    sub_245E27140();
    swift_bridgeObjectRelease();
    sub_245E3C5D4();

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_245E27880@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v4 = *a1;
  v3 = a1[1];
  sub_245E1A654((uint64_t)(a1 + 2), (uint64_t)(a2 + 2));
  *a2 = v4;
  a2[1] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_245E278C0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  char v20;
  unint64_t v21;
  char v22;
  _OWORD *v23;
  _QWORD *v24;
  uint64_t *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t i;
  _OWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  char v33;
  unint64_t v34;
  uint64_t v35;
  _BOOL8 v36;
  uint64_t v37;
  char v38;
  unint64_t v39;
  char v40;
  _QWORD *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t result;
  _OWORD v46[2];
  _OWORD v47[2];
  __int128 v48;
  _OWORD v49[2];
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v7 = -1 << *(_BYTE *)(a1 + 32);
  v8 = ~v7;
  v9 = *(_QWORD *)(a1 + 64);
  v10 = -v7;
  v50 = a1;
  v51 = a1 + 64;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  else
    v11 = -1;
  v52 = v8;
  v53 = 0;
  v54 = v11 & v9;
  v55 = a2;
  v56 = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_245E280AC(&v48);
  v12 = *((_QWORD *)&v48 + 1);
  if (!*((_QWORD *)&v48 + 1))
    goto LABEL_27;
  v13 = v48;
  sub_245E28494(v49, v47);
  v14 = *(_QWORD **)a5;
  v16 = sub_245E2E2DC(v13, v12);
  v17 = v14[2];
  v18 = (v15 & 1) == 0;
  v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v20 = v15;
  if (v14[3] >= v19)
  {
    if ((a4 & 1) != 0)
    {
      if ((v15 & 1) != 0)
        goto LABEL_12;
    }
    else
    {
      sub_245E360B4();
      if ((v20 & 1) != 0)
        goto LABEL_12;
    }
LABEL_14:
    v24 = *(_QWORD **)a5;
    *(_QWORD *)(*(_QWORD *)a5 + 8 * (v16 >> 6) + 64) |= 1 << v16;
    v25 = (uint64_t *)(v24[6] + 16 * v16);
    *v25 = v13;
    v25[1] = v12;
    sub_245E28494(v47, (_OWORD *)(v24[7] + 32 * v16));
    v26 = v24[2];
    v27 = __OFADD__(v26, 1);
    v28 = v26 + 1;
    if (v27)
    {
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    v24[2] = v28;
LABEL_16:
    sub_245E280AC(&v48);
    for (i = *((_QWORD *)&v48 + 1); *((_QWORD *)&v48 + 1); i = *((_QWORD *)&v48 + 1))
    {
      v31 = v48;
      sub_245E28494(v49, v47);
      v32 = *(_QWORD **)a5;
      v34 = sub_245E2E2DC(v31, i);
      v35 = v32[2];
      v36 = (v33 & 1) == 0;
      v37 = v35 + v36;
      if (__OFADD__(v35, v36))
        goto LABEL_28;
      v38 = v33;
      if (v32[3] < v37)
      {
        sub_245E2CA4C(v37, 1);
        v39 = sub_245E2E2DC(v31, i);
        if ((v38 & 1) != (v40 & 1))
          goto LABEL_30;
        v34 = v39;
      }
      if ((v38 & 1) != 0)
      {
        sub_245E1A654((uint64_t)v47, (uint64_t)v46);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
        swift_bridgeObjectRelease();
        v30 = (_OWORD *)(*(_QWORD *)(*(_QWORD *)a5 + 56) + 32 * v34);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
        sub_245E28494(v46, v30);
      }
      else
      {
        v41 = *(_QWORD **)a5;
        *(_QWORD *)(*(_QWORD *)a5 + 8 * (v34 >> 6) + 64) |= 1 << v34;
        v42 = (uint64_t *)(v41[6] + 16 * v34);
        *v42 = v31;
        v42[1] = i;
        sub_245E28494(v47, (_OWORD *)(v41[7] + 32 * v34));
        v43 = v41[2];
        v27 = __OFADD__(v43, 1);
        v44 = v43 + 1;
        if (v27)
          goto LABEL_29;
        v41[2] = v44;
      }
      sub_245E280AC(&v48);
    }
LABEL_27:
    swift_release();
    swift_bridgeObjectRelease();
    sub_245E1A718();
    return swift_release();
  }
  sub_245E2CA4C(v19, a4 & 1);
  v21 = sub_245E2E2DC(v13, v12);
  if ((v20 & 1) == (v22 & 1))
  {
    v16 = v21;
    if ((v20 & 1) == 0)
      goto LABEL_14;
LABEL_12:
    sub_245E1A654((uint64_t)v47, (uint64_t)v46);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
    swift_bridgeObjectRelease();
    v23 = (_OWORD *)(*(_QWORD *)(*(_QWORD *)a5 + 56) + 32 * v16);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    sub_245E28494(v46, v23);
    goto LABEL_16;
  }
LABEL_30:
  result = sub_245E3D084();
  __break(1u);
  return result;
}

_OWORD *sub_245E27C14(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
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
  _OWORD *v19;
  _OWORD *result;
  unint64_t v21;
  char v22;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_245E2E2DC(a2, a3);
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
        v19 = (_OWORD *)(v18[7] + 32 * v12);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
        return sub_245E28494(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_245E360B4();
      goto LABEL_7;
    }
    sub_245E2CA4C(v15, a4 & 1);
    v21 = sub_245E2E2DC(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_245E27D44(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain();
    }
  }
  result = (_OWORD *)sub_245E3D084();
  __break(1u);
  return result;
}

_OWORD *sub_245E27D44(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
{
  _QWORD *v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_245E28494(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

uint64_t sub_245E27DAC()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t *__return_ptr, _QWORD *);
  uint64_t result;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  _QWORD v20[3];

  v1 = *v0;
  v3 = v0[3];
  v2 = v0[4];
  v4 = v3;
  if (v2)
  {
    v5 = (v2 - 1) & v2;
    v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    v7 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v6);
    v8 = *v7;
    v9 = v7[1];
    v10 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8 * v6);
    v0[3] = v4;
    v0[4] = v5;
    v11 = (void (*)(uint64_t *__return_ptr, _QWORD *))v0[5];
    v20[0] = v8;
    v20[1] = v9;
    v20[2] = v10;
    swift_bridgeObjectRetain();
    v11(&v19, v20);
    swift_bridgeObjectRelease();
    return v19;
  }
  v13 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    v14 = (unint64_t)(v0[2] + 64) >> 6;
    if (v13 < v14)
    {
      v15 = v0[1];
      v16 = *(_QWORD *)(v15 + 8 * v13);
      if (v16)
      {
LABEL_7:
        v5 = (v16 - 1) & v16;
        v6 = __clz(__rbit64(v16)) + (v13 << 6);
        v4 = v13;
        goto LABEL_3;
      }
      v17 = v3 + 2;
      v4 = v3 + 1;
      if (v3 + 2 < v14)
      {
        v16 = *(_QWORD *)(v15 + 8 * v17);
        if (v16)
        {
LABEL_10:
          v13 = v17;
          goto LABEL_7;
        }
        v4 = v3 + 2;
        if (v3 + 3 < v14)
        {
          v16 = *(_QWORD *)(v15 + 8 * (v3 + 3));
          if (v16)
          {
            v13 = v3 + 3;
            goto LABEL_7;
          }
          v17 = v3 + 4;
          v4 = v3 + 3;
          if (v3 + 4 < v14)
          {
            v16 = *(_QWORD *)(v15 + 8 * v17);
            if (v16)
              goto LABEL_10;
            v13 = v3 + 5;
            v4 = v3 + 4;
            if (v3 + 5 < v14)
            {
              v16 = *(_QWORD *)(v15 + 8 * v13);
              if (v16)
                goto LABEL_7;
              v4 = v14 - 1;
              v18 = v3 + 6;
              while (v14 != v18)
              {
                v16 = *(_QWORD *)(v15 + 8 * v18++);
                if (v16)
                {
                  v13 = v18 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    result = 0;
    v0[3] = v4;
    v0[4] = 0;
  }
  return result;
}

uint64_t sub_245E27F2C()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t *__return_ptr, _QWORD *);
  uint64_t result;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  _QWORD v20[3];

  v1 = *v0;
  v3 = v0[3];
  v2 = v0[4];
  v4 = v3;
  if (v2)
  {
    v5 = (v2 - 1) & v2;
    v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    v7 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v6);
    v8 = *v7;
    v9 = v7[1];
    v10 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8 * v6);
    v0[3] = v4;
    v0[4] = v5;
    v11 = (void (*)(uint64_t *__return_ptr, _QWORD *))v0[5];
    v20[0] = v8;
    v20[1] = v9;
    v20[2] = v10;
    swift_bridgeObjectRetain();
    v11(&v19, v20);
    swift_bridgeObjectRelease();
    return v19;
  }
  v13 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    v14 = (unint64_t)(v0[2] + 64) >> 6;
    if (v13 < v14)
    {
      v15 = v0[1];
      v16 = *(_QWORD *)(v15 + 8 * v13);
      if (v16)
      {
LABEL_7:
        v5 = (v16 - 1) & v16;
        v6 = __clz(__rbit64(v16)) + (v13 << 6);
        v4 = v13;
        goto LABEL_3;
      }
      v17 = v3 + 2;
      v4 = v3 + 1;
      if (v3 + 2 < v14)
      {
        v16 = *(_QWORD *)(v15 + 8 * v17);
        if (v16)
        {
LABEL_10:
          v13 = v17;
          goto LABEL_7;
        }
        v4 = v3 + 2;
        if (v3 + 3 < v14)
        {
          v16 = *(_QWORD *)(v15 + 8 * (v3 + 3));
          if (v16)
          {
            v13 = v3 + 3;
            goto LABEL_7;
          }
          v17 = v3 + 4;
          v4 = v3 + 3;
          if (v3 + 4 < v14)
          {
            v16 = *(_QWORD *)(v15 + 8 * v17);
            if (v16)
              goto LABEL_10;
            v13 = v3 + 5;
            v4 = v3 + 4;
            if (v3 + 5 < v14)
            {
              v16 = *(_QWORD *)(v15 + 8 * v13);
              if (v16)
                goto LABEL_7;
              v4 = v14 - 1;
              v18 = v3 + 6;
              while (v14 != v18)
              {
                v16 = *(_QWORD *)(v15 + 8 * v18++);
                if (v16)
                {
                  v13 = v18 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    result = 0;
    v0[3] = v4;
    v0[4] = 0;
  }
  return result;
}

uint64_t sub_245E280AC@<X0>(_OWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  void (*v19)(_OWORD *);
  uint64_t result;
  _OWORD v21[3];
  _OWORD v22[3];
  __int128 v23;
  _OWORD v24[2];

  v3 = *v1;
  v4 = v1[1];
  v6 = v1[2];
  v5 = v1[3];
  v7 = v5;
  v8 = v1[4];
  if (v8)
  {
    v9 = (v8 - 1) & v8;
    v10 = __clz(__rbit64(v8)) | (v5 << 6);
LABEL_3:
    v11 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v10);
    v13 = *v11;
    v12 = v11[1];
    sub_245E1A654(*(_QWORD *)(v3 + 56) + 32 * v10, (uint64_t)v24);
    *(_QWORD *)&v23 = v13;
    *((_QWORD *)&v23 + 1) = v12;
    swift_bridgeObjectRetain();
    goto LABEL_23;
  }
  v14 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    return result;
  }
  v15 = (unint64_t)(v6 + 64) >> 6;
  if (v14 < v15)
  {
    v16 = *(_QWORD *)(v4 + 8 * v14);
    if (v16)
    {
LABEL_7:
      v9 = (v16 - 1) & v16;
      v10 = __clz(__rbit64(v16)) + (v14 << 6);
      v7 = v14;
      goto LABEL_3;
    }
    v17 = v5 + 2;
    v7 = v5 + 1;
    if (v5 + 2 < v15)
    {
      v16 = *(_QWORD *)(v4 + 8 * v17);
      if (v16)
      {
LABEL_10:
        v14 = v17;
        goto LABEL_7;
      }
      v7 = v5 + 2;
      if (v5 + 3 < v15)
      {
        v16 = *(_QWORD *)(v4 + 8 * (v5 + 3));
        if (v16)
        {
          v14 = v5 + 3;
          goto LABEL_7;
        }
        v17 = v5 + 4;
        v7 = v5 + 3;
        if (v5 + 4 < v15)
        {
          v16 = *(_QWORD *)(v4 + 8 * v17);
          if (v16)
            goto LABEL_10;
          v14 = v5 + 5;
          v7 = v5 + 4;
          if (v5 + 5 < v15)
          {
            v16 = *(_QWORD *)(v4 + 8 * v14);
            if (v16)
              goto LABEL_7;
            v7 = v15 - 1;
            v18 = v5 + 6;
            while (v15 != v18)
            {
              v16 = *(_QWORD *)(v4 + 8 * v18++);
              if (v16)
              {
                v14 = v18 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }
  v9 = 0;
  memset(v24, 0, sizeof(v24));
  v23 = 0u;
LABEL_23:
  *v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  v19 = (void (*)(_OWORD *))v1[5];
  result = sub_245E28524((uint64_t)&v23, (uint64_t)v22);
  if (*((_QWORD *)&v22[0] + 1))
  {
    v21[0] = v22[0];
    v21[1] = v22[1];
    v21[2] = v22[2];
    v19(v21);
    return sub_245E1A720((uint64_t)v21, &qword_2575244B0);
  }
  else
  {
    a1[1] = 0u;
    a1[2] = 0u;
    *a1 = 0u;
  }
  return result;
}

uint64_t sub_245E28288(uint64_t a1, void (*a2)(uint64_t, uint64_t, _BYTE *))
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  _QWORD v18[2];
  _BYTE v19[32];
  uint64_t v20;

  v4 = 1 << *(_BYTE *)(a1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v9 = 0;
  while (1)
  {
    if (v6)
    {
      v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v11 = v10 | (v9 << 6);
      goto LABEL_5;
    }
    v15 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v15 >= v7)
      return swift_release();
    v16 = *(_QWORD *)(v20 + 8 * v15);
    ++v9;
    if (!v16)
    {
      v9 = v15 + 1;
      if (v15 + 1 >= v7)
        return swift_release();
      v16 = *(_QWORD *)(v20 + 8 * v9);
      if (!v16)
      {
        v9 = v15 + 2;
        if (v15 + 2 >= v7)
          return swift_release();
        v16 = *(_QWORD *)(v20 + 8 * v9);
        if (!v16)
        {
          v9 = v15 + 3;
          if (v15 + 3 >= v7)
            return swift_release();
          v16 = *(_QWORD *)(v20 + 8 * v9);
          if (!v16)
            break;
        }
      }
    }
LABEL_22:
    v6 = (v16 - 1) & v16;
    v11 = __clz(__rbit64(v16)) + (v9 << 6);
LABEL_5:
    v12 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v11);
    v13 = *v12;
    v14 = v12[1];
    sub_245E1A654(*(_QWORD *)(a1 + 56) + 32 * v11, (uint64_t)v19);
    v18[0] = v13;
    v18[1] = v14;
    swift_bridgeObjectRetain();
    a2(v13, v14, v19);
    result = sub_245E1A720((uint64_t)v18, &qword_2575244B0);
  }
  v17 = v15 + 4;
  if (v17 >= v7)
    return swift_release();
  v16 = *(_QWORD *)(v20 + 8 * v17);
  if (v16)
  {
    v9 = v17;
    goto LABEL_22;
  }
  while (1)
  {
    v9 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v9 >= v7)
      return swift_release();
    v16 = *(_QWORD *)(v20 + 8 * v9);
    ++v17;
    if (v16)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

unint64_t sub_245E2844C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257524480;
  if (!qword_257524480)
  {
    v1 = sub_245E3C550();
    result = MEMORY[0x24954A9D0](MEMORY[0x24BE8AF90], v1);
    atomic_store(result, (unint64_t *)&qword_257524480);
  }
  return result;
}

_OWORD *sub_245E28494(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_245E284A4()
{
  unint64_t result;

  result = qword_2575244A8;
  if (!qword_2575244A8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2575244A8);
  }
  return result;
}

uint64_t sub_245E284E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_245E3C6AC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_245E28524(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575244B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_245E2856C(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  v5 = sub_245E3C9B8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_245E3C7CC();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  ACAccount.type.getter(&v16);
  if (v16 == 2)
  {
    v13 = sub_245E3C550();
    sub_245E2844C();
    swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v13 - 8) + 104))(v14, *MEMORY[0x24BE8AF68], v13);
    swift_willThrow();

    return;
  }
  if ((v16 & 1) != 0)
  {
    sub_245E28714(a1);
    if (v2)
      return;
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(a2, v12, v9);
  }
  else
  {
    sub_245E33F3C(a1);
    if (v2)
      return;
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(a2, v8, v5);
  }
  sub_245E3C6AC();
  swift_storeEnumTagMultiPayload();
}

void sub_245E28714(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;

  if (!sub_245E27134(0x6E496E6F69676572, 0xEA00000000006F66))
    sub_245E2B9C4(MEMORY[0x24BEE4AF8]);
  v2 = sub_245E3CC64();
  v4 = sub_245E27110(v2, v3);
  swift_bridgeObjectRelease();
  if (!v4)
    sub_245E2BAE4(MEMORY[0x24BEE4AF8]);
  sub_245E27128();
  sub_245E2711C(0xD00000000000001ELL, 0x8000000245E3F0E0);
  v5 = objc_msgSend(a1, sel_aa_primaryEmail);
  if (v5)
  {
    v6 = v5;
    sub_245E3CC64();

  }
  v7 = objc_msgSend(a1, sel_username);
  if (v7)
  {
    v8 = v7;
    sub_245E3CC64();

  }
  v9 = objc_msgSend(a1, sel_aa_appleIDAliases);
  if (v9)
  {
    v10 = v9;
    sub_245E3CD24();

  }
  v11 = objc_msgSend(a1, sel_aa_personID);
  if (v11)
  {
    v12 = v11;
    sub_245E3CC64();

  }
  v13 = objc_msgSend(a1, sel_aa_altDSID);
  if (v13)
  {
    v14 = v13;
    sub_245E3CC64();

  }
  v15 = objc_msgSend(a1, sel_aa_firstName);
  if (v15)
  {
    v16 = v15;
    sub_245E3CC64();

  }
  v17 = objc_msgSend(a1, sel_aa_middleName);
  if (v17)
  {
    v18 = v17;
    sub_245E3CC64();

  }
  v19 = objc_msgSend(a1, sel_aa_lastName);
  if (v19)
  {
    v20 = v19;
    sub_245E3CC64();

  }
  v21 = objc_msgSend(a1, sel_aa_accountClass);
  if (v21)
  {
    v22 = v21;
    sub_245E3CC64();

    objc_msgSend(a1, sel_aa_isUsingCloudDocs);
    objc_msgSend(a1, sel_aa_isPrimaryEmailVerified);
    objc_msgSend(a1, sel_aa_isManagedAppleID);
    objc_msgSend(a1, sel_aa_isNotesMigrated);
    objc_msgSend(a1, sel_aa_isRemindersMigrated);
    objc_msgSend(a1, sel_aa_isSandboxAccount);
    objc_msgSend(a1, sel_aa_isFamilyEligible);
    objc_msgSend(a1, sel_aa_hasOptionalTerms);
    objc_msgSend(a1, sel_aa_needsToVerifyTerms);
    sub_245E3C700();

  }
  else
  {
    __break(1u);
  }
}

unint64_t sub_245E28B58()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  uint64_t v32;
  char v33;
  char v34;
  char v35;
  char v36;
  char v37;
  char v38;
  char v39;
  char v40;
  char v41;
  char v42;
  char v43;
  char v44;
  char v45;
  char v46;
  char v47;
  char v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  char v58;
  __int128 v60;
  uint64_t v61;
  _OWORD v62[2];
  __int128 v63;
  __int128 v64;

  v0 = sub_245E2B89C(MEMORY[0x24BEE4AF8]);
  v1 = sub_245E3C70C();
  v3 = MEMORY[0x24BEE0D00];
  if (v2)
  {
    *((_QWORD *)&v64 + 1) = MEMORY[0x24BEE0D00];
    *(_QWORD *)&v63 = v1;
    *((_QWORD *)&v63 + 1) = v2;
  }
  else
  {
    v63 = 0u;
    v64 = 0u;
  }
  sub_245E18A7C((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_245E28494(&v60, v62);
    sub_245E1A654((uint64_t)v62, (uint64_t)&v60);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v60, 0x457972616D697270, 0xEC0000006C69616DLL, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v60);
  }
  sub_245E18AC4((uint64_t)&v63);
  v5 = sub_245E3C6D0();
  if (v6)
  {
    *((_QWORD *)&v64 + 1) = v3;
    *(_QWORD *)&v63 = v5;
    *((_QWORD *)&v63 + 1) = v6;
  }
  else
  {
    v63 = 0u;
    v64 = 0u;
  }
  sub_245E18A7C((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_245E28494(&v60, v62);
    sub_245E1A654((uint64_t)v62, (uint64_t)&v60);
    v7 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v60, 0x6449656C707061, 0xE700000000000000, v7);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v60);
  }
  sub_245E18AC4((uint64_t)&v63);
  v8 = sub_245E3C748();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257524488);
  *((_QWORD *)&v64 + 1) = v9;
  *(_QWORD *)&v63 = v8;
  sub_245E18A7C((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_245E28494(&v60, v62);
    sub_245E1A654((uint64_t)v62, (uint64_t)&v60);
    v10 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v60, 0x414449656C707061, 0xEE0073657361696CLL, v10);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v60);
  }
  sub_245E18AC4((uint64_t)&v63);
  v11 = sub_245E3C73C();
  if (v12)
  {
    *((_QWORD *)&v64 + 1) = v3;
    *(_QWORD *)&v63 = v11;
    *((_QWORD *)&v63 + 1) = v12;
  }
  else
  {
    v63 = 0u;
    v64 = 0u;
  }
  sub_245E18A7C((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_245E28494(&v60, v62);
    sub_245E1A654((uint64_t)v62, (uint64_t)&v60);
    v13 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v60, 0x44496E6F73726570, 0xE800000000000000, v13);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v60);
  }
  sub_245E18AC4((uint64_t)&v63);
  v14 = sub_245E3C7A8();
  if (v15)
  {
    *((_QWORD *)&v64 + 1) = v3;
    *(_QWORD *)&v63 = v14;
    *((_QWORD *)&v63 + 1) = v15;
  }
  else
  {
    v63 = 0u;
    v64 = 0u;
  }
  sub_245E18A7C((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_245E28494(&v60, v62);
    sub_245E1A654((uint64_t)v62, (uint64_t)&v60);
    v16 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v60, 0x44495344746C61, 0xE700000000000000, v16);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v60);
  }
  sub_245E18AC4((uint64_t)&v63);
  v17 = sub_245E3C7C0();
  if (v18)
  {
    *((_QWORD *)&v64 + 1) = v3;
    *(_QWORD *)&v63 = v17;
    *((_QWORD *)&v63 + 1) = v18;
  }
  else
  {
    v63 = 0u;
    v64 = 0u;
  }
  sub_245E18A7C((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_245E28494(&v60, v62);
    sub_245E1A654((uint64_t)v62, (uint64_t)&v60);
    v19 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v60, 0x6D614E7473726966, 0xE900000000000065, v19);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v60);
  }
  sub_245E18AC4((uint64_t)&v63);
  v20 = sub_245E3C6DC();
  if (v21)
  {
    *((_QWORD *)&v64 + 1) = v3;
    *(_QWORD *)&v63 = v20;
    *((_QWORD *)&v63 + 1) = v21;
  }
  else
  {
    v63 = 0u;
    v64 = 0u;
  }
  sub_245E18A7C((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_245E28494(&v60, v62);
    sub_245E1A654((uint64_t)v62, (uint64_t)&v60);
    v22 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v60, 0x614E656C6464696DLL, 0xEA0000000000656DLL, v22);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v60);
  }
  sub_245E18AC4((uint64_t)&v63);
  v23 = sub_245E3C7B4();
  if (v24)
  {
    *((_QWORD *)&v64 + 1) = v3;
    *(_QWORD *)&v63 = v23;
    *((_QWORD *)&v63 + 1) = v24;
  }
  else
  {
    v63 = 0u;
    v64 = 0u;
  }
  sub_245E18A7C((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_245E28494(&v60, v62);
    sub_245E1A654((uint64_t)v62, (uint64_t)&v60);
    v25 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v60, 0x656D614E7473616CLL, 0xE800000000000000, v25);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v60);
  }
  sub_245E18AC4((uint64_t)&v63);
  v26 = sub_245E3C6E8();
  *((_QWORD *)&v64 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_257524498);
  *(_QWORD *)&v63 = v26;
  sub_245E18A7C((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_245E28494(&v60, v62);
    sub_245E1A654((uint64_t)v62, (uint64_t)&v60);
    v27 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v60, 0x6E496E6F69676572, 0xEA00000000006F66, v27);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v60);
  }
  sub_245E18AC4((uint64_t)&v63);
  v28 = sub_245E3C6F4();
  *((_QWORD *)&v64 + 1) = v3;
  *(_QWORD *)&v63 = v28;
  *((_QWORD *)&v63 + 1) = v29;
  sub_245E18A7C((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_245E28494(&v60, v62);
    sub_245E1A654((uint64_t)v62, (uint64_t)&v60);
    v30 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v60, 0x43746E756F636361, 0xEC0000007373616CLL, v30);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v60);
  }
  sub_245E18AC4((uint64_t)&v63);
  v31 = sub_245E3C76C();
  v32 = MEMORY[0x24BEE1328];
  *((_QWORD *)&v64 + 1) = MEMORY[0x24BEE1328];
  LOBYTE(v63) = v31 & 1;
  sub_245E18A7C((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_245E28494(&v60, v62);
    sub_245E1A654((uint64_t)v62, (uint64_t)&v60);
    v33 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v60, 0x756F6C4373657375, 0xED000073636F4464, v33);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v60);
  }
  sub_245E18AC4((uint64_t)&v63);
  v34 = sub_245E3C784();
  *((_QWORD *)&v64 + 1) = v32;
  LOBYTE(v63) = v34 & 1;
  sub_245E18A7C((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_245E28494(&v60, v62);
    sub_245E1A654((uint64_t)v62, (uint64_t)&v60);
    v35 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v60, 0xD000000000000014, 0x8000000245E3F100, v35);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v60);
  }
  sub_245E18AC4((uint64_t)&v63);
  v36 = sub_245E3C6B8();
  *((_QWORD *)&v64 + 1) = v32;
  LOBYTE(v63) = v36 & 1;
  sub_245E18A7C((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_245E28494(&v60, v62);
    sub_245E1A654((uint64_t)v62, (uint64_t)&v60);
    v37 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v60, 0xD000000000000010, 0x8000000245E3EB30, v37);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v60);
  }
  sub_245E18AC4((uint64_t)&v63);
  v38 = sub_245E3C718();
  *((_QWORD *)&v64 + 1) = v32;
  LOBYTE(v63) = v38 & 1;
  sub_245E18A7C((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_245E28494(&v60, v62);
    sub_245E1A654((uint64_t)v62, (uint64_t)&v60);
    v39 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v60, 0x67694D7365746F6ELL, 0xED00006465746172, v39);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v60);
  }
  sub_245E18AC4((uint64_t)&v63);
  v40 = sub_245E3C760();
  *((_QWORD *)&v64 + 1) = v32;
  LOBYTE(v63) = v40 & 1;
  sub_245E18A7C((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_245E28494(&v60, v62);
    sub_245E1A654((uint64_t)v62, (uint64_t)&v60);
    v41 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v60, 0xD000000000000011, 0x8000000245E3F0A0, v41);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v60);
  }
  sub_245E18AC4((uint64_t)&v63);
  v42 = sub_245E3C6C4();
  *((_QWORD *)&v64 + 1) = v32;
  LOBYTE(v63) = v42 & 1;
  sub_245E18A7C((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_245E28494(&v60, v62);
    sub_245E1A654((uint64_t)v62, (uint64_t)&v60);
    v43 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v60, 0x6F62646E61537369, 0xED00007463634178, v43);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v60);
  }
  sub_245E18AC4((uint64_t)&v63);
  v44 = sub_245E3C730();
  *((_QWORD *)&v64 + 1) = v32;
  LOBYTE(v63) = v44 & 1;
  sub_245E18A7C((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_245E28494(&v60, v62);
    sub_245E1A654((uint64_t)v62, (uint64_t)&v60);
    v45 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v60, 0x6C45796C696D6166, 0xEE00656C62696769, v45);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v60);
  }
  sub_245E18AC4((uint64_t)&v63);
  v46 = sub_245E3C724();
  *((_QWORD *)&v64 + 1) = v32;
  LOBYTE(v63) = v46 & 1;
  sub_245E18A7C((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_245E28494(&v60, v62);
    sub_245E1A654((uint64_t)v62, (uint64_t)&v60);
    v47 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v60, 0xD000000000000010, 0x8000000245E3F080, v47);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v60);
  }
  sub_245E18AC4((uint64_t)&v63);
  v48 = sub_245E3C754();
  *((_QWORD *)&v64 + 1) = v32;
  LOBYTE(v63) = v48 & 1;
  sub_245E18A7C((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_245E28494(&v60, v62);
    sub_245E1A654((uint64_t)v62, (uint64_t)&v60);
    v49 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v60, 0xD000000000000012, 0x8000000245E3F0C0, v49);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v60);
  }
  sub_245E18AC4((uint64_t)&v63);
  v50 = sub_245E3CC64();
  v52 = v51;
  v53 = sub_245E3C790();
  *((_QWORD *)&v64 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_257524490);
  *(_QWORD *)&v63 = v53;
  sub_245E18A7C((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_245E28494(&v60, v62);
    sub_245E1A654((uint64_t)v62, (uint64_t)&v60);
    swift_bridgeObjectRetain();
    v54 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v60, v50, v52, v54);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v60);
  }
  swift_bridgeObjectRelease();
  sub_245E18AC4((uint64_t)&v63);
  v55 = sub_245E3C778();
  *((_QWORD *)&v64 + 1) = MEMORY[0x24BEE1E88];
  *(_QWORD *)&v63 = v55;
  sub_245E18A7C((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_245E28494(&v60, v62);
    sub_245E1A654((uint64_t)v62, (uint64_t)&v60);
    v56 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v60, 0x7453726961706572, 0xEB00000000657461, v56);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v60);
  }
  sub_245E18AC4((uint64_t)&v63);
  v57 = sub_245E3C79C();
  *((_QWORD *)&v64 + 1) = v9;
  *(_QWORD *)&v63 = v57;
  sub_245E18A7C((uint64_t)&v63, (uint64_t)&v60);
  if (v61)
  {
    sub_245E28494(&v60, v62);
    sub_245E1A654((uint64_t)v62, (uint64_t)&v60);
    v58 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v60, 0xD00000000000001ELL, 0x8000000245E3F0E0, v58);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v60);
  }
  sub_245E18AC4((uint64_t)&v63);
  return v0;
}

unint64_t AppInstallRequestProvider.makeAppInstallRequest()()
{
  return sub_245E299F8();
}

unint64_t sub_245E299F8()
{
  unint64_t result;

  result = qword_2575244C0;
  if (!qword_2575244C0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2575244C0);
  }
  return result;
}

unint64_t sub_245E29A34()
{
  return sub_245E299F8();
}

uint64_t dispatch thunk of AppInstallRequestProviding.makeAppInstallRequest()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

ValueMetadata *type metadata accessor for AppInstallRequestProvider()
{
  return &type metadata for AppInstallRequestProvider;
}

uint64_t dispatch thunk of AppRecordObserving.onRecordUpdated.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AppRecordObserving.onRecordUpdated.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of AppRecordObserving.onRecordUpdated.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of AppRecordObserving.init(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of AppRecordObserving.begin()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

char *sub_245E29A94(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void *v9;
  id v10;
  char *v11;
  objc_super v13;

  v5 = &v2[OBJC_IVAR____TtC21SeymourClientServices17AppRecordObserver_onRecordUpdated];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v6 = &v2[OBJC_IVAR____TtC21SeymourClientServices17AppRecordObserver_bundleIdentifier];
  *(_QWORD *)v6 = a1;
  *((_QWORD *)v6 + 1) = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575245B8);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_245E3DA50;
  *(_QWORD *)(v7 + 32) = a1;
  *(_QWORD *)(v7 + 40) = a2;
  v8 = v2;
  swift_bridgeObjectRetain();
  v9 = (void *)sub_245E3CD18();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend((id)objc_opt_self(), sel_queryForBundleIDs_, v9);

  *(_QWORD *)&v8[OBJC_IVAR____TtC21SeymourClientServices17AppRecordObserver_query] = v10;
  v13.receiver = v8;
  v13.super_class = (Class)type metadata accessor for AppRecordObserver();
  v11 = (char *)objc_msgSendSuper2(&v13, sel_init);
  objc_msgSend(*(id *)&v11[OBJC_IVAR____TtC21SeymourClientServices17AppRecordObserver_query], sel_setObserver_, v11);
  return v11;
}

id sub_245E29BDC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppRecordObserver();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AppRecordObserver()
{
  return objc_opt_self();
}

uint64_t sub_245E29C7C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD aBlock[6];

  v22 = a1;
  v5 = sub_245E3CBD4();
  v25 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_245E3CBF8();
  v23 = *(_QWORD *)(v8 - 8);
  v24 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_245E3CBE0();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245E24A9C(0, (unint64_t *)&qword_257524780);
  (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x24BEE5480], v11);
  v15 = (void *)sub_245E3CE38();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v16 = (_QWORD *)swift_allocObject();
  v17 = v22;
  v16[2] = a3;
  v16[3] = v17;
  v16[4] = a2;
  aBlock[4] = sub_245E2B084;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_245E2A770;
  aBlock[3] = &block_descriptor_1;
  v18 = _Block_copy(aBlock);
  v19 = a3;
  swift_retain();
  sub_245E3CBEC();
  v26 = MEMORY[0x24BEE4AF8];
  sub_245E2B0A8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257524588);
  sub_245E2B0F0();
  sub_245E3CED4();
  MEMORY[0x24954A2F8](0, v10, v7, v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v5);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v24);
  return swift_release();
}

void sub_245E29ED8(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  char *v13;
  _QWORD aBlock[6];

  v6 = sub_245E3CBC8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245E3CB08();
  sub_245E3CBB0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v10 = *(void **)&a1[OBJC_IVAR____TtC21SeymourClientServices17AppRecordObserver_query];
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a2;
  v11[3] = a3;
  v11[4] = a1;
  aBlock[4] = sub_245E2B168;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_245E2AC8C;
  aBlock[3] = &block_descriptor_9;
  v12 = _Block_copy(aBlock);
  swift_retain();
  v13 = a1;
  swift_release();
  objc_msgSend(v10, sel_executeQueryWithResultHandler_, v12);
  _Block_release(v12);
}

uint64_t sub_245E2A034(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
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
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  void *v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  char *v56;
  void *v57;
  _QWORD *v58;
  uint64_t v59;
  void *v60;
  id v61;
  uint64_t v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t aBlock;
  uint64_t v76;
  uint64_t (*v77)();
  void *v78;
  uint64_t (*v79)();
  _QWORD *v80;

  v68 = a3;
  v69 = a4;
  v8 = sub_245E3CBD4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v63 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_245E3CBF8();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v70 = (char *)&v63 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_245E3CBC8();
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v63 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v63 - v20;
  v71 = v13;
  v72 = v22;
  v73 = v19;
  if (a1)
  {
    v23 = a5;
    v24 = swift_bridgeObjectRetain();
    v25 = sub_245E2B288(v24, v23);

    sub_245E3CB08();
    swift_bridgeObjectRetain();
    v26 = sub_245E3CBBC();
    v27 = sub_245E3CE14();
    v28 = v27;
    if (os_log_type_enabled(v26, v27))
    {
      v29 = swift_slowAlloc();
      v66 = v25;
      v30 = v29;
      v31 = swift_slowAlloc();
      v65 = v31;
      *(_DWORD *)v30 = 141558274;
      v74 = 1752392040;
      aBlock = v31;
      v64 = v28;
      sub_245E3CE80();
      *(_WORD *)(v30 + 12) = 2080;
      v63 = v30 + 14;
      v32 = v11;
      v33 = v9;
      v34 = v8;
      v35 = sub_245E24A9C(0, &qword_257524598);
      v36 = swift_bridgeObjectRetain();
      v37 = MEMORY[0x24954A1FC](v36, v35);
      v67 = (char *)v12;
      v39 = v38;
      swift_bridgeObjectRelease();
      v40 = v37;
      v8 = v34;
      v9 = v33;
      v11 = v32;
      v74 = sub_245E19CDC(v40, v39, &aBlock);
      sub_245E3CE80();
      swift_bridgeObjectRelease_n();
      v12 = (uint64_t)v67;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_245E10000, v26, (os_log_type_t)v64, "Filtering %{mask.hash}s", (uint8_t *)v30, 0x16u);
      v41 = v65;
      swift_arrayDestroy();
      MEMORY[0x24954AA78](v41, -1, -1);
      v42 = v30;
      v25 = v66;
      MEMORY[0x24954AA78](v42, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v72 + 8))(v18, v73);
    sub_245E24A9C(0, (unint64_t *)&qword_257524780);
    v51 = (void *)sub_245E3CE20();
    v52 = (_QWORD *)swift_allocObject();
    v53 = v68;
    v54 = v69;
    v52[2] = v25;
    v52[3] = v53;
    v52[4] = v54;
    v79 = sub_245E2B1D8;
    v80 = v52;
    aBlock = MEMORY[0x24BDAC760];
    v76 = 1107296256;
    v77 = sub_245E2A770;
    v78 = &block_descriptor_21;
    v55 = _Block_copy(&aBlock);
    swift_retain();
    v56 = v70;
    sub_245E3CBEC();
    v74 = MEMORY[0x24BEE4AF8];
    sub_245E2B0A8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_257524588);
    sub_245E2B0F0();
    sub_245E3CED4();
    MEMORY[0x24954A2F8](0, v56, v11, v55);
    _Block_release(v55);

  }
  else
  {
    v67 = v11;
    sub_245E3CB08();
    v43 = a2;
    v44 = a2;
    v45 = sub_245E3CBBC();
    v46 = sub_245E3CE08();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = (uint8_t *)swift_slowAlloc();
      v48 = swift_slowAlloc();
      v74 = (uint64_t)a2;
      aBlock = v48;
      v65 = v9;
      v66 = v8;
      *(_DWORD *)v47 = 136446210;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2575245A0);
      v49 = sub_245E3CE5C();
      v74 = sub_245E19CDC(v49, v50, &aBlock);
      v9 = v65;
      v8 = v66;
      sub_245E3CE80();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_245E10000, v45, v46, "Failed to execute query: %{public}s", v47, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24954AA78](v48, -1, -1);
      MEMORY[0x24954AA78](v47, -1, -1);
    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v72 + 8))(v21, v73);
    sub_245E24A9C(0, (unint64_t *)&qword_257524780);
    v57 = (void *)sub_245E3CE20();
    v58 = (_QWORD *)swift_allocObject();
    v59 = v69;
    v58[2] = v68;
    v58[3] = v59;
    v58[4] = a2;
    v79 = sub_245E2B1A0;
    v80 = v58;
    aBlock = MEMORY[0x24BDAC760];
    v76 = 1107296256;
    v77 = sub_245E2A770;
    v78 = &block_descriptor_15;
    v60 = _Block_copy(&aBlock);
    v61 = a2;
    swift_retain();
    v56 = v70;
    sub_245E3CBEC();
    v74 = MEMORY[0x24BEE4AF8];
    sub_245E2B0A8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_257524588);
    sub_245E2B0F0();
    v11 = v67;
    sub_245E3CED4();
    MEMORY[0x24954A2F8](0, v56, v11, v60);
    _Block_release(v60);

  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  (*(void (**)(char *, uint64_t))(v71 + 8))(v56, v12);
  return swift_release();
}

uint64_t sub_245E2A6E8(void (*a1)(_QWORD *), int a2, id a3)
{
  uint64_t v5;
  _BYTE *v6;
  id v7;
  _QWORD v9[5];
  char v10;

  if (a3)
  {
    v5 = (uint64_t)a3;
  }
  else
  {
    sub_245E2B224();
    v5 = swift_allocError();
    *v6 = 5;
  }
  v9[0] = v5;
  v10 = 1;
  v7 = a3;
  a1(v9);
  return sub_245E2B1E4((uint64_t)v9);
}

uint64_t sub_245E2A774(unint64_t a1, void (*a2)(_QWORD))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t result;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  _BYTE *v42;
  _QWORD v43[2];
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(_QWORD);
  uint64_t v49;
  uint64_t v50[5];
  char v51;

  v4 = sub_245E3CBC8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v43 - v9;
  if (!(a1 >> 62))
  {
    v11 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v11)
      goto LABEL_3;
LABEL_11:
    swift_bridgeObjectRelease();
    sub_245E3CB08();
    swift_bridgeObjectRetain_n();
    v31 = sub_245E3CBBC();
    v32 = sub_245E3CE14();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = swift_slowAlloc();
      v34 = swift_slowAlloc();
      v47 = v5;
      v35 = v34;
      *(_DWORD *)v33 = 141558274;
      v49 = 1752392040;
      v50[0] = v34;
      v46 = v4;
      sub_245E3CE80();
      *(_WORD *)(v33 + 12) = 2080;
      v48 = a2;
      v45 = v33 + 14;
      v36 = sub_245E24A9C(0, &qword_257524598);
      v37 = swift_bridgeObjectRetain();
      v38 = MEMORY[0x24954A1FC](v37, v36);
      v40 = v39;
      swift_bridgeObjectRelease();
      v49 = sub_245E19CDC(v38, v40, v50);
      a2 = v48;
      sub_245E3CE80();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_245E10000, v31, v32, "No app found from %{mask.hash}s!", (uint8_t *)v33, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24954AA78](v35, -1, -1);
      MEMORY[0x24954AA78](v33, -1, -1);

      (*(void (**)(char *, uint64_t))(v47 + 8))(v10, v46);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    }
    sub_245E2B224();
    v41 = swift_allocError();
    *v42 = 3;
    v50[0] = v41;
    v51 = 1;
    a2(v50);
    return sub_245E2B1E4((uint64_t)v50);
  }
  swift_bridgeObjectRetain();
  result = sub_245E3CFD0();
  if (!result)
    goto LABEL_11;
LABEL_3:
  if ((a1 & 0xC000000000000001) != 0)
  {
    v13 = (id)MEMORY[0x24954A43C](0, a1);
    goto LABEL_6;
  }
  if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v13 = *(id *)(a1 + 32);
LABEL_6:
    v14 = v13;
    swift_bridgeObjectRelease();
    sub_245E3CB08();
    v15 = v14;
    v16 = sub_245E3CBBC();
    v17 = sub_245E3CE14();
    v18 = v17;
    if (os_log_type_enabled(v16, v17))
    {
      v19 = swift_slowAlloc();
      v44 = v18;
      v20 = v19;
      v21 = swift_slowAlloc();
      v45 = v21;
      *(_DWORD *)v20 = 141558274;
      v49 = 1752392040;
      v50[0] = v21;
      sub_245E3CE80();
      *(_WORD *)(v20 + 12) = 2080;
      v43[1] = v20 + 14;
      v22 = v15;
      v48 = a2;
      v23 = v22;
      v24 = objc_msgSend(v22, sel_description);
      v25 = sub_245E3CC64();
      v46 = v4;
      v47 = v5;
      v26 = v25;
      v28 = v27;

      v49 = sub_245E19CDC(v26, v28, v50);
      sub_245E3CE80();

      a2 = v48;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_245E10000, v16, (os_log_type_t)v44, "Found app %{mask.hash}s!", (uint8_t *)v20, 0x16u);
      v29 = v45;
      swift_arrayDestroy();
      MEMORY[0x24954AA78](v29, -1, -1);
      MEMORY[0x24954AA78](v20, -1, -1);

      (*(void (**)(char *, uint64_t))(v47 + 8))(v8, v46);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
    v50[3] = sub_245E24A9C(0, &qword_257524598);
    v50[4] = (uint64_t)&protocol witness table for ASDApp;
    v50[0] = (uint64_t)v15;
    v51 = 0;
    v30 = v15;
    a2(v50);

    return sub_245E2B1E4((uint64_t)v50);
  }
  __break(1u);
  return result;
}

uint64_t sub_245E2AC8C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void (*v5)(uint64_t, void *);
  id v6;

  v4 = a2;
  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_245E24A9C(0, &qword_257524598);
    v4 = sub_245E3CD24();
  }
  swift_retain();
  v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_245E2AD18()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC21SeymourClientServices17AppRecordObserver_onRecordUpdated);
  swift_beginAccess();
  v2 = *v1;
  sub_245E2B278(*v1);
  return v2;
}

uint64_t sub_245E2AD70(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;

  v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC21SeymourClientServices17AppRecordObserver_onRecordUpdated);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a1;
  v5[1] = a2;
  return sub_245E2B268(v6);
}

uint64_t (*sub_245E2ADCC())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

char *sub_245E2AE14(uint64_t a1, uint64_t a2)
{
  id v4;

  v4 = objc_allocWithZone((Class)type metadata accessor for AppRecordObserver());
  return sub_245E29A94(a1, a2);
}

uint64_t sub_245E2AE50()
{
  void *v0;
  id v1;

  *(_QWORD *)(swift_allocObject() + 16) = v0;
  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257524570);
  return sub_245E3C9C4();
}

void sub_245E2AEB4(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t *v6;
  void (*v7)(_QWORD *);
  id v8;
  _QWORD v9[5];

  v3 = a1 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x24954AB20](v3);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (uint64_t *)(v4 + OBJC_IVAR____TtC21SeymourClientServices17AppRecordObserver_onRecordUpdated);
    swift_beginAccess();
    v7 = (void (*)(_QWORD *))*v6;
    sub_245E2B278(*v6);

    if (v7)
    {
      v9[3] = sub_245E24A9C(0, &qword_257524598);
      v9[4] = &protocol witness table for ASDApp;
      v9[0] = a2;
      v8 = a2;
      v7(v9);
      sub_245E2B268((uint64_t)v7);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
    }
  }
}

uint64_t sub_245E2AF88(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_245E2B02C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_245E2B050(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_245E29C7C(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_245E2B058()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_245E2B084()
{
  uint64_t v0;

  sub_245E29ED8(*(char **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

unint64_t sub_245E2B0A8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257524580;
  if (!qword_257524580)
  {
    v1 = sub_245E3CBD4();
    result = MEMORY[0x24954A9D0](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_257524580);
  }
  return result;
}

unint64_t sub_245E2B0F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257524590;
  if (!qword_257524590)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257524588);
    result = MEMORY[0x24954A9D0](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_257524590);
  }
  return result;
}

uint64_t sub_245E2B13C()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_245E2B168(uint64_t a1, void *a2)
{
  uint64_t v2;

  return sub_245E2A034(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(void **)(v2 + 32));
}

uint64_t sub_245E2B174()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_245E2B1A0()
{
  uint64_t v0;

  return sub_245E2A6E8(*(void (**)(_QWORD *))(v0 + 16), *(_QWORD *)(v0 + 24), *(id *)(v0 + 32));
}

uint64_t sub_245E2B1AC()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245E2B1D8()
{
  uint64_t v0;

  return sub_245E2A774(*(_QWORD *)(v0 + 16), *(void (**)(_QWORD))(v0 + 24));
}

uint64_t sub_245E2B1E4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257524770);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_245E2B224()
{
  unint64_t result;

  result = qword_2575245B0;
  if (!qword_2575245B0)
  {
    result = MEMORY[0x24954A9D0](&protocol conformance descriptor for AppInstallError, &type metadata for AppInstallError);
    atomic_store(result, (unint64_t *)&qword_2575245B0);
  }
  return result;
}

uint64_t sub_245E2B268(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_245E2B278(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_245E2B288(unint64_t a1, uint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t *v13;
  char v15;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;

  v3 = a1;
  v19 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_22;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v4)
  {
    while (1)
    {
      v5 = 0;
      v6 = (uint64_t *)((char *)a2 + OBJC_IVAR____TtC21SeymourClientServices17AppRecordObserver_bundleIdentifier);
      v18 = v3 & 0xC000000000000001;
      v17 = v3 & 0xFFFFFFFFFFFFFF8;
      while (v18)
      {
        v7 = (id)MEMORY[0x24954A43C](v5, v3);
LABEL_9:
        v8 = v7;
        v9 = v5 + 1;
        if (__OFADD__(v5, 1))
          goto LABEL_21;
        v10 = v3;
        v11 = objc_msgSend(v7, sel_bundleID);
        v12 = sub_245E3CC64();
        a2 = v13;

        if (v12 == *v6 && a2 == (uint64_t *)v6[1])
        {
          swift_bridgeObjectRelease();
LABEL_17:
          sub_245E3CF88();
          sub_245E3CFAC();
          sub_245E3CFB8();
          a2 = &v19;
          sub_245E3CF94();
          goto LABEL_5;
        }
        v15 = sub_245E3D06C();
        swift_bridgeObjectRelease();
        if ((v15 & 1) != 0)
          goto LABEL_17;

LABEL_5:
        v3 = v10;
        ++v5;
        if (v9 == v4)
          return v19;
      }
      if (v5 < *(_QWORD *)(v17 + 16))
        break;
      __break(1u);
LABEL_21:
      __break(1u);
LABEL_22:
      v4 = sub_245E3CFD0();
      if (!v4)
        return MEMORY[0x24BEE4AF8];
    }
    v7 = *(id *)(v3 + 8 * v5 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_245E2B448()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t result;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  _QWORD aBlock[7];

  v1 = sub_245E3CBD4();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&aBlock[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_245E3CBF8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&aBlock[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = v0;
  v10 = swift_bridgeObjectRetain();
  v11 = sub_245E2B288(v10, v9);
  swift_bridgeObjectRelease();

  if (v11 >> 62)
  {
    result = sub_245E3CFD0();
    if (result)
      goto LABEL_3;
    return swift_bridgeObjectRelease();
  }
  result = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!result)
    return swift_bridgeObjectRelease();
LABEL_3:
  v20 = v2;
  if ((v11 & 0xC000000000000001) != 0)
  {
    v13 = (id)MEMORY[0x24954A43C](0, v11);
    goto LABEL_6;
  }
  if (*(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v13 = *(id *)(v11 + 32);
LABEL_6:
    v14 = v13;
    swift_bridgeObjectRelease();
    sub_245E24A9C(0, (unint64_t *)&qword_257524780);
    v15 = (void *)sub_245E3CE20();
    v16 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v17 = swift_allocObject();
    *(_QWORD *)(v17 + 16) = v16;
    *(_QWORD *)(v17 + 24) = v14;
    aBlock[4] = sub_245E2B758;
    aBlock[5] = v17;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_245E2A770;
    aBlock[3] = &block_descriptor_30;
    v18 = _Block_copy(aBlock);
    v19 = v14;
    swift_release();
    sub_245E3CBEC();
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_245E2B0A8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_257524588);
    sub_245E2B0F0();
    sub_245E3CED4();
    MEMORY[0x24954A2F8](0, v8, v4, v18);
    _Block_release(v18);

    (*(void (**)(char *, uint64_t))(v20 + 8))(v4, v1);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  __break(1u);
  return result;
}

uint64_t sub_245E2B708()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_245E2B72C()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_245E2B758()
{
  uint64_t v0;

  sub_245E2AEB4(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

unint64_t sub_245E2B780(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575245F0);
  v2 = (_QWORD *)sub_245E3CFF4();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    result = sub_245E2E2DC(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_245E2B890(uint64_t a1)
{
  return sub_245E2BD18(a1, &qword_257524610);
}

unint64_t sub_245E2B89C(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257524600);
  v2 = sub_245E3CFF4();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_245E2E340(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_245E2E2DC(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_245E28494(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_245E2B9C4(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575245E0);
  v2 = (_QWORD *)sub_245E3CFF4();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v8 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_245E2E2DC(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (_QWORD *)(v2[7] + 16 * result);
    *v12 = v8;
    v12[1] = v7;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_245E2BAE4(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575245D8);
  v2 = (_QWORD *)sub_245E3CFF4();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_BYTE *)(a1 + 48);
  while (1)
  {
    v5 = *((_QWORD *)v4 - 2);
    v6 = *((_QWORD *)v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    result = sub_245E2E2DC(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_BYTE *)(v2[7] + result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4 += 24;
    v2[2] = v13;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_245E2BBF4(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575245F8);
  v2 = (_QWORD *)sub_245E3CFF4();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 48);
  while (1)
  {
    v5 = (uint64_t)*(v4 - 2);
    v6 = (uint64_t)*(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    v8 = v7;
    result = sub_245E2E2DC(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_245E2BD0C(uint64_t a1)
{
  return sub_245E2BD18(a1, &qword_2575245E8);
}

unint64_t sub_245E2BD18(uint64_t a1, uint64_t *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v3 = (_QWORD *)sub_245E3CFF4();
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  v5 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v6 = *(v5 - 2);
    v7 = *(v5 - 1);
    v8 = *v5;
    swift_bridgeObjectRetain();
    result = sub_245E2E2DC(v6, v7);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v6;
    v11[1] = v7;
    *(_QWORD *)(v3[7] + 8 * result) = v8;
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v5 += 3;
    v3[2] = v14;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_245E2BE24(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  char v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575245D0);
  v2 = (_QWORD *)sub_245E3CFF4();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_BYTE *)(a1 + 52);
  while (1)
  {
    v5 = *(_QWORD *)(v4 - 20);
    v6 = *(_QWORD *)(v4 - 12);
    v7 = *((_DWORD *)v4 - 1);
    v8 = *v4;
    swift_bridgeObjectRetain();
    result = sub_245E2E2DC(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = v2[7] + 8 * result;
    *(_DWORD *)v12 = v7;
    *(_BYTE *)(v12 + 4) = v8;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v2[2] = v15;
    v4 += 24;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

void PersonalizationAwardProgressReference.init(fromACHProgressUpdate:modalityReferences:)(void *a1, uint64_t a2)
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t inited;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 *v17;
  unsigned __int8 *v18;
  unint64_t v19;
  char v20;
  unsigned __int8 v21;
  BOOL v22;
  unsigned int v23;
  uint64_t v24;
  unsigned __int8 *v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  unint64_t v30;
  id v31;
  uint64_t v32;
  unsigned __int8 *v33;
  unsigned int v34;
  uint64_t v35;
  unsigned __int8 v36;
  uint64_t v37;
  uint64_t v38;
  unsigned __int8 *v39;
  unsigned int v40;
  uint64_t v41;
  _QWORD v42[3];
  char v43;

  v4 = objc_msgSend(a1, sel_goalQuantity);
  if (v4)
  {
    v5 = v4;
    sub_245E1BABC();

  }
  v6 = objc_msgSend(a1, sel_progressQuantity);
  if (v6)
  {
    v7 = v6;
    sub_245E1BABC();

  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575245C0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_245E3DA50;
  *(_QWORD *)(inited + 32) = 0xD000000000000012;
  *(_QWORD *)(inited + 40) = 0x8000000245E3F270;
  v9 = ACHAchievementProgressUpdate.modalityIdentifier(from:)(a2);
  v11 = v10;
  swift_bridgeObjectRelease();
  if (v11)
    v12 = v9;
  else
    v12 = 0;
  if (v11)
    v13 = v11;
  else
    v13 = 0xE000000000000000;
  v14 = HIBYTE(v13) & 0xF;
  v15 = v12 & 0xFFFFFFFFFFFFLL;
  if ((v13 & 0x2000000000000000) != 0)
    v16 = HIBYTE(v13) & 0xF;
  else
    v16 = v12 & 0xFFFFFFFFFFFFLL;
  if (!v16)
  {
    swift_bridgeObjectRelease();
    v29 = 0;
    LOBYTE(v28) = 1;
LABEL_51:
    *(_DWORD *)(inited + 48) = v29;
    *(_BYTE *)(inited + 52) = v28;
    v30 = sub_245E2BE24(inited);
    sub_245E2C37C(v30);
    swift_bridgeObjectRelease();
    ACHAchievementProgressUpdate.isRequired.getter();
    v31 = objc_msgSend(a1, sel_templateUniqueName);
    sub_245E3CC64();

    sub_245E3C880();
    return;
  }
  if ((v13 & 0x1000000000000000) != 0)
  {
    v19 = sub_245E2D840(v12, v13, 10);
    swift_bridgeObjectRelease();
    v28 = HIDWORD(v19) & 1;
LABEL_48:
    if ((_DWORD)v28)
      v29 = 0;
    else
      v29 = v19;
    goto LABEL_51;
  }
  if ((v13 & 0x2000000000000000) == 0)
  {
    if ((v12 & 0x1000000000000000) != 0)
      v17 = (unsigned __int8 *)((v13 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v17 = (unsigned __int8 *)sub_245E3CF7C();
    v18 = sub_245E2DBA0(v17, v15, 10);
    LODWORD(v19) = (_DWORD)v18;
    v43 = BYTE4(v18) & 1;
    v20 = BYTE4(v18) & 1;
    goto LABEL_47;
  }
  v42[0] = v12;
  v42[1] = v13 & 0xFFFFFFFFFFFFFFLL;
  if (v12 == 43)
  {
    if (v14)
    {
      if (v14 != 1)
      {
        LODWORD(v19) = (BYTE1(v12) - 48);
        if (v19 <= 9)
        {
          if (v14 == 2)
            goto LABEL_46;
          if ((BYTE2(v12) - 48) <= 9u)
          {
            LODWORD(v19) = 10 * v19 + (BYTE2(v12) - 48);
            v24 = v14 - 3;
            if (v24)
            {
              v25 = (unsigned __int8 *)v42 + 3;
              while (1)
              {
                v26 = *v25 - 48;
                if (v26 > 9)
                  goto LABEL_43;
                v27 = 10 * v19;
                if ((v27 & 0xFFFFFFFF00000000) != 0)
                  goto LABEL_43;
                LODWORD(v19) = v27 + v26;
                if (__CFADD__((_DWORD)v27, v26))
                  goto LABEL_43;
                v20 = 0;
                ++v25;
                if (!--v24)
                  goto LABEL_47;
              }
            }
            goto LABEL_46;
          }
        }
      }
      goto LABEL_43;
    }
  }
  else
  {
    if (v12 != 45)
    {
      if (v14)
      {
        LODWORD(v19) = (v12 - 48);
        if (v19 <= 9)
        {
          if (v14 == 1)
            goto LABEL_46;
          if ((BYTE1(v12) - 48) <= 9u)
          {
            LODWORD(v19) = 10 * v19 + (BYTE1(v12) - 48);
            v32 = v14 - 2;
            if (v32)
            {
              v33 = (unsigned __int8 *)v42 + 2;
              while (1)
              {
                v34 = *v33 - 48;
                if (v34 > 9)
                  goto LABEL_43;
                v35 = 10 * v19;
                if ((v35 & 0xFFFFFFFF00000000) != 0)
                  goto LABEL_43;
                LODWORD(v19) = v35 + v34;
                if (__CFADD__((_DWORD)v35, v34))
                  goto LABEL_43;
                v20 = 0;
                ++v33;
                if (!--v32)
                  goto LABEL_47;
              }
            }
            goto LABEL_46;
          }
        }
      }
LABEL_43:
      LODWORD(v19) = 0;
LABEL_44:
      v20 = 1;
      goto LABEL_47;
    }
    if (v14)
    {
      if (v14 != 1)
      {
        v21 = BYTE1(v12) - 48;
        if ((BYTE1(v12) - 48) <= 9u)
        {
          LODWORD(v19) = 0;
          v22 = v21 == 0;
          v23 = -v21;
          if (!v22)
            goto LABEL_44;
          if (v14 == 2)
          {
            v20 = 0;
            LODWORD(v19) = v23;
LABEL_47:
            swift_bridgeObjectRelease();
            LODWORD(v28) = v20 & 1;
            goto LABEL_48;
          }
          v36 = BYTE2(v12) - 48;
          if ((BYTE2(v12) - 48) <= 9u)
          {
            v37 = 10 * v23;
            if ((v37 & 0xFFFFFFFF00000000) == 0)
            {
              LODWORD(v19) = v37 - v36;
              if (v37 >= v36)
              {
                v38 = v14 - 3;
                if (v38)
                {
                  v39 = (unsigned __int8 *)v42 + 3;
                  while (1)
                  {
                    v40 = *v39 - 48;
                    if (v40 > 9)
                      goto LABEL_43;
                    v41 = 10 * v19;
                    if ((v41 & 0xFFFFFFFF00000000) != 0)
                      goto LABEL_43;
                    LODWORD(v19) = v41 - v40;
                    if (v41 < v40)
                      goto LABEL_43;
                    v20 = 0;
                    ++v39;
                    if (!--v38)
                      goto LABEL_47;
                  }
                }
LABEL_46:
                v20 = 0;
                goto LABEL_47;
              }
            }
          }
        }
      }
      goto LABEL_43;
    }
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_245E2C37C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  _QWORD *v32;
  int v33;
  uint64_t v34;

  v2 = MEMORY[0x24BEE4B00];
  v3 = a1 + 64;
  v34 = MEMORY[0x24BEE4B00];
  v4 = -1 << *(_BYTE *)(a1 + 32);
  if (-v4 < 64)
    v5 = ~(-1 << -(char)v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v7 = (unint64_t)(63 - v4) >> 6;
  result = swift_bridgeObjectRetain();
  v9 = 0;
  if (!v6)
    goto LABEL_8;
LABEL_5:
  v10 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  v11 = v10 | (v9 << 6);
  while (1)
  {
    v12 = *(_QWORD *)(a1 + 56) + 8 * v11;
    if ((*(_BYTE *)(v12 + 4) & 1) != 0)
    {
      if (v6)
        goto LABEL_5;
    }
    else
    {
      v17 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v11);
      v18 = *v17;
      v19 = v17[1];
      v20 = *(_DWORD *)v12;
      v21 = *(_QWORD *)(v2 + 16);
      v33 = v20;
      if (*(_QWORD *)(v2 + 24) <= v21)
      {
        v22 = v21 + 1;
        swift_bridgeObjectRetain();
        sub_245E2D360(v22, 1);
        v2 = v34;
      }
      else
      {
        swift_bridgeObjectRetain();
      }
      sub_245E3D0CC();
      sub_245E3CC88();
      result = sub_245E3D0E4();
      v23 = v2 + 64;
      v24 = -1 << *(_BYTE *)(v2 + 32);
      v25 = result & ~v24;
      v26 = v25 >> 6;
      if (((-1 << v25) & ~*(_QWORD *)(v2 + 64 + 8 * (v25 >> 6))) == 0)
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v24) >> 6;
        while (++v26 != v29 || (v28 & 1) == 0)
        {
          v30 = v26 == v29;
          if (v26 == v29)
            v26 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v23 + 8 * v26);
          if (v31 != -1)
          {
            v27 = __clz(__rbit64(~v31)) + (v26 << 6);
            goto LABEL_37;
          }
        }
        goto LABEL_41;
      }
      v27 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v2 + 64 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
LABEL_37:
      *(_QWORD *)(v23 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
      v32 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v27);
      *v32 = v18;
      v32[1] = v19;
      *(_DWORD *)(*(_QWORD *)(v2 + 56) + 4 * v27) = v33;
      ++*(_QWORD *)(v2 + 16);
      if (v6)
        goto LABEL_5;
    }
LABEL_8:
    v13 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    if (v13 >= v7)
      goto LABEL_39;
    v14 = *(_QWORD *)(v3 + 8 * v13);
    v15 = v9 + 1;
    if (!v14)
    {
      v15 = v9 + 2;
      if (v9 + 2 >= v7)
        goto LABEL_39;
      v14 = *(_QWORD *)(v3 + 8 * v15);
      if (!v14)
      {
        v15 = v9 + 3;
        if (v9 + 3 >= v7)
          goto LABEL_39;
        v14 = *(_QWORD *)(v3 + 8 * v15);
        if (!v14)
        {
          v15 = v9 + 4;
          if (v9 + 4 >= v7)
            goto LABEL_39;
          v14 = *(_QWORD *)(v3 + 8 * v15);
          if (!v14)
            break;
        }
      }
    }
LABEL_23:
    v6 = (v14 - 1) & v14;
    v11 = __clz(__rbit64(v14)) + (v15 << 6);
    v9 = v15;
  }
  v16 = v9 + 5;
  if (v9 + 5 >= v7)
  {
LABEL_39:
    sub_245E1A718();
    return v2;
  }
  v14 = *(_QWORD *)(v3 + 8 * v16);
  if (v14)
  {
    v15 = v9 + 5;
    goto LABEL_23;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v7)
      goto LABEL_39;
    v14 = *(_QWORD *)(v3 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_23;
  }
LABEL_42:
  __break(1u);
  return result;
}

_QWORD *sub_245E2C660(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25441B620);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_245E2C6C4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_245E3CCDC();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x24954A184](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t sub_245E2C73C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575245F0);
  v37 = a2;
  v6 = sub_245E3CFE8();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v2;
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v11)
        goto LABEL_33;
      v24 = *(_QWORD *)(v36 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v24 = *(_QWORD *)(v36 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_245E3D0CC();
    sub_245E3CC88();
    result = sub_245E3D0E4();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v23 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_245E2CA40(uint64_t a1, char a2)
{
  return sub_245E2CD54(a1, a2, &qword_257524610);
}

uint64_t sub_245E2CA4C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  _QWORD *v34;
  _OWORD v35[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257524600);
  v6 = sub_245E3CFE8();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v34 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v13 << 6);
      }
      else
      {
        v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33)
          goto LABEL_34;
        v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          v13 = v18 + 1;
          if (v18 + 1 >= v33)
            goto LABEL_34;
          v19 = v34[v13];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              v3 = v2;
              if ((a2 & 1) != 0)
              {
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 >= 64)
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v34 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                v13 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_41;
                if (v13 >= v33)
                  goto LABEL_34;
                v19 = v34[v13];
                ++v20;
                if (v19)
                  goto LABEL_21;
              }
            }
            v13 = v20;
          }
        }
LABEL_21:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
      v23 = *v21;
      v22 = v21[1];
      v24 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v17);
      if ((a2 & 1) != 0)
      {
        sub_245E28494(v24, v35);
      }
      else
      {
        sub_245E1A654((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_245E3D0CC();
      sub_245E3CC88();
      result = sub_245E3D0E4();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
      *v15 = v23;
      v15[1] = v22;
      result = (uint64_t)sub_245E28494(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_245E2CD48(uint64_t a1, char a2)
{
  return sub_245E2CD54(a1, a2, &qword_2575245E8);
}

uint64_t sub_245E2CD54(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;

  v4 = v3;
  v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v38 = a2;
  v7 = sub_245E3CFE8();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_40;
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v37 = v6 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v6 + 64);
  v35 = v3;
  v36 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v36)
      break;
    v23 = (_QWORD *)(v6 + 64);
    v24 = *(_QWORD *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v36)
        goto LABEL_33;
      v24 = *(_QWORD *)(v37 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v36)
        {
LABEL_33:
          swift_release();
          v4 = v35;
          if ((v38 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v36)
              goto LABEL_33;
            v24 = *(_QWORD *)(v37 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v11 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = (uint64_t *)(*(_QWORD *)(v6 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v21);
    if ((v38 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_245E3D0CC();
    sub_245E3CC88();
    result = sub_245E3D0E4();
    v15 = -1 << *(_BYTE *)(v8 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release();
  v4 = v35;
  v23 = (_QWORD *)(v6 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v6 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v6 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v4 = v8;
  return result;
}

uint64_t sub_245E2D058(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575245D8);
  v37 = a2;
  v6 = sub_245E3CFE8();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = v2;
  v35 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v35)
        goto LABEL_33;
      v23 = *(_QWORD *)(v36 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v35)
              goto LABEL_33;
            v23 = *(_QWORD *)(v36 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_BYTE *)(*(_QWORD *)(v5 + 56) + v20);
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_245E3D0CC();
    sub_245E3CC88();
    result = sub_245E3D0E4();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_BYTE *)(*(_QWORD *)(v7 + 56) + v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v34;
  v22 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_245E2D360(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575245C8);
  v37 = a2;
  v6 = sub_245E3CFE8();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = v2;
  v35 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v35)
        goto LABEL_33;
      v23 = *(_QWORD *)(v36 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v35)
              goto LABEL_33;
            v23 = *(_QWORD *)(v36 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_DWORD *)(*(_QWORD *)(v5 + 56) + 4 * v20);
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_245E3D0CC();
    sub_245E3CC88();
    result = sub_245E3D0E4();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_DWORD *)(*(_QWORD *)(v7 + 56) + 4 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v34;
  v22 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_245E2D668(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_245E3D06C() & 1) == 0)
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
      while (!v14 && (sub_245E3D06C() & 1) == 0);
    }
  }
  return v6;
}

unsigned __int8 *sub_245E2D748(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  return sub_245E2D924(a1, a2, a3);
}

unsigned __int8 *sub_245E2D75C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v14 = a2;
  swift_bridgeObjectRetain();
  v5 = sub_245E3CCE8();
  v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v8 = HIBYTE(v6) & 0xF;
    v13 = v5;
    v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  v5 = sub_245E2DE20();
  v10 = v9;
  swift_bridgeObjectRelease();
  v6 = v10;
  if ((v10 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = (unsigned __int8 *)sub_245E3CF7C();
  }
LABEL_7:
  v11 = sub_245E2D924(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_245E2D840(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v14 = a2;
  swift_bridgeObjectRetain();
  v5 = sub_245E3CCE8();
  v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v8 = HIBYTE(v6) & 0xF;
    v13 = v5;
    v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  v5 = sub_245E2DE20();
  v10 = v9;
  swift_bridgeObjectRelease();
  v6 = v10;
  if ((v10 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = (unsigned __int8 *)sub_245E3CF7C();
  }
LABEL_7:
  v11 = sub_245E2DBA0(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11 | ((((unint64_t)v11 >> 32) & 1) << 32);
}

unsigned __int8 *sub_245E2D924(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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

unsigned __int8 *sub_245E2DBA0(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned int v8;
  unsigned __int8 *v9;
  unsigned int v10;
  char v11;
  unsigned int v12;
  unsigned __int8 v13;
  unint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  unsigned __int8 *v20;
  unsigned int v21;
  char v22;
  unint64_t v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  unsigned int v28;
  unsigned int v29;
  char v30;
  unint64_t v31;
  unsigned __int8 v32;

  v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      v16 = a2 - 1;
      if (a2 != 1)
      {
        v17 = a3 + 87;
        if (a3 > 10)
        {
          v18 = a3 + 55;
        }
        else
        {
          v17 = 97;
          v18 = 65;
        }
        if (a3 <= 10)
          v19 = a3 + 48;
        else
          v19 = 58;
        if (result)
        {
          v8 = 0;
          v20 = result + 1;
          do
          {
            v21 = *v20;
            if (v21 < 0x30 || v21 >= v19)
            {
              if (v21 < 0x41 || v21 >= v18)
              {
                v12 = 0;
                v13 = 1;
                if (v21 < 0x61 || v21 >= v17)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v22 = -87;
              }
              else
              {
                v22 = -55;
              }
            }
            else
            {
              v22 = -48;
            }
            v23 = v8 * (unint64_t)a3;
            if ((v23 & 0xFFFFFFFF00000000) != 0)
              goto LABEL_72;
            v24 = v21 + v22;
            v8 = v23 + v24;
            if (__CFADD__((_DWORD)v23, v24))
              goto LABEL_72;
            ++v20;
            --v16;
          }
          while (v16);
LABEL_48:
          v13 = 0;
          v12 = v8;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
LABEL_72:
      v12 = 0;
      v13 = 1;
      return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        v25 = a3 + 87;
        if (a3 > 10)
        {
          v26 = a3 + 55;
        }
        else
        {
          v25 = 97;
          v26 = 65;
        }
        if (a3 <= 10)
          v27 = a3 + 48;
        else
          v27 = 58;
        if (result)
        {
          v28 = 0;
          do
          {
            v29 = *result;
            if (v29 < 0x30 || v29 >= v27)
            {
              if (v29 < 0x41 || v29 >= v26)
              {
                v12 = 0;
                v13 = 1;
                if (v29 < 0x61 || v29 >= v25)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v30 = -87;
              }
              else
              {
                v30 = -55;
              }
            }
            else
            {
              v30 = -48;
            }
            v31 = v28 * (unint64_t)a3;
            if ((v31 & 0xFFFFFFFF00000000) != 0)
              goto LABEL_72;
            v32 = v29 + v30;
            v28 = v31 + v32;
            if (__CFADD__((_DWORD)v31, v32))
              goto LABEL_72;
            ++result;
            --a2;
          }
          while (a2);
          v13 = 0;
          v12 = v28;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      v4 = a2 - 1;
      if (a2 != 1)
      {
        v5 = a3 + 87;
        if (a3 > 10)
        {
          v6 = a3 + 55;
        }
        else
        {
          v5 = 97;
          v6 = 65;
        }
        if (a3 <= 10)
          v7 = a3 + 48;
        else
          v7 = 58;
        if (result)
        {
          v8 = 0;
          v9 = result + 1;
          while (1)
          {
            v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                v12 = 0;
                v13 = 1;
                if (v10 < 0x61 || v10 >= v5)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v11 = -87;
              }
              else
              {
                v11 = -55;
              }
            }
            else
            {
              v11 = -48;
            }
            v14 = v8 * (unint64_t)a3;
            if ((v14 & 0xFFFFFFFF00000000) != 0)
              goto LABEL_72;
            v15 = v10 + v11;
            v8 = v14 - v15;
            if (v14 < v15)
              goto LABEL_72;
            ++v9;
            if (!--v4)
              goto LABEL_48;
          }
        }
LABEL_71:
        v12 = 0;
        v13 = 0;
        return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_245E2DE20()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_245E3CCF4();
  v4 = sub_245E2DE9C(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_245E2DE9C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_245E2DFE0(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_245E2C660(v9, 0);
      v12 = sub_245E2E0CC((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v13 = MEMORY[0x24954A148](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x24954A148);
LABEL_9:
      sub_245E3CF7C();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x24954A148]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_245E2DFE0(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
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
    result = sub_245E2C6C4(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_245E2C6C4(a2, a3, a4);
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
    return sub_245E3CCC4();
  }
  __break(1u);
  return result;
}

unint64_t sub_245E2E0CC(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
      result = sub_245E2C6C4(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_245E3CCD0();
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
          result = sub_245E3CF7C();
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
    result = sub_245E2C6C4(v12, a6, a7);
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
    v12 = sub_245E3CCAC();
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

unint64_t sub_245E2E2DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_245E3D0CC();
  sub_245E3CC88();
  v4 = sub_245E3D0E4();
  return sub_245E2D668(a1, a2, v4);
}

uint64_t sub_245E2E340(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257524608);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t static ACHAchievementProgressUpdate.filterForNextEarnableProgressUpdates(from:templates:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  unint64_t v21;
  BOOL v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;

  if ((a1 & 0xC000000000000001) == 0)
  {
    v25 = swift_bridgeObjectRetain();
    v3 = sub_245E2E6E0(v25);
    goto LABEL_35;
  }
  v3 = MEMORY[0x24BEE4B08];
  v29 = MEMORY[0x24BEE4B08];
  swift_bridgeObjectRetain();
  sub_245E3CEEC();
  if (!sub_245E3CF28())
    goto LABEL_34;
  v27 = a2;
  sub_245E2F34C();
  do
  {
    swift_dynamicCast();
    v10 = objc_msgSend(v28, sel_templateUniqueName);
    sub_245E3CC64();

    sub_245E18EC8();
    v11 = (_QWORD *)sub_245E3CE98();
    swift_bridgeObjectRelease();
    if (!v11[2])
    {
      swift_bridgeObjectRelease();
LABEL_21:

      continue;
    }
    v13 = v11[4];
    v12 = v11[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_245E3CAB4();
    if (v13 == sub_245E3CA54() && v12 == v14)
      goto LABEL_16;
    v16 = sub_245E3D06C();
    swift_bridgeObjectRelease();
    if ((v16 & 1) != 0)
      goto LABEL_17;
    if (v13 == sub_245E3CA48() && v12 == v17)
    {
LABEL_16:
      swift_bridgeObjectRelease();
LABEL_17:
      swift_bridgeObjectRelease();
      goto LABEL_18;
    }
    v24 = sub_245E3D06C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v24 & 1) == 0)
      goto LABEL_21;
LABEL_18:
    v18 = v29;
    v19 = *(_QWORD *)(v29 + 16);
    if (*(_QWORD *)(v29 + 24) <= v19)
    {
      sub_245E1B160(v19 + 1);
      v18 = v29;
    }
    result = sub_245E3CE44();
    v5 = v18 + 56;
    v6 = -1 << *(_BYTE *)(v18 + 32);
    v7 = result & ~v6;
    v8 = v7 >> 6;
    if (((-1 << v7) & ~*(_QWORD *)(v18 + 56 + 8 * (v7 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v7) & ~*(_QWORD *)(v18 + 56 + 8 * (v7 >> 6)))) | v7 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v20 = 0;
      v21 = (unint64_t)(63 - v6) >> 6;
      do
      {
        if (++v8 == v21 && (v20 & 1) != 0)
        {
          __break(1u);
          return result;
        }
        v22 = v8 == v21;
        if (v8 == v21)
          v8 = 0;
        v20 |= v22;
        v23 = *(_QWORD *)(v5 + 8 * v8);
      }
      while (v23 == -1);
      v9 = __clz(__rbit64(~v23)) + (v8 << 6);
    }
    *(_QWORD *)(v5 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    *(_QWORD *)(*(_QWORD *)(v18 + 48) + 8 * v9) = v28;
    ++*(_QWORD *)(v18 + 16);
  }
  while (sub_245E3CF28());
  v3 = v29;
  a2 = v27;
LABEL_34:
  swift_release();
LABEL_35:
  swift_bridgeObjectRetain();
  v26 = sub_245E2F138(v3, a2);
  swift_bridgeObjectRelease();
  return v26;
}

uint64_t sub_245E2E6E0(uint64_t isStackAllocationSafe)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  unint64_t v4;
  size_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[2];

  v2 = isStackAllocationSafe;
  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = *(_BYTE *)(isStackAllocationSafe + 32);
  v4 = (unint64_t)((1 << v3) + 63) >> 6;
  v5 = 8 * v4;
  if ((v3 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v5);
    v6 = sub_245E2E83C((uint64_t)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v4, v2);
    swift_release();
    if (v1)
      swift_willThrow();
  }
  else
  {
    v7 = (void *)swift_slowAlloc();
    bzero(v7, v5);
    v6 = sub_245E2E83C((uint64_t)v7, v4, v2);
    swift_release();
    MEMORY[0x24954AA78](v7, -1, -1);
  }
  return v6;
}

uint64_t sub_245E2E83C(uint64_t result, uint64_t a2, uint64_t a3)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  id v16;
  id v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v23;
  uint64_t v24;
  uint64_t v26;
  unint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;

  v26 = a2;
  v27 = (unint64_t *)result;
  v28 = 0;
  v3 = 0;
  v6 = *(_QWORD *)(a3 + 56);
  v4 = a3 + 56;
  v5 = v6;
  v7 = 1 << *(_BYTE *)(v4 - 24);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & v5;
  v29 = v4;
  v30 = (unint64_t)(v7 + 63) >> 6;
  while (v9)
  {
    v11 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    v12 = v11 | (v3 << 6);
LABEL_21:
    v16 = *(id *)(*(_QWORD *)(a3 + 48) + 8 * v12);
    v17 = objc_msgSend(v16, sel_templateUniqueName, v26);
    sub_245E3CC64();

    sub_245E18EC8();
    v18 = (_QWORD *)sub_245E3CE98();
    swift_bridgeObjectRelease();
    if (v18[2])
    {
      v19 = v18[4];
      v20 = v18[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_245E3CAB4();
      if (v19 == sub_245E3CA54() && v20 == v21)
      {
LABEL_29:

        swift_bridgeObjectRelease();
LABEL_32:
        result = swift_bridgeObjectRelease();
        goto LABEL_33;
      }
      v23 = sub_245E3D06C();
      swift_bridgeObjectRelease();
      if ((v23 & 1) != 0)
      {

        goto LABEL_32;
      }
      if (v19 == sub_245E3CA48() && v20 == v24)
        goto LABEL_29;
      v10 = sub_245E3D06C();

      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      if ((v10 & 1) != 0)
      {
LABEL_33:
        *(unint64_t *)((char *)v27 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
        if (__OFADD__(v28++, 1))
        {
          __break(1u);
LABEL_36:
          swift_retain();
          return sub_245E2EB60(v27, v26, v28, a3, &qword_257524398);
        }
      }
    }
    else
    {

      result = swift_bridgeObjectRelease();
    }
  }
  v13 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
    goto LABEL_38;
  }
  if (v13 >= v30)
    goto LABEL_36;
  v14 = *(_QWORD *)(v29 + 8 * v13);
  ++v3;
  if (v14)
    goto LABEL_20;
  v3 = v13 + 1;
  if (v13 + 1 >= v30)
    goto LABEL_36;
  v14 = *(_QWORD *)(v29 + 8 * v3);
  if (v14)
    goto LABEL_20;
  v3 = v13 + 2;
  if (v13 + 2 >= v30)
    goto LABEL_36;
  v14 = *(_QWORD *)(v29 + 8 * v3);
  if (v14)
  {
LABEL_20:
    v9 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v3 << 6);
    goto LABEL_21;
  }
  v15 = v13 + 3;
  if (v15 >= v30)
    goto LABEL_36;
  v14 = *(_QWORD *)(v29 + 8 * v15);
  if (v14)
  {
    v3 = v15;
    goto LABEL_20;
  }
  while (1)
  {
    v3 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v3 >= v30)
      goto LABEL_36;
    v14 = *(_QWORD *)(v29 + 8 * v3);
    ++v15;
    if (v14)
      goto LABEL_20;
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_245E2EB54(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_245E2EB60(a1, a2, a3, a4, &qword_2575243A0);
}

uint64_t sub_245E2EB60(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  unint64_t *v29;

  v5 = a4;
  if (!a3)
  {
    v10 = MEMORY[0x24BEE4B08];
LABEL_36:
    swift_release();
    return v10;
  }
  v6 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v5;
  __swift_instantiateConcreteTypeFromMangledName(a5);
  result = sub_245E3CF4C();
  v10 = result;
  v29 = a1;
  if (a2 < 1)
    v11 = 0;
  else
    v11 = *a1;
  v12 = 0;
  v13 = result + 56;
  while (1)
  {
    if (v11)
    {
      v14 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    v16 = v12 + 1;
    if (__OFADD__(v12, 1))
      goto LABEL_39;
    if (v16 >= a2)
      goto LABEL_36;
    v17 = v29[v16];
    ++v12;
    if (!v17)
    {
      v12 = v16 + 1;
      if (v16 + 1 >= a2)
        goto LABEL_36;
      v17 = v29[v12];
      if (!v17)
      {
        v12 = v16 + 2;
        if (v16 + 2 >= a2)
          goto LABEL_36;
        v17 = v29[v12];
        if (!v17)
          break;
      }
    }
LABEL_23:
    v11 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    v19 = *(id *)(*(_QWORD *)(v5 + 48) + 8 * v15);
    result = sub_245E3CE44();
    v20 = -1 << *(_BYTE *)(v10 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v13 + 8 * (v21 >> 6))) != 0)
    {
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v13 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v13 + 8 * v22);
      }
      while (v27 == -1);
      v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(_QWORD *)(v13 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    *(_QWORD *)(*(_QWORD *)(v10 + 48) + 8 * v23) = v19;
    ++*(_QWORD *)(v10 + 16);
    if (__OFSUB__(v6--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v6)
      goto LABEL_36;
  }
  v18 = v16 + 3;
  if (v18 >= a2)
    goto LABEL_36;
  v17 = v29[v18];
  if (v17)
  {
    v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v12 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v12 >= a2)
      goto LABEL_36;
    v17 = v29[v12];
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

void sub_245E2EDB8(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  char v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v22;

  v22 = 0;
  v6 = 0;
  v7 = a3 + 56;
  v8 = 1 << *(_BYTE *)(a3 + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & *(_QWORD *)(a3 + 56);
  v11 = (unint64_t)(v8 + 63) >> 6;
  while (1)
  {
    if (v10)
    {
      v12 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v13 = v12 | (v6 << 6);
      goto LABEL_5;
    }
    v16 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v16 >= v11)
      goto LABEL_24;
    v17 = *(_QWORD *)(v7 + 8 * v16);
    ++v6;
    if (!v17)
    {
      v6 = v16 + 1;
      if (v16 + 1 >= v11)
        goto LABEL_24;
      v17 = *(_QWORD *)(v7 + 8 * v6);
      if (!v17)
      {
        v6 = v16 + 2;
        if (v16 + 2 >= v11)
          goto LABEL_24;
        v17 = *(_QWORD *)(v7 + 8 * v6);
        if (!v17)
          break;
      }
    }
LABEL_20:
    v10 = (v17 - 1) & v17;
    v13 = __clz(__rbit64(v17)) + (v6 << 6);
LABEL_5:
    v14 = *(id *)(*(_QWORD *)(a3 + 48) + 8 * v13);
    v15 = ACHAchievementProgressUpdate.isNextEarnable(for:)(a4);

    if ((v15 & 1) != 0)
    {
      *(unint64_t *)((char *)a1 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      if (__OFADD__(v22++, 1))
      {
        __break(1u);
LABEL_24:
        swift_retain();
        sub_245E2EB60(a1, a2, v22, a3, &qword_257524398);
        return;
      }
    }
  }
  v18 = v16 + 3;
  if (v18 >= v11)
    goto LABEL_24;
  v17 = *(_QWORD *)(v7 + 8 * v18);
  if (v17)
  {
    v6 = v18;
    goto LABEL_20;
  }
  while (1)
  {
    v6 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v6 >= v11)
      goto LABEL_24;
    v17 = *(_QWORD *)(v7 + 8 * v6);
    ++v18;
    if (v17)
      goto LABEL_20;
  }
LABEL_26:
  __break(1u);
}

uint64_t sub_245E2EF74(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char v5;
  unsigned int v6;
  unint64_t v7;
  size_t v8;
  uint64_t isStackAllocationSafe;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v7 = (unint64_t)((1 << v5) + 63) >> 6;
  v8 = 8 * v7;
  isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v6 <= 0xD || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v15 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    swift_bridgeObjectRetain();
    sub_245E2EDB8((_QWORD *)((char *)v15 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0)), v7, a1, a2);
    v11 = v10;
    swift_release();
    swift_bridgeObjectRelease();
    if (v2)
      swift_willThrow();
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v12 = (void *)swift_slowAlloc();
    bzero(v12, v8);
    swift_bridgeObjectRetain();
    sub_245E2EDB8((unint64_t *)v12, v7, a1, a2);
    v11 = v13;
    swift_release();
    swift_bridgeObjectRelease();
    MEMORY[0x24954AA78](v12, -1, -1);
    swift_bridgeObjectRelease_n();
  }
  return v11;
}

uint64_t sub_245E2F138(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  BOOL v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;

  if ((a1 & 0xC000000000000001) == 0)
    return sub_245E2EF74(a1, a2);
  v3 = MEMORY[0x24BEE4B08];
  v17 = MEMORY[0x24BEE4B08];
  swift_bridgeObjectRetain();
  sub_245E3CEEC();
  if (sub_245E3CF28())
  {
    sub_245E2F34C();
    do
    {
      swift_dynamicCast();
      if ((ACHAchievementProgressUpdate.isNextEarnable(for:)(a2) & 1) != 0)
      {
        v4 = v17;
        v5 = *(_QWORD *)(v17 + 16);
        if (*(_QWORD *)(v17 + 24) <= v5)
        {
          sub_245E1B160(v5 + 1);
          v4 = v17;
        }
        result = sub_245E3CE44();
        v7 = v4 + 56;
        v8 = -1 << *(_BYTE *)(v4 + 32);
        v9 = result & ~v8;
        v10 = v9 >> 6;
        if (((-1 << v9) & ~*(_QWORD *)(v4 + 56 + 8 * (v9 >> 6))) != 0)
        {
          v11 = __clz(__rbit64((-1 << v9) & ~*(_QWORD *)(v4 + 56 + 8 * (v9 >> 6)))) | v9 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v12 = 0;
          v13 = (unint64_t)(63 - v8) >> 6;
          do
          {
            if (++v10 == v13 && (v12 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v14 = v10 == v13;
            if (v10 == v13)
              v10 = 0;
            v12 |= v14;
            v15 = *(_QWORD *)(v7 + 8 * v10);
          }
          while (v15 == -1);
          v11 = __clz(__rbit64(~v15)) + (v10 << 6);
        }
        *(_QWORD *)(v7 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
        *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v11) = v16;
        ++*(_QWORD *)(v4 + 16);
      }
      else
      {

      }
    }
    while (sub_245E3CF28());
    v3 = v17;
  }
  swift_bridgeObjectRelease();
  swift_release();
  return v3;
}

unint64_t sub_245E2F34C()
{
  unint64_t result;

  result = qword_257524408;
  if (!qword_257524408)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257524408);
  }
  return result;
}

uint64_t dispatch thunk of AppInstalling.onProgressUpdated.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AppInstalling.onProgressUpdated.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of AppInstalling.onProgressUpdated.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of AppInstalling.requestInstall()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

BOOL static AppInstallError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AppInstallError.hash(into:)()
{
  return sub_245E3D0D8();
}

uint64_t AppInstallError.hashValue.getter()
{
  sub_245E3D0CC();
  sub_245E3D0D8();
  return sub_245E3D0E4();
}

unint64_t sub_245E2F42C()
{
  unint64_t result;

  result = qword_257524618;
  if (!qword_257524618)
  {
    result = MEMORY[0x24954A9D0](&protocol conformance descriptor for AppInstallError, &type metadata for AppInstallError);
    atomic_store(result, (unint64_t *)&qword_257524618);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AppInstallError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AppInstallError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_245E2F550 + 4 * byte_245E3E595[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_245E2F584 + 4 * asc_245E3E590[v4]))();
}

uint64_t sub_245E2F584(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_245E2F58C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x245E2F594);
  return result;
}

uint64_t sub_245E2F5A0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x245E2F5A8);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_245E2F5AC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245E2F5B4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AppInstallError()
{
  return &type metadata for AppInstallError;
}

uint64_t sub_245E2F5D0()
{
  uint64_t result;
  uint64_t v1;

  result = sub_245E3CDE4();
  qword_257524620 = v1;
  return result;
}

double static AppInstallConstants.installRequestTimeout.getter()
{
  if (qword_257523E98 != -1)
    swift_once();
  return *(double *)&qword_257524620;
}

uint64_t static AppInstallConstants.appStoreURLProtocol.getter()
{
  return 0x7070612D736D7469;
}

ValueMetadata *type metadata accessor for AppInstallConstants()
{
  return &type metadata for AppInstallConstants;
}

uint64_t sub_245E2F660@<X0>(uint64_t *a1@<X0>, uint64_t (**a2)(uint64_t a1, double *a2)@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, double *);

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 16);
  v5 = *(_QWORD *)(v3 + 24);
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_245E32400;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)(uint64_t, double *))v6;
  return sub_245E2B278(v4);
}

uint64_t sub_245E2F6E8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, double);
  uint64_t v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_245E323D0;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = *a2;
  swift_beginAccess();
  v8 = *(_QWORD *)(v7 + 16);
  *(_QWORD *)(v7 + 16) = v6;
  *(_QWORD *)(v7 + 24) = v5;
  sub_245E2B278(v3);
  return sub_245E2B268(v8);
}

uint64_t sub_245E2F794()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 16);
  sub_245E2B278(v1);
  return v1;
}

uint64_t sub_245E2F7E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  swift_beginAccess();
  v5 = *(_QWORD *)(v2 + 16);
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return sub_245E2B268(v5);
}

uint64_t (*sub_245E2F830())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t SystemAppInstaller.__allocating_init(bundleIdentifier:installRequestProvider:recordObserverProvider:timerProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v31 = a1;
  v32 = a2;
  v8 = swift_allocObject();
  v9 = *(_QWORD *)(a3 + 24);
  v29 = *(_QWORD *)(a3 + 32);
  v30 = v8;
  v10 = __swift_mutable_project_boxed_opaque_existential_1(a3, v9);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v13 + 16))(v12);
  v14 = *(_QWORD *)(a4 + 24);
  v28 = *(_QWORD *)(a4 + 32);
  v15 = __swift_mutable_project_boxed_opaque_existential_1(a4, v14);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v18 + 16))(v17);
  v19 = *(_QWORD *)(a5 + 24);
  v20 = *(_QWORD *)(a5 + 32);
  v21 = __swift_mutable_project_boxed_opaque_existential_1(a5, v19);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v27 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v24 + 16))(v23);
  v25 = sub_245E31BD4(v31, v32, (uint64_t)v12, (uint64_t)v17, (uint64_t)v23, v30, v14, v9, v19, v28, v29, v20);
  __swift_destroy_boxed_opaque_existential_1(a5);
  __swift_destroy_boxed_opaque_existential_1(a4);
  __swift_destroy_boxed_opaque_existential_1(a3);
  return v25;
}

uint64_t SystemAppInstaller.init(bundleIdentifier:installRequestProvider:recordObserverProvider:timerProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v30 = a2;
  v8 = *(_QWORD *)(a3 + 24);
  v28 = *(_QWORD *)(a3 + 32);
  v29 = a1;
  v9 = __swift_mutable_project_boxed_opaque_existential_1(a3, v8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v12 + 16))(v11);
  v13 = *(_QWORD *)(a4 + 24);
  v27 = *(_QWORD *)(a4 + 32);
  v14 = __swift_mutable_project_boxed_opaque_existential_1(a4, v13);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v17 + 16))(v16);
  v18 = *(_QWORD *)(a5 + 24);
  v19 = *(_QWORD *)(a5 + 32);
  v20 = __swift_mutable_project_boxed_opaque_existential_1(a5, v18);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v26 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v23 + 16))(v22);
  v24 = sub_245E31BD4(v29, v30, (uint64_t)v11, (uint64_t)v16, (uint64_t)v22, v31, v13, v8, v18, v27, v28, v19);
  __swift_destroy_boxed_opaque_existential_1(a5);
  __swift_destroy_boxed_opaque_existential_1(a4);
  __swift_destroy_boxed_opaque_existential_1(a3);
  return v24;
}

uint64_t sub_245E2FBC8(_QWORD *a1)
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_245E304B4(a1);
    return swift_release();
  }
  return result;
}

uint64_t sub_245E2FC24(uint64_t a1, uint64_t a2)
{
  _BYTE v4[48];

  sub_245E32308(a2, (uint64_t)v4);
  swift_beginAccess();
  sub_245E32860((uint64_t)v4, a1 + 64);
  return swift_endAccess();
}

uint64_t sub_245E2FC8C(_QWORD *a1, double a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  void (*v9)(_QWORD *, __n128);
  _QWORD *v10;
  __n128 v11;
  _OWORD v12[2];
  uint64_t v13;
  char v14;

  v5 = a1[3];
  v6 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v5);
  v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 24))(v5, v6);
  if ((v7 & 1) != 0 || a2 >= 1.0)
  {
    v13 = 0;
    memset(v12, 0, sizeof(v12));
    v14 = 2;
    MEMORY[0x24BDAC7A8](v7);
    sub_245E3CA00();
    sub_245E31DDC((uint64_t)v12);
    result = swift_beginAccess();
    v9 = *(void (**)(_QWORD *, __n128))(v2 + 16);
    if (!v9)
      return result;
    swift_retain();
    v11.n128_u64[0] = 1.0;
    v10 = a1;
  }
  else
  {
    result = swift_beginAccess();
    v9 = *(void (**)(_QWORD *, __n128))(v2 + 16);
    if (!v9)
      return result;
    swift_retain();
    v10 = a1;
    v11.n128_f64[0] = a2;
  }
  v9(v10, v11);
  return sub_245E2B268((uint64_t)v9);
}

uint64_t sub_245E2FDDC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t ObjectType;
  unint64_t v16;
  uint64_t v17;
  uint64_t (**v18)();
  uint64_t v19;
  char *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t (**v23)(void *);
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;

  v28 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257524778);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  v5 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v25 - v7;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_257524630);
  v9 = *(_QWORD *)(v27 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  v11 = MEMORY[0x24BDAC7A8](v27);
  v26 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v25 - v12;
  v14 = *(_QWORD *)(v1 + 56);
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v14 + 40))(ObjectType, v14);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  v16 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v17 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v17 + v16, v6, v2);
  v18 = (uint64_t (**)())(v17 + ((v4 + v16 + 7) & 0xFFFFFFFFFFFFFFF8));
  *v18 = sub_245E30028;
  v18[1] = 0;
  sub_245E3C9C4();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  v20 = v26;
  v19 = v27;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v26, v13, v27);
  v21 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v22 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v22 + v21, v20, v19);
  v23 = (uint64_t (**)(void *))(v22 + ((v10 + v21 + 7) & 0xFFFFFFFFFFFFFFF8));
  *v23 = sub_245E3009C;
  v23[1] = 0;
  sub_245E3C9C4();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v13, v19);
}

uint64_t sub_245E30028()
{
  uint64_t v0;
  _BYTE *v1;

  sub_245E2B224();
  v0 = swift_allocError();
  *v1 = 0;
  *(_QWORD *)(swift_allocObject() + 16) = v0;
  return sub_245E3C9D0();
}

uint64_t sub_245E3009C(void *a1)
{
  id v3;

  sub_245E32728();
  if ((sub_245E3C55C() & 1) != 0)
    return sub_245E3C9E8();
  *(_QWORD *)(swift_allocObject() + 16) = a1;
  v3 = a1;
  return sub_245E3C9D0();
}

uint64_t sub_245E30144()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_245E30198();
    return swift_release();
  }
  return result;
}

uint64_t sub_245E30198()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  _QWORD v20[2];
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(__int128 *);
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  char v31;

  v1 = v0;
  v2 = sub_245E3CBC8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245E3CA00();
  if (v31)
    return sub_245E31DDC((uint64_t)&v28);
  v7 = v28;
  v25 = 0;
  v26 = (void (*)(__int128 *))*((_QWORD *)&v28 + 1);
  v8 = v29;
  sub_245E3CB08();
  swift_retain();
  v9 = sub_245E3CBBC();
  v10 = sub_245E3CE08();
  v11 = v10;
  if (os_log_type_enabled(v9, v10))
  {
    v12 = swift_slowAlloc();
    v24 = v8;
    v13 = v12;
    v22 = swift_slowAlloc();
    *(_QWORD *)&v28 = v22;
    *(_DWORD *)v13 = 141558274;
    v27 = 1752392040;
    sub_245E3CE80();
    *(_WORD *)(v13 + 12) = 2080;
    v20[1] = v13 + 14;
    v21 = v11;
    v23 = v7;
    v14 = v1[4];
    v15 = v1[5];
    swift_bridgeObjectRetain();
    v27 = sub_245E19CDC(v14, v15, (uint64_t *)&v28);
    sub_245E3CE80();
    swift_release();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_245E10000, v9, (os_log_type_t)v21, "Failed to get a status update for install %{mask.hash}s", (uint8_t *)v13, 0x16u);
    v16 = v22;
    swift_arrayDestroy();
    MEMORY[0x24954AA78](v16, -1, -1);
    MEMORY[0x24954AA78](v13, -1, -1);

  }
  else
  {

    swift_release();
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  __swift_project_boxed_opaque_existential_1(v1 + 25, v1[28]);
  v17 = sub_245E3CAE4();
  v30 = 0;
  v28 = 0u;
  v29 = 0u;
  v31 = 2;
  MEMORY[0x24BDAC7A8](v17);
  v20[-2] = v1;
  v20[-1] = &v28;
  sub_245E3CA00();
  sub_245E31DDC((uint64_t)&v28);
  sub_245E2B224();
  v18 = swift_allocError();
  *v19 = 2;
  *(_QWORD *)&v28 = v18;
  v31 = 1;
  v26(&v28);
  swift_unknownObjectRelease();
  swift_release();
  return sub_245E2B1E4((uint64_t)&v28);
}

uint64_t sub_245E304B4(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void (*v15)(uint64_t *);
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  os_log_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v30[2];
  os_log_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  void (*v37)(uint64_t *);
  _QWORD v38[3];
  uint64_t v39;
  uint64_t v40;
  uint64_t v41[5];
  char v42;
  __int128 v43;
  uint64_t v44;
  char v45;
  _BYTE v46[48];

  v2 = v1;
  v4 = sub_245E3CBC8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245E3CA00();
  sub_245E32308((uint64_t)v46, (uint64_t)&v43);
  v8 = v43;
  if (v45)
  {
    if (v45 == 1)
    {
      sub_245E3233C(&v43, (uint64_t)v41);
      v9 = a1[3];
      v10 = a1[4];
      __swift_project_boxed_opaque_existential_1(a1, v9);
      v11 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v10 + 48))(v9, v10);
      if (v11)
      {
        v12 = v11;
        objc_msgSend(v11, sel_fractionCompleted);
        v14 = v13;

        sub_245E328D0((uint64_t)a1, (uint64_t)v38);
      }
      else
      {
        sub_245E328D0((uint64_t)a1, (uint64_t)v38);
        v27 = v39;
        v28 = v40;
        __swift_project_boxed_opaque_existential_1(v38, v39);
        if (((*(uint64_t (**)(uint64_t, uint64_t))(v28 + 24))(v27, v28) & 1) != 0)
          v14 = 1.0;
        else
          v14 = 0.0;
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
      sub_245E2FC8C(v41, v14);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
    }
  }
  else
  {
    v36 = 0;
    v15 = (void (*)(uint64_t *))*((_QWORD *)&v43 + 1);
    v16 = v44;
    sub_245E3CB08();
    swift_retain();
    v17 = sub_245E3CBBC();
    v18 = sub_245E3CE14();
    v35 = v18;
    v19 = os_log_type_enabled(v17, v18);
    v37 = v15;
    if (v19)
    {
      v20 = swift_slowAlloc();
      v33 = v16;
      v21 = v20;
      v32 = swift_slowAlloc();
      v41[0] = v32;
      *(_DWORD *)v21 = 141558274;
      v38[0] = 1752392040;
      sub_245E3CE80();
      *(_WORD *)(v21 + 12) = 2080;
      v30[1] = v21 + 14;
      v31 = v17;
      v34 = v8;
      v22 = v2[4];
      v23 = v2[5];
      swift_bridgeObjectRetain();
      v38[0] = sub_245E19CDC(v22, v23, v41);
      sub_245E3CE80();
      swift_release();
      swift_bridgeObjectRelease();
      v24 = v31;
      _os_log_impl(&dword_245E10000, v31, (os_log_type_t)v35, "Requested install %{mask.hash}s appeared!", (uint8_t *)v21, 0x16u);
      v25 = v32;
      swift_arrayDestroy();
      MEMORY[0x24954AA78](v25, -1, -1);
      MEMORY[0x24954AA78](v21, -1, -1);

    }
    else
    {

      swift_release();
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    __swift_project_boxed_opaque_existential_1(v2 + 25, v2[28]);
    sub_245E3CAE4();
    v26 = sub_245E328D0((uint64_t)a1, (uint64_t)v41);
    v42 = 1;
    MEMORY[0x24BDAC7A8](v26);
    v30[-2] = v2;
    v30[-1] = v41;
    sub_245E3CA00();
    sub_245E31DDC((uint64_t)v41);
    sub_245E328D0((uint64_t)a1, (uint64_t)v41);
    v42 = 0;
    v37(v41);
    sub_245E2B1E4((uint64_t)v41);
    sub_245E304B4(a1);
    swift_unknownObjectRelease();
    swift_release();
  }
  return sub_245E31DDC((uint64_t)v46);
}

uint64_t SystemAppInstaller.deinit()
{
  uint64_t v0;

  sub_245E2B268(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  sub_245E31DDC(v0 + 64);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 120);
  __swift_destroy_boxed_opaque_existential_1(v0 + 160);
  __swift_destroy_boxed_opaque_existential_1(v0 + 200);
  return v0;
}

uint64_t SystemAppInstaller.__deallocating_deinit()
{
  uint64_t v0;

  sub_245E2B268(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  sub_245E31DDC(v0 + 64);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 120);
  __swift_destroy_boxed_opaque_existential_1(v0 + 160);
  __swift_destroy_boxed_opaque_existential_1(v0 + 200);
  return swift_deallocClassInstance();
}

uint64_t SystemAppInstaller.requestInstall()@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int8x16_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t (**v30)();
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int8x16_t v35;
  int8x16_t v36;
  char v37;

  v2 = v1;
  v33 = a1;
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_257524630);
  v3 = *(_QWORD *)(v32 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  v5 = MEMORY[0x24BDAC7A8](v32);
  v6 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v31 = (uint64_t)&v31 - v7;
  v8 = sub_245E3CBC8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245E3CA00();
  if (v37 == 2
    && (v12 = vorrq_s8(v35, v36),
        !(*(_QWORD *)&vorr_s8(*(int8x8_t *)v12.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v12, v12, 8uLL)) | v34)))
  {
    sub_245E31DDC((uint64_t)&v34);
    sub_245E3CB08();
    sub_245E3CBB0();
    v16 = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    v34 = 1;
    v35 = 0u;
    v36 = 0u;
    v37 = 2;
    MEMORY[0x24BDAC7A8](v16);
    *(&v31 - 2) = (uint64_t)v1;
    *(&v31 - 1) = (uint64_t)&v34;
    sub_245E3CA00();
    sub_245E31DDC((uint64_t)&v34);
    v17 = v1[18];
    v18 = v1[19];
    __swift_project_boxed_opaque_existential_1(v1 + 15, v17);
    v19 = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 8))(v17, v18);
    v21 = v20;
    v22 = v1[4];
    v23 = v1[5];
    swift_bridgeObjectRetain();
    v24 = v31;
    sub_245E2FDDC(v31);
    v25 = (_QWORD *)swift_allocObject();
    v25[2] = v19;
    v25[3] = v21;
    v25[4] = v22;
    v25[5] = v23;
    v25[6] = v2;
    v26 = swift_allocObject();
    *(_QWORD *)(v26 + 16) = sub_245E31E74;
    *(_QWORD *)(v26 + 24) = v25;
    v27 = v32;
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v24, v32);
    v28 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
    v29 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v29 + v28, v6, v27);
    v30 = (uint64_t (**)())(v29 + ((v4 + v28 + 7) & 0xFFFFFFFFFFFFFFF8));
    *v30 = sub_245E31E84;
    v30[1] = (uint64_t (*)())v26;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257524570);
    sub_245E3C9C4();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v24, v27);
  }
  else
  {
    sub_245E31DDC((uint64_t)&v34);
    sub_245E2B224();
    v13 = swift_allocError();
    *v14 = 1;
    *(_QWORD *)(swift_allocObject() + 16) = v13;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257524570);
    return sub_245E3C9D0();
  }
}

uint64_t sub_245E30D70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v10;

  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a1;
  v10[3] = a2;
  v10[4] = a3;
  v10[5] = a4;
  v10[6] = a5;
  swift_bridgeObjectRetain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257524570);
  return sub_245E3C9C4();
}

uint64_t sub_245E30E0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t *v23;
  uint8_t *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t (*)(uint64_t), uint64_t);
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[2];

  v34 = a2;
  v35 = a7;
  v32 = a5;
  v33 = a1;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257524630);
  v36 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_245E3CBC8();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245E3CB08();
  v17 = sub_245E3CBBC();
  v18 = sub_245E3CE14();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc();
    v31 = a3;
    v20 = a4;
    v21 = v10;
    v22 = a6;
    v23 = v19;
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_245E10000, v17, v18, "App Record Observation started, requesting install!", v19, 2u);
    v24 = v23;
    a6 = v22;
    v10 = v21;
    a4 = v20;
    a3 = v31;
    MEMORY[0x24954AA78](v24, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  v37[0] = v32;
  v37[1] = a6;
  (*(void (**)(_QWORD *, uint64_t, uint64_t))(a4 + 8))(v37, a3, a4);
  v25 = (_QWORD *)swift_allocObject();
  v26 = v34;
  v27 = v33;
  v25[2] = v35;
  v25[3] = v27;
  v25[4] = v26;
  swift_retain();
  swift_retain();
  v28 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_245E3C9DC();
  v29 = swift_allocObject();
  *(_QWORD *)(v29 + 16) = sub_245E324CC;
  *(_QWORD *)(v29 + 24) = v25;
  swift_retain();
  v28(sub_245E324DC, v29);
  swift_release();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v12, v10);
}

uint64_t sub_245E31050(uint64_t a1, _QWORD *a2, void (*a3)(_QWORD), uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(_QWORD);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  char v53;

  v8 = sub_245E3CBC8();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v41 - v13;
  if (*(_BYTE *)(a1 + 8) == 1)
  {
    v45 = v9;
    v15 = *(id *)a1;
    v16 = *(id *)a1;
    sub_245E3CB08();
    sub_245E32548(v15, 1);
    sub_245E32548(v15, 1);
    swift_retain();
    v17 = sub_245E3CBBC();
    v18 = sub_245E3CE08();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = swift_slowAlloc();
      v43 = a4;
      v20 = v19;
      v42 = swift_slowAlloc();
      *(_QWORD *)&v50 = v42;
      *(_DWORD *)v20 = 141558530;
      v49 = 1752392040;
      sub_245E3CE80();
      *(_WORD *)(v20 + 12) = 2080;
      v46 = a3;
      v44 = v8;
      v21 = a2[4];
      v22 = a2[5];
      swift_bridgeObjectRetain();
      v49 = sub_245E19CDC(v21, v22, (uint64_t *)&v50);
      sub_245E3CE80();
      swift_release();
      swift_bridgeObjectRelease();
      *(_WORD *)(v20 + 22) = 2082;
      swift_getErrorValue();
      v23 = MEMORY[0x24954A55C](v47, v48);
      v49 = sub_245E19CDC(v23, v24, (uint64_t *)&v50);
      a3 = v46;
      sub_245E3CE80();
      swift_bridgeObjectRelease();
      sub_245E32554(v15, 1);
      sub_245E32554(v15, 1);
      _os_log_impl(&dword_245E10000, v17, v18, "Error requesting install for %{mask.hash}s: %{public}s", (uint8_t *)v20, 0x20u);
      v25 = v42;
      swift_arrayDestroy();
      MEMORY[0x24954AA78](v25, -1, -1);
      MEMORY[0x24954AA78](v20, -1, -1);

      v26 = (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v14, v44);
    }
    else
    {
      swift_release();
      sub_245E32554(v15, 1);
      sub_245E32554(v15, 1);

      v26 = (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v14, v8);
    }
    v52 = 0;
    v50 = 0u;
    v51 = 0u;
    v53 = 2;
    MEMORY[0x24BDAC7A8](v26);
    *(&v41 - 2) = (uint64_t)a2;
    *(&v41 - 1) = (uint64_t)&v50;
    sub_245E3CA00();
    sub_245E31DDC((uint64_t)&v50);
    *(_QWORD *)&v50 = v15;
    v53 = 1;
    v36 = v15;
    a3(&v50);
    sub_245E32554(v15, 1);
    return sub_245E2B1E4((uint64_t)&v50);
  }
  else
  {
    v46 = a3;
    sub_245E3CB08();
    swift_retain();
    v27 = sub_245E3CBBC();
    v28 = sub_245E3CE14();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = swift_slowAlloc();
      v45 = v9;
      v30 = v29;
      v43 = swift_slowAlloc();
      *(_QWORD *)&v50 = v43;
      *(_DWORD *)v30 = 141558274;
      v49 = 1752392040;
      sub_245E3CE80();
      *(_WORD *)(v30 + 12) = 2080;
      v44 = v8;
      v31 = a4;
      v32 = a2[4];
      v33 = a2[5];
      swift_bridgeObjectRetain();
      v34 = v32;
      a4 = v31;
      v49 = sub_245E19CDC(v34, v33, (uint64_t *)&v50);
      sub_245E3CE80();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_245E10000, v27, v28, "Sucessfully requested install with UUID: %{mask.hash}s", (uint8_t *)v30, 0x16u);
      v35 = v43;
      swift_arrayDestroy();
      MEMORY[0x24954AA78](v35, -1, -1);
      MEMORY[0x24954AA78](v30, -1, -1);

      (*(void (**)(char *, uint64_t))(v45 + 8))(v12, v44);
    }
    else
    {

      swift_release();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    }
    __swift_project_boxed_opaque_existential_1(a2 + 25, a2[28]);
    if (qword_257523E98 != -1)
      swift_once();
    sub_245E324E0();
    v38 = (void *)sub_245E3CE20();
    swift_allocObject();
    swift_weakInit();
    swift_retain();
    v39 = sub_245E3CAD8();

    v40 = swift_release_n();
    *(_QWORD *)&v50 = v39;
    *((_QWORD *)&v50 + 1) = v46;
    *(_QWORD *)&v51 = a4;
    v53 = 0;
    MEMORY[0x24BDAC7A8](v40);
    *(&v41 - 2) = (uint64_t)a2;
    *(&v41 - 1) = (uint64_t)&v50;
    swift_retain();
    sub_245E3CA00();
    return sub_245E31DDC((uint64_t)&v50);
  }
}

uint64_t (*sub_245E31680())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_245E316C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7, uint64_t a8)
{
  void (*v13)(uint64_t, _QWORD *);
  _QWORD *v14;

  __swift_instantiateConcreteTypeFromMangledName(a6);
  v13 = (void (*)(uint64_t, _QWORD *))sub_245E3C9DC();
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = a4;
  v14[3] = a5;
  v14[4] = a1;
  v14[5] = a2;
  swift_retain();
  swift_retain();
  v13(a8, v14);
  swift_release();
  return swift_release();
}

uint64_t sub_245E31764(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void (*v9)(uint64_t (*)(uint64_t), _QWORD *);
  _QWORD *v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257524630);
  v9 = (void (*)(uint64_t (*)(uint64_t), _QWORD *))sub_245E3C9DC();
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a1;
  v10[3] = a2;
  v10[4] = a4;
  v10[5] = a5;
  swift_retain();
  swift_retain();
  v9(sub_245E326FC, v10);
  swift_release();
  return swift_release();
}

uint64_t sub_245E3180C(void *a1, char a2, uint64_t (*a3)(void **), uint64_t a4, void (*a5)(void *))
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v15;
  void (*v16)(uint64_t (*)(uint64_t), uint64_t);
  uint64_t v17;
  void *v18;
  char v19;

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257524630);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
  {
    v15 = a1;
    a5(a1);
    v16 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_245E3C9DC();
    v17 = swift_allocObject();
    *(_QWORD *)(v17 + 16) = a3;
    *(_QWORD *)(v17 + 24) = a4;
    swift_retain();
    v16(sub_245E324DC, v17);
    swift_release();
    swift_release();
    sub_245E32554(a1, 1);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  else
  {
    v18 = a1;
    v19 = 0;
    return a3(&v18);
  }
}

void sub_245E31944(uint64_t a1, void (*a2)(uint64_t *), uint64_t a3, void (*a4)(uint64_t *), uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  id v14;
  void (*v15)(uint64_t (*)(uint64_t), uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  __int128 v20[2];
  char v21;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257524630);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245E327A8(a1, (uint64_t)v20);
  if ((v21 & 1) != 0)
  {
    v13 = *(void **)&v20[0];
    v18 = *(_QWORD *)&v20[0];
    v19 = 1;
    v14 = *(id *)&v20[0];
    a4(&v18);

  }
  else
  {
    sub_245E3233C(v20, (uint64_t)&v18);
    a2(&v18);
    v15 = (void (*)(uint64_t (*)(uint64_t), uint64_t))sub_245E3C9DC();
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = a4;
    *(_QWORD *)(v16 + 24) = a5;
    swift_retain();
    v15(sub_245E324DC, v16);
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v18);
  }
}

uint64_t sub_245E31AA0(void *a1, char a2, void (*a3)(uint64_t), uint64_t a4, void (*a5)(_QWORD *), uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void (*v16)(uint64_t (*)(), uint64_t);
  uint64_t v17;
  id v19;
  _QWORD v20[5];
  char v21;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_257524778);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
  {
    v20[0] = a1;
    v21 = 1;
    v19 = a1;
    a5(v20);
    return sub_245E2B1E4((uint64_t)v20);
  }
  else
  {
    a3(v13);
    v16 = (void (*)(uint64_t (*)(), uint64_t))sub_245E3C9DC();
    v17 = swift_allocObject();
    *(_QWORD *)(v17 + 16) = a5;
    *(_QWORD *)(v17 + 24) = a6;
    swift_retain();
    v16(sub_245E32438, v17);
    swift_release();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  }
}

uint64_t sub_245E31BD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t (*v22)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t ObjectType;
  uint64_t v27;
  void (*v28)(uint64_t (*)(_QWORD *), uint64_t, uint64_t, uint64_t);
  uint64_t v31[5];
  uint64_t v32[5];
  uint64_t v33[5];

  v33[3] = a8;
  v33[4] = a11;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v33);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a8 - 8) + 32))(boxed_opaque_existential_1, a3, a8);
  v32[3] = a7;
  v32[4] = a10;
  v20 = __swift_allocate_boxed_opaque_existential_1(v32);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a7 - 8) + 32))(v20, a4, a7);
  v31[3] = a9;
  v31[4] = a12;
  v21 = __swift_allocate_boxed_opaque_existential_1(v31);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a9 - 8) + 32))(v21, a5, a9);
  *(_QWORD *)(a6 + 16) = 0;
  *(_QWORD *)(a6 + 24) = 0;
  *(_OWORD *)(a6 + 64) = 0u;
  *(_OWORD *)(a6 + 80) = 0u;
  *(_QWORD *)(a6 + 96) = 0;
  *(_BYTE *)(a6 + 104) = 2;
  sub_245E3CA18();
  swift_allocObject();
  *(_QWORD *)(a6 + 112) = sub_245E3CA0C();
  *(_QWORD *)(a6 + 32) = a1;
  *(_QWORD *)(a6 + 40) = a2;
  sub_245E328D0((uint64_t)v33, a6 + 120);
  sub_245E328D0((uint64_t)v32, a6 + 160);
  sub_245E328D0((uint64_t)v31, a6 + 200);
  v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a10 + 8);
  swift_bridgeObjectRetain();
  v23 = v22(a1, a2, a7, a10);
  v25 = v24;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a6 + 48) = v23;
  *(_QWORD *)(a6 + 56) = v25;
  ObjectType = swift_getObjectType();
  v27 = swift_allocObject();
  swift_weakInit();
  v28 = *(void (**)(uint64_t (*)(_QWORD *), uint64_t, uint64_t, uint64_t))(v25 + 16);
  swift_retain();
  v28(sub_245E32914, v27, ObjectType, v25);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  return a6;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
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

uint64_t sub_245E31DDC(uint64_t a1)
{
  destroy for SystemAppInstaller.State(a1);
  return a1;
}

uint64_t sub_245E31E08@<X0>(uint64_t a1@<X8>)
{
  return sub_245E32354(a1);
}

uint64_t sub_245E31E1C()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_245E31E40()
{
  uint64_t v0;

  return sub_245E13448(*(void **)(v0 + 16));
}

uint64_t sub_245E31E58()
{
  uint64_t v0;

  return sub_245E2FC24(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_245E31E74()
{
  uint64_t *v0;

  return sub_245E30D70(v0[2], v0[3], v0[4], v0[5], v0[6]);
}

uint64_t sub_245E31E84()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_245E31EA4()
{
  return objectdestroy_8Tm(&qword_257524630);
}

uint64_t sub_245E31EB0(uint64_t a1, uint64_t a2)
{
  return sub_245E32588(a1, a2, &qword_257524630, (uint64_t)&unk_251704A90, (uint64_t)sub_245E32428);
}

uint64_t type metadata accessor for SystemAppInstaller()
{
  return objc_opt_self();
}

uint64_t method lookup function for SystemAppInstaller()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SystemAppInstaller.onProgressUpdated.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of SystemAppInstaller.onProgressUpdated.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of SystemAppInstaller.onProgressUpdated.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of SystemAppInstaller.__allocating_init(bundleIdentifier:installRequestProvider:recordObserverProvider:timerProvider:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t initializeBufferWithCopyOfBuffer for SystemAppInstaller.State(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SystemAppInstaller.State(uint64_t result)
{
  unsigned int v1;

  v1 = *(unsigned __int8 *)(result + 40);
  if (v1 >= 2)
    v1 = *(_DWORD *)result + 2;
  if (v1 == 1)
    return __swift_destroy_boxed_opaque_existential_1(result);
  if (!v1)
  {
    swift_unknownObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for SystemAppInstaller.State(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;

  v3 = *(unsigned __int8 *)(a2 + 40);
  if (v3 >= 2)
    v3 = *(_DWORD *)a2 + 2;
  if (v3 == 1)
  {
    v5 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 24) = v5;
    (**(void (***)(uint64_t))(v5 - 8))(a1);
    *(_BYTE *)(a1 + 40) = 1;
  }
  else if (v3)
  {
    v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  }
  else
  {
    v4 = *(_QWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_QWORD *)(a1 + 16) = v4;
    *(_BYTE *)(a1 + 40) = 0;
    swift_unknownObjectRetain();
    swift_retain();
  }
  return a1;
}

uint64_t assignWithCopy for SystemAppInstaller.State(uint64_t a1, __int128 *a2)
{
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;

  if ((__int128 *)a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 2)
      v4 = *(_DWORD *)a1 + 2;
    if (v4 == 1)
    {
      __swift_destroy_boxed_opaque_existential_1(a1);
    }
    else if (!v4)
    {
      swift_unknownObjectRelease();
      swift_release();
    }
    v5 = *((unsigned __int8 *)a2 + 40);
    if (v5 >= 2)
      v5 = *(_DWORD *)a2 + 2;
    if (v5 == 1)
    {
      v8 = *((_QWORD *)a2 + 3);
      *(_QWORD *)(a1 + 24) = v8;
      *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
      (**(void (***)(uint64_t, __int128 *))(v8 - 8))(a1, a2);
      *(_BYTE *)(a1 + 40) = 1;
    }
    else if (v5)
    {
      v9 = *a2;
      v10 = a2[1];
      *(_OWORD *)(a1 + 25) = *(__int128 *)((char *)a2 + 25);
      *(_OWORD *)a1 = v9;
      *(_OWORD *)(a1 + 16) = v10;
    }
    else
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      v6 = *((_QWORD *)a2 + 1);
      v7 = *((_QWORD *)a2 + 2);
      *(_QWORD *)(a1 + 8) = v6;
      *(_QWORD *)(a1 + 16) = v7;
      *(_BYTE *)(a1 + 40) = 0;
      swift_unknownObjectRetain();
      swift_retain();
    }
  }
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for SystemAppInstaller.State(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  unsigned int v5;
  __int128 v6;
  __int128 v7;

  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 40);
    if (v4 >= 2)
      v4 = *(_DWORD *)a1 + 2;
    if (v4 == 1)
    {
      __swift_destroy_boxed_opaque_existential_1(a1);
    }
    else if (!v4)
    {
      swift_unknownObjectRelease();
      swift_release();
    }
    v5 = *(unsigned __int8 *)(a2 + 40);
    if (v5 >= 2)
      v5 = *(_DWORD *)a2 + 2;
    if (v5 == 1)
    {
      v6 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v6;
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      *(_BYTE *)(a1 + 40) = 1;
    }
    else if (v5)
    {
      v7 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v7;
      *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
    }
    else
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
      *(_BYTE *)(a1 + 40) = 0;
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for SystemAppInstaller.State(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 41))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 >= 3)
    return (v3 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SystemAppInstaller.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_OWORD *)(result + 25) = 0u;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_BYTE *)(result + 40) = -(char)a2;
  }
  return result;
}

uint64_t sub_245E322B4(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned __int8 *)(a1 + 40);
  if (result >= 2)
    return (*(_DWORD *)a1 + 2);
  return result;
}

uint64_t sub_245E322D0(uint64_t result, unsigned int a2)
{
  if (a2 > 1)
  {
    *(_QWORD *)(result + 32) = 0;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 40) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SystemAppInstaller.State()
{
  return &type metadata for SystemAppInstaller.State;
}

uint64_t sub_245E32308(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for SystemAppInstaller.State(a2, a1);
  return a2;
}

uint64_t sub_245E3233C(__int128 *a1, uint64_t a2)
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

uint64_t sub_245E32354@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  swift_beginAccess();
  return sub_245E32308(v1 + 64, a1);
}

uint64_t sub_245E323AC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245E323D0(uint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, double *);
  double v5;

  v3 = *(uint64_t (**)(uint64_t, double *))(v2 + 16);
  v5 = a2;
  return v3(a1, &v5);
}

uint64_t sub_245E32400(uint64_t a1, double *a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(double))(v2 + 16))(*a2);
}

uint64_t sub_245E32428(uint64_t a1)
{
  return sub_245E32708(a1, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_245E31AA0);
}

uint64_t sub_245E32438()
{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t result;

  v1 = *(uint64_t (**)(void))(v0 + 16);
  if (v1)
    return v1();
  return result;
}

uint64_t objectdestroy_2Tm()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245E32490(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  return sub_245E30E0C(a1, a2, v2[2], v2[3], v2[4], v2[5], v2[6]);
}

uint64_t sub_245E324A0()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245E324CC(uint64_t a1)
{
  uint64_t v1;

  return sub_245E31050(a1, *(_QWORD **)(v1 + 16), *(void (**)(_QWORD))(v1 + 24), *(_QWORD *)(v1 + 32));
}

unint64_t sub_245E324E0()
{
  unint64_t result;

  result = qword_257524780;
  if (!qword_257524780)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257524780);
  }
  return result;
}

uint64_t sub_245E3251C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_245E32540()
{
  return sub_245E30144();
}

id sub_245E32548(id result, char a2)
{
  if ((a2 & 1) != 0)
    return result;
  return result;
}

void sub_245E32554(id a1, char a2)
{
  if ((a2 & 1) != 0)

}

uint64_t sub_245E32560()
{
  return objectdestroy_8Tm(&qword_257524778);
}

uint64_t sub_245E3256C(uint64_t a1, uint64_t a2)
{
  return sub_245E32588(a1, a2, &qword_257524778, (uint64_t)&unk_251704C48, (uint64_t)sub_245E3279C);
}

uint64_t sub_245E32588(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v11;
  unint64_t v12;
  uint64_t *v13;

  v11 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a3) - 8);
  v12 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v13 = (uint64_t *)(v5 + ((*(_QWORD *)(v11 + 64) + v12 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_245E316C0(a1, a2, v5 + v12, *v13, v13[1], a3, a4, a5);
}

uint64_t sub_245E32610()
{
  return objectdestroy_8Tm(&qword_257524630);
}

uint64_t objectdestroy_8Tm(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80)), v2);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245E32690(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  uint64_t *v7;

  v5 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257524630) - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = (uint64_t *)(v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_245E31764(a1, a2, v2 + v6, *v7, v7[1]);
}

uint64_t sub_245E326FC(uint64_t a1)
{
  return sub_245E32708(a1, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_245E3180C);
}

uint64_t sub_245E32708(uint64_t a1, uint64_t (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v2;

  return a2(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8), v2[2], v2[3], v2[4], v2[5]);
}

unint64_t sub_245E32728()
{
  unint64_t result;

  result = qword_257524788;
  if (!qword_257524788)
  {
    result = MEMORY[0x24954A9D0](&protocol conformance descriptor for AppInstallError, &type metadata for AppInstallError);
    atomic_store(result, (unint64_t *)&qword_257524788);
  }
  return result;
}

uint64_t objectdestroy_21Tm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_245E3279C(uint64_t a1)
{
  uint64_t v1;

  sub_245E31944(a1, *(void (**)(uint64_t *))(v1 + 16), *(_QWORD *)(v1 + 24), *(void (**)(uint64_t *))(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_245E327A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257524770);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t objectdestroy_24Tm()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_245E32820(uint64_t result)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  char v3;
  uint64_t v4;
  char v5;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v3 = *(_BYTE *)(result + 8);
  v4 = *(_QWORD *)result;
  v5 = v3;
  if (v2)
    return v2(&v4);
  return result;
}

uint64_t sub_245E32860(uint64_t a1, uint64_t a2)
{
  assignWithTake for SystemAppInstaller.State(a2, a1);
  return a2;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_245E328D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_245E32914(_QWORD *a1)
{
  return sub_245E2FBC8(a1);
}

id sub_245E3291C()
{
  return sub_245E31E40();
}

uint64_t sub_245E32940()
{
  return sub_245E31E58();
}

uint64_t ASDApp.bundleIdentifier.getter()
{
  void *v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(v0, sel_bundleID);
  v2 = sub_245E3CC64();

  return v2;
}

uint64_t ASDApp.installIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  v3 = objc_msgSend(v1, sel_installID);
  if (v3)
  {
    v4 = v3;
    sub_245E3C3C4();

    v5 = sub_245E3C3D0();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a1;
    v8 = 0;
  }
  else
  {
    v5 = sub_245E3C3D0();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a1;
    v8 = 1;
  }
  return v6(v7, v8, 1, v5);
}

id ASDApp.installProgress.getter()
{
  void *v0;

  return objc_msgSend(v0, sel_progress);
}

uint64_t sub_245E32A54()
{
  id *v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(*v0, sel_localizedName);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_245E3CC64();

  return v3;
}

uint64_t sub_245E32AB8()
{
  id *v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(*v0, sel_bundleID);
  v2 = sub_245E3CC64();

  return v2;
}

id sub_245E32B0C()
{
  id *v0;

  return objc_msgSend(*v0, sel_isInstalled);
}

uint64_t sub_245E32B2C@<X0>(uint64_t a1@<X8>)
{
  id *v1;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  v3 = objc_msgSend(*v1, sel_installID);
  if (v3)
  {
    v4 = v3;
    sub_245E3C3C4();

    v5 = sub_245E3C3D0();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a1;
    v8 = 0;
  }
  else
  {
    v5 = sub_245E3C3D0();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a1;
    v8 = 1;
  }
  return v6(v7, v8, 1, v5);
}

id sub_245E32BB0()
{
  id *v0;

  return objc_msgSend(*v0, sel_installError);
}

id sub_245E32BD4()
{
  id *v0;

  return objc_msgSend(*v0, sel_progress);
}

uint64_t dispatch thunk of AppRecord.localizedName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AppRecord.bundleIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of AppRecord.isInstalled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of AppRecord.installIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of AppRecord.installError.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of AppRecord.installProgress.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t static ASDInstallApps.requestInstall(for:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v11;

  v1 = v0;
  v2 = sub_245E3CBC8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245E3CB08();
  sub_245E3CBB0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v6 = objc_allocWithZone(MEMORY[0x24BE045F0]);
  swift_bridgeObjectRetain();
  v7 = (void *)sub_245E3CC40();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v6, sel_initWithBundleID_, v7);

  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = v1;
  return sub_245E3C9C4();
}

uint64_t sub_245E32D7C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void *v18;
  _QWORD *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD aBlock[6];

  v25 = a4;
  v7 = sub_245E3CBD4();
  v28 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_245E3CBF8();
  v26 = *(_QWORD *)(v10 - 8);
  v27 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_245E3CBE0();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a1;
  *(_QWORD *)(v17 + 24) = a2;
  sub_245E324E0();
  (*(void (**)(char *, _QWORD, uint64_t))(v14 + 104))(v16, *MEMORY[0x24BEE5480], v13);
  swift_retain();
  v18 = (void *)sub_245E3CE38();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  v19 = (_QWORD *)swift_allocObject();
  v20 = v25;
  v19[2] = a3;
  v19[3] = v20;
  v19[4] = sub_245E33930;
  v19[5] = v17;
  aBlock[4] = sub_245E33994;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_245E2A770;
  aBlock[3] = &block_descriptor_2;
  v21 = _Block_copy(aBlock);
  v22 = a3;
  sub_245E3CBEC();
  v29 = MEMORY[0x24BEE4AF8];
  sub_245E2B0A8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257524588);
  sub_245E2B0F0();
  sub_245E3CED4();
  MEMORY[0x24954A2F8](0, v12, v9, v21);
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v28 + 8))(v9, v7);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v12, v27);
  return swift_release();
}

uint64_t sub_245E32FF4()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_245E33018(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_245E32D7C(a1, a2, *(void **)(v2 + 16), *(_QWORD *)(v2 + 24));
}

void sub_245E33020(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void *ObjCClassFromMetadata;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t aBlock[6];

  v8 = sub_245E3CBC8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245E3CB08();
  v12 = a1;
  v13 = sub_245E3CBBC();
  v14 = sub_245E3CE14();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = swift_slowAlloc();
    v32 = v9;
    v16 = v15;
    v17 = swift_slowAlloc();
    v31 = v17;
    *(_DWORD *)v16 = 141558274;
    v36 = 1752392040;
    aBlock[0] = v17;
    v35 = a3;
    sub_245E3CE80();
    *(_WORD *)(v16 + 12) = 2080;
    v29 = v16 + 14;
    v18 = v12;
    v33 = a2;
    v19 = v18;
    v20 = objc_msgSend(v18, sel_description);
    v30 = v8;
    v21 = v20;
    v22 = sub_245E3CC64();
    v34 = a4;
    v24 = v23;

    v36 = sub_245E19CDC(v22, v24, aBlock);
    a3 = v35;
    sub_245E3CE80();

    a4 = v34;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_245E10000, v13, v14, "Requesting to install %{mask.hash}s", (uint8_t *)v16, 0x16u);
    v25 = v31;
    swift_arrayDestroy();
    MEMORY[0x24954AA78](v25, -1, -1);
    MEMORY[0x24954AA78](v16, -1, -1);

    (*(void (**)(char *, uint64_t))(v32 + 8))(v11, v30);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v27 = swift_allocObject();
  *(_QWORD *)(v27 + 16) = a3;
  *(_QWORD *)(v27 + 24) = a4;
  aBlock[4] = (uint64_t)sub_245E339B8;
  aBlock[5] = v27;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_245E336C4;
  aBlock[3] = (uint64_t)&block_descriptor_12;
  v28 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(ObjCClassFromMetadata, sel_installApp_withCompletionHandler_, v12, v28);
  _Block_release(v28);
}

uint64_t sub_245E332F8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  int v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  id v19;
  const void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t aBlock;
  uint64_t v28;
  uint64_t (*v29)();
  void *v30;
  void (*v31)();
  _QWORD *v32;

  v8 = sub_245E3CBD4();
  v24 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_245E3CBF8();
  v11 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_245E3C3D0();
  v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 48))(a1, 1, v14);
  sub_245E324E0();
  v16 = (void *)sub_245E3CE20();
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  if (v15 == 1)
  {
    v17[4] = a2;
    v31 = sub_245E33A2C;
    v32 = v17;
    aBlock = MEMORY[0x24BDAC760];
    v28 = 1107296256;
    v29 = sub_245E2A770;
    v30 = &block_descriptor_18;
    v18 = _Block_copy(&aBlock);
    swift_retain();
    v19 = a2;
    sub_245E3CBEC();
    v26 = MEMORY[0x24BEE4AF8];
    sub_245E2B0A8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_257524588);
    sub_245E2B0F0();
    sub_245E3CED4();
    MEMORY[0x24954A2F8](0, v13, v10, v18);
    v20 = v18;
  }
  else
  {
    v31 = sub_245E33A38;
    v32 = v17;
    aBlock = MEMORY[0x24BDAC760];
    v28 = 1107296256;
    v29 = sub_245E2A770;
    v30 = &block_descriptor_24;
    v21 = _Block_copy(&aBlock);
    swift_retain();
    sub_245E3CBEC();
    v26 = MEMORY[0x24BEE4AF8];
    sub_245E2B0A8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_257524588);
    sub_245E2B0F0();
    sub_245E3CED4();
    MEMORY[0x24954A2F8](0, v13, v10, v21);
    v20 = v21;
  }
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v24 + 8))(v10, v8);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v25);
  return swift_release();
}

void sub_245E335E0(void (*a1)(void *, _QWORD))
{
  void *v2;
  unsigned __int8 v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25441B628);
  sub_245E3D0F0();
  a1(v2, v3);
  sub_245E32554(v2, v3);
}

void sub_245E3364C(void (*a1)(id, uint64_t), int a2, id a3)
{
  id v5;
  _BYTE *v6;
  id v7;

  if (a3)
  {
    v5 = a3;
  }
  else
  {
    sub_245E2B224();
    v5 = (id)swift_allocError();
    *v6 = 5;
  }
  v7 = a3;
  a1(v5, 1);

}

uint64_t sub_245E336C4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void (*v9)(char *, void *);
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257524790);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(void (**)(char *, void *))(a1 + 32);
  if (a2)
  {
    sub_245E3C3C4();
    v10 = sub_245E3C3D0();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 0, 1, v10);
  }
  else
  {
    v11 = sub_245E3C3D0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  }
  swift_retain();
  v12 = a3;
  v9(v8, a3);
  swift_release();

  return sub_245E339C0((uint64_t)v8);
}

_QWORD *initializeBufferWithCopyOfBuffer for AppInstallRequestType(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for AppInstallRequestType()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for AppInstallRequestType(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for AppInstallRequestType(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppInstallRequestType(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppInstallRequestType(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
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
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppInstallRequestType()
{
  return &type metadata for AppInstallRequestType;
}

uint64_t dispatch thunk of static AppInstallRequesting.requestInstall(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_245E3390C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245E33930(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t *);
  uint64_t v5;
  char v6;

  v3 = *(uint64_t (**)(uint64_t *))(v2 + 16);
  v5 = a1;
  v6 = a2 & 1;
  return v3(&v5);
}

uint64_t sub_245E33968()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_245E33994()
{
  uint64_t v0;

  sub_245E33020(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_245E339B8(uint64_t a1, void *a2)
{
  uint64_t v2;

  return sub_245E332F8(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t sub_245E339C0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257524790);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_245E33A00()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_245E33A2C()
{
  uint64_t v0;

  sub_245E3364C(*(void (**)(id, uint64_t))(v0 + 16), *(_QWORD *)(v0 + 24), *(id *)(v0 + 32));
}

void sub_245E33A38()
{
  uint64_t v0;

  sub_245E335E0(*(void (**)(void *, _QWORD))(v0 + 16));
}

uint64_t AppInstallerProvider.makeSystemAppInstaller(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v4 = sub_245E3CACC();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v14 - v9;
  swift_bridgeObjectRetain();
  sub_245E3CAC0();
  type metadata accessor for SystemAppInstaller();
  v11 = swift_allocObject();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
  v12 = sub_245E33C68(a1, a2, (uint64_t)v8, v11);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  return v12;
}

uint64_t sub_245E33B68(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v4 = sub_245E3CACC();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v14 - v9;
  swift_bridgeObjectRetain();
  sub_245E3CAC0();
  type metadata accessor for SystemAppInstaller();
  v11 = swift_allocObject();
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
  v12 = sub_245E33C68(a1, a2, (uint64_t)v8, v11);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  return v12;
}

uint64_t sub_245E33C68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t *boxed_opaque_existential_1;
  id v10;
  char *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v16[5];
  _BYTE v17[24];
  ValueMetadata *v18;
  _UNKNOWN **v19;
  _BYTE v20[24];
  ValueMetadata *v21;
  _UNKNOWN **v22;

  v21 = &type metadata for AppInstallRequestProvider;
  v22 = &protocol witness table for AppInstallRequestProvider;
  v18 = &type metadata for AppRecordObserverProvider;
  v19 = &protocol witness table for AppRecordObserverProvider;
  v8 = sub_245E3CACC();
  v16[3] = v8;
  v16[4] = MEMORY[0x24BE87608];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v16);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(boxed_opaque_existential_1, a3, v8);
  *(_QWORD *)(a4 + 16) = 0;
  *(_QWORD *)(a4 + 24) = 0;
  *(_OWORD *)(a4 + 64) = 0u;
  *(_OWORD *)(a4 + 80) = 0u;
  *(_QWORD *)(a4 + 96) = 0;
  *(_BYTE *)(a4 + 104) = 2;
  sub_245E3CA18();
  swift_allocObject();
  *(_QWORD *)(a4 + 112) = sub_245E3CA0C();
  *(_QWORD *)(a4 + 32) = a1;
  *(_QWORD *)(a4 + 40) = a2;
  sub_245E328D0((uint64_t)v20, a4 + 120);
  sub_245E328D0((uint64_t)v17, a4 + 160);
  sub_245E328D0((uint64_t)v16, a4 + 200);
  v10 = objc_allocWithZone((Class)type metadata accessor for AppRecordObserver());
  swift_bridgeObjectRetain_n();
  v11 = sub_245E29A94(a1, a2);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a4 + 48) = v11;
  *(_QWORD *)(a4 + 56) = &off_251704590;
  v12 = swift_allocObject();
  swift_weakInit();
  v13 = (uint64_t *)&v11[OBJC_IVAR____TtC21SeymourClientServices17AppRecordObserver_onRecordUpdated];
  swift_beginAccess();
  v14 = *v13;
  *v13 = (uint64_t)sub_245E32914;
  v13[1] = v12;
  swift_retain();
  sub_245E2B268(v14);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  return a4;
}

uint64_t dispatch thunk of AppInstallerProviding.makeSystemAppInstaller(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

ValueMetadata *type metadata accessor for AppInstallerProvider()
{
  return &type metadata for AppInstallerProvider;
}

uint64_t sub_245E33E4C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

char *AppRecordObserverProvider.makeAppRecordObserver(for:)(uint64_t a1, uint64_t a2)
{
  id v4;

  v4 = objc_allocWithZone((Class)type metadata accessor for AppRecordObserver());
  swift_bridgeObjectRetain();
  return sub_245E29A94(a1, a2);
}

char *sub_245E33ECC(uint64_t a1, uint64_t a2)
{
  id v4;

  v4 = objc_allocWithZone((Class)type metadata accessor for AppRecordObserver());
  swift_bridgeObjectRetain();
  return sub_245E29A94(a1, a2);
}

uint64_t dispatch thunk of AppRecordObserverProviding.makeAppRecordObserver(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

ValueMetadata *type metadata accessor for AppRecordObserverProvider()
{
  return &type metadata for AppRecordObserverProvider;
}

void sub_245E33F3C(void *a1)
{
  unint64_t v1;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD *i;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  char *v13;
  unint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  id v18;
  unsigned __int8 v19;
  char isUniquelyReferenced_nonNull_native;
  char v21;
  unint64_t v22;
  uint64_t v23;
  _BOOL8 v24;
  uint64_t v25;
  char v26;
  unint64_t v27;
  char v28;
  uint64_t *v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  _QWORD *v39;
  unint64_t v40;
  unint64_t v41;
  int64_t v42;
  unint64_t v43;
  int64_t v44;
  char *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  char v51;
  char v52;
  unint64_t v53;
  uint64_t v54;
  _BOOL8 v55;
  uint64_t v56;
  char v57;
  unint64_t v58;
  char v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  int64_t v69;
  unint64_t v70;
  unint64_t v71;
  int64_t v72;
  unint64_t v73;
  int64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  char v82;
  unint64_t v83;
  unint64_t v84;
  uint64_t v85;
  _BOOL8 v86;
  uint64_t v87;
  unint64_t v88;
  char v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  id v93;
  void *v94;
  id v95;
  _QWORD *v96;
  void *v97;
  id v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  id v102;
  void *v103;
  id v104;
  void *v105;
  unint64_t v106;
  id v107;
  void *v108;
  id v109;
  id v110;
  void *v111;
  id v112;
  id v113;
  void *v114;
  id v115;
  void *v116;
  id v117;
  void *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  unint64_t v123;
  int64_t v124;
  int64_t v125;
  int64_t v126;
  uint64_t v127;
  unint64_t v128;
  _QWORD *v129;
  _QWORD *v130;
  _QWORD *v131;
  unint64_t v132;

  sub_245E2738C();
  v119 = (void *)sub_245E272CC();
  v120 = a1;
  v3 = sub_245E271FC(0xD000000000000028, 0x8000000245E3EB00);
  if (!v3)
    v3 = sub_245E2BBF4(MEMORY[0x24BEE4AF8]);
  v4 = v3;
  v131 = (_QWORD *)sub_245E2BAE4(MEMORY[0x24BEE4AF8]);
  v123 = v4 + 64;
  v5 = 1 << *(_BYTE *)(v4 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(v4 + 64);
  v126 = (unint64_t)(v5 + 63) >> 6;
  swift_bridgeObjectRetain();
  for (i = 0; ; i = v130)
  {
    if (v7)
    {
      v129 = (_QWORD *)((v7 - 1) & v7);
      v130 = i;
      v9 = __clz(__rbit64(v7)) | ((_QWORD)i << 6);
      goto LABEL_28;
    }
    v10 = (int64_t)i + 1;
    if (__OFADD__(i, 1))
      goto LABEL_136;
    if (v10 >= v126)
      break;
    v11 = *(_QWORD *)(v123 + 8 * v10);
    v12 = (int64_t)i + 1;
    if (!v11)
    {
      v12 = (int64_t)i + 2;
      if ((uint64_t)i + 2 >= v126)
        break;
      v11 = *(_QWORD *)(v123 + 8 * v12);
      if (!v11)
      {
        v12 = (int64_t)i + 3;
        if ((uint64_t)i + 3 >= v126)
          break;
        v11 = *(_QWORD *)(v123 + 8 * v12);
        if (!v11)
        {
          v12 = (int64_t)i + 4;
          if ((uint64_t)i + 4 >= v126)
            break;
          v11 = *(_QWORD *)(v123 + 8 * v12);
          if (!v11)
          {
            v12 = (int64_t)i + 5;
            if ((uint64_t)i + 5 >= v126)
              break;
            v11 = *(_QWORD *)(v123 + 8 * v12);
            if (!v11)
            {
              v13 = (char *)i + 6;
              if ((uint64_t)i + 6 >= v126)
                break;
              v11 = *(_QWORD *)(v123 + 8 * (_QWORD)v13);
              if (!v11)
              {
                while (1)
                {
                  v12 = (int64_t)(v13 + 1);
                  if (__OFADD__(v13, 1))
                    goto LABEL_141;
                  if (v12 >= v126)
                    goto LABEL_37;
                  v11 = *(_QWORD *)(v123 + 8 * v12);
                  ++v13;
                  if (v11)
                    goto LABEL_27;
                }
              }
              v12 = (int64_t)i + 6;
            }
          }
        }
      }
    }
LABEL_27:
    v129 = (_QWORD *)((v11 - 1) & v11);
    v130 = (_QWORD *)v12;
    v9 = __clz(__rbit64(v11)) + (v12 << 6);
LABEL_28:
    v14 = v4;
    v15 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v9);
    v16 = *v15;
    v1 = v15[1];
    v17 = *(void **)(*(_QWORD *)(v4 + 56) + 8 * v9);
    swift_bridgeObjectRetain_n();
    v18 = v17;
    v19 = objc_msgSend(v18, sel_BOOLValue);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v132 = (unint64_t)v131;
    v22 = sub_245E2E2DC(v16, v1);
    v23 = v131[2];
    v24 = (v21 & 1) == 0;
    v25 = v23 + v24;
    if (__OFADD__(v23, v24))
    {
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
      goto LABEL_142;
    }
    v26 = v21;
    if (v131[3] >= v25)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        sub_245E3643C();
    }
    else
    {
      sub_245E2D058(v25, isUniquelyReferenced_nonNull_native);
      v27 = sub_245E2E2DC(v16, v1);
      if ((v26 & 1) != (v28 & 1))
        goto LABEL_162;
      v22 = v27;
    }
    if ((v26 & 1) != 0)
    {
      *(_BYTE *)(v131[7] + v22) = v19;
    }
    else
    {
      v131[(v22 >> 6) + 8] |= 1 << v22;
      v29 = (uint64_t *)(v131[6] + 16 * v22);
      *v29 = v16;
      v29[1] = v1;
      *(_BYTE *)(v131[7] + v22) = v19;
      v30 = v131[2];
      v31 = __OFADD__(v30, 1);
      v32 = v30 + 1;
      if (v31)
        goto LABEL_135;
      v131[2] = v32;
      swift_bridgeObjectRetain();
    }

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    v4 = v14;
    v7 = (unint64_t)v129;
  }
LABEL_37:
  swift_release();
  swift_bridgeObjectRelease();
  v33 = objc_msgSend(v120, sel_ams_privacyAcknowledgement);
  if (!v33)
  {
    v130 = 0;
    goto LABEL_74;
  }
  v34 = v33;
  sub_245E24A9C(0, (unint64_t *)&qword_2575244A8);
  v35 = sub_245E3CC10();

  v130 = (_QWORD *)sub_245E2BD0C(MEMORY[0x24BEE4AF8]);
  v121 = v35 + 64;
  v36 = 1 << *(_BYTE *)(v35 + 32);
  v37 = -1;
  if (v36 < 64)
    v37 = ~(-1 << v36);
  v38 = v37 & *(_QWORD *)(v35 + 64);
  v124 = (unint64_t)(v36 + 63) >> 6;
  swift_bridgeObjectRetain();
  v39 = 0;
  while (2)
  {
    if (v38)
    {
      v40 = __clz(__rbit64(v38));
      v38 &= v38 - 1;
      v129 = v39;
      v41 = v40 | ((_QWORD)v39 << 6);
LABEL_63:
      v46 = (uint64_t *)(*(_QWORD *)(v35 + 48) + 16 * v41);
      v48 = *v46;
      v47 = v46[1];
      v49 = *(void **)(*(_QWORD *)(v35 + 56) + 8 * v41);
      swift_bridgeObjectRetain_n();
      v50 = v49;
      v1 = (unint64_t)objc_msgSend(v50, sel_unsignedIntegerValue);
      v51 = swift_isUniquelyReferenced_nonNull_native();
      v132 = (unint64_t)v130;
      v53 = sub_245E2E2DC(v48, v47);
      v54 = v130[2];
      v55 = (v52 & 1) == 0;
      v56 = v54 + v55;
      if (__OFADD__(v54, v55))
        goto LABEL_133;
      v57 = v52;
      if (v130[3] >= v56)
      {
        if ((v51 & 1) == 0)
          sub_245E36298(&qword_2575245E8);
      }
      else
      {
        sub_245E2CD48(v56, v51);
        v58 = sub_245E2E2DC(v48, v47);
        if ((v57 & 1) != (v59 & 1))
          goto LABEL_162;
        v53 = v58;
      }
      if ((v57 & 1) != 0)
      {
        *(_QWORD *)(v130[7] + 8 * v53) = v1;
      }
      else
      {
        v130[(v53 >> 6) + 8] |= 1 << v53;
        v60 = (uint64_t *)(v130[6] + 16 * v53);
        *v60 = v48;
        v60[1] = v47;
        *(_QWORD *)(v130[7] + 8 * v53) = v1;
        v61 = v130[2];
        v31 = __OFADD__(v61, 1);
        v62 = v61 + 1;
        if (v31)
          goto LABEL_137;
        v130[2] = v62;
        swift_bridgeObjectRetain();
      }

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      v39 = v129;
      continue;
    }
    break;
  }
  v42 = (int64_t)v39 + 1;
  if (__OFADD__(v39, 1))
    goto LABEL_139;
  if (v42 >= v124)
    goto LABEL_72;
  v43 = *(_QWORD *)(v121 + 8 * v42);
  v44 = (int64_t)v39 + 1;
  if (v43)
    goto LABEL_62;
  v44 = (int64_t)v39 + 2;
  if ((uint64_t)v39 + 2 >= v124)
    goto LABEL_72;
  v43 = *(_QWORD *)(v121 + 8 * v44);
  if (v43)
    goto LABEL_62;
  v44 = (int64_t)v39 + 3;
  if ((uint64_t)v39 + 3 >= v124)
    goto LABEL_72;
  v43 = *(_QWORD *)(v121 + 8 * v44);
  if (v43)
    goto LABEL_62;
  v44 = (int64_t)v39 + 4;
  if ((uint64_t)v39 + 4 >= v124)
    goto LABEL_72;
  v43 = *(_QWORD *)(v121 + 8 * v44);
  if (v43)
    goto LABEL_62;
  v44 = (int64_t)v39 + 5;
  if ((uint64_t)v39 + 5 >= v124)
    goto LABEL_72;
  v43 = *(_QWORD *)(v121 + 8 * v44);
  if (v43)
  {
LABEL_62:
    v38 = (v43 - 1) & v43;
    v129 = (_QWORD *)v44;
    v41 = __clz(__rbit64(v43)) + (v44 << 6);
    goto LABEL_63;
  }
  v45 = (char *)v39 + 6;
  if ((uint64_t)v39 + 6 >= v124)
    goto LABEL_72;
  v43 = *(_QWORD *)(v121 + 8 * (_QWORD)v45);
  if (v43)
  {
    v44 = (int64_t)v39 + 6;
    goto LABEL_62;
  }
  while (1)
  {
    v44 = (int64_t)(v45 + 1);
    if (__OFADD__(v45, 1))
    {
      __break(1u);
      goto LABEL_160;
    }
    if (v44 >= v124)
      break;
    v43 = *(_QWORD *)(v121 + 8 * v44);
    ++v45;
    if (v43)
      goto LABEL_62;
  }
LABEL_72:
  swift_release();
  swift_bridgeObjectRelease();
LABEL_74:
  v63 = objc_msgSend(v120, sel_ams_pushRegistrationThrottleMap);
  if (!v63)
  {
    v129 = 0;
LABEL_111:
    sub_245E27110(0x46746E756F636361, 0xEC0000007367616CLL);
    sub_245E2711C(0xD000000000000010, 0x8000000245E3EBB0);
    v93 = objc_msgSend(v120, sel_ams_altDSID);
    if (v93)
    {
      v94 = v93;
      sub_245E3CC64();

    }
    v95 = objc_msgSend(v120, sel_ams_automaticDownloadKinds);
    v96 = (_QWORD *)MEMORY[0x24BEE4AF8];
    if (v95)
    {
      v97 = v95;
      sub_245E3CD24();

    }
    v98 = objc_msgSend(v120, sel_ams_cookies);
    if (!v98)
      goto LABEL_144;
    v99 = v98;
    sub_245E24A9C(0, &qword_257524798);
    v1 = sub_245E3CD24();

    v132 = (unint64_t)v96;
    if (!(v1 >> 62))
    {
      v100 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v100)
      {
LABEL_143:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_144:
        v110 = objc_msgSend(v120, sel_ams_creditsString);
        if (v110)
        {
          v111 = v110;
          sub_245E3CC64();

        }
        sub_245E27140();
        objc_msgSend(v120, sel_ams_didAgreeToTerms);
        if (v119)
        {
          v112 = objc_msgSend(v119, sel_stringValue);
          sub_245E3CC64();

        }
        v113 = objc_msgSend(v120, sel_ams_firstName);
        if (v113)
        {
          v114 = v113;
          sub_245E3CC64();

        }
        objc_msgSend(v120, sel_ams_freePasswordPromptSetting);
        objc_msgSend(v120, sel_ams_isiCloudFamily);
        objc_msgSend(v120, sel_ams_isInGoodStanding);
        objc_msgSend(v120, sel_ams_isDemoAccount);
        objc_msgSend(v120, sel_ams_isManagedAppleID);
        objc_msgSend(v120, sel_ams_isValidPayment);
        v115 = objc_msgSend(v120, sel_ams_lastName);
        if (v115)
        {
          v116 = v115;
          sub_245E3CC64();

        }
        objc_msgSend(v120, sel_ams_lastAuthenticationCredentialSource);
        objc_msgSend(v120, sel_ams_mergedPrivacyAcknowledgement);
        objc_msgSend(v120, sel_ams_paidPasswordPromptSetting);
        if (!v130)
          sub_245E2BD0C(MEMORY[0x24BEE4AF8]);
        if (!v129)
          sub_245E2B780(MEMORY[0x24BEE4AF8]);
        v117 = objc_msgSend(v120, sel_ams_storefront);
        if (v117)
        {
          v118 = v117;
          sub_245E3CC64();

        }
        sub_245E3C88C();

        return;
      }
LABEL_118:
      if (v100 < 1)
        goto LABEL_161;
      v101 = 0;
      v128 = v1 & 0xC000000000000001;
      do
      {
        if (v128)
          v102 = (id)MEMORY[0x24954A43C](v101, v1);
        else
          v102 = *(id *)(v1 + 8 * v101 + 32);
        v103 = v102;
        v104 = objc_msgSend(v102, sel_properties);
        if (v104)
        {
          v105 = v104;
          type metadata accessor for HTTPCookiePropertyKey();
          sub_245E365E4();
          v106 = v1;
          sub_245E3CC10();

          v107 = objc_allocWithZone((Class)sub_245E3C6A0());
          v108 = (void *)sub_245E3CC04();
          swift_bridgeObjectRelease();
          v109 = objc_msgSend(v107, sel_initWithProperties_, v108);

          v1 = v106;
          if (v109)
          {
            MEMORY[0x24954A1D8]();
            if (*(_QWORD *)((v132 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v132 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              sub_245E3CD54();
            sub_245E3CD60();
            sub_245E3CD3C();
          }
        }
        else
        {

        }
        ++v101;
      }
      while (v100 != v101);
      goto LABEL_143;
    }
LABEL_142:
    swift_bridgeObjectRetain();
    v100 = sub_245E3CFD0();
    if (!v100)
      goto LABEL_143;
    goto LABEL_118;
  }
  v64 = v63;
  sub_245E24A9C(0, (unint64_t *)&qword_2575244A8);
  v65 = sub_245E3CC10();

  v127 = v65;
  v129 = (_QWORD *)sub_245E2B780(MEMORY[0x24BEE4AF8]);
  v122 = v65 + 64;
  v66 = 1 << *(_BYTE *)(v65 + 32);
  v67 = -1;
  if (v66 < 64)
    v67 = ~(-1 << v66);
  v68 = v67 & *(_QWORD *)(v65 + 64);
  v125 = (unint64_t)(v66 + 63) >> 6;
  swift_bridgeObjectRetain();
  v69 = 0;
  while (2)
  {
    if (v68)
    {
      v70 = __clz(__rbit64(v68));
      v68 &= v68 - 1;
      v71 = v70 | (v69 << 6);
LABEL_100:
      v75 = (uint64_t *)(*(_QWORD *)(v127 + 48) + 16 * v71);
      v77 = *v75;
      v76 = v75[1];
      v78 = *(void **)(*(_QWORD *)(v127 + 56) + 8 * v71);
      swift_bridgeObjectRetain_n();
      v79 = v78;
      objc_msgSend(v79, sel_doubleValue);
      v81 = v80;
      v82 = swift_isUniquelyReferenced_nonNull_native();
      v132 = (unint64_t)v129;
      v84 = sub_245E2E2DC(v77, v76);
      v85 = v129[2];
      v86 = (v83 & 1) == 0;
      v87 = v85 + v86;
      if (__OFADD__(v85, v86))
        goto LABEL_134;
      v1 = v83;
      if (v129[3] >= v87)
      {
        if ((v82 & 1) == 0)
          sub_245E35EFC();
      }
      else
      {
        sub_245E2C73C(v87, v82);
        v88 = sub_245E2E2DC(v77, v76);
        if ((v1 & 1) != (v89 & 1))
          goto LABEL_162;
        v84 = v88;
      }
      if ((v1 & 1) != 0)
      {
        *(_QWORD *)(v129[7] + 8 * v84) = v81;
      }
      else
      {
        v129[(v84 >> 6) + 8] |= 1 << v84;
        v90 = (uint64_t *)(v129[6] + 16 * v84);
        *v90 = v77;
        v90[1] = v76;
        *(_QWORD *)(v129[7] + 8 * v84) = v81;
        v91 = v129[2];
        v31 = __OFADD__(v91, 1);
        v92 = v91 + 1;
        if (v31)
          goto LABEL_138;
        v129[2] = v92;
        swift_bridgeObjectRetain();
      }

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      continue;
    }
    break;
  }
  v72 = v69 + 1;
  if (__OFADD__(v69, 1))
    goto LABEL_140;
  if (v72 >= v125)
  {
LABEL_109:
    swift_release();
    swift_bridgeObjectRelease();
    goto LABEL_111;
  }
  v73 = *(_QWORD *)(v122 + 8 * v72);
  ++v69;
  if (v73)
    goto LABEL_99;
  v69 = v72 + 1;
  if (v72 + 1 >= v125)
    goto LABEL_109;
  v73 = *(_QWORD *)(v122 + 8 * v69);
  if (v73)
    goto LABEL_99;
  v69 = v72 + 2;
  if (v72 + 2 >= v125)
    goto LABEL_109;
  v73 = *(_QWORD *)(v122 + 8 * v69);
  if (v73)
    goto LABEL_99;
  v69 = v72 + 3;
  if (v72 + 3 >= v125)
    goto LABEL_109;
  v73 = *(_QWORD *)(v122 + 8 * v69);
  if (v73)
    goto LABEL_99;
  v69 = v72 + 4;
  if (v72 + 4 >= v125)
    goto LABEL_109;
  v73 = *(_QWORD *)(v122 + 8 * v69);
  if (v73)
  {
LABEL_99:
    v68 = (v73 - 1) & v73;
    v71 = __clz(__rbit64(v73)) + (v69 << 6);
    goto LABEL_100;
  }
  v74 = v72 + 5;
  if (v74 >= v125)
    goto LABEL_109;
  v73 = *(_QWORD *)(v122 + 8 * v74);
  if (v73)
  {
    v69 = v74;
    goto LABEL_99;
  }
  while (1)
  {
    v69 = v74 + 1;
    if (__OFADD__(v74, 1))
      break;
    if (v69 >= v125)
      goto LABEL_109;
    v73 = *(_QWORD *)(v122 + 8 * v69);
    ++v74;
    if (v73)
      goto LABEL_99;
  }
LABEL_160:
  __break(1u);
LABEL_161:
  __break(1u);
LABEL_162:
  sub_245E3D084();
  __break(1u);
}

unint64_t sub_245E34F44()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  char v36;
  char v37;
  char v38;
  char v39;
  char v40;
  char v41;
  char v42;
  char v43;
  char v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  char v50;
  char v51;
  char v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  __int128 v63;
  uint64_t v64;
  _OWORD v65[2];
  __int128 v66;
  __int128 v67;

  v0 = sub_245E2B89C(MEMORY[0x24BEE4AF8]);
  v1 = sub_245E3C898();
  if (v1)
  {
    v2 = v1;
    *((_QWORD *)&v67 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_257524490);
    *(_QWORD *)&v66 = v2;
  }
  else
  {
    v66 = 0u;
    v67 = 0u;
  }
  sub_245E18A7C((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_245E28494(&v63, v65);
    sub_245E1A654((uint64_t)v65, (uint64_t)&v63);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v63, 0x46746E756F636361, 0xEC0000007367616CLL, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v63);
  }
  sub_245E18AC4((uint64_t)&v66);
  v4 = sub_245E3C8A4();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257524488);
  *((_QWORD *)&v67 + 1) = v5;
  *(_QWORD *)&v66 = v4;
  sub_245E18A7C((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_245E28494(&v63, v65);
    sub_245E1A654((uint64_t)v65, (uint64_t)&v63);
    v6 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v63, 0xD000000000000010, 0x8000000245E3EBB0, v6);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v63);
  }
  sub_245E18AC4((uint64_t)&v66);
  v7 = sub_245E3C8B0();
  v9 = MEMORY[0x24BEE0D00];
  if (v8)
  {
    *((_QWORD *)&v67 + 1) = MEMORY[0x24BEE0D00];
    *(_QWORD *)&v66 = v7;
    *((_QWORD *)&v66 + 1) = v8;
  }
  else
  {
    v66 = 0u;
    v67 = 0u;
  }
  sub_245E18A7C((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_245E28494(&v63, v65);
    sub_245E1A654((uint64_t)v65, (uint64_t)&v63);
    v10 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v63, 0x44495344746C61, 0xE700000000000000, v10);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v63);
  }
  sub_245E18AC4((uint64_t)&v66);
  v11 = sub_245E3C940();
  *((_QWORD *)&v67 + 1) = v5;
  *(_QWORD *)&v66 = v11;
  sub_245E18A7C((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_245E28494(&v63, v65);
    sub_245E1A654((uint64_t)v65, (uint64_t)&v63);
    v12 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v63, 0xD000000000000016, 0x8000000245E3EB90, v12);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v63);
  }
  sub_245E18AC4((uint64_t)&v66);
  v13 = sub_245E3C91C();
  *((_QWORD *)&v67 + 1) = MEMORY[0x24BEE1768];
  *(_QWORD *)&v66 = v13;
  sub_245E18A7C((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_245E28494(&v63, v65);
    sub_245E1A654((uint64_t)v65, (uint64_t)&v63);
    v14 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v63, 0x697274656D6F6962, 0xEF65746174537363, v14);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v63);
  }
  sub_245E18AC4((uint64_t)&v66);
  v15 = sub_245E3C988();
  if (v15)
  {
    v16 = v15;
    *((_QWORD *)&v67 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_2575247B0);
    *(_QWORD *)&v66 = v16;
  }
  else
  {
    v66 = 0u;
    v67 = 0u;
  }
  sub_245E18A7C((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_245E28494(&v63, v65);
    sub_245E1A654((uint64_t)v65, (uint64_t)&v63);
    v17 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v63, 0x7365696B6F6F63, 0xE700000000000000, v17);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v63);
  }
  sub_245E18AC4((uint64_t)&v66);
  v18 = sub_245E3C994();
  if (v19)
  {
    *((_QWORD *)&v67 + 1) = v9;
    *(_QWORD *)&v66 = v18;
    *((_QWORD *)&v66 + 1) = v19;
  }
  else
  {
    v66 = 0u;
    v67 = 0u;
  }
  sub_245E18A7C((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_245E28494(&v63, v65);
    sub_245E1A654((uint64_t)v65, (uint64_t)&v63);
    v20 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v63, 0x43746E756F636361, 0xEE00737469646572, v20);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v63);
  }
  sub_245E18AC4((uint64_t)&v66);
  v21 = sub_245E3C8BC();
  if (v22)
  {
    *((_QWORD *)&v67 + 1) = v9;
    *(_QWORD *)&v66 = v21;
    *((_QWORD *)&v66 + 1) = v22;
  }
  else
  {
    v66 = 0u;
    v67 = 0u;
  }
  sub_245E18A7C((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_245E28494(&v63, v65);
    sub_245E1A654((uint64_t)v65, (uint64_t)&v63);
    v23 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v63, 0xD000000000000016, 0x8000000245E3EB70, v23);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v63);
  }
  sub_245E18AC4((uint64_t)&v66);
  v24 = sub_245E3C928();
  v25 = MEMORY[0x24BEE1328];
  *((_QWORD *)&v67 + 1) = MEMORY[0x24BEE1328];
  LOBYTE(v66) = v24 & 1;
  sub_245E18A7C((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_245E28494(&v63, v65);
    sub_245E1A654((uint64_t)v65, (uint64_t)&v63);
    v26 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v63, 0x6565726741646964, 0xEF736D7265546F54, v26);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v63);
  }
  sub_245E18AC4((uint64_t)&v66);
  v27 = sub_245E3C8D4();
  if (v28)
  {
    *((_QWORD *)&v67 + 1) = v9;
    *(_QWORD *)&v66 = v27;
    *((_QWORD *)&v66 + 1) = v28;
  }
  else
  {
    v66 = 0u;
    v67 = 0u;
  }
  sub_245E18A7C((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_245E28494(&v63, v65);
    sub_245E1A654((uint64_t)v65, (uint64_t)&v63);
    v29 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v63, 1684632420, 0xE400000000000000, v29);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v63);
  }
  sub_245E18AC4((uint64_t)&v66);
  v30 = sub_245E3C9AC();
  if (v31)
  {
    *((_QWORD *)&v67 + 1) = v9;
    *(_QWORD *)&v66 = v30;
    *((_QWORD *)&v66 + 1) = v31;
  }
  else
  {
    v66 = 0u;
    v67 = 0u;
  }
  sub_245E18A7C((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_245E28494(&v63, v65);
    sub_245E1A654((uint64_t)v65, (uint64_t)&v63);
    v32 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v63, 0x6D614E7473726966, 0xE900000000000065, v32);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v63);
  }
  sub_245E18AC4((uint64_t)&v66);
  v33 = sub_245E3C964();
  v34 = MEMORY[0x24BEE1E88];
  *((_QWORD *)&v67 + 1) = MEMORY[0x24BEE1E88];
  *(_QWORD *)&v66 = v33;
  sub_245E18A7C((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_245E28494(&v63, v65);
    sub_245E1A654((uint64_t)v65, (uint64_t)&v63);
    v35 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v63, 0xD00000000000001CLL, 0x8000000245E3EB50, v35);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v63);
  }
  sub_245E18AC4((uint64_t)&v66);
  v36 = sub_245E3C8F8();
  *((_QWORD *)&v67 + 1) = v25;
  LOBYTE(v66) = v36 & 1;
  sub_245E18A7C((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_245E28494(&v63, v65);
    sub_245E1A654((uint64_t)v65, (uint64_t)&v63);
    v37 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v63, 0x614664756F6C4369, 0xEC000000796C696DLL, v37);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v63);
  }
  sub_245E18AC4((uint64_t)&v66);
  v38 = sub_245E3C904();
  *((_QWORD *)&v67 + 1) = v25;
  LOBYTE(v66) = v38 & 1;
  sub_245E18A7C((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_245E28494(&v63, v65);
    sub_245E1A654((uint64_t)v65, (uint64_t)&v63);
    v39 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v63, 0x7453646F6F476E69, 0xEE00676E69646E61, v39);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v63);
  }
  sub_245E18AC4((uint64_t)&v66);
  v40 = sub_245E3C8C8();
  *((_QWORD *)&v67 + 1) = v25;
  LOBYTE(v66) = v40 & 1;
  sub_245E18A7C((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_245E28494(&v63, v65);
    sub_245E1A654((uint64_t)v65, (uint64_t)&v63);
    v41 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v63, 0x63416F6D65447369, 0xED0000746E756F63, v41);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v63);
  }
  sub_245E18AC4((uint64_t)&v66);
  v42 = sub_245E3C8E0();
  *((_QWORD *)&v67 + 1) = v25;
  LOBYTE(v66) = v42 & 1;
  sub_245E18A7C((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_245E28494(&v63, v65);
    sub_245E1A654((uint64_t)v65, (uint64_t)&v63);
    v43 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v63, 0xD000000000000010, 0x8000000245E3EB30, v43);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v63);
  }
  sub_245E18AC4((uint64_t)&v66);
  v44 = sub_245E3C910();
  *((_QWORD *)&v67 + 1) = v25;
  LOBYTE(v66) = v44 & 1;
  sub_245E18A7C((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_245E28494(&v63, v65);
    sub_245E1A654((uint64_t)v65, (uint64_t)&v63);
    v45 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v63, 0x79615064696C6176, 0xEC000000746E656DLL, v45);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v63);
  }
  sub_245E18AC4((uint64_t)&v66);
  v46 = sub_245E3C9A0();
  if (v47)
  {
    *((_QWORD *)&v67 + 1) = v9;
    *(_QWORD *)&v66 = v46;
    *((_QWORD *)&v66 + 1) = v47;
  }
  else
  {
    v66 = 0u;
    v67 = 0u;
  }
  sub_245E18A7C((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_245E28494(&v63, v65);
    sub_245E1A654((uint64_t)v65, (uint64_t)&v63);
    v48 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v63, 0x656D614E7473616CLL, 0xE800000000000000, v48);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v63);
  }
  sub_245E18AC4((uint64_t)&v66);
  v49 = sub_245E3C97C();
  *((_QWORD *)&v67 + 1) = v34;
  *(_QWORD *)&v66 = v49;
  sub_245E18A7C((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_245E28494(&v63, v65);
    sub_245E1A654((uint64_t)v65, (uint64_t)&v63);
    v50 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v63, 0xD000000000000020, 0x8000000245E3EAD0, v50);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v63);
  }
  sub_245E18AC4((uint64_t)&v66);
  v51 = sub_245E3C958();
  *((_QWORD *)&v67 + 1) = v25;
  LOBYTE(v66) = v51 & 1;
  sub_245E18A7C((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_245E28494(&v63, v65);
    sub_245E1A654((uint64_t)v65, (uint64_t)&v63);
    v52 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v63, 0xD00000000000001DLL, 0x8000000245E3EAB0, v52);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v63);
  }
  sub_245E18AC4((uint64_t)&v66);
  v53 = sub_245E3C970();
  *((_QWORD *)&v67 + 1) = v34;
  *(_QWORD *)&v66 = v53;
  sub_245E18A7C((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_245E28494(&v63, v65);
    sub_245E1A654((uint64_t)v65, (uint64_t)&v63);
    v54 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v63, 0xD00000000000001CLL, 0x8000000245E3EA90, v54);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v63);
  }
  sub_245E18AC4((uint64_t)&v66);
  v55 = sub_245E3C934();
  *((_QWORD *)&v67 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_2575247A0);
  *(_QWORD *)&v66 = v55;
  sub_245E18A7C((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_245E28494(&v63, v65);
    sub_245E1A654((uint64_t)v65, (uint64_t)&v63);
    v56 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v63, 0xD000000000000016, 0x8000000245E3EA70, v56);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v63);
  }
  sub_245E18AC4((uint64_t)&v66);
  v57 = sub_245E3C94C();
  *((_QWORD *)&v67 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_2575247A8);
  *(_QWORD *)&v66 = v57;
  sub_245E18A7C((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_245E28494(&v63, v65);
    sub_245E1A654((uint64_t)v65, (uint64_t)&v63);
    v58 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v63, 0xD00000000000001BLL, 0x8000000245E3EA50, v58);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v63);
  }
  sub_245E18AC4((uint64_t)&v66);
  v59 = sub_245E3C8EC();
  if (v60)
  {
    *((_QWORD *)&v67 + 1) = v9;
    *(_QWORD *)&v66 = v59;
    *((_QWORD *)&v66 + 1) = v60;
  }
  else
  {
    v66 = 0u;
    v67 = 0u;
  }
  sub_245E18A7C((uint64_t)&v66, (uint64_t)&v63);
  if (v64)
  {
    sub_245E28494(&v63, v65);
    sub_245E1A654((uint64_t)v65, (uint64_t)&v63);
    v61 = swift_isUniquelyReferenced_nonNull_native();
    sub_245E27C14(&v63, 0x6F726665726F7473, 0xEC0000004449746ELL, v61);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v65);
  }
  else
  {
    sub_245E18AC4((uint64_t)&v63);
  }
  sub_245E18AC4((uint64_t)&v66);
  return v0;
}

void *sub_245E35EFC()
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
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575245F0);
  v2 = *v0;
  v3 = sub_245E3CFDC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
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
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_245E360A8()
{
  return sub_245E36298(&qword_257524610);
}

void *sub_245E360B4()
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
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  _OWORD v26[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257524600);
  v2 = *v0;
  v3 = sub_245E3CFDC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v4;
    return result;
  }
  v25 = v1;
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
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 32 * v15;
    sub_245E1A654(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_245E28494(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_245E36298(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_245E3CFDC();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v2 = v5;
    return result;
  }
  result = (void *)(v4 + 64);
  v7 = v3 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v24 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v24 >= v14)
      goto LABEL_26;
    v25 = *(_QWORD *)(v7 + 8 * v24);
    ++v10;
    if (!v25)
    {
      v10 = v24 + 1;
      if (v24 + 1 >= v14)
        goto LABEL_26;
      v25 = *(_QWORD *)(v7 + 8 * v10);
      if (!v25)
        break;
    }
LABEL_25:
    v13 = (v25 - 1) & v25;
    v16 = __clz(__rbit64(v25)) + (v10 << 6);
LABEL_12:
    v17 = 16 * v16;
    v18 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v16);
    v20 = *v18;
    v19 = v18[1];
    v21 = 8 * v16;
    v22 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + v21);
    v23 = (_QWORD *)(*(_QWORD *)(v5 + 48) + v17);
    *v23 = v20;
    v23[1] = v19;
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v21) = v22;
    result = (void *)swift_bridgeObjectRetain();
  }
  v26 = v24 + 2;
  if (v26 >= v14)
    goto LABEL_26;
  v25 = *(_QWORD *)(v7 + 8 * v26);
  if (v25)
  {
    v10 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v25 = *(_QWORD *)(v7 + 8 * v10);
    ++v26;
    if (v25)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_245E3643C()
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
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575245D8);
  v2 = *v0;
  v3 = sub_245E3CFDC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = *v16;
    v17 = v16[1];
    LOBYTE(v16) = *(_BYTE *)(*(_QWORD *)(v2 + 56) + v15);
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v15);
    *v19 = v18;
    v19[1] = v17;
    *(_BYTE *)(*(_QWORD *)(v4 + 56) + v15) = (_BYTE)v16;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

unint64_t sub_245E365E4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257523F80;
  if (!qword_257523F80)
  {
    type metadata accessor for HTTPCookiePropertyKey();
    result = MEMORY[0x24954A9D0](&unk_245E3D924, v1);
    atomic_store(result, (unint64_t *)&qword_257523F80);
  }
  return result;
}

uint64_t sub_245E3662C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_245E3CDD8();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_245E3CDCC();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_245E3A918(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_245E3CD84();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t AccountProviding.fetchCurrentAccount(accountType:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v6 = *(_QWORD *)(a2 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_BYTE *)MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v3, a2);
  v9 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a2;
  *(_QWORD *)(v10 + 24) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v10 + v9, (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a2);
  *(_BYTE *)(v10 + v9 + v7) = v8;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/SeymourClientServices/Account/Provider/AccountProvider.swift";
  *(_QWORD *)(v11 + 24) = 106;
  *(_BYTE *)(v11 + 32) = 2;
  *(_QWORD *)(v11 + 40) = 37;
  *(_QWORD *)(v11 + 48) = &unk_2575247C0;
  *(_QWORD *)(v11 + 56) = v10;
  sub_245E25F00();
  return sub_245E3C9C4();
}

uint64_t AccountProviding.fetchMatchingAccount(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[2];

  v5 = v4;
  v21[0] = a3;
  v21[1] = a4;
  v8 = sub_245E3C628();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v12 = *(_QWORD *)(a2 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v5, a2);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  v15 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v16 = (v13 + *(unsigned __int8 *)(v9 + 80) + v15) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v17 = swift_allocObject();
  v18 = v21[0];
  *(_QWORD *)(v17 + 16) = a2;
  *(_QWORD *)(v17 + 24) = v18;
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v17 + v15, v14, a2);
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v17 + v16, (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/SeymourClientServices/Account/Provider/AccountProvider.swift";
  *(_QWORD *)(v19 + 24) = 106;
  *(_BYTE *)(v19 + 32) = 2;
  *(_QWORD *)(v19 + 40) = 41;
  *(_QWORD *)(v19 + 48) = &unk_2575247D0;
  *(_QWORD *)(v19 + 56) = v17;
  sub_245E25F00();
  return sub_245E3C9C4();
}

uint64_t AccountProviding.fetchPrimaryAccount()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v5 = *(_QWORD *)(a1 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v2, a1);
  v7 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/SeymourClientServices/Account/Provider/AccountProvider.swift";
  *(_QWORD *)(v9 + 24) = 106;
  *(_BYTE *)(v9 + 32) = 2;
  *(_QWORD *)(v9 + 40) = 45;
  *(_QWORD *)(v9 + 48) = &unk_2575247E0;
  *(_QWORD *)(v9 + 56) = v8;
  sub_245E25F00();
  return sub_245E3C9C4();
}

uint64_t sub_245E36B78(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_245E3C330;
  return AccountProviding.fetchCurrentAccountFirstName()(a1, a2);
}

uint64_t sub_245E36BD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v1 + 112) = v0;
  v2 = sub_245E3CBC8();
  *(_QWORD *)(v1 + 120) = v2;
  *(_QWORD *)(v1 + 128) = *(_QWORD *)(v2 - 8);
  *(_QWORD *)(v1 + 136) = swift_task_alloc();
  *(_QWORD *)(v1 + 144) = swift_task_alloc();
  *(_BYTE *)(v1 + 201) = 1;
  v3 = swift_task_alloc();
  *(_QWORD *)(v1 + 152) = v3;
  *(_QWORD *)v3 = v1;
  *(_QWORD *)(v3 + 8) = sub_245E36C7C;
  *(_QWORD *)(v3 + 64) = v0;
  *(_BYTE *)(v3 + 144) = *(_BYTE *)(v1 + 201);
  return swift_task_switch();
}

uint64_t sub_245E36C7C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 160) = a1;
  *(_QWORD *)(v3 + 168) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

id sub_245E36CE8()
{
  uint64_t v0;
  id v1;
  void *v2;
  char v3;
  uint64_t v4;
  id result;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = objc_msgSend(*(id *)(v0 + 160), sel_aa_firstName);
  if (v1)
  {
    v2 = v1;
    sub_245E3CC64();

  }
  v3 = sub_245E3CE68();
  swift_bridgeObjectRelease();
  if ((v3 & 1) != 0)
  {

    *(_BYTE *)(v0 + 200) = 0;
    v4 = swift_task_alloc();
    *(_QWORD *)(v0 + 176) = v4;
    *(_QWORD *)v4 = v0;
    *(_QWORD *)(v4 + 8) = sub_245E37058;
    *(_QWORD *)(v4 + 64) = *(_QWORD *)(v0 + 112);
    *(_BYTE *)(v4 + 144) = *(_BYTE *)(v0 + 200);
    return (id)swift_task_switch();
  }
  else
  {
    result = objc_msgSend(*(id *)(v0 + 160), sel_aa_firstName);
    if (result)
    {
      v6 = result;
      v7 = *(void **)(v0 + 160);
      v8 = sub_245E3CC64();
      v10 = v9;

      swift_task_dealloc();
      swift_task_dealloc();
      return (id)(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v8, v10);
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_245E36E24()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v1 = *(void **)(v0 + 168);
  sub_245E3CB08();
  v2 = v1;
  v3 = v1;
  v4 = sub_245E3CBBC();
  v5 = sub_245E3CE08();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 168);
    v17 = *(_QWORD *)(v0 + 128);
    v18 = *(_QWORD *)(v0 + 120);
    v19 = *(_QWORD *)(v0 + 144);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v20 = v8;
    *(_DWORD *)v7 = 136315138;
    swift_getErrorValue();
    v9 = MEMORY[0x24954A55C](*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
    *(_QWORD *)(v0 + 88) = sub_245E19CDC(v9, v10, &v20);
    sub_245E3CE80();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_245E10000, v4, v5, "Failed fetching Apple Account while fetching first name: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954AA78](v8, -1, -1);
    MEMORY[0x24954AA78](v7, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v19, v18);
  }
  else
  {
    v11 = *(void **)(v0 + 168);
    v12 = *(_QWORD *)(v0 + 144);
    v13 = *(_QWORD *)(v0 + 120);
    v14 = *(_QWORD *)(v0 + 128);

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
  }
  *(_BYTE *)(v0 + 200) = 0;
  v15 = swift_task_alloc();
  *(_QWORD *)(v0 + 176) = v15;
  *(_QWORD *)v15 = v0;
  *(_QWORD *)(v15 + 8) = sub_245E37058;
  *(_QWORD *)(v15 + 64) = *(_QWORD *)(v0 + 112);
  *(_BYTE *)(v15 + 144) = *(_BYTE *)(v0 + 200);
  return swift_task_switch();
}

uint64_t sub_245E37058(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 184) = a1;
  *(_QWORD *)(v3 + 192) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245E370C4()
{
  uint64_t v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;

  v1 = objc_msgSend(*(id *)(v0 + 184), sel_ams_firstName);
  if (!v1)
  {

    goto LABEL_5;
  }
  v2 = v1;
  v3 = *(void **)(v0 + 184);
  v4 = sub_245E3CC64();
  v6 = v5;

  *(_QWORD *)(v0 + 64) = v4;
  *(_QWORD *)(v0 + 72) = v6;
  sub_245E18EC8();
  swift_bridgeObjectRetain();
  LOBYTE(v2) = sub_245E3CEBC();

  swift_bridgeObjectRelease();
  if ((v2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    sub_245E166C8();
    swift_allocError();
    *v7 = 4;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v4, v6);
}

uint64_t sub_245E37200()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v1 = *(void **)(v0 + 192);
  sub_245E3CB08();
  v2 = v1;
  v3 = v1;
  v4 = sub_245E3CBBC();
  v5 = sub_245E3CE08();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 192);
    v17 = *(_QWORD *)(v0 + 128);
    v18 = *(_QWORD *)(v0 + 120);
    v19 = *(_QWORD *)(v0 + 136);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v20 = v8;
    *(_DWORD *)v7 = 136315138;
    swift_getErrorValue();
    v9 = MEMORY[0x24954A55C](*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56));
    *(_QWORD *)(v0 + 104) = sub_245E19CDC(v9, v10, &v20);
    sub_245E3CE80();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_245E10000, v4, v5, "Failed fetching iTunes Account while fetching first name: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954AA78](v8, -1, -1);
    MEMORY[0x24954AA78](v7, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v19, v18);
  }
  else
  {
    v11 = *(void **)(v0 + 192);
    v13 = *(_QWORD *)(v0 + 128);
    v12 = *(_QWORD *)(v0 + 136);
    v14 = *(_QWORD *)(v0 + 120);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  sub_245E166C8();
  swift_allocError();
  *v15 = 4;
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t AccountProviding.fetchCurrentAccountFirstName()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)(v3 + 120) = a2;
  *(_QWORD *)(v3 + 128) = v2;
  *(_QWORD *)(v3 + 112) = a1;
  v6 = sub_245E3CBC8();
  *(_QWORD *)(v3 + 136) = v6;
  *(_QWORD *)(v3 + 144) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v3 + 152) = swift_task_alloc();
  v7 = swift_task_alloc();
  *(_BYTE *)(v3 + 225) = 1;
  *(_QWORD *)(v3 + 160) = v7;
  v8 = *(int **)(a2 + 8);
  *(_QWORD *)(v3 + 168) = v8;
  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)v8 + *v8);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 176) = v9;
  *v9 = v3;
  v9[1] = sub_245E37500;
  return v11(v3 + 225, a1, a2);
}

{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v5 = *(_QWORD *)(a1 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v2, a1);
  v7 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/SeymourClientServices/Account/Provider/AccountProvider.swift";
  *(_QWORD *)(v9 + 24) = 106;
  *(_BYTE *)(v9 + 32) = 2;
  *(_QWORD *)(v9 + 40) = 49;
  *(_QWORD *)(v9 + 48) = &unk_257524800;
  *(_QWORD *)(v9 + 56) = v8;
  return sub_245E3C9C4();
}

uint64_t sub_245E37500(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 184) = a1;
  *(_QWORD *)(v3 + 192) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

id sub_245E3756C()
{
  uint64_t v0;
  id v1;
  void *v2;
  char v3;
  int *v4;
  _QWORD *v5;
  id result;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;

  v1 = objc_msgSend(*(id *)(v0 + 184), sel_aa_firstName);
  if (v1)
  {
    v2 = v1;
    sub_245E3CC64();

  }
  v3 = sub_245E3CE68();
  swift_bridgeObjectRelease();
  if ((v3 & 1) != 0)
  {

    v4 = *(int **)(v0 + 168);
    *(_BYTE *)(v0 + 224) = 0;
    v12 = (int *)((char *)v4 + *v4);
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 200) = v5;
    *v5 = v0;
    v5[1] = sub_245E376B0;
    return (id)((uint64_t (*)(uint64_t, _QWORD, _QWORD))v12)(v0 + 224, *(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 120));
  }
  else
  {
    result = objc_msgSend(*(id *)(v0 + 184), sel_aa_firstName);
    if (result)
    {
      v7 = result;
      v8 = *(void **)(v0 + 184);
      v9 = sub_245E3CC64();
      v11 = v10;

      swift_task_dealloc();
      swift_task_dealloc();
      return (id)(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v9, v11);
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_245E376B0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 208) = a1;
  *(_QWORD *)(v3 + 216) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245E3771C()
{
  uint64_t v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;

  v1 = objc_msgSend(*(id *)(v0 + 208), sel_ams_firstName);
  if (!v1)
  {

    goto LABEL_5;
  }
  v2 = v1;
  v3 = *(void **)(v0 + 208);
  v4 = sub_245E3CC64();
  v6 = v5;

  *(_QWORD *)(v0 + 64) = v4;
  *(_QWORD *)(v0 + 72) = v6;
  sub_245E18EC8();
  swift_bridgeObjectRetain();
  LOBYTE(v2) = sub_245E3CEBC();

  swift_bridgeObjectRelease();
  if ((v2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    sub_245E166C8();
    swift_allocError();
    *v7 = 4;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v4, v6);
}

uint64_t sub_245E37858()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  _QWORD *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int *v21;
  uint64_t v22;

  v1 = *(void **)(v0 + 192);
  sub_245E3CB08();
  v2 = v1;
  v3 = v1;
  v4 = sub_245E3CBBC();
  v5 = sub_245E3CE08();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 192);
    v18 = *(_QWORD *)(v0 + 144);
    v19 = *(_QWORD *)(v0 + 136);
    v20 = *(_QWORD *)(v0 + 160);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v22 = v8;
    *(_DWORD *)v7 = 136315138;
    swift_getErrorValue();
    v9 = MEMORY[0x24954A55C](*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
    *(_QWORD *)(v0 + 88) = sub_245E19CDC(v9, v10, &v22);
    sub_245E3CE80();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_245E10000, v4, v5, "Failed fetching Apple Account while fetching first name: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954AA78](v8, -1, -1);
    MEMORY[0x24954AA78](v7, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v20, v19);
  }
  else
  {
    v11 = *(void **)(v0 + 192);
    v12 = *(_QWORD *)(v0 + 160);
    v13 = *(_QWORD *)(v0 + 136);
    v14 = *(_QWORD *)(v0 + 144);

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
  }
  v15 = *(int **)(v0 + 168);
  *(_BYTE *)(v0 + 224) = 0;
  v21 = (int *)((char *)v15 + *v15);
  v16 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 200) = v16;
  *v16 = v0;
  v16[1] = sub_245E376B0;
  return ((uint64_t (*)(uint64_t, _QWORD, _QWORD))v21)(v0 + 224, *(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 120));
}

uint64_t sub_245E37A8C()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v1 = *(void **)(v0 + 216);
  sub_245E3CB08();
  v2 = v1;
  v3 = v1;
  v4 = sub_245E3CBBC();
  v5 = sub_245E3CE08();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 216);
    v17 = *(_QWORD *)(v0 + 144);
    v18 = *(_QWORD *)(v0 + 136);
    v19 = *(_QWORD *)(v0 + 152);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v20 = v8;
    *(_DWORD *)v7 = 136315138;
    swift_getErrorValue();
    v9 = MEMORY[0x24954A55C](*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56));
    *(_QWORD *)(v0 + 104) = sub_245E19CDC(v9, v10, &v20);
    sub_245E3CE80();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_245E10000, v4, v5, "Failed fetching iTunes Account while fetching first name: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954AA78](v8, -1, -1);
    MEMORY[0x24954AA78](v7, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v19, v18);
  }
  else
  {
    v11 = *(void **)(v0 + 216);
    v13 = *(_QWORD *)(v0 + 144);
    v12 = *(_QWORD *)(v0 + 152);
    v14 = *(_QWORD *)(v0 + 136);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  sub_245E166C8();
  swift_allocError();
  *v15 = 4;
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t AccountProviding.fetchCurrentAccount()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t);

  *(_BYTE *)(v2 + 32) = 0;
  v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a2 + 8) + *(_QWORD *)(a2 + 8));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_245E37D44;
  return v7(v2 + 32, a1, a2);
}

{
  char v3;

  v3 = 0;
  return (*(uint64_t (**)(char *, uint64_t))(a2 + 32))(&v3, a1);
}

uint64_t sub_245E37D44(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(v4 + 24) = v1;
  swift_task_dealloc();
  if (v1)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_245E37DB8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245E37DF4(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)(v5 + 16) = a1;
  *(_BYTE *)(v5 + 48) = a3 & 1;
  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a5 + 8) + *(_QWORD *)(a5 + 8));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 24) = v8;
  *v8 = v5;
  v8[1] = sub_245E37E7C;
  return v10(v5 + 48, a4, a5);
}

uint64_t sub_245E37E7C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 32) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 40) = a1;
  return swift_task_switch();
}

uint64_t sub_245E37EF0()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t sub_245E37F4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t);

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_BYTE *)(v1
                + ((*(unsigned __int8 *)(*(_QWORD *)(v4 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v4 - 8) + 80))
                + *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  v7 = swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *(_QWORD *)v7 = v2;
  *(_QWORD *)(v7 + 8) = sub_245E3C300;
  *(_QWORD *)(v7 + 16) = a1;
  *(_BYTE *)(v7 + 48) = v6;
  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(v5 + 8) + *(_QWORD *)(v5 + 8));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 24) = v8;
  *v8 = v7;
  v8[1] = sub_245E37E7C;
  return v10(v7 + 48, v4, v5);
}

uint64_t sub_245E38018(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)(v5 + 16) = a1;
  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a5 + 16) + *(_QWORD *)(a5 + 16));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 24) = v9;
  *v9 = v5;
  v9[1] = sub_245E3809C;
  return v11(a3, a4, a5);
}

uint64_t sub_245E3809C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = *v2;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v5 + 8))();
  *(_QWORD *)(v4 + 32) = a1;
  return swift_task_switch();
}

uint64_t sub_245E38118(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t);

  *(_QWORD *)(v4 + 16) = a1;
  v9 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a4 + 24) + *(_QWORD *)(a4 + 24));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 24) = v7;
  *v7 = v4;
  v7[1] = sub_245E3818C;
  return v9(a3, a4);
}

uint64_t sub_245E3818C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = *v2;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v5 + 8))();
  *(_QWORD *)(v4 + 32) = a1;
  return swift_task_switch();
}

uint64_t sub_245E38208()
{
  uint64_t v0;

  **(_QWORD **)(v0 + 16) = *(_QWORD *)(v0 + 32);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245E38338(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t);

  *(_QWORD *)(v4 + 16) = a1;
  v9 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a4 + 56) + *(_QWORD *)(a4 + 56));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 24) = v7;
  *v7 = v4;
  v7[1] = sub_245E383AC;
  return v9(a3, a4);
}

uint64_t sub_245E383AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;

  v6 = *v3;
  v7 = *v3;
  swift_task_dealloc();
  if (v2)
    return (*(uint64_t (**)(void))(v7 + 8))();
  *(_QWORD *)(v6 + 32) = a2;
  *(_QWORD *)(v6 + 40) = a1;
  return swift_task_switch();
}

uint64_t sub_245E3842C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD **)(v0 + 16);
  *v2 = *(_QWORD *)(v0 + 40);
  v2[1] = v1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

_QWORD *AccountProvider.__allocating_init(eventHub:accountStore:)(uint64_t a1, uint64_t a2, __int128 *a3)
{
  _QWORD *v6;

  v6 = (_QWORD *)swift_allocObject();
  swift_defaultActor_initialize();
  v6[21] = 0;
  sub_245E3233C(a3, (uint64_t)(v6 + 14));
  v6[19] = a1;
  v6[20] = a2;
  return v6;
}

_QWORD *AccountProvider.init(eventHub:accountStore:)(uint64_t a1, uint64_t a2, __int128 *a3)
{
  _QWORD *v3;

  swift_defaultActor_initialize();
  v3[21] = 0;
  sub_245E3233C(a3, (uint64_t)(v3 + 14));
  v3[19] = a1;
  v3[20] = a2;
  return v3;
}

uint64_t AccountProvider.deinit()
{
  uint64_t v0;
  id v1;
  id v2;

  v1 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  v2 = objc_msgSend((id)objc_opt_self(), sel_SMUACDAccountStoreDidChangeNotification);
  objc_msgSend(v1, sel_removeObserver_name_object_, v0, v2, 0);

  __swift_destroy_boxed_opaque_existential_1(v0 + 112);
  swift_unknownObjectRelease();

  swift_defaultActor_destroy();
  return v0;
}

uint64_t AccountProvider.__deallocating_deinit()
{
  AccountProvider.deinit();
  return swift_defaultActor_deallocate();
}

void sub_245E385B4()
{
  uint64_t v0;
  id v1;
  id v2;

  v1 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  v2 = objc_msgSend((id)objc_opt_self(), sel_SMUACDAccountStoreDidChangeNotification);
  objc_msgSend(v1, sel_addObserver_selector_name_object_, v0, sel_onAccountChanged, v2, 0);

}

uint64_t sub_245E38654()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[4];

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441B5F0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_245E3CDD8();
  v6 = *(_QWORD *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v1;
  v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  swift_retain();
  if (v8 == 1)
  {
    sub_245E3A918((uint64_t)v4);
    v9 = 0;
    v10 = 0;
  }
  else
  {
    sub_245E3CDCC();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v9 = sub_245E3CD84();
      v10 = v11;
      swift_unknownObjectRelease();
    }
    else
    {
      v9 = 0;
      v10 = 0;
    }
  }
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = &unk_257524878;
  *(_QWORD *)(v12 + 24) = v7;
  if (v10 | v9)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v9;
    v14[3] = v10;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_245E38820(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[2] = a4;
  v5 = sub_245E3CBC8();
  v4[3] = v5;
  v4[4] = *(_QWORD *)(v5 - 8);
  v4[5] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_245E38880()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = v0[4];
  v1 = v0[5];
  v3 = v0[3];
  sub_245E3CB08();
  sub_245E3CBB0();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = v4;
  *v4 = v0;
  v4[1] = sub_245E38928;
  return sub_245E38A28();
}

uint64_t sub_245E38928(void *a1)
{
  void *v1;

  swift_task_dealloc();
  if (v1)

  else
  return swift_task_switch();
}

uint64_t sub_245E38998()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = v0[2];
  v0[7] = *(_QWORD *)(v1 + 152);
  v0[8] = *(_QWORD *)(v1 + 160);
  return swift_task_switch();
}

uint64_t sub_245E389C0()
{
  uint64_t v0;

  swift_getObjectType();
  sub_245E3A9C8();
  sub_245E3CA24();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245E38A28()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[10] = v0;
  v2 = sub_245E3CBC8();
  v1[11] = v2;
  v1[12] = *(_QWORD *)(v2 - 8);
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_245E38A98()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t, uint64_t);

  v1 = *(_QWORD **)(v0 + 80);
  v2 = v1[17];
  v3 = v1[18];
  __swift_project_boxed_opaque_existential_1(v1 + 14, v2);
  v6 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v3 + 24) + *(_QWORD *)(v3 + 24));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v4;
  *v4 = v0;
  v4[1] = sub_245E38B14;
  return v6(v2, v3);
}

uint64_t sub_245E38B14(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 128) = a1;
  *(_QWORD *)(v3 + 136) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245E38B80()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  void *v9;
  uint8_t *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(void **)(v0 + 128);
  v3 = *(void **)(v1 + 168);
  *(_QWORD *)(v1 + 168) = v2;
  v4 = v2;

  sub_245E3CB08();
  v5 = v4;
  v6 = sub_245E3CBBC();
  v7 = sub_245E3CE14();
  v8 = os_log_type_enabled(v6, v7);
  v9 = *(void **)(v0 + 128);
  if (v8)
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v27 = swift_slowAlloc();
    v28 = v27;
    *(_DWORD *)v10 = 136315138;
    v11 = objc_msgSend(v9, sel_accountDescription);
    if (v11)
    {
      v12 = v11;
      v13 = sub_245E3CC64();
      v15 = v14;

    }
    else
    {
      v13 = 0;
      v15 = 0;
    }
    v19 = *(void **)(v0 + 128);
    v24 = *(_QWORD *)(v0 + 96);
    v25 = *(_QWORD *)(v0 + 88);
    v26 = *(_QWORD *)(v0 + 112);
    *(_QWORD *)(v0 + 40) = v13;
    *(_QWORD *)(v0 + 48) = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25441B618);
    v20 = sub_245E3CE5C();
    v22 = v21;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 72) = sub_245E19CDC(v20, v22, &v28);
    sub_245E3CE80();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_245E10000, v6, v7, "Successfully fetched Primary Account: %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954AA78](v27, -1, -1);
    MEMORY[0x24954AA78](v10, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v26, v25);
  }
  else
  {
    v16 = *(_QWORD *)(v0 + 112);
    v17 = *(_QWORD *)(v0 + 88);
    v18 = *(_QWORD *)(v0 + 96);

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 128));
}

uint64_t sub_245E38DBC()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v1 = *(void **)(v0 + 136);
  sub_245E3CB08();
  v2 = v1;
  v3 = v1;
  v4 = sub_245E3CBBC();
  v5 = sub_245E3CE14();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 136);
    v16 = *(_QWORD *)(v0 + 96);
    v17 = *(_QWORD *)(v0 + 88);
    v18 = *(_QWORD *)(v0 + 104);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v19 = v8;
    *(_DWORD *)v7 = 136315138;
    swift_getErrorValue();
    v9 = MEMORY[0x24954A55C](*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
    *(_QWORD *)(v0 + 64) = sub_245E19CDC(v9, v10, &v19);
    sub_245E3CE80();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_245E10000, v4, v5, "Failed to fetch Primary Account: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954AA78](v8, -1, -1);
    MEMORY[0x24954AA78](v7, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v18, v17);
  }
  else
  {
    v11 = *(void **)(v0 + 136);
    v13 = *(_QWORD *)(v0 + 96);
    v12 = *(_QWORD *)(v0 + 104);
    v14 = *(_QWORD *)(v0 + 88);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t AccountProvider.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_245E38FF4()
{
  uint64_t v0;

  return v0;
}

uint64_t AccountProvider.fetchCurrentAccount(accountType:)(_BYTE *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 64) = v1;
  *(_BYTE *)(v2 + 144) = *a1;
  return swift_task_switch();
}

uint64_t sub_245E39020()
{
  uint64_t v0;
  char v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t (*v14)(uint64_t);
  id v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _BYTE *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t (*v26)(uint64_t);
  _QWORD *v27;
  uint64_t (*v28)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t (*v29)(uint64_t, uint64_t);

  v1 = *(_BYTE *)(v0 + 144);
  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v3 = objc_msgSend(v2, sel_selectedUserProfile);
  *(_QWORD *)(v0 + 72) = v3;

  if ((v1 & 1) != 0)
  {
    if (v3)
    {
      v4 = objc_msgSend((id)swift_unknownObjectRetain(), sel_iCloudAltDSID);
      if (v4)
      {
        v5 = v4;
        v6 = *(_QWORD **)(v0 + 64);
        v7 = sub_245E3CC64();
        v9 = v8;

        *(_QWORD *)(v0 + 112) = v9;
        v10 = v6 + 14;
        v11 = v6[17];
        v12 = v6[18];
        __swift_project_boxed_opaque_existential_1(v10, v11);
        v28 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(v12 + 32) + *(_QWORD *)(v12 + 32));
        v13 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 120) = v13;
        v14 = sub_245E393C0;
LABEL_8:
        *v13 = v0;
        v13[1] = v14;
        return v28(v7, v9, v11, v12);
      }
LABEL_9:
      sub_245E166C8();
      swift_allocError();
      *v21 = 1;
      swift_willThrow();
      swift_unknownObjectRelease_n();
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
    v22 = *(_QWORD **)(v0 + 64);
    v23 = v22[17];
    v24 = v22[18];
    __swift_project_boxed_opaque_existential_1(v22 + 14, v23);
    v29 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v24 + 24) + *(_QWORD *)(v24 + 24));
    v25 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 136) = v25;
    v26 = sub_245E39478;
  }
  else
  {
    if (v3)
    {
      v15 = objc_msgSend((id)swift_unknownObjectRetain(), sel_iTunesAltDSID);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD **)(v0 + 64);
        v7 = sub_245E3CC64();
        v9 = v18;

        *(_QWORD *)(v0 + 80) = v9;
        v19 = v17 + 14;
        v11 = v17[17];
        v12 = v17[18];
        __swift_project_boxed_opaque_existential_1(v19, v11);
        v28 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(v12 + 8) + *(_QWORD *)(v12 + 8));
        v13 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 88) = v13;
        v14 = sub_245E392B8;
        goto LABEL_8;
      }
      goto LABEL_9;
    }
    v27 = *(_QWORD **)(v0 + 64);
    v23 = v27[17];
    v24 = v27[18];
    __swift_project_boxed_opaque_existential_1(v27 + 14, v23);
    v29 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v24 + 16) + *(_QWORD *)(v24 + 16));
    v25 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v25;
    v26 = sub_245E3936C;
  }
  *v25 = v0;
  v25[1] = v26;
  return v29(v23, v24);
}

uint64_t sub_245E392B8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[2] = v2;
  v3[3] = a1;
  v3[4] = v1;
  v3[12] = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245E39324()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease_n();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_245E3936C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t sub_245E393C0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[5] = v2;
  v3[6] = a1;
  v3[7] = v1;
  v3[16] = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245E3942C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease_n();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_245E39478(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t sub_245E394CC()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease_n();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245E3950C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease_n();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t AccountProvider.fetchMatchingAccount(_:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = v1;
  v3 = sub_245E3C628();
  v2[4] = v3;
  v2[5] = *(_QWORD *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_245E395B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  char v12[9];

  v2 = *(_QWORD *)(v0 + 40);
  v1 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 16);
  sub_245E25F00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  ACAccount.init(_:)(v1);
  v6 = v5;
  *(_QWORD *)(v0 + 56) = v5;
  ACAccount.type.getter(v12);
  v7 = v12[0];
  *(_BYTE *)(v0 + 89) = v12[0];
  if (v7 == 2)
  {
    v8 = sub_245E3C550();
    sub_245E2844C();
    swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v8 - 8) + 104))(v9, *MEMORY[0x24BE8AF68], v8);
    swift_willThrow();

    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    *(_BYTE *)(v0 + 88) = v7 & 1;
    v11 = swift_task_alloc();
    *(_QWORD *)(v0 + 64) = v11;
    *(_QWORD *)v11 = v0;
    *(_QWORD *)(v11 + 8) = sub_245E39700;
    *(_QWORD *)(v11 + 64) = *(_QWORD *)(v0 + 24);
    *(_BYTE *)(v11 + 144) = *(_BYTE *)(v0 + 88);
    return swift_task_switch();
  }
}

uint64_t sub_245E39700(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 72) = a1;
  *(_QWORD *)(v3 + 80) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245E39770()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _BYTE *v18;
  char v20;

  v1 = *(void **)(v0 + 72);
  if ((*(_BYTE *)(v0 + 89) & 1) == 0)
  {
    v2 = objc_msgSend(v1, sel_ams_altDSID);
    if (v2)
    {
      v3 = v2;
      v4 = sub_245E3CC64();
      v6 = v5;

    }
    else
    {
      v4 = 0;
      v6 = 0;
    }
    v10 = objc_msgSend(*(id *)(v0 + 56), sel_ams_altDSID);
    if (v10)
      goto LABEL_8;
LABEL_17:
    if (!v6)
    {
LABEL_21:
      v15 = *(void **)(v0 + 56);
      goto LABEL_22;
    }
    goto LABEL_18;
  }
  v7 = objc_msgSend(v1, sel_aa_altDSID);
  if (v7)
  {
    v8 = v7;
    v4 = sub_245E3CC64();
    v6 = v9;

  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v10 = objc_msgSend(*(id *)(v0 + 56), sel_aa_altDSID);
  if (!v10)
    goto LABEL_17;
LABEL_8:
  v11 = v10;
  v12 = sub_245E3CC64();
  v14 = v13;

  if (!v6)
  {
    if (!v14)
      goto LABEL_21;
    goto LABEL_18;
  }
  if (!v14)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  if (v4 != v12 || v6 != v14)
  {
    v20 = sub_245E3D06C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v20 & 1) != 0)
      goto LABEL_21;
LABEL_19:
    v16 = *(void **)(v0 + 72);
    v17 = *(void **)(v0 + 56);
    sub_245E166C8();
    swift_allocError();
    *v18 = 1;
    swift_willThrow();

    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v15 = *(void **)(v0 + 56);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_22:

  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 72));
}

uint64_t sub_245E3995C()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t AccountProvider.fetchPrimaryAccount()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_245E399B0()
{
  uint64_t v0;
  void *v1;
  _QWORD *v3;

  v1 = *(void **)(*(_QWORD *)(v0 + 16) + 168);
  if (v1)
    return (*(uint64_t (**)(void *))(v0 + 8))(v1);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v3;
  *v3 = v0;
  v3[1] = sub_245E39A28;
  return sub_245E38A28();
}

uint64_t sub_245E39A28(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t sub_245E39A7C(_BYTE *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v1;
  v5 = swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *(_QWORD *)v5 = v2;
  *(_QWORD *)(v5 + 8) = sub_245E175B4;
  *(_QWORD *)(v5 + 64) = v4;
  *(_BYTE *)(v5 + 144) = *a1;
  return swift_task_switch();
}

uint64_t sub_245E39AE8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_245E25F80;
  return AccountProvider.fetchMatchingAccount(_:)(a1);
}

uint64_t sub_245E39B38()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = *v0;
  return swift_task_switch();
}

uint64_t sub_245E39B50(char *a1)
{
  uint64_t *v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *a1;
  v3 = *v1;
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  *(_BYTE *)(v4 + 24) = v2;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/SeymourClientServices/Account/Provider/AccountProvider.swift";
  *(_QWORD *)(v5 + 24) = 106;
  *(_BYTE *)(v5 + 32) = 2;
  *(_QWORD *)(v5 + 40) = 37;
  *(_QWORD *)(v5 + 48) = &unk_2575248C8;
  *(_QWORD *)(v5 + 56) = v4;
  sub_245E25F00();
  swift_retain();
  return sub_245E3C9C4();
}

uint64_t sub_245E39C08(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v3 = sub_245E3C628();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v6 = *v1;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  v7 = (*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v6;
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v8 + v7, (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/SeymourClientServices/Account/Provider/AccountProvider.swift";
  *(_QWORD *)(v9 + 24) = 106;
  *(_BYTE *)(v9 + 32) = 2;
  *(_QWORD *)(v9 + 40) = 41;
  *(_QWORD *)(v9 + 48) = &unk_2575248B8;
  *(_QWORD *)(v9 + 56) = v8;
  sub_245E25F00();
  swift_retain();
  return sub_245E3C9C4();
}

uint64_t sub_245E39D40()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = "/Library/Caches/com.apple.xbs/Sources/FitCore/SeymourClientServices/Account/Provider/AccountProvider.swift";
  *(_QWORD *)(v2 + 24) = 106;
  *(_BYTE *)(v2 + 32) = 2;
  *(_QWORD *)(v2 + 40) = 45;
  *(_QWORD *)(v2 + 48) = &unk_2575248A8;
  *(_QWORD *)(v2 + 56) = v1;
  sub_245E25F00();
  swift_retain();
  return sub_245E3C9C4();
}

uint64_t sub_245E39DD4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (__cdecl *v3)();

  v3 = (uint64_t (__cdecl *)())((char *)&dword_257524898 + dword_257524898);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_245E39E30;
  return v3();
}

uint64_t sub_245E39E30(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *v3;
  v7 = swift_task_dealloc();
  if (!v2)
  {
    v7 = a1;
    v8 = a2;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
}

uint64_t sub_245E39E94(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_245E39EF8;
  return v6(a1);
}

uint64_t sub_245E39EF8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_245E39F44(uint64_t a1, uint64_t a2)
{
  return sub_245E3A104(a1, a2, (uint64_t)&unk_2517052E8, (uint64_t)&unk_2575248F8);
}

uint64_t sub_245E39F58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = sub_245E3C628();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v3 + v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  return swift_deallocObject();
}

uint64_t sub_245E3A004(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t);

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v4 - 8);
  v7 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = *(unsigned __int8 *)(*(_QWORD *)(sub_245E3C628() - 8) + 80);
  v10 = v1 + ((v7 + v8 + v9) & ~v9);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_245E3C300;
  v11[2] = a1;
  v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(v5 + 16) + *(_QWORD *)(v5 + 16));
  v12 = (_QWORD *)swift_task_alloc();
  v11[3] = v12;
  *v12 = v11;
  v12[1] = sub_245E3809C;
  return v14(v10, v4, v5);
}

uint64_t sub_245E3A0E0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245E3A104(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_245E3A2F4(a1, a2, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), *(_BYTE *)(v4 + 32), *(_QWORD *)(v4 + 40), *(_QWORD *)(v4 + 48), *(_QWORD *)(v4 + 56), a3, a4);
}

uint64_t sub_245E3A140(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t);

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_245E3C300;
  v6[2] = a1;
  v9 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v5 + 24) + *(_QWORD *)(v5 + 24));
  v7 = (_QWORD *)swift_task_alloc();
  v6[3] = v7;
  *v7 = v6;
  v7[1] = sub_245E3818C;
  return v9(v4, v5);
}

uint64_t objectdestroy_14Tm()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t sub_245E3A248(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t);

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_245E3C300;
  v6[2] = a1;
  v9 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v5 + 56) + *(_QWORD *)(v5 + 56));
  v7 = (_QWORD *)swift_task_alloc();
  v6[3] = v7;
  *v7 = v6;
  v7[1] = sub_245E383AC;
  return v9(v4, v5);
}

uint64_t sub_245E3A2F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v43 = a8;
  v44 = a2;
  v46 = a6;
  v15 = a10;
  v42 = a9;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441B5F0);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_245E3CBC8();
  v40 = *(_QWORD *)(v19 - 8);
  v41 = v19;
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v35 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = sub_245E3AA0C(0x65uLL);
  sub_245E3CAFC();
  v22 = sub_245E3CBBC();
  v23 = sub_245E3CE14();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = swift_slowAlloc();
    v38 = a1;
    v25 = v24;
    v26 = swift_slowAlloc();
    v36 = v26;
    *(_DWORD *)v25 = 134218498;
    v47 = v45;
    v48 = v26;
    v39 = a10;
    sub_245E3CE80();
    *(_WORD *)(v25 + 12) = 2080;
    v35 = v25 + 14;
    v27 = sub_245E3CF64();
    v37 = v18;
    v47 = sub_245E19CDC(v27, v28, &v48);
    sub_245E3CE80();
    v18 = v37;
    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 22) = 2048;
    v47 = v46;
    v15 = v39;
    sub_245E3CE80();
    _os_log_impl(&dword_245E10000, v22, v23, "Converting from Async-Await to Promise Main: %ld:%s:%lu", (uint8_t *)v25, 0x20u);
    v29 = v36;
    swift_arrayDestroy();
    MEMORY[0x24954AA78](v29, -1, -1);
    v30 = v25;
    a1 = v38;
    MEMORY[0x24954AA78](v30, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v40 + 8))(v21, v41);
  v31 = sub_245E3CDD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v18, 1, 1, v31);
  v32 = swift_allocObject();
  *(_QWORD *)(v32 + 16) = 0;
  *(_QWORD *)(v32 + 24) = 0;
  *(_QWORD *)(v32 + 32) = a7;
  v33 = v45;
  *(_QWORD *)(v32 + 40) = v43;
  *(_QWORD *)(v32 + 48) = v33;
  *(_QWORD *)(v32 + 56) = a3;
  *(_QWORD *)(v32 + 64) = a4;
  *(_BYTE *)(v32 + 72) = a5;
  *(_QWORD *)(v32 + 80) = v46;
  *(_QWORD *)(v32 + 88) = a1;
  *(_QWORD *)(v32 + 96) = v44;
  swift_retain();
  swift_retain();
  sub_245E3B118((uint64_t)v18, v15, v32);
  return swift_release();
}

uint64_t sub_245E3A5EC(uint64_t a1, uint64_t a2)
{
  return sub_245E3A104(a1, a2, (uint64_t)&unk_251705298, (uint64_t)&unk_2575248D8);
}

uint64_t dispatch thunk of AccountProviding.fetchCurrentAccount(accountType:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 8) + *(_QWORD *)(a3 + 8));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_245E176DC;
  return v9(a1, a2, a3);
}

{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of AccountProviding.fetchMatchingAccount(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 16) + *(_QWORD *)(a3 + 16));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_245E25F84;
  return v9(a1, a2, a3);
}

{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of AccountProviding.fetchPrimaryAccount()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 24) + *(_QWORD *)(a2 + 24));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_245E25F84;
  return v7(a1, a2);
}

{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of AccountProviding.fetchCurrentAccountFirstName()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 56) + *(_QWORD *)(a2 + 56));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_245E3A7E0;
  return v7(a1, a2);
}

uint64_t sub_245E3A7E0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v6;

  v6 = *v2;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
}

uint64_t type metadata accessor for AccountProvider()
{
  return objc_opt_self();
}

uint64_t method lookup function for AccountProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AccountProvider.__allocating_init(eventHub:accountStore:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of AccountProvider.activate()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t sub_245E3A880()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245E3A8AC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_245E3C300;
  return sub_245E38820(a1, v4, v5, v6);
}

uint64_t sub_245E3A918(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25441B5F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_245E3A958(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_245E3C300;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_257524880 + dword_257524880))(a1, v4);
}

unint64_t sub_245E3A9C8()
{
  unint64_t result;

  result = qword_25441B610;
  if (!qword_25441B610)
  {
    result = MEMORY[0x24954A9D0](&protocol conformance descriptor for AccountChanged, &type metadata for AccountChanged);
    atomic_store(result, (unint64_t *)&qword_25441B610);
  }
  return result;
}

unint64_t sub_245E3AA0C(unint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  if (result)
  {
    v1 = result;
    v3 = 0;
    MEMORY[0x24954AA90](&v3, 8);
    result = (v3 * (unsigned __int128)v1) >> 64;
    if (v3 * v1 < v1)
    {
      v2 = -(uint64_t)v1 % v1;
      if (v2 > v3 * v1)
      {
        do
        {
          v3 = 0;
          MEMORY[0x24954AA90](&v3, 8);
        }
        while (v2 > v3 * v1);
        return (v3 * (unsigned __int128)v1) >> 64;
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_245E3AA94(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t);
  char v12;
  __int128 v13;
  uint64_t v14;

  *(_QWORD *)(v8 + 64) = v14;
  *(_OWORD *)(v8 + 48) = v13;
  *(_BYTE *)(v8 + 104) = v12;
  *(_QWORD *)(v8 + 32) = a7;
  *(_QWORD *)(v8 + 40) = a8;
  *(_QWORD *)(v8 + 24) = a6;
  v11 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 72) = v9;
  *v9 = v8;
  v9[1] = sub_245E3AB18;
  return v11(v8 + 16);
}

uint64_t sub_245E3AB18()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245E3AB7C()
{
  uint64_t v0;

  sub_245E3CDC0();
  *(_QWORD *)(v0 + 88) = sub_245E3CDB4();
  sub_245E3CD84();
  return swift_task_switch();
}

uint64_t sub_245E3ABE4()
{
  uint64_t v0;
  void (*v1)(uint64_t *);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;

  v1 = *(void (**)(uint64_t *))(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 48);
  v6 = *(_QWORD *)(v0 + 24);
  v5 = *(_QWORD *)(v0 + 32);
  v7 = *(unsigned __int8 *)(v0 + 104);
  swift_release();
  sub_245E3B6F4(v6, v5, v4, v7, v3, v1, v2, *(void **)(v0 + 16));
  return swift_task_switch();
}

uint64_t sub_245E3AC74()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245E3ACA4()
{
  uint64_t v0;

  sub_245E3CDC0();
  *(_QWORD *)(v0 + 96) = sub_245E3CDB4();
  sub_245E3CD84();
  return swift_task_switch();
}

uint64_t sub_245E3AD0C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void (*v3)(uint64_t *);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;

  v1 = *(void **)(v0 + 80);
  v3 = *(void (**)(uint64_t *))(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  v5 = *(_QWORD *)(v0 + 40);
  v4 = *(_QWORD *)(v0 + 48);
  v7 = *(_QWORD *)(v0 + 24);
  v6 = *(_QWORD *)(v0 + 32);
  v8 = *(unsigned __int8 *)(v0 + 104);
  swift_release();
  sub_245E3B25C(v7, v6, v5, v8, v4, v3, v2, v1);
  return swift_task_switch();
}

uint64_t sub_245E3ADA4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245E3ADD4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t);
  char v12;
  __int128 v13;
  uint64_t v14;

  *(_QWORD *)(v8 + 72) = v14;
  *(_OWORD *)(v8 + 56) = v13;
  *(_BYTE *)(v8 + 112) = v12;
  *(_QWORD *)(v8 + 40) = a7;
  *(_QWORD *)(v8 + 48) = a8;
  *(_QWORD *)(v8 + 32) = a6;
  v11 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 80) = v9;
  *v9 = v8;
  v9[1] = sub_245E3AE58;
  return v11(v8 + 16);
}

uint64_t sub_245E3AE58()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245E3AEBC()
{
  uint64_t v0;

  sub_245E3CDC0();
  *(_QWORD *)(v0 + 96) = sub_245E3CDB4();
  sub_245E3CD84();
  return swift_task_switch();
}

uint64_t sub_245E3AF24()
{
  uint64_t v0;
  void (*v1)(_QWORD);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;

  v1 = *(void (**)(_QWORD))(v0 + 64);
  v2 = *(_QWORD *)(v0 + 72);
  v4 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 56);
  v6 = *(_QWORD *)(v0 + 32);
  v5 = *(_QWORD *)(v0 + 40);
  v7 = *(unsigned __int8 *)(v0 + 112);
  swift_release();
  sub_245E3B938(v6, v5, v4, v7, v3, v1, v2, *(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
  return swift_task_switch();
}

uint64_t sub_245E3AFB8()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245E3AFE8()
{
  uint64_t v0;

  sub_245E3CDC0();
  *(_QWORD *)(v0 + 104) = sub_245E3CDB4();
  sub_245E3CD84();
  return swift_task_switch();
}

uint64_t sub_245E3B050()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void (*v3)(uint64_t *);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;

  v1 = *(void **)(v0 + 88);
  v3 = *(void (**)(uint64_t *))(v0 + 64);
  v2 = *(_QWORD *)(v0 + 72);
  v5 = *(_QWORD *)(v0 + 48);
  v4 = *(_QWORD *)(v0 + 56);
  v7 = *(_QWORD *)(v0 + 32);
  v6 = *(_QWORD *)(v0 + 40);
  v8 = *(unsigned __int8 *)(v0 + 112);
  swift_release();
  sub_245E3B4A8(v7, v6, v5, v8, v4, v3, v2, v1);
  return swift_task_switch();
}

uint64_t sub_245E3B0E8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245E3B118(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_245E3CDD8();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_245E3CDCC();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_245E3A918(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_245E3CD84();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_245E3B25C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, void (*a6)(uint64_t *), uint64_t a7, void *a8)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;

  v29 = a5;
  LODWORD(v28) = a4;
  v26 = a2;
  v27 = a3;
  v11 = sub_245E3CBC8();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245E3CAFC();
  v15 = sub_245E3CBBC();
  v16 = sub_245E3CE14();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = swift_slowAlloc();
    v24 = v12;
    v18 = v17;
    v23 = swift_slowAlloc();
    v30 = v23;
    *(_DWORD *)v18 = 134218498;
    v32 = a1;
    sub_245E3CE80();
    *(_WORD *)(v18 + 12) = 2080;
    v25 = a8;
    v19 = sub_245E3CF64();
    v28 = v11;
    v32 = sub_245E19CDC(v19, v20, &v30);
    a8 = v25;
    sub_245E3CE80();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2048;
    v32 = v29;
    sub_245E3CE80();
    _os_log_impl(&dword_245E10000, v15, v16, "Finished Main A->P conversion: %ld:%s:%lu", (uint8_t *)v18, 0x20u);
    v21 = v23;
    swift_arrayDestroy();
    MEMORY[0x24954AA78](v21, -1, -1);
    MEMORY[0x24954AA78](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v24 + 8))(v14, v28);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  v30 = (uint64_t)a8;
  v31 = 1;
  v22 = a8;
  a6(&v30);

}

void sub_245E3B4A8(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, void (*a6)(uint64_t *), uint64_t a7, void *a8)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31[2];
  char v32;
  uint64_t v33;

  v30 = a5;
  LODWORD(v29) = a4;
  v27 = a2;
  v28 = a3;
  v11 = sub_245E3CBC8();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245E3CAFC();
  v15 = sub_245E3CBBC();
  v16 = sub_245E3CE14();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = swift_slowAlloc();
    v25 = v12;
    v18 = v17;
    v24 = swift_slowAlloc();
    v31[0] = v24;
    *(_DWORD *)v18 = 134218498;
    v33 = a1;
    sub_245E3CE80();
    *(_WORD *)(v18 + 12) = 2080;
    v26 = a8;
    v19 = sub_245E3CF64();
    v29 = v11;
    v33 = sub_245E19CDC(v19, v20, v31);
    a8 = v26;
    sub_245E3CE80();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2048;
    v33 = v30;
    sub_245E3CE80();
    _os_log_impl(&dword_245E10000, v15, v16, "Finished Main A->P conversion: %ld:%s:%lu", (uint8_t *)v18, 0x20u);
    v21 = v24;
    swift_arrayDestroy();
    MEMORY[0x24954AA78](v21, -1, -1);
    MEMORY[0x24954AA78](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v29);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  v31[0] = (uint64_t)a8;
  v31[1] = 0;
  v32 = 1;
  v22 = a8;
  a6(v31);

}

void sub_245E3B6F4(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, void (*a6)(uint64_t *), uint64_t a7, void *a8)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;

  v30 = a5;
  LODWORD(v29) = a4;
  v27 = a2;
  v28 = a3;
  v12 = sub_245E3CBC8();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245E3CAFC();
  v16 = sub_245E3CBBC();
  v17 = sub_245E3CE14();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = swift_slowAlloc();
    v25 = v13;
    v19 = v18;
    v24 = swift_slowAlloc();
    v31 = v24;
    *(_DWORD *)v19 = 134218498;
    v33 = a1;
    sub_245E3CE80();
    *(_WORD *)(v19 + 12) = 2080;
    v26 = a7;
    v20 = sub_245E3CF64();
    v29 = v12;
    v33 = sub_245E19CDC(v20, v21, &v31);
    sub_245E3CE80();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 22) = 2048;
    v33 = v30;
    sub_245E3CE80();
    _os_log_impl(&dword_245E10000, v16, v17, "Finished Main A->P conversion: %ld:%s:%lu", (uint8_t *)v19, 0x20u);
    v22 = v24;
    swift_arrayDestroy();
    MEMORY[0x24954AA78](v22, -1, -1);
    MEMORY[0x24954AA78](v19, -1, -1);

    (*(void (**)(char *, uint64_t))(v25 + 8))(v15, v29);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  v31 = (uint64_t)a8;
  v32 = 0;
  v23 = a8;
  a6(&v31);

}

uint64_t sub_245E3B938(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, void (*a6)(_QWORD), uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(_QWORD);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37[2];
  char v38;
  uint64_t v39;

  v34 = a5;
  v33 = a4;
  v31 = a2;
  v32 = a3;
  v13 = a9;
  v14 = sub_245E3CBC8();
  v35 = *(_QWORD *)(v14 - 8);
  v36 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245E3CAFC();
  v17 = sub_245E3CBBC();
  v18 = sub_245E3CE14();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = swift_slowAlloc();
    v30 = v9;
    v20 = v19;
    v21 = swift_slowAlloc();
    v29 = a6;
    v27 = v21;
    v37[0] = v21;
    *(_DWORD *)v20 = 134218498;
    v39 = a1;
    sub_245E3CE80();
    *(_WORD *)(v20 + 12) = 2080;
    v28 = a9;
    v22 = sub_245E3CF64();
    v39 = sub_245E19CDC(v22, v23, v37);
    v13 = v28;
    sub_245E3CE80();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 22) = 2048;
    v39 = v34;
    sub_245E3CE80();
    _os_log_impl(&dword_245E10000, v17, v18, "Finished Main A->P conversion: %ld:%s:%lu", (uint8_t *)v20, 0x20u);
    v24 = v27;
    swift_arrayDestroy();
    a6 = v29;
    MEMORY[0x24954AA78](v24, -1, -1);
    MEMORY[0x24954AA78](v20, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v35 + 8))(v16, v36);
  v37[0] = a8;
  v37[1] = v13;
  v38 = 0;
  swift_bridgeObjectRetain();
  a6(v37);
  return swift_bridgeObjectRelease();
}

uint64_t sub_245E3BB78(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_245E3C304;
  return v6(a1);
}

uint64_t sub_245E3BBDC(uint64_t a1, uint64_t *a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v3 + 16) = a1;
  v4 = *a2;
  *(_BYTE *)(v3 + 48) = a3 & 1;
  v5 = swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v5;
  *(_QWORD *)v5 = v3;
  *(_QWORD *)(v5 + 8) = sub_245E3BC50;
  *(_QWORD *)(v5 + 64) = v4;
  *(_BYTE *)(v5 + 144) = *(_BYTE *)(v3 + 48);
  return swift_task_switch();
}

uint64_t sub_245E3BC50(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 32) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 40) = a1;
  return swift_task_switch();
}

uint64_t sub_245E3BCC4()
{
  uint64_t v0;

  **(_QWORD **)(v0 + 16) = *(_QWORD *)(v0 + 40);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245E3BCDC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245E3BCE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v5;

  *(_QWORD *)(v3 + 16) = a1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v5;
  *v5 = v3;
  v5[1] = sub_245E3809C;
  return AccountProvider.fetchMatchingAccount(_:)(a3);
}

uint64_t sub_245E3BD3C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *a2;
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v3;
  return swift_task_switch();
}

uint64_t sub_245E3BD54()
{
  _QWORD *v0;
  void *v1;
  id v2;
  _QWORD *v4;

  v1 = *(void **)(v0[3] + 168);
  if (v1)
  {
    v0[5] = v1;
    v2 = v1;
    return swift_task_switch();
  }
  else
  {
    v4 = (_QWORD *)swift_task_alloc();
    v0[4] = v4;
    *v4 = v0;
    v4[1] = sub_245E3BDD0;
    return sub_245E38A28();
  }
}

uint64_t sub_245E3BDD0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = *v2;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v5 + 8))();
  *(_QWORD *)(v4 + 40) = a1;
  return swift_task_switch();
}

uint64_t sub_245E3BE4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  *(_QWORD *)(v2 + 16) = v1;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v4;
  *v4 = v2;
  v4[1] = sub_245E3BEBC;
  return ((uint64_t (*)(uint64_t, uint64_t *))((char *)&dword_2575248A0 + dword_2575248A0))(a1, (uint64_t *)(v2 + 16));
}

uint64_t sub_245E3BEBC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_245E3BF04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_245E3C628();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_245E3BF78(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(sub_245E3C628() - 8) + 80);
  v5 = v1 + 16;
  v6 = v1 + ((v4 + 24) & ~v4);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_245E3C300;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_2575248B0 + dword_2575248B0))(a1, v5, v6);
}

uint64_t sub_245E3C004()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245E3C028(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v4;
  char v5;
  _QWORD *v6;

  v4 = (uint64_t *)(v1 + 16);
  v5 = *(_BYTE *)(v1 + 24);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_245E15CB0;
  return ((uint64_t (*)(uint64_t, uint64_t *, char))((char *)&dword_2575248C0 + dword_2575248C0))(a1, v4, v5);
}

void sub_245E3C0A0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_245E15CB0;
  __asm { BR              X9; sub_245E3ADD4 }
}

uint64_t sub_245E3C168()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245E3C18C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_245E3C300;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2575248E0 + dword_2575248E0))(a1, v4);
}

uint64_t objectdestroy_104Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_245E3C234()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_245E3C300;
  __asm { BR              X9; sub_245E3AA94 }
}

uint64_t sub_245E3C334()
{
  return MEMORY[0x24BDCBCA0]();
}

uint64_t sub_245E3C340()
{
  return MEMORY[0x24BDCBCC8]();
}

uint64_t sub_245E3C34C()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_245E3C358()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_245E3C364()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_245E3C370()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_245E3C37C()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_245E3C388()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_245E3C394()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_245E3C3A0()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_245E3C3AC()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_245E3C3B8()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_245E3C3C4()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_245E3C3D0()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_245E3C3DC()
{
  return MEMORY[0x24BDCF040]();
}

uint64_t sub_245E3C3E8()
{
  return MEMORY[0x24BDCF050]();
}

uint64_t sub_245E3C3F4()
{
  return MEMORY[0x24BDCF128]();
}

uint64_t sub_245E3C400()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_245E3C40C()
{
  return MEMORY[0x24BDCF190]();
}

uint64_t sub_245E3C418()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_245E3C424()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_245E3C430()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_245E3C43C()
{
  return MEMORY[0x24BE88540]();
}

uint64_t sub_245E3C448()
{
  return MEMORY[0x24BE88550]();
}

uint64_t sub_245E3C454()
{
  return MEMORY[0x24BE88558]();
}

uint64_t sub_245E3C460()
{
  return MEMORY[0x24BE88560]();
}

uint64_t sub_245E3C46C()
{
  return MEMORY[0x24BE88568]();
}

uint64_t sub_245E3C478()
{
  return MEMORY[0x24BE88570]();
}

uint64_t sub_245E3C484()
{
  return MEMORY[0x24BE897C0]();
}

uint64_t sub_245E3C490()
{
  return MEMORY[0x24BE897D8]();
}

uint64_t sub_245E3C49C()
{
  return MEMORY[0x24BE897E0]();
}

uint64_t sub_245E3C4A8()
{
  return MEMORY[0x24BE897E8]();
}

uint64_t sub_245E3C4B4()
{
  return MEMORY[0x24BE89808]();
}

uint64_t sub_245E3C4C0()
{
  return MEMORY[0x24BE89CD8]();
}

uint64_t sub_245E3C4CC()
{
  return MEMORY[0x24BE8A550]();
}

uint64_t sub_245E3C4D8()
{
  return MEMORY[0x24BE8A578]();
}

uint64_t _s21SeymourClientServices22MultiUserGroupActivityV4hash4intoys6HasherVz_tF_0()
{
  return MEMORY[0x24BE8A580]();
}

uint64_t sub_245E3C4F0()
{
  return MEMORY[0x24BE8A588]();
}

uint64_t sub_245E3C4FC()
{
  return MEMORY[0x24BE8A590]();
}

uint64_t sub_245E3C508()
{
  return MEMORY[0x24BE8AC58]();
}

uint64_t sub_245E3C514()
{
  return MEMORY[0x24BE8ACB8]();
}

uint64_t sub_245E3C520()
{
  return MEMORY[0x24BE8AE78]();
}

uint64_t sub_245E3C52C()
{
  return MEMORY[0x24BE8AE80]();
}

uint64_t sub_245E3C538()
{
  return MEMORY[0x24BE8AE88]();
}

uint64_t sub_245E3C544()
{
  return MEMORY[0x24BE8AE90]();
}

uint64_t sub_245E3C550()
{
  return MEMORY[0x24BE8AF88]();
}

uint64_t sub_245E3C55C()
{
  return MEMORY[0x24BE8B4C8]();
}

uint64_t sub_245E3C568()
{
  return MEMORY[0x24BE8B5A0]();
}

uint64_t sub_245E3C574()
{
  return MEMORY[0x24BE8B5A8]();
}

uint64_t sub_245E3C580()
{
  return MEMORY[0x24BE8B5B0]();
}

uint64_t sub_245E3C58C()
{
  return MEMORY[0x24BE8B5B8]();
}

uint64_t sub_245E3C598()
{
  return MEMORY[0x24BE8B5C0]();
}

uint64_t sub_245E3C5A4()
{
  return MEMORY[0x24BE8B5C8]();
}

uint64_t sub_245E3C5B0()
{
  return MEMORY[0x24BE8B5D0]();
}

uint64_t sub_245E3C5BC()
{
  return MEMORY[0x24BE8B5D8]();
}

uint64_t sub_245E3C5C8()
{
  return MEMORY[0x24BE8B5E0]();
}

uint64_t sub_245E3C5D4()
{
  return MEMORY[0x24BE8B5E8]();
}

uint64_t sub_245E3C5E0()
{
  return MEMORY[0x24BE8B5F0]();
}

uint64_t sub_245E3C5EC()
{
  return MEMORY[0x24BE8B5F8]();
}

uint64_t sub_245E3C5F8()
{
  return MEMORY[0x24BE8B600]();
}

uint64_t sub_245E3C604()
{
  return MEMORY[0x24BE8B608]();
}

uint64_t sub_245E3C610()
{
  return MEMORY[0x24BE8B610]();
}

uint64_t sub_245E3C61C()
{
  return MEMORY[0x24BE8B618]();
}

uint64_t sub_245E3C628()
{
  return MEMORY[0x24BE8B620]();
}

uint64_t sub_245E3C634()
{
  return MEMORY[0x24BE8BB58]();
}

uint64_t sub_245E3C640()
{
  return MEMORY[0x24BE8BB60]();
}

uint64_t sub_245E3C64C()
{
  return MEMORY[0x24BE8BB68]();
}

uint64_t sub_245E3C658()
{
  return MEMORY[0x24BE8BB70]();
}

uint64_t sub_245E3C664()
{
  return MEMORY[0x24BE8BFB8]();
}

uint64_t sub_245E3C670()
{
  return MEMORY[0x24BE8BFD0]();
}

uint64_t sub_245E3C67C()
{
  return MEMORY[0x24BE8BFF0]();
}

uint64_t sub_245E3C688()
{
  return MEMORY[0x24BE8C1A8]();
}

uint64_t sub_245E3C694()
{
  return MEMORY[0x24BE8C1C0]();
}

uint64_t sub_245E3C6A0()
{
  return MEMORY[0x24BE8C250]();
}

uint64_t sub_245E3C6AC()
{
  return MEMORY[0x24BE8C500]();
}

uint64_t sub_245E3C6B8()
{
  return MEMORY[0x24BE8C8D8]();
}

uint64_t sub_245E3C6C4()
{
  return MEMORY[0x24BE8C8E0]();
}

uint64_t sub_245E3C6D0()
{
  return MEMORY[0x24BE8C8E8]();
}

uint64_t sub_245E3C6DC()
{
  return MEMORY[0x24BE8C8F0]();
}

uint64_t sub_245E3C6E8()
{
  return MEMORY[0x24BE8C8F8]();
}

uint64_t sub_245E3C6F4()
{
  return MEMORY[0x24BE8C900]();
}

uint64_t sub_245E3C700()
{
  return MEMORY[0x24BE8C908]();
}

uint64_t sub_245E3C70C()
{
  return MEMORY[0x24BE8C910]();
}

uint64_t sub_245E3C718()
{
  return MEMORY[0x24BE8C918]();
}

uint64_t sub_245E3C724()
{
  return MEMORY[0x24BE8C920]();
}

uint64_t sub_245E3C730()
{
  return MEMORY[0x24BE8C928]();
}

uint64_t sub_245E3C73C()
{
  return MEMORY[0x24BE8C930]();
}

uint64_t sub_245E3C748()
{
  return MEMORY[0x24BE8C938]();
}

uint64_t sub_245E3C754()
{
  return MEMORY[0x24BE8C940]();
}

uint64_t sub_245E3C760()
{
  return MEMORY[0x24BE8C948]();
}

uint64_t sub_245E3C76C()
{
  return MEMORY[0x24BE8C950]();
}

uint64_t sub_245E3C778()
{
  return MEMORY[0x24BE8C958]();
}

uint64_t sub_245E3C784()
{
  return MEMORY[0x24BE8C960]();
}

uint64_t sub_245E3C790()
{
  return MEMORY[0x24BE8C968]();
}

uint64_t sub_245E3C79C()
{
  return MEMORY[0x24BE8C970]();
}

uint64_t sub_245E3C7A8()
{
  return MEMORY[0x24BE8C978]();
}

uint64_t sub_245E3C7B4()
{
  return MEMORY[0x24BE8C980]();
}

uint64_t sub_245E3C7C0()
{
  return MEMORY[0x24BE8C988]();
}

uint64_t sub_245E3C7CC()
{
  return MEMORY[0x24BE8C990]();
}

uint64_t sub_245E3C7D8()
{
  return MEMORY[0x24BE8CAB8]();
}

uint64_t sub_245E3C7E4()
{
  return MEMORY[0x24BE8CAC0]();
}

uint64_t sub_245E3C7F0()
{
  return MEMORY[0x24BE8CAC8]();
}

uint64_t sub_245E3C7FC()
{
  return MEMORY[0x24BE8CAD0]();
}

uint64_t sub_245E3C808()
{
  return MEMORY[0x24BE8CAD8]();
}

uint64_t sub_245E3C814()
{
  return MEMORY[0x24BE8CAE0]();
}

uint64_t sub_245E3C820()
{
  return MEMORY[0x24BE8CAE8]();
}

uint64_t sub_245E3C82C()
{
  return MEMORY[0x24BE8CAF0]();
}

uint64_t sub_245E3C838()
{
  return MEMORY[0x24BE8CAF8]();
}

uint64_t sub_245E3C844()
{
  return MEMORY[0x24BE8CB00]();
}

uint64_t sub_245E3C850()
{
  return MEMORY[0x24BE8CE78]();
}

uint64_t sub_245E3C85C()
{
  return MEMORY[0x24BE8CE88]();
}

uint64_t sub_245E3C868()
{
  return MEMORY[0x24BE8CEA0]();
}

uint64_t sub_245E3C874()
{
  return MEMORY[0x24BE8D1F0]();
}

uint64_t sub_245E3C880()
{
  return MEMORY[0x24BE8D478]();
}

uint64_t sub_245E3C88C()
{
  return MEMORY[0x24BE8D508]();
}

uint64_t sub_245E3C898()
{
  return MEMORY[0x24BE8D510]();
}

uint64_t sub_245E3C8A4()
{
  return MEMORY[0x24BE8D518]();
}

uint64_t sub_245E3C8B0()
{
  return MEMORY[0x24BE8D520]();
}

uint64_t sub_245E3C8BC()
{
  return MEMORY[0x24BE8D528]();
}

uint64_t sub_245E3C8C8()
{
  return MEMORY[0x24BE8D530]();
}

uint64_t sub_245E3C8D4()
{
  return MEMORY[0x24BE8D538]();
}

uint64_t sub_245E3C8E0()
{
  return MEMORY[0x24BE8D540]();
}

uint64_t sub_245E3C8EC()
{
  return MEMORY[0x24BE8D548]();
}

uint64_t sub_245E3C8F8()
{
  return MEMORY[0x24BE8D550]();
}

uint64_t sub_245E3C904()
{
  return MEMORY[0x24BE8D558]();
}

uint64_t sub_245E3C910()
{
  return MEMORY[0x24BE8D560]();
}

uint64_t sub_245E3C91C()
{
  return MEMORY[0x24BE8D568]();
}

uint64_t sub_245E3C928()
{
  return MEMORY[0x24BE8D570]();
}

uint64_t sub_245E3C934()
{
  return MEMORY[0x24BE8D578]();
}

uint64_t sub_245E3C940()
{
  return MEMORY[0x24BE8D580]();
}

uint64_t sub_245E3C94C()
{
  return MEMORY[0x24BE8D588]();
}

uint64_t sub_245E3C958()
{
  return MEMORY[0x24BE8D590]();
}

uint64_t sub_245E3C964()
{
  return MEMORY[0x24BE8D598]();
}

uint64_t sub_245E3C970()
{
  return MEMORY[0x24BE8D5A0]();
}

uint64_t sub_245E3C97C()
{
  return MEMORY[0x24BE8D5A8]();
}

uint64_t sub_245E3C988()
{
  return MEMORY[0x24BE8D5B0]();
}

uint64_t sub_245E3C994()
{
  return MEMORY[0x24BE8D5B8]();
}

uint64_t sub_245E3C9A0()
{
  return MEMORY[0x24BE8D5C0]();
}

uint64_t sub_245E3C9AC()
{
  return MEMORY[0x24BE8D5C8]();
}

uint64_t sub_245E3C9B8()
{
  return MEMORY[0x24BE8D5D0]();
}

uint64_t sub_245E3C9C4()
{
  return MEMORY[0x24BE8D6D0]();
}

uint64_t sub_245E3C9D0()
{
  return MEMORY[0x24BE8D6D8]();
}

uint64_t sub_245E3C9DC()
{
  return MEMORY[0x24BE8D6E0]();
}

uint64_t sub_245E3C9E8()
{
  return MEMORY[0x24BE8D6E8]();
}

uint64_t sub_245E3C9F4()
{
  return MEMORY[0x24BE8D950]();
}

uint64_t sub_245E3CA00()
{
  return MEMORY[0x24BE86B10]();
}

uint64_t sub_245E3CA0C()
{
  return MEMORY[0x24BE86B18]();
}

uint64_t sub_245E3CA18()
{
  return MEMORY[0x24BE86B20]();
}

uint64_t sub_245E3CA24()
{
  return MEMORY[0x24BE86EC0]();
}

uint64_t sub_245E3CA30()
{
  return MEMORY[0x24BE87250]();
}

uint64_t sub_245E3CA3C()
{
  return MEMORY[0x24BE87418]();
}

uint64_t sub_245E3CA48()
{
  return MEMORY[0x24BE87428]();
}

uint64_t sub_245E3CA54()
{
  return MEMORY[0x24BE87430]();
}

uint64_t sub_245E3CA60()
{
  return MEMORY[0x24BE87438]();
}

uint64_t sub_245E3CA6C()
{
  return MEMORY[0x24BE87440]();
}

uint64_t sub_245E3CA78()
{
  return MEMORY[0x24BE87448]();
}

uint64_t sub_245E3CA84()
{
  return MEMORY[0x24BE87450]();
}

uint64_t sub_245E3CA90()
{
  return MEMORY[0x24BE87458]();
}

uint64_t sub_245E3CA9C()
{
  return MEMORY[0x24BE87460]();
}

uint64_t sub_245E3CAA8()
{
  return MEMORY[0x24BE87468]();
}

uint64_t sub_245E3CAB4()
{
  return MEMORY[0x24BE87470]();
}

uint64_t sub_245E3CAC0()
{
  return MEMORY[0x24BE87610]();
}

uint64_t sub_245E3CACC()
{
  return MEMORY[0x24BE87618]();
}

uint64_t sub_245E3CAD8()
{
  return MEMORY[0x24BE87728]();
}

uint64_t sub_245E3CAE4()
{
  return MEMORY[0x24BE87730]();
}

uint64_t sub_245E3CAF0()
{
  return MEMORY[0x24BE87F08]();
}

uint64_t sub_245E3CAFC()
{
  return MEMORY[0x24BE87F80]();
}

uint64_t sub_245E3CB08()
{
  return MEMORY[0x24BE87F88]();
}

uint64_t sub_245E3CB14()
{
  return MEMORY[0x24BE87FF0]();
}

uint64_t sub_245E3CB20()
{
  return MEMORY[0x24BE87FF8]();
}

uint64_t sub_245E3CB2C()
{
  return MEMORY[0x24BDD1C70]();
}

uint64_t sub_245E3CB38()
{
  return MEMORY[0x24BDD1C78]();
}

uint64_t sub_245E3CB44()
{
  return MEMORY[0x24BDD1C80]();
}

uint64_t sub_245E3CB50()
{
  return MEMORY[0x24BDD1C98]();
}

uint64_t sub_245E3CB5C()
{
  return MEMORY[0x24BDD1CA0]();
}

uint64_t sub_245E3CB68()
{
  return MEMORY[0x24BDD1CB0]();
}

uint64_t sub_245E3CB74()
{
  return MEMORY[0x24BDD1CB8]();
}

uint64_t sub_245E3CB80()
{
  return MEMORY[0x24BDD1CC0]();
}

uint64_t sub_245E3CB8C()
{
  return MEMORY[0x24BDD1EC8]();
}

uint64_t sub_245E3CB98()
{
  return MEMORY[0x24BDD1F78]();
}

uint64_t sub_245E3CBA4()
{
  return MEMORY[0x24BDD1F80]();
}

uint64_t sub_245E3CBB0()
{
  return MEMORY[0x24BE88120]();
}

uint64_t sub_245E3CBBC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_245E3CBC8()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_245E3CBD4()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_245E3CBE0()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_245E3CBEC()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_245E3CBF8()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_245E3CC04()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_245E3CC10()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_245E3CC1C()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_245E3CC28()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_245E3CC34()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_245E3CC40()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_245E3CC4C()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_245E3CC58()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_245E3CC64()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_245E3CC70()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_245E3CC7C()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_245E3CC88()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_245E3CC94()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_245E3CCA0()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_245E3CCAC()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_245E3CCB8()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_245E3CCC4()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_245E3CCD0()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_245E3CCDC()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_245E3CCE8()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_245E3CCF4()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_245E3CD00()
{
  return MEMORY[0x24BEE0EE0]();
}

uint64_t sub_245E3CD0C()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_245E3CD18()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_245E3CD24()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_245E3CD30()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_245E3CD3C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_245E3CD48()
{
  return MEMORY[0x24BEE1138]();
}

uint64_t sub_245E3CD54()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_245E3CD60()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_245E3CD6C()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_245E3CD78()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_245E3CD84()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_245E3CD90()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_245E3CD9C()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_245E3CDA8()
{
  return MEMORY[0x24BEE6830]();
}

uint64_t sub_245E3CDB4()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_245E3CDC0()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_245E3CDCC()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_245E3CDD8()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_245E3CDE4()
{
  return MEMORY[0x24BE8DC88]();
}

uint64_t sub_245E3CDF0()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_245E3CDFC()
{
  return MEMORY[0x24BDCFE30]();
}

uint64_t sub_245E3CE08()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_245E3CE14()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_245E3CE20()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_245E3CE2C()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_245E3CE38()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_245E3CE44()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_245E3CE50()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_245E3CE5C()
{
  return MEMORY[0x24BE8DCC8]();
}

uint64_t sub_245E3CE68()
{
  return MEMORY[0x24BE881B0]();
}

uint64_t sub_245E3CE74()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_245E3CE80()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_245E3CE8C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_245E3CE98()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_245E3CEA4()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_245E3CEB0()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_245E3CEBC()
{
  return MEMORY[0x24BE881B8]();
}

uint64_t sub_245E3CEC8()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_245E3CED4()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_245E3CEE0()
{
  return MEMORY[0x24BEE22F8]();
}

uint64_t sub_245E3CEEC()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_245E3CEF8()
{
  return MEMORY[0x24BEE2318]();
}

uint64_t sub_245E3CF04()
{
  return MEMORY[0x24BEE2320]();
}

uint64_t sub_245E3CF10()
{
  return MEMORY[0x24BEE2328]();
}

uint64_t sub_245E3CF1C()
{
  return MEMORY[0x24BEE2348]();
}

uint64_t sub_245E3CF28()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_245E3CF34()
{
  return MEMORY[0x24BEE2368]();
}

uint64_t sub_245E3CF40()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_245E3CF4C()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_245E3CF58()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_245E3CF64()
{
  return MEMORY[0x24BEE25B8]();
}

uint64_t sub_245E3CF70()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_245E3CF7C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_245E3CF88()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_245E3CF94()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_245E3CFA0()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_245E3CFAC()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_245E3CFB8()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_245E3CFC4()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_245E3CFD0()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_245E3CFDC()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_245E3CFE8()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_245E3CFF4()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_245E3D000()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_245E3D00C()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_245E3D018()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_245E3D024()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_245E3D030()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_245E3D03C()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_245E3D048()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_245E3D054()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_245E3D060()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_245E3D06C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_245E3D078()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_245E3D084()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_245E3D090()
{
  return MEMORY[0x24BE8DD00]();
}

uint64_t sub_245E3D09C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_245E3D0A8()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_245E3D0B4()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_245E3D0C0()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_245E3D0CC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_245E3D0D8()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_245E3D0E4()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_245E3D0F0()
{
  return MEMORY[0x24BE8DD18]();
}

uint64_t sub_245E3D0FC()
{
  return MEMORY[0x24BEE4408]();
}

uint64_t sub_245E3D108()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_245E3D114()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_245E3D120()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_245E3D12C()
{
  return MEMORY[0x24BEE4A10]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x24BEE4F50]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

