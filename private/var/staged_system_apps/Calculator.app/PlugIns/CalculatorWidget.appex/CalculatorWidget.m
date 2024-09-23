uint64_t sub_10000499C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;

  v0 = sub_100004AD8(&qword_10000C148);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100004B18();
  _ControlWidgetAdaptor.init(_:)(v4, &type metadata for CalculatorControl, v4);
  v5 = sub_100004B5C();
  static WidgetBundleBuilder.buildBlock<A>(_:)(v3, v0, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_100004A74();
  static WidgetBundle.main()();
  return 0;
}

unint64_t sub_100004A74()
{
  unint64_t result;

  result = qword_10000C140;
  if (!qword_10000C140)
  {
    result = swift_getWitnessTable(&unk_100007190, &type metadata for ControlCenterExtensionBundle);
    atomic_store(result, (unint64_t *)&qword_10000C140);
  }
  return result;
}

ValueMetadata *type metadata accessor for ControlCenterExtensionBundle()
{
  return &type metadata for ControlCenterExtensionBundle;
}

uint64_t sub_100004AC8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10000773C, 1);
}

uint64_t sub_100004AD8(uint64_t *a1)
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

unint64_t sub_100004B18()
{
  unint64_t result;

  result = qword_10000C150;
  if (!qword_10000C150)
  {
    result = swift_getWitnessTable(&unk_100007214, &type metadata for CalculatorControl);
    atomic_store(result, (unint64_t *)&qword_10000C150);
  }
  return result;
}

unint64_t sub_100004B5C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000C158;
  if (!qword_10000C158)
  {
    v1 = sub_100004BA8(&qword_10000C148);
    result = swift_getWitnessTable(&protocol conformance descriptor for _ControlWidgetAdaptor<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10000C158);
  }
  return result;
}

uint64_t sub_100004BA8(uint64_t *a1)
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

uint64_t sub_100004BEC()
{
  _QWORD v1[2];

  v1[0] = sub_100004BA8(&qword_10000C148);
  v1[1] = sub_100004B5C();
  return swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of static WidgetBundleBuilder.buildBlock<A>(_:)>>, 1);
}

ValueMetadata *type metadata accessor for CalculatorControl()
{
  return &type metadata for CalculatorControl;
}

uint64_t sub_100004C48(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100007780, 1);
}

uint64_t sub_100004C58@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(_BYTE *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t OpaqueTypeConformance2;
  _BYTE *v33;
  uint64_t v34;
  _BYTE *v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE v39[4];
  unsigned int v40;
  _BYTE *v41;
  uint64_t v42;
  uint64_t v43;
  _BYTE *v44;
  uint64_t v45;
  _BYTE *v46;
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

  v53 = a1;
  v54 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v48 = *(_QWORD *)(v54 - 8);
  __chkstk_darwin(v54);
  v46 = &v39[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v2 = type metadata accessor for Locale(0);
  __chkstk_darwin(v2);
  v4 = &v39[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v5);
  v7 = &v39[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v47 = type metadata accessor for LocalizedStringResource(0);
  v45 = *(_QWORD *)(v47 - 8);
  __chkstk_darwin(v47);
  v9 = &v39[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = sub_100004AD8(&qword_10000C170);
  v11 = *(_QWORD *)(v10 - 8);
  v42 = v10;
  v43 = v11;
  __chkstk_darwin(v10);
  v13 = &v39[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = sub_100004AD8(&qword_10000C178);
  v15 = *(_QWORD *)(v14 - 8);
  v49 = v14;
  v50 = v15;
  __chkstk_darwin(v14);
  v41 = &v39[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = sub_100004AD8(&qword_10000C180);
  v18 = *(_QWORD *)(v17 - 8);
  v51 = v17;
  v52 = v18;
  __chkstk_darwin(v17);
  v44 = &v39[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v20 = qword_10000C160;
  v21 = off_10000C168;
  swift_bridgeObjectRetain(off_10000C168);
  v22 = sub_100004AD8(&qword_10000C188);
  v23 = sub_1000052DC(&qword_10000C190, &qword_10000C188, (uint64_t)&protocol conformance descriptor for ControlWidgetButton<A, B, C>);
  StaticControlConfiguration.init(kind:content:)(v20, v21, sub_1000050A8, 0, v22, v23);
  v24 = v7;
  v25 = String.LocalizationValue.init(stringLiteral:)(0x74616C75636C6143, 0xEA0000000000726FLL);
  static Locale.current.getter(v25);
  v40 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v48 = *(_QWORD *)(v48 + 104);
  v26 = v46;
  ((void (*)(_BYTE *))v48)(v46);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v7, 0xD000000000000011, 0x8000000100007030, v4, v26, 0, 0, 256);
  v27 = sub_1000052DC(&qword_10000C198, &qword_10000C170, (uint64_t)&protocol conformance descriptor for StaticControlConfiguration<A>);
  v28 = v42;
  ControlWidgetConfiguration.displayName(_:)(v9, v42, v27);
  v29 = *(void (**)(_BYTE *, uint64_t))(v45 + 8);
  v30 = v47;
  v29(v9, v47);
  (*(void (**)(_BYTE *, uint64_t))(v43 + 8))(v13, v28);
  v31 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000015, 0x8000000100007050);
  static Locale.current.getter(v31);
  ((void (*)(_BYTE *, _QWORD, uint64_t))v48)(v26, v40, v54);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v24, 0xD000000000000011, 0x8000000100007030, v4, v26, 0, 0, 256);
  v55 = v28;
  v56 = v27;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v55, &opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.displayName(_:)>>, 1);
  v33 = v44;
  v34 = v49;
  v35 = v41;
  ControlWidgetConfiguration.description(_:)(v9, v49, OpaqueTypeConformance2);
  v29(v9, v30);
  (*(void (**)(_BYTE *, uint64_t))(v50 + 8))(v35, v34);
  v55 = v34;
  v56 = OpaqueTypeConformance2;
  v36 = swift_getOpaqueTypeConformance2(&v55, &opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.description(_:)>>, 1);
  v37 = v51;
  ControlWidgetConfiguration.showsInSystemSpaces()(v51, v36);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v52 + 8))(v33, v37);
}

uint64_t sub_1000050A8()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v4;

  v4 = sub_1000068F4();
  v0 = sub_100004AD8(&qword_10000C1A0);
  v1 = sub_1000052DC(&qword_10000C1A8, &qword_10000C1A0, (uint64_t)&protocol conformance descriptor for Label<A, B>);
  v2 = sub_10000531C();
  return ControlWidgetButton.init<>(action:label:)(&v4, sub_10000513C, 0, v0, &type metadata for LaunchCalculatorOpenIntent, v1, v2);
}

uint64_t sub_10000513C()
{
  return Label.init(title:icon:)(sub_100005178, 0, sub_100005294, 0, &type metadata for Text, &type metadata for Image, &protocol witness table for Text, &protocol witness table for Image);
}

uint64_t sub_100005178@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t result;
  uint64_t v10;
  char v11;
  uint64_t v12;
  _QWORD v14[3];

  type metadata accessor for Locale(0);
  __chkstk_darwin();
  v3 = (char *)&v14[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin();
  v5 = (char *)&v14[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = String.LocalizationValue.init(stringLiteral:)(0x74616C75636C6143, 0xEA0000000000726FLL);
  static Locale.current.getter(v6);
  v14[0] = String.init(localized:table:bundle:locale:comment:)(v5, 0xD000000000000011, 0x8000000100007030, 0, v3, 0, 0, 256);
  v14[1] = v7;
  v8 = sub_100005360();
  result = Text.init<A>(_:)(v14, &type metadata for String, v8);
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v10;
  *(_BYTE *)(a1 + 16) = v11 & 1;
  *(_QWORD *)(a1 + 24) = v12;
  return result;
}

uint64_t sub_100005294@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = Image.init(_internalSystemName:)(0x74616C75636C6163, 0xEF6C6C69662E726FLL);
  *a1 = result;
  return result;
}

uint64_t sub_1000052DC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100004BA8(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000531C()
{
  unint64_t result;

  result = qword_10000C1B0;
  if (!qword_10000C1B0)
  {
    result = swift_getWitnessTable(&unk_10000752C, &type metadata for LaunchCalculatorOpenIntent);
    atomic_store(result, (unint64_t *)&qword_10000C1B0);
  }
  return result;
}

unint64_t sub_100005360()
{
  unint64_t result;

  result = qword_10000C1B8;
  if (!qword_10000C1B8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10000C1B8);
  }
  return result;
}

uint64_t sub_1000053A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t OpaqueTypeConformance2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v0 = sub_100004BA8(&qword_10000C180);
  v1 = sub_100004BA8(&qword_10000C178);
  v5 = sub_100004BA8(&qword_10000C170);
  v6 = sub_1000052DC(&qword_10000C198, &qword_10000C170, (uint64_t)&protocol conformance descriptor for StaticControlConfiguration<A>);
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.displayName(_:)>>, 1);
  v5 = v1;
  v6 = OpaqueTypeConformance2;
  v3 = swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.description(_:)>>, 1);
  v5 = v0;
  v6 = v3;
  return swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.showsInSystemSpaces()>>, 1);
}

uint64_t sub_100005460()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for Utility()
{
  return objc_opt_self(_TtC16CalculatorWidget7Utility);
}

unint64_t sub_100005490(uint64_t a1)
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
  uint64_t v12;
  unint64_t result;
  char v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;

  v2 = sub_100004AD8(&qword_10000C320);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
  {
    v8 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004AD8(&qword_10000C328);
  v7 = static _DictionaryStorage.allocate(capacity:)(v6);
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v8;
  }
  v10 = v7 + 64;
  v11 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
  v12 = *(_QWORD *)(v3 + 72);
  swift_retain(v7);
  while (1)
  {
    sub_100006CCC(v11, (uint64_t)v5);
    result = sub_100006C80();
    if ((v14 & 1) != 0)
      break;
    v15 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v16 = v8[7];
    v17 = type metadata accessor for DisplayRepresentation(0);
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v16 + *(_QWORD *)(*(_QWORD *)(v17 - 8) + 72) * v15, v5, v17);
    v18 = v8[2];
    v19 = __OFADD__(v18, 1);
    v20 = v18 + 1;
    if (v19)
      goto LABEL_11;
    v8[2] = v20;
    v11 += v12;
    if (!--v9)
    {
      swift_release(v8);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_1000055F8()
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
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  _QWORD v21[2];

  v0 = sub_100004AD8(&qword_10000C300);
  __chkstk_darwin(v0);
  v21[0] = (char *)v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Locale(0);
  __chkstk_darwin(v6);
  v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v9);
  v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_100006C14(v16, static CalculatorAppView.typeDisplayRepresentation);
  sub_100005868(v16, (uint64_t)static CalculatorAppView.typeDisplayRepresentation);
  v17 = String.LocalizationValue.init(stringLiteral:)(0x74616C75636C6143, 0xEA0000000000726FLL);
  static Locale.current.getter(v17);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for LocalizedStringResource.BundleDescription.main(_:), v2);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v11, 0xD000000000000011, 0x8000000100007030, v8, v5, 0, 0, 256);
  v18 = *(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v19 = v21[0];
  v18(v21[0], 1, 1, v12);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v15, v19);
}

uint64_t CalculatorAppView.typeDisplayRepresentation.unsafeMutableAddressor()
{
  uint64_t v0;

  if (qword_10000C120 != -1)
    swift_once(&qword_10000C120, sub_1000055F8);
  v0 = type metadata accessor for TypeDisplayRepresentation(0);
  return sub_100005868(v0, (uint64_t)static CalculatorAppView.typeDisplayRepresentation);
}

uint64_t sub_100005868(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t static CalculatorAppView.typeDisplayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10000C120 != -1)
    swift_once(&qword_10000C120, sub_1000055F8);
  v2 = type metadata accessor for TypeDisplayRepresentation(0);
  v3 = sub_100005868(v2, (uint64_t)static CalculatorAppView.typeDisplayRepresentation);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

unint64_t sub_1000058F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t, uint64_t);
  char *v23;
  uint64_t v24;
  char *v25;
  unint64_t result;
  uint64_t v27;
  char *v28;
  char *v29;

  v0 = sub_100004AD8(&qword_10000C310);
  __chkstk_darwin(v0);
  v29 = (char *)&v27 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_100004AD8(&qword_10000C300);
  __chkstk_darwin(v2);
  v28 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Locale(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v11);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for LocalizedStringResource(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_100004AD8(&qword_10000C318);
  v19 = *(_QWORD *)(sub_100004AD8(&qword_10000C320) - 8);
  v20 = swift_allocObject(v18, ((*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80))+ *(_QWORD *)(v19 + 72), *(unsigned __int8 *)(v19 + 80) | 7);
  *(_OWORD *)(v20 + 16) = xmmword_100007280;
  v21 = String.LocalizationValue.init(stringLiteral:)(0x74616C75636C6143, 0xEA0000000000726FLL);
  static Locale.current.getter(v21);
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, enum case for LocalizedStringResource.BundleDescription.main(_:), v4);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v13, 0xD000000000000011, 0x8000000100007030, v10, v7, "Title for the Calculator App entity for AppIntents", 50, 2);
  v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v23 = v28;
  v22(v28, 1, 1, v14);
  v24 = type metadata accessor for DisplayRepresentation.Image(0);
  v25 = v29;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v29, 1, 1, v24);
  DisplayRepresentation.init(title:subtitle:image:)(v17, v23, v25);
  result = sub_100005490(v20);
  static CalculatorAppView.caseDisplayRepresentations = result;
  return result;
}

uint64_t *CalculatorAppView.caseDisplayRepresentations.unsafeMutableAddressor()
{
  if (qword_10000C128 != -1)
    swift_once(&qword_10000C128, sub_1000058F0);
  return &static CalculatorAppView.caseDisplayRepresentations;
}

uint64_t static CalculatorAppView.caseDisplayRepresentations.getter()
{
  if (qword_10000C128 != -1)
    swift_once(&qword_10000C128, sub_1000058F0);
  return swift_bridgeObjectRetain(static CalculatorAppView.caseDisplayRepresentations);
}

BOOL CalculatorAppView.init(rawValue:)(Swift::String string)
{
  void *object;
  Swift::String v2;
  Swift::Int v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100008358, v2);
  swift_bridgeObjectRelease(object);
  return v3 != 0;
}

_UNKNOWN **static CalculatorAppView.allCases.getter()
{
  return &off_100008390;
}

uint64_t CalculatorAppView.rawValue.getter()
{
  return 7368801;
}

uint64_t sub_100005C9C()
{
  return 1;
}

uint64_t sub_100005CA4@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::String v3;
  void *v4;
  Swift::Int v5;
  uint64_t result;

  v3._countAndFlagsBits = *a1;
  v4 = (void *)a1[1];
  v3._object = v4;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000083B8, v3);
  result = swift_bridgeObjectRelease(v4);
  *a2 = v5 != 0;
  return result;
}

void sub_100005CF4(_QWORD *a1@<X8>)
{
  *a1 = 7368801;
  a1[1] = 0xE300000000000000;
}

unint64_t sub_100005D0C()
{
  unint64_t result;

  result = qword_10000C260;
  if (!qword_10000C260)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CalculatorAppView, &type metadata for CalculatorAppView);
    atomic_store(result, (unint64_t *)&qword_10000C260);
  }
  return result;
}

Swift::Int sub_100005D50()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  String.hash(into:)(v1, 7368801, 0xE300000000000000);
  return Hasher._finalize()();
}

uint64_t sub_100005D98(uint64_t a1)
{
  return String.hash(into:)(a1, 7368801, 0xE300000000000000);
}

Swift::Int sub_100005DA8(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  String.hash(into:)(v2, 7368801, 0xE300000000000000);
  return Hasher._finalize()();
}

unint64_t sub_100005DF0()
{
  unint64_t result;

  result = qword_10000C268;
  if (!qword_10000C268)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CalculatorAppView, &type metadata for CalculatorAppView);
    atomic_store(result, (unint64_t *)&qword_10000C268);
  }
  return result;
}

unint64_t sub_100005E38()
{
  unint64_t result;

  result = qword_10000C270;
  if (!qword_10000C270)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CalculatorAppView, &type metadata for CalculatorAppView);
    atomic_store(result, (unint64_t *)&qword_10000C270);
  }
  return result;
}

unint64_t sub_100005E80()
{
  unint64_t result;

  result = qword_10000C278;
  if (!qword_10000C278)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CalculatorAppView, &type metadata for CalculatorAppView);
    atomic_store(result, (unint64_t *)&qword_10000C278);
  }
  return result;
}

void *sub_100005EC4()
{
  return &protocol witness table for String;
}

unint64_t sub_100005ED4()
{
  unint64_t result;

  result = qword_10000C280;
  if (!qword_10000C280)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CalculatorAppView, &type metadata for CalculatorAppView);
    atomic_store(result, (unint64_t *)&qword_10000C280);
  }
  return result;
}

unint64_t sub_100005F1C()
{
  unint64_t result;

  result = qword_10000C288;
  if (!qword_10000C288)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CalculatorAppView, &type metadata for CalculatorAppView);
    atomic_store(result, (unint64_t *)&qword_10000C288);
  }
  return result;
}

unint64_t sub_100005F64()
{
  unint64_t result;

  result = qword_10000C290;
  if (!qword_10000C290)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CalculatorAppView, &type metadata for CalculatorAppView);
    atomic_store(result, (unint64_t *)&qword_10000C290);
  }
  return result;
}

unint64_t sub_100005FAC()
{
  unint64_t result;

  result = qword_10000C298;
  if (!qword_10000C298)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CalculatorAppView, &type metadata for CalculatorAppView);
    atomic_store(result, (unint64_t *)&qword_10000C298);
  }
  return result;
}

uint64_t sub_100005FF4@<X0>(uint64_t a1@<X8>)
{
  return sub_100006678(&qword_10000C120, (uint64_t (*)(_QWORD))&type metadata accessor for TypeDisplayRepresentation, (uint64_t)static CalculatorAppView.typeDisplayRepresentation, (uint64_t)sub_1000055F8, a1);
}

uint64_t sub_100006018(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000065F0(a1, a2, a3, (uint64_t (*)(void))sub_10000602C, (uint64_t)&opaque type descriptor for <<opaque return type of static AppEnum.defaultResolverSpecification>>);
}

unint64_t sub_10000602C()
{
  unint64_t result;

  result = qword_10000C2A0;
  if (!qword_10000C2A0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CalculatorAppView, &type metadata for CalculatorAppView);
    atomic_store(result, (unint64_t *)&qword_10000C2A0);
  }
  return result;
}

uint64_t sub_100006070(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000602C();
  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_1000060AC()
{
  unint64_t result;

  result = qword_10000C2A8;
  if (!qword_10000C2A8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CalculatorAppView, &type metadata for CalculatorAppView);
    atomic_store(result, (unint64_t *)&qword_10000C2A8);
  }
  return result;
}

unint64_t sub_1000060F4()
{
  unint64_t result;

  result = qword_10000C2B0;
  if (!qword_10000C2B0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CalculatorAppView, &type metadata for CalculatorAppView);
    atomic_store(result, (unint64_t *)&qword_10000C2B0);
  }
  return result;
}

unint64_t sub_10000613C()
{
  unint64_t result;

  result = qword_10000C2B8;
  if (!qword_10000C2B8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CalculatorAppView, &type metadata for CalculatorAppView);
    atomic_store(result, (unint64_t *)&qword_10000C2B8);
  }
  return result;
}

uint64_t sub_100006180(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100005FAC();
  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_1000061BC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000C2C0;
  if (!qword_10000C2C0)
  {
    v1 = sub_100004BA8(&qword_10000C2C8);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10000C2C0);
  }
  return result;
}

void sub_100006208(_QWORD *a1@<X8>)
{
  *a1 = &off_1000083F0;
}

unint64_t sub_10000621C()
{
  unint64_t result;

  result = qword_10000C2D0;
  if (!qword_10000C2D0)
  {
    result = swift_getWitnessTable(&unk_10000757C, &type metadata for LaunchCalculatorOpenIntent);
    atomic_store(result, (unint64_t *)&qword_10000C2D0);
  }
  return result;
}

uint64_t sub_100006260()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[16];

  v0 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = &v13[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = type metadata accessor for Locale(0);
  __chkstk_darwin(v4);
  v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v7);
  v9 = &v13[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for LocalizedStringResource(0);
  sub_100006C14(v10, qword_10000CD70);
  sub_100005868(v10, (uint64_t)qword_10000CD70);
  v11 = String.LocalizationValue.init(stringLiteral:)(0x74616C75636C6143, 0xEA0000000000726FLL);
  static Locale.current.getter(v11);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)(v9, 0xD000000000000011, 0x8000000100007030, v6, v3, 0, 0, 256);
}

uint64_t sub_1000063E0()
{
  uint64_t v0;
  uint64_t v1;

  v0 = type metadata accessor for IntentAuthenticationPolicy(0);
  sub_100006C14(v0, qword_10000CD88);
  v1 = sub_100005868(v0, (uint64_t)qword_10000CD88);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v0 - 8) + 104))(v1, enum case for IntentAuthenticationPolicy.alwaysAllowed(_:), v0);
}

uint64_t sub_100006438()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_100006458()
{
  return IntentParameter.wrappedValue.setter();
}

void (*sub_100006478(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_1000064C0;
}

void sub_1000064C0(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

unint64_t sub_1000064F4()
{
  unint64_t result;

  result = qword_10000C2D8;
  if (!qword_10000C2D8)
  {
    result = swift_getWitnessTable(&unk_1000075A4, &type metadata for LaunchCalculatorOpenIntent);
    atomic_store(result, (unint64_t *)&qword_10000C2D8);
  }
  return result;
}

unint64_t sub_10000653C()
{
  unint64_t result;

  result = qword_10000C2E0;
  if (!qword_10000C2E0)
  {
    result = swift_getWitnessTable(&unk_100007634, &type metadata for LaunchCalculatorOpenIntent);
    atomic_store(result, (unint64_t *)&qword_10000C2E0);
  }
  return result;
}

unint64_t sub_100006584()
{
  unint64_t result;

  result = qword_10000C2E8;
  if (!qword_10000C2E8)
  {
    result = swift_getWitnessTable(&unk_10000765C, &type metadata for LaunchCalculatorOpenIntent);
    atomic_store(result, (unint64_t *)&qword_10000C2E8);
  }
  return result;
}

uint64_t sub_1000065C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000065F0(a1, a2, a3, (uint64_t (*)(void))sub_10000531C, (uint64_t)&opaque type descriptor for <<opaque return type of OpenIntent.perform()>>);
}

uint64_t sub_1000065DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000065F0(a1, a2, a3, (uint64_t (*)(void))sub_1000064F4, (uint64_t)&opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>);
}

uint64_t sub_1000065F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t a5)
{
  _QWORD v7[2];

  v7[0] = a2;
  v7[1] = a4();
  return swift_getOpaqueTypeConformance2(v7, a5, 1);
}

uint64_t sub_100006630@<X0>(uint64_t a1@<X8>)
{
  return sub_100006678(&qword_10000C130, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10000CD70, (uint64_t)sub_100006260, a1);
}

uint64_t sub_100006654@<X0>(uint64_t a1@<X8>)
{
  return sub_100006678(&qword_10000C138, (uint64_t (*)(_QWORD))&type metadata accessor for IntentAuthenticationPolicy, (uint64_t)qword_10000CD88, (uint64_t)sub_1000063E0, a1);
}

uint64_t sub_100006678@<X0>(_QWORD *a1@<X2>, uint64_t (*a2)(_QWORD)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;

  if (*a1 != -1)
    swift_once(a1, a4);
  v8 = a2(0);
  v9 = sub_100005868(v8, a3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a5, v9, v8);
}

uint64_t sub_1000066F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to OpenIntent.perform()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_10000531C();
  *v5 = v2;
  v5[1] = sub_100006760;
  return OpenIntent.perform()(a1, a2, v6);
}

uint64_t sub_100006760()
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

uint64_t sub_1000067A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1000068F4();
  *a1 = result;
  return result;
}

unint64_t sub_1000067CC()
{
  return 0xD00000000000001ALL;
}

uint64_t getEnumTagSinglePayload for CalculatorAppView(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for CalculatorAppView(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_100006880 + 4 * byte_100007290[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1000068A0 + 4 * byte_100007295[v4]))();
}

_BYTE *sub_100006880(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1000068A0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1000068A8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1000068B0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1000068B8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1000068C0(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_1000068CC()
{
  return 0;
}

ValueMetadata *type metadata accessor for CalculatorAppView()
{
  return &type metadata for CalculatorAppView;
}

ValueMetadata *type metadata accessor for LaunchCalculatorOpenIntent()
{
  return &type metadata for LaunchCalculatorOpenIntent;
}

uint64_t sub_1000068F4()
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
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t, uint64_t);
  char *v26;
  char *v27;
  unint64_t v28;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char v35[2];

  v0 = type metadata accessor for InputConnectionBehavior(0);
  v33 = *(_QWORD *)(v0 - 8);
  v34 = v0;
  ((void (*)(void))__chkstk_darwin)();
  v32 = (char *)&v30 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004AD8(&qword_10000C2F8);
  v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  v31 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  v5 = (char *)&v30 - v4;
  v6 = sub_100004AD8(&qword_10000C300);
  __chkstk_darwin(v6);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for Locale(0);
  __chkstk_darwin(v13);
  v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v16);
  v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for LocalizedStringResource(0);
  v20 = *(_QWORD *)(v19 - 8);
  __chkstk_darwin(v19);
  v22 = (char *)&v30 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = sub_100004AD8(&qword_10000C308);
  v23 = String.LocalizationValue.init(stringLiteral:)(0x74616C75636C6143, 0xEA0000000000726FLL);
  static Locale.current.getter(v23);
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, enum case for LocalizedStringResource.BundleDescription.main(_:), v9);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v18, 0xD000000000000011, 0x8000000100007030, v15, v12, "Title for the Calculator App entity for AppIntents", 50, 2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56))(v8, 1, 1, v19);
  v35[0] = 0;
  v24 = type metadata accessor for IntentDialog(0);
  v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56);
  v25(v5, 1, 1, v24);
  v26 = v31;
  v25(v31, 1, 1, v24);
  v27 = v32;
  (*(void (**)(char *, _QWORD, uint64_t))(v33 + 104))(v32, enum case for InputConnectionBehavior.default(_:), v34);
  v28 = sub_10000602C();
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)(v22, v8, v35, v5, v26, v27, &off_100008330, v28);
}

uint64_t *sub_100006C14(uint64_t a1, uint64_t *a2)
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

uint64_t sub_100006C54(uint64_t a1)
{
  uint64_t v1;

  return a1 & ~(-1 << *(_BYTE *)(v1 + 32));
}

uint64_t sub_100006C80()
{
  uint64_t v0;
  Swift::Int v1;
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, *(_QWORD *)(v0 + 40));
  String.hash(into:)(v3, 7368801, 0xE300000000000000);
  v1 = Hasher._finalize()();
  return sub_100006C54(v1);
}

uint64_t sub_100006CCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100004AD8(&qword_10000C320);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC16CalculatorWidgetP33_3BBF1EEB67FB8B193E63B4FB6393687D19ResourceBundleClass);
}
