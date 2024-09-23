uint64_t sub_27A8()
{
  uint64_t MyLocalizationTable;
  uint64_t v1;
  uint64_t ObjCClassFromMetadata;
  id v3;

  MyLocalizationTable = type metadata accessor for FindMyLocalizationTable(0);
  __swift_allocate_value_buffer(MyLocalizationTable, qword_40BC8);
  __swift_project_value_buffer(MyLocalizationTable, (uint64_t)qword_40BC8);
  v1 = type metadata accessor for PeopleModule();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v1);
  v3 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  return FindMyLocalizationTable.init(tableName:tableBundle:)(0x656C706F6550, 0xE600000000000000, v3);
}

uint64_t static FindMyLocalizationTable.people.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t MyLocalizationTable;
  uint64_t v3;

  if (qword_40BC0 != -1)
    swift_once(&qword_40BC0, sub_27A8);
  MyLocalizationTable = type metadata accessor for FindMyLocalizationTable(0);
  v3 = __swift_project_value_buffer(MyLocalizationTable, (uint64_t)qword_40BC8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(MyLocalizationTable - 8) + 16))(a1, v3, MyLocalizationTable);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void type metadata accessor for CNAtomPresentationOptions()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_40BF0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, &unk_3D158);
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_40BF0);
  }
}

void sub_2918(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_2920@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_2934@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_2948@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_295C(_QWORD *a1, uint64_t *a2)
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

_QWORD *sub_298C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_29B8@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *sub_29DC(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_29F0(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_2A04(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_2A18@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_2A2C(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_2A40(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_2A54(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_2A68()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_2A78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

_QWORD *sub_2A90(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

BOOL sub_2AA4(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2AB8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = sub_2BEC(a1);
  result = swift_bridgeObjectRelease(a1);
  *a2 = v4;
  return result;
}

_QWORD *sub_2AF4@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

_QWORD *sub_2B00@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_2B10(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_2B1C()
{
  return sub_2BAC(&qword_40BF8, (uint64_t)&unk_335EC);
}

uint64_t sub_2B40()
{
  return sub_2BAC(&qword_40C00, (uint64_t)&unk_335BC);
}

uint64_t sub_2B64()
{
  return sub_2BAC(&qword_40C08, (uint64_t)&unk_33614);
}

uint64_t sub_2B88()
{
  return sub_2BAC(&qword_40C10, (uint64_t)&unk_3364C);
}

uint64_t sub_2BAC(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for CNAtomPresentationOptions();
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2BEC(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  result = 0;
  v4 = (uint64_t *)(a1 + 32);
  do
  {
    v6 = *v4++;
    v5 = v6;
    if ((v6 & ~result) == 0)
      v5 = 0;
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
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

uint64_t sub_2C68()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  __swift_allocate_value_buffer(v0, qword_40C18);
  __swift_project_value_buffer(v0, (uint64_t)qword_40C18);
  return Logger.init(subsystem:category:)(0xD000000000000016, 0x8000000000033880, 0x656C706F6550, 0xE600000000000000);
}

unint64_t sub_2CD8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  id v11;
  unint64_t result;
  char v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_40FA8);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  swift_retain(v3);
  v6 = (char *)(a1 + 64);
  while (1)
  {
    v7 = *((_QWORD *)v6 - 3);
    v8 = *((_QWORD *)v6 - 2);
    v9 = *((_QWORD *)v6 - 1);
    v10 = *v6;
    v11 = *((id *)v6 - 4);
    sub_18DEC(v7, v8, v9, v10);
    result = sub_1035C((uint64_t)v11);
    if ((v13 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_QWORD *)(v4[6] + 8 * result) = v11;
    v14 = v4[7] + 32 * result;
    *(_QWORD *)v14 = v7;
    *(_QWORD *)(v14 + 8) = v8;
    *(_QWORD *)(v14 + 16) = v9;
    *(_BYTE *)(v14 + 24) = v10;
    v15 = v4[2];
    v16 = __OFADD__(v15, 1);
    v17 = v15 + 1;
    if (v16)
      goto LABEL_11;
    v6 += 40;
    v4[2] = v17;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_2E14(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_40F80);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  swift_retain(v3);
  v6 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v7 = *v6;
    v8 = (id)*(v6 - 1);
    swift_retain(v7);
    result = sub_1035C((uint64_t)v8);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = 8 * result;
    *(_QWORD *)(v4[6] + v11) = v8;
    *(_QWORD *)(v4[7] + v11) = v7;
    v12 = v4[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v4[2] = v14;
    v6 += 2;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_2F1C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t result;
  char v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_41050);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
  {
    v8 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    v26 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v26);
    return (unint64_t)v8;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_41018);
  v7 = static _DictionaryStorage.allocate(capacity:)(v6);
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
    goto LABEL_9;
  v10 = &v5[*(int *)(v2 + 48)];
  v11 = v7 + 64;
  v12 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v28 = a1;
  v13 = a1 + v12;
  v14 = *(_QWORD *)(v3 + 72);
  swift_retain(v7);
  while (1)
  {
    sub_1A1D4(v13, (uint64_t)v5, &qword_41050);
    result = sub_1038C((uint64_t)v5);
    if ((v16 & 1) != 0)
      break;
    v17 = result;
    *(_QWORD *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v18 = v8[6];
    v19 = type metadata accessor for Handle(0);
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v18 + *(_QWORD *)(*(_QWORD *)(v19 - 8) + 72) * v17, v5, v19);
    v20 = v8[7] + 32 * v17;
    v21 = *((_QWORD *)v10 + 2);
    v22 = v10[24];
    *(_OWORD *)v20 = *(_OWORD *)v10;
    *(_QWORD *)(v20 + 16) = v21;
    *(_BYTE *)(v20 + 24) = v22;
    v23 = v8[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (v24)
      goto LABEL_12;
    v8[2] = v25;
    v13 += v14;
    if (!--v9)
    {
      swift_release(v8);
      v26 = v28;
      goto LABEL_10;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_30C8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t result;
  char v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_410C8);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
  {
    v8 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    v23 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v23);
    return (unint64_t)v8;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_410F8);
  v7 = static _DictionaryStorage.allocate(capacity:)(v6);
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
    goto LABEL_9;
  v10 = *(int *)(v2 + 48);
  v11 = v7 + 64;
  v12 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v25 = a1;
  v13 = a1 + v12;
  v14 = *(_QWORD *)(v3 + 72);
  swift_retain(v7);
  while (1)
  {
    sub_1A1D4(v13, (uint64_t)v5, &qword_410C8);
    result = sub_1038C((uint64_t)v5);
    if ((v16 & 1) != 0)
      break;
    v17 = result;
    *(_QWORD *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v18 = v8[6];
    v19 = type metadata accessor for Handle(0);
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v18 + *(_QWORD *)(*(_QWORD *)(v19 - 8) + 72) * v17, v5, v19);
    *(_BYTE *)(v8[7] + v17) = v5[v10];
    v20 = v8[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (v21)
      goto LABEL_12;
    v8[2] = v22;
    v13 += v14;
    if (!--v9)
    {
      swift_release(v8);
      v23 = v25;
      goto LABEL_10;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_325C()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  _QWORD v4[3];

  KeyPath = swift_getKeyPath(&unk_33AD8);
  v4[0] = v0;
  v2 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)(v4, KeyPath, v2);
  swift_release(KeyPath);
  swift_beginAccess(v0 + 104, v4, 0, 0);
  return swift_bridgeObjectRetain(*(_QWORD *)(v0 + 104));
}

uint64_t sub_32F8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[3];

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_33AD8);
  v8[0] = v3;
  v5 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)(v8, KeyPath, v5);
  swift_release(KeyPath);
  swift_beginAccess(v3 + 104, v8, 0, 0);
  v6 = *(_QWORD *)(v3 + 104);
  *a2 = v6;
  return swift_bridgeObjectRetain(v6);
}

uint64_t sub_339C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_33AD8);
  v7[2] = v3;
  v7[3] = v2;
  v8 = v3;
  v5 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
  swift_bridgeObjectRetain(v2);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v8, KeyPath, sub_194E0, v7, (char *)&type metadata for () + 8, v5);
  swift_release(KeyPath);
  return swift_bridgeObjectRelease(v2);
}

uint64_t sub_3454(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _BYTE v6[24];

  swift_beginAccess(a1 + 104, v6, 1, 0);
  v4 = *(_QWORD *)(a1 + 104);
  *(_QWORD *)(a1 + 104) = a2;
  swift_bridgeObjectRetain(a2);
  return swift_bridgeObjectRelease(v4);
}

uint64_t sub_34B8()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_33B00);
  v4 = v0;
  v2 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v4, KeyPath, v2);
  swift_release(KeyPath);
  return *(unsigned __int8 *)(v0 + 112);
}

uint64_t sub_353C@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_33B00);
  v7 = v3;
  v5 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v7, KeyPath, v5);
  result = swift_release(KeyPath);
  *a2 = *(_BYTE *)(v3 + 112);
  return result;
}

uint64_t sub_35C8(char *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  _QWORD v7[3];
  char v8;
  uint64_t v9;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_33B00);
  v7[2] = v3;
  v8 = v2;
  v9 = v3;
  v5 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v9, KeyPath, sub_1A240, v7, (char *)&type metadata for () + 8, v5);
  return swift_release(KeyPath);
}

uint64_t sub_3670()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_33BA0);
  v4 = v0;
  v2 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v4, KeyPath, v2);
  swift_release(KeyPath);
  return *(unsigned __int8 *)(v0 + 113);
}

uint64_t sub_36F4(uint64_t result, char a2)
{
  *(_BYTE *)(result + 113) = a2;
  return result;
}

uint64_t sub_36FC()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_33B78);
  v4 = v0;
  v2 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v4, KeyPath, v2);
  swift_release(KeyPath);
  return *(unsigned __int8 *)(v0 + 114);
}

uint64_t sub_3780(uint64_t result, char a2)
{
  *(_BYTE *)(result + 114) = a2;
  return result;
}

uint64_t sub_3788@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t KeyPath;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[3];

  KeyPath = swift_getKeyPath(&off_33B50);
  v7[0] = v1;
  v4 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)(v7, KeyPath, v4);
  swift_release(KeyPath);
  v5 = v1 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__alert;
  swift_beginAccess(v1 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__alert, v7, 0, 0);
  return sub_1A1D4(v5, a1, &qword_40C78);
}

uint64_t sub_3840(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _BYTE v5[24];

  v3 = a1 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__alert;
  swift_beginAccess(a1 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__alert, v5, 33, 0);
  sub_19DBC(a2, v3);
  return swift_endAccess(v5);
}

uint64_t sub_38A8()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  _QWORD *v3;
  _QWORD v5[3];

  KeyPath = swift_getKeyPath(&unk_33AB0);
  v5[0] = v0;
  v2 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)(v5, KeyPath, v2);
  swift_release(KeyPath);
  v3 = (_QWORD *)(v0 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__reachabilityRequestsPerAddress);
  swift_beginAccess(v0 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__reachabilityRequestsPerAddress, v5, 0, 0);
  return swift_bridgeObjectRetain(*v3);
}

uint64_t sub_3950@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  _QWORD v9[3];

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_33AB0);
  v9[0] = v3;
  v5 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)(v9, KeyPath, v5);
  swift_release(KeyPath);
  v6 = (uint64_t *)(v3 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__reachabilityRequestsPerAddress);
  swift_beginAccess(v3 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__reachabilityRequestsPerAddress, v9, 0, 0);
  v7 = *v6;
  *a2 = *v6;
  return swift_bridgeObjectRetain(v7);
}

uint64_t sub_3A00(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_33AB0);
  v7[2] = v3;
  v7[3] = v2;
  v8 = v3;
  v5 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
  swift_bridgeObjectRetain(v2);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v8, KeyPath, sub_19368, v7, (char *)&type metadata for () + 8, v5);
  swift_release(KeyPath);
  return swift_bridgeObjectRelease(v2);
}

uint64_t sub_3AB8(uint64_t a1, uint64_t a2)
{
  uint64_t *v3;
  uint64_t v4;
  _BYTE v6[24];

  v3 = (uint64_t *)(a1 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__reachabilityRequestsPerAddress);
  swift_beginAccess(a1 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__reachabilityRequestsPerAddress, v6, 1, 0);
  v4 = *v3;
  *v3 = a2;
  swift_bridgeObjectRetain(a2);
  return swift_bridgeObjectRelease(v4);
}

uint64_t ContactPickerViewModel.__allocating_init(configuration:dependencies:)(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = swift_allocObject(v2, *(unsigned int *)(v2 + 48), *(unsigned __int16 *)(v2 + 52));
  ContactPickerViewModel.init(configuration:dependencies:)(a1, a2);
  return v5;
}

uint64_t ContactPickerViewModel.init(configuration:dependencies:)(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  __int128 v17;

  v5 = *a1;
  v6 = a1[1];
  v7 = *((_BYTE *)a1 + 16);
  v8 = a1[5];
  v9 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(v2 + 104) = sub_2CD8((uint64_t)&_swiftEmptyArrayStorage);
  *(_WORD *)(v2 + 112) = 0;
  *(_BYTE *)(v2 + 114) = 0;
  v10 = v2 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__alert;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_40C38);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__reachabilityRequestsPerAddress) = sub_2E14((uint64_t)&_swiftEmptyArrayStorage);
  v12 = (_QWORD *)(v2 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__addSearchControllerRecipient);
  *v12 = 0;
  v12[1] = 0;
  v13 = (_QWORD *)(v2
                 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__setSearchControllerPresentationOptionsForRecipient);
  *v13 = 0;
  v13[1] = 0;
  v14 = (_QWORD *)(v2 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__setSearchControllerComposeFieldInfoText);
  *v14 = 0;
  v14[1] = 0;
  v15 = (_QWORD *)(v2
                 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__setSearchControllerTintColorForAutocompleteRecipient);
  *v15 = 0;
  v15[1] = 0;
  v16 = (_QWORD *)(v2 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__externalDidChangeRecipientsStatus);
  *v16 = 0;
  v16[1] = 0;
  ObservationRegistrar.init()();
  *(_QWORD *)(v2 + 16) = v5;
  *(_QWORD *)(v2 + 24) = v6;
  *(_BYTE *)(v2 + 32) = v7;
  *(_OWORD *)(v2 + 40) = *(_OWORD *)(a1 + 3);
  *(_QWORD *)(v2 + 56) = v8;
  v17 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v2 + 64) = *(_OWORD *)a2;
  *(_OWORD *)(v2 + 80) = v17;
  *(_QWORD *)(v2 + 96) = v9;
  return v2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
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

uint64_t sub_3CE8()
{
  return sub_3E78((uint64_t)&unk_33A88, &OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__addSearchControllerRecipient, (void (*)(_QWORD, _QWORD))sub_1A228);
}

uint64_t sub_3D04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_3E08(a1, a2, a3, &OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__addSearchControllerRecipient, (void (*)(uint64_t, uint64_t))sub_1A228, sub_1A224);
}

uint64_t sub_3D30()
{
  return sub_3E78((uint64_t)&unk_33A60, &OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__setSearchControllerPresentationOptionsForRecipient, (void (*)(_QWORD, _QWORD))sub_1A228);
}

uint64_t sub_3D4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_3E08(a1, a2, a3, &OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__setSearchControllerPresentationOptionsForRecipient, (void (*)(uint64_t, uint64_t))sub_1A228, sub_1A224);
}

uint64_t sub_3D78()
{
  return sub_3E78((uint64_t)&unk_33A38, &OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__setSearchControllerComposeFieldInfoText, (void (*)(_QWORD, _QWORD))sub_1A228);
}

uint64_t sub_3D94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_3E08(a1, a2, a3, &OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__setSearchControllerComposeFieldInfoText, (void (*)(uint64_t, uint64_t))sub_1A228, sub_1A224);
}

uint64_t sub_3DC0()
{
  return sub_3E78((uint64_t)&unk_33A10, &OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__setSearchControllerTintColorForAutocompleteRecipient, (void (*)(_QWORD, _QWORD))sub_1A228);
}

uint64_t sub_3DDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_3E08(a1, a2, a3, &OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__setSearchControllerTintColorForAutocompleteRecipient, (void (*)(uint64_t, uint64_t))sub_1A228, sub_1A224);
}

uint64_t sub_3E08(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, void (*a5)(uint64_t, uint64_t), uint64_t (*a6)(uint64_t, uint64_t))
{
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v7 = (uint64_t *)(a1 + *a4);
  v8 = *v7;
  v9 = v7[1];
  *v7 = a2;
  v7[1] = a3;
  a5(a2, a3);
  return a6(v8, v9);
}

uint64_t sub_3E5C()
{
  return sub_3E78((uint64_t)&unk_33B28, &OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__externalDidChangeRecipientsStatus, (void (*)(_QWORD, _QWORD))sub_194C8);
}

uint64_t sub_3E78(uint64_t a1, _QWORD *a2, void (*a3)(_QWORD, _QWORD))
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v11;

  KeyPath = swift_getKeyPath(a1);
  v11 = v3;
  v7 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v11, KeyPath, v7);
  swift_release(KeyPath);
  v8 = (_QWORD *)(v3 + *a2);
  v9 = *v8;
  a3(*v8, v8[1]);
  return v9;
}

uint64_t sub_3F20@<X0>(uint64_t *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)();
  uint64_t v11;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_33B28);
  v11 = v3;
  v5 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v11, KeyPath, v5);
  swift_release(KeyPath);
  v6 = *(_QWORD *)(v3 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__externalDidChangeRecipientsStatus);
  v7 = *(_QWORD *)(v3 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__externalDidChangeRecipientsStatus + 8);
  if (v6)
  {
    v8 = swift_allocObject(&unk_3D7E8, 32, 7);
    *(_QWORD *)(v8 + 16) = v6;
    *(_QWORD *)(v8 + 24) = v7;
    v9 = sub_194A8;
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }
  *a2 = v9;
  a2[1] = (uint64_t (*)())v8;
  return sub_194C8(v6, v7);
}

uint64_t sub_3FF4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t v7;
  uint64_t KeyPath;
  uint64_t v9;
  _QWORD v11[7];
  uint64_t v12;

  v4 = *a1;
  v3 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject(&unk_3D7C0, 32, 7);
    *(_QWORD *)(v5 + 16) = v4;
    *(_QWORD *)(v5 + 24) = v3;
    v6 = sub_194A8;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = *a2;
  KeyPath = swift_getKeyPath(&unk_33B28);
  __chkstk_darwin(KeyPath);
  v11[2] = v7;
  v11[3] = v6;
  v11[4] = v5;
  v12 = v7;
  sub_194C8(v4, v3);
  v9 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v12, KeyPath, sub_19454, v11, (char *)&type metadata for () + 8, v9);
  sub_17920((uint64_t)v6, v5);
  return swift_release(KeyPath);
}

void sub_4118(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  NSString v34;
  id v35;
  uint64_t KeyPath;
  uint64_t v37;
  void (*v38)(id);
  uint64_t v39;
  id v40[2];
  __int128 v41;
  __int128 v42;
  uint64_t v43[3];
  uint64_t v44;

  v2 = v1;
  v4 = objc_msgSend(a1, "contact");
  v5 = objc_msgSend(a1, "value");
  if (v5)
  {
    v6 = v5;
    _bridgeAnyObjectToAny(_:)(&v41);
    swift_unknownObjectRelease(v6);
  }
  else
  {
    v41 = 0u;
    v42 = 0u;
  }
  sub_1A154((uint64_t)&v41, (uint64_t)v43, &qword_40F40);
  if (v44)
  {
    if ((swift_dynamicCast(v40, v43, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
    {
      v7 = 0;
      v9 = (uint64_t)v40[0];
      v8 = (unint64_t)v40[1];
      goto LABEL_21;
    }
  }
  else
  {
    sub_1A198((uint64_t)v43, &qword_40F40);
  }
  v10 = objc_msgSend(a1, "value");
  if (v10)
  {
    v11 = v10;
    _bridgeAnyObjectToAny(_:)(&v41);
    swift_unknownObjectRelease(v11);
  }
  else
  {
    v41 = 0u;
    v42 = 0u;
  }
  sub_1A154((uint64_t)&v41, (uint64_t)v43, &qword_40F40);
  if (v44)
  {
    v12 = sub_19330(0, &qword_40F48, CNPhoneNumber_ptr);
    if ((swift_dynamicCast(v40, v43, (char *)&type metadata for Any + 8, v12, 6) & 1) != 0)
    {
      v13 = v40[0];
      v14 = objc_msgSend(v40[0], "stringValue");
      v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14, v15);
      v8 = v16;

      v7 = 1;
      goto LABEL_21;
    }
  }
  else
  {
    sub_1A198((uint64_t)v43, &qword_40F40);
  }
  if (qword_40BE0 != -1)
    swift_once(&qword_40BE0, sub_2C68);
  v17 = type metadata accessor for Logger(0);
  __swift_project_value_buffer(v17, (uint64_t)qword_40C18);
  v18 = a1;
  v19 = Logger.logObject.getter(v18);
  v20 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = swift_slowAlloc(22, -1);
    v22 = swift_slowAlloc(64, -1);
    v43[0] = v22;
    *(_DWORD *)v21 = 136315394;
    *(_QWORD *)&v41 = sub_FD1C(0xD00000000000001CLL, 0x8000000000037F30, v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, (char *)&v41 + 8, v21 + 4, v21 + 12);
    *(_WORD *)(v21 + 12) = 2080;
    v23 = v18;
    v24 = objc_msgSend(v23, "description");
    v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24, v25);
    v27 = v4;
    v29 = v28;

    *(_QWORD *)&v41 = sub_FD1C(v26, v29, v43);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, (char *)&v41 + 8, v21 + 14, v21 + 22);

    v30 = v29;
    v4 = v27;
    swift_bridgeObjectRelease(v30);
    _os_log_impl(&dword_0, v19, v20, "ContactPickerViewModel: %s - Unknown contact: %s", (uint8_t *)v21, 0x16u);
    swift_arrayDestroy(v22, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v22, -1, -1);
    swift_slowDealloc(v21, -1, -1);

  }
  else
  {

  }
  v9 = 0;
  v8 = 0xE000000000000000;
  v7 = 5;
LABEL_21:
  v31 = HIBYTE(v8) & 0xF;
  if ((v8 & 0x2000000000000000) == 0)
    v31 = v9 & 0xFFFFFFFFFFFFLL;
  if (v31)
  {
    v32 = objc_allocWithZone((Class)CNComposeRecipient);
    v33 = v4;
    v34 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v8);
    v35 = objc_msgSend(v32, "initWithContact:address:kind:", v33, v34, v7);

    if (v35)
    {
      KeyPath = swift_getKeyPath(&unk_33A88);
      v43[0] = v2;
      v37 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
      ObservationRegistrar.access<A, B>(_:keyPath:)(v43, KeyPath, v37);
      swift_release(KeyPath);
      v38 = *(void (**)(id))(v2
                                      + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__addSearchControllerRecipient);
      if (v38)
      {
        v39 = *(_QWORD *)(v2 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__addSearchControllerRecipient + 8);
        swift_retain(v39);
        v38(v35);

        sub_17920((uint64_t)v38, v39);
        return;
      }

    }
  }
  else
  {

    swift_bridgeObjectRelease(v8);
  }
}

uint64_t sub_45EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t KeyPath;
  uint64_t v10;
  _BYTE v12[16];
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_40C78);
  __chkstk_darwin(v4);
  v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_40EA8);
  AlertInfo.resolved(with:)(a1, v7);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_40C38);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 0, 1, v8);
  KeyPath = swift_getKeyPath(&off_33B50);
  v13 = a2;
  v14 = v6;
  v15 = a2;
  v10 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v15, KeyPath, sub_19F10, v12, (char *)&type metadata for () + 8, v10);
  swift_release(KeyPath);
  return sub_1A198((uint64_t)v6, &qword_40C78);
}

uint64_t sub_4728(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t KeyPath;
  uint64_t v10;
  _BYTE v12[16];
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_40C78);
  __chkstk_darwin(v4);
  v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_40E10);
  AlertInfo.resolved(with:)(a1, v7);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_40C38);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 0, 1, v8);
  KeyPath = swift_getKeyPath(&off_33B50);
  v13 = a2;
  v14 = v6;
  v15 = a2;
  v10 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v15, KeyPath, sub_1A268, v12, (char *)&type metadata for () + 8, v10);
  swift_release(KeyPath);
  return sub_1A198((uint64_t)v6, &qword_40C78);
}

void *sub_4864(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;

  v6 = (_QWORD *)swift_allocObject(&unk_3D838, 40, 7);
  v6[2] = a3;
  v6[3] = a1;
  v6[4] = a2;
  swift_retain(a3);
  swift_retain(a2);
  return &unk_41038;
}

uint64_t sub_48D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v6;
  _QWORD *v7;

  v6 = type metadata accessor for MainActor(0);
  v3[2] = v6;
  v3[3] = static MainActor.shared.getter(v6);
  v7 = (_QWORD *)swift_task_alloc(dword_41044);
  v3[4] = v7;
  *v7 = v3;
  v7[1] = sub_494C;
  return sub_49EC(a2, a3);
}

uint64_t sub_494C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 16);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 32));
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_49BC, v2, v3);
}

uint64_t sub_49BC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_49EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3[15] = a2;
  v3[16] = v2;
  v3[14] = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_40EA8);
  v3[17] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[18] = v5;
  v3[19] = swift_task_alloc((*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for ContactPickerViewModel.ActionResult(0);
  v3[20] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v6 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_40E10);
  v3[21] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v3[22] = v8;
  v3[23] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for ContactPickerViewModel.StepResult(0);
  v3[24] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v9 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for MainActor(0);
  v3[25] = v10;
  v3[26] = static MainActor.shared.getter(v10);
  v11 = dispatch thunk of Actor.unownedExecutor.getter(v10, &protocol witness table for MainActor);
  v3[27] = v11;
  v3[28] = v12;
  return swift_task_switch(sub_4AF8, v11, v12);
}

uint64_t sub_4AF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t KeyPath;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  int *v24;
  uint64_t v25;
  _QWORD *v26;
  int *v27;
  _QWORD *v28;
  int *v29;
  int *v30;
  uint64_t v31;

  v1 = *(_QWORD *)(v0 + 128);
  KeyPath = swift_getKeyPath(&unk_33AD8);
  *(_QWORD *)(v0 + 40) = v1;
  *(_QWORD *)(v0 + 232) = OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel___observationRegistrar;
  v3 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
  *(_QWORD *)(v0 + 240) = v3;
  ObservationRegistrar.access<A, B>(_:keyPath:)(v0 + 40, KeyPath, v3);
  swift_release(KeyPath);
  swift_beginAccess(v1 + 104, v0 + 16, 0, 0);
  v4 = *(_QWORD *)(v1 + 104);
  v5 = swift_bridgeObjectRetain(v4);
  v6 = sub_113AC(v5, (uint64_t (*)(char *, unint64_t, uint64_t))sub_11678);
  v7 = *(_QWORD *)(v6 + 16);
  swift_release(v6);
  if (v7)
  {
    swift_release(*(_QWORD *)(v0 + 208));
    swift_bridgeObjectRelease(v4);
    if (qword_40BE0 != -1)
      swift_once(&qword_40BE0, sub_2C68);
    v8 = type metadata accessor for Logger(0);
    v9 = __swift_project_value_buffer(v8, (uint64_t)qword_40C18);
    v10 = Logger.logObject.getter(v9);
    v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc(12, -1);
      v13 = swift_slowAlloc(32, -1);
      v31 = v13;
      *(_DWORD *)v12 = 136315138;
      *(_QWORD *)(v0 + 48) = sub_FD1C(0xD000000000000019, 0x8000000000038360, &v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 48, v0 + 56, v12 + 4, v12 + 12);
      _os_log_impl(&dword_0, v10, v11, "ContactPickerViewModel: %s - recipientsContainsPending", v12, 0xCu);
      swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v13, -1, -1);
      swift_slowDealloc(v12, -1, -1);
    }

    v14 = *(_QWORD *)(v0 + 184);
    v16 = *(_QWORD *)(v0 + 152);
    v15 = *(_QWORD *)(v0 + 160);
    swift_task_dealloc(*(_QWORD *)(v0 + 192));
    swift_task_dealloc(v14);
    swift_task_dealloc(v15);
    swift_task_dealloc(v16);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v18 = *(_QWORD *)(v0 + 128);
    *(_QWORD *)(v0 + 248) = sub_58C0(v4);
    swift_bridgeObjectRelease(v4);
    v19 = swift_getKeyPath(&unk_33BA0);
    v20 = swift_task_alloc(32);
    *(_QWORD *)(v20 + 16) = v18;
    *(_BYTE *)(v20 + 24) = 1;
    *(_QWORD *)(v0 + 56) = v18;
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(v0 + 56, v19, sub_19EF0, v20, (char *)&type metadata for () + 8, v3);
    *(_QWORD *)(v0 + 256) = 0;
    swift_release(v19);
    swift_task_dealloc(v20);
    v21 = *(_QWORD **)(v18 + 56);
    *(_QWORD *)(v0 + 264) = v21;
    v22 = v21[2];
    *(_QWORD *)(v0 + 272) = v22;
    if (v22)
    {
      *(_QWORD *)(v0 + 280) = 0;
      v23 = v21[5];
      *(_QWORD *)(v0 + 288) = v23;
      v24 = (int *)v21[4];
      v25 = v24[1];
      v29 = (int *)((char *)v24 + *v24);
      swift_retain_n(v23, 2);
      swift_bridgeObjectRetain(v21);
      v26 = (_QWORD *)swift_task_alloc(v25);
      *(_QWORD *)(v0 + 296) = v26;
      *v26 = v0;
      v26[1] = sub_4EA4;
      return ((uint64_t (*)(_QWORD, _QWORD))v29)(*(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 248));
    }
    else
    {
      v27 = *(int **)(v0 + 112);
      v30 = (int *)((char *)v27 + *v27);
      v28 = (_QWORD *)swift_task_alloc(v27[1]);
      *(_QWORD *)(v0 + 352) = v28;
      *v28 = v0;
      v28[1] = sub_5404;
      return ((uint64_t (*)(_QWORD, _QWORD))v30)(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 248));
    }
  }
}

uint64_t sub_4EA4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 288);
  swift_task_dealloc(*(_QWORD *)(*v0 + 296));
  swift_release(v2);
  return swift_task_switch(sub_4EF8, *(_QWORD *)(v1 + 216), *(_QWORD *)(v1 + 224));
}

uint64_t sub_4EF8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t (*v20)(uint64_t, uint64_t);

  v1 = v0[24];
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_40E08);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(v1, 1, v2) == 1)
  {
    v3 = v0[35];
    v4 = v0[34];
    swift_release(v0[36]);
    if (v3 + 1 == v4)
    {
      swift_bridgeObjectRelease(v0[33]);
      v5 = (int *)v0[14];
      v20 = (uint64_t (*)(uint64_t, uint64_t))((char *)v5 + *v5);
      v6 = (_QWORD *)swift_task_alloc(v5[1]);
      v0[44] = v6;
      *v6 = v0;
      v6[1] = sub_5404;
      v7 = v0[31];
      v8 = v0[20];
    }
    else
    {
      v14 = v0[35] + 1;
      v0[35] = v14;
      v15 = v0[33] + 16 * v14;
      v16 = *(_QWORD *)(v15 + 40);
      v0[36] = v16;
      v17 = *(int **)(v15 + 32);
      v18 = v17[1];
      v20 = (uint64_t (*)(uint64_t, uint64_t))((char *)v17 + *v17);
      swift_retain_n(v16, 2);
      v19 = (_QWORD *)swift_task_alloc(v18);
      v0[37] = v19;
      *v19 = v0;
      v19[1] = sub_4EA4;
      v7 = v0[31];
      v8 = v0[24];
    }
    return v20(v8, v7);
  }
  else
  {
    v9 = v0[25];
    v10 = (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(v0[22] + 32))(v0[23], v1, v0[21]);
    v0[38] = static MainActor.shared.getter(v10);
    v11 = dispatch thunk of Actor.unownedExecutor.getter(v9, &protocol witness table for MainActor);
    v0[39] = v11;
    v0[40] = v12;
    return swift_task_switch(sub_5078, v11, v12);
  }
}

uint64_t sub_5078(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = v1[23];
  v3 = v1[16];
  v4 = static MainActor.shared.getter(a1);
  v1[41] = v4;
  v5 = swift_task_alloc(32);
  v1[42] = v5;
  *(_QWORD *)(v5 + 16) = v3;
  *(_QWORD *)(v5 + 24) = v2;
  v6 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
  v1[43] = v6;
  *v6 = v1;
  v6[1] = sub_5140;
  return withCheckedContinuation<A>(isolation:function:_:)(v1 + 51, v4, &protocol witness table for MainActor, 0xD000000000000012, 0x8000000000038380, sub_19F00, v5, &type metadata for Bool);
}

uint64_t sub_5140()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 336);
  v3 = *(_QWORD *)(*v0 + 328);
  swift_task_dealloc(*(_QWORD *)(*v0 + 344));
  swift_release(v3);
  swift_task_dealloc(v2);
  return swift_task_switch(sub_51A8, *(_QWORD *)(v1 + 312), *(_QWORD *)(v1 + 320));
}

uint64_t sub_51A8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 304));
  *(_BYTE *)(v0 + 409) = *(_BYTE *)(v0 + 408);
  return swift_task_switch(sub_51E8, *(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 224));
}

uint64_t sub_51E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t KeyPath;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  uint64_t v27;

  if ((*(_BYTE *)(v0 + 409) & 1) != 0)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 176) + 8))(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 168));
    v1 = *(_QWORD *)(v0 + 280);
    v2 = *(_QWORD *)(v0 + 272);
    swift_release(*(_QWORD *)(v0 + 288));
    if (v1 + 1 == v2)
    {
      swift_bridgeObjectRelease(*(_QWORD *)(v0 + 264));
      v3 = *(int **)(v0 + 112);
      v26 = (uint64_t (*)(uint64_t, uint64_t))((char *)v3 + *v3);
      v4 = (_QWORD *)swift_task_alloc(v3[1]);
      *(_QWORD *)(v0 + 352) = v4;
      *v4 = v0;
      v4[1] = sub_5404;
      v5 = *(_QWORD *)(v0 + 248);
      v6 = *(_QWORD *)(v0 + 160);
    }
    else
    {
      v20 = *(_QWORD *)(v0 + 280) + 1;
      *(_QWORD *)(v0 + 280) = v20;
      v21 = *(_QWORD *)(v0 + 264) + 16 * v20;
      v22 = *(_QWORD *)(v21 + 40);
      *(_QWORD *)(v0 + 288) = v22;
      v23 = *(int **)(v21 + 32);
      v24 = v23[1];
      v26 = (uint64_t (*)(uint64_t, uint64_t))((char *)v23 + *v23);
      swift_retain_n(v22, 2);
      v25 = (_QWORD *)swift_task_alloc(v24);
      *(_QWORD *)(v0 + 296) = v25;
      *v25 = v0;
      v25[1] = sub_4EA4;
      v5 = *(_QWORD *)(v0 + 248);
      v6 = *(_QWORD *)(v0 + 192);
    }
    return v26(v6, v5);
  }
  else
  {
    v7 = *(_QWORD *)(v0 + 288);
    v9 = *(_QWORD *)(v0 + 240);
    v8 = *(_QWORD *)(v0 + 248);
    v10 = *(_QWORD *)(v0 + 208);
    v11 = *(_QWORD *)(v0 + 176);
    v27 = *(_QWORD *)(v0 + 184);
    v12 = *(_QWORD *)(v0 + 168);
    v13 = *(_QWORD *)(v0 + 128);
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 264));
    swift_release(v10);
    swift_bridgeObjectRelease(v8);
    KeyPath = swift_getKeyPath(&unk_33BA0);
    v15 = swift_task_alloc(32);
    *(_QWORD *)(v15 + 16) = v13;
    *(_BYTE *)(v15 + 24) = 0;
    *(_QWORD *)(v0 + 72) = v13;
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(v0 + 72, KeyPath, sub_1A254, v15, (char *)&type metadata for () + 8, v9);
    swift_release(KeyPath);
    swift_release(v7);
    swift_task_dealloc(v15);
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v27, v12);
    v16 = *(_QWORD *)(v0 + 184);
    v18 = *(_QWORD *)(v0 + 152);
    v17 = *(_QWORD *)(v0 + 160);
    swift_task_dealloc(*(_QWORD *)(v0 + 192));
    swift_task_dealloc(v16);
    swift_task_dealloc(v17);
    swift_task_dealloc(v18);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_5404()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 248);
  swift_task_dealloc(*(_QWORD *)(*v0 + 352));
  swift_bridgeObjectRelease(v2);
  return swift_task_switch(sub_545C, *(_QWORD *)(v1 + 216), *(_QWORD *)(v1 + 224));
}

uint64_t sub_545C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t KeyPath;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = *(_QWORD *)(v0 + 160);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_40EA0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(v1, 1, v2) == 1)
  {
    v3 = *(_QWORD *)(v0 + 240);
    v4 = *(_QWORD *)(v0 + 128);
    swift_release(*(_QWORD *)(v0 + 208));
    KeyPath = swift_getKeyPath(&unk_33BA0);
    v6 = swift_task_alloc(32);
    *(_QWORD *)(v6 + 16) = v4;
    *(_BYTE *)(v6 + 24) = 0;
    *(_QWORD *)(v0 + 88) = v4;
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(v0 + 88, KeyPath, sub_1A254, v6, (char *)&type metadata for () + 8, v3);
    swift_release(KeyPath);
    swift_task_dealloc(v6);
    v7 = swift_getKeyPath(&unk_33B78);
    *(_QWORD *)(v0 + 96) = v4;
    ObservationRegistrar.access<A, B>(_:keyPath:)(v0 + 96, v7, v3);
    swift_release(v7);
    *(_QWORD *)(v0 + 104) = v4;
    v8 = swift_getKeyPath(&unk_33B78);
    ObservationRegistrar.willSet<A, B>(_:keyPath:)(v0 + 104, v8, v3);
    swift_release(v8);
    *(_BYTE *)(v4 + 114) = (*(_BYTE *)(v4 + 114) & 1) == 0;
    *(_QWORD *)(v0 + 64) = v4;
    v9 = swift_getKeyPath(&unk_33B78);
    ObservationRegistrar.didSet<A, B>(_:keyPath:)(v0 + 64, v9, v3);
    swift_release(v9);
    v10 = *(_QWORD *)(v0 + 184);
    v12 = *(_QWORD *)(v0 + 152);
    v11 = *(_QWORD *)(v0 + 160);
    swift_task_dealloc(*(_QWORD *)(v0 + 192));
    swift_task_dealloc(v10);
    swift_task_dealloc(v11);
    swift_task_dealloc(v12);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v14 = *(_QWORD *)(v0 + 200);
    v15 = (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v0 + 144) + 32))(*(_QWORD *)(v0 + 152), v1, *(_QWORD *)(v0 + 136));
    *(_QWORD *)(v0 + 360) = static MainActor.shared.getter(v15);
    v16 = dispatch thunk of Actor.unownedExecutor.getter(v14, &protocol witness table for MainActor);
    *(_QWORD *)(v0 + 368) = v16;
    *(_QWORD *)(v0 + 376) = v17;
    return swift_task_switch(sub_566C, v16, v17);
  }
}

uint64_t sub_566C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v1[19];
  v3 = v1[16];
  v1[48] = static MainActor.shared.getter(a1);
  v4 = swift_task_alloc(32);
  v1[49] = v4;
  *(_QWORD *)(v4 + 16) = v3;
  *(_QWORD *)(v4 + 24) = v2;
  v5 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
  v1[50] = v5;
  *v5 = v1;
  v5[1] = sub_5724;
  return withCheckedContinuation<A>(isolation:function:_:)();
}

uint64_t sub_5724()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 392);
  v3 = *(_QWORD *)(*v0 + 384);
  swift_task_dealloc(*(_QWORD *)(*v0 + 400));
  swift_release(v3);
  swift_task_dealloc(v2);
  return swift_task_switch(sub_578C, *(_QWORD *)(v1 + 368), *(_QWORD *)(v1 + 376));
}

uint64_t sub_578C()
{
  _QWORD *v0;

  swift_release(v0[45]);
  return swift_task_switch(sub_57C4, v0[27], v0[28]);
}

uint64_t sub_57C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t KeyPath;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(v0 + 240);
  v3 = *(_QWORD *)(v0 + 144);
  v2 = *(_QWORD *)(v0 + 152);
  v5 = *(_QWORD *)(v0 + 128);
  v4 = *(_QWORD *)(v0 + 136);
  swift_release(*(_QWORD *)(v0 + 208));
  KeyPath = swift_getKeyPath(&unk_33BA0);
  v7 = swift_task_alloc(32);
  *(_QWORD *)(v7 + 16) = v5;
  *(_BYTE *)(v7 + 24) = 0;
  *(_QWORD *)(v0 + 80) = v5;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(v0 + 80, KeyPath, sub_1A254, v7, (char *)&type metadata for () + 8, v1);
  swift_release(KeyPath);
  swift_task_dealloc(v7);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  v8 = *(_QWORD *)(v0 + 184);
  v10 = *(_QWORD *)(v0 + 152);
  v9 = *(_QWORD *)(v0 + 160);
  swift_task_dealloc(*(_QWORD *)(v0 + 192));
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_58C0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(unint64_t, uint64_t);
  char v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t i;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  unint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t isUniquelyReferenced_nonNull_native;
  char v38;
  unint64_t v39;
  uint64_t v40;
  _BOOL8 v41;
  uint64_t v42;
  char v43;
  unint64_t v44;
  char v45;
  unint64_t v46;
  char v47;
  char v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  BOOL v54;
  uint64_t v55;
  uint64_t result;
  uint64_t v57;
  uint64_t v58;
  int64_t v59;
  int64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  _QWORD *v66;

  v2 = type metadata accessor for Handle(0);
  v62 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v65 = (uint64_t)&v57 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (_QWORD *)sub_2F1C((uint64_t)_swiftEmptyArrayStorage);
  v5 = *(_QWORD *)(a1 + 64);
  v58 = a1 + 64;
  v6 = 1 << *(_BYTE *)(a1 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & v5;
  v60 = (unint64_t)(v6 + 63) >> 6;
  swift_bridgeObjectRetain(a1);
  v9 = 0;
  v61 = a1;
  v63 = v2;
  if (v8)
    goto LABEL_7;
LABEL_8:
  v19 = v9 + 1;
  if (!__OFADD__(v9, 1))
  {
    if (v19 < v60)
    {
      v20 = *(_QWORD *)(v58 + 8 * v19);
      ++v9;
      if (v20)
        goto LABEL_25;
      v9 = v19 + 1;
      if (v19 + 1 >= v60)
        goto LABEL_47;
      v20 = *(_QWORD *)(v58 + 8 * v9);
      if (v20)
        goto LABEL_25;
      v9 = v19 + 2;
      if (v19 + 2 >= v60)
        goto LABEL_47;
      v20 = *(_QWORD *)(v58 + 8 * v9);
      if (v20)
        goto LABEL_25;
      v9 = v19 + 3;
      if (v19 + 3 >= v60)
        goto LABEL_47;
      v20 = *(_QWORD *)(v58 + 8 * v9);
      if (v20)
        goto LABEL_25;
      v9 = v19 + 4;
      if (v19 + 4 >= v60)
        goto LABEL_47;
      v20 = *(_QWORD *)(v58 + 8 * v9);
      if (v20)
      {
LABEL_25:
        v17 = (v20 - 1) & v20;
        for (i = __clz(__rbit64(v20)) + (v9 << 6); ; i = v16 | (v9 << 6))
        {
          v22 = *(id *)(*(_QWORD *)(a1 + 48) + 8 * i);
          v23 = objc_msgSend(v22, "normalizedAddress");
          if (!v23)
            goto LABEL_52;
          v24 = v23;
          v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          v27 = v26;

          Handle.init(rawValue:)(v25, v27);
          v28 = *(_QWORD *)(a1 + 16);
          v64 = v17;
          if (v28)
          {
            v29 = v22;
            v30 = sub_1035C((uint64_t)v29);
            if ((v31 & 1) != 0)
            {
              v59 = v9;
              v32 = *(_QWORD *)(a1 + 56) + 32 * v30;
              v34 = *(_QWORD *)v32;
              v33 = *(_QWORD *)(v32 + 8);
              v35 = *(_QWORD *)(v32 + 16);
              v36 = *(_BYTE *)(v32 + 24);
              sub_18DEC(*(_QWORD *)v32, v33, v35, v36);

              isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v4);
              v66 = v4;
              v39 = sub_1038C(v65);
              v40 = v4[2];
              v41 = (v38 & 1) == 0;
              v42 = v40 + v41;
              if (__OFADD__(v40, v41))
                goto LABEL_49;
              v43 = v38;
              if (v4[3] >= v42)
              {
                if ((isUniquelyReferenced_nonNull_native & 1) != 0)
                {
                  v4 = v66;
                  if ((v38 & 1) == 0)
                    goto LABEL_43;
                }
                else
                {
                  sub_13A80();
                  v4 = v66;
                  if ((v43 & 1) == 0)
                    goto LABEL_43;
                }
              }
              else
              {
                sub_10650(v42, isUniquelyReferenced_nonNull_native);
                v44 = sub_1038C(v65);
                if ((v43 & 1) != (v45 & 1))
                  goto LABEL_53;
                v39 = v44;
                v4 = v66;
                if ((v43 & 1) == 0)
                {
LABEL_43:
                  v4[(v39 >> 6) + 8] |= 1 << v39;
                  (*(void (**)(unint64_t, uint64_t, uint64_t))(v62 + 16))(v4[6] + *(_QWORD *)(v62 + 72) * v39, v65, v63);
                  v52 = v4[7] + 32 * v39;
                  *(_QWORD *)v52 = v34;
                  *(_QWORD *)(v52 + 8) = v33;
                  *(_QWORD *)(v52 + 16) = v35;
                  *(_BYTE *)(v52 + 24) = v36;
                  v53 = v4[2];
                  v54 = __OFADD__(v53, 1);
                  v55 = v53 + 1;
                  if (v54)
                    goto LABEL_50;
                  v4[2] = v55;
LABEL_45:
                  swift_bridgeObjectRelease(0x8000000000000000);
                  (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v65, v63);
                  a1 = v61;
                  v9 = v59;
                  v8 = v64;

                  if (!v8)
                    goto LABEL_8;
                  goto LABEL_7;
                }
              }
              v51 = v4[7] + 32 * v39;
              sub_18E20(*(_QWORD *)v51, *(_QWORD *)(v51 + 8), *(_QWORD *)(v51 + 16), *(_BYTE *)(v51 + 24));
              *(_QWORD *)v51 = v34;
              *(_QWORD *)(v51 + 8) = v33;
              *(_QWORD *)(v51 + 16) = v35;
              *(_BYTE *)(v51 + 24) = v36;
              goto LABEL_45;
            }

          }
          swift_bridgeObjectRetain(v4);
          v46 = sub_1038C(v65);
          v48 = v47;
          swift_bridgeObjectRelease(v4);
          if ((v48 & 1) != 0)
          {
            v49 = swift_isUniquelyReferenced_nonNull_native(v4);
            v66 = v4;
            if (!v49)
            {
              sub_13A80();
              v4 = v66;
            }
            v13 = v63;
            v14 = *(void (**)(unint64_t, uint64_t))(v62 + 8);
            v14(v4[6] + *(_QWORD *)(v62 + 72) * v46, v63);
            v4 = v66;
            v50 = v66[7] + 32 * v46;
            v10 = *(_QWORD *)v50;
            v11 = *(_QWORD *)(v50 + 8);
            v12 = *(_QWORD *)(v50 + 16);
            v15 = *(_BYTE *)(v50 + 24);
            sub_13174(v46, (uint64_t)v66);
            swift_bridgeObjectRelease(0x8000000000000000);
          }
          else
          {
            v10 = 0;
            v11 = 0;
            v12 = 0;
            v13 = v63;
            v14 = *(void (**)(unint64_t, uint64_t))(v62 + 8);
            v15 = -1;
          }
          v14(v65, v13);
          sub_19418(v10, v11, v12, v15);
          v8 = v64;
          a1 = v61;

          if (!v8)
            goto LABEL_8;
LABEL_7:
          v16 = __clz(__rbit64(v8));
          v17 = (v8 - 1) & v8;
        }
      }
      v21 = v19 + 5;
      if (v21 < v60)
      {
        v20 = *(_QWORD *)(v58 + 8 * v21);
        if (v20)
        {
          v9 = v21;
          goto LABEL_25;
        }
        while (1)
        {
          v9 = v21 + 1;
          if (__OFADD__(v21, 1))
            goto LABEL_51;
          if (v9 >= v60)
            break;
          v20 = *(_QWORD *)(v58 + 8 * v9);
          ++v21;
          if (v20)
            goto LABEL_25;
        }
      }
    }
LABEL_47:
    swift_release(a1);
    return (uint64_t)v4;
  }
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v63);
  __break(1u);
  return result;
}

uint64_t sub_5DA0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  _QWORD *v5;
  _QWORD *v6;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v13;
  uint64_t v15[3];
  char v16;

  v6 = v5;
  if (a4 == -1)
  {
    sub_12FC4((uint64_t)a5, (uint64_t)v15);

    return sub_19418(v15[0], v15[1], v15[2], v16);
  }
  else
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v5);
    v15[0] = *v5;
    *v5 = 0x8000000000000000;
    sub_13784(a1, a2, a3, a4, a5, isUniquelyReferenced_nonNull_native);
    v13 = *v5;
    *v6 = v15[0];

    return swift_bridgeObjectRelease(v13);
  }
}

uint64_t sub_5E74(void *a1)
{
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (qword_40BE0 != -1)
    swift_once(&qword_40BE0, sub_2C68);
  v2 = type metadata accessor for Logger(0);
  __swift_project_value_buffer(v2, (uint64_t)qword_40C18);
  v3 = a1;
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = swift_slowAlloc(22, -1);
    v14 = swift_slowAlloc(64, -1);
    v16 = v14;
    *(_DWORD *)v6 = 136315394;
    v15 = sub_FD1C(0xD000000000000013, 0x80000000000382D0, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v6 + 4, v6 + 12);
    *(_WORD *)(v6 + 12) = 2080;
    v7 = v3;
    v8 = objc_msgSend(v7, "description");
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8, v9);
    v12 = v11;

    v15 = sub_FD1C(v10, v12, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v6 + 14, v6 + 22);

    swift_bridgeObjectRelease(v12);
    _os_log_impl(&dword_0, v4, v5, "FMRecipientsViewModel: %s - recipient: %s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy(v14, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v14, -1, -1);
    swift_slowDealloc(v6, -1, -1);

  }
  else
  {

  }
  return sub_609C(v3);
}

uint64_t sub_609C(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
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
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  char *v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t KeyPath;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v59;
  uint64_t v60;
  uint64_t v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  char v77;

  v2 = v1;
  v69 = *v2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_40F58);
  __chkstk_darwin(v4);
  v70 = (uint64_t)&v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_40F60);
  __chkstk_darwin(v6);
  v8 = (char *)&v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Handle(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  v12 = __chkstk_darwin(v9);
  v68 = (char *)&v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v71 = (char *)&v62 - v13;
  if (qword_40BE0 != -1)
    swift_once(&qword_40BE0, sub_2C68);
  v14 = type metadata accessor for Logger(0);
  __swift_project_value_buffer(v14, (uint64_t)qword_40C18);
  v15 = a1;
  v16 = Logger.logObject.getter(v15);
  v17 = static os_log_type_t.default.getter();
  v18 = v17;
  if (os_log_type_enabled(v16, v17))
  {
    v19 = swift_slowAlloc(22, -1);
    v67 = v2;
    v20 = v19;
    v65 = swift_slowAlloc(64, -1);
    v66 = v9;
    v74 = (_QWORD *)v65;
    *(_DWORD *)v20 = 136315394;
    v72 = v10;
    v73 = sub_FD1C(0xD00000000000001BLL, 0x80000000000382F0, (uint64_t *)&v74);
    v64 = v18;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v73, &v74, v20 + 4, v20 + 12);
    *(_WORD *)(v20 + 12) = 2080;
    v63 = v20 + 14;
    v21 = v15;
    v22 = v11;
    v23 = objc_msgSend(v21, "description");
    v25 = v8;
    v26 = v15;
    v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23, v24);
    v29 = v28;

    v11 = v22;
    v30 = v27;
    v15 = v26;
    v8 = v25;
    v73 = sub_FD1C(v30, v29, (uint64_t *)&v74);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v73, &v74, v63, v20 + 22);

    v31 = v29;
    v10 = v72;
    swift_bridgeObjectRelease(v31);
    _os_log_impl(&dword_0, v16, (os_log_type_t)v64, "FMRecipientsViewModel: %s - recipient: %s", (uint8_t *)v20, 0x16u);
    v32 = v65;
    swift_arrayDestroy(v65, 2, (char *)&type metadata for Any + 8);
    v9 = v66;
    swift_slowDealloc(v32, -1, -1);
    v33 = v20;
    v2 = v67;
    swift_slowDealloc(v33, -1, -1);

  }
  else
  {

  }
  v34 = objc_msgSend(v15, "normalizedAddress");
  if (v34)
  {
    v36 = v34;
    v37 = static String._unconditionallyBridgeFromObjectiveC(_:)(v34, v35);
    v39 = v38;

    swift_bridgeObjectRetain(v39);
    Handle.init(rawValue:)(v37, v39);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
    swift_bridgeObjectRelease(v39);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) != 1)
    {
      v67 = *(_QWORD **)(v10 + 32);
      v40 = v71;
      ((void (*)(char *, char *, uint64_t))v67)(v71, v8, v9);
      v74 = 0;
      v75 = 0;
      v76 = 0;
      v77 = 2;
      sub_6960((uint64_t)&v74, v15);
      sub_6F20(v15);
      v41 = type metadata accessor for TaskPriority(0);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v70, 1, 1, v41);
      v42 = swift_allocObject(&unk_3D748, 24, 7);
      swift_weakInit(v42 + 16, v2);
      v43 = v68;
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v68, v40, v9);
      type metadata accessor for MainActor(0);
      v44 = v15;
      v45 = swift_retain(v42);
      v46 = static MainActor.shared.getter(v45);
      v47 = *(unsigned __int8 *)(v10 + 80);
      v48 = v9;
      v49 = (v47 + 40) & ~v47;
      v72 = v10;
      v50 = (v11 + v49 + 7) & 0xFFFFFFFFFFFFFFF8;
      v51 = (v50 + 15) & 0xFFFFFFFFFFFFFFF8;
      v52 = (_QWORD *)swift_allocObject(&unk_3D810, v51 + 8, v47 | 7);
      v52[2] = v46;
      v52[3] = &protocol witness table for MainActor;
      v52[4] = v42;
      ((void (*)(char *, char *, uint64_t))v67)((char *)v52 + v49, v43, v48);
      *(_QWORD *)((char *)v52 + v50) = v44;
      *(_QWORD *)((char *)v52 + v51) = v69;
      swift_release(v42);
      v53 = sub_7E7C(v70, (uint64_t)&unk_40FE0, (uint64_t)v52);
      KeyPath = swift_getKeyPath(&unk_33AB0);
      v74 = v2;
      v55 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
      ObservationRegistrar.access<A, B>(_:keyPath:)(&v74, KeyPath, v55);
      swift_release(KeyPath);
      v74 = v2;
      v56 = swift_getKeyPath(&unk_33AB0);
      ObservationRegistrar.willSet<A, B>(_:keyPath:)(&v74, v56, v55);
      swift_release(v56);
      v57 = (_QWORD *)((char *)v2
                     + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__reachabilityRequestsPerAddress);
      swift_beginAccess((char *)v2 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__reachabilityRequestsPerAddress, &v74, 33, 0);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v57);
      v73 = *v57;
      *v57 = 0x8000000000000000;
      sub_13920(v53, v44, isUniquelyReferenced_nonNull_native);
      v59 = *v57;
      *v57 = v73;

      swift_bridgeObjectRelease(v59);
      swift_endAccess(&v74);
      v74 = v2;
      v60 = swift_getKeyPath(&unk_33AB0);
      ObservationRegistrar.didSet<A, B>(_:keyPath:)(&v74, v60, v55);
      swift_release(v60);
      return (*(uint64_t (**)(char *, uint64_t))(v72 + 8))(v71, v48);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
  }
  sub_1A198((uint64_t)v8, &qword_40F60);
  v75 = 0;
  v76 = 0;
  v74 = (_QWORD *)(&dword_0 + 1);
  v77 = 1;
  return sub_6960((uint64_t)&v74, v15);
}

uint64_t sub_671C(void *a1)
{
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16[3];
  char v17;

  if (qword_40BE0 != -1)
    swift_once(&qword_40BE0, sub_2C68);
  v2 = type metadata accessor for Logger(0);
  __swift_project_value_buffer(v2, (uint64_t)qword_40C18);
  v3 = a1;
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = swift_slowAlloc(22, -1);
    v14 = swift_slowAlloc(64, -1);
    v16[0] = v14;
    *(_DWORD *)v6 = 136315394;
    v15 = sub_FD1C(0xD000000000000016, 0x80000000000381D0, v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, v16, v6 + 4, v6 + 12);
    *(_WORD *)(v6 + 12) = 2080;
    v7 = v3;
    v8 = objc_msgSend(v7, "description");
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8, v9);
    v12 = v11;

    v15 = sub_FD1C(v10, v12, v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, v16, v6 + 14, v6 + 22);

    swift_bridgeObjectRelease(v12);
    _os_log_impl(&dword_0, v4, v5, "FMRecipientsViewModel: %s - recipient: %s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy(v14, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v14, -1, -1);
    swift_slowDealloc(v6, -1, -1);

  }
  else
  {

  }
  memset(v16, 0, sizeof(v16));
  v17 = -1;
  sub_6960((uint64_t)v16, v3);
  return sub_6F20(v3);
}

uint64_t sub_6960(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t KeyPath;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  NSObject *log;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40[3];
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;

  v4 = *(_QWORD *)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v6 = *(unsigned __int8 *)(a1 + 24);
  if (qword_40BE0 != -1)
    swift_once(&qword_40BE0, sub_2C68);
  v7 = type metadata accessor for Logger(0);
  __swift_project_value_buffer(v7, (uint64_t)qword_40C18);
  sub_19404(v4, v3, v5, v6);
  v8 = a2;
  sub_19404(v4, v3, v5, v6);
  v9 = v8;
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.debug.getter();
  v38 = v9;
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc(32, -1);
    v37 = swift_slowAlloc(96, -1);
    v40[0] = v37;
    *(_DWORD *)v12 = 136315650;
    v41 = sub_FD1C(0xD000000000000010, 0x80000000000381F0, v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42, v12 + 4, v12 + 12);
    *(_WORD *)(v12 + 12) = 2080;
    v41 = v4;
    v42 = v3;
    v43 = v5;
    v44 = v6;
    sub_19404(v4, v3, v5, v6);
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_40FA0);
    log = v10;
    v14 = String.init<A>(describing:)(&v41, v13);
    v16 = v15;
    v41 = sub_FD1C(v14, v15, v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42, v12 + 14, v12 + 22);
    swift_bridgeObjectRelease(v16);
    sub_19418(v4, v3, v5, v6);
    sub_19418(v4, v3, v5, v6);
    *(_WORD *)(v12 + 22) = 2080;
    v17 = v9;
    v18 = objc_msgSend(v17, "description");
    v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v21 = v20;

    v41 = sub_FD1C(v19, v21, v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v41, &v42, v12 + 24, v12 + 32);

    swift_bridgeObjectRelease(v21);
    _os_log_impl(&dword_0, log, v11, "ContactPickerViewModel: %s - status: %s - recipient: %s", (uint8_t *)v12, 0x20u);
    swift_arrayDestroy(v37, 3, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v37, -1, -1);
    swift_slowDealloc(v12, -1, -1);

    if (v6 != 255)
    {
LABEL_5:
      KeyPath = swift_getKeyPath(&unk_33AD8);
      v41 = v39;
      sub_19404(v4, v3, v5, v6);
      sub_19404(v4, v3, v5, v6);
      v23 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
      v24 = v38;
      ObservationRegistrar.access<A, B>(_:keyPath:)(&v41, KeyPath, v23);
      swift_release(KeyPath);
      v41 = v39;
      v25 = swift_getKeyPath(&unk_33AD8);
      ObservationRegistrar.willSet<A, B>(_:keyPath:)(&v41, v25, v23);
      swift_release(v25);
      swift_beginAccess(v39 + 104, &v41, 33, 0);
      sub_5DA0(v4, v3, v5, v6, v24);
      swift_endAccess(&v41);
      v41 = v39;
      v26 = swift_getKeyPath(&unk_33AD8);
      ObservationRegistrar.didSet<A, B>(_:keyPath:)(&v41, v26, v23);
      swift_release(v26);
      v41 = v4;
      v42 = v3;
      v43 = v5;
      v44 = v6;
      sub_8684(v24, (uint64_t)&v41);
      return sub_19418(v4, v3, v5, v6);
    }
  }
  else
  {
    sub_19418(v4, v3, v5, v6);
    sub_19418(v4, v3, v5, v6);

    if (v6 != 255)
      goto LABEL_5;
  }
  v28 = swift_getKeyPath(&unk_33AD8);
  v41 = v39;
  v29 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v41, v28, v29);
  swift_release(v28);
  v41 = v39;
  v30 = swift_getKeyPath(&unk_33AD8);
  ObservationRegistrar.willSet<A, B>(_:keyPath:)(&v41, v30, v29);
  swift_release(v30);
  swift_beginAccess(v39 + 104, v40, 33, 0);
  sub_12FC4((uint64_t)v38, (uint64_t)&v41);
  v31 = v41;
  v32 = v42;
  v33 = v43;
  v34 = v44;
  swift_endAccess(v40);
  sub_19418(v31, v32, v33, v34);
  v40[0] = v39;
  v35 = swift_getKeyPath(&unk_33AD8);
  ObservationRegistrar.didSet<A, B>(_:keyPath:)(v40, v35, v29);
  swift_release(v35);
  v41 = v4;
  v42 = v3;
  v43 = v5;
  v44 = -1;
  return sub_8684(v38, (uint64_t)&v41);
}

uint64_t sub_6F20(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t KeyPath;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[3];
  _QWORD v19[3];

  v2 = v1;
  KeyPath = swift_getKeyPath(&unk_33AB0);
  v19[0] = v2;
  v5 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
  v6 = a1;
  ObservationRegistrar.access<A, B>(_:keyPath:)(v19, KeyPath, v5);
  swift_release(KeyPath);
  v7 = (_QWORD *)(v2 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__reachabilityRequestsPerAddress);
  swift_beginAccess(v2 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__reachabilityRequestsPerAddress, v19, 0, 0);
  v8 = *v7;
  if (*(_QWORD *)(*v7 + 16))
  {
    swift_bridgeObjectRetain(*v7);
    v9 = sub_1035C((uint64_t)v6);
    if ((v10 & 1) != 0)
    {
      v11 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v9);
      swift_retain(v11);

      swift_bridgeObjectRelease(v8);
      Task.cancel()();
      swift_release(v11);
    }
    else
    {

      swift_bridgeObjectRelease(v8);
    }
  }
  else
  {

  }
  v12 = swift_getKeyPath(&unk_33AB0);
  v18[0] = v2;
  v13 = v6;
  ObservationRegistrar.access<A, B>(_:keyPath:)(v18, v12, v5);
  swift_release(v12);
  v18[0] = v2;
  v14 = swift_getKeyPath(&unk_33AB0);
  ObservationRegistrar.willSet<A, B>(_:keyPath:)(v18, v14, v5);
  swift_release(v14);
  swift_beginAccess(v7, v18, 33, 0);
  v15 = sub_130B0((uint64_t)v13);
  swift_endAccess(v18);

  swift_release(v15);
  v18[0] = v2;
  v16 = swift_getKeyPath(&unk_33AB0);
  ObservationRegistrar.didSet<A, B>(_:keyPath:)(v18, v16, v5);
  return swift_release(v16);
}

void sub_712C(void *a1)
{
  uint64_t *v1;
  uint64_t v3;
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
  char *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t KeyPath;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  NSObject *v47;
  os_log_type_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  void (*v58)(char *, char *, uint64_t);
  char *v59;
  uint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63[3];
  uint64_t v64;
  uint64_t v65;

  v3 = *v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_40F58);
  __chkstk_darwin(v4);
  v6 = (char *)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_40F60);
  __chkstk_darwin(v7);
  v9 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Handle(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  v13 = __chkstk_darwin(v10);
  v62 = (char *)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v15 = (char *)&v57 - v14;
  v16 = objc_msgSend(a1, "normalizedAddress");
  if (v16)
  {
    v18 = v16;
    v60 = v3;
    v61 = v6;
    v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16, v17);
    v20 = a1;
    v22 = v21;

    swift_bridgeObjectRetain(v22);
    Handle.init(rawValue:)(v19, v22);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
    v23 = v22;
    a1 = v20;
    swift_bridgeObjectRelease(v23);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) != 1)
    {
      v58 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
      v59 = v15;
      v24 = v15;
      v58(v15, v9, v10);
      v57 = (uint64_t)v1;
      sub_6F20(a1);
      v25 = type metadata accessor for TaskPriority(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v61, 1, 1, v25);
      v26 = swift_allocObject(&unk_3D748, 24, 7);
      swift_weakInit(v26 + 16, v1);
      v27 = v62;
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v62, v24, v10);
      type metadata accessor for MainActor(0);
      v28 = a1;
      v29 = swift_retain(v26);
      v30 = static MainActor.shared.getter(v29);
      v31 = *(unsigned __int8 *)(v11 + 80);
      v32 = (v31 + 40) & ~v31;
      v33 = (v12 + v32 + 7) & 0xFFFFFFFFFFFFFFF8;
      v34 = (v33 + 15) & 0xFFFFFFFFFFFFFFF8;
      v35 = (char *)swift_allocObject(&unk_3D770, v34 + 8, v31 | 7);
      *((_QWORD *)v35 + 2) = v30;
      *((_QWORD *)v35 + 3) = &protocol witness table for MainActor;
      *((_QWORD *)v35 + 4) = v26;
      v58(&v35[v32], v27, v10);
      *(_QWORD *)&v35[v33] = v28;
      *(_QWORD *)&v35[v34] = v60;
      swift_release(v26);
      v36 = sub_7E7C((uint64_t)v61, (uint64_t)&unk_40F70, (uint64_t)v35);
      KeyPath = swift_getKeyPath(&unk_33AB0);
      v38 = v57;
      v63[0] = v57;
      v39 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
      ObservationRegistrar.access<A, B>(_:keyPath:)(v63, KeyPath, v39);
      swift_release(KeyPath);
      v63[0] = v38;
      v40 = swift_getKeyPath(&unk_33AB0);
      ObservationRegistrar.willSet<A, B>(_:keyPath:)(v63, v40, v39);
      swift_release(v40);
      v41 = (uint64_t *)(v38 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__reachabilityRequestsPerAddress);
      swift_beginAccess(v38 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__reachabilityRequestsPerAddress, v63, 33, 0);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v41);
      v64 = *v41;
      *v41 = 0x8000000000000000;
      sub_13920(v36, v28, isUniquelyReferenced_nonNull_native);
      v43 = *v41;
      *v41 = v64;

      swift_bridgeObjectRelease(v43);
      swift_endAccess(v63);
      v63[0] = v38;
      v44 = swift_getKeyPath(&unk_33AB0);
      ObservationRegistrar.didSet<A, B>(_:keyPath:)(v63, v44, v39);
      swift_release(v44);
      (*(void (**)(char *, uint64_t))(v11 + 8))(v59, v10);
      return;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
  }
  sub_1A198((uint64_t)v9, &qword_40F60);
  if (qword_40BE0 != -1)
    swift_once(&qword_40BE0, sub_2C68);
  v45 = type metadata accessor for Logger(0);
  __swift_project_value_buffer(v45, (uint64_t)qword_40C18);
  v46 = a1;
  v47 = Logger.logObject.getter(v46);
  v48 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v47, v48))
  {
    v49 = swift_slowAlloc(22, -1);
    v50 = swift_slowAlloc(64, -1);
    v63[0] = v50;
    *(_DWORD *)v49 = 136315394;
    v64 = sub_FD1C(0xD000000000000024, 0x80000000000381A0, v63);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, &v65, v49 + 4, v49 + 12);
    *(_WORD *)(v49 + 12) = 2080;
    v51 = v46;
    v52 = objc_msgSend(v51, "description");
    v54 = static String._unconditionallyBridgeFromObjectiveC(_:)(v52, v53);
    v56 = v55;

    v64 = sub_FD1C(v54, v56, v63);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v64, &v65, v49 + 14, v49 + 22);

    swift_bridgeObjectRelease(v56);
    _os_log_impl(&dword_0, v47, v48, "FMRecipientsViewModel: %s - recipient: %s", (uint8_t *)v49, 0x16u);
    swift_arrayDestroy(v50, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v50, -1, -1);
    swift_slowDealloc(v49, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_7730(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6[15] = a5;
  v6[16] = a6;
  v6[14] = a4;
  v7 = type metadata accessor for MainActor(0);
  v6[17] = static MainActor.shared.getter(v7);
  v8 = dispatch thunk of Actor.unownedExecutor.getter(v7, &protocol witness table for MainActor);
  v6[18] = v8;
  v6[19] = v9;
  return swift_task_switch(sub_77A0, v8, v9);
}

uint64_t sub_77A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t Strong;
  int *v3;
  _QWORD *v4;
  int *v6;

  v1 = *(_QWORD *)(v0 + 112) + 16;
  swift_beginAccess(v1, v0 + 16, 0, 0);
  Strong = swift_weakLoadStrong(v1);
  *(_QWORD *)(v0 + 160) = Strong;
  if (Strong)
  {
    v3 = *(int **)(Strong + 64);
    v6 = (int *)((char *)v3 + *v3);
    v4 = (_QWORD *)swift_task_alloc(v3[1]);
    *(_QWORD *)(v0 + 168) = v4;
    *v4 = v0;
    v4[1] = sub_7854;
    return ((uint64_t (*)(uint64_t, _QWORD))v6)(v0 + 40, *(_QWORD *)(v0 + 120));
  }
  else
  {
    swift_release(*(_QWORD *)(v0 + 136));
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_7854()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 168);
  *(_QWORD *)(*v1 + 176) = v0;
  swift_task_dealloc(v3);
  if (v0)
    v4 = sub_7AB0;
  else
    v4 = sub_78B4;
  return swift_task_switch(v4, *(_QWORD *)(v2 + 144), *(_QWORD *)(v2 + 152));
}

uint64_t sub_78B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(id, uint64_t);
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t KeyPath;
  uint64_t v15;
  void (*v16)(id, uint64_t);
  uint64_t v17;
  uint64_t v18;

  v1 = swift_release(*(_QWORD *)(v0 + 136));
  v3 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 48);
  if ((static Task<>.isCancelled.getter(v1) & 1) != 0)
  {
    v4 = *(_QWORD *)(v0 + 160);
LABEL_10:
    sub_193F0(v3, v2);
    goto LABEL_11;
  }
  v5 = (void *)objc_opt_self(UIColor);
  v6 = *(_QWORD *)(v0 + 160);
  if (v2 != 1)
  {
    v13 = objc_msgSend(v5, "systemGrayColor");
    KeyPath = swift_getKeyPath(&unk_33A10);
    *(_QWORD *)(v0 + 96) = v6;
    v15 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
    ObservationRegistrar.access<A, B>(_:keyPath:)(v0 + 96, KeyPath, v15);
    swift_release(KeyPath);
    v16 = *(void (**)(id, uint64_t))(v6
                                             + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__setSearchControllerTintColorForAutocompleteRecipient);
    v4 = *(_QWORD *)(v0 + 160);
    if (v16)
    {
      v17 = *(_QWORD *)(v0 + 128);
      v18 = *(_QWORD *)(v6
                      + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__setSearchControllerTintColorForAutocompleteRecipient
                      + 8);
      swift_retain(v18);
      v16(v13, v17);
      sub_17920((uint64_t)v16, v18);
    }

    goto LABEL_10;
  }
  v7 = objc_msgSend(v5, "systemBlueColor");
  v8 = swift_getKeyPath(&unk_33A10);
  *(_QWORD *)(v0 + 104) = v6;
  v9 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)(v0 + 104, v8, v9);
  swift_release(v8);
  v10 = *(void (**)(id, uint64_t))(v6
                                           + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__setSearchControllerTintColorForAutocompleteRecipient);
  v4 = *(_QWORD *)(v0 + 160);
  if (v10)
  {
    v11 = *(_QWORD *)(v0 + 128);
    v12 = *(_QWORD *)(v6
                    + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__setSearchControllerTintColorForAutocompleteRecipient
                    + 8);
    swift_retain(v12);
    v10(v7, v11);
    sub_17920((uint64_t)v10, v12);
  }

LABEL_11:
  swift_release(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_7AB0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t KeyPath;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(void);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v34;
  uint64_t v35;

  swift_release(*(_QWORD *)(v0 + 136));
  if (qword_40BE0 != -1)
    swift_once(&qword_40BE0, sub_2C68);
  v1 = *(_QWORD *)(v0 + 176);
  v2 = *(void **)(v0 + 128);
  v3 = type metadata accessor for Logger(0);
  __swift_project_value_buffer(v3, (uint64_t)qword_40C18);
  swift_errorRetain(v1);
  v4 = v2;
  swift_errorRetain(v1);
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.error.getter();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(_QWORD *)(v0 + 176);
  v9 = *(void **)(v0 + 128);
  if (v7)
  {
    v10 = swift_slowAlloc(32, -1);
    v34 = swift_slowAlloc(96, -1);
    v35 = v34;
    *(_DWORD *)v10 = 136315650;
    *(_QWORD *)(v0 + 64) = sub_FD1C(0xD000000000000024, 0x80000000000381A0, &v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 64, v0 + 72, v10 + 4, v10 + 12);
    *(_WORD *)(v10 + 12) = 2080;
    *(_QWORD *)(v0 + 72) = v8;
    swift_errorRetain(v8);
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_40F98);
    v12 = String.init<A>(describing:)(v0 + 72, v11);
    v14 = v13;
    *(_QWORD *)(v0 + 80) = sub_FD1C(v12, v13, &v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v0 + 88, v10 + 14, v10 + 22);
    swift_bridgeObjectRelease(v14);
    swift_errorRelease(v8);
    swift_errorRelease(v8);
    *(_WORD *)(v10 + 22) = 2080;
    v15 = v9;
    v16 = objc_msgSend(v15, "description");
    v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v19 = v18;

    *(_QWORD *)(v0 + 88) = sub_FD1C(v17, v19, &v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 88, v0 + 96, v10 + 24, v10 + 32);
    swift_bridgeObjectRelease(v19);

    _os_log_impl(&dword_0, v5, v6, "FMRecipientsViewModel: %s - error: %s - recipient: %s", (uint8_t *)v10, 0x20u);
    swift_arrayDestroy(v34, 3, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v34, -1, -1);
    swift_slowDealloc(v10, -1, -1);
  }
  else
  {
    swift_errorRelease(*(_QWORD *)(v0 + 176));
    swift_errorRelease(v8);

  }
  if ((static Task<>.isCancelled.getter(v20) & 1) != 0)
  {
    v21 = *(_QWORD *)(v0 + 160);
    swift_errorRelease(*(_QWORD *)(v0 + 176));
    v22 = v21;
LABEL_11:
    swift_release(v22);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v23 = *(_QWORD *)(v0 + 160);
  KeyPath = swift_getKeyPath(&unk_33A10);
  *(_QWORD *)(v0 + 56) = v23;
  v25 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)(v0 + 56, KeyPath, v25);
  swift_release(KeyPath);
  v26 = v23
      + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__setSearchControllerTintColorForAutocompleteRecipient;
  v27 = *(void (**)(void))(v23
                         + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__setSearchControllerTintColorForAutocompleteRecipient);
  v28 = *(_QWORD *)(v0 + 176);
  v29 = *(_QWORD *)(v0 + 160);
  if (!v27)
  {
    swift_errorRelease(*(_QWORD *)(v0 + 176));
    v22 = v29;
    goto LABEL_11;
  }
  v30 = *(_QWORD *)(v26 + 8);
  v31 = (void *)objc_opt_self(UIColor);
  swift_retain(v30);
  v32 = objc_msgSend(v31, "systemGrayColor");
  v27();
  sub_17920((uint64_t)v27, v30);
  swift_errorRelease(v28);
  swift_release(v29);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_7E7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t ObjectType;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD v21[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6);
  if ((_DWORD)v8 == 1)
  {
    sub_1A198(a1, &qword_40F58);
    v9 = 7168;
    v10 = *(_QWORD *)(a3 + 16);
    if (v10)
    {
LABEL_3:
      v11 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v10);
      swift_unknownObjectRetain(v10, v13);
      v14 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v11);
      v16 = v15;
      swift_unknownObjectRelease(v10);
      goto LABEL_6;
    }
  }
  else
  {
    v17 = TaskPriority.rawValue.getter(v8);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v9 = v17 | 0x1C00;
    v10 = *(_QWORD *)(a3 + 16);
    if (v10)
      goto LABEL_3;
  }
  v14 = 0;
  v16 = 0;
LABEL_6:
  v18 = swift_allocObject(&unk_3D798, 32, 7);
  *(_QWORD *)(v18 + 16) = a2;
  *(_QWORD *)(v18 + 24) = a3;
  if (v16 | v14)
  {
    v21[0] = 0;
    v21[1] = 0;
    v19 = v21;
    v21[2] = v14;
    v21[3] = v16;
  }
  else
  {
    v19 = 0;
  }
  return swift_task_create(v9, v19, (char *)&type metadata for () + 8, &unk_40F90, v18);
}

uint64_t sub_7FC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6[14] = a5;
  v6[15] = a6;
  v6[13] = a4;
  v7 = type metadata accessor for MainActor(0);
  v6[16] = static MainActor.shared.getter(v7);
  v8 = dispatch thunk of Actor.unownedExecutor.getter(v7, &protocol witness table for MainActor);
  v6[17] = v8;
  v6[18] = v9;
  return swift_task_switch(sub_8038, v8, v9);
}

uint64_t sub_8038()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t Strong;
  int *v3;
  _QWORD *v4;
  int *v6;

  v1 = *(_QWORD *)(v0 + 104) + 16;
  swift_beginAccess(v1, v0 + 16, 0, 0);
  Strong = swift_weakLoadStrong(v1);
  *(_QWORD *)(v0 + 152) = Strong;
  if (Strong)
  {
    v3 = *(int **)(Strong + 80);
    v6 = (int *)((char *)v3 + *v3);
    v4 = (_QWORD *)swift_task_alloc(v3[1]);
    *(_QWORD *)(v0 + 160) = v4;
    *v4 = v0;
    v4[1] = sub_80EC;
    return ((uint64_t (*)(uint64_t, _QWORD))v6)(v0 + 40, *(_QWORD *)(v0 + 112));
  }
  else
  {
    swift_release(*(_QWORD *)(v0 + 128));
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_80EC()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 160));
  return swift_task_switch(sub_8138, *(_QWORD *)(v1 + 136), *(_QWORD *)(v1 + 144));
}

uint64_t sub_8138(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  _QWORD *v6;
  uint64_t v8;
  void *v9;
  int *v10;
  _QWORD v11[3];
  char v12;

  v3 = *(_QWORD *)(v1 + 40);
  v2 = *(_QWORD *)(v1 + 48);
  if ((static Task<>.isCancelled.getter(a1) & 1) != 0)
  {
    v4 = *(_QWORD *)(v1 + 152);
    swift_release(*(_QWORD *)(v1 + 128));
    sub_193F0(v3, v2);
    swift_release(v4);
  }
  else
  {
    if (v2 == 1)
    {
      v5 = *(int **)(*(_QWORD *)(v1 + 152) + 64);
      v10 = (int *)((char *)v5 + *v5);
      v6 = (_QWORD *)swift_task_alloc(v5[1]);
      *(_QWORD *)(v1 + 168) = v6;
      *v6 = v1;
      v6[1] = sub_8254;
      return ((uint64_t (*)(uint64_t, _QWORD))v10)(v1 + 56, *(_QWORD *)(v1 + 112));
    }
    v8 = *(_QWORD *)(v1 + 152);
    v9 = *(void **)(v1 + 120);
    swift_release(*(_QWORD *)(v1 + 128));
    v11[0] = 0;
    v11[1] = v3;
    v11[2] = v2;
    v12 = 1;
    swift_bridgeObjectRetain(v2);
    sub_6960((uint64_t)v11, v9);
    sub_193F0(v3, v2);
    swift_release(v8);
    sub_193F0(v3, v2);
  }
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_8254()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 168);
  *(_QWORD *)(*v1 + 176) = v0;
  swift_task_dealloc(v3);
  if (v0)
    v4 = sub_8390;
  else
    v4 = sub_82B4;
  return swift_task_switch(v4, *(_QWORD *)(v2 + 136), *(_QWORD *)(v2 + 144));
}

uint64_t sub_82B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v1 = swift_release(*(_QWORD *)(v0 + 128));
  v3 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  if ((static Task<>.isCancelled.getter(v1) & 1) != 0)
  {
    v4 = *(_QWORD *)(v0 + 152);
    sub_193F0(v3, v2);
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 152);
    v5 = *(void **)(v0 + 120);
    if (v2 != 1)
    {
      v7 = v3;
      v8 = v2;
      v9 = 0;
      v10 = 0;
      swift_bridgeObjectRetain(v2);
      sub_6960((uint64_t)&v7, v5);
      sub_193F0(v3, v2);
      swift_release(v4);
      sub_193F0(v3, v2);
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
    v8 = 0;
    v9 = 0;
    v7 = 1;
    v10 = 2;
    sub_6960((uint64_t)&v7, v5);
  }
  swift_release(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_8390()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v26;
  uint64_t v27[3];
  char v28;

  swift_release(*(_QWORD *)(v0 + 128));
  if (qword_40BE0 != -1)
    swift_once(&qword_40BE0, sub_2C68);
  v1 = *(_QWORD *)(v0 + 176);
  v2 = *(void **)(v0 + 120);
  v3 = type metadata accessor for Logger(0);
  __swift_project_value_buffer(v3, (uint64_t)qword_40C18);
  swift_errorRetain(v1);
  v4 = v2;
  swift_errorRetain(v1);
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.error.getter();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(_QWORD *)(v0 + 176);
  v9 = *(void **)(v0 + 120);
  if (v7)
  {
    v10 = swift_slowAlloc(32, -1);
    v26 = swift_slowAlloc(96, -1);
    v27[0] = v26;
    *(_DWORD *)v10 = 136315650;
    *(_QWORD *)(v0 + 72) = sub_FD1C(0xD00000000000001BLL, 0x80000000000382F0, v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 72, v0 + 80, v10 + 4, v10 + 12);
    *(_WORD *)(v10 + 12) = 2080;
    *(_QWORD *)(v0 + 80) = v8;
    swift_errorRetain(v8);
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_40F98);
    v12 = String.init<A>(describing:)(v0 + 80, v11);
    v14 = v13;
    *(_QWORD *)(v0 + 88) = sub_FD1C(v12, v13, v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 88, v0 + 96, v10 + 14, v10 + 22);
    swift_bridgeObjectRelease(v14);
    swift_errorRelease(v8);
    swift_errorRelease(v8);
    *(_WORD *)(v10 + 22) = 2080;
    v15 = v9;
    v16 = objc_msgSend(v15, "description");
    v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v19 = v18;

    *(_QWORD *)(v0 + 96) = sub_FD1C(v17, v19, v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 96, v0 + 104, v10 + 24, v10 + 32);
    swift_bridgeObjectRelease(v19);

    _os_log_impl(&dword_0, v5, v6, "FMRecipientsViewModel: %s - error: %s - recipient: %s", (uint8_t *)v10, 0x20u);
    swift_arrayDestroy(v26, 3, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v26, -1, -1);
    swift_slowDealloc(v10, -1, -1);
  }
  else
  {
    swift_errorRelease(*(_QWORD *)(v0 + 176));
    swift_errorRelease(v8);

  }
  v21 = static Task<>.isCancelled.getter(v20);
  v22 = *(_QWORD *)(v0 + 176);
  v23 = *(_QWORD *)(v0 + 152);
  if ((v21 & 1) == 0)
  {
    v24 = *(void **)(v0 + 120);
    memset(v27, 0, sizeof(v27));
    v28 = 0;
    sub_6960((uint64_t)v27, v24);
  }
  swift_errorRelease(v22);
  swift_release(v23);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_8684(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t KeyPath;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, id);
  uint64_t v29;
  uint64_t v30;
  NSObject *log;
  os_log_type_t type;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  _QWORD v37[2];
  char v38;
  uint64_t v39;

  v3 = v2;
  v5 = *(_QWORD *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a2 + 16);
  v8 = *(unsigned __int8 *)(a2 + 24);
  if (qword_40BE0 != -1)
    swift_once(&qword_40BE0, sub_2C68);
  v9 = type metadata accessor for Logger(0);
  __swift_project_value_buffer(v9, (uint64_t)qword_40C18);
  sub_19404(v5, v6, v7, v8);
  v10 = a1;
  sub_19404(v5, v6, v7, v8);
  v11 = v10;
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc(32, -1);
    v34 = swift_slowAlloc(96, -1);
    v39 = v34;
    *(_DWORD *)v14 = 136315650;
    v36 = sub_FD1C(0xD00000000000002BLL, 0x8000000000038210, &v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, v37, v14 + 4, v14 + 12);
    type = v13;
    *(_WORD *)(v14 + 12) = 2080;
    log = v12;
    v36 = v5;
    v37[0] = v6;
    v37[1] = v7;
    v38 = v8;
    sub_19404(v5, v6, v7, v8);
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_40FA0);
    v16 = String.init<A>(describing:)(&v36, v15);
    v35 = v11;
    v18 = v17;
    v36 = sub_FD1C(v16, v17, &v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, v37, v14 + 14, v14 + 22);
    swift_bridgeObjectRelease(v18);
    sub_19418(v5, v6, v7, v8);
    sub_19418(v5, v6, v7, v8);
    *(_WORD *)(v14 + 22) = 2080;
    v19 = v35;
    v20 = v3;
    v21 = objc_msgSend(v19, "description");
    v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v24 = v23;

    v3 = v20;
    v36 = sub_FD1C(v22, v24, &v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, v37, v14 + 24, v14 + 32);

    v11 = v35;
    swift_bridgeObjectRelease(v24);
    _os_log_impl(&dword_0, log, type, "ContactPickerViewModel: %s - status: %s - recipient: %s", (uint8_t *)v14, 0x20u);
    swift_arrayDestroy(v34, 3, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v34, -1, -1);
    swift_slowDealloc(v14, -1, -1);

    if (v8 == 255)
      return sub_8B2C();
  }
  else
  {
    sub_19418(v5, v6, v7, v8);
    sub_19418(v5, v6, v7, v8);

    if (v8 == 255)
      return sub_8B2C();
  }
  KeyPath = swift_getKeyPath(&unk_33A60);
  v36 = v3;
  sub_18DEC(v5, v6, v7, v8);
  v26 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v36, KeyPath, v26);
  swift_release(KeyPath);
  v27 = v3 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__setSearchControllerPresentationOptionsForRecipient;
  v28 = *(void (**)(uint64_t, id))(v3
                                           + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__setSearchControllerPresentationOptionsForRecipient);
  if (v28)
  {
    v29 = *(_QWORD *)(v27 + 8);
    if (v8)
    {
      if (v8 == 1)
      {
        sub_194C8(*(_QWORD *)(v3+ OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__setSearchControllerPresentationOptionsForRecipient), *(_QWORD *)(v27 + 8));
        v30 = 1;
        sub_19418(v5, v6, v7, 1);
      }
      else
      {
        sub_194C8(*(_QWORD *)(v3+ OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__setSearchControllerPresentationOptionsForRecipient), *(_QWORD *)(v27 + 8));
        if (v7 | v6 | v5)
        {
          sub_19418(1, 0, 0, 2);
          v30 = 0;
        }
        else
        {
          sub_19418(0, 0, 0, 2);
          v30 = 65540;
        }
      }
    }
    else
    {
      sub_194C8(*(_QWORD *)(v3+ OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__setSearchControllerPresentationOptionsForRecipient), *(_QWORD *)(v27 + 8));
      sub_19418(v5, v6, v7, 0);
      v30 = 196608;
    }
    v28(v30, v11);
    sub_17920((uint64_t)v28, v29);
  }
  else
  {
    sub_19418(v5, v6, v7, v8);
  }
  return sub_8B2C();
}

uint64_t sub_8B2C()
{
  uint64_t v0;
  uint64_t v1;
  int64_t v2;
  uint64_t KeyPath;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  id v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t result;
  void (*v48)(uint64_t);
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[3];
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58[2];
  _QWORD *v59;
  _QWORD v60[3];

  v1 = v0;
  v2 = 0;
  KeyPath = swift_getKeyPath(&unk_33AD8);
  v4 = v0 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel___observationRegistrar;
  v60[0] = v1;
  v56 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
  v57 = v4;
  ObservationRegistrar.access<A, B>(_:keyPath:)(v60, KeyPath, v56);
  swift_release(KeyPath);
  swift_beginAccess(v1 + 104, v60, 0, 0);
  v54 = v1;
  v5 = *(_QWORD *)(v1 + 104);
  v59 = &_swiftEmptySetSingleton;
  v7 = v5 + 64;
  v6 = *(_QWORD *)(v5 + 64);
  v8 = *(_BYTE *)(v5 + 32);
  v55 = 1;
  v9 = 1 << v8;
  v10 = -1;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  v11 = v10 & v6;
  v12 = (unint64_t)(v9 + 63) >> 6;
  swift_bridgeObjectRetain_n(v5, 2);
  v53 = 0;
  while (v11)
  {
    v13 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    v14 = v13 | (v2 << 6);
LABEL_22:
    v18 = *(void **)(*(_QWORD *)(v5 + 48) + 8 * v14);
    v19 = *(_QWORD *)(v5 + 56) + 32 * v14;
    v21 = *(_QWORD *)v19;
    v20 = *(_QWORD *)(v19 + 8);
    v22 = *(_QWORD *)(v19 + 16);
    v23 = *(unsigned __int8 *)(v19 + 24);
    if (*(_BYTE *)(v19 + 24))
    {
      if (v23 == 1)
      {
        if ((v21 & 1) != 0)
        {
          swift_bridgeObjectRetain(*(_QWORD *)(v19 + 16));
        }
        else if (v22)
        {
          sub_18DEC(*(_QWORD *)v19, *(_QWORD *)(v19 + 8), *(_QWORD *)(v19 + 16), 1);
          sub_18DEC(v21, v20, v22, 1);
          v24 = v18;
          sub_142D0(v58, v20, v22);

          v25 = v21;
          v26 = v20;
          v27 = v22;
          v28 = 1;
          goto LABEL_29;
        }
LABEL_5:
        sub_18E20(v21, v20, v22, v23);
      }
      else
      {
        if (v22 | v20 | v21)
          goto LABEL_5;
        sub_18E20(0, 0, 0, 2);
        v55 = 0;
      }
    }
    else
    {
      if (!v20)
        goto LABEL_5;
      sub_18DEC(*(_QWORD *)v19, *(_QWORD *)(v19 + 8), *(_QWORD *)(v19 + 16), 0);
      sub_18DEC(v21, v20, v22, 0);
      v29 = v18;
      sub_142D0(v58, v21, v20);

      v25 = v21;
      v26 = v20;
      v27 = v22;
      v28 = 0;
LABEL_29:
      sub_18E20(v25, v26, v27, v28);
      swift_bridgeObjectRelease(v58[1]);
    }
  }
  v15 = v2 + 1;
  if (__OFADD__(v2, 1))
  {
    __break(1u);
LABEL_42:
    __break(1u);
    result = swift_release(v58[0]);
    __break(1u);
    return result;
  }
  if (v15 >= v12)
    goto LABEL_32;
  v16 = *(_QWORD *)(v7 + 8 * v15);
  ++v2;
  if (v16)
    goto LABEL_21;
  v2 = v15 + 1;
  if (v15 + 1 >= v12)
    goto LABEL_32;
  v16 = *(_QWORD *)(v7 + 8 * v2);
  if (v16)
    goto LABEL_21;
  v2 = v15 + 2;
  if (v15 + 2 >= v12)
    goto LABEL_32;
  v16 = *(_QWORD *)(v7 + 8 * v2);
  if (v16)
  {
LABEL_21:
    v11 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v2 << 6);
    goto LABEL_22;
  }
  v17 = v15 + 3;
  if (v17 < v12)
  {
    v16 = *(_QWORD *)(v7 + 8 * v17);
    if (!v16)
    {
      while (1)
      {
        v2 = v17 + 1;
        if (__OFADD__(v17, 1))
          goto LABEL_42;
        if (v2 >= v12)
          goto LABEL_32;
        v16 = *(_QWORD *)(v7 + 8 * v2);
        ++v17;
        if (v16)
          goto LABEL_21;
      }
    }
    v2 = v17;
    goto LABEL_21;
  }
LABEL_32:
  swift_release(v5);
  v30 = v59;
  if (v59[2])
  {
    v31 = swift_bridgeObjectRetain(v59);
    v32 = sub_14564(v31);
    swift_bridgeObjectRelease(v30);
    v58[0] = (uint64_t)v32;
    sub_1447C(v58);
    v33 = v54;
    swift_bridgeObjectRelease(v30);
    v34 = v58[0];
    v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_40FB0);
    v36 = sub_1A114(&qword_40FB8, &qword_40FB0, (uint64_t)&protocol conformance descriptor for [A]);
    v37 = BidirectionalCollection<>.joined(separator:)(10, 0xE100000000000000, v35, v36);
    v39 = v38;
    swift_release(v34);
  }
  else
  {
    swift_bridgeObjectRelease(v59);
    v37 = 0;
    v39 = 0;
    v33 = v54;
  }
  v40 = swift_getKeyPath(&unk_33A38);
  v58[0] = v33;
  ObservationRegistrar.access<A, B>(_:keyPath:)(v58, v40, v56);
  swift_release(v40);
  v41 = *(void (**)(uint64_t, uint64_t))(v33
                                                + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__setSearchControllerComposeFieldInfoText);
  if (v41)
  {
    v42 = *(_QWORD *)(v33
                    + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__setSearchControllerComposeFieldInfoText
                    + 8);
    swift_retain(v42);
    v41(v37, v39);
    sub_17920((uint64_t)v41, v42);
  }
  swift_bridgeObjectRelease(v39);
  v43 = *(_QWORD *)(v5 + 16);
  swift_bridgeObjectRelease(v5);
  v44 = swift_getKeyPath(&unk_33B00);
  __chkstk_darwin(v44);
  v51[2] = v33;
  v52 = (v43 != 0) & v55;
  v58[0] = v33;
  v45 = v56;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(v58, v44, sub_1943C, v51, (char *)&type metadata for () + 8, v56);
  swift_release(v44);
  v46 = swift_getKeyPath(&unk_33B28);
  v58[0] = v33;
  ObservationRegistrar.access<A, B>(_:keyPath:)(v58, v46, v45);
  result = swift_release(v46);
  v48 = *(void (**)(uint64_t))(v33
                                       + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__externalDidChangeRecipientsStatus);
  if (v48)
  {
    v49 = *(_QWORD *)(v33
                    + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__externalDidChangeRecipientsStatus
                    + 8);
    v50 = swift_retain(v49);
    v48(v50);
    return sub_17920((uint64_t)v48, v49);
  }
  return result;
}

_QWORD *ContactPickerViewModel.deinit()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v1 = v0[3];
  v2 = v0[6];
  swift_bridgeObjectRelease(v0[7]);
  swift_release(v2);
  swift_bridgeObjectRelease(v1);
  v3 = v0[9];
  v4 = v0[11];
  swift_bridgeObjectRelease(v0[12]);
  swift_release(v4);
  swift_release(v3);
  swift_bridgeObjectRelease(v0[13]);
  sub_1A198((uint64_t)v0 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__alert, &qword_40C78);
  swift_bridgeObjectRelease(*(_QWORD *)((char *)v0
                                      + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__reachabilityRequestsPerAddress));
  sub_17920(*(_QWORD *)((char *)v0 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__addSearchControllerRecipient), *(_QWORD *)((char *)v0 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__addSearchControllerRecipient + 8));
  sub_17920(*(_QWORD *)((char *)v0+ OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__setSearchControllerPresentationOptionsForRecipient), *(_QWORD *)((char *)v0+ OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__setSearchControllerPresentationOptionsForRecipient+ 8));
  sub_17920(*(_QWORD *)((char *)v0+ OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__setSearchControllerComposeFieldInfoText), *(_QWORD *)((char *)v0+ OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__setSearchControllerComposeFieldInfoText+ 8));
  sub_17920(*(_QWORD *)((char *)v0+ OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__setSearchControllerTintColorForAutocompleteRecipient), *(_QWORD *)((char *)v0+ OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__setSearchControllerTintColorForAutocompleteRecipient+ 8));
  sub_17920(*(_QWORD *)((char *)v0 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__externalDidChangeRecipientsStatus), *(_QWORD *)((char *)v0+ OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__externalDidChangeRecipientsStatus+ 8));
  v5 = (char *)v0 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel___observationRegistrar;
  v6 = type metadata accessor for ObservationRegistrar(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  return v0;
}

uint64_t ContactPickerViewModel.__deallocating_deinit()
{
  uint64_t v0;

  ContactPickerViewModel.deinit();
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t ContactPickerViewModel.Configuration.init(screenTitle:showNavBarCancelButton:actionControl:actionConfirmationSteps:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  *(_QWORD *)a7 = result;
  *(_QWORD *)(a7 + 8) = a2;
  *(_BYTE *)(a7 + 16) = a3;
  *(_QWORD *)(a7 + 24) = a4;
  *(_QWORD *)(a7 + 32) = a5;
  *(_QWORD *)(a7 + 40) = a6;
  return result;
}

uint64_t ContactPickerViewModel.ConfirmationStep.init(action:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t static ContactPickerViewModel.ConfirmationStep.denyMyOwnAccount(alertTitleMessage:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v6;

  v6 = swift_allocObject(&unk_3D298, 32, 7);
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  *a3 = &unk_40C88;
  a3[1] = v6;
  return swift_retain(a2);
}

uint64_t sub_91F8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v2[5] = a1;
  v2[6] = a2;
  v3 = type metadata accessor for Logger(0);
  v2[7] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[8] = v4;
  v5 = (*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[9] = swift_task_alloc(v5);
  v2[10] = swift_task_alloc(v5);
  return swift_task_switch(sub_9268, 0, 0);
}

uint64_t sub_9268()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v0 + 88) = v1;
  *(_QWORD *)(v0 + 96) = static MainActor.shared.getter(v1);
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_92D4, v2, v3);
}

uint64_t sub_92D4()
{
  uint64_t *v0;

  swift_release(v0[12]);
  if (qword_40BE0 != -1)
    swift_once(&qword_40BE0, sub_2C68);
  v0[13] = __swift_project_value_buffer(v0[7], (uint64_t)qword_40C18);
  return swift_task_switch(sub_934C, 0, 0);
}

uint64_t sub_934C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(v1 + 88);
  *(_QWORD *)(v1 + 112) = static MainActor.shared.getter(a1);
  v3 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  return swift_task_switch(sub_93AC, v3, v4);
}

uint64_t sub_93AC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);

  v1 = v0[13];
  v2 = v0[10];
  v3 = v0[7];
  v4 = v0[8];
  swift_release(v0[14]);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v0[15] = v5;
  v5(v2, v1, v3);
  return swift_task_switch(sub_9410, 0, 0);
}

uint64_t sub_9410()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
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
  unint64_t v19;
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
  uint64_t v34[2];

  v1 = Logger.logObject.getter();
  v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = *(_QWORD *)(v0 + 80);
    v4 = *(_QWORD *)(v0 + 56);
    v5 = *(_QWORD *)(v0 + 64);
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v34[0] = v7;
    *(_DWORD *)v6 = 136315138;
    *(_QWORD *)(v0 + 32) = sub_FD1C(0xD000000000000024, 0x8000000000038330, v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 32, v0 + 40, v6 + 4, v6 + 12);
    _os_log_impl(&dword_0, v1, v2, "ContactPickerViewModel: %s", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

    v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  }
  else
  {
    v3 = *(_QWORD *)(v0 + 80);
    v4 = *(_QWORD *)(v0 + 56);
    v9 = *(_QWORD *)(v0 + 64);

    v8 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
  }
  v8(v3, v4);
  *(_QWORD *)(v0 + 128) = v8;
  v10 = *(_QWORD *)(v0 + 48);
  v11 = swift_bridgeObjectRetain(v10);
  v12 = sub_113AC(v11, (uint64_t (*)(char *, unint64_t, uint64_t))sub_1189C);
  swift_bridgeObjectRelease(v10);
  if (*(_QWORD *)(v12 + 16))
  {
    v13 = sub_AE30(v12);
    swift_release(v12);
    v34[0] = v13;
    swift_bridgeObjectRetain(v13);
    sub_144E4(v34);
    swift_bridgeObjectRelease(v13);
    v18 = v34[0];
    v19 = sub_EB1C(v34[0]);
    v21 = v20;
    v23 = v22;
    v25 = v24;
    swift_release(v18);
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_40FF0);
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_40FF8);
    v28 = swift_allocObject(v26, ((*(unsigned __int8 *)(*(_QWORD *)(v27 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v27 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v27 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v27 - 8) + 80) | 7);
    *(_OWORD *)(v28 + 16) = xmmword_33770;
    *(_BYTE *)(v0 + 152) = 0;
    static AlertInfo.ActionInfo.okAction(withValue:)(v0 + 152, &type metadata for Bool);
    AlertInfo.init(title:message:actions:)(v19, v21, v23, v25, v28, &type metadata for Bool);
    v29 = *(_QWORD *)(v0 + 72);
    v30 = *(_QWORD *)(v0 + 80);
    v31 = *(_QWORD *)(v0 + 40);
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_40E08);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v31, 0, 1, v32);
    swift_task_dealloc(v30);
    swift_task_dealloc(v29);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v14 = *(_QWORD *)(v0 + 88);
    v15 = swift_release(v12);
    *(_QWORD *)(v0 + 136) = static MainActor.shared.getter(v15);
    v16 = dispatch thunk of Actor.unownedExecutor.getter(v14, &protocol witness table for MainActor);
    return swift_task_switch(sub_9768, v16, v17);
  }
}

uint64_t sub_9768()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 136));
  return swift_task_switch(sub_97A4, 0, 0);
}

uint64_t sub_97A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 88);
  *(_QWORD *)(v0 + 144) = static MainActor.shared.getter();
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_9804, v2, v3);
}

uint64_t sub_9804()
{
  _QWORD *v0;
  void (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = (void (*)(uint64_t, uint64_t, uint64_t))v0[15];
  v2 = v0[13];
  v3 = v0[9];
  v4 = v0[7];
  swift_release(v0[18]);
  v1(v3, v2, v4);
  return swift_task_switch(sub_1A284, 0, 0);
}

uint64_t sub_9868(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v2[5] = a1;
  v2[6] = a2;
  v3 = type metadata accessor for Logger(0);
  v2[7] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[8] = v4;
  v5 = (*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[9] = swift_task_alloc(v5);
  v2[10] = swift_task_alloc(v5);
  return swift_task_switch(sub_98D8, 0, 0);
}

uint64_t sub_98D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v0 + 88) = v1;
  *(_QWORD *)(v0 + 96) = static MainActor.shared.getter(v1);
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_9944, v2, v3);
}

uint64_t sub_9944()
{
  uint64_t *v0;

  swift_release(v0[12]);
  if (qword_40BE0 != -1)
    swift_once(&qword_40BE0, sub_2C68);
  v0[13] = __swift_project_value_buffer(v0[7], (uint64_t)qword_40C18);
  return swift_task_switch(sub_99BC, 0, 0);
}

uint64_t sub_99BC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(v1 + 88);
  *(_QWORD *)(v1 + 112) = static MainActor.shared.getter(a1);
  v3 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  return swift_task_switch(sub_9A1C, v3, v4);
}

uint64_t sub_9A1C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);

  v1 = v0[13];
  v2 = v0[10];
  v3 = v0[7];
  v4 = v0[8];
  swift_release(v0[14]);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v0[15] = v5;
  v5(v2, v1, v3);
  return swift_task_switch(sub_9A80, 0, 0);
}

uint64_t sub_9A80()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
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
  uint64_t v34[2];

  v1 = Logger.logObject.getter();
  v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = *(_QWORD *)(v0 + 80);
    v4 = *(_QWORD *)(v0 + 56);
    v5 = *(_QWORD *)(v0 + 64);
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v34[0] = v7;
    *(_DWORD *)v6 = 136315138;
    *(_QWORD *)(v0 + 32) = sub_FD1C(0xD000000000000024, 0x8000000000038330, v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 32, v0 + 40, v6 + 4, v6 + 12);
    _os_log_impl(&dword_0, v1, v2, "ContactPickerViewModel: %s", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

    v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  }
  else
  {
    v3 = *(_QWORD *)(v0 + 80);
    v4 = *(_QWORD *)(v0 + 56);
    v9 = *(_QWORD *)(v0 + 64);

    v8 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
  }
  v8(v3, v4);
  *(_QWORD *)(v0 + 128) = v8;
  v10 = *(_QWORD *)(v0 + 48);
  v11 = swift_bridgeObjectRetain(v10);
  v12 = sub_113AC(v11, (uint64_t (*)(char *, unint64_t, uint64_t))sub_1189C);
  swift_bridgeObjectRelease(v10);
  if (*(_QWORD *)(v12 + 16))
  {
    v13 = sub_AE30(v12);
    swift_release(v12);
    v34[0] = v13;
    swift_bridgeObjectRetain(v13);
    sub_144E4(v34);
    swift_bridgeObjectRelease(v13);
    v18 = v34[0];
    v19 = sub_2630C();
    v21 = v20;
    v23 = v22;
    v25 = v24;
    swift_release(v18);
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_40FF0);
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_40FF8);
    v28 = swift_allocObject(v26, ((*(unsigned __int8 *)(*(_QWORD *)(v27 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v27 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v27 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v27 - 8) + 80) | 7);
    *(_OWORD *)(v28 + 16) = xmmword_33770;
    *(_BYTE *)(v0 + 152) = 0;
    static AlertInfo.ActionInfo.okAction(withValue:)(v0 + 152, &type metadata for Bool);
    AlertInfo.init(title:message:actions:)(v19, v21, v23, v25, v28, &type metadata for Bool);
    v29 = *(_QWORD *)(v0 + 72);
    v30 = *(_QWORD *)(v0 + 80);
    v31 = *(_QWORD *)(v0 + 40);
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_40E08);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v31, 0, 1, v32);
    swift_task_dealloc(v30);
    swift_task_dealloc(v29);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v14 = *(_QWORD *)(v0 + 88);
    v15 = swift_release(v12);
    *(_QWORD *)(v0 + 136) = static MainActor.shared.getter(v15);
    v16 = dispatch thunk of Actor.unownedExecutor.getter(v14, &protocol witness table for MainActor);
    return swift_task_switch(sub_9DD4, v16, v17);
  }
}

uint64_t sub_9DD4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 136));
  return swift_task_switch(sub_9E10, 0, 0);
}

uint64_t sub_9E10(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(v1 + 88);
  *(_QWORD *)(v1 + 144) = static MainActor.shared.getter(a1);
  v3 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  return swift_task_switch(sub_9E70, v3, v4);
}

uint64_t sub_9E70()
{
  _QWORD *v0;
  void (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = (void (*)(uint64_t, uint64_t, uint64_t))v0[15];
  v2 = v0[13];
  v3 = v0[9];
  v4 = v0[7];
  swift_release(v0[18]);
  v1(v3, v2, v4);
  return swift_task_switch(sub_9ED4, 0, 0);
}

uint64_t sub_9ED4()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v1 = Logger.logObject.getter();
  v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = *(void (**)(uint64_t, uint64_t))(v0 + 128);
    v4 = *(_QWORD *)(v0 + 72);
    v5 = *(_QWORD *)(v0 + 56);
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v16 = v7;
    *(_DWORD *)v6 = 136315138;
    *(_QWORD *)(v0 + 24) = sub_FD1C(0xD000000000000024, 0x8000000000038330, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 24, v0 + 32, v6 + 4, v6 + 12);
    _os_log_impl(&dword_0, v1, v2, "ContactPickerViewModel: %s - No unreachable recipient", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

    v3(v4, v5);
  }
  else
  {
    v8 = *(void (**)(uint64_t, uint64_t))(v0 + 128);
    v9 = *(_QWORD *)(v0 + 72);
    v10 = *(_QWORD *)(v0 + 56);

    v8(v9, v10);
  }
  v11 = *(_QWORD *)(v0 + 72);
  v12 = *(_QWORD *)(v0 + 80);
  v13 = *(_QWORD *)(v0 + 40);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_40E08);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
  swift_task_dealloc(v12);
  swift_task_dealloc(v11);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_A090(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v2[5] = a1;
  v2[6] = a2;
  v3 = type metadata accessor for Logger(0);
  v2[7] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[8] = v4;
  v5 = (*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2[9] = swift_task_alloc(v5);
  v2[10] = swift_task_alloc(v5);
  return swift_task_switch(sub_A100, 0, 0);
}

uint64_t sub_A100()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v0 + 88) = v1;
  *(_QWORD *)(v0 + 96) = static MainActor.shared.getter(v1);
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_A16C, v2, v3);
}

uint64_t sub_A16C()
{
  uint64_t *v0;

  swift_release(v0[12]);
  if (qword_40BE0 != -1)
    swift_once(&qword_40BE0, sub_2C68);
  v0[13] = __swift_project_value_buffer(v0[7], (uint64_t)qword_40C18);
  return swift_task_switch(sub_A1E4, 0, 0);
}

uint64_t sub_A1E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(v1 + 88);
  *(_QWORD *)(v1 + 112) = static MainActor.shared.getter(a1);
  v3 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  return swift_task_switch(sub_A244, v3, v4);
}

uint64_t sub_A244()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);

  v1 = v0[13];
  v2 = v0[10];
  v3 = v0[7];
  v4 = v0[8];
  swift_release(v0[14]);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v0[15] = v5;
  v5(v2, v1, v3);
  return swift_task_switch(sub_A2A8, 0, 0);
}

uint64_t sub_A2A8()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
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
  uint64_t v34[2];

  v1 = Logger.logObject.getter();
  v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = *(_QWORD *)(v0 + 80);
    v4 = *(_QWORD *)(v0 + 56);
    v5 = *(_QWORD *)(v0 + 64);
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v34[0] = v7;
    *(_DWORD *)v6 = 136315138;
    *(_QWORD *)(v0 + 32) = sub_FD1C(0xD000000000000024, 0x8000000000038330, v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 32, v0 + 40, v6 + 4, v6 + 12);
    _os_log_impl(&dword_0, v1, v2, "ContactPickerViewModel: %s", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

    v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  }
  else
  {
    v3 = *(_QWORD *)(v0 + 80);
    v4 = *(_QWORD *)(v0 + 56);
    v9 = *(_QWORD *)(v0 + 64);

    v8 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
  }
  v8(v3, v4);
  *(_QWORD *)(v0 + 128) = v8;
  v10 = *(_QWORD *)(v0 + 48);
  v11 = swift_bridgeObjectRetain(v10);
  v12 = sub_113AC(v11, (uint64_t (*)(char *, unint64_t, uint64_t))sub_1189C);
  swift_bridgeObjectRelease(v10);
  if (*(_QWORD *)(v12 + 16))
  {
    v13 = sub_AE30(v12);
    swift_release(v12);
    v34[0] = v13;
    swift_bridgeObjectRetain(v13);
    sub_144E4(v34);
    swift_bridgeObjectRelease(v13);
    v18 = v34[0];
    v19 = sub_27E40();
    v21 = v20;
    v23 = v22;
    v25 = v24;
    swift_release(v18);
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_40FF0);
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_40FF8);
    v28 = swift_allocObject(v26, ((*(unsigned __int8 *)(*(_QWORD *)(v27 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v27 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v27 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v27 - 8) + 80) | 7);
    *(_OWORD *)(v28 + 16) = xmmword_33770;
    *(_BYTE *)(v0 + 152) = 0;
    static AlertInfo.ActionInfo.okAction(withValue:)(v0 + 152, &type metadata for Bool);
    AlertInfo.init(title:message:actions:)(v19, v21, v23, v25, v28, &type metadata for Bool);
    v29 = *(_QWORD *)(v0 + 72);
    v30 = *(_QWORD *)(v0 + 80);
    v31 = *(_QWORD *)(v0 + 40);
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_40E08);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v31, 0, 1, v32);
    swift_task_dealloc(v30);
    swift_task_dealloc(v29);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v14 = *(_QWORD *)(v0 + 88);
    v15 = swift_release(v12);
    *(_QWORD *)(v0 + 136) = static MainActor.shared.getter(v15);
    v16 = dispatch thunk of Actor.unownedExecutor.getter(v14, &protocol witness table for MainActor);
    return swift_task_switch(sub_9768, v16, v17);
  }
}

uint64_t sub_A5FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4[7] = a3;
  v4[8] = a4;
  v4[5] = a1;
  v4[6] = a2;
  v5 = type metadata accessor for Logger(0);
  v4[9] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[10] = v6;
  v7 = (*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4[11] = swift_task_alloc(v7);
  v4[12] = swift_task_alloc(v7);
  return swift_task_switch(sub_A670, 0, 0);
}

uint64_t sub_A670()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v0 + 104) = v1;
  *(_QWORD *)(v0 + 112) = static MainActor.shared.getter(v1);
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_A6DC, v2, v3);
}

uint64_t sub_A6DC()
{
  uint64_t *v0;

  swift_release(v0[14]);
  if (qword_40BE0 != -1)
    swift_once(&qword_40BE0, sub_2C68);
  v0[15] = __swift_project_value_buffer(v0[9], (uint64_t)qword_40C18);
  return swift_task_switch(sub_A754, 0, 0);
}

uint64_t sub_A754(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(v1 + 104);
  *(_QWORD *)(v1 + 128) = static MainActor.shared.getter(a1);
  v3 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  return swift_task_switch(sub_A7B4, v3, v4);
}

uint64_t sub_A7B4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);

  v1 = v0[15];
  v2 = v0[12];
  v3 = v0[9];
  v4 = v0[10];
  swift_release(v0[16]);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v0[17] = v5;
  v5(v2, v1, v3);
  return swift_task_switch(sub_A818, 0, 0);
}

uint64_t sub_A818()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
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
  uint64_t v35[2];

  v1 = Logger.logObject.getter();
  v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = *(_QWORD *)(v0 + 96);
    v4 = *(_QWORD *)(v0 + 72);
    v5 = *(_QWORD *)(v0 + 80);
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v35[0] = v7;
    *(_DWORD *)v6 = 136315138;
    *(_QWORD *)(v0 + 32) = sub_FD1C(0xD000000000000024, 0x8000000000038330, v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 32, v0 + 40, v6 + 4, v6 + 12);
    _os_log_impl(&dword_0, v1, v2, "ContactPickerViewModel: %s", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

    v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  }
  else
  {
    v3 = *(_QWORD *)(v0 + 96);
    v4 = *(_QWORD *)(v0 + 72);
    v9 = *(_QWORD *)(v0 + 80);

    v8 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
  }
  v8(v3, v4);
  *(_QWORD *)(v0 + 144) = v8;
  v10 = *(_QWORD *)(v0 + 48);
  v11 = swift_bridgeObjectRetain(v10);
  v12 = sub_113AC(v11, (uint64_t (*)(char *, unint64_t, uint64_t))sub_1189C);
  swift_bridgeObjectRelease(v10);
  if (*(_QWORD *)(v12 + 16))
  {
    v13 = sub_AE30(v12);
    swift_release(v12);
    v35[0] = v13;
    swift_bridgeObjectRetain(v13);
    sub_144E4(v35);
    v18 = *(uint64_t (**)(uint64_t))(v0 + 56);
    swift_bridgeObjectRelease(v13);
    v19 = v35[0];
    v20 = v18(v35[0]);
    v22 = v21;
    v24 = v23;
    v26 = v25;
    swift_release(v19);
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_40FF0);
    v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_40FF8);
    v29 = swift_allocObject(v27, ((*(unsigned __int8 *)(*(_QWORD *)(v28 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v28 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v28 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v28 - 8) + 80) | 7);
    *(_OWORD *)(v29 + 16) = xmmword_33770;
    *(_BYTE *)(v0 + 168) = 0;
    static AlertInfo.ActionInfo.okAction(withValue:)(v0 + 168, &type metadata for Bool);
    AlertInfo.init(title:message:actions:)(v20, v22, v24, v26, v29, &type metadata for Bool);
    v30 = *(_QWORD *)(v0 + 88);
    v31 = *(_QWORD *)(v0 + 96);
    v32 = *(_QWORD *)(v0 + 40);
    v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_40E08);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v32, 0, 1, v33);
    swift_task_dealloc(v31);
    swift_task_dealloc(v30);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v14 = *(_QWORD *)(v0 + 104);
    v15 = swift_release(v12);
    *(_QWORD *)(v0 + 152) = static MainActor.shared.getter(v15);
    v16 = dispatch thunk of Actor.unownedExecutor.getter(v14, &protocol witness table for MainActor);
    return swift_task_switch(sub_AB74, v16, v17);
  }
}

uint64_t sub_AB74()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 152));
  return swift_task_switch(sub_ABB0, 0, 0);
}

uint64_t sub_ABB0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(v1 + 104);
  *(_QWORD *)(v1 + 160) = static MainActor.shared.getter(a1);
  v3 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  return swift_task_switch(sub_AC10, v3, v4);
}

uint64_t sub_AC10()
{
  _QWORD *v0;
  void (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = (void (*)(uint64_t, uint64_t, uint64_t))v0[17];
  v2 = v0[15];
  v3 = v0[11];
  v4 = v0[9];
  swift_release(v0[20]);
  v1(v3, v2, v4);
  return swift_task_switch(sub_AC74, 0, 0);
}

uint64_t sub_AC74()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v1 = Logger.logObject.getter();
  v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = *(void (**)(uint64_t, uint64_t))(v0 + 144);
    v4 = *(_QWORD *)(v0 + 88);
    v5 = *(_QWORD *)(v0 + 72);
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v16 = v7;
    *(_DWORD *)v6 = 136315138;
    *(_QWORD *)(v0 + 24) = sub_FD1C(0xD000000000000024, 0x8000000000038330, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 24, v0 + 32, v6 + 4, v6 + 12);
    _os_log_impl(&dword_0, v1, v2, "ContactPickerViewModel: %s - No unreachable recipient", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

    v3(v4, v5);
  }
  else
  {
    v8 = *(void (**)(uint64_t, uint64_t))(v0 + 144);
    v9 = *(_QWORD *)(v0 + 88);
    v10 = *(_QWORD *)(v0 + 72);

    v8(v9, v10);
  }
  v11 = *(_QWORD *)(v0 + 88);
  v12 = *(_QWORD *)(v0 + 96);
  v13 = *(_QWORD *)(v0 + 40);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_40E08);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
  swift_task_dealloc(v12);
  swift_task_dealloc(v11);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_AE30(uint64_t a1)
{
  uint64_t v1;
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
  char *v13;
  int64_t v14;
  _QWORD *v15;
  uint64_t result;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  void (*v27)(char *, unint64_t, uint64_t);
  void (*v28)(char *, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  void (*v41)(char *, uint64_t, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  void (*v48)(char *, char *, uint64_t);
  char *v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  int64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  char *v64;
  char *v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  void (*v73)(char *, uint64_t, uint64_t);
  uint64_t v74;
  int64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD *v79;

  v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_41010);
  v3 = __chkstk_darwin(v68);
  v67 = (char *)&v58 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __chkstk_darwin(v3);
  v66 = (char *)&v58 - v6;
  v7 = __chkstk_darwin(v5);
  v77 = (uint64_t)&v58 - v8;
  v9 = __chkstk_darwin(v7);
  v65 = (char *)&v58 - v10;
  __chkstk_darwin(v9);
  v64 = (char *)&v58 - v11;
  v76 = type metadata accessor for Handle(0);
  v78 = *(_QWORD *)(v76 - 8);
  __chkstk_darwin(v76);
  v13 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(a1 + 16);
  v15 = &_swiftEmptyArrayStorage;
  if (!v14)
    return (uint64_t)v15;
  v58 = v1;
  v79 = &_swiftEmptyArrayStorage;
  sub_16E68(0, v14, 0);
  result = sub_1740C(a1);
  v18 = result;
  v19 = 0;
  v20 = a1 + 64;
  v69 = a1 + 80;
  v62 = v13;
  v63 = a1;
  v59 = v14;
  v60 = v17;
  v61 = a1 + 64;
  v21 = v76;
  while ((v18 & 0x8000000000000000) == 0 && (uint64_t)v18 < 1 << *(_BYTE *)(a1 + 32))
  {
    if ((*(_QWORD *)(v20 + 8 * (v18 >> 6)) & (1 << v18)) == 0)
      goto LABEL_25;
    if (*(_DWORD *)(a1 + 36) != (_DWORD)v17)
      goto LABEL_26;
    v71 = 1 << v18;
    v72 = v18 >> 6;
    v70 = v19;
    v23 = v68;
    v24 = (uint64_t)v64;
    v25 = &v64[*(int *)(v68 + 48)];
    v26 = *(_QWORD *)(a1 + 48);
    v74 = *(_QWORD *)(v78 + 72);
    v27 = *(void (**)(char *, unint64_t, uint64_t))(v78 + 16);
    v27(v64, v26 + v74 * v18, v21);
    v28 = (void (*)(char *, uint64_t, uint64_t))v27;
    v73 = (void (*)(char *, uint64_t, uint64_t))v27;
    v29 = *(_QWORD *)(a1 + 56);
    v75 = v18;
    v30 = v29 + 32 * v18;
    v31 = *(_QWORD *)v30;
    v32 = *(_QWORD *)(v30 + 8);
    v33 = *(_QWORD *)(v30 + 16);
    v34 = *(_BYTE *)(v30 + 24);
    *(_QWORD *)v25 = *(_QWORD *)v30;
    *((_QWORD *)v25 + 1) = v32;
    *((_QWORD *)v25 + 2) = v33;
    v25[24] = v34;
    v35 = v65;
    v28(v65, v24, v21);
    v36 = &v35[*(int *)(v23 + 48)];
    *(_QWORD *)v36 = v31;
    *((_QWORD *)v36 + 1) = v32;
    *((_QWORD *)v36 + 2) = v33;
    v36[24] = v34;
    v37 = (uint64_t)v35;
    v38 = v77;
    sub_1A154(v37, v77, &qword_41010);
    sub_18DEC(v31, v32, v33, v34);
    sub_18DEC(v31, v32, v33, v34);
    sub_1A198(v24, &qword_41010);
    v39 = v38 + *(int *)(v23 + 48);
    v40 = v66;
    v41 = v73;
    v73(v66, v38, v21);
    v42 = *(_QWORD *)v39;
    v43 = *(_QWORD *)(v39 + 8);
    v44 = *(_QWORD *)(v39 + 16);
    v45 = (uint64_t)v67;
    v46 = &v67[*(int *)(v23 + 48)];
    LOBYTE(v39) = *(_BYTE *)(v39 + 24);
    v47 = v40;
    v48 = *(void (**)(char *, char *, uint64_t))(v78 + 32);
    v48(v67, v47, v21);
    *(_QWORD *)v46 = v42;
    *((_QWORD *)v46 + 1) = v43;
    *((_QWORD *)v46 + 2) = v44;
    v46[24] = v39;
    v49 = v62;
    v41(v62, v45, v21);
    sub_18DEC(v42, v43, v44, v39);
    sub_1A198(v45, &qword_41010);
    sub_1A198(v77, &qword_41010);
    v15 = v79;
    if ((swift_isUniquelyReferenced_nonNull_native(v79) & 1) == 0)
    {
      sub_16E68(0, v15[2] + 1, 1);
      v15 = v79;
    }
    v51 = v15[2];
    v50 = v15[3];
    a1 = v63;
    if (v51 >= v50 >> 1)
    {
      sub_16E68(v50 > 1, v51 + 1, 1);
      v15 = v79;
    }
    v15[2] = v51 + 1;
    result = ((uint64_t (*)(char *, char *, uint64_t))v48)((char *)v15+ ((*(unsigned __int8 *)(v78 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v78 + 80))+ v51 * v74, v49, v76);
    v79 = v15;
    v18 = 1 << *(_BYTE *)(a1 + 32);
    if (v75 >= (uint64_t)v18)
      goto LABEL_27;
    v20 = v61;
    v52 = v72;
    v53 = *(_QWORD *)(v61 + 8 * v72);
    if ((v53 & v71) == 0)
      goto LABEL_28;
    LODWORD(v17) = v60;
    if (*(_DWORD *)(a1 + 36) != (_DWORD)v60)
      goto LABEL_29;
    v54 = v53 & (-2 << (v75 & 0x3F));
    if (v54)
    {
      v18 = __clz(__rbit64(v54)) | v75 & 0xFFFFFFFFFFFFFFC0;
      v22 = v59;
    }
    else
    {
      v55 = v72 + 1;
      v56 = (v18 + 63) >> 6;
      v22 = v59;
      if (v72 + 1 < v56)
      {
        v57 = *(_QWORD *)(v61 + 8 * v55);
        if (v57)
        {
LABEL_22:
          v18 = __clz(__rbit64(v57)) + (v55 << 6);
        }
        else
        {
          while (v56 - 2 != v52)
          {
            v57 = *(_QWORD *)(v69 + 8 * v52++);
            if (v57)
            {
              v55 = v52 + 1;
              goto LABEL_22;
            }
          }
        }
      }
    }
    v19 = v70 + 1;
    if (v70 + 1 == v22)
      return (uint64_t)v15;
  }
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_B308(uint64_t a1)
{
  uint64_t v1;
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
  char *v14;
  int64_t v15;
  _QWORD *v16;
  uint64_t result;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, unint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char v37;
  uint64_t v38;
  void (*v39)(char *, char *, uint64_t);
  uint64_t v40;
  char *v41;
  char *v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  _QWORD v50[2];
  int64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;

  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_410F0);
  v3 = __chkstk_darwin(v61);
  v60 = (char *)v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __chkstk_darwin(v3);
  v59 = (char *)v50 - v6;
  v7 = __chkstk_darwin(v5);
  v58 = (uint64_t)v50 - v8;
  v9 = __chkstk_darwin(v7);
  v57 = (char *)v50 - v10;
  __chkstk_darwin(v9);
  v56 = (char *)v50 - v11;
  v12 = type metadata accessor for Handle(0);
  v67 = *(_QWORD *)(v12 - 8);
  v68 = v12;
  __chkstk_darwin(v12);
  v14 = (char *)v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(_QWORD *)(a1 + 16);
  v16 = _swiftEmptyArrayStorage;
  if (!v15)
    return (uint64_t)v16;
  v50[1] = v1;
  v69 = _swiftEmptyArrayStorage;
  sub_16E68(0, v15, 0);
  result = sub_1740C(a1);
  v19 = result;
  v20 = 0;
  v21 = a1 + 64;
  v62 = a1 + 80;
  v54 = v14;
  v55 = a1;
  v51 = v15;
  v52 = v18;
  v53 = a1 + 64;
  v22 = v68;
  while ((v19 & 0x8000000000000000) == 0 && (uint64_t)v19 < 1 << *(_BYTE *)(a1 + 32))
  {
    v24 = v19 >> 6;
    if ((*(_QWORD *)(v21 + 8 * (v19 >> 6)) & (1 << v19)) == 0)
      goto LABEL_25;
    if (*(_DWORD *)(a1 + 36) != (_DWORD)v18)
      goto LABEL_26;
    v63 = v20;
    v64 = 1 << v19;
    v25 = v61;
    v26 = *(int *)(v61 + 48);
    v27 = *(_QWORD *)(a1 + 48);
    v28 = v67;
    v65 = *(_QWORD *)(v67 + 72);
    v29 = *(void (**)(char *, unint64_t, uint64_t))(v67 + 16);
    v30 = (uint64_t)v56;
    v29(v56, v27 + v65 * v19, v22);
    v31 = *(_QWORD *)(a1 + 56);
    v66 = v19;
    v32 = *(_BYTE *)(v31 + v19);
    *(_BYTE *)(v30 + v26) = v32;
    v33 = (uint64_t)v57;
    v29(v57, v30, v22);
    *(_BYTE *)(v33 + *(int *)(v25 + 48)) = v32;
    v34 = v58;
    sub_1A154(v33, v58, &qword_410F0);
    sub_1A198(v30, &qword_410F0);
    v35 = *(int *)(v25 + 48);
    v36 = v59;
    v29(v59, v34, v22);
    v37 = *(_BYTE *)(v34 + v35);
    v36[v35] = v37;
    v38 = *(int *)(v25 + 48);
    v39 = *(void (**)(char *, char *, uint64_t))(v28 + 32);
    v40 = (uint64_t)v60;
    v41 = v36;
    v42 = v54;
    v39(v60, v41, v22);
    *(_BYTE *)(v40 + v38) = v37;
    v29(v42, v40, v22);
    sub_1A198(v40, &qword_410F0);
    sub_1A198(v34, &qword_410F0);
    v16 = v69;
    if ((swift_isUniquelyReferenced_nonNull_native(v69) & 1) == 0)
    {
      sub_16E68(0, v16[2] + 1, 1);
      v16 = v69;
    }
    v44 = v16[2];
    v43 = v16[3];
    if (v44 >= v43 >> 1)
    {
      sub_16E68(v43 > 1, v44 + 1, 1);
      v16 = v69;
    }
    v16[2] = v44 + 1;
    result = ((uint64_t (*)(char *, char *, uint64_t))v39)((char *)v16+ ((*(unsigned __int8 *)(v67 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v67 + 80))+ v44 * v65, v42, v68);
    v69 = v16;
    a1 = v55;
    v19 = 1 << *(_BYTE *)(v55 + 32);
    if (v66 >= (uint64_t)v19)
      goto LABEL_27;
    v21 = v53;
    v45 = *(_QWORD *)(v53 + 8 * v24);
    if ((v45 & v64) == 0)
      goto LABEL_28;
    LODWORD(v18) = v52;
    if (*(_DWORD *)(v55 + 36) != (_DWORD)v52)
      goto LABEL_29;
    v46 = v45 & (-2 << (v66 & 0x3F));
    if (v46)
    {
      v19 = __clz(__rbit64(v46)) | v66 & 0xFFFFFFFFFFFFFFC0;
      v23 = v51;
    }
    else
    {
      v47 = v24 + 1;
      v48 = (v19 + 63) >> 6;
      v23 = v51;
      if (v24 + 1 < v48)
      {
        v49 = *(_QWORD *)(v53 + 8 * v47);
        if (v49)
        {
LABEL_22:
          v19 = __clz(__rbit64(v49)) + (v47 << 6);
        }
        else
        {
          while (v48 - 2 != v24)
          {
            v49 = *(_QWORD *)(v62 + 8 * v24++);
            if (v49)
            {
              v47 = v24 + 1;
              goto LABEL_22;
            }
          }
        }
      }
    }
    v20 = v63 + 1;
    if (v63 + 1 == v23)
      return (uint64_t)v16;
  }
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

uint64_t static ContactPickerViewModel.ConfirmationStep.reachabilityRequirement(requires:alertTitleMessage:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v8;

  v8 = swift_allocObject(&unk_3D2C0, 40, 7);
  *(_BYTE *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  *(_QWORD *)(v8 + 32) = a3;
  *a4 = &unk_40C98;
  a4[1] = v8;
  return swift_retain(a3);
}

uint64_t sub_B7A8(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  *(_QWORD *)(v5 + 56) = a4;
  *(_QWORD *)(v5 + 64) = a5;
  *(_BYTE *)(v5 + 169) = a3;
  *(_QWORD *)(v5 + 40) = a1;
  *(_QWORD *)(v5 + 48) = a2;
  v6 = type metadata accessor for Logger(0);
  *(_QWORD *)(v5 + 72) = v6;
  v7 = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v5 + 80) = v7;
  v8 = (*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  *(_QWORD *)(v5 + 88) = swift_task_alloc(v8);
  *(_QWORD *)(v5 + 96) = swift_task_alloc(v8);
  return swift_task_switch(sub_B820, 0, 0);
}

uint64_t sub_B820()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v0 + 104) = v1;
  *(_QWORD *)(v0 + 112) = static MainActor.shared.getter(v1);
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_B88C, v2, v3);
}

uint64_t sub_B88C()
{
  uint64_t *v0;

  swift_release(v0[14]);
  if (qword_40BE0 != -1)
    swift_once(&qword_40BE0, sub_2C68);
  v0[15] = __swift_project_value_buffer(v0[9], (uint64_t)qword_40C18);
  return swift_task_switch(sub_B904, 0, 0);
}

uint64_t sub_B904(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(v1 + 104);
  *(_QWORD *)(v1 + 128) = static MainActor.shared.getter(a1);
  v3 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  return swift_task_switch(sub_B964, v3, v4);
}

uint64_t sub_B964()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);

  v1 = v0[15];
  v2 = v0[12];
  v3 = v0[9];
  v4 = v0[10];
  swift_release(v0[16]);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v0[17] = v5;
  v5(v2, v1, v3);
  return swift_task_switch(sub_B9C8, 0, 0);
}

uint64_t sub_B9C8()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
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
  uint64_t v40[2];

  v1 = Logger.logObject.getter();
  v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = *(_QWORD *)(v0 + 96);
    v4 = *(_QWORD *)(v0 + 72);
    v5 = *(_QWORD *)(v0 + 80);
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v40[0] = v7;
    *(_DWORD *)v6 = 136315138;
    *(_QWORD *)(v0 + 32) = sub_FD1C(0xD000000000000034, 0x8000000000038540, v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 32, v0 + 40, v6 + 4, v6 + 12);
    _os_log_impl(&dword_0, v1, v2, "ContactPickerViewModel: %s", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

    v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  }
  else
  {
    v3 = *(_QWORD *)(v0 + 96);
    v4 = *(_QWORD *)(v0 + 72);
    v9 = *(_QWORD *)(v0 + 80);

    v8 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
  }
  v8(v3, v4);
  *(_QWORD *)(v0 + 144) = v8;
  v10 = *(_QWORD *)(v0 + 48);
  v11 = swift_bridgeObjectRetain(v10);
  v12 = sub_113AC(v11, (uint64_t (*)(char *, unint64_t, uint64_t))sub_11CEC);
  swift_bridgeObjectRelease(v10);
  if (*(_QWORD *)(v12 + 16))
  {
    v13 = *(unsigned __int8 *)(v0 + 169);
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_40FF0);
    v15 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_40FF8) - 8);
    v16 = *(_QWORD *)(v15 + 72);
    v17 = *(unsigned __int8 *)(v15 + 80);
    v18 = (v17 + 32) & ~v17;
    if (v13 == 1)
    {
      v19 = swift_allocObject(v14, v18 + v16, v17 | 7);
      *(_OWORD *)(v19 + 16) = xmmword_33770;
      *(_BYTE *)(v0 + 168) = 0;
      static AlertInfo.ActionInfo.okAction(withValue:)(v0 + 168, &type metadata for Bool);
    }
    else
    {
      v19 = swift_allocObject(v14, v18 + 2 * v16, v17 | 7);
      *(_OWORD *)(v19 + 16) = xmmword_33780;
      v25 = static AlertInfo.ActionInfo<A>.continueAction.getter();
      static AlertInfo.ActionInfo<A>.cancelAction.getter(v25);
    }
    v26 = sub_AE30(v12);
    swift_release(v12);
    v40[0] = v26;
    swift_bridgeObjectRetain(v26);
    sub_144E4(v40);
    v27 = *(uint64_t (**)(uint64_t))(v0 + 56);
    swift_bridgeObjectRelease(v26);
    v28 = v40[0];
    v29 = v27(v40[0]);
    v31 = v30;
    v33 = v32;
    v35 = v34;
    swift_release(v28);
    AlertInfo.init(title:message:actions:)(v29, v31, v33, v35, v19, &type metadata for Bool);
    v36 = *(_QWORD *)(v0 + 88);
    v37 = *(_QWORD *)(v0 + 96);
    v38 = *(_QWORD *)(v0 + 40);
    v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_40E08);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v38, 0, 1, v39);
    swift_task_dealloc(v37);
    swift_task_dealloc(v36);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v20 = *(_QWORD *)(v0 + 104);
    v21 = swift_release(v12);
    *(_QWORD *)(v0 + 152) = static MainActor.shared.getter(v21);
    v22 = dispatch thunk of Actor.unownedExecutor.getter(v20, &protocol witness table for MainActor);
    return swift_task_switch(sub_BD70, v22, v23);
  }
}

uint64_t sub_BD70()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 152));
  return swift_task_switch(sub_BDAC, 0, 0);
}

uint64_t sub_BDAC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(v1 + 104);
  *(_QWORD *)(v1 + 160) = static MainActor.shared.getter(a1);
  v3 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  return swift_task_switch(sub_BE0C, v3, v4);
}

uint64_t sub_BE0C()
{
  _QWORD *v0;
  void (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = (void (*)(uint64_t, uint64_t, uint64_t))v0[17];
  v2 = v0[15];
  v3 = v0[11];
  v4 = v0[9];
  swift_release(v0[20]);
  v1(v3, v2, v4);
  return swift_task_switch(sub_BE70, 0, 0);
}

uint64_t sub_BE70()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v1 = Logger.logObject.getter();
  v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = *(void (**)(uint64_t, uint64_t))(v0 + 144);
    v4 = *(_QWORD *)(v0 + 88);
    v5 = *(_QWORD *)(v0 + 72);
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v16 = v7;
    *(_DWORD *)v6 = 136315138;
    *(_QWORD *)(v0 + 24) = sub_FD1C(0xD000000000000034, 0x8000000000038540, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 24, v0 + 32, v6 + 4, v6 + 12);
    _os_log_impl(&dword_0, v1, v2, "ContactPickerViewModel: %s - No unreachable recipient", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

    v3(v4, v5);
  }
  else
  {
    v8 = *(void (**)(uint64_t, uint64_t))(v0 + 144);
    v9 = *(_QWORD *)(v0 + 88);
    v10 = *(_QWORD *)(v0 + 72);

    v8(v9, v10);
  }
  v11 = *(_QWORD *)(v0 + 88);
  v12 = *(_QWORD *)(v0 + 96);
  v13 = *(_QWORD *)(v0 + 40);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_40E08);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
  swift_task_dealloc(v12);
  swift_task_dealloc(v11);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t static ContactPickerViewModel.ConfirmationStep.capabilityRequirement(isCapabilityEnabled:notCapableAlertTitleMessage:genericErrorAlertTitleMessage:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  _QWORD *v14;

  v14 = (_QWORD *)swift_allocObject(&unk_3D2E8, 64, 7);
  v14[2] = a1;
  v14[3] = a2;
  v14[4] = a3;
  v14[5] = a4;
  v14[6] = a5;
  v14[7] = a6;
  *a7 = &unk_40CA8;
  a7[1] = v14;
  swift_retain(a2);
  swift_retain(a4);
  return swift_retain(a6);
}

uint64_t sub_C0B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v8[14] = a7;
  v8[15] = a8;
  v8[12] = a5;
  v8[13] = a6;
  v8[10] = a3;
  v8[11] = a4;
  v8[8] = a1;
  v8[9] = a2;
  v9 = type metadata accessor for Logger(0);
  v8[16] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v8[17] = v10;
  v11 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v8[18] = swift_task_alloc(v11);
  v8[19] = swift_task_alloc(v11);
  v8[20] = swift_task_alloc(v11);
  return swift_task_switch(sub_C140, 0, 0);
}

uint64_t sub_C140()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v0 + 168) = v1;
  *(_QWORD *)(v0 + 176) = static MainActor.shared.getter(v1);
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_C1AC, v2, v3);
}

uint64_t sub_C1AC()
{
  uint64_t *v0;

  swift_release(v0[22]);
  if (qword_40BE0 != -1)
    swift_once(&qword_40BE0, sub_2C68);
  v0[23] = __swift_project_value_buffer(v0[16], (uint64_t)qword_40C18);
  return swift_task_switch(sub_C224, 0, 0);
}

uint64_t sub_C224(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(v1 + 168);
  *(_QWORD *)(v1 + 192) = static MainActor.shared.getter(a1);
  v3 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  return swift_task_switch(sub_C284, v3, v4);
}

uint64_t sub_C284()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);

  v1 = v0[23];
  v2 = v0[20];
  v3 = v0[16];
  v4 = v0[17];
  swift_release(v0[24]);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v0[25] = v5;
  v5(v2, v1, v3);
  return swift_task_switch(sub_C2E8, 0, 0);
}

uint64_t sub_C2E8(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v17;

  v2 = Logger.logObject.getter(a1);
  v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = *(_QWORD *)(v1 + 160);
    v5 = *(_QWORD *)(v1 + 128);
    v6 = *(_QWORD *)(v1 + 136);
    v7 = (uint8_t *)swift_slowAlloc(12, -1);
    v8 = swift_slowAlloc(32, -1);
    v17 = v8;
    *(_DWORD *)v7 = 136315138;
    *(_QWORD *)(v1 + 24) = sub_FD1C(0xD000000000000065, 0x80000000000384D0, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 24, v1 + 32, v7 + 4, v7 + 12);
    _os_log_impl(&dword_0, v2, v3, "ContactPickerViewModel: %s", v7, 0xCu);
    swift_arrayDestroy(v8, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1, -1);
    swift_slowDealloc(v7, -1, -1);

    v9 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  }
  else
  {
    v4 = *(_QWORD *)(v1 + 160);
    v5 = *(_QWORD *)(v1 + 128);
    v10 = *(_QWORD *)(v1 + 136);

    v9 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
  }
  v9(v4, v5);
  *(_QWORD *)(v1 + 208) = v9;
  v11 = *(_QWORD *)(v1 + 88);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_410C8);
  v13 = swift_task_alloc(48);
  *(_QWORD *)(v1 + 216) = v13;
  *(_OWORD *)(v13 + 16) = *(_OWORD *)(v1 + 72);
  *(_QWORD *)(v13 + 32) = v11;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_410E0);
  v15 = (_QWORD *)swift_task_alloc(async function pointer to withThrowingTaskGroup<A, B>(of:returning:isolation:body:)[1]);
  *(_QWORD *)(v1 + 224) = v15;
  *v15 = v1;
  v15[1] = sub_C4EC;
  return withThrowingTaskGroup<A, B>(of:returning:isolation:body:)(v1 + 16, v12, v14, 0, 0, &unk_410D8, v13, v12);
}

uint64_t sub_C4EC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 224);
  *(_QWORD *)(*v1 + 232) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    v4 = sub_CA5C;
  }
  else
  {
    swift_task_dealloc(*(_QWORD *)(v2 + 216));
    v4 = sub_C558;
  }
  return swift_task_switch(v4, 0, 0);
}

uint64_t sub_C558()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
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

  v1 = *(_QWORD *)(v0 + 232);
  v2 = *(_QWORD *)(v0 + 16);
  v3 = sub_113AC(v2, (uint64_t (*)(char *, unint64_t, uint64_t))sub_1236C);
  swift_bridgeObjectRelease(v2);
  if (*(_QWORD *)(v3 + 16))
  {
    v4 = sub_B308(v3);
    swift_release(v3);
    v27 = v4;
    swift_bridgeObjectRetain(v4);
    sub_144E4(&v27);
    if (v1)
    {
      return swift_release(v27);
    }
    else
    {
      v10 = *(uint64_t (**)(uint64_t))(v0 + 96);
      swift_bridgeObjectRelease(v4);
      v11 = v27;
      v12 = v10(v27);
      v14 = v13;
      v16 = v15;
      v18 = v17;
      swift_release(v11);
      v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_40FF0);
      v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_40FF8);
      v21 = swift_allocObject(v19, ((*(unsigned __int8 *)(*(_QWORD *)(v20 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v20 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v20 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v20 - 8) + 80) | 7);
      *(_OWORD *)(v21 + 16) = xmmword_33770;
      *(_BYTE *)(v0 + 272) = 0;
      static AlertInfo.ActionInfo.okAction(withValue:)(v0 + 272, &type metadata for Bool);
      AlertInfo.init(title:message:actions:)(v12, v14, v16, v18, v21, &type metadata for Bool);
      v22 = *(_QWORD *)(v0 + 152);
      v23 = *(_QWORD *)(v0 + 160);
      v24 = *(_QWORD *)(v0 + 144);
      v25 = *(_QWORD *)(v0 + 64);
      v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_40E08);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v25, 0, 1, v26);
      swift_task_dealloc(v23);
      swift_task_dealloc(v22);
      swift_task_dealloc(v24);
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
  }
  else
  {
    v6 = *(_QWORD *)(v0 + 168);
    v7 = swift_release(v3);
    *(_QWORD *)(v0 + 240) = static MainActor.shared.getter(v7);
    v8 = dispatch thunk of Actor.unownedExecutor.getter(v6, &protocol witness table for MainActor);
    return swift_task_switch(sub_C794, v8, v9);
  }
}

uint64_t sub_C794()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 240));
  return swift_task_switch(sub_C7D0, 0, 0);
}

uint64_t sub_C7D0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(v1 + 168);
  *(_QWORD *)(v1 + 248) = static MainActor.shared.getter(a1);
  v3 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  return swift_task_switch(sub_C830, v3, v4);
}

uint64_t sub_C830()
{
  _QWORD *v0;
  void (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = (void (*)(uint64_t, uint64_t, uint64_t))v0[25];
  v2 = v0[23];
  v3 = v0[19];
  v4 = v0[16];
  swift_release(v0[31]);
  v1(v3, v2, v4);
  return swift_task_switch(sub_C894, 0, 0);
}

uint64_t sub_C894()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v1 = Logger.logObject.getter();
  v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = *(void (**)(uint64_t, uint64_t))(v0 + 208);
    v4 = *(_QWORD *)(v0 + 152);
    v5 = *(_QWORD *)(v0 + 128);
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v17 = v7;
    *(_DWORD *)v6 = 136315138;
    *(_QWORD *)(v0 + 56) = sub_FD1C(0xD000000000000065, 0x80000000000384D0, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 56, v0 + 64, v6 + 4, v6 + 12);
    _os_log_impl(&dword_0, v1, v2, "ContactPickerViewModel: %s - No incapable recipient", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

    v3(v4, v5);
  }
  else
  {
    v8 = *(void (**)(uint64_t, uint64_t))(v0 + 208);
    v9 = *(_QWORD *)(v0 + 152);
    v10 = *(_QWORD *)(v0 + 128);

    v8(v9, v10);
  }
  v11 = *(_QWORD *)(v0 + 152);
  v12 = *(_QWORD *)(v0 + 160);
  v13 = *(_QWORD *)(v0 + 144);
  v14 = *(_QWORD *)(v0 + 64);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_40E08);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  swift_task_dealloc(v12);
  swift_task_dealloc(v11);
  swift_task_dealloc(v13);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_CA5C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0[21];
  v2 = swift_task_dealloc(v0[27]);
  v0[32] = static MainActor.shared.getter(v2);
  v3 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_CAC4, v3, v4);
}

uint64_t sub_CAC4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 256));
  return swift_task_switch(sub_CB00, 0, 0);
}

uint64_t sub_CB00(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(v1 + 168);
  *(_QWORD *)(v1 + 264) = static MainActor.shared.getter(a1);
  v3 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  return swift_task_switch(sub_CB60, v3, v4);
}

uint64_t sub_CB60()
{
  _QWORD *v0;
  void (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = (void (*)(uint64_t, uint64_t, uint64_t))v0[25];
  v2 = v0[23];
  v3 = v0[18];
  v4 = v0[16];
  swift_release(v0[33]);
  v1(v3, v2, v4);
  return swift_task_switch(sub_CBC4, 0, 0);
}

uint64_t sub_CBC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
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
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  uint64_t v36;

  v1 = *(_QWORD *)(v0 + 232);
  swift_errorRetain(v1);
  v2 = swift_errorRetain(v1);
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = *(_QWORD *)(v0 + 232);
    v34 = *(_QWORD *)(v0 + 144);
    v35 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 208);
    v33 = *(_QWORD *)(v0 + 128);
    v6 = swift_slowAlloc(22, -1);
    v7 = (uint64_t *)swift_slowAlloc(8, -1);
    v32 = swift_slowAlloc(32, -1);
    v36 = v32;
    *(_DWORD *)v6 = 136315394;
    *(_QWORD *)(v0 + 32) = sub_FD1C(0xD000000000000065, 0x80000000000384D0, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 32, v0 + 40, v6 + 4, v6 + 12);
    *(_WORD *)(v6 + 12) = 2112;
    swift_errorRetain(v5);
    v8 = _swift_stdlib_bridgeErrorToNSError(v5);
    *(_QWORD *)(v0 + 40) = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v0 + 48, v6 + 14, v6 + 22);
    *v7 = v8;
    swift_errorRelease(v5);
    swift_errorRelease(v5);
    _os_log_impl(&dword_0, v3, v4, "ContactPickerViewModel: %s - Error: %@", (uint8_t *)v6, 0x16u);
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_410E8);
    swift_arrayDestroy(v7, 1, v9);
    swift_slowDealloc(v7, -1, -1);
    swift_arrayDestroy(v32, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v32, -1, -1);
    swift_slowDealloc(v6, -1, -1);

    v10 = v35(v34, v33);
  }
  else
  {
    v11 = *(_QWORD *)(v0 + 232);
    v12 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 208);
    v13 = *(_QWORD *)(v0 + 144);
    v14 = *(_QWORD *)(v0 + 128);
    swift_errorRelease(v11);
    swift_errorRelease(v11);

    v10 = v12(v13, v14);
  }
  v15 = *(_QWORD *)(v0 + 232);
  v16 = (*(uint64_t (**)(uint64_t))(v0 + 112))(v10);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_40FF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_40FF8);
  v25 = swift_allocObject(v23, ((*(unsigned __int8 *)(*(_QWORD *)(v24 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v24 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v24 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v24 - 8) + 80) | 7);
  *(_OWORD *)(v25 + 16) = xmmword_33770;
  *(_BYTE *)(v0 + 273) = 0;
  static AlertInfo.ActionInfo.okAction(withValue:)(v0 + 273, &type metadata for Bool);
  AlertInfo.init(title:message:actions:)(v16, v18, v20, v22, v25, &type metadata for Bool);
  swift_errorRelease(v15);
  v26 = *(_QWORD *)(v0 + 152);
  v27 = *(_QWORD *)(v0 + 160);
  v28 = *(_QWORD *)(v0 + 144);
  v29 = *(_QWORD *)(v0 + 64);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_40E08);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v29, 0, 1, v30);
  swift_task_dealloc(v27);
  swift_task_dealloc(v26);
  swift_task_dealloc(v28);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_CEFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;

  v5[13] = a4;
  v5[14] = a5;
  v5[11] = a2;
  v5[12] = a3;
  v5[10] = a1;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_41100);
  v5[15] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v6 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_410C8);
  v5[16] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v5[17] = v8;
  v9 = (*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v5[18] = swift_task_alloc(v9);
  v5[19] = swift_task_alloc(v9);
  v5[20] = swift_task_alloc(v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_41108);
  v5[21] = v10;
  v11 = *(_QWORD *)(v10 - 8);
  v5[22] = v11;
  v5[23] = swift_task_alloc((*(_QWORD *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_40F58) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v5[24] = swift_task_alloc(v12);
  v5[25] = swift_task_alloc(v12);
  v13 = type metadata accessor for Handle(0);
  v5[26] = v13;
  v14 = *(_QWORD *)(v13 - 8);
  v5[27] = v14;
  v15 = *(_QWORD *)(v14 + 64);
  v5[28] = v15;
  v16 = (v15 + 15) & 0xFFFFFFFFFFFFFFF0;
  v5[29] = swift_task_alloc(v16);
  v5[30] = swift_task_alloc(v16);
  return swift_task_switch(sub_D044, 0, 0);
}

uint64_t sub_D044()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t result;
  int64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t ObjectType;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned __int8 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  int64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v1 = *(_QWORD *)(v0 + 96);
  v47 = v1 + 64;
  v49 = *(_QWORD *)(v0 + 216);
  v2 = -1;
  v3 = -1 << *(_BYTE *)(v1 + 32);
  if (-v3 < 64)
    v2 = ~(-1 << -(char)v3);
  v4 = v2 & *(_QWORD *)(v1 + 64);
  v48 = (unint64_t)(63 - v3) >> 6;
  v50 = *(_QWORD *)(v0 + 96);
  result = swift_bridgeObjectRetain(v1);
  for (i = 0; ; i = v52)
  {
    if (v4)
    {
      v51 = (v4 - 1) & v4;
      v52 = i;
      v10 = __clz(__rbit64(v4)) | (i << 6);
      goto LABEL_25;
    }
    v11 = i + 1;
    if (__OFADD__(i, 1))
    {
      __break(1u);
      goto LABEL_34;
    }
    if (v11 >= v48)
      goto LABEL_32;
    v12 = *(_QWORD *)(v47 + 8 * v11);
    v13 = i + 1;
    if (!v12)
    {
      v13 = i + 2;
      if (i + 2 >= v48)
        goto LABEL_32;
      v12 = *(_QWORD *)(v47 + 8 * v13);
      if (!v12)
      {
        v13 = i + 3;
        if (i + 3 >= v48)
          goto LABEL_32;
        v12 = *(_QWORD *)(v47 + 8 * v13);
        if (!v12)
        {
          v13 = i + 4;
          if (i + 4 >= v48)
            goto LABEL_32;
          v12 = *(_QWORD *)(v47 + 8 * v13);
          if (!v12)
          {
            v13 = i + 5;
            if (i + 5 >= v48)
              goto LABEL_32;
            v12 = *(_QWORD *)(v47 + 8 * v13);
            if (!v12)
              break;
          }
        }
      }
    }
LABEL_24:
    v51 = (v12 - 1) & v12;
    v52 = v13;
    v10 = __clz(__rbit64(v12)) + (v13 << 6);
LABEL_25:
    v15 = *(_QWORD *)(v0 + 232);
    v16 = *(_QWORD *)(v0 + 240);
    v17 = *(_QWORD *)(v0 + 224);
    v19 = *(_QWORD *)(v0 + 200);
    v18 = *(_QWORD *)(v0 + 208);
    v55 = *(_QWORD *)(v0 + 192);
    v20 = *(_QWORD *)(v0 + 112);
    v53 = v19;
    v54 = *(_QWORD *)(v0 + 104);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v49 + 16))(v16, *(_QWORD *)(v50 + 48) + *(_QWORD *)(v49 + 72) * v10, v18);
    v21 = type metadata accessor for TaskPriority(0);
    v22 = *(_QWORD *)(v21 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 56))(v19, 1, 1, v21);
    v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 32);
    v23(v15, v16, v18);
    v24 = *(unsigned __int8 *)(v49 + 80);
    v25 = (v24 + 48) & ~v24;
    v26 = (_QWORD *)swift_allocObject(&unk_3D860, v25 + v17, v24 | 7);
    v26[2] = 0;
    v27 = v26 + 2;
    v26[3] = 0;
    v26[4] = v54;
    v26[5] = v20;
    v23((uint64_t)v26 + v25, v15, v18);
    sub_1A1D4(v53, v55, &qword_40F58);
    LODWORD(v18) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v22 + 48))(v55, 1, v21);
    v28 = swift_retain(v20);
    v29 = *(_QWORD *)(v0 + 192);
    if ((_DWORD)v18 == 1)
    {
      sub_1A198(*(_QWORD *)(v0 + 192), &qword_40F58);
      v30 = 0;
      v31 = *v27;
      if (*v27)
        goto LABEL_27;
    }
    else
    {
      v38 = TaskPriority.rawValue.getter(v28);
      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v29, v21);
      v30 = v38;
      v31 = *v27;
      if (*v27)
      {
LABEL_27:
        v32 = v26[3];
        ObjectType = swift_getObjectType(v31);
        swift_unknownObjectRetain(v31, v34);
        v35 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v32);
        v37 = v36;
        swift_unknownObjectRelease(v31);
        goto LABEL_30;
      }
    }
    v35 = 0;
    v37 = 0;
LABEL_30:
    v39 = **(_QWORD **)(v0 + 88);
    v40 = v37 | v35;
    if (v37 | v35)
    {
      v40 = v0 + 16;
      *(_QWORD *)(v0 + 16) = 0;
      *(_QWORD *)(v0 + 24) = 0;
      *(_QWORD *)(v0 + 32) = v35;
      *(_QWORD *)(v0 + 40) = v37;
    }
    v7 = *(_QWORD *)(v0 + 200);
    v8 = *(_QWORD *)(v0 + 128);
    *(_QWORD *)(v0 + 48) = 1;
    *(_QWORD *)(v0 + 56) = v40;
    *(_QWORD *)(v0 + 64) = v39;
    v9 = swift_task_create(v30 | 0x3100, v0 + 48, v8, &unk_41118, v26);
    swift_release(v9);
    result = sub_1A198(v7, &qword_40F58);
    v4 = v51;
  }
  v14 = i + 6;
  if (i + 6 >= v48)
  {
LABEL_32:
    v41 = *(_QWORD *)(v0 + 128);
    v42 = *(uint64_t **)(v0 + 88);
    swift_release(*(_QWORD *)(v0 + 96));
    v43 = *v42;
    *(_QWORD *)(v0 + 248) = sub_30C8((uint64_t)_swiftEmptyArrayStorage);
    v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_40F98);
    ThrowingTaskGroup.makeAsyncIterator()(v43, v41, v44, &protocol self-conformance witness table for Error);
    v45 = sub_1A114(&qword_41120, &qword_41108, (uint64_t)&protocol conformance descriptor for ThrowingTaskGroup<A, B>.Iterator);
    *(_QWORD *)(v0 + 256) = v45;
    v46 = (_QWORD *)swift_task_alloc(async function pointer to dispatch thunk of AsyncIteratorProtocol.next()[1]);
    *(_QWORD *)(v0 + 264) = v46;
    *v46 = v0;
    v46[1] = sub_D49C;
    return dispatch thunk of AsyncIteratorProtocol.next()(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 168), v45);
  }
  v12 = *(_QWORD *)(v47 + 8 * v14);
  if (v12)
  {
    v13 = i + 6;
    goto LABEL_24;
  }
  while (1)
  {
    v13 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v13 >= v48)
      goto LABEL_32;
    v12 = *(_QWORD *)(v47 + 8 * v13);
    ++v14;
    if (v12)
      goto LABEL_24;
  }
LABEL_34:
  __break(1u);
  return result;
}

uint64_t sub_D49C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();

  v2 = *(_QWORD **)v1;
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v1 + 264));
  v3 = v2[31];
  if (v0)
  {
    v2[35] = v0;
    v5 = v2[22];
    v4 = v2[23];
    v6 = v2[21];
    swift_bridgeObjectRelease(v3);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    v7 = sub_D82C;
  }
  else
  {
    v2[34] = v3;
    v7 = sub_D52C;
  }
  return swift_task_switch(v7, 0, 0);
}

uint64_t sub_D52C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t);
  char v20;
  uint64_t v21;
  uint64_t isUniquelyReferenced_nonNull_native;
  char v23;
  unint64_t v24;
  uint64_t v25;
  _BOOL8 v26;
  char v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t);
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;

  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 120);
  v3 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 136) + 48))(v2, 1, v1);
  v4 = *(_QWORD *)(v0 + 272);
  if (v3 == 1)
  {
    v6 = *(_QWORD *)(v0 + 232);
    v5 = *(_QWORD *)(v0 + 240);
    v8 = *(_QWORD *)(v0 + 192);
    v7 = *(_QWORD *)(v0 + 200);
    v9 = *(_QWORD *)(v0 + 184);
    v10 = *(_QWORD *)(v0 + 160);
    v45 = *(_QWORD *)(v0 + 152);
    v46 = *(_QWORD *)(v0 + 144);
    v11 = *(_QWORD **)(v0 + 80);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 176) + 8))(v9, *(_QWORD *)(v0 + 168));
    sub_1A198(v2, &qword_41100);
    *v11 = v4;
    swift_task_dealloc(v5);
    swift_task_dealloc(v6);
    swift_task_dealloc(v7);
    swift_task_dealloc(v8);
    swift_task_dealloc(v9);
    swift_task_dealloc(v10);
    swift_task_dealloc(v45);
    swift_task_dealloc(v46);
    swift_task_dealloc(v2);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v13 = *(_QWORD *)(v0 + 208);
  v14 = *(_QWORD *)(v0 + 216);
  v16 = *(_QWORD *)(v0 + 152);
  v15 = *(_QWORD *)(v0 + 160);
  v17 = *(_QWORD *)(v0 + 144);
  sub_1A154(v2, v15, &qword_410C8);
  v18 = *(int *)(v1 + 48);
  v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16);
  v19(v16, v15, v13);
  v20 = *(_BYTE *)(v15 + v18);
  *(_BYTE *)(v16 + v18) = v20;
  v21 = *(int *)(v1 + 48);
  v19(v17, v15, v13);
  *(_BYTE *)(v17 + v21) = v20;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v4);
  *(_QWORD *)(v0 + 72) = v4;
  v24 = sub_1038C(v16);
  v25 = *(_QWORD *)(v4 + 16);
  v26 = (v23 & 1) == 0;
  result = v25 + v26;
  if (__OFADD__(v25, v26))
  {
    __break(1u);
  }
  else
  {
    v27 = v23;
    if (*(_QWORD *)(*(_QWORD *)(v0 + 272) + 24) >= result)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        sub_140B0();
    }
    else
    {
      v28 = *(_QWORD *)(v0 + 152);
      sub_11010(result, isUniquelyReferenced_nonNull_native);
      v29 = sub_1038C(v28);
      if ((v27 & 1) != (v30 & 1))
        return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(*(_QWORD *)(v0 + 208));
      v24 = v29;
    }
    v31 = *(_QWORD **)(v0 + 72);
    *(_QWORD *)(v0 + 288) = v31;
    if ((v27 & 1) != 0)
    {
      *(_BYTE *)(v31[7] + v24) = v20;
LABEL_14:
      v38 = *(_QWORD *)(v0 + 208);
      v39 = *(_QWORD *)(v0 + 216);
      v41 = *(_QWORD *)(v0 + 152);
      v40 = *(_QWORD *)(v0 + 160);
      v42 = *(_QWORD *)(v0 + 144);
      swift_bridgeObjectRelease(0x8000000000000000);
      v43 = *(void (**)(uint64_t, uint64_t))(v39 + 8);
      v43(v41, v38);
      v43(v42, v38);
      sub_1A198(v40, &qword_410C8);
      v44 = (_QWORD *)swift_task_alloc(async function pointer to dispatch thunk of AsyncIteratorProtocol.next()[1]);
      *(_QWORD *)(v0 + 296) = v44;
      *v44 = v0;
      v44[1] = sub_D8CC;
      return dispatch thunk of AsyncIteratorProtocol.next()(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 256));
    }
    v32 = *(_QWORD *)(v0 + 208);
    v33 = *(_QWORD *)(v0 + 216);
    v34 = *(_QWORD *)(v0 + 152);
    v31[(v24 >> 6) + 8] |= 1 << v24;
    result = ((uint64_t (*)(unint64_t, uint64_t, uint64_t))v19)(v31[6] + *(_QWORD *)(v33 + 72) * v24, v34, v32);
    *(_BYTE *)(v31[7] + v24) = v20;
    v35 = v31[2];
    v36 = __OFADD__(v35, 1);
    v37 = v35 + 1;
    if (!v36)
    {
      v31[2] = v37;
      goto LABEL_14;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_D82C()
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

  v1 = *(_QWORD *)(v0 + 232);
  v3 = *(_QWORD *)(v0 + 192);
  v2 = *(_QWORD *)(v0 + 200);
  v4 = *(_QWORD *)(v0 + 184);
  v6 = *(_QWORD *)(v0 + 152);
  v5 = *(_QWORD *)(v0 + 160);
  v7 = *(_QWORD *)(v0 + 144);
  v8 = *(_QWORD *)(v0 + 120);
  swift_task_dealloc(*(_QWORD *)(v0 + 240));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_D8CC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();

  v2 = *(_QWORD **)v1;
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v1 + 296));
  v3 = v2[36];
  if (v0)
  {
    v2[35] = v0;
    v5 = v2[22];
    v4 = v2[23];
    v6 = v2[21];
    swift_bridgeObjectRelease(v3);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    v7 = sub_D82C;
  }
  else
  {
    v2[34] = v3;
    v7 = sub_D52C;
  }
  return swift_task_switch(v7, 0, 0);
}

uint64_t sub_D95C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t);

  v6[2] = a1;
  v6[3] = a6;
  v10 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  v8 = (_QWORD *)swift_task_alloc(a4[1]);
  v6[4] = v8;
  *v8 = v6;
  v8[1] = sub_D9C4;
  return v10(a6);
}

uint64_t sub_D9C4(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 32);
  v6 = *v2;
  swift_task_dealloc(v5);
  if (v1)
    return (*(uint64_t (**)(void))(v6 + 8))();
  *(_BYTE *)(v4 + 40) = a1 & 1;
  return swift_task_switch(sub_DA44, 0, 0);
}

uint64_t sub_DA44()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_BYTE *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_410C8) + 48);
  v5 = type metadata accessor for Handle(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(v2, v3, v5);
  *(_BYTE *)(v2 + v4) = v1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t ContactPickerViewModel.Dependencies.init(isReachable:isHandlePartOfSignedInAccount:excludedSuggestedContactHandles:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  *a6 = result;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  return result;
}

void ContactPickerViewModel.RecipientStatus.InvalidReason.hash(into:)()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

BOOL static ContactPickerViewModel.RecipientStatus.InvalidReason.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int ContactPickerViewModel.RecipientStatus.InvalidReason.hashValue.getter()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

Swift::Int sub_DB48(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t static ContactPickerViewModel.mock(requiresReachability:)(char a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[5];
  uint64_t v9[2];
  char v10;
  uint64_t (*v11)@<X0>(uint64_t (*)(void *, _QWORD)@<X0>, uint64_t@<X8>);
  uint64_t v12;
  uint64_t v13;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_40CB0);
  v4 = swift_allocObject(v3, 80, 7);
  *(_OWORD *)(v4 + 16) = xmmword_33790;
  *(_QWORD *)(v4 + 32) = &unk_40CB8;
  *(_QWORD *)(v4 + 40) = 0;
  v5 = swift_allocObject(&unk_3D310, 40, 7);
  *(_BYTE *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = sub_ECE4;
  *(_QWORD *)(v5 + 32) = 0;
  *(_QWORD *)(v4 + 48) = &unk_40CC0;
  *(_QWORD *)(v4 + 56) = v5;
  *(_QWORD *)(v4 + 64) = &unk_40CC8;
  *(_QWORD *)(v4 + 72) = 0;
  v9[0] = 0xD000000000000016;
  v9[1] = 0x8000000000037D20;
  v10 = 1;
  v11 = sub_DCA0;
  v12 = 0;
  v13 = v4;
  v8[0] = &unk_40CD0;
  v8[1] = 0;
  v8[2] = &unk_40CD8;
  v8[3] = 0;
  v8[4] = _swiftEmptyArrayStorage;
  v6 = swift_allocObject(v1, *(unsigned int *)(v1 + 48), *(unsigned __int16 *)(v1 + 52));
  ContactPickerViewModel.init(configuration:dependencies:)(v9, (uint64_t)v8);
  return v6;
}

uint64_t sub_DCA0@<X0>(uint64_t (*a1)(void *, _QWORD)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD *v8;
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
  uint64_t v20;

  v4 = type metadata accessor for GenericControl.Info.Label(0);
  __chkstk_darwin(v4);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_41088);
  v8 = (_QWORD *)(a2 + *(int *)(v7 + 48));
  GenericControl.Info.Label.init(stringLiteral:)(7364948, 0xE300000000000000);
  *v8 = 0xD000000000000017;
  v8[1] = 0x80000000000384B0;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_41090);
  v10 = *(_QWORD *)(type metadata accessor for GenericControl.Info.MenuOption(0) - 8);
  v11 = swift_allocObject(v9, ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))+ 2 * *(_QWORD *)(v10 + 72), *(unsigned __int8 *)(v10 + 80) | 7);
  *(_OWORD *)(v11 + 16) = xmmword_33780;
  GenericControl.Info.Label.init(stringLiteral:)(0x31206E6F6974704FLL, 0xE800000000000000);
  v12 = a1(&unk_41098, 0);
  GenericControl.Info.MenuOption.init(label:action:)(v6, v12, v13);
  v14 = *(int *)(v7 + 64);
  GenericControl.Info.Label.init(stringLiteral:)(0x32206E6F6974704FLL, 0xE800000000000000);
  v15 = a1(&unk_410A0, 0);
  GenericControl.Info.MenuOption.init(label:action:)(v6, v15, v16);
  *(_QWORD *)(a2 + v14) = v11;
  v17 = enum case for GenericControl.Info.menu(_:);
  v18 = type metadata accessor for GenericControl.Info(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 104))(a2, v17, v18);
}

uint64_t sub_DE7C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2[2] = a1;
  v2[3] = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_410A8);
  v2[4] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for ContinuousClock(0);
  v2[5] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v2[6] = v5;
  v2[7] = swift_task_alloc((*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for MainActor(0);
  v2[8] = static MainActor.shared.getter(v6);
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v6, &protocol witness table for MainActor);
  v2[9] = v7;
  v2[10] = v8;
  return swift_task_switch(sub_DF34, v7, v8);
}

uint64_t sub_DF34()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t, uint64_t, char);

  ContinuousClock.init()();
  v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_41058 + dword_41058);
  v1 = (_QWORD *)swift_task_alloc(unk_4105C);
  *(_QWORD *)(v0 + 88) = v1;
  *v1 = v0;
  v1[1] = sub_DFB4;
  return v3(3000000000000000000, 0, 0, 0, 1);
}

uint64_t sub_DFB4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)();

  v2 = *(_QWORD **)v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 88);
  *(_QWORD *)(*(_QWORD *)v1 + 96) = v0;
  swift_task_dealloc(v3);
  v5 = v2[6];
  v4 = v2[7];
  v6 = v2[5];
  if (v0)
  {
    swift_errorRelease(v0);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    v7 = v2[9];
    v8 = v2[10];
    v9 = sub_1A220;
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v5 + 8))(v2[7], v2[5]);
    v7 = v2[9];
    v8 = v2[10];
    v9 = sub_1A288;
  }
  return swift_task_switch(v9, v7, v8);
}

uint64_t sub_E058(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t result;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t i;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  _QWORD v37[2];
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_41010);
  v7 = __chkstk_darwin(v36);
  v35 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v34 = (char *)&v31 - v9;
  v38 = a1;
  v39 = a2;
  v10 = *(_QWORD *)(a3 + 64);
  v32 = a3 + 64;
  v11 = 1 << *(_BYTE *)(a3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & v10;
  v33 = (unint64_t)(v11 + 63) >> 6;
  swift_bridgeObjectRetain(a2);
  v40 = a3;
  result = swift_bridgeObjectRetain(a3);
  v15 = 0;
  v16 = (uint64_t)v35;
  if (!v13)
    goto LABEL_5;
LABEL_4:
  v17 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (i = v17 | (v15 << 6); ; i = __clz(__rbit64(v20)) + (v15 << 6))
  {
    v22 = v40;
    v23 = *(_QWORD *)(v40 + 48);
    v24 = type metadata accessor for Handle(0);
    v25 = (uint64_t)v34;
    (*(void (**)(char *, unint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v34, v23 + *(_QWORD *)(*(_QWORD *)(v24 - 8) + 72) * i, v24);
    v26 = *(_QWORD *)(v22 + 56) + 32 * i;
    a1 = *(_QWORD *)v26;
    v27 = *(_QWORD *)(v26 + 8);
    v28 = *(_QWORD *)(v26 + 16);
    v29 = v25 + *(int *)(v36 + 48);
    v30 = *(_BYTE *)(v26 + 24);
    *(_QWORD *)v29 = *(_QWORD *)v26;
    *(_QWORD *)(v29 + 8) = v27;
    *(_QWORD *)(v29 + 16) = v28;
    *(_BYTE *)(v29 + 24) = v30;
    sub_1A154(v25, v16, &qword_41010);
    sub_18DEC(a1, v27, v28, v30);
    sub_F16C(&v38, v16, v37);
    sub_1A198(v16, &qword_41010);
    if (v3)
    {
      swift_release(v40);
      swift_bridgeObjectRelease(v39);
      return a1;
    }
    result = swift_bridgeObjectRelease(v39);
    a1 = v37[0];
    v38 = v37[0];
    v39 = v37[1];
    if (v13)
      goto LABEL_4;
LABEL_5:
    if (__OFADD__(v15++, 1))
      break;
    if (v15 >= v33)
      goto LABEL_26;
    v20 = *(_QWORD *)(v32 + 8 * v15);
    if (!v20)
    {
      v21 = v15 + 1;
      if (v15 + 1 >= v33)
        goto LABEL_26;
      v20 = *(_QWORD *)(v32 + 8 * v21);
      if (v20)
        goto LABEL_16;
      v21 = v15 + 2;
      if (v15 + 2 >= v33)
        goto LABEL_26;
      v20 = *(_QWORD *)(v32 + 8 * v21);
      if (v20)
        goto LABEL_16;
      v21 = v15 + 3;
      if (v15 + 3 >= v33)
        goto LABEL_26;
      v20 = *(_QWORD *)(v32 + 8 * v21);
      if (v20)
      {
LABEL_16:
        v15 = v21;
        goto LABEL_17;
      }
      v21 = v15 + 4;
      if (v15 + 4 < v33)
      {
        v20 = *(_QWORD *)(v32 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            v15 = v21 + 1;
            if (__OFADD__(v21, 1))
              goto LABEL_29;
            if (v15 >= v33)
              goto LABEL_26;
            v20 = *(_QWORD *)(v32 + 8 * v15);
            ++v21;
            if (v20)
              goto LABEL_17;
          }
        }
        goto LABEL_16;
      }
LABEL_26:
      swift_release(v40);
      return a1;
    }
LABEL_17:
    v13 = (v20 - 1) & v20;
  }
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_E344(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2[2] = a1;
  v2[3] = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_410A8);
  v2[4] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for ContinuousClock(0);
  v2[5] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v2[6] = v5;
  v2[7] = swift_task_alloc((*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for MainActor(0);
  v2[8] = static MainActor.shared.getter(v6);
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v6, &protocol witness table for MainActor);
  v2[9] = v7;
  v2[10] = v8;
  return swift_task_switch(sub_E3FC, v7, v8);
}

uint64_t sub_E3FC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t, uint64_t, char);

  ContinuousClock.init()();
  v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_41058 + dword_41058);
  v1 = (_QWORD *)swift_task_alloc(unk_4105C);
  *(_QWORD *)(v0 + 88) = v1;
  *v1 = v0;
  v1[1] = sub_E47C;
  return v3(3000000000000000000, 0, 0, 0, 1);
}

uint64_t sub_E47C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)();

  v2 = *(_QWORD **)v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 88);
  *(_QWORD *)(*(_QWORD *)v1 + 96) = v0;
  swift_task_dealloc(v3);
  v5 = v2[6];
  v4 = v2[7];
  v6 = v2[5];
  if (v0)
  {
    swift_errorRelease(v0);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    v7 = v2[9];
    v8 = v2[10];
    v9 = sub_E750;
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v5 + 8))(v2[7], v2[5]);
    v7 = v2[9];
    v8 = v2[10];
    v9 = sub_E520;
  }
  return swift_task_switch(v9, v7, v8);
}

uint64_t sub_E520()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  Swift::String v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = *(_QWORD *)(v0 + 24);
  swift_release(*(_QWORD *)(v0 + 64));
  v2 = swift_bridgeObjectRetain(v1);
  v3 = sub_11508(v2, 0x726F727265, 0xE500000000000000);
  swift_bridgeObjectRelease(v1);
  if (*(_QWORD *)(v3 + 16))
  {
    v4 = *(_QWORD *)(v0 + 32);
    v5 = *(_QWORD *)(v0 + 16);
    v6 = sub_E058(0, 0xE000000000000000, v3);
    v8 = v7;
    swift_release(v3);
    v9._countAndFlagsBits = v6;
    v9._object = v8;
    String.append(_:)(v9);
    swift_bridgeObjectRelease(v8);
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_410B0);
    v11 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_410B8) - 8);
    v12 = swift_allocObject(v10, ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))+ *(_QWORD *)(v11 + 72), *(unsigned __int8 *)(v11 + 80) | 7);
    *(_OWORD *)(v12 + 16) = xmmword_33770;
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_410C0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v4, 1, 1, v13);
    AlertInfo.ActionInfo.init(title:style:value:)(0x2E2E2E656E6946, 0xE700000000000000, v4);
    AlertInfo.init(title:message:actions:)(0x7272727245, 0xE500000000000000, 0x616820726F727245, 0xEF3A64656E657070, v12, (char *)&type metadata for () + 8);
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_40EA0);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v5, 0, 1, v14);
  }
  else
  {
    v15 = *(_QWORD *)(v0 + 16);
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_40EA0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 1, 1, v16);
    swift_release(v3);
  }
  v17 = *(_QWORD *)(v0 + 32);
  swift_task_dealloc(*(_QWORD *)(v0 + 56));
  swift_task_dealloc(v17);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_E750()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  Swift::String v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = *(_QWORD *)(v0 + 24);
  swift_release(*(_QWORD *)(v0 + 64));
  v2 = swift_bridgeObjectRetain(v1);
  v3 = sub_11508(v2, 0x726F727265, 0xE500000000000000);
  swift_bridgeObjectRelease(v1);
  if (*(_QWORD *)(v3 + 16))
  {
    v4 = *(_QWORD *)(v0 + 32);
    v5 = *(_QWORD *)(v0 + 16);
    v6 = sub_E058(0, 0xE000000000000000, v3);
    v8 = v7;
    swift_release(v3);
    v9._countAndFlagsBits = v6;
    v9._object = v8;
    String.append(_:)(v9);
    swift_bridgeObjectRelease(v8);
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_410B0);
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_410B8);
    v12 = swift_allocObject(v10, ((*(unsigned __int8 *)(*(_QWORD *)(v11 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v11 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v11 - 8) + 80) | 7);
    *(_OWORD *)(v12 + 16) = xmmword_33770;
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_410C0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v4, 1, 1, v13);
    AlertInfo.ActionInfo.init(title:style:value:)(0x2E2E2E656E6946, 0xE700000000000000, v4);
    AlertInfo.init(title:message:actions:)(0x7272727245, 0xE500000000000000, 0x616820726F727245, 0xEF3A64656E657070, v12, (char *)&type metadata for () + 8);
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_40EA0);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v5, 0, 1, v14);
  }
  else
  {
    v15 = *(_QWORD *)(v0 + 16);
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_40EA0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 1, 1, v16);
    swift_release(v3);
  }
  v17 = *(_QWORD *)(v0 + 32);
  swift_task_dealloc(*(_QWORD *)(v0 + 56));
  swift_task_dealloc(v17);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_E980(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[4];

  v27 = a3;
  v28 = a4;
  v26 = a1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_41010);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v25 - v9;
  v12 = *(_QWORD *)a2;
  v11 = *(_QWORD *)(a2 + 8);
  v13 = *(_QWORD *)(a2 + 16);
  LOBYTE(a2) = *(_BYTE *)(a2 + 24);
  v14 = type metadata accessor for Handle(0);
  v25 = *(_QWORD *)(v14 - 8);
  v15 = *(void (**)(char *, uint64_t, uint64_t))(v25 + 16);
  v15(v10, v26, v14);
  v16 = *(int *)(v5 + 48);
  v17 = &v10[v16];
  *(_QWORD *)v17 = v12;
  *((_QWORD *)v17 + 1) = v11;
  *((_QWORD *)v17 + 2) = v13;
  v17[24] = a2;
  v18 = &v8[v16];
  v15(v8, (uint64_t)v10, v14);
  *(_QWORD *)v18 = v12;
  *((_QWORD *)v18 + 1) = v11;
  *((_QWORD *)v18 + 2) = v13;
  v18[24] = a2;
  v19 = sub_18DEC(v12, v11, v13, a2);
  v20 = Handle.rawValue.getter(v19);
  v22 = v21;
  (*(void (**)(char *, uint64_t))(v25 + 8))(v8, v14);
  v29[2] = v20;
  v29[3] = v22;
  v29[0] = v27;
  v29[1] = v28;
  v23 = sub_19F28();
  LOBYTE(v20) = StringProtocol.contains<A>(_:)(v29, &type metadata for String, &type metadata for String, v23, v23);
  swift_bridgeObjectRelease(v22);
  sub_1A198((uint64_t)v10, &qword_41010);
  return v20 & 1;
}

unint64_t sub_EB1C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  Swift::String v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  Swift::String v17;
  Swift::String v18;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;

  v2 = type metadata accessor for Handle(0);
  v23 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(_QWORD *)(a1 + 16);
  if (v5)
  {
    v6 = a1 + ((*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80));
    v7 = *(_QWORD *)(v23 + 72);
    v21 = *(void (**)(char *, uint64_t, uint64_t))(v23 + 16);
    v22 = v7;
    v20 = a1;
    swift_bridgeObjectRetain(a1);
    v8 = 0;
    v9 = (void *)0xE000000000000000;
    do
    {
      v10 = v9;
      v21(v4, v6, v2);
      v24 = v8;
      v25 = (unint64_t)v9;
      swift_bridgeObjectRetain(v9);
      v11._countAndFlagsBits = 2108682;
      v11._object = (void *)0xE300000000000000;
      String.append(_:)(v11);
      v13 = v24;
      v12 = v25;
      v14 = Handle.rawValue.getter();
      v16 = v15;
      v24 = v13;
      v25 = v12;
      swift_bridgeObjectRetain(v12);
      v17._countAndFlagsBits = v14;
      v17._object = v16;
      String.append(_:)(v17);
      swift_bridgeObjectRelease(v12);
      swift_bridgeObjectRelease(v16);
      v8 = v24;
      v9 = (void *)v25;
      (*(void (**)(char *, uint64_t))(v23 + 8))(v4, v2);
      swift_bridgeObjectRelease(v10);
      v6 += v22;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease(v20);
  }
  else
  {
    v8 = 0;
    v9 = (void *)0xE000000000000000;
  }
  v24 = 0xD00000000000001FLL;
  v25 = 0x8000000000038470;
  v18._countAndFlagsBits = v8;
  v18._object = v9;
  String.append(_:)(v18);
  swift_bridgeObjectRelease(v9);
  return 0xD000000000000011;
}

unint64_t sub_ECE4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  Swift::String v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  Swift::String v17;
  Swift::String v18;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;

  v2 = type metadata accessor for Handle(0);
  v23 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(_QWORD *)(a1 + 16);
  if (v5)
  {
    v6 = a1 + ((*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80));
    v7 = *(_QWORD *)(v23 + 72);
    v21 = *(void (**)(char *, uint64_t, uint64_t))(v23 + 16);
    v22 = v7;
    v20 = a1;
    swift_bridgeObjectRetain(a1);
    v8 = 0;
    v9 = (void *)0xE000000000000000;
    do
    {
      v10 = v9;
      v21(v4, v6, v2);
      v24 = v8;
      v25 = (unint64_t)v9;
      swift_bridgeObjectRetain(v9);
      v11._countAndFlagsBits = 2108682;
      v11._object = (void *)0xE300000000000000;
      String.append(_:)(v11);
      v13 = v24;
      v12 = v25;
      v14 = Handle.rawValue.getter();
      v16 = v15;
      v24 = v13;
      v25 = v12;
      swift_bridgeObjectRetain(v12);
      v17._countAndFlagsBits = v14;
      v17._object = v16;
      String.append(_:)(v17);
      swift_bridgeObjectRelease(v12);
      swift_bridgeObjectRelease(v16);
      v8 = v24;
      v9 = (void *)v25;
      (*(void (**)(char *, uint64_t))(v23 + 8))(v4, v2);
      swift_bridgeObjectRelease(v10);
      v6 += v22;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease(v20);
  }
  else
  {
    v8 = 0;
    v9 = (void *)0xE000000000000000;
  }
  v24 = 0xD00000000000001FLL;
  v25 = 0x8000000000038470;
  v18._countAndFlagsBits = v8;
  v18._object = v9;
  String.append(_:)(v18);
  swift_bridgeObjectRelease(v9);
  return 0xD00000000000001ALL;
}

uint64_t sub_EEAC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2[2] = a1;
  v2[3] = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_41078);
  v2[4] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for MainActor(0);
  v2[5] = static MainActor.shared.getter(v4);
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  return swift_task_switch(sub_EF3C, v5, v6);
}

uint64_t sub_EF3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  Swift::String v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v1 = *(_QWORD *)(v0 + 24);
  swift_release(*(_QWORD *)(v0 + 40));
  v2 = swift_bridgeObjectRetain(v1);
  v3 = sub_11508(v2, 0x6D656C626F7270, 0xE700000000000000);
  swift_bridgeObjectRelease(v1);
  if (*(_QWORD *)(v3 + 16))
  {
    v4 = *(_QWORD *)(v0 + 32);
    v5 = *(_QWORD *)(v0 + 16);
    v6 = sub_E058(0, 0xE000000000000000, v3);
    v8 = v7;
    swift_release(v3);
    v9._countAndFlagsBits = v6;
    v9._object = v8;
    String.append(_:)(v9);
    swift_bridgeObjectRelease(v8);
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_40FF0);
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_40FF8);
    v12 = swift_allocObject(v10, ((*(unsigned __int8 *)(*(_QWORD *)(v11 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v11 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v11 - 8) + 80) | 7);
    *(_OWORD *)(v12 + 16) = xmmword_33770;
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_41080);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v4, 1, 1, v13);
    *(_BYTE *)(v0 + 48) = 0;
    AlertInfo.ActionInfo.init(title:style:value:)(0x2E2E2E656E6946, 0xE700000000000000, v4);
    AlertInfo.init(title:message:actions:)(0xD000000000000014, 0x8000000000038430, 0xD000000000000032, 0x80000000000383F0, v12, &type metadata for Bool);
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_40E08);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v5, 0, 1, v14);
  }
  else
  {
    v15 = *(_QWORD *)(v0 + 16);
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_40E08);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 1, 1, v16);
    swift_release(v3);
  }
  swift_task_dealloc(*(_QWORD *)(v0 + 32));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_F16C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  void *v22;
  void *v23;
  Swift::String v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_41010);
  __chkstk_darwin(v6);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[1];
  v27 = *a1;
  v28 = v9;
  swift_bridgeObjectRetain(v9);
  v10._countAndFlagsBits = 2108682;
  v10._object = (void *)0xE300000000000000;
  String.append(_:)(v10);
  v12 = v27;
  v11 = v28;
  v13 = *(int *)(v6 + 48);
  v14 = &v8[v13];
  v15 = a2 + v13;
  v16 = type metadata accessor for Handle(0);
  v17 = *(_QWORD *)(v16 - 8);
  v18 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 16))(v8, a2, v16);
  v19 = *(_QWORD *)(v15 + 16);
  v20 = *(_BYTE *)(v15 + 24);
  *(_OWORD *)v14 = *(_OWORD *)v15;
  *((_QWORD *)v14 + 2) = v19;
  v14[24] = v20;
  v21 = Handle.rawValue.getter(v18);
  v23 = v22;
  (*(void (**)(char *, uint64_t))(v17 + 8))(v8, v16);
  v27 = v12;
  v28 = v11;
  swift_bridgeObjectRetain(v11);
  v24._countAndFlagsBits = v21;
  v24._object = v23;
  String.append(_:)(v24);
  swift_bridgeObjectRelease(v23);
  result = swift_bridgeObjectRelease(v11);
  v26 = v28;
  *a3 = v27;
  a3[1] = v26;
  return result;
}

uint64_t sub_F2BC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2[10] = a1;
  v2[11] = a2;
  v3 = type metadata accessor for Handle(0);
  v2[12] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[13] = v4;
  v2[14] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for ContinuousClock(0);
  v2[15] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v2[16] = v6;
  v2[17] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for MainActor(0);
  v2[18] = static MainActor.shared.getter(v7);
  v8 = dispatch thunk of Actor.unownedExecutor.getter(v7, &protocol witness table for MainActor);
  v2[19] = v8;
  v2[20] = v9;
  return swift_task_switch(sub_F378, v8, v9);
}

uint64_t sub_F378()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t, uint64_t, char);

  ContinuousClock.init()();
  v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_41058 + dword_41058);
  v1 = (_QWORD *)swift_task_alloc(unk_4105C);
  *(_QWORD *)(v0 + 168) = v1;
  *v1 = v0;
  v1[1] = sub_F3F8;
  return v3(2000000000000000000, 0, 0, 0, 1);
}

uint64_t sub_F3F8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 168);
  v5 = *(_QWORD *)(*v1 + 128);
  v4 = *(_QWORD *)(*v1 + 136);
  v6 = *(_QWORD *)(*v1 + 120);
  *(_QWORD *)(*v1 + 176) = v0;
  swift_task_dealloc(v3);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  if (v0)
    v7 = sub_F610;
  else
    v7 = sub_F480;
  return swift_task_switch(v7, *(_QWORD *)(v2 + 152), *(_QWORD *)(v2 + 160));
}

uint64_t sub_F480()
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
  unint64_t v9;
  char v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t *v23;

  v2 = *(_QWORD *)(v0 + 104);
  v1 = *(_QWORD *)(v0 + 112);
  v4 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 96);
  v5 = swift_release(*(_QWORD *)(v0 + 144));
  v6 = Handle.rawValue.getter(v5);
  v8 = v7;
  *(_QWORD *)(v0 + 16) = v6;
  *(_QWORD *)(v0 + 24) = v7;
  *(_QWORD *)(v0 + 32) = 0x64696C6176;
  *(_QWORD *)(v0 + 40) = 0xE500000000000000;
  v9 = sub_19F28();
  v10 = StringProtocol.contains<A>(_:)(v0 + 32, &type metadata for String, &type metadata for String, v9, v9);
  swift_bridgeObjectRelease(v8);
  v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  if ((v10 & 1) != 0)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 104) + 8))(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 96));
    v12 = 0;
    v13 = 1;
  }
  else
  {
    v15 = *(_QWORD *)(v0 + 104);
    v14 = *(_QWORD *)(v0 + 112);
    v16 = *(_QWORD *)(v0 + 96);
    v17 = Handle.rawValue.getter(v11);
    v19 = v18;
    *(_QWORD *)(v0 + 48) = v17;
    *(_QWORD *)(v0 + 56) = v18;
    *(_QWORD *)(v0 + 64) = 3618615;
    *(_QWORD *)(v0 + 72) = 0xE300000000000000;
    v20 = StringProtocol.contains<A>(_:)(v0 + 64, &type metadata for String, &type metadata for String, v9, v9);
    swift_bridgeObjectRelease(v19);
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
    v12 = 0xD000000000000016;
    if ((v20 & 1) != 0)
      v12 = 0;
    v13 = 0x80000000000383D0;
    if ((v20 & 1) != 0)
      v13 = 1;
  }
  v21 = *(_QWORD *)(v0 + 136);
  v22 = *(_QWORD *)(v0 + 112);
  v23 = *(unint64_t **)(v0 + 80);
  *v23 = v12;
  v23[1] = v13;
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_F610()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 112);
  swift_release(*(_QWORD *)(v0 + 144));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_F658(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2[10] = a1;
  v2[11] = a2;
  v3 = type metadata accessor for Handle(0);
  v2[12] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[13] = v4;
  v2[14] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for ContinuousClock(0);
  v2[15] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v2[16] = v6;
  v2[17] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for MainActor(0);
  v2[18] = static MainActor.shared.getter(v7);
  v8 = dispatch thunk of Actor.unownedExecutor.getter(v7, &protocol witness table for MainActor);
  v2[19] = v8;
  v2[20] = v9;
  return swift_task_switch(sub_F714, v8, v9);
}

uint64_t sub_F714()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t, uint64_t, char);

  ContinuousClock.init()();
  v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_41058 + dword_41058);
  v1 = (_QWORD *)swift_task_alloc(unk_4105C);
  *(_QWORD *)(v0 + 168) = v1;
  *v1 = v0;
  v1[1] = sub_F794;
  return v3(1000000000000000000, 0, 0, 0, 1);
}

uint64_t sub_F794()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)();

  v2 = *(_QWORD **)v1;
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v1 + 168));
  v4 = v2[16];
  v3 = v2[17];
  v5 = v2[15];
  if (v0)
  {
    swift_errorRelease(v0);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    v6 = v2[19];
    v7 = v2[20];
    v8 = sub_1A21C;
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v4 + 8))(v2[17], v2[15]);
    v6 = v2[19];
    v7 = v2[20];
    v8 = sub_F834;
  }
  return swift_task_switch(v8, v6, v7);
}

uint64_t sub_F834()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t *v23;

  v1 = 0xD000000000000026;
  v3 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 112);
  v5 = *(_QWORD *)(v0 + 88);
  v4 = *(_QWORD *)(v0 + 96);
  v6 = swift_release(*(_QWORD *)(v0 + 144));
  v7 = Handle.rawValue.getter(v6);
  v9 = v8;
  *(_QWORD *)(v0 + 16) = v7;
  *(_QWORD *)(v0 + 24) = v8;
  *(_QWORD *)(v0 + 32) = 31085;
  *(_QWORD *)(v0 + 40) = 0xE200000000000000;
  v10 = sub_19F28();
  v11 = StringProtocol.contains<A>(_:)(v0 + 32, &type metadata for String, &type metadata for String, v10, v10);
  swift_bridgeObjectRelease(v9);
  v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  if ((v11 & 1) != 0)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 104) + 8))(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 96));
    v13 = 0x80000000000383A0;
  }
  else
  {
    v15 = *(_QWORD *)(v0 + 104);
    v14 = *(_QWORD *)(v0 + 112);
    v16 = *(_QWORD *)(v0 + 96);
    v17 = Handle.rawValue.getter(v12);
    v19 = v18;
    *(_QWORD *)(v0 + 48) = v17;
    *(_QWORD *)(v0 + 56) = v18;
    *(_QWORD *)(v0 + 64) = 3355443;
    *(_QWORD *)(v0 + 72) = 0xE300000000000000;
    v20 = StringProtocol.contains<A>(_:)(v0 + 64, &type metadata for String, &type metadata for String, v10, v10);
    swift_bridgeObjectRelease(v19);
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
    if ((v20 & 1) == 0)
      v1 = 0;
    v13 = 0x80000000000383A0;
    if ((v20 & 1) == 0)
      v13 = 1;
  }
  v21 = *(_QWORD *)(v0 + 136);
  v22 = *(_QWORD *)(v0 + 112);
  v23 = *(unint64_t **)(v0 + 80);
  *v23 = v1;
  v23[1] = v13;
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_F9C8(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_FA2C;
  return v6(a1);
}

uint64_t sub_FA2C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_FA78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  *(_QWORD *)(v6 + 56) = v5;
  v12 = type metadata accessor for ContinuousClock.Instant(0);
  *(_QWORD *)(v6 + 64) = v12;
  v13 = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v6 + 72) = v13;
  v14 = (*(_QWORD *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  *(_QWORD *)(v6 + 80) = swift_task_alloc(v14);
  *(_QWORD *)(v6 + 88) = swift_task_alloc(v14);
  *(_QWORD *)(v6 + 40) = a1;
  *(_QWORD *)(v6 + 48) = a2;
  *(_QWORD *)(v6 + 16) = a3;
  *(_QWORD *)(v6 + 24) = a4;
  *(_BYTE *)(v6 + 32) = a5 & 1;
  return swift_task_switch(sub_FB1C, 0, 0);
}

uint64_t sub_FB1C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  _QWORD *v8;

  v1 = v0[10];
  v2 = v0[8];
  v3 = v0[9];
  v4 = type metadata accessor for ContinuousClock(0);
  v5 = sub_19D7C(&qword_41068, (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock, (uint64_t)&protocol conformance descriptor for ContinuousClock);
  dispatch thunk of Clock.now.getter(v4, v5);
  v6 = sub_19D7C(&qword_41070, (uint64_t (*)(uint64_t))&type metadata accessor for ContinuousClock.Instant, (uint64_t)&protocol conformance descriptor for ContinuousClock.Instant);
  dispatch thunk of InstantProtocol.advanced(by:)(v0 + 5, v2, v6);
  v7 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v7;
  v7(v1, v2);
  v8 = (_QWORD *)swift_task_alloc(async function pointer to dispatch thunk of Clock.sleep(until:tolerance:)[1]);
  v0[13] = v8;
  *v8 = v0;
  v8[1] = sub_FC34;
  return dispatch thunk of Clock.sleep(until:tolerance:)(v0[11], v0 + 2, v4, v5);
}

uint64_t sub_FC34()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v3 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  v2 = *(_QWORD *)(*v1 + 104);
  v4 = *(_QWORD *)(*v1 + 88);
  v5 = *(_QWORD *)(*v1 + 64);
  v6 = *v1;
  *(_QWORD *)(v6 + 112) = v0;
  swift_task_dealloc(v2);
  v3(v4, v5);
  if (v0)
    return swift_task_switch(sub_FCE0, 0, 0);
  v8 = *(_QWORD *)(v6 + 80);
  swift_task_dealloc(*(_QWORD *)(v6 + 88));
  swift_task_dealloc(v8);
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t sub_FCE0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 80);
  swift_task_dealloc(*(_QWORD *)(v0 + 88));
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_FD1C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_FDEC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_191FC((uint64_t)v12, *a3);
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
      sub_191FC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  __swift_destroy_boxed_opaque_existential_0(v12);
  return v7;
}

uint64_t sub_FDEC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_FFA4(a5, a6);
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

uint64_t sub_FFA4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_10038(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
    v2 = sub_10210(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_10210(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_10038(uint64_t a1, unint64_t a2)
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
      v5 = sub_101AC(v4, 0);
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

_QWORD *sub_101AC(uint64_t a1, uint64_t a2)
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_40F50);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = _swift_stdlib_malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10210(char a1, int64_t a2, char a3, char *a4)
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
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_40F50);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = _swift_stdlib_malloc_size(v11);
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

unint64_t sub_1035C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = NSObject._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_103F8(a1, v4);
}

unint64_t sub_1038C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = v1;
  v4 = *(_QWORD *)(v2 + 40);
  v5 = type metadata accessor for Handle(0);
  v6 = sub_19D7C(&qword_41020, (uint64_t (*)(uint64_t))&type metadata accessor for Handle, (uint64_t)&protocol conformance descriptor for Handle);
  v7 = dispatch thunk of Hashable._rawHashValue(seed:)(v4, v5, v6);
  return sub_10510(a1, v7);
}

unint64_t sub_103F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  id v6;
  char v7;
  uint64_t v8;
  id v9;
  char v10;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    sub_19330(0, &qword_40F78, CNComposeRecipient_ptr);
    v6 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    v7 = static NSObject.== infix(_:_:)();

    if ((v7 & 1) == 0)
    {
      v8 = ~v4;
      for (i = (i + 1) & v8; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v8)
      {
        v9 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v10 = static NSObject.== infix(_:_:)();

        if ((v10 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

unint64_t sub_10510(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  uint64_t v14;
  char v15;
  uint64_t v17;
  uint64_t v18;

  v3 = v2;
  v18 = a1;
  v5 = type metadata accessor for Handle(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(_QWORD *)(v3 + 48) + v12 * v10, v5);
      v14 = sub_19D7C(&qword_41048, (uint64_t (*)(uint64_t))&type metadata accessor for Handle, (uint64_t)&protocol conformance descriptor for Handle);
      v15 = dispatch thunk of static Equatable.== infix(_:_:)(v8, v18, v5, v14);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v15 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

uint64_t sub_10650(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t result;
  int64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  _QWORD *v25;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  void (*v31)(char *, unint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  void (*v37)(char *, unint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  char v44;
  unint64_t v45;
  BOOL v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  int64_t v51;
  _QWORD *v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  int64_t v58;
  char *v59;
  uint64_t v60;

  v3 = v2;
  v6 = type metadata accessor for Handle(0);
  v7 = *(_QWORD **)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v2;
  if (*(_QWORD *)(*v2 + 24) > a1)
    a1 = *(_QWORD *)(*v2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_41018);
  v56 = a2;
  v11 = static _DictionaryStorage.resize(original:capacity:move:)(v10, a1, a2);
  v12 = v11;
  if (!*(_QWORD *)(v10 + 16))
    goto LABEL_43;
  v59 = v9;
  v13 = 1 << *(_BYTE *)(v10 + 32);
  v14 = *(_QWORD *)(v10 + 64);
  v52 = (_QWORD *)(v10 + 64);
  if (v13 < 64)
    v15 = ~(-1 << v13);
  else
    v15 = -1;
  v16 = v15 & v14;
  v50 = v2;
  v51 = (unint64_t)(v13 + 63) >> 6;
  v17 = v11 + 64;
  result = swift_retain(v10);
  v19 = 0;
  v53 = v10;
  v54 = v7;
  v60 = v6;
  v55 = v12;
  while (1)
  {
    if (v16)
    {
      v22 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v23 = v22 | (v19 << 6);
      goto LABEL_24;
    }
    v24 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v24 >= v51)
      break;
    v25 = v52;
    v26 = v52[v24];
    ++v19;
    if (!v26)
    {
      v19 = v24 + 1;
      if (v24 + 1 >= v51)
        goto LABEL_36;
      v26 = v52[v19];
      if (!v26)
      {
        v27 = v24 + 2;
        if (v27 >= v51)
        {
LABEL_36:
          swift_release(v10);
          v3 = v50;
          if ((v56 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v26 = v52[v27];
        if (!v26)
        {
          while (1)
          {
            v19 = v27 + 1;
            if (__OFADD__(v27, 1))
              goto LABEL_45;
            if (v19 >= v51)
              goto LABEL_36;
            v26 = v52[v19];
            ++v27;
            if (v26)
              goto LABEL_23;
          }
        }
        v19 = v27;
      }
    }
LABEL_23:
    v16 = (v26 - 1) & v26;
    v23 = __clz(__rbit64(v26)) + (v19 << 6);
LABEL_24:
    v28 = v7[9];
    v29 = *(_QWORD *)(v10 + 48) + v28 * v23;
    v30 = 32 * v23;
    v58 = v19;
    if ((v56 & 1) != 0)
    {
      v31 = (void (*)(char *, unint64_t, uint64_t))v7[4];
      v32 = v60;
      v31(v59, v29, v60);
      v33 = *(_QWORD *)(v10 + 56) + v30;
      v34 = *(_QWORD *)(v33 + 8);
      v57 = *(_QWORD *)v33;
      v35 = *(_QWORD *)(v33 + 16);
      v36 = *(_BYTE *)(v33 + 24);
    }
    else
    {
      v37 = (void (*)(char *, unint64_t, uint64_t))v7[2];
      v32 = v60;
      v37(v59, v29, v60);
      v38 = *(_QWORD *)(v10 + 56) + v30;
      v34 = *(_QWORD *)(v38 + 8);
      v35 = *(_QWORD *)(v38 + 16);
      v36 = *(_BYTE *)(v38 + 24);
      v57 = *(_QWORD *)v38;
      sub_18DEC(v57, v34, v35, v36);
    }
    v12 = v55;
    v39 = *(_QWORD *)(v55 + 40);
    v40 = sub_19D7C(&qword_41020, (uint64_t (*)(uint64_t))&type metadata accessor for Handle, (uint64_t)&protocol conformance descriptor for Handle);
    result = dispatch thunk of Hashable._rawHashValue(seed:)(v39, v32, v40);
    v41 = -1 << *(_BYTE *)(v12 + 32);
    v42 = result & ~v41;
    v43 = v42 >> 6;
    if (((-1 << v42) & ~*(_QWORD *)(v17 + 8 * (v42 >> 6))) != 0)
    {
      v20 = __clz(__rbit64((-1 << v42) & ~*(_QWORD *)(v17 + 8 * (v42 >> 6)))) | v42 & 0x7FFFFFFFFFFFFFC0;
      v7 = v54;
    }
    else
    {
      v44 = 0;
      v45 = (unint64_t)(63 - v41) >> 6;
      v7 = v54;
      do
      {
        if (++v43 == v45 && (v44 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v46 = v43 == v45;
        if (v43 == v45)
          v43 = 0;
        v44 |= v46;
        v47 = *(_QWORD *)(v17 + 8 * v43);
      }
      while (v47 == -1);
      v20 = __clz(__rbit64(~v47)) + (v43 << 6);
    }
    *(_QWORD *)(v17 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    result = ((uint64_t (*)(unint64_t, char *, uint64_t))v7[4])(*(_QWORD *)(v12 + 48) + v28 * v20, v59, v60);
    v21 = *(_QWORD *)(v12 + 56) + 32 * v20;
    v19 = v58;
    *(_QWORD *)v21 = v57;
    *(_QWORD *)(v21 + 8) = v34;
    *(_QWORD *)(v21 + 16) = v35;
    *(_BYTE *)(v21 + 24) = v36;
    ++*(_QWORD *)(v12 + 16);
    v10 = v53;
  }
  swift_release(v10);
  v3 = v50;
  v25 = v52;
  if ((v56 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v48 = 1 << *(_BYTE *)(v10 + 32);
  if (v48 >= 64)
    bzero(v25, ((unint64_t)(v48 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v25 = -1 << v48;
  *(_QWORD *)(v10 + 16) = 0;
LABEL_43:
  result = swift_release(v10);
  *v3 = v12;
  return result;
}

Swift::Int sub_10A40(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  id v35;
  uint64_t v36;
  uint64_t *v37;
  int64_t v38;
  _QWORD *v39;
  char v40;

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_40FA8);
  v40 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (*(_QWORD *)(v5 + 16))
  {
    v37 = v3;
    v9 = 1 << *(_BYTE *)(v5 + 32);
    v39 = (_QWORD *)(v5 + 64);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v38 = (unint64_t)(v9 + 63) >> 6;
    v12 = v7 + 64;
    result = swift_retain(v5);
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v20 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v21 = v20 | (v14 << 6);
      }
      else
      {
        v22 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
          return result;
        }
        if (v22 >= v38)
          goto LABEL_36;
        v23 = v39[v22];
        ++v14;
        if (!v23)
        {
          v14 = v22 + 1;
          if (v22 + 1 >= v38)
            goto LABEL_36;
          v23 = v39[v14];
          if (!v23)
          {
            v24 = v22 + 2;
            if (v24 >= v38)
            {
LABEL_36:
              swift_release(v5);
              v3 = v37;
              if ((v40 & 1) != 0)
              {
                v36 = 1 << *(_BYTE *)(v5 + 32);
                if (v36 >= 64)
                  bzero(v39, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v39 = -1 << v36;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v23 = v39[v24];
            if (!v23)
            {
              while (1)
              {
                v14 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_43;
                if (v14 >= v38)
                  goto LABEL_36;
                v23 = v39[v14];
                ++v24;
                if (v23)
                  goto LABEL_33;
              }
            }
            v14 = v24;
          }
        }
LABEL_33:
        v11 = (v23 - 1) & v23;
        v21 = __clz(__rbit64(v23)) + (v14 << 6);
      }
      v29 = *(void **)(*(_QWORD *)(v5 + 48) + 8 * v21);
      v30 = *(_QWORD *)(v5 + 56) + 32 * v21;
      v31 = *(_QWORD *)v30;
      v32 = *(_QWORD *)(v30 + 8);
      v33 = *(_QWORD *)(v30 + 16);
      v34 = *(_BYTE *)(v30 + 24);
      if ((v40 & 1) == 0)
      {
        v35 = v29;
        sub_18DEC(v31, v32, v33, v34);
      }
      result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v8 + 40));
      v15 = -1 << *(_BYTE *)(v8 + 32);
      v16 = result & ~v15;
      v17 = v16 >> 6;
      if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
      {
        v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_42;
          }
          v27 = v17 == v26;
          if (v17 == v26)
            v17 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v12 + 8 * v17);
        }
        while (v28 == -1);
        v18 = __clz(__rbit64(~v28)) + (v17 << 6);
      }
      *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      *(_QWORD *)(*(_QWORD *)(v8 + 48) + 8 * v18) = v29;
      v19 = *(_QWORD *)(v8 + 56) + 32 * v18;
      *(_QWORD *)v19 = v31;
      *(_QWORD *)(v19 + 8) = v32;
      *(_QWORD *)(v19 + 16) = v33;
      *(_BYTE *)(v19 + 24) = v34;
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

Swift::Int sub_10D3C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  Swift::Int result;
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
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_40F80);
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v3;
  v37 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v12 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 64;
  result = swift_retain(v5);
  v15 = 0;
  while (1)
  {
    if (v11)
    {
      v21 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v22 = v21 | (v15 << 6);
      goto LABEL_34;
    }
    v23 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v23 >= v12)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v37 + 8 * v23);
    ++v15;
    if (!v25)
    {
      v15 = v23 + 1;
      if (v23 + 1 >= v12)
        goto LABEL_36;
      v25 = *(_QWORD *)(v37 + 8 * v15);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v12)
        {
LABEL_36:
          swift_release(v5);
          v3 = v36;
          if ((a2 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v25 = *(_QWORD *)(v37 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v15 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_45;
            if (v15 >= v12)
              goto LABEL_36;
            v25 = *(_QWORD *)(v37 + 8 * v15);
            ++v26;
            if (v25)
              goto LABEL_33;
          }
        }
        v15 = v26;
      }
    }
LABEL_33:
    v11 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v15 << 6);
LABEL_34:
    v31 = 8 * v22;
    v32 = *(void **)(*(_QWORD *)(v5 + 48) + v31);
    v33 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v31);
    if ((a2 & 1) == 0)
    {
      v34 = v32;
      swift_retain(v33);
    }
    result = NSObject._rawHashValue(seed:)(*(_QWORD *)(v8 + 40));
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
          goto LABEL_44;
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
  swift_release(v5);
  v3 = v36;
  v24 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v24, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

uint64_t sub_11010(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t result;
  int64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  int64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;

  v5 = type metadata accessor for Handle(0);
  v45 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = v2;
  v8 = *v2;
  if (*(_QWORD *)(*v2 + 24) > a1)
    a1 = *(_QWORD *)(*v2 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_410F8);
  v9 = static _DictionaryStorage.resize(original:capacity:move:)(v8, a1, a2);
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
  {
    result = swift_release(v8);
    v38 = v41;
LABEL_44:
    *v38 = v10;
    return result;
  }
  v11 = 1 << *(_BYTE *)(v8 + 32);
  v12 = *(_QWORD *)(v8 + 64);
  v43 = (_QWORD *)(v8 + 64);
  if (v11 < 64)
    v13 = ~(-1 << v11);
  else
    v13 = -1;
  v14 = v13 & v12;
  v42 = (unint64_t)(v11 + 63) >> 6;
  v15 = v9 + 64;
  result = swift_retain(v8);
  v17 = 0;
  HIDWORD(v40) = a2;
  v18 = 16;
  if ((a2 & 1) != 0)
    v18 = 32;
  v44 = v18;
  while (1)
  {
    if (v14)
    {
      v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v21 = v20 | (v17 << 6);
      goto LABEL_26;
    }
    v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_45:
      __break(1u);
      goto LABEL_46;
    }
    if (v22 >= v42)
    {
      swift_release(v8);
      v38 = v41;
      v23 = v43;
      if ((v40 & 0x100000000) != 0)
      {
LABEL_39:
        v39 = 1 << *(_BYTE *)(v8 + 32);
        if (v39 >= 64)
          bzero(v23, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
        else
          *v23 = -1 << v39;
        *(_QWORD *)(v8 + 16) = 0;
      }
LABEL_43:
      result = swift_release(v8);
      goto LABEL_44;
    }
    v23 = v43;
    v24 = v43[v22];
    ++v17;
    if (!v24)
    {
      v17 = v22 + 1;
      if (v22 + 1 >= v42)
        goto LABEL_36;
      v24 = v43[v17];
      if (!v24)
        break;
    }
LABEL_25:
    v14 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_26:
    v26 = *(_QWORD *)(v45 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v45 + v44))(v7, *(_QWORD *)(v8 + 48) + v26 * v21, v5);
    v27 = v8;
    v28 = *(_BYTE *)(*(_QWORD *)(v8 + 56) + v21);
    v29 = *(_QWORD *)(v10 + 40);
    v30 = sub_19D7C(&qword_41020, (uint64_t (*)(uint64_t))&type metadata accessor for Handle, (uint64_t)&protocol conformance descriptor for Handle);
    result = dispatch thunk of Hashable._rawHashValue(seed:)(v29, v5, v30);
    v31 = -1 << *(_BYTE *)(v10 + 32);
    v32 = result & ~v31;
    v33 = v32 >> 6;
    if (((-1 << v32) & ~*(_QWORD *)(v15 + 8 * (v32 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v32) & ~*(_QWORD *)(v15 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v34 = 0;
      v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_45;
        }
        v36 = v33 == v35;
        if (v33 == v35)
          v33 = 0;
        v34 |= v36;
        v37 = *(_QWORD *)(v15 + 8 * v33);
      }
      while (v37 == -1);
      v19 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(_QWORD *)(v15 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v45 + 32))(*(_QWORD *)(v10 + 48) + v26 * v19, v7, v5);
    *(_BYTE *)(*(_QWORD *)(v10 + 56) + v19) = v28;
    ++*(_QWORD *)(v10 + 16);
    v8 = v27;
  }
  v25 = v22 + 2;
  if (v25 >= v42)
  {
LABEL_36:
    swift_release(v8);
    v38 = v41;
    if ((v40 & 0x100000000) != 0)
      goto LABEL_39;
    goto LABEL_43;
  }
  v24 = v43[v25];
  if (v24)
  {
    v17 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v17 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v17 >= v42)
      goto LABEL_36;
    v24 = v43[v17];
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_46:
  __break(1u);
  return result;
}

uint64_t sub_113AC(uint64_t a1, uint64_t (*a2)(char *, unint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v4;
  char v6;
  unsigned int v7;
  unint64_t v8;
  unint64_t v9;
  size_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;

  v4 = v2;
  v6 = *(_BYTE *)(a1 + 32);
  v7 = v6 & 0x3F;
  v8 = (1 << v6) + 63;
  v9 = v8 >> 6;
  v10 = 8 * (v8 >> 6);
  if (v7 <= 0xD || (swift_stdlib_isStackAllocationSafe(8 * (v8 >> 6), 8) & 1) != 0)
  {
    __chkstk_darwin();
    bzero((char *)&v14 - ((v10 + 15) & 0x3FFFFFFFFFFFFFF0), v10);
    v11 = a2((char *)&v14 - ((v10 + 15) & 0x3FFFFFFFFFFFFFF0), v9, a1);
    if (v2)
      swift_willThrow(v11);
    else
      return v11;
  }
  else
  {
    v12 = (void *)swift_slowAlloc(v10, -1);
    bzero(v12, v10);
    v4 = a2((char *)v12, v9, a1);
    swift_slowDealloc(v12, -1, -1);
  }
  return v4;
}

uint64_t sub_11508(uint64_t isStackAllocationSafe, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  char v7;
  unsigned int v8;
  unint64_t v9;
  uint64_t v10;
  size_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;

  v6 = isStackAllocationSafe;
  v7 = *(_BYTE *)(isStackAllocationSafe + 32);
  v8 = v7 & 0x3F;
  v9 = (1 << v7) + 63;
  v10 = v9 >> 6;
  v11 = 8 * (v9 >> 6);
  if (v8 <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(8 * (v9 >> 6), 8), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v15 - ((v11 + 15) & 0x3FFFFFFFFFFFFFF0), v11);
    v12 = sub_120A4((unint64_t *)((char *)&v15 - ((v11 + 15) & 0x3FFFFFFFFFFFFFF0)), v10, v6, a2, a3);
    if (v3)
      swift_willThrow(v12);
    else
      return v12;
  }
  else
  {
    v13 = (void *)swift_slowAlloc(v11, -1);
    bzero(v13, v11);
    a2 = sub_120A4((unint64_t *)v13, v10, v6, a2, a3);
    swift_slowDealloc(v13, -1, -1);
  }
  return a2;
}

uint64_t sub_11678(uint64_t result, uint64_t a2, uint64_t a3)
{
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  unint64_t *v23;
  uint64_t v24;
  int64_t v25;

  v23 = (unint64_t *)result;
  v4 = 0;
  v5 = a3 + 64;
  v6 = 1 << *(_BYTE *)(a3 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(a3 + 64);
  v25 = (unint64_t)(v6 + 63) >> 6;
  while (v8)
  {
    v9 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    v10 = v9 | (v4 << 6);
LABEL_20:
    v14 = *(_QWORD *)(a3 + 56) + 32 * v10;
    v15 = *(_QWORD *)v14;
    v16 = *(_QWORD *)(v14 + 8);
    v17 = *(_QWORD *)(v14 + 16);
    v18 = *(unsigned __int8 *)(v14 + 24);
    v19 = v17 | v16 | *(_QWORD *)v14;
    if (v18 >= 2 && v19 == 0)
    {
      sub_18E20(0, 0, 0, 2);
      result = sub_18E20(0, 0, 0, 2);
      *(unint64_t *)((char *)v23 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
      if (__OFADD__(v24++, 1))
      {
        __break(1u);
        return sub_125F8(v23, a2, v24, a3);
      }
    }
    else
    {
      sub_18DEC(v15, v16, v17, v18);
      sub_18E20(v15, v16, v17, v18);
      result = sub_18E20(0, 0, 0, 2);
    }
  }
  v11 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
    goto LABEL_30;
  }
  if (v11 >= v25)
    return sub_125F8(v23, a2, v24, a3);
  v12 = *(_QWORD *)(v5 + 8 * v11);
  ++v4;
  if (v12)
    goto LABEL_19;
  v4 = v11 + 1;
  if (v11 + 1 >= v25)
    return sub_125F8(v23, a2, v24, a3);
  v12 = *(_QWORD *)(v5 + 8 * v4);
  if (v12)
    goto LABEL_19;
  v4 = v11 + 2;
  if (v11 + 2 >= v25)
    return sub_125F8(v23, a2, v24, a3);
  v12 = *(_QWORD *)(v5 + 8 * v4);
  if (v12)
  {
LABEL_19:
    v8 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v4 << 6);
    goto LABEL_20;
  }
  v13 = v11 + 3;
  if (v13 >= v25)
    return sub_125F8(v23, a2, v24, a3);
  v12 = *(_QWORD *)(v5 + 8 * v13);
  if (v12)
  {
    v4 = v13;
    goto LABEL_19;
  }
  while (1)
  {
    v4 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v4 >= v25)
      return sub_125F8(v23, a2, v24, a3);
    v12 = *(_QWORD *)(v5 + 8 * v4);
    ++v13;
    if (v12)
      goto LABEL_19;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1189C(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  char *v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  BOOL v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  _QWORD *v25;
  void (*v26)(char *, unint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  int64_t v47;
  unint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  int64_t v57;

  v43 = a2;
  v44 = a1;
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_41010);
  v4 = __chkstk_darwin(v54);
  v53 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __chkstk_darwin(v4);
  v52 = (char *)&v42 - v7;
  __chkstk_darwin(v6);
  v9 = (char *)&v42 - v8;
  v10 = type metadata accessor for Handle(0);
  v11 = *(_QWORD *)(v10 - 8);
  result = __chkstk_darwin(v10);
  v14 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = 0;
  v55 = (_QWORD *)a3;
  v16 = *(_QWORD *)(a3 + 64);
  v45 = 0;
  v46 = a3 + 64;
  v17 = 1 << *(_BYTE *)(a3 + 32);
  v18 = -1;
  if (v17 < 64)
    v18 = ~(-1 << v17);
  v19 = v18 & v16;
  v47 = (unint64_t)(v17 + 63) >> 6;
  v50 = v9;
  v51 = v11;
  v49 = v14;
  while (v19)
  {
    v56 = (v19 - 1) & v19;
    v57 = v15;
    v20 = __clz(__rbit64(v19)) | (v15 << 6);
LABEL_18:
    v25 = v55;
    v26 = *(void (**)(char *, unint64_t, uint64_t))(v11 + 16);
    v26(v14, v55[6] + *(_QWORD *)(v11 + 72) * v20, v10);
    v27 = v25[7];
    v48 = v20;
    v28 = v27 + 32 * v20;
    v29 = *(_QWORD *)v28;
    v30 = *(_QWORD *)(v28 + 8);
    v31 = *(_QWORD *)(v28 + 16);
    v32 = *(unsigned __int8 *)(v28 + 24);
    v26(v9, (unint64_t)v14, v10);
    v33 = v9;
    v34 = v54;
    v35 = &v33[*(int *)(v54 + 48)];
    *(_QWORD *)v35 = v29;
    *((_QWORD *)v35 + 1) = v30;
    *((_QWORD *)v35 + 2) = v31;
    v35[24] = v32;
    v36 = v10;
    v37 = v52;
    ((void (*)(char *))v26)(v52);
    v38 = *(int *)(v34 + 48);
    v39 = (uint64_t)v53;
    v40 = &v53[v38];
    v41 = v37;
    v10 = v36;
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v53, v41, v36);
    *(_QWORD *)v40 = v29;
    *((_QWORD *)v40 + 1) = v30;
    *((_QWORD *)v40 + 2) = v31;
    v40[24] = v32;
    if (v32 == 1)
    {
      sub_18DEC(v29, v30, v31, 1);
      sub_18DEC(v29, v30, v31, 1);
      sub_18DEC(v29, v30, v31, 1);
      sub_1A198(v39, &qword_41010);
      v9 = v50;
      sub_1A198((uint64_t)v50, &qword_41010);
      sub_18E20(v29, v30, v31, 1);
      v11 = v51;
      v14 = v49;
      result = (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v49, v10);
      v15 = v57;
      v19 = v56;
      if ((v29 & 1) == 0)
      {
        *(unint64_t *)((char *)v44 + ((v48 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v48;
        v21 = __OFADD__(v45++, 1);
        if (v21)
          goto LABEL_30;
      }
    }
    else
    {
      sub_18DEC(v29, v30, v31, v32);
      sub_18DEC(v29, v30, v31, v32);
      sub_18DEC(v29, v30, v31, v32);
      sub_1A198(v39, &qword_41010);
      v9 = v50;
      sub_1A198((uint64_t)v50, &qword_41010);
      sub_18E20(v29, v30, v31, v32);
      v11 = v51;
      v14 = v49;
      result = (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v49, v10);
      v15 = v57;
      v19 = v56;
    }
  }
  v21 = __OFADD__(v15, 1);
  v22 = v15 + 1;
  if (v21)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v22 >= v47)
    return sub_128B8(v44, v43, v45, v55);
  v23 = *(_QWORD *)(v46 + 8 * v22);
  if (v23)
  {
LABEL_17:
    v56 = (v23 - 1) & v23;
    v57 = v22;
    v20 = __clz(__rbit64(v23)) + (v22 << 6);
    goto LABEL_18;
  }
  v24 = v22 + 1;
  if (v22 + 1 >= v47)
    return sub_128B8(v44, v43, v45, v55);
  v23 = *(_QWORD *)(v46 + 8 * v24);
  if (v23)
    goto LABEL_16;
  v24 = v22 + 2;
  if (v22 + 2 >= v47)
    return sub_128B8(v44, v43, v45, v55);
  v23 = *(_QWORD *)(v46 + 8 * v24);
  if (v23)
    goto LABEL_16;
  v24 = v22 + 3;
  if (v22 + 3 >= v47)
    return sub_128B8(v44, v43, v45, v55);
  v23 = *(_QWORD *)(v46 + 8 * v24);
  if (v23)
  {
LABEL_16:
    v22 = v24;
    goto LABEL_17;
  }
  while (1)
  {
    v22 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v22 >= v47)
      return sub_128B8(v44, v43, v45, v55);
    v23 = *(_QWORD *)(v46 + 8 * v22);
    ++v24;
    if (v23)
      goto LABEL_17;
  }
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_11CEC(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  void (*v20)(char *, unint64_t, uint64_t);
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  int64_t v34;
  unint64_t v35;
  int64_t v36;
  uint64_t v37;
  uint64_t v39;
  unint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  int64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  char *v47;
  uint64_t v48;
  unint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  int64_t v52;
  char *v53;
  uint64_t v54;

  v39 = a2;
  v40 = a1;
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_41010);
  v4 = __chkstk_darwin(v48);
  v47 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __chkstk_darwin(v4);
  v46 = (char *)&v39 - v7;
  __chkstk_darwin(v6);
  v45 = (char *)&v39 - v8;
  v44 = type metadata accessor for Handle(0);
  v54 = *(_QWORD *)(v44 - 8);
  result = __chkstk_darwin(v44);
  v53 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = 0;
  v50 = (_QWORD *)a3;
  v12 = *(_QWORD *)(a3 + 64);
  v41 = 0;
  v42 = a3 + 64;
  v13 = 1 << *(_BYTE *)(a3 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & v12;
  v43 = (unint64_t)(v13 + 63) >> 6;
  v16 = v44;
  v17 = (uint64_t)v45;
  while (1)
  {
    if (v15)
    {
      v51 = (v15 - 1) & v15;
      v52 = v11;
      v18 = __clz(__rbit64(v15)) | (v11 << 6);
      goto LABEL_5;
    }
    v34 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v34 >= v43)
      return sub_128B8(v40, v39, v41, v50);
    v35 = *(_QWORD *)(v42 + 8 * v34);
    v36 = v11 + 1;
    if (!v35)
    {
      v36 = v11 + 2;
      if (v11 + 2 >= v43)
        return sub_128B8(v40, v39, v41, v50);
      v35 = *(_QWORD *)(v42 + 8 * v36);
      if (!v35)
      {
        v36 = v11 + 3;
        if (v11 + 3 >= v43)
          return sub_128B8(v40, v39, v41, v50);
        v35 = *(_QWORD *)(v42 + 8 * v36);
        if (!v35)
          break;
      }
    }
LABEL_20:
    v51 = (v35 - 1) & v35;
    v52 = v36;
    v18 = __clz(__rbit64(v35)) + (v36 << 6);
LABEL_5:
    v19 = v50;
    v20 = *(void (**)(char *, unint64_t, uint64_t))(v54 + 16);
    v21 = v53;
    v20(v53, v50[6] + *(_QWORD *)(v54 + 72) * v18, v16);
    v22 = v19[7];
    v49 = v18;
    v23 = v22 + 32 * v18;
    v25 = *(_QWORD *)v23;
    v24 = *(_QWORD *)(v23 + 8);
    v26 = *(_QWORD *)(v23 + 16);
    v27 = *(unsigned __int8 *)(v23 + 24);
    v20((char *)v17, (unint64_t)v21, v16);
    v28 = v48;
    v29 = v17 + *(int *)(v48 + 48);
    *(_QWORD *)v29 = v25;
    *(_QWORD *)(v29 + 8) = v24;
    *(_QWORD *)(v29 + 16) = v26;
    *(_BYTE *)(v29 + 24) = v27;
    v30 = v46;
    v20(v46, v17, v16);
    v31 = *(int *)(v28 + 48);
    v32 = (uint64_t)v47;
    v33 = &v47[v31];
    (*(void (**)(char *, char *, uint64_t))(v54 + 32))(v47, v30, v16);
    *(_QWORD *)v33 = v25;
    *((_QWORD *)v33 + 1) = v24;
    *((_QWORD *)v33 + 2) = v26;
    v33[24] = v27;
    sub_18DEC(v25, v24, v26, v27);
    sub_18DEC(v25, v24, v26, v27);
    sub_18DEC(v25, v24, v26, v27);
    sub_1A198(v32, &qword_41010);
    sub_1A198(v17, &qword_41010);
    sub_18E20(v25, v24, v26, v27);
    result = (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v53, v16);
    v15 = v51;
    v11 = v52;
    if (!v27)
    {
      *(unint64_t *)((char *)v40 + ((v49 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v49;
      if (__OFADD__(v41++, 1))
      {
        __break(1u);
        return sub_128B8(v40, v39, v41, v50);
      }
    }
  }
  v37 = v11 + 4;
  if (v11 + 4 >= v43)
    return sub_128B8(v40, v39, v41, v50);
  v35 = *(_QWORD *)(v42 + 8 * v37);
  if (v35)
  {
    v36 = v11 + 4;
    goto LABEL_20;
  }
  while (1)
  {
    v36 = v37 + 1;
    if (__OFADD__(v37, 1))
      break;
    if (v36 >= v43)
      return sub_128B8(v40, v39, v41, v50);
    v35 = *(_QWORD *)(v42 + 8 * v36);
    ++v37;
    if (v35)
      goto LABEL_20;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_120A4(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  char v30;
  uint64_t v31;
  unint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  int64_t v40;
  uint64_t v41[3];
  char v42;
  uint64_t v43;

  v36 = a4;
  v37 = a5;
  v31 = a2;
  v32 = a1;
  v6 = type metadata accessor for Handle(0);
  v7 = *(_QWORD *)(v6 - 8);
  result = __chkstk_darwin(v6);
  v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = 0;
  v38 = (_QWORD *)a3;
  v12 = *(_QWORD *)(a3 + 64);
  v33 = 0;
  v34 = a3 + 64;
  v13 = 1 << *(_BYTE *)(a3 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & v12;
  v35 = (unint64_t)(v13 + 63) >> 6;
  while (v15)
  {
    v39 = (v15 - 1) & v15;
    v40 = v11;
    v16 = __clz(__rbit64(v15)) | (v11 << 6);
LABEL_17:
    v21 = v38;
    (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v10, v38[6] + *(_QWORD *)(v7 + 72) * v16, v6);
    v22 = v21[7] + 32 * v16;
    v24 = *(_QWORD *)(v22 + 8);
    v25 = *(_QWORD *)(v22 + 16);
    v26 = v7;
    v27 = *(_BYTE *)(v22 + 24);
    v41[0] = *(_QWORD *)v22;
    v23 = v41[0];
    v41[1] = v24;
    v41[2] = v25;
    v42 = v27;
    sub_18DEC(v41[0], v24, v25, v27);
    v28 = v43;
    v29 = sub_E980((uint64_t)v10, (uint64_t)v41, v36, v37);
    v43 = v28;
    if (v28)
    {
      sub_18E20(v23, v24, v25, v27);
      return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v10, v6);
    }
    v30 = v29;
    sub_18E20(v23, v24, v25, v27);
    result = (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v10, v6);
    v7 = v26;
    v15 = v39;
    v11 = v40;
    if ((v30 & 1) != 0)
    {
      *(unint64_t *)((char *)v32 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      v17 = __OFADD__(v33++, 1);
      if (v17)
        goto LABEL_31;
    }
  }
  v17 = __OFADD__(v11, 1);
  v18 = v11 + 1;
  if (v17)
  {
    __break(1u);
    goto LABEL_30;
  }
  if (v18 >= v35)
    return sub_128B8(v32, v31, v33, v38);
  v19 = *(_QWORD *)(v34 + 8 * v18);
  if (v19)
  {
LABEL_16:
    v39 = (v19 - 1) & v19;
    v40 = v18;
    v16 = __clz(__rbit64(v19)) + (v18 << 6);
    goto LABEL_17;
  }
  v20 = v18 + 1;
  if (v18 + 1 >= v35)
    return sub_128B8(v32, v31, v33, v38);
  v19 = *(_QWORD *)(v34 + 8 * v20);
  if (v19)
    goto LABEL_15;
  v20 = v18 + 2;
  if (v18 + 2 >= v35)
    return sub_128B8(v32, v31, v33, v38);
  v19 = *(_QWORD *)(v34 + 8 * v20);
  if (v19)
    goto LABEL_15;
  v20 = v18 + 3;
  if (v18 + 3 >= v35)
    return sub_128B8(v32, v31, v33, v38);
  v19 = *(_QWORD *)(v34 + 8 * v20);
  if (v19)
  {
LABEL_15:
    v18 = v20;
    goto LABEL_16;
  }
  while (1)
  {
    v18 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v18 >= v35)
      return sub_128B8(v32, v31, v33, v38);
    v19 = *(_QWORD *)(v34 + 8 * v18);
    ++v20;
    if (v19)
      goto LABEL_16;
  }
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_1236C(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  void (*v19)(char *, unint64_t, uint64_t);
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v24;
  uint64_t v25;
  unint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  uint64_t v30;
  _QWORD *v31;

  v25 = a2;
  v26 = a1;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_410F0);
  __chkstk_darwin(v30);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Handle(0);
  v7 = *(_QWORD *)(v6 - 8);
  result = __chkstk_darwin(v6);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = 0;
  v31 = (_QWORD *)a3;
  v12 = *(_QWORD *)(a3 + 64);
  v27 = 0;
  v28 = a3 + 64;
  v13 = 1 << *(_BYTE *)(a3 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & v12;
  v29 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      v16 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v17 = v16 | (v11 << 6);
      goto LABEL_5;
    }
    v20 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v20 >= v29)
      return sub_12C60(v26, v25, v27, v31);
    v21 = *(_QWORD *)(v28 + 8 * v20);
    ++v11;
    if (!v21)
    {
      v11 = v20 + 1;
      if (v20 + 1 >= v29)
        return sub_12C60(v26, v25, v27, v31);
      v21 = *(_QWORD *)(v28 + 8 * v11);
      if (!v21)
      {
        v11 = v20 + 2;
        if (v20 + 2 >= v29)
          return sub_12C60(v26, v25, v27, v31);
        v21 = *(_QWORD *)(v28 + 8 * v11);
        if (!v21)
          break;
      }
    }
LABEL_20:
    v15 = (v21 - 1) & v21;
    v17 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_5:
    v18 = v31;
    v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    v19(v10, v31[6] + *(_QWORD *)(v7 + 72) * v17, v6);
    LOBYTE(v18) = *(_BYTE *)(v18[7] + v17);
    v19(v5, (unint64_t)v10, v6);
    v5[*(int *)(v30 + 48)] = (char)v18;
    sub_1A198((uint64_t)v5, &qword_410F0);
    result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    if ((v18 & 1) == 0)
    {
      *(unint64_t *)((char *)v26 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      if (__OFADD__(v27++, 1))
      {
        __break(1u);
        return sub_12C60(v26, v25, v27, v31);
      }
    }
  }
  v22 = v20 + 3;
  if (v22 >= v29)
    return sub_12C60(v26, v25, v27, v31);
  v21 = *(_QWORD *)(v28 + 8 * v22);
  if (v21)
  {
    v11 = v22;
    goto LABEL_20;
  }
  while (1)
  {
    v11 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v11 >= v29)
      return sub_12C60(v26, v25, v27, v31);
    v21 = *(_QWORD *)(v28 + 8 * v11);
    ++v22;
    if (v21)
      goto LABEL_20;
  }
LABEL_26:
  __break(1u);
  return result;
}

Swift::Int sub_125F8(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  Swift::Int result;
  Swift::Int v8;
  unint64_t v9;
  uint64_t v10;
  Swift::Int v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  Swift::Int v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;

  if (!a3)
    return (Swift::Int)&_swiftEmptyDictionarySingleton;
  v4 = a4;
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
  {
    swift_retain(a4);
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_40FA8);
  result = static _DictionaryStorage.allocate(capacity:)(v5);
  v8 = result;
  v36 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 64;
  v38 = v4;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v39 = v10;
      v13 = v12 | (v10 << 6);
    }
    else
    {
      v14 = v10 + 1;
      if (__OFADD__(v10, 1))
        goto LABEL_40;
      if (v14 >= v36)
        return v8;
      v15 = a1[v14];
      v16 = v10 + 1;
      if (!v15)
      {
        v16 = v10 + 2;
        if (v10 + 2 >= v36)
          return v8;
        v15 = a1[v16];
        if (!v15)
        {
          v16 = v10 + 3;
          if (v10 + 3 >= v36)
            return v8;
          v15 = a1[v16];
          if (!v15)
          {
            v17 = v10 + 4;
            if (v10 + 4 >= v36)
              return v8;
            v15 = a1[v17];
            if (!v15)
            {
              while (1)
              {
                v16 = v17 + 1;
                if (__OFADD__(v17, 1))
                  goto LABEL_41;
                if (v16 >= v36)
                  return v8;
                v15 = a1[v16];
                ++v17;
                if (v15)
                  goto LABEL_24;
              }
            }
            v16 = v10 + 4;
          }
        }
      }
LABEL_24:
      v9 = (v15 - 1) & v15;
      v39 = v16;
      v13 = __clz(__rbit64(v15)) + (v16 << 6);
    }
    v18 = *(void **)(*(_QWORD *)(v4 + 48) + 8 * v13);
    v19 = *(_QWORD *)(v4 + 56) + 32 * v13;
    v20 = *(_QWORD *)v19;
    v21 = *(_QWORD *)(v19 + 8);
    v22 = *(_QWORD *)(v19 + 16);
    v23 = *(_BYTE *)(v19 + 24);
    v24 = *(_QWORD *)(v8 + 40);
    v25 = v18;
    sub_18DEC(v20, v21, v22, v23);
    result = NSObject._rawHashValue(seed:)(v24);
    v26 = -1 << *(_BYTE *)(v8 + 32);
    v27 = result & ~v26;
    v28 = v27 >> 6;
    if (((-1 << v27) & ~*(_QWORD *)(v11 + 8 * (v27 >> 6))) != 0)
    {
      v29 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v30 = 0;
      v31 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v31 && (v30 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v32 = v28 == v31;
        if (v28 == v31)
          v28 = 0;
        v30 |= v32;
        v33 = *(_QWORD *)(v11 + 8 * v28);
      }
      while (v33 == -1);
      v29 = __clz(__rbit64(~v33)) + (v28 << 6);
    }
    *(_QWORD *)(v11 + ((v29 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v29;
    *(_QWORD *)(*(_QWORD *)(v8 + 48) + 8 * v29) = v25;
    v34 = *(_QWORD *)(v8 + 56) + 32 * v29;
    *(_QWORD *)v34 = v20;
    *(_QWORD *)(v34 + 8) = v21;
    *(_QWORD *)(v34 + 16) = v22;
    *(_BYTE *)(v34 + 24) = v23;
    ++*(_QWORD *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
      break;
    v4 = v38;
    v10 = v39;
    if (!v5)
      return v8;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_128B8(unint64_t *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  void (*v27)(char *, char *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char v35;
  unint64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t *v41;
  uint64_t v42;
  _QWORD *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;

  v41 = a1;
  v42 = a2;
  v52 = type metadata accessor for Handle(0);
  v45 = *(_QWORD *)(v52 - 8);
  v6 = __chkstk_darwin(v52);
  v51 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v44 = (char *)&v41 - v8;
  if (!a3)
    return (uint64_t)&_swiftEmptyDictionarySingleton;
  if (a4[2] == a3)
  {
    swift_retain(a4);
    return (uint64_t)a4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_41018);
  result = static _DictionaryStorage.allocate(capacity:)(a3);
  v50 = result;
  if (v42 < 1)
    v10 = 0;
  else
    v10 = *v41;
  v11 = 0;
  v12 = v50 + 64;
  v43 = a4;
  v13 = v52;
  while (1)
  {
    v49 = a3;
    if (v10)
    {
      v46 = (v10 - 1) & v10;
      v47 = v11;
      v14 = __clz(__rbit64(v10)) | (v11 << 6);
    }
    else
    {
      v15 = v11 + 1;
      if (__OFADD__(v11, 1))
        goto LABEL_40;
      if (v15 >= v42)
        return v50;
      v16 = v41[v15];
      v17 = v11 + 1;
      if (!v16)
      {
        v17 = v11 + 2;
        if (v11 + 2 >= v42)
          return v50;
        v16 = v41[v17];
        if (!v16)
        {
          v17 = v11 + 3;
          if (v11 + 3 >= v42)
            return v50;
          v16 = v41[v17];
          if (!v16)
          {
            v18 = v11 + 4;
            if (v11 + 4 >= v42)
              return v50;
            v16 = v41[v18];
            if (!v16)
            {
              while (1)
              {
                v17 = v18 + 1;
                if (__OFADD__(v18, 1))
                  goto LABEL_41;
                if (v17 >= v42)
                  return v50;
                v16 = v41[v17];
                ++v18;
                if (v16)
                  goto LABEL_24;
              }
            }
            v17 = v11 + 4;
          }
        }
      }
LABEL_24:
      v46 = (v16 - 1) & v16;
      v47 = v17;
      v14 = __clz(__rbit64(v16)) + (v17 << 6);
    }
    v19 = a4[6];
    v21 = v44;
    v20 = v45;
    v48 = *(_QWORD *)(v45 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v45 + 16))(v44, v19 + v48 * v14, v13);
    v22 = a4[7] + 32 * v14;
    v24 = *(_QWORD *)v22;
    v23 = *(_QWORD *)(v22 + 8);
    v25 = *(_QWORD *)(v22 + 16);
    v26 = *(_BYTE *)(v22 + 24);
    v27 = *(void (**)(char *, char *, uint64_t))(v20 + 32);
    v27(v51, v21, v13);
    v28 = v50;
    v29 = *(_QWORD *)(v50 + 40);
    sub_18DEC(v24, v23, v25, v26);
    v30 = sub_19D7C(&qword_41020, (uint64_t (*)(uint64_t))&type metadata accessor for Handle, (uint64_t)&protocol conformance descriptor for Handle);
    result = dispatch thunk of Hashable._rawHashValue(seed:)(v29, v13, v30);
    v31 = -1 << *(_BYTE *)(v28 + 32);
    v32 = result & ~v31;
    v33 = v32 >> 6;
    if (((-1 << v32) & ~*(_QWORD *)(v12 + 8 * (v32 >> 6))) != 0)
    {
      v34 = __clz(__rbit64((-1 << v32) & ~*(_QWORD *)(v12 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v35 = 0;
      v36 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v36 && (v35 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v37 = v33 == v36;
        if (v33 == v36)
          v33 = 0;
        v35 |= v37;
        v38 = *(_QWORD *)(v12 + 8 * v33);
      }
      while (v38 == -1);
      v34 = __clz(__rbit64(~v38)) + (v33 << 6);
    }
    *(_QWORD *)(v12 + ((v34 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v34;
    v39 = v50;
    result = ((uint64_t (*)(unint64_t, char *, uint64_t))v27)(*(_QWORD *)(v50 + 48) + v34 * v48, v51, v52);
    v40 = *(_QWORD *)(v39 + 56) + 32 * v34;
    *(_QWORD *)v40 = v24;
    *(_QWORD *)(v40 + 8) = v23;
    *(_QWORD *)(v40 + 16) = v25;
    *(_BYTE *)(v40 + 24) = v26;
    ++*(_QWORD *)(v39 + 16);
    a3 = v49 - 1;
    if (__OFSUB__(v49, 1))
      break;
    a4 = v43;
    v10 = v46;
    v11 = v47;
    if (v49 == 1)
      return v50;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_12C60(unint64_t *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, char *, uint64_t);
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  unint64_t *v41;
  _QWORD *v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;

  v41 = a1;
  v48 = type metadata accessor for Handle(0);
  v45 = *(_QWORD *)(v48 - 8);
  v7 = __chkstk_darwin(v48);
  v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v44 = (char *)&v39 - v10;
  if (!a3)
    return (uint64_t)&_swiftEmptyDictionarySingleton;
  if (a4[2] == a3)
  {
    swift_retain(a4);
    return (uint64_t)a4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_410F8);
  result = static _DictionaryStorage.allocate(capacity:)(a3);
  v12 = result;
  v40 = a2;
  if (a2 < 1)
    v13 = 0;
  else
    v13 = *v41;
  v14 = 0;
  v15 = result + 64;
  v42 = a4;
  v43 = v9;
  v16 = v44;
  v17 = v48;
  while (1)
  {
    if (v13)
    {
      v18 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v46 = v14;
      v19 = v18 | (v14 << 6);
    }
    else
    {
      v20 = v14 + 1;
      if (__OFADD__(v14, 1))
        goto LABEL_40;
      if (v20 >= v40)
        return v12;
      v21 = v41[v20];
      v22 = v14 + 1;
      if (!v21)
      {
        v22 = v14 + 2;
        if (v14 + 2 >= v40)
          return v12;
        v21 = v41[v22];
        if (!v21)
        {
          v22 = v14 + 3;
          if (v14 + 3 >= v40)
            return v12;
          v21 = v41[v22];
          if (!v21)
          {
            v23 = v14 + 4;
            if (v14 + 4 >= v40)
              return v12;
            v21 = v41[v23];
            if (!v21)
            {
              while (1)
              {
                v22 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_41;
                if (v22 >= v40)
                  return v12;
                v21 = v41[v22];
                ++v23;
                if (v21)
                  goto LABEL_24;
              }
            }
            v22 = v14 + 4;
          }
        }
      }
LABEL_24:
      v13 = (v21 - 1) & v21;
      v46 = v22;
      v19 = __clz(__rbit64(v21)) + (v22 << 6);
    }
    v24 = v45;
    v25 = *(_QWORD *)(v45 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v45 + 16))(v16, a4[6] + v25 * v19, v17);
    v47 = *(unsigned __int8 *)(a4[7] + v19);
    v26 = *(void (**)(char *, char *, uint64_t))(v24 + 32);
    v27 = v43;
    v26(v43, v16, v17);
    v28 = *(_QWORD *)(v12 + 40);
    v29 = sub_19D7C(&qword_41020, (uint64_t (*)(uint64_t))&type metadata accessor for Handle, (uint64_t)&protocol conformance descriptor for Handle);
    result = dispatch thunk of Hashable._rawHashValue(seed:)(v28, v17, v29);
    v30 = -1 << *(_BYTE *)(v12 + 32);
    v31 = result & ~v30;
    v32 = v31 >> 6;
    if (((-1 << v31) & ~*(_QWORD *)(v15 + 8 * (v31 >> 6))) != 0)
    {
      v33 = __clz(__rbit64((-1 << v31) & ~*(_QWORD *)(v15 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v34 = 0;
      v35 = (unint64_t)(63 - v30) >> 6;
      do
      {
        if (++v32 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v36 = v32 == v35;
        if (v32 == v35)
          v32 = 0;
        v34 |= v36;
        v37 = *(_QWORD *)(v15 + 8 * v32);
      }
      while (v37 == -1);
      v33 = __clz(__rbit64(~v37)) + (v32 << 6);
    }
    *(_QWORD *)(v15 + ((v33 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v33;
    result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(_QWORD *)(v12 + 48) + v33 * v25, v27, v48);
    *(_BYTE *)(*(_QWORD *)(v12 + 56) + v33) = v47;
    ++*(_QWORD *)(v12 + 16);
    if (__OFSUB__(a3--, 1))
      break;
    a4 = v42;
    v14 = v46;
    if (!a3)
      return v12;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_12FC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t result;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;

  v3 = v2;
  v6 = *v3;
  swift_bridgeObjectRetain(*v3);
  v7 = sub_1035C(a1);
  LOBYTE(a1) = v8;
  result = swift_bridgeObjectRelease(v6);
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v11 = *v3;
    v16 = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_13D20();
      v11 = v16;
    }

    v12 = *(_QWORD *)(v11 + 56) + 32 * v7;
    v13 = *(_QWORD *)(v12 + 16);
    v14 = *(_BYTE *)(v12 + 24);
    *(_OWORD *)a2 = *(_OWORD *)v12;
    *(_QWORD *)(a2 + 16) = v13;
    *(_BYTE *)(a2 + 24) = v14;
    sub_1341C(v7, v11);
    v15 = *v3;
    *v3 = v11;
    return swift_bridgeObjectRelease(v15);
  }
  else
  {
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
    *(_BYTE *)(a2 + 24) = -1;
  }
  return result;
}

uint64_t sub_130B0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  unint64_t v5;
  char v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v2 = v1;
  v4 = *v2;
  swift_bridgeObjectRetain(*v2);
  v5 = sub_1035C(a1);
  LOBYTE(a1) = v6;
  swift_bridgeObjectRelease(v4);
  if ((a1 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
  v8 = *v2;
  v12 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_13F08();
    v8 = v12;
  }

  v9 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v5);
  sub_135D4(v5, v8);
  v10 = *v2;
  *v2 = v8;
  swift_bridgeObjectRelease(v10);
  return v9;
}

unint64_t sub_13174(int64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _OWORD *v27;
  _OWORD *v28;
  __int128 v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *, unint64_t, uint64_t);
  unint64_t v38;
  uint64_t v39;

  v4 = type metadata accessor for Handle(0);
  v39 = *(_QWORD *)(v4 - 8);
  result = __chkstk_darwin(v4);
  v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = _HashTable.previousHole(before:)(a1, a2 + 64, ~v9);
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v38 = (result + 1) & v11;
      v12 = *(_QWORD *)(v39 + 72);
      v37 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 16);
      v13 = v11;
      do
      {
        v14 = v8;
        v15 = v12;
        v16 = v12 * v10;
        v17 = v13;
        v37(v7, *(_QWORD *)(a2 + 48) + v12 * v10, v4);
        v18 = *(_QWORD *)(a2 + 40);
        v19 = sub_19D7C(&qword_41020, (uint64_t (*)(uint64_t))&type metadata accessor for Handle, (uint64_t)&protocol conformance descriptor for Handle);
        v20 = dispatch thunk of Hashable._rawHashValue(seed:)(v18, v4, v19);
        result = (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v7, v4);
        v13 = v17;
        v21 = v20 & v17;
        if (a1 >= (uint64_t)v38)
        {
          if (v21 >= v38 && a1 >= (uint64_t)v21)
          {
LABEL_16:
            v24 = *(_QWORD *)(a2 + 48);
            result = v24 + v15 * a1;
            v25 = v24 + v16;
            v8 = v14;
            if (v15 * a1 < v16 || (v12 = v15, result >= v25 + v15))
            {
              result = swift_arrayInitWithTakeFrontToBack(result, v25);
LABEL_21:
              v13 = v17;
              v12 = v15;
            }
            else if (v15 * a1 != v16)
            {
              result = swift_arrayInitWithTakeBackToFront(result, v25);
              goto LABEL_21;
            }
            v26 = *(_QWORD *)(a2 + 56);
            v27 = (_OWORD *)(v26 + 32 * a1);
            v28 = (_OWORD *)(v26 + 32 * v10);
            if (32 * a1 != 32 * v10 || (a1 = v10, v27 >= v28 + 2))
            {
              v29 = v28[1];
              *v27 = *v28;
              v27[1] = v29;
              a1 = v10;
            }
            goto LABEL_5;
          }
        }
        else if (v21 >= v38 || a1 >= (uint64_t)v21)
        {
          goto LABEL_16;
        }
        v8 = v14;
        v12 = v15;
LABEL_5:
        v10 = (v10 + 1) & v13;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v30 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v31 = *v30;
    v32 = (-1 << a1) - 1;
  }
  else
  {
    v30 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v32 = *v30;
    v31 = (-1 << a1) - 1;
  }
  *v30 = v32 & v31;
  v33 = *(_QWORD *)(a2 + 16);
  v34 = __OFSUB__(v33, 1);
  v35 = v33 - 1;
  if (v34)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v35;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_1341C(unint64_t a1, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  __int128 v10;
  Swift::Int v11;
  id v12;
  Swift::Int v13;
  Swift::Int v14;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  _OWORD *v21;
  _OWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;

  v3 = a1;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    v8 = _HashTable.previousHole(before:)(a1, a2 + 64, ~v5);
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v11 = *(_QWORD *)(a2 + 40);
        v12 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v6);
        v13 = NSObject._rawHashValue(seed:)(v11);

        v14 = v13 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v14 >= v9 && v3 >= v14)
          {
LABEL_16:
            v17 = *(_QWORD *)(a2 + 48);
            v18 = (_QWORD *)(v17 + 8 * v3);
            v19 = (_QWORD *)(v17 + 8 * v6);
            if (v3 != v6 || v18 >= v19 + 1)
              *v18 = *v19;
            v20 = *(_QWORD *)(a2 + 56);
            v21 = (_OWORD *)(v20 + 32 * v3);
            v22 = (_OWORD *)(v20 + 32 * v6);
            if (32 * v3 != 32 * v6 || (v3 = v6, v21 >= v22 + 2))
            {
              v10 = v22[1];
              *v21 = *v22;
              v21[1] = v10;
              v3 = v6;
            }
          }
        }
        else if (v14 >= v9 || v3 >= v14)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v23 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v24 = *v23;
    v25 = (-1 << v3) - 1;
  }
  else
  {
    v23 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    v25 = *v23;
    v24 = (-1 << a1) - 1;
  }
  *v23 = v25 & v24;
  v26 = *(_QWORD *)(a2 + 16);
  v27 = __OFSUB__(v26, 1);
  v28 = v26 - 1;
  if (v27)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v28;
    ++*(_DWORD *)(a2 + 36);
  }
}

void sub_135D4(unint64_t a1, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  Swift::Int v10;
  id v11;
  Swift::Int v12;
  Swift::Int v13;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;

  v3 = a1;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    v8 = _HashTable.previousHole(before:)(a1, a2 + 64, ~v5);
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v10 = *(_QWORD *)(a2 + 40);
        v11 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v6);
        v12 = NSObject._rawHashValue(seed:)(v10);

        v13 = v12 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v13 >= v9 && v3 >= v13)
          {
LABEL_16:
            v16 = *(_QWORD *)(a2 + 48);
            v17 = (_QWORD *)(v16 + 8 * v3);
            v18 = (_QWORD *)(v16 + 8 * v6);
            if (v3 != v6 || v17 >= v18 + 1)
              *v17 = *v18;
            v19 = *(_QWORD *)(a2 + 56);
            v20 = (_QWORD *)(v19 + 8 * v3);
            v21 = (_QWORD *)(v19 + 8 * v6);
            if (v3 != v6 || (v3 = v6, v20 >= v21 + 1))
            {
              *v20 = *v21;
              v3 = v6;
            }
          }
        }
        else if (v13 >= v9 || v3 >= v13)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v23 = *v22;
    v24 = (-1 << v3) - 1;
  }
  else
  {
    v22 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    v24 = *v22;
    v23 = (-1 << a1) - 1;
  }
  *v22 = v24 & v23;
  v25 = *(_QWORD *)(a2 + 16);
  v26 = __OFSUB__(v25, 1);
  v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
}

id sub_13784(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5, char a6)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  id result;
  unint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;

  v7 = v6;
  v13 = *v6;
  v15 = sub_1035C((uint64_t)a5);
  v16 = *(_QWORD *)(v13 + 16);
  v17 = (v14 & 1) == 0;
  v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v19 = v14;
  v20 = *(_QWORD *)(v13 + 24);
  if (v20 >= v18 && (a6 & 1) != 0)
    goto LABEL_7;
  if (v20 >= v18 && (a6 & 1) == 0)
  {
    sub_13D20();
LABEL_7:
    v21 = (_QWORD *)*v7;
    if ((v19 & 1) != 0)
    {
LABEL_8:
      v22 = v21[7] + 32 * v15;
      result = (id)sub_18E20(*(_QWORD *)v22, *(_QWORD *)(v22 + 8), *(_QWORD *)(v22 + 16), *(_BYTE *)(v22 + 24));
      *(_QWORD *)v22 = a1;
      *(_QWORD *)(v22 + 8) = a2;
      *(_QWORD *)(v22 + 16) = a3;
      *(_BYTE *)(v22 + 24) = a4;
      return result;
    }
LABEL_11:
    v21[(v15 >> 6) + 8] |= 1 << v15;
    *(_QWORD *)(v21[6] + 8 * v15) = a5;
    v26 = v21[7] + 32 * v15;
    *(_QWORD *)v26 = a1;
    *(_QWORD *)(v26 + 8) = a2;
    *(_QWORD *)(v26 + 16) = a3;
    *(_BYTE *)(v26 + 24) = a4;
    v27 = v21[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (!v28)
    {
      v21[2] = v29;
      return a5;
    }
    goto LABEL_14;
  }
  sub_10A40(v18, a6 & 1);
  v24 = sub_1035C((uint64_t)a5);
  if ((v19 & 1) == (v25 & 1))
  {
    v15 = v24;
    v21 = (_QWORD *)*v7;
    if ((v19 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  v30 = sub_19330(0, &qword_40F78, CNComposeRecipient_ptr);
  result = (id)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v30);
  __break(1u);
  return result;
}

id sub_13920(uint64_t a1, void *a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  id result;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;

  v4 = v3;
  v7 = *v3;
  v9 = sub_1035C((uint64_t)a2);
  v10 = *(_QWORD *)(v7 + 16);
  v11 = (v8 & 1) == 0;
  v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v13 = v8;
  v14 = *(_QWORD *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_13F08();
LABEL_7:
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
    {
LABEL_8:
      v16 = v15[7];
      result = (id)swift_release(*(_QWORD *)(v16 + 8 * v9));
      *(_QWORD *)(v16 + 8 * v9) = a1;
      return result;
    }
LABEL_11:
    v15[(v9 >> 6) + 8] |= 1 << v9;
    v20 = 8 * v9;
    *(_QWORD *)(v15[6] + v20) = a2;
    *(_QWORD *)(v15[7] + v20) = a1;
    v21 = v15[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v15[2] = v23;
      return a2;
    }
    goto LABEL_14;
  }
  sub_10D3C(v12, a3 & 1);
  v18 = sub_1035C((uint64_t)a2);
  if ((v13 & 1) == (v19 & 1))
  {
    v9 = v18;
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  v24 = sub_19330(0, &qword_40F78, CNComposeRecipient_ptr);
  result = (id)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v24);
  __break(1u);
  return result;
}

void *sub_13A80()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *result;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  int64_t v29;
  unint64_t v30;
  int64_t v31;
  int64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  int64_t v37;
  const void *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int64_t v44;

  v41 = type metadata accessor for Handle(0);
  v39 = *(_QWORD *)(v41 - 8);
  __chkstk_darwin(v41);
  v40 = (char *)&v35 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_41018);
  v36 = v0;
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = *(_QWORD *)(v2 + 16);
  v43 = v3;
  if (!v4)
  {
    result = (void *)swift_release(v2);
    v34 = v43;
    v33 = v36;
LABEL_28:
    *v33 = v34;
    return result;
  }
  v5 = v3;
  result = (void *)(v3 + 64);
  v7 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  v38 = (const void *)(v2 + 64);
  if (v5 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
  {
    result = memmove(result, v38, 8 * v7);
    v5 = v43;
  }
  v9 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v42 = v2;
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v37 = (unint64_t)(v10 + 63) >> 6;
  v14 = v39;
  v13 = v40;
  v15 = v41;
  v16 = v43;
  while (1)
  {
    if (v12)
    {
      v17 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v44 = v9;
      v18 = v17 | (v9 << 6);
      v19 = v42;
      goto LABEL_12;
    }
    v29 = v9 + 1;
    v19 = v42;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v29 >= v37)
      goto LABEL_26;
    v30 = *((_QWORD *)v38 + v29);
    v31 = v9 + 1;
    if (!v30)
    {
      v31 = v29 + 1;
      if (v29 + 1 >= v37)
        goto LABEL_26;
      v30 = *((_QWORD *)v38 + v31);
      if (!v30)
        break;
    }
LABEL_25:
    v12 = (v30 - 1) & v30;
    v44 = v31;
    v18 = __clz(__rbit64(v30)) + (v31 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v14 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))(v13, *(_QWORD *)(v19 + 48) + v20, v15);
    v21 = *(_QWORD *)(v19 + 56);
    v22 = 32 * v18;
    v23 = v21 + 32 * v18;
    v24 = *(_QWORD *)v23;
    v25 = *(_QWORD *)(v23 + 8);
    v26 = *(_QWORD *)(v23 + 16);
    v27 = *(_QWORD *)(v16 + 48) + v20;
    LOBYTE(v20) = *(_BYTE *)(v23 + 24);
    (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(v27, v13, v15);
    v28 = *(_QWORD *)(v16 + 56) + v22;
    *(_QWORD *)v28 = v24;
    *(_QWORD *)(v28 + 8) = v25;
    *(_QWORD *)(v28 + 16) = v26;
    *(_BYTE *)(v28 + 24) = v20;
    result = (void *)sub_18DEC(v24, v25, v26, v20);
    v9 = v44;
  }
  v32 = v29 + 2;
  if (v32 >= v37)
  {
LABEL_26:
    result = (void *)swift_release(v42);
    v33 = v36;
    v34 = v43;
    goto LABEL_28;
  }
  v30 = *((_QWORD *)v38 + v32);
  if (v30)
  {
    v31 = v32;
    goto LABEL_25;
  }
  while (1)
  {
    v31 = v32 + 1;
    if (__OFADD__(v32, 1))
      break;
    if (v31 >= v37)
      goto LABEL_26;
    v30 = *((_QWORD *)v38 + v31);
    ++v32;
    if (v30)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_13D20()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *result;
  uint64_t v5;
  unint64_t v6;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  id v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t *v28;

  __swift_instantiateConcreteTypeFromMangledName(&qword_40FA8);
  v28 = v0;
  v1 = *v0;
  v2 = static _DictionaryStorage.copy(original:)(*v0);
  v3 = v2;
  if (!*(_QWORD *)(v1 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v1);
    *v28 = v3;
    return result;
  }
  result = (void *)(v2 + 64);
  v5 = v1 + 64;
  v6 = (unint64_t)((1 << *(_BYTE *)(v3 + 32)) + 63) >> 6;
  if (v3 != v1 || (unint64_t)result >= v1 + 64 + 8 * v6)
    result = memmove(result, (const void *)(v1 + 64), 8 * v6);
  v8 = 0;
  *(_QWORD *)(v3 + 16) = *(_QWORD *)(v1 + 16);
  v9 = 1 << *(_BYTE *)(v1 + 32);
  v10 = -1;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  v11 = v10 & *(_QWORD *)(v1 + 64);
  v12 = (unint64_t)(v9 + 63) >> 6;
  while (1)
  {
    if (v11)
    {
      v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v14 = v13 | (v8 << 6);
      goto LABEL_12;
    }
    v25 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v12)
      goto LABEL_26;
    v26 = *(_QWORD *)(v5 + 8 * v25);
    ++v8;
    if (!v26)
    {
      v8 = v25 + 1;
      if (v25 + 1 >= v12)
        goto LABEL_26;
      v26 = *(_QWORD *)(v5 + 8 * v8);
      if (!v26)
        break;
    }
LABEL_25:
    v11 = (v26 - 1) & v26;
    v14 = __clz(__rbit64(v26)) + (v8 << 6);
LABEL_12:
    v15 = 8 * v14;
    v16 = *(void **)(*(_QWORD *)(v1 + 48) + 8 * v14);
    v17 = 32 * v14;
    v18 = *(_QWORD *)(v1 + 56) + v17;
    v19 = *(_QWORD *)v18;
    v20 = *(_QWORD *)(v18 + 8);
    v21 = *(_QWORD *)(v18 + 16);
    v22 = *(_BYTE *)(v18 + 24);
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + v15) = v16;
    v23 = *(_QWORD *)(v3 + 56) + v17;
    *(_QWORD *)v23 = v19;
    *(_QWORD *)(v23 + 8) = v20;
    *(_QWORD *)(v23 + 16) = v21;
    *(_BYTE *)(v23 + 24) = v22;
    v24 = v16;
    result = (void *)sub_18DEC(v19, v20, v21, v22);
  }
  v27 = v25 + 2;
  if (v27 >= v12)
    goto LABEL_26;
  v26 = *(_QWORD *)(v5 + 8 * v27);
  if (v26)
  {
    v8 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v8 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v8 >= v12)
      goto LABEL_26;
    v26 = *(_QWORD *)(v5 + 8 * v8);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_13F08()
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
  void *v17;
  uint64_t v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_40F80);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v2);
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
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v17;
    result = (void *)swift_retain(v18);
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

void *sub_140B0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int64_t v25;

  v1 = type metadata accessor for Handle(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_410F8);
  v23 = v0;
  v5 = *v0;
  v6 = static _DictionaryStorage.copy(original:)(*v0);
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v5);
    *v23 = v7;
    return result;
  }
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v24 = v5 + 64;
  v25 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }
    v19 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v25)
      goto LABEL_26;
    v20 = *(_QWORD *)(v24 + 8 * v19);
    ++v11;
    if (!v20)
    {
      v11 = v19 + 1;
      if (v19 + 1 >= v25)
        goto LABEL_26;
      v20 = *(_QWORD *)(v24 + 8 * v11);
      if (!v20)
        break;
    }
LABEL_25:
    v14 = (v20 - 1) & v20;
    v16 = __clz(__rbit64(v20)) + (v11 << 6);
LABEL_12:
    v17 = *(_QWORD *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v5 + 48) + v17, v1);
    v18 = *(_BYTE *)(*(_QWORD *)(v5 + 56) + v16);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 48) + v17, v4, v1);
    *(_BYTE *)(*(_QWORD *)(v7 + 56) + v16) = v18;
  }
  v21 = v19 + 2;
  if (v21 >= v25)
    goto LABEL_26;
  v20 = *(_QWORD *)(v24 + 8 * v21);
  if (v20)
  {
    v11 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v11 >= v25)
      goto LABEL_26;
    v20 = *(_QWORD *)(v24 + 8 * v11);
    ++v21;
    if (v20)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_142D0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v7;
  Swift::Int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  BOOL v21;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v23;
  _QWORD v24[9];

  v7 = *v3;
  Hasher.init(_seed:)(v24, *(_QWORD *)(*v3 + 40));
  swift_bridgeObjectRetain(v7);
  String.hash(into:)(v24, a2, a3);
  v8 = Hasher._finalize()();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = v12[1];
    v14 = *v12 == a2 && v13 == a3;
    if (v14 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v12, v13, a2, a3, 0) & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease(a3);
      swift_bridgeObjectRelease(v7);
      v15 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v16 = v15[1];
      *a1 = *v15;
      a1[1] = v16;
      swift_bridgeObjectRetain(v16);
      return 0;
    }
    v18 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v18;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v19 = (_QWORD *)(v11 + 16 * v10);
      v20 = v19[1];
      v21 = *v19 == a2 && v20 == a3;
      if (v21 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v19, v20, a2, a3, 0) & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease(v7);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  v24[0] = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain(a3);
  sub_16874(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  v23 = *v3;
  *v3 = v24[0];
  swift_bridgeObjectRelease(v23);
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

Swift::Int sub_1447C(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  Swift::Int result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0)
    v2 = sub_173E4(v2);
  v3 = *(_QWORD *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  result = sub_14648(v5);
  *a1 = v2;
  return result;
}

Swift::Int sub_144E4(_QWORD *a1)
{
  uint64_t v2;
  _QWORD *v3;
  char *v4;
  Swift::Int result;
  char *v6[2];

  v2 = *(_QWORD *)(type metadata accessor for Handle(0) - 8);
  v3 = (_QWORD *)*a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0)
    v3 = (_QWORD *)sub_173F8(v3);
  v4 = (char *)v3[2];
  v6[0] = (char *)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  result = sub_14D30(v6);
  *a1 = v3;
  return result;
}

_QWORD *sub_14564(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return _swiftEmptyArrayStorage;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_40FC0);
  v4 = (_QWORD *)swift_allocObject(v3, 16 * v1 + 32, 7);
  v5 = _swift_stdlib_malloc_size(v4);
  v6 = v5 - 32;
  if (v5 < 32)
    v6 = v5 - 17;
  v4[2] = v1;
  v4[3] = 2 * (v6 >> 4);
  v7 = sub_171E8((uint64_t)&v10, v4 + 4, v1, a1);
  v8 = v10;
  swift_bridgeObjectRetain(a1);
  sub_194D8(v8);
  if (v7 != v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return v4;
}

Swift::Int sub_14648(uint64_t *a1)
{
  uint64_t v1;
  Swift::Int v3;
  Swift::Int result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  Swift::Int v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  Swift::Int v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  int v20;
  Swift::Int v21;
  uint64_t *v22;
  Swift::Int v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  Swift::Int v31;
  Swift::Int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  Swift::Int v36;
  _QWORD *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  Swift::Int v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  BOOL v45;
  unint64_t v46;
  unint64_t v47;
  char *v48;
  char *v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  BOOL v61;
  unint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  BOOL v71;
  uint64_t v72;
  char v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  BOOL v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  char *v91;
  char *v92;
  uint64_t v93;
  char *v94;
  unint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  char *v100;
  char *v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  unint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  _QWORD *v110;
  Swift::Int v111;
  Swift::Int v112;
  Swift::Int v113;
  char *__dst;

  v3 = a1[1];
  result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3)
        return sub_157A8(0, v3, 1, a1);
      return result;
    }
    goto LABEL_154;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
  {
LABEL_162:
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Can't construct Array with count < 0", 36, 2, "Swift/Array.swift", 17, 2, 936, 0);
    __break(1u);
    return result;
  }
  v111 = result;
  v108 = a1;
  if (v3 < 2)
  {
    v8 = _swiftEmptyArrayStorage;
    __dst = (char *)&_swiftEmptyArrayStorage[4];
    if (v3 != 1)
    {
      v12 = _swiftEmptyArrayStorage[2];
      v11 = (char *)_swiftEmptyArrayStorage;
LABEL_120:
      v101 = v11;
      v110 = v8;
      if (v12 < 2)
        goto LABEL_117;
      v102 = *v108;
      while (1)
      {
        v103 = v12 - 2;
        if (v12 < 2)
          goto LABEL_149;
        if (!v102)
          goto LABEL_161;
        v100 = v101;
        v104 = *(_QWORD *)&v101[16 * v103 + 32];
        v105 = *(_QWORD *)&v101[16 * v12 + 24];
        sub_15AEC((char *)(v102 + 16 * v104), (char *)(v102 + 16 * *(_QWORD *)&v101[16 * v12 + 16]), v102 + 16 * v105, __dst);
        if (v1)
          goto LABEL_116;
        if (v105 < v104)
          goto LABEL_150;
        if ((swift_isUniquelyReferenced_nonNull_native(v100) & 1) == 0)
          v100 = sub_16584((uint64_t)v100);
        if (v103 >= *((_QWORD *)v100 + 2))
          goto LABEL_151;
        v106 = &v100[16 * v103 + 32];
        *(_QWORD *)v106 = v104;
        *((_QWORD *)v106 + 1) = v105;
        v107 = *((_QWORD *)v100 + 2);
        if (v12 > v107)
          goto LABEL_152;
        memmove(&v100[16 * v12 + 16], &v100[16 * v12 + 32], 16 * (v107 - v12));
        v101 = v100;
        *((_QWORD *)v100 + 2) = v107 - 1;
        v12 = v107 - 1;
        if (v107 <= 2)
          goto LABEL_117;
      }
    }
    v110 = _swiftEmptyArrayStorage;
  }
  else
  {
    v6 = v5 >> 1;
    v7 = static Array._allocateBufferUninitialized(minimumCapacity:)(v5 >> 1, &type metadata for String);
    *(_QWORD *)(v7 + 16) = v6;
    v110 = (_QWORD *)v7;
    __dst = (char *)(v7 + 32);
  }
  v9 = 0;
  v10 = *a1;
  v109 = v10 + 8;
  v11 = (char *)_swiftEmptyArrayStorage;
  v112 = v3;
  while (1)
  {
    v13 = v9++;
    if (v9 >= v3)
      goto LABEL_46;
    v14 = (uint64_t *)(v10 + 16 * v9);
    v15 = *v14;
    v16 = v14[1];
    v17 = (_QWORD *)(v10 + 16 * v13);
    v18 = v17[1];
    if (v15 == *v17 && v16 == v18)
    {
      v21 = v13 + 2;
      if (v13 + 2 >= v3)
        goto LABEL_45;
      v20 = 0;
    }
    else
    {
      v20 = _stringCompareWithSmolCheck(_:_:expecting:)(v15, v16, *v17, v18, 1);
      v21 = v13 + 2;
      if (v13 + 2 >= v3)
        goto LABEL_36;
    }
    v22 = (uint64_t *)(v109 + 16 * v21);
    do
    {
      v24 = *(v22 - 1);
      v25 = *v22;
      v26 = (_QWORD *)(v10 + 16 * v9);
      v27 = v26[1];
      if (v24 == *v26 && v25 == v27)
      {
        if ((v20 & 1) != 0)
          goto LABEL_37;
      }
      else if (((v20 ^ _stringCompareWithSmolCheck(_:_:expecting:)(v24, v25, *v26, v27, 1)) & 1) != 0)
      {
        goto LABEL_36;
      }
      v22 += 2;
      v23 = v21 + 1;
      v9 = v21;
      v21 = v23;
    }
    while (v23 < v3);
    v21 = v23;
LABEL_36:
    v9 = v21;
    if ((v20 & 1) != 0)
    {
LABEL_37:
      if (v21 < v13)
        goto LABEL_157;
      if (v13 < v21)
      {
        v29 = 16 * v21;
        v30 = 16 * v13;
        v31 = v21;
        v32 = v13;
        do
        {
          if (v32 != --v31)
          {
            if (!v10)
              goto LABEL_160;
            v33 = v10 + v29;
            v34 = *(_QWORD *)(v10 + v30);
            v35 = *(_QWORD *)(v10 + v30 + 8);
            *(_OWORD *)(v10 + v30) = *(_OWORD *)(v10 + v29 - 16);
            *(_QWORD *)(v33 - 16) = v34;
            *(_QWORD *)(v33 - 8) = v35;
          }
          ++v32;
          v29 -= 16;
          v30 += 16;
        }
        while (v32 < v31);
      }
LABEL_45:
      v9 = v21;
    }
LABEL_46:
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13))
        goto LABEL_153;
      if (v9 - v13 < v111)
      {
        if (__OFADD__(v13, v111))
          goto LABEL_155;
        if (v13 + v111 >= v3)
          v36 = v3;
        else
          v36 = v13 + v111;
        if (v36 < v13)
          goto LABEL_156;
        if (v9 != v36)
        {
          v37 = (_QWORD *)(v10 + 16 * v9);
          do
          {
            v38 = (uint64_t *)(v10 + 16 * v9);
            v39 = *v38;
            v40 = v38[1];
            v41 = v13;
            v42 = v37;
            do
            {
              v43 = *(v42 - 2);
              v44 = *(v42 - 1);
              v45 = v39 == v43 && v40 == v44;
              if (v45 || (_stringCompareWithSmolCheck(_:_:expecting:)(v39, v40, v43, v44, 1) & 1) == 0)
                break;
              if (!v10)
                goto LABEL_158;
              v39 = *v42;
              v40 = v42[1];
              *(_OWORD *)v42 = *((_OWORD *)v42 - 1);
              *(v42 - 1) = v40;
              *(v42 - 2) = v39;
              v42 -= 2;
              ++v41;
            }
            while (v9 != v41);
            ++v9;
            v37 += 2;
          }
          while (v9 != v36);
          v9 = v36;
        }
      }
    }
    if (v9 < v13)
    {
LABEL_148:
      __break(1u);
LABEL_149:
      __break(1u);
LABEL_150:
      __break(1u);
LABEL_151:
      __break(1u);
LABEL_152:
      __break(1u);
LABEL_153:
      __break(1u);
LABEL_154:
      __break(1u);
LABEL_155:
      __break(1u);
LABEL_156:
      __break(1u);
LABEL_157:
      __break(1u);
LABEL_158:
      __break(1u);
LABEL_159:
      __break(1u);
LABEL_160:
      __break(1u);
LABEL_161:
      __break(1u);
      goto LABEL_162;
    }
    if ((swift_isUniquelyReferenced_nonNull_native(v11) & 1) == 0)
      v11 = sub_162D8(0, *((_QWORD *)v11 + 2) + 1, 1, v11);
    v47 = *((_QWORD *)v11 + 2);
    v46 = *((_QWORD *)v11 + 3);
    v12 = v47 + 1;
    if (v47 >= v46 >> 1)
      v11 = sub_162D8((char *)(v46 > 1), v47 + 1, 1, v11);
    *((_QWORD *)v11 + 2) = v12;
    v48 = v11 + 32;
    v49 = &v11[16 * v47 + 32];
    *(_QWORD *)v49 = v13;
    *((_QWORD *)v49 + 1) = v9;
    if (v47)
      break;
    v12 = 1;
LABEL_15:
    v3 = v112;
    if (v9 >= v112)
    {
      v8 = v110;
      goto LABEL_120;
    }
  }
  v113 = v9;
  while (1)
  {
    v50 = v12 - 1;
    if (v12 >= 4)
    {
      v55 = &v48[16 * v12];
      v56 = *((_QWORD *)v55 - 8);
      v57 = *((_QWORD *)v55 - 7);
      v61 = __OFSUB__(v57, v56);
      v58 = v57 - v56;
      if (v61)
        goto LABEL_137;
      v60 = *((_QWORD *)v55 - 6);
      v59 = *((_QWORD *)v55 - 5);
      v61 = __OFSUB__(v59, v60);
      v53 = v59 - v60;
      v54 = v61;
      if (v61)
        goto LABEL_138;
      v62 = v12 - 2;
      v63 = &v48[16 * v12 - 32];
      v65 = *(_QWORD *)v63;
      v64 = *((_QWORD *)v63 + 1);
      v61 = __OFSUB__(v64, v65);
      v66 = v64 - v65;
      if (v61)
        goto LABEL_140;
      v61 = __OFADD__(v53, v66);
      v67 = v53 + v66;
      if (v61)
        goto LABEL_143;
      if (v67 >= v58)
      {
        v85 = &v48[16 * v50];
        v87 = *(_QWORD *)v85;
        v86 = *((_QWORD *)v85 + 1);
        v61 = __OFSUB__(v86, v87);
        v88 = v86 - v87;
        if (v61)
          goto LABEL_147;
        v78 = v53 < v88;
        goto LABEL_105;
      }
    }
    else
    {
      if (v12 != 3)
      {
        v79 = *((_QWORD *)v11 + 4);
        v80 = *((_QWORD *)v11 + 5);
        v61 = __OFSUB__(v80, v79);
        v72 = v80 - v79;
        v73 = v61;
        goto LABEL_99;
      }
      v52 = *((_QWORD *)v11 + 4);
      v51 = *((_QWORD *)v11 + 5);
      v61 = __OFSUB__(v51, v52);
      v53 = v51 - v52;
      v54 = v61;
    }
    if ((v54 & 1) != 0)
      goto LABEL_139;
    v62 = v12 - 2;
    v68 = &v48[16 * v12 - 32];
    v70 = *(_QWORD *)v68;
    v69 = *((_QWORD *)v68 + 1);
    v71 = __OFSUB__(v69, v70);
    v72 = v69 - v70;
    v73 = v71;
    if (v71)
      goto LABEL_142;
    v74 = &v48[16 * v50];
    v76 = *(_QWORD *)v74;
    v75 = *((_QWORD *)v74 + 1);
    v61 = __OFSUB__(v75, v76);
    v77 = v75 - v76;
    if (v61)
      goto LABEL_145;
    if (__OFADD__(v72, v77))
      goto LABEL_146;
    if (v72 + v77 >= v53)
    {
      v78 = v53 < v77;
LABEL_105:
      if (v78)
        v50 = v62;
      goto LABEL_107;
    }
LABEL_99:
    if ((v73 & 1) != 0)
      goto LABEL_141;
    v81 = &v48[16 * v50];
    v83 = *(_QWORD *)v81;
    v82 = *((_QWORD *)v81 + 1);
    v61 = __OFSUB__(v82, v83);
    v84 = v82 - v83;
    if (v61)
      goto LABEL_144;
    if (v84 < v72)
      goto LABEL_15;
LABEL_107:
    v89 = v50 - 1;
    if (v50 - 1 >= v12)
    {
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
LABEL_142:
      __break(1u);
LABEL_143:
      __break(1u);
LABEL_144:
      __break(1u);
LABEL_145:
      __break(1u);
LABEL_146:
      __break(1u);
LABEL_147:
      __break(1u);
      goto LABEL_148;
    }
    v90 = v10;
    if (!v10)
      goto LABEL_159;
    v91 = v11;
    v92 = &v48[16 * v89];
    v93 = *(_QWORD *)v92;
    v94 = v48;
    v95 = v50;
    v96 = &v48[16 * v50];
    v97 = *((_QWORD *)v96 + 1);
    v98 = v90;
    sub_15AEC((char *)(v90 + 16 * *(_QWORD *)v92), (char *)(v90 + 16 * *(_QWORD *)v96), v90 + 16 * v97, __dst);
    if (v1)
      break;
    if (v97 < v93)
      goto LABEL_134;
    if (v95 > *((_QWORD *)v91 + 2))
      goto LABEL_135;
    *(_QWORD *)v92 = v93;
    *(_QWORD *)&v94[16 * v89 + 8] = v97;
    v99 = *((_QWORD *)v91 + 2);
    if (v95 >= v99)
      goto LABEL_136;
    v11 = v91;
    v12 = v99 - 1;
    memmove(v96, v96 + 16, 16 * (v99 - 1 - v95));
    v48 = v94;
    *((_QWORD *)v91 + 2) = v99 - 1;
    v10 = v98;
    v9 = v113;
    if (v99 <= 2)
      goto LABEL_15;
  }
  v100 = v91;
LABEL_116:
  v101 = v100;
LABEL_117:
  swift_bridgeObjectRelease(v101);
  v110[2] = 0;
  return swift_bridgeObjectRelease(v110);
}

Swift::Int sub_14D30(char **a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Swift::Int v11;
  Swift::Int result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  Swift::Int v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  char *v26;
  char *v27;
  char *v28;
  void (*v29)(char *, uint64_t);
  char *v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  int v38;
  uint64_t v39;
  Swift::Int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  Swift::Int v45;
  uint64_t v46;
  char **v47;
  uint64_t v48;
  char *v49;
  char *v50;
  Swift::Int v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  char **v59;
  void (*v60)(char *, char *, uint64_t);
  char *v61;
  char *v62;
  uint64_t v63;
  void (*v64)(char *, uint64_t);
  char *v65;
  char *v66;
  char *v67;
  void (*v68)(char *, char *, uint64_t);
  char isUniquelyReferenced_nonNull_native;
  unint64_t v70;
  unint64_t v71;
  char *v72;
  char *v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  BOOL v86;
  unint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  BOOL v96;
  uint64_t v97;
  char v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  BOOL v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  char *v115;
  char *v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  char *v122;
  unint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  char *v127;
  unint64_t v128;
  _QWORD *v129;
  _QWORD *v130;
  Swift::Int v131;
  char *v132;
  uint64_t v133;
  char *v134;
  uint64_t v135;
  unint64_t v136;
  uint64_t v137;
  char *v138;
  uint64_t v139;
  void (*v140)(char *, char *, uint64_t);
  char *v141;
  char *v142;
  uint64_t v143;
  char **v144;
  char *v145;
  Swift::Int v146;
  uint64_t v147;
  uint64_t v148;

  v3 = type metadata accessor for Handle(0);
  v148 = *(_QWORD *)(v3 - 8);
  v4 = __chkstk_darwin(v3);
  v134 = (char *)&v130 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __chkstk_darwin(v4);
  v145 = (char *)&v130 - v7;
  v8 = __chkstk_darwin(v6);
  v142 = (char *)&v130 - v9;
  __chkstk_darwin(v8);
  v141 = (char *)&v130 - v10;
  v11 = (Swift::Int)a1[1];
  result = _minimumMergeRunLength(_:)(v11);
  if (result >= v11)
  {
    if (v11 < 0)
      goto LABEL_141;
    if (v11)
      return sub_15874(0, v11, 1, a1);
    return result;
  }
  if (v11 >= 0)
    v13 = v11;
  else
    v13 = v11 + 1;
  if (v11 < -1)
    goto LABEL_149;
  v144 = a1;
  v131 = result;
  v137 = v1;
  if (v11 < 2)
  {
    v17 = (char *)&_swiftEmptyArrayStorage;
    v136 = (unint64_t)&_swiftEmptyArrayStorage
         + ((*(unsigned __int8 *)(v148 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v148 + 80));
    v130 = &_swiftEmptyArrayStorage;
    if (v11 != 1)
    {
      v19 = *((_QWORD *)&_swiftEmptyArrayStorage + 2);
LABEL_107:
      if (v19 >= 2)
      {
        v122 = *v144;
        do
        {
          v123 = v19 - 2;
          if (v19 < 2)
            goto LABEL_136;
          if (!v122)
            goto LABEL_148;
          v124 = *(_QWORD *)&v17[16 * v123 + 32];
          v125 = *(_QWORD *)&v17[16 * v19 + 24];
          v126 = v137;
          sub_15D84((unint64_t)&v122[*(_QWORD *)(v148 + 72) * v124], (unint64_t)&v122[*(_QWORD *)(v148 + 72) * *(_QWORD *)&v17[16 * v19 + 16]], (unint64_t)&v122[*(_QWORD *)(v148 + 72) * v125], v136);
          v137 = v126;
          if (v126)
            break;
          if (v125 < v124)
            goto LABEL_137;
          if ((swift_isUniquelyReferenced_nonNull_native(v17) & 1) == 0)
            v17 = sub_16584((uint64_t)v17);
          if (v123 >= *((_QWORD *)v17 + 2))
            goto LABEL_138;
          v127 = &v17[16 * v123 + 32];
          *(_QWORD *)v127 = v124;
          *((_QWORD *)v127 + 1) = v125;
          v128 = *((_QWORD *)v17 + 2);
          if (v19 > v128)
            goto LABEL_139;
          memmove(&v17[16 * v19 + 16], &v17[16 * v19 + 32], 16 * (v128 - v19));
          *((_QWORD *)v17 + 2) = v128 - 1;
          v19 = v128 - 1;
        }
        while (v128 > 2);
      }
LABEL_118:
      swift_bridgeObjectRelease(v17);
      v129 = v130;
      v130[2] = 0;
      return swift_bridgeObjectRelease(v129);
    }
  }
  else
  {
    v14 = v13 >> 1;
    v15 = static Array._allocateBufferUninitialized(minimumCapacity:)(v13 >> 1, v3);
    *(_QWORD *)(v15 + 16) = v14;
    v16 = *(unsigned __int8 *)(v148 + 80);
    v130 = (_QWORD *)v15;
    v136 = v15 + ((v16 + 32) & ~v16);
  }
  v18 = 0;
  v17 = (char *)&_swiftEmptyArrayStorage;
  while (1)
  {
    v20 = v18;
    v21 = v18 + 1;
    v135 = v18;
    if (v18 + 1 >= v11)
    {
      v32 = v18 + 1;
      v41 = v137;
      goto LABEL_58;
    }
    v22 = *v144;
    v146 = v11;
    v23 = v148;
    v24 = *(_QWORD *)(v148 + 72);
    v25 = *(void (**)(_QWORD, _QWORD, _QWORD))(v148 + 16);
    v26 = v141;
    v25(v141, &v22[v24 * v21], v3);
    v27 = &v22[v24 * v20];
    v28 = v142;
    v25(v142, v27, v3);
    v143 = sub_19D7C(&qword_41000, (uint64_t (*)(uint64_t))&type metadata accessor for Handle, (uint64_t)&protocol conformance descriptor for Handle);
    LODWORD(v140) = dispatch thunk of static Comparable.< infix(_:_:)(v26, v28, v3, v143);
    v29 = *(void (**)(_QWORD, _QWORD))(v23 + 8);
    v30 = v28;
    v20 = v135;
    v29(v30, v3);
    v29(v26, v3);
    v31 = v22;
    v32 = v20 + 2;
    v138 = v31;
    v147 = v24;
    if (v20 + 2 >= v146)
    {
      v41 = v137;
      v40 = v146;
      v39 = v24;
      if ((v140 & 1) == 0)
        break;
    }
    else
    {
      v132 = v17;
      v139 = v24 * v21;
      v33 = v31;
      v34 = v24 * v32;
      do
      {
        v35 = v32;
        v36 = v141;
        v25(v141, &v33[v34], v3);
        v37 = v142;
        v25(v142, &v33[v139], v3);
        v38 = dispatch thunk of static Comparable.< infix(_:_:)(v36, v37, v3, v143);
        v29(v37, v3);
        v29(v36, v3);
        if (((v140 ^ v38) & 1) != 0)
        {
          v41 = v137;
          v17 = v132;
          v32 = v35;
          v20 = v135;
          v40 = v146;
          v39 = v147;
          if ((v140 & 1) == 0)
            goto LABEL_38;
          goto LABEL_26;
        }
        v32 = v35 + 1;
        v39 = v147;
        v33 += v147;
      }
      while (v146 != v35 + 1);
      v40 = v146;
      v32 = v146;
      v41 = v137;
      v17 = v132;
      v20 = v135;
      if ((v140 & 1) == 0)
        break;
    }
LABEL_26:
    if (v32 < v20)
      goto LABEL_142;
    if (v20 >= v32)
      break;
    v132 = v17;
    v42 = 0;
    v43 = v39 * (v32 - 1);
    v44 = v32 * v39;
    v45 = v20;
    v46 = v20 * v39;
    v47 = v144;
    v143 = v32;
    do
    {
      if (v45 != v32 + v42 - 1)
      {
        if (!v138)
          goto LABEL_147;
        v48 = v41;
        v49 = &v138[v46];
        v50 = &v138[v43];
        v140 = *(char **)(v148 + 32);
        ((void (*)(char *, char *, uint64_t))v140)(v134, &v138[v46], v3);
        if (v46 < v43 || v49 >= &v138[v44])
        {
          swift_arrayInitWithTakeFrontToBack(v49, v50);
        }
        else if (v46 != v43)
        {
          swift_arrayInitWithTakeBackToFront(v49, v50);
        }
        ((void (*)(char *, char *, uint64_t))v140)(v50, v134, v3);
        v41 = v48;
        v32 = v143;
        v47 = v144;
        v39 = v147;
      }
      ++v45;
      --v42;
      v43 -= v39;
      v44 -= v39;
      v46 += v39;
    }
    while (v45 < v32 + v42);
    v17 = v132;
    v20 = v135;
    v40 = v146;
    if (v32 < v146)
      goto LABEL_41;
LABEL_58:
    if (v32 < v20)
      goto LABEL_135;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v17);
    v137 = v41;
    v143 = v32;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v17 = sub_162D8(0, *((_QWORD *)v17 + 2) + 1, 1, v17);
    v71 = *((_QWORD *)v17 + 2);
    v70 = *((_QWORD *)v17 + 3);
    v19 = v71 + 1;
    if (v71 >= v70 >> 1)
      v17 = sub_162D8((char *)(v70 > 1), v71 + 1, 1, v17);
    *((_QWORD *)v17 + 2) = v19;
    v72 = v17 + 32;
    v73 = &v17[16 * v71 + 32];
    v74 = v143;
    *(_QWORD *)v73 = v20;
    *((_QWORD *)v73 + 1) = v74;
    if (v71)
    {
      while (1)
      {
        v75 = v19 - 1;
        if (v19 >= 4)
        {
          v80 = &v72[16 * v19];
          v81 = *((_QWORD *)v80 - 8);
          v82 = *((_QWORD *)v80 - 7);
          v86 = __OFSUB__(v82, v81);
          v83 = v82 - v81;
          if (v86)
            goto LABEL_124;
          v85 = *((_QWORD *)v80 - 6);
          v84 = *((_QWORD *)v80 - 5);
          v86 = __OFSUB__(v84, v85);
          v78 = v84 - v85;
          v79 = v86;
          if (v86)
            goto LABEL_125;
          v87 = v19 - 2;
          v88 = &v72[16 * v19 - 32];
          v90 = *(_QWORD *)v88;
          v89 = *((_QWORD *)v88 + 1);
          v86 = __OFSUB__(v89, v90);
          v91 = v89 - v90;
          if (v86)
            goto LABEL_127;
          v86 = __OFADD__(v78, v91);
          v92 = v78 + v91;
          if (v86)
            goto LABEL_130;
          if (v92 >= v83)
          {
            v110 = &v72[16 * v75];
            v112 = *(_QWORD *)v110;
            v111 = *((_QWORD *)v110 + 1);
            v86 = __OFSUB__(v111, v112);
            v113 = v111 - v112;
            if (v86)
              goto LABEL_134;
            v103 = v78 < v113;
            goto LABEL_95;
          }
        }
        else
        {
          if (v19 != 3)
          {
            v104 = *((_QWORD *)v17 + 4);
            v105 = *((_QWORD *)v17 + 5);
            v86 = __OFSUB__(v105, v104);
            v97 = v105 - v104;
            v98 = v86;
            goto LABEL_89;
          }
          v77 = *((_QWORD *)v17 + 4);
          v76 = *((_QWORD *)v17 + 5);
          v86 = __OFSUB__(v76, v77);
          v78 = v76 - v77;
          v79 = v86;
        }
        if ((v79 & 1) != 0)
          goto LABEL_126;
        v87 = v19 - 2;
        v93 = &v72[16 * v19 - 32];
        v95 = *(_QWORD *)v93;
        v94 = *((_QWORD *)v93 + 1);
        v96 = __OFSUB__(v94, v95);
        v97 = v94 - v95;
        v98 = v96;
        if (v96)
          goto LABEL_129;
        v99 = &v72[16 * v75];
        v101 = *(_QWORD *)v99;
        v100 = *((_QWORD *)v99 + 1);
        v86 = __OFSUB__(v100, v101);
        v102 = v100 - v101;
        if (v86)
          goto LABEL_132;
        if (__OFADD__(v97, v102))
          goto LABEL_133;
        if (v97 + v102 >= v78)
        {
          v103 = v78 < v102;
LABEL_95:
          if (v103)
            v75 = v87;
          goto LABEL_97;
        }
LABEL_89:
        if ((v98 & 1) != 0)
          goto LABEL_128;
        v106 = &v72[16 * v75];
        v108 = *(_QWORD *)v106;
        v107 = *((_QWORD *)v106 + 1);
        v86 = __OFSUB__(v107, v108);
        v109 = v107 - v108;
        if (v86)
          goto LABEL_131;
        if (v109 < v97)
          goto LABEL_14;
LABEL_97:
        v114 = v75 - 1;
        if (v75 - 1 >= v19)
        {
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
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
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
          goto LABEL_144;
        }
        if (!*v144)
          goto LABEL_146;
        v115 = v17;
        v116 = &v72[16 * v114];
        v117 = *(_QWORD *)v116;
        v118 = &v72[16 * v75];
        v119 = *((_QWORD *)v118 + 1);
        v120 = v137;
        sub_15D84((unint64_t)&(*v144)[*(_QWORD *)(v148 + 72) * *(_QWORD *)v116], (unint64_t)&(*v144)[*(_QWORD *)(v148 + 72) * *(_QWORD *)v118], (unint64_t)&(*v144)[*(_QWORD *)(v148 + 72) * v119], v136);
        v137 = v120;
        if (v120)
        {
          v17 = v115;
          goto LABEL_118;
        }
        if (v119 < v117)
          goto LABEL_121;
        if (v75 > *((_QWORD *)v115 + 2))
          goto LABEL_122;
        *(_QWORD *)v116 = v117;
        *(_QWORD *)&v72[16 * v114 + 8] = v119;
        v121 = *((_QWORD *)v115 + 2);
        if (v75 >= v121)
          goto LABEL_123;
        v17 = v115;
        v19 = v121 - 1;
        memmove(&v72[16 * v75], v118 + 16, 16 * (v121 - 1 - v75));
        *((_QWORD *)v115 + 2) = v121 - 1;
        if (v121 <= 2)
          goto LABEL_14;
      }
    }
    v19 = 1;
LABEL_14:
    v11 = (Swift::Int)v144[1];
    v18 = v143;
    if (v143 >= v11)
      goto LABEL_107;
  }
LABEL_38:
  v47 = v144;
  if (v32 >= v40)
    goto LABEL_58;
LABEL_41:
  if (__OFSUB__(v32, v20))
    goto LABEL_140;
  if (v32 - v20 >= v131)
    goto LABEL_58;
  if (__OFADD__(v20, v131))
    goto LABEL_143;
  if (v20 + v131 >= v40)
    v51 = v40;
  else
    v51 = v20 + v131;
  if (v51 >= v20)
  {
    if (v32 != v51)
    {
      v132 = v17;
      v133 = v51;
      v52 = *(_QWORD *)(v148 + 72);
      v53 = *(char **)(v148 + 16);
      v137 = v41;
      v138 = v53;
      v54 = v52 * (v32 - 1);
      v139 = v52;
      v147 = v32 * v52;
      do
      {
        v56 = 0;
        v143 = v32;
        v140 = (char *)v54;
        while (1)
        {
          v146 = v20;
          v57 = *v47;
          v58 = v141;
          v59 = v47;
          v60 = (void (*)(_QWORD, _QWORD, _QWORD))v138;
          ((void (*)(char *, char *, uint64_t))v138)(v141, &(*v47)[v147 + v56], v3);
          v61 = &v57[v54 + v56];
          v62 = v142;
          v60(v142, v61, v3);
          v63 = sub_19D7C(&qword_41000, (uint64_t (*)(uint64_t))&type metadata accessor for Handle, (uint64_t)&protocol conformance descriptor for Handle);
          LOBYTE(v57) = dispatch thunk of static Comparable.< infix(_:_:)(v58, v62, v3, v63);
          v64 = *(void (**)(_QWORD, _QWORD))(v148 + 8);
          v64(v62, v3);
          v64(v58, v3);
          if ((v57 & 1) == 0)
            break;
          v65 = *v59;
          if (!*v59)
            goto LABEL_145;
          v66 = &v65[v147 + v56];
          v54 = (uint64_t)v140;
          v67 = &v140[(_QWORD)v65 + v56];
          v68 = *(void (**)(_QWORD, _QWORD, _QWORD))(v148 + 32);
          v68(v145, v66, v3);
          swift_arrayInitWithTakeFrontToBack(v66, v67);
          v68(v67, v145, v3);
          v56 -= v139;
          v20 = v146 + 1;
          v55 = v143;
          v47 = v144;
          if (v143 == v146 + 1)
            goto LABEL_51;
        }
        v55 = v143;
        v47 = v59;
        v54 = (uint64_t)v140;
LABEL_51:
        v32 = v55 + 1;
        v54 += v139;
        v147 += v139;
        v20 = v135;
      }
      while (v32 != v133);
      v32 = v133;
      v41 = v137;
      v17 = v132;
    }
    goto LABEL_58;
  }
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  __break(1u);
LABEL_147:
  __break(1u);
LABEL_148:
  __break(1u);
LABEL_149:
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Can't construct Array with count < 0", 36, 2, "Swift/Array.swift", 17, 2, 936, 0);
  __break(1u);
  return result;
}

uint64_t sub_157A8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  BOOL v13;

  if (a3 != a2)
  {
    v4 = a3;
    v6 = result;
    v7 = *a4;
    v8 = *a4 + 16 * a3;
LABEL_5:
    v9 = (uint64_t *)(v7 + 16 * v4);
    result = *v9;
    v10 = v9[1];
    v11 = v6;
    v12 = (uint64_t *)v8;
    while (1)
    {
      v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2)
          return result;
        goto LABEL_5;
      }
      if (!v7)
        break;
      result = *v12;
      v10 = v12[1];
      *(_OWORD *)v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_15874(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void (*v19)(char *, uint64_t, uint64_t);
  char *v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  _QWORD *v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;

  v30 = a1;
  v7 = type metadata accessor for Handle(0);
  v38 = *(_QWORD **)(v7 - 8);
  v8 = __chkstk_darwin(v7);
  v37 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v8);
  v34 = (char *)&v28 - v11;
  result = __chkstk_darwin(v10);
  v33 = (char *)&v28 - v13;
  v36 = a3;
  v29 = a2;
  if (a3 != a2)
  {
    v14 = v38[9];
    v31 = (void (*)(char *, uint64_t, uint64_t))v38[2];
    v32 = a4;
    v40 = v14 * (v36 - 1);
    v35 = v14;
    v39 = v14 * v36;
LABEL_5:
    v15 = 0;
    v16 = v30;
    while (1)
    {
      v17 = *a4;
      v18 = v33;
      v19 = v31;
      v31(v33, v39 + v15 + *a4, v7);
      v20 = v34;
      v19(v34, v40 + v15 + v17, v7);
      v21 = sub_19D7C(&qword_41000, (uint64_t (*)(uint64_t))&type metadata accessor for Handle, (uint64_t)&protocol conformance descriptor for Handle);
      LOBYTE(v17) = dispatch thunk of static Comparable.< infix(_:_:)(v18, v20, v7, v21);
      v22 = (void (*)(char *, uint64_t))v38[1];
      v23 = v20;
      a4 = v32;
      v22(v23, v7);
      result = ((uint64_t (*)(char *, uint64_t))v22)(v18, v7);
      if ((v17 & 1) == 0)
      {
LABEL_4:
        v40 += v35;
        v39 += v35;
        if (++v36 == v29)
          return result;
        goto LABEL_5;
      }
      v24 = *a4;
      if (!*a4)
        break;
      v25 = v24 + v39 + v15;
      v26 = v24 + v40 + v15;
      v27 = (void (*)(char *, uint64_t, uint64_t))v38[4];
      v27(v37, v25, v7);
      swift_arrayInitWithTakeFrontToBack(v25, v26);
      result = ((uint64_t (*)(uint64_t, char *, uint64_t))v27)(v26, v37, v7);
      v15 -= v35;
      if (v36 == ++v16)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_15AEC(char *__src, char *a2, unint64_t a3, char *__dst)
{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t result;
  char *v29;
  char *v30;
  char *v31;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = a2 - __src;
  v9 = a2 - __src + 15;
  if (a2 - __src >= 0)
    v9 = a2 - __src;
  v10 = v9 >> 4;
  v11 = a3 - (_QWORD)a2;
  v12 = a3 - (_QWORD)a2 + 15;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v12 = a3 - (_QWORD)a2;
  v13 = v12 >> 4;
  v31 = __src;
  v30 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst)
        memmove(__dst, a2, 16 * v13);
      v19 = &v4[16 * v13];
      v29 = v19;
      v31 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        v20 = (char *)(a3 - 16);
        v21 = v6;
        while (1)
        {
          v22 = v20 + 16;
          v23 = *((_QWORD *)v19 - 2);
          v24 = *((_QWORD *)v19 - 1);
          v25 = *((_QWORD *)v21 - 2);
          v26 = *((_QWORD *)v21 - 1);
          v21 -= 16;
          v27 = v23 == v25 && v24 == v26;
          if (v27 || (_stringCompareWithSmolCheck(_:_:expecting:)(v23, v24, v25, v26, 1) & 1) == 0)
          {
            v29 = v19 - 16;
            if (v22 < v19 || v20 >= v19 || v22 != v19)
              *(_OWORD *)v20 = *((_OWORD *)v19 - 1);
            v21 = v6;
            v19 -= 16;
            if (v6 <= v7)
              goto LABEL_50;
          }
          else
          {
            if (v22 != v6 || v20 >= v6)
              *(_OWORD *)v20 = *(_OWORD *)v21;
            v31 = v21;
            if (v21 <= v7)
              goto LABEL_50;
          }
          v20 -= 16;
          v6 = v21;
          if (v19 <= v4)
            goto LABEL_50;
        }
      }
      goto LABEL_50;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst)
      memmove(__dst, __src, 16 * v10);
    v14 = &v4[16 * v10];
    v29 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        v15 = *((_QWORD *)v6 + 1);
        v16 = *((_QWORD *)v4 + 1);
        v17 = *(_QWORD *)v6 == *(_QWORD *)v4 && v15 == v16;
        if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)(*(_QWORD *)v6, v15, *(_QWORD *)v4, v16, 1) & 1) == 0)
        {
          if (v7 != v4)
            *(_OWORD *)v7 = *(_OWORD *)v4;
          v4 += 16;
          v30 = v4;
          v18 = v6;
        }
        else
        {
          v18 = v6 + 16;
          if (v7 < v6 || v7 >= v18 || v7 != v6)
            *(_OWORD *)v7 = *(_OWORD *)v6;
        }
        v7 += 16;
        if (v4 >= v14)
          break;
        v6 = v18;
      }
      while ((unint64_t)v18 < a3);
      v31 = v7;
    }
LABEL_50:
    sub_163D0((void **)&v31, (const void **)&v30, &v29);
    return 1;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
  __break(1u);
  return result;
}

uint64_t sub_15D84(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v19)(char *, unint64_t, uint64_t);
  unint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char v24;
  void (*v25)(char *, uint64_t);
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v31;
  char *v32;
  void (*v33)(char *, unint64_t, uint64_t);
  unint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t);
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t result;
  uint64_t v45;
  void (*v46)(char *, unint64_t, uint64_t);
  _QWORD *v47;
  unint64_t v48;
  unint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;

  v8 = type metadata accessor for Handle(0);
  v9 = *(_QWORD **)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v51 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v50 = (char *)&v45 - v12;
  v52 = v9[9];
  if (!v52)
  {
    __break(1u);
LABEL_62:
    __break(1u);
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  if (a2 - a1 == 0x8000000000000000 && v52 == -1)
    goto LABEL_62;
  v13 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v52 == -1)
    goto LABEL_63;
  v14 = (uint64_t)(a2 - a1) / v52;
  v55 = a1;
  v54 = a4;
  v15 = v13 / v52;
  if (v14 >= v13 / v52)
  {
    if ((v15 & 0x8000000000000000) == 0)
    {
      v17 = v15 * v52;
      if (a4 < a2 || a2 + v17 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack(a4, a2);
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront(a4, a2);
      }
      v29 = a4 + v17;
      v53 = a4 + v17;
      v55 = a2;
      if (v17 >= 1 && a1 < a2)
      {
        v31 = -v52;
        v46 = (void (*)(char *, unint64_t, uint64_t))v9[2];
        v47 = v9;
        v48 = a4;
        v49 = a1;
        do
        {
          v52 = a3 + v31;
          v32 = v50;
          v33 = v46;
          v46(v50, v29 + v31, v8);
          v34 = a2 + v31;
          v35 = v31;
          v36 = v51;
          v33(v51, v34, v8);
          v37 = sub_19D7C(&qword_41000, (uint64_t (*)(uint64_t))&type metadata accessor for Handle, (uint64_t)&protocol conformance descriptor for Handle);
          LOBYTE(v33) = dispatch thunk of static Comparable.< infix(_:_:)(v32, v36, v8, v37);
          v38 = (void (*)(char *, uint64_t))v9[1];
          v38(v36, v8);
          v38(v32, v8);
          if ((v33 & 1) != 0)
          {
            v31 = v35;
            v39 = v52;
            if (a3 < a2 || v52 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack(v52, v34);
              v9 = v47;
              v40 = v48;
              v41 = v49;
            }
            else
            {
              v9 = v47;
              v40 = v48;
              v41 = v49;
              if (a3 != a2)
                swift_arrayInitWithTakeBackToFront(v52, v34);
            }
            v55 += v31;
          }
          else
          {
            v42 = v53;
            v43 = v53 + v35;
            v53 += v35;
            v31 = v35;
            v39 = v52;
            if (a3 < v42 || v52 >= v42)
            {
              swift_arrayInitWithTakeFrontToBack(v52, v43);
              v34 = a2;
              v9 = v47;
              v40 = v48;
              v41 = v49;
            }
            else
            {
              v9 = v47;
              v40 = v48;
              v41 = v49;
              if (a3 != v42)
                swift_arrayInitWithTakeBackToFront(v52, v43);
              v34 = a2;
            }
          }
          v29 = v53;
          if (v53 <= v40)
            break;
          a2 = v34;
          a3 = v39;
        }
        while (v34 > v41);
      }
      goto LABEL_60;
    }
  }
  else if ((v14 & 0x8000000000000000) == 0)
  {
    v16 = v14 * v52;
    if (a4 < a1 || a1 + v16 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack(a4, a1);
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront(a4, a1);
    }
    v49 = a4 + v16;
    v53 = a4 + v16;
    if (v16 >= 1 && a2 < a3)
    {
      v19 = (void (*)(char *, unint64_t, uint64_t))v9[2];
      do
      {
        v20 = a3;
        v21 = v50;
        v19(v50, a2, v8);
        v22 = v51;
        v19(v51, a4, v8);
        v23 = sub_19D7C(&qword_41000, (uint64_t (*)(uint64_t))&type metadata accessor for Handle, (uint64_t)&protocol conformance descriptor for Handle);
        v24 = dispatch thunk of static Comparable.< infix(_:_:)(v21, v22, v8, v23);
        v25 = (void (*)(char *, uint64_t))v9[1];
        v25(v22, v8);
        v25(v21, v8);
        v26 = v55;
        if ((v24 & 1) != 0)
        {
          v27 = a2 + v52;
          if (v55 < a2 || v55 >= v27)
          {
            swift_arrayInitWithTakeFrontToBack(v55, a2);
            a3 = v20;
          }
          else
          {
            a3 = v20;
            if (v55 == a2)
              v26 = a2;
            else
              swift_arrayInitWithTakeBackToFront(v55, a2);
          }
        }
        else
        {
          v28 = v54 + v52;
          if (v55 < v54 || v55 >= v28)
          {
            swift_arrayInitWithTakeFrontToBack(v55, v54);
            a3 = v20;
          }
          else
          {
            a3 = v20;
            if (v55 != v54)
              swift_arrayInitWithTakeBackToFront(v55, v54);
          }
          v54 = v28;
          v27 = a2;
        }
        v55 = v26 + v52;
        a4 = v54;
        if (v54 >= v49)
          break;
        a2 = v27;
      }
      while (v27 < a3);
    }
LABEL_60:
    sub_16478(&v55, &v54, (uint64_t *)&v53);
    return 1;
  }
LABEL_64:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
  __break(1u);
  return result;
}

char *sub_162D8(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
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

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_40FC8);
    v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = _swift_stdlib_malloc_size(v11);
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
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8])
      memmove(v14, v15, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 16 * v8);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

char *sub_163D0(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;
  char v9;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 15;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -16)
  {
    v9 = 2;
    result = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v9, 1046, 0);
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
      return (char *)memmove(result, v3, 16 * v7);
  }
  return result;
}

uint64_t sub_16478(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v3 = *a1;
  v4 = *a2;
  v5 = *a3;
  result = type metadata accessor for Handle(0);
  v7 = *(_QWORD *)(*(_QWORD *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1)
    goto LABEL_14;
  if (v8 / v7 < 0)
  {
LABEL_15:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
    return swift_arrayInitWithTakeFrontToBack(v3, v4);
  if (v3 != v4)
    return swift_arrayInitWithTakeBackToFront(v3, v4);
  return result;
}

char *sub_16584(uint64_t a1)
{
  return sub_162D8(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

Swift::Int sub_16598(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  Swift::Int result;
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
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  _QWORD *v33;
  _QWORD v34[9];

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_40FD0);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1);
  v6 = v5;
  if (*(_QWORD *)(v3 + 16))
  {
    v7 = 1 << *(_BYTE *)(v3 + 32);
    v32 = v2;
    v33 = (_QWORD *)(v3 + 56);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v3 + 56);
    v10 = (unint64_t)(v7 + 63) >> 6;
    v11 = v5 + 56;
    result = swift_retain(v3);
    v13 = 0;
    while (1)
    {
      if (v9)
      {
        v16 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v17 = v16 | (v13 << 6);
      }
      else
      {
        v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v18 >= v10)
          goto LABEL_36;
        v19 = v33[v18];
        ++v13;
        if (!v19)
        {
          v13 = v18 + 1;
          if (v18 + 1 >= v10)
            goto LABEL_36;
          v19 = v33[v13];
          if (!v19)
          {
            v13 = v18 + 2;
            if (v18 + 2 >= v10)
              goto LABEL_36;
            v19 = v33[v13];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v10)
              {
LABEL_36:
                swift_release(v3);
                v2 = v32;
                v31 = 1 << *(_BYTE *)(v3 + 32);
                if (v31 > 63)
                  bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v33 = -1 << v31;
                *(_QWORD *)(v3 + 16) = 0;
                break;
              }
              v19 = v33[v20];
              if (!v19)
              {
                while (1)
                {
                  v13 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_42;
                  if (v13 >= v10)
                    goto LABEL_36;
                  v19 = v33[v13];
                  ++v20;
                  if (v19)
                    goto LABEL_26;
                }
              }
              v13 = v20;
            }
          }
        }
LABEL_26:
        v9 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v17);
      v22 = *v21;
      v23 = v21[1];
      Hasher.init(_seed:)(v34, *(_QWORD *)(v6 + 40));
      String.hash(into:)(v34, v22, v23);
      result = Hasher._finalize()();
      v24 = -1 << *(_BYTE *)(v6 + 32);
      v25 = result & ~v24;
      v26 = v25 >> 6;
      if (((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v27 = 0;
        v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v29 = v26 == v28;
          if (v26 == v28)
            v26 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v11 + 8 * v26);
        }
        while (v30 == -1);
        v14 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = (_QWORD *)(*(_QWORD *)(v6 + 48) + 16 * v14);
      *v15 = v22;
      v15[1] = v23;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release(v3);
  *v2 = v6;
  return result;
}

uint64_t sub_16874(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD v28[9];

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  v11 = v9 + 1;
  if ((a4 & 1) != 0)
  {
    sub_16598(v11);
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_16A0C();
      goto LABEL_22;
    }
    sub_16BBC(v11);
  }
  v12 = *v4;
  Hasher.init(_seed:)(v28, *(_QWORD *)(*v4 + 40));
  String.hash(into:)(v28, v8, a2);
  result = Hasher._finalize()();
  v13 = -1 << *(_BYTE *)(v12 + 32);
  a3 = result & ~v13;
  v14 = v12 + 56;
  if (((*(_QWORD *)(v12 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v15 = *(_QWORD *)(v12 + 48);
    v16 = (_QWORD *)(v15 + 16 * a3);
    v17 = v16[1];
    v18 = *v16 == v8 && v17 == a2;
    if (v18 || (result = _stringCompareWithSmolCheck(_:_:expecting:)(*v16, v17, v8, a2, 0), (result & 1) != 0))
    {
LABEL_21:
      result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
      __break(1u);
    }
    else
    {
      v19 = ~v13;
      while (1)
      {
        a3 = (a3 + 1) & v19;
        if (((*(_QWORD *)(v14 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v20 = (_QWORD *)(v15 + 16 * a3);
        v21 = v20[1];
        if (*v20 != v8 || v21 != a2)
        {
          result = _stringCompareWithSmolCheck(_:_:expecting:)(*v20, v21, v8, a2, 0);
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v23 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v24 = (uint64_t *)(*(_QWORD *)(v23 + 48) + 16 * a3);
  *v24 = v8;
  v24[1] = a2;
  v25 = *(_QWORD *)(v23 + 16);
  v26 = __OFADD__(v25, 1);
  v27 = v25 + 1;
  if (v26)
    __break(1u);
  else
    *(_QWORD *)(v23 + 16) = v27;
  return result;
}

void *sub_16A0C()
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
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_40FD0);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
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
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain(v18);
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

Swift::Int sub_16BBC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  Swift::Int result;
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
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  int64_t v32;
  _QWORD v33[9];

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_40FD0);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0);
  v6 = v5;
  if (!*(_QWORD *)(v3 + 16))
  {
    result = swift_release(v3);
LABEL_38:
    *v2 = v6;
    return result;
  }
  v7 = 1 << *(_BYTE *)(v3 + 32);
  v8 = v3 + 56;
  if (v7 < 64)
    v9 = ~(-1 << v7);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v3 + 56);
  v31 = v2;
  v32 = (unint64_t)(v7 + 63) >> 6;
  v11 = v5 + 56;
  result = swift_retain(v3);
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v13 << 6);
      goto LABEL_27;
    }
    v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v18 >= v32)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v18);
    ++v13;
    if (!v19)
    {
      v13 = v18 + 1;
      if (v18 + 1 >= v32)
        goto LABEL_36;
      v19 = *(_QWORD *)(v8 + 8 * v13);
      if (!v19)
      {
        v13 = v18 + 2;
        if (v18 + 2 >= v32)
          goto LABEL_36;
        v19 = *(_QWORD *)(v8 + 8 * v13);
        if (!v19)
          break;
      }
    }
LABEL_26:
    v10 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v13 << 6);
LABEL_27:
    v21 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v17);
    v22 = *v21;
    v23 = v21[1];
    Hasher.init(_seed:)(v33, *(_QWORD *)(v6 + 40));
    swift_bridgeObjectRetain(v23);
    String.hash(into:)(v33, v22, v23);
    result = Hasher._finalize()();
    v24 = -1 << *(_BYTE *)(v6 + 32);
    v25 = result & ~v24;
    v26 = v25 >> 6;
    if (((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v29 = v26 == v28;
        if (v26 == v28)
          v26 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v11 + 8 * v26);
      }
      while (v30 == -1);
      v14 = __clz(__rbit64(~v30)) + (v26 << 6);
    }
    *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    v15 = (_QWORD *)(*(_QWORD *)(v6 + 48) + 16 * v14);
    *v15 = v22;
    v15[1] = v23;
    ++*(_QWORD *)(v6 + 16);
  }
  v20 = v18 + 3;
  if (v20 >= v32)
  {
LABEL_36:
    result = swift_release_n(v3, 2);
    v2 = v31;
    goto LABEL_38;
  }
  v19 = *(_QWORD *)(v8 + 8 * v20);
  if (v19)
  {
    v13 = v20;
    goto LABEL_26;
  }
  while (1)
  {
    v13 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v13 >= v32)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v13);
    ++v20;
    if (v19)
      goto LABEL_26;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_16E68(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_17008(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_16E84(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_16EA0(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_16EA0(char a1, int64_t a2, char a3, char *a4)
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
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_40FC0);
    v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = _swift_stdlib_malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (char *)_swiftEmptyArrayStorage;
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

uint64_t sub_17008(char a1, int64_t a2, char a3, _QWORD *a4)
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
  unint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  unint64_t v24;
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
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_41008);
  v11 = *(_QWORD *)(type metadata accessor for Handle(0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  v16 = _swift_stdlib_malloc_size(v15);
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
  v18 = *(_QWORD *)(type metadata accessor for Handle(0) - 8);
  v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  v20 = (char *)v15 + v19;
  v21 = (char *)a4 + v19;
  if ((a1 & 1) != 0)
  {
    if (v15 < a4 || v20 >= &v21[*(_QWORD *)(v18 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack(v20, v21);
    }
    else if (v15 != a4)
    {
      swift_arrayInitWithTakeBackToFront(v20, v21);
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v22 = *(_QWORD *)(v18 + 72) * v8;
  v23 = &v20[v22];
  v24 = (unint64_t)&v21[v22];
  if (v21 >= v23 || (unint64_t)v20 >= v24)
  {
    swift_arrayInitWithCopy(v20);
LABEL_32:
    swift_release(a4);
    return (uint64_t)v15;
  }
LABEL_36:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_171E8(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = (_QWORD *)result;
  v6 = a4 + 56;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 56);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain(v21);
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain(v21);
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_173E4(uint64_t a1)
{
  return sub_16EA0(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_173F8(_QWORD *a1)
{
  return sub_17008(0, a1[2], 0, a1);
}

uint64_t sub_1740C(uint64_t a1)
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

BOOL _s13FindMyAppCore22ContactPickerViewModelC15RecipientStatusO2eeoiySbAE_AEtFZ_0(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;

  v2 = *a1;
  v3 = a1[1];
  v4 = a1[2];
  v5 = *((unsigned __int8 *)a1 + 24);
  v6 = *(_QWORD *)a2;
  v7 = *(_QWORD *)(a2 + 8);
  v8 = *(_QWORD *)(a2 + 16);
  v9 = *(unsigned __int8 *)(a2 + 24);
  if (!*((_BYTE *)a1 + 24))
  {
    if (*(_BYTE *)(a2 + 24))
      goto LABEL_30;
    if (v3)
    {
      if (v7)
      {
        if (v2 == v6 && v3 == v7)
        {
          sub_18DEC(*a1, v3, v8, 0);
          sub_18DEC(v2, v3, v4, 0);
          sub_18E20(v2, v3, v4, 0);
          v11 = v2;
          v12 = v3;
          v13 = v8;
          v14 = 0;
          goto LABEL_46;
        }
        v26 = _stringCompareWithSmolCheck(_:_:expecting:)(*a1, v3, v6, v7, 0);
        sub_18DEC(v6, v7, v8, 0);
        sub_18DEC(v2, v3, v4, 0);
        sub_18E20(v2, v3, v4, 0);
        sub_18E20(v6, v7, v8, 0);
        return (v26 & 1) != 0;
      }
      sub_18DEC(*(_QWORD *)a2, 0, v8, 0);
      sub_18DEC(v2, v3, v4, 0);
    }
    else
    {
      swift_bridgeObjectRetain(*(_QWORD *)(a2 + 8));
      sub_18DEC(v6, v7, v8, 0);
      sub_18DEC(v2, 0, v4, 0);
      sub_18E20(v2, 0, v4, 0);
      sub_18E20(v6, v7, v8, 0);
      if (!v7)
        return 1;
    }
    sub_18E20(v2, v3, v4, 0);
    v18 = v6;
    v19 = v7;
    v20 = v8;
    v21 = 0;
    goto LABEL_31;
  }
  if (v5 != 1)
  {
    if (v4 | v3 | v2)
    {
      if (v9 == 2 && v6 == 1 && (v8 | v7) == 0)
      {
        v10 = 1;
        sub_18E20(1, 0, 0, 2);
        sub_18E20(1, 0, 0, 2);
        return v10;
      }
      goto LABEL_30;
    }
    if (v9 != 2 || (v8 | v7 | v6) != 0)
    {
LABEL_30:
      sub_18DEC(*(_QWORD *)a2, *(_QWORD *)(a2 + 8), v8, v9);
      sub_18DEC(v2, v3, v4, v5);
      sub_18E20(v2, v3, v4, v5);
      v18 = v6;
      v19 = v7;
      v20 = v8;
      v21 = v9;
LABEL_31:
      sub_18E20(v18, v19, v20, v21);
      return 0;
    }
    sub_18E20(0, 0, 0, 2);
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 2;
LABEL_46:
    sub_18E20(v11, v12, v13, v14);
    return 1;
  }
  if (v9 != 1)
    goto LABEL_30;
  if (((v6 ^ v2) & 1) != 0)
  {
    v23 = *(_QWORD *)a2;
    v24 = *(_QWORD *)(a2 + 8);
    v25 = v8;
LABEL_35:
    sub_18DEC(v23, v24, v25, 1);
    sub_18DEC(v2, v3, v4, 1);
LABEL_36:
    sub_18E20(v2, v3, v4, 1);
    v18 = v6;
    v19 = v7;
    v20 = v8;
    v21 = 1;
    goto LABEL_31;
  }
  if (!v4)
  {
    swift_bridgeObjectRetain(*(_QWORD *)(a2 + 16));
    v10 = 1;
    sub_18DEC(v6, v7, v8, 1);
    sub_18DEC(v2, v3, 0, 1);
    sub_18E20(v2, v3, 0, 1);
    sub_18E20(v6, v7, v8, 1);
    if (!v8)
      return v10;
    goto LABEL_36;
  }
  if (!v8)
  {
    v23 = *(_QWORD *)a2;
    v24 = *(_QWORD *)(a2 + 8);
    v25 = 0;
    goto LABEL_35;
  }
  if (v3 != v7 || v4 != v8)
  {
    v27 = _stringCompareWithSmolCheck(_:_:expecting:)(a1[1], v4, v7, v8, 0);
    v10 = 1;
    sub_18DEC(v6, v7, v8, 1);
    sub_18DEC(v2, v3, v4, 1);
    sub_18E20(v2, v3, v4, 1);
    sub_18E20(v6, v7, v8, 1);
    if ((v27 & 1) != 0)
      return v10;
    return 0;
  }
  v10 = 1;
  sub_18DEC(*(_QWORD *)a2, v3, v4, 1);
  sub_18DEC(v2, v3, v4, 1);
  sub_18E20(v2, v3, v4, 1);
  sub_18E20(v6, v3, v4, 1);
  return v10;
}

uint64_t sub_17920(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_17930()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_17954(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v7 = *(_QWORD *)(v2 + 16);
  v6 = *(_QWORD *)(v2 + 24);
  v8 = (_QWORD *)swift_task_alloc(dword_40C84);
  *(_QWORD *)(v3 + 16) = v8;
  *v8 = v3;
  v8[1] = sub_1A22C;
  return sub_A5FC(a1, a2, v7, v6);
}

uint64_t sub_179C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v6 = *(_BYTE *)(v2 + 16);
  v8 = *(_QWORD *)(v2 + 24);
  v7 = *(_QWORD *)(v2 + 32);
  v9 = (_QWORD *)swift_task_alloc(dword_40C94);
  *(_QWORD *)(v3 + 16) = v9;
  *v9 = v3;
  v9[1] = sub_1A22C;
  return sub_B7A8(a1, a2, v6, v8, v7);
}

uint64_t sub_17A3C()
{
  _QWORD *v0;

  swift_release(v0[3]);
  swift_release(v0[5]);
  swift_release(v0[7]);
  return swift_deallocObject(v0, 64, 7);
}

uint64_t sub_17A70(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v6 = v2[2];
  v7 = v2[3];
  v8 = v2[4];
  v9 = v2[5];
  v11 = v2[6];
  v10 = v2[7];
  v12 = (_QWORD *)swift_task_alloc(dword_40CA4);
  *(_QWORD *)(v3 + 16) = v12;
  *v12 = v3;
  v12[1] = sub_1A22C;
  return sub_C0B8(a1, a2, v6, v7, v8, v9, v11, v10);
}

uint64_t sub_17B04()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

unint64_t sub_17B2C()
{
  unint64_t result;

  result = qword_40CE0;
  if (!qword_40CE0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ContactPickerViewModel.RecipientStatus.InvalidReason, &type metadata for ContactPickerViewModel.RecipientStatus.InvalidReason);
    atomic_store(result, (unint64_t *)&qword_40CE0);
  }
  return result;
}

uint64_t sub_17B70()
{
  return type metadata accessor for ContactPickerViewModel(0);
}

uint64_t type metadata accessor for ContactPickerViewModel(uint64_t a1)
{
  return sub_18808(a1, (uint64_t *)&unk_40D10, (uint64_t)&nominal type descriptor for ContactPickerViewModel);
}

void sub_17B8C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[14];

  v6[0] = &unk_338C8;
  v6[1] = &unk_338E0;
  v6[2] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v6[3] = &unk_338F8;
  v6[4] = &unk_338F8;
  v6[5] = &unk_338F8;
  sub_17C68(319);
  if (v3 <= 0x3F)
  {
    v6[6] = *(_QWORD *)(v2 - 8) + 64;
    v6[7] = (char *)&value witness table for Builtin.BridgeObject + 64;
    v6[8] = &unk_33910;
    v6[9] = &unk_33910;
    v6[10] = &unk_33910;
    v6[11] = &unk_33910;
    v6[12] = &unk_33910;
    v4 = type metadata accessor for ObservationRegistrar(319);
    if (v5 <= 0x3F)
    {
      v6[13] = *(_QWORD *)(v4 - 8) + 64;
      swift_updateClassMetadata2(a1, 256, 14, v6, a1 + 80);
    }
  }
}

uint64_t method lookup function for ContactPickerViewModel(uint64_t a1, uint64_t a2)
{
  return swift_lookUpClassMethod(a1, a2, &nominal type descriptor for ContactPickerViewModel);
}

uint64_t dispatch thunk of ContactPickerViewModel.__allocating_init(configuration:dependencies:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 192))();
}

void sub_17C68(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_40D20)
  {
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_40C38);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_40D20);
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
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

uint64_t destroy for ContactPickerViewModel.Configuration(_QWORD *a1)
{
  swift_bridgeObjectRelease(a1[1]);
  swift_release(a1[4]);
  return swift_bridgeObjectRelease(a1[5]);
}

uint64_t initializeWithCopy for ContactPickerViewModel.Configuration(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v5;
  swift_bridgeObjectRetain(v3);
  swift_retain(v4);
  swift_bridgeObjectRetain(v5);
  return a1;
}

uint64_t assignWithCopy for ContactPickerViewModel.Configuration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 32);
  v7 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v6;
  swift_retain(v6);
  swift_release(v7);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ContactPickerViewModel.Configuration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v6 = *(_QWORD *)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release(v6);
  v7 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease(v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactPickerViewModel.Configuration(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ContactPickerViewModel.Configuration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
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
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ContactPickerViewModel.Configuration()
{
  return &type metadata for ContactPickerViewModel.Configuration;
}

uint64_t *initializeBufferWithCopyOfBuffer for ContactPickerViewModel.StepResult(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_18164(a1, a2, a3, &qword_40E08, &qword_40E10);
}

uint64_t destroy for ContactPickerViewModel.StepResult(uint64_t a1, uint64_t a2)
{
  return sub_18250(a1, a2, &qword_40E08, &qword_40E10);
}

void *initializeWithCopy for ContactPickerViewModel.StepResult(void *a1, const void *a2, uint64_t a3)
{
  return sub_182CC(a1, a2, a3, &qword_40E08, &qword_40E10);
}

void *assignWithCopy for ContactPickerViewModel.StepResult(void *a1, void *a2, uint64_t a3)
{
  return sub_18394(a1, a2, a3, &qword_40E08, &qword_40E10);
}

void *initializeWithTake for ContactPickerViewModel.StepResult(void *a1, const void *a2, uint64_t a3)
{
  return sub_184BC(a1, a2, a3, &qword_40E08, &qword_40E10);
}

void *assignWithTake for ContactPickerViewModel.StepResult(void *a1, void *a2, uint64_t a3)
{
  return sub_18584(a1, a2, a3, &qword_40E08, &qword_40E10);
}

uint64_t getEnumTagSinglePayload for ContactPickerViewModel.StepResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_17FAC);
}

uint64_t sub_17FAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_indexTm(a1, a2, a3, &qword_40E08);
}

uint64_t storeEnumTagSinglePayload for ContactPickerViewModel.StepResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_17FC4);
}

uint64_t sub_17FC4(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_indexTm(a1, a2, a3, a4, &qword_40E08);
}

uint64_t sub_17FD0(uint64_t a1, uint64_t a2)
{
  return sub_18770(a1, a2, &qword_40E08);
}

uint64_t sub_17FE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_187B4(a1, a2, a3, &qword_40E08);
}

uint64_t type metadata accessor for ContactPickerViewModel.StepResult(uint64_t a1)
{
  return sub_18808(a1, (uint64_t *)&unk_40E88, (uint64_t)&nominal type descriptor for ContactPickerViewModel.StepResult);
}

void sub_18000(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_18854(a1, a2, a3, &qword_40E98, (uint64_t)&type metadata for Bool);
}

_QWORD *initializeBufferWithCopyOfBuffer for ContactPickerViewModel.ConfirmationStep(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain(v3);
  return a1;
}

uint64_t destroy for ContactPickerViewModel.ConfirmationStep(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 8));
}

_QWORD *assignWithCopy for ContactPickerViewModel.ConfirmationStep(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain(v3);
  swift_release(v4);
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for ContactPickerViewModel.ConfirmationStep(uint64_t a1, _OWORD *a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *a2;
  swift_release(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactPickerViewModel.ConfirmationStep(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ContactPickerViewModel.ConfirmationStep(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ContactPickerViewModel.ConfirmationStep()
{
  return &type metadata for ContactPickerViewModel.ConfirmationStep;
}

uint64_t *initializeBufferWithCopyOfBuffer for ContactPickerViewModel.ActionResult(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_18164(a1, a2, a3, &qword_40EA0, &qword_40EA8);
}

uint64_t *sub_18164(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v7;
  int v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v7 = *(_QWORD *)(a3 - 8);
  v8 = *(_DWORD *)(v7 + 80);
  if ((v8 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v8 + 16) & ~(unint64_t)v8));
    swift_retain(v12);
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(a4);
    v11 = *(_QWORD *)(v10 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v11 + 48))(a2, 1, v10))
    {
      memcpy(a1, a2, *(_QWORD *)(v7 + 64));
    }
    else
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(a5);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(a1, a2, v13);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v11 + 56))(a1, 0, 1, v10);
    }
  }
  return a1;
}

uint64_t destroy for ContactPickerViewModel.ActionResult(uint64_t a1, uint64_t a2)
{
  return sub_18250(a1, a2, &qword_40EA0, &qword_40EA8);
}

uint64_t sub_18250(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a3);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(a1, 1, v6);
  if (!(_DWORD)result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(a4);
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(a1, v8);
  }
  return result;
}

void *initializeWithCopy for ContactPickerViewModel.ActionResult(void *a1, const void *a2, uint64_t a3)
{
  return sub_182CC(a1, a2, a3, &qword_40EA0, &qword_40EA8);
}

void *sub_182CC(void *a1, const void *a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v9 = __swift_instantiateConcreteTypeFromMangledName(a4);
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(a2, 1, v9))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(a5);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a1, a2, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(a1, 0, 1, v9);
  }
  return a1;
}

void *assignWithCopy for ContactPickerViewModel.ActionResult(void *a1, void *a2, uint64_t a3)
{
  return sub_18394(a1, a2, a3, &qword_40EA0, &qword_40EA8);
}

void *sub_18394(void *a1, void *a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v17;

  v10 = __swift_instantiateConcreteTypeFromMangledName(a4);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(a1, 1, v10);
  v14 = v12(a2, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      v17 = __swift_instantiateConcreteTypeFromMangledName(a5);
      (*(void (**)(void *, void *, uint64_t))(*(_QWORD *)(v17 - 8) + 24))(a1, a2, v17);
      return a1;
    }
    sub_1A198((uint64_t)a1, a4);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v15 = __swift_instantiateConcreteTypeFromMangledName(a5);
  (*(void (**)(void *, void *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(a1, a2, v15);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(a1, 0, 1, v10);
  return a1;
}

void *initializeWithTake for ContactPickerViewModel.ActionResult(void *a1, const void *a2, uint64_t a3)
{
  return sub_184BC(a1, a2, a3, &qword_40EA0, &qword_40EA8);
}

void *sub_184BC(void *a1, const void *a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v9 = __swift_instantiateConcreteTypeFromMangledName(a4);
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(a2, 1, v9))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(a5);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, a2, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(a1, 0, 1, v9);
  }
  return a1;
}

void *assignWithTake for ContactPickerViewModel.ActionResult(void *a1, void *a2, uint64_t a3)
{
  return sub_18584(a1, a2, a3, &qword_40EA0, &qword_40EA8);
}

void *sub_18584(void *a1, void *a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v17;

  v10 = __swift_instantiateConcreteTypeFromMangledName(a4);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(a1, 1, v10);
  v14 = v12(a2, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      v17 = __swift_instantiateConcreteTypeFromMangledName(a5);
      (*(void (**)(void *, void *, uint64_t))(*(_QWORD *)(v17 - 8) + 40))(a1, a2, v17);
      return a1;
    }
    sub_1A198((uint64_t)a1, a4);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v15 = __swift_instantiateConcreteTypeFromMangledName(a5);
  (*(void (**)(void *, void *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(a1, a2, v15);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(a1, 0, 1, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactPickerViewModel.ActionResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_186A4);
}

uint64_t sub_186A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_indexTm(a1, a2, a3, &qword_40EA0);
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  unsigned int v7;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a4);
  v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(a1, a2, v6);
  if (v7 >= 2)
    return v7 - 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ContactPickerViewModel.ActionResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_18708);
}

uint64_t sub_18708(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_indexTm(a1, a2, a3, a4, &qword_40EA0);
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v7;
  uint64_t v8;

  if (a2)
    v7 = (a2 + 1);
  else
    v7 = 0;
  v8 = __swift_instantiateConcreteTypeFromMangledName(a5);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(a1, v7, a3, v8);
}

uint64_t sub_18764(uint64_t a1, uint64_t a2)
{
  return sub_18770(a1, a2, &qword_40EA0);
}

uint64_t sub_18770(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(a3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, 1, v4);
}

uint64_t sub_187A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_187B4(a1, a2, a3, &qword_40EA0);
}

uint64_t sub_187B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a4);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, a2, 1, v6);
}

uint64_t type metadata accessor for ContactPickerViewModel.ActionResult(uint64_t a1)
{
  return sub_18808(a1, (uint64_t *)&unk_40F20, (uint64_t)&nominal type descriptor for ContactPickerViewModel.ActionResult);
}

uint64_t sub_18808(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata(a1, a3);
  return result;
}

void sub_1883C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_18854(a1, a2, a3, &qword_40F30, (uint64_t)&type metadata for () + 8);
}

void sub_18854(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5)
{
  uint64_t v6;
  unint64_t v7;

  sub_188B0(319, a4, a5);
  if (v7 <= 0x3F)
    swift_initEnumMetadataSinglePayload(a1, 256, *(_QWORD *)(v6 - 8) + 64, 1);
}

void sub_188B0(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    v4 = type metadata accessor for AlertInfo(0, a3);
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t initializeBufferWithCopyOfBuffer for ContactPickerViewModel.Dependencies(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for ContactPickerViewModel.Dependencies(_QWORD *a1)
{
  swift_release(a1[1]);
  swift_release(a1[3]);
  return swift_bridgeObjectRelease(a1[4]);
}

uint64_t initializeWithCopy for ContactPickerViewModel.Dependencies(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  swift_retain(v3);
  swift_retain(v4);
  swift_bridgeObjectRetain(v5);
  return a1;
}

_QWORD *assignWithCopy for ContactPickerViewModel.Dependencies(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a2[1];
  v5 = a1[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain(v4);
  swift_release(v5);
  v6 = a2[3];
  v7 = a1[3];
  a1[2] = a2[2];
  a1[3] = v6;
  swift_retain(v6);
  swift_release(v7);
  v8 = a2[4];
  v9 = a1[4];
  a1[4] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ContactPickerViewModel.Dependencies(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release(v4);
  v5 = *(_QWORD *)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release(v5);
  v6 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease(v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactPickerViewModel.Dependencies(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ContactPickerViewModel.Dependencies(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ContactPickerViewModel.Dependencies()
{
  return &type metadata for ContactPickerViewModel.Dependencies;
}

uint64_t sub_18B40(uint64_t a1)
{
  unint64_t v1;
  int v2;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  v2 = v1 - 1;
  if (v2 < 0)
    v2 = -1;
  return (v2 + 1);
}

_QWORD *sub_18B64(_QWORD *result, unsigned int a2)
{
  if (a2 > 0x7FFFFFFE)
  {
    *result = a2 - 0x7FFFFFFF;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ContactPickerViewModel.Dependencies.ReachabilityResult()
{
  return &type metadata for ContactPickerViewModel.Dependencies.ReachabilityResult;
}

unint64_t _s13FindMyAppCore22ContactPickerViewModelC12DependenciesV18ReachabilityResultOwxx_0(uint64_t a1)
{
  unint64_t result;
  int v2;

  result = *(_QWORD *)(a1 + 8);
  v2 = -1;
  if (result < 0xFFFFFFFF)
    v2 = result;
  if (v2 - 1 < 0)
    return swift_bridgeObjectRelease(result);
  return result;
}

_QWORD *_s13FindMyAppCore22ContactPickerViewModelC12DependenciesV18ReachabilityResultOwCP_0(_QWORD *a1, _QWORD *a2)
{
  unint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  LODWORD(v4) = -1;
  if (v3 < 0xFFFFFFFF)
    v4 = a2[1];
  if ((int)v4 - 1 < 0)
  {
    *a1 = *a2;
    a1[1] = v3;
    swift_bridgeObjectRetain(v3);
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  return a1;
}

_QWORD *_s13FindMyAppCore22ContactPickerViewModelC12DependenciesV18ReachabilityResultOwca_0(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v11;

  v4 = a1[1];
  LODWORD(v5) = -1;
  if (v4 >= 0xFFFFFFFF)
    LODWORD(v6) = -1;
  else
    v6 = a1[1];
  v7 = v6 - 1;
  if (a2[1] < 0xFFFFFFFFuLL)
    v5 = a2[1];
  v8 = v5 - 1;
  if (v7 < 0)
  {
    if (v8 < 0)
    {
      *a1 = *a2;
      v11 = a2[1];
      a1[1] = v11;
      swift_bridgeObjectRetain(v11);
      swift_bridgeObjectRelease(v4);
      return a1;
    }
    swift_bridgeObjectRelease(a1[1]);
    goto LABEL_11;
  }
  if ((v8 & 0x80000000) == 0)
  {
LABEL_11:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *a1 = *a2;
  v9 = a2[1];
  a1[1] = v9;
  swift_bridgeObjectRetain(v9);
  return a1;
}

_QWORD *_s13FindMyAppCore22ContactPickerViewModelC12DependenciesV18ReachabilityResultOwta_0(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;
  int v5;
  unint64_t v6;
  uint64_t v7;

  v4 = a1[1];
  v5 = -1;
  if (v4 < 0xFFFFFFFF)
    v5 = v4;
  if (v5 - 1 < 0)
  {
    v6 = a2[1];
    LODWORD(v7) = -1;
    if (v6 < 0xFFFFFFFF)
      v7 = a2[1];
    if ((int)v7 - 1 < 0)
    {
      *a1 = *a2;
      a1[1] = v6;
      swift_bridgeObjectRelease(v4);
      return a1;
    }
    swift_bridgeObjectRelease(v4);
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  return a1;
}

uint64_t _s13FindMyAppCore22ContactPickerViewModelC12DependenciesV18ReachabilityResultOwet_0(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  if ((v4 + 1) >= 2)
    return v4;
  else
    return 0;
}

uint64_t _s13FindMyAppCore22ContactPickerViewModelC12DependenciesV18ReachabilityResultOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for ContactPickerViewModel.Dependencies.PartOfSignedInAccountResult()
{
  return &type metadata for ContactPickerViewModel.Dependencies.PartOfSignedInAccountResult;
}

uint64_t sub_18DEC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t result;

  if (a4)
  {
    if (a4 != 1)
      return result;
    a2 = a3;
  }
  return swift_bridgeObjectRetain(a2);
}

uint64_t destroy for ContactPickerViewModel.RecipientStatus(uint64_t a1)
{
  return sub_18E20(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_BYTE *)(a1 + 24));
}

uint64_t sub_18E20(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t result;

  if (a4)
  {
    if (a4 != 1)
      return result;
    a2 = a3;
  }
  return swift_bridgeObjectRelease(a2);
}

uint64_t initializeWithCopy for ContactPickerViewModel.RecipientStatus(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_18DEC(*(_QWORD *)a2, v4, v5, v6);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for ContactPickerViewModel.RecipientStatus(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_18DEC(*(_QWORD *)a2, v4, v5, v6);
  v7 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  v10 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v6;
  sub_18E20(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ContactPickerViewModel.RecipientStatus(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_BYTE *)(a2 + 24);
  v5 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  v8 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v4;
  sub_18E20(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactPickerViewModel.RecipientStatus(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ContactPickerViewModel.RecipientStatus(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_BYTE *)(result + 24) = -(char)a2;
  }
  return result;
}

uint64_t sub_18FF8(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 24) <= 1u)
    return *(unsigned __int8 *)(a1 + 24);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_19010(uint64_t result, unsigned int a2)
{
  uint64_t v2;

  v2 = a2 - 2;
  if (a2 >= 2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    LOBYTE(a2) = 2;
    *(_QWORD *)result = v2;
  }
  *(_BYTE *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ContactPickerViewModel.RecipientStatus()
{
  return &type metadata for ContactPickerViewModel.RecipientStatus;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ContactPickerViewModel.RecipientStatus.InvalidReason(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ContactPickerViewModel.RecipientStatus.InvalidReason(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_19128 + 4 * byte_337A5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1915C + 4 * byte_337A0[v4]))();
}

uint64_t sub_1915C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_19164(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1916CLL);
  return result;
}

uint64_t sub_19178(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x19180);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_19184(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1918C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_19198(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_191A0(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ContactPickerViewModel.RecipientStatus.InvalidReason()
{
  return &type metadata for ContactPickerViewModel.RecipientStatus.InvalidReason;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_191FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1923C()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_19264(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = *(_QWORD *)(type metadata accessor for Handle(0) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = v1[2];
  v7 = v1[3];
  v8 = v1[4];
  v9 = (uint64_t)v1 + v5;
  v10 = *(_QWORD *)((char *)v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  v11 = (_QWORD *)swift_task_alloc(dword_40F6C);
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_1A22C;
  return sub_7730(a1, v6, v7, v8, v9, v10);
}

uint64_t sub_19330(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_19368()
{
  uint64_t v0;

  return sub_3AB8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_19380(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_40F8C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1A22C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_40F88 + dword_40F88))(a1, v4);
}

uint64_t sub_193F0(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 != 1)
    return swift_bridgeObjectRelease(a2);
  return result;
}

uint64_t sub_19404(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4 != -1)
    return sub_18DEC(a1, a2, a3, a4);
  return a1;
}

uint64_t sub_19418(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (a4 != -1)
    return sub_18E20(a1, a2, a3, a4);
  return a1;
}

void sub_1943C()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 112) = *(_BYTE *)(v0 + 24);
}

uint64_t sub_19454()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = v0[3];
  v2 = v0[4];
  v3 = (uint64_t *)(v0[2] + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__externalDidChangeRecipientsStatus);
  v4 = *v3;
  v5 = v3[1];
  *v3 = v1;
  v3[1] = v2;
  sub_194C8(v1, v2);
  return sub_17920(v4, v5);
}

uint64_t sub_194A8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_194C8(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

uint64_t sub_194D8(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_194E0()
{
  uint64_t v0;

  return sub_3454(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t objectdestroy_34Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = type metadata accessor for Handle(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 40) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return swift_deallocObject(v0, ((v6 + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v5);
}

uint64_t sub_1959C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = *(_QWORD *)(type metadata accessor for Handle(0) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = v1[2];
  v7 = v1[3];
  v8 = v1[4];
  v9 = (uint64_t)v1 + v5;
  v10 = *(_QWORD *)((char *)v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  v11 = (_QWORD *)swift_task_alloc(dword_40FDC);
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_1A22C;
  return sub_7FC8(a1, v6, v7, v8, v9, v10);
}

id sub_19660(uint64_t a1, uint64_t a2)
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSString v25;
  NSString v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  NSString v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSString v39;
  NSString v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  void (*v55)(char *, uint64_t);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  os_log_type_t v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  void (*v67)(char *, uint64_t);
  os_log_t v68;
  uint64_t v69;
  uint64_t v71;
  int v72;
  os_log_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;

  v4 = type metadata accessor for Handle.Kind(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v71 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Handle(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v71 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v10);
  v15 = (char *)&v71 - v14;
  __chkstk_darwin(v13);
  v17 = (char *)&v71 - v16;
  swift_bridgeObjectRetain(a2);
  v18 = Handle.init(rawValue:)(a1, a2);
  Handle.kind.getter(v18);
  v19 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if ((_DWORD)v19 == enum case for Handle.Kind.phoneNumber(_:))
  {
    v20 = Handle.rawValue.getter(v19);
    v22 = v21;
    Handle.rawValue.getter(v20);
    v24 = v23;
    v25 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v22);
    v26 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v24);
    v27 = objc_msgSend((id)objc_opt_self(CNContact), "contactWithDisplayName:emailOrPhoneNumber:", v25, v26);

    Handle.rawValue.getter(v28);
    v30 = v29;
    v31 = objc_allocWithZone((Class)CNComposeRecipient);
    v32 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v30);
    v33 = objc_msgSend(v31, "initWithContact:address:kind:", v27, v32, 1);
LABEL_5:
    v45 = v33;

    (*(void (**)(char *, uint64_t))(v9 + 8))(v17, v8);
    return v45;
  }
  if ((_DWORD)v19 == enum case for Handle.Kind.email(_:))
  {
    v34 = Handle.rawValue.getter(v19);
    v36 = v35;
    Handle.rawValue.getter(v34);
    v38 = v37;
    v39 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v36);
    v40 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v38);
    v27 = objc_msgSend((id)objc_opt_self(CNContact), "contactWithDisplayName:emailOrPhoneNumber:", v39, v40);

    Handle.rawValue.getter(v41);
    v43 = v42;
    v44 = objc_allocWithZone((Class)CNComposeRecipient);
    v32 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v43);
    v33 = objc_msgSend(v44, "initWithContact:address:kind:", v27, v32, 0);
    goto LABEL_5;
  }
  if ((_DWORD)v19 == enum case for Handle.Kind.unknown(_:))
  {
    if (qword_40BE0 != -1)
      swift_once(&qword_40BE0, sub_2C68);
    v46 = type metadata accessor for Logger(0);
    __swift_project_value_buffer(v46, (uint64_t)qword_40C18);
    v47 = (*(uint64_t (**)(char *, char *, uint64_t))(v9 + 16))(v15, v17, v8);
    v48 = Logger.logObject.getter(v47);
    v49 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v48, v49))
    {
      v50 = swift_slowAlloc(32, -1);
      v74 = swift_slowAlloc(64, -1);
      v76 = v74;
      *(_DWORD *)v50 = 136315651;
      v75 = sub_FD1C(0xD000000000000016, 0x8000000000038310, &v76);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v50 + 4, v50 + 12);
      *(_WORD *)(v50 + 12) = 2160;
      v75 = 1752392040;
      v51 = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v50 + 14, v50 + 22);
      *(_WORD *)(v50 + 22) = 2081;
      v52 = Handle.debugDescription.getter(v51);
      v54 = v53;
      v75 = sub_FD1C(v52, v53, &v76);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v50 + 24, v50 + 32);
      swift_bridgeObjectRelease(v54);
      v55 = *(void (**)(char *, uint64_t))(v9 + 8);
      v55(v15, v8);
      _os_log_impl(&dword_0, v48, v49, "FMRecipientsViewModel: %s - %{private,mask.hash}s", (uint8_t *)v50, 0x20u);
      v56 = v74;
      swift_arrayDestroy(v74, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v56, -1, -1);
      swift_slowDealloc(v50, -1, -1);

    }
    else
    {

      v55 = *(void (**)(char *, uint64_t))(v9 + 8);
      v55(v15, v8);
    }
    v55(v17, v8);
  }
  else
  {
    if (qword_40BE0 != -1)
      swift_once(&qword_40BE0, sub_2C68);
    v57 = type metadata accessor for Logger(0);
    __swift_project_value_buffer(v57, (uint64_t)qword_40C18);
    v58 = (*(uint64_t (**)(char *, char *, uint64_t))(v9 + 16))(v12, v17, v8);
    v59 = Logger.logObject.getter(v58);
    v60 = static os_log_type_t.error.getter();
    v61 = v60;
    if (os_log_type_enabled(v59, v60))
    {
      v62 = swift_slowAlloc(32, -1);
      v74 = swift_slowAlloc(64, -1);
      v76 = v74;
      *(_DWORD *)v62 = 136315651;
      v73 = v59;
      v75 = sub_FD1C(0xD000000000000016, 0x8000000000038310, &v76);
      v72 = v61;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v62 + 4, v62 + 12);
      *(_WORD *)(v62 + 12) = 2160;
      v75 = 1752392040;
      v63 = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v62 + 14, v62 + 22);
      *(_WORD *)(v62 + 22) = 2081;
      v71 = v62 + 24;
      v64 = Handle.debugDescription.getter(v63);
      v66 = v65;
      v75 = sub_FD1C(v64, v65, &v76);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v75, &v76, v71, v62 + 32);
      swift_bridgeObjectRelease(v66);
      v67 = *(void (**)(char *, uint64_t))(v9 + 8);
      v67(v12, v8);
      v68 = v73;
      _os_log_impl(&dword_0, v73, (os_log_type_t)v72, "FMRecipientsViewModel: %s - %{private,mask.hash}s", (uint8_t *)v62, 0x20u);
      v69 = v74;
      swift_arrayDestroy(v74, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v69, -1, -1);
      swift_slowDealloc(v62, -1, -1);

    }
    else
    {

      v67 = *(void (**)(char *, uint64_t))(v9 + 8);
      v67(v12, v8);
    }
    v67(v17, v8);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return 0;
}

uint64_t sub_19D7C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_19DBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_40C78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_19E14()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_19E40()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc(dword_41034);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_19EA0;
  return sub_48D0(v2, v3, v4);
}

uint64_t sub_19EA0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_19EF0()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 113) = *(_BYTE *)(v0 + 24);
}

uint64_t sub_19F00(uint64_t a1)
{
  uint64_t v1;

  return sub_4728(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_19F08(uint64_t a1)
{
  uint64_t v1;

  return sub_45EC(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_19F10()
{
  uint64_t v0;

  return sub_3840(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

unint64_t sub_19F28()
{
  unint64_t result;

  result = qword_41060;
  if (!qword_41060)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_41060);
  }
  return result;
}

uint64_t sub_19F6C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v6 = v2[2];
  v7 = v2[3];
  v8 = v2[4];
  v9 = (_QWORD *)swift_task_alloc(dword_410D4);
  *(_QWORD *)(v3 + 16) = v9;
  *v9 = v3;
  v9[1] = sub_1A22C;
  return sub_CEFC(a1, a2, v6, v7, v8);
}

uint64_t sub_19FE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for Handle(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 48) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 40));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1A064(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  int *v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t);

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for Handle(0) - 8) + 80);
  v5 = *(int **)(v1 + 32);
  v6 = v1 + ((v4 + 48) & ~v4);
  v7 = (_QWORD *)swift_task_alloc(dword_41114);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_19EA0;
  v7[2] = a1;
  v7[3] = v6;
  v10 = (uint64_t (*)(uint64_t))((char *)v5 + *v5);
  v8 = (_QWORD *)swift_task_alloc(v5[1]);
  v7[4] = v8;
  *v8 = v7;
  v8[1] = sub_D9C4;
  return v10(v6);
}

uint64_t sub_1A114(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1A154(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1A198(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1A1D4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_1A240()
{
  sub_1943C();
}

void sub_1A254()
{
  sub_19EF0();
}

uint64_t sub_1A268()
{
  return sub_19F10();
}

uint64_t sub_1A290()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ItemsModule()
{
  return objc_opt_self(_TtC13FindMyAppCoreP33_5E0E53164D93190C3BEB5E12763998DB11ItemsModule);
}

uint64_t type metadata accessor for PeopleModule()
{
  return objc_opt_self(_TtC13FindMyAppCoreP33_6248E06807B4ADA120AAA32BBC2EE1EF12PeopleModule);
}

uint64_t sub_1A2E0@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_33C20);
  v7 = v3;
  v5 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v7, KeyPath, v5);
  result = swift_release(KeyPath);
  *a2 = *(_BYTE *)(v3 + 113);
  return result;
}

uint64_t sub_1A36C(char *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  _QWORD v7[3];
  char v8;
  uint64_t v9;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_33C20);
  v7[2] = v3;
  v8 = v2;
  v9 = v3;
  v5 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v9, KeyPath, sub_1D670, v7, (char *)&type metadata for () + 8, v5);
  return swift_release(KeyPath);
}

uint64_t sub_1A414@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_33C78);
  v7 = v3;
  v5 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v7, KeyPath, v5);
  result = swift_release(KeyPath);
  *a2 = *(_BYTE *)(v3 + 114);
  return result;
}

uint64_t sub_1A4A0(char *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  _QWORD v7[3];
  char v8;
  uint64_t v9;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_33C78);
  v7[2] = v3;
  v8 = v2;
  v9 = v3;
  v5 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v9, KeyPath, sub_1D24C, v7, (char *)&type metadata for () + 8, v5);
  return swift_release(KeyPath);
}

uint64_t sub_1A548@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[3];

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_33CA0);
  v8[0] = v3;
  v5 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)(v8, KeyPath, v5);
  swift_release(KeyPath);
  v6 = v3 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__alert;
  swift_beginAccess(v3 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__alert, v8, 0, 0);
  return sub_1A1D4(v6, a2, &qword_40C78);
}

uint64_t sub_1A600(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t KeyPath;
  uint64_t v9;
  _BYTE v11[16];
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_40C78);
  __chkstk_darwin(v4);
  v6 = &v11[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1A1D4(a1, (uint64_t)v6, &qword_40C78);
  v7 = *a2;
  KeyPath = swift_getKeyPath(&unk_33CA0);
  v12 = v7;
  v13 = v6;
  v14 = v7;
  v9 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v14, KeyPath, sub_1A268, v11, (char *)&type metadata for () + 8, v9);
  swift_release(KeyPath);
  return sub_1A198((uint64_t)v6, &qword_40C78);
}

uint64_t ContactPickerView.init(viewModel:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t result;

  v4 = (_QWORD *)((char *)a2 + *(int *)(type metadata accessor for ContactPickerView(0) + 20));
  *v4 = swift_getKeyPath(&unk_33BF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_41258);
  result = swift_storeEnumTagMultiPayload(v4, v5, 0);
  *a2 = a1;
  return result;
}

uint64_t type metadata accessor for ContactPickerView(uint64_t a1)
{
  uint64_t result;

  result = qword_41338;
  if (!qword_41338)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ContactPickerView);
  return result;
}

uint64_t ContactPickerView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t KeyPath;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t OpaqueTypeConformance2;
  char *v30;
  uint64_t v31;
  uint64_t *v32;
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
  char *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  char *v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  char *v87;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t *v93;
  char *v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  char v120[16];
  uint64_t *v121;
  char v122[8];
  _QWORD v123[2];
  unsigned __int8 v124;
  _QWORD v125[2];
  uint64_t v126;
  void *v127;
  _BYTE *(*v128)(_BYTE *);
  void *v129;

  v113 = a1;
  v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_40C38);
  v104 = *(_QWORD *)(v106 - 8);
  __chkstk_darwin(v106);
  v92 = (char *)&v92 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_40C78);
  v4 = __chkstk_darwin(v3);
  v112 = (uint64_t)&v92 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v105 = (uint64_t)&v92 - v6;
  v7 = type metadata accessor for ContactPickerView(0);
  v103 = *(_QWORD *)(v7 - 8);
  v117 = *(_QWORD *)(v103 + 64);
  __chkstk_darwin(v7);
  v115 = (uint64_t)&v92 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v96 = type metadata accessor for NavigationBarItem.TitleDisplayMode(0);
  v9 = *(_QWORD *)(v96 - 8);
  __chkstk_darwin(v96);
  v95 = (char *)&v92 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_41260);
  v98 = *(_QWORD *)(v97 - 8);
  __chkstk_darwin(v97);
  v12 = (char *)&v92 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_41268);
  v100 = *(_QWORD *)(v99 - 8);
  __chkstk_darwin(v99);
  v94 = (char *)&v92 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_41270);
  v102 = *(_QWORD *)(v118 - 8);
  __chkstk_darwin(v118);
  v114 = (char *)&v92 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_41278);
  v110 = *(_QWORD *)(v111 - 8);
  __chkstk_darwin(v111);
  v119 = (char *)&v92 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_41280);
  v108 = *(_QWORD *)(v109 - 8);
  __chkstk_darwin(v109);
  v107 = (char *)&v92 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *v1;
  KeyPath = swift_getKeyPath(&unk_33C20);
  v126 = v17;
  v19 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
  v116 = v19;
  swift_retain(v17);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v126, KeyPath, v19);
  swift_release(KeyPath);
  v20 = *(_BYTE *)(v17 + 113);
  v21 = swift_getKeyPath(&unk_33C48);
  v22 = swift_allocObject(&unk_3D8C8, 17, 7);
  *(_BYTE *)(v22 + 16) = v20;
  v126 = v17;
  v127 = (void *)v21;
  v128 = sub_1C5D0;
  v129 = (void *)v22;
  v23 = *(_QWORD *)(v17 + 24);
  v125[0] = *(_QWORD *)(v17 + 16);
  v125[1] = v23;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_41288);
  v25 = sub_1D30C(&qword_41290, &qword_41288, (void (*)(void))sub_1C5E8);
  v26 = sub_19F28();
  View.navigationTitle<A>(_:)(v125, v24, &type metadata for String, v25, v26);
  swift_release(v22);
  swift_release(v21);
  swift_release(v17);
  v27 = v95;
  v28 = v96;
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v95, enum case for NavigationBarItem.TitleDisplayMode.inline(_:), v96);
  v126 = v24;
  v127 = &type metadata for String;
  v128 = (_BYTE *(*)(_BYTE *))v25;
  v129 = (void *)v26;
  v101 = v26;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v126, &opaque type descriptor for <<opaque return type of View.navigationTitle<A>(_:)>>, 1);
  v30 = v94;
  v31 = v97;
  View.navigationBarTitleDisplayMode(_:)(v27, v97, OpaqueTypeConformance2);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v27, v28);
  (*(void (**)(char *, uint64_t))(v98 + 8))(v12, v31);
  v32 = v93;
  v121 = v93;
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_412A8);
  v126 = v31;
  v127 = (void *)OpaqueTypeConformance2;
  v34 = swift_getOpaqueTypeConformance2(&v126, &opaque type descriptor for <<opaque return type of View.navigationBarTitleDisplayMode(_:)>>, 1);
  v35 = sub_1A114(&qword_412B0, &qword_412A8, (uint64_t)&protocol conformance descriptor for TupleToolbarContent<A>);
  v36 = v99;
  View.toolbar<A>(content:)(sub_1C62C, v120, v99, v33, v34, v35);
  (*(void (**)(char *, uint64_t))(v100 + 8))(v30, v36);
  v37 = *v32;
  v38 = swift_getKeyPath(&unk_33C78);
  v126 = v37;
  v39 = v116;
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v126, v38, v116);
  swift_release(v38);
  LOBYTE(v125[0]) = *(_BYTE *)(v37 + 114);
  v40 = v115;
  sub_1C63C((uint64_t)v32, v115);
  v41 = *(unsigned __int8 *)(v103 + 80);
  v98 = ~v41;
  v42 = (v41 + 16) & ~v41;
  v100 = v41 | 7;
  v43 = swift_allocObject(&unk_3D8F0, v42 + v117, v41 | 7);
  sub_1C730(v40, v43 + v42);
  v126 = v36;
  v127 = (void *)v33;
  v44 = v104;
  v128 = (_BYTE *(*)(_BYTE *))v34;
  v129 = (void *)v35;
  v45 = swift_getOpaqueTypeConformance2(&v126, &opaque type descriptor for <<opaque return type of View.toolbar<A>(content:)>>, 1);
  v46 = v118;
  v103 = v45;
  v47 = v114;
  View.onChange<A>(of:initial:_:)(v125, 0, sub_1C774, v43, v118, &type metadata for Bool);
  swift_release(v43);
  (*(void (**)(char *, uint64_t))(v102 + 8))(v47, v46);
  v48 = v32;
  v49 = *v32;
  v50 = swift_getKeyPath(&unk_33CA0);
  v126 = v49;
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v126, v50, v39);
  swift_release(v50);
  v51 = v49 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__alert;
  v52 = v106;
  swift_beginAccess(v51, v125, 0, 0);
  v53 = v51;
  v54 = v105;
  sub_1A1D4(v53, v105, &qword_40C78);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v44 + 48))(v54, 1, v52))
  {
    sub_1A198(v54, &qword_40C78);
    v55 = 0xE100000000000000;
    v56 = 45;
  }
  else
  {
    v57 = v92;
    (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))(v92, v54, v52);
    sub_1A198(v54, &qword_40C78);
    v56 = AlertInfo.title.getter(v52);
    v55 = v58;
    (*(void (**)(char *, uint64_t))(v44 + 8))(v57, v52);
  }
  v59 = v52;
  v126 = v56;
  v127 = (void *)v55;
  v105 = Text.init<A>(_:)(&v126, &type metadata for String, v101);
  v104 = v60;
  v114 = v61;
  LODWORD(v102) = v62 & 1;
  v63 = v115;
  sub_1C63C((uint64_t)v48, v115);
  v64 = type metadata accessor for MainActor(0);
  v65 = static MainActor.shared.getter(v64);
  v66 = (v41 + 32) & v98;
  v67 = v66 + v117;
  v68 = v100;
  v69 = swift_allocObject(&unk_3D918, v66 + v117, v100);
  *(_QWORD *)(v69 + 16) = v65;
  *(_QWORD *)(v69 + 24) = &protocol witness table for MainActor;
  sub_1C730(v63, v69 + v66);
  v70 = sub_1C63C((uint64_t)v48, v63);
  v71 = static MainActor.shared.getter(v70);
  v72 = swift_allocObject(&unk_3D940, v67, v68);
  *(_QWORD *)(v72 + 16) = v71;
  *(_QWORD *)(v72 + 24) = &protocol witness table for MainActor;
  sub_1C730(v63, v72 + v66);
  Binding.init(get:set:)(v123, sub_1C7CC, v69, sub_1C8C8, v72, &type metadata for Bool);
  v73 = v123[0];
  v74 = v123[1];
  LODWORD(v117) = v124;
  v75 = *v48;
  v76 = swift_getKeyPath(&unk_33CA0);
  v126 = v75;
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v126, v76, v116);
  swift_release(v76);
  v77 = v75 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__alert;
  swift_beginAccess(v75 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__alert, v122, 0, 0);
  v78 = v112;
  sub_1A1D4(v77, v112, &qword_40C78);
  v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_412B8);
  v126 = v118;
  v127 = &type metadata for Bool;
  v128 = (_BYTE *(*)(_BYTE *))v103;
  v129 = &protocol witness table for Bool;
  v80 = swift_getOpaqueTypeConformance2(&v126, &opaque type descriptor for <<opaque return type of View.onChange<A>(of:initial:_:)>>, 1);
  v81 = sub_1C908();
  v91 = v80;
  v90 = v59;
  v89 = v79;
  v82 = v111;
  v83 = v107;
  v84 = v105;
  v85 = v104;
  LOBYTE(v68) = v102;
  v86 = v114;
  v87 = v119;
  View.alert<A, B, C>(_:isPresented:presenting:actions:message:)(v105, v104, v102, v114, v73, v74, v117, v78, sub_1C104, 0, sub_1C4A0, 0, v111, v89, &type metadata for Text, v90, v91, v81, &protocol witness table for Text);
  swift_release(v74);
  swift_release(v73);
  sub_1C984(v84, v85, v68);
  swift_bridgeObjectRelease(v86);
  sub_1A198(v78, &qword_40C78);
  (*(void (**)(char *, uint64_t))(v110 + 8))(v87, v82);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v108 + 32))(v113, v83, v109);
}

uint64_t sub_1B274@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t OpaqueTypeConformance2;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char v50[16];
  char *v51;
  uint64_t v52;
  uint64_t v53;

  v49 = a2;
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_413A8);
  __chkstk_darwin(v48);
  v47 = (char *)&v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_413B0);
  v45 = *(_QWORD *)(v4 - 8);
  v46 = v4;
  __chkstk_darwin(v4);
  v44 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_413B8);
  v7 = __chkstk_darwin(v6);
  v9 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v44 - v10;
  v12 = type metadata accessor for ToolbarItemPlacement(0);
  v13 = __chkstk_darwin(v12);
  v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v17 = (char *)&v44 - v16;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_413C0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = __chkstk_darwin(v18);
  v22 = (char *)&v44 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __chkstk_darwin(v20);
  v25 = (char *)&v44 - v24;
  static ToolbarItemPlacement.primaryAction.getter(v23);
  v51 = a1;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_413C8);
  v27 = sub_1D270();
  ToolbarItem<>.init(placement:content:)(v17, sub_1D268, v50, v26, v27);
  v28 = (*(uint64_t (**)(char *, char *, uint64_t))(v19 + 32))(v25, v22, v18);
  if (*(_BYTE *)(*(_QWORD *)a1 + 32) == 1)
  {
    v29 = static ToolbarItemPlacement.cancellationAction.getter(v28);
    __chkstk_darwin(v29);
    *(&v44 - 2) = a1;
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_41440);
    v31 = sub_1D4C8();
    v32 = v44;
    ToolbarItem<>.init(placement:content:)(v15, sub_1D4C0, &v44 - 4, v30, v31);
    v33 = sub_1A114(&qword_41438, &qword_413B0, (uint64_t)&protocol conformance descriptor for ToolbarItem<A, B>);
    v34 = v46;
    static ToolbarContentBuilder.buildBlock<A>(_:)(v32, v46, v33);
    v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_41430);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v9, 0, 1, v35);
    v52 = v34;
    v53 = v33;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v52, &opaque type descriptor for <<opaque return type of static ToolbarContentBuilder.buildBlock<A>(_:)>>, 1);
    static ToolbarContentBuilder.buildIf<A>(_:)(v9, v35, OpaqueTypeConformance2);
    sub_1A198((uint64_t)v9, &qword_413B8);
    (*(void (**)(char *, uint64_t))(v45 + 8))(v32, v34);
  }
  else
  {
    v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_41430);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 56))(v9, 1, 1, v37);
    v38 = sub_1A114(&qword_41438, &qword_413B0, (uint64_t)&protocol conformance descriptor for ToolbarItem<A, B>);
    v52 = v46;
    v53 = v38;
    v39 = swift_getOpaqueTypeConformance2(&v52, &opaque type descriptor for <<opaque return type of static ToolbarContentBuilder.buildBlock<A>(_:)>>, 1);
    static ToolbarContentBuilder.buildIf<A>(_:)(v9, v37, v39);
    sub_1A198((uint64_t)v9, &qword_413B8);
  }
  v41 = v47;
  v40 = v48;
  v42 = (uint64_t)&v47[*(int *)(v48 + 48)];
  (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v47, v25, v18);
  sub_1A1D4((uint64_t)v11, v42, &qword_413B8);
  TupleToolbarContent.init(_:)(v41, v40);
  sub_1A198((uint64_t)v11, &qword_413B8);
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v25, v18);
}

uint64_t sub_1B6A8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
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
  void (*v27)(void *(*)(uint64_t, uint64_t), uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t OpaqueTypeConformance2;
  char *v36;
  uint64_t v37;
  uint64_t KeyPath;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  int v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v62;
  uint64_t *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  _QWORD v81[5];

  v63 = a1;
  v80 = a2;
  v3 = type metadata accessor for ContactPickerView(0);
  __chkstk_darwin(v3);
  v79 = (uint64_t *)((char *)&v62 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = type metadata accessor for KeyboardShortcut(0);
  v73 = *(_QWORD *)(v5 - 8);
  v74 = v5;
  __chkstk_darwin(v5);
  v70 = (char *)&v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for TitleOnlyLabelStyle(0);
  v68 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v9 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for GenericControl.Info(0);
  __chkstk_darwin(v10);
  v12 = (char *)&v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for GenericControl(0);
  v65 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v15 = (char *)&v62 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_413F8);
  v17 = *(_QWORD *)(v16 - 8);
  v66 = v16;
  v67 = v17;
  __chkstk_darwin(v16);
  v19 = (char *)&v62 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_41458);
  v71 = *(_QWORD *)(v20 - 8);
  v72 = v20;
  __chkstk_darwin(v20);
  v64 = (char *)&v62 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_413F0);
  __chkstk_darwin(v69);
  v23 = (char *)&v62 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_413E0);
  __chkstk_darwin(v75);
  v78 = (uint64_t)&v62 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_413C8);
  __chkstk_darwin(v76);
  v77 = (uint64_t)&v62 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = *a1;
  v27 = *(void (**)(void *(*)(uint64_t, uint64_t), uint64_t))(*a1 + 40);
  swift_retain(v26);
  v27(sub_1D574, v26);
  swift_release(v26);
  v28 = GenericControl.init(info:matchingSizeOfInfos:)(v12, _swiftEmptyArrayStorage);
  TitleOnlyLabelStyle.init()(v28);
  v29 = sub_19D7C(&qword_41400, (uint64_t (*)(uint64_t))&type metadata accessor for GenericControl, (uint64_t)&protocol conformance descriptor for GenericControl);
  v30 = sub_19D7C(&qword_41408, (uint64_t (*)(uint64_t))&type metadata accessor for TitleOnlyLabelStyle, (uint64_t)&protocol conformance descriptor for TitleOnlyLabelStyle);
  View.labelStyle<A>(_:)(v9, v13, v7, v29, v30);
  v31 = v9;
  v32 = (uint64_t)v23;
  (*(void (**)(char *, uint64_t))(v68 + 8))(v31, v7);
  v33 = (*(uint64_t (**)(char *, uint64_t))(v65 + 8))(v15, v13);
  v34 = v70;
  static KeyboardShortcut.defaultAction.getter(v33);
  v81[0] = v13;
  v81[1] = v7;
  v81[2] = v29;
  v81[3] = v30;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v81, &opaque type descriptor for <<opaque return type of View.labelStyle<A>(_:)>>, 1);
  v36 = v64;
  v37 = v66;
  View.keyboardShortcut(_:)(v34, v66, OpaqueTypeConformance2);
  (*(void (**)(char *, uint64_t))(v73 + 8))(v34, v74);
  (*(void (**)(char *, uint64_t))(v67 + 8))(v19, v37);
  KeyPath = swift_getKeyPath(&unk_33D68);
  v39 = (uint64_t)v63;
  v40 = *v63;
  v41 = swift_getKeyPath(&unk_33C20);
  v81[0] = v40;
  v42 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)(v81, v41, v42);
  swift_release(v41);
  v43 = *(_BYTE *)(v40 + 113);
  v45 = v71;
  v44 = v72;
  (*(void (**)(uint64_t, char *, uint64_t))(v71 + 16))(v32, v36, v72);
  v46 = v32 + *(int *)(v69 + 36);
  *(_QWORD *)v46 = KeyPath;
  *(_BYTE *)(v46 + 8) = v43;
  (*(void (**)(char *, uint64_t))(v45 + 8))(v36, v44);
  v47 = swift_getKeyPath(&unk_33D98);
  v81[0] = v40;
  ObservationRegistrar.access<A, B>(_:keyPath:)(v81, v47, v42);
  v48 = v47;
  v49 = 1;
  swift_release(v48);
  v50 = *(unsigned __int8 *)(v40 + 112);
  v51 = v79;
  sub_1C63C(v39, (uint64_t)v79);
  if (v50 == 1)
  {
    v52 = *v51;
    v53 = swift_getKeyPath(&unk_33C20);
    v81[0] = v52;
    ObservationRegistrar.access<A, B>(_:keyPath:)(v81, v53, v42);
    swift_release(v53);
    v49 = *(_BYTE *)(v52 + 113);
  }
  sub_1D5D4((uint64_t)v51);
  v54 = swift_getKeyPath(&unk_33C48);
  v55 = swift_allocObject(&unk_3D9B8, 17, 7);
  *(_BYTE *)(v55 + 16) = v49;
  v56 = v78;
  sub_1A1D4(v32, v78, &qword_413F0);
  v57 = (uint64_t *)(v56 + *(int *)(v75 + 36));
  *v57 = v54;
  v57[1] = (uint64_t)sub_1D68C;
  v57[2] = v55;
  sub_1A198(v32, &qword_413F0);
  v58 = swift_getKeyPath(&unk_33DC0);
  v59 = v77;
  sub_1A1D4(v56, v77, &qword_413E0);
  v60 = v59 + *(int *)(v76 + 36);
  *(_QWORD *)v60 = v58;
  *(_BYTE *)(v60 + 8) = 2;
  sub_1A198(v56, &qword_413E0);
  return sub_1D628(v59, v80);
}

uint64_t sub_1BCA8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t KeyPath;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v15;
  uint64_t v16;

  v4 = type metadata accessor for CancelButton(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  CancelButton.init(customAction:)(0, 0);
  v8 = *a1;
  KeyPath = swift_getKeyPath(&unk_33C20);
  v16 = v8;
  v10 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v16, KeyPath, v10);
  swift_release(KeyPath);
  LOBYTE(v8) = *(_BYTE *)(v8 + 113);
  v11 = swift_getKeyPath(&unk_33C48);
  v12 = swift_allocObject(&unk_3D990, 17, 7);
  *(_BYTE *)(v12 + 16) = v8;
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 16))(a2, v7, v4);
  v13 = (uint64_t *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_41440) + 36));
  *v13 = v11;
  v13[1] = (uint64_t)sub_1D68C;
  v13[2] = v12;
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_1BE00(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v4 = type metadata accessor for DismissAction(0);
  v5 = *(_QWORD *)(v4 - 8);
  result = __chkstk_darwin(v4);
  v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*a1 != *a2)
  {
    type metadata accessor for ContactPickerView(0);
    sub_23168((uint64_t)v8);
    DismissAction.callAsFunction()();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  return result;
}

uint64_t sub_1BEB0@<X0>(uint64_t *a1@<X2>, _BYTE *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t KeyPath;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  _QWORD v14[3];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_40C78);
  __chkstk_darwin(v4);
  v6 = (char *)&v14[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *a1;
  KeyPath = swift_getKeyPath(&unk_33CA0);
  v14[0] = v7;
  v9 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
  ObservationRegistrar.access<A, B>(_:keyPath:)(v14, KeyPath, v9);
  swift_release(KeyPath);
  v10 = v7 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__alert;
  swift_beginAccess(v7 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__alert, v14, 0, 0);
  sub_1A1D4(v10, (uint64_t)v6, &qword_40C78);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_40C38);
  LOBYTE(v10) = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48))(v6, 1, v11) != 1;
  result = sub_1A198((uint64_t)v6, &qword_40C78);
  *a2 = v10;
  return result;
}

uint64_t sub_1BFE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t KeyPath;
  uint64_t v11;
  _BYTE v13[16];
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_40C78);
  __chkstk_darwin(v5);
  v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = *a4;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_40C38);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  KeyPath = swift_getKeyPath(&unk_33CA0);
  v14 = v8;
  v15 = v7;
  v16 = v8;
  v11 = sub_19D7C((unint64_t *)&qword_40F38, type metadata accessor for ContactPickerViewModel, (uint64_t)&protocol conformance descriptor for ContactPickerViewModel);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v16, KeyPath, sub_19F10, v13, (char *)&type metadata for () + 8, v11);
  swift_release(KeyPath);
  return sub_1A198((uint64_t)v7, &qword_40C78);
}

uint64_t sub_1C104()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_40C38);
  v7 = AlertInfo.actions.getter(v0);
  KeyPath = swift_getKeyPath(&unk_33D38);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_41378);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_412D0);
  v4 = sub_1A114(&qword_41380, &qword_41378, (uint64_t)&protocol conformance descriptor for [A]);
  v5 = sub_1A114(&qword_412C8, &qword_412D0, (uint64_t)&protocol conformance descriptor for Button<A>);
  return ((uint64_t (*)(uint64_t *, uint64_t, uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>), _QWORD, uint64_t, uint64_t, uint64_t, void *, uint64_t))ForEach<>.init(_:id:content:))(&v7, KeyPath, sub_1C1F0, 0, v2, v3, v4, &protocol witness table for String, v5);
}

uint64_t sub_1C1F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  _QWORD v29[2];

  v28 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_41388);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  __chkstk_darwin(v3);
  v27 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_41390);
  __chkstk_darwin(v6);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_41398);
  __chkstk_darwin(v9);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_412D0);
  v25 = *(_QWORD *)(v12 - 8);
  v26 = v12;
  __chkstk_darwin(v12);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29[0] = AlertInfo.ActionInfo.title.getter(v3);
  v29[1] = v15;
  AlertInfo.ActionInfo.style.getter(v3);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_413A0);
  v17 = *(_QWORD *)(v16 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v8, 1, v16) == 1)
  {
    sub_1A198((uint64_t)v8, &qword_41390);
    v18 = type metadata accessor for ButtonRole(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v11, 1, 1, v18);
  }
  else
  {
    AlertInfo.ActionInfo.Style.role.getter(v16);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v8, v16);
  }
  v19 = v27;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v27, a1, v3);
  v20 = *(unsigned __int8 *)(v4 + 80);
  v21 = (v20 + 16) & ~v20;
  v22 = swift_allocObject(&unk_3D968, v21 + v5, v20 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v22 + v21, v19, v3);
  v23 = sub_19F28();
  Button<>.init<A>(_:role:action:)(v29, v11, sub_1D21C, v22, &type metadata for String, v23);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v25 + 32))(v28, v14, v26);
}

uint64_t sub_1C458()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD v4[2];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_41388);
  v1 = AlertInfo.ActionInfo.value.getter(v4, v0);
  v2 = v4[1];
  ((void (*)(_QWORD *))v4[0])(v1);
  return swift_release(v2);
}

uint64_t sub_1C4A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t result;
  uint64_t v6;
  char v7;
  uint64_t v8;
  _QWORD v9[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_40C38);
  v9[0] = AlertInfo.message.getter(v2);
  v9[1] = v3;
  v4 = sub_19F28();
  result = Text.init<A>(_:)(v9, &type metadata for String, v4);
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 16) = v7 & 1;
  *(_QWORD *)(a1 + 24) = v8;
  return result;
}

uint64_t sub_1C50C()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_1C528()
{
  return EnvironmentValues.dismiss.getter();
}

uint64_t sub_1C548()
{
  return EnvironmentValues.dismiss.getter();
}

uint64_t sub_1C570@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.isEnabled.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1C59C(unsigned __int8 *a1)
{
  return EnvironmentValues.isEnabled.setter(*a1);
}

uint64_t sub_1C5C0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

_BYTE *sub_1C5D0(_BYTE *result)
{
  uint64_t v1;

  *result &= ~*(_BYTE *)(v1 + 16) & 1;
  return result;
}

unint64_t sub_1C5E8()
{
  unint64_t result;

  result = qword_41570;
  if (!qword_41570)
  {
    result = swift_getWitnessTable(&unk_33F64, &type metadata for ContactPickerViewControllerRepresentable);
    atomic_store(result, (unint64_t *)&qword_41570);
  }
  return result;
}

uint64_t sub_1C62C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1B274(*(char **)(v1 + 16), a1);
}

uint64_t sub_1C63C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ContactPickerView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C680()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v1 = type metadata accessor for ContactPickerView(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  swift_release(*(_QWORD *)(v0 + v4));
  v6 = (_QWORD *)(v0 + v4 + *(int *)(v1 + 20));
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_41258);
  if (swift_getEnumCaseMultiPayload(v6, v7) == 1)
  {
    v8 = type metadata accessor for DismissAction(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
  }
  else
  {
    swift_release(*v6);
  }
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_1C730(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ContactPickerView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C774(unsigned __int8 *a1, unsigned __int8 *a2)
{
  type metadata accessor for ContactPickerView(0);
  return sub_1BE00(a1, a2);
}

uint64_t sub_1C7CC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ContactPickerView(0) - 8) + 80);
  return sub_1BEB0((uint64_t *)(v1 + ((v3 + 32) & ~v3)), a1);
}

uint64_t objectdestroy_20Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v1 = type metadata accessor for ContactPickerView(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 32) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + v4));
  v6 = (_QWORD *)(v0 + v4 + *(int *)(v1 + 20));
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_41258);
  if (swift_getEnumCaseMultiPayload(v6, v7) == 1)
  {
    v8 = type metadata accessor for DismissAction(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
  }
  else
  {
    swift_release(*v6);
  }
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_1C8C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for ContactPickerView(0) - 8) + 80);
  return sub_1BFE8(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t *)(v1 + ((v3 + 32) & ~v3)));
}

unint64_t sub_1C908()
{
  unint64_t result;
  uint64_t v1;

  result = qword_412C0;
  if (!qword_412C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_412B8);
    sub_1A114(&qword_412C8, &qword_412D0, (uint64_t)&protocol conformance descriptor for Button<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ForEach<A, B, C>, v1);
    atomic_store(result, (unint64_t *)&qword_412C0);
  }
  return result;
}

uint64_t sub_1C984(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

uint64_t sub_1C994(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &opaque type descriptor for <<opaque return type of ContactPickerView.body>>, 1);
}

uint64_t *initializeBufferWithCopyOfBuffer for ContactPickerView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain(v5);
  }
  else
  {
    v6 = *(int *)(a3 + 20);
    v7 = (uint64_t *)((char *)a1 + v6);
    v8 = (uint64_t *)((char *)a2 + v6);
    swift_retain(v5);
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_41258);
    if (swift_getEnumCaseMultiPayload(v8, v9) == 1)
    {
      v10 = type metadata accessor for DismissAction(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v7, v8, v10);
      v11 = v7;
      v12 = v9;
      v13 = 1;
    }
    else
    {
      v14 = *v8;
      *v7 = *v8;
      swift_retain(v14);
      v11 = v7;
      v12 = v9;
      v13 = 0;
    }
    swift_storeEnumTagMultiPayload(v11, v12, v13);
  }
  return a1;
}

uint64_t destroy for ContactPickerView(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  swift_release(*a1);
  v4 = (_QWORD *)((char *)a1 + *(int *)(a2 + 20));
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_41258);
  if (swift_getEnumCaseMultiPayload(v4, v5) != 1)
    return swift_release(*v4);
  v6 = type metadata accessor for DismissAction(0);
  return (*(uint64_t (**)(_QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v4, v6);
}

uint64_t *initializeWithCopy for ContactPickerView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *a2;
  *a1 = *a2;
  v5 = *(int *)(a3 + 20);
  v6 = (uint64_t *)((char *)a1 + v5);
  v7 = (uint64_t *)((char *)a2 + v5);
  swift_retain(v4);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_41258);
  if (swift_getEnumCaseMultiPayload(v7, v8) == 1)
  {
    v9 = type metadata accessor for DismissAction(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v6, v7, v9);
    v10 = 1;
  }
  else
  {
    v11 = *v7;
    *v6 = *v7;
    swift_retain(v11);
    v10 = 0;
  }
  swift_storeEnumTagMultiPayload(v6, v8, v10);
  return a1;
}

uint64_t *assignWithCopy for ContactPickerView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = *a2;
  v7 = *a1;
  *a1 = *a2;
  swift_retain(v6);
  swift_release(v7);
  if (a1 != a2)
  {
    v8 = *(int *)(a3 + 20);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    sub_1A198((uint64_t)a1 + v8, &qword_41258);
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_41258);
    if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
    {
      v12 = type metadata accessor for DismissAction(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v9, v10, v12);
      v13 = 1;
    }
    else
    {
      v14 = *v10;
      *v9 = *v10;
      swift_retain(v14);
      v13 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v11, v13);
  }
  return a1;
}

_QWORD *initializeWithTake for ContactPickerView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_41258);
  if (swift_getEnumCaseMultiPayload(v6, v7) == 1)
  {
    v8 = type metadata accessor for DismissAction(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v5, v6, v8);
    swift_storeEnumTagMultiPayload(v5, v7, 1);
  }
  else
  {
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  return a1;
}

uint64_t *assignWithTake for ContactPickerView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *a1;
  *a1 = *a2;
  swift_release(v6);
  if (a1 != a2)
  {
    v7 = *(int *)(a3 + 20);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    sub_1A198((uint64_t)a1 + v7, &qword_41258);
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_41258);
    if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
    {
      v11 = type metadata accessor for DismissAction(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload(v8, v10, 1);
    }
    else
    {
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for ContactPickerView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1CDF0);
}

uint64_t sub_1CDF0(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_412D8);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for ContactPickerView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1CE7C);
}

char *sub_1CE7C(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_412D8);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

void sub_1CEF4(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[2];

  v4[0] = (char *)&value witness table for Builtin.NativeObject + 64;
  sub_1CF6C(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(v2 - 8) + 64;
    swift_initStructMetadata(a1, 256, 2, v4, a1 + 16);
  }
}

void sub_1CF6C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_41348)
  {
    v2 = type metadata accessor for DismissAction(255);
    v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_41348);
  }
}

uint64_t sub_1CFC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t OpaqueTypeConformance2;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;

  v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41278);
  v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_412B8);
  v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_40C38);
  v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41270);
  v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41268);
  v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_412A8);
  v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41260);
  v14 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41288);
  v15 = &type metadata for String;
  v16 = (void *)sub_1D30C(&qword_41290, &qword_41288, (void (*)(void))sub_1C5E8);
  v17 = (void *)sub_19F28();
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v14, &opaque type descriptor for <<opaque return type of View.navigationTitle<A>(_:)>>, 1);
  v14 = v6;
  v15 = (void *)OpaqueTypeConformance2;
  v8 = swift_getOpaqueTypeConformance2(&v14, &opaque type descriptor for <<opaque return type of View.navigationBarTitleDisplayMode(_:)>>, 1);
  v9 = sub_1A114(&qword_412B0, &qword_412A8, (uint64_t)&protocol conformance descriptor for TupleToolbarContent<A>);
  v14 = v4;
  v15 = (void *)v5;
  v16 = (void *)v8;
  v17 = (void *)v9;
  v10 = swift_getOpaqueTypeConformance2(&v14, &opaque type descriptor for <<opaque return type of View.toolbar<A>(content:)>>, 1);
  v14 = v3;
  v15 = &type metadata for Bool;
  v16 = (void *)v10;
  v17 = &protocol witness table for Bool;
  v11 = swift_getOpaqueTypeConformance2(&v14, &opaque type descriptor for <<opaque return type of View.onChange<A>(of:initial:_:)>>, 1);
  v12 = sub_1C908();
  v14 = v0;
  v15 = (void *)v1;
  v16 = &type metadata for Text;
  v17 = (void *)v2;
  v18 = v11;
  v19 = v12;
  v20 = &protocol witness table for Text;
  return swift_getOpaqueTypeConformance2(&v14, &opaque type descriptor for <<opaque return type of View.alert<A, B, C>(_:isPresented:presenting:actions:message:)>>, 1);
}

uint64_t sub_1D184@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_41388);
  result = AlertInfo.ActionInfo.title.getter(v2);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1D1B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_41388);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1D21C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_41388);
  return sub_1C458();
}

uint64_t sub_1D24C()
{
  uint64_t v0;

  return sub_3780(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

uint64_t sub_1D268@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1B6A8(*(uint64_t **)(v1 + 16), a1);
}

unint64_t sub_1D270()
{
  unint64_t result;
  uint64_t v1;

  result = qword_413D0;
  if (!qword_413D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_413C8);
    sub_1D30C(&qword_413D8, &qword_413E0, (void (*)(void))sub_1D390);
    sub_1A114(&qword_41420, &qword_41428, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_413D0);
  }
  return result;
}

uint64_t sub_1D30C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    sub_1A114(&qword_41298, &qword_412A0, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyTransformModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1D390()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t OpaqueTypeConformance2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = qword_413E8;
  if (!qword_413E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_413F0);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_413F8);
    v4 = type metadata accessor for GenericControl(255);
    v5 = type metadata accessor for TitleOnlyLabelStyle(255);
    v6 = sub_19D7C(&qword_41400, (uint64_t (*)(uint64_t))&type metadata accessor for GenericControl, (uint64_t)&protocol conformance descriptor for GenericControl);
    v7 = sub_19D7C(&qword_41408, (uint64_t (*)(uint64_t))&type metadata accessor for TitleOnlyLabelStyle, (uint64_t)&protocol conformance descriptor for TitleOnlyLabelStyle);
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v4, &opaque type descriptor for <<opaque return type of View.labelStyle<A>(_:)>>, 1);
    v4 = v2;
    v5 = OpaqueTypeConformance2;
    swift_getOpaqueTypeConformance2(&v4, &opaque type descriptor for <<opaque return type of View.keyboardShortcut(_:)>>, 1);
    sub_1A114(&qword_41410, &qword_41418, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_413E8);
  }
  return result;
}

uint64_t sub_1D4C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1BCA8(*(uint64_t **)(v1 + 16), a1);
}

unint64_t sub_1D4C8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_41448;
  if (!qword_41448)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41440);
    sub_19D7C(&qword_41450, (uint64_t (*)(uint64_t))&type metadata accessor for CancelButton, (uint64_t)&protocol conformance descriptor for CancelButton);
    sub_1A114(&qword_41298, &qword_412A0, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyTransformModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_41448);
  }
  return result;
}

uint64_t sub_1D564()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

void *sub_1D574(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_4864(a1, a2, v2);
}

uint64_t sub_1D57C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.externalIsLoading.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1D5A8(unsigned __int8 *a1)
{
  return EnvironmentValues.externalIsLoading.setter(*a1);
}

uint64_t sub_1D5D4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ContactPickerView(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1D610()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_1D628(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_413C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1D670()
{
  uint64_t v0;

  return sub_36F4(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

uint64_t LostModeFlowView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  char v5;
  uint64_t v6;

  v2 = LocalizedStringKey.init(stringLiteral:)(0x646F4D2074736F4CLL, 0xEE00776F6C462065);
  result = Text.init(_:tableName:bundle:comment:)(v2);
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5 & 1;
  *(_QWORD *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_1D70C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &opaque type descriptor for <<opaque return type of LostModeFlowView.body>>, 1);
}

uint64_t sub_1D71C@<X0>(uint64_t a1@<X8>)
{
  return LostModeFlowView.body.getter(a1);
}

ValueMetadata *type metadata accessor for LostModeFlowView()
{
  return &type metadata for LostModeFlowView;
}

void *sub_1D740()
{
  return &protocol witness table for Text;
}

uint64_t Path.id.getter(uint64_t a1, uint64_t a2)
{
  return dispatch thunk of Hashable.hashValue.getter(a1, *(_QWORD *)(a2 + 8));
}

uint64_t sub_1D754@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(_QWORD *);
  uint64_t v11;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_33FB8);
  v11 = v3;
  v5 = sub_1EB0C();
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v11, KeyPath, v5);
  swift_release(KeyPath);
  v6 = *(_QWORD *)(v3 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__addSearchControllerRecipient);
  v7 = *(_QWORD *)(v3 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__addSearchControllerRecipient + 8);
  if (v6)
  {
    v8 = swift_allocObject(&unk_3DC10, 32, 7);
    *(_QWORD *)(v8 + 16) = v6;
    *(_QWORD *)(v8 + 24) = v7;
    v9 = sub_1ED10;
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }
  *a2 = v9;
  a2[1] = v8;
  return sub_1A228(v6, v7);
}

uint64_t sub_1D810(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t KeyPath;
  unint64_t v9;
  _QWORD v11[7];
  uint64_t v12;

  v4 = *a1;
  v3 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject(&unk_3DBE8, 32, 7);
    *(_QWORD *)(v5 + 16) = v4;
    *(_QWORD *)(v5 + 24) = v3;
    v6 = sub_1ECE0;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = *a2;
  KeyPath = swift_getKeyPath(&unk_33FB8);
  __chkstk_darwin(KeyPath);
  v11[2] = v7;
  v11[3] = v6;
  v11[4] = v5;
  v12 = v7;
  sub_1A228(v4, v3);
  v9 = sub_1EB0C();
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v12, KeyPath, sub_1F0A4, v11, (char *)&type metadata for () + 8, v9);
  sub_1A224((uint64_t)v6, v5);
  return swift_release(KeyPath);
}

uint64_t sub_1D91C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(_QWORD *, _QWORD *);
  uint64_t v11;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_33FE0);
  v11 = v3;
  v5 = sub_1EB0C();
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v11, KeyPath, v5);
  swift_release(KeyPath);
  v6 = *(_QWORD *)(v3
                 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__setSearchControllerPresentationOptionsForRecipient);
  v7 = *(_QWORD *)(v3
                 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__setSearchControllerPresentationOptionsForRecipient
                 + 8);
  if (v6)
  {
    v8 = swift_allocObject(&unk_3DBC0, 32, 7);
    *(_QWORD *)(v8 + 16) = v6;
    *(_QWORD *)(v8 + 24) = v7;
    v9 = sub_1ECB8;
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }
  *a2 = v9;
  a2[1] = v8;
  return sub_1A228(v6, v7);
}

uint64_t sub_1D9D8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t KeyPath;
  unint64_t v9;
  _QWORD v11[7];
  uint64_t v12;

  v4 = *a1;
  v3 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject(&unk_3DB98, 32, 7);
    *(_QWORD *)(v5 + 16) = v4;
    *(_QWORD *)(v5 + 24) = v3;
    v6 = sub_1EC2C;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = *a2;
  KeyPath = swift_getKeyPath(&unk_33FE0);
  __chkstk_darwin(KeyPath);
  v11[2] = v7;
  v11[3] = v6;
  v11[4] = v5;
  v12 = v7;
  sub_1A228(v4, v3);
  v9 = sub_1EB0C();
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v12, KeyPath, sub_1F090, v11, (char *)&type metadata for () + 8, v9);
  sub_1A224((uint64_t)v6, v5);
  return swift_release(KeyPath);
}

uint64_t sub_1DAE4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(_QWORD *);
  uint64_t v11;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_34008);
  v11 = v3;
  v5 = sub_1EB0C();
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v11, KeyPath, v5);
  swift_release(KeyPath);
  v6 = *(_QWORD *)(v3 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__setSearchControllerComposeFieldInfoText);
  v7 = *(_QWORD *)(v3
                 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__setSearchControllerComposeFieldInfoText
                 + 8);
  if (v6)
  {
    v8 = swift_allocObject(&unk_3DB70, 32, 7);
    *(_QWORD *)(v8 + 16) = v6;
    *(_QWORD *)(v8 + 24) = v7;
    v9 = sub_1EC90;
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }
  *a2 = v9;
  a2[1] = v8;
  return sub_1A228(v6, v7);
}

uint64_t sub_1DBA0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t KeyPath;
  unint64_t v9;
  _QWORD v11[7];
  uint64_t v12;

  v4 = *a1;
  v3 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject(&unk_3DB48, 32, 7);
    *(_QWORD *)(v5 + 16) = v4;
    *(_QWORD *)(v5 + 24) = v3;
    v6 = sub_1EC60;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = *a2;
  KeyPath = swift_getKeyPath(&unk_34008);
  __chkstk_darwin(KeyPath);
  v11[2] = v7;
  v11[3] = v6;
  v11[4] = v5;
  v12 = v7;
  sub_1A228(v4, v3);
  v9 = sub_1EB0C();
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v12, KeyPath, sub_1F07C, v11, (char *)&type metadata for () + 8, v9);
  sub_1A224((uint64_t)v6, v5);
  return swift_release(KeyPath);
}

uint64_t sub_1DCAC@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(_QWORD *, _QWORD *);
  uint64_t v11;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_34030);
  v11 = v3;
  v5 = sub_1EB0C();
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v11, KeyPath, v5);
  swift_release(KeyPath);
  v6 = *(_QWORD *)(v3
                 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__setSearchControllerTintColorForAutocompleteRecipient);
  v7 = *(_QWORD *)(v3
                 + OBJC_IVAR____TtC13FindMyAppCore22ContactPickerViewModel__setSearchControllerTintColorForAutocompleteRecipient
                 + 8);
  if (v6)
  {
    v8 = swift_allocObject(&unk_3DB20, 32, 7);
    *(_QWORD *)(v8 + 16) = v6;
    *(_QWORD *)(v8 + 24) = v7;
    v9 = sub_1F0B8;
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }
  *a2 = v9;
  a2[1] = v8;
  return sub_1A228(v6, v7);
}

uint64_t sub_1DD68(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t KeyPath;
  unint64_t v9;
  _QWORD v11[7];
  uint64_t v12;

  v4 = *a1;
  v3 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject(&unk_3DAF8, 32, 7);
    *(_QWORD *)(v5 + 16) = v4;
    *(_QWORD *)(v5 + 24) = v3;
    v6 = sub_1EC2C;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = *a2;
  KeyPath = swift_getKeyPath(&unk_34030);
  __chkstk_darwin(KeyPath);
  v11[2] = v7;
  v11[3] = v6;
  v11[4] = v5;
  v12 = v7;
  sub_1A228(v4, v3);
  v9 = sub_1EB0C();
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v12, KeyPath, sub_1F068, v11, (char *)&type metadata for () + 8, v9);
  sub_1A224((uint64_t)v6, v5);
  return swift_release(KeyPath);
}

id sub_1DE74(uint64_t a1)
{
  objc_class *v2;
  char *v3;
  char *v4;
  char *v5;
  id v6;
  objc_super v8;

  v2 = (objc_class *)type metadata accessor for ContactPickerViewControllerRepresentable.Coordinator(0);
  v3 = (char *)objc_allocWithZone(v2);
  v4 = &v3[OBJC_IVAR____TtCV13FindMyAppCore40ContactPickerViewControllerRepresentable11Coordinator_viewModel];
  swift_weakInit(&v3[OBJC_IVAR____TtCV13FindMyAppCore40ContactPickerViewControllerRepresentable11Coordinator_viewModel], 0);
  swift_unknownObjectWeakInit(&v3[OBJC_IVAR____TtCV13FindMyAppCore40ContactPickerViewControllerRepresentable11Coordinator_searchController], 0);
  swift_retain(a1);
  v5 = v3;
  Logger.init(subsystem:category:)(0xD00000000000001ELL, 0x80000000000386E0, 0x656C706F6550, 0xE600000000000000);
  swift_weakAssign(v4, a1);

  v8.receiver = v5;
  v8.super_class = v2;
  v6 = objc_msgSendSuper2(&v8, "init");
  swift_release(a1);
  return v6;
}

uint64_t sub_1DF68()
{
  uint64_t v0;
  uint64_t Strong;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t KeyPath;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;

  Strong = swift_weakLoadStrong(v0 + OBJC_IVAR____TtCV13FindMyAppCore40ContactPickerViewControllerRepresentable11Coordinator_viewModel);
  if (Strong)
  {
    v2 = Strong;
    v3 = swift_allocObject(&unk_3DAD0, 24, 7);
    v4 = v0 + OBJC_IVAR____TtCV13FindMyAppCore40ContactPickerViewControllerRepresentable11Coordinator_searchController;
    v5 = (void *)swift_unknownObjectWeakLoadStrong(v0+ OBJC_IVAR____TtCV13FindMyAppCore40ContactPickerViewControllerRepresentable11Coordinator_searchController);
    swift_unknownObjectWeakInit(v3 + 16, v5);

    KeyPath = swift_getKeyPath(&unk_33FB8);
    __chkstk_darwin(KeyPath);
    v19 = v2;
    v20 = sub_1EAE0;
    v21 = v3;
    v22 = v2;
    v7 = sub_1EB0C();
    swift_retain(v3);
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v22, KeyPath, sub_1EAF0, v18, (char *)&type metadata for () + 8, v7);
    swift_release(KeyPath);
    swift_release_n(v3, 2);
    v8 = swift_allocObject(&unk_3DAD0, 24, 7);
    v9 = (void *)swift_unknownObjectWeakLoadStrong(v4);
    swift_unknownObjectWeakInit(v8 + 16, v9);

    v10 = swift_getKeyPath(&unk_33FE0);
    __chkstk_darwin(v10);
    v19 = v2;
    v20 = sub_1EB54;
    v21 = v8;
    v22 = v2;
    swift_retain(v8);
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v22, v10, sub_1EB7C, v18, (char *)&type metadata for () + 8, v7);
    swift_release(v10);
    swift_release_n(v8, 2);
    v11 = swift_allocObject(&unk_3DAD0, 24, 7);
    v12 = (void *)swift_unknownObjectWeakLoadStrong(v4);
    swift_unknownObjectWeakInit(v11 + 16, v12);

    v13 = swift_getKeyPath(&unk_34008);
    __chkstk_darwin(v13);
    v19 = v2;
    v20 = sub_1EB98;
    v21 = v11;
    v22 = v2;
    swift_retain(v11);
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v22, v13, sub_1EBA8, v18, (char *)&type metadata for () + 8, v7);
    swift_release(v13);
    swift_release_n(v11, 2);
    v14 = swift_allocObject(&unk_3DAD0, 24, 7);
    v15 = (void *)swift_unknownObjectWeakLoadStrong(v4);
    swift_unknownObjectWeakInit(v14 + 16, v15);

    v16 = swift_getKeyPath(&unk_34030);
    __chkstk_darwin(v16);
    v19 = v2;
    v20 = sub_1EBC4;
    v21 = v14;
    v22 = v2;
    swift_retain(v14);
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v22, v16, sub_1EBEC, v18, (char *)&type metadata for () + 8, v7);
    swift_release(v2);
    swift_release(v16);
    return swift_release_n(v14, 2);
  }
  else
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "FindMyAppCore/ContactPickerViewControllerRepresentable.swift", 60, 2, 47, 0);
    __break(1u);
  }
  return result;
}

void sub_1E324(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *Strong;
  void *v5;
  _BYTE v6[24];

  v3 = a2 + 16;
  swift_beginAccess(a2 + 16, v6, 0, 0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v5 = Strong;
    objc_msgSend(Strong, "addRecipient:", a1);

  }
}

void sub_1E384(uint64_t a1, NSString a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t Strong;
  void *v6;
  _BYTE v7[24];

  v4 = a3 + 16;
  swift_beginAccess(a3 + 16, v7, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v4);
  if (Strong)
  {
    v6 = (void *)Strong;
    if (a2)
      a2 = String._bridgeToObjectiveC()();
    objc_msgSend(v6, "setComposeFieldInfoText:", a2);

  }
}

void sub_1E40C(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  uint64_t v7;
  void *Strong;
  void *v9;
  _BYTE v10[24];

  v7 = a3 + 16;
  swift_beginAccess(a3 + 16, v10, 0, 0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v7);
  if (Strong)
  {
    v9 = Strong;
    objc_msgSend(Strong, *a4, a1, a2);

  }
}

id sub_1E4A8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1E53C()
{
  return type metadata accessor for ContactPickerViewControllerRepresentable.Coordinator(0);
}

uint64_t type metadata accessor for ContactPickerViewControllerRepresentable.Coordinator(uint64_t a1)
{
  uint64_t result;

  result = qword_414A0;
  if (!qword_414A0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ContactPickerViewControllerRepresentable.Coordinator);
  return result;
}

uint64_t sub_1E580(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  v4[0] = "\b";
  v4[1] = "\b";
  result = type metadata accessor for Logger(319);
  if (v3 <= 0x3F)
  {
    v4[2] = *(_QWORD *)(result - 8) + 64;
    result = swift_updateClassMetadata2(a1, 256, 3, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

void sub_1E5FC(void *a1)
{
  Class isa;

  isa = Array._bridgeToObjectiveC()().super.isa;
  objc_msgSend(a1, "setOtherRecipientAddresses:", isa);

}

id sub_1E658@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  id result;

  result = sub_1DE74(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_1E680(uint64_t a1, char a2)
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)(a1, a2 & 1);
}

uint64_t sub_1E6B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_1E9A4();
  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1E708(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_1E9A4();
  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_1E758(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1E9A4();
  UIViewControllerRepresentable.body.getter(a1, v2);
  __break(1u);
}

uint64_t sub_1E8F0(char *a1, uint64_t a2, void *a3, void *a4, void (*a5)(id))
{
  uint64_t result;
  uint64_t v10;
  id v11;
  id v12;
  char *v13;

  result = swift_weakLoadStrong(&a1[OBJC_IVAR____TtCV13FindMyAppCore40ContactPickerViewControllerRepresentable11Coordinator_viewModel]);
  if (result)
  {
    v10 = result;
    v11 = a3;
    v12 = a4;
    v13 = a1;
    a5(v12);

    return swift_release(v10);
  }
  return result;
}

ValueMetadata *type metadata accessor for ContactPickerViewControllerRepresentable()
{
  return &type metadata for ContactPickerViewControllerRepresentable;
}

void *sub_1E998()
{
  return &protocol witness table for Never;
}

unint64_t sub_1E9A4()
{
  unint64_t result;

  result = qword_41578;
  if (!qword_41578)
  {
    result = swift_getWitnessTable(&unk_33EEC, &type metadata for ContactPickerViewControllerRepresentable);
    atomic_store(result, (unint64_t *)&qword_41578);
  }
  return result;
}

id sub_1E9E8()
{
  id v0;
  char *v1;
  char *v2;
  char *v3;
  char *v5;

  v0 = objc_msgSend(objc_allocWithZone((Class)CNAutocompleteSearchController), "initWithSearchType:", 1);
  objc_msgSend(v0, "setExpandRecipientsInNamedGroups:", 1);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_41580);
  UIViewControllerRepresentableContext.coordinator.getter(&v5);
  v1 = v5;
  objc_msgSend(v0, "setDelegate:", v5);

  UIViewControllerRepresentableContext.coordinator.getter(&v5);
  v2 = v5;
  swift_unknownObjectWeakAssign(&v5[OBJC_IVAR____TtCV13FindMyAppCore40ContactPickerViewControllerRepresentable11Coordinator_searchController], v0);

  UIViewControllerRepresentableContext.coordinator.getter(&v5);
  v3 = v5;
  sub_1DF68();

  return v0;
}

uint64_t sub_1EABC()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_1EAE0(uint64_t a1)
{
  uint64_t v1;

  sub_1E324(a1, v1);
}

uint64_t sub_1EAF0()
{
  uint64_t *v0;

  return sub_3D04(v0[2], v0[3], v0[4]);
}

unint64_t sub_1EB0C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_40F38;
  if (!qword_40F38)
  {
    v1 = type metadata accessor for ContactPickerViewModel(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for ContactPickerViewModel, v1);
    atomic_store(result, (unint64_t *)&qword_40F38);
  }
  return result;
}

void sub_1EB54(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1E40C(a1, a2, v2, (SEL *)&selRef_setPresentationOptions_forRecipient_);
}

uint64_t sub_1EB7C()
{
  uint64_t *v0;

  return sub_3D4C(v0[2], v0[3], v0[4]);
}

void sub_1EB98(uint64_t a1, void *a2)
{
  uint64_t v2;

  sub_1E384(a1, a2, v2);
}

uint64_t sub_1EBA8()
{
  uint64_t *v0;

  return sub_3D94(v0[2], v0[3], v0[4]);
}

void sub_1EBC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1E40C(a1, a2, v2, (SEL *)&selRef_setTintColor_forRecipient_);
}

uint64_t sub_1EBEC()
{
  uint64_t *v0;

  return sub_3DDC(v0[2], v0[3], v0[4]);
}

uint64_t sub_1EC08()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1EC2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t *, uint64_t *);
  uint64_t v5;
  uint64_t v6;

  v3 = *(uint64_t (**)(uint64_t *, uint64_t *))(v2 + 16);
  v5 = a2;
  v6 = a1;
  return v3(&v6, &v5);
}

uint64_t sub_1EC60(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(_QWORD *);
  _QWORD v5[2];

  v3 = *(uint64_t (**)(_QWORD *))(v2 + 16);
  v5[0] = a1;
  v5[1] = a2;
  return v3(v5);
}

uint64_t sub_1EC90(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v1 + 16))(*a1, a1[1]);
}

uint64_t sub_1ECB8(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v2 + 16))(*a1, *a2);
}

uint64_t sub_1ECE0(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  uint64_t v4;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v4 = a1;
  return v2(&v4);
}

uint64_t sub_1ED10(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

void sub_1ED34(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  Class isa;
  uint64_t v18;
  uint64_t v19;

  v2 = v1;
  v4 = Logger.logObject.getter(a1);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v19 = v7;
    *(_DWORD *)v6 = 136315138;
    v18 = sub_FD1C(0xD00000000000002ELL, 0x80000000000387C0, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v18, &v19, v6 + 4, v6 + 12);
    _os_log_impl(&dword_0, v4, v5, "ContactPickerViewModel: %s", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);
  }

  v8 = objc_msgSend(objc_allocWithZone((Class)CNContactPickerViewController), "init");
  objc_msgSend(v8, "setDelegate:", v2);
  sub_1F010();
  v9 = (void *)NSPredicate.init(format:_:)(0xD000000000000038, 0x8000000000038740, _swiftEmptyArrayStorage);
  objc_msgSend(v8, "setPredicateForEnablingContact:", v9);

  v10 = (void *)NSPredicate.init(format:_:)(0xD000000000000038, 0x8000000000038740, _swiftEmptyArrayStorage);
  objc_msgSend(v8, "setPredicateForSelectionOfContact:", v10);

  v11 = (void *)NSPredicate.init(format:_:)(0xD00000000000003ELL, 0x8000000000038780, _swiftEmptyArrayStorage);
  objc_msgSend(v8, "setPredicateForSelectionOfProperty:", v11);

  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_40FC0);
  v13 = swift_allocObject(v12, 64, 7);
  *(_OWORD *)(v13 + 16) = xmmword_33780;
  *(_QWORD *)(v13 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(CNContactEmailAddressesKey, v14);
  *(_QWORD *)(v13 + 40) = v15;
  *(_QWORD *)(v13 + 48) = static String._unconditionallyBridgeFromObjectiveC(_:)(CNContactPhoneNumbersKey, v15);
  *(_QWORD *)(v13 + 56) = v16;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v13);
  objc_msgSend(v8, "setDisplayedPropertyKeys:", isa);

  objc_msgSend(a1, "presentViewController:animated:completion:", v8, 1, 0);
}

unint64_t sub_1F010()
{
  unint64_t result;
  uint64_t v1;

  result = qword_41590;
  if (!qword_41590)
  {
    v1 = objc_opt_self(NSPredicate);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_41590);
  }
  return result;
}

uint64_t sub_1F068()
{
  return sub_1EBEC();
}

uint64_t sub_1F07C()
{
  return sub_1EBA8();
}

uint64_t sub_1F090()
{
  return sub_1EB7C();
}

uint64_t sub_1F0A4()
{
  return sub_1EAF0();
}

uint64_t sub_1F0BC(double a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v8;
  double v9;

  v2 = type metadata accessor for Font.TextStyle(0);
  __chkstk_darwin(v2);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1;
  (*(void (**)(char *, _QWORD))(v5 + 104))(v4, enum case for Font.TextStyle.headline(_:));
  v6 = sub_23F08();
  return ScaledMetric.init(wrappedValue:relativeTo:)(&v9, v4, &type metadata for CGFloat, v6);
}

uint64_t ListRowTemplate.init(imageViewBuilder:titleViewBuilder:subtitleViewBuilder:detailViewBuilder:controlsBuilder:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, __int128 a12, __int128 a13, __int128 a14, uint64_t a15, uint64_t a16)
{
  int *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t result;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  _OWORD v34[3];
  uint64_t v35;
  uint64_t v36;

  sub_1F0BC(38.0);
  v34[0] = a12;
  v34[1] = a13;
  v34[2] = a14;
  v35 = a15;
  v36 = a16;
  v23 = (int *)type metadata accessor for ListRowTemplate(0, (uint64_t)v34);
  v24 = (_QWORD *)(a9 + v23[21]);
  *v24 = swift_getKeyPath(&unk_34058);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_41600);
  result = swift_storeEnumTagMultiPayload(v24, v25, 0);
  v27 = (_QWORD *)(a9 + v23[22]);
  *v27 = a1;
  v27[1] = a2;
  v28 = (_QWORD *)(a9 + v23[23]);
  *v28 = a3;
  v28[1] = a4;
  v29 = (_QWORD *)(a9 + v23[24]);
  *v29 = a5;
  v29[1] = a6;
  v30 = (_QWORD *)(a9 + v23[25]);
  *v30 = a7;
  v30[1] = a8;
  v31 = (_QWORD *)(a9 + v23[26]);
  *v31 = a10;
  v31[1] = a11;
  return result;
}

uint64_t type metadata accessor for ListRowTemplate(uint64_t a1, uint64_t a2)
{
  return swift_getGenericMetadata(a1, a2, &nominal type descriptor for ListRowTemplate);
}

uint64_t ListRowTemplate.body.getter@<X0>(_QWORD *a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t TupleTypeMetadata2;
  uint64_t v12;
  uint64_t TupleTypeMetadata;
  uint64_t v14;
  uint64_t WitnessTable;
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
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(char *, char *, uint64_t);
  void (*v57)(char *, uint64_t);
  uint64_t v59;
  char *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;

  v60 = a2;
  v65 = type metadata accessor for ModifiedContent(255, a1[2], &type metadata for _FrameLayout);
  v3 = a1[3];
  v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41608);
  v5 = type metadata accessor for ModifiedContent(255, v3, v4);
  v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41610);
  v66 = type metadata accessor for ModifiedContent(255, v5, v6);
  v7 = a1[4];
  v8 = type metadata accessor for ModifiedContent(255, v7, v4);
  v67 = type metadata accessor for ModifiedContent(255, v8, v6);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41618);
  v9 = a1[5];
  v10 = type metadata accessor for ModifiedContent(255, v9, v4);
  type metadata accessor for ModifiedContent(255, v10, v6);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2(255);
  v12 = type metadata accessor for TupleView(255, TupleTypeMetadata2);
  v68 = type metadata accessor for Optional(255, v12);
  v69 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41620);
  TupleTypeMetadata = swift_getTupleTypeMetadata(255, 5);
  v14 = type metadata accessor for TupleView(255, TupleTypeMetadata);
  WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v14);
  v16 = type metadata accessor for VStack(255, v14, WitnessTable);
  type metadata accessor for ModifiedContent(255, v65, &type metadata for _PaddingLayout);
  v17 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41608);
  v18 = type metadata accessor for ModifiedContent(255, v3, v17);
  v19 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41610);
  type metadata accessor for ModifiedContent(255, v18, v19);
  v20 = type metadata accessor for ModifiedContent(255, v7, v17);
  type metadata accessor for ModifiedContent(255, v20, v19);
  v21 = swift_getTupleTypeMetadata2(255);
  v22 = type metadata accessor for TupleView(255, v21);
  v23 = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v22);
  type metadata accessor for VStack(255, v22, v23);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41618);
  v24 = type metadata accessor for ModifiedContent(255, v9, v17);
  type metadata accessor for ModifiedContent(255, v24, v19);
  v25 = swift_getTupleTypeMetadata2(255);
  v26 = type metadata accessor for TupleView(255, v25);
  type metadata accessor for Optional(255, v26);
  v27 = swift_getTupleTypeMetadata2(255);
  v28 = type metadata accessor for TupleView(255, v27);
  v29 = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v28);
  v30 = type metadata accessor for HStack(255, v28, v29);
  v31 = swift_getWitnessTable(&protocol conformance descriptor for HStack<A>, v30);
  type metadata accessor for HStack(255, v30, v31);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41620);
  v32 = swift_getTupleTypeMetadata2(255);
  v33 = type metadata accessor for TupleView(255, v32);
  v34 = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v33);
  type metadata accessor for VStack(255, v33, v34);
  v35 = swift_getTupleTypeMetadata2(255);
  v36 = type metadata accessor for TupleView(255, v35);
  v37 = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v36);
  v38 = type metadata accessor for HStack(255, v36, v37);
  v39 = type metadata accessor for _ConditionalContent(0, v16, v38);
  v59 = *(_QWORD *)(v39 - 8);
  __chkstk_darwin(v39);
  v41 = (char *)&v59 - v40;
  v42 = type metadata accessor for ModifiedContent(0, v39, &type metadata for _FlexFrameLayout);
  v43 = *(_QWORD *)(v42 - 8);
  v44 = __chkstk_darwin(v42);
  v46 = (char *)&v59 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v44);
  v48 = (char *)&v59 - v47;
  v49 = sub_1F83C(a1, (uint64_t)v41);
  v50 = static Alignment.topLeading.getter(v49);
  v52 = v51;
  v53 = swift_getWitnessTable(&protocol conformance descriptor for VStack<A>, v16);
  v54 = swift_getWitnessTable(&protocol conformance descriptor for HStack<A>, v38);
  v63 = v53;
  v64 = v54;
  v55 = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v39);
  View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(0, 1, 0, 1, 0x7FF0000000000000, 0, 0, 1, 0, 1, 0x7FF0000000000000, 0, v50, v52, v39, v55);
  (*(void (**)(char *, uint64_t))(v59 + 8))(v41, v39);
  v61 = v55;
  v62 = &protocol witness table for _FlexFrameLayout;
  swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v42);
  v56 = *(void (**)(char *, char *, uint64_t))(v43 + 16);
  v56(v48, v46, v42);
  v57 = *(void (**)(char *, uint64_t))(v43 + 8);
  v57(v46, v42);
  v56(v60, v48, v42);
  return ((uint64_t (*)(char *, uint64_t))v57)(v48, v42);
}

uint64_t sub_1F83C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t TupleTypeMetadata2;
  uint64_t v12;
  uint64_t WitnessTable;
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
  uint64_t TupleTypeMetadata;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  void (*v54)(char *, char *, uint64_t);
  void (*v55)(char *, uint64_t);
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  void (*v61)(char *, char *, uint64_t);
  void (*v62)(char *, uint64_t);
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  char *v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;

  v76 = a2;
  v2 = a1;
  v3 = type metadata accessor for ModifiedContent(255, a1[2], &type metadata for _FrameLayout);
  type metadata accessor for ModifiedContent(255, v3, &type metadata for _PaddingLayout);
  v4 = v2[3];
  v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41608);
  v6 = type metadata accessor for ModifiedContent(255, v4, v5);
  v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41610);
  v8 = type metadata accessor for ModifiedContent(255, v6, v7);
  v9 = type metadata accessor for ModifiedContent(255, v2[4], v5);
  v10 = type metadata accessor for ModifiedContent(255, v9, v7);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2(255);
  v12 = type metadata accessor for TupleView(255, TupleTypeMetadata2);
  WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v12);
  type metadata accessor for VStack(255, v12, WitnessTable);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41618);
  v14 = type metadata accessor for ModifiedContent(255, v2[5], v5);
  type metadata accessor for ModifiedContent(255, v14, v7);
  v15 = swift_getTupleTypeMetadata2(255);
  v16 = type metadata accessor for TupleView(255, v15);
  v17 = type metadata accessor for Optional(255, v16);
  v18 = swift_getTupleTypeMetadata2(255);
  v19 = type metadata accessor for TupleView(255, v18);
  v20 = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v19);
  v21 = type metadata accessor for HStack(255, v19, v20);
  v22 = swift_getWitnessTable(&protocol conformance descriptor for HStack<A>, v21);
  type metadata accessor for HStack(255, v21, v22);
  v23 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41620);
  v24 = swift_getTupleTypeMetadata2(255);
  v25 = type metadata accessor for TupleView(255, v24);
  v26 = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v25);
  type metadata accessor for VStack(255, v25, v26);
  v27 = swift_getTupleTypeMetadata2(255);
  v28 = type metadata accessor for TupleView(255, v27);
  v29 = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v28);
  v30 = type metadata accessor for HStack(0, v28, v29);
  v71 = *(_QWORD *)(v30 - 8);
  v31 = __chkstk_darwin(v30);
  v33 = (char *)&v69 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v31);
  v72 = (char *)&v69 - v34;
  v79 = v3;
  v80 = v8;
  v81 = v10;
  v82 = v17;
  v83 = v23;
  TupleTypeMetadata = swift_getTupleTypeMetadata(255, 5);
  v36 = type metadata accessor for TupleView(255, TupleTypeMetadata);
  v37 = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v36);
  v38 = type metadata accessor for VStack(0, v36, v37);
  v69 = *(_QWORD *)(v38 - 8);
  v39 = __chkstk_darwin(v38);
  v41 = (char *)&v69 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v39);
  v70 = (char *)&v69 - v42;
  v43 = type metadata accessor for DynamicTypeSize(0);
  v44 = *(_QWORD *)(v43 - 8);
  __chkstk_darwin(v43);
  v46 = (char *)&v69 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = type metadata accessor for _ConditionalContent(0, v38, v30);
  v74 = *(_QWORD *)(v47 - 8);
  v75 = v47;
  __chkstk_darwin(v47);
  v73 = (char *)&v69 - v48;
  v49 = (uint64_t)v2;
  v50 = sub_2319C(&qword_41600, (uint64_t (*)(_QWORD))&type metadata accessor for DynamicTypeSize, 0x5463696D616E7944, 0xEF657A6953657079, (uint64_t)v46);
  LOBYTE(v2) = DynamicTypeSize.isAccessibilitySize.getter(v50);
  (*(void (**)(char *, uint64_t))(v44 + 8))(v46, v43);
  if ((v2 & 1) != 0)
  {
    sub_1FE6C(v49);
    v51 = swift_getWitnessTable(&protocol conformance descriptor for VStack<A>, v38);
    v53 = v69;
    v52 = v70;
    v54 = *(void (**)(char *, char *, uint64_t))(v69 + 16);
    v54(v70, v41, v38);
    v55 = *(void (**)(char *, uint64_t))(v53 + 8);
    v55(v41, v38);
    v54(v41, v52, v38);
    v56 = swift_getWitnessTable(&protocol conformance descriptor for HStack<A>, v30);
    v57 = v73;
    sub_20030((uint64_t)v41, v38, v30, v51, v56);
    v55(v41, v38);
    v55(v52, v38);
  }
  else
  {
    sub_200F4(v49);
    v58 = swift_getWitnessTable(&protocol conformance descriptor for HStack<A>, v30);
    v59 = v71;
    v60 = v72;
    v61 = *(void (**)(char *, char *, uint64_t))(v71 + 16);
    v61(v72, v33, v30);
    v62 = *(void (**)(char *, uint64_t))(v59 + 8);
    v62(v33, v30);
    v61(v33, v60, v30);
    v63 = swift_getWitnessTable(&protocol conformance descriptor for VStack<A>, v38);
    v57 = v73;
    sub_203C4((uint64_t)v33, v38, v30, v63, v58);
    v62(v33, v30);
    v62(v60, v30);
  }
  v64 = swift_getWitnessTable(&protocol conformance descriptor for VStack<A>, v38);
  v65 = swift_getWitnessTable(&protocol conformance descriptor for HStack<A>, v30);
  v77 = v64;
  v78 = v65;
  v66 = v75;
  swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v75);
  v67 = v74;
  (*(void (**)(uint64_t, char *, uint64_t))(v74 + 16))(v76, v57, v66);
  return (*(uint64_t (**)(char *, uint64_t))(v67 + 8))(v57, v66);
}

uint64_t sub_1FE6C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t TupleTypeMetadata2;
  uint64_t v11;
  uint64_t TupleTypeMetadata;
  uint64_t v13;
  uint64_t WitnessTable;
  _BYTE v16[16];
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = static HorizontalAlignment.leading.getter();
  v4 = *(_QWORD *)(a1 + 24);
  v17 = *(_QWORD *)(a1 + 16);
  v18 = v4;
  v19 = *(_QWORD *)(a1 + 32);
  v20 = *(_OWORD *)(a1 + 40);
  v21 = *(_OWORD *)(a1 + 56);
  v22 = *(_QWORD *)(a1 + 72);
  v23 = v1;
  v24 = type metadata accessor for ModifiedContent(255, v17, &type metadata for _FrameLayout);
  v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41608);
  v6 = type metadata accessor for ModifiedContent(255, v4, v5);
  v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41610);
  v25 = type metadata accessor for ModifiedContent(255, v6, v7);
  v8 = type metadata accessor for ModifiedContent(255, v19, v5);
  v26 = type metadata accessor for ModifiedContent(255, v8, v7);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41618);
  v9 = type metadata accessor for ModifiedContent(255, v20, v5);
  type metadata accessor for ModifiedContent(255, v9, v7);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2(255);
  v11 = type metadata accessor for TupleView(255, TupleTypeMetadata2);
  v27 = type metadata accessor for Optional(255, v11);
  v28 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41620);
  TupleTypeMetadata = swift_getTupleTypeMetadata(255, 5);
  v13 = type metadata accessor for TupleView(0, TupleTypeMetadata);
  WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v13);
  return VStack.init(alignment:spacing:content:)(v3, 0, 1, sub_243E4, v16, v13, WitnessTable);
}

uint64_t sub_20030(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v14;

  v10 = type metadata accessor for _ConditionalContent.Storage(0);
  __chkstk_darwin();
  v12 = (char *)&v14 - v11;
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))((char *)&v14 - v11, a1, a2);
  swift_storeEnumTagMultiPayload(v12, v10, 0);
  return _ConditionalContent<>.init(storage:)(v12, a2, a3, a4, a5);
}

uint64_t sub_200F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t TupleTypeMetadata2;
  uint64_t v11;
  uint64_t WitnessTable;
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
  _BYTE v28[16];
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;

  v3 = static VerticalAlignment.top.getter(a1);
  v4 = *(_QWORD *)(a1 + 24);
  v29 = *(_QWORD *)(a1 + 16);
  v30 = v4;
  v31 = *(_QWORD *)(a1 + 32);
  v32 = *(_OWORD *)(a1 + 40);
  v33 = *(_OWORD *)(a1 + 56);
  v34 = *(_QWORD *)(a1 + 72);
  v35 = v1;
  v5 = type metadata accessor for ModifiedContent(255, v29, &type metadata for _FrameLayout);
  type metadata accessor for ModifiedContent(255, v5, &type metadata for _PaddingLayout);
  v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41608);
  v7 = type metadata accessor for ModifiedContent(255, v4, v6);
  v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41610);
  type metadata accessor for ModifiedContent(255, v7, v8);
  v9 = type metadata accessor for ModifiedContent(255, v31, v6);
  type metadata accessor for ModifiedContent(255, v9, v8);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2(255);
  v11 = type metadata accessor for TupleView(255, TupleTypeMetadata2);
  WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v11);
  type metadata accessor for VStack(255, v11, WitnessTable);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41618);
  v13 = type metadata accessor for ModifiedContent(255, v32, v6);
  type metadata accessor for ModifiedContent(255, v13, v8);
  v14 = swift_getTupleTypeMetadata2(255);
  v15 = type metadata accessor for TupleView(255, v14);
  type metadata accessor for Optional(255, v15);
  v16 = swift_getTupleTypeMetadata2(255);
  v17 = type metadata accessor for TupleView(255, v16);
  v18 = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v17);
  v19 = type metadata accessor for HStack(255, v17, v18);
  v20 = swift_getWitnessTable(&protocol conformance descriptor for HStack<A>, v19);
  type metadata accessor for HStack(255, v19, v20);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41620);
  v21 = swift_getTupleTypeMetadata2(255);
  v22 = type metadata accessor for TupleView(255, v21);
  v23 = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v22);
  type metadata accessor for VStack(255, v22, v23);
  v24 = swift_getTupleTypeMetadata2(255);
  v25 = type metadata accessor for TupleView(0, v24);
  v26 = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v25);
  return HStack.init(alignment:spacing:content:)(v3, 0, 1, sub_246BC, v28, v25, v26);
}

uint64_t sub_203C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v14;

  v10 = type metadata accessor for _ConditionalContent.Storage(0);
  __chkstk_darwin();
  v12 = (char *)&v14 - v11;
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))((char *)&v14 - v11, a1, a3);
  swift_storeEnumTagMultiPayload(v12, v10, 1);
  return _ConditionalContent<>.init(storage:)(v12, a2, a3, a4, a5);
}

uint64_t sub_20488@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t TupleTypeMetadata2;
  uint64_t v19;
  uint64_t WitnessTable;
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
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(char *, char *, uint64_t);
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(char *, char *, uint64_t);
  char *v57;
  void (*v58)(char *, uint64_t);
  uint64_t (*v59)(char *, uint64_t);
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char v79[16];
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  _QWORD v91[6];
  char *v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;

  v78 = a8;
  v77 = a7;
  v73 = a6;
  v71 = a5;
  v72 = a4;
  v75 = a3;
  v74 = a1;
  v70 = a9;
  v76 = a10;
  v14 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41608);
  v15 = type metadata accessor for ModifiedContent(255, a3, v14);
  v16 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41610);
  type metadata accessor for ModifiedContent(255, v15, v16);
  v17 = type metadata accessor for ModifiedContent(255, a4, v14);
  type metadata accessor for ModifiedContent(255, v17, v16);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2(255);
  v19 = type metadata accessor for TupleView(255, TupleTypeMetadata2);
  WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v19);
  type metadata accessor for VStack(255, v19, WitnessTable);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41618);
  v21 = type metadata accessor for ModifiedContent(255, a5, v14);
  type metadata accessor for ModifiedContent(255, v21, v16);
  v22 = swift_getTupleTypeMetadata2(255);
  v23 = type metadata accessor for TupleView(255, v22);
  type metadata accessor for Optional(255, v23);
  v24 = swift_getTupleTypeMetadata2(255);
  v25 = type metadata accessor for TupleView(255, v24);
  v26 = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v25);
  v27 = type metadata accessor for HStack(255, v25, v26);
  v28 = swift_getWitnessTable(&protocol conformance descriptor for HStack<A>, v27);
  type metadata accessor for HStack(255, v27, v28);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41620);
  v29 = swift_getTupleTypeMetadata2(255);
  v68 = type metadata accessor for TupleView(255, v29);
  v67 = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v68);
  v30 = type metadata accessor for VStack(0, v68, v67);
  v69 = *(_QWORD *)(v30 - 8);
  v31 = __chkstk_darwin(v30);
  v33 = (char *)&v61 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v31);
  v66 = (char *)&v61 - v34;
  v35 = a2;
  v64 = a2;
  v36 = type metadata accessor for ModifiedContent(0, a2, &type metadata for _FrameLayout);
  v65 = *(_QWORD *)(v36 - 8);
  __chkstk_darwin(v36);
  v38 = (char *)&v61 - v37;
  v39 = type metadata accessor for ModifiedContent(0, v36, &type metadata for _PaddingLayout);
  v40 = *(_QWORD *)(v39 - 8);
  v41 = __chkstk_darwin(v39);
  v43 = (char *)&v61 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v41);
  v62 = (char *)&v61 - v44;
  v92 = (char *)v35;
  v93 = v75;
  v94 = v72;
  v95 = v71;
  v45 = v73;
  v96 = v73;
  v97 = v77;
  v98 = v78;
  v99 = v76;
  v46 = type metadata accessor for ListRowTemplate(0, (uint64_t)&v92);
  v47 = sub_20ABC(v46);
  v48 = static Edge.Set.trailing.getter(v47);
  v91[4] = v45;
  v91[5] = &protocol witness table for _FrameLayout;
  v49 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v36);
  View.padding(_:_:)(v48, 0x4010000000000000, 0, v36, v49);
  (*(void (**)(char *, uint64_t))(v65 + 8))(v38, v36);
  v91[2] = v49;
  v91[3] = &protocol witness table for _PaddingLayout;
  v63 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v39);
  v50 = *(void (**)(char *, char *, uint64_t))(v40 + 16);
  v51 = v62;
  v50(v62, v43, v39);
  v65 = *(_QWORD *)(v40 + 8);
  v52 = ((uint64_t (*)(char *, uint64_t))v65)(v43, v39);
  v53 = static HorizontalAlignment.leading.getter(v52);
  v80 = v64;
  v81 = v75;
  v82 = v72;
  v83 = v71;
  v84 = v73;
  v85 = v77;
  v86 = v78;
  v87 = v76;
  v88 = v74;
  VStack.init(alignment:spacing:content:)(v53, 0, 1, sub_246C8, v79, v68, v67);
  v54 = swift_getWitnessTable(&protocol conformance descriptor for VStack<A>, v30);
  v55 = v69;
  v56 = *(void (**)(char *, char *, uint64_t))(v69 + 16);
  v57 = v66;
  v56(v66, v33, v30);
  v58 = *(void (**)(char *, uint64_t))(v55 + 8);
  v58(v33, v30);
  v50(v43, v51, v39);
  v92 = v43;
  v56(v33, v57, v30);
  v93 = v33;
  v91[0] = v39;
  v91[1] = v30;
  v89 = v63;
  v90 = v54;
  sub_21E54((uint64_t *)&v92, 2uLL, (uint64_t)v91);
  v58(v57, v30);
  v59 = (uint64_t (*)(char *, uint64_t))v65;
  ((void (*)(char *, uint64_t))v65)(v51, v39);
  v58(v33, v30);
  return v59(v43, v39);
}

uint64_t sub_20ABC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin(a1);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(void))(v1 + *(int *)(v5 + 88)))();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_41628);
  ScaledMetric.wrappedValue.getter(&v17, v8);
  v9 = v17;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_41628);
  v11 = ScaledMetric.wrappedValue.getter(&v17, v10);
  v12 = v17;
  v13 = static Alignment.center.getter(v11);
  View.frame(width:height:alignment:)(v9, 0, v12, 0, v13, v14, v3, *(_QWORD *)(a1 + 48));
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

uint64_t sub_20BC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t TupleTypeMetadata2;
  uint64_t v22;
  uint64_t WitnessTable;
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
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(char *, char *, uint64_t);
  void (*v45)(char *, uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
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
  uint64_t v63;
  char v64[16];
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  _QWORD v76[2];
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;

  v63 = a8;
  v55 = a7;
  v61 = a6;
  v53 = a4;
  v60 = a3;
  v62 = a1;
  v59 = a9;
  v54 = a10;
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_41620);
  v14 = __chkstk_darwin(v58);
  v57 = (uint64_t)&v50 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v56 = (uint64_t)&v50 - v16;
  v17 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41608);
  v18 = type metadata accessor for ModifiedContent(255, a3, v17);
  v19 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41610);
  type metadata accessor for ModifiedContent(255, v18, v19);
  v20 = type metadata accessor for ModifiedContent(255, a4, v17);
  type metadata accessor for ModifiedContent(255, v20, v19);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2(255);
  v22 = type metadata accessor for TupleView(255, TupleTypeMetadata2);
  WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v22);
  type metadata accessor for VStack(255, v22, WitnessTable);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41618);
  v51 = a5;
  v24 = type metadata accessor for ModifiedContent(255, a5, v17);
  type metadata accessor for ModifiedContent(255, v24, v19);
  v25 = swift_getTupleTypeMetadata2(255);
  v26 = type metadata accessor for TupleView(255, v25);
  type metadata accessor for Optional(255, v26);
  v27 = swift_getTupleTypeMetadata2(255);
  v28 = type metadata accessor for TupleView(255, v27);
  v29 = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v28);
  v30 = type metadata accessor for HStack(255, v28, v29);
  v31 = swift_getWitnessTable(&protocol conformance descriptor for HStack<A>, v30);
  v32 = type metadata accessor for HStack(0, v30, v31);
  v33 = *(_QWORD *)(v32 - 8);
  v34 = __chkstk_darwin(v32);
  v36 = (char *)&v50 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = __chkstk_darwin(v34);
  v39 = (char *)&v50 - v38;
  v40 = static VerticalAlignment.top.getter(v37);
  v65 = a2;
  v66 = v60;
  v41 = v53;
  v67 = v53;
  v68 = a5;
  v42 = v55;
  v69 = v61;
  v70 = v55;
  v43 = v54;
  v71 = v63;
  v72 = v54;
  v73 = v62;
  HStack.init(alignment:spacing:content:)(v40, 0, 1, sub_246D4, v64, v30, v31);
  v52 = swift_getWitnessTable(&protocol conformance descriptor for HStack<A>, v32);
  v44 = *(void (**)(char *, char *, uint64_t))(v33 + 16);
  v44(v39, v36, v32);
  v45 = *(void (**)(char *, uint64_t))(v33 + 8);
  v45(v36, v32);
  v77 = (char *)a2;
  v78 = v60;
  v79 = v41;
  v80 = v51;
  v81 = v61;
  v82 = v42;
  v83 = v63;
  v84 = v43;
  v46 = type metadata accessor for ListRowTemplate(0, (uint64_t)&v77);
  v47 = v56;
  sub_22574(v46, v56);
  v44(v36, v39, v32);
  v77 = v36;
  v48 = v57;
  sub_1A1D4(v47, v57, &qword_41620);
  v78 = v48;
  v76[0] = v32;
  v76[1] = v58;
  v74 = v52;
  v75 = sub_243F0();
  sub_21E54((uint64_t *)&v77, 2uLL, (uint64_t)v76);
  sub_1A198(v47, &qword_41620);
  v45(v39, v32);
  sub_1A198(v48, &qword_41620);
  return ((uint64_t (*)(char *, uint64_t))v45)(v36, v32);
}

uint64_t sub_21040@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, char *a9@<X8>, uint64_t a10)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t TupleTypeMetadata2;
  uint64_t v19;
  uint64_t WitnessTable;
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
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  void (*v36)(char *, char *, uint64_t);
  void (*v37)(char *, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  _BYTE v45[16];
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v42 = a7;
  v43 = a8;
  v40 = a1;
  v41 = a6;
  v44 = a9;
  v39 = a10;
  v14 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41608);
  v15 = type metadata accessor for ModifiedContent(255, a3, v14);
  v16 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41610);
  type metadata accessor for ModifiedContent(255, v15, v16);
  v17 = type metadata accessor for ModifiedContent(255, a4, v14);
  type metadata accessor for ModifiedContent(255, v17, v16);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2(255);
  v19 = type metadata accessor for TupleView(255, TupleTypeMetadata2);
  WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v19);
  type metadata accessor for VStack(255, v19, WitnessTable);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41618);
  v21 = type metadata accessor for ModifiedContent(255, a5, v14);
  type metadata accessor for ModifiedContent(255, v21, v16);
  v22 = swift_getTupleTypeMetadata2(255);
  v23 = type metadata accessor for TupleView(255, v22);
  type metadata accessor for Optional(255, v23);
  v24 = swift_getTupleTypeMetadata2(255);
  v25 = type metadata accessor for TupleView(255, v24);
  v26 = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v25);
  v27 = type metadata accessor for HStack(0, v25, v26);
  v28 = *(_QWORD *)(v27 - 8);
  v29 = __chkstk_darwin(v27);
  v31 = (char *)&v39 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __chkstk_darwin(v29);
  v34 = (char *)&v39 - v33;
  v35 = static VerticalAlignment.center.getter(v32);
  v46 = a2;
  v47 = a3;
  v48 = a4;
  v49 = a5;
  v50 = v41;
  v51 = v42;
  v52 = v43;
  v53 = v39;
  v54 = v40;
  HStack.init(alignment:spacing:content:)(v35, 0, 1, sub_246E0, v45, v25, v26);
  swift_getWitnessTable(&protocol conformance descriptor for HStack<A>, v27);
  v36 = *(void (**)(char *, char *, uint64_t))(v28 + 16);
  v36(v34, v31, v27);
  v37 = *(void (**)(char *, uint64_t))(v28 + 8);
  v37(v31, v27);
  v36(v44, v34, v27);
  return ((uint64_t (*)(char *, uint64_t))v37)(v34, v27);
}

uint64_t sub_212F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t TupleTypeMetadata2;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t WitnessTable;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, char *, uint64_t);
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(char *, char *, uint64_t);
  char *v46;
  void (*v47)(char *, uint64_t);
  char *v48;
  uint64_t (*v49)(char *, uint64_t);
  char *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  void (*v55)(char *, uint64_t);
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char v69[16];
  uint64_t v70;
  _BYTE *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD v81[3];
  char *v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;

  v62 = a8;
  v67 = a7;
  v66 = a6;
  v56 = a5;
  v58 = a2;
  v68 = a1;
  v65 = a9;
  v59 = a10;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41618);
  v13 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41608);
  v14 = type metadata accessor for ModifiedContent(255, a5, v13);
  v15 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41610);
  type metadata accessor for ModifiedContent(255, v14, v15);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2(255);
  v61 = type metadata accessor for TupleView(255, TupleTypeMetadata2);
  v63 = type metadata accessor for Optional(0, v61);
  v64 = *(_QWORD *)(v63 - 8);
  v17 = __chkstk_darwin(v63);
  v57 = (char *)&v51 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  v60 = (char *)&v51 - v19;
  v20 = a3;
  v51 = a3;
  v21 = type metadata accessor for ModifiedContent(255, a3, v13);
  type metadata accessor for ModifiedContent(255, v21, v15);
  v52 = a4;
  v22 = type metadata accessor for ModifiedContent(255, a4, v13);
  type metadata accessor for ModifiedContent(255, v22, v15);
  v23 = swift_getTupleTypeMetadata2(255);
  v24 = type metadata accessor for TupleView(255, v23);
  WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v24);
  v26 = type metadata accessor for VStack(0, v24, WitnessTable);
  v27 = *(_QWORD *)(v26 - 8);
  v28 = __chkstk_darwin(v26);
  v30 = (char *)&v51 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = __chkstk_darwin(v28);
  v33 = (char *)&v51 - v32;
  v53 = (char *)&v51 - v32;
  v34 = static HorizontalAlignment.leading.getter(v31);
  v35 = v58;
  v70 = v58;
  v71 = v20;
  v36 = v56;
  v72 = a4;
  v73 = v56;
  v74 = v66;
  v75 = v67;
  v37 = v62;
  v38 = v59;
  v76 = v62;
  v77 = v59;
  v78 = v68;
  VStack.init(alignment:spacing:content:)(v34, 0, 1, sub_246EC, v69, v24, WitnessTable);
  v54 = swift_getWitnessTable(&protocol conformance descriptor for VStack<A>, v26);
  v39 = *(void (**)(char *, char *, uint64_t))(v27 + 16);
  v39(v33, v30, v26);
  v55 = *(void (**)(char *, uint64_t))(v27 + 8);
  v55(v30, v26);
  v82 = (char *)v35;
  v83 = v51;
  v84 = v52;
  v85 = v36;
  v86 = v66;
  v87 = v67;
  v88 = v37;
  v89 = v38;
  v40 = type metadata accessor for ListRowTemplate(0, (uint64_t)&v82);
  v41 = v57;
  sub_22008(1, v40, v57);
  v81[2] = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v61);
  v42 = v63;
  v43 = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v63);
  v44 = v64;
  v45 = *(void (**)(char *, _BYTE *, uint64_t))(v64 + 16);
  v46 = v60;
  v45(v60, v41, v42);
  v47 = *(void (**)(_BYTE *, uint64_t))(v44 + 8);
  v47(v41, v42);
  v48 = v53;
  v39(v30, v53, v26);
  v82 = v30;
  v45(v41, v46, v42);
  v83 = v41;
  v81[0] = v26;
  v81[1] = v42;
  v79 = v54;
  v80 = v43;
  sub_21E54((uint64_t *)&v82, 2uLL, (uint64_t)v81);
  v47(v46, v42);
  v49 = (uint64_t (*)(char *, uint64_t))v55;
  v55(v48, v26);
  v47(v41, v42);
  return v49(v30, v26);
}

uint64_t sub_2178C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void (*a7)(_QWORD, _QWORD)@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  void (*v27)(_QWORD, _QWORD);
  uint64_t v28;
  uint64_t WitnessTable;
  uint64_t v30;
  void (*v31)(char *, char *, uint64_t);
  char *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  char *v36;
  void (*v37)(char *, uint64_t);
  uint64_t (*v38)(char *, uint64_t);
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(_QWORD, _QWORD);
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[10];
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(_QWORD, _QWORD);
  uint64_t v62;
  uint64_t v63;

  v42 = a8;
  v47 = a7;
  v46 = a6;
  v45 = a5;
  v43 = a2;
  v52 = a1;
  v51 = a9;
  v44 = a10;
  v13 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41608);
  v49 = type metadata accessor for ModifiedContent(255, a4, v13);
  v14 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41610);
  v15 = type metadata accessor for ModifiedContent(0, v49, v14);
  v50 = *(_QWORD *)(v15 - 8);
  v16 = __chkstk_darwin(v15);
  v18 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v48 = (char *)&v40 - v19;
  v20 = type metadata accessor for ModifiedContent(255, a3, v13);
  v21 = type metadata accessor for ModifiedContent(0, v20, v14);
  v22 = *(_QWORD *)(v21 - 8);
  v23 = __chkstk_darwin(v21);
  v25 = (char *)&v40 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  v41 = (char *)&v40 - v26;
  v56 = (char *)v43;
  v57 = a3;
  v58 = a4;
  v59 = v45;
  v27 = v47;
  v60 = v46;
  v61 = v47;
  v62 = a8;
  v63 = v44;
  v45 = type metadata accessor for ListRowTemplate(0, (uint64_t)&v56);
  sub_21B54(v45, (uint64_t)v25);
  v28 = sub_1A114(&qword_416D0, &qword_41608, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
  v55[8] = v27;
  v55[9] = v28;
  WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v20);
  v30 = sub_1A114(&qword_416D8, &qword_41610, (uint64_t)&protocol conformance descriptor for _ForegroundStyleModifier<A>);
  v55[6] = WitnessTable;
  v55[7] = v30;
  v46 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v21);
  v31 = *(void (**)(char *, char *, uint64_t))(v22 + 16);
  v32 = v41;
  v31(v41, v25, v21);
  v47 = *(void (**)(_QWORD, _QWORD))(v22 + 8);
  v47(v25, v21);
  sub_21CD4(v45, (uint64_t)v18);
  v55[4] = v42;
  v55[5] = v28;
  v55[2] = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v49);
  v55[3] = v30;
  v33 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v15);
  v34 = v50;
  v35 = *(void (**)(char *, char *, uint64_t))(v50 + 16);
  v36 = v48;
  v35(v48, v18, v15);
  v37 = *(void (**)(char *, uint64_t))(v34 + 8);
  v37(v18, v15);
  v31(v25, v32, v21);
  v56 = v25;
  v35(v18, v36, v15);
  v57 = v18;
  v55[0] = v21;
  v55[1] = v15;
  v53 = v46;
  v54 = v33;
  sub_21E54((uint64_t *)&v56, 2uLL, (uint64_t)v55);
  v37(v36, v15);
  v38 = (uint64_t (*)(char *, uint64_t))v47;
  v47(v32, v21);
  v37(v18, v15);
  return v38(v25, v21);
}

uint64_t sub_21B54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t WitnessTable;
  _QWORD v21[3];
  int v22;

  v21[0] = a2;
  v4 = *(_QWORD *)(a1 + 24);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(a1);
  v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41608);
  v9 = type metadata accessor for ModifiedContent(0, v4, v8);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)v21 - v12;
  v14 = (*(uint64_t (**)(uint64_t))(v2 + *(int *)(a1 + 92)))(v11);
  v15 = static Font.headline.getter(v14);
  v16 = *(_QWORD *)(a1 + 56);
  View.font(_:)(v15, v4, v16);
  swift_release(v15);
  v17 = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v22 = static HierarchicalShapeStyle.primary.getter(v17);
  v18 = sub_1A114(&qword_416D0, &qword_41608, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
  v21[1] = v16;
  v21[2] = v18;
  WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v9);
  View.foregroundStyle<A>(_:)(&v22, v9, &type metadata for HierarchicalShapeStyle, WitnessTable, &protocol witness table for HierarchicalShapeStyle);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
}

uint64_t sub_21CD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t WitnessTable;
  _QWORD v21[3];
  int v22;

  v21[0] = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(a1);
  v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41608);
  v9 = type metadata accessor for ModifiedContent(0, v4, v8);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)v21 - v12;
  v14 = (*(uint64_t (**)(uint64_t))(v2 + *(int *)(a1 + 96)))(v11);
  v15 = static Font.subheadline.getter(v14);
  v16 = *(_QWORD *)(a1 + 64);
  View.font(_:)(v15, v4, v16);
  swift_release(v15);
  v17 = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v22 = static HierarchicalShapeStyle.secondary.getter(v17);
  v18 = sub_1A114(&qword_416D0, &qword_41608, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
  v21[1] = v16;
  v21[2] = v18;
  WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v9);
  View.foregroundStyle<A>(_:)(&v22, v9, &type metadata for HierarchicalShapeStyle, WitnessTable, &protocol witness table for HierarchicalShapeStyle);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
}

uint64_t sub_21E54(uint64_t *a1, unint64_t a2, uint64_t a3)
{
  uint64_t *v5;
  uint64_t TupleTypeMetadata;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  __int128 *v12;
  _OWORD *v13;
  unint64_t v14;
  __int128 v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;

  v5 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    TupleTypeMetadata = *v5;
    __chkstk_darwin();
    v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
LABEL_12:
    v22 = 32;
    v23 = a2;
    do
    {
      if (a2 == 1)
        v24 = 0;
      else
        v24 = *(_DWORD *)(TupleTypeMetadata + v22);
      v26 = *v5++;
      v25 = v26;
      v27 = *a1++;
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(&v8[v24], v27);
      v22 += 16;
      --v23;
    }
    while (v23);
    return TupleView.init(_:)(v8, TupleTypeMetadata);
  }
  __chkstk_darwin();
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v11 = 0;
    if (a2 < 4)
      goto LABEL_9;
    if ((unint64_t)(v10 - (char *)v5) < 0x20)
      goto LABEL_9;
    v11 = a2 & 0xFFFFFFFFFFFFFFFCLL;
    v12 = (__int128 *)(v5 + 2);
    v13 = v10 + 16;
    v14 = a2 & 0xFFFFFFFFFFFFFFFCLL;
    do
    {
      v15 = *v12;
      *(v13 - 1) = *(v12 - 1);
      *v13 = v15;
      v12 += 2;
      v13 += 2;
      v14 -= 4;
    }
    while (v14);
    if (v11 != a2)
    {
LABEL_9:
      v16 = a2 - v11;
      v17 = v11;
      v18 = &v10[8 * v11];
      v19 = &v5[v17];
      do
      {
        v20 = *v19++;
        *(_QWORD *)v18 = v20;
        v18 += 8;
        --v16;
      }
      while (v16);
    }
  }
  TupleTypeMetadata = swift_getTupleTypeMetadata(0, a2);
  __chkstk_darwin();
  v8 = (char *)&v29 - v21;
  if (a2)
    goto LABEL_12;
  return TupleView.init(_:)(v8, TupleTypeMetadata);
}

uint64_t sub_22008@<X0>(int a1@<W0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t v3;
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
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t TupleTypeMetadata2;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int (*v29)(_BYTE *, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  _BYTE *v32;
  uint64_t v33;
  _BYTE *v34;
  void (*v35)(_BYTE *, _BYTE *, uint64_t);
  void (*v36)(_BYTE *, uint64_t);
  uint64_t (*v37)(void);
  _BYTE *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  _BYTE *v43;
  uint64_t v44;
  _BYTE *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t WitnessTable;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(_BYTE *, uint64_t, uint64_t);
  _BYTE *v55;
  void (*v56)(uint64_t, uint64_t);
  _BYTE *v57;
  uint64_t v58;
  _BYTE v60[12];
  int v61;
  uint64_t v62;
  uint64_t v63;
  _BYTE *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _BYTE *v69;
  _BYTE *v70;
  _BYTE *v71;
  int v72;
  _BYTE *v73;
  uint64_t v74;
  uint64_t v75;
  _BYTE *v76;
  _BYTE *v77;
  unint64_t v78;
  uint64_t v79;
  _QWORD v80[2];
  uint64_t v81;
  char v82;
  BOOL v83;
  uint64_t v84[8];

  v72 = a1;
  v77 = a3;
  v5 = *(_QWORD *)(a2 + 40);
  v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41608);
  v7 = type metadata accessor for ModifiedContent(0, v5, v6);
  v66 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v64 = &v60[-v8];
  v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41610);
  v67 = v7;
  v10 = type metadata accessor for ModifiedContent(0, v7, v9);
  v68 = *(_QWORD *)(v10 - 8);
  v11 = __chkstk_darwin(v10);
  v71 = &v60[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v11);
  v70 = &v60[-v13];
  v14 = type metadata accessor for Optional(0, v5);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = __chkstk_darwin(v14);
  v18 = &v60[-v17];
  v19 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v16);
  v69 = &v60[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v65 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41618);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2(255);
  v74 = type metadata accessor for TupleView(255, TupleTypeMetadata2);
  v22 = type metadata accessor for Optional(0, v74);
  v75 = *(_QWORD *)(v22 - 8);
  v23 = __chkstk_darwin(v22);
  v73 = &v60[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v25 = __chkstk_darwin(v23);
  v76 = &v60[-v26];
  v27 = a2;
  (*(void (**)(uint64_t))(v3 + *(int *)(a2 + 100)))(v25);
  v28 = v19;
  v29 = *(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v19 + 48);
  v30 = v5;
  if (v29(v18, 1, v5) == 1)
  {
    (*(void (**)(_BYTE *, uint64_t))(v15 + 8))(v18, v14);
    v32 = v73;
    v31 = v74;
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v74 - 8) + 56))(v73, 1, 1, v74);
    swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v31);
    v33 = v75;
    v34 = v76;
    v35 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v75 + 16);
    v35(v76, v32, v22);
    v36 = *(void (**)(_BYTE *, uint64_t))(v33 + 8);
    v36(v32, v22);
  }
  else
  {
    v63 = v28;
    v37 = *(uint64_t (**)(void))(v28 + 32);
    v38 = v69;
    v62 = v5;
    v39 = v37();
    v40 = v72;
    v61 = v72 & 1;
    v41 = static Font.subheadline.getter(v39);
    v42 = *(_QWORD *)(a2 + 72);
    v43 = v64;
    v44 = *(_QWORD *)(v27 + 72);
    v45 = v38;
    View.font(_:)(v41, v30, v44);
    v46 = swift_release(v41);
    LODWORD(v84[0]) = static HierarchicalShapeStyle.secondary.getter(v46);
    v47 = sub_1A114(&qword_416D0, &qword_41608, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    v84[4] = v42;
    v84[5] = v47;
    v48 = v67;
    WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v67);
    v50 = (uint64_t)v71;
    View.foregroundStyle<A>(_:)(v84, v48, &type metadata for HierarchicalShapeStyle, WitnessTable, &protocol witness table for HierarchicalShapeStyle);
    (*(void (**)(_BYTE *, uint64_t))(v66 + 8))(v43, v48);
    v51 = sub_1A114(&qword_416D8, &qword_41610, (uint64_t)&protocol conformance descriptor for _ForegroundStyleModifier<A>);
    v84[2] = WitnessTable;
    v84[3] = v51;
    v52 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v10);
    v53 = v68;
    v54 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v68 + 16);
    v55 = v70;
    v54(v70, v50, v10);
    v56 = *(void (**)(uint64_t, uint64_t))(v53 + 8);
    v56(v50, v10);
    v81 = 0;
    v82 = v61;
    v83 = (v40 & 1) == 0;
    v84[0] = (uint64_t)&v81;
    v54((_BYTE *)v50, (uint64_t)v55, v10);
    v84[1] = v50;
    v80[0] = v65;
    v80[1] = v10;
    v78 = sub_24660();
    v79 = v52;
    v57 = v73;
    sub_21E54(v84, 2uLL, (uint64_t)v80);
    v56((uint64_t)v55, v10);
    (*(void (**)(_BYTE *, uint64_t))(v63 + 8))(v45, v62);
    v56(v50, v10);
    v31 = v74;
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v74 - 8) + 56))(v57, 0, 1, v74);
    swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v31);
    v58 = v75;
    v34 = v76;
    v35 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v75 + 16);
    v35(v76, v57, v22);
    v36 = *(void (**)(_BYTE *, uint64_t))(v58 + 8);
    v36(v57, v22);
  }
  v84[6] = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v31);
  swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v22);
  v35(v77, v34, v22);
  return ((uint64_t (*)(_BYTE *, uint64_t))v36)(v34, v22);
}

uint64_t sub_22574@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t KeyPath;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  unint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v45 = a2;
  v3 = type metadata accessor for BorderedButtonStyle(0);
  v41 = *(_QWORD *)(v3 - 8);
  v42 = v3;
  __chkstk_darwin(v3);
  v40 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for TitleOnlyLabelStyle(0);
  v37 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DynamicControlsStack(0);
  v36 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_41708);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_416E8);
  __chkstk_darwin(v39);
  v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_41710);
  v17 = *(_QWORD *)(v44 - 8);
  v18 = __chkstk_darwin(v44);
  v38 = (char *)&v36 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = (*(uint64_t (**)(uint64_t))(v43 + *(int *)(a1 + 104)))(v18);
  if (*(_QWORD *)(v20 + 16))
  {
    v21 = DynamicControlsStack.init(controls:isSameWidthWhenHorizontal:isSameWidthWhenVertical:)();
    TitleOnlyLabelStyle.init()(v21);
    v22 = sub_19D7C(&qword_416F8, (uint64_t (*)(uint64_t))&type metadata accessor for DynamicControlsStack, (uint64_t)&protocol conformance descriptor for DynamicControlsStack);
    v23 = sub_19D7C(&qword_41408, (uint64_t (*)(uint64_t))&type metadata accessor for TitleOnlyLabelStyle, (uint64_t)&protocol conformance descriptor for TitleOnlyLabelStyle);
    View.labelStyle<A>(_:)(v7, v8, v5, v22, v23);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v7, v5);
    (*(void (**)(char *, uint64_t))(v36 + 8))(v10, v8);
    KeyPath = swift_getKeyPath(&unk_34108);
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v16, v14, v11);
    v25 = v39;
    v26 = &v16[*(int *)(v39 + 36)];
    *(_QWORD *)v26 = KeyPath;
    v26[8] = 1;
    v27 = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    v28 = v40;
    BorderedButtonStyle.init()(v27);
    v29 = sub_244C0();
    v30 = sub_19D7C(&qword_41700, (uint64_t (*)(uint64_t))&type metadata accessor for BorderedButtonStyle, (uint64_t)&protocol conformance descriptor for BorderedButtonStyle);
    v31 = v38;
    v32 = v42;
    View.buttonStyle<A>(_:)(v28, v25, v42, v29, v30);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v28, v32);
    sub_1A198((uint64_t)v16, &qword_416E8);
    v34 = v44;
    v33 = v45;
    (*(void (**)(uint64_t, char *, uint64_t))(v17 + 32))(v45, v31, v44);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v17 + 56))(v33, 0, 1, v34);
  }
  else
  {
    swift_bridgeObjectRelease(v20);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 56))(v45, 1, 1, v44);
  }
}

uint64_t sub_22910@<X0>(uint64_t a1@<X1>, char *a2@<X2>, uint64_t a3@<X3>, char *a4@<X4>, void (*a5)(_QWORD, _QWORD)@<X5>, void (*a6)(_QWORD, _QWORD)@<X6>, void (*a7)(_QWORD, _QWORD)@<X7>, uint64_t a8@<X8>, uint64_t a9)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t TupleTypeMetadata2;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  void (*v40)(_QWORD, _QWORD);
  void (*v41)(_QWORD, _QWORD);
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
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(char *, _BYTE *, uint64_t);
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(_BYTE *, uint64_t);
  void (*v70)(uint64_t, uint64_t);
  void (*v71)(char *, uint64_t);
  uint64_t (*v72)(char *, uint64_t);
  char *v74;
  void (*v75)(char *, char *, uint64_t);
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  char *v80;
  uint64_t WitnessTable;
  uint64_t v82;
  void (*v83)(_QWORD, _QWORD);
  uint64_t v84;
  void (*v85)(_QWORD, _QWORD);
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  char *v96;
  char *v97;
  void (*v98)(_QWORD, _QWORD);
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  _QWORD v107[16];
  uint64_t v108;
  char *v109;
  uint64_t v110;
  char *v111;
  void (*v112)(_QWORD, _QWORD);
  void (*v113)(_QWORD, _QWORD);
  void (*v114)(_QWORD, _QWORD);
  uint64_t v115;

  v98 = a7;
  v83 = a6;
  v85 = a5;
  v79 = (char *)a4;
  v92 = a8;
  WitnessTable = a9;
  v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_41620);
  v13 = __chkstk_darwin(v91);
  v99 = (uint64_t)&v74 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v90 = (uint64_t)&v74 - v15;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41618);
  v16 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41608);
  v17 = type metadata accessor for ModifiedContent(255, (char *)a4, v16);
  v18 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41610);
  type metadata accessor for ModifiedContent(255, v17, v18);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2(255);
  v87 = type metadata accessor for TupleView(255, TupleTypeMetadata2);
  v88 = type metadata accessor for Optional(0, v87);
  v89 = *(_QWORD *)(v88 - 8);
  v20 = __chkstk_darwin(v88);
  v97 = (char *)&v74 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  v86 = (char *)&v74 - v22;
  v23 = a3;
  v82 = type metadata accessor for ModifiedContent(255, a3, v16);
  v95 = type metadata accessor for ModifiedContent(0, v82, v18);
  v84 = *(_QWORD *)(v95 - 8);
  v24 = __chkstk_darwin(v95);
  v100 = (uint64_t)&v74 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  v80 = (char *)&v74 - v26;
  v77 = type metadata accessor for ModifiedContent(255, a2, v16);
  v93 = type metadata accessor for ModifiedContent(0, v77, v18);
  v76 = *(_QWORD *)(v93 - 8);
  v27 = __chkstk_darwin(v93);
  v29 = (char *)&v74 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  v101 = (char *)&v74 - v30;
  v31 = a1;
  v32 = type metadata accessor for ModifiedContent(0, a1, &type metadata for _FrameLayout);
  v33 = *(_QWORD *)(v32 - 8);
  v34 = v32;
  v35 = __chkstk_darwin(v32);
  v37 = (char *)&v74 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v35);
  v39 = (char *)&v74 - v38;
  v96 = (char *)&v74 - v38;
  v108 = v31;
  v109 = a2;
  v110 = v23;
  v111 = v79;
  v40 = v85;
  v41 = v83;
  v112 = v85;
  v113 = v83;
  v114 = v98;
  v115 = WitnessTable;
  v42 = type metadata accessor for ListRowTemplate(0, (uint64_t)&v108);
  sub_20ABC(v42);
  v107[14] = v40;
  v107[15] = &protocol witness table for _FrameLayout;
  v78 = v34;
  WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v34);
  v79 = *(char **)(v33 + 16);
  v94 = v37;
  ((void (*)(char *, char *, uint64_t))v79)(v39, v37, v34);
  v85 = *(void (**)(_QWORD, _QWORD))(v33 + 8);
  v85(v37, v34);
  v43 = v42;
  sub_21B54(v42, (uint64_t)v29);
  v44 = sub_1A114(&qword_416D0, &qword_41608, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
  v107[12] = v41;
  v107[13] = v44;
  v45 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v77);
  v46 = sub_1A114(&qword_416D8, &qword_41610, (uint64_t)&protocol conformance descriptor for _ForegroundStyleModifier<A>);
  v107[10] = v45;
  v107[11] = v46;
  v47 = v93;
  v77 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v93);
  v48 = v76;
  v75 = *(void (**)(char *, char *, uint64_t))(v76 + 16);
  v75(v101, v29, v47);
  v83 = *(void (**)(_QWORD, _QWORD))(v48 + 8);
  v83(v29, v47);
  v49 = v100;
  v50 = v43;
  sub_21CD4(v43, v100);
  v107[8] = v98;
  v107[9] = v44;
  v107[6] = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v82);
  v107[7] = v46;
  v51 = v95;
  v82 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v95);
  v52 = v84;
  v76 = *(_QWORD *)(v84 + 16);
  v53 = v80;
  ((void (*)(char *, uint64_t, uint64_t))v76)(v80, v49, v51);
  v98 = *(void (**)(_QWORD, _QWORD))(v52 + 8);
  v98(v49, v51);
  v54 = v97;
  sub_22008(0, v50, v97);
  v107[5] = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v87);
  v55 = v88;
  v87 = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v88);
  v56 = v89;
  v57 = *(void (**)(char *, _BYTE *, uint64_t))(v89 + 16);
  v58 = v86;
  v57(v86, v54, v55);
  v89 = *(_QWORD *)(v56 + 8);
  v59 = v54;
  ((void (*)(char *, uint64_t))v89)(v54, v55);
  v60 = v90;
  sub_22574(v50, v90);
  v61 = (uint64_t)v94;
  v62 = v78;
  ((void (*)(char *, char *, uint64_t))v79)(v94, v96, v78);
  v108 = v61;
  v63 = v29;
  v74 = v29;
  v64 = v29;
  v65 = v93;
  v75(v64, v101, v93);
  v109 = v63;
  v66 = v100;
  v67 = v95;
  ((void (*)(uint64_t, char *, uint64_t))v76)(v100, v53, v95);
  v110 = v66;
  v57(v59, v58, v55);
  v111 = v59;
  v68 = v99;
  sub_1A1D4(v60, v99, &qword_41620);
  v112 = (void (*)(_QWORD, _QWORD))v68;
  v107[0] = v62;
  v107[1] = v65;
  v107[2] = v67;
  v107[3] = v55;
  v107[4] = v91;
  v102 = WitnessTable;
  v103 = v77;
  v104 = v82;
  v105 = v87;
  v106 = sub_243F0();
  sub_21E54(&v108, 5uLL, (uint64_t)v107);
  sub_1A198(v60, &qword_41620);
  v69 = (void (*)(_BYTE *, uint64_t))v89;
  ((void (*)(char *, uint64_t))v89)(v58, v55);
  v70 = v98;
  v98(v53, v67);
  v71 = (void (*)(char *, uint64_t))v83;
  v83(v101, v65);
  v72 = (uint64_t (*)(char *, uint64_t))v85;
  v85(v96, v62);
  sub_1A198(v99, &qword_41620);
  v69(v97, v55);
  v70(v100, v67);
  v71(v74, v65);
  return v72(v94, v62);
}

uint64_t sub_23168@<X0>(uint64_t a1@<X8>)
{
  return sub_2319C(&qword_41258, (uint64_t (*)(_QWORD))&type metadata accessor for DismissAction, 0x417373696D736944, 0xED00006E6F697463, a1);
}

uint64_t sub_2319C@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v20;
  os_log_type_t v21;
  NSObject *v22;
  uint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v29 = a3;
  v9 = v5;
  v11 = type metadata accessor for EnvironmentValues(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(a1);
  __chkstk_darwin(v15);
  v17 = (uint64_t *)((char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1A1D4(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload(v17, v15) == 1)
  {
    v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    v20 = *v17;
    v21 = static os_log_type_t.fault.getter();
    v22 = static Log.runtimeIssuesLog.getter();
    if (os_log_type_enabled(v22, v21))
    {
      v27 = a4;
      v23 = swift_slowAlloc(12, -1);
      v28 = a5;
      v24 = (uint8_t *)v23;
      v25 = swift_slowAlloc(32, -1);
      v31 = v25;
      *(_DWORD *)v24 = 136315138;
      v30 = sub_FD1C(v29, v27, &v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v24 + 4, v24 + 12);
      _os_log_impl(&dword_0, v22, v21, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v24, 0xCu);
      swift_arrayDestroy(v25, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v25, -1, -1);
      swift_slowDealloc(v24, -1, -1);
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath(v14, v20);
    swift_release(v20);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_233D4()
{
  return EnvironmentValues.dynamicTypeSize.getter();
}

uint64_t sub_233F4()
{
  return EnvironmentValues.dynamicTypeSize.getter();
}

uint64_t sub_23414(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  type metadata accessor for DynamicTypeSize(0);
  __chkstk_darwin();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return EnvironmentValues.dynamicTypeSize.setter(v3);
}

uint64_t sub_23494(uint64_t a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;
  _OWORD v5[4];

  v2 = a2[2];
  v5[0] = a2[1];
  v5[1] = v2;
  v3 = a2[4];
  v5[2] = a2[3];
  v5[3] = v3;
  return swift_getOpaqueTypeConformance2(v5, &opaque type descriptor for <<opaque return type of ListRowTemplate.body>>, 1);
}

uint64_t sub_234D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 96);
}

void sub_234D8(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[7];

  sub_23EB0(319);
  if (v3 <= 0x3F)
  {
    v6[0] = *(_QWORD *)(v2 - 8) + 64;
    sub_23F4C(319);
    if (v5 <= 0x3F)
    {
      v6[1] = *(_QWORD *)(v4 - 8) + 64;
      v6[2] = (char *)&value witness table for () + 64;
      v6[3] = (char *)&value witness table for () + 64;
      v6[4] = (char *)&value witness table for () + 64;
      v6[5] = (char *)&value witness table for () + 64;
      v6[6] = (char *)&value witness table for () + 64;
      swift_initStructMetadata(a1, 0, 7, v6, a1 + 80);
    }
  }
}

uint64_t *sub_23570(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *a1 = *a2;
    v4 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_41628);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v4, a2, v7);
    v8 = a3[21];
    v9 = (uint64_t *)((char *)v4 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_41600);
    if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
    {
      v12 = type metadata accessor for DynamicTypeSize(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v9, v10, v12);
      v13 = v9;
      v14 = v11;
      v15 = 1;
    }
    else
    {
      v17 = *v10;
      *v9 = *v10;
      swift_retain(v17);
      v13 = v9;
      v14 = v11;
      v15 = 0;
    }
    swift_storeEnumTagMultiPayload(v13, v14, v15);
    v18 = a3[22];
    v19 = a3[23];
    v20 = (uint64_t *)((char *)v4 + v18);
    v21 = (uint64_t *)((char *)a2 + v18);
    v22 = v21[1];
    *v20 = *v21;
    v20[1] = v22;
    v23 = (uint64_t *)((char *)v4 + v19);
    v24 = (uint64_t *)((char *)a2 + v19);
    v25 = v24[1];
    *v23 = *v24;
    v23[1] = v25;
    v26 = a3[24];
    v27 = a3[25];
    v28 = (uint64_t *)((char *)v4 + v26);
    v29 = (uint64_t *)((char *)a2 + v26);
    v30 = v29[1];
    *v28 = *v29;
    v28[1] = v30;
    v31 = (uint64_t *)((char *)v4 + v27);
    v32 = (uint64_t *)((char *)a2 + v27);
    v33 = v32[1];
    *v31 = *v32;
    v31[1] = v33;
    v34 = a3[26];
    v35 = (uint64_t *)((char *)v4 + v34);
    v36 = (uint64_t *)((char *)a2 + v34);
    v16 = v36[1];
    *v35 = *v36;
    v35[1] = v16;
    swift_retain(v22);
    swift_retain(v25);
    swift_retain(v30);
    swift_retain(v33);
  }
  swift_retain(v16);
  return v4;
}

uint64_t sub_236F0(uint64_t a1, int *a2)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_41628);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = (_QWORD *)(a1 + a2[21]);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_41600);
  if (swift_getEnumCaseMultiPayload(v5, v6) == 1)
  {
    v7 = type metadata accessor for DynamicTypeSize(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v5, v7);
  }
  else
  {
    swift_release(*v5);
  }
  swift_release(*(_QWORD *)(a1 + a2[22] + 8));
  swift_release(*(_QWORD *)(a1 + a2[23] + 8));
  swift_release(*(_QWORD *)(a1 + a2[24] + 8));
  swift_release(*(_QWORD *)(a1 + a2[25] + 8));
  return swift_release(*(_QWORD *)(a1 + a2[26] + 8));
}

uint64_t sub_237D4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_41628);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[21];
  v8 = (uint64_t *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_41600);
  if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
  {
    v11 = type metadata accessor for DynamicTypeSize(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v8, v9, v11);
    v12 = v8;
    v13 = v10;
    v14 = 1;
  }
  else
  {
    v15 = *v9;
    *v8 = *v9;
    swift_retain(v15);
    v12 = v8;
    v13 = v10;
    v14 = 0;
  }
  swift_storeEnumTagMultiPayload(v12, v13, v14);
  v16 = a3[22];
  v17 = a3[23];
  v18 = (_QWORD *)(a1 + v16);
  v19 = (_QWORD *)(a2 + v16);
  v20 = v19[1];
  *v18 = *v19;
  v18[1] = v20;
  v21 = (_QWORD *)(a1 + v17);
  v22 = (_QWORD *)(a2 + v17);
  v23 = v22[1];
  *v21 = *v22;
  v21[1] = v23;
  v24 = a3[24];
  v25 = a3[25];
  v26 = (_QWORD *)(a1 + v24);
  v27 = (_QWORD *)(a2 + v24);
  v28 = v27[1];
  *v26 = *v27;
  v26[1] = v28;
  v29 = (_QWORD *)(a1 + v25);
  v30 = (_QWORD *)(a2 + v25);
  v31 = v30[1];
  *v29 = *v30;
  v29[1] = v31;
  v32 = a3[26];
  v33 = (_QWORD *)(a1 + v32);
  v34 = (_QWORD *)(a2 + v32);
  v35 = v34[1];
  *v33 = *v34;
  v33[1] = v35;
  swift_retain(v20);
  swift_retain(v23);
  swift_retain(v28);
  swift_retain(v31);
  swift_retain(v35);
  return a1;
}

uint64_t sub_2392C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_41628);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  if (a1 != a2)
  {
    v7 = a3[21];
    v8 = (uint64_t *)(a1 + v7);
    v9 = (uint64_t *)(a2 + v7);
    sub_1A198(a1 + v7, &qword_41600);
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_41600);
    if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
    {
      v11 = type metadata accessor for DynamicTypeSize(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v8, v9, v11);
      v12 = v8;
      v13 = v10;
      v14 = 1;
    }
    else
    {
      v15 = *v9;
      *v8 = *v9;
      swift_retain(v15);
      v12 = v8;
      v13 = v10;
      v14 = 0;
    }
    swift_storeEnumTagMultiPayload(v12, v13, v14);
  }
  v16 = a3[22];
  v17 = (_QWORD *)(a1 + v16);
  v18 = (_QWORD *)(a2 + v16);
  v19 = v18[1];
  v20 = v17[1];
  *v17 = *v18;
  v17[1] = v19;
  swift_retain(v19);
  swift_release(v20);
  v21 = a3[23];
  v22 = (_QWORD *)(a1 + v21);
  v23 = (_QWORD *)(a2 + v21);
  v24 = v23[1];
  v25 = v22[1];
  *v22 = *v23;
  v22[1] = v24;
  swift_retain(v24);
  swift_release(v25);
  v26 = a3[24];
  v27 = (_QWORD *)(a1 + v26);
  v28 = (_QWORD *)(a2 + v26);
  v29 = v28[1];
  v30 = v27[1];
  *v27 = *v28;
  v27[1] = v29;
  swift_retain(v29);
  swift_release(v30);
  v31 = a3[25];
  v32 = (_QWORD *)(a1 + v31);
  v33 = (_QWORD *)(a2 + v31);
  v34 = v33[1];
  v35 = v32[1];
  *v32 = *v33;
  v32[1] = v34;
  swift_retain(v34);
  swift_release(v35);
  v36 = a3[26];
  v37 = (_QWORD *)(a1 + v36);
  v38 = (_QWORD *)(a2 + v36);
  v39 = v38[1];
  v40 = v37[1];
  *v37 = *v38;
  v37[1] = v39;
  swift_retain(v39);
  swift_release(v40);
  return a1;
}

uint64_t sub_23AD0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_41628);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[21];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_41600);
  if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
  {
    v11 = type metadata accessor for DynamicTypeSize(0);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
    swift_storeEnumTagMultiPayload(v8, v10, 1);
  }
  else
  {
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  v12 = a3[23];
  *(_OWORD *)(a1 + a3[22]) = *(_OWORD *)(a2 + a3[22]);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  v13 = a3[25];
  *(_OWORD *)(a1 + a3[24]) = *(_OWORD *)(a2 + a3[24]);
  *(_OWORD *)(a1 + v13) = *(_OWORD *)(a2 + v13);
  *(_OWORD *)(a1 + a3[26]) = *(_OWORD *)(a2 + a3[26]);
  return a1;
}

uint64_t sub_23BD8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_41628);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  if (a1 != a2)
  {
    v7 = a3[21];
    v8 = (void *)(a1 + v7);
    v9 = (const void *)(a2 + v7);
    sub_1A198(a1 + v7, &qword_41600);
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_41600);
    if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
    {
      v11 = type metadata accessor for DynamicTypeSize(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload(v8, v10, 1);
    }
    else
    {
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
  }
  v12 = a3[22];
  v13 = *(_QWORD *)(a1 + v12 + 8);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  swift_release(v13);
  v14 = a3[23];
  v15 = *(_QWORD *)(a1 + v14 + 8);
  *(_OWORD *)(a1 + v14) = *(_OWORD *)(a2 + v14);
  swift_release(v15);
  v16 = a3[24];
  v17 = *(_QWORD *)(a1 + v16 + 8);
  *(_OWORD *)(a1 + v16) = *(_OWORD *)(a2 + v16);
  swift_release(v17);
  v18 = a3[25];
  v19 = *(_QWORD *)(a1 + v18 + 8);
  *(_OWORD *)(a1 + v18) = *(_OWORD *)(a2 + v18);
  swift_release(v19);
  v20 = a3[26];
  v21 = *(_QWORD *)(a1 + v20 + 8);
  *(_OWORD *)(a1 + v20) = *(_OWORD *)(a2 + v20);
  swift_release(v21);
  return a1;
}

uint64_t sub_23D3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_23D48);
}

uint64_t sub_23D48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_41628);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = __swift_instantiateConcreteTypeFromMangledName(qword_41630);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 84);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(_QWORD *)(a1 + *(int *)(a3 + 88));
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  return (v14 + 1);
}

uint64_t sub_23DF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_23E04);
}

uint64_t sub_23E04(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_41628);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = __swift_instantiateConcreteTypeFromMangledName(qword_41630);
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 84);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 88)) = (a2 - 1);
  return result;
}

void sub_23EB0(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_416B8)
  {
    v2 = sub_23F08();
    v3 = type metadata accessor for ScaledMetric(a1, &type metadata for CGFloat, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_416B8);
  }
}

unint64_t sub_23F08()
{
  unint64_t result;

  result = qword_416C0;
  if (!qword_416C0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store(result, (unint64_t *)&qword_416C0);
  }
  return result;
}

void sub_23F4C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_416C8)
  {
    v2 = type metadata accessor for DynamicTypeSize(255);
    v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_416C8);
  }
}

uint64_t sub_23FA0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t TupleTypeMetadata2;
  uint64_t v10;
  uint64_t TupleTypeMetadata;
  uint64_t v12;
  uint64_t WitnessTable;
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
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;

  v1 = a1[1];
  v3 = a1[2];
  v2 = a1[3];
  v40 = type metadata accessor for ModifiedContent(255, *a1, &type metadata for _FrameLayout);
  v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41608);
  v5 = type metadata accessor for ModifiedContent(255, v1, v4);
  v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41610);
  type metadata accessor for ModifiedContent(255, v5, v6);
  v7 = type metadata accessor for ModifiedContent(255, v3, v4);
  type metadata accessor for ModifiedContent(255, v7, v6);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41618);
  v8 = type metadata accessor for ModifiedContent(255, v2, v4);
  type metadata accessor for ModifiedContent(255, v8, v6);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2(255);
  v10 = type metadata accessor for TupleView(255, TupleTypeMetadata2);
  type metadata accessor for Optional(255, v10);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41620);
  TupleTypeMetadata = swift_getTupleTypeMetadata(255, 5);
  v12 = type metadata accessor for TupleView(255, TupleTypeMetadata);
  WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v12);
  v14 = type metadata accessor for VStack(255, v12, WitnessTable);
  type metadata accessor for ModifiedContent(255, v40, &type metadata for _PaddingLayout);
  v15 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41608);
  v16 = type metadata accessor for ModifiedContent(255, v1, v15);
  v17 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41610);
  type metadata accessor for ModifiedContent(255, v16, v17);
  v18 = type metadata accessor for ModifiedContent(255, v3, v15);
  type metadata accessor for ModifiedContent(255, v18, v17);
  v19 = swift_getTupleTypeMetadata2(255);
  v20 = type metadata accessor for TupleView(255, v19);
  v21 = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v20);
  type metadata accessor for VStack(255, v20, v21);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41618);
  v22 = type metadata accessor for ModifiedContent(255, v2, v15);
  type metadata accessor for ModifiedContent(255, v22, v17);
  v23 = swift_getTupleTypeMetadata2(255);
  v24 = type metadata accessor for TupleView(255, v23);
  type metadata accessor for Optional(255, v24);
  v25 = swift_getTupleTypeMetadata2(255);
  v26 = type metadata accessor for TupleView(255, v25);
  v27 = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v26);
  v28 = type metadata accessor for HStack(255, v26, v27);
  v29 = swift_getWitnessTable(&protocol conformance descriptor for HStack<A>, v28);
  type metadata accessor for HStack(255, v28, v29);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41620);
  v30 = swift_getTupleTypeMetadata2(255);
  v31 = type metadata accessor for TupleView(255, v30);
  v32 = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v31);
  type metadata accessor for VStack(255, v31, v32);
  v33 = swift_getTupleTypeMetadata2(255);
  v34 = type metadata accessor for TupleView(255, v33);
  v35 = swift_getWitnessTable(&protocol conformance descriptor for TupleView<A>, v34);
  v36 = type metadata accessor for HStack(255, v34, v35);
  v37 = type metadata accessor for _ConditionalContent(255, v14, v36);
  v38 = type metadata accessor for ModifiedContent(255, v37, &type metadata for _FlexFrameLayout);
  swift_getWitnessTable(&protocol conformance descriptor for VStack<A>, v14);
  swift_getWitnessTable(&protocol conformance descriptor for HStack<A>, v36);
  swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v37);
  return swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v38);
}

uint64_t sub_243E4()
{
  return sub_246F8((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_22910);
}

unint64_t sub_243F0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_416E0;
  if (!qword_416E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41620);
    v2[0] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_416E8);
    v2[1] = type metadata accessor for BorderedButtonStyle(255);
    v2[2] = sub_244C0();
    v2[3] = sub_19D7C(&qword_41700, (uint64_t (*)(uint64_t))&type metadata accessor for BorderedButtonStyle, (uint64_t)&protocol conformance descriptor for BorderedButtonStyle);
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.buttonStyle<A>(_:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_416E0);
  }
  return result;
}

unint64_t sub_244C0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_416F0;
  if (!qword_416F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_416E8);
    v2[0] = type metadata accessor for DynamicControlsStack(255);
    v2[1] = type metadata accessor for TitleOnlyLabelStyle(255);
    v2[2] = sub_19D7C(&qword_416F8, (uint64_t (*)(uint64_t))&type metadata accessor for DynamicControlsStack, (uint64_t)&protocol conformance descriptor for DynamicControlsStack);
    v2[3] = sub_19D7C(&qword_41408, (uint64_t (*)(uint64_t))&type metadata accessor for TitleOnlyLabelStyle, (uint64_t)&protocol conformance descriptor for TitleOnlyLabelStyle);
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.labelStyle<A>(_:)>>, 1);
    sub_1A114(&qword_41420, &qword_41428, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_416F0);
  }
  return result;
}

uint64_t sub_245C8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_245F0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_24618(unsigned __int8 *a1)
{
  return EnvironmentValues.multilineTextAlignment.setter(*a1);
}

uint64_t sub_2463C(unsigned __int8 *a1)
{
  return EnvironmentValues.multilineTextAlignment.setter(*a1);
}

unint64_t sub_24660()
{
  unint64_t result;
  uint64_t v1;

  result = qword_41718;
  if (!qword_41718)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41618);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_41718);
  }
  return result;
}

uint64_t sub_246BC()
{
  return sub_246F8((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_20488);
}

uint64_t sub_246C8()
{
  return sub_246F8((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_20BC0);
}

uint64_t sub_246D4()
{
  return sub_246F8((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_21040);
}

uint64_t sub_246E0()
{
  return sub_246F8((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_212F0);
}

uint64_t sub_246EC()
{
  return sub_246F8((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_2178C);
}

uint64_t sub_246F8(uint64_t (*a1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v1;

  return a1(v1[10], v1[2], v1[3], v1[4], v1[5], v1[6], v1[7], v1[8], v1[9]);
}

uint64_t sub_24730(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  _QWORD *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  int64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;

  v3 = type metadata accessor for Handle(0);
  v42 = *(_QWORD *)(v3 - 8);
  v43 = v3;
  v4 = __chkstk_darwin(v3);
  v41 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v40 = (char *)&v34 - v6;
  v7 = *(_QWORD *)(a1 + 16);
  v8 = _swiftEmptyArrayStorage;
  if (!v7)
    return (uint64_t)v8;
  v34 = v1;
  v44 = _swiftEmptyArrayStorage;
  sub_16E84(0, v7, 0);
  result = sub_27D90(a1);
  v11 = result;
  v12 = 0;
  v13 = a1 + 64;
  v35 = a1 + 80;
  v36 = v7;
  v38 = a1 + 64;
  v39 = a1;
  v37 = v10;
  while ((v11 & 0x8000000000000000) == 0 && v11 < 1 << *(_BYTE *)(a1 + 32))
  {
    v16 = (unint64_t)v11 >> 6;
    if ((*(_QWORD *)(v13 + 8 * ((unint64_t)v11 >> 6)) & (1 << v11)) == 0)
      goto LABEL_25;
    if (*(_DWORD *)(a1 + 36) != (_DWORD)v10)
      goto LABEL_26;
    v17 = *(_QWORD *)(a1 + 48);
    v19 = v42;
    v18 = v43;
    v20 = v40;
    (*(void (**)(char *, uint64_t, uint64_t))(v42 + 16))(v40, v17 + *(_QWORD *)(v42 + 72) * v11, v43);
    v21 = v41;
    v22 = (*(uint64_t (**)(char *, char *, uint64_t))(v19 + 32))(v41, v20, v18);
    v23 = Handle.rawValue.getter(v22);
    v25 = v24;
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
    v8 = v44;
    result = swift_isUniquelyReferenced_nonNull_native(v44);
    if ((result & 1) == 0)
    {
      result = sub_16E84(0, v8[2] + 1, 1);
      v8 = v44;
    }
    v27 = v8[2];
    v26 = v8[3];
    if (v27 >= v26 >> 1)
    {
      result = sub_16E84(v26 > 1, v27 + 1, 1);
      v8 = v44;
    }
    v8[2] = v27 + 1;
    v28 = &v8[2 * v27];
    v28[4] = v23;
    v28[5] = v25;
    a1 = v39;
    v14 = 1 << *(_BYTE *)(v39 + 32);
    if (v11 >= v14)
      goto LABEL_27;
    v13 = v38;
    v29 = *(_QWORD *)(v38 + 8 * v16);
    if ((v29 & (1 << v11)) == 0)
      goto LABEL_28;
    LODWORD(v10) = v37;
    if (*(_DWORD *)(v39 + 36) != (_DWORD)v37)
      goto LABEL_29;
    v30 = v29 & (-2 << (v11 & 0x3F));
    if (v30)
    {
      v14 = __clz(__rbit64(v30)) | v11 & 0xFFFFFFFFFFFFFFC0;
      v15 = v36;
    }
    else
    {
      v31 = v16 + 1;
      v32 = (unint64_t)(v14 + 63) >> 6;
      v15 = v36;
      if (v16 + 1 < v32)
      {
        v33 = *(_QWORD *)(v38 + 8 * v31);
        if (v33)
        {
LABEL_22:
          v14 = __clz(__rbit64(v33)) + (v31 << 6);
        }
        else
        {
          while (v32 - 2 != v16)
          {
            v33 = *(_QWORD *)(v35 + 8 * v16++);
            if (v33)
            {
              v31 = v16 + 1;
              goto LABEL_22;
            }
          }
        }
      }
    }
    ++v12;
    v11 = v14;
    if (v12 == v15)
      return (uint64_t)v8;
  }
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

BOOL static ShareItemError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ShareItemContactPickerView.init(dependencies:isCapabilityEnabled:isAirTag:maxCircleMembersSharingLimits:performAction:showOfferSuccess:)@<X0>(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, uint64_t a10)
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  __int128 v18;
  char v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t MyLocalizationTable;
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
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t result;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  _QWORD *v48;
  _OWORD v49[2];
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t (*v54)@<X0>(uint64_t (*)(void *, uint64_t)@<X0>, uint64_t@<X1>, uint64_t@<X8>);
  uint64_t v55;
  uint64_t v56;

  v42 = a8;
  v43 = a5;
  v47 = a2;
  v48 = a9;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_41720);
  __chkstk_darwin(v15);
  v17 = (char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *a1;
  v45 = a1[1];
  v46 = v18;
  v44 = *((_QWORD *)a1 + 4);
  if (qword_40BE8 != -1)
    swift_once(&qword_40BE8, sub_32458);
  v19 = a4 & 1;
  if ((a4 & 1) != 0)
    v20 = 0x8000000000038840;
  else
    v20 = 0x8000000000038820;
  if ((a4 & 1) != 0)
    v21 = 0xD000000000000021;
  else
    v21 = 0xD00000000000001FLL;
  MyLocalizationTable = type metadata accessor for FindMyLocalizationTable(0);
  v23 = __swift_project_value_buffer(MyLocalizationTable, (uint64_t)qword_41B90);
  v24 = *(_QWORD *)(MyLocalizationTable - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v17, v23, MyLocalizationTable);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v17, 0, 1, MyLocalizationTable);
  v25 = String.fmLocalized(replacements:table:)(0, v17, v21, v20);
  v27 = v26;
  swift_bridgeObjectRelease(v20);
  sub_25F18((uint64_t)v17);
  v28 = swift_allocObject(&unk_3DD70, 64, 7);
  *(_QWORD *)(v28 + 16) = a6;
  *(_QWORD *)(v28 + 24) = a7;
  v29 = a7;
  *(_QWORD *)(v28 + 32) = v42;
  *(_QWORD *)(v28 + 40) = a10;
  *(_BYTE *)(v28 + 48) = v19;
  *(_QWORD *)(v28 + 56) = v43;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_40CB0);
  v31 = swift_allocObject(v30, 80, 7);
  *(_OWORD *)(v31 + 16) = xmmword_33790;
  *(_QWORD *)(v31 + 32) = &unk_41028;
  *(_QWORD *)(v31 + 40) = 0;
  v32 = swift_allocObject(&unk_3DD98, 40, 7);
  *(_BYTE *)(v32 + 16) = 1;
  *(_QWORD *)(v32 + 24) = sub_25998;
  *(_QWORD *)(v32 + 32) = 0;
  *(_QWORD *)(v31 + 48) = &unk_40C98;
  *(_QWORD *)(v31 + 56) = v32;
  v33 = swift_allocObject(&unk_3DDC0, 17, 7);
  *(_BYTE *)(v33 + 16) = v19;
  v34 = swift_allocObject(&unk_3DDE8, 17, 7);
  *(_BYTE *)(v34 + 16) = v19;
  v35 = (_QWORD *)swift_allocObject(&unk_3DE10, 64, 7);
  v35[2] = v47;
  v35[3] = a3;
  v35[4] = sub_25FA4;
  v35[5] = v33;
  v35[6] = sub_25FBC;
  v35[7] = v34;
  *(_QWORD *)(v31 + 64) = &unk_40CA8;
  *(_QWORD *)(v31 + 72) = v35;
  v51 = v25;
  v52 = v27;
  v53 = 0;
  v54 = sub_25F5C;
  v55 = v28;
  v56 = v31;
  v49[0] = v46;
  v49[1] = v45;
  v50 = v44;
  v36 = type metadata accessor for ContactPickerViewModel(0);
  swift_allocObject(v36, *(unsigned int *)(v36 + 48), *(unsigned __int16 *)(v36 + 52));
  swift_retain(v29);
  swift_retain(a10);
  swift_retain(a3);
  v37 = ContactPickerViewModel.init(configuration:dependencies:)(&v51, (uint64_t)v49);
  *(_QWORD *)&v49[0] = v37;
  swift_retain(v37);
  State.init(wrappedValue:)(&v51, v49, v36);
  swift_release(v37);
  swift_release(a3);
  swift_release(v29);
  result = swift_release(a10);
  v39 = v52;
  v40 = v48;
  *v48 = v51;
  v40[1] = v39;
  return result;
}

uint64_t sub_24D70@<X0>(uint64_t (*a1)(void *, uint64_t)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t MyLocalizationTable;
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
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(void *, uint64_t);

  v34 = a8;
  v35 = a2;
  v36 = a1;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_41720);
  __chkstk_darwin(v15);
  v17 = (char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_41740) + 48);
  if (qword_40BE8 != -1)
    swift_once(&qword_40BE8, sub_32458);
  v19 = (uint64_t *)(a9 + v18);
  MyLocalizationTable = type metadata accessor for FindMyLocalizationTable(0);
  v21 = __swift_project_value_buffer(MyLocalizationTable, (uint64_t)qword_41B90);
  v22 = *(_QWORD *)(MyLocalizationTable - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v17, v21, MyLocalizationTable);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v17, 0, 1, MyLocalizationTable);
  v23 = String.fmLocalized(replacements:table:)(0, v17, 0xD000000000000026, 0x8000000000038A20);
  v25 = v24;
  sub_25F18((uint64_t)v17);
  GenericControl.Info.Label.init(title:symbol:forceStyleProminent:forceInProgressState:forceDisabledState:)(v23, v25, 0, 0, 0, 0, 0);
  v26 = swift_allocObject(&unk_3DF48, 64, 7);
  *(_QWORD *)(v26 + 16) = a3;
  *(_QWORD *)(v26 + 24) = a4;
  *(_QWORD *)(v26 + 32) = a5;
  *(_QWORD *)(v26 + 40) = a6;
  *(_BYTE *)(v26 + 48) = a7 & 1;
  *(_QWORD *)(v26 + 56) = v34;
  swift_retain(a4);
  swift_retain(a6);
  v27 = v36(&unk_41750, v26);
  v29 = v28;
  swift_release(v26);
  *v19 = v27;
  v19[1] = v29;
  v30 = enum case for GenericControl.Info.button(_:);
  v31 = type metadata accessor for GenericControl.Info(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 104))(a9, v30, v31);
}

uint64_t sub_24F78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  *(_QWORD *)(v8 + 72) = a6;
  *(_QWORD *)(v8 + 80) = a8;
  *(_BYTE *)(v8 + 169) = a7;
  *(_QWORD *)(v8 + 56) = a4;
  *(_QWORD *)(v8 + 64) = a5;
  *(_QWORD *)(v8 + 40) = a2;
  *(_QWORD *)(v8 + 48) = a3;
  *(_QWORD *)(v8 + 32) = a1;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_40EA8);
  *(_QWORD *)(v8 + 88) = v9;
  v10 = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 96) = v10;
  *(_QWORD *)(v8 + 104) = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_41720);
  *(_QWORD *)(v8 + 112) = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v11 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v8 + 120) = static MainActor.shared.getter(v12);
  v13 = dispatch thunk of Actor.unownedExecutor.getter(v12, &protocol witness table for MainActor);
  *(_QWORD *)(v8 + 128) = v13;
  *(_QWORD *)(v8 + 136) = v14;
  return swift_task_switch(sub_25044, v13, v14);
}

uint64_t sub_25044()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v1 = v0[5];
  v2 = (int *)v0[6];
  v3 = swift_bridgeObjectRetain(v1);
  v4 = sub_24730(v3);
  v0[18] = v4;
  swift_bridgeObjectRelease(v1);
  v7 = (uint64_t (*)(uint64_t))((char *)v2 + *v2);
  v5 = (_QWORD *)swift_task_alloc(v2[1]);
  v0[19] = v5;
  *v5 = v0;
  v5[1] = sub_250D8;
  return v7(v4);
}

uint64_t sub_250D8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v2 = *(_QWORD **)v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 152);
  *(_QWORD *)(*(_QWORD *)v1 + 160) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    swift_bridgeObjectRelease(v2[18]);
    v4 = v2[16];
    v5 = v2[17];
    v6 = sub_251D0;
  }
  else
  {
    v4 = v2[16];
    v5 = v2[17];
    v6 = sub_25144;
  }
  return swift_task_switch(v6, v4, v5);
}

uint64_t sub_25144()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 144);
  v2 = *(void (**)(uint64_t))(v0 + 64);
  v3 = *(_QWORD *)(v0 + 32);
  swift_release(*(_QWORD *)(v0 + 120));
  v2(v1);
  swift_bridgeObjectRelease(v1);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_40EA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v5 = *(_QWORD *)(v0 + 104);
  swift_task_dealloc(*(_QWORD *)(v0 + 112));
  swift_task_dealloc(v5);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_251D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t MyLocalizationTable;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  void (*v9)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v10;
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
  uint64_t v22;

  v1 = *(_QWORD *)(v0 + 160);
  swift_release(*(_QWORD *)(v0 + 120));
  *(_QWORD *)(v0 + 24) = v1;
  swift_errorRetain(v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_40F98);
  if ((swift_dynamicCast(v0 + 168, v0 + 24, v2, &type metadata for ShareItemError, 0) & 1) != 0)
    __asm { BR              X10 }
  swift_errorRelease(*(_QWORD *)(v0 + 24));
  if (qword_40BE8 != -1)
    swift_once(&qword_40BE8, sub_32458);
  v22 = *(_QWORD *)(v0 + 160);
  v3 = *(_QWORD *)(v0 + 112);
  v4 = *(_QWORD *)(v0 + 32);
  MyLocalizationTable = type metadata accessor for FindMyLocalizationTable(0);
  v6 = __swift_project_value_buffer(MyLocalizationTable, (uint64_t)qword_41B90);
  v7 = *(_QWORD *)(MyLocalizationTable - 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  v8(v3, v6, MyLocalizationTable);
  v9 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v7 + 56);
  v9(v3, 0, 1, MyLocalizationTable);
  v10 = String.fmLocalized(replacements:table:)(0, v3, 0xD00000000000002CLL, 0x8000000000038A50);
  v12 = v11;
  sub_25F18(v3);
  v8(v3, v6, MyLocalizationTable);
  v9(v3, 0, 1, MyLocalizationTable);
  v13 = String.fmLocalized(replacements:table:)(0, v3, 0xD00000000000002ALL, 0x8000000000038A80);
  v15 = v14;
  sub_25F18(v3);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_410B0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_410B8);
  v18 = swift_allocObject(v16, ((*(unsigned __int8 *)(*(_QWORD *)(v17 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v17 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v17 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v17 - 8) + 80) | 7);
  *(_OWORD *)(v18 + 16) = xmmword_33770;
  static AlertInfo.ActionInfo<A>.okAction.getter();
  AlertInfo.init(title:message:actions:)(v10, v12, v13, v15, v18, (char *)&type metadata for () + 8);
  swift_errorRelease(v22);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_40EA0);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v4, 0, 1, v19);
  v20 = *(_QWORD *)(v0 + 104);
  swift_task_dealloc(*(_QWORD *)(v0 + 112));
  swift_task_dealloc(v20);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_25998()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t MyLocalizationTable;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(char *, uint64_t, uint64_t);
  void (*v7)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v10;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_41720);
  __chkstk_darwin(v0);
  v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_40BE8 != -1)
    swift_once(&qword_40BE8, sub_32458);
  MyLocalizationTable = type metadata accessor for FindMyLocalizationTable(0);
  v4 = __swift_project_value_buffer(MyLocalizationTable, (uint64_t)qword_41B90);
  v5 = *(_QWORD *)(MyLocalizationTable - 8);
  v6 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v6(v2, v4, MyLocalizationTable);
  v7 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56);
  v7(v2, 0, 1, MyLocalizationTable);
  v8 = String.fmLocalized(replacements:table:)(0, v2, 0xD000000000000029, 0x8000000000038960);
  sub_25F18((uint64_t)v2);
  v6(v2, v4, MyLocalizationTable);
  v7(v2, 0, 1, MyLocalizationTable);
  String.fmLocalized(replacements:table:)(0, v2, 0xD00000000000002DLL, 0x8000000000038990);
  sub_25F18((uint64_t)v2);
  return v8;
}

uint64_t sub_25B18(uint64_t a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  BOOL v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t MyLocalizationTable;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t, uint64_t);
  void (*v13)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v16;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_41720);
  __chkstk_darwin(v3);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_40BE8 != -1)
    swift_once(&qword_40BE8, sub_32458);
  v6 = (a2 & 1) == 0;
  if ((a2 & 1) != 0)
    v7 = 0x80000000000388F0;
  else
    v7 = 0x8000000000038870;
  if (v6)
    v8 = 0xD000000000000035;
  else
    v8 = 0xD000000000000037;
  MyLocalizationTable = type metadata accessor for FindMyLocalizationTable(0);
  v10 = __swift_project_value_buffer(MyLocalizationTable, (uint64_t)qword_41B90);
  v11 = *(_QWORD *)(MyLocalizationTable - 8);
  v12 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v12(v5, v10, MyLocalizationTable);
  v13 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56);
  v13(v5, 0, 1, MyLocalizationTable);
  String.fmLocalized(replacements:table:)(0, v5, 0xD00000000000002ELL, 0x8000000000038930);
  sub_25F18((uint64_t)v5);
  v12(v5, v10, MyLocalizationTable);
  v13(v5, 0, 1, MyLocalizationTable);
  v14 = String.fmLocalized(replacements:table:)(0, v5, v8, v7);
  swift_bridgeObjectRelease(v7);
  sub_25F18((uint64_t)v5);
  return v14;
}

uint64_t sub_25CD4(char a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  BOOL v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t MyLocalizationTable;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  void (*v12)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v15;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_41720);
  __chkstk_darwin(v2);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_40BE8 != -1)
    swift_once(&qword_40BE8, sub_32458);
  v5 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v6 = 0x80000000000388F0;
  else
    v6 = 0x8000000000038870;
  if (v5)
    v7 = 0xD000000000000035;
  else
    v7 = 0xD000000000000037;
  MyLocalizationTable = type metadata accessor for FindMyLocalizationTable(0);
  v9 = __swift_project_value_buffer(MyLocalizationTable, (uint64_t)qword_41B90);
  v10 = *(_QWORD *)(MyLocalizationTable - 8);
  v11 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v11(v4, v9, MyLocalizationTable);
  v12 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56);
  v12(v4, 0, 1, MyLocalizationTable);
  String.fmLocalized(replacements:table:)(0, v4, 0xD000000000000036, 0x80000000000388B0);
  sub_25F18((uint64_t)v4);
  v11(v4, v9, MyLocalizationTable);
  v12(v4, 0, 1, MyLocalizationTable);
  v13 = String.fmLocalized(replacements:table:)(0, v4, v7, v6);
  swift_bridgeObjectRelease(v6);
  sub_25F18((uint64_t)v4);
  return v13;
}

uint64_t ShareItemContactPickerView.body.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_41728);
  State.wrappedValue.getter(&v7, v2);
  v3 = v7;
  v4 = (_QWORD *)((char *)a1 + *(int *)(type metadata accessor for ContactPickerView(0) + 20));
  *v4 = swift_getKeyPath(&unk_34150);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_41258);
  result = swift_storeEnumTagMultiPayload(v4, v5, 0);
  *a1 = v3;
  return result;
}

uint64_t sub_25F18(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_41720);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_25F5C@<X0>(uint64_t (*a1)(void *, uint64_t)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_24D70(a1, a2, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40), *(_BYTE *)(v3 + 48), *(_QWORD *)(v3 + 56), a3);
}

uint64_t sub_25F70()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_25F94()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_25FA4(uint64_t a1)
{
  uint64_t v1;

  return sub_25B18(a1, *(_BYTE *)(v1 + 16));
}

uint64_t sub_25FAC()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_25FBC()
{
  uint64_t v0;

  return sub_25CD4(*(_BYTE *)(v0 + 16));
}

uint64_t sub_25FC4()
{
  _QWORD *v0;

  swift_release(v0[3]);
  swift_release(v0[5]);
  swift_release(v0[7]);
  return swift_deallocObject(v0, 64, 7);
}

unint64_t sub_26000()
{
  unint64_t result;

  result = qword_41730;
  if (!qword_41730)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for ShareItemError, &type metadata for ShareItemError);
    atomic_store(result, (unint64_t *)&qword_41730);
  }
  return result;
}

uint64_t sub_26044(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &opaque type descriptor for <<opaque return type of ShareItemContactPickerView.body>>, 1);
}

uint64_t getEnumTagSinglePayload for ShareItemError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ShareItemError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_26130 + 4 * byte_34145[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_26164 + 4 * byte_34140[v4]))();
}

uint64_t sub_26164(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2616C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x26174);
  return result;
}

uint64_t sub_26180(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x26188);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_2618C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_26194(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_261A0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ShareItemError()
{
  return &type metadata for ShareItemError;
}

uint64_t destroy for ShareItemContactPickerView(_QWORD *a1)
{
  swift_release(*a1);
  return swift_release(a1[1]);
}

uint64_t *_s13FindMyAppCore26ShareItemContactPickerViewVwCP_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain(v3);
  swift_retain(v4);
  return a1;
}

uint64_t *assignWithCopy for ShareItemContactPickerView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *a2;
  v5 = *a1;
  *a1 = *a2;
  swift_retain(v4);
  swift_release(v5);
  v6 = a1[1];
  v7 = a2[1];
  a1[1] = v7;
  swift_retain(v7);
  swift_release(v6);
  return a1;
}

_QWORD *assignWithTake for ShareItemContactPickerView(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;

  swift_release(*a1);
  v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  swift_release(v4);
  return a1;
}

ValueMetadata *type metadata accessor for ShareItemContactPickerView()
{
  return &type metadata for ShareItemContactPickerView;
}

unint64_t sub_262C4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_41738;
  if (!qword_41738)
  {
    v1 = type metadata accessor for ContactPickerView(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for ContactPickerView, v1);
    atomic_store(result, (unint64_t *)&qword_41738);
  }
  return result;
}

uint64_t sub_2630C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t MyLocalizationTable;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(char *, uint64_t, uint64_t);
  void (*v7)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v10;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_41720);
  __chkstk_darwin(v0);
  v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_40BE8 != -1)
    swift_once(&qword_40BE8, sub_32458);
  MyLocalizationTable = type metadata accessor for FindMyLocalizationTable(0);
  v4 = __swift_project_value_buffer(MyLocalizationTable, (uint64_t)qword_41B90);
  v5 = *(_QWORD *)(MyLocalizationTable - 8);
  v6 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v6(v2, v4, MyLocalizationTable);
  v7 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56);
  v7(v2, 0, 1, MyLocalizationTable);
  v8 = String.fmLocalized(replacements:table:)(0, v2, 0xD000000000000027, 0x80000000000389C0);
  sub_25F18((uint64_t)v2);
  v6(v2, v4, MyLocalizationTable);
  v7(v2, 0, 1, MyLocalizationTable);
  String.fmLocalized(replacements:table:)(0, v2, 0xD000000000000025, 0x80000000000389F0);
  sub_25F18((uint64_t)v2);
  return v8;
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 64, 7);
}

uint64_t sub_264BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  _QWORD *v12;

  v6 = *(_QWORD *)(v2 + 16);
  v7 = *(_QWORD *)(v2 + 24);
  v8 = *(_QWORD *)(v2 + 32);
  v9 = *(_QWORD *)(v2 + 40);
  v10 = *(_BYTE *)(v2 + 48);
  v11 = *(_QWORD *)(v2 + 56);
  v12 = (_QWORD *)swift_task_alloc(dword_4174C);
  *(_QWORD *)(v3 + 16) = v12;
  *v12 = v3;
  v12[1] = sub_1A22C;
  return sub_24F78(a1, a2, v6, v7, v8, v9, v10, v11);
}

uint64_t OfferLocationContactPickerView.init(dependencies:fromEmail:performAction:showOfferSuccess:)@<X0>(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, _QWORD *a8@<X8>)
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  __int128 v18;
  uint64_t v19;
  uint64_t MyLocalizationTable;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t result;
  uint64_t v33;
  _QWORD *v34;
  __int128 v35;
  __int128 v36;
  _QWORD *v37;
  _OWORD v38[2];
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  _QWORD *v44;
  uint64_t v45;

  v37 = a8;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_41720);
  __chkstk_darwin(v15);
  v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *a1;
  v35 = a1[1];
  v36 = v18;
  v19 = *((_QWORD *)a1 + 4);
  if (qword_40BC0 != -1)
    swift_once(&qword_40BC0, sub_27A8);
  MyLocalizationTable = type metadata accessor for FindMyLocalizationTable(0);
  v21 = __swift_project_value_buffer(MyLocalizationTable, (uint64_t)qword_40BC8);
  v22 = *(_QWORD *)(MyLocalizationTable - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v17, v21, MyLocalizationTable);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v17, 0, 1, MyLocalizationTable);
  v23 = String.fmLocalized(replacements:table:)(0, v17, 0xD000000000000025, 0x8000000000038CF0);
  v25 = v24;
  sub_1A198((uint64_t)v17, &qword_41720);
  v26 = (_QWORD *)swift_allocObject(&unk_3E010, 64, 7);
  v26[2] = a2;
  v26[3] = a3;
  v26[4] = a4;
  v26[5] = a5;
  v26[6] = a6;
  v26[7] = a7;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_40CB0);
  v28 = swift_allocObject(v27, 64, 7);
  *(_OWORD *)(v28 + 16) = xmmword_33780;
  *(_QWORD *)(v28 + 32) = &unk_40FE8;
  *(_QWORD *)(v28 + 40) = 0;
  v29 = swift_allocObject(&unk_3E038, 40, 7);
  *(_BYTE *)(v29 + 16) = 0;
  *(_QWORD *)(v29 + 24) = sub_279B8;
  *(_QWORD *)(v29 + 32) = 0;
  *(_QWORD *)(v28 + 48) = &unk_40C98;
  *(_QWORD *)(v28 + 56) = v29;
  v40 = v23;
  v41 = v25;
  v42 = 1;
  v43 = sub_268A4;
  v44 = v26;
  v45 = v28;
  v38[0] = v36;
  v38[1] = v35;
  v39 = v19;
  v30 = type metadata accessor for ContactPickerViewModel(0);
  swift_allocObject(v30, *(unsigned int *)(v30 + 48), *(unsigned __int16 *)(v30 + 52));
  swift_retain(a5);
  swift_retain(a7);
  v31 = ContactPickerViewModel.init(configuration:dependencies:)(&v40, (uint64_t)v38);
  *(_QWORD *)&v38[0] = v31;
  swift_retain(v31);
  State.init(wrappedValue:)(&v40, v38, v30);
  swift_release(v31);
  swift_release(a5);
  result = swift_release(a7);
  v33 = v41;
  v34 = v37;
  *v37 = v40;
  v34[1] = v33;
  return result;
}

uint64_t sub_267D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v16;

  v16 = (_QWORD *)swift_allocObject(&unk_3E170, 64, 7);
  v16[2] = a1;
  v16[3] = a2;
  v16[4] = a5;
  v16[5] = a6;
  v16[6] = a7;
  v16[7] = a8;
  swift_retain(a2);
  swift_retain(a6);
  swift_retain(a8);
  static GenericControl.Info.offerLocationMenu(compactTitleOnly:fromEmailDescription:forceInProgressState:forceDisabledState:action:)(1, a3, a4, 0, 0, &unk_41768, v16);
  return swift_release(v16);
}

uint64_t sub_26898()
{
  return objectdestroyTm_0((void (*)(_QWORD))&_swift_bridgeObjectRelease);
}

uint64_t sub_268A4(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  return sub_267D4(a1, a2, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7]);
}

uint64_t sub_268B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v7[7] = a6;
  v7[8] = a7;
  v7[5] = a4;
  v7[6] = a5;
  v7[3] = a2;
  v7[4] = a3;
  v7[2] = a1;
  v8 = type metadata accessor for OfferLocationDuration(0);
  v7[9] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v7[10] = v9;
  v10 = *(_QWORD *)(v9 + 64);
  v7[11] = v10;
  v7[12] = swift_task_alloc((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for MainActor(0);
  v7[13] = static MainActor.shared.getter(v11);
  v12 = dispatch thunk of Actor.unownedExecutor.getter(v11, &protocol witness table for MainActor);
  v7[14] = v12;
  v7[15] = v13;
  return swift_task_switch(sub_26958, v12, v13);
}

uint64_t sub_26958()
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
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  int *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v18;
  uint64_t (*v19)(void *, uint64_t);
  uint64_t (*v20)(void);

  v2 = v0[11];
  v1 = v0[12];
  v3 = v0[9];
  v4 = v0[10];
  v5 = v0[8];
  v7 = v0[5];
  v6 = v0[6];
  v18 = v0[7];
  v19 = (uint64_t (*)(void *, uint64_t))v0[3];
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 16))(v1, v0[2], v3);
  v8 = *(unsigned __int8 *)(v4 + 80);
  v9 = (v8 + 32) & ~v8;
  v10 = (v2 + v9 + 7) & 0xFFFFFFFFFFFFFFF8;
  v11 = swift_allocObject(&unk_3E198, v10 + 16, v8 | 7);
  *(_QWORD *)(v11 + 16) = v7;
  *(_QWORD *)(v11 + 24) = v6;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v11 + v9, v1, v3);
  v12 = (_QWORD *)(v11 + v10);
  *v12 = v18;
  v12[1] = v5;
  swift_retain(v6);
  swift_retain(v5);
  v13 = (int *)v19(&unk_41778, v11);
  v15 = v14;
  swift_release(v11);
  v0[16] = v15;
  v20 = (uint64_t (*)(void))((char *)v13 + *v13);
  v16 = (_QWORD *)swift_task_alloc(v13[1]);
  v0[17] = v16;
  *v16 = v0;
  v16[1] = sub_26A88;
  return v20();
}

uint64_t sub_26A88()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 128);
  swift_task_dealloc(*(_QWORD *)(*v0 + 136));
  swift_release(v2);
  return swift_task_switch(sub_26ADC, *(_QWORD *)(v1 + 112), *(_QWORD *)(v1 + 120));
}

uint64_t sub_26ADC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 96);
  swift_release(*(_QWORD *)(v0 + 104));
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_26B14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v7[10] = a6;
  v7[11] = a7;
  v7[8] = a4;
  v7[9] = a5;
  v7[6] = a2;
  v7[7] = a3;
  v7[5] = a1;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_40F60);
  v7[12] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v8 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Handle.Kind(0);
  v7[13] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v7[14] = v10;
  v7[15] = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_41780);
  v7[16] = v11;
  v7[17] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v11 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Handle(0);
  v7[18] = v12;
  v13 = *(_QWORD *)(v12 - 8);
  v7[19] = v13;
  v7[20] = swift_task_alloc((*(_QWORD *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_41788) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v7[21] = swift_task_alloc(v14);
  v7[22] = swift_task_alloc(v14);
  v7[23] = swift_task_alloc(v14);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_41720);
  v7[24] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v15 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_40EA8);
  v7[25] = v16;
  v17 = *(_QWORD *)(v16 - 8);
  v7[26] = v17;
  v18 = (*(_QWORD *)(v17 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v7[27] = swift_task_alloc(v18);
  v7[28] = swift_task_alloc(v18);
  v19 = type metadata accessor for MainActor(0);
  v7[29] = static MainActor.shared.getter(v19);
  v20 = dispatch thunk of Actor.unownedExecutor.getter(v19, &protocol witness table for MainActor);
  v7[30] = v20;
  v7[31] = v21;
  return swift_task_switch(sub_26CC8, v20, v21);
}

uint64_t sub_26CC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  uint64_t MyLocalizationTable;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  void (*v9)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  int *v22;
  uint64_t v23;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = swift_bridgeObjectRetain(v1);
  v23 = sub_24730(v2);
  *(_QWORD *)(v0 + 256) = v23;
  swift_bridgeObjectRelease(v1);
  if (qword_40BC0 != -1)
    swift_once(&qword_40BC0, sub_27A8);
  v3 = *(_QWORD *)(v0 + 192);
  v4 = *(int **)(v0 + 56);
  MyLocalizationTable = type metadata accessor for FindMyLocalizationTable(0);
  *(_QWORD *)(v0 + 264) = MyLocalizationTable;
  v6 = __swift_project_value_buffer(MyLocalizationTable, (uint64_t)qword_40BC8);
  *(_QWORD *)(v0 + 272) = v6;
  v7 = *(_QWORD *)(MyLocalizationTable - 8);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  *(_QWORD *)(v0 + 280) = v8;
  v8(v3, v6, MyLocalizationTable);
  v9 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v7 + 56);
  *(_QWORD *)(v0 + 288) = v9;
  v9(v3, 0, 1, MyLocalizationTable);
  v10 = String.fmLocalized(replacements:table:)(0, v3, 0xD000000000000025, 0x8000000000038DF0);
  v12 = v11;
  sub_1A198(v3, &qword_41720);
  v8(v3, v6, MyLocalizationTable);
  v9(v3, 0, 1, MyLocalizationTable);
  v13 = String.fmLocalized(replacements:table:)(0, v3, 0xD000000000000023, 0x8000000000038E20);
  v15 = v14;
  sub_1A198(v3, &qword_41720);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_410B0);
  *(_QWORD *)(v0 + 296) = v16;
  v17 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_410B8) - 8);
  v18 = *(_QWORD *)(v17 + 72);
  *(_QWORD *)(v0 + 304) = v18;
  LODWORD(v17) = *(_DWORD *)(v17 + 80);
  *(_DWORD *)(v0 + 328) = v17;
  v19 = swift_allocObject(v16, ((v17 + 32) & ~(unint64_t)v17) + v18, v17 | 7);
  *(_OWORD *)(v19 + 16) = xmmword_33770;
  static AlertInfo.ActionInfo<A>.okAction.getter();
  AlertInfo.init(title:message:actions:)(v10, v12, v13, v15, v19, (char *)&type metadata for () + 8);
  v22 = (int *)((char *)v4 + *v4);
  v20 = (_QWORD *)swift_task_alloc(v4[1]);
  *(_QWORD *)(v0 + 312) = v20;
  *v20 = v0;
  v20[1] = sub_26F30;
  return ((uint64_t (*)(_QWORD, uint64_t))v22)(*(_QWORD *)(v0 + 72), v23);
}

uint64_t sub_26F30()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v2 = *(_QWORD **)v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 312);
  *(_QWORD *)(*(_QWORD *)v1 + 320) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    swift_bridgeObjectRelease(v2[32]);
    v4 = v2[30];
    v5 = v2[31];
    v6 = sub_270AC;
  }
  else
  {
    v4 = v2[30];
    v5 = v2[31];
    v6 = sub_26F9C;
  }
  return swift_task_switch(v6, v4, v5);
}

uint64_t sub_26F9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);
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

  v1 = *(_QWORD *)(v0 + 256);
  v2 = *(_QWORD *)(v0 + 224);
  v3 = *(_QWORD *)(v0 + 200);
  v4 = *(_QWORD *)(v0 + 208);
  v5 = *(void (**)(uint64_t))(v0 + 80);
  v6 = *(_QWORD *)(v0 + 40);
  swift_release(*(_QWORD *)(v0 + 232));
  v5(v1);
  swift_bridgeObjectRelease(v1);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_40EA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = *(_QWORD *)(v0 + 216);
  v10 = *(_QWORD *)(v0 + 184);
  v9 = *(_QWORD *)(v0 + 192);
  v12 = *(_QWORD *)(v0 + 168);
  v11 = *(_QWORD *)(v0 + 176);
  v13 = *(_QWORD *)(v0 + 160);
  v14 = *(_QWORD *)(v0 + 136);
  v15 = *(_QWORD *)(v0 + 120);
  v16 = *(_QWORD *)(v0 + 96);
  swift_task_dealloc(*(_QWORD *)(v0 + 224));
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_270AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, _QWORD, uint64_t, uint64_t);
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
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
  void (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v48;
  unsigned int (*v49)(uint64_t, uint64_t, uint64_t);
  uint64_t v50;
  uint64_t v51;
  uint64_t result;
  uint64_t v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  void (*v66)(uint64_t, uint64_t);
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  void (*v81)(uint64_t, uint64_t, uint64_t);
  void (*v82)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t (*v119)(uint64_t);
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void (*v123)(uint64_t, uint64_t);
  uint64_t v124;

  v1 = *(_QWORD *)(v0 + 320);
  swift_release(*(_QWORD *)(v0 + 232));
  *(_QWORD *)(v0 + 24) = v1;
  v2 = (uint64_t *)(v0 + 32);
  swift_errorRetain(v1);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_40F98);
  v4 = swift_dynamicCast(v0 + 32, v0 + 24, v3, &type metadata for OfferLocationError, 0);
  v5 = *(_QWORD *)(v0 + 320);
  if ((v4 & 1) == 0)
  {
    v32 = *(_QWORD *)(v0 + 224);
    v33 = *(_QWORD *)(v0 + 200);
    v34 = *(_QWORD *)(v0 + 208);
    v35 = *(_QWORD *)(v0 + 40);
    swift_errorRelease(*(_QWORD *)(v0 + 24));
    swift_errorRelease(v5);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 32))(v35, v32, v33);
    v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_40EA0);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v35, 0, 1, v36);
LABEL_21:
    v96 = *(_QWORD *)(v0 + 216);
    v98 = *(_QWORD *)(v0 + 184);
    v97 = *(_QWORD *)(v0 + 192);
    v100 = *(_QWORD *)(v0 + 168);
    v99 = *(_QWORD *)(v0 + 176);
    v101 = *(_QWORD *)(v0 + 160);
    v102 = *(_QWORD *)(v0 + 136);
    v103 = *(_QWORD *)(v0 + 120);
    v104 = *(_QWORD *)(v0 + 96);
    swift_task_dealloc(*(_QWORD *)(v0 + 224));
    swift_task_dealloc(v96);
    swift_task_dealloc(v97);
    swift_task_dealloc(v98);
    swift_task_dealloc(v99);
    swift_task_dealloc(v100);
    swift_task_dealloc(v101);
    swift_task_dealloc(v102);
    swift_task_dealloc(v103);
    swift_task_dealloc(v104);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  swift_errorRelease(*(_QWORD *)(v0 + 320));
  v6 = *v2;
  v7 = *(_QWORD *)(*v2 + 16);
  if (v7 != 1)
  {
    if (v7)
    {
      v8 = *(unsigned __int8 *)(v0 + 328);
      v9 = *(_QWORD *)(v0 + 304);
      v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 280);
      v10 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v0 + 288);
      v13 = *(_QWORD *)(v0 + 264);
      v12 = *(_QWORD *)(v0 + 272);
      v109 = *(_QWORD *)(v0 + 296);
      v111 = *(_QWORD *)(v0 + 216);
      v113 = *(_QWORD *)(v0 + 208);
      v14 = *(_QWORD *)(v0 + 192);
      v115 = *(_QWORD *)(v0 + 200);
      v118 = *(_QWORD *)(v0 + 224);
      v121 = *(_QWORD *)(v0 + 40);
      swift_bridgeObjectRelease(v6);
      v106 = ((v8 + 32) & ~v8) + v9;
      v105 = v8 | 7;
      v15 = (void *)objc_opt_self(NSNumberFormatter);
      v16 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithInteger:", v7);
      v17 = objc_msgSend(v15, "localizedStringFromNumber:numberStyle:", v16, 0);

      v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17, v18);
      v21 = v20;

      v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_41758);
      v23 = swift_allocObject(v22, 72, 7);
      *(_OWORD *)(v23 + 16) = xmmword_33770;
      *(_QWORD *)(v23 + 56) = &type metadata for String;
      *(_QWORD *)(v23 + 64) = sub_281EC();
      *(_QWORD *)(v23 + 32) = v19;
      *(_QWORD *)(v23 + 40) = v21;
      v11(v14, v12, v13);
      v10(v14, 0, 1, v13);
      v24 = String.fmLocalized(replacements:table:)(v23, v14, 0xD000000000000026, 0x8000000000038E50);
      v26 = v25;
      swift_bridgeObjectRelease(v23);
      sub_1A198(v14, &qword_41720);
      v11(v14, v12, v13);
      v10(v14, 0, 1, v13);
      v27 = String.fmLocalized(replacements:table:)(0, v14, 0xD000000000000024, 0x8000000000038E80);
      v29 = v28;
      sub_1A198(v14, &qword_41720);
      v30 = swift_allocObject(v109, v106, v105);
      *(_OWORD *)(v30 + 16) = xmmword_33770;
      static AlertInfo.ActionInfo<A>.okAction.getter();
      AlertInfo.init(title:message:actions:)(v24, v26, v27, v29, v30, (char *)&type metadata for () + 8);
      (*(void (**)(uint64_t, uint64_t))(v113 + 8))(v118, v115);
      v31 = v121;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v113 + 32))(v121, v111, v115);
LABEL_19:
      v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_40EA0);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v95 - 8) + 56))(v31, 0, 1, v95);
      goto LABEL_20;
    }
LABEL_16:
    v72 = *(_QWORD *)(v0 + 224);
    v73 = *(_QWORD *)(v0 + 200);
    v74 = *(_QWORD *)(v0 + 208);
    v75 = *(_QWORD *)(v0 + 40);
    swift_bridgeObjectRelease(v6);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v74 + 32))(v75, v72, v73);
    v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_40EA0);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v76 - 8) + 56))(v75, 0, 1, v76);
LABEL_20:
    swift_errorRelease(*(_QWORD *)(v0 + 24));
    goto LABEL_21;
  }
  v37 = *(_QWORD *)(v0 + 176);
  v38 = *(_QWORD *)(v0 + 184);
  v40 = *(_QWORD *)(v0 + 152);
  v39 = *(_QWORD *)(v0 + 160);
  v41 = *(_QWORD *)(v0 + 136);
  v42 = *(_QWORD *)(v0 + 144);
  v122 = *(_QWORD *)(v0 + 128);
  v43 = *(_QWORD *)(v0 + 104);
  v44 = *(_QWORD *)(v0 + 112);
  v116 = v6 + ((*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80));
  v119 = *(uint64_t (**)(uint64_t))(v40 + 16);
  v45 = v119(v39);
  Handle.kind.getter(v45);
  v46 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
  v46(v39, v42);
  v47 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v44 + 56);
  v47(v38, 0, 1, v43);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v44 + 104))(v37, enum case for Handle.Kind.phoneNumber(_:), v43);
  v47(v37, 0, 1, v43);
  v48 = v41 + *(int *)(v122 + 48);
  sub_28230(v38, v41);
  sub_28230(v37, v48);
  v49 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v44 + 48);
  if (v49(v41, 1, v43) == 1)
  {
    v50 = *(_QWORD *)(v0 + 184);
    v51 = *(_QWORD *)(v0 + 104);
    sub_1A198(*(_QWORD *)(v0 + 176), &qword_41788);
    sub_1A198(v50, &qword_41788);
    if (v49(v48, 1, v51) == 1)
    {
      v123 = v46;
      result = sub_1A198(*(_QWORD *)(v0 + 136), &qword_41788);
      goto LABEL_13;
    }
LABEL_11:
    sub_1A198(*(_QWORD *)(v0 + 136), &qword_41780);
    goto LABEL_16;
  }
  v53 = *(_QWORD *)(v0 + 104);
  sub_28230(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 168));
  v54 = v49(v48, 1, v53);
  v56 = *(_QWORD *)(v0 + 176);
  v55 = *(_QWORD *)(v0 + 184);
  v57 = *(_QWORD *)(v0 + 168);
  if (v54 == 1)
  {
    v58 = *(_QWORD *)(v0 + 104);
    v59 = *(_QWORD *)(v0 + 112);
    sub_1A198(*(_QWORD *)(v0 + 176), &qword_41788);
    sub_1A198(v55, &qword_41788);
    (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v57, v58);
    goto LABEL_11;
  }
  v123 = v46;
  v60 = *(_QWORD *)(v0 + 136);
  v61 = *(_QWORD *)(v0 + 112);
  v62 = *(_QWORD *)(v0 + 120);
  v63 = *(_QWORD *)(v0 + 104);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v61 + 32))(v62, v48, v63);
  v64 = sub_19D7C(&qword_41798, (uint64_t (*)(uint64_t))&type metadata accessor for Handle.Kind, (uint64_t)&protocol conformance descriptor for Handle.Kind);
  v65 = dispatch thunk of static Equatable.== infix(_:_:)(v57, v62, v63, v64);
  v66 = *(void (**)(uint64_t, uint64_t))(v61 + 8);
  v66(v62, v63);
  sub_1A198(v56, &qword_41788);
  sub_1A198(v55, &qword_41788);
  v66(v57, v63);
  result = sub_1A198(v60, &qword_41788);
  if ((v65 & 1) == 0)
    goto LABEL_16;
LABEL_13:
  if (*(_QWORD *)(v6 + 16))
  {
    v67 = *(_QWORD *)(v0 + 144);
    v68 = *(_QWORD *)(v0 + 152);
    v69 = *(_QWORD *)(v0 + 96);
    ((void (*)(uint64_t, uint64_t, uint64_t))v119)(v69, v116, v67);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v68 + 56))(v69, 0, 1, v67);
    swift_bridgeObjectRelease(v6);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v68 + 48))(v69, 1, v67) == 1)
    {
      sub_1A198(*(_QWORD *)(v0 + 96), &qword_40F60);
      v70 = 0xE500000000000000;
      v71 = 0x656E6F6870;
    }
    else
    {
      v77 = *(_QWORD *)(v0 + 144);
      v78 = *(_QWORD *)(v0 + 96);
      v71 = Handle.label.getter();
      v70 = v79;
      v123(v78, v77);
    }
    v80 = *(unsigned __int8 *)(v0 + 328);
    v81 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 280);
    v82 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v0 + 288);
    v84 = *(_QWORD *)(v0 + 264);
    v83 = *(_QWORD *)(v0 + 272);
    v120 = *(_QWORD *)(v0 + 224);
    v110 = *(_QWORD *)(v0 + 296);
    v112 = *(_QWORD *)(v0 + 216);
    v85 = *(_QWORD *)(v0 + 192);
    v114 = *(_QWORD *)(v0 + 208);
    v117 = *(_QWORD *)(v0 + 200);
    v124 = *(_QWORD *)(v0 + 40);
    v107 = v80 | 7;
    v108 = ((v80 + 32) & ~v80) + *(_QWORD *)(v0 + 304);
    v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_41758);
    v87 = swift_allocObject(v86, 72, 7);
    *(_OWORD *)(v87 + 16) = xmmword_33770;
    *(_QWORD *)(v87 + 56) = &type metadata for String;
    *(_QWORD *)(v87 + 64) = sub_281EC();
    *(_QWORD *)(v87 + 32) = v71;
    *(_QWORD *)(v87 + 40) = v70;
    v81(v85, v83, v84);
    v82(v85, 0, 1, v84);
    v88 = String.fmLocalized(replacements:table:)(v87, v85, 0xD000000000000024, 0x8000000000038EB0);
    v90 = v89;
    swift_bridgeObjectRelease(v87);
    sub_1A198(v85, &qword_41720);
    v81(v85, v83, v84);
    v82(v85, 0, 1, v84);
    v91 = String.fmLocalized(replacements:table:)(0, v85, 0xD000000000000022, 0x8000000000038EE0);
    v93 = v92;
    sub_1A198(v85, &qword_41720);
    v94 = swift_allocObject(v110, v108, v107);
    *(_OWORD *)(v94 + 16) = xmmword_33770;
    static AlertInfo.ActionInfo<A>.okAction.getter();
    AlertInfo.init(title:message:actions:)(v88, v90, v91, v93, v94, (char *)&type metadata for () + 8);
    (*(void (**)(uint64_t, uint64_t))(v114 + 8))(v120, v117);
    v31 = v124;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v114 + 32))(v124, v112, v117);
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_279B8()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t MyLocalizationTable;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(char *, uint64_t, uint64_t);
  void (*v7)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v10;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_41720);
  __chkstk_darwin(v0);
  v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_40BC0 != -1)
    swift_once(&qword_40BC0, sub_27A8);
  MyLocalizationTable = type metadata accessor for FindMyLocalizationTable(0);
  v4 = __swift_project_value_buffer(MyLocalizationTable, (uint64_t)qword_40BC8);
  v5 = *(_QWORD *)(MyLocalizationTable - 8);
  v6 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v6(v2, v4, MyLocalizationTable);
  v7 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56);
  v7(v2, 0, 1, MyLocalizationTable);
  v8 = String.fmLocalized(replacements:table:)(0, v2, 0xD000000000000030, 0x8000000000038D20);
  sub_1A198((uint64_t)v2, &qword_41720);
  v6(v2, v4, MyLocalizationTable);
  v7(v2, 0, 1, MyLocalizationTable);
  String.fmLocalized(replacements:table:)(0, v2, 0xD00000000000002ELL, 0x8000000000038D60);
  sub_1A198((uint64_t)v2, &qword_41720);
  return v8;
}

uint64_t sub_27B48()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t OfferLocationContactPickerView.body.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_41728);
  State.wrappedValue.getter(&v7, v2);
  v3 = v7;
  v4 = (_QWORD *)((char *)a1 + *(int *)(type metadata accessor for ContactPickerView(0) + 20));
  *v4 = swift_getKeyPath(&unk_342D0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_41258);
  result = swift_storeEnumTagMultiPayload(v4, v5, 0);
  *a1 = v3;
  return result;
}

uint64_t sub_27C00(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &opaque type descriptor for <<opaque return type of OfferLocationContactPickerView.body>>, 1);
}

uint64_t *initializeBufferWithCopyOfBuffer for OfferLocationError(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = *a2;
  *a1 = *a2;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t destroy for OfferLocationError(_QWORD *a1)
{
  return swift_bridgeObjectRelease(*a1);
}

uint64_t *assignWithCopy for OfferLocationError(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRelease(v4);
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t *assignWithTake for OfferLocationError(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRelease(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for OfferLocationError(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 8))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for OfferLocationError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 8) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_27D3C()
{
  return 0;
}

ValueMetadata *type metadata accessor for OfferLocationError()
{
  return &type metadata for OfferLocationError;
}

ValueMetadata *type metadata accessor for OfferLocationContactPickerView()
{
  return &type metadata for OfferLocationContactPickerView;
}

uint64_t sub_27D64()
{
  return sub_19D7C((unint64_t *)&qword_41738, type metadata accessor for ContactPickerView, (uint64_t)&protocol conformance descriptor for ContactPickerView);
}

uint64_t sub_27D90(uint64_t a1)
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
  if (v6 < 8)
    return v3;
  v1 = *(_QWORD *)(a1 + 80);
  if (v1)
  {
    v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  v1 = *(_QWORD *)(a1 + 88);
  if (v1)
  {
    v2 = 192;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 4)
    v7 = 4;
  v8 = v7 - 4;
  v9 = (unint64_t *)(a1 + 96);
  v2 = 192;
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

uint64_t sub_27E40()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t MyLocalizationTable;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(char *, uint64_t, uint64_t);
  void (*v7)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v10;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_41720);
  __chkstk_darwin(v0);
  v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_40BC0 != -1)
    swift_once(&qword_40BC0, sub_27A8);
  MyLocalizationTable = type metadata accessor for FindMyLocalizationTable(0);
  v4 = __swift_project_value_buffer(MyLocalizationTable, (uint64_t)qword_40BC8);
  v5 = *(_QWORD *)(MyLocalizationTable - 8);
  v6 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v6(v2, v4, MyLocalizationTable);
  v7 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56);
  v7(v2, 0, 1, MyLocalizationTable);
  v8 = String.fmLocalized(replacements:table:)(0, v2, 0xD00000000000002ELL, 0x8000000000038D90);
  sub_1A198((uint64_t)v2, &qword_41720);
  v6(v2, v4, MyLocalizationTable);
  v7(v2, 0, 1, MyLocalizationTable);
  String.fmLocalized(replacements:table:)(0, v2, 0xD00000000000002CLL, 0x8000000000038DC0);
  sub_1A198((uint64_t)v2, &qword_41720);
  return v8;
}

uint64_t sub_27FD0()
{
  return objectdestroyTm_0((void (*)(_QWORD))&_swift_release);
}

uint64_t objectdestroyTm_0(void (*a1)(_QWORD))
{
  _QWORD *v1;

  a1(v1[3]);
  swift_release(v1[5]);
  swift_release(v1[7]);
  return swift_deallocObject(v1, 64, 7);
}

uint64_t sub_28014(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v9 = v1[6];
  v8 = v1[7];
  v10 = (_QWORD *)swift_task_alloc(dword_41764);
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_1A22C;
  return sub_268B4(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t sub_2809C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = type metadata accessor for OfferLocationDuration(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 32) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release(*(_QWORD *)(v0 + 24));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release(*(_QWORD *)(v0 + v6 + 8));
  return swift_deallocObject(v0, v6 + 16, v5);
}

uint64_t sub_28130(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v6 = *(_QWORD *)(type metadata accessor for OfferLocationDuration(0) - 8);
  v7 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = *(_QWORD *)(v2 + 16);
  v9 = *(_QWORD *)(v2 + 24);
  v10 = v2 + v7;
  v11 = (uint64_t *)(v2 + ((*(_QWORD *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8));
  v12 = *v11;
  v13 = v11[1];
  v14 = (_QWORD *)swift_task_alloc(dword_41774);
  *(_QWORD *)(v3 + 16) = v14;
  *v14 = v3;
  v14[1] = sub_1A22C;
  return sub_26B14(a1, a2, v8, v9, v10, v12, v13);
}

unint64_t sub_281EC()
{
  unint64_t result;

  result = qword_41790;
  if (!qword_41790)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_41790);
  }
  return result;
}

uint64_t sub_28230(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_41788);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t Destination.hash(into:)(uint64_t a1, _QWORD *a2)
{
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  int EnumCaseMultiPayload;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v28 = a2[4];
  v27 = *(_QWORD *)(v28 - 8);
  v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(v7 + 24);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v4);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(v13 + 16);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = __chkstk_darwin(v10);
  v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v20 = (char *)&v27 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, _QWORD *))(v21 + 16))(v20, v22, a2);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v20, a2);
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v12, v20, v8);
      Hasher._combine(_:)(1uLL);
      dispatch thunk of Hashable.hash(into:)(a1, v8, *(_QWORD *)(a2[6] + 8));
      return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    }
    else
    {
      v26 = v27;
      v25 = v28;
      (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v6, v20, v28);
      Hasher._combine(_:)(2uLL);
      dispatch thunk of Hashable.hash(into:)(a1, v25, *(_QWORD *)(a2[7] + 8));
      return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v6, v25);
    }
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v20, v14);
    Hasher._combine(_:)(0);
    dispatch thunk of Hashable.hash(into:)(a1, v14, *(_QWORD *)(a2[5] + 8));
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v18, v14);
  }
}

uint64_t static Destination.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t TupleTypeMetadata2;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  void (*v35)(char *, uint64_t, uint64_t);
  int EnumCaseMultiPayload;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char v40;
  void (*v41)(char *, uint64_t);
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD v66[7];

  v64 = a1;
  v65 = a2;
  v58 = *(_QWORD *)(a5 - 8);
  v6 = __chkstk_darwin(a1);
  v53 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = *(_QWORD *)(v8 - 8);
  v9 = __chkstk_darwin(v6);
  v52 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v9);
  v13 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66[0] = v14;
  v66[1] = v15;
  v55 = v16;
  v56 = v15;
  v59 = v17;
  v66[2] = v17;
  v66[3] = v18;
  v61 = v18;
  v54 = v19;
  v66[4] = v19;
  v66[5] = v16;
  v20 = type metadata accessor for Destination(0, (uint64_t)v66);
  v21 = *(_QWORD *)(v20 - 8);
  v22 = __chkstk_darwin(v20);
  v24 = (char *)&v51 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __chkstk_darwin(v22);
  v27 = (char *)&v51 - v26;
  __chkstk_darwin(v25);
  v29 = (char *)&v51 - v28;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2(0);
  v63 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v31 = __chkstk_darwin(TupleTypeMetadata2);
  v33 = (char *)&v51 - v32;
  v34 = (char *)&v51 + *(int *)(v31 + 48) - v32;
  v62 = v21;
  v35 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 16);
  v35((char *)&v51 - v32, v64, v20);
  v35(v34, v65, v20);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v33, v20);
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      v35(v27, (uint64_t)v33, v20);
      if (swift_getEnumCaseMultiPayload(v34, v20) == 1)
      {
        v37 = v56;
        v38 = v57;
        v39 = v52;
        (*(void (**)(char *, char *, uint64_t))(v57 + 32))(v52, v34, v56);
        v40 = dispatch thunk of static Equatable.== infix(_:_:)(v27, v39, v37, *(_QWORD *)(*(_QWORD *)(v54 + 8) + 8));
        v41 = *(void (**)(char *, uint64_t))(v38 + 8);
        v41(v39, v37);
        v42 = v27;
LABEL_9:
        v48 = v37;
LABEL_14:
        v41(v42, v48);
        v49 = v62;
        goto LABEL_15;
      }
      (*(void (**)(char *, uint64_t))(v57 + 8))(v27, v56);
    }
    else
    {
      v35(v24, (uint64_t)v33, v20);
      if (swift_getEnumCaseMultiPayload(v34, v20) == 2)
      {
        v46 = v58;
        v37 = v59;
        v47 = v53;
        (*(void (**)(char *, char *, uint64_t))(v58 + 32))(v53, v34, v59);
        v40 = dispatch thunk of static Equatable.== infix(_:_:)(v24, v47, v37, *(_QWORD *)(*(_QWORD *)(v55 + 8) + 8));
        v41 = *(void (**)(char *, uint64_t))(v46 + 8);
        v41(v47, v37);
        v42 = v24;
        goto LABEL_9;
      }
      (*(void (**)(char *, uint64_t))(v58 + 8))(v24, v59);
    }
  }
  else
  {
    v43 = v13;
    v45 = v60;
    v44 = v61;
    v35(v29, (uint64_t)v33, v20);
    if (!swift_getEnumCaseMultiPayload(v34, v20))
    {
      (*(void (**)(char *, char *, uint64_t))(v45 + 32))(v43, v34, a3);
      v40 = dispatch thunk of static Equatable.== infix(_:_:)(v29, v43, a3, *(_QWORD *)(*(_QWORD *)(v44 + 8) + 8));
      v41 = *(void (**)(char *, uint64_t))(v45 + 8);
      v41(v43, a3);
      v42 = v29;
      v48 = a3;
      goto LABEL_14;
    }
    (*(void (**)(char *, uint64_t))(v45 + 8))(v29, a3);
  }
  v40 = 0;
  v49 = v63;
  v20 = TupleTypeMetadata2;
LABEL_15:
  (*(void (**)(char *, uint64_t))(v49 + 8))(v33, v20);
  return v40 & 1;
}

uint64_t type metadata accessor for Destination(uint64_t a1, uint64_t a2)
{
  return swift_getGenericMetadata(a1, a2, &nominal type descriptor for Destination);
}

Swift::Int Destination.hashValue.getter(_QWORD *a1)
{
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, 0);
  Destination.hash(into:)((uint64_t)v3, a1);
  return Hasher._finalize()();
}

Swift::Int sub_288B0(uint64_t a1, _QWORD *a2)
{
  _QWORD v4[9];

  Hasher.init(_seed:)(v4, a1);
  Destination.hash(into:)((uint64_t)v4, a2);
  return Hasher._finalize()();
}

uint64_t sub_288F0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return static Destination.== infix(_:_:)(a1, a2, a3[2], a3[3], a3[4]);
}

uint64_t sub_28904@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t WitnessTable;
  uint64_t result;

  WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for Destination<A, B, C>, a1);
  result = Path.id.getter(a1, WitnessTable);
  *a2 = result;
  return result;
}

uint64_t Destination.stack.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v4 = *(_QWORD *)(a1 - 8);
  __chkstk_darwin(a1);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v4 + 16))(v6);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v6, a1);
  v8 = *(_QWORD *)(a1 + 16);
  v9 = *(_QWORD *)(v8 - 8);
  if (EnumCaseMultiPayload)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v9 + 56))(a2, 1, 1, *(_QWORD *)(a1 + 16));
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, a1);
  }
  else
  {
    (*(void (**)(uint64_t, char *, _QWORD))(v9 + 32))(a2, v6, *(_QWORD *)(a1 + 16));
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v9 + 56))(a2, 0, 1, v8);
  }
}

uint64_t sub_28A30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t);
  __int128 v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _OWORD v17[3];

  v5 = a4 + a3;
  v16 = *(_OWORD *)(a4 + a3 - 48);
  v6 = type metadata accessor for Optional(0, v16);
  __chkstk_darwin(v6);
  v8 = (char *)&v14 - v7;
  v10 = *(void (**)(char *, uint64_t))(v9 + 16);
  v11 = *(_OWORD *)(v5 - 32);
  v14 = *(_OWORD *)(v5 - 16);
  v15 = v11;
  v10((char *)&v14 - v7, a1);
  v17[0] = v16;
  v17[1] = v15;
  v17[2] = v14;
  v12 = type metadata accessor for Destination(0, (uint64_t)v17);
  return Destination.stack.setter((uint64_t)v8, v12);
}

uint64_t Destination.stack.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5);
  if ((_DWORD)result != 1)
  {
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(v2, a2);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v2, a1, v5);
    return swift_storeEnumTagMultiPayload(v2, a2, 0);
  }
  return result;
}

void (*Destination.stack.modify(_QWORD *a1, uint64_t a2))(uint64_t **a1, char a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  void *v9;

  v5 = malloc(0x30uLL);
  *a1 = v5;
  *v5 = a2;
  v5[1] = v2;
  v6 = type metadata accessor for Optional(0, *(_QWORD *)(a2 + 16));
  v5[2] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[3] = v7;
  v8 = *(_QWORD *)(v7 + 64);
  v5[4] = malloc(v8);
  v9 = malloc(v8);
  v5[5] = v9;
  Destination.stack.getter(a2, (uint64_t)v9);
  return sub_28C10;
}

void sub_28C10(uint64_t **a1, char a2)
{
  sub_29230(a1, a2, (void (*)(void *, uint64_t))Destination.stack.setter);
}

uint64_t Destination.sheet.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v4 = *(_QWORD *)(a1 - 8);
  __chkstk_darwin(a1);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v4 + 16))(v6);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v6, a1);
  v8 = *(_QWORD *)(a1 + 24);
  v9 = *(_QWORD *)(v8 - 8);
  if (EnumCaseMultiPayload == 1)
  {
    (*(void (**)(uint64_t, char *, _QWORD))(v9 + 32))(a2, v6, *(_QWORD *)(a1 + 24));
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v9 + 56))(a2, 0, 1, v8);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v9 + 56))(a2, 1, 1, *(_QWORD *)(a1 + 24));
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, a1);
  }
}

uint64_t sub_28D04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t);
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v5 = a4 + a3;
  v6 = *(_QWORD *)(a4 + a3 - 48);
  v7 = *(_QWORD *)(a4 + a3 - 8);
  v16 = *(_OWORD *)(a4 + a3 - 40);
  v8 = type metadata accessor for Optional(0, v16);
  __chkstk_darwin(v8);
  v10 = (char *)&v15 - v9;
  v12 = *(void (**)(char *, uint64_t))(v11 + 16);
  v15 = *(_OWORD *)(v5 - 24);
  v12((char *)&v15 - v9, a1);
  v17 = v6;
  v18 = v16;
  v19 = v15;
  v20 = v7;
  v13 = type metadata accessor for Destination(0, (uint64_t)&v17);
  return Destination.sheet.setter((uint64_t)v10, v13);
}

uint64_t Destination.sheet.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v5 = *(_QWORD *)(a2 + 24);
  v6 = *(_QWORD *)(v5 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5);
  if ((_DWORD)result != 1)
  {
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(v2, a2);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v2, a1, v5);
    return swift_storeEnumTagMultiPayload(v2, a2, 1);
  }
  return result;
}

void (*Destination.sheet.modify(_QWORD *a1, uint64_t a2))(uint64_t **a1, char a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  void *v9;

  v5 = malloc(0x30uLL);
  *a1 = v5;
  *v5 = a2;
  v5[1] = v2;
  v6 = type metadata accessor for Optional(0, *(_QWORD *)(a2 + 24));
  v5[2] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[3] = v7;
  v8 = *(_QWORD *)(v7 + 64);
  v5[4] = malloc(v8);
  v9 = malloc(v8);
  v5[5] = v9;
  Destination.sheet.getter(a2, (uint64_t)v9);
  return sub_28EF4;
}

void sub_28EF4(uint64_t **a1, char a2)
{
  sub_29230(a1, a2, (void (*)(void *, uint64_t))Destination.sheet.setter);
}

uint64_t Destination.alert.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v4 = *(_QWORD *)(a1 - 8);
  __chkstk_darwin(a1);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v4 + 16))(v6);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v6, a1);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(v8 - 8);
  if (EnumCaseMultiPayload == 2)
  {
    (*(void (**)(uint64_t, char *, _QWORD))(v9 + 32))(a2, v6, *(_QWORD *)(a1 + 32));
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v9 + 56))(a2, 0, 1, v8);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v9 + 56))(a2, 1, 1, *(_QWORD *)(a1 + 32));
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, a1);
  }
}

uint64_t sub_28FE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  __int128 v5;
  uint64_t v6;
  _OWORD v8[3];

  v5 = *(_OWORD *)(a3 + a2 - 32);
  v8[0] = *(_OWORD *)(a3 + a2 - 48);
  v8[1] = v5;
  v8[2] = *(_OWORD *)(a3 + a2 - 16);
  v6 = type metadata accessor for Destination(0, (uint64_t)v8);
  return a4(v6);
}

uint64_t sub_29044(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t);
  __int128 v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _OWORD v17[3];

  v5 = a4 + a3;
  v16 = *(_OWORD *)(a4 + a3 - 32);
  v6 = type metadata accessor for Optional(0, v16);
  __chkstk_darwin(v6);
  v8 = (char *)&v14 - v7;
  v10 = *(void (**)(char *, uint64_t))(v9 + 16);
  v11 = *(_OWORD *)(v5 - 16);
  v14 = *(_OWORD *)(v5 - 48);
  v15 = v11;
  v10((char *)&v14 - v7, a1);
  v17[0] = v14;
  v17[1] = v16;
  v17[2] = v15;
  v12 = type metadata accessor for Destination(0, (uint64_t)v17);
  return Destination.alert.setter((uint64_t)v8, v12);
}

uint64_t Destination.alert.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v5 = *(_QWORD *)(a2 + 32);
  v6 = *(_QWORD *)(v5 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5);
  if ((_DWORD)result != 1)
  {
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(v2, a2);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v2, a1, v5);
    return swift_storeEnumTagMultiPayload(v2, a2, 2);
  }
  return result;
}

void (*Destination.alert.modify(_QWORD *a1, uint64_t a2))(uint64_t **a1, char a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  void *v9;

  v5 = malloc(0x30uLL);
  *a1 = v5;
  *v5 = a2;
  v5[1] = v2;
  v6 = type metadata accessor for Optional(0, *(_QWORD *)(a2 + 32));
  v5[2] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[3] = v7;
  v8 = *(_QWORD *)(v7 + 64);
  v5[4] = malloc(v8);
  v9 = malloc(v8);
  v5[5] = v9;
  Destination.alert.getter(a2, (uint64_t)v9);
  return sub_29224;
}

void sub_29224(uint64_t **a1, char a2)
{
  sub_29230(a1, a2, (void (*)(void *, uint64_t))Destination.alert.setter);
}

void sub_29230(uint64_t **a1, char a2, void (*a3)(void *, uint64_t))
{
  uint64_t *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *a1;
  v5 = (void *)(*a1)[4];
  v6 = (void *)(*a1)[5];
  if ((a2 & 1) != 0)
  {
    v7 = v4[2];
    v8 = v4[3];
    v9 = *v4;
    (*(void (**)(uint64_t, void *, uint64_t))(v8 + 16))((*a1)[4], v6, v7);
    a3(v5, v9);
    (*(void (**)(void *, uint64_t))(v8 + 8))(v6, v7);
  }
  else
  {
    a3((void *)(*a1)[5], *v4);
  }
  free(v6);
  free(v5);
  free(v4);
}

void (*sub_292D4(_QWORD *a1, uint64_t a2))(_QWORD *)
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = Destination.stack.modify(v4, a2);
  return sub_29320;
}

void (*sub_2932C(_QWORD *a1, uint64_t a2))(_QWORD *)
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = Destination.sheet.modify(v4, a2);
  return sub_29320;
}

void (*sub_29380(_QWORD *a1, uint64_t a2))(_QWORD *)
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = Destination.alert.modify(v4, a2);
  return sub_29320;
}

void sub_293CC(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t Optional<A>.stack.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t AssociatedTypeWitness;
  uint64_t v14;

  v6 = *(_QWORD *)(a1 - 8);
  __chkstk_darwin(a1);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, a1);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) == 1)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, a1);
    AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, a2, v10, &protocol requirements base descriptor for DestinationInterface, &associated type descriptor for DestinationInterface.Stack);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56))(a3, 1, 1, AssociatedTypeWitness);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(a2 + 32))(v10, a2);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v8, v10);
  }
}

uint64_t Optional<A>.stack.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;

  v19 = a3;
  v5 = *(_QWORD *)(a2 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, a3, v5, &protocol requirements base descriptor for DestinationInterface, &associated type descriptor for DestinationInterface.Stack);
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  __chkstk_darwin(AssociatedTypeWitness);
  v9 = (char *)&v19 - v8;
  v10 = type metadata accessor for Optional(0, AssociatedTypeWitness);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v16 = (char *)&v19 - v15;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v19 - v15, a1, v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v16, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
    v17 = v20;
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(v20, a2);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v17, 1, 1, v5);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v16, AssociatedTypeWitness);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v20, 1, v5))
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v14, v9, AssociatedTypeWitness);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v14, 0, 1, AssociatedTypeWitness);
      (*(void (**)(char *, uint64_t))(v19 + 40))(v14, v5);
    }
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, AssociatedTypeWitness);
  }
}

void (*Optional<A>.stack.modify(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t **a1, char a2)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  void *v12;

  v7 = malloc(0x38uLL);
  *a1 = v7;
  v7[1] = a3;
  v7[2] = v3;
  *v7 = a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(255, a3, *(_QWORD *)(a2 + 16), &protocol requirements base descriptor for DestinationInterface, &associated type descriptor for DestinationInterface.Stack);
  v9 = type metadata accessor for Optional(0, AssociatedTypeWitness);
  v7[3] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v7[4] = v10;
  v11 = *(_QWORD *)(v10 + 64);
  v7[5] = malloc(v11);
  v12 = malloc(v11);
  v7[6] = v12;
  Optional<A>.stack.getter(a2, a3, (uint64_t)v12);
  return sub_297CC;
}

void sub_297CC(uint64_t **a1, char a2)
{
  sub_2A054(a1, a2, (void (*)(void *, uint64_t, uint64_t))Optional<A>.stack.setter);
}

uint64_t Optional<A>.sheet.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t AssociatedTypeWitness;
  uint64_t v14;

  v6 = *(_QWORD *)(a1 - 8);
  __chkstk_darwin(a1);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, a1);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) == 1)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, a1);
    AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, a2, v10, &protocol requirements base descriptor for DestinationInterface, &associated type descriptor for DestinationInterface.Sheet);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56))(a3, 1, 1, AssociatedTypeWitness);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(a2 + 56))(v10, a2);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v8, v10);
  }
}

uint64_t Optional<A>.sheet.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;

  v19 = a3;
  v5 = *(_QWORD *)(a2 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, a3, v5, &protocol requirements base descriptor for DestinationInterface, &associated type descriptor for DestinationInterface.Sheet);
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  __chkstk_darwin(AssociatedTypeWitness);
  v9 = (char *)&v19 - v8;
  v10 = type metadata accessor for Optional(0, AssociatedTypeWitness);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v16 = (char *)&v19 - v15;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v19 - v15, a1, v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v16, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
    v17 = v20;
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(v20, a2);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v17, 1, 1, v5);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v16, AssociatedTypeWitness);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v20, 1, v5))
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v14, v9, AssociatedTypeWitness);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v14, 0, 1, AssociatedTypeWitness);
      (*(void (**)(char *, uint64_t))(v19 + 64))(v14, v5);
    }
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, AssociatedTypeWitness);
  }
}

void (*Optional<A>.sheet.modify(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t **a1, char a2)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  void *v12;

  v7 = malloc(0x38uLL);
  *a1 = v7;
  v7[1] = a3;
  v7[2] = v3;
  *v7 = a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(255, a3, *(_QWORD *)(a2 + 16), &protocol requirements base descriptor for DestinationInterface, &associated type descriptor for DestinationInterface.Sheet);
  v9 = type metadata accessor for Optional(0, AssociatedTypeWitness);
  v7[3] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v7[4] = v10;
  v11 = *(_QWORD *)(v10 + 64);
  v7[5] = malloc(v11);
  v12 = malloc(v11);
  v7[6] = v12;
  Optional<A>.sheet.getter(a2, a3, (uint64_t)v12);
  return sub_29BAC;
}

void sub_29BAC(uint64_t **a1, char a2)
{
  sub_2A054(a1, a2, (void (*)(void *, uint64_t, uint64_t))Optional<A>.sheet.setter);
}

uint64_t Optional<A>.alert.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t AssociatedTypeWitness;
  uint64_t v14;

  v6 = *(_QWORD *)(a1 - 8);
  __chkstk_darwin(a1);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, a1);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) == 1)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, a1);
    AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, a2, v10, &protocol requirements base descriptor for DestinationInterface, &associated type descriptor for DestinationInterface.Alert);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 56))(a3, 1, 1, AssociatedTypeWitness);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(a2 + 80))(v10, a2);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v8, v10);
  }
}

uint64_t sub_29CD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(char *, uint64_t, uint64_t))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v8 = *(_QWORD *)(a4 + a3 - 16);
  v9 = *(_QWORD *)(a4 + a3 - 8);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(255, v9, v8, &protocol requirements base descriptor for DestinationInterface, a5);
  v11 = type metadata accessor for Optional(0, AssociatedTypeWitness);
  __chkstk_darwin(v11);
  v13 = (char *)&v17 - v12;
  (*(void (**)(char *, uint64_t))(v14 + 16))((char *)&v17 - v12, a1);
  v15 = type metadata accessor for Optional(0, v8);
  return a6(v13, v15, v9);
}

uint64_t Optional<A>.alert.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;

  v19 = a3;
  v5 = *(_QWORD *)(a2 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(0, a3, v5, &protocol requirements base descriptor for DestinationInterface, &associated type descriptor for DestinationInterface.Alert);
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  __chkstk_darwin(AssociatedTypeWitness);
  v9 = (char *)&v19 - v8;
  v10 = type metadata accessor for Optional(0, AssociatedTypeWitness);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v16 = (char *)&v19 - v15;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v19 - v15, a1, v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v16, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
    v17 = v20;
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(v20, a2);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v17, 1, 1, v5);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v16, AssociatedTypeWitness);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v20, 1, v5))
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v14, v9, AssociatedTypeWitness);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v14, 0, 1, AssociatedTypeWitness);
      (*(void (**)(char *, uint64_t))(v19 + 88))(v14, v5);
    }
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, AssociatedTypeWitness);
  }
}

void (*Optional<A>.alert.modify(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t **a1, char a2)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  void *v12;

  v7 = malloc(0x38uLL);
  *a1 = v7;
  v7[1] = a3;
  v7[2] = v3;
  *v7 = a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(255, a3, *(_QWORD *)(a2 + 16), &protocol requirements base descriptor for DestinationInterface, &associated type descriptor for DestinationInterface.Alert);
  v9 = type metadata accessor for Optional(0, AssociatedTypeWitness);
  v7[3] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v7[4] = v10;
  v11 = *(_QWORD *)(v10 + 64);
  v7[5] = malloc(v11);
  v12 = malloc(v11);
  v7[6] = v12;
  Optional<A>.alert.getter(a2, a3, (uint64_t)v12);
  return sub_2A048;
}

void sub_2A048(uint64_t **a1, char a2)
{
  sub_2A054(a1, a2, (void (*)(void *, uint64_t, uint64_t))Optional<A>.alert.setter);
}

void sub_2A054(uint64_t **a1, char a2, void (*a3)(void *, uint64_t, uint64_t))
{
  uint64_t *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *a1;
  v5 = (void *)(*a1)[5];
  v6 = (void *)(*a1)[6];
  if ((a2 & 1) != 0)
  {
    v7 = v4[3];
    v8 = v4[4];
    v9 = v4[1];
    v10 = *v4;
    (*(void (**)(uint64_t, void *, uint64_t))(v8 + 16))((*a1)[5], v6, v7);
    a3(v5, v10, v9);
    (*(void (**)(void *, uint64_t))(v8 + 8))(v6, v7);
  }
  else
  {
    a3((void *)(*a1)[6], *v4, v4[1]);
  }
  free(v6);
  free(v5);
  free(v4);
}

uint64_t sub_2A104(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = swift_getWitnessTable(&protocol conformance descriptor for Destination<A, B, C>, a2);
  result = swift_getWitnessTable(&protocol conformance descriptor for Destination<A, B, C>, a2);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_2A148(uint64_t a1)
{
  return swift_getWitnessTable(&protocol conformance descriptor for Destination<A, B, C>, a1);
}

void *sub_2A158()
{
  return &protocol witness table for Int;
}

uint64_t sub_2A164(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_28FE8(a1, a2, a3, (uint64_t (*)(uint64_t))Destination.stack.getter);
}

uint64_t sub_2A184()
{
  return 48;
}

__n128 sub_2A190(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 32) = v3;
  *(__n128 *)a2 = result;
  return result;
}

uint64_t sub_2A1A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_28FE8(a1, a2, a3, (uint64_t (*)(uint64_t))Destination.sheet.getter);
}

uint64_t sub_2A1C4()
{
  return 48;
}

__n128 sub_2A1D0(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 32) = v3;
  *(__n128 *)a2 = result;
  return result;
}

uint64_t sub_2A1E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_28FE8(a1, a2, a3, (uint64_t (*)(uint64_t))Destination.alert.getter);
}

uint64_t sub_2A204()
{
  return 48;
}

__n128 sub_2A210(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 32) = v3;
  *(__n128 *)a2 = result;
  return result;
}

uint64_t sub_2A224(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return keypath_get_9Tm(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t))Optional<A>.stack.getter);
}

uint64_t sub_2A230(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_29CD0(a1, a2, a3, a4, (uint64_t)&associated type descriptor for DestinationInterface.Stack, (uint64_t (*)(char *, uint64_t, uint64_t))Optional<A>.stack.setter);
}

uint64_t sub_2A254()
{
  return 16;
}

__n128 sub_2A260(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_2A26C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return keypath_get_9Tm(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t))Optional<A>.sheet.getter);
}

uint64_t sub_2A278(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_29CD0(a1, a2, a3, a4, (uint64_t)&associated type descriptor for DestinationInterface.Sheet, (uint64_t (*)(char *, uint64_t, uint64_t))Optional<A>.sheet.setter);
}

uint64_t sub_2A29C()
{
  return 16;
}

__n128 sub_2A2A8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_2A2B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return keypath_get_9Tm(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t))Optional<A>.alert.getter);
}

uint64_t keypath_get_9Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v5;
  uint64_t v6;

  v5 = *(_QWORD *)(a3 + a2 - 8);
  v6 = type metadata accessor for Optional(0, *(_QWORD *)(a3 + a2 - 16));
  return a4(v6, v5);
}

uint64_t sub_2A308(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_29CD0(a1, a2, a3, a4, (uint64_t)&associated type descriptor for DestinationInterface.Alert, (uint64_t (*)(char *, uint64_t, uint64_t))Optional<A>.alert.setter);
}

uint64_t sub_2A32C()
{
  return 16;
}

__n128 sub_2A338(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_2A344(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 56);
}

uint64_t sub_2A34C(_QWORD *a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _QWORD v6[3];

  result = swift_checkMetadataState(319, a1[2]);
  if (v3 <= 0x3F)
  {
    v6[0] = *(_QWORD *)(result - 8) + 64;
    result = swift_checkMetadataState(319, a1[3]);
    if (v4 <= 0x3F)
    {
      v6[1] = *(_QWORD *)(result - 8) + 64;
      result = swift_checkMetadataState(319, a1[4]);
      if (v5 <= 0x3F)
      {
        v6[2] = *(_QWORD *)(result - 8) + 64;
        swift_initEnumMetadataMultiPayload(a1, 0, 3, v6);
        return 0;
      }
    }
  }
  return result;
}

uint64_t *sub_2A3F4(uint64_t *a1, uint64_t *a2, _QWORD *a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;

  v3 = a1;
  v4 = *(_QWORD *)(a3[2] - 8);
  v5 = *(_QWORD *)(a3[3] - 8);
  v6 = *(_QWORD *)(v5 + 64);
  if (v6 <= *(_QWORD *)(v4 + 64))
    v6 = *(_QWORD *)(v4 + 64);
  v7 = *(_QWORD *)(a3[4] - 8);
  if (*(_QWORD *)(v7 + 64) <= v6)
    v8 = v6;
  else
    v8 = *(_QWORD *)(v7 + 64);
  v9 = (*(_BYTE *)(v5 + 80) | *(_BYTE *)(v4 + 80) | *(_BYTE *)(v7 + 80));
  if (v9 <= 7
    && v8 + 1 <= 0x18
    && ((*(_DWORD *)(v5 + 80) | *(_DWORD *)(v4 + 80) | *(_DWORD *)(v7 + 80)) & 0x100000) == 0)
  {
    v13 = *((unsigned __int8 *)a2 + v8);
    if (v13 >= 3)
    {
      if (v8 <= 3)
        v14 = v8;
      else
        v14 = 4;
      __asm { BR              X17 }
    }
    if (v13 == 2)
    {
      (*(void (**)(uint64_t *))(v7 + 16))(a1);
      *((_BYTE *)v3 + v8) = 2;
    }
    else if (v13 == 1)
    {
      (*(void (**)(uint64_t *))(v5 + 16))(a1);
      *((_BYTE *)v3 + v8) = 1;
    }
    else
    {
      (*(void (**)(uint64_t *))(v4 + 16))(a1);
      *((_BYTE *)v3 + v8) = 0;
    }
  }
  else
  {
    v12 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v12 + ((v9 + 16) & ~v9));
    swift_retain(v12);
  }
  return v3;
}

uint64_t sub_2A55C(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;

  v2 = a2[3];
  v3 = *(_QWORD *)(a2[2] - 8);
  v4 = *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64);
  if (v4 <= *(_QWORD *)(v3 + 64))
    v4 = *(_QWORD *)(v3 + 64);
  v5 = *(_QWORD *)(a2[4] - 8);
  if (*(_QWORD *)(v5 + 64) > v4)
    v4 = *(_QWORD *)(v5 + 64);
  v6 = *(unsigned __int8 *)(a1 + v4);
  if (v6 < 3)
  {
    if (*(_BYTE *)(a1 + v4))
    {
      if (v6 == 2)
        return (*(uint64_t (**)(void))(v5 + 8))();
      v3 = *(_QWORD *)(v2 - 8);
    }
    return (*(uint64_t (**)(void))(v3 + 8))();
  }
  else
  {
    if (v4 <= 3)
      v7 = v4;
    else
      v7 = 4;
    return ((uint64_t (*)(void))((char *)&loc_2A5C0 + 4 * byte_343D5[v7]))();
  }
}

uint64_t sub_2A628(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unsigned int v11;
  uint64_t v12;
  char v13;

  v4 = a3[2];
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(a3[3] - 8);
  v7 = *(_QWORD *)(v6 + 64);
  if (v7 <= *(_QWORD *)(v5 + 64))
    v7 = *(_QWORD *)(v5 + 64);
  v8 = a3[4];
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_QWORD *)(v9 + 64) <= v7)
    v10 = v7;
  else
    v10 = *(_QWORD *)(v9 + 64);
  v11 = *(unsigned __int8 *)(a2 + v10);
  if (v11 >= 3)
  {
    if (v10 <= 3)
      v12 = v10;
    else
      v12 = 4;
    __asm { BR              X17 }
  }
  if (*(_BYTE *)(a2 + v10))
  {
    if (v11 == 2)
    {
      v13 = 2;
      v6 = *(_QWORD *)(v8 - 8);
    }
    else
    {
      v13 = 1;
    }
  }
  else
  {
    v13 = 0;
    v6 = *(_QWORD *)(v4 - 8);
  }
  (*(void (**)(uint64_t))(v6 + 16))(a1);
  *(_BYTE *)(a1 + v10) = v13;
  return a1;
}

uint64_t sub_2A734(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  char v19;

  if (a1 != a2)
  {
    v5 = a3[2];
    v6 = a3[3];
    v7 = *(_QWORD *)(v5 - 8);
    v8 = *(_QWORD *)(v7 + 64);
    v9 = *(_QWORD *)(v6 - 8);
    if (*(_QWORD *)(v9 + 64) > v8)
      v8 = *(_QWORD *)(v9 + 64);
    v10 = a3[4];
    v11 = *(_QWORD *)(v10 - 8);
    if (*(_QWORD *)(v11 + 64) <= v8)
      v12 = v8;
    else
      v12 = *(_QWORD *)(v11 + 64);
    v13 = *(unsigned __int8 *)(a1 + v12);
    if (v13 >= 3)
    {
      if (v12 <= 3)
        v14 = v12;
      else
        v14 = 4;
      __asm { BR              X12 }
    }
    v15 = *(_QWORD *)(v5 - 8);
    v16 = a3[2];
    if (*(_BYTE *)(a1 + v12))
    {
      v15 = *(_QWORD *)(v10 - 8);
      v16 = a3[4];
      if (v13 != 2)
      {
        v15 = *(_QWORD *)(v6 - 8);
        v16 = a3[3];
      }
    }
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a1, v16);
    v17 = *(unsigned __int8 *)(a2 + v12);
    if (v17 >= 3)
    {
      if (v12 <= 3)
        v18 = v12;
      else
        v18 = 4;
      __asm { BR              X12 }
    }
    if (*(_BYTE *)(a2 + v12))
    {
      if (v17 == 2)
      {
        v19 = 2;
        v7 = v11;
        v5 = v10;
      }
      else
      {
        v19 = 1;
        v7 = v9;
        v5 = v6;
      }
    }
    else
    {
      v19 = 0;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(a1, a2, v5);
    *(_BYTE *)(a1 + v12) = v19;
  }
  return a1;
}

uint64_t sub_2A908(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unsigned int v11;
  uint64_t v12;
  char v13;

  v4 = a3[2];
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(a3[3] - 8);
  v7 = *(_QWORD *)(v6 + 64);
  if (v7 <= *(_QWORD *)(v5 + 64))
    v7 = *(_QWORD *)(v5 + 64);
  v8 = a3[4];
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_QWORD *)(v9 + 64) <= v7)
    v10 = v7;
  else
    v10 = *(_QWORD *)(v9 + 64);
  v11 = *(unsigned __int8 *)(a2 + v10);
  if (v11 >= 3)
  {
    if (v10 <= 3)
      v12 = v10;
    else
      v12 = 4;
    __asm { BR              X17 }
  }
  if (*(_BYTE *)(a2 + v10))
  {
    if (v11 == 2)
    {
      v13 = 2;
      v6 = *(_QWORD *)(v8 - 8);
    }
    else
    {
      v13 = 1;
    }
  }
  else
  {
    v13 = 0;
    v6 = *(_QWORD *)(v4 - 8);
  }
  (*(void (**)(uint64_t))(v6 + 32))(a1);
  *(_BYTE *)(a1 + v10) = v13;
  return a1;
}

uint64_t sub_2AA14(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  char v19;

  if (a1 != a2)
  {
    v5 = a3[2];
    v6 = a3[3];
    v7 = *(_QWORD *)(v5 - 8);
    v8 = *(_QWORD *)(v7 + 64);
    v9 = *(_QWORD *)(v6 - 8);
    if (*(_QWORD *)(v9 + 64) > v8)
      v8 = *(_QWORD *)(v9 + 64);
    v10 = a3[4];
    v11 = *(_QWORD *)(v10 - 8);
    if (*(_QWORD *)(v11 + 64) <= v8)
      v12 = v8;
    else
      v12 = *(_QWORD *)(v11 + 64);
    v13 = *(unsigned __int8 *)(a1 + v12);
    if (v13 >= 3)
    {
      if (v12 <= 3)
        v14 = v12;
      else
        v14 = 4;
      __asm { BR              X12 }
    }
    v15 = *(_QWORD *)(v5 - 8);
    v16 = a3[2];
    if (*(_BYTE *)(a1 + v12))
    {
      v15 = *(_QWORD *)(v10 - 8);
      v16 = a3[4];
      if (v13 != 2)
      {
        v15 = *(_QWORD *)(v6 - 8);
        v16 = a3[3];
      }
    }
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a1, v16);
    v17 = *(unsigned __int8 *)(a2 + v12);
    if (v17 >= 3)
    {
      if (v12 <= 3)
        v18 = v12;
      else
        v18 = 4;
      __asm { BR              X12 }
    }
    if (*(_BYTE *)(a2 + v12))
    {
      if (v17 == 2)
      {
        v19 = 2;
        v7 = v11;
        v5 = v10;
      }
      else
      {
        v19 = 1;
        v7 = v9;
        v5 = v6;
      }
    }
    else
    {
      v19 = 0;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(a1, a2, v5);
    *(_BYTE *)(a1 + v12) = v19;
  }
  return a1;
}

uint64_t sub_2ABE8(uint64_t a1, unsigned int a2, _QWORD *a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  char v6;
  int v7;
  unsigned int v9;
  int v10;
  unsigned int v11;

  v3 = *(_QWORD *)(*(_QWORD *)(a3[2] - 8) + 64);
  if (*(_QWORD *)(*(_QWORD *)(a3[3] - 8) + 64) > v3)
    v3 = *(_QWORD *)(*(_QWORD *)(a3[3] - 8) + 64);
  v4 = *(_QWORD *)(*(_QWORD *)(a3[4] - 8) + 64);
  if (v4 <= v3)
    v4 = v3;
  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_23;
  v5 = v4 + 1;
  v6 = 8 * (v4 + 1);
  if ((v4 + 1) <= 3)
  {
    v9 = ((a2 + ~(-1 << v6) - 253) >> v6) + 1;
    if (HIWORD(v9))
    {
      v7 = *(_DWORD *)(a1 + v5);
      if (!v7)
        goto LABEL_23;
      goto LABEL_16;
    }
    if (v9 > 0xFF)
    {
      v7 = *(unsigned __int16 *)(a1 + v5);
      if (!*(_WORD *)(a1 + v5))
        goto LABEL_23;
      goto LABEL_16;
    }
    if (v9 < 2)
    {
LABEL_23:
      v11 = *(unsigned __int8 *)(a1 + v4);
      if (v11 >= 3)
        return (v11 ^ 0xFF) + 1;
      else
        return 0;
    }
  }
  v7 = *(unsigned __int8 *)(a1 + v5);
  if (!*(_BYTE *)(a1 + v5))
    goto LABEL_23;
LABEL_16:
  v10 = (v7 - 1) << v6;
  if (v5 > 3)
    v10 = 0;
  if (!(_DWORD)v5)
    return (v10 + 254);
  if (v5 > 3)
    LODWORD(v5) = 4;
  return ((uint64_t (*)(void))((char *)&loc_2ACC4 + 4 * byte_343F8[(v5 - 1)]))();
}

void sub_2AD10(_WORD *a1, unsigned int a2, unsigned int a3, _QWORD *a4)
{
  unint64_t v5;
  size_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a4[2] - 8) + 64);
  if (*(_QWORD *)(*(_QWORD *)(a4[3] - 8) + 64) > v5)
    v5 = *(_QWORD *)(*(_QWORD *)(a4[3] - 8) + 64);
  if (*(_QWORD *)(*(_QWORD *)(a4[4] - 8) + 64) > v5)
    v5 = *(_QWORD *)(*(_QWORD *)(a4[4] - 8) + 64);
  v6 = v5 + 1;
  if (a3 < 0xFE)
  {
    v7 = 0;
  }
  else if (v6 <= 3)
  {
    v9 = ((a3 + ~(-1 << (8 * v6)) - 253) >> (8 * v6)) + 1;
    if (HIWORD(v9))
    {
      v7 = &dword_4;
    }
    else if (v9 >= 0x100)
    {
      v7 = 2;
    }
    else
    {
      v7 = v9 > 1;
    }
  }
  else
  {
    v7 = &dword_0 + 1;
  }
  if (a2 <= 0xFD)
    __asm { BR              X11 }
  v8 = a2 - 254;
  if (v6 < 4)
  {
    if ((_DWORD)v5 != -1)
    {
      v10 = v8 & ~(-1 << (8 * v6));
      bzero(a1, v6);
      if ((_DWORD)v6 == 3)
      {
        *a1 = v10;
        *((_BYTE *)a1 + 2) = BYTE2(v10);
      }
      else if ((_DWORD)v6 == 2)
      {
        *a1 = v10;
      }
      else
      {
        *(_BYTE *)a1 = v10;
      }
    }
  }
  else
  {
    bzero(a1, v5 + 1);
    *(_DWORD *)a1 = v8;
  }
  __asm { BR              X10 }
}

uint64_t sub_2AED0(uint64_t a1, _QWORD *a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a2[2] - 8) + 64);
  if (*(_QWORD *)(*(_QWORD *)(a2[3] - 8) + 64) > v2)
    v2 = *(_QWORD *)(*(_QWORD *)(a2[3] - 8) + 64);
  v3 = *(_QWORD *)(*(_QWORD *)(a2[4] - 8) + 64);
  if (v3 <= v2)
    v3 = v2;
  if (*(unsigned __int8 *)(a1 + v3) < 3u)
    return *(unsigned __int8 *)(a1 + v3);
  if (v3 <= 3)
    v4 = v3;
  else
    v4 = 4;
  return ((uint64_t (*)(void))((char *)&loc_2AF30 + 4 * byte_34406[v4]))();
}

void sub_2AF78(_BYTE *a1, unsigned int a2, _QWORD *a3)
{
  size_t v4;
  size_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;

  v4 = *(_QWORD *)(*(_QWORD *)(a3[3] - 8) + 64);
  if (a2 > 2)
  {
    if (v4 <= *(_QWORD *)(*(_QWORD *)(a3[2] - 8) + 64))
      v4 = *(_QWORD *)(*(_QWORD *)(a3[2] - 8) + 64);
    if (*(_QWORD *)(*(_QWORD *)(a3[4] - 8) + 64) <= v4)
      v5 = v4;
    else
      v5 = *(_QWORD *)(*(_QWORD *)(a3[4] - 8) + 64);
    v6 = a2 - 3;
    if (v5 < 4)
    {
      v7 = v6 >> (8 * v5);
      v8 = v6 & ~(-1 << (8 * v5));
      a1[v5] = v7 + 3;
      bzero(a1, v5);
      if ((_DWORD)v5 == 3)
      {
        *(_WORD *)a1 = v8;
        a1[2] = BYTE2(v8);
      }
      else if ((_DWORD)v5 == 2)
      {
        *(_WORD *)a1 = v8;
      }
      else
      {
        *a1 = v8;
      }
    }
    else
    {
      a1[v5] = 3;
      bzero(a1, v5);
      *(_DWORD *)a1 = v6;
    }
  }
  else
  {
    if (v4 <= *(_QWORD *)(*(_QWORD *)(a3[2] - 8) + 64))
      v4 = *(_QWORD *)(*(_QWORD *)(a3[2] - 8) + 64);
    if (*(_QWORD *)(*(_QWORD *)(a3[4] - 8) + 64) > v4)
      v4 = *(_QWORD *)(*(_QWORD *)(a3[4] - 8) + 64);
    a1[v4] = a2;
  }
}

uint64_t dispatch thunk of DestinationInterface.stack.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of DestinationInterface.stack.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of DestinationInterface.stack.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of DestinationInterface.sheet.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of DestinationInterface.sheet.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of DestinationInterface.sheet.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of DestinationInterface.alert.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of DestinationInterface.alert.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

uint64_t dispatch thunk of DestinationInterface.alert.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 96))();
}

uint64_t PeopleListPersonRow.State.ID.rawValue.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain(v0[1]);
  return v1;
}

uint64_t AppMainView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  char v5;
  uint64_t v6;

  v2 = LocalizedStringKey.init(stringLiteral:)(0x566E69614D707041, 0xEB00000000776569);
  result = Text.init(_:tableName:bundle:comment:)(v2);
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5 & 1;
  *(_QWORD *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_2B170(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &opaque type descriptor for <<opaque return type of AppMainView.body>>, 1);
}

uint64_t sub_2B180@<X0>(uint64_t a1@<X8>)
{
  return AppMainView.body.getter(a1);
}

_QWORD *initializeBufferWithCopyOfBuffer for FindMyAppCoreTester(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t destroy for FindMyAppCoreTester(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
}

_QWORD *assignWithCopy for FindMyAppCoreTester(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = *a2;
  v3 = a2[1];
  v4 = a1[1];
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRelease(v4);
  return a1;
}

_QWORD *assignWithTake for FindMyAppCoreTester(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for FindMyAppCoreTester(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for FindMyAppCoreTester(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for FindMyAppCoreTester()
{
  return &type metadata for FindMyAppCoreTester;
}

ValueMetadata *type metadata accessor for AppMainView()
{
  return &type metadata for AppMainView;
}

uint64_t PeopleListPersonRow.init(state:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2B674(a1, a2, type metadata accessor for PeopleListPersonRow.State);
}

uint64_t type metadata accessor for PeopleListPersonRow.State(uint64_t a1)
{
  return sub_18808(a1, (uint64_t *)&unk_419D0, (uint64_t)&nominal type descriptor for PeopleListPersonRow.State);
}

uint64_t PeopleListPersonRow.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  unint64_t v28;
  int *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t result;
  uint64_t (**v33)();
  uint64_t v34;
  uint64_t (**v35)@<X0>(uint64_t@<X8>);
  uint64_t (**v36)();
  uint64_t (**v37)@<X0>(uint64_t *@<X8>);
  char *(**v38)();
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v2 = v1;
  v4 = type metadata accessor for Font.TextStyle(0);
  v42 = *(_QWORD *)(v4 - 8);
  v43 = v4;
  __chkstk_darwin(v4);
  v41 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for PeopleListPersonRow(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  v9 = __chkstk_darwin(v6);
  v10 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v39 - v12;
  v14 = __chkstk_darwin(v11);
  v16 = (char *)&v39 - v15;
  __chkstk_darwin(v14);
  v18 = (char *)&v39 - v17;
  sub_2DE0C(v2, (uint64_t)&v39 - v17, type metadata accessor for PeopleListPersonRow);
  v19 = *(unsigned __int8 *)(v7 + 80);
  v20 = (v19 + 16) & ~v19;
  v21 = v20 + v8;
  v22 = v19 | 7;
  v40 = swift_allocObject(&unk_3E4A8, v21, v19 | 7);
  sub_2B674((uint64_t)v18, v40 + v20, type metadata accessor for PeopleListPersonRow);
  sub_2DE0C(v2, (uint64_t)v16, type metadata accessor for PeopleListPersonRow);
  v23 = swift_allocObject(&unk_3E4D0, v21, v22);
  sub_2B674((uint64_t)v16, v23 + v20, type metadata accessor for PeopleListPersonRow);
  sub_2DE0C(v2, (uint64_t)v13, type metadata accessor for PeopleListPersonRow);
  v24 = swift_allocObject(&unk_3E4F8, v21, v22);
  sub_2B674((uint64_t)v13, v24 + v20, type metadata accessor for PeopleListPersonRow);
  sub_2DE0C(v2, (uint64_t)v10, type metadata accessor for PeopleListPersonRow);
  v25 = swift_allocObject(&unk_3E520, v21, v22);
  sub_2B674((uint64_t)v10, v25 + v20, type metadata accessor for PeopleListPersonRow);
  sub_2DE0C(v2, (uint64_t)v10, type metadata accessor for PeopleListPersonRow);
  v26 = swift_allocObject(&unk_3E548, v21, v22);
  sub_2B674((uint64_t)v10, v26 + v20, type metadata accessor for PeopleListPersonRow);
  v44 = 0x4043000000000000;
  v27 = v41;
  (*(void (**)(char *, _QWORD, uint64_t))(v42 + 104))(v41, enum case for Font.TextStyle.headline(_:), v43);
  v28 = sub_23F08();
  ScaledMetric.init(wrappedValue:relativeTo:)(&v44, v27, &type metadata for CGFloat, v28);
  v29 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_41888);
  v30 = (_QWORD *)(a1 + v29[21]);
  *v30 = swift_getKeyPath(&unk_34610);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_41600);
  result = swift_storeEnumTagMultiPayload(v30, v31, 0);
  v33 = (uint64_t (**)())(a1 + v29[22]);
  v34 = v40;
  *v33 = sub_2B6B8;
  v33[1] = (uint64_t (*)())v34;
  v35 = (uint64_t (**)@<X0>(uint64_t@<X8>))(a1 + v29[23]);
  *v35 = sub_2BAF0;
  v35[1] = (uint64_t (*)@<X0>(uint64_t@<X8>))v23;
  v36 = (uint64_t (**)())(a1 + v29[24]);
  *v36 = sub_2BB30;
  v36[1] = (uint64_t (*)())v24;
  v37 = (uint64_t (**)@<X0>(uint64_t *@<X8>))(a1 + v29[25]);
  *v37 = sub_2C398;
  v37[1] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v25;
  v38 = (char *(**)())(a1 + v29[26]);
  *v38 = sub_2C7C4;
  v38[1] = (char *(*)())v26;
  return result;
}

uint64_t type metadata accessor for PeopleListPersonRow(uint64_t a1)
{
  return sub_18808(a1, qword_41940, (uint64_t)&nominal type descriptor for PeopleListPersonRow);
}

uint64_t type metadata accessor for PeopleListPersonRow.State.RelativeDateOrString(uint64_t a1)
{
  return sub_18808(a1, qword_41AB0, (uint64_t)&nominal type descriptor for PeopleListPersonRow.State.RelativeDateOrString);
}

uint64_t sub_2B674(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2B6B8()
{
  return sub_2BB3C((uint64_t (*)(void))sub_2B6C4);
}

uint64_t sub_2B6C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[2];
  uint64_t v24;
  uint64_t v25;

  v23[1] = a1;
  v2 = type metadata accessor for BadgeOffsetStyle(0);
  v24 = *(_QWORD *)(v2 - 8);
  v25 = v2;
  __chkstk_darwin(v2);
  v4 = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for PlatterWithIcon.Style(0);
  __chkstk_darwin(v5);
  v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for PlatterWithIcon.Icon(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (_QWORD *)((char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = type metadata accessor for PlatterWithIcon(0);
  v23[0] = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v14 = (char *)v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for PeopleListPersonRow.State(0);
  v16 = *(void **)(v1 + *(int *)(v15 + 40));
  *v11 = v16;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v9 + 104))(v11, enum case for PlatterWithIcon.Icon.avatar(_:), v8);
  static PlatterWithIcon.Style.listLeadingIcon()(v16);
  v17 = PlatterWithIcon.init(icon:style:)(v11, v7);
  v18 = v1 + *(int *)(v15 + 36);
  v19 = static BadgeOffsetStyle.bottomTrailing.getter(v17);
  v20 = static Font.headline.getter(v19);
  v21 = sub_19D7C(&qword_41B78, (uint64_t (*)(uint64_t))&type metadata accessor for PlatterWithIcon, (uint64_t)&protocol conformance descriptor for PlatterWithIcon);
  View.badge(_:offsetStyle:supportsDynamicSize:badgeIconFont:showsCutout:)(v18, v4, 1, v20, 1, v12, v21);
  swift_release(v20);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v4, v25);
  return (*(uint64_t (**)(char *, uint64_t))(v23[0] + 8))(v14, v12);
}

uint64_t sub_2B8C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t result;
  uint64_t v6;
  char v7;
  uint64_t v8;
  _QWORD v9[2];

  v3 = *(_QWORD *)(a1 + 24);
  v9[0] = *(_QWORD *)(a1 + 16);
  v9[1] = v3;
  v4 = sub_19F28();
  swift_bridgeObjectRetain(v3);
  result = Text.init<A>(_:)(v9, &type metadata for String, v4);
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v6;
  *(_BYTE *)(a2 + 16) = v7 & 1;
  *(_QWORD *)(a2 + 24) = v8;
  return result;
}

uint64_t objectdestroyTm_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t MyRelativeDate;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int (*v17)(uint64_t, uint64_t, uint64_t);
  uint64_t v18;

  v1 = *(_QWORD *)(type metadata accessor for PeopleListPersonRow(0) - 8);
  v2 = *(unsigned __int8 *)(v1 + 80);
  v3 = (v2 + 16) & ~v2;
  v4 = *(_QWORD *)(v1 + 64);
  v5 = v0 + v3;
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 24));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v3 + 40));
  v6 = (int *)type metadata accessor for PeopleListPersonRow.State(0);
  v7 = v0 + v3 + v6[7];
  v8 = type metadata accessor for PeopleListPersonRow.State.RelativeDateOrString(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(v7, 1, v8))
  {
    if (swift_getEnumCaseMultiPayload(v7, v8) == 1)
    {
      swift_bridgeObjectRelease(*(_QWORD *)(v7 + 8));
    }
    else
    {
      MyRelativeDate = type metadata accessor for FindMyRelativeDate(0);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MyRelativeDate - 8) + 8))(v7, MyRelativeDate);
    }
  }
  v10 = *(_QWORD *)(v5 + v6[8] + 8);
  if (v10 != 1)
    swift_bridgeObjectRelease(v10);
  v11 = v5 + v6[9];
  v12 = type metadata accessor for Badge(0);
  v13 = *(_QWORD *)(v12 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);

  v14 = v5 + v6[11];
  v15 = type metadata accessor for GenericControl.Info(0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48);
  if (!v17(v14, 1, v15))
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v15);
  v18 = v5 + v6[12];
  if (!v17(v18, 1, v15))
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v18, v15);
  return swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_2BAF0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for PeopleListPersonRow(0) - 8) + 80);
  return sub_2B8C0(v1 + ((v3 + 16) & ~v3), a1);
}

uint64_t sub_2BB30()
{
  return sub_2BB3C((uint64_t (*)(void))sub_2BB88);
}

uint64_t sub_2BB3C(uint64_t (*a1)(void))
{
  type metadata accessor for PeopleListPersonRow(0);
  return a1();
}

uint64_t sub_2BB88@<X0>(uint64_t a1@<X8>)
{
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  unint64_t v32;
  int EnumCaseMultiPayload;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  char *v83;
  char *v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  char *v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  char *v105;
  uint64_t MyRelativeDateFormat;
  char *v107;
  char *v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t MyRelativeDate;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;

  v121 = a1;
  v120 = __swift_instantiateConcreteTypeFromMangledName(&qword_41B50);
  __chkstk_darwin(v120);
  v3 = (char *)&v101 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_41B58);
  __chkstk_darwin(v118);
  v119 = (uint64_t *)((char *)&v101 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = type metadata accessor for PeopleListPersonRow(0);
  v109 = *(_QWORD *)(v5 - 8);
  v6 = *(_QWORD *)(v109 + 64);
  __chkstk_darwin(v5);
  v111 = (uint64_t)&v101 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for FormatStyleCapitalizationContext(0);
  __chkstk_darwin(v7);
  v110 = (char *)&v101 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MyRelativeDateFormat = type metadata accessor for FindMyRelativeDateFormatStyle.DisplayStyle(0);
  v104 = *(_QWORD *)(MyRelativeDateFormat - 8);
  __chkstk_darwin(MyRelativeDateFormat);
  v107 = (char *)&v101 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v117 = type metadata accessor for RelativeDateText(0);
  v114 = *(_QWORD *)(v117 - 8);
  __chkstk_darwin(v117);
  v113 = (char *)&v101 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MyRelativeDate = type metadata accessor for FindMyRelativeDate(0);
  v115 = *(_QWORD *)(MyRelativeDate - 8);
  v11 = __chkstk_darwin(MyRelativeDate);
  v105 = (char *)&v101 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v108 = (char *)&v101 - v13;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_41B60);
  __chkstk_darwin(v14);
  v116 = (char *)&v101 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_41890);
  __chkstk_darwin(v16);
  v18 = (char *)&v101 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for PeopleListPersonRow.State.RelativeDateOrString(0);
  v20 = *(_QWORD *)(v19 - 8);
  v21 = __chkstk_darwin(v19);
  v23 = (uint64_t *)((char *)&v101 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v21);
  v25 = (char *)&v101 - v24;
  v26 = type metadata accessor for PeopleListPersonRow.State(0);
  sub_1A1D4(v1 + *(int *)(v26 + 28), (uint64_t)v18, &qword_41890);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19) == 1)
  {
    sub_1A198((uint64_t)v18, &qword_41890);
    v27 = *(_QWORD *)(v1 + 40);
    v122 = *(_QWORD *)(v1 + 32);
    v123 = v27;
    v28 = sub_19F28();
    swift_bridgeObjectRetain(v27);
    *(_QWORD *)v3 = Text.init<A>(_:)(&v122, &type metadata for String, v28);
    *((_QWORD *)v3 + 1) = v29;
    v3[16] = v30 & 1;
    *((_QWORD *)v3 + 3) = v31;
    swift_storeEnumTagMultiPayload(v3, v120, 1);
    v32 = sub_3229C();
    return _ConditionalContent<>.init(storage:)(v3, v14, &type metadata for Text, v32, &protocol witness table for Text);
  }
  else
  {
    v102 = v14;
    v103 = v3;
    sub_2B674((uint64_t)v18, (uint64_t)v25, type metadata accessor for PeopleListPersonRow.State.RelativeDateOrString);
    sub_2DE0C((uint64_t)v25, (uint64_t)v23, type metadata accessor for PeopleListPersonRow.State.RelativeDateOrString);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v23, v19);
    v101 = v25;
    if (EnumCaseMultiPayload == 1)
    {
      v35 = v23[1];
      v114 = *v23;
      v115 = v35;
      v36 = *(_QWORD *)(v1 + 32);
      v37 = *(_QWORD *)(v1 + 40);
      v122 = v36;
      v123 = v37;
      v38 = sub_19F28();
      v113 = (char *)v38;
      swift_bridgeObjectRetain(v37);
      v39 = Text.init<A>(_:)(&v122, &type metadata for String, v38);
      v41 = v40;
      v43 = v42;
      v45 = v44 & 1;
      v46 = LocalizedStringKey.init(stringLiteral:)(0x20A280E220, 0xA500000000000000);
      v47 = Text.init(_:tableName:bundle:comment:)(v46);
      v49 = v48;
      v51 = v50;
      v53 = v52 & 1;
      v54 = static Text.+ infix(_:_:)(v39, v41, v45, v43, v47, v48, v53, v50, v101, v102);
      v111 = v55;
      MyRelativeDate = v54;
      v57 = v56;
      v110 = v56;
      v59 = v58 & 1;
      LODWORD(v109) = v58 & 1;
      sub_1C984(v47, v49, v53);
      swift_bridgeObjectRelease(v51);
      sub_1C984(v39, v41, v45);
      swift_bridgeObjectRelease(v43);
      v122 = v114;
      v123 = v115;
      v60 = Text.init<A>(_:)(&v122, &type metadata for String, v113);
      v62 = v61;
      v64 = v63;
      v66 = v65 & 1;
      v67 = v111;
      v68 = MyRelativeDate;
      v69 = static Text.+ infix(_:_:)(MyRelativeDate, v111, v59, v57, v60, v61, v66, v63, v101, v102);
      v71 = v70;
      LOBYTE(v39) = v72;
      v74 = v73;
      sub_1C984(v60, v62, v66);
      swift_bridgeObjectRelease(v64);
      sub_1C984(v68, v67, v109);
      swift_bridgeObjectRelease(v110);
      v75 = v118;
      v76 = v119;
      *v119 = v69;
      v76[1] = v71;
      *((_BYTE *)v76 + 16) = v39 & 1;
      v76[3] = v74;
      v77 = (uint64_t)v101;
      swift_storeEnumTagMultiPayload(v76, v75, 1);
      v78 = sub_19D7C(&qword_41B70, (uint64_t (*)(uint64_t))&type metadata accessor for RelativeDateText, (uint64_t)&protocol conformance descriptor for RelativeDateText);
      v79 = (uint64_t)v116;
      _ConditionalContent<>.init(storage:)(v76, v117, &type metadata for Text, v78, &protocol witness table for Text);
    }
    else
    {
      v80 = v115;
      v81 = v108;
      v82 = MyRelativeDate;
      (*(void (**)(char *, uint64_t *, uint64_t))(v115 + 32))(v108, v23, MyRelativeDate);
      v83 = v105;
      (*(void (**)(char *, char *, uint64_t))(v80 + 16))(v105, v81, v82);
      v84 = v107;
      v85 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v104 + 104))(v107, enum case for FindMyRelativeDateFormatStyle.DisplayStyle.concise(_:), MyRelativeDateFormat);
      v86 = v110;
      static FormatStyleCapitalizationContext.beginningOfSentence.getter(v85);
      v87 = v111;
      sub_2DE0C(v1, v111, type metadata accessor for PeopleListPersonRow);
      v88 = *(unsigned __int8 *)(v109 + 80);
      v89 = (v88 + 16) & ~v88;
      v90 = swift_allocObject(&unk_3E700, v89 + v6, v88 | 7);
      sub_2B674(v87, v90 + v89, type metadata accessor for PeopleListPersonRow);
      v91 = v113;
      RelativeDateText.init(forcingPastDate:displayStyle:capitalizationContext:localizerContainer:)(v83, v84, v86, sub_32324, v90);
      v92 = v114;
      v93 = v119;
      v94 = v117;
      (*(void (**)(uint64_t *, char *, uint64_t))(v114 + 16))(v119, v91, v117);
      swift_storeEnumTagMultiPayload(v93, v118, 0);
      v95 = sub_19D7C(&qword_41B70, (uint64_t (*)(uint64_t))&type metadata accessor for RelativeDateText, (uint64_t)&protocol conformance descriptor for RelativeDateText);
      v79 = (uint64_t)v116;
      _ConditionalContent<>.init(storage:)(v93, v94, &type metadata for Text, v95, &protocol witness table for Text);
      (*(void (**)(char *, uint64_t))(v92 + 8))(v91, v94);
      v96 = v81;
      v77 = (uint64_t)v101;
      (*(void (**)(char *, uint64_t))(v115 + 8))(v96, v82);
    }
    v97 = v120;
    v98 = (uint64_t)v103;
    v99 = v102;
    sub_1A1D4(v79, (uint64_t)v103, &qword_41B60);
    swift_storeEnumTagMultiPayload(v98, v97, 0);
    v100 = sub_3229C();
    _ConditionalContent<>.init(storage:)(v98, v99, &type metadata for Text, v100, &protocol witness table for Text);
    sub_1A198(v79, &qword_41B60);
    return sub_2E0D4(v77);
  }
}

uint64_t sub_2C398@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for PeopleListPersonRow(0) - 8) + 80);
  v4 = (uint64_t *)(v1 + *(int *)(type metadata accessor for PeopleListPersonRow.State(0) + 32) + ((v3 + 16) & ~v3));
  v5 = *v4;
  v6 = v4[1];
  if (v6 == 1)
    v7 = 0;
  else
    v7 = *v4;
  *a1 = v7;
  a1[1] = v6;
  return sub_2DB8C(v5, v6);
}

char *sub_2C3F8(uint64_t a1)
{
  uint64_t v2;
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
  uint64_t (*v24)(char *, uint64_t, uint64_t);
  int v25;
  char *v26;
  uint64_t v27;
  void (*v28)(char *, char *, uint64_t);
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  void (*v32)(char *, char *, uint64_t);
  char *v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;

  v2 = type metadata accessor for GenericControl.Info(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v43 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v7 = (char *)&v38 - v6;
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_418A0);
  v8 = *(_QWORD *)(v42 - 8);
  v9 = __chkstk_darwin(v42);
  v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)&v38 - v12;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_41B40);
  v15 = *(_QWORD *)(v8 + 72);
  v16 = *(unsigned __int8 *)(v8 + 80);
  v17 = (v16 + 32) & ~v16;
  v18 = swift_allocObject(v14, v17 + 2 * v15, v16 | 7);
  *(_OWORD *)(v18 + 16) = xmmword_33780;
  v39 = v18;
  v19 = v18 + v17;
  v20 = type metadata accessor for PeopleListPersonRow.State(0);
  sub_1A1D4(a1 + *(int *)(v20 + 44), v19, &qword_418A0);
  v21 = v19 + v15;
  sub_1A1D4(a1 + *(int *)(v20 + 48), v21, &qword_418A0);
  v40 = v19;
  v22 = v19;
  v23 = v2;
  sub_1A1D4(v22, (uint64_t)v13, &qword_418A0);
  sub_1A154((uint64_t)v13, (uint64_t)v11, &qword_418A0);
  v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 48);
  v25 = v24(v11, 1, v2);
  v41 = v3;
  if (v25 == 1)
  {
    sub_1A198((uint64_t)v11, &qword_418A0);
    v26 = (char *)_swiftEmptyArrayStorage;
    v27 = v42;
  }
  else
  {
    v38 = v21;
    v28 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
    v28(v7, v11, v2);
    v28(v43, v7, v2);
    v26 = (char *)_swiftEmptyArrayStorage;
    if ((swift_isUniquelyReferenced_nonNull_native(_swiftEmptyArrayStorage) & 1) == 0)
      v26 = (char *)sub_2DBA0(0, _swiftEmptyArrayStorage[2] + 1, 1, (unint64_t)_swiftEmptyArrayStorage);
    v30 = *((_QWORD *)v26 + 2);
    v29 = *((_QWORD *)v26 + 3);
    if (v30 >= v29 >> 1)
      v26 = (char *)sub_2DBA0(v29 > 1, v30 + 1, 1, (unint64_t)v26);
    *((_QWORD *)v26 + 2) = v30 + 1;
    v28(&v26[((*(unsigned __int8 *)(v41 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80))+ *(_QWORD *)(v41 + 72) * v30], v43, v2);
    v27 = v42;
    v21 = v38;
  }
  sub_1A1D4(v21, (uint64_t)v13, &qword_418A0);
  sub_1A154((uint64_t)v13, (uint64_t)v11, &qword_418A0);
  if (v24(v11, 1, v23) == 1)
  {
    sub_1A198((uint64_t)v11, &qword_418A0);
  }
  else
  {
    v31 = v41;
    v32 = *(void (**)(char *, char *, uint64_t))(v41 + 32);
    v32(v7, v11, v23);
    v33 = v43;
    v32(v43, v7, v23);
    if ((swift_isUniquelyReferenced_nonNull_native(v26) & 1) == 0)
      v26 = (char *)sub_2DBA0(0, *((_QWORD *)v26 + 2) + 1, 1, (unint64_t)v26);
    v35 = *((_QWORD *)v26 + 2);
    v34 = *((_QWORD *)v26 + 3);
    if (v35 >= v34 >> 1)
      v26 = (char *)sub_2DBA0(v34 > 1, v35 + 1, 1, (unint64_t)v26);
    *((_QWORD *)v26 + 2) = v35 + 1;
    v32(&v26[((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80))+ *(_QWORD *)(v31 + 72) * v35], v33, v23);
  }
  v36 = v39;
  swift_setDeallocating(v39);
  swift_arrayDestroy(v40, *(_QWORD *)(v36 + 16), v27);
  swift_deallocClassInstance(v36, 32, 7);
  return v26;
}

char *sub_2C7C4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for PeopleListPersonRow(0) - 8) + 80);
  return sub_2C3F8(v0 + ((v1 + 16) & ~v1));
}

uint64_t sub_2C7F0(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v38[2];

  v5 = *(_QWORD *)(a5 + 40);
  v38[0] = *(_QWORD *)(a5 + 32);
  v38[1] = v5;
  v6 = sub_19F28();
  swift_bridgeObjectRetain(v5);
  v7 = Text.init<A>(_:)(v38, &type metadata for String, v6);
  v9 = v8;
  v11 = v10;
  v33 = v10;
  v13 = v12 & 1;
  v14 = LocalizedStringKey.init(stringLiteral:)(0x20A280E220, 0xA500000000000000);
  v15 = Text.init(_:tableName:bundle:comment:)(v14);
  v17 = v16;
  v19 = v18;
  v21 = v20 & 1;
  v22 = static Text.+ infix(_:_:)(v7, v9, v13, v11, v15, v16, v21, v18, 0, 256);
  v24 = v23;
  v26 = v25;
  v28 = v27 & 1;
  sub_1C984(v15, v17, v21);
  swift_bridgeObjectRelease(v19);
  sub_1C984(v7, v9, SBYTE4(v32));
  swift_bridgeObjectRelease(v33);
  v29 = static Text.+ infix(_:_:)(v22, v24, v28, v26, a1, a2, a3 & 1, a4, v31, v32);
  sub_1C984(v22, v24, v28);
  swift_bridgeObjectRelease(v26);
  return v29;
}

uint64_t sub_2C988()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  _QWORD v17[2];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_41AF0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_41AF8);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = v0[1];
  if (v9)
  {
    v17[0] = *v0;
    v17[1] = v9;
    v10 = sub_19F28();
    swift_bridgeObjectRetain(v9);
    *(_QWORD *)v8 = Text.init<A>(_:)(v17, &type metadata for String, v10);
    *((_QWORD *)v8 + 1) = v11;
    v8[16] = v12 & 1;
    *((_QWORD *)v8 + 3) = v13;
    swift_storeEnumTagMultiPayload(v8, v5, 0);
    v14 = sub_1A114(&qword_41B00, &qword_41AF0, (uint64_t)&protocol conformance descriptor for ProgressView<A, B>);
    return _ConditionalContent<>.init(storage:)(v8, &type metadata for Text, v1, &protocol witness table for Text, v14);
  }
  else
  {
    ProgressView<>.init<>()(v6);
    (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v8, v4, v1);
    swift_storeEnumTagMultiPayload(v8, v5, 1);
    v16 = sub_1A114(&qword_41B00, &qword_41AF0, (uint64_t)&protocol conformance descriptor for ProgressView<A, B>);
    _ConditionalContent<>.init(storage:)(v8, &type metadata for Text, v1, &protocol witness table for Text, v16);
    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
}

uint64_t PeopleListPersonRow.State.id.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain(v2);
}

uint64_t PeopleListPersonRow.State.title.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain(*(_QWORD *)(v0 + 24));
  return v1;
}

uint64_t PeopleListPersonRow.State.subtitle.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain(*(_QWORD *)(v0 + 40));
  return v1;
}

uint64_t PeopleListPersonRow.State.subtitleExtra.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for PeopleListPersonRow.State(0);
  return sub_1A1D4(v1 + *(int *)(v3 + 28), a1, &qword_41890);
}

uint64_t PeopleListPersonRow.State.detailOrProgress.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (uint64_t *)(v1 + *(int *)(type metadata accessor for PeopleListPersonRow.State(0) + 32));
  v4 = *v3;
  v5 = v3[1];
  *a1 = *v3;
  a1[1] = v5;
  return sub_2DB8C(v4, v5);
}

uint64_t PeopleListPersonRow.State.badge.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for PeopleListPersonRow.State(0);
  return sub_1A1D4(v1 + *(int *)(v3 + 36), a1, &qword_41898);
}

void *PeopleListPersonRow.State.contact.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + *(int *)(type metadata accessor for PeopleListPersonRow.State(0) + 40));
  v2 = v1;
  return v1;
}

uint64_t PeopleListPersonRow.State.primaryControl.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for PeopleListPersonRow.State(0);
  return sub_1A1D4(v1 + *(int *)(v3 + 44), a1, &qword_418A0);
}

uint64_t PeopleListPersonRow.State.secondaryControl.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for PeopleListPersonRow.State(0);
  return sub_1A1D4(v1 + *(int *)(v3 + 48), a1, &qword_418A0);
}

uint64_t PeopleListPersonRow.State.init(id:title:subtitle:subtitleExtra:detailOrProgress:badge:contact:primaryControl:secondaryControl:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int *v18;
  _QWORD *v19;

  v15 = a1[1];
  v16 = *a7;
  v17 = a7[1];
  *a9 = *a1;
  a9[1] = v15;
  a9[2] = a2;
  a9[3] = a3;
  a9[4] = a4;
  a9[5] = a5;
  v18 = (int *)type metadata accessor for PeopleListPersonRow.State(0);
  sub_1A154(a6, (uint64_t)a9 + v18[7], &qword_41890);
  v19 = (_QWORD *)((char *)a9 + v18[8]);
  *v19 = v16;
  v19[1] = v17;
  sub_1A154(a8, (uint64_t)a9 + v18[9], &qword_41898);
  *(_QWORD *)((char *)a9 + v18[10]) = a10;
  sub_1A154(a11, (uint64_t)a9 + v18[11], &qword_418A0);
  return sub_1A154(a12, (uint64_t)a9 + v18[12], &qword_418A0);
}

void PeopleListPersonRow.State.DetailOrProgress.hash(into:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1[1];
  if (v3)
  {
    v4 = *v1;
    Hasher._combine(_:)(0);
    String.hash(into:)(a1, v4, v3);
  }
  else
  {
    Hasher._combine(_:)(1uLL);
  }
}

Swift::Int PeopleListPersonRow.State.DetailOrProgress.hashValue.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[9];

  v1 = *v0;
  v2 = v0[1];
  Hasher.init(_seed:)(v4, 0);
  if (v2)
  {
    Hasher._combine(_:)(0);
    String.hash(into:)(v4, v1, v2);
  }
  else
  {
    Hasher._combine(_:)(1uLL);
  }
  return Hasher._finalize()();
}

Swift::Int sub_2CEC0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[9];

  v2 = *v1;
  v3 = v1[1];
  Hasher.init(_seed:)(v5, a1);
  if (v3)
  {
    Hasher._combine(_:)(0);
    String.hash(into:)(v5, v2, v3);
  }
  else
  {
    Hasher._combine(_:)(1uLL);
  }
  return Hasher._finalize()();
}

uint64_t PeopleListPersonRow.State.RelativeDateOrString.hash(into:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t MyRelativeDate;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t (*v11)(_QWORD);
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;

  v2 = v1;
  MyRelativeDate = type metadata accessor for FindMyRelativeDate(0);
  v5 = *(_QWORD *)(MyRelativeDate - 8);
  __chkstk_darwin(MyRelativeDate);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for PeopleListPersonRow.State.RelativeDateOrString(0);
  __chkstk_darwin(v8);
  v10 = (uint64_t *)((char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2DE0C(v2, (uint64_t)v10, v11);
  if (swift_getEnumCaseMultiPayload(v10, v8) == 1)
  {
    v12 = *v10;
    v13 = v10[1];
    Hasher._combine(_:)(1uLL);
    String.hash(into:)(a1, v12, v13);
    return swift_bridgeObjectRelease(v13);
  }
  else
  {
    (*(void (**)(char *, uint64_t *, uint64_t))(v5 + 32))(v7, v10, MyRelativeDate);
    Hasher._combine(_:)(0);
    v15 = sub_19D7C(&qword_418A8, (uint64_t (*)(uint64_t))&type metadata accessor for FindMyRelativeDate, (uint64_t)&protocol conformance descriptor for FindMyRelativeDate);
    dispatch thunk of Hashable.hash(into:)(a1, MyRelativeDate, v15);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, MyRelativeDate);
  }
}

Swift::Int PeopleListPersonRow.State.RelativeDateOrString.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t MyRelativeDate;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v14[9];

  v1 = v0;
  MyRelativeDate = type metadata accessor for FindMyRelativeDate(0);
  v3 = *(_QWORD *)(MyRelativeDate - 8);
  __chkstk_darwin(MyRelativeDate);
  v5 = (char *)&v14[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for PeopleListPersonRow.State.RelativeDateOrString(0);
  __chkstk_darwin(v6);
  v8 = (_QWORD *)((char *)&v14[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  Hasher.init(_seed:)(v14, 0);
  sub_2DE0C(v1, (uint64_t)v8, type metadata accessor for PeopleListPersonRow.State.RelativeDateOrString);
  if (swift_getEnumCaseMultiPayload(v8, v6) == 1)
  {
    v9 = *v8;
    v10 = v8[1];
    Hasher._combine(_:)(1uLL);
    String.hash(into:)(v14, v9, v10);
    swift_bridgeObjectRelease(v10);
  }
  else
  {
    (*(void (**)(char *, uint64_t *, uint64_t))(v3 + 32))(v5, v8, MyRelativeDate);
    Hasher._combine(_:)(0);
    v11 = sub_19D7C(&qword_418A8, (uint64_t (*)(uint64_t))&type metadata accessor for FindMyRelativeDate, (uint64_t)&protocol conformance descriptor for FindMyRelativeDate);
    dispatch thunk of Hashable.hash(into:)(v14, MyRelativeDate, v11);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, MyRelativeDate);
  }
  return Hasher._finalize()();
}

Swift::Int sub_2D204(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t MyRelativeDate;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v18[9];

  v4 = v2;
  MyRelativeDate = type metadata accessor for FindMyRelativeDate(0);
  v7 = *(_QWORD *)(MyRelativeDate - 8);
  v8 = __chkstk_darwin(MyRelativeDate);
  v10 = (char *)&v18[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (_QWORD *)((char *)&v18[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  Hasher.init(_seed:)(v18, a1);
  sub_2DE0C(v4, (uint64_t)v12, type metadata accessor for PeopleListPersonRow.State.RelativeDateOrString);
  if (swift_getEnumCaseMultiPayload(v12, a2) == 1)
  {
    v13 = *v12;
    v14 = v12[1];
    Hasher._combine(_:)(1uLL);
    String.hash(into:)(v18, v13, v14);
    swift_bridgeObjectRelease(v14);
  }
  else
  {
    (*(void (**)(char *, uint64_t *, uint64_t))(v7 + 32))(v10, v12, MyRelativeDate);
    Hasher._combine(_:)(0);
    v15 = sub_19D7C(&qword_418A8, (uint64_t (*)(uint64_t))&type metadata accessor for FindMyRelativeDate, (uint64_t)&protocol conformance descriptor for FindMyRelativeDate);
    dispatch thunk of Hashable.hash(into:)(v18, MyRelativeDate, v15);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, MyRelativeDate);
  }
  return Hasher._finalize()();
}

uint64_t PeopleListPersonRow.State.ID.hash(into:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;

  v4 = *v1;
  v3 = v1[1];
  swift_bridgeObjectRetain(v3);
  String.hash(into:)(a1, v4, v3);
  return swift_bridgeObjectRelease(v3);
}

uint64_t static PeopleListPersonRow.State.ID.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return _stringCompareWithSmolCheck(_:_:expecting:)();
}

Swift::Int PeopleListPersonRow.State.ID.hashValue.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[9];

  v1 = *v0;
  v2 = v0[1];
  Hasher.init(_seed:)(v4, 0);
  String.hash(into:)(v4, v1, v2);
  return Hasher._finalize()();
}

uint64_t sub_2D430(uint64_t a1)
{
  _QWORD *v1;

  return String.hash(into:)(a1, *v1, v1[1]);
}

Swift::Int sub_2D438(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[9];

  v2 = *v1;
  v3 = v1[1];
  Hasher.init(_seed:)(v5, a1);
  String.hash(into:)(v5, v2, v3);
  return Hasher._finalize()();
}

void PeopleListPersonRow.State.hash(into:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
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
  uint64_t MyRelativeDate;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  void *v52;
  id v53;
  uint64_t v54;
  unsigned int (*v55)(uint64_t, uint64_t, uint64_t);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;

  v2 = v1;
  v4 = type metadata accessor for GenericControl.Info(0);
  v65 = *(_QWORD *)(v4 - 8);
  v66 = v4;
  __chkstk_darwin(v4);
  v64 = (char *)&v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_418A0);
  v7 = __chkstk_darwin(v6);
  v70 = (uint64_t)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v63 = (uint64_t)&v59 - v9;
  v10 = type metadata accessor for Badge(0);
  v68 = *(_QWORD *)(v10 - 8);
  v69 = v10;
  __chkstk_darwin(v10);
  v62 = (char *)&v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_41898);
  __chkstk_darwin(v12);
  v67 = (uint64_t)&v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MyRelativeDate = type metadata accessor for FindMyRelativeDate(0);
  v60 = *(_QWORD *)(MyRelativeDate - 8);
  v61 = MyRelativeDate;
  __chkstk_darwin(MyRelativeDate);
  v59 = (char *)&v59 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for PeopleListPersonRow.State.RelativeDateOrString(0);
  v17 = *(_QWORD *)(v16 - 8);
  v18 = __chkstk_darwin(v16);
  v20 = (uint64_t *)((char *)&v59 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v18);
  v22 = (char *)&v59 - v21;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_41890);
  __chkstk_darwin(v23);
  v25 = (char *)&v59 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = *v2;
  v26 = v2[1];
  swift_bridgeObjectRetain(v26);
  String.hash(into:)(a1, v27, v26);
  swift_bridgeObjectRelease(v26);
  v28 = v2[2];
  v29 = v2[3];
  swift_bridgeObjectRetain(v29);
  String.hash(into:)(a1, v28, v29);
  swift_bridgeObjectRelease(v29);
  v30 = v2[4];
  v31 = v2[5];
  swift_bridgeObjectRetain(v31);
  String.hash(into:)(a1, v30, v31);
  swift_bridgeObjectRelease(v31);
  v32 = (int *)type metadata accessor for PeopleListPersonRow.State(0);
  sub_1A1D4((uint64_t)v2 + v32[7], (uint64_t)v25, &qword_41890);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v25, 1, v16) == 1)
  {
    Hasher._combine(_:)(0);
    v34 = v65;
    v33 = v66;
    v35 = v64;
  }
  else
  {
    sub_2B674((uint64_t)v25, (uint64_t)v22, type metadata accessor for PeopleListPersonRow.State.RelativeDateOrString);
    Hasher._combine(_:)(1u);
    sub_2DE0C((uint64_t)v22, (uint64_t)v20, type metadata accessor for PeopleListPersonRow.State.RelativeDateOrString);
    if (swift_getEnumCaseMultiPayload(v20, v16) == 1)
    {
      v36 = *v20;
      v37 = v20[1];
      Hasher._combine(_:)(1uLL);
      String.hash(into:)(a1, v36, v37);
      swift_bridgeObjectRelease(v37);
    }
    else
    {
      v39 = v59;
      v38 = v60;
      v40 = v61;
      (*(void (**)(char *, uint64_t *, uint64_t))(v60 + 32))(v59, v20, v61);
      Hasher._combine(_:)(0);
      v41 = sub_19D7C(&qword_418A8, (uint64_t (*)(uint64_t))&type metadata accessor for FindMyRelativeDate, (uint64_t)&protocol conformance descriptor for FindMyRelativeDate);
      dispatch thunk of Hashable.hash(into:)(a1, v40, v41);
      (*(void (**)(char *, uint64_t))(v38 + 8))(v39, v40);
    }
    v34 = v65;
    v33 = v66;
    v35 = v64;
    sub_2E0D4((uint64_t)v22);
  }
  v42 = (uint64_t *)((char *)v2 + v32[8]);
  v43 = v42[1];
  if (v43 == 1)
  {
    Hasher._combine(_:)(0);
  }
  else
  {
    v44 = *v42;
    Hasher._combine(_:)(1u);
    if (v43)
    {
      Hasher._combine(_:)(0);
      swift_bridgeObjectRetain(v43);
      String.hash(into:)(a1, v44, v43);
      v45 = v44;
      v46 = v43;
    }
    else
    {
      Hasher._combine(_:)(1uLL);
      v45 = v44;
      v46 = 0;
    }
    sub_193F0(v45, v46);
  }
  v47 = v67;
  sub_1A1D4((uint64_t)v2 + v32[9], v67, &qword_41898);
  v49 = v68;
  v48 = v69;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v68 + 48))(v47, 1, v69) == 1)
  {
    Hasher._combine(_:)(0);
  }
  else
  {
    v50 = v62;
    (*(void (**)(char *, uint64_t, uint64_t))(v49 + 32))(v62, v47, v48);
    Hasher._combine(_:)(1u);
    v51 = sub_19D7C(&qword_418B0, (uint64_t (*)(uint64_t))&type metadata accessor for Badge, (uint64_t)&protocol conformance descriptor for Badge);
    dispatch thunk of Hashable.hash(into:)(a1, v48, v51);
    (*(void (**)(char *, uint64_t))(v49 + 8))(v50, v48);
  }
  v52 = *(void **)((char *)v2 + v32[10]);
  if (v52)
  {
    Hasher._combine(_:)(1u);
    v53 = v52;
    NSObject.hash(into:)(a1);

  }
  else
  {
    Hasher._combine(_:)(0);
  }
  v54 = v63;
  sub_1A1D4((uint64_t)v2 + v32[11], v63, &qword_418A0);
  v55 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v34 + 48);
  if (v55(v54, 1, v33) == 1)
  {
    Hasher._combine(_:)(0);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v34 + 32))(v35, v54, v33);
    Hasher._combine(_:)(1u);
    v56 = sub_19D7C(&qword_418B8, (uint64_t (*)(uint64_t))&type metadata accessor for GenericControl.Info, (uint64_t)&protocol conformance descriptor for GenericControl.Info);
    dispatch thunk of Hashable.hash(into:)(a1, v33, v56);
    (*(void (**)(char *, uint64_t))(v34 + 8))(v35, v33);
  }
  v57 = v70;
  sub_1A1D4((uint64_t)v2 + v32[12], v70, &qword_418A0);
  if (v55(v57, 1, v33) == 1)
  {
    Hasher._combine(_:)(0);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v34 + 32))(v35, v57, v33);
    Hasher._combine(_:)(1u);
    v58 = sub_19D7C(&qword_418B8, (uint64_t (*)(uint64_t))&type metadata accessor for GenericControl.Info, (uint64_t)&protocol conformance descriptor for GenericControl.Info);
    dispatch thunk of Hashable.hash(into:)(a1, v33, v58);
    (*(void (**)(char *, uint64_t))(v34 + 8))(v35, v33);
  }
}

Swift::Int PeopleListPersonRow.State.hashValue.getter()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  PeopleListPersonRow.State.hash(into:)((uint64_t)v1);
  return Hasher._finalize()();
}

Swift::Int sub_2DB48(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  PeopleListPersonRow.State.hash(into:)((uint64_t)v2);
  return Hasher._finalize()();
}

uint64_t sub_2DB8C(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 != 1)
    return swift_bridgeObjectRetain(a2);
  return result;
}

uint64_t sub_2DBA0(char a1, int64_t a2, char a3, unint64_t a4)
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
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
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
    v15 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_41B48);
  v11 = *(_QWORD *)(type metadata accessor for GenericControl.Info(0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  v16 = _swift_stdlib_malloc_size(v15);
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
  v18 = *(_QWORD *)(type metadata accessor for GenericControl.Info(0) - 8);
  v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  v20 = (unint64_t)v15 + v19;
  if ((a1 & 1) != 0)
  {
    v21 = a4 + v19;
    if ((unint64_t)v15 < a4 || v20 >= v21 + *(_QWORD *)(v18 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack((char *)v15 + v19, v21);
    }
    else if (v15 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront((char *)v15 + v19, v21);
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_32184(0, v8, v20, a4);
  }
  swift_bridgeObjectRelease(a4);
  return (uint64_t)v15;
}

uint64_t _s13FindMyAppCore19PeopleListPersonRowV5StateV16DetailOrProgressO2eeoiySbAG_AGtFZ_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a1[1];
  v4 = a2[1];
  if (v3)
  {
    if (v4)
    {
      if (*a1 != *a2 || v3 != v4)
        return _stringCompareWithSmolCheck(_:_:expecting:)();
      return 1;
    }
    return 0;
  }
  if (v4)
    return 0;
  swift_bridgeObjectRelease_n(0, 2);
  return 1;
}

uint64_t sub_2DE0C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t _s13FindMyAppCore19PeopleListPersonRowV5StateV20RelativeDateOrStringO2eeoiySbAG_AGtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t MyRelativeDate;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v22;
  char v23;
  char *v24;
  void (*v25)(char *, uint64_t);
  uint64_t v27;
  uint64_t v28;

  v28 = a2;
  MyRelativeDate = type metadata accessor for FindMyRelativeDate(0);
  v4 = *(_QWORD *)(MyRelativeDate - 8);
  __chkstk_darwin(MyRelativeDate);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for PeopleListPersonRow.State.RelativeDateOrString(0);
  v8 = __chkstk_darwin(v7);
  v10 = (uint64_t *)((char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v8);
  v12 = (char *)&v27 - v11;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_41B38);
  v14 = __chkstk_darwin(v13);
  v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = &v16[*(int *)(v14 + 48)];
  sub_2DE0C(a1, (uint64_t)v16, type metadata accessor for PeopleListPersonRow.State.RelativeDateOrString);
  sub_2DE0C(v28, (uint64_t)v17, type metadata accessor for PeopleListPersonRow.State.RelativeDateOrString);
  if (swift_getEnumCaseMultiPayload(v16, v7) != 1)
  {
    sub_2DE0C((uint64_t)v16, (uint64_t)v12, type metadata accessor for PeopleListPersonRow.State.RelativeDateOrString);
    if (swift_getEnumCaseMultiPayload(v17, v7) != 1)
    {
      v24 = v6;
      (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v17, MyRelativeDate);
      v23 = static FindMyRelativeDate.== infix(_:_:)(v12, v6);
      v25 = *(void (**)(char *, uint64_t))(v4 + 8);
      v25(v24, MyRelativeDate);
      v25(v12, MyRelativeDate);
      sub_2E0D4((uint64_t)v16);
      return v23 & 1;
    }
    (*(void (**)(char *, uint64_t))(v4 + 8))(v12, MyRelativeDate);
    goto LABEL_12;
  }
  sub_2DE0C((uint64_t)v16, (uint64_t)v10, type metadata accessor for PeopleListPersonRow.State.RelativeDateOrString);
  v19 = *v10;
  v18 = v10[1];
  if (swift_getEnumCaseMultiPayload(v17, v7) != 1)
  {
    swift_bridgeObjectRelease(v18);
LABEL_12:
    sub_1A198((uint64_t)v16, &qword_41B38);
    goto LABEL_13;
  }
  v20 = *((_QWORD *)v17 + 1);
  if (v19 == *(_QWORD *)v17 && v18 == v20)
  {
    swift_bridgeObjectRelease_n(v18, 2);
    goto LABEL_16;
  }
  v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v19, v18, *(_QWORD *)v17, *((_QWORD *)v17 + 1), 0);
  swift_bridgeObjectRelease(v20);
  swift_bridgeObjectRelease(v18);
  if ((v22 & 1) != 0)
  {
LABEL_16:
    sub_2E0D4((uint64_t)v16);
    v23 = 1;
    return v23 & 1;
  }
  sub_2E0D4((uint64_t)v16);
LABEL_13:
  v23 = 0;
  return v23 & 1;
}

uint64_t sub_2E0D4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for PeopleListPersonRow.State.RelativeDateOrString(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

BOOL _s13FindMyAppCore19PeopleListPersonRowV5StateV2eeoiySbAE_AEtFZ_0(_QWORD *a1, _QWORD *a2)
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
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  _BOOL8 result;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unsigned int (*v65)(uint64_t, uint64_t, uint64_t);
  uint64_t *v66;
  uint64_t v67;
  char MyAppCore19PeopleListPersonRowV5StateV20RelativeDateOrStringO2eeoiySbAG_AGtFZ_0;
  int *v69;
  uint64_t v70;
  _QWORD *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t, uint64_t);
  uint64_t v83;
  int v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  char v92;
  void (*v93)(char *, uint64_t);
  uint64_t v94;
  void *v95;
  void *v96;
  uint64_t v97;
  id v98;
  id v99;
  char v100;
  uint64_t v101;
  unsigned int (*v102)(uint64_t, uint64_t, uint64_t);
  char v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  char v108;
  void (*v109)(char *, uint64_t);
  char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  uint64_t v118;
  char v119;
  void (*v120)(char *, uint64_t);
  _QWORD *v121;
  int *v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  char *v132;
  uint64_t v133;
  uint64_t v134;
  char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  _QWORD *v143;

  v133 = type metadata accessor for GenericControl.Info(0);
  v131 = *(_QWORD *)(v133 - 8);
  __chkstk_darwin(v133);
  v124 = (char *)&v121 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v129 = __swift_instantiateConcreteTypeFromMangledName(&qword_41B08);
  v5 = __chkstk_darwin(v129);
  v127 = (uint64_t)&v121 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v130 = (uint64_t)&v121 - v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_418A0);
  v9 = __chkstk_darwin(v8);
  v123 = (uint64_t)&v121 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v9);
  v125 = (uint64_t)&v121 - v12;
  v13 = __chkstk_darwin(v11);
  v126 = (uint64_t)&v121 - v14;
  v15 = __chkstk_darwin(v13);
  v128 = (uint64_t)&v121 - v16;
  v17 = __chkstk_darwin(v15);
  v136 = (uint64_t)&v121 - v18;
  __chkstk_darwin(v17);
  v135 = (char *)&v121 - v19;
  v141 = type metadata accessor for Badge(0);
  v139 = *(_QWORD *)(v141 - 8);
  __chkstk_darwin(v141);
  v132 = (char *)&v121 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_41B10);
  __chkstk_darwin(v137);
  v140 = (uint64_t)&v121 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_41898);
  v23 = __chkstk_darwin(v22);
  v134 = (uint64_t)&v121 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __chkstk_darwin(v23);
  v138 = (uint64_t)&v121 - v26;
  __chkstk_darwin(v25);
  v142 = (uint64_t)&v121 - v27;
  v28 = type metadata accessor for PeopleListPersonRow.State.RelativeDateOrString(0);
  v29 = *(_QWORD *)(v28 - 8);
  __chkstk_darwin(v28);
  v31 = (char *)&v121 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_41B18);
  __chkstk_darwin(v32);
  v34 = (char *)&v121 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_41890);
  v36 = __chkstk_darwin(v35);
  v38 = (char *)&v121 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __chkstk_darwin(v36);
  v41 = (char *)&v121 - v40;
  __chkstk_darwin(v39);
  v43 = (char *)&v121 - v42;
  v44 = *a1;
  v45 = a1[1];
  v46 = *a2;
  v47 = a2[1];
  v143 = a2;
  if (v44 != v46 || v45 != v47)
  {
    v48 = _stringCompareWithSmolCheck(_:_:expecting:)(v44, v45, v46, v47, 0);
    result = 0;
    if ((v48 & 1) == 0)
      return result;
  }
  v50 = a1[2];
  v51 = a1[3];
  v52 = v143[2];
  v53 = v143[3];
  if (v50 != v52 || v51 != v53)
  {
    v54 = _stringCompareWithSmolCheck(_:_:expecting:)(v50, v51, v52, v53, 0);
    result = 0;
    if ((v54 & 1) == 0)
      return result;
  }
  v55 = a1[4];
  v56 = a1[5];
  v57 = v143[4];
  v58 = v143[5];
  if (v55 != v57 || v56 != v58)
  {
    v59 = _stringCompareWithSmolCheck(_:_:expecting:)(v55, v56, v57, v58, 0);
    result = 0;
    if ((v59 & 1) == 0)
      return result;
  }
  v60 = type metadata accessor for PeopleListPersonRow.State(0);
  v61 = a1;
  v62 = v60;
  v63 = *(int *)(v60 + 28);
  v121 = v61;
  sub_1A1D4((uint64_t)v61 + v63, (uint64_t)v43, &qword_41890);
  v122 = (int *)v62;
  sub_1A1D4((uint64_t)v143 + *(int *)(v62 + 28), (uint64_t)v41, &qword_41890);
  v64 = (uint64_t)&v34[*(int *)(v32 + 48)];
  sub_1A1D4((uint64_t)v43, (uint64_t)v34, &qword_41890);
  sub_1A1D4((uint64_t)v41, v64, &qword_41890);
  v65 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v29 + 48);
  if (v65((uint64_t)v34, 1, v28) == 1)
  {
    sub_1A198((uint64_t)v41, &qword_41890);
    sub_1A198((uint64_t)v43, &qword_41890);
    if (v65(v64, 1, v28) == 1)
    {
      sub_1A198((uint64_t)v34, &qword_41890);
      goto LABEL_18;
    }
LABEL_15:
    v66 = &qword_41B18;
    v67 = (uint64_t)v34;
LABEL_16:
    sub_1A198(v67, v66);
    return 0;
  }
  sub_1A1D4((uint64_t)v34, (uint64_t)v38, &qword_41890);
  if (v65(v64, 1, v28) == 1)
  {
    sub_1A198((uint64_t)v41, &qword_41890);
    sub_1A198((uint64_t)v43, &qword_41890);
    sub_2E0D4((uint64_t)v38);
    goto LABEL_15;
  }
  sub_2B674(v64, (uint64_t)v31, type metadata accessor for PeopleListPersonRow.State.RelativeDateOrString);
  MyAppCore19PeopleListPersonRowV5StateV20RelativeDateOrStringO2eeoiySbAG_AGtFZ_0 = _s13FindMyAppCore19PeopleListPersonRowV5StateV20RelativeDateOrStringO2eeoiySbAG_AGtFZ_0((uint64_t)v38, (uint64_t)v31);
  sub_2E0D4((uint64_t)v31);
  sub_1A198((uint64_t)v41, &qword_41890);
  sub_1A198((uint64_t)v43, &qword_41890);
  sub_2E0D4((uint64_t)v38);
  sub_1A198((uint64_t)v34, &qword_41890);
  if ((MyAppCore19PeopleListPersonRowV5StateV20RelativeDateOrStringO2eeoiySbAG_AGtFZ_0 & 1) == 0)
    return 0;
LABEL_18:
  v69 = v122;
  v70 = v122[8];
  v71 = v121;
  v73 = *(_QWORD *)((char *)v121 + v70);
  v72 = *(_QWORD *)((char *)v121 + v70 + 8);
  v74 = (_QWORD *)((char *)v143 + v70);
  v76 = *v74;
  v75 = v74[1];
  if (v72 == 1)
  {
    if (v75 == 1)
      goto LABEL_20;
LABEL_24:
    sub_2DB8C(v73, v72);
    sub_2DB8C(v76, v75);
    sub_193F0(v73, v72);
    sub_193F0(v76, v75);
    return 0;
  }
  if (v75 == 1)
    goto LABEL_24;
  if (!v72)
  {
    if (!v75)
    {
      sub_2DB8C(v73, 0);
      sub_2DB8C(v76, 0);
      swift_bridgeObjectRelease_n(0, 2);
      goto LABEL_20;
    }
    v88 = 0;
LABEL_44:
    sub_2DB8C(v73, v72);
    sub_2DB8C(v76, v75);
    swift_bridgeObjectRelease(v88);
    swift_bridgeObjectRelease(v75);
    return 0;
  }
  if (!v75)
  {
    v88 = v72;
    goto LABEL_44;
  }
  if (v73 == v76 && v72 == v75)
  {
    sub_2DB8C(v73, v72);
    sub_2DB8C(v73, v72);
    swift_bridgeObjectRelease(v75);
    swift_bridgeObjectRelease(v72);
    goto LABEL_20;
  }
  v103 = _stringCompareWithSmolCheck(_:_:expecting:)(v73, v72, *v74, v74[1], 0);
  sub_2DB8C(v73, v72);
  sub_2DB8C(v76, v75);
  swift_bridgeObjectRelease(v75);
  swift_bridgeObjectRelease(v72);
  result = 0;
  if ((v103 & 1) != 0)
  {
LABEL_20:
    v77 = v142;
    sub_1A1D4((uint64_t)v71 + v69[9], v142, &qword_41898);
    v78 = v138;
    sub_1A1D4((uint64_t)v143 + v69[9], v138, &qword_41898);
    v79 = v140;
    v80 = v140 + *(int *)(v137 + 48);
    sub_1A1D4(v77, v140, &qword_41898);
    sub_1A1D4(v78, v80, &qword_41898);
    v81 = v139;
    v82 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v139 + 48);
    v83 = v141;
    if (v82(v79, 1, v141) == 1)
    {
      sub_1A198(v78, &qword_41898);
      sub_1A198(v77, &qword_41898);
      v84 = v82(v80, 1, v83);
      v86 = (uint64_t)v135;
      v85 = v136;
      if (v84 == 1)
      {
        sub_1A198(v79, &qword_41898);
LABEL_39:
        v94 = v69[10];
        v95 = *(void **)((char *)v71 + v94);
        v96 = *(void **)((char *)v143 + v94);
        if (v95)
        {
          v97 = v133;
          if (!v96)
            return 0;
          sub_32148();
          v98 = v96;
          v99 = v95;
          v100 = static NSObject.== infix(_:_:)();

          if ((v100 & 1) == 0)
            return 0;
        }
        else
        {
          v97 = v133;
          if (v96)
            return 0;
        }
        sub_1A1D4((uint64_t)v71 + v69[11], v86, &qword_418A0);
        sub_1A1D4((uint64_t)v143 + v69[11], v85, &qword_418A0);
        v79 = v130;
        v101 = v130 + *(int *)(v129 + 48);
        sub_1A1D4(v86, v130, &qword_418A0);
        sub_1A1D4(v85, v101, &qword_418A0);
        v102 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v131 + 48);
        if (v102(v79, 1, v97) == 1)
        {
          sub_1A198(v85, &qword_418A0);
          v79 = v130;
          sub_1A198(v86, &qword_418A0);
          if (v102(v101, 1, v97) == 1)
          {
            sub_1A198(v79, &qword_418A0);
LABEL_56:
            v111 = v126;
            sub_1A1D4((uint64_t)v71 + v69[12], v126, &qword_418A0);
            v112 = v125;
            sub_1A1D4((uint64_t)v143 + v69[12], v125, &qword_418A0);
            v113 = v127;
            v114 = v127 + *(int *)(v129 + 48);
            sub_1A1D4(v111, v127, &qword_418A0);
            sub_1A1D4(v112, v114, &qword_418A0);
            if (v102(v113, 1, v97) == 1)
            {
              sub_1A198(v112, &qword_418A0);
              sub_1A198(v111, &qword_418A0);
              if (v102(v114, 1, v97) == 1)
              {
                sub_1A198(v113, &qword_418A0);
                return 1;
              }
            }
            else
            {
              v115 = v123;
              sub_1A1D4(v113, v123, &qword_418A0);
              if (v102(v114, 1, v97) != 1)
              {
                v116 = v131;
                v117 = v124;
                (*(void (**)(char *, uint64_t, uint64_t))(v131 + 32))(v124, v114, v97);
                v118 = sub_19D7C(&qword_41B20, (uint64_t (*)(uint64_t))&type metadata accessor for GenericControl.Info, (uint64_t)&protocol conformance descriptor for GenericControl.Info);
                v119 = dispatch thunk of static Equatable.== infix(_:_:)(v115, v117, v97, v118);
                v120 = *(void (**)(char *, uint64_t))(v116 + 8);
                v120(v117, v97);
                sub_1A198(v112, &qword_418A0);
                sub_1A198(v111, &qword_418A0);
                v120((char *)v115, v97);
                sub_1A198(v113, &qword_418A0);
                return (v119 & 1) != 0;
              }
              sub_1A198(v112, &qword_418A0);
              sub_1A198(v111, &qword_418A0);
              (*(void (**)(uint64_t, uint64_t))(v131 + 8))(v115, v97);
            }
            v66 = &qword_41B08;
            v67 = v113;
            goto LABEL_16;
          }
        }
        else
        {
          v104 = v128;
          sub_1A1D4(v79, v128, &qword_418A0);
          if (v102(v101, 1, v97) != 1)
          {
            v105 = v131;
            v106 = v124;
            (*(void (**)(char *, uint64_t, uint64_t))(v131 + 32))(v124, v101, v97);
            v107 = sub_19D7C(&qword_41B20, (uint64_t (*)(uint64_t))&type metadata accessor for GenericControl.Info, (uint64_t)&protocol conformance descriptor for GenericControl.Info);
            v108 = dispatch thunk of static Equatable.== infix(_:_:)(v104, v106, v97, v107);
            v109 = *(void (**)(char *, uint64_t))(v105 + 8);
            v110 = v106;
            v69 = v122;
            v109(v110, v97);
            sub_1A198(v136, &qword_418A0);
            sub_1A198(v86, &qword_418A0);
            v109((char *)v104, v97);
            sub_1A198(v79, &qword_418A0);
            if ((v108 & 1) == 0)
              return 0;
            goto LABEL_56;
          }
          sub_1A198(v85, &qword_418A0);
          sub_1A198(v86, &qword_418A0);
          (*(void (**)(uint64_t, uint64_t))(v131 + 8))(v104, v97);
        }
        v66 = &qword_41B08;
        goto LABEL_35;
      }
    }
    else
    {
      v87 = v134;
      sub_1A1D4(v79, v134, &qword_41898);
      if (v82(v80, 1, v83) != 1)
      {
        v89 = v87;
        v90 = v132;
        (*(void (**)(char *, uint64_t, uint64_t))(v81 + 32))(v132, v80, v83);
        v91 = sub_19D7C(&qword_41B30, (uint64_t (*)(uint64_t))&type metadata accessor for Badge, (uint64_t)&protocol conformance descriptor for Badge);
        v92 = dispatch thunk of static Equatable.== infix(_:_:)(v89, v90, v83, v91);
        v93 = *(void (**)(char *, uint64_t))(v81 + 8);
        v93(v90, v83);
        sub_1A198(v78, &qword_41898);
        sub_1A198(v142, &qword_41898);
        v93((char *)v89, v83);
        sub_1A198(v79, &qword_41898);
        v86 = (uint64_t)v135;
        v85 = v136;
        if ((v92 & 1) == 0)
          return 0;
        goto LABEL_39;
      }
      sub_1A198(v78, &qword_41898);
      sub_1A198(v77, &qword_41898);
      (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v87, v83);
    }
    v66 = &qword_41B10;
LABEL_35:
    v67 = v79;
    goto LABEL_16;
  }
  return result;
}

unint64_t sub_2EE70()
{
  unint64_t result;

  result = qword_418C0;
  if (!qword_418C0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for PeopleListPersonRow.State.DetailOrProgress, &type metadata for PeopleListPersonRow.State.DetailOrProgress);
    atomic_store(result, (unint64_t *)&qword_418C0);
  }
  return result;
}

uint64_t sub_2EEB4()
{
  return sub_19D7C(&qword_418C8, type metadata accessor for PeopleListPersonRow.State.RelativeDateOrString, (uint64_t)&protocol conformance descriptor for PeopleListPersonRow.State.RelativeDateOrString);
}

unint64_t sub_2EEE4()
{
  unint64_t result;

  result = qword_418D0;
  if (!qword_418D0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for PeopleListPersonRow.State.ID, &type metadata for PeopleListPersonRow.State.ID);
    atomic_store(result, (unint64_t *)&qword_418D0);
  }
  return result;
}

uint64_t sub_2EF28()
{
  return sub_19D7C(&qword_418D8, type metadata accessor for PeopleListPersonRow.State, (uint64_t)&protocol conformance descriptor for PeopleListPersonRow.State);
}

unint64_t sub_2EF58()
{
  unint64_t result;

  result = qword_418E0;
  if (!qword_418E0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for PeopleListPersonRow.State.ID, &type metadata for PeopleListPersonRow.State.ID);
    atomic_store(result, (unint64_t *)&qword_418E0);
  }
  return result;
}

uint64_t sub_2EF9C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &opaque type descriptor for <<opaque return type of PeopleListPersonRow.body>>, 1);
}

uint64_t *initializeBufferWithCopyOfBuffer for PeopleListPersonRow(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(_QWORD *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t MyRelativeDate;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int (*v37)(char *, uint64_t, uint64_t);
  id v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  _QWORD *__dst;

  v4 = type metadata accessor for PeopleListPersonRow.State(0);
  v5 = *(_DWORD *)(*(_QWORD *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v16);
  }
  else
  {
    v6 = (int *)v4;
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    v9 = a2[5];
    a1[4] = a2[4];
    a1[5] = v9;
    v10 = *(int *)(v4 + 28);
    __dst = (uint64_t *)((char *)a1 + v10);
    v11 = (uint64_t *)((char *)a2 + v10);
    v12 = type metadata accessor for PeopleListPersonRow.State.RelativeDateOrString(0);
    v13 = *(_QWORD *)(v12 - 8);
    v14 = *(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v13 + 48);
    swift_bridgeObjectRetain(v7);
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v9);
    if (v14(v11, 1, v12))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_41890);
      memcpy(__dst, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      if (swift_getEnumCaseMultiPayload(v11, v12) == 1)
      {
        v17 = v11[1];
        *__dst = *v11;
        __dst[1] = v17;
        swift_bridgeObjectRetain(v17);
        v18 = 1;
      }
      else
      {
        MyRelativeDate = type metadata accessor for FindMyRelativeDate(0);
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(MyRelativeDate - 8) + 16))(__dst, v11, MyRelativeDate);
        v18 = 0;
      }
      swift_storeEnumTagMultiPayload(__dst, v12, v18);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v13 + 56))(__dst, 0, 1, v12);
    }
    v20 = v6[8];
    v21 = (char *)a1 + v20;
    v22 = (char *)a2 + v20;
    v23 = *((_QWORD *)v22 + 1);
    if (v23 == 1)
    {
      *(_OWORD *)v21 = *(_OWORD *)v22;
    }
    else
    {
      *(_QWORD *)v21 = *(_QWORD *)v22;
      *((_QWORD *)v21 + 1) = v23;
      swift_bridgeObjectRetain(v23);
    }
    v24 = v6[9];
    v25 = (char *)a1 + v24;
    v26 = (char *)a2 + v24;
    v27 = type metadata accessor for Badge(0);
    v28 = *(_QWORD *)(v27 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
    {
      v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_41898);
      memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v25, v26, v27);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
    }
    v30 = v6[10];
    v31 = *(void **)((char *)a2 + v30);
    *(uint64_t *)((char *)a1 + v30) = (uint64_t)v31;
    v32 = v6[11];
    v33 = (char *)a1 + v32;
    v34 = (char *)a2 + v32;
    v35 = type metadata accessor for GenericControl.Info(0);
    v36 = *(_QWORD *)(v35 - 8);
    v37 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48);
    v38 = v31;
    if (v37(v34, 1, v35))
    {
      v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_418A0);
      memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v33, v34, v35);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
    }
    v40 = v6[12];
    v41 = (char *)a1 + v40;
    v42 = (char *)a2 + v40;
    if (v37(v42, 1, v35))
    {
      v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_418A0);
      memcpy(v41, v42, *(_QWORD *)(*(_QWORD *)(v43 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v41, v42, v35);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v36 + 56))(v41, 0, 1, v35);
    }
  }
  return a1;
}

uint64_t destroy for PeopleListPersonRow(_QWORD *a1)
{
  int *v2;
  char *v3;
  uint64_t v4;
  uint64_t MyRelativeDate;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  char *v14;
  uint64_t result;

  swift_bridgeObjectRelease(a1[1]);
  swift_bridgeObjectRelease(a1[3]);
  swift_bridgeObjectRelease(a1[5]);
  v2 = (int *)type metadata accessor for PeopleListPersonRow.State(0);
  v3 = (char *)a1 + v2[7];
  v4 = type metadata accessor for PeopleListPersonRow.State.RelativeDateOrString(0);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(v3, 1, v4))
  {
    if (swift_getEnumCaseMultiPayload(v3, v4) == 1)
    {
      swift_bridgeObjectRelease(*((_QWORD *)v3 + 1));
    }
    else
    {
      MyRelativeDate = type metadata accessor for FindMyRelativeDate(0);
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(MyRelativeDate - 8) + 8))(v3, MyRelativeDate);
    }
  }
  v6 = *(_QWORD *)((char *)a1 + v2[8] + 8);
  if (v6 != 1)
    swift_bridgeObjectRelease(v6);
  v7 = (char *)a1 + v2[9];
  v8 = type metadata accessor for Badge(0);
  v9 = *(_QWORD *)(v8 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);

  v10 = (char *)a1 + v2[11];
  v11 = type metadata accessor for GenericControl.Info(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  if (!v13(v10, 1, v11))
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
  v14 = (char *)a1 + v2[12];
  result = ((uint64_t (*)(char *, uint64_t, uint64_t))v13)(v14, 1, v11);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return result;
}

_QWORD *initializeWithCopy for PeopleListPersonRow(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(_QWORD *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t MyRelativeDate;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int (*v34)(char *, uint64_t, uint64_t);
  id v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  int *v42;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  v42 = (int *)type metadata accessor for PeopleListPersonRow.State(0);
  v7 = v42[7];
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (_QWORD *)((char *)a2 + v7);
  v10 = type metadata accessor for PeopleListPersonRow.State.RelativeDateOrString(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  if (v12(v9, 1, v10))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_41890);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
    {
      v14 = v9[1];
      *v8 = *v9;
      v8[1] = v14;
      swift_bridgeObjectRetain(v14);
      v15 = 1;
    }
    else
    {
      MyRelativeDate = type metadata accessor for FindMyRelativeDate(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(MyRelativeDate - 8) + 16))(v8, v9, MyRelativeDate);
      v15 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v10, v15);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v17 = v42[8];
  v18 = (char *)a1 + v17;
  v19 = (char *)a2 + v17;
  v20 = *((_QWORD *)v19 + 1);
  if (v20 == 1)
  {
    *(_OWORD *)v18 = *(_OWORD *)v19;
  }
  else
  {
    *(_QWORD *)v18 = *(_QWORD *)v19;
    *((_QWORD *)v18 + 1) = v20;
    swift_bridgeObjectRetain(v20);
  }
  v21 = v42[9];
  v22 = (char *)a1 + v21;
  v23 = (char *)a2 + v21;
  v24 = type metadata accessor for Badge(0);
  v25 = *(_QWORD *)(v24 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
  {
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_41898);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v22, v23, v24);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
  }
  v27 = v42[10];
  v28 = *(void **)((char *)a2 + v27);
  *(_QWORD *)((char *)a1 + v27) = v28;
  v29 = v42[11];
  v30 = (char *)a1 + v29;
  v31 = (char *)a2 + v29;
  v32 = type metadata accessor for GenericControl.Info(0);
  v33 = *(_QWORD *)(v32 - 8);
  v34 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48);
  v35 = v28;
  if (v34(v31, 1, v32))
  {
    v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_418A0);
    memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v30, v31, v32);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
  }
  v37 = v42[12];
  v38 = (char *)a1 + v37;
  v39 = (char *)a2 + v37;
  if (v34(v39, 1, v32))
  {
    v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_418A0);
    memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v40 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v38, v39, v32);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v38, 0, 1, v32);
  }
  return a1;
}

char *assignWithCopy for PeopleListPersonRow(char *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(char *, uint64_t, uint64_t);
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t MyRelativeDate;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(char *, uint64_t, uint64_t);
  int v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t (*v49)(char *, uint64_t, uint64_t);
  int v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  int v56;
  int v57;
  uint64_t v58;
  uint64_t v60;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *((_QWORD *)a2 + 1);
  v5 = *((_QWORD *)a1 + 1);
  *((_QWORD *)a1 + 1) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  v6 = *((_QWORD *)a2 + 3);
  v7 = *((_QWORD *)a1 + 3);
  *((_QWORD *)a1 + 3) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  *((_QWORD *)a1 + 4) = *((_QWORD *)a2 + 4);
  v8 = *((_QWORD *)a2 + 5);
  v9 = *((_QWORD *)a1 + 5);
  *((_QWORD *)a1 + 5) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  v10 = (int *)type metadata accessor for PeopleListPersonRow.State(0);
  v11 = v10[7];
  v12 = &a1[v11];
  v13 = &a2[v11];
  v14 = type metadata accessor for PeopleListPersonRow.State.RelativeDateOrString(0);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48);
  v17 = v16(v12, 1, v14);
  v18 = v16(v13, 1, v14);
  if (v17)
  {
    if (!v18)
    {
      if (swift_getEnumCaseMultiPayload(v13, v14) == 1)
      {
        *(_QWORD *)v12 = *(_QWORD *)v13;
        v19 = *((_QWORD *)v13 + 1);
        *((_QWORD *)v12 + 1) = v19;
        swift_bridgeObjectRetain(v19);
        v20 = 1;
      }
      else
      {
        MyRelativeDate = type metadata accessor for FindMyRelativeDate(0);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(MyRelativeDate - 8) + 16))(v12, v13, MyRelativeDate);
        v20 = 0;
      }
      swift_storeEnumTagMultiPayload(v12, v14, v20);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      goto LABEL_13;
    }
LABEL_7:
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_41890);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    goto LABEL_13;
  }
  if (v18)
  {
    sub_2E0D4((uint64_t)v12);
    goto LABEL_7;
  }
  if (a1 != a2)
  {
    sub_2E0D4((uint64_t)v12);
    if (swift_getEnumCaseMultiPayload(v13, v14) == 1)
    {
      *(_QWORD *)v12 = *(_QWORD *)v13;
      v22 = *((_QWORD *)v13 + 1);
      *((_QWORD *)v12 + 1) = v22;
      swift_bridgeObjectRetain(v22);
      swift_storeEnumTagMultiPayload(v12, v14, 1);
    }
    else
    {
      v60 = type metadata accessor for FindMyRelativeDate(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v60 - 8) + 16))(v12, v13, v60);
      swift_storeEnumTagMultiPayload(v12, v14, 0);
    }
  }
LABEL_13:
  v24 = v10[8];
  v25 = &a1[v24];
  v26 = &a2[v24];
  v27 = *(_QWORD *)&a1[v24 + 8];
  v28 = *(_QWORD *)&a2[v24 + 8];
  if (v27 == 1)
  {
    if (v28 != 1)
    {
      *(_QWORD *)v25 = *(_QWORD *)v26;
      v29 = *((_QWORD *)v26 + 1);
      *((_QWORD *)v25 + 1) = v29;
      swift_bridgeObjectRetain(v29);
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  if (v28 == 1)
  {
    sub_2FC88((uint64_t)v25);
LABEL_18:
    *(_OWORD *)v25 = *(_OWORD *)v26;
    goto LABEL_20;
  }
  *(_QWORD *)v25 = *(_QWORD *)v26;
  v30 = *((_QWORD *)v26 + 1);
  *((_QWORD *)v25 + 1) = v30;
  swift_bridgeObjectRetain(v30);
  swift_bridgeObjectRelease(v27);
LABEL_20:
  v31 = v10[9];
  v32 = &a1[v31];
  v33 = &a2[v31];
  v34 = type metadata accessor for Badge(0);
  v35 = *(_QWORD *)(v34 - 8);
  v36 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v35 + 48);
  v37 = v36(v32, 1, v34);
  v38 = v36(v33, 1, v34);
  if (v37)
  {
    if (!v38)
    {
      (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v32, v33, v34);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if (v38)
  {
    (*(void (**)(char *, uint64_t))(v35 + 8))(v32, v34);
LABEL_25:
    v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_41898);
    memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
    goto LABEL_26;
  }
  (*(void (**)(char *, char *, uint64_t))(v35 + 24))(v32, v33, v34);
LABEL_26:
  v40 = v10[10];
  v41 = *(void **)&a1[v40];
  v42 = *(void **)&a2[v40];
  *(_QWORD *)&a1[v40] = v42;
  v43 = v42;

  v44 = v10[11];
  v45 = &a1[v44];
  v46 = &a2[v44];
  v47 = type metadata accessor for GenericControl.Info(0);
  v48 = *(_QWORD *)(v47 - 8);
  v49 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v48 + 48);
  v50 = v49(v45, 1, v47);
  v51 = v49(v46, 1, v47);
  if (v50)
  {
    if (!v51)
    {
      (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v45, v46, v47);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v48 + 56))(v45, 0, 1, v47);
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  if (v51)
  {
    (*(void (**)(char *, uint64_t))(v48 + 8))(v45, v47);
LABEL_31:
    v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_418A0);
    memcpy(v45, v46, *(_QWORD *)(*(_QWORD *)(v52 - 8) + 64));
    goto LABEL_32;
  }
  (*(void (**)(char *, char *, uint64_t))(v48 + 24))(v45, v46, v47);
LABEL_32:
  v53 = v10[12];
  v54 = &a1[v53];
  v55 = &a2[v53];
  v56 = v49(&a1[v53], 1, v47);
  v57 = v49(v55, 1, v47);
  if (!v56)
  {
    if (!v57)
    {
      (*(void (**)(char *, char *, uint64_t))(v48 + 24))(v54, v55, v47);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v48 + 8))(v54, v47);
    goto LABEL_37;
  }
  if (v57)
  {
LABEL_37:
    v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_418A0);
    memcpy(v54, v55, *(_QWORD *)(*(_QWORD *)(v58 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v54, v55, v47);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v48 + 56))(v54, 0, 1, v47);
  return a1;
}

uint64_t sub_2FC88(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  return a1;
}

_OWORD *initializeWithTake for PeopleListPersonRow(_OWORD *a1, _OWORD *a2)
{
  __int128 v4;
  int *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t MyRelativeDate;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int (*v24)(char *, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  v5 = (int *)type metadata accessor for PeopleListPersonRow.State(0);
  v6 = v5[7];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for PeopleListPersonRow.State.RelativeDateOrString(0);
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_41890);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload(v8, v9))
    {
      memcpy(v7, v8, *(_QWORD *)(v10 + 64));
    }
    else
    {
      MyRelativeDate = type metadata accessor for FindMyRelativeDate(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(MyRelativeDate - 8) + 32))(v7, v8, MyRelativeDate);
      swift_storeEnumTagMultiPayload(v7, v9, 0);
    }
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  *(_OWORD *)((char *)a1 + v5[8]) = *(_OWORD *)((char *)a2 + v5[8]);
  v13 = v5[9];
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = type metadata accessor for Badge(0);
  v17 = *(_QWORD *)(v16 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_41898);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v14, v15, v16);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  *(_QWORD *)((char *)a1 + v5[10]) = *(_QWORD *)((char *)a2 + v5[10]);
  v19 = v5[11];
  v20 = (char *)a1 + v19;
  v21 = (char *)a2 + v19;
  v22 = type metadata accessor for GenericControl.Info(0);
  v23 = *(_QWORD *)(v22 - 8);
  v24 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48);
  if (v24(v21, 1, v22))
  {
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_418A0);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v20, v21, v22);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  }
  v26 = v5[12];
  v27 = (char *)a1 + v26;
  v28 = (char *)a2 + v26;
  if (v24(v28, 1, v22))
  {
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_418A0);
    memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v27, v28, v22);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v27, 0, 1, v22);
  }
  return a1;
}

char *assignWithTake for PeopleListPersonRow(char *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(char *, uint64_t, uint64_t);
  int v17;
  int v18;
  size_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(char *, uint64_t, uint64_t);
  int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(char *, uint64_t, uint64_t);
  int v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  int v49;
  int v50;
  uint64_t v51;
  uint64_t MyRelativeDate;

  v4 = *((_QWORD *)a2 + 1);
  v5 = *((_QWORD *)a1 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v4;
  swift_bridgeObjectRelease(v5);
  v6 = *((_QWORD *)a2 + 3);
  v7 = *((_QWORD *)a1 + 3);
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a1 + 3) = v6;
  swift_bridgeObjectRelease(v7);
  v8 = *((_QWORD *)a2 + 5);
  v9 = *((_QWORD *)a1 + 5);
  *((_QWORD *)a1 + 4) = *((_QWORD *)a2 + 4);
  *((_QWORD *)a1 + 5) = v8;
  swift_bridgeObjectRelease(v9);
  v10 = (int *)type metadata accessor for PeopleListPersonRow.State(0);
  v11 = v10[7];
  v12 = &a1[v11];
  v13 = &a2[v11];
  v14 = type metadata accessor for PeopleListPersonRow.State.RelativeDateOrString(0);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48);
  v17 = v16(v12, 1, v14);
  v18 = v16(v13, 1, v14);
  if (!v17)
  {
    if (!v18)
    {
      if (a1 == a2)
        goto LABEL_14;
      sub_2E0D4((uint64_t)v12);
      if (!swift_getEnumCaseMultiPayload(v13, v14))
      {
        MyRelativeDate = type metadata accessor for FindMyRelativeDate(0);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(MyRelativeDate - 8) + 32))(v12, v13, MyRelativeDate);
        swift_storeEnumTagMultiPayload(v12, v14, 0);
        goto LABEL_14;
      }
      v19 = *(_QWORD *)(v15 + 64);
LABEL_8:
      memcpy(v12, v13, v19);
      goto LABEL_14;
    }
    sub_2E0D4((uint64_t)v12);
LABEL_7:
    v19 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_41890) - 8) + 64);
    goto LABEL_8;
  }
  if (v18)
    goto LABEL_7;
  if (swift_getEnumCaseMultiPayload(v13, v14))
  {
    memcpy(v12, v13, *(_QWORD *)(v15 + 64));
  }
  else
  {
    v20 = type metadata accessor for FindMyRelativeDate(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v12, v13, v20);
    swift_storeEnumTagMultiPayload(v12, v14, 0);
  }
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
LABEL_14:
  v21 = v10[8];
  v22 = (uint64_t)&a1[v21];
  v23 = &a2[v21];
  v24 = *(_QWORD *)&a1[v21 + 8];
  if (v24 == 1)
  {
LABEL_17:
    *(_OWORD *)v22 = *(_OWORD *)v23;
    goto LABEL_19;
  }
  v25 = *((_QWORD *)v23 + 1);
  if (v25 == 1)
  {
    sub_2FC88(v22);
    goto LABEL_17;
  }
  *(_QWORD *)v22 = *(_QWORD *)v23;
  *(_QWORD *)(v22 + 8) = v25;
  swift_bridgeObjectRelease(v24);
LABEL_19:
  v26 = v10[9];
  v27 = &a1[v26];
  v28 = &a2[v26];
  v29 = type metadata accessor for Badge(0);
  v30 = *(_QWORD *)(v29 - 8);
  v31 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v30 + 48);
  v32 = v31(v27, 1, v29);
  v33 = v31(v28, 1, v29);
  if (v32)
  {
    if (!v33)
    {
      (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v27, v28, v29);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v33)
  {
    (*(void (**)(char *, uint64_t))(v30 + 8))(v27, v29);
LABEL_24:
    v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_41898);
    memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(char *, char *, uint64_t))(v30 + 40))(v27, v28, v29);
LABEL_25:
  v35 = v10[10];
  v36 = *(void **)&a1[v35];
  *(_QWORD *)&a1[v35] = *(_QWORD *)&a2[v35];

  v37 = v10[11];
  v38 = &a1[v37];
  v39 = &a2[v37];
  v40 = type metadata accessor for GenericControl.Info(0);
  v41 = *(_QWORD *)(v40 - 8);
  v42 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v41 + 48);
  v43 = v42(v38, 1, v40);
  v44 = v42(v39, 1, v40);
  if (v43)
  {
    if (!v44)
    {
      (*(void (**)(char *, char *, uint64_t))(v41 + 32))(v38, v39, v40);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v41 + 56))(v38, 0, 1, v40);
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  if (v44)
  {
    (*(void (**)(char *, uint64_t))(v41 + 8))(v38, v40);
LABEL_30:
    v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_418A0);
    memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v45 - 8) + 64));
    goto LABEL_31;
  }
  (*(void (**)(char *, char *, uint64_t))(v41 + 40))(v38, v39, v40);
LABEL_31:
  v46 = v10[12];
  v47 = &a1[v46];
  v48 = &a2[v46];
  v49 = v42(&a1[v46], 1, v40);
  v50 = v42(v48, 1, v40);
  if (!v49)
  {
    if (!v50)
    {
      (*(void (**)(char *, char *, uint64_t))(v41 + 40))(v47, v48, v40);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v41 + 8))(v47, v40);
    goto LABEL_36;
  }
  if (v50)
  {
LABEL_36:
    v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_418A0);
    memcpy(v47, v48, *(_QWORD *)(*(_QWORD *)(v51 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v41 + 32))(v47, v48, v40);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v41 + 56))(v47, 0, 1, v40);
  return a1;
}

uint64_t getEnumTagSinglePayload for PeopleListPersonRow(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_303C8);
}

uint64_t sub_303C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PeopleListPersonRow.State(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for PeopleListPersonRow(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_30410);
}

uint64_t sub_30410(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PeopleListPersonRow.State(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_30450(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;

  result = type metadata accessor for PeopleListPersonRow.State(319);
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 256, 1, &v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for PeopleListPersonRow.State(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(_QWORD *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t MyRelativeDate;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int (*v37)(char *, uint64_t, uint64_t);
  id v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  _QWORD *__dst;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v16);
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    v9 = a2[5];
    v10 = a3[7];
    __dst = (uint64_t *)((char *)a1 + v10);
    v11 = (uint64_t *)((char *)a2 + v10);
    a1[4] = a2[4];
    a1[5] = v9;
    v12 = type metadata accessor for PeopleListPersonRow.State.RelativeDateOrString(0);
    v13 = *(_QWORD *)(v12 - 8);
    v14 = *(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v13 + 48);
    swift_bridgeObjectRetain(v7);
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v9);
    if (v14(v11, 1, v12))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_41890);
      memcpy(__dst, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      if (swift_getEnumCaseMultiPayload(v11, v12) == 1)
      {
        v17 = v11[1];
        *__dst = *v11;
        __dst[1] = v17;
        swift_bridgeObjectRetain(v17);
        v18 = 1;
      }
      else
      {
        MyRelativeDate = type metadata accessor for FindMyRelativeDate(0);
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(MyRelativeDate - 8) + 16))(__dst, v11, MyRelativeDate);
        v18 = 0;
      }
      swift_storeEnumTagMultiPayload(__dst, v12, v18);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v13 + 56))(__dst, 0, 1, v12);
    }
    v20 = a3[8];
    v21 = (char *)v4 + v20;
    v22 = (char *)a2 + v20;
    v23 = *((_QWORD *)v22 + 1);
    if (v23 == 1)
    {
      *(_OWORD *)v21 = *(_OWORD *)v22;
    }
    else
    {
      *(_QWORD *)v21 = *(_QWORD *)v22;
      *((_QWORD *)v21 + 1) = v23;
      swift_bridgeObjectRetain(v23);
    }
    v24 = a3[9];
    v25 = (char *)v4 + v24;
    v26 = (char *)a2 + v24;
    v27 = type metadata accessor for Badge(0);
    v28 = *(_QWORD *)(v27 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
    {
      v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_41898);
      memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v25, v26, v27);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
    }
    v30 = a3[10];
    v31 = a3[11];
    v32 = *(void **)((char *)a2 + v30);
    *(uint64_t *)((char *)v4 + v30) = (uint64_t)v32;
    v33 = (char *)v4 + v31;
    v34 = (char *)a2 + v31;
    v35 = type metadata accessor for GenericControl.Info(0);
    v36 = *(_QWORD *)(v35 - 8);
    v37 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48);
    v38 = v32;
    if (v37(v34, 1, v35))
    {
      v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_418A0);
      memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v33, v34, v35);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
    }
    v40 = a3[12];
    v41 = (char *)v4 + v40;
    v42 = (char *)a2 + v40;
    if (v37(v42, 1, v35))
    {
      v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_418A0);
      memcpy(v41, v42, *(_QWORD *)(*(_QWORD *)(v43 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v41, v42, v35);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v36 + 56))(v41, 0, 1, v35);
    }
  }
  return v4;
}

uint64_t destroy for PeopleListPersonRow.State(_QWORD *a1, int *a2)
{
  char *v4;
  uint64_t v5;
  uint64_t MyRelativeDate;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(char *, uint64_t, uint64_t);
  char *v15;
  uint64_t result;

  swift_bridgeObjectRelease(a1[1]);
  swift_bridgeObjectRelease(a1[3]);
  swift_bridgeObjectRelease(a1[5]);
  v4 = (char *)a1 + a2[7];
  v5 = type metadata accessor for PeopleListPersonRow.State.RelativeDateOrString(0);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, 1, v5))
  {
    if (swift_getEnumCaseMultiPayload(v4, v5) == 1)
    {
      swift_bridgeObjectRelease(*((_QWORD *)v4 + 1));
    }
    else
    {
      MyRelativeDate = type metadata accessor for FindMyRelativeDate(0);
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(MyRelativeDate - 8) + 8))(v4, MyRelativeDate);
    }
  }
  v7 = *(_QWORD *)((char *)a1 + a2[8] + 8);
  if (v7 != 1)
    swift_bridgeObjectRelease(v7);
  v8 = (char *)a1 + a2[9];
  v9 = type metadata accessor for Badge(0);
  v10 = *(_QWORD *)(v9 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);

  v11 = (char *)a1 + a2[11];
  v12 = type metadata accessor for GenericControl.Info(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
  if (!v14(v11, 1, v12))
    (*(void (**)(char *, uint64_t))(v13 + 8))(v11, v12);
  v15 = (char *)a1 + a2[12];
  result = ((uint64_t (*)(char *, uint64_t, uint64_t))v14)(v15, 1, v12);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  return result;
}

_QWORD *initializeWithCopy for PeopleListPersonRow.State(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(_QWORD *, uint64_t, uint64_t);
  uint64_t v14;
  int *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t MyRelativeDate;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int (*v36)(char *, uint64_t, uint64_t);
  id v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;

  v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  v7 = a2[5];
  v8 = a3[7];
  v9 = (_QWORD *)((char *)a1 + v8);
  v10 = (_QWORD *)((char *)a2 + v8);
  a1[4] = a2[4];
  a1[5] = v7;
  v11 = type metadata accessor for PeopleListPersonRow.State.RelativeDateOrString(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v12 + 48);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  if (v13(v10, 1, v11))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_41890);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    v15 = a3;
  }
  else
  {
    v15 = a3;
    if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
    {
      v16 = v10[1];
      *v9 = *v10;
      v9[1] = v16;
      swift_bridgeObjectRetain(v16);
      v17 = 1;
    }
    else
    {
      MyRelativeDate = type metadata accessor for FindMyRelativeDate(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(MyRelativeDate - 8) + 16))(v9, v10, MyRelativeDate);
      v17 = 0;
    }
    swift_storeEnumTagMultiPayload(v9, v11, v17);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  v19 = v15[8];
  v20 = (char *)a1 + v19;
  v21 = (char *)a2 + v19;
  v22 = *((_QWORD *)v21 + 1);
  if (v22 == 1)
  {
    *(_OWORD *)v20 = *(_OWORD *)v21;
  }
  else
  {
    *(_QWORD *)v20 = *(_QWORD *)v21;
    *((_QWORD *)v20 + 1) = v22;
    swift_bridgeObjectRetain(v22);
  }
  v23 = v15[9];
  v24 = (char *)a1 + v23;
  v25 = (char *)a2 + v23;
  v26 = type metadata accessor for Badge(0);
  v27 = *(_QWORD *)(v26 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26))
  {
    v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_41898);
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v24, v25, v26);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
  }
  v29 = v15[10];
  v30 = v15[11];
  v31 = *(void **)((char *)a2 + v29);
  *(_QWORD *)((char *)a1 + v29) = v31;
  v32 = (char *)a1 + v30;
  v33 = (char *)a2 + v30;
  v34 = type metadata accessor for GenericControl.Info(0);
  v35 = *(_QWORD *)(v34 - 8);
  v36 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48);
  v37 = v31;
  if (v36(v33, 1, v34))
  {
    v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_418A0);
    memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v32, v33, v34);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
  }
  v39 = v15[12];
  v40 = (char *)a1 + v39;
  v41 = (char *)a2 + v39;
  if (v36(v41, 1, v34))
  {
    v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_418A0);
    memcpy(v40, v41, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v40, v41, v34);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v35 + 56))(v40, 0, 1, v34);
  }
  return a1;
}

char *assignWithCopy for PeopleListPersonRow.State(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t, uint64_t);
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t MyRelativeDate;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(char *, uint64_t, uint64_t);
  int v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t (*v50)(char *, uint64_t, uint64_t);
  int v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  int v57;
  int v58;
  uint64_t v59;
  uint64_t v61;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = *((_QWORD *)a2 + 1);
  v7 = *((_QWORD *)a1 + 1);
  *((_QWORD *)a1 + 1) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  v8 = *((_QWORD *)a2 + 3);
  v9 = *((_QWORD *)a1 + 3);
  *((_QWORD *)a1 + 3) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  *((_QWORD *)a1 + 4) = *((_QWORD *)a2 + 4);
  v10 = *((_QWORD *)a2 + 5);
  v11 = *((_QWORD *)a1 + 5);
  *((_QWORD *)a1 + 5) = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  v12 = a3[7];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = type metadata accessor for PeopleListPersonRow.State.RelativeDateOrString(0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (v18)
  {
    if (!v19)
    {
      if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
      {
        *(_QWORD *)v13 = *(_QWORD *)v14;
        v20 = *((_QWORD *)v14 + 1);
        *((_QWORD *)v13 + 1) = v20;
        swift_bridgeObjectRetain(v20);
        v21 = 1;
      }
      else
      {
        MyRelativeDate = type metadata accessor for FindMyRelativeDate(0);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(MyRelativeDate - 8) + 16))(v13, v14, MyRelativeDate);
        v21 = 0;
      }
      swift_storeEnumTagMultiPayload(v13, v15, v21);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
      goto LABEL_13;
    }
LABEL_7:
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_41890);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    goto LABEL_13;
  }
  if (v19)
  {
    sub_2E0D4((uint64_t)v13);
    goto LABEL_7;
  }
  if (a1 != a2)
  {
    sub_2E0D4((uint64_t)v13);
    if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
    {
      *(_QWORD *)v13 = *(_QWORD *)v14;
      v23 = *((_QWORD *)v14 + 1);
      *((_QWORD *)v13 + 1) = v23;
      swift_bridgeObjectRetain(v23);
      swift_storeEnumTagMultiPayload(v13, v15, 1);
    }
    else
    {
      v61 = type metadata accessor for FindMyRelativeDate(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v61 - 8) + 16))(v13, v14, v61);
      swift_storeEnumTagMultiPayload(v13, v15, 0);
    }
  }
LABEL_13:
  v25 = a3[8];
  v26 = &a1[v25];
  v27 = &a2[v25];
  v28 = *(_QWORD *)&a1[v25 + 8];
  v29 = *(_QWORD *)&a2[v25 + 8];
  if (v28 == 1)
  {
    if (v29 != 1)
    {
      *(_QWORD *)v26 = *(_QWORD *)v27;
      v30 = *((_QWORD *)v27 + 1);
      *((_QWORD *)v26 + 1) = v30;
      swift_bridgeObjectRetain(v30);
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  if (v29 == 1)
  {
    sub_2FC88((uint64_t)v26);
LABEL_18:
    *(_OWORD *)v26 = *(_OWORD *)v27;
    goto LABEL_20;
  }
  *(_QWORD *)v26 = *(_QWORD *)v27;
  v31 = *((_QWORD *)v27 + 1);
  *((_QWORD *)v26 + 1) = v31;
  swift_bridgeObjectRetain(v31);
  swift_bridgeObjectRelease(v28);
LABEL_20:
  v32 = a3[9];
  v33 = &a1[v32];
  v34 = &a2[v32];
  v35 = type metadata accessor for Badge(0);
  v36 = *(_QWORD *)(v35 - 8);
  v37 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v36 + 48);
  v38 = v37(v33, 1, v35);
  v39 = v37(v34, 1, v35);
  if (v38)
  {
    if (!v39)
    {
      (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v33, v34, v35);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v36 + 56))(v33, 0, 1, v35);
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if (v39)
  {
    (*(void (**)(char *, uint64_t))(v36 + 8))(v33, v35);
LABEL_25:
    v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_41898);
    memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v40 - 8) + 64));
    goto LABEL_26;
  }
  (*(void (**)(char *, char *, uint64_t))(v36 + 24))(v33, v34, v35);
LABEL_26:
  v41 = a3[10];
  v42 = *(void **)&a1[v41];
  v43 = *(void **)&a2[v41];
  *(_QWORD *)&a1[v41] = v43;
  v44 = v43;

  v45 = a3[11];
  v46 = &a1[v45];
  v47 = &a2[v45];
  v48 = type metadata accessor for GenericControl.Info(0);
  v49 = *(_QWORD *)(v48 - 8);
  v50 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v49 + 48);
  v51 = v50(v46, 1, v48);
  v52 = v50(v47, 1, v48);
  if (v51)
  {
    if (!v52)
    {
      (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v46, v47, v48);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v49 + 56))(v46, 0, 1, v48);
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  if (v52)
  {
    (*(void (**)(char *, uint64_t))(v49 + 8))(v46, v48);
LABEL_31:
    v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_418A0);
    memcpy(v46, v47, *(_QWORD *)(*(_QWORD *)(v53 - 8) + 64));
    goto LABEL_32;
  }
  (*(void (**)(char *, char *, uint64_t))(v49 + 24))(v46, v47, v48);
LABEL_32:
  v54 = a3[12];
  v55 = &a1[v54];
  v56 = &a2[v54];
  v57 = v50(&a1[v54], 1, v48);
  v58 = v50(v56, 1, v48);
  if (!v57)
  {
    if (!v58)
    {
      (*(void (**)(char *, char *, uint64_t))(v49 + 24))(v55, v56, v48);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v49 + 8))(v55, v48);
    goto LABEL_37;
  }
  if (v58)
  {
LABEL_37:
    v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_418A0);
    memcpy(v55, v56, *(_QWORD *)(*(_QWORD *)(v59 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v55, v56, v48);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v49 + 56))(v55, 0, 1, v48);
  return a1;
}

_OWORD *initializeWithTake for PeopleListPersonRow.State(_OWORD *a1, _OWORD *a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t MyRelativeDate;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int (*v25)(char *, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  v7 = a3[7];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = type metadata accessor for PeopleListPersonRow.State.RelativeDateOrString(0);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_41890);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload(v9, v10))
    {
      memcpy(v8, v9, *(_QWORD *)(v11 + 64));
    }
    else
    {
      MyRelativeDate = type metadata accessor for FindMyRelativeDate(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(MyRelativeDate - 8) + 32))(v8, v9, MyRelativeDate);
      swift_storeEnumTagMultiPayload(v8, v10, 0);
    }
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v14 = a3[9];
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = type metadata accessor for Badge(0);
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_41898);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v15, v16, v17);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  v20 = a3[11];
  *(_QWORD *)((char *)a1 + a3[10]) = *(_QWORD *)((char *)a2 + a3[10]);
  v21 = (char *)a1 + v20;
  v22 = (char *)a2 + v20;
  v23 = type metadata accessor for GenericControl.Info(0);
  v24 = *(_QWORD *)(v23 - 8);
  v25 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48);
  if (v25(v22, 1, v23))
  {
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_418A0);
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v21, v22, v23);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  }
  v27 = a3[12];
  v28 = (char *)a1 + v27;
  v29 = (char *)a2 + v27;
  if (v25(v29, 1, v23))
  {
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_418A0);
    memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v28, v29, v23);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v28, 0, 1, v23);
  }
  return a1;
}

char *assignWithTake for PeopleListPersonRow.State(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t, uint64_t);
  int v18;
  int v19;
  size_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(char *, uint64_t, uint64_t);
  int v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t (*v43)(char *, uint64_t, uint64_t);
  int v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  int v50;
  int v51;
  uint64_t v52;
  uint64_t MyRelativeDate;

  v6 = *((_QWORD *)a2 + 1);
  v7 = *((_QWORD *)a1 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v6;
  swift_bridgeObjectRelease(v7);
  v8 = *((_QWORD *)a2 + 3);
  v9 = *((_QWORD *)a1 + 3);
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a1 + 3) = v8;
  swift_bridgeObjectRelease(v9);
  v10 = *((_QWORD *)a2 + 5);
  v11 = *((_QWORD *)a1 + 5);
  *((_QWORD *)a1 + 4) = *((_QWORD *)a2 + 4);
  *((_QWORD *)a1 + 5) = v10;
  swift_bridgeObjectRelease(v11);
  v12 = a3[7];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = type metadata accessor for PeopleListPersonRow.State.RelativeDateOrString(0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      if (a1 == a2)
        goto LABEL_14;
      sub_2E0D4((uint64_t)v13);
      if (!swift_getEnumCaseMultiPayload(v14, v15))
      {
        MyRelativeDate = type metadata accessor for FindMyRelativeDate(0);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(MyRelativeDate - 8) + 32))(v13, v14, MyRelativeDate);
        swift_storeEnumTagMultiPayload(v13, v15, 0);
        goto LABEL_14;
      }
      v20 = *(_QWORD *)(v16 + 64);
LABEL_8:
      memcpy(v13, v14, v20);
      goto LABEL_14;
    }
    sub_2E0D4((uint64_t)v13);
LABEL_7:
    v20 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_41890) - 8) + 64);
    goto LABEL_8;
  }
  if (v19)
    goto LABEL_7;
  if (swift_getEnumCaseMultiPayload(v14, v15))
  {
    memcpy(v13, v14, *(_QWORD *)(v16 + 64));
  }
  else
  {
    v21 = type metadata accessor for FindMyRelativeDate(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(v13, v14, v21);
    swift_storeEnumTagMultiPayload(v13, v15, 0);
  }
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
LABEL_14:
  v22 = a3[8];
  v23 = (uint64_t)&a1[v22];
  v24 = &a2[v22];
  v25 = *(_QWORD *)&a1[v22 + 8];
  if (v25 == 1)
  {
LABEL_17:
    *(_OWORD *)v23 = *(_OWORD *)v24;
    goto LABEL_19;
  }
  v26 = *((_QWORD *)v24 + 1);
  if (v26 == 1)
  {
    sub_2FC88(v23);
    goto LABEL_17;
  }
  *(_QWORD *)v23 = *(_QWORD *)v24;
  *(_QWORD *)(v23 + 8) = v26;
  swift_bridgeObjectRelease(v25);
LABEL_19:
  v27 = a3[9];
  v28 = &a1[v27];
  v29 = &a2[v27];
  v30 = type metadata accessor for Badge(0);
  v31 = *(_QWORD *)(v30 - 8);
  v32 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v31 + 48);
  v33 = v32(v28, 1, v30);
  v34 = v32(v29, 1, v30);
  if (v33)
  {
    if (!v34)
    {
      (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v28, v29, v30);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v31 + 56))(v28, 0, 1, v30);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v34)
  {
    (*(void (**)(char *, uint64_t))(v31 + 8))(v28, v30);
LABEL_24:
    v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_41898);
    memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(char *, char *, uint64_t))(v31 + 40))(v28, v29, v30);
LABEL_25:
  v36 = a3[10];
  v37 = *(void **)&a1[v36];
  *(_QWORD *)&a1[v36] = *(_QWORD *)&a2[v36];

  v38 = a3[11];
  v39 = &a1[v38];
  v40 = &a2[v38];
  v41 = type metadata accessor for GenericControl.Info(0);
  v42 = *(_QWORD *)(v41 - 8);
  v43 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v42 + 48);
  v44 = v43(v39, 1, v41);
  v45 = v43(v40, 1, v41);
  if (v44)
  {
    if (!v45)
    {
      (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v39, v40, v41);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v42 + 56))(v39, 0, 1, v41);
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  if (v45)
  {
    (*(void (**)(char *, uint64_t))(v42 + 8))(v39, v41);
LABEL_30:
    v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_418A0);
    memcpy(v39, v40, *(_QWORD *)(*(_QWORD *)(v46 - 8) + 64));
    goto LABEL_31;
  }
  (*(void (**)(char *, char *, uint64_t))(v42 + 40))(v39, v40, v41);
LABEL_31:
  v47 = a3[12];
  v48 = &a1[v47];
  v49 = &a2[v47];
  v50 = v43(&a1[v47], 1, v41);
  v51 = v43(v49, 1, v41);
  if (!v50)
  {
    if (!v51)
    {
      (*(void (**)(char *, char *, uint64_t))(v42 + 40))(v48, v49, v41);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v42 + 8))(v48, v41);
    goto LABEL_36;
  }
  if (v51)
  {
LABEL_36:
    v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_418A0);
    memcpy(v48, v49, *(_QWORD *)(*(_QWORD *)(v52 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v48, v49, v41);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v42 + 56))(v48, 0, 1, v41);
  return a1;
}

uint64_t getEnumTagSinglePayload for PeopleListPersonRow.State(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_31870);
}

uint64_t sub_31870(uint64_t a1, uint64_t a2, int *a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_41890);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = a3[7];
    }
    else
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_41898);
      v9 = *(_QWORD *)(v12 - 8);
      if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
      {
        v10 = v12;
        v11 = a3[9];
      }
      else
      {
        v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_418A0);
        v9 = *(_QWORD *)(v10 - 8);
        v11 = a3[11];
      }
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for PeopleListPersonRow.State(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_3194C);
}

uint64_t sub_3194C(uint64_t result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_41890);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = a4[7];
    }
    else
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_41898);
      v9 = *(_QWORD *)(v12 - 8);
      if (*(_DWORD *)(v9 + 84) == a3)
      {
        v10 = v12;
        v11 = a4[9];
      }
      else
      {
        v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_418A0);
        v9 = *(_QWORD *)(v10 - 8);
        v11 = a4[11];
      }
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

void sub_31A18(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t v10;

  v8[0] = &unk_348D0;
  v8[1] = &unk_348D0;
  v8[2] = &unk_348D0;
  sub_31B08(319, &qword_419E0, type metadata accessor for PeopleListPersonRow.State.RelativeDateOrString);
  if (v3 <= 0x3F)
  {
    v8[3] = *(_QWORD *)(v2 - 8) + 64;
    v8[4] = &unk_348E8;
    sub_31B08(319, &qword_419E8, (uint64_t (*)(uint64_t))&type metadata accessor for Badge);
    if (v5 <= 0x3F)
    {
      v8[5] = *(_QWORD *)(v4 - 8) + 64;
      v8[6] = &unk_34900;
      sub_31B08(319, (unint64_t *)&unk_419F0, (uint64_t (*)(uint64_t))&type metadata accessor for GenericControl.Info);
      if (v7 <= 0x3F)
      {
        v9 = *(_QWORD *)(v6 - 8) + 64;
        v10 = v9;
        swift_initStructMetadata(a1, 256, 9, v8, a1 + 16);
      }
    }
  }
}

void sub_31B08(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    v5 = a3(255);
    v6 = type metadata accessor for Optional(a1, v5);
    if (!v7)
      atomic_store(v6, a2);
  }
}

uint64_t getEnumTagSinglePayload for PeopleListPersonRow.State.DetailOrProgress(uint64_t a1, unsigned int a2)
{
  unint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for PeopleListPersonRow.State.DetailOrProgress(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

uint64_t sub_31BFC(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_31C14(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for PeopleListPersonRow.State.DetailOrProgress()
{
  return &type metadata for PeopleListPersonRow.State.DetailOrProgress;
}

uint64_t *initializeBufferWithCopyOfBuffer for PeopleListPersonRow.State.RelativeDateOrString(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t MyRelativeDate;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v11);
  }
  else
  {
    if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
    {
      v7 = a2[1];
      *a1 = *a2;
      a1[1] = v7;
      swift_bridgeObjectRetain(v7);
      v8 = a1;
      v9 = a3;
      v10 = 1;
    }
    else
    {
      MyRelativeDate = type metadata accessor for FindMyRelativeDate(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(MyRelativeDate - 8) + 16))(a1, a2, MyRelativeDate);
      v8 = a1;
      v9 = a3;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
  }
  return a1;
}

uint64_t destroy for PeopleListPersonRow.State.RelativeDateOrString(uint64_t a1, uint64_t a2)
{
  uint64_t MyRelativeDate;

  if (swift_getEnumCaseMultiPayload(a1, a2) == 1)
    return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  MyRelativeDate = type metadata accessor for FindMyRelativeDate(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(MyRelativeDate - 8) + 8))(a1, MyRelativeDate);
}

_QWORD *initializeWithCopy for PeopleListPersonRow.State.RelativeDateOrString(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t MyRelativeDate;

  if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
  {
    v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    swift_bridgeObjectRetain(v6);
    v7 = a1;
    v8 = a3;
    v9 = 1;
  }
  else
  {
    MyRelativeDate = type metadata accessor for FindMyRelativeDate(0);
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(MyRelativeDate - 8) + 16))(a1, a2, MyRelativeDate);
    v7 = a1;
    v8 = a3;
    v9 = 0;
  }
  swift_storeEnumTagMultiPayload(v7, v8, v9);
  return a1;
}

_QWORD *assignWithCopy for PeopleListPersonRow.State.RelativeDateOrString(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t MyRelativeDate;

  if (a1 != a2)
  {
    sub_2E0D4((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
    {
      *a1 = *a2;
      v6 = a2[1];
      a1[1] = v6;
      swift_bridgeObjectRetain(v6);
      v7 = a1;
      v8 = a3;
      v9 = 1;
    }
    else
    {
      MyRelativeDate = type metadata accessor for FindMyRelativeDate(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(MyRelativeDate - 8) + 16))(a1, a2, MyRelativeDate);
      v7 = a1;
      v8 = a3;
      v9 = 0;
    }
    swift_storeEnumTagMultiPayload(v7, v8, v9);
  }
  return a1;
}

void *initializeWithTake for PeopleListPersonRow.State.RelativeDateOrString(void *a1, const void *a2, uint64_t a3)
{
  uint64_t MyRelativeDate;

  if (swift_getEnumCaseMultiPayload(a2, a3))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    MyRelativeDate = type metadata accessor for FindMyRelativeDate(0);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(MyRelativeDate - 8) + 32))(a1, a2, MyRelativeDate);
    swift_storeEnumTagMultiPayload(a1, a3, 0);
  }
  return a1;
}

void *assignWithTake for PeopleListPersonRow.State.RelativeDateOrString(void *a1, const void *a2, uint64_t a3)
{
  uint64_t MyRelativeDate;

  if (a1 != a2)
  {
    sub_2E0D4((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload(a2, a3))
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      MyRelativeDate = type metadata accessor for FindMyRelativeDate(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(MyRelativeDate - 8) + 32))(a1, a2, MyRelativeDate);
      swift_storeEnumTagMultiPayload(a1, a3, 0);
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for PeopleListPersonRow.State.RelativeDateOrString(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for PeopleListPersonRow.State.RelativeDateOrString(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_31FC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_storeEnumTagMultiPayload(a1, a3, a2);
}

uint64_t sub_31FD4(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[2];

  result = type metadata accessor for FindMyRelativeDate(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = &unk_348D0;
    swift_initEnumMetadataMultiPayload(a1, 256, 2, v4);
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for PeopleListPersonRow.State.ID()
{
  return &type metadata for PeopleListPersonRow.State.ID;
}

uint64_t sub_32050()
{
  return sub_1A114(&qword_41AE8, &qword_41888, (uint64_t)&protocol conformance descriptor for ListRowTemplate<A, B, C, D>);
}

uint64_t getEnumTagSinglePayload for PeopleListPersonRow.DetailOrProgress(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PeopleListPersonRow.DetailOrProgress(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for PeopleListPersonRow.DetailOrProgress()
{
  return &type metadata for PeopleListPersonRow.DetailOrProgress;
}

uint64_t sub_32138(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_350B0, 1);
}

unint64_t sub_32148()
{
  unint64_t result;
  uint64_t v1;

  result = qword_41B28;
  if (!qword_41B28)
  {
    v1 = objc_opt_self(CNContact);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_41B28);
  }
  return result;
}

uint64_t sub_32184(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  v8 = *(_QWORD *)(type metadata accessor for GenericControl.Info(0) - 8);
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

unint64_t sub_3229C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_41B68;
  if (!qword_41B68)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41B60);
    sub_19D7C(&qword_41B70, (uint64_t (*)(uint64_t))&type metadata accessor for RelativeDateText, (uint64_t)&protocol conformance descriptor for RelativeDateText);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_41B68);
  }
  return result;
}

uint64_t sub_32324(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  char v8;
  uint64_t v9;

  v8 = a3 & 1;
  v9 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for PeopleListPersonRow(0) - 8) + 80);
  return sub_2C7F0(a1, a2, v8, a4, v4 + ((v9 + 16) & ~v9));
}

unint64_t sub_32394()
{
  unint64_t result;
  uint64_t v1;

  result = qword_41B80;
  if (!qword_41B80)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_41B88);
    sub_1A114(&qword_41B00, &qword_41AF0, (uint64_t)&protocol conformance descriptor for ProgressView<A, B>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_41B80);
  }
  return result;
}

void ViewModel.hash(into:)()
{
  Swift::UInt v0;

  Hasher._combine(_:)(v0);
}

BOOL static ViewModel.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_32458()
{
  uint64_t MyLocalizationTable;
  uint64_t v1;
  uint64_t ObjCClassFromMetadata;
  id v3;

  MyLocalizationTable = type metadata accessor for FindMyLocalizationTable(0);
  __swift_allocate_value_buffer(MyLocalizationTable, qword_41B90);
  __swift_project_value_buffer(MyLocalizationTable, (uint64_t)qword_41B90);
  v1 = type metadata accessor for ItemsModule();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v1);
  v3 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  return FindMyLocalizationTable.init(tableName:tableBundle:)(0x736D657449, 0xE500000000000000, v3);
}

uint64_t static FindMyLocalizationTable.items.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t MyLocalizationTable;
  uint64_t v3;

  if (qword_40BE8 != -1)
    swift_once(&qword_40BE8, sub_32458);
  MyLocalizationTable = type metadata accessor for FindMyLocalizationTable(0);
  v3 = __swift_project_value_buffer(MyLocalizationTable, (uint64_t)qword_41B90);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(MyLocalizationTable - 8) + 16))(a1, v3, MyLocalizationTable);
}
