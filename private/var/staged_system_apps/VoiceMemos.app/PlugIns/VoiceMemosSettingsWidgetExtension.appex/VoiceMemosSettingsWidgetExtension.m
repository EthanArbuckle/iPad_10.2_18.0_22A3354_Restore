unint64_t sub_100002428()
{
  unint64_t result;

  result = qword_10001C2E8;
  if (!qword_10001C2E8)
  {
    result = swift_getWitnessTable(&unk_100011F00, &type metadata for LocationBasedNamingEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10001C2E8);
  }
  return result;
}

uint64_t sub_10000246C()
{
  return sub_100005564(&qword_10001C2F0, &qword_10001C2F8, (uint64_t)&protocol conformance descriptor for _IntentUpdatableEntityProperty<A, B, C>);
}

uint64_t sub_100002498(uint64_t *a1)
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

uint64_t sub_1000024DC()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v0 = sub_100004E7C(&qword_10001C488);
  __chkstk_darwin(v0);
  v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for LocalizedStringResource(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_100005510(v7, qword_10001CD00);
  sub_1000054F8(v7, (uint64_t)qword_10001CD00);
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000001DLL, 0x8000000100011070);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v6, v2);
}

uint64_t sub_1000025EC()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;

  sub_100004E7C(&qword_10001C4B8);
  ((void (*)(void))__chkstk_darwin)();
  v1 = (char *)&v13 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004E7C(&qword_10001C488);
  ((void (*)(void))__chkstk_darwin)();
  v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for LocalizedStringResource(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v13 - v9;
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000001DLL, 0x8000000100011070);
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000001ELL, 0x8000000100011090);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
  DisplayRepresentation.Image.init(appBundleIdentifier:)(0xD000000000000014, 0x80000001000110B0);
  v11 = type metadata accessor for DisplayRepresentation.Image(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v1, 0, 1, v11);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000026, 0x80000001000110D0);
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v10, v3, v1, &_swiftEmptyArrayStorage, v8);
}

uint64_t sub_1000027C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v0 = sub_100004E7C(&qword_10001C4C0);
  sub_100005510(v0, qword_10001CD18);
  sub_1000054F8(v0, (uint64_t)qword_10001CD18);
  if (qword_10001C210 != -1)
    swift_once(&qword_10001C210, sub_1000094E8);
  v1 = qword_10001CE58;
  v2 = qword_10001CE60;
  v3 = sub_10000398C();
  swift_bridgeObjectRetain(v2);
  return _EntityURLRepresentation.init(_:)(v1, v2, &type metadata for LocationBasedNamingEntity, v3);
}

uint64_t sub_100002878(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_100002890, 0, 0);
}

uint64_t sub_100002890()
{
  uint64_t v0;
  id v1;
  NSString v2;
  id v3;
  unsigned __int8 v4;

  v1 = objc_allocWithZone((Class)NSUserDefaults);
  v2 = String._bridgeToObjectiveC()();
  v3 = objc_msgSend(v1, "initWithSuiteName:", v2);

  if (v3)
  {
    v4 = objc_msgSend(v3, "rc_useLocationBasedNaming");

  }
  else
  {
    v4 = 0;
  }
  **(_BYTE **)(v0 + 16) = v4;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100002934(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + 16) = *a2;
  return swift_task_switch(sub_100002950, 0, 0);
}

uint64_t sub_100002950()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  NSString v3;
  id v4;

  v1 = *(unsigned __int8 *)(v0 + 16);
  v2 = objc_allocWithZone((Class)NSUserDefaults);
  v3 = String._bridgeToObjectiveC()();
  v4 = objc_msgSend(v2, "initWithSuiteName:", v3);

  objc_msgSend(v4, "rc_setUseLocationBasedNaming:", v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000029F0(uint64_t a1)
{
  return sub_100004258(a1, qword_10001CD30, 0xD00000000000003ALL, 0x8000000100011180);
}

uint64_t sub_100002A14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_100004E7C(&qword_10001C520);
  sub_100005510(v0, qword_10001CD48);
  v1 = sub_1000054F8(v0, (uint64_t)qword_10001CD48);
  IntentDescription.init(stringLiteral:)(0xD000000000000028, 0x8000000100011150);
  v2 = type metadata accessor for IntentDescription(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 0, 1, v2);
}

uint64_t sub_100002A9C()
{
  uint64_t result;

  result = swift_getKeyPath(&unk_1000126A0);
  qword_10001CD60 = result;
  return result;
}

uint64_t sub_100002AC0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_100002ACC()
{
  uint64_t v1;

  IntentParameter.wrappedValue.getter(&v1);
  return v1;
}

uint64_t sub_100002AFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  v4 = sub_100004E7C(&qword_10001C4F0);
  v3[9] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100004E7C(&qword_10001C4F8);
  v3[10] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100004E7C(&qword_10001C500);
  v3[11] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v6 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for IntentDialog(0);
  v3[12] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v3[13] = v8;
  v3[14] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100004E7C(&qword_10001C508);
  v3[15] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v3[16] = v10;
  v11 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3[17] = swift_task_alloc(v11);
  v3[18] = swift_task_alloc(v11);
  return swift_task_switch(sub_100002C08, 0, 0);
}

uint64_t sub_100002C08()
{
  _QWORD *v0;
  _QWORD *v1;
  unint64_t v2;

  IntentParameter.wrappedValue.getter(v0 + 2);
  v1 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to IntentDialog._CapturedContent.init<>(entity:_:)
                                  + 1));
  v0[19] = v1;
  v2 = sub_10000398C();
  *v1 = v0;
  v1[1] = sub_100002C88;
  return IntentDialog._CapturedContent.init<>(entity:_:)(v0[18], v0 + 2, sub_1000030A4, 0, &type metadata for LocationBasedNamingEntity, v2);
}

uint64_t sub_100002C88()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 152));
  return swift_task_switch(sub_100002CDC, 0, 0);
}

uint64_t sub_100002CDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 24));
  v1 = *(_QWORD *)(v0 + 24);
  *(_QWORD *)(v0 + 32) = v1;
  *(_QWORD *)(v0 + 160) = v1;
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 192));
  *(_BYTE *)(v0 + 193) = *(_BYTE *)(v0 + 192);
  if (qword_10001C190 != -1)
    swift_once(&qword_10001C190, sub_100002A9C);
  v2 = qword_10001CD60;
  *(_QWORD *)(v0 + 168) = qword_10001CD60;
  v3 = async function pointer to AppEntity._setValue<A, B, C>(_:for:)[1];
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  *(_QWORD *)(v0 + 176) = v4;
  v5 = sub_100005564(&qword_10001C4D8, &qword_10001C4E0, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *v4 = v0;
  v4[1] = sub_100002DD8;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v5);
}

uint64_t sub_100002DD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 168);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 176);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 160);
  *(_QWORD *)(*(_QWORD *)v1 + 184) = v0;
  swift_task_dealloc(v2);
  swift_release(v3);
  swift_release(v4);
  if (v0)
    v5 = sub_100003018;
  else
    v5 = sub_100002E58;
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_100002E58()
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
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 128);
  v13 = *(_QWORD *)(v0 + 120);
  v4 = *(_QWORD *)(v0 + 112);
  v5 = *(_QWORD *)(v0 + 88);
  v14 = *(_QWORD *)(v0 + 104);
  v15 = *(_QWORD *)(v0 + 96);
  v6 = *(_QWORD *)(v0 + 72);
  v7 = *(_QWORD *)(v0 + 80);
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 40));
  v8 = type metadata accessor for _GeneratedContentOptions(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = type metadata accessor for _GeneratedContentFallback(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = sub_100002428();
  v11 = sub_100003B48();
  IntentDialog._GeneratedDialogContent.init(fromResult:options:fallbackDialog:)(sub_1000030A4, 0, v7, v6, &type metadata for LocationBasedNamingEntity.UpdateIntent_value);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v13);
  IntentDialog.init<A, B>(from:capturedContent:)(v5, v1, &type metadata for LocationBasedNamingEntity.UpdateIntent_value, &type metadata for LocationBasedNamingEntity, v10, v11);
  static IntentResult.result<A>(value:dialog:)(v0 + 40, v4, &type metadata for LocationBasedNamingEntity, v11);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v4, v15);
  swift_release(*(_QWORD *)(v0 + 40));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v13);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v7);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100003018()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 112);
  v5 = *(_QWORD *)(v0 + 80);
  v4 = *(_QWORD *)(v0 + 88);
  v6 = *(_QWORD *)(v0 + 72);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 128) + 8))(v2, *(_QWORD *)(v0 + 120));
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000030A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v0 = sub_100004E7C(&qword_10001C510);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10001C190 != -1)
    swift_once(&qword_10001C190, sub_100002A9C);
  v4 = qword_10001CD60;
  v5 = swift_retain(qword_10001CD60);
  static _DialogBuilderEntity.buildExpression<A, B>(_:)(v5);
  swift_release(v4);
  v6 = sub_100003B48();
  v7 = sub_100005564(&qword_10001C518, &qword_10001C510, (uint64_t)&protocol conformance descriptor for _NLGRepresentationEntity<A>);
  static _DialogBuilderEntity.buildBlock<A>(_:)(v3, &type metadata for LocationBasedNamingEntity, v0, v6, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

_QWORD *sub_1000031B0@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;
  uint64_t v3;

  result = IntentParameter.wrappedValue.getter(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_1000031E8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;

  v1 = *a1;
  v3 = v1;
  swift_retain(v1);
  IntentParameter.wrappedValue.setter(&v3);
  return swift_release(v1);
}

uint64_t (*sub_10000322C(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_100003274;
}

_QWORD *sub_100003278@<X0>(_BYTE *a1@<X8>)
{
  _QWORD *result;
  uint64_t v3;

  result = IntentParameter.wrappedValue.getter(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_1000032B0(char *a1)
{
  char v2;

  v2 = *a1;
  return IntentParameter.wrappedValue.setter(&v2);
}

uint64_t (*sub_1000032E4(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_100003274;
}

uint64_t sub_10000332C()
{
  if (qword_10001C190 != -1)
    swift_once(&qword_10001C190, sub_100002A9C);
  return swift_retain(qword_10001CD60);
}

unint64_t sub_10000337C()
{
  unint64_t result;

  result = qword_10001C300;
  if (!qword_10001C300)
  {
    result = swift_getWitnessTable(&unk_100011F90, &type metadata for LocationBasedNamingEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10001C300);
  }
  return result;
}

unint64_t sub_1000033C4()
{
  unint64_t result;

  result = qword_10001C308;
  if (!qword_10001C308)
  {
    result = swift_getWitnessTable(&unk_100011FB8, &type metadata for LocationBasedNamingEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10001C308);
  }
  return result;
}

uint64_t sub_100003408(uint64_t a1)
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2(a1, &unk_1000162AC, 1) + 8);
}

uint64_t sub_10000342C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100004464(a1, a2, a3, (uint64_t (*)(void))sub_100002428);
}

uint64_t sub_100003438@<X0>(uint64_t a1@<X8>)
{
  return sub_100003484(&qword_10001C180, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10001CD30, (uint64_t)sub_1000029F0, a1);
}

uint64_t sub_100003460@<X0>(uint64_t a1@<X8>)
{
  return sub_100003484(&qword_10001C230, (uint64_t (*)(_QWORD))&type metadata accessor for IntentAuthenticationPolicy, (uint64_t)qword_10001CE98, (uint64_t)sub_10000A3D8, a1);
}

uint64_t sub_100003484@<X0>(_QWORD *a1@<X2>, uint64_t (*a2)(_QWORD)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;

  if (*a1 != -1)
    swift_once(a1, a4);
  v8 = a2(0);
  v9 = sub_1000054F8(v8, a3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a5, v9, v8);
}

uint64_t sub_1000034FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10001C188 != -1)
    swift_once(&qword_10001C188, sub_100002A14);
  v2 = sub_100004E7C(&qword_10001C520);
  v3 = sub_1000054F8(v2, (uint64_t)qword_10001CD48);
  return sub_1000055A4(v3, a1);
}

uint64_t sub_10000355C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *v1;
  v4 = v1[1];
  v6 = (_QWORD *)swift_task_alloc(dword_10001C4EC);
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_1000055EC;
  return sub_100002AFC(a1, v5, v4);
}

uint64_t sub_1000035C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_100004EBC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_1000035E4()
{
  return 0xD00000000000002ALL;
}

unint64_t sub_100003604()
{
  unint64_t result;

  result = qword_10001C318;
  if (!qword_10001C318)
  {
    result = swift_getWitnessTable(&unk_100012014, &type metadata for LocationBasedNamingEntity.LocationBasedNamingEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10001C318);
  }
  return result;
}

unint64_t sub_10000364C()
{
  unint64_t result;

  result = qword_10001C320;
  if (!qword_10001C320)
  {
    result = swift_getWitnessTable(&unk_1000121A0, &type metadata for LocationBasedNamingEntity);
    atomic_store(result, (unint64_t *)&qword_10001C320);
  }
  return result;
}

uint64_t sub_100003690()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v0 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v0);
  v2 = (char *)&v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004E7C(&qword_10001C2F8);
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000001BLL, 0x8000000100011100);
  v3 = sub_100005564(&qword_10001C4D8, &qword_10001C4E0, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  result = _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)(v2, &unk_10001C4C8, 0, &unk_10001C4D0, 0, &type metadata for LocationBasedNamingEntity.UpdateIntent_value, v3);
  qword_10001CD68 = result;
  return result;
}

uint64_t sub_100003760(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_100003778, 0, 0);
}

uint64_t sub_100003778()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v3)(void);

  if (qword_10001C198 != -1)
    swift_once(&qword_10001C198, sub_100003690);
  v1 = qword_10001CD68;
  **(_QWORD **)(v0 + 16) = qword_10001CD68;
  v3 = *(uint64_t (**)(void))(v0 + 8);
  swift_retain(v1);
  return v3();
}

unint64_t sub_1000037EC()
{
  unint64_t result;

  result = qword_10001C330;
  if (!qword_10001C330)
  {
    result = swift_getWitnessTable(&unk_10001204C, &type metadata for LocationBasedNamingEntity.LocationBasedNamingEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10001C330);
  }
  return result;
}

uint64_t sub_100003830(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.allEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_100003E04();
  *v4 = v2;
  v4[1] = sub_100003898;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

uint64_t sub_100003898(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 24);
  v6 = *v2;
  swift_task_dealloc(v5);
  if (!v1)
    **(_QWORD **)(v4 + 16) = a1;
  return (*(uint64_t (**)(void))(v6 + 8))();
}

unint64_t sub_1000038FC()
{
  unint64_t result;

  result = qword_10001C340;
  if (!qword_10001C340)
  {
    result = swift_getWitnessTable(&unk_1000120A4, &type metadata for LocationBasedNamingEntity.LocationBasedNamingEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10001C340);
  }
  return result;
}

unint64_t sub_100003944()
{
  unint64_t result;

  result = qword_10001C348;
  if (!qword_10001C348)
  {
    result = swift_getWitnessTable(&unk_100012104, &type metadata for LocationBasedNamingEntity.LocationBasedNamingEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10001C348);
  }
  return result;
}

unint64_t sub_10000398C()
{
  unint64_t result;

  result = qword_10001C350[0];
  if (!qword_10001C350[0])
  {
    result = swift_getWitnessTable(&unk_100012148, &type metadata for LocationBasedNamingEntity);
    atomic_store(result, qword_10001C350);
  }
  return result;
}

uint64_t sub_1000039D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.entities(for:)[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_100003E04();
  *v5 = v2;
  v5[1] = sub_100003A40;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_100003A40(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(*v2 + 16);
  v5 = *v2;
  v6 = swift_task_dealloc(v4);
  if (!v1)
    v6 = a1;
  return (*(uint64_t (**)(uint64_t))(v5 + 8))(v6);
}

uint64_t sub_100003A94(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.suggestedEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_100003E04();
  *v4 = v2;
  v4[1] = sub_1000055F0;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100003B00()
{
  unint64_t result;

  result = qword_10001C368;
  if (!qword_10001C368)
  {
    result = swift_getWitnessTable(&unk_10001212C, &type metadata for LocationBasedNamingEntity.LocationBasedNamingEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10001C368);
  }
  return result;
}

unint64_t sub_100003B48()
{
  unint64_t result;

  result = qword_10001C370;
  if (!qword_10001C370)
  {
    result = swift_getWitnessTable(&unk_100012320, &type metadata for LocationBasedNamingEntity);
    atomic_store(result, (unint64_t *)&qword_10001C370);
  }
  return result;
}

unint64_t sub_100003B90()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001C378;
  if (!qword_10001C378)
  {
    v1 = sub_100002498(qword_10001C380);
    sub_100003B48();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_10001C378);
  }
  return result;
}

uint64_t sub_100003BF4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_1000037EC();
  *v5 = v2;
  v5[1] = sub_100003C60;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100003C60()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100003CA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc(async function pointer to DynamicOptionsProvider.defaultResult()[1]);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_100003C60;
  return DynamicOptionsProvider.defaultResult()(a1, a2, a3);
}

unint64_t sub_100003D20()
{
  unint64_t result;

  result = qword_10001C398;
  if (!qword_10001C398)
  {
    result = swift_getWitnessTable(&unk_100012208, &type metadata for LocationBasedNamingEntity);
    atomic_store(result, (unint64_t *)&qword_10001C398);
  }
  return result;
}

unint64_t sub_100003D68()
{
  unint64_t result;

  result = qword_10001C3A0;
  if (!qword_10001C3A0)
  {
    result = swift_getWitnessTable(&unk_100012240, &type metadata for LocationBasedNamingEntity);
    atomic_store(result, (unint64_t *)&qword_10001C3A0);
  }
  return result;
}

unint64_t sub_100003DB0()
{
  unint64_t result;

  result = qword_10001C3A8;
  if (!qword_10001C3A8)
  {
    result = swift_getWitnessTable(&unk_100012270, &type metadata for LocationBasedNamingEntity);
    atomic_store(result, (unint64_t *)&qword_10001C3A8);
  }
  return result;
}

void *sub_100003DF4()
{
  return &protocol witness table for String;
}

unint64_t sub_100003E04()
{
  unint64_t result;

  result = qword_10001C3B0;
  if (!qword_10001C3B0)
  {
    result = swift_getWitnessTable(&unk_100011FD4, &type metadata for LocationBasedNamingEntity.LocationBasedNamingEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10001C3B0);
  }
  return result;
}

unint64_t sub_100003E4C()
{
  unint64_t result;

  result = qword_10001C3B8;
  if (!qword_10001C3B8)
  {
    result = swift_getWitnessTable(&unk_1000122A8, &type metadata for LocationBasedNamingEntity);
    atomic_store(result, (unint64_t *)&qword_10001C3B8);
  }
  return result;
}

uint64_t sub_100003E90@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10001C178 != -1)
    swift_once(&qword_10001C178, sub_1000027C8);
  v2 = sub_100004E7C(&qword_10001C4C0);
  v3 = sub_1000054F8(v2, (uint64_t)qword_10001CD18);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

unint64_t sub_100003F08()
{
  unint64_t result;

  result = qword_10001C3C0;
  if (!qword_10001C3C0)
  {
    result = swift_getWitnessTable(&unk_1000122D0, &type metadata for LocationBasedNamingEntity);
    atomic_store(result, (unint64_t *)&qword_10001C3C0);
  }
  return result;
}

unint64_t sub_100003F50()
{
  unint64_t result;

  result = qword_10001C3C8;
  if (!qword_10001C3C8)
  {
    result = swift_getWitnessTable(&unk_1000122F8, &type metadata for LocationBasedNamingEntity);
    atomic_store(result, (unint64_t *)&qword_10001C3C8);
  }
  return result;
}

unint64_t sub_100003F98()
{
  unint64_t result;

  result = qword_10001C3D0;
  if (!qword_10001C3D0)
  {
    result = swift_getWitnessTable(&unk_100012378, &type metadata for LocationBasedNamingEntity);
    atomic_store(result, (unint64_t *)&qword_10001C3D0);
  }
  return result;
}

void *sub_100003FDC()
{
  return &protocol witness table for String;
}

uint64_t sub_100003FE8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v4;
  uint64_t result;
  uint64_t v6;

  v4 = sub_10000364C();
  result = _UniqueEntity.id.getter(a1, v4);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_100004024(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_1000054B4();
  v4 = _URLRepresentableEntity.urlRepresentationParameter.getter(a1, v3);
  return sub_100005550(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8), v1, v4, v5);
}

uint64_t sub_10000406C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE v5[24];

  if (qword_10001C170 != -1)
    swift_once(&qword_10001C170, sub_1000024DC);
  v2 = type metadata accessor for TypeDisplayRepresentation(0);
  v3 = sub_1000054F8(v2, (uint64_t)qword_10001CD00);
  swift_beginAccess(v3, v5, 0, 0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_100004104()
{
  return sub_100005564(&qword_10001C3E0, &qword_10001C3E8, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_100004130(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000398C();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000416C()
{
  unint64_t result;

  result = qword_10001C3F0;
  if (!qword_10001C3F0)
  {
    result = swift_getWitnessTable(&unk_1000123A8, &type metadata for LocationBasedNamingEntity);
    atomic_store(result, (unint64_t *)&qword_10001C3F0);
  }
  return result;
}

uint64_t sub_1000041B4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100003F98();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_1000041F0()
{
  unint64_t result;

  result = qword_10001C3F8;
  if (!qword_10001C3F8)
  {
    result = swift_getWitnessTable(&unk_100012460, &type metadata for OpenLocationBasedNamingEntity);
    atomic_store(result, (unint64_t *)&qword_10001C3F8);
  }
  return result;
}

uint64_t sub_100004234(uint64_t a1)
{
  return sub_100004258(a1, qword_10001CD70, 0xD000000000000020, 0x8000000100011040);
}

uint64_t sub_100004258(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  v7 = type metadata accessor for LocalizedStringResource(0);
  sub_100005510(v7, a2);
  sub_1000054F8(v7, (uint64_t)a2);
  return LocalizedStringResource.init(stringLiteral:)(a3, a4);
}

void sub_1000042B4(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

unint64_t sub_1000042E8()
{
  unint64_t result;

  result = qword_10001C400;
  if (!qword_10001C400)
  {
    result = swift_getWitnessTable(&unk_100012488, &type metadata for OpenLocationBasedNamingEntity);
    atomic_store(result, (unint64_t *)&qword_10001C400);
  }
  return result;
}

unint64_t sub_100004330()
{
  unint64_t result;

  result = qword_10001C408;
  if (!qword_10001C408)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Never, &type metadata for Never);
    atomic_store(result, (unint64_t *)&qword_10001C408);
  }
  return result;
}

uint64_t sub_100004374(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;

  v4 = sub_10000542C();
  v5 = sub_1000054B4();
  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_1000043CC()
{
  unint64_t result;

  result = qword_10001C410;
  if (!qword_10001C410)
  {
    result = swift_getWitnessTable(&unk_100012518, &type metadata for OpenLocationBasedNamingEntity);
    atomic_store(result, (unint64_t *)&qword_10001C410);
  }
  return result;
}

unint64_t sub_100004414()
{
  unint64_t result;

  result = qword_10001C418;
  if (!qword_10001C418)
  {
    result = swift_getWitnessTable(&unk_100012540, &type metadata for OpenLocationBasedNamingEntity);
    atomic_store(result, (unint64_t *)&qword_10001C418);
  }
  return result;
}

uint64_t sub_100004458(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100004464(a1, a2, a3, (uint64_t (*)(void))sub_1000042E8);
}

uint64_t sub_100004464(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  _QWORD v5[2];

  v5[0] = a2;
  v5[1] = a4();
  return swift_getOpaqueTypeConformance2(v5, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

uint64_t sub_1000044A4@<X0>(uint64_t a1@<X8>)
{
  return sub_100003484(&qword_10001C1A0, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10001CD70, (uint64_t)sub_100004234, a1);
}

uint64_t sub_1000044C8()
{
  return 0;
}

uint64_t sub_1000044D4()
{
  return 1;
}

uint64_t sub_1000044E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to _URLRepresentableIntent<>.perform()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_10000542C();
  v7 = sub_100005470();
  v8 = sub_1000054B4();
  *v5 = v2;
  v5[1] = sub_10000456C;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_10000456C()
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

uint64_t sub_1000045C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_100005224();
  *a1 = result;
  return result;
}

uint64_t sub_1000045EC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000042E8();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_100004614()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t result;
  _QWORD v6[2];

  v0 = sub_100004E7C(&qword_10001C440);
  v1 = *(_QWORD *)(type metadata accessor for _AssistantIntent(0) - 8);
  v2 = swift_allocObject(v0, ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))+ *(_QWORD *)(v1 + 72), *(unsigned __int8 *)(v1 + 80) | 7);
  *(_OWORD *)(v2 + 16) = xmmword_100011E20;
  v6[0] = sub_100004EBC();
  v6[1] = v3;
  v4 = sub_100002428();
  result = _AssistantIntent.init<A>(_:phrases:parameterValues:)(v6, sub_1000046C8, 0, sub_1000049EC, 0, &type metadata for LocationBasedNamingEntity.UpdateIntent_value, v4);
  qword_10001CD88 = v2;
  return result;
}

uint64_t sub_1000046C8(uint64_t a1)
{
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
  unint64_t v11;
  uint64_t v12;
  Swift::String v13;
  void (*v14)(char *, uint64_t);
  Swift::String v15;
  uint64_t v16;
  uint64_t v17;
  Swift::String v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;

  v24 = a1;
  v1 = sub_100004E7C(&qword_10001C460);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100004E7C(&qword_10001C468);
  __chkstk_darwin(v5);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100002428();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(27, 1, &type metadata for LocationBasedNamingEntity.UpdateIntent_value, v8);
  v9._countAndFlagsBits = 0x206E727554;
  v9._object = (void *)0xE500000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v9);
  KeyPath = swift_getKeyPath("ȸ");
  v11 = sub_1000051E0();
  v12 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v11);
  swift_release(KeyPath);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v12, v5);
  swift_release(v12);
  v13._countAndFlagsBits = 0xD000000000000016;
  v13._object = (void *)0x8000000100010F50;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v13);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v7, &type metadata for LocationBasedNamingEntity.UpdateIntent_value, v8);
  v25 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v4, &type metadata for LocationBasedNamingEntity.UpdateIntent_value, v8);
  v14 = *(void (**)(char *, uint64_t))(v2 + 8);
  v14(v4, v1);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(22, 1, &type metadata for LocationBasedNamingEntity.UpdateIntent_value, v8);
  v15._countAndFlagsBits = 0;
  v15._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v15);
  v16 = swift_getKeyPath("ȸ");
  v17 = _AssistantIntent.IntentProjection.subscript.getter(v16, v11);
  swift_release(v16);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v17, v5);
  swift_release(v17);
  v18._countAndFlagsBits = 0xD000000000000016;
  v18._object = (void *)0x8000000100010F50;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v18);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v7, &type metadata for LocationBasedNamingEntity.UpdateIntent_value, v8);
  v19 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v4, &type metadata for LocationBasedNamingEntity.UpdateIntent_value, v8);
  v14(v4, v1);
  v20 = sub_100004E7C(&qword_10001C470);
  v21 = swift_allocObject(v20, 48, 7);
  *(_OWORD *)(v21 + 16) = xmmword_100011E30;
  *(_QWORD *)(v21 + 32) = v25;
  *(_QWORD *)(v21 + 40) = v19;
  v22 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)(v21);
  swift_bridgeObjectRelease(v21);
  return v22;
}

_QWORD *sub_100004980@<X0>(_BYTE *a1@<X8>)
{
  _QWORD *result;
  uint64_t v3;

  result = IntentParameter.wrappedValue.getter(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_1000049B8(char *a1)
{
  char v2;

  v2 = *a1;
  return IntentParameter.wrappedValue.setter(&v2);
}

uint64_t sub_1000049EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t KeyPath;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v0 = type metadata accessor for _AssistantIntent.Value(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath("ȸ");
  v5 = sub_1000051E0();
  v6 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v5);
  swift_release(KeyPath);
  v7 = sub_100002428();
  _AssistantIntent.Value.init<A>(for:builder:)(v6, sub_100004AFC, 0, v7);
  v8 = static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)(v3);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v9 = sub_100004E7C(&qword_10001C450);
  v10 = swift_allocObject(v9, 40, 7);
  *(_OWORD *)(v10 + 16) = xmmword_100011E20;
  *(_QWORD *)(v10 + 32) = v8;
  v11 = static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v10);
  return v11;
}

uint64_t sub_100004AFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(6710863, 0xE300000000000000);
  v1 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x656C6261736944, 0xE700000000000000);
  v2 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(28239, 0xE200000000000000);
  v3 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x656C62616E45, 0xE600000000000000);
  v4 = sub_100004E7C(&qword_10001C458);
  v5 = swift_allocObject(v4, 64, 7);
  *(_OWORD *)(v5 + 16) = xmmword_100011E40;
  *(_QWORD *)(v5 + 32) = v0;
  *(_QWORD *)(v5 + 40) = v1;
  *(_QWORD *)(v5 + 48) = v2;
  *(_QWORD *)(v5 + 56) = v3;
  v6 = static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v5);
  return v6;
}

void sub_100004BC0()
{
  qword_10001CD90 = (uint64_t)&_swiftEmptyArrayStorage;
}

uint64_t sub_100004BD4(uint64_t a1, uint64_t a2)
{
  return sub_100004C10(a1, a2, &qword_10001C1A8, &qword_10001CD88, (uint64_t)sub_100004614);
}

uint64_t sub_100004BF4(uint64_t a1, uint64_t a2)
{
  return sub_100004C10(a1, a2, &qword_10001C1B0, &qword_10001CD90, (uint64_t)sub_100004BC0);
}

uint64_t sub_100004C10(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, uint64_t a5)
{
  if (*a3 != -1)
    swift_once(a3, a5);
  return swift_bridgeObjectRetain(*a4);
}

ValueMetadata *type metadata accessor for LocationBasedNamingAssistantIntents()
{
  return &type metadata for LocationBasedNamingAssistantIntents;
}

ValueMetadata *type metadata accessor for OpenLocationBasedNamingEntity()
{
  return &type metadata for OpenLocationBasedNamingEntity;
}

ValueMetadata *type metadata accessor for LocationBasedNamingEntity.LocationBasedNamingEntityQuery()
{
  return &type metadata for LocationBasedNamingEntity.LocationBasedNamingEntityQuery;
}

ValueMetadata *type metadata accessor for LocationBasedNamingEntity()
{
  return &type metadata for LocationBasedNamingEntity;
}

uint64_t destroy for LocationBasedNamingEntity.UpdateIntent_value(_QWORD *a1)
{
  swift_release(*a1);
  return swift_release(a1[1]);
}

uint64_t *_s33VoiceMemosSettingsWidgetExtension25LocationBasedNamingEntityV18UpdateIntent_valueVwCP_0(uint64_t *a1, uint64_t *a2)
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

uint64_t *assignWithCopy for LocationBasedNamingEntity.UpdateIntent_value(uint64_t *a1, uint64_t *a2)
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

__n128 initializeWithTake for LocationBasedNamingEntity.UpdateIntent_value(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for LocationBasedNamingEntity.UpdateIntent_value(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;

  swift_release(*a1);
  v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  swift_release(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for LocationBasedNamingEntity.UpdateIntent_value(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for LocationBasedNamingEntity.UpdateIntent_value(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for LocationBasedNamingEntity.UpdateIntent_value()
{
  return &type metadata for LocationBasedNamingEntity.UpdateIntent_value;
}

uint64_t sub_100004E24()
{
  return sub_100005564(&qword_10001C428, &qword_10001C430, (uint64_t)&protocol conformance descriptor for <> IntentResultContainer<A, B, C, D>);
}

uint64_t sub_100004E50()
{
  return sub_100005564(&qword_10001C438, &qword_10001C430, (uint64_t)&protocol conformance descriptor for IntentResultContainer<A, B, C, D>);
}

uint64_t sub_100004E7C(uint64_t *a1)
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

uint64_t sub_100004EBC()
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

  v0 = sub_100004E7C(&qword_10001C478);
  __chkstk_darwin(v0);
  v30 = (char *)&v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for InputConnectionBehavior(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v29 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100004E7C(&qword_10001C480);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v25 - v9;
  v11 = sub_100004E7C(&qword_10001C488);
  __chkstk_darwin(v11);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for LocalizedStringResource(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_100004E7C(&qword_10001C490);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000044, 0x8000000100010F70);
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
  v21 = sub_10000398C();
  v25 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v17, v13, &v32, v10, v8, v20, v21);
  sub_100004E7C(&qword_10001C498);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000046, 0x8000000100010FC0);
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

unint64_t sub_1000051E0()
{
  unint64_t result;

  result = qword_10001C448;
  if (!qword_10001C448)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Bool, &type metadata for Bool);
    atomic_store(result, (unint64_t *)&qword_10001C448);
  }
  return result;
}

uint64_t sub_100005224()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  void (*v18)(char *, uint64_t, uint64_t, uint64_t);
  unint64_t v19;
  uint64_t v21;
  uint64_t v22;

  v0 = type metadata accessor for InputConnectionBehavior(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100004E7C(&qword_10001C480);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v21 - v8;
  v10 = sub_100004E7C(&qword_10001C488);
  __chkstk_darwin(v10);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for LocalizedStringResource(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004E7C(&qword_10001C490);
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000002FLL, 0x8000000100011010);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
  v22 = 0;
  v17 = type metadata accessor for IntentDialog(0);
  v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56);
  v18(v9, 1, 1, v17);
  v18(v7, 1, 1, v17);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for InputConnectionBehavior.default(_:), v0);
  v19 = sub_10000398C();
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v16, v12, &v22, v9, v7, v3, v19);
}

unint64_t sub_10000542C()
{
  unint64_t result;

  result = qword_10001C4A0;
  if (!qword_10001C4A0)
  {
    result = swift_getWitnessTable(&unk_1000123D0, &type metadata for OpenLocationBasedNamingEntity);
    atomic_store(result, (unint64_t *)&qword_10001C4A0);
  }
  return result;
}

unint64_t sub_100005470()
{
  unint64_t result;

  result = qword_10001C4A8;
  if (!qword_10001C4A8)
  {
    result = swift_getWitnessTable(&unk_100012420, &type metadata for OpenLocationBasedNamingEntity);
    atomic_store(result, (unint64_t *)&qword_10001C4A8);
  }
  return result;
}

unint64_t sub_1000054B4()
{
  unint64_t result;

  result = qword_10001C4B0;
  if (!qword_10001C4B0)
  {
    result = swift_getWitnessTable(&unk_1000121D0, &type metadata for LocationBasedNamingEntity);
    atomic_store(result, (unint64_t *)&qword_10001C4B0);
  }
  return result;
}

uint64_t sub_1000054F8(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *sub_100005510(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100005550(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_100005564(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100002498(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000055A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100004E7C(&qword_10001C520);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1000055F8()
{
  unint64_t result;

  result = qword_10001C528;
  if (!qword_10001C528)
  {
    result = swift_getWitnessTable(&unk_1000127AC, &type metadata for ClearDeletedEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10001C528);
  }
  return result;
}

uint64_t sub_10000563C()
{
  return sub_100005564(&qword_10001C530, &qword_10001C538, (uint64_t)&protocol conformance descriptor for _IntentUpdatableEntityProperty<A, B, C>);
}

uint64_t sub_100005668(uint64_t a1)
{
  return sub_1000069EC(a1, qword_10001CD98, 0xD000000000000015, 0x8000000100011290);
}

uint64_t sub_10000568C()
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
  uint64_t v15;

  v0 = sub_100004E7C(&qword_10001C4B8);
  __chkstk_darwin(v0);
  v2 = (char *)&v15 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_100004E7C(&qword_10001C488);
  __chkstk_darwin(v3);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for LocalizedStringResource(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v15 - v11;
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000015, 0x8000000100011290);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000016, 0x80000001000112B0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  DisplayRepresentation.Image.init(appBundleIdentifier:)(0xD000000000000014, 0x80000001000110B0);
  v13 = type metadata accessor for DisplayRepresentation.Image(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v2, 0, 1, v13);
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000001ELL, 0x80000001000112D0);
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v12, v5, v2, &_swiftEmptyArrayStorage, v10);
}

uint64_t sub_100005864()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v0 = sub_100004E7C(&qword_10001C728);
  sub_100005510(v0, qword_10001CDB0);
  sub_1000054F8(v0, (uint64_t)qword_10001CDB0);
  if (qword_10001C228 != -1)
    swift_once(&qword_10001C228, sub_100009560);
  v1 = qword_10001CE88;
  v2 = qword_10001CE90;
  v3 = sub_10000674C();
  swift_bridgeObjectRetain(v2);
  return _EntityURLRepresentation.init(_:)(v1, v2, &type metadata for ClearDeletedEntity, v3);
}

uint64_t sub_100005914(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_10000592C, 0, 0);
}

uint64_t sub_10000592C()
{
  uint64_t v0;
  id v1;
  NSString v2;
  id v3;
  id v4;
  char v5;

  v1 = objc_allocWithZone((Class)NSUserDefaults);
  v2 = String._bridgeToObjectiveC()();
  v3 = objc_msgSend(v1, "initWithSuiteName:", v2);

  if (v3)
  {
    v4 = objc_msgSend(v3, "rc_recentlyDeletedWindow");

    v5 = 0;
    switch((unint64_t)v4)
    {
      case 0uLL:
        break;
      case 1uLL:
        v5 = 1;
        break;
      case 7uLL:
        v5 = 2;
        break;
      case 0x1EuLL:
        goto LABEL_4;
      default:
        v5 = 4;
        break;
    }
  }
  else
  {
LABEL_4:
    v5 = 3;
  }
  **(_BYTE **)(v0 + 16) = v5;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100005A0C(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + 16) = *a2;
  return swift_task_switch(sub_100005A28, 0, 0);
}

uint64_t sub_100005A28()
{
  uint64_t v0;
  id v1;
  NSString v2;
  id v3;

  v1 = objc_allocWithZone((Class)NSUserDefaults);
  v2 = String._bridgeToObjectiveC()();
  v3 = objc_msgSend(v1, "initWithSuiteName:", v2);

  if (v3)
  {
    objc_msgSend(v3, "rc_setRecentlyDeletedWindow:", qword_100013218[*(char *)(v0 + 16)]);

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100005AC8(uint64_t a1)
{
  return sub_100004258(a1, qword_10001CDC8, 0xD000000000000033, 0x8000000100011460);
}

uint64_t sub_100005AEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_100004E7C(&qword_10001C520);
  sub_100005510(v0, qword_10001CDE0);
  v1 = sub_1000054F8(v0, (uint64_t)qword_10001CDE0);
  IntentDescription.init(stringLiteral:)(0xD000000000000020, 0x8000000100011430);
  v2 = type metadata accessor for IntentDescription(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 0, 1, v2);
}

uint64_t sub_100005B74()
{
  uint64_t result;

  result = swift_getKeyPath(&unk_1000131F0);
  qword_10001CDF8 = result;
  return result;
}

uint64_t sub_100005B98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  v4 = sub_100004E7C(&qword_10001C4F0);
  v3[9] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100004E7C(&qword_10001C4F8);
  v3[10] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100004E7C(&qword_10001C768);
  v3[11] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v6 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for IntentDialog(0);
  v3[12] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v3[13] = v8;
  v3[14] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100004E7C(&qword_10001C770);
  v3[15] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v3[16] = v10;
  v11 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3[17] = swift_task_alloc(v11);
  v3[18] = swift_task_alloc(v11);
  return swift_task_switch(sub_100005CA4, 0, 0);
}

uint64_t sub_100005CA4()
{
  _QWORD *v0;
  _QWORD *v1;
  unint64_t v2;

  IntentParameter.wrappedValue.getter(v0 + 2);
  v1 = (_QWORD *)swift_task_alloc(async function pointer to IntentDialog._CapturedContent.init<>(entity:_:)[1]);
  v0[19] = v1;
  v2 = sub_10000674C();
  *v1 = v0;
  v1[1] = sub_100005D24;
  return IntentDialog._CapturedContent.init<>(entity:_:)(v0[18], v0 + 2, sub_1000060AC, 0, &type metadata for ClearDeletedEntity, v2);
}

uint64_t sub_100005D24()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 152));
  return swift_task_switch(sub_100005D78, 0, 0);
}

uint64_t sub_100005D78()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  IntentParameter.wrappedValue.getter(v0 + 3);
  v1 = v0[3];
  v0[4] = v1;
  v0[20] = v1;
  IntentParameter.wrappedValue.getter(v0 + 24);
  if (qword_10001C1D8 != -1)
    swift_once(&qword_10001C1D8, sub_100005B74);
  v2 = qword_10001CDF8;
  v0[21] = qword_10001CDF8;
  v3 = async function pointer to AppEntity._setValue<A, B, C>(_:for:)[1];
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  v0[22] = v4;
  v5 = sub_100005564(&qword_10001C750, &qword_10001C758, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *v4 = v0;
  v4[1] = sub_100005E6C;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 24, v2, &type metadata for ClearDeletedEntity.IntentClearDeleted, v5);
}

uint64_t sub_100005E6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 168);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 176);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 160);
  *(_QWORD *)(*(_QWORD *)v1 + 184) = v0;
  swift_task_dealloc(v2);
  swift_release(v3);
  swift_release(v4);
  if (v0)
    v5 = sub_100003018;
  else
    v5 = sub_100005EEC;
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_100005EEC()
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
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 128);
  v13 = *(_QWORD *)(v0 + 120);
  v4 = *(_QWORD *)(v0 + 112);
  v5 = *(_QWORD *)(v0 + 88);
  v14 = *(_QWORD *)(v0 + 104);
  v15 = *(_QWORD *)(v0 + 96);
  v6 = *(_QWORD *)(v0 + 72);
  v7 = *(_QWORD *)(v0 + 80);
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 40));
  v8 = type metadata accessor for _GeneratedContentOptions(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = type metadata accessor for _GeneratedContentFallback(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = sub_1000055F8();
  v11 = sub_1000068B0();
  IntentDialog._GeneratedDialogContent.init(fromResult:options:fallbackDialog:)(sub_1000060AC, 0, v7, v6, &type metadata for ClearDeletedEntity.UpdateIntent_value);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v13);
  IntentDialog.init<A, B>(from:capturedContent:)(v5, v1, &type metadata for ClearDeletedEntity.UpdateIntent_value, &type metadata for ClearDeletedEntity, v10, v11);
  static IntentResult.result<A>(value:dialog:)(v0 + 40, v4, &type metadata for ClearDeletedEntity, v11);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v4, v15);
  swift_release(*(_QWORD *)(v0 + 40));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v13);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v7);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000060B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v0 = sub_100004E7C(&qword_10001C778);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10001C1D8 != -1)
    swift_once(&qword_10001C1D8, sub_100005B74);
  v4 = qword_10001CDF8;
  v5 = swift_retain(qword_10001CDF8);
  static _DialogBuilderEntity.buildExpression<A, B>(_:)(v5);
  swift_release(v4);
  v6 = sub_1000068B0();
  v7 = sub_100005564(&qword_10001C780, &qword_10001C778, (uint64_t)&protocol conformance descriptor for _NLGRepresentationEntity<A>);
  static _DialogBuilderEntity.buildBlock<A>(_:)(v3, &type metadata for ClearDeletedEntity, v0, v6, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_1000061B8()
{
  if (qword_10001C1D8 != -1)
    swift_once(&qword_10001C1D8, sub_100005B74);
  return swift_retain(qword_10001CDF8);
}

unint64_t sub_1000061FC()
{
  unint64_t result;

  result = qword_10001C540;
  if (!qword_10001C540)
  {
    result = swift_getWitnessTable(&unk_10001283C, &type metadata for ClearDeletedEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10001C540);
  }
  return result;
}

unint64_t sub_100006244()
{
  unint64_t result;

  result = qword_10001C548;
  if (!qword_10001C548)
  {
    result = swift_getWitnessTable(&unk_100012864, &type metadata for ClearDeletedEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10001C548);
  }
  return result;
}

uint64_t sub_100006288(uint64_t a1)
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2(a1, &unk_100016398, 1) + 8);
}

uint64_t sub_1000062AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000076B4(a1, a2, a3, (uint64_t (*)(void))sub_1000055F8, (uint64_t)&opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>);
}

uint64_t sub_1000062C0@<X0>(uint64_t a1@<X8>)
{
  return sub_100003484(&qword_10001C1C8, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10001CDC8, (uint64_t)sub_100005AC8, a1);
}

uint64_t sub_1000062E4@<X0>(uint64_t a1@<X8>)
{
  return sub_100003484(&qword_10001C248, (uint64_t (*)(_QWORD))&type metadata accessor for IntentAuthenticationPolicy, (uint64_t)qword_10001CEE0, (uint64_t)sub_10000A3FC, a1);
}

uint64_t sub_100006308@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10001C1D0 != -1)
    swift_once(&qword_10001C1D0, sub_100005AEC);
  v2 = sub_100004E7C(&qword_10001C520);
  v3 = sub_1000054F8(v2, (uint64_t)qword_10001CDE0);
  return sub_1000055A4(v3, a1);
}

uint64_t sub_100006368(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *v1;
  v4 = v1[1];
  v6 = (_QWORD *)swift_task_alloc(dword_10001C764);
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_1000055EC;
  return sub_100005B98(a1, v5, v4);
}

uint64_t sub_1000063CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_100007F88();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_1000063F0()
{
  return 0xD000000000000023;
}

unint64_t sub_100006410()
{
  unint64_t result;

  result = qword_10001C558;
  if (!qword_10001C558)
  {
    result = swift_getWitnessTable(&unk_1000128C0, &type metadata for ClearDeletedEntity.ClearDeletedEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10001C558);
  }
  return result;
}

unint64_t sub_100006458()
{
  unint64_t result;

  result = qword_10001C560;
  if (!qword_10001C560)
  {
    result = swift_getWitnessTable(&unk_100012D14, &type metadata for ClearDeletedEntity);
    atomic_store(result, (unint64_t *)&qword_10001C560);
  }
  return result;
}

uint64_t sub_10000649C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t result;
  uint64_t v6;

  v0 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v0);
  v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004E7C(&qword_10001C538);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000013, 0x80000001000113E0);
  v3 = sub_100005564(&qword_10001C750, &qword_10001C758, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  v4 = sub_100006E7C();
  result = _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)(v2, &unk_10001C740, 0, &unk_10001C748, 0, &type metadata for ClearDeletedEntity.UpdateIntent_value, v3, v4);
  qword_10001CE00 = result;
  return result;
}

uint64_t sub_100006580(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_100006598, 0, 0);
}

uint64_t sub_100006598()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v3)(void);

  if (qword_10001C1E0 != -1)
    swift_once(&qword_10001C1E0, sub_10000649C);
  v1 = qword_10001CE00;
  **(_QWORD **)(v0 + 16) = qword_10001CE00;
  v3 = *(uint64_t (**)(void))(v0 + 8);
  swift_retain(v1);
  return v3();
}

unint64_t sub_10000660C()
{
  unint64_t result;

  result = qword_10001C570;
  if (!qword_10001C570)
  {
    result = swift_getWitnessTable(&unk_1000128F8, &type metadata for ClearDeletedEntity.ClearDeletedEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10001C570);
  }
  return result;
}

uint64_t sub_100006650(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.allEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_10000712C();
  *v4 = v2;
  v4[1] = sub_100003898;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_1000066BC()
{
  unint64_t result;

  result = qword_10001C580;
  if (!qword_10001C580)
  {
    result = swift_getWitnessTable(&unk_100012950, &type metadata for ClearDeletedEntity.ClearDeletedEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10001C580);
  }
  return result;
}

unint64_t sub_100006704()
{
  unint64_t result;

  result = qword_10001C588;
  if (!qword_10001C588)
  {
    result = swift_getWitnessTable(&unk_1000129B0, &type metadata for ClearDeletedEntity.ClearDeletedEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10001C588);
  }
  return result;
}

unint64_t sub_10000674C()
{
  unint64_t result;

  result = qword_10001C590[0];
  if (!qword_10001C590[0])
  {
    result = swift_getWitnessTable(&unk_100012CBC, &type metadata for ClearDeletedEntity);
    atomic_store(result, qword_10001C590);
  }
  return result;
}

uint64_t sub_100006790(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.entities(for:)[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_10000712C();
  *v5 = v2;
  v5[1] = sub_100003A40;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_1000067FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.suggestedEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_10000712C();
  *v4 = v2;
  v4[1] = sub_1000055F0;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_100006868()
{
  unint64_t result;

  result = qword_10001C5A8;
  if (!qword_10001C5A8)
  {
    result = swift_getWitnessTable(&unk_1000129D8, &type metadata for ClearDeletedEntity.ClearDeletedEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10001C5A8);
  }
  return result;
}

unint64_t sub_1000068B0()
{
  unint64_t result;

  result = qword_10001C5B0;
  if (!qword_10001C5B0)
  {
    result = swift_getWitnessTable(&unk_100012E94, &type metadata for ClearDeletedEntity);
    atomic_store(result, (unint64_t *)&qword_10001C5B0);
  }
  return result;
}

unint64_t sub_1000068F8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001C5B8;
  if (!qword_10001C5B8)
  {
    v1 = sub_100002498(qword_10001C5C0);
    sub_1000068B0();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_10001C5B8);
  }
  return result;
}

uint64_t sub_10000695C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_10000660C();
  *v5 = v2;
  v5[1] = sub_100003C60;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_1000069C8(uint64_t a1)
{
  return sub_1000069EC(a1, qword_10001CE08, 0xD00000000000001BLL, 0x80000001000113C0);
}

uint64_t sub_1000069EC(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v16;

  v7 = sub_100004E7C(&qword_10001C488);
  __chkstk_darwin(v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for LocalizedStringResource(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_100005510(v14, a2);
  sub_1000054F8(v14, (uint64_t)a2);
  LocalizedStringResource.init(stringLiteral:)(a3, a4);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v13, v9);
}

BOOL sub_100006AF8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_100006B10()
{
  unint64_t result;

  result = qword_10001C5D8;
  if (!qword_10001C5D8)
  {
    result = swift_getWitnessTable(&unk_1000129F4, &type metadata for ClearDeletedEntity.IntentClearDeleted);
    atomic_store(result, (unint64_t *)&qword_10001C5D8);
  }
  return result;
}

Swift::Int sub_100006B54()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100006B98()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100006BC0(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

unint64_t sub_100006C00@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_100008710(*a1);
  *a2 = result;
  return result;
}

void sub_100006C28(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

unint64_t sub_100006C38()
{
  unint64_t result;

  result = qword_10001C5E0;
  if (!qword_10001C5E0)
  {
    result = swift_getWitnessTable(&unk_100012B0C, &type metadata for ClearDeletedEntity.IntentClearDeleted);
    atomic_store(result, (unint64_t *)&qword_10001C5E0);
  }
  return result;
}

unint64_t sub_100006C80()
{
  unint64_t result;

  result = qword_10001C5E8;
  if (!qword_10001C5E8)
  {
    result = swift_getWitnessTable(&unk_100012B44, &type metadata for ClearDeletedEntity.IntentClearDeleted);
    atomic_store(result, (unint64_t *)&qword_10001C5E8);
  }
  return result;
}

unint64_t sub_100006CC8()
{
  unint64_t result;

  result = qword_10001C5F0;
  if (!qword_10001C5F0)
  {
    result = swift_getWitnessTable(&unk_100012A5C, &type metadata for ClearDeletedEntity.IntentClearDeleted);
    atomic_store(result, (unint64_t *)&qword_10001C5F0);
  }
  return result;
}

void *sub_100006D0C()
{
  return &protocol witness table for Int;
}

void *sub_100006D18()
{
  return &protocol witness table for Int;
}

unint64_t sub_100006D28()
{
  unint64_t result;

  result = qword_10001C5F8;
  if (!qword_10001C5F8)
  {
    result = swift_getWitnessTable(&unk_100012B74, &type metadata for ClearDeletedEntity.IntentClearDeleted);
    atomic_store(result, (unint64_t *)&qword_10001C5F8);
  }
  return result;
}

unint64_t sub_100006D70()
{
  unint64_t result;

  result = qword_10001C600;
  if (!qword_10001C600)
  {
    result = swift_getWitnessTable(&unk_100012B9C, &type metadata for ClearDeletedEntity.IntentClearDeleted);
    atomic_store(result, (unint64_t *)&qword_10001C600);
  }
  return result;
}

unint64_t sub_100006DB8()
{
  unint64_t result;

  result = qword_10001C608;
  if (!qword_10001C608)
  {
    result = swift_getWitnessTable(&unk_100012BC4, &type metadata for ClearDeletedEntity.IntentClearDeleted);
    atomic_store(result, (unint64_t *)&qword_10001C608);
  }
  return result;
}

unint64_t sub_100006E00()
{
  unint64_t result;

  result = qword_10001C610;
  if (!qword_10001C610)
  {
    result = swift_getWitnessTable(&unk_100012C1C, &type metadata for ClearDeletedEntity.IntentClearDeleted);
    atomic_store(result, (unint64_t *)&qword_10001C610);
  }
  return result;
}

uint64_t sub_100006E44@<X0>(uint64_t a1@<X8>)
{
  return sub_100003484(&qword_10001C1E8, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10001CE08, (uint64_t)sub_1000069C8, a1);
}

uint64_t sub_100006E68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000076B4(a1, a2, a3, (uint64_t (*)(void))sub_100006E7C, (uint64_t)&opaque type descriptor for <<opaque return type of static AppEnum.defaultResolverSpecification>>);
}

unint64_t sub_100006E7C()
{
  unint64_t result;

  result = qword_10001C618;
  if (!qword_10001C618)
  {
    result = swift_getWitnessTable(&unk_100012A94, &type metadata for ClearDeletedEntity.IntentClearDeleted);
    atomic_store(result, (unint64_t *)&qword_10001C618);
  }
  return result;
}

uint64_t sub_100006EC0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100006E7C();
  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100006EFC()
{
  unint64_t result;

  result = qword_10001C620;
  if (!qword_10001C620)
  {
    result = swift_getWitnessTable(&unk_100012C5C, &type metadata for ClearDeletedEntity.IntentClearDeleted);
    atomic_store(result, (unint64_t *)&qword_10001C620);
  }
  return result;
}

unint64_t sub_100006F44()
{
  unint64_t result;

  result = qword_10001C628;
  if (!qword_10001C628)
  {
    result = swift_getWitnessTable(&unk_100012C84, &type metadata for ClearDeletedEntity.IntentClearDeleted);
    atomic_store(result, (unint64_t *)&qword_10001C628);
  }
  return result;
}

unint64_t sub_100006F8C()
{
  unint64_t result;

  result = qword_10001C630;
  if (!qword_10001C630)
  {
    result = swift_getWitnessTable(&unk_100012A1C, &type metadata for ClearDeletedEntity.IntentClearDeleted);
    atomic_store(result, (unint64_t *)&qword_10001C630);
  }
  return result;
}

uint64_t sub_100006FD4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100006E00();
  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_10000700C()
{
  return sub_100005564(&qword_10001C638, &qword_10001C640, (uint64_t)&protocol conformance descriptor for [A]);
}

void sub_100007038(_QWORD *a1@<X8>)
{
  *a1 = &off_100018738;
}

unint64_t sub_10000704C()
{
  unint64_t result;

  result = qword_10001C648;
  if (!qword_10001C648)
  {
    result = swift_getWitnessTable(&unk_100012D7C, &type metadata for ClearDeletedEntity);
    atomic_store(result, (unint64_t *)&qword_10001C648);
  }
  return result;
}

unint64_t sub_100007094()
{
  unint64_t result;

  result = qword_10001C650;
  if (!qword_10001C650)
  {
    result = swift_getWitnessTable(&unk_100012DB4, &type metadata for ClearDeletedEntity);
    atomic_store(result, (unint64_t *)&qword_10001C650);
  }
  return result;
}

unint64_t sub_1000070DC()
{
  unint64_t result;

  result = qword_10001C658;
  if (!qword_10001C658)
  {
    result = swift_getWitnessTable(&unk_100012DE4, &type metadata for ClearDeletedEntity);
    atomic_store(result, (unint64_t *)&qword_10001C658);
  }
  return result;
}

unint64_t sub_10000712C()
{
  unint64_t result;

  result = qword_10001C660;
  if (!qword_10001C660)
  {
    result = swift_getWitnessTable(&unk_100012880, &type metadata for ClearDeletedEntity.ClearDeletedEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10001C660);
  }
  return result;
}

unint64_t sub_100007174()
{
  unint64_t result;

  result = qword_10001C668;
  if (!qword_10001C668)
  {
    result = swift_getWitnessTable(&unk_100012E1C, &type metadata for ClearDeletedEntity);
    atomic_store(result, (unint64_t *)&qword_10001C668);
  }
  return result;
}

uint64_t sub_1000071B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10001C1C0 != -1)
    swift_once(&qword_10001C1C0, sub_100005864);
  v2 = sub_100004E7C(&qword_10001C728);
  v3 = sub_1000054F8(v2, (uint64_t)qword_10001CDB0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

unint64_t sub_100007230()
{
  unint64_t result;

  result = qword_10001C670;
  if (!qword_10001C670)
  {
    result = swift_getWitnessTable(&unk_100012E44, &type metadata for ClearDeletedEntity);
    atomic_store(result, (unint64_t *)&qword_10001C670);
  }
  return result;
}

unint64_t sub_100007278()
{
  unint64_t result;

  result = qword_10001C678;
  if (!qword_10001C678)
  {
    result = swift_getWitnessTable(&unk_100012E6C, &type metadata for ClearDeletedEntity);
    atomic_store(result, (unint64_t *)&qword_10001C678);
  }
  return result;
}

unint64_t sub_1000072C0()
{
  unint64_t result;

  result = qword_10001C680;
  if (!qword_10001C680)
  {
    result = swift_getWitnessTable(&unk_100012EEC, &type metadata for ClearDeletedEntity);
    atomic_store(result, (unint64_t *)&qword_10001C680);
  }
  return result;
}

uint64_t sub_100007304@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v4;
  uint64_t result;
  uint64_t v6;

  v4 = sub_100006458();
  result = _UniqueEntity.id.getter(a1, v4);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_100007340(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_1000089B0();
  v4 = _URLRepresentableEntity.urlRepresentationParameter.getter(a1, v3);
  return sub_100005550(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8), v1, v4, v5);
}

uint64_t sub_100007388@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE v5[24];

  if (qword_10001C1B8 != -1)
    swift_once(&qword_10001C1B8, sub_100005668);
  v2 = type metadata accessor for TypeDisplayRepresentation(0);
  v3 = sub_1000054F8(v2, (uint64_t)qword_10001CD98);
  swift_beginAccess(v3, v5, 0, 0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_100007420()
{
  return sub_100005564(&qword_10001C690, &qword_10001C698, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_10000744C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000674C();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100007488()
{
  unint64_t result;

  result = qword_10001C6A0;
  if (!qword_10001C6A0)
  {
    result = swift_getWitnessTable(&unk_100012F1C, &type metadata for ClearDeletedEntity);
    atomic_store(result, (unint64_t *)&qword_10001C6A0);
  }
  return result;
}

uint64_t sub_1000074D0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000072C0();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_10000750C()
{
  unint64_t result;

  result = qword_10001C6A8;
  if (!qword_10001C6A8)
  {
    result = swift_getWitnessTable(&unk_100012FD4, &type metadata for OpenClearDeletedEntity);
    atomic_store(result, (unint64_t *)&qword_10001C6A8);
  }
  return result;
}

uint64_t sub_100007550(uint64_t a1)
{
  return sub_100004258(a1, qword_10001CE20, 0xD000000000000018, 0x8000000100011270);
}

unint64_t sub_100007578()
{
  unint64_t result;

  result = qword_10001C6B0;
  if (!qword_10001C6B0)
  {
    result = swift_getWitnessTable(&unk_100012FFC, &type metadata for OpenClearDeletedEntity);
    atomic_store(result, (unint64_t *)&qword_10001C6B0);
  }
  return result;
}

uint64_t sub_1000075BC(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;

  v4 = sub_100008928();
  v5 = sub_1000089B0();
  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_100007614()
{
  unint64_t result;

  result = qword_10001C6B8;
  if (!qword_10001C6B8)
  {
    result = swift_getWitnessTable(&unk_10001308C, &type metadata for OpenClearDeletedEntity);
    atomic_store(result, (unint64_t *)&qword_10001C6B8);
  }
  return result;
}

unint64_t sub_10000765C()
{
  unint64_t result;

  result = qword_10001C6C0;
  if (!qword_10001C6C0)
  {
    result = swift_getWitnessTable(&unk_1000130B4, &type metadata for OpenClearDeletedEntity);
    atomic_store(result, (unint64_t *)&qword_10001C6C0);
  }
  return result;
}

uint64_t sub_1000076A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000076B4(a1, a2, a3, (uint64_t (*)(void))sub_100007578, (uint64_t)&opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>);
}

uint64_t sub_1000076B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t a5)
{
  _QWORD v7[2];

  v7[0] = a2;
  v7[1] = a4();
  return swift_getOpaqueTypeConformance2(v7, a5, 1);
}

uint64_t sub_1000076F4@<X0>(uint64_t a1@<X8>)
{
  return sub_100003484(&qword_10001C1F0, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10001CE20, (uint64_t)sub_100007550, a1);
}

uint64_t sub_100007718(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to _URLRepresentableIntent<>.perform()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_100008928();
  v7 = sub_10000896C();
  v8 = sub_1000089B0();
  *v5 = v2;
  v5[1] = sub_10000456C;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_1000077A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_100008720();
  *a1 = result;
  return result;
}

uint64_t sub_1000077C8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100007578();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_1000077F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t result;
  _QWORD v6[2];

  v0 = sub_100004E7C(&qword_10001C440);
  v1 = type metadata accessor for _AssistantIntent(0);
  v2 = swift_allocObject(v0, ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v1 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) | 7);
  *(_OWORD *)(v2 + 16) = xmmword_100011E20;
  v6[0] = sub_100007F88();
  v6[1] = v3;
  v4 = sub_1000055F8();
  result = _AssistantIntent.init<A>(_:phrases:parameterValues:)(v6, sub_1000078A4, 0, &j___s10AppIntents16_AssistantIntentV21ParameterValueBuilderO10buildBlockSayAC0F0VGyFZ, 0, &type metadata for ClearDeletedEntity.UpdateIntent_value, v4);
  qword_10001CE38 = v2;
  return result;
}

uint64_t sub_1000078A4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  Swift::String v12;
  uint64_t KeyPath;
  uint64_t v14;
  Swift::String v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t);
  Swift::String v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  Swift::String v22;
  uint64_t v23;
  uint64_t v24;
  Swift::String v25;
  uint64_t v26;
  Swift::String v27;
  Swift::String v28;
  uint64_t v29;
  uint64_t v30;
  Swift::String v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  void (*v39)(char *, uint64_t);
  uint64_t v40;
  void (*v41)(char *, uint64_t, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t);
  unint64_t v46;
  uint64_t v47;

  v2 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v42 = *(_QWORD *)(v2 - 8);
  v43 = v2;
  __chkstk_darwin(v2);
  v4 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = sub_100004E7C(&qword_10001C6E8);
  v5 = *(_QWORD *)(v47 - 8);
  __chkstk_darwin(v47);
  v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100004E7C(&qword_10001C6F0);
  __chkstk_darwin(v8);
  v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1000055F8();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(14, 1, &type metadata for ClearDeletedEntity.UpdateIntent_value, v11);
  v12._countAndFlagsBits = 0x6564207261656C43;
  v12._object = (void *)0xEE0020646574656CLL;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v12);
  KeyPath = swift_getKeyPath(&unk_1000131C8);
  v46 = sub_100006DB8();
  v40 = a1;
  v14 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v46);
  swift_release(KeyPath);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v14, v8);
  swift_release(v14);
  v15._countAndFlagsBits = 0;
  v15._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v15);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v10, &type metadata for ClearDeletedEntity.UpdateIntent_value, v11);
  v16 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v7, &type metadata for ClearDeletedEntity.UpdateIntent_value, v11);
  v17 = *(void (**)(char *, uint64_t))(v5 + 8);
  v44 = v16;
  v45 = v17;
  v17(v7, v47);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(13, 2, &type metadata for ClearDeletedEntity.UpdateIntent_value, v11);
  v18._countAndFlagsBits = 0x207974706D45;
  v18._object = (void *)0xE600000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v18);
  v19 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v20 = v42;
  v21 = v43;
  v41 = *(void (**)(char *, uint64_t, uint64_t))(v42 + 104);
  v41(v4, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v43);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v4, v8);
  v39 = *(void (**)(char *, uint64_t))(v20 + 8);
  v39(v4, v21);
  v22._countAndFlagsBits = 0x20687361727420;
  v22._object = (void *)0xE700000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v22);
  v23 = swift_getKeyPath(&unk_1000131C8);
  v24 = _AssistantIntent.IntentProjection.subscript.getter(v23, v46);
  swift_release(v23);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v24, v8);
  swift_release(v24);
  v25._countAndFlagsBits = 0;
  v25._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v25);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v10, &type metadata for ClearDeletedEntity.UpdateIntent_value, v11);
  v42 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v7, &type metadata for ClearDeletedEntity.UpdateIntent_value, v11);
  v26 = v47;
  v45(v7, v47);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(11, 2, &type metadata for ClearDeletedEntity.UpdateIntent_value, v11);
  v27._countAndFlagsBits = 0x207974706D65;
  v27._object = (void *)0xE600000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v27);
  v41(v4, v19, v21);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v4, v8);
  v39(v4, v21);
  v28._countAndFlagsBits = 0x206E696220;
  v28._object = (void *)0xE500000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v28);
  v29 = swift_getKeyPath(&unk_1000131C8);
  v30 = _AssistantIntent.IntentProjection.subscript.getter(v29, v46);
  swift_release(v29);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v30, v8);
  swift_release(v30);
  v31._countAndFlagsBits = 0;
  v31._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v31);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v10, &type metadata for ClearDeletedEntity.UpdateIntent_value, v11);
  v32 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v7, &type metadata for ClearDeletedEntity.UpdateIntent_value, v11);
  v45(v7, v26);
  v33 = sub_100004E7C(&qword_10001C6F8);
  v34 = swift_allocObject(v33, 56, 7);
  *(_OWORD *)(v34 + 16) = xmmword_100013240;
  v35 = v42;
  *(_QWORD *)(v34 + 32) = v44;
  *(_QWORD *)(v34 + 40) = v35;
  *(_QWORD *)(v34 + 48) = v32;
  v36 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)(v34);
  swift_bridgeObjectRelease(v34);
  return v36;
}

void sub_100007D18()
{
  qword_10001CE40 = (uint64_t)&_swiftEmptyArrayStorage;
}

uint64_t sub_100007D2C(uint64_t a1, uint64_t a2)
{
  return sub_100004C10(a1, a2, &qword_10001C1F8, &qword_10001CE38, (uint64_t)sub_1000077F0);
}

uint64_t sub_100007D48(uint64_t a1, uint64_t a2)
{
  return sub_100004C10(a1, a2, &qword_10001C200, &qword_10001CE40, (uint64_t)sub_100007D18);
}

ValueMetadata *type metadata accessor for ClearDeletedIntents()
{
  return &type metadata for ClearDeletedIntents;
}

ValueMetadata *type metadata accessor for OpenClearDeletedEntity()
{
  return &type metadata for OpenClearDeletedEntity;
}

ValueMetadata *type metadata accessor for ClearDeletedEntity.ClearDeletedEntityQuery()
{
  return &type metadata for ClearDeletedEntity.ClearDeletedEntityQuery;
}

_BYTE *initializeBufferWithCopyOfBuffer for ClearDeletedEntity.IntentClearDeleted(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ClearDeletedEntity.IntentClearDeleted(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ClearDeletedEntity.IntentClearDeleted(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100007E80 + 4 * byte_1000126F5[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_100007EB4 + 4 * byte_1000126F0[v4]))();
}

uint64_t sub_100007EB4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100007EBC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100007EC4);
  return result;
}

uint64_t sub_100007ED0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100007ED8);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_100007EDC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100007EE4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100007EF0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100007EF8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ClearDeletedEntity.IntentClearDeleted()
{
  return &type metadata for ClearDeletedEntity.IntentClearDeleted;
}

ValueMetadata *type metadata accessor for ClearDeletedEntity()
{
  return &type metadata for ClearDeletedEntity;
}

ValueMetadata *type metadata accessor for ClearDeletedEntity.UpdateIntent_value()
{
  return &type metadata for ClearDeletedEntity.UpdateIntent_value;
}

uint64_t sub_100007F30()
{
  return sub_100005564(&qword_10001C6D0, &qword_10001C6D8, (uint64_t)&protocol conformance descriptor for <> IntentResultContainer<A, B, C, D>);
}

uint64_t sub_100007F5C()
{
  return sub_100005564(&qword_10001C6E0, &qword_10001C6D8, (uint64_t)&protocol conformance descriptor for IntentResultContainer<A, B, C, D>);
}

uint64_t sub_100007F88()
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
  v3 = sub_100004E7C(&qword_10001C480);
  v4 = __chkstk_darwin(v3);
  v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)v25 - v7;
  v9 = sub_100004E7C(&qword_10001C488);
  __chkstk_darwin(v9);
  v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  v27 = v12;
  __chkstk_darwin(v12);
  v15 = (char *)v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25[1] = sub_100004E7C(&qword_10001C700);
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000003DLL, 0x80000001000111C0);
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
  v22 = sub_10000674C();
  v28 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v15, v11, &v31, v18, v19, v2, v22);
  sub_100004E7C(&qword_10001C708);
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000003FLL, 0x8000000100011200);
  v26(v11, 1, 1, v27);
  v30 = 5;
  v17(v18, 1, 1, v16);
  v17(v19, 1, 1, v16);
  ((void (*)(char *, uint64_t, uint64_t))v25[0])(v2, v20, v21);
  v23 = sub_100006E7C();
  IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)(v15, v11, &v30, v18, v19, v2, &off_100018710, v23);
  return v28;
}

_QWORD *sub_100008278@<X0>(_BYTE *a1@<X8>)
{
  _QWORD *result;
  uint64_t v3;

  result = IntentParameter.wrappedValue.getter(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_1000082B0(char *a1)
{
  char v2;

  v2 = *a1;
  return IntentParameter.wrappedValue.setter(&v2);
}

unint64_t sub_1000082E4()
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v29;
  _BYTE *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v35;
  void (*v36)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v0 = sub_100004E7C(&qword_10001C4B8);
  __chkstk_darwin(v0);
  v2 = (char *)&v35 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_100004E7C(&qword_10001C488);
  __chkstk_darwin(v3);
  v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for LocalizedStringResource(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = v6;
  __chkstk_darwin(v6);
  v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100004E7C(&qword_10001C730);
  v12 = sub_100004E7C(&qword_10001C738);
  v13 = *(_QWORD *)(v12 - 8);
  v42 = v12;
  v14 = *(_QWORD *)(v13 + 72);
  v15 = *(unsigned __int8 *)(v13 + 80);
  v16 = (v15 + 32) & ~v15;
  v40 = 4 * v14;
  v17 = v14;
  v18 = swift_allocObject(v11, v16 + 5 * v14, v15 | 7);
  v41 = v18;
  *(_OWORD *)(v18 + 16) = xmmword_100013250;
  *(_BYTE *)(v18 + v16) = 0;
  v19 = v18 + v16;
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000022, 0x80000001000112F0);
  v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
  v21 = v8;
  v38 = v8;
  v20(v5, 1, 1, v8);
  v22 = v20;
  v23 = type metadata accessor for DisplayRepresentation.Image(0);
  v36 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56);
  v36(v2, 1, 1, v23);
  DisplayRepresentation.init(title:subtitle:image:)(v10, v5, v2);
  v39 = v17;
  v24 = v19;
  v37 = v19;
  v35 = v19 + v17 + *(int *)(v42 + 48);
  *(_BYTE *)(v19 + v17) = 1;
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000001ELL, 0x8000000100011320);
  v20(v5, 1, 1, v21);
  v25 = v36;
  v36(v2, 1, 1, v23);
  DisplayRepresentation.init(title:subtitle:image:)(v10, v5, v2);
  v26 = 2 * v17;
  *(_BYTE *)(v24 + 2 * v17) = 2;
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000021, 0x8000000100011340);
  v27 = v38;
  v28 = v22;
  v22(v5, 1, 1, v38);
  v25(v2, 1, 1, v23);
  DisplayRepresentation.init(title:subtitle:image:)(v10, v5, v2);
  v29 = v37;
  v30 = (_BYTE *)(v37 + v26 + v39);
  v31 = v42;
  *v30 = 3;
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000022, 0x8000000100011370);
  v28(v5, 1, 1, v27);
  v25(v2, 1, 1, v23);
  DisplayRepresentation.init(title:subtitle:image:)(v10, v5, v2);
  *(_BYTE *)(v29 + v40) = 4;
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000001CLL, 0x80000001000113A0);
  v28(v5, 1, 1, v27);
  v25(v2, 1, 1, v23);
  DisplayRepresentation.init(title:subtitle:image:)(v10, v5, v2);
  v32 = v41;
  v33 = sub_10000FA98(v41);
  swift_setDeallocating(v32);
  swift_arrayDestroy(v29, 5, v31);
  swift_deallocClassInstance(v32, 32, 7);
  return v33;
}

unint64_t sub_100008710(unint64_t result)
{
  if (result >= 5)
    return 5;
  return result;
}

uint64_t sub_100008720()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  void (*v18)(char *, uint64_t, uint64_t, uint64_t);
  unint64_t v19;
  uint64_t v21;
  uint64_t v22;

  v0 = type metadata accessor for InputConnectionBehavior(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100004E7C(&qword_10001C480);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v21 - v8;
  v10 = sub_100004E7C(&qword_10001C488);
  __chkstk_darwin(v10);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for LocalizedStringResource(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004E7C(&qword_10001C700);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000028, 0x8000000100011240);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
  v22 = 0;
  v17 = type metadata accessor for IntentDialog(0);
  v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56);
  v18(v9, 1, 1, v17);
  v18(v7, 1, 1, v17);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for InputConnectionBehavior.default(_:), v0);
  v19 = sub_10000674C();
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v16, v12, &v22, v9, v7, v3, v19);
}

unint64_t sub_100008928()
{
  unint64_t result;

  result = qword_10001C710;
  if (!qword_10001C710)
  {
    result = swift_getWitnessTable(&unk_100012F44, &type metadata for OpenClearDeletedEntity);
    atomic_store(result, (unint64_t *)&qword_10001C710);
  }
  return result;
}

unint64_t sub_10000896C()
{
  unint64_t result;

  result = qword_10001C718;
  if (!qword_10001C718)
  {
    result = swift_getWitnessTable(&unk_100012F94, &type metadata for OpenClearDeletedEntity);
    atomic_store(result, (unint64_t *)&qword_10001C718);
  }
  return result;
}

unint64_t sub_1000089B0()
{
  unint64_t result;

  result = qword_10001C720;
  if (!qword_10001C720)
  {
    result = swift_getWitnessTable(&unk_100012D44, &type metadata for ClearDeletedEntity);
    atomic_store(result, (unint64_t *)&qword_10001C720);
  }
  return result;
}

uint64_t sub_1000089F4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = v2;
  return swift_retain(v2);
}

ValueMetadata *type metadata accessor for ClearDeletedWidget()
{
  return &type metadata for ClearDeletedWidget;
}

uint64_t sub_100008A10(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000163F8, 1);
}

uint64_t sub_100008A20@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  uint64_t KeyPath;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t OpaqueTypeConformance2;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v60 = a1;
  v1 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v1);
  v59 = (char *)&v48 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for ControlSize(0);
  __chkstk_darwin(v3);
  v5 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Locale(0);
  __chkstk_darwin(v6);
  v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v9);
  v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = sub_100004E7C(&qword_10001C788);
  v52 = *(_QWORD *)(v55 - 8);
  __chkstk_darwin(v55);
  v13 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = sub_100004E7C(&qword_10001C790);
  v54 = *(_QWORD *)(v57 - 8);
  __chkstk_darwin(v57);
  v51 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = sub_100004E7C(&qword_10001C798);
  v56 = *(_QWORD *)(v58 - 8);
  __chkstk_darwin(v58);
  v53 = (char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000013, 0x80000001000113E0);
  static Locale.current.getter(v16);
  v49 = String.init(localized:table:bundle:locale:comment:)(v11, 0, 0, 0, v8, 0, 0, 256);
  v18 = v17;
  KeyPath = swift_getKeyPath(&unk_1000132B8);
  static ControlSize._1x1.getter();
  v20 = sub_100004E7C(&qword_10001C7A0);
  v21 = sub_100004E7C(&qword_10001C7A8);
  v22 = sub_100006E7C();
  v23 = sub_1000091F8();
  v24 = sub_100006458();
  v25 = sub_100005564(&qword_10001C7B8, &qword_10001C7A0, (uint64_t)&protocol conformance descriptor for Label<A, B>);
  v26 = sub_10000923C();
  v50 = v13;
  ControlPicker.init<A, B, C, D, E, F, G, H>(kind:displayName:preferredSize:intentUpdatableProperty:title:subtitle:value:affordances:)(0xD000000000000016, 0x80000001000114A0, v49, v18, v5, KeyPath, sub_100008ED8, 0, sub_100008F24, 0, sub_100008F98, 0, 0, 0, v20, &type metadata for Text, v21, v22, v23,
    v24,
    v25,
    &protocol witness table for Text,
    v26);
  if (qword_10001C1B8 != -1)
    swift_once(&qword_10001C1B8, sub_100005668);
  v27 = type metadata accessor for TypeDisplayRepresentation(0);
  v28 = sub_1000054F8(v27, (uint64_t)qword_10001CD98);
  v29 = swift_beginAccess(v28, &v61, 32, 0);
  v30 = v59;
  TypeDisplayRepresentation.name.getter(v29);
  swift_endAccess(&v61);
  v31 = Text.init(_:)(v30);
  v33 = v32;
  v35 = v34;
  v37 = v36 & 1;
  v38 = sub_100005564(&qword_10001C7C8, &qword_10001C788, (uint64_t)&protocol conformance descriptor for ControlPicker<A>);
  v39 = v50;
  v40 = v51;
  v41 = v55;
  WidgetConfiguration.configurationDisplayName(_:)(v31, v33, v37, v35, v55, v38);
  sub_100009298(v31, v33, v37);
  swift_bridgeObjectRelease(v35);
  (*(void (**)(char *, uint64_t))(v52 + 8))(v39, v41);
  v61 = v41;
  v62 = v38;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v61, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v43 = v53;
  v44 = v57;
  WidgetConfiguration.disablesControlStateCaching()(v57, OpaqueTypeConformance2);
  (*(void (**)(char *, uint64_t))(v54 + 8))(v40, v44);
  v61 = v44;
  v62 = OpaqueTypeConformance2;
  v45 = swift_getOpaqueTypeConformance2(&v61, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v46 = v58;
  WidgetConfiguration.hiddenControl()(v58, v45);
  return (*(uint64_t (**)(char *, uint64_t))(v56 + 8))(v43, v46);
}

uint64_t sub_100008ED8()
{
  uint64_t v0;

  v0 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000013, 0x80000001000113E0);
  return Label<>.init(_:systemImage:)(v0);
}

uint64_t sub_100008F24@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  char v5;
  uint64_t v6;

  v2 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000018, 0x80000001000114C0);
  result = Text.init(_:tableName:bundle:comment:)(v2);
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5 & 1;
  *(_QWORD *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_100008F98@<X0>(unsigned __int8 *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  unsigned __int8 v17;
  unint64_t v18;
  unint64_t v19;
  char v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t result;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  char *v38;
  uint64_t v39;

  v4 = sub_100004E7C(&qword_10001C7D0);
  __chkstk_darwin(v4);
  v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for LocalizedStringResource(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v9);
  v14 = (char *)&v38 - v13;
  __chkstk_darwin(v12);
  v16 = (char *)&v38 - v15;
  v17 = *a1;
  v18 = sub_1000082E4();
  if (*(_QWORD *)(v18 + 16) && (v19 = sub_10000F888(v17), (v20 & 1) != 0))
  {
    v21 = v19;
    v38 = v14;
    v22 = v11;
    v23 = *(_QWORD *)(v18 + 56);
    v24 = type metadata accessor for DisplayRepresentation(0);
    v39 = v8;
    v25 = v7;
    v26 = *(_QWORD *)(v24 - 8);
    v27 = v23 + *(_QWORD *)(v26 + 72) * v21;
    v11 = v22;
    v14 = v38;
    (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v6, v27, v24);
    v28 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56);
    v7 = v25;
    v8 = v39;
    v28(v6, 0, 1, v24);
  }
  else
  {
    v24 = type metadata accessor for DisplayRepresentation(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v6, 1, 1, v24);
  }
  swift_bridgeObjectRelease(v18);
  type metadata accessor for DisplayRepresentation(0);
  v29 = *(_QWORD *)(v24 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v6, 1, v24) == 1)
  {
    result = sub_1000092A8((uint64_t)v6);
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
  }
  else
  {
    DisplayRepresentation.title.getter();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v6, v24);
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v16, v14, v7);
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v16, v7);
    v31 = Text.init(_:)(v11);
    v32 = v35;
    v34 = v36;
    v33 = v37 & 1;
    result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v16, v7);
  }
  *a2 = v31;
  a2[1] = v32;
  a2[2] = v33;
  a2[3] = v34;
  return result;
}

unint64_t sub_1000091F8()
{
  unint64_t result;

  result = qword_10001C7B0;
  if (!qword_10001C7B0)
  {
    result = swift_getWitnessTable(&unk_100012AD4, &type metadata for ClearDeletedEntity.IntentClearDeleted);
    atomic_store(result, (unint64_t *)&qword_10001C7B0);
  }
  return result;
}

unint64_t sub_10000923C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001C7C0;
  if (!qword_10001C7C0)
  {
    v1 = sub_100002498(&qword_10001C7A8);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_10001C7C0);
  }
  return result;
}

uint64_t sub_100009298(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

uint64_t sub_1000092A8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100004E7C(&qword_10001C7D0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000092E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t OpaqueTypeConformance2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v0 = sub_100002498(&qword_10001C798);
  v1 = sub_100002498(&qword_10001C790);
  v5 = sub_100002498(&qword_10001C788);
  v6 = sub_100005564(&qword_10001C7C8, &qword_10001C788, (uint64_t)&protocol conformance descriptor for ControlPicker<A>);
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v5 = v1;
  v6 = OpaqueTypeConformance2;
  v3 = swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v5 = v0;
  v6 = v3;
  return swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of WidgetConfiguration.hiddenControl()>>, 1);
}

uint64_t sub_1000093A4()
{
  uint64_t v0;

  v0 = sub_100004E7C(&qword_10001C7E0);
  return TupleWidget.init(_:)(v0, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_10000940C();
  static WidgetBundle.main()();
  return 0;
}

unint64_t sub_10000940C()
{
  unint64_t result;

  result = qword_10001C7D8;
  if (!qword_10001C7D8)
  {
    result = swift_getWitnessTable("Ia", &type metadata for VoiceMemosSettingsWidgetBundle);
    atomic_store(result, (unint64_t *)&qword_10001C7D8);
  }
  return result;
}

ValueMetadata *type metadata accessor for VoiceMemosSettingsWidgetBundle()
{
  return &type metadata for VoiceMemosSettingsWidgetBundle;
}

uint64_t sub_100009460(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001643C, 1);
}

unint64_t sub_100009474()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001C7E8;
  if (!qword_10001C7E8)
  {
    v1 = sub_100002498(&qword_10001C7F0);
    result = swift_getWitnessTable(&protocol conformance descriptor for TupleWidget<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10001C7E8);
  }
  return result;
}

uint64_t sub_1000094C0()
{
  uint64_t result;
  uint64_t v1;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(CFSTR("settings-navigation://com.apple.Settings.Apps/com.apple.VoiceMemos"));
  qword_10001CE48 = result;
  unk_10001CE50 = v1;
  return result;
}

void sub_1000094E8(uint64_t a1)
{
  sub_100009588(a1, 0xD000000000000023, (void *)0x8000000100011590, &qword_10001CE58, &qword_10001CE60);
}

void sub_100009510(uint64_t a1)
{
  sub_100009588(a1, 0xD00000000000001FLL, (void *)0x8000000100011540, &qword_10001CE68, &qword_10001CE70);
}

void sub_100009538(uint64_t a1)
{
  sub_100009588(a1, 0xD00000000000001CLL, (void *)0x80000001000114E0, &qword_10001CE78, &qword_10001CE80);
}

void sub_100009560(uint64_t a1)
{
  sub_100009588(a1, 0xD000000000000025, (void *)0x8000000100011560, &qword_10001CE88, &qword_10001CE90);
}

void sub_100009588(uint64_t a1, uint64_t a2, void *a3, uint64_t *a4, _QWORD *a5)
{
  Swift::String v9;
  uint64_t v10;
  uint64_t v11;

  if (qword_10001C208 != -1)
    swift_once(&qword_10001C208, sub_1000094C0);
  v10 = qword_10001CE48;
  v11 = unk_10001CE50;
  swift_bridgeObjectRetain(unk_10001CE50);
  v9._countAndFlagsBits = a2;
  v9._object = a3;
  String.append(_:)(v9);
  *a4 = v10;
  *a5 = v11;
}

ValueMetadata *type metadata accessor for StereoRecordingWidget()
{
  return &type metadata for StereoRecordingWidget;
}

uint64_t sub_100009630(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100016480, 1);
}

uint64_t sub_100009640@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t KeyPath;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t OpaqueTypeConformance2;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v36 = a1;
  v1 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v1);
  v3 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100004E7C(&qword_10001C7F8);
  v31 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = sub_100004E7C(&qword_10001C800);
  v32 = *(_QWORD *)(v34 - 8);
  __chkstk_darwin(v34);
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = sub_100004E7C(&qword_10001C808);
  v33 = *(_QWORD *)(v35 - 8);
  __chkstk_darwin(v35);
  v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(&unk_1000133A8);
  v12 = sub_100004E7C(&qword_10001C7A0);
  v13 = sub_100009A88();
  v14 = sub_100005564(&qword_10001C7B8, &qword_10001C7A0, (uint64_t)&protocol conformance descriptor for Label<A, B>);
  ControlToggle.init<A, B, C, D, E, F, G>(kind:intentUpdatableProperty:title:subtitle:value:)(0xD000000000000019, 0x80000001000115C0, KeyPath, sub_100009998, 0, sub_100008F24, 0, sub_1000099E4, 0, v12, &type metadata for Text, &type metadata for Text, v13, v14, &protocol witness table for Text, &protocol witness table for Text);
  if (qword_10001C250 != -1)
    swift_once(&qword_10001C250, sub_10000A89C);
  v15 = type metadata accessor for TypeDisplayRepresentation(0);
  v16 = sub_1000054F8(v15, (uint64_t)qword_10001CEF8);
  v17 = swift_beginAccess(v16, &v37, 32, 0);
  TypeDisplayRepresentation.name.getter(v17);
  swift_endAccess(&v37);
  v18 = Text.init(_:)(v3);
  v20 = v19;
  v22 = v21;
  v24 = v23 & 1;
  v25 = sub_100005564(&qword_10001C818, &qword_10001C7F8, (uint64_t)&protocol conformance descriptor for ControlToggle<A>);
  WidgetConfiguration.configurationDisplayName(_:)(v18, v20, v24, v22, v4, v25);
  sub_100009298(v18, v20, v24);
  swift_bridgeObjectRelease(v22);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v6, v4);
  v37 = v4;
  v38 = v25;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v37, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v27 = v34;
  WidgetConfiguration.disablesControlStateCaching()(v34, OpaqueTypeConformance2);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v8, v27);
  v37 = v27;
  v38 = OpaqueTypeConformance2;
  v28 = swift_getOpaqueTypeConformance2(&v37, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v29 = v35;
  WidgetConfiguration.hiddenControl()(v35, v28);
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v10, v29);
}

uint64_t sub_100009998()
{
  uint64_t v0;

  v0 = LocalizedStringKey.init(stringLiteral:)(0xD00000000000001DLL, 0x80000001000115E0);
  return Label<>.init(_:systemImage:)(v0);
}

uint64_t sub_1000099E4@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char v7;
  uint64_t v8;

  if ((a1 & 1) != 0)
    v3 = 0xEB000000004E4F5FLL;
  else
    v3 = 0xEC00000046464F5FLL;
  v4 = LocalizedStringKey.init(stringLiteral:)(0x53474E4954544553, v3);
  result = Text.init(_:tableName:bundle:comment:)(v4);
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v6;
  *(_BYTE *)(a2 + 16) = v7 & 1;
  *(_QWORD *)(a2 + 24) = v8;
  return result;
}

unint64_t sub_100009A88()
{
  unint64_t result;

  result = qword_10001C810;
  if (!qword_10001C810)
  {
    result = swift_getWitnessTable(&unk_100013830, &type metadata for StereoRecordingEntity);
    atomic_store(result, (unint64_t *)&qword_10001C810);
  }
  return result;
}

uint64_t sub_100009ACC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t OpaqueTypeConformance2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v0 = sub_100002498(&qword_10001C808);
  v1 = sub_100002498(&qword_10001C800);
  v5 = sub_100002498(&qword_10001C7F8);
  v6 = sub_100005564(&qword_10001C818, &qword_10001C7F8, (uint64_t)&protocol conformance descriptor for ControlToggle<A>);
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v5 = v1;
  v6 = OpaqueTypeConformance2;
  v3 = swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v5 = v0;
  v6 = v3;
  return swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of WidgetConfiguration.hiddenControl()>>, 1);
}

ValueMetadata *type metadata accessor for AudioQualityWidget()
{
  return &type metadata for AudioQualityWidget;
}

uint64_t sub_100009B98(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000164C4, 1);
}

uint64_t sub_100009BA8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  uint64_t KeyPath;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t OpaqueTypeConformance2;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v60 = a1;
  v1 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v1);
  v59 = (char *)&v48 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for ControlSize(0);
  __chkstk_darwin(v3);
  v5 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Locale(0);
  __chkstk_darwin(v6);
  v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v9);
  v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = sub_100004E7C(&qword_10001C788);
  v52 = *(_QWORD *)(v55 - 8);
  __chkstk_darwin(v55);
  v13 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = sub_100004E7C(&qword_10001C790);
  v54 = *(_QWORD *)(v57 - 8);
  __chkstk_darwin(v57);
  v51 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = sub_100004E7C(&qword_10001C798);
  v56 = *(_QWORD *)(v58 - 8);
  __chkstk_darwin(v58);
  v53 = (char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000013, 0x8000000100011620);
  static Locale.current.getter(v16);
  v49 = String.init(localized:table:bundle:locale:comment:)(v11, 0, 0, 0, v8, 0, 0, 256);
  v18 = v17;
  KeyPath = swift_getKeyPath(&unk_100013428);
  static ControlSize._1x1.getter();
  v20 = sub_100004E7C(&qword_10001C7A0);
  v21 = sub_100004E7C(&qword_10001C7A8);
  v22 = sub_10000A30C();
  v23 = sub_10000A350();
  v24 = sub_10000A394();
  v25 = sub_100005564(&qword_10001C7B8, &qword_10001C7A0, (uint64_t)&protocol conformance descriptor for Label<A, B>);
  v26 = sub_10000923C();
  v50 = v13;
  ControlPicker.init<A, B, C, D, E, F, G, H>(kind:displayName:preferredSize:intentUpdatableProperty:title:subtitle:value:affordances:)(0xD000000000000016, 0x8000000100011600, v49, v18, v5, KeyPath, sub_10000A060, 0, sub_100008F24, 0, sub_10000A0AC, 0, 0, 0, v20, &type metadata for Text, v21, v22, v23,
    v24,
    v25,
    &protocol witness table for Text,
    v26);
  if (qword_10001C298 != -1)
    swift_once(&qword_10001C298, sub_10000D280);
  v27 = type metadata accessor for TypeDisplayRepresentation(0);
  v28 = sub_1000054F8(v27, (uint64_t)qword_10001CF90);
  v29 = swift_beginAccess(v28, &v61, 32, 0);
  v30 = v59;
  TypeDisplayRepresentation.name.getter(v29);
  swift_endAccess(&v61);
  v31 = Text.init(_:)(v30);
  v33 = v32;
  v35 = v34;
  v37 = v36 & 1;
  v38 = sub_100005564(&qword_10001C7C8, &qword_10001C788, (uint64_t)&protocol conformance descriptor for ControlPicker<A>);
  v39 = v50;
  v40 = v51;
  v41 = v55;
  WidgetConfiguration.configurationDisplayName(_:)(v31, v33, v37, v35, v55, v38);
  sub_100009298(v31, v33, v37);
  swift_bridgeObjectRelease(v35);
  (*(void (**)(char *, uint64_t))(v52 + 8))(v39, v41);
  v61 = v41;
  v62 = v38;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v61, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v43 = v53;
  v44 = v57;
  WidgetConfiguration.disablesControlStateCaching()(v57, OpaqueTypeConformance2);
  (*(void (**)(char *, uint64_t))(v54 + 8))(v40, v44);
  v61 = v44;
  v62 = OpaqueTypeConformance2;
  v45 = swift_getOpaqueTypeConformance2(&v61, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v46 = v58;
  WidgetConfiguration.hiddenControl()(v58, v45);
  return (*(uint64_t (**)(char *, uint64_t))(v56 + 8))(v43, v46);
}

uint64_t sub_10000A060()
{
  uint64_t v0;

  v0 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000013, 0x8000000100011620);
  return Label<>.init(_:systemImage:)(v0);
}

uint64_t sub_10000A0AC@<X0>(char *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char v17;
  unint64_t v18;
  unint64_t v19;
  char v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t result;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  char *v38;
  uint64_t v39;

  v4 = sub_100004E7C(&qword_10001C7D0);
  __chkstk_darwin(v4);
  v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for LocalizedStringResource(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v9);
  v14 = (char *)&v38 - v13;
  __chkstk_darwin(v12);
  v16 = (char *)&v38 - v15;
  v17 = *a1;
  v18 = sub_10000FD68();
  if (*(_QWORD *)(v18 + 16) && (v19 = sub_10000F8E0(v17), (v20 & 1) != 0))
  {
    v21 = v19;
    v38 = v14;
    v22 = v11;
    v23 = *(_QWORD *)(v18 + 56);
    v24 = type metadata accessor for DisplayRepresentation(0);
    v39 = v8;
    v25 = v7;
    v26 = *(_QWORD *)(v24 - 8);
    v27 = v23 + *(_QWORD *)(v26 + 72) * v21;
    v11 = v22;
    v14 = v38;
    (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v6, v27, v24);
    v28 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56);
    v7 = v25;
    v8 = v39;
    v28(v6, 0, 1, v24);
  }
  else
  {
    v24 = type metadata accessor for DisplayRepresentation(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v6, 1, 1, v24);
  }
  swift_bridgeObjectRelease(v18);
  type metadata accessor for DisplayRepresentation(0);
  v29 = *(_QWORD *)(v24 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v6, 1, v24) == 1)
  {
    result = sub_1000092A8((uint64_t)v6);
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
  }
  else
  {
    DisplayRepresentation.title.getter();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v6, v24);
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v16, v14, v7);
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v16, v7);
    v31 = Text.init(_:)(v11);
    v32 = v35;
    v34 = v36;
    v33 = v37 & 1;
    result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v16, v7);
  }
  *a2 = v31;
  a2[1] = v32;
  a2[2] = v33;
  a2[3] = v34;
  return result;
}

unint64_t sub_10000A30C()
{
  unint64_t result;

  result = qword_10001C820;
  if (!qword_10001C820)
  {
    result = swift_getWitnessTable(&unk_1000140C4, &type metadata for AudioQualityEntity.IntentAudioQuality);
    atomic_store(result, (unint64_t *)&qword_10001C820);
  }
  return result;
}

unint64_t sub_10000A350()
{
  unint64_t result;

  result = qword_10001C828;
  if (!qword_10001C828)
  {
    result = swift_getWitnessTable(&unk_100014104, &type metadata for AudioQualityEntity.IntentAudioQuality);
    atomic_store(result, (unint64_t *)&qword_10001C828);
  }
  return result;
}

unint64_t sub_10000A394()
{
  unint64_t result;

  result = qword_10001C830;
  if (!qword_10001C830)
  {
    result = swift_getWitnessTable(&unk_100014344, &type metadata for AudioQualityEntity);
    atomic_store(result, (unint64_t *)&qword_10001C830);
  }
  return result;
}

uint64_t sub_10000A3D8(uint64_t a1)
{
  return sub_10000A408(a1, qword_10001CE98);
}

uint64_t sub_10000A3E4(uint64_t a1)
{
  return sub_10000A408(a1, qword_10001CEB0);
}

uint64_t sub_10000A3F0(uint64_t a1)
{
  return sub_10000A408(a1, qword_10001CEC8);
}

uint64_t sub_10000A3FC(uint64_t a1)
{
  return sub_10000A408(a1, qword_10001CEE0);
}

uint64_t sub_10000A408(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = type metadata accessor for IntentAuthenticationPolicy(0);
  sub_100005510(v3, a2);
  v4 = sub_1000054F8(v3, (uint64_t)a2);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(v4, enum case for IntentAuthenticationPolicy.requiresAuthentication(_:), v3);
}

ValueMetadata *type metadata accessor for LocationBasedNamingWidget()
{
  return &type metadata for LocationBasedNamingWidget;
}

uint64_t sub_10000A46C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100016508, 1);
}

uint64_t sub_10000A47C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t KeyPath;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t OpaqueTypeConformance2;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v36 = a1;
  v1 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v1);
  v3 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100004E7C(&qword_10001C7F8);
  v31 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = sub_100004E7C(&qword_10001C800);
  v32 = *(_QWORD *)(v34 - 8);
  __chkstk_darwin(v34);
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = sub_100004E7C(&qword_10001C808);
  v33 = *(_QWORD *)(v35 - 8);
  __chkstk_darwin(v35);
  v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(&unk_1000134B0);
  v12 = sub_100004E7C(&qword_10001C7A0);
  v13 = sub_10000364C();
  v14 = sub_100005564(&qword_10001C7B8, &qword_10001C7A0, (uint64_t)&protocol conformance descriptor for Label<A, B>);
  ControlToggle.init<A, B, C, D, E, F, G>(kind:intentUpdatableProperty:title:subtitle:value:)(0xD00000000000001DLL, 0x8000000100011640, KeyPath, sub_10000A7D4, 0, sub_100008F24, 0, sub_1000099E4, 0, v12, &type metadata for Text, &type metadata for Text, v13, v14, &protocol witness table for Text, &protocol witness table for Text);
  if (qword_10001C170 != -1)
    swift_once(&qword_10001C170, sub_1000024DC);
  v15 = type metadata accessor for TypeDisplayRepresentation(0);
  v16 = sub_1000054F8(v15, (uint64_t)qword_10001CD00);
  v17 = swift_beginAccess(v16, &v37, 32, 0);
  TypeDisplayRepresentation.name.getter(v17);
  swift_endAccess(&v37);
  v18 = Text.init(_:)(v3);
  v20 = v19;
  v22 = v21;
  v24 = v23 & 1;
  v25 = sub_100005564(&qword_10001C818, &qword_10001C7F8, (uint64_t)&protocol conformance descriptor for ControlToggle<A>);
  WidgetConfiguration.configurationDisplayName(_:)(v18, v20, v24, v22, v4, v25);
  sub_100009298(v18, v20, v24);
  swift_bridgeObjectRelease(v22);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v6, v4);
  v37 = v4;
  v38 = v25;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v37, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v27 = v34;
  WidgetConfiguration.disablesControlStateCaching()(v34, OpaqueTypeConformance2);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v8, v27);
  v37 = v27;
  v38 = OpaqueTypeConformance2;
  v28 = swift_getOpaqueTypeConformance2(&v37, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v29 = v35;
  WidgetConfiguration.hiddenControl()(v35, v28);
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v10, v29);
}

uint64_t sub_10000A7D4()
{
  uint64_t v0;

  v0 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000022, 0x8000000100011660);
  return Label<>.init(_:systemImage:)(v0);
}

unint64_t sub_10000A82C()
{
  unint64_t result;

  result = qword_10001C838;
  if (!qword_10001C838)
  {
    result = swift_getWitnessTable(&unk_100013590, &type metadata for StereoRecordingEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10001C838);
  }
  return result;
}

uint64_t sub_10000A870()
{
  return sub_100005564(&qword_10001C840, &qword_10001C848, (uint64_t)&protocol conformance descriptor for _IntentUpdatableEntityProperty<A, B, C>);
}

uint64_t sub_10000A89C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v0 = sub_100004E7C(&qword_10001C488);
  __chkstk_darwin(v0);
  v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for LocalizedStringResource(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_100005510(v7, qword_10001CEF8);
  sub_1000054F8(v7, (uint64_t)qword_10001CEF8);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000018, 0x80000001000117C0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v6, v2);
}

uint64_t sub_10000A9AC()
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
  uint64_t v15;

  v0 = sub_100004E7C(&qword_10001C4B8);
  __chkstk_darwin(v0);
  v2 = (char *)&v15 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_100004E7C(&qword_10001C488);
  __chkstk_darwin(v3);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for LocalizedStringResource(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v15 - v11;
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000018, 0x80000001000117C0);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000019, 0x80000001000117E0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  DisplayRepresentation.Image.init(appBundleIdentifier:)(0xD000000000000014, 0x80000001000110B0);
  v13 = type metadata accessor for DisplayRepresentation.Image(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v2, 0, 1, v13);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000021, 0x8000000100011800);
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v12, v5, v2, &_swiftEmptyArrayStorage, v10);
}

uint64_t sub_10000AB80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v0 = sub_100004E7C(&qword_10001C9B8);
  sub_100005510(v0, qword_10001CF10);
  sub_1000054F8(v0, (uint64_t)qword_10001CF10);
  if (qword_10001C218 != -1)
    swift_once(&qword_10001C218, sub_100009510);
  v1 = qword_10001CE68;
  v2 = qword_10001CE70;
  v3 = sub_10000B9D0();
  swift_bridgeObjectRetain(v2);
  return _EntityURLRepresentation.init(_:)(v1, v2, &type metadata for StereoRecordingEntity, v3);
}

uint64_t sub_10000AC30(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_10000AC48, 0, 0);
}

uint64_t sub_10000AC48()
{
  uint64_t v0;
  id v1;
  NSString v2;
  id v3;
  unsigned __int8 v4;

  v1 = objc_allocWithZone((Class)NSUserDefaults);
  v2 = String._bridgeToObjectiveC()();
  v3 = objc_msgSend(v1, "initWithSuiteName:", v2);

  if (v3)
  {
    v4 = objc_msgSend(v3, "rc_useStereoRecording");

  }
  else
  {
    v4 = 0;
  }
  **(_BYTE **)(v0 + 16) = v4;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000ACEC(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + 16) = *a2;
  return swift_task_switch(sub_10000AD08, 0, 0);
}

uint64_t sub_10000AD08()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  NSString v3;
  id v4;

  v1 = *(unsigned __int8 *)(v0 + 16);
  v2 = objc_allocWithZone((Class)NSUserDefaults);
  v3 = String._bridgeToObjectiveC()();
  v4 = objc_msgSend(v2, "initWithSuiteName:", v3);

  objc_msgSend(v4, "rc_setUseStereoRecording:", v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000ADA4(uint64_t a1)
{
  return sub_100004258(a1, qword_10001CF28, 0xD000000000000036, 0x80000001000118B0);
}

uint64_t sub_10000ADC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_100004E7C(&qword_10001C520);
  sub_100005510(v0, qword_10001CF40);
  v1 = sub_1000054F8(v0, (uint64_t)qword_10001CF40);
  IntentDescription.init(stringLiteral:)(0xD000000000000023, 0x8000000100011880);
  v2 = type metadata accessor for IntentDescription(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 0, 1, v2);
}

uint64_t sub_10000AE50()
{
  uint64_t result;

  result = swift_getKeyPath(&unk_100013CF0);
  qword_10001CF58 = result;
  return result;
}

uint64_t sub_10000AE74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  v4 = sub_100004E7C(&qword_10001C4F0);
  v3[9] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100004E7C(&qword_10001C4F8);
  v3[10] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100004E7C(&qword_10001C9E8);
  v3[11] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v6 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for IntentDialog(0);
  v3[12] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v3[13] = v8;
  v3[14] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100004E7C(&qword_10001C9F0);
  v3[15] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v3[16] = v10;
  v11 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3[17] = swift_task_alloc(v11);
  v3[18] = swift_task_alloc(v11);
  return swift_task_switch(sub_10000AF80, 0, 0);
}

uint64_t sub_10000AF80()
{
  _QWORD *v0;
  _QWORD *v1;
  unint64_t v2;

  IntentParameter.wrappedValue.getter(v0 + 2);
  v1 = (_QWORD *)swift_task_alloc(async function pointer to IntentDialog._CapturedContent.init<>(entity:_:)[1]);
  v0[19] = v1;
  v2 = sub_10000B9D0();
  *v1 = v0;
  v1[1] = sub_10000B000;
  return IntentDialog._CapturedContent.init<>(entity:_:)(v0[18], v0 + 2, sub_10000B390, 0, &type metadata for StereoRecordingEntity, v2);
}

uint64_t sub_10000B000()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 152));
  return swift_task_switch(sub_10000B054, 0, 0);
}

uint64_t sub_10000B054()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 24));
  v1 = *(_QWORD *)(v0 + 24);
  *(_QWORD *)(v0 + 32) = v1;
  *(_QWORD *)(v0 + 160) = v1;
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 192));
  *(_BYTE *)(v0 + 193) = *(_BYTE *)(v0 + 192);
  if (qword_10001C270 != -1)
    swift_once(&qword_10001C270, sub_10000AE50);
  v2 = qword_10001CF58;
  *(_QWORD *)(v0 + 168) = qword_10001CF58;
  v3 = async function pointer to AppEntity._setValue<A, B, C>(_:for:)[1];
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  *(_QWORD *)(v0 + 176) = v4;
  v5 = sub_100005564(&qword_10001C9D0, &qword_10001C9D8, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *v4 = v0;
  v4[1] = sub_10000B150;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for Bool, v5);
}

uint64_t sub_10000B150()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 168);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 176);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 160);
  *(_QWORD *)(*(_QWORD *)v1 + 184) = v0;
  swift_task_dealloc(v2);
  swift_release(v3);
  swift_release(v4);
  if (v0)
    v5 = sub_100003018;
  else
    v5 = sub_10000B1D0;
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_10000B1D0()
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
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 128);
  v13 = *(_QWORD *)(v0 + 120);
  v4 = *(_QWORD *)(v0 + 112);
  v5 = *(_QWORD *)(v0 + 88);
  v14 = *(_QWORD *)(v0 + 104);
  v15 = *(_QWORD *)(v0 + 96);
  v6 = *(_QWORD *)(v0 + 72);
  v7 = *(_QWORD *)(v0 + 80);
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 40));
  v8 = type metadata accessor for _GeneratedContentOptions(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = type metadata accessor for _GeneratedContentFallback(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = sub_10000A82C();
  v11 = sub_10000BB34();
  IntentDialog._GeneratedDialogContent.init(fromResult:options:fallbackDialog:)(sub_10000B390, 0, v7, v6, &type metadata for StereoRecordingEntity.UpdateIntent_value);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v13);
  IntentDialog.init<A, B>(from:capturedContent:)(v5, v1, &type metadata for StereoRecordingEntity.UpdateIntent_value, &type metadata for StereoRecordingEntity, v10, v11);
  static IntentResult.result<A>(value:dialog:)(v0 + 40, v4, &type metadata for StereoRecordingEntity, v11);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v4, v15);
  swift_release(*(_QWORD *)(v0 + 40));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v13);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v7);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000B394()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v0 = sub_100004E7C(&qword_10001C9F8);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10001C270 != -1)
    swift_once(&qword_10001C270, sub_10000AE50);
  v4 = qword_10001CF58;
  v5 = swift_retain(qword_10001CF58);
  static _DialogBuilderEntity.buildExpression<A, B>(_:)(v5);
  swift_release(v4);
  v6 = sub_10000BB34();
  v7 = sub_100005564(&qword_10001CA00, &qword_10001C9F8, (uint64_t)&protocol conformance descriptor for _NLGRepresentationEntity<A>);
  static _DialogBuilderEntity.buildBlock<A>(_:)(v3, &type metadata for StereoRecordingEntity, v0, v6, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_10000B49C()
{
  if (qword_10001C270 != -1)
    swift_once(&qword_10001C270, sub_10000AE50);
  return swift_retain(qword_10001CF58);
}

unint64_t sub_10000B4E0()
{
  unint64_t result;

  result = qword_10001C850;
  if (!qword_10001C850)
  {
    result = swift_getWitnessTable(&unk_100013620, &type metadata for StereoRecordingEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10001C850);
  }
  return result;
}

unint64_t sub_10000B528()
{
  unint64_t result;

  result = qword_10001C858;
  if (!qword_10001C858)
  {
    result = swift_getWitnessTable(&unk_100013648, &type metadata for StereoRecordingEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10001C858);
  }
  return result;
}

uint64_t sub_10000B56C(uint64_t a1)
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2(a1, &unk_1000165BC, 1) + 8);
}

uint64_t sub_10000B590(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100004464(a1, a2, a3, (uint64_t (*)(void))sub_10000A82C);
}

uint64_t sub_10000B59C@<X0>(uint64_t a1@<X8>)
{
  return sub_100003484(&qword_10001C260, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10001CF28, (uint64_t)sub_10000ADA4, a1);
}

uint64_t sub_10000B5C0@<X0>(uint64_t a1@<X8>)
{
  return sub_100003484(&qword_10001C238, (uint64_t (*)(_QWORD))&type metadata accessor for IntentAuthenticationPolicy, (uint64_t)qword_10001CEB0, (uint64_t)sub_10000A3E4, a1);
}

uint64_t sub_10000B5E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10001C268 != -1)
    swift_once(&qword_10001C268, sub_10000ADC8);
  v2 = sub_100004E7C(&qword_10001C520);
  v3 = sub_1000054F8(v2, (uint64_t)qword_10001CF40);
  return sub_1000055A4(v3, a1);
}

uint64_t sub_10000B644(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *v1;
  v4 = v1[1];
  v6 = (_QWORD *)swift_task_alloc(dword_10001C9E4);
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_1000055EC;
  return sub_10000AE74(a1, v5, v4);
}

uint64_t sub_10000B6A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_10000CB9C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_10000B6CC()
{
  return 0xD000000000000026;
}

unint64_t sub_10000B6EC()
{
  unint64_t result;

  result = qword_10001C868;
  if (!qword_10001C868)
  {
    result = swift_getWitnessTable(&unk_1000136A4, &type metadata for StereoRecordingEntity.StereoRecordingEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10001C868);
  }
  return result;
}

uint64_t sub_10000B734()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v0 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v0);
  v2 = (char *)&v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004E7C(&qword_10001C848);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000016, 0x8000000100011830);
  v3 = sub_100005564(&qword_10001C9D0, &qword_10001C9D8, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  result = _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)(v2, &unk_10001C9C0, 0, &unk_10001C9C8, 0, &type metadata for StereoRecordingEntity.UpdateIntent_value, v3);
  qword_10001CF60 = result;
  return result;
}

uint64_t sub_10000B804(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_10000B81C, 0, 0);
}

uint64_t sub_10000B81C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v3)(void);

  if (qword_10001C278 != -1)
    swift_once(&qword_10001C278, sub_10000B734);
  v1 = qword_10001CF60;
  **(_QWORD **)(v0 + 16) = qword_10001CF60;
  v3 = *(uint64_t (**)(void))(v0 + 8);
  swift_retain(v1);
  return v3();
}

unint64_t sub_10000B890()
{
  unint64_t result;

  result = qword_10001C878;
  if (!qword_10001C878)
  {
    result = swift_getWitnessTable(&unk_1000136DC, &type metadata for StereoRecordingEntity.StereoRecordingEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10001C878);
  }
  return result;
}

uint64_t sub_10000B8D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.allEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_10000BD28();
  *v4 = v2;
  v4[1] = sub_100003898;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_10000B940()
{
  unint64_t result;

  result = qword_10001C888;
  if (!qword_10001C888)
  {
    result = swift_getWitnessTable(&unk_100013734, &type metadata for StereoRecordingEntity.StereoRecordingEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10001C888);
  }
  return result;
}

unint64_t sub_10000B988()
{
  unint64_t result;

  result = qword_10001C890;
  if (!qword_10001C890)
  {
    result = swift_getWitnessTable(&unk_100013794, &type metadata for StereoRecordingEntity.StereoRecordingEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10001C890);
  }
  return result;
}

unint64_t sub_10000B9D0()
{
  unint64_t result;

  result = qword_10001C898[0];
  if (!qword_10001C898[0])
  {
    result = swift_getWitnessTable(&unk_1000137D8, &type metadata for StereoRecordingEntity);
    atomic_store(result, qword_10001C898);
  }
  return result;
}

uint64_t sub_10000BA14(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.entities(for:)[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_10000BD28();
  *v5 = v2;
  v5[1] = sub_100003A40;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_10000BA80(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.suggestedEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_10000BD28();
  *v4 = v2;
  v4[1] = sub_1000055F0;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_10000BAEC()
{
  unint64_t result;

  result = qword_10001C8B0;
  if (!qword_10001C8B0)
  {
    result = swift_getWitnessTable(&unk_1000137BC, &type metadata for StereoRecordingEntity.StereoRecordingEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10001C8B0);
  }
  return result;
}

unint64_t sub_10000BB34()
{
  unint64_t result;

  result = qword_10001C8B8;
  if (!qword_10001C8B8)
  {
    result = swift_getWitnessTable(&unk_1000139B0, &type metadata for StereoRecordingEntity);
    atomic_store(result, (unint64_t *)&qword_10001C8B8);
  }
  return result;
}

unint64_t sub_10000BB7C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001C8C0;
  if (!qword_10001C8C0)
  {
    v1 = sub_100002498(qword_10001C8C8);
    sub_10000BB34();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_10001C8C0);
  }
  return result;
}

uint64_t sub_10000BBE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_10000B890();
  *v5 = v2;
  v5[1] = sub_100003C60;
  return EntityQuery.results()(a1, a2, v6);
}

unint64_t sub_10000BC50()
{
  unint64_t result;

  result = qword_10001C8E0;
  if (!qword_10001C8E0)
  {
    result = swift_getWitnessTable(&unk_100013898, &type metadata for StereoRecordingEntity);
    atomic_store(result, (unint64_t *)&qword_10001C8E0);
  }
  return result;
}

unint64_t sub_10000BC98()
{
  unint64_t result;

  result = qword_10001C8E8;
  if (!qword_10001C8E8)
  {
    result = swift_getWitnessTable(&unk_1000138D0, &type metadata for StereoRecordingEntity);
    atomic_store(result, (unint64_t *)&qword_10001C8E8);
  }
  return result;
}

unint64_t sub_10000BCE0()
{
  unint64_t result;

  result = qword_10001C8F0;
  if (!qword_10001C8F0)
  {
    result = swift_getWitnessTable(&unk_100013900, &type metadata for StereoRecordingEntity);
    atomic_store(result, (unint64_t *)&qword_10001C8F0);
  }
  return result;
}

unint64_t sub_10000BD28()
{
  unint64_t result;

  result = qword_10001C8F8;
  if (!qword_10001C8F8)
  {
    result = swift_getWitnessTable(&unk_100013664, &type metadata for StereoRecordingEntity.StereoRecordingEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10001C8F8);
  }
  return result;
}

unint64_t sub_10000BD70()
{
  unint64_t result;

  result = qword_10001C900;
  if (!qword_10001C900)
  {
    result = swift_getWitnessTable(&unk_100013938, &type metadata for StereoRecordingEntity);
    atomic_store(result, (unint64_t *)&qword_10001C900);
  }
  return result;
}

uint64_t sub_10000BDB4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10001C258 != -1)
    swift_once(&qword_10001C258, sub_10000AB80);
  v2 = sub_100004E7C(&qword_10001C9B8);
  v3 = sub_1000054F8(v2, (uint64_t)qword_10001CF10);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

unint64_t sub_10000BE2C()
{
  unint64_t result;

  result = qword_10001C908;
  if (!qword_10001C908)
  {
    result = swift_getWitnessTable(&unk_100013960, &type metadata for StereoRecordingEntity);
    atomic_store(result, (unint64_t *)&qword_10001C908);
  }
  return result;
}

unint64_t sub_10000BE74()
{
  unint64_t result;

  result = qword_10001C910;
  if (!qword_10001C910)
  {
    result = swift_getWitnessTable(&unk_100013988, &type metadata for StereoRecordingEntity);
    atomic_store(result, (unint64_t *)&qword_10001C910);
  }
  return result;
}

unint64_t sub_10000BEBC()
{
  unint64_t result;

  result = qword_10001C918;
  if (!qword_10001C918)
  {
    result = swift_getWitnessTable(&unk_100013A08, &type metadata for StereoRecordingEntity);
    atomic_store(result, (unint64_t *)&qword_10001C918);
  }
  return result;
}

uint64_t sub_10000BF00@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v4;
  uint64_t result;
  uint64_t v6;

  v4 = sub_100009A88();
  result = _UniqueEntity.id.getter(a1, v4);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_10000BF3C(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_10000D1BC();
  v4 = _URLRepresentableEntity.urlRepresentationParameter.getter(a1, v3);
  return sub_100005550(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8), v1, v4, v5);
}

uint64_t sub_10000BF84@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE v5[24];

  if (qword_10001C250 != -1)
    swift_once(&qword_10001C250, sub_10000A89C);
  v2 = type metadata accessor for TypeDisplayRepresentation(0);
  v3 = sub_1000054F8(v2, (uint64_t)qword_10001CEF8);
  swift_beginAccess(v3, v5, 0, 0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_10000C01C()
{
  return sub_100005564(&qword_10001C928, &qword_10001C930, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_10000C048(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000B9D0();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000C084()
{
  unint64_t result;

  result = qword_10001C938;
  if (!qword_10001C938)
  {
    result = swift_getWitnessTable(&unk_100013A38, &type metadata for StereoRecordingEntity);
    atomic_store(result, (unint64_t *)&qword_10001C938);
  }
  return result;
}

uint64_t sub_10000C0CC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000BEBC();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_10000C108()
{
  unint64_t result;

  result = qword_10001C940;
  if (!qword_10001C940)
  {
    result = swift_getWitnessTable(&unk_100013AF0, &type metadata for OpenStereoRecordingEntity);
    atomic_store(result, (unint64_t *)&qword_10001C940);
  }
  return result;
}

uint64_t sub_10000C14C(uint64_t a1)
{
  return sub_100004258(a1, qword_10001CF68, 0xD00000000000001BLL, 0x80000001000117A0);
}

unint64_t sub_10000C174()
{
  unint64_t result;

  result = qword_10001C948;
  if (!qword_10001C948)
  {
    result = swift_getWitnessTable(&unk_100013B18, &type metadata for OpenStereoRecordingEntity);
    atomic_store(result, (unint64_t *)&qword_10001C948);
  }
  return result;
}

uint64_t sub_10000C1B8(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;

  v4 = sub_10000D134();
  v5 = sub_10000D1BC();
  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_10000C210()
{
  unint64_t result;

  result = qword_10001C950;
  if (!qword_10001C950)
  {
    result = swift_getWitnessTable(&unk_100013BA8, &type metadata for OpenStereoRecordingEntity);
    atomic_store(result, (unint64_t *)&qword_10001C950);
  }
  return result;
}

unint64_t sub_10000C258()
{
  unint64_t result;

  result = qword_10001C958;
  if (!qword_10001C958)
  {
    result = swift_getWitnessTable(&unk_100013BD0, &type metadata for OpenStereoRecordingEntity);
    atomic_store(result, (unint64_t *)&qword_10001C958);
  }
  return result;
}

uint64_t sub_10000C29C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100004464(a1, a2, a3, (uint64_t (*)(void))sub_10000C174);
}

uint64_t sub_10000C2A8@<X0>(uint64_t a1@<X8>)
{
  return sub_100003484(&qword_10001C280, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10001CF68, (uint64_t)sub_10000C14C, a1);
}

uint64_t sub_10000C2CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to _URLRepresentableIntent<>.perform()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_10000D134();
  v7 = sub_10000D178();
  v8 = sub_10000D1BC();
  *v5 = v2;
  v5[1] = sub_10000456C;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_10000C358@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_10000CF2C();
  *a1 = result;
  return result;
}

uint64_t sub_10000C37C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000C174();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_10000C3A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t result;
  _QWORD v6[2];

  v0 = sub_100004E7C(&qword_10001C440);
  v1 = type metadata accessor for _AssistantIntent(0);
  v2 = swift_allocObject(v0, ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v1 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) | 7);
  *(_OWORD *)(v2 + 16) = xmmword_100011E20;
  v6[0] = sub_10000CB9C();
  v6[1] = v3;
  v4 = sub_10000A82C();
  result = _AssistantIntent.init<A>(_:phrases:parameterValues:)(v6, sub_10000C458, 0, sub_10000C998, 0, &type metadata for StereoRecordingEntity.UpdateIntent_value, v4);
  qword_10001CF80 = v2;
  return result;
}

uint64_t sub_10000C458(uint64_t a1)
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
  Swift::String v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  Swift::String v20;
  Swift::String v21;
  uint64_t v22;
  uint64_t v23;
  Swift::String v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  Swift::String v28;
  uint64_t v29;
  Swift::String v30;
  uint64_t v31;
  uint64_t v32;
  Swift::String v33;
  Swift::String v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  void (*v42)(char *, uint64_t);
  void (*v43)(char *);
  unsigned int v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  void (*v54)(char *, uint64_t);

  v2 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v49 = *(_QWORD *)(v2 - 8);
  v50 = v2;
  __chkstk_darwin(v2);
  v48 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = sub_100004E7C(&qword_10001C980);
  v4 = *(_QWORD *)(v53 - 8);
  __chkstk_darwin(v53);
  v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100004E7C(&qword_10001C988);
  __chkstk_darwin(v7);
  v9 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_10000A82C();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(22, 1, &type metadata for StereoRecordingEntity.UpdateIntent_value, v10);
  v11._countAndFlagsBits = 0x206E727554;
  v11._object = (void *)0xE500000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v11);
  KeyPath = swift_getKeyPath(&unk_100013CC8);
  v52 = sub_1000051E0();
  v41 = a1;
  v13 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v52);
  swift_release(KeyPath);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v13, v7);
  swift_release(v13);
  v14._countAndFlagsBits = 0xD000000000000011;
  v14._object = (void *)0x8000000100011690;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v14);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for StereoRecordingEntity.UpdateIntent_value, v10);
  v51 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v6, &type metadata for StereoRecordingEntity.UpdateIntent_value, v10);
  v54 = *(void (**)(char *, uint64_t))(v4 + 8);
  v15 = v53;
  v54(v6, v53);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(17, 1, &type metadata for StereoRecordingEntity.UpdateIntent_value, v10);
  v16._countAndFlagsBits = 0;
  v16._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v16);
  v17 = swift_getKeyPath(&unk_100013CC8);
  v18 = v52;
  v19 = _AssistantIntent.IntentProjection.subscript.getter(v17, v52);
  swift_release(v17);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v19, v7);
  swift_release(v19);
  v20._countAndFlagsBits = 0xD000000000000011;
  v20._object = (void *)0x8000000100011690;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v20);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for StereoRecordingEntity.UpdateIntent_value, v10);
  v47 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v6, &type metadata for StereoRecordingEntity.UpdateIntent_value, v10);
  v54(v6, v15);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(26, 2, &type metadata for StereoRecordingEntity.UpdateIntent_value, v10);
  v21._countAndFlagsBits = 0x206E727554;
  v21._object = (void *)0xE500000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v21);
  v22 = swift_getKeyPath(&unk_100013CC8);
  v23 = _AssistantIntent.IntentProjection.subscript.getter(v22, v18);
  swift_release(v22);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v23, v7);
  swift_release(v23);
  v24._countAndFlagsBits = 0xD000000000000015;
  v24._object = (void *)0x80000001000116B0;
  v45 = (void *)0x80000001000116B0;
  v46 = 0xD000000000000015;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v24);
  v44 = enum case for _AssistantIntent.PhraseToken.applicationName(_:);
  v25 = v48;
  v26 = v49;
  v43 = *(void (**)(char *))(v49 + 104);
  v27 = v50;
  v43(v48);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v25, v7);
  v42 = *(void (**)(char *, uint64_t))(v26 + 8);
  v42(v25, v27);
  v28._countAndFlagsBits = 0;
  v28._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v28);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for StereoRecordingEntity.UpdateIntent_value, v10);
  v49 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v6, &type metadata for StereoRecordingEntity.UpdateIntent_value, v10);
  v29 = v53;
  v54(v6, v53);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(21, 2, &type metadata for StereoRecordingEntity.UpdateIntent_value, v10);
  v30._countAndFlagsBits = 0;
  v30._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v30);
  v31 = swift_getKeyPath(&unk_100013CC8);
  v32 = _AssistantIntent.IntentProjection.subscript.getter(v31, v52);
  swift_release(v31);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v32, v7);
  swift_release(v32);
  v33._object = v45;
  v33._countAndFlagsBits = v46;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v33);
  ((void (*)(char *, _QWORD, uint64_t))v43)(v25, v44, v27);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v25, v7);
  v42(v25, v27);
  v34._countAndFlagsBits = 0;
  v34._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v34);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v9, &type metadata for StereoRecordingEntity.UpdateIntent_value, v10);
  v35 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v6, &type metadata for StereoRecordingEntity.UpdateIntent_value, v10);
  v54(v6, v29);
  v36 = sub_100004E7C(&qword_10001C990);
  v37 = swift_allocObject(v36, 64, 7);
  *(_OWORD *)(v37 + 16) = xmmword_100011E40;
  v38 = v47;
  *(_QWORD *)(v37 + 32) = v51;
  *(_QWORD *)(v37 + 40) = v38;
  *(_QWORD *)(v37 + 48) = v49;
  *(_QWORD *)(v37 + 56) = v35;
  v39 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)(v37);
  swift_bridgeObjectRelease(v37);
  return v39;
}

uint64_t sub_10000C998()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t KeyPath;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v0 = type metadata accessor for _AssistantIntent.Value(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(&unk_100013CC8);
  v5 = sub_1000051E0();
  v6 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v5);
  swift_release(KeyPath);
  v7 = sub_10000A82C();
  _AssistantIntent.Value.init<A>(for:builder:)(v6, sub_100004AFC, 0, v7);
  v8 = static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)(v3);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v9 = sub_100004E7C(&qword_10001C450);
  v10 = swift_allocObject(v9, 40, 7);
  *(_OWORD *)(v10 + 16) = xmmword_100011E20;
  *(_QWORD *)(v10 + 32) = v8;
  v11 = static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v10);
  return v11;
}

void sub_10000CAA8()
{
  qword_10001CF88 = (uint64_t)&_swiftEmptyArrayStorage;
}

uint64_t sub_10000CABC(uint64_t a1, uint64_t a2)
{
  return sub_100004C10(a1, a2, &qword_10001C288, &qword_10001CF80, (uint64_t)sub_10000C3A4);
}

uint64_t sub_10000CAD8(uint64_t a1, uint64_t a2)
{
  return sub_100004C10(a1, a2, &qword_10001C290, &qword_10001CF88, (uint64_t)sub_10000CAA8);
}

ValueMetadata *type metadata accessor for StereoRecordingAssistantIntents()
{
  return &type metadata for StereoRecordingAssistantIntents;
}

ValueMetadata *type metadata accessor for OpenStereoRecordingEntity()
{
  return &type metadata for OpenStereoRecordingEntity;
}

ValueMetadata *type metadata accessor for StereoRecordingEntity.StereoRecordingEntityQuery()
{
  return &type metadata for StereoRecordingEntity.StereoRecordingEntityQuery;
}

ValueMetadata *type metadata accessor for StereoRecordingEntity()
{
  return &type metadata for StereoRecordingEntity;
}

ValueMetadata *type metadata accessor for StereoRecordingEntity.UpdateIntent_value()
{
  return &type metadata for StereoRecordingEntity.UpdateIntent_value;
}

uint64_t sub_10000CB44()
{
  return sub_100005564(&qword_10001C968, &qword_10001C970, (uint64_t)&protocol conformance descriptor for <> IntentResultContainer<A, B, C, D>);
}

uint64_t sub_10000CB70()
{
  return sub_100005564(&qword_10001C978, &qword_10001C970, (uint64_t)&protocol conformance descriptor for IntentResultContainer<A, B, C, D>);
}

uint64_t sub_10000CB9C()
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

  v0 = sub_100004E7C(&qword_10001C478);
  __chkstk_darwin(v0);
  v30 = (char *)&v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for InputConnectionBehavior(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v29 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100004E7C(&qword_10001C480);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v25 - v9;
  v11 = sub_100004E7C(&qword_10001C488);
  __chkstk_darwin(v11);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for LocalizedStringResource(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_100004E7C(&qword_10001C998);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000040, 0x80000001000116D0);
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
  v21 = sub_10000B9D0();
  v25 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v17, v13, &v32, v10, v8, v20, v21);
  sub_100004E7C(&qword_10001C498);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000042, 0x8000000100011720);
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

_QWORD *sub_10000CEC0@<X0>(_BYTE *a1@<X8>)
{
  _QWORD *result;
  uint64_t v3;

  result = IntentParameter.wrappedValue.getter(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_10000CEF8(char *a1)
{
  char v2;

  v2 = *a1;
  return IntentParameter.wrappedValue.setter(&v2);
}

uint64_t sub_10000CF2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  void (*v18)(char *, uint64_t, uint64_t, uint64_t);
  unint64_t v19;
  uint64_t v21;
  uint64_t v22;

  v0 = type metadata accessor for InputConnectionBehavior(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100004E7C(&qword_10001C480);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v21 - v8;
  v10 = sub_100004E7C(&qword_10001C488);
  __chkstk_darwin(v10);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for LocalizedStringResource(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004E7C(&qword_10001C998);
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000002BLL, 0x8000000100011770);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
  v22 = 0;
  v17 = type metadata accessor for IntentDialog(0);
  v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56);
  v18(v9, 1, 1, v17);
  v18(v7, 1, 1, v17);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for InputConnectionBehavior.default(_:), v0);
  v19 = sub_10000B9D0();
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v16, v12, &v22, v9, v7, v3, v19);
}

unint64_t sub_10000D134()
{
  unint64_t result;

  result = qword_10001C9A0;
  if (!qword_10001C9A0)
  {
    result = swift_getWitnessTable(&unk_100013A60, &type metadata for OpenStereoRecordingEntity);
    atomic_store(result, (unint64_t *)&qword_10001C9A0);
  }
  return result;
}

unint64_t sub_10000D178()
{
  unint64_t result;

  result = qword_10001C9A8;
  if (!qword_10001C9A8)
  {
    result = swift_getWitnessTable(&unk_100013AB0, &type metadata for OpenStereoRecordingEntity);
    atomic_store(result, (unint64_t *)&qword_10001C9A8);
  }
  return result;
}

unint64_t sub_10000D1BC()
{
  unint64_t result;

  result = qword_10001C9B0;
  if (!qword_10001C9B0)
  {
    result = swift_getWitnessTable(&unk_100013860, &type metadata for StereoRecordingEntity);
    atomic_store(result, (unint64_t *)&qword_10001C9B0);
  }
  return result;
}

uint64_t sub_10000D200@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = v2;
  return swift_retain(v2);
}

unint64_t sub_10000D210()
{
  unint64_t result;

  result = qword_10001CA08;
  if (!qword_10001CA08)
  {
    result = swift_getWitnessTable(&unk_100013DDC, &type metadata for AudioQualityEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10001CA08);
  }
  return result;
}

uint64_t sub_10000D254()
{
  return sub_100005564(&qword_10001CA10, &qword_10001CA18, (uint64_t)&protocol conformance descriptor for _IntentUpdatableEntityProperty<A, B, C>);
}

uint64_t sub_10000D280(uint64_t a1)
{
  return sub_1000069EC(a1, qword_10001CF90, 0xD000000000000015, 0x8000000100011A10);
}

uint64_t sub_10000D2A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v0 = sub_100004E7C(&qword_10001CBF8);
  sub_100005510(v0, qword_10001CFA8);
  sub_1000054F8(v0, (uint64_t)qword_10001CFA8);
  if (qword_10001C220 != -1)
    swift_once(&qword_10001C220, sub_100009538);
  v1 = qword_10001CE78;
  v2 = qword_10001CE80;
  v3 = sub_10000E2F4();
  swift_bridgeObjectRetain(v2);
  return _EntityURLRepresentation.init(_:)(v1, v2, &type metadata for AudioQualityEntity, v3);
}

uint64_t sub_10000D354()
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
  uint64_t v15;

  v0 = sub_100004E7C(&qword_10001C4B8);
  __chkstk_darwin(v0);
  v2 = (char *)&v15 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_100004E7C(&qword_10001C488);
  __chkstk_darwin(v3);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for LocalizedStringResource(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v15 - v11;
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000015, 0x8000000100011A10);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000016, 0x8000000100011A30);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  DisplayRepresentation.Image.init(appBundleIdentifier:)(0xD000000000000014, 0x80000001000110B0);
  v13 = type metadata accessor for DisplayRepresentation.Image(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v2, 0, 1, v13);
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000001ELL, 0x8000000100011A50);
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v12, v5, v2, &_swiftEmptyArrayStorage, v10);
}

uint64_t sub_10000D52C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_10000D544, 0, 0);
}

uint64_t sub_10000D544()
{
  uint64_t v0;
  id v1;
  NSString v2;
  id v3;
  id v4;
  BOOL v5;

  v1 = objc_allocWithZone((Class)NSUserDefaults);
  v2 = String._bridgeToObjectiveC()();
  v3 = objc_msgSend(v1, "initWithSuiteName:", v2);

  if (v3)
  {
    v4 = objc_msgSend(v3, "rc_audioQuality");

    v5 = v4 == (id)1;
  }
  else
  {
    v5 = 0;
  }
  **(_BYTE **)(v0 + 16) = v5;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000D5F0(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + 16) = *a2;
  return swift_task_switch(sub_10000D60C, 0, 0);
}

uint64_t sub_10000D60C()
{
  uint64_t v0;
  id v1;
  NSString v2;
  id v3;

  v1 = objc_allocWithZone((Class)NSUserDefaults);
  v2 = String._bridgeToObjectiveC()();
  v3 = objc_msgSend(v1, "initWithSuiteName:", v2);

  if (v3)
  {
    objc_msgSend(v3, "rc_setAudioQuality:", *(unsigned __int8 *)(v0 + 16));

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000D6A0(uint64_t a1)
{
  return sub_100004258(a1, qword_10001CFC0, 0xD000000000000033, 0x8000000100011B40);
}

uint64_t sub_10000D6C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_100004E7C(&qword_10001C520);
  sub_100005510(v0, qword_10001CFD8);
  v1 = sub_1000054F8(v0, (uint64_t)qword_10001CFD8);
  IntentDescription.init(stringLiteral:)(0xD000000000000020, 0x8000000100011B10);
  v2 = type metadata accessor for IntentDescription(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 0, 1, v2);
}

uint64_t sub_10000D74C()
{
  uint64_t result;

  result = swift_getKeyPath(&unk_100014820);
  qword_10001CFF0 = result;
  return result;
}

uint64_t sub_10000D770(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  v4 = sub_100004E7C(&qword_10001C4F0);
  v3[9] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100004E7C(&qword_10001C4F8);
  v3[10] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100004E7C(&qword_10001CC40);
  v3[11] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v6 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for IntentDialog(0);
  v3[12] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v3[13] = v8;
  v3[14] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100004E7C(&qword_10001CC48);
  v3[15] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v3[16] = v10;
  v11 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v3[17] = swift_task_alloc(v11);
  v3[18] = swift_task_alloc(v11);
  return swift_task_switch(sub_10000D87C, 0, 0);
}

uint64_t sub_10000D87C()
{
  _QWORD *v0;
  _QWORD *v1;
  unint64_t v2;

  IntentParameter.wrappedValue.getter(v0 + 2);
  v1 = (_QWORD *)swift_task_alloc(async function pointer to IntentDialog._CapturedContent.init<>(entity:_:)[1]);
  v0[19] = v1;
  v2 = sub_10000E2F4();
  *v1 = v0;
  v1[1] = sub_10000D8FC;
  return IntentDialog._CapturedContent.init<>(entity:_:)(v0[18], v0 + 2, sub_10000DC8C, 0, &type metadata for AudioQualityEntity, v2);
}

uint64_t sub_10000D8FC()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 152));
  return swift_task_switch(sub_10000D950, 0, 0);
}

uint64_t sub_10000D950()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 24));
  v1 = *(_QWORD *)(v0 + 24);
  *(_QWORD *)(v0 + 32) = v1;
  *(_QWORD *)(v0 + 160) = v1;
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 192));
  *(_BYTE *)(v0 + 193) = *(_BYTE *)(v0 + 192);
  if (qword_10001C2B8 != -1)
    swift_once(&qword_10001C2B8, sub_10000D74C);
  v2 = qword_10001CFF0;
  *(_QWORD *)(v0 + 168) = qword_10001CFF0;
  v3 = async function pointer to AppEntity._setValue<A, B, C>(_:for:)[1];
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  *(_QWORD *)(v0 + 176) = v4;
  v5 = sub_100005564(&qword_10001CC28, &qword_10001CC30, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *v4 = v0;
  v4[1] = sub_10000DA4C;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 193, v2, &type metadata for AudioQualityEntity.IntentAudioQuality, v5);
}

uint64_t sub_10000DA4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 168);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 176);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 160);
  *(_QWORD *)(*(_QWORD *)v1 + 184) = v0;
  swift_task_dealloc(v2);
  swift_release(v3);
  swift_release(v4);
  if (v0)
    v5 = sub_100003018;
  else
    v5 = sub_10000DACC;
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_10000DACC()
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
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 128);
  v13 = *(_QWORD *)(v0 + 120);
  v4 = *(_QWORD *)(v0 + 112);
  v5 = *(_QWORD *)(v0 + 88);
  v14 = *(_QWORD *)(v0 + 104);
  v15 = *(_QWORD *)(v0 + 96);
  v6 = *(_QWORD *)(v0 + 72);
  v7 = *(_QWORD *)(v0 + 80);
  IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 40));
  v8 = type metadata accessor for _GeneratedContentOptions(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = type metadata accessor for _GeneratedContentFallback(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = sub_10000D210();
  v11 = sub_10000E458();
  IntentDialog._GeneratedDialogContent.init(fromResult:options:fallbackDialog:)(sub_10000DC8C, 0, v7, v6, &type metadata for AudioQualityEntity.UpdateIntent_value);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v13);
  IntentDialog.init<A, B>(from:capturedContent:)(v5, v1, &type metadata for AudioQualityEntity.UpdateIntent_value, &type metadata for AudioQualityEntity, v10, v11);
  static IntentResult.result<A>(value:dialog:)(v0 + 40, v4, &type metadata for AudioQualityEntity, v11);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v4, v15);
  swift_release(*(_QWORD *)(v0 + 40));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v13);
  swift_task_dealloc(v2);
  swift_task_dealloc(v1);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v7);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000DC90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v0 = sub_100004E7C(&qword_10001CC50);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10001C2B8 != -1)
    swift_once(&qword_10001C2B8, sub_10000D74C);
  v4 = qword_10001CFF0;
  v5 = swift_retain(qword_10001CFF0);
  static _DialogBuilderEntity.buildExpression<A, B>(_:)(v5);
  swift_release(v4);
  v6 = sub_10000E458();
  v7 = sub_100005564(&qword_10001CC58, &qword_10001CC50, (uint64_t)&protocol conformance descriptor for _NLGRepresentationEntity<A>);
  static _DialogBuilderEntity.buildBlock<A>(_:)(v3, &type metadata for AudioQualityEntity, v0, v6, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_10000DD98()
{
  if (qword_10001C2B8 != -1)
    swift_once(&qword_10001C2B8, sub_10000D74C);
  return swift_retain(qword_10001CFF0);
}

unint64_t sub_10000DDDC()
{
  unint64_t result;

  result = qword_10001CA20;
  if (!qword_10001CA20)
  {
    result = swift_getWitnessTable(&unk_100013E6C, &type metadata for AudioQualityEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10001CA20);
  }
  return result;
}

unint64_t sub_10000DE24()
{
  unint64_t result;

  result = qword_10001CA28;
  if (!qword_10001CA28)
  {
    result = swift_getWitnessTable(&unk_100013E94, &type metadata for AudioQualityEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_10001CA28);
  }
  return result;
}

uint64_t sub_10000DE68(uint64_t a1)
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2(a1, &unk_1000166A8, 1) + 8);
}

uint64_t sub_10000DE8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000076B4(a1, a2, a3, (uint64_t (*)(void))sub_10000D210, (uint64_t)&opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>);
}

uint64_t sub_10000DEA0@<X0>(uint64_t a1@<X8>)
{
  return sub_100003484(&qword_10001C2A8, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10001CFC0, (uint64_t)sub_10000D6A0, a1);
}

uint64_t sub_10000DEC4@<X0>(uint64_t a1@<X8>)
{
  return sub_100003484(&qword_10001C240, (uint64_t (*)(_QWORD))&type metadata accessor for IntentAuthenticationPolicy, (uint64_t)qword_10001CEC8, (uint64_t)sub_10000A3F0, a1);
}

uint64_t sub_10000DEE8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10001C2B0 != -1)
    swift_once(&qword_10001C2B0, sub_10000D6C4);
  v2 = sub_100004E7C(&qword_10001C520);
  v3 = sub_1000054F8(v2, (uint64_t)qword_10001CFD8);
  return sub_100010618(v3, a1, &qword_10001C520);
}

uint64_t sub_10000DF54(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *v1;
  v4 = v1[1];
  v6 = (_QWORD *)swift_task_alloc(dword_10001CC3C);
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_1000055EC;
  return sub_10000D770(a1, v5, v4);
}

uint64_t sub_10000DFB8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_10000FFDC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_10000DFDC()
{
  return 0xD000000000000023;
}

unint64_t sub_10000DFFC()
{
  unint64_t result;

  result = qword_10001CA38;
  if (!qword_10001CA38)
  {
    result = swift_getWitnessTable(&unk_100013EF0, &type metadata for AudioQualityEntity.AudioQualityEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10001CA38);
  }
  return result;
}

uint64_t sub_10000E044()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t result;
  uint64_t v6;

  v0 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v0);
  v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004E7C(&qword_10001CA18);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000013, 0x8000000100011620);
  v3 = sub_100005564(&qword_10001CC28, &qword_10001CC30, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  v4 = sub_10000A30C();
  result = _IntentUpdatableEntityProperty<>.init(title:get:set:intent:)(v2, &unk_10001CC18, 0, &unk_10001CC20, 0, &type metadata for AudioQualityEntity.UpdateIntent_value, v3, v4);
  qword_10001CFF8 = result;
  return result;
}

uint64_t sub_10000E128(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_10000E140, 0, 0);
}

uint64_t sub_10000E140()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v3)(void);

  if (qword_10001C2C0 != -1)
    swift_once(&qword_10001C2C0, sub_10000E044);
  v1 = qword_10001CFF8;
  **(_QWORD **)(v0 + 16) = qword_10001CFF8;
  v3 = *(uint64_t (**)(void))(v0 + 8);
  swift_retain(v1);
  return v3();
}

unint64_t sub_10000E1B4()
{
  unint64_t result;

  result = qword_10001CA48;
  if (!qword_10001CA48)
  {
    result = swift_getWitnessTable(&unk_100013F28, &type metadata for AudioQualityEntity.AudioQualityEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10001CA48);
  }
  return result;
}

uint64_t sub_10000E1F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.allEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_10000EAB0();
  *v4 = v2;
  v4[1] = sub_100003898;
  return _UniqueEntityQuery.allEntities()(a2, v5);
}

unint64_t sub_10000E264()
{
  unint64_t result;

  result = qword_10001CA58;
  if (!qword_10001CA58)
  {
    result = swift_getWitnessTable(&unk_100013F80, &type metadata for AudioQualityEntity.AudioQualityEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10001CA58);
  }
  return result;
}

unint64_t sub_10000E2AC()
{
  unint64_t result;

  result = qword_10001CA60;
  if (!qword_10001CA60)
  {
    result = swift_getWitnessTable(&unk_100013FE0, &type metadata for AudioQualityEntity.AudioQualityEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10001CA60);
  }
  return result;
}

unint64_t sub_10000E2F4()
{
  unint64_t result;

  result = qword_10001CA68[0];
  if (!qword_10001CA68[0])
  {
    result = swift_getWitnessTable(&unk_1000142EC, &type metadata for AudioQualityEntity);
    atomic_store(result, qword_10001CA68);
  }
  return result;
}

uint64_t sub_10000E338(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.entities(for:)[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_10000EAB0();
  *v5 = v2;
  v5[1] = sub_100003A40;
  return _UniqueEntityQuery.entities(for:)(a1, a2, v6);
}

uint64_t sub_10000E3A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  *(_QWORD *)(v2 + 16) = a1;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to _UniqueEntityQuery.suggestedEntities()[1]);
  *(_QWORD *)(v2 + 24) = v4;
  v5 = sub_10000EAB0();
  *v4 = v2;
  v4[1] = sub_1000055F0;
  return _UniqueEntityQuery.suggestedEntities()(a2, v5);
}

unint64_t sub_10000E410()
{
  unint64_t result;

  result = qword_10001CA80;
  if (!qword_10001CA80)
  {
    result = swift_getWitnessTable(&unk_100014008, &type metadata for AudioQualityEntity.AudioQualityEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10001CA80);
  }
  return result;
}

unint64_t sub_10000E458()
{
  unint64_t result;

  result = qword_10001CA88;
  if (!qword_10001CA88)
  {
    result = swift_getWitnessTable(&unk_1000144C4, &type metadata for AudioQualityEntity);
    atomic_store(result, (unint64_t *)&qword_10001CA88);
  }
  return result;
}

unint64_t sub_10000E4A0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001CA90;
  if (!qword_10001CA90)
  {
    v1 = sub_100002498(qword_10001CA98);
    sub_10000E458();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_10001CA90);
  }
  return result;
}

uint64_t sub_10000E504(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_10000E1B4();
  *v5 = v2;
  v5[1] = sub_100003C60;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_10000E570(uint64_t a1)
{
  return sub_1000069EC(a1, qword_10001D000, 0xD000000000000022, 0x8000000100011AB0);
}

BOOL sub_10000E594(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_10000E5B0()
{
  unint64_t result;

  result = qword_10001CAB0;
  if (!qword_10001CAB0)
  {
    result = swift_getWitnessTable(&unk_100014024, &type metadata for AudioQualityEntity.IntentAudioQuality);
    atomic_store(result, (unint64_t *)&qword_10001CAB0);
  }
  return result;
}

_QWORD *sub_10000E5F4@<X0>(_QWORD *result@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  if (*result == 1)
    v2 = 1;
  else
    v2 = 2;
  if (*result)
    v3 = v2;
  else
    v3 = 0;
  *a2 = v3;
  return result;
}

unint64_t sub_10000E618()
{
  unint64_t result;

  result = qword_10001CAB8;
  if (!qword_10001CAB8)
  {
    result = swift_getWitnessTable(&unk_10001413C, &type metadata for AudioQualityEntity.IntentAudioQuality);
    atomic_store(result, (unint64_t *)&qword_10001CAB8);
  }
  return result;
}

unint64_t sub_10000E660()
{
  unint64_t result;

  result = qword_10001CAC0;
  if (!qword_10001CAC0)
  {
    result = swift_getWitnessTable(&unk_100014174, &type metadata for AudioQualityEntity.IntentAudioQuality);
    atomic_store(result, (unint64_t *)&qword_10001CAC0);
  }
  return result;
}

unint64_t sub_10000E6A8()
{
  unint64_t result;

  result = qword_10001CAC8;
  if (!qword_10001CAC8)
  {
    result = swift_getWitnessTable(&unk_10001408C, &type metadata for AudioQualityEntity.IntentAudioQuality);
    atomic_store(result, (unint64_t *)&qword_10001CAC8);
  }
  return result;
}

unint64_t sub_10000E6F0()
{
  unint64_t result;

  result = qword_10001CAD0;
  if (!qword_10001CAD0)
  {
    result = swift_getWitnessTable(&unk_1000141A4, &type metadata for AudioQualityEntity.IntentAudioQuality);
    atomic_store(result, (unint64_t *)&qword_10001CAD0);
  }
  return result;
}

unint64_t sub_10000E738()
{
  unint64_t result;

  result = qword_10001CAD8;
  if (!qword_10001CAD8)
  {
    result = swift_getWitnessTable(&unk_1000141CC, &type metadata for AudioQualityEntity.IntentAudioQuality);
    atomic_store(result, (unint64_t *)&qword_10001CAD8);
  }
  return result;
}

unint64_t sub_10000E780()
{
  unint64_t result;

  result = qword_10001CAE0;
  if (!qword_10001CAE0)
  {
    result = swift_getWitnessTable(&unk_1000141F4, &type metadata for AudioQualityEntity.IntentAudioQuality);
    atomic_store(result, (unint64_t *)&qword_10001CAE0);
  }
  return result;
}

unint64_t sub_10000E7C8()
{
  unint64_t result;

  result = qword_10001CAE8;
  if (!qword_10001CAE8)
  {
    result = swift_getWitnessTable(&unk_10001424C, &type metadata for AudioQualityEntity.IntentAudioQuality);
    atomic_store(result, (unint64_t *)&qword_10001CAE8);
  }
  return result;
}

uint64_t sub_10000E80C@<X0>(uint64_t a1@<X8>)
{
  return sub_100003484(&qword_10001C2C8, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_10001D000, (uint64_t)sub_10000E570, a1);
}

uint64_t sub_10000E830(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000076B4(a1, a2, a3, (uint64_t (*)(void))sub_10000A30C, (uint64_t)&opaque type descriptor for <<opaque return type of static AppEnum.defaultResolverSpecification>>);
}

uint64_t sub_10000E844(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000A30C();
  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000E880()
{
  unint64_t result;

  result = qword_10001CAF0;
  if (!qword_10001CAF0)
  {
    result = swift_getWitnessTable(&unk_10001428C, &type metadata for AudioQualityEntity.IntentAudioQuality);
    atomic_store(result, (unint64_t *)&qword_10001CAF0);
  }
  return result;
}

unint64_t sub_10000E8C8()
{
  unint64_t result;

  result = qword_10001CAF8;
  if (!qword_10001CAF8)
  {
    result = swift_getWitnessTable(&unk_1000142B4, &type metadata for AudioQualityEntity.IntentAudioQuality);
    atomic_store(result, (unint64_t *)&qword_10001CAF8);
  }
  return result;
}

unint64_t sub_10000E910()
{
  unint64_t result;

  result = qword_10001CB00;
  if (!qword_10001CB00)
  {
    result = swift_getWitnessTable(&unk_10001404C, &type metadata for AudioQualityEntity.IntentAudioQuality);
    atomic_store(result, (unint64_t *)&qword_10001CB00);
  }
  return result;
}

uint64_t sub_10000E958(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000E7C8();
  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t sub_10000E990()
{
  return sub_100005564(&qword_10001CB08, &qword_10001CB10, (uint64_t)&protocol conformance descriptor for [A]);
}

void sub_10000E9BC(_QWORD *a1@<X8>)
{
  *a1 = &off_100018788;
}

unint64_t sub_10000E9D0()
{
  unint64_t result;

  result = qword_10001CB18;
  if (!qword_10001CB18)
  {
    result = swift_getWitnessTable(&unk_1000143AC, &type metadata for AudioQualityEntity);
    atomic_store(result, (unint64_t *)&qword_10001CB18);
  }
  return result;
}

unint64_t sub_10000EA18()
{
  unint64_t result;

  result = qword_10001CB20;
  if (!qword_10001CB20)
  {
    result = swift_getWitnessTable(&unk_1000143E4, &type metadata for AudioQualityEntity);
    atomic_store(result, (unint64_t *)&qword_10001CB20);
  }
  return result;
}

unint64_t sub_10000EA60()
{
  unint64_t result;

  result = qword_10001CB28;
  if (!qword_10001CB28)
  {
    result = swift_getWitnessTable(&unk_100014414, &type metadata for AudioQualityEntity);
    atomic_store(result, (unint64_t *)&qword_10001CB28);
  }
  return result;
}

unint64_t sub_10000EAB0()
{
  unint64_t result;

  result = qword_10001CB30;
  if (!qword_10001CB30)
  {
    result = swift_getWitnessTable(&unk_100013EB0, &type metadata for AudioQualityEntity.AudioQualityEntityQuery);
    atomic_store(result, (unint64_t *)&qword_10001CB30);
  }
  return result;
}

unint64_t sub_10000EAF8()
{
  unint64_t result;

  result = qword_10001CB38;
  if (!qword_10001CB38)
  {
    result = swift_getWitnessTable(&unk_10001444C, &type metadata for AudioQualityEntity);
    atomic_store(result, (unint64_t *)&qword_10001CB38);
  }
  return result;
}

uint64_t sub_10000EB3C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10001C2A0 != -1)
    swift_once(&qword_10001C2A0, sub_10000D2A4);
  v2 = sub_100004E7C(&qword_10001CBF8);
  v3 = sub_1000054F8(v2, (uint64_t)qword_10001CFA8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

unint64_t sub_10000EBB4()
{
  unint64_t result;

  result = qword_10001CB40;
  if (!qword_10001CB40)
  {
    result = swift_getWitnessTable(&unk_100014474, &type metadata for AudioQualityEntity);
    atomic_store(result, (unint64_t *)&qword_10001CB40);
  }
  return result;
}

unint64_t sub_10000EBFC()
{
  unint64_t result;

  result = qword_10001CB48;
  if (!qword_10001CB48)
  {
    result = swift_getWitnessTable(&unk_10001449C, &type metadata for AudioQualityEntity);
    atomic_store(result, (unint64_t *)&qword_10001CB48);
  }
  return result;
}

unint64_t sub_10000EC48()
{
  unint64_t result;

  result = qword_10001CB50;
  if (!qword_10001CB50)
  {
    result = swift_getWitnessTable(&unk_10001451C, &type metadata for AudioQualityEntity);
    atomic_store(result, (unint64_t *)&qword_10001CB50);
  }
  return result;
}

uint64_t sub_10000EC8C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v4;
  uint64_t result;
  uint64_t v6;

  v4 = sub_10000A394();
  result = _UniqueEntity.id.getter(a1, v4);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_10000ECC8(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_1000105C8();
  v4 = _URLRepresentableEntity.urlRepresentationParameter.getter(a1, v3);
  return sub_100005550(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8), v1, v4, v5);
}

uint64_t sub_10000ED10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE v5[24];

  if (qword_10001C298 != -1)
    swift_once(&qword_10001C298, sub_10000D280);
  v2 = type metadata accessor for TypeDisplayRepresentation(0);
  v3 = sub_1000054F8(v2, (uint64_t)qword_10001CF90);
  swift_beginAccess(v3, v5, 0, 0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_10000EDA8()
{
  return sub_100005564(&qword_10001CB60, &qword_10001CB68, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_10000EDD4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000E2F4();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_10000EE10()
{
  unint64_t result;

  result = qword_10001CB70;
  if (!qword_10001CB70)
  {
    result = swift_getWitnessTable(&unk_10001454C, &type metadata for AudioQualityEntity);
    atomic_store(result, (unint64_t *)&qword_10001CB70);
  }
  return result;
}

uint64_t sub_10000EE58(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000EC48();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_10000EE94()
{
  unint64_t result;

  result = qword_10001CB78;
  if (!qword_10001CB78)
  {
    result = swift_getWitnessTable(&unk_100014604, &type metadata for OpenAudioQualityEntity);
    atomic_store(result, (unint64_t *)&qword_10001CB78);
  }
  return result;
}

uint64_t sub_10000EED8(uint64_t a1)
{
  return sub_100004258(a1, qword_10001D018, 0xD000000000000018, 0x80000001000119F0);
}

unint64_t sub_10000EF00()
{
  unint64_t result;

  result = qword_10001CB80;
  if (!qword_10001CB80)
  {
    result = swift_getWitnessTable(&unk_10001462C, &type metadata for OpenAudioQualityEntity);
    atomic_store(result, (unint64_t *)&qword_10001CB80);
  }
  return result;
}

uint64_t sub_10000EF44(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;

  v4 = sub_100010540();
  v5 = sub_1000105C8();
  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

unint64_t sub_10000EF9C()
{
  unint64_t result;

  result = qword_10001CB88;
  if (!qword_10001CB88)
  {
    result = swift_getWitnessTable(&unk_1000146BC, &type metadata for OpenAudioQualityEntity);
    atomic_store(result, (unint64_t *)&qword_10001CB88);
  }
  return result;
}

unint64_t sub_10000EFE4()
{
  unint64_t result;

  result = qword_10001CB90;
  if (!qword_10001CB90)
  {
    result = swift_getWitnessTable(&unk_1000146E4, &type metadata for OpenAudioQualityEntity);
    atomic_store(result, (unint64_t *)&qword_10001CB90);
  }
  return result;
}

uint64_t sub_10000F028(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000076B4(a1, a2, a3, (uint64_t (*)(void))sub_10000EF00, (uint64_t)&opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>);
}

uint64_t sub_10000F03C@<X0>(uint64_t a1@<X8>)
{
  return sub_100003484(&qword_10001C2D0, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10001D018, (uint64_t)sub_10000EED8, a1);
}

uint64_t sub_10000F060(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to _URLRepresentableIntent<>.perform()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_100010540();
  v7 = sub_100010584();
  v8 = sub_1000105C8();
  *v5 = v2;
  v5[1] = sub_10000456C;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_10000F0EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_100010338();
  *a1 = result;
  return result;
}

uint64_t sub_10000F110(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000EF00();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_10000F138()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t result;
  _QWORD v6[2];

  v0 = sub_100004E7C(&qword_10001C440);
  v1 = type metadata accessor for _AssistantIntent(0);
  v2 = swift_allocObject(v0, ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v1 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) | 7);
  *(_OWORD *)(v2 + 16) = xmmword_100011E20;
  v6[0] = sub_10000FFDC();
  v6[1] = v3;
  v4 = sub_10000D210();
  result = _AssistantIntent.init<A>(_:phrases:parameterValues:)(v6, sub_10000F1EC, 0, &j___s10AppIntents16_AssistantIntentV21ParameterValueBuilderO10buildBlockSayAC0F0VGyFZ, 0, &type metadata for AudioQualityEntity.UpdateIntent_value, v4);
  qword_10001D030 = v2;
  return result;
}

uint64_t sub_10000F1EC()
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
  unint64_t v10;
  uint64_t v11;
  Swift::String v12;
  uint64_t v13;
  Swift::String v14;
  uint64_t v15;
  uint64_t v16;
  Swift::String v17;
  uint64_t v18;
  Swift::String v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  Swift::String v23;
  uint64_t v24;
  uint64_t v25;
  Swift::String v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t);

  v39 = type metadata accessor for _AssistantIntent.PhraseToken(0);
  v36 = *(_QWORD *)(v39 - 8);
  __chkstk_darwin(v39);
  v38 = (char *)&v33 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = sub_100004E7C(&qword_10001CBB8);
  v1 = *(_QWORD *)(v34 - 8);
  __chkstk_darwin(v34);
  v3 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100004E7C(&qword_10001CBC0);
  __chkstk_darwin(v4);
  v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_10000D210();
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(40, 1, &type metadata for AudioQualityEntity.UpdateIntent_value, v7);
  v8._countAndFlagsBits = 0xD000000000000028;
  v8._object = (void *)0x80000001000118F0;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v8);
  KeyPath = swift_getKeyPath(&unk_1000147F8);
  v10 = sub_10000E780();
  v33 = v10;
  v11 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v10);
  swift_release(KeyPath);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v11, v4);
  swift_release(v11);
  v12._countAndFlagsBits = 0;
  v12._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v12);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v6, &type metadata for AudioQualityEntity.UpdateIntent_value, v7);
  v37 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for AudioQualityEntity.UpdateIntent_value, v7);
  v40 = *(void (**)(char *, uint64_t))(v1 + 8);
  v13 = v34;
  v40(v3, v34);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(18, 1, &type metadata for AudioQualityEntity.UpdateIntent_value, v7);
  v14._countAndFlagsBits = 0x692064726F636552;
  v14._object = (void *)0xEA0000000000206ELL;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v14);
  v15 = swift_getKeyPath(&unk_1000147F8);
  v16 = _AssistantIntent.IntentProjection.subscript.getter(v15, v10);
  swift_release(v15);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v16, v4);
  swift_release(v16);
  v17._countAndFlagsBits = 0x7974696C61757120;
  v17._object = (void *)0xE800000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v17);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v6, &type metadata for AudioQualityEntity.UpdateIntent_value, v7);
  v35 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for AudioQualityEntity.UpdateIntent_value, v7);
  v18 = v13;
  v40(v3, v13);
  _AssistantIntent.Phrase.StringInterpolation.init(literalCapacity:interpolationCount:)(23, 2, &type metadata for AudioQualityEntity.UpdateIntent_value, v7);
  v19._countAndFlagsBits = 0x2065676E616863;
  v19._object = (void *)0xE700000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v19);
  v20 = v36;
  v22 = v38;
  v21 = v39;
  (*(void (**)(char *, _QWORD, uint64_t))(v36 + 104))(v38, enum case for _AssistantIntent.PhraseToken.applicationName(_:), v39);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v22, v4);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v21);
  v23._object = (void *)0x8000000100011920;
  v23._countAndFlagsBits = 0xD000000000000010;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v23);
  v24 = swift_getKeyPath(&unk_1000147F8);
  v25 = _AssistantIntent.IntentProjection.subscript.getter(v24, v33);
  swift_release(v24);
  _AssistantIntent.Phrase.StringInterpolation.appendInterpolation(_:)(v25, v4);
  swift_release(v25);
  v26._countAndFlagsBits = 0;
  v26._object = (void *)0xE000000000000000;
  _AssistantIntent.Phrase.StringInterpolation.appendLiteral(_:)(v26);
  _AssistantIntent.Phrase.init(stringInterpolation:)(v6, &type metadata for AudioQualityEntity.UpdateIntent_value, v7);
  v27 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for AudioQualityEntity.UpdateIntent_value, v7);
  v40(v3, v18);
  v28 = sub_100004E7C(&qword_10001CBC8);
  v29 = swift_allocObject(v28, 56, 7);
  *(_OWORD *)(v29 + 16) = xmmword_100013240;
  v30 = v35;
  *(_QWORD *)(v29 + 32) = v37;
  *(_QWORD *)(v29 + 40) = v30;
  *(_QWORD *)(v29 + 48) = v27;
  v31 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)(v29);
  swift_bridgeObjectRelease(v29);
  return v31;
}

void sub_10000F62C()
{
  qword_10001D038 = (uint64_t)&_swiftEmptyArrayStorage;
}

uint64_t sub_10000F640(uint64_t a1, uint64_t a2)
{
  return sub_100004C10(a1, a2, &qword_10001C2D8, &qword_10001D030, (uint64_t)sub_10000F138);
}

uint64_t sub_10000F65C(uint64_t a1, uint64_t a2)
{
  return sub_100004C10(a1, a2, &qword_10001C2E0, &qword_10001D038, (uint64_t)sub_10000F62C);
}

ValueMetadata *type metadata accessor for AudioQualityIntents()
{
  return &type metadata for AudioQualityIntents;
}

ValueMetadata *type metadata accessor for OpenAudioQualityEntity()
{
  return &type metadata for OpenAudioQualityEntity;
}

ValueMetadata *type metadata accessor for AudioQualityEntity.AudioQualityEntityQuery()
{
  return &type metadata for AudioQualityEntity.AudioQualityEntityQuery;
}

uint64_t getEnumTagSinglePayload for AudioQualityEntity.IntentAudioQuality(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AudioQualityEntity.IntentAudioQuality(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000F784 + 4 * byte_100013D25[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10000F7B8 + 4 * byte_100013D20[v4]))();
}

uint64_t sub_10000F7B8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000F7C0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000F7C8);
  return result;
}

uint64_t sub_10000F7D4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000F7DCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_10000F7E0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000F7E8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_10000F7F4(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AudioQualityEntity.IntentAudioQuality()
{
  return &type metadata for AudioQualityEntity.IntentAudioQuality;
}

ValueMetadata *type metadata accessor for AudioQualityEntity()
{
  return &type metadata for AudioQualityEntity;
}

ValueMetadata *type metadata accessor for AudioQualityEntity.UpdateIntent_value()
{
  return &type metadata for AudioQualityEntity.UpdateIntent_value;
}

uint64_t sub_10000F830()
{
  return sub_100005564(&qword_10001CBA0, &qword_10001CBA8, (uint64_t)&protocol conformance descriptor for <> IntentResultContainer<A, B, C, D>);
}

uint64_t sub_10000F85C()
{
  return sub_100005564(&qword_10001CBB0, &qword_10001CBA8, (uint64_t)&protocol conformance descriptor for IntentResultContainer<A, B, C, D>);
}

unint64_t sub_10000F888(unsigned __int8 a1)
{
  uint64_t v1;
  Swift::Int v3;
  _QWORD v5[9];

  Hasher.init(_seed:)(v5, *(_QWORD *)(v1 + 40));
  Hasher._combine(_:)(a1);
  v3 = Hasher._finalize()();
  return sub_10000F93C(a1, v3);
}

unint64_t sub_10000F8E0(char a1)
{
  uint64_t v1;
  uint64_t v2;
  char v4;
  Swift::Int v5;
  _QWORD v7[9];

  v2 = v1;
  v4 = a1 & 1;
  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  Hasher._combine(_:)(a1 & 1);
  v5 = Hasher._finalize()();
  return sub_10000F9DC(v4, v5);
}

unint64_t sub_10000F93C(unsigned __int8 a1, uint64_t a2)
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

unint64_t sub_10000F9DC(char a1, uint64_t a2)
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
    if (((((a1 & 1) == 0) ^ *(unsigned __int8 *)(v7 + result)) & 1) == 0)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (((((a1 & 1) == 0) ^ *(_BYTE *)(v7 + result)) & 1) != 0)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_10000FA98(uint64_t a1)
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

  v2 = sub_100004E7C(&qword_10001C738);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (unsigned __int8 *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  if (v6)
  {
    sub_100004E7C(&qword_10001CC60);
    v7 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v6);
    v8 = &v5[*(int *)(v2 + 48)];
    v9 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v10 = *(_QWORD *)(v3 + 72);
    while (1)
    {
      sub_100010618(v9, (uint64_t)v5, &qword_10001C738);
      v11 = *v5;
      result = sub_10000F888(*v5);
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

unint64_t sub_10000FC00(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  unint64_t result;
  char v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;

  v2 = sub_100004E7C(&qword_10001CC08);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  if (v6)
  {
    sub_100004E7C(&qword_10001CC10);
    v7 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v6);
    v8 = &v5[*(int *)(v2 + 48)];
    v9 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v10 = *(_QWORD *)(v3 + 72);
    while (1)
    {
      sub_100010618(v9, (uint64_t)v5, &qword_10001CC08);
      v11 = *v5;
      result = sub_10000F8E0(*v5);
      if ((v13 & 1) != 0)
        break;
      v14 = result;
      *(_QWORD *)((char *)v7 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_BYTE *)(v7[6] + result) = v11;
      v15 = v7[7];
      v16 = type metadata accessor for DisplayRepresentation(0);
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v15 + *(_QWORD *)(*(_QWORD *)(v16 - 8) + 72) * v14, v8, v16);
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

unint64_t sub_10000FD68()
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
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  void (*v18)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t, uint64_t);
  unint64_t v21;
  _BYTE *v23;
  uint64_t v24;

  v0 = sub_100004E7C(&qword_10001C4B8);
  __chkstk_darwin(v0);
  v2 = (char *)&v23 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_100004E7C(&qword_10001C488);
  __chkstk_darwin(v3);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for LocalizedStringResource(0);
  v7 = *(_QWORD *)(v6 - 8);
  v24 = v6;
  __chkstk_darwin(v6);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100004E7C(&qword_10001CC00);
  v11 = sub_100004E7C(&qword_10001CC08);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 72);
  v14 = *(unsigned __int8 *)(v12 + 80);
  v15 = (v14 + 32) & ~v14;
  v16 = swift_allocObject(v10, v15 + 2 * v13, v14 | 7);
  *(_OWORD *)(v16 + 16) = xmmword_100011E30;
  v17 = (_BYTE *)(v16 + v15);
  v23 = &v17[*(int *)(v11 + 48)];
  *v17 = 0;
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000011, 0x8000000100011A70);
  v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
  v18(v5, 1, 1, v6);
  v19 = type metadata accessor for DisplayRepresentation.Image(0);
  v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56);
  v20(v2, 1, 1, v19);
  DisplayRepresentation.init(title:subtitle:image:)(v9, v5, v2);
  v17[v13] = 1;
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000014, 0x8000000100011A90);
  v18(v5, 1, 1, v24);
  v20(v2, 1, 1, v19);
  DisplayRepresentation.init(title:subtitle:image:)(v9, v5, v2);
  v21 = sub_10000FC00(v16);
  swift_setDeallocating(v16);
  swift_arrayDestroy(v17, 2, v11);
  swift_deallocClassInstance(v16, 32, 7);
  return v21;
}

uint64_t sub_10000FFDC()
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
  v3 = sub_100004E7C(&qword_10001C480);
  v4 = __chkstk_darwin(v3);
  v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)v25 - v7;
  v9 = sub_100004E7C(&qword_10001C488);
  __chkstk_darwin(v9);
  v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  v27 = v12;
  __chkstk_darwin(v12);
  v15 = (char *)v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25[1] = sub_100004E7C(&qword_10001CBD0);
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000003DLL, 0x8000000100011940);
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
  v22 = sub_10000E2F4();
  v28 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v15, v11, &v31, v18, v19, v2, v22);
  sub_100004E7C(&qword_10001CBD8);
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000003FLL, 0x8000000100011980);
  v26(v11, 1, 1, v27);
  v30 = 2;
  v17(v18, 1, 1, v16);
  v17(v19, 1, 1, v16);
  ((void (*)(char *, uint64_t, uint64_t))v25[0])(v2, v20, v21);
  v23 = sub_10000A30C();
  IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)(v15, v11, &v30, v18, v19, v2, &off_100018760, v23);
  return v28;
}

_QWORD *sub_1000102CC@<X0>(_BYTE *a1@<X8>)
{
  _QWORD *result;
  uint64_t v3;

  result = IntentParameter.wrappedValue.getter(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_100010304(char *a1)
{
  char v2;

  v2 = *a1;
  return IntentParameter.wrappedValue.setter(&v2);
}

uint64_t sub_100010338()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  void (*v18)(char *, uint64_t, uint64_t, uint64_t);
  unint64_t v19;
  uint64_t v21;
  uint64_t v22;

  v0 = type metadata accessor for InputConnectionBehavior(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100004E7C(&qword_10001C480);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v21 - v8;
  v10 = sub_100004E7C(&qword_10001C488);
  __chkstk_darwin(v10);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for LocalizedStringResource(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004E7C(&qword_10001CBD0);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000028, 0x80000001000119C0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
  v22 = 0;
  v17 = type metadata accessor for IntentDialog(0);
  v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56);
  v18(v9, 1, 1, v17);
  v18(v7, 1, 1, v17);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for InputConnectionBehavior.default(_:), v0);
  v19 = sub_10000E2F4();
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v16, v12, &v22, v9, v7, v3, v19);
}

unint64_t sub_100010540()
{
  unint64_t result;

  result = qword_10001CBE0;
  if (!qword_10001CBE0)
  {
    result = swift_getWitnessTable(&unk_100014574, &type metadata for OpenAudioQualityEntity);
    atomic_store(result, (unint64_t *)&qword_10001CBE0);
  }
  return result;
}

unint64_t sub_100010584()
{
  unint64_t result;

  result = qword_10001CBE8;
  if (!qword_10001CBE8)
  {
    result = swift_getWitnessTable(&unk_1000145C4, &type metadata for OpenAudioQualityEntity);
    atomic_store(result, (unint64_t *)&qword_10001CBE8);
  }
  return result;
}

unint64_t sub_1000105C8()
{
  unint64_t result;

  result = qword_10001CBF0;
  if (!qword_10001CBF0)
  {
    result = swift_getWitnessTable(&unk_100014374, &type metadata for AudioQualityEntity);
    atomic_store(result, (unint64_t *)&qword_10001CBF0);
  }
  return result;
}

uint64_t sub_10001060C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = v2;
  return swift_retain(v2);
}

uint64_t sub_100010618(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100004E7C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001065C()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC33VoiceMemosSettingsWidgetExtensionP33_B47886F35991C67AC2C7D30893FD093519ResourceBundleClass);
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerValue");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_postNotificationName_object_userInfo_deliverImmediately_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:deliverImmediately:");
}

id objc_msgSend_rc_recentlyDeletedWindow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rc_recentlyDeletedWindow");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setInteger_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteger:forKey:");
}
