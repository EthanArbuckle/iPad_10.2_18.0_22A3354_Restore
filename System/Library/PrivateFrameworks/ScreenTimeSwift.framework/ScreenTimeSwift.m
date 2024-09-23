void type metadata accessor for STDowntimeState(uint64_t a1)
{
  sub_24599DC7C(a1, &qword_2574D6F20);
}

void type metadata accessor for MOScreenTimeShieldPolicy(uint64_t a1)
{
  sub_24599DC7C(a1, &qword_2574D6F28);
}

void type metadata accessor for STFamilyMemberType(uint64_t a1)
{
  sub_24599DC7C(a1, &qword_2574D6F30);
}

void sub_24599DC7C(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_24599DCC0(uint64_t a1)
{
  return sub_24599DD28(a1, qword_2574D7A90);
}

uint64_t sub_24599DCD8(uint64_t a1)
{
  return sub_24599DD28(a1, qword_2574D7AA8);
}

uint64_t sub_24599DCFC(uint64_t a1)
{
  return sub_24599DD28(a1, qword_2574D7AC0);
}

uint64_t sub_24599DD28(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_2459B0F28();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_2459B0F1C();
}

uint64_t sub_24599DD9C(uint64_t a1, uint64_t a2)
{
  return sub_24599E194(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_24599DDB4(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_2459B0FF4();
  *a2 = 0;
  return result;
}

uint64_t sub_24599DE28(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_2459B1000();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_24599DEA4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_2459B100C();
  v2 = sub_2459B0FE8();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void sub_24599DEE4(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

void sub_24599DEF0(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_24599DEF8@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

BOOL sub_24599DF0C(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_24599DF3C(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_24599DF50(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_24599DF64@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_24599DF74@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2459B100C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24599DF9C()
{
  sub_24599E078(&qword_2574D6F78, (uint64_t (*)(uint64_t))type metadata accessor for STFamilyMemberType, (uint64_t)&unk_2459B18F0);
  sub_24599E078((unint64_t *)&unk_2574D6F80, (uint64_t (*)(uint64_t))type metadata accessor for STFamilyMemberType, (uint64_t)&unk_2459B1890);
  return sub_2459B1258();
}

uint64_t sub_24599E020()
{
  return sub_24599E078(&qword_2574D6F38, (uint64_t (*)(uint64_t))type metadata accessor for STFamilyMemberType, (uint64_t)&unk_2459B1854);
}

uint64_t sub_24599E04C()
{
  return sub_24599E078(&qword_2574D6F40, (uint64_t (*)(uint64_t))type metadata accessor for STFamilyMemberType, (uint64_t)&unk_2459B1828);
}

uint64_t sub_24599E078(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24953FB64](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24599E0B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_2459B0FE8();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_24599E0FC()
{
  sub_24599E078(&qword_2574D6F68, (uint64_t (*)(uint64_t))type metadata accessor for MOScreenTimeShieldPolicy, (uint64_t)&unk_2459B1A38);
  sub_24599E078(&qword_2574D6F70, (uint64_t (*)(uint64_t))type metadata accessor for MOScreenTimeShieldPolicy, (uint64_t)&unk_2459B19E0);
  return sub_2459B1258();
}

uint64_t sub_24599E180(uint64_t a1, uint64_t a2)
{
  return sub_24599E194(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_24599E194(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_2459B100C();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_24599E1D0()
{
  sub_2459B100C();
  sub_2459B1024();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24599E210()
{
  uint64_t v0;

  sub_2459B100C();
  sub_2459B12B8();
  sub_2459B1024();
  v0 = sub_2459B12E8();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_24599E284()
{
  return sub_24599E078(&qword_2574D6F48, (uint64_t (*)(uint64_t))type metadata accessor for STFamilyMemberType, (uint64_t)&unk_2459B18C4);
}

uint64_t sub_24599E2B0()
{
  return sub_24599E078(&qword_2574D6F50, (uint64_t (*)(uint64_t))type metadata accessor for MOScreenTimeShieldPolicy, (uint64_t)&unk_2459B19A8);
}

uint64_t sub_24599E2DC()
{
  return sub_24599E078(&qword_2574D6F58, (uint64_t (*)(uint64_t))type metadata accessor for MOScreenTimeShieldPolicy, (uint64_t)&unk_2459B1980);
}

uint64_t sub_24599E308()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_2459B100C();
  v2 = v1;
  if (v0 == sub_2459B100C() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_2459B1264();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_24599E390()
{
  return sub_24599E078(&qword_2574D6F60, (uint64_t (*)(uint64_t))type metadata accessor for MOScreenTimeShieldPolicy, (uint64_t)&unk_2459B1A10);
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_24599E41C@<X0>(_BYTE *a1@<X8>)
{
  return sub_24599F44C(a1);
}

uint64_t sub_24599E430()
{
  return sub_24599F4D8();
}

uint64_t sub_24599E444()
{
  return sub_24599F558();
}

uint64_t sub_24599E460()
{
  return sub_24599F5DC();
}

uint64_t (*sub_24599E474(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2459B0F70();
  return sub_24599E4EC;
}

uint64_t sub_24599E4F0()
{
  return sub_24599FBE4((uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__checkForUnsafePhotos, &qword_2574D6FF8);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24953FB4C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_24599E544(uint64_t a1)
{
  return sub_24599FC64(a1, &qword_2574D7000, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__checkForUnsafePhotos, &qword_2574D6FF8);
}

uint64_t (*sub_24599E560(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D7000);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__checkForUnsafePhotos;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D6FF8);
  sub_2459B0F58();
  swift_endAccess();
  return sub_24599E628;
}

uint64_t sub_24599E62C@<X0>(_BYTE *a1@<X8>)
{
  return sub_24599F44C(a1);
}

uint64_t sub_24599E640()
{
  return sub_24599F4D8();
}

uint64_t sub_24599E654()
{
  return sub_24599F558();
}

uint64_t sub_24599E670()
{
  return sub_24599F5DC();
}

uint64_t (*sub_24599E684(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2459B0F70();
  return sub_24599E4EC;
}

uint64_t sub_24599E6FC()
{
  return sub_24599FBE4((uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__communicationSafetyNotificationEnabled, &qword_2574D6FF8);
}

uint64_t sub_24599E710(uint64_t a1)
{
  return sub_24599FC64(a1, &qword_2574D7000, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__communicationSafetyNotificationEnabled, &qword_2574D6FF8);
}

uint64_t (*sub_24599E72C(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D7000);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__communicationSafetyNotificationEnabled;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D6FF8);
  sub_2459B0F58();
  swift_endAccess();
  return sub_24599E628;
}

uint64_t sub_24599E7F4@<X0>(_BYTE *a1@<X8>)
{
  return sub_24599F44C(a1);
}

uint64_t sub_24599E808()
{
  return sub_24599F4D8();
}

uint64_t sub_24599E81C()
{
  return sub_24599F558();
}

uint64_t sub_24599E838()
{
  return sub_24599F5DC();
}

uint64_t (*sub_24599E84C(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2459B0F70();
  return sub_24599E4EC;
}

uint64_t sub_24599E8C4()
{
  return sub_24599FBE4((uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__communicationSafetyAnalyticsEnabled, &qword_2574D6FF8);
}

uint64_t sub_24599E8D8(uint64_t a1)
{
  return sub_24599FC64(a1, &qword_2574D7000, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__communicationSafetyAnalyticsEnabled, &qword_2574D6FF8);
}

uint64_t (*sub_24599E8F4(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D7000);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__communicationSafetyAnalyticsEnabled;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D6FF8);
  sub_2459B0F58();
  swift_endAccess();
  return sub_24599E628;
}

uint64_t sub_24599E9BC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2459B0F7C();
  swift_release();
  result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_24599EA38()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_2459B0F88();
}

uint64_t sub_24599EAB8()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2459B0F7C();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_24599EB30()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_2459B0F88();
}

uint64_t (*sub_24599EBA8(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2459B0F70();
  return sub_24599E4EC;
}

uint64_t sub_24599EC20()
{
  return sub_24599FBE4((uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__givenName, &qword_2574D7020);
}

uint64_t sub_24599EC34(uint64_t a1)
{
  return sub_24599FC64(a1, &qword_2574D7028, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__givenName, &qword_2574D7020);
}

uint64_t (*sub_24599EC50(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D7028);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__givenName;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D7020);
  sub_2459B0F58();
  swift_endAccess();
  return sub_24599E628;
}

uint64_t sub_24599ED18@<X0>(_BYTE *a1@<X8>)
{
  return sub_24599F44C(a1);
}

uint64_t sub_24599ED2C()
{
  return sub_24599F4D8();
}

uint64_t sub_24599ED40()
{
  return sub_24599F558();
}

uint64_t sub_24599ED5C()
{
  return sub_24599F5DC();
}

uint64_t (*sub_24599ED70(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2459B0F70();
  return sub_24599E4EC;
}

uint64_t sub_24599EDE8()
{
  return sub_24599FBE4((uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__hasPasscode, &qword_2574D6FF8);
}

uint64_t sub_24599EDFC(uint64_t a1)
{
  return sub_24599FC64(a1, &qword_2574D7000, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__hasPasscode, &qword_2574D6FF8);
}

uint64_t (*sub_24599EE18(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D7000);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__hasPasscode;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D6FF8);
  sub_2459B0F58();
  swift_endAccess();
  return sub_24599E628;
}

uint64_t sub_24599EEE0@<X0>(_BYTE *a1@<X8>)
{
  return sub_24599F44C(a1);
}

uint64_t sub_24599EEF4()
{
  return sub_24599F4D8();
}

uint64_t sub_24599EF08()
{
  return sub_24599F558();
}

uint64_t sub_24599EF24()
{
  return sub_24599F5DC();
}

uint64_t (*sub_24599EF38(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2459B0F70();
  return sub_24599E4EC;
}

uint64_t sub_24599EFB0()
{
  return sub_24599FBE4((uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__isParent, &qword_2574D6FF8);
}

uint64_t sub_24599EFC4(uint64_t a1)
{
  return sub_24599FC64(a1, &qword_2574D7000, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__isParent, &qword_2574D6FF8);
}

uint64_t (*sub_24599EFE0(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D7000);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__isParent;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D6FF8);
  sub_2459B0F58();
  swift_endAccess();
  return sub_24599E628;
}

uint64_t sub_24599F0A8@<X0>(_BYTE *a1@<X8>)
{
  return sub_24599F44C(a1);
}

uint64_t sub_24599F0BC()
{
  return sub_24599F4D8();
}

uint64_t sub_24599F0D0()
{
  return sub_24599F558();
}

uint64_t sub_24599F0EC()
{
  return sub_24599F5DC();
}

uint64_t (*sub_24599F100(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2459B0F70();
  return sub_24599E4EC;
}

uint64_t sub_24599F178()
{
  return sub_24599FBE4((uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__isRemoteUser, &qword_2574D6FF8);
}

uint64_t sub_24599F18C(uint64_t a1)
{
  return sub_24599FC64(a1, &qword_2574D7000, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__isRemoteUser, &qword_2574D6FF8);
}

uint64_t (*sub_24599F1A8(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D7000);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__isRemoteUser;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D6FF8);
  sub_2459B0F58();
  swift_endAccess();
  return sub_24599E628;
}

uint64_t sub_24599F270@<X0>(_BYTE *a1@<X8>)
{
  return sub_24599F44C(a1);
}

uint64_t sub_24599F284()
{
  return sub_24599F4D8();
}

uint64_t sub_24599F298()
{
  return sub_24599F558();
}

uint64_t sub_24599F2B4()
{
  return sub_24599F5DC();
}

uint64_t (*sub_24599F2C8(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2459B0F70();
  return sub_24599E4EC;
}

uint64_t sub_24599F340()
{
  return sub_24599FBE4((uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__screenTimeEnabled, &qword_2574D6FF8);
}

uint64_t sub_24599F354(uint64_t a1)
{
  return sub_24599FC64(a1, &qword_2574D7000, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__screenTimeEnabled, &qword_2574D6FF8);
}

uint64_t (*sub_24599F370(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D7000);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__screenTimeEnabled;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D6FF8);
  sub_2459B0F58();
  swift_endAccess();
  return sub_24599E628;
}

uint64_t sub_24599F438@<X0>(_BYTE *a1@<X8>)
{
  return sub_24599F44C(a1);
}

uint64_t sub_24599F44C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2459B0F7C();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_24599F4C4()
{
  return sub_24599F4D8();
}

uint64_t sub_24599F4D8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_2459B0F88();
}

uint64_t sub_24599F544()
{
  return sub_24599F558();
}

uint64_t sub_24599F558()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2459B0F7C();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_24599F5C8()
{
  return sub_24599F5DC();
}

uint64_t sub_24599F5DC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_2459B0F88();
}

uint64_t (*sub_24599F644(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2459B0F70();
  return sub_24599E4EC;
}

uint64_t sub_24599F6BC()
{
  return sub_24599FBE4((uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__syncingEnabled, &qword_2574D6FF8);
}

uint64_t sub_24599F6D0(uint64_t a1)
{
  return sub_24599FC64(a1, &qword_2574D7000, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__syncingEnabled, &qword_2574D6FF8);
}

uint64_t (*sub_24599F6EC(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D7000);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__syncingEnabled;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D6FF8);
  sub_2459B0F58();
  swift_endAccess();
  return sub_24599E628;
}

uint64_t sub_24599F7B4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2459B0F7C();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_24599F830(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  v2 = v1;
  swift_retain();
  return sub_2459B0F88();
}

uint64_t sub_24599F8A4()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2459B0F7C();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_24599F91C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_2459B0F88();
}

uint64_t (*sub_24599F988(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_2459B0F70();
  return sub_24599E4EC;
}

void sub_24599FA00(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t sub_24599FA4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a5);
  sub_2459B0F58();
  return swift_endAccess();
}

uint64_t sub_24599FAB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void (*v16)(char *, uint64_t, uint64_t);
  uint64_t v18;

  v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v18 - v14;
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v16((char *)&v18 - v14, a1, v9);
  v16(v13, (uint64_t)v15, v9);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a7);
  sub_2459B0F64();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

uint64_t sub_24599FBD0()
{
  return sub_24599FBE4((uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__familyMemberType, &qword_2574D7060);
}

uint64_t sub_24599FBE4(uint64_t a1, uint64_t *a2)
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a2);
  sub_2459B0F58();
  return swift_endAccess();
}

uint64_t sub_24599FC48(uint64_t a1)
{
  return sub_24599FC64(a1, &qword_2574D7068, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__familyMemberType, &qword_2574D7060);
}

uint64_t sub_24599FC64(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_2459B0F64();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*sub_24599FD3C(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D7068);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__familyMemberType;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D7060);
  sub_2459B0F58();
  swift_endAccess();
  return sub_24599E628;
}

void sub_24599FE04(uint64_t a1, char a2)
{
  _QWORD *v3;
  void (*v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void *, uint64_t);

  v3 = *(_QWORD **)a1;
  v4 = *(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)a1 + 88) + 16);
  v4(*(_QWORD *)(*(_QWORD *)a1 + 104), v3[14], v3[10]);
  v5 = (void *)v3[13];
  v6 = (void *)v3[14];
  v8 = v3[11];
  v7 = (void *)v3[12];
  v9 = v3[10];
  if ((a2 & 1) != 0)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_2459B0F64();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
    v10(v5, v9);
  }
  else
  {
    swift_beginAccess();
    sub_2459B0F64();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
  }
  v10(v6, v9);
  free(v6);
  free(v5);
  free(v7);
  free(v3);
}

uint64_t STSwiftUser.__allocating_init(identifier:givenName:hasPasscode:isParent:isRemoteUser:checkForUnsafePhotos:communicationSafetyNotificationEnabled:communicationSafetyAnalyticsEnabled:screenTimeEnabled:syncingEnabled:familyMemberType:persistenceSource:authenticationSource:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, int a5, int a6, int a7, int a8, unsigned __int8 a9, unsigned __int8 a10, unsigned __int8 a11, unsigned __int8 a12, void *a13, uint64_t a14, uint64_t a15)
{
  uint64_t v19;

  v19 = swift_allocObject();
  STSwiftUser.init(identifier:givenName:hasPasscode:isParent:isRemoteUser:checkForUnsafePhotos:communicationSafetyNotificationEnabled:communicationSafetyAnalyticsEnabled:screenTimeEnabled:syncingEnabled:familyMemberType:persistenceSource:authenticationSource:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15);
  return v19;
}

uint64_t STSwiftUser.init(identifier:givenName:hasPasscode:isParent:isRemoteUser:checkForUnsafePhotos:communicationSafetyNotificationEnabled:communicationSafetyAnalyticsEnabled:screenTimeEnabled:syncingEnabled:familyMemberType:persistenceSource:authenticationSource:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, int a5, int a6, int a7, int a8, unsigned __int8 a9, unsigned __int8 a10, unsigned __int8 a11, unsigned __int8 a12, void *a13, uint64_t a14, uint64_t a15)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
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
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t, uint64_t);
  id v53;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  id v83;
  int v84;
  int v85;
  int v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  uint64_t v91;
  void *v92;
  unint64_t v93;

  v16 = v15;
  v79 = a6;
  v80 = a7;
  v78 = a5;
  v76 = a3;
  v77 = a4;
  v72 = a1;
  v73 = a2;
  v86 = a10;
  v84 = a8;
  v85 = a9;
  v87 = a14;
  v88 = a15;
  v83 = a13;
  v81 = a11;
  v82 = a12;
  v71 = sub_2459B10C0();
  v70 = *(_QWORD *)(v71 - 8);
  MEMORY[0x24BDAC7A8]();
  v69 = (char *)&v55 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = sub_2459B10B4();
  MEMORY[0x24BDAC7A8]();
  v65 = (char *)&v55 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2459B0FC4();
  MEMORY[0x24BDAC7A8]();
  v55 = (char *)&v55 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D7060);
  v66 = *(_QWORD *)(v89 - 8);
  v20 = v66;
  MEMORY[0x24BDAC7A8]();
  v22 = (char *)&v55 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D6FF8);
  v59 = *(_QWORD *)(v23 - 8);
  v24 = v59;
  MEMORY[0x24BDAC7A8]();
  v26 = (char *)&v55 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D7020);
  v28 = *(_QWORD *)(v27 - 8);
  v56 = v27;
  v57 = v28;
  MEMORY[0x24BDAC7A8]();
  v30 = (char *)&v55 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = v16 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__givenName;
  v92 = 0;
  v93 = 0xE000000000000000;
  sub_2459B0F4C();
  (*(void (**)(uint64_t, char *, uint64_t))(v28 + 32))(v31, v30, v27);
  v32 = v16 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__hasPasscode;
  v58 = v16 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__hasPasscode;
  LOBYTE(v92) = 0;
  sub_2459B0F4C();
  v33 = *(void (**)(uint64_t, char *, uint64_t))(v24 + 32);
  v33(v32, v26, v23);
  v34 = v16 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__isParent;
  v60 = v16 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__isParent;
  LOBYTE(v92) = 0;
  sub_2459B0F4C();
  v33(v34, v26, v23);
  v35 = v16 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__isRemoteUser;
  v61 = v16 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__isRemoteUser;
  LOBYTE(v92) = 0;
  sub_2459B0F4C();
  v33(v35, v26, v23);
  v36 = v16 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__screenTimeEnabled;
  v62 = v16 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__screenTimeEnabled;
  LOBYTE(v92) = 0;
  sub_2459B0F4C();
  v33(v36, v26, v23);
  v37 = v16 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__syncingEnabled;
  v64 = v16 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__syncingEnabled;
  LOBYTE(v92) = 0;
  sub_2459B0F4C();
  v33(v37, v26, v23);
  v38 = v16 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__familyMemberType;
  v63 = v16 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__familyMemberType;
  v92 = (void *)*MEMORY[0x24BE84738];
  v39 = v92;
  type metadata accessor for STFamilyMemberType(0);
  v68 = v40;
  v41 = v39;
  sub_2459B0F4C();
  (*(void (**)(uint64_t, char *, uint64_t))(v20 + 32))(v38, v22, v89);
  v74 = OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser_persistenceSource;
  *(_QWORD *)(v16 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser_persistenceSource) = 0;
  v75 = OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser_authenticationSource;
  *(_QWORD *)(v16 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser_authenticationSource) = 0;
  v42 = OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser_backgroundPersistenceQueue;
  sub_2459A330C(0, &qword_2574D7088);
  sub_2459B0FB8();
  v92 = (void *)MEMORY[0x24BEE4AF8];
  sub_24599E078(&qword_2574D7090, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688], MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D7098);
  sub_2459A2984(&qword_2574D70A0, &qword_2574D7098);
  sub_2459B1138();
  (*(void (**)(char *, _QWORD, uint64_t))(v70 + 104))(v69, *MEMORY[0x24BEE5750], v71);
  *(_QWORD *)(v16 + v42) = sub_2459B10E4();
  v43 = (_QWORD *)(v16 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser_identifier);
  v44 = v73;
  *v43 = v72;
  v43[1] = v44;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v31, v56);
  v90 = v76;
  v91 = v77;
  sub_2459B0F4C();
  swift_endAccess();
  v45 = v58;
  swift_beginAccess();
  v46 = *(void (**)(uint64_t, uint64_t))(v59 + 8);
  v46(v45, v23);
  LOBYTE(v90) = v78;
  sub_2459B0F4C();
  swift_endAccess();
  v47 = v60;
  swift_beginAccess();
  v46(v47, v23);
  LOBYTE(v90) = v79;
  sub_2459B0F4C();
  swift_endAccess();
  v48 = v61;
  swift_beginAccess();
  v46(v48, v23);
  LOBYTE(v90) = v80;
  sub_2459B0F4C();
  swift_endAccess();
  v49 = v62;
  swift_beginAccess();
  v46(v49, v23);
  LOBYTE(v90) = v81;
  sub_2459B0F4C();
  swift_endAccess();
  v50 = v64;
  swift_beginAccess();
  v46(v50, v23);
  LOBYTE(v90) = v82;
  sub_2459B0F4C();
  swift_endAccess();
  v51 = v63;
  swift_beginAccess();
  v52 = *(void (**)(uint64_t, uint64_t))(v66 + 8);
  v53 = v83;
  v52(v51, v89);
  v90 = v53;
  sub_2459B0F4C();
  swift_endAccess();
  swift_beginAccess();
  LOBYTE(v90) = v84;
  sub_2459B0F4C();
  swift_endAccess();
  swift_beginAccess();
  LOBYTE(v90) = v85;
  sub_2459B0F4C();
  swift_endAccess();
  swift_beginAccess();
  LOBYTE(v90) = v86;
  sub_2459B0F4C();
  swift_endAccess();

  *(_QWORD *)(v16 + v74) = v87;
  swift_unknownObjectRelease();
  *(_QWORD *)(v16 + v75) = v88;
  swift_unknownObjectRelease();
  return v16;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24953FB58](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t STSwiftUser.__allocating_init(dsid:persistenceSource:authenticationSource:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  unsigned __int8 v13;
  unsigned __int8 v14;
  int v15;
  unsigned __int8 v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v6 = (void *)*MEMORY[0x24BE84738];
  if (!a3)
  {
    v7 = v6;
LABEL_7:
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v25 = 0;
    v26 = 0;
    v17 = 0;
    v18 = 0xE000000000000000;
    goto LABEL_10;
  }
  v7 = v6;
  swift_unknownObjectRetain();
  v8 = (void *)sub_2459B0FE8();
  v9 = objc_msgSend(a3, sel_userDataWithIdentifier_, v8);

  if (!v9)
  {
    swift_unknownObjectRelease();
    goto LABEL_7;
  }
  v10 = objc_msgSend(v9, sel_givenName);
  v24 = a2;
  if (v10)
  {
    v11 = v10;
    v22 = sub_2459B100C();
    v23 = v12;

  }
  else
  {
    v23 = 0xEA0000000000646CLL;
    v22 = 0x6968632072756F79;
  }
  HIDWORD(v26) = objc_msgSend(v9, sel_hasPasscode);
  LODWORD(v26) = objc_msgSend(v9, sel_isParent);
  HIDWORD(v25) = objc_msgSend(v9, sel_isRemote);
  LOBYTE(v25) = objc_msgSend(v9, sel_screenTimeEnabled);
  v16 = objc_msgSend(v9, sel_syncingEnabled);
  v19 = objc_msgSend(v9, sel_familyMemberType);

  v15 = objc_msgSend(v9, sel_checkForUnsafePhotos);
  v14 = objc_msgSend(v9, sel_isCommunicationSafetyNotificationEnabled);
  v13 = objc_msgSend(v9, sel_isCommunicationSafetyAnalyticsEnabled);
  swift_unknownObjectRelease();

  v7 = v19;
  v18 = v23;
  a2 = v24;
  v17 = (void *)v22;
LABEL_10:
  type metadata accessor for STSwiftUser();
  v20 = swift_allocObject();
  STSwiftUser.init(identifier:givenName:hasPasscode:isParent:isRemoteUser:checkForUnsafePhotos:communicationSafetyNotificationEnabled:communicationSafetyAnalyticsEnabled:screenTimeEnabled:syncingEnabled:familyMemberType:persistenceSource:authenticationSource:)(a1, a2, v17, v18, SHIDWORD(v26), v26, SHIDWORD(v25), v15, v14, v13, v25, v16, v7, (uint64_t)a3, a4);
  return v20;
}

uint64_t type metadata accessor for STSwiftUser()
{
  uint64_t result;

  result = qword_2574D70F8;
  if (!qword_2574D70F8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2459A0B1C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser_identifier);
  swift_bridgeObjectRetain();
  return v1;
}

void sub_2459A0B54(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  os_log_type_t v13;
  uint8_t *v14;
  NSObject *oslog;

  if (a3)
  {
    v7 = (_QWORD *)(v4 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser_identifier);
    *v7 = a1;
    v7[1] = a2;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v4 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser_persistenceSource) = a3;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    *(_QWORD *)(v4 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser_authenticationSource) = a4;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    v8 = (void *)sub_2459B0FE8();
    v9 = objc_msgSend(a3, sel_userDataWithIdentifier_, v8);

    if (v9)
    {
      v10 = objc_msgSend(v9, sel_givenName);
      if (v10)
      {
        v11 = v10;
        sub_2459B100C();

      }
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_2459B0F88();
      objc_msgSend(v9, sel_hasPasscode);
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_2459B0F88();
      objc_msgSend(v9, sel_isParent);
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_2459B0F88();
      objc_msgSend(v9, sel_isRemote);
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_2459B0F88();
      objc_msgSend(v9, sel_screenTimeEnabled);
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_2459B0F88();
      objc_msgSend(v9, sel_syncingEnabled);
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_2459B0F88();
      objc_msgSend(v9, sel_familyMemberType);
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_2459B0F88();
      objc_msgSend(v9, sel_checkForUnsafePhotos);
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_2459B0F88();
      objc_msgSend(v9, sel_isCommunicationSafetyNotificationEnabled);
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_2459B0F88();
      objc_msgSend(v9, sel_isCommunicationSafetyAnalyticsEnabled);
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_2459B0F88();
      swift_unknownObjectRelease();

    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
  else
  {
    if (qword_2574D6DA0 != -1)
      swift_once();
    v12 = sub_2459B0F28();
    __swift_project_value_buffer(v12, (uint64_t)qword_2574D7A90);
    oslog = sub_2459B0F10();
    v13 = sub_2459B10A8();
    if (os_log_type_enabled(oslog, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_24599C000, oslog, v13, "Persistence source not found for user update.", v14, 2u);
      MEMORY[0x24953FBF4](v14, -1, -1);
    }

  }
}

uint64_t sub_2459A10C0()
{
  uint64_t v0;
  uint64_t v1;
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
  void *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD aBlock[6];

  v1 = sub_2459B0FA0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2459B0FC4();
  v5 = MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(v0 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser_persistenceSource);
  if (v9)
  {
    v17 = v2;
    v18 = v5;
    v10 = *(void **)(v0 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser_backgroundPersistenceQueue);
    v16 = v6;
    v11 = swift_allocObject();
    swift_weakInit();
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = v11;
    *(_QWORD *)(v12 + 24) = v9;
    aBlock[4] = sub_2459A2964;
    aBlock[5] = v12;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2459A1BE0;
    aBlock[3] = &block_descriptor;
    v13 = _Block_copy(aBlock);
    swift_unknownObjectRetain_n();
    v14 = v10;
    swift_retain();
    sub_2459B0FAC();
    v19 = MEMORY[0x24BEE4AF8];
    sub_24599E078(&qword_2574D70B8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574D70C0);
    sub_2459A2984((unint64_t *)&qword_2574D70C8, &qword_2574D70C0);
    sub_2459B1138();
    MEMORY[0x24953F5F4](0, v8, v4, v13);
    _Block_release(v13);

    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v4, v1);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v8, v18);
    swift_release();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574D70B0);
    swift_allocObject();
    swift_retain();
    sub_2459B0F40();
  }
  return swift_release();
}

void sub_2459A1360(uint64_t a1, void *a2)
{
  uint64_t Strong;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  os_log_type_t v11;
  uint8_t *v12;
  _QWORD aBlock[6];

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v4 = Strong;
    swift_bridgeObjectRetain();
    v5 = sub_2459B0FE8();
    swift_bridgeObjectRelease();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_2459B0F7C();
    swift_release();
    swift_release();
    v6 = LOBYTE(aBlock[0]);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_2459B0F7C();
    swift_release();
    swift_release();
    v7 = LOBYTE(aBlock[0]);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_2459B0F7C();
    swift_release();
    swift_release();
    v8 = LOBYTE(aBlock[0]);
    aBlock[4] = sub_2459A31CC;
    aBlock[5] = v4;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2459A1B8C;
    aBlock[3] = &block_descriptor_86;
    v9 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(a2, sel_saveCommunicationSafetySettingsForDSID_checkForUnsafePhotos_communicationSafetyNotificationEnabled_communicationSafetyAnalyticsEnabled_completionHandler_, v5, v6, v7, v8, v9);
    _Block_release(v9);
    swift_release();
  }
  else
  {
    if (qword_2574D6DA0 != -1)
      swift_once();
    v10 = sub_2459B0F28();
    __swift_project_value_buffer(v10, (uint64_t)qword_2574D7A90);
    v5 = sub_2459B0F10();
    v11 = sub_2459B10A8();
    if (os_log_type_enabled(v5, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_24599C000, v5, v11, "STFoundation user is deallocated before saving communication safety changes.", v12, 2u);
      MEMORY[0x24953FBF4](v12, -1, -1);
    }
  }

}

void sub_2459A1608(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  id v7;
  id v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  os_log_t v25;
  uint64_t v26;
  os_log_t v27;
  uint64_t v28;
  os_log_t v29;

  v2 = sub_2459B0F28();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v6 = a1;
    if (qword_2574D6DA0 != -1)
      swift_once();
    __swift_project_value_buffer(v2, (uint64_t)qword_2574D7A90);
    v7 = a1;
    v8 = a1;
    v27 = (os_log_t)sub_2459B0F10();
    v9 = sub_2459B10A8();
    if (os_log_type_enabled(v27, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      v11 = swift_slowAlloc();
      v28 = (uint64_t)a1;
      v29 = (os_log_t)v11;
      *(_DWORD *)v10 = 136315138;
      v12 = a1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2574D7468);
      v13 = sub_2459B1018();
      v28 = sub_2459A7A18(v13, v14, (uint64_t *)&v29);
      sub_2459B1120();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_24599C000, v27, v9, "Error saving Comm Safety settings: %s", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24953FBF4](v11, -1, -1);
      MEMORY[0x24953FBF4](v10, -1, -1);

    }
    else
    {

    }
  }
  else
  {
    if (qword_2574D6DA0 != -1)
      swift_once();
    v15 = __swift_project_value_buffer(v2, (uint64_t)qword_2574D7A90);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v15, v2);
    swift_retain_n();
    v16 = sub_2459B0F10();
    v17 = sub_2459B109C();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = swift_slowAlloc();
      v27 = (os_log_t)swift_slowAlloc();
      v29 = v27;
      *(_DWORD *)v18 = 136315650;
      swift_getKeyPath();
      swift_getKeyPath();
      sub_2459B0F7C();
      swift_release();
      swift_release();
      if ((_BYTE)v28)
        v19 = 1702195828;
      else
        v19 = 0x65736C6166;
      if ((_BYTE)v28)
        v20 = 0xE400000000000000;
      else
        v20 = 0xE500000000000000;
      v28 = sub_2459A7A18(v19, v20, (uint64_t *)&v29);
      sub_2459B1120();
      swift_bridgeObjectRelease();
      swift_release_n();
      *(_WORD *)(v18 + 12) = 2080;
      swift_getKeyPath();
      swift_getKeyPath();
      sub_2459B0F7C();
      swift_release();
      swift_release();
      if ((_BYTE)v28)
        v21 = 1702195828;
      else
        v21 = 0x65736C6166;
      if ((_BYTE)v28)
        v22 = 0xE400000000000000;
      else
        v22 = 0xE500000000000000;
      v28 = sub_2459A7A18(v21, v22, (uint64_t *)&v29);
      sub_2459B1120();
      swift_bridgeObjectRelease();
      swift_release_n();
      *(_WORD *)(v18 + 22) = 2080;
      swift_getKeyPath();
      swift_getKeyPath();
      sub_2459B0F7C();
      swift_release();
      swift_release();
      if ((_BYTE)v28)
        v23 = 1702195828;
      else
        v23 = 0x65736C6166;
      if ((_BYTE)v28)
        v24 = 0xE400000000000000;
      else
        v24 = 0xE500000000000000;
      v28 = sub_2459A7A18(v23, v24, (uint64_t *)&v29);
      sub_2459B1120();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_24599C000, v16, v17, "User saved successfully checkForUnsafePhotos: %s, communicationSafetyNotificationEnabled: %s, communicationSafetyAnalyticsEnabled: %s", (uint8_t *)v18, 0x20u);
      v25 = v27;
      swift_arrayDestroy();
      MEMORY[0x24953FBF4](v25, -1, -1);
      MEMORY[0x24953FBF4](v18, -1, -1);
    }
    else
    {
      swift_release_n();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

void sub_2459A1B8C(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

uint64_t sub_2459A1BE0(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_2459A1C0C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D70B0);
  swift_allocObject();
  swift_retain();
  return sub_2459B0F40();
}

void sub_2459A1C5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD *v9;
  void *v10;
  _QWORD v11[6];

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v7 = (void *)objc_opt_self();
  swift_retain();
  v8 = objc_msgSend(v7, sel_sharedController);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = sub_2459A31F8;
  v9[4] = v6;
  v11[4] = sub_2459A325C;
  v11[5] = v9;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 1107296256;
  v11[2] = sub_2459A2158;
  v11[3] = &block_descriptor_95;
  v10 = _Block_copy(v11);
  swift_retain();
  swift_release();
  objc_msgSend(v8, sel_performBackgroundTask_, v10);
  _Block_release(v10);

}

void sub_2459A1D7C(void *a1, uint64_t a2, void (*a3)(void *, uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12[2];

  v12[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a2 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser_identifier);
  v6 = *(_QWORD *)(a2 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser_identifier + 8);
  swift_bridgeObjectRetain();
  v7 = (void *)sub_2459A2010(v5, v6, a1);
  swift_bridgeObjectRelease();
  if (v7)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_2459B0F7C();
    swift_release();
    swift_release();
    objc_msgSend(v7, sel_setIsCommunicationSafetySendingRestricted_, LOBYTE(v12[0]));
    swift_getKeyPath();
    swift_getKeyPath();
    sub_2459B0F7C();
    swift_release();
    swift_release();
    objc_msgSend(v7, sel_setIsCommunicationSafetyReceivingRestricted_, LOBYTE(v12[0]));
    swift_getKeyPath();
    swift_getKeyPath();
    sub_2459B0F7C();
    swift_release();
    swift_release();
    objc_msgSend(v7, sel_setIsCommunicationSafetyNotificationEnabled_, LOBYTE(v12[0]));
    swift_getKeyPath();
    swift_getKeyPath();
    sub_2459B0F7C();
    swift_release();
    swift_release();
    objc_msgSend(v7, sel_setIsCommunicationSafetyAnalyticsEnabled_, LOBYTE(v12[0]));
    v12[0] = 0;
    if (objc_msgSend(a1, sel_save_, v12))
    {
      v8 = v12[0];
      a3(0, 0);

    }
    else
    {
      v9 = v12[0];
      v10 = (void *)sub_2459B0EC8();

      swift_willThrow();
      v11 = v10;
      a3(v10, 1);

    }
  }
}

uint64_t sub_2459A2010(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t result;
  uint64_t v10;
  _QWORD aBlock[6];
  uint64_t v12;

  v12 = 0;
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = a1;
  v6[3] = a2;
  v6[4] = &v12;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_2459A328C;
  *(_QWORD *)(v7 + 24) = v6;
  aBlock[4] = sub_2459A32A8;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2459A28DC;
  aBlock[3] = &block_descriptor_104;
  v8 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(a3, sel_performBlockAndWait_, v8);
  _Block_release(v8);
  LOBYTE(a3) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((a3 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v10 = v12;
    swift_release();
    return v10;
  }
  return result;
}

void sub_2459A2158(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

void sub_2459A21A8(char a1, void (*a2)(_QWORD), uint64_t a3)
{
  uint64_t v3;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  _QWORD v19[6];

  v6 = *(void **)(v3 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser_authenticationSource);
  if (v6)
  {
    v8 = qword_2574D6DA0;
    swift_unknownObjectRetain();
    if (v8 != -1)
      swift_once();
    v9 = sub_2459B0F28();
    __swift_project_value_buffer(v9, (uint64_t)qword_2574D7A90);
    v10 = sub_2459B0F10();
    v11 = sub_2459B109C();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_24599C000, v10, v11, "Authenticating...", v12, 2u);
      MEMORY[0x24953FBF4](v12, -1, -1);
    }

    swift_bridgeObjectRetain();
    v13 = (void *)sub_2459B0FE8();
    swift_bridgeObjectRelease();
    v19[4] = a2;
    v19[5] = a3;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 1107296256;
    v19[2] = sub_2459A2420;
    v19[3] = &block_descriptor_63;
    v14 = _Block_copy(v19);
    swift_retain();
    swift_release();
    objc_msgSend(v6, sel_authenticateWithIdentifier_forced_completionHandler_, v13, a1 & 1, v14);
    _Block_release(v14);
    swift_unknownObjectRelease();

  }
  else
  {
    if (qword_2574D6DA0 != -1)
      swift_once();
    v15 = sub_2459B0F28();
    __swift_project_value_buffer(v15, (uint64_t)qword_2574D7A90);
    v16 = sub_2459B0F10();
    v17 = sub_2459B10A8();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_24599C000, v16, v17, "No authentication source found", v18, 2u);
      MEMORY[0x24953FBF4](v18, -1, -1);
    }

    a2(0);
  }
}

uint64_t sub_2459A2420(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t STSwiftUser.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = v0 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__checkForUnsafePhotos;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D6FF8);
  v3 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__communicationSafetyNotificationEnabled, v2);
  v3(v0 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__communicationSafetyAnalyticsEnabled, v2);
  swift_bridgeObjectRelease();
  v4 = v0 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__givenName;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D7020);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v3(v0 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__hasPasscode, v2);
  v3(v0 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__isParent, v2);
  v3(v0 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__isRemoteUser, v2);
  v3(v0 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__screenTimeEnabled, v2);
  v3(v0 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__syncingEnabled, v2);
  v6 = v0 + OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__familyMemberType;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D7060);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return v0;
}

uint64_t STSwiftUser.__deallocating_deinit()
{
  STSwiftUser.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_2459A25FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for STSwiftUser();
  result = sub_2459B0F34();
  *a1 = result;
  return result;
}

void sub_2459A2638(uint64_t a1, uint64_t a2, id *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  unint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22[2];

  v22[1] = *(id *)MEMORY[0x24BDAC8D0];
  v6 = objc_msgSend((id)objc_opt_self(), sel_fetchRequest);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D7470);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_2459B1AE0;
  sub_2459A330C(0, &qword_2574D7478);
  v8 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v7 + 56) = MEMORY[0x24BEE0D00];
  v9 = sub_2459A32C8();
  *(_QWORD *)(v7 + 32) = 1684632420;
  *(_QWORD *)(v7 + 40) = 0xE400000000000000;
  *(_QWORD *)(v7 + 96) = v8;
  *(_QWORD *)(v7 + 104) = v9;
  *(_QWORD *)(v7 + 64) = v9;
  *(_QWORD *)(v7 + 72) = a1;
  *(_QWORD *)(v7 + 80) = a2;
  swift_bridgeObjectRetain();
  v10 = (void *)sub_2459B1090();
  objc_msgSend(v6, sel_setPredicate_, v10);

  v22[0] = 0;
  v11 = objc_msgSend(v6, sel_execute_, v22);
  v12 = v22[0];
  if (!v11)
  {
    v18 = v22[0];
    v19 = (void *)sub_2459B0EC8();

    swift_willThrow();
LABEL_13:
    v6 = *a3;
    *a3 = 0;
    goto LABEL_14;
  }
  v13 = v11;
  sub_2459A330C(0, &qword_2574D7488);
  v14 = sub_2459B1060();
  v15 = v12;

  if (!(v14 >> 62))
  {
    if (*(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_4;
    goto LABEL_12;
  }
  swift_bridgeObjectRetain();
  v20 = sub_2459B121C();
  swift_bridgeObjectRelease();
  if (!v20)
  {
LABEL_12:
    swift_bridgeObjectRelease();

    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  v21 = sub_2459B121C();
  swift_bridgeObjectRelease();
  if (!v21)
  {
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
LABEL_4:
  if ((v14 & 0xC000000000000001) != 0)
  {
    v16 = (id)MEMORY[0x24953F6D8](0, v14);
  }
  else
  {
    if (!*(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10))
      __break(1u);
    v16 = *(id *)(v14 + 32);
  }
  v17 = v16;
  swift_bridgeObjectRelease();

  v6 = *a3;
  *a3 = v17;
LABEL_14:

}

uint64_t sub_2459A28DC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_2459A28FC(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

void sub_2459A290C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_2459A1C5C(a1, a2, v2);
}

uint64_t sub_2459A2914()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2459A2938()
{
  swift_release();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

void sub_2459A2964()
{
  uint64_t v0;

  sub_2459A1360(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
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

uint64_t sub_2459A2984(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24953FB64](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2459A29C4()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t sub_2459A29D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24599FA4C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__checkForUnsafePhotos, &qword_2574D6FF8);
}

uint64_t sub_2459A29F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24599FAB8(a1, a2, a3, a4, &qword_2574D7000, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__checkForUnsafePhotos, &qword_2574D6FF8);
}

uint64_t sub_2459A2A20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24599FA4C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__communicationSafetyNotificationEnabled, &qword_2574D6FF8);
}

uint64_t sub_2459A2A44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24599FAB8(a1, a2, a3, a4, &qword_2574D7000, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__communicationSafetyNotificationEnabled, &qword_2574D6FF8);
}

uint64_t sub_2459A2A70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24599FA4C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__communicationSafetyAnalyticsEnabled, &qword_2574D6FF8);
}

uint64_t sub_2459A2A94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24599FAB8(a1, a2, a3, a4, &qword_2574D7000, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__communicationSafetyAnalyticsEnabled, &qword_2574D6FF8);
}

uint64_t sub_2459A2AC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24599FA4C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__givenName, &qword_2574D7020);
}

uint64_t sub_2459A2AE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24599FAB8(a1, a2, a3, a4, &qword_2574D7028, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__givenName, &qword_2574D7020);
}

uint64_t sub_2459A2B10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24599FA4C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__hasPasscode, &qword_2574D6FF8);
}

uint64_t sub_2459A2B34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24599FAB8(a1, a2, a3, a4, &qword_2574D7000, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__hasPasscode, &qword_2574D6FF8);
}

uint64_t sub_2459A2B60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24599FA4C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__isParent, &qword_2574D6FF8);
}

uint64_t sub_2459A2B84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24599FAB8(a1, a2, a3, a4, &qword_2574D7000, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__isParent, &qword_2574D6FF8);
}

uint64_t sub_2459A2BB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24599FA4C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__isRemoteUser, &qword_2574D6FF8);
}

uint64_t sub_2459A2BD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24599FAB8(a1, a2, a3, a4, &qword_2574D7000, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__isRemoteUser, &qword_2574D6FF8);
}

uint64_t sub_2459A2C00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24599FA4C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__screenTimeEnabled, &qword_2574D6FF8);
}

uint64_t sub_2459A2C24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24599FAB8(a1, a2, a3, a4, &qword_2574D7000, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__screenTimeEnabled, &qword_2574D6FF8);
}

uint64_t sub_2459A2C50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24599FA4C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__syncingEnabled, &qword_2574D6FF8);
}

uint64_t sub_2459A2C74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24599FAB8(a1, a2, a3, a4, &qword_2574D7000, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__syncingEnabled, &qword_2574D6FF8);
}

uint64_t sub_2459A2CA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24599FA4C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__familyMemberType, &qword_2574D7060);
}

uint64_t sub_2459A2CC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24599FAB8(a1, a2, a3, a4, &qword_2574D7068, (uint64_t)&OBJC_IVAR____TtC15ScreenTimeSwift11STSwiftUser__familyMemberType, &qword_2574D7060);
}

uint64_t sub_2459A2CF0()
{
  return type metadata accessor for STSwiftUser();
}

void sub_2459A2CF8()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_2459A3134(319, &qword_2574D7108);
  if (v0 <= 0x3F)
  {
    sub_2459A3134(319, &qword_2574D7110);
    if (v1 <= 0x3F)
    {
      sub_2459A3178();
      if (v2 <= 0x3F)
        swift_updateClassMetadata2();
    }
  }
}

uint64_t method lookup function for STSwiftUser()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of STSwiftUser.checkForUnsafePhotos.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of STSwiftUser.checkForUnsafePhotos.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of STSwiftUser.checkForUnsafePhotos.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of STSwiftUser.$checkForUnsafePhotos.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of STSwiftUser.$checkForUnsafePhotos.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of STSwiftUser.$checkForUnsafePhotos.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of STSwiftUser.communicationSafetyNotificationEnabled.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of STSwiftUser.communicationSafetyNotificationEnabled.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of STSwiftUser.communicationSafetyNotificationEnabled.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of STSwiftUser.$communicationSafetyNotificationEnabled.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of STSwiftUser.$communicationSafetyNotificationEnabled.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of STSwiftUser.$communicationSafetyNotificationEnabled.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of STSwiftUser.communicationSafetyAnalyticsEnabled.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t dispatch thunk of STSwiftUser.communicationSafetyAnalyticsEnabled.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of STSwiftUser.communicationSafetyAnalyticsEnabled.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 304))();
}

uint64_t dispatch thunk of STSwiftUser.$communicationSafetyAnalyticsEnabled.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

uint64_t dispatch thunk of STSwiftUser.$communicationSafetyAnalyticsEnabled.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

uint64_t dispatch thunk of STSwiftUser.$communicationSafetyAnalyticsEnabled.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 328))();
}

uint64_t dispatch thunk of STSwiftUser.givenName.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 360))();
}

uint64_t dispatch thunk of STSwiftUser.givenName.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 368))();
}

uint64_t dispatch thunk of STSwiftUser.givenName.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 376))();
}

uint64_t dispatch thunk of STSwiftUser.$givenName.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 384))();
}

uint64_t dispatch thunk of STSwiftUser.$givenName.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 392))();
}

uint64_t dispatch thunk of STSwiftUser.$givenName.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 400))();
}

uint64_t dispatch thunk of STSwiftUser.hasPasscode.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 408))();
}

uint64_t dispatch thunk of STSwiftUser.hasPasscode.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 416))();
}

uint64_t dispatch thunk of STSwiftUser.hasPasscode.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 424))();
}

uint64_t dispatch thunk of STSwiftUser.$hasPasscode.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 432))();
}

uint64_t dispatch thunk of STSwiftUser.$hasPasscode.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 440))();
}

uint64_t dispatch thunk of STSwiftUser.$hasPasscode.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 448))();
}

uint64_t dispatch thunk of STSwiftUser.isParent.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 456))();
}

uint64_t dispatch thunk of STSwiftUser.isParent.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 464))();
}

uint64_t dispatch thunk of STSwiftUser.isParent.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 472))();
}

uint64_t dispatch thunk of STSwiftUser.$isParent.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 480))();
}

uint64_t dispatch thunk of STSwiftUser.$isParent.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 488))();
}

uint64_t dispatch thunk of STSwiftUser.$isParent.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 496))();
}

uint64_t dispatch thunk of STSwiftUser.isRemoteUser.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 504))();
}

uint64_t dispatch thunk of STSwiftUser.isRemoteUser.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 512))();
}

uint64_t dispatch thunk of STSwiftUser.isRemoteUser.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 520))();
}

uint64_t dispatch thunk of STSwiftUser.$isRemoteUser.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 528))();
}

uint64_t dispatch thunk of STSwiftUser.$isRemoteUser.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 536))();
}

uint64_t dispatch thunk of STSwiftUser.$isRemoteUser.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 544))();
}

uint64_t dispatch thunk of STSwiftUser.screenTimeEnabled.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 552))();
}

uint64_t dispatch thunk of STSwiftUser.screenTimeEnabled.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 560))();
}

uint64_t dispatch thunk of STSwiftUser.screenTimeEnabled.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 568))();
}

uint64_t dispatch thunk of STSwiftUser.$screenTimeEnabled.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 576))();
}

uint64_t dispatch thunk of STSwiftUser.$screenTimeEnabled.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 584))();
}

uint64_t dispatch thunk of STSwiftUser.$screenTimeEnabled.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 592))();
}

uint64_t dispatch thunk of STSwiftUser.syncingEnabled.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 600))();
}

uint64_t dispatch thunk of STSwiftUser.syncingEnabled.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 608))();
}

uint64_t dispatch thunk of STSwiftUser.syncingEnabled.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 616))();
}

uint64_t dispatch thunk of STSwiftUser.$syncingEnabled.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 624))();
}

uint64_t dispatch thunk of STSwiftUser.$syncingEnabled.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 632))();
}

uint64_t dispatch thunk of STSwiftUser.$syncingEnabled.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 640))();
}

uint64_t dispatch thunk of STSwiftUser.familyMemberType.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 648))();
}

uint64_t dispatch thunk of STSwiftUser.familyMemberType.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 656))();
}

uint64_t dispatch thunk of STSwiftUser.familyMemberType.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 664))();
}

uint64_t dispatch thunk of STSwiftUser.$familyMemberType.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 672))();
}

uint64_t dispatch thunk of STSwiftUser.$familyMemberType.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 680))();
}

uint64_t dispatch thunk of STSwiftUser.$familyMemberType.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 688))();
}

uint64_t dispatch thunk of STSwiftUser.__allocating_init(identifier:givenName:hasPasscode:isParent:isRemoteUser:checkForUnsafePhotos:communicationSafetyNotificationEnabled:communicationSafetyAnalyticsEnabled:screenTimeEnabled:syncingEnabled:familyMemberType:persistenceSource:authenticationSource:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 768))();
}

uint64_t dispatch thunk of STSwiftUser.identifierString()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 776))();
}

uint64_t dispatch thunk of STSwiftUser.update(with:persistenceSource:authenticationSource:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 784))();
}

uint64_t dispatch thunk of STSwiftUser.save()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 792))();
}

uint64_t dispatch thunk of STSwiftUser.saveAsBackgroundTask()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 800))();
}

uint64_t dispatch thunk of STSwiftUser.authenticate(forced:completionHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 808))();
}

void sub_2459A3134(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_2459B0F94();
    if (!v4)
      atomic_store(v3, a2);
  }
}

void sub_2459A3178()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2574D7118[0])
  {
    type metadata accessor for STFamilyMemberType(255);
    v0 = sub_2459B0F94();
    if (!v1)
      atomic_store(v0, qword_2574D7118);
  }
}

void sub_2459A31CC(void *a1)
{
  sub_2459A1608(a1);
}

uint64_t sub_2459A31D4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2459A31F8(uint64_t a1, char a2)
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

uint64_t sub_2459A3230()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_2459A325C(void *a1)
{
  uint64_t v1;

  sub_2459A1D7C(a1, *(_QWORD *)(v1 + 16), *(void (**)(void *, uint64_t))(v1 + 24));
}

uint64_t sub_2459A3268()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_2459A328C()
{
  uint64_t v0;

  sub_2459A2638(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(id **)(v0 + 32));
}

uint64_t sub_2459A3298()
{
  return swift_deallocObject();
}

uint64_t sub_2459A32A8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_2459A32C8()
{
  unint64_t result;

  result = qword_2574D7480;
  if (!qword_2574D7480)
  {
    result = MEMORY[0x24953FB64](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2574D7480);
  }
  return result;
}

uint64_t sub_2459A330C(uint64_t a1, unint64_t *a2)
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

void sub_2459A3364()
{
  strcpy((char *)&qword_2574D7AD8, "restrictions");
  unk_2574D7AE5 = 0;
  unk_2574D7AE6 = -5120;
}

id sub_2459A3390()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v1 = *(void **)(v0 + 16);
  if (v1)
  {
    v2 = *(id *)(v0 + 16);
  }
  else
  {
    if (qword_2574D6DB8 != -1)
      swift_once();
    sub_2459B100C();
    v3 = objc_allocWithZone(MEMORY[0x24BE63F38]);
    swift_bridgeObjectRetain();
    v4 = (void *)sub_2459B0FE8();
    swift_bridgeObjectRelease();
    v5 = (void *)sub_2459B0FE8();
    swift_bridgeObjectRelease();
    v6 = objc_msgSend(v3, sel_initWithName_sharedContainer_, v4, v5);

    v7 = *(void **)(v0 + 16);
    *(_QWORD *)(v0 + 16) = v6;
    v2 = v6;

    v1 = 0;
  }
  v8 = v1;
  return v2;
}

void sub_2459A34A0()
{
  strcpy((char *)&qword_2574D7AE8, "always_allow");
  unk_2574D7AF5 = 0;
  unk_2574D7AF6 = -5120;
}

id sub_2459A34CC()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v1 = *(void **)(v0 + 24);
  if (v1)
  {
    v2 = *(id *)(v0 + 24);
  }
  else
  {
    if (qword_2574D6DC0 != -1)
      swift_once();
    sub_2459B100C();
    v3 = objc_allocWithZone(MEMORY[0x24BE63F38]);
    swift_bridgeObjectRetain();
    v4 = (void *)sub_2459B0FE8();
    swift_bridgeObjectRelease();
    v5 = (void *)sub_2459B0FE8();
    swift_bridgeObjectRelease();
    v6 = objc_msgSend(v3, sel_initWithName_sharedContainer_, v4, v5);

    v7 = *(void **)(v0 + 24);
    *(_QWORD *)(v0 + 24) = v6;
    v2 = v6;

    v1 = 0;
  }
  v8 = v1;
  return v2;
}

void sub_2459A35DC()
{
  qword_2574D7AF8 = 0x656D69746E776F64;
  unk_2574D7B00 = 0xE800000000000000;
}

id sub_2459A3600()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  id v5;

  v1 = *(void **)(v0 + 32);
  if (v1)
  {
    v2 = *(id *)(v0 + 32);
  }
  else
  {
    v3 = sub_2459A3654();
    v4 = *(void **)(v0 + 32);
    *(_QWORD *)(v0 + 32) = v3;
    v2 = v3;

    v1 = 0;
  }
  v5 = v1;
  return v2;
}

id sub_2459A3654()
{
  id v0;
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v0 = objc_msgSend((id)objc_opt_self(), sel_storesForSharedContainer_, *MEMORY[0x24BE84750]);
  v1 = sub_2459B1078();

  if (qword_2574D6DC8 != -1)
    swift_once();
  sub_2459B100C();
  v2 = objc_allocWithZone(MEMORY[0x24BE63F38]);
  swift_bridgeObjectRetain();
  v3 = (void *)sub_2459B0FE8();
  swift_bridgeObjectRelease();
  v4 = (void *)sub_2459B0FE8();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v2, sel_initWithName_sharedContainer_, v3, v4);

  v6 = qword_2574D7AF8;
  v7 = unk_2574D7B00;
  swift_bridgeObjectRetain();
  LOBYTE(v6) = sub_2459A37CC(v6, v7, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v6 & 1) == 0)
    objc_msgSend(v5, sel_setActive_, 0);
  return v5;
}

uint64_t sub_2459A37CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
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

  if (*(_QWORD *)(a3 + 16))
  {
    sub_2459B12B8();
    sub_2459B1024();
    v6 = sub_2459B12E8();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_2459B1264() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_2459B1264() & 1) != 0)
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

id sub_2459A3900()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v1 = *(void **)(v0 + 40);
  if (v1)
  {
    v2 = *(id *)(v0 + 40);
  }
  else
  {
    sub_2459B100C();
    v3 = objc_allocWithZone(MEMORY[0x24BE63F38]);
    v4 = (void *)sub_2459B0FE8();
    v5 = (void *)sub_2459B0FE8();
    swift_bridgeObjectRelease();
    v6 = objc_msgSend(v3, sel_initWithName_sharedContainer_, v4, v5);

    v7 = *(void **)(v0 + 40);
    *(_QWORD *)(v0 + 40) = v6;
    v2 = v6;

    v1 = 0;
  }
  v8 = v1;
  return v2;
}

id sub_2459A39DC()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v1 = *(void **)(v0 + 48);
  if (v1)
  {
    v2 = *(id *)(v0 + 48);
  }
  else
  {
    sub_2459B100C();
    v3 = objc_allocWithZone(MEMORY[0x24BE63F38]);
    v4 = (void *)sub_2459B0FE8();
    v5 = (void *)sub_2459B0FE8();
    swift_bridgeObjectRelease();
    v6 = objc_msgSend(v3, sel_initWithName_sharedContainer_, v4, v5);

    v7 = *(void **)(v0 + 48);
    *(_QWORD *)(v0 + 48) = v6;
    v2 = v6;

    v1 = 0;
  }
  v8 = v1;
  return v2;
}

uint64_t static LocalRestrictions.LocalRestrictionsError.== infix(_:_:)()
{
  return 1;
}

uint64_t LocalRestrictions.LocalRestrictionsError.hash(into:)()
{
  return sub_2459B12C4();
}

uint64_t LocalRestrictions.LocalRestrictionsError.hashValue.getter()
{
  sub_2459B12B8();
  sub_2459B12C4();
  return sub_2459B12E8();
}

uint64_t sub_2459A3B24()
{
  return 1;
}

uint64_t sub_2459A3B2C()
{
  sub_2459B12B8();
  sub_2459B12C4();
  return sub_2459B12E8();
}

uint64_t sub_2459A3B6C()
{
  return sub_2459B12C4();
}

uint64_t sub_2459A3B90()
{
  sub_2459B12B8();
  sub_2459B12C4();
  return sub_2459B12E8();
}

uint64_t LocalRestrictions.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_QWORD *)(v0 + 48) = 0;
  v1 = OBJC_IVAR____TtC15ScreenTimeSwift17LocalRestrictions_logger;
  if (qword_2574D6DA8 != -1)
    swift_once();
  v2 = sub_2459B0F28();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2574D7AA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v0 + v1, v3, v2);
  return v0;
}

uint64_t LocalRestrictions.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  v1 = OBJC_IVAR____TtC15ScreenTimeSwift17LocalRestrictions_logger;
  if (qword_2574D6DA8 != -1)
    swift_once();
  v2 = sub_2459B0F28();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2574D7AA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v0 + v1, v3, v2);
  return v0;
}

void sub_2459A3D18()
{
  id v0;

  v0 = sub_2459A3390();
  objc_msgSend(v0, sel_clearAllSettings);

}

void sub_2459A3D48(_QWORD *a1@<X8>)
{
  id v2;
  id v3;
  id v4;

  v2 = sub_2459A3390();
  v3 = objc_msgSend(v2, sel_userSafety);

  v4 = objc_msgSend(v3, sel_scanningPolicy);
  if (!v4)
    v4 = objc_msgSend((id)objc_opt_self(), sel_nonePolicy);
  *a1 = v4;
}

void sub_2459A3DE0(id *a1)
{
  id v1;
  id v2;
  id v3;

  v3 = *a1;
  v1 = sub_2459A3390();
  v2 = objc_msgSend(v1, sel_userSafety);

  objc_msgSend(v2, sel_setScanningPolicy_, v3);
}

id sub_2459A3E50()
{
  id v0;
  id v1;
  id v2;

  v0 = sub_2459A3390();
  v1 = objc_msgSend(v0, sel_userSafety);

  v2 = objc_msgSend(v1, sel_scanningPolicy);
  if (v2)
    return v2;
  else
    return objc_msgSend((id)objc_opt_self(), sel_nonePolicy);
}

void sub_2459A3EDC(void *a1)
{
  id v1;
  id v2;

  v1 = sub_2459A3390();
  v2 = objc_msgSend(v1, sel_userSafety);

  objc_msgSend(v2, sel_setScanningPolicy_, a1);
}

void (*sub_2459A3F40(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  id v3;
  id v4;
  id v5;

  a1[1] = v1;
  v3 = sub_2459A3390();
  v4 = objc_msgSend(v3, sel_userSafety);

  v5 = objc_msgSend(v4, sel_scanningPolicy);
  if (!v5)
    v5 = objc_msgSend((id)objc_opt_self(), sel_nonePolicy);
  *a1 = v5;
  return sub_2459A3FE4;
}

void sub_2459A3FE4(void **a1, char a2)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;

  v2 = *a1;
  if ((a2 & 1) != 0)
  {
    v3 = v2;
    v4 = sub_2459A3390();
    v6 = objc_msgSend(v4, sel_userSafety);

    objc_msgSend(v6, sel_setScanningPolicy_, v3);
  }
  else
  {
    v5 = sub_2459A3390();
    v6 = objc_msgSend(v5, sel_userSafety);

    objc_msgSend(v6, sel_setScanningPolicy_, v2);
  }

}

void sub_2459A409C(char a1)
{
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v2 = sub_2459A3900();
  v3 = objc_msgSend(v2, sel_account);

  v4 = a1 & 1;
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, v4);
  objc_msgSend(v3, sel_setDenyiCloudLogout_, v5);

  v6 = sub_2459A3900();
  v7 = objc_msgSend(v6, sel_dateAndTime);

  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, v4);
  objc_msgSend(v7, sel_setRequireAutomaticDateAndTime_, v8);

}

void sub_2459A418C(void *a1)
{
  id v2;
  id v3;
  id v4;

  v2 = sub_2459A39DC();
  v3 = objc_msgSend(v2, sel_webContent);
  v4 = sub_2459AA6B4(a1);
  objc_msgSend(v3, sel_setBlockedByFilter_, v4);

}

void sub_2459A4204(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  unint64_t v17;
  id v18;
  unint64_t v19;

  if (!a1 || (v1 = objc_msgSend(a1, sel_payloadApps)) == 0)
  {
    v10 = sub_2459A34CC();
    v5 = objc_msgSend(v10, sel_shield);

    v11 = objc_msgSend((id)objc_opt_self(), sel_defaultAlwaysAllowBundleIDs);
    v12 = sub_2459B1060();

    v13 = *(_QWORD *)(v12 + 16);
    if (v13)
    {
      v19 = MEMORY[0x24BEE4AF8];
      sub_2459B11EC();
      v14 = v12 + 40;
      do
      {
        v15 = objc_allocWithZone(MEMORY[0x24BE63F10]);
        swift_bridgeObjectRetain();
        v16 = (void *)sub_2459B0FE8();
        swift_bridgeObjectRelease();
        objc_msgSend(v15, sel_initWithBundleIdentifier_, v16);

        sub_2459B11D4();
        sub_2459B11F8();
        sub_2459B1204();
        sub_2459B11E0();
        v14 += 16;
        --v13;
      }
      while (v13);
      goto LABEL_10;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    v17 = MEMORY[0x24BEE4AF8];
    goto LABEL_12;
  }
  v2 = v1;
  v3 = sub_2459B1060();

  v4 = sub_2459A34CC();
  v5 = objc_msgSend(v4, sel_shield);

  v6 = *(_QWORD *)(v3 + 16);
  if (!v6)
    goto LABEL_11;
  v19 = MEMORY[0x24BEE4AF8];
  sub_2459B11EC();
  v7 = v3 + 40;
  do
  {
    v8 = objc_allocWithZone(MEMORY[0x24BE63F10]);
    swift_bridgeObjectRetain();
    v9 = (void *)sub_2459B0FE8();
    swift_bridgeObjectRelease();
    objc_msgSend(v8, sel_initWithBundleIdentifier_, v9);

    sub_2459B11D4();
    sub_2459B11F8();
    sub_2459B1204();
    sub_2459B11E0();
    v7 += 16;
    --v6;
  }
  while (v6);
LABEL_10:
  v17 = v19;
  swift_bridgeObjectRelease();
LABEL_12:
  sub_2459AAFAC(v17, &qword_2574D7498, 0x24BE63F10, &qword_2574D74A0, &qword_2574D77C8);
  swift_bridgeObjectRelease();
  sub_2459A330C(0, &qword_2574D7498);
  sub_2459AAAA8(&qword_2574D74A0, &qword_2574D7498);
  v18 = (id)sub_2459B106C();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_setUnshieldableApplications_, v18);

}

void sub_2459A4520(char a1, char a2)
{
  id *v2;
  id v3;
  id v4;
  id v5;
  uint64_t inited;
  id v7;
  void *v8;

  v2 = (id *)MEMORY[0x24BE63EA8];
  if ((a2 & 1) == 0)
    v2 = (id *)MEMORY[0x24BE63EB8];
  if ((a1 & 1) == 0)
    v2 = (id *)MEMORY[0x24BE63EC8];
  v3 = *v2;
  v4 = sub_2459A3600();
  v5 = objc_msgSend(v4, sel_screenTime);

  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D74A8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2459B1E70;
  *(_QWORD *)(inited + 32) = objc_msgSend((id)objc_opt_self(), sel_all);
  *(_QWORD *)(inited + 40) = v3;
  v7 = v3;
  sub_2459A468C(inited);
  sub_2459A330C(0, &qword_2574D74B0);
  type metadata accessor for MOScreenTimeShieldPolicy(0);
  sub_2459AAAA8(&qword_2574D74B8, &qword_2574D74B0);
  v8 = (void *)sub_2459B0FD0();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_setCategoryShieldPolicies_, v8);

}

unint64_t sub_2459A468C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  void *v5;
  id v6;
  id v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D77B0);
  v2 = (_QWORD *)sub_2459B1240();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 40);
  while (1)
  {
    v5 = *v4;
    v6 = *(v4 - 1);
    v7 = v5;
    result = sub_2459A8DEC((uint64_t)v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = 8 * result;
    *(_QWORD *)(v2[6] + v10) = v6;
    *(_QWORD *)(v2[7] + v10) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
    v4 += 2;
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

unint64_t sub_2459A4794(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D7778);
  v2 = (_QWORD *)sub_2459B1240();
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
    result = sub_2459A8ED0(v5, v6);
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

uint64_t sub_2459A48AC(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[6];

  v2 = objc_msgSend((id)objc_opt_self(), sel_storesForSharedContainer_, *MEMORY[0x24BE84750]);
  v3 = sub_2459B1078();

  if (qword_2574D6DC8 != -1)
    swift_once();
  v4 = qword_2574D7AF8;
  v5 = unk_2574D7B00;
  swift_bridgeObjectRetain();
  LOBYTE(v4) = sub_2459A37CC(v4, v5, v3);
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if ((v4 & 1) != 0)
  {
    v7 = sub_2459A3600();
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = a1;
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = sub_2459AAAF8;
    *(_QWORD *)(v9 + 24) = v8;
    v11[4] = sub_2459A32A8;
    v11[5] = v9;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 1107296256;
    v11[2] = sub_2459A4D7C;
    v11[3] = &block_descriptor_0;
    v10 = _Block_copy(v11);
    swift_retain();
    swift_release();
    objc_msgSend(v7, sel_batchUpdate_, v10);

    _Block_release(v10);
    LOBYTE(v7) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = swift_release();
    if ((v7 & 1) != 0)
      __break(1u);
  }
  return result;
}

void sub_2459A4A8C(id a1, unint64_t a2)
{
  id v3;
  void *ObjCClassFromMetadata;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  if (a2 <= 4)
  {
    if (((1 << a2) & 0xB) != 0)
      objc_msgSend(a1, sel_setActive_, 0);
    else
      objc_msgSend(a1, sel_setActive_, 1);
    v3 = objc_msgSend(a1, sel_shield);
    sub_2459A330C(0, &qword_2574D7788);
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    sub_2459A330C(0, &qword_2574D7498);
    v5 = (void *)sub_2459B1054();
    v6 = objc_msgSend(ObjCClassFromMetadata, sel_allPolicyWithExcludedContent_, v5);

    objc_msgSend(v3, sel_setApplicationCategories_, v6);
    v7 = objc_msgSend(a1, sel_shield);
    sub_2459A330C(0, &qword_2574D77A0);
    v8 = (void *)swift_getObjCClassFromMetadata();
    sub_2459A330C(0, &qword_2574D7790);
    v9 = (void *)sub_2459B1054();
    v10 = objc_msgSend(v8, sel_allPolicyWithExcludedContent_, v9);

    objc_msgSend(v7, sel_setWebDomainCategories_, v10);
  }
}

void sub_2459A4D7C(uint64_t a1, void *a2)
{
  void (*v2)(void);
  id v3;

  v2 = *(void (**)(void))(a1 + 32);
  v3 = a2;
  v2();

}

uint64_t sub_2459A4DB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  uint64_t result;
  _QWORD v18[6];

  v8 = objc_msgSend((id)objc_opt_self(), sel_storesForSharedContainer_, *MEMORY[0x24BE84750]);
  v9 = sub_2459B1078();

  sub_2459B100C();
  v10 = objc_allocWithZone(MEMORY[0x24BE63F38]);
  swift_bridgeObjectRetain();
  v11 = (void *)sub_2459B0FE8();
  swift_bridgeObjectRelease();
  v12 = (void *)sub_2459B0FE8();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v10, sel_initWithName_sharedContainer_, v11, v12);

  v14 = (_QWORD *)swift_allocObject();
  v14[2] = v9;
  v14[3] = a1;
  v14[4] = a2;
  v14[5] = a3;
  v14[6] = a4;
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = sub_2459AAB64;
  *(_QWORD *)(v15 + 24) = v14;
  v18[4] = sub_2459AC7EC;
  v18[5] = v15;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 1107296256;
  v18[2] = sub_2459A4D7C;
  v18[3] = &block_descriptor_13;
  v16 = _Block_copy(v18);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_release();
  objc_msgSend(v13, sel_batchUpdate_, v16);

  _Block_release(v16);
  LOBYTE(a3) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((a3 & 1) != 0)
    __break(1u);
  return result;
}

void sub_2459A4FDC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  SEL *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  unint64_t v24;
  unint64_t v25;

  if ((sub_2459A37CC(a3, a4, a2) & 1) == 0)
    objc_msgSend(a1, sel_setActive_, 0);
  v9 = (SEL *)&unk_2516BC000;
  v10 = objc_msgSend(a1, sel_shield);
  if (a5)
  {
    v11 = *(_QWORD *)(a5 + 16);
    v12 = MEMORY[0x24BEE4AF8];
    if (v11)
    {
      v24 = MEMORY[0x24BEE4AF8];
      swift_bridgeObjectRetain();
      sub_2459B11EC();
      v13 = a5 + 40;
      do
      {
        v14 = objc_allocWithZone(MEMORY[0x24BE63F10]);
        swift_bridgeObjectRetain();
        v15 = (void *)sub_2459B0FE8();
        swift_bridgeObjectRelease();
        objc_msgSend(v14, sel_initWithBundleIdentifier_, v15);

        sub_2459B11D4();
        sub_2459B11F8();
        sub_2459B1204();
        sub_2459B11E0();
        v13 += 16;
        --v11;
      }
      while (v11);
      v12 = v24;
      swift_bridgeObjectRelease();
      v9 = (SEL *)&unk_2516BC000;
    }
  }
  else
  {
    v12 = MEMORY[0x24BEE4AF8];
  }
  sub_2459AAFAC(v12, &qword_2574D7498, 0x24BE63F10, &qword_2574D74A0, &qword_2574D77C8);
  swift_bridgeObjectRelease();
  sub_2459A330C(0, &qword_2574D7498);
  sub_2459AAAA8(&qword_2574D74A0, &qword_2574D7498);
  v16 = (void *)sub_2459B106C();
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_setUnshieldableApplications_, v16);

  v17 = objc_msgSend(a1, v9[425]);
  if (a6)
  {
    v18 = *(_QWORD *)(a6 + 16);
    v19 = MEMORY[0x24BEE4AF8];
    if (v18)
    {
      v25 = MEMORY[0x24BEE4AF8];
      swift_bridgeObjectRetain();
      sub_2459B11EC();
      v20 = a6 + 40;
      do
      {
        v21 = objc_allocWithZone(MEMORY[0x24BE63F60]);
        swift_bridgeObjectRetain();
        v22 = (void *)sub_2459B0FE8();
        swift_bridgeObjectRelease();
        objc_msgSend(v21, sel_initWithDomain_, v22);

        sub_2459B11D4();
        sub_2459B11F8();
        sub_2459B1204();
        sub_2459B11E0();
        v20 += 16;
        --v18;
      }
      while (v18);
      v19 = v25;
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v19 = MEMORY[0x24BEE4AF8];
  }
  sub_2459AAFAC(v19, &qword_2574D7790, 0x24BE63F60, &qword_2574D7798, &qword_2574D77C0);
  swift_bridgeObjectRelease();
  sub_2459A330C(0, &qword_2574D7790);
  sub_2459AAAA8(&qword_2574D7798, &qword_2574D7790);
  v23 = (id)sub_2459B106C();
  swift_bridgeObjectRelease();
  objc_msgSend(v17, sel_setUnshieldableWebDomains_, v23);

}

uint64_t sub_2459A537C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7)
{
  uint64_t v7;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t result;
  _QWORD aBlock[6];

  v12 = objc_msgSend((id)objc_opt_self(), sel_storesForSharedContainer_, *MEMORY[0x24BE84750]);
  v13 = sub_2459B1078();

  sub_2459B100C();
  v14 = objc_allocWithZone(MEMORY[0x24BE63F38]);
  swift_bridgeObjectRetain();
  v15 = (void *)sub_2459B0FE8();
  swift_bridgeObjectRelease();
  v16 = (void *)sub_2459B0FE8();
  swift_bridgeObjectRelease();
  v17 = objc_msgSend(v14, sel_initWithName_sharedContainer_, v15, v16);

  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v13;
  *(_QWORD *)(v18 + 24) = a1;
  *(_QWORD *)(v18 + 32) = a2;
  *(_QWORD *)(v18 + 40) = v7;
  *(_BYTE *)(v18 + 48) = a6;
  *(_BYTE *)(v18 + 49) = a7;
  *(_QWORD *)(v18 + 56) = a3;
  *(_QWORD *)(v18 + 64) = a4;
  *(_QWORD *)(v18 + 72) = a5;
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = sub_2459AABD0;
  *(_QWORD *)(v19 + 24) = v18;
  aBlock[4] = sub_2459AC7EC;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2459A4D7C;
  aBlock[3] = &block_descriptor_23;
  v20 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_release();
  objc_msgSend(v17, sel_batchUpdate_, v20);

  _Block_release(v20);
  LOBYTE(v20) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v20 & 1) != 0)
    __break(1u);
  return result;
}

void sub_2459A55DC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v14;
  uint64_t v15;
  id *v16;
  SEL *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  char isUniquelyReferenced_nonNull_native;
  char v30;
  unint64_t v31;
  uint64_t v32;
  _BOOL8 v33;
  uint64_t v34;
  char v35;
  unint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  BOOL v40;
  uint64_t v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;
  id v52;
  char v53;
  char v54;
  unint64_t v55;
  uint64_t v56;
  _BOOL8 v57;
  uint64_t v58;
  char v59;
  unint64_t v60;
  char v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  void *v66;
  uint64_t v67;
  id v68;
  void *v69;
  uint64_t v70;
  _QWORD *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  void *v76;
  id v77;
  id v78;
  char v79;
  char v80;
  unint64_t v81;
  uint64_t v82;
  _BOOL8 v83;
  uint64_t v84;
  char v85;
  unint64_t v86;
  char v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  id v91;
  void *v92;
  id v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  id v97;
  void *v98;
  void *v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  void *ObjCClassFromMetadata;
  void *v105;
  unint64_t v106;
  void *v107;
  id v108;
  id v109;
  uint64_t v110;
  uint64_t v111;
  id v112;
  void *v113;
  void *v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  unint64_t *v122;
  id v123;
  id v124;
  id v125;
  void *v126;
  uint64_t v127;
  id v128;
  id v129;
  unint64_t v130;
  unint64_t v131;

  v15 = a9;
  v14 = a10;
  if ((sub_2459A37CC(a3, a4, a2) & 1) == 0)
    objc_msgSend(a1, sel_setActive_, 0);
  v16 = (id *)MEMORY[0x24BE63EA8];
  if ((a7 & 1) == 0)
    v16 = (id *)MEMORY[0x24BE63EB8];
  if ((a6 & 1) == 0)
    v16 = (id *)MEMORY[0x24BE63EC8];
  v129 = *v16;
  v17 = (SEL *)&unk_2516BC000;
  v18 = objc_msgSend(a1, sel_screenTime);
  v19 = v18;
  v20 = a1;
  v126 = a1;
  v127 = a8;
  if (a8)
  {
    v123 = v18;
    v21 = *(_QWORD *)(a8 + 16);
    if (v21)
    {
      swift_bridgeObjectRetain_n();
      v22 = (_QWORD *)MEMORY[0x24BEE4B00];
      v23 = a8 + 40;
      do
      {
        v25 = objc_allocWithZone(MEMORY[0x24BE63F10]);
        swift_bridgeObjectRetain();
        v26 = (void *)sub_2459B0FE8();
        v27 = objc_msgSend(v25, sel_initWithBundleIdentifier_, v26);

        v28 = v129;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v31 = sub_2459A8E38((uint64_t)v27);
        v32 = v22[2];
        v33 = (v30 & 1) == 0;
        v34 = v32 + v33;
        if (__OFADD__(v32, v33))
        {
          __break(1u);
LABEL_86:
          __break(1u);
LABEL_87:
          __break(1u);
LABEL_88:
          __break(1u);
LABEL_89:
          __break(1u);
LABEL_90:
          __break(1u);
LABEL_91:
          v122 = &qword_2574D7498;
          goto LABEL_94;
        }
        v35 = v30;
        if (v22[3] >= v34)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            sub_2459A93F0(&qword_2574D77A8);
        }
        else
        {
          sub_2459A9124(v34, isUniquelyReferenced_nonNull_native, &qword_2574D77A8);
          v36 = sub_2459A8E38((uint64_t)v27);
          if ((v35 & 1) != (v37 & 1))
            goto LABEL_91;
          v31 = v36;
        }
        v38 = 8 * v31;
        if ((v35 & 1) != 0)
        {
          v24 = v22[7];

          *(_QWORD *)(v24 + v38) = v28;
        }
        else
        {
          v22[(v31 >> 6) + 8] |= 1 << v31;
          *(_QWORD *)(v22[6] + 8 * v31) = v27;
          *(_QWORD *)(v22[7] + 8 * v31) = v28;
          v39 = v22[2];
          v40 = __OFADD__(v39, 1);
          v41 = v39 + 1;
          if (v40)
            goto LABEL_88;
          v22[2] = v41;
          v42 = v27;
        }
        v23 += 16;
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        --v21;
      }
      while (v21);
      swift_bridgeObjectRelease();
      v14 = a10;
      v20 = v126;
      v17 = (SEL *)&unk_2516BC000;
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    sub_2459A330C(0, &qword_2574D7498);
    type metadata accessor for MOScreenTimeShieldPolicy(0);
    sub_2459AAAA8(&qword_2574D74A0, &qword_2574D7498);
    v43 = (void *)sub_2459B0FD0();
    swift_bridgeObjectRelease();
    v19 = v123;
  }
  else
  {
    v43 = 0;
  }
  objc_msgSend(v19, sel_setApplicationShieldPolicies_, v43);

  v44 = objc_msgSend(v20, v17[430]);
  v45 = v44;
  if (!a9)
  {
    v66 = 0;
    v67 = v127;
    goto LABEL_43;
  }
  v124 = v44;
  v46 = *(_QWORD *)(a9 + 16);
  if (!v46)
  {
    swift_bridgeObjectRetain();
LABEL_42:
    swift_bridgeObjectRelease();
    sub_2459A330C(0, &qword_2574D74B0);
    type metadata accessor for MOScreenTimeShieldPolicy(0);
    sub_2459AAAA8(&qword_2574D74B8, &qword_2574D74B0);
    v66 = (void *)sub_2459B0FD0();
    swift_bridgeObjectRelease();
    v67 = v127;
    v45 = v124;
LABEL_43:
    objc_msgSend(v45, sel_setCategoryShieldPolicies_, v66);

    v68 = objc_msgSend(v20, v17[430]);
    v69 = v68;
    if (v14)
    {
      v70 = *(_QWORD *)(v14 + 16);
      if (v70)
      {
        v125 = v68;
        swift_bridgeObjectRetain_n();
        v71 = (_QWORD *)MEMORY[0x24BEE4B00];
        v72 = v14 + 40;
        while (1)
        {
          v75 = objc_allocWithZone(MEMORY[0x24BE63F60]);
          swift_bridgeObjectRetain();
          v76 = (void *)sub_2459B0FE8();
          v77 = objc_msgSend(v75, sel_initWithDomain_, v76);

          v78 = v129;
          v79 = swift_isUniquelyReferenced_nonNull_native();
          v81 = sub_2459A8E84((uint64_t)v77);
          v82 = v71[2];
          v83 = (v80 & 1) == 0;
          v84 = v82 + v83;
          if (__OFADD__(v82, v83))
            goto LABEL_87;
          v85 = v80;
          if (v71[3] >= v84)
          {
            if ((v79 & 1) != 0)
            {
              if ((v80 & 1) == 0)
                goto LABEL_55;
            }
            else
            {
              sub_2459A93F0(&qword_2574D77B8);
              if ((v85 & 1) == 0)
                goto LABEL_55;
            }
          }
          else
          {
            sub_2459A9124(v84, v79, &qword_2574D77B8);
            v86 = sub_2459A8E84((uint64_t)v77);
            if ((v85 & 1) != (v87 & 1))
            {
              v122 = &qword_2574D7790;
              goto LABEL_94;
            }
            v81 = v86;
            if ((v85 & 1) == 0)
            {
LABEL_55:
              v71[(v81 >> 6) + 8] |= 1 << v81;
              v88 = 8 * v81;
              *(_QWORD *)(v71[6] + v88) = v77;
              *(_QWORD *)(v71[7] + v88) = v78;
              v89 = v71[2];
              v40 = __OFADD__(v89, 1);
              v90 = v89 + 1;
              if (v40)
                goto LABEL_90;
              v71[2] = v90;
              v91 = v77;
              goto LABEL_47;
            }
          }
          v73 = v71[7];
          v74 = 8 * v81;

          *(_QWORD *)(v73 + v74) = v78;
LABEL_47:
          v72 += 16;
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
          if (!--v70)
          {
            swift_bridgeObjectRelease();
            v15 = a9;
            v69 = v125;
            v20 = v126;
            goto LABEL_62;
          }
        }
      }
      swift_bridgeObjectRetain();
LABEL_62:
      swift_bridgeObjectRelease();
      sub_2459A330C(0, &qword_2574D7790);
      type metadata accessor for MOScreenTimeShieldPolicy(0);
      sub_2459AAAA8(&qword_2574D7798, &qword_2574D7790);
      v92 = (void *)sub_2459B0FD0();
      swift_bridgeObjectRelease();
      v67 = v127;
    }
    else
    {
      v92 = 0;
    }
    objc_msgSend(v69, sel_setWebDomainShieldPolicies_, v92);

    v93 = objc_msgSend(v20, sel_shield);
    if (v67)
    {
      v94 = *(_QWORD *)(v67 + 16);
      v95 = MEMORY[0x24BEE4AF8];
      if (v94)
      {
        v130 = MEMORY[0x24BEE4AF8];
        swift_bridgeObjectRetain();
        sub_2459B11EC();
        v96 = v67 + 40;
        do
        {
          v97 = objc_allocWithZone(MEMORY[0x24BE63F10]);
          swift_bridgeObjectRetain();
          v98 = (void *)sub_2459B0FE8();
          swift_bridgeObjectRelease();
          objc_msgSend(v97, sel_initWithBundleIdentifier_, v98);

          sub_2459B11D4();
          sub_2459B11F8();
          sub_2459B1204();
          sub_2459B11E0();
          v96 += 16;
          --v94;
        }
        while (v94);
        v95 = v130;
        swift_bridgeObjectRelease();
        v20 = v126;
      }
    }
    else
    {
      v95 = MEMORY[0x24BEE4AF8];
    }
    sub_2459AAFAC(v95, &qword_2574D7498, 0x24BE63F10, &qword_2574D74A0, &qword_2574D77C8);
    swift_bridgeObjectRelease();
    sub_2459A330C(0, &qword_2574D7498);
    sub_2459AAAA8(&qword_2574D74A0, &qword_2574D7498);
    v99 = (void *)sub_2459B106C();
    swift_bridgeObjectRelease();
    objc_msgSend(v93, sel_setApplications_, v99);

    v100 = objc_msgSend(v20, sel_shield);
    if (v15)
    {
      v101 = *(_QWORD *)(v15 + 16);
      if (v101)
      {
        swift_bridgeObjectRetain();
        sub_2459B11EC();
        v102 = v15 + 40;
        do
        {
          swift_bridgeObjectRetain();
          v103 = (void *)sub_2459B0FE8();
          objc_msgSend(objc_allocWithZone(MEMORY[0x24BE63F20]), sel_initWithIdentifier_, v103);
          swift_bridgeObjectRelease();

          sub_2459B11D4();
          sub_2459B11F8();
          sub_2459B1204();
          sub_2459B11E0();
          v102 += 16;
          --v101;
        }
        while (v101);
        swift_bridgeObjectRelease();
        v20 = v126;
      }
    }
    sub_2459A330C(0, &qword_2574D7788);
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    sub_2459A330C(0, &qword_2574D74B0);
    v105 = (void *)sub_2459B1054();
    swift_bridgeObjectRelease();
    v106 = MEMORY[0x24BEE4AF8];
    v107 = (void *)sub_2459B1054();
    v108 = objc_msgSend(ObjCClassFromMetadata, sel_specificPolicyWithCategories_excludedContent_, v105, v107);

    objc_msgSend(v100, sel_setApplicationCategories_, v108);
    v109 = objc_msgSend(v20, sel_shield);
    if (a10)
    {
      v110 = *(_QWORD *)(a10 + 16);
      if (v110)
      {
        v131 = v106;
        swift_bridgeObjectRetain();
        sub_2459B11EC();
        v111 = a10 + 40;
        do
        {
          v112 = objc_allocWithZone(MEMORY[0x24BE63F60]);
          swift_bridgeObjectRetain();
          v113 = (void *)sub_2459B0FE8();
          swift_bridgeObjectRelease();
          objc_msgSend(v112, sel_initWithDomain_, v113);

          sub_2459B11D4();
          sub_2459B11F8();
          sub_2459B1204();
          sub_2459B11E0();
          v111 += 16;
          --v110;
        }
        while (v110);
        v106 = v131;
        swift_bridgeObjectRelease();
        v20 = v126;
      }
    }
    sub_2459AAFAC(v106, &qword_2574D7790, 0x24BE63F60, &qword_2574D7798, &qword_2574D77C0);
    swift_bridgeObjectRelease();
    sub_2459A330C(0, &qword_2574D7790);
    sub_2459AAAA8(&qword_2574D7798, &qword_2574D7790);
    v114 = (void *)sub_2459B106C();
    swift_bridgeObjectRelease();
    objc_msgSend(v109, sel_setWebDomains_, v114);

    v115 = objc_msgSend(v20, sel_shield);
    if (a9)
    {
      v116 = *(_QWORD *)(a9 + 16);
      if (v116)
      {
        swift_bridgeObjectRetain();
        sub_2459B11EC();
        v117 = a9 + 40;
        do
        {
          swift_bridgeObjectRetain();
          v118 = (void *)sub_2459B0FE8();
          objc_msgSend(objc_allocWithZone(MEMORY[0x24BE63F20]), sel_initWithIdentifier_, v118);
          swift_bridgeObjectRelease();

          sub_2459B11D4();
          sub_2459B11F8();
          sub_2459B1204();
          sub_2459B11E0();
          v117 += 16;
          --v116;
        }
        while (v116);
        swift_bridgeObjectRelease();
      }
    }
    sub_2459A330C(0, &qword_2574D77A0);
    v119 = (void *)swift_getObjCClassFromMetadata();
    v120 = (void *)sub_2459B1054();
    swift_bridgeObjectRelease();
    v121 = (void *)sub_2459B1054();
    v128 = objc_msgSend(v119, sel_specificPolicyWithCategories_excludedContent_, v120, v121);

    objc_msgSend(v115, sel_setWebDomainCategories_, v128);
    return;
  }
  swift_bridgeObjectRetain_n();
  v47 = (_QWORD *)MEMORY[0x24BEE4B00];
  v48 = a9 + 40;
  while (1)
  {
    swift_bridgeObjectRetain();
    v50 = (void *)sub_2459B0FE8();
    v51 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE63F20]), sel_initWithIdentifier_, v50);

    v52 = v129;
    v53 = swift_isUniquelyReferenced_nonNull_native();
    v55 = sub_2459A8DEC((uint64_t)v51);
    v56 = v47[2];
    v57 = (v54 & 1) == 0;
    v58 = v56 + v57;
    if (__OFADD__(v56, v57))
      goto LABEL_86;
    v59 = v54;
    if (v47[3] >= v58)
    {
      if ((v53 & 1) == 0)
        sub_2459A93F0(&qword_2574D77B0);
      goto LABEL_36;
    }
    sub_2459A9124(v58, v53, &qword_2574D77B0);
    v60 = sub_2459A8DEC((uint64_t)v51);
    if ((v59 & 1) != (v61 & 1))
      break;
    v55 = v60;
LABEL_36:
    v62 = 8 * v55;
    if ((v59 & 1) != 0)
    {
      v49 = v47[7];

      *(_QWORD *)(v49 + v62) = v52;
    }
    else
    {
      v47[(v55 >> 6) + 8] |= 1 << v55;
      *(_QWORD *)(v47[6] + 8 * v55) = v51;
      *(_QWORD *)(v47[7] + 8 * v55) = v52;
      v63 = v47[2];
      v40 = __OFADD__(v63, 1);
      v64 = v63 + 1;
      if (v40)
        goto LABEL_89;
      v47[2] = v64;
      v65 = v51;
    }
    v48 += 16;
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    if (!--v46)
    {
      v15 = a9;
      swift_bridgeObjectRelease();
      v20 = v126;
      v14 = a10;
      v17 = (SEL *)&unk_2516BC000;
      goto LABEL_42;
    }
  }
  v122 = &qword_2574D74B0;
LABEL_94:
  sub_2459A330C(0, v122);
  sub_2459B127C();
  __break(1u);
}

void sub_2459A6484(uint64_t a1, uint64_t a2, char a3)
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = objc_msgSend((id)objc_opt_self(), sel_storesForSharedContainer_, *MEMORY[0x24BE84750]);
  v7 = sub_2459B1078();

  LOBYTE(v6) = sub_2459A37CC(a1, a2, v7);
  swift_bridgeObjectRelease();
  if ((v6 & 1) != 0)
  {
    sub_2459B100C();
    v8 = objc_allocWithZone(MEMORY[0x24BE63F38]);
    swift_bridgeObjectRetain();
    v9 = (void *)sub_2459B0FE8();
    swift_bridgeObjectRelease();
    v10 = (void *)sub_2459B0FE8();
    swift_bridgeObjectRelease();
    v11 = objc_msgSend(v8, sel_initWithName_sharedContainer_, v9, v10);

    objc_msgSend(v11, sel_setActive_, a3 & 1);
  }
}

void sub_2459A65E4()
{
  id v0;
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;

  v0 = objc_msgSend((id)objc_opt_self(), sel_storesForSharedContainer_);
  v1 = sub_2459B1078();

  v2 = 0;
  v3 = *(_QWORD *)(v1 + 56);
  v15 = v1 + 56;
  v4 = 1 << *(_BYTE *)(v1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  i = v5 & v3;
  v7 = (unint64_t)(v4 + 63) >> 6;
  if ((v5 & v3) != 0)
    goto LABEL_6;
LABEL_7:
  v8 = v2 + 1;
  if (!__OFADD__(v2, 1))
  {
    if (v8 < v7)
    {
      v9 = *(_QWORD *)(v15 + 8 * v8);
      ++v2;
      if (v9)
        goto LABEL_20;
      v2 = v8 + 1;
      if (v8 + 1 >= v7)
        goto LABEL_24;
      v9 = *(_QWORD *)(v15 + 8 * v2);
      if (v9)
        goto LABEL_20;
      v2 = v8 + 2;
      if (v8 + 2 >= v7)
        goto LABEL_24;
      v9 = *(_QWORD *)(v15 + 8 * v2);
      if (v9)
      {
LABEL_20:
        for (i = (v9 - 1) & v9; ; i &= i - 1)
        {
          swift_bridgeObjectRetain();
          if ((sub_2459B103C() & 1) != 0)
          {
            sub_2459B100C();
            v11 = objc_allocWithZone(MEMORY[0x24BE63F38]);
            v12 = (void *)sub_2459B0FE8();
            swift_bridgeObjectRelease();
            v13 = (void *)sub_2459B0FE8();
            swift_bridgeObjectRelease();
            v14 = objc_msgSend(v11, sel_initWithName_sharedContainer_, v12, v13);

            objc_msgSend(v14, sel_setActive_, 0);
            if (!i)
              goto LABEL_7;
          }
          else
          {
            swift_bridgeObjectRelease();
            if (!i)
              goto LABEL_7;
          }
LABEL_6:
          ;
        }
      }
      v10 = v8 + 3;
      if (v10 < v7)
      {
        v9 = *(_QWORD *)(v15 + 8 * v10);
        if (v9)
        {
          v2 = v10;
          goto LABEL_20;
        }
        while (1)
        {
          v2 = v10 + 1;
          if (__OFADD__(v10, 1))
            goto LABEL_26;
          if (v2 >= v7)
            break;
          v9 = *(_QWORD *)(v15 + 8 * v2);
          ++v10;
          if (v9)
            goto LABEL_20;
        }
      }
    }
LABEL_24:
    swift_release();
    return;
  }
  __break(1u);
LABEL_26:
  __break(1u);
}

void sub_2459A685C()
{
  void *v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  id v4;

  v0 = (void *)objc_opt_self();
  v1 = *MEMORY[0x24BE84750];
  v2 = objc_msgSend(v0, sel_storesForSharedContainer_, *MEMORY[0x24BE84750]);
  v3 = sub_2459B1078();

  sub_2459A958C(v3);
  v4 = (id)sub_2459B106C();
  objc_msgSend(v0, sel_deleteStoresWithStoreNames_sharedContainer_, v4, v1);
  swift_release();

}

void sub_2459A692C()
{
  void *v0;
  id v1;

  v0 = (void *)objc_opt_self();
  v1 = (id)sub_2459B106C();
  objc_msgSend(v0, sel_deleteStoresWithStoreNames_sharedContainer_, v1, *MEMORY[0x24BE84750]);

}

uint64_t sub_2459A69A0(uint64_t a1, char a2)
{
  uint64_t v2;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  id v11;
  _QWORD v12[6];
  id v13;

  v5 = sub_2459A3390();
  v6 = swift_allocObject();
  *(_BYTE *)(v6 + 16) = a2;
  *(_QWORD *)(v6 + 24) = a1;
  *(_QWORD *)(v6 + 32) = v2;
  *(_QWORD *)(v6 + 40) = &v13;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_2459AAC44;
  *(_QWORD *)(v7 + 24) = v6;
  v12[4] = sub_2459AC7EC;
  v12[5] = v7;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 1107296256;
  v12[2] = sub_2459A4D7C;
  v12[3] = &block_descriptor_33;
  v8 = _Block_copy(v12);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_release();
  objc_msgSend(v5, sel_batchUpdate_, v8);

  _Block_release(v8);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    if (v13)
    {
      v11 = v13;
      swift_willThrow();

    }
    return swift_release();
  }
  return result;
}

uint64_t sub_2459A6B30(id a1, char a2, unint64_t a3)
{
  uint64_t v5;
  uint64_t i;
  id v7;
  void *v8;
  uint64_t v9;

  if ((a2 & 1) != 0)
    objc_msgSend(a1, sel_clearAllSettings);
  if (a3 >> 62)
    goto LABEL_14;
  v5 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; v5 = sub_2459B121C())
  {
    for (i = 4; ; ++i)
    {
      v7 = (a3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x24953F6D8](i - 4, a3) : *(id *)(a3 + 8 * i);
      v8 = v7;
      v9 = i - 3;
      if (__OFADD__(i - 4, 1))
        break;
      sub_2459A6CDC(v7, a1);

      if (v9 == v5)
        return swift_bridgeObjectRelease();
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
  }
  return swift_bridgeObjectRelease();
}

void sub_2459A6CDC(void *a1, void *a2)
{
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;

  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    objc_opt_self();
    v4 = (void *)swift_dynamicCastObjCClassUnconditional();
    v5 = objc_msgSend(a2, sel_media);
    v6 = objc_msgSend(v4, sel_payloadAllowTVProviderModification);
    objc_msgSend(v6, sel_BOOLValue);
    sub_2459A330C(0, &qword_2574D7768);
    v7 = (id)sub_2459B10F0();

    objc_msgSend(v5, sel_setLockTVProvider_, v7);
LABEL_7:

    return;
  }
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    objc_opt_self();
    v8 = (void *)swift_dynamicCastObjCClassUnconditional();
    v5 = objc_msgSend(a2, sel_account);
    v9 = objc_msgSend(v8, sel_payloadAllowAccountModification);
    objc_msgSend(v9, sel_BOOLValue);
    sub_2459A330C(0, &qword_2574D7768);
    v7 = (id)sub_2459B10F0();

    objc_msgSend(v5, sel_setLockAccounts_, v7);
    goto LABEL_7;
  }
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    objc_opt_self();
    v10 = (void *)swift_dynamicCastObjCClassUnconditional();
    v5 = objc_msgSend(a2, sel_application);
    v11 = objc_msgSend(v10, sel_payloadAllowAutomaticAppUpdates);
    objc_msgSend(v11, sel_BOOLValue);
    sub_2459A330C(0, &qword_2574D7768);
    v7 = (id)sub_2459B10F0();

    objc_msgSend(v5, sel_setDenyBackgroundAppRefresh_, v7);
    goto LABEL_7;
  }
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    objc_opt_self();
    v12 = (void *)swift_dynamicCastObjCClassUnconditional();
    sub_2459AB140(v12, a2);
    return;
  }
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    objc_opt_self();
    v13 = (void *)swift_dynamicCastObjCClassUnconditional();
    sub_2459AB4DC(v13, a2);
    return;
  }
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    objc_opt_self();
    v14 = (void *)swift_dynamicCastObjCClassUnconditional();
    sub_2459AB9F0(v14, a2);
    return;
  }
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    objc_opt_self();
    v15 = (void *)swift_dynamicCastObjCClassUnconditional();
    sub_2459ABB28(v15, a2);
    return;
  }
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    objc_opt_self();
    v16 = (void *)swift_dynamicCastObjCClassUnconditional();
    v5 = objc_msgSend(a2, sel_passcode);
    v17 = objc_msgSend(v16, sel_payloadAllowPasscodeModification);
    objc_msgSend(v17, sel_BOOLValue);
    sub_2459A330C(0, &qword_2574D7768);
    v7 = (id)sub_2459B10F0();

    objc_msgSend(v5, sel_setLockPasscode_, v7);
    goto LABEL_7;
  }
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    objc_opt_self();
    v18 = (void *)swift_dynamicCastObjCClassUnconditional();
    v5 = objc_msgSend(a2, sel_airDrop);
    v19 = objc_msgSend(v18, sel_payloadAllowAirDrop);
    objc_msgSend(v19, sel_BOOLValue);
    sub_2459A330C(0, &qword_2574D7768);
    v7 = (id)sub_2459B10F0();

    objc_msgSend(v5, sel_setDenyAirDrop_, v7);
    goto LABEL_7;
  }
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    objc_opt_self();
    v20 = (void *)swift_dynamicCastObjCClassUnconditional();
    v5 = objc_msgSend(a2, sel_webContent);
    v7 = sub_2459AA6B4(v20);
    objc_msgSend(v5, sel_setBlockedByFilter_, v7);
    goto LABEL_7;
  }
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    objc_opt_self();
    v21 = (void *)swift_dynamicCastObjCClassUnconditional();
    sub_2459ABC60(v21, a2);
    return;
  }
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    objc_opt_self();
    v22 = (void *)swift_dynamicCastObjCClassUnconditional();
    v5 = objc_msgSend(a2, sel_carPlay);
    v23 = objc_msgSend(v22, sel_payloadAllowVehicleUI);
    objc_msgSend(v23, sel_BOOLValue);
    sub_2459A330C(0, &qword_2574D7768);
    v7 = (id)sub_2459B10F0();

    objc_msgSend(v5, sel_setDenyCarPlay_, v7);
    goto LABEL_7;
  }
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    objc_opt_self();
    v24 = (void *)swift_dynamicCastObjCClassUnconditional();
    v5 = objc_msgSend(a2, sel_notification);
    v25 = objc_msgSend(v24, sel_payloadAllowDriverDoNotDisturbModifications);
    objc_msgSend(v25, sel_BOOLValue);
    sub_2459A330C(0, &qword_2574D7768);
    v7 = (id)sub_2459B10F0();

    objc_msgSend(v5, sel_setLockDriverDoNotDisturb_, v7);
    goto LABEL_7;
  }
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    objc_opt_self();
    v26 = (void *)swift_dynamicCastObjCClassUnconditional();
    sub_2459ABD98(v26, a2);
    return;
  }
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    objc_opt_self();
    v27 = (void *)swift_dynamicCastObjCClassUnconditional();
    sub_2459AC1AC(v27, a2);
    return;
  }
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    objc_opt_self();
    v28 = (void *)swift_dynamicCastObjCClassUnconditional();
    sub_2459AC3B4(v28, a2);
    return;
  }
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    objc_opt_self();
    v29 = (void *)swift_dynamicCastObjCClassUnconditional();
    sub_2459AC580(v29, a2);
    return;
  }
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    objc_opt_self();
    v30 = (void *)swift_dynamicCastObjCClassUnconditional();
    v5 = objc_msgSend(a2, sel_findMy);
    v31 = objc_msgSend(v30, sel_payloadAllowFindMyFriendsModification);
    objc_msgSend(v31, sel_BOOLValue);
    sub_2459A330C(0, &qword_2574D7768);
    v7 = (id)sub_2459B10F0();

    objc_msgSend(v5, sel_setLockFindMyFriends_, v7);
    goto LABEL_7;
  }
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    objc_opt_self();
    v32 = (void *)swift_dynamicCastObjCClassUnconditional();
    v5 = objc_msgSend(a2, sel_privacy);
    v7 = objc_msgSend(v32, sel_payloadForceLimitAdTracking);
    objc_msgSend(v5, sel_setForceLimitAdTracking_, v7);
    goto LABEL_7;
  }
  objc_opt_self();
  if (!swift_dynamicCastObjCClass())
  {
    v33 = a1;
    v34 = sub_2459B0F10();
    v35 = sub_2459B10A8();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc();
      v37 = swift_slowAlloc();
      v42 = v37;
      *(_DWORD *)v36 = 136315138;
      v38 = objc_msgSend(v33, sel_debugDescription);
      v39 = sub_2459B100C();
      v41 = v40;

      sub_2459A7A18(v39, v41, &v42);
      sub_2459B1120();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24599C000, v34, v35, "Unsupported Declaration Type: %s. Failed to update ManagedSettings store.", v36, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24953FBF4](v37, -1, -1);
      MEMORY[0x24953FBF4](v36, -1, -1);
    }
    else
    {

    }
    sub_2459AAF68();
    swift_allocError();
    swift_willThrow();
  }
}

id *LocalRestrictions.deinit()
{
  id *v0;
  char *v1;
  uint64_t v2;

  v1 = (char *)v0 + OBJC_IVAR____TtC15ScreenTimeSwift17LocalRestrictions_logger;
  v2 = sub_2459B0F28();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t LocalRestrictions.__deallocating_deinit()
{
  id *v0;
  char *v1;
  uint64_t v2;

  v1 = (char *)v0 + OBJC_IVAR____TtC15ScreenTimeSwift17LocalRestrictions_logger;
  v2 = sub_2459B0F28();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_2459A7954(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_2459A7988(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2459A79A8(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_2459A7A18(v6, v7, a3);
  v8 = *a1 + 8;
  sub_2459B1120();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_2459A7A18(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2459A7AE8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2459AC794((uint64_t)v12, *a3);
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
      sub_2459AC794((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2459A7AE8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2459B112C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2459A7CA0(a5, a6);
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
  v8 = sub_2459B11C8();
  if (!v8)
  {
    sub_2459B1210();
    __break(1u);
LABEL_17:
    result = sub_2459B124C();
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

uint64_t sub_2459A7CA0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2459A7D34(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2459A7F0C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2459A7F0C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2459A7D34(uint64_t a1, unint64_t a2)
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
      v3 = sub_2459A7EA8(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2459B11B0();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2459B1210();
      __break(1u);
LABEL_10:
      v2 = sub_2459B1030();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2459B124C();
    __break(1u);
LABEL_14:
    result = sub_2459B1210();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2459A7EA8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D7770);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2459A7F0C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574D7770);
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
  result = sub_2459B124C();
  __break(1u);
  return result;
}

_BYTE **sub_2459A8058(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_2459A8068(_QWORD *a1, void *a2, unint64_t *a3, uint64_t a4, uint64_t *a5)
{
  uint64_t *v5;
  uint64_t *v8;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  char v20;
  uint64_t v21;
  id v22;
  char v23;
  void *v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  id v29;
  char isUniquelyReferenced_nonNull_native;
  id v31;
  uint64_t v32;
  id v33;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v8 = v5;
  v11 = *v5;
  if ((*v5 & 0xC000000000000001) != 0)
  {
    if (v11 < 0)
      v12 = *v5;
    else
      v12 = v11 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v13 = a2;
    v14 = sub_2459B1168();

    if (v14)
    {
      swift_bridgeObjectRelease();

      sub_2459A330C(0, a3);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v36;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_2459B115C();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v26 = sub_2459A8330(v12, result + 1, a5, a3);
    v37 = v26;
    v27 = *(_QWORD *)(v26 + 16);
    if (*(_QWORD *)(v26 + 24) <= v27)
    {
      v32 = v27 + 1;
      v33 = v13;
      sub_2459A8530(v32, a5);
      v28 = v37;
    }
    else
    {
      v28 = v26;
      v29 = v13;
    }
    sub_2459A87C8((uint64_t)v13, v28);
    *v8 = v28;
    swift_bridgeObjectRelease();
    *a1 = v13;
  }
  else
  {
    swift_bridgeObjectRetain();
    v16 = sub_2459B10FC();
    v17 = -1 << *(_BYTE *)(v11 + 32);
    v18 = v16 & ~v17;
    if (((*(_QWORD *)(v11 + 56 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) != 0)
    {
      sub_2459A330C(0, a3);
      v19 = *(id *)(*(_QWORD *)(v11 + 48) + 8 * v18);
      v20 = sub_2459B1108();

      if ((v20 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        v24 = *(void **)(*(_QWORD *)(*v5 + 48) + 8 * v18);
        *a1 = v24;
        v25 = v24;
        return 0;
      }
      v21 = ~v17;
      while (1)
      {
        v18 = (v18 + 1) & v21;
        if (((*(_QWORD *)(v11 + 56 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) == 0)
          break;
        v22 = *(id *)(*(_QWORD *)(v11 + 48) + 8 * v18);
        v23 = sub_2459B1108();

        if ((v23 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v38 = *v5;
    *v5 = 0x8000000000000000;
    v31 = a2;
    sub_2459A8848((uint64_t)v31, v18, isUniquelyReferenced_nonNull_native, a5, a3);
    *v5 = v38;
    swift_bridgeObjectRelease();
    *a1 = v31;
  }
  return 1;
}

uint64_t sub_2459A8330(uint64_t a1, uint64_t a2, uint64_t *a3, unint64_t *a4)
{
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(a3);
    v6 = sub_2459B1198();
    v19 = v6;
    sub_2459B1150();
    if (sub_2459B1174())
    {
      sub_2459A330C(0, a4);
      do
      {
        swift_dynamicCast();
        v6 = v19;
        v13 = *(_QWORD *)(v19 + 16);
        if (*(_QWORD *)(v19 + 24) <= v13)
        {
          sub_2459A8530(v13 + 1, a3);
          v6 = v19;
        }
        result = sub_2459B10FC();
        v8 = v6 + 56;
        v9 = -1 << *(_BYTE *)(v6 + 32);
        v10 = result & ~v9;
        v11 = v10 >> 6;
        if (((-1 << v10) & ~*(_QWORD *)(v6 + 56 + 8 * (v10 >> 6))) != 0)
        {
          v12 = __clz(__rbit64((-1 << v10) & ~*(_QWORD *)(v6 + 56 + 8 * (v10 >> 6)))) | v10 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v14 = 0;
          v15 = (unint64_t)(63 - v9) >> 6;
          do
          {
            if (++v11 == v15 && (v14 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v16 = v11 == v15;
            if (v11 == v15)
              v11 = 0;
            v14 |= v16;
            v17 = *(_QWORD *)(v8 + 8 * v11);
          }
          while (v17 == -1);
          v12 = __clz(__rbit64(~v17)) + (v11 << 6);
        }
        *(_QWORD *)(v8 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
        *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v12) = v18;
        ++*(_QWORD *)(v6 + 16);
      }
      while (sub_2459B1174());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B08];
  }
  return v6;
}

uint64_t sub_2459A8530(uint64_t a1, uint64_t *a2)
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
  v5 = sub_2459B118C();
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
      result = sub_2459B10FC();
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

unint64_t sub_2459A87C8(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_2459B10FC();
  result = sub_2459B1144();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

void sub_2459A8848(uint64_t a1, unint64_t a2, char a3, uint64_t *a4, unint64_t *a5)
{
  uint64_t *v5;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  char v16;
  uint64_t v17;
  id v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v9 = *(_QWORD *)(*v5 + 16);
  v10 = *(_QWORD *)(*v5 + 24);
  if (v10 > v9 && (a3 & 1) != 0)
    goto LABEL_14;
  v11 = v9 + 1;
  if ((a3 & 1) != 0)
  {
    sub_2459A8530(v11, a4);
  }
  else
  {
    if (v10 > v9)
    {
      sub_2459A89D8(a4);
      goto LABEL_14;
    }
    sub_2459A8B78(v11, a4);
  }
  v12 = *v5;
  v13 = sub_2459B10FC();
  v14 = -1 << *(_BYTE *)(v12 + 32);
  a2 = v13 & ~v14;
  if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    sub_2459A330C(0, a5);
    v15 = *(id *)(*(_QWORD *)(v12 + 48) + 8 * a2);
    v16 = sub_2459B1108();

    if ((v16 & 1) != 0)
    {
LABEL_13:
      sub_2459B1270();
      __break(1u);
    }
    else
    {
      v17 = ~v14;
      while (1)
      {
        a2 = (a2 + 1) & v17;
        if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v18 = *(id *)(*(_QWORD *)(v12 + 48) + 8 * a2);
        v19 = sub_2459B1108();

        if ((v19 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v20 + 48) + 8 * a2) = a1;
  v21 = *(_QWORD *)(v20 + 16);
  v22 = __OFADD__(v21, 1);
  v23 = v21 + 1;
  if (v22)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v23;
}

id sub_2459A89D8(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id result;
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
  void *v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_2459B1180();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v2 = v5;
    return result;
  }
  result = (id)(v4 + 56);
  v7 = v3 + 56;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 56 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 56), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 56);
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
    v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v19 >= v14)
      goto LABEL_28;
    v20 = *(_QWORD *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      v10 = v19 + 1;
      if (v19 + 1 >= v14)
        goto LABEL_28;
      v20 = *(_QWORD *)(v7 + 8 * v10);
      if (!v20)
      {
        v10 = v19 + 2;
        if (v19 + 2 >= v14)
          goto LABEL_28;
        v20 = *(_QWORD *)(v7 + 8 * v10);
        if (!v20)
          break;
      }
    }
LABEL_27:
    v13 = (v20 - 1) & v20;
    v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    v17 = 8 * v16;
    v18 = *(void **)(*(_QWORD *)(v3 + 48) + v17);
    *(_QWORD *)(*(_QWORD *)(v5 + 48) + v17) = v18;
    result = v18;
  }
  v21 = v19 + 3;
  if (v21 >= v14)
    goto LABEL_28;
  v20 = *(_QWORD *)(v7 + 8 * v21);
  if (v20)
  {
    v10 = v21;
    goto LABEL_27;
  }
  while (1)
  {
    v10 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v10 >= v14)
      goto LABEL_28;
    v20 = *(_QWORD *)(v7 + 8 * v10);
    ++v21;
    if (v20)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_2459A8B78(uint64_t a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
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
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;

  v3 = v2;
  v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v5 = sub_2459B118C();
  v6 = v5;
  if (!*(_QWORD *)(v4 + 16))
  {
    result = swift_release();
LABEL_35:
    *v3 = v6;
    return result;
  }
  v29 = v2;
  v7 = 1 << *(_BYTE *)(v4 + 32);
  v8 = v4 + 56;
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
      goto LABEL_24;
    }
    v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v18 >= v11)
      goto LABEL_33;
    v19 = *(_QWORD *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      v14 = v18 + 1;
      if (v18 + 1 >= v11)
        goto LABEL_33;
      v19 = *(_QWORD *)(v8 + 8 * v14);
      if (!v19)
      {
        v14 = v18 + 2;
        if (v18 + 2 >= v11)
          goto LABEL_33;
        v19 = *(_QWORD *)(v8 + 8 * v14);
        if (!v19)
          break;
      }
    }
LABEL_23:
    v10 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_24:
    v21 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v17);
    result = sub_2459B10FC();
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
          goto LABEL_36;
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
  v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_33:
    result = swift_release_n();
    v3 = v29;
    goto LABEL_35;
  }
  v19 = *(_QWORD *)(v8 + 8 * v20);
  if (v19)
  {
    v14 = v20;
    goto LABEL_23;
  }
  while (1)
  {
    v14 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v14 >= v11)
      goto LABEL_33;
    v19 = *(_QWORD *)(v8 + 8 * v14);
    ++v20;
    if (v19)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_2459A8DEC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2459B10FC();
  return sub_2459A8F34(a1, v2, &qword_2574D74B0);
}

unint64_t sub_2459A8E38(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2459B10FC();
  return sub_2459A8F34(a1, v2, &qword_2574D7498);
}

unint64_t sub_2459A8E84(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2459B10FC();
  return sub_2459A8F34(a1, v2, &qword_2574D7790);
}

unint64_t sub_2459A8ED0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2459B12B8();
  sub_2459B1024();
  v4 = sub_2459B12E8();
  return sub_2459A9044(a1, a2, v4);
}

unint64_t sub_2459A8F34(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t i;
  id v7;
  char v8;
  uint64_t v9;
  id v10;
  char v11;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  i = a2 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    sub_2459A330C(0, a3);
    v7 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * i);
    v8 = sub_2459B1108();

    if ((v8 & 1) == 0)
    {
      v9 = ~v5;
      for (i = (i + 1) & v9; ((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v9)
      {
        v10 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * i);
        v11 = sub_2459B1108();

        if ((v11 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

unint64_t sub_2459A9044(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_2459B1264() & 1) == 0)
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
      while (!v14 && (sub_2459B1264() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_2459A9124(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;

  v4 = v3;
  v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v7 = sub_2459B1234();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_40;
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v37 = v3;
  v38 = v6 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v6 + 64);
  v12 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 64;
  result = swift_retain();
  v15 = 0;
  while (1)
  {
    if (v11)
    {
      v21 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v22 = v21 | (v15 << 6);
      goto LABEL_31;
    }
    v23 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v12)
      break;
    v24 = (_QWORD *)(v6 + 64);
    v25 = *(_QWORD *)(v38 + 8 * v23);
    ++v15;
    if (!v25)
    {
      v15 = v23 + 1;
      if (v23 + 1 >= v12)
        goto LABEL_33;
      v25 = *(_QWORD *)(v38 + 8 * v15);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v12)
        {
LABEL_33:
          swift_release();
          v4 = v37;
          if ((a2 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v25 = *(_QWORD *)(v38 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v15 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_42;
            if (v15 >= v12)
              goto LABEL_33;
            v25 = *(_QWORD *)(v38 + 8 * v15);
            ++v26;
            if (v25)
              goto LABEL_30;
          }
        }
        v15 = v26;
      }
    }
LABEL_30:
    v11 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v15 << 6);
LABEL_31:
    v31 = 8 * v22;
    v32 = *(void **)(*(_QWORD *)(v6 + 48) + v31);
    v33 = *(void **)(*(_QWORD *)(v6 + 56) + v31);
    if ((a2 & 1) == 0)
    {
      v34 = v32;
      v35 = v33;
    }
    result = sub_2459B10FC();
    v16 = -1 << *(_BYTE *)(v8 + 32);
    v17 = result & ~v16;
    v18 = v17 >> 6;
    if (((-1 << v17) & ~*(_QWORD *)(v13 + 8 * (v17 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v17) & ~*(_QWORD *)(v13 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v16) >> 6;
      do
      {
        if (++v18 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v29 = v18 == v28;
        if (v18 == v28)
          v18 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v13 + 8 * v18);
      }
      while (v30 == -1);
      v19 = __clz(__rbit64(~v30)) + (v18 << 6);
    }
    *(_QWORD *)(v13 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    v20 = 8 * v19;
    *(_QWORD *)(*(_QWORD *)(v8 + 48) + v20) = v32;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + v20) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release();
  v4 = v37;
  v24 = (_QWORD *)(v6 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v36 = 1 << *(_BYTE *)(v6 + 32);
  if (v36 >= 64)
    bzero(v24, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v36;
  *(_QWORD *)(v6 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v4 = v8;
  return result;
}

id sub_2459A93F0(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id result;
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
  void *v18;
  void *v19;
  id v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_2459B1228();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v2 = v5;
    return result;
  }
  result = (id)(v4 + 64);
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
    v21 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v14)
      goto LABEL_26;
    v22 = *(_QWORD *)(v7 + 8 * v21);
    ++v10;
    if (!v22)
    {
      v10 = v21 + 1;
      if (v21 + 1 >= v14)
        goto LABEL_26;
      v22 = *(_QWORD *)(v7 + 8 * v10);
      if (!v22)
        break;
    }
LABEL_25:
    v13 = (v22 - 1) & v22;
    v16 = __clz(__rbit64(v22)) + (v10 << 6);
LABEL_12:
    v17 = 8 * v16;
    v18 = *(void **)(*(_QWORD *)(v3 + 48) + v17);
    v19 = *(void **)(*(_QWORD *)(v3 + 56) + v17);
    *(_QWORD *)(*(_QWORD *)(v5 + 48) + v17) = v18;
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v17) = v19;
    v20 = v18;
    result = v19;
  }
  v23 = v21 + 2;
  if (v23 >= v14)
    goto LABEL_26;
  v22 = *(_QWORD *)(v7 + 8 * v23);
  if (v22)
  {
    v10 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v22 = *(_QWORD *)(v7 + 8 * v10);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_2459A958C(uint64_t isStackAllocationSafe)
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
    v6 = sub_2459A96E8((uint64_t)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v4, v2);
    swift_release();
    if (v1)
      swift_willThrow();
  }
  else
  {
    v7 = (void *)swift_slowAlloc();
    bzero(v7, v5);
    v6 = sub_2459A96E8((uint64_t)v7, v4, v2);
    swift_release();
    MEMORY[0x24953FBF4](v7, -1, -1);
  }
  return v6;
}

uint64_t sub_2459A96E8(uint64_t result, uint64_t a2, uint64_t a3)
{
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  unint64_t v13;
  int64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  char v20;
  unint64_t *v22;
  uint64_t v23;

  v22 = (unint64_t *)result;
  v23 = 0;
  v4 = 0;
  v5 = a3 + 56;
  v6 = 1 << *(_BYTE *)(a3 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(a3 + 56);
  v9 = (unint64_t)(v6 + 63) >> 6;
  while (v8)
  {
    v10 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    v11 = v10 | (v4 << 6);
LABEL_18:
    v15 = (uint64_t *)(*(_QWORD *)(a3 + 48) + 16 * v11);
    v17 = *v15;
    v16 = v15[1];
    v18 = qword_2574D6DB8;
    swift_bridgeObjectRetain();
    if (v18 != -1)
      swift_once();
    v19 = v17 == qword_2574D7AD8 && v16 == unk_2574D7AE0;
    if (v19
      || (sub_2459B1264() & 1) != 0
      || v17 == 0xD00000000000001FLL && v16 == 0x80000002459B3A50
      || (sub_2459B1264() & 1) != 0
      || v17 == 0xD000000000000020 && v16 == 0x80000002459B3A70)
    {
      result = swift_bridgeObjectRelease();
    }
    else
    {
      v20 = sub_2459B1264();
      result = swift_bridgeObjectRelease();
      if ((v20 & 1) == 0)
      {
        *(unint64_t *)((char *)v22 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
        v12 = __OFADD__(v23++, 1);
        if (v12)
          goto LABEL_42;
      }
    }
  }
  v12 = __OFADD__(v4++, 1);
  if (v12)
  {
    __break(1u);
    goto LABEL_41;
  }
  if (v4 >= v9)
    goto LABEL_39;
  v13 = *(_QWORD *)(v5 + 8 * v4);
  if (v13)
  {
LABEL_17:
    v8 = (v13 - 1) & v13;
    v11 = __clz(__rbit64(v13)) + (v4 << 6);
    goto LABEL_18;
  }
  v14 = v4 + 1;
  if (v4 + 1 >= v9)
    goto LABEL_39;
  v13 = *(_QWORD *)(v5 + 8 * v14);
  if (v13)
    goto LABEL_16;
  v14 = v4 + 2;
  if (v4 + 2 >= v9)
    goto LABEL_39;
  v13 = *(_QWORD *)(v5 + 8 * v14);
  if (v13)
    goto LABEL_16;
  v14 = v4 + 3;
  if (v4 + 3 >= v9)
  {
LABEL_39:
    swift_retain();
    return sub_2459A99B8(v22, a2, v23, a3);
  }
  v13 = *(_QWORD *)(v5 + 8 * v14);
  if (v13)
  {
LABEL_16:
    v4 = v14;
    goto LABEL_17;
  }
  while (1)
  {
    v4 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v4 >= v9)
      goto LABEL_39;
    v13 = *(_QWORD *)(v5 + 8 * v4);
    ++v14;
    if (v13)
      goto LABEL_17;
  }
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_2459A99B8(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v30;

  v4 = a4;
  if (!a3)
  {
    v8 = MEMORY[0x24BEE4B08];
LABEL_36:
    swift_release();
    return v8;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D7780);
  result = sub_2459B11A4();
  v8 = result;
  v30 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    v14 = v10 + 1;
    if (__OFADD__(v10, 1))
      goto LABEL_39;
    if (v14 >= v30)
      goto LABEL_36;
    v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      v10 = v14 + 1;
      if (v14 + 1 >= v30)
        goto LABEL_36;
      v15 = a1[v10];
      if (!v15)
      {
        v10 = v14 + 2;
        if (v14 + 2 >= v30)
          goto LABEL_36;
        v15 = a1[v10];
        if (!v15)
          break;
      }
    }
LABEL_23:
    v9 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v13);
    v18 = *v17;
    v19 = v17[1];
    sub_2459B12B8();
    swift_bridgeObjectRetain();
    sub_2459B1024();
    result = sub_2459B12E8();
    v20 = -1 << *(_BYTE *)(v8 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
        v27 = *(_QWORD *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(_QWORD *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v23);
    *v28 = v18;
    v28[1] = v19;
    ++*(_QWORD *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5)
      goto LABEL_36;
  }
  v16 = v14 + 3;
  if (v16 >= v30)
    goto LABEL_36;
  v15 = a1[v16];
  if (v15)
  {
    v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v10 >= v30)
      goto LABEL_36;
    v15 = a1[v10];
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

void sub_2459A9C4C(uint64_t a1, char a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  id v24;
  char v25;
  uint64_t v26;
  id v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;

  v3 = v2;
  v6 = *v2;
  v7 = sub_2459B10FC();
  v8 = -1 << *(_BYTE *)(v6 + 32);
  v9 = v7 & ~v8;
  v10 = v6 + 56;
  if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) != 0)
  {
    sub_2459A330C(0, &qword_2574D7790);
    v11 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v9);
    v12 = sub_2459B1108();

    if ((v12 & 1) != 0)
    {
      v13 = 0;
      v14 = 1;
    }
    else
    {
      v15 = ~v8;
      v9 = (v9 + 1) & v15;
      if (((*(_QWORD *)(v10 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) != 0)
      {
        v13 = 1;
        while (1)
        {
          v16 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v9);
          v14 = sub_2459B1108();

          if ((v14 & 1) != 0)
            break;
          v9 = (v9 + 1) & v15;
          if (((*(_QWORD *)(v10 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
            goto LABEL_12;
        }
        v13 = 0;
      }
      else
      {
        v14 = 0;
        v13 = 1;
      }
    }
LABEL_12:
    v3 = v2;
  }
  else
  {
    v14 = 0;
    v13 = 1;
  }
  v17 = *(_QWORD *)(v6 + 16);
  v18 = v17 + v13;
  if (__OFADD__(v17, v13))
    goto LABEL_36;
  v19 = *(_QWORD *)(v6 + 24);
  if (v19 >= v18 && (a2 & 1) != 0)
  {
    if ((v14 & 1) == 0)
      goto LABEL_32;
LABEL_30:
    *(_QWORD *)(*(_QWORD *)(*v3 + 48) + 8 * v9) = a1;
    return;
  }
  if ((a2 & 1) != 0)
  {
    sub_2459A8530(v18, &qword_2574D77C0);
  }
  else
  {
    if (v19 >= v18)
    {
      sub_2459A89D8(&qword_2574D77C0);
      if ((v14 & 1) != 0)
        goto LABEL_30;
      goto LABEL_32;
    }
    sub_2459A8B78(v18, &qword_2574D77C0);
  }
  v20 = *v3;
  v21 = sub_2459B10FC();
  v22 = -1 << *(_BYTE *)(v20 + 32);
  v9 = v21 & ~v22;
  if (((*(_QWORD *)(v20 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
    if ((v14 & 1) == 0)
      goto LABEL_32;
    goto LABEL_35;
  }
  v23 = v3;
  sub_2459A330C(0, &qword_2574D7790);
  v24 = *(id *)(*(_QWORD *)(v20 + 48) + 8 * v9);
  v25 = sub_2459B1108();

  if ((v25 & 1) != 0)
  {
LABEL_29:
    v3 = v23;
    if ((v14 & 1) != 0)
      goto LABEL_30;
    goto LABEL_35;
  }
  v26 = ~v22;
  while (1)
  {
    v9 = (v9 + 1) & v26;
    if (((*(_QWORD *)(v20 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
      break;
    v27 = *(id *)(*(_QWORD *)(v20 + 48) + 8 * v9);
    v28 = sub_2459B1108();

    if ((v28 & 1) != 0)
      goto LABEL_29;
  }
  v3 = v23;
  if ((v14 & 1) != 0)
  {
LABEL_35:
    sub_2459A330C(0, &qword_2574D7790);
    sub_2459B1270();
    __break(1u);
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
LABEL_32:
  v29 = *v3;
  *(_QWORD *)(*v3 + 8 * (v9 >> 6) + 56) |= 1 << v9;
  *(_QWORD *)(*(_QWORD *)(v29 + 48) + 8 * v9) = a1;
  v30 = *(_QWORD *)(v29 + 16);
  v31 = __OFADD__(v30, 1);
  v32 = v30 + 1;
  if (!v31)
  {
    *(_QWORD *)(v29 + 16) = v32;
    return;
  }
LABEL_37:
  __break(1u);
}

void sub_2459A9F64(unint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  id v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  char v33;
  uint64_t v34;
  id v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v1 = a1;
  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_2459B121C();
    swift_bridgeObjectRelease();
    if (v5)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_2574D77C0);
      v3 = sub_2459B11A4();
      if (!v2)
        goto LABEL_4;
LABEL_8:
      swift_bridgeObjectRetain();
      v4 = sub_2459B121C();
      swift_bridgeObjectRelease();
      if (!v4)
        return;
      goto LABEL_9;
    }
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  v3 = MEMORY[0x24BEE4B08];
  if (v2)
    goto LABEL_8;
LABEL_4:
  v4 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    return;
LABEL_9:
  v6 = v3 + 56;
  v42 = v4;
  if ((v1 & 0xC000000000000001) != 0)
  {
    v7 = 0;
    v40 = v1;
    while (1)
    {
      while (1)
      {
        v8 = MEMORY[0x24953F6D8](v7, v1);
        v9 = __OFADD__(v7++, 1);
        if (v9)
        {
          __break(1u);
          goto LABEL_36;
        }
        v10 = v8;
        v11 = sub_2459B10FC();
        v12 = -1 << *(_BYTE *)(v3 + 32);
        v13 = v11 & ~v12;
        v14 = v13 >> 6;
        v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
        v16 = 1 << v13;
        if (((1 << v13) & v15) != 0)
          break;
LABEL_20:
        *(_QWORD *)(v6 + 8 * v14) = v16 | v15;
        *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v13) = v10;
        v22 = *(_QWORD *)(v3 + 16);
        v9 = __OFADD__(v22, 1);
        v23 = v22 + 1;
        if (v9)
          goto LABEL_37;
        *(_QWORD *)(v3 + 16) = v23;
        if (v7 == v4)
          return;
      }
      sub_2459A330C(0, &qword_2574D7790);
      v17 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
      v18 = sub_2459B1108();

      if ((v18 & 1) == 0)
      {
        v19 = ~v12;
        while (1)
        {
          v13 = (v13 + 1) & v19;
          v14 = v13 >> 6;
          v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
          v16 = 1 << v13;
          if ((v15 & (1 << v13)) == 0)
            break;
          v20 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
          v21 = sub_2459B1108();

          if ((v21 & 1) != 0)
            goto LABEL_11;
        }
        v1 = v40;
        v4 = v42;
        goto LABEL_20;
      }
LABEL_11:
      swift_unknownObjectRelease();
      v1 = v40;
      v4 = v42;
      if (v7 == v42)
        return;
    }
  }
  v24 = 0;
  v39 = v1 + 32;
  v41 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v24 != v41)
  {
    v25 = *(id *)(v39 + 8 * v24);
    v26 = sub_2459B10FC();
    v27 = -1 << *(_BYTE *)(v3 + 32);
    v28 = v26 & ~v27;
    v29 = v28 >> 6;
    v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
    v31 = 1 << v28;
    if (((1 << v28) & v30) != 0)
    {
      sub_2459A330C(0, &qword_2574D7790);
      v32 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
      v33 = sub_2459B1108();

      if ((v33 & 1) != 0)
      {
LABEL_24:

        goto LABEL_25;
      }
      v34 = ~v27;
      while (1)
      {
        v28 = (v28 + 1) & v34;
        v29 = v28 >> 6;
        v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
        v31 = 1 << v28;
        if ((v30 & (1 << v28)) == 0)
          break;
        v35 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
        v36 = sub_2459B1108();

        if ((v36 & 1) != 0)
          goto LABEL_24;
      }
    }
    *(_QWORD *)(v6 + 8 * v29) = v31 | v30;
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v28) = v25;
    v37 = *(_QWORD *)(v3 + 16);
    v9 = __OFADD__(v37, 1);
    v38 = v37 + 1;
    if (v9)
      goto LABEL_38;
    *(_QWORD *)(v3 + 16) = v38;
LABEL_25:
    if (++v24 == v42)
      return;
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

uint64_t sub_2459AA2C0(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  char isUniquelyReferenced_nonNull_native;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;

  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) == 0)
  {
LABEL_2:
    v2 = MEMORY[0x24BEE4B08];
    if (!(a1 >> 62))
      goto LABEL_3;
LABEL_20:
    swift_bridgeObjectRetain();
    result = sub_2459B121C();
    v3 = result;
    if (result)
      goto LABEL_4;
LABEL_21:
    swift_bridgeObjectRelease();
    return v2;
  }
LABEL_18:
  if (!sub_2459B121C())
    goto LABEL_2;
  sub_2459A9F64(MEMORY[0x24BEE4AF8]);
  v2 = v18;
  if (a1 >> 62)
    goto LABEL_20;
LABEL_3:
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain();
  if (!v3)
    goto LABEL_21;
LABEL_4:
  if (v3 >= 1)
  {
    v5 = 0;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v9 = (id)MEMORY[0x24953F6D8](v5, a1);
      else
        v9 = *(id *)(a1 + 8 * v5 + 32);
      v10 = v9;
      v11 = objc_msgSend(v9, sel_payloadAddress);
      sub_2459B100C();

      v12 = objc_allocWithZone(MEMORY[0x24BE63F60]);
      v13 = (void *)sub_2459B0FE8();
      swift_bridgeObjectRelease();
      v14 = objc_msgSend(v12, sel_initWithDomain_, v13);

      if ((v2 & 0xC000000000000001) != 0)
      {
        if (v2 < 0)
          v15 = v2;
        else
          v15 = v2 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain();
        v16 = sub_2459B115C();
        swift_bridgeObjectRelease();
        if (__OFADD__(v16, 1))
        {
          __break(1u);
          goto LABEL_18;
        }
        v19 = sub_2459A8330(v15, v16 + 1, &qword_2574D77C0, &qword_2574D7790);
        sub_2459A9C4C((uint64_t)v14, 1);
        v8 = v17;
        v2 = v19;

      }
      else
      {
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        sub_2459A9C4C((uint64_t)v14, isUniquelyReferenced_nonNull_native);
        v8 = v7;

        swift_bridgeObjectRelease();
      }

      if (v3 == ++v5)
        goto LABEL_21;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2459AA4F8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char isUniquelyReferenced_nonNull_native;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v14;
  uint64_t v15;

  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0)
  {
LABEL_15:
    if (sub_2459B121C())
    {
      sub_2459A9F64(MEMORY[0x24BEE4AF8]);
      v2 = v14;
      v3 = *(_QWORD *)(a1 + 16);
      if (v3)
        goto LABEL_3;
      return v2;
    }
  }
  v2 = MEMORY[0x24BEE4B08];
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
LABEL_3:
    swift_bridgeObjectRetain();
    for (a1 += 40; ; a1 += 16)
    {
      v7 = objc_allocWithZone(MEMORY[0x24BE63F60]);
      swift_bridgeObjectRetain();
      v8 = (void *)sub_2459B0FE8();
      swift_bridgeObjectRelease();
      v9 = objc_msgSend(v7, sel_initWithDomain_, v8);

      if ((v2 & 0xC000000000000001) != 0)
      {
        if (v2 < 0)
          v10 = v2;
        else
          v10 = v2 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain();
        v11 = sub_2459B115C();
        swift_bridgeObjectRelease();
        if (__OFADD__(v11, 1))
        {
          __break(1u);
          goto LABEL_15;
        }
        v15 = sub_2459A8330(v10, v11 + 1, &qword_2574D77C0, &qword_2574D7790);
        sub_2459A9C4C((uint64_t)v9, 1);
        v2 = v15;

      }
      else
      {
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        sub_2459A9C4C((uint64_t)v9, isUniquelyReferenced_nonNull_native);
        v6 = v5;
        swift_bridgeObjectRelease();

      }
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        return v2;
      }
    }
  }
  return v2;
}

id sub_2459AA6B4(void *a1)
{
  void *v2;
  id v3;
  id v4;
  unsigned int v5;
  id v6;
  unsigned int v7;
  id v8;
  void *v9;
  unint64_t v10;
  id v11;
  unsigned int v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;

  v2 = (void *)objc_opt_self();
  v3 = objc_msgSend(v2, sel_nonePolicy);
  v4 = objc_msgSend(a1, sel_payloadRestrictWeb);
  v5 = objc_msgSend(v4, sel_BOOLValue);

  if (v5)
  {
    v6 = objc_msgSend(a1, sel_payloadWhiteListEnabled);
    v7 = objc_msgSend(v6, sel_BOOLValue);

    if (v7)
    {
      v8 = objc_msgSend(a1, sel_payloadSiteWhiteList);
      if (v8)
      {
        v9 = v8;
        sub_2459A330C(0, &qword_2574D77D0);
        v10 = sub_2459B1060();

      }
      else
      {
        v10 = MEMORY[0x24BEE4AF8];
      }
      sub_2459AA2C0(v10);
      swift_bridgeObjectRelease();
      sub_2459A330C(0, &qword_2574D7790);
      sub_2459AAAA8(&qword_2574D7798, &qword_2574D7790);
      v17 = (void *)sub_2459B106C();
      swift_bridgeObjectRelease();
      v18 = objc_msgSend(v2, sel_allPolicyWithExceptions_, v17);
    }
    else
    {
      v11 = objc_msgSend(a1, sel_payloadUseContentFilter);
      v12 = objc_msgSend(v11, sel_BOOLValue);

      v13 = objc_msgSend(a1, sel_payloadFilterBlackList);
      v14 = v13;
      if (v12)
      {
        if (v13)
        {
          v15 = sub_2459B1060();

        }
        else
        {
          v15 = MEMORY[0x24BEE4AF8];
        }
        sub_2459AA4F8(v15);
        swift_bridgeObjectRelease();
        sub_2459A330C(0, &qword_2574D7790);
        sub_2459AAAA8(&qword_2574D7798, &qword_2574D7790);
        v19 = (void *)sub_2459B106C();
        swift_bridgeObjectRelease();
        v20 = objc_msgSend(a1, sel_payloadFilterWhiteList);
        if (v20)
        {
          v21 = v20;
          v22 = sub_2459B1060();

        }
        else
        {
          v22 = MEMORY[0x24BEE4AF8];
        }
        sub_2459AA4F8(v22);
        swift_bridgeObjectRelease();
        v17 = (void *)sub_2459B106C();
        swift_bridgeObjectRelease();
        v23 = objc_msgSend(v2, sel_autoPolicyWithDomains_exceptions_, v19, v17);

        goto LABEL_20;
      }
      if (v13)
      {
        v16 = sub_2459B1060();

      }
      else
      {
        v16 = MEMORY[0x24BEE4AF8];
      }
      sub_2459AA4F8(v16);
      swift_bridgeObjectRelease();
      sub_2459A330C(0, &qword_2574D7790);
      sub_2459AAAA8(&qword_2574D7798, &qword_2574D7790);
      v17 = (void *)sub_2459B106C();
      swift_bridgeObjectRelease();
      v18 = objc_msgSend(v2, sel_specificPolicyWithDomains_, v17);
    }
    v23 = v18;
LABEL_20:

    v3 = v23;
  }
  if (!objc_msgSend(v3, sel_policy))
  {

    return 0;
  }
  return v3;
}

uint64_t sub_2459AAAA8(unint64_t *a1, unint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_2459A330C(255, a2);
    result = MEMORY[0x24953FB64](MEMORY[0x24BEE5BD8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2459AAAE8()
{
  return swift_deallocObject();
}

void sub_2459AAAF8(void *a1)
{
  uint64_t v1;

  sub_2459A4A8C(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_2459AAB00()
{
  return swift_deallocObject();
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

uint64_t sub_2459AAB28()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_2459AAB64(void *a1)
{
  uint64_t *v1;

  sub_2459A4FDC(a1, v1[2], v1[3], v1[4], v1[5], v1[6]);
}

uint64_t sub_2459AAB74()
{
  return swift_deallocObject();
}

uint64_t sub_2459AAB84()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_2459AABD0(void *a1)
{
  uint64_t v1;

  sub_2459A55DC(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_BYTE *)(v1 + 48), *(_BYTE *)(v1 + 49), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 72));
}

uint64_t sub_2459AAC08()
{
  return swift_deallocObject();
}

uint64_t sub_2459AAC18()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2459AAC44(void *a1)
{
  uint64_t v1;

  return sub_2459A6B30(a1, *(_BYTE *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_2459AAC54()
{
  return swift_deallocObject();
}

unint64_t sub_2459AAC68()
{
  unint64_t result;

  result = qword_2574D74C0;
  if (!qword_2574D74C0)
  {
    result = MEMORY[0x24953FB64](&protocol conformance descriptor for LocalRestrictions.LocalRestrictionsError, &type metadata for LocalRestrictions.LocalRestrictionsError);
    atomic_store(result, (unint64_t *)&qword_2574D74C0);
  }
  return result;
}

uint64_t sub_2459AACB4()
{
  return type metadata accessor for LocalRestrictions();
}

uint64_t type metadata accessor for LocalRestrictions()
{
  uint64_t result;

  result = qword_2574D74F0;
  if (!qword_2574D74F0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2459AACF8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2459B0F28();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for LocalRestrictions()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LocalRestrictions.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 248))();
}

uint64_t dispatch thunk of LocalRestrictions.removeAllRestrictions()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of LocalRestrictions.communicationSafetyPolicy.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of LocalRestrictions.communicationSafetyPolicy.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of LocalRestrictions.communicationSafetyPolicy.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of LocalRestrictions.denyiCloudLogoutAndRequireAutomaticDateAndTime(deny:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t dispatch thunk of LocalRestrictions.updateDefaultWebContentRestrictions(with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of LocalRestrictions.updateAlwaysAllow(with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 304))();
}

uint64_t dispatch thunk of LocalRestrictions.setDowntimeShieldPolicy(with:isManaged:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

uint64_t dispatch thunk of LocalRestrictions.updateDowntime(state:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

uint64_t dispatch thunk of LocalRestrictions.setUpOverrideStore(with:applications:webDomains:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 328))();
}

uint64_t dispatch thunk of LocalRestrictions.updateOverride(with:enabled:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 336))();
}

uint64_t dispatch thunk of LocalRestrictions.setUpUsageLimitStore(with:applications:categories:webDomains:blockAtEndOfLimit:isManaged:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 344))();
}

uint64_t dispatch thunk of LocalRestrictions.updateUsageLimit(with:enabled:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 352))();
}

uint64_t dispatch thunk of LocalRestrictions.disableAllUsageLimits()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 360))();
}

uint64_t dispatch thunk of LocalRestrictions.deleteAppAndWebsiteActivityStores()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 368))();
}

uint64_t dispatch thunk of LocalRestrictions.deleteStores(with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 376))();
}

uint64_t dispatch thunk of LocalRestrictions.update(with:clearAllExistingRestrictions:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 544))();
}

uint64_t getEnumTagSinglePayload for LocalRestrictions.LocalRestrictionsError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for LocalRestrictions.LocalRestrictionsError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2459AAF00 + 4 * byte_2459B1E80[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2459AAF20 + 4 * byte_2459B1E85[v4]))();
}

_BYTE *sub_2459AAF00(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2459AAF20(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2459AAF28(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2459AAF30(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2459AAF38(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2459AAF40(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_2459AAF4C()
{
  return 0;
}

ValueMetadata *type metadata accessor for LocalRestrictions.LocalRestrictionsError()
{
  return &type metadata for LocalRestrictions.LocalRestrictionsError;
}

unint64_t sub_2459AAF68()
{
  unint64_t result;

  result = qword_2574D7760;
  if (!qword_2574D7760)
  {
    result = MEMORY[0x24953FB64](&protocol conformance descriptor for LocalRestrictions.LocalRestrictionsError, &type metadata for LocalRestrictions.LocalRestrictionsError);
    atomic_store(result, (unint64_t *)&qword_2574D7760);
  }
  return result;
}

uint64_t sub_2459AAFAC(unint64_t a1, unint64_t *a2, uint64_t a3, unint64_t *a4, uint64_t *a5)
{
  unint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void **v15;
  void *v16;
  id v17;
  uint64_t v18;

  v10 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_2459B121C();
    swift_bridgeObjectRelease();
  }
  sub_2459A330C(0, a2);
  sub_2459AAAA8(a4, a2);
  result = sub_2459B1084();
  v18 = result;
  if (v10)
  {
    swift_bridgeObjectRetain();
    v12 = sub_2459B121C();
    result = swift_bridgeObjectRelease();
    if (!v12)
      return v18;
  }
  else
  {
    v12 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v12)
      return v18;
  }
  if (v12 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v12; ++i)
      {
        v14 = (void *)MEMORY[0x24953F6D8](i, a1);
        sub_2459A8068(&v17, v14, a2, a3, a5);

      }
    }
    else
    {
      v15 = (void **)(a1 + 32);
      do
      {
        v16 = *v15++;
        sub_2459A8068(&v17, v16, a2, a3, a5);

        --v12;
      }
      while (v12);
    }
    return v18;
  }
  __break(1u);
  return result;
}

void sub_2459AB140(void *a1, id a2)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;

  v4 = objc_msgSend(a2, sel_appStore);
  v5 = objc_msgSend(a1, sel_payloadAllowInAppPurchases);
  objc_msgSend(v5, sel_BOOLValue);
  sub_2459A330C(0, &qword_2574D7768);
  v6 = (void *)sub_2459B10F0();

  objc_msgSend(v4, sel_setDenyInAppPurchases_, v6);
  v7 = objc_msgSend(a2, sel_appStore);
  v8 = objc_msgSend(a1, sel_payloadForceITunesStorePasswordEntry);
  objc_msgSend(v7, sel_setRequirePasswordForPurchases_, v8);

  v9 = objc_msgSend(a2, sel_application);
  v10 = objc_msgSend(a1, sel_payloadAllowAppInstallation);
  objc_msgSend(v10, sel_BOOLValue);
  v11 = (void *)sub_2459B10F0();

  objc_msgSend(v9, sel_setDenyAppInstallation_, v11);
  v12 = objc_msgSend(a2, sel_appStore);
  v13 = objc_msgSend(a1, sel_payloadAllowUIAppInstallation);
  objc_msgSend(v13, sel_BOOLValue);
  v14 = (void *)sub_2459B10F0();

  objc_msgSend(v12, sel_setDenyAppStoreAppInstallation_, v14);
  v15 = objc_msgSend(a2, sel_appStore);
  v16 = objc_msgSend(a1, sel_payloadAllowMarketplaceAppInstallation);
  objc_msgSend(v16, sel_BOOLValue);
  v17 = (void *)sub_2459B10F0();

  objc_msgSend(v15, sel_setDenyMarketplaceAppInstallation_, v17);
  v18 = objc_msgSend(a2, sel_appStore);
  v19 = objc_msgSend(a1, sel_payloadAllowWebDistributionAppInstallation);
  objc_msgSend(v19, sel_BOOLValue);
  v20 = (void *)sub_2459B10F0();

  objc_msgSend(v18, sel_setDenyWebDistributionAppInstallation_, v20);
  v21 = objc_msgSend(a2, sel_application);
  v22 = objc_msgSend(a1, sel_payloadAllowAppRemoval);
  objc_msgSend(v22, sel_BOOLValue);
  v23 = (void *)sub_2459B10F0();

  objc_msgSend(v21, sel_setDenyAppRemoval_, v23);
  v24 = objc_msgSend(a2, sel_application);
  v25 = objc_msgSend(a1, sel_payloadAllowAppClips);
  objc_msgSend(v25, sel_BOOLValue);
  v26 = (id)sub_2459B10F0();

  objc_msgSend(v24, sel_setDenyAppClips_, v26);
}

void sub_2459AB4DC(void *a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  unint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  unint64_t v35;

  v4 = objc_msgSend(a1, sel_payloadBlacklistedAppBundleIDs);
  if (v4)
  {
    v5 = v4;
    v6 = sub_2459B1060();

    v7 = *(_QWORD *)(v6 + 16);
    if (v7)
    {
      v35 = MEMORY[0x24BEE4AF8];
      sub_2459B11EC();
      v8 = v6 + 40;
      do
      {
        v9 = objc_allocWithZone(MEMORY[0x24BE63F10]);
        swift_bridgeObjectRetain();
        v10 = (void *)sub_2459B0FE8();
        swift_bridgeObjectRelease();
        objc_msgSend(v9, sel_initWithBundleIdentifier_, v10);

        sub_2459B11D4();
        sub_2459B11F8();
        sub_2459B1204();
        sub_2459B11E0();
        v8 += 16;
        --v7;
      }
      while (v7);
      v11 = v35;
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      v11 = MEMORY[0x24BEE4AF8];
    }
    v12 = objc_msgSend(a2, sel_application);
    sub_2459AAFAC(v11, &qword_2574D7498, 0x24BE63F10, &qword_2574D74A0, &qword_2574D77C8);
    swift_bridgeObjectRelease();
    sub_2459A330C(0, &qword_2574D7498);
    sub_2459AAAA8(&qword_2574D74A0, &qword_2574D7498);
    v13 = (void *)sub_2459B106C();
    swift_bridgeObjectRelease();
    objc_msgSend(v12, sel_setBlockedApplications_, v13);

  }
  v14 = objc_msgSend(a2, sel_faceTime);
  v15 = objc_msgSend(a1, sel_payloadAllowVideoConferencing);
  objc_msgSend(v15, sel_BOOLValue);
  sub_2459A330C(0, &qword_2574D7768);
  v16 = (void *)sub_2459B10F0();

  objc_msgSend(v14, sel_setDenyFaceTime_, v16);
  v17 = objc_msgSend(a2, sel_faceTime);
  v18 = objc_msgSend(a1, sel_payloadAllowGroupActivity);
  objc_msgSend(v18, sel_BOOLValue);
  v19 = (void *)sub_2459B10F0();

  objc_msgSend(v17, sel_setDenySharePlay_, v19);
  v20 = objc_msgSend(a2, sel_media);
  v21 = objc_msgSend(a1, sel_payloadAllowiTunes);
  objc_msgSend(v21, sel_BOOLValue);
  v22 = (void *)sub_2459B10F0();

  objc_msgSend(v20, sel_setDenyiTunes_, v22);
  v23 = objc_msgSend(a2, sel_media);
  v24 = objc_msgSend(a1, sel_payloadAllowPodcasts);
  objc_msgSend(v24, sel_BOOLValue);
  v25 = (void *)sub_2459B10F0();

  objc_msgSend(v23, sel_setDenyPodcasts_, v25);
  v26 = objc_msgSend(a2, sel_messages);
  v27 = objc_msgSend(a1, sel_payloadAllowChat);
  objc_msgSend(v27, sel_BOOLValue);
  v28 = (void *)sub_2459B10F0();

  objc_msgSend(v26, sel_setDenyiMessage_, v28);
  v29 = objc_msgSend(a2, sel_news);
  v30 = objc_msgSend(a1, sel_payloadAllowNews);
  objc_msgSend(v30, sel_BOOLValue);
  v31 = (void *)sub_2459B10F0();

  objc_msgSend(v29, sel_setDenyNews_, v31);
  v32 = objc_msgSend(a2, sel_safari);
  v33 = objc_msgSend(a1, sel_payloadAllowSafari);
  objc_msgSend(v33, sel_BOOLValue);
  v34 = (id)sub_2459B10F0();

  objc_msgSend(v32, sel_setDenySafari_, v34);
}

void sub_2459AB9F0(void *a1, id a2)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v4 = objc_msgSend(a2, sel_media);
  v5 = objc_msgSend(a1, sel_payloadAllowBookstore);
  objc_msgSend(v5, sel_BOOLValue);
  sub_2459A330C(0, &qword_2574D7768);
  v6 = (void *)sub_2459B10F0();

  objc_msgSend(v4, sel_setDenyBookstore_, v6);
  v7 = objc_msgSend(a2, sel_media);
  v8 = objc_msgSend(a1, sel_payloadAllowBookstoreErotica);
  objc_msgSend(v8, sel_BOOLValue);
  v9 = (id)sub_2459B10F0();

  objc_msgSend(v7, sel_setDenyBookstoreErotica_, v9);
}

void sub_2459ABB28(void *a1, id a2)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v4 = objc_msgSend(a2, sel_cellular);
  v5 = objc_msgSend(a1, sel_payloadAllowAppCellularDataModification);
  objc_msgSend(v5, sel_BOOLValue);
  sub_2459A330C(0, &qword_2574D7768);
  v6 = (void *)sub_2459B10F0();

  objc_msgSend(v4, sel_setLockAppCellularData_, v6);
  v7 = objc_msgSend(a2, sel_cellular);
  v8 = objc_msgSend(a1, sel_payloadAllowCellularPlanModification);
  objc_msgSend(v8, sel_BOOLValue);
  v9 = (id)sub_2459B10F0();

  objc_msgSend(v7, sel_setLockCellularPlan_, v9);
}

void sub_2459ABC60(void *a1, id a2)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v4 = objc_msgSend(a2, sel_camera);
  v5 = objc_msgSend(a1, sel_payloadAllowCamera);
  objc_msgSend(v5, sel_BOOLValue);
  sub_2459A330C(0, &qword_2574D7768);
  v6 = (void *)sub_2459B10F0();

  objc_msgSend(v4, sel_setDenyCamera_, v6);
  v7 = objc_msgSend(a2, sel_camera);
  v8 = objc_msgSend(a1, sel_payloadAllowScreenRecording);
  objc_msgSend(v8, sel_BOOLValue);
  v9 = (id)sub_2459B10F0();

  objc_msgSend(v7, sel_setDenyScreenRecording_, v9);
}

void sub_2459ABD98(void *a1, void *a2)
{
  id v4;
  unint64_t v5;
  _QWORD *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;

  v4 = objc_msgSend(a1, sel_payloadAllowedGameCenterOtherPlayerTypes);
  v5 = (unint64_t)objc_msgSend(v4, sel_integerValue);

  if (v5 <= 2)
  {
    v6 = (_QWORD *)qword_2516BBFB0[v5];
    v7 = objc_msgSend(a2, sel_gameCenter);
    objc_msgSend(v7, sel_setAllowedOtherPlayerTypes_, *v6);

  }
  v8 = objc_msgSend(a2, sel_gameCenter);
  v9 = objc_msgSend(a1, sel_payloadAllowMultiplayerGaming);
  objc_msgSend(v9, sel_BOOLValue);
  sub_2459A330C(0, &qword_2574D7768);
  v10 = (void *)sub_2459B10F0();

  objc_msgSend(v8, sel_setDenyMultiplayerGaming_, v10);
  v11 = objc_msgSend(a2, sel_gameCenter);
  v12 = objc_msgSend(a1, sel_payloadAllowAddingGameCenterFriends);
  objc_msgSend(v12, sel_BOOLValue);
  v13 = (void *)sub_2459B10F0();

  objc_msgSend(v11, sel_setDenyAddingFriends_, v13);
  v14 = objc_msgSend(a2, sel_gameCenter);
  v15 = objc_msgSend(a1, sel_payloadAllowGameCenter);
  objc_msgSend(v15, sel_BOOLValue);
  v16 = (void *)sub_2459B10F0();

  objc_msgSend(v14, sel_setDenyGameCenter_, v16);
  v17 = objc_msgSend(a2, sel_gameCenter);
  v18 = objc_msgSend(a1, sel_payloadAllowGameCenterNearbyMultiplayer);
  objc_msgSend(v18, sel_BOOLValue);
  v19 = (void *)sub_2459B10F0();

  objc_msgSend(v17, sel_setDenyNearbyMultiplayer_, v19);
  v20 = objc_msgSend(a2, sel_gameCenter);
  v21 = objc_msgSend(a1, sel_payloadAllowGameCenterPrivateMessaging);
  objc_msgSend(v21, sel_BOOLValue);
  v22 = (void *)sub_2459B10F0();

  objc_msgSend(v20, sel_setDenyPrivateMessaging_, v22);
  v23 = objc_msgSend(a2, sel_gameCenter);
  v24 = objc_msgSend(a1, sel_payloadAllowGameCenterProfilePrivacyModification);
  objc_msgSend(v24, sel_BOOLValue);
  v25 = (void *)sub_2459B10F0();

  objc_msgSend(v23, sel_setLockProfilePrivacy_, v25);
  v26 = objc_msgSend(a2, sel_gameCenter);
  v27 = objc_msgSend(a1, sel_payloadAllowGameCenterProfileModification);
  objc_msgSend(v27, sel_BOOLValue);
  v28 = (void *)sub_2459B10F0();

  objc_msgSend(v26, sel_setLockProfile_, v28);
  v29 = objc_msgSend(a2, sel_gameCenter);
  v30 = objc_msgSend(a1, sel_payloadAllowGameCenterFriendsSharingModification);
  objc_msgSend(v30, sel_BOOLValue);
  v31 = (id)sub_2459B10F0();

  objc_msgSend(v29, sel_setLockFriendsSharing_, v31);
}

void sub_2459AC1AC(void *a1, id a2)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;

  v4 = objc_msgSend(a2, sel_media);
  v5 = objc_msgSend(a1, sel_payloadAllowMusicService);
  objc_msgSend(v5, sel_BOOLValue);
  sub_2459A330C(0, &qword_2574D7768);
  v6 = (void *)sub_2459B10F0();

  objc_msgSend(v4, sel_setDenyMusicService_, v6);
  v7 = objc_msgSend(a2, sel_media);
  v8 = objc_msgSend(a1, sel_payloadAllowMusicArtistActivity);
  objc_msgSend(v8, sel_BOOLValue);
  v9 = (void *)sub_2459B10F0();

  objc_msgSend(v7, sel_setDenyMusicArtistActivity_, v9);
  v10 = objc_msgSend(a2, sel_media);
  v11 = objc_msgSend(a1, sel_payloadAllowMusicVideos);
  objc_msgSend(v11, sel_BOOLValue);
  v12 = (void *)sub_2459B10F0();

  objc_msgSend(v10, sel_setDenyMusicVideos_, v12);
  v13 = objc_msgSend(a2, sel_media);
  v14 = objc_msgSend(a1, sel_payloadAllowSharedLibraries);
  objc_msgSend(v14, sel_BOOLValue);
  v15 = (id)sub_2459B10F0();

  objc_msgSend(v13, sel_setDenySharedMediaLibraries_, v15);
}

void sub_2459AC3B4(void *a1, id a2)
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v4 = objc_msgSend(a2, sel_appStore);
  v5 = objc_msgSend(a1, sel_payloadRatingApps);
  objc_msgSend(v4, sel_setMaximumRating_, v5);

  v6 = objc_msgSend(a2, sel_media);
  v7 = objc_msgSend(a1, sel_payloadRatingMovies);
  objc_msgSend(v6, sel_setMaximumMovieRating_, v7);

  v8 = objc_msgSend(a2, sel_media);
  v9 = objc_msgSend(a1, sel_payloadRatingTVShows);
  objc_msgSend(v8, sel_setMaximumTVShowRating_, v9);

  v10 = objc_msgSend(a2, sel_media);
  v11 = objc_msgSend(a1, sel_payloadAllowExplicitContent);
  if (v11)
  {
    v12 = v11;
    objc_msgSend(v11, sel_BOOLValue);
    sub_2459A330C(0, &qword_2574D7768);
    v13 = (id)sub_2459B10F0();

  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v10, sel_setDenyExplicitContent_, v13);

}

void sub_2459AC580(void *a1, id a2)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;

  v4 = objc_msgSend(a2, sel_siri);
  v5 = objc_msgSend(a1, sel_payloadAllowAssistant);
  objc_msgSend(v5, sel_BOOLValue);
  sub_2459A330C(0, &qword_2574D7768);
  v6 = (void *)sub_2459B10F0();

  objc_msgSend(v4, sel_setDenySiri_, v6);
  v7 = objc_msgSend(a2, sel_keyboard);
  v8 = objc_msgSend(a1, sel_payloadAllowDictation);
  objc_msgSend(v8, sel_BOOLValue);
  v9 = (void *)sub_2459B10F0();

  objc_msgSend(v7, sel_setDenyDictation_, v9);
  v10 = objc_msgSend(a2, sel_siri);
  v11 = objc_msgSend(a1, sel_payloadAllowAssistantUserGeneratedContent);
  objc_msgSend(v11, sel_BOOLValue);
  v12 = (void *)sub_2459B10F0();

  objc_msgSend(v10, sel_setDenySiriUserGeneratedContent_, v12);
  v13 = objc_msgSend(a2, sel_siri);
  v14 = objc_msgSend(a1, sel_payloadForceAssistantProfanityFilter);
  objc_msgSend(v13, sel_setForceSiriProfanityFilter_, v14);

}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_2459AC794(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2459AC7F0(uint64_t a1)
{
  return sub_2459ACC3C(a1, qword_2574D77D8);
}

uint64_t static DeviceActivityName.downtime_weekday_1.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2459AC870(&qword_2574D6DD0, (uint64_t)qword_2574D77D8, a1);
}

uint64_t sub_2459AC830(uint64_t a1)
{
  return sub_2459ACC3C(a1, qword_2574D77F0);
}

uint64_t static DeviceActivityName.downtime_weekday_2.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2459AC870(&qword_2574D6DD8, (uint64_t)qword_2574D77F0, a1);
}

uint64_t sub_2459AC870@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_2459B0EF8();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_2459AC8D8(uint64_t a1)
{
  return sub_2459ACC3C(a1, qword_2574D7808);
}

uint64_t static DeviceActivityName.downtime_weekday_3.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2459AC870(&qword_2574D6DE0, (uint64_t)qword_2574D7808, a1);
}

uint64_t sub_2459AC918(uint64_t a1)
{
  return sub_2459ACC3C(a1, qword_2574D7820);
}

uint64_t static DeviceActivityName.downtime_weekday_4.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2459AC870(&qword_2574D6DE8, (uint64_t)qword_2574D7820, a1);
}

uint64_t sub_2459AC958(uint64_t a1)
{
  return sub_2459ACC3C(a1, qword_2574D7838);
}

uint64_t static DeviceActivityName.downtime_weekday_5.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2459AC870(&qword_2574D6DF0, (uint64_t)qword_2574D7838, a1);
}

uint64_t sub_2459AC998(uint64_t a1)
{
  return sub_2459ACC3C(a1, qword_2574D7850);
}

uint64_t static DeviceActivityName.downtime_weekday_6.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2459AC870(&qword_2574D6DF8, (uint64_t)qword_2574D7850, a1);
}

uint64_t sub_2459AC9D8(uint64_t a1)
{
  return sub_2459ACC3C(a1, qword_2574D7868);
}

uint64_t static DeviceActivityName.downtime_weekday_7.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2459AC870(&qword_2574D6E00, (uint64_t)qword_2574D7868, a1);
}

uint64_t sub_2459ACA18(uint64_t a1)
{
  return sub_2459ACC3C(a1, qword_2574D7880);
}

uint64_t static DeviceActivityName.downtime_enable_override.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2459AC870(&qword_2574D6E08, (uint64_t)qword_2574D7880, a1);
}

uint64_t sub_2459ACA58(uint64_t a1)
{
  return sub_2459ACC3C(a1, qword_2574D7898);
}

uint64_t static DeviceActivityName.downtime_disable_override.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2459AC870(&qword_2574D6E10, (uint64_t)qword_2574D7898, a1);
}

uint64_t sub_2459ACA98(uint64_t a1)
{
  return sub_2459ACC3C(a1, qword_2574D78B0);
}

uint64_t static DeviceActivityName.usagelimit_weekday_1.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2459AC870(&qword_2574D6E18, (uint64_t)qword_2574D78B0, a1);
}

uint64_t sub_2459ACAD8(uint64_t a1)
{
  return sub_2459ACC3C(a1, qword_2574D78C8);
}

uint64_t static DeviceActivityName.usagelimit_weekday_2.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2459AC870(&qword_2574D6E20, (uint64_t)qword_2574D78C8, a1);
}

uint64_t sub_2459ACB18(uint64_t a1)
{
  return sub_2459ACC3C(a1, qword_2574D78E0);
}

uint64_t static DeviceActivityName.usagelimit_weekday_3.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2459AC870(&qword_2574D6E28, (uint64_t)qword_2574D78E0, a1);
}

uint64_t sub_2459ACB58(uint64_t a1)
{
  return sub_2459ACC3C(a1, qword_2574D78F8);
}

uint64_t static DeviceActivityName.usagelimit_weekday_4.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2459AC870(&qword_2574D6E30, (uint64_t)qword_2574D78F8, a1);
}

uint64_t sub_2459ACB98(uint64_t a1)
{
  return sub_2459ACC3C(a1, qword_2574D7910);
}

uint64_t static DeviceActivityName.usagelimit_weekday_5.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2459AC870(&qword_2574D6E38, (uint64_t)qword_2574D7910, a1);
}

uint64_t sub_2459ACBD8(uint64_t a1)
{
  return sub_2459ACC3C(a1, qword_2574D7928);
}

uint64_t static DeviceActivityName.usagelimit_weekday_6.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2459AC870(&qword_2574D6E40, (uint64_t)qword_2574D7928, a1);
}

uint64_t sub_2459ACC18(uint64_t a1)
{
  return sub_2459ACC3C(a1, qword_2574D7940);
}

uint64_t sub_2459ACC3C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_2459B0EF8();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_2459B0F04();
}

uint64_t static DeviceActivityName.usagelimit_weekday_7.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2459AC870(&qword_2574D6E48, (uint64_t)qword_2574D7940, a1);
}

uint64_t DeviceActivityName.isDowntime.getter()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  unint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t);
  char v20;
  char v21;
  void (*v22)(char *, uint64_t);
  char *v23;
  char *v24;
  char *v25;
  char v26;
  char v28;
  char v29;
  char v30;
  char v31;
  unint64_t v32;
  char *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v1 = v0;
  v2 = sub_2459B0EF8();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v35 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v34 = (char *)&v32 - v7;
  v8 = MEMORY[0x24BDAC7A8](v6);
  v33 = (char *)&v32 - v9;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v32 - v11;
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v32 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v32 - v16;
  if (qword_2574D6DD0 != -1)
    swift_once();
  __swift_project_value_buffer(v2, (uint64_t)qword_2574D77D8);
  v18 = sub_2459ADB9C();
  sub_2459B1048();
  v32 = v18;
  sub_2459B1048();
  if (v38 == v36 && v39 == v37)
  {
    swift_bridgeObjectRelease_n();
    v19 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v19(v17, v0, v2);
    v20 = 1;
  }
  else
  {
    v21 = sub_2459B1264();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v19 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v19(v17, v0, v2);
    if ((v21 & 1) != 0)
    {
      v20 = 1;
    }
    else
    {
      if (qword_2574D6DD8 != -1)
        swift_once();
      __swift_project_value_buffer(v2, (uint64_t)qword_2574D77F0);
      sub_2459B1048();
      sub_2459B1048();
      if (v38 == v36 && v39 == v37)
        v20 = 1;
      else
        v20 = sub_2459B1264();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  v22 = *(void (**)(char *, uint64_t))(v3 + 8);
  v22(v17, v2);
  v19(v15, v1, v2);
  v23 = v33;
  if ((v20 & 1) != 0)
    goto LABEL_21;
  if (qword_2574D6DE0 != -1)
    swift_once();
  __swift_project_value_buffer(v2, (uint64_t)qword_2574D7808);
  sub_2459B1048();
  sub_2459B1048();
  if (v38 == v36 && v39 == v37)
  {
    swift_bridgeObjectRelease_n();
LABEL_21:
    v22(v15, v2);
    v19(v12, v1, v2);
    v24 = v34;
LABEL_22:
    v22(v12, v2);
    v19(v23, v1, v2);
    v25 = v35;
LABEL_23:
    v22(v23, v2);
    v19(v24, v1, v2);
LABEL_24:
    v22(v24, v2);
    v19(v25, v1, v2);
LABEL_25:
    v26 = 1;
    goto LABEL_26;
  }
  v28 = sub_2459B1264();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v22(v15, v2);
  v19(v12, v1, v2);
  v24 = v34;
  if ((v28 & 1) != 0)
    goto LABEL_22;
  if (qword_2574D6DE8 != -1)
    swift_once();
  __swift_project_value_buffer(v2, (uint64_t)qword_2574D7820);
  sub_2459B1048();
  sub_2459B1048();
  if (v38 == v36 && v39 == v37)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_22;
  }
  v29 = sub_2459B1264();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v22(v12, v2);
  v19(v23, v1, v2);
  v25 = v35;
  if ((v29 & 1) != 0)
    goto LABEL_23;
  if (qword_2574D6DF0 != -1)
    swift_once();
  __swift_project_value_buffer(v2, (uint64_t)qword_2574D7838);
  sub_2459B1048();
  sub_2459B1048();
  if (v38 == v36 && v39 == v37)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_23;
  }
  v30 = sub_2459B1264();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v22(v23, v2);
  v19(v24, v1, v2);
  if ((v30 & 1) != 0)
    goto LABEL_24;
  if (qword_2574D6DF8 != -1)
    swift_once();
  __swift_project_value_buffer(v2, (uint64_t)qword_2574D7850);
  sub_2459B1048();
  sub_2459B1048();
  if (v38 == v36 && v39 == v37)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_24;
  }
  v31 = sub_2459B1264();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v22(v24, v2);
  v19(v25, v1, v2);
  if ((v31 & 1) != 0)
    goto LABEL_25;
  if (qword_2574D6E00 != -1)
    swift_once();
  __swift_project_value_buffer(v2, (uint64_t)qword_2574D7868);
  sub_2459B1048();
  sub_2459B1048();
  if (v38 == v36 && v39 == v37)
    v26 = 1;
  else
    v26 = sub_2459B1264();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_26:
  v22(v25, v2);
  return v26 & 1;
}

uint64_t DeviceActivityName.isUsageLimit.getter()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  unint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t);
  char v20;
  char v21;
  void (*v22)(char *, uint64_t);
  char *v23;
  char *v24;
  char *v25;
  char v26;
  char v28;
  char v29;
  char v30;
  char v31;
  unint64_t v32;
  char *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v1 = v0;
  v2 = sub_2459B0EF8();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v35 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v34 = (char *)&v32 - v7;
  v8 = MEMORY[0x24BDAC7A8](v6);
  v33 = (char *)&v32 - v9;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v32 - v11;
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v32 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v32 - v16;
  if (qword_2574D6E18 != -1)
    swift_once();
  __swift_project_value_buffer(v2, (uint64_t)qword_2574D78B0);
  v18 = sub_2459ADB9C();
  sub_2459B1048();
  v32 = v18;
  sub_2459B1048();
  if (v38 == v36 && v39 == v37)
  {
    swift_bridgeObjectRelease_n();
    v19 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v19(v17, v0, v2);
    v20 = 1;
  }
  else
  {
    v21 = sub_2459B1264();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v19 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v19(v17, v0, v2);
    if ((v21 & 1) != 0)
    {
      v20 = 1;
    }
    else
    {
      if (qword_2574D6E20 != -1)
        swift_once();
      __swift_project_value_buffer(v2, (uint64_t)qword_2574D78C8);
      sub_2459B1048();
      sub_2459B1048();
      if (v38 == v36 && v39 == v37)
        v20 = 1;
      else
        v20 = sub_2459B1264();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  v22 = *(void (**)(char *, uint64_t))(v3 + 8);
  v22(v17, v2);
  v19(v15, v1, v2);
  v23 = v33;
  if ((v20 & 1) != 0)
    goto LABEL_21;
  if (qword_2574D6E28 != -1)
    swift_once();
  __swift_project_value_buffer(v2, (uint64_t)qword_2574D78E0);
  sub_2459B1048();
  sub_2459B1048();
  if (v38 == v36 && v39 == v37)
  {
    swift_bridgeObjectRelease_n();
LABEL_21:
    v22(v15, v2);
    v19(v12, v1, v2);
    v24 = v34;
LABEL_22:
    v22(v12, v2);
    v19(v23, v1, v2);
    v25 = v35;
LABEL_23:
    v22(v23, v2);
    v19(v24, v1, v2);
LABEL_24:
    v22(v24, v2);
    v19(v25, v1, v2);
LABEL_25:
    v26 = 1;
    goto LABEL_26;
  }
  v28 = sub_2459B1264();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v22(v15, v2);
  v19(v12, v1, v2);
  v24 = v34;
  if ((v28 & 1) != 0)
    goto LABEL_22;
  if (qword_2574D6E30 != -1)
    swift_once();
  __swift_project_value_buffer(v2, (uint64_t)qword_2574D78F8);
  sub_2459B1048();
  sub_2459B1048();
  if (v38 == v36 && v39 == v37)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_22;
  }
  v29 = sub_2459B1264();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v22(v12, v2);
  v19(v23, v1, v2);
  v25 = v35;
  if ((v29 & 1) != 0)
    goto LABEL_23;
  if (qword_2574D6E38 != -1)
    swift_once();
  __swift_project_value_buffer(v2, (uint64_t)qword_2574D7910);
  sub_2459B1048();
  sub_2459B1048();
  if (v38 == v36 && v39 == v37)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_23;
  }
  v30 = sub_2459B1264();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v22(v23, v2);
  v19(v24, v1, v2);
  if ((v30 & 1) != 0)
    goto LABEL_24;
  if (qword_2574D6E40 != -1)
    swift_once();
  __swift_project_value_buffer(v2, (uint64_t)qword_2574D7928);
  sub_2459B1048();
  sub_2459B1048();
  if (v38 == v36 && v39 == v37)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_24;
  }
  v31 = sub_2459B1264();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v22(v24, v2);
  v19(v25, v1, v2);
  if ((v31 & 1) != 0)
    goto LABEL_25;
  if (qword_2574D6E48 != -1)
    swift_once();
  __swift_project_value_buffer(v2, (uint64_t)qword_2574D7940);
  sub_2459B1048();
  sub_2459B1048();
  if (v38 == v36 && v39 == v37)
    v26 = 1;
  else
    v26 = sub_2459B1264();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_26:
  v22(v25, v2);
  return v26 & 1;
}

unint64_t sub_2459ADB9C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2574D7958;
  if (!qword_2574D7958)
  {
    v1 = sub_2459B0EF8();
    result = MEMORY[0x24953FB64](MEMORY[0x24BDC7288], v1);
    atomic_store(result, (unint64_t *)&qword_2574D7958);
  }
  return result;
}

void STUserNotifications.NotificationType.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;

  v1 = sub_2459B0EBC();
  MEMORY[0x24BDAC7A8](v1);
  v2 = type metadata accessor for STUserNotifications.NotificationType();
  MEMORY[0x24BDAC7A8](v2);
  sub_2459ADF8C(v0, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = (char *)sub_2459ADCAC + 4 * byte_2459B1FD0[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_2459ADCAC()
{
  sub_2459B12C4();
  sub_2459B1024();
  swift_bridgeObjectRelease();
  sub_2459B1024();
  swift_bridgeObjectRelease();
  return sub_2459B12DC();
}

uint64_t type metadata accessor for STUserNotifications.NotificationType()
{
  uint64_t result;

  result = qword_2574D7A28;
  if (!qword_2574D7A28)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2459ADF8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for STUserNotifications.NotificationType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t STUserNotifications.NotificationType.hashValue.getter()
{
  sub_2459B12B8();
  STUserNotifications.NotificationType.hash(into:)();
  return sub_2459B12E8();
}

uint64_t sub_2459AE010()
{
  sub_2459B12B8();
  STUserNotifications.NotificationType.hash(into:)();
  return sub_2459B12E8();
}

uint64_t sub_2459AE050()
{
  sub_2459B12B8();
  STUserNotifications.NotificationType.hash(into:)();
  return sub_2459B12E8();
}

uint64_t sub_2459AE08C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_2459B0F28();
  __swift_allocate_value_buffer(v0, qword_2574D7960);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_2574D7960);
  if (qword_2574D6DB0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_2574D7AC0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

BOOL static STUserNotifications.UserNotificationError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t STUserNotifications.UserNotificationError.hash(into:)()
{
  return sub_2459B12C4();
}

uint64_t STUserNotifications.UserNotificationError.hashValue.getter()
{
  sub_2459B12B8();
  sub_2459B12C4();
  return sub_2459B12E8();
}

BOOL sub_2459AE1A0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2459AE1B8()
{
  sub_2459B12B8();
  sub_2459B12C4();
  return sub_2459B12E8();
}

uint64_t sub_2459AE1FC()
{
  return sub_2459B12C4();
}

uint64_t sub_2459AE224()
{
  sub_2459B12B8();
  sub_2459B12C4();
  return sub_2459B12E8();
}

uint64_t static STUserNotifications.post(notification:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[2] = a1;
  v2 = sub_2459B0EEC();
  v1[3] = v2;
  v1[4] = *(_QWORD *)(v2 - 8);
  v1[5] = swift_task_alloc();
  v3 = sub_2459B0EBC();
  v1[6] = v3;
  v1[7] = *(_QWORD *)(v3 - 8);
  v1[8] = swift_task_alloc();
  v1[9] = type metadata accessor for STUserNotifications.NotificationType();
  v1[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2459AE310()
{
  uint64_t *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t *v19;
  _QWORD *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);

  sub_2459AF444(v0[2]);
  v0[11] = (uint64_t)v1;
  v2 = v1;
  sub_2459ADF8C(v0[2], v0[10]);
  if (swift_getEnumCaseMultiPayload() == 2)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v0[7] + 32))(v0[8], v0[10], v0[6]);
    objc_opt_self();
    v3 = swift_dynamicCastObjCClass();
    if (v3)
    {
      v4 = (void *)v3;
      v5 = v0[8];
      v6 = v0[5];
      v22 = v0[7];
      v23 = v0[6];
      v8 = v0[3];
      v7 = v0[4];
      v9 = v2;
      sub_2459B0EE0();
      v10 = (void *)sub_2459B0EA4();
      v11 = (void *)sub_2459B0ED4();
      objc_msgSend(v4, sel_setEndDateComponents_referenceDate_, v10, v11);

      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v5, v23);
    }
    else
    {
      if (qword_2574D6E50 != -1)
        swift_once();
      v12 = sub_2459B0F28();
      __swift_project_value_buffer(v12, (uint64_t)qword_2574D7960);
      v13 = sub_2459B0F10();
      v14 = sub_2459B10A8();
      v15 = os_log_type_enabled(v13, v14);
      v17 = v0[7];
      v16 = v0[8];
      v18 = v0[6];
      if (v15)
      {
        v19 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_24599C000, v13, v14, "Unable to cast context of type downtime to STDeviceDowntimeUserNotificationContext.", v19, 2u);
        MEMORY[0x24953FBF4](v19, -1, -1);
      }

      (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
    }
  }
  else
  {
    sub_2459AF864(v0[10]);
  }
  v24 = (uint64_t (*)(uint64_t))((char *)&dword_2574D7990 + dword_2574D7990);
  v20 = (_QWORD *)swift_task_alloc();
  v0[12] = (uint64_t)v20;
  *v20 = v0;
  v20[1] = sub_2459AE594;
  return v24((uint64_t)v2);
}

uint64_t sub_2459AE594()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2459AE5F8()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2459AE654()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t static STUserNotifications.postNotification(context:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v5 = (uint64_t (*)(uint64_t))((char *)&dword_2574D7990 + dword_2574D7990);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2459AE710;
  return v5(a1);
}

uint64_t sub_2459AE710()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t static STUserNotifications.remove(notification:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_2459AE770()
{
  uint64_t v0;
  void *v1;
  void *v2;

  sub_2459AF444(*(_QWORD *)(v0 + 16));
  v2 = v1;
  sub_2459B01C0(v1);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

void static STUserNotifications.removeNotification(context:)(void *a1)
{
  sub_2459B01C0(a1);
}

uint64_t sub_2459AE7E4()
{
  return swift_continuation_resume();
}

uint64_t sub_2459AE7EC(uint64_t a1, char a2, void *a3)
{
  _QWORD *v4;
  id v5;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574D7468);
    swift_allocError();
    *v4 = a3;
    v5 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    **(_BYTE **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_2459AE86C(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  sub_2459A330C(0, &qword_2574D7A80);
  **(_QWORD **)(*(_QWORD *)(v1 + 64) + 40) = sub_2459B1060();
  return swift_continuation_resume();
}

void *sub_2459AE8C0()
{
  void *result;

  result = (void *)sub_2459AE8DC();
  off_2574D7978 = result;
  return result;
}

unint64_t sub_2459AE8DC()
{
  uint64_t inited;
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D7A60);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2459B2220;
  *(_QWORD *)(inited + 32) = sub_2459B100C();
  *(_QWORD *)(inited + 40) = v1;
  sub_2459B100C();
  v2 = objc_allocWithZone(MEMORY[0x24BDF88B8]);
  v3 = (void *)sub_2459B0FE8();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend(v2, sel_initWithBundleIdentifier_, v3);

  *(_QWORD *)(inited + 48) = v4;
  *(_QWORD *)(inited + 56) = sub_2459B100C();
  *(_QWORD *)(inited + 64) = v5;
  sub_2459B100C();
  v6 = objc_allocWithZone(MEMORY[0x24BDF88B8]);
  v7 = (void *)sub_2459B0FE8();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v6, sel_initWithBundleIdentifier_, v7);

  *(_QWORD *)(inited + 72) = v8;
  *(_QWORD *)(inited + 80) = sub_2459B100C();
  *(_QWORD *)(inited + 88) = v9;
  sub_2459B100C();
  v10 = objc_allocWithZone(MEMORY[0x24BDF88B8]);
  v11 = (void *)sub_2459B0FE8();
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(v10, sel_initWithBundleIdentifier_, v11);

  *(_QWORD *)(inited + 96) = v12;
  return sub_2459A4794(inited);
}

uint64_t static STUserNotifications.notificationCentersByBundle.getter()
{
  if (qword_2574D6E58 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

void _s15ScreenTimeSwift19STUserNotificationsV16NotificationTypeO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
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
  char *v13;
  char *v14;
  _QWORD v15[4];

  v4 = sub_2459B0EBC();
  v15[2] = *(_QWORD *)(v4 - 8);
  v15[3] = v4;
  MEMORY[0x24BDAC7A8](v4);
  v5 = type metadata accessor for STUserNotifications.NotificationType();
  v6 = MEMORY[0x24BDAC7A8](v5);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v9 = MEMORY[0x24BDAC7A8](v8);
  MEMORY[0x24BDAC7A8](v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D7A88);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v15 + *(int *)(v11 + 48) - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2459ADF8C(a1, (uint64_t)v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2459ADF8C(a2, (uint64_t)v13);
  v14 = (char *)sub_2459AEC48 + 4 * byte_2459B1FDE[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

BOOL sub_2459AEC48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  BOOL v8;
  uint64_t v10;
  uint64_t v11;
  double v12;
  char v14;
  char v16;

  sub_2459ADF8C(v2, v0);
  v4 = *(_QWORD *)v0;
  v3 = *(_QWORD *)(v0 + 8);
  v5 = *(_QWORD *)(v0 + 16);
  v6 = *(_QWORD *)(v0 + 24);
  v7 = *(double *)(v0 + 32);
  if (!swift_getEnumCaseMultiPayload())
  {
    v11 = *(_QWORD *)(v1 + 16);
    v10 = *(_QWORD *)(v1 + 24);
    v12 = *(double *)(v1 + 32);
    if (v4 == *(_QWORD *)v1 && v3 == *(_QWORD *)(v1 + 8))
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v14 = sub_2459B1264();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v14 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_17:
        sub_2459AF864(v2);
        return 0;
      }
    }
    if (v5 == v11 && v6 == v10)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v16 = sub_2459B1264();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v16 & 1) == 0)
        goto LABEL_17;
    }
    v8 = v7 == v12;
    sub_2459AF864(v2);
    return v8;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2459B0E64(v2);
  return 0;
}

void sub_2459AF444(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;

  v2 = type metadata accessor for STUserNotifications.NotificationType();
  MEMORY[0x24BDAC7A8](v2);
  sub_2459ADF8C(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = (char *)sub_2459AF4DC + 4 * byte_2459B1FEC[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

id sub_2459AF4DC()
{
  uint64_t v0;
  double v1;
  id v2;
  void *v3;
  id v4;
  void *v5;

  v1 = *(double *)(v0 + 32);
  v2 = objc_allocWithZone(MEMORY[0x24BE844C0]);
  v3 = (void *)sub_2459B0FE8();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend(v2, sel_initWithIdentifier_, v3);

  v5 = (void *)sub_2459B0FE8();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setLimitDisplayName_timeLeft_, v5, v1);

  return v4;
}

uint64_t sub_2459AF864(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for STUserNotifications.NotificationType();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2459AF8A0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[49] = a1;
  v2 = sub_2459B0FA0();
  v1[50] = v2;
  v1[51] = *(_QWORD *)(v2 - 8);
  v1[52] = swift_task_alloc();
  v3 = sub_2459B0FC4();
  v1[53] = v3;
  v1[54] = *(_QWORD *)(v3 - 8);
  v1[55] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2459AF928()
{
  _QWORD *v0;
  void *v1;
  id v2;

  v1 = (void *)v0[49];
  v2 = objc_msgSend(v1, sel_notificationContent);
  v0[56] = v2;
  v0[2] = v0;
  v0[3] = sub_2459AF9E4;
  v0[46] = swift_continuation_init();
  v0[42] = MEMORY[0x24BDAC760];
  v0[43] = 0x40000000;
  v0[44] = sub_2459AE7E4;
  v0[45] = &block_descriptor_1;
  objc_msgSend(v1, sel_customizeNotificationContent_withCompletionBlock_, v2, v0 + 42);
  return swift_continuation_await();
}

uint64_t sub_2459AF9E4()
{
  return swift_task_switch();
}

uint64_t sub_2459AFA30()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  void *v17;
  id v18;
  void *v20;
  _BYTE *v21;

  v1 = *(void **)(v0 + 448);
  v2 = *(void **)(v0 + 392);
  v3 = objc_msgSend(v2, sel_identifier);
  sub_2459B100C();

  v4 = v1;
  v5 = objc_msgSend(v2, sel_trigger);
  v6 = (void *)sub_2459B0FE8();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend((id)objc_opt_self(), sel_requestWithIdentifier_content_trigger_, v6, v4, v5);
  *(_QWORD *)(v0 + 456) = v7;

  v8 = objc_msgSend(v2, sel_destinations);
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v7, sel_setDestinations_, objc_msgSend(v8, sel_unsignedIntegerValue));

  }
  if (qword_2574D6E58 != -1)
    swift_once();
  v10 = off_2574D7978;
  v11 = objc_msgSend(*(id *)(v0 + 392), sel_notificationBundleIdentifier);
  v12 = sub_2459B100C();
  v14 = v13;

  if (v10[2] && (v15 = sub_2459A8ED0(v12, v14), (v16 & 1) != 0))
  {
    v17 = *(void **)(v10[7] + 8 * v15);
    *(_QWORD *)(v0 + 464) = v17;
    v18 = v17;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 184) = v0 + 480;
    *(_QWORD *)(v0 + 144) = v0;
    *(_QWORD *)(v0 + 152) = sub_2459AFCD8;
    *(_QWORD *)(v0 + 288) = swift_continuation_init();
    *(_QWORD *)(v0 + 256) = MEMORY[0x24BDAC760];
    *(_QWORD *)(v0 + 264) = 0x40000000;
    *(_QWORD *)(v0 + 272) = sub_2459AE7EC;
    *(_QWORD *)(v0 + 280) = &block_descriptor_6;
    objc_msgSend(v18, sel_requestAuthorizationWithOptions_completionHandler_, 66, v0 + 256);
    return swift_continuation_await();
  }
  else
  {
    v20 = *(void **)(v0 + 448);
    swift_bridgeObjectRelease();
    sub_2459B0D7C();
    swift_allocError();
    *v21 = 0;
    swift_willThrow();

    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2459AFCD8()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 472) = *(_QWORD *)(*(_QWORD *)v0 + 176);
  return swift_task_switch();
}

uint64_t sub_2459AFD38()
{
  uint64_t v0;
  void *v1;
  void *v3;
  void *v4;

  if ((*(_BYTE *)(v0 + 480) & 1) != 0)
  {
    v1 = *(void **)(v0 + 464);
    *(_QWORD *)(v0 + 120) = v0 + 376;
    *(_QWORD *)(v0 + 80) = v0;
    *(_QWORD *)(v0 + 88) = sub_2459AFE24;
    *(_QWORD *)(v0 + 328) = swift_continuation_init();
    *(_QWORD *)(v0 + 296) = MEMORY[0x24BDAC760];
    *(_QWORD *)(v0 + 304) = 0x40000000;
    *(_QWORD *)(v0 + 312) = sub_2459AE86C;
    *(_QWORD *)(v0 + 320) = &block_descriptor_8;
    objc_msgSend(v1, sel_getDeliveredNotificationsWithCompletionHandler_, v0 + 296);
    return swift_continuation_await();
  }
  else
  {
    v3 = *(void **)(v0 + 456);
    v4 = *(void **)(v0 + 448);

    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2459AFE24()
{
  return swift_task_switch();
}

uint64_t sub_2459AFE70()
{
  _QWORD *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;

  v1 = v0[47];
  if (v1 >> 62)
    goto LABEL_14;
  v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v2)
  {
    sub_2459A330C(0, &qword_2574D7A78);
    v3 = 0;
    while (1)
    {
      v4 = (v1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x24953F6D8](v3, v1) : *(id *)(v1 + 8 * v3 + 32);
      v5 = v4;
      v6 = v3 + 1;
      if (__OFADD__(v3, 1))
        break;
      v7 = objc_msgSend(v4, sel_request);
      v8 = sub_2459B1108();

      if ((v8 & 1) != 0)
      {
        v20 = (void *)v0[57];
        v19 = (void *)v0[58];
        v21 = (void *)v0[56];
        swift_bridgeObjectRelease();

        goto LABEL_12;
      }
      ++v3;
      if (v6 == v2)
        goto LABEL_10;
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    v2 = sub_2459B121C();
    swift_bridgeObjectRelease();
  }
LABEL_10:
  v9 = (void *)v0[57];
  v10 = (void *)v0[58];
  v11 = v0[55];
  v24 = (void *)v0[56];
  v25 = v0[54];
  v12 = v0[52];
  v26 = v0[53];
  v13 = v0[50];
  v23 = v0[51];
  swift_bridgeObjectRelease();
  sub_2459A330C(0, &qword_2574D7088);
  v14 = (void *)sub_2459B10CC();
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v10;
  *(_QWORD *)(v15 + 24) = v9;
  v0[30] = sub_2459B0DEC;
  v0[31] = v15;
  v0[26] = MEMORY[0x24BDAC760];
  v0[27] = 1107296256;
  v0[28] = sub_2459A1BE0;
  v0[29] = &block_descriptor_9;
  v16 = _Block_copy(v0 + 26);
  v17 = v10;
  v18 = v9;
  sub_2459B0FAC();
  v0[48] = MEMORY[0x24BEE4AF8];
  sub_24599E078(&qword_2574D70B8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574D70C0);
  sub_2459B0E18();
  sub_2459B1138();
  MEMORY[0x24953F5F4](0, v11, v12, v16);
  _Block_release(v16);

  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v12, v13);
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v11, v26);
  swift_release();
LABEL_12:
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(void))v0[1])();
}

uint64_t sub_2459B0158()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;

  v1 = *(void **)(v0 + 464);
  v3 = *(void **)(v0 + 448);
  v2 = *(void **)(v0 + 456);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_2459B01C0(id a1)
{
  _QWORD *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _BYTE *v16;

  if (qword_2574D6E58 != -1)
    swift_once();
  v2 = off_2574D7978;
  v3 = objc_msgSend(a1, sel_notificationBundleIdentifier);
  v4 = sub_2459B100C();
  v6 = v5;

  if (v2[2] && (v7 = sub_2459A8ED0(v4, v6), (v8 & 1) != 0))
  {
    v9 = *(id *)(v2[7] + 8 * v7);
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574D7A70);
    v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_2459B1E70;
    v11 = objc_msgSend(a1, sel_identifier);
    v12 = sub_2459B100C();
    v14 = v13;

    *(_QWORD *)(v10 + 32) = v12;
    *(_QWORD *)(v10 + 40) = v14;
    v15 = (void *)sub_2459B1054();
    swift_bridgeObjectRelease();
    objc_msgSend(v9, sel_removeDeliveredNotificationsWithIdentifiers_, v15);

  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2459B0D7C();
    swift_allocError();
    *v16 = 0;
    swift_willThrow();
  }
}

uint64_t sub_2459B0348()
{
  return sub_24599E078(&qword_2574D79A8, (uint64_t (*)(uint64_t))type metadata accessor for STUserNotifications.NotificationType, (uint64_t)&protocol conformance descriptor for STUserNotifications.NotificationType);
}

unint64_t sub_2459B0378()
{
  unint64_t result;

  result = qword_2574D79B0;
  if (!qword_2574D79B0)
  {
    result = MEMORY[0x24953FB64](&protocol conformance descriptor for STUserNotifications.UserNotificationError, &type metadata for STUserNotifications.UserNotificationError);
    atomic_store(result, (unint64_t *)&qword_2574D79B0);
  }
  return result;
}

ValueMetadata *type metadata accessor for STUserNotifications()
{
  return &type metadata for STUserNotifications;
}

uint64_t *initializeBufferWithCopyOfBuffer for STUserNotifications.NotificationType(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        v7 = a2[1];
        *a1 = *a2;
        a1[1] = v7;
        v8 = a2[3];
        a1[2] = a2[2];
        a1[3] = v8;
        a1[4] = a2[4];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 1u:
        v11 = a2[1];
        *a1 = *a2;
        a1[1] = v11;
        v12 = a2[3];
        a1[2] = a2[2];
        a1[3] = v12;
        v14 = (void *)a2[4];
        v13 = a2[5];
        a1[4] = (uint64_t)v14;
        a1[5] = v13;
        a1[6] = a2[6];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v15 = v14;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 2u:
        v16 = sub_2459B0EBC();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(a1, a2, v16);
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
        v17 = a2[1];
        *a1 = *a2;
        a1[1] = v17;
        v18 = a2[3];
        a1[2] = a2[2];
        a1[3] = v18;
        v19 = a2[5];
        a1[4] = a2[4];
        a1[5] = v19;
        a1[6] = a2[6];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 4u:
        v20 = a2[1];
        *a1 = *a2;
        a1[1] = v20;
        v21 = a2[3];
        a1[2] = a2[2];
        a1[3] = v21;
        v22 = a2[4];
        v23 = a2[5];
        a1[4] = v22;
        a1[5] = v23;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(v5 + 64));
        break;
    }
  }
  return a1;
}

uint64_t destroy for STUserNotifications.NotificationType(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      swift_bridgeObjectRelease();
      goto LABEL_5;
    case 1:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      goto LABEL_5;
    case 2:
      v3 = sub_2459B0EBC();
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
    case 3:
    case 4:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_5:
      result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

_QWORD *initializeWithCopy for STUserNotifications.NotificationType(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      v7 = a2[3];
      a1[2] = a2[2];
      a1[3] = v7;
      a1[4] = a2[4];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_8;
    case 1u:
      v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      v9 = a2[3];
      a1[2] = a2[2];
      a1[3] = v9;
      v11 = (void *)a2[4];
      v10 = a2[5];
      a1[4] = v11;
      a1[5] = v10;
      a1[6] = a2[6];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v12 = v11;
      swift_bridgeObjectRetain();
      goto LABEL_8;
    case 2u:
      v13 = sub_2459B0EBC();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(a1, a2, v13);
      goto LABEL_8;
    case 3u:
      v14 = a2[1];
      *a1 = *a2;
      a1[1] = v14;
      v15 = a2[3];
      a1[2] = a2[2];
      a1[3] = v15;
      v16 = a2[5];
      a1[4] = a2[4];
      a1[5] = v16;
      a1[6] = a2[6];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_8;
    case 4u:
      v17 = a2[1];
      *a1 = *a2;
      a1[1] = v17;
      v18 = a2[3];
      a1[2] = a2[2];
      a1[3] = v18;
      v19 = a2[4];
      v20 = a2[5];
      a1[4] = v19;
      a1[5] = v20;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
LABEL_8:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

_QWORD *assignWithCopy for STUserNotifications.NotificationType(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  id v7;
  uint64_t v8;

  if (a1 != a2)
  {
    sub_2459AF864((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        a1[3] = a2[3];
        a1[4] = a2[4];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_9;
      case 1u:
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        a1[3] = a2[3];
        v6 = (void *)a2[4];
        a1[4] = v6;
        a1[5] = a2[5];
        a1[6] = a2[6];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v7 = v6;
        swift_bridgeObjectRetain();
        goto LABEL_9;
      case 2u:
        v8 = sub_2459B0EBC();
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
        goto LABEL_9;
      case 3u:
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        a1[3] = a2[3];
        a1[4] = a2[4];
        a1[5] = a2[5];
        a1[6] = a2[6];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_9;
      case 4u:
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        a1[3] = a2[3];
        a1[4] = a2[4];
        a1[5] = a2[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
LABEL_9:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

void *initializeWithTake for STUserNotifications.NotificationType(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 2)
  {
    v6 = sub_2459B0EBC();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for STUserNotifications.NotificationType(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_2459AF864((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      v6 = sub_2459B0EBC();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for STUserNotifications.NotificationType(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for STUserNotifications.NotificationType(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_2459B0B6C()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_2459B0B7C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2459B0EBC();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for STUserNotifications.UserNotificationError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for STUserNotifications.UserNotificationError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2459B0CE8 + 4 * byte_2459B2013[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2459B0D1C + 4 * byte_2459B200E[v4]))();
}

uint64_t sub_2459B0D1C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2459B0D24(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2459B0D2CLL);
  return result;
}

uint64_t sub_2459B0D38(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2459B0D40);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2459B0D44(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2459B0D4C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2459B0D58(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2459B0D60(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for STUserNotifications.UserNotificationError()
{
  return &type metadata for STUserNotifications.UserNotificationError;
}

unint64_t sub_2459B0D7C()
{
  unint64_t result;

  result = qword_2574D7A68;
  if (!qword_2574D7A68)
  {
    result = MEMORY[0x24953FB64](&protocol conformance descriptor for STUserNotifications.UserNotificationError, &type metadata for STUserNotifications.UserNotificationError);
    atomic_store(result, (unint64_t *)&qword_2574D7A68);
  }
  return result;
}

uint64_t sub_2459B0DC0()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_2459B0DEC()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_addNotificationRequest_withCompletionHandler_, *(_QWORD *)(v0 + 24), 0);
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

unint64_t sub_2459B0E18()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2574D70C8;
  if (!qword_2574D70C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2574D70C0);
    result = MEMORY[0x24953FB64](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2574D70C8);
  }
  return result;
}

uint64_t sub_2459B0E64(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574D7A88);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2459B0EA4()
{
  return MEMORY[0x24BDCBCA0]();
}

uint64_t sub_2459B0EB0()
{
  return MEMORY[0x24BDCBCB0]();
}

uint64_t sub_2459B0EBC()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_2459B0EC8()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2459B0ED4()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_2459B0EE0()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_2459B0EEC()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2459B0EF8()
{
  return MEMORY[0x24BDC7280]();
}

uint64_t sub_2459B0F04()
{
  return MEMORY[0x24BDC7290]();
}

uint64_t sub_2459B0F10()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2459B0F1C()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2459B0F28()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2459B0F34()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_2459B0F40()
{
  return MEMORY[0x24BDB9E50]();
}

uint64_t sub_2459B0F4C()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_2459B0F58()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t sub_2459B0F64()
{
  return MEMORY[0x24BDB9EA8]();
}

uint64_t sub_2459B0F70()
{
  return MEMORY[0x24BDB9EC0]();
}

uint64_t sub_2459B0F7C()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_2459B0F88()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_2459B0F94()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_2459B0FA0()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_2459B0FAC()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_2459B0FB8()
{
  return MEMORY[0x24BEE54D8]();
}

uint64_t sub_2459B0FC4()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_2459B0FD0()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_2459B0FDC()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_2459B0FE8()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2459B0FF4()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_2459B1000()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_2459B100C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2459B1018()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2459B1024()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2459B1030()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2459B103C()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_2459B1048()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_2459B1054()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2459B1060()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2459B106C()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_2459B1078()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_2459B1084()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_2459B1090()
{
  return MEMORY[0x24BDCFDD8]();
}

uint64_t sub_2459B109C()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2459B10A8()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2459B10B4()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_2459B10C0()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_2459B10CC()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_2459B10D8()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_2459B10E4()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_2459B10F0()
{
  return MEMORY[0x24BDD01F0]();
}

uint64_t sub_2459B10FC()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_2459B1108()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_2459B1114()
{
  return MEMORY[0x24BEE5BC8]();
}

uint64_t sub_2459B1120()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2459B112C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2459B1138()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2459B1144()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_2459B1150()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_2459B115C()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_2459B1168()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_2459B1174()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_2459B1180()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_2459B118C()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_2459B1198()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_2459B11A4()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_2459B11B0()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2459B11BC()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2459B11C8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2459B11D4()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_2459B11E0()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_2459B11EC()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_2459B11F8()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_2459B1204()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_2459B1210()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2459B121C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2459B1228()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2459B1234()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2459B1240()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2459B124C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2459B1258()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_2459B1264()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2459B1270()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_2459B127C()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2459B1288()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2459B1294()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2459B12A0()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2459B12AC()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2459B12B8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2459B12C4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2459B12D0()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_2459B12DC()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_2459B12E8()
{
  return MEMORY[0x24BEE4328]();
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

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_continuation_resume()
{
  return MEMORY[0x24BEE71C8]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x24BEE4C68]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
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

