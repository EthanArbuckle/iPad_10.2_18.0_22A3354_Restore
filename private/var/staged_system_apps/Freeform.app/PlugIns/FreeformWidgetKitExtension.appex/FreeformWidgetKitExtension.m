unint64_t sub_1000028DC()
{
  unint64_t result;

  result = qword_100020200;
  if (!qword_100020200)
  {
    result = swift_getWitnessTable(&unk_1000146B0, &type metadata for SnapToGridSettingEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_100020200);
  }
  return result;
}

uint64_t sub_100002920()
{
  return sub_100004574(&qword_100020208, &qword_100020210, (uint64_t)&protocol conformance descriptor for _IntentUpdatableEntityProperty<A, B, C>);
}

uint64_t sub_10000294C(uint64_t *a1)
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

uint64_t sub_100002990()
{
  uint64_t v0;

  v0 = type metadata accessor for LocalizedStringResource(0);
  sub_100004498(v0, qword_100020C60);
  sub_100004480(v0, (uint64_t)qword_100020C60);
  return LocalizedStringResource.init(stringLiteral:)(0xD000000000000013, 0x80000001000173E0);
}

uint64_t sub_1000029F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_100004440(&qword_100020340);
  sub_100004498(v0, qword_100020C78);
  v1 = sub_100004480(v0, (uint64_t)qword_100020C78);
  IntentDescription.init(stringLiteral:)(0xD000000000000035, 0x80000001000173A0);
  v2 = type metadata accessor for IntentDescription(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 0, 1, v2);
}

uint64_t sub_100002A78()
{
  uint64_t result;

  result = swift_getKeyPath(&unk_100014A98);
  qword_100020C90 = result;
  return result;
}

uint64_t sub_100002AA0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_100002AAC()
{
  uint64_t v1;

  IntentParameter.wrappedValue.getter(&v1);
  return v1;
}

uint64_t sub_100002ADC()
{
  uint64_t v1;

  IntentParameter.wrappedValue.getter(&v1);
  return v1;
}

uint64_t sub_100002B0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  return swift_task_switch(sub_100002B28, 0, 0);
}

uint64_t sub_100002B28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 16));
  v1 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v0 + 24) = v1;
  *(_QWORD *)(v0 + 72) = v1;
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 146));
  *(_BYTE *)(v0 + 145) = *(_BYTE *)(v0 + 146);
  if (qword_1000200C8 != -1)
    swift_once(&qword_1000200C8, sub_100002A78);
  v2 = qword_100020C90;
  *(_QWORD *)(v0 + 80) = qword_100020C90;
  v3 = async function pointer to AppEntity._setValue<A, B, C>(_:for:)[1];
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  *(_QWORD *)(v0 + 88) = v4;
  v5 = sub_100004574(&qword_100020320, &qword_100020328, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *(_QWORD *)(v0 + 96) = v5;
  *v4 = v0;
  v4[1] = sub_100002C28;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 145, v2, &type metadata for Bool, v5);
}

uint64_t sub_100002C28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 88);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 72);
  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc(v2);
  swift_release(v4);
  swift_release(v3);
  if (v0)
    v5 = sub_100002E14;
  else
    v5 = sub_100002CA8;
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_100002CA8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  IntentParameter.wrappedValue.getter(v0 + 5);
  v1 = v0[5];
  v0[4] = v1;
  v2 = qword_100020C90;
  v0[14] = v1;
  v0[15] = v2;
  v3 = async function pointer to AppEntity._value<A, B>(for:)[1];
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  v0[16] = v4;
  *v4 = v0;
  v4[1] = sub_100002D3C;
  return AppEntity._value<A, B>(for:)(v0 + 18, v2, v0[12]);
}

uint64_t sub_100002D3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 120);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 128);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 112);
  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc(v2);
  swift_release(v4);
  swift_release(v3);
  if (v0)
    v5 = sub_100002E20;
  else
    v5 = sub_100002DBC;
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_100002DBC()
{
  uint64_t v0;
  unint64_t v1;

  *(_BYTE *)(v0 + 147) = *(_BYTE *)(v0 + 144);
  v1 = sub_1000045B4();
  static IntentResult.result<A>(value:)(v0 + 147, &type metadata for Bool, v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100002E14()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100002E20()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

_QWORD *sub_100002E2C@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;
  uint64_t v3;

  result = IntentParameter.wrappedValue.getter(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_100002E64(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;

  v1 = *a1;
  v3 = v1;
  swift_retain(v1);
  IntentParameter.wrappedValue.setter(&v3);
  return swift_release(v1);
}

uint64_t (*sub_100002EA8(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_100002EF0;
}

_QWORD *sub_100002EF4@<X0>(_BYTE *a1@<X8>)
{
  _QWORD *result;
  uint64_t v3;

  result = IntentParameter.wrappedValue.getter(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_100002F2C(char *a1)
{
  char v2;

  v2 = *a1;
  return IntentParameter.wrappedValue.setter(&v2);
}

uint64_t (*sub_100002F60(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_100002EF0;
}

void sub_100002FA8(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

uint64_t sub_100002FD8()
{
  if (qword_1000200C8 != -1)
    swift_once(&qword_1000200C8, sub_100002A78);
  return swift_retain(qword_100020C90);
}

unint64_t sub_10000301C()
{
  return 0xD000000000000015;
}

unint64_t sub_100003040()
{
  unint64_t result;

  result = qword_100020218;
  if (!qword_100020218)
  {
    result = swift_getWitnessTable(&unk_100014740, &type metadata for SnapToGridSettingEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_100020218);
  }
  return result;
}

unint64_t sub_100003088()
{
  unint64_t result;

  result = qword_100020220;
  if (!qword_100020220)
  {
    result = swift_getWitnessTable(&unk_100014768, &type metadata for SnapToGridSettingEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_100020220);
  }
  return result;
}

uint64_t sub_1000030CC(uint64_t a1)
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2(a1, &unk_10001A170, 1) + 8);
}

uint64_t sub_1000030F0(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_1000028DC();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

uint64_t sub_100003130@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1000200B8 != -1)
    swift_once(&qword_1000200B8, sub_100002990);
  v2 = type metadata accessor for LocalizedStringResource(0);
  v3 = sub_100004480(v2, (uint64_t)qword_100020C60);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_1000031B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1000200C0 != -1)
    swift_once(&qword_1000200C0, sub_1000029F0);
  v2 = sub_100004440(&qword_100020340);
  v3 = sub_100004480(v2, (uint64_t)qword_100020C78);
  return sub_1000045F8(v3, a1);
}

uint64_t sub_100003210(uint64_t a1)
{
  _OWORD *v1;
  uint64_t v2;
  uint64_t v4;

  v4 = swift_task_alloc(dword_100020334);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_100003278;
  *(_OWORD *)(v4 + 56) = *v1;
  *(_QWORD *)(v4 + 48) = a1;
  return swift_task_switch(sub_100002B28, 0, 0);
}

uint64_t sub_100003278()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = *v0;
  v1 = *(_QWORD *)(v4 + 16);
  v2 = *v0;
  v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1000032C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_10000411C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_1000032E4()
{
  return 0xD000000000000028;
}

unint64_t sub_100003304()
{
  unint64_t result;

  result = qword_100020230;
  if (!qword_100020230)
  {
    result = swift_getWitnessTable(&unk_10001481C, &type metadata for SnapToGridSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020230);
  }
  return result;
}

unint64_t sub_10000334C()
{
  unint64_t result;

  result = qword_100020238;
  if (!qword_100020238)
  {
    result = swift_getWitnessTable(&unk_100014874, &type metadata for SnapToGridSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020238);
  }
  return result;
}

uint64_t sub_100003390(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_1000033A8, 0, 0);
}

uint64_t sub_1000033A8()
{
  uint64_t v0;
  _BYTE *v1;
  void *v2;
  NSString v3;

  if (qword_1000200F0 != -1)
    swift_once(&qword_1000200F0, sub_1000050B4);
  v1 = *(_BYTE **)(v0 + 16);
  v2 = (void *)qword_100020CC8;
  v3 = String._bridgeToObjectiveC()();
  LOBYTE(v2) = objc_msgSend(v2, "BOOLForKey:", v3);

  *v1 = (_BYTE)v2;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100003458(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + 16) = *a2;
  return swift_task_switch(sub_100003474, 0, 0);
}

uint64_t sub_100003474()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  NSString v3;

  if (qword_1000200F0 != -1)
    swift_once(&qword_1000200F0, sub_1000050B4);
  v1 = *(unsigned __int8 *)(v0 + 16);
  v2 = (void *)qword_100020CC8;
  v3 = String._bridgeToObjectiveC()();
  objc_msgSend(v2, "setBool:forKey:", v1, v3);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100003520()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v20[24];

  v0 = sub_100004440(&qword_1000202E8);
  __chkstk_darwin(v0);
  v2 = &v20[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v3 = sub_100004440(&qword_1000202D0);
  __chkstk_darwin(v3);
  v5 = &v20[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = type metadata accessor for LocalizedStringResource(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = &v20[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __chkstk_darwin(v8);
  v12 = &v20[-v11 - 8];
  if (qword_1000200D8 != -1)
    swift_once(&qword_1000200D8, sub_100003984);
  v13 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_100004480(v13, (uint64_t)qword_100020CB0);
  v14 = swift_beginAccess();
  TypeDisplayRepresentation.name.getter(v14);
  swift_endAccess(v20);
  LocalizedStringResource.init(stringLiteral:)(0x1000000000000011, 0x80000001000171B0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  DisplayRepresentation.Image.init(appBundleIdentifier:)(0xD000000000000012, 0x80000001000171D0);
  v15 = type metadata accessor for DisplayRepresentation.Image(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v2, 0, 1, v15);
  v16 = sub_100004440(&qword_1000202F0);
  v17 = swift_allocObject(v16, ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ 3 * *(_QWORD *)(v7 + 72), *(unsigned __int8 *)(v7 + 80) | 7);
  *(_OWORD *)(v17 + 16) = xmmword_1000145F0;
  LocalizedStringResource.init(stringLiteral:)(0x6F74206E67696C41, 0xED00006469724720);
  LocalizedStringResource.init(stringLiteral:)(0x53207463656A624FLL, 0xEF676E697070616ELL);
  LocalizedStringResource.init(stringLiteral:)(0x616E532064697247, 0xED0000676E697070);
  LocalizedStringResource.init(stringLiteral:)(0x1000000000000127, 0x80000001000171F0);
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v12, v5, v2, v17, v10);
}

uint64_t sub_100003800()
{
  uint64_t v0;
  unint64_t v1;

  v0 = sub_100004440(&qword_100020248);
  sub_100004498(v0, qword_100020C98);
  sub_100004480(v0, (uint64_t)qword_100020C98);
  v1 = sub_1000044D8();
  return _UniqueEntityProvider.init(_:)(&unk_100020308, 0, &type metadata for SnapToGridSettingEntity, v1);
}

uint64_t sub_10000386C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 16) = a1;
  v2 = type metadata accessor for LocalizedStringResource(0);
  *(_QWORD *)(v1 + 24) = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_1000038C4, 0, 0);
}

uint64_t sub_1000038C4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2 = *(_QWORD **)(v0 + 16);
  v1 = *(_QWORD *)(v0 + 24);
  sub_100004440(&qword_100020210);
  LocalizedStringResource.init(stringLiteral:)(0x206F742070616E53, 0xEC00000064697247);
  v3 = sub_100004574(&qword_100020320, &qword_100020328, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *v2 = _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)(v1, &unk_100020310, 0, &unk_100020318, 0, &type metadata for SnapToGridSettingEntity.UpdateIntent_value, v3);
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100003984()
{
  uint64_t v0;

  v0 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_100004498(v0, qword_100020CB0);
  sub_100004480(v0, (uint64_t)qword_100020CB0);
  return TypeDisplayRepresentation.init(stringLiteral:)(0x206F742070616E53, 0xEC00000064697247);
}

uint64_t sub_1000039E8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100003304();
  return _EntityURLRepresentation.init(stringLiteral:)(0xD00000000000004DLL, 0x8000000100017320, a1, v2);
}

uint64_t sub_100003A30()
{
  return sub_100004574(&qword_100020240, &qword_100020248, (uint64_t)&protocol conformance descriptor for _UniqueEntityProvider<A>);
}

uint64_t sub_100003A5C()
{
  uint64_t v0;

  v0 = qword_1000200E0;
  swift_bridgeObjectRetain(off_1000200E8);
  return v0;
}

unint64_t sub_100003A94()
{
  unint64_t result;

  result = qword_100020250;
  if (!qword_100020250)
  {
    result = swift_getWitnessTable(&unk_10001489C, &type metadata for SnapToGridSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020250);
  }
  return result;
}

unint64_t sub_100003ADC()
{
  unint64_t result;

  result = qword_100020258;
  if (!qword_100020258)
  {
    result = swift_getWitnessTable(&unk_1000148D4, &type metadata for SnapToGridSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020258);
  }
  return result;
}

unint64_t sub_100003B24()
{
  unint64_t result;

  result = qword_100020260;
  if (!qword_100020260)
  {
    result = swift_getWitnessTable(&unk_100014904, &type metadata for SnapToGridSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020260);
  }
  return result;
}

uint64_t sub_100003B68()
{
  return sub_100004574((unint64_t *)&unk_100020268, &qword_100020248, (uint64_t)&protocol conformance descriptor for _UniqueEntityProvider<A>);
}

void *sub_100003B94()
{
  return &protocol witness table for String;
}

uint64_t sub_100003BA0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1000200D0 != -1)
    swift_once(&qword_1000200D0, sub_100003800);
  v2 = sub_100004440(&qword_100020248);
  v3 = sub_100004480(v2, (uint64_t)qword_100020C98);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_100003C14(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_10000451C();
  v4 = _URLRepresentableEntity.urlRepresentationParameter.getter(a1, v3);
  return sub_100004560(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8), v1, v4, v5);
}

unint64_t sub_100003C60()
{
  unint64_t result;

  result = qword_100020278;
  if (!qword_100020278)
  {
    result = swift_getWitnessTable(&unk_10001493C, &type metadata for SnapToGridSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020278);
  }
  return result;
}

unint64_t sub_100003CA8()
{
  unint64_t result;

  result = qword_100020280;
  if (!qword_100020280)
  {
    result = swift_getWitnessTable(&unk_100014964, &type metadata for SnapToGridSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020280);
  }
  return result;
}

unint64_t sub_100003CF0()
{
  unint64_t result;

  result = qword_100020288;
  if (!qword_100020288)
  {
    result = swift_getWitnessTable(&unk_10001498C, &type metadata for SnapToGridSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020288);
  }
  return result;
}

unint64_t sub_100003D38()
{
  unint64_t result;

  result = qword_100020290;
  if (!qword_100020290)
  {
    result = swift_getWitnessTable(&unk_1000149E4, &type metadata for SnapToGridSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020290);
  }
  return result;
}

void *sub_100003D7C()
{
  return &protocol witness table for String;
}

uint64_t sub_100003D88@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v4;
  uint64_t result;
  uint64_t v6;

  v4 = sub_1000044D8();
  result = _UniqueEntity.id.getter(a1, v4);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_100003DC8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE v5[24];

  if (qword_1000200D8 != -1)
    swift_once(&qword_1000200D8, sub_100003984);
  v2 = type metadata accessor for TypeDisplayRepresentation(0);
  v3 = sub_100004480(v2, (uint64_t)qword_100020CB0);
  swift_beginAccess(v3, v5, 0, 0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_100003E60()
{
  return sub_100004574(&qword_100020298, &qword_1000202A0, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_100003E8C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100003304();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100003EC8()
{
  unint64_t result;

  result = qword_1000202A8;
  if (!qword_1000202A8)
  {
    result = swift_getWitnessTable(&unk_100014A14, &type metadata for SnapToGridSettingEntity);
    atomic_store(result, (unint64_t *)&qword_1000202A8);
  }
  return result;
}

uint64_t sub_100003F10(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100003D38();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for SnapToGridSettingEntity()
{
  return &type metadata for SnapToGridSettingEntity;
}

uint64_t destroy for SnapToGridSettingEntity.UpdateIntent_value(_QWORD *a1)
{
  swift_release(*a1);
  return swift_release(a1[1]);
}

uint64_t *_s26FreeformWidgetKitExtension23SnapToGridSettingEntityV18UpdateIntent_valueVwCP_0(uint64_t *a1, uint64_t *a2)
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

uint64_t *assignWithCopy for SnapToGridSettingEntity.UpdateIntent_value(uint64_t *a1, uint64_t *a2)
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
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_retain(v6);
  swift_release(v7);
  return a1;
}

__n128 initializeWithTake for SnapToGridSettingEntity.UpdateIntent_value(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for SnapToGridSettingEntity.UpdateIntent_value(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;

  swift_release(*a1);
  v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  swift_release(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for SnapToGridSettingEntity.UpdateIntent_value(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SnapToGridSettingEntity.UpdateIntent_value(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SnapToGridSettingEntity.UpdateIntent_value()
{
  return &type metadata for SnapToGridSettingEntity.UpdateIntent_value;
}

uint64_t sub_1000040F0()
{
  return sub_100004574(&qword_1000202B0, &qword_1000202B8, (uint64_t)&protocol conformance descriptor for IntentResultContainer<A, B, C, D>);
}

uint64_t sub_10000411C()
{
  uint64_t v0;
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t, uint64_t);
  char *v18;
  unint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v23;
  void (*v24)(char *);
  unsigned int v25;
  void (*v26)(char *, uint64_t, uint64_t, uint64_t);
  char *v27;
  char *v28;
  char v29;
  uint64_t v30;

  sub_100004440(&qword_1000202C0);
  ((void (*)(void))__chkstk_darwin)();
  v28 = (char *)&v23 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v1 = type metadata accessor for InputConnectionBehavior(0);
  v2 = *(_QWORD *)(v1 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v27 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004440(&qword_1000202C8);
  v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v23 - v7;
  v9 = sub_100004440(&qword_1000202D0);
  __chkstk_darwin(v9);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_100004440(&qword_1000202D8);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000016, 0x8000000100017160);
  v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v26(v11, 1, 1, v12);
  v30 = 0;
  v16 = type metadata accessor for IntentDialog(0);
  v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56);
  v17(v8, 1, 1, v16);
  v17(v6, 1, 1, v16);
  v25 = enum case for InputConnectionBehavior.default(_:);
  v24 = *(void (**)(char *))(v2 + 104);
  v18 = v27;
  v24(v27);
  v19 = sub_100003304();
  v23 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v15, v11, &v30, v8, v6, v18, v19);
  sub_100004440(&qword_1000202E0);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000026, 0x8000000100017180);
  v26(v11, 1, 1, v12);
  v29 = 2;
  v20 = type metadata accessor for Bool.IntentDisplayName(0);
  v21 = v28;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v28, 1, 1, v20);
  v17(v8, 1, 1, v16);
  ((void (*)(char *, _QWORD, uint64_t))v24)(v18, v25, v1);
  IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)(v15, v11, &v29, v21, v8, v18);
  return v23;
}

uint64_t sub_100004440(uint64_t *a1)
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

uint64_t sub_100004480(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *sub_100004498(uint64_t a1, uint64_t *a2)
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

unint64_t sub_1000044D8()
{
  unint64_t result;

  result = qword_1000202F8;
  if (!qword_1000202F8)
  {
    result = swift_getWitnessTable(&unk_1000147BC, &type metadata for SnapToGridSettingEntity);
    atomic_store(result, (unint64_t *)&qword_1000202F8);
  }
  return result;
}

unint64_t sub_10000451C()
{
  unint64_t result;

  result = qword_100020300;
  if (!qword_100020300)
  {
    result = swift_getWitnessTable(&unk_100014784, &type metadata for SnapToGridSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020300);
  }
  return result;
}

uint64_t sub_100004560(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_100004574(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_10000294C(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000045B4()
{
  unint64_t result;

  result = qword_100020338;
  if (!qword_100020338)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Bool, &type metadata for Bool);
    atomic_store(result, (unint64_t *)&qword_100020338);
  }
  return result;
}

uint64_t sub_1000045F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100004440(&qword_100020340);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

ValueMetadata *type metadata accessor for EdgeGuidesToggleControl()
{
  return &type metadata for EdgeGuidesToggleControl;
}

uint64_t sub_100004650(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001A1C0, 1);
}

uint64_t sub_100004660@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t KeyPath;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t OpaqueTypeConformance2;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;

  v44 = a1;
  v1 = sub_100004440(&qword_100020348);
  v37 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v3 = (char *)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100004440(&qword_100020350);
  v39 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100004440(&qword_100020358);
  v8 = *(_QWORD *)(v7 - 8);
  v40 = v7;
  v41 = v8;
  __chkstk_darwin(v7);
  v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100004440(&qword_100020360);
  v12 = *(_QWORD *)(v11 - 8);
  v42 = v11;
  v43 = v12;
  __chkstk_darwin(v11);
  v38 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(&unk_100014B18);
  v15 = sub_100004AF4();
  ControlToggle.init<A, B, C, D, E, F, G>(kind:intentUpdatableProperty:title:subtitle:value:)(0xD000000000000023, 0x8000000100017400, KeyPath, sub_1000049C8, 0, sub_1000049E4, 0, sub_100004A64, 0, &type metadata for Text, &type metadata for Text, &type metadata for Text, v15, &protocol witness table for Text, &protocol witness table for Text, &protocol witness table for Text);
  v16 = LocalizedStringKey.init(stringLiteral:)(0x65676445776F6853, 0xEE00736564697547);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = sub_100004B38();
  WidgetConfiguration.configurationDisplayName(_:)(v16, v18, v20 & 1, v22, v1, v23);
  swift_bridgeObjectRelease(v22);
  swift_bridgeObjectRelease(v18);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v3, v1);
  v24 = LocalizedStringKey.init(stringLiteral:)(0xD00000000000001ELL, 0x8000000100017430);
  v26 = v25;
  LOBYTE(v3) = v27;
  v29 = v28;
  v45 = v1;
  v46 = v23;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v45, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  WidgetConfiguration.description(_:)(v24, v26, v3 & 1, v29, v4, OpaqueTypeConformance2);
  swift_bridgeObjectRelease(v29);
  swift_bridgeObjectRelease(v26);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v6, v4);
  v45 = v4;
  v46 = OpaqueTypeConformance2;
  v31 = swift_getOpaqueTypeConformance2(&v45, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description(_:)>>, 1);
  v32 = v38;
  v33 = v40;
  WidgetConfiguration.disablesControlStateCaching()(v40, v31);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v10, v33);
  v45 = v33;
  v46 = v31;
  v34 = swift_getOpaqueTypeConformance2(&v45, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v35 = v42;
  WidgetConfiguration.hiddenControl()(v42, v34);
  return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v32, v35);
}

uint64_t sub_1000049C8@<X0>(uint64_t a1@<X8>)
{
  return sub_100004A00(0xD000000000000010, 0x8000000100017450, a1);
}

uint64_t sub_1000049E4@<X0>(uint64_t a1@<X8>)
{
  return sub_100004A00(0x1000000000000011, 0x80000001000171B0, a1);
}

uint64_t sub_100004A00@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char v7;
  uint64_t v8;

  v4 = LocalizedStringKey.init(stringLiteral:)(a1, a2);
  result = Text.init(_:tableName:bundle:comment:)(v4);
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = v6;
  *(_BYTE *)(a3 + 16) = v7 & 1;
  *(_QWORD *)(a3 + 24) = v8;
  return result;
}

uint64_t sub_100004A64@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  char v8;
  uint64_t v9;

  if ((a1 & 1) != 0)
  {
    v3 = 0x656C6269736956;
    v4 = 0xE700000000000000;
  }
  else
  {
    v3 = 6710863;
    v4 = 0xE300000000000000;
  }
  v5 = LocalizedStringKey.init(stringLiteral:)(v3, v4);
  result = Text.init(_:tableName:bundle:comment:)(v5);
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v7;
  *(_BYTE *)(a2 + 16) = v8 & 1;
  *(_QWORD *)(a2 + 24) = v9;
  return result;
}

unint64_t sub_100004AF4()
{
  unint64_t result;

  result = qword_100020368;
  if (!qword_100020368)
  {
    result = swift_getWitnessTable(&unk_100015AFC, &type metadata for EdgeGuidesSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020368);
  }
  return result;
}

unint64_t sub_100004B38()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100020370;
  if (!qword_100020370)
  {
    v1 = sub_10000294C(&qword_100020348);
    result = swift_getWitnessTable(&protocol conformance descriptor for ControlToggle<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100020370);
  }
  return result;
}

uint64_t sub_100004B84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t OpaqueTypeConformance2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;

  v0 = sub_10000294C(&qword_100020360);
  v1 = sub_10000294C(&qword_100020358);
  v2 = sub_10000294C(&qword_100020350);
  v7 = sub_10000294C(&qword_100020348);
  v8 = sub_100004B38();
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v7 = v2;
  v8 = OpaqueTypeConformance2;
  v4 = swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description(_:)>>, 1);
  v7 = v1;
  v8 = v4;
  v5 = swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v7 = v0;
  v8 = v5;
  return swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of WidgetConfiguration.hiddenControl()>>, 1);
}

ValueMetadata *type metadata accessor for SelectAndScrollToggleControl()
{
  return &type metadata for SelectAndScrollToggleControl;
}

uint64_t sub_100004C60(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001A204, 1);
}

uint64_t sub_100004C70@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t KeyPath;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t OpaqueTypeConformance2;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;

  v44 = a1;
  v1 = sub_100004440(&qword_100020348);
  v37 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v3 = (char *)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100004440(&qword_100020350);
  v39 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100004440(&qword_100020358);
  v8 = *(_QWORD *)(v7 - 8);
  v40 = v7;
  v41 = v8;
  __chkstk_darwin(v7);
  v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100004440(&qword_100020360);
  v12 = *(_QWORD *)(v11 - 8);
  v42 = v11;
  v43 = v12;
  __chkstk_darwin(v11);
  v38 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(&unk_100014BA0);
  v15 = sub_100005070();
  ControlToggle.init<A, B, C, D, E, F, G>(kind:intentUpdatableProperty:title:subtitle:value:)(0xD000000000000028, 0x8000000100017470, KeyPath, sub_100004FD4, 0, sub_1000049E4, 0, sub_100004FF0, 0, &type metadata for Text, &type metadata for Text, &type metadata for Text, v15, &protocol witness table for Text, &protocol witness table for Text, &protocol witness table for Text);
  v16 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000015, 0x80000001000174A0);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = sub_100004B38();
  WidgetConfiguration.configurationDisplayName(_:)(v16, v18, v20 & 1, v22, v1, v23);
  swift_bridgeObjectRelease(v22);
  swift_bridgeObjectRelease(v18);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v3, v1);
  v24 = LocalizedStringKey.init(stringLiteral:)(0xD00000000000003ELL, 0x80000001000174C0);
  v26 = v25;
  LOBYTE(v3) = v27;
  v29 = v28;
  v45 = v1;
  v46 = v23;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v45, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  WidgetConfiguration.description(_:)(v24, v26, v3 & 1, v29, v4, OpaqueTypeConformance2);
  swift_bridgeObjectRelease(v29);
  swift_bridgeObjectRelease(v26);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v6, v4);
  v45 = v4;
  v46 = OpaqueTypeConformance2;
  v31 = swift_getOpaqueTypeConformance2(&v45, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description(_:)>>, 1);
  v32 = v38;
  v33 = v40;
  WidgetConfiguration.disablesControlStateCaching()(v40, v31);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v10, v33);
  v45 = v33;
  v46 = v31;
  v34 = swift_getOpaqueTypeConformance2(&v45, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v35 = v42;
  WidgetConfiguration.hiddenControl()(v42, v34);
  return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v32, v35);
}

uint64_t sub_100004FD4@<X0>(uint64_t a1@<X8>)
{
  return sub_100004A00(0xD000000000000011, 0x8000000100017500, a1);
}

uint64_t sub_100004FF0@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  char v8;
  uint64_t v9;

  if ((a1 & 1) != 0)
  {
    v3 = 28239;
    v4 = 0xE200000000000000;
  }
  else
  {
    v3 = 6710863;
    v4 = 0xE300000000000000;
  }
  v5 = LocalizedStringKey.init(stringLiteral:)(v3, v4);
  result = Text.init(_:tableName:bundle:comment:)(v5);
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v7;
  *(_BYTE *)(a2 + 16) = v8 & 1;
  *(_QWORD *)(a2 + 24) = v9;
  return result;
}

unint64_t sub_100005070()
{
  unint64_t result;

  result = qword_100020378;
  if (!qword_100020378)
  {
    result = swift_getWitnessTable(&unk_100014D8C, &type metadata for SelectAndScrollSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020378);
  }
  return result;
}

void sub_1000050B4()
{
  id v0;
  NSString v1;
  id v2;

  v0 = objc_allocWithZone((Class)NSUserDefaults);
  v1 = String._bridgeToObjectiveC()();
  v2 = objc_msgSend(v0, "initWithSuiteName:", v1);

  if (v2)
    qword_100020CC8 = (uint64_t)v2;
  else
    __break(1u);
}

unint64_t sub_10000512C()
{
  unint64_t result;

  result = qword_100020390;
  if (!qword_100020390)
  {
    result = swift_getWitnessTable(&unk_100014C80, &type metadata for SelectAndScrollSettingEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_100020390);
  }
  return result;
}

uint64_t sub_100005170()
{
  return sub_100004574(&qword_100020398, &qword_1000203A0, (uint64_t)&protocol conformance descriptor for _IntentUpdatableEntityProperty<A, B, C>);
}

uint64_t sub_10000519C()
{
  uint64_t v0;

  v0 = type metadata accessor for LocalizedStringResource(0);
  sub_100004498(v0, qword_100020CD0);
  sub_100004480(v0, (uint64_t)qword_100020CD0);
  return LocalizedStringResource.init(stringLiteral:)(0xD000000000000018, 0x8000000100017790);
}

uint64_t sub_1000051FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_100004440(&qword_100020340);
  sub_100004498(v0, qword_100020CE8);
  v1 = sub_100004480(v0, (uint64_t)qword_100020CE8);
  IntentDescription.init(stringLiteral:)(0xD000000000000047, 0x8000000100017740);
  v2 = type metadata accessor for IntentDescription(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 0, 1, v2);
}

uint64_t sub_100005284()
{
  uint64_t result;

  result = swift_getKeyPath(&unk_100015048);
  qword_100020D00 = result;
  return result;
}

uint64_t sub_1000052A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  return swift_task_switch(sub_1000052C4, 0, 0);
}

uint64_t sub_1000052C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 16));
  v1 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v0 + 24) = v1;
  *(_QWORD *)(v0 + 72) = v1;
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 146));
  *(_BYTE *)(v0 + 145) = *(_BYTE *)(v0 + 146);
  if (qword_100020108 != -1)
    swift_once(&qword_100020108, sub_100005284);
  v2 = qword_100020D00;
  *(_QWORD *)(v0 + 80) = qword_100020D00;
  v3 = async function pointer to AppEntity._setValue<A, B, C>(_:for:)[1];
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  *(_QWORD *)(v0 + 88) = v4;
  v5 = sub_100004574(&qword_100020468, &qword_100020470, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *(_QWORD *)(v0 + 96) = v5;
  *v4 = v0;
  v4[1] = sub_1000053C4;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 145, v2, &type metadata for Bool, v5);
}

uint64_t sub_1000053C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 88);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 72);
  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc(v2);
  swift_release(v4);
  swift_release(v3);
  if (v0)
    v5 = sub_100002E14;
  else
    v5 = sub_100005444;
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_100005444()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  IntentParameter.wrappedValue.getter(v0 + 5);
  v1 = v0[5];
  v0[4] = v1;
  v2 = qword_100020D00;
  v0[14] = v1;
  v0[15] = v2;
  v3 = async function pointer to AppEntity._value<A, B>(for:)[1];
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  v0[16] = v4;
  *v4 = v0;
  v4[1] = sub_100002D3C;
  return AppEntity._value<A, B>(for:)(v0 + 18, v2, v0[12]);
}

uint64_t sub_1000054D8()
{
  if (qword_100020108 != -1)
    swift_once(&qword_100020108, sub_100005284);
  return swift_retain(qword_100020D00);
}

unint64_t sub_10000551C()
{
  unint64_t result;

  result = qword_1000203A8;
  if (!qword_1000203A8)
  {
    result = swift_getWitnessTable(&unk_100014D10, &type metadata for SelectAndScrollSettingEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_1000203A8);
  }
  return result;
}

unint64_t sub_100005564()
{
  unint64_t result;

  result = qword_1000203B0;
  if (!qword_1000203B0)
  {
    result = swift_getWitnessTable(&unk_100014D38, &type metadata for SelectAndScrollSettingEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_1000203B0);
  }
  return result;
}

uint64_t sub_1000055A8(uint64_t a1)
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2(a1, &unk_10001A264, 1) + 8);
}

uint64_t sub_1000055CC(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_10000512C();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

uint64_t sub_10000560C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1000200F8 != -1)
    swift_once(&qword_1000200F8, sub_10000519C);
  v2 = type metadata accessor for LocalizedStringResource(0);
  v3 = sub_100004480(v2, (uint64_t)qword_100020CD0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_10000567C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_100020100 != -1)
    swift_once(&qword_100020100, sub_1000051FC);
  v2 = sub_100004440(&qword_100020340);
  v3 = sub_100004480(v2, (uint64_t)qword_100020CE8);
  return sub_1000045F8(v3, a1);
}

uint64_t sub_1000056DC(uint64_t a1)
{
  _OWORD *v1;
  uint64_t v2;
  uint64_t v4;

  v4 = swift_task_alloc(dword_10002047C);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_100003278;
  *(_OWORD *)(v4 + 56) = *v1;
  *(_QWORD *)(v4 + 48) = a1;
  return swift_task_switch(sub_1000052C4, 0, 0);
}

uint64_t sub_100005744@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1000062F8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100005768()
{
  return 0xD00000000000002DLL;
}

unint64_t sub_100005788()
{
  unint64_t result;

  result = qword_1000203C0;
  if (!qword_1000203C0)
  {
    result = swift_getWitnessTable(&unk_100014DEC, &type metadata for SelectAndScrollSettingEntity);
    atomic_store(result, (unint64_t *)&qword_1000203C0);
  }
  return result;
}

unint64_t sub_1000057D0()
{
  unint64_t result;

  result = qword_1000203C8;
  if (!qword_1000203C8)
  {
    result = swift_getWitnessTable(&unk_100014E44, &type metadata for SelectAndScrollSettingEntity);
    atomic_store(result, (unint64_t *)&qword_1000203C8);
  }
  return result;
}

uint64_t sub_100005814(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_10000582C, 0, 0);
}

uint64_t sub_10000582C()
{
  uint64_t v0;
  _BYTE *v1;
  void *v2;
  NSString v3;

  if (qword_1000200F0 != -1)
    swift_once(&qword_1000200F0, sub_1000050B4);
  v1 = *(_BYTE **)(v0 + 16);
  v2 = (void *)qword_100020CC8;
  v3 = String._bridgeToObjectiveC()();
  LOBYTE(v2) = objc_msgSend(v2, "BOOLForKey:", v3);

  *v1 = (_BYTE)v2;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000058D4(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + 16) = *a2;
  return swift_task_switch(sub_1000058F0, 0, 0);
}

uint64_t sub_1000058F0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  NSString v3;

  if (qword_1000200F0 != -1)
    swift_once(&qword_1000200F0, sub_1000050B4);
  v1 = *(unsigned __int8 *)(v0 + 16);
  v2 = (void *)qword_100020CC8;
  v3 = String._bridgeToObjectiveC()();
  objc_msgSend(v2, "setBool:forKey:", v1, v3);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100005994()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE v19[24];

  v0 = sub_100004440(&qword_1000202E8);
  __chkstk_darwin(v0);
  v2 = &v19[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v3 = sub_100004440(&qword_1000202D0);
  __chkstk_darwin(v3);
  v5 = &v19[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = type metadata accessor for LocalizedStringResource(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = &v19[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __chkstk_darwin(v8);
  v12 = &v19[-v11 - 8];
  if (qword_100020118 != -1)
    swift_once(&qword_100020118, sub_100005D34);
  v13 = type metadata accessor for TypeDisplayRepresentation(0);
  v14 = sub_100004480(v13, (uint64_t)qword_100020D20);
  v15 = swift_beginAccess(v14, v19, 32, 0);
  TypeDisplayRepresentation.name.getter(v15);
  swift_endAccess(v19);
  LocalizedStringResource.init(stringLiteral:)(0x1000000000000011, 0x80000001000171B0);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  DisplayRepresentation.Image.init(appBundleIdentifier:)(0xD000000000000012, 0x80000001000171D0);
  v16 = type metadata accessor for DisplayRepresentation.Image(0);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v2, 0, 1, v16);
  LocalizedStringResource.init(stringLiteral:)(0xD0000000000000FCLL, 0x8000000100017580);
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v12, v5, v2, &_swiftEmptyArrayStorage, v10);
}

uint64_t sub_100005BB4()
{
  uint64_t v0;
  unint64_t v1;

  v0 = sub_100004440(&qword_1000203D8);
  sub_100004498(v0, qword_100020D08);
  sub_100004480(v0, (uint64_t)qword_100020D08);
  v1 = sub_100005070();
  return _UniqueEntityProvider.init(_:)(&unk_100020450, 0, &type metadata for SelectAndScrollSettingEntity, v1);
}

uint64_t sub_100005C20(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 16) = a1;
  v2 = type metadata accessor for LocalizedStringResource(0);
  *(_QWORD *)(v1 + 24) = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100005C78, 0, 0);
}

uint64_t sub_100005C78()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2 = *(_QWORD **)(v0 + 16);
  v1 = *(_QWORD *)(v0 + 24);
  sub_100004440(&qword_1000203A0);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000011, 0x8000000100017500);
  v3 = sub_100004574(&qword_100020468, &qword_100020470, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *v2 = _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)(v1, &unk_100020458, 0, &unk_100020460, 0, &type metadata for SelectAndScrollSettingEntity.UpdateIntent_value, v3);
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100005D34()
{
  uint64_t v0;

  v0 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_100004498(v0, qword_100020D20);
  sub_100004480(v0, (uint64_t)qword_100020D20);
  return TypeDisplayRepresentation.init(stringLiteral:)(0xD000000000000011, 0x8000000100017500);
}

uint64_t sub_100005D94(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100005788();
  return _EntityURLRepresentation.init(stringLiteral:)(0xD000000000000052, 0x80000001000176B0, a1, v2);
}

uint64_t sub_100005DDC()
{
  return sub_100004574(&qword_1000203D0, &qword_1000203D8, (uint64_t)&protocol conformance descriptor for _UniqueEntityProvider<A>);
}

uint64_t sub_100005E08()
{
  uint64_t v0;

  v0 = qword_100020380;
  swift_bridgeObjectRetain(off_100020388);
  return v0;
}

unint64_t sub_100005E40()
{
  unint64_t result;

  result = qword_1000203E0;
  if (!qword_1000203E0)
  {
    result = swift_getWitnessTable(&unk_100014E6C, &type metadata for SelectAndScrollSettingEntity);
    atomic_store(result, (unint64_t *)&qword_1000203E0);
  }
  return result;
}

unint64_t sub_100005E88()
{
  unint64_t result;

  result = qword_1000203E8;
  if (!qword_1000203E8)
  {
    result = swift_getWitnessTable(&unk_100014EA4, &type metadata for SelectAndScrollSettingEntity);
    atomic_store(result, (unint64_t *)&qword_1000203E8);
  }
  return result;
}

unint64_t sub_100005ED0()
{
  unint64_t result;

  result = qword_1000203F0;
  if (!qword_1000203F0)
  {
    result = swift_getWitnessTable(&unk_100014ED4, &type metadata for SelectAndScrollSettingEntity);
    atomic_store(result, (unint64_t *)&qword_1000203F0);
  }
  return result;
}

uint64_t sub_100005F14()
{
  return sub_100004574((unint64_t *)&unk_1000203F8, &qword_1000203D8, (uint64_t)&protocol conformance descriptor for _UniqueEntityProvider<A>);
}

uint64_t sub_100005F40@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_100020110 != -1)
    swift_once(&qword_100020110, sub_100005BB4);
  v2 = sub_100004440(&qword_1000203D8);
  v3 = sub_100004480(v2, (uint64_t)qword_100020D08);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_100005FB4(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_10000661C();
  v4 = _URLRepresentableEntity.urlRepresentationParameter.getter(a1, v3);
  return sub_100004560(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8), v1, v4, v5);
}

unint64_t sub_100006000()
{
  unint64_t result;

  result = qword_100020408;
  if (!qword_100020408)
  {
    result = swift_getWitnessTable(&unk_100014F0C, &type metadata for SelectAndScrollSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020408);
  }
  return result;
}

unint64_t sub_100006048()
{
  unint64_t result;

  result = qword_100020410;
  if (!qword_100020410)
  {
    result = swift_getWitnessTable(&unk_100014F34, &type metadata for SelectAndScrollSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020410);
  }
  return result;
}

unint64_t sub_100006090()
{
  unint64_t result;

  result = qword_100020418;
  if (!qword_100020418)
  {
    result = swift_getWitnessTable(&unk_100014F5C, &type metadata for SelectAndScrollSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020418);
  }
  return result;
}

unint64_t sub_1000060D8()
{
  unint64_t result;

  result = qword_100020420;
  if (!qword_100020420)
  {
    result = swift_getWitnessTable(&unk_100014FB4, &type metadata for SelectAndScrollSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020420);
  }
  return result;
}

uint64_t sub_10000611C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v4;
  uint64_t result;
  uint64_t v6;

  v4 = sub_100005070();
  result = _UniqueEntity.id.getter(a1, v4);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_100006158@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE v5[24];

  if (qword_100020118 != -1)
    swift_once(&qword_100020118, sub_100005D34);
  v2 = type metadata accessor for TypeDisplayRepresentation(0);
  v3 = sub_100004480(v2, (uint64_t)qword_100020D20);
  swift_beginAccess(v3, v5, 0, 0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_1000061F0()
{
  return sub_100004574(&qword_100020428, &qword_100020430, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_10000621C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100005788();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100006258()
{
  unint64_t result;

  result = qword_100020438;
  if (!qword_100020438)
  {
    result = swift_getWitnessTable(&unk_100014FE4, &type metadata for SelectAndScrollSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020438);
  }
  return result;
}

uint64_t sub_1000062A0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000060D8();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for SelectAndScrollSettingEntity()
{
  return &type metadata for SelectAndScrollSettingEntity;
}

ValueMetadata *type metadata accessor for SelectAndScrollSettingEntity.UpdateIntent_value()
{
  return &type metadata for SelectAndScrollSettingEntity.UpdateIntent_value;
}

uint64_t sub_1000062F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t, uint64_t);
  char *v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v25;
  void (*v26)(char *);
  unsigned int v27;
  void (*v28)(char *, uint64_t, uint64_t, uint64_t);
  char *v29;
  char *v30;
  char v31;
  uint64_t v32;

  v0 = sub_100004440(&qword_1000202C0);
  __chkstk_darwin(v0);
  v30 = (char *)&v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for InputConnectionBehavior(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v29 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100004440(&qword_1000202C8);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v25 - v9;
  v11 = sub_100004440(&qword_1000202D0);
  __chkstk_darwin(v11);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for LocalizedStringResource(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_100004440(&qword_100020440);
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000001BLL, 0x8000000100017520);
  v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  v32 = 0;
  v18 = type metadata accessor for IntentDialog(0);
  v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56);
  v19(v10, 1, 1, v18);
  v19(v8, 1, 1, v18);
  v27 = enum case for InputConnectionBehavior.default(_:);
  v26 = *(void (**)(char *))(v3 + 104);
  v20 = v29;
  v26(v29);
  v21 = sub_100005788();
  v25 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v17, v13, &v32, v10, v8, v20, v21);
  sub_100004440(&qword_1000202E0);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000030, 0x8000000100017540);
  v28(v13, 1, 1, v14);
  v31 = 2;
  v22 = type metadata accessor for Bool.IntentDisplayName(0);
  v23 = v30;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v30, 1, 1, v22);
  v19(v10, 1, 1, v18);
  ((void (*)(char *, _QWORD, uint64_t))v26)(v20, v27, v2);
  IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)(v17, v13, &v31, v23, v10, v20);
  return v25;
}

unint64_t sub_10000661C()
{
  unint64_t result;

  result = qword_100020448;
  if (!qword_100020448)
  {
    result = swift_getWitnessTable(&unk_100014D54, &type metadata for SelectAndScrollSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020448);
  }
  return result;
}

uint64_t sub_100006660@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = v2;
  return swift_retain(v2);
}

uint64_t sub_10000666C()
{
  uint64_t v0;

  v0 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_100004498(v0, qword_100020D38);
  sub_100004480(v0, (uint64_t)qword_100020D38);
  return TypeDisplayRepresentation.init(stringLiteral:)(0xD000000000000011, 0x8000000100017CE0);
}

unint64_t sub_1000066CC()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  unint64_t v7;
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
  uint64_t v18;
  void (*v19)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  _BYTE *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  void (*v35)(char *, _QWORD, uint64_t, uint64_t);
  _BYTE *v36;
  void (*v37)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE *v42;
  char *v43;
  unint64_t v44;
  uint64_t v45;
  void (*v46)(char *, _QWORD, uint64_t, uint64_t);
  unint64_t v47;
  char *v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  void (*v53)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v54;
  char *v55;
  unint64_t result;
  char *v57;
  _BYTE *v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  void (*v69)(char *, _QWORD, uint64_t, uint64_t);
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  void (*v74)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;

  v0 = sub_100004440(&qword_1000202E8);
  __chkstk_darwin(v0);
  v2 = (char *)&v57 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_100004440(&qword_1000202D0);
  __chkstk_darwin(v3);
  v5 = (char *)&v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for LocalizedStringResource(0);
  v67 = *(_QWORD *)(v6 - 8);
  v7 = v67;
  v8 = __chkstk_darwin(v6);
  v76 = (char *)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v11 = (char *)&v57 - v10;
  v12 = sub_100004440(&qword_100020500);
  v13 = sub_100004440(&qword_100020508);
  v14 = *(_QWORD *)(v13 - 8);
  v77 = v13;
  v15 = *(_QWORD *)(v14 + 72);
  v16 = *(unsigned __int8 *)(v14 + 80);
  v17 = (v16 + 32) & ~v16;
  v73 = v15;
  v18 = swift_allocObject(v12, v17 - v15 + 8 * v15, v16 | 7);
  v68 = v18;
  *(_OWORD *)(v18 + 16) = xmmword_100015070;
  v78 = v18 + v17;
  *(_BYTE *)(v18 + v17) = 0;
  LocalizedStringResource.init(stringLiteral:)(0x6D726F6665657246, 0xE800000000000000);
  LocalizedStringResource.init(stringLiteral:)(1936748609, 0xE400000000000000);
  v19 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56);
  v20 = v6;
  v75 = v6;
  v19(v5, 0, 1, v6);
  v74 = v19;
  v70 = 0x80000001000171D0;
  DisplayRepresentation.Image.init(appBundleIdentifier:)(0xD000000000000012, 0x80000001000171D0);
  v21 = type metadata accessor for DisplayRepresentation.Image(0);
  v22 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56);
  v71 = v21;
  v22(v2, 0, 1, v21);
  v69 = v22;
  DisplayRepresentation.init(title:subtitle:image:)(v11, v5, v2);
  v23 = v77;
  v59 = v78 + v15 + *(int *)(v77 + 48);
  *(_BYTE *)(v78 + v15) = 1;
  LocalizedStringResource.init(stringLiteral:)(0x736552206874614DLL, 0xEC00000073746C75);
  v72 = 0x80000001000171B0;
  LocalizedStringResource.init(stringLiteral:)(0x1000000000000011, 0x80000001000171B0);
  v19(v5, 0, 1, v20);
  DisplayRepresentation.Image.init(appBundleIdentifier:)(0xD000000000000012, 0x80000001000171D0);
  v22(v2, 0, 1, v21);
  v24 = sub_100004440(&qword_1000202F0);
  v25 = *(_QWORD *)(v67 + 72);
  v26 = *(unsigned __int8 *)(v67 + 80);
  v62 = (v26 + 32) & ~v26;
  v63 = v25;
  v60 = 2 * v25;
  v65 = v62 + 3 * v25;
  v66 = v24;
  v64 = v26 | 7;
  v27 = swift_allocObject(v24, v65, v26 | 7);
  v61 = xmmword_1000145F0;
  *(_OWORD *)(v27 + 16) = xmmword_1000145F0;
  LocalizedStringResource.init(stringLiteral:)(0x757145206874614DLL, 0xEE00736E6F697461);
  v67 = 0xD000000000000011;
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000011, 0x80000001000177B0);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000010, 0x80000001000177D0);
  v28 = v76;
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000100, 0x80000001000177F0);
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v11, v5, v2, v27, v28);
  v29 = v73;
  v59 = 2 * v73;
  v30 = (_BYTE *)(v78 + 2 * v73);
  v31 = v23;
  v58 = &v30[*(int *)(v23 + 48)];
  *v30 = 2;
  LocalizedStringResource.init(stringLiteral:)(0x47207265746E6543, 0xED00007365646975);
  v32 = v72;
  LocalizedStringResource.init(stringLiteral:)(0x1000000000000011, v72);
  v74(v5, 0, 1, v75);
  v33 = v70;
  DisplayRepresentation.Image.init(appBundleIdentifier:)(0xD000000000000012, v70);
  v34 = v71;
  v35 = v69;
  v69(v2, 0, 1, v71);
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000014BLL, 0x8000000100017900);
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v11, v5, v2, &_swiftEmptyArrayStorage, v28);
  v36 = (_BYTE *)(v78 + v59 + v29);
  v59 = (uint64_t)&v36[*(int *)(v31 + 48)];
  *v36 = 3;
  LocalizedStringResource.init(stringLiteral:)(0x6975472065676445, 0xEB00000000736564);
  LocalizedStringResource.init(stringLiteral:)(0x1000000000000011, v32);
  v37 = v74;
  v38 = v75;
  v74(v5, 0, 1, v75);
  DisplayRepresentation.Image.init(appBundleIdentifier:)(0xD000000000000012, v33);
  v39 = v2;
  v35(v2, 0, 1, v34);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000148, 0x8000000100017A50);
  v57 = v11;
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v11, v5, v2, &_swiftEmptyArrayStorage, v28);
  v40 = v73;
  v59 = 4 * v73;
  v41 = v78;
  v42 = (_BYTE *)(v78 + 4 * v73);
  v58 = &v42[*(int *)(v77 + 48)];
  *v42 = 4;
  LocalizedStringResource.init(stringLiteral:)(0x20676E6963617053, 0xEE00736564697547);
  v43 = v5;
  v44 = v72;
  LocalizedStringResource.init(stringLiteral:)(0x1000000000000011, v72);
  v45 = v38;
  v46 = v37;
  v37(v5, 0, 1, v45);
  v47 = v70;
  DisplayRepresentation.Image.init(appBundleIdentifier:)(0xD000000000000012, v70);
  v48 = v39;
  v49 = v71;
  v35(v39, 0, 1, v71);
  v50 = v76;
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000013CLL, 0x8000000100017BA0);
  v51 = v57;
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v57, v43, v48, &_swiftEmptyArrayStorage, v50);
  *(_BYTE *)(v41 + v59 + v40) = 5;
  LocalizedStringResource.init(stringLiteral:)(0x206F742070616E53, 0xEC00000064697247);
  LocalizedStringResource.init(stringLiteral:)(0x1000000000000011, v44);
  v52 = v75;
  v46(v43, 0, 1, v75);
  DisplayRepresentation.Image.init(appBundleIdentifier:)(0xD000000000000012, v47);
  v53 = v69;
  v69(v48, 0, 1, v49);
  v54 = swift_allocObject(v66, v65, v64);
  *(_OWORD *)(v54 + 16) = v61;
  LocalizedStringResource.init(stringLiteral:)(0x6F74206E67696C41, 0xED00006469724720);
  LocalizedStringResource.init(stringLiteral:)(0x53207463656A624FLL, 0xEF676E697070616ELL);
  LocalizedStringResource.init(stringLiteral:)(0x616E532064697247, 0xED0000676E697070);
  v55 = v76;
  LocalizedStringResource.init(stringLiteral:)(0x1000000000000127, 0x80000001000171F0);
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v51, v43, v48, v54, v55);
  *(_BYTE *)(v78 + 6 * v73) = 6;
  LocalizedStringResource.init(stringLiteral:)(v67, 0x8000000100017500);
  LocalizedStringResource.init(stringLiteral:)(0x1000000000000011, v72);
  v74(v43, 0, 1, v52);
  DisplayRepresentation.Image.init(appBundleIdentifier:)(0xD000000000000012, v70);
  v53(v48, 0, 1, v71);
  LocalizedStringResource.init(stringLiteral:)(0xD0000000000000FCLL, 0x8000000100017580);
  DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v51, v43, v48, &_swiftEmptyArrayStorage, v55);
  result = sub_10000BAC8(v68);
  qword_100020D50 = result;
  return result;
}

uint64_t sub_100007018()
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
  unint64_t v9;

  v0 = sub_100004440(&qword_100020518);
  sub_100004498(v0, qword_100020D58);
  sub_100004480(v0, (uint64_t)qword_100020D58);
  v1 = sub_100004440(&qword_100020520);
  v2 = *(_QWORD *)(sub_100004440(&qword_100020528) - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = *(unsigned __int8 *)(v2 + 80);
  v5 = (v4 + 32) & ~v4;
  v6 = swift_allocObject(v1, v5 - v3 + 8 * v3, v4 | 7);
  *(_OWORD *)(v6 + 16) = xmmword_100015070;
  v7 = v6 + v5;
  *(_BYTE *)(v6 + v5) = 0;
  v8 = sub_100007534();
  _EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)(0xD000000000000040, 0x8000000100017D00, &type metadata for FreeformSettingsDeepLinks, v8);
  *(_BYTE *)(v7 + v3) = 1;
  _EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)(0xD00000000000004BLL, 0x8000000100017D50, &type metadata for FreeformSettingsDeepLinks, v8);
  *(_BYTE *)(v7 + 2 * v3) = 2;
  _EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)(0xD00000000000004ELL, 0x8000000100017DA0, &type metadata for FreeformSettingsDeepLinks, v8);
  *(_BYTE *)(v7 + 3 * v3) = 3;
  _EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)(0xD00000000000004CLL, 0x8000000100017DF0, &type metadata for FreeformSettingsDeepLinks, v8);
  *(_BYTE *)(v7 + 4 * v3) = 4;
  _EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)(0xD00000000000004FLL, 0x8000000100017E40, &type metadata for FreeformSettingsDeepLinks, v8);
  *(_BYTE *)(v7 + 5 * v3) = 5;
  _EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)(0xD00000000000004DLL, 0x8000000100017320, &type metadata for FreeformSettingsDeepLinks, v8);
  *(_BYTE *)(v7 + 6 * v3) = 6;
  _EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)(0xD000000000000052, 0x80000001000176B0, &type metadata for FreeformSettingsDeepLinks, v8);
  v9 = sub_10000BC60(v6);
  return _EnumURLRepresentation.init(_:)(v9, &type metadata for FreeformSettingsDeepLinks, v8);
}

void sub_100007294(char *a1)
{
  sub_10000BE00(*a1);
}

unint64_t sub_1000072A4()
{
  unint64_t result;

  result = qword_100020480;
  if (!qword_100020480)
  {
    result = swift_getWitnessTable(&unk_100015098, &type metadata for FreeformSettingsDeepLinks);
    atomic_store(result, (unint64_t *)&qword_100020480);
  }
  return result;
}

void sub_1000072E8()
{
  char *v0;

  sub_10000C050(0, *v0);
}

void sub_1000072F4()
{
  __asm { BR              X10 }
}

uint64_t sub_100007328(uint64_t a1)
{
  ((void (*)(uint64_t, uint64_t, unint64_t))String.hash(into:))(a1, 0x746E69486874616DLL, 0xE900000000000073);
  return ((uint64_t (*)(unint64_t))swift_bridgeObjectRelease)(0xE900000000000073);
}

void sub_1000073FC(uint64_t a1)
{
  char *v1;

  sub_10000C050(a1, *v1);
}

unint64_t sub_100007404@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_100007CDC(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_100007430()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_100007458 + 4 * byte_100015087[*v0]))();
}

void sub_100007458(_QWORD *a1@<X8>)
{
  *a1 = 0x746E69486874616DLL;
  a1[1] = 0xE900000000000073;
}

void sub_100007478(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "centerGuides");
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

void sub_10000749C(_QWORD *a1@<X8>)
{
  *a1 = 0x6469754765676465;
  a1[1] = 0xEA00000000007365;
}

void sub_1000074C0(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "spacingGuides");
  *(_WORD *)(a1 + 14) = -4864;
}

void sub_1000074E8(_QWORD *a1@<X8>)
{
  *a1 = 0x72476F5470616E73;
  a1[1] = 0xEA00000000006469;
}

void sub_100007508(_QWORD *a1@<X8>)
{
  *a1 = 0x6E417463656C6573;
  a1[1] = 0xEF6C6C6F72635364;
}

unint64_t sub_100007534()
{
  unint64_t result;

  result = qword_100020488;
  if (!qword_100020488)
  {
    result = swift_getWitnessTable(&unk_100015170, &type metadata for FreeformSettingsDeepLinks);
    atomic_store(result, (unint64_t *)&qword_100020488);
  }
  return result;
}

unint64_t sub_10000757C()
{
  unint64_t result;

  result = qword_100020490;
  if (!qword_100020490)
  {
    result = swift_getWitnessTable(&unk_1000151B0, &type metadata for FreeformSettingsDeepLinks);
    atomic_store(result, (unint64_t *)&qword_100020490);
  }
  return result;
}

uint64_t sub_1000075C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_100020130 != -1)
    swift_once(&qword_100020130, sub_100007018);
  v2 = sub_100004440(&qword_100020518);
  v3 = sub_100004480(v2, (uint64_t)qword_100020D58);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

unint64_t sub_100007638()
{
  unint64_t result;

  result = qword_100020498;
  if (!qword_100020498)
  {
    result = swift_getWitnessTable(&unk_1000151D8, &type metadata for FreeformSettingsDeepLinks);
    atomic_store(result, (unint64_t *)&qword_100020498);
  }
  return result;
}

unint64_t sub_100007680()
{
  unint64_t result;

  result = qword_1000204A0;
  if (!qword_1000204A0)
  {
    result = swift_getWitnessTable(&unk_100015210, &type metadata for FreeformSettingsDeepLinks);
    atomic_store(result, (unint64_t *)&qword_1000204A0);
  }
  return result;
}

unint64_t sub_1000076C8()
{
  unint64_t result;

  result = qword_1000204A8;
  if (!qword_1000204A8)
  {
    result = swift_getWitnessTable(&unk_100015100, &type metadata for FreeformSettingsDeepLinks);
    atomic_store(result, (unint64_t *)&qword_1000204A8);
  }
  return result;
}

void *sub_10000770C()
{
  return &protocol witness table for String;
}

uint64_t sub_100007718(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_100007C98();
  v4 = _URLRepresentableEnum.urlRepresentationParameter.getter(a1, v3);
  return sub_100004560(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8), v1, v4, v5);
}

unint64_t sub_100007764()
{
  unint64_t result;

  result = qword_1000204B8;
  if (!qword_1000204B8)
  {
    result = swift_getWitnessTable(&unk_100015240, &type metadata for FreeformSettingsDeepLinks);
    atomic_store(result, (unint64_t *)&qword_1000204B8);
  }
  return result;
}

unint64_t sub_1000077AC()
{
  unint64_t result;

  result = qword_1000204C0;
  if (!qword_1000204C0)
  {
    result = swift_getWitnessTable(&unk_100015268, &type metadata for FreeformSettingsDeepLinks);
    atomic_store(result, (unint64_t *)&qword_1000204C0);
  }
  return result;
}

unint64_t sub_1000077F4()
{
  unint64_t result;

  result = qword_1000204C8;
  if (!qword_1000204C8)
  {
    result = swift_getWitnessTable(&unk_100015290, &type metadata for FreeformSettingsDeepLinks);
    atomic_store(result, (unint64_t *)&qword_1000204C8);
  }
  return result;
}

unint64_t sub_10000783C()
{
  unint64_t result;

  result = qword_1000204D0;
  if (!qword_1000204D0)
  {
    result = swift_getWitnessTable(&unk_1000152E8, &type metadata for FreeformSettingsDeepLinks);
    atomic_store(result, (unint64_t *)&qword_1000204D0);
  }
  return result;
}

uint64_t sub_100007884@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_100020120 != -1)
    swift_once(&qword_100020120, sub_10000666C);
  v2 = type metadata accessor for TypeDisplayRepresentation(0);
  v3 = sub_100004480(v2, (uint64_t)qword_100020D38);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_1000078F4(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_100007534();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppEnum.defaultResolverSpecification>>, 1);
}

uint64_t sub_100007934(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100007534();
  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100007970()
{
  unint64_t result;

  result = qword_1000204D8;
  if (!qword_1000204D8)
  {
    result = swift_getWitnessTable(&unk_100015328, &type metadata for FreeformSettingsDeepLinks);
    atomic_store(result, (unint64_t *)&qword_1000204D8);
  }
  return result;
}

unint64_t sub_1000079B8()
{
  unint64_t result;

  result = qword_1000204E0;
  if (!qword_1000204E0)
  {
    result = swift_getWitnessTable(&unk_100015350, &type metadata for FreeformSettingsDeepLinks);
    atomic_store(result, (unint64_t *)&qword_1000204E0);
  }
  return result;
}

unint64_t sub_100007A00()
{
  unint64_t result;

  result = qword_1000204E8;
  if (!qword_1000204E8)
  {
    result = swift_getWitnessTable(&unk_1000150C0, &type metadata for FreeformSettingsDeepLinks);
    atomic_store(result, (unint64_t *)&qword_1000204E8);
  }
  return result;
}

uint64_t sub_100007A44()
{
  if (qword_100020128 != -1)
    swift_once(&qword_100020128, sub_1000066CC);
  return swift_bridgeObjectRetain(qword_100020D50);
}

uint64_t sub_100007A84(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000783C();
  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100007AC0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000204F0;
  if (!qword_1000204F0)
  {
    v1 = sub_10000294C(&qword_1000204F8);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000204F0);
  }
  return result;
}

void sub_100007B0C(_QWORD *a1@<X8>)
{
  *a1 = &off_10001C848;
}

_BYTE *initializeBufferWithCopyOfBuffer for FreeformSettingsDeepLinks(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FreeformSettingsDeepLinks(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for FreeformSettingsDeepLinks(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100007C08 + 4 * byte_100015093[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_100007C3C + 4 * byte_10001508E[v4]))();
}

uint64_t sub_100007C3C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100007C44(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100007C4CLL);
  return result;
}

uint64_t sub_100007C58(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100007C60);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_100007C64(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100007C6C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100007C78(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100007C80(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FreeformSettingsDeepLinks()
{
  return &type metadata for FreeformSettingsDeepLinks;
}

unint64_t sub_100007C98()
{
  unint64_t result;

  result = qword_100020510;
  if (!qword_100020510)
  {
    result = swift_getWitnessTable(&unk_100015138, &type metadata for FreeformSettingsDeepLinks);
    atomic_store(result, (unint64_t *)&qword_100020510);
  }
  return result;
}

unint64_t sub_100007CDC(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10001C780, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 7)
    return 7;
  else
    return v3;
}

unint64_t sub_100007D28()
{
  unint64_t result;

  result = qword_100020540;
  if (!qword_100020540)
  {
    result = swift_getWitnessTable(&unk_100015460, &type metadata for SpacingGuidesSettingEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_100020540);
  }
  return result;
}

uint64_t sub_100007D6C()
{
  return sub_100004574(&qword_100020548, &qword_100020550, (uint64_t)&protocol conformance descriptor for _IntentUpdatableEntityProperty<A, B, C>);
}

uint64_t sub_100007D98()
{
  uint64_t v0;

  v0 = type metadata accessor for LocalizedStringResource(0);
  sub_100004498(v0, qword_100020D70);
  sub_100004480(v0, (uint64_t)qword_100020D70);
  return LocalizedStringResource.init(stringLiteral:)(0xD000000000000015, 0x8000000100017F80);
}

uint64_t sub_100007DF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_100004440(&qword_100020340);
  sub_100004498(v0, qword_100020D88);
  v1 = sub_100004480(v0, (uint64_t)qword_100020D88);
  IntentDescription.init(stringLiteral:)(0xD000000000000041, 0x8000000100017F30);
  v2 = type metadata accessor for IntentDescription(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 0, 1, v2);
}

uint64_t sub_100007E80()
{
  uint64_t result;

  result = swift_getKeyPath(&unk_100015828);
  qword_100020DA0 = result;
  return result;
}

uint64_t sub_100007EA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  return swift_task_switch(sub_100007EC0, 0, 0);
}

uint64_t sub_100007EC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 16));
  v1 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v0 + 24) = v1;
  *(_QWORD *)(v0 + 72) = v1;
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 146));
  *(_BYTE *)(v0 + 145) = *(_BYTE *)(v0 + 146);
  if (qword_100020148 != -1)
    swift_once(&qword_100020148, sub_100007E80);
  v2 = qword_100020DA0;
  *(_QWORD *)(v0 + 80) = qword_100020DA0;
  v3 = async function pointer to AppEntity._setValue<A, B, C>(_:for:)[1];
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  *(_QWORD *)(v0 + 88) = v4;
  v5 = sub_100004574(&qword_100020620, &qword_100020628, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *(_QWORD *)(v0 + 96) = v5;
  *v4 = v0;
  v4[1] = sub_100007FC0;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 145, v2, &type metadata for Bool, v5);
}

uint64_t sub_100007FC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 88);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 72);
  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc(v2);
  swift_release(v4);
  swift_release(v3);
  if (v0)
    v5 = sub_100002E14;
  else
    v5 = sub_100008040;
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_100008040()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  IntentParameter.wrappedValue.getter(v0 + 5);
  v1 = v0[5];
  v0[4] = v1;
  v2 = qword_100020DA0;
  v0[14] = v1;
  v0[15] = v2;
  v3 = async function pointer to AppEntity._value<A, B>(for:)[1];
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  v0[16] = v4;
  *v4 = v0;
  v4[1] = sub_100002D3C;
  return AppEntity._value<A, B>(for:)(v0 + 18, v2, v0[12]);
}

uint64_t sub_1000080D4()
{
  if (qword_100020148 != -1)
    swift_once(&qword_100020148, sub_100007E80);
  return swift_retain(qword_100020DA0);
}

unint64_t sub_100008118()
{
  unint64_t result;

  result = qword_100020558;
  if (!qword_100020558)
  {
    result = swift_getWitnessTable(&unk_1000154F0, &type metadata for SpacingGuidesSettingEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_100020558);
  }
  return result;
}

unint64_t sub_100008160()
{
  unint64_t result;

  result = qword_100020560;
  if (!qword_100020560)
  {
    result = swift_getWitnessTable(&unk_100015518, &type metadata for SpacingGuidesSettingEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_100020560);
  }
  return result;
}

uint64_t sub_1000081A4(uint64_t a1)
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2(a1, &unk_10001A2EC, 1) + 8);
}

uint64_t sub_1000081C8(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_100007D28();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

uint64_t sub_100008208@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_100020138 != -1)
    swift_once(&qword_100020138, sub_100007D98);
  v2 = type metadata accessor for LocalizedStringResource(0);
  v3 = sub_100004480(v2, (uint64_t)qword_100020D70);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_100008278@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_100020140 != -1)
    swift_once(&qword_100020140, sub_100007DF8);
  v2 = sub_100004440(&qword_100020340);
  v3 = sub_100004480(v2, (uint64_t)qword_100020D88);
  return sub_1000045F8(v3, a1);
}

uint64_t sub_1000082D8(uint64_t a1)
{
  _OWORD *v1;
  uint64_t v2;
  uint64_t v4;

  v4 = swift_task_alloc(dword_100020634);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_100003278;
  *(_OWORD *)(v4 + 56) = *v1;
  *(_QWORD *)(v4 + 48) = a1;
  return swift_task_switch(sub_100007EC0, 0, 0);
}

uint64_t sub_100008340@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_100008F04();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100008364()
{
  return 0xD00000000000002BLL;
}

unint64_t sub_100008384()
{
  unint64_t result;

  result = qword_100020570;
  if (!qword_100020570)
  {
    result = swift_getWitnessTable(&unk_1000155CC, &type metadata for SpacingGuidesSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020570);
  }
  return result;
}

unint64_t sub_1000083CC()
{
  unint64_t result;

  result = qword_100020578;
  if (!qword_100020578)
  {
    result = swift_getWitnessTable(&unk_100015624, &type metadata for SpacingGuidesSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020578);
  }
  return result;
}

uint64_t sub_100008410(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_100008428, 0, 0);
}

uint64_t sub_100008428()
{
  uint64_t v0;
  _BYTE *v1;
  void *v2;
  NSString v3;

  if (qword_1000200F0 != -1)
    swift_once(&qword_1000200F0, sub_1000050B4);
  v1 = *(_BYTE **)(v0 + 16);
  v2 = (void *)qword_100020CC8;
  v3 = String._bridgeToObjectiveC()();
  LOBYTE(v2) = objc_msgSend(v2, "BOOLForKey:", v3);

  *v1 = (_BYTE)v2;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000084D0(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + 16) = *a2;
  return swift_task_switch(sub_1000084EC, 0, 0);
}

uint64_t sub_1000084EC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  NSString v3;

  if (qword_1000200F0 != -1)
    swift_once(&qword_1000200F0, sub_1000050B4);
  v1 = *(unsigned __int8 *)(v0 + 16);
  v2 = (void *)qword_100020CC8;
  v3 = String._bridgeToObjectiveC()();
  objc_msgSend(v2, "setBool:forKey:", v1, v3);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100008590()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE v19[24];

  v0 = sub_100004440(&qword_1000202E8);
  __chkstk_darwin(v0);
  v2 = &v19[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v3 = sub_100004440(&qword_1000202D0);
  __chkstk_darwin(v3);
  v5 = &v19[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = type metadata accessor for LocalizedStringResource(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = &v19[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __chkstk_darwin(v8);
  v12 = &v19[-v11 - 8];
  if (qword_100020158 != -1)
    swift_once(&qword_100020158, sub_100008938);
  v13 = type metadata accessor for TypeDisplayRepresentation(0);
  v14 = sub_100004480(v13, (uint64_t)qword_100020DC0);
  v15 = swift_beginAccess(v14, v19, 32, 0);
  TypeDisplayRepresentation.name.getter(v15);
  swift_endAccess(v19);
  LocalizedStringResource.init(stringLiteral:)(0x1000000000000011, 0x80000001000171B0);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  DisplayRepresentation.Image.init(appBundleIdentifier:)(0xD000000000000012, 0x80000001000171D0);
  v16 = type metadata accessor for DisplayRepresentation.Image(0);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v2, 0, 1, v16);
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000013CLL, 0x8000000100017BA0);
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v12, v5, v2, &_swiftEmptyArrayStorage, v10);
}

uint64_t sub_1000087B0()
{
  uint64_t v0;
  unint64_t v1;

  v0 = sub_100004440(&qword_100020588);
  sub_100004498(v0, qword_100020DA8);
  sub_100004480(v0, (uint64_t)qword_100020DA8);
  v1 = sub_100009228();
  return _UniqueEntityProvider.init(_:)(&unk_100020608, 0, &type metadata for SpacingGuidesSettingEntity, v1);
}

uint64_t sub_10000881C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 16) = a1;
  v2 = type metadata accessor for LocalizedStringResource(0);
  *(_QWORD *)(v1 + 24) = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100008874, 0, 0);
}

uint64_t sub_100008874()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2 = *(_QWORD **)(v0 + 16);
  v1 = *(_QWORD *)(v0 + 24);
  sub_100004440(&qword_100020550);
  LocalizedStringResource.init(stringLiteral:)(0x20676E6963617053, 0xEE00736564697547);
  v3 = sub_100004574(&qword_100020620, &qword_100020628, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *v2 = _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)(v1, &unk_100020610, 0, &unk_100020618, 0, &type metadata for SpacingGuidesSettingEntity.UpdateIntent_value, v3);
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100008938()
{
  uint64_t v0;

  v0 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_100004498(v0, qword_100020DC0);
  sub_100004480(v0, (uint64_t)qword_100020DC0);
  return TypeDisplayRepresentation.init(stringLiteral:)(0x20676E6963617053, 0xEE00736564697547);
}

uint64_t sub_1000089A0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100008384();
  return _EntityURLRepresentation.init(stringLiteral:)(0xD00000000000004FLL, 0x8000000100017E40, a1, v2);
}

uint64_t sub_1000089E8()
{
  return sub_100004574(&qword_100020580, &qword_100020588, (uint64_t)&protocol conformance descriptor for _UniqueEntityProvider<A>);
}

uint64_t sub_100008A14()
{
  uint64_t v0;

  v0 = qword_100020530;
  swift_bridgeObjectRetain(off_100020538);
  return v0;
}

unint64_t sub_100008A4C()
{
  unint64_t result;

  result = qword_100020590;
  if (!qword_100020590)
  {
    result = swift_getWitnessTable(&unk_10001564C, &type metadata for SpacingGuidesSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020590);
  }
  return result;
}

unint64_t sub_100008A94()
{
  unint64_t result;

  result = qword_100020598;
  if (!qword_100020598)
  {
    result = swift_getWitnessTable(&unk_100015684, &type metadata for SpacingGuidesSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020598);
  }
  return result;
}

unint64_t sub_100008ADC()
{
  unint64_t result;

  result = qword_1000205A0;
  if (!qword_1000205A0)
  {
    result = swift_getWitnessTable(&unk_1000156B4, &type metadata for SpacingGuidesSettingEntity);
    atomic_store(result, (unint64_t *)&qword_1000205A0);
  }
  return result;
}

uint64_t sub_100008B20()
{
  return sub_100004574((unint64_t *)&unk_1000205A8, &qword_100020588, (uint64_t)&protocol conformance descriptor for _UniqueEntityProvider<A>);
}

uint64_t sub_100008B4C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_100020150 != -1)
    swift_once(&qword_100020150, sub_1000087B0);
  v2 = sub_100004440(&qword_100020588);
  v3 = sub_100004480(v2, (uint64_t)qword_100020DA8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_100008BC0(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_10000926C();
  v4 = _URLRepresentableEntity.urlRepresentationParameter.getter(a1, v3);
  return sub_100004560(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8), v1, v4, v5);
}

unint64_t sub_100008C0C()
{
  unint64_t result;

  result = qword_1000205B8;
  if (!qword_1000205B8)
  {
    result = swift_getWitnessTable(&unk_1000156EC, &type metadata for SpacingGuidesSettingEntity);
    atomic_store(result, (unint64_t *)&qword_1000205B8);
  }
  return result;
}

unint64_t sub_100008C54()
{
  unint64_t result;

  result = qword_1000205C0;
  if (!qword_1000205C0)
  {
    result = swift_getWitnessTable(&unk_100015714, &type metadata for SpacingGuidesSettingEntity);
    atomic_store(result, (unint64_t *)&qword_1000205C0);
  }
  return result;
}

unint64_t sub_100008C9C()
{
  unint64_t result;

  result = qword_1000205C8;
  if (!qword_1000205C8)
  {
    result = swift_getWitnessTable(&unk_10001573C, &type metadata for SpacingGuidesSettingEntity);
    atomic_store(result, (unint64_t *)&qword_1000205C8);
  }
  return result;
}

unint64_t sub_100008CE4()
{
  unint64_t result;

  result = qword_1000205D0;
  if (!qword_1000205D0)
  {
    result = swift_getWitnessTable(&unk_100015794, &type metadata for SpacingGuidesSettingEntity);
    atomic_store(result, (unint64_t *)&qword_1000205D0);
  }
  return result;
}

uint64_t sub_100008D28@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v4;
  uint64_t result;
  uint64_t v6;

  v4 = sub_100009228();
  result = _UniqueEntity.id.getter(a1, v4);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_100008D64@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE v5[24];

  if (qword_100020158 != -1)
    swift_once(&qword_100020158, sub_100008938);
  v2 = type metadata accessor for TypeDisplayRepresentation(0);
  v3 = sub_100004480(v2, (uint64_t)qword_100020DC0);
  swift_beginAccess(v3, v5, 0, 0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_100008DFC()
{
  return sub_100004574(&qword_1000205D8, &qword_1000205E0, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_100008E28(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100008384();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100008E64()
{
  unint64_t result;

  result = qword_1000205E8;
  if (!qword_1000205E8)
  {
    result = swift_getWitnessTable(&unk_1000157C4, &type metadata for SpacingGuidesSettingEntity);
    atomic_store(result, (unint64_t *)&qword_1000205E8);
  }
  return result;
}

uint64_t sub_100008EAC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100008CE4();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for SpacingGuidesSettingEntity()
{
  return &type metadata for SpacingGuidesSettingEntity;
}

ValueMetadata *type metadata accessor for SpacingGuidesSettingEntity.UpdateIntent_value()
{
  return &type metadata for SpacingGuidesSettingEntity.UpdateIntent_value;
}

uint64_t sub_100008F04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t, uint64_t);
  char *v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v25;
  void (*v26)(char *);
  unsigned int v27;
  void (*v28)(char *, uint64_t, uint64_t, uint64_t);
  char *v29;
  char *v30;
  char v31;
  uint64_t v32;

  v0 = sub_100004440(&qword_1000202C0);
  __chkstk_darwin(v0);
  v30 = (char *)&v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for InputConnectionBehavior(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v29 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100004440(&qword_1000202C8);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v25 - v9;
  v11 = sub_100004440(&qword_1000202D0);
  __chkstk_darwin(v11);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for LocalizedStringResource(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_100004440(&qword_1000205F0);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000018, 0x8000000100017E90);
  v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  v32 = 0;
  v18 = type metadata accessor for IntentDialog(0);
  v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56);
  v19(v10, 1, 1, v18);
  v19(v8, 1, 1, v18);
  v27 = enum case for InputConnectionBehavior.default(_:);
  v26 = *(void (**)(char *))(v3 + 104);
  v20 = v29;
  v26(v29);
  v21 = sub_100008384();
  v25 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v17, v13, &v32, v10, v8, v20, v21);
  sub_100004440(&qword_1000202E0);
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000002ALL, 0x8000000100017EB0);
  v28(v13, 1, 1, v14);
  v31 = 2;
  v22 = type metadata accessor for Bool.IntentDisplayName(0);
  v23 = v30;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v30, 1, 1, v22);
  v19(v10, 1, 1, v18);
  ((void (*)(char *, _QWORD, uint64_t))v26)(v20, v27, v2);
  IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)(v17, v13, &v31, v23, v10, v20);
  return v25;
}

unint64_t sub_100009228()
{
  unint64_t result;

  result = qword_1000205F8;
  if (!qword_1000205F8)
  {
    result = swift_getWitnessTable(&unk_10001556C, &type metadata for SpacingGuidesSettingEntity);
    atomic_store(result, (unint64_t *)&qword_1000205F8);
  }
  return result;
}

unint64_t sub_10000926C()
{
  unint64_t result;

  result = qword_100020600;
  if (!qword_100020600)
  {
    result = swift_getWitnessTable(&unk_100015534, &type metadata for SpacingGuidesSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020600);
  }
  return result;
}

uint64_t sub_1000092B0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = v2;
  return swift_retain(v2);
}

uint64_t sub_1000092BC()
{
  uint64_t v0;

  v0 = sub_100004440(&qword_100020640);
  return TupleWidget.init(_:)(v0, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_100009324();
  static WidgetBundle.main()();
  return 0;
}

unint64_t sub_100009324()
{
  unint64_t result;

  result = qword_100020638;
  if (!qword_100020638)
  {
    result = swift_getWitnessTable(&unk_10001586C, &type metadata for CRLWidgetExtensionBundle);
    atomic_store(result, (unint64_t *)&qword_100020638);
  }
  return result;
}

ValueMetadata *type metadata accessor for CRLWidgetExtensionBundle()
{
  return &type metadata for CRLWidgetExtensionBundle;
}

uint64_t sub_100009378(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001A33C, 1);
}

unint64_t sub_10000938C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100020648;
  if (!qword_100020648)
  {
    v1 = sub_10000294C(&qword_100020650);
    result = swift_getWitnessTable(&protocol conformance descriptor for TupleWidget<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100020648);
  }
  return result;
}

ValueMetadata *type metadata accessor for SpacingGuidesToggleControl()
{
  return &type metadata for SpacingGuidesToggleControl;
}

uint64_t sub_1000093E8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001A380, 1);
}

uint64_t sub_1000093F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t KeyPath;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t OpaqueTypeConformance2;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;

  v44 = a1;
  v1 = sub_100004440(&qword_100020348);
  v37 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v3 = (char *)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100004440(&qword_100020350);
  v39 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100004440(&qword_100020358);
  v8 = *(_QWORD *)(v7 - 8);
  v40 = v7;
  v41 = v8;
  __chkstk_darwin(v7);
  v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100004440(&qword_100020360);
  v12 = *(_QWORD *)(v11 - 8);
  v42 = v11;
  v43 = v12;
  __chkstk_darwin(v11);
  v38 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(&unk_100015910);
  v15 = sub_100009228();
  ControlToggle.init<A, B, C, D, E, F, G>(kind:intentUpdatableProperty:title:subtitle:value:)(0xD000000000000026, 0x8000000100017FA0, KeyPath, sub_10000975C, 0, sub_1000049E4, 0, sub_100004A64, 0, &type metadata for Text, &type metadata for Text, &type metadata for Text, v15, &protocol witness table for Text, &protocol witness table for Text, &protocol witness table for Text);
  v16 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000011, 0x8000000100017FD0);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = sub_100004B38();
  WidgetConfiguration.configurationDisplayName(_:)(v16, v18, v20 & 1, v22, v1, v23);
  swift_bridgeObjectRelease(v22);
  swift_bridgeObjectRelease(v18);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v3, v1);
  v24 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000021, 0x8000000100017FF0);
  v26 = v25;
  LOBYTE(v3) = v27;
  v29 = v28;
  v45 = v1;
  v46 = v23;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v45, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  WidgetConfiguration.description(_:)(v24, v26, v3 & 1, v29, v4, OpaqueTypeConformance2);
  swift_bridgeObjectRelease(v29);
  swift_bridgeObjectRelease(v26);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v6, v4);
  v45 = v4;
  v46 = OpaqueTypeConformance2;
  v31 = swift_getOpaqueTypeConformance2(&v45, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description(_:)>>, 1);
  v32 = v38;
  v33 = v40;
  WidgetConfiguration.disablesControlStateCaching()(v40, v31);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v10, v33);
  v45 = v33;
  v46 = v31;
  v34 = swift_getOpaqueTypeConformance2(&v45, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v35 = v42;
  WidgetConfiguration.hiddenControl()(v42, v34);
  return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v32, v35);
}

uint64_t sub_10000975C@<X0>(uint64_t a1@<X8>)
{
  return sub_100004A00(0xD000000000000013, 0x8000000100018020, a1);
}

unint64_t sub_100009784()
{
  unint64_t result;

  result = qword_100020668;
  if (!qword_100020668)
  {
    result = swift_getWitnessTable(&unk_1000159F0, &type metadata for EdgeGuidesSettingEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_100020668);
  }
  return result;
}

uint64_t sub_1000097C8()
{
  return sub_100004574(&qword_100020670, &qword_100020678, (uint64_t)&protocol conformance descriptor for _IntentUpdatableEntityProperty<A, B, C>);
}

uint64_t sub_1000097F4()
{
  uint64_t v0;

  v0 = type metadata accessor for LocalizedStringResource(0);
  sub_100004498(v0, qword_100020DD8);
  sub_100004480(v0, (uint64_t)qword_100020DD8);
  return LocalizedStringResource.init(stringLiteral:)(0xD000000000000012, 0x8000000100018120);
}

uint64_t sub_100009854()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_100004440(&qword_100020340);
  sub_100004498(v0, qword_100020DF0);
  v1 = sub_100004480(v0, (uint64_t)qword_100020DF0);
  IntentDescription.init(stringLiteral:)(0xD00000000000003ELL, 0x80000001000180E0);
  v2 = type metadata accessor for IntentDescription(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 0, 1, v2);
}

uint64_t sub_1000098DC()
{
  uint64_t result;

  result = swift_getKeyPath(&unk_100015DB8);
  qword_100020E08 = result;
  return result;
}

uint64_t sub_100009900(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  return swift_task_switch(sub_10000991C, 0, 0);
}

uint64_t sub_10000991C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 16));
  v1 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v0 + 24) = v1;
  *(_QWORD *)(v0 + 72) = v1;
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 146));
  *(_BYTE *)(v0 + 145) = *(_BYTE *)(v0 + 146);
  if (qword_100020170 != -1)
    swift_once(&qword_100020170, sub_1000098DC);
  v2 = qword_100020E08;
  *(_QWORD *)(v0 + 80) = qword_100020E08;
  v3 = async function pointer to AppEntity._setValue<A, B, C>(_:for:)[1];
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  *(_QWORD *)(v0 + 88) = v4;
  v5 = sub_100004574(&qword_100020740, &qword_100020748, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *(_QWORD *)(v0 + 96) = v5;
  *v4 = v0;
  v4[1] = sub_100009A1C;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 145, v2, &type metadata for Bool, v5);
}

uint64_t sub_100009A1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 88);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 72);
  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc(v2);
  swift_release(v4);
  swift_release(v3);
  if (v0)
    v5 = sub_100002E14;
  else
    v5 = sub_100009A9C;
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_100009A9C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  IntentParameter.wrappedValue.getter(v0 + 5);
  v1 = v0[5];
  v0[4] = v1;
  v2 = qword_100020E08;
  v0[14] = v1;
  v0[15] = v2;
  v3 = async function pointer to AppEntity._value<A, B>(for:)[1];
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  v0[16] = v4;
  *v4 = v0;
  v4[1] = sub_100002D3C;
  return AppEntity._value<A, B>(for:)(v0 + 18, v2, v0[12]);
}

uint64_t sub_100009B30()
{
  if (qword_100020170 != -1)
    swift_once(&qword_100020170, sub_1000098DC);
  return swift_retain(qword_100020E08);
}

unint64_t sub_100009B74()
{
  unint64_t result;

  result = qword_100020680;
  if (!qword_100020680)
  {
    result = swift_getWitnessTable(&unk_100015A80, &type metadata for EdgeGuidesSettingEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_100020680);
  }
  return result;
}

unint64_t sub_100009BBC()
{
  unint64_t result;

  result = qword_100020688;
  if (!qword_100020688)
  {
    result = swift_getWitnessTable(&unk_100015AA8, &type metadata for EdgeGuidesSettingEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_100020688);
  }
  return result;
}

uint64_t sub_100009C00(uint64_t a1)
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2(a1, &unk_10001A3E0, 1) + 8);
}

uint64_t sub_100009C24(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_100009784();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

uint64_t sub_100009C64@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_100020160 != -1)
    swift_once(&qword_100020160, sub_1000097F4);
  v2 = type metadata accessor for LocalizedStringResource(0);
  v3 = sub_100004480(v2, (uint64_t)qword_100020DD8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_100009CD4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_100020168 != -1)
    swift_once(&qword_100020168, sub_100009854);
  v2 = sub_100004440(&qword_100020340);
  v3 = sub_100004480(v2, (uint64_t)qword_100020DF0);
  return sub_1000045F8(v3, a1);
}

uint64_t sub_100009D34(uint64_t a1)
{
  _OWORD *v1;
  uint64_t v2;
  uint64_t v4;

  v4 = swift_task_alloc(dword_100020754);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_100003278;
  *(_OWORD *)(v4 + 56) = *v1;
  *(_QWORD *)(v4 + 48) = a1;
  return swift_task_switch(sub_10000991C, 0, 0);
}

uint64_t sub_100009D9C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_10000A958();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100009DC0()
{
  return 0xD000000000000028;
}

unint64_t sub_100009DE0()
{
  unint64_t result;

  result = qword_100020698;
  if (!qword_100020698)
  {
    result = swift_getWitnessTable(&unk_100015B5C, &type metadata for EdgeGuidesSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020698);
  }
  return result;
}

unint64_t sub_100009E28()
{
  unint64_t result;

  result = qword_1000206A0;
  if (!qword_1000206A0)
  {
    result = swift_getWitnessTable(&unk_100015BB4, &type metadata for EdgeGuidesSettingEntity);
    atomic_store(result, (unint64_t *)&qword_1000206A0);
  }
  return result;
}

uint64_t sub_100009E6C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_100009E84, 0, 0);
}

uint64_t sub_100009E84()
{
  uint64_t v0;
  _BYTE *v1;
  void *v2;
  NSString v3;

  if (qword_1000200F0 != -1)
    swift_once(&qword_1000200F0, sub_1000050B4);
  v1 = *(_BYTE **)(v0 + 16);
  v2 = (void *)qword_100020CC8;
  v3 = String._bridgeToObjectiveC()();
  LOBYTE(v2) = objc_msgSend(v2, "BOOLForKey:", v3);

  *v1 = (_BYTE)v2;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100009F2C(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + 16) = *a2;
  return swift_task_switch(sub_100009F48, 0, 0);
}

uint64_t sub_100009F48()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  NSString v3;

  if (qword_1000200F0 != -1)
    swift_once(&qword_1000200F0, sub_1000050B4);
  v1 = *(unsigned __int8 *)(v0 + 16);
  v2 = (void *)qword_100020CC8;
  v3 = String._bridgeToObjectiveC()();
  objc_msgSend(v2, "setBool:forKey:", v1, v3);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100009FEC()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE v19[24];

  v0 = sub_100004440(&qword_1000202E8);
  __chkstk_darwin(v0);
  v2 = &v19[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v3 = sub_100004440(&qword_1000202D0);
  __chkstk_darwin(v3);
  v5 = &v19[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = type metadata accessor for LocalizedStringResource(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = &v19[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __chkstk_darwin(v8);
  v12 = &v19[-v11 - 8];
  if (qword_100020180 != -1)
    swift_once(&qword_100020180, sub_10000A390);
  v13 = type metadata accessor for TypeDisplayRepresentation(0);
  v14 = sub_100004480(v13, (uint64_t)qword_100020E28);
  v15 = swift_beginAccess(v14, v19, 32, 0);
  TypeDisplayRepresentation.name.getter(v15);
  swift_endAccess(v19);
  LocalizedStringResource.init(stringLiteral:)(0x1000000000000011, 0x80000001000171B0);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  DisplayRepresentation.Image.init(appBundleIdentifier:)(0xD000000000000012, 0x80000001000171D0);
  v16 = type metadata accessor for DisplayRepresentation.Image(0);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v2, 0, 1, v16);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000148, 0x8000000100017A50);
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v12, v5, v2, &_swiftEmptyArrayStorage, v10);
}

uint64_t sub_10000A20C()
{
  uint64_t v0;
  unint64_t v1;

  v0 = sub_100004440(&qword_1000206B0);
  sub_100004498(v0, qword_100020E10);
  sub_100004480(v0, (uint64_t)qword_100020E10);
  v1 = sub_100004AF4();
  return _UniqueEntityProvider.init(_:)(&unk_100020728, 0, &type metadata for EdgeGuidesSettingEntity, v1);
}

uint64_t sub_10000A278(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 16) = a1;
  v2 = type metadata accessor for LocalizedStringResource(0);
  *(_QWORD *)(v1 + 24) = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10000A2D0, 0, 0);
}

uint64_t sub_10000A2D0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2 = *(_QWORD **)(v0 + 16);
  v1 = *(_QWORD *)(v0 + 24);
  sub_100004440(&qword_100020678);
  LocalizedStringResource.init(stringLiteral:)(0x6975472065676445, 0xEB00000000736564);
  v3 = sub_100004574(&qword_100020740, &qword_100020748, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *v2 = _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)(v1, &unk_100020730, 0, &unk_100020738, 0, &type metadata for EdgeGuidesSettingEntity.UpdateIntent_value, v3);
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000A390()
{
  uint64_t v0;

  v0 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_100004498(v0, qword_100020E28);
  sub_100004480(v0, (uint64_t)qword_100020E28);
  return TypeDisplayRepresentation.init(stringLiteral:)(0x6975472065676445, 0xEB00000000736564);
}

uint64_t sub_10000A3F4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100009DE0();
  return _EntityURLRepresentation.init(stringLiteral:)(0xD00000000000004CLL, 0x8000000100017DF0, a1, v2);
}

uint64_t sub_10000A43C()
{
  return sub_100004574(&qword_1000206A8, &qword_1000206B0, (uint64_t)&protocol conformance descriptor for _UniqueEntityProvider<A>);
}

uint64_t sub_10000A468()
{
  uint64_t v0;

  v0 = qword_100020658;
  swift_bridgeObjectRetain(off_100020660);
  return v0;
}

unint64_t sub_10000A4A0()
{
  unint64_t result;

  result = qword_1000206B8;
  if (!qword_1000206B8)
  {
    result = swift_getWitnessTable(&unk_100015BDC, &type metadata for EdgeGuidesSettingEntity);
    atomic_store(result, (unint64_t *)&qword_1000206B8);
  }
  return result;
}

unint64_t sub_10000A4E8()
{
  unint64_t result;

  result = qword_1000206C0;
  if (!qword_1000206C0)
  {
    result = swift_getWitnessTable(&unk_100015C14, &type metadata for EdgeGuidesSettingEntity);
    atomic_store(result, (unint64_t *)&qword_1000206C0);
  }
  return result;
}

unint64_t sub_10000A530()
{
  unint64_t result;

  result = qword_1000206C8;
  if (!qword_1000206C8)
  {
    result = swift_getWitnessTable(&unk_100015C44, &type metadata for EdgeGuidesSettingEntity);
    atomic_store(result, (unint64_t *)&qword_1000206C8);
  }
  return result;
}

uint64_t sub_10000A574()
{
  return sub_100004574((unint64_t *)&unk_1000206D0, &qword_1000206B0, (uint64_t)&protocol conformance descriptor for _UniqueEntityProvider<A>);
}

uint64_t sub_10000A5A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_100020178 != -1)
    swift_once(&qword_100020178, sub_10000A20C);
  v2 = sub_100004440(&qword_1000206B0);
  v3 = sub_100004480(v2, (uint64_t)qword_100020E10);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_10000A614(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_10000AC7C();
  v4 = _URLRepresentableEntity.urlRepresentationParameter.getter(a1, v3);
  return sub_100004560(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8), v1, v4, v5);
}

unint64_t sub_10000A660()
{
  unint64_t result;

  result = qword_1000206E0;
  if (!qword_1000206E0)
  {
    result = swift_getWitnessTable(&unk_100015C7C, &type metadata for EdgeGuidesSettingEntity);
    atomic_store(result, (unint64_t *)&qword_1000206E0);
  }
  return result;
}

unint64_t sub_10000A6A8()
{
  unint64_t result;

  result = qword_1000206E8;
  if (!qword_1000206E8)
  {
    result = swift_getWitnessTable(&unk_100015CA4, &type metadata for EdgeGuidesSettingEntity);
    atomic_store(result, (unint64_t *)&qword_1000206E8);
  }
  return result;
}

unint64_t sub_10000A6F0()
{
  unint64_t result;

  result = qword_1000206F0;
  if (!qword_1000206F0)
  {
    result = swift_getWitnessTable(&unk_100015CCC, &type metadata for EdgeGuidesSettingEntity);
    atomic_store(result, (unint64_t *)&qword_1000206F0);
  }
  return result;
}

unint64_t sub_10000A738()
{
  unint64_t result;

  result = qword_1000206F8;
  if (!qword_1000206F8)
  {
    result = swift_getWitnessTable(&unk_100015D24, &type metadata for EdgeGuidesSettingEntity);
    atomic_store(result, (unint64_t *)&qword_1000206F8);
  }
  return result;
}

uint64_t sub_10000A77C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v4;
  uint64_t result;
  uint64_t v6;

  v4 = sub_100004AF4();
  result = _UniqueEntity.id.getter(a1, v4);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_10000A7B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE v5[24];

  if (qword_100020180 != -1)
    swift_once(&qword_100020180, sub_10000A390);
  v2 = type metadata accessor for TypeDisplayRepresentation(0);
  v3 = sub_100004480(v2, (uint64_t)qword_100020E28);
  swift_beginAccess(v3, v5, 0, 0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_10000A850()
{
  return sub_100004574(&qword_100020700, &qword_100020708, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_10000A87C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100009DE0();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000A8B8()
{
  unint64_t result;

  result = qword_100020710;
  if (!qword_100020710)
  {
    result = swift_getWitnessTable(&unk_100015D54, &type metadata for EdgeGuidesSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020710);
  }
  return result;
}

uint64_t sub_10000A900(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000A738();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for EdgeGuidesSettingEntity()
{
  return &type metadata for EdgeGuidesSettingEntity;
}

ValueMetadata *type metadata accessor for EdgeGuidesSettingEntity.UpdateIntent_value()
{
  return &type metadata for EdgeGuidesSettingEntity.UpdateIntent_value;
}

uint64_t sub_10000A958()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t, uint64_t);
  char *v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v25;
  void (*v26)(char *);
  unsigned int v27;
  void (*v28)(char *, uint64_t, uint64_t, uint64_t);
  char *v29;
  char *v30;
  char v31;
  uint64_t v32;

  v0 = sub_100004440(&qword_1000202C0);
  __chkstk_darwin(v0);
  v30 = (char *)&v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for InputConnectionBehavior(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v29 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100004440(&qword_1000202C8);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v25 - v9;
  v11 = sub_100004440(&qword_1000202D0);
  __chkstk_darwin(v11);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for LocalizedStringResource(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_100004440(&qword_100020718);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000015, 0x8000000100018040);
  v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  v32 = 0;
  v18 = type metadata accessor for IntentDialog(0);
  v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56);
  v19(v10, 1, 1, v18);
  v19(v8, 1, 1, v18);
  v27 = enum case for InputConnectionBehavior.default(_:);
  v26 = *(void (**)(char *))(v3 + 104);
  v20 = v29;
  v26(v29);
  v21 = sub_100009DE0();
  v25 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v17, v13, &v32, v10, v8, v20, v21);
  sub_100004440(&qword_1000202E0);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000024, 0x8000000100018060);
  v28(v13, 1, 1, v14);
  v31 = 2;
  v22 = type metadata accessor for Bool.IntentDisplayName(0);
  v23 = v30;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v30, 1, 1, v22);
  v19(v10, 1, 1, v18);
  ((void (*)(char *, _QWORD, uint64_t))v26)(v20, v27, v2);
  IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)(v17, v13, &v31, v23, v10, v20);
  return v25;
}

unint64_t sub_10000AC7C()
{
  unint64_t result;

  result = qword_100020720;
  if (!qword_100020720)
  {
    result = swift_getWitnessTable(&unk_100015AC4, &type metadata for EdgeGuidesSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020720);
  }
  return result;
}

uint64_t sub_10000ACC0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = v2;
  return swift_retain(v2);
}

ValueMetadata *type metadata accessor for CenterGuidesToggleControl()
{
  return &type metadata for CenterGuidesToggleControl;
}

uint64_t sub_10000ACDC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001A430, 1);
}

uint64_t sub_10000ACEC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t KeyPath;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t OpaqueTypeConformance2;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;

  v44 = a1;
  v1 = sub_100004440(&qword_100020348);
  v37 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v3 = (char *)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100004440(&qword_100020350);
  v39 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100004440(&qword_100020358);
  v8 = *(_QWORD *)(v7 - 8);
  v40 = v7;
  v41 = v8;
  __chkstk_darwin(v7);
  v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100004440(&qword_100020360);
  v12 = *(_QWORD *)(v11 - 8);
  v42 = v11;
  v43 = v12;
  __chkstk_darwin(v11);
  v38 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(&unk_100015E40);
  v15 = sub_10000B074();
  ControlToggle.init<A, B, C, D, E, F, G>(kind:intentUpdatableProperty:title:subtitle:value:)(0xD000000000000025, 0x8000000100018140, KeyPath, sub_10000B050, 0, sub_1000049E4, 0, sub_100004A64, 0, &type metadata for Text, &type metadata for Text, &type metadata for Text, v15, &protocol witness table for Text, &protocol witness table for Text, &protocol witness table for Text);
  v16 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000010, 0x8000000100018170);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = sub_100004B38();
  WidgetConfiguration.configurationDisplayName(_:)(v16, v18, v20 & 1, v22, v1, v23);
  swift_bridgeObjectRelease(v22);
  swift_bridgeObjectRelease(v18);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v3, v1);
  v24 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000020, 0x8000000100018190);
  v26 = v25;
  LOBYTE(v3) = v27;
  v29 = v28;
  v45 = v1;
  v46 = v23;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v45, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  WidgetConfiguration.description(_:)(v24, v26, v3 & 1, v29, v4, OpaqueTypeConformance2);
  swift_bridgeObjectRelease(v29);
  swift_bridgeObjectRelease(v26);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v6, v4);
  v45 = v4;
  v46 = OpaqueTypeConformance2;
  v31 = swift_getOpaqueTypeConformance2(&v45, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description(_:)>>, 1);
  v32 = v38;
  v33 = v40;
  WidgetConfiguration.disablesControlStateCaching()(v40, v31);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v10, v33);
  v45 = v33;
  v46 = v31;
  v34 = swift_getOpaqueTypeConformance2(&v45, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v35 = v42;
  WidgetConfiguration.hiddenControl()(v42, v34);
  return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v32, v35);
}

uint64_t sub_10000B050@<X0>(uint64_t a1@<X8>)
{
  return sub_100004A00(0xD000000000000012, 0x80000001000181C0, a1);
}

unint64_t sub_10000B074()
{
  unint64_t result;

  result = qword_100020758;
  if (!qword_100020758)
  {
    result = swift_getWitnessTable(&unk_100016B6C, &type metadata for CenterGuidesSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020758);
  }
  return result;
}

void *sub_10000B0B8()
{
  return &protocol witness table for Int;
}

uint64_t sub_10000B0C4@<X0>(uint64_t a1@<X8>)
{
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t KeyPath;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t OpaqueTypeConformance2;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;

  v48 = a1;
  v1 = type metadata accessor for ControlSize(0);
  __chkstk_darwin(v1);
  v3 = (char *)&v41 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100004440(&qword_100020760);
  v41 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100004440(&qword_100020768);
  v43 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v9 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100004440(&qword_100020770);
  v11 = *(_QWORD *)(v10 - 8);
  v44 = v10;
  v45 = v11;
  __chkstk_darwin(v10);
  v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_100004440(&qword_100020778);
  v15 = *(_QWORD *)(v14 - 8);
  v46 = v14;
  v47 = v15;
  __chkstk_darwin(v14);
  v42 = (char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(&unk_100015F08);
  static ControlSize._1x1.getter();
  v18 = sub_10000B830();
  v19 = sub_10000B874();
  v20 = sub_10000B8B8();
  ControlPicker.init<A, B, C, D, E, F, G, H>(kind:displayName:preferredSize:intentUpdatableProperty:title:subtitle:value:affordances:)(0xD000000000000022, 0x80000001000181E0, 0x736552206874614DLL, 0xEC00000073746C75, v3, KeyPath, sub_10000B4AC, 0, sub_10000B4CC, 0, sub_10000B54C, 0, sub_10000B798, 0, &type metadata for Text, &type metadata for Text, &type metadata for Text, v18, v19,
    v20,
    &protocol witness table for Text,
    &protocol witness table for Text,
    &protocol witness table for Text);
  v21 = LocalizedStringKey.init(stringLiteral:)(0x614D656C62616E45, 0xEF72657061506874);
  v23 = v22;
  LOBYTE(v19) = v24;
  v26 = v25;
  v27 = sub_10000B8FC();
  WidgetConfiguration.configurationDisplayName(_:)(v21, v23, v19 & 1, v26, v4, v27);
  swift_bridgeObjectRelease(v26);
  swift_bridgeObjectRelease(v23);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v6, v4);
  v28 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000021, 0x8000000100018210);
  v30 = v29;
  LOBYTE(v6) = v31;
  v33 = v32;
  v49 = v4;
  v50 = v27;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v49, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  WidgetConfiguration.description(_:)(v28, v30, v6 & 1, v33, v7, OpaqueTypeConformance2);
  swift_bridgeObjectRelease(v33);
  swift_bridgeObjectRelease(v30);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v9, v7);
  v49 = v7;
  v50 = OpaqueTypeConformance2;
  v35 = swift_getOpaqueTypeConformance2(&v49, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description(_:)>>, 1);
  v36 = v42;
  v37 = v44;
  WidgetConfiguration.disablesControlStateCaching()(v44, v35);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v13, v37);
  v49 = v37;
  v50 = v35;
  v38 = swift_getOpaqueTypeConformance2(&v49, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v39 = v46;
  WidgetConfiguration.hiddenControl()(v46, v38);
  return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v36, v39);
}

uint64_t sub_10000B4AC@<X0>(uint64_t a1@<X8>)
{
  return sub_10000B4E8(0x736552206874614DLL, 0xEC00000073746C75, a1);
}

uint64_t sub_10000B4CC@<X0>(uint64_t a1@<X8>)
{
  return sub_10000B4E8(0x1000000000000011, 0x80000001000171B0, a1);
}

uint64_t sub_10000B4E8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char v7;
  uint64_t v8;

  v4 = LocalizedStringKey.init(stringLiteral:)(a1, a2);
  result = Text.init(_:tableName:bundle:comment:)(v4);
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = v6;
  *(_BYTE *)(a3 + 16) = v7 & 1;
  *(_QWORD *)(a3 + 24) = v8;
  return result;
}

uint64_t sub_10000B54C@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  char v5;
  uint64_t v6;

  result = sub_10000B580(*a1);
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v4;
  *(_BYTE *)(a2 + 16) = v5 & 1;
  *(_QWORD *)(a2 + 24) = v6;
  return result;
}

uint64_t sub_10000B580(unsigned __int8 a1)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v21[24];

  v2 = sub_100004440(&qword_1000207A0);
  __chkstk_darwin(v2);
  v4 = &v21[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v5 = type metadata accessor for LocalizedStringResource(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = &v21[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __chkstk_darwin(v7);
  v11 = &v21[-v10 - 8];
  if (qword_1000201C0 != -1)
    swift_once(&qword_1000201C0, sub_10000D420);
  swift_beginAccess(&qword_100020ED8, v21, 32, 0);
  v12 = qword_100020ED8;
  if (*(_QWORD *)(qword_100020ED8 + 16) && (v13 = sub_10000DEE4(a1), (v14 & 1) != 0))
  {
    v15 = v13;
    v16 = *(_QWORD *)(v12 + 56);
    v17 = type metadata accessor for DisplayRepresentation(0);
    v18 = *(_QWORD *)(v17 - 8);
    (*(void (**)(_BYTE *, unint64_t, uint64_t))(v18 + 16))(v4, v16 + *(_QWORD *)(v18 + 72) * v15, v17);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v4, 0, 1, v17);
  }
  else
  {
    v17 = type metadata accessor for DisplayRepresentation(0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v4, 1, 1, v17);
  }
  type metadata accessor for DisplayRepresentation(0);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 48))(v4, 1, v17))
  {
    sub_10000B948((uint64_t)v4);
    swift_endAccess(v21);
    LocalizedStringResource.init(stringLiteral:)(0, 0xE000000000000000);
  }
  else
  {
    DisplayRepresentation.title.getter();
    sub_10000B948((uint64_t)v4);
    swift_endAccess(v21);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v6 + 32))(v11, v9, v5);
  }
  return Text.init(_:)(v11);
}

uint64_t sub_10000B798(unsigned __int8 *a1)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;

  v1 = sub_10000B580(*a1);
  return ControlAffordances.init(tint:status:actionHint:)(0, v1, v3, v2 & 1, v4, 0, 0, 0, 0);
}

void sub_10000B800(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

ValueMetadata *type metadata accessor for MathPaperPickerControl()
{
  return &type metadata for MathPaperPickerControl;
}

uint64_t sub_10000B81C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001A474, 1);
}

unint64_t sub_10000B830()
{
  unint64_t result;

  result = qword_100020780;
  if (!qword_100020780)
  {
    result = swift_getWitnessTable(&unk_100016474, &type metadata for MathPaperSettingEntity.Mode);
    atomic_store(result, (unint64_t *)&qword_100020780);
  }
  return result;
}

unint64_t sub_10000B874()
{
  unint64_t result;

  result = qword_100020788;
  if (!qword_100020788)
  {
    result = swift_getWitnessTable(&unk_100015E70, &type metadata for MathPaperSettingEntity.Mode);
    atomic_store(result, (unint64_t *)&qword_100020788);
  }
  return result;
}

unint64_t sub_10000B8B8()
{
  unint64_t result;

  result = qword_100020790;
  if (!qword_100020790)
  {
    result = swift_getWitnessTable(&unk_10001611C, &type metadata for MathPaperSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020790);
  }
  return result;
}

unint64_t sub_10000B8FC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100020798;
  if (!qword_100020798)
  {
    v1 = sub_10000294C(&qword_100020760);
    result = swift_getWitnessTable(&protocol conformance descriptor for ControlPicker<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100020798);
  }
  return result;
}

uint64_t sub_10000B948(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100004440(&qword_1000207A0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000B988()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t OpaqueTypeConformance2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;

  v0 = sub_10000294C(&qword_100020778);
  v1 = sub_10000294C(&qword_100020770);
  v2 = sub_10000294C(&qword_100020768);
  v7 = sub_10000294C(&qword_100020760);
  v8 = sub_10000B8FC();
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v7 = v2;
  v8 = OpaqueTypeConformance2;
  v4 = swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description(_:)>>, 1);
  v7 = v1;
  v8 = v4;
  v5 = swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v7 = v0;
  v8 = v5;
  return swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of WidgetConfiguration.hiddenControl()>>, 1);
}

unint64_t sub_10000BA58()
{
  unint64_t result;

  result = qword_1000207B8;
  if (!qword_1000207B8)
  {
    result = swift_getWitnessTable(&unk_100016010, &type metadata for MathPaperSettingEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_1000207B8);
  }
  return result;
}

uint64_t sub_10000BA9C()
{
  return sub_100004574(&qword_1000207C0, &qword_1000207C8, (uint64_t)&protocol conformance descriptor for _IntentUpdatableEntityProperty<A, B, C>);
}

unint64_t sub_10000BAC8(uint64_t a1)
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
  char v15;
  unint64_t result;
  char v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v2 = sub_100004440(&qword_100020508);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
  {
    v8 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    v24 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v24);
    return (unint64_t)v8;
  }
  sub_100004440(&qword_100020968);
  v7 = static _DictionaryStorage.allocate(capacity:)(v6);
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
    goto LABEL_9;
  v10 = &v5[*(int *)(v2 + 48)];
  v11 = v7 + 64;
  v12 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v26 = a1;
  v13 = a1 + v12;
  v14 = *(_QWORD *)(v3 + 72);
  swift_retain(v7);
  while (1)
  {
    sub_10000E798(v13, (uint64_t)v5, &qword_100020508);
    v15 = *v5;
    result = sub_10000DEB4(*v5);
    if ((v17 & 1) != 0)
      break;
    v18 = result;
    *(_QWORD *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_BYTE *)(v8[6] + result) = v15;
    v19 = v8[7];
    v20 = type metadata accessor for DisplayRepresentation(0);
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v19 + *(_QWORD *)(*(_QWORD *)(v20 - 8) + 72) * v18, v10, v20);
    v21 = v8[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
      goto LABEL_12;
    v8[2] = v23;
    v13 += v14;
    if (!--v9)
    {
      swift_release(v8);
      v24 = v26;
      goto LABEL_10;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_10000BC60(uint64_t a1)
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
  char v15;
  unint64_t result;
  char v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v2 = sub_100004440(&qword_100020528);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
  {
    v8 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    v24 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v24);
    return (unint64_t)v8;
  }
  sub_100004440(&qword_100020970);
  v7 = static _DictionaryStorage.allocate(capacity:)(v6);
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
    goto LABEL_9;
  v10 = &v5[*(int *)(v2 + 48)];
  v11 = v7 + 64;
  v12 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v26 = a1;
  v13 = a1 + v12;
  v14 = *(_QWORD *)(v3 + 72);
  swift_retain(v7);
  while (1)
  {
    sub_10000E798(v13, (uint64_t)v5, &qword_100020528);
    v15 = *v5;
    result = sub_10000DEB4(*v5);
    if ((v17 & 1) != 0)
      break;
    v18 = result;
    *(_QWORD *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_BYTE *)(v8[6] + result) = v15;
    v19 = v8[7];
    v20 = sub_100004440(&qword_100020978);
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v19 + *(_QWORD *)(*(_QWORD *)(v20 - 8) + 72) * v18, v10, v20);
    v21 = v8[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
      goto LABEL_12;
    v8[2] = v23;
    v13 += v14;
    if (!--v9)
    {
      swift_release(v8);
      v24 = v26;
      goto LABEL_10;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

void sub_10000BE00(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_10000BE40(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_10000BF1C + 4 * byte_100015F37[a2]))(0x746E69486874616DLL);
}

uint64_t sub_10000BF1C(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x746E69486874616DLL && v1 == 0xE900000000000073)
    v2 = 1;
  else
    v2 = ((uint64_t (*)(void))_stringCompareWithSmolCheck(_:_:expecting:))();
  swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRelease(0xE900000000000073);
  return v2 & 1;
}

void sub_10000C050(uint64_t a1, char a2)
{
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, a1);
  __asm { BR              X10 }
}

Swift::Int sub_10000C094()
{
  uint64_t v1;

  ((void (*)(uint64_t *, uint64_t, unint64_t))String.hash(into:))(&v1, 0x746E69486874616DLL, 0xE900000000000073);
  swift_bridgeObjectRelease(0xE900000000000073);
  return Hasher._finalize()();
}

uint64_t sub_10000C17C()
{
  uint64_t v0;

  v0 = type metadata accessor for LocalizedStringResource(0);
  sub_100004498(v0, qword_100020E40);
  sub_100004480(v0, (uint64_t)qword_100020E40);
  return LocalizedStringResource.init(stringLiteral:)(0xD000000000000013, 0x8000000100018390);
}

uint64_t sub_10000C1DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_100004440(&qword_100020340);
  sub_100004498(v0, qword_100020E58);
  v1 = sub_100004480(v0, (uint64_t)qword_100020E58);
  IntentDescription.init(stringLiteral:)(0xD00000000000005DLL, 0x8000000100018330);
  v2 = type metadata accessor for IntentDescription(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 0, 1, v2);
}

uint64_t sub_10000C264()
{
  uint64_t result;

  result = swift_getKeyPath(&unk_1000166C8);
  qword_100020E70 = result;
  return result;
}

uint64_t sub_10000C288(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  return swift_task_switch(sub_10000C2A4, 0, 0);
}

uint64_t sub_10000C2A4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  IntentParameter.wrappedValue.getter(v0 + 2);
  v1 = v0[2];
  v0[3] = v1;
  v0[9] = v1;
  IntentParameter.wrappedValue.getter((_QWORD *)((char *)v0 + 145));
  if (qword_100020198 != -1)
    swift_once(&qword_100020198, sub_10000C264);
  v2 = qword_100020E70;
  v0[10] = qword_100020E70;
  v3 = async function pointer to AppEntity._setValue<A, B, C>(_:for:)[1];
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  v0[11] = v4;
  v5 = sub_100004574(&qword_100020948, &qword_100020950, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  v0[12] = v5;
  *v4 = v0;
  v4[1] = sub_10000C39C;
  return AppEntity._setValue<A, B, C>(_:for:)((char *)v0 + 145, v2, &type metadata for MathPaperSettingEntity.Mode, v5);
}

uint64_t sub_10000C39C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 88);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 72);
  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc(v2);
  swift_release(v4);
  swift_release(v3);
  if (v0)
    v5 = sub_100002E14;
  else
    v5 = sub_10000C41C;
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_10000C41C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  IntentParameter.wrappedValue.getter(v0 + 5);
  v1 = v0[5];
  v0[4] = v1;
  v2 = qword_100020E70;
  v0[14] = v1;
  v0[15] = v2;
  v3 = async function pointer to AppEntity._value<A, B>(for:)[1];
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  v0[16] = v4;
  *v4 = v0;
  v4[1] = sub_10000C4B0;
  return AppEntity._value<A, B>(for:)(v0 + 18, v2, v0[12]);
}

uint64_t sub_10000C4B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 120);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 128);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 112);
  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc(v2);
  swift_release(v4);
  swift_release(v3);
  if (v0)
    v5 = sub_100002E20;
  else
    v5 = sub_10000C530;
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_10000C530()
{
  uint64_t v0;
  unint64_t v1;

  *(_BYTE *)(v0 + 146) = *(_BYTE *)(v0 + 144);
  v1 = sub_10000D9A8();
  static IntentResult.result<A>(value:)(v0 + 146, &type metadata for MathPaperSettingEntity.Mode, v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000C588()
{
  if (qword_100020198 != -1)
    swift_once(&qword_100020198, sub_10000C264);
  return swift_retain(qword_100020E70);
}

unint64_t sub_10000C5CC()
{
  unint64_t result;

  result = qword_1000207D0;
  if (!qword_1000207D0)
  {
    result = swift_getWitnessTable(&unk_1000160A0, &type metadata for MathPaperSettingEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_1000207D0);
  }
  return result;
}

unint64_t sub_10000C614()
{
  unint64_t result;

  result = qword_1000207D8;
  if (!qword_1000207D8)
  {
    result = swift_getWitnessTable(&unk_1000160C8, &type metadata for MathPaperSettingEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_1000207D8);
  }
  return result;
}

uint64_t sub_10000C658(uint64_t a1)
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2(a1, &unk_10001A4F0, 1) + 8);
}

uint64_t sub_10000C67C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000DADC(a1, a2, a3, (uint64_t (*)(void))sub_10000BA58, (uint64_t)&opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>);
}

uint64_t sub_10000C690@<X0>(uint64_t a1@<X8>)
{
  return sub_10000DA58(&qword_100020188, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_100020E40, (uint64_t)sub_10000C17C, a1);
}

uint64_t sub_10000C6B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_100020190 != -1)
    swift_once(&qword_100020190, sub_10000C1DC);
  v2 = sub_100004440(&qword_100020340);
  v3 = sub_100004480(v2, (uint64_t)qword_100020E58);
  return sub_10000E798(v3, a1, &qword_100020340);
}

uint64_t sub_10000C720(uint64_t a1)
{
  _OWORD *v1;
  uint64_t v2;
  uint64_t v4;

  v4 = swift_task_alloc(dword_100020964);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_100003278;
  *(_OWORD *)(v4 + 56) = *v1;
  *(_QWORD *)(v4 + 48) = a1;
  return swift_task_switch(sub_10000C2A4, 0, 0);
}

uint64_t sub_10000C788@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_10000E414();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_10000C7AC()
{
  return 0xD000000000000027;
}

unint64_t sub_10000C7CC()
{
  unint64_t result;

  result = qword_1000207E8;
  if (!qword_1000207E8)
  {
    result = swift_getWitnessTable(&unk_10001617C, &type metadata for MathPaperSettingEntity);
    atomic_store(result, (unint64_t *)&qword_1000207E8);
  }
  return result;
}

unint64_t sub_10000C814()
{
  unint64_t result;

  result = qword_1000207F0;
  if (!qword_1000207F0)
  {
    result = swift_getWitnessTable(&unk_1000161D4, &type metadata for MathPaperSettingEntity);
    atomic_store(result, (unint64_t *)&qword_1000207F0);
  }
  return result;
}

uint64_t sub_10000C858(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_10000C870, 0, 0);
}

uint64_t sub_10000C870()
{
  uint64_t v0;
  void *v1;
  NSString v2;
  id v3;
  char v4;

  if (qword_1000200F0 != -1)
    swift_once(&qword_1000200F0, sub_1000050B4);
  v1 = (void *)qword_100020CC8;
  v2 = String._bridgeToObjectiveC()();
  v3 = objc_msgSend(v1, "integerForKey:", v2);

  if ((unint64_t)v3 >= 3)
    v4 = 1;
  else
    v4 = (char)v3;
  **(_BYTE **)(v0 + 16) = v4;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000C918(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + 16) = *a2;
  return swift_task_switch(sub_10000C934, 0, 0);
}

uint64_t sub_10000C934()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  NSString v3;

  if (qword_1000200F0 != -1)
    swift_once(&qword_1000200F0, sub_1000050B4);
  v1 = *(unsigned __int8 *)(v0 + 16);
  v2 = (void *)qword_100020CC8;
  v3 = String._bridgeToObjectiveC()();
  objc_msgSend(v2, "setInteger:forKey:", v1, v3);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000C9D8()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v21[24];

  v0 = sub_100004440(&qword_1000202E8);
  __chkstk_darwin(v0);
  v2 = &v21[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v3 = sub_100004440(&qword_1000202D0);
  __chkstk_darwin(v3);
  v5 = &v21[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = type metadata accessor for LocalizedStringResource(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = &v21[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __chkstk_darwin(v8);
  v12 = &v21[-v11 - 8];
  if (qword_1000201A8 != -1)
    swift_once(&qword_1000201A8, sub_10000CE30);
  v13 = type metadata accessor for TypeDisplayRepresentation(0);
  v14 = sub_100004480(v13, (uint64_t)qword_100020E90);
  v15 = swift_beginAccess(v14, v21, 32, 0);
  TypeDisplayRepresentation.name.getter(v15);
  swift_endAccess(v21);
  LocalizedStringResource.init(stringLiteral:)(0x1000000000000011, 0x80000001000171B0);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  DisplayRepresentation.Image.init(appBundleIdentifier:)(0xD000000000000012, 0x80000001000171D0);
  v16 = type metadata accessor for DisplayRepresentation.Image(0);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v2, 0, 1, v16);
  v17 = sub_100004440(&qword_1000202F0);
  v18 = swift_allocObject(v17, ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ 3 * *(_QWORD *)(v7 + 72), *(unsigned __int8 *)(v7 + 80) | 7);
  *(_OWORD *)(v18 + 16) = xmmword_1000145F0;
  LocalizedStringResource.init(stringLiteral:)(0x757145206874614DLL, 0xEE00736E6F697461);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000011, 0x80000001000177B0);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000010, 0x80000001000177D0);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000100, 0x80000001000177F0);
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v12, v5, v2, v18, v10);
}

uint64_t sub_10000CCA0()
{
  uint64_t v0;
  unint64_t v1;

  v0 = sub_100004440(&qword_100020800);
  sub_100004498(v0, qword_100020E78);
  sub_100004480(v0, (uint64_t)qword_100020E78);
  v1 = sub_10000B8B8();
  return _UniqueEntityProvider.init(_:)(&unk_100020930, 0, &type metadata for MathPaperSettingEntity, v1);
}

uint64_t sub_10000CD0C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 16) = a1;
  v2 = type metadata accessor for LocalizedStringResource(0);
  *(_QWORD *)(v1 + 24) = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10000CD64, 0, 0);
}

uint64_t sub_10000CD64()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;

  v2 = *(_QWORD **)(v0 + 16);
  v1 = *(_QWORD *)(v0 + 24);
  sub_100004440(&qword_1000207C8);
  LocalizedStringResource.init(stringLiteral:)(0x736552206874614DLL, 0xEC00000073746C75);
  v3 = sub_100004574(&qword_100020948, &qword_100020950, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  v4 = sub_10000B830();
  *v2 = _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)(v1, &unk_100020938, 0, &unk_100020940, 0, &type metadata for MathPaperSettingEntity.UpdateIntent_value, v3, v4);
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000CE30(uint64_t a1)
{
  return sub_10000CE58(a1, qword_100020E90, 0x736552206874614DLL, 0xEC00000073746C75);
}

uint64_t sub_10000CE58(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  v7 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_100004498(v7, a2);
  sub_100004480(v7, (uint64_t)a2);
  return TypeDisplayRepresentation.init(stringLiteral:)(a3, a4);
}

uint64_t sub_10000CEB4()
{
  uint64_t v0;
  unint64_t v1;

  v0 = sub_100004440(&qword_100020958);
  sub_100004498(v0, qword_100020EA8);
  sub_100004480(v0, (uint64_t)qword_100020EA8);
  v1 = sub_10000C7CC();
  return _EntityURLRepresentation.init(stringLiteral:)(0xD00000000000004BLL, 0x8000000100017D50, &type metadata for MathPaperSettingEntity, v1);
}

uint64_t sub_10000CF2C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000D778(&qword_1000201B0, &qword_100020958, (uint64_t)qword_100020EA8, (uint64_t)sub_10000CEB4, a1);
}

uint64_t sub_10000CF50()
{
  return sub_100004574(&qword_1000207F8, &qword_100020800, (uint64_t)&protocol conformance descriptor for _UniqueEntityProvider<A>);
}

uint64_t sub_10000CF7C()
{
  uint64_t v0;

  v0 = qword_1000207A8;
  swift_bridgeObjectRetain(off_1000207B0);
  return v0;
}

unint64_t sub_10000CFB4()
{
  unint64_t result;

  result = qword_100020808;
  if (!qword_100020808)
  {
    result = swift_getWitnessTable(&unk_1000161FC, &type metadata for MathPaperSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020808);
  }
  return result;
}

unint64_t sub_10000CFFC()
{
  unint64_t result;

  result = qword_100020810;
  if (!qword_100020810)
  {
    result = swift_getWitnessTable(&unk_100016234, &type metadata for MathPaperSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020810);
  }
  return result;
}

unint64_t sub_10000D044()
{
  unint64_t result;

  result = qword_100020818;
  if (!qword_100020818)
  {
    result = swift_getWitnessTable(&unk_100016264, &type metadata for MathPaperSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020818);
  }
  return result;
}

uint64_t sub_10000D088()
{
  return sub_100004574((unint64_t *)&unk_100020820, &qword_100020800, (uint64_t)&protocol conformance descriptor for _UniqueEntityProvider<A>);
}

uint64_t sub_10000D0B4@<X0>(uint64_t a1@<X8>)
{
  return sub_10000D778(&qword_1000201A0, &qword_100020800, (uint64_t)qword_100020E78, (uint64_t)sub_10000CCA0, a1);
}

uint64_t sub_10000D0D8(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_10000E748();
  v4 = _URLRepresentableEntity.urlRepresentationParameter.getter(a1, v3);
  return sub_100004560(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8), v1, v4, v5);
}

unint64_t sub_10000D124()
{
  unint64_t result;

  result = qword_100020830;
  if (!qword_100020830)
  {
    result = swift_getWitnessTable(&unk_10001629C, &type metadata for MathPaperSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020830);
  }
  return result;
}

unint64_t sub_10000D16C()
{
  unint64_t result;

  result = qword_100020838;
  if (!qword_100020838)
  {
    result = swift_getWitnessTable(&unk_1000162C4, &type metadata for MathPaperSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020838);
  }
  return result;
}

unint64_t sub_10000D1B4()
{
  unint64_t result;

  result = qword_100020840;
  if (!qword_100020840)
  {
    result = swift_getWitnessTable(&unk_1000162EC, &type metadata for MathPaperSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020840);
  }
  return result;
}

unint64_t sub_10000D1FC()
{
  unint64_t result;

  result = qword_100020848;
  if (!qword_100020848)
  {
    result = swift_getWitnessTable(&unk_100016344, &type metadata for MathPaperSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020848);
  }
  return result;
}

uint64_t sub_10000D240@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v4;
  uint64_t result;
  uint64_t v6;

  v4 = sub_10000B8B8();
  result = _UniqueEntity.id.getter(a1, v4);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_10000D27C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE v5[24];

  if (qword_1000201A8 != -1)
    swift_once(&qword_1000201A8, sub_10000CE30);
  v2 = type metadata accessor for TypeDisplayRepresentation(0);
  v3 = sub_100004480(v2, (uint64_t)qword_100020E90);
  swift_beginAccess(v3, v5, 0, 0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_10000D314()
{
  return sub_100004574(&qword_100020850, &qword_100020858, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_10000D340(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000C7CC();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000D37C()
{
  unint64_t result;

  result = qword_100020860;
  if (!qword_100020860)
  {
    result = swift_getWitnessTable(&unk_100016374, &type metadata for MathPaperSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020860);
  }
  return result;
}

uint64_t sub_10000D3C4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000D1FC();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_10000D3FC(uint64_t a1)
{
  return sub_10000CE58(a1, qword_100020EC0, 0x6F4D2065766C6F53, 0xEA00000000006564);
}

uint64_t sub_10000D420()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  unint64_t v8;
  uint64_t result;

  v0 = sub_100004440(&qword_100020900);
  v1 = sub_100004440(&qword_100020908);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = *(unsigned __int8 *)(v2 + 80);
  v5 = (v4 + 32) & ~v4;
  v6 = swift_allocObject(v0, v5 + 3 * v3, v4 | 7);
  *(_OWORD *)(v6 + 16) = xmmword_1000145F0;
  v7 = (_BYTE *)(v6 + v5);
  *v7 = 0;
  DisplayRepresentation.init(stringLiteral:)(6710863, 0xE300000000000000);
  v7[v3] = 1;
  DisplayRepresentation.init(stringLiteral:)(0x2074736567677553, 0xEF73746C75736552);
  v7[2 * v3] = 2;
  DisplayRepresentation.init(stringLiteral:)(0x5220747265736E49, 0xEE0073746C757365);
  v8 = sub_10000E2AC(v6);
  swift_setDeallocating(v6);
  swift_arrayDestroy(v7, 3, v1);
  result = swift_deallocClassInstance(v6, 32, 7);
  qword_100020ED8 = v8;
  return result;
}

uint64_t sub_10000D570()
{
  uint64_t v0;
  unint64_t v1;

  v0 = sub_100004440(&qword_100020920);
  sub_100004498(v0, qword_100020EE0);
  sub_100004480(v0, (uint64_t)qword_100020EE0);
  v1 = sub_10000B830();
  return _EnumURLRepresentation.init(stringLiteral:)(0xD00000000000004BLL, 0x8000000100018290, &type metadata for MathPaperSettingEntity.Mode, v1);
}

BOOL sub_10000D5E8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_10000D600()
{
  unint64_t result;

  result = qword_100020868;
  if (!qword_100020868)
  {
    result = swift_getWitnessTable(&unk_10001639C, &type metadata for MathPaperSettingEntity.Mode);
    atomic_store(result, (unint64_t *)&qword_100020868);
  }
  return result;
}

Swift::Int sub_10000D644()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000D688()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10000D6B0(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t *sub_10000D6F0@<X0>(uint64_t *result@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;

  v2 = *result;
  if ((unint64_t)*result >= 3)
    LOBYTE(v2) = 3;
  *a2 = v2;
  return result;
}

unint64_t sub_10000D710()
{
  unint64_t result;

  result = qword_100020870;
  if (!qword_100020870)
  {
    result = swift_getWitnessTable(&unk_1000164B4, &type metadata for MathPaperSettingEntity.Mode);
    atomic_store(result, (unint64_t *)&qword_100020870);
  }
  return result;
}

uint64_t sub_10000D754@<X0>(uint64_t a1@<X8>)
{
  return sub_10000D778(&qword_1000201C8, &qword_100020920, (uint64_t)qword_100020EE0, (uint64_t)sub_10000D570, a1);
}

uint64_t sub_10000D778@<X0>(_QWORD *a1@<X2>, uint64_t *a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;

  if (*a1 != -1)
    swift_once(a1, a4);
  v8 = sub_100004440(a2);
  v9 = sub_100004480(v8, a3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a5, v9, v8);
}

unint64_t sub_10000D7EC()
{
  unint64_t result;

  result = qword_100020878;
  if (!qword_100020878)
  {
    result = swift_getWitnessTable(&unk_1000164DC, &type metadata for MathPaperSettingEntity.Mode);
    atomic_store(result, (unint64_t *)&qword_100020878);
  }
  return result;
}

unint64_t sub_10000D834()
{
  unint64_t result;

  result = qword_100020880;
  if (!qword_100020880)
  {
    result = swift_getWitnessTable(&unk_100016514, &type metadata for MathPaperSettingEntity.Mode);
    atomic_store(result, (unint64_t *)&qword_100020880);
  }
  return result;
}

unint64_t sub_10000D87C()
{
  unint64_t result;

  result = qword_100020888;
  if (!qword_100020888)
  {
    result = swift_getWitnessTable(&unk_100016404, &type metadata for MathPaperSettingEntity.Mode);
    atomic_store(result, (unint64_t *)&qword_100020888);
  }
  return result;
}

void *sub_10000D8C0()
{
  return &protocol witness table for Int;
}

uint64_t sub_10000D8CC(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_10000E704();
  v4 = _URLRepresentableEnum.urlRepresentationParameter.getter(a1, v3);
  return sub_100004560(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8), v1, v4, v5);
}

unint64_t sub_10000D918()
{
  unint64_t result;

  result = qword_100020898;
  if (!qword_100020898)
  {
    result = swift_getWitnessTable(&unk_100016544, &type metadata for MathPaperSettingEntity.Mode);
    atomic_store(result, (unint64_t *)&qword_100020898);
  }
  return result;
}

unint64_t sub_10000D960()
{
  unint64_t result;

  result = qword_1000208A0;
  if (!qword_1000208A0)
  {
    result = swift_getWitnessTable(&unk_10001656C, &type metadata for MathPaperSettingEntity.Mode);
    atomic_store(result, (unint64_t *)&qword_1000208A0);
  }
  return result;
}

unint64_t sub_10000D9A8()
{
  unint64_t result;

  result = qword_1000208A8;
  if (!qword_1000208A8)
  {
    result = swift_getWitnessTable(&unk_100016594, &type metadata for MathPaperSettingEntity.Mode);
    atomic_store(result, (unint64_t *)&qword_1000208A8);
  }
  return result;
}

unint64_t sub_10000D9F0()
{
  unint64_t result;

  result = qword_1000208B0;
  if (!qword_1000208B0)
  {
    result = swift_getWitnessTable(&unk_1000165EC, &type metadata for MathPaperSettingEntity.Mode);
    atomic_store(result, (unint64_t *)&qword_1000208B0);
  }
  return result;
}

uint64_t sub_10000DA34@<X0>(uint64_t a1@<X8>)
{
  return sub_10000DA58(&qword_1000201B8, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_100020EC0, (uint64_t)sub_10000D3FC, a1);
}

uint64_t sub_10000DA58@<X0>(_QWORD *a1@<X2>, uint64_t (*a2)(_QWORD)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;

  if (*a1 != -1)
    swift_once(a1, a4);
  v8 = a2(0);
  v9 = sub_100004480(v8, a3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a5, v9, v8);
}

uint64_t sub_10000DAC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000DADC(a1, a2, a3, (uint64_t (*)(void))sub_10000B830, (uint64_t)&opaque type descriptor for <<opaque return type of static AppEnum.defaultResolverSpecification>>);
}

uint64_t sub_10000DADC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t a5)
{
  _QWORD v7[2];

  v7[0] = a2;
  v7[1] = a4();
  return swift_getOpaqueTypeConformance2(v7, a5, 1);
}

uint64_t sub_10000DB1C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000B830();
  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000DB58()
{
  unint64_t result;

  result = qword_1000208B8;
  if (!qword_1000208B8)
  {
    result = swift_getWitnessTable(&unk_10001662C, &type metadata for MathPaperSettingEntity.Mode);
    atomic_store(result, (unint64_t *)&qword_1000208B8);
  }
  return result;
}

unint64_t sub_10000DBA0()
{
  unint64_t result;

  result = qword_1000208C0;
  if (!qword_1000208C0)
  {
    result = swift_getWitnessTable(&unk_100016654, &type metadata for MathPaperSettingEntity.Mode);
    atomic_store(result, (unint64_t *)&qword_1000208C0);
  }
  return result;
}

unint64_t sub_10000DBE8()
{
  unint64_t result;

  result = qword_1000208C8;
  if (!qword_1000208C8)
  {
    result = swift_getWitnessTable(&unk_1000163C4, &type metadata for MathPaperSettingEntity.Mode);
    atomic_store(result, (unint64_t *)&qword_1000208C8);
  }
  return result;
}

uint64_t sub_10000DC2C()
{
  _BYTE v1[24];

  if (qword_1000201C0 != -1)
    swift_once(&qword_1000201C0, sub_10000D420);
  swift_beginAccess(&qword_100020ED8, v1, 0, 0);
  return swift_bridgeObjectRetain(qword_100020ED8);
}

uint64_t sub_10000DC98(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000D9F0();
  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_10000DCD0()
{
  return sub_100004574(&qword_1000208D0, &qword_1000208D8, (uint64_t)&protocol conformance descriptor for [A]);
}

void sub_10000DCFC(_QWORD *a1@<X8>)
{
  *a1 = &off_10001C898;
}

ValueMetadata *type metadata accessor for MathPaperSettingEntity()
{
  return &type metadata for MathPaperSettingEntity;
}

ValueMetadata *type metadata accessor for MathPaperSettingEntity.UpdateIntent_value()
{
  return &type metadata for MathPaperSettingEntity.UpdateIntent_value;
}

uint64_t getEnumTagSinglePayload for MathPaperSettingEntity.Mode(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for MathPaperSettingEntity.Mode(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_10000DE08 + 4 * byte_100015F4A[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_10000DE3C + 4 * byte_100015F45[v4]))();
}

uint64_t sub_10000DE3C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000DE44(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000DE4CLL);
  return result;
}

uint64_t sub_10000DE58(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000DE60);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_10000DE64(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000DE6C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MathPaperSettingEntity.Mode()
{
  return &type metadata for MathPaperSettingEntity.Mode;
}

uint64_t sub_10000DE88()
{
  return sub_100004574(&qword_1000208E0, &qword_1000208E8, (uint64_t)&protocol conformance descriptor for IntentResultContainer<A, B, C, D>);
}

uint64_t sub_10000DEB4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  sub_10000C050(*(_QWORD *)(v1 + 40), a1);
  return sub_10000DF3C(a1, v3);
}

unint64_t sub_10000DEE4(unsigned __int8 a1)
{
  uint64_t v1;
  Swift::Int v3;
  _QWORD v5[9];

  Hasher.init(_seed:)(v5, *(_QWORD *)(v1 + 40));
  Hasher._combine(_:)(a1);
  v3 = Hasher._finalize()();
  return sub_10000E20C(a1, v3);
}

uint64_t sub_10000DF3C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  v3 = a2 & ~(-1 << *(_BYTE *)(v2 + 32));
  if (((*(_QWORD *)(v2 + 64 + ((v3 >> 3) & 0xFFFFFFFFFFFFF8)) >> v3) & 1) != 0)
    __asm { BR              X9 }
  return a2 & ~(-1 << *(_BYTE *)(v2 + 32));
}

unint64_t sub_10000E20C(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_10000E2AC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 *v5;
  uint64_t v6;
  _QWORD *v7;
  unsigned __int8 *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 v11;
  unint64_t result;
  char v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;

  v2 = sub_100004440(&qword_100020908);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (unsigned __int8 *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  if (v6)
  {
    sub_100004440(&qword_100020910);
    v7 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v6);
    v8 = &v5[*(int *)(v2 + 48)];
    v9 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v10 = *(_QWORD *)(v3 + 72);
    while (1)
    {
      sub_10000E798(v9, (uint64_t)v5, &qword_100020908);
      v11 = *v5;
      result = sub_10000DEE4(*v5);
      if ((v13 & 1) != 0)
        break;
      v14 = result;
      *(_QWORD *)((char *)v7 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_BYTE *)(v7[6] + result) = v11;
      v15 = v7[7];
      v16 = type metadata accessor for DisplayRepresentation(0);
      result = (*(uint64_t (**)(unint64_t, unsigned __int8 *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v15 + *(_QWORD *)(*(_QWORD *)(v16 - 8) + 72) * v14, v8, v16);
      v17 = v7[2];
      v18 = __OFADD__(v17, 1);
      v19 = v17 + 1;
      if (v18)
        goto LABEL_10;
      v7[2] = v19;
      v9 += v10;
      if (!--v6)
        return (unint64_t)v7;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  return result;
}

uint64_t sub_10000E414()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t, uint64_t);
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD v25[2];
  void (*v26)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;

  v0 = type metadata accessor for InputConnectionBehavior(0);
  v28 = *(_QWORD *)(v0 - 8);
  v29 = v0;
  __chkstk_darwin(v0);
  v2 = (char *)v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_100004440(&qword_1000202C8);
  v4 = __chkstk_darwin(v3);
  v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)v25 - v7;
  v9 = sub_100004440(&qword_1000202D0);
  __chkstk_darwin(v9);
  v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  v27 = v12;
  __chkstk_darwin(v12);
  v15 = (char *)v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25[1] = sub_100004440(&qword_1000208F0);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000016, 0x8000000100018240);
  v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v26(v11, 1, 1, v12);
  v31 = 0;
  v16 = type metadata accessor for IntentDialog(0);
  v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56);
  v18 = v8;
  v17(v8, 1, 1, v16);
  v19 = v6;
  v17(v6, 1, 1, v16);
  v20 = enum case for InputConnectionBehavior.default(_:);
  v21 = v29;
  v25[0] = *(_QWORD *)(v28 + 104);
  ((void (*)(char *, _QWORD, uint64_t))v25[0])(v2, enum case for InputConnectionBehavior.default(_:), v29);
  v22 = sub_10000C7CC();
  v28 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v15, v11, &v31, v18, v19, v2, v22);
  sub_100004440(&qword_1000208F8);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000026, 0x8000000100018260);
  v26(v11, 1, 1, v27);
  v30 = 3;
  v17(v18, 1, 1, v16);
  v17(v19, 1, 1, v16);
  ((void (*)(char *, uint64_t, uint64_t))v25[0])(v2, v20, v21);
  v23 = sub_10000B830();
  IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)(v15, v11, &v30, v18, v19, v2, &off_10001C870, v23);
  return v28;
}

unint64_t sub_10000E704()
{
  unint64_t result;

  result = qword_100020918;
  if (!qword_100020918)
  {
    result = swift_getWitnessTable(&unk_10001643C, &type metadata for MathPaperSettingEntity.Mode);
    atomic_store(result, (unint64_t *)&qword_100020918);
  }
  return result;
}

unint64_t sub_10000E748()
{
  unint64_t result;

  result = qword_100020928;
  if (!qword_100020928)
  {
    result = swift_getWitnessTable(&unk_1000160E4, &type metadata for MathPaperSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020928);
  }
  return result;
}

uint64_t sub_10000E78C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = v2;
  return swift_retain(v2);
}

uint64_t sub_10000E798(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100004440(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000E7DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  Swift::String v8;
  uint64_t KeyPath;
  unint64_t v10;
  uint64_t v11;
  Swift::String v12;
  void (*v13)(char *, uint64_t);
  uint64_t v14;
  Swift::String v15;
  uint64_t v16;
  uint64_t v17;
  Swift::String v18;
  Swift::String v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  Swift::String v23;
  uint64_t v24;
  Swift::String v25;
  uint64_t v26;
  uint64_t v27;
  Swift::String v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  Swift::String v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  Swift::String v36;
  Swift::String v37;
  uint64_t v38;
  uint64_t v39;
  Swift::String v40;
  uint64_t v41;
  Swift::String v42;
  uint64_t v43;
  uint64_t v44;
  Swift::String v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t);
  Swift::String v48;
  uint64_t v49;
  uint64_t v50;
  Swift::String v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(char *, uint64_t);
  uint64_t v71;

  v71 = a1;
  v69 = sub_100004440(&qword_100020A48);
  v1 = *(_QWORD *)(v69 - 8);
  __chkstk_darwin(v69);
  v3 = (char *)&v60 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100004440(&qword_100020A50);
  __chkstk_darwin(v4);
  v6 = (char *)&v60 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1000117B0();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(16, 1, &type metadata for OpenFreeformSettingsIntent, v7);
  v8._countAndFlagsBits = 0x20796D206E65704FLL;
  v8._object = (void *)0xE800000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v8);
  KeyPath = swift_getKeyPath(&unk_100016978);
  v10 = sub_1000077F4();
  v11 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v10);
  swift_release(KeyPath);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v11, v4);
  swift_release(v11);
  v12._countAndFlagsBits = 0x676E697474657320;
  v12._object = (void *)0xE800000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v12);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v6, &type metadata for OpenFreeformSettingsIntent, v7);
  v68 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for OpenFreeformSettingsIntent, v7);
  v13 = *(void (**)(char *, uint64_t))(v1 + 8);
  v14 = v69;
  v13(v3, v69);
  v70 = v13;
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(19, 1, &type metadata for OpenFreeformSettingsIntent, v7);
  v15._object = (void *)0xEB0000000020796DLL;
  v15._countAndFlagsBits = 0x20656D20776F6853;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v15);
  v16 = swift_getKeyPath(&unk_100016978);
  v17 = _AssistantIntent.IntentProjection.subscript.getter(v16, v10);
  swift_release(v16);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v17, v4);
  swift_release(v17);
  v18._countAndFlagsBits = 0x676E697474657320;
  v18._object = (void *)0xE800000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v18);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v6, &type metadata for OpenFreeformSettingsIntent, v7);
  v67 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for OpenFreeformSettingsIntent, v7);
  v13(v3, v14);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(29, 1, &type metadata for OpenFreeformSettingsIntent, v7);
  v19._object = (void *)0x8000000100018490;
  v19._countAndFlagsBits = 0xD000000000000015;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v19);
  v20 = swift_getKeyPath(&unk_100016978);
  v21 = v10;
  v61 = v10;
  v22 = _AssistantIntent.IntentProjection.subscript.getter(v20, v10);
  swift_release(v20);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v22, v4);
  swift_release(v22);
  v23._countAndFlagsBits = 0x676E697474657320;
  v23._object = (void *)0xE800000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v23);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v6, &type metadata for OpenFreeformSettingsIntent, v7);
  v66 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for OpenFreeformSettingsIntent, v7);
  v24 = v69;
  v70(v3, v69);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(23, 1, &type metadata for OpenFreeformSettingsIntent, v7);
  v25._countAndFlagsBits = 0xD000000000000017;
  v25._object = (void *)0x80000001000184B0;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v25);
  v26 = swift_getKeyPath(&unk_100016978);
  v27 = _AssistantIntent.IntentProjection.subscript.getter(v26, v21);
  swift_release(v26);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v27, v4);
  swift_release(v27);
  v28._countAndFlagsBits = 0;
  v28._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v28);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v6, &type metadata for OpenFreeformSettingsIntent, v7);
  v65 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for OpenFreeformSettingsIntent, v7);
  v29 = v24;
  v30 = v24;
  v31 = v70;
  v70(v3, v30);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(22, 1, &type metadata for OpenFreeformSettingsIntent, v7);
  v32._countAndFlagsBits = 0xD000000000000016;
  v32._object = (void *)0x80000001000184D0;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v32);
  v33 = swift_getKeyPath(&unk_100016978);
  v34 = v61;
  v35 = _AssistantIntent.IntentProjection.subscript.getter(v33, v61);
  swift_release(v33);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v35, v4);
  swift_release(v35);
  v36._countAndFlagsBits = 0;
  v36._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v36);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v6, &type metadata for OpenFreeformSettingsIntent, v7);
  v64 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for OpenFreeformSettingsIntent, v7);
  v31(v3, v29);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(13, 1, &type metadata for OpenFreeformSettingsIntent, v7);
  v37._countAndFlagsBits = 0x206E65704FLL;
  v37._object = (void *)0xE500000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v37);
  v38 = swift_getKeyPath(&unk_100016978);
  v39 = _AssistantIntent.IntentProjection.subscript.getter(v38, v34);
  swift_release(v38);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v39, v4);
  swift_release(v39);
  v40._countAndFlagsBits = 0x676E697474657320;
  v40._object = (void *)0xE800000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v40);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v6, &type metadata for OpenFreeformSettingsIntent, v7);
  v63 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for OpenFreeformSettingsIntent, v7);
  v41 = v69;
  v70(v3, v69);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(13, 1, &type metadata for OpenFreeformSettingsIntent, v7);
  v42._countAndFlagsBits = 0x2077656956;
  v42._object = (void *)0xE500000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v42);
  v43 = swift_getKeyPath(&unk_100016978);
  v44 = _AssistantIntent.IntentProjection.subscript.getter(v43, v34);
  swift_release(v43);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v44, v4);
  swift_release(v44);
  v45._countAndFlagsBits = 0x676E697474657320;
  v45._object = (void *)0xE800000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v45);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v6, &type metadata for OpenFreeformSettingsIntent, v7);
  v62 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for OpenFreeformSettingsIntent, v7);
  v46 = v41;
  v47 = v70;
  v70(v3, v41);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(19, 1, &type metadata for OpenFreeformSettingsIntent, v7);
  v48._countAndFlagsBits = 0x20656D20656B6154;
  v48._object = (void *)0xEB00000000206F74;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v48);
  v49 = swift_getKeyPath(&unk_100016978);
  v50 = _AssistantIntent.IntentProjection.subscript.getter(v49, v34);
  swift_release(v49);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v50, v4);
  swift_release(v50);
  v51._countAndFlagsBits = 0x676E697474657320;
  v51._object = (void *)0xE800000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v51);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v6, &type metadata for OpenFreeformSettingsIntent, v7);
  v52 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for OpenFreeformSettingsIntent, v7);
  v47(v3, v46);
  v53 = sub_100004440(&qword_100020A58);
  v54 = swift_allocObject(v53, 96, 7);
  *(_OWORD *)(v54 + 16) = xmmword_1000166F0;
  v55 = v67;
  *(_QWORD *)(v54 + 32) = v68;
  *(_QWORD *)(v54 + 40) = v55;
  v56 = v65;
  *(_QWORD *)(v54 + 48) = v66;
  *(_QWORD *)(v54 + 56) = v56;
  v57 = v63;
  *(_QWORD *)(v54 + 64) = v64;
  *(_QWORD *)(v54 + 72) = v57;
  *(_QWORD *)(v54 + 80) = v62;
  *(_QWORD *)(v54 + 88) = v52;
  v58 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v54);
  return v58;
}

uint64_t sub_10000EFE8(uint64_t a1)
{
  return sub_10000F684(a1, (uint64_t)&unk_100016978, (uint64_t (*)(void))sub_1000077F4, (uint64_t (*)(uint64_t))sub_1000117B0, (uint64_t)sub_10000F00C);
}

uint64_t sub_10000F00C()
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

  v0 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x206F742070616E53, 0xEC00000064697247);
  v1 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x47207265746E6543, 0xED00007365646975);
  v2 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x6975472065676445, 0xEB00000000736564);
  v3 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x20676E6963617053, 0xEE00736564697547);
  v4 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000011, 0x8000000100017500);
  v5 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x736552206874614DLL, 0xEC00000073746C75);
  v6 = sub_100004440(&qword_100020990);
  v7 = swift_allocObject(v6, 80, 7);
  *(_OWORD *)(v7 + 16) = xmmword_100016700;
  *(_QWORD *)(v7 + 32) = v0;
  *(_QWORD *)(v7 + 40) = v1;
  *(_QWORD *)(v7 + 48) = v2;
  *(_QWORD *)(v7 + 56) = v3;
  *(_QWORD *)(v7 + 64) = v4;
  *(_QWORD *)(v7 + 72) = v5;
  v8 = static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_10000F160()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  Swift::String v9;
  uint64_t KeyPath;
  uint64_t v11;
  Swift::String v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  Swift::String v16;
  uint64_t v17;
  Swift::String v18;
  uint64_t v19;
  uint64_t v20;
  Swift::String v21;
  uint64_t v22;
  uint64_t v23;
  Swift::String v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  Swift::String v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  Swift::String v32;
  uint64_t v33;
  uint64_t v34;
  Swift::String v35;
  uint64_t v36;
  uint64_t v37;
  Swift::String v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;

  v0 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v49 = *(_QWORD *)(v0 - 8);
  v50 = v0;
  __chkstk_darwin(v0);
  v48 = (char *)&v45 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_100004440(&qword_100020A30);
  v46 = *(_QWORD *)(v2 - 8);
  v47 = v2;
  __chkstk_darwin(v2);
  v4 = (char *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100004440(&qword_100020A38);
  __chkstk_darwin(v5);
  v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100011B08();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(5, 2, &type metadata for CenterGuidesSettingEntity.UpdateIntent_value, v8);
  v9._countAndFlagsBits = 544499027;
  v9._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v9);
  KeyPath = swift_getKeyPath(&unk_100016928);
  v52 = sub_100011C60();
  v11 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v52);
  swift_release(KeyPath);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v11, v5);
  swift_release(v11);
  v12._countAndFlagsBits = 32;
  v12._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v12);
  v13 = swift_getKeyPath(&unk_100016950);
  v14 = sub_1000045B4();
  v45 = v14;
  v15 = _AssistantIntent.IntentProjection.subscript.getter(v13, v14);
  swift_release(v13);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v15, v5);
  swift_release(v15);
  v16._countAndFlagsBits = 0;
  v16._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v16);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v7, &type metadata for CenterGuidesSettingEntity.UpdateIntent_value, v8);
  v51 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v4, &type metadata for CenterGuidesSettingEntity.UpdateIntent_value, v8);
  v17 = v47;
  v46 = *(_QWORD *)(v46 + 8);
  ((void (*)(char *, uint64_t))v46)(v4, v47);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(5, 3, &type metadata for CenterGuidesSettingEntity.UpdateIntent_value, v8);
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v18);
  v19 = swift_getKeyPath(&unk_100016950);
  v20 = _AssistantIntent.IntentProjection.subscript.getter(v19, v14);
  swift_release(v19);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v20, v5);
  swift_release(v20);
  v21._countAndFlagsBits = 32;
  v21._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v21);
  v22 = swift_getKeyPath(&unk_100016928);
  v23 = _AssistantIntent.IntentProjection.subscript.getter(v22, v52);
  swift_release(v22);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v23, v5);
  swift_release(v23);
  v24._countAndFlagsBits = 544108320;
  v24._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v24);
  v25 = v48;
  v26 = v49;
  v27 = v50;
  (*(void (**)(char *, _QWORD, uint64_t))(v49 + 104))(v48, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v50);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v25, v5);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v25, v27);
  v28._countAndFlagsBits = 0;
  v28._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v28);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v7, &type metadata for CenterGuidesSettingEntity.UpdateIntent_value, v8);
  v50 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v4, &type metadata for CenterGuidesSettingEntity.UpdateIntent_value, v8);
  v29 = v17;
  v30 = v17;
  v31 = (void (*)(char *, uint64_t))v46;
  ((void (*)(char *, uint64_t))v46)(v4, v30);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(6, 2, &type metadata for CenterGuidesSettingEntity.UpdateIntent_value, v8);
  v32._countAndFlagsBits = 0x206E727554;
  v32._object = (void *)0xE500000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v32);
  v33 = swift_getKeyPath(&unk_100016950);
  v34 = _AssistantIntent.IntentProjection.subscript.getter(v33, v45);
  swift_release(v33);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v34, v5);
  swift_release(v34);
  v35._countAndFlagsBits = 32;
  v35._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v35);
  v36 = swift_getKeyPath(&unk_100016928);
  v37 = _AssistantIntent.IntentProjection.subscript.getter(v36, v52);
  swift_release(v36);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v37, v5);
  swift_release(v37);
  v38._countAndFlagsBits = 0;
  v38._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v38);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v7, &type metadata for CenterGuidesSettingEntity.UpdateIntent_value, v8);
  v39 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v4, &type metadata for CenterGuidesSettingEntity.UpdateIntent_value, v8);
  v31(v4, v29);
  v40 = sub_100004440(&qword_100020A40);
  v41 = swift_allocObject(v40, 56, 7);
  *(_OWORD *)(v41 + 16) = xmmword_1000145F0;
  v42 = v50;
  *(_QWORD *)(v41 + 32) = v51;
  *(_QWORD *)(v41 + 40) = v42;
  *(_QWORD *)(v41 + 48) = v39;
  v43 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v41);
  return v43;
}

uint64_t sub_10000F660(uint64_t a1)
{
  return sub_10000F684(a1, (uint64_t)&unk_100016928, (uint64_t (*)(void))sub_100011C60, (uint64_t (*)(uint64_t))sub_100011B08, (uint64_t)sub_10000F7A8);
}

uint64_t sub_10000F684(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t (*a4)(uint64_t), uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t KeyPath;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;

  v9 = type metadata accessor for _AssistantIntent.Value(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(a2);
  v14 = a3();
  v15 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v14);
  v16 = swift_release(KeyPath);
  v17 = a4(v16);
  _AssistantIntent.Value.init<A>(for:builder:)(v15, a5, 0, v17);
  v18 = static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)(v12);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v19 = sub_100004440(&qword_1000209A8);
  v20 = swift_allocObject(v19, 40, 7);
  *(_OWORD *)(v20 + 16) = xmmword_100016710;
  *(_QWORD *)(v20 + 32) = v18;
  v21 = static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v20);
  return v21;
}

uint64_t sub_10000F7A8()
{
  return sub_100011658();
}

uint64_t sub_10000F7CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  Swift::String v9;
  uint64_t KeyPath;
  uint64_t v11;
  Swift::String v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  Swift::String v16;
  uint64_t v17;
  Swift::String v18;
  uint64_t v19;
  uint64_t v20;
  Swift::String v21;
  uint64_t v22;
  uint64_t v23;
  Swift::String v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  Swift::String v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  Swift::String v32;
  uint64_t v33;
  uint64_t v34;
  Swift::String v35;
  uint64_t v36;
  uint64_t v37;
  Swift::String v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;

  v0 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v49 = *(_QWORD *)(v0 - 8);
  v50 = v0;
  __chkstk_darwin(v0);
  v48 = (char *)&v45 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_100004440(&qword_100020A10);
  v46 = *(_QWORD *)(v2 - 8);
  v47 = v2;
  __chkstk_darwin(v2);
  v4 = (char *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100004440(&qword_100020A18);
  __chkstk_darwin(v5);
  v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100009784();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(5, 2, &type metadata for EdgeGuidesSettingEntity.UpdateIntent_value, v8);
  v9._countAndFlagsBits = 544499027;
  v9._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v9);
  KeyPath = swift_getKeyPath(&unk_1000168D8);
  v52 = sub_10000A6F0();
  v11 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v52);
  swift_release(KeyPath);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v11, v5);
  swift_release(v11);
  v12._countAndFlagsBits = 32;
  v12._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v12);
  v13 = swift_getKeyPath(&unk_100016900);
  v14 = sub_1000045B4();
  v45 = v14;
  v15 = _AssistantIntent.IntentProjection.subscript.getter(v13, v14);
  swift_release(v13);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v15, v5);
  swift_release(v15);
  v16._countAndFlagsBits = 0;
  v16._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v16);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v7, &type metadata for EdgeGuidesSettingEntity.UpdateIntent_value, v8);
  v51 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v4, &type metadata for EdgeGuidesSettingEntity.UpdateIntent_value, v8);
  v17 = v47;
  v46 = *(_QWORD *)(v46 + 8);
  ((void (*)(char *, uint64_t))v46)(v4, v47);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(5, 3, &type metadata for EdgeGuidesSettingEntity.UpdateIntent_value, v8);
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v18);
  v19 = swift_getKeyPath(&unk_100016900);
  v20 = _AssistantIntent.IntentProjection.subscript.getter(v19, v14);
  swift_release(v19);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v20, v5);
  swift_release(v20);
  v21._countAndFlagsBits = 32;
  v21._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v21);
  v22 = swift_getKeyPath(&unk_1000168D8);
  v23 = _AssistantIntent.IntentProjection.subscript.getter(v22, v52);
  swift_release(v22);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v23, v5);
  swift_release(v23);
  v24._countAndFlagsBits = 544108320;
  v24._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v24);
  v25 = v48;
  v26 = v49;
  v27 = v50;
  (*(void (**)(char *, _QWORD, uint64_t))(v49 + 104))(v48, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v50);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v25, v5);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v25, v27);
  v28._countAndFlagsBits = 0;
  v28._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v28);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v7, &type metadata for EdgeGuidesSettingEntity.UpdateIntent_value, v8);
  v50 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v4, &type metadata for EdgeGuidesSettingEntity.UpdateIntent_value, v8);
  v29 = v17;
  v30 = v17;
  v31 = (void (*)(char *, uint64_t))v46;
  ((void (*)(char *, uint64_t))v46)(v4, v30);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(6, 2, &type metadata for EdgeGuidesSettingEntity.UpdateIntent_value, v8);
  v32._countAndFlagsBits = 0x206E727554;
  v32._object = (void *)0xE500000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v32);
  v33 = swift_getKeyPath(&unk_100016900);
  v34 = _AssistantIntent.IntentProjection.subscript.getter(v33, v45);
  swift_release(v33);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v34, v5);
  swift_release(v34);
  v35._countAndFlagsBits = 32;
  v35._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v35);
  v36 = swift_getKeyPath(&unk_1000168D8);
  v37 = _AssistantIntent.IntentProjection.subscript.getter(v36, v52);
  swift_release(v36);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v37, v5);
  swift_release(v37);
  v38._countAndFlagsBits = 0;
  v38._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v38);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v7, &type metadata for EdgeGuidesSettingEntity.UpdateIntent_value, v8);
  v39 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v4, &type metadata for EdgeGuidesSettingEntity.UpdateIntent_value, v8);
  v31(v4, v29);
  v40 = sub_100004440(&qword_100020A20);
  v41 = swift_allocObject(v40, 56, 7);
  *(_OWORD *)(v41 + 16) = xmmword_1000145F0;
  v42 = v50;
  *(_QWORD *)(v41 + 32) = v51;
  *(_QWORD *)(v41 + 40) = v42;
  *(_QWORD *)(v41 + 48) = v39;
  v43 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v41);
  return v43;
}

uint64_t sub_10000FCCC(uint64_t a1)
{
  return sub_10000F684(a1, (uint64_t)&unk_1000168D8, (uint64_t (*)(void))sub_10000A6F0, (uint64_t (*)(uint64_t))sub_100009784, (uint64_t)sub_10000FCF0);
}

uint64_t sub_10000FCF0()
{
  return sub_100011658();
}

uint64_t sub_10000FD10(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  Swift::String v11;
  uint64_t KeyPath;
  uint64_t v13;
  Swift::String v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  Swift::String v18;
  void (*v19)(char *, uint64_t);
  uint64_t v20;
  Swift::String v21;
  uint64_t v22;
  uint64_t v23;
  Swift::String v24;
  char *v25;
  char *v26;
  Swift::String v27;
  uint64_t v28;
  uint64_t v29;
  Swift::String v30;
  uint64_t v31;
  uint64_t v32;
  Swift::String v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  Swift::String v37;
  unint64_t v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t);
  Swift::String v41;
  uint64_t v42;
  uint64_t v43;
  Swift::String v44;
  uint64_t v45;
  uint64_t v46;
  Swift::String v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;

  v2 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v61 = *(_QWORD *)(v2 - 8);
  v62 = v2;
  __chkstk_darwin(v2);
  v60 = (char *)&v54 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = sub_100004440(&qword_1000209F8);
  v4 = *(_QWORD *)(v64 - 8);
  __chkstk_darwin(v64);
  v6 = (char *)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100004440(&qword_100020A00);
  __chkstk_darwin(v7);
  v9 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100007D28();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(5, 2, &type metadata for SpacingGuidesSettingEntity.UpdateIntent_value, v10);
  v11._countAndFlagsBits = 544499027;
  v11._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v11);
  KeyPath = swift_getKeyPath(&unk_100016888);
  v65 = sub_100008C9C();
  v56 = a1;
  v13 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v65);
  swift_release(KeyPath);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v13, v7);
  swift_release(v13);
  v14._countAndFlagsBits = 32;
  v14._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v14);
  v15 = swift_getKeyPath(&unk_1000168B0);
  v16 = sub_1000045B4();
  v17 = _AssistantIntent.IntentProjection.subscript.getter(v15, v16);
  swift_release(v15);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v17, v7);
  swift_release(v17);
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v18);
  v55 = v6;
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for SpacingGuidesSettingEntity.UpdateIntent_value, v10);
  v63 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v6, &type metadata for SpacingGuidesSettingEntity.UpdateIntent_value, v10);
  v19 = *(void (**)(char *, uint64_t))(v4 + 8);
  v20 = v64;
  v19(v6, v64);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(17, 1, &type metadata for SpacingGuidesSettingEntity.UpdateIntent_value, v10);
  v21._object = (void *)0x8000000100018470;
  v21._countAndFlagsBits = 0xD000000000000011;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v21);
  v22 = swift_getKeyPath(&unk_1000168B0);
  v58 = v16;
  v23 = _AssistantIntent.IntentProjection.subscript.getter(v22, v16);
  swift_release(v22);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v23, v7);
  swift_release(v23);
  v24._countAndFlagsBits = 0;
  v24._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v24);
  v25 = v55;
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for SpacingGuidesSettingEntity.UpdateIntent_value, v10);
  v57 = v10;
  v59 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v25, &type metadata for SpacingGuidesSettingEntity.UpdateIntent_value, v10);
  v26 = v25;
  v19(v25, v20);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(5, 3, &type metadata for SpacingGuidesSettingEntity.UpdateIntent_value, v10);
  v27._countAndFlagsBits = 0;
  v27._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v27);
  v28 = swift_getKeyPath(&unk_1000168B0);
  v29 = _AssistantIntent.IntentProjection.subscript.getter(v28, v16);
  swift_release(v28);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v29, v7);
  swift_release(v29);
  v30._countAndFlagsBits = 32;
  v30._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v30);
  v31 = swift_getKeyPath(&unk_100016888);
  v32 = _AssistantIntent.IntentProjection.subscript.getter(v31, v65);
  swift_release(v31);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v32, v7);
  swift_release(v32);
  v33._countAndFlagsBits = 544108320;
  v33._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v33);
  v35 = v60;
  v34 = v61;
  v36 = v62;
  (*(void (**)(char *, _QWORD, uint64_t))(v61 + 104))(v60, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v62);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v35, v7);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v35, v36);
  v37._countAndFlagsBits = 0;
  v37._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v37);
  v38 = v57;
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for SpacingGuidesSettingEntity.UpdateIntent_value, v57);
  v62 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v26, &type metadata for SpacingGuidesSettingEntity.UpdateIntent_value, v38);
  v39 = v64;
  v19(v26, v64);
  v40 = v19;
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(6, 2, &type metadata for SpacingGuidesSettingEntity.UpdateIntent_value, v38);
  v41._countAndFlagsBits = 0x206E727554;
  v41._object = (void *)0xE500000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v41);
  v42 = swift_getKeyPath(&unk_1000168B0);
  v43 = _AssistantIntent.IntentProjection.subscript.getter(v42, v58);
  swift_release(v42);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v43, v7);
  swift_release(v43);
  v44._countAndFlagsBits = 32;
  v44._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v44);
  v45 = swift_getKeyPath(&unk_100016888);
  v46 = _AssistantIntent.IntentProjection.subscript.getter(v45, v65);
  swift_release(v45);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v46, v7);
  swift_release(v46);
  v47._countAndFlagsBits = 0;
  v47._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v47);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for SpacingGuidesSettingEntity.UpdateIntent_value, v38);
  v48 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v26, &type metadata for SpacingGuidesSettingEntity.UpdateIntent_value, v38);
  v40(v26, v39);
  v49 = sub_100004440(&qword_100020A08);
  v50 = swift_allocObject(v49, 64, 7);
  *(_OWORD *)(v50 + 16) = xmmword_100016720;
  v51 = v59;
  *(_QWORD *)(v50 + 32) = v63;
  *(_QWORD *)(v50 + 40) = v51;
  *(_QWORD *)(v50 + 48) = v62;
  *(_QWORD *)(v50 + 56) = v48;
  v52 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v50);
  return v52;
}

uint64_t sub_100010300(uint64_t a1)
{
  return sub_10000F684(a1, (uint64_t)&unk_100016888, (uint64_t (*)(void))sub_100008C9C, (uint64_t (*)(uint64_t))sub_100007D28, (uint64_t)sub_100010324);
}

uint64_t sub_100010324()
{
  return sub_100011658();
}

uint64_t sub_100010348(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  Swift::String v11;
  uint64_t KeyPath;
  uint64_t v13;
  Swift::String v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  Swift::String v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t);
  Swift::String v21;
  uint64_t v22;
  uint64_t v23;
  Swift::String v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  Swift::String v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  Swift::String v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t);
  Swift::String v35;
  uint64_t v36;
  uint64_t v37;
  Swift::String v38;
  uint64_t v39;
  uint64_t v40;
  Swift::String v41;
  Swift::String v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  Swift::String v46;
  uint64_t v47;
  Swift::String v48;
  uint64_t v49;
  uint64_t v50;
  Swift::String v51;
  void (*v52)(char *, uint64_t);
  Swift::String v53;
  uint64_t v54;
  uint64_t v55;
  Swift::String v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v64;
  unint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(char *, uint64_t);
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;

  v2 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v67 = *(_QWORD *)(v2 - 8);
  v68 = v2;
  __chkstk_darwin(v2);
  v66 = (char *)&v64 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = sub_100004440(&qword_1000209E0);
  v4 = *(_QWORD *)(v73 - 8);
  __chkstk_darwin(v73);
  v6 = (char *)&v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100004440(&qword_1000209E8);
  __chkstk_darwin(v7);
  v9 = (char *)&v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_10000BA58();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(8, 2, &type metadata for MathPaperSettingEntity.UpdateIntent_value, v10);
  v11._countAndFlagsBits = 544499027;
  v11._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v11);
  KeyPath = swift_getKeyPath(&unk_100016838);
  v65 = sub_10000D1B4();
  v13 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v65);
  swift_release(KeyPath);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v13, v7);
  swift_release(v13);
  v14._countAndFlagsBits = 544175136;
  v14._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v14);
  v15 = swift_getKeyPath(&unk_100016860);
  v16 = sub_10000D9A8();
  v72 = v16;
  v17 = _AssistantIntent.IntentProjection.subscript.getter(v15, v16);
  swift_release(v15);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v17, v7);
  swift_release(v17);
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v18);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for MathPaperSettingEntity.UpdateIntent_value, v10);
  v19 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v6, &type metadata for MathPaperSettingEntity.UpdateIntent_value, v10);
  v20 = *(void (**)(char *, uint64_t))(v4 + 8);
  v69 = v19;
  v70 = v20;
  v20(v6, v73);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(5, 3, &type metadata for MathPaperSettingEntity.UpdateIntent_value, v10);
  v21._countAndFlagsBits = 0;
  v21._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v21);
  v22 = swift_getKeyPath(&unk_100016860);
  v71 = a1;
  v23 = _AssistantIntent.IntentProjection.subscript.getter(v22, v16);
  swift_release(v22);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v23, v7);
  swift_release(v23);
  v24._countAndFlagsBits = 32;
  v24._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v24);
  v25 = swift_getKeyPath(&unk_100016838);
  v26 = v65;
  v27 = _AssistantIntent.IntentProjection.subscript.getter(v25, v65);
  swift_release(v25);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v27, v7);
  swift_release(v27);
  v28._countAndFlagsBits = 544108320;
  v28._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v28);
  v30 = v66;
  v29 = v67;
  v31 = v68;
  (*(void (**)(char *, _QWORD, uint64_t))(v67 + 104))(v66, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v68);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v30, v7);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v31);
  v32._countAndFlagsBits = 0;
  v32._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v32);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for MathPaperSettingEntity.UpdateIntent_value, v10);
  v68 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v6, &type metadata for MathPaperSettingEntity.UpdateIntent_value, v10);
  v33 = v73;
  v34 = v70;
  v70(v6, v73);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(5, 2, &type metadata for MathPaperSettingEntity.UpdateIntent_value, v10);
  v35._countAndFlagsBits = 543519573;
  v35._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v35);
  v36 = swift_getKeyPath(&unk_100016838);
  v37 = _AssistantIntent.IntentProjection.subscript.getter(v36, v26);
  swift_release(v36);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v37, v7);
  swift_release(v37);
  v38._countAndFlagsBits = 32;
  v38._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v38);
  v39 = swift_getKeyPath(&unk_100016860);
  v40 = _AssistantIntent.IntentProjection.subscript.getter(v39, v72);
  swift_release(v39);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v40, v7);
  swift_release(v40);
  v41._countAndFlagsBits = 0;
  v41._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v41);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for MathPaperSettingEntity.UpdateIntent_value, v10);
  v67 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v6, &type metadata for MathPaperSettingEntity.UpdateIntent_value, v10);
  v34(v6, v33);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(18, 1, &type metadata for MathPaperSettingEntity.UpdateIntent_value, v10);
  v42._countAndFlagsBits = 0;
  v42._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v42);
  v43 = swift_getKeyPath(&unk_100016860);
  v44 = v72;
  v45 = _AssistantIntent.IntentProjection.subscript.getter(v43, v72);
  swift_release(v43);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v45, v7);
  swift_release(v45);
  v46._countAndFlagsBits = 0xD000000000000012;
  v46._object = (void *)0x8000000100018410;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v46);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for MathPaperSettingEntity.UpdateIntent_value, v10);
  v66 = (char *)static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v6, &type metadata for MathPaperSettingEntity.UpdateIntent_value, v10);
  v47 = v73;
  v34(v6, v73);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(16, 1, &type metadata for MathPaperSettingEntity.UpdateIntent_value, v10);
  v48._countAndFlagsBits = 0;
  v48._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v48);
  v49 = swift_getKeyPath(&unk_100016860);
  v50 = _AssistantIntent.IntentProjection.subscript.getter(v49, v44);
  swift_release(v49);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v50, v7);
  swift_release(v50);
  v51._object = (void *)0x8000000100018430;
  v51._countAndFlagsBits = 0xD000000000000010;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v51);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for MathPaperSettingEntity.UpdateIntent_value, v10);
  v65 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v6, &type metadata for MathPaperSettingEntity.UpdateIntent_value, v10);
  v52 = v70;
  v70(v6, v47);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(31, 1, &type metadata for MathPaperSettingEntity.UpdateIntent_value, v10);
  v53._countAndFlagsBits = 0xD00000000000001FLL;
  v53._object = (void *)0x8000000100018450;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v53);
  v54 = swift_getKeyPath(&unk_100016860);
  v55 = _AssistantIntent.IntentProjection.subscript.getter(v54, v72);
  swift_release(v54);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v55, v7);
  swift_release(v55);
  v56._countAndFlagsBits = 0;
  v56._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v56);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for MathPaperSettingEntity.UpdateIntent_value, v10);
  v57 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v6, &type metadata for MathPaperSettingEntity.UpdateIntent_value, v10);
  v52(v6, v47);
  v58 = sub_100004440(&qword_1000209F0);
  v59 = swift_allocObject(v58, 80, 7);
  *(_OWORD *)(v59 + 16) = xmmword_100016700;
  v60 = v68;
  *(_QWORD *)(v59 + 32) = v69;
  *(_QWORD *)(v59 + 40) = v60;
  v61 = v66;
  *(_QWORD *)(v59 + 48) = v67;
  *(_QWORD *)(v59 + 56) = v61;
  *(_QWORD *)(v59 + 64) = v65;
  *(_QWORD *)(v59 + 72) = v57;
  v62 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v59);
  return v62;
}

uint64_t sub_100010AB4(uint64_t a1)
{
  return sub_10000F684(a1, (uint64_t)&unk_100016838, (uint64_t (*)(void))sub_10000D1B4, (uint64_t (*)(uint64_t))sub_10000BA58, (uint64_t)sub_100010AD8);
}

uint64_t sub_100010AD8()
{
  return sub_100011658();
}

uint64_t sub_100010AF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  Swift::String v8;
  uint64_t KeyPath;
  uint64_t v10;
  Swift::String v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  Swift::String v15;
  uint64_t v16;
  Swift::String v17;
  uint64_t v18;
  uint64_t v19;
  Swift::String v20;
  uint64_t v21;
  uint64_t v22;
  Swift::String v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  Swift::String v27;
  uint64_t v28;
  Swift::String v29;
  uint64_t v30;
  uint64_t v31;
  Swift::String v32;
  uint64_t v33;
  uint64_t v34;
  Swift::String v35;
  void (*v36)(char *, uint64_t);
  Swift::String v37;
  uint64_t v38;
  uint64_t v39;
  Swift::String v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;

  v0 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v49 = *(_QWORD *)(v0 - 8);
  v50 = v0;
  __chkstk_darwin(v0);
  v48 = (char *)&v47 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = sub_100004440(&qword_1000209C8);
  v53 = *(_QWORD *)(v47 - 8);
  __chkstk_darwin(v47);
  v3 = (char *)&v47 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100004440(&qword_1000209D0);
  __chkstk_darwin(v4);
  v6 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_10000512C();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(5, 2, &type metadata for SelectAndScrollSettingEntity.UpdateIntent_value, v7);
  v8._countAndFlagsBits = 544499027;
  v8._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v8);
  KeyPath = swift_getKeyPath(&unk_1000167E8);
  v54 = sub_100006090();
  v10 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v54);
  swift_release(KeyPath);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v10, v4);
  swift_release(v10);
  v11._countAndFlagsBits = 32;
  v11._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v11);
  v12 = swift_getKeyPath(&unk_100016810);
  v13 = sub_1000045B4();
  v52 = v13;
  v14 = _AssistantIntent.IntentProjection.subscript.getter(v12, v13);
  swift_release(v12);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v14, v4);
  swift_release(v14);
  v15._countAndFlagsBits = 0;
  v15._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v15);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v6, &type metadata for SelectAndScrollSettingEntity.UpdateIntent_value, v7);
  v51 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for SelectAndScrollSettingEntity.UpdateIntent_value, v7);
  v53 = *(_QWORD *)(v53 + 8);
  v16 = v47;
  ((void (*)(char *, uint64_t))v53)(v3, v47);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(5, 3, &type metadata for SelectAndScrollSettingEntity.UpdateIntent_value, v7);
  v17._countAndFlagsBits = 0;
  v17._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v17);
  v18 = swift_getKeyPath(&unk_100016810);
  v19 = _AssistantIntent.IntentProjection.subscript.getter(v18, v13);
  swift_release(v18);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v19, v4);
  swift_release(v19);
  v20._countAndFlagsBits = 32;
  v20._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v20);
  v21 = swift_getKeyPath(&unk_1000167E8);
  v22 = _AssistantIntent.IntentProjection.subscript.getter(v21, v54);
  swift_release(v21);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v22, v4);
  swift_release(v22);
  v23._countAndFlagsBits = 544108320;
  v23._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v23);
  v25 = v48;
  v24 = v49;
  v26 = v50;
  (*(void (**)(char *, _QWORD, uint64_t))(v49 + 104))(v48, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v50);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v25, v4);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v25, v26);
  v27._countAndFlagsBits = 0;
  v27._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v27);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v6, &type metadata for SelectAndScrollSettingEntity.UpdateIntent_value, v7);
  v50 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for SelectAndScrollSettingEntity.UpdateIntent_value, v7);
  v28 = v16;
  ((void (*)(char *, uint64_t))v53)(v3, v16);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(6, 2, &type metadata for SelectAndScrollSettingEntity.UpdateIntent_value, v7);
  v29._countAndFlagsBits = 0x206E727554;
  v29._object = (void *)0xE500000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v29);
  v30 = swift_getKeyPath(&unk_100016810);
  v31 = _AssistantIntent.IntentProjection.subscript.getter(v30, v52);
  swift_release(v30);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v31, v4);
  swift_release(v31);
  v32._countAndFlagsBits = 32;
  v32._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v32);
  v33 = swift_getKeyPath(&unk_1000167E8);
  v34 = _AssistantIntent.IntentProjection.subscript.getter(v33, v54);
  swift_release(v33);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v34, v4);
  swift_release(v34);
  v35._countAndFlagsBits = 0;
  v35._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v35);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v6, &type metadata for SelectAndScrollSettingEntity.UpdateIntent_value, v7);
  v54 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for SelectAndScrollSettingEntity.UpdateIntent_value, v7);
  v36 = (void (*)(char *, uint64_t))v53;
  ((void (*)(char *, uint64_t))v53)(v3, v16);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(28, 1, &type metadata for SelectAndScrollSettingEntity.UpdateIntent_value, v7);
  v37._countAndFlagsBits = 0;
  v37._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v37);
  v38 = swift_getKeyPath(&unk_100016810);
  v39 = _AssistantIntent.IntentProjection.subscript.getter(v38, v52);
  swift_release(v38);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v39, v4);
  swift_release(v39);
  v40._object = (void *)0x80000001000183F0;
  v40._countAndFlagsBits = 0xD00000000000001CLL;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v40);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v6, &type metadata for SelectAndScrollSettingEntity.UpdateIntent_value, v7);
  v41 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for SelectAndScrollSettingEntity.UpdateIntent_value, v7);
  v36(v3, v28);
  v42 = sub_100004440(&qword_1000209D8);
  v43 = swift_allocObject(v42, 64, 7);
  *(_OWORD *)(v43 + 16) = xmmword_100016720;
  v44 = v50;
  *(_QWORD *)(v43 + 32) = v51;
  *(_QWORD *)(v43 + 40) = v44;
  *(_QWORD *)(v43 + 48) = v54;
  *(_QWORD *)(v43 + 56) = v41;
  v45 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v43);
  return v45;
}

uint64_t sub_1000110B8(uint64_t a1)
{
  return sub_10000F684(a1, (uint64_t)&unk_1000167E8, (uint64_t (*)(void))sub_100006090, (uint64_t (*)(uint64_t))sub_10000512C, (uint64_t)sub_1000110DC);
}

uint64_t sub_1000110DC()
{
  return sub_100011658();
}

uint64_t sub_1000110F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  Swift::String v9;
  uint64_t KeyPath;
  uint64_t v11;
  Swift::String v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  Swift::String v16;
  uint64_t v17;
  Swift::String v18;
  uint64_t v19;
  uint64_t v20;
  Swift::String v21;
  uint64_t v22;
  uint64_t v23;
  Swift::String v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  Swift::String v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  Swift::String v32;
  uint64_t v33;
  uint64_t v34;
  Swift::String v35;
  uint64_t v36;
  uint64_t v37;
  Swift::String v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;

  v0 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v49 = *(_QWORD *)(v0 - 8);
  v50 = v0;
  __chkstk_darwin(v0);
  v48 = (char *)&v45 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_100004440(&qword_1000209B0);
  v46 = *(_QWORD *)(v2 - 8);
  v47 = v2;
  __chkstk_darwin(v2);
  v4 = (char *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100004440(&qword_1000209B8);
  __chkstk_darwin(v5);
  v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1000028DC();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(5, 2, &type metadata for SnapToGridSettingEntity.UpdateIntent_value, v8);
  v9._countAndFlagsBits = 544499027;
  v9._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v9);
  KeyPath = swift_getKeyPath(&unk_100016798);
  v52 = sub_100003CF0();
  v11 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v52);
  swift_release(KeyPath);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v11, v5);
  swift_release(v11);
  v12._countAndFlagsBits = 32;
  v12._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v12);
  v13 = swift_getKeyPath(&unk_1000167C0);
  v14 = sub_1000045B4();
  v45 = v14;
  v15 = _AssistantIntent.IntentProjection.subscript.getter(v13, v14);
  swift_release(v13);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v15, v5);
  swift_release(v15);
  v16._countAndFlagsBits = 0;
  v16._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v16);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v7, &type metadata for SnapToGridSettingEntity.UpdateIntent_value, v8);
  v51 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v4, &type metadata for SnapToGridSettingEntity.UpdateIntent_value, v8);
  v17 = v47;
  v46 = *(_QWORD *)(v46 + 8);
  ((void (*)(char *, uint64_t))v46)(v4, v47);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(5, 3, &type metadata for SnapToGridSettingEntity.UpdateIntent_value, v8);
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v18);
  v19 = swift_getKeyPath(&unk_1000167C0);
  v20 = _AssistantIntent.IntentProjection.subscript.getter(v19, v14);
  swift_release(v19);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v20, v5);
  swift_release(v20);
  v21._countAndFlagsBits = 32;
  v21._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v21);
  v22 = swift_getKeyPath(&unk_100016798);
  v23 = _AssistantIntent.IntentProjection.subscript.getter(v22, v52);
  swift_release(v22);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v23, v5);
  swift_release(v23);
  v24._countAndFlagsBits = 544108320;
  v24._object = (void *)0xE400000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v24);
  v25 = v48;
  v26 = v49;
  v27 = v50;
  (*(void (**)(char *, _QWORD, uint64_t))(v49 + 104))(v48, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v50);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v25, v5);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v25, v27);
  v28._countAndFlagsBits = 0;
  v28._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v28);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v7, &type metadata for SnapToGridSettingEntity.UpdateIntent_value, v8);
  v50 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v4, &type metadata for SnapToGridSettingEntity.UpdateIntent_value, v8);
  v29 = v17;
  v30 = v17;
  v31 = (void (*)(char *, uint64_t))v46;
  ((void (*)(char *, uint64_t))v46)(v4, v30);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(6, 2, &type metadata for SnapToGridSettingEntity.UpdateIntent_value, v8);
  v32._countAndFlagsBits = 0x206E727554;
  v32._object = (void *)0xE500000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v32);
  v33 = swift_getKeyPath(&unk_1000167C0);
  v34 = _AssistantIntent.IntentProjection.subscript.getter(v33, v45);
  swift_release(v33);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v34, v5);
  swift_release(v34);
  v35._countAndFlagsBits = 32;
  v35._object = (void *)0xE100000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v35);
  v36 = swift_getKeyPath(&unk_100016798);
  v37 = _AssistantIntent.IntentProjection.subscript.getter(v36, v52);
  swift_release(v36);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v37, v5);
  swift_release(v37);
  v38._countAndFlagsBits = 0;
  v38._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v38);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v7, &type metadata for SnapToGridSettingEntity.UpdateIntent_value, v8);
  v39 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v4, &type metadata for SnapToGridSettingEntity.UpdateIntent_value, v8);
  v31(v4, v29);
  v40 = sub_100004440(&qword_1000209C0);
  v41 = swift_allocObject(v40, 56, 7);
  *(_OWORD *)(v41 + 16) = xmmword_1000145F0;
  v42 = v50;
  *(_QWORD *)(v41 + 32) = v51;
  *(_QWORD *)(v41 + 40) = v42;
  *(_QWORD *)(v41 + 48) = v39;
  v43 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v41);
  return v43;
}

uint64_t sub_1000115F8(uint64_t a1)
{
  return sub_10000F684(a1, (uint64_t)&unk_100016798, (uint64_t (*)(void))sub_100003CF0, (uint64_t (*)(uint64_t))sub_1000028DC, (uint64_t)sub_10001161C);
}

uint64_t sub_10001161C()
{
  return sub_100011658();
}

uint64_t sub_10001163C()
{
  return sub_100011658();
}

uint64_t sub_100011658()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)();
  v1 = sub_100004440(&qword_100020990);
  v2 = swift_allocObject(v1, 40, 7);
  *(_OWORD *)(v2 + 16) = xmmword_100016710;
  *(_QWORD *)(v2 + 32) = v0;
  v3 = static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v2);
  return v3;
}

uint64_t sub_1000116C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v0 = type metadata accessor for _AssistantIntent.NegativeAssistantIntentPhrases(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1000117B0();
  _AssistantIntent.NegativeAssistantIntentPhrases.init<A>(for:phrases:)(&type metadata for OpenFreeformSettingsIntent, sub_10001163C, 0, &type metadata for OpenFreeformSettingsIntent, v4);
  v5 = static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildExpression(_:)(v3);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v6 = sub_100004440(&qword_100020988);
  v7 = swift_allocObject(v6, 40, 7);
  *(_OWORD *)(v7 + 16) = xmmword_100016710;
  *(_QWORD *)(v7 + 32) = v5;
  v8 = static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v7);
  return v8;
}

ValueMetadata *type metadata accessor for FreeformAssistantIntentsProvider()
{
  return &type metadata for FreeformAssistantIntentsProvider;
}

unint64_t sub_1000117B0()
{
  unint64_t result;

  result = qword_100020980;
  if (!qword_100020980)
  {
    result = swift_getWitnessTable(&unk_100016FC8, &type metadata for OpenFreeformSettingsIntent);
    atomic_store(result, (unint64_t *)&qword_100020980);
  }
  return result;
}

uint64_t sub_1000117F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v4;
  uint64_t v5;
  void (*v6)(char *, uint64_t);
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;

  v0 = type metadata accessor for _AssistantIntent(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = sub_100013CA4();
  v4 = sub_1000117B0();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v29, sub_10000E7DC, 0, sub_10000EFE8, 0, &type metadata for OpenFreeformSettingsIntent, v4);
  v5 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6 = *(void (**)(char *, uint64_t))(v1 + 8);
  v6(v3, v0);
  v29 = sub_100012F34();
  v30 = v7;
  v8 = sub_100011B08();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v29, sub_10000F160, 0, sub_10000F660, 0, &type metadata for CenterGuidesSettingEntity.UpdateIntent_value, v8);
  v9 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6(v3, v0);
  v29 = sub_10000A958();
  v30 = v10;
  v11 = sub_100009784();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v29, sub_10000F7CC, 0, sub_10000FCCC, 0, &type metadata for EdgeGuidesSettingEntity.UpdateIntent_value, v11);
  v12 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6(v3, v0);
  v29 = sub_100008F04();
  v30 = v13;
  v14 = sub_100007D28();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v29, sub_10000FD10, 0, sub_100010300, 0, &type metadata for SpacingGuidesSettingEntity.UpdateIntent_value, v14);
  v15 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6(v3, v0);
  v29 = sub_10000E414();
  v30 = v16;
  v17 = sub_10000BA58();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v29, sub_100010348, 0, sub_100010AB4, 0, &type metadata for MathPaperSettingEntity.UpdateIntent_value, v17);
  v18 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6(v3, v0);
  v29 = sub_1000062F8();
  v30 = v19;
  v20 = sub_10000512C();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v29, sub_100010AF8, 0, sub_1000110B8, 0, &type metadata for SelectAndScrollSettingEntity.UpdateIntent_value, v20);
  v21 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6(v3, v0);
  v29 = sub_10000411C();
  v30 = v22;
  v23 = sub_1000028DC();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v29, sub_1000110F8, 0, sub_1000115F8, 0, &type metadata for SnapToGridSettingEntity.UpdateIntent_value, v23);
  v24 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  v6(v3, v0);
  v25 = sub_100004440(&qword_1000209A0);
  v26 = swift_allocObject(v25, 88, 7);
  *(_OWORD *)(v26 + 16) = xmmword_100015070;
  *(_QWORD *)(v26 + 32) = v5;
  *(_QWORD *)(v26 + 40) = v9;
  *(_QWORD *)(v26 + 48) = v12;
  *(_QWORD *)(v26 + 56) = v15;
  *(_QWORD *)(v26 + 64) = v18;
  *(_QWORD *)(v26 + 72) = v21;
  *(_QWORD *)(v26 + 80) = v24;
  v27 = static _AssistantIntent.Builder.buildBlock(_:)();
  swift_bridgeObjectRelease(v26);
  return v27;
}

unint64_t sub_100011B08()
{
  unint64_t result;

  result = qword_100020998;
  if (!qword_100020998)
  {
    result = swift_getWitnessTable(&unk_100016A60, &type metadata for CenterGuidesSettingEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_100020998);
  }
  return result;
}

_QWORD *sub_100011B4C@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;
  uint64_t v3;

  result = IntentParameter.wrappedValue.getter(&v3);
  *a1 = v3;
  return result;
}

_QWORD *sub_100011BA0@<X0>(_BYTE *a1@<X8>)
{
  _QWORD *result;
  uint64_t v3;

  result = IntentParameter.wrappedValue.getter(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_100011BD8(char *a1)
{
  char v2;

  v2 = *a1;
  return IntentParameter.wrappedValue.setter(&v2);
}

uint64_t sub_100011C28(uint64_t *a1)
{
  uint64_t v2;

  v2 = *a1;
  swift_retain(v2);
  return IntentParameter.wrappedValue.setter(&v2);
}

unint64_t sub_100011C60()
{
  unint64_t result;

  result = qword_100020A28;
  if (!qword_100020A28)
  {
    result = swift_getWitnessTable(&unk_100016D3C, &type metadata for CenterGuidesSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020A28);
  }
  return result;
}

_QWORD *sub_100011CA8@<X0>(_BYTE *a1@<X8>)
{
  _QWORD *result;
  uint64_t v3;

  result = IntentParameter.wrappedValue.getter(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_100011CE4(char *a1)
{
  char v2;

  v2 = *a1;
  return IntentParameter.wrappedValue.setter(&v2);
}

_QWORD *sub_100011D18@<X0>(_BYTE *a1@<X8>)
{
  _QWORD *result;
  uint64_t v3;

  result = IntentParameter.wrappedValue.getter(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_100011D50(char *a1)
{
  char v2;

  v2 = *a1;
  return IntentParameter.wrappedValue.setter(&v2);
}

uint64_t sub_100011D9C()
{
  return sub_100004574(&qword_100020A70, &qword_100020A78, (uint64_t)&protocol conformance descriptor for _IntentUpdatableEntityProperty<A, B, C>);
}

uint64_t sub_100011DC8()
{
  uint64_t v0;

  v0 = type metadata accessor for LocalizedStringResource(0);
  sub_100004498(v0, qword_100020EF8);
  sub_100004480(v0, (uint64_t)qword_100020EF8);
  return LocalizedStringResource.init(stringLiteral:)(0xD000000000000014, 0x80000001000185E0);
}

uint64_t sub_100011E28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_100004440(&qword_100020340);
  sub_100004498(v0, qword_100020F10);
  v1 = sub_100004480(v0, (uint64_t)qword_100020F10);
  IntentDescription.init(stringLiteral:)(0xD000000000000040, 0x8000000100018590);
  v2 = type metadata accessor for IntentDescription(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 0, 1, v2);
}

uint64_t sub_100011EB0()
{
  uint64_t result;

  result = swift_getKeyPath(&unk_100016E28);
  qword_100020F28 = result;
  return result;
}

uint64_t sub_100011ED4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  return swift_task_switch(sub_100011EF0, 0, 0);
}

uint64_t sub_100011EF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 16));
  v1 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v0 + 24) = v1;
  *(_QWORD *)(v0 + 72) = v1;
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 146));
  *(_BYTE *)(v0 + 145) = *(_BYTE *)(v0 + 146);
  if (qword_1000201E0 != -1)
    swift_once(&qword_1000201E0, sub_100011EB0);
  v2 = qword_100020F28;
  *(_QWORD *)(v0 + 80) = qword_100020F28;
  v3 = async function pointer to AppEntity._setValue<A, B, C>(_:for:)[1];
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  *(_QWORD *)(v0 + 88) = v4;
  v5 = sub_100004574(&qword_100020B30, &qword_100020B38, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *(_QWORD *)(v0 + 96) = v5;
  *v4 = v0;
  v4[1] = sub_100011FF0;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 145, v2, &type metadata for Bool, v5);
}

uint64_t sub_100011FF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 88);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 72);
  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc(v2);
  swift_release(v4);
  swift_release(v3);
  if (v0)
    v5 = sub_100002E14;
  else
    v5 = sub_100012070;
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_100012070()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  IntentParameter.wrappedValue.getter(v0 + 5);
  v1 = v0[5];
  v0[4] = v1;
  v2 = qword_100020F28;
  v0[14] = v1;
  v0[15] = v2;
  v3 = async function pointer to AppEntity._value<A, B>(for:)[1];
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  v0[16] = v4;
  *v4 = v0;
  v4[1] = sub_100002D3C;
  return AppEntity._value<A, B>(for:)(v0 + 18, v2, v0[12]);
}

uint64_t sub_100012104()
{
  if (qword_1000201E0 != -1)
    swift_once(&qword_1000201E0, sub_100011EB0);
  return swift_retain(qword_100020F28);
}

unint64_t sub_100012148()
{
  unint64_t result;

  result = qword_100020A80;
  if (!qword_100020A80)
  {
    result = swift_getWitnessTable(&unk_100016AF0, &type metadata for CenterGuidesSettingEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_100020A80);
  }
  return result;
}

unint64_t sub_100012190()
{
  unint64_t result;

  result = qword_100020A88;
  if (!qword_100020A88)
  {
    result = swift_getWitnessTable(&unk_100016B18, &type metadata for CenterGuidesSettingEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_100020A88);
  }
  return result;
}

uint64_t sub_1000121D4(uint64_t a1)
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2(a1, &unk_10001A578, 1) + 8);
}

uint64_t sub_1000121F8(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_100011B08();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

uint64_t sub_100012238@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1000201D0 != -1)
    swift_once(&qword_1000201D0, sub_100011DC8);
  v2 = type metadata accessor for LocalizedStringResource(0);
  v3 = sub_100004480(v2, (uint64_t)qword_100020EF8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_1000122A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1000201D8 != -1)
    swift_once(&qword_1000201D8, sub_100011E28);
  v2 = sub_100004440(&qword_100020340);
  v3 = sub_100004480(v2, (uint64_t)qword_100020F10);
  return sub_1000045F8(v3, a1);
}

uint64_t sub_100012308(uint64_t a1)
{
  _OWORD *v1;
  uint64_t v2;
  uint64_t v4;

  v4 = swift_task_alloc(dword_100020B4C);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_100003278;
  *(_OWORD *)(v4 + 56) = *v1;
  *(_QWORD *)(v4 + 48) = a1;
  return swift_task_switch(sub_100011EF0, 0, 0);
}

uint64_t sub_100012370@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_100012F34();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100012394()
{
  return 0xD00000000000002ALL;
}

unint64_t sub_1000123B4()
{
  unint64_t result;

  result = qword_100020A98;
  if (!qword_100020A98)
  {
    result = swift_getWitnessTable(&unk_100016BCC, &type metadata for CenterGuidesSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020A98);
  }
  return result;
}

unint64_t sub_1000123FC()
{
  unint64_t result;

  result = qword_100020AA0;
  if (!qword_100020AA0)
  {
    result = swift_getWitnessTable(&unk_100016C24, &type metadata for CenterGuidesSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020AA0);
  }
  return result;
}

uint64_t sub_100012440(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_100012458, 0, 0);
}

uint64_t sub_100012458()
{
  uint64_t v0;
  _BYTE *v1;
  void *v2;
  NSString v3;

  if (qword_1000200F0 != -1)
    swift_once(&qword_1000200F0, sub_1000050B4);
  v1 = *(_BYTE **)(v0 + 16);
  v2 = (void *)qword_100020CC8;
  v3 = String._bridgeToObjectiveC()();
  LOBYTE(v2) = objc_msgSend(v2, "BOOLForKey:", v3);

  *v1 = (_BYTE)v2;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100012500(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + 16) = *a2;
  return swift_task_switch(sub_10001251C, 0, 0);
}

uint64_t sub_10001251C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  NSString v3;

  if (qword_1000200F0 != -1)
    swift_once(&qword_1000200F0, sub_1000050B4);
  v1 = *(unsigned __int8 *)(v0 + 16);
  v2 = (void *)qword_100020CC8;
  v3 = String._bridgeToObjectiveC()();
  objc_msgSend(v2, "setBool:forKey:", v1, v3);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000125C0()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE v19[24];

  v0 = sub_100004440(&qword_1000202E8);
  __chkstk_darwin(v0);
  v2 = &v19[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v3 = sub_100004440(&qword_1000202D0);
  __chkstk_darwin(v3);
  v5 = &v19[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = type metadata accessor for LocalizedStringResource(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = &v19[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __chkstk_darwin(v8);
  v12 = &v19[-v11 - 8];
  if (qword_1000201F0 != -1)
    swift_once(&qword_1000201F0, sub_100012968);
  v13 = type metadata accessor for TypeDisplayRepresentation(0);
  v14 = sub_100004480(v13, (uint64_t)qword_100020F48);
  v15 = swift_beginAccess(v14, v19, 32, 0);
  TypeDisplayRepresentation.name.getter(v15);
  swift_endAccess(v19);
  LocalizedStringResource.init(stringLiteral:)(0x1000000000000011, 0x80000001000171B0);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  DisplayRepresentation.Image.init(appBundleIdentifier:)(0xD000000000000012, 0x80000001000171D0);
  v16 = type metadata accessor for DisplayRepresentation.Image(0);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v2, 0, 1, v16);
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000014BLL, 0x8000000100017900);
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v12, v5, v2, &_swiftEmptyArrayStorage, v10);
}

uint64_t sub_1000127E0()
{
  uint64_t v0;
  unint64_t v1;

  v0 = sub_100004440(&qword_100020AB0);
  sub_100004498(v0, qword_100020F30);
  sub_100004480(v0, (uint64_t)qword_100020F30);
  v1 = sub_10000B074();
  return _UniqueEntityProvider.init(_:)(&unk_100020B18, 0, &type metadata for CenterGuidesSettingEntity, v1);
}

uint64_t sub_10001284C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 16) = a1;
  v2 = type metadata accessor for LocalizedStringResource(0);
  *(_QWORD *)(v1 + 24) = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_1000128A4, 0, 0);
}

uint64_t sub_1000128A4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2 = *(_QWORD **)(v0 + 16);
  v1 = *(_QWORD *)(v0 + 24);
  sub_100004440(&qword_100020A78);
  LocalizedStringResource.init(stringLiteral:)(0x47207265746E6543, 0xED00007365646975);
  v3 = sub_100004574(&qword_100020B30, &qword_100020B38, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *v2 = _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)(v1, &unk_100020B20, 0, &unk_100020B28, 0, &type metadata for CenterGuidesSettingEntity.UpdateIntent_value, v3);
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100012968()
{
  uint64_t v0;

  v0 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_100004498(v0, qword_100020F48);
  sub_100004480(v0, (uint64_t)qword_100020F48);
  return TypeDisplayRepresentation.init(stringLiteral:)(0x47207265746E6543, 0xED00007365646975);
}

uint64_t sub_1000129D0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000123B4();
  return _EntityURLRepresentation.init(stringLiteral:)(0xD00000000000004ELL, 0x8000000100017DA0, a1, v2);
}

uint64_t sub_100012A18()
{
  return sub_100004574(&qword_100020AA8, &qword_100020AB0, (uint64_t)&protocol conformance descriptor for _UniqueEntityProvider<A>);
}

uint64_t sub_100012A44()
{
  uint64_t v0;

  v0 = qword_100020A60;
  swift_bridgeObjectRetain(off_100020A68);
  return v0;
}

unint64_t sub_100012A7C()
{
  unint64_t result;

  result = qword_100020AB8;
  if (!qword_100020AB8)
  {
    result = swift_getWitnessTable(&unk_100016C4C, &type metadata for CenterGuidesSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020AB8);
  }
  return result;
}

unint64_t sub_100012AC4()
{
  unint64_t result;

  result = qword_100020AC0;
  if (!qword_100020AC0)
  {
    result = swift_getWitnessTable(&unk_100016C84, &type metadata for CenterGuidesSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020AC0);
  }
  return result;
}

unint64_t sub_100012B0C()
{
  unint64_t result;

  result = qword_100020AC8;
  if (!qword_100020AC8)
  {
    result = swift_getWitnessTable(&unk_100016CB4, &type metadata for CenterGuidesSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020AC8);
  }
  return result;
}

uint64_t sub_100012B50()
{
  return sub_100004574((unint64_t *)&unk_100020AD0, &qword_100020AB0, (uint64_t)&protocol conformance descriptor for _UniqueEntityProvider<A>);
}

uint64_t sub_100012B7C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1000201E8 != -1)
    swift_once(&qword_1000201E8, sub_1000127E0);
  v2 = sub_100004440(&qword_100020AB0);
  v3 = sub_100004480(v2, (uint64_t)qword_100020F30);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_100012BF0(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_100012EF0();
  v4 = _URLRepresentableEntity.urlRepresentationParameter.getter(a1, v3);
  return sub_100004560(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8), v1, v4, v5);
}

unint64_t sub_100012C3C()
{
  unint64_t result;

  result = qword_100020AE0;
  if (!qword_100020AE0)
  {
    result = swift_getWitnessTable(&unk_100016CEC, &type metadata for CenterGuidesSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020AE0);
  }
  return result;
}

unint64_t sub_100012C84()
{
  unint64_t result;

  result = qword_100020AE8;
  if (!qword_100020AE8)
  {
    result = swift_getWitnessTable(&unk_100016D14, &type metadata for CenterGuidesSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020AE8);
  }
  return result;
}

unint64_t sub_100012CD0()
{
  unint64_t result;

  result = qword_100020AF0;
  if (!qword_100020AF0)
  {
    result = swift_getWitnessTable(&unk_100016D94, &type metadata for CenterGuidesSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020AF0);
  }
  return result;
}

uint64_t sub_100012D14@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v4;
  uint64_t result;
  uint64_t v6;

  v4 = sub_10000B074();
  result = _UniqueEntity.id.getter(a1, v4);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_100012D50@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE v5[24];

  if (qword_1000201F0 != -1)
    swift_once(&qword_1000201F0, sub_100012968);
  v2 = type metadata accessor for TypeDisplayRepresentation(0);
  v3 = sub_100004480(v2, (uint64_t)qword_100020F48);
  swift_beginAccess(v3, v5, 0, 0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_100012DE8()
{
  return sub_100004574(&qword_100020AF8, &qword_100020B00, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_100012E14(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000123B4();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100012E50()
{
  unint64_t result;

  result = qword_100020B08;
  if (!qword_100020B08)
  {
    result = swift_getWitnessTable(&unk_100016DC4, &type metadata for CenterGuidesSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020B08);
  }
  return result;
}

uint64_t sub_100012E98(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100012CD0();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for CenterGuidesSettingEntity()
{
  return &type metadata for CenterGuidesSettingEntity;
}

ValueMetadata *type metadata accessor for CenterGuidesSettingEntity.UpdateIntent_value()
{
  return &type metadata for CenterGuidesSettingEntity.UpdateIntent_value;
}

unint64_t sub_100012EF0()
{
  unint64_t result;

  result = qword_100020B10;
  if (!qword_100020B10)
  {
    result = swift_getWitnessTable(&unk_100016B34, &type metadata for CenterGuidesSettingEntity);
    atomic_store(result, (unint64_t *)&qword_100020B10);
  }
  return result;
}

uint64_t sub_100012F34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t, uint64_t);
  char *v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v25;
  void (*v26)(char *);
  unsigned int v27;
  void (*v28)(char *, uint64_t, uint64_t, uint64_t);
  char *v29;
  char *v30;
  char v31;
  uint64_t v32;

  v0 = sub_100004440(&qword_1000202C0);
  __chkstk_darwin(v0);
  v30 = (char *)&v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for InputConnectionBehavior(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v29 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100004440(&qword_1000202C8);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v25 - v9;
  v11 = sub_100004440(&qword_1000202D0);
  __chkstk_darwin(v11);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for LocalizedStringResource(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_100004440(&qword_100020B40);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000017, 0x8000000100018540);
  v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v28(v13, 1, 1, v14);
  v32 = 0;
  v18 = type metadata accessor for IntentDialog(0);
  v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56);
  v19(v10, 1, 1, v18);
  v19(v8, 1, 1, v18);
  v27 = enum case for InputConnectionBehavior.default(_:);
  v26 = *(void (**)(char *))(v3 + 104);
  v20 = v29;
  v26(v29);
  v21 = sub_1000123B4();
  v25 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v17, v13, &v32, v10, v8, v20, v21);
  sub_100004440(&qword_1000202E0);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000028, 0x8000000100018560);
  v28(v13, 1, 1, v14);
  v31 = 2;
  v22 = type metadata accessor for Bool.IntentDisplayName(0);
  v23 = v30;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v30, 1, 1, v22);
  v19(v10, 1, 1, v18);
  ((void (*)(char *, _QWORD, uint64_t))v26)(v20, v27, v2);
  IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)(v17, v13, &v31, v23, v10, v20);
  return v25;
}

uint64_t sub_100013258@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = v2;
  return swift_retain(v2);
}

ValueMetadata *type metadata accessor for SnapToGridToggleControl()
{
  return &type metadata for SnapToGridToggleControl;
}

uint64_t sub_100013274(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001A5C8, 1);
}

uint64_t sub_100013284@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t KeyPath;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t OpaqueTypeConformance2;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;

  v44 = a1;
  v1 = sub_100004440(&qword_100020348);
  v37 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v3 = (char *)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100004440(&qword_100020350);
  v39 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100004440(&qword_100020358);
  v8 = *(_QWORD *)(v7 - 8);
  v40 = v7;
  v41 = v8;
  __chkstk_darwin(v7);
  v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100004440(&qword_100020360);
  v12 = *(_QWORD *)(v11 - 8);
  v42 = v11;
  v43 = v12;
  __chkstk_darwin(v11);
  v38 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(&unk_100016EA8);
  v15 = sub_1000044D8();
  ControlToggle.init<A, B, C, D, E, F, G>(kind:intentUpdatableProperty:title:subtitle:value:)(0xD000000000000023, 0x8000000100018600, KeyPath, sub_1000135E8, 0, sub_1000049E4, 0, sub_100004FF0, 0, &type metadata for Text, &type metadata for Text, &type metadata for Text, v15, &protocol witness table for Text, &protocol witness table for Text, &protocol witness table for Text);
  v16 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000010, 0x8000000100018630);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = sub_100004B38();
  WidgetConfiguration.configurationDisplayName(_:)(v16, v18, v20 & 1, v22, v1, v23);
  swift_bridgeObjectRelease(v22);
  swift_bridgeObjectRelease(v18);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v3, v1);
  v24 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000021, 0x8000000100018650);
  v26 = v25;
  LOBYTE(v3) = v27;
  v29 = v28;
  v45 = v1;
  v46 = v23;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v45, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  WidgetConfiguration.description(_:)(v24, v26, v3 & 1, v29, v4, OpaqueTypeConformance2);
  swift_bridgeObjectRelease(v29);
  swift_bridgeObjectRelease(v26);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v6, v4);
  v45 = v4;
  v46 = OpaqueTypeConformance2;
  v31 = swift_getOpaqueTypeConformance2(&v45, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description(_:)>>, 1);
  v32 = v38;
  v33 = v40;
  WidgetConfiguration.disablesControlStateCaching()(v40, v31);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v10, v33);
  v45 = v33;
  v46 = v31;
  v34 = swift_getOpaqueTypeConformance2(&v45, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v35 = v42;
  WidgetConfiguration.hiddenControl()(v42, v34);
  return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v32, v35);
}

uint64_t sub_1000135E8@<X0>(uint64_t a1@<X8>)
{
  return sub_100004A00(0x206F742070616E53, 0xEC00000064697247, a1);
}

unint64_t sub_100013614()
{
  unint64_t result;

  result = qword_100020B60;
  if (!qword_100020B60)
  {
    result = swift_getWitnessTable(&unk_100016FA0, &type metadata for OpenFreeformSettingsIntent);
    atomic_store(result, (unint64_t *)&qword_100020B60);
  }
  return result;
}

uint64_t sub_10001365C()
{
  uint64_t v1;

  IntentParameter.wrappedValue.getter(&v1);
  return v1;
}

uint64_t sub_10001368C()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t sub_1000136AC()
{
  uint64_t v0;

  v0 = type metadata accessor for LocalizedStringResource(0);
  sub_100004498(v0, qword_100020F60);
  sub_100004480(v0, (uint64_t)qword_100020F60);
  return LocalizedStringResource.init(stringLiteral:)(0xD000000000000015, 0x80000001000186A0);
}

_QWORD *sub_10001370C@<X0>(_BYTE *a1@<X8>)
{
  _QWORD *result;
  uint64_t v3;

  result = IntentParameter.wrappedValue.getter(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_100013744(char *a1)
{
  char v2;

  v2 = *a1;
  return IntentParameter.wrappedValue.setter(&v2);
}

void (*sub_100013778(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_100002FA8;
}

unint64_t sub_1000137C8()
{
  unint64_t result;

  result = qword_100020B68;
  if (!qword_100020B68)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Never, &type metadata for Never);
    atomic_store(result, (unint64_t *)&qword_100020B68);
  }
  return result;
}

uint64_t sub_10001380C(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;

  v4 = sub_100013ED4();
  v5 = sub_100007C98();
  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_100013860()
{
  uint64_t v0;

  v0 = qword_100020B50;
  swift_bridgeObjectRetain(off_100020B58);
  return v0;
}

unint64_t sub_100013898()
{
  unint64_t result;

  result = qword_100020B70;
  if (!qword_100020B70)
  {
    result = swift_getWitnessTable(&unk_100017058, &type metadata for OpenFreeformSettingsIntent);
    atomic_store(result, (unint64_t *)&qword_100020B70);
  }
  return result;
}

unint64_t sub_1000138E0()
{
  unint64_t result;

  result = qword_100020B78;
  if (!qword_100020B78)
  {
    result = swift_getWitnessTable(&unk_100017080, &type metadata for OpenFreeformSettingsIntent);
    atomic_store(result, (unint64_t *)&qword_100020B78);
  }
  return result;
}

uint64_t sub_100013924(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001A60C, 1);
}

uint64_t sub_100013934@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1000201F8 != -1)
    swift_once(&qword_1000201F8, sub_1000136AC);
  v2 = type metadata accessor for LocalizedStringResource(0);
  v3 = sub_100004480(v2, (uint64_t)qword_100020F60);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_1000139A4()
{
  return 0;
}

uint64_t sub_1000139AC()
{
  return 1;
}

uint64_t sub_1000139B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  Swift::String v10;
  uint64_t KeyPath;
  uint64_t v12;
  Swift::String v13;
  uint64_t v15;

  v4 = sub_100004440(&qword_100020BB0);
  __chkstk_darwin(v4);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100004440(&qword_100020BB8);
  __chkstk_darwin(v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  ParameterSummaryString.StringInterpolation.init(literalCapacity:interpolationCount:)(5, 1, a1, a2);
  v10._countAndFlagsBits = 0x206E65704FLL;
  v10._object = (void *)0xE500000000000000;
  ParameterSummaryString.StringInterpolation.appendLiteral(_:)(v10);
  KeyPath = swift_getKeyPath(&unk_1000170C0);
  v12 = sub_100004440(&qword_100020BC0);
  ParameterSummaryString.StringInterpolation.appendInterpolation<A, B>(_:)(KeyPath, v7, v12);
  swift_release(KeyPath);
  v13._countAndFlagsBits = 0;
  v13._object = (void *)0xE000000000000000;
  ParameterSummaryString.StringInterpolation.appendLiteral(_:)(v13);
  ParameterSummaryString.init(stringInterpolation:)(v9, a1, a2);
  return IntentParameterSummary.init(_:table:)(v6, 0, 0, a1, a2);
}

uint64_t sub_100013B10(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to _URLRepresentableIntent<>.perform()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_100013ED4();
  v7 = sub_100013F18();
  v8 = sub_100007C98();
  *v5 = v2;
  v5[1] = sub_100013B9C;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_100013B9C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = *(_QWORD *)(*v1 + 16);
  v3 = *v1;
  result = swift_task_dealloc(v2);
  if (v0)
    return (*(uint64_t (**)(void))(v3 + 8))();
  return result;
}

uint64_t sub_100013BF8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_100013CA4();
  *a1 = result;
  return result;
}

uint64_t sub_100013C1C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000117B0();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenFreeformSettingsIntent()
{
  return &type metadata for OpenFreeformSettingsIntent;
}

unint64_t sub_100013C58()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100020B88;
  if (!qword_100020B88)
  {
    v1 = sub_10000294C(&qword_100020B90);
    result = swift_getWitnessTable(&protocol conformance descriptor for IntentParameterSummary<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100020B88);
  }
  return result;
}

uint64_t sub_100013CA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  void (*v18)(_BYTE *, uint64_t, uint64_t, uint64_t);
  unint64_t v19;
  _BYTE v21[15];
  char v22;

  v0 = type metadata accessor for InputConnectionBehavior(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = &v21[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = sub_100004440(&qword_1000202C8);
  v5 = __chkstk_darwin(v4);
  v7 = &v21[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v5);
  v9 = &v21[-v8];
  v10 = sub_100004440(&qword_1000202D0);
  __chkstk_darwin(v10);
  v12 = &v21[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = type metadata accessor for LocalizedStringResource(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = &v21[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100004440(&qword_100020B98);
  LocalizedStringResource.init(stringLiteral:)(0x676E6974746553, 0xE700000000000000);
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000001CLL, 0x8000000100018680);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
  v22 = 7;
  v17 = type metadata accessor for IntentDialog(0);
  v18 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56);
  v18(v9, 1, 1, v17);
  v18(v7, 1, 1, v17);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for InputConnectionBehavior.default(_:), v0);
  v19 = sub_100007534();
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)(v16, v12, &v22, v9, v7, v3, &off_10001C848, v19);
}

unint64_t sub_100013ED4()
{
  unint64_t result;

  result = qword_100020BA0;
  if (!qword_100020BA0)
  {
    result = swift_getWitnessTable(&unk_100016ED0, &type metadata for OpenFreeformSettingsIntent);
    atomic_store(result, (unint64_t *)&qword_100020BA0);
  }
  return result;
}

unint64_t sub_100013F18()
{
  unint64_t result;

  result = qword_100020BA8;
  if (!qword_100020BA8)
  {
    result = swift_getWitnessTable(&unk_100016F20, &type metadata for OpenFreeformSettingsIntent);
    atomic_store(result, (unint64_t *)&qword_100020BA8);
  }
  return result;
}

uint64_t sub_100013F5C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = IntentParameter.projectedValue.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100013F84()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC26FreeformWidgetKitExtensionP33_9249C35B5CECD8B3273980A960471AF419ResourceBundleClass);
}
