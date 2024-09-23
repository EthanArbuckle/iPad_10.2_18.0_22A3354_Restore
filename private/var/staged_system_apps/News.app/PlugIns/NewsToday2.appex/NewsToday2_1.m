uint64_t sub_1000875C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_100016484(&qword_1000D9588);
  sub_10001732C(v0, qword_1000E99E8);
  v1 = sub_100017314(v0, (uint64_t)qword_1000E99E8);
  IntentDescription.init(stringLiteral:)(0xD00000000000002BLL, 0x80000001000A99F0);
  v2 = type metadata accessor for IntentDescription(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 0, 1, v2);
}

uint64_t sub_100087650()
{
  uint64_t result;

  result = swift_getKeyPath(&unk_1000A2A78);
  qword_1000E9A00 = result;
  return result;
}

uint64_t sub_100087674(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  return swift_task_switch(sub_100087690, 0, 0);
}

uint64_t sub_100087690()
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
  if (qword_1000D8DE8 != -1)
    swift_once(&qword_1000D8DE8, sub_100087650);
  v2 = qword_1000E9A00;
  *(_QWORD *)(v0 + 80) = qword_1000E9A00;
  v3 = async function pointer to AppEntity._setValue<A, B, C>(_:for:)[1];
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  *(_QWORD *)(v0 + 88) = v4;
  v5 = sub_100017C10(&qword_1000DD7C0, &qword_1000DD7C8, (uint64_t)&protocol conformance descriptor for _EntityDeferredPropertyValue<A, B>);
  *(_QWORD *)(v0 + 96) = v5;
  *v4 = v0;
  v4[1] = sub_100087790;
  return AppEntity._setValue<A, B, C>(_:for:)(v0 + 145, v2, &type metadata for Bool, v5);
}

uint64_t sub_100087790()
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
    v5 = sub_100015620;
  else
    v5 = sub_100087810;
  return swift_task_switch(v5, 0, 0);
}

uint64_t sub_100087810()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  IntentParameter.wrappedValue.getter(v0 + 5);
  v1 = v0[5];
  v0[4] = v1;
  v2 = qword_1000E9A00;
  v0[14] = v1;
  v0[15] = v2;
  v3 = async function pointer to AppEntity._value<A, B>(for:)[1];
  swift_retain(v2);
  v4 = (_QWORD *)swift_task_alloc(v3);
  v0[16] = v4;
  *v4 = v0;
  v4[1] = sub_100015548;
  return AppEntity._value<A, B>(for:)(v0 + 18, v2, v0[12]);
}

uint64_t sub_1000878A4()
{
  if (qword_1000D8DE8 != -1)
    swift_once(&qword_1000D8DE8, sub_100087650);
  return swift_retain(qword_1000E9A00);
}

unint64_t sub_1000878E8()
{
  unint64_t result;

  result = qword_1000DD6F8;
  if (!qword_1000DD6F8)
  {
    result = swift_getWitnessTable(&unk_1000A2740, &type metadata for GameCenterEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_1000DD6F8);
  }
  return result;
}

unint64_t sub_100087930()
{
  unint64_t result;

  result = qword_1000DD700;
  if (!qword_1000DD700)
  {
    result = swift_getWitnessTable(&unk_1000A2768, &type metadata for GameCenterEntity.UpdateIntent_value);
    atomic_store(result, (unint64_t *)&qword_1000DD700);
  }
  return result;
}

uint64_t sub_100087974(uint64_t a1)
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2(a1, &unk_1000B469C, 1) + 8);
}

uint64_t sub_100087998(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_100086FF0();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

uint64_t sub_1000879D8@<X0>(uint64_t a1@<X8>)
{
  return sub_100015D4C(&qword_1000D8DD8, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_1000E99D0, (uint64_t)sub_100087568, a1);
}

uint64_t sub_1000879FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1000D8DE0 != -1)
    swift_once(&qword_1000D8DE0, sub_1000875C8);
  v2 = sub_100016484(&qword_1000D9588);
  v3 = sub_100017314(v2, (uint64_t)qword_1000E99E8);
  return sub_100017810(v3, a1);
}

uint64_t sub_100087A5C(uint64_t a1)
{
  _OWORD *v1;
  uint64_t v2;
  uint64_t v4;

  v4 = swift_task_alloc(dword_1000DD7DC);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_100015944;
  *(_OWORD *)(v4 + 56) = *v1;
  *(_QWORD *)(v4 + 48) = a1;
  return swift_task_switch(sub_100087690, 0, 0);
}

uint64_t sub_100087AC4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_10008883C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100087AE8()
{
  return 0xD000000000000021;
}

unint64_t sub_100087B08()
{
  unint64_t result;

  result = qword_1000DD710;
  if (!qword_1000DD710)
  {
    result = swift_getWitnessTable(&unk_1000A2874, &type metadata for GameCenterEntity);
    atomic_store(result, (unint64_t *)&qword_1000DD710);
  }
  return result;
}

unint64_t sub_100087B50()
{
  unint64_t result;

  result = qword_1000DD718;
  if (!qword_1000DD718)
  {
    result = swift_getWitnessTable(&unk_1000A28AC, &type metadata for GameCenterEntity);
    atomic_store(result, (unint64_t *)&qword_1000DD718);
  }
  return result;
}

unint64_t sub_100087B98()
{
  unint64_t result;

  result = qword_1000DD720;
  if (!qword_1000DD720)
  {
    result = swift_getWitnessTable(&unk_1000A28DC, &type metadata for GameCenterEntity);
    atomic_store(result, (unint64_t *)&qword_1000DD720);
  }
  return result;
}

uint64_t sub_100087BDC()
{
  return sub_100017C10(&qword_1000DD728, &qword_1000DD730, (uint64_t)&protocol conformance descriptor for _UniqueEntityProvider<A>);
}

uint64_t sub_100087C08(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_100087C20, 0, 0);
}

uint64_t sub_100087C20()
{
  uint64_t v0;
  _BYTE *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __n128 v5;

  if (qword_1000D8BB8 != -1)
    swift_once(&qword_1000D8BB8, sub_10001C000);
  v1 = *(_BYTE **)(v0 + 16);
  v2 = qword_1000E94C0;
  v3 = *(_QWORD *)(qword_1000E94C0 + 56);
  swift_retain(qword_1000E94C0);
  v4 = swift_retain(v3);
  SettingProperty.wrappedValue.getter(v4);
  swift_release(v3);
  v5 = swift_release(v2);
  *v1 = *(_BYTE *)(v0 + 24);
  return (*(uint64_t (**)(__n128))(v0 + 8))(v5);
}

uint64_t sub_100087CC4(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + 17) = *a2;
  return swift_task_switch(sub_100087CE0, 0, 0);
}

uint64_t sub_100087CE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __n128 v3;

  if (qword_1000D8BB8 != -1)
    swift_once(&qword_1000D8BB8, sub_10001C000);
  v1 = qword_1000E94C0;
  v2 = *(_QWORD *)(qword_1000E94C0 + 56);
  *(_BYTE *)(v0 + 16) = *(_BYTE *)(v0 + 17);
  swift_retain(v1);
  swift_retain(v2);
  SettingProperty.wrappedValue.setter(v0 + 16);
  swift_release(v2);
  v3 = swift_release(v1);
  return (*(uint64_t (**)(__n128))(v0 + 8))(v3);
}

uint64_t sub_100087D7C@<X0>(uint64_t a1@<X8>)
{
  return sub_100015C30(&qword_1000D8DC0, &qword_1000DD730, (uint64_t)qword_1000E9988, (uint64_t)sub_100087060, a1);
}

unint64_t sub_100087DA4()
{
  unint64_t result;

  result = qword_1000DD738;
  if (!qword_1000DD738)
  {
    result = swift_getWitnessTable(&unk_1000A2784, &type metadata for GameCenterEntity);
    atomic_store(result, (unint64_t *)&qword_1000DD738);
  }
  return result;
}

uint64_t sub_100087DE8()
{
  return sub_100017C10(&qword_1000DD740, &qword_1000DD730, (uint64_t)&protocol conformance descriptor for _UniqueEntityProvider<A>);
}

uint64_t sub_100087E14()
{
  uint64_t v0;

  v0 = qword_1000DD6D0;
  swift_bridgeObjectRetain(off_1000DD6D8);
  return v0;
}

unint64_t sub_100087E4C()
{
  unint64_t result;

  result = qword_1000DD748;
  if (!qword_1000DD748)
  {
    result = swift_getWitnessTable(&unk_1000A2914, &type metadata for GameCenterEntity);
    atomic_store(result, (unint64_t *)&qword_1000DD748);
  }
  return result;
}

uint64_t sub_100087E90@<X0>(uint64_t a1@<X8>)
{
  return sub_100015C30(&qword_1000D8DD0, &qword_1000DD7A0, (uint64_t)qword_1000E99B8, (uint64_t)sub_1000874F0, a1);
}

unint64_t sub_100087EB8()
{
  unint64_t result;

  result = qword_1000DD750;
  if (!qword_1000DD750)
  {
    result = swift_getWitnessTable(&unk_1000A293C, &type metadata for GameCenterEntity);
    atomic_store(result, (unint64_t *)&qword_1000DD750);
  }
  return result;
}

unint64_t sub_100087F00()
{
  unint64_t result;

  result = qword_1000DD758;
  if (!qword_1000DD758)
  {
    result = swift_getWitnessTable(&unk_1000A2964, &type metadata for GameCenterEntity);
    atomic_store(result, (unint64_t *)&qword_1000DD758);
  }
  return result;
}

unint64_t sub_100087F48()
{
  unint64_t result;

  result = qword_1000DD760;
  if (!qword_1000DD760)
  {
    result = swift_getWitnessTable(&unk_1000A298C, &type metadata for GameCenterEntity);
    atomic_store(result, (unint64_t *)&qword_1000DD760);
  }
  return result;
}

unint64_t sub_100087F90()
{
  unint64_t result;

  result = qword_1000DD768;
  if (!qword_1000DD768)
  {
    result = swift_getWitnessTable(&unk_1000A29E4, &type metadata for GameCenterEntity);
    atomic_store(result, (unint64_t *)&qword_1000DD768);
  }
  return result;
}

uint64_t sub_100087FD4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v4;
  uint64_t result;
  uint64_t v6;

  v4 = sub_10008838C();
  result = _UniqueEntity.id.getter(a1, v4);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_100088010(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_100088348();
  v4 = _URLRepresentableEntity.urlRepresentationParameter.getter(a1, v3);
  return sub_1000173B0(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8), v1, v4, v5);
}

uint64_t sub_100088058@<X0>(uint64_t a1@<X8>)
{
  return sub_100015D4C(&qword_1000D8DC8, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)qword_1000E99A0, (uint64_t)sub_1000872D8, a1);
}

uint64_t sub_10008807C()
{
  return sub_100017C10(&qword_1000DD778, &qword_1000DD780, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_1000880A8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100087DA4();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000880E4()
{
  unint64_t result;

  result = qword_1000DD788;
  if (!qword_1000DD788)
  {
    result = swift_getWitnessTable(&unk_1000A2A14, &type metadata for GameCenterEntity);
    atomic_store(result, (unint64_t *)&qword_1000DD788);
  }
  return result;
}

uint64_t sub_100088128()
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

  v0 = sub_100016484(&qword_1000D9500);
  __chkstk_darwin(v0);
  v2 = (char *)&v15 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_100016484(&qword_1000D9508);
  __chkstk_darwin(v3);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for LocalizedStringResource(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v15 - v11;
  LocalizedStringResource.init(stringLiteral:)(0x6E654320656D6147, 0xEB00000000726574);
  LocalizedStringResource.init(stringLiteral:)(0x9286E22073707041, 0xAD00007377654E20);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  v13 = type metadata accessor for DisplayRepresentation.Image(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v2, 1, 1, v13);
  LocalizedStringResource.init(stringLiteral:)(0x6E654320656D6147, 0xEB00000000726574);
  return DisplayRepresentation.init(title:subtitle:image:synonyms:descriptionText:)(v12, v5, v2, _swiftEmptyArrayStorage, v10);
}

uint64_t sub_1000882F0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100087F90();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for GameCenterEntity()
{
  return &type metadata for GameCenterEntity;
}

ValueMetadata *type metadata accessor for GameCenterEntity.UpdateIntent_value()
{
  return &type metadata for GameCenterEntity.UpdateIntent_value;
}

unint64_t sub_100088348()
{
  unint64_t result;

  result = qword_1000DD790;
  if (!qword_1000DD790)
  {
    result = swift_getWitnessTable(&unk_1000A283C, &type metadata for GameCenterEntity);
    atomic_store(result, (unint64_t *)&qword_1000DD790);
  }
  return result;
}

unint64_t sub_10008838C()
{
  unint64_t result;

  result = qword_1000DD798;
  if (!qword_1000DD798)
  {
    result = swift_getWitnessTable(&unk_1000A27DC, &type metadata for GameCenterEntity);
    atomic_store(result, (unint64_t *)&qword_1000DD798);
  }
  return result;
}

uint64_t sub_1000883D0@<X0>(uint64_t a1@<X8>)
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
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t OpaqueTypeConformance2;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t KeyPath;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;

  v34 = a1;
  v1 = sub_100016484(&qword_1000D9668);
  v30 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v3 = (char *)&KeyPath - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100016484(&qword_1000D9670);
  v31 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v6 = (char *)&KeyPath - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100016484(&qword_1000D9678);
  v8 = *(_QWORD *)(v7 - 8);
  v32 = v7;
  v33 = v8;
  __chkstk_darwin(v7);
  v10 = (char *)&KeyPath - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(&unk_1000A2AF8);
  v11 = sub_100016484(&qword_1000D9680);
  v12 = sub_1000812C8();
  v13 = sub_1000164C4(&qword_1000D9688);
  v14 = type metadata accessor for TitleOnlyLabelStyle(255);
  v15 = sub_100017C10(&qword_1000D9690, &qword_1000D9688, (uint64_t)&protocol conformance descriptor for Label<A, B>);
  v16 = sub_100027298();
  v35 = v13;
  v36 = v14;
  v37 = v15;
  v38 = v16;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v35, &opaque type descriptor for <<opaque return type of View.labelStyle<A>(_:)>>, 1);
  ControlToggle.init<A, B, C, D, E, F, G>(kind:intentUpdatableProperty:title:subtitle:value:)(0xD00000000000001FLL, 0x80000001000A9A40, KeyPath, sub_1000886DC, 0, sub_1000162DC, 0, sub_100016344, 0, v11, &type metadata for Text, &type metadata for Text, v12, OpaqueTypeConformance2, &protocol witness table for Text, &protocol witness table for Text);
  v18 = LocalizedStringKey.init(stringLiteral:)(0x6E654320656D6147, 0xEB00000000726574);
  v20 = v19;
  LOBYTE(v15) = v21;
  v23 = v22;
  v24 = sub_100017C10((unint64_t *)&unk_1000D96A0, &qword_1000D9668, (uint64_t)&protocol conformance descriptor for ControlToggle<A>);
  WidgetConfiguration.configurationDisplayName(_:)(v18, v20, v15 & 1, v23, v1, v24);
  swift_bridgeObjectRelease(v23);
  swift_bridgeObjectRelease(v20);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v3, v1);
  v35 = v1;
  v36 = v24;
  v25 = swift_getOpaqueTypeConformance2(&v35, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  WidgetConfiguration.disablesControlStateCaching()(v4, v25);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v6, v4);
  v35 = v4;
  v36 = v25;
  v26 = swift_getOpaqueTypeConformance2(&v35, &opaque type descriptor for <<opaque return type of WidgetConfiguration.disablesControlStateCaching()>>, 1);
  v27 = v32;
  WidgetConfiguration.hiddenControl()(v32, v26);
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v10, v27);
}

uint64_t sub_1000886DC()
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
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;

  v0 = type metadata accessor for TitleOnlyLabelStyle(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100016484(&qword_1000D9688);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = LocalizedStringKey.init(stringLiteral:)(0x6E654320656D6147, 0xEB00000000726574);
  v9 = Label<>.init(_:systemImage:)(v8);
  TitleOnlyLabelStyle.init()(v9);
  v10 = sub_100017C10(&qword_1000D9690, &qword_1000D9688, (uint64_t)&protocol conformance descriptor for Label<A, B>);
  v11 = sub_100027298();
  View.labelStyle<A>(_:)(v3, v4, v0, v10, v11);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_10008883C()
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

  v0 = sub_100016484(&qword_1000D9558);
  __chkstk_darwin(v0);
  v30 = (char *)&v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for InputConnectionBehavior(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v29 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100016484(&qword_1000D9560);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v25 - v9;
  v11 = sub_100016484(&qword_1000D9508);
  __chkstk_darwin(v11);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for LocalizedStringResource(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_100016484(&qword_1000DD7D0);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000015, 0x80000001000A99A0);
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
  v21 = sub_100087DA4();
  v25 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v17, v13, &v32, v10, v8, v20, v21);
  sub_100016484(&qword_1000D9570);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000024, 0x80000001000A99C0);
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

uint64_t sub_100088B60@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *a1;
  *a2 = v2;
  return swift_retain(v2);
}

ValueMetadata *type metadata accessor for GameCenterToggleControl()
{
  return &type metadata for GameCenterToggleControl;
}

uint64_t sub_100088B7C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000B46EC, 1);
}

uint64_t sub_100088B90()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  char v7;

  v1 = objc_msgSend(*(id *)(v0 + 24), "userID");
  if (v1)
  {
    v2 = v1;
    v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);
    v5 = v4;

  }
  else
  {
    v3 = 0;
    v5 = 0;
  }
  v6 = objc_msgSend(*(id *)(v0 + 16), "possiblyUnfetchedAppConfiguration");
  if ((objc_msgSend(v6, "respondsToSelector:", "widgetTelemetrySamplingRate") & 1) != 0)
    objc_msgSend(v6, "widgetTelemetrySamplingRate");
  swift_unknownObjectRelease(v6);
  v7 = sub_100088D68(v3, v5);
  swift_bridgeObjectRelease(v5);
  return v7 & 1;
}

uint64_t sub_100088C70()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for TelemetryEnablement()
{
  return objc_opt_self(_TtC10NewsToday219TelemetryEnablement);
}

uint64_t sub_100088CBC(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  result = __DataStorage._bytes.getter();
  v5 = result;
  if (result)
  {
    result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }
    v5 += a1 - result;
  }
  v6 = __OFSUB__(a2, a1);
  v7 = a2 - a1;
  if (v6)
  {
    __break(1u);
    goto LABEL_13;
  }
  v8 = __DataStorage._length.getter();
  if (v8 >= v7)
    v9 = v7;
  else
    v9 = v8;
  v10 = v5 + v9;
  if (v5)
    v11 = v10;
  else
    v11 = 0;
  v12 = type metadata accessor for SHA256(0);
  v13 = sub_1000893B4();
  return dispatch thunk of HashFunction.update(bufferPointer:)(v5, v11, v12, v13);
}

uint64_t sub_100088D68(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v17;
  _QWORD v18[5];
  int v19;

  v4 = type metadata accessor for SHA256(0);
  __chkstk_darwin(v4);
  v5 = type metadata accessor for SHA256Digest(0);
  v18[4] = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v6 = type metadata accessor for String.Encoding(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v18[3] = v5;
    static String.Encoding.utf8.getter(v8);
    String.data(using:allowLossyConversion:)(v10, 0, a1, a2);
    v12 = v11;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    if (v12 >> 60 != 15)
    {
      v19 = 0;
      v17 = sub_1000893B4();
      dispatch thunk of HashFunction.init()(v4, v17);
      __asm { BR              X10 }
    }
    v13 = FCAnalyticsLog;
    v14 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("TelemetryEnablement failed to convert the user ID to valid data", 63, 2, &_mh_execute_header, v13, v14, _swiftEmptyArrayStorage);
  }
  else
  {
    v13 = FCAnalyticsLog;
    v15 = static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("TelemetryEnablement has no user ID to hash", 42, 2, &_mh_execute_header, v13, v15, _swiftEmptyArrayStorage);
  }

  return 0;
}

unint64_t sub_1000893B4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000DD888;
  if (!qword_1000DD888)
  {
    v1 = type metadata accessor for SHA256(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for SHA256, v1);
    atomic_store(result, (unint64_t *)&qword_1000DD888);
  }
  return result;
}

uint64_t sub_1000893FC(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_100089410(result, a2);
  return result;
}

uint64_t sub_100089410(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain(result);
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100089454(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_10001BB50(result, a2);
  return result;
}

uint64_t destroy for AudioPlayButton(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
}

uint64_t _s10NewsToday215AudioPlayButtonVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t assignWithCopy for AudioPlayButton(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for AudioPlayButton(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for AudioPlayButton(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 17))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AudioPlayButton(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 17) = 1;
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
    *(_BYTE *)(result + 17) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AudioPlayButton()
{
  return &type metadata for AudioPlayButton;
}

uint64_t sub_1000895D0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000B478C, 1);
}

void sub_1000895E0(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t *a4@<X8>)
{
  uint64_t v5;
  char *v6;
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t KeyPath;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  void (*v40)(char *, char *, uint64_t);
  char *v41;
  void (*v42)(char *, char *, uint64_t);
  void (*v43)(char *, uint64_t);
  char *v44;
  uint64_t v45;
  unsigned int *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  __n128 v55;
  void (*v56)(char *, char *, uint64_t, __n128);
  char *v57;
  char v58;
  char v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(char *, uint64_t);
  unint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  int v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t *v81;
  char *v82;
  int v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  char v92;
  _QWORD v93[2];
  uint64_t v94;
  unsigned __int8 v95;
  uint64_t v96;
  unsigned __int8 v97;
  uint64_t v98;
  uint64_t v99;

  v83 = a3;
  v91 = a1;
  v81 = a4;
  v89 = type metadata accessor for PlaybackButton.State(0);
  v87 = *(_QWORD *)(v89 - 8);
  __chkstk_darwin(v89);
  v6 = (char *)&v67 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = sub_100016484(&qword_1000DA2B0);
  v7 = __chkstk_darwin(v71);
  v9 = (char *)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v67 - v10;
  v12 = type metadata accessor for Date(0);
  v80 = *(_QWORD *)(v12 - 8);
  v13 = __chkstk_darwin(v12);
  v15 = (char *)&v67 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v17 = (char *)&v67 - v16;
  v75 = sub_100016484(&qword_1000DA2B8);
  v18 = __chkstk_darwin(v75);
  v20 = (char *)&v67 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v84 = (uint64_t)&v67 - v21;
  v22 = type metadata accessor for PlaybackButton(0);
  v88 = *(_QWORD *)(v22 - 8);
  v23 = __chkstk_darwin(v22);
  v90 = (char *)&v67 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __chkstk_darwin(v23);
  v82 = (char *)&v67 - v26;
  v27 = __chkstk_darwin(v25);
  v86 = (char *)&v67 - v28;
  v29 = static Color.black.getter(v27);
  v85 = Color.opacity(_:)(0.5);
  swift_release(v29);
  KeyPath = swift_getKeyPath(&unk_1000A2BE0);
  v31 = static Alignment.center.getter(KeyPath);
  _FrameLayout.init(width:height:alignment:)(&v94, 0x403C000000000000, 0, 0x403C000000000000, 0, v31, v32);
  v79 = v94;
  v74 = v95;
  v78 = v96;
  v73 = v97;
  v77 = v98;
  v76 = v99;
  swift_bridgeObjectRetain(a2);
  v91 = sub_10004F328(v91, a2);
  v72 = v33;
  Date.init(timeIntervalSinceNow:)(0.0);
  Date.init(timeIntervalSinceNow:)(INFINITY);
  v34 = sub_100089C08();
  if ((dispatch thunk of static Comparable.<= infix(_:_:)(v17, v15, v12, v34) & 1) != 0)
  {
    v35 = v71;
    v36 = *(int *)(v71 + 48);
    v70 = KeyPath;
    v37 = &v11[v36];
    v68 = v6;
    v69 = v22;
    v38 = v9;
    v39 = v80;
    v40 = *(void (**)(char *, char *, uint64_t))(v80 + 32);
    v40(v11, v17, v12);
    v40(v37, v15, v12);
    v41 = &v38[*(int *)(v35 + 48)];
    v42 = *(void (**)(char *, char *, uint64_t))(v39 + 16);
    v42(v38, v11, v12);
    v42(v41, v37, v12);
    v40(v20, v38, v12);
    v43 = *(void (**)(char *, uint64_t))(v39 + 8);
    v43(v41, v12);
    v44 = &v38[*(int *)(v35 + 48)];
    v40(v38, v11, v12);
    v40(v44, v37, v12);
    v40(&v20[*(int *)(v75 + 36)], v44, v12);
    v43(v38, v12);
    v45 = v84;
    sub_100023E10((uint64_t)v20, v84);
    v46 = (unsigned int *)&enum case for PlaybackButton.State.playing(_:);
    if ((v83 & 1) == 0)
      v46 = (unsigned int *)&enum case for PlaybackButton.State.unplayed(_:);
    v47 = v68;
    (*(void (**)(char *, _QWORD, uint64_t))(v87 + 104))(v68, *v46, v89);
    v48 = v91;
    v49 = v72;
    v93[0] = v91;
    v93[1] = v72;
    v50 = sub_10004EB9C();
    swift_retain(v48);
    swift_retain(v49);
    v66 = v50;
    v51 = v82;
    PlaybackButton.init<A>(interval:state:intent:playSystemImage:pauseSystemImage:)(v45, v47, v93, 0, 0, 0, 0, &type metadata for ToggleAudioPlaybackIntent, v66);
    v52 = v88;
    v53 = v86;
    v54 = v69;
    (*(void (**)(char *, char *, uint64_t))(v88 + 32))(v86, v51, v69);
    swift_release(v49);
    v55 = swift_release(v48);
    LOBYTE(v93[0]) = v74;
    v92 = v73;
    v56 = *(void (**)(char *, char *, uint64_t, __n128))(v52 + 16);
    v57 = v90;
    v56(v90, v53, v54, v55);
    v58 = v93[0];
    v59 = v92;
    v60 = v81;
    v61 = v70;
    v62 = v85;
    *v81 = v70;
    v60[1] = v62;
    v60[2] = v79;
    *((_BYTE *)v60 + 24) = v58;
    v60[4] = v78;
    *((_BYTE *)v60 + 40) = v59;
    v63 = v76;
    v60[6] = v77;
    v60[7] = v63;
    v64 = sub_100016484(&qword_1000DD898);
    ((void (*)(char *, char *, uint64_t))v56)((char *)v60 + *(int *)(v64 + 48), v57, v54);
    v65 = *(void (**)(char *, uint64_t))(v52 + 8);
    swift_retain(v61);
    swift_retain(v62);
    v65(v53, v54);
    v65(v57, v54);
    swift_release(v62);
    swift_release(v61);
  }
  else
  {
    __break(1u);
  }
}

void sub_100089BA8(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)v2;
  v5 = *(_QWORD *)(v2 + 8);
  v6 = *(unsigned __int8 *)(v2 + 16);
  *a2 = static Alignment.center.getter(a1);
  a2[1] = v7;
  v8 = sub_100016484(&qword_1000DD890);
  sub_1000895E0(v4, v5, v6, (_QWORD *)((char *)a2 + *(int *)(v8 + 44)));
}

unint64_t sub_100089C08()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000DA2C0;
  if (!qword_1000DA2C0)
  {
    v1 = type metadata accessor for Date(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for Date, v1);
    atomic_store(result, (unint64_t *)&qword_1000DA2C0);
  }
  return result;
}

unint64_t sub_100089C54()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000DD8A0;
  if (!qword_1000DD8A0)
  {
    v1 = sub_1000164C4(&qword_1000DD8A8);
    result = swift_getWitnessTable(&protocol conformance descriptor for ZStack<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1000DD8A0);
  }
  return result;
}

uint64_t type metadata accessor for BiomeEventStore()
{
  return objc_opt_self(_TtC10NewsToday215BiomeEventStore);
}

void sub_100089CC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  void *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  _QWORD *v31;
  double v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void **aBlock;
  uint64_t v41;
  void (*v42)(uint64_t, void *);
  void *v43;
  void *v44;
  _QWORD *v45;

  v37 = a7;
  v38 = a8;
  v39 = a5;
  v35 = a3;
  v12 = type metadata accessor for TaskContext(0);
  v36 = *(_QWORD *)(v12 - 8);
  v13 = *(_QWORD *)(v36 + 64);
  __chkstk_darwin(v12);
  v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_100016484(&qword_1000DA2B8);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(_QWORD *)(v16 + 64);
  __chkstk_darwin(v15);
  v18 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = swift_allocObject(&unk_1000CC968, 32, 7);
  *(_QWORD *)(v19 + 16) = a1;
  *(_QWORD *)(v19 + 24) = a2;
  v20 = (_QWORD *)swift_allocObject(&unk_1000CC990, 56, 7);
  v20[2] = a6;
  v20[3] = sub_10004C49C;
  v21 = v35;
  v20[4] = v19;
  v20[5] = v21;
  v20[6] = a4;
  v44 = sub_10008B26C;
  v45 = v20;
  aBlock = _NSConcreteStackBlock;
  v41 = 1107296256;
  v42 = sub_10008A20C;
  v43 = &unk_1000CC9A8;
  v22 = _Block_copy(&aBlock);
  v23 = v45;
  swift_retain(a2);
  swift_retain(a6);
  swift_retain(a4);
  swift_release(v23);
  sub_10008B19C(v37, (uint64_t)v18);
  sub_10008B294(v38, (uint64_t)v14);
  v24 = *(unsigned __int8 *)(v16 + 80);
  v25 = (v24 + 16) & ~v24;
  v26 = *(unsigned __int8 *)(v36 + 80);
  v27 = (v17 + v26 + v25) & ~v26;
  v28 = (v13 + v27 + 7) & 0xFFFFFFFFFFFFFFF8;
  v29 = swift_allocObject(&unk_1000CC9E0, v28 + 8, v24 | v26 | 7);
  sub_10003C95C((uint64_t)v18, v29 + v25, &qword_1000DA2B8);
  sub_1000856A8((uint64_t)v14, v29 + v27);
  *(_QWORD *)(v29 + v28) = a6;
  v44 = sub_10008B430;
  v45 = (_QWORD *)v29;
  aBlock = _NSConcreteStackBlock;
  v41 = 1107296256;
  v42 = sub_10008A20C;
  v43 = &unk_1000CC9F8;
  v30 = _Block_copy(&aBlock);
  v31 = v45;
  swift_retain(a6);
  *(_QWORD *)&v32 = swift_release(v31).n128_u64[0];
  v33 = objc_msgSend(v39, "sinkWithCompletion:receiveInput:", v22, v30, v32);
  _Block_release(v30);
  _Block_release(v22);

}

uint64_t sub_100089F50(void *a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4, void (*a5)(id))
{
  id v9;
  id v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[3];
  uint64_t v29;
  unint64_t v30;

  v9 = objc_msgSend(a1, "state");
  if (v9 == (id)1)
  {
    v10 = objc_msgSend(a1, "error");
    v11 = v10;
    if (!v10)
    {
      v12 = sub_10008B4EC();
      v10 = (id)swift_allocError(&type metadata for BiomeEventStore.Errors, v12, 0, 0);
      v11 = v10;
    }
    v13 = static os_log_type_t.error.getter(v10);
    v14 = sub_100016484(&qword_1000DA0A0);
    v15 = swift_allocObject(v14, 72, 7);
    *(_OWORD *)(v15 + 16) = xmmword_10009CCD0;
    v29 = 0;
    v30 = 0xE000000000000000;
    v28[0] = v11;
    v16 = sub_100016484(&qword_1000DA0A8);
    _print_unlocked<A, B>(_:_:)(v28, &v29, v16, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
    v17 = v29;
    v18 = v30;
    *(_QWORD *)(v15 + 56) = &type metadata for String;
    *(_QWORD *)(v15 + 64) = sub_10001A300();
    *(_QWORD *)(v15 + 32) = v17;
    *(_QWORD *)(v15 + 40) = v18;
    sub_10001A344();
    v19 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)("event store encountered error %@", 32, 2, &_mh_execute_header, v19, v13, v15);
    swift_bridgeObjectRelease(v15);

    a5(v11);
    return swift_errorRelease(v11);
  }
  else if (v9)
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x656C646E61686E75, 0xEE00657361632064, "NewsToday2/EventStore.swift", 27, 2, 87, 0);
    __break(1u);
  }
  else
  {
    v21 = sub_100016484(&qword_1000DA0A0);
    v22 = swift_allocObject(v21, 72, 7);
    *(_OWORD *)(v22 + 16) = xmmword_10009CCD0;
    swift_beginAccess(a2 + 16, &v29, 0, 0);
    v23 = *(_QWORD *)(*(_QWORD *)(a2 + 16) + 16);
    *(_QWORD *)(v22 + 56) = &type metadata for Int;
    *(_QWORD *)(v22 + 64) = &protocol witness table for Int;
    *(_QWORD *)(v22 + 32) = v23;
    sub_10001A344();
    v24 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)("event store found %zd events", v27);
    swift_bridgeObjectRelease(v22);

    swift_beginAccess(a2 + 16, v28, 0, 0);
    v25 = *(_QWORD *)(a2 + 16);
    v26 = swift_bridgeObjectRetain(v25);
    a3(v26);
    return swift_bridgeObjectRelease(v25);
  }
  return result;
}

void sub_10008A210(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  char v28;
  char v29;
  void (*v30)(char *, uint64_t);
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t);
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t);
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  id v54;
  _QWORD *v55;
  _QWORD *v56;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  _BYTE v68[24];
  __int128 v69;
  uint64_t v70;
  _QWORD v71[6];

  v62 = a4;
  v64 = a3;
  v6 = sub_100016484(&qword_1000DBB78);
  __chkstk_darwin(v6);
  v8 = (char *)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for InternalWidgetFamily(0);
  v66 = *(_QWORD *)(v9 - 8);
  v67 = v9;
  v10 = __chkstk_darwin(v9);
  v63 = (char *)&v60 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v65 = (char *)&v60 - v12;
  v13 = sub_100016484(&qword_1000DA2B8);
  __chkstk_darwin(v13);
  v15 = (char *)&v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for Date(0);
  v17 = *(_QWORD *)(v16 - 8);
  v18 = __chkstk_darwin(v16);
  v20 = (char *)&v60 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v22 = (char *)&v60 - v21;
  v23 = objc_msgSend(a1, "eventBody");
  if (!v23)
    return;
  v24 = v23;
  v25 = objc_msgSend(v23, "homeScreenEvent");

  if (!v25)
    return;
  v61 = v25;
  v26 = objc_msgSend(v25, "date");
  static Date._unconditionallyBridgeFromObjectiveC(_:)(v26);

  v27 = sub_1000179D4((unint64_t *)&qword_1000DA2C0, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
  v28 = dispatch thunk of static Comparable.>= infix(_:_:)(v22, a2, v16, v27);
  (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v20, v22, v16);
  sub_10008B19C(a2, (uint64_t)v15);
  if ((v28 & 1) == 0)
  {
    sub_10001DD10((uint64_t)v15, &qword_1000DA2B8);
    v47 = *(void (**)(char *, uint64_t))(v17 + 8);
    v47(v20, v16);
    v47(v22, v16);
    goto LABEL_10;
  }
  v29 = dispatch thunk of static Comparable.<= infix(_:_:)(v20, &v15[*(int *)(v13 + 36)], v16, v27);
  sub_10001DD10((uint64_t)v15, &qword_1000DA2B8);
  v30 = *(void (**)(char *, uint64_t))(v17 + 8);
  v30(v20, v16);
  v30(v22, v16);
  if ((v29 & 1) == 0)
  {
LABEL_10:

    return;
  }
  v31 = v61;
  v32 = objc_msgSend(v61, "widgetSize");
  if ((unint64_t)v32 >= 4)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v66 + 56))(v8, 1, 1, v67);

    sub_10001DD10((uint64_t)v8, &qword_1000DBB78);
    return;
  }
  v33 = v66;
  v34 = v67;
  (*(void (**)(char *, _QWORD, uint64_t))(v66 + 104))(v8, *(unsigned int *)*(&off_1000CCAB0 + (_QWORD)v32), v67);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v8, 0, 1, v34);
  v35 = v65;
  v36 = (*(uint64_t (**)(char *, char *, uint64_t))(v33 + 32))(v65, v8, v34);
  v37 = v63;
  TimelineProviderContext.internalFamily.getter(v36);
  v38 = sub_1000179D4((unint64_t *)&qword_1000DB890, (uint64_t (*)(uint64_t))&type metadata accessor for InternalWidgetFamily, (uint64_t)&protocol conformance descriptor for InternalWidgetFamily);
  dispatch thunk of RawRepresentable.rawValue.getter(v71, v34, v38);
  dispatch thunk of RawRepresentable.rawValue.getter(&v69, v34, v38);
  v39 = v71[0];
  v40 = v69;
  v41 = *(void (**)(char *, uint64_t))(v33 + 8);
  v41(v37, v34);
  if (v39 != v40)
    goto LABEL_24;
  v42 = objc_msgSend(v61, "widgetBundleId");
  if (v42)
  {
    v43 = v42;
    v44 = static String._unconditionallyBridgeFromObjectiveC(_:)(v42);
    v46 = v45;

  }
  else
  {
    v44 = 0;
    v46 = 0;
  }
  v48 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v49 = objc_msgSend(v48, "bundleIdentifier");

  if (!v49)
  {
    if (!v46)
      goto LABEL_26;
    goto LABEL_21;
  }
  v50 = static String._unconditionallyBridgeFromObjectiveC(_:)(v49);
  v52 = v51;

  if (!v46)
  {
    if (!v52)
      goto LABEL_26;
    goto LABEL_23;
  }
  if (!v52)
  {
LABEL_21:
    v52 = v46;
LABEL_23:
    swift_bridgeObjectRelease(v52);
LABEL_24:
    v41(v35, v34);
    goto LABEL_10;
  }
  if (v44 == v50 && v46 == v52)
  {
    swift_bridgeObjectRelease(v46);
    swift_bridgeObjectRelease(v52);
    goto LABEL_26;
  }
  v53 = _stringCompareWithSmolCheck(_:_:expecting:)(v44, v46, v50, v52, 0);
  swift_bridgeObjectRelease(v46);
  swift_bridgeObjectRelease(v52);
  if ((v53 & 1) == 0)
    goto LABEL_24;
LABEL_26:
  v54 = v61;
  sub_10008A810((uint64_t)&v69);
  if (v70)
  {
    v55 = (_QWORD *)(v62 + 16);
    sub_10006BE70(&v69, (uint64_t)v71);
    sub_10001DDCC((uint64_t)v71, (uint64_t)&v69);
    swift_beginAccess(v55, v68, 33, 0);
    v56 = (_QWORD *)*v55;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v55);
    *v55 = v56;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v56 = sub_100068C10(0, v56[2] + 1, 1, v56);
      *v55 = v56;
    }
    v59 = v56[2];
    v58 = v56[3];
    if (v59 >= v58 >> 1)
    {
      v56 = sub_100068C10((_QWORD *)(v58 > 1), v59 + 1, 1, v56);
      *v55 = v56;
    }
    v56[2] = v59 + 1;
    sub_10006BE70(&v69, (uint64_t)&v56[5 * v59 + 4]);
    swift_endAccess(v68);

    sub_10001BBD8(v71);
    v41(v35, v34);
  }
  else
  {
    v41(v35, v34);

    sub_10001DD10((uint64_t)&v69, &qword_1000DC708);
  }
}

void sub_10008A810(uint64_t a1@<X8>)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  NSString v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  _QWORD *v25;
  id v26;
  id v27;
  char v28;
  id v29;
  char v30;
  uint64_t v31;
  _QWORD *v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  _QWORD *v46;
  _QWORD *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  id v51;

  v3 = sub_100016484((uint64_t *)&unk_1000D9EF0);
  v4 = __chkstk_darwin(v3);
  v6 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v50 - v7;
  v9 = type metadata accessor for Date(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = objc_msgSend(v1, "eventTypeString");
  if (!v13)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0);
    v15 = v14;
    v13 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v15);
  }
  v16 = v13;
  if ((objc_msgSend(v16, "isEqualToString:", CFSTR("Unknown")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("HomeScreenPageShown")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("HomeScreenDisappeared")) & 1) != 0
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("StackChanged")) & 1) != 0)
  {
    goto LABEL_20;
  }
  if ((objc_msgSend(v16, "isEqualToString:", CFSTR("WidgetTapped")) & 1) == 0)
  {
    if ((objc_msgSend(v16, "isEqualToString:", CFSTR("WidgetLongLook")) & 1) == 0
      && (objc_msgSend(v16, "isEqualToString:", CFSTR("WidgetUserFeedback")) & 1) == 0
      && (objc_msgSend(v16, "isEqualToString:", CFSTR("UserStackConfigChanged")) & 1) == 0
      && (objc_msgSend(v16, "isEqualToString:", CFSTR("DeviceLocked")) & 1) == 0
      && (objc_msgSend(v16, "isEqualToString:", CFSTR("DeviceUnlocked")) & 1) == 0
      && (objc_msgSend(v16, "isEqualToString:", CFSTR("PinnedWidgetAdded")) & 1) == 0
      && (objc_msgSend(v16, "isEqualToString:", CFSTR("PinnedWidgetDeleted")) & 1) == 0
      && (objc_msgSend(v16, "isEqualToString:", CFSTR("SpecialPageAppeared")) & 1) == 0
      && (objc_msgSend(v16, "isEqualToString:", CFSTR("SpecialPageDisappeared")) & 1) == 0)
    {
      if ((objc_msgSend(v16, "isEqualToString:", CFSTR("StackShown")) & 1) != 0)
      {

        v26 = objc_msgSend(v1, "date");
        static Date._unconditionallyBridgeFromObjectiveC(_:)(v26);

        v27 = objc_msgSend(v1, "stackKind");
        if ((unint64_t)v27 >= 4)
          v28 = 0;
        else
          v28 = (char)v27;
        v29 = objc_msgSend(v1, "stackLocation");
        if ((unint64_t)v29 >= 6)
          v30 = 0;
        else
          v30 = (char)v29;
        v31 = type metadata accessor for AppearanceEvent(0);
        *(_QWORD *)(a1 + 24) = v31;
        *(_QWORD *)(a1 + 32) = &off_1000C9138;
        v32 = sub_10008B4B0((_QWORD *)a1);
        (*(void (**)(_QWORD *, char *, uint64_t))(v10 + 32))(v32, v12, v9);
        *((_BYTE *)v32 + *(int *)(v31 + 20)) = v28;
        *((_BYTE *)v32 + *(int *)(v31 + 24)) = v30;
        return;
      }
      if ((objc_msgSend(v16, "isEqualToString:", CFSTR("StackDisappeared")) & 1) != 0)
      {

        v51 = objc_msgSend(v1, "date");
        *(_QWORD *)(a1 + 24) = type metadata accessor for DisappearanceEvent(0);
        *(_QWORD *)(a1 + 32) = &off_1000C9148;
        sub_10008B4B0((_QWORD *)a1);
        static Date._unconditionallyBridgeFromObjectiveC(_:)(v51);

        return;
      }
      if ((objc_msgSend(v16, "isEqualToString:", CFSTR("StackCreated")) & 1) == 0
        && (objc_msgSend(v16, "isEqualToString:", CFSTR("StackDeleted")) & 1) == 0
        && (objc_msgSend(v16, "isEqualToString:", CFSTR("WidgetAddedToStack")) & 1) == 0
        && (objc_msgSend(v16, "isEqualToString:", CFSTR("WidgetRemovedFromStack")) & 1) == 0)
      {
        if ((objc_msgSend(v16, "isEqualToString:", CFSTR("StackVisibilityChanged")) & 1) != 0)
        {

          v33 = objc_msgSend(v1, "metadata");
          if (v33)
          {
            v34 = v33;
            v35 = objc_msgSend(v33, "visibleRect");

            if (v35)
            {
              objc_msgSend(v35, "rect");
              v37 = v36;
              v39 = v38;
              v41 = v40;
              v43 = v42;

              v44 = objc_msgSend(v1, "date");
              v45 = type metadata accessor for VisibleRectChangedEvent(0);
              *(_QWORD *)(a1 + 24) = v45;
              *(_QWORD *)(a1 + 32) = &off_1000C9168;
              v46 = sub_10008B4B0((_QWORD *)a1);
              static Date._unconditionallyBridgeFromObjectiveC(_:)(v44);

              v47 = (_QWORD *)((char *)v46 + *(int *)(v45 + 20));
              *v47 = v37;
              v47[1] = v39;
              v47[2] = v41;
              v47[3] = v43;
              return;
            }
          }
          v48 = static os_log_type_t.error.getter(v33);
          sub_10001A344();
          v49 = (void *)static OS_os_log.default.getter();
          os_log(_:dso:log:type:_:)("event store found visibility changed event without rect", 55, 2, &_mh_execute_header, v49, v48, _swiftEmptyArrayStorage);

LABEL_21:
          *(_QWORD *)(a1 + 32) = 0;
          *(_OWORD *)a1 = 0u;
          *(_OWORD *)(a1 + 16) = 0u;
          return;
        }
        if ((objc_msgSend(v16, "isEqualToString:", CFSTR("AppAdded")) & 1) == 0)
          objc_msgSend(v16, "isEqualToString:", CFSTR("AppRemoved"));
      }
    }
LABEL_20:

    goto LABEL_21;
  }

  v17 = objc_msgSend(v1, "metadata");
  if (v17)
  {
    v18 = v17;
    v19 = objc_msgSend(v17, "engagedUrl");

    if (v19)
    {
      static URL._unconditionallyBridgeFromObjectiveC(_:)(v19);

      v20 = type metadata accessor for URL(0);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v6, 0, 1, v20);
    }
    else
    {
      v22 = type metadata accessor for URL(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v6, 1, 1, v22);
    }
    sub_10003C95C((uint64_t)v6, (uint64_t)v8, (uint64_t *)&unk_1000D9EF0);
  }
  else
  {
    v21 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v8, 1, 1, v21);
  }
  v23 = objc_msgSend(v1, "date");
  v24 = type metadata accessor for EngagementEvent(0);
  *(_QWORD *)(a1 + 24) = v24;
  *(_QWORD *)(a1 + 32) = &off_1000C9158;
  v25 = sub_10008B4B0((_QWORD *)a1);
  static Date._unconditionallyBridgeFromObjectiveC(_:)(v23);

  sub_10003C95C((uint64_t)v8, (uint64_t)v25 + *(int *)(v24 + 20), (uint64_t *)&unk_1000D9EF0);
}

uint64_t sub_10008AE8C(uint64_t a1, uint8_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  Swift::String v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  const __CFDate *isa;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t *v23;
  uint64_t v24;
  uint8_t *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;

  v4 = sub_100016484(&qword_1000DA2B8);
  __chkstk_darwin(v4);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10008B19C(a1, (uint64_t)v6);
  sub_10001A344();
  v7 = static OS_os_log.default.getter();
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc(12, -1);
    v10 = swift_slowAlloc(32, -1);
    v25 = a2;
    v26 = 0;
    v11 = v10;
    v24 = a1;
    *(_DWORD *)v9 = 136315138;
    v23 = v9 + 4;
    v27 = 0xE000000000000000;
    v28 = v10;
    v12 = type metadata accessor for Date(0);
    _print_unlocked<A, B>(_:_:)(v6, &v26, v12, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
    v13._countAndFlagsBits = 3026478;
    v13._object = (void *)0xE300000000000000;
    String.append(_:)(v13);
    _print_unlocked<A, B>(_:_:)(&v6[*(int *)(v4 + 36)], &v26, v12, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
    v14 = v27;
    v26 = sub_100084DB0(v26, v27, &v28);
    a1 = v24;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27, v23, v9 + 12);
    swift_bridgeObjectRelease(v14);
    sub_10001DD10((uint64_t)v6, &qword_1000DA2B8);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "event store querying for events in range %s", v9, 0xCu);
    swift_arrayDestroy(v11, 1, (char *)&type metadata for Any + 8);
    v15 = v11;
    a2 = v25;
    swift_slowDealloc(v15, -1, -1);
    swift_slowDealloc(v9, -1, -1);

  }
  else
  {

    sub_10001DD10((uint64_t)v6, &qword_1000DA2B8);
  }
  v16 = objc_msgSend(objc_allocWithZone((Class)ATXBiomeUIStream), "init");
  isa = Date._bridgeToObjectiveC()().super.isa;
  v18 = swift_allocObject(&unk_1000CC940, 24, 7);
  *(_QWORD *)(v18 + 16) = _swiftEmptyArrayStorage;
  v19 = objc_msgSend(v16, "publisherFromStartTime:", CFDateGetAbsoluteTime(isa));
  *(&v23 - 4) = (uint8_t *)__chkstk_darwin(v19);
  *(&v23 - 3) = (uint8_t *)v18;
  *(&v23 - 2) = (uint8_t *)a1;
  *(&v23 - 1) = a2;
  v20 = sub_100016484(&qword_1000DD948);
  swift_allocObject(v20, *(unsigned int *)(v20 + 48), *(unsigned __int16 *)(v20 + 52));
  v21 = Promise.init(resolver:)(sub_10008B208, &v23 - 6);

  swift_release(v18);
  return v21;
}

uint64_t sub_10008B19C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100016484(&qword_1000DA2B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10008B1E4()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_10008B208(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  sub_100089CC0(a1, a2, a3, a4, *(void **)(v4 + 16), *(_QWORD *)(v4 + 24), *(_QWORD *)(v4 + 32), *(_QWORD *)(v4 + 40));
}

uint64_t sub_10008B214()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10008B238()
{
  _QWORD *v0;

  swift_release(v0[2]);
  swift_release(v0[4]);
  swift_release(v0[6]);
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10008B26C(void *a1)
{
  uint64_t v1;

  return sub_100089F50(a1, *(_QWORD *)(v1 + 16), *(void (**)(uint64_t))(v1 + 24), *(_QWORD *)(v1 + 32), *(void (**)(id))(v1 + 40));
}

uint64_t sub_10008B27C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10008B28C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10008B294(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TaskContext(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10008B2D8()
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
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;

  v1 = sub_100016484(&qword_1000DA2B8);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = type metadata accessor for TaskContext(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = (v4 + v5 + v8) & ~v8;
  v10 = *(_QWORD *)(v7 + 64);
  v11 = v0 + v4;
  v12 = type metadata accessor for Date(0);
  v13 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8);
  v13(v11, v12);
  v13(v11 + *(int *)(v1 + 36), v12);
  v14 = type metadata accessor for TimelineProviderContext(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v0 + v9, v14);
  v15 = v0 + v9 + *(int *)(v6 + 20);
  v16 = type metadata accessor for TrackableNewsTimelineEntry(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 48))(v15, 1, v16))
  {
    v13(v15, v12);
    swift_release(*(_QWORD *)(v15 + *(int *)(v16 + 20)));
    swift_bridgeObjectRelease(*(_QWORD *)(v15 + *(int *)(v16 + 24) + 8));
  }
  v17 = (v10 + v9 + 7) & 0xFFFFFFFFFFFFFFF8;
  v18 = v17 + 8;
  swift_release(*(_QWORD *)(v0 + v17));
  return swift_deallocObject(v0, v18, v3 | v8 | 7);
}

void sub_10008B430(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v3 = *(_QWORD *)(sub_100016484(&qword_1000DA2B8) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = *(_QWORD *)(v3 + 64);
  v6 = *(_QWORD *)(type metadata accessor for TaskContext(0) - 8);
  v7 = (v4 + v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  sub_10008A210(a1, v1 + v4, v1 + v7, *(_QWORD *)(v1 + ((*(_QWORD *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFF8)));
}

_QWORD *sub_10008B4B0(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (_QWORD *)v2;
  }
  return v1;
}

unint64_t sub_10008B4EC()
{
  unint64_t result;

  result = qword_1000DD950;
  if (!qword_1000DD950)
  {
    result = swift_getWitnessTable(&unk_1000A2CBC, &type metadata for BiomeEventStore.Errors);
    atomic_store(result, (unint64_t *)&qword_1000DD950);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for BiomeEventStore.Errors(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_10008B570 + 4 * byte_1000A2C10[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_10008B590 + 4 * byte_1000A2C15[v4]))();
}

_BYTE *sub_10008B570(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_10008B590(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10008B598(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10008B5A0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10008B5A8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10008B5B0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for BiomeEventStore.Errors()
{
  return &type metadata for BiomeEventStore.Errors;
}

unint64_t sub_10008B5D0()
{
  unint64_t result;

  result = qword_1000DD958;
  if (!qword_1000DD958)
  {
    result = swift_getWitnessTable(&unk_1000A2C94, &type metadata for BiomeEventStore.Errors);
    atomic_store(result, (unint64_t *)&qword_1000DD958);
  }
  return result;
}

uint64_t sub_10008B61C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, void *a4@<X3>, void *a5@<X4>, _QWORD *a6@<X8>)
{
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  unsigned int v27;
  __objc2_prot *v28;

  if (objc_msgSend(a1, "itemType"))
  {
    sub_10008CAB8(a4, a5);
    swift_unknownObjectRelease(a1);
  }
  else
  {
    v28 = &OBJC_PROTOCOL___NTHeadlineProviding;
    v12 = (void *)swift_dynamicCastObjCProtocolConditional(a1, 1, &v28);
    swift_unknownObjectRetain(a1);
    if (v12)
    {
      v13 = objc_msgSend(v12, "title");
      if (v13)
      {

        v14 = objc_msgSend(objc_allocWithZone((Class)FTHeadlineRowOpenURLEngagementDescriptor), "initWithHeadline:", v12);
        sub_10001BB2C(a3, a3[3]);
        v15 = type metadata accessor for Item.Headline(0);
        sub_100086740(v14, (uint64_t)a6 + *(int *)(v15 + 24));

        swift_unknownObjectRelease(a1);
        *a6 = v12;
        a6[1] = a2;
        v16 = (_QWORD *)((char *)a6 + *(int *)(v15 + 28));
        *v16 = a4;
        v16[1] = a5;
        v17 = type metadata accessor for Item(0);
        swift_storeEnumTagMultiPayload(a6, v17, 0);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(a6, 0, 1, v17);
        return sub_10001BBD8(a3);
      }
      v27 = static os_log_type_t.fault.getter(0);
      v19 = sub_100016484(&qword_1000DA0A0);
      v20 = swift_allocObject(v19, 72, 7);
      *(_OWORD *)(v20 + 16) = xmmword_10009CCD0;
      v21 = objc_msgSend(v12, "identifier");
      v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
      v24 = v23;

      *(_QWORD *)(v20 + 56) = &type metadata for String;
      *(_QWORD *)(v20 + 64) = sub_10001A300();
      *(_QWORD *)(v20 + 32) = v22;
      *(_QWORD *)(v20 + 40) = v24;
      sub_10002A0D8(0, (unint64_t *)&qword_1000DB840, OS_os_log_ptr);
      v25 = (void *)static OS_os_log.default.getter();
      os_log(_:dso:log:type:_:)("Cannot create an item without a title, identifier=%{public}@", 60, 2, &_mh_execute_header, v25, v27, v20);
      sub_10008CAB8(a4, a5);
      swift_bridgeObjectRelease(v20);

    }
    else
    {
      sub_10008CAB8(a4, a5);
    }
    swift_unknownObjectRelease_n(a1, 2);
  }
  swift_release(a2);
  sub_10001BBD8(a3);
  v26 = type metadata accessor for Item(0);
  return (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(a6, 1, 1, v26);
}

void *sub_10008B8BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t (*v8)(_QWORD);
  void *v9;
  char *v10;
  id v11;
  id v12;
  uint64_t v14;

  v1 = v0;
  v2 = type metadata accessor for Item.Headline(0);
  __chkstk_darwin(v2);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for Item(0);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002A15C(v1, (uint64_t)v7, v8);
  if (swift_getEnumCaseMultiPayload(v7, v5) == 1)
  {
    sub_10002A1A0((uint64_t)v7, type metadata accessor for Item);
    return 0;
  }
  else
  {
    sub_10002A04C((uint64_t)v7, (uint64_t)v4, type metadata accessor for Item.Headline);
    v10 = &v4[*(int *)(v2 + 28)];
    v11 = *(id *)v10;
    v9 = (void *)*((_QWORD *)v10 + 1);
    sub_10008DC88(*(id *)v10, v9);
    sub_10002A1A0((uint64_t)v4, type metadata accessor for Item.Headline);
    if (v9)
    {
      v12 = v9;
      sub_10008CAB8(v11, v9);
    }
  }
  return v9;
}

void *sub_10008B9F0()
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
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t (*v14)(_QWORD);
  uint64_t v15;
  void *v16;
  uint64_t v18;

  v1 = sub_100016484(&qword_1000DB400);
  __chkstk_darwin(v1);
  v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for ImageStoreKey(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Item.Headline(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Item(0);
  __chkstk_darwin(v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002A15C(v0, (uint64_t)v13, v14);
  if (swift_getEnumCaseMultiPayload(v13, v11) == 1)
  {
    v15 = *((_QWORD *)v13 + 3);
    sub_10001AC38(*(_QWORD *)v13, *((_QWORD *)v13 + 1), v13[16]);
    swift_bridgeObjectRelease(v15);
    return 0;
  }
  else
  {
    sub_10002A04C((uint64_t)v13, (uint64_t)v10, type metadata accessor for Item.Headline);
    sub_10008C81C(v3);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
    {
      sub_10001DD10((uint64_t)v3, &qword_1000DB400);
      v16 = 0;
    }
    else
    {
      sub_10002A04C((uint64_t)v3, (uint64_t)v7, type metadata accessor for ImageStoreKey);
      v16 = sub_10008DCF8((uint64_t)v7);
      sub_10002A1A0((uint64_t)v7, type metadata accessor for ImageStoreKey);
    }
    sub_10002A1A0((uint64_t)v10, type metadata accessor for Item.Headline);
  }
  return v16;
}

id sub_10008BBE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t (*v8)(_QWORD);
  char *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v14;

  v1 = v0;
  v2 = type metadata accessor for Item.Headline(0);
  __chkstk_darwin(v2);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for Item(0);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002A15C(v1, (uint64_t)v7, v8);
  if (swift_getEnumCaseMultiPayload(v7, v5) == 1)
  {
    sub_10002A1A0((uint64_t)v7, type metadata accessor for Item);
    return 0;
  }
  sub_10002A04C((uint64_t)v7, (uint64_t)v4, type metadata accessor for Item.Headline);
  v9 = &v4[*(int *)(v2 + 28)];
  v10 = *(id *)v9;
  v11 = (void *)*((_QWORD *)v9 + 1);
  sub_10008DC88(*(id *)v9, v11);
  sub_10002A1A0((uint64_t)v4, type metadata accessor for Item.Headline);
  if (!v11)
    return 0;
  v12 = v10;
  sub_10008CAB8(v10, v11);
  return v10;
}

uint64_t sub_10008BD1C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  id *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t (*v9)(_QWORD);
  int EnumCaseMultiPayload;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v3 = type metadata accessor for Item.Headline(0);
  __chkstk_darwin(v3);
  v5 = (id *)((char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = type metadata accessor for Item(0);
  __chkstk_darwin(v6);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002A15C(v1, (uint64_t)v8, v9);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(v8, v6);
  if (EnumCaseMultiPayload == 1)
  {
    v11 = *((_QWORD *)v8 + 3);
    sub_10001AC38(*(_QWORD *)v8, *((_QWORD *)v8 + 1), v8[16]);
    result = swift_bridgeObjectRelease(v11);
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
  }
  else
  {
    sub_10002A04C((uint64_t)v8, (uint64_t)v5, type metadata accessor for Item.Headline);
    objc_msgSend(*v5, "thumbnailFocalFrame");
    v13 = v17;
    v14 = v18;
    v15 = v19;
    v16 = v20;
    result = sub_10002A1A0((uint64_t)v5, type metadata accessor for Item.Headline);
  }
  *(_QWORD *)a1 = v13;
  *(_QWORD *)(a1 + 8) = v14;
  *(_QWORD *)(a1 + 16) = v15;
  *(_QWORD *)(a1 + 24) = v16;
  *(_BYTE *)(a1 + 32) = EnumCaseMultiPayload == 1;
  return result;
}

id sub_10008BE78()
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
  id v9;
  NSURL *v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v1 = sub_100016484((uint64_t *)&unk_1000D9EF0);
  __chkstk_darwin(v1);
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Item.Headline(0);
  sub_100069000(v0 + *(int *)(v8 + 24), (uint64_t)v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_10001DD10((uint64_t)v3, (uint64_t *)&unk_1000D9EF0);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
    URL._bridgeToObjectiveC()(v10);
    v12 = v11;
    v9 = objc_msgSend(v11, "nss_isAudioURL");

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return v9;
}

id sub_10008BFA8()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;

  v0 = sub_100016484(&qword_1000DB400);
  __chkstk_darwin(v0);
  v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for ImageStoreKey(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10008C644(v2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_10001DD10((uint64_t)v2, &qword_1000DB400);
    return 0;
  }
  else
  {
    sub_10002A04C((uint64_t)v2, (uint64_t)v6, type metadata accessor for ImageStoreKey);
    v8 = sub_10008DCF8((uint64_t)v6);
    if (v8)
    {
      v9 = v8;
      v7 = objc_msgSend(v8, "imageWithRenderingMode:", 2);

    }
    else
    {
      v7 = 0;
    }
    sub_10002A1A0((uint64_t)v6, type metadata accessor for ImageStoreKey);
  }
  return v7;
}

uint64_t sub_10008C0E4()
{
  id *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  Swift::String v12;
  Class isa;
  Swift::String v14;
  Class v15;
  uint64_t v16;
  id v17;
  void *v18;
  objc_class *v19;
  objc_class *v20;
  id v21;
  uint64_t v22;
  _QWORD v24[5];
  uint64_t v25;

  v1 = *v0;
  v2 = objc_msgSend(*v0, "storyTypeColorLight");
  if (v2)
  {
    v3 = v2;
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
    v6 = v5;

    v7 = objc_msgSend(v1, "storyTypeColorDark");
    if (v7)
    {
      v8 = v7;
      v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
      v11 = v10;

      sub_10002A0D8(0, (unint64_t *)&qword_1000D9FC8, UIColor_ptr);
      v12._countAndFlagsBits = v4;
      v12._object = v6;
      isa = UIColor.init(hex:)(v12).super.isa;
      v14._countAndFlagsBits = v9;
      v14._object = v11;
      v15 = UIColor.init(hex:)(v14).super.isa;
      v16 = swift_allocObject(&unk_1000CCB40, 32, 7);
      *(_QWORD *)(v16 + 16) = isa;
      *(_QWORD *)(v16 + 24) = v15;
      v17 = objc_allocWithZone((Class)UIColor);
      v24[4] = sub_10001DF10;
      v25 = v16;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 1107296256;
      v24[2] = sub_10004D860;
      v24[3] = &unk_1000CCB58;
      v18 = _Block_copy(v24);
      v19 = isa;
      v20 = v15;
      v21 = objc_msgSend(v17, "initWithDynamicProvider:", v18);
      _Block_release(v18);
      swift_release(v25);
      v22 = Color.init(_:)(v21);

      return v22;
    }
    v2 = (id)swift_bridgeObjectRelease(v6);
  }
  return static Color.secondary.getter(v2);
}

id sub_10008C294()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  id v11;
  void *v12;
  id result;
  uint64_t v14;
  uint64_t v15;

  v1 = sub_100016484(&qword_1000DDAB0);
  __chkstk_darwin(v1);
  v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = objc_msgSend(*v0, "compactSourceName");
  if (v4)
  {
    v5 = v4;
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
    v8 = v7;

  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  static CharacterSet.whitespacesAndNewlines.getter();
  v9 = type metadata accessor for CharacterSet(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v3, 0, 1, v9);
  v10 = isNilOrEmpty(_:trim:)(v6, v8, v3);
  swift_bridgeObjectRelease(v8);
  sub_10001DD10((uint64_t)v3, &qword_1000DDAB0);
  v11 = *v0;
  if ((v10 & 1) != 0)
  {
    v11 = objc_msgSend(v11, "sourceName");
    v12 = v11;
    if (v11)
    {
LABEL_8:
      v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);

      return (id)v14;
    }
    __break(1u);
  }
  result = objc_msgSend(v11, "compactSourceName");
  v12 = result;
  if (result)
    goto LABEL_8;
  __break(1u);
  return result;
}

id sub_10008C3EC()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  id *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id result;
  void *v10;
  uint64_t v11;

  v1 = type metadata accessor for Item.Headline(0);
  __chkstk_darwin(v1);
  v3 = (id *)((char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = objc_msgSend(*v0, "titleCompact");
  if (v4)
  {
    v5 = v4;
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
    v8 = v7;

    sub_10002A15C((uint64_t)v0, (uint64_t)v3, type metadata accessor for Item.Headline);
    if (v8)
    {
LABEL_7:
      sub_10002A1A0((uint64_t)v3, type metadata accessor for Item.Headline);
      return (id)v6;
    }
  }
  else
  {
    sub_10002A15C((uint64_t)v0, (uint64_t)v3, type metadata accessor for Item.Headline);
  }
  result = objc_msgSend(*v3, "title");
  if (result)
  {
    v10 = result;
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(result);

    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_10008C4F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t (*v8)(_QWORD);
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v13;

  v1 = v0;
  v2 = type metadata accessor for Item.Headline(0);
  __chkstk_darwin(v2);
  v4 = (id *)((char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = type metadata accessor for Item(0);
  __chkstk_darwin(v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002A15C(v1, (uint64_t)v7, v8);
  if (swift_getEnumCaseMultiPayload(v7, v5) == 1)
  {
    v9 = *((_QWORD *)v7 + 3);
    sub_10001AC38(*(_QWORD *)v7, *((_QWORD *)v7 + 1), v7[16]);
    swift_bridgeObjectRelease(v9);
    return 0x6567617373656DLL;
  }
  else
  {
    sub_10002A04C((uint64_t)v7, (uint64_t)v4, type metadata accessor for Item.Headline);
    v11 = objc_msgSend(*v4, "identifier");
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);

    sub_10002A1A0((uint64_t)v4, type metadata accessor for Item.Headline);
  }
  return v10;
}

uint64_t sub_10008C644@<X0>(char *a1@<X8>)
{
  id *v1;
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
  id v13;
  void *v14;
  void (*v15)(char *, char *, uint64_t);
  void (*v16)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;

  v3 = sub_100016484((uint64_t *)&unk_1000D9EF0);
  __chkstk_darwin(v3);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v20 - v11;
  v13 = objc_msgSend(*v1, "sourceNameImageRemoteURL");
  if (v13)
  {
    v14 = v13;
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v13);

    v15 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    v15(v5, v10, v6);
    v16 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56);
    v16(v5, 0, 1, v6);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
    {
      v15(v12, v5, v6);
      v15(a1, v12, v6);
      v16(a1, 0, 1, v6);
      v17 = type metadata accessor for ImageStoreKey(0);
      return (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(a1, 0, 1, v17);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
  }
  sub_10001DD10((uint64_t)v5, (uint64_t *)&unk_1000D9EF0);
  v19 = type metadata accessor for ImageStoreKey(0);
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(a1, 1, 1, v19);
}

uint64_t sub_10008C81C@<X0>(char *a1@<X8>)
{
  id *v1;
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
  id v13;
  uint64_t v14;
  id v16;
  void *v17;
  void (*v18)(char *, char *, uint64_t);
  void (*v19)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v3 = sub_100016484((uint64_t *)&unk_1000D9EF0);
  __chkstk_darwin(v3);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v22 - v11;
  v13 = *v1;
  if ((objc_msgSend(*v1, "needsPlaceholderThumbnail") & 1) != 0)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(a1, 1, 1, v6);
    v14 = type metadata accessor for ImageStoreKey(0);
    return (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(a1, 0, 1, v14);
  }
  v16 = objc_msgSend(v13, "thumbnailRemoteURL");
  if (v16)
  {
    v17 = v16;
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v16);

    v18 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    v18(v5, v10, v6);
    v19 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56);
    v19(v5, 0, 1, v6);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
    {
      v18(v12, v5, v6);
      v18(a1, v12, v6);
      v19(a1, 0, 1, v6);
      v20 = type metadata accessor for ImageStoreKey(0);
      return (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(a1, 0, 1, v20);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
  }
  sub_10001DD10((uint64_t)v5, (uint64_t *)&unk_1000D9EF0);
  v21 = type metadata accessor for ImageStoreKey(0);
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(a1, 1, 1, v21);
}

uint64_t sub_10008CA60()
{
  id *v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(*v0, "identifier");
  v2 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);

  return v2;
}

void sub_10008CAB8(void *a1, void *a2)
{
  if (a2)
  {

  }
}

uint64_t type metadata accessor for Item(uint64_t a1)
{
  return sub_100031BB4(a1, qword_1000DDA70, (uint64_t)&nominal type descriptor for Item);
}

uint64_t type metadata accessor for Item.Headline(uint64_t a1)
{
  return sub_100031BB4(a1, qword_1000DD9B8, (uint64_t)&nominal type descriptor for Item.Headline);
}

uint64_t *sub_10008CB0C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  char *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain(v4);
  }
  else
  {
    v7 = a1;
    v8 = a2[1];
    a1[1] = v8;
    v9 = *(int *)(a3 + 24);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = type metadata accessor for URL(0);
    v13 = *(_QWORD *)(v12 - 8);
    v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    swift_unknownObjectRetain(v4);
    swift_retain(v8);
    if (v14(v11, 1, v12))
    {
      v15 = sub_100016484((uint64_t *)&unk_1000D9EF0);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
    v16 = *(int *)(a3 + 28);
    v17 = (uint64_t *)((char *)v7 + v16);
    v18 = (char *)a2 + v16;
    v19 = (void *)*((_QWORD *)v18 + 1);
    if (v19)
    {
      v20 = *(void **)v18;
      *v17 = v20;
      v17[1] = v19;
      v21 = v20;
      v22 = v19;
    }
    else
    {
      *(_OWORD *)v17 = *(_OWORD *)v18;
    }
  }
  return v7;
}

void sub_10008CC50(_QWORD *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  id *v7;

  swift_unknownObjectRelease(*a1);
  swift_release(a1[1]);
  v4 = (char *)a1 + *(int *)(a2 + 24);
  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  v7 = (id *)((char *)a1 + *(int *)(a2 + 28));
  if (v7[1])
  {

  }
}

uint64_t *sub_10008CD00(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  char *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;

  v6 = *a2;
  v7 = a2[1];
  *a1 = *a2;
  a1[1] = v7;
  v8 = *(int *)(a3 + 24);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = type metadata accessor for URL(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  swift_unknownObjectRetain(v6);
  swift_retain(v7);
  if (v13(v10, 1, v11))
  {
    v14 = sub_100016484((uint64_t *)&unk_1000D9EF0);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  v15 = *(int *)(a3 + 28);
  v16 = (uint64_t *)((char *)a1 + v15);
  v17 = (char *)a2 + v15;
  v18 = (void *)*((_QWORD *)v17 + 1);
  if (v18)
  {
    v19 = *(void **)v17;
    *v16 = v19;
    v16[1] = v18;
    v20 = v19;
    v21 = v18;
  }
  else
  {
    *(_OWORD *)v16 = *(_OWORD *)v17;
  }
  return a1;
}

uint64_t *sub_10008CE14(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(char *, uint64_t, uint64_t);
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;

  v6 = *a2;
  v7 = *a1;
  *a1 = *a2;
  swift_unknownObjectRetain(v6);
  swift_unknownObjectRelease(v7);
  v8 = a2[1];
  v9 = a1[1];
  a1[1] = v8;
  swift_retain(v8);
  swift_release(v9);
  v10 = *(int *)(a3 + 24);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = type metadata accessor for URL(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48);
  v16 = v15(v11, 1, v13);
  v17 = v15(v12, 1, v13);
  if (v16)
  {
    if (!v17)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v11, v12, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v17)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v11, v13);
LABEL_6:
    v18 = sub_100016484((uint64_t *)&unk_1000D9EF0);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 24))(v11, v12, v13);
LABEL_7:
  v19 = *(int *)(a3 + 28);
  v20 = (char *)a1 + v19;
  v21 = (char *)a2 + v19;
  v22 = *(uint64_t *)((char *)a1 + v19 + 8);
  v23 = *((_QWORD *)v21 + 1);
  if (!v22)
  {
    if (v23)
    {
      v30 = *(void **)v21;
      *(_QWORD *)v20 = *(_QWORD *)v21;
      v31 = (void *)*((_QWORD *)v21 + 1);
      *((_QWORD *)v20 + 1) = v31;
      v32 = v30;
      v33 = v31;
      return a1;
    }
LABEL_13:
    *(_OWORD *)v20 = *(_OWORD *)v21;
    return a1;
  }
  if (!v23)
  {
    sub_10003BAA0((id *)v20);
    goto LABEL_13;
  }
  v24 = *(id *)v20;
  v25 = *(void **)v21;
  *(_QWORD *)v20 = *(_QWORD *)v21;
  v26 = v25;

  v27 = (void *)*((_QWORD *)v21 + 1);
  v28 = (void *)*((_QWORD *)v20 + 1);
  *((_QWORD *)v20 + 1) = v27;
  v29 = v27;

  return a1;
}

_OWORD *sub_10008CFCC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *a1 = *a2;
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = sub_100016484((uint64_t *)&unk_1000D9EF0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 28)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t *sub_10008D0A4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(char *, uint64_t, uint64_t);
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  id *v18;
  char *v19;
  id v20;
  id v21;

  v6 = *a1;
  *a1 = *a2;
  swift_unknownObjectRelease(v6);
  v7 = a1[1];
  a1[1] = a2[1];
  swift_release(v7);
  v8 = *(int *)(a3 + 24);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = type metadata accessor for URL(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13(v10, 1, v11);
  if (v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v15)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v11);
LABEL_6:
    v16 = sub_100016484((uint64_t *)&unk_1000D9EF0);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 40))(v9, v10, v11);
LABEL_7:
  v17 = *(int *)(a3 + 28);
  v18 = (id *)((char *)a1 + v17);
  v19 = (char *)a2 + v17;
  if (!*(uint64_t *)((char *)a1 + v17 + 8))
  {
LABEL_11:
    *(_OWORD *)v18 = *(_OWORD *)v19;
    return a1;
  }
  if (!*((_QWORD *)v19 + 1))
  {
    sub_10003BAA0(v18);
    goto LABEL_11;
  }
  v20 = *v18;
  *v18 = *(id *)v19;

  v21 = v18[1];
  v18[1] = (id)*((_QWORD *)v19 + 1);

  return a1;
}

uint64_t sub_10008D224(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10008D230);
}

uint64_t sub_10008D230(char *a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_100016484((uint64_t *)&unk_1000D9EF0);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 24)], a2, v8);
  }
}

uint64_t sub_10008D2B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10008D2BC);
}

char *sub_10008D2BC(char *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_100016484((uint64_t *)&unk_1000D9EF0);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 24)], a2, a2, v7);
  }
  return result;
}

void sub_10008D334(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[4];

  v4[0] = "\b";
  v4[1] = (char *)&value witness table for Builtin.NativeObject + 64;
  sub_100031930(319);
  if (v3 <= 0x3F)
  {
    v4[2] = *(_QWORD *)(v2 - 8) + 64;
    v4[3] = &unk_1000A2D50;
    swift_initStructMetadata(a1, 256, 4, v4, a1 + 16);
  }
}

unint64_t sub_10008D3BC(unint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const void *v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int (*v22)(const void *, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *__dst;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = v14 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain(v14);
  }
  else
  {
    if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
    {
      v7 = *(_QWORD *)a2;
      v8 = *(_QWORD *)(a2 + 8);
      v9 = *(_BYTE *)(a2 + 16);
      sub_10001DE4C(*(_QWORD *)a2, v8, v9);
      *(_QWORD *)a1 = v7;
      *(_QWORD *)(a1 + 8) = v8;
      *(_BYTE *)(a1 + 16) = v9;
      v10 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 24) = v10;
      swift_bridgeObjectRetain(v10);
      v11 = a1;
      v12 = a3;
      v13 = 1;
    }
    else
    {
      v15 = *(_QWORD *)a2;
      v16 = *(_QWORD *)(a2 + 8);
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *(_QWORD *)(a1 + 8) = v16;
      v17 = type metadata accessor for Item.Headline(0);
      v18 = *(int *)(v17 + 24);
      __dst = (void *)(a1 + v18);
      v19 = (const void *)(a2 + v18);
      v20 = type metadata accessor for URL(0);
      v21 = *(_QWORD *)(v20 - 8);
      v22 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v21 + 48);
      swift_unknownObjectRetain(v15);
      swift_retain(v16);
      if (v22(v19, 1, v20))
      {
        v23 = sub_100016484((uint64_t *)&unk_1000D9EF0);
        memcpy(__dst, v19, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(v21 + 16))(__dst, v19, v20);
        (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v21 + 56))(__dst, 0, 1, v20);
      }
      v24 = *(int *)(v17 + 28);
      v25 = (_QWORD *)(a1 + v24);
      v26 = a2 + v24;
      v27 = *(void **)(v26 + 8);
      if (v27)
      {
        v28 = *(void **)v26;
        *v25 = v28;
        v25[1] = v27;
        v29 = v28;
        v30 = v27;
      }
      else
      {
        *(_OWORD *)v25 = *(_OWORD *)v26;
      }
      v11 = a1;
      v12 = a3;
      v13 = 0;
    }
    swift_storeEnumTagMultiPayload(v11, v12, v13);
  }
  return a1;
}

void sub_10008D578(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  id *v7;

  if (swift_getEnumCaseMultiPayload(a1, a2) == 1)
  {
    sub_10001AC38(*a1, a1[1], *((_BYTE *)a1 + 16));
    swift_bridgeObjectRelease(a1[3]);
  }
  else
  {
    swift_unknownObjectRelease(*a1);
    swift_release(a1[1]);
    v3 = type metadata accessor for Item.Headline(0);
    v4 = (char *)a1 + *(int *)(v3 + 24);
    v5 = type metadata accessor for URL(0);
    v6 = *(_QWORD *)(v5 - 8);
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
      (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    v7 = (id *)((char *)a1 + *(int *)(v3 + 28));
    if (v7[1])
    {

    }
  }
}

uint64_t sub_10008D660(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int (*v18)(const void *, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *__dst;

  if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
  {
    v6 = *(_QWORD *)a2;
    v7 = *(_QWORD *)(a2 + 8);
    v8 = *(_BYTE *)(a2 + 16);
    sub_10001DE4C(*(_QWORD *)a2, v7, v8);
    *(_QWORD *)a1 = v6;
    *(_QWORD *)(a1 + 8) = v7;
    *(_BYTE *)(a1 + 16) = v8;
    v9 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 24) = v9;
    swift_bridgeObjectRetain(v9);
    v10 = 1;
  }
  else
  {
    v11 = *(_QWORD *)a2;
    v12 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v12;
    v13 = type metadata accessor for Item.Headline(0);
    v14 = *(int *)(v13 + 24);
    __dst = (void *)(a1 + v14);
    v15 = (const void *)(a2 + v14);
    v16 = type metadata accessor for URL(0);
    v17 = *(_QWORD *)(v16 - 8);
    v18 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48);
    swift_unknownObjectRetain(v11);
    swift_retain(v12);
    if (v18(v15, 1, v16))
    {
      v19 = sub_100016484((uint64_t *)&unk_1000D9EF0);
      memcpy(__dst, v15, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v17 + 16))(__dst, v15, v16);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v17 + 56))(__dst, 0, 1, v16);
    }
    v20 = *(int *)(v13 + 28);
    v21 = (_QWORD *)(a1 + v20);
    v22 = a2 + v20;
    v23 = *(void **)(v22 + 8);
    if (v23)
    {
      v24 = *(void **)v22;
      *v21 = v24;
      v21[1] = v23;
      v25 = v24;
      v26 = v23;
      v10 = 0;
    }
    else
    {
      v10 = 0;
      *(_OWORD *)v21 = *(_OWORD *)v22;
    }
  }
  swift_storeEnumTagMultiPayload(a1, a3, v10);
  return a1;
}

uint64_t sub_10008D7EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int (*v18)(const void *, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *__dst;

  if (a1 != a2)
  {
    sub_10002A1A0(a1, type metadata accessor for Item);
    if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
    {
      v6 = *(_QWORD *)a2;
      v7 = *(_QWORD *)(a2 + 8);
      v8 = *(_BYTE *)(a2 + 16);
      sub_10001DE4C(*(_QWORD *)a2, v7, v8);
      *(_QWORD *)a1 = v6;
      *(_QWORD *)(a1 + 8) = v7;
      *(_BYTE *)(a1 + 16) = v8;
      v9 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 24) = v9;
      swift_bridgeObjectRetain(v9);
      v10 = 1;
    }
    else
    {
      v11 = *(_QWORD *)a2;
      *(_QWORD *)a1 = *(_QWORD *)a2;
      v12 = *(_QWORD *)(a2 + 8);
      *(_QWORD *)(a1 + 8) = v12;
      v13 = type metadata accessor for Item.Headline(0);
      v14 = *(int *)(v13 + 24);
      __dst = (void *)(a1 + v14);
      v15 = (const void *)(a2 + v14);
      v16 = type metadata accessor for URL(0);
      v17 = *(_QWORD *)(v16 - 8);
      v18 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48);
      swift_unknownObjectRetain(v11);
      swift_retain(v12);
      if (v18(v15, 1, v16))
      {
        v19 = sub_100016484((uint64_t *)&unk_1000D9EF0);
        memcpy(__dst, v15, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(v17 + 16))(__dst, v15, v16);
        (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v17 + 56))(__dst, 0, 1, v16);
      }
      v20 = *(int *)(v13 + 28);
      v21 = (_QWORD *)(a1 + v20);
      v22 = a2 + v20;
      if (*(_QWORD *)(v22 + 8))
      {
        v23 = *(void **)v22;
        *v21 = *(_QWORD *)v22;
        v24 = *(void **)(v22 + 8);
        v21[1] = v24;
        v25 = v23;
        v26 = v24;
        v10 = 0;
      }
      else
      {
        v10 = 0;
        *(_OWORD *)v21 = *(_OWORD *)v22;
      }
    }
    swift_storeEnumTagMultiPayload(a1, a3, v10);
  }
  return a1;
}

_OWORD *sub_10008D9A0(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (swift_getEnumCaseMultiPayload(a2, a3))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    v6 = type metadata accessor for Item.Headline(0);
    v7 = *(int *)(v6 + 24);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = type metadata accessor for URL(0);
    v11 = *(_QWORD *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    {
      v12 = sub_100016484((uint64_t *)&unk_1000D9EF0);
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    *(_OWORD *)((char *)a1 + *(int *)(v6 + 28)) = *(_OWORD *)((char *)a2 + *(int *)(v6 + 28));
    swift_storeEnumTagMultiPayload(a1, a3, 0);
  }
  return a1;
}

_OWORD *sub_10008DABC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a1 != a2)
  {
    sub_10002A1A0((uint64_t)a1, type metadata accessor for Item);
    if (swift_getEnumCaseMultiPayload(a2, a3))
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      *a1 = *a2;
      v6 = type metadata accessor for Item.Headline(0);
      v7 = *(int *)(v6 + 24);
      v8 = (char *)a1 + v7;
      v9 = (char *)a2 + v7;
      v10 = type metadata accessor for URL(0);
      v11 = *(_QWORD *)(v10 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
      {
        v12 = sub_100016484((uint64_t *)&unk_1000D9EF0);
        memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      }
      *(_OWORD *)((char *)a1 + *(int *)(v6 + 28)) = *(_OWORD *)((char *)a2 + *(int *)(v6 + 28));
      swift_storeEnumTagMultiPayload(a1, a3, 0);
    }
  }
  return a1;
}

uint64_t sub_10008DBF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_10008DBFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_10008DC0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_storeEnumTagMultiPayload(a1, a3, a2);
}

uint64_t sub_10008DC1C(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[2];

  result = type metadata accessor for Item.Headline(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = " ";
    swift_initEnumMetadataMultiPayload(a1, 256, 2, v4);
    return 0;
  }
  return result;
}

id sub_10008DC88(id result, void *a2)
{
  id v2;

  if (a2)
  {
    v2 = result;
    return a2;
  }
  return result;
}

uint64_t sub_10008DCB4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10008DCE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10008DCF0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void *sub_10008DCF8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  char v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(v1 + 16);
  if (!*(_QWORD *)(v2 + 16))
    return 0;
  v3 = sub_10002908C(a1);
  if ((v4 & 1) == 0)
    return 0;
  v5 = *(void **)(*(_QWORD *)(v2 + 56) + 8 * v3);
  v6 = v5;
  return v5;
}

Swift::Int sub_10008DD3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD v12[9];

  v1 = v0;
  v2 = type metadata accessor for URL(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v12[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for ImageStoreKey(0);
  __chkstk_darwin(v6);
  v8 = (char *)&v12[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  Hasher.init(_seed:)(v12, 0);
  sub_10008E99C(v1, (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) == 1)
  {
    Hasher._combine(_:)(1uLL);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v2);
    Hasher._combine(_:)(0);
    v9 = sub_1000179D4((unint64_t *)&qword_1000DA1F8, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
    dispatch thunk of Hashable.hash(into:)(v12, v2, v9);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return Hasher._finalize()();
}

void sub_10008DE8C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v2 = v1;
  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10008E99C(v2, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) == 1)
  {
    Hasher._combine(_:)(1uLL);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v8, v10, v4);
    Hasher._combine(_:)(0);
    v11 = sub_1000179D4((unint64_t *)&qword_1000DA1F8, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
    dispatch thunk of Hashable.hash(into:)(a1, v4, v11);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
}

Swift::Int sub_10008DFB8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _QWORD v14[9];

  v2 = v1;
  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v14[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v14[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  Hasher.init(_seed:)(v14, a1);
  sub_10008E99C(v2, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) == 1)
  {
    Hasher._combine(_:)(1uLL);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v8, v10, v4);
    Hasher._combine(_:)(0);
    v11 = sub_1000179D4((unint64_t *)&qword_1000DA1F8, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
    dispatch thunk of Hashable.hash(into:)(v14, v4, v11);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  return Hasher._finalize()();
}

uint64_t sub_10008E10C()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for ImageStore()
{
  return objc_opt_self(_TtC10NewsToday210ImageStore);
}

uint64_t *sub_10008E150(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain(v9);
  }
  else
  {
    v7 = type metadata accessor for URL(0);
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t sub_10008E218(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = type metadata accessor for URL(0);
  v3 = *(_QWORD *)(v2 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return result;
}

void *sub_10008E280(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *sub_10008E324(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void *, uint64_t, uint64_t);
  int v9;
  int v10;

  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 24))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

void *sub_10008E414(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

void *sub_10008E4B8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void *, uint64_t, uint64_t);
  int v9;
  int v10;

  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 40))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

uint64_t sub_10008E5A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10008E5B4);
}

uint64_t sub_10008E5B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  v4 = type metadata accessor for URL(0);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 2)
    return v5 - 1;
  else
    return 0;
}

uint64_t sub_10008E600(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10008E60C);
}

uint64_t sub_10008E60C(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 1);
  else
    v5 = 0;
  v6 = type metadata accessor for URL(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, v5, a3, v6);
}

uint64_t sub_10008E65C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for URL(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 1, v2);
}

uint64_t sub_10008E694(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for URL(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, 1, v4);
}

uint64_t type metadata accessor for ImageStoreKey(uint64_t a1)
{
  uint64_t result;

  result = qword_1000DDBC8;
  if (!qword_1000DDBC8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ImageStoreKey);
  return result;
}

uint64_t sub_10008E710(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;

  result = type metadata accessor for URL(319);
  if (v3 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload(a1, 256, *(_QWORD *)(result - 8) + 64, 1);
    return 0;
  }
  return result;
}

uint64_t sub_10008E764()
{
  return sub_1000179D4(&qword_1000DDBD8, type metadata accessor for ImageStoreKey, (uint64_t)&unk_1000A2E14);
}

uint64_t sub_10008E794(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
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
  unsigned int (*v19)(uint64_t, uint64_t, uint64_t);
  char v20;
  void (*v21)(char *, char *, uint64_t);
  void (*v22)(char *, uint64_t);
  uint64_t v24;

  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD **)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v24 - v9;
  v11 = type metadata accessor for ImageStoreKey(0);
  __chkstk_darwin(v11);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_100016484(&qword_1000DA650);
  v15 = __chkstk_darwin(v14);
  v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = (uint64_t)&v17[*(int *)(v15 + 48)];
  sub_10008E99C(a1, (uint64_t)v17);
  sub_10008E99C(a2, v18);
  v19 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v5[6];
  if (v19((uint64_t)v17, 1, v4) != 1)
  {
    sub_10008E99C((uint64_t)v17, (uint64_t)v13);
    if (v19(v18, 1, v4) != 1)
    {
      v21 = (void (*)(char *, char *, uint64_t))v5[4];
      v21(v10, v13, v4);
      v21(v8, (char *)v18, v4);
      v20 = static URL.== infix(_:_:)(v10, v8);
      v22 = (void (*)(char *, uint64_t))v5[1];
      v22(v8, v4);
      v22(v10, v4);
      sub_10008EA20((uint64_t)v17);
      return v20 & 1;
    }
    ((void (*)(char *, uint64_t))v5[1])(v13, v4);
    goto LABEL_6;
  }
  if (v19(v18, 1, v4) != 1)
  {
LABEL_6:
    sub_10008E9E0((uint64_t)v17);
    v20 = 0;
    return v20 & 1;
  }
  sub_10008EA20((uint64_t)v17);
  v20 = 1;
  return v20 & 1;
}

uint64_t sub_10008E99C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ImageStoreKey(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10008E9E0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100016484(&qword_1000DA650);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10008EA20(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ImageStoreKey(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t NTPBTodaySectionConfigWebEmbed.conforms(to:)(__objc2_prot *a1)
{
  uint64_t result;
  objc_super v3;

  v3.super_class = (Class)NTPBTodaySectionConfigWebEmbed;
  LODWORD(result) = -[__objc2_prot conformsToProtocol:](&v3, "conformsToProtocol:", a1);
  if (&OBJC_PROTOCOL___NTTodayItem == a1)
    return 1;
  else
    return result;
}

id TagIntent.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TagIntent();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for TagIntent()
{
  return objc_opt_self(TagIntent);
}

id TagIntent.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TagIntent();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id TagIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  NSString v7;
  id v8;

  v4 = v3;
  if (a2)
  {
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v7 = 0;
  }
  v8 = objc_msgSend(objc_allocWithZone(v4), "initWithIdentifier:backingStore:", v7, a3);

  return v8;
}

id TagIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  NSString v6;
  id v7;
  objc_super v9;

  if (a2)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v6 = 0;
  }
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for TagIntent();
  v7 = objc_msgSendSuper2(&v9, "initWithIdentifier:backingStore:", v6, a3);

  return v7;
}

id TagIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_class *v5;
  NSString v9;
  NSString v10;
  NSDictionary v11;
  id v12;

  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  if (a5)
  {
    v11.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a5);
  }
  else
  {
    v11.super.isa = 0;
  }
  v12 = objc_msgSend(objc_allocWithZone(v5), "initWithDomain:verb:parametersByName:", v9, v10, v11.super.isa);

  return v12;
}

id TagIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  NSString v9;
  NSString v10;
  NSDictionary v11;
  id v12;
  objc_super v14;

  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  if (a5)
  {
    v11.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a5);
  }
  else
  {
    v11.super.isa = 0;
  }
  v14.receiver = v5;
  v14.super_class = (Class)type metadata accessor for TagIntent();
  v12 = objc_msgSendSuper2(&v14, "initWithDomain:verb:parametersByName:", v9, v10, v11.super.isa);

  return v12;
}

id TagIntent.__deallocating_deinit()
{
  return sub_10008F7EC(type metadata accessor for TagIntent);
}

unint64_t TodayIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_10008F81C(a1);
}

Swift::Int sub_10008F0E0()
{
  Swift::UInt *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10008F124()
{
  Swift::UInt *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10008F14C(uint64_t a1)
{
  Swift::UInt *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

unint64_t sub_10008F18C@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_10008F81C(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t TagIntentResponse.code.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR___TagIntentResponse_code;
  swift_beginAccess(v0 + OBJC_IVAR___TagIntentResponse_code, v3, 0, 0);
  return *(_QWORD *)v1;
}

char *TagIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  char *v7;
  char v9[24];

  v5 = (char *)objc_msgSend(objc_allocWithZone(v2), "init");
  v6 = &v5[OBJC_IVAR___TagIntentResponse_code];
  swift_beginAccess(&v5[OBJC_IVAR___TagIntentResponse_code], v9, 1, 0);
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, "setUserActivity:", a2);

  return v7;
}

char *TagIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  void *v2;
  char *v5;
  char *v6;
  char *v7;
  char v9[24];

  v5 = (char *)objc_msgSend(v2, "init");
  v6 = &v5[OBJC_IVAR___TagIntentResponse_code];
  swift_beginAccess(&v5[OBJC_IVAR___TagIntentResponse_code], v9, 1, 0);
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, "setUserActivity:", a2);

  return v7;
}

id TagIntentResponse.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR___TagIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TagIntentResponse();
  return objc_msgSendSuper2(&v2, "init");
}

id Tag.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), "initWithCoder:", a1);

  return v3;
}

id TagIntentResponse.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___TagIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TagIntentResponse();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id TodayIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), "initWithBackingStore:", a1);

  return v3;
}

id TagIntentResponse.init(backingStore:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___TagIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TagIntentResponse();
  v3 = objc_msgSendSuper2(&v5, "initWithBackingStore:", a1);

  return v3;
}

id sub_10008F610(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  objc_super v7;

  *(_QWORD *)&a1[OBJC_IVAR___TagIntentResponse_code] = 0;
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for TagIntentResponse();
  return objc_msgSendSuper2(&v7, *a4, a3);
}

id TodayIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  objc_class *v1;
  NSDictionary v3;
  id v4;

  if (a1)
  {
    v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v3.super.isa = 0;
  }
  v4 = objc_msgSend(objc_allocWithZone(v1), "initWithPropertiesByName:", v3.super.isa);

  return v4;
}

id TagIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  char *v1;
  NSDictionary v3;
  id v4;
  objc_super v6;

  *(_QWORD *)&v1[OBJC_IVAR___TagIntentResponse_code] = 0;
  if (a1)
  {
    v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v3.super.isa = 0;
  }
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for TagIntentResponse();
  v4 = objc_msgSendSuper2(&v6, "initWithPropertiesByName:", v3.super.isa);

  if (v4)
  return v4;
}

id TagIntentResponse.__deallocating_deinit()
{
  return sub_10008F7EC(type metadata accessor for TagIntentResponse);
}

id sub_10008F7EC(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

unint64_t sub_10008F81C(unint64_t result)
{
  if (result > 6)
    return 0;
  return result;
}

uint64_t type metadata accessor for TagIntentResponse()
{
  return objc_opt_self(TagIntentResponse);
}

unint64_t sub_10008F850()
{
  unint64_t result;

  result = qword_1000DDBE8;
  if (!qword_1000DDBE8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for TagIntentResponseCode, &type metadata for TagIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_1000DDBE8);
  }
  return result;
}

uint64_t sub_10008F894@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___TagIntentResponse_code);
  result = swift_beginAccess(v3, v5, 0, 0);
  *a2 = *v3;
  return result;
}

uint64_t sub_10008F8E4(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___TagIntentResponse_code);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for TagIntentResponseCode()
{
  return &type metadata for TagIntentResponseCode;
}

id TodayIntent.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TodayIntent();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for TodayIntent()
{
  return objc_opt_self(TodayIntent);
}

id TodayIntent.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TodayIntent();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id TodayIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  NSString v6;
  id v7;
  objc_super v9;

  if (a2)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v6 = 0;
  }
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for TodayIntent();
  v7 = objc_msgSendSuper2(&v9, "initWithIdentifier:backingStore:", v6, a3);

  return v7;
}

id TodayIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  NSString v9;
  NSString v10;
  NSDictionary v11;
  id v12;
  objc_super v14;

  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  if (a5)
  {
    v11.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a5);
  }
  else
  {
    v11.super.isa = 0;
  }
  v14.receiver = v5;
  v14.super_class = (Class)type metadata accessor for TodayIntent();
  v12 = objc_msgSendSuper2(&v14, "initWithDomain:verb:parametersByName:", v9, v10, v11.super.isa);

  return v12;
}

id TodayIntent.__deallocating_deinit()
{
  return sub_10008F7EC(type metadata accessor for TodayIntent);
}

uint64_t TodayIntentResponse.code.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR___TodayIntentResponse_code;
  swift_beginAccess(v0 + OBJC_IVAR___TodayIntentResponse_code, v3, 0, 0);
  return *(_QWORD *)v1;
}

char *TodayIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  char *v7;
  char v9[24];

  v5 = (char *)objc_msgSend(objc_allocWithZone(v2), "init");
  v6 = &v5[OBJC_IVAR___TodayIntentResponse_code];
  swift_beginAccess(&v5[OBJC_IVAR___TodayIntentResponse_code], v9, 1, 0);
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, "setUserActivity:", a2);

  return v7;
}

char *TodayIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  void *v2;
  char *v5;
  char *v6;
  char *v7;
  char v9[24];

  v5 = (char *)objc_msgSend(v2, "init");
  v6 = &v5[OBJC_IVAR___TodayIntentResponse_code];
  swift_beginAccess(&v5[OBJC_IVAR___TodayIntentResponse_code], v9, 1, 0);
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, "setUserActivity:", a2);

  return v7;
}

id TodayIntentResponse.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR___TodayIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TodayIntentResponse();
  return objc_msgSendSuper2(&v2, "init");
}

id TodayIntentResponse.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___TodayIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TodayIntentResponse();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id TodayIntentResponse.init(backingStore:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___TodayIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TodayIntentResponse();
  v3 = objc_msgSendSuper2(&v5, "initWithBackingStore:", a1);

  return v3;
}

id sub_100090164(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  objc_super v7;

  *(_QWORD *)&a1[OBJC_IVAR___TodayIntentResponse_code] = 0;
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for TodayIntentResponse();
  return objc_msgSendSuper2(&v7, *a4, a3);
}

id TodayIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  char *v1;
  NSDictionary v3;
  id v4;
  objc_super v6;

  *(_QWORD *)&v1[OBJC_IVAR___TodayIntentResponse_code] = 0;
  if (a1)
  {
    v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v3.super.isa = 0;
  }
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for TodayIntentResponse();
  v4 = objc_msgSendSuper2(&v6, "initWithPropertiesByName:", v3.super.isa);

  if (v4)
  return v4;
}

id TodayIntentResponse.__deallocating_deinit()
{
  return sub_10008F7EC(type metadata accessor for TodayIntentResponse);
}

uint64_t type metadata accessor for TodayIntentResponse()
{
  return objc_opt_self(TodayIntentResponse);
}

unint64_t sub_1000902E4()
{
  unint64_t result;

  result = qword_1000DDC48;
  if (!qword_1000DDC48)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for TodayIntentResponseCode, &type metadata for TodayIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_1000DDC48);
  }
  return result;
}

uint64_t sub_100090328@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___TodayIntentResponse_code);
  result = swift_beginAccess(v3, v5, 0, 0);
  *a2 = *v3;
  return result;
}

uint64_t sub_100090378(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___TodayIntentResponse_code);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for TodayIntentResponseCode()
{
  return &type metadata for TodayIntentResponseCode;
}

id Tag.__allocating_init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_class *v6;
  NSString v10;
  NSString v11;
  NSString v12;
  id v13;

  if (a2)
  {
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v10 = 0;
  }
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  if (a6)
  {
    v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a6);
  }
  else
  {
    v12 = 0;
  }
  v13 = objc_msgSend(objc_allocWithZone(v6), "initWithIdentifier:displayString:pronunciationHint:", v10, v11, v12);

  return v13;
}

id Tag.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v6;
  NSString v10;
  NSString v11;
  NSString v12;
  id v13;
  objc_super v15;

  if (a2)
  {
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v10 = 0;
  }
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  if (a6)
  {
    v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a6);
  }
  else
  {
    v12 = 0;
  }
  v15.receiver = v6;
  v15.super_class = (Class)type metadata accessor for Tag();
  v13 = objc_msgSendSuper2(&v15, "initWithIdentifier:displayString:pronunciationHint:", v10, v11, v12);

  return v13;
}

uint64_t type metadata accessor for Tag()
{
  return objc_opt_self(Tag);
}

id Tag.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for Tag();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id Tag.__deallocating_deinit()
{
  return sub_10008F7EC(type metadata accessor for Tag);
}

id static TagResolutionResult.success(with:)(uint64_t a1)
{
  uint64_t v1;
  objc_super v4;

  v4.receiver = (id)swift_getObjCClassFromMetadata(v1);
  v4.super_class = (Class)&OBJC_METACLASS___TagResolutionResult;
  return objc_msgSendSuper2(&v4, "successWithResolvedObject:", a1);
}

id static TagResolutionResult.disambiguation(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *ObjCClassFromMetadata;
  Class isa;
  id v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  objc_super v10;

  v1 = a1;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v7 = a1;
    else
      v7 = a1 & 0xFFFFFFFFFFFFFF8;
    v8 = sub_10009085C();
    swift_bridgeObjectRetain(v1);
    v9 = _bridgeCocoaArray<A>(_:)(v7, v8);
    swift_bridgeObjectRelease(v1);
    v1 = v9;
  }
  else
  {
    v2 = swift_bridgeObjectRetain(a1);
    dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter(v2);
    sub_10009085C();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_10009085C();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v1);
  v10.receiver = ObjCClassFromMetadata;
  v10.super_class = (Class)&OBJC_METACLASS___TagResolutionResult;
  v5 = objc_msgSendSuper2(&v10, "disambiguationWithObjectsToDisambiguate:", isa);

  return v5;
}

unint64_t sub_10009085C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000DDCC8;
  if (!qword_1000DDCC8)
  {
    v1 = objc_opt_self(INObject);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000DDCC8);
  }
  return result;
}

id static TagResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  uint64_t v1;
  objc_super v4;

  v4.receiver = (id)swift_getObjCClassFromMetadata(v1);
  v4.super_class = (Class)&OBJC_METACLASS___TagResolutionResult;
  return objc_msgSendSuper2(&v4, "confirmationRequiredWithObjectToConfirm:", a1);
}

void static TagResolutionResult.success(with:)()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "NewsToday2/Tag.swift", 20, 2, 50, 0);
  __break(1u);
}

void static TagResolutionResult.disambiguation(with:)()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "NewsToday2/Tag.swift", 20, 2, 55, 0);
  __break(1u);
}

void static TagResolutionResult.confirmationRequired(with:)()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "NewsToday2/Tag.swift", 20, 2, 60, 0);
  __break(1u);
}

id TagResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v5;
  Class isa;
  id v7;

  v5 = objc_allocWithZone(v2);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  v7 = objc_msgSend(v5, "initWithJSONDictionary:forIntent:", isa, a2);

  return v7;
}

id TagResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  void *v2;
  Class isa;
  id v6;
  id v7;
  objc_super v9;

  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  v9.receiver = v2;
  v9.super_class = (Class)type metadata accessor for TagResolutionResult();
  v6 = objc_msgSendSuper2(&v9, "initWithJSONDictionary:forIntent:", isa, a2);

  v7 = v6;
  if (v7)

  return v7;
}

uint64_t type metadata accessor for TagResolutionResult()
{
  return objc_opt_self(TagResolutionResult);
}

id TagResolutionResult.__deallocating_deinit()
{
  return sub_10008F7EC(type metadata accessor for TagResolutionResult);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC10NewsToday2P33_B436E9C36ADDC85D4E6EC0EF22B0C9B319ResourceBundleClass);
}

uint64_t sub_100090D80()
{
  return sub_100090F18(1);
}

uint64_t sub_100090D88(int a1, int a2, int a3, int a4)
{
  BOOL v9;
  _DWORD v10[2];

  if (qword_1000E93F8 == -1)
  {
    if (qword_1000E9400)
    {
LABEL_3:
      v10[0] = a1;
      v10[1] = (a2 << 16) | (a3 << 8) | a4;
      return _availability_version_check(1, v10);
    }
  }
  else
  {
    dispatch_once_f(&qword_1000E93F8, 0, (dispatch_function_t)sub_100090F10);
    if (qword_1000E9400)
      goto LABEL_3;
  }
  if (qword_1000E93F0 == -1)
  {
    v9 = dword_1000E93E0 < a2;
    if (dword_1000E93E0 > a2)
      return 1;
  }
  else
  {
    dispatch_once_f(&qword_1000E93F0, 0, (dispatch_function_t)sub_100090D80);
    v9 = dword_1000E93E0 < a2;
    if (dword_1000E93E0 > a2)
      return 1;
  }
  if (v9)
    return 0;
  if (dword_1000E93E4 > a3)
    return 1;
  return dword_1000E93E4 >= a3 && dword_1000E93E8 >= a4;
}

uint64_t sub_100090F10()
{
  return sub_100090F18(0);
}

uint64_t sub_100090F18(uint64_t result)
{
  void *v1;
  BOOL v2;
  unsigned __int8 *v4;
  uint64_t (*v5)(_QWORD);
  unint64_t v6;
  uint64_t (*v7)(_QWORD, uint64_t, _QWORD, _QWORD);
  uint64_t (*v8)(_QWORD, const char *, uint64_t, unsigned __int8 *);
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t (*v10)(uint64_t);
  uint64_t (*v11)(void);
  FILE *v12;
  FILE *v13;
  uint64_t v14;
  size_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  FILE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  FILE *v27;
  unsigned int (*v28)(uint64_t, char *, uint64_t, uint64_t);
  char v29[32];

  v1 = (void *)qword_1000E9400;
  if (qword_1000E9400)
    v2 = (_DWORD)result == 0;
  else
    v2 = 0;
  if (!v2)
  {
    if (&__availability_version_check)
    {
      qword_1000E9400 = (uint64_t)&__availability_version_check;
      v1 = &__availability_version_check;
    }
    if (!v1 || (_DWORD)result != 0)
    {
      result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        v4 = *(unsigned __int8 **)result;
        result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          v5 = (uint64_t (*)(_QWORD))result;
          v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            v7 = (uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD))result;
            result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              v8 = (uint64_t (*)(_QWORD, const char *, uint64_t, unsigned __int8 *))result;
              result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  v10 = (uint64_t (*)(uint64_t))result;
                  result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    v11 = (uint64_t (*)(void))result;
                    result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        v12 = (FILE *)result;
                        result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          v13 = (FILE *)result;
                          v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          v14 = ftell(v13);
                          if (v14 < 0)
                          {
                            v16 = 0;
                          }
                          else
                          {
                            v15 = v14;
                            rewind(v13);
                            v16 = malloc(v15);
                            if (v16)
                            {
                              v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                v17 = v5(0);
                                if (v17)
                                {
                                  v18 = v17;
                                  v19 = v13;
                                  if (v6)
                                    v20 = ((uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD))v6)(0, v17, 0, 0, 0);
                                  else
                                    v20 = v7(0, v17, 0, 0);
                                  v21 = v20;
                                  if (v20)
                                  {
                                    v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      v23 = v22;
                                      v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984))
                                            sscanf(v29, "%d.%d.%d", &dword_1000E93E0, &dword_1000E93E4, &dword_1000E93E8);
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  v19 = v13;
                                }
                                v16 = v26;
                              }
                              else
                              {
                                v16 = v26;
                                v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void sub_100091248()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"headline", v6, 2u);

  sub_100003694();
}

void sub_100091300()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"trackableWidgetState", v6, 2u);

  sub_100003694();
}

void sub_1000913B8()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"widgetEventTracker", v6, 2u);

  sub_100003694();
}

void sub_100091470()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"assetHandlesByRemoteURL", v6, 2u);

  sub_100003694();
}

void sub_100091528()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"trackableWidgetState", v6, 2u);

  sub_100003694();
}

void sub_1000915E0()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"flintDocumentURLAssetHandlesByRemoteURL", v6, 2u);

  sub_100003694();
}

void sub_100091698()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"JSONArray", v6, 2u);

  sub_100003694();
}

void sub_100091750()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"assetManager", v6, 2u);

  sub_100003694();
}

void sub_100091808()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"assetHandlesByRemoteURL", v6, 2u);

  sub_100003694();
}

void sub_1000918C0()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"encodableElement", v6, 2u);

  sub_100003694();
}

void sub_100091978()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"JSONArray", v6, 2u);

  sub_100003694();
}

void sub_100091A30()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"reporter", v6, 2u);

  sub_100003694();
}

void sub_100091AE8()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"URL", v6, 2u);

  sub_100003694();
}

void sub_100091BA0()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"trackableWidgetState", v6, 2u);

  sub_100003694();
}

void sub_100091C58()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"widgetEventTracker", v6, 2u);

  sub_100003694();
}

void sub_100091D10()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"trackableWidgetState", v6, 2u);

  sub_100003694();
}

void sub_100091DC8()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"todaySourceIdentifier", v6, 2u);

  sub_100003694();
}

void sub_100091E80()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"b", v6, 2u);

  sub_100003694();
}

void sub_100091F38()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"a", v6, 2u);

  sub_100003694();
}

void sub_100091FF0()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("expected nil value for '%s'"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"self.startDate", v6, 2u);

  sub_100003694();
}

void sub_1000920A8()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("expected nil value for '%s'"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"self.startState", v6, 2u);

  sub_100003694();
}

void sub_100092160()
{
  id v0;
  uint64_t v1;
  int v2;
  const char *v3;
  __int16 v4;
  char *v5;
  __int16 v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("start and end events must be balanced!"));
  v2 = 136315906;
  v3 = "-[FTWidgetLingerEventTracker trackWidgetLingerEventExtremity:atDate:withTodaySource:appConfigTreatmentID:widgetDi"
       "splayMode:appearanceType:]";
  v4 = 2080;
  v5 = "FTWidgetLingerEventTracker.m";
  v6 = 1024;
  sub_100009FE4();
  sub_100009FCC((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v2);

  sub_100009FD8();
}

void sub_100092220()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("invalid nil value for '%s'"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"startDate", v6, 2u);

  sub_100003694();
}

void sub_1000922D8()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("invalid nil value for '%s'"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"startState", v6, 2u);

  sub_100003694();
}

void sub_100092390()
{
  id v0;
  uint64_t v1;
  int v2;
  const char *v3;
  __int16 v4;
  char *v5;
  __int16 v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("start and end events must be balanced!"));
  v2 = 136315906;
  v3 = "-[FTWidgetLingerEventTracker trackWidgetLingerEventExtremity:atDate:withTodaySource:appConfigTreatmentID:widgetDi"
       "splayMode:appearanceType:]";
  v4 = 2080;
  v5 = "FTWidgetLingerEventTracker.m";
  v6 = 1024;
  sub_100009FE4();
  sub_100009FCC((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v2);

  sub_100009FD8();
}

void sub_100092450()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"todaySourceIdentifier", v6, 2u);

  sub_100003694();
}

void sub_100092508()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"date", v6, 2u);

  sub_100003694();
}

void sub_1000925C0()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"endTodaySourceIdentifier", v6, 2u);

  sub_100003694();
}

void sub_100092678()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"userIDProvider", v6, 2u);

  sub_100003694();
}

void sub_100092730()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sessionManager", v6, 2u);

  sub_100003694();
}

void sub_1000927E8()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"trackableWidgetState", v6, 2u);

  sub_100003694();
}

void sub_1000928A0()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"changeDate", v6, 2u);

  sub_100003694();
}

void sub_100092958()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("invalid nil value for '%s'"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"lastVisibleItemsChangeDate", v6, 2u);

  sub_100003694();
}

void sub_100092A10()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"trackableWidgetState", v6, 2u);

  sub_100003694();
}

void sub_100092AC8()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"engagement", v6, 2u);

  sub_100003694();
}

void sub_100092B80()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"date", v6, 2u);

  sub_100003694();
}

void sub_100092C38()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"trackableWidgetState", v6, 2u);

  sub_100003694();
}

void sub_100092CF0()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"event", v6, 2u);

  sub_100003694();
}

void sub_100092DA8()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"section", v6, 2u);

  sub_100003694();
}

void sub_100092E70()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"todaySource", v6, 2u);

  sub_100003694();
}

void sub_100092F38()
{
  id v0;
  int v1;
  const char *v2;
  __int16 v3;
  char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  id v8;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Case not implemented"));
  v1 = 136315906;
  v2 = "NSString *FTCampaignIdentifierForSourceIdentifier(NSString *__strong)";
  v3 = 2080;
  v4 = "FTConstants.m";
  v5 = 1024;
  v6 = 30;
  v7 = 2114;
  v8 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);

}

void sub_100093014()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"todaySource", v6, 2u);

  sub_100003694();
}

void sub_1000930DC()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"appearanceDate", v6, 2u);

  sub_100003694();
}

void sub_1000931A4()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"assetHandlesByRemoteURL", v6, 2u);

  sub_100003694();
}

void sub_10009325C()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sectionsByHeadline", v6, 2u);

  sub_100003694();
}

void sub_100093314()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"headlines", v6, 2u);

  sub_100003694();
}

void sub_1000933CC()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("invalid nil value for '%s'"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"NewsArticleID", v6, 2u);

  sub_100003694();
}

void sub_100093484()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"unvalidatedValue", v6, 2u);

  sub_100003694();
}

void sub_10009354C()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"name", v6, 2u);

  sub_100003694();
}

void sub_100093614()
{
  id v0;
  uint8_t buf[4];
  const char *v2;
  __int16 v3;
  char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  id v8;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "userIDProvider");
  *(_DWORD *)buf = 136315906;
  v2 = "-[FTNewsAnalyticsWidgetEventTracker initWithUserIDProvider:]";
  v3 = 2080;
  v4 = "FTNewsAnalyticsWidgetEventTracker.m";
  v5 = 1024;
  v6 = 41;
  v7 = 2114;
  v8 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

}

void sub_1000936FC()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sharedDirectoryFileURL", v6, 2u);

  sub_100003694();
}

void sub_1000937B4()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"referralItem", v6, 2u);

  sub_100003694();
}

void sub_10009386C()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("invalid nil value for '%s'"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sourceFilePath", v6, 2u);

  sub_100003694();
}

void sub_100093924()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"assetManager", v6, 2u);

  sub_100003694();
}

void sub_1000939DC()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"queryValue", v6, 2u);

  sub_100003694();
}

void sub_100093A94()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"itemClass", v6, 2u);

  sub_100003694();
}

void sub_100093B4C()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"eventTrackers", v6, 2u);

  sub_100003694();
}

void sub_100093C14()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"trackableWidgetState", v6, 2u);

  sub_100003694();
}

void sub_100093CDC(uint64_t a1, id *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a2, "downloadError"));
  v7 = 138543618;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "failed to download JSON for headline %{public}@ with error %{public}@", (uint8_t *)&v7, 0x16u);

}

void sub_100093DA0()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"availabilityMonitor", v6, 2u);

  sub_100003694();
}

void sub_100093E68()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"engagementDescriptor", v6, 2u);

  sub_100003694();
}

void sub_100093F30()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"updateFetchDuration >= 0", v6, 2u);

  sub_100003694();
}

void sub_100093FF8()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"todaySourceIdentifier", v6, 2u);

  sub_100003694();
}

void sub_1000940C0()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"predicate", v6, 2u);

  sub_100003694();
}

void sub_100094178()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"widgetEventTracker", v6, 2u);

  sub_100003694();
}

void sub_100094230()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"trackableWidgetState", v6, 2u);

  sub_100003694();
}

void sub_1000942E8()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"date", v6, 2u);

  sub_100003694();
}

void sub_1000943A0()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"trackableWidgetState", v6, 2u);

  sub_100003694();
}

void sub_100094458()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"fetchInfo", v6, 2u);

  sub_100003694();
}

void sub_100094510()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"otherQueryItems", v6, 2u);

  sub_100003694();
}

void sub_1000945D8()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sourceIdentifier", v6, 2u);

  sub_100003694();
}

void sub_1000946A0()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"trackableWidgetState", v6, 2u);

  sub_100003694();
}

void sub_100094758()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"section", v6, 2u);

  sub_100003694();
}

void sub_100094810()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"headline", v6, 2u);

  sub_100003694();
}

void sub_1000948C8()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"date", v6, 2u);

  sub_100003694();
}

void sub_100094980()
{
  id v0;
  uint8_t buf[4];
  const char *v2;
  __int16 v3;
  char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  id v8;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "trackableWidgetState");
  *(_DWORD *)buf = 136315906;
  v2 = "-[FTProactiveWidgetEventTracker widgetDidAppearAtDate:withTrackableWidgetState:]";
  v3 = 2080;
  v4 = "FTProactiveWidgetEventTracker.m";
  v5 = 1024;
  v6 = 59;
  v7 = 2114;
  v8 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

}

void sub_100094A68()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"documentsDirectoryFileURL", v6, 2u);

  sub_100003694();
}

void sub_100094B20()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"todayEventTracker", v6, 2u);

  sub_100003694();
}

void sub_100094BD8()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("invalid nil value for '%s'"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"visibleHeadlinesAppearanceDate", v6, 2u);

  sub_100003694();
}

void sub_100094C90()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("invalid nil value for '%s'"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"visibleHeadlines", v6, 2u);

  sub_100003694();
}

void sub_100094D48()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"date", v6, 2u);

  sub_100003694();
}

void sub_100094E00()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"visibleHeadlines", v6, 2u);

  sub_100003694();
}

void sub_100094EB8()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("invalid nil value for '%s'"));
  sub_1000036B0();
  sub_1000036A0();
  sub_100003680();
  sub_100003670((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"contentContext", v6, 2u);

  sub_100003694();
}

uint64_t _s10NewsToday216TelemetryManagerC13lastFlushDate33_F9D4AB4E0910E2715C8CD19E0D9BCB95LL10Foundation0G0Vvpfi_0()
{
  return static Date.distantPast.getter();
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CGImage");
}

id objc_msgSend_CTRByPersonalizationFeatureID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CTRByPersonalizationFeatureID");
}

id objc_msgSend_JSONArray(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONArray");
}

id objc_msgSend_NewsURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "NewsURL");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URL");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__annotateEvent_withTrackableWidgetState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_annotateEvent:withTrackableWidgetState:");
}

id objc_msgSend__eventTrackersRespondingToSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_eventTrackersRespondingToSelector:");
}

id objc_msgSend__newWidgetEngagementWithTrackableWidgetState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_newWidgetEngagementWithTrackableWidgetState:");
}

id objc_msgSend__pbDisplayModeWithDisplayMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pbDisplayModeWithDisplayMode:");
}

id objc_msgSend__pbStackLocationWithStackLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pbStackLocationWithStackLocation:");
}

id objc_msgSend__pbWidgetTypeWithStackKind_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pbWidgetTypeWithStackKind:");
}

id objc_msgSend__registerOnceVisibleHeadlines_withLastSeenDate_minimumNumberOfTimesPreseenToBeSeen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerOnceVisibleHeadlines:withLastSeenDate:minimumNumberOfTimesPreseenToBeSeen:");
}

id objc_msgSend__shouldReportEventWithTodayResults_fetchInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldReportEventWithTodayResults:fetchInfo:");
}

id objc_msgSend__shouldReportEventWithTrackableWidgetState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldReportEventWithTrackableWidgetState:");
}

id objc_msgSend__trackWidgetLingerEventWithEndTodaySource_endAppConfigTreatmentID_endWidgetDisplayMode_endAppearanceType_endPropertiesChanged_lingerInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_trackWidgetLingerEventWithEndTodaySource:endAppConfigTreatmentID:endWidgetDisplayMode:endAppearanceType:endPropertiesChanged:lingerInterval:");
}

id objc_msgSend__widgetEngagementForHeadline_inSection_withTrackableWidgetState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_widgetEngagementForHeadline:inSection:withTrackableWidgetState:");
}

id objc_msgSend_abbreviation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "abbreviation");
}

id objc_msgSend_absoluteItemCountForCurrentDisplayMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "absoluteItemCountForCurrentDisplayMode");
}

id objc_msgSend_absoluteOrderOfItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "absoluteOrderOfItem:");
}

id objc_msgSend_absoluteOrderOfItemInSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "absoluteOrderOfItemInSection:");
}

id objc_msgSend_absoluteOrderOfSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "absoluteOrderOfSection:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_accumulator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accumulator");
}

id objc_msgSend_activeDisplayMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeDisplayMode");
}

id objc_msgSend_addCountOfArticlesExposedEachSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCountOfArticlesExposedEachSection:");
}

id objc_msgSend_addEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEvents:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addWidgetPersonalizationFeatureCTRPair_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addWidgetPersonalizationFeatureCTRPair:");
}

id objc_msgSend_allItemsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allItemsCount");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allValues");
}

id objc_msgSend_analyticsElement(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "analyticsElement");
}

id objc_msgSend_analyzeImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "analyzeImage:");
}

id objc_msgSend_annotateEvent_withOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "annotateEvent:withOptions:");
}

id objc_msgSend_annotateSession_withOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "annotateSession:withOptions:");
}

id objc_msgSend_appConfigTreatmentID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appConfigTreatmentID");
}

id objc_msgSend_appearanceType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appearanceType");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_articleID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "articleID");
}

id objc_msgSend_articleRecordData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "articleRecordData");
}

id objc_msgSend_asChannel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "asChannel");
}

id objc_msgSend_assetHandleForCKAssetURL_lifetimeHint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetHandleForCKAssetURL:lifetimeHint:");
}

id objc_msgSend_assetHandles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetHandles");
}

id objc_msgSend_assetManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetManager");
}

id objc_msgSend_availabilityMonitor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "availabilityMonitor");
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundColor");
}

id objc_msgSend_backingElement(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backingElement");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_baseNewsURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "baseNewsURL");
}

id objc_msgSend_cellularRadioAccessTechnology(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellularRadioAccessTechnology");
}

id objc_msgSend_channelID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "channelID");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "code");
}

id objc_msgSend_color_isCloseToOtherColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "color:isCloseToOtherColor:");
}

id objc_msgSend_colorWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithRed:green:blue:alpha:");
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_componentsInTimeZone_fromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsInTimeZone:fromDate:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentID");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copy");
}

id objc_msgSend_copyItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyItemAtURL:toURL:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentCalendar");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentSession");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "data");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "date");
}

id objc_msgSend_dateFromComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateFromComponents:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "domain");
}

id objc_msgSend_dominantColors(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dominantColors");
}

id objc_msgSend_downloadError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadError");
}

id objc_msgSend_downloadIfNeededWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadIfNeededWithCompletion:");
}

id objc_msgSend_enableFlushingWithFlushingThreshold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableFlushingWithFlushingThreshold:");
}

id objc_msgSend_encodableElement(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodableElement");
}

id objc_msgSend_encodableElementClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodableElementClass");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encodeQueryValueWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeQueryValueWithError:");
}

id objc_msgSend_engagementWithBackgroundAtDate_withTargetURL_trackableWidgetState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "engagementWithBackgroundAtDate:withTargetURL:trackableWidgetState:");
}

id objc_msgSend_engagementWithHeaderAtDate_withTargetURL_trackableWidgetState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "engagementWithHeaderAtDate:withTargetURL:trackableWidgetState:");
}

id objc_msgSend_engagementWithPlaceholderAtDate_withTargetURL_trackableWidgetState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "engagementWithPlaceholderAtDate:withTargetURL:trackableWidgetState:");
}

id objc_msgSend_engagementWithRowAtDate_forHeadline_withTrackableWidgetState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "engagementWithRowAtDate:forHeadline:withTrackableWidgetState:");
}

id objc_msgSend_entryID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entryID");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_eventAccumulators(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventAccumulators");
}

id objc_msgSend_eventAnnotator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventAnnotator");
}

id objc_msgSend_eventTrackers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventTrackers");
}

id objc_msgSend_eventTrackersProxy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventTrackersProxy");
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "events");
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_extentsOfSections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extentsOfSections:");
}

id objc_msgSend_fc_NewsArticleID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fc_NewsArticleID");
}

id objc_msgSend_fc_array_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fc_array:");
}

id objc_msgSend_fc_arrayByTransformingWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fc_arrayByTransformingWithBlock:");
}

id objc_msgSend_fc_arrayOfObjectsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fc_arrayOfObjectsPassingTest:");
}

id objc_msgSend_fc_dictionaryByTransformingValuesWithKeyAndValueBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fc_dictionaryByTransformingValuesWithKeyAndValueBlock:");
}

id objc_msgSend_fc_isHardPaywallNewsArticleURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fc_isHardPaywallNewsArticleURL:");
}

id objc_msgSend_fc_isNewsArticleURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fc_isNewsArticleURL");
}

id objc_msgSend_fc_rotateElementsFromTheIndexOfSelectedItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fc_rotateElementsFromTheIndexOfSelectedItem:");
}

id objc_msgSend_fc_safelySetObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fc_safelySetObject:forKey:");
}

id objc_msgSend_fc_safelySetObjectAllowingNil_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fc_safelySetObjectAllowingNil:forKey:");
}

id objc_msgSend_fc_stringWithISO8601Format(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fc_stringWithISO8601Format");
}

id objc_msgSend_fetchDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchDate");
}

id objc_msgSend_fetchInfoForVisibleResults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchInfoForVisibleResults");
}

id objc_msgSend_fileCoordinatedFIFOHost(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileCoordinatedFIFOHost");
}

id objc_msgSend_fileCoordinatedStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileCoordinatedStore");
}

id objc_msgSend_filePath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filePath");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_flintDocumentURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flintDocumentURL");
}

id objc_msgSend_flintDocumentURLAssetHandlesByRemoteURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flintDocumentURLAssetHandlesByRemoteURL");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "floatValue");
}

id objc_msgSend_fontDescriptorByAddingAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontDescriptorByAddingAttributes:");
}

id objc_msgSend_fontDescriptorWithSymbolicTraits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontDescriptorWithSymbolicTraits:");
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontWithDescriptor:size:");
}

id objc_msgSend_ft_appearanceTypeProperty(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ft_appearanceTypeProperty");
}

id objc_msgSend_ft_BOOLeanPropertyWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ft_BOOLeanPropertyWithName:");
}

id objc_msgSend_ft_eventWithDate_action_headline_section_headlineIndexInSection_precedingHeadlinesCount_precedingSectionsCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ft_eventWithDate:action:headline:section:headlineIndexInSection:precedingHeadlinesCount:precedingSectionsCount:");
}

id objc_msgSend_ft_headlineSourceProperty(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ft_headlineSourceProperty");
}

id objc_msgSend_ft_itemWithHeadlines_sectionsByHeadline_assetHandlesByRemoteURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ft_itemWithHeadlines:sectionsByHeadline:assetHandlesByRemoteURL:");
}

id objc_msgSend_ft_localTimeHourProperty(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ft_localTimeHourProperty");
}

id objc_msgSend_ft_referralURLWithSourceIdentifier_appConfigTreatmentID_widgetEngagement_otherQueryItems_sharedDirectoryFileURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ft_referralURLWithSourceIdentifier:appConfigTreatmentID:widgetEngagement:otherQueryItems:sharedDirectoryFileURL:");
}

id objc_msgSend_ft_sectionProperty(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ft_sectionProperty");
}

id objc_msgSend_ft_setTemporalBoundsBySanitizingStartDate_endDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ft_setTemporalBoundsBySanitizingStartDate:endDate:");
}

id objc_msgSend_ft_timeZoneProperty(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ft_timeZoneProperty");
}

id objc_msgSend_ft_userGroupProperty(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ft_userGroupProperty");
}

id objc_msgSend_ft_widgetDisplayModeProperty(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ft_widgetDisplayModeProperty");
}

id objc_msgSend_getCharacters_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCharacters:range:");
}

id objc_msgSend_hashTableWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hashTableWithOptions:");
}

id objc_msgSend_headline(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "headline");
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hour");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifier");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexSetWithIndexesInRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexSetWithIndexesInRange:");
}

id objc_msgSend_initWithArticleID_sourceChannelID_sectionData_flintDocumentAssetHandle_articleRecordData_sourceChannelRecordData_parentIssueRecordData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArticleID:sourceChannelID:sectionData:flintDocumentAssetHandle:articleRecordData:sourceChannelRecordData:parentIssueRecordData:");
}

id objc_msgSend_initWithArticleRecordData_sourceChannel_parentIssue_assetManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArticleRecordData:sourceChannel:parentIssue:assetManager:");
}

id objc_msgSend_initWithBase64EncodedString_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBase64EncodedString:options:");
}

id objc_msgSend_initWithCalendarIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCalendarIdentifier:");
}

id objc_msgSend_initWithContentType_contentTypeVersion_contentTypeMinorVersion_contentTypePatchVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentType:contentTypeVersion:contentTypeMinorVersion:contentTypePatchVersion:");
}

id objc_msgSend_initWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfURL:");
}

id objc_msgSend_initWithData_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:context:");
}

id objc_msgSend_initWithData_sourceChannel_assetManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:sourceChannel:assetManager:");
}

id objc_msgSend_initWithEncodableElement_assetHandlesByRemoteURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEncodableElement:assetHandlesByRemoteURL:");
}

id objc_msgSend_initWithEnvelopeDescriptor_sessionManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEnvelopeDescriptor:sessionManager:");
}

id objc_msgSend_initWithEventTrackers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEventTrackers:");
}

id objc_msgSend_initWithFeatureId_event_registerProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFeatureId:event:registerProperties:");
}

id objc_msgSend_initWithFileURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFileURL:");
}

id objc_msgSend_initWithFileURL_allowedClasses_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFileURL:allowedClasses:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithJSONArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithJSONArray:");
}

id objc_msgSend_initWithJSONArray_flintDocumentURLAssetHandlesByRemoteURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithJSONArray:flintDocumentURLAssetHandlesByRemoteURL:");
}

id objc_msgSend_initWithMaxRowCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMaxRowCount:");
}

id objc_msgSend_initWithMaxRowCount_trackedEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMaxRowCount:trackedEvents:");
}

id objc_msgSend_initWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:");
}

id objc_msgSend_initWithName_directory_keyManager_avAssetFactory_resourceURLGenerator_networkBehaviorMonitor_networkReachability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:directory:keyManager:avAssetFactory:resourceURLGenerator:networkBehaviorMonitor:networkReachability:");
}

id objc_msgSend_initWithName_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:value:");
}

id objc_msgSend_initWithReferralItem_sharedDirectoryFileURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithReferralItem:sharedDirectoryFileURL:");
}

id objc_msgSend_initWithSessionManager_userIDProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSessionManager:userIDProvider:");
}

id objc_msgSend_initWithTodaySource_appConfigTreatmentID_widgetDisplayMode_appearanceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTodaySource:appConfigTreatmentID:widgetDisplayMode:appearanceType:");
}

id objc_msgSend_initWithURL_engagementReporter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:engagementReporter:");
}

id objc_msgSend_initWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:resolvingAgainstBaseURL:");
}

id objc_msgSend_initWithWidgetEventTracker_predicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithWidgetEventTracker:predicate:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceOrientation");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isLingerInProgress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLingerInProgress");
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMainThread");
}

id objc_msgSend_isNewsAvailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNewsAvailable");
}

id objc_msgSend_itemExposuresSinceLastWidgetAppearance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemExposuresSinceLastWidgetAppearance");
}

id objc_msgSend_itemType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemType");
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "items");
}

id objc_msgSend_keyWindow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyWindow");
}

id objc_msgSend_lastVisibleItemsChangeArticleCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastVisibleItemsChangeArticleCount");
}

id objc_msgSend_lastVisibleItemsChangeDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastVisibleItemsChangeDate");
}

id objc_msgSend_lastVisibleItemsChangePairs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastVisibleItemsChangePairs");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_localTimeZone(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localTimeZone");
}

id objc_msgSend_makeObjectsPerformSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeObjectsPerformSelector:");
}

id objc_msgSend_makeObjectsPerformSelector_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeObjectsPerformSelector:withObject:");
}

id objc_msgSend_minimumArticleExposureDurationToBePreseen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minimumArticleExposureDurationToBePreseen");
}

id objc_msgSend_minimumNumberOfTimesPreseenToBeSeen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minimumNumberOfTimesPreseenToBeSeen");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_myEncodableElement(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "myEncodableElement");
}

id objc_msgSend_needsSeenStateTracking(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "needsSeenStateTracking");
}

id objc_msgSend_nf_object_isEqualToObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nf_object:isEqualToObject:");
}

id objc_msgSend_nss_URLWithCampaignID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nss_URLWithCampaignID:");
}

id objc_msgSend_nss_eventWithIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nss_eventWithIdentifier");
}

id objc_msgSend_nss_setStartDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nss_setStartDate:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectsAtIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectsAtIndexes:");
}

id objc_msgSend_observeEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observeEvent:");
}

id objc_msgSend_observeEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observeEvents:");
}

id objc_msgSend_observers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observers");
}

id objc_msgSend_openInNewsReferralItemQueryItemName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openInNewsReferralItemQueryItemName");
}

id objc_msgSend_openInNewsReferralItemWithTrackableWidgetState_assetHandlesByRemoteURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openInNewsReferralItemWithTrackableWidgetState:assetHandlesByRemoteURL:");
}

id objc_msgSend_orderHeadlineEngagementEventTracker(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orderHeadlineEngagementEventTracker");
}

id objc_msgSend_orderedSetWithOrderedSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orderedSetWithOrderedSet:");
}

id objc_msgSend_outstandingItemExposureEvents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outstandingItemExposureEvents");
}

id objc_msgSend_parentIssueRecordData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parentIssueRecordData");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "path");
}

id objc_msgSend_personalizationEventAtDate_withAction_headline_section_trackableWidgetState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personalizationEventAtDate:withAction:headline:section:trackableWidgetState:");
}

id objc_msgSend_personalizationMetadata(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personalizationMetadata");
}

id objc_msgSend_predicate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicate");
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:");
}

id objc_msgSend_preseenCountTrackingIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preseenCountTrackingIdentifier");
}

id objc_msgSend_propertyWithName_enumMapping_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyWithName:enumMapping:");
}

id objc_msgSend_propertyWithName_enumMapping_autoSanitizeValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyWithName:enumMapping:autoSanitizeValues:");
}

id objc_msgSend_propertyWithName_possibleValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyWithName:possibleValues:");
}

id objc_msgSend_propertyWithName_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyWithName:range:");
}

id objc_msgSend_propertyWithName_range_clampValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyWithName:range:clampValues:");
}

id objc_msgSend_queryItemWithName_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryItemWithName:value:");
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryItems");
}

id objc_msgSend_referralBarName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "referralBarName");
}

id objc_msgSend_referralItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "referralItem");
}

id objc_msgSend_remoteURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteURL");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_removeObjectsInRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsInRange:");
}

id objc_msgSend_reporter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reporter");
}

id objc_msgSend_saveWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveWithCompletionHandler:");
}

id objc_msgSend_sectionForItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionForItem:");
}

id objc_msgSend_sections(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sections");
}

id objc_msgSend_sessionAnnotator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionAnnotator");
}

id objc_msgSend_sessionHasEngagement(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionHasEngagement");
}

id objc_msgSend_setAppConfigTreatmentId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppConfigTreatmentId:");
}

id objc_msgSend_setArticleId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArticleId:");
}

id objc_msgSend_setContentFetchDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentFetchDate:");
}

id objc_msgSend_setContentId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentId:");
}

id objc_msgSend_setCtr_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCtr:");
}

id objc_msgSend_setCurrentSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentSession:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setEngagementTargetUrl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEngagementTargetUrl:");
}

id objc_msgSend_setEntryId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEntryId:");
}

id objc_msgSend_setEnvelopes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnvelopes:");
}

id objc_msgSend_setEventObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventObject:");
}

id objc_msgSend_setEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEvents:");
}

id objc_msgSend_setGestureType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGestureType:");
}

id objc_msgSend_setItemExposuresSinceLastWidgetAppearance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemExposuresSinceLastWidgetAppearance:");
}

id objc_msgSend_setLastVisibleItemsChangeArticleCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastVisibleItemsChangeArticleCount:");
}

id objc_msgSend_setLastVisibleItemsChangeDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastVisibleItemsChangeDate:");
}

id objc_msgSend_setLastVisibleItemsChangePairs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastVisibleItemsChangePairs:");
}

id objc_msgSend_setLingerInProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLingerInProgress:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOtherVisibleSections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOtherVisibleSections:");
}

id objc_msgSend_setOutstandingItemExposureEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOutstandingItemExposureEvents:");
}

id objc_msgSend_setPersonalizationFeatureId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersonalizationFeatureId:");
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueryItems:");
}

id objc_msgSend_setRunningObsolete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRunningObsolete:");
}

id objc_msgSend_setSessionHasEngagement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessionHasEngagement:");
}

id objc_msgSend_setSourceChannelId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceChannelId:");
}

id objc_msgSend_setStartDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartDate:");
}

id objc_msgSend_setStartState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartState:");
}

id objc_msgSend_setStoryType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStoryType:");
}

id objc_msgSend_setSubmissionCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubmissionCompletion:");
}

id objc_msgSend_setTodayWidgetExposure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTodayWidgetExposure:");
}

id objc_msgSend_setTodayWidgetHeadlineExposure_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTodayWidgetHeadlineExposure:");
}

id objc_msgSend_setUserID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserID:");
}

id objc_msgSend_setUserId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserId:");
}

id objc_msgSend_setUserSegmentationSegmentSetIds_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserSegmentationSegmentSetIds:count:");
}

id objc_msgSend_setUserSegmentationTreatmentIds_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserSegmentationTreatmentIds:count:");
}

id objc_msgSend_setVisibleHeadlines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVisibleHeadlines:");
}

id objc_msgSend_setVisibleHeadlinesAppearanceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVisibleHeadlinesAppearanceDate:");
}

id objc_msgSend_setWebEmbedId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWebEmbedId:");
}

id objc_msgSend_setWidgetAppearanceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWidgetAppearanceDate:");
}

id objc_msgSend_setWidgetAppearanceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWidgetAppearanceType:");
}

id objc_msgSend_setWidgetArticleCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWidgetArticleCount:");
}

id objc_msgSend_setWidgetArticleCountInSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWidgetArticleCountInSection:");
}

id objc_msgSend_setWidgetArticleRank_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWidgetArticleRank:");
}

id objc_msgSend_setWidgetArticleRankInSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWidgetArticleRankInSection:");
}

id objc_msgSend_setWidgetContentType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWidgetContentType:");
}

id objc_msgSend_setWidgetDisplayMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWidgetDisplayMode:");
}

id objc_msgSend_setWidgetDisplayModeSessionEnd_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWidgetDisplayModeSessionEnd:");
}

id objc_msgSend_setWidgetEngagement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWidgetEngagement:");
}

id objc_msgSend_setWidgetEngagementType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWidgetEngagementType:");
}

id objc_msgSend_setWidgetExposureStackLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWidgetExposureStackLocation:");
}

id objc_msgSend_setWidgetHeadlineExposureCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWidgetHeadlineExposureCount:");
}

id objc_msgSend_setWidgetSectionDisplayRank_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWidgetSectionDisplayRank:");
}

id objc_msgSend_setWidgetSectionId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWidgetSectionId:");
}

id objc_msgSend_setWidgetSectionIdsExposed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWidgetSectionIdsExposed:");
}

id objc_msgSend_setWidgetSectionSubid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWidgetSectionSubid:");
}

id objc_msgSend_setWidgetSectionSubidsExposed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWidgetSectionSubidsExposed:");
}

id objc_msgSend_setWidgetSectionsArticleCountPairs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWidgetSectionsArticleCountPairs:");
}

id objc_msgSend_setWidgetSessionId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWidgetSessionId:");
}

id objc_msgSend_setWidgetType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWidgetType:");
}

id objc_msgSend_setWidgetUserId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWidgetUserId:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_sharedDirectoryFileURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedDirectoryFileURL");
}

id objc_msgSend_sharedNetworkReachability(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedNetworkReachability");
}

id objc_msgSend_slowCachedTagForID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "slowCachedTagForID:");
}

id objc_msgSend_sourceChannelID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceChannelID");
}

id objc_msgSend_sourceChannelRecordData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceChannelRecordData");
}

id objc_msgSend_sourceTagID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceTagID");
}

id objc_msgSend_stackKind(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stackKind");
}

id objc_msgSend_stackLocation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stackLocation");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "start");
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startDate");
}

id objc_msgSend_startState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startState");
}

id objc_msgSend_storyType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storyType");
}

id objc_msgSend_stringIsValid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringIsValid:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subidentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subidentifier");
}

id objc_msgSend_submissionGroup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submissionGroup");
}

id objc_msgSend_submitEventsIfNeededWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitEventsIfNeededWithCompletion:");
}

id objc_msgSend_submitUpdate_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitUpdate:withCompletion:");
}

id objc_msgSend_tagController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tagController");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeOfDayHeadlineEngagementEventTracker(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeOfDayHeadlineEngagementEventTracker");
}

id objc_msgSend_timeOfDayWidgetAppearanceEventTracker(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeOfDayWidgetAppearanceEventTracker");
}

id objc_msgSend_todayEventTracker(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "todayEventTracker");
}

id objc_msgSend_todayResults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "todayResults");
}

id objc_msgSend_todaySourceIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "todaySourceIdentifier");
}

id objc_msgSend_trackAppearanceAtDate_withHeadlineSource_appConfigTreatmentID_appearanceType_allItemsCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackAppearanceAtDate:withHeadlineSource:appConfigTreatmentID:appearanceType:allItemsCount:");
}

id objc_msgSend_trackDisappearance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackDisappearance");
}

id objc_msgSend_trackEventWithPropertyValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackEventWithPropertyValues:");
}

id objc_msgSend_trackEventWithPropertyValues_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackEventWithPropertyValues:value:");
}

id objc_msgSend_trackUpdateWithTodaySource_appConfigTreatmentID_error_updateFetchDuration_wifiReachable_cellularRadioAccessTechnology_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackUpdateWithTodaySource:appConfigTreatmentID:error:updateFetchDuration:wifiReachable:cellularRadioAccessTechnology:");
}

id objc_msgSend_trackWidgetLingerEventExtremity_atDate_withTodaySource_appConfigTreatmentID_widgetDisplayMode_appearanceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackWidgetLingerEventExtremity:atDate:withTodaySource:appConfigTreatmentID:widgetDisplayMode:appearanceType:");
}

id objc_msgSend_trackedEvents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackedEvents");
}

id objc_msgSend_traitCollectionWithPreferredContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "traitCollectionWithPreferredContentSizeCategory:");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_uniqueKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uniqueKey");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_userEngagedWithWidgetAtDate_actionURL_trackableWidgetState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userEngagedWithWidgetAtDate:actionURL:trackableWidgetState:");
}

id objc_msgSend_userID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userID");
}

id objc_msgSend_userIDProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userIDProvider");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_userSegmentationSegmentSetIds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userSegmentationSegmentSetIds");
}

id objc_msgSend_userSegmentationSegmentSetIdsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userSegmentationSegmentSetIdsCount");
}

id objc_msgSend_userSegmentationTreatmentIds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userSegmentationTreatmentIds");
}

id objc_msgSend_userSegmentationTreatmentIdsCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userSegmentationTreatmentIdsCount");
}

id objc_msgSend_visibleHeadlines(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visibleHeadlines");
}

id objc_msgSend_visibleHeadlinesAppearanceDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visibleHeadlinesAppearanceDate");
}

id objc_msgSend_visibleItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visibleItems");
}

id objc_msgSend_visibleItemsDidChangeAtDate_withTriggerEvent_trackableWidgetState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visibleItemsDidChangeAtDate:withTriggerEvent:trackableWidgetState:");
}

id objc_msgSend_visibleSections(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visibleSections");
}

id objc_msgSend_widgetAppearanceDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "widgetAppearanceDate");
}

id objc_msgSend_widgetAppearanceEventTracker(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "widgetAppearanceEventTracker");
}

id objc_msgSend_widgetConfig(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "widgetConfig");
}

id objc_msgSend_widgetDidAppearAtDate_withTrackableWidgetState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "widgetDidAppearAtDate:withTrackableWidgetState:");
}

id objc_msgSend_widgetDidDisappearAtDate_withTrackableWidgetState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "widgetDidDisappearAtDate:withTrackableWidgetState:");
}

id objc_msgSend_widgetDisappearanceEventTracker(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "widgetDisappearanceEventTracker");
}

id objc_msgSend_widgetDisplayMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "widgetDisplayMode");
}

id objc_msgSend_widgetEventTracker(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "widgetEventTracker");
}

id objc_msgSend_widgetLingerEventTracker(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "widgetLingerEventTracker");
}

id objc_msgSend_widgetPerformedUpdateWithTodayResults_fetchInfo_error_updateFetchDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "widgetPerformedUpdateWithTodayResults:fetchInfo:error:updateFetchDuration:");
}

id objc_msgSend_widgetUpdateEventTracker(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "widgetUpdateEventTracker");
}

id objc_msgSend_widgetUpdateFailureEventTracker(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "widgetUpdateFailureEventTracker");
}

id objc_msgSend_wifiReachable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wifiReachable");
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "windowScene");
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:atomically:");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:options:error:");
}

id objc_msgSend_writeUserDidSeeHeadlinesWithAnalyticsElements_atDate_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeUserDidSeeHeadlinesWithAnalyticsElements:atDate:withCompletion:");
}

id objc_msgSend_writeWithAccessor_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeWithAccessor:completion:");
}
