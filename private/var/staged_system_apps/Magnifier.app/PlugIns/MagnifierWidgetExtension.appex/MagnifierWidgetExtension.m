uint64_t sub_1000031B0()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for MagnifierWidgetReferenceClass()
{
  return objc_opt_self(_TtC24MagnifierWidgetExtension29MagnifierWidgetReferenceClass);
}

ValueMetadata *type metadata accessor for MagnifierWidget()
{
  return &type metadata for MagnifierWidget;
}

uint64_t sub_1000031F0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100003D28, 1);
}

uint64_t sub_100003200@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t ObjCClassFromMetadata;
  void *v15;
  id v16;
  Swift::String v17;
  Swift::String v18;
  Swift::String v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t OpaqueTypeConformance2;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[2];
  Swift::String v42;

  v40 = a1;
  type metadata accessor for ControlSize(0);
  __chkstk_darwin();
  v2 = (char *)&v35 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_100003604(&qword_1000081D0);
  v4 = *(_QWORD *)(v3 - 8);
  v36 = v3;
  v37 = v4;
  __chkstk_darwin();
  v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100003604(&qword_1000081D8);
  v8 = *(_QWORD *)(v7 - 8);
  v38 = v7;
  v39 = v8;
  __chkstk_darwin();
  v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = off_100008130;
  v35 = qword_100008128;
  v12 = type metadata accessor for MagnifierIntent(0);
  v13 = type metadata accessor for MagnifierWidgetReferenceClass();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v13);
  v15 = (void *)objc_opt_self(NSBundle);
  swift_bridgeObjectRetain(v11);
  v16 = objc_msgSend(v15, "bundleForClass:", ObjCClassFromMetadata);
  v42._countAndFlagsBits = 0xD00000000000001ALL;
  v42._object = (void *)0x8000000100003AD0;
  v17._countAndFlagsBits = 0x545F544547444957;
  v17._object = (void *)0xEC000000454C5449;
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  v19 = NSLocalizedString(_:tableName:bundle:value:comment:)(v17, (Swift::String_optional)0, (NSBundle)v16, v18, v42);

  static ControlSize._1x1.getter();
  v20 = sub_100003604(&qword_1000081E0);
  v21 = sub_100003648();
  v22 = sub_1000036D4(&qword_1000081F0, &qword_1000081E0, (uint64_t)&protocol conformance descriptor for Label<A, B>);
  ControlButton.init<A>(kind:intent:displayName:preferredSize:title:affordances:)(v35, v11, v12, v19._countAndFlagsBits, v19._object, v2, sub_100003644, 0, 0, 0, v12, v20, v21, v22);
  v23 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000012, 0x8000000100003AF0);
  v25 = v24;
  LOBYTE(v21) = v26;
  v28 = v27;
  v29 = sub_1000036D4(&qword_1000081F8, &qword_1000081D0, (uint64_t)&protocol conformance descriptor for ControlButton<A>);
  v30 = v23;
  v31 = v36;
  WidgetConfiguration.description(_:)(v30, v25, v21 & 1, v28, v36, v29);
  swift_bridgeObjectRelease(v28);
  swift_bridgeObjectRelease(v25);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v6, v31);
  v41[0] = v31;
  v41[1] = v29;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v41, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description(_:)>>, 1);
  v33 = v38;
  WidgetConfiguration.showsInSystemSpaces()(v38, OpaqueTypeConformance2);
  return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v10, v33);
}

uint64_t sub_100003504()
{
  uint64_t v0;
  uint64_t ObjCClassFromMetadata;
  id v2;
  Swift::String v3;
  Swift::String v4;
  Swift::String v5;
  unint64_t v6;
  Swift::String v8;
  Swift::String v9;

  v0 = type metadata accessor for MagnifierWidgetReferenceClass();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v0);
  v2 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  v9._countAndFlagsBits = 0xD00000000000001ALL;
  v9._object = (void *)0x8000000100003AD0;
  v3._countAndFlagsBits = 0x545F544547444957;
  v3._object = (void *)0xEC000000454C5449;
  v4._countAndFlagsBits = 0;
  v4._object = (void *)0xE000000000000000;
  v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(v3, (Swift::String_optional)0, (NSBundle)v2, v4, v9);

  v8 = v5;
  v6 = sub_100003714();
  return Label<>.init<A>(_:systemImage:)(&v8, 0xD000000000000014, 0x8000000100003B10, &type metadata for String, v6);
}

uint64_t sub_100003604(uint64_t *a1)
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

unint64_t sub_100003648()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000081E8;
  if (!qword_1000081E8)
  {
    v1 = type metadata accessor for MagnifierIntent(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for MagnifierIntent, v1);
    atomic_store(result, (unint64_t *)&qword_1000081E8);
  }
  return result;
}

uint64_t sub_100003690(uint64_t *a1)
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

uint64_t sub_1000036D4(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100003690(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100003714()
{
  unint64_t result;

  result = qword_100008200;
  if (!qword_100008200)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100008200);
  }
  return result;
}

uint64_t sub_100003758()
{
  uint64_t v0;
  uint64_t OpaqueTypeConformance2;
  uint64_t v3;
  uint64_t v4;

  v0 = sub_100003690(&qword_1000081D8);
  v3 = sub_100003690(&qword_1000081D0);
  v4 = sub_1000036D4(&qword_1000081F8, &qword_1000081D0, (uint64_t)&protocol conformance descriptor for ControlButton<A>);
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v3, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description(_:)>>, 1);
  v3 = v0;
  v4 = OpaqueTypeConformance2;
  return swift_getOpaqueTypeConformance2(&v3, &opaque type descriptor for <<opaque return type of WidgetConfiguration.showsInSystemSpaces()>>, 1);
}

uint64_t sub_1000037EC()
{
  unint64_t v0;

  v0 = sub_1000038B4();
  return static WidgetBundleBuilder.buildBlock<A>(_:)(v0, &type metadata for MagnifierWidget, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_100003850();
  static WidgetBundle.main()();
  return 0;
}

unint64_t sub_100003850()
{
  unint64_t result;

  result = qword_100008208;
  if (!qword_100008208)
  {
    result = swift_getWitnessTable(&unk_100003C68, &type metadata for MagnifierWidgetBundle);
    atomic_store(result, (unint64_t *)&qword_100008208);
  }
  return result;
}

ValueMetadata *type metadata accessor for MagnifierWidgetBundle()
{
  return &type metadata for MagnifierWidgetBundle;
}

uint64_t sub_1000038A4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100003D6C, 1);
}

unint64_t sub_1000038B4()
{
  unint64_t result;

  result = qword_100008210;
  if (!qword_100008210)
  {
    result = swift_getWitnessTable(&unk_100003C00, &type metadata for MagnifierWidget);
    atomic_store(result, (unint64_t *)&qword_100008210);
  }
  return result;
}

uint64_t sub_1000038F8()
{
  _QWORD v1[2];

  v1[0] = &type metadata for MagnifierWidget;
  v1[1] = sub_1000038B4();
  return swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of static WidgetBundleBuilder.buildBlock<A>(_:)>>, 1);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC24MagnifierWidgetExtensionP33_8B433FF4FAA92CDE757572F7EFA1492A19ResourceBundleClass);
}
